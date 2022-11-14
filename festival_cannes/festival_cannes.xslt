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
                <h4>Liste des films :</h4>
                <xsl:for-each select="/festival_cannes/films/film">
                    <xsl:sort select="titre" />
                    <xsl:apply-templates select="."/>
                    <hr></hr>
                </xsl:for-each>
                <h4>le jury :</h4>
                <xsl:for-each select="//membre">
                    <xsl:variable name="id-membre" select="@artiste"></xsl:variable>
                    <ul>
                        <li><xsl:apply-templates select="//artiste[@id = $id-membre]"/></li>
                    </ul>
                </xsl:for-each>

                <h4>Palmarès :</h4>
                <xsl:for-each select="//prix">
                <xsl:apply-templates select="."/>
                </xsl:for-each>
                <h4>Annexe :</h4>
                <xsl:for-each select="//artiste">
                    <xsl:sort select="nom" />
                    <xsl:if test="count(./biographie)>0">
                        <xsl:variable name="id-membre" select="@artiste"></xsl:variable>
                        <ul>
                            <li><span><xsl:value-of select="nom"/></span><span> <xsl:value-of select="prenom"/></span>, Sexe:<xsl:value-of select="@sexe"/>, Pays: <xsl:value-of select="@pays"/> 
                            <p><xsl:value-of select="biographie"/></p></li>
                        </ul>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film">
        <xsl:variable name="id-film" select="./@id"></xsl:variable>
        <xsl:variable name="rea-film" select="./casting/@realisateurs"></xsl:variable>
        <xsl:variable name="sena-film" select="./casting/@scenaristes"></xsl:variable>
        <h6>Titre: <xsl:value-of select="titre"/> </h6>
        <h6>Réalisateurs:</h6>
        <ul>
            <xsl:for-each select="//artiste[contains($rea-film, @id)]"> 
                <li><xsl:apply-templates select="."/></li>
            </xsl:for-each>
        </ul>
        <h6>Senaristes</h6>
        <ul>
            <xsl:for-each select="//artiste[contains($sena-film, @id)]"> 
                <li><xsl:apply-templates select="."/></li>
            </xsl:for-each>
        </ul>
        <h6>Année de production : <xsl:value-of select="@annee_production"/></h6>
        <h6>Date de sortie : <xsl:value-of select="@date_sortie"/></h6>
        <h6>Durée : <xsl:value-of select="@duree"/></h6>
        <h6>Nationalités :
            <xsl:for-each select="//pays[contains (//film[@id = $id-film]/@pays, @code)]"> 
                <span><xsl:value-of select="."/>  </span>           
            </xsl:for-each> </h6>
        <xsl:if test="count(//prix[attribution/@film = $id-film])>0">
        <h6>Prix :</h6>
            <ul>
                <xsl:for-each select="//prix[attribution/@film = $id-film]"> 
                    <li><xsl:apply-templates select="@nom"/></li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <h6>Synopsis :</h6> <p><xsl:value-of select="synopsis"/></p> 
        <h6>Casting:</h6>
        <ul>
            <xsl:for-each select="//artiste[@id = //film[@id = $id-film]/personnages/personnage/@incarne_par]">
                <xsl:variable name="id-artiste" select="@id"></xsl:variable> 
                <li><xsl:apply-templates select="."/> ,<xsl:value-of select="//film[@id = $id-film]/personnages/personnage[@incarne_par = $id-artiste]"/></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="artiste">
        <xsl:variable name="sexe-artiste" select="@sexe"></xsl:variable>
        <xsl:variable name="pays-artiste" select="@pays"></xsl:variable>
        <span title="Sexe : {$sexe-artiste} Pays : {$pays-artiste}">
            <span><xsl:value-of select="prenom"/>
            </span><span><xsl:value-of select="nom"/></span>
        </span>
    </xsl:template>

    <xsl:template match="prix">
        <xsl:for-each select="attribution">
        <ul>
            <li><xsl:if test="count(@artistes)>0"> Artiste: <xsl:variable name="id-winner" select="@artistes">
            </xsl:variable><xsl:apply-templates select="//artiste[@id=$id-winner]"/></xsl:if> Film: <xsl:value-of select="@film"/></li>
        </ul>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
