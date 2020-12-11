### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ 0edbe34a-3714-11eb-1350-af72689d8855
md" ## _Data Structures_
In this lesson we will study how data can be collected and stored in memory. In particular we will deal with vectors, matrices, n-dimensional arrays, tuples and dictionaries.
"

# ╔═╡ 4ef2e454-3716-11eb-3014-774db1fb57d0
md" ## Vectors
A vector is a list of ordered data which share a common type (be it `Int`, `Float` or `Any`). Furthermore a vector is a one-dimensional array, and often “vector” and “array” are used a synonyms.

Contrarily to the mathematical definition of a vector, in programming a vector is simply a list of values and has no a priori geometrical meaning.

In Julia, to create a vector we use the following syntax:
"

# ╔═╡ 9833f658-3716-11eb-300e-d3b5d02b70e5
a = [1,2,3,4,5]

# ╔═╡ b2cbd7d8-3716-11eb-15cc-03c3fec2c981
b = [1.2, 3,4,5]

# ╔═╡ b2d549da-3716-11eb-0cce-b703452d7f34
c = ["Hello", "it's me", "TechyTok"]

# ╔═╡ bbe66bfa-3716-11eb-1929-ef53e271e354
md" We can access the members of an array using the indexing syntax: `array_name[element_number]`, for example, if we want to retrieve the third element of c we type `c[3]`. Contrarily to other programming languages, in **Julia vectors start at 1**, there is not much to say, it is just like that.
"

# ╔═╡ d5c03624-3716-11eb-38ed-3f395efc01f6
c[2], a[3], b[1]

# ╔═╡ e7768e7e-3716-11eb-366a-2f81166da844
md"If you want to append an element to an array, we can do it by using the `append!` function. Notice the !, this is a Julia convention to say that the function will modify the first argument given to the function, in fact `append!(a, 6)` results in `a = [1, 2, 3, 4, 5, 6]`.

Previously I have said that vector elements must share the same type, if we try to append (or add) a value to an array with a different type it will result into an error:
"

# ╔═╡ 5268b19c-3717-11eb-3854-ddd093a61057
append!(a, 3.14)

# ╔═╡ 6ced58c6-3717-11eb-1009-7909ebb6866b
md"In this case, we cannot convert a Float64 to an Int64 without losing precision, thus the error.

To check the type of an array we can type:
"

# ╔═╡ f2cb5918-3717-11eb-2b4b-77642fbeaf20
typeof(a)

# ╔═╡ ff24fcbc-3717-11eb-2ac3-6f18fde9484f
md"As we can see, `a` can only store `Int64` values or values that can be safely converted to `Int64` (such as `Int32` for example).

An alternative way to define a Vector, if we want to specify the type of the elements included, is by using a type name followed by a square bracket and the desired elements:
"

# ╔═╡ 21342288-3718-11eb-1b86-8d438637ac3a
d = Int[1,2,3,4,5]

# ╔═╡ 3fb54d2c-3718-11eb-305f-e7159394ac7b
md" ## Matrices
Matrices are two dimensional arrays. We can define a matrix with the following syntax:
"

# ╔═╡ 4c2a11c8-3718-11eb-0f59-8382e767058f
mat1 = [1 2 3; 4 5 6]

# ╔═╡ 538463b0-3718-11eb-03e7-171beded2a41
md"Rows are separated by semi colons ; and columns are separated by spaces.

When we want to access the elements of a matrix, we use the following notation `mat1[row_index, column_index]`. If we want to access the 2nd element of the first row we shall write `mat1[1, 2]`.
"

# ╔═╡ 6ed4e510-3718-11eb-3d00-9f60abc37333
md" ## N-Dimensional Arrays
Sometimes we need to create tables with more than 2 dimensions. In this case usually the tables tend to be big, so there is no explicit way to create an n-dimensional array. The suggested practice is to create an empty array first, using a new function called `zeros`, and then fill it either manually of using a loop.

