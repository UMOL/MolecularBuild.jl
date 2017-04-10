module Test4
import Common: TestBuild
import MolecularBuild: PartialFibonacciSphere, BuildPartialSphere
import SimpleMolecule: Molecule, Atom

function test()
    TestBuild.test(
        BuildPartialSphere.build,
        PartialFibonacciSphere,
        [
            Molecule(
                [
                    Atom(coordinate=[0.0, 0.0, 0.0]),
                ]
            )
        ],
        Dict(
            :number => 5,
            :radius => 10.0,
            :center => zeros(3),
            :inverted => false,
            :aligned => false,
            :zmin => -5.0,
            :zmax => 5.0
        ),
        [
            [[ 0.757128985491524, -8.627094279033271,  5.]],
            [[ 5.804136811532121,  7.570468669310885,  3.]],
            [[-9.797775470383256, -1.733088523981437,  1.]],
            [[ 8.395259183305276, -5.340376695058919, -1.]],
            [[-2.476467233021272,  9.212334668463361, -3.]]
        ],
        "Test4: build(PartialFibonacciSphere, ...) with alignment and old orientation",
    )
end
end