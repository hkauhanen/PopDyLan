include("../src/PopDyLan.jl")

import Pkg
Pkg.add("Documenter")

using Documenter, .PopDyLan

makedocs(sitename="PopDyLan.jl")

deploydocs(repo="github.com/hkauhanen/PopDyLan.jl.git", 
           devbranch="dev",
           julia="1.2")
