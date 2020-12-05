### A Pluto.jl notebook ###
# v0.12.11

using Markdown
using InteractiveUtils

# ╔═╡ dce56652-31d4-11eb-365b-6100a847b13d
using LightGraphs

# ╔═╡ 9c4b53ae-31d4-11eb-052a-abd726285a2d
using GraphRecipes

# ╔═╡ a9737288-31d5-11eb-1ca8-596a083b9dbb
using PGFPlotsX

# ╔═╡ c510f6ae-31d4-11eb-1901-5563116763d3
using Plots

# ╔═╡ 237d50d0-31c5-11eb-0055-6f6e97b5f479
md" ## _Lesson 1: Variable and Types_
In this lesson, you will learn about variables and types and how to utilize them in Julia. You will also learn about basic mathematical operations
"

# ╔═╡ 836d87b2-31c5-11eb-203e-0b3425e33f4c
md" ## Variables
A program is a series of instructions to be performed on various kind of data. The data can range from names, to heights, to actual scientific data. To better organize the data, you can use variables, which are labels that the data is assigned to. To better understand this, lets look at some examples.
"

# ╔═╡ 4404e28e-31c6-11eb-2dfe-fd3c843495f3
md" **Example 1**
Lets say that you have a collection of data about all your favorites like favorite color, integer, and favorite scientific constant. To collect in a organized fasion you can assign the data to specific variables with labels, or names that tell people what kind of data the variable contains."

# ╔═╡ 9be8b67a-31c7-11eb-3117-d900b81590f4
favorite_color = "blue"

# ╔═╡ 8aa726e8-31c8-11eb-2866-a12e7f701e49
md" This variable contains a string because it uses quotation marks."

# ╔═╡ c6a234a4-31c7-11eb-114e-77493d1e92b4
favorite_integer = 11

# ╔═╡ 8d8ae334-31c8-11eb-0c90-2339c7117f4d
md" This variable contains an integer."

# ╔═╡ ce4f411a-31c7-11eb-2748-3d045a819acb
favorite_science_constant = 0.0821

# ╔═╡ 935e4d16-31c8-11eb-3b0b-495838d64c69
md" This variable contains a floating point number. It is a floating point number because it is a decimal."

# ╔═╡ 587630e2-31d2-11eb-0e2a-11d70ebdb31b
md" Then, to actually print that value, just type `print(variable name)`. In this notebook however, you do not need the print, just type the variable name"

# ╔═╡ 62f3be04-31d2-11eb-37f0-89d5d01c3e7c
favorite_color, favorite_integer, favorite_science_constant

# ╔═╡ cc46e5f2-31d2-11eb-3b29-e1555c25860f
md" **Example 2**
Using variables, you can perform basic math problems and assign the answers to those problems to new variables. Look below to see how variables can be manipulated to perform arithmatic. First we assign the integers 2 and 3 to the variables a and b.
"

# ╔═╡ f5213ffe-31d2-11eb-3b28-abe9bfdb25bf
a=2

# ╔═╡ 164132ca-31d3-11eb-1865-cb1f15921ebe
b=3

# ╔═╡ 2d261cd0-31d3-11eb-287b-2d9d5546f682
md" Once that is finished, you can now add, subtract, multiply and divide using those variables and you will get values.
"

# ╔═╡ 437f37f0-31d3-11eb-3eac-0fbffcd63384
sum = a + b

# ╔═╡ 51c0d60c-31d3-11eb-13de-4935e1795602
difference = a - b

# ╔═╡ 584dc1a6-31d3-11eb-0c72-a5797f0ff9a3
product = a * b

# ╔═╡ 604a1e18-31d3-11eb-17b1-f1da04ca048e
quotient = a / b

# ╔═╡ 74d7ad46-31d3-11eb-2a26-9788acd07194
power = a^2

# ╔═╡ 7a44d362-31d3-11eb-2006-2f79e5383f95
modulus = a%b

