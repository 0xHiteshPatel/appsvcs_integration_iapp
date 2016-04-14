#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

package require base64

set startTime [clock seconds]
set bundler_timestamp [clock format $startTime -format {%Y%m%d%H%M%S}]

set NAME "F5 Application Services Integration iApp (Community Edition)"
set IMPLMAJORVERSION "2.0dev"
set IMPLMINORVERSION "001"
set IMPLVERSION [format "%s(%s)" $IMPLMAJORVERSION $IMPLMINORVERSION]
set PRESVERSION "%PRESENTATION_REV%"
set POSTDEPLOY_DELAY 0

%insertfile:src/util.tcl%

set_version_info

%insertfile:include/custom_extensions.tcl%

array set bundler_objects {}
array set bundler_data {}
set bundler_deferred_cmds []

%insertfile:tmp/bundler.build%

set app $tmsh::app_name
debug [list start] [format "Starting %s version IMPL=%s PRES=%s app_name=%s" $NAME $IMPLVERSION $PRESVERSION $app] 0
debug [list version_info] [array get version_info] 3


array set modenames {
  1 {Standalone}
  2 {BIG-IQ Cloud}
  3 {Cisco APIC}
  4 {VMware NSX}
}

array set __provision_cache {}
load_provisioned

array set aso_config {}
set asoobj {}
set modeinfo [get_mode]
set mode [lindex $modeinfo 0]
set folder [lindex $modeinfo 1]
set partition [lindex $modeinfo 2]
set rd [lindex $modeinfo 3]
set newdeploy [lindex $modeinfo 4]
set app_path [format "/%s/%s.app" $partition $app]
set template_name [format "appsvcs_integration_v%s_%s" $IMPLMAJORVERSION $PRESVERSION]
set aso [format "%s/%s" $app_path $app]
set redeploy 0
if { ! $newdeploy } { set redeploy 1 }
set postfinal_deferred_cmds []

debug "modeinfo" [format "mode=%s folder=%s partition=%s rd=%s newdeploy=%s redeploy=%s template_name=%s" $mode $folder $partition $rd $newdeploy $redeploy $template_name] 2

# Cache our ASO object data
for { set i 0 } { $i <= [llength $asoobj] } { set i [expr {$i+2}] } {
  set type [lindex $asoobj $i]
  if { $type == "variables" || $type == "lists" || $type == "tables" } {
    for { set j 0 } { $j < [llength [lindex $asoobj [expr {$i+1}]]] } { set j [expr {$j+2}] } {
      set name [lindex [lindex $asoobj [expr {$i+1}]] $j]
      
      if { $type == "tables" } {
        set val [lindex [lindex $asoobj [expr {$i+1}]] [expr {$j+1}]]
      } elseif { $type == "lists" } {
        set val [lindex [lindex [lindex $asoobj [expr {$i+1}]] [expr {$j+1}]] 1] 
      } else {
        set val [lindex [lindex [lindex $asoobj [expr {$i+1}]] [expr {$j+1}]] 1] 
      }
      set aso_config($name) $val
    }
  }
}
# Copy the array so that we can preserve the original values
# aso_config() can change at runtime
array set aso_config_orig [array get aso_config]

debug [list aso_config] [array names aso_config] 9
foreach var [array names aso_config] {
  debug [list aso_config $var] $aso_config($var) 9
}

set asodescr [format "Deployed by appsvcs_integration_v%s_%s in %s mode on %s" $IMPLVERSION $PRESVERSION $modenames($mode) [clock format $startTime -format "%D %H:%M:%S"]]
debug [list set_aso_decription tmsh_modify] [format "sys application service %s description \"%s\"" $aso $asodescr] 1
tmsh::modify [format "sys application service %s description \"%s\"" $aso $asodescr]

# Define various global values
set allVars {
%PRESENTATION_TCL_ALLVARS%
 app_stats }

array set table_defaults {
    Members {
        Index 0
        State enabled
        IPAddress Error
        Port ""
        ConnectionLimit 0
        Ratio 1
        PriorityGroup 0
        AdvOptions none
    }
    Pools {
      Index -1
      Name ""
      Description ""
      LbMethod ""
      Monitor ""
      AdvOptions none
    }
    Monitors {
      Index -1
      Name ""
      Type ""
      Options ""
    }
    L7P_Match {
      Index -1
      Operand ""
      Negate no
      Condition ""
      CaseSensitive no
      Value ""
      Missing no
    }
    L7P_Action {
      Index -1
      Target error/error/error
      Parameter error      
    }

}

array set pool_state {
    enabled        {session user-enabled state user-up}
    disabled       {state user-down}
    force-disabled {state user-down}
    drain-disabled {session user-disabled state user-up}
}

# Fixup incoming variables: If no value is sent for a particular iApp field than the var is not created which
# results in all sorts of problems.  We just check for existence of the var and set to "" if it doesn't exist
foreach var $allVars {
  if {[info exists [subst $var]]} {
    debug "input" [format "%s sent, value is: %s" $var [set [subst $var]]] 2
  } else {
    set [subst $var] ""
    debug "input" [format "%s NOT sent, setting to blank" $var] 2
  }
}
#error "bah"

# Call the custom_extensions_start proc to allow site-specific customizations
custom_extensions_start

# Special handling for the Source Address because it comes in as 0.0.0.0/0 and
# needs to be 0.0.0.0%xxxx/0, where '%xxxx' is the route-domain ID
set working $vs__SourceAddress
debug [list fix_src_addr] "Check if vs__SourceAddress needs to be fixed" 7
if { [string length $working] > 0 } {
  set net  [lindex [split $working /] 0]
  set cidr [lindex [split $working /] 1]
  set vs__SourceAddress "$net%$rd\/$cidr"
  debug [list fix_src_addr] [format " Fixing vs__SourceAddress: orig=%s new=%s" $working $vs__SourceAddress] 7
}

# Create Client-SSL profile if Cert and Key are specified but ClientSSLProfile is not
debug [list client_ssl create] "checking if client ssl cert & key were entered" 7
set clientssl 0
if { [string length $vs__ProfileClientSSLKey] > 0 && [string length $vs__ProfileClientSSLCert] > 0 && [string length $vs__ProfileClientSSL] == 0 } {
  if { $vs__ProfileClientSSLKey == "auto" } {
    debug [list client_ssl create auto_key] [format "found auto option for key, setting vs__ProfileClientSSLKey=/Common/%s.key" $app] 5
    set vs__ProfileClientSSLKey "/Common/$app.key"
  }

  if { $vs__ProfileClientSSLCert == "auto" } {
    debug [list client_ssl create auto_cert] [format "found auto option for key, setting vs__ProfileClientSSLCert=/Common/%s.crt" $app] 5
    set vs__ProfileClientSSLCert "/Common/$app.crt"
  }

  tmsh::get_config /sys file ssl-key $vs__ProfileClientSSLKey
  tmsh::get_config /sys file ssl-cert $vs__ProfileClientSSLCert
  debug [list client_ssl create check_exist] "ssl cert & key found... creating profile" 7

  set cmd [format "ltm profile client-ssl %s_clientssl key %s cert %s" $app $vs__ProfileClientSSLKey $vs__ProfileClientSSLCert]

  if { [string length $vs__ProfileClientSSLChain] > 0 } {
      tmsh::get_config /sys file ssl-cert $vs__ProfileClientSSLChain
      debug [list client_ssl create cert_chain] "adding cert chain" 7
      append cmd [format " chain %s" $vs__ProfileClientSSLChain]
  }

%insertfile:include/feature_sslEasyCipher.tcl%

  if { [string length $vs__ProfileClientSSLCipherString] > 0 } {
      debug [list client_ssl create cipher_string] "adding cipher string" 7
      append cmd [format " ciphers \"%s\"" $vs__ProfileClientSSLCipherString]
  }

  if { [string length $vs__ProfileClientSSLAdvOptions] > 0 } {
    debug [list client_ssl create adv_options] "processing advanced options string" 7
    append cmd [format " %s" [process_options_string $vs__ProfileClientSSLAdvOptions "profile client-ssl" "/Common/clientssl"]]
  }

  debug [list client_ssl create tmsh_create] $cmd 1
  tmsh::create $cmd
  set clientssl 1
} else { 
  if { [string length $vs__ProfileClientSSL] > 0 } {
    debug [list client_ssl associate] "ClientSSLProfile was provided... checking if it exists" 5
    tmsh::get_config /ltm profile client-ssl $vs__ProfileClientSSL
    set clientssl 2
  } else {
    set clientssl 0
    if { [string length $vs__ProfileClientSSLKey] > 0 && [string length $vs__ProfileClientSSLCert] == 0 } {
      error "A client-ssl key was specified without a client-ssl certifcate"
    }
    if { [string length $vs__ProfileClientSSLKey] == 0 && [string length $vs__ProfileClientSSLCert] > 0 } {
      error "A client-ssl certifcate was specified without a client-ssl key"
    }
    debug [list client_ssl] "ssl cert & key not specified... skipped Client-SSL profile creation" 2
  }
}

# Create Monitors
debug [list monitors] [format "monCount=%s" [llength $monitor__Monitors]] 7

set monIdx 0
array set monNames {}
array set monCreate {}
foreach monRow $monitor__Monitors {
  set cmd ""
  debug [list monitors $monIdx] [format "monRow=%s" $monRow] 9

  array set column_defaults [subst $::table_defaults(Monitors)]
  array unset column

  # extract the iApp table data - borrowed from f5.lbaas.tmpl
  foreach column_data [lrange [split [join $monRow] "\n"] 1 end-1] {
      set name [lindex $column_data 0]
      set column($name) [string map {\n \\n \r \\r} [lrange $column_data 1 end]]
  }

  # fill in any empty table values - borrowed from f5.lbaas.tmpl
  foreach name [array names column_defaults] {
      if { ![info exists column($name)] || $column($name) eq "" } {
          set column($name) $column_defaults($name)
          debug [list monitors $monIdx set_default] [format "value for %s not found... setting to default of %s" $name $column_defaults($name)] 10
      }
  }

  # The BIG-IP UI sends empty rows... above this we set Index to -1 if it wasn't found
  # If a Index is not specified then skip this row in the table
  if { $column(Index) < 0 } {
    debug [list monitors $monIdx check_index] "no index value found, skipping row" 9
    continue
  } elseif { [info exists monNames($column(Index))] } {
    error "A monitor with Index of \"$column(Index)\" was already specified"
  } else {
    if {[string length $column(Name)] > 0 } {
      if { [string match "/*" $column(Name)] } {
        set monNames($column(Index)) $column(Name)
        set monCreate($column(Index)) 0
      } else {
        set monNames($column(Index)) [format "%s/%s" $app_path $column(Name)]
        set monCreate($column(Index)) 1
      }
    } else {
      set monNames($column(Index)) [format "%s/monitor_%s" $app_path $column(Index)]
      set monCreate($column(Index)) 1
    }
  }

  if { $monCreate($column(Index)) == 1 } {
    if { [string length $column(Type)] <= 0 } {
      error "A Monitor Type was not specified for monitor with Index $column(Index)"
    }

    set cmd [format "ltm monitor %s %s " $column(Type) $monNames($monIdx)]
    if { [string length $column(Options)] > 0 } {
      set column(Options) [join $column(Options) " "]
      debug [list monitors $monIdx options] [format "processing options string \"%s\"" $column(Options)] 10
      append cmd [format " %s" [process_options_string $column(Options) "" ""]]
    }

    debug [list monitors $monIdx tmsh_create] $cmd 1
    tmsh::create $cmd
  }

  incr monIdx
  array unset column_defaults
}