For example, let’s suppose we want to create a 2x3x4 table, we would do it with `zeros(2,3,4)`. Let’s suppose we want to fill it with the product of the indexes, we can do it in the following way:

"

# ╔═╡ 9a27ee68-3718-11eb-1c7f-33eaf6e7cb3f
table = zeros(2,3,4)

# ╔═╡ ab83ddde-3718-11eb-0847-9fdeaca6d470
for k in 1:4
    for j in 1:3
        for i in 1:2
            table[i,j,k] = i*j*k
        end
    end
end

# ╔═╡ bbbc6720-3718-11eb-2c1e-978871157853
table

# ╔═╡ d3ce8154-3718-11eb-08ff-7b29208c5099
md" Please not that Julia stores values in memory differently from Python: in Julia to obtain fast loops we need to iter first over columns (which means that the first index must vary first and so on). For this reason if we plan to store, for example, 42 2x2 matrices, we need to create an array of size 2x2x42 (while in Python we would have created a 42x2x2 table).
"

# ╔═╡ df969238-3718-11eb-2196-a7a68b5a69f2
md" ## Slices
There is a convenient notation (called **slicing**) to access a subset of elements from an array. Let’s suppose we want to access the 2nd to 5th elements of an array of length 6, we can do it in the following way:

"

# ╔═╡ f82b9558-3718-11eb-0ef8-5fa509ba5b6f
begin
	e = [1,2,3,4,5,6]
	f = e[2:5]
end

# ╔═╡ 6ffa0c1a-3719-11eb-34d2-d7fc89a62e24
md"We can also use this notation to access a subset of a matrix, for example:
"

# ╔═╡ 7edb458c-3719-11eb-2bb3-4bd9173b530c
mat3 = reshape([i for i in 1:16],4,4)

# ╔═╡ 8bae5826-3719-11eb-084e-fbf852773ffd
mat4 = mat3[2:3, 2:3]

# ╔═╡ a17c0086-3719-11eb-1ab0-2381decb5422
md"On line 1 we have used a handy notation called **list comprehension**. `[i for i in 1:16]` means “create an array containing each i comprised from 1 to 16”. We then reshape it to have a size of 4x4 and store the result in `mat1`.

It is also possible to have nested list comprehensions like this one:
"

# ╔═╡ c62a2930-3719-11eb-3c28-750300385ad8
[i+j for i in 1:10 for j in 1:5]

# ╔═╡ e07fe63a-3719-11eb-05eb-81512953fb4b
md"This will create an array of length 50 containing all the sums of i+j.
"

# ╔═╡ 2655af78-371a-11eb-331c-310db7a9ccb1
md" ## Views
As in other programming languages, arrays are pointers to location in memory, thus we need to pay attention when we handle them.

If we create an array `g` and we assign a to `h` with `h=g`, the elements of `g` be modified by accessing `h`:
"

# ╔═╡ 3cdd35ea-371a-11eb-0f7f-135c3a766ecd
g=[1,2,3]

# ╔═╡ 67a3d7f2-371a-11eb-07cb-e3e233e2aab1
h=g

# ╔═╡ 67ad9e04-371a-11eb-36ad-9710ff0b0db3
g[2] = 42

# ╔═╡ 67bdc450-371a-11eb-08b2-55230f42c0e8
g

# ╔═╡ b2873584-371a-11eb-328d-37a39540905c
md"
This is particularly useful because it lets us save memory, but may have undesirable effects. If we want to make a copy of an array we need to use the function `copy`.
"

# ╔═╡ c17d2258-371a-11eb-25b5-933f413cd134
i=[1,2,3]

# ╔═╡ d902ab08-371a-11eb-31ce-8d50b3388b2b
j=copy(i)

# ╔═╡ d90d570e-371a-11eb-0e4b-075841a6a73a
j[2] = 42

# ╔═╡ dbfd0a06-371a-11eb-1bf5-e9112227d8b0
i

