using OffsetArrays, LinearAlgebra, Images, ImageView
#using Plots

f(x, c)=x^2 +c
N=2000
D= 2*N +1
K = zeros(D,D)
K = OffsetArray(K, -N:N, -N:N)
n_iter =200
c = -1.75 - 0.11*im



for i in -N:N
    for j in -N:N
        n=0
        z = i/(N/2) + (j/(N/2))*im
        Z_val = Complex[]
	R = 0.5* (1+sqrt(1+4*abs(c)))
        while n<n_iter
            f1 = f(z, c)
            z = f1
            Z_val = append!(Z_val, z)
            if abs(f1) > 2.0
                break
            end
            n = n+1
        end
        if abs(Z_val[length(Z_val)]) < R
            K[i, j] = length(Z_val)/n_iter
        end
    end
	print("|")
end

imshow(transpose(K))
img = transpose(K)

#title = "c=" * string(c)
#contour(-2:(2/N):2, -2:(2/N):2, transpose(M), fill = (true, cgrad(:viridis_r)), xlabel="Re", ylabel="Im", aspectratio=1, legend=false, title=title, xlim=(-2,2), ylim=(-2,2))
#filename= "JuliaSet__" * string(Int(floor(real(c)))) * "_" * string(Int(abs(real(c)*1000))) * "_" * "i-" * string(Int(floor(imag(c)))) * "_" *string(Int(imag(c)*1000)) * ".png"
save(filename, img)
