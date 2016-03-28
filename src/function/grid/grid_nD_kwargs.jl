"""
Arrange the input molecule to form a n-dimensional grid
and return an array of clones of the original molecule.

Arguments
-----------
:Type{Grid}
    must be type ``Grid``

obj:AbstractMolecularContainer
    input molecule 

directions=[]:Array{Array,1}
    (keyword arg.) direction of the grid for each dimension

spacings:Tuple  
    (keyword arg.) spacing between two neighboring grid points for each dimension

counts:Tuple
    (keyword arg.) number of grid points for each dimension
"""
function build(::Type{Grid}, obj::AbstractMolecularContainer;
    directions::Array=[], spacings::Tuple=0., counts::Tuple=0)
    return build(Grid, obj, directions, spacings, counts)
end