# ╔═╡ de4b38a0-371a-11eb-39b1-7575188e8063
j

# ╔═╡ ee1a296c-371a-11eb-0036-3b8ad05c6804
md"In some cases, when there are arrays containing other arrays, if we want to make a full copy of all the contents we need to use `deepcopy` instead."

# ╔═╡ f6fa2e36-371a-11eb-36e7-a7de898b78c5
md" ## Tuples
A tuple is a fixed size group of variables which may share a common type but don’t need to.

Unlike arrays, you cannot increase the size of a tuple once it has been created. Tuples are created using the following syntax:
"

# ╔═╡ 0e12b2be-371b-11eb-0e56-99ec2e4a224d
k =(1,2,3)

# ╔═╡ 187b73f0-371b-11eb-34e6-d7a2aeb00b58
l= 1,2,3

# ╔═╡ 1eb587ec-371b-11eb-2901-a1ebf0197aa7
md"
So tuples can be created by using regular brackets or no brackets at all! Tuples are really handy, as it is possible to “unpack” a tuple over many values:
"

# ╔═╡ 2bc6ba1e-371b-11eb-12d0-a3665fe9e1d0
tuple1 = (1, 2, 3)

# ╔═╡ 3985145c-371b-11eb-2dcc-5308e23dc5f0
m, n, o = tuple1

# ╔═╡ 39a4874c-371b-11eb-164c-692fd38680a9
("$m $n $o")

# ╔═╡ 58abede2-371b-11eb-24d3-2b16686937d5
md"
It is also possible to use tuples to emulate multiple return values from functions:
"

# ╔═╡ 6205bad0-371b-11eb-1cfb-3f1ff43c255e
function return_multiple()
    return 42, 43, 44
end

# ╔═╡ 64cd1682-371b-11eb-2097-a9267c1e63dc
p, q, r = return_multiple()

# ╔═╡ 75e813a2-371b-11eb-21d8-3d2bf2e80cac
("$p $r $q")

# ╔═╡ 827ebb9a-371b-11eb-006b-6107854f0a9c
md" ## Splatting
It is possible to “unpack” a tuple and pass its arguments to a function with the following syntax:
"

# ╔═╡ 04ea7b0a-371c-11eb-2827-7d192535d804
function splat_me(s, t, u)
    return s*t*u
end

# ╔═╡ 0e3a8240-371c-11eb-1720-7f7de97d90aa
tuple2 = (1,2,3)

# ╔═╡ 266b7540-371c-11eb-06f2-553a12a3314b
splat_me(tuple2...)

# ╔═╡ 4417da34-371c-11eb-155e-77b5eacbfc88
md" So the `...` after a tuple will unpack it! This is useful but addictive, use it only if needed as it is better for clarity (and to avoid multiple dispatch errors) to call a function with its single parameters.
"

# ╔═╡ 55d5c8a8-371c-11eb-00cf-91fa36d66a01
md" ## Named Tuples
Named tuples are like tuples but with a name identifier for a single value, for example:
"

# ╔═╡ 68bde3ec-371c-11eb-0aa7-8161a51fdbf5
namedTuple1 = (a = 1, b = "hello")

# ╔═╡ 6ba908ca-371c-11eb-1126-cfcbeb01cb0d
namedTuple1[:a]

# ╔═╡ 9b678d86-371c-11eb-0b34-2917771de661
md" or in alternative:
"

# ╔═╡ 83a9ac22-371c-11eb-09d9-c75f570c9b31
namedTuple2 = NamedTuple{(:a, :b)}((2,"hello2"))

# ╔═╡ 89ade9bc-371c-11eb-21aa-8f0831a9fff5
namedTuple2[:b]

# ╔═╡ 970399ea-371c-11eb-0cee-b54e5f3f5498
md"## Dictionaries
A dictionary is a collection of keys and values. They are unordered (which means that the order of the keys is random) and are really useful when you need to organise, for example, a dataset.

