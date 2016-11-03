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
# delete_iapp_bigip.py -- Delete an iApp deployment from a BIG-IP system using the iControl-REST API
# Documentation: see README.delete_iapp_bigip
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

def yes_no_question(question):
	no = set(['no','n'])
	yes = set(['yes','y', 'ye', ''])
	while True:
		print "%s? (yes/no):" % (question),
		answer = raw_input().lower()
		if answer in no:
		   return False
		elif answer in yes:
		   return True
		else:
		   sys.stdout.write("Please respond with 'yes' or 'no'")

def debug(msg):
	if args.debug:
		print "DEBUG: %s" % (msg)

# Setup and process arguments
parser = argparse.ArgumentParser(description='Script to delete an iApp deployment from a BIG-IP device')
parser.add_argument("host",             help="The IP/Hostname of the BIG-IP device")
parser.add_argument("iapp_name",        help="The full path to iApp name to delete")
parser.add_argument("-u", "--username", help="The BIG-IP username", default="admin")
parser.add_argument("-p", "--password", help="The BIG-IP password", default="admin")
parser.add_argument("-d", "--dontsave", help="Don't automatically save the config", action="store_true")
parser.add_argument("-D", "--debug",    help="Enable debug output", action="store_true")
parser.add_argument("-P", "--partition",help="The BIG-IP partition to use", default="Common")
parser.add_argument("-n", "--noprompt", help="Do not prompt to confirm deletion", action="store_true")
args = parser.parse_args()


# Set our REST urls
iapp_url       = "https://%s/mgmt/tm/sys/application/service" % (args.host)
save_url       = "https://%s/mgmt/tm/sys/config" % (args.host)
iapp_exist_url = "%s/~%s~%s.app~%s" % (iapp_url, args.partition, args.iapp_name, args.iapp_name)
full_name      = "/%s/%s" % (args.partition, args.iapp_name)

debug("iapp_exist_url=%s" % (iapp_exist_url))
# Create request session, set credentials, allow self-signed SSL cert
s = requests.session()
s.auth = (args.username, args.password)
s.verify = False

resp = s.get(iapp_exist_url)

if resp.status_code == 401:
	print "[error] Authentication to %s failed" % (args.host)
	sys.exit(1)

if resp.status_code == 404:
	print "[error] iApp deployment named \"%s\" does not exist on %s" % (full_name, args.host)
	sys.exit(1)

if resp.status_code == 200 and not args.noprompt:
	if not yes_no_question("Are you sure you want to delete iApp deployment named \"%s\" on BIG-IP \"%s\"" % (full_name, args.host)):
		sys.exit(1)

resp = s.delete(iapp_exist_url)
if resp.status_code != requests.codes.ok:
	print "[error] Delete failed: %s" % (resp.json())
	sys.exit(1)
else:
	print "[success] iApp deployment \"%s\" deleted on BIG-IP \"%s\"" % (full_name, args.host)

# Save the config (unless -d option was specified)
save_payload = { "command":"save" }
if not args.dontsave:
	resp = s.post(save_url, data=json.dumps(save_payload))
	if resp.status_code != requests.codes.ok:
		print "[error] save failed: %s" % (resp.json())
		sys.exit(1)
	else:
		print "[success] Config saved"

sys.exit(0)
