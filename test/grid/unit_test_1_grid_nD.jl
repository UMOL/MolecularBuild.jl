test_grid_nD(
    make_molecular_system(coordinate=Array[[0., 0., 0.]]),
    Array[[1.,0.,0.], [0., 1., 0.], [0., 0., 1.]],
    (1., 1., 1.),
    (2,2,2),
    Array[
        Array[[0., 0., 0.]],
        Array[[1., 0., 0.]], 
        Array[[0., 1., 0.]], 
        Array[[1., 1., 0.]], 
        Array[[0., 0., 1.]], 
        Array[[1., 0., 1.]], 
        Array[[0., 1., 1.]], 
        Array[[1., 1., 1.]], 
    ],
    "test 1",
)