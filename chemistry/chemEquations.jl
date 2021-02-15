### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 8a6e10fa-6342-11eb-2458-75f74e7ef436
using ChemEquations

# ╔═╡ 7d8bb5d6-6342-11eb-31d0-c7eedce3cc88
import Pkg

# ╔═╡ 837ac55e-6342-11eb-053e-cbf945249755
Pkg.add("ChemEquations")

# ╔═╡ c02e3a74-6342-11eb-1853-13697a19f688
md" ## _Balancing Chemical Equations_ 
The purpose of this notebook is to make simplifying chemical equations easier. 
"

# ╔═╡ cf5071b8-6342-11eb-0716-3d6d76f3190f
md" ## Sythesis Reactions
Pattern: *A + B → AB*"

# ╔═╡ d68358ae-6342-11eb-2b53-c72fa8eee3b0
equation = ce"Na + Cl = NaCl"

# ╔═╡ 63ef87dc-6343-11eb-1440-310b02a2a426
balance(equation)

# ╔═╡ 4ea26e16-6fab-11eb-23ee-65234ffdbd25
equation1 = ce"Ba{2} + Cl{-1} = BaCl2"

# ╔═╡ e2303056-6faa-11eb-08e0-6173ba68e77a
md"$\ce{Ba{2} + Cl{-1} = BaCl2 }$"

# ╔═╡ 9bf3ccc4-6343-11eb-1d29-65720a01824a
balance(equation1)

# ╔═╡ 48dfe7ce-6344-11eb-2380-03e6256e35b7
md" ## Decomposition
Pattern: *AB → A + B *"

# ╔═╡ 54c9f35e-6344-11eb-1fd1-8fa6c1814280
equation3 = ce"MgO2 = Mg + O2"

# ╔═╡ 7d4e6ec2-6344-11eb-072c-3deba9aa7860
balance(equation3)

# ╔═╡ 3b1a565e-6f17-11eb-03fa-9b22b3f508ba
md" ## Single Replacement
Pattern: AB + C → AC + B"

# ╔═╡ 58cefddc-6f17-11eb-242d-af13426a1370
equation4= ce"Zn + HCl = ZnCl2 + H2"

# ╔═╡ 86a8f670-6f17-11eb-3ebf-878a9ff13731
balance(equation4)

# ╔═╡ 907feb04-6f17-11eb-29dc-89c905bc730a
equation5= ce"Al + Ca3(PO4)2 = AlPO4 + Ca"

# ╔═╡ a3a333de-6f18-11eb-0f92-1d97d4308fb8
balance(equation5)

# ╔═╡ d604b9c4-6f18-11eb-1ecb-9f4d26413314
md" ## Double Replacement Reaction
Pattern: AB + CD → AD + CB"

# ╔═╡ f5c1167c-6f18-11eb-20c8-1f5fb5ccb77a
equation6= ce"  KI + Pb(NO3)2 = KNO3 + PbI2"

# ╔═╡ 795e11a8-6f19-11eb-30d8-79d62ee1bf19
balance(equation6)

# ╔═╡ d07c002e-6f19-11eb-39ca-dd1b59381779
md" ## Combustion Reactions"

# ╔═╡ 1ac3c964-6f1a-11eb-1265-f5701398f990
equation7= ce" C3H8 + O2 = CO2 + H2O"

# ╔═╡ 2f2e861e-6f1a-11eb-20ac-cf441e58f4a0
balance(equation7)

# ╔═╡ 97565ffa-6f1a-11eb-110d-c5a385f50100
equation8= ce" C16H22 + O2 = CO2 + H2O"

# ╔═╡ a9e1116a-6f1a-11eb-2217-5b9b11651c30
balance(equation8)

# ╔═╡ Cell order:
# ╠═7d8bb5d6-6342-11eb-31d0-c7eedce3cc88
# ╠═837ac55e-6342-11eb-053e-cbf945249755
# ╠═8a6e10fa-6342-11eb-2458-75f74e7ef436
# ╟─c02e3a74-6342-11eb-1853-13697a19f688
# ╟─cf5071b8-6342-11eb-0716-3d6d76f3190f
# ╠═d68358ae-6342-11eb-2b53-c72fa8eee3b0
# ╠═63ef87dc-6343-11eb-1440-310b02a2a426
# ╠═4ea26e16-6fab-11eb-23ee-65234ffdbd25
# ╟─e2303056-6faa-11eb-08e0-6173ba68e77a
# ╠═9bf3ccc4-6343-11eb-1d29-65720a01824a
# ╟─48dfe7ce-6344-11eb-2380-03e6256e35b7
# ╠═54c9f35e-6344-11eb-1fd1-8fa6c1814280
# ╠═7d4e6ec2-6344-11eb-072c-3deba9aa7860
# ╟─3b1a565e-6f17-11eb-03fa-9b22b3f508ba
# ╠═58cefddc-6f17-11eb-242d-af13426a1370
# ╠═86a8f670-6f17-11eb-3ebf-878a9ff13731
# ╠═907feb04-6f17-11eb-29dc-89c905bc730a
# ╠═a3a333de-6f18-11eb-0f92-1d97d4308fb8
# ╟─d604b9c4-6f18-11eb-1ecb-9f4d26413314
# ╠═f5c1167c-6f18-11eb-20c8-1f5fb5ccb77a
# ╠═795e11a8-6f19-11eb-30d8-79d62ee1bf19
# ╟─d07c002e-6f19-11eb-39ca-dd1b59381779
# ╠═1ac3c964-6f1a-11eb-1265-f5701398f990
# ╠═2f2e861e-6f1a-11eb-20ac-cf441e58f4a0
# ╠═97565ffa-6f1a-11eb-110d-c5a385f50100
# ╠═a9e1116a-6f1a-11eb-2217-5b9b11651c30
