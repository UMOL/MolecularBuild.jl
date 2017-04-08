"""
Arrange a objects on a partial (truncated) sphere using
the Fibonacci (sunflower) algorithm.

Arguments
----------
:Type{PartialFibonacciSphere}
    must be type ``FibonacciSphere``

obj:AbstractMolecularContainer
    input molecule 

count:Integer
    number of replica

radius:AbstractFloat
    radius of the sphere

zmin:Real
    lower bound along Z 

zmax:Real
    upper bound along Z 

center=[]:AbstractArray 
    (keyword) center of the sphere

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

inverted:Bool
    (keyword) if true, then the final orientation will be inverted
"""
function build(::Type{PartialFibonacciSphere},
    objs::Array{Molecule,1},
    count::Integer,
    radius::AbstractFloat,
    zmin::Real,
    zmax::Real; 
    center::AbstractArray=[0.,0.,0.],
    aligned::Bool=false,
    inverted::Bool=false)
    
    fn_iterator = MolecularMove.sphere(PartialFibonacci, count, radius, zmin, zmax; center=center)
    
    return build_shape(fn_iterator, objs, aligned, inverted)
end

