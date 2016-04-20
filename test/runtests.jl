using Base.Test

if !isdefined(:MolecularBuild)
    include(joinpath("..","src","MolecularBuild.jl"))
end

using MolecularBuild
import MolecularBuild.remove_invalid_index_tuples

using MolecularDataType

include("print_dashed_line.jl")

# include(joinpath("align","runtests.jl"))
# include(joinpath("grid","runtests.jl"))
# include(joinpath("sphere","runtests.jl"))
include(joinpath("toolkit","runtests.jl"))