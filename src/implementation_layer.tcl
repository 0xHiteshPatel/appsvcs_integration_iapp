#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set startTime [clock seconds]
set NAME "F5 Application Services Integration iApp (Community Edition)"
set IMPLMAJORVERSION "0.3"
set IMPLMINORVERSION "022"
set IMPLVERSION [format "%s(%s)" $IMPLMAJORVERSION $IMPLMINORVERSION]
set PRESVERSION "%PRESENTATION_REV%"

%insertfile:src/util.tcl%

%insertfile:include/custom_extensions.tcl%

set app $tmsh::app_name
debug "Starting $NAME version IMPL=$IMPLVERSION PRES=$PRESVERSION app_name=$app"

array set modenames {
  1 {Standalone}
  2 {BIG-IQ Cloud}
  3 {Cisco APIC}
  4 {VMware NSX}
}

set modeinfo [get_mode]
set mode [lindex $modeinfo 0]
set folder [lindex $modeinfo 1]
set partition [lindex $modeinfo 2]
set rd [lindex $modeinfo 3]
set newdeploy [lindex $modeinfo 4]
set app_path [format "/%s/%s.app" $partition $app]
set template_name [format "appsvcs_integration_v%s_%s" $IMPLMAJORVERSION $PRESVERSION]

set redeploy 0
if { ! $newdeploy } { set redeploy 1 }

debug "\[modeinfo\] mode=$mode folder=$folder partition=$partition rd=$rd newdeploy=$newdeploy redeploy=$redeploy template_name=$template_name"

set asodescr [format "Deployed by appsvcs_integration_v%s_%s in %s mode on %s" $IMPLVERSION $PRESVERSION $modenames($mode) [clock format $startTime -format "%D %H:%M:%S"]]
debug "\[set_aso_description\] setting ASO description=$asodescr"
tmsh::modify sys application service /$partition/$app.app/$app description [format "\"%s\"" $asodescr]

# Define various global values
set allVars {
%PRESENTATION_TCL_ALLVARS%
 app_stats }

array set table_defaults {
    Members {
        State enabled
        IPAddress Error
        Port 80
        ConnectionLimit 0
        Ratio 1
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
    debug "\[input\] $var sent, value is: [set [subst $var]]"
  } else {
    set [subst $var] ""
    debug "\[input\] $var NOT sent, setting to blank"
  }
}

# Call the custom_extensions_start proc to allow site-specific customizations
custom_extensions_start

# Special handling for the Source Address because it comes in as 0.0.0.0/0 and
# needs to be 0.0.0.0%xxxx/0, where '%xxxx' is the route-domain ID
set working $vs__SourceAddress
debug "\[fix_src_addr\] Check if vs__SourceAddress needs to be fixed"
if { [string length $working] > 0 } {
  debug "\[fix_src_addr\]  Fixing vs__SourceAddress: orig=$working"
  set net  [lindex [split $working /] 0]
  set cidr [lindex [split $working /] 1]
  set vs__SourceAddress "$net%$rd\/$cidr"
  debug "\[fix_src_addr\]  new=$vs__SourceAddress"
}

