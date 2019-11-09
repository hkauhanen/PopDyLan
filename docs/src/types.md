# Types and Constructors

In PopDyLan.jl, important data structures are given their own types. Thus, there is a type for a speaker, a type for a speech community, a type for a grammar, etc. These are referenced below, categorized into *linguistic types* (types for grammars, parameter settings, and the like), *individual types* (types for representing individual speakers) and *population types* (types for speech communities).


## Linguistic Types

```@docs
Variable
```

## Individual Types

```@docs
Speaker
VariationalLearner
VariationalLearner(g::Float64, A::Array{Float64,2}; age::Int=0, plastic::Bool=true)
VariationalLearner(g::Float64, a1::Float64, a2::Float64; age::Int=0, plastic::Bool=true)
```

## Population Types

```@docs
Community
```
