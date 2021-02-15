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
3. *Predicting the formation of a precipitiate*

"

# ╔═╡ 33092d3c-6b16-11eb-0701-91cce981323e
md" ## Ksp
**Solubility**: Amount of salt of salt that will dissolve to form a saturated solution at a given temperature.

Depending on the type of salt, the value for solubility changes. Salts that have low solubility are known as *insoluble salts*. This includes salts like silver chloride or calcium sulfate. Meanwhile, salts with high solubility, like Sodium Chloride or Potassium suflate are know as *soluble salts*.

How do you calculate *S*, or solubility?

Lets use this equation and solve for solubility!

$\ce{PbCl2(s) -> Pb+2(aq) + 2Cl-(aq) }$
"

# ╔═╡ a3c5dbe6-6b17-11eb-3f3a-290e677b30d0
equation = ce" PbCl2 = Pb + Cl"

# ╔═╡ 0ce2aee2-6b18-11eb-1d80-3526c27ffe80
balance(equation)

# ╔═╡ 691f1508-6b18-11eb-2f11-8354277afae2


# ╔═╡ Cell order:
# ╠═bfdf0fbe-6b17-11eb-1c12-c758f0464228
# ╠═c48abd6a-6b17-11eb-36f5-5f3ba22cc688
# ╠═d09d95a0-6b17-11eb-11dc-37663c2e26ed
# ╠═3cf182e8-6b13-11eb-0207-39526e08850f
# ╠═33092d3c-6b16-11eb-0701-91cce981323e
# ╠═a3c5dbe6-6b17-11eb-3f3a-290e677b30d0
# ╠═0ce2aee2-6b18-11eb-1d80-3526c27ffe80
# ╠═691f1508-6b18-11eb-2f11-8354277afae2
