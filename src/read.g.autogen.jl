# SPDX-License-Identifier: GPL-2.0-or-later
# ZXCalculusForCAP: The category of ZX-diagrams
#
# Reading the implementation part of the package.
#

include( "gap/CategoryOfCospans_for_ZXCalculus.gi.autogen.jl" );

include( "gap/precompiled_categories/CategoryOfZXDiagrams_precompiled.gi.autogen.jl" );

include( "gap/CategoryOfZXDiagrams.gi.autogen.jl" );

include( "gap/Tools.gi.autogen.jl" );

#= comment for Julia
if IsPackageMarkedForLoading( "FunctorCategories", ">= 2023.07-01" ) then
    
    include( "gap/CategoryOfZXDiagrams_as_CategoryOfCospans_CategoryOfDecoratedQuivers.gi.autogen.jl" );
    
fi;
# =#

include( "gap/init.gi.autogen.jl" );
