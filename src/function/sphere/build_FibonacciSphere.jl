"""
Arrange a objects on a sphere using
the Fibonacci (sunflower) algorithm.

Arguments
----------
:Type{FibonacciSphere}
    must be type ``FibonacciSphere``

obj:AbstractMolecularContainer
    input molecule 

count:Integer
    number of replica

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.
"""
function build(::Type{FibonacciSphere}, obj::AbstractMolecularContainer, count::Integer; aligned::Bool=false)
end

