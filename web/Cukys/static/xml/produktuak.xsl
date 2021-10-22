<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/produktuak">
        <div class="tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                    <div class="row">
                        <xsl:for-each select="produktua">
                            <div class="col-lg-4 col-md-6 special-grid drinks">
                                <button class="erosi" style="background: transparent;border: none !important;">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="produktu-kodea" />
                                    </xsl:attribute>
                                    <div class="gallery-single fix">
                                        <img class="img-fluid" alt="Image">
                                            <xsl:attribute name="src">
                                                ../<xsl:value-of select="irudia" />
                                            </xsl:attribute>
                                        </img>
                                        <div class="why-text">
                                            <h4><xsl:value-of select="izena" /></h4>
                                            <p><xsl:value-of select="iruzkina" /></p>
                                            <h5>
                                                <xsl:value-of select="prezioa" />
                                                <xsl:text disable-output-escaping="yes">
                                                    <![CDATA[€]]>
                                                </xsl:text>
                                            </h5>
                                        </div>
                                    </div>
                                </button>
                            </div>
                        </xsl:for-each>
                    </div>

            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <div class="row">
                    <xsl:for-each select="produktua[mota='Chocolate']">
                        <div class="col-lg-4 col-md-6 special-grid drinks">
                                <button class="erosi" style="background: transparent;border: none !important;">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="produktu-kodea" />
                                    </xsl:attribute>
                                    <div class="gallery-single fix">
                                        <img class="img-fluid" alt="Image">
                                            <xsl:attribute name="src">
                                                ../<xsl:value-of select="irudia" />
                                            </xsl:attribute>
                                        </img>
                                        <div class="why-text">
                                            <h4><xsl:value-of select="izena" /></h4>
                                            <p><xsl:value-of select="iruzkina" /></p>
                                            <h5>
                                                <xsl:value-of select="prezioa" />
                                                <xsl:text disable-output-escaping="yes">
                                                    <![CDATA[€]]>
                                                </xsl:text>
                                            </h5>
                                        </div>
                                    </div>
                                </button>
                            </div>
                    </xsl:for-each>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                <div class="row">
                    <xsl:for-each select="produktua[mota='Fruta']">
                        <div class="col-lg-4 col-md-6 special-grid drinks">
                            <button class="erosi" style="background: transparent;border: none !important;">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="produktu-kodea" />
                                </xsl:attribute>
                                <div class="gallery-single fix">
                                    <img class="img-fluid" alt="Image">
                                        <xsl:attribute name="src">
                                            ../<xsl:value-of select="irudia" />
                                        </xsl:attribute>
                                    </img>
                                    <div class="why-text">
                                        <h4><xsl:value-of select="izena" /></h4>
                                        <p><xsl:value-of select="iruzkina" /></p>
                                        <h5>
                                            <xsl:value-of select="prezioa" />
                                            <xsl:text disable-output-escaping="yes">
                                                <![CDATA[€]]>
                                            </xsl:text>
                                        </h5>
                                    </div>
                                </div>
                            </button>
                        </div>
                    </xsl:for-each>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                <div class="row">
                    <xsl:for-each select="produktua[mota='Simple']">
                        <div class="col-lg-4 col-md-6 special-grid drinks">
                            <button class="erosi" style="background: transparent;border: none !important;">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="produktu-kodea" />
                                </xsl:attribute>
                                <div class="gallery-single fix">
                                    <img class="img-fluid" alt="Image">
                                        <xsl:attribute name="src">
                                            ../<xsl:value-of select="irudia" />
                                        </xsl:attribute>
                                    </img>
                                    <div class="why-text">
                                        <h4><xsl:value-of select="izena" /></h4>
                                        <p><xsl:value-of select="iruzkina" /></p>
                                        <h5>
                                            <xsl:value-of select="prezioa" />
                                            <xsl:text disable-output-escaping="yes">
                                                <![CDATA[€]]>
                                            </xsl:text>
                                        </h5>
                                    </div>
                                </div>
                            </button>
                        </div>
                    </xsl:for-each>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet> 