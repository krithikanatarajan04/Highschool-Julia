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

# ╔═╡ c51f94fc-4b81-11eb-1bb4-e988fea88167
md"## _If Statements_
"

# ╔═╡ 429023cc-4b82-11eb-06f8-cd8b628a57fb


# ╔═╡ 89797bda-4b82-11eb-192b-a179248f700e
num1 =  `$(@bind num1 html"<input type=text >")`

# ╔═╡ 6d9f5fb0-4b82-11eb-3949-cb21832e9734
md"Enter the first number: $num1 "

# ╔═╡ b7598e14-4b82-11eb-1bfc-9f9c12c10464


# ╔═╡ bf81ea96-4b82-11eb-20f7-c9c2a151b433


# ╔═╡ c5c10e3c-4b82-11eb-27cb-7168044bbdc8
begin
	if num1 <= num2
		lowest = num1
	else 
		lowest = num2
	end
	md"The lowest number is $lowest"
end

# ╔═╡ Cell order:
# ╠═c51f94fc-4b81-11eb-1bb4-e988fea88167
# ╟─429023cc-4b82-11eb-06f8-cd8b628a57fb
# ╠═6d9f5fb0-4b82-11eb-3949-cb21832e9734
# ╠═89797bda-4b82-11eb-192b-a179248f700e
# ╟─b7598e14-4b82-11eb-1bfc-9f9c12c10464
# ╟─bf81ea96-4b82-11eb-20f7-c9c2a151b433
# ╠═c5c10e3c-4b82-11eb-27cb-7168044bbdc8
