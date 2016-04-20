"""
A test for lower_neighbors().

Arguments
----------
:Type{Grid}
    must be type ``Grid``

input:Tuple
    a tuple of indices

matrix_shape:Tuple
    number of matrix elements along each dimension

solution:AbstractArray
    answer key

msg="":AbstractString
    (optional) test message
"""
function test_lower_neighbors(::Type{Grid},
    input::Tuple, matrix_shape::Tuple, solution::AbstractArray, 
    msg=""::AbstractString)
    print_dashed_line(80)
    print_with_color(:blue, "Test lower_neighbors()\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end
    answer = lower_neighbors(Grid, input, matrix_shape)
    @test answer == solution
    print_with_color(:green, "VERIFIED!\n")
    print_dashed_line(80)
    return true 
end

include("unit_test_1_lower_neighbors.jl")
