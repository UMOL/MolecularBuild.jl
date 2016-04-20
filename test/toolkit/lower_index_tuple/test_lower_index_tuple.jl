"""
A test for lower_index_tuple().

index_tuple:Tuple 
    input index tuple 

id:Integer
    which index 

solution:Tuple
    answer key

msg="":AbstractString
    (optional) test message
"""
function lower_index_tuple(index_tuple::Tuple, id::Integer,solution::Tuple, msg::AbstractString="")
    print_dashed_line(80)
    print_with_color(:blue, "Test lower_index_tuple()\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end
    answer = lower_index_tuple(index_tuple, id)
    @test answer == solution
    print_with_color(:green, "VERIFIED!\n")
    print_dashed_line(80)
    return true
end