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
                <meta charset="utf-8"/>
                <title>HTML5 Cannes XSLT</title>
            </head>
            <body>
                <p>Hello palma</p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
