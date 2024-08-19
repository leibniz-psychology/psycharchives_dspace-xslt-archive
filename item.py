"""
A representation of an item in DSpace.

An item has a collection of files (aka Bitstreams) and a number of metadata name value pairs. 
"""

class Item:

    def __init__(self, file_basename, pdf_filename, xml_filename):
        self.basename = file_basename
        self.pdf = pdf_filename # a list of PDF/A filenames (type: array), because an item can contain more than one bitstreams
        self.xml = xml_filename

        