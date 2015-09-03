import re 
import json
import sys
import glob
import os

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

def create_files_include(files, outfile, prefix):
	with open(outfile, "wt") as out:	
		for filename in files:
			print " processing file %s" % filename
			name_parts = filename.split(os.sep)
			file_parts = name_parts[1].split('.')
			just_name = file_parts[0]
			with open(filename) as infile:
				data = infile.read()
				out.write("set %s_%s_data {%s}\n\n" % (prefix, just_name, data))
	out.close()

if len(sys.argv) < 2:
	print "Usage: %s <base directory>" % sys.argv[0]
	quit(0)

basedir = sys.argv[1]

if len(sys.argv) == 3 and len(sys.argv[2]) > 0:
	name_append = "_%s" % sys.argv[2]
	print "Appending \"%s\" to template name" % name_append
else:
	name_append = ""


version = get_info(basedir)
print "Got info: %s" % version
outfile = "%s/appsvcs_integration_v%s-%s_%s%s.tmpl" % (basedir, version["impl_major"], version["impl_minor"], version["pres_rev"], name_append)
print "Writing to file: %s" % outfile

print "Processing iRules (irules/*.irule)..."
irules = glob.glob(os.path.join('irules','*.irule'))

if len(irules) == 0:
	print "  no iRules found"
	with open(os.path.join(basedir, 'tmp','irules.build'),"wt") as out:
		out.write("\n")
	out.close()
else:
	create_files_include(irules, os.path.join('tmp','irules.build'), "irule_include" )


print "Processing ASM policies (asm_policies/*.xml)..."
asm_policies = glob.glob(os.path.join('asm_policies','*.xml'))

if len(asm_policies) == 0:
	print "  no policies found"
	with open(os.path.join(basedir, 'tmp','asm.build'),"wt") as out:
		out.write("\n")
	out.close()
else:
	create_files_include(asm_policies, os.path.join('tmp','asm.build'), "asm_policy" )


with open(outfile,"wt") as out:
	with open("%s/src/master.template" % basedir) as main_template:
		final = process_file(main_template, out, basedir, name_append, "")
		out.write(''.join(final))
		
out.close()
main_template.close()
