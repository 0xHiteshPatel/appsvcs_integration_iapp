Logging & Debugging
===================

Log File
--------
The iApp/iCall framework on TMOS logs to the file **/var/tmp/scriptd.out** on the BIG-IP system.  It is recommended that this log be reviewed in the case a deployment fails.

Log Levels
----------

The App Services iApp template implements a granular logging system that can be controlled by:

- An integer specified in the `iapp__logLevel <presoref/presoref.html#field-iapp-loglevel>`_ field.  
- Setting the scriptd log-level in TMOS to 'debug' (useful if inputs can't be modified)
	- Silently sets ``iapp__logLevel`` to '10'
	- TMSH Command: ``tmsh modify sys scriptd log-level debug``

Log levels are specified as an integer in the range 0-10 with numerically higher log levels including all messages from lower levels:

.. csv-table::
	:header: "Log Level","Description"
	:widths: 10 90

	"0","start/stop messages only"
	"1","all TMSH commands"
	"2","inputs &amp; global state information"
	"3","unused"
	"4","unused"
	"5","object creation details"
	"6","custom extensions"
	"7","execution debug"
	"8","unused"
	"9","cached state debug"
	"10","utility function debug"

For troubleshooting purposes it is required that a log with a log level set to '10' be provided.  
