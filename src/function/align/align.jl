"""
Align the longest principal axis of
an array of coordinates to a reference vector.

Arguments
----------
input:AbstractArray 
    input array of coordinates

ref_vector:AbstractArray 
    the vector to be aligned to 

center=[0.,0.,0.]:AbstractArray 
    (keyword) center of the alignment rotation; default: [0, 0, 0]

inverted=false:Bool
    (keyword) if true, then the final orientation will be inverted
"""
function align(input::AbstractArray, ref_vector::AbstractArray; center::AbstractArray=[0.,0.,0.], inverted::Bool=false)
    orientation = gage(PrincipalAxes, input)[:,1]
    angles = gage(RotationAngle3D, orientation, ref_vector)
    if inverted 
        return -rotate(Euclidean3D, input, angles; center=center)
    else
        return rotate(Euclidean3D, input, angles; center=center)
    end
end