using Base.Test

if !isdefined(:MolecularBuild)
    include(joinpath("..","src","MolecularBuild.jl"))
end
using MolecularBuild

using MolecularDataType


include(joinpath("grid","runtests.jl"))