test_remove_invalid_index_tuples([(0,1,1)], (2,2,2), [], "test 1.1")
test_remove_invalid_index_tuples([(1,1,1), (1,0,2)], (9,9,9), [(1,1,1)], "test 1.2")
test_remove_invalid_index_tuples([(1,1,11), (1,1,0)], (9,9,9), [], "test 1.3")