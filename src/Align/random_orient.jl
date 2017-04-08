"""
Randomly orient a set of coordinates
"""
function randomly_orient{T<:AbstractFloat}(coordinates::Array{Array{T,1},1}, fn_move::Function)
        # only use the seed once
if seed != 0
    rotate(RandomEuclidean3D, seed)
end
    neighbor_ids = map((sub_id)->sub2ind(counts, sub_id...), lower_neighbors(Grid, ind2sub(counts, id), counts))
    center = gage(GeometricCenter, coordinate_array[id])
    for i = 1:max_iteration
        new_coordinate = rotate(RandomEuclidean3D, coordinate_array[id], tol_near_zero, max_iteration; center=center)
        if !has_clash(new_coordinate, coordinate_array[neighbor_ids], clash_cutoff)
            return new_coordinate
        end
    end
    @debug println(max_iteration , " max_iteration reached!")
    return coordinate_array[id]
end
