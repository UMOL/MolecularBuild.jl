"""
Return ``true`` if there is any clash between the 
target vector and an array of vectors.

Arguments
---------
target:AbstractArray
    target vector 

array_of_vectors:AbstractArray
    an array of vectors 

tolerance=1e-5:AbstractFloat
    (optional) tolerance for a distance to be considered as clashing
"""
function has_clash(target::AbstractArray, array_of_vectors::AbstractArray, tolerance::AbstractFloat=1e-5)
    for item in array_of_vectors
        if gage(MinDistance, target, item) < tolerance
            return true
        end
    end
    return false
end

