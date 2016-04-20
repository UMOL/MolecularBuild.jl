"""
Return a new list with invalid indices removed
for an input list of tuples.

Arguments
----------
input:AbstractArray{Tuple,1}
    a list of array index tuples

max_index:Integer  
    upper bound for the index
"""
function remove_invalid_index_tuples(input::AbstractArray, max_index::Integer)
    function is_valid(index_tuple::Tuple)
        for item in index_tuple
            if item < 1 || item > max_index
                return false
            end
        end
        return true
    end
    return filter(is_valid, input)
end