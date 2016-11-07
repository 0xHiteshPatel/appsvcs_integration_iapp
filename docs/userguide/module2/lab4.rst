.. |labmodule| replace:: 2
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Deploy Generic UDP SLB Service
------------------------------

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
           - 245
         * - :ref:`Pool: Pool Table <preso-pool-Pools>`
           - - Row 1: 

               - Index: 0 
               - Monitor(s): 0

         * - :ref:`Pool: Members <preso-pool-Members>`
           - - Row 1: 

               - Pool Idx: 0
               - IP/Node Name: 10.1.10.100
               - Port: 245

             - Row 2:

               - Pool Idx: 0
               - IP/Node Name: 10.1.10.101
               - Port: 245

         * - :ref:`Monitor: Monitor Table <preso-monitor-Monitors>`
           - - Row 1: 

               - Index: 0
               - Name: /Common/udp

         * - :ref:`Virtual Server: IP Protocol <preso-vs-IpProtocol>`
           - udp               
         * - :ref:`Virtual Server: Client-side L4 Protocol Profile <preso-vs-ProfileClientProtocol>`
           - /Common/udp
         * - :ref:`Virtual Server: Server-side L4 Protocol Profile <preso-vs-ProfileServerProtocol>`
           - /Common/udp           
         * - :ref:`Virtual Server: Default Persistence Profile <preso-vs-ProfileDefaultPersist>`
           - /Common/source_addr
   
   .. NOTE::
      The health monitors will fail because the backend pool member is not 
      listening on UDP/245.  This is normal and can be ignored.

#. Review the deployed config and deployment log
