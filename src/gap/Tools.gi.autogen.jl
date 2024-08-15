# SPDX-License-Identifier: GPL-2.0-or-later
# ZXCalculusForCAP: The category of ZX-diagrams
#
# Implementations
#

if (IsPackageMarkedForLoading( "json", "2.1.1" ))

  @InstallGlobalFunction( ExportAsQGraphString,
    
    function ( phi )
      local tuple, labels, input_positions, output_positions, edges, input_positions_indices, output_positions_indices, wire_vertices, node_vertices, vertex_names, padding_length, get_vertex_name, vertex_name, is_input, is_output, input_position, output_position, undir_edges, edge, edge_name, src_vertex_name, tgt_vertex_name, qgraph, pos, edge_counter;
        
        tuple = ZX_RemovedInnerNeutralNodes( MorphismDatum( phi ) );
        
        labels = ShallowCopy( tuple[1] );
        input_positions = ShallowCopy( tuple[2] );
        output_positions = ShallowCopy( tuple[3] );
        edges = ShallowCopy( tuple[4] );
        
        # input_positions and output_positions might be ranges, which are immutable in Julia
        # -> convert to regular lists
        input_positions = List( (1):(Length( input_positions )), i -> input_positions[i] );
        output_positions = List( (1):(Length( output_positions )), i -> output_positions[i] );
        
        # nodes which are simultaneously inputs and outputs or multiple inputs or outputs are not supported by PyZX
        # split such nodes into multiple input or outputs nodes connected by an edge
        for pos in (1):(Length( labels ))
            
            # find input and output indices corresponding to this node
            input_positions_indices = Positions( input_positions, pos - 1 );
            output_positions_indices = Positions( output_positions, pos - 1 );
            
            if (Length( input_positions_indices ) == 0 && Length( output_positions_indices ) == 0)
                
                # not an input or output node
                
                # inner neutral nodes have been removed above
                @Assert( 0, labels[pos] != "neutral" );
                
                continue;
                
            end;
            
            @Assert( 0, labels[pos] == "neutral" );
            
            if (Length( input_positions_indices ) == 1 && Length( output_positions_indices ) == 0)
                
                # normal input node
                continue;
                
            elseif (Length( input_positions_indices ) == 0 && Length( output_positions_indices ) == 1)
                
                # normal output node
                continue;
                
            elseif (Length( input_positions_indices ) == 1 && Length( output_positions_indices ) == 1)
                
                # simultaneously an input and an output:
                # add a new neutral node for the output and an edge between input and output
                Add( labels, "neutral" );
                output_positions[output_positions_indices[1]] = Length( labels ) - 1;
                Add( edges, [ pos - 1, Length( labels ) - 1 ] );
                
            elseif (Length( input_positions_indices ) == 2 && Length( output_positions_indices ) == 0)
                
                # simultaneously two inputs:
                # add a new neutral node for a separate input and a dummy Z node to connect the two inputs
                Add( labels, "neutral" );
                input_positions[input_positions_indices[2]] = Length( labels ) - 1;
                Add( labels, "Z" );
                Add( edges, [ input_positions[input_positions_indices[1]], Length( labels ) - 1 ] );
                Add( edges, [ input_positions[input_positions_indices[2]], Length( labels ) - 1 ] );
                
            elseif (Length( input_positions_indices ) == 0 && Length( output_positions_indices ) == 2)
                
                # simultaneously two outputs:
                # add a new neutral node for a separate output and a dummy Z node to connect the two outputs
                Add( labels, "neutral" );
                output_positions[output_positions_indices[2]] = Length( labels ) - 1;
                Add( labels, "Z" );
                Add( edges, [ output_positions[output_positions_indices[1]], Length( labels ) - 1 ] );
                Add( edges, [ output_positions[output_positions_indices[2]], Length( labels ) - 1 ] );
                
            else
                
                # COVERAGE_IGNORE_NEXT_LINE
                Error( "this case should not appear in a well-defined ZX-diagram" );
                
            end;
            
        end;
        
        edges = SetGAP( edges );
        
        wire_vertices = @rec( );
        node_vertices = @rec( );
        
        vertex_names = [ ];
        
        # we want to pad all numbers with zeros on the left so the order does not change when ordering them as strings
        # this helps to work around https://github.com/Quantomatic/pyzx/issues/168
        padding_length = IntGAP( Log10( Float( Length( labels ) ) ) ) + 1;
        
        get_vertex_name = function ( prefix, record )
          local id, id_string, vertex_name;
            
            id = Length( RecNames( record ) );
            
            id_string = StringGAP( id, padding_length );
            
            vertex_name = @Concatenation( prefix, ReplacedString( id_string, " ", "0" ) );
            
            @Assert( 0, @not @IsBound( record[vertex_name] ) );
            
            return vertex_name;
            
        end;
        
        # See https://github.com/Quantomatic/quantomatic/blob/stable/docs/json_formats.txt
        # for a rough overview of the qgraph format.
        
        for pos in (1):(Length( labels ))
            
            if (labels[pos][1] == 'Z')
                
                vertex_name = get_vertex_name( "v", node_vertices );
                
                node_vertices[vertex_name] = @rec(
                    annotation = @rec(
                        coord = [ 1, - pos ],
                    ),
                    data = @rec(
                        type = "Z",
                    )
                );
                
                if (Length( labels[pos] ) > 1)
                    
                    node_vertices[vertex_name].data.value = labels[pos][(2):(Length( labels[pos] ))];
                    
                end;
                
            elseif (labels[pos][1] == 'X')
                
                vertex_name = get_vertex_name( "v", node_vertices );
                
                node_vertices[vertex_name] = @rec(
                    annotation = @rec(
                        coord = [ 1, - pos ],
                    ),
                    data = @rec(
                        type = "X",
                    )
                );
                
                if (Length( labels[pos] ) > 1)
                    
                    node_vertices[vertex_name].data.value = labels[pos][(2):(Length( labels[pos] ))];
                    
                end;
                
            elseif (labels[pos] == "H")
                
                vertex_name = get_vertex_name( "v", node_vertices );
                
                node_vertices[vertex_name] = @rec(
                    annotation = @rec(
                        coord = [ 1, - pos ],
                    ),
                    data = @rec(
                        type = "hadamard",
                        # always use Hadamard edges to work around https://github.com/Quantomatic/pyzx/issues/161
                        is_edge = "true",
                        value = "\\pi",
                    ),
                );
                
            elseif (labels[pos] == "neutral")
                
                vertex_name = get_vertex_name( "b", wire_vertices );
                
                is_input = (pos - 1) in input_positions;
                is_output = (pos - 1) in output_positions;
                
                if (is_input && is_output)
                    
                    # COVERAGE_IGNORE_NEXT_LINE
                    Error( "found neutral node which is simultaneously an input and an output, this is not supported by PyZX" );
                    
                elseif (is_input)
                    
                    input_position = SafeUniquePosition( input_positions, pos - 1 ) - 1;
                    
                    wire_vertices[vertex_name] = @rec(
                        annotation = @rec(
                            boundary = true,
                            coord = [ 0, - input_position ],
                            input = input_position,
                        ),
                    );
                    
                elseif (is_output)
                    
                    output_position = SafeUniquePosition( output_positions, pos - 1 ) - 1;
                    
                    wire_vertices[vertex_name] = @rec(
                        annotation = @rec(
                            boundary = true,
                            coord = [ 2, - output_position ],
                            output = output_position,
                        ),
                    );
                    
                else
                    
                    # COVERAGE_IGNORE_NEXT_LINE
                    Error( "found inner neutral node, this is not supported by PyZX" );
                    
                end;
                
            else
                
                # COVERAGE_IGNORE_NEXT_LINE
                Error( "unknown label ", labels[pos] );
                
            end;
            
            @Assert( 0, Length( vertex_names ) == pos - 1 );
            Add( vertex_names, vertex_name );
            
        end;
        
        @Assert( 0, Length( vertex_names ) == Length( labels ) );
        
        undir_edges = @rec( );
        
        for edge_counter in (1):(Length( edges ))
            
            edge = edges[edge_counter];
            
            edge_name = @Concatenation( "e", StringGAP( edge_counter - 1 ) );
            
            src_vertex_name = vertex_names[edge[1] + 1];
            tgt_vertex_name = vertex_names[edge[2] + 1];
            
            undir_edges[edge_name] = @rec( src = src_vertex_name, tgt = tgt_vertex_name );
            
        end;
        
        qgraph = @rec( wire_vertices = wire_vertices,
                       node_vertices = node_vertices,
                       undir_edges = undir_edges );
        
        return GapToJsonString( qgraph );
        
    end );
    
  @InstallGlobalFunction( ExportAsQGraphFile,
    
    function ( phi, filename )
      local tuple, labels, input_positions, output_positions, edges, input_positions_indices, output_positions_indices, wire_vertices, node_vertices, vertex_names, padding_length, get_vertex_name, vertex_name, is_input, is_output, input_position, output_position, undir_edges, edge, edge_name, src_vertex_name, tgt_vertex_name, qgraph, pos, edge_counter;
        
        qgraph = ExportAsQGraphString( phi );
        
        FileString( filename, qgraph );
        
        # suppress return value for julia
        return;
        
    end );
    
    @InstallGlobalFunction( ImportFromQGraphString,
      
      function ( cat, qgraph )
        local labels, edges, wire_vertices, node_vertices, undir_edges, vertex_names, input_positions, output_positions, edge, src_vertex, tgt_vertex, annotation, data, full_type, io_positions, src_index, tgt_index, via_index, source, range, mor, name;
        
        labels = [ ];
        edges = [ ];
        
        qgraph = JsonStringToGap( qgraph );
        
        wire_vertices = qgraph.wire_vertices;
        node_vertices = qgraph.node_vertices;
        undir_edges = qgraph.undir_edges;
        
        vertex_names = [ ];
        # will be turned into lists later because Julia does not support non-dense lists
        input_positions = @rec( );
        output_positions = @rec( );
        
        # identify inputs or outputs connected to other inputs or outputs
        for name in SortedList( RecNames( undir_edges ) )
            
            edge = undir_edges[name];
            
            if (edge.src == edge.tgt)
                
                Error( "loops are currently not supported" );
                
            end;
            
            if (@IsBound( wire_vertices[edge.src] ) && @IsBound( wire_vertices[edge.tgt] ))
                
                src_vertex = wire_vertices[edge.src];
                tgt_vertex = wire_vertices[edge.tgt];
                
                if (@IsBound( src_vertex.annotation.input ) && @IsBound( tgt_vertex.annotation.input ))
                    
                    @Assert( 0, @not @IsBound( src_vertex.annotation.output ) );
                    @Assert( 0, @not @IsBound( tgt_vertex.annotation.output ) );
                    
                    src_vertex.annotation.input2 = tgt_vertex.annotation.input;
                    
                elseif (@IsBound( src_vertex.annotation.input ) && @IsBound( tgt_vertex.annotation.output ))
                    
                    @Assert( 0, @not @IsBound( src_vertex.annotation.output ) );
                    @Assert( 0, @not @IsBound( tgt_vertex.annotation.input ) );
                    
                    src_vertex.annotation.output = tgt_vertex.annotation.output;
                    
                elseif (@IsBound( src_vertex.annotation.output ) && @IsBound( tgt_vertex.annotation.input ))
                    
                    @Assert( 0, @not @IsBound( src_vertex.annotation.input ) );
                    @Assert( 0, @not @IsBound( tgt_vertex.annotation.output ) );
                    
                    src_vertex.annotation.input = tgt_vertex.annotation.input;
                    
                elseif (@IsBound( src_vertex.annotation.output ) && @IsBound( tgt_vertex.annotation.output ))
                    
                    @Assert( 0, @not @IsBound( src_vertex.annotation.input ) );
                    @Assert( 0, @not @IsBound( tgt_vertex.annotation.input ) );
                    
                    src_vertex.annotation.output2 = tgt_vertex.annotation.output;
                    
                else
                    
                    Error( "this should never happen" );
                    
                end;
                
                @Unbind( wire_vertices[edge.tgt] );
                
                @Unbind( undir_edges[name] );
                
            end;
            
        end;
        
        for name in SortedList( RecNames( wire_vertices ) )
            
            Add( vertex_names, name );
            
            annotation = wire_vertices[name].annotation;
            
            Add( labels, "neutral" );
            
            @Assert( 0, NumberGAP( [ "input", "input2", "output", "output2" ], name -> @IsBound( annotation[name] ) ) > 0 );
            @Assert( 0, NumberGAP( [ "input", "input2", "output", "output2" ], name -> @IsBound( annotation[name] ) ) <= 2 );
            
            if (@IsBound( annotation.input ))
                
                input_positions[annotation.input + 1] = Length( labels ) - 1;
                
            end;
            
            if (@IsBound( annotation.input2 ))
                
                @Assert( 0, @IsBound( annotation.input ) );
                
                input_positions[annotation.input2 + 1] = Length( labels ) - 1;
                
            end;
            
            if (@IsBound( annotation.output ))
                
                output_positions[annotation.output + 1] = Length( labels ) - 1;
                
            end;
            
            if (@IsBound( annotation.output2 ))
                
                @Assert( 0, @IsBound( annotation.output ) );
                
                output_positions[annotation.output2 + 1] = Length( labels ) - 1;
                
            end;
            
        end;
        
        @Assert( 0, SortedList( RecNames( input_positions ) ) == List( (1):(Length( RecNames( input_positions ) )), i -> StringGAP( i ) ) );
        @Assert( 0, SortedList( RecNames( output_positions ) ) == List( (1):(Length( RecNames( output_positions ) )), i -> StringGAP( i ) ) );
        
        input_positions = List( (1):(Length( RecNames( input_positions ) )), i -> BigInt( input_positions[i] ) );
        output_positions = List( (1):(Length( RecNames( output_positions ) )), i -> BigInt( output_positions[i] ) );
        
        for name in SortedList( RecNames( node_vertices ) )
            
            Add( vertex_names, name );
            
            data = node_vertices[name].data;
            
            if (data.type == "Z")
                
                if (@IsBound( data.value ))
                    
                    full_type = @Concatenation( "Z", data.value );
                    
                else
                    
                    full_type = "Z";
                    
                end;
                
                Add( labels, full_type );
                
            elseif (data.type == "X")
                
                if (@IsBound( data.value ))
                    
                    full_type = @Concatenation( "X", data.value );
                    
                else
                    
                    full_type = "X";
                    
                end;
                
                Add( labels, full_type );
                
            elseif (data.type == "hadamard")
                
                Add( labels, "H" );
                
            else
                
                Error( "node vertex has unkown type ", data.type );
                
            end;
            
        end;
        
        @Assert( 0, Length( labels ) == Length( vertex_names ) );
        
        io_positions = @Concatenation( input_positions, output_positions );
        
        for name in SortedList( RecNames( undir_edges ) )
            
            edge = undir_edges[name];
            
            src_index = BigInt( SafeUniquePosition( vertex_names, edge.src ) ) - 1;
            tgt_index = BigInt( SafeUniquePosition( vertex_names, edge.tgt ) ) - 1;
            
            if (src_index in io_positions && tgt_index in io_positions)
                
                Error( "this case should have been handled above" );
                
            elseif (src_index in io_positions)
                
                Add( edges, [ src_index, tgt_index ] );
                
            elseif (tgt_index in io_positions)
                
                Add( edges, [ tgt_index, src_index ] );
                
            else
                
                Add( labels, "neutral" );
                
                via_index = BigInt( Length( labels ) ) - 1;
                
                Add( edges, [ via_index, src_index ] );
                Add( edges, [ via_index, tgt_index ] );
                
            end;
            
        end;
        
        source = ObjectConstructor( cat, Length( input_positions ) );
        range = ObjectConstructor( cat, Length( output_positions ) );
        
        mor = MorphismConstructor( cat, source, @NTupleGAP( 4, labels, input_positions, output_positions, edges ), range );
        
        @Assert( 0, IsWellDefinedForMorphisms( cat, mor ) );
        
        return mor;
        
    end );
    
    @InstallGlobalFunction( ImportFromQGraphFile,
      
      function ( cat, filename )
        local qgraph;
        
        qgraph = StringFile( filename );
        
        @Assert( 0, qgraph != fail );
        
        return ImportFromQGraphString( cat, qgraph );
        
    end );
    
end;
