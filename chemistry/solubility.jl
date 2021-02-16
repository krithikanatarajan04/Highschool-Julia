### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ d09d95a0-6b17-11eb-11dc-37663c2e26ed
using ChemEquations

# ╔═╡ bfdf0fbe-6b17-11eb-1c12-c758f0464228
import Pkg

# ╔═╡ c48abd6a-6b17-11eb-36f5-5f3ba22cc688
Pkg.add("ChemEquations")

# ╔═╡ 3cf182e8-6b13-11eb-0207-39526e08850f
md" ## _Solubility Equilibria_ 
The purpose of this notebook is to explore solubility, specifically the reaction system and how changes will affect the overall system. The topics that will be covered are:
1. *Ksp*
2. *Qsp*
3. *Saturation*
4. *Predicting the formation of a precipitiate*
5. *Common Ion Effect*
6. *ΔGᴼ*



"

# ╔═╡ 33092d3c-6b16-11eb-0701-91cce981323e
md" ## Ksp
**Solubility**: Amount of salt of salt that will dissolve to form a saturated solution at a given temperature.

Depending on the type of salt, the value for solubility changes. Salts that have low solubility are known as *insoluble salts*. This includes salts like silver chloride or calcium sulfate. Meanwhile, salts with high solubility, like Sodium Chloride or Potassium suflate are know as *soluble salts*.

How do you calculate *Ksp*, the solubility product constant?

Lets use this equation an example!

$\ce{PbCl2(s) -> Pb+2(aq) + 2Cl-(aq) }$
"

# ╔═╡ a3c5dbe6-6b17-11eb-3f3a-290e677b30d0
equation = ce" PbCl2 = Pb + Cl"

# ╔═╡ 0ce2aee2-6b18-11eb-1d80-3526c27ffe80
balance(equation)

# ╔═╡ 9265a3ce-6fe1-11eb-325f-1bf2c77e36f6
md" Ksp is another equilibrium expression, specifically for soluble salts. Therefore, the equation for Ksp is 
$\ce{Ksp =[Pb+2][Cl-]^2}$

In a normal equilibrium expression, we include the reactants, however, since the reactant is a solid, it doesn't get included into the expression, hence the reason the expression only has the products of the reaction

"



# ╔═╡ 8decce0e-6fe2-11eb-0226-2f4ca2954e94
md" Here is a Ksp Calculator. Plug in the concentrations of the products (the aqueous components) and the exponents"


# ╔═╡ bef3f120-6fe3-11eb-3ce0-7d2de07c388c
Ksp(c1,e1,c2,e2) = (c1^e1)*(c2^e2)

# ╔═╡ ea82fa7e-6fe4-11eb-2648-01ecd4757558
Ksp(0.08967,3,0.6789,2)

# ╔═╡ 691f1508-6b18-11eb-2f11-8354277afae2
md" ## Qsp
Qsp, or Q, is the number of ions in solution at any given moment. It is calculated the same way as Ksp.
"

# ╔═╡ 3f96aba4-6fe6-11eb-2c80-d988d9209ea7
Qsp(c,e,C,E)=(c^e)*(C^E)

# ╔═╡ 543b6202-6fe6-11eb-0969-8d26d5c50f6c
Qsp(0.067,1, 0.00324,2)

# ╔═╡ 67bad146-6fe6-11eb-2742-63398669caa5
md" The difference between Ksp and Qsp is that Ksp is the number of ions in solution at the saturation point whereas Qsp is the number of ions at any time.
"

# ╔═╡ 5260d00c-6fe1-11eb-2dd1-39e92ef68a07
md" ## Saturation 
"

# ╔═╡ d0fed526-6fe8-11eb-23df-65103a653151
precipitate(Q,Ksp1)
if Qsp>Ksp1
	md"The solution is supersaturated. This means there are too many ions so by Le Chatliers principle, the reaction shifts to the left(towards the solid), creating more precipitate in the solution. Currently in the beaker, there is solid at the bottom of the beaker."
elseif Qsp < Ksp1
		md"The solution is not saturated. The solid can still dissolve. The only thing in the beaker is ions"
else 
		md"Since Q and K are equal,the solution is saturated. This means that the rate of dissolution(the forward reaction) and the reverse reaction(formation of the precipipate) are equal. Currently in the beaker, there is a small amount of crystallization."
end

# ╔═╡ 1147b294-6fea-11eb-12a3-15c40863664e
precipitate(0.01,0.02)

# ╔═╡ 59151304-6fe1-11eb-09ee-0f3da19ba7cb
md" ## Formation of a precipitate
"

# ╔═╡ 6322a014-6fe1-11eb-1cad-6d6aefa75fde
md" ## Common Ion Effect
"

# ╔═╡ Cell order:
# ╠═bfdf0fbe-6b17-11eb-1c12-c758f0464228
# ╠═c48abd6a-6b17-11eb-36f5-5f3ba22cc688
# ╠═d09d95a0-6b17-11eb-11dc-37663c2e26ed
# ╟─3cf182e8-6b13-11eb-0207-39526e08850f
# ╟─33092d3c-6b16-11eb-0701-91cce981323e
# ╠═a3c5dbe6-6b17-11eb-3f3a-290e677b30d0
# ╠═0ce2aee2-6b18-11eb-1d80-3526c27ffe80
# ╟─9265a3ce-6fe1-11eb-325f-1bf2c77e36f6
# ╟─8decce0e-6fe2-11eb-0226-2f4ca2954e94
# ╠═bef3f120-6fe3-11eb-3ce0-7d2de07c388c
# ╠═ea82fa7e-6fe4-11eb-2648-01ecd4757558
# ╟─691f1508-6b18-11eb-2f11-8354277afae2
# ╠═3f96aba4-6fe6-11eb-2c80-d988d9209ea7
# ╠═543b6202-6fe6-11eb-0969-8d26d5c50f6c
# ╠═67bad146-6fe6-11eb-2742-63398669caa5
# ╠═5260d00c-6fe1-11eb-2dd1-39e92ef68a07
# ╠═d0fed526-6fe8-11eb-23df-65103a653151
# ╠═1147b294-6fea-11eb-12a3-15c40863664e
# ╠═59151304-6fe1-11eb-09ee-0f3da19ba7cb
# ╠═6322a014-6fe1-11eb-1cad-6d6aefa75fde
