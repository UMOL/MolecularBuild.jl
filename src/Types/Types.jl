module Types
include(joinpath("GridType","GridType.jl"))
include(joinpath("ShapeType","ShapeType.jl"))

using Reexport
@reexport using .GridType
@reexport using .ShapeType

export Grid
export FibonacciCylinder
export FibonacciSphere
export PartialFibonacciSphere
end