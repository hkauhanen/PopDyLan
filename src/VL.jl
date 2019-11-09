#=
# Variational Learning, i.e. grammatical acquisition based on Linear 
# Reward-Penalty Learning (a form of reinforcement learning). Narendra and
# Thathachar's generalization of the LRP for n dimensions is implemented
# through Kauhanen's concept of advantage matrix.
=#


"""
Variational learner, a subtype of the abstract [`Speaker`](@ref) type.
"""
mutable struct VariationalLearner <: Speaker
  gamma::Float64 # learning rate
  probabilities::Array{Float64} # grammar probabilities
  n::Int # number of grammar probabilities (for performance reasons)
  advantages::Array{Float64,2} # advantage matrix
  age::Int # speaker's age
  plastic::Bool # whether speaker is in the critical period
end


"""
    VariationalLearner(g::Float64, A::Array{Float64,2}; age::Int=0, plastic::Bool=true)

Constructs a [`VariationalLearner`](@ref) with learning rate `g` and advantage matrix `A`. The dimensions of `A` implicitly define the dimensionality of the learner. Note that no checking is performed to make sure that `A` is a valid advantage matrix. The learner's age and plasticity flag can be optionally set with the keyword arguments `age` and `plastic`. By default, each learner is constructed with age 0 and in a plastic state.
"""
VariationalLearner(g::Float64, A::Array{Float64,2}; age::Int=0, plastic::Bool=true) = VariationalLearner(g, vec([1/size(A)[1] for i in 1:size(A)[1]]), size(A)[1], A, age, plastic)


"""
    VariationalLearner(g::Float64, a1::Float64, a2::Float64; age::Int=0, plastic::Bool=true)

Construcs a classical 2-grammar (i.e. 1-parameter) [`VariationalLearner`](@ref) with learning rate `g` and advantage parameters `a1` and `a2`. The learner's age and plasticity flag can be optionally set with the keyword arguments `age` and `plastic`. By default, each learner is constructed with age 0 and in a plastic state.
"""
VariationalLearner(g::Float64, a1::Float64, a2::Float64; age::Int=0, plastic::Bool=true) = VariationalLearner(g, [0.5, 0.5], 2, [0 a2; a1 0], age, plastic)


"""
    speak(x::VariationalLearner)

Causes [`VariationalLearner`](@ref) `x` to speak, i.e. to pick one of its grammars for production according to its internalized grammar probabilities. Returns an integer (the index of this grammar).
"""
function speak(x::VariationalLearner)
  Distributions.wsample(1:x.n, x.probabilities)
end


"""
    learn!(x::VariationalLearner, y::Int)

Make [`VariationalLearner`](@ref) learn from input token `y`, which is simply a grammar index. Called by [`listen!`](@ref), this function is unlikely to be of use in itself to the end user. Implements Bush and Mosteller's Linear Reward-Penalty Learning algorithm, generalized for n dimensions.
"""
function learn!(x::VariationalLearner, y::Int)
  picked_grammar = Distributions.wsample(1:x.n, x.probabilities)
  parsing_failure_prob = x.advantages[picked_grammar, y]
  if rand() < parsing_failure_prob
    x.probabilities[picked_grammar] *= (1-x.gamma)
    x.probabilities[1:end .!= picked_grammar] .= x.gamma/(x.n - 1) .+ (1 - x.gamma)*x.probabilities[1:end .!= picked_grammar]
  else
    x.probabilities[picked_grammar] += x.gamma*(1 - x.probabilities[picked_grammar])
    x.probabilities[1:end .!= picked_grammar] .= (1 - x.gamma)*x.probabilities[1:end .!= picked_grammar]
  end
end


"""
    listen!(x::VariationalLearner, y::VariationalLearner)

Make [`VariationalLearner`](@ref) `x` listen to one utterance from `y` and learn based on this input experience. The state of `x` may change as a result; the state of `y` is guaranteed not to change.
"""
function listen!(x::VariationalLearner, y::VariationalLearner)
  if x.plastic
    learn!(x, speak(y))
  end
end

