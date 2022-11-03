<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
    method="xml"
    omit-xml-declaration = "yes"
    doctype-system="about:legacy-compat"
    encoding="UTF-8"
    indent="yes" />


    <xsl:template match="/">


        <html>

            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
                <meta charset="utf-8"/>
                <title>HTML5 Cannes XSLT</title>
            </head>
            <body>
                <h1 class="h1">Palmares année 2022</h1>
                <p class="text-start">Hello palma</p>

                <xsl:for-each select="//film">
                    <xsl:sort select="titre" />
                    <xsl:apply-templates select="film"/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film">
        Titre: <span><xsl:value-of select="titre"/></span>
    </xsl:template>
</xsl:stylesheet>
