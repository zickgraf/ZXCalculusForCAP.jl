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
    local deduped_1_1;
    deduped_1_1 = AsInteger( r_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_1_1, "neutral" ), (0):(AsInteger( a_1 ) + AsInteger( b_1 ) + (AsInteger( c_1 ) - 1)), (0):(deduped_1_1 - 1), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddAssociatorRightToLeftWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, c_1, r_1 )
    local deduped_1_1;
    deduped_1_1 = AsInteger( r_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_1_1, "neutral" ), (0):(AsInteger( a_1 ) + AsInteger( b_1 ) + AsInteger( c_1 ) - 1), (0):(deduped_1_1 - 1), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddBraidingInverseWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 = AsInteger( a_1 );
    deduped_1_1 = AsInteger( r_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_1_1, "neutral" ), @Concatenation( (deduped_2_1):(deduped_2_1 + AsInteger( b_1 ) - 1), (0):(deduped_2_1 - 1) ), (0):(deduped_1_1 - 1), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddBraidingWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 = AsInteger( b_1 );
    deduped_1_1 = AsInteger( r_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_1_1, "neutral" ), @Concatenation( (deduped_2_1):(deduped_2_1 + AsInteger( a_1 ) - 1), (0):(deduped_2_1 - 1) ), (0):(deduped_1_1 - 1), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoevaluationForDualWithGivenTensorProduct( cat,
        
########
function ( cat_1, s_1, a_1, r_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 = AsInteger( a_1 );
    deduped_1_1 = (0):(deduped_2_1 - 1);
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_2_1, "neutral" ), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsInt ) );
            end ), @Concatenation( deduped_1_1, deduped_1_1 ), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
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
    local deduped_1_1, deduped_2_1;
    deduped_2_1 = AsInteger( a_1 );
    deduped_1_1 = (0):(deduped_2_1 - 1);
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_2_1, "neutral" ), @Concatenation( deduped_1_1, deduped_1_1 ), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsInt ) );
            end ), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 = AsInteger( a_1 );
    deduped_1_1 = (0):(deduped_2_1 - 1);
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_2_1, "neutral" ), deduped_1_1, deduped_1_1, CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 = VertexLabeledGraph( arg3_1 );
    deduped_9_1 = VertexLabeledGraph( arg2_1 );
    deduped_8_1 = deduped_10_1[4];
    deduped_7_1 = deduped_9_1[4];
    deduped_6_1 = deduped_10_1[1];
    deduped_5_1 = deduped_9_1[1];
    deduped_4_1 = List( deduped_6_1, ZX_LabelToInteger );
    deduped_3_1 = List( deduped_5_1, ZX_LabelToInteger );
    return Length( deduped_5_1 ) == Length( deduped_6_1 ) && Length( deduped_7_1 ) == Length( deduped_8_1 ) && (List( deduped_7_1, function ( a_2 )
                        return a_2[1];
                    end ) == List( deduped_8_1, function ( a_2 )
                        return a_2[1];
                    end ) && List( deduped_7_1, function ( a_2 )
                        return a_2[2];
                    end ) == List( deduped_8_1, function ( a_2 )
                        return a_2[2];
                    end )) && (deduped_3_1 == deduped_4_1 && List( deduped_7_1, function ( edge_2 )
                      return deduped_3_1[1 + edge_2[2]] - 1;
                  end ) == List( deduped_8_1, function ( edge_2 )
                      return deduped_4_1[1 + edge_2[2]] - 1;
                  end )) && (deduped_10_1[2] == deduped_9_1[2] && true) && (deduped_10_1[3] == deduped_9_1[3] && true);
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
    return deduped_1_1 == deduped_2_1 && true && true && (ListWithIdenticalEntries( deduped_1_1, deduped_3_1 ) == ListWithIdenticalEntries( deduped_2_1, deduped_3_1 ) && true);
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_3_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 = BigInt( 0 );
    deduped_11_1 = VertexLabeledGraph( alpha_1 );
    deduped_10_1 = deduped_11_1[1];
    deduped_9_1 = AsInteger( Range( alpha_1 ) );
    deduped_8_1 = deduped_11_1[3];
    deduped_7_1 = AsInteger( Source( alpha_1 ) );
    deduped_6_1 = deduped_11_1[2];
    if (@not true)
        deduped_5_1 = false;
    elseif (deduped_12_1 != 0)
        deduped_5_1 = false;
    else
        deduped_5_1 = true;
    end;
    deduped_3_1 = List( deduped_10_1, ZX_LabelToInteger );
    deduped_1_1 = Length( deduped_10_1 );
    return CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                      if (@not ForAll( deduped_6_1, function ( a_3 )
                                   return (IsBigInt( a_3 ) && a_3 >= 0);
                               end ))
                          return false;
                      elseif (deduped_7_1 != Length( deduped_6_1 ))
                          return false;
                      elseif (@not ForAll( deduped_6_1, function ( a_3 )
                                   return a_3 < deduped_1_1;
                               end ))
                          return false;
                      else
                          return true;
                      end;
                      return;
                  end )(  ) && deduped_5_1 && true && (ListWithIdenticalEntries( deduped_7_1, deduped_12_1 ) == List( (0):(deduped_7_1 - 1), function ( i_2 )
                    return deduped_3_1[1 + deduped_6_1[(1 + i_2)]];
                end ) && true) && (CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                      if (@not ForAll( deduped_8_1, function ( a_3 )
                                   return (IsBigInt( a_3 ) && a_3 >= 0);
                               end ))
                          return false;
                      elseif (deduped_9_1 != Length( deduped_8_1 ))
                          return false;
                      elseif (@not ForAll( deduped_8_1, function ( a_3 )
                                   return a_3 < deduped_1_1;
                               end ))
                          return false;
                      else
                          return true;
                      end;
                      return;
                  end )(  ) && deduped_5_1 && true && (ListWithIdenticalEntries( deduped_9_1, deduped_12_1 ) == List( (0):(deduped_9_1 - 1), function ( i_2 )
                    return deduped_3_1[1 + deduped_8_1[(1 + i_2)]];
                end ) && true));
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 = BigInt( 0 );
    deduped_2_1 = AsInteger( arg2_1 );
    deduped_1_1 = ListWithIdenticalEntries( deduped_2_1, deduped_3_1 );
    return CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                  if (@not ForAll( deduped_1_1, function ( a_3 )
                               return (IsBigInt( a_3 ) && a_3 >= 0);
                           end ))
                      return false;
                  elseif (deduped_2_1 != deduped_2_1)
                      return false;
                  elseif (@not ForAll( deduped_1_1, function ( a_3 )
                               return a_3 < 4;
                           end ))
                      return false;
                  else
                      return true;
                  end;
                  return;
              end )(  ) && CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                  if (@not true)
                      return false;
                  elseif (deduped_3_1 != 0)
                      return false;
                  else
                      return true;
                  end;
                  return;
              end )(  ) && true;
