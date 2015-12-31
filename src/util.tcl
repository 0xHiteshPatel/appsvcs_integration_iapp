# Print a timestamped debug message to /var/tmp/scriptd.out
# Input: string
proc debug { string } {
  set systemTime [clock seconds]
  puts "\[[clock format $systemTime -format %D]\]\[[clock format $systemTime -format %H:%M:%S]\]\[$::app\] $string"
}

# Figure out which type of environment we are executing in.
# Return: list $mode $folder $partition $routedomainid $newdeploy
# Modes: 1 = Standalone
#        2 = BIG-IQ Cloud
#        3 = Cisco APIC
#        4 = VMware NSX
proc get_mode { } {
  set folder [tmsh::pwd]
  set app $tmsh::app_name
  set partition [lindex [split $folder /] 1]
  set newdeploy [catch {tmsh::get_config sys application service /$partition/$app.app/$app}]
  debug "\[get_mode\] starting folder=$folder partition=$partition newdeploy=$newdeploy"

  # Set the routedomain to the partition default-route-domain
  if { [string tolower $::iapp__routeDomain] eq "auto"} {
    set obj [tmsh::get_config auth partition $partition default-route-domain]
    set routedomainid [tmsh::get_field_value [lindex $obj 0] default-route-domain]
    debug "\[get_mode\]\[set_route_domain\] Using partition default-route-domain; routedomainid=$routedomainid"
  } else { 
    set routedomainid $::iapp__routeDomain
    debug "\[get_mode\]\[set_route_domain\] Using route domain override; routedomainid=$routedomainid"
  }

  # Check for a mode override in $iapp__mode variable
  if { [string tolower $::iapp__mode] ne "auto" } {
    if { $::iapp__mode > 0 && $::iapp__mode < 4 } {
      debug "\[get_mode\]\[mode_override\] Mode override detected.  Setting mode to $::iapp__mode"
      return [list $::iapp__mode $folder $partition $routedomainid $newdeploy]
    } else {
      error "The mode override specified is invalid."
    }
  }
  
  # Check for a partition that starts with apic_ and return APIC mode (3) and RD if found
  if { [string match -nocase "apic_*" $partition] } {
    debug "\[get_mode\]\[apic\] partition starts with apic_, assuming APIC deployment mode (3)"
    set rdobjs [tmsh::get_config net route-domain "/$partition/$partition" id]
    set routedomainid [tmsh::get_field_value [lindex $rdobjs 0] "id"]
    debug "\[get_mode\]\[apic\] rdobjs=$rdobjs routedomainid=$routedomainid"
    return [list 3 $folder $partition $routedomainid $newdeploy]
  }

  # Check for an $app name that is formatted like this:
  # edge-<#>_<#>_virtualserver-<#>-serviceprofile-<#>
  # and return NSX mode (4) 
  if { [regexp -nocase {^edge-[0-9]+_[0-9]+_virtualserver-[0-9]+-serviceprofile-[0-9]+$} $::app] } {
    debug "\[get_mode\]\[nsx\] app name matches NSX regexp, assuming NSX deployment mode (4)"
    return [list 4 $folder $partition $routedomainid $newdeploy]    
  }

  # If we get here we can safely assume that this is either a Standalone or BIG-IQ Cloud mode deployment
  # The only way we currently have to check for BIG-IQ Cloud mode is to see if app_stats was sent
  if { [info exists ::app_stats] } {
    debug "\[get_mode\]\[bigiq\] all other modes checked for and app_stats set, assuming BIG-IQ Cloud deployment mode (2)"
    return [list 2 $folder $partition $routedomainid $newdeploy]
  }

  # Default is Standalone mode
  debug "\[get_mode\]\[standalone\] no integration vendor found, assuming Standalone deployment mode (1)"    
  return [list 1 $folder $partition $routedomainid $newdeploy]
}

# Create a specfic option command and return it
# Input: $debug_id, $input_var, $option_string
# Return: string $cmd
proc generic_add_option { debug_id input_var option_string custom_format replace_commas } {
  set cmd " "
  if { [string length $input_var] > 0 } {
      if { $replace_commas == 1 } {
        set input_var [string map {"," " "} $input_var]
      }

      if { [string length $custom_format] > 0 } {
        set cmd [format $custom_format $input_var]
      } else {
        set cmd [format " $option_string \"%s\"" $input_var]
      }
      debug [format "\[%s\]\[generic_add_option\] cmd=%s" $debug_id $cmd]
  }
  return $cmd
}

