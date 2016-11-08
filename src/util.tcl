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
#        2 = iWorkflow
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
  if { [string match -nocase "apic_*" $partition] || [string match -nocase "apic-*" $partition] } {
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

  # If we get here we can safely assume that this is either a Standalone or iWorkflow mode deployment
  # The only way we currently have to check for iWorkflow mode is to see if app_stats was sent
  if { [info exists ::app_stats] } {
    debug [list get_mode iworkflow] "all other modes checked for and app_stats set, assuming iWorkflow deployment mode (2)" 10
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
    debug [list is_valid_profile_option obj] [format "%s" $obj] 11
    debug [list is_valid_profile_option option] [format "looking for %s" $option] 11
    set found 0
    set fdx 0
    set fields [tmsh::get_field_names value $obj]
    set fields2 [tmsh::get_field_names nested $obj]
    debug [list is_valid_profile_option fields] [format "%s" $fields] 11
    debug [list is_valid_profile_option fields2] [format "%s" $fields2] 11
    set field_count [llength $fields]
    while { $fdx < $field_count } {
        set field [lindex $fields $fdx]
        if { $field == $option } {
          return 1
        }
        incr fdx
    }
    set field_count [llength $fields2]
    set fdx 0
    while { $fdx < $field_count } {
        set field [lindex $fields2 $fdx]
        if { $field == $option } {
          return 1
        }
        incr fdx
    }
    return 0
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
  if { ! $::redeploy || $::pool__addr eq "255.255.255.254" } {
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

# Process a string in the format <option>[=<value>][;<option2>[=<value2>]] and return a
# properly formatted TMSH string.  If $tmsh is specified than options will be verified
# using the object in $template.  This works for things like profiles, but not virtual
# servers.  Specifying no value for $tmsh turns off checking
# Input: $option_str = string to process
#        $tmsh = the portion of the tmsh command get a list of all-properties
#        $template = the object name to use as a list of available options
#        $add_default = add a 'defaults-from' option using the value of $template
#                       if not found in the string
proc process_options_string { option_str tmsh template {add_default 0} } {
  debug [list process_options_string] [format "option_str=%s tmsh=%s template=%s add_default=%s" $option_str $tmsh $template $add_default] 10
  set ret ""

  # Get all the options passed in array format
  array set options [process_kvp_string $option_str]

  if { $add_default && ![info exists options(defaults-from)] } {
    debug [list process_options_string add_default] "defaults-from $template" 10
    set options(defaults-from) $template
  }

  # Get the supported options for a profile type
  foreach {option value} [array get options] {
    if { [string length $tmsh] > 0 } {
      set profileobj [lindex [tmsh::get_config ltm $tmsh $template all-properties] 0]
      if { [is_valid_profile_option $profileobj $option] == 0 } {
        error "The option \"$option\" for $tmsh is not valid"
      }
    }

    # Handle options that have no value
    if { [string length $value] == 0 } {
      debug [list process_options_string $option] [format "found empty value, appending option '%s' only" $option] 10
      append ret [format "%s " $option]
      continue
    }

    # Handle TMOS set value operations (add,delete,replace,default,none).  Input format for the value is:
    #   set_<operation>:item1[,item2]
    # Operations other than valid ones will fall through this logic to the default behaviour below
    set set_skip 0
    set set_raw 0
    if { [string match "set_*" $value] } {
      set set_cmd_prefix ""
      set set_cmd_postfix " \} "
      switch -glob [string tolower $value] {
        set_add:* {
          set set_cmd_prefix "add \{ "
        }
        set_delete:* {
          set set_cmd_prefix "delete \{ "
        }
        set_replace:* {
          set set_cmd_prefix "replace-all-with \{ "
        }
        set_raw:* {
          set set_cmd_prefix ""
          set set_cmd_postfix ""
          set set_raw 1
        }
        set_default {
          set set_cmd_prefix "default "
          set set_cmd_postfix ""
          set value ""
        }
        set_none {
          set set_cmd_prefix "none "
          set set_cmd_postfix ""
          set value ""
        }
        default {
          set set_skip 1
        }
      }
      debug [list process_options_string $option] [format "found set_ value, prefix='%s' postfix='%s' skip=%s" $set_cmd_prefix $set_cmd_postfix $set_skip] 10

      if { !$set_skip } {
        set set_list [string map {, " "} [lindex [psplit $value ':'] 1]]
        debug [list process_options_string $option] [format " set_list=%s" $set_list] 10
        append ret [format "%s %s %s %s" $option $set_cmd_prefix $set_list $set_cmd_postfix]
        continue
      }
    }

    # Handle the default behaviour
    debug [list process_options_string $option] [format "dropped to default"] 10
    if { $set_raw } {
      append ret [format "%s %s " $option $value]
    } else {
      append ret [format "%s \"%s\" " $option $value]
    }
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
      if { $strip == 1 } {
        lappend retlist [string map [list $prefix ""] $part]
      } else {
        lappend retlist $part
      }
    }
  }
  debug [list get_items_starting_with retlist] $retlist 10
  return [string map [list "\\?" "?"] $retlist]
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
# Input: string url = URL to fetch
#        string filename = filename to save output to
#        int error_exit = 1 => throw hard error on non 200 response code
#                         >1 => ignore error and return response code
proc curl_save_file { url filename {error_exit 1}} {
  debug [list curl_save_file start] "url=$url filename=$filename error_exit=$error_exit" 9
  set status [catch {
    exec curl --connect-timeout 5 -k -s -w 'RESPCODE=\%\{response_code\}' -o $filename $url
  } message]

  debug [list curl_save_file done] "status=$status message=$message" 9

  if { ![string match "*RESPCODE=200*" $message] } {
    if { $error_exit == 1} {
      error "Error occured while trying to retrieve $url: $message"
    } else {
        return 0
    }
  }

  return 1
}

# Borrowed from tcllib ::ip::IPv4?
# Check a string to see if it's an IPv6 address
# Input: string addr = string to check
# Output: 1 = is IPv6
#         0 = not IPv6
proc is_ipv6 { addr } {
  if { [has_routedomain $addr] } {
    set addr [lindex [split $addr %] 0]
  }
  if {[string first : $addr] >= 0} {
      return 1
  }
  return 0
}

# Borrowed from http://wiki.tcl.tk/989
# Check a string to see if it's an IPv4 address
# Input: string addr = string to check
# Output: 1 = is IPv4
#         0 = not IPv4
proc is_ipv4 { addr } {
  if { [has_routedomain $addr] } {
    set addr [lindex [split $addr %] 0]
  }
  if {[regexp {^\d+\.\d+\.\d+\.\d+$} $addr]
      && [scan $addr %d.%d.%d.%d a b c d] == 4
      && 0 <= $a && $a <= 255 && 0 <= $b && $b <= 255
      && 0 <= $c && $c <= 255 && 0 <= $d && $d <= 255} {
    return 1
  } else {
    return 0
  }
}

# Check a string to see if it's a IPv4 or IPv6 address
# Input: string addr = string to check
# Output: >1 = is address (4 = IPv4, 6 = IPv6)
#         0 = is NOT an address
proc is_ip { addr } {
  set v4 [is_ipv4 $addr]
  debug [list is_ip $addr v4] $v4 10
  if { $v4 } { return 4 }
  set v6 [is_ipv6 $addr]
  debug [list is_ip $addr v6] $v6 10
  if { $v6 } { return 6 }
  return 0
}

# Return a route-domain aware destination address
# Input: string = addr to check/modify
# Return: string = the correctly formatted destination address
proc get_dest_addr { addr } {
  if { [is_ipv6 $addr] } {
    set addr [string map {[ "" ] ""} $addr]
  }

  if { ![has_routedomain $addr]} {
    return [format "%s%%%s" $addr $::rd]
  } else {
    return $addr
  }
}

# Return a IPv4/v6 route-domain aware destination string
# Input: string addr = The address to use
#        strint port = The port number
# Return: string = the correctly formatted destination string
proc get_dest_str { addr port } {
  if { [is_ipv6 $addr] } {
    set addr [string map {[ "" ] ""} $addr]
    if { ![has_routedomain $addr] } {
      return [format "%s%%%s.%s" $addr $::rd $port]
    } else {
      return [format "%s.%s" $addr $port]
    }
  }

  if { ![has_routedomain $addr]} {
    return [format "%s%%%s:%s" $addr $::rd $port]
  } else {
    return [format "%s:%s" $addr $port]
  }
}

# Convert a APL table row into an array keyed on the column name
# Input: list row = The APL TCL list object for the row
#        string arrayRef = The name of the existing array to populate
#        string defaultsRef = The name of the array to use for default values
#        list nullColumns = A list of column names that may contain the keyword
#                           'none'.  The value will be replaced with "" on return
proc table_row_to_array { row array_ref {defaults_ref {}} {null_columns []} } {
  debug [list table_row_to_array row] $row 10
  debug [list table_row_to_array array_ref] $array_ref 10
  debug [list table_row_to_array defaults_ref] $defaults_ref 10
  debug [list table_row_to_array null_columns] $null_columns 10

  upvar $array_ref ret
  array set defaults [subst [subst $$defaults_ref]]

  debug [list table_row_to_array default_vals] [array get defaults] 10

  # extract the iApp table data - borrowed from f5.lbaas.tmpl
  foreach data [lrange [split [join $row] "\n"] 1 end-1] {
      set name [lindex $data 0]
      set value [string map {\n \\n \r \\r} [lrange $data 1 end]]
      if { [lsearch $null_columns $name] > -1 && [string tolower $value] eq "none" } {
        set ret($name) ""
        debug [list table_row_to_array set_null] [format "%s=%s" $name $ret($name)] 10
      } else {
        set ret($name) $value
        debug [list table_row_to_array set_value] [format "%s=%s" $name $ret($name)] 10
      }
  }

  # fill in any empty table values - borrowed from f5.lbaas.tmpl
  if { [array size defaults] } {
    foreach name [array names defaults] {
      if { ![info exists ret($name)] || $ret($name) eq "" } {
          set ret($name) $defaults($name)
          debug [list table_row_to_array set_default] [format "%s=%s" $name $ret($name)] 10
      }
    }
  }
  return
}

# Check to see if a node object exists in the get_config.
# Lookups are cached in ::__node_cache for re-use
# Input:  string node_name = The object name to check for
# Return: 0 = node does not exist
#         1 = node does exist
proc check_node_exist { node_name } {
  if { ! [info exists ::__node_cache($node_name)] } {
    set node_status [catch {tmsh::get_config ltm node $node_name} node_status_ret]
    debug [list check_node_exist $node_name status] $node_status_ret 10
    if { [string match "*address*" $node_status_ret] } {
      set ::__node_cache($node_name) 1
      debug [list check_node_exist $node_name cache_set] "1" 10
      return 1
    } else {
      set ::__node_cache($node_name) 0
      debug [list check_node_exist $node_name cache_set] "0" 10
      return 0
    }
  } else {
    debug [list check_node_exist $node_name cache_hit] $::__node_cache($node_name) 10
    return $::__node_cache($node_name)
  }
}

# Perform string substitution on a URL.
# Input: string url = the URL to manipulate
# Output: string url = the final URL
proc url_subst { url } {
  debug [list url_subst] [format "url=%s" $url] 10
  set url_map [list %APP_NAME%           $::app \
                    %APP_PATH%           $::app_path \
                    %PARTITION%          $::partition \
                    %VS_NAME%            $::vs__Name \
                    %VS_DESCR%           $::vs__Description \
                    %EXT1%               $::extensions__Field1 \
                    %EXT2%               $::extensions__Field2 \
                    %EXT3%               $::extensions__Field2 \
                    "url="               "" \
                    "irule:url="         "" \
                    "irule:urloptional=" "" \
                    "asm:url="           "" \
                    "apm:url="           "" ]

  set url [string map $url_map $url]
  debug [list url_subst] [format "return=%s" $url] 10
  return $url
}

# Load a crypto cert/key from URL
# Input: string type = key|cert
#        string url = the URL to get
# Return: string obj_name = the name of the created TMOS object
proc load_crypto_object { type url } {
  set url [url_subst $url]
  debug [list load_crypto_object url_subst] $url 10

  set url_file_name [lindex [split $url /] end]
  set obj_name [format "/Common/%s_%s" $::app $url_file_name]
  set file_name [format "/var/tmp/appsvcs_%s_%s_%s" $::app $::bundler_timestamp $url_file_name]
  debug [list load_crypto_object] [format "obj_name=%s file_name=%s" $obj_name $file_name] 10

  switch -glob $type {
    cert  { set verify_cmd [format "/usr/bin/openssl x509 -noout -in %s" $file_name] }
    key { set verify_cmd [format "/usr/bin/openssl rsa -noout -in %s" $file_name] }
    default { error "The crypto type specified is not supported" }
  }

  curl_save_file $url $file_name

  set verify_status [catch {eval exec $verify_cmd} verify_status_ret]
  debug [list load_crypto_object verify_status $verify_status] $verify_status_ret 10

  if { $verify_status } {
    file delete $file_name
    error "While loading the $type: $verify_status_ret"
  }

  set cmd [format "sys file ssl-%s %s source-path file://%s" $type $obj_name $file_name]
  debug [list load_crypto_object tmsh_create] $cmd 10
  set create_status [catch {tmsh::create $cmd} create_status_ret]
  debug [list load_crypto_object create_status $create_status] $create_status_ret 10
  file delete $file_name

  return $obj_name
}

# Credit: http://www.egghelp.org/cgi-bin/tcl_archive.tcl?mode=download&id=97
# Perform a DNS lookup of a hostname using nslookup.  Assumes DNS servers are already
# configured in TMOS
# Input: string host = name of host to lookup
#        int mode = 1 => Throw a hard error
#                    0 => Return the error
# Return: string return = First IP tied to hostname OR Error
proc dns_lookup { host {mode 1} } {
  set name "Unknown"
  set ip "Unknown"
  set errmsg "Unknown"
  set host [lindex [string tolower $host] 0]
  if {[catch {eval exec "/usr/bin/nslookup" [lindex $host 0]} buff]} {
    foreach line [split $buff \n] {
      if {[string first "${host}:" $line] != -1} {
        set errmsg [string trim [lindex [split $line :] 1]]
      }
    }

    if { $mode } {
        error "An error occured trying to resolve $host: $errmsg"
    } else {
        return "Error: $errmsg"
    }
  }
  set buff [split $buff \n]
  set buff [lreplace $buff 0 1]
  if {[regexp {name = (.*)\.} $buff -> name]} { set ip $host }

  foreach data $buff {
    switch [lindex $data 0] {
      "Name:" {
        set name [string trim [lindex [split $data :] 1]]
      }
      "Address:" {
        set ip [string trim [lindex [split $data :] 1]]
      }
      "Addresses:" {
        set ip [string trim [lindex [split $data :] 1]]
      }
    }
  }
  return "${ip}"
}
