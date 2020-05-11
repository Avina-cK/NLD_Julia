
#Defining the position of Neighbours' position
function Neigh(M, i, j)
    nrow = size(M)[1]
    ncol = size(M)[2]
    if i==1
        if j==1
            return [[i,j], [i,j+1],
                    [i+1,j], [i+1,j+1]]
        elseif j==ncol
            return [[i,j-1],   [i,j],
                    [i+1,j-1], [i+1,j]]
        else
            return [[i,j-1],   M[i,j],     M[i,j+1],
                    [i+1,j-1], M[i+1,j],   M[i+1,j+1]]
        end
    end
    if i==nrow
        if j==1
            return [[i-1,j], [i-1,j+1],
                    [i,j],   [i,j+1]]
        elseif j==ncol
            return [[i-1,j-1], [i-1,j],
                    [i,j-1],   [i,j]]
        else
            return [[i-1,j-1], [i-1,j],   [i-1,j+1],
                    [i,j],     [i,j-1],   [i,j+1]]
        end
    end
    if j==1 && i≠1 && i≠nrow
        return [[i-1, j],   [i-1, j+1],
                [i,j],      [i, j+1],
                [i+1, j],   [i+1, j+1]]
    end
    if j==ncol && i≠1 && i≠nrow
        return [[i-1, j], [i-1, j-1],
                [i, j-1], [i,j],
                [i+1, j], [i+1, j-1]]
    end
    if i≠1 && i≠nrow && j≠1 && j≠ncol
        return [[i-1, j-1], [i-1, j], [i-1, j+1],
                [i, j-1],   [i,j],    [i, j+1],
                [i+1, j-1], [i+1, j], [i+1, j+1]]
    end
end


# Defining State of Neighbours' vector
"""
    StateOfNeigh(M, i, j)

Creates a vector that contains the values of the neighbours of M[i,j]
The neighbourhood considered is the Moore neighbourhood of radius 1.

# Examples
```julia-repl
julia> M = [1 2 3; 4 5 6; 7 8 9]
julia> StateOfNeigh(M, 2, 1)
6-element Array{Any,1}:
 1
 2
 4
 5
 7
 8
 julia> StateOfNeigh(M, 1, 1)
4-element Array{Any,1}:
 1
 2
 4
 5
```
"""
function StateOfNeigh(M, i, j)
    neigh = Neigh(M, i, j)
    l = length(neigh)
    i=1
    Sn = [ ]
    while i<=l
        Sn = append!(Sn, M[neigh[i][1], neigh[i][2]])
        i = i+1
    end
    return Sn
end
