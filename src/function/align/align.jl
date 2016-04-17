"""
Align the longest principal axis of
an array of coordinates to a reference vector.

Arguments
----------
input:AbstractArray 
    input array of coordinates

ref_vector:AbstractArray 
    the vector to be aligned to 

center=[]:AbstractArray 
    (keyword) center of the alignment rotation

inverted=false:Bool
    (keyword) if true, then the final orientation will be inverted
"""
function align(input::AbstractArray, ref_vector::AbstractArray; center::AbstractArray=[], inverted::Bool=false)
    orientation = gage(PrincipalAxes, input; center=center)[:,1]
    angles = gage(RotationAngle3D, orientation, ref_vector)
    
    if length(center) == 0
        output = rotate(Euclidean3D, input, angles)
    else
        output = rotate(Euclidean3D, input, angles; center=center)
    end
     
    if inverted
        output = -output
    end 

    return output
end