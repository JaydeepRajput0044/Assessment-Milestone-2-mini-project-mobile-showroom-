<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
    <title>Mobile Phone Sales Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
            text-align: center;
        }
        h2 {
            background-color: #0074D9;
            color: white;
            padding: 10px;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin: auto;
            background: #fff;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .high {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Mobile Phone Sales Summary</h2>
    <table>
        <tr>
            <th>Store Name</th>
            <th>Model ID</th>
            <th>Model Name</th>
            <th>Brand</th>
            <th>Price</th>
            <th>Color</th>
            <th>SIM Size</th>
            <th>Memory</th>
            <th>Camera</th>
            <th>TouchScreen</th>
            <th>Units Sold</th>
        </tr>

        <xsl:for-each select="MobileSales/Store/Phone">
            <tr>
                <td><xsl:value-of select="../storeName"/></td>
                <td><xsl:value-of select="ModelID"/></td>
                <td><xsl:value-of select="ModelName"/></td>
                <td><xsl:value-of select="Brand"/></td>
                <td><xsl:value-of select="Price"/></td>
                <td><xsl:value-of select="Color"/></td>
                <td><xsl:value-of select="SIMSize"/></td>
                <td><xsl:value-of select="Memory"/></td>
                <td><xsl:value-of select="Camera"/></td>
                <td><xsl:value-of select="TouchScreen"/></td>

                <!-- Conditional Formatting: Red if NoSold > 10 -->
                <td>
                    <xsl:choose>
                        <xsl:when test="NoSold &gt; 10">
                            <span class="high"><xsl:value-of select="NoSold"/></span>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="NoSold"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </xsl:for-each>
    </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
