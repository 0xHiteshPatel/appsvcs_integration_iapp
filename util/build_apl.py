import json
import sys
import glob

from pprint import pprint

text = []
def process_field (field, section, tab):
	reqstr = ""
	defstr = ""
	dispstr = " display \"large\" "

	if ('required' in field.keys() and field["required"] == True):
		reqstr = " required"

	if 'default' in field.keys():
		defstr = " default \"%s\"" % field["default"]

	if 'display' in field.keys():
		dispstr = " display \"%s\"" % field["display"]

	if field["type"] == "text":
		text.append("\t%s.%s \"%s\" \"%s\"" % (section, field["name"], field["description"], field["text"])) 
	else:
		text.append("\t%s.%s \"%s\"" % (section, field["name"], field["description"]))

	if field["type"] == "text":
		print "\t%smessage %s" % (tab, field["name"])
	elif field["type"] == "boolean":
		if 'default' in field.keys():
			defstr = " default \"%s\"" % field["default"]
			if field["default"] == True:
				field["default"] = "enabled" 
			else:
				field["default"] = "disabled"
			defstr = " default \"%s\"" % field["default"]
				
		print "\t%schoice %s%s%s {\n\t\t%s\"enabled\",\n\t\t%s\"disabled\"\n\t%s}" % (tab, field["name"], defstr, reqstr, tab, tab, tab)
	elif field["type"] in validators.keys():
		print "\t%sstring %s%s%s validator \"%s\"%s" % (tab, field["name"], reqstr, dispstr, validators[field["type"]], defstr)
	elif field["type"] == "string":
		print "\t%sstring %s%s%s%s" % (tab, field["name"], reqstr, dispstr, defstr)
	elif field["type"] == "choice":
		print "\t%schoice %s%s%s%s {" % (tab, field["name"], reqstr, dispstr, defstr)
		templist = field["choices"]
		for choice in templist[:-1]:
  			print "\t\t%s\"%s\"," % (tab, choice)
		else:
  			print "\t\t%s\"%s\"" % (tab, templist[-1])
		print "\t%s}" % tab
	elif field["type"] == "dynamic_filelist":
		files = glob.glob(field["glob"])
		filenames = ["disabled"]
		for filename in files:
			name_parts = filename.split('/')
			file_parts = name_parts[1].split('.')
			filenames.append(file_parts[0])

		print "\t%schoice %s%s%s%s {" % (tab, field["name"], reqstr, dispstr, defstr)
		for choice in filenames[:-1]:
  			print "\t\t%s\"%s\"," % (tab, choice)
		else:
  			print "\t\t%s\"%s\"" % (tab, filenames[-1])
		print "\t%s}" % tab
	else:
		print "Invalid type: %s field=%s section=%s" % (field["type"], field["name"], section["name"])
		sys.exit()

	return

if len(sys.argv) != 2:
	print "Usage: %s <JSON file>" % sys.argv[0]
	quit(0)

with open(sys.argv[1]) as data_file:    
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
			print "\ttable %s {" % field["name"]
			for table_field in field["fields"]:
				process_field(table_field, "%s.%s" % (section["name"], field["name"]), "\t")
			print "\t}"

	print "}"
	print ""
	text.append("")

print ""
print "text {"

for descr in text:
	print "%s" % descr	

print "}"
