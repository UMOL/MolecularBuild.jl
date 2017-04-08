test_build(RandomGrid3D,
    make_molecular_system(coordinate=Array[[-1., 0., 0.], [1., 0., 0.]]),
    Array[[1.,0.,0.], [0., 1., 0.], [0., 0., 1.]],
    (1., 1., 1.),
    (2,2,2),
    Array[
        Array[AbstractFloat[-0.5535252075389989,-0.5335543689723603,-0.6394760198548614],AbstractFloat[0.5535252075389989,0.5335543689723603,0.6394760198548614]],
        Array[AbstractFloat[1.4756418915362794,-0.7756451689302043,0.4148968099793309],AbstractFloat[0.5243581084637204,0.7756451689302043,-0.4148968099793309]],
        Array[AbstractFloat[-0.883375188877767,1.4025498161901395,-0.2400040023842402],AbstractFloat[0.883375188877767,0.5974501838098605,0.2400040023842402]],
        Array[AbstractFloat[1.8494533497234493,1.293085642459363,-0.4387821929246831],AbstractFloat[0.1505466502765508,0.706914357540637,0.4387821929246831]],
        Array[AbstractFloat[-0.39748013585822883,-0.6133905597333554,1.6824672613599314],AbstractFloat[0.39748013585822883,0.6133905597333554,0.3175327386400686]],
        Array[AbstractFloat[0.052085283381605785,-0.04226415785689266,0.6842921746631594],AbstractFloat[1.9479147166183943,0.04226415785689266,1.3157078253368406]],
        Array[AbstractFloat[0.18518425009838807,0.39346262581321867,1.7731876921098149],AbstractFloat[-0.18518425009838807,1.6065373741867814,0.22681230789018503]],
        Array[AbstractFloat[0.00046446113566955827,1.021704479701375,0.9786078961276519],AbstractFloat[1.9995355388643303,0.978295520298625,1.0213921038723481]],
    ],
    "test 1.1";
    seed=12345
)

test_build(RandomGrid3D,
    make_molecular_system(coordinate=Array[[-1., 0., 0.], [1., 0., 0.]]),
    Array[[1.,0.,0.], [0., 1., 0.], [0., 0., 1.]],
    (1., 1., 1.),
    (2,2,2),
    Array[
        Array[AbstractFloat[-0.5535252075389989,-0.5335543689723603,-0.6394760198548614],AbstractFloat[0.5535252075389989,0.5335543689723603,0.6394760198548614]],
        Array[AbstractFloat[1.4756418915362794,-0.7756451689302043,0.4148968099793309],AbstractFloat[0.5243581084637204,0.7756451689302043,-0.4148968099793309]],
        Array[AbstractFloat[-0.883375188877767,1.4025498161901395,-0.2400040023842402],AbstractFloat[0.883375188877767,0.5974501838098605,0.2400040023842402]],
        Array[AbstractFloat[1.8494533497234493,1.293085642459363,-0.4387821929246831],AbstractFloat[0.1505466502765508,0.706914357540637,0.4387821929246831]],
        Array[AbstractFloat[-0.39748013585822883,-0.6133905597333554,1.6824672613599314],AbstractFloat[0.39748013585822883,0.6133905597333554,0.3175327386400686]],
        Array[AbstractFloat[0.052085283381605785,-0.04226415785689266,0.6842921746631594],AbstractFloat[1.9479147166183943,0.04226415785689266,1.3157078253368406]],
        Array[AbstractFloat[0.18518425009838807,0.39346262581321867,1.7731876921098149],AbstractFloat[-0.18518425009838807,1.6065373741867814,0.22681230789018503]],
        Array[AbstractFloat[0.00046446113566955827,1.021704479701375,0.9786078961276519],AbstractFloat[1.9995355388643303,0.978295520298625,1.0213921038723481]],
    ],
    "test 1.2: same test but test for speed without the compilation time";
    seed=12345
)