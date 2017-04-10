module TestBuild

import ..Line
import MolecularBuild
import SimpleMolecule: obtain, Molecule
using Base.Test

function test{F<:AbstractFloat}(
    builder::Function,
    T::Type,
    objs::Array{Molecule,1},
    params::Dict,
    solution::Array{Array{Array{F,1},1},1},
    msg::AbstractString="")

    Line.print_line(80)
    print_with_color(:blue,"Test build($(T),...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end

    @time molecules = builder(T, objs; params...)

    answer = [[obtain(atom, :coordinate) for atom in obtain(mol, :atoms)] for mol in molecules]
    for i = 1:size(solution, 1)
        for j = 1:size(solution[i], 1)
            @test_approx_eq_eps answer[i][j] solution[i][j] 1e-4
        end
    end

    print_with_color(:green, "VERIFIED! build($(T),...)\n\n")
    Line.print_line(80)
    return true
end

end