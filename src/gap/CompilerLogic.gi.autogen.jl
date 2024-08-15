# SPDX-License-Identifier: GPL-2.0-or-later
# ZXCalculusForCAP: The category of ZX-diagrams
#
# Implementations
#

CapJitAddTypeSignature( "CoproductFunctorial", [ IsCapCategory, IsList ], function ( input_types )
  local category;
    
    category = input_types[1].category;
    
    @Assert( 0, IsSpecializationOfFilter( MorphismFilter( category ), input_types[2].element_type.filter ) );
    
    return CapJitDataTypeOfMorphismOfCategory( category );
    
end );

CapJitAddTypeSignature( "CAP_JIT_INCOMPLETE_LOGIC", [ IsObject ], function ( input_types )
    
    return input_types[1];
    
end );

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "presheaf", "object" ],
        variable_filters = [ IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsCapCategoryObject ],
        src_template = "presheaf( object )",
        dst_template = "ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( CapCategory( presheaf ), presheaf, object )",
    )
);

##
# WARNING: the following is wrong if <morphism> is not a generating morphism
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "presheaf", "morphism" ],
        variable_filters = [ IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsCapCategoryMorphism ],
        src_template = "presheaf( morphism )",
        dst_template = "ValuesOfPreSheaf( presheaf )[2][SafeUniquePositionProperty( SetOfGeneratingMorphisms( Source( CapCategory( presheaf ) ) ), m -> IsEqualForMorphisms( Source( CapCategory( presheaf ) ), m, morphism ) )]",
        new_funcs = [ [ "m" ] ],
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "eta", "object" ],
        variable_filters = [ IsMorphismInPreSheafCategoryOfFpEnrichedCategory, IsCapCategoryObject ],
        src_template = "eta( object )",
        dst_template = "ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( CapCategory( eta ), eta, object )",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ ],
        src_template = "SafeUniquePosition( [ 1, 2 ], 1 )",
        dst_template = "1",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ ],
        src_template = "SafeUniquePosition( [ 1, 2 ], 2 )",
        dst_template = "2",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "value" ],
        src_template = "CAP_JIT_INCOMPLETE_LOGIC( value )",
        dst_template = "value",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ ],
        src_template = "ZX_IntegerToLabel( BigInt( 0 ) )",
        dst_template = "\"neutral\"",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "label" ],
        src_template = "ZX_IntegerToLabel( ZX_LabelToInteger( label ) )",
        dst_template = "label",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "func" ],
        src_template = "ForAll( CapJitTypedExpression( [ ], ( ) -> CapJitDataTypeOfListOf( IsBigInt ) ), func )",
        dst_template = "true",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "s", "D" ],
        src_template = "SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D )",
        dst_template = "SKELETAL_FIN_SETS_ExplicitCoequalizer_primitive_input( Length( s ), List( D, x -> Triple( Length( Source( x ) ), AsList( x ), Length( Range( x ) ) ) ) )",
        new_funcs = [ [ "x" ] ],
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "entry" ],
        src_template = "ListWithIdenticalEntries( 2, entry )",
        dst_template = "[ entry, entry ]",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "from", "to", "x" ],
        src_template = "(from):(to)[1 + x]",
        dst_template = "from + x",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "value", "to" ],
        src_template = "List( (0):(to), i -> value + i )",
        dst_template = "(value):(value + to)",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "value1", "value2", "to" ],
        src_template = "List( (0):(to), i -> value1 + (value2 + i) )",
        dst_template = "(value1 + value2):(value1 + value2 + to)",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "from", "via", "to" ],
        src_template = "@Concatenation( (from):(via - 1), (via):(to) )",
        dst_template = "(from):(to)",
    )
);

##
CapJitAddLogicTemplate(
    @rec(
        variable_names = [ "from", "via1", "via2", "to" ],
        src_template = "@Concatenation( (from):(via1 + (via2 - 1)), (via1 + via2):(to) )",
        dst_template = "(from):(to)",
    )
);