# Call the custom_extensions_before_pool proc to allow site-specific customizations
custom_extensions_before_pools

# Create pool
set poolCount [llength $pool__Pools]
debug [list pools] [format "poolCount=%s" $poolCount] 7

set poolIdx 0
set default_pool_name ""
array set poolIndexes {}
array set poolNames {}
foreach poolRow $pool__Pools {
  set cmd ""
  set nummembers 0

  debug [list pools $poolIdx] [format "poolRow=%s" $poolRow] 9

  custom_extensions_before_pool

  array set column_defaults [subst $::table_defaults(Pools)]
  array unset column

  # extract the iApp table data - borrowed from f5.lbaas.tmpl
  foreach column_data [lrange [split [join $poolRow] "\n"] 1 end-1] {
      set name [lindex $column_data 0]
      set column($name) [string map {\n \\n \r \\r} [lrange $column_data 1 end]]
      #debug [format "column_data name=%s val=%s" $name $column($name)]
  }

  # fill in any empty table values - borrowed from f5.lbaas.tmpl
  foreach name [array names column_defaults] {
      if { ![info exists column($name)] || $column($name) eq "" } {
          set column($name) $column_defaults($name)
          debug [list pools $poolIdx set_default] [format "value for %s not found... setting to default of %s" $name $column_defaults($name)] 10
      }
  }

  # The BIG-IP UI sends empty rows... above this we set Index to -1 if it wasn't found
  # If a Index is not specified then skip this row in the table
  if { $column(Index) < 0 } {
    debug [list pools $poolIdx] "no index value found, skipping row" 9
    continue
  } elseif { [info exists poolIndexes($column(Index))] } {
    error "A pool with Index of \"$column(Index)\" was already specified"
  } else {
    set poolIndexes($column(Index)) 1
  }

  # Check to see if a poolName was specified... if not set to $app_pool_$poolIdx
  if { [string length $column(Name)] == 0 } {
      set column(Name) [format "%s_pool_%s" $app $poolIdx]
      debug [list pools $poolIdx] [format "no pool name specified... setting to %s" $column(Name)] 7
  }
  set poolNames($column(Index)) $column(Name)

  if { $poolIdx == $pool__DefaultPoolIndex } {
    # Set the default pool name for use later during virtual server creation
    set default_pool_name $column(Name)
  }

  set memberstr "members replace-all-with \{ "
  foreach memberRow $pool__Members {
    debug [list pools $poolIdx member_str] [format "memberRow=%s" $poolRow] 10
    array set pool_column_defaults [subst $::table_defaults(Members)]
    array unset pool_column

    # extract the iApp table data - borrowed from f5.lbaas.tmpl
    foreach pool_column_data [lrange [split [join $memberRow] "\n"] 1 end-1] {
        set name [lindex $pool_column_data 0]
        set pool_column($name) [lrange $pool_column_data 1 end]
        #debug [format "$poolIdx member pool_column_data name=%s val=%s" $name $pool_column($name)]
    }

    # fill in any empty table values - borrowed from f5.lbaas.tmpl
    foreach name [array names pool_column_defaults] {
        if { ![info exists pool_column($name)] || $pool_column($name) eq "" } {
            set pool_column($name) $pool_column_defaults($name)
            debug [list pools $poolIdx member_str set_default] [format "value for %s not found... setting to default of %s" $name $pool_column_defaults($name)] 10
        }
    }

    set idx $pool_column(Index)
    set ip $pool_column(IPAddress)
    set port $pool_column(Port)
    set connlimit $pool_column(ConnectionLimit)
    set state $pool_column(State)
    set ratio $pool_column(Ratio)
    set prigrp $pool_column(PriorityGroup)
    set options [lindex $pool_column(AdvOptions) 0]    

    if { $idx != $poolIdx } {
      debug [list pools $poolIdx member_str] [format " %s/%s:%s not a member of pool %s skipping" $idx $ip $port $poolIdx] 10
      continue
    }

    # Skip pool members with a 0.0.0.0 IP.  Added to allow creation of an empty pool when you still have 
    # to expose the pool member IP as a tenant editable field in BIG-IQ (Cisco APIC needs this for Dynamic Endpoint Insertion)
    if { [string match 0.0.0.0* $ip] } {
      debug [list pools $poolIdx member_str] "  ip=0.0.0.0, skipping" 7
      continue
    } else {
      incr nummembers
    }

    # Add a route domain if it wasn't included and we don't already have a node object created
    set default_folder "/Common/"
    set node_exist -1
    if { [string first "/" $ip] >= 0 } { set default_folder "" }
    set node_status [catch {tmsh::get_config ltm node $default_folder$ip} node_status_ret]
    if { [string match "*address*" $node_status_ret] } {
      set node_exist 1
    } else {
      set node_exist 0
    }

    debug [list pools $poolIdx member_str node_exist $default_folder$ip] $node_exist 7
    if { $node_exist == 0 && ![has_routedomain $ip]} {
      set ip [get_dest_addr $ip]
    }

    # TODO: Is this still required?
    # Sometimes we receive a transposed ip/port from BIG-IQ... fix it here
    if {[has_routedomain $port]} {
      set port $column(IPAddress)
      set ip $column(Port)
      debug [list pools $poolIdx member_str] [format "  fixing ip=%s port=%s" $ip $port] 7
    }
    debug [list pools $poolIdx member_str] [format "  idx=%s ip=%s port=%s connlimit=%s ratio=%s prigrp=%s state=%s advoptions=%s" $idx $ip $port $connlimit $ratio $prigrp $state $options] 7
    
    # If we don't get a port in the pool member table than use the template value for pool__MemberDefaultPort
    if { [string length $port] == 0} {
      if { [string length $pool__MemberDefaultPort] == 0 } {
        debug [list pools $poolIdx member_str] [format "  Pool member port was not specified, pool__MemberDefaultPort was blank, using pool__port=%s" $pool__port] 5
        set port $pool__port
      } else {
        debug [list pools $poolIdx member_str] [format "  Pool member port was not specified, using pool__MemberDefaultPort=%s" $pool__MemberDefaultPort] 5
        set port $pool__MemberDefaultPort
      }
    }

    # iCR does not like table columns with empty values.  Workaround this by allow use of keyword 'none' and NOOP
    if { [string tolower $options] == "none" } {
      set options ""
    }

    if { [string length $options] > 0} {
      debug [list pools $poolIdx member_str adv_options] "processing member advanced options string" 7
      set options [format " %s" [process_options_string $options "" ""]]
    }

    if { $node_exist } {
      # Node did exist, create <node name>:<port> string
      set dest [format "%s:%s" $ip $port]
    } else {
      # Node did not exist, get the correctly formatted ip, port string
      set dest [get_dest_str $ip $port]
    }

    append memberstr [format " %s \{ connection-limit %s ratio %s priority-group %s %s %s\} " $dest $connlimit $ratio $prigrp $options $::pool_state($state)]
  }
  append memberstr " \} "

  # Check to see if we really have any pool members after table processing
  if { $nummembers == 0 } {
    debug [list pools $poolIdx member_str] "  no true pool members found after table was processed, setting to none" 5
    set memberstr " members none"
  }

  debug [list pools $poolIdx member_str] "memberstr=$memberstr" 7

  set idx $column(Index)
  set name $column(Name)
  set descr $column(Description)
  set lbmethod $column(LbMethod)
  set advoptions [lindex $column(AdvOptions) 0]

  # We support multiple monitors and the ability to specify the minimum number of monitors that need
  # to pass for the pool to be considered healthy.  The format of the Monitor string from the Pool table is:
  #    (<monitor index>[,<monitor index>][;<minimum healthy>])
  #      For example:  0,1,2;3  specifies that this pool should associate the monitors created with
  #                             monitor index 0, 1 and 2 and that all 3 monitors need to pass for the
  #                             pool to be considered available.
  #
  # If no value is specifed no monitor is associated with the pool
  set monitor $column(Monitor)
  if { [string length $monitor] > 0 } {
    # Monitor info entered
    if { [string match "*\;*" $monitor] } {
      # Min monitors specified
      set monitor [lindex $monitor 0]
      set monparts [split $monitor \;]
      if { [llength $monparts] == 2 } {
        # Set the minimum number of monitors and list of monitors to associate
        set monmin [lindex $monparts 1]
        set monlist [split [lindex $monparts 0] ,]
      } 
    } else {
      # Min monitors NOT specified, assume ALL monitors should pass and create list of monitors
      set monmin -1
      set monlist [split [lindex $column(Monitor) 0] ,]
    }

    # Get the names of the monitors that were created above (array keyed by monitor index) and
    # check to make sure all monitors specified were actually created
    set monmapped {}
    foreach mon $monlist {
      if { [info exists monNames($mon)] } {
        lappend monmapped $monNames($mon)
      } else {
        error "The monitor index '$mon' specified in pool index '$poolIdx' does not exist"
      }
    }

    # Setup our command
    if { $monmin > 0 } {
      set monitorcmd [format "monitor min %s of { %s }" $monmin [join $monmapped " "]]
    } else {
      set monitorcmd [format "monitor \"%s\"" [join $monmapped " and "]]
    }
  } else {
    # No monitor specified, set to none
    set monitorcmd "monitor none"
  }

  # iCR does not like table columns with empty values.  Workaround this by allow use of keyword 'none' and NOOP  
  if { [string tolower $advoptions] == "none" } {
    set advoptions ""
  }

  # Setup the base pool create command
  set cmd [format "ltm pool %s/%s %s %s " $app_path $name $memberstr $monitorcmd]

  array set pool_options {
    "lbmethod" "load-balancing-mode"
    "descr" "description"
  }

  foreach {optionvar optioncmd} [array get pool_options] {
    append cmd [generic_add_option [list pools $poolIdx options] [set [subst $optionvar]] $optioncmd "" 0]
  }

  if { [string length $advoptions] > 0 } {
    debug [list pools $poolIdx adv_options] "processing advanced options string" 7
    append cmd [format " %s" [process_options_string $advoptions "" ""]]
  }

  debug [list pools $poolIdx tmsh_create] $cmd 1
  tmsh::create $cmd
  
  custom_extensions_after_pool
  incr poolIdx
  array unset column_defaults
}

if { ! [info exists poolIndexes($pool__DefaultPoolIndex)] && $pool__DefaultPoolIndex ne ""} {
  error "The default pool index specified was not present in the pool table"
}

# Call the custom_extensions_after_pool proc to allow site-specific customizations
custom_extensions_after_pools