# Check to see if an ip has a routedomain included.
# Return: 0=false; 1=true
proc has_routedomain { ip } {
  return [string match *%* $ip]
}

# Replace a profile within a virtual server definition while preserving the existing context
# Input: $obj = tmsh obj representing profiles section of the VS get_config
#        $oldprofile = name of the profile to replace
#        $newprofile = name of the new profile
# Return: string $newprofiles (string suitable for providing to replace-all-with option)
proc replace_profile { obj oldprofile newprofile } {
  #set vsobj [tmsh::get_config ltm virtual /Common/nagle.app/my_virtualserver profiles]
  set profiles [tmsh::get_field_value [lindex $obj 0] "profiles"]
  set newprofiles " { "
  foreach profile $profiles {
      set junk [lindex $profile 0]
      set name [lindex $profile 1]
      set contextobj [lindex $profile 2]
      set context [lindex $contextobj 1]
      #debug [format "\[replace_profile\] found profile name=$name context=$context" $name $context]
      if { $name eq $oldprofile } {
          debug [format "\[replace_profile\] replace profile '%s' with '%s' context=%s" $name $newprofile $context]
          append newprofiles [format "%s { context %s } " $newprofile $context]
      } else {
          debug [format "\[replace_profile\] preserve profile '%s' context=%s" $name $context]
          append newprofiles [format "%s { context %s } " $name $context]
      }
  }
  append newprofiles " } "
  return $newprofiles
}

# Look at a tmsh profile object and determine if $option is a valid profile option
# Input: $obj = tmsh obj to check
#        $option = option name to look for
# Return: 1=Valid option; 0=Invalid option
proc is_valid_profile_option { obj option } {
    #debug [format "\[is_valid_profile_option\] looking for %s" $option]
    set found 0
    set fdx 0
    set fields [tmsh::get_field_names value $obj]
    set field_count [llength $fields]
    while { $fdx < $field_count } {
        set field [lindex $fields $fdx]
        if { $field == $option } {
          #debug [format "\[is_valid_profile_option\]  found %s" $option]
          set found 1
        }
        incr fdx
    }
    return $found
}

# Process a string in the format key1=val1[;keyX=valX] and return an array 
# Input: $string = string to process
# Return: array { key1 {val1} ... keyX{valX}}
proc process_kvp_string { string } {
  #debug "\[process_kvp_string\] processing string: $string"
  set pairs [split $string \;]
  array set ret {}
  foreach pair $pairs {
    set key [lindex [split $pair =] 0]
    set val [lindex [split $pair =] 1]
    set ret($key) $val
    #debug "\[process_kvp_string\] pair=$pair key=$key val=$val"
  }
  return [array get ret]
}

# Create an object name
# Input: $append = string to append
# Return: $string
proc create_obj_name { append } {
  return [format "%s/%s_%s" $::app_path $::app $append]
}

# Safely change a variable to a new value.  Updates the var value and modifies the ASO with the new value
# Input: $name = name of variable
#       $value = new value of the variable
# Return: none
proc change_var { name value } {
  if { $::mode != 1 } {
    return ""
  }
  debug "\[change_var\] updating variable $name to $value"
  set varcmd [format "sys application service %s/%s variables modify \{ %s \{ value \"%s\" \} \}" $::app_path $::app $name $value]
  tmsh::modify $varcmd
  set [subst ::$name] $value
  return
}

# Check to see if an incoming variable is different than whats stored in the ASO.
# Input: $name = name of variable
# Return: 1=value is different; 0=value not different OR not a redeploy
proc is_new_value { name } {
  if { $::mode != 1 } {
    return 0
  }
  
  if { $::newdeploy } {
    return 0
  }
  set varvalue [get_var $name]
  debug "\[is_new_value\] name=$name asovalue=$varvalue varvalue=[set [subst ::$name]]"
  if { [set [subst ::$name]] == $varvalue } {
    return 0
  } 
  return 1
}

