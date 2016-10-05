.. toctree::
	:hidden:

.. csv-table::
	:widths: 20 80

	"Description","The pool monitor(s) and minimum number of monitors that have to pass can be specified using a string of the format '[<monitor index>[,<monitor index>][;<minimum # healthy>]]'.  For example '0,1,2;2' would associate the monitors with indexes 0, 1 and 2 and require at least 2 pass.  If no value is specified no monitor is associated with the pool"
	"Modes","Standalone, iWorkflow, Cisco APIC, VMware NSX"
	"Type","string"
	"Default",""
	"Min. Version","2.0_001"
