### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e5013406-485e-11eb-1923-bf36ce0e5db9
using LightGraphs

# ╔═╡ 010aa6a0-485f-11eb-0fef-3963df8e593e
using GraphRecipes

# ╔═╡ 2c0483c6-485f-11eb-19a0-07f4e49962ff
using PGFPlotsX

# ╔═╡ 32dae7ee-485f-11eb-184a-85e8e38c594c
using Plots

# ╔═╡ f785d38e-485e-11eb-3937-13c79e021ccd
import Pkg

# ╔═╡ 5d70213c-485e-11eb-3141-27d44a424b79
md" ## _Types_
In this lesson we will learn what types are and how it is possible to define functions that work on types. We will learn which are the differences between abstract and concrete types, how to define immutable and mutable types and how to create a type constructor. We will give a brief introduction to multiple dispatch and see how types have a role in it.

We can think of types as containers for data only. Moreover, it is possible to define a type hierarchy so that functions that work for parent type work also for the children (if they are written properly). A parent type can only be an AbstractType (like Number), while a child can be both an abstract or concrete type.
"

# ╔═╡ 99ddb7ea-485e-11eb-153a-0511e9047049
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

# ╔═╡ 58d29492-485f-11eb-3feb-83d5046d9925
md" ## Implementation

To declare a Type we use either the type or struct keyword.

To declare an abstract type we use:"

# ╔═╡ 89001274-4860-11eb-115f-8ff6a4faa465
begin
	abstract type Person
	end
	
	abstract type Musician <: Person
	end
end

# ╔═╡ 91937b60-4860-11eb-12d2-592e8eeb7768
md"You may find it surprising, but apparently musicians are people, so Musician is a sub-type of Person. There are many kind of musicians, for example rock-stars and classic musicians, so we define two new concrete types (in particular this kind of type is called a composite type):"

# ╔═╡ 9bd7a6aa-4860-11eb-1c4b-c3be7d059e26
begin
	mutable struct Rockstar <: Musician
		name::String
		instrument::String
		bandName::String
		headbandColor::String
		instrumentsPlayed::Int
	end
	
	struct ClassicMusician <: Musician
		name::String
		instrument::String
	end
end

# ╔═╡ a3a8b202-4860-11eb-390e-95f6823e90aa
md"Notably rock-stars love to change the colour of their headband, so we have made Rockstar a mutable struct, which is a concrete type whose elements value can be modified. On the contrary, classic musicians are known for their everlasting love for their instrument, which will never change, so we have made ClassicMusician an immutable concrete type.

We can define another sub-type of Person, Physicist, as I am a physicist and I was getting envious of rock-stars:"

# ╔═╡ c7a5a778-4860-11eb-187e-bdf191565e2b
begin
	begin
		mutable struct Physicist <: Person
			name::String
			sleepHours::Float64
			favouriteLanguage::String
		end
		
		aure = Physicist("Aurelio", 6, "Julia")
	end
end

# ╔═╡ d3528442-4860-11eb-389b-c300063289aa
aure.name

# ╔═╡ fe554d64-4860-11eb-0f32-a178f0f21ff9
aure.sleepHours

# ╔═╡ 04a67940-4861-11eb-323d-49e8563f4a29
aure.favouriteLanguage

# ╔═╡ 111c30b6-4861-11eb-2281-0773165d8ecb
md"Luckily my exam session is over now and I finally have a little bit more time to sleep, so I’ll adjust my sleeping schedule to sleep eight hours:"

# ╔═╡ 1a4db196-4861-11eb-02f7-670caaeb9562
aure.sleepHours = 8

# ╔═╡ 21b56708-4861-11eb-1253-8f00dba8057c
aure.sleepHours

# ╔═╡ 2845cbd0-4861-11eb-1809-5b08f407c467
md"Incidentally I am also a ClassicMusician and I play violin, so I can create a new structure:"

# ╔═╡ 31e88ce0-4861-11eb-2c03-5976cdc914c7
aure_musician = ClassicMusician("Aurelio", "Violin")

