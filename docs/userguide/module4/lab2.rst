.. |labmodule| replace:: 4
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Helper Scripts
--------------

The |appsvcs| package includes helper scripts that aid the user with various
automation tasks.  The scripts are located in the :github_file:`scripts <scripts>`
directory.

import_template_bigip.py
^^^^^^^^^^^^^^^^^^^^^^^^

This script uses the F5 BIG-IP iControl REST API to import an iApp template. 
It supports setting multiple options as shown built-in ``--help`` output.  

The script supports:

- Creating a new template that does not exist on the target system
- Modifying an existing template if the ``-o`` option is specified

We require that the implementation, presentation, HTML Help and macro 
definitions of the iApp template be in different files.  By default it will 
look in the current working directory for the following files:

   .. list-table::
        :widths: 20 60 10 10
        :header-rows: 1
        :stub-columns: 1

        * - Default Filename
          - Description
          - Required
          - CLI Argument
        * - iapp.tcl
          - Implementation Layer TCL Code
          - Yes
          - ``-i``
        * - iapp.apl
          - Presentation Layer TCL Code
          - Yes
          - ``-a``
        * - iapp.html
          - HTML Based Help
          - No
          - ``-n``
        * - iapp.macro
          - iApp Macro Definition
          - No
          - ``-m``

Different filenames can be specified using the corresponding CLI arguments 
in the table above 

By default the script will automatically save the system config.  This 
behaviour can be disabled by using the ``-d`` option.

If you are specifying the require TMOS modules please format as a comma 
separated list of module names such as:
 
	``ltm,gtm,asm,afm``

For further options please run the script with the ``--help`` argument

import_cert_key.py
^^^^^^^^^^^^^^^^^^

This script uses the F5 BIG-IP iControl REST API to import a cert/key pair. 
It supports setting multiple options as shown built-in ``--help`` output.  

The script supports:

- Importing cert/key objects
- Overwriting an existing object (``-o`` option)

Example:

	``python import_cert_key.py -P Common -c example.crt -k example.key <BIG-IP mgmt IP> example``

The preceding command will create the following objects:

:/Common/example.crt: The cert contained in the example.crt file
:/Common/example.key: The key contained in the example.key file
	
For further options please run the script with the ``--help`` argument

.. _helper_deploy_iapp:

deploy_iapp_bigip.py
^^^^^^^^^^^^^^^^^^^^

This script uses the F5 BIG-IP iControl REST API to create a specific
instance of an iApp deployment.

The script supports:

- Deployment/Redeployment of an iApp using JSON template files
- Hierarchical definition of a deployment using multiple JSON files
	- A JSON template can specify a 'parent' file to inherit properties from
	- No limit to the number of levels of inheritance
- Automatic selection of the latest version of the appsvcs_integration_iapp 
- Specification of partition, traffic-group, device-group and other global items

Sample template files are included in the 
:github_file:`deploy_iapp_samples <scripts/deploy_iapp_samples>` directory that 
implement a three-level hierarchy and deploy a HTTPS or HTTP virtual server 
using the |appsvcs| template.  The following table describes the contents of the
sample files:

- sample_defaults.json: Default values for all the fields contained in the iApp

  - sample_https.json: Default values for a HTTPS service (parent: sample_defaults.json)

    - sample_myhttps.json: Top level definition of the service (parent: sample_https.json)

  - sample_http.json: Default values for a HTTP service (parent: sample_defaults.json)
  
    - sample_myhttp.json: Top level definition of the service (parent: sample_http.json)

To deploy the sample_myhttps.json template a command like this can be used:
 
.. code:: 

	cd deploy_iapp_samples
	python ../deploy_iapp_bigip.py -u <username> -p <password> <BIG-IP mgmt IP> sample_myhttps.json

By default the script will automatically save the system config.  This 
behaviour can be disabled by using the ``-d`` option.

For further options please run the script with the ``--help`` argument

delete_iapp_bigip.py
^^^^^^^^^^^^^^^^^^^^

This script uses the F5 BIG-IP iControl REST API to delete a specific
instance of an iApp deployment.

The script supports:

- Specification of the BIG-IP partition (``-P`` option; default is ``Common``)
- Script-friendly operation to suppress delete confirmation (``-n`` option)

To delete the an iApp deployment named ``my_http`` a command like this can be used:
 
``python delete_iapp_bigip.py -u <username> -p <password> <BIG-IP mgmt IP> my_http``

By default the script will automatically save the system config.  This 
behaviour can be disabled by using the ``-d`` option.

For further options please run the script with the ``--help`` argument
