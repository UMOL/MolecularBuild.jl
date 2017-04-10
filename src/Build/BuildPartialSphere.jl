module BuildPartialSphere

import MolecularMove
import MolecularMove: PartialFibonacci
import SimpleMolecule: Molecule
import ..BuildShape
import ...Types: PartialFibonacciSphere
import ...Align: no_align, AlignMove

"""
Arrange a objects on a partial sphere using
the Fibonacci (sunflower) algorithm.

Arguments
----------
:Type{PartialFibonacciSphere}
    must be type ``PartialFibonacciSphere``

mols:Array{Molecule,1}
    list of molecules

number=0:Integer
    (keyword) number of replica

radius=0.0:AbstractFloat
    (keyword) radius of the sphere

center=[0,0,0]:AbstractArray 
    (keyword) center of the sphere

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

inverted:Bool
    (keyword) if true, then the final orientation will be inverted

zmin=0.0:AbstractFloat
    (keyword) lower bound along z-axis

zmax=0.0:AbstractFloat
    (keyword) upper bound along z-axis
"""
function build{T1<:AbstractFloat, T2<:AbstractFloat}(
    ::Type{PartialFibonacciSphere},
    mols::Array{Molecule,1};
    number::Integer=0,
    radius::AbstractFloat=0.0,
    center::Array{T1,1}=[0.,0.,0.],
    aligned::Bool=false,
    inverted::Bool=false,
    old_orientation::Array{T2,1}=Float64[],
    zmin::AbstractFloat=0.0,
    zmax::AbstractFloat=0.0
    )
    translation_iterator = MolecularMove.sphere(PartialFibonacci;
        number=number, radius=radius, center=center,
        zmin=zmin, zmax=zmax)

    if aligned == true
        p = Dict(:mask=>[1.0, 1.0, 1.0], :inverted=>inverted, :center=>center,
            :old_orientation=>old_orientation)
        return BuildShape.build(mols, translation_iterator, AlignMove.align, p)
    else
        return BuildShape.build(mols, translation_iterator, no_align, Dict())
    end
end
end