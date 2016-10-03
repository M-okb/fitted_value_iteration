function my_lin_interp(grid,vals)
    function func(x::Real)
        lower_index = searchsortedlast(grid,x)
        if lower_index == 0
            interpolated_value  = ((vals[2]　-　vals[1])　/　(grid[2]　-　grid[1]))　*　(x　-　grid[1])　+　vals[1]
        elseif lower_index == length(grid)
            interpolated_value = ((vals[end]　-　vals[end　-　1])　/　(grid[end]　-　grid[end　-　1]))　*　(x　-　grid[end　-　1])　+　vals[end　-　1]
        else
            interpolated_value =  (vals[lower_index+1] - vals[lower_index]) * (x - grid[lower_index]) /
            (grid[lower_index+1] - grid[lower_index])  + vals[lower_index]
        end
        return interpolated_value
    end
    function func{T<:Real}(x::AbstractVector{T})
        n = length(x)
        out = Array(Float64, n)
        for i in 1 : n
            out[i] = func(x[i])
        end
        return out
    end
    return func
end
