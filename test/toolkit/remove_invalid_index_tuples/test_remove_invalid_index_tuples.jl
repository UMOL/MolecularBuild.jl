"""
A test for remove_invalid_index_tuples().

Arguments
----------
input:AbstractArray{Tuple,1}
    input list of tuples 

max_index:Integer
    maximum index 

solution:AbstractArray{Tuple,1}
    answer key

msg="":AbstractString
    (optional) test message
"""
function test_remove_invalid_index_tuples(input::AbstractArray,
    max_index::Integer,
    solution::AbstractArray, msg::AbstractString="")
    print_dashed_line(80)
    print_with_color(:blue, "Test remove_invalid_index_tuples()\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end
    answer = remove_invalid_index_tuples(input, max_index)
    @test answer == solution
    print_with_color(:green, "VERIFIED!\n")
    print_dashed_line(80)
    return true
end
include("unit_test_1_remove_invalid_index_tuples.jl")