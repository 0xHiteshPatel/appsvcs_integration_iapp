#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set startTime [clock seconds]
set NAME "F5 Application Services Integration iApp (Community Edition)"
set IMPLVERSION "0.3(009)"
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
set app_path [format "/%s/%s.app" $partition $app]

debug "\[modeinfo\] mode=$mode folder=$folder partition=$partition rd=$rd"

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
    
    # Add a route domain if it wasn't included
    if {![has_routedomain $ip]} {
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

debug "\[create_pool\] TMSH CREATE: $cmd"
tmsh::create $cmd

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
}

# Set virtual server options we support.  This array allows specifcation of the specific TMSH command format
array set vs_options_custom {
 "vs__Irules" " rules \{ %s \}"
 "vs__ProfileDefaultPersist" " persist replace-all-with \{ %s \}"
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

set snatcmd ""
# Add SNAT options
if { [string length $vs__SNATConfig] > 0 } {
  switch [string tolower $vs__SNATConfig] {
    automap { 
      append snatcmd " source-address-translation \{ type automap \}" 
    }
    partition-default { 
      append snatcmd [format " source-address-translation \{ pool /%s/%s type snat \}" $partition $partition] 
    }
    none { 
      append snatcmd " source-address-translation \{ type none \}" 
    }
    default {
          tmsh::get_config /ltm snatpool $vs__SNATConfig
          append snatcmd [format " source-address-translation \{ pool %s type snat \}" $vs__SNATConfig]
    }
  }
  debug "\[create_virtual\] adding snat cmd=$snatcmd"
}
append cmd $snatcmd

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

# Set virtual server profiles we support.  The format expected is: profiles replace-all-with { <profile1> <profile2> }.  
# To achieve this while re-using generic_add_option() we simply pass the var name with a blank option string
array set vs_profiles {
 "vs__ProfileHTTP" ""
 "vs__ProfileOneConnect" ""
 "vs__ProfileCompression" ""
 "vs__ProfileAnalytics" ""
 "vs__ProfileRequestLogging" ""
 "vs__ProfileServerSSL" ""
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

# Process feature__insertXForwardedFor
if { $feature__insertXForwardedFor eq "enabled"} {
  set xffcmd [format "ltm profile http %s/%s_http defaults-from %s insert-xforwarded-for enabled" $app_path $app $vs__ProfileHTTP]
  debug "\[create_virtual\]\[feature__insertXForwardedFor\] creating custom HTTP profile defaults-from=$vs__ProfileHTTP"
  debug "\[create_virtual\]\[feature__insertXForwardedFor\] TMSH CREATE: $xffcmd"
  tmsh::create $xffcmd
  set vs__ProfileHTTP [format "%s/%s_http" $app_path $app]
}

# Process the vs_profiles array to build the profiles command
foreach {optionvar optioncmd} [array get vs_profiles] {
  #debug "\[create_virtual\]\[profiles\] var=$optionvar cmd=$optioncmd"
  append vsprofiles [generic_add_option "create_virtual\]\[options" [set [subst $optionvar]] $optioncmd "" 0]
}

append vsprofiles " \}"
debug "\[create_virtual\]\[profiles\] final string=$vsprofiles"

# Add the profile string to the TMSH command
append cmd $vsprofiles

# Create the virtual server
debug "\[create_virtual\]  TMSH CREATE: $cmd"
tmsh::create $cmd

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

# Call the custom_extensions proc to allow site-specific customizations
custom_extensions

if { $iapp__strictUpdates eq "disabled" } {
  debug "\[strict_updates\] disabling strict updates"
  tmsh::modify [format "sys application service %s/%s strict-updates disabled" $app_path $app]
}

set runTime [expr {[clock seconds] - $startTime}]
debug "Finished app_name=$app, total run time was $runTime seconds"