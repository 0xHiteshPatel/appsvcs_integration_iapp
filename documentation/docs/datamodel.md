## Presentation Layer Structure

The Presentation Layer implemented using [APL](https://devcentral.f5.com/wiki/iApp.APL.ashx) by this templates consists of three major components:

Type | Description
---|---
[Section](https://devcentral.f5.com/wiki/iApp.section.ashx) | A specific section that contains various value fields.  Serves as base for REST API attribute names
[Value Field](https://devcentral.f5.com/wiki/iApp.APL.ashx#Value_Elements_0) | A particular value field that accepts user input.
[Text String](https://devcentral.f5.com/wiki/iApp.APL.ashx#The_Text_String_Table_Element_5) | The text description used by the GUI

To form the TCL variable names used in the Implementation Layer you combine the Section name and Value Field name with two underscores ("\_\_").  For example, given a Section name of "mysection" and a Value Field name of "myfield" the corresponding TCL variable name would be "$mysection__myfield".

## APL Data Types

[APL](https://devcentral.f5.com/wiki/iApp.APL.ashx) provides a set of field types that are used for data input to an iApp template.  These fields types behave differently based on a GUI or API interaction with the system.  This section details how the various field types used in this iApp template can be leveraged via a GUI or API based interaction.

<table>
	<thead>
		<tr>
			<th>Field Type</th>
			<th>Description/GUI Representation</th>
			<th>REST API Representation</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><a href="https://devcentral.f5.com/wiki/iApp.string.ashx">String</a></td>
			<td>Used for arbritary string input.  Built-in validators may be used but are only used by the GUI<br><br><img alt="String Example" src="/img/iApps_string_example.png" width=448 height=200/></td>
			<td>
<pre><code class="javascript">{  
   "variables":[  
       {  
        	"name":"iapp__strictUpdates",
        	"value":"enabled"
       },
       {  
        	"name":"iapp__appStats",
        	"value":"enabled"
       }
   ]
}
</code></pre>
			</td>
		</tr>
		<tr>
			<td><a href="https://devcentral.f5.com/wiki/iApp.table.ashx">Table</a></td>
			<td>Used for input of table based data.  Arbritary input field types are specified as columns within the table.  User input is accomplished by sending a set of rows that maps to the input fields specified as columns.  Tables cannot be nested.<br><br><img alt="Table Example" src="/img/iApps_table_example.png" /></td>
			<td>
<pre><code class="javascript">{  
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
</code></pre>
			</td>
		</tr>
		<tr>
			<td><a href="https://devcentral.f5.com/wiki/iApp.multichoice.ashx">List/Multi-choice</a></td>
			<td>Used for input of an ordered list of arbitrary strings.  GUI representation is displayed and a fixed set of options, however, API representation allows for arbitrary input.<br><br><img alt="List Example" src="/img/iApps_multichoice_example.png" /></td>
			<td>
<pre><code class="javascript">{
	"lists": [
		{
			"encrypted": "no",
			"name": "example__list1",
			"value": [ "value 1", "value 2" ]
		}
	]	
}
	</tbody>
	</table>

## Template Specific Data Model/Syntax

The formats described in this section are implemented specifically by this template only.  The items specified in this section extend APL data types to add additional functionality.

### Indexes in APL Tables

Index columns are used by various APL Tables in this template to provide a consistent method to access and reference specific table rows in other parts of the presentation layer.  This consistency is required because the order of rows cannot be guaranteed to remain consistent in an orchestration/automation toolchain.  Throughout the Presentation Layer of the template the value of the Index field is used to provide a 'hard' link to a specific item within a table.  

As an example when creating LTM Pools and Monitors, we use the Pool\_\_Pools and Monitor\_\_Monitors tables.  Each row in the Monitor\_\_Monitors table creates a specific monitor on the system.  To reference a particular Monitor to use for the Pool we use the Index of the row in the Monitor\_\_Monitors table.  To implement the following:

+ 2 LTM Pools
	+ 1st pool uses a TCP &amp; HTTP monitor
	+ 2nd pool uses a TCP monitor
+ 2 LTM Monitors
	+ HTTP 
	+ TCP

We would use the following tables (JSON format, Index fields/references are **bold**):

<pre>{  
   "tables":[  
		{
        	"name":"monitor__Monitors",
        	"columnNames": ["Index", "Name", "Type", "Options"],
        	"rows" : [
            	{ "row": [ "<b>0</b>", "/Common/tcp", "none", "none" ] },
            	{ "row": [ "<b>1</b>", "/Common/http", "none", "none" ] }
         	]
    	},
      	{
        	"name":"pool__Pools",
        	"columnNames": [ "Index", "Name", "Description", "LbMethod", "Monitor", "AdvOptions" ],
        	"rows" : [
            	{ "row": [ "0", "pool_0", "", "round-robin", "<b>0,1</b>", "none"] },
            	{ "row": [ "1", "pool_1", "", "round-robin", "<b>0</b>", "none"] },
         	]
      	}
    ]
}
</pre>

### Advanced Options &amp; Create String Syntax

The BIG-IP platform allows very fine-grained control of options for L4-7 protocol profiles (ex: TCP, UDP, HTTP, Compression, etc.) and options for Virtual Servers and Pools.  To expose the ability to customize these options we use a syntax that can be expressed using the APL String field.  The create syntax can be used with specific Profiles, while the option syntax is used with the Virtual Server and Pool objects.  This syntax is defined as a string in the following format:


<table>
	<thead>
		<tr>
			<th colspan=2>Create String</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Description:</td>
			<td>
				A custom TMOS profile will be created with the specified options.  Options are validated at run-time with the underlying TMOS version.  Use of this format allows exposure of fine-grained options without exposing each option as a field in the APL Presentation Layer.

				The following profiles support the this syntax:
				<p><ul>
					<li>Client/Server-side L4 Protocol (tcp, udp)</li>
					<li>Server SSL</li>
					<li>Client SSL</li>
					<li>HTTP</li>
					<li>OneConnect</li>
					<li>Compression</li>
					<li>Request Logging</li>
					<li>Persistence (Default &amp; Fallback)</li>
				</ul></p>
			</td>
		</tr>		
		<tr>
			<td>Syntax:</td>
			<td>create:&lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;[;&lt;tmsh_option_name&gt;=&lt;tmsh_option_name&gt;]</td>
		</tr>
		<tr>
			<td>Example:</td>
			<td>create:nagle=disabled;proxy-low-buffer=10000;defaults-from=/Common/tcp</td>
		</tr>
	</tbody>
</table>

<table>
	<thead>
		<tr>
			<th colspan=2>Advanced Options String</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Description:</td>
			<td>
				The object will be created with the specified TMOS options.  Options are validated at run-time with the underlying TMOS version.  Use of this format allows exposure of fine-grained options without exposing each option as a field in the APL Presentation Layer.

				The following object types support the this syntax:
				<p><ul>
					<li>Virtual Servers</li>
					<li>Pools</li>
					<li>Auto-create Client-SSL Profiles</li>
				</ul></p>
			</td>
		</tr>			
		<tr>
			<td>Syntax:</td>
			<td>&lt;tmsh_option_name&gt;=&lt;tmsh_option_value&gt;[;&lt;tmsh_option_name&gt;=&lt;tmsh_option_name&gt;]</td>
		</tr>
		<tr>
			<td>Example:</td>
			<td>slow-ramp-time=300;min-up-members=1</td>
		</tr>
	</tbody>
</table>

### Additional Syntaxes

Various fields use specific syntaxes to expose functionality.  If applicable, the format of these fields are documented in the specific entry for the field/table/column in question in the [Presentation Layer Reference](/presoref/).
