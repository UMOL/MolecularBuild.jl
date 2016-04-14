"""
A test for align() for array of coordinates.

Arguments
-----------
coordinates:Array 
    array of coordinates 

align_ref:Array
    reference vector for alignment 

center:Array 
    center of alignment rotation

inverted:Bool
    invert the final result?

solution:Array 
    answer key

msg="":AbstractString
    optional test message
"""
function test_align(coordinates::Array, align_ref::Array, center::Array, inverted::Bool, solution::Array, msg::AbstractString="")
    println("-----------------------------------")
    print_with_color(:blue, "Test align()\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n")
    end

    answer = align(coordinates, align_ref; center=center, inverted=inverted)
    for i = 1:length(solution)
        @test_approx_eq_eps answer[i] solution[i] 1e-15
    end
    print_with_color(:green, "VERIFIED!\n")
    println("-----------------------------------")
    return true 
end
test_align(Array[[1., 0., 0.]], [0., 1., 0.], [0.,0.,0.], false, Array[[0., 1., 0.]], "test 1")
test_align(Array[[0., 0., 1.]], [0., 1., 0.], [0.,0.,0.],false, Array[[0., -1., 0.]], "test 2")
test_align(Array[[0., 0., 1.]], [0., 1., 0.], [0.,0.,0.], true, Array[[0., 1., 0.]], "test 3")
test_align(Array[[0., 1., 0.]], [1., 0., 0.], [0.,0.,0.], true, Array[[1., 0., 0.]], "test 4")
test_align(Array[
    [sqrt(2), 0., 0.],
    [1.,1.,0.],
    [0.,sqrt(2),0.]], 
    [0., 1., 0.], [0.,0.,0.], 
    false,
    Array[
    [1., 1., 0.],
    [0.,sqrt(2),0.],
    [-1.,1.,0.]], "test 5")
