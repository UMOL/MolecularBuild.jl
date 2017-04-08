"""
Arrange the input molecule to form a n-dimensional grid
and return an array of clones of the original molecule.

Arguments
-----------
:Type{Grid}
    must be type ``Grid``

obj:Array{Molecule,1}
    input molecules

direction=eye(3):Array{Array{AbstractFloat,1},1}
    direction of the grid for each dimension

spacings=[1.0, 1.0, 1.0]:Array{Array{AbstractFloat,1},1}
    (keyword arg.) spacing between two neighboring grid points for each dimension

counts=[1,1,1]:Array{Int,1}
    number of grid points for each dimension

center:Array{AbstractFloat,1}
    center of the final grid

inverted:Bool
    whether the molecule should be inverted

randomized:Bool
    whether to randomize the orientation
"""
function build{T<:AbstractFloat}(::Type{Grid},
    objs::Array{Molecule,1};
    counts::Array{Int,1}=[1,1,1],
    directions::Array{Array{T,1},1}=eye(3),
    spacings::Array{T,1}=[1.0,1.0,1.0],
    center::Array{T,1}=[0.0, 0.0, 0.0],
    inverted::Bool=false,
    randomized::Bool=false,
    )

    translation_iterator = MolecularMove.grid(directions, spacings, counts, center)

    function no_align{T<:AbstractFloat}(coordinates::Array{Array{T,1},1}, fn_move::Function)
        return fn_move(coordinates)
    end

    function random_align{T<:AbstractFloat}(coordinates::Array{Array{T,1},1}, fn_move::Function)
        

    return build_shape(objs, translation_iterator, no_align)
end
