.. |labmodule| replace:: 4
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Multi-Tier Deployments
----------------------

By default the |appsvcs| template deploys a configuration that automatically 
creates at least one Virtual Server associated with 0 or more pools.  In 
advanced use cases it may be required to create a de-coupled or multi-tier
deployment that allows the user to create Pools and Virtual Server objects as
separate iApp deployments.  

This functionality is useful when L7 policies or iRules are used to route
traffic in multi-tenant environments that want to expose a service on a minimal
number of client facing IP addresses.  The advantage of creating a multi-tier 
deployment is the ability to add tenant Pool resources without having to 
centralize the config in a single iApp deployment

In this lab we will create a two tier deployment that consists of the following:

- Tier 1:

  - HTTP Virtual Server with a L7 Policy:

    - URI '/tenant1/' -> Tenant 1, Pool 0
    - URI '/tenant2/' -> Tenant 2, Pool 0

- Tier 2:

  - Tenant 1: 1 Pool with HTTP members
  - Tenant 2: 1 Pool with HTTP members

This lab will consist of 3 seperate iApp deployments.  Two for the Pool objects
and one for the Virtual Server.

Create Tenant 1 Pool
^^^^^^^^^^^^^^^^^^^^

#. Create a new deployment with the following values:

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - Name
          - |labname|\ _tenant1
        * - Template
          - appsvcs_integration_v\ |version|
        * - :ref:`Virtual Server: Address <preso-pool-addr>`
          - 255.255.255.254

            .. NOTE::
                This special value is used to skip Virtual Server creation

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

#. Review the deployment.  Notice that only a pool object was created.

Create Tenant 2 Pool
^^^^^^^^^^^^^^^^^^^^

#. Create a new deployment with the following values:

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - Name
          - |labname|\ _tenant2
        * - Template
          - appsvcs_integration_v\ |version|
        * - :ref:`Virtual Server: Address <preso-pool-addr>`
          - 255.255.255.254

            .. NOTE::
                This special value is used to skip Virtual Server creation

        * - :ref:`Virtual Server: Port <preso-pool-port>`
          - 80
        * - :ref:`Pool: Pool Table <preso-pool-Pools>`
          - - Row 1: 

              - Index: 0 
              - Monitor(s): 0

        * - :ref:`Pool: Members <preso-pool-Members>`
          - - Row 1: 

              - Pool Idx: 0
              - IP/Node Name: 10.1.10.103
              - Port: 80

            - Row 2:

              - Pool Idx: 0
              - IP/Node Name: 10.1.10.104
              - Port: 80

        * - :ref:`Monitor: Monitor Table <preso-monitor-Monitors>`
          - - Row 1: 

              - Index: 0 
              - Name: /Common/http

#. Review the deployment.  Notice that only a pool object was created.

Create Virtual Server
^^^^^^^^^^^^^^^^^^^^^

#. Create a new deployment with the following values:

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - Name
          - |labname|\ _virtual
        * - Template
          - appsvcs_integration_v\ |version|
        * - :ref:`Virtual Server: Address <preso-pool-addr>`
          - 10.1.20.\ |labmodule|\ |labnum|
        * - :ref:`Virtual Server: Port <preso-pool-port>`
          - 80
        * - :ref:`Virtual Server: Default Pool Index <preso-pool-DefaultPoolIndex>`
          - <remove the default value>          
        * - :ref:`Pool: Pool Table <preso-pool-Pools>`
          - - Row 1: <remove the default row that is shown>
        * - :ref:`Pool: Members <preso-pool-Members>`
          - - Row 1: <remove the default row that is shown>
        * - :ref:`Monitor: Monitor Table <preso-monitor-Monitors>`
          - - Row 1: <remove the default row that is shown>
        * - :ref:`Virtual Server: Client-side L4 Protocol Profile <preso-vs-ProfileClientProtocol>`
          - /Common/tcp-wan-optimized
        * - :ref:`Virtual Server: Server-side L4 Protocol Profile <preso-vs-ProfileServerProtocol>`
          - /Common/tcp-lan-optimized
        * - :ref:`Virtual Server: HTTP Profile <preso-vs-ProfileHTTP>`
          - /Common/http
        * - :ref:`L7 Policy: Rules: Matching <preso-l7policy-rulesMatch>`
          - - Row 1: 

              - Group: 0
              - Operand: http-uri/request/path
              - Condition: starts-with
              - Value: /tenant1/

            - Row 2: 

              - Group: 1
              - Operand: http-uri/request/path
              - Condition: starts-with
              - Value: /tenant2/

        * - :ref:`L7 Policy: Rules: Action <preso-l7policy-rulesAction>`
          - - Row 1: 

              - Group: 0
              - Target: forward/request/select/pool
              - Parameter: /Common/Lab4.1_tenant1.app/Lab4.1_tenant1_pool_0

            - Row 2: 

              - Group: 1
              - Target: forward/request/select/pool
              - Parameter: /Common/Lab4.1_tenant2.app/Lab4.1_tenant2_pool_0

#. Click the 'Finished' button to deploy the template
#. Review the deployed configuration using the iApp Components view
#. Review the L7 policy deployed by the template and notice that the previously
   created pools are referenced
