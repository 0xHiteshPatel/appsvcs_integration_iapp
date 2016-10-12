Presentation Layer Reference
============================

Section: iapp
-------------

.. _preso-iapp-strictUpdates:

Field: iapp__strictUpdates
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","iApp: Strict Updates"
	"Description","Control `Strict Updates <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-iapps-developer-11-4-0/2.html#unique_1198712211>`_ mode"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","boolean"
	"Default","True"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-iapp-appStats:

Field: iapp__appStats
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","iApp: Statistics Handler Creation"
	"Description","Control whether Virtual Server/Pool statistics handlers are created in Standalone or iWorkflow mode"
	"Modes","Standalone, iWorkflow"
	"Type","boolean"
	"Default","True"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__"

.. _preso-iapp-mode:

Field: iapp__mode
^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","iApp: Mode"
	"Description","The mode to use during deployment.  The default setting of auto determines the mode automatically."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","auto"
	"Min. Version","0.3_013"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-iapp-logLevel:

Field: iapp__logLevel
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","iApp: Log Level"
	"Description","The log level to use during deployment.  0=silent, 10=most verbose"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","7"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-iapp-routeDomain:

Field: iapp__routeDomain
^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","iApp: Route Domain"
	"Description","The route domain to use during deployment.  Setting to 'auto' determines the Route Domain automatically using the partition default-route-domain.  In APIC mode we determine the RD from the config since it doesn't set default-route-domain"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","auto"
	"Min. Version","0.3_013"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__"

.. _preso-iapp-asmDeployMode:

Field: iapp__asmDeployMode
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","iApp: ASM: Deployment Mode"
	"Description","The behaviour to take on iApp (re)deployment for ASM policies.  The 'redeploy' options will replace the existing policy with the one packaged in the template.  The 'preserve' options keep the existing policy.  The 'block' modifier to both preserve and redeploy marks the deployed virtual server down to prevent traffic from reaching pool members until policy deployment is complete.  The 'bypass' modifier does not change the virtual server state, however, could cause traffic to bypass the policy until deployment completes."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","preserve-bypass"
	"Min. Version","2.0_001"
	"Choices","preserve-bypass, preserve-block, redeploy-bypass, redeploy-block"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__"

.. _preso-iapp-apmDeployMode:

Field: iapp__apmDeployMode
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","iApp: APM: Deployment Mode"
	"Description","The behaviour to take on iApp (re)deployment for an APM policy.  The 'redeploy' options will replace the existing policy with the one packaged in the template.  The 'preserve' options keep the existing policy.  The 'block' modifier to both preserve and redeploy marks the deployed virtual server down to prevent traffic from reaching pool members until policy deployment is complete.  The 'bypass' modifier does not change the virtual server state, however, could cause traffic to bypass the policy until deployment completes."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","preserve-bypass"
	"Min. Version","2.0_001"
	"Choices","preserve-bypass, preserve-block, redeploy-bypass, redeploy-block"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__"

Section: pool
-------------

.. _preso-pool-addr:

Field: pool__addr
^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Address"
	"Description","The destination address of the Virtual Server.  Specifying a value of '255.255.255.254' will skip Virtual Server creation."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","ipaddr"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-pool-mask:

Field: pool__mask
^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Mask"
	"Description","The destination network mask of the Virtual Server"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","ipaddr"
	"Default","255.255.255.255"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__"

.. _preso-pool-port:

Field: pool__port
^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Port"
	"Description","The L4 port the Virtual Server listens on.  '*' is supported"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","port"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-pool-DefaultPoolIndex:

Field: pool__DefaultPoolIndex
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Default Pool Index"
	"Description","The index of the pool to use as the default pool for the Virtual Server"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","number"
	"Default","0"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-pool-Pools:

Table: pool__Pools
^^^^^^^^^^^^^^^^^^

The pools to create.  Note that pool index must be >0 and sequential.

