test_has_clash([1., 0., 0.], 
    Array[[1., 0., 0.]], true,
    "test 1.1";
    tolerance=1e-6)

test_has_clash([1., 0., 0.], 
    Array[[2., 0., 0.], [1.2, 0., 0.]], true,
    "test 1.2";
    tolerance=0.5)

test_has_clash([1., 0., 0.], 
    Array[[2., 0., 0.], [1.2, 0., 0.]], false,
    "test 1.3";
    tolerance=0.1)