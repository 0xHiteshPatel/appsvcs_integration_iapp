Presentation Layer Reference
============================

Section: iapp
-------------

Field: iapp__strictUpdates
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Control `Strict Updates <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-iapps-developer-11-4-0/2.html#unique_1198712211>`_ mode"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","boolean"
	"Default","True"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: iapp__appStats
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Control whether Virtual Server/Pool statistics handlers are created in Standalone or iWorkflow mode"
	"Modes","Standalone, iWorkflow"
	"Type","boolean"
	"Default","True"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__"

Field: iapp__mode
^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The mode to use during deployment.  The default setting of auto determines the mode automatically."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","auto"
	"Min. Version","0.3_013"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: iapp__logLevel
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The log level to use during deployment.  0=silent, 10=most verbose"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","7"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: iapp__routeDomain
^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The route domain to use during deployment.  Setting to 'auto' determines the Route Domain automatically using the partition default-route-domain.  In APIC mode we determine the RD from the config since it doesn't set default-route-domain"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","auto"
	"Min. Version","0.3_013"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__"

Field: iapp__asmDeployMode
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The behaviour to take on iApp (re)deployment for ASM policies.  The 'redeploy' options will replace the existing policy with the one packaged in the template.  The 'preserve' options keep the existing policy.  The 'block' modifier to both preserve and redeploy marks the deployed virtual server down to prevent traffic from reaching pool members until policy deployment is complete.  The 'bypass' modifier does not change the virtual server state, however, could cause traffic to bypass the policy until deployment completes."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","preserve-bypass"
	"Choices","preserve-bypass, preserve-block, redeploy-bypass, redeploy-block"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__"

Field: iapp__apmDeployMode
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The behaviour to take on iApp (re)deployment for an APM policy.  The 'redeploy' options will replace the existing policy with the one packaged in the template.  The 'preserve' options keep the existing policy.  The 'block' modifier to both preserve and redeploy marks the deployed virtual server down to prevent traffic from reaching pool members until policy deployment is complete.  The 'bypass' modifier does not change the virtual server state, however, could cause traffic to bypass the policy until deployment completes."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","preserve-bypass"
	"Choices","preserve-bypass, preserve-block, redeploy-bypass, redeploy-block"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__"

Section: pool
-------------

Field: pool__addr
^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The destination address of the Virtual Server.  Specifying a value of '255.255.255.254' will skip Virtual Server creation."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","ipaddr"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Field: pool__mask
^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The destination network mask of the Virtual Server"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","ipaddr"
	"Default","255.255.255.255"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__"

Field: pool__port
^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The L4 port the Virtual Server listens on.  '*' is supported"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","port"
	"Default","443"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Field: pool__DefaultPoolIndex
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The index of the pool to use as the default pool for the Virtual Server"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","number"
	"Default","0"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Table: pool__Pools
^^^^^^^^^^^^^^^^^^

The pools to create.  Note that pool index must be >0 and sequential.

.. csv-table::
	:header: "Column","Details"
	:widths: 20 80
	:stub-columns: 1

	"Index",.. include:: pool__Pools_Index.rst
	"Name",.. include:: pool__Pools_Name.rst
	"Description",.. include:: pool__Pools_Description.rst
	"LbMethod",.. include:: pool__Pools_LbMethod.rst
	"Monitor",.. include:: pool__Pools_Monitor.rst
	"AdvOptions",.. include:: pool__Pools_AdvOptions.rst
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Field: pool__MemberDefaultPort
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The L4 port to used when a pool member is added via a Dynamic Endpoint Insertion notication from Cisco APIC"
	"Modes","Cisco APIC"
	"Type","string"
	"Default","80"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__"

Table: pool__Members
^^^^^^^^^^^^^^^^^^^^

The configuration for Pool Members within the Pool.

.. csv-table::
	:header: "Column","Details"
	:widths: 20 80
	:stub-columns: 1

	"Index",.. include:: pool__Members_Index.rst
	"IPAddress",.. include:: pool__Members_IPAddress.rst
	"Port",.. include:: pool__Members_Port.rst
	"ConnectionLimit",.. include:: pool__Members_ConnectionLimit.rst
	"Ratio",.. include:: pool__Members_Ratio.rst
	"PriorityGroup",.. include:: pool__Members_PriorityGroup.rst
	"State",.. include:: pool__Members_State.rst
	"AdvOptions",.. include:: pool__Members_AdvOptions.rst
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Section: monitor
----------------

Table: monitor__Monitors
^^^^^^^^^^^^^^^^^^^^^^^^

The monitors to create/associate.  Note that monitor index must be >0 and sequential.

.. csv-table::
	:header: "Column","Details"
	:widths: 20 80
	:stub-columns: 1

	"Index",.. include:: monitor__Monitors_Index.rst
	"Name",.. include:: monitor__Monitors_Name.rst
	"Type",.. include:: monitor__Monitors_Type.rst
	"Options",.. include:: monitor__Monitors_Options.rst
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Section: vs
-----------

Table: vs__Listeners
^^^^^^^^^^^^^^^^^^^^

A list of additional IPv4/IPv6 listeners to create.  All listeners will be configured identically except if flags are specified in the Destination column modifying specific profiles.

