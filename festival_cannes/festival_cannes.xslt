<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
    method="xml"
    omit-xml-declaration = "yes"
    doctype-system="about:legacy-compat"
    encoding="UTF-8"
    indent="yes" />


    <xsl:template match="/">
        <!-- CSS only -->
        <link href="www.https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>

        <html>
            <head>
                <meta charset="utf-8"/>
                <title>HTML5 Cannes XSLT</title>
            </head>
            <body>
                <h1>Palmares année 2022</h1>
                <p>Hello palma</p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
