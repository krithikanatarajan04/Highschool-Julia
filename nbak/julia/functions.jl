### A Pluto.jl notebook ###
# v0.12.11

using Markdown
using InteractiveUtils

# ╔═╡ 3f5d8958-31e5-11eb-1603-55006552e57e
md" ## _Functions_
Functions are the actions done to the object. If given an input, the function does something to create the output. Functions are very important because they are the foundation of Julia.

"

# ╔═╡ c56bfffc-31e5-11eb-3dd3-0180c02087f5
md" ## Defining Functions
A function begins with `function` and ends with `end`. This is important as it clearly dictates when the function starts and finishes. 
"

# ╔═╡ 4223b408-31e7-11eb-3e6b-4f63b0a05b11
function plus_two(x) #overview of the function
	x=x+2 #the action being performed
	return x #what gets returned
end

# ╔═╡ 7d46403c-31e7-11eb-0852-038f465d05e7
md" Another way of writing that same function is to assign the function directly to the action like this: `plus_two(x) = x+2`. Both yield the same result.
"

# ╔═╡ d0648672-31e5-11eb-064a-1b44500d6ced
md" ## Anonymous Functions

"

# ╔═╡ e400155c-31e5-11eb-3b15-dbaff73c7de4
md" ## Void Functions

"

# ╔═╡ eda66264-31e5-11eb-1b1a-41f28a927563
md" ## Optional Positional Arguments

"

# ╔═╡ fc7ed19a-31e5-11eb-0657-13f8cb1e6826
md" ## Key Word Arguments

"

# ╔═╡ 085c37c8-31e6-11eb-256b-79b193b33094
md" ## Function Documentation

"

# ╔═╡ Cell order:
# ╠═3f5d8958-31e5-11eb-1603-55006552e57e
# ╟─c56bfffc-31e5-11eb-3dd3-0180c02087f5
# ╠═4223b408-31e7-11eb-3e6b-4f63b0a05b11
# ╠═7d46403c-31e7-11eb-0852-038f465d05e7
# ╠═d0648672-31e5-11eb-064a-1b44500d6ced
# ╠═e400155c-31e5-11eb-3b15-dbaff73c7de4
# ╠═eda66264-31e5-11eb-1b1a-41f28a927563
# ╠═fc7ed19a-31e5-11eb-0657-13f8cb1e6826
# ╠═085c37c8-31e6-11eb-256b-79b193b33094
