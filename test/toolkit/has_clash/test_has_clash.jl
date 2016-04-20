"""
A test for has_clash().

Arguments
---------
target:AbstractArray
    target vector 

array_of_vectors:AbstractArray
    an array of vectors 

solution:Bool
    answer key 

msg="":AbstractString
    (optional) test message

tolerance=1e-5:AbstractFloat
    (keyword) tolerance for a distance to be considered as clashing
"""
function test_has_clash(target::AbstractArray, array_of_vectors::AbstractArray, 
    solution::Bool, msg::AbstractString=""; tolerance::AbstractFloat=1e-5)
    print_dashed_line(80)
    print_with_color(:blue, "Test has_clash()\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end
    answer = has_clash(target, array_of_vectors, tolerance)
    @test answer == solution
    print_with_color(:green, "VERIFIED!\n")
    print_dashed_line(80)
    return true
end
include("unit_test_1_has_clash.jl")