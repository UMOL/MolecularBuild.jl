"""
Return ``true`` if there is any clash between the 
target vector and an array of vectors.

Arguments
---------
target:AbstractArray
    target vector 

array_of_vectors:AbstractArray
    an array of vectors 

clash_cutoff=1e-5:AbstractFloat
    (optional) cutoff distance for a distance to be considered as clashing
"""
function has_clash(target::AbstractArray, array_of_vectors::AbstractArray, clash_cutoff::AbstractFloat=1e-5)
    for item in array_of_vectors
        if gage(MinDistance, target, item) < clash_cutoff
            return true
        end
    end
    return false
end

