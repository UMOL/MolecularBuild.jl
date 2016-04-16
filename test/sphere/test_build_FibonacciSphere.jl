"""
A test for build(FibonacciSphere,...).

Arguments
-----------
:Type{FibonacciSphere}
    must be type ``FibonacciSphere``

obj:AbstractMolecularContainer
    input molecule 

count:Integer
    number of replica

aligned:Bool
    if ``true``, then the principal axis of each object will
    be aligned to the radial direction.

solution:AbstractArray
    the coordinates for the new molecular system 

msg="":AbstractString
    (optional) test message
"""
function test_build(::Type{FibonacciSphere}, obj::AbstractMolecularContainer,
    count::Integer, aligned::Bool, solution::AbstractArray, msg::AbstractString="")
    println("----------------------------------")
    print_with_color(:blue, "Test build(FibonacciSphere,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end
    answer = build(FibonacciSphere, obj, count, aligned=aligned)
    for i = 1:length(solution)
        @test_approx_eq obtain(answer[i],:coordinate) solution[i]
    end
    print_with_color(:green"VERIFIED!\n")
    println("----------------------------------")

end
