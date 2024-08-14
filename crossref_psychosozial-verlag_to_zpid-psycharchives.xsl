<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:crossref_api = "http://www.crossref.org/qrschema/3.0"
    xmlns:crossref = "http://www.crossref.org/xschema/1.1"
    xmlns="http://purl.org/dc/elements/1.1/"
    version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <dublin_core schema="zpid">
            <xsl:call-template name="get_journaltitle"/>      
            <xsl:call-template name="get_volume"/>
            <xsl:call-template name="get_issue"/>
            <xsl:call-template name="get_pages"/>
            <dcvalue element="tags" qualifier="visible">Version of Record</dcvalue>
        </dublin_core>
    </xsl:template>
    
    <xsl:template name="get_journaltitle">
        <dcvalue element="primarypublication" qualifier="journaltitle">
            <xsl:value-of select="//crossref:journal_metadata/crossref:full_title"/>
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_volume">
        <dcvalue element="primarypublication" qualifier="volume">
            <xsl:value-of
                select="//crossref:journal_volume/crossref:volume"
            />
            
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_issue">
        <dcvalue element="primarypublication" qualifier="issue">
            <xsl:value-of
                select="//crossref:issue"
            />
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_pages">
        <dcvalue element="primarypublication" qualifier="pages">
            <xsl:value-of select="concat(//crossref:pages/crossref:first_page, '-', //crossref:pages/crossref:last_page)"/>
        </dcvalue>
    </xsl:template>
</xsl:stylesheet>