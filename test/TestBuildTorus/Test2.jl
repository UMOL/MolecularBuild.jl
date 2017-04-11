module Test2
import Common: TestBuild
import MolecularBuild: PartialFibonacciTorus, BuildPartialTorus
import SimpleMolecule: Molecule, Atom

function test()
    TestBuild.test(
        BuildPartialTorus.build,
        PartialFibonacciTorus,
        [
            Molecule(
                [
                    Atom(coordinate=[1.0, 0.0, 0.0]),
                    Atom(coordinate=[0.0, 0.0, 0.0]),
                ]
            )
        ],
        Dict(
            :number => 5,
            :radius => 10.0,
            :a => 2.0,
            :b => 4.0,
            :center => zeros(3),
            :inverted => false,
            :aligned => true,
            :zmin => -5.0,
            :zmax => 5.0,
            :old_orientation => [1.0, 0, 0]
        ),
        [
            [
                [11.8756,0.0,3.66816],
                [11.5244,0.0,2.73184]],
            [
                [-8.50306,8.24754,1.9288],
                [-7.94755,7.73865,1.2712]],
            [
                [1.59282,-12.4521,0.0],
                [1.5054,-11.456,0.0]],
            [
                [7.92887,9.68964,-1.9288],
                [7.47049,9.09176,-1.2712]],
            [
                [-10.7017,-1.98142,-3.66816],
                [-10.3559,-1.92026,-2.73184]
            ]
        ],
        "Test2: build(PartialFibonacciTorus, ...) with alignment",
    )
end
end