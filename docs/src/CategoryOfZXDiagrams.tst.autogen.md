
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
  [ ]
  and 0 edges
  [ ].

julia> Display( PreCompose( ev, coev ) )
A morphism in Category of ZX-diagrams given by a ZX diagram with 12 vertex labels
  [ "input", "input", "input", "input", "input", "input", "output", "output", "output", "output", "output", "output" ]
  and 6 edges
  [ [ 0, 5 ], [ 1, 4 ], [ 2, 3 ], [ 6, 11 ], [ 7, 10 ], [ 8, 9 ] ].

julia> X_1_1 = MorphismConstructor( one, [ [ "input", "X", "output" ], [ [ BigInt( 0 ), BigInt( 1 ) ], [ BigInt( 1 ), BigInt( 2 ) ] ] ], one );

julia> IsWellDefinedForMorphisms( X_1_1 )
true

julia> Z_1_1 = MorphismConstructor( one, [ [ "input", "Z", "output" ], [ [ BigInt( 0 ), BigInt( 1 ) ], [ BigInt( 1 ), BigInt( 2 ) ] ] ], one );

julia> IsWellDefinedForMorphisms( Z_1_1 )
true

julia> H = MorphismConstructor( one, [ [ "input", "H", "output" ], [ [ BigInt( 0 ), BigInt( 1 ) ], [ BigInt( 1 ), BigInt( 2 ) ] ] ], one );

julia> IsWellDefinedForMorphisms( H )
true

```