# Check to see if a vsName was specified... if not set to $app_vs
if { [string length $vs__Name] == 0 } {
    set vs__Name [format "%s_vs" $app]
    change_var vs__Name $vs__Name
    debug [list virtual_server set_vs_name] [format "no VS Name specified... setting to %s" $vs__Name] 5
}

# Create L7 Traffic policy
set l7p_numMatches [llength $l7policy__rulesMatch]
set l7p_numActions [llength $l7policy__rulesAction]

debug "l7policy" [format "numMatches=%s numActions=%s" $l7p_numMatches, $l7p_numActions] 7
if { $l7p_numActions != $l7p_numMatches } {
  error "The number of rows in L7 Policy Match and Action tables must be equal"
}

array set l7p_requires {}
array set l7p_controls {}
array set l7p_match_rules {}
array set l7p_action_rules {}
array set l7p_asmrule {}
array set l7p_l7dosrule {}
array set l7p_indexes {}
set l7p_defer_create 0
# Iterate through the l7policy__rulesMatch table and create our conditions.
set l7p_matchIdx 0  
foreach l7p_matchRow $l7policy__rulesMatch {
  debug [list l7policy match $l7p_matchIdx] [format "matchRow=%s" $l7p_matchRow] 9

  set l7p_rules($l7p_matchIdx) {}
  array set column_defaults [subst $::table_defaults(L7P_Match)]
  array unset column

  # extract the iApp table data - borrowed from f5.lbaas.tmpl
  foreach column_data [lrange [split [join $l7p_matchRow] "\n"] 1 end-1] {
      set name [lindex $column_data 0]
      set column($name) [string map {\n \\n \r \\r} [lrange $column_data 1 end]]
  }

  # fill in any empty table values - borrowed from f5.lbaas.tmpl
  foreach name [array names column_defaults] {
      if { ![info exists column($name)] || $column($name) eq "" } {
          set column($name) $column_defaults($name)
          debug [list l7policy match $l7p_matchIdx set_default] [format "value for %s not found... setting to default of %s" $name $column_defaults($name)] 10
      }
  }

  # Store the true name of the index in an array for use later 
  set l7p_indexes($l7p_matchIdx) $column(Index)

  # Skip rows with an index < 0 excluding the default rule
  if { [string tolower $column(Index)] != "default" && $column(Index) < 0 } {
    debug [list l7policy match] "skipping row, index < 0" 9
    continue
  }

  # Determine which profile is required in the policy for the specified operand
  switch -glob [string tolower $column(Operand)] {
    client-ssl* { set l7p_requires("client-ssl") 1 }
    http*       { set l7p_requires("http") 1 }
    ssl*        { set l7p_requires("ssl-persistence") 1 }
    tcp*        { set l7p_requires("tcp") 1 }
    default { 
      if { $column(Index) != "default" } {
        error "Could not determine the correct profile type for L7 Policy Match, Index $column(Index), Operand $column(Operand)"
      }
    }
  }

  # Set our tmsh modifiers
  if { [string tolower $column(Negate)] == "no" } { set column(Negate) "" }
  if { [string tolower $column(Negate)] == "yes" } { set column(Negate) "not" }
  if { [string tolower $column(Missing)] == "no" } { set column(Missing) "" }
  if { [string tolower $column(Missing)] == "yes" } { set column(Missing) "missing" }
  if { [string tolower $column(CaseSensitive)] == "no" } { set column(CaseSensitive) "case-insensitive" }
  if { [string tolower $column(CaseSensitive)] == "yes" } { set column(CaseSensitive) "case-sensitive" }
  
  # Process the operand.  The '/' character gets replaced with a ' ' to build the tmsh
  # command.  Additionally the ',' character gets replaced with a ' ' to allow for multiple
  # values to be passed to the operand.
  set l7p_match_oper [split $column(Operand) /]
  if { [llength $l7p_match_oper] > 0 } {
    set l7p_rule_opertmp [join $l7p_match_oper " "]
    set l7p_rule_valtmp ""
    if { [string length $column(Value)] > 0 } {
      set l7p_rule_valtmp [format "%s %s values { \"%s\" }" $column(Negate) $column(Condition) [string map {, "\" \""} $column(Value)]]
    } 
    set l7p_match_rules($l7p_matchIdx) [format "0 { %s %s %s %s }" $l7p_rule_opertmp $column(Missing) $column(CaseSensitive) $l7p_rule_valtmp]
    debug [list l7policy match $l7p_matchIdx] [format "rule=%s" $l7p_match_rules($l7p_matchIdx)] 7
  } else {
    set l7p_match_rules($l7p_matchIdx) ""
  }
  incr l7p_matchIdx
  array unset column_defaults
}

# Iterate through the l7policy__rulesAction table and create our actions.
set l7p_actionIdx 0
set l7p_action_found_default 0

foreach l7p_actionRow $l7policy__rulesAction {
  debug [list l7policy action $l7p_actionIdx] [format "actionRow=%s" $l7p_actionRow] 9

  array set column_defaults [subst $::table_defaults(L7P_Action)]
  array unset column

  # extract the iApp table data - borrowed from f5.lbaas.tmpl
  foreach column_data [lrange [split [join $l7p_actionRow] "\n"] 1 end-1] {
      set name [lindex $column_data 0]
      set column($name) [string map {\n \\n \r \\r} [lrange $column_data 1 end]]
      #debug [format "column_data name=%s val=%s" $name $column($name)]
  }

  # fill in any empty table values - borrowed from f5.lbaas.tmpl
  foreach name [array names column_defaults] {
      if { ![info exists column($name)] || $column($name) eq "" } {
          set column($name) $column_defaults($name)
          debug [list l7policy action $l7p_actionIdx set_default]  [format "value for %s not found... setting to default of %s" $name $column_defaults($name)] 10
      }
  }

  # Skip rows with an index < 0 excluding the default rule
  if { [string tolower $column(Index)] != "default" && $column(Index) < 0 } {
    debug [list l7policy action] "skipping row, index < 0" 9
    continue
  }

  if { [string tolower $column(Index)] == "default" } {
    set l7p_action_found_default 1
  }

  #set column(Target) [string map {"\;" "\\\;"} $column(Target)]
  set l7p_action_target_list [psplit $column(Target) |]
  set l7p_action_targetIdx 0
  if { [llength $l7p_action_target_list] > 0 } {
    set l7p_action_rules($l7p_actionIdx) ""
  }

  foreach l7p_action_target $l7p_action_target_list {
    # Determine which profile is required in the policy for the specified operand
    switch -glob [string tolower $l7p_action_target] {
      asm*            { 
                        set l7p_controls("asm") 1
                        set l7p_asmrule($column(Index)) 1
                      }
      cache*          { set l7p_controls("cache") 1 }
      *compress*      { set l7p_controls("compression") 1 }
      forward*        { set l7p_controls("forwarding") 1 }
      http*           { set l7p_controls("forwarding") 1 }
      l7dos*          { 
                        set l7p_controls("l7dos") 1
                        set l7p_controls("asm") 1 
                        set l7p_l7dosrule($column(Index)) 1
                      }
      log*            { set l7p_controls("forwarding") 1 }
      request-adapt*  { set l7p_controls("request-adaption") 1 }
      response-adapt* { set l7p_controls("response-adaptions") 1 }
      server-ssl*     { set l7p_controls("server-ssl") 1 }
      tcp-nagle*      { set l7p_controls("forwarding") 1 }
      tcl*            { set l7p_controls("tcl") 1 }
      default { 
        error "Could not determine the correct profile type for L7 Policy Action, Index $column(Index), Target $column(Target)"
      }
    }

    # Process the target(s).  Multiple targets/parameters are delimited by a '|' seperator.  The '/' character 
    # gets replaced with a ' ' to build the tmsh command.  We then determine the type of target by 
    # counting the number unique target elements.  3 element targets don't require a parameter 
    # (eg: forward/request/reset). 4 element target require parameters.  We then parse the 4th element 
    # as a comma-seperated string to determine the number of unique parameters required.  The 
    # entered parameter is checked to ensure a parameters are entered (can be blank) and the the 
    # tmsh command is created.
    set l7p_action_target_chunk ""
    set l7p_action_targets [split $l7p_action_target /]
    switch [llength $l7p_action_targets] {
      3 {
        set l7p_rule_targettmp [join $l7p_action_targets " "]
        #set l7p_action_rules($l7p_actionIdx) [format "%s \{ %s \}" $l7p_action_targetIdx $l7p_rule_targettmp]
        set l7p_action_target_chunk [format "%s \{ %s \}" $l7p_action_targetIdx $l7p_rule_targettmp]
        debug [list l7policy action $l7p_actionIdx 3_elements $l7p_action_targetIdx] [format "rule=%s" $l7p_action_rules($l7p_actionIdx)] 7
       }
      4 { 
        set l7p_rule_targettmp [format "%s %s %s" [lindex $l7p_action_targets 0] [lindex $l7p_action_targets 1] [lindex $l7p_action_targets 2]]
        set l7p_rule_parameters [psplit [lindex $l7p_action_targets 3] ,]
        # Fix the list in the case that we got a reserved character
        if { [llength $column(Parameter)] == 1 } {
          set column(Parameter) [lindex $column(Parameter) 0]
        }
        #set l7p_rule_value [lindex [psplit $column(Parameter) ;] $l7p_action_targetIdx]
        set l7p_rule_values [psplit [lindex [psplit $column(Parameter) |] $l7p_action_targetIdx] ,]
        debug [list l7policy action $l7p_actionIdx val_list $l7p_action_targetIdx] $l7p_rule_values 7

        set l7p_action_parIdx 0
        
        set l7p_action_target_chunk [format "%s \{ %s " $l7p_action_targetIdx $l7p_rule_targettmp]
        foreach l7p_action_parameter $l7p_rule_parameters {
          set l7p_action_parameter_value [lindex $l7p_rule_values $l7p_action_parIdx]

          # Special handling for forward/request/select/(pool|clone-pool).  Either a full path to 
          # a pool can be entered (eg: /Common/mypool) or the index of a pool created in the pool__Pools
          # table can be referenced.  If a pool index is referenced we replace it here with the name
          # of the pool
          switch -regexp $l7p_action_target {
            ^.*(pool|clone-pool)$ {
              set l7p_action_parameter_poolidx -1 
              if { [regexp {^pool:[0-9]+$} $l7p_action_parameter_value] } {
                set l7p_action_parameter_poolidx [lindex [split $l7p_action_parameter_value :] 1]
                debug [list l7policy action $l7p_actionIdx pool_substitute] [format "idx=%s val=%s name=%s" $l7p_action_parameter_poolidx $l7p_action_parameter_value $poolNames($l7p_action_parameter_poolidx)] 7
                set l7p_action_parameter_value [format "%s/%s" $app_path $poolNames($l7p_action_parameter_poolidx)]
              } 
            }
            ^asm.*enable.*$ {
              if { [regexp {^bundled:(.*$)} $l7p_action_parameter_value -> l7p_action_parameter_asmpolicy] } {
                debug [list l7policy action $l7p_actionIdx asm_policy] [format "%s" $l7p_action_parameter_asmpolicy] 7
                if { ! [string match *$l7p_action_parameter_asmpolicy* $vs__BundledItems] } {
                  error "L7 Policy Action Rule with Index $l7p_actionIdx specified a bundled policy that wasn't selected for deployment"
                }
                #set l7p_action_parameter_asmpolicy [lindex [split $l7p_action_parameter_value :] 1]
                set l7p_action_parameter_value [format "%s/%s" $app_path $l7p_action_parameter_asmpolicy]
                # Flag deferred creation of the policy because of bundled ASM policy
                set l7p_defer_create 1
              }
            }
          }

          #append l7p_action_rules($l7p_actionIdx) [format "%s \"%s\" " $l7p_action_parameter $l7p_action_parameter_value]
          append l7p_action_target_chunk [format "%s \"%s\" " $l7p_action_parameter $l7p_action_parameter_value]
          incr l7p_action_parIdx
        }
        #append l7p_action_rules($l7p_actionIdx) "\} "
        append l7p_action_target_chunk "\} "
        debug [list l7policy action $l7p_actionIdx 4_element] [format "chunk=%s" $l7p_action_target_chunk] 7
      }
      default { error "The target $l7p_action_target could not be processed" }
    }
    append l7p_action_rules($l7p_actionIdx) $l7p_action_target_chunk
    debug [list l7policy action $l7p_actionIdx] [format "rule=%s" $l7p_action_rules($l7p_actionIdx)] 7
    incr l7p_action_targetIdx
  }
  incr l7p_actionIdx
  array unset column_defaults
}

