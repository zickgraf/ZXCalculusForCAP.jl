# SPDX-License-Identifier: GPL-2.0-or-later
# ZXCalculusForCAP: The category of ZX-diagrams
#
# Implementations
#

@InstallMethod( CategoryOfCospans_for_ZXCalculus,
               [ IsCapCategory ],
               
  function ( underlying_cat )
    local cat;
    
    cat = CreateCapCategoryWithDataTypes(
        @Concatenation( "CategoryOfCospans( ", Name( underlying_cat ), " )" ), IsCategoryOfCospans,
        IsCategoryOfCospansObject, IsCategoryOfCospansMorphism, IsCapCategoryTwoCell,
        CapJitDataTypeOfObjectOfCategory( underlying_cat ), CapJitDataTypeOfNTupleOf( 2, CapJitDataTypeOfMorphismOfCategory( underlying_cat ), CapJitDataTypeOfMorphismOfCategory( underlying_cat ) ), fail
    );
    
    cat.is_computable = false;
    
    cat.compiler_hints = @rec(
        category_attribute_names = [
            "UnderlyingCategory",
        ],
    );
    
    SetUnderlyingCategory( cat, underlying_cat );
    
    SetIsRigidSymmetricClosedMonoidalCategory( cat, true );
    
    ##
    AddObjectConstructor( cat, function ( cat, underlying_object )
      local obj;
        
        obj = CreateCapCategoryObjectWithAttributes( cat, UnderlyingObject, underlying_object );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        @Assert( 0, IsWellDefinedForObjects( cat, obj ) );
        
        return obj;
        
    end );
    
    ##
    AddObjectDatum( cat, function ( cat, obj )
        
        return UnderlyingObject( obj );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "IsWellDefinedForObjects" ) );
    
    AddIsWellDefinedForObjects( cat, function ( cat, obj )
        
        return IsWellDefinedForObjects( UnderlyingCategory( cat ), UnderlyingObject( obj ) );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "IsEqualForObjects" ) );
    
    AddIsEqualForObjects( cat, function ( cat, obj1, obj2 )
        
        return IsEqualForObjects( UnderlyingCategory( cat ), UnderlyingObject( obj1 ), UnderlyingObject( obj2 ) );
        
    end );
    
    ##
    AddMorphismConstructor( cat, function ( cat, source, underlying_morphism_pair, range )
      local mor;
        
        mor = CreateCapCategoryMorphismWithAttributes( cat, source, range, UnderlyingMorphismPair, underlying_morphism_pair );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        @Assert( 0, IsWellDefinedForMorphisms( cat, mor ) );
        
        return mor;
        
    end );
    
    ##
    AddMorphismDatum( cat, function ( cat, mor )
        
        return UnderlyingMorphismPair( mor );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "IsEqualForObjects" ) );
    @Assert( 0, CanCompute( underlying_cat, "IsWellDefinedForMorphisms" ) );
    
    AddIsWellDefinedForMorphisms( cat, function ( cat, mor )
      local underlying_category, pair;
        
        underlying_category = UnderlyingCategory( cat );
        
        pair = UnderlyingMorphismPair( mor );
        
        return IsEqualForObjects( underlying_category, UnderlyingObject( Source( mor ) ), Source( pair[1] ) ) &&
               IsEqualForObjects( underlying_category, UnderlyingObject( Range( mor ) ), Source( pair[2] ) ) &&
               IsEqualForObjects( underlying_category, Range( pair[1] ), Range( pair[2] ) ) &&
               IsWellDefinedForMorphisms( underlying_category, pair[1] ) &&
               IsWellDefinedForMorphisms( underlying_category, pair[2] );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "IsEqualForObjects" ) );
    @Assert( 0, CanCompute( underlying_cat, "IsEqualForMorphisms" ) );
    
    AddIsEqualForMorphisms( cat, function ( cat, mor1, mor2 )
      local underlying_cat, pair1, pair2;
        
        underlying_cat = UnderlyingCategory( cat );
        
        pair1 = UnderlyingMorphismPair( mor1 );
        pair2 = UnderlyingMorphismPair( mor2 );
        
        return IsEqualForObjects( underlying_cat, Range( pair1[1] ), Range( pair2[1] ) ) &&
               IsEqualForMorphisms( underlying_cat, pair1[1], pair2[1] ) &&
               IsEqualForMorphisms( underlying_cat, pair1[2], pair2[2] );
        
    end );
    
    # TODO
    # https://arxiv.org/pdf/1704.07034.pdf, "Categorifying the ZX-calculus", Daniel Cicala
    # AddIsCongruentForMorphisms: "By taking isomorphism classes of these pushouts, we obtain a category whose objects are those in the image of N and morphisms are open graphs."
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "InjectionOfCofactorOfPushout" ) );
    @Assert( 0, CanCompute( underlying_cat, "PreCompose" ) );
    
    AddPreCompose( cat, function ( cat, mor1, mor2 )
      local underlying_cat, pair1, pair2, pushout_diagram, injection_left, injection_right;
        
        underlying_cat = UnderlyingCategory( cat );
        
        pair1 = UnderlyingMorphismPair( mor1 );
        pair2 = UnderlyingMorphismPair( mor2 );
        
        pushout_diagram = [ pair1[2], pair2[1] ];
        
        injection_left = InjectionOfCofactorOfPushout( underlying_cat, pushout_diagram, 1 );
        
        injection_right = InjectionOfCofactorOfPushout( underlying_cat, pushout_diagram, 2 );
        
        return MorphismConstructor( cat, Source( mor1 ), PairGAP( PreCompose( underlying_cat, pair1[1], injection_left ), PreCompose( underlying_cat, pair2[2], injection_right ) ), Range( mor2 ) );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "IdentityMorphism" ) );
    
    AddIdentityMorphism( cat, function ( cat, obj )
      local underlying_cat, underlying_obj;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_obj = UnderlyingObject( obj );
        
        return MorphismConstructor( cat, obj, PairGAP( IdentityMorphism( underlying_cat, underlying_obj ), IdentityMorphism( underlying_cat, underlying_obj ) ), obj );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "Coproduct" ) );
    
    AddTensorProductOnObjects( cat, function ( cat, a, b )
      local underlying_cat, underlying_a, underlying_b;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_a = UnderlyingObject( a );
        underlying_b = UnderlyingObject( b );
        
        return ObjectConstructor( cat, Coproduct( underlying_cat, [ underlying_a, underlying_b ] ) );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CoproductFunctorial" ) );
    
    AddTensorProductOnMorphismsWithGivenTensorProducts( cat, function ( cat, s, alpha, beta, r )
      local underlying_cat, pair_alpha, pair_beta;
        
        underlying_cat = UnderlyingCategory( cat );
        pair_alpha = UnderlyingMorphismPair( alpha );
        pair_beta = UnderlyingMorphismPair( beta );
        
        return MorphismConstructor( cat, s, PairGAP( CoproductFunctorial( underlying_cat, [ pair_alpha[1], pair_beta[1] ] ), CoproductFunctorial( underlying_cat, [ pair_alpha[2], pair_beta[2] ] ) ), r );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "InitialObject" ) );
    
    AddTensorUnit( cat, function ( cat )
      local underlying_cat;
        
        underlying_cat = UnderlyingCategory( cat );
        
        return ObjectConstructor( cat, InitialObject( underlying_cat ) );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianAssociatorLeftToRightWithGivenCoproducts" ) );
    
    AddAssociatorLeftToRightWithGivenTensorProducts( cat, function ( cat, s, a, b, c, r )
      local underlying_cat, underlying_s, underlying_a, underlying_b, underlying_c, underlying_r, underlying_associator;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_s = UnderlyingObject( s );
        underlying_a = UnderlyingObject( a );
        underlying_b = UnderlyingObject( b );
        underlying_c = UnderlyingObject( c );
        underlying_r = UnderlyingObject( r );
        
        underlying_associator = CocartesianAssociatorLeftToRightWithGivenCoproducts( underlying_cat, underlying_s, underlying_a, underlying_b, underlying_c, underlying_r );
        
        return MorphismConstructor( cat, s, PairGAP( underlying_associator, IdentityMorphism( underlying_cat, underlying_r ) ), r );
        
    end );
    
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianAssociatorRightToLeftWithGivenCoproducts" ) );
    
    AddAssociatorRightToLeftWithGivenTensorProducts( cat, function ( cat, s, a, b, c, r )
      local underlying_cat, underlying_s, underlying_a, underlying_b, underlying_c, underlying_r, underlying_associator;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_s = UnderlyingObject( s );
        underlying_a = UnderlyingObject( a );
        underlying_b = UnderlyingObject( b );
        underlying_c = UnderlyingObject( c );
        underlying_r = UnderlyingObject( r );
        
        underlying_associator = CocartesianAssociatorRightToLeftWithGivenCoproducts( underlying_cat, underlying_s, underlying_a, underlying_b, underlying_c, underlying_r );
        
        return MorphismConstructor( cat, s, PairGAP( underlying_associator, IdentityMorphism( underlying_cat, underlying_r ) ), r );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianLeftUnitorWithGivenCoproduct" ) );
    
    AddLeftUnitorWithGivenTensorProduct( cat, function ( cat, a, s )
      local underlying_cat, underlying_a, underlying_s, underlying_left_unitor;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_a = UnderlyingObject( a );
        underlying_s = UnderlyingObject( s );
        
        underlying_left_unitor = CocartesianLeftUnitorWithGivenCoproduct( underlying_cat, underlying_a, underlying_s );
        
        return MorphismConstructor( cat, s, PairGAP( underlying_left_unitor, IdentityMorphism( underlying_cat, underlying_a ) ), a );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianLeftUnitorInverseWithGivenCoproduct" ) );
    
    AddLeftUnitorInverseWithGivenTensorProduct( cat, function ( cat, a, s )
      local underlying_cat, underlying_a, underlying_s, underlying_left_unitor;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_a = UnderlyingObject( a );
        underlying_s = UnderlyingObject( s );
        
        underlying_left_unitor = CocartesianLeftUnitorInverseWithGivenCoproduct( underlying_cat, underlying_a, underlying_s );
        
        return MorphismConstructor( cat, a, PairGAP( underlying_left_unitor, IdentityMorphism( underlying_cat, underlying_a ) ), s );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianRightUnitorWithGivenCoproduct" ) );
    
    AddRightUnitorWithGivenTensorProduct( cat, function ( cat, a, r )
      local underlying_cat, underlying_a, underlying_r, underlying_right_unitor;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_a = UnderlyingObject( a );
        underlying_r = UnderlyingObject( r );
        
        underlying_right_unitor = CocartesianRightUnitorWithGivenCoproduct( underlying_cat, underlying_a, underlying_r );
        
        return MorphismConstructor( cat, a, PairGAP( underlying_right_unitor, IdentityMorphism( underlying_cat, underlying_r ) ), r );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianRightUnitorInverseWithGivenCoproduct" ) );
    
    AddRightUnitorInverseWithGivenTensorProduct( cat, function ( cat, a, r )
      local underlying_cat, underlying_a, underlying_r, underlying_right_unitor;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_a = UnderlyingObject( a );
        underlying_r = UnderlyingObject( r );
        
        underlying_right_unitor = CocartesianRightUnitorInverseWithGivenCoproduct( underlying_cat, underlying_a, underlying_r );
        
        return MorphismConstructor( cat, r, PairGAP( underlying_right_unitor, IdentityMorphism( underlying_cat, underlying_r ) ), a );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianBraidingWithGivenCoproducts" ) );
    
    AddBraidingWithGivenTensorProducts( cat, function ( cat, s, a, b, r )
      local underlying_cat, underlying_s, underlying_a, underlying_b, underlying_r, underlying_braiding;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_s = UnderlyingObject( s );
        underlying_a = UnderlyingObject( a );
        underlying_b = UnderlyingObject( b );
        underlying_r = UnderlyingObject( r );
        
        underlying_braiding = CocartesianBraidingWithGivenCoproducts( underlying_cat, underlying_s, underlying_a, underlying_b, underlying_r );
        
        return MorphismConstructor( cat, s, PairGAP( underlying_braiding, IdentityMorphism( underlying_cat, underlying_r ) ), r );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianBraidingInverseWithGivenCoproducts" ) );
    
    AddBraidingInverseWithGivenTensorProducts( cat, function ( cat, s, a, b, r )
      local underlying_cat, underlying_s, underlying_a, underlying_b, underlying_r, underlying_braiding;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_s = UnderlyingObject( s );
        underlying_a = UnderlyingObject( a );
        underlying_b = UnderlyingObject( b );
        underlying_r = UnderlyingObject( r );
        
        underlying_braiding = CocartesianBraidingInverseWithGivenCoproducts( underlying_cat, underlying_s, underlying_a, underlying_b, underlying_r );
        
        return MorphismConstructor( cat, s, PairGAP( underlying_braiding, IdentityMorphism( underlying_cat, underlying_r ) ), r );
        
    end );
    
    ##
    AddDualOnObjects( cat, function ( cat, obj )
        
        return obj;
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianCodiagonal" ) );
    @Assert( 0, CanCompute( underlying_cat, "UniversalMorphismFromInitialObject" ) );
    
    AddEvaluationForDualWithGivenTensorProduct( cat, function ( cat, source, obj, range )
      local underlying_cat, underlying_obj;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_obj = UnderlyingObject( obj );
        
        return MorphismConstructor( cat, source, PairGAP( CocartesianCodiagonal( underlying_cat, underlying_obj, 2 ), UniversalMorphismFromInitialObject( underlying_cat, underlying_obj ) ), range );
        
    end );
    
    ##
    @Assert( 0, CanCompute( underlying_cat, "CocartesianCodiagonal" ) );
    @Assert( 0, CanCompute( underlying_cat, "UniversalMorphismFromInitialObject" ) );
    
    AddCoevaluationForDualWithGivenTensorProduct( cat, function ( cat, source, obj, range )
      local underlying_cat, underlying_obj;
        
        underlying_cat = UnderlyingCategory( cat );
        underlying_obj = UnderlyingObject( obj );
        
        return MorphismConstructor( cat, source, PairGAP( UniversalMorphismFromInitialObject( underlying_cat, underlying_obj ), CocartesianCodiagonal( underlying_cat, underlying_obj, 2 ) ), range );
        
    end );
    
    Finalize( cat );
    
    return cat;
    
end );
