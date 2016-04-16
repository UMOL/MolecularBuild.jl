"""
Arrange the input molecule to form a 1D grid
and return an array of clones of the original molecule.

Arguments
-----------
:Type{Grid1D}
    must be the type ``Grid1D``

obj:AbstractMolecularContainer
    input molecule 

direction:Array{AbstractFloat,1}
    direction of the grid

spacing:AbstractFloat  
    spacing between two neighboring grid points

count:Integer
    number of grid points
"""
function build(::Type{Grid1D},
    obj::AbstractMolecularContainer, 
    direction::Array, spacing::AbstractFloat, count::Integer)
    
    fn_array = MolecularMove.grid(Euclidean1D, direction, spacing, count)

    coordinate_template = obtain(one_clone(obj), :coordinate)
    
    return [one_clone(obj, Dict([(:coordinate, transform(coordinate_template))])) for transform in fn_array]
end

