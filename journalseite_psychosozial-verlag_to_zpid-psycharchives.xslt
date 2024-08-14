<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://purl.org/dc/elements/1.1/"
    version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <dublin_core schema="zpid">
            <xsl:call-template name="get_journaltitle"/>
            <xsl:call-template name="get_issue"/>
            <xsl:call-template name="get_pages"/>
            <dcvalue element="tags" qualifier="visible">Version of Record</dcvalue>
        </dublin_core>
    </xsl:template>
    
    <xsl:template name="get_journaltitle">
        <dcvalue element="primarypublication" qualifier="journaltitle">
            <xsl:value-of select="//meta[@name = 'DC.Source']/@content"/>
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_issue">
        <dcvalue element="primarypublication" qualifier="issue">
            <xsl:value-of
                select="//meta[@name = 'DC.Source.Issue']/@content"
            />
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_pages">
        <xsl:if test="//meta[@name = 'DC.Identifier.pageNumber']">
            <dcvalue element="primarypublication" qualifier="pages">
                <xsl:value-of
                    select="//meta[@name = 'DC.Identifier.pageNumber']/@content"
                />
            </dcvalue>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>