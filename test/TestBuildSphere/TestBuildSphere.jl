module TestBuildSphere
include("Test1.jl")
include("Test2.jl")
include("Test3.jl")
include("Test4.jl")
include("Test5.jl")

function test()
    Test1.test()
    Test2.test()
    Test3.test()
    Test4.test()
    Test5.test()
end

end