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

# ╔═╡ 126b1cca-2476-11eb-087b-474174c4c1d0
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

# ╔═╡ e0937cd4-239d-11eb-141d-1be13a185dca
md"# _Ideal Gas Laws!_
All gases are affected by several variables: Volume, temperature, amount, and pressure. Together, they all affect how a gas behaves. But, before we look at those variables, lets learn the basic rules of gases."

# ╔═╡ 17827eb0-239f-11eb-3266-2d71e0aedd9c
md"## Kinetic Theory of Gases
1. **Gases are mostly empty space** ~ the total number of molecules in any space is much smaller compared to the volume of that space
2. **Gas molecules are in constant, chaotic motion** ~ the molecules constantly collide with eachother and the container walls
3. **Collisions are elastic** ~ there is no energy loss during collisions nor are there attractive forces that keep the molecules together
4. **Gas pressure is caused by collisions of molecules against the walls of a container** ~ Pressure increases as the energy and frequency of the collisions increase.
"

# ╔═╡ e51f5ba4-239f-11eb-0d73-cbb2f0b727b7
md" Now that we understand how gases behave generally, lets look at specific variables that impact gases"

# ╔═╡ 07010ba2-23a0-11eb-2656-b12946848a01
md"## Relationship: Volume and Temperature
Before we look into the relationship between the two, it is important to understand several distinctions about each variable.

**Volume of a Gas equals Volume of a Container** : Gases will expand uniformly to fill any containers that it was placed in which means the volume of the container equals the volume of the gas."

# ╔═╡ 3b34ea3a-23a1-11eb-31b5-3171d41bc984
md"**Temperature in Kelvin**: Whenever discussing the behavior of gas, it is very important to use kelvin temperature. To relate this back to celsius, lets look at a conversion equation."

# ╔═╡ 1b88d926-23a3-11eb-0d2e-7f8a2fa4eb1b
md"""Move the slider to change the degrees in Celsius and to see how that affects the temperature in kelvin: """

# ╔═╡ 9f4d4afa-23a4-11eb-082b-cf05aa408069
 @bind C html"<input type=range>"

# ╔═╡ a34f586e-23a4-11eb-3ac3-13713ac16268
md"$C degrees Celsius equates to"
	

# ╔═╡ 65a88f26-23a4-11eb-02af-8998dbbbcf7f
TemperatureK= C + 273.15

# ╔═╡ c3f552c0-23a5-11eb-2174-33ebd9de1cff
begin
	
	md" The equation to calculate kelvin from celsius is T(k) = C + 273.15"
end

# ╔═╡ cc464fea-23a5-11eb-3e9e-87f62b2a4faf
md" Now that we know the basics of Volume and temperature, lets examine their relationship!"

# ╔═╡ e450fb58-23a5-11eb-2caa-639830646520
md".............................................................................................................................................................................................................."

# ╔═╡ 466d76b8-2475-11eb-32e4-19a694079c2c
md"**VOLUME is DIRECTLY PROPORTIONAL to absolute TEMPERATURE**"

# ╔═╡ a50225d4-2475-11eb-3c89-9b50dc329236
md" Volume does not depend on the type of gas you have because all the gases behave the same. So, for all gases, as the temperature increases, so does the volume."

# ╔═╡ 4a55c8d8-2476-11eb-07d3-9b01d5e70a1e
Temperature = [0,50,100,150,200,250,300]

# ╔═╡ 008ce65e-2490-11eb-3b8a-f91d3cb8e452
Volume = [0,1,2,3,4,5,6]

# ╔═╡ bc1d2f24-2476-11eb-0c81-17c4da48b190


# ╔═╡ 68c8e54c-2490-11eb-3d2b-dd73b9af11cf
plot(Temperature, Volume,legend=false, xlabel="Temperature(K)", ylabel="Volume(L)", title="Correlation between Temperature and Volume") 

# ╔═╡ be952f68-2476-11eb-049b-1beb8f592f70
md"Since the relationship is directly proportional, we can use this principle and apply it into the equation `V1/T1 = V2/T2`. This equation is apart of a larger equation which we will cover later on in this section"

# ╔═╡ bf35d8e4-2476-11eb-078b-3b6b1f5fa04e
md"Now, lets move on to a different relationship: the relationship between amount and volume."

# ╔═╡ e5a02fd2-2475-11eb-3f1e-152a7a3a43ce
md"## Relationship: Volume and Amount
We understand a lot about volume, but before we can look into the relationship between amount and volume, we need to understand amount and the general assumptions we make about the relationship between volume and amount."

