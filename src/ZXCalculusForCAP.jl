module ZXCalculusForCAP

@nospecialize

using CAP

import CAP.ObjectConstructor
import CAP.MorphismConstructor
import CAP.DisplayString
import CAP.ViewString

using MonoidalCategories

using CartesianCategories

using Toposes

using FinSetsForCAP

include("init.jl")

# convenience converting Int to BigInt

##
function ObjectConstructor(cat::IsCategoryOfZXDiagrams.abstract_type, n::Int)
    ObjectConstructor(cat, BigInt(n));
end

##
function MorphismConstructor(s::IsZXDiagramObject.abstract_type, graph::Tuple{Vector{String}, Vector{Vector{Int64}}}, t::IsZXDiagramObject.abstract_type)
	MorphismConstructor(s, [graph[1], map(edge -> [ BigInt( edge[1] ), BigInt( edge[2] ) ], graph[2])], t)
end

end # module ZXCalculusForCAP
