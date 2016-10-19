.. |labmodule| replace:: 3
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

WAF/ASM Policy Deployment
-------------------------

In this lab we will deploy a Web Application Firewall policies that can be used 
by |asm|.  Be sure to review the following documentation before continuing:

- :ref:`policies_ref`
- :doc:`/execflow`

WAF Policy Deployment via Bundled Resource
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Create a new deployment with the following values:

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - Name
          - |labname|
        * - Template
          - appsvcs_integration_v\ |version|\ _custom
        * - :ref:`Virtual Server: Address <preso-pool-addr>`
          - 10.1.20.\ |labmodule|\ |labnum|
        * - :ref:`Virtual Server: Port <preso-pool-port>`
          - 80
        * - :ref:`Pool: Pool Table <preso-pool-Pools>`
          - - Row 1: 

              - Index: 0 
              - Monitor(s): 0

        * - :ref:`Pool: Members <preso-pool-Members>`
          - - Row 1: 

              - Pool Idx: 0
              - IP/Node Name: 10.1.10.100
              - Port: 80

            - Row 2:

              - Pool Idx: 0
              - IP/Node Name: 10.1.10.101
              - Port: 80

        * - :ref:`Monitor: Monitor Table <preso-monitor-Monitors>`
          - - Row 1: 

              - Index: 0 
              - Name: /Common/http

        * - :ref:`Virtual Server: Client-side L4 Protocol Profile <preso-vs-ProfileClientProtocol>`
          - /Common/tcp-wan-optimized
        * - :ref:`Virtual Server: Server-side L4 Protocol Profile <preso-vs-ProfileServerProtocol>`
          - /Common/tcp-lan-optimized
        * - :ref:`Virtual Server: HTTP Profile <preso-vs-ProfileHTTP>`
          - /Common/http
        * - :ref:`Virtual Server: Bundled Items <preso-vs-BundledItems>`
          - - Row 1: 

              - Resource: asm:asm_example1

            - Row 2: 

              - Resource: asm:asm_example2

        * - :ref:`L7 Policy: Rules: Matching <preso-l7policy-rulesMatch>`
          - - Row 1: 

              - Group: 0
              - Operand: http-host/request/host
              - Condition: equals
              - Value: www.example1.com

            - Row 2: 

              - Group: 1
              - Operand: http-host/request/host
              - Condition: equals
              - Value: www.example2.com

            - Row 3: 

              - Group: default             

        * - :ref:`L7 Policy: Rules: Action <preso-l7policy-rulesAction>`
          - - Row 1: 

              - Group: 0
              - Operand: asm/request/enable/policy
              - Parameter: bundled:asm_example1

            - Row 2: 

              - Group: 1
              - Operand: asm/request/enable/policy
              - Parameter: bundled:asm_example2

            - Row 3: 

              - Group: default
              - Operand: forward/request/reset

#. Click the 'Finished' button to deploy the template and monitor the deployment
   log
#. The initial objects in the Components view does not represent the final 
   state of the deployment as detailed in :doc:`/execflow`
#. Monitor the deployment log and wait for the postdeploy_final process to 
   complete
#. Review the deployed configuration using the iApp Components view
#. Review the L7 policy that was created

WAF Policy Deployment via URL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Click iApps -> Application Services -> |labname| -> Reconfigure
#. Modify the following values and click 'Finished':

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - :ref:`Virtual Server: Bundled Items <preso-vs-BundledItems>`
          - - Row 3: 

              - Resource: ``asm:url=http://<web server IP>/appsvcs/remote_asm1.xml``

        * - :ref:`L7 Policy: Rules: Matching <preso-l7policy-rulesMatch>`
          - - Row 3: 

              - Group: 2
              - Operand: http-host/request/host
              - Condition: equals
              - Value: www.example3.com

            - Row 4: 

              - Group: default             

        * - :ref:`L7 Policy: Rules: Action <preso-l7policy-rulesAction>`
          - - Row 3: 

              - Group: 2
              - Operand: asm/request/enable/policy
              - Parameter: bundled:remote_asm1

            - Row 4: 

              - Group: default
              - Operand: forward/request/reset

#. Click the 'Finished' button to deploy the template and monitor the deployment
   log
#. Monitor the deployment log and wait for the postdeploy_final process to 
   complete
#. Review the deployed configuration using the iApp Components view
#. Review the L7 policy that was created

