<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <dublin_core schema="zpid">
            <dcvalue element="primarypublication" qualifier="journaltitle">Journal für Psychologie</dcvalue>
            <xsl:call-template name="get_volume"/>
            <xsl:call-template name="get_issue"/>
            <xsl:call-template name="get_pages"/>
            <dcvalue element="tags" qualifier="visible">Version of Record</dcvalue>
        </dublin_core>
    </xsl:template>
    
    <xsl:template name="get_volume">
        <dcvalue element="primarypublication" qualifier="volume">
            <xsl:value-of
                select="substring(oai:record/oai:metadata/oai_dc:dc/dc:source[@xml:lang='de-DE'], 30, 2)"
            />
   
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_issue">
            <dcvalue element="primarypublication" qualifier="issue">
                <xsl:value-of
                    select="substring(oai:record/oai:metadata/oai_dc:dc/dc:source[@xml:lang='de-DE'], 37, 1)"
                />
            </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_pages">
        <xsl:if
            test="matches(oai:record/oai:metadata/oai_dc:dc/dc:source[@xml:lang='de-DE'], '\d+-\d+')">
            <dcvalue element="primarypublication" qualifier="pages">
                <xsl:for-each select="tokenize(oai:record/oai:metadata/oai_dc:dc/dc:source[@xml:lang='de-DE'], '; ')">
                    <xsl:if test="matches(., '\d+-\d+')">
                        <xsl:value-of
                            select="."
                        />
                    </xsl:if>
                </xsl:for-each>
            </dcvalue>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>