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
import random

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
	global vs_subnet
	global vs6_nextip
	global vs6_subnet
	global member_nextip
	global member_subnet
	global member6_nextip
	global member6_subnet
	global range_nextip
	global range_subnet
	global range6_nextip
	global range6_subnet
	retlist = []
	retlist.append(False)
	retlist.append("")
	retlist.append("Common")

	with open (template_fn) as template:
		with open ("%s_%s.tmp" % (template_fn, sessionid), "wt") as tmp:
			for line in template:
				line = re.sub(r'\%TEST_NAME\%', template_fn.split('.')[0], line)
				vs_ip_match = re.match( r'.*%TEST_VS_IP%.*', line)
				vs6_ip_match = re.match( r'.*%TEST_VS6_IP%.*', line)
				member_ip_match = re.match( r'.*%TEST_MEMBER_IP%.*', line)
				member6_ip_match = re.match( r'.*%TEST_MEMBER6_IP%.*', line)
				snat_ip_match = re.match( r'.*%TEST_RANGE_(\d)_IP%.*', line)
				snat6_ip_match = re.match( r'.*%TEST_RANGE6_(\d)_IP%.*', line)
				version_match = re.match( r'.*%TEST_DEV_VERSION_(.*)%.*', line)
				delete_override_match = re.match( r'.*\"test_delete_override\":\"true\".*', line)
				parent_match = re.match( r'.*\"test_parent\":\"(.*)\".*', line)
				partition_match = re.match( r'.*\"partition\":\"(.*)\".*', line)
				policyhost_match = re.match( r'.*%TEST_POLICY_HOST%.*', line)
				random_match = re.match( r'.*%RANDOM%.*', line)
				
				if random_match:
					line = re.sub(r'\%RANDOM\%', str(random.randint(10000, 99999)), line)

				if partition_match:
					retlist[2] = partition_match.group(1)

				if parent_match:
					retlist[1] = parent_match.group(1)

				if policyhost_match:
					line = re.sub(r'\%TEST_POLICY_HOST\%', args.policyhost, line)
					
				if delete_override_match:
					retlist[0] = True

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

				if vs6_ip_match:
					line = re.sub(r'\%TEST_VS6_IP\%', "%s%s" % (vs6_subnet, vs6_nextip), line)
					vs6_nextip += 1

				if member_ip_match:
					line = re.sub(r'\%TEST_MEMBER_IP\%', "%s%s" % (member_subnet, member_nextip), line)
					member_nextip += 1

				if member6_ip_match:
					line = re.sub(r'\%TEST_MEMBER6_IP\%', "%s%s" % (member6_subnet, member6_nextip), line)
					member6_nextip += 1

				if snat_ip_match:
					snat_ips = []
					for sip in range(range_nextip-int(snat_ip_match.group(1)), range_nextip):
						snat_ips.append("%s%s" % (range_subnet, range_nextip))
						range_nextip -= 1
					line = re.sub(r'\%TEST_RANGE_[\d]_IP\%', "%s" % (','.join(snat_ips)), line)

				if snat6_ip_match:
					snat6_ips = []
					for s6ip in range(range6_nextip-int(snat6_ip_match.group(1)), range6_nextip):
						snat6_ips.append("%s%s" % (range6_subnet, range6_nextip))
						range6_nextip -= 1
					line = re.sub(r'\%TEST_RANGE6_[\d]_IP\%', "%s" % (','.join(snat6_ips)), line)
					
				tmp.write(line)

	tmp.close()
	template.close()
	return(retlist)

