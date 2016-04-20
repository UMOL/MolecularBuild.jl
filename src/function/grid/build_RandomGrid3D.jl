"""
Rotate the input vector to a random orientation.

Arguments
----------
:Type{RandomGrid3D}
    must be type ``RandomGrid3D``

obj:AbstractMolecularContainer
    input molecule 

directions:Array{Array,1}
    direction of the grid for each dimension

spacings:Tuple  
    spacing between two neighboring grid points for each dimension

counts:Tuple
    number of grid points for each dimension

tol_near_zero:AbstractFloat
    (optional) tolerance for being close to zero

max_iteration=10000:Integer
    (optional) maximum number of iteration for choosing proper random orientation

seed=0:Integer
    (keyword) seed for the random number generator.
    If non-zero, this seed will be used for the random number
    generator.

""" 
function build(::Type{RandomGrid3D}, 
    obj::AbstractMolecularContainer,
    directions::AbstractArray,
    spacings::Tuple, 
    counts::Tuple,
    tol_near_zero::AbstractFloat=1e-7; 
    seed::Integer=0,
    max_iteration::Integer=10000)

    fn_array = MolecularMove.grid(directions, spacings, counts)

    coordinate_template = obtain(one_clone(obj), :coordinate)

    raw_coordinate_array = [fn_move(coordinate_template) for fn_move in fn_array]

    function fn_orient(coordinate_array::AbstractArray, id::Integer, max_iteration::Integer)
        center = gage(GeometricCenter, coordinate)
        for i = 1:max_iteration
            if seed == 0
                new_coordinate = rotate(RandomEuclidean3D, coordinate_array[i], tol_near_zero, max_iteration; center=center)
            else
                new_coordinate = rotate(RandomEuclidean3D, coordinate_array[i], tol_near_zero, max_iteration; center=center, seed=seed)
            end
        end
    end



    
    return [one_clone(obj, Dict([(:coordinate, transform(coordinate_template))])) for transform in fn_array]
end