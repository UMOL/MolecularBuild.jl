if !isdefined(:MolecularBuild)
    include(joinpath("..","src","MolecularBuild.jl"))
end

include(joinpath("Common", "Common.jl"))
include(joinpath("TestBuildGrid", "TestBuildGrid.jl"))

import TestBuildGrid

TestBuildGrid.test()
