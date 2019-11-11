# Examples

What follows are a few simple use cases. For full documentation, consult the Reference.


## Variational learning from one speaker

To simulate variational learning with input from one speaker in the parent generation, we initialize two [`VariationalLearner`](@ref)s:

```julia
parent = VariationalLearner(0.01, 0.2, 0.1; age=30, plastic=false)
child = VariationalLearner(0.01, 0.2, 0.1; age=0, plastic=true)
```

By default, [`VariationalLeaner`](@ref)s are constructed with a uniform distribution over their grammar probabilities. Let's modify the `parent`'s probabilities:

```julia
setprobabilities!(parent, [0.1, 0.9])
```

This has the consequence that `parent` now speaks grammar G1 with probability 0.1 and grammar G2 with probability 0.9.

Finally, to make `child` learn from `parent` over 10,000 iterations:

```julia
for i in 1:10_000
  listen!(child, parent)
end
```

You can consult `child.probabilities` to see how the learner's grammatical probabilities have changed by the end of the learning episode.


## Iterated learning across generations

It is easy to modify the above example to cater for inter-generational learning (a single speaker--listener loop), say for 10 generations:

```julia
parent = VariationalLearner(0.01, 0.2, 0.1; age=30, plastic=false)
setprobabilities!(parent, [0.1, 0.9])
for gen in 1:10
  global parent
  child = VariationalLearner(0.01, 0.2, 0.1; age=0, plastic=true)
  for i in 1:10_000
    listen!(child, parent)
  end
  parent = child
end
```

!!! note
    The line `global parent` is necessary here so that the inner code block can modify the value of the global `parent` variable.

To keep track of the inter-generational evolution, we add another global variable that registers the evolution of the first grammar probability at each generation:

```julia
parent = VariationalLearner(0.01, 0.2, 0.1; age=30, plastic=false)
setprobabilities!(parent, [0.1, 0.9])
results = Array{Float64}(undef, 11)
results[1] = parent.probabilities[1]
for gen in 1:10
  global parent
  child = VariationalLearner(0.01, 0.2, 0.1; age=0, plastic=true)
  for i in 1:10_000
    listen!(child, parent)
  end
  parent = child
  results[gen+1] = parent.probabilities[1]
end
```

!!! note
    In performance-critical applications, [global variables should be avoided](https://docs.julialang.org/en/v1/manual/performance-tips/#Avoid-global-variables-1). This is easiest done by wrapping the code up in a function.


## A community of variational learners


## A multidimensional variational learner
