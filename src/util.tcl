# Print a timestamped debug message to /var/tmp/scriptd.out
# Input: headers = TCL list of headers for the log message
#        msg = The message to log
#        level = Integer indicated the log level for this message
proc debug { headers msg level } {
  if { $::iapp__logLevel >= $level } {
    set systemTime [clock seconds]
    set brackets ""
    if { [llength $headers] > 0 } {
      set brackets [format "\[%s\]" [join $headers "\]\["]]
    }
    set pre [format "\[%s %s\]\[%s\]%s" [clock format $systemTime -format %D] [clock format $systemTime -format %H:%M:%S] $::app $brackets]
    puts [format "%s %s" $pre [string map [list "\n" "\n$pre " ] $msg]]
  }
}

# Credit for psplit: http://wiki.tcl.tk/1499
# Perform the equivalent of a split on a string except protect an escaped split character in the input
# Input: str = the string to split
#        seps = the charater(s) to split by
# Return: list $strings
proc psplit { str seps {protector "\\"}} {
    set out [list]
    set prev ""
    set current ""
    foreach c [split $str ""] {
        if { [string first $c $seps] >= 0 } {
            if { $prev eq $protector } {
                set current [string range $current 0 end-1]
                append current $c
            } else {
                lappend out $current
                set current ""
            }
            set prev ""
        } else {
            append current $c
            set prev $c
        }
    }
    
    if { $current ne "" } {
        lappend out $current
    }

    return $out
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
  debug [list get_mode] [format "starting folder=%s partition=%s newdeploy=%s" $folder $partition $newdeploy] 10

  if { ! $newdeploy } {
    set ::asoobj [lindex [lindex [tmsh::get_config sys application service /$partition/$app.app/$app] 0] 4]
  }
  # Set the routedomain to the partition default-route-domain
  if { [string tolower $::iapp__routeDomain] eq "auto"} {
    set obj [tmsh::get_config auth partition $partition default-route-domain]
    set routedomainid [tmsh::get_field_value [lindex $obj 0] default-route-domain]
    debug [list get_mode set_route_domain] [format "Using partition default-route-domain; routedomainid=%s" $routedomainid] 10
  } else { 
    set routedomainid $::iapp__routeDomain
    debug [list get_mode set_route_domain] [format "Using route domain override; routedomainid=%s" $routedomainid] 10
  }

  # Check for a mode override in $iapp__mode variable
  if { [string tolower $::iapp__mode] ne "auto" } {
    if { $::iapp__mode > 0 && $::iapp__mode < 4 } {
      debug [list get_mode mode_override] [format "Mode override detected.  Setting mode to %s" $::iapp__mode] 10
      return [list $::iapp__mode $folder $partition $routedomainid $newdeploy]
    } else {
      error "The mode override specified is invalid."
    }
  }
  
  # Check for a partition that starts with apic_ and return APIC mode (3) and RD if found
  if { [string match -nocase "apic_*" $partition] } {
    debug [list get_mode apic] "partition starts with apic_, assuming APIC deployment mode (3)" 10
    set rdobjs [tmsh::get_config net route-domain "/$partition/$partition" id]
    set routedomainid [tmsh::get_field_value [lindex $rdobjs 0] "id"]
    debug [list get_mode apic] [format "rdobjs=%s routedomainid=%s" $rdobjs $routedomainid] 10
    return [list 3 $folder $partition $routedomainid $newdeploy]
  }

  # Check for an $app name that is formatted like this:
  # edge-<#>_<#>_virtualserver-<#>-serviceprofile-<#>
  # and return NSX mode (4) 
  if { [regexp -nocase {^edge-[0-9]+_[0-9]+_virtualserver-[0-9]+-serviceprofile-[0-9]+$} $::app] } {
    debug [list get_mode nsx] "app name matches NSX regexp, assuming NSX deployment mode (4)" 10
    return [list 4 $folder $partition $routedomainid $newdeploy]    
  }

  # If we get here we can safely assume that this is either a Standalone or BIG-IQ Cloud mode deployment
  # The only way we currently have to check for BIG-IQ Cloud mode is to see if app_stats was sent
  if { [info exists ::app_stats] } {
    debug [list get_mode bigiq] "all other modes checked for and app_stats set, assuming BIG-IQ Cloud deployment mode (2)" 10
    return [list 2 $folder $partition $routedomainid $newdeploy]
  }

  # Default is Standalone mode
  debug [list get_mode standalone] "no integration vendor found, assuming Standalone deployment mode (1)" 10
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
      debug [lappend debug_id generic_add_option] [format "cmd=%s" $cmd] 10
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
  set profiles [tmsh::get_field_value [lindex $obj 0] "profiles"]
  set newprofiles " { "
  foreach profile $profiles {
      set junk [lindex $profile 0]
      set name [lindex $profile 1]
      set contextobj [lindex $profile 2]
      set context [lindex $contextobj 1]
      #debug [format "\[replace_profile\] found profile name=$name context=$context" $name $context]
      if { $name eq $oldprofile } {
          debug [list replace_profile] [format "replace profile '%s' with '%s' context=%s" $name $newprofile $context] 10
          append newprofiles [format "%s { context %s } " $newprofile $context]
      } else {
          debug [list replace_profile] [format "preserve profile '%s' context=%s" $name $context] 10
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
  debug [list process_kvp_string] "processing string: $string" 10
  set pairs [psplit $string ";"]
  array set ret {}
  foreach pair $pairs {
    set key [lindex [split $pair =] 0]
    set val [lindex [split $pair =] 1]
    set ret($key) $val
    debug [list process_kvp_string] "pair=$pair key=$key val=$val" 10
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
  debug [list change_var] "updating variable $name to $value (executes post-deployment)" 10
  set varcmd [create_escaped_tmsh [format "tmsh::modify sys application service %s/%s variables modify \{ %s \{ value \"%s\" \} \}" $::app_path $::app $name $value]]
  debug [list change_var tmsh_modify_deferred] $varcmd 1
  lappend ::postfinal_deferred_cmds $varcmd  
  set [subst ::$name] $value
  set ::aso_config($name) $value
  return
}

# Check to see if an incoming variable is different than whats stored in the ASO.
# Input: $name = name of variable
# Return: 1=value is different; 0=value not different OR not a redeploy
proc is_new_value { name } {
  if { $::newdeploy } {
    return 0
  }
  set varvalue [get_var $name]
  debug [list is_new_value] [format "name=%s asovalue=%s varvalue=%s" $name $varvalue [set [subst ::$name]]] 10
  if { [set [subst ::$name]] == $varvalue } {
    return 0
  } 
  return 1
}

# Get the variable value in the ASO.
# Input: $name = name of variable
#        $orig = return the original value, not the runtime updated one
# Return: $string = value of variable
proc get_var { name { orig 0 }} {
  if { $::newdeploy == 1} {
    return ""
  }
  debug [list get_var] [format "start name=%s" $name] 10
   
  if { $orig == 0 && [info exists ::aso_config($name)] } {
    set varvalue $::aso_config($name)
    debug [list get_var] [format "name=%s value=%s" $name $varvalue] 10
    return $varvalue
  } 

  if { $orig == 1 && [info exists ::aso_config_orig($name)] } {
    set varvalue $::aso_config_orig($name)
    debug [list get_var original] [format "name=%s value=%s" $name $varvalue] 10
    return $varvalue
  } 
  return ""
}

# Safely handle the removal of a virtual server option on redeployment
# Input: $name = name of variable    
#        $checkvalue = the string that disables the option
#        $option = TMSH name of the option
#        $module = the BIG-IP module that enables the option
# Return: 1=Option removed; 0=no action taken
proc handle_opt_remove_on_redeploy { name checkvalue option module } {
  if { ! $::redeploy } {
    debug [list handle_opt_remove_on_redeploy $name] "not a redeployment, skipping" 10
    return 0
  }
  
  if { ! [is_provisioned $module] } {
    debug [list handle_opt_remove_on_redeploy $name] [format "%s not provisioned, skipping" $module] 10
    return 0
  }

  set vsname [get_var vs__Name 1]
  set vsobj [lindex [tmsh::get_config ltm virtual $::app_path/$vsname all-properties] 0]
  if { [is_valid_profile_option $vsobj $option] == 0 } {
    debug [list handle_opt_remove_on_redeploy $name] [format "%s not available, skipping" $option] 10
    return 0
  }

  if { [set [subst ::$name]] == $checkvalue && \
       [is_new_value $name] && \
       $::redeploy } {
        debug [list handle_opt_remove_on_redeploy] [format "%s %s on redeploy, setting %s to none" $name $checkvalue $option] 10
        set cmd [format "ltm virtual %s/%s %s none" $::app_path $vsname $option]
        debug [list handle_opt_remove_on_redeploy tmsh_modify] $cmd 1
        tmsh::modify $cmd
        return 1
  }
  return 0
}

# Check provisioning cache for whether a specified module is provisioned and at what levels
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

  if { [info exists ::__provision_cache($module)] } {
    debug [list is_provisioned cache_hit] "$module $::__provision_cache($module)" 10
    return [expr { $levels($::__provision_cache($module)) >= 1 }]
  } else {
    debug [list is_provisioned cache_miss] "$module" 10
    return -1
  }
}

# Load provisioning cache with module provisioning levels
# Adapted from original code including the F5 iApp TCL helper library
proc load_provisioned { } {
  array set levels {
    none      0
    minimum   1
    nominal   2
    dedicated 3
  }
  set obj [tmsh::get_config sys provision]
  foreach mod $obj {
    set modname [lindex $mod 2]
    set modlevel [lindex $mod 3]
    if { [llength $modlevel] == 2 } {
      set modlevel [lindex $modlevel 1]
    } else {
      set modlevel none
    }
    set ::__provision_cache($modname) $modlevel
    debug [list load_provisioned cache_set] "$modname $modlevel" 10
  }  
}

# Consume an APL table and return a list containing the values of the var specified in $key
# Input: $table = the raw APL table
#        $key = the name of the variable to add to the return list
# Output: $retlist = A list of strings 
proc single_column_table_to_list { table key } {
  set retlist {}
  foreach row $table {
    array unset column

    # extract the iApp table data - borrowed from f5.lbaas.tmpl
    foreach column_data [lrange [split [join $row] "\n"] 1 end-1] {
      set name [lindex $column_data 0]
      set column($name) [lrange $column_data 1 end]
    }
    if { [info exists column($key)] && [string length $column($key)] > 0 } {
      lappend retlist "$column($key)"
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
  debug [list process_options_string] $option_str 10
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
  debug [list process_options_string return] $ret 10
  return $ret
}

# Split a string and return items matching a prefix in a TCL list
# Input: prefix = the prefix to match
#        string = the string to split
#        splitchar = the charecter to split on (DEFAULT is " ")
#        strip = 1 value strips the prefix from the returned list
#                0 (DEFAULT) does nothing
# Return: retlist = a list of matching strings
proc get_items_starting_with { prefix string {splitchar " "} {strip 0}} {
  set parts [psplit $string $splitchar]
  debug [list get_items_starting_with start] "prefix=$prefix string=$string splitchar=$splitchar strip=$strip" 10
  set retlist []
  foreach part $parts {
    if { [string match $prefix* $part] } {
      #debug [list get_items_starting_with part_match] $part 10
      if { $strip == 1 } {
        lappend retlist [string map [list $prefix ""] $part]
      } else {
        lappend retlist $part
      }
    }
  }
  debug [list get_items_starting_with retlist] $retlist 10
  return $retlist
}

# Properly escape a tmsh command string
# Input: string = the tmsh command
# Return: string = the modified string
proc create_escaped_tmsh { string } {
  return [string map [list \{ \\\{ \} \\\} \" \\\"] $string]
}

# Set TMOS version info in a global array.  We read info from the /VERSION 
# file and populate the array with that information.
proc set_version_info {} {
  global version_info
  array set version_info {}
  set fh [open "/VERSION" r]
  set file_data [read $fh]
  close $fh
  set data [split $file_data "\n"]
  foreach line $data {
    set line_info [split $line ":"]
    set ::version_info([string tolower [lindex $line_info 0]]) [string trim [lindex $line_info 1]]
  }
  return 1
}

# Run the cURL command and save the URL to a file.  Throws a hard error if cURL 
# exits uncleanly
# Input: string = URL to fetch
proc curl_save_file { url filename } {
  debug [list curl_save_file start] "url=$url filename=$filename" 10
  set status [catch {
    exec curl --connect-timeout 5 -k -s -w 'RESPCODE=\%\{response_code\}' -o $filename $url
  } message]

  debug [list curl_save_file done] "status=$status message=$message" 10
  
  if { ![string match "*RESPCODE=200*" $message]} {
    error "Error occured while trying to retrieve $url: $message"
  }

  return
}