# ╔═╡ dfb0faac-24e3-11eb-350d-d7b5fed50b49
md"First, amount usually expressed in **moles**, the international unit for measuring the amount of a substance. This can be converted into grams(which depends on the substance you are looking for) or moles(which has the conversion factor of 6.022*10^23). Second, when we examine the relationship between volume and amount, it is assumed that the volume of the container is NOT fixed. This is important because if the volume is fixed, other variables are changed and you are no longer examining the relationship between amount and volume. Now lets talk about their relationship!"

# ╔═╡ dc0e97cc-24e5-11eb-215e-5dd5e41f7946
md"**VOLUME is DIRECTLY PROPORTIONAL to AMOUNT**"

# ╔═╡ f5e00744-24e5-11eb-3760-a75ea6b16b9c
md" The relationship between volume and amount is similar to volume and temperature. Assuming that the volume is not fixed, the more moles of a substance you have, the greater the volume. This is because as you increase the number of particles, the volume has to expand to keep everything constant."

# ╔═╡ 89333174-24e6-11eb-36d3-71f27b566e4f
begin
	plotly()
	NumberofMoles = [0.0,0.05,0.1,0.15,0.2,0.25,0.3]
	Volume2 = [0.0,1.0,2.0,3.0,4.0,5.0,6.0]
end

# ╔═╡ ee6eac6c-24e6-11eb-2df9-1fb31e1f2c96
plot(NumberofMoles, Volume2,legend=false, xlabel="Number of Moles", ylabel="Volume(L)", title="Correlation between Amount and Volume") 

# ╔═╡ d504768c-27b9-11eb-2a2c-e5ccce269690
md"Since the relationship is directly proportional, we can use this principle and apply it into the equation `V1/N1 = V2/N2`. This equation is also apart of a larger equation which we will cover later on in this section"

# ╔═╡ e82d8afa-27b9-11eb-0ad1-417d616337dd
md"Now lets discuss the next component: Pressure and Temperature"

# ╔═╡ 075ec916-27ba-11eb-3ea2-a516b703aa90
md"## Relationship: Pressure and Temperature
Before we look at the relationship between temperature and pressure, lets understand some basic facts about pressure"

# ╔═╡ 2f624a46-27ba-11eb-205a-3b78744f49af
md" Pressure is defined as **force per unit area**. In the context of gases, as mentioned in the kinetic theory of gases, pressure in gases is caused by collisions into particles or the walls of a container. There are several ways to measure pressure, and each way depends on the conditions in which the pressure is measured. A **manometer** measures pressure in a closed system. This means that it will measure the pressure of a sealed container. A **barometer** measures pressure in a open system, like the atmosphere."

# ╔═╡ 82beda50-27bb-11eb-11af-c75e38f6fa2a
md"Pressure forms based on the number of collisions in particles. The greater the number of collisions, the higher the pressure. Since more collisions are a direct result of increase in temperature, we can say that the higher the temperature, the higher the pressure.(This is assuming that volume remains constant)"

# ╔═╡ 59e62f4e-2f62-11eb-097e-f32238a77ec4
Temperature2 = [0,50,100,150,200,250,300]

# ╔═╡ 9762122c-2f62-11eb-03f7-ff2dc854fe40
Pressure = [0,1,2,3,4,5,6]

# ╔═╡ a00adb0c-2f62-11eb-2dec-23a060be15cc
plot(Temperature2, Pressure,legend=false, xlabel="Temperature(Kelvin)", ylabel="Pressure(atm)", title="Correlation between Pressure and Temperature") 

# ╔═╡ d10de92c-2f62-11eb-15c6-9b30bca82516
md"Pressure is directly proportional to Temperature so when the temperature increases, pressure also increases. The equation for this is `P1/T1 = P2/T2`. Now lets look at the final relationship before putting everything together"

# ╔═╡ bd83ed76-2f66-11eb-08df-338b5985c137
md" ## Relationship: Volume and Pressure
This relationship is different from the rest because the relationship between volume and temperature is inversly proportional to pressure. As the volume increases, the pressure decreases and as the volume decreases, the pressure increases. This happens because as the volume increase, the molecules have a lot more room to move around so less collisions happen which means less pressure. On the flipside, when volume decreases, there is less space for the molecules to move around so they collide more often and those collisions result in an increase in pressure."