# ╔═╡ 3ba8006c-4861-11eb-2da3-19bd73a95bbf
aure_musician.instrument = "Cello"

# ╔═╡ 46b194e6-4861-11eb-0c5d-39996e11e48e
md"As you can see, I love violin and I just can’t change my instrument, as ClassicMusician is an immutable struct.

I am not a rock-star, but my friend Ricky is one, so we’ll define:"

# ╔═╡ 5995feda-4861-11eb-12f5-bb97dd2330c8
ricky = Rockstar("Riccardo", "Voice", "Black Lotus", "red", 2)

# ╔═╡ 662bb806-4861-11eb-2850-39fb55ddbb6b
ricky.headbandColor

# ╔═╡ 68ff6be8-4861-11eb-10f1-1dda03a33073
md" ## Functions and Types: Multiple Dispatch
It is possible to write functions that operate on both abstract and concrete types. For example, every person is likely to have a name, so we can define the following function:"

# ╔═╡ bd6882e2-4862-11eb-3a7f-794c357d326c
function introduceMe(person::Person)
    println("Hello, my name is $(person.name).")
end


# ╔═╡ d7f9560e-4862-11eb-03ec-99bb75e49bf6
md"While only musicians play instruments, so we can define the following function:"

# ╔═╡ 40e20a1c-4863-11eb-2354-e9da49a7459a
function introduceMe(person::Musician)
    println("Hello, my name is $(person.name) and I play $(person.instrument).")
end


# ╔═╡ 623b7180-4863-11eb-32fa-4b749af28529
md" and for rockstar we can write:"

# ╔═╡ 77c6bf6e-4863-11eb-3354-55ba248b5c50
function introduceMe(person::Rockstar)
	if person.instrument == "Voice"
		println("Hello, my name is $(person.name) and I sing.")
	else
		println("Hello, my name is $(person.name) and I play $(person.instrument).")
	end

	println("My band name is $(person.bandName) and my favourite headband colour is $(person.headbandColor)!")
end

# ╔═╡ d012c286-4862-11eb-35d3-77692b72a1be
introduceMe(aure)

# ╔═╡ 4a3d5c60-4863-11eb-399f-617db3848bfe
introduceMe(aure_musician)

# ╔═╡ 7b0a5d54-4863-11eb-3db4-d3a04521f8c3
md"The ::SomeType notation indicates to Julia that person has to be of the aforementioned type or a sub-type. Only the most strict type requirement is considered (which is the lowest type in the type tree), for example ricky is a Person, but “more importantly” he is a Rockstar (Rockstar is placed lower in the type tree), thus introduceMe(person::Rockstar) is called. In other words, the function with the closest type signature will be called.

This is an example of multiple dispatch, which means that we have written a single function with different methods depending on the type of the variable. We will come back again to multiple dispatch in this lesson, as it is one of the most important features of Julia and is considered a more advanced topic, together with type annotations. As an anticipation ::Rockstar is a type annotation, the compiler will check if person is a Rockstar (or a sub-type of it) and if that is true it will execute the function.

 ## Type constructor

When a type is applied like a function it is called a constructor. When we created the previous types, two constructors were generated automatically (these are called default constructors). One accepts any arguments and calls convert to convert them to the types of the fields, and the other accepts arguments that match the field types exactly (String and String in the case of ClassicMusician). The reason both of these are generated is that this makes it easier to add new definitions without inadvertently replacing a default constructor.

Sometimes it is more convenient to create custom constructor, so that it is possible to assign default values to certain variables, or perform some initial computations."

# ╔═╡ 972fd872-4863-11eb-3b18-2b46a7bf85fb
mutable struct MyData
	x::Float64
	x2::Float64
	y::Float64
	z::Float64
	function MyData(x::Float64, y::Float64)
		x2=x^2
		z = sin(x2+y)
		new(x, x2, y, z)
	end
end


# ╔═╡ a9c2d0ac-4863-11eb-1640-e93121a06e98
MyData(2.0, 3.0)

