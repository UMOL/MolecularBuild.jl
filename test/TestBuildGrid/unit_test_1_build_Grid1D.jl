test_build(Grid1D,
    make_molecular_system(coordinate=Array[[32.551,   1.074,  73.319]]),
    [1.,1.,1.],
    sqrt(3.),
    3,
    Array[
        Array[[32.551,   1.074,  73.319]],
        Array[[33.551,   2.074,  74.319]],
        Array[[34.551,   3.074,  75.319]],
    ],
    "test 1",
)