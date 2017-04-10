if !isdefined(:MolecularBuild)
    include(joinpath("..","src","MolecularBuild.jl"))
end

include(joinpath("Common", "Common.jl"))
include(joinpath("TestBuildGrid", "TestBuildGrid.jl"))
include(joinpath("TestBuildSphere", "TestBuildSphere.jl"))

import TestBuildGrid

# TestBuildGrid.test()
TestBuildSphere.test()
