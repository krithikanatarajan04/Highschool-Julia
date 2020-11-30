### A Pluto.jl notebook ###
# v0.12.11

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ e429e976-30d8-11eb-27dd-590119e09f74
using DifferentialEquations, PlutoUI

# ╔═╡ 167e7be6-30dc-11eb-15de-ad9ff925a787
using Plots; gr()

# ╔═╡ cdab643c-30da-11eb-29f6-53bdde7b82f5


# ╔═╡ d560f3f6-30da-11eb-31dc-f510ae97bada


# ╔═╡ c93b2276-30db-11eb-1669-27ae204265d1
f = function (du,u,p,t) # Define f as an in-place update into du
    a,b,c,d = p
 du[1] = a*u[1] - b*u[1]*u[2]
    du[2] = -c*u[2]+ d*u[1]*u[2]
end 


# ╔═╡ 210ce916-30dd-11eb-0321-4fb5cae1d9f3
md"""
Enter the exponential growth of the prey:
$(@bind a Slider(0.00 : 0.1 : 10; default=3.0, show_value=true))


Enter the rate at which predator prey interactions will result in predator eating the prey:
$(@bind b Slider(0.00 : 0.1 : 10; default=2.0, show_value=true))

Enter the rate at which the predators growth is limited by eating only prey:
$(@bind c Slider(0.00 : 0.1 : 10; default=1.0, show_value=true))

Enter the exponential decline of the predator:
$(@bind d Slider(0.00 : 0.1 : 10; default=4.0, show_value=true))
"""

# ╔═╡ 3fa4a936-30dd-11eb-3ef1-8bb442940777
begin
p = (a,b,c,d)
end

# ╔═╡ 5a535432-30fe-11eb-3442-817440f3830e
md"Enter a value for x
$(@bind x Slider(0.00 : 0.1 : 10; default=1.0, show_value=true))

Enter a value for y
$(@bind y Slider(0.00 : 0.1 : 10; default=1.0, show_value=true))"

# ╔═╡ f6f9f872-30db-11eb-25d3-f18fdd57d80c
u0 = [1.0;1.0]; tspan = (0.0,10.0)

# ╔═╡ 986c0e84-31bd-11eb-27af-d1702ee5442e
prob = ODEProblem(f,u0,tspan,p);

# ╔═╡ a063e0d0-31bd-11eb-056b-cb400ad0e45b
sol = solve(prob);

# ╔═╡ 1ce67d12-30dc-11eb-3f11-4b72daa20236
plot(sol,title="Population of predator/prey over time")

# ╔═╡ d3028ce4-31bd-11eb-1710-d5a7ecba6bfe
md" ## Scenerio One
**How does changing the growth rate of the prey affect the population of the predators and prey over time?**

As the growth rate of the prey increases, the amount of population fluctuations increase. Looking at the graph, there are more relative maximums and minimums as the value of a increases, which means there are more rapid changes in populations.

## Scenerio Two
**How does changing the rate at which the predator eats the prey affect the overall population of the predators and preys over time?**

As the predation rate increases, the rate at which the prey populates decreases.

## Scenerio Three
**How does changing the limit on the predator affect the overall population of the predators and preys over time?**

As the limit on the predator increases, the frequency of population change increases. The graph squeezes and the number of periods(in the graph) increases. The maximum point in the population also increases. 

## Scenerio Four
**How does changing the rate of predator decline affect the overall population of predator and prey over time?**

The course of the predator population stays the same over time, but the rate of population growth and decline for the prey as the maximums for the prey shrinks as the rate of predator decline increases.


"

# ╔═╡ 49c55e48-30dc-11eb-02be-398a6bd228eb
plot(sol,title="Phase Diagram",vars=(1,2))

# ╔═╡ a5c27f1a-31bc-11eb-2a2d-5fd911b57f2a
md" ## Acknowledgements
1. http://ucidatascienceinitiative.github.io/IntroToJulia/Html/DiffEq#Example:-Lotka-Volterra-ODE
2. https://en.wikipedia.org/wiki/Lotka–Volterra_equations
3. https://observablehq.com/@mbostock/predator-and-prey
4. https://www.pnas.org/content/6/7/410.full


"

# ╔═╡ Cell order:
# ╟─cdab643c-30da-11eb-29f6-53bdde7b82f5
# ╟─d560f3f6-30da-11eb-31dc-f510ae97bada
# ╠═e429e976-30d8-11eb-27dd-590119e09f74
# ╠═c93b2276-30db-11eb-1669-27ae204265d1
# ╠═3fa4a936-30dd-11eb-3ef1-8bb442940777
# ╟─210ce916-30dd-11eb-0321-4fb5cae1d9f3
# ╠═1ce67d12-30dc-11eb-3f11-4b72daa20236
# ╠═5a535432-30fe-11eb-3442-817440f3830e
# ╠═f6f9f872-30db-11eb-25d3-f18fdd57d80c
# ╠═986c0e84-31bd-11eb-27af-d1702ee5442e
# ╠═a063e0d0-31bd-11eb-056b-cb400ad0e45b
# ╟─167e7be6-30dc-11eb-15de-ad9ff925a787
# ╠═d3028ce4-31bd-11eb-1710-d5a7ecba6bfe
# ╠═49c55e48-30dc-11eb-02be-398a6bd228eb
# ╠═a5c27f1a-31bc-11eb-2a2d-5fd911b57f2a
