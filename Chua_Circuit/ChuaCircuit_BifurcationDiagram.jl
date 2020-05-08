using DifferentialEquations, Plots

c1=1e-8
c2=1e-7
L=0.014
E=1.7
Ga=-0.00075
Gb=-0.00041
R=1840      #Initial R
i=0
α=1.51*c2/c1
plot(markershape=:circle, linealpha=0)
G=1/R
a=Ga*R
b=Gb*R
β=(R^2)*(c2)/L
m1=-3.9*(b+1)
m0=0.45*(a-1)

function Nr(x, m0, m1)
    return (m1*x)+(0.5*(m0-m1))*(abs(x+1)-abs(x-1))
end

function Chua(du,u,p,t)
    du[1]=p[1]*(u[2]-u[1]-Nr(u[1], m0, m1))
    du[2]=u[1]-u[2]+u[3]
    du[3]=-p[2]*u[2]
end

ν=3     #parameter to plot in bifurcation plot
Rₓ=1900 #Final R

while R<Rₓ
    G=1/R
    a=Ga*R
    b=Gb*R
    β=(R^2)*(c2)/L
    global m1=-3.9*(b+1)
    global m0=0.45*(a-1)
    p=[α,β]
    u0=[0.7,0.0,0.0]
    tspan=(0.0,1000.0)
    sol=solve(ODEProblem(Chua,u0,tspan,p))
    y=sol[ν,(length(sol)-250:length(sol))]
    x=[R]
    v=length(y)
    x=vcat(fill.(x,v))
    print(i)
    plot!(x,y,
        label=i,
        markershape=:circle,
        linealpha=0,
        markeralpha=0.1,
        markersize=0.1,
        markercolor=:black)
    global R=R+0.02
    global i+=1
end
plot!(legend=false, xlabel="R", ylabel="y")
