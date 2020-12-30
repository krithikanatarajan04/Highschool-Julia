This series of notebooks comprises various topics in Calculus, Chemistry, and basic introductions to Julia. The intent is to enhance my comprehension of AP Chemistry and AP Calculus AB concepts while also becoming more proficient in the julia language. As a high schooler, it is very difficult to dedicate time solely to Julia because of a heavy workload. However, by integrating it into my schoolwork, I save time, work more efficiently, and cover more material. The Pluto notebooks enclosed will have material from the 2020-2021 AP Chemistry course, applications of calculus through growth models, predator prey models (etc) and lessons from a Julia course converted for a more flexible approach to learning how the language works. 

There are two ways to use these notebooks interactively:

1. Using Binder links: The readme files in each folder has links to Binder where you can launch an interactive session. It takes a couple of minutes for the Binder environment to initialize. So please be patient.

2. Running in a local Julia environment:


# Let's do it!

### Clone this repository; Go to a folder in your system and run from terminal:
```
git clone https://github.com/22natarajank/Highschool-Julia.git
```

### Ingredients

For one tasty notebook 🥞 you will need:

-   **Julia** v1.0 or above, _v1.5 is fastest_
-   **Linux**, **macOS** or **Windows**, _Linux and macOS will work best_
-   Mozilla **Firefox** or Google **Chrome**, be sure to get the latest version

### Installation

<p align="center"><a href="https://www.youtube.com/watch?v=OOjKEgbt8AI">🎈 How to install <b>Julia & Pluto</b> (6 min) 🎈</a></p>

Run Julia and add the package:

```julia
julia> ]
(v1.5) pkg> add Pluto
```

_Using the package manager for the first time can take up to 15 minutes - hang in there!_

To run the notebook server:

```julia
julia> import Pluto
julia> cd("/path_to_folder/Highschool-Julia")
julia> Pluto.run()
```

Pluto will open in your browser, and you can get started!

Paste the following path into the "Open from file" box and it will open the high level notebook with navigation links to other notebooks.

/path_to_folder/Highschool-Julia/intro.jl

