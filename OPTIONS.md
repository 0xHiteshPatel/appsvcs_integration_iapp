<table border=1 width="100%">
 <tr><th colspan=7><b>Generated from JSON v0.3_012</b></th></tr>
 <tr>
  <th>Display Name</th>
  <th>Var Name</th>
  <th>Description</th>
  <th>Supported Modes</th>
  <th>Type</th>
  <th>Options</th>
  <th>Min. Version</th>
 </tr>
<tr><td colspan=7><b>Section: iapp</b></td></tr>
<tr>
  <td>iapp.strictUpdates</td>
  <td>$iapp__strictUpdates</td>
  <td>Control Strict Updates mode (https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-iapps-developer-11-4-0/2.html#unique_1198712211)</td>
  <td>[1, 2, 3, 4]</td>
  <td>boolean</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>iapp.appStats</td>
  <td>$iapp__appStats</td>
  <td>Control whether Virtual Server/Pool statistics handlers are created in Standalone or BIG-IQ Cloud mode</td>
  <td>[1, 2]</td>
  <td>boolean</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr><td colspan=7><b>Section: pool</b></td></tr>
<tr>
  <td>pool.addr</td>
  <td>$pool__addr</td>
  <td>The destination address of the Virtual Server</td>
  <td>[1, 2, 3, 4]</td>
  <td>ipaddr</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.mask</td>
  <td>$pool__mask</td>
  <td>The destination network mask of the Virtual Server</td>
  <td>[1, 2, 3, 4]</td>
  <td>ipaddr</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.port</td>
  <td>$pool__port</td>
  <td>The L4 port the Virtual Server listens on.  '*' is supported</td>
  <td>[1, 2, 3, 4]</td>
  <td>port</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Name</td>
  <td>$pool__Name</td>
  <td>The name of the Pool.  Is no value is specified the name will be set to <iapp_name>_pool</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Description</td>
  <td>$pool__Description</td>
  <td>The description string configured in the Pool</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Monitor</td>
  <td>$pool__Monitor</td>
  <td>The path to a preconfigured Pool Health Monitor</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.LbMethod</td>
  <td>$pool__LbMethod</td>
  <td>The pool Load Balancing Method (https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm_configuration_guide_10_0_0/ltm_pools.html#1215305)</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>dynamic-ratio-member,
dynamic-ratio-node,
fastest-app-response,
fastest-node,
least-connections-member,
least-connections-node,
least-sessions,
observed-member,
observed-node,
predictive-member,
predictive-node,
round-robin,
ratio-member,
ratio-node,
ratio-session,
ratio-least-connections-member,
ratio-least-connections-node,
weighted-least-connections-member</td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.MemberDefaultPort</td>
  <td>$pool__MemberDefaultPort</td>
  <td>The L4 port to used when a pool member is added via a Dynamic Endpoint Insertion notication from Cisco APIC</td>
  <td>[3]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr><td colspan=7><b>Table: Members</b></td></tr>
<tr>
  <td>pool.Members.IPAddress</td>
  <td>$pool.Members__IPAddress</td>
  <td>IP Address of the Pool Member</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Members.Port</td>
  <td>$pool.Members__Port</td>
  <td>L4 port of the Pool Member</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Members.ConnectionLimit</td>
  <td>$pool.Members__ConnectionLimit</td>
  <td>The Connection Limit for the Pool Member.  '0' denotes unlimited connections</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Members.Ratio</td>
  <td>$pool.Members__Ratio</td>
  <td>The Ratio weight for the Pool Member.  Used with 'ratio' based Load Balancing Methods</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Members.State</td>
  <td>$pool.Members__State</td>
  <td>The administrative state of the Pool Member upon creation</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>enabled,
drain-disabled,
disabled</td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.AdvOptions</td>
  <td>$pool__AdvOptions</td>
  <td>The options to set in the created Pool.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_012</td>
</tr>
<tr><td colspan=7><b>Section: vs</b></td></tr>
<tr>
  <td>vs.Name</td>
  <td>$vs__Name</td>
  <td>The name of the Virtual Server.  If no value is specified the name will be set to <iapp_name>_vs</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.Description</td>
  <td>$vs__Description</td>
  <td>The description string configured in the Virtual Server</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.SourceAddress</td>
  <td>$vs__SourceAddress</td>
  <td>The source address filter for the Virtual Server</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.IpProtocol</td>
  <td>$vs__IpProtocol</td>
  <td>The IP Protocol of the Virtual Server (e.g. tcp, udp)</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ConnectionLimit</td>
  <td>$vs__ConnectionLimit</td>
  <td>The connection limit for the virtual server.  A value of '0' means no limit</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientProtocol</td>
  <td>$vs__ProfileClientProtocol</td>
  <td>The client-side protocol profile.  This field supports the 'create:' format for customization</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileServerProtocol</td>
  <td>$vs__ProfileServerProtocol</td>
  <td>The server-side protocol profile.  This field supports the 'create:' format for customization</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileHTTP</td>
  <td>$vs__ProfileHTTP</td>
  <td>The HTTP protocol profile.  This field supports the 'create:' format for customization</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileOneConnect</td>
  <td>$vs__ProfileOneConnect</td>
  <td>The oneconnect profile.  This field supports the 'create:' format for customization</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileCompression</td>
  <td>$vs__ProfileCompression</td>
  <td>The compression profile.  This field supports the 'create:' format for customization</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_005</td>
</tr>
<tr>
  <td>vs.ProfileAnalytics</td>
  <td>$vs__ProfileAnalytics</td>
  <td>The analytics profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_005</td>
</tr>
<tr>
  <td>vs.ProfileRequestLogging</td>
  <td>$vs__ProfileRequestLogging</td>
  <td>The request logging profile.  This field supports the 'create:' format for customization</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_005</td>
</tr>
<tr>
  <td>vs.ProfileDefaultPersist</td>
  <td>$vs__ProfileDefaultPersist</td>
  <td>The default persistence profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileFallbackPersist</td>
  <td>$vs__ProfileFallbackPersist</td>
  <td>The fallback persistence profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.SNATConfig</td>
  <td>$vs__SNATConfig</td>
  <td>The SNAT option to use.  Specifiy 'automap','/Common/<existing_snat_pool_name>','partition-default','create:<ip1,>....<ipX>'.  The partition-default option references a SNAT pool created by Cisco APIC as part of the APIC partition</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileServerSSL</td>
  <td>$vs__ProfileServerSSL</td>
  <td>The server-ssl profile.  This field supports the 'create:' format for customization</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_005</td>
</tr>
<tr>
  <td>vs.ProfileClientSSL</td>
  <td>$vs__ProfileClientSSL</td>
  <td>The path to an existing Client-SSL profile.  If specified this value overrides Client-SSL profile creation</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientSSLCert</td>
  <td>$vs__ProfileClientSSLCert</td>
  <td>The path to an existing SSL Certificate.  If the work 'auto' is specfied the value /Common/<iapp_name>.crt will be substituted</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientSSLKey</td>
  <td>$vs__ProfileClientSSLKey</td>
  <td>The path to an existing SSL Key.  If the work 'auto' is specfied the value /Common/<iapp_name>.key will be substituted</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientSSLChain</td>
  <td>$vs__ProfileClientSSLChain</td>
  <td>The path to the SSL Certicate Chain bundle</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientSSLCipherString</td>
  <td>$vs__ProfileClientSSLCipherString</td>
  <td>The SSL Cipher String (https://support.f5.com/kb/en-us/solutions/public/13000/100/sol13171.html)</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientSSLAdvOptions</td>
  <td>$vs__ProfileClientSSLAdvOptions</td>
  <td>The options to set in the created Client-SSL profile.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_010</td>
</tr>
<tr>
  <td>vs.ProfileSecurityLogProfiles</td>
  <td>$vs__ProfileSecurityLogProfiles</td>
  <td>A comma seperated list of existing security logging profiles</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_008</td>
</tr>
<tr>
  <td>vs.ProfileSecurityIPBlacklist</td>
  <td>$vs__ProfileSecurityIPBlacklist</td>
  <td>Configuration for the IP Intelligence Dynamic IP Blacklist.  An existing subscription is required for this feature.</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>none,
enabled-block,
enabled-log</td>
  <td>0.3_008</td>
</tr>
<tr>
  <td>vs.ProfileAccess</td>
  <td>$vs__ProfileAccess</td>
  <td>The APM Access Policy to configure</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_011</td>
</tr>
<tr>
  <td>vs.ProfileConnectivity</td>
  <td>$vs__ProfileConnectivity</td>
  <td>The APM Connectivity Policy to configure</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_011</td>
</tr>
<tr>
  <td>vs.ProfilePerRequest</td>
  <td>$vs__ProfilePerRequest</td>
  <td>The APM Per-Request Policy to configure</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_011</td>
</tr>
<tr>
  <td>vs.OptionSourcePort</td>
  <td>$vs__OptionSourcePort</td>
  <td>The source port translation behavior</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>preserve,
preserve-strict,
change</td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.OptionConnectionMirroring</td>
  <td>$vs__OptionConnectionMirroring</td>
  <td>The connection mirroring behavior</td>
  <td>[1, 2, 3, 4]</td>
  <td>boolean</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.Irules</td>
  <td>$vs__Irules</td>
  <td>A comma seperated list of existing iRules to attach to the virtual server.  Ordering is preserved.</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.AdvOptions</td>
  <td>$vs__AdvOptions</td>
  <td>The options to set in the created Virtual Server.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_010</td>
</tr>
<tr>
  <td>vs.AdvProfiles</td>
  <td>$vs__AdvProfiles</td>
  <td>A comma-seperated list of profiles to link to the Virtual Server: <profile_name>[,<profile_name>]</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_010</td>
</tr>
<tr><td colspan=7><b>Section: feature</b></td></tr>
<tr>
  <td>feature.statsTLS</td>
  <td>$feature__statsTLS</td>
  <td>TLS/SSL Statistics reporting.  The auto option will enable this feature if a client-ssl profile is attached, otherwise disable</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>auto,
enabled,
disabled</td>
  <td>0.3_006</td>
</tr>
<tr>
  <td>feature.statsHTTP</td>
  <td>$feature__statsHTTP</td>
  <td>HTTP Statistics reporting.  The auto option will enable this feature if a http profile is attached, otherwise disable</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>auto,
enabled,
disabled</td>
  <td>0.3_006</td>
</tr>
<tr>
  <td>feature.insertXForwardedFor</td>
  <td>$feature__insertXForwardedFor</td>
  <td>Insert the X-Forwarded-For header.  The auto option will enable this feature if a http profile is attached, otherwise disable</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>auto,
enabled,
disabled</td>
  <td>0.3_005</td>
</tr>
<tr>
  <td>feature.redirectToHTTPS</td>
  <td>$feature__redirectToHTTPS</td>
  <td>Create a virtual service on TCP/80 that performs a 302 HTTP redirect to TCP/443 on the same IP address.  The auto option will enable this feature if a client-ssl profile is configured, otherwise disable</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>auto,
enabled,
disabled</td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>feature.sslEasyCipher</td>
  <td>$feature__sslEasyCipher</td>
  <td>Easily configure TLS/SSL Cipher Strings.  This setting overrides the value in the Virtual Server section</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>compatible,
medium,
high,
tls_1.2,
tls_1.1+1.2,
disabled</td>
  <td>0.3_007</td>
</tr>
<tr>
  <td>feature.securityEnableHSTS</td>
  <td>$feature__securityEnableHSTS</td>
  <td>Enabled insertion of the Strict-Transport-Security HTTP header.  The preload and subdomain options can be omitted or included based on this selection.  This setting also modifies creation of the HTTP->HTTPS redirect option to perform a 301 HTTP redirect</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>disabled,
enabled,
enabled-preload,
enabled-subdomain,
enabled-preload-subdomain</td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>feature.easyL4Firewall</td>
  <td>$feature__easyL4Firewall</td>
  <td>Configure a AFM L4 Firewall policy.  The 'base' option creates a policy that allows traffic to the Virtual Server with optional Blacklist and Source addresses specified in the following fields.  The base+ip_blacklist options also configure an IP Intelligence Blacklist policy in either blocking or logging mode</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>auto,
base,
base+ip_blacklist_block,
base+ip_blacklist_log,
disabled</td>
  <td>0.3_008</td>
</tr>
<tr><td colspan=7><b>Table: easyL4FirewallBlacklist</b></td></tr>
<tr>
  <td>feature.easyL4FirewallBlacklist.CIDRRange</td>
  <td>$feature.easyL4FirewallBlacklist__CIDRRange</td>
  <td>CIDR Range</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_008</td>
</tr>
<tr><td colspan=7><b>Table: easyL4FirewallSourceList</b></td></tr>
<tr>
  <td>feature.easyL4FirewallSourceList.CIDRRange</td>
  <td>$feature.easyL4FirewallSourceList__CIDRRange</td>
  <td>CIDR Range</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_008</td>
</tr>
<tr>
  <td>feature.easyASMPolicy</td>
  <td>$feature__easyASMPolicy</td>
  <td>The ASM policy name to deploy.</td>
  <td>[1, 2, 3, 4]</td>
  <td>dynamic_filelist</td>
  <td></td>
  <td>0.3_009</td>
</tr>
<tr><td colspan=7><b>Section: extensions</b></td></tr>
<tr>
  <td>extensions.Field1</td>
  <td>$extensions__Field1</td>
  <td>Extensions: Field 1</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>extensions.Field2</td>
  <td>$extensions__Field2</td>
  <td>Extensions: Field 2</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>extensions.Field3</td>
  <td>$extensions__Field3</td>
  <td>Extensions: Field 3</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
</table>
