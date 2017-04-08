"""
A test for build(RandomGrid3D,...).

Arguments
-----------
:Type{RandomGrid3D}
    must be type ``RandomGrid3D``

obj:AbstractMolecularContainer
    input molecule 

directions:AbstractArray
    direction of the grid for each dimension

spacings:Tuple  
    spacing between two neighboring grid points for each dimension

counts:Tuple
    number of grid points for each dimension

solution:AbstractArray
    answer key

msg="":AbstractString
    (optional) test message

tol_near_zero=1e-3:AbstractFloat
    (optional) clash_cutoff for being close to zero

max_iteration=1000:Integer
    (keyword) maximum number of iteration for choosing proper random orientation

seed=0:Integer
    (keyword) seed for the random number generator.
    If non-zero, this seed will be used for the random number
    generator.

clash_cutoff=1e-3:AbstractFloat
    (keyword) cutoff distance for clashes between neighboring molecules
"""
function test_build(::Type{RandomGrid3D},
    obj::AbstractMolecularContainer,
    directions::AbstractArray,
    spacings::Tuple,
    counts::Tuple,
    solution::AbstractArray,
    msg::AbstractString="",
    tol_near_zero::AbstractFloat=1e-3;
    max_iteration::Integer=1000,
    seed::Integer=0,
    clash_cutoff::AbstractFloat=1e-3)

    print_dashed_line(80)
    print_with_color(:blue,"Test build(RandomGrid3D,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end

    @time answer = build(RandomGrid3D, obj, directions, spacings, counts, tol_near_zero; max_iteration=max_iteration, seed=seed, clash_cutoff=clash_cutoff)

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
