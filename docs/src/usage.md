# Usage

PopDyLan is currently under alpha development and not yet within the Julia General Registry. To install the latest stable release from GitHub:

```{julia}
using Pkg
Pkg.add(PackageSpec(url="https://github.com/hkauhanen/PopDyLan.jl"))
```

Alternatively, to install the current development version with all bells and whistles (and bugs!):

```{julia}
Pkg.add(PackageSpec(url="https://github.com/hkauhanen/PopDyLan.jl", rev="dev"))
```

The above command(s) need be run one time only. Once installed, you can load the module at the start of your session in the usual way:

```{julia}
using PopDyLan
```
