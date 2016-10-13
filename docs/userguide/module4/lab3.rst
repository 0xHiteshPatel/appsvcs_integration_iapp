.. |labmodule| replace:: 4
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Test Cases
----------

The |appsvcs| package includes a comprehensive test framework that uses the 
:ref:`helper_deploy_iapp` helper script to test the functionality of the
template. 

The use cases are contained within the :github_file:`test <test>` directory of
the source tree.  The ``.json`` files within this directory represent the input
variables used to test the specific use case.

Users of the |appsvcs| template can refer to the test case JSON files as the 
authoritative source for implemented functionality.  The :doc:`/presoref` also
includes links to each test case that references a particular input variable.  
By examining the test case templates a user can determine additional 
functionality that is available but has not been covered in a specific lab.

Developers interested in running the test framework would use the 
:github_file:`run_tests.py <test/run_tests.py>` script.  The script can 
be run with the ``--help`` option to obtain more information.
