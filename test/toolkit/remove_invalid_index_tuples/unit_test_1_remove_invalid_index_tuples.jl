test_remove_invalid_index_tuples([(0,1,1)], 2, [], "test 1.1")
test_remove_invalid_index_tuples([(1,1,1), (1,0,2)], 10, [(1,1,1)], "test 1.2")
test_remove_invalid_index_tuples([(1,1,11), (1,1,0)], 10, [], "test 1.3")