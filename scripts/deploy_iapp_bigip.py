#!/usr/bin/python
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# deploy_iapp_bigip.py -- Deploy an iApp to a BIG-IP system using the iControl-REST API
# Documentation: see README.deploy_iapp_bigip
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
pp = pprint.PrettyPrinter(indent=2)

'''
Recursively process a JSON object.  
Parent files are specified by the 'parent' key in the JSON object
Values in the 'child' file take precedence
'''
def process_file(parent, child, indent):
	print "[info] %sprocessing parent file \"%s\"" % (indent, parent)
	
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
parser = argparse.ArgumentParser(description='Script to deploy an iApp to a BIG-IP device')
parser.add_argument("host",             help="The IP/Hostname of the BIG-IP device")
parser.add_argument("json_template",    help="The JSON iApp definition file")
parser.add_argument("-u", "--username", help="The BIG-IP username")
parser.add_argument("-p", "--password", help="The BIG-IP password")
parser.add_argument("-d", "--dontsave", help="Don't automatically save the config", action="store_true")
parser.add_argument("-r", "--redeploy", help="Redeploy an existing iApp", action="store_true")
parser.add_argument("-D", "--debug",    help="Enable debug output", action="store_true")
args = parser.parse_args()

print "[info] processing template \"%s\"" % (args.json_template)

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

if args.username:
	if 'username' in final:
		print "[info] Username found in JSON but specified on CLI, using CLI value"
	final["username"] = args.username
	
if args.password:
	if 'password' in final:
		print "[info] Password found in JSON but specified on CLI, using CLI value"
	final["password"] = args.password
	
# Required fields 
required = ['name','template_name','partition','username','password','inheritedDevicegroup','inheritedTrafficGroup','deviceGroup','trafficGroup']


for item in required:
	if not item in final:
		print "[error] The required key \"%s\" was not found in the JSON template (or it's parent(s))" % (item)
		sys.exit(1)

debug("final=%s" % pp.pformat(final))

# Set our REST urls
iapp_url       = "https://%s/mgmt/tm/sys/application/service" % (args.host)
save_url       = "https://%s/mgmt/tm/sys/config" % (args.host)
template_url   = "https://%s/mgmt/tm/sys/application/template?$select=name" % (args.host)
iapp_exist_url = "%s/~%s~%s.app~%s" % (iapp_url, final["partition"], final["name"], final["name"])

# Create request session, set credentials, allow self-signed SSL cert
s = requests.session()
s.auth = (final["username"], final["password"])
s.verify = False
 
resp = s.get(template_url)

if resp.status_code == 401:
	print "[error] Authentication to %s failed" % (args.host)
	sys.exit(1)

templates = resp.json();

tmpllist = []
for item in templates["items"]:
	if item["name"].startswith("appsvcs_integration_"):
		debug("[template_list] found template named %s" % (item["name"]))
		tmpllist.append(item["name"])

debug("[template_select] specified=%s" % (final["template_name"]))
if final["template_name"] == "latest":
	tmpllist.sort()
	final["template_name"] = tmpllist.pop()
	debug("[template_select] selected=%s" % (final["template_name"]))
else:
	if not final["template_name"] in tmpllist:
		print "[error] iApp template \"%s\" is not installed on BIG-IP host %s" % (final["template_name"], args.host)
		sys.exit(1)

deploy_payload = {
    "inheritedDevicegroup": final["inheritedDevicegroup"],
    "inheritedTrafficGroup": final["inheritedTrafficGroup"],
    "deviceGroup": final["deviceGroup"],
    "trafficGroup": final["trafficGroup"],
    "template": final["template_name"],
    "partition": final["partition"],
    "name": final["name"],
    "variables": [],
    "tables": [],
}

for string in final["strings"]:
	k, v = string.popitem()
	deploy_payload["variables"].append({"name":k, "value":v})

deploy_payload["tables"] = final["tables"]

debug("deploy_payload=%s" % pp.pformat(deploy_payload))

# Check to see if the template with the name specified in the arguments exists on the BIG-IP device
debug("exist_url=%s" % iapp_exist_url)
resp = s.get(iapp_exist_url)

# The template exists and the -o argument (overwrite) was not specified.  Print error and exit
if resp.status_code == 200 and not args.redeploy:
	print "[error] An iApp deployment named \"%s\" already exists on BIG-IP \"%s\".  To redeploy please specify the '-r' flag" % (final["name"], args.host)
	sys.exit(1)

# iApp deployment does not already exist, create it
if resp.status_code == 404:
 	# Send the REST call to create the template and print outcome
	resp = s.post(iapp_url, data=json.dumps(deploy_payload))
	debug("deploy resp=%s" % (pp.pformat(json.loads(resp.text))))
	if resp.status_code != requests.codes.ok:
		print "[error] iApp deployment failed: %s" % (resp.json())
		sys.exit(1)
	print "[success] iApp \"%s\" deployed on BIG-IP \"%s\"" % (final["name"], args.host)
# Template exists and args.redeploy (-r) is TRUE so we will modify the existing template
else:
	del deploy_payload["inheritedDevicegroup"]
	del deploy_payload["inheritedTrafficGroup"]
	del deploy_payload["deviceGroup"]
	del deploy_payload["trafficGroup"]
	deploy_payload["execute-action"] = "definition"

	resp = s.put(iapp_exist_url, data=json.dumps(deploy_payload))
	debug("redeploy resp=%s" % (pp.pformat(json.loads(resp.text))))
	if resp.status_code != requests.codes.ok:
		print "[error] iApp re-deployment failed: %s" % (resp.json())
		sys.exit(1)

	print "[success] iApp \"%s\" re-deployed on BIG-IP \"%s\"" % (final["name"], args.host)

# Save the config (unless -d option was specified)
save_payload = { "command":"save" }
if not args.dontsave:
	resp = s.post(save_url, data=json.dumps(save_payload))
	if resp.status_code != requests.codes.ok:
		print "[error] save failed: %s" % (resp.json())
		sys.exit(1)
	else:
		print "[success] Config saved"
