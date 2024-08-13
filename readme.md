DSpace Simple Archive Format
====================
* Code derives from _dspace-csv-archive_ https://github.com/lib-uoguelph-ca/dspace-csv-archive
* Uses XSLT to transform input XML documents into required XML documents.
* Brings the files and XML documents into the DSpace Simple Archive Format.

SaxonC-HE
-------------------
* Uses SaxonC-HE for the XSLT transformations
* Installation Instructions: https://pypi.org/project/saxonche/
* Documentation: https://www.saxonica.com/saxon-c/doc11/html/saxonc.html

Example Structure: 
-----------
```
.
├── dspace-xslt-archive.py
├── dspacearchive.py
├── item.py
├── make_simple_archive_format
│   ├── PDF
│   │   ├── document_1.pdf
│   │   ├── document_2.pdf
│   │   └── document_3.pdf
│   └── XML
│       ├── document_1.xml
│       ├── document_2.xml
│       └── document_3.xml
├── dc_schema.xsl
└── zpid_schema.xsl
```

Some Simple Rules:
---------------------
* Usage: ./dspace-xslt-archive.py `make_simple_archive_format`
* Puts XSLT files (for Dublin Core and ZPID Schema) in the directory, where all the *.py files are (as in the structure above)
* Directory `make_simple_archive_format` contains two subdirectories `PDF-A` and `XML`
	* `PDF-A` contains all files (bitstreams) for batch import
	* `XML` contains metadata of the files (bitstreams) in XML
* Sets variables `xsl_files` and `collection` in `dspace-xslt-archive.py`
* **NOTE:**
	* The name of the directory `make_simple_archive_format` does not matter, but the names of its subdirectories must be `PDF-A` and `XML`.
	* The PDF files and their corresponding XML documents must contain the same `file_basename` (e.g. `32302` in `003-003 32302.pdf` and `8454-32302.xml`).
    ```
    file_basename = re.search("\d+.pdf", pdf_filename)
    file_basename = file_basename.group()
    file_basename = file_basename[:-4]
    ```


Simple Archive Format (Example): 
-----------
```
make_simple_archive_format_saf
├── document_1
│   ├── collections
│   ├── contents
│   ├── document_1.pdf
│   ├── dublin_core.xml
│   └── metadata_zpid.xml
├── document_2
│   ├── collections
│   ├── contents
│   ├── document_2.pdf
│   ├── dublin_core.xml
│   └── metadata_zpid.xml
└── document_3
    ├── collections
    ├── contents
    ├── document_3.pdf
    ├── dublin_core.xml
    └── metadata_zpid.xml
```
* DSpace 7 Documentation: https://wiki.lyrasis.org/display/DSDOC7x/Importing+and+Exporting+Items+via+Simple+Archive+Format

     