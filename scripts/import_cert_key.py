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

import requests
try:
	requests.packages.urllib3.disable_warnings()
except:
	pass

import requests
import json
import argparse
import os
import sys
import uuid

def check_auth(resp):
	# Check to see if authentication succeeded
	if resp.status_code == 401:
		print "[error] Authentication failed: %s" % (resp)
		sys.exit(1)

def search_dict(obj, partition, name):
	for item in obj["items"]:
		if 'partition' in item and 'name' in item:
			if item["partition"] == partition and item["name"] == name:
				return True
	return False

def upload_file(filename, name):
	upload_url      = "https://%s/mgmt/shared/file-transfer/uploads/%s" % (args.host, name)

	# Read in the file
	with open(filename) as fh:
		data = fh.read()

	# Get the length of the file for the Content-Range header
	length = len(data) - 1

	# Upload the file
	headers = { "Content-Range":"0-%d/%d" % (length, length) }
	resp = s.post(upload_url, data=data, headers=headers)
	if resp.status_code != requests.codes.ok:
		print "[error] Upload of '%s' failed: %s" % (filename, resp.text)
		sys.exit(1)
	else:
		result = json.loads(resp.text)
		print "[info] File '%s' uploaded to %s" % (filename, result["localFilePath"])

	return result["localFilePath"]

def install_file(urltype, name, path):
	install_url = "https://%s/mgmt/tm/sys/crypto/%s" % (args.host, urltype)
	install_payload = {	"command":"install", "name":"%s" % name, "from-local-file":"%s" % path }
	resp = s.post(install_url, data=json.dumps(install_payload))
	if resp.status_code != requests.codes.ok:
		return { "result":False, "msg":"[error] Install of %s %s to object %s failed: %s" % (urltype, path, name, resp.text) }
		sys.exit(1)
	else:
		result = json.loads(resp.text)
		return { "result":True, "msg":"[success] %s %s installed to object %s" % (urltype, path, name) }

def delete_file(path):
	bash_url   = "https://%s/mgmt/tm/util/bash" % (args.host)
	delete_payload = { "command":"run",
				   	   "utilCmdArgs":"-c 'if [ -f %s ] ; then rm -f %s ; fi'"	% (path, path)
				     }
	resp = s.post(bash_url, data=json.dumps(delete_payload))
	if resp.status_code != requests.codes.ok:
		return { "result":False, "msg":"[error] delete of %s failed: %s" % (path, resp.text) }
	else:
		return { "result":True, "msg":"[info] deleted %s" % (path) }


# Setup and process arguments
parser = argparse.ArgumentParser(description='Script to import and SSL/TLS Certificate and/or Key to a BIG-IP device')
parser.add_argument("host",             help="The IP/Hostname of the BIG-IP device")
parser.add_argument("name",             help="The name of the object on BIG-IP (partitions are supported)")
parser.add_argument("-c", "--cert",     help="The path to the PEM formatted certificate file to import")
parser.add_argument("-k", "--key",      help="The path to the PEM formatted key file to import")
parser.add_argument("-u", "--username", help="The BIG-IP username", default="admin")
parser.add_argument("-p", "--password", help="The BIG-IP password", default="admin")
parser.add_argument("-o", "--overwrite",help="Overwrite an existing certificate/key object", action="store_true")
parser.add_argument("-d", "--dontsave", help="Don't automatically save the config", action="store_true")
parser.add_argument("-P", "--partition",help="The BIG-IP partition to use", default="Common")
args = parser.parse_args()

# Create request session, set credentials, allow self-signed SSL cert
s = requests.session()
s.auth = (args.username,args.password)
s.verify = False

if not args.cert and not args.key:
	print "[error] At least one certificate or key file must be specified"
	sys.exit(1)

# Get just the file name
#template_name = os.path.basename(args.cert)

# Set our REST urls

cert_url       = "https://%s/mgmt/tm/sys/crypto/cert" % (args.host)
key_url        = "https://%s/mgmt/tm/sys/crypto/key" % (args.host)
certsearch_url = "%s?$select=name,partition" % (cert_url)
keysearch_url  = "%s?$select=name,partition" % (key_url)
save_url       = "https://%s/mgmt/tm/sys/config" % (args.host)
certname       = "%s.crt" % (args.name)
keyname        = "%s.key" % (args.name)
certnameuuid   = "%s-%s" % (uuid.uuid4(), certname)
keynameuuid    = "%s-%s" % (uuid.uuid4(), keyname)

# Set various payloads

# Check to see if the cert with the name specified in the arguments exists on the BIG-IP device
certexist = False
if args.cert:
	resp = s.get(certsearch_url)
	check_auth(resp)
	certexist =  search_dict(resp.json(), args.partition, certname)

# Check to see if the key with the name specified in the arguments exists on the BIG-IP device
keyexist = False
if args.key:
	resp = s.get(keysearch_url)
	check_auth(resp)
	keyexist =  search_dict(resp.json(), args.partition, keyname)

if (keyexist or certexist) and not args.overwrite:
	if keyexist:
		print "[error] The key \"/%s/%s\" already exists.  To overwrite specify the -o option" % (args.partition, keyname)
	if certexist:
		print "[error] The certificate \"/%s/%s\" already exists.  To overwrite specify the -o option" % (args.partition, certname)
	sys.exit(1)

if args.cert:
	certpath = upload_file(args.cert, certnameuuid)
	result = install_file("cert", "/%s/%s" % (args.partition, args.name), certpath)
	print result["msg"]
	del_result = delete_file(certpath)
	print del_result["msg"]
	if result["result"] == False or del_result["result"] == False:
		sys.exit(1)

if args.key:
	keypath = upload_file(args.key, keynameuuid)
	result = install_file("key", "/%s/%s" % (args.partition, args.name), keypath)
	print result["msg"]
	del_result = delete_file(keypath)
	print del_result["msg"]
	if result["result"] == False or del_result["result"] == False:
		sys.exit(1)

# Save the config (unless -d option was specified)
save_payload = { "command":"save" }
if not args.dontsave:
	resp = s.post(save_url, data=json.dumps(save_payload))
	if resp.status_code != requests.codes.ok:
		print "[error] save failed: %s" % (resp.json())
		sys.exit(1)
	else:
		print "[success] Config saved"
