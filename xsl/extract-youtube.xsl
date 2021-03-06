<?xml version='1.0'?>

<!--********************************************************************
Copyright 2014-2016 Robert A. Beezer

This file is part of MathBook XML.

MathBook XML is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 or version 3 of the
License (at your option).

MathBook XML is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with MathBook XML.  If not, see <http://www.gnu.org/licenses/>.
*********************************************************************-->

<!-- This stylesheet locates <latex-image-code> elements   -->
<!-- and wraps them for LaTeX processing                   -->
<!-- This includes the LaTeX macros present in docinfo     -->
<!-- and the document's docinfo/latex-image-preamble       -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
    xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl"
>

<!-- Get internal ID's for filenames, etc -->
<xsl:import href="./pretext-common.xsl" />

<!-- Get "scratch" directory        -->
<!-- and a "subtree" xml:id value   -->
<!-- Then walk the XML source tree  -->
<!-- applying specializations below -->
<xsl:import href="./extract-identity.xsl" />

<!-- Output Python as text -->
<xsl:output method="text" />

<!-- Enclosing structure is a Python list -->
<!-- So wrap at outermost level           -->
<xsl:template match="/">
    <xsl:text>[</xsl:text>
    <xsl:apply-imports />
    <xsl:text>]</xsl:text>
</xsl:template>

<!-- YouTube ID, and internal id as a Python pair -->
<xsl:template match="video[@youtube]">
    <xsl:text>('</xsl:text>
    <xsl:value-of select="@youtube" />
    <xsl:text>', '</xsl:text>
    <xsl:apply-templates select="." mode="internal-id" />
    <xsl:text>'), </xsl:text>
</xsl:template>

</xsl:stylesheet>
