
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

julia> id = IdentityMorphism( three );

julia> ev = EvaluationForDual( three );

julia> coev = CoevaluationForDual( three );

julia> PreCompose( ev, IdentityMorphism( zero ) );

julia> PreCompose( IdentityMorphism( TensorProduct( three, three ) ), ev );

julia> PreCompose( coev, IdentityMorphism( TensorProduct( three, three ) ) );

julia> PreCompose( IdentityMorphism( zero ), coev );

julia> Display( PreCompose( coev, ev ) )
A morphism in Category of ZX-diagrams given by a ZX diagram with 0 vertex labels
  [ ],
  inputs
  [ ],
  outputs
  [ ],
  and 0 edges
  [ ].

julia> Display( PreCompose( ev, coev ) )
A morphism in Category of ZX-diagrams given by a ZX diagram with 6 vertex labels
  [ "neutral", "neutral", "neutral", "neutral", "neutral", "neutral" ],
  inputs
  [ 0, 1, 2, 0, 1, 2 ],
  outputs
  [ 3, 4, 5, 3, 4, 5 ],
  and 0 edges
  [ ].

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

```
