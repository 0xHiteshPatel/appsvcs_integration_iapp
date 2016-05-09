import json
import sys
import glob
import os
import argparse

from pprint import pprint

text = []
def process_field (field, section, tab):
	reqstr = ""
	defstr = ""
	dispstr = " display \"large\" "
	tclstr = ""
	optstr = ""
	retstr = ""

	if ('uivisible' not in field.keys()):
		field["uivisible"] = True

	if ('required' in field.keys() and field["required"] == True):
		reqstr = " required"

	if 'default' in field.keys():
		defstr = " default \"%s\"" % field["default"]

	if 'display' in field.keys():
		dispstr = " display \"%s\"" % field["display"]

	if 'create_list' in field.keys():
		tclstr = """ tcl {
		tmsh::cd /
		set results ""
	    set cmds [list %s]
	    foreach cmd $cmds {
	      set objs [list]
	      set objs_status [catch {tmsh::get_config $cmd recursive} objs]
	      if { $objs_status == 1 } { continue }
	      foreach obj $objs {
	      	set name [string map {"\\\"" ""} [tmsh::get_name $obj]]
	      	if { $name ne "" } {
		        append results \"/$name\"
		        append results \"\\n\"
		    }
	      }  
	    }
	    return $results
	}
		""" % ' '.join(field["create_list"])
	if field["type"] == "text":
		text.append("\t%s.%s \"%s\" \"%s\"" % (section, field["name"], field["description"], field["text"])) 
	else:
		text.append("\t%s.%s \"%s\"" % (section, field["name"], field["description"]))

	if field["type"] == "text":
		retstr += "\t%smessage %s" % (tab, field["name"])
	elif field["type"] == "boolean":
		if 'default' in field.keys():
			defstr = " default \"%s\"" % field["default"]
			if field["default"] == True:
				field["default"] = "enabled" 
			else:
				field["default"] = "disabled"
			defstr = " default \"%s\"" % field["default"]
				
		retstr += "\t%schoice %s%s%s {\n\t\t%s\"enabled\",\n\t\t%s\"disabled\"\n\t%s}" % (tab, field["name"], defstr, reqstr, tab, tab, tab)
	elif field["type"] in validators.keys():
		retstr += "\t%sstring %s%s%s validator \"%s\"%s" % (tab, field["name"], reqstr, dispstr, validators[field["type"]], defstr)
	elif field["type"] == "string":
		retstr += "\t%sstring %s%s%s%s" % (tab, field["name"], reqstr, dispstr, defstr)
	elif field["type"] == "choice":
		retstr += "\t%schoice %s%s%s%s {\n" % (tab, field["name"], reqstr, dispstr, defstr)
		templist = field["choices"]
		for choice in templist[:-1]:
  			retstr += "\t\t%s\"%s\",\n" % (tab, choice)
		else:
  			retstr += "\t\t%s\"%s\"\n" % (tab, templist[-1])
		retstr += "\t%s}" % tab
	elif field["type"] == "editchoice":
		if len(tclstr) > 0:
			retstr += "\t%seditchoice %s%s%s%s%s" % (tab, field["name"], reqstr, dispstr, defstr, tclstr)
		else:
			retstr += "\t%seditchoice %s%s%s%s {\n" % (tab, field["name"], reqstr, dispstr, defstr)
			templist = field["choices"]
			for choice in templist[:-1]:
	  			retstr += "\t\t%s\"%s\",\n" % (tab, choice)
			else:
	  			retstr += "\t\t%s\"%s\"\n" % (tab, templist[-1])
			retstr += "\t%s}" % tab
	elif field["type"] == "dynamic_filelist":
		if os.sep != "/":
			field["glob"] = field["glob"].replace("/","\\")
			
		files = glob.glob("%s/%s" % (args.bundledir, field["glob"]))
		filenames = ["disabled"]
		for filename in files:
			name_parts = filename.split(os.sep)
			file_parts = name_parts[-1].split('.')
			filenames.append(file_parts[0])

		retstr += "\t%schoice %s%s%s%s {" % (tab, field["name"], reqstr, dispstr, defstr)

		if len(files) > 0:
			for choice in filenames[:-1]:
	  			retstr += "\t\t%s\"%s%s\"," % (tab, field["globprefix"], choice)
			else:
	  			retstr += "\t\t%s\"%s%s\"" % (tab, field["globprefix"], filenames[-1])
	  	else:
	  		retstr += "\t\t%s\"disabled\"" % tab

		retstr += "\t%s}" % tab
	elif field["type"] == "dynamic_filelist_multi":
		types = {}		
		globs = field["glob"]
		filenames = []
	
		for	globitem in globs:
			if os.sep != "/":
				globitem["path"] = globitem["path"].replace("/","\\")

			files = glob.glob("%s%s%s" % (args.bundledir, os.sep, globitem["path"]))
			for filename in files:
				name_parts = filename.split(os.sep)
				file_parts = name_parts[-1].split('.')
				filenames.append(file_parts[0])
				types[file_parts[0]] = globitem["prefix"]
		retstr += "\t%smultichoice %s%s%s%s {" % (tab, field["name"], reqstr, dispstr, defstr)
		if len(filenames) > 0:
			for choice in filenames[:-1]:
	  			retstr += "\t\t%s\"%s%s\"," % (tab, types.get('%s' % choice), choice)
			else:
	  			retstr += "\t\t%s\"%s%s\"" % (tab, types.get('%s' % filenames[-1]), filenames[-1])
	  	else:
	  		retstr += "\t\t%s\"** no bundled items **\"" % tab
		retstr += "\t%s}" % tab
	else:
		print "Invalid type: %s field=%s section=%s" % (field["type"], field["name"], section["name"])
		sys.exit()

	if field['uivisible'] == True:
		print retstr
	else:
		print "optional (\"dont\" == \"show\") {\n %s \n}" % retstr

	return


parser = argparse.ArgumentParser(description='Script to create the appsvcs_integration_iapp BIG-IP iApp APL code')
parser.add_argument("jsonfile", help="The input JSON file for the build")
parser.add_argument("-b", "--bundledir", help="The directory to use for bundled items", default="bundled")

args = parser.parse_args()

with open(args.jsonfile) as data_file:    
    data = json.load(data_file)

#pprint(data)


validators = {
	'ipaddr':'IpAddress',
	'port':'PortNumber',
	'number':'NonNegativeNumber',
	'allnumber':'Number',
	'iporfqdn':'IpOrFqdn',
	'fqdn':'FQDN'
}

for section in data["sections"]:
	#pprint(section["name"])
	print "section %s {" % section["name"]
	text.append("\t%s \"%s\"" % (section["name"], section["description"])) 
	for field in section["fields"]:
		if field["type"] != "table":
			process_field(field, section["name"], "")
		else:
			text.append("\t%s.%s \"%s\"" % (section["name"], field["name"], field["description"]))

			if ('uivisible' in field.keys() and field["uivisible"] == False):
				print "optional (\"dont\" == \"show\") {\ntable %s {" % field["name"]
			else:
				print "\ttable %s {" % field["name"]

			for table_field in field["fields"]:
				process_field(table_field, "%s.%s" % (section["name"], field["name"]), "\t")

			if ('uivisible' in field.keys() and field["uivisible"] == False):
				print "\t}\n}"
			else:
				print "\t}"

	print "}"
	print ""
	text.append("")

print ""
print "text {"

for descr in text:
	print "%s" % descr	

print "}"
