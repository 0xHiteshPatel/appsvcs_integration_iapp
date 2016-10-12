.. |labmodule| replace:: 4
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

.. _custom_extensions:

Custom Extensions
-----------------

To address the need for site-specific extensions the |appsvcs| has been designed
to allow inclusion of custom code.  Custom extensions have full access to the 
runtime environment of the implementation layer allowing both addition of new 
functionality, or modification of existing functionality.  There are 6 specific
points at which a user can execute custom code:

- The start of the deployment
- Before creation of the pools

  - Before creation of each pool
  - After creation of each pool

- After creation of the pools
- Before creation of the virtual servers

  - Before creation of each virtual server
  - After creation of each virtual server

- After creation of the virtual servers
- At the end of the deployment

While custom extensions have full access to all variable values passed from the 
presentation layer during deployment, any new functionality that requires user
input should utilize the fields in the ‘Custom Extensions’ section.  Three 
Extension fields are provided with the base template for this purpose. This lab
will walk through some of the included Custom Extension samples to provide a
general overview of the functionality.  Custom Extensions are contained in the
:github_file:`custom_extensions.tcl <src/include/custom_extensions.tcl>` file.  
This file is automatically included into the template when it is built via the 
build scripts.  

#. Review the comments in the 
   :github_file:`custom_extensions.tcl <src/include/custom_extensions.tcl>` file
   to see how it is structured.
#. Monitor the deployment log and modify one of your existing deployments to 
   include the string ``custom_example=1`` in the 
   :ref:`Extensions: Field 1 <preso-extensions-Field1>`.  Do you see the log 
   messages that are generated in the deployment log?
