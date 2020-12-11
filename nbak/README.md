This repository contains notebooks that give an introduction to Julia Pluto notebooks, the language as well as calculus and chemistry. Some interesting topics in each area is covered using notebooks. These were developed as a way for me to learn Julia, Calculus and Science simultenously. In the process, I have done some core notebooks based on the AP courses. I have also stumbled into some interesting concepts (such as mathematical modeling using Julia) that are illustrated with some notebooks. Hopefully, this is interesting to other high schoolers out there.

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

