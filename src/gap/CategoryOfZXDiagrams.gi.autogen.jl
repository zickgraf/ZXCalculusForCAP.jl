# SPDX-License-Identifier: GPL-2.0-or-later
# ZXCalculusForCAP: The category of ZX-diagrams
#
# Implementations
#

# 0: IO
# 1: green spider == Z, TODO: parametrize
# 2: red spider == X, TODO: parametrize
# 3: Hadamard == H

@BindGlobal( "ZX_LabelToInteger", function ( label )
    
    if (label == "input" || label == "output" || label == "input_output" || label == "neutral")
        
        return BigInt( 0 );
        
    elseif (label == "Z")
        
        return BigInt( 1 );
        
    elseif (label == "X")
        
        return BigInt( 2 );
        
    elseif (label == "H")
        
        return BigInt( 3 );
        
    else
        
        Error( "unkown label ", label );
        
    end;
    
end );

CapJitAddTypeSignature( "ZX_LabelToInteger", [ IsStringRep ], IsBigInt );

@BindGlobal( "ZX_IntegerToLabel", function ( pos, input_positions, output_positions, int )
    
    if (int == BigInt( 0 ))
        
        if (pos in input_positions)
        
            if (pos in output_positions)
                
                return "input_output";
                
            else
                
                return "input";
                
            end;
            
        elseif (pos in output_positions)
            
            return "output";
            
        else
            
            return "neutral";
            
        end;
        
    elseif (int == BigInt( 1 ))
        
        return "Z";
        
    elseif (int == BigInt( 2 ))
        
        return "X";
        
    elseif (int == BigInt( 3 ))
        
        return "H";
        
    else
        
        Error( "unknown integer: ", int );
        
    end;
    
end );

CapJitAddTypeSignature( "ZX_IntegerToLabel", [ IsBigInt, IsList, IsList, IsBigInt ], function ( input_types )
    
    @Assert( 0, input_types[2].element_type.filter == IsBigInt );
    @Assert( 0, input_types[3].element_type.filter == IsBigInt );
    
    return @rec( filter = IsStringRep );
    
end );

@BindGlobal( "S_ZX_EDGES", Immutable( [ [ 0, 0 ], [ 0, 1 ], [ 1, 0 ], [ 0, 2 ], [ 2, 0 ], [ 0, 3 ], [ 3, 0 ] ] ) );

@InstallGlobalFunction( CategoryOfZXDiagrams, function ( )
  local ZX;
    
    if (ValueOption( "no_precompiled_code" ) == true)
        
        if (IsPackageMarkedForLoading( "FunctorCategories", ">= 2023.07-01" ))
            
            ZX = CategoryOfZXDiagrams_as_CategoryOfCospans_CategoryOfDecoratedQuivers(; FinalizeCategory = false );
            
        else
            
            Error( "To get a version of `CategoryOfZXDiagrams` without precompiled code, the package `FunctorCategories` is required." );
            
        end;
        
    else
        
        ZX = CreateCapCategoryWithDataTypes(
            "Category of ZX-diagrams", IsCategoryOfZXDiagrams,
            IsZXDiagramObject, IsZXDiagramMorphism, IsCapCategoryTwoCell,
            IsBigInt, CapJitDataTypeOfNTupleOf( 2, CapJitDataTypeOfListOf( IsStringRep ), CapJitDataTypeOfListOf( CapJitDataTypeOfNTupleOf( 2, IsBigInt, IsBigInt ) ) ), fail
           ; is_computable = false
        );
        
        ZX.category_as_first_argument = true;
        
    end;
    
    SetIsRigidSymmetricClosedMonoidalCategory( ZX, true );
    
    ##
    AddDualOnObjects( ZX, function ( cat, obj )
        
        return obj;
        
    end );
    
    ##
    AddEvaluationForDualWithGivenTensorProduct( ZX, function ( cat, source, obj, range )
      local pair;
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        @Assert( 0, AsInteger( source ) == 2 * AsInteger( obj ) );
        #% CAP_JIT_DROP_NEXT_STATEMENT
        @Assert( 0, AsInteger( range ) == 0 );
        
        pair = PairGAP( ListWithIdenticalEntries( AsInteger( source ), "input" ), List( (0):(AsInteger( obj ) - 1), i -> [ i, AsInteger( source ) - 1 - i ] ) );
        
        return MorphismConstructor( cat, source, pair, range );
        
    end );
    
    ##
    AddCoevaluationForDualWithGivenTensorProduct( ZX, function ( cat, source, obj, range )
      local pair;
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        @Assert( 0, AsInteger( source ) == 0 );
        #% CAP_JIT_DROP_NEXT_STATEMENT
        @Assert( 0, AsInteger( range ) == 2 * AsInteger( obj ) );
        
        pair = PairGAP( ListWithIdenticalEntries( AsInteger( range ), "output" ), List( (0):(AsInteger( obj ) - 1), i -> [ i, AsInteger( range ) - 1 - i ] ) );
        
        return MorphismConstructor( cat, source, pair, range );
        
    end );
    
    if (ValueOption( "no_precompiled_code" ) != true)
        
        ADD_FUNCTIONS_FOR_CategoryOfZXDiagrams_precompiled( ZX );
        
    end;
    
    Finalize( ZX );
    
    return ZX;
    
end );

