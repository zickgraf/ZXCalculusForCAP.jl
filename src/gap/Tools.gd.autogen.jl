# SPDX-License-Identifier: GPL-2.0-or-later
# ZXCalculusForCAP: The category of ZX-diagrams
#
# Declarations
#
#! @Chapter Tools

#! @Section Importing and exporting ZX-diagrams

#! @Description
#!   Takes a morphism in a category of ZX-diagrams
#!   and exports the morphism as a JSON string.
#!   This function is only available if the package `json` is available.
#!   See https://github.com/Quantomatic/quantomatic/blob/stable/docs/json_formats.txt
#!   for an overview of the qgraph format.
#! @Arguments morphism
#! @Returns a JSON string
@DeclareGlobalFunction( "ExportAsQGraphString" );

#! @Description
#!   Takes a morphism in a category of ZX-diagrams and a filename **file**
#!   and exports the morphism to **file**.
#!   This function is only available if the package `json` is available.
#!   See https://github.com/Quantomatic/quantomatic/blob/stable/docs/json_formats.txt
#!   for an overview of the qgraph format.
#! @Arguments morphism, filename
@DeclareGlobalFunction( "ExportAsQGraphFile" );

#! @Description
#!   Takes a category of ZX-diagrams and a JSON string describing a ZX-diagram
#!   and imports the ZX-diagram as a morphism.
#!   This function is only available if the package `json` is available.
#!   See https://github.com/Quantomatic/quantomatic/blob/stable/docs/json_formats.txt
#!   for an overview of the qgraph format.
#! @Arguments category, string
#! @Returns a morphism
@DeclareGlobalFunction( "ImportFromQGraphString" );

#! @Description
#!   Takes a category of ZX-diagrams and a filename **file**
#!   and imports the ZX-diagram in **file** as a morphism.
#!   This function is only available if the package `json` is available.
#!   See https://github.com/Quantomatic/quantomatic/blob/stable/docs/json_formats.txt
#!   for an overview of the qgraph format.
#! @Arguments category, filename
#! @Returns a morphism
@DeclareGlobalFunction( "ImportFromQGraphFile" );
