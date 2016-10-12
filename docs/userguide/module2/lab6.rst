.. |labmodule| replace:: 2
.. |labnum| replace:: 6
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Deploy HTTPS ADC Service with Customizations
--------------------------------------------

We will deploy a virtual server with the following customizations:

- Virtual Server: 
   - Disable port translation
   - Enable rate limiting with 100 connections/sec allowed
   - Add a stats profile

- Pool: 
   - Configure a slow ramp time
   - Set the minimum members to ‘1’
   - Associate two monitors with a minimum of 1 monitor passing

- Auto create Client-SSL Profile:
   - Set the Secure Renegotiation option to ‘request’

- Customized Profiles:
   - Client-side TCP: Nagle disabled
   - HTTP: Response Header “Server” set to “Lab2_6”
   - HTTP: X-Forwarded-For Header inserted

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
          - appsvcs_integration_v\ |version|
        * - :ref:`Virtual Server: Address <preso-pool-addr>`
          - 10.1.20.1\ |labnum|
        * - :ref:`Virtual Server: Port <preso-pool-port>`
          - 443           
        * - :ref:`Pool: Pool Table <preso-pool-Pools>`
          - - Row 1: 
                - Index: 0 
                - Monitor(s): 0,1;2

                   .. NOTE::
                      Documentation of this syntax is available :ref:`here <preso-pool-Pools-Monitor>`

                - Adv Options: ``slow-ramp-time=345;min-up-members=1``
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
            - Row 2: 
                - Index: 1 
                - Name: /Common/tcp                
        * - :ref:`Virtual Server: Client-side L4 Protocol Profile <preso-vs-ProfileClientProtocol>`
          - create:nagle=disabled;defaults-from=/Common/tcp-wan-optimized
        * - :ref:`Virtual Server: Server-side L4 Protocol Profile <preso-vs-ProfileServerProtocol>`
          - /Common/tcp-lan-optimized
        * - :ref:`Virtual Server: HTTP Profile <preso-vs-ProfileHTTP>`
          - create:server-agent-name=\ |labnameund|;insert-xforwarded-for=enabled;defaults-from=/Common/http
        * - :ref:`Virtual Server: Client SSL Certificate <preso-vs-ProfileClientSSLCert>`
          - /Common/default.crt
        * - :ref:`Virtual Server: Client SSL Key <preso-vs-ProfileClientSSLKey>`
          - /Common/default.key
        * - :ref:`Virtual Server: Client SSL Certificate Chain <preso-vs-ProfileClientSSLChain>`
          - /Common/ca-bundle.crt
        * - :ref:`Virtual Server: Client SSL Advanced Options <preso-vs-ProfileClientSSLAdvOptions>`
          - secure-renegotiation=request
        * - :ref:`Virtual Server: Advanced Options <preso-vs-AdvOptions>`
          - gtm-score=50;rate-limit=100
        * - :ref:`Virtual Server: Advanced Profiles <preso-vs-AdvProfiles>`
          - /Common/stats

#. Review the deployed config and deployment log