# ╔═╡ b0a8f75a-4863-11eb-01e2-db6da2c6e3ee
md"Sometimes it may be useful to use other types for x, x2 and y, so it is possible to use parametric types (i.e. types that accept type information at construction time):"

# ╔═╡ ba37472e-4863-11eb-2f79-535974cc8e37
mutable struct MyData2{T<:Real}
	x::T
	x2::T
	y::T
	z::Float64
	function MyData2{T}(x::T, y::T) where {T<:Real}
		x2=x^2
		z = sin(x2+y)
		new(x, x2, y, z)
	end
end


# ╔═╡ c2660f98-4863-11eb-1133-1bfd03b8ca06
MyData2{Float64}(2.0,3.0)

# ╔═╡ c8f4ec08-4863-11eb-2301-f774e405a45d
MyData2{Int}(2,3)

# ╔═╡ db68e9ca-4863-11eb-2e46-975a727a08cf
md" ## Example
Mutable types are particularly useful when it comes to storing data that needs to be shared between some functions inside a module. It is not uncommon to define custom types in a module to store all the data which needs to be shared between functions and which is not constant."

# ╔═╡ f5949efc-4863-11eb-22bf-3f5547ce8624
circle1 = Circle{Float64}(5.0)

# ╔═╡ f5abb4d4-4863-11eb-1545-61a62964aa72
computePerimeter(circle1)

# ╔═╡ f5bf7d48-4863-11eb-1dc7-055b9a8c1bfe
circle1.perimeter

# ╔═╡ f5d0a514-4863-11eb-35e4-d7dabb0ae0b4
computeArea(circle1)

# ╔═╡ f5e298d2-4863-11eb-2178-53d4d230ed42
circle1.area

# ╔═╡ f6119e52-4863-11eb-1e46-a90051f25108
printCircleEquation(2, 3, circle1)

# ╔═╡ 29b3b0bc-4864-11eb-086f-e59856887cb7
md"This is a simple module which implements a Circle type which contains the radius, perimeter and area of the circle. There are three functions which respectively compute the perimeter and area of the circle and store them inside theCircle structure. The third function prints the equation of a circle with a given centre and the radius stored inside a Circle structure.

Notice that we could have simply computed the perimeter and area inside the type constructor, but I have chosen not to do so for educative purposes.

## Conclusions

This lesson has been a little bit more conceptually difficult than the previous ones, but you don’t need to remember everything right now! We will use types in the future lessons, so you will naturally get accustomed to how they works over time.

We have learnt how to define abstract and concrete types, and how to define mutable and immutable structures. We have then learnt how it is possible to define functions that work on custom types and we have introduced multiple dispatch. Furthermore, we have seen how to define an inner constructor, to aid the user create an instance of a composite type. Lastly, we have seen an example of a module which uses a custom type (Circle) to perform and store some specific computations."

# ╔═╡ f58a0762-4863-11eb-3f8a-fb10c45ee27f
#%%

using .TestModuleTypes1

# ╔═╡ e910d4a2-4863-11eb-3bd0-eb35783028b9
module TestModuleTypes1

export Circle, computePerimeter, computeArea, printCircleEquation

mutable struct Circle{T<:Real}
	radius::T
	perimeter::Float64
	area::Float64

	function Circle{T}(radius::T) where T<:Real
		# we initialize perimeter and area to -1.0, which is not a possible value
		new(radius, -1.0, -1.0)
	end
end

@doc raw"""
	computePerimeter(circle::Circle)

Compute the perimeter of `circle` and store the value.
"""
function computePerimeter(circle::Circle)
	circle.perimeter = 2*π*circle.radius
	return circle.perimeter
end

@doc raw"""
	computeArea(circle::Circle)

Compute the area of `circle` and store the value.
"""
function computeArea(circle::Circle)
	circle.area = π*circle.radius^2
	return circle.area
end

@doc raw"""
	printCircleEquation(xc::Real, yc::Real, circle::Circle )

Print the equation of a cricle with center at (xc, yc) and radius given by circle.
"""
function printCircleEquation(xc::Real, yc::Real, circle::Circle )
	println("(x - $xc)^2 + (y - $yc)^2 = $(circle.radius^2)")
	return
