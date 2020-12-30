### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ 3786dc10-46bd-11eb-2bcb-1d2ef41250aa
md"## _Variable Scope_
In this lesson we will learn what is the scope of a variable and how scopes can be used to rule when a variable should be accessible in our program.

The scope of a variable is the region of a program where the variable is known and accessible. A variable may live in two kind of scopes: the global scope or a local scope.
"

# ╔═╡ 545598f2-46bd-11eb-22f2-d959fbadc549
md" ## Scope
A variable in the global scope is accessible everywhere in the program and can be modified by any part of the code. When we define a variable in the REPL or outside of a function, for example, we create a global variable.

A variable in a local scope is only accessible in that scope and in other scopes eventually defined inside it.

In Julia there are several constructs which introduces a scope:

[table]

As you can see, some constructs introduce a global scope (for example each module has its separate global scope) and others introduce a local scope (for example functions, for loops and let blocks).

Let’s now see in more details how to work with scopes and in which scope it is better to define a variable, depending on its usage.


"

# ╔═╡ 133c2e68-46be-11eb-2445-fdfd0bdaa763
md" ## Local Scope
Let’s start with a construct we are already familiar with: a function. A function declaration introduce a scope, which means that each variable declared inside a function lives inside the function: it can be accessed freely inside the function but cannot be accessed outside the function, which is good! Thanks to this property we can use the names most suitable for our variables (x, y, z, etc.) without the risk of clashing with the declaration of other functions.

If a value computed inside a function is needed outside the function it is a good idea to return that value instead of modifying a global constant external to the function. As a rule of thumb, a function should rely only on its input parameters and return only the variable which may be useful for further computations.

Let’s see an example of a variable which exist inside a function (local scope) but doesn’t exist in the global scope:
"

# ╔═╡ 24f7ee12-46be-11eb-3c97-05eb5e3a94c5
function example1()
    z = 42
    return
end

# ╔═╡ 2e56a278-46be-11eb-2592-6bc4a396d786
z

# ╔═╡ 3131345e-46be-11eb-1f2f-5d46726895dd
md" Although it is not advisable, it is possible to specify that a variable should be accessed in the global scope through:"

# ╔═╡ 3b64e420-46be-11eb-3a85-91a45197b5f7
function example2()
    global f = 42
    return
end


# ╔═╡ 4176df1e-46be-11eb-333e-9fbdf98b9ce9
example2()

# ╔═╡ 48822334-46be-11eb-0584-ed06686b4512
f

# ╔═╡ 56d6a844-46be-11eb-24a2-c912c5f6fae9
md"A better approach is instead to return z and let the user perform the allocation of z:"

# ╔═╡ 5e48ad82-46be-11eb-2af9-65d9f9dc3706
function example3()
    a = 42
    return a
end

# ╔═╡ 6628c890-46be-11eb-1b5f-a9dbe523ddb0
a = example3()

# ╔═╡ 6cea7e2c-46be-11eb-2a3e-b57d731a344c
a

# ╔═╡ 71dc1a96-46be-11eb-3b0e-e9ebcdb58206
md"In the case where it is necessary to distinguish between a variable which exists both in the local and global scope, it is possible to indicate the one that needs to be used through the global or local annotation before the desired variable."

# ╔═╡ 842e513c-46be-11eb-2754-fb974f8215e1
md" ## `Let` construct
The let construct can be used to introduce a new local scope. It is useful, for example, when you want to perform some computations but you don’t want the intermediate results/variables to pollute your current scope.

The let block will be able to access all the local (or global) variables available in its parent scope and will have its own set of local variables. It is also possible to specify some initial values to mimic the execution of a function once.
"

# ╔═╡ d303a000-46be-11eb-176d-65500635036f
b = let
    i=3
    i+=5
    i # the value returned from the computation
end

# ╔═╡ ddf0800a-46be-11eb-0caf-4fe37ba18934
b

# ╔═╡ e2dac2ce-46be-11eb-2e88-497a6c781222
d = let i=5
    i+=42
    i
end

# ╔═╡ ead5ea30-46be-11eb-2f46-658d41f10b20
d

# ╔═╡ f0dac34c-46be-11eb-14e8-e5ecb26ad036
e = let i=10
    i+=42
    i
end


# ╔═╡ f84bf7fe-46be-11eb-0416-79962d5dc4c6
e

# ╔═╡ fc3b5f26-46be-11eb-2655-6518d17e8ed4
md" As you can see, let blocks are pretty convenient when it comes to splitting computations over several lines, but there are other possible uses as shown here.

let blocks are somewhat similar to begin blocks, although begin blocks don’t introduce a local scope:"

# ╔═╡ 07e31486-46bf-11eb-11a0-ebb16fec9196
h = begin
    i=41
    i+=1
    i
end


# ╔═╡ 11e32cdc-46bf-11eb-105d-797889dcae00
h

# ╔═╡ 1ab5cdc4-46bf-11eb-0012-2b62db002c87
i

# ╔═╡ 1cc2fa2e-46bf-11eb-353d-bdd66ee27a35
md" ## Global Scope
Whenever we define a variable in the REPL or in general outside a construct which introduces a local scope, we place a variable in the global scope. The global scope is accessible everywhere in the program and a variable in the global scope can be modified by any part of the code. As such, it is generally advisable to avoid using global variables as much as possible, in fact since global variables can change their type and value at any time, they cannot be properly optimised by the compiler.