# Get the variable value in the ASO.
# Input: $name = name of variable
# Return: $string = value of variable
proc get_var { name } {
  if { $::mode != 1 || $::newdeploy == 1} {
    return ""
  }

  set varcmd [format "sys application service %s/%s variables \{ %s \{ value \} \}" $::app_path $::app $name]
  set varobj [tmsh::get_config $varcmd]
  set varvalue [lindex [lindex [lindex [lindex [lindex $varobj 0] 4] 1] 1] 1]
  debug "\[get_var\] name=$name value=$varvalue"
  return $varvalue
}

# Safely handle the removal of a virtual server option on redeployment
# Input: $name = name of variable    
#        $checkvalue = the string that disables the option
#        $option = TMSH name of the option
#        $module = the BIG-IP module that enables the option
# Return: 1=Option removed; 0=no action taken
proc handle_opt_remove_on_redeploy { name checkvalue option module } {
  if { ! [is_provisioned $module] } {
    debug "\[handle_opt_remove_on_redeploy\] $name, $module not provisioned, skipping"
    return 0
  }

  set vsobj [lindex [tmsh::get_config ltm virtual $::app_path/$::vs__Name all-properties] 0]
  if { [is_valid_profile_option $vsobj $option] == 0 } {
    debug "\[handle_opt_remove_on_redeploy\] $name, $option not available, skipping"
    return 0
  }

  if { [set [subst ::$name]] == $checkvalue && \
       [is_new_value $name] && \
       $::redeploy } {
        debug "\[handle_opt_remove_on_redeploy\] $name $checkvalue on redeploy, setting $option to none"
        set cmd [format "ltm virtual %s/%s %s none" $::app_path $::vs__Name $option]
        debug "\[handle_opt_remove_on_redeploy\] TMSH MODIFY: $cmd"
        tmsh::modify $cmd
        return 1
  }
  return 0
}

# Check whether a specified module is provisioned and at what levels
# Adapted from original code including the F5 iApp TCL helper library
# Input: $module = name of the module
# Output: $level = integer representation of the provisioning level.  See levels array below
proc is_provisioned { module } {
  array set levels {
    none      0
    minimum   1
    nominal   2
    dedicated 3
  }

  set obj [tmsh::get_config sys provision $module]
  if { [catch {
      set level [tmsh::get_field_value [lindex $obj 0] level]
  }]} { set level none }

  return [expr { $levels($level) >= 1 }]
}

# Consume an APL table and return a list containing the values of the var specified in $key
# Input: $table = the raw APL table
#        $key = the name of the variable to add to the return list
# Output: $retlist = A list of strings 
proc single_column_table_to_list { table key } {
  set retlist {}
  foreach row $table {
    #debug "row=$row"
    array unset column

    # extract the iApp table data - borrowed from f5.lbaas.tmpl
    foreach column_data [lrange [split [join $row] "\n"] 1 end-1] {
      set name [lindex $column_data 0]
      set column($name) [lrange $column_data 1 end]
      #debug " col=$name val=$column($name)"
    }
    if { [info exists column($key)] && [string length $column($key)] > 0 } {
      lappend retlist "$column($key)"
      #debug "  lappend $column($key)"
    }
    
  }
  return $retlist
}

# Process a string in the format <option>=<value>[;<option2>=<value2>] and return a 
# properly formatted TMSH string.  If $tmsh is specified than options will be verified
# using the object in $template.  This works for things like profiles, but not virtual 
# servers.  Specifying no value for $tmsh turns off checking
# Input: $option_str = string to process
#        $tmsh = the portion of the tmsh command get a list of all-properties
#        $template = the object name to use as a list of available options
proc process_options_string { option_str tmsh template } {
  debug "\[process_options_string\] processing string $option_str"
  set ret ""

  # Get all the options passed in array format
  array set options [process_kvp_string $option_str]

  # Get the supported options for a profile type according to the 'default' key in the create_supported array
  foreach {option value} [array get options] {
    if { [string length $tmsh] > 0 } {
      set profileobj [lindex [tmsh::get_config ltm $tmsh $template all-properties] 0]
      if { [is_valid_profile_option $profileobj $option] == 0 } {
        error "The option \"$option\" for $tmsh is not valid"
      }
    }

    append ret [format "%s \"%s\" " $option $value]
  }
  array unset options
  debug "\[process_options_string\] returning \"$ret\""
  return $ret
}
