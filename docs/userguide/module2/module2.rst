ADC/LTM Functionality
=====================

This module will focus specifically on BIG-IP LTM and provide the foundation for
an operational model for both F5 deployment automation and Service Insertion 
with third party solutions (Cisco APIC, VMware NSX, AWS, etc).  The solutions 
detailed here can be used independent of any third party products and are 
intended to show how deployment-centric automation can be achieved using 
existing F5 iApp technology.  It is important to note that the Application 
Services iApp does not deploy any L1-3 connectivity config to the device.  This 
is done by design because the expectation is that L1-3 config is performed by 
the user or by a third party system prior to L4-7 Application Service 
deployment.

To simplify this and future tasks when deploying an iApp from the BIG-IP GUI
we will present the various field values in a table.  To complete the task 
please enter/modify all values included in the table.  If a specific value is 
not specified please do not modify the default value.  You can also use the 
Find feature (Ctrl+F) of the web browser to find fields using the Field Name.

.. toctree::
	:glob:

	lab*
