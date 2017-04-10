module BuildShape

import SimpleMolecule: Molecule, obtain, clone
import MolecularMove: AbstractMoveIterator

"""
Arrange a objects on a shape using
an input function(algorithm).

Arguments
----------
molecules:Array{Molecule,1}
    input molecules

move_iterator:AbstractMoveIterator
    an iterator that returns functions that translate the coordinates

fn_align:Function(coordinates, fn_move)
    a function that aligns the coordinates

align_params::Dict
    (optional) keyword parameters for the fn_align
"""
function build(
    molecules::Array{Molecule,1},
    move_iterator::AbstractMoveIterator, 
    fn_align::Function,
    align_params::Dict=Dict(),
    )
    
    mol_count = length(molecules)
    get_mol() = molecules[rand(1:mol_count)]  # randomly choose a molecule
    original_coordinates(mol::Molecule) = [obtain(atom, :coordinate) for atom in obtain(mol, :atoms)]

    function move_molecule(mol::Molecule, fn_move::Function, fn_align::Function, resid::Int)
        new_coordinates = fn_align(original_coordinates(mol), fn_move; align_params...)
        return Molecule(
            [
                clone(atom, Dict(:residue_id => resid, :coordinate => new_coordinates[i])) 
                for (i, atom) in enumerate(obtain(mol, :atoms))
            ]
        )
    end

    return [move_molecule(get_mol(), fn_move, fn_align, i) for (i, fn_move) in enumerate(move_iterator)]
end

end