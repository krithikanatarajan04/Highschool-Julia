### A Pluto.jl notebook ###
# v0.12.11

using Markdown
using InteractiveUtils

# ╔═╡ cb23b3e4-30ba-11eb-048b-33940fa83826
using ModelingToolkit

# ╔═╡ 23f048f2-30bb-11eb-2d54-9fb1c6aed0a5
using Latexify

# ╔═╡ 0d2468ee-30be-11eb-0d75-ed21f3712b85
using Plots

# ╔═╡ 44e05d48-30ba-11eb-1820-c92042f7fc1f
md"ModelingToolkit.jl is a modeling language for high-performance symbolic-numeric computation in scientific computing and scientific machine learning. It allows for users to give a high-level description of a model for symbolic preprocessing to analyze and enhance the model. ModelingToolkit can automatically generate fast functions for model components like Jacobians and Hessians, along with automatically sparsifying and parallelizing the computations. Automatic transformations, such as index reduction, can be applied to the model to make it easier for numerical solvers to handle.
"

# ╔═╡ f6b027e8-30ba-11eb-3279-cfb2ba45c50b
@variables x y

# ╔═╡ 0a1f16ba-30bb-11eb-2116-218fecf8c8e5
z = x^3 + y

# ╔═╡ 10315162-30bb-11eb-1462-d3fb963a29ec
latexify(z)

# ╔═╡ 0887b66c-30bc-11eb-0353-93ba2f2fcba1
z1 = t + t^2

# ╔═╡ 2f5af0ba-30bc-11eb-21d7-43f31111d22e
@derivatives D'~t

# ╔═╡ 1ccf0eae-30bc-11eb-1d8a-cd7f727bb69b
D(z1)

# ╔═╡ 40072080-30bc-11eb-2b27-fb501cc055c8
dz1=expand_derivatives(D(z1))

# ╔═╡ 55a84814-30bc-11eb-25df-cff76501368c
latexify(z1)

# ╔═╡ 4d6c6c00-30bc-11eb-1da6-216840f18165
latexify(dz1)

# ╔═╡ c710d79e-30bc-11eb-06df-8f322f48cda0
fz1=build_function(z1,t,expression=false)

# ╔═╡ 881a68a6-30bd-11eb-35c2-4dc061e74ce2
t1=[1:20...]

# ╔═╡ 1b06d722-30bd-11eb-0bbc-27e45fde5a46
ft1=fz1.([1:20...])

# ╔═╡ f8f7d7c2-30bd-11eb-13ee-e9e682866368
plot(t1,ft1)

# ╔═╡ 9e94b908-30bb-11eb-19f0-33840780b3ee
build_function(z,[x,y])

# ╔═╡ a41d0c4a-30bb-11eb-1434-4982edcff617


# ╔═╡ 440889ec-30bb-11eb-3c5c-a519f291111a
A = [x^2+y 0 2x
     0     0 2y
     y^2+x 0 0]

# ╔═╡ 4b7b92b2-30bb-11eb-342f-0fb5b3f27ec5
latexify(A)

# ╔═╡ Cell order:
# ╠═44e05d48-30ba-11eb-1820-c92042f7fc1f
# ╠═cb23b3e4-30ba-11eb-048b-33940fa83826
# ╠═23f048f2-30bb-11eb-2d54-9fb1c6aed0a5
# ╠═0d2468ee-30be-11eb-0d75-ed21f3712b85
# ╠═f6b027e8-30ba-11eb-3279-cfb2ba45c50b
# ╠═0a1f16ba-30bb-11eb-2116-218fecf8c8e5
# ╠═10315162-30bb-11eb-1462-d3fb963a29ec
# ╠═0887b66c-30bc-11eb-0353-93ba2f2fcba1
# ╠═2f5af0ba-30bc-11eb-21d7-43f31111d22e
# ╠═1ccf0eae-30bc-11eb-1d8a-cd7f727bb69b
# ╠═40072080-30bc-11eb-2b27-fb501cc055c8
# ╠═55a84814-30bc-11eb-25df-cff76501368c
# ╠═4d6c6c00-30bc-11eb-1da6-216840f18165
# ╠═c710d79e-30bc-11eb-06df-8f322f48cda0
# ╠═881a68a6-30bd-11eb-35c2-4dc061e74ce2
# ╠═1b06d722-30bd-11eb-0bbc-27e45fde5a46
# ╠═f8f7d7c2-30bd-11eb-13ee-e9e682866368
# ╠═9e94b908-30bb-11eb-19f0-33840780b3ee
# ╠═a41d0c4a-30bb-11eb-1434-4982edcff617
# ╠═440889ec-30bb-11eb-3c5c-a519f291111a
# ╠═4b7b92b2-30bb-11eb-342f-0fb5b3f27ec5
