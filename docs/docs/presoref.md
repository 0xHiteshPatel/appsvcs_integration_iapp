# Section: iapp
<table><tr><td colspan=2>
## Field: iapp__strictUpdates
</td></tr>
<tr><td>Description:</td><td>Control [Strict Updates](https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-iapps-developer-11-4-0/2.html#unique_1198712211) mode</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>boolean</td></tr>
<tr><td>Default:</td><td>True</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: iapp__appStats
</td></tr>
<tr><td>Description:</td><td>Control whether Virtual Server/Pool statistics handlers are created in Standalone or iWorkflow mode</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow</td></tr>
<tr><td>Type:</td><td>boolean</td></tr>
<tr><td>Default:</td><td>True</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: iapp__mode
</td></tr>
<tr><td>Description:</td><td>The mode to use during deployment.  The default setting of auto determines the mode automatically.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>auto</td></tr>
<tr><td>Min. Version:</td><td>0.3_013</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: iapp__logLevel
</td></tr>
<tr><td>Description:</td><td>The log level to use during deployment.  0=silent, 10=most verbose</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>7</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: iapp__routeDomain
</td></tr>
<tr><td>Description:</td><td>The route domain to use during deployment.  Setting to &apos;auto&apos; determines the Route Domain automatically using the partition default-route-domain.  In APIC mode we determine the RD from the config since it doesn&apos;t set default-route-domain</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>auto</td></tr>
<tr><td>Min. Version:</td><td>0.3_013</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: iapp__asmDeployMode
</td></tr>
<tr><td>Description:</td><td>The behaviour to take on iApp (re)deployment for ASM policies.  The &apos;redeploy&apos; options will replace the existing policy with the one packaged in the template.  The &apos;preserve&apos; options keep the existing policy.  The &apos;block&apos; modifier to both preserve and redeploy marks the deployed virtual server down to prevent traffic from reaching pool members until policy deployment is complete.  The &apos;bypass&apos; modifier does not change the virtual server state, however, could cause traffic to bypass the policy until deployment completes.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>preserve-bypass</td></tr>
<tr><td>Choices:</td><td>preserve-bypass, preserve-block, redeploy-bypass, redeploy-block</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: iapp__apmDeployMode
</td></tr>
<tr><td>Description:</td><td>The behaviour to take on iApp (re)deployment for an APM policy.  The &apos;redeploy&apos; options will replace the existing policy with the one packaged in the template.  The &apos;preserve&apos; options keep the existing policy.  The &apos;block&apos; modifier to both preserve and redeploy marks the deployed virtual server down to prevent traffic from reaching pool members until policy deployment is complete.  The &apos;bypass&apos; modifier does not change the virtual server state, however, could cause traffic to bypass the policy until deployment completes.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>preserve-bypass</td></tr>
<tr><td>Choices:</td><td>preserve-bypass, preserve-block, redeploy-bypass, redeploy-block</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
</td></tr>
</table>
# Section: pool
<table><tr><td colspan=2>
## Field: pool__addr
</td></tr>
<tr><td>Description:</td><td>The destination address of the Virtual Server.  Specifying a value of &apos;255.255.255.254&apos; will skip Virtual Server creation.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>ipaddr</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json">test_monitors.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json">test_monitors_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json">test_pools.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json">test_pools_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json">test_pools_3.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json">test_pools_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: pool__mask
</td></tr>
<tr><td>Description:</td><td>The destination network mask of the Virtual Server</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>ipaddr</td></tr>
<tr><td>Default:</td><td>255.255.255.255</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: pool__port
</td></tr>
<tr><td>Description:</td><td>The L4 port the Virtual Server listens on.  &apos;*&apos; is supported</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>port</td></tr>
<tr><td>Default:</td><td>443</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json">test_monitors.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json">test_monitors_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json">test_pools.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json">test_pools_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json">test_pools_3.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json">test_pools_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: pool__DefaultPoolIndex
</td></tr>
<tr><td>Description:</td><td>The index of the pool to use as the default pool for the Virtual Server</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>number</td></tr>
<tr><td>Default:</td><td>0</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json">test_monitors.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json">test_monitors_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json">test_pools.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json">test_pools_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json">test_pools_3.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json">test_pools_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Table: pool__Pools<br>

<i>The pools to create.  Note that pool index must be &gt;0 and sequential.</i>
</td></tr><tr><td>
<table><thead><tr><th>Column</th><th>Details</th></tr></thead>
<tr><td>
###Index
</td><td><table>

<tr><td>Description:</td><td>The Pool Index of this Pool</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>number</td></tr>
<tr><td>Default:</td><td>0</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Name
</td><td><table>

<tr><td>Description:</td><td>The Name of this Pool</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Description
</td><td><table>

<tr><td>Description:</td><td>The Description of this Pool</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###LbMethod
</td><td><table>

<tr><td>Description:</td><td>The pool [Load Balancing Method](https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm_configuration_guide_10_0_0/ltm_pools.html#1215305) </td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>round-robin</td></tr>
<tr><td>Choices:</td><td>dynamic-ratio-member, dynamic-ratio-node, fastest-app-response, fastest-node, least-connections-member, least-connections-node, least-sessions, observed-member, observed-node, predictive-member, predictive-node, round-robin, ratio-member, ratio-node, ratio-session, ratio-least-connections-member, ratio-least-connections-node, weighted-least-connections-member</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Monitor
</td><td><table>

<tr><td>Description:</td><td>The pool monitor(s) and minimum number of monitors that have to pass can be specified using a string of the format &apos;[&lt;monitor index&gt;[,&lt;monitor index&gt;][;&lt;minimum # healthy&gt;]]&apos;.  For example &apos;0,1,2;2&apos; would associate the monitors with indexes 0, 1 and 2 and require at least 2 pass.  If no value is specified no monitor is associated with the pool</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###AdvOptions
</td><td><table>

<tr><td>Description:</td><td>The options to set in the created Pool.  Options can be specified using the format: &lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;[,&lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;]</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_012</td></tr>
</table></td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json">test_monitors.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json">test_monitors_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json">test_pools.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json">test_pools_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json">test_pools_3.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json">test_pools_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table></td></tr></table>
<table><tr><td colspan=2>
## Field: pool__MemberDefaultPort
</td></tr>
<tr><td>Description:</td><td>The L4 port to used when a pool member is added via a Dynamic Endpoint Insertion notication from Cisco APIC</td></tr>
<tr><td>Modes:</td><td>Cisco APIC</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>80</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json">test_pools_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json">test_pools_3.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json">test_pools_noindex.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Table: pool__Members<br>

<i>The configuration for Pool Members within the Pool.</i>
</td></tr><tr><td>
<table><thead><tr><th>Column</th><th>Details</th></tr></thead>
<tr><td>
###Index
</td><td><table>

<tr><td>Description:</td><td>The Pool Index this Member belongs to.  Used to support creation of multiple pools</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>number</td></tr>
<tr><td>Default:</td><td>0</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###IPAddress
</td><td><table>

<tr><td>Description:</td><td>IP Address OR Node Name of the Pool Member</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
</table></td></tr>
<tr><td>
###Port
</td><td><table>

<tr><td>Description:</td><td>L4 port of the Pool Member</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>80</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
</table></td></tr>
<tr><td>
###ConnectionLimit
</td><td><table>

<tr><td>Description:</td><td>The Connection Limit for the Pool Member.  &apos;0&apos; denotes unlimited connections</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>0</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
</table></td></tr>
<tr><td>
###Ratio
</td><td><table>

<tr><td>Description:</td><td>The Ratio weight for the Pool Member.  Used with &apos;ratio&apos; based Load Balancing Methods</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>1</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
</table></td></tr>
<tr><td>
###PriorityGroup
</td><td><table>

<tr><td>Description:</td><td>The Priority Group for the Pool Member.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>0</td></tr>
<tr><td>Min. Version:</td><td>1.0_002</td></tr>
</table></td></tr>
<tr><td>
###State
</td><td><table>

<tr><td>Description:</td><td>The administrative state of the Pool Member upon creation</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>enabled</td></tr>
<tr><td>Choices:</td><td>enabled, drain-disabled, disabled</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
</table></td></tr>
<tr><td>
###AdvOptions
</td><td><table>

<tr><td>Description:</td><td>The Advanced Options for the Pool Member.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json">test_monitors.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json">test_monitors_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json">test_pools.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json">test_pools_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json">test_pools_3.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json">test_pools_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table></td></tr></table>
# Section: monitor
<table><tr><td colspan=2>
## Table: monitor__Monitors<br>

<i>The monitors to create/associate.  Note that monitor index must be &gt;0 and sequential.</i>
</td></tr><tr><td>
<table><thead><tr><th>Column</th><th>Details</th></tr></thead>
<tr><td>
###Index
</td><td><table>

<tr><td>Description:</td><td>The Index of this Monitor</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>number</td></tr>
<tr><td>Default:</td><td>0</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Name
</td><td><table>

<tr><td>Description:</td><td>The Name of the Monitor to create or associate.  To associate an existing monitor specify the full path to the existing monitor object (e.g. &apos;/Common/http&apos;)</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Type
</td><td><table>

<tr><td>Description:</td><td>The Type of this Monitor.  To determine the available types on a BIG-IP system execute &apos;tmsh create ltm monitor ?&apos; from the CLI</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Options
</td><td><table>

<tr><td>Description:</td><td>The options to set in the created Monitor.  Options can be specified using the format: &lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;[,&lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;]</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json">test_monitors.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json">test_monitors_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json">test_pools.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json">test_pools_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json">test_pools_3.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json">test_pools_noindex.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table></td></tr></table>
# Section: vs
<table><tr><td colspan=2>
## Table: vs__Listeners<br>

<i>A list of additional IPv4/IPv6 listeners to create.  All listeners will be configured identically except if flags are specified in the Destination column modifying specific profiles.</i>
</td></tr><tr><td>
<table><thead><tr><th>Column</th><th>Details</th></tr></thead>
<tr><td>
###Listener
</td><td><table>

<tr><td>Description:</td><td>Listener to create in &lt;address&gt;:&lt;port&gt; format</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Destination
</td><td><table>

<tr><td>Description:</td><td>The destination for traffic bound for this listener in the format (default|&lt;pool index&gt;|redirect|&lt;TMOS pool object path&gt;)[;(nossl|noclientssl|noserverssl)].  If no value or the keyword &apos;default&apos; is specified the default pool index will be used.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
</td></tr>
</table></td></tr></table>
<table><tr><td colspan=2>
## Field: vs__Name
</td></tr>
<tr><td>Description:</td><td>The name of the Virtual Server.  If no value is specified the name will be set to &lt;iapp_name&gt;_vs</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__Description
</td></tr>
<tr><td>Description:</td><td>The description string configured in the Virtual Server</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__RouteAdv
</td></tr>
<tr><td>Description:</td><td>Control the route-advertisement behaviour setting of the associated Virtual Address object.  Routing protocol configuration must be completed on the device manually.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>disabled</td></tr>
<tr><td>Choices:</td><td>disabled, all_vs, any_vs, always</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__SourceAddress
</td></tr>
<tr><td>Description:</td><td>The source address filter for the Virtual Server</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>0.0.0.0/0</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__IpProtocol
</td></tr>
<tr><td>Description:</td><td>The IP Protocol of the Virtual Server (e.g. tcp, udp)</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>tcp</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ConnectionLimit
</td></tr>
<tr><td>Description:</td><td>The connection limit for the virtual server.  A value of &apos;0&apos; means no limit</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>0</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileClientProtocol
</td></tr>
<tr><td>Description:</td><td>The client-side protocol profile.  This field supports the &apos;create:&apos; format for customization</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/tcp-wan-optimized</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileServerProtocol
</td></tr>
<tr><td>Description:</td><td>The server-side protocol profile.  This field supports the &apos;create:&apos; format for customization</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/tcp-lan-optimized</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileHTTP
</td></tr>
<tr><td>Description:</td><td>The HTTP protocol profile.  This field supports the &apos;create:&apos; format for customization</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/http</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileOneConnect
</td></tr>
<tr><td>Description:</td><td>The oneconnect profile.  This field supports the &apos;create:&apos; format for customization</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/oneconnect</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileCompression
</td></tr>
<tr><td>Description:</td><td>The compression profile.  This field supports the &apos;create:&apos; format for customization</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/httpcompression</td></tr>
<tr><td>Min. Version:</td><td>0.3_005</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileAnalytics
</td></tr>
<tr><td>Description:</td><td>The analytics profile</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_005</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileRequestLogging
</td></tr>
<tr><td>Description:</td><td>The request logging profile.  This field supports the &apos;create:&apos; format for customization</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_005</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileDefaultPersist
</td></tr>
<tr><td>Description:</td><td>The default persistence profile.  This field supports the &apos;create:&apos; format for customization.  A key of &apos;type&apos; specifying the persisence type to create must be specified (ex: create:type=cookie;...)</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/cookie</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileFallbackPersist
</td></tr>
<tr><td>Description:</td><td>The fallback persistence profile.  This field supports the &apos;create:&apos; format for customization.  A key of &apos;type&apos; specifying the persisence type to create must be specified (ex: create:type=cookie;...)</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/source_addr</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__SNATConfig
</td></tr>
<tr><td>Description:</td><td>The SNAT option to use.  Specifiy &apos;automap&apos;,&apos;/Common/&lt;existing_snat_pool_name&gt;&apos;,&apos;partition-default&apos;,&apos;create:&lt;ip1,&gt;....&lt;ipX&gt;&apos;.  The partition-default option references a SNAT pool created by Cisco APIC as part of the APIC partition</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>automap</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json">test_vs_standard_http.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json">test_vs_standard_http_autoxff.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json">test_vs_standard_http_ipv6.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json">test_vs_standard_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json">test_vs_standard_tcp_rd_auto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json">test_vs_standard_tcp_rd_nonauto.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json">test_vs_standard_tcp_routeadv_all.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json">test_vs_standard_tcp_routeadv_always.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json">test_vs_standard_tcp_routeadv_any.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json">test_vs_standard_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileServerSSL
</td></tr>
<tr><td>Description:</td><td>The server-ssl profile.  This field supports the &apos;create:&apos; format for customization</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_005</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileClientSSL
</td></tr>
<tr><td>Description:</td><td>The path to an existing Client-SSL profile.  If specified this value overrides Client-SSL profile creation</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileClientSSLCert
</td></tr>
<tr><td>Description:</td><td>The path to an existing SSL Certificate.  If the word &apos;auto&apos; is specfied the value /Common/&lt;iapp_name&gt;.crt will be substituted.  This field also supports the url=&lt;url&gt; format to load a PEM encoded resources.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/default.crt</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileClientSSLKey
</td></tr>
<tr><td>Description:</td><td>The path to an existing SSL Key.  If the word &apos;auto&apos; is specfied the value /Common/&lt;iapp_name&gt;.key will be substituted.  This field also supports the url=&lt;url&gt; format to load a PEM encoded resources.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/default.key</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileClientSSLChain
</td></tr>
<tr><td>Description:</td><td>The path to the SSL Certicate Chain bundle.  This field also supports the url=&lt;url&gt; format to load a PEM encoded resources.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/ca-bundle.crt</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileClientSSLCipherString
</td></tr>
<tr><td>Description:</td><td>The SSL [Cipher String](https://support.f5.com/kb/en-us/solutions/public/13000/100/sol13171.html)</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>DEFAULT:!SSLV3</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileClientSSLAdvOptions
</td></tr>
<tr><td>Description:</td><td>The options to set in the created Client-SSL profile.  Options can be specified using the format: &lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;[,&lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;]</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_010</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json">test_vs_standard_https.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json">test_vs_standard_https_create.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json">test_vs_standard_https_create_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json">test_vs_standard_https_serverssl.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json">test_vs_standard_https_serverssl_create.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileSecurityLogProfiles
</td></tr>
<tr><td>Description:</td><td>A comma seperated list of existing security logging profiles</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_008</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileSecurityIPBlacklist
</td></tr>
<tr><td>Description:</td><td>Configuration for the IP Intelligence Dynamic IP Blacklist.  An existing subscription is required for this feature.  A pre-exsiting policy may be specified by entering it&apos;s full path (ex: /Common/my_ipi_policy)</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>none</td></tr>
<tr><td>Min. Version:</td><td>0.3_015</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileSecurityDoS
</td></tr>
<tr><td>Description:</td><td>The DoS Protection Policy to configure</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_016</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileAccess
</td></tr>
<tr><td>Description:</td><td>The APM Access Policy to configure.  To automatically associate a bundled APM policy after deployment use the value &apos;use-bundled&apos;</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_011</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfileConnectivity
</td></tr>
<tr><td>Description:</td><td>The APM Connectivity Policy to configure</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_011</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__ProfilePerRequest
</td></tr>
<tr><td>Description:</td><td>The APM Per-Request Policy to configure</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_011</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__OptionSourcePort
</td></tr>
<tr><td>Description:</td><td>The source port translation behavior</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>preserve</td></tr>
<tr><td>Choices:</td><td>preserve, preserve-strict, change</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__OptionConnectionMirroring
</td></tr>
<tr><td>Description:</td><td>The connection mirroring behavior</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>boolean</td></tr>
<tr><td>Default:</td><td>False</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__Irules
</td></tr>
<tr><td>Description:</td><td>A comma seperated list of existing iRules to attach to the virtual server.  Ordering is preserved.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json">test_vs_standard_http_options.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json">test_vs_standard_http_options_2.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__BundledItems
</td></tr>
<tr><td>Description:</td><td>The bundled items to deploy.  See bundled/README for more info.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>dynamic_filelist_multi</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_014</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json">test_vs_standard_http_bundle_irule.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json">test_vs_standard_https_bundle_apm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json">test_vs_standard_https_bundle_apm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json">test_vs_standard_https_bundle_apm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json">test_vs_standard_https_bundle_apm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__AdvOptions
</td></tr>
<tr><td>Description:</td><td>The options to set in the created Virtual Server.  Options can be specified using the format: &lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;[,&lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;]</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_010</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json">test_vs_fasthttp_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json">test_vs_fastl4_tcp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json">test_vs_fastl4_udp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json">test_vs_ipforward.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json">test_vs_ipforward_emptypool.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json">test_vs_ipother.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json">test_vs_sctp.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json">test_vs_standard_tcp_options.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__AdvProfiles
</td></tr>
<tr><td>Description:</td><td>A comma-seperated list of profiles to link to the Virtual Server: &lt;profile_name&gt;[,&lt;profile_name&gt;]</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_010</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__AdvPolicies
</td></tr>
<tr><td>Description:</td><td>A comma-seperated list of policies to link to the Virtual Server: &lt;policy_name&gt;[,&lt;policy_name&gt;]</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: vs__VirtualAddrAdvOptions
</td></tr>
<tr><td>Description:</td><td>The options to set in the global Virtual Address object.  Options can be specified using the format: &lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;[,&lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;]</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json">test_vs_standard_tcp_virt_addr_options.json</a><br>
</td></tr>
</table>
# Section: l7policy
<table><tr><td colspan=2>
## Field: l7policy__strategy
</td></tr>
<tr><td>Description:</td><td>The Matching Strategy to use for the [L7 Policy](https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html).</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td>/Common/first-match</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: l7policy__defaultASM
</td></tr>
<tr><td>Description:</td><td>The default ASM policy to use for the L7 Policy.  Specifying a value of &apos;bypass&apos; will set all actions to bypass ASM processing unless a explicit ASM Action Target is specified</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>bypass</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: l7policy__defaultL7DOS
</td></tr>
<tr><td>Description:</td><td>The default L7 DoS policy to use for the L7 Policy.  Specifying a value of &apos;bypass&apos; will set all actions to bypass ASM processing unless a explicit L7 DoS Action Target is specified</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>bypass</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Table: l7policy__rulesMatch<br>

<i>The L7 policy ruleset matches to configure.  https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html</i>
</td></tr><tr><td>
<table><thead><tr><th>Column</th><th>Details</th></tr></thead>
<tr><td>
###Group
</td><td><table>

<tr><td>Description:</td><td>The group for this match rule.  The corresponding action is configured by specifying a matching action with the same group(s).  Multiple rows with the same group may be specified to create multiple match conditions.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Operand
</td><td><table>

<tr><td>Description:</td><td>The specific operand to use for a policy match.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Negate
</td><td><table>

<tr><td>Description:</td><td>Reverses the meaning of the operation (for example, enabling Negate and specifying https as the starts-with value resolves to true if the header does not start with https).</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>no</td></tr>
<tr><td>Choices:</td><td>no, yes</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Condition
</td><td><table>

<tr><td>Description:</td><td>Specifies a conditions to use for matching.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Choices:</td><td>equals, starts-with, ends-with, contains, greater, greater-or-equal, less, less-or-equal</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Value
</td><td><table>

<tr><td>Description:</td><td>Specifies a list of values the operand is matched against.  To specify multiple values seperate with a &apos;;&apos;</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###CaseSensitive
</td><td><table>

<tr><td>Description:</td><td>Specifies a list of values the operand is matched against.  To specify multiple values seperate with a &apos;;&apos;</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>no</td></tr>
<tr><td>Choices:</td><td>no, yes</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Missing
</td><td><table>

<tr><td>Description:</td><td>Indicates whether a value can be missing.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>no</td></tr>
<tr><td>Choices:</td><td>no, yes</td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
</td></tr>
</table></td></tr></table>
<table><tr><td colspan=2>
## Table: l7policy__rulesAction<br>

<i>The L7 policy ruleset actions to configure.  https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html</i>
</td></tr><tr><td>
<table><thead><tr><th>Column</th><th>Details</th></tr></thead>
<tr><td>
###Group
</td><td><table>

<tr><td>Description:</td><td>The group for this action rule.  Multiple rows with the same group may be specified to create multiple action targets</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Target
</td><td><table>

<tr><td>Description:</td><td>The specific target to use for a policy match.</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>editchoice</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>
###Parameter
</td><td><table>

<tr><td>Description:</td><td>Specifies the value for the action. Possible values depend on the target.  Multiple values can be entered by seperating with a &apos;;&apos;.  To reference a bundled policy item for use with a supported target use the format &apos;bundled:&lt;bundled item name&gt;&apos;</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>2.0_001</td></tr>
</table></td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json">test_vs_standard_https_bundle_all_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json">test_vs_standard_https_bundle_all_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json">test_vs_standard_https_bundle_all_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json">test_vs_standard_https_bundle_all_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json">test_vs_standard_https_bundle_all_url.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json">test_vs_standard_https_bundle_asm_preserve.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json">test_vs_standard_https_bundle_asm_preserve_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json">test_vs_standard_https_bundle_asm_redeploy.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json">test_vs_standard_https_bundle_asm_redeploy_2.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json">test_vs_standard_https_l7policy.json</a><br>
</td></tr>
</table></td></tr></table>
# Section: feature
<table><tr><td colspan=2>
## Field: feature__statsTLS
</td></tr>
<tr><td>Description:</td><td>TLS/SSL Statistics reporting.  The auto option will enable this feature if a client-ssl profile is attached, otherwise disable</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>auto</td></tr>
<tr><td>Choices:</td><td>auto, enabled, disabled</td></tr>
<tr><td>Min. Version:</td><td>0.3_006</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: feature__statsHTTP
</td></tr>
<tr><td>Description:</td><td>HTTP Statistics reporting.  The auto option will enable this feature if a http profile is attached, otherwise disable</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>auto</td></tr>
<tr><td>Choices:</td><td>auto, enabled, disabled</td></tr>
<tr><td>Min. Version:</td><td>0.3_006</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: feature__insertXForwardedFor
</td></tr>
<tr><td>Description:</td><td>Insert the X-Forwarded-For header.  The auto option will enable this feature if a HTTP profile and SNAT is configured, otherwise disable</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>auto</td></tr>
<tr><td>Choices:</td><td>auto, enabled, disabled</td></tr>
<tr><td>Min. Version:</td><td>0.3_005</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: feature__redirectToHTTPS
</td></tr>
<tr><td>Description:</td><td>Create a virtual service on TCP/80 that performs a 302 HTTP redirect to TCP/443 on the same IP address.  The auto option will enable this feature if a HTTP profile is configured and the TCP port is 443, otherwise disable</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>auto</td></tr>
<tr><td>Choices:</td><td>auto, enabled, disabled</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: feature__sslEasyCipher
</td></tr>
<tr><td>Description:</td><td>Easily configure TLS/SSL Cipher Strings.  This setting overrides the value in the Virtual Server section</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>disabled</td></tr>
<tr><td>Choices:</td><td>compatible, medium, high, tls_1.2, tls_1.1+1.2, disabled</td></tr>
<tr><td>Min. Version:</td><td>0.3_007</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: feature__securityEnableHSTS
</td></tr>
<tr><td>Description:</td><td>Enabled insertion of the Strict-Transport-Security HTTP header.  The preload and subdomain options can be omitted or included based on this selection.  This setting also modifies creation of the HTTP-&gt;HTTPS redirect option to perform a 301 HTTP redirect</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>disabled</td></tr>
<tr><td>Choices:</td><td>disabled, enabled, enabled-preload, enabled-subdomain, enabled-preload-subdomain</td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json">test_vs_standard_https_features.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json">test_vs_standard_https_multi_listeners.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: feature__easyL4Firewall
</td></tr>
<tr><td>Description:</td><td>Configure a AFM L4 Firewall policy.  The &apos;base&apos; option creates a policy that allows traffic to the Virtual Server with optional Blacklist and Source addresses specified in the following fields.  The base+ip_blacklist options also configure an IP Intelligence Blacklist policy in either blocking or logging mode.  The auto mode is equivalent to the base+ip_blacklist_block option with the exception that if a user-specfic IPI policy is specified it will be preserved</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>choice</td></tr>
<tr><td>Default:</td><td>auto</td></tr>
<tr><td>Choices:</td><td>auto, base, base+ip_blacklist_block, base+ip_blacklist_log, disabled</td></tr>
<tr><td>Min. Version:</td><td>0.3_008</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Table: feature__easyL4FirewallBlacklist<br>

<i>A list of CIDR formatted blacklisted IP/Network ranges.  Packets sourced from these networks will be dropped</i>
</td></tr><tr><td>
<table><thead><tr><th>Column</th><th>Details</th></tr></thead>
<tr><td>
###CIDRRange
</td><td><table>

<tr><td>Description:</td><td>CIDR Range</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_008</td></tr>
</table></td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table></td></tr></table>
<table><tr><td colspan=2>
## Table: feature__easyL4FirewallSourceList<br>

<i>A list of CIDR formatted allowed IP/Network ranges.  Packets sourced from these networks will be allowed</i>
</td></tr><tr><td>
<table><thead><tr><th>Column</th><th>Details</th></tr></thead>
<tr><td>
###CIDRRange
</td><td><table>

<tr><td>Description:</td><td>CIDR Range</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td>0.0.0.0/0</td></tr>
<tr><td>Min. Version:</td><td>0.3_008</td></tr>
</table></td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json">test_vs_standard_http_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json">test_vs_standard_tcp_afm.json</a><br>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json">test_vs_standard_udp_afm.json</a><br>
</td></tr>
</table></td></tr></table>
# Section: extensions
<table><tr><td colspan=2>
## Field: extensions__Field1
</td></tr>
<tr><td>Description:</td><td>Extensions: Field 1</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: extensions__Field2
</td></tr>
<tr><td>Description:</td><td>Extensions: Field 2</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
<table><tr><td colspan=2>
## Field: extensions__Field3
</td></tr>
<tr><td>Description:</td><td>Extensions: Field 3</td></tr>
<tr><td>Modes:</td><td>Standalone, iWorkflow, Cisco APIC, VMware NSX</td></tr>
<tr><td>Type:</td><td>string</td></tr>
<tr><td>Default:</td><td></td></tr>
<tr><td>Min. Version:</td><td>0.3_001</td></tr>
<tr><td>Examples:</td><td>
<a href="https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json">include_defaults.json</a><br>
</td></tr>
</table>