.. csv-table::
	:header: "Column","Details"
	:stub-columns: 1
	:widths: 10 80

	"Index",".. _preso-pool-Pools-Index:

	:Display Name: Index:
	:Description: The Pool Index of this Pool
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: number
	:Default: 0
	:Min. Version: 2.0_001
	"
	"Name",".. _preso-pool-Pools-Name:

	:Display Name: Name:
	:Description: The Name of this Pool
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Description",".. _preso-pool-Pools-Description:

	:Display Name: Description:
	:Description: The Description of this Pool
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"LbMethod",".. _preso-pool-Pools-LbMethod:

	:Display Name: LB Method:
	:Description: The pool `Load Balancing Method <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm_configuration_guide_10_0_0/ltm_pools.html#1215305>`_
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: choice
	:Default: round-robin
	:Min. Version: 2.0_001
	:Choices: dynamic-ratio-member, dynamic-ratio-node, fastest-app-response, fastest-node, least-connections-member, least-connections-node, least-sessions, observed-member, observed-node, predictive-member, predictive-node, round-robin, ratio-member, ratio-node, ratio-session, ratio-least-connections-member, ratio-least-connections-node, weighted-least-connections-member
	"
	"Monitor",".. _preso-pool-Pools-Monitor:

	:Display Name: Monitor(s):
	:Description: The pool monitor(s) and minimum number of monitors that have to pass can be specified using a string of the format '[<monitor index>[,<monitor index>][;<minimum # healthy>]]'.  For example '0,1,2;2' would associate the monitors with indexes 0, 1 and 2 and require at least 2 pass.  If no value is specified no monitor is associated with the pool
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"AdvOptions",".. _preso-pool-Pools-AdvOptions:

	:Display Name: Adv Options:
	:Description: The options to set in the created Pool.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 0.3_012
	"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-pool-MemberDefaultPort:

Field: pool__MemberDefaultPort
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Pool: Member Default Port"
	"Description","The L4 port to used when a pool member is added via a Dynamic Endpoint Insertion notication from Cisco APIC"
	"Modes","Cisco APIC"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__"

.. _preso-pool-Members:

Table: pool__Members
^^^^^^^^^^^^^^^^^^^^

The configuration for Pool Members within the Pool.

.. csv-table::
	:header: "Column","Details"
	:stub-columns: 1
	:widths: 10 80

	"Index",".. _preso-pool-Members-Index:

	:Display Name: Pool Idx:
	:Description: The Pool Index this Member belongs to.  Used to support creation of multiple pools
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: number
	:Default: 0
	:Min. Version: 2.0_001
	"
	"IPAddress",".. _preso-pool-Members-IPAddress:

	:Display Name: IP/Node Name:
	:Description: IP Address OR Node Name of the Pool Member
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: editchoice
	:Default: 
	:Min. Version: 0.3_001
	"
	"Port",".. _preso-pool-Members-Port:

	:Display Name: Port:
	:Description: L4 port of the Pool Member
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 80
	:Min. Version: 0.3_001
	"
	"ConnectionLimit",".. _preso-pool-Members-ConnectionLimit:

	:Display Name: Connection Limit:
	:Description: The Connection Limit for the Pool Member.  '0' denotes unlimited connections
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 0
	:Min. Version: 0.3_001
	"
	"Ratio",".. _preso-pool-Members-Ratio:

	:Display Name: Ratio:
	:Description: The Ratio weight for the Pool Member.  Used with 'ratio' based Load Balancing Methods
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 1
	:Min. Version: 0.3_001
	"
	"PriorityGroup",".. _preso-pool-Members-PriorityGroup:

	:Display Name: Priority Group:
	:Description: The Priority Group for the Pool Member.
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 0
	:Min. Version: 1.0_002
	"
	"State",".. _preso-pool-Members-State:

	:Display Name: State:
	:Description: The administrative state of the Pool Member upon creation
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: choice
	:Default: enabled
	:Min. Version: 0.3_001
	:Choices: enabled, drain-disabled, disabled
	"
	"AdvOptions",".. _preso-pool-Members-AdvOptions:

	:Display Name: Adv Options:
	:Description: The Advanced Options for the Pool Member.
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Section: monitor
----------------

.. _preso-monitor-Monitors:

Table: monitor__Monitors
^^^^^^^^^^^^^^^^^^^^^^^^

The monitors to create/associate.  Note that monitor index must be >0 and sequential.