## Constants
One way to mitigate this performance issue is to define global variables as constants through the const annotation. When we think of a constant we generally imagine a variable which is immutable, for example the speed of light: the speed of light is a number and so it could be expressed by a Float64, there is no need to change its type, once it has been defined, to a String, in this case.

A constant in Julia is a variable which cannot change its type once it is defined (Julia will throw an error if there is an attempt to modify the type of a constant) and Julia will show a warning message if we try to modify the value of a constant. Since a constant is “type immutable” it can be properly optimised by the compiler and there are fewer performance issues.
"

# ╔═╡ 388c5d7c-46bf-11eb-1895-838457ae5907
const C = 299792458 # m / s, this is an Int

# ╔═╡ 442e44ba-46bf-11eb-21c3-171917b0c529
C1 = 300000000 # change the value of C

# ╔═╡ 5e76217e-46bf-11eb-1628-ef847aaa8267
C3 = 2.998 * 1e8 # change the type of C, not permitted

# ╔═╡ 7283fbde-46bf-11eb-2a2f-09036a699556
md" ## Modules
As we have anticipated, modules introduce separate global scope, which means that a variable which is known inside a module will not be accessible outside of the module unless it is exported or it is accessed through the ModuleName.varName notation.
"

# ╔═╡ 9970bdb8-46bf-11eb-3e48-0387b0d3f4f5
module ScopeTestModule
export a1
a1 = 25
b1 = 42
end

# ╔═╡ 9ca99a52-46bf-11eb-04b0-73214c9cc4cc
a1

# ╔═╡ a5560d4a-46bf-11eb-1c4b-6993cf3cbb7b
b1

# ╔═╡ c2cfd8ba-46bf-11eb-2072-e7b1f8a7f013
ScopeTestModule.b1

# ╔═╡ c6d83970-46bf-11eb-2ec1-cf03f0290a6b
ScopeTestModule.b1=26

# ╔═╡ d0caf5ee-46bf-11eb-1120-65d881285044
md"At line 9-10 we can see that the a1 variable, which is exported by the module, can be accessed directly without specifying the scope of the variable, while on line 12-13 and 15-16 we can see that b1 can only be accessed by specifying where the variable lives (i.e. inside ScopeTestModule). At line 18-19 we can see that it is not possible to directly modify a variable which is defined inside another module.
"

# ╔═╡ Cell order:
# ╟─3786dc10-46bd-11eb-2bcb-1d2ef41250aa
# ╟─545598f2-46bd-11eb-22f2-d959fbadc549
# ╟─133c2e68-46be-11eb-2445-fdfd0bdaa763
# ╠═24f7ee12-46be-11eb-3c97-05eb5e3a94c5
# ╠═2e56a278-46be-11eb-2592-6bc4a396d786
# ╟─3131345e-46be-11eb-1f2f-5d46726895dd
# ╠═3b64e420-46be-11eb-3a85-91a45197b5f7
# ╠═4176df1e-46be-11eb-333e-9fbdf98b9ce9
# ╠═48822334-46be-11eb-0584-ed06686b4512
# ╟─56d6a844-46be-11eb-24a2-c912c5f6fae9
# ╠═5e48ad82-46be-11eb-2af9-65d9f9dc3706
# ╠═6628c890-46be-11eb-1b5f-a9dbe523ddb0
# ╠═6cea7e2c-46be-11eb-2a3e-b57d731a344c
# ╟─71dc1a96-46be-11eb-3b0e-e9ebcdb58206
# ╟─842e513c-46be-11eb-2754-fb974f8215e1
# ╠═d303a000-46be-11eb-176d-65500635036f
# ╠═ddf0800a-46be-11eb-0caf-4fe37ba18934
# ╠═e2dac2ce-46be-11eb-2e88-497a6c781222
# ╠═ead5ea30-46be-11eb-2f46-658d41f10b20
# ╠═f0dac34c-46be-11eb-14e8-e5ecb26ad036
# ╠═f84bf7fe-46be-11eb-0416-79962d5dc4c6
# ╟─fc3b5f26-46be-11eb-2655-6518d17e8ed4
# ╠═07e31486-46bf-11eb-11a0-ebb16fec9196
# ╠═11e32cdc-46bf-11eb-105d-797889dcae00
# ╠═1ab5cdc4-46bf-11eb-0012-2b62db002c87
# ╟─1cc2fa2e-46bf-11eb-353d-bdd66ee27a35
# ╠═388c5d7c-46bf-11eb-1895-838457ae5907
# ╠═442e44ba-46bf-11eb-21c3-171917b0c529
# ╠═5e76217e-46bf-11eb-1628-ef847aaa8267
# ╠═7283fbde-46bf-11eb-2a2f-09036a699556
# ╠═9970bdb8-46bf-11eb-3e48-0387b0d3f4f5
# ╠═9ca99a52-46bf-11eb-04b0-73214c9cc4cc
# ╠═a5560d4a-46bf-11eb-1c4b-6993cf3cbb7b
# ╠═c2cfd8ba-46bf-11eb-2072-e7b1f8a7f013
# ╠═c6d83970-46bf-11eb-2ec1-cf03f0290a6b
# ╟─d0caf5ee-46bf-11eb-1120-65d881285044
