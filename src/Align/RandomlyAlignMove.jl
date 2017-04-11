module RandomlyAlignMove
import ..RandomlyOrient

function place{T<:AbstractFloat}(coordinates::Array{Array{T,1},1}, fn_move::Function; params::Dict=Dict())
    return fn_move(RandomlyOrient.orient(coordinates; params...))
end

export place
end
