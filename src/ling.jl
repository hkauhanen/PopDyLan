# General Types and Methods to do with Language

"""
A linguistic variable; a probability distribution over a set of values.
"""
mutable struct Variable
  p::Array{Float64} # probability distribution
end


"""
    Variable(n::Int)

Constructs a [`Variable`](@ref) of `n` values with a uniform distribution over those values.
"""
Variable(n::Int) = Variable([1/n for i in 1:n])

