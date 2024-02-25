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


# Note
The whole code is one file with literally 1 function. 
