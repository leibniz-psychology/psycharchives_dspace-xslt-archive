<?xml version="1.1" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY rsquo "&#8217;"> ]>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:psyop="http://psychopen.eu/namespace">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:strip-space elements="*"/>

	<xsl:variable name="selected_journal">
		<xsl:choose>
			<xsl:when test="/article/front/journal-meta/issn = '1312-7969'">
				<xsl:value-of select="'psyct'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn = '1841-0413'">
				<xsl:value-of select="'ejop'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn = '2182-438X'">
				<xsl:value-of select="'pch'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn = '1981-6472'">
				<xsl:value-of select="'interpersona'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn = '2195-7614'">
				<xsl:value-of select="'ejcop'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn = '2195-3325'">
				<xsl:value-of select="'jspp'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn = '2363-8761'">
				<xsl:value-of select="'jnc'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn = '2569-5665'">
				<xsl:value-of select="'jbdgm'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn[@pub-type = 'epub'] = '2569-653X'">
				<xsl:value-of select="'spb'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn[@pub-type = 'epub'] = '2625-3410'">
				<xsl:value-of select="'cpe'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn[@pub-type = 'epub'] = '1614-2241'">
				<xsl:value-of select="'meth'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn[@pub-type = 'epub'] = '2699-8440'">
				<xsl:value-of select="'sotrap'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn[@pub-type = 'epub'] = '2699-8432'">
				<xsl:value-of select="'qcmb'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn[@pub-type = 'epub'] = '2700-0710'">
				<xsl:value-of select="'ps'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn[@pub-type = 'epub'] = '1450-3417'">
				<xsl:value-of select="'bioling'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn[@pub-type = 'epub'] = '2750-6649'">
				<xsl:value-of select="'phair'"/>
			</xsl:when>
			<xsl:when test="/article/front/journal-meta/issn[@pub-type = 'epub'] = '2750-6630'">
				<xsl:value-of select="'gep'"/>
			</xsl:when>
			<xsl:otherwise> </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="corrected_journalname">
		<xsl:choose>
			<xsl:when test="$selected_journal = 'ejop'">
				<xsl:value-of select="'Europe&#8217;s Journal of Psychology'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'pch'">
				<xsl:value-of select="'Psychology, Community &amp; Health'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'interpersona'">
				<xsl:value-of
					select="'Interpersona: An International Journal on Personal Relationships'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'ejcop'">
				<xsl:value-of select="'The European Journal of Counselling Psychology'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'jspp'">
				<xsl:value-of select="'Journal of Social and Political Psychology'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'psyct'">
				<xsl:value-of select="'Psychological Thought'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'jnc'">
				<xsl:value-of select="'Journal of Numerical Cognition'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'jbdgm'">
				<xsl:value-of select="'Jahrbuch Musikpsychologie'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'spb'">
				<xsl:value-of select="'Social Psychological Bulletin'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'cpe'">
				<xsl:value-of select="'Clinical Psychology in Europe'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'meth'">
				<xsl:value-of select="'Methodology'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'sotrap'">
				<xsl:value-of select="'Sexual Offending: Theory, Research, and Prevention'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'qcmb'">
				<xsl:value-of
					select="'Quantitative and Computational Methods in Behavioral Sciences'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'ps'">
				<xsl:value-of select="'Personality Science'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'bioling'">
				<xsl:value-of select="'Biolinguistics'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'phair'">
				<xsl:value-of select="'Psychology of Human-Animal Intergroup Relations'"/>
			</xsl:when>
			<xsl:when test="$selected_journal = 'gep'">
				<xsl:value-of select="'Global Environmental Psychology'"/>
			</xsl:when>
			<xsl:otherwise> </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="journaltitle"
		select="/article/front/journal-meta/journal-title-group/journal-title"/>
	<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	<!-- <xsl:variable name="article_language" select="translate(/article/front/article-meta/@xml:lang,$uppercase,$lowercase)" /> -->
	<xsl:variable name="article_language">
		<xsl:choose>
			<xsl:when test="/article/front/article-meta/@xml:lang">
				<xsl:value-of
					select="translate(/article/front/article-meta/@xml:lang, $uppercase, $lowercase)"
				/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of
					select="translate(/article/front/article-meta/title-group/article-title/@xml:lang, $uppercase, $lowercase)"
				/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="article_volume" select="/article/front/article-meta/volume"/>
	<xsl:variable name="article_issue"
		select="/article/front/article-meta/issue[@content-type = 'volume']"/>
	<xsl:variable name="elocation-id" select="/article/front/article-meta/elocation-id"/>
	<xsl:variable name="first-page" select="/article/front/article-meta/fpage"/>
	<xsl:variable name="last-page" select="/article/front/article-meta/lpage"/>
	<xsl:variable name="page-range">
		<xsl:choose>
			<xsl:when test="($first-page != '') and ($last-page != '')">
				<xsl:value-of select="concat($first-page, '-', $last-page)"/>
			</xsl:when>
			<xsl:when test="$first-page != ''">
				<xsl:value-of select="$first-page"/>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="vol_issue">
		<xsl:value-of select="$article_volume"/>
		<xsl:if test="$article_issue != ''">
			<xsl:value-of select="concat('(', $article_issue, ')')"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="article_location">
		<xsl:choose>
			<xsl:when test="$elocation-id != ''">
				<xsl:value-of select="concat('Article ', $elocation-id)"/>
			</xsl:when>
			<xsl:when test="$page-range != ''">
				<xsl:value-of select="$page-range"/>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="doi">
		<xsl:value-of select="article/front/article-meta/article-id[@pub-id-type = 'doi']"/>
	</xsl:variable>
	<xsl:variable name="doi_url">
		<xsl:value-of select="concat('https://doi.org/', $doi)"/>
	</xsl:variable>
	<xsl:variable name="pub-date-year">
		<xsl:choose>
			<xsl:when
				test="/article/front/article-meta/pub-date[@publication-format = 'electronic']/year">
				<xsl:value-of
					select="/article/front/article-meta/pub-date[@publication-format = 'electronic']/year"
				/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="/article/front/article-meta/pub-date/year"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="journal_section">
		<xsl:choose>
			<xsl:when
				test="/article/front/article-meta/article-categories/subj-group[@subj-group-type = 'sts-heading']">
				<xsl:value-of
					select="article-categories/subj-group[@subj-group-type = 'sts-heading']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of
					select="/article/front/article-meta/article-categories/subj-group[@subj-group-type = 'heading']"
				/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="title-APA-style">
		<xsl:choose>
			<xsl:when
				test="article/front/article-meta/title-group/alt-title[@specific-use = 'APA-reference-style']">
				<xsl:value-of
					select="article/front/article-meta/title-group/alt-title[@specific-use = 'APA-reference-style']"
				/>
			</xsl:when>
			<xsl:when
				test="string-length(normalize-space(article/front/article-meta/title-group/subtitle)) &gt; 0">
				<xsl:value-of
					select="concat(article/front/article-meta/title-group/article-title, ': ', article/front/article-meta/title-group/subtitle)"
				/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="article/front/article-meta/title-group/article-title"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="number_of_authors"
		select="count(/article/front/article-meta/contrib-group/contrib[@contrib-type = 'author'])"/>
	<xsl:variable name="authorlist-APA-style">
		<xsl:for-each
			select="/article/front/article-meta/contrib-group/contrib[@contrib-type = 'author']">
			<xsl:choose>
				<xsl:when test="$number_of_authors = 1">
					<xsl:value-of select="name/surname"/>
					<xsl:if test="name/given-names">
						<xsl:value-of
							select="concat(', ', psyop:tokenize-given-names(name/given-names))"/>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$number_of_authors = 2">
					<xsl:if test="position() = 2">
						<xsl:text> &amp; </xsl:text>
					</xsl:if>
					<xsl:value-of select="name/surname"/>
					<xsl:if test="name/given-names">
						<xsl:value-of
							select="concat(', ', psyop:tokenize-given-names(name/given-names))"/>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$number_of_authors &lt; 21">
					<xsl:choose>
						<xsl:when test="position() = last()">
							<xsl:if test="$article_language != 'de'">
								<xsl:text>,</xsl:text>
							</xsl:if>
							<xsl:text> &amp; </xsl:text>
						</xsl:when>
						<xsl:when test="position() != 1">
							<xsl:text>, </xsl:text>
						</xsl:when>
					</xsl:choose>
					<xsl:value-of select="name/surname"/>
					<xsl:if test="name/given-names">
						<xsl:value-of
							select="concat(', ', psyop:tokenize-given-names(name/given-names))"/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="position() &lt; 20">
							<xsl:if test="position() != 1">
								<xsl:text>, </xsl:text>
							</xsl:if>
							<xsl:value-of select="name/surname"/>
							<xsl:if test="name/given-names">
								<xsl:value-of
									select="concat(', ', psyop:tokenize-given-names(name/given-names))"
								/>
							</xsl:if>
						</xsl:when>
						<xsl:when test="position() = 20">
							<xsl:text>,...</xsl:text>
						</xsl:when>
						<xsl:when test="position() = last()">
							<xsl:value-of select="name/surname"/>
							<xsl:if test="name/given-names">
								<xsl:value-of
									select="concat(', ', psyop:tokenize-given-names(name/given-names))"
								/>
							</xsl:if>
						</xsl:when>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:variable>

	<xsl:template match="/">
		<dublin_core schema="dc">
			<xsl:call-template name="get_journal_article_contributors"/>
			<xsl:call-template name="get_journal_article_publicationdate"/>
			<xsl:choose>
				<xsl:when test="/article/front/article-meta/abstract">
					<!--
					<xsl:apply-templates select="
						/article/front/article-meta/abstract[not(@abstract-type) or (@abstract-type='') ]
						| /article/front/article-meta/trans-abstract[@xml:lang='en'] "/>
				-->
					<xsl:apply-templates select="
							/article/front/article-meta/abstract[not(@abstract-type) or (@abstract-type = '')]
							| /article/front/article-meta/trans-abstract"/>
				</xsl:when>
				<xsl:otherwise>
					<dcvalue element="description" qualifier="abstract" language="en">No abstract
						available.</dcvalue>
				</xsl:otherwise>
			</xsl:choose>
			<dcvalue element="description" qualifier="pubstatus" language=""
				>publishedVersion</dcvalue>
			<xsl:call-template name="get_journal_article_review"/>
			<xsl:call-template name="get_journal_issn"/>
			<dcvalue element="language" qualifier="iso" language="">
				<xsl:call-template name="lang_iso639-3">
					<xsl:with-param name="lang" select="$article_language"/>
				</xsl:call-template>
			</dcvalue>
			<dcvalue element="publisher" qualifier="none" language="">Psychosozial-Verlag</dcvalue>
			<dcvalue element="relation" qualifier="isversionof" language="">
				<xsl:value-of select="$doi_url"/>
			</dcvalue>
			<xsl:call-template name="get_journal_article_license"/>
			<dcvalue element="rights" qualifier="none" language="">openAccess</dcvalue>
			<dcvalue element="rights" qualifier="uri" language="">
				<xsl:choose>
					<xsl:when
						test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, 'creativecommons.org/licenses')">
						<xsl:value-of
							select="concat('https:', substring-after(article/front/article-meta/permissions/license[1]/@xlink:href, 'http:'))"
						/>
					</xsl:when>
					<xsl:when
						test="not(contains(article/front/article-meta/permissions/license[1]/@xlink:href, 'creativecommons.org/licenses'))">
						<xsl:if
							test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by/3.0')">
							<xsl:value-of select="'https://creativecommons.org/licenses/by/3.0/'"/>
						</xsl:if>
						<xsl:if
							test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by/4.0')">
							<xsl:value-of select="'https://creativecommons.org/licenses/by/4.0/'"/>
						</xsl:if>
						<xsl:if
							test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by-nc-nd/3.0')">
							<xsl:value-of
								select="'https://creativecommons.org/licenses/by-nc-nd/3.0/'"/>
						</xsl:if>
						<xsl:if
							test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by-nc-nd/3.0/de') or /article/front/journal-meta/journal-title-group/journal-title = 'Psychotherapie-Wissenschaft' or /article/front/journal-meta/journal-title-group/journal-title = 'à jour! Psychotherapie-Berufsentwicklung'">
							<xsl:value-of
								select="'https://creativecommons.org/licenses/by-nc-nd/3.0/de/'"/>
						</xsl:if>
						<xsl:if
							test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by-nc-nd/4.0') or /article/front/journal-meta/journal-title-group/journal-title = 'Journal für Psychologie' or /article/front/journal-meta/journal-title-group/journal-title = 'The Clinical Journal of the International Institute for Bioenergetic Analysis'">
							<xsl:value-of
								select="'https://creativecommons.org/licenses/by-nc-nd/4.0/'"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select="article/front/article-meta/permissions/license[1]/@xlink:href"/>
					</xsl:otherwise>
				</xsl:choose>
			</dcvalue>
			<xsl:for-each select="/article/front/article-meta/kwd-group">
				<xsl:for-each select="kwd">
					<dcvalue element="subject" qualifier="none">
						<xsl:attribute name="language">
							<xsl:choose>
								<xsl:when test="ancestor-or-self::*[@xml:lang][1]/@xml:lang">
									<xsl:call-template name="lang_4letter">
										<xsl:with-param name="lang"
											select="ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="lang_4letter">
										<xsl:with-param name="lang" select="$article_language"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:value-of select="."/>
					</dcvalue>
				</xsl:for-each>
			</xsl:for-each>
			<dcvalue element="subject" qualifier="ddc" language="">150</dcvalue>
			<xsl:call-template name="get_journal_article_titles"/>
			<dcvalue element="identifier" qualifier="citation">
				<!-- 
				<xsl:attribute name="language">
					<xsl:call-template name="lang_4letter">
						<xsl:with-param name="lang" select="$article_language"/>
					</xsl:call-template>											
				</xsl:attribute>
				-->
				<xsl:call-template name="makecitation"/>
			</dcvalue>
			<xsl:call-template name="get_supplement_urls"/>
			<dcvalue element="type" qualifier="none" language="">article</dcvalue>
		</dublin_core>
	</xsl:template>

	<xsl:template match="abstract | trans-abstract">
		<!--		<xsl:for-each select="/article/front/abstract[not(@abstract-type='non-technical')]" > -->
		<dcvalue element="description" qualifier="abstract">
			<xsl:attribute name="language">
				<!--
					<xsl:choose>
						<xsl:when test="ancestor-or-self::*[@xml:lang][1]/@xml:lang">
							<xsl:call-template name="lang_4letter">
								<xsl:with-param name="lang" select="ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
							</xsl:call-template>
						</xsl:when>						
						<xsl:otherwise>
							<xsl:call-template name="lang_4letter">
								<xsl:with-param name="lang" select="$article_language"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>	
