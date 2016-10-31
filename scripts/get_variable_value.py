#!/usr/bin/python
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# get_variable_value.py -- Find the value of a variable in a JSON template 
#                          used by deploy_iapp_bigip.py
# Documentation: see README.get_variable_value.py
import requests

try:
	requests.packages.urllib3.disable_warnings()
except:
	pass

import json
import argparse
import os
import sys
import pprint
import time
pp = pprint.PrettyPrinter(indent=2)

'''
Recursively process a JSON object.
Parent files are specified by the 'parent' key in the JSON object
Values in the 'child' file take precedence
'''
def process_file(parent, child, indent):
	debug("[info] %sprocessing parent file \"%s\"" % (indent, parent))

	try:
		parent_file = open(parent)
	except IOError as error:
		print "[error] Open of parent JSON template \"%s\" failed: %s" % (parent, error)
		sys.exit(1)

	try:
		parentdict = json.load(parent_file)
	except (ValueError, NameError) as error:
		print "[error] JSON format error in template \"%s\": %s" % (parent, error)
		sys.exit(1)

	parent_file.close()

	# Recursion happens here
	if 'parent' in parentdict:
		parentdict = process_file(parentdict["parent"], parentdict, indent + " ")

	# Process the child objects 'strings' and 'tables' keys.
	child_strings = {}
	child_tables = {}
	debug("[%s] starting merge" % (parent))
	if 'strings' in child:
		for string in child["strings"]:
			k, v = string.popitem()
			debug("[%s] child: %s" % (parent, k))
			child_strings[k] = v

	if 'tables' in child:
		i = 0
		for table in child["tables"]:
			debug("[%s] iapptable %s" % (parent, table["name"]))
			child_tables[table["name"]] = i
			i += 1

	# Merge with the parent dictionary giving precedence to the child's values
	if 'strings' in parentdict:
		for string in parentdict["strings"]:
			k, v = string.popitem()
			if k in child_strings.keys():
				string[k] = child_strings[k]
				debug("[%s] OVERRIDE: %s: %s" % (parent, k, string[k]))
			else:
				string[k] = v

	if 'tables' in parentdict:
		i = 0
		for table in parentdict["tables"]:
			if table["name"] in child_tables.keys():
				debug("[%s] OVERRIDE TABLE: %s" % (parent, table["name"]))
				parentdict["tables"][i] = child["tables"][child_tables[table["name"]]]
			i += 1

	if 'lists' in parentdict:
		i = 0
		for alist in parentdict["lists"]:
			if alist["name"] in child_tables.keys():
				debug("[%s] OVERRIDE LIST: %s" % (parent, alist["name"]))
				parentdict["lists"][i] = child["lists"][child_tables[alist["name"]]]
			i += 1

	# Inherit any other top level keys
	for topitem in child.keys():
		debug("topitem=%s" % topitem)
		if not topitem in ["tables", "strings"]:
			parentdict[topitem] = child[topitem]

	return parentdict

def debug(msg):
	if args.debug:
		print "DEBUG: %s" % (msg)

# Setup and process arguments
parser = argparse.ArgumentParser(description='Script to extract data from a JSON template')
parser.add_argument("-D", "--debug", help="Enable debug output", action="store_true")
parser.add_argument("variable",      help="The variable to find.  Using the <var>.<column> format will search a column in a table")
parser.add_argument("json_template", help="The JSON iApp definition file")
args = parser.parse_args()

debug("[info] processing template \"%s\"" % (args.json_template))

try:
	iapp_file = open(args.json_template)
except IOError as error:
	print "[error] Open of JSON template \"%s\" failed: %s" % (args.json_template, error)
	sys.exit(1)

try:
	iapp = json.load(iapp_file)
except (ValueError, NameError) as error:
	print "[error] JSON format error in template \"%s\": %s" % (args.json_template, error)
	sys.exit(1)

iapp_file.close()

if 'parent' in iapp:
	final = process_file(iapp["parent"], iapp, " ")
else:
	final = iapp

debug("final=%s" % pp.pformat(final))

if "." in args.variable:
	(table, column) = args.variable.split('.', 2)
	for d in final["tables"]:
		if d["name"] == table:
			colidx = d["columnNames"].index(column)
			for row in d["rows"]:
				print "%s" % row["row"][colidx]
			sys.exit(0)
else:	
	for d in final["strings"]:
		(k, v) = d.popitem()
		if k == args.variable:
			print "%s" % v
			sys.exit(0)

	if args.variable in final.keys():
		print "%s" % final[args.variable]
		sys.exit(0)

sys.exit(1)