if { [info exists l7p_controls("asm")] && ! $l7p_action_found_default } {
  error "A 'default' L7 Policy Action must be defined if you wish you use an ASM policy"
}

# Build our L7 ruleset
set l7p_cmd_rules "rules replace-all-with \{ "
for {set i 0} {$i < $l7p_matchIdx} {incr i} {
  debug [list l7policy rules $i "match "] $l7p_match_rules($i) 7
  debug [list l7policy rules $i action] $l7p_action_rules($i) 7

  # If an ASM target was selected we must add a bypass action to each action in the ruleset
  # that does not contain an ASM target
  set l7p_rule_asmdefault ""
  if { ![info exists l7p_asmrule($i)] && [info exists l7p_controls("asm")] } {
    if { [string tolower $l7policy__defaultASM] != "bypass" } {
      set l7p_rule_asmdefault [format " 1 { asm request enable policy %s } " $l7policy__defaultASM]
      set l7p_controls("asm") 1
    } else {
      set l7p_rule_asmdefault " 98 { asm request disable } "
    }
  }

  set l7p_rule_l7dosdefault ""
  if { ![info exists l7p_l7dosrule($i)] && [info exists l7p_controls("l7dos")] } {
    if { [string tolower $l7policy__defaultL7DOS] != "bypass" } {
      set l7p_rule_l7dosdefault [format " 2 { l7dos request enable from-profile %s } " $l7policy__defaultL7DOS]
      set l7p_controls("asm") 1
      set l7p_controls("l7dos") 1
    } else {    
      set l7p_rule_l7dosdefault " 99 { l7dos request disable } "
    }
  }

  set l7p_rule_default [format "%s %s" $l7p_rule_asmdefault $l7p_rule_l7dosdefault]

  set l7p_rule_condpart ""
  if { [string length $l7p_match_rules($i)] > 0 } {
    set l7p_rule_condpart [format "conditions replace-all-with \{ %s \}" $l7p_match_rules($i)]
  }
  append l7p_cmd_rules [format "%s \{ %s actions replace-all-with \{ %s %s \} ordinal %s \} " $l7p_indexes($i) $l7p_rule_condpart $l7p_action_rules($i) $l7p_rule_default [expr {$i+1}]]
}

# Finish building the tmsh command and execute it
set l7p_cmd_requires [format " requires replace-all-with { %s } " [join [array names l7p_requires] " "]]
set l7p_cmd_controls [format " controls replace-all-with { %s } " [join [array names l7p_controls] " "]]

# TMOS 12.1 introduced a new draft/publish model for L7 policies.  Check for
# that version and set a mode accordingly
if { [string match "12.1*" $version_info(version)] } {
  debug [list l7policy version_check] "12.1 or newer detected" 7
  set l7p_new_model 1 
} else {
  debug [list l7policy version_check] "12.0 or older detected" 7
  set l7p_new_model 0
}

if { $l7p_new_model } {
  if { $l7p_defer_create > 0 } {
    set l7p_cmd [format "ltm policy %s/Drafts/%s_l7policy" $app_path $app]
  } else {
    set l7p_cmd [format "ltm policy %s/Drafts/%s_l7policy legacy" $app_path $app]
  }
  set l7p_publish_cmd [format "ltm policy %s/Drafts/%s_l7policy" $app_path $app]
} else {
  set l7p_cmd [format "ltm policy %s/%s_l7policy" $app_path $app]
  set l7p_defer_cmd $l7p_cmd
}

append l7p_cmd [format " strategy %s %s %s %s \}" $l7policy__strategy $l7p_cmd_requires $l7p_cmd_controls $l7p_cmd_rules]
debug [list l7policy l7p_cmd] $l7p_cmd 7

if { $l7p_matchIdx > 0 && $l7p_actionIdx > 0 } {
  if { $l7p_defer_create > 0 } {
    debug [list l7policy defer_create] $l7p_cmd 1
    set l7p_cmd_create [format "tmsh::create %s" $l7p_cmd]
    set l7p_cmd_modify [format "tmsh::modify %s" $l7p_cmd]
    
    lappend bundler_deferred_cmds [format "catch { %s }" [create_escaped_tmsh $l7p_cmd_modify]]
    lappend bundler_deferred_cmds [format "catch { %s }" [create_escaped_tmsh $l7p_cmd_create]]
	
    if { $l7p_new_model } {
    	lappend bundler_deferred_cmds [format "catch { tmsh::publish %s }" [create_escaped_tmsh $l7p_publish_cmd]]
    }
	
    lappend bundler_deferred_cmds [format "catch { %s }" [create_escaped_tmsh [format "tmsh::modify ltm virtual %s/%s profiles add \{ /Common/websecurity \{ \} \}" $app_path $vs__Name]]]
    lappend bundler_deferred_cmds [format "catch { %s }" [create_escaped_tmsh [format "tmsh::modify ltm virtual %s/%s policies add \{ %s/%s_l7policy \}" $app_path $vs__Name $app_path $app]]]
  } else {
    debug [list l7policy tmsh_create] $l7p_cmd 1
    tmsh::create $l7p_cmd
	if { $l7p_new_model } {
		debug [list l7policy tmsh_publish] $l7p_publish_cmd 1
		tmsh::publish $l7p_publish_cmd
	}
	
    # Add the created policy to the vs__AdvPolicies variable so we attach it to the 
    # Virtual Server when it's created.
    append vs__AdvPolicies [format " %s/%s_l7policy " $app_path $app]
    debug [list l7policy add_policy_to_vs] [format "vs__AdvPolicies=%s" $vs__AdvPolicies] 5
  }
} else {
  debug [list l7policy skip_creation] "No valid actions or rules after processing, skipping creation" 7
}

# Call the custom_extensions_before_vs proc to allow site-specific customizations
custom_extensions_before_vs

# Create virtual Server
# Process the 'auto' flag for feature__redirectToHTTPS
if { $feature__redirectToHTTPS eq "auto" && $pool__port eq "443" && $pool__addr ne "255.255.255.254"} {
  debug [list virtual_server feature__redirectToHTTPS] "found auto flag and port is 443, setting feature to enabled" 5
  set feature__redirectToHTTPS enabled
}

# Process the 'auto' flag for feature__insertXForwardedFor
if { $feature__insertXForwardedFor eq "auto" && [expr {$pool__port eq "443" || $pool__port eq "80"}] && $vs__SNATConfig ne ""} {
  debug [list virtual_server feature__insertXForwardedFor] "found auto flag, port is 443 or 80 and SNAT enabled, setting feature to enabled" 5
  set feature__insertXForwardedFor enabled
}

