"""
Align the longest principal axis of
an array of coordinates to a reference vector.

Arguments
----------
input:AbstractArray 
    input array of coordinates

new_orientation:AbstractArray 
    the new orientation of the input vector

tol_near_zero=1e-15:AbstractFloat
    (optional) tolerance for the length of a vector to be close to zero
    This is used to check whether the input vector is already aligned to 
    the new orientation.

center=[]:AbstractArray 
    (keyword) center of the alignment rotation

inverted=false:Bool
    (keyword) if true, then the final orientation will be inverted

"""
function align(input::AbstractArray, new_orientation::AbstractArray, 
    tol_near_zero::AbstractFloat=1e-15; 
    center::AbstractArray=[], inverted::Bool=false)
    
    orientation = gage(PrincipalAxes, input; center=center)[:,1]
    if inverted
        orientation = -orientation
    end 

    ref_axis = cross(orientation, new_orientation)

    # check whether the input is already aligned to the new orientation
    ref_axis_length = norm(ref_axis, 2)
    if ref_axis_length < tol_near_zero
        return input # no need to rotate
    else # normalize the ref_axis
        ref_axis = ref_axis ./ ref_axis_length
        angle = gage(ProjectedRotationAngle, orientation, new_orientation, ref_axis)
        return rotate(Euclidean3D, input, ref_axis, angle; center=center)
    end
end