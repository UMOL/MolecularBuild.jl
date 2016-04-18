using Base.Test

if !isdefined(:MolecularBuild)
    include(joinpath("..","src","MolecularBuild.jl"))
end
using MolecularBuild

using MolecularDataType

include("print_dashed_line.jl")

include(joinpath("align","runtests.jl"))
# include(joinpath("grid","runtests.jl"))
# include(joinpath("sphere","runtests.jl"))