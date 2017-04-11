module BuildPartialTorus

import MolecularMove
import MolecularMove: PartialFibonacci
import SimpleMolecule: Molecule
import ..BuildShape
import ...Types: PartialFibonacciTorus
import ...Align: no_align, AlignMove

"""
Arrange a objects on a cylinder using
the Fibonacci spiral algorithm.

Arguments
----------
:Type{PartialFibonacciCTorus
    must be type ``PartialFibonacciCyTorus

mols:Array{Molecule,1}
    list of molecules

number=0:Integer
    (keyword) number of replica

radius=0.0:AbstractFloat
    (keyword) radius of the cylinder

a=1.0:AbstractFloat
    major radius of the ellipse

b=1.0:AbstractFloat
    minor radius of the ellipse

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
    ::Type{PartialFibonacciTorus},
    mols::Array{Molecule,1};
    number::Integer=0,
    radius::AbstractFloat=0.0,
    a::AbstractFloat=1.0,
    b::AbstractFloat=1.0,
    center::Array{T1,1}=[0.,0.,0.],
    aligned::Bool=false,
    inverted::Bool=false,
    old_orientation::Array{T2,1}=Float64[],
    zmin::AbstractFloat=0.0,
    zmax::AbstractFloat=0.0
    )
    translation_iterator = MolecularMove.torus(PartialFibonacci;
        number=number, radius=radius, a=a, b=b, center=center,
        zmin=zmin, zmax=zmax)

    function fn_mask{T<:AbstractFloat}(xs::Array{T,1})
        return xs - (radius/norm(xs[1:2]))*[xs[1], xs[2], 0.0]
    end

    if aligned == true
        p = Dict(:inverted=>inverted, :old_orientation=>old_orientation,
            :fn_mask=>fn_mask)
        return BuildShape.build(mols, translation_iterator, AlignMove.place, p)
    else
        return BuildShape.build(mols, translation_iterator, no_align, Dict())
    end
end
end