# ╔═╡ 8d3afe88-2f67-11eb-308e-ad7440ee187c
Volume3 = [11,6,3,2,1.5,1.25,1]

# ╔═╡ 28b7c798-2f67-11eb-1ee7-ff083e19acaf
plot(Pressure, Volume3 ,legend=false, xlabel="Pressure(atm)", ylabel="Volume(L)", title="Correlation between Volume and Pressure") 

# ╔═╡ d3129b2a-2f67-11eb-15b7-c9bac218038c
md"Now we understand each component, Volume, pressure, temperature, and moles, and their relationships with eachother, we can put all the factors together to form one equation."

# ╔═╡ f8bbb5ba-2f67-11eb-32ef-bbc3f87fa010
md" ## Ideal Gas Law Formula
The Ideal Gas formula is
$\ce{PV=nRT}$ , where P stands for pressure, V stands for volume, n stands for moles, and T stands for temperature. The R is a special value called the gas constant, which stays the same no matter the calculation. R = 0.0821. Understanding this, you can now solve for each individual variable. "


# ╔═╡ Cell order:
# ╟─e0937cd4-239d-11eb-141d-1be13a185dca
# ╟─17827eb0-239f-11eb-3266-2d71e0aedd9c
# ╟─e51f5ba4-239f-11eb-0d73-cbb2f0b727b7
# ╟─07010ba2-23a0-11eb-2656-b12946848a01
# ╟─3b34ea3a-23a1-11eb-31b5-3171d41bc984
# ╠═1b88d926-23a3-11eb-0d2e-7f8a2fa4eb1b
# ╠═9f4d4afa-23a4-11eb-082b-cf05aa408069
# ╠═a34f586e-23a4-11eb-3ac3-13713ac16268
# ╠═65a88f26-23a4-11eb-02af-8998dbbbcf7f
# ╟─c3f552c0-23a5-11eb-2174-33ebd9de1cff
# ╟─cc464fea-23a5-11eb-3e9e-87f62b2a4faf
# ╟─e450fb58-23a5-11eb-2caa-639830646520
# ╟─466d76b8-2475-11eb-32e4-19a694079c2c
# ╟─a50225d4-2475-11eb-3c89-9b50dc329236
# ╟─126b1cca-2476-11eb-087b-474174c4c1d0
# ╠═4a55c8d8-2476-11eb-07d3-9b01d5e70a1e
# ╠═008ce65e-2490-11eb-3b8a-f91d3cb8e452
# ╟─bc1d2f24-2476-11eb-0c81-17c4da48b190
# ╟─68c8e54c-2490-11eb-3d2b-dd73b9af11cf
# ╟─be952f68-2476-11eb-049b-1beb8f592f70
# ╟─bf35d8e4-2476-11eb-078b-3b6b1f5fa04e
# ╟─e5a02fd2-2475-11eb-3f1e-152a7a3a43ce
# ╟─dfb0faac-24e3-11eb-350d-d7b5fed50b49
# ╟─dc0e97cc-24e5-11eb-215e-5dd5e41f7946
# ╟─f5e00744-24e5-11eb-3760-a75ea6b16b9c
# ╟─89333174-24e6-11eb-36d3-71f27b566e4f
# ╟─ee6eac6c-24e6-11eb-2df9-1fb31e1f2c96
# ╟─d504768c-27b9-11eb-2a2c-e5ccce269690
# ╟─e82d8afa-27b9-11eb-0ad1-417d616337dd
# ╟─075ec916-27ba-11eb-3ea2-a516b703aa90
# ╟─2f624a46-27ba-11eb-205a-3b78744f49af
# ╟─82beda50-27bb-11eb-11af-c75e38f6fa2a
# ╟─59e62f4e-2f62-11eb-097e-f32238a77ec4
# ╟─9762122c-2f62-11eb-03f7-ff2dc854fe40
# ╟─a00adb0c-2f62-11eb-2dec-23a060be15cc
# ╟─d10de92c-2f62-11eb-15c6-9b30bca82516
# ╟─bd83ed76-2f66-11eb-08df-338b5985c137
# ╟─8d3afe88-2f67-11eb-308e-ad7440ee187c
# ╟─28b7c798-2f67-11eb-1ee7-ff083e19acaf
# ╟─d3129b2a-2f67-11eb-15b7-c9bac218038c
# ╟─f8bbb5ba-2f67-11eb-32ef-bbc3f87fa010
