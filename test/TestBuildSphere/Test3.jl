module Test3
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
            :old_orientation => [1.0, 0, 0]
        ),
        [
            [[10.0,0.0,5.0]
            ,[2.0,0.0,11.0]],
            [[-4.7581,10.0103,1.46769]
            ,[-8.7581,2.37163,6.53231]],
            [[0.874257,-9.96171,-5.0]
            ,[0.874257,-9.96171,5.0]],
            [[3.57643,6.33956,-8.4864]
            ,[7.57643,8.20738,0.486404]],
            [[-9.90828,-0.0234265,-5.17933]
            ,[-1.90828,-2.06676,-10.8207]]
        ],
        "Test3: build(FibonacciSphere, ...) with alignment and old orientation",
    )
end
end