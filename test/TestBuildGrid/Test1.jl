module Test1
import Common: TestBuild
import MolecularBuild: Grid, BuildGrid
import SimpleMolecule: Molecule, Atom

function test()
    TestBuild.test(
        BuildGrid.build,
        Grid,
        [Molecule([Atom(coordinate=[0., 0., 0.])])],
        Dict(
            :directions => [[1.,0.,0.], [0., 1., 0.], [0., 0., 1.]],
            :spacings => [1.0, 1.0, 1.0],
            :numbers => [2, 2, 2],
            :center => zeros(3),
            :inverted => false,
            :randomized => false,
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