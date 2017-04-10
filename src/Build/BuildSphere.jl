module BuildSphere

import MolecularMove
import SimpleMolecule: Molecule
import ..BuildShape
import ...Types: FibonacciSphere
import ...Align: no_align

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
function build{T<:AbstractFloat}(
    ::Type{FibonacciSphere},
    mols::Array{Molecule,1};
    number::Integer=0,
    radius::AbstractFloat=0.0,
    center::Array{T,1}=[0.,0.,0.],
    aligned::Bool=false,
    inverted::Bool=false
    )
    translation_iterator = MolecularMove.sphere(MolecularMove.Fibonacci;
        number=number, radius=radius, center=center)

    if randomized == true
        return BuildShape.build(objs, translation_iterator, no_align)
    else
        return BuildShape.build(objs, translation_iterator, no_align)
    end
end
end