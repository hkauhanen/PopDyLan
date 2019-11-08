# Methods

## Introduction

Methods (functions) operate on types, producing an output or modifying their inputs (or, sometimes, not doing anything at all). Names of methods that (may) modify their arguments end, per Julian conventions, in an exclamation point.

Note that, in contrast to actual object-oriented languages such as C++ where objects own their methods, in Julia this is not the case. For instance, to make speaker A to listen to speaker B, we use something like

```
listen(A, B)
```

rather than

```
A.listen(B)
```


## Reference

```@docs
listen!(x::VL, y::VL, a)
```
