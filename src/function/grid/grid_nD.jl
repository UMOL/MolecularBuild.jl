"""
Arrange the input molecule to form a 1D grid
and return an array of clones of the original molecule.

Arguments
-----------
:Type{Grid}
    must be type ``Grid``

obj:AbstractMolecularContainer
    input molecule 

directions:Array{Array,1}
    direction of the grid for each dimension

spacings:Tuple  
    spacing between two neighboring grid points for each dimension

counts:Tuple
    number of grid points for each dimension
"""
function build(::Type{Grid}, obj::AbstractMolecularContainer, directions::Array, spacings::Tuple, counts::Tuple)
    fn_array = MolecularMove.grid(directions, spacings, counts)

    coordinate_template = obtain(one_clone(obj), :coordinate)
    
    return [one_clone(obj, Dict([(:coordinate, transform(coordinate_template))])) for transform in fn_array]
end