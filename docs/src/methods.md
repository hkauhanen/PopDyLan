# Methods

Methods (functions) operate on types, producing an output or modifying their inputs (or, sometimes, not doing anything at all). Names of methods that (may) modify their arguments end, per Julian conventions, in an exclamation point.

!!! note
    In Julia, types do not own methods (like objects in, say, C++ do). As a consequence, to make `foo` `act` on `bar`, we do something like `act(foo, bar)` rather than `foo.act(bar)`.

!!! note
    Constructor methods are documented under [`Types and Constructors`](@ref).

Methods are here divided into *simulation methods* (functions you use to conduct simulations) and *auxiliary methods* (e.g. functions for dealing with data).


## Simulation Methods

```@docs
eject!
getolder!
inject!
learn!
listen!
speak
```

## Auxiliary Methods
