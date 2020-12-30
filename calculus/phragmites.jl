### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ cc9cc4b4-4ab3-11eb-05f2-37ea689fa4f8
using Plots

# ╔═╡ c1ca28ec-4ab3-11eb-3c9c-8b86a71879f8
using StatsPlots

# ╔═╡ c4e8e4ae-4ab4-11eb-24a7-9f22121918ae
using DataFrames

# ╔═╡ b6fc2b28-4ab7-11eb-3597-bdcf3a301224
using RDatasets

# ╔═╡ b5046e74-4ab3-11eb-0f50-739471358246
import Pkg

# ╔═╡ b864fe92-4ab3-11eb-0d79-5715f155843c
Pkg.add("StatsPlots")

# ╔═╡ c612934e-4ab3-11eb-301a-6fc2bc4504da
Pkg.add("Plots")

# ╔═╡ bd5360e8-4ab4-11eb-0bfb-19b69bb9388a
Pkg.add("DataFrames")

# ╔═╡ b1f1d7fe-4ab7-11eb-2107-074d1665d576
Pkg.add("RDatasets")

# ╔═╡ 662ca5de-4aac-11eb-3f84-bbad2436945a
md" ## _Phragmites_
"

# ╔═╡ 840a76b2-4aac-11eb-36cb-dd646412b6a6
md" ## Background information:
Phragmites are an invasive plant species found along the east coast in wetlands or freshwater marshes. They most commonly spread through wind but they can also spread via animal born seeds or by humans. The phragmites can spread through horizantal above ground stolons. The stolons, thin horizantal strucutres, grow from already existing plants and grow connected to the original phragmites near by. Phragmites can also spread through underground connections called Rhizomes. They send roots and shoots to a nearby location underground, thus allowing the phragmites to grow and spread. Rhiozomes can spread at 30 ft per year. 

**Why is phragmites a problem?**
1. Phragmites reduces wildlife and other plant populations
2. Dead phragmites material creates tinder-dry vegetation that is easily flammable, thus producing a major fire hazard
3. blocks native salt marsh vegetation
4. does not give protection or food for the harsh winter climates
5. Raises surface elevation which reduces saltwater flooding, which takes away crucial vitamins and nutriets needed for the plants and animals in the area
"

# ╔═╡ 8ade9432-4aac-11eb-0d52-3510b15a1696
md" ## Research Project
**Research Question**:
How does cutting down the phragmites affect the growth rate in a certain area?

**Procedure**:
First, we boxed off a large section of phragmites so that come next fall, we can compare how the growth rate was affected when all the phragmites in the area were cut down. Next, we took rulers to create 2, 1 ft² boxes where we counted the number of phragmites in each box. We would then cut the phragmites stems(above the root) in box leaving the other box uncut. Once we finished the 100 quadrats, we cut all the phragmites in the designated box so that next year, we can compare bigger section to the rest of the phragmites uncut in the area.
"

# ╔═╡ f01ccef4-4aac-11eb-2a44-9b93fbb1c607
md" ## Data Table
We collected data for 100 Quadrats that compares two 1 ft^2 areas and the number of phragmites cut and uncut. 
"

# ╔═╡ 0f82ca70-4ab5-11eb-0360-033361c54d45
df = DataFrame(Quadrat = 1:100, Cut= [6,5,4,5,5,3,3,6,4,6,2,8,2,5,4,2,4,4,4,4,3,7,10,6,3,5,7,7,4,6,12,12,6,7,12,6,4,6,5,6,4,5,6,2,3,9,4,4,4,7,5,8,8,4,8,10,8,7,6,8,5,6,6,9,4,6,14,2,5,9,8,8,3,3,9,3,12,7,6,6,12,6,6,7,8,7,6,7,3,4,5,8,6,7,6,5,5,6,7,6], UnCut= [5,8,7,8,14,8,4,6,6,4,7,9,6,6,11,4,4,6,9,12,10,11,10,8,10,19,11,9,8,14,12,6,12,9,9,5,12,17,10,5,13,11,10,8,20,17,14,9,16,3,11,11,12,15,12,16,9,7,14,11,10,17,12,11,6,13,4,3,5,3,7,9,4,4,3,4,5,9,3,4,4,21,16,13,10,12,12,6,11,12,16,12,18,12,13,11,11,14,11,23])

# ╔═╡ cc8e6eb0-4ab7-11eb-2072-a92ddb252139
@df df scatter(:Quadrat, [:Cut :UnCut], color = [:red :blue],title = "Cut vs. UnCut",xlabel = "Quadrat", ylabel = "Number of Stems" )

# ╔═╡ c620c174-4aba-11eb-0c55-edd3a9fef765
@df df plot(:Quadrat, [:Cut :UnCut], color = [:red :blue], title = "Cut vs. UnCut",xlabel = "Quadrat", ylabel = "Number of Stems")

# ╔═╡ 44f655d0-4acb-11eb-2883-cb91db654bb5


# ╔═╡ f50dc544-4aac-11eb-2f9c-3520d3bb7de3
md" ## Growth Model
"

# ╔═╡ e8720d78-4ab0-11eb-30e0-8334ee4bbab6
md" ## Sources
1. https://www.fws.gov/gomcp/pdfs/phragmitesqa_factsheet.pdf
"

# ╔═╡ Cell order:
# ╠═b5046e74-4ab3-11eb-0f50-739471358246
# ╠═b864fe92-4ab3-11eb-0d79-5715f155843c
# ╠═c612934e-4ab3-11eb-301a-6fc2bc4504da
# ╠═cc9cc4b4-4ab3-11eb-05f2-37ea689fa4f8
# ╠═c1ca28ec-4ab3-11eb-3c9c-8b86a71879f8
# ╠═bd5360e8-4ab4-11eb-0bfb-19b69bb9388a
# ╠═c4e8e4ae-4ab4-11eb-24a7-9f22121918ae
# ╠═b1f1d7fe-4ab7-11eb-2107-074d1665d576
# ╠═b6fc2b28-4ab7-11eb-3597-bdcf3a301224
# ╟─662ca5de-4aac-11eb-3f84-bbad2436945a
# ╟─840a76b2-4aac-11eb-36cb-dd646412b6a6
# ╟─8ade9432-4aac-11eb-0d52-3510b15a1696
# ╟─f01ccef4-4aac-11eb-2a44-9b93fbb1c607
# ╟─0f82ca70-4ab5-11eb-0360-033361c54d45
# ╟─cc8e6eb0-4ab7-11eb-2072-a92ddb252139
# ╟─c620c174-4aba-11eb-0c55-edd3a9fef765
# ╠═44f655d0-4acb-11eb-2883-cb91db654bb5
# ╠═f50dc544-4aac-11eb-2f9c-3520d3bb7de3
# ╠═e8720d78-4ab0-11eb-30e0-8334ee4bbab6
