test_lower_neighbors(Grid, (1,1,1), 100, [], "test 1.1")
test_lower_neighbors(Grid, (2,2,2), 100, [(1,2,2),(2,1,2),(2,2,1)], "test 1.2")
test_lower_neighbors(Grid, (2,3,4), 100, [(1,3,4),(2,2,4),(2,3,3)], "test 1.3")