.. csv-table::
	:header: "Column","Details"
	:stub-columns: 1
	:widths: 10 80

	"Index",".. _preso-monitor-Monitors-Index:

	:Display Name: Index:
	:Description: The Index of this Monitor
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: number
	:Default: 0
	:Min. Version: 2.0_001
	"
	"Name",".. _preso-monitor-Monitors-Name:

	:Display Name: Name:
	:Description: The Name of the Monitor to create or associate.  To associate an existing monitor specify the full path to the existing monitor object (e.g. '/Common/http')
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Type",".. _preso-monitor-Monitors-Type:

	:Display Name: Type:
	:Description: The Type of this Monitor.  To determine the available types on a BIG-IP system execute 'tmsh create ltm monitor ?' from the CLI
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Options",".. _preso-monitor-Monitors-Options:

	:Display Name: Options:
	:Description: The options to set in the created Monitor.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_monitors.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors.json>`__ | `test_monitors_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_monitors_noindex.json>`__ | `test_pools.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools.json>`__ | `test_pools_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_2.json>`__ | `test_pools_3.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_3.json>`__ | `test_pools_noindex.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_pools_noindex.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Section: vs
-----------

.. _preso-vs-Listeners:

Table: vs__Listeners
^^^^^^^^^^^^^^^^^^^^

A list of additional IPv4/IPv6 listeners to create.  All listeners will be configured identically except if flags are specified in the Destination column modifying specific profiles.

.. csv-table::
	:header: "Column","Details"
	:stub-columns: 1
	:widths: 10 80

	"Listener",".. _preso-vs-Listeners-Listener:

	:Display Name: Listener:
	:Description: Listener to create in <address>:<port> format
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Destination",".. _preso-vs-Listeners-Destination:

	:Display Name: Destination
	:Description: The destination for traffic bound for this listener in the format (default|<pool index>|redirect|<TMOS pool object path>)[;(nossl|noclientssl|noserverssl)].  If no value or the keyword 'default' is specified the default pool index will be used.
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__"

.. _preso-vs-Name:

Field: vs__Name
^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Name"
	"Description","The name of the Virtual Server.  If no value is specified the name will be set to <iapp_name>_vs"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-vs-Description:

Field: vs__Description
^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Description"
	"Description","The description string configured in the Virtual Server"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-vs-RouteAdv:

Field: vs__RouteAdv
^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Route Advertisement"
	"Description","Control the route-advertisement behaviour setting of the associated Virtual Address object.  Routing protocol configuration must be completed on the device manually."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","disabled"
	"Min. Version","2.0_001"
	"Choices","disabled, all_vs, any_vs, always"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__"

.. _preso-vs-SourceAddress:

Field: vs__SourceAddress
^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Source Address"
	"Description","The source address filter for the Virtual Server"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","0.0.0.0/0"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

.. _preso-vs-IpProtocol:

Field: vs__IpProtocol
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: IP Protocol"
	"Description","The IP Protocol of the Virtual Server (e.g. tcp, udp)"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","tcp"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-vs-ConnectionLimit:

Field: vs__ConnectionLimit
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Virtual Server Connection Limit (0=unlimited)"
	"Description","The connection limit for the virtual server.  A value of '0' means no limit"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","0"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

.. _preso-vs-ProfileClientProtocol:

Field: vs__ProfileClientProtocol
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Client-side L4 Protocol Profile"
	"Description","The client-side protocol profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-vs-ProfileServerProtocol:

Field: vs__ProfileServerProtocol
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Server-side L4 Protocol Profile"
	"Description","The server-side protocol profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-vs-ProfileHTTP:

Field: vs__ProfileHTTP
^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: HTTP Profile"
	"Description","The HTTP protocol profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileOneConnect:

Field: vs__ProfileOneConnect
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: OneConnect Profile"
	"Description","The oneconnect profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileCompression:

Field: vs__ProfileCompression
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Compression Profile"
	"Description","The compression profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_005"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileAnalytics:

Field: vs__ProfileAnalytics
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Analytics Profile"
	"Description","The analytics profile"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_005"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-vs-ProfileRequestLogging:

Field: vs__ProfileRequestLogging
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Request Logging Profile"
	"Description","The request logging profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_005"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-vs-ProfileDefaultPersist:

Field: vs__ProfileDefaultPersist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Default Persistence Profile"
	"Description","The default persistence profile.  This field supports the 'create:' format for customization.  A key of 'type' specifying the persisence type to create must be specified (ex: create:type=cookie;...)"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

.. _preso-vs-ProfileFallbackPersist:

Field: vs__ProfileFallbackPersist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Fallback Persistence Profile"
	"Description","The fallback persistence profile.  This field supports the 'create:' format for customization.  A key of 'type' specifying the persisence type to create must be specified (ex: create:type=cookie;...)"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-SNATConfig:

Field: vs__SNATConfig
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: SNAT Configuration (enter SNAT pool name, 'automap' or leave blank to disable SNAT)"
	"Description","The SNAT option to use.  Specifiy 'automap','/Common/<existing_snat_pool_name>','partition-default','create:<ip1,>....<ipX>'.  The partition-default option references a SNAT pool created by Cisco APIC as part of the APIC partition"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","automap"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_http.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_http_autoxff.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_autoxff.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_http_ipv6.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_ipv6.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__ | `test_vs_standard_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__ | `test_vs_standard_tcp_rd_auto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_auto.json>`__ | `test_vs_standard_tcp_rd_nonauto.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_rd_nonauto.json>`__ | `test_vs_standard_tcp_routeadv_all.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_all.json>`__ | `test_vs_standard_tcp_routeadv_always.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_always.json>`__ | `test_vs_standard_tcp_routeadv_any.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_routeadv_any.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__ | `test_vs_standard_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-vs-ProfileServerSSL:

Field: vs__ProfileServerSSL
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Server SSL Profile"
	"Description","The server-ssl profile.  This field supports the 'create:' format for customization"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_005"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileClientSSL:

Field: vs__ProfileClientSSL
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Client SSL Profile"
	"Description","The path to an existing Client-SSL profile.  If specified this value overrides Client-SSL profile creation"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileClientSSLCert:

Field: vs__ProfileClientSSLCert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Client SSL Certificate"
	"Description","The path to an existing SSL Certificate.  If the word 'auto' is specfied the value /Common/<iapp_name>.crt will be substituted.  This field also supports the url=<url> format to load a PEM encoded resources."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileClientSSLKey:

Field: vs__ProfileClientSSLKey
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Client SSL Key"
	"Description","The path to an existing SSL Key.  If the word 'auto' is specfied the value /Common/<iapp_name>.key will be substituted.  This field also supports the url=<url> format to load a PEM encoded resources."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileClientSSLChain:

Field: vs__ProfileClientSSLChain
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Client SSL Certificate Chain"
	"Description","The path to the SSL Certicate Chain bundle.  This field also supports the url=<url> format to load a PEM encoded resources."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileClientSSLCipherString:

Field: vs__ProfileClientSSLCipherString
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Client SSL Cipher String"
	"Description","The SSL `Cipher String <https://support.f5.com/kb/en-us/solutions/public/13000/100/sol13171.html>`_"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","DEFAULT"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileClientSSLAdvOptions:

Field: vs__ProfileClientSSLAdvOptions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Client SSL Advanced Options"
	"Description","The options to set in the created Client-SSL profile.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_010"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https.json>`__ | `test_vs_standard_https_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create.json>`__ | `test_vs_standard_https_create_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_create_url.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__ | `test_vs_standard_https_serverssl.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl.json>`__ | `test_vs_standard_https_serverssl_create.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_serverssl_create.json>`__"

.. _preso-vs-ProfileSecurityLogProfiles:

Field: vs__ProfileSecurityLogProfiles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Security Logging Profiles"
	"Description","A comma seperated list of existing security logging profiles"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_008"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-vs-ProfileSecurityIPBlacklist:

Field: vs__ProfileSecurityIPBlacklist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: IP Blacklist Profile"
	"Description","Configuration for the IP Intelligence Dynamic IP Blacklist.  An existing subscription is required for this feature.  A pre-exsiting policy may be specified by entering it's full path (ex: /Common/my_ipi_policy)"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","none"
	"Min. Version","0.3_015"
	"Choices","none, enabled-block, enabled-log"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-vs-ProfileSecurityDoS:

Field: vs__ProfileSecurityDoS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Security: DoS Profile"
	"Description","The DoS Protection Policy to configure"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_016"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-vs-ProfileAccess:

Field: vs__ProfileAccess
^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Access Profile"
	"Description","The APM Access Policy to configure.  To automatically associate a bundled APM policy after deployment use the value 'use-bundled'"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_011"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__"

.. _preso-vs-ProfileConnectivity:

Field: vs__ProfileConnectivity
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Connectivity Profile"
	"Description","The APM Connectivity Policy to configure"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_011"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-vs-ProfilePerRequest:

Field: vs__ProfilePerRequest
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Per-Request Profile"
	"Description","The APM Per-Request Policy to configure"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_011"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-vs-OptionSourcePort:

Field: vs__OptionSourcePort
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Source Port Behavior"
	"Description","The source port translation behavior"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","preserve"
	"Min. Version","0.3_001"
	"Choices","preserve, preserve-strict, change"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

.. _preso-vs-OptionConnectionMirroring:

Field: vs__OptionConnectionMirroring
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Connection Mirroring"
	"Description","The connection mirroring behavior"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","boolean"
	"Default","False"
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

.. _preso-vs-Irules:

Field: vs__Irules
^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: iRules (to specify multiple iRules seperate with a comma ex: irule1,irule2,irule3)"
	"Description","A comma seperated list of existing iRules to attach to the virtual server.  Ordering is preserved."
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options.json>`__ | `test_vs_standard_http_options_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_options_2.json>`__"

.. _preso-vs-BundledItems:

Table: vs__BundledItems
^^^^^^^^^^^^^^^^^^^^^^^

The bundled resources to deploy.  See bundled/README for more info.

.. csv-table::
	:header: "Column","Details"
	:stub-columns: 1
	:widths: 10 80

	"Resource",".. _preso-vs-BundledItems-Resource:

	:Display Name: Resource:
	:Description: The bundled items to deploy.  See bundled/README for more info.
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: editchoice
	:Default: 
	:Min. Version: 2.0_001
	"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_bundle_irule.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_bundle_irule.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_apm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve.json>`__ | `test_vs_standard_https_bundle_apm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_preserve_2.json>`__ | `test_vs_standard_https_bundle_apm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy.json>`__ | `test_vs_standard_https_bundle_apm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_apm_redeploy_2.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__"

.. _preso-vs-AdvOptions:

Field: vs__AdvOptions
^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Advanced Options"
	"Description","The options to set in the created Virtual Server.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_010"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_fasthttp_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fasthttp_tcp.json>`__ | `test_vs_fastl4_tcp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_tcp.json>`__ | `test_vs_fastl4_udp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_fastl4_udp.json>`__ | `test_vs_ipforward.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward.json>`__ | `test_vs_ipforward_emptypool.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipforward_emptypool.json>`__ | `test_vs_ipother.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_ipother.json>`__ | `test_vs_sctp.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_sctp.json>`__ | `test_vs_standard_tcp_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_options.json>`__"

.. _preso-vs-AdvProfiles:

Field: vs__AdvProfiles
^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Advanced Profiles"
	"Description","A comma-seperated list of profiles to link to the Virtual Server: <profile_name>[,<profile_name>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_010"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-vs-AdvPolicies:

Field: vs__AdvPolicies
^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Server: Advanced Policies"
	"Description","A comma-seperated list of policies to link to the Virtual Server: <policy_name>[,<policy_name>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-vs-VirtualAddrAdvOptions:

