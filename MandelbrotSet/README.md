# The Mandelbrot Set
The Mandelbrot set is a set of complex numbers that is generated by a simple iterative map: z² → z² + c, where z and c are complex numbers. It can be throught of as a representation of a property of the parameter space (i.e, c ∈ ℂ).

## Plotting the set with Julia
<a href=https://github.com/Avina-cK/NLD_Julia/blob/master/MandelbrotSet/PlottingTheMandelbrotSet.jl> PlottingTheMandelbrotSet.jl </a> contains a few simple lines of code that generates the entire Mandelbrot Set, that is contained in a disk of radius 2, centred at 0+0i, in the complex plane. The following image will be rendered:
<img src=https://raw.githubusercontent.com/Avina-cK/NLD_Julia/master/MandelbrotSet/MandlebrotSet_viridis.JPG>


### Zooming into the Mandelbrot Set
To zoom into set, using the <a href=https://github.com/Avina-cK/NLD_Julia/blob/master/MandelbrotSet/PlottingTheMandelbrotSet.jl> PlottingTheMandelbrotSet.jl </a> is simple. One need only change the value of c, in the following lines:

```julia
a₀ 	=	0.0               # to change real part of centre
b₀ 	=	0.0               # to change imaginary part of centre
centre 	=	a₀+im*b₀      # centre of frame
e 	=	2.0               # radius around centre
```
Change a₀, b₀ and e to choose the required frame of the Mandelbrot set you would like to render. 
An example would be the following image, centred around 0.25-0.5im; from the zoom sequence in <a href=https://github.com/Avina-cK/NLD_Julia/tree/master/MandelbrotSet/Zoom4_around_0_25__0_5> this file </a>. The following image is a black and white one that was generated using the last commented line in the .jl script.
<img src=https://raw.githubusercontent.com/Avina-cK/NLD_Julia/master/MandelbrotSet/Zoom4_around_0_25__0_5/Zoom2.JPG >
One has to be careful to change the maximum number of iterations `n_iter` to maintain the accuracy of the set in the frame. 
