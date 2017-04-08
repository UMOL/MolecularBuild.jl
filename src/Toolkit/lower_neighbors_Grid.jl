import ..Types: Grid
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

matrix_shape:Tuple
    number of matrix elements along each dimension
"""
function lower_neighbors(::Type{Grid}, input::Tuple, matrix_shape::Tuple)
    return remove_invalid_index_tuples([lower_index_tuple(input, i) for i = 1:length(input)], matrix_shape)
end
