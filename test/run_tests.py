#!/usr/bin/python -u

import re 
import json
import sys
import glob
import os
import datetime
import argparse
import shlex
from subprocess import Popen, PIPE
import time
import requests

def get_exitcode_stdout_stderr(cmd):
    """
    Execute the external command and get its exitcode, stdout and stderr.
    """
    args = shlex.split(cmd)

    proc = Popen(args, stdout=PIPE, stderr=PIPE)
    out, err = proc.communicate()
    exitcode = proc.returncode
    #
    return exitcode, out, err

def process_file(template_fn):
	global vs_nextip
	global member_nextip
	global vs_subnet
	global member_subnet
	retlist = []
	retlist.append(0)
	retlist.append("")
	retlist.append("Common")

	with open (template_fn) as template:
		with open ("%s.tmp" % template_fn, "wt") as tmp:
			for line in template:
				line = re.sub(r'\%TEST_NAME\%', template_fn.split('.')[0], line)
				vs_ip_match = re.match( r'.*%TEST_VS_IP%.*', line)
				member_ip_match = re.match( r'.*%TEST_MEMBER_IP%.*', line)
				snat_ip_match = re.match( r'.*%TEST_RANGE_(.*)_IP%.*', line)
				version_match = re.match( r'.*%TEST_DEV_VERSION_(.*)%.*', line)
				delete_override_match = re.match( r'.*\"test_delete_override\":\"true\".*', line)
				parent_match = re.match( r'.*\"test_parent\":\"(.*)\".*', line)
				partition_match = re.match( r'.*\"partition\":\"(.*)\".*', line)

				if partition_match:
					retlist[2] = partition_match.group(1)

				if parent_match:
					retlist[1] = parent_match.group(1)

				if delete_override_match:
					print "[%s] Delete disabled (found override), chained re-deploy assumed" % template_fn
					retlist[0] = 1

				if version_match:
					if version_match.group(1) == "MAJOR":
						line = re.sub(r'\%TEST_DEV_VERSION_MAJOR\%', "%s" % version["major"], line)

					if version_match.group(1) == "MINOR":
						line = re.sub(r'\%TEST_DEV_VERSION_MINOR\%', "%s" % version["minor"], line)

					if version_match.group(1) == "FULL":
						line = re.sub(r'\%TEST_DEV_VERSION_FULL\%', "%s" % version["version"], line)

				if vs_ip_match:
					line = re.sub(r'\%TEST_VS_IP\%', "%s%s" % (vs_subnet, vs_nextip), line)
					vs_nextip += 1

				if member_ip_match:
					line = re.sub(r'\%TEST_MEMBER_IP\%', "%s%s" % (member_subnet, member_nextip), line)
					member_nextip += 1

				if snat_ip_match:
					snat_ips = []
					for sip in range(member_nextip, member_nextip+int(snat_ip_match.group(1))):
						snat_ips.append("%s%s" % (member_subnet, member_nextip))
						member_nextip += 1
					line = re.sub(r'\%TEST_RANGE_.*_IP\%', "%s" % (','.join(snat_ips)), line)
					
				tmp.write(line)

	tmp.close()
	template.close()
	return(retlist)

def run_test():
	global vs_subnet
	global vs_nextip
	global member_subnet
	global member_nextip
	global version

	vs_subnet = '.'.join(args.vssubnet.split('.')[0:-1]) + '.'
	vs_nextip = int(args.vssubnet.split('.')[-1])
	member_subnet = '.'.join(args.membersubnet.split('.')[0:-1]) + '.'
	member_nextip = int(args.membersubnet.split('.')[-1])

	test_templates = glob.glob(args.glob)

	version = get_version()

	print "Starting test run at %s" % str(datetime.datetime.now().isoformat())
	print "# of test templates found: %s" % len(test_templates)
	print "VS Subnet: %s, nextip %s%s" % (vs_subnet, vs_subnet, vs_nextip)
	print "Member Subnet: %s, nextip %s%s" % (member_subnet, member_subnet, member_nextip)
	print "Device Version: %s" % version
	print "Loading test config (test_config.conf)..."
	exitcode, out, err = get_exitcode_stdout_stderr("scp test_config.conf root@%s:/var/tmp" % args.host)
	print out
	print err

	exitcode, out, err = get_exitcode_stdout_stderr("ssh root@%s 'tmsh load sys config file /var/tmp/test_config.conf merge'" % args.host)
	print out
	print err

	for test_template in test_templates:
		(del_override, del_override_name, del_partition) = process_file(test_template)
				
		cmd = "../scripts/deploy_iapp_bigip.py -r -d -u %s -p %s -c 30 -w 1 %s %s.tmp" % (args.username, args.password, args.host, test_template)
		print "[%s] Running %s" % (test_template, cmd),
		sys.stdout.flush()

		exitcode, out, err = get_exitcode_stdout_stderr(cmd)
		if not exitcode:
			print "SUCCESS ",
			if not args.nodelete and not del_override:
				del_name = test_template.split('.')[0]
				if len(del_override_name) > 0:
					del_name = del_override_name
				
				delcmd = "../scripts/delete_iapp_bigip.py -u %s -p %s -P %s -n %s %s" % (args.username, args.password, del_partition, args.host, del_name)
				dexitcode, dout, derr = get_exitcode_stdout_stderr(delcmd)
				if dexitcode == 0:
					print "DELETE_OK"
				else:
					print "DELETE_FAIL: %s %s" % (dout, derr)
					return(1)
			else:
				print ""

			os.remove("%s.tmp" % test_template)
		else:
			print "FAIL "
			print out
			return(1)
		time.sleep(5)

	print "\nAll tests completed"
	return(0)

def get_version():
	s = requests.session()
	s.auth = (args.username, args.password)
	s.verify = False
	resp = s.get("https://%s/mgmt/tm/sys/software/image?$select=version" % args.host)

	if resp.status_code == 401:
		print "[error] Authentication to %s failed" % (args.host)
		sys.exit(1)

	if resp.status_code == 200:
		version = resp.json()["items"][0]["version"]
		parts = version.split('.')

		return( { 'version':'_'.join(parts),
				  'major':'_'.join(parts[0:-1]),
				  'minor':parts[2]
			    })
		
	return({})

# Setup and process arguments
parser = argparse.ArgumentParser(description='Script to run appsvcs_integration_iapp test suite')
parser.add_argument("host",             help="The IP/Hostname of the target BIG-IP device")
parser.add_argument("-g", "--glob",     help="The file glob to select tests", default="test_*.json")
parser.add_argument("-u", "--username", help="The BIG-IP username", default="admin")
parser.add_argument("-p", "--password", help="The BIG-IP password", default="admin")
parser.add_argument("-v", "--vssubnet", help="The starting IP to use for Virtual Server IPs", default="172.16.0.100")
parser.add_argument("-m", "--membersubnet", help="The starting IP to use for Pool Member IPs", default="10.0.0.10")
parser.add_argument("-n", "--nodelete", help="Don't delete deployments automatically", action="store_true")
parser.add_argument("-c", "--runcount", help="The number of times to run tests", type=int, default=1)

args = parser.parse_args()

if args.runcount > 1 and args.nodelete:
	print "A '-c' option > 1 and the '-n' are not valid.  Please choose only one"
	exit(1)

for run in range(args.runcount):
	print "=== Start Run %s/%s =======================" % (run+1, args.runcount)
	if run_test() != 0:
		exit(1)
	print "=== End Run %s/%s =======================" % (run+1, args.runcount)
	if not (run+1) == args.runcount: 
		time.sleep(5)

exit(0)