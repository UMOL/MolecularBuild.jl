module BasicAlign

import MolecularGeometry: gage, ProjectedRotationAngle
import MolecularGeometry: PrincipalAxes
import MolecularMove: rotate, Euclidean3D

"""
Align the longitudinal axis (assume to be [1, 0, 0]) of
an array of coordinates to a reference vector.

Arguments
----------
input:AbstractArray 
    input array of coordinates

new_orientation:AbstractArray 
    the new orientation of the input vector

tol=1e-6:AbstractFloat
    (keyword) tolerance for the length of a vector to be close to zero
    This is used to check whether the input vector is already aligned to 
    the new orientation.

old_orientation=[]::AbstractArray
    (keyword) original orientation.
    If not set, the principal axis will be used

center=[]:AbstractArray 
    (keyword) center of the alignment rotation

inverted=false:Bool
    (keyword) if true, then the final orientation will be inverted

"""
function align(
    input::AbstractArray,
    new_orientation::AbstractArray;
    tol::AbstractFloat=1e-6,
    old_orientation::AbstractArray=Float64[],
    center::AbstractArray=Float64[],
    inverted::Bool=false)
    
    if length(old_orientation) == 0
        old_orientation = gage(PrincipalAxes, input; center=center)[:,1]
    end

    if inverted
        old_orientation = -old_orientation
    end 

    ref_axis = cross(old_orientation, new_orientation)

    # check whether the input is already aligned to the new orientation
    ref_axis_length = norm(ref_axis, 2)
    if ref_axis_length < tol
        return input # no need to rotate
    else # normalize the ref_axis
        ref_axis = ref_axis ./ ref_axis_length
        rotation_angle = gage(ProjectedRotationAngle, old_orientation, new_orientation, ref_axis)
        return rotate(Euclidean3D, input; ref=ref_axis, theta=rotation_angle, center=center)
    end
end

export align
end