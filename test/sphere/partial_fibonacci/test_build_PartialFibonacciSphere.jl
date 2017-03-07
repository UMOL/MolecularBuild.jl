"""
A test for build(PartialFibonacciSphere,...).

Arguments
-----------
:Type{PartialFibonacciSphere}
    must be type ``PartialFibonacciSphere``

objs:Array{AbstractMolecularContainer,1}
    input molecule 

count:Integer
    number of replica

radius:AbstractFloat
    radius of the sphere

zmin:Real 
    lower bound along Z 

zmax:Real 
    upper bound along Z

solution:AbstractArray
    the coordinates for the new molecular system 

msg="":AbstractString
    (optional) test message

center=[0.,0.,0.]:AbstractArray 
    (keyword) center of the sphere

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.
"""
function test_build{T<:AbstractMolecularContainer}(::Type{PartialFibonacciSphere},
    objs::Array{T,1},
    count::Integer, radius::AbstractFloat, 
    zmin::Real, zmax::Real,
    solution::AbstractArray, msg::AbstractString=""; 
    center::AbstractArray=[0.,0.,0.],
    aligned::Bool=false)
    print_dashed_line(80)
    print_with_color(:blue, "Test build(PartialFibonacciSphere,...)\n\n")
    
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end

    @time answer = build(PartialFibonacciSphere, objs, count, radius, zmin, zmax; center=center, aligned=aligned)
    
    for i = 1:length(solution)
        for j = 1:length(solution[i])
            @test_approx_eq obtain(answer[i],:coordinate)[j] solution[i][j]
        end
    end
    print_with_color(:green, "VERIFIED!\n")
    print_dashed_line(80)
    return true
end

include("unit_test_1.jl")
include("unit_test_2.jl")
