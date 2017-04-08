"""
``MolecularBuild`` module is designed to build 
large molecules from smaller ones.
"""
module MolecularBuild
using Reexport



include(joinpath("Types","Types.jl"))

include(joinpath("Toolkit","Toolkit.jl"))
include(joinpath("Align","Align.jl"))
include(joinpath("Build","Build.jl"))

@reexport using .Types
@reexport using .Build

export Grid1D, Grid
export FibonacciSphere
export PartialFibonacciSphere
export FibonacciCylinder
export build
end
