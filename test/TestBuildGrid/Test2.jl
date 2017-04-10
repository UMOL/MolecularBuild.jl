module Test2
import Common: TestBuild
import MolecularBuild: Grid, BuildGrid
import SimpleMolecule: Molecule, Atom

function test()
    TestBuild.test(
        BuildGrid.build,
        Grid,
        [Molecule([
            Atom(coordinate=[-1.0, 0., 0.]),
            Atom(coordinate=[1.0, 0., 0.]),
            ])],
        Dict(
            :directions => [[1.,0.,0.], [0., 1., 0.], [0., 0., 1.]],
            :spacings => [1.0, 1.0, 1.0],
            :numbers => [2, 2, 2],
            :center => zeros(3),
            :inverted => false,
            :randomized => true,
            :seed => 12345
        ),
        Array{Array{AbstractFloat,1},1}[Array{AbstractFloat,1}[AbstractFloat[-1.05353,-1.03355,-1.13948],AbstractFloat[0.0535252,0.0335544,0.139476]],Array{AbstractFloat,1}[AbstractFloat[-0.0535252,-1.03355,-1.13948],AbstractFloat[1.05353,0.0335544,0.139476]],Array{AbstractFloat,1}[AbstractFloat[-1.05353,-0.0335544,-1.13948],AbstractFloat[0.0535252,1.03355,0.139476]],Array{AbstractFloat,1}[AbstractFloat[-0.0535252,-0.0335544,-1.13948],AbstractFloat[1.05353,1.03355,0.139476]],Array{AbstractFloat,1}[AbstractFloat[-1.05353,-1.03355,-0.139476],AbstractFloat[0.0535252,0.0335544,1.13948]],Array{AbstractFloat,1}[AbstractFloat[-0.0535252,-1.03355,-0.139476],AbstractFloat[1.05353,0.0335544,1.13948]],Array{AbstractFloat,1}[AbstractFloat[-1.05353,-0.0335544,-0.139476],AbstractFloat[0.0535252,1.03355,1.13948]],Array{AbstractFloat,1}[AbstractFloat[-0.0535252,-0.0335544,-0.139476],AbstractFloat[1.05353,1.03355,1.13948]]],
        "test 2: build(grid, ...)",
    )
end
end