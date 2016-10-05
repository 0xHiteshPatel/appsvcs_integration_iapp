import re 
import json
import sys
import glob
import os
import argparse
import base64
import gzip

def get_info(basedir):
	allvars = []
	with open("%s/src/implementation_layer.tcl" % basedir,"r") as impl:
		impl_major = ""
		impl_minor = ""
		pres_rev = ""
		for line in impl:
			implmajormatch = re.match( r'^set IMPLMAJORVERSION \"(.*)\"', line)
			implminormatch = re.match( r'^set IMPLMINORVERSION \"(.*)\"', line)
			#presmatch = re.match( r'^set PRESVERSION \"(.*)\"', line)
			
			if implmajormatch:
				impl_major = implmajormatch.group(1)

			if implminormatch:
				impl_minor = implminormatch.group(1)

			#if presmatch:
			#	pres_rev = presmatch.group(1)

			if ( impl_major and impl_minor ):
				break
	impl.close()
	with open("%s/src/presentation_layer.json" % basedir,"r") as data_file:    
		data = json.load(data_file)
		if data["tmpl_majorversion"] != impl_major:
			print "IMPLVERSION_MAJOR (%s) in implementation_layer.tcl does not match 'tmpl_majorversion' (%s) in presentation.json, quitting..." % (impl_major, data["tmpl_majorversion"])
			quit(1)	

		for section in data["sections"]:
			if section["name"] == "intro":
				continue
			for field in section["fields"]:
				allvars.append(str(" %s__%s \\\\") % (section["name"], field["name"]))
				#allvars = '%s %s__%s \\\n' % (allvars, section["name"], field["name"])

	data_file.close()
	allvarsstr = str('\n'.join(allvars))

	return {'impl_major':impl_major, 
			'impl_minor':impl_minor, 
			'pres_rev':"%s" % str(data["pres_revision"]),
			'allvars':allvarsstr
			}

def process_file(fin, fout, basedir, name_append, prepend):
	print "%sfound insertfile, file=%s" % (prepend, fin.name)
	ret = []
	for line in fin:
		line = re.sub(r'%IMPLVERSION_MAJOR%', version["impl_major"], line)
		line = re.sub(r'%IMPLVERSION_MINOR%', version["impl_minor"], line)
		line = re.sub(r'%PRESENTATION_REV%', version["pres_rev"], line)
		line = re.sub(r'%PRESENTATION_TCL_ALLVARS%', version["allvars"], line)
		line = re.sub(r'%NAME_APPEND%', name_append, line)
			
		match = re.match( r'(.*)\%insertfile:(.*)\%(.*)', line)
		if match:
			with open ("%s/%s" % (basedir, match.group(2)), "r") as insertfile:
				insert = process_file(insertfile, fout, basedir, name_append, '%s ' % prepend)
				#insertdata = insertfile.read()
				insertfile.close()
				#line = "%s%s%s" % (match.group(1), re.sub(r'(%insertfile:.*%)', insertdata, line), match.group(3))
				line = "%s%s%s" % (match.group(1), ''.join(insert), match.group(3))
		
		#fout.write(line)
		ret.append(line)
	return ret

def create_bundled_items():
	type_string = ""
	data_string = ""

	print "Building bundled items:"
	with open(os.path.join(basedir,'tmp','bundler.build'), "wt") as out:
		print " Adding iRules (%s/irules/*.irule)..." % (args.bundledir)
		files = glob.glob(os.path.join(args.bundledir,'irules','*.irule'))

		print " Adding ASM policies (%s/asm_policies/*.xml)..." % (args.bundledir)
		files += glob.glob(os.path.join(args.bundledir, 'asm_policies','*.xml'))

		print " Adding APM policies (%s/apm_policies/*.tar.gz)..." % (args.bundledir)
		files += glob.glob(os.path.join(args.bundledir,'apm_policies','*.tar.gz'))

		if len(files) == 0:
			print "  no files found"
			out.write("\n")
		else:
			out.write("array set bundler_objects {}\n")
			out.write("array set bundler_data {}\n")
			for filename in files:
				print " Processing file: %s" % filename
				filetype = ""
				apm_bip_version = ['1']
				name_parts = filename.split(os.sep)
				file_parts = name_parts[-1].split('.')
				just_name = file_parts[0]
				if re.match( r'.*irules.*', filename): filetype = 'irule'
				if re.match( r'.*asm.*', filename): filetype = 'asm'
				if re.match( r'.*apm.*', filename): filetype = 'apm'
				
				if filetype == "":
					print "ERROR: Could not determine the type of object for bundled file '%s'" % filename
					sys.exit(1)

				if filetype == "apm":
					with gzip.open(filename, 'rb') as gz:
						apm_raw = gz.read()
						apm_bip_version = re.findall(r'^\#F5\[Version:(.*)\]', apm_raw, re.MULTILINE)
    					if len(apm_bip_version) != 1:
    						print "ERROR: Could not determine BIG-IP TMOS version for bundled APM file '%s'" % filename
    						sys.exit(1)
    					gz.close()
    					print "  Found BIG-IP Version: %s" % apm_bip_version[0]
				with open(filename, "rb") as infile:
					key = "%s:%s" % (filetype, just_name)
					type_string += "set bundler_objects(%s) %s\n" % (key, apm_bip_version[0])
					data_string += "set bundler_data(%s) {%s}\n" % (key, base64.b64encode(infile.read()))

			out.write("%s\n%s" % (type_string, data_string))	
		
		out.close()

parser = argparse.ArgumentParser(description='Script to assemble the appsvcs_integration_iapp BIG-IP iApp template')
parser.add_argument("basedir", help="The base directory for the build")
parser.add_argument("-a", "--append", help="A string to append to the base template name")
parser.add_argument("-r", "--roottmpl", help="The root template file to use (default: <basedir>/src/master.template", default="src/master.template")
parser.add_argument("-o", "--outfile", help="The name of the output file")
parser.add_argument("-b", "--bundledir", help="The directory to use for bundled items", default="bundled")

args = parser.parse_args()

basedir = args.basedir

if args.append:
	name_append = "_%s" % args.append
	print "Appending \"%s\" to template name" % name_append
else:
	name_append = ""

version = get_info(basedir)
print "Got info: %s" % version

with open('docs/VERSION','wt') as docversion:
	doc_ver = version.copy()
	del doc_ver['allvars']
	docversion.write(json.dumps(doc_ver))
	docversion.close()

if not args.outfile:
	outfile = "%s/appsvcs_integration_v%s-%s_%s%s.tmpl" % (basedir, version["impl_major"], version["impl_minor"], version["pres_rev"], name_append)
else:
	outfile = "%s/%s" % (basedir, args.outfile)

print "Writing to file: %s" % outfile

create_bundled_items()

root_template = "%s/%s" % (basedir, args.roottmpl)

with open(outfile,"wt") as out:
	with open(root_template) as main_template:
		final = process_file(main_template, out, basedir, name_append, "")
		out.write(''.join(final))
		
out.close()
main_template.close()
