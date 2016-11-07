.. |labmodule| replace:: 2
.. |labnum| replace:: 7
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Multiple Pools & Listeners
--------------------------

In order to support more complex ADC configurations this template includes the
ability to create multiple pools and/or listeners as part of a single 
deployment.

.. IMPORTANT::
    When creating multiple listeners the protocol and profile configuration will
    be duplicated.  The only exception to this rule is the option to exclude 
    SSL/TLS specific profiles.

Deploy HTTP Service on Multiple TCP Ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this lab we will deploy a HTTP Service that listens on TCP/80 and TCP/8080

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
          - 10.1.20.1\ |labnum|\ 1
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

        * - :ref:`Virtual Server: Additional Listeners <preso-vs-Listeners>`
          - - Row 1:

              - Listener: 10.1.20.1\ |labnum|\ 1:8080                
              - :ref:`Destination <preso-vs-Listeners-Destination>`: default

                .. NOTE::
                   Specifying 'default' as the destination for the TCP/8080
                   listener sets the pool index by reading the value of 
                   the :ref:`Virtual Server: Default Pool Index <preso-pool-DefaultPoolIndex>`
                   field.  The default value of this field is '0' resulting
                   in the listener sending traffic to the pool with Index 0
                   in the Pool table.

        * - :ref:`Virtual Server: Client-side L4 Protocol Profile <preso-vs-ProfileClientProtocol>`
          - /Common/tcp-wan-optimized
        * - :ref:`Virtual Server: Server-side L4 Protocol Profile <preso-vs-ProfileServerProtocol>`
          - /Common/tcp-lan-optimized
        * - :ref:`Virtual Server: HTTP Profile <preso-vs-ProfileHTTP>`
          - /Common/http

#. Review the deployed config and deployment log

    - Notice that two listeners were created.

Modify HTTP Service on Multiple TCP Ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this lab we will modify the service deployed above and create two pools.  We
will then route traffic destined to TCP/8080 to the newly created pool.

#. Click iApps -> Application Services -> |labname| -> Reconfigure
#. Modify the following values and click 'Finished':

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - :ref:`Pool: Pool Table <preso-pool-Pools>`
          - - Row 1: 

              - Index: 0 
              - Monitor(s): 0

            - Row 2:

              - Index: 1
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

            - Row 3:

              - Pool Idx: 1
              - IP/Node Name: 10.1.10.102
              - Port: 80

            - Row 4:

              - Pool Idx: 1
              - IP/Node Name: 10.1.10.103
              - Port: 80                                

        * - :ref:`Monitor: Monitor Table <preso-monitor-Monitors>`
          - - Row 1: 

              - Index: 0 
              - Name: /Common/http

        * - :ref:`Virtual Server: Additional Listeners <preso-vs-Listeners>`
          - - Row 1:

              - Listener: 10.1.20.1\ |labnum|\ 1:8080                
              - :ref:`Destination <preso-vs-Listeners-Destination>`: 1

#. Review the deployed config and deployment log

    - Notice that there are now two pools
    - Notice that the listeners now route traffic to different pools

Deploy Complex IPv4/v6 HTTP/HTTPS Service
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this lab we will deploy a complex service that consists of the following:

- 2 Pools
    - Pool 0: Members listen on TCP/80 (HTTP)
    - Pool 1: Members listen on TCP/443 (HTTPS)
- 5 Listeners
    - 10.1.20.1\ |labnum|\ 2:443 -> Pool 1
    - 10.1.20.1\ |labnum|\ 2:80 -> Pool 0
    - 10.1.20.1\ |labnum|\ 3:80 -> HTTP Redirect
    - 10.1.20.1\ |labnum|\ 3:443 -> Pool 0
    - 2001:f5f5:1::1\ |labnum|\ .443 -> Pool 1
    - 2001:f5f5:1::1\ |labnum|\ .80 -> HTTP Redirect

All HTTPS traffic will be decrypted and then re-encrypted towards Pool 1.

#. Click iApps -> Application Services -> |labname| -> Reconfigure
#. Modify the following values and click 'Finished':

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - :ref:`Virtual Server: Address <preso-pool-addr>`
          - 10.1.20.1\ |labnum|\ 2       
        * - :ref:`Virtual Server: Port <preso-pool-port>`
          - 443
        * - :ref:`Virtual Server: Default Pool Index <preso-pool-DefaultPoolIndex>`
          - 1
        * - :ref:`Pool: Pool Table <preso-pool-Pools>`
          - - Row 1: 

              - Index: 0 
              - Monitor(s): 0

            - Row 2:

              - Index: 1
              - Monitor(s): 1

        * - :ref:`Pool: Members <preso-pool-Members>`
          - - Row 1: 

              - Pool Idx: 0
              - IP/Node Name: 10.1.10.100
              - Port: 80

            - Row 2:

              - Pool Idx: 0
              - IP/Node Name: 10.1.10.101
              - Port: 80

            - Row 3:

              - Pool Idx: 1
              - IP/Node Name: 10.1.10.102
              - Port: 443

            - Row 4:

              - Pool Idx: 1
              - IP/Node Name: 10.1.10.103
              - Port: 443                               

        * - :ref:`Monitor: Monitor Table <preso-monitor-Monitors>`
          - - Row 1: 

              - Index: 0 
              - Name: /Common/http

            - Row 2: 

              - Index: 1
              - Name: /Common/https

        * - :ref:`Virtual Server: Additional Listeners <preso-vs-Listeners>`
          - - Row 1:

              - Listener: 10.1.20.1\ |labnum|\ 2:80              
              - :ref:`Destination <preso-vs-Listeners-Destination>`: 0;nossl

            - Row 2:

              - Listener: 10.1.20.1\ |labnum|\ 3:80              
              - :ref:`Destination <preso-vs-Listeners-Destination>`: redirect

            - Row 3:

              - Listener: 10.1.20.1\ |labnum|\ 3:443              
              - :ref:`Destination <preso-vs-Listeners-Destination>`: 0;noserverssl

            - Row 4:

              - Listener: 2001:f5f5:1::1\ |labnum|\ .443              
              - :ref:`Destination <preso-vs-Listeners-Destination>`: default

            - Row 5:

              - Listener: 2001:f5f5:1::1\ |labnum|\ .80            
              - :ref:`Destination <preso-vs-Listeners-Destination>`: 1;noclientssl     

        * - :ref:`Virtual Server: Client-side L4 Protocol Profile <preso-vs-ProfileClientProtocol>`
          - /Common/tcp-wan-optimized
        * - :ref:`Virtual Server: Server-side L4 Protocol Profile <preso-vs-ProfileServerProtocol>`
          - /Common/tcp-lan-optimized
        * - :ref:`Virtual Server: HTTP Profile <preso-vs-ProfileHTTP>`
          - /Common/http                       
        * - :ref:`Virtual Server: Server SSL Profile <preso-vs-ProfileServerSSL>`
          - /Common/serverssl
        * - :ref:`Virtual Server: Client SSL Profile <preso-vs-ProfileClientSSL>`
          - /Common/clientssl          

#. Review the deployed config and deployment log
