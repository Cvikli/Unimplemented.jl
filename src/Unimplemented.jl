module Unimplemented


macro unimplemented(func) 
	func_desc  = ""
	isa(func.args[end],Expr) && func.args[end].head == :block && @warn("Interface function shuold have no implementation for now... USE the function alone like: fn(...) ")
	func.head == :(=)    && (func_desc = func.args[1])
	func.head == :call   && (func_desc = func)
	func.head == :where  && (func_desc = func)
	err_fn_msg="Unimplemented interface function: $(func_desc)"
	quote
		$esc(func_unimplemented) = throw($err_fn_msg)
	end
end
macro interface(func)
	@unimplemented(func)
end


end # module Unimplemented
