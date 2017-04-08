"""
Arrange a objects on a shape using
an input function(algorithm).

Arguments
----------
fn_iterator:AbstractMoveIterator
    a instance of the ``AbstractMoveIterator``

molecules:Array{Molecule,1}
    input molecules

aligned:Bool
    if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

inverted:Bool
    if true, then the final orientation will be inverted
"""
function build_shape(
    fn_iterator::AbstractMoveIterator, 
    molecules::Array{Molecule,1},
    aligned::Bool,
    inverted::Bool;
    mask::Array{Int,1}=[1,1,1]
    )
    
    mol_count = length(molecules)
    get_mol() = molecules[rand(1:mol_count)]  # randomly choose a molecule
    original_coordinates(mol::Molecule) = [obtain(atom, :coordinate) for atom in obtain(mol, :atoms)]

    function move_and_algin(coordinates::AbstractArray, fn_move::Function, inverted::Bool)
        # developer's note (10-14-2016):
        # It is much better to align first then make a move (translation)
        # otherwise the orientation of the final produce may randomly be inverted
        # due to the brittleness of the matrix version of rotation.
        ref_vector = fn_move(zeros(3)) .* mask
        alignment_center=gage(GeometricCenter, coordinates)
        aligned_coordinates = align(coordinates, ref_vector; center=alignment_center, inverted=inverted)
        return fn_move(aligned_coordinates)
    end

    function move_molecule(mol::Molecule, fn_move::Function, resid::Int)
        if aligned == true
            new_coordinates = move_and_algin(
                                original_coordinates(mol), 
                                fn_move,
                                inverted)
        else
            new_coordinates = fn_move(original_coordinates(mol))
        end
        return Molecule(
            [
                clone(atom, Dict(:residue_id => resid, :coordinate => new_coordinates[i])) 
                for (i, atom) in enumerate(obtain(mol, :atoms))
            ]
        )
    end

    return [move_molecule(get_mol(), fn_move, i) for (i, fn_move) in enumerate(fn_iterator)]
end
