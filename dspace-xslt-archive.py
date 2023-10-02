#!/usr/bin/python3

import os, sys

from dspacearchive import DspaceArchive

"""
Set Variables
"""
# handles of all collections in lx86
handles = {'article':'20.500.12034/6', 'bachelorThesis':'20.500.12034/723', 
			'book':'20.500.12034/4', 'bookPart':'20.500.12034/586',
			'code':'20.500.12034/721', 'conferenceObject':'20.500.12034/7', 
			'courseMaterial':'20.500.12034/8', 'doctoralThesis':'20.500.12034/724',
			'habilitationTreatise':'20.500.12034/725', 'image':'20.500.12034_627',
			'masterThesis':'20.500.12034/10', 'movingImage':'20.500.12034/626',
			'other':'20.500.12034/720', 'preprint':'20.500.12034/718',
			'preregistration':'20.500.12034/736', 'report':'20.500.12034/9',
			'researchData':'20.500.12034/576', 'review':'20.500.12034/719',
			'sound':'20.500.12034/722', 'test':'20.500.12034/12'}

# {'schema': 'XSLT file'}
xsl_files = {'dc': 'xoai_to_dc-psycharchives.xsl', 'zpid': 'xoai_to_zpid-psycharchives.xsl'}

# For writing the file `collections`
collection = handles['article']


"""
Start Workflow
"""
if len(sys.argv) != 2:
	print("Usage: python dspace-xslt-archive.py [Directory-make_simple_archive_format]")
	sys.exit()

input_base_path = sys.argv[1]
output_path = input_base_path + "_saf"
print(output_path)

archive = DspaceArchive(input_base_path, xsl_files, collection)

archive.write(output_path)
archive.zip(output_path, output_path)
