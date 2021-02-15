### A Pluto.jl notebook ###
# v0.12.20

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

# ╔═╡ d192e588-2cdc-11eb-3f8c-9ff9bbcc7da9
begin
begin
begin
	import Pkg
	Pkg.add("Plots")
end

using Plots
end
	plotly()
end

# ╔═╡ 9871de0c-2c51-11eb-2a8a-ff4e63e93182
md"# _Kinetics!_
Kinetics is the study of reaction rates. Many reactions are thermodynamically favorable, but each have a unique rate that depends on many factors. "

# ╔═╡ d0a52bfc-2c52-11eb-00ec-47b43e12e665
md"## Relative Rate of Reaction

The **rate of reaction** is expressed as the change in concentration over change in time. Lets look at an example to understand"

# ╔═╡ 0c62867e-2c55-11eb-2a2f-c996647bb09f
md"$\ce{N2O4(g) -> 2NO2(g) + 1/2O2(g) }$"

# ╔═╡ 692cdf04-2cd6-11eb-13fa-e1085427e42b
md" The concentration of N2O4 decreases as the concentrations of NO2 and O2 increase. This happens because while the N2O4 decomposes as it goes through the reaction, the products are formed. However, the change in concentration is NOT the same, which means the rate is NOT the same because the coefficients are different in each product."

# ╔═╡ 9838cd52-2cd7-11eb-02dd-b7e58fa3f862
md"$\ce{Rate = -\Delta [N2O4] = \frac{\Delta [NO2]}{2} = \frac{\Delta [O2]}{1/2}}$"

# ╔═╡ 41ebf896-2cd9-11eb-1e42-bd22b037039e
md" Each of the rates in the products and reactants move at the rate of the coefficient. For every N2O4 molecule that is decomposed, half of NO2 required in the equation is formed, while double the O2 required is formed. Here is an example. Let say the rate of reaction for N2O4 is 10 M/s. What would be the rate of reaction for NO2?"

# ╔═╡ 14491af0-2cdb-11eb-18cb-f5bd35fd313c
(@bind N2O4 html"<input type=range>")

# ╔═╡ b3115e2e-2cdb-11eb-2945-4b5dd251bcde
md" When the rate of N2O4 is $N2O4, the rate of NO2 is"

# ╔═╡ 6dae28f8-2cdb-11eb-1000-0b7917f9bb43
NO2 = N2O4/2

# ╔═╡ 07ef692c-2cdc-11eb-16f4-61a88b7273ab
md"Similarly, when the rate of N2O4 is $N2O4, the rate of O2 is"

# ╔═╡ 1a26d13e-2cdc-11eb-0d5f-3db696fa1dd2
O2 = N2O4 * 2

# ╔═╡ 369e6228-2cdc-11eb-368d-d57df24cdf08
md" It is important to note that the units used to express rate is either Molarity per second or Mols per seconds * liter"

# ╔═╡ 7c569dec-2cdc-11eb-1fa8-8712981fc3b2
md"Lets look at a graph to better understand the relationship between the rates of reactants and products."

# ╔═╡ e1f2788a-2cdc-11eb-2704-25d806abeb32
Time = [0,2,4,6,8,10]

# ╔═╡ fe046dd0-2cdc-11eb-3008-3fe467884c2a
ConcentrationNO2 = [0, 0.16, 0.24, 0.28, 0.30, 0.31]

# ╔═╡ 69b1d6ee-2cdd-11eb-0ebc-d13320f0481a
ConcentrationN2O4 = [0.16, 0.08, 0.04, 0.02, 0.01, 0.0]

# ╔═╡ 87ea36e0-2cdd-11eb-38a8-01e198c24c56
ConcentrationO2 = [0.0,0.04, 0.06, 0.07, 0.079, 0.08]

# ╔═╡ b257660c-2cdd-11eb-11d1-0991ca781fe4
begin
	plot(Time, ConcentrationNO2, label="[NO2]")
	plot!(Time, ConcentrationN2O4, label="[N2O4]")
	plot!(Time, ConcentrationO2, label="[O2]")
end