# Create Client-SSL profile if Cert and Key are specified but ClientSSLProfile is not
debug "\[proc_client_ssl\] checking if client ssl cert & key were entered"
set clientssl 0
if { [string length $vs__ProfileClientSSLKey] > 0 && [string length $vs__ProfileClientSSLCert] > 0 && [string length $vs__ProfileClientSSL] == 0 } {
  if { $vs__ProfileClientSSLKey == "auto" } {
    debug "\[proc_client_ssl\] found auto option for key, setting vs__ProfileClientSSLKey=/Common/$app.key"
    set vs__ProfileClientSSLKey "/Common/$app.key"
  }

  if { $vs__ProfileClientSSLCert == "auto" } {
    debug "\[proc_client_ssl\] found auto option for key, setting vs__ProfileClientSSLCert=/Common/$app.key"
    set vs__ProfileClientSSLCert "/Common/$app.crt"
  }

  tmsh::get_config /sys file ssl-key $vs__ProfileClientSSLKey
  tmsh::get_config /sys file ssl-cert $vs__ProfileClientSSLCert
  debug "\[create_client_ssl\]  ssl cert & key found... creating profile"

  set cmd [format "ltm profile client-ssl %s_clientssl key %s cert %s" $app $vs__ProfileClientSSLKey $vs__ProfileClientSSLCert]

  if { [string length $vs__ProfileClientSSLChain] > 0 } {
      tmsh::get_config /sys file ssl-cert $vs__ProfileClientSSLChain
      debug "\[create_client_ssl\]  adding cert chain"
      append cmd [format " chain %s" $vs__ProfileClientSSLChain]
  }

%insertfile:include/feature_sslEasyCipher.tcl%

  if { [string length $vs__ProfileClientSSLCipherString] > 0 } {
      debug "\[create_client_ssl\]  adding cipher string"
      append cmd [format " ciphers \"%s\"" $vs__ProfileClientSSLCipherString]
  }

  if { [string length $vs__ProfileClientSSLAdvOptions] > 0 } {
    debug "\[create_client_ssl\]  processing advanced options string"
    append cmd [format " %s" [process_options_string $vs__ProfileClientSSLAdvOptions "profile client-ssl" "/Common/clientssl"]]
  }

  debug "\[create_client_ssl\]  TMSH CREATE: $cmd"
  tmsh::create $cmd
  set clientssl 1
} else { 
  if { [string length $vs__ProfileClientSSL] > 0 } {
    debug "\[proc_client_ssl\] ClientSSLProfile was provided... checking if it exists"
    tmsh::get_config /ltm profile client-ssl $vs__ProfileClientSSL
    set clientssl 2
  } else {
    set clientssl 0
    debug "\[proc_client_ssl\] ssl cert & key not specified... skipped Client-SSL profile creation"
  }
}

# Call the custom_extensions_before_pool proc to allow site-specific customizations
custom_extensions_before_pool

# Create pool

# Check to see if a poolName was specified... if not set to $app_pool
if { [string length $pool__Name] == 0 } {
    set pool__Name [format "%s_pool" $app]
    debug "\[create_pool\] no poolName specified... setting to $pool__Name"
}

debug "\[create_pool\] name=$pool__Name"


# Setup the members portion of the command my processing the pool__Members APL table
set nummembers [llength $pool__Members]
set numcolumns [llength [lindex [lindex $pool__Members 0] 0]]