.. csv-table::
	:header: "Column","Details"
	:widths: 20 80
	:stub-columns: 1

	"Listener",.. include:: vs__Listeners_Listener.rst
	"Destination",.. include:: vs__Listeners_Destination.rst
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__"

Field: vs__Name
^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The name of the Virtual Server.  If no value is specified the name will be set to <iapp_name>_vs"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Field: vs__Description
^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The description string configured in the Virtual Server"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Field: vs__RouteAdv
^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Control the route-advertisement behaviour setting of the associated Virtual Address object.  Routing protocol configuration must be completed on the device manually."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","disabled"
	"Choices","disabled, all_vs, any_vs, always"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__"

Field: vs__SourceAddress
^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The source address filter for the Virtual Server"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","0.0.0.0/0"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

Field: vs__IpProtocol
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The IP Protocol of the Virtual Server (e.g. tcp, udp)"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","tcp"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Field: vs__ConnectionLimit
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The connection limit for the virtual server.  A value of '0' means no limit"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","0"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

Field: vs__ProfileClientProtocol
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The client-side protocol profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/tcp-wan-optimized"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Field: vs__ProfileServerProtocol
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The server-side protocol profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/tcp-lan-optimized"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Field: vs__ProfileHTTP
^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The HTTP protocol profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/http"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileOneConnect
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The oneconnect profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/oneconnect"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileCompression
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The compression profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/httpcompression"
	"Min. Version","0.3_005"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileAnalytics
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The analytics profile"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_005"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: vs__ProfileRequestLogging
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The request logging profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_005"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: vs__ProfileDefaultPersist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The default persistence profile.  This field supports the 'create:' format for customization.  A key of 'type' specifying the persisence type to create must be specified (ex: create:type=cookie;...)"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/cookie"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

Field: vs__ProfileFallbackPersist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The fallback persistence profile.  This field supports the 'create:' format for customization.  A key of 'type' specifying the persisence type to create must be specified (ex: create:type=cookie;...)"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/source_addr"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__SNATConfig
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The SNAT option to use.  Specifiy 'automap','/Common/<existing_snat_pool_name>','partition-default','create:<ip1,>....<ipX>'.  The partition-default option references a SNAT pool created by Cisco APIC as part of the APIC partition"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","automap"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Field: vs__ProfileServerSSL
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The server-ssl profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_005"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileClientSSL
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The path to an existing Client-SSL profile.  If specified this value overrides Client-SSL profile creation"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileClientSSLCert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The path to an existing SSL Certificate.  If the word 'auto' is specfied the value /Common/<iapp_name>.crt will be substituted.  This field also supports the url=<url> format to load a PEM encoded resources."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/default.crt"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileClientSSLKey
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The path to an existing SSL Key.  If the word 'auto' is specfied the value /Common/<iapp_name>.key will be substituted.  This field also supports the url=<url> format to load a PEM encoded resources."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/default.key"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileClientSSLChain
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The path to the SSL Certicate Chain bundle.  This field also supports the url=<url> format to load a PEM encoded resources."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/ca-bundle.crt"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileClientSSLCipherString
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The SSL `Cipher String <https://support.f5.com/kb/en-us/solutions/public/13000/100/sol13171.html>`_"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","DEFAULT:!SSLV3"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileClientSSLAdvOptions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The options to set in the created Client-SSL profile.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_010"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

Field: vs__ProfileSecurityLogProfiles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","A comma seperated list of existing security logging profiles"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_008"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: vs__ProfileSecurityIPBlacklist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Configuration for the IP Intelligence Dynamic IP Blacklist.  An existing subscription is required for this feature.  A pre-exsiting policy may be specified by entering it's full path (ex: /Common/my_ipi_policy)"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","none"
	"Min. Version","0.3_015"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: vs__ProfileSecurityDoS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The DoS Protection Policy to configure"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_016"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: vs__ProfileAccess
^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The APM Access Policy to configure.  To automatically associate a bundled APM policy after deployment use the value 'use-bundled'"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_011"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__"

Field: vs__ProfileConnectivity
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The APM Connectivity Policy to configure"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_011"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: vs__ProfilePerRequest
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The APM Per-Request Policy to configure"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_011"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: vs__OptionSourcePort
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The source port translation behavior"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","preserve"
	"Choices","preserve, preserve-strict, change"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

Field: vs__OptionConnectionMirroring
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The connection mirroring behavior"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","boolean"
	"Default","False"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

Field: vs__Irules
^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","A comma seperated list of existing iRules to attach to the virtual server.  Ordering is preserved."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__"

Field: vs__BundledItems
^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The bundled items to deploy.  See bundled/README for more info."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","dynamic_filelist_multi"
	"Default",""
	"Min. Version","0.3_014"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__"

Field: vs__AdvOptions
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The options to set in the created Virtual Server.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_010"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

