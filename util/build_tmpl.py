import re 
import json
import sys

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

def process_file(fin, fout, basedir, prepend):
	print "%sfound insertfile, file=%s" % (prepend, fin.name)
	for line in fin:
		line = re.sub(r'%IMPLVERSION_MAJOR%', version["impl_major"], line)
		line = re.sub(r'%IMPLVERSION_MINOR%', version["impl_minor"], line)
		line = re.sub(r'%PRESENTATION_REV%', version["pres_rev"], line)
		line = re.sub(r'%PRESENTATION_TCL_ALLVARS%', version["allvars"], line)
			
		match = re.match( r'.*%insertfile:(.*)%.*', line)
		if match:
			with open ("%s/%s" % (basedir, match.group(1)), "r") as insertfile:
				process_file(insertfile, fout, basedir, '%s ' % prepend)
				insertdata = insertfile.read()
				insertfile.close()
				line = re.sub(r'%insertfile:(.*)%', insertdata, line)
			
		fout.write(line)

if len(sys.argv) != 2:
	print "Usage: %s <base directory>" % sys.argv[0]
	quit(0)

basedir = sys.argv[1]

version = get_info(basedir)
print "Got info: %s" % version
outfile = "%s/appsvcs_integration_v%s-%s_%s.tmpl" % (basedir, version["impl_major"], version["impl_minor"], version["pres_rev"])
print "Writing to file: %s" % outfile
with open(outfile,"wt") as out:
	with open("%s/src/master.template" % basedir) as main_template:
		process_file(main_template, out, basedir, "")
		
out.close()
main_template.close()





