"""
Arrange the input molecule to form a 1D grid
and return an array of clones of the original molecule.

Arguments
-----------
:Type{Grid1D}
    must be the type ``Grid1D``

obj:AbstractMolecularContainer
    input molecule 

direction=[]:Array{AbstractFloat,1}
    (keyword arg.) direction of the grid

spacing=0.:AbstractFloat  
    (keyword arg.) spacing between two neighboring grid points

count=0:Integer
    (keyword arg.) number of grid points
"""
function build(::Type{Grid1D}, obj::AbstractMolecularContainer; 
    direction::Array=[], spacing::AbstractFloat=0., count::Integer=0)
    return build(Grid1D, obj, direction, spacing, count)
end