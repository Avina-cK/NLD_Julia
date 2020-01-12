using OffsetArrays, LinearAlgebra, Images, ImageView

f(x, c)=x^2 +c
N=1000
D= 2*N +1
M = zeros(D,D)			#creating a zero matrix of dimensions D × D
M = OffsetArray(M, -N:N, -N:N)	#changing the indices of the matrix to be -N to N rows × -N to N columns
n_iter =80			#no. of iterations that map is made to go through

a₀ 	=	0.0
b₀ 	=	0.0
centre 	=	a₀+im*b₀	#centre of frame
e 	=	2		#radius around centre

for i in -N:N
    for j in -N:N
        z=0
        n=0
        c = (i/(N/(e)) + a₀) + (j/(N/(e))-b₀)*im
        Z_val = Complex[]
        while n<n_iter
            f1 = f(z, c)
            z = f1
            Z_val = append!(Z_val, z)
            if abs(f1) > 2.0
                break
            end
            n = n+1
        end
        if abs(Z_val[length(Z_val)]) < 2
            M[i, j] = 1
        end
    end
	print("|")
end

imshow(Gray.(transpose(M)))
