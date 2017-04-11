module BuildCylinder

import MolecularMove
import MolecularMove: Fibonacci
import SimpleMolecule: Molecule
import ..BuildShape
import ...Types: FibonacciCylinder
import ...Align: no_align, AlignMove

"""
Arrange a objects on a cylinder using
the Fibonacci (sunflower) algorithm.

Arguments
----------
:Type{FibonacciCylinder}
    must be type ``FibonacciCylinder``

mols:Array{Molecule,1}
    list of molecules

number=0:Integer
    (keyword) number of replica

radius=0.0:AbstractFloat
    (keyword) radius of the cylinder

center=[0,0,0]:AbstractArray 
    (keyword) center of the cylinder

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

inverted:Bool
    (keyword) if true, then the final orientation will be inverted

old_orientation=[]:Array{AbstractFloat,1}
    (keyword) the current orientation of each molecule

zmin=0.0:AbstractFloat
    (keyword) lower bound along z-axis

zmax=0.0:AbstractFloat
    (keyword) upper bound along z-axis
"""
function build{T1<:AbstractFloat, T2<:AbstractFloat}(
    ::Type{FibonacciCylinder},
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
    translation_iterator = MolecularMove.cylinder(Fibonacci;
        number=number, radius=radius, center=center,
        zmin=zmin, zmax=zmax)

    if aligned == true
        p = Dict(:inverted=>inverted, :old_orientation=>old_orientation)
        return BuildShape.build(mols, translation_iterator, AlignMove.place, p)
    else
        return BuildShape.build(mols, translation_iterator, no_align, Dict())
    end
end
end