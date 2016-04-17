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

center=[0.,0.,0.]:AbstractArray 
    (keyword) center of the sphere

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.
"""
function build(::Type{FibonacciSphere}, obj::AbstractMolecularContainer, count::Integer, radius::AbstractFloat; center::AbstractArray=[0.,0.,0.], aligned::Bool=false)
    fn_array = MolecularMove.sphere(Fibonacci, count, radius; center=center)

    coordinate_template = obtain(one_clone(obj), :coordinate)
    
    return [one_clone(obj, Dict([(:coordinate, transform(coordinate_template))])) for transform in fn_array]
end

