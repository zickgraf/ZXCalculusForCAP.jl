# SPDX-License-Identifier: GPL-2.0-or-later
# ZXCalculusForCAP: The category of ZX-diagrams
#
# Declarations
#
#! @Chapter The category of cospans

#! @Section Constructors

#! @Description
#!   Creates a category of cospans in the cocartesian category <A>C</A>
#!   with a rigid symmetric monoidal structure induced by the cocartesian structure of <A>C</A>.
#! @Returns a category of cospans
#! @Arguments C
@DeclareOperation( "CategoryOfCospans_for_ZXCalculus",
                  [ IsCapCategory ] );

#! @Section Filters

#! @Description
#!   The filter of categories of cospans.
@DeclareFilter( "IsCategoryOfCospans", IsCapCategory );

#! @Description
#!   The filter of objects in a category of cospans.
@DeclareFilter( "IsCategoryOfCospansObject", IsCapCategoryObject );

#! @Description
#!   The filter of morphisms in a category of cospans.
@DeclareFilter( "IsCategoryOfCospansMorphism", IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!   The category underlying a category of cospans.
#! @Arguments obj
@DeclareAttribute( "UnderlyingCategory", IsCategoryOfCospans );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsCategoryOfCospans ], function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!   The object defining an object in a category of cospans.
#! @Arguments obj
@DeclareAttribute( "UnderlyingObject", IsCategoryOfCospansObject );

CapJitAddTypeSignature( "UnderlyingObject", [ IsCategoryOfCospansObject ], function ( input_types )
    
    @Assert( 0, IsCategoryOfCospans( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!   The pair of morphisms defining a morphism in a category of cospans.
#! @Arguments obj
@DeclareAttribute( "UnderlyingMorphismPair", IsCategoryOfCospansMorphism );

CapJitAddTypeSignature( "UnderlyingMorphismPair", [ IsCategoryOfCospansMorphism ], function ( input_types )
  local underlying_cat;
    
    @Assert( 0, IsCategoryOfCospans( input_types[1].category ) );
    
    underlying_cat = UnderlyingCategory( input_types[1].category );
    
    return CapJitDataTypeOfNTupleOf( 2, CapJitDataTypeOfMorphismOfCategory( underlying_cat ), CapJitDataTypeOfMorphismOfCategory( underlying_cat ) );
    
end );
