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
        <dublin_core schema="dc">
            <xsl:call-template name="get_authors"/>
            <xsl:call-template name="get_issued_date"/>
            <xsl:call-template name="get_abstract"/>
            <xsl:call-template name="get_publisher"/>
            <dcvalue element="description" qualifier="pubstatus">publishedVersion</dcvalue>
            <dcvalue element="description" qualifier="review">peerReviewed</dcvalue>
            <dcvalue element="identifier" qualifier="issn">2198-6959</dcvalue>
            <dcvalue element="identifier" qualifier="issn">0942-2285</dcvalue>
            <xsl:call-template name="get_content_language"/>
            <xsl:call-template name="get_relation_isversionof"></xsl:call-template>
            <dcvalue element="rights">openAccess</dcvalue>
            <dcvalue element="rights" qualifier="license">CC BY-NC-ND 4.0</dcvalue>
            <dcvalue element="rights" qualifier="uri">https://creativecommons.org/licenses/by-nc-nd/4.0/</dcvalue>
            <xsl:call-template name="get_subject_keywords"/>
            <dcvalue element="subject" qualifier="ddc">150</dcvalue>
            <xsl:call-template name="get_article_title"/>
            <dcvalue element="type">article</dcvalue>
        </dublin_core>
    </xsl:template>
    
    <xsl:template name="get_authors">
        <xsl:choose>
            <xsl:when test="oai:record/oai:metadata/oai_dc:dc/dc:creator">
                <xsl:for-each
                    select="oai:record/oai:metadata/oai_dc:dc/dc:creator">
                    <dcvalue element="contributor" qualifier="author">
                        <xsl:value-of select="."/>
                    </dcvalue>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <dcvalue element="contributor" qualifier="other">Journal für Psychologie</dcvalue>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="get_issued_date">
        <dcvalue element="date" qualifier="issued">
            <xsl:value-of
                select="oai:record/oai:metadata/oai_dc:dc/dc:date"
            />
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_abstract">
        <xsl:choose>
            <xsl:when
                test="oai:record/oai:metadata/oai_dc:dc/dc:description">
                <xsl:for-each
                    select="oai:record/oai:metadata/oai_dc:dc/dc:description">
                    <dcvalue element="description" qualifier="abstract">
                        <xsl:attribute name="language">
                            <xsl:call-template name="lang_4letter">
                                <xsl:with-param name="lang" select="./@xml:lang"></xsl:with-param>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                    </dcvalue>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <dcvalue element="description" qualifier="abstract" language="en">No abstract available.</dcvalue>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="get_publisher">
        <dcvalue element="publisher"><xsl:value-of select="oai:record/oai:metadata/oai_dc:dc/dc:publisher"/></dcvalue>
    </xsl:template>
    
    <xsl:template name="get_content_language">
        <dcvalue element="language" qualifier="iso">
            <xsl:value-of select="oai:record/oai:metadata/oai_dc:dc/dc:language"/>
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_relation_isversionof">        
        <dcvalue element="relation" qualifier="isversionof">
            <xsl:variable name="url">
                <xsl:call-template name="get_url"/>
            </xsl:variable>
            <xsl:variable name="doi">
                <xsl:call-template name="get_doi"/>                 
            </xsl:variable>
                 
            <xsl:choose>
                <xsl:when test="$doi != ''">
                    <xsl:value-of select="$doi"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$url"/>
                </xsl:otherwise>
            </xsl:choose>
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_article_title">
        <xsl:variable name="lang_iso">
            <xsl:choose>
                <xsl:when test="oai:record/oai:metadata/oai_dc:dc/dc:language = 'deu'">
                    <xsl:value-of select="'de-DE'"/>
                </xsl:when>
                <xsl:when test="oai:record/oai:metadata/oai_dc:dc/dc:language = 'eng'">
                    <xsl:value-of select="'en-US'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="origin_title" select="oai:record/oai:metadata/oai_dc:dc/dc:title[@xml:lang = $lang_iso]"/>
        <xsl:for-each
            select="oai:record/oai:metadata/oai_dc:dc/dc:title">
            <xsl:choose>
                <xsl:when test="./@xml:lang = $lang_iso">
                    <dcvalue element="title">
                        <xsl:attribute name="language">
                            <xsl:call-template name="lang_4letter">
                                <xsl:with-param name="lang" select="./@xml:lang"></xsl:with-param>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                    </dcvalue>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test=". != $origin_title">
                        <dcvalue element="title" qualifier="alternative">
                            <xsl:attribute name="language">
                                <xsl:call-template name="lang_4letter">
                                    <xsl:with-param name="lang" select="./@xml:lang"/>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                        </dcvalue>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="get_subject_keywords">
        <xsl:for-each select="oai:record/oai:metadata/oai_dc:dc/dc:subject">
            <dcvalue element="subject">
                <xsl:attribute name="language">
                    <xsl:call-template name="lang_4letter">
                        <xsl:with-param name="lang" select="./@xml:lang"/>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </dcvalue>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name= "lang_4letter">
        <xsl:param name="lang"/>
        <xsl:choose>
            <xsl:when test="$lang = 'de-DE'">de_DE</xsl:when>
            <xsl:when test="$lang = 'en-US'">en_US</xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="get_doi">
        <xsl:for-each select="oai:record/oai:metadata/oai_dc:dc/dc:identifier">        
            <xsl:choose>
                <xsl:when test="contains( . , '10.30820/')">
                    <xsl:value-of select="concat('https://doi.org/', . )"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="get_url">
        <xsl:for-each select="oai:record/oai:metadata/oai_dc:dc/dc:identifier">        
            <xsl:choose>
                <xsl:when test="contains( . , 'journal-fuer-psychologie.de')">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>