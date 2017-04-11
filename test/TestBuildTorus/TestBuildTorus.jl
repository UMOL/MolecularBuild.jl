module TestBuildTorus
include("Test1.jl")
include("Test2.jl")

function test()
    Test1.test()
    Test2.test()
end

end