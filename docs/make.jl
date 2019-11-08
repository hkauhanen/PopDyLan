include("../src/PopDyLan.jl")

import Pkg
Pkg.add("Documenter")

using Documenter, .PopDyLan

makedocs(sitename="PopDyLan.jl",
         pages = ["Home" => "intro.md",
                  "Types" => "types.md",
                  "Methods" => "methods.md",
                  "Examples" => "examples.md"])

deploydocs(repo="github.com/hkauhanen/PopDyLan.jl.git", 
           devbranch="dev")