def run_test():
	global vs_subnet
	global vs_nextip
	global vs6_subnet
	global vs6_nextip
	global member_subnet
	global member_nextip
	global member6_subnet
	global member6_nextip
	global range_subnet
	global range_nextip
	global range6_subnet
	global range6_nextip
	global version

	vs_subnet = '.'.join(args.vssubnet.split('.')[0:-1]) + '.'
	vs_nextip = int(args.vssubnet.split('.')[-1])
	vs6_subnet = ':'.join(args.vs6subnet.split(':')[0:-1]) + ':'
	vs6_nextip = int(args.vs6subnet.split(':')[-1])
	member_subnet = '.'.join(args.membersubnet.split('.')[0:-1]) + '.'
	member_nextip = int(args.membersubnet.split('.')[-1])
	range_subnet = '.'.join(args.membersubnet.split('.')[0:-1]) + '.'
	range_nextip = int(254)
	member6_subnet = ':'.join(args.member6subnet.split(':')[0:-1]) + ':'
	member6_nextip = int(args.member6subnet.split(':')[-1])
	range6_subnet = ':'.join(args.member6subnet.split(':')[0:-1]) + ':'
	range6_nextip = int(8192)

	test_templates = sorted(glob.glob(args.glob))
	if args.end == -1:
		args.end = len(test_templates)

	version = get_version()

	print "Starting test run at %s" % str(datetime.datetime.now().isoformat())
	print "# of test templates found: %s" % len(test_templates)
	print "Start: %s, End: %s, Skip: %s" % (args.start, args.end, skip_list)
	print "IPv4 VS Subnet: %s, nextip %s%s" % (vs_subnet, vs_subnet, vs_nextip)
	print "IPv6 VS Subnet: %s, nextip %s%s" % (vs6_subnet, vs6_subnet, vs6_nextip)
	print "IPv4 Member Subnet: %s, nextip %s%s" % (member_subnet, member_subnet, member_nextip)
	print "IPv6 Member Subnet: %s, nextip %s%s" % (member6_subnet, member6_subnet, member6_nextip)
	print "Device Version: %s" % version
	print "Loading test config (test_config.conf)..."
	exitcode, out, err = get_exitcode_stdout_stderr("scp test_config.conf root@%s:/var/tmp" % args.host)
	print out
	print err

	exitcode, out, err = get_exitcode_stdout_stderr("ssh root@%s 'tmsh -c \"delete ltm pool all; delete ltm node all\"'" % args.host)
	print out
	print err

	exitcode, out, err = get_exitcode_stdout_stderr("ssh root@%s 'tmsh load sys config file /var/tmp/test_config.conf merge'" % args.host)
	print out
	print err

	testnum = 1
	for test_template in test_templates:

		if testnum < args.start or testnum > args.end or testnum in skip_list:
			print "[%s/%s][%s/%s][%s] SKIPPED" % (run+1, args.runcount, testnum, len(test_templates), test_template)
			testnum += 1
			continue

		test_name = test_template.split('.')[0]

		(del_override, del_override_name, del_partition) = process_file(test_template)
				
		cmd = "python ../scripts/deploy_iapp_bigip.py -r -d -u %s -p %s -c 60 -w 1 %s %s_%s.tmp" % (args.username, args.password, args.host, test_template, sessionid)

		for i in range(args.retries):
			if args.debug:
				print "[%s/%s][%s/%s][%s] (%s/%s) Running %s" % (run+1, args.runcount, testnum, len(test_templates), test_template, i+1, args.retries, cmd),
			else:
				print "[%s/%s][%s/%s][%s] (%s/%s) Running..." % (run+1, args.runcount, testnum, len(test_templates), test_template, i+1, args.retries),

			sys.stdout.flush()

			exitcode, out, err = get_exitcode_stdout_stderr(cmd)

			if del_override:
				print "DEL_OVERRIDE ",

			if not exitcode:
				print "SUCCESS ",
				if len(del_override_name) > 0:
					res_name = del_override_name
				else:
					res_name = test_name

				resultcmd = "ssh root@%s \"tmsh -c 'cd /%s/%s.app ; list ltm ; list asm ; list apm'\"" % (args.host, del_partition, res_name)
				rexitcode, rout, rerr = get_exitcode_stdout_stderr(resultcmd)
				with open ("%s/run/%s/%s/%s.result" % (os.getcwd(), sessionid, run+1, test_name), "wt") as resultfile:
					resultfile.write(rout)
				resultfile.close()

				if rexitcode:
					print "RESULT_FAIL",
				else:
					print "RESULT_OK",

				if not args.nodelete and not del_override:
					del_name = test_template.split('.')[0]
					if len(del_override_name) > 0:
						del_name = del_override_name
					
					delcmd = "python ../scripts/delete_iapp_bigip.py -u %s -p %s -P %s -n %s %s" % (args.username, args.password, del_partition, args.host, del_name)
					dexitcode, dout, derr = get_exitcode_stdout_stderr(delcmd)
					if dexitcode == 0:
						print "DELETE_OK"
						vs_nextip = int(args.vssubnet.split('.')[-1])
						vs6_nextip = int(args.vs6subnet.split(':')[-1])
					else:
						print "DELETE_FAIL: %s %s" % (dout, derr)
						return(1)
				else:
					print ""

				member_nextip = int(args.membersubnet.split('.')[-1])
				member6_nextip = int(args.member6subnet.split(':')[-1])

				os.remove("%s_%s.tmp" % (test_template, sessionid))
				break
			else:
				print "FAIL "
				print out
				if i+1 == args.retries:
					return(1)
			time.sleep(5)

		testnum += 1
		time.sleep(5)

	print "\nAll tests completed"
	return(0)