if { $nummembers == 0 } {
  set memberstr " members none "
  debug "\[create_pool\]\[member_str\] No pool members found... setting to none"
} else {
  set memberstr "members replace-all-with \{ "
  debug "\[create_pool\]\[member_str\] Checking pool table... nummembers=$nummembers numcolumns=$numcolumns"
  foreach row $pool__Members {
    debug "\[create_pool\]\[member_str\]  row=$row"
    array set column_defaults [subst $::table_defaults(Members)]
    array unset column

    # extract the iApp table data - borrowed from f5.lbaas.tmpl
    foreach column_data [lrange [split [join $row] "\n"] 1 end-1] {
        set name [lindex $column_data 0]
        set column($name) [lrange $column_data 1 end]
        #debug [format "column_data name=%s val=%s" $name $column($name)]
    }

    # fill in any empty table values - borrowed from f5.lbaas.tmpl
    foreach name [array names column_defaults] {
        if { ![info exists column($name)] || $column($name) eq "" } {
            set column($name) $column_defaults($name)
            debug "\[create_pool\]\[member_str\]  value for $name not found... setting to default of $column_defaults($name)"
        }
    }

    set ip $column(IPAddress)
    set port $column(Port)
    set connlimit $column(ConnectionLimit)
    set state $column(State)
    set ratio $column(Ratio)
    
    # Add a route domain if it wasn't included and we don't already have a node object created
    set node_status [catch {tmsh::get_config ltm node /Common/$ip}]
    if { $node_status == 1 && ![has_routedomain $ip]} {
      set ip "$ip%$rd"
    }

    # TODO: Is this still required?
    # Sometimes we receive a transposed ip/port from BIG-IQ... fix it here
    if {[has_routedomain $port]} {
      set port $column(IPAddress)
      set ip $column(Port)
      debug "\[create_pool\]\[member_str\]  fixing ip=$ip port=$port"
    }
    debug "\[create_pool\]\[member_str\]  ip=$ip port=$port connlimit=$connlimit ratio=$ratio state=$state"
    
    # If we don't get a port in the pool member table than use the template value for pool__MemberDefaultPort
    if { [string length $port] == 0} {
      if { [string length $pool__MemberDefaultPort] == 0 } {
        debug "\[create_pool\]\[member_str\]  Pool member port was not specified, pool__MemberDefaultPort was blank, using pool__port=$pool__port"
        set port $pool__port
      } else {
        debug "\[create_pool\]\[member_str\]  Pool member port was not specified, using pool__MemberDefaultPort=$pool__MemberDefaultPort"
        set port $pool__MemberDefaultPort
      }
    }

    append memberstr [format " %s:%s \{ connection-limit %s ratio %s %s\} " $ip $port $connlimit $ratio $::pool_state($state)]
  }
  append memberstr " \} "
}
debug "\[create_pool\]\[member_str\]  memberstr=$memberstr"

# Setup the base pool create command
set cmd [format "ltm pool %s/%s %s " $app_path $pool__Name $memberstr]

array set pool_options {
  "pool__LbMethod" "load-balancing-mode"
  "pool__Description" "description"
  "pool__Monitor" "monitor"
}

foreach {optionvar optioncmd} [array get pool_options] {
  #debug "\[create_pool\]\[options\] var=$optionvar cmd=$optioncmd"
  append cmd [generic_add_option "create_pool\]\[options" [set [subst $optionvar]] $optioncmd "" 0]
}

if { [string length $pool__AdvOptions] > 0 } {
  debug "\[create_pool\]\[adv_options\] processing advanced options string"
  append cmd [format " %s" [process_options_string $pool__AdvOptions "" ""]]
}

debug "\[create_pool\] TMSH CREATE: $cmd"
tmsh::create $cmd

# Call the custom_extensions_after_pool proc to allow site-specific customizations
custom_extensions_after_pool

# Call the custom_extensions_before_vs proc to allow site-specific customizations
custom_extensions_before_vs

# Create virtual Server

# Process the 'auto' flag for feature__redirectToHTTPS
if { $feature__redirectToHTTPS eq "auto" && $pool__port eq "443" } {
  debug "\[create_virtual\]\[feature__redirectToHTTPS\] found auto flag and port is 443, setting feature to enabled"
  set feature__redirectToHTTPS enabled
}

# Process the 'auto' flag for feature__insertXForwardedFor
if { $feature__insertXForwardedFor eq "auto" && [expr {$pool__port eq "443" || $pool__port eq "80"}] } {
  debug "\[create_virtual\]\[feature__insertXForwardedFor\] found auto flag and port is 443 or 80, setting feature to enabled"
  set feature__insertXForwardedFor enabled
}

