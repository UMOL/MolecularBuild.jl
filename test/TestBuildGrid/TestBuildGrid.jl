module TestBuildGrid
include("Test1.jl")
include("Test2.jl")

import .Test1
import .Test2

function test()
    Test1.test()
    Test2.test()
end

end