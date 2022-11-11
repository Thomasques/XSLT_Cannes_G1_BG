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

                <xsl:for-each select="/festival_cannes/films/film">
                    <xsl:sort select="titre" />
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film">
        <xsl:variable name="id-film" select="./@id"></xsl:variable>
        <h6>Titre: <xsl:value-of select="titre"/> </h6>
        <h6>Réalisateurs:</h6>
        
        <h6>Année de production : <xsl:value-of select="@annee_production"/></h6>
        <h6>Date de sortie : <xsl:value-of select="@date_sortie"/></h6>
        <h6>Durée : <xsl:value-of select="@duree"/></h6>
        <h6>Nationalités :
            <xsl:for-each select="//pays[contains (//film[@id = $id-film]/@pays, @code)]"> 
                <span><xsl:value-of select="."/>  </span>           
            </xsl:for-each> </h6>
        <h6>Synopsis :</h6> <p><xsl:value-of select="synopsis"/></p> 
    </xsl:template>

    <xsl:template match="artiste">
        <xsl:variable name="sexe-artiste" select="@sesxe"></xsl:variable>
        <xsl:variable name="pays-artiste" select="@pays"></xsl:variable>
        <h6 title="sexe : $sexe-artiste pays: $pays">
            <span><xsl:value-of select="prenom"/>
            </span><span><xsl:value-of select="nom"/></span>
        </h6>
    </xsl:template>
</xsl:stylesheet>
