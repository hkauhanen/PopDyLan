# Methods

Methods (functions) operate on types, producing an output or modifying their inputs (or, sometimes, not doing anything at all). Names of methods that (may) modify their arguments end, per Julian conventions, in an exclamation point.

!!! note
    In contrast to actual object-oriented languages such as C++ where objects own their (encapsulated) methods, in Julia this is not the case. For instance, to make speaker A to listen to speaker B, we use something like `listen(A, B)` rather than `A.listen(B)`.

Methods are here divided into *simulation methods* (functions you use to conduct simulations) and *auxiliary methods* (e.g. functions for dealing with data).


## Simulation Methods

```@docs
listen!(x::VL, y::VL, a)
```


## Auxiliary Methods