# ╔═╡ 84cf7bca-31d3-11eb-3594-a722da40b1bf
md" Additionally, you can use `a//b` if you are looking for a value exact, instead of in decimal form. "

# ╔═╡ 90c953fa-31c5-11eb-0916-b7b3828e12e1
md" ## Types
Evey element, or variable must have a type. The type depends on the hierarchial system. 

"

# ╔═╡ 98c12592-31c5-11eb-0be0-bdf59ba1274a
begin
g = DiGraph(13)
add_edge!(g, 1, 2)
add_edge!(g, 2, 3)
add_edge!(g, 3, 4)
add_edge!(g, 3, 7)
# Instead of adding an edge 5 -> 3, have an edge that goes from 5 to
# the ghost node, then to 3.
add_edge!(g, 4, 5)
add_edge!(g, 4, 6)
add_edge!(g, 7, 8)
add_edge!(g, 7, 9)
add_edge!(g, 8, 10)
add_edge!(g, 8, 11)
add_edge!(g, 9, 12)
add_edge!(g, 9, 13)

# Add an edge by itself that will force GraphRecipes to have a decent
# window size.
add_edge!(g, 7, 7)
add_edge!(g, 8, 8)
add_edge!(g, 9, 9)
add_edge!(g, 10, 10)
add_edge!(g, 11, 11)
add_edge!(g, 12, 12)
add_edge!(g, 13, 13)

names = [:Any, :Number, :Real, :abstractfloat, :float64, :float32, :Integer, :signed, :unsigned, :Int64, :Int32, :UInt64, :UInt32]
x = [0,0,0,0,-1,1,5,4,6,3.25,4.75,6,8]
y = [5,4,3,2,1,1,3,2,2,1,1,1,1]
graphplot(g, x=x, y=y, curvature_scalar=0.0, nodesize=1.0, 
          node_weights=[1.0,1.0,1.0,1.0,1.0,1.0,1.0 ,1.0,1.0,1.0,1.0,1.0,1.0],
          names=names, nodecolor=:lightyellow, color=:black,
          nodeshape=:rect, self_edge_size=0.0)
end

# ╔═╡ 9ff95ace-31e2-11eb-3e4a-d1fa507ff913
md" If a variable is declared as type number, anything below number on the hiearchy chart can be data in the type number since number is an overarching branch. To determine the type of variable, just use `typeof(number)`."

# ╔═╡ f76a077c-31e2-11eb-2bd0-399350c2e820
typeof(0.0921)

# ╔═╡ ff24c0a6-31e2-11eb-25e0-c5f530e27ed0
typeof(123)

# ╔═╡ 0a316b98-31e3-11eb-1efd-1554bc7b78b2
md"You do need to be careful about initializing the variable to the correct type. Julia takes care of most of it but there are several instances where the results you want will not happen. For example, if you assign a = 2, but later reassign it to 1.42, the decimal part will be cut off because since you originally assigned a to an int, that means that a is an int, so storing a floating point number will be truncated. It is easier just to plan ahead but incase you forget, you can utilize `convert` to change the type to match the number."

# ╔═╡ cb4b9cd6-31e3-11eb-1ce1-453f4af82cee
convert(Float64,2)

# ╔═╡ dc16eef8-31e3-11eb-1eba-737e85238d07
c=4

# ╔═╡ e05ed4e4-31e3-11eb-1f62-d987a3d416fe
d = convert(Float64,c)

