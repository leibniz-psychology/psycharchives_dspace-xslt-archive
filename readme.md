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
├── jats_to_dc-psycharchives.xslt
├── jats_to_zpid-psycharchives.xslt
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
* Puts XSLT files (e.g. Dublin Core and ZPID Schema) in the directory, where all the *.py files are (as in the structure above)
* Sets variables `xsl_files` in `dspace-xslt-archive.py`
* **NOTE:** It is possible to use other Schema in DSpace, but make sure you have defined the new schema in the DSpace Metadata Schema Registry.
    * `jats_to_dc-psycharchives.xslt` --> XSLT for converting JATS XML to PsychArchives Dublin Core Schema
    * `jats_to_zpid-psycharchives.xslt` --> XSLT for converting JATS XML to PsychArchives ZPID Schema
* Directory `make_simple_archive_format` contains two subdirectories `PDF-A` and `XML`
	* `PDF-A` contains all files (bitstreams) for batch import
	* `XML` contains metadata of the files (bitstreams) in XML
* **NOTE:**
    * `collections` file contains the handle of the owning collection. The owning collection is the **FIRST** dc.type in the PsychArchives XML
	* The name of the directory `make_simple_archive_format` does not matter, but the names of its subdirectories must be `PDF-A` and `XML`.
	* The PDF files and their corresponding XML documents must contain the same `file_basename` (e.g. `32302` in `003-003 32302.pdf` and `8454-32302.xml`).
    * Output directory = 'Input_Directory' + 'saf' and subdirectories (item directores) are identical with the `file_basename`


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
* DSpace 7 Documentation - Importing and Exporting Items via Simple Archive Format (SAF): https://wiki.lyrasis.org/pages/viewpage.action?pageId=104566653

     