# Process the vs__ProfileSecurityIPBlacklist option.
set ipi_mode 0
switch -glob [string tolower $vs__ProfileSecurityIPBlacklist] {
  enabled-block { set ipi_action "drop" }
  enabled-log   { set ipi_action "accept" }
  none          { set ipi_mode 0 }
  /*            { set ipi_mode 2 }
  default { 
    set ipi_create 0 
    set vs__ProfileSecurityIPBlacklist none
  }
}

# Process feature__easyL4Firewall options
set afm_auto_ipistring ""
if { [is_provisioned afm] } {
  switch [string tolower $feature__easyL4Firewall] {
    auto {
      debug [list virtual_server feature__easyL4Firewall] "found auto option, setting feature to enabled" 5
      set feature__easyL4Firewall enabled
      set afm_auto_ipistring "none"
    }
    base { 
      debug [list virtual_server feature__easyL4Firewall] "found base flag, setting feature to enabled, vs__ProfileSecurityIPBlacklist to disabled" 5
      set feature__easyL4Firewall enabled
      set afm_auto_ipistring "none"
    }
    base+ip_blacklist_block { 
      debug [list virtual_server feature__easyL4Firewall] "found auto option, setting feature to enabled, vs__ProfileSecurityIPBlacklist to enabled-block" 5
      set feature__easyL4Firewall enabled
      set afm_auto_ipistring "enabled-block"
    }
    base+ip_blacklist_log { 
      debug [list virtual_server feature__easyL4Firewall] "found base+ipblacklist_log option, setting feature to enabled, vs__ProfileSecurityIPBlacklist to enabled-log" 5
      set feature__easyL4Firewall enabled
      set afm_auto_ipistring "enabled-log"
    }
    default { 
      if { [get_var feature__easyL4Firewall] == "auto"} {
        set afm_auto_ipistring "none"
      }
      set feature__easyL4Firewall disabled 
    }
  }
  if { $ipi_mode < 2 } {
    change_var vs__ProfileSecurityIPBlacklist $afm_auto_ipistring
  }
} else {
  debug [list virtual_server feature__easyL4Firewall] "AFM not provisioned, skipping" 5
  if { $feature__easyL4Firewall != "auto" } {
    change_var feature__easyL4Firewall disabled
  }
  set feature__easyL4Firewall disabled
}

# Check for HTTP Strict Transport Security (HSTS) option.  We do this here 
# so the irule can be easily appended to the existing iRule list
if { $clientssl > 0 && [string match enabled* $feature__securityEnableHSTS] } {
  # include iRules used for feature__securityEnableHSTS
  set irule_HSTS { 
    %insertfile:include/feature_securityEnableHSTS.irule% 
  }; # end irule_HSTS
  set irule_HSTS_redirect { 
    %insertfile:include/feature_securityEnableHSTS_redirect.irule% 
  }; 
  
  debug [list virtual_server feature__securityEnableHSTS] "creating HSTS iRule" 5
  set hstsrule [format "%s/hsts_irule" $app_path]

  # Substitute in HSTS options is specified
  switch [string tolower $feature__securityEnableHSTS] {
    enabled-preload { set hstsoptions "\; preload" }
    enabled-subdomain { set hstsoptions "\; includeSubDomains" }
    enabled-preload-subdomain { set hstsoptions "\; includeSubDomains\; preload" }
    default { set hstsoptions "" }
  }

  set irule_HSTS_final [string map [list %HSTSOPTIONS% $hstsoptions] $irule_HSTS]

  set hstscmd "ltm rule $hstsrule $irule_HSTS_final"
  debug [list virtual_server feature__securityEnableHSTS tmsh_create] $hstscmd 1
  tmsh::create $hstscmd

  if { $feature__redirectToHTTPS eq "enabled"} {
    debug [list virtual_server feature__securityEnableHSTS ssl_redirect_check] "feature_redirectToHTTPS enabled, creating HSTS redirect iRule" 5
    set hstsredirectrule [format "%s/hsts_redirect_irule" $app_path]
    set hstsredirectcmd "ltm rule $hstsredirectrule $irule_HSTS_redirect"
    debug [list virtual_server feature__securityEnableHSTS tmsh_create] $hstsredirectcmd 1
    tmsh::create $hstsredirectcmd
  }
  
  if { [string length $vs__Irules] > 0 } {
    append vs__Irules ",$hstsrule"
  } else {
    set vs__Irules $hstsrule
  }
  debug [list virtual_server feature__securityEnableHSTS add_irule_to_vs] [format "vs__Irules=%s" $vs__Irules] 7
}

set cmd [format "ltm virtual %s/%s " $app_path $vs__Name]

# Setup our listener destination address
set vs_dest_addr [get_dest_addr $pool__addr]

# Keep vs_dest_addr as is for use by other features, create vs_dest with full <ip>%<rd>:<port> format
set vs_dest [get_dest_str $vs_dest_addr $pool__port]

debug [list virtual_server set_dest] [format "vs_dest_addr=%s vs_dest=%s" $vs_dest_addr $vs_dest] 7

# Set virtual server options we support.  This array assumes a format " <option> <input value>" for the TMSH command.
array set vs_options {
 "pool__mask" "mask"
 "vs_dest" "destination"
 "vs__IpProtocol" "ip-protocol"
 "vs__ConnectionLimit" "connection-limit"
 "vs__Description" "description"
 "vs__SourceAddress" "source"
 "vs__OptionSourcePort" "source-port"
 "vs__OptionConnectionMirroring" "mirror"
 "vs__ProfileFallbackPersist" "fallback-persistence"
 "vs__ProfilePerRequest" "per-flow-request-access-policy"
}

if { [string length $default_pool_name] > 0 } {
  set vs_options(default_pool_name) "pool"
}

# Set virtual server options we support.  This array allows specifcation of the specific TMSH command format
array set vs_options_custom {
 "vs__Irules" " rules \{ %s \} "
 "vs__ProfileDefaultPersist" " persist replace-all-with \{ %s \} "
 "vs__ProfileSecurityLogProfiles" " security-log-profiles replace-all-with \{ %s \} "
}

handle_opt_remove_on_redeploy vs__ProfilePerRequest "" "per-flow-request-access-policy" "apm"
handle_opt_remove_on_redeploy vs__ProfileSecurityIPBlacklist "none" "ip-intelligence-policy" "ltm"

# Process the vs__ProfileSecurityIPBlacklist option according to $ipi_mode set above
if { $ipi_mode == 1 } {
  debug [list virtual_server ip_blacklist create] [format "ipi_action=%s, creating IPI policy" $ipi_action] 7
  set ipi_name [create_obj_name "ip_blacklist"]
  set ipi_cmd [format "security ip-intelligence policy %s default-action %s default-log-blacklist-hit-only yes" $ipi_name $ipi_action]
  debug [list virtual_server ip_blacklist tmsh_create] $ipi_cmd 1
  tmsh::create $ipi_cmd
  set vs__ProfileSecurityIPBlacklist $ipi_name
  array set vs_options [list vs__ProfileSecurityIPBlacklist ip-intelligence-policy]
} 

if { $ipi_mode == 2 } {
  debug [list virtual_server ip_blacklist associate] [format "adding existing IPI policy %s" $vs__ProfileSecurityIPBlacklist] 7
  array set vs_options [list vs__ProfileSecurityIPBlacklist ip-intelligence-policy]
}

# Process the feature__easyL4Firewall option
handle_opt_remove_on_redeploy feature__easyL4Firewall "disabled" "fw-enforced-policy" "afm"

if { $feature__easyL4Firewall == "enabled" } {
  debug [list virtual_server l4_firewall] "creating FW policy" 5

  set cidr_blacklist [single_column_table_to_list $feature__easyL4FirewallBlacklist "CIDRRange"]
  debug [list virtual_server l4_firewall cidr_blacklist] $cidr_blacklist 7

  set cidr_sourcelist [single_column_table_to_list $feature__easyL4FirewallSourceList "CIDRRange"]
  debug [list virtual_server l4_firewall cidr_sourcelist] $cidr_sourcelist 7

  if { [llength $cidr_blacklist] > 0 } {
    debug [list virtual_server l4_firewall create_blacklist] "creating static blacklist address-list" 7
    set feature_easyL4Firewall_blacklistcmd [format "security firewall address-list %s/afm_staticBlacklist addresses replace-all-with { %s }" \
     $app_path [join $cidr_blacklist " "]]

    debug [list virtual_server l4_firewall create_blacklist tmsh_create] $feature_easyL4Firewall_blacklistcmd 1
    tmsh::create $feature_easyL4Firewall_blacklistcmd
    set feature_easyL4Firewall_blacklisttmpl [format "staticBlacklist { action drop source { address-lists replace-all-with { %s/afm_staticBlacklist } } }" $app_path]
  } else {
    set feature_easyL4Firewall_blacklisttmpl ""
  }

  if { [llength $cidr_sourcelist] > 0 } {
    debug [list virtual_server l4_firewall create_sourcelist] "creating source address-list" 7
    set feature_easyL4Firewall_srclistcmd [format "security firewall address-list %s/afm_sourceList addresses replace-all-with { %s }" \
     $app_path [join $cidr_sourcelist " "]]

    debug [list virtual_server l4_firewall create_sourcelist tmsh_create] $feature_easyL4Firewall_srclistcmd 1
    tmsh::create $feature_easyL4Firewall_srclistcmd
  } else {
    debug [list virtual_server l4_firewall create_sourcelist] "creating DEFAULT source address-list" 7
    set feature_easyL4Firewall_srclistcmd [format "security firewall address-list %s/afm_sourceList addresses replace-all-with { 0.0.0.0/0 }" $app_path]

    debug [list virtual_server l4_firewall create_sourcelist tmsh_create] $feature_easyL4Firewall_srclistcmd 1
    tmsh::create $feature_easyL4Firewall_srclistcmd
  }
  set feature_easyL4Firewall_srclist [format "%s/afm_sourceList" $app_path]

  set fw_name [create_obj_name "firewall"]
  set fw_cmd [format ""]
  set fw_tmpl {
%insertfile:include/feature_easyL4Firewall.tmpl%
  };

  set tmpl_map [list %NAME%             $fw_name \
                     %IP_PROTOCOL%      $vs__IpProtocol \
                     %STATIC_BLACKLIST% $feature_easyL4Firewall_blacklisttmpl \
                     %SOURCE_LIST%      $feature_easyL4Firewall_srclist ]

  set fw_policy [string map $tmpl_map $fw_tmpl]
  debug [list virtual_server l4_firewall tmsh_create] $fw_policy 1
  tmsh::create $fw_policy
  array set vs_options [list fw_name fw-enforced-policy]  
}

# Process bundled iRules
set vs__BundledItems [string map {"," " " ";" " "} $vs__BundledItems]
set bundled_irules [get_items_starting_with "irule:" $vs__BundledItems]
debug [list virtual_server bundled_irule get_list] [format "%s" $bundled_irules] 7

if { [llength $bundled_irules] > 0 } { 
  set bundled_irule_map [list %APP_PATH%      $app_path \
                             %APP_NAME%      $app \
                             %VS_NAME%       $vs__Name \
                             %POOL_NAME%     $default_pool_name \
                             %PARTITION%     $partition ]

  foreach bundled_irule $bundled_irules {
    debug [list virtual_server bundled_irule create_irule] [format "deploying bundled iRule %s" $bundled_irule] 5

    if { [string match "irule:url=*" $bundled_irule] } {
      set bundled_irule_isurl 1
      set bundled_irule_url [string map {"irule:url=" ""} $bundled_irule]

      regexp {^.*/(.*).irule$} $bundled_irule_url -> bundled_irule
      set bundled_irule_filename [format "/var/tmp/appsvcs_irule_%s_%s_%s.irule" $::app $bundled_irule $bundler_timestamp]
      curl_save_file $bundled_irule_url $bundled_irule_filename
      set bundled_irule_fh [open $bundled_irule_filename]
      set bundled_irule_src [string map $bundled_irule_map [read $bundled_irule_fh]]
      close $bundled_irule_fh
      file delete $bundled_irule_filename
    } else { 
      if {! [info exists bundler_objects($bundled_irule)] } {
        error "A bundled iRule named '$bundled_irule' was not found in the template"
      }
      set bundled_irule_src [string map $bundled_irule_map [::base64::decode $bundler_data($bundled_irule)]]
      set bundled_irule [string map {"irule:" ""} $bundled_irule]
    }

    set bundled_irule_cmd [format "ltm rule %s/%s \{%s\}" $app_path $bundled_irule $bundled_irule_src]
    debug [list virtual_server bundled_irule $bundled_irule tmsh_create] $bundled_irule_cmd 1
    tmsh::create $bundled_irule_cmd
    if { [string length $vs__Irules] > 0 } {
      append vs__Irules ","
    }
    append vs__Irules [format "%s/%s" $app_path $bundled_irule]
  }
  debug [list virtual_server bundled_irule add_irule_to_vs] [format "vs__Irules=\"%s\"" $vs__Irules] 7
}

# Process the vs_options array
foreach {optionvar optioncmd} [array get vs_options] {
  append cmd [generic_add_option [list virtual_server options] [set [subst $optionvar]] $optioncmd "" 0]
}

# Process the vs_options_custom array
foreach {optionvar optioncmd} [array get vs_options_custom] {
  append cmd [generic_add_option [list virtual_server options_custom] [set [subst $optionvar]] "" $optioncmd 1]
}

if { [string length $vs__AdvOptions] > 0 } {
  debug [list virtual_server adv_options] "processing advanced options string" 7
  append cmd [format " %s" [process_options_string $vs__AdvOptions "" ""]]
}

