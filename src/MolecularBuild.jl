if !isdefined(:MolecularDataType)
    include(joinpath("..","..","MolecularDataType","src","MolecularDataType.jl"))
end

if !isdefined(:MolecularMove)
    include(joinpath("..","..","MolecularMove","src","MolecularMove.jl"))
end

"""
``MolecularBuild`` module is designed to build 
large molecules from smaller ones.
"""
module MolecularBuild

using MolecularDataType
using MolecularMove

export Grid, Grid1D
export build

macro debug(expression)
    return :(@assert $expression)
    # return nothing
end

macro debug_info(expression)
    return :($expression)
    # return nothing
end

include(joinpath("type","Grid","all.jl"))

include(joinpath("function","grid","all.jl"))

end
