.. _F5 DevCentral iApp Wiki: https://devcentral.f5.com/wiki/iApp.HomePage.ashx
.. _tmsh: https://devcentral.f5.com/wiki/TMSH.HomePage.ashx
.. _APL: https://devcentral.f5.com/wiki/iApp.APL.ashx
.. _Partition: https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-user-account-administration-11-6-0/2.html
.. _Route-Domain: https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-routing-administration-11-6-0/8.html

Design Methodology & Goals
==========================

Goals
-----

The high level goals for this project are as follows:

 - Enable utilization of the full F5 L4-7 feature set while masking complexity from NorthBound systems
 - Cover the most common deployment use cases as standard, community supported, features
 - Provide simple extension mechanisms for customization that may be required in your environment
 - Minimize (over time) changes to the NorthBound API Data Model
 - Normalize F5 specific configuration as much as possible between all integrations
 - Rapidly deliver new features and functionality
 - Support a broad range of F5 BIG-IP software releases

iApp Basics & Constraints
-------------------------

.. NOTE::
	For full documentation on iApp's please refer to the `F5 DevCentral iApp Wiki`_  This documentation is limited to explaining how we utilize the iApp infrastructure with this particular project.

Basic Terms
^^^^^^^^^^^

.. csv-table::
	:header: "Term","Definition"
	:widths: 20 80
	:stub-columns: 1

	"iApp template","A file (.tmpl extension) that contains the tmsh_ importable definition of an iApp.  The template contains the implementation and presentation layers along with other settings"
	"Presentation layer","The APL_ definition of the user interface and API data model for the iApp template"
	"Implementation layer","The TCL based tmsh_ script that actually processes input defined in the presentation layer and deploys a configuration on the BIG-IP device"
	"[North/South]bound","The direction of API calls in an implementation.  Northbound generally implies integration with another system or product through a standardized API (REST, SOAP, etc).  Southbound generally implies vendor specific integration through open or non-standards based APIs"
	"BIG-IP","The data plane element that executes the implementation layer code of an iApp template and deploys a config to process network traffic"
	"iWorkflow","The *optional* control plane element that interacts with and manipulates the presentation layer of an iApp"

Presentation Layer Contraints
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To provide the broadest compatibility with third-party systems we implement a very simple presentation layer.  Advanced TCL-based programmatic logic in the presentation layer is not implemented by this iApp (even though APL supports this).  The reasoning behind this is that there is no reliable, standard way to execute logical arguments in third party systems.  Some simple use cases are implemented (e.g. auto-population of a dropdown), however, these are only useful when the iApp Presentation Layer is rendered via the BIG-IP GUI.  As a result all functionality implemented is required to function correctly without this programmatic logic.

Implementation Layer Constraints
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Within the implementation layer we have a lot more flexibility in how features are implemented.  Generally, anything is possible, however we take care to implement features in a manner that can work with all possible integrations.  

All deployments are fully Partition_ and `Route-Domain`_ aware to enable full multi-tenancy.  When running in Standalone mode users may choose to simply use the Common partition and route-domain 0 to achieve a non-multi-tenant config, however, the implementation of all features should enable multi-tenancy by default.

Furthermore, all implementation layer code must be compatible with all modes unless specifically enabled only for a particular mode and documented clearly.  Introduction of additional presentation layer fields for mode-specific options should be avoided to maintain the simplest possible user and API interface.

Versioning
----------

To integrate in the most flexible manner with other systems we have to implement versioning in a flexible manner.  The version number of the template needs to convey three pieces of information:

.. list-table::
	:widths: 20 80
	:header-rows: 0
	:stub-columns: 1

	* - Implementation Major Version
	  - The major functionality and modes implemented by the template
	* - Implementation Minor Version
	  - The minor revision of the template.  Allows hotfixes, field-level option additions and custom extension changes without impacting northbound systems
	* - Presentation Version
	  - The version of the presentation layer data model that is exposed via a northbound API

Additionally we have to also create a unique object name for the template that is used within BIG-IP and iWorkflow while maintaining support for previous versions of the template.

Assuming the following:  

 + impl_major = **0.1**
 + impl_minor = **002**
 + pres_rev     = **003**

We substitute into this format:  

- Template Version: ``v<impl_major>(<impl_minor>)_<pres_rev>``
- BIG-IP/IQ Template Name: ``appsvcs_integration_v<impl_major>_<pres_rev>``

Resulting in:  

- Template Version: **v0.1(002)_003** 
- BIG-IP/IQ Template Name: **appsvcs_integration_v0.1_003**

While this scheme is somewhat complex, we have little choice in the matter, because most northbound integrations require that we maintain a consistent copy of the template for each service deployment instance throughout the entire automation/orchestration stack.  This versioning system allows use to maintain full compatibility for existing service deployment, while still providing a mechanism to deploy new/hotfix versions of the template without service impacting outages at the data plane layer for existing service deployments.  
