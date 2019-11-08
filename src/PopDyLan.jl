"""
PopDyLan - Population Dynamics of Language
"""
module PopDyLan

include("ling.jl") # general linguistics types and methods
include("VL.jl") # variational learning

export Variable
export Variable(n::Int)
export Variable(p::Array)
export VL
export listen!

end
