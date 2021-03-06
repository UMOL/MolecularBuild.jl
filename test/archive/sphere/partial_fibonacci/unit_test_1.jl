test_build(PartialFibonacciSphere, 
    [make_molecular_system(coordinate=Array[[0., 0., 0.],[0., 0., 1.]])],
    5,
    10.,
    -5,
    5,
    Array[
        Array[[ 0.757128985491524, -8.627094279033271,  5.]],
        Array[[ 5.804136811532121,  7.570468669310885,  3.]],
        Array[[-9.797775470383256, -1.733088523981437,  1.]],
        Array[[ 8.395259183305276, -5.340376695058919, -1.]],
        Array[[-2.476467233021272,  9.212334668463361, -3.]]],
    "test 1: 1 atom per molecule";
    center=[0.,0.,0.],
    aligned=false
    )