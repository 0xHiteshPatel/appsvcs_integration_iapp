#!/usr/bin/python

import sys
import os
import argparse

sys.path.insert(0, os.path.abspath('.%ssrc' % os.sep))

from AppSvcsBuilder import AppSvcsBuilder

parser = argparse.ArgumentParser(description='Build script for the App Service Integration iApp template')
parser.add_argument("-a", "--append", default="", help="A string to append to the base template name")
parser.add_argument("-b", "--bundledir", default="bundled"+os.sep, help="The directory to use for bundled resources")
parser.add_argument("-d", "--docsdir", default="docs"+os.sep, help="The root directory for documentation")
parser.add_argument("-D", "--debug", default=False, action="store_true", help="Enable debug output")
parser.add_argument("-nd", "--nodocs", default=False, action="store_true", help="Do not build the documentation")
parser.add_argument("-o", "--outfile", help="The name of the output file")
parser.add_argument("-p", "--preso", default="src"+os.sep+"presentation_layer.json", help="The presentation layer JSON schema")
parser.add_argument("-r", "--roottmpl", default="src"+os.sep+"master.template", help="The root template file to use (default: <basedir>/src/master.template")
parser.add_argument("-w", "--workingdir", default=os.getcwd(), help="The root directory of source tree")
parser.add_argument("-x", "--extended", default=False, action="store_true", help="Enable extended build output")

args = parser.parse_args()

b = AppSvcsBuilder(**vars(args))

if not os.path.isdir(args.workingdir + os.sep + 'tmp'):
	os.mkdir('tmp')

if not os.path.isdir(args.workingdir + os.sep + 'parts'):
	os.mkdir('parts')

if len(args.append) > 0:
	print "Appending \"%s\" to template name" % args.append

print "Generating APL..."
b.buildAPL()

print "Assembling main template..."
b.buildTemplate()

if not args.extended:
	null = open(os.devnull, 'w')
	sys.stdout = null

print "Assembling TCL only template..."
args.outfile = 'parts' + os.sep + 'iapp.tcl'
args.roottmpl = 'src' + os.sep + 'implementation_only.template'
b.buildTemplate(**vars(args))

print "Assembling APL only template..."
args.outfile = 'parts' + os.sep + 'iapp.apl'
args.roottmpl = 'tmp' + os.sep + 'apl.build'
b.buildTemplate(**vars(args))

if not args.extended:
	sys.stdout = sys.__stdout__

if not args.nodocs:
	print "Generating docs..."
	os.system("cd docs && make clean && make html && cd ..")

os.remove(os.path.join('tmp','apl.build'))
os.remove(os.path.join('tmp','bundler.build'))
os.rmdir('tmp')

print "Finished building"