Field: vs__AdvProfiles
^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","A comma-seperated list of profiles to link to the Virtual Server: <profile_name>[,<profile_name>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_010"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: vs__AdvPolicies
^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","A comma-seperated list of policies to link to the Virtual Server: <policy_name>[,<policy_name>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: vs__VirtualAddrAdvOptions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The options to set in the global Virtual Address object.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__"

Section: l7policy
-----------------

Field: l7policy__strategy
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The Matching Strategy to use for the `L7 Policy <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html>`_"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/first-match"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: l7policy__defaultASM
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The default ASM policy to use for the L7 Policy.  Specifying a value of 'bypass' will set all actions to bypass ASM processing unless a explicit ASM Action Target is specified"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","bypass"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: l7policy__defaultL7DOS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","The default L7 DoS policy to use for the L7 Policy.  Specifying a value of 'bypass' will set all actions to bypass ASM processing unless a explicit L7 DoS Action Target is specified"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","bypass"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Table: l7policy__rulesMatch
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The L7 policy `Matching <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html>`_ ruleset to configure.

.. csv-table::
	:header: "Column","Details"
	:widths: 20 80
	:stub-columns: 1

	"Group",.. include:: l7policy__rulesMatch_Group.rst
	"Operand",.. include:: l7policy__rulesMatch_Operand.rst
	"Negate",.. include:: l7policy__rulesMatch_Negate.rst
	"Condition",.. include:: l7policy__rulesMatch_Condition.rst
	"Value",.. include:: l7policy__rulesMatch_Value.rst
	"CaseSensitive",.. include:: l7policy__rulesMatch_CaseSensitive.rst
	"Missing",.. include:: l7policy__rulesMatch_Missing.rst
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__"

Table: l7policy__rulesAction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The L7 policy `Action <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html>`_ ruleset actions to configure

.. csv-table::
	:header: "Column","Details"
	:widths: 20 80
	:stub-columns: 1

	"Group",.. include:: l7policy__rulesAction_Group.rst
	"Target",.. include:: l7policy__rulesAction_Target.rst
	"Parameter",.. include:: l7policy__rulesAction_Parameter.rst
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__"

Section: feature
----------------

Field: feature__statsTLS
^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","TLS/SSL Statistics reporting.  The auto option will enable this feature if a client-ssl profile is attached, otherwise disable"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Choices","auto, enabled, disabled"
	"Min. Version","0.3_006"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: feature__statsHTTP
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","HTTP Statistics reporting.  The auto option will enable this feature if a http profile is attached, otherwise disable"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Choices","auto, enabled, disabled"
	"Min. Version","0.3_006"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: feature__insertXForwardedFor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Insert the X-Forwarded-For header.  The auto option will enable this feature if a HTTP profile and SNAT is configured, otherwise disable"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Choices","auto, enabled, disabled"
	"Min. Version","0.3_005"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__"

Field: feature__redirectToHTTPS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Create a virtual service on TCP/80 that performs a 302 HTTP redirect to TCP/443 on the same IP address.  The auto option will enable this feature if a HTTP profile is configured and the TCP port is 443, otherwise disable"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Choices","auto, enabled, disabled"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__"

Field: feature__sslEasyCipher
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Easily configure TLS/SSL Cipher Strings.  This setting overrides the value in the Virtual Server section"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","disabled"
	"Choices","compatible, medium, high, tls_1.2, tls_1.1+1.2, disabled"
	"Min. Version","0.3_007"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__"

Field: feature__securityEnableHSTS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Enabled insertion of the Strict-Transport-Security HTTP header.  The preload and subdomain options can be omitted or included based on this selection.  This setting also modifies creation of the HTTP->HTTPS redirect option to perform a 301 HTTP redirect"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","disabled"
	"Choices","disabled, enabled, enabled-preload, enabled-subdomain, enabled-preload-subdomain"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__"

Field: feature__easyL4Firewall
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Configure a AFM L4 Firewall policy.  The 'base' option creates a policy that allows traffic to the Virtual Server with optional Blacklist and Source addresses specified in the following fields.  The base+ip_blacklist options also configure an IP Intelligence Blacklist policy in either blocking or logging mode.  The auto mode is equivalent to the base+ip_blacklist_block option with the exception that if a user-specfic IPI policy is specified it will be preserved"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Choices","auto, base, base+ip_blacklist_block, base+ip_blacklist_log, disabled"
	"Min. Version","0.3_008"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Table: feature__easyL4FirewallBlacklist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A list of CIDR formatted blacklisted IP/Network ranges.  Packets sourced from these networks will be dropped

.. csv-table::
	:header: "Column","Details"
	:widths: 20 80
	:stub-columns: 1

	"CIDRRange",.. include:: feature__easyL4FirewallBlacklist_CIDRRange.rst
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Table: feature__easyL4FirewallSourceList
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A list of CIDR formatted allowed IP/Network ranges.  Packets sourced from these networks will be allowed

.. csv-table::
	:header: "Column","Details"
	:widths: 20 80
	:stub-columns: 1

	"CIDRRange",.. include:: feature__easyL4FirewallSourceList_CIDRRange.rst
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Section: extensions
-------------------

Field: extensions__Field1
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Extensions: Field 1"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: extensions__Field2
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Extensions: Field 2"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

Field: extensions__Field3
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:widths: 20 80

	"Description","Extensions: Field 3"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

