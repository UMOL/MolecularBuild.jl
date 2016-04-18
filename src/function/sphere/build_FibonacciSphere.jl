"""
Arrange a objects on a sphere using
the Fibonacci (sunflower) algorithm.

Arguments
----------
:Type{FibonacciSphere}
    must be type ``FibonacciSphere``

obj:AbstractMolecularContainer
    input molecule 

count:Integer
    number of replica

radius:AbstractFloat
    radius of the sphere

center=[]:AbstractArray 
    (keyword) center of the sphere

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

inverted:Bool
    (keyword) if true, then the final orientation will be inverted
"""
function build(::Type{FibonacciSphere}, obj::AbstractMolecularContainer, count::Integer, radius::AbstractFloat; 
    center::AbstractArray=[0.,0.,0.], aligned::Bool=false, inverted::Bool=false)
    
    fn_array = MolecularMove.sphere(Fibonacci, count, radius; center=center)

    coordinate_template = obtain(one_clone(obj), :coordinate)
    function move_and_algin(coordinates::AbstractArray, fn_move::Function, inverted::Bool)
        new_coordinates = fn_move(coordinates)
        ref_vector = fn_move(zeros(3))
        alignment_center=gage(GeometricCenter, new_coordinates)
        return align(new_coordinates, ref_vector; center=alignment_center, inverted=inverted)
    end

    if aligned == true 
        return [one_clone(obj, Dict([(:coordinate, move_and_algin(coordinate_template, fn_move, inverted))])) for fn_move in fn_array]
    else
        return [one_clone(obj, Dict([(:coordinate, fn_move(coordinate_template))])) for fn_move in fn_array]
    end
end

