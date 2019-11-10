include("../src/PopDyLan.jl")

import Pkg
Pkg.add("Distributions")
Pkg.add("Documenter")

using Documenter, .PopDyLan

makedocs(sitename="PopDyLan.jl",
         pages = ["Home" => "intro.md",
                  "Usage" => "usage.md",
                  "Examples" => "examples.md",
                  "Reference" => [
                                  "Types and Constructors" => "types.md",
                                  "Functions and Methods" => "methods.md"
                                 ]
                 ])

deploydocs(repo="github.com/hkauhanen/PopDyLan.jl.git", 
           devbranch="dev")