Let’s suppose we want to create an address book. A single entry should be able to store all the fundamental characteristics needed to identify a friend: the name of the contact, the phone number and the shoe size!
"


# ╔═╡ 706e79fc-371d-11eb-0894-ebb085103956
person1 = Dict("Name" => "Peppa", "Phone" => 123456789, "Shoe-size" => 40)

# ╔═╡ 7f46d19a-371d-11eb-2971-ef0eda3d5d18
person2 = Dict("Name" => "George", "Phone" => 123456789, "Shoe-size" => 36)

# ╔═╡ 9648198a-371d-11eb-3c9f-9338602af4af
md"I can even make a dictionary containing other dictionaries:
"

# ╔═╡ a25da512-371d-11eb-33ea-0f0740b919e3
addressBook = Dict("Peppa" => person1, "George" => person2)

# ╔═╡ ee8143ec-371d-11eb-3c9b-754027e67304
md"
We can add another friend to the addressBook , once it has been created, with the following syntax:
"

# ╔═╡ f94e1d2c-371d-11eb-0e5c-819b938a8d00
person3 = Dict("Name" => "Vittorio", "Phone" => 123456789, "Shoe-size" => 42)


# ╔═╡ 0560f292-371e-11eb-07de-c55444c0a3d5
addressBook["Vittorio"] = person3

# ╔═╡ 0ac0ae12-371e-11eb-3d9a-a7ef8aa4f5d9
addressBook

# ╔═╡ 19e817c2-371e-11eb-15ce-5bee1fd2f891
md" ## Conclusion
In this lesson we have learned how to operate on arrays, tuples and dictionaries. Those structures are the basics of in-memory storage for any data. Arrays are lightweight and useful solutions to pass blocks of data, so use them whenever needed! Contrarily to C++, Julia has a built in garbage collector, so you don’t have to care about freeing memory and deleting pointers, as Julia will take care of it!
"

