test_align(Array[[1., 0., 0.]], [0., 1., 0.], [0.,0.,0.], false, Array[[0., 1., 0.]], "test 1")
test_align(Array[[0., 0., 1.]], [0., 1., 0.], [0.,0.,0.],false, Array[[0., -1., 0.]], "test 2")
test_align(Array[[0., 0., 1.]], [0., 1., 0.], [0.,0.,0.], true, Array[[0., 1., 0.]], "test 3")
test_align(Array[[0., 1., 0.]], [1., 0., 0.], [0.,0.,0.], true, Array[[1., 0., 0.]], "test 4")

