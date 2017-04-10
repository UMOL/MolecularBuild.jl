module BuildGrid

import MolecularMove
import MolecularMove: Euclidean
import SimpleMolecule: Molecule
import ..BuildShape
import ...Types: Grid
import ...Align: RandomlyAlignMove, no_align

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

numbers=[1,1,1]:Array{Int,1}
    number of grid points for each dimension

center=[0.0,0.0,0.0]:Array{AbstractFloat,1}
    center of the final grid

inverted=false:Bool
    whether the molecule should be inverted

randomized=false:Bool
    whether to randomize the orientation

seed:Int
    seed for generating random orientations

tol=1.e-5::AbstractFloat
    tolerance for being near zero

max_iter=1000::Int
    max number of iteration
"""
function build{T<:AbstractFloat, F<:AbstractFloat}(
    ::Type{Grid},
    objs::Array{Molecule,1};
    numbers::Array{Int,1}=[1,1,1],
    directions::Array{Array{T,1},1}=eye(3),
    spacings::Array{T,1}=[1.0,1.0,1.0],
    center::Array{T,1}=[0.0, 0.0, 0.0],
    inverted::Bool=false,
    randomized::Bool=false,
    seed::Int=0,
    tol::F=1e-5,
    max_iter::Int=1000
    )

    translation_iterator = MolecularMove.grid(Euclidean;
        directions=directions, spacings=spacings, numbers=numbers, center=center)

    if randomized == true
        p = Dict(:params => Dict(:seed=>seed, :tol=>tol, :max_iter=>max_iter))
        return BuildShape.build(objs, translation_iterator, RandomlyAlignMove.align, p)
    else
        return BuildShape.build(objs, translation_iterator, no_align)
    end
end

export build
end