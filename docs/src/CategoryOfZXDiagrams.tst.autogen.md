
```jldoctest
julia> using CAP; using MonoidalCategories; using ZXCalculusForCAP

julia> true
true

julia> zero = ObjectConstructor( ZX, BigInt( 0 ) )
<An object in Category of ZX-diagrams representing 0 input/output vertices>

julia> one = ObjectConstructor( ZX, BigInt( 1 ) )
<An object in Category of ZX-diagrams representing 1 input/output vertices>

julia> two = ObjectConstructor( ZX, BigInt( 2 ) )
<An object in Category of ZX-diagrams representing 2 input/output vertices>

julia> three = ObjectConstructor( ZX, BigInt( 3 ) )
<An object in Category of ZX-diagrams representing 3 input/output vertices>

julia> Display( three )
An object in Category of ZX-diagrams representing 3 input/output vertices.

julia> id = IdentityMorphism( three );

julia> ev = EvaluationForDual( three );

julia> coev = CoevaluationForDual( three );

julia> PreCompose( ev, IdentityMorphism( zero ) );

julia> PreCompose( IdentityMorphism( TensorProduct( three, three ) ), ev );

julia> PreCompose( coev, IdentityMorphism( TensorProduct( three, three ) ) );

julia> PreCompose( IdentityMorphism( zero ), coev );

julia> Display( PreCompose( coev, ev ) )
A morphism in Category of ZX-diagrams given by a ZX diagram with 0 vertex labels
  [  ],
  inputs
  [  ],
  outputs
  [  ],
  and 0 edges
  [  ].

julia> Display( PreCompose( ev, coev ) )
A morphism in Category of ZX-diagrams given by a ZX diagram with 6 vertex labels
  [ "neutral", "neutral", "neutral", "neutral", "neutral", "neutral" ],
  inputs
  [ 0, 1, 2, 0, 1, 2 ],
  outputs
  [ 3, 4, 5, 3, 4, 5 ],
  and 0 edges
  [  ].

julia> IsEqualForMorphisms( TensorProductOnMorphisms( IdentityMorphism( one ), IdentityMorphism( two ) ), IdentityMorphism( three ) )
true

julia> IsEqualForMorphisms( AssociatorLeftToRight( zero, one, two ), IdentityMorphism( three ) )
true

julia> IsEqualForMorphisms( AssociatorRightToLeft( zero, one, two ), IdentityMorphism( three ) )
true

julia> IsEqualForMorphisms( LeftUnitor( three ), IdentityMorphism( three ) )
true

julia> IsEqualForMorphisms( LeftUnitorInverse( three ), IdentityMorphism( three ) )
true

julia> IsEqualForMorphisms( RightUnitor( three ), IdentityMorphism( three ) )
true

julia> IsEqualForMorphisms( RightUnitorInverse( three ), IdentityMorphism( three ) )
true

julia> IsEqualForMorphisms( Braiding( one, two ), BraidingInverse( two, one ) )
true

julia> X_1_1 = MorphismConstructor( one, [ [ "neutral", "X", "neutral" ], [ BigInt( 0 ) ], [ BigInt( 2 ) ], [ [ BigInt( 0 ), BigInt( 1 ) ], [ BigInt( 2 ), BigInt( 1 ) ] ] ], one );

julia> IsWellDefinedForMorphisms( X_1_1 )
true

julia> Z_1_1 = MorphismConstructor( one, [ [ "neutral", "Z", "neutral" ], [ BigInt( 0 ) ], [ BigInt( 2 ) ], [ [ BigInt( 0 ), BigInt( 1 ) ], [ BigInt( 2 ), BigInt( 1 ) ] ] ], one );

julia> IsWellDefinedForMorphisms( Z_1_1 )
true

julia> H = MorphismConstructor( one, [ [ "neutral", "H", "neutral" ], [ BigInt( 0 ) ], [ BigInt( 2 ) ], [ [ BigInt( 0 ), BigInt( 1 ) ], [ BigInt( 2 ), BigInt( 1 ) ] ] ], one );

julia> IsWellDefinedForMorphisms( H )
true

julia> X_1_2 = MorphismConstructor( one, [ [ "neutral", "X", "neutral", "neutral" ], [ BigInt( 0 ) ], [ BigInt( 2 ), BigInt( 3 ) ], [ [ BigInt( 0 ), BigInt( 1 ) ], [ BigInt( 2 ), BigInt( 1 ) ], [ BigInt( 3 ), BigInt( 1 ) ] ] ], two );

julia> IsWellDefinedForMorphisms( X_1_2 )
true

julia> Z_2_1 = MorphismConstructor( two, [ [ "neutral", "neutral", "Z", "neutral" ], [ BigInt( 0 ), BigInt( 1 ) ], [ BigInt( 3 ) ], [ [ BigInt( 0 ), BigInt( 2 ) ], [ BigInt( 1 ), BigInt( 2 ) ], [ BigInt( 3 ), BigInt( 2 ) ] ] ], one );

julia> IsWellDefinedForMorphisms( Z_2_1 )
true

julia> X_1_2_Z_2_1 = PreCompose( X_1_2, Z_2_1 );

julia> IsWellDefinedForMorphisms( X_1_2_Z_2_1 )
true

julia> tmp_dir = DirectoryTemporary( );

julia> ExportAsQGraphFile( id, Filename( tmp_dir, "id" ) )

julia> ExportAsQGraphFile( ev, Filename( tmp_dir, "ev" ) )

julia> ExportAsQGraphFile( coev, Filename( tmp_dir, "coev" ) )

julia> ExportAsQGraphFile( X_1_1, Filename( tmp_dir, "X_1_1" ) )

julia> ExportAsQGraphFile( Z_1_1, Filename( tmp_dir, "Z_1_1" ) )

julia> ExportAsQGraphFile( H, Filename( tmp_dir, "H" ) )

julia> ExportAsQGraphFile( X_1_2, Filename( tmp_dir, "X_1_2" ) )

julia> ExportAsQGraphFile( Z_2_1, Filename( tmp_dir, "Z_2_1" ) )

julia> ExportAsQGraphFile( X_1_2_Z_2_1, Filename( tmp_dir, "X_1_2_Z_2_1" ) )

julia> ImportFromQGraphFile( ZX, Filename( tmp_dir, "id" ) );

julia> ImportFromQGraphFile( ZX, Filename( tmp_dir, "ev" ) );

julia> ImportFromQGraphFile( ZX, Filename( tmp_dir, "coev" ) );

julia> ImportFromQGraphFile( ZX, Filename( tmp_dir, "X_1_1" ) );

julia> ImportFromQGraphFile( ZX, Filename( tmp_dir, "Z_1_1" ) );

julia> ImportFromQGraphFile( ZX, Filename( tmp_dir, "H" ) );

julia> ImportFromQGraphFile( ZX, Filename( tmp_dir, "X_1_2" ) );

julia> ImportFromQGraphFile( ZX, Filename( tmp_dir, "Z_2_1" ) );

julia> ImportFromQGraphFile( ZX, Filename( tmp_dir, "X_1_2_Z_2_1" ) );

julia> test_inverse = function( mor0 )
             local json, mor1, json2, mor2, json3, mor3
               json = ExportAsQGraphString( mor0 )
               mor1 = ImportFromQGraphString( ZX, json )
               json2 = ExportAsQGraphString( mor1 )
               mor2 = ImportFromQGraphString( ZX, json2 )
               json3 = ExportAsQGraphString( mor2 )
               mor3 = ImportFromQGraphString( ZX, json3 )
               return IsEqualForMorphisms( mor2, mor3 ) && json2 == json3
           end;

julia> test_inverse( id )
true

julia> test_inverse( ev )
true

julia> test_inverse( coev )
true

julia> test_inverse( X_1_1 )
true

julia> test_inverse( Z_1_1 )
true

julia> test_inverse( H )
true

julia> test_inverse( X_1_2 )
true

julia> test_inverse( Z_2_1 )
true

julia> test_inverse( X_1_2_Z_2_1 )
true

julia> succ_mod_4 = ImportFromQGraphString( ZX, StringBase64( "eyJ3aXJlX3ZlcnRpY2VzIjogeyJiMCI6IHsiYW5ub3RhdGlvbiI6IHsiYm91bmRhcnkiOiB0cnVlLCAiY29vcmQiOiBbLTMuNzUsIDQuNzVdLCAiaW5wdXQiOiAwfX0sICJiMSI6IHsiYW5ub3RhdGlvbiI6IHsiYm91bmRhcnkiOiB0cnVlLCAiY29vcmQiOiBbLTMuNzUsIDIuNzVdLCAiaW5wdXQiOiAxfX0sICJiMiI6IHsiYW5ub3RhdGlvbiI6IHsiYm91bmRhcnkiOiB0cnVlLCAiY29vcmQiOiBbMC43NSwgNC43NV0sICJvdXRwdXQiOiAwfX0sICJiMyI6IHsiYW5ub3RhdGlvbiI6IHsiYm91bmRhcnkiOiB0cnVlLCAiY29vcmQiOiBbMC43NSwgMi43NV0sICJvdXRwdXQiOiAxfX19LCAibm9kZV92ZXJ0aWNlcyI6IHsidjAiOiB7ImFubm90YXRpb24iOiB7ImNvb3JkIjogWy0yLjI1LCA0Ljc1XX0sICJkYXRhIjogeyJ0eXBlIjogIlgifX0sICJ2MSI6IHsiYW5ub3RhdGlvbiI6IHsiY29vcmQiOiBbLTAuNSwgMi43NV19LCAiZGF0YSI6IHsidHlwZSI6ICJYIiwgInZhbHVlIjogIs+AIn19LCAidjIiOiB7ImFubm90YXRpb24iOiB7ImNvb3JkIjogWy0yLjI1LCAyLjc1XX0sICJkYXRhIjogeyJ0eXBlIjogIloifX19LCAidW5kaXJfZWRnZXMiOiB7ImUwIjogeyJzcmMiOiAiYjAiLCAidGd0IjogInYwIn0sICJlMSI6IHsic3JjIjogImIxIiwgInRndCI6ICJ2MiJ9LCAiZTIiOiB7InNyYyI6ICJiMiIsICJ0Z3QiOiAidjAifSwgImUzIjogeyJzcmMiOiAiYjMiLCAidGd0IjogInYxIn0sICJlNCI6IHsic3JjIjogInYwIiwgInRndCI6ICJ2MiJ9LCAiZTUiOiB7InNyYyI6ICJ2MSIsICJ0Z3QiOiAidjIifX19" ) );

julia> test_inverse( succ_mod_4 )
true

```
