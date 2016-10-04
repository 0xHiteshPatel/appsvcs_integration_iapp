import json
import sys
import os
import glob

from pprint import pprint

html_escape_table = {
    "&": "&amp;",
    '"': "&quot;",
    "'": "&apos;",
    ">": "&gt;",
    "<": "&lt;",
    }

text = []
def find_test_files (string):
	ret = []
	test_templates = sorted(glob.glob(os.path.join("test","test_*.json")))
	for template in test_templates:
		for line in open(template):
 			if string in line:
   				ret.append(template.split(os.path.sep)[-1])
   				break

   	return ret

def html_escape(text):
    """Produce entities within text."""
    return "".join(html_escape_table.get(c,c) for c in text)

def stringify_modes (modes):
	ret = []
	for mode in modes:
		ret.append(mode_map["%s" % mode])
	return ", ".join(ret)

def process_field (field, search):
	reqstr = "No"
	defstr = ""
	
	if ('required' in field.keys() and field["required"] == True):
		reqstr = "Yes"

	if 'default' in field.keys():
		defstr = "%s" % field["default"]

	if 'help' in field.keys():
		tempstr = html_escape(field["help"])
	else:
		tempstr = html_escape(field["description"])

	print "<tr><td>Description:</td><td>%s</td></tr>" % tempstr
	print "<tr><td>Modes:</td><td>%s</td></tr>" % stringify_modes(field["modes"])
	print "<tr><td>Type:</td><td>%s</td></tr>" % field["type"]
	print "<tr><td>Default:</td><td>%s</td></tr>" % defstr

	if field["type"] == "choice":
		choices = "-".join(field["choices"])
		print "<tr><td>Choices:</td><td>%s</td></tr>" % ", ".join(field["choices"])

	print "<tr><td>Min. Version:</td><td>%s</td></tr>" % field["minver"]
	
	if len(search) > 0:
		print "<tr><td>Examples:</td><td>"
		print "<a href=\"https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json\">include_defaults.json</a><br>" 
		for template in find_test_files(search):
			print "<a href=\"https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/%s\">%s</a><br>" % (template,template)
		print "</td></tr>"	

	return
	
if len(sys.argv) != 2:
	print "Usage: %s <JSON file>" % sys.argv[0]
	quit(0)

with open(sys.argv[1]) as data_file:    
    data = json.load(data_file)

validators = {
	'ipaddr':'IpAddress',
	'port':'PortNumber',
	'number':'NonNegativeNumber',
	'allnumber':'Number',
	'iporfqdn':'IpOrFqdn',
	'fqdn':'FQDN'
}

mode_map = data["modes"]

for section in data["sections"]:
	if section["name"] == "intro":
		continue

	print "# Section: %s" % section["name"]
	
	for field in section["fields"]:
		if field["type"] != "table":
			print "<table><tr><td colspan=2>"
			print "## Field: %s__%s" % (section["name"], field["name"])
			print "</td></tr>"
			process_field(field, "%s__%s" % (section["name"], field["name"]))
			print "</table>"
		else:
			print "<table><tr><td colspan=2>"
			print "## Table: %s__%s<br>\n" % (section["name"], field["name"])
			print "<i>%s</i>" % (html_escape(field["help"]))
			print "</td></tr><tr><td>"
			print "<table><thead><tr><th>Column</th><th>Details</th></tr></thead>"

			for table_field in field["fields"]:
				print "<tr><td>\n###%s\n</td><td><table>\n" % table_field["name"]
				process_field(table_field, "")
				print "</table></td></tr>"
			print "<tr><td>Examples:</td><td>"
			print "<a href=\"https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/include_defaults.json\">include_defaults.json</a><br>" 
			for template in find_test_files("%s__%s" % (section["name"], field["name"])):
				print "<a href=\"https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/test/%s\">%s</a><br>" % (template,template)
			print "</td></tr>"
			print "</table></td></tr></table>"