def get_version():
	s = requests.session()
	s.auth = (args.username, args.password)
	s.verify = False
	resp = s.get("https://%s/mgmt/tm/sys/software/volume?$select=active,version" % args.host)

	if resp.status_code == 401:
		print "[error] Authentication to %s failed" % (args.host)
		sys.exit(1)

	if resp.status_code == 200:
		for item in resp.json()["items"]:
			if 'active' in item.keys() and item["active"] == True:
				version = item["version"]
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
parser.add_argument("-v", "--vssubnet", help="The starting IP to use for IPv4 Virtual Server IPs", default="172.16.0.100")
parser.add_argument("-V", "--vs6subnet",help="The starting IP to use for IPv6 Virtual Server IPs", default="2001:dead:beef:1::10")
parser.add_argument("-m", "--membersubnet", help="The starting IP to use for IPv4 Pool Member IPs", default="10.0.0.10")
parser.add_argument("-M", "--member6subnet", help="The starting IP to use for IPv6 Pool Member IPs", default="2001:dead:beef:2::10")
parser.add_argument("-n", "--nodelete", help="Don't delete deployments automatically", action="store_true")
parser.add_argument("-c", "--runcount", help="The number of times to run tests", type=int, default=1)
parser.add_argument("-r", "--retries", help="The number of times to retry tests upon failure", type=int, default=3)
parser.add_argument("-b", "--policyhost", help="The host to use for URL based bundled items", default="192.168.2.2")
parser.add_argument("-D", "--debug",    help="Enabled debug output", action="store_true")
parser.add_argument("-s", "--start",    help="Test number to start at", type=int, default="1")
parser.add_argument("-e", "--end",    help="Test number to end at", type=int, default="-1")
parser.add_argument("-i", "--ignore",    help="Comma seperated list of test numbers to ignore/skip", default="")

args = parser.parse_args()

if args.runcount > 1 and args.nodelete:
	print "A '-c' option > 1 and the '-n' are not valid.  Please choose only one"
	exit(1)

skip_list = []
if len(args.ignore) > 0:
	skip_list = map(int, args.ignore.split(','))

sessionid = str(int(time.time()))
print "Starting test run, sessionid is %s" % sessionid

for run in range(args.runcount):
	print "=== Start Run %s/%s =======================" % (run+1, args.runcount)
	os.makedirs("run/%s/%s/" % (sessionid, run+1))
	if run_test() != 0:
		exit(1)
	print "=== End Run %s/%s =======================" % (run+1, args.runcount)
	if not (run+1) == args.runcount: 
		time.sleep(5)

exit(0)