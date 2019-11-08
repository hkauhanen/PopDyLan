# Methods

Methods (functions) operate on types, producing an output or modifying their inputs (or, sometimes, not doing anything at all). Names of methods that (may) modify their arguments end, per Julian conventions, in an exclamation point.

!!! note
    In Julia, types do not own methods (like objects in, say, C++ do). As a consequence, to make `foo` `act` on `bar`, we do something like `act(foo, bar)` rather than `foo.act(bar)`.

Methods are here divided into *simulation methods* (functions you use to conduct simulations), *constructor methods* (constructors for types) and *auxiliary methods* (e.g. functions for dealing with data).


## Simulation Methods

```@docs
eject!
getolder!(x::Speaker)
inject!
listen!(x::VariationalLearner, y::Speaker, a)
```


## Constructor Methods

```@docs
Variable(n::Int)
```


## Auxiliary Methods