# ╔═╡ 86cd5ffc-31c4-11eb-1394-c7ddfa5dc534
md" ## Acknowledgements
1. Learning Julia notebooks based on content from [Zero to Julia] (https://techytok.com/from-zero-to-julia/)
2. https://discourse.julialang.org/t/flow-charts-lightgraphs/31139/9"

# ╔═╡ a36c5818-31d4-11eb-0de0-35c9674d733f
import Pkg

# ╔═╡ c9c55d7a-31d4-11eb-0a65-abd881438331
Pkg.add("LightGraphs")

# ╔═╡ a7a054ca-31d4-11eb-317b-cf624d47791a
Pkg.add("GraphRecipes")

# ╔═╡ b4575984-31d4-11eb-0045-fb0824a08c20
Pkg.add("Plots")

# ╔═╡ 9fae0234-31d5-11eb-21ba-abf6e13932c1
Pkg.add("PGFPlotsX")

# ╔═╡ Cell order:
# ╟─237d50d0-31c5-11eb-0055-6f6e97b5f479
# ╟─836d87b2-31c5-11eb-203e-0b3425e33f4c
# ╟─4404e28e-31c6-11eb-2dfe-fd3c843495f3
# ╠═9be8b67a-31c7-11eb-3117-d900b81590f4
# ╟─8aa726e8-31c8-11eb-2866-a12e7f701e49
# ╠═c6a234a4-31c7-11eb-114e-77493d1e92b4
# ╟─8d8ae334-31c8-11eb-0c90-2339c7117f4d
# ╠═ce4f411a-31c7-11eb-2748-3d045a819acb
# ╟─935e4d16-31c8-11eb-3b0b-495838d64c69
# ╟─587630e2-31d2-11eb-0e2a-11d70ebdb31b
# ╠═62f3be04-31d2-11eb-37f0-89d5d01c3e7c
# ╟─cc46e5f2-31d2-11eb-3b29-e1555c25860f
# ╠═f5213ffe-31d2-11eb-3b28-abe9bfdb25bf
# ╠═164132ca-31d3-11eb-1865-cb1f15921ebe
# ╟─2d261cd0-31d3-11eb-287b-2d9d5546f682
# ╠═437f37f0-31d3-11eb-3eac-0fbffcd63384
# ╠═51c0d60c-31d3-11eb-13de-4935e1795602
# ╠═584dc1a6-31d3-11eb-0c72-a5797f0ff9a3
# ╠═604a1e18-31d3-11eb-17b1-f1da04ca048e
# ╠═74d7ad46-31d3-11eb-2a26-9788acd07194
# ╠═7a44d362-31d3-11eb-2006-2f79e5383f95
# ╟─84cf7bca-31d3-11eb-3594-a722da40b1bf
# ╟─90c953fa-31c5-11eb-0916-b7b3828e12e1
# ╟─98c12592-31c5-11eb-0be0-bdf59ba1274a
# ╟─9ff95ace-31e2-11eb-3e4a-d1fa507ff913
# ╠═f76a077c-31e2-11eb-2bd0-399350c2e820
# ╠═ff24c0a6-31e2-11eb-25e0-c5f530e27ed0
# ╟─0a316b98-31e3-11eb-1efd-1554bc7b78b2
# ╠═cb4b9cd6-31e3-11eb-1ce1-453f4af82cee
# ╠═dc16eef8-31e3-11eb-1eba-737e85238d07
# ╠═e05ed4e4-31e3-11eb-1f62-d987a3d416fe
# ╟─86cd5ffc-31c4-11eb-1394-c7ddfa5dc534
# ╟─c9c55d7a-31d4-11eb-0a65-abd881438331
# ╟─dce56652-31d4-11eb-365b-6100a847b13d
# ╟─a7a054ca-31d4-11eb-317b-cf624d47791a
# ╟─b4575984-31d4-11eb-0045-fb0824a08c20
# ╟─9c4b53ae-31d4-11eb-052a-abd726285a2d
# ╟─9fae0234-31d5-11eb-21ba-abf6e13932c1
# ╟─a9737288-31d5-11eb-1ca8-596a083b9dbb
# ╟─c510f6ae-31d4-11eb-1901-5563116763d3
# ╟─a36c5818-31d4-11eb-0de0-35c9674d733f
