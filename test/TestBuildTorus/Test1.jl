module Test1
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
            :aligned => false,
            :zmin => -5.0,
            :zmax => 5.0
        ),
        [
            [[11.2,0.0,3.2]],
            [[-8.72531,7.9931,1.6]],
            [[1.04911,-11.9541,0.0]],
            [[7.19968,9.3907,-1.6]],
            [[-11.0288,-1.95084,-3.2]]
        ],
        "Test1: build(PartialFibonacciTorus, ...)",
    )
end
end