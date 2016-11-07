Advanced Options & Create String Syntax
---------------------------------------
The BIG-IP platform allows very fine-grained control of options for L4-7 
protocol profiles (ex: TCP, UDP, HTTP, Compression, etc.) and options for 
Virtual Servers and Pools.  To expose the ability to customize these options 
we use a syntax that can be expressed using the APL String field.  The 
create syntax can be used with specific Profiles, while the option syntax is 
used with the Virtual Server and Pool objects.  This syntax is defined as a 
string in the following format:

Create String
^^^^^^^^^^^^^

.. list-table::
	:widths: 10 90
	:header-rows: 0
	:stub-columns: 1

	* - Description
	  - A custom TMOS profile will be created with the specified options.  
	    Options are validated at run-time with the underlying TMOS version.  Use 
	    of this format allows exposure of fine-grained options without exposing 
	    each option as a field in the APL Presentation Layer.  The following 
	    profiles support the this syntax:

			- Client/Server-side L4 Protocol (tcp, udp)
			- Server SSL
			- Client SSL
			- HTTP
			- OneConnect
			- Compression
			- Request Logging
			- Persistence (Default & Fallback)

	* - Syntax
	  - ``create:type=<profile type>;<tmsh_option_name>=<tmsh_option_value>[;<tmsh_option_name>=<tmsh_option_value>]``
	* - Example
	  - ``create:type=tcp;nagle=disabled;proxy-low-buffer=10000;defaults-from=/Common/tcp``

Advanced Options String
^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
	:widths: 10 90
	:header-rows: 0
	:stub-columns: 1

	* - Description
	  - The object will be created with the specified TMOS options.  Options are
	    validated at run-time with the underlying TMOS version.  Use of this 
	    format allows exposure of fine-grained options without exposing each 
	    option as a field in the APL Presentation Layer.  The following object 
	    types support the this syntax:

	  		- Virtual Servers
			- Pools
			- Auto-create Client-SSL Profiles

	* - Syntax
	  - ``<tmsh_option_name>=<tmsh_option_value>[;<tmsh_option_name>=<tmsh_option_name>]``
	* - Example
	  - ``slow-ramp-time=300;min-up-members=1``

