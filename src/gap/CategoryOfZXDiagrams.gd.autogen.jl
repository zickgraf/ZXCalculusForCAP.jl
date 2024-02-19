# SPDX-License-Identifier: GPL-2.0-or-later
# ZXCalculusForCAP: The category of ZX-diagrams
#
# Declarations
#
#! @Chapter The category of ZX diagrams

#! @Section Constructors

#! @Description
#!   Creates a category of ZX diagrams.
#! @Returns a category of zx diagrams
@DeclareGlobalFunction( "CategoryOfZXDiagrams" );

#! @Description
#!  The default instance of the category of ZX diagrams.
#!  It is automatically created while loading this package.
DeclareGlobalName( "ZX" );

#! @Section Filters

#! @Description
#!   The filter of categories of ZX-diagrams.
@DeclareFilter( "IsCategoryOfZXDiagrams", IsCapCategory );

#! @Description
#!   The filter of objects in a category of ZX-diagrams.
@DeclareFilter( "IsZXDiagramObject", IsCapCategoryObject );

#! @Description
#!   The filter of morphisms in a category of ZX-diagrams.
@DeclareFilter( "IsZXDiagramMorphism", IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!   The integer defining an object in a category of ZX-diagrams.
#! @Arguments obj
@DeclareAttribute( "AsInteger", IsZXDiagramObject );

#! @Description
#!   The labeled graph defining a morphism in a category of ZX-diagrams.
#! @Arguments mor
@DeclareAttribute( "VertexLabeledGraph", IsZXDiagramMorphism );

CapJitAddTypeSignature( "VertexLabeledGraph", [ IsZXDiagramMorphism ], CapJitDataTypeOfNTupleOf( 4, CapJitDataTypeOfListOf( IsStringRep ), CapJitDataTypeOfListOf( IsBigInt ), CapJitDataTypeOfListOf( IsBigInt ), CapJitDataTypeOfListOf( CapJitDataTypeOfNTupleOf( 2, IsBigInt, IsBigInt ) ) ) );

# helpers
DeclareGlobalName( "ZX_LabelToInteger" );
DeclareGlobalName( "ZX_IntegerToLabel" );
DeclareGlobalName( "ZX_RemovedInnerNeutralNodes" );
DeclareGlobalName( "S_ZX_EDGES" );

@DeclareGlobalFunction( "SKELETAL_FIN_SETS_ExplicitCoequalizer_primitive_input" );
CapJitAddTypeSignature( "SKELETAL_FIN_SETS_ExplicitCoequalizer_primitive_input", [ IsInt, IsList ], CapJitDataTypeOfListOf( CapJitDataTypeOfListOf( IsInt ) ) );