# Process the vs__ProfileSecurityIPBlacklist option.
set ipi_mode 1
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
      debug "\[create_virtual\]\[feature__easyL4Firewall\] found auto option, setting feature to enabled, vs__ProfileSecurityIPBlacklist to enabled-block (or user-specific IPI policy if specified)"
      set feature__easyL4Firewall enabled
      set afm_auto_ipistring "enabled-block"
    }
    base { 
      debug "\[create_virtual\]\[feature__easyL4Firewall\] found base flag, setting feature to enabled, vs__ProfileSecurityIPBlacklist to disabled"
      set feature__easyL4Firewall enabled
      set afm_auto_ipistring "disabled"
    }
    base+ip_blacklist_block { 
      debug "\[create_virtual\]\[feature__easyL4Firewall\] found auto option, setting feature to enabled, vs__ProfileSecurityIPBlacklist to enabled-block"
      set feature__easyL4Firewall enabled
      set afm_auto_ipistring "enabled-block"
    }
    base+ip_blacklist_log { 
      debug "\[create_virtual\]\[feature__easyL4Firewall\] found base+ipblacklist_log option, setting feature to enabled, vs__ProfileSecurityIPBlacklist to enabled-log"
      set feature__easyL4Firewall enabled
      set afm_auto_ipistring "enabled-log"
    }
    default { 
      if { [get_var feature__easyL4Firewall] == "auto"} {
        set afm_auto_ipistring "disabled"
      }
      set feature__easyL4Firewall disabled 
    }
  }
  if { $ipi_mode < 2 } {
    change_var vs__ProfileSecurityIPBlacklist $afm_auto_ipistring
  }
} else {
  debug "\[create_virtual\]\[feature__easyL4Firewall\] AFM not provisioned, skipping"
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
  
  debug "\[create_virtual\]\[feature__securityEnableHSTS\] creating HSTS iRule"
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
  debug "\[create_virtual\]\[feature__securityEnableHSTS\] TMSH CREATE: $hstscmd"
  tmsh::create $hstscmd

  if { $feature__redirectToHTTPS eq "enabled"} {
    debug "\[create_virtual\]\[feature__securityEnableHSTS\] feature_redirectToHTTPS enabled, creating HSTS redirect iRule"
    set hstsredirectrule [format "%s/hsts_redirect_irule" $app_path]
    set hstsredirectcmd "ltm rule $hstsredirectrule $irule_HSTS_redirect"
    debug "\[create_virtual\]\[feature__securityEnableHSTS\] TMSH CREATE: $hstsredirectcmd"
    tmsh::create $hstsredirectcmd
  }
  
  if { [string length $vs__Irules] > 0 } {
    debug "\[create_virtual\]\[feature__securityEnableHSTS\] vs__Irules has data, appending"
    append vs__Irules ",$hstsrule"
  } else {
    debug "\[create_virtual\]\[feature__securityEnableHSTS\] vs__Irules is empty, setting"
    set vs__Irules $hstsrule
  }
  debug "\[create_virtual\]\[feature__securityEnableHSTS\] vs__Irules=$vs__Irules"
}

# Check to see if a vsName was specified... if not set to $app_pool
if { [string length $vs__Name] == 0 } {
    set vs__Name [format "%s_vs" $app]
    debug "\[create_virtual\] no vsName specified... setting to $vs__Name"
}

set cmd [format "ltm virtual %s/%s " $app_path $vs__Name]
debug "\[create_virtual\] base cmd=$cmd"

# Setup our listener destination address
if { ![has_routedomain $pool__addr]} {
  set vs_dest_addr "$pool__addr%$rd"
} else {
  set vs_dest_addr "$pool__addr"
}

# Keep vs_dest_addr as is for use by other features, create vs_dest with full <ip>%<rd>:<port> format
set vs_dest "$vs_dest_addr:$pool__port"

# Set virtual server options we support.  This array assumes a format " <option> <input value>" for the TMSH command.
array set vs_options {
 "pool__mask" "mask"
 "pool__Name" "pool"
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
  debug "\[create_virtual\]\[ip_blacklist\] ipi_action=$ipi_action, creating IPI policy"
  set ipi_name [create_obj_name "ip_blacklist"]
  set ipi_cmd [format "security ip-intelligence policy %s default-action %s default-log-blacklist-hit-only yes" $ipi_name $ipi_action]
  debug "\[create_virtual\]\[ip_blacklist\] TMSH CREATE: $ipi_cmd"
  tmsh::create $ipi_cmd
  set vs__ProfileSecurityIPBlacklist $ipi_name
  array set vs_options [list vs__ProfileSecurityIPBlacklist ip-intelligence-policy]
} 

