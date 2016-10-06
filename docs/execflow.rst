.. _Implementation Layer: https://github.com/0xHiteshPatel/appsvcs_integration_iapp/blob/develop/src/implementation_layer.tcl
.. _postdeploy_bundler: https://github.com/0xHiteshPatel/appsvcs_integration_iapp/blob/develop/src/include/postdeploy_bundler.icall
.. _postdeploy_final: https://github.com/0xHiteshPatel/appsvcs_integration_iapp/blob/develop/src/include/postdeploy_final.icall
.. _iCall: https://devcentral.f5.com/wiki/iCall.Homepage.ashx
.. _iStat: https://devcentral.f5.com/articles/introduction-to-istats-part-1-overview
.. _deploy_iapp_bigip.py: https://github.com/0xHiteshPatel/appsvcs_integration_iapp/blob/develop/scripts/deploy_iapp_bigip.py#L105-L134

Execution Flow
==============

Overview
--------

This iApp template uses a multi-stage execution flow to allow full deployment 
of services available on the BIG-IP platform.  The number of stages used
vary based on the specific features utilized during a particular deployment. 

Each stage executes sequentially after the previous stage completes in the
following order:

1. `Implementation Layer`_ TCL code
2. `postdeploy_bundler`_ iCall_ script to handle L4-7 policy deployment
3. `postdeploy_final`_ iCall_ script to handle deferred TMSH commands

Step 2 above is only executed if deployment of a L4-7 service policy is 
required.  For more details on L4-7 policies see :doc:`policies`

Implementation Layer
--------------------

The Implementation Layer consists of TCL code that executes sequentially
and adheres to the underlying ordering required by the BIG-IP platform. The 
overall flow is as follows:

#. Template startup (determine mode, debug level, input fix-up, etc)
#. SSL/TLS Profile Creation
#. Monitors
#. Pools
#. L7 Policy Creation (may be deferred to postdeploy_final)
#. Virtual Servers
	#. Bundled iRules (see: :doc:`policies`)
	#. Profile Processing
	#. SNAT
	#. SSL/TLS Profiles
	#. Policies
	#. Additional Listeners
#. Statistics Handlers
#. Virtual Address Options
	#. Route Advertisement
	#. Advanced Options
#. `postdeploy_bundler`_ handler creation (only required for WAF/IAM policies)
#. `postdeploy_final`_ handler creation

.. _execflow_bundler:

postdeploy_bundler
------------------

The `postdeploy_bundler`_ iCall_ script is scheduled for execution by the 
Implementation Layer as required.  The primary purpose of this script is
to create L4-7 policy elements (:doc:`policies`) and associate those policies
with any required Virtual Servers.  Execution can be tracked via the mechanisms
detailed in :doc:`logdebug` or via specific iStat_ keys that are populated at
each step of execution of the script.  The iStat_ keys are tied to the 
Application Service Object (ASO) that is created by the iApp framework for each
deployment.  The iStat keys created are:


.. list-table::
	:header-rows: 1
	:stub-columns: 1

	* - Key Name
	  - Possible States
	* - deploy.postdeploy_bundler
	  - 
	  	- ASM_IN_PROGRESS
		- ASM_COMPLETE
		- APM_IN_PROGRESS
		- APM_COMPLETE
		- DEFERRED_CMDS_IN_PROGRESS
		- DEFERRED_CMDS_COMPLETE
		- FINISHED
	* - deploy.postdeploy_bundler.asm.<policy name>
	  - - DEPLOY_IN_PROGRESS
	    - DEPLOY_COMPLETE
	* - deploy.postdeploy_bundler.apm.<policy name>
	  - - DEPLOY_IN_PROGRESS
	    - DEPLOY_COMPLETE

The final action of the postdeploy_bundler_ script is to create an iCall_ 
handler that executes the postdeploy_final_ script.

postdeploy_final
----------------

The `postdeploy_final`_ iCall_ script is scheduled for execution by *either*
the Implementation Layer or the postdeploy_bundler script.  The purpose of this
script is to execute any final commands that have been deferred to this stage.
Additionally this script populates iStat_ keys that should be used to determine
success or failure of the deployment.  The iStat keys created are:

.. list-table::
	:header-rows: 1
	:stub-columns: 1

	* - Key Name
	  - Possible States
	* - deploy.postdeploy_final
	  - 
	  	- STARTED
		- DEFERRED_CMDS_IN_PROGRESS
		- DEFERRED_CMDS_COMPLETE
		- FINISHED_<epoch timestamp>

Determining Success/Failure of Deployment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To determine overall success of a deployment the upstream system should **NOT**
rely on the state returned via the GUI or API on the initial creation of the 
deployment.  Rather, the ``deploy.postdeploy_final`` iStat_ key should be
queried for the ``FINISHED_<epoch timestamp>`` state.  A reference 
implementation of this mechanism can be found in the `deploy_iapp_bigip.py`_ 
helper script.  The mechanism implemented performs the following:

.. NOTICE:
	When using this mechanism it is required that time is synchronized
	between all systems

#. Capture current start epoch time from deployment system 
#. Determine polling interval and max number of polls
#. Loop until max number of polls
	#. Send REST POST to retrieve deploy.postdeploy_final iStat key
	#. Check if returned state starts with ``FINISHED_``
		#. Check if timestamp returned in state is greater than start time
			#. Return success
	#. Sleep until next polling interval
#. Return failure

