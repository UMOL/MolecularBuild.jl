"""
Arrange the input molecule to form a n-dimensional grid
and return an array of clones of the original molecule.

Arguments
-----------
:Type{Grid}
    must be type ``Grid``

obj:AbstractMolecularContainer
    input molecule 

direction=[]:Array{Array,1}
    (keyword arg.) direction of the grid for each dimension

spacing:Tuple  
    (keyword arg.) spacing between two neighboring grid points for each dimension

count:Tuple
    (keyword arg.) number of grid points for each dimension
"""
function build(::Type{Grid}, obj::AbstractMolecularContainer;
    direction::Array=[], spacing::Tuple=0., count::Tuple=0)
    return build(Grid, obj, direction, spacing, count)
end