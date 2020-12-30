### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ b56a7126-46ba-11eb-2fdf-7f93842fc501
md"## _BroadCasting_
In this lesson we will talk about one of the most handy, if not useful, features of Julia: **array broadcasting**. Furthermore we will deal with some important differences between Julia and other programming languages (like Python or Matlab) which make extensive use of operations on arrays and with arrays."

# ╔═╡ 1fa5aed2-46bb-11eb-3d2c-37d60ffb1698
md" ## Working with Functions and Arrays
**Introduction**

Many languages (such as Python with numpy and Matlab) make extensive use of optimised C or Fortran routines under the hood to perform fast mathematical operations, as such the user is encouraged to write vectorised code, so that these routines can perform faster for loops, as a big part of the CPU time is spent on calling the underlying compiled routine, and not computing the actual result. More or less what happens is that the user writes vectorised code which communicates to C code that can run fast for loops and the result is then returned to the user in the form of an array (or matrix).

In Julia, since for loops are already as fast as they can be (close to the speed of C) there is no need to write vectorised code, as the interpreter will directly compile your code in optimised machine code which will run as fast as possible on your machine. In Julia nothing happens under the hood (beside the compilation of the functions) and almost all the functions in Julia are written in Julia, just like all the functions in C are written in C.

**Operations with Arrays**

Julia by default deals with operations on arrays and matrices as one would do in mathematics.

Let’s start with an example: from a mathematical point of view, we don’t know how to compute the sin of an array, as the sine function is defined only on single (dimensionless) values. At the same time the exp can work both on single values and matrices (as the exponential of a matrix has a well-defined geometrical meaning). For the same reason, you cannot multiply two arrays together, unless their size is matching correctly (i.e. one array is a row array and the other one is a column array) and in this case the multiplication of two arrays becomes the well-defined geometrical product of two arrays (which can be a scalar or a matrix, depending on the order of the multiplication):
"

# ╔═╡ bcbc3b46-46bb-11eb-1532-c561f25a9943
a = [1,2,3]

# ╔═╡ c6571362-46bb-11eb-2a5f-51ffab5cd8ab
b = [4,5,6]

# ╔═╡ ce409166-46bb-11eb-1ea6-d52e8922a64f
a*b

# ╔═╡ d39e1610-46bb-11eb-2e3b-71b169116ea1
c = [4 5 6]

# ╔═╡ e41dbb1c-46bb-11eb-07d3-ebd94d38fe07
a*c

# ╔═╡ 0db631e8-46bc-11eb-3684-85af439fcfb1
c*a

# ╔═╡ 1168dac0-46bc-11eb-1898-696d8b3565a5
d = reshape([1,2,3,4,5,6,7,8,9],3,3)

# ╔═╡ 1e6c7ef4-46bc-11eb-16a6-7bf5d86af426
d*a

# ╔═╡ 23dc16ae-46bc-11eb-3145-25a33518b1b2
md" This makes perfectly sense from a mathematical point of view and operators behave how we would mathematically expect. Nonetheless, in programming it is often useful to write operations which work on an element by element basis, and for this reason broadcasting comes to our help.
"

# ╔═╡ 3cf1e0e2-46bc-11eb-280d-01cb5a9b5043
md" ## Broadcasting
In Julia, with broadcasting we indicate the action of mapping a function or an operation (which are the same in Julia) over an array or a matrix element by element.

The broadcasting notation for operators consists of adding a dot . before the operator (for example .*)

Considering the example we get:
"

# ╔═╡ 6aef8c38-46bc-11eb-1329-8ba6c0556433
a .* c

# ╔═╡ 6d66571a-46bc-11eb-0821-2fcb49952c0e
c .* a

# ╔═╡ 7844aa58-46bc-11eb-0ebf-051cad17621a
a .* d

# ╔═╡ 7b144928-46bc-11eb-1c61-b76df7fe294d
md"
Notice that when we broadcast the multiplication with a matrix and an array, the array gets multiplied “in the same direction” as it is written, in the sense that if a vector is a column it gets applied column by column etc.

We can use the broadcasting notation also to map a function over an n-dimensional array. There is no speed gain in doing so, as it will be exactly equivalent to writing a for loop, but its conciseness may be useful sometimes. So the core idea in Julia is to write functions that take single values and use broadcasting when needed, unless the functions must explicitly work on arrays (for example to compute the mean of a series of values, perform matrix operations, vector multiplications, etc).

To broadcast a function over an array it is sufficient to put a dot before the brackets `.()`
"

# ╔═╡ 8ade4caa-46bc-11eb-1ed3-938b46b63dfa
sin.(a)

# ╔═╡ a590b9a2-46bc-11eb-04b6-4703bf84cbdd
md"
It is also possible to map a function over several values using the map function, but there are no real advantages in doing so and the broadcasting syntax is often more flexible.

As we will see in the future, in Julia it is really easy to write parallel code using multi-processing and multi-threading, and it is particularly simple to write such parallel structures when we encounter a for loop or a map function (which will become a parallel map through pmap), thus it is convenient to get used to writing your code in such paradigm.

If you are new to programming or you come from a compiled language (like C++), you should find it easy to think in terms of for loops and you should think of broadcasting as a fast and concise way to compute the value of a function over several input values.
"

# ╔═╡ add08b24-46bc-11eb-0637-43c62f9bfc00
md" ## Conclusion
We have learned what is broadcasting and how it can be used to perform element by element operations between vectors and how to map a function over an array using the concise broadcasting syntax.

We have also pointed out how Julia does not gain in performance by using “vectorised” notations (while other languages do) because the core Julia operations are implemented directly in the Julia language and thus there is no need to call compiled routines coded in other languages under the hood to offload all the heavy work.

"

# ╔═╡ Cell order:
# ╟─b56a7126-46ba-11eb-2fdf-7f93842fc501
# ╟─1fa5aed2-46bb-11eb-3d2c-37d60ffb1698
# ╠═bcbc3b46-46bb-11eb-1532-c561f25a9943
# ╠═c6571362-46bb-11eb-2a5f-51ffab5cd8ab
# ╠═ce409166-46bb-11eb-1ea6-d52e8922a64f
# ╠═d39e1610-46bb-11eb-2e3b-71b169116ea1
# ╠═e41dbb1c-46bb-11eb-07d3-ebd94d38fe07
# ╠═0db631e8-46bc-11eb-3684-85af439fcfb1
# ╠═1168dac0-46bc-11eb-1898-696d8b3565a5
# ╠═1e6c7ef4-46bc-11eb-16a6-7bf5d86af426
# ╟─23dc16ae-46bc-11eb-3145-25a33518b1b2
# ╟─3cf1e0e2-46bc-11eb-280d-01cb5a9b5043
# ╠═6aef8c38-46bc-11eb-1329-8ba6c0556433
# ╠═6d66571a-46bc-11eb-0821-2fcb49952c0e
# ╠═7844aa58-46bc-11eb-0ebf-051cad17621a
# ╟─7b144928-46bc-11eb-1c61-b76df7fe294d
# ╠═8ade4caa-46bc-11eb-1ed3-938b46b63dfa
# ╟─a590b9a2-46bc-11eb-04b6-4703bf84cbdd
# ╟─add08b24-46bc-11eb-0637-43c62f9bfc00
