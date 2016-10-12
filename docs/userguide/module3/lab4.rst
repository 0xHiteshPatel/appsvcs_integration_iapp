.. |labmodule| replace:: 3
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

IAM/APM Policy Deployment
-------------------------

In this lab we will deploy a Identity and Access Management policy that can be
used by |apm|.  Be sure to review the following documentation before continuing:

- :ref:`policies_ref`
- :doc:`/execflow`

IAM Policy Deployment via Bundled Resource
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
        * - :ref:`Virtual Server: Access Profile <preso-vs-ProfileAccess>`
          - ``use-bundled``          
        * - :ref:`Virtual Server: Bundled Items <preso-vs-BundledItems>`
          - - Row 1: 
                - Resource: <select the resource from the dropdown that begins 
                  with 'apm:' that matches the BIG-IP version you are using>


#. Click the 'Finished' button to deploy the template and monitor the deployment
   log
#. The initial objects in the Components view does not represent the final 
   state of the deployment as detailed in :doc:`/execflow`
#. Monitor the deployment log and wait for the postdeploy_final process to 
   complete
#. Review the deployed configuration using the iApp Components view
	- Notice the APM policy was deployed and linked to the Virtual Server
	  with an object name of 'bundled_apm_policy'

IAM Policy Deployment via URL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. NOTE::
    As mentioned previously only one APM policy can be deployed at a time.  We
    will replace the policy deployed previously with one loaded from a URL.

#. Click iApps -> Application Services -> |labname| -> Reconfigure
#. Modify the following values and click 'Finished':

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - :ref:`Virtual Server: Bundled Items <preso-vs-BundledItems>`
          - - Row 1: 
                - Resource: <select the appropriate item from below>

                  11.5: ``apm:url=http://<web server IP>/appsvcs/remote_apm_11_5.conf.tar.gz``
                  11.6: ``apm:url=http://<web server IP>/appsvcs/remote_apm_11_6.conf.tar.gz``
                  12.0: ``apm:url=http://<web server IP>/appsvcs/remote_apm_12_0.conf.tar.gz``
                  12.1: ``apm:url=http://<web server IP>/appsvcs/remote_apm_12_1.conf.tar.gz``

#. Click the 'Finished' button to deploy the template and monitor the deployment
   log
#. Monitor the deployment log and wait for the postdeploy_final process to 
   complete
#. Review the deployed configuration using the iApp Components view
#. Review the deployed configuration using the iApp Components view
	- Notice the APM policy was deployed and linked to the Virtual Server
	  with an object name of 'bundled_apm_policy'

