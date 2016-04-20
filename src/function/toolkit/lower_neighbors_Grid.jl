"""
Return a list of lower neighbors' index.
For example, the lower neighbors of
``(2,2,2)`` are 
``[(1,2,2), (2,1,2), (2,2,1)]``.

Arguments
----------
:Type{Grid}
    must be type ``Grid``

input:Tuple
    a tuple of indices

max_index:Integer
    maximum index 
"""
function lower_neighbors(::Type{Grid}, input::Tuple, max_index::Integer)
    return remove_invalid_index_tuples([lower_index_tuple(input, i) for i = 1:length(input)], max_index)
end
