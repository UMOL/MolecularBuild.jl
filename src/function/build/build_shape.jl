"""
Arrange a objects on a shape using
an input function(algorithm).

Arguments
----------
fn_iterator:AbstractMoveIterator
    a instance of the ``AbstractMoveIterator``

objs:Array{AbstractMolecularContainer,1}
    input molecules

aligned:Bool
    if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

inverted:Bool
    if true, then the final orientation will be inverted
"""
function build_shape{T<:AbstractMolecularContainer}(
    fn_iterator::AbstractMoveIterator, 
    objs::Array{T,1},
    aligned::Bool, inverted::Bool)
    
    obj_count = length(objs)
    get_obj() = objs[rand(1:obj_count)]  # randomly choose an object
    coordinate_template(obj) = obtain(one_clone(obj), :coordinate)
    function move_and_algin(coordinates::AbstractArray, fn_move::Function, inverted::Bool)
        # developer's note (10-14-2016):
        # It is much better to algin first then make a move (translation)
        # otherwise the orientation of the final produce may randomly be inverted
        # due to the brittleness of the matrix version of rotation.
        ref_vector = fn_move(zeros(3))
        alignment_center=gage(GeometricCenter, coordinates)
        aligned_coordinates = align(coordinates, ref_vector; center=alignment_center, inverted=inverted)
        return fn_move(aligned_coordinates)
    end

    function move_obj(obj, fn_move, resid)
        if aligned == true
            one_clone(obj,
                Dict(
                    [
                        (
                            :coordinate, 
                            move_and_algin(
                                coordinate_template(obj), 
                                fn_move,
                                inverted)
                        )
                    ]
                )
            )
        else
            return one_clone(obj,
                Dict(
                    [
                        (
                            :coordinate,
                            fn_move(coordinate_template(obj))
                        )
                    ]
                )
            )
        end
    end

    return [move_obj(get_obj(), fn_move, i) for (i, fn_move) in enumerate(fn_iterator)]
end