Field: vs__VirtualAddrAdvOptions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Virtual Address: Advanced Options"
	"Description","The options to set in the global Virtual Address object.  Options can be specified using the format: <tmsh_option_name>=<tmsh_option_value>[,<tmsh_option_name>=<tmsh_option_value>]"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_tcp_virt_addr_options.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_virt_addr_options.json>`__"

Section: l7policy
-----------------

.. _preso-l7policy-strategy:

Field: l7policy__strategy
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","L7 Policy: Match Strategy"
	"Description","The Matching Strategy to use for the `L7 Policy <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html>`_"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","editchoice"
	"Default","/Common/first-match"
	"Min. Version","2.0_001"
	"Choices","/Common/first-match, /Common/best-match, /Common/all-match"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-l7policy-defaultASM:

Field: l7policy__defaultASM
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","L7 Policy: Default ASM Policy"
	"Description","The default ASM policy to use for the L7 Policy.  Specifying a value of 'bypass' will set all actions to bypass ASM processing unless a explicit ASM Action Target is specified"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","bypass"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-l7policy-defaultL7DOS:

Field: l7policy__defaultL7DOS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","L7 Policy: Default L7 DoS Policy"
	"Description","The default L7 DoS policy to use for the L7 Policy.  Specifying a value of 'bypass' will set all actions to bypass ASM processing unless a explicit L7 DoS Action Target is specified"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default","bypass"
	"Min. Version","2.0_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-l7policy-rulesMatch:

Table: l7policy__rulesMatch
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The L7 policy `Matching <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html>`_ ruleset to configure.

.. csv-table::
	:header: "Column","Details"
	:stub-columns: 1
	:widths: 10 80

	"Group",".. _preso-l7policy-rulesMatch-Group:

	:Display Name: Group:
	:Description: The group for this match rule.  The corresponding action is configured by specifying a matching action with the same group(s).  Multiple rows with the same group may be specified to create multiple match conditions.
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Operand",".. _preso-l7policy-rulesMatch-Operand:

	:Display Name: Operand:
	:Description: The specific operand to use for a policy match.
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: editchoice
	:Default: 
	:Min. Version: 2.0_001
	:Choices: client-ssl/request/cipher, client-ssl/request/cipher-bits, client-ssl/request/protocol, client-ssl/response/cipher, client-ssl/response/cipher-bits, client-ssl/response/protocol, http-basic-auth/request/username, http-basic-auth/request/password, http-cookie/request/all/name/<name>, http-header/request/all/name/<name>, http-header/request/all/name/<name>, http-host/request/all, http-host/request/host, http-host/request/port, http-method/request/all, http-referer/request/all, http-referer/request/extension, http-referer/request/host, http-referer/request/path, http-referer/request/path-segment/index/<index>, http-referer/request/port, http-referer/request/query-parameter/name/<name>, http-referer/request/scheme, http-referer/request/unnamed-query-parameter/index/<index>, http-set-cookie/response/domain/name/<name>, http-set-cookie/response/expiry/name/<name>, http-set-cookie/response/path/name/<name>, http-set-cookie/response/value/name/<name>, http-set-cookie/response/version/name/<name>, http-status/response/all, http-status/response/code, http-status/response/text, http-uri/request/all, http-uri/request/extension, http-uri/request/host, http-uri/request/path, http-uri/request/path-segment/index/<index>, http-uri/request/port, http-uri/request/query-parameter/name/<name>, http-uri/request/scheme, http-uri/request/unnamed-query-parameter/index/<index>, http-version/request/all, http-version/request/major, http-version/request/minor, http-version/request/protocol, http-version/response/all, http-version/response/major, http-version/response/minor, http-version/response/protocol, ssl-cert/ssl-server-handshake/common-name/index/<index>, ssl-extension/ssl-client-hello/alpn, ssl-extension/ssl-client-hello/npn, ssl-extension/ssl-client-hello/server-name, ssl-extension/ssl-server-hello/alpn, ssl-extension/ssl-server-hello/npn, ssl-extension/ssl-server-hello/server-name, tcp/request/mss/internal, tcp/request/port/internal, tcp/request/port/local, tcp/request/route-domain/internal, tcp/request/rtt/internal, tcp/request/vlan/internal, tcp/request/vlan-id/internal
	"
	"Negate",".. _preso-l7policy-rulesMatch-Negate:

	:Display Name: Negate:
	:Description: Reverses the meaning of the operation (for example, enabling Negate and specifying https as the starts-with value resolves to true if the header does not start with https).
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: choice
	:Default: no
	:Min. Version: 2.0_001
	:Choices: no, yes
	"
	"Condition",".. _preso-l7policy-rulesMatch-Condition:

	:Display Name: Condition:
	:Description: Specifies a conditions to use for matching.
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: choice
	:Default: 
	:Min. Version: 2.0_001
	:Choices: equals, starts-with, ends-with, contains, greater, greater-or-equal, less, less-or-equal
	"
	"Value",".. _preso-l7policy-rulesMatch-Value:

	:Display Name: Value:
	:Description: Specifies a list of values the operand is matched against.  To specify multiple values seperate with a ';'
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"CaseSensitive",".. _preso-l7policy-rulesMatch-CaseSensitive:

	:Display Name: Case Sensitive:
	:Description: Specifies a list of values the operand is matched against.  To specify multiple values seperate with a ';'
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: choice
	:Default: no
	:Min. Version: 2.0_001
	:Choices: no, yes
	"
	"Missing",".. _preso-l7policy-rulesMatch-Missing:

	:Display Name: Missing:
	:Description: Indicates whether a value can be missing.
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: choice
	:Default: no
	:Min. Version: 2.0_001
	:Choices: no, yes
	"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__"

.. _preso-l7policy-rulesAction:

Table: l7policy__rulesAction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The L7 policy `Action <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html>`_ ruleset actions to configure

.. csv-table::
	:header: "Column","Details"
	:stub-columns: 1
	:widths: 10 80

	"Group",".. _preso-l7policy-rulesAction-Group:

	:Display Name: Group:
	:Description: The group for this action rule.  Multiple rows with the same group may be specified to create multiple action targets
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Target",".. _preso-l7policy-rulesAction-Target:

	:Display Name: Target:
	:Description: The specific target to use for a policy match.
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: editchoice
	:Default: 
	:Min. Version: 2.0_001
	:Choices: asm/request/enable/policy, asm/request/disable, cache/request/enable/pin, cache/request/disable, cache/response/enable/pin, cache/respones/disable, compress/request/enable, compress/request/disable, compress/response/enable, compress/response/disable, decompress/request/enable, decompress/request/disable, decompress/response/enable, decompress/response/disable, forward/request/reset, forward/request/select/clone-pool, forward/request/select/member, forward/request/select/nexthop, forward/request/select/node, forward/request/select/pool, forward/request/select/rateclass, forward/request/select/snat, forward/request/select/snatpool, forward/request/select/vlan, forward/request/select/vlan-id, http/request/enable, http/request/disable, http-cookie/request/insert/name,value, http-cookie/request/remove/name, http-header/request/insert/name,value, http-header/request/remove/name, http-header/request/replace/name,value, http-header/response/insert/name,value, http-header/response/remove/name, http-header/response/replace/name,value, http-host/request/replace/value, http-referer/request/insert/value, http-referer/request/remove, http-referer/request/replace/value, http-reply/request/redirect/location, http-reply/response/redirect/location, http-set-cookie/response/insert/name,domain,path,value, http-set-cookie/response/remove/name, http-uri/response/replace/path,query-string,value, l7dos/request/enable/from-profile, l7dos/request/disable, log/request/write/message, log/response/write/message, request-adapt/request/enable/internal-virtual-server, request-adapt/request/disable, request-adapt/response/enable/internal-virtual-server, request-adapt/response/disable, response-adapt/request/enable/internal-virtual-server, response-adapt/request/disable, response-adapt/response/enable/internal-virtual-server, request-adapt/response/disable, server-ssl/request/enable, server-ssl/request/disable, tcl/request/set-variable/name,expression, tcl/response/set-variable/name,expression, tcl/ssl-client-hello/set-variable/name,expression, tcl/ssl-server-handshake/set-variable/name,expression, tcl/ssl-server-hello/set-variable/name,expression, tcp-nagle/request/enable, tcp-nagle/request/disable
	"
	"Parameter",".. _preso-l7policy-rulesAction-Parameter:

	:Display Name: Parameter:
	:Description: Specifies the value for the action. Possible values depend on the target.  Multiple values can be entered by seperating with a ';'.  To reference a bundled policy item for use with a supported target use the format 'bundled:<bundled item name>'
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 2.0_001
	"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_bundle_all_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve.json>`__ | `test_vs_standard_https_bundle_all_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_preserve_2.json>`__ | `test_vs_standard_https_bundle_all_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy.json>`__ | `test_vs_standard_https_bundle_all_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_redeploy_2.json>`__ | `test_vs_standard_https_bundle_all_url.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_all_url.json>`__ | `test_vs_standard_https_bundle_asm_preserve.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve.json>`__ | `test_vs_standard_https_bundle_asm_preserve_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_preserve_2.json>`__ | `test_vs_standard_https_bundle_asm_redeploy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy.json>`__ | `test_vs_standard_https_bundle_asm_redeploy_2.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_bundle_asm_redeploy_2.json>`__ | `test_vs_standard_https_l7policy.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_l7policy.json>`__"

