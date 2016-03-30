"""
Randomize the orientation of the molecule
at each grid point.

Arguments
----------
object_array:Array{AbstractMolecularContainer,1}
    array of input objects

array_size:Tuple
    a tuple for the size of the input array.

seed=0:UInt32
    (keyword arg.) seed for the random number generator.
    If non-zero, this seed will be used for the random number
    generator.
""" 
function randomize(object_array::Array, array_size::Tuple; seed::UInt32=0)
end