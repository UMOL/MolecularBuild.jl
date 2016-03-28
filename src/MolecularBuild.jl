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
