module Unimplemented

export @unimplemented, @interface
gen_unimpl_fn(func) = begin
	func_descri  = ""
	isa(func, Expr) && isa(func.args[end], Expr) && func.args[end].head == :block && @warn("Interface function shuold have no implementation for now... USE the function alone like: fn(...) ")
	func.head == :(=)    && (func_descri = func.args[1])
	func.head == :call   && (func_descri = func)
	func.head == :where  && (func_descri = func)
	err_fn_msg="Unimplemented interface function: $(func_descri)"
	quote
		$(esc(func_descri)) = throw($err_fn_msg)
	end
end
macro unimplemented(func); gen_unimpl_fn(func); end
macro interface(func)    ; gen_unimpl_fn(func); end


end # module Unimplemented
