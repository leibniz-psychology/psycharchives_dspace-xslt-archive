<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:doc="http://www.lyncode.com/xoai"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>


    <xsl:template match="/">
        <dublin_core schema="dc">
            <xsl:call-template name="get_authors"/>
            <xsl:call-template name="get_issued_date"/>
            <xsl:call-template name="get_abstract"/>
            <xsl:call-template name="get_publisher"/>
            <xsl:call-template name="get_publication_status"/>
            <xsl:call-template name="get_review_status"/>
            <dcvalue element="identifier" qualifier="issn">2198-6959</dcvalue>
            <dcvalue element="identifier" qualifier="issn">0942-2285</dcvalue>
            <xsl:call-template name="get_content_language"/>
            
            <xsl:call-template name="get_relation_isversionof"></xsl:call-template>
            <dcvalue element="rights" qualifier="none" language="">openAccess</dcvalue>
            <xsl:call-template name="get_licence_and_uri"/>
            <dcvalue element="subject" qualifier="ddc">150</dcvalue>
            <xsl:call-template name="get_article_title"/>
            <dcvalue element="type">article</dcvalue>
        </dublin_core>
    </xsl:template>

    <xsl:template name="get_authors">
        <xsl:choose>
            <xsl:when test="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'contributor']/doc:element[@name = 'author']/doc:element/doc:field[@name = 'value']">
                <xsl:for-each
                    select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'contributor']/doc:element[@name = 'author']/doc:element/doc:field[@name = 'value']">
                    <dcvalue element="contributor" qualifier="author">
                        <xsl:value-of select="."/>
                    </dcvalue>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <dcvalue element="contributor" qualifier="other">
                    <xsl:value-of
                        select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'source']/doc:element[@name = 'journal']/doc:element/doc:field[@name = 'value']"
                    />
                </dcvalue>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="get_issued_date">
        <dcvalue element="date" qualifier="issued">
            <xsl:value-of
                select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'date']/doc:element[@name = 'issued']/doc:element/doc:field[@name = 'value']"
            />
        </dcvalue>
    </xsl:template>

    <xsl:template name="get_abstract">
        <xsl:choose>
            <xsl:when
                test="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'description']/doc:element[@name = 'abstract']/doc:element/doc:field[@name = 'value']">
                <xsl:for-each
                    select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'description']/doc:element[@name = 'abstract']/doc:element">
                    <dcvalue element="description" qualifier="abstract">
                        <xsl:attribute name="language">
                            <xsl:value-of select="./@name"/>
                        </xsl:attribute>
                        <xsl:value-of select="./doc:field[@name = 'value']"/>
                    </dcvalue>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <dcvalue element="description" qualifier="abstract" language="en">None.</dcvalue>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="get_publisher">
        <xsl:variable name="issuedDate" select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'date']/doc:element[@name = 'issued']/doc:element/doc:field[@name = 'value']"/>

        <xsl:choose>
            <xsl:when test="number($issuedDate) &lt; 2002">
                <dcvalue element="publisher" >Roland Asanger Verlag GmbH</dcvalue>
            </xsl:when>
            <xsl:when test="number($issuedDate) &lt; 2007">
                <dcvalue element="publisher" >Vandenhoeck &amp; Ruprecht Verlag</dcvalue>
            </xsl:when>
            <xsl:when test="number($issuedDate) &lt; 2012">
                <dcvalue element="publisher" >Pabst Science Publishers</dcvalue>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="get_publication_status">
        <xsl:variable name="publication_status">
            <xsl:value-of
                select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'description']/doc:element[@name = 'pubstatus']/doc:element/doc:field[@name = 'value']"
            />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$publication_status = 'Published Version'">
                <dcvalue element="description" qualifier="pubstatus">publishedVersion</dcvalue>
            </xsl:when>
            <xsl:when test="$publication_status = 'Postprint'">
                <dcvalue element="description" qualifier="pubstatus">acceptedVersion</dcvalue>
            </xsl:when>
            <xsl:otherwise>
                <dcvalue element="description" qualifier="pubstatus">unknown</dcvalue>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="get_review_status">
        <xsl:variable name="review_status">
            <xsl:value-of
                select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'description']/doc:element[@name = 'review']/doc:element[@name = 'en']/doc:field[@name = 'value']"
            />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$review_status = 'reviewed'">
                <dcvalue element="description" qualifier="review">reviewed</dcvalue>
            </xsl:when>
            <xsl:when test="$review_status = 'peer reviewed'">
                <dcvalue element="description" qualifier="review">peerReviewed</dcvalue>
            </xsl:when>
            <xsl:when test="$review_status = 'not reviewed'">
                <dcvalue element="description" qualifier="review">notReviewed</dcvalue>
            </xsl:when>
            <xsl:otherwise>
                <dcvalue element="description" qualifier="review">unknown</dcvalue>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="get_relation_isversionof">
        <xsl:if test="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'identifier']/doc:element[@name = 'uri']/doc:element/doc:field[@name = 'value']">
            <dcvalue element="relation" qualifier="isversionof">
                <xsl:value-of select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'identifier']/doc:element[@name = 'uri']/doc:element/doc:field[@name = 'value']"/>
            </dcvalue>
        </xsl:if>
    </xsl:template>

    <xsl:template name="get_content_language">
        <xsl:call-template name="lang_iso639-3">
            <xsl:with-param name="lang"
                select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'language']/doc:element/doc:field[@name = 'value']"
            />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="lang_iso639-3">
        <xsl:param name="lang"/>
        <xsl:variable name="lang_iso">
            <xsl:choose>
                <xsl:when test="$lang = 'bg'">bul</xsl:when>
                <xsl:when test="$lang = 'bu'">bul</xsl:when>
                <xsl:when test="$lang = 'de'">deu</xsl:when>
                <xsl:when test="$lang = 'en'">eng</xsl:when>
                <xsl:when test="$lang = 'es'">spa</xsl:when>
                <xsl:when test="$lang = 'fr'">fra</xsl:when>
                <xsl:when test="$lang = 'he'">heb</xsl:when>
                <xsl:when test="$lang = 'hr'">hrv</xsl:when>
                <xsl:when test="$lang = 'hu'">hun</xsl:when>
                <xsl:when test="$lang = 'it'">ita</xsl:when>
                <xsl:when test="$lang = 'pt'">por</xsl:when>
                <xsl:when test="$lang = 'sv'">swe</xsl:when>
                <xsl:when test="$lang = 'sw'">swa</xsl:when>
                <xsl:when test="$lang = 'zh'">zho</xsl:when>
                <xsl:when test="$lang = 'ba'">bos</xsl:when>
                <xsl:when test="$lang = 'rs'">slv</xsl:when>
                <xsl:when test="$lang = 'ku'">kur</xsl:when>
                <xsl:when test="$lang = 'tr'">tur</xsl:when>
                <xsl:when test="$lang = 'nl'">nld</xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </xsl:variable>
        <dcvalue element="language" qualifier="iso">
            <xsl:value-of select="$lang_iso"/>
        </dcvalue>
    </xsl:template>

    <xsl:template name="get_licence_and_uri">
        <xsl:variable name="licence">
            <xsl:value-of
                select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'rights']/doc:element[@name = 'licence']/doc:element[@name = 'en']/doc:field[@name = 'value']"
            />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="contains($licence, 'Creative Commons')">
                <dcvalue element="rights" qualifier="license">CC BY-NC-ND 4.0</dcvalue>
                <dcvalue element="rights" qualifier="uri"
                    >https://creativecommons.org/licenses/by-nc-nd/4.0/</dcvalue>
            </xsl:when>
            <xsl:when test="contains($licence, 'Deposit Licence')">
                <dcvalue element="rights" qualifier="license">CC BY-NC-ND 4.0</dcvalue>
                <dcvalue element="rights" qualifier="uri">https://creativecommons.org/licenses/by-nc-nd/4.0/</dcvalue>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="get_article_title">
        <xsl:for-each
            select="/oai:record/oai:metadata/doc:metadata/doc:element[@name = 'dc']/doc:element[@name = 'title']/doc:element">
            <xsl:choose>
                <xsl:when test="./@name = 'alternative'">
                    <dcvalue element="title" qualifier="alternative">
                        <xsl:attribute name="language">
                            <xsl:value-of select="./doc:element/@name"/>
                        </xsl:attribute>
                        <xsl:value-of select="./doc:element/doc:field[@name = 'value']"/>
                    </dcvalue>
                </xsl:when>
                <xsl:otherwise>
                    <dcvalue element="title">
                        <xsl:attribute name="language">
                            <xsl:value-of select="./@name"/>
                        </xsl:attribute>
                        <xsl:value-of select="./doc:field[@name = 'value']"/>
                    </dcvalue>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
