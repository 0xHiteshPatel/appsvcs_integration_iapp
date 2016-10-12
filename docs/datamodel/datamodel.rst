.. _Section: https://devcentral.f5.com/wiki/iApp.section.ashx
.. _Value Field: https://devcentral.f5.com/wiki/iApp.APL.ashx#Value_Elements_0
.. _Text String: https://devcentral.f5.com/wiki/iApp.APL.ashx#The_Text_String_Table_Element_5
.. _APL: https://devcentral.f5.com/wiki/iApp.APL.ashx
.. _String: https://devcentral.f5.com/wiki/iApp.string.ashx
.. _Table: https://devcentral.f5.com/wiki/iApp.table.ashx
.. _List/Multi Choice: https://devcentral.f5.com/wiki/iApp.multichoice.ashx

==========
Data Model
==========

Presentation Layer Structure
----------------------------

The Presentation Layer implemented using APL_ by this templates consists of
three major components:

.. csv-table::
	:header: "Type","Description"
	:widths: 20 80

	"`Section`_","A specific section that contains various value fields. Serves
	as base for REST API attribute names"
	"`Value Field`_","A particular value field that accepts user input"
	"`Text String`_","The text description used by the GUI"

To form the TCL variable names used in the Implementation Layer you combine the 
Section name and Value Field name with two underscores ("\_\_").  For example, 
given a Section name of "mysection" and a Value Field name of "myfield" the 
corresponding TCL variable name would be "$mysection__myfield".

APL Data Types
--------------

APL_ provides a set of field types that are used for data input to an iApp 
template.  These fields types behave differently based on a GUI or API 
interaction with the system.  This section details how the various field types 
used in this iApp template can be leveraged via a GUI or API based interaction.

.. csv-table::
	:header: "Field Type","Description","GUI/REST API Representation"
	:widths: 20 20 80

	"`String`_","Used for arbitrary string input.  Built-in validators may be 
	used but are only used by the GUI.",.. include:: code_string_example.rst
	"`Table`_","Used for input of table based data.  Arbitrary input field 
	types are specified as columns within the table.  User input is accomplished
	by sending a set of rows that maps to the input fields specified as columns.
	Tables cannot be nested.",.. include:: code_table_example.rst
	"`List/Multi Choice`_","Used for input of an ordered list of arbitrary 
	strings.  GUI representation is displayed and a fixed set of options, 
	however, API representation	allows for arbitrary input.",.. include:: code_list_example.rst

Template Specific Data Model/Syntax
-----------------------------------

The formats described in this section are implemented specifically by this 
template only.  The items specified in this section extend APL data types to add
additional functionality.

Indexes in APL Tables
---------------------

Index columns are used by various APL Tables in this template to provide a 
consistent method to access and reference specific table rows in other parts 
of the presentation layer.  This consistency is required because the order of 
rows cannot be guaranteed to remain consistent in an orchestration/automation 
toolchain.  Throughout the Presentation Layer of the template the value of the 
Index field is used to provide a 'hard' link to a specific item within a table.  

As an example when creating LTM Pools and Monitors, we use the Pool\_\_Pools 
and Monitor\_\_Monitors tables.  Each row in the Monitor\_\_Monitors table 
creates a specific monitor on the system.  To reference a particular Monitor 
to use for the Pool we use the Index of the row in the Monitor\_\_Monitors 
table.  To implement the following:

+ 2 LTM Pools
	+ 1st pool uses a TCP & HTTP monitor
	+ 2nd pool uses a TCP monitor
+ 2 LTM Monitors
	+ HTTP 
	+ TCP

We would use the following tables (JSON format):

.. code:: json

	{  
	   "tables":[  
			{
	        	"name":"monitor__Monitors",
	        	"columnNames": ["Index", "Name", "Type", "Options"],
	        	"rows" : [
	            	{ "row": [ "0", "/Common/tcp", "none", "none" ] },
	            	{ "row": [ "1", "/Common/http", "none", "none" ] }
	         	]
	    	},
	      	{
	        	"name":"pool__Pools",
	        	"columnNames": [ "Index", "Name", "Description", "LbMethod", "Monitor", "AdvOptions" ],
	        	"rows" : [
	            	{ "row": [ "0", "pool_0", "", "round-robin", "0,1", "none"] },
	            	{ "row": [ "1", "pool_1", "", "round-robin", "0", "none"] },
	         	]
	      	}
	    ]
	}

.. include:: createadvopt.rst

Additional Syntaxes
-------------------

Various fields use specific syntaxes to expose functionality.  If applicable, 
the format of these fields are documented in the specific entry for the 
field/table/column in question in the :doc:`/presoref`