set snatcmd ""
# Add SNAT options
if { [string length $vs__SNATConfig] > 0 } {
  switch -glob [string tolower $vs__SNATConfig] {
    automap { 
      append snatcmd " source-address-translation \{ type automap \}" 
    }
    partition-default { 
      append snatcmd [format " source-address-translation \{ pool /%s/%s type snat \}" $partition $partition] 
    }
    none { 
      append snatcmd " source-address-translation \{ type none \}" 
    }
    create:* {
      # split a string formatted like this: "<ip>[,<ip1>]"
      set create_snat_iplist [split [lindex [split $vs__SNATConfig :] 1] ,]
      set create_snat_poolname [format "%s/%s_snatpool" $app_path $app]
      set create_snat_poolcmd [format "ltm snatpool %s members replace-all-with { " $create_snat_poolname]
      foreach ip $create_snat_iplist {
        append create_snat_poolcmd [format " %s%%%s " $ip $rd]
      }
      append create_snat_poolcmd "} "
      debug [list virtual_server snat create_snat_pool tmsh_create] $create_snat_poolcmd 1
      tmsh::create $create_snat_poolcmd
      append snatcmd [format " source-address-translation \{ pool %s type snat \}" $create_snat_poolname] 
    }
    default {
          tmsh::get_config /ltm snatpool $vs__SNATConfig
          append snatcmd [format " source-address-translation \{ pool %s type snat \}" $vs__SNATConfig]
    }
  }
  debug [list virtual_server snatcmd] $snatcmd 7
}
append cmd $snatcmd

# Process feature__insertXForwardedFor
if { $feature__insertXForwardedFor eq "enabled"} {
  if { [regexp -nocase {^create:} $vs__ProfileHTTP] } {
    if { ! [regexp -nocase {insert-xforwarded-for=enabled} $vs__ProfileHTTP] } {
      debug [list virtual_server feature__insertXForwardedFor append] "Appending insert-xforwarded-for=enabled to existing HTTP profile customization string" 5
      append vs__ProfileHTTP ";insert-xforwarded-for=enabled"
    } else {
      debug [list virtual_server feature__insertXForwardedFor ignore] "insert-xforwarded-for=enabled alredy in HTTP profile customization string... doing nothing" 5
    }
  } else {
    debug [list virtual_server feature__insertXForwardedFor create] [format "Creating HTTP profile customization string \"create:insert-xforwarded-for=enabled;defaults-from=%s\"" $vs__ProfileHTTP] 5
    set vs__ProfileHTTP [format "create:insert-xforwarded-for=enabled;defaults-from=%s" $vs__ProfileHTTP]
  }
}

# Process the create: option for profiles in the array below.  
# Profiles that we support the "create:option=value[,option2=value2]" format for option customization
array set create_supported {
 "vs__ProfileClientProtocol" { tmsh "tcp" default "/Common/tcp-wan-optimized" append "_clientside" }
 "vs__ProfileServerProtocol" { tmsh "tcp" default "/Common/tcp-lan-optimized" append "_serverside"}
 "vs__ProfileHTTP" { tmsh "http" default "/Common/http" append ""}
 "vs__ProfileOneConnect" { tmsh "one-connect" default "/Common/oneconnect" append ""}
 "vs__ProfileCompression" { tmsh "http-compression" default "/Common/httpcompression" append ""}
 "vs__ProfileRequestLogging" { tmsh "request-log" default "/Common/request-log" append ""}
 "vs__ProfileServerSSL" { tmsh "server-ssl" default "/Common/serverssl" append ""}
}

foreach {profilevar} [array names create_supported] {
  array set profile_attr [subst $::create_supported($profilevar)]
  array set create_options {}
  set profilecmd $profile_attr(tmsh)
  set profiledefault $profile_attr(default)
  set profileval [set [subst $profilevar]]
  set profileappend $profile_attr(append)
  set profilename [format "%s_%s%s" $app $profilecmd $profileappend]
  set profilestr [format "ltm profile %s %s/%s " $profilecmd $app_path $profilename]
  if { [regexp -nocase {^create:} $profileval] } {
    set defaultfound 0
    set kvpstring [string map {"create\:" ""} $profileval]
    debug [list virtual_server profiles create_handler] [format "processing create for %s=%s" $profilevar $profileval] 7

    # Get all the options passed in array format
    array set create_options [process_kvp_string $kvpstring]

    # Get the supported options for a profile type according to the 'default' key in the create_supported array
    set profileobj [lindex [tmsh::get_config ltm profile $profilecmd $profiledefault all-properties] 0]
    foreach {option value} [array get create_options] {
      if { [is_valid_profile_option $profileobj $option] == 0 } {
        error "The option \"$option\" for $profilecmd profile is not valid"
      }
      if { $option == "defaults-from" } {
        set defaultfound 1
      }
      append profilestr [format "%s \"%s\" " $option $value]
    }
    array unset create_options
    if { $defaultfound == 0 } {
      append profilestr [format "defaults-from %s " $profiledefault]
    }
    set [subst $profilevar] [format "%s/%s" $app_path $profilename]
    debug [list virtual_server profiles create_handler tmsh_create] [format "%s; %s=%s" $profilestr $profilevar [set [subst $profilevar]]] 1
    tmsh::create $profilestr
  }
}

# Add profiles
set vsprofiles " profiles replace-all-with  \{ "
debug [list virtual_server profiles] [format "adding base vsprofiles=%s" $vsprofiles] 7

# We have to specify context aware profiles first
# Figure out the correct context to apply protocol profiles
set clientContext "all"
set serverContext "all"

if { [string length $vs__ProfileClientProtocol] > 0 && [string length $vs__ProfileServerProtocol] > 0 && $vs__ProfileClientProtocol ne $vs__ProfileServerProtocol } {
  debug [list virtual_server profiles protocol] "got both client and server protocol profiles" 7
  set clientContext "clientside"
  set serverContext "serverside"
} 

# Client-side protocol
if { [string length $vs__ProfileClientProtocol] > 0 } {
  append vsprofiles [format " %s \{ context %s \}" $vs__ProfileClientProtocol $clientContext]
  debug [list virtual_server profiles protocol] [format "clientside protocol name=%s context=%s" $vs__ProfileClientProtocol $clientContext] 7
}

# Server-side protocol
if { [string length $vs__ProfileServerProtocol] > 0 && $vs__ProfileClientProtocol ne $vs__ProfileServerProtocol } {
  append vsprofiles [format " %s \{ context %s \}" $vs__ProfileServerProtocol $serverContext]
  debug [list virtual_server profiles protocol] [format "serverside protocol name=%s context=%s" $vs__ProfileServerProtocol context=$serverContext] 7
}


# Set virtual server profiles we support.  The tmsh format expected is: 
#    profiles replace-all-with { <profile1> [ { context [clientside|serverside|all] } ] <profile2> } 
# To achieve this while re-using generic_add_option() we simply pass the var name with a blank option string
# Profiles that specify a proxy context can be specified in the vs_profiles_contextual array with the value
#   specifying the proxy context
array set vs_profiles_contextual {
   "vs__ProfileConnectivity" "clientside"
}

array set vs_profiles {
 "vs__ProfileHTTP" ""
 "vs__ProfileOneConnect" ""
 "vs__ProfileCompression" ""
 "vs__ProfileAnalytics" ""
 "vs__ProfileRequestLogging" ""
 "vs__ProfileServerSSL" ""
 "vs__ProfileSecurityDoS" ""
}

# Handle the 'use-bundled' value for the VS Access Profile
# The bundler code will 
set bundler_apm_associate 0
if { $vs__ProfileAccess eq "use-bundled" } {
  set bundler_apm_associate 1
} else {
  set vs_profiles(vs__ProfileAccess) ""
}

# Save the base profile string for later use by feature__redirectToHTTPS
if { $feature__redirectToHTTPS eq "enabled"} {
  set vsprofiles_redirect $vsprofiles
}

# Client-SSL profile created by iApp
if { $clientssl == 1 } {
  set vs__ProfileClientSSL [format "%s/%s_clientssl" $app_path $app]
  set vs_profiles(vs__ProfileClientSSL) ""
  debug [list virtual_server client_ssl associate_created] [format "name=%s" $vs__ProfileClientSSL] 7
}

# Client-SSL profile specified via vs__ProfileClientSSL
if { $clientssl == 2 } {
  set vs_profiles(vs__ProfileClientSSL) ""
  debug [list virtual_server client_ssl associate_existing] [format "name=%s" $vs__ProfileClientSSL] 7
}

# Process the vs_profiles_contextual array first to make sure profiles that require a proxy
# context are added first
foreach {optionvar optioncmd} [array get vs_profiles_contextual] {
  append vsprofiles [generic_add_option [list virtual_server options] [set [subst $optionvar]] "" " %s { context $optioncmd } " 0]
}

# Process the vs_profiles array to build the profiles command
foreach {optionvar optioncmd} [array get vs_profiles] {
  append vsprofiles [generic_add_option [list virtual_server options] [set [subst $optionvar]] $optioncmd "" 0]
}

if { [string length $vs__AdvProfiles] > 0 } {
  debug [list virtual_server adv_options] "processing advanced profile string" 7
  append vsprofiles [format " %s" [generic_add_option [list virtual_server adv_profiles] $vs__AdvProfiles "" "%s" 1]]    
}

append vsprofiles " \}"
debug [list virtual_server profiles cmd] $vsprofiles 7

# Add the profile string to the TMSH command
append cmd $vsprofiles

# Process the $vs__AdvPolicies option
if { [string length $vs__AdvPolicies] > 0 } {
  debug [list virtual_server adv_policies] "processing advanced policies string" 7
  # Add the polcies string to the TMSH command
  set vspolicies [format " policies replace-all-with \{ %s \} " [generic_add_option [list virtual_server adv_policies] $vs__AdvPolicies "" "%s" 1]] 
  debug [list virtual_server adv_policies cmd] $vspolicies 7
  append cmd $vspolicies
}

# Create the virtual server

set stats_vs 0
if { $pool__addr ne "255.255.255.254" } {
  debug [list virtual_server tmsh_create] $cmd 1
  tmsh::create $cmd
  set stats_vs 1

  # Process the additional listeners table
  set redirect_listeners []
  lappend redirect_listeners [format "%s:80" $vs_dest_addr]

  set vs_origcmd $cmd
  set vs_listener_list [single_column_table_to_list $vs__Listeners "Listener"]
  set vs_listener_idx 0
  foreach vs_listener $vs_listener_list {
    set vs_listener [lindex $vs_listener 0]
    debug [list virtual_server add_listeners $vs_listener_idx] $vs_listener 7
    
    # If this row had the ';redirect' option specified save it for later and skip this row
    if { [string match "*\;redirect" $vs_listener] } {
      set vs_listener [string map {"\;redirect" ""} $vs_listener]
      debug [list virtual_server add_listeners redirect] $vs_listener 7
      lappend redirect_listeners $vs_listener
      continue
    }

    # Setup our new tmsh command string
    set vs_listener_name [format "%s_%s" $vs__Name $vs_listener_idx]
    regexp {^(.*)[:.](\d{1,5})$} $vs_listener --> vs_listener_addr vs_listener_port

    set vs_listener_dest [get_dest_str $vs_listener_addr $vs_listener_port]

    debug [list virtual_server add_listeners $vs_listener_idx] [format "name=%s addr=%s port=%s dest=%s" $vs_listener_name $vs_listener_addr $vs_listener_port $vs_listener_dest] 7    
    set vs_listener_cmd [string map [list $vs__Name $vs_listener_name "$vs_dest_addr:$pool__port" $vs_listener_dest] $vs_origcmd]
    # If our listener address is IPv6 we need to fixup the VS source filter and destination mask 
    if { [is_ipv6 $vs_listener_addr] } {
      set vs_listener_cmd [string map [list $vs__SourceAddress [format "::%%%s/0" $rd]] $vs_listener_cmd]
      set vs_listener_cmd [string map [list $pool__mask [format "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff" $pool__mask]] $vs_listener_cmd]
    } 

    debug [list virtual_server add_listeners $vs_listener_idx tmsh_create] $vs_listener_cmd 1
    tmsh::create $vs_listener_cmd
    incr vs_listener_idx
  }
} else {
  debug [list virtual_server skip_create] "found 255.255.255.254 as pool__addr, skipping creation" 2
}

