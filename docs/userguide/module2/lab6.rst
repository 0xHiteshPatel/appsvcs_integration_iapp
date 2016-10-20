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
  - Add a gtm-score attribute

- Monitors:

  - Use the existing default HTTP monitor
  - Create a new custom HTTP monitor
  - Create a new custom TCP monitor

- Pool: 

  - Configure a slow ramp time
  - Set the minimum members to ‘1’
  - Associate three monitors with a minimum of 1 monitor passing

- SSL/TLS:

  - Create Client-SSL with Secure Renegotiation option set to ‘request’
  - (optional) Load Certificate, Key and Certificate Bundle from remote URL resource

- Customized Profiles:

  - Client-side TCP: Nagle disabled
  - OneConnect: Change source-mask
  - Compression: Adjust cpu-saver attributes 
  - HTTP: Response Header “Server” set to “Lab2_6”
  - HTTP: X-Forwarded-For Header inserted
  - Persistence (Default): Cookie based persistence using 'MyCookie'
  - Persistence (Secondary): IP Source Address persistence with a custom timeout

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
              - Monitor(s): ``0,1,2;2``

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
              - Type: http
              - Options: ``send=GET /test HTTP/1.0;recv=OK``

            - Row 3:

              - Index: 2
              - Type: tcp
              - Options: ``timeout=3600``

        * - :ref:`Virtual Server: Client-side L4 Protocol Profile <preso-vs-ProfileClientProtocol>`
          - create:type=tcp;nagle=disabled;defaults-from=/Common/tcp-wan-optimized
        * - :ref:`Virtual Server: Server-side L4 Protocol Profile <preso-vs-ProfileServerProtocol>`
          - /Common/tcp-lan-optimized
        * - :ref:`Virtual Server: HTTP Profile <preso-vs-ProfileHTTP>`
          - create:server-agent-name=\ |labnameund|;insert-xforwarded-for=enabled;defaults-from=/Common/http
        * - :ref:`Virtual Server: OneConnect Profile <preso-vs-ProfileOneConnect>`
          - create:source-mask=255.255.0.0;defaults-from=/Common/oneconnect
        * - :ref:`Virtual Server: Compression Profile <preso-vs-ProfileCompression>`
          - create:cpu-saver=enabled;cpu-saver-high=90;defaults-from=/Common/httpcompression
        * - :ref:`Virtual Server: Default Persistence Profile <preso-vs-ProfileDefaultPersist>`
          - create:type=cookie;cookie-name=MyCookie  
        * - :ref:`Virtual Server: Fallback Persistence Profile <preso-vs-ProfileFallbackPersist>`
          - create:type=source-addr;timeout=300
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

SSL/TLS Resource Deployment via URL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. NOTE::
    To complete this lab you must have a web server configured as detailed in 
    the :ref:`ug_lab_environment`

.. WARNING::
   Loading SSL/TLS Keys from remote URLs is dependent on proper security of the
   PKI infrastructure.

.. WARNING::
   Re-deployment of the iApp results in the remote resources being reloaded 
   from the remote server automatically.  

#. Click iApps -> Application Services -> |labname| -> Reconfigure
#. Modify the following values and click 'Finished':

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - :ref:`Virtual Server: Client SSL Certificate <preso-vs-ProfileClientSSLCert>`
          - url=https://10.1.1.5/appsvcs/default.crt
        * - :ref:`Virtual Server: Client SSL Key <preso-vs-ProfileClientSSLKey>`
          - url=https://10.1.1.5/appsvcs/default.key
        * - :ref:`Virtual Server: Client SSL Certificate Chain <preso-vs-ProfileClientSSLChain>`
          - url=https://10.1.1.5/appsvcs/bundle.crt

#. Review the deployed config and deployment log
    - Notice that the previously deployed resources have been replaced by ones
      loaded dynamically from the specified URLs

