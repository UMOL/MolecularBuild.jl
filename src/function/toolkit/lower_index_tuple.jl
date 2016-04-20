"""
Return a new index tuple with the ``i``-th
index lowered by one.

Arguments
----------
index_tuple:Tuple 
    input index tuple 

id:Integer
    which index 
"""
function lower_index_tuple(index_tuple::Tuple, id::Integer)
    return tuple(map((i) -> i == id ? (index_tuple[i] - 1) : index_tuple[i], index_tuple)...)
end