# Call the custom_extensions_after_vs proc to allow site-specific customizations
custom_extensions_after_vs

# Create and additional virtual server on port 80 for feature__redirectToHTTPS
if { $feature__redirectToHTTPS eq "enabled" && $pool__addr ne "255.255.255.254" } {
  set redirect_listener_idx 0
  foreach redirect_listener $redirect_listeners {
    regexp {^(.*)[:.](\d{1,5})$} $redirect_listener --> redirect_listener_addr redirect_listener_port


    set redirect_listener_dest [get_dest_str $redirect_listener_addr $redirect_listener_port]
    debug [list virtual_server feature__redirectToHTTPS $redirect_listener_idx] [format "creating redirect virtual server on %s" $redirect_listener_dest] 5
    
    array set redirect_listener_options {
     "redirect_listener_mask" "mask"
     "redirect_listener_src" "source"
     "vs__IpProtocol" "ip-protocol"
    }

    if { [is_ipv6 $redirect_listener_addr] } {
      set redirect_listener_src [format "::0.0.0.0%%%s/0" $rd]
      set redirect_listener_mask "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"
    } else {
      set redirect_listener_src $vs__SourceAddress
      set redirect_listener_mask "255.255.255.255"      
    }

    set redirect_listener_cmd [format "ltm virtual %s/%s_redirect_%s destination %s " $app_path $vs__Name $redirect_listener_idx $redirect_listener_dest]

    # Process the vs_options array
    foreach {optionvar optioncmd} [array get redirect_listener_options] {
      append redirect_listener_cmd [generic_add_option [list virtual_server feature__redirectToHTTPS $redirect_listener_idx options] [set [subst $optionvar]] $optioncmd "" 0]
    }

    # The HSTS spec recommends that when redirected a 301 Redirect is used, rather than a 302 like _sys_https_redirect uses
    if { [string match "enabled*" $feature__securityEnableHSTS] } {
      debug [list virtual_server feature__redirectToHTTPS $redirect_listener_idx hsts_check] [format "feature__securityEnableHSTS is enabled, using %s" $hstsredirectrule] 5
      append redirect_listener_cmd " rules { $hstsredirectrule } "
    } else {
      append redirect_listener_cmd " rules { /Common/_sys_https_redirect } "
    }

    append redirect_listener_cmd $vsprofiles_redirect
    append redirect_listener_cmd [generic_add_option [list virtual_server feature__redirectToHTTPS $redirect_listener_idx options] $vs__ProfileHTTP "" "" 0]
    append redirect_listener_cmd " \}"
    debug [list virtual_server feature__redirectToHTTPS $redirect_listener_idx tmsh_create] $redirect_listener_cmd 1
    tmsh::create $redirect_listener_cmd
    incr redirect_listener_idx
  }
}

# Create iCall statistics publisher
# CAVEATS: This is mode specific because $app_stats is not set unless deployment
# is driven by BIG-IQ.  To accomodate all use cases we make this mode specific:
# mode=1 (Standalone) : Look at $iapp__appStats from the presentation layer to control creation
# mode=2 (BIGIQ Cloud): Look at $app_stats set by BIG-IQ to control creation
# mode=3 (APIC)       : Look at $app_stats set by BIG-IQ to control creation
debug [list stats] [format "mode=%s app_stats=%s iapp__appStats=%s" $mode $app_stats $iapp__appStats] 7
if { (($mode == 2 || $mode == 3 || $mode == 4) && $app_stats eq "enabled") || ($mode == 1 && $iapp__appStats eq "enabled") } {
  # Create the iCall stats publisher
  debug [list stats] "creating icall stats publisher" 7
      # START EMBEDDED ICALL SCRIPT
  set icall_script_tmpl {
%insertfile:include/base_statistics_script.icall%
  }; # END EMBEDDED ICALL SCRIPT

  set stats_pool 0
  if { $poolCount > 0 && $default_pool_name ne "" } {
    set stats_pool 1
  }

  if { [expr {$feature__statsHTTP eq "enabled" || $feature__statsHTTP eq "auto"}] && [string length $vs__ProfileHTTP] > 0 } {
    debug [list stats feature_statsHTTP] "enabling HTTP stats" 7
    set feature__statsHTTP 1
  } else {
    set feature__statsHTTP 0
  }

  if { [expr {$feature__statsTLS eq "enabled" || $feature__statsTLS eq "auto"}] && [string length $vs__ProfileClientSSL] > 0 } {
    debug [list stats feature_statsTLS] "enabling TLS stats" 7
    set feature__statsTLS 1
  } else {
    set feature__statsTLS 0
  }
  
  # used to fill in variables within iCall script
  set script_map [list %APP_NAME%      $app \
                       %VS_NAME%       $vs__Name \
                       %POOL_NAME%     $default_pool_name \
                       %PARTITION%     $partition \
                       %POOL_ENABLED%  $stats_pool \
                       %VS_ENABLED%    $stats_vs \
                       %HTTP_ENABLED%  $feature__statsHTTP \
                       %HTTP_PROFILE%  [format "%s" $vs__ProfileHTTP] \
                       %SSL_ENABLED%   $feature__statsTLS \
                       %SSL_PROFILE%   [format "%s" $vs__ProfileClientSSL] ]

  set icall_script_src [string map $script_map $icall_script_tmpl]
  debug [list stats icall_src] $icall_script_src 10

  debug [list stats icall_script tmsh_create] "publish_stats script" 1
  tmsh::create sys icall script publish_stats definition \{ $icall_script_src \}
  debug [list stats icall_handler tmsh_create] "iCall handler" 1
  tmsh::create sys icall handler periodic publish_stats interval 60 script publish_stats
}

# Process deferred deployment bundled ASM policies
set bundler_asm_policies [get_items_starting_with "asm:" $vs__BundledItems]
set bundler_apm_policies [get_items_starting_with "apm:" $vs__BundledItems]
set bundler_asm_deploy []
set bundler_apm_deploy []
set bundler_all_deploy 0
set postdeploy_final_state 1

# First perform all our checks
if { [llength $bundler_asm_policies] > 0 } { 
  if { ![is_provisioned asm]} {
    error "A bundled ASM policy was selected, however, the ASM module is not provisioned on this device" 
  }

  if { [string length $vs__ProfileHTTP] == 0 } {
    error "A HTTP Profile is required to use ASM functionality"
  }
}

if { [llength $bundler_apm_policies] > 1 } {
  error "Only one bundled APM policy may be selected for deployment"
}

if { [llength $bundler_apm_policies] == 1 } { 
  if { ![is_provisioned apm]} {
    error "A bundled APM policy was selected, however, the APM module is not provisioned on this device" 
  }
  if { [string length $vs__ProfileHTTP] == 0 } {
    error "A HTTP Profile is required to use APM functionality"
  }
}

# Process deferred deployment bundled ASM policies
set bundler_asm_mode 0
if { [llength $bundler_asm_policies] > 0 } { 
  foreach bundled_asm $bundler_asm_policies {
    set bundled_asm_isurl 0
    if { [string match "asm:url=*" $bundled_asm] } {
      set bundled_asm_isurl 1
      set bundled_asm_url [string map {"asm:url=" ""} $bundled_asm] 
      regexp {^.*/(.*).xml$} $bundled_asm_url -> bundled_asm_stripped
      set bundled_asm_filename [format "/var/tmp/appsvcs_asm_%s_%s_%s.xml" $::app $bundled_asm_stripped $bundler_timestamp]
    } else {
      set bundled_asm_stripped [string map {"asm:" ""} $bundled_asm]
      set bundled_asm_filename [format "/var/tmp/appsvcs_asm_%s_%s_%s.xml" $::app $bundled_asm_stripped $bundler_timestamp]
    }

    debug [list bundler asm check_preserve] [format "%s %s" $bundled_asm [string match *$bundled_asm* [get_items_starting_with "asm:" [get_var vs__BundledItems]]]] 7
    if { $newdeploy || \
         [expr { $redeploy && [string match redeploy* $iapp__asmDeployMode]}] || \
         [expr { $redeploy && [string match *$bundled_asm* [get_items_starting_with "asm:" [get_var vs__BundledItems]]]}] == 0 } {
      debug [list bundler asm deploy] $bundled_asm 5
      set bundler_asm_mode 1

      if { $bundled_asm_isurl } {
        curl_save_file $bundled_asm_url $bundled_asm_filename
      } else {
        if {! [info exists bundler_objects($bundled_asm)] } {
          error "A bundled ASM policy named '$bundled_asm' was not found in the template"
        }

        set outfile [open $bundled_asm_filename w]
        puts -nonewline $outfile [::base64::decode $bundler_data($bundled_asm)]
        close $outfile
      }
    } else {
      set bundler_asm_mode 2
      set savecmd [format "asm policy %s/%s min-xml-file %s" $app_path $bundled_asm_stripped $bundled_asm_filename]
      debug [list bundler asm preserve] [format "preserving existing policy... save to %s" $bundled_asm_filename] 5
      debug [list bundler asm preserve tmsh_save] $savecmd 1
      tmsh::save $savecmd
    }
    lappend bundler_asm_deploy $bundled_asm_stripped
    incr bundler_all_deploy
  }
}

# Process deferred deployment bundled APM policies
set bundler_apm_mode 0

