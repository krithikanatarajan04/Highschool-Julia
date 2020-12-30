### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ f84a00b0-3d55-11eb-1560-17af63da3f95
using Plots

# ╔═╡ e49da79c-3d55-11eb-2090-b1649653782c
begin
@userplot CirclePlot
@recipe function f(cp::CirclePlot)
    x, y, i = cp.args
    n = length(x)
    inds = circshift(1:n, 1 - i)
    linewidth --> range(0, 10, length = n)
    seriesalpha --> range(0, 1, length = n)
    aspect_ratio --> 1
    label --> false
    x[inds], y[inds]
end

n = 150
t = range(0, 2π, length = n)
x = sin.(t)
y = cos.(t)

anim = @animate for i ∈ 1:n
    circleplot(x, y, i)
end
gif(anim, "anim_fps15.gif", fps = 15)
end	

# ╔═╡ Cell order:
# ╠═f84a00b0-3d55-11eb-1560-17af63da3f95
# ╠═e49da79c-3d55-11eb-2090-b1649653782c
