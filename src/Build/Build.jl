module Build
include("BuildShape.jl")
include("BuildGrid.jl")
include("BuildSphere.jl")
include("BuildPartialSphere.jl")
include("BuildCylinder.jl")
include("BuildPartialTorus.jl")

export BuildGrid
export BuildSphere
export BuildPartialSphere
export BuildCylinder
export BuildPartialTorus
end
