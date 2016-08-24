import json
import sys

from pprint import pprint

text = []
def process_field (field, section, tab):
	reqstr = "No"
	defstr = ""
	
	if ('required' in field.keys() and field["required"] == True):
		reqstr = "Yes"

	if 'default' in field.keys():
		defstr = "%s" % field["default"]

	#print "  <td>%s.%s</td>" % (section, field["name"])
	print "  <td>%s</td>" % (field["description"])
	print "  <td>$%s__%s</td>" % (section, field["name"])
	if 'help' in field.keys():
		tempstr = field["help"]
		tempstr = tempstr.replace("&", "&amp;")
		tempstr = tempstr.replace("<", "&lt;")
		tempstr = tempstr.replace(">", "&gt;")
		print "  <td>%s</td>" % tempstr
	else:
		print "  <td><pre>%s</pre></td>" % field["description"]
	print "  <td>%s</td>" % field["modes"]

	print "  <td>%s</td>" % field["type"]
	print "  <td>%s</td>" % defstr

	if field["type"] == "choice":
		choices = "-".join(field["choices"])
		print "  <td>%s</td>" % ",\n".join(field["choices"])
 	else:
		print "  <td></td>"

	print "  <td>%s</td>" % field["minver"]

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

print "<table border=1 width=\"100%\">"
print " <tr><th colspan=8><b>Generated from JSON v%s_%s</b></th></tr>" % (data["tmpl_majorversion"], data["pres_revision"])
print " <tr>"
print "  <th>Display Name</th>"
print "  <th>Var Name</th>"
print "  <th>Description</th>"
print "  <th>Supported Modes</th>"
print "  <th>Type</th>"
print "  <th>Default Value</th>"
print "  <th>Options</th>"
print "  <th>Min. Version</th>"
print " </tr>"
for section in data["sections"]:
	#print "name=%s" % section["name"]
	if section["name"] == "intro":
		continue

	print "<tr><td colspan=7><b>Section: %s</b></td></tr>" % section["name"]
	for field in section["fields"]:
		if field["type"] != "table":
			print "<tr>"
			process_field(field, section["name"], "")
			print "</tr>"
		else:
			print "<tr><td colspan=7><b>Table: %s</b></td></tr>" % field["name"]
			#print "\ttable %s {" % field["name"]
			for table_field in field["fields"]:
				print "<tr>"
				process_field(table_field, "%s.%s" % (section["name"], field["name"]), "")
				print "</tr>"
		
print "</table>"