-->
				<xsl:call-template name="getlanguage"/>

			</xsl:attribute>
			<xsl:for-each select="descendant::*">
				<xsl:choose>
					<!-- Strukturierte Abstracts haben title Elemente. Der Wert/Text werden hier in das Abstract als Text integriert. -->
					<xsl:when test="(name() = 'title') and (not(preceding::title))">
						<xsl:value-of select="concat(normalize-space(.), ': ')"/>
					</xsl:when>
					<xsl:when test="(name() = 'title') and (preceding::title)">
						<xsl:value-of select="concat(' ', normalize-space(.), ': ')"/>
					</xsl:when>
					<xsl:when test="name() = 'p'">
						<xsl:value-of select="."/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</dcvalue>
		<!--		</xsl:for-each> -->
	</xsl:template>

	<xsl:template name="get_journal_article_review">
		<!--  
		<xsl:variable name="categoryNotReviewed">
			<xsl:choose>
				<xsl:when test="($selected_journal = 'ejop') and (contains('|Interview|Editorial|Book Reviews|Book Reviews|',concat('|',normalize-space($journal_section),'|')))" >
					<xsl:value-of select="'1'"/>						
				</xsl:when>
				<xsl:when test="($selected_journal = 'jnc') and (contains('|Editorial|Book Reviews|',concat('|',normalize-space($journal_section),'|')))" >
					<xsl:value-of select="'1'"/>						
				</xsl:when>		
				<xsl:when test="($selected_journal = 'jspp') and (contains('|From the Editors|',concat('|',normalize-space($journal_section),'|')))" >
					<xsl:value-of select="'1'"/>						
				</xsl:when>
				<xsl:when test="($selected_journal = 'psyct') and (contains('|Editorial|Events, Meetings and Reports|',concat('|',normalize-space($journal_section),'|')))" >
					<xsl:value-of select="'1'"/>						
				</xsl:when>		
				<xsl:when test="($selected_journal = 'interpersona') and (contains('|Editorial|Book Reviews|',concat('|',normalize-space($journal_section),'|')))" >
					<xsl:value-of select="'1'"/>						
				</xsl:when>
				<xsl:when test="($selected_journal = 'pch') and (contains('|Editorial|Book Reviews|',concat('|',normalize-space($journal_section),'|')))" >
					<xsl:value-of select="'1'"/>						
				</xsl:when>
				<xsl:when test="($selected_journal = 'jbdgm') and (contains('|Editorial|Spots|Nahaufnahmen|',concat('|',normalize-space($journal_section),'|')))" >
					<xsl:value-of select="'1'"/>						
				</xsl:when>														
				<xsl:otherwise>
					<xsl:value-of select="'0'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		-->
		<xsl:choose>
			<!--  
			<xsl:when test="//article-meta/history/date[@date-type='accepted'] and ($categoryNotReviewed = 0)">
				<dcvalue element="description" qualifier="review" language="">peerReviewed</dcvalue>			
			</xsl:when>
			-->
			<xsl:when
				test="/article/front/journal-meta/journal-title-group/journal-title = 'Psychotherapie-Wissenschaft' or /article/front/journal-meta/journal-title-group/journal-title = 'à jour! Psychotherapie-Berufsentwicklung'">
				<dcvalue element="description" qualifier="review" language="">reviewed</dcvalue>
			</xsl:when>
			<xsl:when
				test="/article/front/journal-meta/journal-title-group/journal-title = 'Journal für Psychologie' or /article/front/journal-meta/journal-title-group/journal-title = 'The Clinical Journal of the International Institute for Bioenergetic Analysis'">
				<dcvalue element="description" qualifier="review" language="">peerReviewed</dcvalue>
			</xsl:when>
			<xsl:otherwise>
				<dcvalue element="description" qualifier="review" language="">unknown</dcvalue>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="get_journal_issn">
		<xsl:for-each select="article/front/journal-meta/issn">
			<dcvalue element="identifier" qualifier="issn" language="">
				<xsl:value-of select="."/>
			</dcvalue>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="get_journal_article_license">
		<xsl:variable name="ccby">
			<xsl:choose>
				<xsl:when
					test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by/3.0')">
					<xsl:value-of select="'CC BY 3.0'"/>
				</xsl:when>
				<xsl:when
					test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by/4.0')">
					<xsl:value-of select="'CC BY 4.0'"/>
				</xsl:when>
				<xsl:when
					test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by-nc-nd/3.0')">
					<xsl:value-of select="'CC BY-NC-ND 3.0'"/>
				</xsl:when>
				<xsl:when
					test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by-nc-nd/4.0')">
					<xsl:value-of select="'CC BY-NC-ND 4.0'"/>
				</xsl:when>
				<xsl:when
					test="contains(article/front/article-meta/permissions/license[1]/@xlink:href, '/by-nc-nd/3.0/de')">
					<xsl:value-of select="'CC BY-NC-ND 3.0 DE'"/>
				</xsl:when>
				<!--
				<xsl:when test="contains(article/front/article-meta/permissions/license[1]/@xlink:href,'/by/')">
					<xsl:value-of select="'CC-BY'" />
				</xsl:when>
				-->
				<xsl:otherwise>
					<xsl:if
						test="/article/front/journal-meta/journal-title-group/journal-title = 'Journal für Psychologie' or /article/front/journal-meta/journal-title-group/journal-title = 'The Clinical Journal of the International Institute for Bioenergetic Analysis'">
						<xsl:value-of select="'CC BY-NC-ND 4.0'"/>
					</xsl:if>
					<xsl:if
						test="/article/front/journal-meta/journal-title-group/journal-title = 'Psychotherapie-Wissenschaft' or /article/front/journal-meta/journal-title-group/journal-title = 'à jour! Psychotherapie-Berufsentwicklung'">
						<xsl:value-of select="'CC BY-NC-ND 3.0 DE'"/>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<dcvalue element="rights" qualifier="license" language="">
			<xsl:value-of select="$ccby"/>
		</dcvalue>
	</xsl:template>

	<xsl:template name="lang_iso639-3">
		<xsl:param name="lang"/>
		<xsl:param name="slang">
			<xsl:value-of select="translate($lang, $uppercase, $lowercase)"/>
		</xsl:param>
		<xsl:choose>
			<xsl:when test="$slang = 'bg'">bul</xsl:when>
			<xsl:when test="$slang = 'bu'">bul</xsl:when>
			<xsl:when test="$slang = 'de'">deu</xsl:when>
			<xsl:when test="$slang = 'en'">eng</xsl:when>
			<xsl:when test="$slang = 'es'">spa</xsl:when>
			<xsl:when test="$slang = 'fr'">fra</xsl:when>
			<xsl:when test="$slang = 'he'">heb</xsl:when>
			<xsl:when test="$slang = 'hr'">hrv</xsl:when>
			<xsl:when test="$slang = 'hu'">hun</xsl:when>
			<xsl:when test="$slang = 'it'">ita</xsl:when>
			<xsl:when test="$slang = 'pt'">por</xsl:when>
			<xsl:when test="$slang = 'sv'">swe</xsl:when>
			<xsl:when test="$slang = 'sw'">swa</xsl:when>
			<xsl:when test="$slang = 'zh'">zho</xsl:when>
			<xsl:when test="$slang = 'ba'">bos</xsl:when>
			<xsl:when test="$slang = 'rs'">slv</xsl:when>
			<xsl:when test="$slang = 'ku'">kur</xsl:when>
			<xsl:when test="$slang = 'tr'">tur</xsl:when>
			<xsl:when test="$slang = 'nl'">nld</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="lang_4letter">
		<xsl:param name="lang"/>
		<xsl:param name="slang">
			<xsl:value-of select="translate($lang, $uppercase, $lowercase)"/>
		</xsl:param>
		<xsl:choose>
			<xsl:when test="$slang = 'bg'">bg_BG</xsl:when>
			<xsl:when test="$slang = 'bu'">bg_BG</xsl:when>
			<xsl:when test="$slang = 'de'">de_DE</xsl:when>
			<xsl:when test="$slang = 'en'">en_US</xsl:when>
			<xsl:when test="$slang = 'es'">es_ES</xsl:when>
			<xsl:when test="$slang = 'fr'">fr_FR</xsl:when>
			<xsl:when test="$slang = 'he'">he_IL</xsl:when>
			<xsl:when test="$slang = 'hr'">hr_HR</xsl:when>
			<xsl:when test="$slang = 'hu'">hr_HU</xsl:when>
			<xsl:when test="$slang = 'it'">it_IT</xsl:when>
			<xsl:when test="$slang = 'pt'">pt_PT</xsl:when>
			<xsl:when test="$slang = 'sv'">sv_SE</xsl:when>
			<xsl:when test="$slang = 'sw'">sw_KE</xsl:when>
			<xsl:when test="$slang = 'zh'">zh_CN</xsl:when>
			<xsl:when test="$slang = 'ba'">ba_BA</xsl:when>
			<xsl:when test="$slang = 'rs'">rs_RS</xsl:when>
			<xsl:when test="$slang = 'ku'">ku_KU</xsl:when>
			<xsl:when test="$slang = 'tr'">tr_TR</xsl:when>
			<xsl:when test="$slang = 'nl'">nl_NL</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>

	<!--
