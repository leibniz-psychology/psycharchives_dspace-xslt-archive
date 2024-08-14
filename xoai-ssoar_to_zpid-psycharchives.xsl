<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:doc="http://www.lyncode.com/xoai"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>




    <xsl:template match="/">
        <dublin_core schema="zpid">
            <xsl:call-template name="get_journaltitle"/>
            <xsl:call-template name="get_volume"/>
            <xsl:call-template name="get_issue"/>
            <xsl:call-template name="get_pages"/>
            <xsl:call-template name="get_visible_tag"/>

        </dublin_core>
    </xsl:template>

    <xsl:template name="get_journaltitle">
        <dcvalue element="primarypublication" qualifier="journaltitle">
            <xsl:value-of
                select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'source']/doc:element[@name = 'journal']/doc:element/doc:field[@name = 'value']"
            />
        </dcvalue>
    </xsl:template>

    <xsl:template name="get_volume">
        <dcvalue element="primarypublication" qualifier="volume">
            <xsl:value-of
                select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'source']/doc:element[@name = 'volume']/doc:element/doc:field[@name = 'value']"
            />
        </dcvalue>
    </xsl:template>

    <xsl:template name="get_issue">
        <xsl:if
            test="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'source']/doc:element[@name = 'issue']/doc:element/doc:field[@name = 'value']">
            <dcvalue element="primarypublication" qualifier="issue">
                <xsl:value-of
                    select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'source']/doc:element[@name = 'issue']/doc:element/doc:field[@name = 'value']"
                />
            </dcvalue>
        </xsl:if>
    </xsl:template>

    <xsl:template name="get_pages">
        <xsl:if
            test="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'source']/doc:element[@name = 'pageinfo']/doc:element/doc:field[@name = 'value']">
            <dcvalue element="primarypublication" qualifier="pages">
                <xsl:value-of
                    select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'source']/doc:element[@name = 'pageinfo']/doc:element/doc:field[@name = 'value']"
                />
            </dcvalue>
        </xsl:if>
    </xsl:template>

    <xsl:template name="get_visible_tag">
        <xsl:variable name="publication_status">
            <xsl:value-of
                select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'description']/doc:element[@name = 'pubstatus']/doc:element/doc:field[@name = 'value']"
            />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$publication_status = 'Published Version'">
                <dcvalue element="tags" qualifier="visible">Version of Record</dcvalue>
            </xsl:when>
            <xsl:when test="$publication_status = 'Postprint'">
                <dcvalue element="tags" qualifier="visible">Accepted Manuscript</dcvalue>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
