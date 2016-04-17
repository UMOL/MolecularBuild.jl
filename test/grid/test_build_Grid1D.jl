"""
A test for grid_1D().

Arguments
-----------
:Type{Grid1D}
    must be type ``Grid1D``

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
function test_build(::Type{Grid1D},
    obj::AbstractMolecularContainer,
    direction::Array,
    spacing::AbstractFloat,
    count::Integer,
    solution::Array,
    msg::AbstractString="")
    print_dashed_line(80)
    print_with_color(:blue,"Test build(Grid1D,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end

    @time answer = build(Grid1D, obj, direction, spacing, count)

    for i = 1:length(solution)
        for j = 1:length(solution[i])
            @test_approx_eq obtain(answer[i], :coordinate)[j] solution[i][j]
        end
    end

    print_with_color(:green, "VERIFIED! build(Grid1D,...)\n\n")
    print_dashed_line(80)
    return true
end
include("unit_test_1_build_Grid1D.jl")
