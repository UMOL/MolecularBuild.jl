test_align(Array[[1., 0., 0.]], [0., 1., 0.], [0.,0.,0.], false, Array[[0., 1., 0.]], "test 1.1")
test_align(Array[[0., 0., 1.]], [0., 1., 0.], [0.,0.,0.], false, Array[[0., 1., 0.]], "test 1.2")
test_align(Array[[0., 0., 1.]], [0., 1., 0.], [0.,0.,0.], true,  Array[[0., -1., 0.]], "test 1.3")
test_align(Array[[0., 1., 0.]], [1., 0., 0.], [0.,0.,0.], false, Array[[1., 0., 0.]], "test 1.4")

