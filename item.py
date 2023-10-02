"""
A representation of an item in DSpace.

An item has a collection of files (aka Bitstreams) and a number of metadata name value pairs. 
"""

class Item:

    def __init__(self, file_basename):
        self.basename = file_basename
        self.pdf = file_basename + ".pdf"
        self.xml = file_basename + ".xml"

        