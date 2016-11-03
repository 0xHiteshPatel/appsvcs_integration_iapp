.. _Releases: https://github.com/0xHiteshPatel/appsvcs_integration_iapp/releases

Obtain and Import the Pre-built Template
----------------------------------------

Obtain the Pre-built Template
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Right-click :tmpl_file:`here <../../_static>` and save version |release| of 
   the template to your system.

.. _ug_module1_lab2:

Import the Template
^^^^^^^^^^^^^^^^^^^

#. Open a web browser and navigate to ``https://<BIG-IP Management IP>``.  You 
   may be prompted with an SSL/TLS security warning.  It is safe to bypass this 
   warning in this case.

   .. NOTE::
        Template installation is possible via API and included scripts.  These
        methods are covered in subsequent labs
#. Authenticate to the BIG-IP system with an admin user (default is admin/admin)
#. On the navigation menu on the left of the screen click iApps -> Templates
#. Click the 'Import...' button on the top right of the screen
#. Click the 'Choose File' button
#. Find the ``.tmpl`` file saved previously and double click it
#. Click the 'Upload' button

You should now see a template beginning with the name 'appsvcs_integration' at 
the top of the template list

.. NOTE::
    iApp templates are part of the BIG-IP config; as a result they will be 
    synchronized across BIG-IP clusters that have config synchronization enabled
