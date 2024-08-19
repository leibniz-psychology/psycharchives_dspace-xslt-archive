#!/usr/bin/python3

import os, sys

from dspacearchive import DspaceArchive

"""
Set Variables
"""
# {'schema': 'XSLT file'}
# xsl_files = {'dc': 'xoai-ssoar_to_dc-psycharchives.xsl', 'zpid': 'xoai-ssoar_to_zpid-psycharchives.xsl'}
# xsl_files = {'dc': 'jats-psychosozial-verlag_to_dc-psycharchives.xslt', 'zpid': 'jats-psychosozial-verlag_to_zpid-psycharchives.xslt'}
# xsl_files = {'dc': 'oai_dc-journal_fuer_psychologie_to_dc-psycharchives.xsl', 'zpid': 'oai_dc-journal_fuer_psychologie_to_zpid-psycharchives.xsl'}
xsl_files = {'dc': 'journalseite_psychosozial-verlag_to_dc-psycharchives.xslt', 'zpid': 'journalseite_psychosozial-verlag_to_zpid-psycharchives.xslt'}
# xsl_files = {'dc': 'crossref_psychosozial-verlag_to_dc-psycharchives.xsl', 'zpid': 'crossref_psychosozial-verlag_to_zpid-psycharchives.xsl'}

"""
Start Workflow
"""
if len(sys.argv) != 2:
	print("Usage: python3 dspace-xslt-archive.py [Directory:make_simple_archive_format]")
	sys.exit()

input_base_path = sys.argv[1]
if input_base_path[-1] == '/':	# chop off the end character "/", if provided as part of the directory name
	input_base_path = input_base_path[:-1]

output_path = input_base_path + "_saf"

archive = DspaceArchive(input_base_path, xsl_files)

archive.write(output_path)
archive.zip(output_path, output_path)
