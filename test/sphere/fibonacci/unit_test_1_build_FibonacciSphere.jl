test_build(FibonacciSphere, 
    [make_molecular_system(coordinate=Array[[0., 0., 0.],[0., 0., 1.]])],
    5,
    10.,
    Array[
        Array[[6.,                 0.,               8.]],
        Array[[-6.758097397797128,  6.190970809322855,  4.]],
        Array[[ 0.874257247169599, -9.961710408648278,  0.]],
        Array[[ 5.576434272376702,  7.27347102873604 , -4.]],
        Array[[-5.908280911892572, -1.04509170227587 , -8.]]],
    "test 1: 1 atom per molecule";
    center=[0.,0.,0.],
    aligned=false
    )