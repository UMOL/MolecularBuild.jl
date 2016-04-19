"""
A test for build(RandomGrid3D,...).

Arguments
-----------
:Type{RandomGrid3D}
    must be type ``RandomGrid3D``,

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
function test_build(::Type{RandomGrid3D},
    obj::AbstractMolecularContainer,
    directions::Array,
    spacings::Tuple,
    counts::Tuple,
    solution::Array,
    msg::AbstractString="")
    print_dashed_line(80)
    print_with_color(:blue,"Test build(RandomGrid3D,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end

    @time answer = build(RandomGrid3D, obj, directions, spacings, counts)

    for i = 1:length(solution)
        for j = 1:length(solution[i])
            @test_approx_eq obtain(answer[i], :coordinate)[j] solution[i][j]
        end
    end

    print_with_color(:green, "VERIFIED! build(RandomGrid3D,...)\n\n")
    print_dashed_line(80)
    return true
end
include("unit_test_1_build_RandomGrid3D.jl")
