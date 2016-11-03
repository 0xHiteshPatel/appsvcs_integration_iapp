import json
import sys
import glob
import os
import argparse
import re
import base64
import gzip

class AppSvcsBuilder:
	_apl_validators = {
		'ipaddr':'IpAddress',
		'port':'PortNumber',
		'number':'NonNegativeNumber',
		'allnumber':'Number',
		'iporfqdn':'IpOrFqdn',
		'fqdn':'FQDN'
	}

	options = {
		'preso': os.path.join('src','presentation_layer.json'),
		'impl': os.path.join('src','implementation_layer.tcl'),
		'workingdir': os.getcwd(),
		'tempdir': 'tmp',
		'bundledir': 'bundled',
		'outfile': None,
		'docsdir': 'docs', 
		'append': "",
		'roottmpl': os.path.join('src','master.template'),
		'debug':False,
		'github_root':'https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/',
		'github_tag':'',
		'github_url':'',
		'debug':False
	}

	def __init__(self, **kwargs):
		self._debug("in __init__")
		self.options.update(**kwargs)
		self.options["preso_fn"] = os.path.join(self.options["workingdir"],self.options["preso"])
		self.options["impl_fn"] = os.path.join(self.options["workingdir"],self.options["impl"])
		if len(self.options["append"]) > 0:
			self.options["append"] = '_' + self.options["append"]

		self._debug("options=%s" % self.options)

		self.buildinfo = {
			"pres_rev":"",
			"impl_major": "",
			"impl_minor": "",
			"allvars": [],
			"allvarsTCL": "",
			"github_tag":"",
			"github_url":""
		}
		self._load_info()
		if not self.options["outfile"]:
			self.options["outfile_fn"] = "%s/appsvcs_integration_v%s-%s_%s%s.tmpl" \
				% (self.options["workingdir"],
				   self.buildinfo["impl_major"],
				   self.buildinfo["impl_minor"],
				   self.buildinfo["pres_rev"],
				   self.options["append"])
		else:
			self.options["outfile_fn"] = os.path.join(self.options["workingdir"], self.options["outfile"])

		# if self.options["append"]:
		# 	print "Appending \"%s\" to template name" % self.options["append"]

		self.options['github_url'] = self.options['github_root'] + 'tree/' + self.options['github_tag'] + '/'
		self.buildinfo['github_root'] = self.options['github_root']
		self.buildinfo['github_url'] = self.options['github_url']
		self.buildinfo['github_tag'] = self.options['github_tag']

		self._debug("buildinfo=%s" % self.buildinfo)
		#self._debug(self._stringify_modes([1,2,3,4]))
		#self._debug(self._search_test_cases("pool__port"))
		# self._debug(self._doc_RST_section("Test Test XXX","="))
		# self._debug(self._doc_RST_links(["include_defaults.json","test_vs_ipother.json"], "test/"))
		# for section in self.pres_data["sections"]:
		# 	if section["name"] == "pool":
		# 		for field in section["fields"]:
		# 			if field["name"] == "addr":
		# 				self._debug(self._doc_RST_print_field(field, "pool__addr", 0))
		# 				self._debug(self._doc_RST_print_field(field, "pool__addr", 1))

	def _debug(self, msg):
		if(self.options["debug"]):
			sys.stderr.write("[debug] %s\n" % msg)

	def _load_info(self):
		impl = self._safe_open(self.options["impl_fn"])
		pres = self._safe_open(self.options["preso_fn"])
		self.pres_data = self._load_json(pres)
		pres.close()

		for line in impl:
			implmajormatch = re.match( r'^set IMPLMAJORVERSION \"(.*)\"', line)
			implminormatch = re.match( r'^set IMPLMINORVERSION \"(.*)\"', line)

			if implmajormatch: self.buildinfo["impl_major"] = implmajormatch.group(1)
			if implminormatch: self.buildinfo["impl_minor"] = implminormatch.group(1)

			if ( self.buildinfo["impl_major"] and self.buildinfo["impl_minor"] ):
				break
		impl.close()
		if self.pres_data["tmpl_majorversion"] != self.buildinfo["impl_major"]:
			print "[fatal] IMPLVERSION_MAJOR (%s) in %s does not match 'tmpl_majorversion' (%s) in %s" \
			       % (self.buildinfo["impl_major"],
			       	  self.options["impl_fn"],
			       	  self.pres_data["tmpl_majorversion"],
			       	  self.options["preso_fn"])
			sys.exit(1)

		self.buildinfo["pres_rev"] = str(self.pres_data["pres_revision"])

		for section in self.pres_data["sections"]:
			if section["name"] == "intro":
				continue
			for field in section["fields"]:
				self.buildinfo["allvars"].append("%s__%s" % (section["name"], field["name"]))

		self.buildinfo["allvarsTCL"] = "\n".join(map(' {0} \\\\'.format, self.buildinfo["allvars"]))

		ver = self._safe_open(os.path.join(self.options["workingdir"], 'VERSION'))
		self.options['github_tag'] = str(ver.readline()).rstrip()
		ver.close

	def _safe_open(self, filename, mode="r", exit=True):
		self._debug("_safe_open: %s %s" % (mode, filename))
		try:
			fh = open(filename, mode)
		except IOError as error:
			print "[fatal] Open of file '%s' failed: %s" % (filename, error)
			if exit: sys.exit(1)
		return fh

	def _load_json(self, fh, exit=True):
		self._debug("_load_json: %s" % (fh.name))
		try:
			json_data = json.load(fh)
		except (ValueError, NameError) as error:
		   	print "[fatal] JSON format error in '%s': %s" % (fh.name, error)
			if exit: sys.exit(1)
		return json_data

	def _stringify_modes(self, modes):
		return ", ".join([self.pres_data["modes"][str(x)] for x in modes])

	def _search_test_cases(self, string):
		self._debug("in _search_test_cases")
		ret = ["include_defaults.json"]
		test_templates = sorted(glob.glob(self.options["workingdir"] + os.sep + os.path.join("test","test_*.json")))
		for template in test_templates:
			f = self._safe_open(template)
			for line in f:
	 			if string in line:
	   				ret.append(template.split(os.path.sep)[-1])
	   				f.close()
	   				break
	   		f.close()
   		return ret

   	def _doc_RST_section(self, string, char):
		return("%s\n%s\n\n" % (string, (char * len(string))))

	def _doc_RST_inline_ref(self, ref, prepend=""):
		return '%s.. _%s:\n\n' % (prepend, ref)

	def _doc_RST_anon_ref(self, list, path):
		return ['`{0} <{1}{2}{0}>`__'.format(x, self.options['github_url'], path) for x in list]

	def _doc_RST_generate(self, fh):
		for section in self.pres_data["sections"]:
			if section["name"] == "intro":
				continue

			fh.write(self._doc_RST_section("Section: %s" % section["name"], '-'))

			for field in section["fields"]:
				fh.write(self._doc_RST_inline_ref("preso-%s-%s" % (section["name"], field["name"])))
				if field["type"] != "table":
					fh.write(self._doc_RST_section("Field: %s__%s" % (section["name"], field["name"]), '^'))
					fh.write(".. csv-table::\n")
					fh.write("\t:stub-columns: 1\n")
					fh.write("\t:widths: 10 80\n\n")
					self._doc_RST_generate_field(field, "%s__%s" % (section["name"], field["name"]), fh, 0)
					fh.write("\n")
				else:
					table_name = "%s__%s" % (section["name"], field["name"])
					fh.write(self._doc_RST_section("Table: %s__%s" % (section["name"], field["name"]), '^'))
					fh.write("%s\n\n" % field["help"])
					fh.write(".. csv-table::\n")
					fh.write('\t:header: "Column","Details"\n')
					fh.write("\t:stub-columns: 1\n")
					fh.write("\t:widths: 10 80\n\n")

					for table_field in field["fields"]:
						fh.write(self._doc_RST_inline_ref("preso-%s-%s-%s" % (section["name"], field["name"], table_field["name"]), '\t"%s","' % table_field["name"]))
						self._doc_RST_generate_field(table_field, "", fh, 1)
						fh.write('\t"\n')

					fh.write('\t"Examples",')
					test_files = self._search_test_cases("%s__%s" % (section["name"], field["name"]))
					fh.write('"%s"\n\n' % " | ".join(self._doc_RST_anon_ref(test_files, "test/")))

	def _doc_RST_generate_field(self, field, search, fh, mode=0):
		self._debug("field=%s" % field)
		reqstr = "No"
		defstr = ""

		if 'required' in field.keys() and field["required"] == True: reqstr = "Yes"
		if 'default' in field.keys(): defstr = "%s" % field["default"]

		if 'help' in field.keys():
			descrstr = field["help"]
		else:
			descrstr = field["description"]

		strings = []
		strings.append({"Display Name": field["description"]})
		strings.append({"Description": descrstr})
		strings.append({"Modes": self._stringify_modes(field["modes"])})
		strings.append({"Type": field["type"]})
		strings.append({"Default": defstr})
		strings.append({"Min. Version": field["minver"]})

		if "choice" in field["type"] and "choices" in field.keys():
			choicestr = ", ".join(field["choices"])
			choicestr = choicestr.replace("&lt;", "<")
			choicestr = choicestr.replace("&gt;", ">")
			strings.append({"Choices": choicestr})

		if len(search) > 0:
			test_files = self._search_test_cases(search)
			strings.append({"Examples": " | ".join(self._doc_RST_anon_ref(test_files, "test/"))})

		if mode:
			strformat = '\t:{0}: {1}\n'
		else:
			strformat = '\t"{0}","{1}"\n'

		ret = ""
		self._debug("strings=%s" % strings)


		for string in strings:
			self._debug("string=%s" % string)
			name = string.keys()[0]
			value = string.values()[0]
			fh.write(strformat.format(name, value))

		return ret

	def _tmpl_process_file(self, fin, fout, prepend=""):
		print "%sfound insertfile, file=%s" % (prepend, fin.name)
		ret = []
		for line in fin:
			line = re.sub(r'%IMPLVERSION_MAJOR%', self.buildinfo["impl_major"], line)
			line = re.sub(r'%IMPLVERSION_MINOR%', self.buildinfo["impl_minor"], line)
			line = re.sub(r'%PRESENTATION_REV%', self.buildinfo["pres_rev"], line)
			line = re.sub(r'%PRESENTATION_TCL_ALLVARS%', self.buildinfo["allvarsTCL"], line)
			line = re.sub(r'%NAME_APPEND%', self.options["append"], line)
			line = re.sub(r'%TMPL_NAME%', "appsvcs_integration_v%s_%s%s" % (self.buildinfo["impl_major"], self.buildinfo["pres_rev"], self.options["append"]), line)
			line = re.sub(r'%TEMP_DIR%', self.options["tempdir"], line)
				
			match = re.match( r'(.*)\%insertfile:(.*)\%(.*)', line)
			if match:
				insertfile = self._safe_open("%s/%s" % (self.options["workingdir"], match.group(2)))
				insert = self._tmpl_process_file(insertfile, fout, '%s ' % prepend)
				insertfile.close()
				line = "%s%s%s" % (match.group(1), ''.join(insert), match.group(3))

			ret.append(line)
		return ret

	def _apl_generate_field_text(self, field, tab=""):
		return "\t%smessage %s" % (tab, field["name"])

	def _apl_generate_field_boolean(self, field, tab=""):
			if 'default' in field.keys():
				if field["default"] == True:
					field["default"] = "enabled"
				else:
					field["default"] = "disabled"
				field["_apl_defstr"] = " default \"%s\"" % field["default"]

			return "\t%schoice %s%s%s {\n\t\t%s\"enabled\",\n\t\t%s\"disabled\"\n\t%s}" % (tab, field["name"], field["_apl_defstr"], field["_apl_reqstr"], tab, tab, tab)

	def _apl_generate_field_string(self, field, tab=""):
		self._debug("VALIDATOR field=%s" % field)
		valstr = ""
		if '_apl_validator' in field.keys():
			valstr = ' validator "%s"' % field["_apl_validator"]

		return "\t%sstring %s%s%s%s%s" % (tab, field["name"], field["_apl_reqstr"], field["_apl_dispstr"], valstr, field["_apl_defstr"])

	def _apl_generate_field_choice(self, field, tab=""):
		tclstr = ""
		retstr = ""

		if 'create_list' in field.keys():
			tclstr = """ tcl {
		tmsh::cd /
		set results ""
	    set cmds [list %s]
	    foreach cmd $cmds {
	      set objs [list]
	      set objs_status [catch {tmsh::get_config $cmd recursive} objs]
	      if { $objs_status == 1 } { continue }
	      foreach obj $objs {
	      	set name [string map {"\\\"" ""} [tmsh::get_name $obj]]
	      	if { $name ne "" } {
		        append results \"/$name\"
		        append results \"\\n\"
		    }
	      }
	    }
	    return $results
	}
		""" % ' '.join(field["create_list"])

		if 'glob' in field.keys():
			types = {}
			filenames = []
			field['choices'] = []
			files = []

			for	globitem in field["glob"]:
				if os.sep != "/":
					globitem["path"] = globitem["path"].replace("/","\\")

				files = glob.glob("%s%s%s" % (self.options["bundledir"], os.sep, globitem["path"]))
				for filename in files:
					name_parts = filename.split(os.sep)
					file_parts = name_parts[-1].split('.')
					filenames.append(file_parts[0])
					types[file_parts[0]] = globitem["prefix"]

			if len(filenames) > 0:
				for choice in filenames:
					field['choices'].append('%s%s' % (types.get(choice), choice))

		if len(tclstr) > 0:
			return "\t%s%s %s%s%s%s%s" % (tab, field["type"], field["name"], field["_apl_reqstr"], field["_apl_dispstr"], field["_apl_defstr"], tclstr)
		else:
			if len(field['choices']) == 0:
				field['choices'].append('** no bundled items **')

			retstr += "\t%s%s %s%s%s%s {\n" % (tab, field["type"], field["name"], field["_apl_reqstr"], field["_apl_dispstr"], field["_apl_defstr"])
			retstr += ",\n".join(['\t\t{0}"{1}"'.format(tab, x) for x in field["choices"]])
			retstr += "\n\t%s}" % tab
			return retstr

	def _apl_generate_field_editchoice(self, field, tab=""):
		return self._apl_generate_field_choice(field, tab)

	def _apl_generate_field_dynamic_filelist_multi(self, field, tab=""):
		types = {}
		filenames = []
		retstr = ""

		for	globitem in field["glob"]:
			if os.sep != "/":
				globitem["path"] = globitem["path"].replace("/","\\")

			files = glob.glob("%s%s%s" % (self.options["bundledir"], os.sep, globitem["path"]))
			for filename in files:
				name_parts = filename.split(os.sep)
				file_parts = name_parts[-1].split('.')
				filenames.append(file_parts[0])
				types[file_parts[0]] = globitem["prefix"]

		retstr += "\t%smultichoice %s%s%s%s {" % (tab, field["name"], field["_apl_reqstr"], field["_apl_dispstr"], field["_apl_defstr"])
		if len(filenames) > 0:
			for choice in filenames[:-1]:
	  			retstr += "\t\t%s\"%s%s\"," % (tab, types.get('%s' % choice), choice)
			else:
	  			retstr += "\t\t%s\"%s%s\"" % (tab, types.get('%s' % filenames[-1]), filenames[-1])
	  	else:
	  		retstr += "\t\t%s\"** no bundled items **\"" % tab
		retstr += "\t%s}" % tab
		return retstr

	def _apl_generate_field (self, field, section, tab):
		apl_field = ""
		if ('uivisible' not in field.keys()):
			field["uivisible"] = True

		field["_apl_reqstr"] = ""
		if ('required' in field.keys() and field["required"] == True):
			field["_apl_reqstr"] = " required"

		field["_apl_defstr"] = ""
		if 'default' in field.keys():
			field["_apl_defstr"] = " default \"%s\"" % field["default"]

		field["_apl_dispstr"] = ""
		field["_apl_dispstr"] = " display \"large\" "
		if 'display' in field.keys():
			field["_apl_dispstr"] = " display \"%s\"" % field["display"]

		self._debug("VALIDATOR type=%s keys=%s" % (field["type"], self._apl_validators.keys()))
		if field["type"] in self._apl_validators.keys():
			field["_apl_validator"] = self._apl_validators[field["type"]]
			field["type"] = 'string'
			self._debug("VALIDATOR pre field=%s v=%s" % (field["type"], field["_apl_validator"]))

		if field["type"] == "text":
			field["_apl_text"] = ("\t%s.%s \"%s\" \"%s\"\n" % (section, field["name"], field["description"], field["text"]))
		else:
			field["_apl_text"] = ("\t%s.%s \"%s\"\n" % (section, field["name"], field["description"]))


		func_name = '_apl_generate_field_%s' % field["type"]
		self._debug("field=%s" % field)
		if hasattr(AppSvcsBuilder, func_name):
			apl_field = getattr(AppSvcsBuilder, func_name)(self, field, tab)
		else:
			print "Invalid APL Field Type: %s field=%s section=%s" % (field["type"], field["name"], section)
			sys.exit(1)

		if field['uivisible'] == True:
			 return apl_field + '\n'
		else:
			return "optional (\"dont\" == \"show\") {\n %s \n}\n" % apl_field

	def createBundledResources(self):
		resources = []

		print "Building bundled resources:"
		fh = self._safe_open(os.path.join(self.options["workingdir"], self.options["tempdir"],'bundler.build'), "wt")
		print " Adding iRules (%sirules/*.irule)..." % (self.options["bundledir"])
		files = glob.glob(os.path.join(self.options["bundledir"],'irules','*.irule'))

		print " Adding ASM policies (%sasm_policies/*.xml)..." % (self.options["bundledir"])
		files += glob.glob(os.path.join(self.options["bundledir"], 'asm_policies','*.xml'))

		print " Adding APM policies (%sapm_policies/*.tar.gz)..." % (self.options["bundledir"])
		files += glob.glob(os.path.join(self.options["bundledir"],'apm_policies','*.tar.gz'))

		if len(files) == 0:
			print "  no files found"
			fh.write("\n")
			return

		fh.write("array set bundler_objects {}\n")
		fh.write("array set bundler_data {}\n")
		for filename in files:
			print " Processing file: %s" % filename
			filetype = ""
			apm_bip_version = ['1']
			name_parts = filename.split(os.sep)
			file_parts = name_parts[-1].split('.')
			just_name = file_parts[0]
			if re.match( r'.*irules.*irule$', filename): filetype = 'irule'
			if re.match( r'.*asm.*xml$', filename): filetype = 'asm'
			if re.match( r'.*apm.*.tar.gz$', filename): filetype = 'apm'

			if filetype == "":
				print "[fatal] Could not determine the type of object for bundled file '%s'" % filename
				sys.exit(1)

			if filetype == "apm":
				with gzip.open(filename, 'rb') as gz:
					apm_raw = gz.read()
					apm_bip_version = re.findall(r'^\#F5\[Version:(.*)\]', apm_raw, re.MULTILINE)
					if len(apm_bip_version) != 1:
						print "[fatal] Could not determine BIG-IP TMOS version for bundled APM file '%s'" % filename
						sys.exit(1)
					gz.close()
					print "  Found BIG-IP Version: %s" % apm_bip_version[0]
			infile = self._safe_open(filename, "rb")
			key = "%s:%s" % (filetype, just_name)
			resources.append({
				"key":key,
				"ver":apm_bip_version[0],
				"data":base64.b64encode(infile.read())
				})

		#self._debug("resources=%s" % resources)

		for r in resources:
			fh.write("set bundler_objects(%s) %s\n" % (r["key"], r["ver"]))

		fh.write('\n')

		for r in resources:
			fh.write("set bundler_data(%s) {%s}\n" % (r["key"], r["data"]))

		fh.close()

	def buildDocVersion(self, **kwargs):
		self._debug("in buildDocVersion")
		if bool(kwargs):
			self.__init__(**kwargs)

		self._debug("buildDocVersion options=%s" % self.options)

		ver = self._safe_open(os.path.join(self.options["workingdir"],self.options["docsdir"],'VERSION'), "wt")
		ver.write(json.dumps(self.buildinfo))
		ver.close()

	def buildDoc(self, **kwargs):
		self._debug("in buildDoc")

		if bool(kwargs):
			self.__init__(**kwargs)

		self._debug("buildDoc options=%s" % self.options)

		self.buildDocVersion(**kwargs)

		fh = self._safe_open(os.path.join(self.options["workingdir"],self.options["docsdir"],'presoref.rst'), "wt")
		fh.write("Presentation Layer Reference\n")
		fh.write("============================\n\n")

		self._doc_RST_generate(fh)

	def buildAPL(self, **kwargs):
		self._debug("in buildAPL")

		if bool(kwargs):
			self.__init__(**kwargs)

		self._debug("buildAPL options=%s" % self.options)

		fh = self._safe_open(os.path.join(self.options["workingdir"], self.options["tempdir"],'apl.build'), "wt")

		for section in self.pres_data["sections"]:
			fh.write("section %s {\n" % section["name"])
			section["_apl_text"] = "\t%s \"%s\"\n" % (section["name"], section["description"])
			for field in section["fields"]:
				if field["type"] != "table":
					fh.write(self._apl_generate_field(field, section["name"], ""))
				else:
					field["_apl_text"] = "\t%s.%s \"%s\"\n" % (section["name"], field["name"], field["description"])

					if ('uivisible' in field.keys() and field["uivisible"] == False):
						fh.write("optional (\"dont\" == \"show\") {\ntable %s {\n" % field["name"])
					else:
						fh.write("\ttable %s {\n" % field["name"])

					for table_field in field["fields"]:
						fh.write(self._apl_generate_field(table_field, "%s.%s" % (section["name"], field["name"]), "\t"))

					if ('uivisible' in field.keys() and field["uivisible"] == False):
						fh.write("\t}\n}\n")
					else:
						fh.write("\t}\n")

			fh.write("}\n\n")
			#text.append("")

		fh.write("\ntext {\n")

		#for descr in text:
		#	print "%s" % descr

		for section in self.pres_data["sections"]:
			fh.write(section["_apl_text"])
			for field in section["fields"]:
				fh.write(field["_apl_text"])
				if field["type"] == "table":
					for table_field in field["fields"]:
						fh.write(table_field["_apl_text"])
			fh.write("\n")
		fh.write("}\n")

	def buildTemplate(self, **kwargs):
		self._debug("in buildTmpl")

		if bool(kwargs):
			self.__init__(**kwargs)

		self._debug("buildTemplate options=%s" % self.options)

		self.createBundledResources()
		print "Writing to file: %s" % self.options["outfile_fn"]

		out = self._safe_open(self.options["outfile_fn"], "wt")
		main = self._safe_open(os.path.join(self.options["workingdir"],self.options["roottmpl"]))

		final = self._tmpl_process_file(main, out)
		out.write(''.join(final))

		out.close()
		main.close()
