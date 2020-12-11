### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ 54530d68-371e-11eb-198f-09c7ddd312d0
md" ## _Control Flow_
In this lesson we will learn how to work with control statements. We will first learn how to use conditional blocks like `if ... else` blocks and then we will learn how to perform loops.
"

# ╔═╡ eedcadc6-371e-11eb-157d-519a4216048e
md" ## If...else
When a program needs to take decisions according to certain conditions, the `if ... else` block is the default choice.

Let’s suppose that we want to write a simple implementation of the absolute value of a number. The absolute value of a number is defined as the number itself, if the number is positive, or the opposite if the value is negative. This is the typical case where the `if ... else` construct is useful! We can write a simple absolute function in this way:
"

# ╔═╡ 0d8b49a8-371f-11eb-2095-f396ca04dbf8
function absolute(x)
    if x >= 0
        return x
    else
        return -x
    end
end

# ╔═╡ 141b93c2-371f-11eb-32d6-27f16f613bb5
md" As you can see, an `if ... else` block is closed with the word `end`, like a function.

If we need to check more than one condition, we can bind together conditions using:

- “and” is written as `&` (if both statements are true return true, else return false)
- “or” is written as `||` (if at least one statement is true return true, else return false)
For example, if we want to check whether 3 is both minor than 4 and major than 1 we type:
"

# ╔═╡ 5bd9ab0c-371f-11eb-34c4-3bf036e74aa2
if 1 < 3 & 3 < 4
    md"eureka!"
end

# ╔═╡ 7612ee90-371f-11eb-1bd1-1901a20d17ac
md"
If we want to check if a value satisfies one of several different conditions, we can use the elseif statement: Julia will check if the first condition specified in the if is satisfied, if it is not met it moves on to the first elseif and so on.
"

# ╔═╡ 8fad36a8-371f-11eb-2813-799af7e042d6
x=109

# ╔═╡ 661d3b08-371f-11eb-2de6-2d6e6159b11b

	if x<1
	    md"$x < 1"
	elseif x < 3
	    md"$x < 3"
	elseif x < 100
	    md"$x < 100"
	else
	    md"$x is really big!"
	end
	

# ╔═╡ fed3f85e-3720-11eb-06ee-478f071c7445
md"I take the occasion to introduce **string interpolation**. With the indication `$x` we tell Julia that it must substitute to `$x` the value of `x`, in this case 42. This is particularly useful when we want to print values, or we want to make custom messages:
"

# ╔═╡ 58766288-3722-11eb-3f92-b96dc7699a55
name1 = "Zoe zebra"

# ╔═╡ 662ed338-3722-11eb-10f6-0913ff2bb07f
name2 = "Peppa"

# ╔═╡ 663b5b76-3722-11eb-0279-5b549e2422b7
md"Welcome $name1, this is $name2 :)"

# ╔═╡ 4274730c-3723-11eb-31b0-15f4fb936db5
md" ## Loops
A loop is the operation of repeating the same set of instructions several times. Loops are useful when we want to compute the value of a function over several points, we need to perform some operations on the elements of an array or we need to print the elements of a list.
"

# ╔═╡ 5c29e0d4-3723-11eb-210d-e16125372096
md" **For Loops**
........................................................................................................................................................................

Sometimes we want to iterate over a list of values and perform some operation on each element.

For example let’s suppose we want to print all the squares of the numbers comprised between 1 and 10, we can do it using a `for` loop:
"

# ╔═╡ afc4775e-3723-11eb-28c9-5d9248c25d30
for i in 1:10
    md"i^2"
end

# ╔═╡ 8bf7f11a-3724-11eb-343c-cde9b80cc292
md"
`i` is the variable which contains the data which gets updated at each new cycle (in this case i holds the numbers from 1 to 10 respectively), while `1:10` is a **range**. A range is an iterable object which does exactly what its name suggests: it specifies the range on which the loop has to be performed (in this case 1 to 10).

It is also possible to use the alternative notation for i = 1:10 which is completely equivalent.

Please notice that it is possible to loop not only over ranges (which can also be specified using the `range` function) but also lists (i.e. arrays, tuples, etc).

For example, let’s suppose we have a list of persons and we want to greet all of them, we can do it with the `for` statement:
"

# ╔═╡ c46343c4-3724-11eb-1bdf-8558d7e2c915
persons = ["Alice", "Bob", "Carla", "Daniel"]

# ╔═╡ ffc3cf7e-3724-11eb-31a6-ff2ab6952113
for person in persons
    md"Hello $person, welcome to techytok!"
end

# ╔═╡ 0f213132-3725-11eb-0023-e37fd3aa9933
md"Here instead of a range, we iterate over the elements of persons (i.e. the names of the persons that I want to greet) and in this case person will hold the name of a single person, which changes at each iteration step.
"

# ╔═╡ 86a93f60-3725-11eb-3e83-db6d45c4918a
md"**Breaks**
........................................................................................................................................................................

In the case we want to forcefully interrupt a for loop we can use the break statement, for example:
"

# ╔═╡ c287b7be-3725-11eb-3c5e-1578203b2779
for i in 1:100
    if i>10
        break
    else
   	    println(i^2)
    end
end

# ╔═╡ d4821eb4-3725-11eb-091b-5f9e7fd555ef
md" Here we check if `i>10`, in that case we break the loop and finish the iteration, else we print `i^2`.
"

# ╔═╡ e67787c4-3725-11eb-3659-111648e1efbb
md"**Continue**
........................................................................................................................................................................

