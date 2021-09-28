<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/produktuak">
        <tr bgcolor="#9acd32">
            <th style="text-align:left">Kodea</th>
            <th style="text-align:left">Izena</th>
            <th style="text-align:left">Prezioa</th>
            <th style="text-align:left">Irudia</th>
        </tr>
        <xsl:for-each select="produktua">
            <tr>
                <td><xsl:value-of select="produktu-kodea" /></td>
                <td><xsl:value-of select="izena" /></td>
                <td><xsl:value-of select="prezioa" /></td>
                <td>
                    <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="irudia" />
                    </xsl:attribute>
                    </img>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet> 