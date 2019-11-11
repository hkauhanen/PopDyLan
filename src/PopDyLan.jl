"""
PopDyLan - Population Dynamics of Language
"""
module PopDyLan

# dependencies
using Pkg
Pkg.add("Distributions")
using Distributions

# Generic linguistic types and methods
include("ling.jl")
export Variable

# Generic population types and methods
include("pop.jl")
export Speaker
export Community
export inject!
export eject!
export getolder!

# Variational Learning
include("VL.jl")
export VariationalLearner
export speak
export learn!
export listen!
export setprobabilities!

end
