.. |labmodule| replace:: 2
.. |labnum| replace:: 8
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

.. _Local Traffic Policies: https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-1/3.html

L7 HTTP Policies
----------------

To enable advanced ADC functionality this iApp template includes the ability to
fully create and manipulate LTM `Local Traffic Policies`_.  The policies allow
various routing and manipulation operations of HTTP/HTTPS requests.  In this lab
we will cover some common use cases for Local Traffic Policies.

HTTP URI/Host Based Routing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this lab we will create a deployment that implements routing based on the 
HTTP URI or Host Header to one of four pools:

- HTTP Host equals www.example1.com

  - HTTP URI starts with /pool0/ -> Pool 0
  - HTTP URI starts with /pool1/ -> Pool 1
   
- HTTP Host equals www.example2.com

  - HTTP URI starts with /pool2/ -> Pool 2
  - HTTP URI starts with /pool3/ -> Pool 3

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
          - 80
        * - :ref:`Pool: Pool Table <preso-pool-Pools>`
          - - Row 1:

              - Index: 0 
              - Monitor(s): 0

            - Row 2: 

              - Index: 1
              - Monitor(s): 0

            - Row 3: 

              - Index: 2 
              - Monitor(s): 0

            - Row 4: 

              - Index: 3 
              - Monitor(s): 0

        * - :ref:`Pool: Members <preso-pool-Members>`
          - - Row 1: 

              - Pool Idx: 0
              - IP/Node Name: 10.1.10.100
              - Port: 80

            - Row 2:

              - Pool Idx: 1
              - IP/Node Name: 10.1.10.101
              - Port: 80

            - Row 3:

              - Pool Idx: 2
              - IP/Node Name: 10.1.10.102
              - Port: 80

            - Row 4:

              - Pool Idx: 3
              - IP/Node Name: 10.1.10.103
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
        * - :ref:`L7 Policy: Rules: Matching <preso-l7policy-rulesMatch>`
          - - Row 1: 

              - Group: 0
              - Operand: http-host/request/host
              - Condition: equals
              - Value: www.example1.com

            - Row 2: 

              - Group: 0
              - Operand: http-uri/request/path
              - Condition: starts-with
              - Value: /pool0/

            - Row 3: 

              - Group: 1
              - Operand: http-host/request/host
              - Condition: equals
              - Value: www.example1.com

            - Row 4: 

              - Group: 1
              - Operand: http-uri/request/path
              - Condition: starts-with
              - Value: /pool1/

            - Row 5: 

              - Group: 2
              - Operand: http-host/request/host
              - Condition: equals
              - Value: www.example2.com

            - Row 6: 

              - Group: 2
              - Operand: http-uri/request/path
              - Condition: starts-with
              - Value: /pool2/                

            - Row 7: 

              - Group: 3
              - Operand: http-host/request/host
              - Condition: equals
              - Value: www.example2.com

            - Row 8: 

              - Group: 3
              - Operand: http-uri/request/path
              - Condition: starts-with
              - Value: /pool3/

        * - :ref:`L7 Policy: Rules: Action <preso-l7policy-rulesAction>`
          - - Row 1: 

              - Group: 0
              - Operand: forward/request/select/pool
              - Parameter: pool:0

            - Row 2: 

              - Group: 1
              - Operand: forward/request/select/pool
              - Parameter: pool:1

            - Row 3: 

              - Group: 2
              - Operand: forward/request/select/pool
              - Parameter: pool:2

            - Row 4: 

              - Group: 3
              - Operand: forward/request/select/pool
              - Parameter: pool:3

#. Review the deployed policy by clicking on the |labname|\ _l7policy object in 
   the component view.

    - Review the rules that were creating by the iApp template

HTTP Cookie/Header Manipulation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We will now modify the existing deployment to perform some Header and Cookie
manipulations.  

#. Click iApps -> Application Services -> |labname| -> Reconfigure
#. Modify the following values and click 'Finished':

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - :ref:`L7 Policy: Rules: Action <preso-l7policy-rulesAction>`
          - - Row 5: 

              - Group: 0
              - Operand: http-header/request/insert/name,value
              - Parameter: X-My-Header,Lab2.8

            - Row 6: 

              - Group: 1
              - Operand: http-cookie/request/insert/name,value
              - Parameter: MyCookie,Lab2.8

            - Row 7: 

              - Group: 2
              - Operand: http-header/request/remove/name
              - Parameter: User-Agent

            - Row 8: 

              - Group: 3
              - Operand: http-header/response/replace/name,value
              - Parameter: Server,GoAway

#. Review the deployed policy by clicking on the |labname|\ _l7policy object in 
   the component view.

    - Review the updated actions in the existing rules.

HTTP Redirects
^^^^^^^^^^^^^^

Finally, we will modify the existing deployment to issue an HTTP redirect for
any traffic that does not specfically match the rules we created in the first
step of this lab.

#. Click iApps -> Application Services -> |labname| -> Reconfigure
#. Modify the following values and click 'Finished':

   .. list-table::
        :widths: 30 80
        :header-rows: 1
        :stub-columns: 1

        * - Field Name
          - Value
        * - :ref:`L7 Policy: Rules: Matching <preso-l7policy-rulesMatch>`
          - - Row 9: 

              - Group: default

        * - :ref:`L7 Policy: Rules: Action <preso-l7policy-rulesAction>`
          - - Row 9: 

              - Group: default
              - Operand: http-reply/request/redirect/location
              - Parameter: http://www.example3.com

#. Review the deployed policy by clicking on the |labname|\ _l7policy object in
   the component view.
   
    - Review the updated rules in the policy.

