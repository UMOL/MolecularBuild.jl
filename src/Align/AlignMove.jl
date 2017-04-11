module AlignMove
import MolecularGeometry
import MolecularGeometry: GeometricCenter
import ..BasicAlign

"""
Calculate the new location after translation and rotation


Arguments
----------
coordinates::Array{Array{AbstractFloat,1},1}
    coordinates

fn_move::Function
    a function that translate the coordinates to a new location

fn_mask(x)-x::Function
    (keyword) a masking function for the new orientation after alignment

inverted=false::Bool
    (keyword) whether to invert the orientation

old_orientation=Float64[]:Array{AbstractFloat,1}
    (keyword) if specified, this will be used as the orientation before alignment
"""
function place{T1<:AbstractFloat, T2<:AbstractFloat}(
    coordinates::Array{Array{T1,1},1},
    fn_move::Function;
    fn_mask::Function=x->x,
    inverted::Bool=false,
    old_orientation::Array{T2,1}=Float64[]
    )
    if length(coordinates) == 0
        return coordinates
    else
        ref_vector = fn_mask(fn_move(zeros(length(coordinates[1]))))
        alignment_center = MolecularGeometry.gage(GeometricCenter, coordinates)
        aligned_coordinates = BasicAlign.align(coordinates, ref_vector;
            center=alignment_center, inverted=inverted, old_orientation=old_orientation)
        return fn_move(aligned_coordinates)
    end
end

export place
end