if { $ipi_mode == 2 } {
  debug "\[create_virtual\]\[ip_blacklist\] adding existing IPI policy $vs__ProfileSecurityIPBlacklist"
  array set vs_options [list vs__ProfileSecurityIPBlacklist ip-intelligence-policy]
}

# Process the feature__easyL4Firewall option
handle_opt_remove_on_redeploy feature__easyL4Firewall "disabled" "fw-enforced-policy" "afm"

if { $feature__easyL4Firewall == "enabled" } {
  debug "\[create_virtual\]\[l4_firewall\] creating FW policy"

  set cidr_blacklist [single_column_table_to_list $feature__easyL4FirewallBlacklist "CIDRRange"]
  debug "\[create_virtual\]\[l4_firewall\] cidr_blacklist=$cidr_blacklist"

  set cidr_sourcelist [single_column_table_to_list $feature__easyL4FirewallSourceList "CIDRRange"]
  debug "\[create_virtual\]\[l4_firewall\] cidr_sourcelist=$cidr_sourcelist"

  if { [llength $cidr_blacklist] > 0 } {
    debug "\[create_virtual\]\[l4_firewall\] creating static blacklist address-list"
    set feature_easyL4Firewall_blacklistcmd [format "security firewall address-list %s/afm_staticBlacklist addresses replace-all-with { %s }" \
     $app_path [join $cidr_blacklist " "]]

    debug "\[create_virtual\]\[l4_firewall\] TMSH CREATE: $feature_easyL4Firewall_blacklistcmd"
    tmsh::create $feature_easyL4Firewall_blacklistcmd
    set feature_easyL4Firewall_blacklisttmpl [format "staticBlacklist { action drop source { address-lists replace-all-with { %s/afm_staticBlacklist } } }" $app_path]
  } else {
    set feature_easyL4Firewall_blacklisttmpl ""
  }

  if { [llength $cidr_sourcelist] > 0 } {
    debug "\[create_virtual\]\[l4_firewall\] creating source address-list"
    set feature_easyL4Firewall_srclistcmd [format "security firewall address-list %s/afm_sourceList addresses replace-all-with { %s }" \
     $app_path [join $cidr_sourcelist " "]]

    debug "\[create_virtual\]\[l4_firewall\] TMSH CREATE: $feature_easyL4Firewall_srclistcmd"
    tmsh::create $feature_easyL4Firewall_srclistcmd
  } else {
    debug "\[create_virtual\]\[l4_firewall\] creating DEFAULT source address-list"
    set feature_easyL4Firewall_srclistcmd [format "security firewall address-list %s/afm_sourceList addresses replace-all-with { 0.0.0.0/0 }" $app_path]

    debug "\[create_virtual\]\[l4_firewall\] TMSH CREATE: $feature_easyL4Firewall_srclistcmd"
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
  debug "\[create_virtual\]\[l4_firewall\] TMSH CREATE: $fw_policy"
  tmsh::create $fw_policy
  array set vs_options [list fw_name fw-enforced-policy]  
}

# Process bundled iRules
if { [string length $vs__BundledIrules] > 0 } { 

%insertfile:tmp/irules.build%

  set bundledirule_map [list %APP_PATH%      $app_path \
                             %APP_NAME%      $app \
                             %VS_NAME%       $vs__Name \
                             %POOL_NAME%     $pool__Name \
                             %PARTITION%     $partition ]

  foreach bundledirule $vs__BundledIrules {
    debug "\[create_virtual\]\[bundled_irule\] deploying bundled iRule $bundledirule"
    set bundled_irule_varname [format "irule_include_%s_data" $bundledirule]

    set bundled_irule_src [string map $bundledirule_map [set [subst $bundled_irule_varname]]]

    set bundledirulecmd [format "ltm rule %s/%s \{%s\}" $app_path $bundledirule $bundled_irule_src]
    #debug "\[create_virtual\]\[bundled_irule\] TMSH CREATE: $bundledirulecmd"
    tmsh::create $bundledirulecmd
    if { [string length $vs__Irules] > 0 } {
      append vs__Irules ","
    }
    append vs__Irules [format "%s/%s" $app_path $bundledirule]
  }
  debug "\[create_virtual\]\[bundled_irule\] vs__Irules modified to \"$vs__Irules\""
}

# Process the vs_options array
foreach {optionvar optioncmd} [array get vs_options] {
  #debug "\[create_virtual\]\[options\] var=$optionvar cmd=$optioncmd"
  append cmd [generic_add_option "create_virtual\]\[options" [set [subst $optionvar]] $optioncmd "" 0]
}

# Process the vs_options_custom array
foreach {optionvar optioncmd} [array get vs_options_custom] {
  #debug "\[create_virtual\]\[options\] var=$optionvar cmd=$optioncmd"
  append cmd [generic_add_option "create_virtual\]\[options_custom" [set [subst $optionvar]] "" $optioncmd 1]
}

if { [string length $vs__AdvOptions] > 0 } {
  debug "\[create_virtual\]\[adv_options\] processing advanced options string"
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
      debug "\[create_virtual\]\[create_snat_pool\] TMSH CREATE: $create_snat_poolcmd"
      tmsh::create $create_snat_poolcmd
      append snatcmd [format " source-address-translation \{ pool %s type snat \}" $create_snat_poolname] 
    }
    default {
          tmsh::get_config /ltm snatpool $vs__SNATConfig
          append snatcmd [format " source-address-translation \{ pool %s type snat \}" $vs__SNATConfig]
    }
  }
  debug "\[create_virtual\] adding snat cmd=$snatcmd"
}
append cmd $snatcmd

