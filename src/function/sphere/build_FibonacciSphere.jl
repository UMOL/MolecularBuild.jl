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
function build{T<:AbstractMolecularContainer}(::Type{FibonacciSphere},
    objs::Array{T,1},
    count::Integer,
    radius::AbstractFloat; 
    center::AbstractArray=[0.,0.,0.],
    aligned::Bool=false,
    inverted::Bool=false)
    
    fn_iterator = MolecularMove.sphere(Fibonacci, count, radius; center=center)
    
    return build_shape(fn_iterator, objs, aligned, inverted)
end

