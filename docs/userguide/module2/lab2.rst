.. |labmodule| replace:: 2
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Deploy Basic HTTPS ADC Service
------------------------------

.. NOTE::
    From this point on the guide will use an abbreviated version of the previous 
    instructions.  Please complete the initial deployment of each task as 
    instructed.  You are then free to modify values and experiment as needed.

Deploy HTTPS Service (auto-created Client-SSL profile and SNAT pool)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
        * - :ref:`Virtual Server: SNAT Configuration <preso-vs-SNATConfig>`
          - ``create:10.1.10.250,10.1.10.251``

            .. NOTE::
                This is the first example of the :doc:`/datamodel/createadvopt`.  This value 
                will create a SNAT pool with two IPs in it.
        * - :ref:`Virtual Server: Client SSL Certificate <preso-vs-ProfileClientSSLCert>`
          - /Common/default.crt
        * - :ref:`Virtual Server: Client SSL Key <preso-vs-ProfileClientSSLKey>`
          - /Common/default.key
        * - :ref:`Virtual Server: Client SSL Certificate Chain <preso-vs-ProfileClientSSLChain>`
          - /Common/ca-bundle.crt

#. Review the deployed configuration using the iApp Components view and 
   deployment log
   
   - The deployment used the default SSL key/cert pair on the device.  In a real
     world deployment you would import your cert/key pair into the Common 
     partition and reference the name(s) in the 
     :ref:`Virtual Server: Client SSL Certificate <preso-vs-ProfileClientSSLCert>`
     and :ref:`Virtual Server: Client SSL Key <preso-vs-ProfileClientSSLKey>`
     fields.  
   - A port 80 -> 443 redirect was created automatically due to a 
     L4-7 Functionality feature of the iApp.  We will review this functionality
     in subsequent labs
   - After about 1 minute click the ‘Properties’ button.  Notice all the 
     statistics we are now tracking.  This is another L4-7 feature we will 
     review later.

.. NOTE::
   You can also use the value ‘auto’ in the 
   ‘Virtual Server: Client SSL Certificate’ and ‘Virtual Server: Client SSL Key’
   fields.  The behavior for ‘auto’ is to look for a Certificate and/or Key on 
   the system with the same name and the name for the iApp deployment.  For 
   example, in this lab the system would look for ‘/Common/\ |labname|.crt’ 
   and/or '/Common/\ |labname|.key’.  This feature is included to allow for 
   automated deployment when a separate process is used to populate Crypto 
   objects (ie. Network HSM, Scripting, PKI solutions, etc.)

Modify to reference an existing Client-SSL profile
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Click iApps -> Application Services -> |labname| -> Reconfigure
#. Modify the following values and click 'Finished':

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - :ref:`Virtual Server: Client SSL Profile <preso-vs-ProfileClientSSL>`
          - /Common/clientssl
        * - :ref:`Virtual Server: Client SSL Certificate <preso-vs-ProfileClientSSLCert>`
          - <remove the value>
        * - :ref:`Virtual Server: Client SSL Key <preso-vs-ProfileClientSSLKey>`
          - <remove the value>
#. Review the deployed config.  It should now reference the /Common/clientssl
   profile.  The previously created client-ssl profile was automatically removed.

.. NOTE::
    iApp deployments create non-shared objects under an Application Service 
    Object (ASO).  As a result all configuration is contained within the ASO.
    Modifications of one ASO does not impact any other deployments.  Deletion 
    of the deployment results in the deletion of the ASO and all objects under
    it.
