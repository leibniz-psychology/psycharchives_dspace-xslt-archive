<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://purl.org/dc/elements/1.1/"
    version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <dublin_core schema="dc">
            <xsl:call-template name="get_authors"/>
            <xsl:call-template name="get_issued_date"/>
            <xsl:call-template name="get_abstract"></xsl:call-template>
            <dcvalue element="publisher">Psychosozial-Verlag</dcvalue>
            <dcvalue element="description" qualifier="pubstatus">publishedVersion</dcvalue>
            <dcvalue element="description" qualifier="review">unknown</dcvalue>
            <dcvalue element="identifier" qualifier="issn">1664-9591</dcvalue>
            <dcvalue element="identifier" qualifier="issn">1664-9583</dcvalue>
            <xsl:call-template name="get_lang_iso"></xsl:call-template>
            <xsl:call-template name="get_relation_isversionof"></xsl:call-template>
            <dcvalue element="rights">openAccess</dcvalue>
            <dcvalue element="rights" qualifier="license">CC BY-NC-ND 3.0 DE</dcvalue>
            <dcvalue element="rights" qualifier="uri">https://creativecommons.org/licenses/by-nc-nd/3.0/de</dcvalue>
            <dcvalue element="subject" qualifier="ddc">150</dcvalue>
            <xsl:call-template name="get_article_title"/>
            <xsl:call-template name="get_article_alternative"/>
            <dcvalue element="type">article</dcvalue>
        </dublin_core>
    </xsl:template>
    
    <xsl:template name="get_authors">
        <xsl:for-each select="//meta[@name = 'citation_author']/@content">
            <xsl:variable name="firstName" select="substring-before(., ' ')"/>
            <xsl:variable name="lastName" select="substring-after(., ' ')"/>
            <xsl:choose>
                <xsl:when test=". = 'Redaktion Veranstaltungen'">
                    <dcvalue element="contributor" qualifier="other">Journal für Psychologie</dcvalue>
                </xsl:when>
                <xsl:otherwise>
                    <dcvalue element="contributor" qualifier="author"><xsl:value-of select="concat($lastName,', ',$firstName)"/></dcvalue>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="get_issued_date">
        <dcvalue element="date" qualifier="issued">
            <xsl:value-of
                select="//meta[@name = 'DC.Date.created']/@content"
            />
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_abstract">
        <xsl:choose>
            <xsl:when test="//meta[@name = 'DC.Description']">
                <dcvalue element="description" qualifier="abstract">
                    <xsl:attribute name="language">
                        <xsl:if test="//meta[@name = 'DC.Description']/@xml:lang = 'de'">
                            <xsl:value-of select="'de_DE'"/>
                        </xsl:if>
                    </xsl:attribute>
                    <xsl:value-of select="//meta[@name = 'DC.Description']/@content"/>
                </dcvalue>
            </xsl:when>
            <xsl:otherwise>
                <dcvalue element="description" qualifier="abstract" language="en">No abstract available.</dcvalue>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="get_lang_iso">
        <xsl:choose>
            <xsl:when test="//meta[@name = 'DC.Type.articleType']/@content = 'Rezensionen'">
                <dcvalue element="language" qualifier="iso">deu</dcvalue>
            </xsl:when>
            <xsl:otherwise>
                <dcvalue element="language" qualifier="iso">deu</dcvalue>
                <dcvalue element="language" qualifier="iso">fra</dcvalue>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="get_article_title">
        <dcvalue element="title">
            <xsl:attribute name="language">
                <xsl:value-of select="'de_DE'"/>
            </xsl:attribute>
            <xsl:value-of select="//meta[@name = 'DC.Title']/@content"/>
        </dcvalue>
    </xsl:template>
    
    <xsl:template name="get_article_alternative">
        <xsl:for-each select="//meta[@name = 'DC.Title.Alternative']">
            <dcvalue element="title" qualifier="alternative">
                <xsl:attribute name="language">
                    <xsl:value-of select="./@xml:lang"/>
                </xsl:attribute>
                <xsl:value-of select="./@content"/>
            </dcvalue>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="get_relation_isversionof">        
        
            <xsl:variable name="url">
                <xsl:call-template name="get_url"/>
            </xsl:variable>
            <xsl:variable name="doi">
                <xsl:call-template name="get_doi"/>                 
            </xsl:variable>
            
            <xsl:if test="$url != ''">
                <dcvalue element="relation" qualifier="isversionof">
                    <xsl:value-of select="$url"/>
                </dcvalue>
            </xsl:if>
            <xsl:if test="$doi != ''">
                <dcvalue element="relation" qualifier="isversionof">
                <xsl:value-of select="$doi"/>
                </dcvalue>
            </xsl:if>
    </xsl:template>
    
    <xsl:template name="get_url">
        <xsl:for-each select="//meta[@name = 'DC.Identifier.URI']/@content">        
            <xsl:choose>
                <xsl:when test="contains( . , 'psychotherapie-wissenschaft.info')">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="get_doi">
        <xsl:for-each select="//meta[@name = 'citation_doi']/@content">        
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
    
    <!--
    <xsl:template name="makecitation">
        <xsl:variable name="year" select="substring(//meta[@name = 'DC.Date.issued']/@content, 1, 4)"/>
        <dcvalue element="identifier" qualifier="citation">
            <xsl:value-of select="concat('Supplement, R. (', $year ,'). Forum Österreich – Forum Schweiz/Suisse – Forum Deutschland – Psychotherapie International. Psychosozial-Verlag.')"/>
        </dcvalue>
    </xsl:template>
    !-->
</xsl:stylesheet>