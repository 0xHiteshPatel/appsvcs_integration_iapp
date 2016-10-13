#!/usr/bin/python

# Read The Docs setup.py script to auto-build presoref.rst

import sys
import os
import argparse

sys.path.insert(0, os.path.abspath('../%ssrc' % os.sep))

from AppSvcsBuilder import AppSvcsBuilder

options = {
	'preso': os.path.join('src','presentation_layer.json'),
	'impl': os.path.join('src','implementation_layer.tcl'), 
	'workingdir': "../", 
	'bundledir': 'bundled', 
	'outfile': None, 
	'docsdir': 'docs/', 
	'append': "", 
	'roottmpl': os.path.join('src','master.template'),
	'debug':False,
	'github_root':'https://www.github.com/0xHiteshPatel/appsvcs_integration_iapp/',
	'github_tag':'',
	'github_url':'',
	'debug':True
}

b = AppSvcsBuilder(**options)

b.buildDoc()
