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
                <!-- Jumbotron -->
                <div class="p-5 text-center bg-light">
                    <h1 class="mb-3">Festival de Cannes</h1>
                    <h6 class="mb-3">Le Festival de Cannes (appelé Festival international du film de 1946 à 2002) est un festival de cinéma international se déroulant chaque année à Cannes (Alpes-Maritimes, Provence-Alpes-Côte d'Azur, France) durant douze jours pendant la seconde quinzaine du mois de mai.</h6>
                    
                </div>
                <!-- Jumbotron -->
                <hr></hr>
                <nav id="navbar-example2" class="navbar bg-light px-3 mb-3">
                    <a class="navbar-brand" href="#">Palmarès année 2022</a>
                    <ul class="nav nav-pills">
                      <li class="nav-item">
                        <a class="nav-link" href="#films">Liste des Films</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#jury">Jury</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#palmares">Palmarès</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#annexe">Annexe</a>
                      </li>
                    </ul>
                  </nav>
                <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example  p-3 rounded-2" tabindex="0">
                    <div id="films">
                        <h4>Liste des films :</h4>
                        <div class="row row-cols-1 row-cols-md-2">
                        <xsl:for-each select="/festival_cannes/films/film">
                            
                            <xsl:sort select="titre" />
                            <div class="col mb-4">
                            <xsl:apply-templates select="."/>
                            </div>
                        </xsl:for-each>
                        </div>
                    </div>
                    <div id ="jury">
                        <h4>Jury :</h4>
                        Le jury est composé de: 
                        <ul>
                        <li><xsl:apply-templates select="//artiste[@id = //membre[@role='president']/@artiste]"/></li>
                            <xsl:for-each select="//membre">
                                <xsl:sort select="./@artiste" />
                                <xsl:variable name="id-membre" select="@artiste"></xsl:variable>
                                <xsl:if test="not(./@role='president')">
                                    <li><xsl:apply-templates select="//artiste[@id = $id-membre]"/></li>
                                </xsl:if>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <div id="palmares">
                        <h4>Palmarès :</h4>
                        <div class="d-flex text-centre">
                        <ul class="list-group list-group-light mb-3 centre">
                            <xsl:for-each select="//prix">
                                <li class="list-group-item">
                                    <h6 class="fw-bold"><xsl:value-of select="@nom"/></h6>
                                <xsl:apply-templates select="."/>
                                </li>
                            </xsl:for-each>
                        </ul>
                        </div>
                    </div>
                    <div id="annexe">
                    <h4>Annexe :</h4>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Artiste</th>
                            <th scope="col">Sexe</th>
                            <th scope="col">Pays</th>
                            <th scope="col">Biographie</th>
                        </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="//artiste">
                                <xsl:sort select="nom" />
                                <xsl:if test="count(./biographie)>0">
                                    <xsl:variable name="id-artiste-bio" select="@id"></xsl:variable>
                                    <xsl:variable name="pays-artiste" select="@pays"></xsl:variable>
                                        
                                        <tr>
                                            <th scope="row"><span><xsl:value-of select="nom"/></span><span> <xsl:value-of select="prenom"/></span></th>
                                            <td><xsl:if test="@sexe = 'F'"> Femme</xsl:if><xsl:if test="@sexe = 'M'"> Homme</xsl:if></td>
                                            <td><xsl:value-of select="//pays[@code = $pays-artiste]"/></td>
                                            <td><div id="{$id-artiste-bio}"><xsl:value-of select="biographie"/></div></td>
                                        </tr>
                                    
                                </xsl:if>
                            </xsl:for-each>
                    </tbody>
                </table>
                </div>
            </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="film">
        <xsl:variable name="id-film" select="./@id"></xsl:variable>
        <xsl:variable name="rea-film" select="./casting/@realisateurs"></xsl:variable>
        <xsl:variable name="sena-film" select="./casting/@scenaristes"></xsl:variable>
        
        <div class="card h-100" >
            <div class="card-header"><h5>Titre: <xsl:value-of select="titre"/></h5> </div>
            <div class="card-body">
                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
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
                <h6>Casting:</h6>
                <ul>
                    <xsl:for-each select="//artiste[@id = //film[@id = $id-film]/personnages/personnage/@incarne_par]">
                        <xsl:variable name="id-artiste" select="@id"></xsl:variable> 
                        <li><xsl:apply-templates select="."/> ,<xsl:value-of select="//film[@id = $id-film]/personnages/personnage[@incarne_par = $id-artiste]"/></li>
                    </xsl:for-each>
                </ul>
            </div>
            <div class="card-footer text-muted"><h6>Synopsis :</h6> <p><xsl:value-of select="synopsis"/></p></div>
        </div>
        
        
    </xsl:template>

    <xsl:template match="artiste">
        <xsl:variable name="id-artiste" select="@id"></xsl:variable>
        <xsl:variable name="sexe-artiste" select="@sexe"></xsl:variable>
        <xsl:variable name="pays-artiste" select="@pays"></xsl:variable>
        <a title="Sexe : {$sexe-artiste} Pays : {$pays-artiste}" href="#{$id-artiste}">
            <span><xsl:value-of select="prenom"/>
            </span><span><xsl:value-of select="nom"/></span>
        </a>
    </xsl:template>

    <xsl:template match="prix">
        <ul>
            <xsl:for-each select="attribution">
                <li><xsl:if test="count(@artistes)>0"> Artiste: <xsl:variable name="id-winner" select="@artistes">
                </xsl:variable><xsl:apply-templates select="//artiste[@id=$id-winner]"/></xsl:if> Film: <xsl:value-of select="@film"/></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

</xsl:stylesheet>
