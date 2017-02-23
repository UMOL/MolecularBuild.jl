test_build(FibonacciCylinder, 
    make_molecular_system(coordinate=Array[[0., 0., 0.],[0., 0., 1.]]),
    5,
    10.,
    -5,
    5,
    Array[
        Array[[ 0.87425724717 -9.96171040865  5.0]],
        Array[[ 6.08438860979  7.93600751292  3.0]],
        Array[[-9.84713485315 -1.74181950379  1.0]],
        Array[[ 8.43755294812 -5.36728052626 -1.0]],
        Array[[-2.59604304901  9.65715074376 -3.0]]],
    "test 1: 1 atom per molecule";
    center=[0.,0.,0.],
    aligned=false
    )