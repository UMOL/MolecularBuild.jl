module Test2
import Common: TestBuild
import MolecularBuild
import SimpleMolecule: Molecule, Atom

function test()
    TestBuild.test(
        MolecularBuild.Grid,
        [Molecule([Atom(coordinate=[0., 0., 0.])])],
        Dict(
            :directions => [[1.,0.,0.], [0., 1., 0.], [0., 0., 1.]],
            :spacings => [1.0, 1.0, 1.0],
            :counts => [2, 2, 2],
            :center => zeros(3),
            :inverted => false,
            :randomized => true,
            :seed => 100
        ),
        [
            [[0., 0., 0.]],
            [[1., 0., 0.]],
            [[0., 1., 0.]],
            [[1., 1., 0.]],
            [[0., 0., 1.]],
            [[1., 0., 1.]],
            [[0., 1., 1.]],
            [[1., 1., 1.]],
        ] - 0.5,
        "test 1: build(grid, ...)",
    )
end
end