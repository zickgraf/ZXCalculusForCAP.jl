# SPDX-License-Identifier: GPL-2.0-or-later
# ZXCalculusForCAP: The category of ZX-diagrams
#
# Implementations
#
@BindGlobal( "ADD_FUNCTIONS_FOR_CategoryOfZXDiagrams_precompiled", function ( cat )
    
    ##
    AddAssociatorLeftToRightWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, c_1, r_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 = AsInteger( c_1 );
    deduped_9_1 = AsInteger( b_1 );
    deduped_8_1 = AsInteger( a_1 );
    deduped_7_1 = deduped_9_1 + deduped_10_1;
    deduped_6_1 = (0):(AsInteger( r_1 ) - 1);
    hoisted_5_1 = BigInt( 0 );
    hoisted_2_1 = (deduped_9_1):(deduped_7_1 - 1);
    deduped_1_1 = (deduped_8_1):(deduped_8_1 + deduped_7_1 - 1);
    hoisted_3_1 = @Concatenation( @Concatenation( (0):(deduped_8_1 - 1), List( (0):(deduped_9_1 - 1), function ( i_2 )
                return deduped_1_1[1 + i_2];
            end ) ), List( (0):(deduped_10_1 - 1), function ( i_2 )
              return deduped_1_1[1 + hoisted_2_1[(1 + i_2)]];
          end ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, NTupleGAP( 2, List( deduped_6_1, function ( i_2 )
                return ZX_IntegerToLabel( i_2, hoisted_3_1, deduped_6_1, hoisted_5_1 );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddAssociatorRightToLeftWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, c_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 = AsInteger( b_1 );
    deduped_7_1 = AsInteger( a_1 );
    deduped_6_1 = deduped_7_1 + deduped_8_1;
    deduped_5_1 = (0):(AsInteger( r_1 ) - 1);
    hoisted_4_1 = BigInt( 0 );
    hoisted_1_1 = (deduped_7_1):(deduped_6_1 - 1);
    hoisted_2_1 = @Concatenation( (0):(deduped_7_1 - 1), @Concatenation( List( (0):(deduped_8_1 - 1), function ( i_2 )
                return hoisted_1_1[1 + i_2];
            end ), (deduped_6_1):(deduped_6_1 + AsInteger( c_1 ) - 1) ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, NTupleGAP( 2, List( deduped_5_1, function ( i_2 )
                return ZX_IntegerToLabel( i_2, hoisted_2_1, deduped_5_1, hoisted_4_1 );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddBraidingInverseWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 = AsInteger( a_1 );
    deduped_4_1 = (0):(AsInteger( r_1 ) - 1);
    hoisted_3_1 = BigInt( 0 );
    hoisted_1_1 = @Concatenation( (deduped_5_1):(deduped_5_1 + AsInteger( b_1 ) - 1), (0):(deduped_5_1 - 1) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, NTupleGAP( 2, List( deduped_4_1, function ( i_2 )
                return ZX_IntegerToLabel( i_2, hoisted_1_1, deduped_4_1, hoisted_3_1 );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddBraidingWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 = AsInteger( b_1 );
    deduped_4_1 = (0):(AsInteger( r_1 ) - 1);
    hoisted_3_1 = BigInt( 0 );
    hoisted_1_1 = @Concatenation( (deduped_5_1):(deduped_5_1 + AsInteger( a_1 ) - 1), (0):(deduped_5_1 - 1) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, NTupleGAP( 2, List( deduped_4_1, function ( i_2 )
                return ZX_IntegerToLabel( i_2, hoisted_1_1, deduped_4_1, hoisted_3_1 );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddCoevaluationForDualWithGivenTensorProduct( cat,
        
########
function ( cat_1, s_1, a_1, r_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 = AsInteger( r_1 );
    hoisted_1_1 = deduped_2_1 - 1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, NTupleGAP( 2, ListWithIdenticalEntries( deduped_2_1, "output" ), List( (0):(AsInteger( a_1 ) - 1), function ( i_2 )
                return [ i_2, hoisted_1_1 - i_2 ];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddDualOnObjects( cat,
        
########
function ( cat_1, a_1 )
    return a_1;
end
########
        
    , 100 );
    
    ##
    AddEvaluationForDualWithGivenTensorProduct( cat,
        
########
function ( cat_1, s_1, a_1, r_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 = AsInteger( s_1 );
    hoisted_1_1 = deduped_2_1 - 1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, NTupleGAP( 2, ListWithIdenticalEntries( deduped_2_1, "input" ), List( (0):(AsInteger( a_1 ) - 1), function ( i_2 )
                return [ i_2, hoisted_1_1 - i_2 ];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local hoisted_2_1, deduped_3_1;
    deduped_3_1 = (0):(AsInteger( a_1 ) - 1);
    hoisted_2_1 = BigInt( 0 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, VertexLabeledGraph, NTupleGAP( 2, List( deduped_3_1, function ( i_2 )
                return ZX_IntegerToLabel( i_2, deduped_3_1, deduped_3_1, hoisted_2_1 );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 = VertexLabeledGraph( arg3_1 );
    deduped_11_1 = VertexLabeledGraph( arg2_1 );
    deduped_10_1 = deduped_12_1[2];
    deduped_9_1 = deduped_11_1[2];
    deduped_8_1 = deduped_12_1[1];
    deduped_7_1 = deduped_11_1[1];
    deduped_6_1 = List( deduped_8_1, ZX_LabelToInteger );
    deduped_5_1 = List( deduped_7_1, ZX_LabelToInteger );
    deduped_4_1 = [ "output", "input_output" ];
    deduped_3_1 = [ "input", "input_output" ];
    return Length( deduped_7_1 ) == Length( deduped_8_1 ) && Length( deduped_9_1 ) == Length( deduped_10_1 ) && (List( deduped_9_1, function ( a_2 )
                        return a_2[1];
                    end ) == List( deduped_10_1, function ( a_2 )
                        return a_2[1];
                    end ) && List( deduped_9_1, function ( a_2 )
                        return a_2[2];
                    end ) == List( deduped_10_1, function ( a_2 )
                        return a_2[2];
                    end )) && (deduped_5_1 == deduped_6_1 && List( deduped_9_1, function ( edge_2 )
                      local hoisted_1_2;
                      hoisted_1_2 = NTupleGAP( 2, deduped_5_1[1 + edge_2[1]], deduped_5_1[1 + edge_2[2]] );
                      return BigInt( SafePositionProperty( S_ZX_EDGES, function ( e_3 )
                                  return (e_3 == hoisted_1_2);
                              end ) ) - 1;
                  end ) == List( deduped_10_1, function ( edge_2 )
                      local hoisted_1_2;
                      hoisted_1_2 = NTupleGAP( 2, deduped_6_1[1 + edge_2[1]], deduped_6_1[1 + edge_2[2]] );
                      return BigInt( SafePositionProperty( S_ZX_EDGES, function ( e_3 )
                                  return (e_3 == hoisted_1_2);
                              end ) ) - 1;
                  end )) && (List( PositionsProperty( deduped_8_1, function ( x_2 )
                      return (x_2 in deduped_3_1);
                  end ), function ( p_2 )
                    return BigInt( p_2 ) - 1;
                end ) == List( PositionsProperty( deduped_7_1, function ( x_2 )
                      return (x_2 in deduped_3_1);
                  end ), function ( p_2 )
                    return BigInt( p_2 ) - 1;
                end ) && true) && (List( PositionsProperty( deduped_8_1, function ( x_2 )
                    return (x_2 in deduped_4_1);
                end ), function ( p_2 )
                  return BigInt( p_2 ) - 1;
              end ) == List( PositionsProperty( deduped_7_1, function ( x_2 )
                    return (x_2 in deduped_4_1);
                end ), function ( p_2 )
                  return BigInt( p_2 ) - 1;
              end ) && true);
end
########
        
    , 100 );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 = BigInt( 0 );
    deduped_2_1 = AsInteger( arg3_1 );
    deduped_1_1 = AsInteger( arg2_1 );
    return deduped_1_1 == deduped_2_1 && true && (true && true) && (ListWithIdenticalEntries( deduped_1_1, deduped_3_1 ) == ListWithIdenticalEntries( deduped_2_1, deduped_3_1 ) && true);
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, deduped_2_1, deduped_4_1, hoisted_5_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1;
    deduped_21_1 = true && true;
    deduped_20_1 = BigInt( 0 );
    deduped_19_1 = deduped_21_1 && true;
    deduped_18_1 = deduped_21_1 && deduped_21_1;
    deduped_17_1 = deduped_19_1 && deduped_19_1;
    deduped_16_1 = deduped_18_1 && deduped_18_1;
    deduped_15_1 = deduped_18_1 && deduped_21_1;
    deduped_14_1 = AsInteger( Range( arg2_1 ) );
    deduped_13_1 = AsInteger( Source( arg2_1 ) );
    deduped_12_1 = VertexLabeledGraph( arg2_1 )[1];
    hoisted_5_1 = [ "output", "input_output" ];
    deduped_11_1 = PositionsProperty( deduped_12_1, function ( x_2 )
            return x_2 in hoisted_5_1;
        end );
    hoisted_1_1 = [ "input", "input_output" ];
    deduped_10_1 = PositionsProperty( deduped_12_1, function ( x_2 )
            return x_2 in hoisted_1_1;
        end );
    if (@not true)
        deduped_9_1 = false;
    elseif (deduped_20_1 != 0)
        deduped_9_1 = false;
    else
        deduped_9_1 = true;
    end;
    deduped_8_1 = List( deduped_11_1, function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    deduped_7_1 = List( deduped_10_1, function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    deduped_4_1 = List( deduped_12_1, ZX_LabelToInteger );
    deduped_2_1 = Length( deduped_12_1 );
    return deduped_15_1 && deduped_15_1 && deduped_15_1 && (deduped_16_1 && (IdFunc( function (  )
                          if (@not ForAll( deduped_7_1, function ( a_3 )
                                       return (IsBigInt( a_3 ) && a_3 >= 0);
                                   end ))
                              return false;
                          elseif (deduped_13_1 != Length( deduped_10_1 ))
                              return false;
                          elseif (@not ForAll( deduped_7_1, function ( a_3 )
                                       return a_3 < deduped_2_1;
                                   end ))
                              return false;
                          else
                              return true;
                          end;
                          return;
                      end )(  ) && deduped_9_1 && deduped_17_1) && (ListWithIdenticalEntries( deduped_13_1, deduped_20_1 ) == List( (0):(deduped_13_1 - 1), function ( i_2 )
                      return deduped_4_1[1 + deduped_7_1[(1 + i_2)]];
                  end ) && true)) && (deduped_16_1 && (IdFunc( function (  )
                        if (@not ForAll( deduped_8_1, function ( a_3 )
                                     return (IsBigInt( a_3 ) && a_3 >= 0);
                                 end ))
                            return false;
                        elseif (deduped_14_1 != Length( deduped_11_1 ))
                            return false;
                        elseif (@not ForAll( deduped_8_1, function ( a_3 )
                                     return a_3 < deduped_2_1;
                                 end ))
                            return false;
                        else
                            return true;
                        end;
                        return;
                    end )(  ) && deduped_9_1 && deduped_17_1) && (ListWithIdenticalEntries( deduped_14_1, deduped_20_1 ) == List( (0):(deduped_14_1 - 1), function ( i_2 )
                    return deduped_4_1[1 + deduped_8_1[(1 + i_2)]];
                end ) && true));
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 = true && true;
    deduped_4_1 = BigInt( 0 );
    deduped_3_1 = AsInteger( arg2_1 );
    deduped_2_1 = deduped_5_1 && true;
    deduped_1_1 = ListWithIdenticalEntries( deduped_3_1, deduped_4_1 );
    return deduped_5_1 && deduped_5_1 && (IdFunc( function (  )
                    if (@not ForAll( deduped_1_1, function ( a_3 )
                                 return (IsBigInt( a_3 ) && a_3 >= 0);
                             end ))
                        return false;
                    elseif (deduped_3_1 != deduped_3_1)
                        return false;
                    elseif (@not ForAll( deduped_1_1, function ( a_3 )
                                 return a_3 < 4;
                             end ))
                        return false;
                    else
                        return true;
                    end;
                    return;
                end )(  ) && IdFunc( function (  )
                    if (@not true)
                        return false;
                    elseif (deduped_4_1 != 0)
                        return false;
                    else
                        return true;
                    end;
                    return;
                end )(  ) && (deduped_2_1 && deduped_2_1));
end
########
        
    , 100 );
    
    ##
    AddLeftUnitorInverseWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    local hoisted_1_1, hoisted_2_1, deduped_4_1, deduped_5_1;
    deduped_5_1 = BigInt( 0 );
    deduped_4_1 = AsInteger( a_1 ) - 1;
    hoisted_2_1 = (0):(deduped_4_1);
    hoisted_1_1 = (deduped_5_1):(deduped_4_1);
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, VertexLabeledGraph, NTupleGAP( 2, List( (0):(AsInteger( r_1 ) - 1), function ( i_2 )
                return ZX_IntegerToLabel( i_2, hoisted_1_1, hoisted_2_1, deduped_5_1 );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddLeftUnitorWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    local hoisted_1_1, hoisted_2_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 = BigInt( 0 );
    deduped_6_1 = AsInteger( a_1 ) - 1;
    deduped_5_1 = (0):(deduped_6_1);
    hoisted_1_1 = (deduped_7_1):(deduped_6_1);
    hoisted_2_1 = List( (0):(AsInteger( s_1 ) - 1), function ( x_2 )
            return -1 + BigInt( SafePosition( hoisted_1_1, x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, a_1, VertexLabeledGraph, NTupleGAP( 2, List( deduped_5_1, function ( i_2 )
                return ZX_IntegerToLabel( i_2, hoisted_2_1, deduped_5_1, deduped_7_1 );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, VertexLabeledGraph, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return VertexLabeledGraph( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, AsInteger, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return AsInteger( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, hoisted_2_1, deduped_3_1, hoisted_4_1, deduped_5_1, deduped_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1;
    deduped_47_1 = BigInt( 0 );
    deduped_46_1 = VertexLabeledGraph( beta_1 );
    deduped_45_1 = VertexLabeledGraph( alpha_1 );
    deduped_44_1 = Range( beta_1 );
    deduped_43_1 = Source( alpha_1 );
    deduped_42_1 = deduped_46_1[2];
    deduped_41_1 = deduped_45_1[2];
    deduped_40_1 = AsInteger( Source( beta_1 ) );
    deduped_39_1 = AsInteger( Range( alpha_1 ) );
    deduped_38_1 = deduped_46_1[1];
    deduped_37_1 = deduped_45_1[1];
    deduped_36_1 = Length( deduped_42_1 );
    deduped_35_1 = Length( deduped_41_1 );
    deduped_34_1 = Length( deduped_38_1 );
    deduped_33_1 = Length( deduped_37_1 );
    deduped_32_1 = deduped_35_1 + deduped_36_1;
    deduped_31_1 = deduped_33_1 + deduped_34_1;
    deduped_30_1 = (0):(deduped_36_1 - 1);
    deduped_29_1 = (0):(deduped_35_1 - 1);
    deduped_28_1 = deduped_31_1 - 1;
    deduped_27_1 = NTupleGAP( 3, deduped_47_1, [  ], deduped_32_1 );
    deduped_26_1 = (0):(deduped_32_1 - 1);
    deduped_25_1 = SKELETAL_FIN_SETS_ExplicitCoequalizer_primitive_input( deduped_32_1, [ deduped_27_1, deduped_27_1 ] );
    deduped_5_1 = (deduped_33_1):(deduped_28_1);
    deduped_3_1 = [ "input", "input_output" ];
    hoisted_4_1 = List( PositionsProperty( deduped_38_1, function ( x_2 )
              return x_2 in deduped_3_1;
          end ), function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    deduped_1_1 = [ "output", "input_output" ];
    hoisted_2_1 = List( PositionsProperty( deduped_37_1, function ( x_2 )
              return x_2 in deduped_1_1;
          end ), function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    deduped_24_1 = SKELETAL_FIN_SETS_ExplicitCoequalizer_primitive_input( deduped_31_1, [ NTupleGAP( 3, deduped_39_1, List( (0):(deduped_39_1 - 1), function ( i_2 )
                    return hoisted_2_1[1 + i_2];
                end ), deduped_31_1 ), NTupleGAP( 3, deduped_40_1, List( (0):(deduped_40_1 - 1), function ( i_2 )
                    return deduped_5_1[1 + hoisted_4_1[(1 + i_2)]];
                end ), deduped_31_1 ) ] );
    deduped_23_1 = @Concatenation( List( deduped_29_1, function ( i_2 )
              return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_41_1[1 + i_2] )[2] );
          end ), List( deduped_30_1, function ( i_2 )
              return deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_42_1[(1 + i_2)] )[2] )];
          end ) );
    deduped_22_1 = @Concatenation( List( deduped_29_1, function ( i_2 )
              return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_41_1[1 + i_2] )[1] );
          end ), List( deduped_30_1, function ( i_2 )
              return deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_42_1[(1 + i_2)] )[1] )];
          end ) );
    hoisted_20_1 = ListN( deduped_22_1, deduped_23_1, function ( s_2, t_2 )
            return t_2;
        end );
    deduped_7_1 = List( (0):(deduped_28_1), function ( x_2 )
            return -1 + BigInt( SafeUniquePositionProperty( deduped_24_1, function ( c_3 )
                        return (x_2 in c_3);
                    end ) );
        end );
    hoisted_21_1 = List( deduped_26_1, function ( i_2 )
            return deduped_7_1[1 + hoisted_20_1[(1 + i_2)]];
        end );
    hoisted_18_1 = ListN( deduped_22_1, deduped_23_1, function ( s_2, t_2 )
            return s_2;
        end );
    hoisted_19_1 = List( deduped_26_1, function ( i_2 )
            return deduped_7_1[1 + hoisted_18_1[(1 + i_2)]];
        end );
    hoisted_11_1 = List( (0):(deduped_34_1 - 1), function ( i_2 )
            return deduped_7_1[1 + deduped_5_1[(1 + i_2)]];
        end );
    hoisted_10_1 = List( PositionsProperty( deduped_38_1, function ( x_2 )
              return x_2 in deduped_1_1;
          end ), function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    hoisted_15_1 = List( (0):(AsInteger( deduped_44_1 ) - 1), function ( i_2 )
            return hoisted_11_1[1 + hoisted_10_1[(1 + i_2)]];
        end );
    hoisted_9_1 = List( (0):(deduped_33_1 - 1), function ( i_2 )
            return deduped_7_1[1 + i_2];
        end );
    hoisted_8_1 = List( PositionsProperty( deduped_37_1, function ( x_2 )
              return x_2 in deduped_3_1;
          end ), function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    hoisted_14_1 = List( (0):(AsInteger( deduped_43_1 ) - 1), function ( i_2 )
            return hoisted_9_1[1 + hoisted_8_1[(1 + i_2)]];
        end );
    hoisted_13_1 = @Concatenation( List( deduped_37_1, ZX_LabelToInteger ), List( deduped_38_1, ZX_LabelToInteger ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_43_1, deduped_44_1, VertexLabeledGraph, NTupleGAP( 2, List( (0):(BigInt( Length( deduped_24_1 ) ) - 1), function ( i_2 )
                local deduped_1_2;
                deduped_1_2 = CAP_JIT_INCOMPLETE_LOGIC( i_2 );
                return ZX_IntegerToLabel( i_2, hoisted_14_1, hoisted_15_1, CAP_JIT_INCOMPLETE_LOGIC( IdFunc( function (  )
                              if (@not deduped_1_2 in deduped_7_1)
                                  return deduped_47_1;
                              else
                                  return hoisted_13_1[SafePosition( deduped_7_1, deduped_1_2 )];
                              end;
                              return;
                          end )(  ) ) );
            end ), ListN( List( deduped_25_1, function ( x_2 )
                  return hoisted_19_1[1 + x_2[1]];
              end ), List( deduped_25_1, function ( x_2 )
                  return hoisted_21_1[1 + x_2[1]];
              end ), function ( s_2, t_2 )
                return NTupleGAP( 2, s_2, t_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddRightUnitorInverseWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 = (0):(AsInteger( r_1 ) - 1);
    hoisted_3_1 = BigInt( 0 );
    hoisted_1_1 = (0):(AsInteger( a_1 ) - 1);
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, VertexLabeledGraph, NTupleGAP( 2, List( deduped_4_1, function ( i_2 )
                return ZX_IntegerToLabel( i_2, hoisted_1_1, deduped_4_1, hoisted_3_1 );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddRightUnitorWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    local hoisted_2_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 = (0):(AsInteger( s_1 ) - 1);
    deduped_5_1 = (0):(AsInteger( a_1 ) - 1);
    hoisted_4_1 = BigInt( 0 );
    hoisted_2_1 = List( deduped_6_1, function ( x_2 )
            return -1 + BigInt( SafePosition( deduped_5_1, x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, a_1, VertexLabeledGraph, NTupleGAP( 2, List( deduped_5_1, function ( i_2 )
                return ZX_IntegerToLabel( i_2, hoisted_2_1, deduped_6_1, hoisted_4_1 );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnMorphismsWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1;
    deduped_22_1 = VertexLabeledGraph( beta_1 );
    deduped_21_1 = VertexLabeledGraph( alpha_1 );
    deduped_20_1 = deduped_22_1[2];
    deduped_19_1 = deduped_21_1[2];
    deduped_18_1 = deduped_22_1[1];
    deduped_17_1 = deduped_21_1[1];
    deduped_16_1 = Length( deduped_17_1 );
    deduped_15_1 = (0):(Length( deduped_20_1 ) - 1);
    deduped_14_1 = (0):(Length( deduped_19_1 ) - 1);
    deduped_13_1 = deduped_16_1 + Length( deduped_18_1 ) - 1;
    deduped_5_1 = [ "output", "input_output" ];
    hoisted_7_1 = List( PositionsProperty( deduped_18_1, function ( x_2 )
              return x_2 in deduped_5_1;
          end ), function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    hoisted_6_1 = List( PositionsProperty( deduped_17_1, function ( x_2 )
              return x_2 in deduped_5_1;
          end ), function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    deduped_4_1 = (deduped_16_1):(deduped_13_1);
    hoisted_10_1 = @Concatenation( List( (0):(AsInteger( Range( alpha_1 ) ) - 1), function ( i_2 )
              return hoisted_6_1[1 + i_2];
          end ), List( (0):(AsInteger( Range( beta_1 ) ) - 1), function ( i_2 )
              return deduped_4_1[1 + hoisted_7_1[(1 + i_2)]];
          end ) );
    deduped_1_1 = [ "input", "input_output" ];
    hoisted_3_1 = List( PositionsProperty( deduped_18_1, function ( x_2 )
              return x_2 in deduped_1_1;
          end ), function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    hoisted_2_1 = List( PositionsProperty( deduped_17_1, function ( x_2 )
              return x_2 in deduped_1_1;
          end ), function ( p_2 )
            return BigInt( p_2 ) - 1;
        end );
    hoisted_9_1 = @Concatenation( List( (0):(AsInteger( Source( alpha_1 ) ) - 1), function ( i_2 )
              return hoisted_2_1[1 + i_2];
          end ), List( (0):(AsInteger( Source( beta_1 ) ) - 1), function ( i_2 )
              return deduped_4_1[1 + hoisted_3_1[(1 + i_2)]];
          end ) );
    hoisted_8_1 = @Concatenation( List( deduped_17_1, ZX_LabelToInteger ), List( deduped_18_1, ZX_LabelToInteger ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, NTupleGAP( 2, List( (0):(deduped_13_1), function ( i_2 )
                return ZX_IntegerToLabel( i_2, hoisted_9_1, hoisted_10_1, hoisted_8_1[1 + i_2] );
            end ), ListN( @Concatenation( List( deduped_14_1, function ( i_2 )
                    return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_19_1[1 + i_2] )[1] );
                end ), List( deduped_15_1, function ( i_2 )
                    return deduped_4_1[1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_20_1[(1 + i_2)] )[1] )];
                end ) ), @Concatenation( List( deduped_14_1, function ( i_2 )
                    return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_19_1[1 + i_2] )[2] );
                end ), List( deduped_15_1, function ( i_2 )
                    return deduped_4_1[1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_20_1[(1 + i_2)] )[2] )];
                end ) ), function ( s_2, t_2 )
                return NTupleGAP( 2, s_2, t_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, AsInteger, AsInteger( arg2_1 ) + AsInteger( arg3_1 ) );
end
########
        
    , 100 );
    
    ##
    AddTensorUnit( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, AsInteger, BigInt( 0 ) );
end
########
        
    , 100 );
    
    if (@IsBound( cat.precompiled_functions_added ))
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    end;
    
    cat.precompiled_functions_added = true;
    
end );

@BindGlobal( "CategoryOfZXDiagrams_precompiled", function (  )
  local category_constructor, cat;
    
    category_constructor =
        
        
        function (  )
    return CategoryOfZXDiagrams(  );
end;
        
        
    
    cat = category_constructor( ; FinalizeCategory = false, no_precompiled_code = true );
    
    ADD_FUNCTIONS_FOR_CategoryOfZXDiagrams_precompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
