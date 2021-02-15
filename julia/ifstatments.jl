### A Pluto.jl notebook ###
# v0.12.16

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

# ╔═╡ 39a6b3e2-4c50-11eb-16c8-a53147f5e269
md" ## _If Statements_
"

# ╔═╡ 4269dcbe-4c50-11eb-388d-1b32a4f02a1b
md"""Enter the first number:

`num1 = ` $(@bind num1 html"<input type=number >")"""

# ╔═╡ bc59aeca-4c50-11eb-2f6d-d100da19b862
md"""Enter the second number:

`num2 = ` $(@bind num2 html"<input type=number >")"""

# ╔═╡ c70a7e6a-4c50-11eb-1e95-917470deca87
begin
	if num1 <= num2
			lowest = num1
		else 
			lowest = num2
		end
		md"The lowest number is $lowest"
end

# ╔═╡ 0a14f9b2-4c51-11eb-10e6-03e0a1047d07
md" ## Question 2
"

# ╔═╡ 17e389b4-4c51-11eb-1c46-c9f83ecb7c17
md"""Enter a value for x:

`x = ` $(@bind x html"<input type=number >")"""

# ╔═╡ 2377fd6c-4c51-11eb-253b-451a7b8ea60a
if x < 4 | x>7
    md"$x is NOT between 4 and 7"
else
	md"$x is between 4 and 7"
end


# ╔═╡ e0d5642e-4c57-11eb-3498-2b4f485f95e6
md" ## Question 3
"

# ╔═╡ f5f19696-4c57-11eb-3f8b-3d1ccb46cc3f
md" Using a function so that the code can be used more universally"

# ╔═╡ 221b0e70-4c58-11eb-1211-97a2e61f5e60
function lower_num(num3, num4)
	if num3 <= num4
			lowest = num3
		else 
			lowest = num4
		end
		md"The lowest number is $lowest"
end

# ╔═╡ 318d97bc-4c5e-11eb-18db-118d5869c534
md"""Enter the first number:

`num3 = ` $(@bind num3 html"<input type=number >")"""

# ╔═╡ 3d0a0940-4c5e-11eb-1e57-55302ba763fa
md"""Enter the second number:

`num4 = ` $(@bind num4 html"<input type=number >")"""

# ╔═╡ 63c9b65c-4c5e-11eb-2fea-ad3ca9b2dde3
lower_num(num3,num4)

# ╔═╡ 16d4569c-4dd8-11eb-0048-b16a121fe624
md" ## Challenge 1 & 2: Highest Number + Calling Highest Number"

# ╔═╡ 242fda3c-4dd8-11eb-136d-4d6df172db52
function highest_number(numa, numb, numc)
	if numa >= numb && numa>= numc
		highest = numa
	elseif numb >= numa && numb >= numc
		higest = numb
	else 
		highest = numbc
	end
	md"The highest number is $highest"
end

# ╔═╡ 8ba743e6-4dd8-11eb-00d9-257f6b27bfb5
md"""Enter the first number:

`numa = ` $(@bind numa html"<input type=number >")"""

# ╔═╡ 930aba6c-4dd8-11eb-1f9a-85185b0e7033
md"""Enter the second number:

`numb = ` $(@bind numb html"<input type=number >")"""

# ╔═╡ 9a44b4c4-4dd8-11eb-1f72-c36a2a812343
md"""Enter the third number:

`numc = ` $(@bind numc html"<input type=number >")"""

# ╔═╡ a78a9368-4dd8-11eb-0ae1-1185aaa95fcc
highest_number(numa, numb, numc)

# ╔═╡ e2a13c06-4dd8-11eb-1550-55dae34ebc87
md" ## Challenge 3 + Challenge 4: Options and Calling Options"

# ╔═╡ f25fadce-4dd8-11eb-324f-d300053e5be1
function options(value)
	if value == 1
		md"Computer Science"
	elseif value == 2
		md"Music"
	elseif value == 3
		md" Dance"
	elseif value == 4
		md"PE"
	else
		md"Error"
	end
end

# ╔═╡ 6140a984-4dd9-11eb-1e1b-9fa512972905
md"""Enter a value:

`value = ` $(@bind value html"<input type=number >")"""

# ╔═╡ 790a7368-4dd9-11eb-16c7-c5ec34be601c
options(value)

# ╔═╡ a6741d86-4dd9-11eb-29a4-9549137cfa74
md" ## Challenge 6: Refining"


# ╔═╡ 28b74464-4dda-11eb-2453-39a77ae08ecd
function mystery_number(value1)
	if value1 < 3
		md"1"
	elseif value1 == 3
		md"3"
	elseif value1 < 5
		md"8"
	else
		md"$value1"
	end
end

# ╔═╡ 73797900-4dda-11eb-19b1-3592df24113e
md"""Enter a value:

`value1 = ` $(@bind value1 html"<input type=number >")"""

# ╔═╡ 7ef61c52-4dda-11eb-0401-ad5e3405c596
mystery_number(value1)

# ╔═╡ 9448f5cc-4dda-11eb-04d4-c5f044823a51


# ╔═╡ Cell order:
# ╟─39a6b3e2-4c50-11eb-16c8-a53147f5e269
# ╟─4269dcbe-4c50-11eb-388d-1b32a4f02a1b
# ╟─bc59aeca-4c50-11eb-2f6d-d100da19b862
# ╟─c70a7e6a-4c50-11eb-1e95-917470deca87
# ╟─0a14f9b2-4c51-11eb-10e6-03e0a1047d07
# ╟─17e389b4-4c51-11eb-1c46-c9f83ecb7c17
# ╟─2377fd6c-4c51-11eb-253b-451a7b8ea60a
# ╟─e0d5642e-4c57-11eb-3498-2b4f485f95e6
# ╟─f5f19696-4c57-11eb-3f8b-3d1ccb46cc3f
# ╟─221b0e70-4c58-11eb-1211-97a2e61f5e60
# ╟─318d97bc-4c5e-11eb-18db-118d5869c534
# ╟─3d0a0940-4c5e-11eb-1e57-55302ba763fa
# ╠═63c9b65c-4c5e-11eb-2fea-ad3ca9b2dde3
# ╟─16d4569c-4dd8-11eb-0048-b16a121fe624
# ╟─242fda3c-4dd8-11eb-136d-4d6df172db52
# ╟─8ba743e6-4dd8-11eb-00d9-257f6b27bfb5
# ╟─930aba6c-4dd8-11eb-1f9a-85185b0e7033
# ╟─9a44b4c4-4dd8-11eb-1f72-c36a2a812343
# ╠═a78a9368-4dd8-11eb-0ae1-1185aaa95fcc
# ╟─e2a13c06-4dd8-11eb-1550-55dae34ebc87
# ╟─f25fadce-4dd8-11eb-324f-d300053e5be1
# ╟─6140a984-4dd9-11eb-1e1b-9fa512972905
# ╟─790a7368-4dd9-11eb-16c7-c5ec34be601c
# ╟─a6741d86-4dd9-11eb-29a4-9549137cfa74
# ╟─28b74464-4dda-11eb-2453-39a77ae08ecd
# ╟─73797900-4dda-11eb-19b1-3592df24113e
# ╠═7ef61c52-4dda-11eb-0401-ad5e3405c596
# ╠═9448f5cc-4dda-11eb-04d4-c5f044823a51