##
InstallMethod( @__MODULE__,  ViewString,
        "for an object in a category of ZX-diagrams",
        [ IsZXDiagramObject ],
        
  function ( obj )
    
    return @Concatenation( "<An object in ", Name( CapCategory( obj ) ), " representing ", StringGAP( AsInteger( obj ) ), " input/output vertices>" );
    
end );

##
InstallMethod( @__MODULE__,  DisplayString,
        "for an object in a category of ZX-diagrams",
        [ IsZXDiagramObject ],
        
  function ( obj )
    
    return @Concatenation( "An object in ", Name( CapCategory( obj ) ), " representing ", StringGAP( AsInteger( obj ) ), " input/output vertices.\n" );
    
end );

##
InstallMethod( @__MODULE__,  DisplayString,
        "for a morphism in a category of ZX-diagrams",
        [ IsZXDiagramMorphism ],
        
  function ( phi )
    local pair, labels, edges, pos, edge_positions, new_edge, edge_1, edge_2, remaining_indices;
    
    pair = MorphismDatum( phi );
    
    labels = ShallowCopy( pair[1] );
    edges = ShallowCopy( pair[2] );
    
    # remove neutral nodes
    while "neutral" in labels
        
        pos = SafePosition( labels, "neutral" );
        
        # find the edges connecting to the current node
        edge_positions = PositionsProperty( edges, e -> (pos - 1) in e );
        
        new_edge = fail;
        
        # degenerate case: loop
        if (Length( edge_positions ) == 1)
            
            # nothing to
            
        # usual case: two edges
        elseif (Length( edge_positions ) == 2)
            
            edge_1 = edges[edge_positions[1]];
            edge_2 = edges[edge_positions[2]];
            
            new_edge = [ ];
            
            if (edge_1[1] == pos - 1)
                
                @Assert( 0, edge_1[2] != pos - 1 );
                
                Add( new_edge, edge_1[2] );
                
            elseif (edge_1[2] == pos - 1)
                
                @Assert( 0, edge_1[1] != pos - 1 );
                
                Add( new_edge, edge_1[1] );
                
            else
                
                Error( "this should never happen" );
                
            end;
            
            if (edge_2[1] == pos - 1)
                
                @Assert( 0, edge_2[2] != pos - 1 );
                
                Add( new_edge, edge_2[2] );
                
            elseif (edge_2[2] == pos - 1)
                
                @Assert( 0, edge_2[1] != pos - 1 );
                
                Add( new_edge, edge_2[1] );
                
            else
                
                Error( "this should never happen" );
                
            end;
            
        else
            
            Error( "this should never happen" );
            
        end;
            
        Remove( labels, pos );
        
        # we cannot use Remove for the two edges because the position of the second edge might change after the first is removed
        remaining_indices = Difference( (1):(Length( edges )), edge_positions );
        edges = edges[remaining_indices];
        
        if (new_edge != fail)
            
            Add( edges, new_edge );
            
        end;
        
        # adjust edges from/to nodes after the removed node
        edges = List( edges, function ( e )
            
            e = ShallowCopy( e );
            
            @Assert( 0, e[1] != pos - 1 );
            
            if (e[1] > pos - 1)
                
                e[1] = e[1] - 1;
                
            end;
            
            @Assert( 0, e[2] != pos - 1 );
            
            if (e[2] > pos - 1)
                
                e[2] = e[2] - 1;
                
            end;
            
            return e;
            
        end );
        
    end;
    
    return @Concatenation(
        "A morphism in ", Name( CapCategory( phi ) ), " given by a ZX diagram with ", StringGAP( Length( labels ) ), " vertex labels\n",
        "  ", PrintString( labels ), "\n",
        "  and ", StringGAP( Length( edges ) ), " edges\n",
        "  ", PrintString( edges ), ".\n"
    );
    
end );

@InstallGlobalFunction( SKELETAL_FIN_SETS_ExplicitCoequalizer_primitive_input,
  function ( s, D )
    
    s = FinSet( SkeletalFinSets, BigInt( s ) );
    D = List( D, x -> MapOfFinSets( SkeletalFinSets, FinSet( SkeletalFinSets, BigInt( x[1] ) ), List( x[2], y -> BigInt( y ) ), FinSet( SkeletalFinSets, BigInt( x[3] ) ) ) );
    
    return SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D );
    
end );
