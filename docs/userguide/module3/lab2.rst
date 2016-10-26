.. |labmodule| replace:: 3
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

iRule Deployment
----------------

In this lab we will show how to deploy iRule resources with a deployment.

iRule Deployment via Bundled Resource
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

              - Resource: irule:bundle2 

            - Row 2: 

              - Resource: irule:bundle1 

			.. NOTE::
				Be sure to preserve the order shown above.  iRules are ordered
				resources and the ordering below is specifically designed to 
				show that this ordering is preserved.

#. Click the 'Finished' button to deploy the template
#. Review the deployed configuration using the iApp Components view

    - Notice that iRule resources were automatically created and attached to 
      the virtual server.

#. Click Local Traffic -> Virtual Server List.  Click the 'Edit...' link next
   to the '\ |labname|\ _default_vs_80' object.
#. Notice the order of the deployed iRules was preserved during the deployment.

iRule Deployment via URL
^^^^^^^^^^^^^^^^^^^^^^^^

.. NOTE::
    To complete this lab you must have a web server configured as detailed in 
    the :ref:`ug_lab_environment`

The second method of resource deployment is via a URL that dynamically loads the
resource at runtime.  This functionality is fully documented in the 
:ref:`policies_url` section of the :doc:`/refguide`.

.. NOTE::
    If you specify a hostname in a URL please be sure to configure DNS
    resolution on the BIG-IP system

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

              - Resource: ``irule:urloptional=http://<web server IP>/appsvcs/remote_1_optional.irule``

            - Row 4: 

              - Resource: ``irule:url=http://<web server IP>/appsvcs/remote_1.irule``

#. Review the deployed config and deployment log

    - Notice that there are now three iRules tied to the Virtual Server
    - The 'urloptional' resource does not exist on the remote server therefore
      the template skipped deployment of that iRule resource.

