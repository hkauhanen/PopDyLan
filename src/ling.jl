# General Types and Methods to do with Language

"""
A linguistic variable; a probability distribution over a set of values.
"""
mutable struct Variable
  n::Int # number of values of the variable
  p::Array{Float64} # probability distribution
  
  # constructors
  """
      Variable(n::Int)

  Constructs a `Variable` of `n` values with a uniform distribution over those values.
  """
  Variable(n::Int) = new(n, [1/n for i in 1:n])

  """
      Variable(p::Array)
  Constructs a `Variable` using the probability distribution `p`. If `p` does not sum to unity, it is silently scaled to sum to unity.
  """
  Variable(p::Array) = new(length(p), p./sum(p))
end
