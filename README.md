# Unimplemented.jl or could be Interface.jl

Syntactic sugar for unimplemented functions (which are boilerplate).

Create nicer interface functions. 

`@unimplemented` and `@interface` are same and throw an error of "unimplemented... fn(...)". 


## Example
```julia
@interface func(args...; kw_args...)
@interface init(t::Type{TYPE}, args...; kw_args...) where TYPE
```

Shorten the code like:
```julia
func(args...; kw_args...) = throw("Unimplemented func(args...; kw_args...)")
```
To this:
```julia
@interface func(args...; kw_args...)
```

To overload and to avoid Precompilation error. Do: *dispatch like non-overwriting type piracy*. 
So for example:
- try to use one or more concrete or abstract type in the function where you are overloading the function. 
- or even define the function on another type that wasn't included in the `@interfaced` functions type. *Type piracy!*
```
func(x::MyStruct, b; by) = @show x(b, by)
```

# Note
The whole code is one file with literally 1 function. 

REALLY important topic and this is how this package(`@interface`) should work also: https://discourse.julialang.org/t/how-bad-is-type-piracy-actually/37913/10