This is the opposite of break, continue will forcefully skip the current iteration and move to the next cycle:
"

# ╔═╡ fa813a82-3725-11eb-31c3-915661199563
for i in 1:30
    if i % 3 == 0
        continue
    else
        println(i)
    end
end

# ╔═╡ 0ceee5e0-3729-11eb-3a5a-f58377c6fb9a
md"**While Loop**
........................................................................................................................................................................

When a loop needs to continue until a certain condition is met, a while loop is the preferable choice:
"

# ╔═╡ 1c7f425c-3729-11eb-086a-3b64ef09e50c
function while_test()
    i=0
    while(i<30)
        println(i)
        i += 1
    end
end

# ╔═╡ 234a80b0-3729-11eb-0f94-3b097c8b0260
md" ## Enumerate
`enumerate` is a function which comes in handy when we need to iterate on an array (or similar) and we need to keep track of the number of iterations we have already performed.

`enumerate` will return an iterator (which is something like an array which can be iterated in for loops). It will produce couples of the form `(i, x[i])`.
"

# ╔═╡ 384174f6-3729-11eb-3dca-e7b0d2e6a3b5
z = ["a","b","c"]

# ╔═╡ 3eef4080-3729-11eb-0445-2d68fe408a17
for couple in enumerate(z)
    println(couple)
end

# ╔═╡ 3efc4ce4-3729-11eb-0401-e91c29e82242
(1, "a")

# ╔═╡ 3f405c54-3729-11eb-2792-05f370aa82b0
(2, "b")

# ╔═╡ 3f4e1e68-3729-11eb-0c64-1bf3e2996f25
(3, "c")

# ╔═╡ 4c84b284-3729-11eb-0899-3fd8fdc2b4bd
md"The same result could have been obtained “manually”:"

# ╔═╡ 5b92232e-3729-11eb-3775-611d7fe365f0
y = ["a","b","c"]

# ╔═╡ 63bf58fa-3729-11eb-01a8-3b19208f9751
enum_array = [(1,"a"), (2,"b"), (3,"c")]

# ╔═╡ 63c96604-3729-11eb-0406-01eece93f912
for i in 1:length(y)
    println(enum_array[i])
end

# ╔═╡ 63dc02a4-3729-11eb-212c-5bb44f5ec5cc
(1, "a")

# ╔═╡ 6405dee2-3729-11eb-1a6d-dff129465d17
(2, "b")

# ╔═╡ 6412f142-3729-11eb-1081-d51e4329b48a
(3, "c")

# ╔═╡ Cell order:
# ╟─54530d68-371e-11eb-198f-09c7ddd312d0
# ╟─eedcadc6-371e-11eb-157d-519a4216048e
# ╠═0d8b49a8-371f-11eb-2095-f396ca04dbf8
# ╟─141b93c2-371f-11eb-32d6-27f16f613bb5
# ╠═5bd9ab0c-371f-11eb-34c4-3bf036e74aa2
# ╟─7612ee90-371f-11eb-1bd1-1901a20d17ac
# ╠═8fad36a8-371f-11eb-2813-799af7e042d6
# ╠═661d3b08-371f-11eb-2de6-2d6e6159b11b
# ╟─fed3f85e-3720-11eb-06ee-478f071c7445
# ╠═58766288-3722-11eb-3f92-b96dc7699a55
# ╠═662ed338-3722-11eb-10f6-0913ff2bb07f
# ╠═663b5b76-3722-11eb-0279-5b549e2422b7
# ╟─4274730c-3723-11eb-31b0-15f4fb936db5
# ╠═5c29e0d4-3723-11eb-210d-e16125372096
# ╠═afc4775e-3723-11eb-28c9-5d9248c25d30
# ╟─8bf7f11a-3724-11eb-343c-cde9b80cc292
# ╠═c46343c4-3724-11eb-1bdf-8558d7e2c915
# ╠═ffc3cf7e-3724-11eb-31a6-ff2ab6952113
# ╟─0f213132-3725-11eb-0023-e37fd3aa9933
# ╠═86a93f60-3725-11eb-3e83-db6d45c4918a
# ╠═c287b7be-3725-11eb-3c5e-1578203b2779
# ╟─d4821eb4-3725-11eb-091b-5f9e7fd555ef
# ╟─e67787c4-3725-11eb-3659-111648e1efbb
# ╠═fa813a82-3725-11eb-31c3-915661199563
# ╟─0ceee5e0-3729-11eb-3a5a-f58377c6fb9a
# ╠═1c7f425c-3729-11eb-086a-3b64ef09e50c
# ╟─234a80b0-3729-11eb-0f94-3b097c8b0260
# ╠═384174f6-3729-11eb-3dca-e7b0d2e6a3b5
# ╠═3eef4080-3729-11eb-0445-2d68fe408a17
# ╠═3efc4ce4-3729-11eb-0401-e91c29e82242
# ╠═3f405c54-3729-11eb-2792-05f370aa82b0
# ╠═3f4e1e68-3729-11eb-0c64-1bf3e2996f25
# ╟─4c84b284-3729-11eb-0899-3fd8fdc2b4bd
# ╠═5b92232e-3729-11eb-3775-611d7fe365f0
# ╠═63bf58fa-3729-11eb-01a8-3b19208f9751
# ╠═63c96604-3729-11eb-0406-01eece93f912
# ╠═63dc02a4-3729-11eb-212c-5bb44f5ec5cc
# ╠═6405dee2-3729-11eb-1a6d-dff129465d17
# ╠═6412f142-3729-11eb-1081-d51e4329b48a
