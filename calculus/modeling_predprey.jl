### A Pluto.jl notebook ###
# v0.12.11

using Markdown
using InteractiveUtils

# ╔═╡ a3c276fe-30e3-11eb-3e4c-fb31d63eabf6
using ModelingToolkit, OrdinaryDiffEq, Plots

# ╔═╡ dc926c2c-30e4-11eb-0b88-05fc45844731
import Pkg; Pkg.add("OrdinaryDiffEq")

# ╔═╡ 7ebba51a-30e3-11eb-364e-f1255f41a963
function voktra()
	@parameters t α β δ γ
	@variables x(t) y(t) 
	@derivatives D'~t

	eqs = [D(x) ~ α*x-β*x*y,
		   D(y) ~ δ*x*y-γ*y]

	Lotka_Volterra = ODESystem(eqs,name=:Lotka_Volterra)

	sys = ODESystem(eqs)

	u0 = [x => 10,
		  y => 20]

	p  = [α  => 28.0,
		  β => 10.0,
		  δ => 2,
		  γ => 3]

	tspan = (0.0,100.0)
	prob = ODEProblem(sys,u0,tspan,p)
	sol = solve(prob, Tsit5())
	#plot(sol,vars=(x,y))
end	

# ╔═╡ 189c88e8-30e9-11eb-0674-7345cc1475bb
voktra()

# ╔═╡ Cell order:
# ╠═dc926c2c-30e4-11eb-0b88-05fc45844731
# ╠═a3c276fe-30e3-11eb-3e4c-fb31d63eabf6
# ╠═7ebba51a-30e3-11eb-364e-f1255f41a963
# ╠═189c88e8-30e9-11eb-0674-7345cc1475bb
