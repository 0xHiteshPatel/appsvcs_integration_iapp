.. |labmodule| replace:: 2
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Deploy Basic HTTP ADC Service
-----------------------------

#. Open an SSH connection to your BIG-IP device:
   ``ssh root@<management ip>``
#. Execute the following command to monitor the iApp deployment log:
   ``tail -f /var/tmp/scriptd.out``
#. Open a web browser window and navigate to ``https://<BIG-IP Management IP>``
#. Click iApps -> Application Services
#. Click the 'Create...' button
#. Populate the following values in the form:

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

#. Click the 'Finished' button to deploy the template
#. Review the deployed configuration using the iApp Components view
#. Review the deployment log in your SSH window
#. Click the 'Reconfigure' button
#. Add a new Pool Member to the Pool: Members table
    - Row 3: 
        - Pool Idx: 0
        - IP/Node Name: 10.1.10.102
        - Port: 80
#. Click the 'Finished' button and review the config changes

.. NOTE::
    Redeployment of iApp templates makes use of underlying mechanism in the
    BIG-IP platform that allows safe changes to the configuration without 
    interrupting existing user traffic.
