<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/produktuak">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/css/styles.min.css" />
        <section class="article-list">
            <div class="container">
                <div class="row articles">
                    <xsl:for-each select="produktua">
                        <div class="col-sm-6 col-md-4 item">
                            <a>
                                <xsl:attribute name="href">

                                </xsl:attribute>
                                <img class="img-fluid">
                                    <xsl:attribute name="src">
                                        ../images/<xsl:value-of select="irudia" />
                                    </xsl:attribute>
                                </img>
                            </a>
                            <h3 class="name"><xsl:value-of select="izena" /></h3>
                            <p class="description">
                                <xsl:value-of select="iruzkina" />
                            </p>
                            <a class="action" href="#">
                                <i class="fa fa-arrow-circle-right" />
                            </a>
                        </div>
                    </xsl:for-each>
                </div>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet> 