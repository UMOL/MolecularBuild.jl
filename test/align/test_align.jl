using MolecularGeometry 
"""
A test for align() for array of coordinates.

Arguments
-----------
coordinates:AbstractArray 
    array of coordinates 

new_orientation:AbstractArray
    reference vector for alignment 

center:AbstractArray 
    center of alignment rotation

inverted:Bool
    invert the final result?

solution:AbstractArray 
    answer key

msg="":AbstractString
    optional test message
"""
function test_align(coordinates::AbstractArray, 
    new_orientation::AbstractArray, center::AbstractArray, 
    inverted::Bool, solution::AbstractArray, msg::AbstractString="")
    print_dashed_line(80)
    print_with_color(:blue, "Test align()\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n")
    end

    @time answer = align(coordinates, new_orientation; center=center, inverted=inverted)
    
    for i = 1:length(solution)
        @test_approx_eq_eps answer[i] solution[i] 1e-14
    end
    print_with_color(:green, "VERIFIED!\n")
    print_dashed_line(80)
    return true 
end
include("unit_test_1_align.jl")
include("unit_test_2_align.jl")
include("unit_test_3_align.jl")
include("unit_test_4_align.jl")