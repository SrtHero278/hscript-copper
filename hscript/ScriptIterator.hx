package hscript;

import hscript.Interp;
import hscript.Expr;

class ScriptIterator {
	var current:Int;
	var end:Int;

	function expectInt(from:Interp, expr:Expr, name:String):Int {
		var val:Dynamic = from.expr(expr);

		var type = Type.typeof(val);
		if (type != TInt)
			from.error(ECustom('Expected Int for iterator $name, got $type'));

		return val;
	}
	public function new(from:Interp, exprStart:Expr, exprEnd:Expr) {
		current = expectInt(from, exprStart, "start");
		end = expectInt(from, exprEnd, "end");
	}

	// they're to be called by the script, inline will do nothing.
	public function hasNext() {
		return current < end;
	}
	public function next() {
		return current++;
	}
}