Section: feature
----------------

.. _preso-feature-statsTLS:

Field: feature__statsTLS
^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","TLS/SSL: Stats Reporting"
	"Description","TLS/SSL Statistics reporting.  The auto option will enable this feature if a client-ssl profile is attached, otherwise disable"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Min. Version","0.3_006"
	"Choices","auto, enabled, disabled"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-feature-statsHTTP:

Field: feature__statsHTTP
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","HTTP: Stats Reporting"
	"Description","HTTP Statistics reporting.  The auto option will enable this feature if a http profile is attached, otherwise disable"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Min. Version","0.3_006"
	"Choices","auto, enabled, disabled"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-feature-insertXForwardedFor:

Field: feature__insertXForwardedFor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","HTTP: Insert X-Forwarded-For Header"
	"Description","Insert the X-Forwarded-For header.  The auto option will enable this feature if a HTTP profile and SNAT is configured, otherwise disable"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Min. Version","0.3_005"
	"Choices","auto, enabled, disabled"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__"

.. _preso-feature-redirectToHTTPS:

Field: feature__redirectToHTTPS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","HTTP: Security: Create HTTP(80)->HTTPS(443) Redirect"
	"Description","Create a virtual service on TCP/80 that performs a 302 HTTP redirect to TCP/443 on the same IP address.  The auto option will enable this feature if a HTTP profile is configured and the TCP port is 443, otherwise disable"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Min. Version","0.3_001"
	"Choices","auto, enabled, disabled"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__"

