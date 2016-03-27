"""
A test for build(Grid,...).

Arguments
-----------
obj:AbstractMolecularContainer
    target object

directions:Array{AbstractFloat,1}
    direction of the grid for each dimension

spacings:Tuple  
    spacing between two neighboring grid points for each dimension

counts:Tuple
    number of grid points for each dimension

solution:Array
    answer key

msg="":AbstractString
    optional test message
"""
function test_grid_nD(
    obj::AbstractMolecularContainer,
    directions::Array,
    spacings::Tuple,
    counts::Tuple,
    solution::Array,
    msg::AbstractString="")
    println("------------------------------")
    print_with_color(:blue,"Test build(Grid,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end

    answer = build(Grid, obj, directions, spacings, counts)

    for i = 1:length(solution)
        @test obtain(answer[i], :coordinate) == solution[i]
    end

    print_with_color(:green, "VERIFIED! build(Grid,...)\n\n")
    println("------------------------------")
    return true
end
include("unit_test_1_grid_nD.jl")
