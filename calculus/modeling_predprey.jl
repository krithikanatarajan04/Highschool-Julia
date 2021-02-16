### A Pluto.jl notebook ###
# v0.12.20

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

# ╔═╡ a3c276fe-30e3-11eb-3e4c-fb31d63eabf6
using ModelingToolkit, OrdinaryDiffEq, Plots, PlutoUI

# ╔═╡ dc926c2c-30e4-11eb-0b88-05fc45844731
import Pkg; Pkg.add("OrdinaryDiffEq")

# ╔═╡ e0f36006-3ba1-11eb-3a47-193462d57302
md"Enter a value for α - natural exponential growth of the prey
$(@bind α Slider(1.0 : 1 : 10; default=1.0, show_value=true))

Enter a value for β - rate of decrease in prey from predators
$(@bind β Slider(1.0 : 1 : 10; default=2.0, show_value=true))

Enter a value for δ - rate of predators growth by eating prey
$(@bind δ Slider(0.5 : .05 : 5; default=1.5, show_value=true))

Enter a value for γ - natural exponential decline of the predator
$(@bind γ Slider(0.5 : .05 : 2; default=1.25, show_value=true))

Enter a value for x0 - Initial Prey count 
$(@bind x0 Slider(1 : .1 : 10; default=1, show_value=true))

Enter a value for y0 - Initial Predator count 
$(@bind y0 Slider(1 : .1 : 10; default=1, show_value=true))
"

# ╔═╡ 7ebba51a-30e3-11eb-364e-f1255f41a963
function fn_Lotka_Volterra(a,b,c,d,x0,y0)
	@parameters t α β δ γ
	@variables x(t) y(t) 
	@derivatives D'~t

	eqs = [D(x) ~ α*x-β*x*y,
		   D(y) ~ δ*x*y-γ*y]

	Lotka_Volterra = ODESystem(eqs,name=:Lotka_Volterra)

	sys = ODESystem(eqs)

	u0 = [x => x0,
		  y => y0]
	
    p = [α=>a, β=>b, δ=>c, γ=>d];
	
	tspan = (0.0,10.0)
	prob = ODEProblem(sys,u0,tspan,p)
	sol = solve(prob, Tsit5())
end	

# ╔═╡ cb68360a-3b2f-11eb-3bef-b5e530f74f2e
begin
	sol1=fn_Lotka_Volterra(α,β,δ,γ,x0,y0)
    plot(sol1)
end

# ╔═╡ 5edf7256-3bbc-11eb-027d-a990de629754
md"### Here are some specific scenarios.
##### α=2.2,β=3.2,δ=1.6,γ=1.45  x0=2,y0=3 "


# ╔═╡ c9c12e30-3bbb-11eb-308c-b5bc17e4706e
begin
	sol2=fn_Lotka_Volterra(2.2,3.2,1.6,1.45,2,3)
    plot(sol2)
end

# ╔═╡ Cell order:
# ╠═dc926c2c-30e4-11eb-0b88-05fc45844731
# ╠═a3c276fe-30e3-11eb-3e4c-fb31d63eabf6
# ╠═7ebba51a-30e3-11eb-364e-f1255f41a963
# ╟─e0f36006-3ba1-11eb-3a47-193462d57302
# ╠═cb68360a-3b2f-11eb-3bef-b5e530f74f2e
# ╟─5edf7256-3bbc-11eb-027d-a990de629754
# ╠═c9c12e30-3bbb-11eb-308c-b5bc17e4706e
