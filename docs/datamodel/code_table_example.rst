GUI:

.. image:: ../_static/iApps_table_example.png
  :scale: 90%

REST API:  

.. code:: json

  {  
    "tables":[  
        {  
         	"columnNames":[ "Integer", "String1", "String2" ],
         	"rows":[  
             	{ "row":[ "0", "abc", "xyz" ] },
             	{ "row":[ "1", "ABC", "XYZ" ] }
          	],
         	"name":"example__table1"
        },
        {  
         	"columnNames":[ "Integer", "String1", "String2" ],
         	"rows":[  
             	{ "row":[ "0", "abc", "xyz" ] },
             	{ "row":[ "1", "ABC", "XYZ" ] }
         	],
         	"name":"example__table2"
        }
    ]
  }
