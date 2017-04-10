module RandomlyOrient

import MolecularMove: rotate, rotate_seed, RandomEuclidean3D
import MolecularGeometry: gage, GeometricCenter
import ...Toolkit: has_clash, lower_neighbors, @debug
import ...Types: Grid

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
function orient{T<:AbstractFloat, F<:AbstractFloat}(
    coordinates::Array{Array{T,1},1};
    seed::Int=0,
    tol::F=1e-5,
    max_iter::Int=1000
    )

    # only use the seed once
    if seed != 0
        rotate_seed(seed)
    end

    center = gage(GeometricCenter, coordinates)
    return rotate(RandomEuclidean3D,
            coordinates; tol=tol, max_iter=max_iter, center=center)
end

export orient
end