if { [llength $bundler_apm_policies] == 1 } { 
  set bundled_apm [lindex $bundler_apm_policies 0]

  set bundled_apm_isurl 0
  if { [string match "apm:url=*" $bundled_apm] } {
    set bundled_apm_isurl 1
    set bundled_apm_url [string map {"apm:url=" ""} $bundled_apm] 
    regexp {^.*/(.*).tar.gz$} $bundled_apm_url -> bundled_apm_stripped
    set bundled_apm_filename [format "/var/tmp/appsvcs_apm_%s_%s_%s.tar.gz" $::app $bundled_apm_stripped $bundler_timestamp]
  } else {
    set bundled_apm_stripped [string map {"apm:" ""} $bundled_apm]
    set bundled_apm_filename [format "/var/tmp/appsvcs_apm_%s_%s_%s.tar.gz" $::app $bundled_apm_stripped $bundler_timestamp]
  }

  debug [list bundler apm check_preserve] [format "%s %s" $bundled_apm [string match *$bundled_apm* [get_items_starting_with "apm:" [get_var vs__BundledItems]]]] 7
  if { $newdeploy || \
       [expr { $redeploy && [string match redeploy* $iapp__apmDeployMode]}] || \
       [expr { $redeploy && [llength [get_items_starting_with "apm:" [get_var vs__BundledItems]]]}] == 0 } {
    debug [list bundler apm deploy] $bundled_apm 5
    set bundler_apm_mode 1

    if { $bundled_apm_isurl } {
      curl_save_file $bundled_apm_url $bundled_apm_filename
    } else {      
      if {! [info exists bundler_objects($bundled_apm)] } {
        error "A bundled APM policy named '$bundled_apm' was not found in the template"
      }

      debug [list bundler apm deploy version_check] [format "bundled_version=%s system_version=%s" $bundler_objects($bundled_apm) $version_info(version)] 7
      if {! [string match $bundler_objects($bundled_apm)* $version_info(version)] } {
        error "The bundled APM policy '$bundled_apm' requires BIG-IP version $bundler_objects($bundled_apm).  This system is running version $version_info(version)"
      }

      set outfile [open $bundled_apm_filename w]
      fconfigure $outfile -translation binary
      puts -nonewline $outfile [::base64::decode $bundler_data($bundled_apm)]
      close $outfile
    }
  } else {
    debug [list bundler apm preserve] $bundled_apm 5
    set bundler_apm_mode 2
    set bundled_apm_export_filename [format "appsvcs_apm_%s_%s_%s" $::app $bundled_apm_stripped $bundler_timestamp]
    switch -glob $version_info(version) {
      11.5* {
        #ng_export <access_profile_name> <filename> [<partition>] FIXTHIS
        set bundler_apm_exportcmd [format "/usr/bin/env REMOTEUSER=admin USER=admin /usr/bin/ng_export %s.app/bundled_apm_policy %s %s" $app $bundled_apm_export_filename $partition]
        set bundler_apm_renamecmd [format "mv /tmp/%s.conf.tar.gz %s" $bundled_apm_export_filename $bundled_apm_filename]
      }
      11.6* { 
        set bundler_apm_exportcmd [format "/usr/bin/env REMOTEUSER=admin USER=admin /usr/bin/ng_export %s.app/bundled_apm_policy %s -p %s" $app $bundled_apm_export_filename $partition]
        set bundler_apm_renamecmd [format "mv /tmp/profile-%s.conf.tar.gz %s" $bundled_apm_export_filename $bundled_apm_filename]
      }
      12.* {
        set bundler_apm_exportcmd [format "/usr/bin/env REMOTEUSER=admin USER=admin /usr/bin/ng_export %s.app/bundled_apm_policy %s -p %s" $app $bundled_apm_export_filename $partition]
        set bundler_apm_renamecmd [format "mv /tmp/profile-%s.conf.tar.gz %s" $bundled_apm_export_filename $bundled_apm_filename]
      }
      default { error "The TMOS version running on this device does not support the preserve APM deployment modes" }
    }
    debug [list bundler apm preserve] [format "preserving existing policy... save to %s" $bundled_apm_filename] 5
    debug [list bundler apm preserve export_cmd] $bundler_apm_exportcmd 1
    debug [list bundler apm preserve rename_cmd] $bundler_apm_renamecmd 1
    eval exec $bundler_apm_exportcmd
    eval exec $bundler_apm_renamecmd

  }
  lappend bundler_apm_deploy $bundled_apm_stripped
  incr bundler_all_deploy
}

if { $bundler_all_deploy } {
  set postdeploy_final_state 0
  set bundler_enablevs 0
  if { [string match *\-block $iapp__asmDeployMode] || [string match *\-block $iapp__apmDeployMode] } {
    set bundler_vs_cmd [format "ltm virtual %s/%s disabled" $app_path $vs__Name]
    debug [list bundler check_deploy_mode] "iapp__(asm|apm)DeployMode specified block mode, disabling virtual server" 5
    debug [list bundler check_deploy_mode tmsh_modify] $bundler_vs_cmd 1
    tmsh::modify $bundler_vs_cmd
    set bundler_enablevs 1
  }

  set bundler_icall_tmpl {
%insertfile:include/postdeploy_bundler.icall%    
  };

  set bundler_apm_importcmd ""
  if { [llength $bundler_apm_policies] == 1 } { 
    switch -glob $version_info(version) {
      11.5* {
        #ng_export <access_profile_name> <filename> [<partition>]
        set bundler_apm_importcmd [format "/usr/bin/ng_import %s %s.app/bundled_apm_policy %s" $bundled_apm_filename $app $partition]
      }
      11.6* { 
        #ng_import [-s] <templatefile.conf.tar[.gz]> <new_name> [-p|-partition <partition>]
        set bundler_apm_importcmd [format "/usr/bin/ng_import %s %s.app/bundled_apm_policy -p %s" $bundled_apm_filename $app $partition]
      }
      12.* {
        #ng_import [-s] <templatefile.conf.tar[.gz]> <new_name> [-p|-partition <partition>]
        set bundler_apm_importcmd [format "/usr/bin/ng_import %s %s.app/bundled_apm_policy -p %s" $bundled_apm_filename $app $partition]
      }
      default { error "The TMOS version running on this device does not support the preserve APM deployment modes" }
    }
  }

  set bundler_icall_time [clock format [expr {[clock seconds] + $::POSTDEPLOY_DELAY}] -format {%Y-%m-%d:%H:%M:%S}]
  set bundler_script_map [list %APP_NAME%  $::app \
                       %APP_PATH%      $::app_path \
                       %VS_NAME%       $::vs__Name \
                       %PARTITION%     $::partition \
                       %ENABLEVS%      $bundler_enablevs \
                       %ASMPOLICYLIST% $bundler_asm_deploy \
                       %APMPOLICYLIST% $bundler_apm_deploy \
                       %TIMESTAMP%     $bundler_timestamp \
                       %APMIMPORTCMD%  $bundler_apm_importcmd \
                       %ICALLTIME%     $bundler_icall_time \
                       %NEWDEPLOY%     $newdeploy \
                       %REDEPLOY%      $redeploy \
                       %ASMMODE%       $bundler_asm_mode \
                       %APMMODE%       $bundler_apm_mode \
                       %APMASSOCIATE%  $bundler_apm_associate \
                       %DEFERREDCMDS%  [join $bundler_deferred_cmds "\n"] \
                       %STRICTUPDATES% $iapp__strictUpdates ]

  set bundler_icall_src [string map $bundler_script_map $bundler_icall_tmpl]  
  debug [list bundler icall_src] [format "%s" $bundler_icall_src] 10
  debug [list bundler icall_handler] [format "creating iCall handler; executing postdeploy script at: %s" $bundler_icall_time] 7

  set fn [format "/var/tmp/appsvcs_postdeploy_%s.conf" $app]
  catch {
      set fh [open $fn w]
      puts $fh $bundler_icall_src
      close $fh
  } {}    
 
  debug [list bundler deploy] "Bundled policy deployment will complete momentarily..." 5
}

if { [string length $vs__RouteAdv] > 0 && $vs__RouteAdv ne "disabled" } {
  switch $vs__RouteAdv {
    "any_vs" { set routeadv_mode "any" }
    "all_vs" { set routeadv_mode "all" }
    "always" { set routeadv_mode "none" }
    default { error "The value specified for the Route Advertisement mode (vs__RouteAdv) is invalid" }
  }
  debug [list virtual_address route-adv] [format "enabling route advertisement for virtual address %s with mode %s (postdeploy_final)" $vs_dest_addr $routeadv_mode] 5
  lappend postfinal_deferred_cmds [create_escaped_tmsh [format "tmsh::modify ltm virtual-address /%s/%s route-advertisement enabled" $partition $vs_dest_addr]]
  lappend postfinal_deferred_cmds [create_escaped_tmsh [format "tmsh::modify ltm virtual-address /%s/%s server-scope %s" $partition $vs_dest_addr $routeadv_mode]]
}

# Call the custom_extensions_end proc to allow site-specific customizations
custom_extensions_end

set postfinal_icall_tmpl {
%insertfile:include/postdeploy_final.icall%    
};

set postfinal_handler_state "inactive"
if { $postdeploy_final_state } {
  set postfinal_handler_state "active"
} 

set postfinal_deferred_cmds_str [join $postfinal_deferred_cmds "\n"]

set postfinal_icall_time [clock format [expr {[clock seconds] + $::POSTDEPLOY_DELAY}] -format {%Y-%m-%d:%H:%M:%S}]
set postfinal_script_map [list %APP_NAME%  $::app \
                     %APP_PATH%      $::app_path \
                     %VS_NAME%       $::vs__Name \
                     %PARTITION%     $::partition \
                     %ICALLTIME%     $postfinal_icall_time \
                     %NEWDEPLOY%     $newdeploy \
                     %REDEPLOY%      $redeploy \
                     %DEFERREDCMDS%  $postfinal_deferred_cmds_str \
                     %STRICTUPDATES% $iapp__strictUpdates \
                     %HANDLER_STATE% $postfinal_handler_state ]

set postfinal_icall_src [string map $postfinal_script_map $postfinal_icall_tmpl]  
debug [list postfinal icall_src] [format "%s" $postfinal_icall_src] 10
debug [list postfinal icall_handler] [format "creating iCall handler; executing postdeploy_final script at: %s" $postfinal_icall_time] 7

set fn [format "/var/tmp/appsvcs_postdeploy_%s.conf" $app]
catch {
    if { $bundler_all_deploy } {
      set fh [open $fn a]
    } else {
      set fh [open $fn w]
    }
    puts $fh ""
    puts $fh $postfinal_icall_src
    close $fh
} {}    

set fn [format "/var/tmp/appsvcs_load_postdeploy_%s.sh" $app]
catch {
    set fh [open $fn w]
    puts $fh "sleep 5"
    puts $fh [format "tmsh load sys config file /var/tmp/appsvcs_postdeploy_%s.conf merge" $app]
    puts $fh [format "rm -f /var/tmp/appsvcs_postdeploy_%s.conf" $app]
    puts $fh [format "rm -f /var/tmp/appsvcs_load_postdeploy_%s.sh" $app]
    close $fh
    exec chmod 777 $fn
    exec $fn &
} {}    

if { $iapp__strictUpdates eq "disabled" } {
  debug [list strict_updates] "disabling strict updates" 5
  tmsh::modify [format "sys application service %s/%s strict-updates disabled" $app_path $app]
}

set runTime [expr {[clock seconds] - $startTime}]
debug [list stop] [format "Finished app_name=%s, total run time was %s seconds" $app $runTime] 0
