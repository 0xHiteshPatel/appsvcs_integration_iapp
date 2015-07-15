# Print a timestamped debug message to /var/tmp/scriptd.out
# Input: string
proc debug { string } {
  set systemTime [clock seconds]
  puts "\[[clock format $systemTime -format %D]\]\[[clock format $systemTime -format %H:%M:%S]\]\[$::app\] $string"
}

# Figure out which type of environment we are executing in.
# Return: list $mode $folder $partition $routedomainid
# Modes: 1 = Standalone
#        2 = BIG-IQ Cloud
#        3 = Cisco APIC
#        4 = VMware NSX
proc get_mode { } {
  set folder [tmsh::pwd]
  set partition [lindex [split $folder /] 1]
  set routedomainid 0
  debug "\[get_mode\] starting folder=$folder partition=$partition routedomainid=$routedomainid"
  
  # Check for a partition that starts with apic_ and return APIC mode (3) and RD if found
  if { [string match -nocase "apic_*" $partition] } {
    debug "\[get_mode\]\[apic\] partition starts with apic_, assuming APIC deployment mode (3)"
    set rdobjs [tmsh::get_config net route-domain "/$partition/$partition" id]
    set routedomainid [tmsh::get_field_value [lindex $rdobjs 0] "id"]
    debug "\[get_mode\]\[apic\] rdobjs=$rdobjs routedomainid=$routedomainid"
    return [list 3 $folder $partition $routedomainid]
  }

  # Check for an $app name that is formatted like this:
  # edge-<#>_<#>_virtualserver-<#>-serviceprofile-<#>
  # and return NSX mode (4) 
  if { [regexp -nocase {^edge-[0-9]+_[0-9]+_virtualserver-[0-9]+-serviceprofile-[0-9]+$} $::app] } {
    debug "\[get_mode\]\[nsx\] app name matches NSX regexp, assuming NSX deployment mode (4)"
    return [list 4 $folder $partition $routedomainid]    
  }

  # If we get here we can safely assume that this is either a Standalone or BIG-IQ Cloud mode deployment
  # The only way we currently have to check for BIG-IQ Cloud mode is to see if app_stats was sent
  if { [info exists ::app_stats] } {
    debug "\[get_mode\]\[bigiq\] all other modes checked for and app_stats set, assuming BIG-IQ Cloud deployment mode (2)"
    return [list 2 $folder $partition $routedomainid]
  }

  # Default is Standalone mode
  debug "\[get_mode\]\[standalone\] no integration vendor found, assuming Standalone deployment mode (1)"    
  return [list 1 $folder $partition $routedomainid]
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
# Input $string = string to process
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