# Process feature__insertXForwardedFor
if { $feature__insertXForwardedFor eq "enabled"} {
  if { [regexp -nocase {^create:} $vs__ProfileHTTP] } {
    if { ! [regexp -nocase {insert-xforwarded-for=enabled} $vs__ProfileHTTP] } {
      debug "\[create_virtual\]\[feature_insertXForwardedFor\] Appending insert-xforwarded-for=enabled to existing HTTP profile customization string"
      append vs__ProfileHTTP ";insert-xforwarded-for=enabled"
    } else {
      debug "\[create_virtual\]\[feature_insertXForwardedFor\] insert-xforwarded-for=enabled alredy in HTTP profile customization string... doing nothing"
    }
  } else {
    debug "\[create_virtual\]\[feature_insertXForwardedFor\] Creating HTTP profile customization string \"create:insert-xforwarded-for=enabled;defaults-from=$vs__ProfileHTTP\""
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
    set kvpstring [lindex [split $profileval \:] 1]
    debug "\[create_virtual\]\[profiles\]\[create_handler\] processing create for $profilevar=$profileval"

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
    debug "\[create_virtual\]\[profiles\]\[create_handler\] TMSH CREATE: $profilestr; $profilevar=[set [subst $profilevar]]"
    tmsh::create $profilestr
  }
}

# Add profiles
set vsprofiles " profiles replace-all-with  \{ "
debug "\[create_virtual\] adding base vsprofiles=$vsprofiles"

# We have to specify context aware profiles first
# Figure out the correct context to apply protocol profiles
set clientContext "all"
set serverContext "all"

if { [string length $vs__ProfileClientProtocol] > 0 && [string length $vs__ProfileServerProtocol] > 0 && $vs__ProfileClientProtocol ne $vs__ProfileServerProtocol } {
  debug "\[create_virtual\]\[proto_profiles\] got both client and server protocol profiles"
  set clientContext "clientside"
  set serverContext "serverside"
} 

# Client-side protocol
if { [string length $vs__ProfileClientProtocol] > 0 } {
  append vsprofiles [format " %s \{ context %s \}" $vs__ProfileClientProtocol $clientContext]
  debug "\[create_virtual\]\[proto_profiles\] clientside protocol name=$vs__ProfileClientProtocol context=$clientContext"
}

