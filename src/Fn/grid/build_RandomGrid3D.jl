"""
Rotate the input vector to a random orientation.

Arguments
----------
:Type{RandomGrid3D}
    must be type ``RandomGrid3D``

obj:AbstractMolecularContainer
    input molecule 

directions:AbstractArray{Array,1}
    direction of the grid for each dimension

spacings:Tuple  
    spacing between two neighboring grid points for each dimension

counts:Tuple
    number of grid points for each dimension

tol_near_zero:AbstractFloat
    (optional) tolerance for being close to zero

seed=0:Integer
    (keyword) seed for the random number generator.
    If non-zero, this seed will be used for the random number
    generator.

max_iteration=1000:Integer
    (keyword) maximum number of iteration for choosing proper random orientation

clash_cutoff=1e-3:AbstractFloat
    (keyword) cutoff distance for clashes between neighboring molecules
""" 
function build(::Type{RandomGrid3D}, 
    obj::AbstractMolecularContainer,
    directions::AbstractArray,
    spacings::Tuple, 
    counts::Tuple,
    tol_near_zero::AbstractFloat=1e-7; 
    seed::Integer=0,
    max_iteration::Integer=1000,
    clash_cutoff::AbstractFloat=1e-3)

    fn_array = MolecularMove.grid(directions, spacings, counts)

    coordinate_template = obtain(one_clone(obj), :coordinate)

    coordinate_array = [fn_move(coordinate_template) for fn_move in fn_array]

    # only use the seed once
    if seed != 0
        rotate(RandomEuclidean3D, seed)
    end
    function fn_orient(id::Integer)
        neighbor_ids = map((sub_id)->sub2ind(counts, sub_id...), lower_neighbors(Grid, ind2sub(counts, id), counts))
        center = gage(GeometricCenter, coordinate_array[id])
        for i = 1:max_iteration
            new_coordinate = rotate(RandomEuclidean3D, coordinate_array[id], tol_near_zero, max_iteration; center=center)
            if !has_clash(new_coordinate, coordinate_array[neighbor_ids], clash_cutoff)
                return new_coordinate
            end
        end
        @debug println(max_iteration , " max_iteration reached!")
        return coordinate_array[id]
    end
    
    return [one_clone(obj, Dict([(:coordinate, fn_orient(i))])) for i = 1:length(coordinate_array)]
end