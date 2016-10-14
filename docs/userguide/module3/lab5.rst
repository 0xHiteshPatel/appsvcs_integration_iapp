.. |labmodule| replace:: 3
.. |labnum| replace:: 5
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

iApp/Policy Redeployment Behaviour
----------------------------------

The |appsvcs| template includes the ability to control what action is taken
with policies upon an iApp re-deployment event.  This functionality applies 
specifically to ASM and APM policies and controls two specific categories of 
behaviour:

#. The action the template will take with the policy object upon re-deployment.
   This action controls whether the source-of-truth for the policy is the 
   current config on the BIG-IP device or the policy bundled/loaded in the
   template. 

   - **preserve:** The policy on the device will be preserved.  This option
     allows direct policy manipulation on the the device or by third party 
     systems
   - **redeploy:** The policy bundled in the template will be re-deployed, 
     overwriting any local changes

#. Whether user traffic is allowed through the virtual server during 
   re-deployment

   - **bypass:** User traffic will bypass all policies during redeployment
   - **block:** The virtual server will be marked down resulting in no user 
     traffic transiting the virtual server

The available options are:

.. list-table::
   :widths: 30 70
   :header-rows: 1 
   :stub-columns: 1

   * - Option Name
     - Description
   * - preserve-bypass
     - - **Source-of-truth:** BIG-IP Device
       - **Traffic:** Allowed during re-deployment

   * - preserve-block
     - - **Source-of-truth:** BIG-IP Device
       - **Traffic:** Blocked during re-deployment

   * - redeploy-bypass
     - - **Source-of-truth:** iApp template
       - **Traffic:** Allowed during re-deployment

   * - redeploy-block
     - - **Source-of-truth:** iApp template
       - **Traffic:** Blocked during re-deployment

The behaviour can be controlled independently using these fields:

- ASM: :ref:`iApp: ASM: Deployment Mode <preso-iapp-asmDeployMode>`
- APM: :ref:`iApp: APM: Deployment Mode <preso-iapp-apmDeployMode>`
