"""
``MolecularBuild`` module is designed to build 
large molecules from smaller ones.
"""
module MolecularBuild

using MolecularDataType
using MolecularMove
using MolecularGeometry

export Grid1D, Grid
export RandomGrid3D
export FibonacciSphere
export build, align

macro debug(expression)
    return :(@assert $expression)
    # return nothing
end

macro debug_info(expression)
    return :($expression)
    # return nothing
end

include(joinpath("type","all.jl"))

include(joinpath("function","all.jl"))

end
