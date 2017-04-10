module RandomlyAlignMove
import ..RandomlyOrient

function align{T<:AbstractFloat}(coordinates::Array{Array{T,1},1}, fn_move::Function, params::Dict)
    return fn_move(RandomlyOrient.orient(coordinates; params...))
end

export do_align
end
