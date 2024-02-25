function _memoize_funccall(funccall)
	funcname = funccall.args[1]
	args, kwargs = [], []
	for arg in funccall.args[2:end]
			if isexpr(arg, :kw)
					push!(kwargs, Expr(:(=), arg.args...))
			elseif isexpr(arg, :parameters)
					push!(kwargs, arg)
			else
					push!(args, arg)
			end
	end
end

#%%
@interface init(t::Type{TYPE}, args...; kw_args...) where TYPE 
# @interface init(t::Float32, ars...; kw_args...) 
# = throw("init(t, args...; kw_args...)")
init(Float32,4,3)
