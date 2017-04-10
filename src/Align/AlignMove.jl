module AlignMove
import MolecularGeometry
import MolecularGeometry: GeometricCenter
import ..BasicAlign

function align{T1<:AbstractFloat, T2<:AbstractFloat, T3<:AbstractFloat, T4<:AbstractFloat}(
    coordinates::Array{Array{T1,1},1},
    fn_move::Function;
    mask::Array{T2,1}=Float64[],
    inverted::Bool=false,
    center::Array{T3,1}=Float64[],
    old_orientation::Array{T4,1}=Float64[]
    )
    if length(coordinates) == 0
        return coordinates
    else
        @assert length(coordinates[1]) == length(mask)
        ref_vector = fn_move(zeros(length(coordinates[1]))) .* mask
        alignment_center = MolecularGeometry.gage(GeometricCenter, coordinates)
        aligned_coordinates = BasicAlign.align(coordinates, ref_vector;
            center=alignment_center, inverted=inverted, old_orientation=old_orientation)
        return fn_move(aligned_coordinates)
    end
end

export do_align
end
