"""
Arrange a objects on a cylinder using
the Fibonacci (sunflower) algorithm.

Arguments
----------
:Type{FibonacciCylinder}
    must be type ``FibonacciCylinder``

obj:AbstractMolecularContainer
    input molecule 

count:Integer
    number of replica

radius:AbstractFloat
    radius of the cylinder

zmin:Real
    lower bound along Z 

zmax:Real
    upper bound along Z 

center=[]:AbstractArray 
    (keyword) center of the cylinder

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

inverted:Bool
    (keyword) if true, then the final orientation will be inverted
"""
function build{T<:AbstractMolecularContainer}(::Type{FibonacciCylinder}, 
    objs::Array{T,1},
    count::Integer, radius::AbstractFloat,
    zmin::Real, zmax::Real; 
    center::AbstractArray=[0.,0.,0.], aligned::Bool=false, inverted::Bool=false)
    
    fn_iterator = MolecularMove.cylinder(Fibonacci, count, radius, zmin, zmax; center=center)
    
    return build_shape(fn_iterator, objs, aligned, inverted; mask=[1, 1, 0])
end

