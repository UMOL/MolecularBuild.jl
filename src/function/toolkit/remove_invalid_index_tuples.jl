"""
Return a new list with invalid indices removed
for an input list of tuples.

Arguments
----------
input:AbstractArray{Tuple,1}
    a list of array index tuples

matrix_shape:Tuple
    the number of elements along each dimension
"""
function remove_invalid_index_tuples(input::AbstractArray, matrix_shape::Tuple)
    function is_valid(index_tuple::Tuple)
        for i = 1:length(index_tuple)
            if index_tuple[i] < 1 || index_tuple[i] > matrix_shape[i]
                return false
            end
        end
        return true
    end
    return filter(is_valid, input)
end