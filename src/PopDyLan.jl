"""
PopDyLan - Population Dynamics of Language
"""
module PopDyLan

# Generic linguistic types and methods
include("ling.jl")
export Variable

# Generic population types and methods
include("pop.jl")
export Speaker
export getolder!

# Variational Learning
include("VL.jl")
export VariationalLearner
export listen!

end