# Server-side protocol
if { [string length $vs__ProfileServerProtocol] > 0 && $vs__ProfileClientProtocol ne $vs__ProfileServerProtocol } {
  append vsprofiles [format " %s \{ context %s \}" $vs__ProfileServerProtocol $serverContext]
  debug "\[create_virtual\]\[proto_profiles\] serverside protocol name=$vs__ProfileServerProtocol context=$serverContext"
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
 "vs__ProfileAccess" ""
}

# Save the base profile string for later use by feature__redirectToHTTPS
if { $feature__redirectToHTTPS eq "enabled"} {
  set vsprofiles_redirect $vsprofiles
}

# Client-SSL profile created by iApp
if { $clientssl == 1 } {
  set vs__ProfileClientSSL [format "%s/%s_clientssl" $app_path $app]
  set vs_profiles(vs__ProfileClientSSL) ""
  debug "\[create_virtual\]\[client_ssl_created\] name=$vs__ProfileClientSSL"
}

# Client-SSL profile specified via vs__ProfileClientSSL
if { $clientssl == 2 } {
  set vs_profiles(vs__ProfileClientSSL) ""
  debug "\[create_virtual\]\[client_ssl_specified\] name=$vs__ProfileClientSSL"
}

# Process the vs_profiles_contextual array first to make sure profiles that require a proxy
# context are added first
foreach {optionvar optioncmd} [array get vs_profiles_contextual] {
  append vsprofiles [generic_add_option "create_virtual\]\[options" [set [subst $optionvar]] "" " %s { context $optioncmd } " 0]
}

# Process the vs_profiles array to build the profiles command
foreach {optionvar optioncmd} [array get vs_profiles] {
  append vsprofiles [generic_add_option "create_virtual\]\[options" [set [subst $optionvar]] $optioncmd "" 0]
}

if { [string length $vs__AdvProfiles] > 0 } {
  debug "\[create_virtual\]\[adv_profiles\] process advanced profile string" 
  append vsprofiles [format " %s" [generic_add_option "create_virtual\]\[adv_profiles" $vs__AdvProfiles "" "%s" 1]]    
}

append vsprofiles " \}"
debug "\[create_virtual\]\[profiles\] final string=$vsprofiles"

# Add the profile string to the TMSH command
append cmd $vsprofiles

# Create the virtual server
debug "\[create_virtual\]  TMSH CREATE: $cmd"
tmsh::create $cmd

# Call the custom_extensions_after_vs proc to allow site-specific customizations
custom_extensions_after_vs

# Create and additional virtual server on port 80 for feature__redirectToHTTPS
if { $feature__redirectToHTTPS eq "enabled" } {
  debug "\[create_virtual\]\[feature__redirectToHTTPS\] feature__redirectToHTTPS is enabled, creating redirect virtual server on $vs_dest_addr:80"

  set redirect_cmd [format "ltm virtual %s/%s_redirect destination %s:80 " $app_path $vs__Name $vs_dest_addr]
  array set vs_redirect_options {
   "pool__mask" "mask"
   "vs__IpProtocol" "ip-protocol"
   "vs__SourceAddress" "source"
 }

  # Process the vs_options array
  foreach {optionvar optioncmd} [array get vs_redirect_options] {
    #debug "\[create_virtual\]\[options\] var=$optionvar cmd=$optioncmd"
    append redirect_cmd [generic_add_option "create_virtual\]\[feature__redirectToHTTPS\]\[options" [set [subst $optionvar]] $optioncmd "" 0]
  }

  # The HSTS spec recommends that when redirected a 301 Redirect is used, rather than a 302 like _sys_https_redirect uses
  if { $feature__securityEnableHSTS eq "enabled" } {
    debug "\[create_virtual\]\[feature__redirectToHTTPS\] feature__securityEnableHSTS is enabled, using $hstsredirectrule"
    append redirect_cmd " rules { $hstsredirectrule } "
  } else {
    append redirect_cmd " rules { /Common/_sys_https_redirect } "
  }

  append redirect_cmd $vsprofiles_redirect
  append redirect_cmd [generic_add_option "create_virtual\]\[feature__redirectToHTTPS\]\[options" $vs__ProfileHTTP "" "" 0]
  append redirect_cmd " \}"
  debug "\[create_virtual\]\[feature__redirectToHTTPS\] TMSH CREATE: $redirect_cmd"
  tmsh::create $redirect_cmd
}

