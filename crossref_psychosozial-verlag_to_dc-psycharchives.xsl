<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:crossref_api = "http://www.crossref.org/qrschema/3.0"
    xmlns:crossref = "http://www.crossref.org/xschema/1.1"
    xmlns:jats="http://www.ncbi.nlm.nih.gov/JATS1"
    xmlns="http://purl.org/dc/elements/1.1/"
    version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <dublin_core schema="dc">
            <xsl:call-template name="get_authors"/>
            <xsl:call-template name="get_issued_date"/>
            <xsl:call-template name="get_abstract"/>
            <dcvalue element="publisher">Psychosozial-Verlag</dcvalue>
            <dcvalue element="description" qualifier="pubstatus">publishedVersion</dcvalue>
            <dcvalue element="description" qualifier="review">reviewed</dcvalue>
            <xsl:call-template name="get_issn"/>
            <xsl:call-template name="get_content_language"/>
            <xsl:call-template name="get_relation_isversionof"></xsl:call-template>
            <dcvalue element="rights">openAccess</dcvalue>
            <dcvalue element="rights" qualifier="license">CC BY-NC-ND 3.0 DE</dcvalue>
            <dcvalue element="rights" qualifier="uri">https://creativecommons.org/licenses/by-nc-nd/3.0/de/</dcvalue>
            <dcvalue element="subject" qualifier="ddc">150</dcvalue>
            <xsl:call-template name="get_article_title"/>
            <dcvalue element="type">article</dcvalue>
        </dublin_core>
    </xsl:template>
    
    <xsl:template name="get_authors">
        <xsl:choose>
            <xsl:when test="//crossref:contributors/crossref:person_name">
                <xsl:for-each
                    select="//crossref:contributors/crossref:person_name">
                    <dcvalue element="contributor" qualifier="author">
                        <xsl:value-of select="concat(./crossref:surname, ', ', ./crossref:given_name)"/>
                    </dcvalue>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <dcvalue element="contributor" qualifier="other">
                    <xsl:value-of select="//crossref:journal_metadata/crossref:full_title"/>
                </dcvalue>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="get_issued_date">
        <dcvalue element="date" qualifier="issued">
            <xsl:value-of
                select="concat(//crossref:journal_article/crossref:publication_date/crossref:year, '-', //crossref:journal_article/crossref:publication_date/crossref:month)"
            />
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_abstract">
        <xsl:choose>
            <xsl:when test="//crossref:journal_article/jats:abstract != ''">
                    <xsl:for-each select="//crossref:journal_article/jats:abstract">
                        <xsl:variable name="lang">
                            <xsl:choose>
                                <xsl:when test="./@xml:lang = 'de'">
                                    <xsl:value-of select="'de_DE'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="./@xml:lang"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <dcvalue element="description" qualifier="abstract">
                            <xsl:attribute name="language">
                                <xsl:value-of select="$lang"/>
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
    
    
    <xsl:template name="get_issn">
        <xsl:for-each select="//crossref:journal_metadata/crossref:issn">
            <dcvalue element="identifier" qualifier="issn">
                <xsl:value-of select="."/>
            </dcvalue>
        </xsl:for-each>
    </xsl:template>
  
    <xsl:template name="get_content_language">
        <dcvalue element="language" qualifier="iso">
            <xsl:choose>
                <xsl:when test="//crossref:journal_article/@language = 'de'">
                    <xsl:value-of select="'deu'"/>
                </xsl:when>
                <xsl:when test="//crossref:journal_article/@language = 'fr'">
                    <xsl:value-of select="'fra'"/>
                </xsl:when>
                <xsl:when test="//crossref:journal_article/@language = 'it'">
                    <xsl:value-of select="'ita'"/>
                </xsl:when>
            </xsl:choose>          
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_relation_isversionof">    
        <dcvalue element="relation" qualifier="isversionof">
            <xsl:value-of select="concat('https://doi.org/', //crossref_api:query/crossref_api:doi)"/>
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_article_title">
        <xsl:variable name="lang">
            <xsl:choose>
                <xsl:when test="//crossref:journal_article/@language = 'de'">
                    <xsl:value-of select="'de_DE'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="//crossref:journal_article/@language"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <dcvalue element="title">
            <xsl:attribute name="language">
                <xsl:value-of select="$lang"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="//crossref:journal_article/crossref:titles/crossref:subtitle != ''">
                    <xsl:value-of select="concat(//crossref:journal_article/crossref:titles/crossref:title, ': ', //crossref:journal_article/crossref:titles/crossref:subtitle)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="//crossref:journal_article/crossref:titles/crossref:title"/>
                </xsl:otherwise>
            </xsl:choose>
            
        </dcvalue>
    </xsl:template>
    
</xsl:stylesheet>