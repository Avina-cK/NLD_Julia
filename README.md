# NLD_Julia
This folder contains code for a few nonlinear dynamical systems analysed using Julia-1.1.1; some of which was for an Undergraduate year long project. The thesis itself shall be uploaded after July 24th.
Note: This is not a complete repository for all the code used for the project. 

## Chua Circuit
The Chua circuit is a well studied system to observe chaotic orbits. The code includes a LTSpice simulation and a .jl code that plots the bifurcation diagram for different values of R. The bifurcation diargam of the chua circuit allows one to search for periodic orbits (in windows in the chaos). 
Note: The code itself can be modified to produce the bifurcation diagram for other ode systems and other parameters.

## Elastic Pendulum
After obtaining the equations of motion of an elastic pendulum, the code simulates the same.

## Julia Sets
The code generates images of Julia sets for a given value of c. For colour images of the same, un-comment the last four lines. Note: The code that generates the Mandelbrot Set has explanatory comments.

## Mandelbrot Set
The code generates a colour image of the Mandelbrot set. One can change a0, b0 and e to pan and zoom into the set. Some examples of the outputs are also given.

## Mutlibrot Sets
The code generates a series of images that are multibrot sets for various values of 'd'.