af-ZA
am-ET
ar-AE
ar-BH
ar-DZ
ar-EG
ar-IQ
ar-JO
ar-KW
ar-LB
ar-LY
ar-MA
arn-CL
ar-OM
ar-QA
ar-SA
ar-SY
ar-TN
ar-YE
as-IN
az-Cyrl-AZ
az-Latn-AZ
ba-RU
be-BY
bg-BG
bn-BD
bn-IN
bo-CN
br-FR
bs-Cyrl-BA
bs-Latn-BA
ca-ES
co-FR
cs-CZ
cy-GB
da-DK
de-AT
de-CH
de-DE
de-LI
de-LU
dsb-DE
dv-MV
el-GR
en-029
en-AU
en-BZ
en-CA
en-GB
en-IE
en-IN
en-JM
en-MY
en-NZ
en-PH
en-SG
en-TT
en-US
en-ZA
en-ZW
es-AR
es-BO
es-CL
es-CO
es-CR
es-DO
es-EC
es-ES
es-GT
es-HN
es-MX
es-NI
es-PA
es-PE
es-PR
es-PY
es-SV
es-US
es-UY
es-VE
et-EE
eu-ES
fa-IR
fi-FI
fil-PH
fo-FO
fr-BE
fr-CA
fr-CH
fr-FR
fr-LU
fr-MC
fy-NL
ga-IE
gd-GB
gl-ES
gsw-FR
gu-IN
ha-Latn-NG
he-IL
hi-IN
hr-BA
hr-HR
hsb-DE
hu-HU
hy-AM
id-ID
ig-NG
ii-CN
is-IS
it-CH
it-IT
iu-Cans-CA
iu-Latn-CA
ja-JP
ka-GE
kk-KZ
kl-GL
km-KH
kn-IN
kok-IN
ko-KR
ky-KG
lb-LU
lo-LA
lt-LT
lv-LV
mi-NZ
mk-MK
ml-IN
mn-MN
mn-Mong-CN
moh-CA
mr-IN
ms-BN
ms-MY
mt-MT
nb-NO
ne-NP
nl-BE
nl-NL
nn-NO
nso-ZA
oc-FR
or-IN
pa-IN
pl-PL
prs-AF
ps-AF
pt-BR
pt-PT
qut-GT
quz-BO
quz-EC
quz-PE
rm-CH
ro-RO
ru-RU
rw-RW
sah-RU
sa-IN
se-FI
se-NO
se-SE
si-LK
sk-SK
sl-SI
sma-NO
sma-SE
smj-NO
smj-SE
smn-FI
sms-FI
sq-AL
sr-Cyrl-BA
sr-Cyrl-CS
sr-Cyrl-ME
sr-Cyrl-RS
sr-Latn-BA
sr-Latn-CS
sr-Latn-ME
sr-Latn-RS
sv-FI
sv-SE
sw-KE
syr-SY
ta-IN
te-IN
tg-Cyrl-TJ
th-TH
tk-TM
tn-ZA
tr-TR
tt-RU
tzm-Latn-DZ
ug-CN
uk-UA
ur-PK
uz-Cyrl-UZ
uz-Latn-UZ
vi-VN
wo-SN
xh-ZA
yo-NG
zh-CN
zh-HK
zh-MO
zh-SG
zh-TW
zu-ZA
-->

	<xsl:template name="get_journal_article_titles">
		<dcvalue element="title" qualifier="none">
			<xsl:attribute name="language">
				<xsl:choose>
					<xsl:when test="ancestor-or-self::*[@xml:lang][1]/@xml:lang">
						<xsl:call-template name="lang_4letter">
							<xsl:with-param name="lang"
								select="ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="lang_4letter">
							<xsl:with-param name="lang" select="$article_language"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when
					test="article/front/article-meta/title-group/alt-title[@specific-use = 'APA-reference-style']">
					<xsl:value-of
						select="article/front/article-meta/title-group/alt-title[@specific-use = 'APA-reference-style']"
					/>
				</xsl:when>
				<xsl:when
					test="string-length(normalize-space(article/front/article-meta/title-group/subtitle)) &gt; 0">
					<xsl:value-of
						select="concat(article/front/article-meta/title-group/article-title, ': ', article/front/article-meta/title-group/subtitle)"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="article/front/article-meta/title-group/article-title"/>
				</xsl:otherwise>
			</xsl:choose>
		</dcvalue>
		<xsl:for-each select="article/front/article-meta/title-group/trans-title-group">
			<xsl:if test="./@xml:lang">
				<xsl:if test="./@xml:lang != $article_language">
					<dcvalue element="title" qualifier="alternative">
						<xsl:attribute name="language">
							<xsl:call-template name="lang_4letter">
								<xsl:with-param name="lang" select="./@xml:lang"/>
							</xsl:call-template>
						</xsl:attribute>
						<xsl:choose>
							<xsl:when test="string-length(normalize-space(trans-subtitle)) &gt; 0">
								<xsl:value-of select="concat(trans-title, ': ', trans-subtitle)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="trans-title"/>
							</xsl:otherwise>
						</xsl:choose>
					</dcvalue>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="get_journal_article_contributors">
		<xsl:for-each
			select="article/front/article-meta/contrib-group/contrib[@contrib-type = 'author']">
			<dcvalue element="contributor" qualifier="author" language="">
				<xsl:for-each select="name-alternatives | name">
					<xsl:choose>
						<xsl:when test="self::name-alternatives">
							<xsl:value-of select="name[@xml:lang = 'en']/surname"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="surname"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="name-alternatives | name">
					<xsl:text>, </xsl:text>
					<xsl:choose>
						<xsl:when test="self::name-alternatives">
							<xsl:value-of select="name[@xml:lang = 'en']/given-names"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="given-names"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</dcvalue>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="get_journal_article_publicationdate">
		<dcvalue element="date" qualifier="issued" language="">
			<xsl:choose>
				<xsl:when test="article/front/article-meta/pub-date[@pub-type = 'epub-ppub']/year">
					<xsl:value-of
						select="article/front/article-meta/pub-date[@pub-type = 'epub-ppub']/year"/>
					<xsl:if
						test="article/front/article-meta/pub-date[@pub-type = 'epub-ppub']/month">
						<xsl:value-of select="'-'"/>
						<xsl:value-of
							select="article/front/article-meta/pub-date[@pub-type = 'epub-ppub']/month"
						/>
					</xsl:if>
				</xsl:when>
				<xsl:when test="article/front/article-meta/pub-date[@pub-type = 'ppub']/year">
					<xsl:value-of
						select="article/front/article-meta/pub-date[@pub-type = 'ppub']/year"/>
					<xsl:if test="article/front/article-meta/pub-date[@pub-type = 'ppub']/month">
						<xsl:value-of select="'-'"/>
						<xsl:value-of
							select="article/front/article-meta/pub-date[@pub-type = 'ppub']/month"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
			<!-- <xsl:value-of select="'-'" />				
				<xsl:value-of select="article/front/article-meta/pub-date[@pub-type='epub-ppub']/day" />-->
		</dcvalue>
	</xsl:template>

	<xsl:template name="get_journal_article_pages">
		<pages>
			<first_page>
				<xsl:value-of select="article/front/article-meta/fpage"/>
			</first_page>
			<last_page>
				<xsl:value-of select="article/front/article-meta/lpage"/>
			</last_page>
		</pages>
	</xsl:template>

	<xsl:template name="get_journal_article_component_list">
		<xsl:variable name="doi">
			<xsl:value-of select="//front/article-meta/article-id[@pub-id-type = 'doi']"/>
		</xsl:variable>
		<xsl:variable name="pubid">
			<xsl:value-of select="substring-after($doi, '/')"/>
		</xsl:variable>
		<component_list>
			<xsl:for-each
				select="//body/sec[@sec-type = 'supplementary-material']/supplementary-material">
				<component parent_relation="isPartOf">
					<description>
						<xsl:value-of select="caption/title"/>
					</description>
					<format>
						<xsl:attribute name="mime_type">
							<xsl:value-of select="concat(media/@mimetype, '/', media/@mime-subtype)"
							/>
						</xsl:attribute>
					</format>
					<doi_data>
						<doi>
							<xsl:value-of select="$doi"/>
							<xsl:value-of select="concat('-', @id)"/>
						</doi>
						<resource>
							<xsl:value-of
								select="concat('https://', $selected_journal, '.psychopen.eu/public/journals/1/supplements/articles/')"/>
							<xsl:value-of select="concat($pubid, '/', media/@xlink:href)"/>
						</resource>
					</doi_data>
				</component>
			</xsl:for-each>
		</component_list>
	</xsl:template>

	<xsl:template name="get_supplement_urls">
		<xsl:for-each
			select="//back/sec[@sec-type = 'supplementary-material']/ref-list[@content-type = 'supplementary-material']/ref/mixed-citation/pub-id[@pub-id-type = 'doi']">
			<dcvalue element="relation" qualifier="uri" language="">
				<xsl:choose>
					<xsl:when test="starts-with(., '10.23668/')">
						<xsl:value-of select="concat('http://dx.doi.org/', .)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('https://doi.org/', .)"/>
					</xsl:otherwise>
				</xsl:choose>
			</dcvalue>
		</xsl:for-each>
		<xsl:for-each
			select="//back/sec[@sec-type = 'supplementary-material']/ref-list[@content-type = 'supplementary-material']/ref/mixed-citation/ext-link">
			<dcvalue element="relation" qualifier="uri" language="">
				<xsl:value-of
					select="replace(./@xlink:href, 'https://doi.org/10.23668', 'http://dx.doi.org/10.23668')"
				/>
			</dcvalue>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="getlanguage">
		<xsl:choose>
			<xsl:when test="ancestor-or-self::*[@xml:lang][1]/@xml:lang">
				<xsl:call-template name="lang_4letter">
					<xsl:with-param name="lang" select="ancestor-or-self::*[@xml:lang][1]/@xml:lang"
					/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="lang_4letter">
					<xsl:with-param name="lang" select="$article_language"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="makecitation">
		<xsl:variable name="authors">
			<xsl:for-each
				select="/article/front/article-meta/contrib-group/contrib[@contrib-type = 'author']">
				<xsl:if test="preceding-sibling::contrib[@contrib-type = 'author']">
					<xsl:value-of select="'; '"/>
				</xsl:if>
				<xsl:if test="position() = last()">
					<xsl:value-of select="'&#x0026; '"/>
				</xsl:if>
				<xsl:value-of select="name/surname"/>
				<xsl:for-each select="tokenize(name/given-names, ' ')">
					<xsl:if test="position() = 1">
						<xsl:value-of select="', '"/>
					</xsl:if>
					<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
					<xsl:if test="position() != last()">
						<xsl:value-of select="' '"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of
			select="concat($authorlist-APA-style, ' (', $pub-date-year, '). ', $title-APA-style, '. ', $journaltitle, ', ', $vol_issue, ', ', $article_location, '. ', $doi_url)"
		/>
	</xsl:template>

	<xsl:function name="psyop:capitalize-only-first" as="xs:string?">
		<xsl:param name="arg" as="xs:string?"/>
		<xsl:sequence
			select="concat(upper-case(substring($arg, 1, 1)), lower-case(substring($arg, 2)))"/>
	</xsl:function>


	<xsl:function name="psyop:tokenize-given-names" as="xs:string?">
		<xsl:param name="arg" as="xs:string?"/>
		<xsl:variable name="out">
			<xsl:for-each select="tokenize($arg, ' ')">
				<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
				<xsl:if test="position() != last()">
					<xsl:value-of select="' '"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:sequence select="$out"/>
	</xsl:function>

</xsl:stylesheet>
