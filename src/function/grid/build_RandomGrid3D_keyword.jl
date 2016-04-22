"""
Rotate the input vector to a random orientation.

Arguments
----------
:Type{RandomGrid3D}
    must be type ``RandomGrid3D``

obj:AbstractMolecularContainer
    input molecule 

tol_near_zero:AbstractFloat
    (optional) tolerance for being close to zero

directions=[]:AbstractArray{Array,1}
    (keyword) direction of the grid for each dimension

spacings=():Tuple  
    (keyword) spacing between two neighboring grid points for each dimension

counts=():Tuple
    (keyword) number of grid points for each dimension

seed=0:Integer
    (keyword) seed for the random number generator.
    If non-zero, this seed will be used for the random number
    generator.

max_iteration=1000:Integer
    (keyword) maximum number of iteration for choosing proper random orientation

clash_cutoff=1e-3:AbstractFloat
    (keyword) cutoff distance for clashes between neighboring molecules
""" 
function build(::Type{RandomGrid3D}, 
    obj::AbstractMolecularContainer,
    tol_near_zero::AbstractFloat=1e-7; 
    directions::AbstractArray=[],
    spacings::Tuple=(), 
    counts::Tuple=(),
    seed::Integer=0,
    max_iteration::Integer=1000,
    clash_cutoff::AbstractFloat=1e-3)
    return build(RandomGrid3D, obj, directions, spacings, counts, tol_near_zero;
        seed=seed, max_iteration=max_iteration, clash_cutoff=clash_cutoff)
end