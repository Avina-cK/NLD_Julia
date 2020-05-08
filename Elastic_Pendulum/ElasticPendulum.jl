
using DifferentialEquations, Plots

#Parameters
l₀  = 5;  
k   = 1.50;   
m   = 0.50;  
g   = 9.81;  
ωₛₛ = (k/m);	
b = 0.6

#ODE System
function ElPend(du, u, p, t)

    du[1] = u[4]
    du[2] = u[5]
    du[3] = u[6]

    du[4] = ((ωₛₛ)*u[1]) * ((l₀/(((u[1]^2)+(u[2]^2)+(u[3]^2))^(1/2))) -1)
    du[5] = ((ωₛₛ)*u[2]) * ((l₀/(((u[1]^2)+(u[2]^2)+(u[3]^2))^(1/2))) -1) - g
    du[6] = ((ωₛₛ)*u[3]) * ((l₀/(((u[1]^2)+(u[2]^2)+(u[3]^2))^(1/2))) -1)

end

#Initial condition
u₀ = [1.0, -1.0, -0.01, 0, 0, 0]

#Time period to simulate
tspan = (0.0, 200.0)

#Parameter vector
p= [ωₛₛ, g, l₀, k]

#Defining ODE problem
prob= ODEProblem(ElPend, u₀, tspan, p)

#Solving ODE system, the function solve() automatically selects an ODE solver to use.
sol = solve(prob)

plot(sol, 
	vars=(1,2), 
	title="k=1.5", 
	color=:darkorange, 
	alpha=0.75, 
	legend=false, 
	arrow=true)
