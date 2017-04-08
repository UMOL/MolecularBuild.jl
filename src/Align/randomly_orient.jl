import MolecularMove: rotate, RandomEuclidean3D
import MolecularGeometry: gage, GeometricCenter
import ..Toolkit: has_clash, lower_neighbors, @debug


"""
Randomly orient a set of coordinates

Arguments
----------
coordinates::Array{Array{AbstractFloat, 1}}
    inputs

counts::Array{Int,1}
    number of molecules along each dimension

seed=0::Int
    random number generator seed

tol=1.e-5::AbstractFloat
    tolerance for being near zero

max_iter=1000::Int
    max number of iteration
"""
function randomly_orient{T<:AbstractFloat, F<:AbstractFloat}(
    coordinates::Array{Array{T,1},1},
    counts::Array{Int,1};
    seed::Int=0,
    tol::F=1.0e-5,
    max_iter::Int=1000
    )

    counts_tuple = tuple(counts...)
    # only use the seed once
    if seed != 0
        rotate(RandomEuclidean3D, seed)
    end
    
    neighbor_ids = map(
        (sub_id)->sub2ind(counts_tuple, sub_id...),
        lower_neighbors(Grid, ind2sub(counts_tuple, id), counts_tuple)
    )

    center = gage(GeometricCenter, coordinates)

    for i = 1:max_iter
        new_coordinate = rotate(RandomEuclidean3D,
            coordinates, tol_near_zero, max_iter; center=center)
        if !has_clash(new_coordinate, coordinate_array[neighbor_ids], clash_cutoff)
            return new_coordinate
        end
    end
    @debug println("Warning: max iteration $(max_iter) reached. There are clashes!")
    return coordinates
end
