### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ c51255ce-3cc1-11eb-3dfc-cd080872baa6
using Plots

# ╔═╡ 579ebc5a-494e-11eb-0174-79135b1c1a50
using Catalyst

# ╔═╡ db777fbe-494f-11eb-1da8-49d8557bcb00
using Catlab

# ╔═╡ 3353f20e-4951-11eb-077f-b3daab10b3d0
using DiffEqBase

# ╔═╡ 388ebc2c-4951-11eb-282c-f70fb725a152
using OrdinaryDiffEq

# ╔═╡ e8561208-3cc0-11eb-2a9b-75ac6e6f5483
import Pkg

# ╔═╡ bd76b0e4-3cc1-11eb-3bc2-41c21ff4c83f
Pkg.add("Plots")

# ╔═╡ 4b5782ec-494e-11eb-1acb-cff55679f1e5
Pkg.add("Catalyst")

# ╔═╡ d5ca0fd4-494f-11eb-0485-db231c920c00
Pkg.add("Catlab")

# ╔═╡ 10d2e2f8-4951-11eb-3dfe-3bd09cf37bf9
Pkg.add("DiffEqBase")

# ╔═╡ 2d950038-4951-11eb-2afb-59019595033d
Pkg.add("OrdinaryDiffEq")

# ╔═╡ 05ab029e-34d3-11eb-1fdd-23fd51f05940
md" ## _Equilibrium_
Equilibrium occurs when the rates of the forward and reverse reactions are the same. This means that the concentrations of the reactants and the products will not change. Equilibrium is temperature dependent, which means a change in temperature will affect the equilibrium balance. 
"

# ╔═╡ 7a7c1864-34d4-11eb-26f9-47e8900545c9
md" ## Dynamic Equilibrium
You can tell a reaction is in dynamic equilibrium from the equation based on the arrows. An equation at equilibrium will have arrows going in both the forward and reverse direction. Here is an example:

$\ce{N2(g) + 3H2(g) \rightleftharpoons 2NH3(g)}$

If a reaction is at equilibrium then the concentration of the products and the reactants will NOT change. However, the concentrations of products and reactants do NOT need to be equal, they just cannot change in the equilibrium state. 
"

# ╔═╡ 1178242a-3f2e-11eb-028a-1f31fbe045bb
md" $\ce{N2O5(g) \rightleftharpoons N2O3(g) + O2}$
"

# ╔═╡ abe773bc-3f2e-11eb-1b5e-d9cba5c31b94

	rn = @reaction_network begin
	  2.0, N2O5 --> N2O3 + O2               
	  1.0, N2O3 + O2 --> N2O5           
	end
	## Does not take into consideration the fact that the reaction rate is NOT constant


# ╔═╡ 63b3e4ee-4952-11eb-0b2d-f553af6b4796
begin
	begin
		rn1 = @reaction_network begin
		  p, N2O5 --> N2O3 + O2
		  d, N2O3 + O2 --> N2O5
		end p d
	
	end
	p = [1.0,2.0]
	u0 = [0.1]
	tspan = (0.,1.)
	prob = ODEProblem(rn1,u0,tspan,p)
	sol = solve(prob, Tsit5())
end

# ╔═╡ f619dfb6-495a-11eb-0ed4-4787776ac119

	plot(sol, lw=2)
	

# ╔═╡ 685e0c60-495d-11eb-1693-09a483597219


# ╔═╡ 956a3240-34d5-11eb-18cb-f54bbc5e0452
md" ## Equilibrium Expression
Taking the same equation from above, you can write a general equilibrium expression to find `K`, which is the ratio of products to reactants. For the equation

$\ce{aA(g) + bB(g) \rightleftharpoons cC + dD(g)}$
The equilibrium equation is

$\ce{K =\frac{[C]^c[D]^d}{[A]^a[B]^b}}$

The capital letters contain the concentrations of the either the product or the reactants. The lowercase letters are the coefficents. 
If you look at the example creating ammonia, the equilibrium equation is

$\ce{K =\frac{[NH3]^2}{[N2]^1[H2]^3}}$

When writing these expressions, there is one important thing to note.
 *Pure solids and liquids will NOT APPEAR in the equilibrium expression.* This is because they are in condensed states so its harder to change concentrations and they are less affected by variables such as pressure or temperature. They also react less frequently. Gases and aqueous solutions behave the opposite, and changes in pressure and temperature affect `K`, which is why they are included.

There is also another way of writing the equilibrium constant in terms of partial pressure. Using the same general equation from above, the partial pressure equilibrium expression is

$\ce{K =\frac{(P(C))^c(P(D))^d}{(P(A))^a(P(B))^b}}$ 

where P(C) is the partial pressure of the product C. 


"

# ╔═╡ c23eb6a6-494d-11eb-1352-a5dce0aa5489


# ╔═╡ Cell order:
# ╠═e8561208-3cc0-11eb-2a9b-75ac6e6f5483
# ╠═bd76b0e4-3cc1-11eb-3bc2-41c21ff4c83f
# ╠═c51255ce-3cc1-11eb-3dfc-cd080872baa6
# ╠═4b5782ec-494e-11eb-1acb-cff55679f1e5
# ╠═579ebc5a-494e-11eb-0174-79135b1c1a50
# ╠═d5ca0fd4-494f-11eb-0485-db231c920c00
# ╠═db777fbe-494f-11eb-1da8-49d8557bcb00
# ╠═10d2e2f8-4951-11eb-3dfe-3bd09cf37bf9
# ╠═2d950038-4951-11eb-2afb-59019595033d
# ╠═3353f20e-4951-11eb-077f-b3daab10b3d0
# ╠═388ebc2c-4951-11eb-282c-f70fb725a152
# ╟─05ab029e-34d3-11eb-1fdd-23fd51f05940
# ╠═7a7c1864-34d4-11eb-26f9-47e8900545c9
# ╠═1178242a-3f2e-11eb-028a-1f31fbe045bb
# ╠═abe773bc-3f2e-11eb-1b5e-d9cba5c31b94
# ╠═63b3e4ee-4952-11eb-0b2d-f553af6b4796
# ╠═f619dfb6-495a-11eb-0ed4-4787776ac119
# ╠═685e0c60-495d-11eb-1693-09a483597219
# ╟─956a3240-34d5-11eb-18cb-f54bbc5e0452
# ╠═c23eb6a6-494d-11eb-1352-a5dce0aa5489
