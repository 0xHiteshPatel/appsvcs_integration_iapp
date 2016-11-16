.. |labmodule| replace:: 3
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

.. _ug_module3_lab1:

Building a Custom Template
--------------------------

.. NOTE::
	To fully understand this module of the lab it is recommended that you review
	the :doc:`/policies` section of the Reference Guide.

In order to use :ref:`policies_bundling` and :ref:`custom_extensions` 
functionality the |appsvcs| template needs to be custom built with the resources
that you wish to include.  

To build the template your system must meet the following requirements:

- Windows/Mac/Linux OS
- Python >= 2.7

Additionally, if you would like to build the documentation the following 
python packages are required:

- sphinx
- sphinx_rtd_theme

Download and Build the Template
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To build the template complete these tasks:

#. Download the source tree archive:
	- :github_zip_url:`archive`
#. Extract the archive on your local system
#. Run ``python build.py -nd -a custom`` using a shell/command line in the
   extracted source directory

   .. NOTE::
   	   Notice the ``-nd -a custom`` arguments to the build script.  The ``-nd``
   	   argument disables building the documentation tree; ``-a custom`` appends
   	   ``custom`` to the template name.  Running ``python build.py --help`` will
   	   show you other options available during the build process.

#. You should now have a file named
   appsvcs_integration_v\ |ver_major|\ -\ |ver_minor|\ _\ |ver_pres|\ _custom.tmpl
   in the source directory

Bundling Resources with a Custom Template
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this lab we will rebuild the custom template and add some bundled resources.
This method of bundling allows a user to package specific resources with the 
template itself allowing a full L4-7 service deployment without interaction
with any other systems.  URL based resources are also available and will be 
covered in subsequent labs.

.. NOTE::
    The ASM and APM policies used below were exported from a running BIG-IP 
    system.

#. Open the source directory that was created in the previous lab
#. Open the 'bundled' directory.  Notice the three directories that exist there.
#. We will now populate the directories with sample resources that included 
   with the |appsvcs| test framework. **Copy the follow files (paths relative to 
   the root of the source tree):**
   
   - test/bundled.test/irules/* -> bundled/irules/
   - test/bundled.test/asm_policies/* -> bundled/asm_policies/
   - test/bundled.test/apm_policies/* -> bundled/apm_policies/

#. Run ``build.py -nd -a custom`` using a shell/command line.  Take note of the
   output from the build script.  You should see the copied files are now 
   being packaged into the template:

   .. code:: console

		$ ./build.py -nd -a custom
		Appending "custom" to template name
		Generating APL...
		Assembling main template...
		Building bundled resources:
		 Adding iRules (bundled/irules/*.irule)...
		 Adding ASM policies (bundled/asm_policies/*.xml)...
		 Adding APM policies (bundled/apm_policies/*.tar.gz)...
		 Processing file: bundled/irules/bundle1.irule
		 Processing file: bundled/irules/bundle2.irule
		 Processing file: bundled/asm_policies/asm_example1.xml
		 Processing file: bundled/asm_policies/asm_example2.xml
		 Processing file: bundled/apm_policies/test_11_5.conf.tar.gz
		  Found BIG-IP Version: 11.5
		 Processing file: bundled/apm_policies/test_11_6.conf.tar.gz
		  Found BIG-IP Version: 11.6
		 Processing file: bundled/apm_policies/test_12_0.conf.tar.gz
		  Found BIG-IP Version: 12.0
		 Processing file: bundled/apm_policies/test_12_1.conf.tar.gz
		  Found BIG-IP Version: 12.1

#. You should now have a file named
   appsvcs_integration_v\ |ver_major|\ -\ |ver_minor|\ _\ |ver_pres|\ _custom.tmpl
   in the source directory
#. Import this template into your BIG-IP system using the procedure described in
   :ref:`ug_module1_lab2`