.. _preso-feature-sslEasyCipher:

Field: feature__sslEasyCipher
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","TLS/SSL: Easy Cipher String (overrides VS section setting)"
	"Description","Easily configure TLS/SSL Cipher Strings.  This setting overrides the value in the Virtual Server section"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","disabled"
	"Min. Version","0.3_007"
	"Choices","compatible, medium, high, tls_1.2, tls_1.1+1.2, disabled"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__"

.. _preso-feature-securityEnableHSTS:

Field: feature__securityEnableHSTS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","HTTP: Security: Enable HTTP Strict Transport Security (only valid if ClientSSL is configured)"
	"Description","Enabled insertion of the Strict-Transport-Security HTTP header.  The preload and subdomain options can be omitted or included based on this selection.  This setting also modifies creation of the HTTP->HTTPS redirect option to perform a 301 HTTP redirect"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","disabled"
	"Min. Version","0.3_001"
	"Choices","disabled, enabled, enabled-preload, enabled-subdomain, enabled-preload-subdomain"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_https_features.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_features.json>`__ | `test_vs_standard_https_multi_listeners.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_https_multi_listeners.json>`__"

.. _preso-feature-easyL4Firewall:

Field: feature__easyL4Firewall
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Security: Firewall: Configure L4 Firewall Policy"
	"Description","Configure a AFM L4 Firewall policy.  The 'base' option creates a policy that allows traffic to the Virtual Server with optional Blacklist and Source addresses specified in the following fields.  The base+ip_blacklist options also configure an IP Intelligence Blacklist policy in either blocking or logging mode.  The auto mode is equivalent to the base+ip_blacklist_block option with the exception that if a user-specfic IPI policy is specified it will be preserved"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","choice"
	"Default","auto"
	"Min. Version","0.3_008"
	"Choices","auto, base, base+ip_blacklist_block, base+ip_blacklist_log, disabled"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-feature-easyL4FirewallBlacklist:

Table: feature__easyL4FirewallBlacklist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A list of CIDR formatted blacklisted IP/Network ranges.  Packets sourced from these networks will be dropped

.. csv-table::
	:header: "Column","Details"
	:stub-columns: 1
	:widths: 10 80

	"CIDRRange",".. _preso-feature-easyL4FirewallBlacklist-CIDRRange:

	:Display Name: CIDR Block:
	:Description: CIDR Range
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 
	:Min. Version: 0.3_008
	"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

.. _preso-feature-easyL4FirewallSourceList:

Table: feature__easyL4FirewallSourceList
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A list of CIDR formatted allowed IP/Network ranges.  Packets sourced from these networks will be allowed

.. csv-table::
	:header: "Column","Details"
	:stub-columns: 1
	:widths: 10 80

	"CIDRRange",".. _preso-feature-easyL4FirewallSourceList-CIDRRange:

	:Display Name: CIDR Block:
	:Description: CIDR Range
	:Modes: Standalone, iWorkflow, Cisco APIC, VMware NSX
	:Type: string
	:Default: 0.0.0.0/0
	:Min. Version: 0.3_008
	"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__ | `test_vs_standard_http_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_http_afm.json>`__ | `test_vs_standard_tcp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_tcp_afm.json>`__ | `test_vs_standard_udp_afm.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/test_vs_standard_udp_afm.json>`__"

Section: extensions
-------------------

.. _preso-extensions-Field1:

Field: extensions__Field1
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Extensions: Field 1"
	"Description","Extensions: Field 1"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-extensions-Field2:

Field: extensions__Field2
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Extensions: Field 2"
	"Description","Extensions: Field 2"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

.. _preso-extensions-Field3:

Field: extensions__Field3
^^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
	:stub-columns: 1
	:widths: 10 80

	"Display Name","Extensions: Field 3"
	"Description","Extensions: Field 3"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","0.3_001"
	"Examples","`include_defaults.json <https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json>`__"

