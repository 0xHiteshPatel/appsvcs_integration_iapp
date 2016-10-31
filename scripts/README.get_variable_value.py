get_variable_value.py
	Find the value of a variable in a JSON template used by deploy_iapp_bigip.py

This script preprocesses JSON template using the same mechanism used in the 
deploy_iapp_bigip.py script and returns the value of the variable specified.

It supports listing the values of an APL table using the syntax:
 <table name>.<column>

 Example:

  pool__Members.IPAddress

For further options please run the script with the --help argument

