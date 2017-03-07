"""
A test for build(FibonacciCylinder,...).

Arguments
-----------
:Type{FibonacciCylinder}
    must be type ``FibonacciCylinder``

objs:Array{AbstractMolecularContainer,1}
    input molecule 

count:Integer
    number of replica

radius:AbstractFloat
    radius of the cylinder

zmin:Real 
    lower bound along Z 

zmax:Real 
    upper bound along Z

solution:AbstractArray
    the coordinates for the new molecular system 

msg="":AbstractString
    (optional) test message

center=[0.,0.,0.]:AbstractArray 
    (keyword) center of the cylinder

aligned:Bool
    (keyword) if ``true``, then the principal axis of each object will
    be aligned to the radial direction.
"""
function test_build{T<:AbstractMolecularContainer}(::Type{FibonacciCylinder},
    objs::Array{T,1},
    count::Integer, radius::AbstractFloat, 
    zmin::Real, zmax::Real,
    solution::AbstractArray, msg::AbstractString=""; 
    center::AbstractArray=[0.,0.,0.],
    aligned::Bool=false)
    print_dashed_line(80)
    print_with_color(:blue, "Test build(FibonacciCylinder,...)\n\n")
    
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end

    @time answer = build(FibonacciCylinder, objs, count, radius, zmin, zmax; center=center, aligned=aligned)
    
    for i = 1:length(solution)
        for j = 1:length(solution[i])
            @test_approx_eq obtain(answer[i],:coordinate)[j] solution[i][j]
        end
    end
    print_with_color(:green, "VERIFIED!\n")
    print_dashed_line(80)
    return true
end

include("test_1.jl")
include("test_2.jl")
