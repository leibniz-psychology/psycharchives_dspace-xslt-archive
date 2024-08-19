"""
This class handles the creation of a DSpace simple archive suitable for import into a dspace repository. 
For more information about the DSpace Simple Archive format,
See: https://wiki.lyrasis.org/display/DSDOC7x/Importing+and+Exporting+Items+via+Simple+Archive+Format 
"""

import os
import re
from item import Item
from saxonche import *
import xml.etree.ElementTree as ET
from shutil import copy, make_archive

class DspaceArchive:

    """
    Constructor:

    The constructor takes a path to a csv file. 
    It then parses the file, creates items, and adds the items to the archive.  
    """
    def __init__(self, input_base_path, xsl_files):
        self.items = []
        self.input_base_path = input_base_path
        self.xsl_files = xsl_files

        """
        Extract file_basename from XML filename
        @pdf_files: An Array which contains all bitstreams of an item. An item can contain more than one bitstreams (PDF/A files).
        @file_basename: Both XML and PDF must contain the same @file_basename, so that they can be matched
        """
        if os.path.exists(os.path.join(self.input_base_path, 'XML')):
            for xml_filename in os.listdir(os.path.join(self.input_base_path, 'XML')):
                # file_basename = xml_filename[:-4] # Remove '.xml'
                file_basename = xml_filename[:-5] # Remove '.html'
                # file_basename = file_basename.split('-')[1] # e.g. '8494-34111' --> '34111'

                pdf_files = [] # An item can contain more than one file (bitstream)
                for pdf_filename in os.listdir(os.path.join(self.input_base_path, 'PDF-A')):
                    # filename = re.search("\d+.pdf", pdf_filename) # Involve the filename pattern of Psychosozial-Verlag, e.g. '070-089 34088.pdf' get '34088.pdf' @return a Match object
                    # filename = filename.group() # @return the part of the string where there was a match
                    if (file_basename in pdf_filename[:-4]): # Remove '.pdf'
                        pdf_files.append(pdf_filename)

                item = Item(file_basename, pdf_files, xml_filename)
                self.addItem(item)
        

    """
    Add an item to the archive. 
    """
    def addItem(self, item):
        self.items.append(item)

    """
    Get an item from the archive.
    """
    def getItem(self, index):
        return self.items[index]


    """
    Write the archive to disk in the format specified by the DSpace Simple Archive format.
    """
    def write(self, dir = "."):
        self.create_directory(dir)

        for index, item in enumerate(self.items):

            #item directory
            item_path = os.path.join(dir, item.basename)
            self.create_directory(item_path)
            print("====== Writing Item_%03d: " % (int(index) + 1), item_path, " ======")
            
            #metadata file(s)
            self.writeMetadata(item, item_path)

            #content files (aka bitstreams)
            self.copyFiles(item, item_path)

            #collections_file
            self.writeCollectionsFile(item_path)

            #contents file
            self.writeContentsFile(item, item_path)


    """
    Create a zip file of the archive. 
    """
    def zip(self, output_filename, dir_name = None):
        make_archive(output_filename, 'zip', dir_name)

    """
    Create a directory if it doesn't already exist.
    """
    def create_directory(self, path):
        if not os.path.isdir(path):
            os.mkdir(path)

    """
    Create a contents file that contains a lits of bitstreams, one per line. 
    """
    def writeContentsFile(self, item, item_path):
        for pdf_filename in item.pdf:
            contents_file = open(os.path.join(item_path, 'contents'), "a")
            contents_file.write(pdf_filename + "\n")
            contents_file.close()

    """
    Create a collections file that contains the collection(s) for an item
    """
    def writeCollectionsFile(self, item_path):
        # handles of all collections in lx86
        handles = {'article':'20.500.12034/6', 'bachelorThesis':'20.500.12034/723', 
			'book':'20.500.12034/4', 'bookPart':'20.500.12034/586',
			'code':'20.500.12034/721', 'conferenceObject':'20.500.12034/7', 
			'courseMaterial':'20.500.12034/8', 'doctoralThesis':'20.500.12034/724',
			'habilitationTreatise':'20.500.12034/725', 'image':'20.500.12034/627',
			'masterThesis':'20.500.12034/10', 'movingImage':'20.500.12034/626',
			'other':'20.500.12034/720', 'preprint':'20.500.12034/718',
			'preregistration':'20.500.12034/736', 'report':'20.500.12034/9',
			'researchData':'20.500.12034/576', 'review':'20.500.12034/719',
			'sound':'20.500.12034/722', 'test':'20.500.12034/12'}
        
        # Get the FIRST 'dc.type' from PsychArchives XML
        namespace = {'dc': 'http://purl.org/dc/elements/1.1/'}
        tree = ET.parse(os.path.join(item_path, 'dublin_core.xml'))
        root = tree.getroot()
        dc_type = root.find("./dc:dcvalue[@element='type']", namespace)
        collection = handles[dc_type.text]

        # Write the handle of the FIRST dc.type into collections file
        collections_file = open(os.path.join(item_path, 'collections'), "w")
        collections_file.write(collection)
        collections_file.close()

    """
    Copy the files that are referenced by an item to the item directory in the DSPace simple archive. 
    """
    def copyFiles(self, item, item_path):
        for pdf_filename in item.pdf:
            copy(os.path.join(self.input_base_path, 'PDF-A' , pdf_filename), item_path)

    """
    Convert input XML documents into PsychArchives Metadata Schema
    """
    def writeMetadata(self, item, item_path):
        with PySaxonProcessor(license=False) as proc:
            xsltproc = proc.new_xslt30_processor()
            for schema, stylesheet in self.xsl_files.items():
                executable = xsltproc.compile_stylesheet(stylesheet_file=stylesheet, version='2.0')
                executable.set_initial_match_selection(file_name=os.path.join(self.input_base_path, 'XML' , item.xml))
                executable.set_global_context_item(file_name=os.path.join(self.input_base_path, 'XML' , item.xml))  # Set the global context item for the transformation. (Enable the use of global variables in XSLT)

                # It is possible to have Dublin Core and further schemas
                if schema == 'dc':
                    xml_filename = 'dublin_core.xml'
                else:
                    xml_filename = 'metadata_' + schema + '.xml'

                executable.apply_templates_returning_file(output_file=os.path.join(item_path, xml_filename))