# Create iCall statistics publisher
# CAVEATS: This is mode specific because $app_stats is not set unless deployment
# is driven by BIG-IQ.  To accomodate all use cases we make this mode specific:
# mode=1 (Standalone) : Look at $iapp__appStats from the presentation layer to control creation
# mode=2 (BIGIQ Cloud): Look at $app_stats set by BIG-IQ to control creation
# mode=3 (APIC)       : Look at $app_stats set by BIG-IQ to control creation
debug "\[create_stats\] mode=$mode app_stats=$app_stats iapp__appStats=$iapp__appStats"
if { (($mode == 2 || $mode == 3 || $mode == 4) && $app_stats eq "enabled") || ($mode == 1 && $iapp__appStats eq "enabled") } {
  # Create the iCall stats publisher
  # TODO: This needs to check for the presence of a HTTP profile and only add HTTP stats if that exists
  debug "\[create_stats\] creating icall stats publisher"
      # START EMBEDDED ICALL SCRIPT
  set icall_script_tmpl {
%insertfile:include/base_statistics_script.icall%
  }; # END EMBEDDED ICALL SCRIPT

  #debug "done creating icall stats publisher icall_script_tmpl=$icall_script_tmpl"
  if { [expr {$feature__statsHTTP eq "enabled" || $feature__statsHTTP eq "auto"}] && [string length $vs__ProfileHTTP] > 0 } {
    debug "\[create_stats\]\[feature_statsHTTP\] enabling HTTP stats"
    set feature__statsHTTP 1
  } else {
    set feature__statsHTTP 0
  }

  if { [expr {$feature__statsTLS eq "enabled" || $feature__statsTLS eq "auto"}] && [string length $vs__ProfileClientSSL] > 0 } {
    debug "\[create_stats\]\[feature_statsTLS\] enabling TLS stats"
    set feature__statsTLS 1
  } else {
    set feature__statsTLS 0
  }
  
  # used to fill in variables within iCall script
  set script_map [list %APP_NAME%      $app \
                       %VS_NAME%       $vs__Name \
                       %POOL_NAME%     $pool__Name \
                       %PARTITION%     $partition \
                       %HTTP_ENABLED%  $feature__statsHTTP \
                       %HTTP_PROFILE%  [format "%s" $vs__ProfileHTTP] \
                       %SSL_ENABLED%   $feature__statsTLS \
                       %SSL_PROFILE%   [format "%s" $vs__ProfileClientSSL] ]

  set icall_script_src [string map $script_map $icall_script_tmpl]
  debug "\[create_stats\] icall_script_src=$icall_script_src"

  debug "\[create_stats\] TMSH CREATE publish_stats script"
  tmsh::create sys icall script publish_stats definition \{ $icall_script_src \}
  debug "\[create_stats\] TMSH CREATE iCall handler"
  tmsh::create sys icall handler periodic publish_stats interval 60 script publish_stats
}

%insertfile:include/feature_easyASMPolicy.tcl%

# Call the custom_extensions_end proc to allow site-specific customizations
custom_extensions_end

if { $iapp__strictUpdates eq "disabled" } {
  debug "\[strict_updates\] disabling strict updates"
  tmsh::modify [format "sys application service %s/%s strict-updates disabled" $app_path $app]
}

set runTime [expr {[clock seconds] - $startTime}]
debug "Finished app_name=$app, total run time was $runTime seconds"