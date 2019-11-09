# General Types and Methods to do with Language

"""
A linguistic variable; a probability distribution over a set of values.
"""
mutable struct Variable
  p::Array{Float64} # probability distribution

  # inner constructor; used to scale distribution to unity
  Variable(p::Array{Float64}) = new(p/sum(p))
end


"""
    Variable(n::Int)

Constructs a [`Variable`](@ref) of `n` values with a uniform distribution over those values.
"""
Variable(n::Int) = Variable([1/n for i in 1:n])


"""
Utterances fall into the same utterance type if the learner treats them the same. For instance, all input strings parsed by G1 but not by G2 are treated as one utterance type by a [`VariationalLearner`](@ref) (and, in general, there are four utterance types for any [`VariationalLearner`](@ref)). `UtteranceType`s are transmitted between speakers and listeners instead of utterance tokens to simplify and speed up computations.
"""
struct UtteranceType
  message::Any
  meta::Any
end