# ╔═╡ cc6a1638-2cde-11eb-1295-370f172a8701
md" The curve of N2O4 decreases because it is a reactant. As time passes, the reactant gets used up, therefore the rate decreases, causing the curve to go down rather than up. Meanwhile, the curve of O2 and NO2 go up because as time passes and the N2O4 decomposes, the amount of product increases, thus making the curve go up, which makes the rate positive. To summarize, the rate of a reactant is ALWAYS NEGATIVE while the rate of the product is ALWAYS POSITIVE."

# ╔═╡ 49484bce-2ce0-11eb-039f-25acf25943dd
md"You can only find the rate of reaction through experiment. There are several different ways to collect that data, including absorbtion of visible light or change in pressure."

# ╔═╡ dd94e912-2ce1-11eb-3dea-1d25b16610b0
md"## Instantaneous Rate of Reaction

The instantaneous rate of reaction is the slope of the tangent line of a curve. The tangent line is $\frac{\Delta Y}{\Delta X}$. By finding the instantaneous rate, you find the rate at one particular moment."

# ╔═╡ 129366fa-2ce9-11eb-1192-ab7880b5a12b
md" ## Factors that influence Rate
There are several factors that influence the rate of a reaction. 
1. **Physical State**: Gas molecules are more likely to react faster than a liquid or solid because in the gaseous phase, the molecules move faster which means there will be more collisions, which increases the rate of a reaction
2. **Temperature**: This goes hand in hand with physical state. The higher the temperature, the faster the molecules move which means the greater the collisions which increase the rate of the reaction
3. **Concentraton**: The more molecules there are, the greater the chance for collisions to occur, which increases the rate of the reaction
4. **Surface area of a reaction**(does not apply to gases or solutions): The greater the surface area of each reactant is exposed and touching, the more collisions there are which means a higher reaction rate.
5. **Catalysts**: Catalyst change the path in which a reaction happens, which can increase the speed of the reaction. It lowers the activation energy needed to complete the reaction. In a later section, we will go into more depth
"

# ╔═╡ de6df402-2d0c-11eb-14d3-cdea73e7e4f0
md" ## Collision Theory
Reactions occur because of collisions between the reactant molecules. The higher the collision rate, the higher the rate of reaction. As the reactant gets consumed, the collisions happen less frequently which means the reaction rate drops. However, there are specific collision requirements needed for the reaction to occur."

# ╔═╡ Cell order:
# ╟─9871de0c-2c51-11eb-2a8a-ff4e63e93182
# ╟─d0a52bfc-2c52-11eb-00ec-47b43e12e665
# ╠═0c62867e-2c55-11eb-2a2f-c996647bb09f
# ╟─692cdf04-2cd6-11eb-13fa-e1085427e42b
# ╟─9838cd52-2cd7-11eb-02dd-b7e58fa3f862
# ╟─41ebf896-2cd9-11eb-1e42-bd22b037039e
# ╟─14491af0-2cdb-11eb-18cb-f5bd35fd313c
# ╟─b3115e2e-2cdb-11eb-2945-4b5dd251bcde
# ╟─6dae28f8-2cdb-11eb-1000-0b7917f9bb43
# ╟─07ef692c-2cdc-11eb-16f4-61a88b7273ab
# ╟─1a26d13e-2cdc-11eb-0d5f-3db696fa1dd2
# ╟─369e6228-2cdc-11eb-368d-d57df24cdf08
# ╟─7c569dec-2cdc-11eb-1fa8-8712981fc3b2
# ╟─d192e588-2cdc-11eb-3f8c-9ff9bbcc7da9
# ╟─e1f2788a-2cdc-11eb-2704-25d806abeb32
# ╟─fe046dd0-2cdc-11eb-3008-3fe467884c2a
# ╟─69b1d6ee-2cdd-11eb-0ebc-d13320f0481a
# ╟─87ea36e0-2cdd-11eb-38a8-01e198c24c56
# ╟─b257660c-2cdd-11eb-11d1-0991ca781fe4
# ╟─cc6a1638-2cde-11eb-1295-370f172a8701
# ╟─49484bce-2ce0-11eb-039f-25acf25943dd
# ╟─dd94e912-2ce1-11eb-3dea-1d25b16610b0
# ╟─129366fa-2ce9-11eb-1192-ab7880b5a12b
# ╟─de6df402-2d0c-11eb-14d3-cdea73e7e4f0
