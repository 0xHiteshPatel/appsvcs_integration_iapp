<table border=1 width="100%">
 <tr><td colspan=7><b>Generated from JSON v0.3_007</b></td></tr>
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
  <td>Control Strict Updates mode</td>
  <td>[1, 2, 3, 4]</td>
  <td>boolean</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>iapp.appStats</td>
  <td>$iapp__appStats</td>
  <td>iApp: Statistics Handler Creation</td>
  <td>[1, 2]</td>
  <td>boolean</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr><td colspan=7><b>Section: pool</b></td></tr>
<tr>
  <td>pool.addr</td>
  <td>$pool__addr</td>
  <td>Virtual Server: Address</td>
  <td>[1, 2, 3, 4]</td>
  <td>ipaddr</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.mask</td>
  <td>$pool__mask</td>
  <td>Virtual Server: Mask</td>
  <td>[1, 2, 3, 4]</td>
  <td>ipaddr</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.port</td>
  <td>$pool__port</td>
  <td>Virtual Server: Port</td>
  <td>[1, 2, 3, 4]</td>
  <td>port</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Name</td>
  <td>$pool__Name</td>
  <td>Pool: Name</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Description</td>
  <td>$pool__Description</td>
  <td>Virtual Server: Description</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Monitor</td>
  <td>$pool__Monitor</td>
  <td>Pool: Health Monitor</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.LbMethod</td>
  <td>$pool__LbMethod</td>
  <td>Pool: Load Balancing Method</td>
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
  <td>Pool: Member Default Port</td>
  <td>[3]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr><td colspan=7><b>Table: Members</b></td></tr>
<tr>
  <td>pool.Members.IPAddress</td>
  <td>$pool.Members__IPAddress</td>
  <td>IP:</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Members.Port</td>
  <td>$pool.Members__Port</td>
  <td>Port:</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Members.ConnectionLimit</td>
  <td>$pool.Members__ConnectionLimit</td>
  <td>Connection Limit:</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Members.Ratio</td>
  <td>$pool.Members__Ratio</td>
  <td>Ratio:</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>pool.Members.State</td>
  <td>$pool.Members__State</td>
  <td>State:</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>enabled,
drain-disabled,
disabled</td>
  <td>0.3_001</td>
</tr>
<tr><td colspan=7><b>Section: vs</b></td></tr>
<tr>
  <td>vs.Name</td>
  <td>$vs__Name</td>
  <td>Virtual Server: Name</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.Description</td>
  <td>$vs__Description</td>
  <td>Virtual Server: Description</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.SourceAddress</td>
  <td>$vs__SourceAddress</td>
  <td>Virtual Server: Source Address</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.IpProtocol</td>
  <td>$vs__IpProtocol</td>
  <td>Virtual Server: IP Protocol</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ConnectionLimit</td>
  <td>$vs__ConnectionLimit</td>
  <td>Virtual Server: Virtual Server Connection Limit (0=unlimited)</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientProtocol</td>
  <td>$vs__ProfileClientProtocol</td>
  <td>Virtual Server: Client-side L4 Protocol Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileServerProtocol</td>
  <td>$vs__ProfileServerProtocol</td>
  <td>Virtual Server: Server-side L4 Protocol Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileHTTP</td>
  <td>$vs__ProfileHTTP</td>
  <td>Virtual Server: HTTP Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileOneConnect</td>
  <td>$vs__ProfileOneConnect</td>
  <td>Virtual Server: OneConnect Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileCompression</td>
  <td>$vs__ProfileCompression</td>
  <td>Virtual Server: Compression Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_005</td>
</tr>
<tr>
  <td>vs.ProfileAnalytics</td>
  <td>$vs__ProfileAnalytics</td>
  <td>Virtual Server: Analytics Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_005</td>
</tr>
<tr>
  <td>vs.ProfileRequestLogging</td>
  <td>$vs__ProfileRequestLogging</td>
  <td>Virtual Server: Request Logging Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_005</td>
</tr>
<tr>
  <td>vs.ProfileDefaultPersist</td>
  <td>$vs__ProfileDefaultPersist</td>
  <td>Virtual Server: Default Persistence Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileFallbackPersist</td>
  <td>$vs__ProfileFallbackPersist</td>
  <td>Virtual Server: Fallback Persistence Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.SNATConfig</td>
  <td>$vs__SNATConfig</td>
  <td>Virtual Server: SNAT Configuration (enter SNAT pool name, 'automap' or leave blank to disable SNAT)</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileServerSSL</td>
  <td>$vs__ProfileServerSSL</td>
  <td>Virtual Server: Server SSL Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_005</td>
</tr>
<tr>
  <td>vs.ProfileClientSSL</td>
  <td>$vs__ProfileClientSSL</td>
  <td>Virtual Server: Client SSL Profile</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientSSLCert</td>
  <td>$vs__ProfileClientSSLCert</td>
  <td>Virtual Server: Client SSL Certificate</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientSSLKey</td>
  <td>$vs__ProfileClientSSLKey</td>
  <td>Virtual Server: Client SSL Key</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientSSLChain</td>
  <td>$vs__ProfileClientSSLChain</td>
  <td>Virtual Server: Client SSL Certificate Chain</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.ProfileClientSSLCipherString</td>
  <td>$vs__ProfileClientSSLCipherString</td>
  <td>Virtual Server: Client SSL Cipher String</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.OptionSourcePort</td>
  <td>$vs__OptionSourcePort</td>
  <td>Virtual Server: Source Port Behavior</td>
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
  <td>Virtual Server: Connection Mirroring</td>
  <td>[1, 2, 3, 4]</td>
  <td>boolean</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr>
  <td>vs.Irules</td>
  <td>$vs__Irules</td>
  <td>Virtual Server: iRules (to specify multiple iRules seperate with a comma ex: irule1,irule2,irule3)</td>
  <td>[1, 2, 3, 4]</td>
  <td>string</td>
  <td></td>
  <td>0.3_001</td>
</tr>
<tr><td colspan=7><b>Section: feature</b></td></tr>
<tr>
  <td>feature.statsTLS</td>
  <td>$feature__statsTLS</td>
  <td>TLS/SSL: Stats Reporting</td>
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
  <td>HTTP: Stats Reporting</td>
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
  <td>HTTP: Insert X-Forwarded-For Header</td>
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
  <td>HTTP: Security: Create HTTP(80)->HTTPS(443) Redirect</td>
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
  <td>TLS/SSL: Easy Cipher String (overrides VS section setting)</td>
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
  <td>HTTP: Security: Enable HTTP Strict Transport Security (only valid if ClientSSL is configured)</td>
  <td>[1, 2, 3, 4]</td>
  <td>choice</td>
  <td>disabled,
enabled,
enabled-preload,
enabled-subdomain,
enabled-preload-subdomain</td>
  <td>0.3_001</td>
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