end
end # end module

# ╔═╡ Cell order:
# ╠═e5013406-485e-11eb-1923-bf36ce0e5db9
# ╠═f785d38e-485e-11eb-3937-13c79e021ccd
# ╠═010aa6a0-485f-11eb-0fef-3963df8e593e
# ╠═2c0483c6-485f-11eb-19a0-07f4e49962ff
# ╠═32dae7ee-485f-11eb-184a-85e8e38c594c
# ╠═5d70213c-485e-11eb-3141-27d44a424b79
# ╟─99ddb7ea-485e-11eb-153a-0511e9047049
# ╠═58d29492-485f-11eb-3feb-83d5046d9925
# ╠═89001274-4860-11eb-115f-8ff6a4faa465
# ╠═91937b60-4860-11eb-12d2-592e8eeb7768
# ╠═9bd7a6aa-4860-11eb-1c4b-c3be7d059e26
# ╠═a3a8b202-4860-11eb-390e-95f6823e90aa
# ╠═c7a5a778-4860-11eb-187e-bdf191565e2b
# ╠═d3528442-4860-11eb-389b-c300063289aa
# ╠═fe554d64-4860-11eb-0f32-a178f0f21ff9
# ╠═04a67940-4861-11eb-323d-49e8563f4a29
# ╠═111c30b6-4861-11eb-2281-0773165d8ecb
# ╠═1a4db196-4861-11eb-02f7-670caaeb9562
# ╠═21b56708-4861-11eb-1253-8f00dba8057c
# ╠═2845cbd0-4861-11eb-1809-5b08f407c467
# ╠═31e88ce0-4861-11eb-2c03-5976cdc914c7
# ╠═3ba8006c-4861-11eb-2da3-19bd73a95bbf
# ╠═46b194e6-4861-11eb-0c5d-39996e11e48e
# ╠═5995feda-4861-11eb-12f5-bb97dd2330c8
# ╠═662bb806-4861-11eb-2850-39fb55ddbb6b
# ╠═68ff6be8-4861-11eb-10f1-1dda03a33073
# ╠═bd6882e2-4862-11eb-3a7f-794c357d326c
# ╠═d012c286-4862-11eb-35d3-77692b72a1be
# ╠═d7f9560e-4862-11eb-03ec-99bb75e49bf6
# ╠═40e20a1c-4863-11eb-2354-e9da49a7459a
# ╠═4a3d5c60-4863-11eb-399f-617db3848bfe
# ╠═623b7180-4863-11eb-32fa-4b749af28529
# ╠═77c6bf6e-4863-11eb-3354-55ba248b5c50
# ╠═7b0a5d54-4863-11eb-3db4-d3a04521f8c3
# ╠═972fd872-4863-11eb-3b18-2b46a7bf85fb
# ╠═a9c2d0ac-4863-11eb-1640-e93121a06e98
# ╠═b0a8f75a-4863-11eb-01e2-db6da2c6e3ee
# ╠═ba37472e-4863-11eb-2f79-535974cc8e37
# ╠═c2660f98-4863-11eb-1133-1bfd03b8ca06
# ╠═c8f4ec08-4863-11eb-2301-f774e405a45d
# ╠═db68e9ca-4863-11eb-2e46-975a727a08cf
# ╠═e910d4a2-4863-11eb-3bd0-eb35783028b9
# ╠═f58a0762-4863-11eb-3f8a-fb10c45ee27f
# ╠═f5949efc-4863-11eb-22bf-3f5547ce8624
# ╠═f5abb4d4-4863-11eb-1545-61a62964aa72
# ╠═f5bf7d48-4863-11eb-1dc7-055b9a8c1bfe
# ╠═f5d0a514-4863-11eb-35e4-d7dabb0ae0b4
# ╠═f5e298d2-4863-11eb-2178-53d4d230ed42
# ╠═f6119e52-4863-11eb-1e46-a90051f25108
# ╠═29b3b0bc-4864-11eb-086f-e59856887cb7
