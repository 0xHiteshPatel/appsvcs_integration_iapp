.. _iRules: https://devcentral.f5.com/wiki/iRules.HomePage.ashx
.. _bundled/: https://github.com/0xHiteshPatel/appsvcs_integration_iapp/blob/develop/src/bundled/
.. _vs__BundledItems: presoref/presoref.html#field-vs-bundleditems
.. _test_vs_standard_https_bundle_asm_preserve.json: https://github.com/0xHiteshPatel/appsvcs_integration_iapp/blob/develop/test/test_vs_standard_https_bundle_asm_preserve.json#L64-L65

Item Bundling/L4-7 Policies
===========================

This template implements a generic mechanism that allows various system 
resources to be 'bundled' within the template and/or loading dynamically from
a URL.  This mechanism allows users to deploy the following types of resources:

- Packaged within template:
	- iRules_
	- ASM (Web Application Firewall) Policies
	- APM (Identity & Access Management) Policies
- Dynamically loaded from URL:
	- iRules_
	- ASM Policies
	- APM Policies
	- SSL/TLS Objects:
		- Certificates
		- Keys
		- Certificate Chain/Bundle

The two methods detailed below are **NOT** mutually exclusive and may be used 
together without issue.

Bundling
--------

Bundling resources with the template allows a user to create packaged templates
for specific use cases.  Because resources are packaged as part of the template
this mechanism is appropriate for environments that properly version control 
the template itself and do not need the ability to load resources dynamically
at runtime.

For a step-by-step walk through on this process please refer to TODO: <bundling lab>
The following steps are required to use this functionality:

#. Download the source tree for the iApp
#. Install required packages on the build system
	- Python >= 2.7
		- sphinx package (pip install sphinx)
		- sphinx_rtd_theme package (pip install sphinx_rtd_theme)
#. Place resources in the appropriate location under the `bundled/`_ directory
#. Build the template using the appropriate command
	- Linux, Mac OS: ``./build.sh <optional name>``
	- Windows: ``./build.sh <optional name>``
#. Upload the resulting template to the BIG-IP system

Bundled items will now be available to select for deployment via the 
:ref:`vs__BundledItems <preso-vs-BundledItems>` field.

Bundled items are specific in the array format with element using a
``<type>:<name>`` format.  Examples are:

- ``irule:my_irule``
- ``asm:my_asm_policy``
- ``apm:my_apm_policy``

.. _bundlingmulti:

To specify multiple resources for deployment an array can be sent:

``['irule:my_irule','asm:my_asm_policy','apm:my_apm_policy']``

With the exception of APM policies multiple resources of each type can be
deployed with each deployment.

Dynamic Loading from URL
------------------------

Dynamic loading of resources allows for a more flexible approach to automated
deployment in Continuous Integration/Continuous Deployment environments.  This
mechanism allows URLs to be specified for resources that are then loaded at 
runtime from the BIG-IP system.  To accomplish this the 
:ref:`vs__BundledItems <preso-vs-BundledItems>` field is used with a special
syntax that specifies the URL of the resource to load:

``<type>:url=<url>``

Variable substitution is available within the URL string to allow runtime 
specification of URL components.  The variables currently supported are:


.. list-table::
	:widths: 10 90
	:header-rows: 1
	:stub-columns: 1

	* - Variable
	  - Description
	* - %APP_NAME%
	  - The name of the iApp deployment
	* - %APP_PATH%
	  - The path of the iApp deployment
	* - %PARTITION%
	  - The name of the BIG-IP partition used for deployment
	* - %VS_NAME%
	  - The value of the :ref:`vs__Name <preso-vs-Name>` field
	* - %VS_DESCR%
	  - The value of the :ref:`vs__Description <preso-vs-Description>` field
	* - %EXT1%
	  - The value of the :ref:`extensions__Field1 <preso-extensions-Field1>` 
	    field
	* - %EXT2%
	  - The value of the :ref:`extensions__Field2 <preso-extensions-Field2>` 
	    field
	* - %EXT3%
	  - The value of the :ref:`extensions__Field3 <preso-extensions-Field3>` 
	    field

For example, if the name of our iApp deployment was ``my_http_app`` providing:

``irule:url=https://git.company.com/infra/adc/%APP_NAME%/default_irule.irule``

Would result in a URL of:

``https://git.company.com/infra/adc/my_http_app/default_irule.irule``

The same constraints mentioned in :ref:`Item Bundling <bundlingmulti>` apply
when loading multiple resources via URLs

Referencing Bundled Policies
----------------------------

In the case of ASM and APM policies, the mechanism used by the 
:ref:`execflow_bundler` only **CREATES** the resources on the system.  To 
utilize the resource you must cross-reference it in the  appropriate
presentation layer fields.

APM Policy
^^^^^^^^^^^^

To use a policy deployed via the bundler you must specify the value
``use-bundled`` in the :ref:`vs__ProfileAccess <preso-vs-ProfileAccess>` field.

The :ref:`execflow_bundler` will then associate the APM policy with the Virtual
Server automatically.

ASM Policies
^^^^^^^^^^^^

To use an ASM policy deployed via the bundler you must create a L7 policy that
references the resource name as a target.  The format for the name is 
``bundled:<resource name>`` and it must be specified as a value for a Parameter
in the :ref:`L7 Policy Action <preso-l7policy-rulesAction>` table.  An example
of this can be found in `test_vs_standard_https_bundle_asm_preserve.json`_ 
test case.

