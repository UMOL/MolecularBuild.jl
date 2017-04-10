module Test2
import Common: TestBuild
import MolecularBuild: FibonacciSphere, BuildSphere
import SimpleMolecule: Molecule, Atom

function test()
    TestBuild.test(
        BuildSphere.build,
        FibonacciSphere,
        [
            Molecule(
                [
                    Atom(coordinate=[0., 0., -5.0]),
                    Atom(coordinate=[0., 0.,  5.0]),
                ]
            )
        ],
        Dict(
            :number => 5,
            :radius => 10.0,
            :center => zeros(3),
            :inverted => false,
            :aligned => true,
        ),
        [
            [[3.,                 0.,                  4.],
              [9.,                 0.,                 12.]],
            [[-3.379048698898564,  3.095485404661428,  2.],
              [-10.137146096695693, 9.286456213984282,  6.]],
            [[ 0.437128623584799, -4.980855204324139,  0.],
              [ 1.311385870754398, -14.942565612972416, 0.]],
            [[ 2.788217136188351,  3.63673551436802,  -2.],
              [ 8.364651408565052,  10.910206543104062,-6.]],
            [[-2.954140455946286, -0.522545851137935, -4.],
              [-8.862421367838857, -1.567637553413805, -12.]]
        ],
        "Test2: build(FibonacciSphere, ...) with alignment",
    )
end
end