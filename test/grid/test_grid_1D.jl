"""
A test for grid_1D().

Arguments
-----------
obj:AbstractMolecularContainer
    target object

direction:Array{AbstractFloat,1}
    direction of the grid

spacing:AbstractFloat  
    spacing between two neighboring grid points

count:Integer
    number of grid points

solution:Array
    answer key

msg="":AbstractString
    optional test message
"""
function test_grid_1D(
    obj::AbstractMolecularContainer,
    direction::Array,
    spacing::AbstractFloat,
    count::Integer,
    solution::Array,
    msg::AbstractString="")
    println("------------------------------")
    print_with_color(:blue,"Test build(Grid1D,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end

    answer = build(Grid1D, obj, direction, spacing, count)

    for i = 1:length(solution)
        @test obtain(answer[i], :coordinate) == solution[i]
    end

    print_with_color(:green, "VERIFIED! build(Grid1D,...)\n\n")
    println("------------------------------")
    return true
end
include("unit_test_1_grid_1D.jl")
