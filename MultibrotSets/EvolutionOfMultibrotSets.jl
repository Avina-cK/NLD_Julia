using OffsetArrays, LinearAlgebra, Plots
d = 2.0
k=0

for k in 0.0:0.05:5.0
	global d= 2.0 + k
	f(x, c)=x^(d) +c
	title= "d=" * string(d)

	N=800
	D= 2*N +1
	M = zeros(D,D)
	M = OffsetArray(M, -N:N, -N:N)
	n_iter =40

	a₀ 	=	0.0
	b₀ 	=	0.0
	e 	=	2.0
	centre = a₀+im*b₀	

	for i in -N:N
	    for j in -N:N
        	z=0
        	n=0
        	c = (i/(N/(e)) + a₀) + (j/(N/(e))+b₀)*im
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
        	    M[i, j] = length(Z_val)/(n_iter)
    	     end
		print("|")
	end
	
	Plots.heatmap(transpose(M), aspectratio=1,color=:sand_grad, grid=false, showaxis=false,title=title, size=(900,900), legend=false)
	
	filename="C://Users/UserName/Documents/Multibrot_"*"-" *string(d) *".png"
	savefig(filename)
	print(k)

end