# ╔═╡ Cell order:
# ╟─0edbe34a-3714-11eb-1350-af72689d8855
# ╟─4ef2e454-3716-11eb-3014-774db1fb57d0
# ╠═9833f658-3716-11eb-300e-d3b5d02b70e5
# ╠═b2cbd7d8-3716-11eb-15cc-03c3fec2c981
# ╠═b2d549da-3716-11eb-0cce-b703452d7f34
# ╟─bbe66bfa-3716-11eb-1929-ef53e271e354
# ╠═d5c03624-3716-11eb-38ed-3f395efc01f6
# ╟─e7768e7e-3716-11eb-366a-2f81166da844
# ╠═5268b19c-3717-11eb-3854-ddd093a61057
# ╟─6ced58c6-3717-11eb-1009-7909ebb6866b
# ╠═f2cb5918-3717-11eb-2b4b-77642fbeaf20
# ╟─ff24fcbc-3717-11eb-2ac3-6f18fde9484f
# ╠═21342288-3718-11eb-1b86-8d438637ac3a
# ╟─3fb54d2c-3718-11eb-305f-e7159394ac7b
# ╠═4c2a11c8-3718-11eb-0f59-8382e767058f
# ╟─538463b0-3718-11eb-03e7-171beded2a41
# ╟─6ed4e510-3718-11eb-3d00-9f60abc37333
# ╠═9a27ee68-3718-11eb-1c7f-33eaf6e7cb3f
# ╠═ab83ddde-3718-11eb-0847-9fdeaca6d470
# ╠═bbbc6720-3718-11eb-2c1e-978871157853
# ╟─d3ce8154-3718-11eb-08ff-7b29208c5099
# ╟─df969238-3718-11eb-2196-a7a68b5a69f2
# ╠═f82b9558-3718-11eb-0ef8-5fa509ba5b6f
# ╟─6ffa0c1a-3719-11eb-34d2-d7fc89a62e24
# ╠═7edb458c-3719-11eb-2bb3-4bd9173b530c
# ╠═8bae5826-3719-11eb-084e-fbf852773ffd
# ╟─a17c0086-3719-11eb-1ab0-2381decb5422
# ╠═c62a2930-3719-11eb-3c28-750300385ad8
# ╟─e07fe63a-3719-11eb-05eb-81512953fb4b
# ╟─2655af78-371a-11eb-331c-310db7a9ccb1
# ╠═3cdd35ea-371a-11eb-0f7f-135c3a766ecd
# ╠═67a3d7f2-371a-11eb-07cb-e3e233e2aab1
# ╠═67ad9e04-371a-11eb-36ad-9710ff0b0db3
# ╠═67bdc450-371a-11eb-08b2-55230f42c0e8
# ╟─b2873584-371a-11eb-328d-37a39540905c
# ╠═c17d2258-371a-11eb-25b5-933f413cd134
# ╠═d902ab08-371a-11eb-31ce-8d50b3388b2b
# ╠═d90d570e-371a-11eb-0e4b-075841a6a73a
# ╠═dbfd0a06-371a-11eb-1bf5-e9112227d8b0
# ╠═de4b38a0-371a-11eb-39b1-7575188e8063
# ╟─ee1a296c-371a-11eb-0036-3b8ad05c6804
# ╟─f6fa2e36-371a-11eb-36e7-a7de898b78c5
# ╠═0e12b2be-371b-11eb-0e56-99ec2e4a224d
# ╠═187b73f0-371b-11eb-34e6-d7a2aeb00b58
# ╟─1eb587ec-371b-11eb-2901-a1ebf0197aa7
# ╠═2bc6ba1e-371b-11eb-12d0-a3665fe9e1d0
# ╠═3985145c-371b-11eb-2dcc-5308e23dc5f0
# ╠═39a4874c-371b-11eb-164c-692fd38680a9
# ╟─58abede2-371b-11eb-24d3-2b16686937d5
# ╠═6205bad0-371b-11eb-1cfb-3f1ff43c255e
# ╠═64cd1682-371b-11eb-2097-a9267c1e63dc
# ╠═75e813a2-371b-11eb-21d8-3d2bf2e80cac
# ╟─827ebb9a-371b-11eb-006b-6107854f0a9c
# ╠═04ea7b0a-371c-11eb-2827-7d192535d804
# ╠═0e3a8240-371c-11eb-1720-7f7de97d90aa
# ╠═266b7540-371c-11eb-06f2-553a12a3314b
# ╟─4417da34-371c-11eb-155e-77b5eacbfc88
# ╟─55d5c8a8-371c-11eb-00cf-91fa36d66a01
# ╠═68bde3ec-371c-11eb-0aa7-8161a51fdbf5
# ╠═6ba908ca-371c-11eb-1126-cfcbeb01cb0d
# ╠═9b678d86-371c-11eb-0b34-2917771de661
# ╠═83a9ac22-371c-11eb-09d9-c75f570c9b31
# ╠═89ade9bc-371c-11eb-21aa-8f0831a9fff5
# ╟─970399ea-371c-11eb-0cee-b54e5f3f5498
# ╠═706e79fc-371d-11eb-0894-ebb085103956
# ╠═7f46d19a-371d-11eb-2971-ef0eda3d5d18
# ╟─9648198a-371d-11eb-3c9f-9338602af4af
# ╠═a25da512-371d-11eb-33ea-0f0740b919e3
# ╠═ee8143ec-371d-11eb-3c9b-754027e67304
# ╠═f94e1d2c-371d-11eb-0e5c-819b938a8d00
# ╠═0560f292-371e-11eb-07de-c55444c0a3d5
# ╠═0ac0ae12-371e-11eb-3d9a-a7ef8aa4f5d9
# ╟─19e817c2-371e-11eb-15ce-5bee1fd2f891
