"""
Arrange a objects on a sphere using
an input function(algorithm).

Arguments
----------
fn_iterator:AbstractMoveIterator
    a instance of the ``AbstractMoveIterator``

obj:AbstractMolecularContainer
    input molecule 

aligned:Bool
    if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

inverted:Bool
    if true, then the final orientation will be inverted
"""
function build_sphere(fn_iterator::AbstractMoveIterator, 
    obj::AbstractMolecularContainer,
    aligned::Bool, inverted::Bool)
    
    coordinate_template = obtain(one_clone(obj), :coordinate)
    function move_and_algin(coordinates::AbstractArray, fn_move::Function, inverted::Bool)
        new_coordinates = fn_move(coordinates)
        ref_vector = fn_move(zeros(3))
        alignment_center=gage(GeometricCenter, new_coordinates)
        return align(new_coordinates, ref_vector; center=alignment_center, inverted=inverted)
    end

    if aligned == true 
        return [one_clone(obj, Dict([(:coordinate, move_and_algin(coordinate_template, fn_move, inverted))])) for fn_move in fn_iterator]
    else
        return [one_clone(obj, Dict([(:coordinate, fn_move(coordinate_template))])) for fn_move in fn_iterator]
    end
end

