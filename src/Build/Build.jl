module Build
include("BuildShape.jl")
include("BuildGrid.jl")
include("BuildSphere.jl")
include("BuildPartialSphere.jl")

export BuildGrid
export BuildSphere
export BuildPartialSphere
end
