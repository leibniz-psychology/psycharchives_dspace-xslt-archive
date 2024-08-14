<?xml version="1.1" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY rsquo "&#8217;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:strip-space elements="*"/>


	<xsl:template match="/">
		<dublin_core schema="zpid">
			<dcvalue element="primarypublication" qualifier="journaltitle" language="">
				<xsl:value-of select="/article/front/journal-meta/journal-title-group/journal-title"/>
			</dcvalue>
			<dcvalue element="primarypublication" qualifier="volume" language="">
				<xsl:value-of select="article/front/article-meta/volume"/>
			</dcvalue>
			<xsl:call-template name="get_journal_issue"/>
			<xsl:call-template name="get_journal_article_pages"/>
			<dcvalue element="tags" qualifier="visible">Version of Record</dcvalue>
		</dublin_core>
	</xsl:template>

	<xsl:template name="get_journal_issue">
		<xsl:if test="article/front/article-meta/issue">
			<dcvalue element="primarypublication" qualifier="issue" language="">
				<xsl:value-of select="article/front/article-meta/issue"/>
			</dcvalue>
		</xsl:if>
	</xsl:template>

	<xsl:template name="get_journal_article_pages">
		<xsl:if test="article/front/article-meta/fpage">
			<dcvalue element="primarypublication" qualifier="pages" language="">
				<xsl:value-of select="article/front/article-meta/fpage"/>
				<xsl:if test="article/front/article-meta/lpage">
					<xsl:text>&#x02013;</xsl:text>
					<xsl:value-of select="article/front/article-meta/lpage"/>
				</xsl:if>
			</dcvalue>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
