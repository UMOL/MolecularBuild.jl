"""
Rotate the input vector to a random orientation.

Arguments
----------
:Type{RandomGrid3D}
    must be type ``RandomGrid3D``

obj:AbstractMolecularContainer
    input molecule 

directions:Array{Array,1}
    direction of the grid for each dimension

spacings:Tuple  
    spacing between two neighboring grid points for each dimension

counts:Tuple
    number of grid points for each dimension

seed=0:Integer
    (keyword) seed for the random number generator.
    If non-zero, this seed will be used for the random number
    generator.
""" 
function build(::Type{RandomGrid3D}, 
    obj::AbstractMolecularContainer,
    directions::AbstractArray,
    spacings::Tuple, 
    counts::Tuple; 
    seed::Integer=0)
    

    fn_array = MolecularMove.grid(directions, spacings, counts)

    coordinate_template = obtain(one_clone(obj), :coordinate)
    
    return [one_clone(obj, Dict([(:coordinate, transform(coordinate_template))])) for transform in fn_array]
end