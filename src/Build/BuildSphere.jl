module BuildSphere

import MolecularMove
import SimpleMolecule: Molecule
import ..BuildShape
import ...Types: FibonacciSphere
import ...Align: no_align, AlignMove

"""
Arrange a objects on a sphere using
the Fibonacci (sunflower) algorithm.

Arguments
----------
:Type{FibonacciSphere}
    must be type ``FibonacciSphere``

mols:Array{Molecule,1}
    list of molecules

number=0:Integer
    (keyword) number of replica

radius:AbstractFloat
    (keyword) radius of the sphere

center=[]:AbstractArray 
    (keyword) center of the sphere

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

inverted:Bool
    (keyword) if true, then the final orientation will be inverted
"""
function build{T1<:AbstractFloat, T2<:AbstractFloat}(
    ::Type{FibonacciSphere},
    mols::Array{Molecule,1};
    number::Integer=0,
    radius::AbstractFloat=0.0,
    center::Array{T1,1}=[0.,0.,0.],
    aligned::Bool=false,
    inverted::Bool=false,
    old_orientation::Array{T2,1}=Float64[]
    )
    translation_iterator = MolecularMove.sphere(MolecularMove.Fibonacci;
        number=number, radius=radius, center=center)

    if aligned == true
        p = Dict(:mask=>[1.0, 1.0, 1.0], :inverted=>inverted, :center=>center,
            :old_orientation=>old_orientation)
        return BuildShape.build(mols, translation_iterator, AlignMove.align, p)
    else
        return BuildShape.build(mols, translation_iterator, no_align, Dict())
    end
end
end