end
########
        
    , 100 );
    
    ##
    AddLeftUnitorInverseWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    local deduped_1_1;
    deduped_1_1 = AsInteger( a_1 ) - 1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( AsInteger( r_1 ), "neutral" ), (BigInt( 0 )):(deduped_1_1), (0):(deduped_1_1), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddLeftUnitorWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    local hoisted_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 = AsInteger( a_1 );
    deduped_2_1 = deduped_3_1 - 1;
    hoisted_1_1 = (BigInt( 0 )):(deduped_2_1);
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, a_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_3_1, "neutral" ), List( (0):(AsInteger( s_1 ) - 1), function ( x_2 )
                return -1 + BigInt( SafePosition( hoisted_1_1, x_2 ) );
            end ), (0):(deduped_2_1), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
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
    local hoisted_1_1, hoisted_2_1, deduped_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1;
    deduped_40_1 = VertexLabeledGraph( beta_1 );
    deduped_39_1 = VertexLabeledGraph( alpha_1 );
    deduped_38_1 = Range( beta_1 );
    deduped_37_1 = Source( alpha_1 );
    deduped_36_1 = deduped_40_1[4];
    deduped_35_1 = deduped_39_1[4];
    deduped_34_1 = AsInteger( Source( beta_1 ) );
    deduped_33_1 = AsInteger( Range( alpha_1 ) );
    deduped_32_1 = deduped_40_1[1];
    deduped_31_1 = deduped_39_1[1];
    deduped_30_1 = Length( deduped_36_1 );
    deduped_29_1 = Length( deduped_35_1 );
    deduped_28_1 = Length( deduped_32_1 );
    deduped_27_1 = Length( deduped_31_1 );
    deduped_26_1 = deduped_29_1 + deduped_30_1;
    deduped_25_1 = deduped_27_1 + deduped_28_1;
    deduped_24_1 = (0):(deduped_30_1 - 1);
    deduped_23_1 = (0):(deduped_29_1 - 1);
    deduped_22_1 = @NTupleGAP( 3, BigInt( 0 ), CapJitTypedExpression( [  ], function (  )
              return @rec(
                  filter = IsList,
                  element_type = @rec(
                      filter = IsInt ) );
          end ), deduped_26_1 );
    deduped_21_1 = (0):(deduped_26_1 - 1);
    deduped_20_1 = SKELETAL_FIN_SETS_ExplicitCoequalizer_primitive_input( deduped_26_1, [ deduped_22_1, deduped_22_1 ] );
    hoisted_2_1 = deduped_40_1[2];
    hoisted_1_1 = deduped_39_1[3];
    deduped_19_1 = SKELETAL_FIN_SETS_ExplicitCoequalizer_primitive_input( deduped_25_1, [ @NTupleGAP( 3, deduped_33_1, List( (0):(deduped_33_1 - 1), function ( i_2 )
                    return hoisted_1_1[1 + i_2];
                end ), deduped_25_1 ), @NTupleGAP( 3, deduped_34_1, List( (0):(deduped_34_1 - 1), function ( i_2 )
                    return deduped_27_1 + hoisted_2_1[(1 + i_2)];
                end ), deduped_25_1 ) ] );
    deduped_18_1 = @Concatenation( List( deduped_23_1, function ( i_2 )
              return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_35_1[1 + i_2] )[2] );
          end ), List( deduped_24_1, function ( i_2 )
              return deduped_27_1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_36_1[(1 + i_2)] )[2] );
          end ) );
    deduped_17_1 = @Concatenation( List( deduped_23_1, function ( i_2 )
              return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_35_1[1 + i_2] )[1] );
          end ), List( deduped_24_1, function ( i_2 )
              return deduped_27_1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_36_1[(1 + i_2)] )[1] );
          end ) );
    hoisted_15_1 = ListN( deduped_17_1, deduped_18_1, function ( s_2, t_2 )
            return t_2;
        end );
    deduped_5_1 = List( (0):(deduped_25_1 - 1), function ( x_2 )
            return -1 + BigInt( SafeUniquePositionProperty( deduped_19_1, function ( c_3 )
                        return (x_2 in c_3);
                    end ) );
        end );
    hoisted_16_1 = List( deduped_21_1, function ( i_2 )
            return deduped_5_1[1 + hoisted_15_1[(1 + i_2)]];
        end );
    hoisted_13_1 = ListN( deduped_17_1, deduped_18_1, function ( s_2, t_2 )
            return s_2;
        end );
    hoisted_14_1 = List( deduped_21_1, function ( i_2 )
            return deduped_5_1[1 + hoisted_13_1[(1 + i_2)]];
        end );
    hoisted_10_1 = List( (0):(deduped_28_1 - 1), function ( i_2 )
            return deduped_5_1[1 + (deduped_27_1 + i_2)];
        end );
    hoisted_9_1 = deduped_40_1[3];
    hoisted_8_1 = List( (0):(deduped_27_1 - 1), function ( i_2 )
            return deduped_5_1[1 + i_2];
        end );
    hoisted_7_1 = deduped_39_1[2];
    hoisted_6_1 = @Concatenation( deduped_31_1, deduped_32_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_37_1, deduped_38_1, VertexLabeledGraph, @NTupleGAP( 4, List( (0):(BigInt( Length( deduped_19_1 ) ) - 1), function ( y_2 )
                if (@not y_2 in deduped_5_1)
                    return "neutral";
                else
                    return hoisted_6_1[SafePosition( deduped_5_1, y_2 )];
                end;
                return;
            end ), List( (0):(AsInteger( deduped_37_1 ) - 1), function ( i_2 )
                return hoisted_8_1[1 + hoisted_7_1[(1 + i_2)]];
            end ), List( (0):(AsInteger( deduped_38_1 ) - 1), function ( i_2 )
                return hoisted_10_1[1 + hoisted_9_1[(1 + i_2)]];
            end ), ListN( List( deduped_20_1, function ( x_2 )
                  return hoisted_14_1[1 + x_2[1]];
              end ), List( deduped_20_1, function ( x_2 )
                  return hoisted_16_1[1 + x_2[1]];
              end ), function ( s_2, t_2 )
                return @NTupleGAP( 2, s_2, t_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddRightUnitorInverseWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    local deduped_1_1;
    deduped_1_1 = AsInteger( r_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_1_1, "neutral" ), (0):(AsInteger( a_1 ) - 1), (0):(deduped_1_1 - 1), CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddRightUnitorWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    local hoisted_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 = AsInteger( a_1 );
    deduped_2_1 = (0):(AsInteger( s_1 ) - 1);
    hoisted_1_1 = (0):(deduped_3_1 - 1);
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, a_1, VertexLabeledGraph, @NTupleGAP( 4, ListWithIdenticalEntries( deduped_3_1, "neutral" ), List( deduped_2_1, function ( x_2 )
                return -1 + BigInt( SafePosition( hoisted_1_1, x_2 ) );
            end ), deduped_2_1, CapJitTypedExpression( [  ], function (  )
                return @rec(
                    filter = IsList,
                    element_type = @rec(
                        filter = IsNTuple,
                        element_types = [ @rec(
                                filter = IsInt ), @rec(
                                filter = IsInt ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnMorphismsWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, hoisted_4_1, hoisted_5_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1;
    deduped_14_1 = VertexLabeledGraph( beta_1 );
    deduped_13_1 = VertexLabeledGraph( alpha_1 );
    deduped_12_1 = deduped_14_1[4];
    deduped_11_1 = deduped_13_1[4];
    deduped_10_1 = deduped_13_1[1];
    deduped_9_1 = (0):(Length( deduped_12_1 ) - 1);
    deduped_8_1 = (0):(Length( deduped_11_1 ) - 1);
    hoisted_5_1 = deduped_14_1[3];
    hoisted_4_1 = deduped_13_1[3];
    deduped_3_1 = Length( deduped_10_1 );
    hoisted_2_1 = deduped_14_1[2];
    hoisted_1_1 = deduped_13_1[2];
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, VertexLabeledGraph, @NTupleGAP( 4, @Concatenation( deduped_10_1, deduped_14_1[1] ), @Concatenation( List( (0):(AsInteger( Source( alpha_1 ) ) - 1), function ( i_2 )
                  return hoisted_1_1[1 + i_2];
              end ), List( (0):(AsInteger( Source( beta_1 ) ) - 1), function ( i_2 )
                  return deduped_3_1 + hoisted_2_1[(1 + i_2)];
              end ) ), @Concatenation( List( (0):(AsInteger( Range( alpha_1 ) ) - 1), function ( i_2 )
                  return hoisted_4_1[1 + i_2];
              end ), List( (0):(AsInteger( Range( beta_1 ) ) - 1), function ( i_2 )
                  return deduped_3_1 + hoisted_5_1[(1 + i_2)];
              end ) ), ListN( @Concatenation( List( deduped_8_1, function ( i_2 )
                    return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_11_1[1 + i_2] )[1] );
                end ), List( deduped_9_1, function ( i_2 )
                    return deduped_3_1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_12_1[(1 + i_2)] )[1] );
                end ) ), @Concatenation( List( deduped_8_1, function ( i_2 )
                    return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_11_1[1 + i_2] )[2] );
                end ), List( deduped_9_1, function ( i_2 )
                    return deduped_3_1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_12_1[(1 + i_2)] )[2] );
                end ) ), function ( s_2, t_2 )
                return @NTupleGAP( 2, s_2, t_2 );
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
