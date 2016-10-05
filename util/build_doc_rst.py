import json
import sys
import os
import glob

from pprint import pprint

giturl = "https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/tree/develop/"

text = []
def find_test_files (string):
	ret = ["include_defaults.json"]
	test_templates = sorted(glob.glob(os.path.join("test","test_*.json")))
	for template in test_templates:
		for line in open(template):
 			if string in line:
   				ret.append(template.split(os.path.sep)[-1])
   				break

   	return ret

def print_rst_header(string, char):
	return("%s\n%s\n\n" % (string, (char * len(string))))

def print_rst_links(list, path):
	ret = []
	for f in list:
		ret.append('`%s <%s%s%s>`__' % (f, giturl, path, f))

	return ret

def stringify_modes (modes):
	ret = []
	for mode in modes:
		ret.append(mode_map["%s" % mode])
	return ", ".join(ret)

def process_field (field, search, fh, mode=0):
	reqstr = "No"
	defstr = ""
	
	if ('required' in field.keys() and field["required"] == True):
		reqstr = "Yes"

	if 'default' in field.keys():
		defstr = "%s" % field["default"]

	if 'help' in field.keys():
		tempstr = field["help"]
	else:
		tempstr = field["description"]

	if(mode):
		fh.write(':Description: %s\n' % tempstr)
		fh.write(':Modes: %s\n' % stringify_modes(field["modes"]))
		fh.write(':Type: %s\n' % field["type"])
		fh.write(':Default: %s\n' % defstr)
		fh.write(':Min. Version: %s\n' % field["minver"])
	else:
		fh.write('\t"Description","%s"\n' % tempstr)
		fh.write('\t"Modes","%s"\n' % stringify_modes(field["modes"]))
		fh.write('\t"Type","%s"\n' % field["type"])
		fh.write('\t"Default","%s"\n' % defstr)
		fh.write('\t"Min. Version","%s"\n' % field["minver"])


	if field["type"] == "choice":
		choices = "-".join(field["choices"])
		if (mode):
			fh.write(':Choices: %s\n' % ", ".join(field["choices"]))
		else:
			fh.write('\t"Choices","%s"\n' % ", ".join(field["choices"]))

	if len(search) > 0:
		test_files = find_test_files(search)
		if (mode):
			fh.write(':Examples: %s\n' % " | ".join(print_rst_links(test_files, "test/")))
		else:
			fh.write('\t"Examples","%s"\n' % " | ".join(print_rst_links(test_files, "test/")))

	return
	
if len(sys.argv) != 3:
	print "Usage: %s <JSON file> <output directory" % sys.argv[0]
	quit(0)

with open(sys.argv[1]) as data_file:    
    data = json.load(data_file)


rst = open("%s%spresoref.rst" % (sys.argv[2], os.sep), 'w')

validators = {
	'ipaddr':'IpAddress',
	'port':'PortNumber',
	'number':'NonNegativeNumber',
	'allnumber':'Number',
	'iporfqdn':'IpOrFqdn',
	'fqdn':'FQDN'
}

mode_map = data["modes"]

rst.write("Presentation Layer Reference\n")
rst.write("============================\n\n")

for section in data["sections"]:
	if section["name"] == "intro":
		continue

	rst.write(print_rst_header("Section: %s" % section["name"], '-'))

	for field in section["fields"]:
		if field["type"] != "table":
			# print "<table><tr><td colspan=2>"
			# print "## Field: %s__%s" % (section["name"], field["name"])
			# print "</td></tr>"
			rst.write(".. _preso-%s-%s:\n\n" % (section["name"], field["name"]))
			rst.write(print_rst_header("Field: %s__%s" % (section["name"], field["name"]), '^'))
			rst.write(".. csv-table::\n")
			rst.write("\t:stub-columns: 1\n")
			rst.write("\t:widths: 10 80\n\n")
			process_field(field, "%s__%s" % (section["name"], field["name"]), rst, 0)
			#print "</table>"
			rst.write("\n")
		else:
			table_name = "%s__%s" % (section["name"], field["name"])
			rst.write(".. _preso-%s-%s:\n\n" % (section["name"], field["name"]))
			rst.write(print_rst_header("Table: %s__%s" % (section["name"], field["name"]), '^'))
			rst.write("%s\n\n" % field["help"])
			rst.write(".. csv-table::\n")
			rst.write('\t:header: "Column","Details"\n')
			rst.write("\t:stub-columns: 1\n")
			rst.write("\t:widths: 10 80\n\n")
			
			for table_field in field["fields"]:
				column_filename = "%s_%s.rst" % (table_name, table_field["name"]) 
				column = open("%s%s%s" % (sys.argv[2], os.sep, column_filename), 'w')
				rst.write('\t"%s",.. include:: %s' % (table_field["name"], column_filename))
				process_field(table_field, "", column, 1)
				rst.write('\n')

			rst.write('\t"Examples",')
			test_files = find_test_files("%s__%s" % (section["name"], field["name"]))
			rst.write('"%s"\n\n' % " | ".join(print_rst_links(test_files, "test/")))
