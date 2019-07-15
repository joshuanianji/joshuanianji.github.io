(function(scope){
'use strict';

function F(arity, fun, wrapper) {
  wrapper.a = arity;
  wrapper.f = fun;
  return wrapper;
}

function F2(fun) {
  return F(2, fun, function(a) { return function(b) { return fun(a,b); }; })
}
function F3(fun) {
  return F(3, fun, function(a) {
    return function(b) { return function(c) { return fun(a, b, c); }; };
  });
}
function F4(fun) {
  return F(4, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return fun(a, b, c, d); }; }; };
  });
}
function F5(fun) {
  return F(5, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return fun(a, b, c, d, e); }; }; }; };
  });
}
function F6(fun) {
  return F(6, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return fun(a, b, c, d, e, f); }; }; }; }; };
  });
}
function F7(fun) {
  return F(7, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return fun(a, b, c, d, e, f, g); }; }; }; }; }; };
  });
}
function F8(fun) {
  return F(8, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return function(h) {
    return fun(a, b, c, d, e, f, g, h); }; }; }; }; }; }; };
  });
}
function F9(fun) {
  return F(9, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return function(h) { return function(i) {
    return fun(a, b, c, d, e, f, g, h, i); }; }; }; }; }; }; }; };
  });
}

function A2(fun, a, b) {
  return fun.a === 2 ? fun.f(a, b) : fun(a)(b);
}
function A3(fun, a, b, c) {
  return fun.a === 3 ? fun.f(a, b, c) : fun(a)(b)(c);
}
function A4(fun, a, b, c, d) {
  return fun.a === 4 ? fun.f(a, b, c, d) : fun(a)(b)(c)(d);
}
function A5(fun, a, b, c, d, e) {
  return fun.a === 5 ? fun.f(a, b, c, d, e) : fun(a)(b)(c)(d)(e);
}
function A6(fun, a, b, c, d, e, f) {
  return fun.a === 6 ? fun.f(a, b, c, d, e, f) : fun(a)(b)(c)(d)(e)(f);
}
function A7(fun, a, b, c, d, e, f, g) {
  return fun.a === 7 ? fun.f(a, b, c, d, e, f, g) : fun(a)(b)(c)(d)(e)(f)(g);
}
function A8(fun, a, b, c, d, e, f, g, h) {
  return fun.a === 8 ? fun.f(a, b, c, d, e, f, g, h) : fun(a)(b)(c)(d)(e)(f)(g)(h);
}
function A9(fun, a, b, c, d, e, f, g, h, i) {
  return fun.a === 9 ? fun.f(a, b, c, d, e, f, g, h, i) : fun(a)(b)(c)(d)(e)(f)(g)(h)(i);
}

console.warn('Compiled in DEV mode. Follow the advice at https://elm-lang.org/0.19.0/optimize for better performance and smaller assets.');


var _JsArray_empty = [];

function _JsArray_singleton(value)
{
    return [value];
}

function _JsArray_length(array)
{
    return array.length;
}

var _JsArray_initialize = F3(function(size, offset, func)
{
    var result = new Array(size);

    for (var i = 0; i < size; i++)
    {
        result[i] = func(offset + i);
    }

    return result;
});

var _JsArray_initializeFromList = F2(function (max, ls)
{
    var result = new Array(max);

    for (var i = 0; i < max && ls.b; i++)
    {
        result[i] = ls.a;
        ls = ls.b;
    }

    result.length = i;
    return _Utils_Tuple2(result, ls);
});

var _JsArray_unsafeGet = F2(function(index, array)
{
    return array[index];
});

var _JsArray_unsafeSet = F3(function(index, value, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = array[i];
    }

    result[index] = value;
    return result;
});

var _JsArray_push = F2(function(value, array)
{
    var length = array.length;
    var result = new Array(length + 1);

    for (var i = 0; i < length; i++)
    {
        result[i] = array[i];
    }

    result[length] = value;
    return result;
});

var _JsArray_foldl = F3(function(func, acc, array)
{
    var length = array.length;

    for (var i = 0; i < length; i++)
    {
        acc = A2(func, array[i], acc);
    }

    return acc;
});

var _JsArray_foldr = F3(function(func, acc, array)
{
    for (var i = array.length - 1; i >= 0; i--)
    {
        acc = A2(func, array[i], acc);
    }

    return acc;
});

var _JsArray_map = F2(function(func, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = func(array[i]);
    }

    return result;
});

var _JsArray_indexedMap = F3(function(func, offset, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = A2(func, offset + i, array[i]);
    }

    return result;
});

var _JsArray_slice = F3(function(from, to, array)
{
    return array.slice(from, to);
});

var _JsArray_appendN = F3(function(n, dest, source)
{
    var destLen = dest.length;
    var itemsToCopy = n - destLen;

    if (itemsToCopy > source.length)
    {
        itemsToCopy = source.length;
    }

    var size = destLen + itemsToCopy;
    var result = new Array(size);

    for (var i = 0; i < destLen; i++)
    {
        result[i] = dest[i];
    }

    for (var i = 0; i < itemsToCopy; i++)
    {
        result[i + destLen] = source[i];
    }

    return result;
});



// LOG

var _Debug_log_UNUSED = F2(function(tag, value)
{
	return value;
});

var _Debug_log = F2(function(tag, value)
{
	console.log(tag + ': ' + _Debug_toString(value));
	return value;
});


// TODOS

function _Debug_todo(moduleName, region)
{
	return function(message) {
		_Debug_crash(8, moduleName, region, message);
	};
}

function _Debug_todoCase(moduleName, region, value)
{
	return function(message) {
		_Debug_crash(9, moduleName, region, value, message);
	};
}


// TO STRING

function _Debug_toString_UNUSED(value)
{
	return '<internals>';
}

function _Debug_toString(value)
{
	return _Debug_toAnsiString(false, value);
}

function _Debug_toAnsiString(ansi, value)
{
	if (typeof value === 'function')
	{
		return _Debug_internalColor(ansi, '<function>');
	}

	if (typeof value === 'boolean')
	{
		return _Debug_ctorColor(ansi, value ? 'True' : 'False');
	}

	if (typeof value === 'number')
	{
		return _Debug_numberColor(ansi, value + '');
	}

	if (value instanceof String)
	{
		return _Debug_charColor(ansi, "'" + _Debug_addSlashes(value, true) + "'");
	}

	if (typeof value === 'string')
	{
		return _Debug_stringColor(ansi, '"' + _Debug_addSlashes(value, false) + '"');
	}

	if (typeof value === 'object' && '$' in value)
	{
		var tag = value.$;

		if (typeof tag === 'number')
		{
			return _Debug_internalColor(ansi, '<internals>');
		}

		if (tag[0] === '#')
		{
			var output = [];
			for (var k in value)
			{
				if (k === '$') continue;
				output.push(_Debug_toAnsiString(ansi, value[k]));
			}
			return '(' + output.join(',') + ')';
		}

		if (tag === 'Set_elm_builtin')
		{
			return _Debug_ctorColor(ansi, 'Set')
				+ _Debug_fadeColor(ansi, '.fromList') + ' '
				+ _Debug_toAnsiString(ansi, elm$core$Set$toList(value));
		}

		if (tag === 'RBNode_elm_builtin' || tag === 'RBEmpty_elm_builtin')
		{
			return _Debug_ctorColor(ansi, 'Dict')
				+ _Debug_fadeColor(ansi, '.fromList') + ' '
				+ _Debug_toAnsiString(ansi, elm$core$Dict$toList(value));
		}

		if (tag === 'Array_elm_builtin')
		{
			return _Debug_ctorColor(ansi, 'Array')
				+ _Debug_fadeColor(ansi, '.fromList') + ' '
				+ _Debug_toAnsiString(ansi, elm$core$Array$toList(value));
		}

		if (tag === '::' || tag === '[]')
		{
			var output = '[';

			value.b && (output += _Debug_toAnsiString(ansi, value.a), value = value.b)

			for (; value.b; value = value.b) // WHILE_CONS
			{
				output += ',' + _Debug_toAnsiString(ansi, value.a);
			}
			return output + ']';
		}

		var output = '';
		for (var i in value)
		{
			if (i === '$') continue;
			var str = _Debug_toAnsiString(ansi, value[i]);
			var c0 = str[0];
			var parenless = c0 === '{' || c0 === '(' || c0 === '[' || c0 === '<' || c0 === '"' || str.indexOf(' ') < 0;
			output += ' ' + (parenless ? str : '(' + str + ')');
		}
		return _Debug_ctorColor(ansi, tag) + output;
	}

	if (typeof DataView === 'function' && value instanceof DataView)
	{
		return _Debug_stringColor(ansi, '<' + value.byteLength + ' bytes>');
	}

	if (typeof File === 'function' && value instanceof File)
	{
		return _Debug_internalColor(ansi, '<' + value.name + '>');
	}

	if (typeof value === 'object')
	{
		var output = [];
		for (var key in value)
		{
			var field = key[0] === '_' ? key.slice(1) : key;
			output.push(_Debug_fadeColor(ansi, field) + ' = ' + _Debug_toAnsiString(ansi, value[key]));
		}
		if (output.length === 0)
		{
			return '{}';
		}
		return '{ ' + output.join(', ') + ' }';
	}

	return _Debug_internalColor(ansi, '<internals>');
}

function _Debug_addSlashes(str, isChar)
{
	var s = str
		.replace(/\\/g, '\\\\')
		.replace(/\n/g, '\\n')
		.replace(/\t/g, '\\t')
		.replace(/\r/g, '\\r')
		.replace(/\v/g, '\\v')
		.replace(/\0/g, '\\0');

	if (isChar)
	{
		return s.replace(/\'/g, '\\\'');
	}
	else
	{
		return s.replace(/\"/g, '\\"');
	}
}

function _Debug_ctorColor(ansi, string)
{
	return ansi ? '\x1b[96m' + string + '\x1b[0m' : string;
}

function _Debug_numberColor(ansi, string)
{
	return ansi ? '\x1b[95m' + string + '\x1b[0m' : string;
}

function _Debug_stringColor(ansi, string)
{
	return ansi ? '\x1b[93m' + string + '\x1b[0m' : string;
}

function _Debug_charColor(ansi, string)
{
	return ansi ? '\x1b[92m' + string + '\x1b[0m' : string;
}

function _Debug_fadeColor(ansi, string)
{
	return ansi ? '\x1b[37m' + string + '\x1b[0m' : string;
}

function _Debug_internalColor(ansi, string)
{
	return ansi ? '\x1b[94m' + string + '\x1b[0m' : string;
}

function _Debug_toHexDigit(n)
{
	return String.fromCharCode(n < 10 ? 48 + n : 55 + n);
}


// CRASH


function _Debug_crash_UNUSED(identifier)
{
	throw new Error('https://github.com/elm/core/blob/1.0.0/hints/' + identifier + '.md');
}


function _Debug_crash(identifier, fact1, fact2, fact3, fact4)
{
	switch(identifier)
	{
		case 0:
			throw new Error('What node should I take over? In JavaScript I need something like:\n\n    Elm.Main.init({\n        node: document.getElementById("elm-node")\n    })\n\nYou need to do this with any Browser.sandbox or Browser.element program.');

		case 1:
			throw new Error('Browser.application programs cannot handle URLs like this:\n\n    ' + document.location.href + '\n\nWhat is the root? The root of your file system? Try looking at this program with `elm reactor` or some other server.');

		case 2:
			var jsonErrorString = fact1;
			throw new Error('Problem with the flags given to your Elm program on initialization.\n\n' + jsonErrorString);

		case 3:
			var portName = fact1;
			throw new Error('There can only be one port named `' + portName + '`, but your program has multiple.');

		case 4:
			var portName = fact1;
			var problem = fact2;
			throw new Error('Trying to send an unexpected type of value through port `' + portName + '`:\n' + problem);

		case 5:
			throw new Error('Trying to use `(==)` on functions.\nThere is no way to know if functions are "the same" in the Elm sense.\nRead more about this at https://package.elm-lang.org/packages/elm/core/latest/Basics#== which describes why it is this way and what the better version will look like.');

		case 6:
			var moduleName = fact1;
			throw new Error('Your page is loading multiple Elm scripts with a module named ' + moduleName + '. Maybe a duplicate script is getting loaded accidentally? If not, rename one of them so I know which is which!');

		case 8:
			var moduleName = fact1;
			var region = fact2;
			var message = fact3;
			throw new Error('TODO in module `' + moduleName + '` ' + _Debug_regionToString(region) + '\n\n' + message);

		case 9:
			var moduleName = fact1;
			var region = fact2;
			var value = fact3;
			var message = fact4;
			throw new Error(
				'TODO in module `' + moduleName + '` from the `case` expression '
				+ _Debug_regionToString(region) + '\n\nIt received the following value:\n\n    '
				+ _Debug_toString(value).replace('\n', '\n    ')
				+ '\n\nBut the branch that handles it says:\n\n    ' + message.replace('\n', '\n    ')
			);

		case 10:
			throw new Error('Bug in https://github.com/elm/virtual-dom/issues');

		case 11:
			throw new Error('Cannot perform mod 0. Division by zero error.');
	}
}

function _Debug_regionToString(region)
{
	if (region.start.line === region.end.line)
	{
		return 'on line ' + region.start.line;
	}
	return 'on lines ' + region.start.line + ' through ' + region.end.line;
}



// EQUALITY

function _Utils_eq(x, y)
{
	for (
		var pair, stack = [], isEqual = _Utils_eqHelp(x, y, 0, stack);
		isEqual && (pair = stack.pop());
		isEqual = _Utils_eqHelp(pair.a, pair.b, 0, stack)
		)
	{}

	return isEqual;
}

function _Utils_eqHelp(x, y, depth, stack)
{
	if (depth > 100)
	{
		stack.push(_Utils_Tuple2(x,y));
		return true;
	}

	if (x === y)
	{
		return true;
	}

	if (typeof x !== 'object' || x === null || y === null)
	{
		typeof x === 'function' && _Debug_crash(5);
		return false;
	}

	/**/
	if (x.$ === 'Set_elm_builtin')
	{
		x = elm$core$Set$toList(x);
		y = elm$core$Set$toList(y);
	}
	if (x.$ === 'RBNode_elm_builtin' || x.$ === 'RBEmpty_elm_builtin')
	{
		x = elm$core$Dict$toList(x);
		y = elm$core$Dict$toList(y);
	}
	//*/

	/**_UNUSED/
	if (x.$ < 0)
	{
		x = elm$core$Dict$toList(x);
		y = elm$core$Dict$toList(y);
	}
	//*/

	for (var key in x)
	{
		if (!_Utils_eqHelp(x[key], y[key], depth + 1, stack))
		{
			return false;
		}
	}
	return true;
}

var _Utils_equal = F2(_Utils_eq);
var _Utils_notEqual = F2(function(a, b) { return !_Utils_eq(a,b); });



// COMPARISONS

// Code in Generate/JavaScript.hs, Basics.js, and List.js depends on
// the particular integer values assigned to LT, EQ, and GT.

function _Utils_cmp(x, y, ord)
{
	if (typeof x !== 'object')
	{
		return x === y ? /*EQ*/ 0 : x < y ? /*LT*/ -1 : /*GT*/ 1;
	}

	/**/
	if (x instanceof String)
	{
		var a = x.valueOf();
		var b = y.valueOf();
		return a === b ? 0 : a < b ? -1 : 1;
	}
	//*/

	/**_UNUSED/
	if (typeof x.$ === 'undefined')
	//*/
	/**/
	if (x.$[0] === '#')
	//*/
	{
		return (ord = _Utils_cmp(x.a, y.a))
			? ord
			: (ord = _Utils_cmp(x.b, y.b))
				? ord
				: _Utils_cmp(x.c, y.c);
	}

	// traverse conses until end of a list or a mismatch
	for (; x.b && y.b && !(ord = _Utils_cmp(x.a, y.a)); x = x.b, y = y.b) {} // WHILE_CONSES
	return ord || (x.b ? /*GT*/ 1 : y.b ? /*LT*/ -1 : /*EQ*/ 0);
}

var _Utils_lt = F2(function(a, b) { return _Utils_cmp(a, b) < 0; });
var _Utils_le = F2(function(a, b) { return _Utils_cmp(a, b) < 1; });
var _Utils_gt = F2(function(a, b) { return _Utils_cmp(a, b) > 0; });
var _Utils_ge = F2(function(a, b) { return _Utils_cmp(a, b) >= 0; });

var _Utils_compare = F2(function(x, y)
{
	var n = _Utils_cmp(x, y);
	return n < 0 ? elm$core$Basics$LT : n ? elm$core$Basics$GT : elm$core$Basics$EQ;
});


// COMMON VALUES

var _Utils_Tuple0_UNUSED = 0;
var _Utils_Tuple0 = { $: '#0' };

function _Utils_Tuple2_UNUSED(a, b) { return { a: a, b: b }; }
function _Utils_Tuple2(a, b) { return { $: '#2', a: a, b: b }; }

function _Utils_Tuple3_UNUSED(a, b, c) { return { a: a, b: b, c: c }; }
function _Utils_Tuple3(a, b, c) { return { $: '#3', a: a, b: b, c: c }; }

function _Utils_chr_UNUSED(c) { return c; }
function _Utils_chr(c) { return new String(c); }


// RECORDS

function _Utils_update(oldRecord, updatedFields)
{
	var newRecord = {};

	for (var key in oldRecord)
	{
		newRecord[key] = oldRecord[key];
	}

	for (var key in updatedFields)
	{
		newRecord[key] = updatedFields[key];
	}

	return newRecord;
}


// APPEND

var _Utils_append = F2(_Utils_ap);

function _Utils_ap(xs, ys)
{
	// append Strings
	if (typeof xs === 'string')
	{
		return xs + ys;
	}

	// append Lists
	if (!xs.b)
	{
		return ys;
	}
	var root = _List_Cons(xs.a, ys);
	xs = xs.b
	for (var curr = root; xs.b; xs = xs.b) // WHILE_CONS
	{
		curr = curr.b = _List_Cons(xs.a, ys);
	}
	return root;
}



var _List_Nil_UNUSED = { $: 0 };
var _List_Nil = { $: '[]' };

function _List_Cons_UNUSED(hd, tl) { return { $: 1, a: hd, b: tl }; }
function _List_Cons(hd, tl) { return { $: '::', a: hd, b: tl }; }


var _List_cons = F2(_List_Cons);

function _List_fromArray(arr)
{
	var out = _List_Nil;
	for (var i = arr.length; i--; )
	{
		out = _List_Cons(arr[i], out);
	}
	return out;
}

function _List_toArray(xs)
{
	for (var out = []; xs.b; xs = xs.b) // WHILE_CONS
	{
		out.push(xs.a);
	}
	return out;
}

var _List_map2 = F3(function(f, xs, ys)
{
	for (var arr = []; xs.b && ys.b; xs = xs.b, ys = ys.b) // WHILE_CONSES
	{
		arr.push(A2(f, xs.a, ys.a));
	}
	return _List_fromArray(arr);
});

var _List_map3 = F4(function(f, xs, ys, zs)
{
	for (var arr = []; xs.b && ys.b && zs.b; xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
	{
		arr.push(A3(f, xs.a, ys.a, zs.a));
	}
	return _List_fromArray(arr);
});

var _List_map4 = F5(function(f, ws, xs, ys, zs)
{
	for (var arr = []; ws.b && xs.b && ys.b && zs.b; ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
	{
		arr.push(A4(f, ws.a, xs.a, ys.a, zs.a));
	}
	return _List_fromArray(arr);
});

var _List_map5 = F6(function(f, vs, ws, xs, ys, zs)
{
	for (var arr = []; vs.b && ws.b && xs.b && ys.b && zs.b; vs = vs.b, ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
	{
		arr.push(A5(f, vs.a, ws.a, xs.a, ys.a, zs.a));
	}
	return _List_fromArray(arr);
});

var _List_sortBy = F2(function(f, xs)
{
	return _List_fromArray(_List_toArray(xs).sort(function(a, b) {
		return _Utils_cmp(f(a), f(b));
	}));
});

var _List_sortWith = F2(function(f, xs)
{
	return _List_fromArray(_List_toArray(xs).sort(function(a, b) {
		var ord = A2(f, a, b);
		return ord === elm$core$Basics$EQ ? 0 : ord === elm$core$Basics$LT ? -1 : 1;
	}));
});



// MATH

var _Basics_add = F2(function(a, b) { return a + b; });
var _Basics_sub = F2(function(a, b) { return a - b; });
var _Basics_mul = F2(function(a, b) { return a * b; });
var _Basics_fdiv = F2(function(a, b) { return a / b; });
var _Basics_idiv = F2(function(a, b) { return (a / b) | 0; });
var _Basics_pow = F2(Math.pow);

var _Basics_remainderBy = F2(function(b, a) { return a % b; });

// https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/divmodnote-letter.pdf
var _Basics_modBy = F2(function(modulus, x)
{
	var answer = x % modulus;
	return modulus === 0
		? _Debug_crash(11)
		:
	((answer > 0 && modulus < 0) || (answer < 0 && modulus > 0))
		? answer + modulus
		: answer;
});


// TRIGONOMETRY

var _Basics_pi = Math.PI;
var _Basics_e = Math.E;
var _Basics_cos = Math.cos;
var _Basics_sin = Math.sin;
var _Basics_tan = Math.tan;
var _Basics_acos = Math.acos;
var _Basics_asin = Math.asin;
var _Basics_atan = Math.atan;
var _Basics_atan2 = F2(Math.atan2);


// MORE MATH

function _Basics_toFloat(x) { return x; }
function _Basics_truncate(n) { return n | 0; }
function _Basics_isInfinite(n) { return n === Infinity || n === -Infinity; }

var _Basics_ceiling = Math.ceil;
var _Basics_floor = Math.floor;
var _Basics_round = Math.round;
var _Basics_sqrt = Math.sqrt;
var _Basics_log = Math.log;
var _Basics_isNaN = isNaN;


// BOOLEANS

function _Basics_not(bool) { return !bool; }
var _Basics_and = F2(function(a, b) { return a && b; });
var _Basics_or  = F2(function(a, b) { return a || b; });
var _Basics_xor = F2(function(a, b) { return a !== b; });



var _String_cons = F2(function(chr, str)
{
	return chr + str;
});

function _String_uncons(string)
{
	var word = string.charCodeAt(0);
	return word
		? elm$core$Maybe$Just(
			0xD800 <= word && word <= 0xDBFF
				? _Utils_Tuple2(_Utils_chr(string[0] + string[1]), string.slice(2))
				: _Utils_Tuple2(_Utils_chr(string[0]), string.slice(1))
		)
		: elm$core$Maybe$Nothing;
}

var _String_append = F2(function(a, b)
{
	return a + b;
});

function _String_length(str)
{
	return str.length;
}

var _String_map = F2(function(func, string)
{
	var len = string.length;
	var array = new Array(len);
	var i = 0;
	while (i < len)
	{
		var word = string.charCodeAt(i);
		if (0xD800 <= word && word <= 0xDBFF)
		{
			array[i] = func(_Utils_chr(string[i] + string[i+1]));
			i += 2;
			continue;
		}
		array[i] = func(_Utils_chr(string[i]));
		i++;
	}
	return array.join('');
});

var _String_filter = F2(function(isGood, str)
{
	var arr = [];
	var len = str.length;
	var i = 0;
	while (i < len)
	{
		var char = str[i];
		var word = str.charCodeAt(i);
		i++;
		if (0xD800 <= word && word <= 0xDBFF)
		{
			char += str[i];
			i++;
		}

		if (isGood(_Utils_chr(char)))
		{
			arr.push(char);
		}
	}
	return arr.join('');
});

function _String_reverse(str)
{
	var len = str.length;
	var arr = new Array(len);
	var i = 0;
	while (i < len)
	{
		var word = str.charCodeAt(i);
		if (0xD800 <= word && word <= 0xDBFF)
		{
			arr[len - i] = str[i + 1];
			i++;
			arr[len - i] = str[i - 1];
			i++;
		}
		else
		{
			arr[len - i] = str[i];
			i++;
		}
	}
	return arr.join('');
}

var _String_foldl = F3(function(func, state, string)
{
	var len = string.length;
	var i = 0;
	while (i < len)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		i++;
		if (0xD800 <= word && word <= 0xDBFF)
		{
			char += string[i];
			i++;
		}
		state = A2(func, _Utils_chr(char), state);
	}
	return state;
});

var _String_foldr = F3(function(func, state, string)
{
	var i = string.length;
	while (i--)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		if (0xDC00 <= word && word <= 0xDFFF)
		{
			i--;
			char = string[i] + char;
		}
		state = A2(func, _Utils_chr(char), state);
	}
	return state;
});

var _String_split = F2(function(sep, str)
{
	return str.split(sep);
});

var _String_join = F2(function(sep, strs)
{
	return strs.join(sep);
});

var _String_slice = F3(function(start, end, str) {
	return str.slice(start, end);
});

function _String_trim(str)
{
	return str.trim();
}

function _String_trimLeft(str)
{
	return str.replace(/^\s+/, '');
}

function _String_trimRight(str)
{
	return str.replace(/\s+$/, '');
}

function _String_words(str)
{
	return _List_fromArray(str.trim().split(/\s+/g));
}

function _String_lines(str)
{
	return _List_fromArray(str.split(/\r\n|\r|\n/g));
}

function _String_toUpper(str)
{
	return str.toUpperCase();
}

function _String_toLower(str)
{
	return str.toLowerCase();
}

var _String_any = F2(function(isGood, string)
{
	var i = string.length;
	while (i--)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		if (0xDC00 <= word && word <= 0xDFFF)
		{
			i--;
			char = string[i] + char;
		}
		if (isGood(_Utils_chr(char)))
		{
			return true;
		}
	}
	return false;
});

var _String_all = F2(function(isGood, string)
{
	var i = string.length;
	while (i--)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		if (0xDC00 <= word && word <= 0xDFFF)
		{
			i--;
			char = string[i] + char;
		}
		if (!isGood(_Utils_chr(char)))
		{
			return false;
		}
	}
	return true;
});

var _String_contains = F2(function(sub, str)
{
	return str.indexOf(sub) > -1;
});

var _String_startsWith = F2(function(sub, str)
{
	return str.indexOf(sub) === 0;
});

var _String_endsWith = F2(function(sub, str)
{
	return str.length >= sub.length &&
		str.lastIndexOf(sub) === str.length - sub.length;
});

var _String_indexes = F2(function(sub, str)
{
	var subLen = sub.length;

	if (subLen < 1)
	{
		return _List_Nil;
	}

	var i = 0;
	var is = [];

	while ((i = str.indexOf(sub, i)) > -1)
	{
		is.push(i);
		i = i + subLen;
	}

	return _List_fromArray(is);
});


// TO STRING

function _String_fromNumber(number)
{
	return number + '';
}


// INT CONVERSIONS

function _String_toInt(str)
{
	var total = 0;
	var code0 = str.charCodeAt(0);
	var start = code0 == 0x2B /* + */ || code0 == 0x2D /* - */ ? 1 : 0;

	for (var i = start; i < str.length; ++i)
	{
		var code = str.charCodeAt(i);
		if (code < 0x30 || 0x39 < code)
		{
			return elm$core$Maybe$Nothing;
		}
		total = 10 * total + code - 0x30;
	}

	return i == start
		? elm$core$Maybe$Nothing
		: elm$core$Maybe$Just(code0 == 0x2D ? -total : total);
}


// FLOAT CONVERSIONS

function _String_toFloat(s)
{
	// check if it is a hex, octal, or binary number
	if (s.length === 0 || /[\sxbo]/.test(s))
	{
		return elm$core$Maybe$Nothing;
	}
	var n = +s;
	// faster isNaN check
	return n === n ? elm$core$Maybe$Just(n) : elm$core$Maybe$Nothing;
}

function _String_fromList(chars)
{
	return _List_toArray(chars).join('');
}



function _Url_percentEncode(string)
{
	return encodeURIComponent(string);
}

function _Url_percentDecode(string)
{
	try
	{
		return elm$core$Maybe$Just(decodeURIComponent(string));
	}
	catch (e)
	{
		return elm$core$Maybe$Nothing;
	}
}


function _Char_toCode(char)
{
	var code = char.charCodeAt(0);
	if (0xD800 <= code && code <= 0xDBFF)
	{
		return (code - 0xD800) * 0x400 + char.charCodeAt(1) - 0xDC00 + 0x10000
	}
	return code;
}

function _Char_fromCode(code)
{
	return _Utils_chr(
		(code < 0 || 0x10FFFF < code)
			? '\uFFFD'
			:
		(code <= 0xFFFF)
			? String.fromCharCode(code)
			:
		(code -= 0x10000,
			String.fromCharCode(Math.floor(code / 0x400) + 0xD800, code % 0x400 + 0xDC00)
		)
	);
}

function _Char_toUpper(char)
{
	return _Utils_chr(char.toUpperCase());
}

function _Char_toLower(char)
{
	return _Utils_chr(char.toLowerCase());
}

function _Char_toLocaleUpper(char)
{
	return _Utils_chr(char.toLocaleUpperCase());
}

function _Char_toLocaleLower(char)
{
	return _Utils_chr(char.toLocaleLowerCase());
}



/**/
function _Json_errorToString(error)
{
	return elm$json$Json$Decode$errorToString(error);
}
//*/


// CORE DECODERS

function _Json_succeed(msg)
{
	return {
		$: 0,
		a: msg
	};
}

function _Json_fail(msg)
{
	return {
		$: 1,
		a: msg
	};
}

function _Json_decodePrim(decoder)
{
	return { $: 2, b: decoder };
}

var _Json_decodeInt = _Json_decodePrim(function(value) {
	return (typeof value !== 'number')
		? _Json_expecting('an INT', value)
		:
	(-2147483647 < value && value < 2147483647 && (value | 0) === value)
		? elm$core$Result$Ok(value)
		:
	(isFinite(value) && !(value % 1))
		? elm$core$Result$Ok(value)
		: _Json_expecting('an INT', value);
});

var _Json_decodeBool = _Json_decodePrim(function(value) {
	return (typeof value === 'boolean')
		? elm$core$Result$Ok(value)
		: _Json_expecting('a BOOL', value);
});

var _Json_decodeFloat = _Json_decodePrim(function(value) {
	return (typeof value === 'number')
		? elm$core$Result$Ok(value)
		: _Json_expecting('a FLOAT', value);
});

var _Json_decodeValue = _Json_decodePrim(function(value) {
	return elm$core$Result$Ok(_Json_wrap(value));
});

var _Json_decodeString = _Json_decodePrim(function(value) {
	return (typeof value === 'string')
		? elm$core$Result$Ok(value)
		: (value instanceof String)
			? elm$core$Result$Ok(value + '')
			: _Json_expecting('a STRING', value);
});

function _Json_decodeList(decoder) { return { $: 3, b: decoder }; }
function _Json_decodeArray(decoder) { return { $: 4, b: decoder }; }

function _Json_decodeNull(value) { return { $: 5, c: value }; }

var _Json_decodeField = F2(function(field, decoder)
{
	return {
		$: 6,
		d: field,
		b: decoder
	};
});

var _Json_decodeIndex = F2(function(index, decoder)
{
	return {
		$: 7,
		e: index,
		b: decoder
	};
});

function _Json_decodeKeyValuePairs(decoder)
{
	return {
		$: 8,
		b: decoder
	};
}

function _Json_mapMany(f, decoders)
{
	return {
		$: 9,
		f: f,
		g: decoders
	};
}

var _Json_andThen = F2(function(callback, decoder)
{
	return {
		$: 10,
		b: decoder,
		h: callback
	};
});

function _Json_oneOf(decoders)
{
	return {
		$: 11,
		g: decoders
	};
}


// DECODING OBJECTS

var _Json_map1 = F2(function(f, d1)
{
	return _Json_mapMany(f, [d1]);
});

var _Json_map2 = F3(function(f, d1, d2)
{
	return _Json_mapMany(f, [d1, d2]);
});

var _Json_map3 = F4(function(f, d1, d2, d3)
{
	return _Json_mapMany(f, [d1, d2, d3]);
});

var _Json_map4 = F5(function(f, d1, d2, d3, d4)
{
	return _Json_mapMany(f, [d1, d2, d3, d4]);
});

var _Json_map5 = F6(function(f, d1, d2, d3, d4, d5)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5]);
});

var _Json_map6 = F7(function(f, d1, d2, d3, d4, d5, d6)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5, d6]);
});

var _Json_map7 = F8(function(f, d1, d2, d3, d4, d5, d6, d7)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7]);
});

var _Json_map8 = F9(function(f, d1, d2, d3, d4, d5, d6, d7, d8)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7, d8]);
});


// DECODE

var _Json_runOnString = F2(function(decoder, string)
{
	try
	{
		var value = JSON.parse(string);
		return _Json_runHelp(decoder, value);
	}
	catch (e)
	{
		return elm$core$Result$Err(A2(elm$json$Json$Decode$Failure, 'This is not valid JSON! ' + e.message, _Json_wrap(string)));
	}
});

var _Json_run = F2(function(decoder, value)
{
	return _Json_runHelp(decoder, _Json_unwrap(value));
});

function _Json_runHelp(decoder, value)
{
	switch (decoder.$)
	{
		case 2:
			return decoder.b(value);

		case 5:
			return (value === null)
				? elm$core$Result$Ok(decoder.c)
				: _Json_expecting('null', value);

		case 3:
			if (!_Json_isArray(value))
			{
				return _Json_expecting('a LIST', value);
			}
			return _Json_runArrayDecoder(decoder.b, value, _List_fromArray);

		case 4:
			if (!_Json_isArray(value))
			{
				return _Json_expecting('an ARRAY', value);
			}
			return _Json_runArrayDecoder(decoder.b, value, _Json_toElmArray);

		case 6:
			var field = decoder.d;
			if (typeof value !== 'object' || value === null || !(field in value))
			{
				return _Json_expecting('an OBJECT with a field named `' + field + '`', value);
			}
			var result = _Json_runHelp(decoder.b, value[field]);
			return (elm$core$Result$isOk(result)) ? result : elm$core$Result$Err(A2(elm$json$Json$Decode$Field, field, result.a));

		case 7:
			var index = decoder.e;
			if (!_Json_isArray(value))
			{
				return _Json_expecting('an ARRAY', value);
			}
			if (index >= value.length)
			{
				return _Json_expecting('a LONGER array. Need index ' + index + ' but only see ' + value.length + ' entries', value);
			}
			var result = _Json_runHelp(decoder.b, value[index]);
			return (elm$core$Result$isOk(result)) ? result : elm$core$Result$Err(A2(elm$json$Json$Decode$Index, index, result.a));

		case 8:
			if (typeof value !== 'object' || value === null || _Json_isArray(value))
			{
				return _Json_expecting('an OBJECT', value);
			}

			var keyValuePairs = _List_Nil;
			// TODO test perf of Object.keys and switch when support is good enough
			for (var key in value)
			{
				if (value.hasOwnProperty(key))
				{
					var result = _Json_runHelp(decoder.b, value[key]);
					if (!elm$core$Result$isOk(result))
					{
						return elm$core$Result$Err(A2(elm$json$Json$Decode$Field, key, result.a));
					}
					keyValuePairs = _List_Cons(_Utils_Tuple2(key, result.a), keyValuePairs);
				}
			}
			return elm$core$Result$Ok(elm$core$List$reverse(keyValuePairs));

		case 9:
			var answer = decoder.f;
			var decoders = decoder.g;
			for (var i = 0; i < decoders.length; i++)
			{
				var result = _Json_runHelp(decoders[i], value);
				if (!elm$core$Result$isOk(result))
				{
					return result;
				}
				answer = answer(result.a);
			}
			return elm$core$Result$Ok(answer);

		case 10:
			var result = _Json_runHelp(decoder.b, value);
			return (!elm$core$Result$isOk(result))
				? result
				: _Json_runHelp(decoder.h(result.a), value);

		case 11:
			var errors = _List_Nil;
			for (var temp = decoder.g; temp.b; temp = temp.b) // WHILE_CONS
			{
				var result = _Json_runHelp(temp.a, value);
				if (elm$core$Result$isOk(result))
				{
					return result;
				}
				errors = _List_Cons(result.a, errors);
			}
			return elm$core$Result$Err(elm$json$Json$Decode$OneOf(elm$core$List$reverse(errors)));

		case 1:
			return elm$core$Result$Err(A2(elm$json$Json$Decode$Failure, decoder.a, _Json_wrap(value)));

		case 0:
			return elm$core$Result$Ok(decoder.a);
	}
}

function _Json_runArrayDecoder(decoder, value, toElmValue)
{
	var len = value.length;
	var array = new Array(len);
	for (var i = 0; i < len; i++)
	{
		var result = _Json_runHelp(decoder, value[i]);
		if (!elm$core$Result$isOk(result))
		{
			return elm$core$Result$Err(A2(elm$json$Json$Decode$Index, i, result.a));
		}
		array[i] = result.a;
	}
	return elm$core$Result$Ok(toElmValue(array));
}

function _Json_isArray(value)
{
	return Array.isArray(value) || (typeof FileList !== 'undefined' && value instanceof FileList);
}

function _Json_toElmArray(array)
{
	return A2(elm$core$Array$initialize, array.length, function(i) { return array[i]; });
}

function _Json_expecting(type, value)
{
	return elm$core$Result$Err(A2(elm$json$Json$Decode$Failure, 'Expecting ' + type, _Json_wrap(value)));
}


// EQUALITY

function _Json_equality(x, y)
{
	if (x === y)
	{
		return true;
	}

	if (x.$ !== y.$)
	{
		return false;
	}

	switch (x.$)
	{
		case 0:
		case 1:
			return x.a === y.a;

		case 2:
			return x.b === y.b;

		case 5:
			return x.c === y.c;

		case 3:
		case 4:
		case 8:
			return _Json_equality(x.b, y.b);

		case 6:
			return x.d === y.d && _Json_equality(x.b, y.b);

		case 7:
			return x.e === y.e && _Json_equality(x.b, y.b);

		case 9:
			return x.f === y.f && _Json_listEquality(x.g, y.g);

		case 10:
			return x.h === y.h && _Json_equality(x.b, y.b);

		case 11:
			return _Json_listEquality(x.g, y.g);
	}
}

function _Json_listEquality(aDecoders, bDecoders)
{
	var len = aDecoders.length;
	if (len !== bDecoders.length)
	{
		return false;
	}
	for (var i = 0; i < len; i++)
	{
		if (!_Json_equality(aDecoders[i], bDecoders[i]))
		{
			return false;
		}
	}
	return true;
}


// ENCODE

var _Json_encode = F2(function(indentLevel, value)
{
	return JSON.stringify(_Json_unwrap(value), null, indentLevel) + '';
});

function _Json_wrap(value) { return { $: 0, a: value }; }
function _Json_unwrap(value) { return value.a; }

function _Json_wrap_UNUSED(value) { return value; }
function _Json_unwrap_UNUSED(value) { return value; }

function _Json_emptyArray() { return []; }
function _Json_emptyObject() { return {}; }

var _Json_addField = F3(function(key, value, object)
{
	object[key] = _Json_unwrap(value);
	return object;
});

function _Json_addEntry(func)
{
	return F2(function(entry, array)
	{
		array.push(_Json_unwrap(func(entry)));
		return array;
	});
}

var _Json_encodeNull = _Json_wrap(null);



// TASKS

function _Scheduler_succeed(value)
{
	return {
		$: 0,
		a: value
	};
}

function _Scheduler_fail(error)
{
	return {
		$: 1,
		a: error
	};
}

function _Scheduler_binding(callback)
{
	return {
		$: 2,
		b: callback,
		c: null
	};
}

var _Scheduler_andThen = F2(function(callback, task)
{
	return {
		$: 3,
		b: callback,
		d: task
	};
});

var _Scheduler_onError = F2(function(callback, task)
{
	return {
		$: 4,
		b: callback,
		d: task
	};
});

function _Scheduler_receive(callback)
{
	return {
		$: 5,
		b: callback
	};
}


// PROCESSES

var _Scheduler_guid = 0;

function _Scheduler_rawSpawn(task)
{
	var proc = {
		$: 0,
		e: _Scheduler_guid++,
		f: task,
		g: null,
		h: []
	};

	_Scheduler_enqueue(proc);

	return proc;
}

function _Scheduler_spawn(task)
{
	return _Scheduler_binding(function(callback) {
		callback(_Scheduler_succeed(_Scheduler_rawSpawn(task)));
	});
}

function _Scheduler_rawSend(proc, msg)
{
	proc.h.push(msg);
	_Scheduler_enqueue(proc);
}

var _Scheduler_send = F2(function(proc, msg)
{
	return _Scheduler_binding(function(callback) {
		_Scheduler_rawSend(proc, msg);
		callback(_Scheduler_succeed(_Utils_Tuple0));
	});
});

function _Scheduler_kill(proc)
{
	return _Scheduler_binding(function(callback) {
		var task = proc.f;
		if (task.$ === 2 && task.c)
		{
			task.c();
		}

		proc.f = null;

		callback(_Scheduler_succeed(_Utils_Tuple0));
	});
}


/* STEP PROCESSES

type alias Process =
  { $ : tag
  , id : unique_id
  , root : Task
  , stack : null | { $: SUCCEED | FAIL, a: callback, b: stack }
  , mailbox : [msg]
  }

*/


var _Scheduler_working = false;
var _Scheduler_queue = [];


function _Scheduler_enqueue(proc)
{
	_Scheduler_queue.push(proc);
	if (_Scheduler_working)
	{
		return;
	}
	_Scheduler_working = true;
	while (proc = _Scheduler_queue.shift())
	{
		_Scheduler_step(proc);
	}
	_Scheduler_working = false;
}


function _Scheduler_step(proc)
{
	while (proc.f)
	{
		var rootTag = proc.f.$;
		if (rootTag === 0 || rootTag === 1)
		{
			while (proc.g && proc.g.$ !== rootTag)
			{
				proc.g = proc.g.i;
			}
			if (!proc.g)
			{
				return;
			}
			proc.f = proc.g.b(proc.f.a);
			proc.g = proc.g.i;
		}
		else if (rootTag === 2)
		{
			proc.f.c = proc.f.b(function(newRoot) {
				proc.f = newRoot;
				_Scheduler_enqueue(proc);
			});
			return;
		}
		else if (rootTag === 5)
		{
			if (proc.h.length === 0)
			{
				return;
			}
			proc.f = proc.f.b(proc.h.shift());
		}
		else // if (rootTag === 3 || rootTag === 4)
		{
			proc.g = {
				$: rootTag === 3 ? 0 : 1,
				b: proc.f.b,
				i: proc.g
			};
			proc.f = proc.f.d;
		}
	}
}



function _Process_sleep(time)
{
	return _Scheduler_binding(function(callback) {
		var id = setTimeout(function() {
			callback(_Scheduler_succeed(_Utils_Tuple0));
		}, time);

		return function() { clearTimeout(id); };
	});
}




// PROGRAMS


var _Platform_worker = F4(function(impl, flagDecoder, debugMetadata, args)
{
	return _Platform_initialize(
		flagDecoder,
		args,
		impl.init,
		impl.update,
		impl.subscriptions,
		function() { return function() {} }
	);
});



// INITIALIZE A PROGRAM


function _Platform_initialize(flagDecoder, args, init, update, subscriptions, stepperBuilder)
{
	var result = A2(_Json_run, flagDecoder, _Json_wrap(args ? args['flags'] : undefined));
	elm$core$Result$isOk(result) || _Debug_crash(2 /**/, _Json_errorToString(result.a) /**/);
	var managers = {};
	result = init(result.a);
	var model = result.a;
	var stepper = stepperBuilder(sendToApp, model);
	var ports = _Platform_setupEffects(managers, sendToApp);

	function sendToApp(msg, viewMetadata)
	{
		result = A2(update, msg, model);
		stepper(model = result.a, viewMetadata);
		_Platform_dispatchEffects(managers, result.b, subscriptions(model));
	}

	_Platform_dispatchEffects(managers, result.b, subscriptions(model));

	return ports ? { ports: ports } : {};
}



// TRACK PRELOADS
//
// This is used by code in elm/browser and elm/http
// to register any HTTP requests that are triggered by init.
//


var _Platform_preload;


function _Platform_registerPreload(url)
{
	_Platform_preload.add(url);
}



// EFFECT MANAGERS


var _Platform_effectManagers = {};


function _Platform_setupEffects(managers, sendToApp)
{
	var ports;

	// setup all necessary effect managers
	for (var key in _Platform_effectManagers)
	{
		var manager = _Platform_effectManagers[key];

		if (manager.a)
		{
			ports = ports || {};
			ports[key] = manager.a(key, sendToApp);
		}

		managers[key] = _Platform_instantiateManager(manager, sendToApp);
	}

	return ports;
}


function _Platform_createManager(init, onEffects, onSelfMsg, cmdMap, subMap)
{
	return {
		b: init,
		c: onEffects,
		d: onSelfMsg,
		e: cmdMap,
		f: subMap
	};
}


function _Platform_instantiateManager(info, sendToApp)
{
	var router = {
		g: sendToApp,
		h: undefined
	};

	var onEffects = info.c;
	var onSelfMsg = info.d;
	var cmdMap = info.e;
	var subMap = info.f;

	function loop(state)
	{
		return A2(_Scheduler_andThen, loop, _Scheduler_receive(function(msg)
		{
			var value = msg.a;

			if (msg.$ === 0)
			{
				return A3(onSelfMsg, router, value, state);
			}

			return cmdMap && subMap
				? A4(onEffects, router, value.i, value.j, state)
				: A3(onEffects, router, cmdMap ? value.i : value.j, state);
		}));
	}

	return router.h = _Scheduler_rawSpawn(A2(_Scheduler_andThen, loop, info.b));
}



// ROUTING


var _Platform_sendToApp = F2(function(router, msg)
{
	return _Scheduler_binding(function(callback)
	{
		router.g(msg);
		callback(_Scheduler_succeed(_Utils_Tuple0));
	});
});


var _Platform_sendToSelf = F2(function(router, msg)
{
	return A2(_Scheduler_send, router.h, {
		$: 0,
		a: msg
	});
});



// BAGS


function _Platform_leaf(home)
{
	return function(value)
	{
		return {
			$: 1,
			k: home,
			l: value
		};
	};
}


function _Platform_batch(list)
{
	return {
		$: 2,
		m: list
	};
}


var _Platform_map = F2(function(tagger, bag)
{
	return {
		$: 3,
		n: tagger,
		o: bag
	}
});



// PIPE BAGS INTO EFFECT MANAGERS


function _Platform_dispatchEffects(managers, cmdBag, subBag)
{
	var effectsDict = {};
	_Platform_gatherEffects(true, cmdBag, effectsDict, null);
	_Platform_gatherEffects(false, subBag, effectsDict, null);

	for (var home in managers)
	{
		_Scheduler_rawSend(managers[home], {
			$: 'fx',
			a: effectsDict[home] || { i: _List_Nil, j: _List_Nil }
		});
	}
}


function _Platform_gatherEffects(isCmd, bag, effectsDict, taggers)
{
	switch (bag.$)
	{
		case 1:
			var home = bag.k;
			var effect = _Platform_toEffect(isCmd, home, taggers, bag.l);
			effectsDict[home] = _Platform_insert(isCmd, effect, effectsDict[home]);
			return;

		case 2:
			for (var list = bag.m; list.b; list = list.b) // WHILE_CONS
			{
				_Platform_gatherEffects(isCmd, list.a, effectsDict, taggers);
			}
			return;

		case 3:
			_Platform_gatherEffects(isCmd, bag.o, effectsDict, {
				p: bag.n,
				q: taggers
			});
			return;
	}
}


function _Platform_toEffect(isCmd, home, taggers, value)
{
	function applyTaggers(x)
	{
		for (var temp = taggers; temp; temp = temp.q)
		{
			x = temp.p(x);
		}
		return x;
	}

	var map = isCmd
		? _Platform_effectManagers[home].e
		: _Platform_effectManagers[home].f;

	return A2(map, applyTaggers, value)
}


function _Platform_insert(isCmd, newEffect, effects)
{
	effects = effects || { i: _List_Nil, j: _List_Nil };

	isCmd
		? (effects.i = _List_Cons(newEffect, effects.i))
		: (effects.j = _List_Cons(newEffect, effects.j));

	return effects;
}



// PORTS


function _Platform_checkPortName(name)
{
	if (_Platform_effectManagers[name])
	{
		_Debug_crash(3, name)
	}
}



// OUTGOING PORTS


function _Platform_outgoingPort(name, converter)
{
	_Platform_checkPortName(name);
	_Platform_effectManagers[name] = {
		e: _Platform_outgoingPortMap,
		r: converter,
		a: _Platform_setupOutgoingPort
	};
	return _Platform_leaf(name);
}


var _Platform_outgoingPortMap = F2(function(tagger, value) { return value; });


function _Platform_setupOutgoingPort(name)
{
	var subs = [];
	var converter = _Platform_effectManagers[name].r;

	// CREATE MANAGER

	var init = _Process_sleep(0);

	_Platform_effectManagers[name].b = init;
	_Platform_effectManagers[name].c = F3(function(router, cmdList, state)
	{
		for ( ; cmdList.b; cmdList = cmdList.b) // WHILE_CONS
		{
			// grab a separate reference to subs in case unsubscribe is called
			var currentSubs = subs;
			var value = _Json_unwrap(converter(cmdList.a));
			for (var i = 0; i < currentSubs.length; i++)
			{
				currentSubs[i](value);
			}
		}
		return init;
	});

	// PUBLIC API

	function subscribe(callback)
	{
		subs.push(callback);
	}

	function unsubscribe(callback)
	{
		// copy subs into a new array in case unsubscribe is called within a
		// subscribed callback
		subs = subs.slice();
		var index = subs.indexOf(callback);
		if (index >= 0)
		{
			subs.splice(index, 1);
		}
	}

	return {
		subscribe: subscribe,
		unsubscribe: unsubscribe
	};
}



// INCOMING PORTS


function _Platform_incomingPort(name, converter)
{
	_Platform_checkPortName(name);
	_Platform_effectManagers[name] = {
		f: _Platform_incomingPortMap,
		r: converter,
		a: _Platform_setupIncomingPort
	};
	return _Platform_leaf(name);
}


var _Platform_incomingPortMap = F2(function(tagger, finalTagger)
{
	return function(value)
	{
		return tagger(finalTagger(value));
	};
});


function _Platform_setupIncomingPort(name, sendToApp)
{
	var subs = _List_Nil;
	var converter = _Platform_effectManagers[name].r;

	// CREATE MANAGER

	var init = _Scheduler_succeed(null);

	_Platform_effectManagers[name].b = init;
	_Platform_effectManagers[name].c = F3(function(router, subList, state)
	{
		subs = subList;
		return init;
	});

	// PUBLIC API

	function send(incomingValue)
	{
		var result = A2(_Json_run, converter, _Json_wrap(incomingValue));

		elm$core$Result$isOk(result) || _Debug_crash(4, name, result.a);

		var value = result.a;
		for (var temp = subs; temp.b; temp = temp.b) // WHILE_CONS
		{
			sendToApp(temp.a(value));
		}
	}

	return { send: send };
}



// EXPORT ELM MODULES
//
// Have DEBUG and PROD versions so that we can (1) give nicer errors in
// debug mode and (2) not pay for the bits needed for that in prod mode.
//


function _Platform_export_UNUSED(exports)
{
	scope['Elm']
		? _Platform_mergeExportsProd(scope['Elm'], exports)
		: scope['Elm'] = exports;
}


function _Platform_mergeExportsProd(obj, exports)
{
	for (var name in exports)
	{
		(name in obj)
			? (name == 'init')
				? _Debug_crash(6)
				: _Platform_mergeExportsProd(obj[name], exports[name])
			: (obj[name] = exports[name]);
	}
}


function _Platform_export(exports)
{
	scope['Elm']
		? _Platform_mergeExportsDebug('Elm', scope['Elm'], exports)
		: scope['Elm'] = exports;
}


function _Platform_mergeExportsDebug(moduleName, obj, exports)
{
	for (var name in exports)
	{
		(name in obj)
			? (name == 'init')
				? _Debug_crash(6, moduleName)
				: _Platform_mergeExportsDebug(moduleName + '.' + name, obj[name], exports[name])
			: (obj[name] = exports[name]);
	}
}




// HELPERS


var _VirtualDom_divertHrefToApp;

var _VirtualDom_doc = typeof document !== 'undefined' ? document : {};


function _VirtualDom_appendChild(parent, child)
{
	parent.appendChild(child);
}

var _VirtualDom_init = F4(function(virtualNode, flagDecoder, debugMetadata, args)
{
	// NOTE: this function needs _Platform_export available to work

	/**_UNUSED/
	var node = args['node'];
	//*/
	/**/
	var node = args && args['node'] ? args['node'] : _Debug_crash(0);
	//*/

	node.parentNode.replaceChild(
		_VirtualDom_render(virtualNode, function() {}),
		node
	);

	return {};
});



// TEXT


function _VirtualDom_text(string)
{
	return {
		$: 0,
		a: string
	};
}



// NODE


var _VirtualDom_nodeNS = F2(function(namespace, tag)
{
	return F2(function(factList, kidList)
	{
		for (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS
		{
			var kid = kidList.a;
			descendantsCount += (kid.b || 0);
			kids.push(kid);
		}
		descendantsCount += kids.length;

		return {
			$: 1,
			c: tag,
			d: _VirtualDom_organizeFacts(factList),
			e: kids,
			f: namespace,
			b: descendantsCount
		};
	});
});


var _VirtualDom_node = _VirtualDom_nodeNS(undefined);



// KEYED NODE


var _VirtualDom_keyedNodeNS = F2(function(namespace, tag)
{
	return F2(function(factList, kidList)
	{
		for (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS
		{
			var kid = kidList.a;
			descendantsCount += (kid.b.b || 0);
			kids.push(kid);
		}
		descendantsCount += kids.length;

		return {
			$: 2,
			c: tag,
			d: _VirtualDom_organizeFacts(factList),
			e: kids,
			f: namespace,
			b: descendantsCount
		};
	});
});


var _VirtualDom_keyedNode = _VirtualDom_keyedNodeNS(undefined);



// CUSTOM


function _VirtualDom_custom(factList, model, render, diff)
{
	return {
		$: 3,
		d: _VirtualDom_organizeFacts(factList),
		g: model,
		h: render,
		i: diff
	};
}



// MAP


var _VirtualDom_map = F2(function(tagger, node)
{
	return {
		$: 4,
		j: tagger,
		k: node,
		b: 1 + (node.b || 0)
	};
});



// LAZY


function _VirtualDom_thunk(refs, thunk)
{
	return {
		$: 5,
		l: refs,
		m: thunk,
		k: undefined
	};
}

var _VirtualDom_lazy = F2(function(func, a)
{
	return _VirtualDom_thunk([func, a], function() {
		return func(a);
	});
});

var _VirtualDom_lazy2 = F3(function(func, a, b)
{
	return _VirtualDom_thunk([func, a, b], function() {
		return A2(func, a, b);
	});
});

var _VirtualDom_lazy3 = F4(function(func, a, b, c)
{
	return _VirtualDom_thunk([func, a, b, c], function() {
		return A3(func, a, b, c);
	});
});

var _VirtualDom_lazy4 = F5(function(func, a, b, c, d)
{
	return _VirtualDom_thunk([func, a, b, c, d], function() {
		return A4(func, a, b, c, d);
	});
});

var _VirtualDom_lazy5 = F6(function(func, a, b, c, d, e)
{
	return _VirtualDom_thunk([func, a, b, c, d, e], function() {
		return A5(func, a, b, c, d, e);
	});
});

var _VirtualDom_lazy6 = F7(function(func, a, b, c, d, e, f)
{
	return _VirtualDom_thunk([func, a, b, c, d, e, f], function() {
		return A6(func, a, b, c, d, e, f);
	});
});

var _VirtualDom_lazy7 = F8(function(func, a, b, c, d, e, f, g)
{
	return _VirtualDom_thunk([func, a, b, c, d, e, f, g], function() {
		return A7(func, a, b, c, d, e, f, g);
	});
});

var _VirtualDom_lazy8 = F9(function(func, a, b, c, d, e, f, g, h)
{
	return _VirtualDom_thunk([func, a, b, c, d, e, f, g, h], function() {
		return A8(func, a, b, c, d, e, f, g, h);
	});
});



// FACTS


var _VirtualDom_on = F2(function(key, handler)
{
	return {
		$: 'a0',
		n: key,
		o: handler
	};
});
var _VirtualDom_style = F2(function(key, value)
{
	return {
		$: 'a1',
		n: key,
		o: value
	};
});
var _VirtualDom_property = F2(function(key, value)
{
	return {
		$: 'a2',
		n: key,
		o: value
	};
});
var _VirtualDom_attribute = F2(function(key, value)
{
	return {
		$: 'a3',
		n: key,
		o: value
	};
});
var _VirtualDom_attributeNS = F3(function(namespace, key, value)
{
	return {
		$: 'a4',
		n: key,
		o: { f: namespace, o: value }
	};
});



// XSS ATTACK VECTOR CHECKS


function _VirtualDom_noScript(tag)
{
	return tag == 'script' ? 'p' : tag;
}

function _VirtualDom_noOnOrFormAction(key)
{
	return /^(on|formAction$)/i.test(key) ? 'data-' + key : key;
}

function _VirtualDom_noInnerHtmlOrFormAction(key)
{
	return key == 'innerHTML' || key == 'formAction' ? 'data-' + key : key;
}

function _VirtualDom_noJavaScriptUri_UNUSED(value)
{
	return /^javascript:/i.test(value.replace(/\s/g,'')) ? '' : value;
}

function _VirtualDom_noJavaScriptUri(value)
{
	return /^javascript:/i.test(value.replace(/\s/g,''))
		? 'javascript:alert("This is an XSS vector. Please use ports or web components instead.")'
		: value;
}

function _VirtualDom_noJavaScriptOrHtmlUri_UNUSED(value)
{
	return /^\s*(javascript:|data:text\/html)/i.test(value) ? '' : value;
}

function _VirtualDom_noJavaScriptOrHtmlUri(value)
{
	return /^\s*(javascript:|data:text\/html)/i.test(value)
		? 'javascript:alert("This is an XSS vector. Please use ports or web components instead.")'
		: value;
}



// MAP FACTS


var _VirtualDom_mapAttribute = F2(function(func, attr)
{
	return (attr.$ === 'a0')
		? A2(_VirtualDom_on, attr.n, _VirtualDom_mapHandler(func, attr.o))
		: attr;
});

function _VirtualDom_mapHandler(func, handler)
{
	var tag = elm$virtual_dom$VirtualDom$toHandlerInt(handler);

	// 0 = Normal
	// 1 = MayStopPropagation
	// 2 = MayPreventDefault
	// 3 = Custom

	return {
		$: handler.$,
		a:
			!tag
				? A2(elm$json$Json$Decode$map, func, handler.a)
				:
			A3(elm$json$Json$Decode$map2,
				tag < 3
					? _VirtualDom_mapEventTuple
					: _VirtualDom_mapEventRecord,
				elm$json$Json$Decode$succeed(func),
				handler.a
			)
	};
}

var _VirtualDom_mapEventTuple = F2(function(func, tuple)
{
	return _Utils_Tuple2(func(tuple.a), tuple.b);
});

var _VirtualDom_mapEventRecord = F2(function(func, record)
{
	return {
		message: func(record.message),
		stopPropagation: record.stopPropagation,
		preventDefault: record.preventDefault
	}
});



// ORGANIZE FACTS


function _VirtualDom_organizeFacts(factList)
{
	for (var facts = {}; factList.b; factList = factList.b) // WHILE_CONS
	{
		var entry = factList.a;

		var tag = entry.$;
		var key = entry.n;
		var value = entry.o;

		if (tag === 'a2')
		{
			(key === 'className')
				? _VirtualDom_addClass(facts, key, _Json_unwrap(value))
				: facts[key] = _Json_unwrap(value);

			continue;
		}

		var subFacts = facts[tag] || (facts[tag] = {});
		(tag === 'a3' && key === 'class')
			? _VirtualDom_addClass(subFacts, key, value)
			: subFacts[key] = value;
	}

	return facts;
}

function _VirtualDom_addClass(object, key, newClass)
{
	var classes = object[key];
	object[key] = classes ? classes + ' ' + newClass : newClass;
}



// RENDER


function _VirtualDom_render(vNode, eventNode)
{
	var tag = vNode.$;

	if (tag === 5)
	{
		return _VirtualDom_render(vNode.k || (vNode.k = vNode.m()), eventNode);
	}

	if (tag === 0)
	{
		return _VirtualDom_doc.createTextNode(vNode.a);
	}

	if (tag === 4)
	{
		var subNode = vNode.k;
		var tagger = vNode.j;

		while (subNode.$ === 4)
		{
			typeof tagger !== 'object'
				? tagger = [tagger, subNode.j]
				: tagger.push(subNode.j);

			subNode = subNode.k;
		}

		var subEventRoot = { j: tagger, p: eventNode };
		var domNode = _VirtualDom_render(subNode, subEventRoot);
		domNode.elm_event_node_ref = subEventRoot;
		return domNode;
	}

	if (tag === 3)
	{
		var domNode = vNode.h(vNode.g);
		_VirtualDom_applyFacts(domNode, eventNode, vNode.d);
		return domNode;
	}

	// at this point `tag` must be 1 or 2

	var domNode = vNode.f
		? _VirtualDom_doc.createElementNS(vNode.f, vNode.c)
		: _VirtualDom_doc.createElement(vNode.c);

	if (_VirtualDom_divertHrefToApp && vNode.c == 'a')
	{
		domNode.addEventListener('click', _VirtualDom_divertHrefToApp(domNode));
	}

	_VirtualDom_applyFacts(domNode, eventNode, vNode.d);

	for (var kids = vNode.e, i = 0; i < kids.length; i++)
	{
		_VirtualDom_appendChild(domNode, _VirtualDom_render(tag === 1 ? kids[i] : kids[i].b, eventNode));
	}

	return domNode;
}



// APPLY FACTS


function _VirtualDom_applyFacts(domNode, eventNode, facts)
{
	for (var key in facts)
	{
		var value = facts[key];

		key === 'a1'
			? _VirtualDom_applyStyles(domNode, value)
			:
		key === 'a0'
			? _VirtualDom_applyEvents(domNode, eventNode, value)
			:
		key === 'a3'
			? _VirtualDom_applyAttrs(domNode, value)
			:
		key === 'a4'
			? _VirtualDom_applyAttrsNS(domNode, value)
			:
		((key !== 'value' && key !== 'checked') || domNode[key] !== value) && (domNode[key] = value);
	}
}



// APPLY STYLES


function _VirtualDom_applyStyles(domNode, styles)
{
	var domNodeStyle = domNode.style;

	for (var key in styles)
	{
		domNodeStyle[key] = styles[key];
	}
}



// APPLY ATTRS


function _VirtualDom_applyAttrs(domNode, attrs)
{
	for (var key in attrs)
	{
		var value = attrs[key];
		typeof value !== 'undefined'
			? domNode.setAttribute(key, value)
			: domNode.removeAttribute(key);
	}
}



// APPLY NAMESPACED ATTRS


function _VirtualDom_applyAttrsNS(domNode, nsAttrs)
{
	for (var key in nsAttrs)
	{
		var pair = nsAttrs[key];
		var namespace = pair.f;
		var value = pair.o;

		typeof value !== 'undefined'
			? domNode.setAttributeNS(namespace, key, value)
			: domNode.removeAttributeNS(namespace, key);
	}
}



// APPLY EVENTS


function _VirtualDom_applyEvents(domNode, eventNode, events)
{
	var allCallbacks = domNode.elmFs || (domNode.elmFs = {});

	for (var key in events)
	{
		var newHandler = events[key];
		var oldCallback = allCallbacks[key];

		if (!newHandler)
		{
			domNode.removeEventListener(key, oldCallback);
			allCallbacks[key] = undefined;
			continue;
		}

		if (oldCallback)
		{
			var oldHandler = oldCallback.q;
			if (oldHandler.$ === newHandler.$)
			{
				oldCallback.q = newHandler;
				continue;
			}
			domNode.removeEventListener(key, oldCallback);
		}

		oldCallback = _VirtualDom_makeCallback(eventNode, newHandler);
		domNode.addEventListener(key, oldCallback,
			_VirtualDom_passiveSupported
			&& { passive: elm$virtual_dom$VirtualDom$toHandlerInt(newHandler) < 2 }
		);
		allCallbacks[key] = oldCallback;
	}
}



// PASSIVE EVENTS


var _VirtualDom_passiveSupported;

try
{
	window.addEventListener('t', null, Object.defineProperty({}, 'passive', {
		get: function() { _VirtualDom_passiveSupported = true; }
	}));
}
catch(e) {}



// EVENT HANDLERS


function _VirtualDom_makeCallback(eventNode, initialHandler)
{
	function callback(event)
	{
		var handler = callback.q;
		var result = _Json_runHelp(handler.a, event);

		if (!elm$core$Result$isOk(result))
		{
			return;
		}

		var tag = elm$virtual_dom$VirtualDom$toHandlerInt(handler);

		// 0 = Normal
		// 1 = MayStopPropagation
		// 2 = MayPreventDefault
		// 3 = Custom

		var value = result.a;
		var message = !tag ? value : tag < 3 ? value.a : value.message;
		var stopPropagation = tag == 1 ? value.b : tag == 3 && value.stopPropagation;
		var currentEventNode = (
			stopPropagation && event.stopPropagation(),
			(tag == 2 ? value.b : tag == 3 && value.preventDefault) && event.preventDefault(),
			eventNode
		);
		var tagger;
		var i;
		while (tagger = currentEventNode.j)
		{
			if (typeof tagger == 'function')
			{
				message = tagger(message);
			}
			else
			{
				for (var i = tagger.length; i--; )
				{
					message = tagger[i](message);
				}
			}
			currentEventNode = currentEventNode.p;
		}
		currentEventNode(message, stopPropagation); // stopPropagation implies isSync
	}

	callback.q = initialHandler;

	return callback;
}

function _VirtualDom_equalEvents(x, y)
{
	return x.$ == y.$ && _Json_equality(x.a, y.a);
}



// DIFF


// TODO: Should we do patches like in iOS?
//
// type Patch
//   = At Int Patch
//   | Batch (List Patch)
//   | Change ...
//
// How could it not be better?
//
function _VirtualDom_diff(x, y)
{
	var patches = [];
	_VirtualDom_diffHelp(x, y, patches, 0);
	return patches;
}


function _VirtualDom_pushPatch(patches, type, index, data)
{
	var patch = {
		$: type,
		r: index,
		s: data,
		t: undefined,
		u: undefined
	};
	patches.push(patch);
	return patch;
}


function _VirtualDom_diffHelp(x, y, patches, index)
{
	if (x === y)
	{
		return;
	}

	var xType = x.$;
	var yType = y.$;

	// Bail if you run into different types of nodes. Implies that the
	// structure has changed significantly and it's not worth a diff.
	if (xType !== yType)
	{
		if (xType === 1 && yType === 2)
		{
			y = _VirtualDom_dekey(y);
			yType = 1;
		}
		else
		{
			_VirtualDom_pushPatch(patches, 0, index, y);
			return;
		}
	}

	// Now we know that both nodes are the same $.
	switch (yType)
	{
		case 5:
			var xRefs = x.l;
			var yRefs = y.l;
			var i = xRefs.length;
			var same = i === yRefs.length;
			while (same && i--)
			{
				same = xRefs[i] === yRefs[i];
			}
			if (same)
			{
				y.k = x.k;
				return;
			}
			y.k = y.m();
			var subPatches = [];
			_VirtualDom_diffHelp(x.k, y.k, subPatches, 0);
			subPatches.length > 0 && _VirtualDom_pushPatch(patches, 1, index, subPatches);
			return;

		case 4:
			// gather nested taggers
			var xTaggers = x.j;
			var yTaggers = y.j;
			var nesting = false;

			var xSubNode = x.k;
			while (xSubNode.$ === 4)
			{
				nesting = true;

				typeof xTaggers !== 'object'
					? xTaggers = [xTaggers, xSubNode.j]
					: xTaggers.push(xSubNode.j);

				xSubNode = xSubNode.k;
			}

			var ySubNode = y.k;
			while (ySubNode.$ === 4)
			{
				nesting = true;

				typeof yTaggers !== 'object'
					? yTaggers = [yTaggers, ySubNode.j]
					: yTaggers.push(ySubNode.j);

				ySubNode = ySubNode.k;
			}

			// Just bail if different numbers of taggers. This implies the
			// structure of the virtual DOM has changed.
			if (nesting && xTaggers.length !== yTaggers.length)
			{
				_VirtualDom_pushPatch(patches, 0, index, y);
				return;
			}

			// check if taggers are "the same"
			if (nesting ? !_VirtualDom_pairwiseRefEqual(xTaggers, yTaggers) : xTaggers !== yTaggers)
			{
				_VirtualDom_pushPatch(patches, 2, index, yTaggers);
			}

			// diff everything below the taggers
			_VirtualDom_diffHelp(xSubNode, ySubNode, patches, index + 1);
			return;

		case 0:
			if (x.a !== y.a)
			{
				_VirtualDom_pushPatch(patches, 3, index, y.a);
			}
			return;

		case 1:
			_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKids);
			return;

		case 2:
			_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKeyedKids);
			return;

		case 3:
			if (x.h !== y.h)
			{
				_VirtualDom_pushPatch(patches, 0, index, y);
				return;
			}

			var factsDiff = _VirtualDom_diffFacts(x.d, y.d);
			factsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);

			var patch = y.i(x.g, y.g);
			patch && _VirtualDom_pushPatch(patches, 5, index, patch);

			return;
	}
}

// assumes the incoming arrays are the same length
function _VirtualDom_pairwiseRefEqual(as, bs)
{
	for (var i = 0; i < as.length; i++)
	{
		if (as[i] !== bs[i])
		{
			return false;
		}
	}

	return true;
}

function _VirtualDom_diffNodes(x, y, patches, index, diffKids)
{
	// Bail if obvious indicators have changed. Implies more serious
	// structural changes such that it's not worth it to diff.
	if (x.c !== y.c || x.f !== y.f)
	{
		_VirtualDom_pushPatch(patches, 0, index, y);
		return;
	}

	var factsDiff = _VirtualDom_diffFacts(x.d, y.d);
	factsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);

	diffKids(x, y, patches, index);
}



// DIFF FACTS


// TODO Instead of creating a new diff object, it's possible to just test if
// there *is* a diff. During the actual patch, do the diff again and make the
// modifications directly. This way, there's no new allocations. Worth it?
function _VirtualDom_diffFacts(x, y, category)
{
	var diff;

	// look for changes and removals
	for (var xKey in x)
	{
		if (xKey === 'a1' || xKey === 'a0' || xKey === 'a3' || xKey === 'a4')
		{
			var subDiff = _VirtualDom_diffFacts(x[xKey], y[xKey] || {}, xKey);
			if (subDiff)
			{
				diff = diff || {};
				diff[xKey] = subDiff;
			}
			continue;
		}

		// remove if not in the new facts
		if (!(xKey in y))
		{
			diff = diff || {};
			diff[xKey] =
				!category
					? (typeof x[xKey] === 'string' ? '' : null)
					:
				(category === 'a1')
					? ''
					:
				(category === 'a0' || category === 'a3')
					? undefined
					:
				{ f: x[xKey].f, o: undefined };

			continue;
		}

		var xValue = x[xKey];
		var yValue = y[xKey];

		// reference equal, so don't worry about it
		if (xValue === yValue && xKey !== 'value' && xKey !== 'checked'
			|| category === 'a0' && _VirtualDom_equalEvents(xValue, yValue))
		{
			continue;
		}

		diff = diff || {};
		diff[xKey] = yValue;
	}

	// add new stuff
	for (var yKey in y)
	{
		if (!(yKey in x))
		{
			diff = diff || {};
			diff[yKey] = y[yKey];
		}
	}

	return diff;
}



// DIFF KIDS


function _VirtualDom_diffKids(xParent, yParent, patches, index)
{
	var xKids = xParent.e;
	var yKids = yParent.e;

	var xLen = xKids.length;
	var yLen = yKids.length;

	// FIGURE OUT IF THERE ARE INSERTS OR REMOVALS

	if (xLen > yLen)
	{
		_VirtualDom_pushPatch(patches, 6, index, {
			v: yLen,
			i: xLen - yLen
		});
	}
	else if (xLen < yLen)
	{
		_VirtualDom_pushPatch(patches, 7, index, {
			v: xLen,
			e: yKids
		});
	}

	// PAIRWISE DIFF EVERYTHING ELSE

	for (var minLen = xLen < yLen ? xLen : yLen, i = 0; i < minLen; i++)
	{
		var xKid = xKids[i];
		_VirtualDom_diffHelp(xKid, yKids[i], patches, ++index);
		index += xKid.b || 0;
	}
}



// KEYED DIFF


function _VirtualDom_diffKeyedKids(xParent, yParent, patches, rootIndex)
{
	var localPatches = [];

	var changes = {}; // Dict String Entry
	var inserts = []; // Array { index : Int, entry : Entry }
	// type Entry = { tag : String, vnode : VNode, index : Int, data : _ }

	var xKids = xParent.e;
	var yKids = yParent.e;
	var xLen = xKids.length;
	var yLen = yKids.length;
	var xIndex = 0;
	var yIndex = 0;

	var index = rootIndex;

	while (xIndex < xLen && yIndex < yLen)
	{
		var x = xKids[xIndex];
		var y = yKids[yIndex];

		var xKey = x.a;
		var yKey = y.a;
		var xNode = x.b;
		var yNode = y.b;

		var newMatch = undefined;
		var oldMatch = undefined;

		// check if keys match

		if (xKey === yKey)
		{
			index++;
			_VirtualDom_diffHelp(xNode, yNode, localPatches, index);
			index += xNode.b || 0;

			xIndex++;
			yIndex++;
			continue;
		}

		// look ahead 1 to detect insertions and removals.

		var xNext = xKids[xIndex + 1];
		var yNext = yKids[yIndex + 1];

		if (xNext)
		{
			var xNextKey = xNext.a;
			var xNextNode = xNext.b;
			oldMatch = yKey === xNextKey;
		}

		if (yNext)
		{
			var yNextKey = yNext.a;
			var yNextNode = yNext.b;
			newMatch = xKey === yNextKey;
		}


		// swap x and y
		if (newMatch && oldMatch)
		{
			index++;
			_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);
			_VirtualDom_insertNode(changes, localPatches, xKey, yNode, yIndex, inserts);
			index += xNode.b || 0;

			index++;
			_VirtualDom_removeNode(changes, localPatches, xKey, xNextNode, index);
			index += xNextNode.b || 0;

			xIndex += 2;
			yIndex += 2;
			continue;
		}

		// insert y
		if (newMatch)
		{
			index++;
			_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);
			_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);
			index += xNode.b || 0;

			xIndex += 1;
			yIndex += 2;
			continue;
		}

		// remove x
		if (oldMatch)
		{
			index++;
			_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);
			index += xNode.b || 0;

			index++;
			_VirtualDom_diffHelp(xNextNode, yNode, localPatches, index);
			index += xNextNode.b || 0;

			xIndex += 2;
			yIndex += 1;
			continue;
		}

		// remove x, insert y
		if (xNext && xNextKey === yNextKey)
		{
			index++;
			_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);
			_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);
			index += xNode.b || 0;

			index++;
			_VirtualDom_diffHelp(xNextNode, yNextNode, localPatches, index);
			index += xNextNode.b || 0;

			xIndex += 2;
			yIndex += 2;
			continue;
		}

		break;
	}

	// eat up any remaining nodes with removeNode and insertNode

	while (xIndex < xLen)
	{
		index++;
		var x = xKids[xIndex];
		var xNode = x.b;
		_VirtualDom_removeNode(changes, localPatches, x.a, xNode, index);
		index += xNode.b || 0;
		xIndex++;
	}

	while (yIndex < yLen)
	{
		var endInserts = endInserts || [];
		var y = yKids[yIndex];
		_VirtualDom_insertNode(changes, localPatches, y.a, y.b, undefined, endInserts);
		yIndex++;
	}

	if (localPatches.length > 0 || inserts.length > 0 || endInserts)
	{
		_VirtualDom_pushPatch(patches, 8, rootIndex, {
			w: localPatches,
			x: inserts,
			y: endInserts
		});
	}
}



// CHANGES FROM KEYED DIFF


var _VirtualDom_POSTFIX = '_elmW6BL';


function _VirtualDom_insertNode(changes, localPatches, key, vnode, yIndex, inserts)
{
	var entry = changes[key];

	// never seen this key before
	if (!entry)
	{
		entry = {
			c: 0,
			z: vnode,
			r: yIndex,
			s: undefined
		};

		inserts.push({ r: yIndex, A: entry });
		changes[key] = entry;

		return;
	}

	// this key was removed earlier, a match!
	if (entry.c === 1)
	{
		inserts.push({ r: yIndex, A: entry });

		entry.c = 2;
		var subPatches = [];
		_VirtualDom_diffHelp(entry.z, vnode, subPatches, entry.r);
		entry.r = yIndex;
		entry.s.s = {
			w: subPatches,
			A: entry
		};

		return;
	}

	// this key has already been inserted or moved, a duplicate!
	_VirtualDom_insertNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, yIndex, inserts);
}


function _VirtualDom_removeNode(changes, localPatches, key, vnode, index)
{
	var entry = changes[key];

	// never seen this key before
	if (!entry)
	{
		var patch = _VirtualDom_pushPatch(localPatches, 9, index, undefined);

		changes[key] = {
			c: 1,
			z: vnode,
			r: index,
			s: patch
		};

		return;
	}

	// this key was inserted earlier, a match!
	if (entry.c === 0)
	{
		entry.c = 2;
		var subPatches = [];
		_VirtualDom_diffHelp(vnode, entry.z, subPatches, index);

		_VirtualDom_pushPatch(localPatches, 9, index, {
			w: subPatches,
			A: entry
		});

		return;
	}

	// this key has already been removed or moved, a duplicate!
	_VirtualDom_removeNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, index);
}



// ADD DOM NODES
//
// Each DOM node has an "index" assigned in order of traversal. It is important
// to minimize our crawl over the actual DOM, so these indexes (along with the
// descendantsCount of virtual nodes) let us skip touching entire subtrees of
// the DOM if we know there are no patches there.


function _VirtualDom_addDomNodes(domNode, vNode, patches, eventNode)
{
	_VirtualDom_addDomNodesHelp(domNode, vNode, patches, 0, 0, vNode.b, eventNode);
}


// assumes `patches` is non-empty and indexes increase monotonically.
function _VirtualDom_addDomNodesHelp(domNode, vNode, patches, i, low, high, eventNode)
{
	var patch = patches[i];
	var index = patch.r;

	while (index === low)
	{
		var patchType = patch.$;

		if (patchType === 1)
		{
			_VirtualDom_addDomNodes(domNode, vNode.k, patch.s, eventNode);
		}
		else if (patchType === 8)
		{
			patch.t = domNode;
			patch.u = eventNode;

			var subPatches = patch.s.w;
			if (subPatches.length > 0)
			{
				_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);
			}
		}
		else if (patchType === 9)
		{
			patch.t = domNode;
			patch.u = eventNode;

			var data = patch.s;
			if (data)
			{
				data.A.s = domNode;
				var subPatches = data.w;
				if (subPatches.length > 0)
				{
					_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);
				}
			}
		}
		else
		{
			patch.t = domNode;
			patch.u = eventNode;
		}

		i++;

		if (!(patch = patches[i]) || (index = patch.r) > high)
		{
			return i;
		}
	}

	var tag = vNode.$;

	if (tag === 4)
	{
		var subNode = vNode.k;

		while (subNode.$ === 4)
		{
			subNode = subNode.k;
		}

		return _VirtualDom_addDomNodesHelp(domNode, subNode, patches, i, low + 1, high, domNode.elm_event_node_ref);
	}

	// tag must be 1 or 2 at this point

	var vKids = vNode.e;
	var childNodes = domNode.childNodes;
	for (var j = 0; j < vKids.length; j++)
	{
		low++;
		var vKid = tag === 1 ? vKids[j] : vKids[j].b;
		var nextLow = low + (vKid.b || 0);
		if (low <= index && index <= nextLow)
		{
			i = _VirtualDom_addDomNodesHelp(childNodes[j], vKid, patches, i, low, nextLow, eventNode);
			if (!(patch = patches[i]) || (index = patch.r) > high)
			{
				return i;
			}
		}
		low = nextLow;
	}
	return i;
}



// APPLY PATCHES


function _VirtualDom_applyPatches(rootDomNode, oldVirtualNode, patches, eventNode)
{
	if (patches.length === 0)
	{
		return rootDomNode;
	}

	_VirtualDom_addDomNodes(rootDomNode, oldVirtualNode, patches, eventNode);
	return _VirtualDom_applyPatchesHelp(rootDomNode, patches);
}

function _VirtualDom_applyPatchesHelp(rootDomNode, patches)
{
	for (var i = 0; i < patches.length; i++)
	{
		var patch = patches[i];
		var localDomNode = patch.t
		var newNode = _VirtualDom_applyPatch(localDomNode, patch);
		if (localDomNode === rootDomNode)
		{
			rootDomNode = newNode;
		}
	}
	return rootDomNode;
}

function _VirtualDom_applyPatch(domNode, patch)
{
	switch (patch.$)
	{
		case 0:
			return _VirtualDom_applyPatchRedraw(domNode, patch.s, patch.u);

		case 4:
			_VirtualDom_applyFacts(domNode, patch.u, patch.s);
			return domNode;

		case 3:
			domNode.replaceData(0, domNode.length, patch.s);
			return domNode;

		case 1:
			return _VirtualDom_applyPatchesHelp(domNode, patch.s);

		case 2:
			if (domNode.elm_event_node_ref)
			{
				domNode.elm_event_node_ref.j = patch.s;
			}
			else
			{
				domNode.elm_event_node_ref = { j: patch.s, p: patch.u };
			}
			return domNode;

		case 6:
			var data = patch.s;
			for (var i = 0; i < data.i; i++)
			{
				domNode.removeChild(domNode.childNodes[data.v]);
			}
			return domNode;

		case 7:
			var data = patch.s;
			var kids = data.e;
			var i = data.v;
			var theEnd = domNode.childNodes[i];
			for (; i < kids.length; i++)
			{
				domNode.insertBefore(_VirtualDom_render(kids[i], patch.u), theEnd);
			}
			return domNode;

		case 9:
			var data = patch.s;
			if (!data)
			{
				domNode.parentNode.removeChild(domNode);
				return domNode;
			}
			var entry = data.A;
			if (typeof entry.r !== 'undefined')
			{
				domNode.parentNode.removeChild(domNode);
			}
			entry.s = _VirtualDom_applyPatchesHelp(domNode, data.w);
			return domNode;

		case 8:
			return _VirtualDom_applyPatchReorder(domNode, patch);

		case 5:
			return patch.s(domNode);

		default:
			_Debug_crash(10); // 'Ran into an unknown patch!'
	}
}


function _VirtualDom_applyPatchRedraw(domNode, vNode, eventNode)
{
	var parentNode = domNode.parentNode;
	var newNode = _VirtualDom_render(vNode, eventNode);

	if (!newNode.elm_event_node_ref)
	{
		newNode.elm_event_node_ref = domNode.elm_event_node_ref;
	}

	if (parentNode && newNode !== domNode)
	{
		parentNode.replaceChild(newNode, domNode);
	}
	return newNode;
}


function _VirtualDom_applyPatchReorder(domNode, patch)
{
	var data = patch.s;

	// remove end inserts
	var frag = _VirtualDom_applyPatchReorderEndInsertsHelp(data.y, patch);

	// removals
	domNode = _VirtualDom_applyPatchesHelp(domNode, data.w);

	// inserts
	var inserts = data.x;
	for (var i = 0; i < inserts.length; i++)
	{
		var insert = inserts[i];
		var entry = insert.A;
		var node = entry.c === 2
			? entry.s
			: _VirtualDom_render(entry.z, patch.u);
		domNode.insertBefore(node, domNode.childNodes[insert.r]);
	}

	// add end inserts
	if (frag)
	{
		_VirtualDom_appendChild(domNode, frag);
	}

	return domNode;
}


function _VirtualDom_applyPatchReorderEndInsertsHelp(endInserts, patch)
{
	if (!endInserts)
	{
		return;
	}

	var frag = _VirtualDom_doc.createDocumentFragment();
	for (var i = 0; i < endInserts.length; i++)
	{
		var insert = endInserts[i];
		var entry = insert.A;
		_VirtualDom_appendChild(frag, entry.c === 2
			? entry.s
			: _VirtualDom_render(entry.z, patch.u)
		);
	}
	return frag;
}


function _VirtualDom_virtualize(node)
{
	// TEXT NODES

	if (node.nodeType === 3)
	{
		return _VirtualDom_text(node.textContent);
	}


	// WEIRD NODES

	if (node.nodeType !== 1)
	{
		return _VirtualDom_text('');
	}


	// ELEMENT NODES

	var attrList = _List_Nil;
	var attrs = node.attributes;
	for (var i = attrs.length; i--; )
	{
		var attr = attrs[i];
		var name = attr.name;
		var value = attr.value;
		attrList = _List_Cons( A2(_VirtualDom_attribute, name, value), attrList );
	}

	var tag = node.tagName.toLowerCase();
	var kidList = _List_Nil;
	var kids = node.childNodes;

	for (var i = kids.length; i--; )
	{
		kidList = _List_Cons(_VirtualDom_virtualize(kids[i]), kidList);
	}
	return A3(_VirtualDom_node, tag, attrList, kidList);
}

function _VirtualDom_dekey(keyedNode)
{
	var keyedKids = keyedNode.e;
	var len = keyedKids.length;
	var kids = new Array(len);
	for (var i = 0; i < len; i++)
	{
		kids[i] = keyedKids[i].b;
	}

	return {
		$: 1,
		c: keyedNode.c,
		d: keyedNode.d,
		e: kids,
		f: keyedNode.f,
		b: keyedNode.b
	};
}




// ELEMENT


var _Debugger_element;

var _Browser_element = _Debugger_element || F4(function(impl, flagDecoder, debugMetadata, args)
{
	return _Platform_initialize(
		flagDecoder,
		args,
		impl.init,
		impl.update,
		impl.subscriptions,
		function(sendToApp, initialModel) {
			var view = impl.view;
			/**_UNUSED/
			var domNode = args['node'];
			//*/
			/**/
			var domNode = args && args['node'] ? args['node'] : _Debug_crash(0);
			//*/
			var currNode = _VirtualDom_virtualize(domNode);

			return _Browser_makeAnimator(initialModel, function(model)
			{
				var nextNode = view(model);
				var patches = _VirtualDom_diff(currNode, nextNode);
				domNode = _VirtualDom_applyPatches(domNode, currNode, patches, sendToApp);
				currNode = nextNode;
			});
		}
	);
});



// DOCUMENT


var _Debugger_document;

var _Browser_document = _Debugger_document || F4(function(impl, flagDecoder, debugMetadata, args)
{
	return _Platform_initialize(
		flagDecoder,
		args,
		impl.init,
		impl.update,
		impl.subscriptions,
		function(sendToApp, initialModel) {
			var divertHrefToApp = impl.setup && impl.setup(sendToApp)
			var view = impl.view;
			var title = _VirtualDom_doc.title;
			var bodyNode = _VirtualDom_doc.body;
			var currNode = _VirtualDom_virtualize(bodyNode);
			return _Browser_makeAnimator(initialModel, function(model)
			{
				_VirtualDom_divertHrefToApp = divertHrefToApp;
				var doc = view(model);
				var nextNode = _VirtualDom_node('body')(_List_Nil)(doc.body);
				var patches = _VirtualDom_diff(currNode, nextNode);
				bodyNode = _VirtualDom_applyPatches(bodyNode, currNode, patches, sendToApp);
				currNode = nextNode;
				_VirtualDom_divertHrefToApp = 0;
				(title !== doc.title) && (_VirtualDom_doc.title = title = doc.title);
			});
		}
	);
});



// ANIMATION


var _Browser_cancelAnimationFrame =
	typeof cancelAnimationFrame !== 'undefined'
		? cancelAnimationFrame
		: function(id) { clearTimeout(id); };

var _Browser_requestAnimationFrame =
	typeof requestAnimationFrame !== 'undefined'
		? requestAnimationFrame
		: function(callback) { return setTimeout(callback, 1000 / 60); };


function _Browser_makeAnimator(model, draw)
{
	draw(model);

	var state = 0;

	function updateIfNeeded()
	{
		state = state === 1
			? 0
			: ( _Browser_requestAnimationFrame(updateIfNeeded), draw(model), 1 );
	}

	return function(nextModel, isSync)
	{
		model = nextModel;

		isSync
			? ( draw(model),
				state === 2 && (state = 1)
				)
			: ( state === 0 && _Browser_requestAnimationFrame(updateIfNeeded),
				state = 2
				);
	};
}



// APPLICATION


function _Browser_application(impl)
{
	var onUrlChange = impl.onUrlChange;
	var onUrlRequest = impl.onUrlRequest;
	var key = function() { key.a(onUrlChange(_Browser_getUrl())); };

	return _Browser_document({
		setup: function(sendToApp)
		{
			key.a = sendToApp;
			_Browser_window.addEventListener('popstate', key);
			_Browser_window.navigator.userAgent.indexOf('Trident') < 0 || _Browser_window.addEventListener('hashchange', key);

			return F2(function(domNode, event)
			{
				if (!event.ctrlKey && !event.metaKey && !event.shiftKey && event.button < 1 && !domNode.target && !domNode.hasAttribute('download'))
				{
					event.preventDefault();
					var href = domNode.href;
					var curr = _Browser_getUrl();
					var next = elm$url$Url$fromString(href).a;
					sendToApp(onUrlRequest(
						(next
							&& curr.protocol === next.protocol
							&& curr.host === next.host
							&& curr.port_.a === next.port_.a
						)
							? elm$browser$Browser$Internal(next)
							: elm$browser$Browser$External(href)
					));
				}
			});
		},
		init: function(flags)
		{
			return A3(impl.init, flags, _Browser_getUrl(), key);
		},
		view: impl.view,
		update: impl.update,
		subscriptions: impl.subscriptions
	});
}

function _Browser_getUrl()
{
	return elm$url$Url$fromString(_VirtualDom_doc.location.href).a || _Debug_crash(1);
}

var _Browser_go = F2(function(key, n)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function() {
		n && history.go(n);
		key();
	}));
});

var _Browser_pushUrl = F2(function(key, url)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function() {
		history.pushState({}, '', url);
		key();
	}));
});

var _Browser_replaceUrl = F2(function(key, url)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function() {
		history.replaceState({}, '', url);
		key();
	}));
});



// GLOBAL EVENTS


var _Browser_fakeNode = { addEventListener: function() {}, removeEventListener: function() {} };
var _Browser_doc = typeof document !== 'undefined' ? document : _Browser_fakeNode;
var _Browser_window = typeof window !== 'undefined' ? window : _Browser_fakeNode;

var _Browser_on = F3(function(node, eventName, sendToSelf)
{
	return _Scheduler_spawn(_Scheduler_binding(function(callback)
	{
		function handler(event)	{ _Scheduler_rawSpawn(sendToSelf(event)); }
		node.addEventListener(eventName, handler, _VirtualDom_passiveSupported && { passive: true });
		return function() { node.removeEventListener(eventName, handler); };
	}));
});

var _Browser_decodeEvent = F2(function(decoder, event)
{
	var result = _Json_runHelp(decoder, event);
	return elm$core$Result$isOk(result) ? elm$core$Maybe$Just(result.a) : elm$core$Maybe$Nothing;
});



// PAGE VISIBILITY


function _Browser_visibilityInfo()
{
	return (typeof _VirtualDom_doc.hidden !== 'undefined')
		? { hidden: 'hidden', change: 'visibilitychange' }
		:
	(typeof _VirtualDom_doc.mozHidden !== 'undefined')
		? { hidden: 'mozHidden', change: 'mozvisibilitychange' }
		:
	(typeof _VirtualDom_doc.msHidden !== 'undefined')
		? { hidden: 'msHidden', change: 'msvisibilitychange' }
		:
	(typeof _VirtualDom_doc.webkitHidden !== 'undefined')
		? { hidden: 'webkitHidden', change: 'webkitvisibilitychange' }
		: { hidden: 'hidden', change: 'visibilitychange' };
}



// ANIMATION FRAMES


function _Browser_rAF()
{
	return _Scheduler_binding(function(callback)
	{
		var id = _Browser_requestAnimationFrame(function() {
			callback(_Scheduler_succeed(Date.now()));
		});

		return function() {
			_Browser_cancelAnimationFrame(id);
		};
	});
}


function _Browser_now()
{
	return _Scheduler_binding(function(callback)
	{
		callback(_Scheduler_succeed(Date.now()));
	});
}



// DOM STUFF


function _Browser_withNode(id, doStuff)
{
	return _Scheduler_binding(function(callback)
	{
		_Browser_requestAnimationFrame(function() {
			var node = document.getElementById(id);
			callback(node
				? _Scheduler_succeed(doStuff(node))
				: _Scheduler_fail(elm$browser$Browser$Dom$NotFound(id))
			);
		});
	});
}


function _Browser_withWindow(doStuff)
{
	return _Scheduler_binding(function(callback)
	{
		_Browser_requestAnimationFrame(function() {
			callback(_Scheduler_succeed(doStuff()));
		});
	});
}


// FOCUS and BLUR


var _Browser_call = F2(function(functionName, id)
{
	return _Browser_withNode(id, function(node) {
		node[functionName]();
		return _Utils_Tuple0;
	});
});



// WINDOW VIEWPORT


function _Browser_getViewport()
{
	return {
		scene: _Browser_getScene(),
		viewport: {
			x: _Browser_window.pageXOffset,
			y: _Browser_window.pageYOffset,
			width: _Browser_doc.documentElement.clientWidth,
			height: _Browser_doc.documentElement.clientHeight
		}
	};
}

function _Browser_getScene()
{
	var body = _Browser_doc.body;
	var elem = _Browser_doc.documentElement;
	return {
		width: Math.max(body.scrollWidth, body.offsetWidth, elem.scrollWidth, elem.offsetWidth, elem.clientWidth),
		height: Math.max(body.scrollHeight, body.offsetHeight, elem.scrollHeight, elem.offsetHeight, elem.clientHeight)
	};
}

var _Browser_setViewport = F2(function(x, y)
{
	return _Browser_withWindow(function()
	{
		_Browser_window.scroll(x, y);
		return _Utils_Tuple0;
	});
});



// ELEMENT VIEWPORT


function _Browser_getViewportOf(id)
{
	return _Browser_withNode(id, function(node)
	{
		return {
			scene: {
				width: node.scrollWidth,
				height: node.scrollHeight
			},
			viewport: {
				x: node.scrollLeft,
				y: node.scrollTop,
				width: node.clientWidth,
				height: node.clientHeight
			}
		};
	});
}


var _Browser_setViewportOf = F3(function(id, x, y)
{
	return _Browser_withNode(id, function(node)
	{
		node.scrollLeft = x;
		node.scrollTop = y;
		return _Utils_Tuple0;
	});
});



// ELEMENT


function _Browser_getElement(id)
{
	return _Browser_withNode(id, function(node)
	{
		var rect = node.getBoundingClientRect();
		var x = _Browser_window.pageXOffset;
		var y = _Browser_window.pageYOffset;
		return {
			scene: _Browser_getScene(),
			viewport: {
				x: x,
				y: y,
				width: _Browser_doc.documentElement.clientWidth,
				height: _Browser_doc.documentElement.clientHeight
			},
			element: {
				x: x + rect.left,
				y: y + rect.top,
				width: rect.width,
				height: rect.height
			}
		};
	});
}



// LOAD and RELOAD


function _Browser_reload(skipCache)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function(callback)
	{
		_VirtualDom_doc.location.reload(skipCache);
	}));
}

function _Browser_load(url)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function(callback)
	{
		try
		{
			_Browser_window.location = url;
		}
		catch(err)
		{
			// Only Firefox can throw a NS_ERROR_MALFORMED_URI exception here.
			// Other browsers reload the page, so let's be consistent about that.
			_VirtualDom_doc.location.reload(false);
		}
	}));
}



// SEND REQUEST

var _Http_toTask = F3(function(router, toTask, request)
{
	return _Scheduler_binding(function(callback)
	{
		function done(response) {
			callback(toTask(request.expect.a(response)));
		}

		var xhr = new XMLHttpRequest();
		xhr.addEventListener('error', function() { done(elm$http$Http$NetworkError_); });
		xhr.addEventListener('timeout', function() { done(elm$http$Http$Timeout_); });
		xhr.addEventListener('load', function() { done(_Http_toResponse(request.expect.b, xhr)); });
		elm$core$Maybe$isJust(request.tracker) && _Http_track(router, xhr, request.tracker.a);

		try {
			xhr.open(request.method, request.url, true);
		} catch (e) {
			return done(elm$http$Http$BadUrl_(request.url));
		}

		_Http_configureRequest(xhr, request);

		request.body.a && xhr.setRequestHeader('Content-Type', request.body.a);
		xhr.send(request.body.b);

		return function() { xhr.c = true; xhr.abort(); };
	});
});


// CONFIGURE

function _Http_configureRequest(xhr, request)
{
	for (var headers = request.headers; headers.b; headers = headers.b) // WHILE_CONS
	{
		xhr.setRequestHeader(headers.a.a, headers.a.b);
	}
	xhr.timeout = request.timeout.a || 0;
	xhr.responseType = request.expect.d;
	xhr.withCredentials = request.allowCookiesFromOtherDomains;
}


// RESPONSES

function _Http_toResponse(toBody, xhr)
{
	return A2(
		200 <= xhr.status && xhr.status < 300 ? elm$http$Http$GoodStatus_ : elm$http$Http$BadStatus_,
		_Http_toMetadata(xhr),
		toBody(xhr.response)
	);
}


// METADATA

function _Http_toMetadata(xhr)
{
	return {
		url: xhr.responseURL,
		statusCode: xhr.status,
		statusText: xhr.statusText,
		headers: _Http_parseHeaders(xhr.getAllResponseHeaders())
	};
}


// HEADERS

function _Http_parseHeaders(rawHeaders)
{
	if (!rawHeaders)
	{
		return elm$core$Dict$empty;
	}

	var headers = elm$core$Dict$empty;
	var headerPairs = rawHeaders.split('\r\n');
	for (var i = headerPairs.length; i--; )
	{
		var headerPair = headerPairs[i];
		var index = headerPair.indexOf(': ');
		if (index > 0)
		{
			var key = headerPair.substring(0, index);
			var value = headerPair.substring(index + 2);

			headers = A3(elm$core$Dict$update, key, function(oldValue) {
				return elm$core$Maybe$Just(elm$core$Maybe$isJust(oldValue)
					? value + ', ' + oldValue.a
					: value
				);
			}, headers);
		}
	}
	return headers;
}


// EXPECT

var _Http_expect = F3(function(type, toBody, toValue)
{
	return {
		$: 0,
		d: type,
		b: toBody,
		a: toValue
	};
});

var _Http_mapExpect = F2(function(func, expect)
{
	return {
		$: 0,
		d: expect.d,
		b: expect.b,
		a: function(x) { return func(expect.a(x)); }
	};
});

function _Http_toDataView(arrayBuffer)
{
	return new DataView(arrayBuffer);
}


// BODY and PARTS

var _Http_emptyBody = { $: 0 };
var _Http_pair = F2(function(a, b) { return { $: 0, a: a, b: b }; });

function _Http_toFormData(parts)
{
	for (var formData = new FormData(); parts.b; parts = parts.b) // WHILE_CONS
	{
		var part = parts.a;
		formData.append(part.a, part.b);
	}
	return formData;
}

var _Http_bytesToBlob = F2(function(mime, bytes)
{
	return new Blob([bytes], { type: mime });
});


// PROGRESS

function _Http_track(router, xhr, tracker)
{
	// TODO check out lengthComputable on loadstart event

	xhr.upload.addEventListener('progress', function(event) {
		if (xhr.c) { return; }
		_Scheduler_rawSpawn(A2(elm$core$Platform$sendToSelf, router, _Utils_Tuple2(tracker, elm$http$Http$Sending({
			sent: event.loaded,
			size: event.total
		}))));
	});
	xhr.addEventListener('progress', function(event) {
		if (xhr.c) { return; }
		_Scheduler_rawSpawn(A2(elm$core$Platform$sendToSelf, router, _Utils_Tuple2(tracker, elm$http$Http$Receiving({
			received: event.loaded,
			size: event.lengthComputable ? elm$core$Maybe$Just(event.total) : elm$core$Maybe$Nothing
		}))));
	});
}


var _Bitwise_and = F2(function(a, b)
{
	return a & b;
});

var _Bitwise_or = F2(function(a, b)
{
	return a | b;
});

var _Bitwise_xor = F2(function(a, b)
{
	return a ^ b;
});

function _Bitwise_complement(a)
{
	return ~a;
};

var _Bitwise_shiftLeftBy = F2(function(offset, a)
{
	return a << offset;
});

var _Bitwise_shiftRightBy = F2(function(offset, a)
{
	return a >> offset;
});

var _Bitwise_shiftRightZfBy = F2(function(offset, a)
{
	return a >>> offset;
});




// STRINGS


var _Parser_isSubString = F5(function(smallString, offset, row, col, bigString)
{
	var smallLength = smallString.length;
	var isGood = offset + smallLength <= bigString.length;

	for (var i = 0; isGood && i < smallLength; )
	{
		var code = bigString.charCodeAt(offset);
		isGood =
			smallString[i++] === bigString[offset++]
			&& (
				code === 0x000A /* \n */
					? ( row++, col=1 )
					: ( col++, (code & 0xF800) === 0xD800 ? smallString[i++] === bigString[offset++] : 1 )
			)
	}

	return _Utils_Tuple3(isGood ? offset : -1, row, col);
});



// CHARS


var _Parser_isSubChar = F3(function(predicate, offset, string)
{
	return (
		string.length <= offset
			? -1
			:
		(string.charCodeAt(offset) & 0xF800) === 0xD800
			? (predicate(_Utils_chr(string.substr(offset, 2))) ? offset + 2 : -1)
			:
		(predicate(_Utils_chr(string[offset]))
			? ((string[offset] === '\n') ? -2 : (offset + 1))
			: -1
		)
	);
});


var _Parser_isAsciiCode = F3(function(code, offset, string)
{
	return string.charCodeAt(offset) === code;
});



// NUMBERS


var _Parser_chompBase10 = F2(function(offset, string)
{
	for (; offset < string.length; offset++)
	{
		var code = string.charCodeAt(offset);
		if (code < 0x30 || 0x39 < code)
		{
			return offset;
		}
	}
	return offset;
});


var _Parser_consumeBase = F3(function(base, offset, string)
{
	for (var total = 0; offset < string.length; offset++)
	{
		var digit = string.charCodeAt(offset) - 0x30;
		if (digit < 0 || base <= digit) break;
		total = base * total + digit;
	}
	return _Utils_Tuple2(offset, total);
});


var _Parser_consumeBase16 = F2(function(offset, string)
{
	for (var total = 0; offset < string.length; offset++)
	{
		var code = string.charCodeAt(offset);
		if (0x30 <= code && code <= 0x39)
		{
			total = 16 * total + code - 0x30;
		}
		else if (0x41 <= code && code <= 0x46)
		{
			total = 16 * total + code - 55;
		}
		else if (0x61 <= code && code <= 0x66)
		{
			total = 16 * total + code - 87;
		}
		else
		{
			break;
		}
	}
	return _Utils_Tuple2(offset, total);
});



// FIND STRING


var _Parser_findSubString = F5(function(smallString, offset, row, col, bigString)
{
	var newOffset = bigString.indexOf(smallString, offset);
	var target = newOffset < 0 ? bigString.length : newOffset + smallString.length;

	while (offset < target)
	{
		var code = bigString.charCodeAt(offset++);
		code === 0x000A /* \n */
			? ( col=1, row++ )
			: ( col++, (code & 0xF800) === 0xD800 && offset++ )
	}

	return _Utils_Tuple3(newOffset, row, col);
});
var author$project$Model$UrlChange = function (a) {
	return {$: 'UrlChange', a: a};
};
var author$project$Model$UrlRequest = function (a) {
	return {$: 'UrlRequest', a: a};
};
var author$project$Routes$NotFound = {$: 'NotFound'};
var author$project$Routes$Home = {$: 'Home'};
var author$project$Routes$Post = function (a) {
	return {$: 'Post', a: a};
};
var author$project$Routes$Projects = {$: 'Projects'};
var author$project$Routes$Resume = {$: 'Resume'};
var elm$core$Basics$EQ = {$: 'EQ'};
var elm$core$Basics$LT = {$: 'LT'};
var elm$core$Elm$JsArray$foldr = _JsArray_foldr;
var elm$core$Array$foldr = F3(
	function (func, baseCase, _n0) {
		var tree = _n0.c;
		var tail = _n0.d;
		var helper = F2(
			function (node, acc) {
				if (node.$ === 'SubTree') {
					var subTree = node.a;
					return A3(elm$core$Elm$JsArray$foldr, helper, acc, subTree);
				} else {
					var values = node.a;
					return A3(elm$core$Elm$JsArray$foldr, func, acc, values);
				}
			});
		return A3(
			elm$core$Elm$JsArray$foldr,
			helper,
			A3(elm$core$Elm$JsArray$foldr, func, baseCase, tail),
			tree);
	});
var elm$core$List$cons = _List_cons;
var elm$core$Array$toList = function (array) {
	return A3(elm$core$Array$foldr, elm$core$List$cons, _List_Nil, array);
};
var elm$core$Basics$GT = {$: 'GT'};
var elm$core$Dict$foldr = F3(
	function (func, acc, t) {
		foldr:
		while (true) {
			if (t.$ === 'RBEmpty_elm_builtin') {
				return acc;
			} else {
				var key = t.b;
				var value = t.c;
				var left = t.d;
				var right = t.e;
				var $temp$func = func,
					$temp$acc = A3(
					func,
					key,
					value,
					A3(elm$core$Dict$foldr, func, acc, right)),
					$temp$t = left;
				func = $temp$func;
				acc = $temp$acc;
				t = $temp$t;
				continue foldr;
			}
		}
	});
var elm$core$Dict$toList = function (dict) {
	return A3(
		elm$core$Dict$foldr,
		F3(
			function (key, value, list) {
				return A2(
					elm$core$List$cons,
					_Utils_Tuple2(key, value),
					list);
			}),
		_List_Nil,
		dict);
};
var elm$core$Dict$keys = function (dict) {
	return A3(
		elm$core$Dict$foldr,
		F3(
			function (key, value, keyList) {
				return A2(elm$core$List$cons, key, keyList);
			}),
		_List_Nil,
		dict);
};
var elm$core$Set$toList = function (_n0) {
	var dict = _n0.a;
	return elm$core$Dict$keys(dict);
};
var elm$core$Basics$apL = F2(
	function (f, x) {
		return f(x);
	});
var elm$core$Basics$identity = function (x) {
	return x;
};
var elm$core$Basics$add = _Basics_add;
var elm$core$Basics$gt = _Utils_gt;
var elm$core$List$foldl = F3(
	function (func, acc, list) {
		foldl:
		while (true) {
			if (!list.b) {
				return acc;
			} else {
				var x = list.a;
				var xs = list.b;
				var $temp$func = func,
					$temp$acc = A2(func, x, acc),
					$temp$list = xs;
				func = $temp$func;
				acc = $temp$acc;
				list = $temp$list;
				continue foldl;
			}
		}
	});
var elm$core$List$reverse = function (list) {
	return A3(elm$core$List$foldl, elm$core$List$cons, _List_Nil, list);
};
var elm$core$List$foldrHelper = F4(
	function (fn, acc, ctr, ls) {
		if (!ls.b) {
			return acc;
		} else {
			var a = ls.a;
			var r1 = ls.b;
			if (!r1.b) {
				return A2(fn, a, acc);
			} else {
				var b = r1.a;
				var r2 = r1.b;
				if (!r2.b) {
					return A2(
						fn,
						a,
						A2(fn, b, acc));
				} else {
					var c = r2.a;
					var r3 = r2.b;
					if (!r3.b) {
						return A2(
							fn,
							a,
							A2(
								fn,
								b,
								A2(fn, c, acc)));
					} else {
						var d = r3.a;
						var r4 = r3.b;
						var res = (ctr > 500) ? A3(
							elm$core$List$foldl,
							fn,
							acc,
							elm$core$List$reverse(r4)) : A4(elm$core$List$foldrHelper, fn, acc, ctr + 1, r4);
						return A2(
							fn,
							a,
							A2(
								fn,
								b,
								A2(
									fn,
									c,
									A2(fn, d, res))));
					}
				}
			}
		}
	});
var elm$core$List$foldr = F3(
	function (fn, acc, ls) {
		return A4(elm$core$List$foldrHelper, fn, acc, 0, ls);
	});
var elm$core$List$map = F2(
	function (f, xs) {
		return A3(
			elm$core$List$foldr,
			F2(
				function (x, acc) {
					return A2(
						elm$core$List$cons,
						f(x),
						acc);
				}),
			_List_Nil,
			xs);
	});
var elm$url$Url$Parser$Parser = function (a) {
	return {$: 'Parser', a: a};
};
var elm$url$Url$Parser$State = F5(
	function (visited, unvisited, params, frag, value) {
		return {frag: frag, params: params, unvisited: unvisited, value: value, visited: visited};
	});
var elm$url$Url$Parser$mapState = F2(
	function (func, _n0) {
		var visited = _n0.visited;
		var unvisited = _n0.unvisited;
		var params = _n0.params;
		var frag = _n0.frag;
		var value = _n0.value;
		return A5(
			elm$url$Url$Parser$State,
			visited,
			unvisited,
			params,
			frag,
			func(value));
	});
var elm$url$Url$Parser$map = F2(
	function (subValue, _n0) {
		var parseArg = _n0.a;
		return elm$url$Url$Parser$Parser(
			function (_n1) {
				var visited = _n1.visited;
				var unvisited = _n1.unvisited;
				var params = _n1.params;
				var frag = _n1.frag;
				var value = _n1.value;
				return A2(
					elm$core$List$map,
					elm$url$Url$Parser$mapState(value),
					parseArg(
						A5(elm$url$Url$Parser$State, visited, unvisited, params, frag, subValue)));
			});
	});
var elm$core$List$append = F2(
	function (xs, ys) {
		if (!ys.b) {
			return xs;
		} else {
			return A3(elm$core$List$foldr, elm$core$List$cons, ys, xs);
		}
	});
var elm$core$List$concat = function (lists) {
	return A3(elm$core$List$foldr, elm$core$List$append, _List_Nil, lists);
};
var elm$core$List$concatMap = F2(
	function (f, list) {
		return elm$core$List$concat(
			A2(elm$core$List$map, f, list));
	});
var elm$url$Url$Parser$oneOf = function (parsers) {
	return elm$url$Url$Parser$Parser(
		function (state) {
			return A2(
				elm$core$List$concatMap,
				function (_n0) {
					var parser = _n0.a;
					return parser(state);
				},
				parsers);
		});
};
var elm$core$Basics$eq = _Utils_equal;
var elm$url$Url$Parser$s = function (str) {
	return elm$url$Url$Parser$Parser(
		function (_n0) {
			var visited = _n0.visited;
			var unvisited = _n0.unvisited;
			var params = _n0.params;
			var frag = _n0.frag;
			var value = _n0.value;
			if (!unvisited.b) {
				return _List_Nil;
			} else {
				var next = unvisited.a;
				var rest = unvisited.b;
				return _Utils_eq(next, str) ? _List_fromArray(
					[
						A5(
						elm$url$Url$Parser$State,
						A2(elm$core$List$cons, next, visited),
						rest,
						params,
						frag,
						value)
					]) : _List_Nil;
			}
		});
};
var elm$url$Url$Parser$slash = F2(
	function (_n0, _n1) {
		var parseBefore = _n0.a;
		var parseAfter = _n1.a;
		return elm$url$Url$Parser$Parser(
			function (state) {
				return A2(
					elm$core$List$concatMap,
					parseAfter,
					parseBefore(state));
			});
	});
var elm$core$Maybe$Just = function (a) {
	return {$: 'Just', a: a};
};
var elm$url$Url$Parser$custom = F2(
	function (tipe, stringToSomething) {
		return elm$url$Url$Parser$Parser(
			function (_n0) {
				var visited = _n0.visited;
				var unvisited = _n0.unvisited;
				var params = _n0.params;
				var frag = _n0.frag;
				var value = _n0.value;
				if (!unvisited.b) {
					return _List_Nil;
				} else {
					var next = unvisited.a;
					var rest = unvisited.b;
					var _n2 = stringToSomething(next);
					if (_n2.$ === 'Just') {
						var nextValue = _n2.a;
						return _List_fromArray(
							[
								A5(
								elm$url$Url$Parser$State,
								A2(elm$core$List$cons, next, visited),
								rest,
								params,
								frag,
								value(nextValue))
							]);
					} else {
						return _List_Nil;
					}
				}
			});
	});
var elm$url$Url$Parser$string = A2(elm$url$Url$Parser$custom, 'STRING', elm$core$Maybe$Just);
var elm$url$Url$Parser$top = elm$url$Url$Parser$Parser(
	function (state) {
		return _List_fromArray(
			[state]);
	});
var author$project$Routes$urlParser = elm$url$Url$Parser$oneOf(
	_List_fromArray(
		[
			A2(elm$url$Url$Parser$map, author$project$Routes$Home, elm$url$Url$Parser$top),
			A2(
			elm$url$Url$Parser$map,
			author$project$Routes$Resume,
			elm$url$Url$Parser$s('resume')),
			A2(
			elm$url$Url$Parser$map,
			author$project$Routes$Projects,
			elm$url$Url$Parser$s('projects')),
			A2(
			elm$url$Url$Parser$map,
			author$project$Routes$Post,
			A2(
				elm$url$Url$Parser$slash,
				elm$url$Url$Parser$s('post'),
				elm$url$Url$Parser$string))
		]));
var elm$core$Basics$apR = F2(
	function (x, f) {
		return f(x);
	});
var elm$core$Maybe$Nothing = {$: 'Nothing'};
var elm$core$Maybe$withDefault = F2(
	function (_default, maybe) {
		if (maybe.$ === 'Just') {
			var value = maybe.a;
			return value;
		} else {
			return _default;
		}
	});
var elm$url$Url$Parser$getFirstMatch = function (states) {
	getFirstMatch:
	while (true) {
		if (!states.b) {
			return elm$core$Maybe$Nothing;
		} else {
			var state = states.a;
			var rest = states.b;
			var _n1 = state.unvisited;
			if (!_n1.b) {
				return elm$core$Maybe$Just(state.value);
			} else {
				if ((_n1.a === '') && (!_n1.b.b)) {
					return elm$core$Maybe$Just(state.value);
				} else {
					var $temp$states = rest;
					states = $temp$states;
					continue getFirstMatch;
				}
			}
		}
	}
};
var elm$core$String$split = F2(
	function (sep, string) {
		return _List_fromArray(
			A2(_String_split, sep, string));
	});
var elm$url$Url$Parser$removeFinalEmpty = function (segments) {
	if (!segments.b) {
		return _List_Nil;
	} else {
		if ((segments.a === '') && (!segments.b.b)) {
			return _List_Nil;
		} else {
			var segment = segments.a;
			var rest = segments.b;
			return A2(
				elm$core$List$cons,
				segment,
				elm$url$Url$Parser$removeFinalEmpty(rest));
		}
	}
};
var elm$url$Url$Parser$preparePath = function (path) {
	var _n0 = A2(elm$core$String$split, '/', path);
	if (_n0.b && (_n0.a === '')) {
		var segments = _n0.b;
		return elm$url$Url$Parser$removeFinalEmpty(segments);
	} else {
		var segments = _n0;
		return elm$url$Url$Parser$removeFinalEmpty(segments);
	}
};
var elm$core$Dict$RBEmpty_elm_builtin = {$: 'RBEmpty_elm_builtin'};
var elm$core$Dict$empty = elm$core$Dict$RBEmpty_elm_builtin;
var elm$core$Basics$compare = _Utils_compare;
var elm$core$Dict$get = F2(
	function (targetKey, dict) {
		get:
		while (true) {
			if (dict.$ === 'RBEmpty_elm_builtin') {
				return elm$core$Maybe$Nothing;
			} else {
				var key = dict.b;
				var value = dict.c;
				var left = dict.d;
				var right = dict.e;
				var _n1 = A2(elm$core$Basics$compare, targetKey, key);
				switch (_n1.$) {
					case 'LT':
						var $temp$targetKey = targetKey,
							$temp$dict = left;
						targetKey = $temp$targetKey;
						dict = $temp$dict;
						continue get;
					case 'EQ':
						return elm$core$Maybe$Just(value);
					default:
						var $temp$targetKey = targetKey,
							$temp$dict = right;
						targetKey = $temp$targetKey;
						dict = $temp$dict;
						continue get;
				}
			}
		}
	});
var elm$core$Dict$Black = {$: 'Black'};
var elm$core$Dict$RBNode_elm_builtin = F5(
	function (a, b, c, d, e) {
		return {$: 'RBNode_elm_builtin', a: a, b: b, c: c, d: d, e: e};
	});
var elm$core$Dict$Red = {$: 'Red'};
var elm$core$Dict$balance = F5(
	function (color, key, value, left, right) {
		if ((right.$ === 'RBNode_elm_builtin') && (right.a.$ === 'Red')) {
			var _n1 = right.a;
			var rK = right.b;
			var rV = right.c;
			var rLeft = right.d;
			var rRight = right.e;
			if ((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Red')) {
				var _n3 = left.a;
				var lK = left.b;
				var lV = left.c;
				var lLeft = left.d;
				var lRight = left.e;
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Red,
					key,
					value,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, rK, rV, rLeft, rRight));
			} else {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					color,
					rK,
					rV,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, key, value, left, rLeft),
					rRight);
			}
		} else {
			if ((((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Red')) && (left.d.$ === 'RBNode_elm_builtin')) && (left.d.a.$ === 'Red')) {
				var _n5 = left.a;
				var lK = left.b;
				var lV = left.c;
				var _n6 = left.d;
				var _n7 = _n6.a;
				var llK = _n6.b;
				var llV = _n6.c;
				var llLeft = _n6.d;
				var llRight = _n6.e;
				var lRight = left.e;
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Red,
					lK,
					lV,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, llK, llV, llLeft, llRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, key, value, lRight, right));
			} else {
				return A5(elm$core$Dict$RBNode_elm_builtin, color, key, value, left, right);
			}
		}
	});
var elm$core$Dict$insertHelp = F3(
	function (key, value, dict) {
		if (dict.$ === 'RBEmpty_elm_builtin') {
			return A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, key, value, elm$core$Dict$RBEmpty_elm_builtin, elm$core$Dict$RBEmpty_elm_builtin);
		} else {
			var nColor = dict.a;
			var nKey = dict.b;
			var nValue = dict.c;
			var nLeft = dict.d;
			var nRight = dict.e;
			var _n1 = A2(elm$core$Basics$compare, key, nKey);
			switch (_n1.$) {
				case 'LT':
					return A5(
						elm$core$Dict$balance,
						nColor,
						nKey,
						nValue,
						A3(elm$core$Dict$insertHelp, key, value, nLeft),
						nRight);
				case 'EQ':
					return A5(elm$core$Dict$RBNode_elm_builtin, nColor, nKey, value, nLeft, nRight);
				default:
					return A5(
						elm$core$Dict$balance,
						nColor,
						nKey,
						nValue,
						nLeft,
						A3(elm$core$Dict$insertHelp, key, value, nRight));
			}
		}
	});
var elm$core$Dict$insert = F3(
	function (key, value, dict) {
		var _n0 = A3(elm$core$Dict$insertHelp, key, value, dict);
		if ((_n0.$ === 'RBNode_elm_builtin') && (_n0.a.$ === 'Red')) {
			var _n1 = _n0.a;
			var k = _n0.b;
			var v = _n0.c;
			var l = _n0.d;
			var r = _n0.e;
			return A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, k, v, l, r);
		} else {
			var x = _n0;
			return x;
		}
	});
var elm$core$Basics$lt = _Utils_lt;
var elm$core$Dict$getMin = function (dict) {
	getMin:
	while (true) {
		if ((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) {
			var left = dict.d;
			var $temp$dict = left;
			dict = $temp$dict;
			continue getMin;
		} else {
			return dict;
		}
	}
};
var elm$core$Dict$moveRedLeft = function (dict) {
	if (((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) && (dict.e.$ === 'RBNode_elm_builtin')) {
		if ((dict.e.d.$ === 'RBNode_elm_builtin') && (dict.e.d.a.$ === 'Red')) {
			var clr = dict.a;
			var k = dict.b;
			var v = dict.c;
			var _n1 = dict.d;
			var lClr = _n1.a;
			var lK = _n1.b;
			var lV = _n1.c;
			var lLeft = _n1.d;
			var lRight = _n1.e;
			var _n2 = dict.e;
			var rClr = _n2.a;
			var rK = _n2.b;
			var rV = _n2.c;
			var rLeft = _n2.d;
			var _n3 = rLeft.a;
			var rlK = rLeft.b;
			var rlV = rLeft.c;
			var rlL = rLeft.d;
			var rlR = rLeft.e;
			var rRight = _n2.e;
			return A5(
				elm$core$Dict$RBNode_elm_builtin,
				elm$core$Dict$Red,
				rlK,
				rlV,
				A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					rlL),
				A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, rK, rV, rlR, rRight));
		} else {
			var clr = dict.a;
			var k = dict.b;
			var v = dict.c;
			var _n4 = dict.d;
			var lClr = _n4.a;
			var lK = _n4.b;
			var lV = _n4.c;
			var lLeft = _n4.d;
			var lRight = _n4.e;
			var _n5 = dict.e;
			var rClr = _n5.a;
			var rK = _n5.b;
			var rV = _n5.c;
			var rLeft = _n5.d;
			var rRight = _n5.e;
			if (clr.$ === 'Black') {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight));
			} else {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight));
			}
		}
	} else {
		return dict;
	}
};
var elm$core$Dict$moveRedRight = function (dict) {
	if (((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) && (dict.e.$ === 'RBNode_elm_builtin')) {
		if ((dict.d.d.$ === 'RBNode_elm_builtin') && (dict.d.d.a.$ === 'Red')) {
			var clr = dict.a;
			var k = dict.b;
			var v = dict.c;
			var _n1 = dict.d;
			var lClr = _n1.a;
			var lK = _n1.b;
			var lV = _n1.c;
			var _n2 = _n1.d;
			var _n3 = _n2.a;
			var llK = _n2.b;
			var llV = _n2.c;
			var llLeft = _n2.d;
			var llRight = _n2.e;
			var lRight = _n1.e;
			var _n4 = dict.e;
			var rClr = _n4.a;
			var rK = _n4.b;
			var rV = _n4.c;
			var rLeft = _n4.d;
			var rRight = _n4.e;
			return A5(
				elm$core$Dict$RBNode_elm_builtin,
				elm$core$Dict$Red,
				lK,
				lV,
				A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, llK, llV, llLeft, llRight),
				A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					lRight,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight)));
		} else {
			var clr = dict.a;
			var k = dict.b;
			var v = dict.c;
			var _n5 = dict.d;
			var lClr = _n5.a;
			var lK = _n5.b;
			var lV = _n5.c;
			var lLeft = _n5.d;
			var lRight = _n5.e;
			var _n6 = dict.e;
			var rClr = _n6.a;
			var rK = _n6.b;
			var rV = _n6.c;
			var rLeft = _n6.d;
			var rRight = _n6.e;
			if (clr.$ === 'Black') {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight));
			} else {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					elm$core$Dict$Black,
					k,
					v,
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, rK, rV, rLeft, rRight));
			}
		}
	} else {
		return dict;
	}
};
var elm$core$Dict$removeHelpPrepEQGT = F7(
	function (targetKey, dict, color, key, value, left, right) {
		if ((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Red')) {
			var _n1 = left.a;
			var lK = left.b;
			var lV = left.c;
			var lLeft = left.d;
			var lRight = left.e;
			return A5(
				elm$core$Dict$RBNode_elm_builtin,
				color,
				lK,
				lV,
				lLeft,
				A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Red, key, value, lRight, right));
		} else {
			_n2$2:
			while (true) {
				if ((right.$ === 'RBNode_elm_builtin') && (right.a.$ === 'Black')) {
					if (right.d.$ === 'RBNode_elm_builtin') {
						if (right.d.a.$ === 'Black') {
							var _n3 = right.a;
							var _n4 = right.d;
							var _n5 = _n4.a;
							return elm$core$Dict$moveRedRight(dict);
						} else {
							break _n2$2;
						}
					} else {
						var _n6 = right.a;
						var _n7 = right.d;
						return elm$core$Dict$moveRedRight(dict);
					}
				} else {
					break _n2$2;
				}
			}
			return dict;
		}
	});
var elm$core$Dict$removeMin = function (dict) {
	if ((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) {
		var color = dict.a;
		var key = dict.b;
		var value = dict.c;
		var left = dict.d;
		var lColor = left.a;
		var lLeft = left.d;
		var right = dict.e;
		if (lColor.$ === 'Black') {
			if ((lLeft.$ === 'RBNode_elm_builtin') && (lLeft.a.$ === 'Red')) {
				var _n3 = lLeft.a;
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					color,
					key,
					value,
					elm$core$Dict$removeMin(left),
					right);
			} else {
				var _n4 = elm$core$Dict$moveRedLeft(dict);
				if (_n4.$ === 'RBNode_elm_builtin') {
					var nColor = _n4.a;
					var nKey = _n4.b;
					var nValue = _n4.c;
					var nLeft = _n4.d;
					var nRight = _n4.e;
					return A5(
						elm$core$Dict$balance,
						nColor,
						nKey,
						nValue,
						elm$core$Dict$removeMin(nLeft),
						nRight);
				} else {
					return elm$core$Dict$RBEmpty_elm_builtin;
				}
			}
		} else {
			return A5(
				elm$core$Dict$RBNode_elm_builtin,
				color,
				key,
				value,
				elm$core$Dict$removeMin(left),
				right);
		}
	} else {
		return elm$core$Dict$RBEmpty_elm_builtin;
	}
};
var elm$core$Dict$removeHelp = F2(
	function (targetKey, dict) {
		if (dict.$ === 'RBEmpty_elm_builtin') {
			return elm$core$Dict$RBEmpty_elm_builtin;
		} else {
			var color = dict.a;
			var key = dict.b;
			var value = dict.c;
			var left = dict.d;
			var right = dict.e;
			if (_Utils_cmp(targetKey, key) < 0) {
				if ((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Black')) {
					var _n4 = left.a;
					var lLeft = left.d;
					if ((lLeft.$ === 'RBNode_elm_builtin') && (lLeft.a.$ === 'Red')) {
						var _n6 = lLeft.a;
						return A5(
							elm$core$Dict$RBNode_elm_builtin,
							color,
							key,
							value,
							A2(elm$core$Dict$removeHelp, targetKey, left),
							right);
					} else {
						var _n7 = elm$core$Dict$moveRedLeft(dict);
						if (_n7.$ === 'RBNode_elm_builtin') {
							var nColor = _n7.a;
							var nKey = _n7.b;
							var nValue = _n7.c;
							var nLeft = _n7.d;
							var nRight = _n7.e;
							return A5(
								elm$core$Dict$balance,
								nColor,
								nKey,
								nValue,
								A2(elm$core$Dict$removeHelp, targetKey, nLeft),
								nRight);
						} else {
							return elm$core$Dict$RBEmpty_elm_builtin;
						}
					}
				} else {
					return A5(
						elm$core$Dict$RBNode_elm_builtin,
						color,
						key,
						value,
						A2(elm$core$Dict$removeHelp, targetKey, left),
						right);
				}
			} else {
				return A2(
					elm$core$Dict$removeHelpEQGT,
					targetKey,
					A7(elm$core$Dict$removeHelpPrepEQGT, targetKey, dict, color, key, value, left, right));
			}
		}
	});
var elm$core$Dict$removeHelpEQGT = F2(
	function (targetKey, dict) {
		if (dict.$ === 'RBNode_elm_builtin') {
			var color = dict.a;
			var key = dict.b;
			var value = dict.c;
			var left = dict.d;
			var right = dict.e;
			if (_Utils_eq(targetKey, key)) {
				var _n1 = elm$core$Dict$getMin(right);
				if (_n1.$ === 'RBNode_elm_builtin') {
					var minKey = _n1.b;
					var minValue = _n1.c;
					return A5(
						elm$core$Dict$balance,
						color,
						minKey,
						minValue,
						left,
						elm$core$Dict$removeMin(right));
				} else {
					return elm$core$Dict$RBEmpty_elm_builtin;
				}
			} else {
				return A5(
					elm$core$Dict$balance,
					color,
					key,
					value,
					left,
					A2(elm$core$Dict$removeHelp, targetKey, right));
			}
		} else {
			return elm$core$Dict$RBEmpty_elm_builtin;
		}
	});
var elm$core$Dict$remove = F2(
	function (key, dict) {
		var _n0 = A2(elm$core$Dict$removeHelp, key, dict);
		if ((_n0.$ === 'RBNode_elm_builtin') && (_n0.a.$ === 'Red')) {
			var _n1 = _n0.a;
			var k = _n0.b;
			var v = _n0.c;
			var l = _n0.d;
			var r = _n0.e;
			return A5(elm$core$Dict$RBNode_elm_builtin, elm$core$Dict$Black, k, v, l, r);
		} else {
			var x = _n0;
			return x;
		}
	});
var elm$core$Dict$update = F3(
	function (targetKey, alter, dictionary) {
		var _n0 = alter(
			A2(elm$core$Dict$get, targetKey, dictionary));
		if (_n0.$ === 'Just') {
			var value = _n0.a;
			return A3(elm$core$Dict$insert, targetKey, value, dictionary);
		} else {
			return A2(elm$core$Dict$remove, targetKey, dictionary);
		}
	});
var elm$url$Url$percentDecode = _Url_percentDecode;
var elm$url$Url$Parser$addToParametersHelp = F2(
	function (value, maybeList) {
		if (maybeList.$ === 'Nothing') {
			return elm$core$Maybe$Just(
				_List_fromArray(
					[value]));
		} else {
			var list = maybeList.a;
			return elm$core$Maybe$Just(
				A2(elm$core$List$cons, value, list));
		}
	});
var elm$url$Url$Parser$addParam = F2(
	function (segment, dict) {
		var _n0 = A2(elm$core$String$split, '=', segment);
		if ((_n0.b && _n0.b.b) && (!_n0.b.b.b)) {
			var rawKey = _n0.a;
			var _n1 = _n0.b;
			var rawValue = _n1.a;
			var _n2 = elm$url$Url$percentDecode(rawKey);
			if (_n2.$ === 'Nothing') {
				return dict;
			} else {
				var key = _n2.a;
				var _n3 = elm$url$Url$percentDecode(rawValue);
				if (_n3.$ === 'Nothing') {
					return dict;
				} else {
					var value = _n3.a;
					return A3(
						elm$core$Dict$update,
						key,
						elm$url$Url$Parser$addToParametersHelp(value),
						dict);
				}
			}
		} else {
			return dict;
		}
	});
var elm$url$Url$Parser$prepareQuery = function (maybeQuery) {
	if (maybeQuery.$ === 'Nothing') {
		return elm$core$Dict$empty;
	} else {
		var qry = maybeQuery.a;
		return A3(
			elm$core$List$foldr,
			elm$url$Url$Parser$addParam,
			elm$core$Dict$empty,
			A2(elm$core$String$split, '&', qry));
	}
};
var elm$url$Url$Parser$parse = F2(
	function (_n0, url) {
		var parser = _n0.a;
		return elm$url$Url$Parser$getFirstMatch(
			parser(
				A5(
					elm$url$Url$Parser$State,
					_List_Nil,
					elm$url$Url$Parser$preparePath(url.path),
					elm$url$Url$Parser$prepareQuery(url.query),
					url.fragment,
					elm$core$Basics$identity)));
	});
var author$project$Routes$fromUrl = function (url) {
	return A2(
		elm$core$Maybe$withDefault,
		author$project$Routes$NotFound,
		A2(
			elm$url$Url$Parser$parse,
			author$project$Routes$urlParser,
			_Utils_update(
				url,
				{
					fragment: elm$core$Maybe$Nothing,
					path: A2(elm$core$Maybe$withDefault, '', url.fragment)
				})));
};
var author$project$Router$init = F2(
	function (url, key) {
		return {
			blogSource: elm$core$Maybe$Nothing,
			navKey: key,
			route: author$project$Routes$fromUrl(url)
		};
	});
var elm$core$Debug$log = _Debug_log;
var elm$core$Basics$and = _Basics_and;
var elm$core$Basics$le = _Utils_le;
var mdgriffith$elm_ui$Element$BigDesktop = {$: 'BigDesktop'};
var mdgriffith$elm_ui$Element$Desktop = {$: 'Desktop'};
var mdgriffith$elm_ui$Element$Landscape = {$: 'Landscape'};
var mdgriffith$elm_ui$Element$Phone = {$: 'Phone'};
var mdgriffith$elm_ui$Element$Portrait = {$: 'Portrait'};
var mdgriffith$elm_ui$Element$Tablet = {$: 'Tablet'};
var mdgriffith$elm_ui$Element$classifyDevice = function (window) {
	return {
		_class: (window.width <= 600) ? mdgriffith$elm_ui$Element$Phone : (((window.width > 600) && (window.width <= 1200)) ? mdgriffith$elm_ui$Element$Tablet : (((window.width > 1200) && (window.width <= 1800)) ? mdgriffith$elm_ui$Element$Desktop : mdgriffith$elm_ui$Element$BigDesktop)),
		orientation: (_Utils_cmp(window.width, window.height) < 0) ? mdgriffith$elm_ui$Element$Portrait : mdgriffith$elm_ui$Element$Landscape
	};
};
var author$project$Model$initModel = F3(
	function (flags, url, key) {
		return {
			device: A2(
				elm$core$Debug$log,
				'device',
				mdgriffith$elm_ui$Element$classifyDevice(flags)),
			router: A2(author$project$Router$init, url, key)
		};
	});
var elm$core$Basics$False = {$: 'False'};
var elm$core$Basics$True = {$: 'True'};
var elm$core$Result$isOk = function (result) {
	if (result.$ === 'Ok') {
		return true;
	} else {
		return false;
	}
};
var elm$core$Array$branchFactor = 32;
var elm$core$Array$Array_elm_builtin = F4(
	function (a, b, c, d) {
		return {$: 'Array_elm_builtin', a: a, b: b, c: c, d: d};
	});
var elm$core$Basics$ceiling = _Basics_ceiling;
var elm$core$Basics$fdiv = _Basics_fdiv;
var elm$core$Basics$logBase = F2(
	function (base, number) {
		return _Basics_log(number) / _Basics_log(base);
	});
var elm$core$Basics$toFloat = _Basics_toFloat;
var elm$core$Array$shiftStep = elm$core$Basics$ceiling(
	A2(elm$core$Basics$logBase, 2, elm$core$Array$branchFactor));
var elm$core$Elm$JsArray$empty = _JsArray_empty;
var elm$core$Array$empty = A4(elm$core$Array$Array_elm_builtin, 0, elm$core$Array$shiftStep, elm$core$Elm$JsArray$empty, elm$core$Elm$JsArray$empty);
var elm$core$Array$Leaf = function (a) {
	return {$: 'Leaf', a: a};
};
var elm$core$Array$SubTree = function (a) {
	return {$: 'SubTree', a: a};
};
var elm$core$Elm$JsArray$initializeFromList = _JsArray_initializeFromList;
var elm$core$Array$compressNodes = F2(
	function (nodes, acc) {
		compressNodes:
		while (true) {
			var _n0 = A2(elm$core$Elm$JsArray$initializeFromList, elm$core$Array$branchFactor, nodes);
			var node = _n0.a;
			var remainingNodes = _n0.b;
			var newAcc = A2(
				elm$core$List$cons,
				elm$core$Array$SubTree(node),
				acc);
			if (!remainingNodes.b) {
				return elm$core$List$reverse(newAcc);
			} else {
				var $temp$nodes = remainingNodes,
					$temp$acc = newAcc;
				nodes = $temp$nodes;
				acc = $temp$acc;
				continue compressNodes;
			}
		}
	});
var elm$core$Tuple$first = function (_n0) {
	var x = _n0.a;
	return x;
};
var elm$core$Array$treeFromBuilder = F2(
	function (nodeList, nodeListSize) {
		treeFromBuilder:
		while (true) {
			var newNodeSize = elm$core$Basics$ceiling(nodeListSize / elm$core$Array$branchFactor);
			if (newNodeSize === 1) {
				return A2(elm$core$Elm$JsArray$initializeFromList, elm$core$Array$branchFactor, nodeList).a;
			} else {
				var $temp$nodeList = A2(elm$core$Array$compressNodes, nodeList, _List_Nil),
					$temp$nodeListSize = newNodeSize;
				nodeList = $temp$nodeList;
				nodeListSize = $temp$nodeListSize;
				continue treeFromBuilder;
			}
		}
	});
var elm$core$Basics$floor = _Basics_floor;
var elm$core$Basics$max = F2(
	function (x, y) {
		return (_Utils_cmp(x, y) > 0) ? x : y;
	});
var elm$core$Basics$mul = _Basics_mul;
var elm$core$Basics$sub = _Basics_sub;
var elm$core$Elm$JsArray$length = _JsArray_length;
var elm$core$Array$builderToArray = F2(
	function (reverseNodeList, builder) {
		if (!builder.nodeListSize) {
			return A4(
				elm$core$Array$Array_elm_builtin,
				elm$core$Elm$JsArray$length(builder.tail),
				elm$core$Array$shiftStep,
				elm$core$Elm$JsArray$empty,
				builder.tail);
		} else {
			var treeLen = builder.nodeListSize * elm$core$Array$branchFactor;
			var depth = elm$core$Basics$floor(
				A2(elm$core$Basics$logBase, elm$core$Array$branchFactor, treeLen - 1));
			var correctNodeList = reverseNodeList ? elm$core$List$reverse(builder.nodeList) : builder.nodeList;
			var tree = A2(elm$core$Array$treeFromBuilder, correctNodeList, builder.nodeListSize);
			return A4(
				elm$core$Array$Array_elm_builtin,
				elm$core$Elm$JsArray$length(builder.tail) + treeLen,
				A2(elm$core$Basics$max, 5, depth * elm$core$Array$shiftStep),
				tree,
				builder.tail);
		}
	});
var elm$core$Basics$idiv = _Basics_idiv;
var elm$core$Elm$JsArray$initialize = _JsArray_initialize;
var elm$core$Array$initializeHelp = F5(
	function (fn, fromIndex, len, nodeList, tail) {
		initializeHelp:
		while (true) {
			if (fromIndex < 0) {
				return A2(
					elm$core$Array$builderToArray,
					false,
					{nodeList: nodeList, nodeListSize: (len / elm$core$Array$branchFactor) | 0, tail: tail});
			} else {
				var leaf = elm$core$Array$Leaf(
					A3(elm$core$Elm$JsArray$initialize, elm$core$Array$branchFactor, fromIndex, fn));
				var $temp$fn = fn,
					$temp$fromIndex = fromIndex - elm$core$Array$branchFactor,
					$temp$len = len,
					$temp$nodeList = A2(elm$core$List$cons, leaf, nodeList),
					$temp$tail = tail;
				fn = $temp$fn;
				fromIndex = $temp$fromIndex;
				len = $temp$len;
				nodeList = $temp$nodeList;
				tail = $temp$tail;
				continue initializeHelp;
			}
		}
	});
var elm$core$Basics$remainderBy = _Basics_remainderBy;
var elm$core$Array$initialize = F2(
	function (len, fn) {
		if (len <= 0) {
			return elm$core$Array$empty;
		} else {
			var tailLen = len % elm$core$Array$branchFactor;
			var tail = A3(elm$core$Elm$JsArray$initialize, tailLen, len - tailLen, fn);
			var initialFromIndex = (len - tailLen) - elm$core$Array$branchFactor;
			return A5(elm$core$Array$initializeHelp, fn, initialFromIndex, len, _List_Nil, tail);
		}
	});
var elm$core$Result$Err = function (a) {
	return {$: 'Err', a: a};
};
var elm$core$Result$Ok = function (a) {
	return {$: 'Ok', a: a};
};
var elm$json$Json$Decode$Failure = F2(
	function (a, b) {
		return {$: 'Failure', a: a, b: b};
	});
var elm$json$Json$Decode$Field = F2(
	function (a, b) {
		return {$: 'Field', a: a, b: b};
	});
var elm$json$Json$Decode$Index = F2(
	function (a, b) {
		return {$: 'Index', a: a, b: b};
	});
var elm$json$Json$Decode$OneOf = function (a) {
	return {$: 'OneOf', a: a};
};
var elm$core$Basics$append = _Utils_append;
var elm$core$Basics$or = _Basics_or;
var elm$core$Char$toCode = _Char_toCode;
var elm$core$Char$isLower = function (_char) {
	var code = elm$core$Char$toCode(_char);
	return (97 <= code) && (code <= 122);
};
var elm$core$Char$isUpper = function (_char) {
	var code = elm$core$Char$toCode(_char);
	return (code <= 90) && (65 <= code);
};
var elm$core$Char$isAlpha = function (_char) {
	return elm$core$Char$isLower(_char) || elm$core$Char$isUpper(_char);
};
var elm$core$Char$isDigit = function (_char) {
	var code = elm$core$Char$toCode(_char);
	return (code <= 57) && (48 <= code);
};
var elm$core$Char$isAlphaNum = function (_char) {
	return elm$core$Char$isLower(_char) || (elm$core$Char$isUpper(_char) || elm$core$Char$isDigit(_char));
};
var elm$core$List$length = function (xs) {
	return A3(
		elm$core$List$foldl,
		F2(
			function (_n0, i) {
				return i + 1;
			}),
		0,
		xs);
};
var elm$core$List$map2 = _List_map2;
var elm$core$List$rangeHelp = F3(
	function (lo, hi, list) {
		rangeHelp:
		while (true) {
			if (_Utils_cmp(lo, hi) < 1) {
				var $temp$lo = lo,
					$temp$hi = hi - 1,
					$temp$list = A2(elm$core$List$cons, hi, list);
				lo = $temp$lo;
				hi = $temp$hi;
				list = $temp$list;
				continue rangeHelp;
			} else {
				return list;
			}
		}
	});
var elm$core$List$range = F2(
	function (lo, hi) {
		return A3(elm$core$List$rangeHelp, lo, hi, _List_Nil);
	});
var elm$core$List$indexedMap = F2(
	function (f, xs) {
		return A3(
			elm$core$List$map2,
			f,
			A2(
				elm$core$List$range,
				0,
				elm$core$List$length(xs) - 1),
			xs);
	});
var elm$core$String$all = _String_all;
var elm$core$String$fromInt = _String_fromNumber;
var elm$core$String$join = F2(
	function (sep, chunks) {
		return A2(
			_String_join,
			sep,
			_List_toArray(chunks));
	});
var elm$core$String$uncons = _String_uncons;
var elm$json$Json$Decode$indent = function (str) {
	return A2(
		elm$core$String$join,
		'\n    ',
		A2(elm$core$String$split, '\n', str));
};
var elm$json$Json$Encode$encode = _Json_encode;
var elm$json$Json$Decode$errorOneOf = F2(
	function (i, error) {
		return '\n\n(' + (elm$core$String$fromInt(i + 1) + (') ' + elm$json$Json$Decode$indent(
			elm$json$Json$Decode$errorToString(error))));
	});
var elm$json$Json$Decode$errorToString = function (error) {
	return A2(elm$json$Json$Decode$errorToStringHelp, error, _List_Nil);
};
var elm$json$Json$Decode$errorToStringHelp = F2(
	function (error, context) {
		errorToStringHelp:
		while (true) {
			switch (error.$) {
				case 'Field':
					var f = error.a;
					var err = error.b;
					var isSimple = function () {
						var _n1 = elm$core$String$uncons(f);
						if (_n1.$ === 'Nothing') {
							return false;
						} else {
							var _n2 = _n1.a;
							var _char = _n2.a;
							var rest = _n2.b;
							return elm$core$Char$isAlpha(_char) && A2(elm$core$String$all, elm$core$Char$isAlphaNum, rest);
						}
					}();
					var fieldName = isSimple ? ('.' + f) : ('[\'' + (f + '\']'));
					var $temp$error = err,
						$temp$context = A2(elm$core$List$cons, fieldName, context);
					error = $temp$error;
					context = $temp$context;
					continue errorToStringHelp;
				case 'Index':
					var i = error.a;
					var err = error.b;
					var indexName = '[' + (elm$core$String$fromInt(i) + ']');
					var $temp$error = err,
						$temp$context = A2(elm$core$List$cons, indexName, context);
					error = $temp$error;
					context = $temp$context;
					continue errorToStringHelp;
				case 'OneOf':
					var errors = error.a;
					if (!errors.b) {
						return 'Ran into a Json.Decode.oneOf with no possibilities' + function () {
							if (!context.b) {
								return '!';
							} else {
								return ' at json' + A2(
									elm$core$String$join,
									'',
									elm$core$List$reverse(context));
							}
						}();
					} else {
						if (!errors.b.b) {
							var err = errors.a;
							var $temp$error = err,
								$temp$context = context;
							error = $temp$error;
							context = $temp$context;
							continue errorToStringHelp;
						} else {
							var starter = function () {
								if (!context.b) {
									return 'Json.Decode.oneOf';
								} else {
									return 'The Json.Decode.oneOf at json' + A2(
										elm$core$String$join,
										'',
										elm$core$List$reverse(context));
								}
							}();
							var introduction = starter + (' failed in the following ' + (elm$core$String$fromInt(
								elm$core$List$length(errors)) + ' ways:'));
							return A2(
								elm$core$String$join,
								'\n\n',
								A2(
									elm$core$List$cons,
									introduction,
									A2(elm$core$List$indexedMap, elm$json$Json$Decode$errorOneOf, errors)));
						}
					}
				default:
					var msg = error.a;
					var json = error.b;
					var introduction = function () {
						if (!context.b) {
							return 'Problem with the given value:\n\n';
						} else {
							return 'Problem with the value at json' + (A2(
								elm$core$String$join,
								'',
								elm$core$List$reverse(context)) + ':\n\n    ');
						}
					}();
					return introduction + (elm$json$Json$Decode$indent(
						A2(elm$json$Json$Encode$encode, 4, json)) + ('\n\n' + msg));
			}
		}
	});
var elm$core$Platform$Cmd$batch = _Platform_batch;
var elm$core$Platform$Cmd$none = elm$core$Platform$Cmd$batch(_List_Nil);
var author$project$Model$init = F3(
	function (flags, url, key) {
		return _Utils_Tuple2(
			A3(author$project$Model$initModel, flags, url, key),
			elm$core$Platform$Cmd$none);
	});
var author$project$Model$WindowResize = function (a) {
	return {$: 'WindowResize', a: a};
};
var author$project$Model$WindowSize = F2(
	function (width, height) {
		return {height: height, width: width};
	});
var elm$browser$Browser$Events$Window = {$: 'Window'};
var elm$browser$Browser$Events$MySub = F3(
	function (a, b, c) {
		return {$: 'MySub', a: a, b: b, c: c};
	});
var elm$browser$Browser$Events$State = F2(
	function (subs, pids) {
		return {pids: pids, subs: subs};
	});
var elm$core$Task$succeed = _Scheduler_succeed;
var elm$browser$Browser$Events$init = elm$core$Task$succeed(
	A2(elm$browser$Browser$Events$State, _List_Nil, elm$core$Dict$empty));
var elm$browser$Browser$Events$nodeToKey = function (node) {
	if (node.$ === 'Document') {
		return 'd_';
	} else {
		return 'w_';
	}
};
var elm$browser$Browser$Events$addKey = function (sub) {
	var node = sub.a;
	var name = sub.b;
	return _Utils_Tuple2(
		_Utils_ap(
			elm$browser$Browser$Events$nodeToKey(node),
			name),
		sub);
};
var elm$browser$Browser$Events$Event = F2(
	function (key, event) {
		return {event: event, key: key};
	});
var elm$core$Platform$sendToSelf = _Platform_sendToSelf;
var elm$core$Task$andThen = _Scheduler_andThen;
var elm$core$Task$map = F2(
	function (func, taskA) {
		return A2(
			elm$core$Task$andThen,
			function (a) {
				return elm$core$Task$succeed(
					func(a));
			},
			taskA);
	});
var elm$browser$Browser$External = function (a) {
	return {$: 'External', a: a};
};
var elm$browser$Browser$Internal = function (a) {
	return {$: 'Internal', a: a};
};
var elm$browser$Browser$Dom$NotFound = function (a) {
	return {$: 'NotFound', a: a};
};
var elm$core$Basics$never = function (_n0) {
	never:
	while (true) {
		var nvr = _n0.a;
		var $temp$_n0 = nvr;
		_n0 = $temp$_n0;
		continue never;
	}
};
var elm$core$Task$Perform = function (a) {
	return {$: 'Perform', a: a};
};
var elm$core$Task$init = elm$core$Task$succeed(_Utils_Tuple0);
var elm$core$Task$map2 = F3(
	function (func, taskA, taskB) {
		return A2(
			elm$core$Task$andThen,
			function (a) {
				return A2(
					elm$core$Task$andThen,
					function (b) {
						return elm$core$Task$succeed(
							A2(func, a, b));
					},
					taskB);
			},
			taskA);
	});
var elm$core$Task$sequence = function (tasks) {
	return A3(
		elm$core$List$foldr,
		elm$core$Task$map2(elm$core$List$cons),
		elm$core$Task$succeed(_List_Nil),
		tasks);
};
var elm$core$Platform$sendToApp = _Platform_sendToApp;
var elm$core$Task$spawnCmd = F2(
	function (router, _n0) {
		var task = _n0.a;
		return _Scheduler_spawn(
			A2(
				elm$core$Task$andThen,
				elm$core$Platform$sendToApp(router),
				task));
	});
var elm$core$Task$onEffects = F3(
	function (router, commands, state) {
		return A2(
			elm$core$Task$map,
			function (_n0) {
				return _Utils_Tuple0;
			},
			elm$core$Task$sequence(
				A2(
					elm$core$List$map,
					elm$core$Task$spawnCmd(router),
					commands)));
	});
var elm$core$Task$onSelfMsg = F3(
	function (_n0, _n1, _n2) {
		return elm$core$Task$succeed(_Utils_Tuple0);
	});
var elm$core$Task$cmdMap = F2(
	function (tagger, _n0) {
		var task = _n0.a;
		return elm$core$Task$Perform(
			A2(elm$core$Task$map, tagger, task));
	});
_Platform_effectManagers['Task'] = _Platform_createManager(elm$core$Task$init, elm$core$Task$onEffects, elm$core$Task$onSelfMsg, elm$core$Task$cmdMap);
var elm$core$Task$command = _Platform_leaf('Task');
var elm$core$Task$perform = F2(
	function (toMessage, task) {
		return elm$core$Task$command(
			elm$core$Task$Perform(
				A2(elm$core$Task$map, toMessage, task)));
	});
var elm$json$Json$Decode$map = _Json_map1;
var elm$json$Json$Decode$map2 = _Json_map2;
var elm$json$Json$Decode$succeed = _Json_succeed;
var elm$virtual_dom$VirtualDom$toHandlerInt = function (handler) {
	switch (handler.$) {
		case 'Normal':
			return 0;
		case 'MayStopPropagation':
			return 1;
		case 'MayPreventDefault':
			return 2;
		default:
			return 3;
	}
};
var elm$core$String$length = _String_length;
var elm$core$String$slice = _String_slice;
var elm$core$String$dropLeft = F2(
	function (n, string) {
		return (n < 1) ? string : A3(
			elm$core$String$slice,
			n,
			elm$core$String$length(string),
			string);
	});
var elm$core$String$startsWith = _String_startsWith;
var elm$url$Url$Http = {$: 'Http'};
var elm$url$Url$Https = {$: 'Https'};
var elm$core$String$indexes = _String_indexes;
var elm$core$String$isEmpty = function (string) {
	return string === '';
};
var elm$core$String$left = F2(
	function (n, string) {
		return (n < 1) ? '' : A3(elm$core$String$slice, 0, n, string);
	});
var elm$core$String$contains = _String_contains;
var elm$core$String$toInt = _String_toInt;
var elm$url$Url$Url = F6(
	function (protocol, host, port_, path, query, fragment) {
		return {fragment: fragment, host: host, path: path, port_: port_, protocol: protocol, query: query};
	});
var elm$url$Url$chompBeforePath = F5(
	function (protocol, path, params, frag, str) {
		if (elm$core$String$isEmpty(str) || A2(elm$core$String$contains, '@', str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, ':', str);
			if (!_n0.b) {
				return elm$core$Maybe$Just(
					A6(elm$url$Url$Url, protocol, str, elm$core$Maybe$Nothing, path, params, frag));
			} else {
				if (!_n0.b.b) {
					var i = _n0.a;
					var _n1 = elm$core$String$toInt(
						A2(elm$core$String$dropLeft, i + 1, str));
					if (_n1.$ === 'Nothing') {
						return elm$core$Maybe$Nothing;
					} else {
						var port_ = _n1;
						return elm$core$Maybe$Just(
							A6(
								elm$url$Url$Url,
								protocol,
								A2(elm$core$String$left, i, str),
								port_,
								path,
								params,
								frag));
					}
				} else {
					return elm$core$Maybe$Nothing;
				}
			}
		}
	});
var elm$url$Url$chompBeforeQuery = F4(
	function (protocol, params, frag, str) {
		if (elm$core$String$isEmpty(str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, '/', str);
			if (!_n0.b) {
				return A5(elm$url$Url$chompBeforePath, protocol, '/', params, frag, str);
			} else {
				var i = _n0.a;
				return A5(
					elm$url$Url$chompBeforePath,
					protocol,
					A2(elm$core$String$dropLeft, i, str),
					params,
					frag,
					A2(elm$core$String$left, i, str));
			}
		}
	});
var elm$url$Url$chompBeforeFragment = F3(
	function (protocol, frag, str) {
		if (elm$core$String$isEmpty(str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, '?', str);
			if (!_n0.b) {
				return A4(elm$url$Url$chompBeforeQuery, protocol, elm$core$Maybe$Nothing, frag, str);
			} else {
				var i = _n0.a;
				return A4(
					elm$url$Url$chompBeforeQuery,
					protocol,
					elm$core$Maybe$Just(
						A2(elm$core$String$dropLeft, i + 1, str)),
					frag,
					A2(elm$core$String$left, i, str));
			}
		}
	});
var elm$url$Url$chompAfterProtocol = F2(
	function (protocol, str) {
		if (elm$core$String$isEmpty(str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, '#', str);
			if (!_n0.b) {
				return A3(elm$url$Url$chompBeforeFragment, protocol, elm$core$Maybe$Nothing, str);
			} else {
				var i = _n0.a;
				return A3(
					elm$url$Url$chompBeforeFragment,
					protocol,
					elm$core$Maybe$Just(
						A2(elm$core$String$dropLeft, i + 1, str)),
					A2(elm$core$String$left, i, str));
			}
		}
	});
var elm$url$Url$fromString = function (str) {
	return A2(elm$core$String$startsWith, 'http://', str) ? A2(
		elm$url$Url$chompAfterProtocol,
		elm$url$Url$Http,
		A2(elm$core$String$dropLeft, 7, str)) : (A2(elm$core$String$startsWith, 'https://', str) ? A2(
		elm$url$Url$chompAfterProtocol,
		elm$url$Url$Https,
		A2(elm$core$String$dropLeft, 8, str)) : elm$core$Maybe$Nothing);
};
var elm$browser$Browser$Events$spawn = F3(
	function (router, key, _n0) {
		var node = _n0.a;
		var name = _n0.b;
		var actualNode = function () {
			if (node.$ === 'Document') {
				return _Browser_doc;
			} else {
				return _Browser_window;
			}
		}();
		return A2(
			elm$core$Task$map,
			function (value) {
				return _Utils_Tuple2(key, value);
			},
			A3(
				_Browser_on,
				actualNode,
				name,
				function (event) {
					return A2(
						elm$core$Platform$sendToSelf,
						router,
						A2(elm$browser$Browser$Events$Event, key, event));
				}));
	});
var elm$core$Dict$fromList = function (assocs) {
	return A3(
		elm$core$List$foldl,
		F2(
			function (_n0, dict) {
				var key = _n0.a;
				var value = _n0.b;
				return A3(elm$core$Dict$insert, key, value, dict);
			}),
		elm$core$Dict$empty,
		assocs);
};
var elm$core$Dict$foldl = F3(
	function (func, acc, dict) {
		foldl:
		while (true) {
			if (dict.$ === 'RBEmpty_elm_builtin') {
				return acc;
			} else {
				var key = dict.b;
				var value = dict.c;
				var left = dict.d;
				var right = dict.e;
				var $temp$func = func,
					$temp$acc = A3(
					func,
					key,
					value,
					A3(elm$core$Dict$foldl, func, acc, left)),
					$temp$dict = right;
				func = $temp$func;
				acc = $temp$acc;
				dict = $temp$dict;
				continue foldl;
			}
		}
	});
var elm$core$Dict$merge = F6(
	function (leftStep, bothStep, rightStep, leftDict, rightDict, initialResult) {
		var stepState = F3(
			function (rKey, rValue, _n0) {
				stepState:
				while (true) {
					var list = _n0.a;
					var result = _n0.b;
					if (!list.b) {
						return _Utils_Tuple2(
							list,
							A3(rightStep, rKey, rValue, result));
					} else {
						var _n2 = list.a;
						var lKey = _n2.a;
						var lValue = _n2.b;
						var rest = list.b;
						if (_Utils_cmp(lKey, rKey) < 0) {
							var $temp$rKey = rKey,
								$temp$rValue = rValue,
								$temp$_n0 = _Utils_Tuple2(
								rest,
								A3(leftStep, lKey, lValue, result));
							rKey = $temp$rKey;
							rValue = $temp$rValue;
							_n0 = $temp$_n0;
							continue stepState;
						} else {
							if (_Utils_cmp(lKey, rKey) > 0) {
								return _Utils_Tuple2(
									list,
									A3(rightStep, rKey, rValue, result));
							} else {
								return _Utils_Tuple2(
									rest,
									A4(bothStep, lKey, lValue, rValue, result));
							}
						}
					}
				}
			});
		var _n3 = A3(
			elm$core$Dict$foldl,
			stepState,
			_Utils_Tuple2(
				elm$core$Dict$toList(leftDict),
				initialResult),
			rightDict);
		var leftovers = _n3.a;
		var intermediateResult = _n3.b;
		return A3(
			elm$core$List$foldl,
			F2(
				function (_n4, result) {
					var k = _n4.a;
					var v = _n4.b;
					return A3(leftStep, k, v, result);
				}),
			intermediateResult,
			leftovers);
	});
var elm$core$Dict$union = F2(
	function (t1, t2) {
		return A3(elm$core$Dict$foldl, elm$core$Dict$insert, t2, t1);
	});
var elm$core$Process$kill = _Scheduler_kill;
var elm$browser$Browser$Events$onEffects = F3(
	function (router, subs, state) {
		var stepRight = F3(
			function (key, sub, _n6) {
				var deads = _n6.a;
				var lives = _n6.b;
				var news = _n6.c;
				return _Utils_Tuple3(
					deads,
					lives,
					A2(
						elm$core$List$cons,
						A3(elm$browser$Browser$Events$spawn, router, key, sub),
						news));
			});
		var stepLeft = F3(
			function (_n4, pid, _n5) {
				var deads = _n5.a;
				var lives = _n5.b;
				var news = _n5.c;
				return _Utils_Tuple3(
					A2(elm$core$List$cons, pid, deads),
					lives,
					news);
			});
		var stepBoth = F4(
			function (key, pid, _n2, _n3) {
				var deads = _n3.a;
				var lives = _n3.b;
				var news = _n3.c;
				return _Utils_Tuple3(
					deads,
					A3(elm$core$Dict$insert, key, pid, lives),
					news);
			});
		var newSubs = A2(elm$core$List$map, elm$browser$Browser$Events$addKey, subs);
		var _n0 = A6(
			elm$core$Dict$merge,
			stepLeft,
			stepBoth,
			stepRight,
			state.pids,
			elm$core$Dict$fromList(newSubs),
			_Utils_Tuple3(_List_Nil, elm$core$Dict$empty, _List_Nil));
		var deadPids = _n0.a;
		var livePids = _n0.b;
		var makeNewPids = _n0.c;
		return A2(
			elm$core$Task$andThen,
			function (pids) {
				return elm$core$Task$succeed(
					A2(
						elm$browser$Browser$Events$State,
						newSubs,
						A2(
							elm$core$Dict$union,
							livePids,
							elm$core$Dict$fromList(pids))));
			},
			A2(
				elm$core$Task$andThen,
				function (_n1) {
					return elm$core$Task$sequence(makeNewPids);
				},
				elm$core$Task$sequence(
					A2(elm$core$List$map, elm$core$Process$kill, deadPids))));
	});
var elm$core$List$maybeCons = F3(
	function (f, mx, xs) {
		var _n0 = f(mx);
		if (_n0.$ === 'Just') {
			var x = _n0.a;
			return A2(elm$core$List$cons, x, xs);
		} else {
			return xs;
		}
	});
var elm$core$List$filterMap = F2(
	function (f, xs) {
		return A3(
			elm$core$List$foldr,
			elm$core$List$maybeCons(f),
			_List_Nil,
			xs);
	});
var elm$browser$Browser$Events$onSelfMsg = F3(
	function (router, _n0, state) {
		var key = _n0.key;
		var event = _n0.event;
		var toMessage = function (_n2) {
			var subKey = _n2.a;
			var _n3 = _n2.b;
			var node = _n3.a;
			var name = _n3.b;
			var decoder = _n3.c;
			return _Utils_eq(subKey, key) ? A2(_Browser_decodeEvent, decoder, event) : elm$core$Maybe$Nothing;
		};
		var messages = A2(elm$core$List$filterMap, toMessage, state.subs);
		return A2(
			elm$core$Task$andThen,
			function (_n1) {
				return elm$core$Task$succeed(state);
			},
			elm$core$Task$sequence(
				A2(
					elm$core$List$map,
					elm$core$Platform$sendToApp(router),
					messages)));
	});
var elm$browser$Browser$Events$subMap = F2(
	function (func, _n0) {
		var node = _n0.a;
		var name = _n0.b;
		var decoder = _n0.c;
		return A3(
			elm$browser$Browser$Events$MySub,
			node,
			name,
			A2(elm$json$Json$Decode$map, func, decoder));
	});
_Platform_effectManagers['Browser.Events'] = _Platform_createManager(elm$browser$Browser$Events$init, elm$browser$Browser$Events$onEffects, elm$browser$Browser$Events$onSelfMsg, 0, elm$browser$Browser$Events$subMap);
var elm$browser$Browser$Events$subscription = _Platform_leaf('Browser.Events');
var elm$browser$Browser$Events$on = F3(
	function (node, name, decoder) {
		return elm$browser$Browser$Events$subscription(
			A3(elm$browser$Browser$Events$MySub, node, name, decoder));
	});
var elm$json$Json$Decode$field = _Json_decodeField;
var elm$json$Json$Decode$int = _Json_decodeInt;
var elm$browser$Browser$Events$onResize = function (func) {
	return A3(
		elm$browser$Browser$Events$on,
		elm$browser$Browser$Events$Window,
		'resize',
		A2(
			elm$json$Json$Decode$field,
			'target',
			A3(
				elm$json$Json$Decode$map2,
				func,
				A2(elm$json$Json$Decode$field, 'innerWidth', elm$json$Json$Decode$int),
				A2(elm$json$Json$Decode$field, 'innerHeight', elm$json$Json$Decode$int))));
};
var author$project$Subscriptions$subscriptions = function (model) {
	return elm$browser$Browser$Events$onResize(
		F2(
			function (x, y) {
				return author$project$Model$WindowResize(
					A2(author$project$Model$WindowSize, x, y));
			}));
};
var author$project$Model$NavigateTo = function (a) {
	return {$: 'NavigateTo', a: a};
};
var author$project$Router$NavigateTo = function (a) {
	return {$: 'NavigateTo', a: a};
};
var author$project$Router$UrlChanged = function (a) {
	return {$: 'UrlChanged', a: a};
};
var author$project$Model$RouterMsg = function (a) {
	return {$: 'RouterMsg', a: a};
};
var author$project$Router$GotSrc = F2(
	function (a, b) {
		return {$: 'GotSrc', a: a, b: b};
	});
var author$project$Router$HttpRequest = F2(
	function (a, b) {
		return {$: 'HttpRequest', a: a, b: b};
	});
var author$project$Routes$toEmuUrl = function (string) {
	return 'https://joshuaji.com/src/post/' + (string + '.emu');
};
var author$project$Routes$toUrlString = function (route) {
	var pieces = function () {
		switch (route.$) {
			case 'Home':
				return _List_Nil;
			case 'Resume':
				return _List_fromArray(
					['resume']);
			case 'Projects':
				return _List_fromArray(
					['projects']);
			case 'Post':
				var link = route.a;
				return _List_fromArray(
					['post', link]);
			default:
				return _List_fromArray(
					['oops']);
		}
	}();
	return '#/' + A2(elm$core$String$join, '/', pieces);
};
var elm$browser$Browser$Navigation$pushUrl = _Browser_pushUrl;
var elm$core$Basics$composeR = F3(
	function (f, g, x) {
		return g(
			f(x));
	});
var elm$core$Maybe$isJust = function (maybe) {
	if (maybe.$ === 'Just') {
		return true;
	} else {
		return false;
	}
};
var elm$core$Result$map = F2(
	function (func, ra) {
		if (ra.$ === 'Ok') {
			var a = ra.a;
			return elm$core$Result$Ok(
				func(a));
		} else {
			var e = ra.a;
			return elm$core$Result$Err(e);
		}
	});
var elm$http$Http$BadStatus_ = F2(
	function (a, b) {
		return {$: 'BadStatus_', a: a, b: b};
	});
var elm$http$Http$BadUrl_ = function (a) {
	return {$: 'BadUrl_', a: a};
};
var elm$http$Http$GoodStatus_ = F2(
	function (a, b) {
		return {$: 'GoodStatus_', a: a, b: b};
	});
var elm$http$Http$NetworkError_ = {$: 'NetworkError_'};
var elm$http$Http$Receiving = function (a) {
	return {$: 'Receiving', a: a};
};
var elm$http$Http$Sending = function (a) {
	return {$: 'Sending', a: a};
};
var elm$http$Http$Timeout_ = {$: 'Timeout_'};
var elm$http$Http$expectStringResponse = F2(
	function (toMsg, toResult) {
		return A3(
			_Http_expect,
			'',
			elm$core$Basics$identity,
			A2(elm$core$Basics$composeR, toResult, toMsg));
	});
var elm$core$Result$mapError = F2(
	function (f, result) {
		if (result.$ === 'Ok') {
			var v = result.a;
			return elm$core$Result$Ok(v);
		} else {
			var e = result.a;
			return elm$core$Result$Err(
				f(e));
		}
	});
var elm$http$Http$BadBody = function (a) {
	return {$: 'BadBody', a: a};
};
var elm$http$Http$BadStatus = function (a) {
	return {$: 'BadStatus', a: a};
};
var elm$http$Http$BadUrl = function (a) {
	return {$: 'BadUrl', a: a};
};
var elm$http$Http$NetworkError = {$: 'NetworkError'};
var elm$http$Http$Timeout = {$: 'Timeout'};
var elm$http$Http$resolve = F2(
	function (toResult, response) {
		switch (response.$) {
			case 'BadUrl_':
				var url = response.a;
				return elm$core$Result$Err(
					elm$http$Http$BadUrl(url));
			case 'Timeout_':
				return elm$core$Result$Err(elm$http$Http$Timeout);
			case 'NetworkError_':
				return elm$core$Result$Err(elm$http$Http$NetworkError);
			case 'BadStatus_':
				var metadata = response.a;
				return elm$core$Result$Err(
					elm$http$Http$BadStatus(metadata.statusCode));
			default:
				var body = response.b;
				return A2(
					elm$core$Result$mapError,
					elm$http$Http$BadBody,
					toResult(body));
		}
	});
var elm$http$Http$expectString = function (toMsg) {
	return A2(
		elm$http$Http$expectStringResponse,
		toMsg,
		elm$http$Http$resolve(elm$core$Result$Ok));
};
var elm$http$Http$emptyBody = _Http_emptyBody;
var elm$http$Http$Request = function (a) {
	return {$: 'Request', a: a};
};
var elm$http$Http$State = F2(
	function (reqs, subs) {
		return {reqs: reqs, subs: subs};
	});
var elm$http$Http$init = elm$core$Task$succeed(
	A2(elm$http$Http$State, elm$core$Dict$empty, _List_Nil));
var elm$core$Process$spawn = _Scheduler_spawn;
var elm$http$Http$updateReqs = F3(
	function (router, cmds, reqs) {
		updateReqs:
		while (true) {
			if (!cmds.b) {
				return elm$core$Task$succeed(reqs);
			} else {
				var cmd = cmds.a;
				var otherCmds = cmds.b;
				if (cmd.$ === 'Cancel') {
					var tracker = cmd.a;
					var _n2 = A2(elm$core$Dict$get, tracker, reqs);
					if (_n2.$ === 'Nothing') {
						var $temp$router = router,
							$temp$cmds = otherCmds,
							$temp$reqs = reqs;
						router = $temp$router;
						cmds = $temp$cmds;
						reqs = $temp$reqs;
						continue updateReqs;
					} else {
						var pid = _n2.a;
						return A2(
							elm$core$Task$andThen,
							function (_n3) {
								return A3(
									elm$http$Http$updateReqs,
									router,
									otherCmds,
									A2(elm$core$Dict$remove, tracker, reqs));
							},
							elm$core$Process$kill(pid));
					}
				} else {
					var req = cmd.a;
					return A2(
						elm$core$Task$andThen,
						function (pid) {
							var _n4 = req.tracker;
							if (_n4.$ === 'Nothing') {
								return A3(elm$http$Http$updateReqs, router, otherCmds, reqs);
							} else {
								var tracker = _n4.a;
								return A3(
									elm$http$Http$updateReqs,
									router,
									otherCmds,
									A3(elm$core$Dict$insert, tracker, pid, reqs));
							}
						},
						elm$core$Process$spawn(
							A3(
								_Http_toTask,
								router,
								elm$core$Platform$sendToApp(router),
								req)));
				}
			}
		}
	});
var elm$http$Http$onEffects = F4(
	function (router, cmds, subs, state) {
		return A2(
			elm$core$Task$andThen,
			function (reqs) {
				return elm$core$Task$succeed(
					A2(elm$http$Http$State, reqs, subs));
			},
			A3(elm$http$Http$updateReqs, router, cmds, state.reqs));
	});
var elm$http$Http$maybeSend = F4(
	function (router, desiredTracker, progress, _n0) {
		var actualTracker = _n0.a;
		var toMsg = _n0.b;
		return _Utils_eq(desiredTracker, actualTracker) ? elm$core$Maybe$Just(
			A2(
				elm$core$Platform$sendToApp,
				router,
				toMsg(progress))) : elm$core$Maybe$Nothing;
	});
var elm$http$Http$onSelfMsg = F3(
	function (router, _n0, state) {
		var tracker = _n0.a;
		var progress = _n0.b;
		return A2(
			elm$core$Task$andThen,
			function (_n1) {
				return elm$core$Task$succeed(state);
			},
			elm$core$Task$sequence(
				A2(
					elm$core$List$filterMap,
					A3(elm$http$Http$maybeSend, router, tracker, progress),
					state.subs)));
	});
var elm$http$Http$Cancel = function (a) {
	return {$: 'Cancel', a: a};
};
var elm$http$Http$cmdMap = F2(
	function (func, cmd) {
		if (cmd.$ === 'Cancel') {
			var tracker = cmd.a;
			return elm$http$Http$Cancel(tracker);
		} else {
			var r = cmd.a;
			return elm$http$Http$Request(
				{
					allowCookiesFromOtherDomains: r.allowCookiesFromOtherDomains,
					body: r.body,
					expect: A2(_Http_mapExpect, func, r.expect),
					headers: r.headers,
					method: r.method,
					timeout: r.timeout,
					tracker: r.tracker,
					url: r.url
				});
		}
	});
var elm$http$Http$MySub = F2(
	function (a, b) {
		return {$: 'MySub', a: a, b: b};
	});
var elm$http$Http$subMap = F2(
	function (func, _n0) {
		var tracker = _n0.a;
		var toMsg = _n0.b;
		return A2(
			elm$http$Http$MySub,
			tracker,
			A2(elm$core$Basics$composeR, toMsg, func));
	});
_Platform_effectManagers['Http'] = _Platform_createManager(elm$http$Http$init, elm$http$Http$onEffects, elm$http$Http$onSelfMsg, elm$http$Http$cmdMap, elm$http$Http$subMap);
var elm$http$Http$command = _Platform_leaf('Http');
var elm$http$Http$subscription = _Platform_leaf('Http');
var elm$http$Http$request = function (r) {
	return elm$http$Http$command(
		elm$http$Http$Request(
			{allowCookiesFromOtherDomains: false, body: r.body, expect: r.expect, headers: r.headers, method: r.method, timeout: r.timeout, tracker: r.tracker, url: r.url}));
};
var elm$http$Http$get = function (r) {
	return elm$http$Http$request(
		{body: elm$http$Http$emptyBody, expect: r.expect, headers: _List_Nil, method: 'GET', timeout: elm$core$Maybe$Nothing, tracker: elm$core$Maybe$Nothing, url: r.url});
};
var author$project$Router$update = F2(
	function (model, msg) {
		update:
		while (true) {
			switch (msg.$) {
				case 'UrlChanged':
					var url = msg.a;
					var route = author$project$Routes$fromUrl(url);
					if (route.$ === 'Post') {
						var fileName = route.a;
						var emuSrc = author$project$Routes$toEmuUrl(fileName);
						var $temp$model = model,
							$temp$msg = A2(author$project$Router$HttpRequest, fileName, emuSrc);
						model = $temp$model;
						msg = $temp$msg;
						continue update;
					} else {
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{route: route}),
							elm$core$Platform$Cmd$none);
					}
				case 'NavigateTo':
					var route = msg.a;
					var url = author$project$Routes$toUrlString(route);
					return _Utils_Tuple2(
						model,
						A2(elm$browser$Browser$Navigation$pushUrl, model.navKey, url));
				case 'HttpRequest':
					var fileName = msg.a;
					var emuSrc = msg.b;
					return _Utils_Tuple2(
						model,
						elm$http$Http$get(
							{
								expect: elm$http$Http$expectString(
									author$project$Router$GotSrc(fileName)),
								url: emuSrc
							}));
				default:
					var fileName = msg.a;
					var result = msg.b;
					if (result.$ === 'Ok') {
						var markdown = result.a;
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{
									blogSource: elm$core$Maybe$Just(markdown),
									route: author$project$Routes$Post(fileName)
								}),
							elm$core$Platform$Cmd$none);
					} else {
						var err = result.a;
						var _n3 = A2(elm$core$Debug$log, 'err', err);
						return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
					}
			}
		}
	});
var elm$core$Platform$Cmd$map = _Platform_map;
var author$project$Update$updateRouter = F2(
	function (model, routerMsg) {
		var _n0 = A2(author$project$Router$update, model.router, routerMsg);
		var routerModel = _n0.a;
		var routerCmd = _n0.b;
		return _Utils_Tuple2(
			_Utils_update(
				model,
				{router: routerModel}),
			A2(elm$core$Platform$Cmd$map, author$project$Model$RouterMsg, routerCmd));
	});
var elm$browser$Browser$Navigation$load = _Browser_load;
var author$project$Update$update = F2(
	function (msg, model) {
		update:
		while (true) {
			switch (msg.$) {
				case 'NavigateTo':
					var route = msg.a;
					return A2(
						author$project$Update$updateRouter,
						model,
						author$project$Router$NavigateTo(route));
				case 'UrlChange':
					var url = msg.a;
					return A2(
						author$project$Update$updateRouter,
						model,
						author$project$Router$UrlChanged(url));
				case 'UrlRequest':
					var urlRequest = msg.a;
					if (urlRequest.$ === 'Internal') {
						var url = urlRequest.a;
						var $temp$msg = A2(
							elm$core$Debug$log,
							'internal url',
							author$project$Model$NavigateTo(
								author$project$Routes$fromUrl(url))),
							$temp$model = model;
						msg = $temp$msg;
						model = $temp$model;
						continue update;
					} else {
						var url = urlRequest.a;
						return _Utils_Tuple2(
							model,
							A2(
								elm$core$Debug$log,
								'external url',
								elm$browser$Browser$Navigation$load(url)));
					}
				case 'RouterMsg':
					var routerMsg = msg.a;
					return A2(author$project$Update$updateRouter, model, routerMsg);
				default:
					var windowSize = msg.a;
					return _Utils_Tuple2(
						_Utils_update(
							model,
							{
								device: A2(
									elm$core$Debug$log,
									'Device',
									mdgriffith$elm_ui$Element$classifyDevice(windowSize))
							}),
						elm$core$Platform$Cmd$none);
			}
		}
	});
var author$project$View$tabBarTitle = function (model) {
	var _n0 = model.router.route;
	switch (_n0.$) {
		case 'Home':
			return 'Joshua\'s Website';
		case 'Resume':
			return 'Resume';
		case 'Projects':
			return 'Projects';
		case 'Post':
			var fileName = _n0.a;
			return 'Post ' + fileName;
		default:
			return 'Oops';
	}
};
var author$project$View$focusStyle = {backgroundColor: elm$core$Maybe$Nothing, borderColor: elm$core$Maybe$Nothing, shadow: elm$core$Maybe$Nothing};
var mdgriffith$elm_ui$Internal$Model$ImportFont = F2(
	function (a, b) {
		return {$: 'ImportFont', a: a, b: b};
	});
var mdgriffith$elm_ui$Element$Font$external = function (_n0) {
	var url = _n0.url;
	var name = _n0.name;
	return A2(mdgriffith$elm_ui$Internal$Model$ImportFont, name, url);
};
var elm$core$Bitwise$shiftLeftBy = _Bitwise_shiftLeftBy;
var mdgriffith$elm_ui$Internal$Flag$Flag = function (a) {
	return {$: 'Flag', a: a};
};
var mdgriffith$elm_ui$Internal$Flag$Second = function (a) {
	return {$: 'Second', a: a};
};
var mdgriffith$elm_ui$Internal$Flag$flag = function (i) {
	return (i > 31) ? mdgriffith$elm_ui$Internal$Flag$Second(1 << (i - 32)) : mdgriffith$elm_ui$Internal$Flag$Flag(1 << i);
};
var mdgriffith$elm_ui$Internal$Flag$fontFamily = mdgriffith$elm_ui$Internal$Flag$flag(5);
var mdgriffith$elm_ui$Internal$Model$FontFamily = F2(
	function (a, b) {
		return {$: 'FontFamily', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Model$StyleClass = F2(
	function (a, b) {
		return {$: 'StyleClass', a: a, b: b};
	});
var elm$core$String$toLower = _String_toLower;
var elm$core$String$words = _String_words;
var mdgriffith$elm_ui$Internal$Model$renderFontClassName = F2(
	function (font, current) {
		return _Utils_ap(
			current,
			function () {
				switch (font.$) {
					case 'Serif':
						return 'serif';
					case 'SansSerif':
						return 'sans-serif';
					case 'Monospace':
						return 'monospace';
					case 'Typeface':
						var name = font.a;
						return A2(
							elm$core$String$join,
							'-',
							elm$core$String$words(
								elm$core$String$toLower(name)));
					case 'ImportFont':
						var name = font.a;
						var url = font.b;
						return A2(
							elm$core$String$join,
							'-',
							elm$core$String$words(
								elm$core$String$toLower(name)));
					default:
						var name = font.a.name;
						return A2(
							elm$core$String$join,
							'-',
							elm$core$String$words(
								elm$core$String$toLower(name)));
				}
			}());
	});
var mdgriffith$elm_ui$Element$Font$family = function (families) {
	return A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$fontFamily,
		A2(
			mdgriffith$elm_ui$Internal$Model$FontFamily,
			A3(elm$core$List$foldl, mdgriffith$elm_ui$Internal$Model$renderFontClassName, 'ff-', families),
			families));
};
var mdgriffith$elm_ui$Internal$Model$SansSerif = {$: 'SansSerif'};
var mdgriffith$elm_ui$Element$Font$sansSerif = mdgriffith$elm_ui$Internal$Model$SansSerif;
var author$project$Text$body = mdgriffith$elm_ui$Element$Font$family(
	_List_fromArray(
		[
			mdgriffith$elm_ui$Element$Font$external(
			{name: 'Open Sans', url: 'https://fonts.googleapis.com/css?family=Open+Sans:300'}),
			mdgriffith$elm_ui$Element$Font$sansSerif
		]));
var author$project$View$Home$Big = {$: 'Big'};
var author$project$View$Home$Small = {$: 'Small'};
var mdgriffith$elm_ui$Internal$Model$Fill = function (a) {
	return {$: 'Fill', a: a};
};
var mdgriffith$elm_ui$Element$fill = mdgriffith$elm_ui$Internal$Model$Fill(1);
var mdgriffith$elm_ui$Internal$Flag$spacing = mdgriffith$elm_ui$Internal$Flag$flag(3);
var mdgriffith$elm_ui$Internal$Model$SpacingStyle = F3(
	function (a, b, c) {
		return {$: 'SpacingStyle', a: a, b: b, c: c};
	});
var mdgriffith$elm_ui$Internal$Model$spacingName = F2(
	function (x, y) {
		return 'spacing-' + (elm$core$String$fromInt(x) + ('-' + elm$core$String$fromInt(y)));
	});
var mdgriffith$elm_ui$Element$spacing = function (x) {
	return A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$spacing,
		A3(
			mdgriffith$elm_ui$Internal$Model$SpacingStyle,
			A2(mdgriffith$elm_ui$Internal$Model$spacingName, x, x),
			x,
			x));
};
var mdgriffith$elm_ui$Internal$Model$Width = function (a) {
	return {$: 'Width', a: a};
};
var mdgriffith$elm_ui$Element$width = mdgriffith$elm_ui$Internal$Model$Width;
var mdgriffith$elm_ui$Internal$Model$Describe = function (a) {
	return {$: 'Describe', a: a};
};
var mdgriffith$elm_ui$Internal$Model$Paragraph = {$: 'Paragraph'};
var mdgriffith$elm_ui$Internal$Model$Unkeyed = function (a) {
	return {$: 'Unkeyed', a: a};
};
var mdgriffith$elm_ui$Internal$Model$AsParagraph = {$: 'AsParagraph'};
var mdgriffith$elm_ui$Internal$Model$asParagraph = mdgriffith$elm_ui$Internal$Model$AsParagraph;
var mdgriffith$elm_ui$Internal$Model$Generic = {$: 'Generic'};
var mdgriffith$elm_ui$Internal$Model$div = mdgriffith$elm_ui$Internal$Model$Generic;
var mdgriffith$elm_ui$Internal$Flag$Field = F2(
	function (a, b) {
		return {$: 'Field', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Flag$none = A2(mdgriffith$elm_ui$Internal$Flag$Field, 0, 0);
var mdgriffith$elm_ui$Internal$Model$NoNearbyChildren = {$: 'NoNearbyChildren'};
var mdgriffith$elm_ui$Internal$Style$classes = {above: 'a', active: 'atv', alignBottom: 'ab', alignCenterX: 'cx', alignCenterY: 'cy', alignContainerBottom: 'acb', alignContainerCenterX: 'accx', alignContainerCenterY: 'accy', alignContainerRight: 'acr', alignLeft: 'al', alignRight: 'ar', alignTop: 'at', alignedHorizontally: 'ah', alignedVertically: 'av', any: 's', behind: 'bh', below: 'b', bold: 'w7', borderDashed: 'bd', borderDotted: 'bdt', borderNone: 'bn', borderSolid: 'bs', capturePointerEvents: 'cpe', clip: 'cp', clipX: 'cpx', clipY: 'cpy', column: 'c', container: 'ctr', contentBottom: 'cb', contentCenterX: 'ccx', contentCenterY: 'ccy', contentLeft: 'cl', contentRight: 'cr', contentTop: 'ct', cursorPointer: 'cptr', cursorText: 'ctxt', focus: 'fcs', fullSize: 'fs', grid: 'g', hasBehind: 'hbh', heightContent: 'hc', heightFill: 'hf', heightFillPortion: 'hfp', hover: 'hv', imageContainer: 'ic', inFront: 'fr', inputMultiline: 'iml', inputText: 'it', italic: 'i', nearby: 'nb', noTextSelection: 'notxt', onLeft: 'ol', onRight: 'or', opaque: 'oq', overflowHidden: 'oh', page: 'pg', paragraph: 'p', passPointerEvents: 'ppe', root: 'ui', row: 'r', scrollbars: 'sb', scrollbarsX: 'sbx', scrollbarsY: 'sby', seButton: 'sbt', single: 'e', sizeByCapital: 'cap', spaceEvenly: 'sev', strike: 'sk', text: 't', textCenter: 'tc', textExtraBold: 'w8', textExtraLight: 'w2', textHeavy: 'w9', textJustify: 'tj', textJustifyAll: 'tja', textLeft: 'tl', textLight: 'w3', textMedium: 'w5', textNormalWeight: 'w4', textRight: 'tr', textSemiBold: 'w6', textThin: 'w1', textUnitalicized: 'tun', transition: 'ts', transparent: 'clr', underline: 'u', widthContent: 'wc', widthExact: 'we', widthFill: 'wf', widthFillPortion: 'wfp', wrapped: 'wrp'};
var mdgriffith$elm_ui$Internal$Model$columnClass = mdgriffith$elm_ui$Internal$Style$classes.any + (' ' + mdgriffith$elm_ui$Internal$Style$classes.column);
var mdgriffith$elm_ui$Internal$Model$gridClass = mdgriffith$elm_ui$Internal$Style$classes.any + (' ' + mdgriffith$elm_ui$Internal$Style$classes.grid);
var mdgriffith$elm_ui$Internal$Model$pageClass = mdgriffith$elm_ui$Internal$Style$classes.any + (' ' + mdgriffith$elm_ui$Internal$Style$classes.page);
var mdgriffith$elm_ui$Internal$Model$paragraphClass = mdgriffith$elm_ui$Internal$Style$classes.any + (' ' + mdgriffith$elm_ui$Internal$Style$classes.paragraph);
var mdgriffith$elm_ui$Internal$Model$rowClass = mdgriffith$elm_ui$Internal$Style$classes.any + (' ' + mdgriffith$elm_ui$Internal$Style$classes.row);
var mdgriffith$elm_ui$Internal$Model$singleClass = mdgriffith$elm_ui$Internal$Style$classes.any + (' ' + mdgriffith$elm_ui$Internal$Style$classes.single);
var mdgriffith$elm_ui$Internal$Model$contextClasses = function (context) {
	switch (context.$) {
		case 'AsRow':
			return mdgriffith$elm_ui$Internal$Model$rowClass;
		case 'AsColumn':
			return mdgriffith$elm_ui$Internal$Model$columnClass;
		case 'AsEl':
			return mdgriffith$elm_ui$Internal$Model$singleClass;
		case 'AsGrid':
			return mdgriffith$elm_ui$Internal$Model$gridClass;
		case 'AsParagraph':
			return mdgriffith$elm_ui$Internal$Model$paragraphClass;
		default:
			return mdgriffith$elm_ui$Internal$Model$pageClass;
	}
};
var elm$core$List$isEmpty = function (xs) {
	if (!xs.b) {
		return true;
	} else {
		return false;
	}
};
var mdgriffith$elm_ui$Internal$Model$Keyed = function (a) {
	return {$: 'Keyed', a: a};
};
var mdgriffith$elm_ui$Internal$Model$NoStyleSheet = {$: 'NoStyleSheet'};
var mdgriffith$elm_ui$Internal$Model$Styled = function (a) {
	return {$: 'Styled', a: a};
};
var mdgriffith$elm_ui$Internal$Model$Unstyled = function (a) {
	return {$: 'Unstyled', a: a};
};
var mdgriffith$elm_ui$Internal$Model$addChildren = F2(
	function (existing, nearbyChildren) {
		switch (nearbyChildren.$) {
			case 'NoNearbyChildren':
				return existing;
			case 'ChildrenBehind':
				var behind = nearbyChildren.a;
				return _Utils_ap(behind, existing);
			case 'ChildrenInFront':
				var inFront = nearbyChildren.a;
				return _Utils_ap(existing, inFront);
			default:
				var behind = nearbyChildren.a;
				var inFront = nearbyChildren.b;
				return _Utils_ap(
					behind,
					_Utils_ap(existing, inFront));
		}
	});
var mdgriffith$elm_ui$Internal$Model$addKeyedChildren = F3(
	function (key, existing, nearbyChildren) {
		switch (nearbyChildren.$) {
			case 'NoNearbyChildren':
				return existing;
			case 'ChildrenBehind':
				var behind = nearbyChildren.a;
				return _Utils_ap(
					A2(
						elm$core$List$map,
						function (x) {
							return _Utils_Tuple2(key, x);
						},
						behind),
					existing);
			case 'ChildrenInFront':
				var inFront = nearbyChildren.a;
				return _Utils_ap(
					existing,
					A2(
						elm$core$List$map,
						function (x) {
							return _Utils_Tuple2(key, x);
						},
						inFront));
			default:
				var behind = nearbyChildren.a;
				var inFront = nearbyChildren.b;
				return _Utils_ap(
					A2(
						elm$core$List$map,
						function (x) {
							return _Utils_Tuple2(key, x);
						},
						behind),
					_Utils_ap(
						existing,
						A2(
							elm$core$List$map,
							function (x) {
								return _Utils_Tuple2(key, x);
							},
							inFront)));
		}
	});
var mdgriffith$elm_ui$Internal$Model$AsEl = {$: 'AsEl'};
var mdgriffith$elm_ui$Internal$Model$asEl = mdgriffith$elm_ui$Internal$Model$AsEl;
var elm$core$Basics$not = _Basics_not;
var elm$html$Html$div = _VirtualDom_node('div');
var elm$html$Html$p = _VirtualDom_node('p');
var elm$html$Html$s = _VirtualDom_node('s');
var elm$html$Html$u = _VirtualDom_node('u');
var elm$json$Json$Encode$string = _Json_wrap;
var elm$html$Html$Attributes$stringProperty = F2(
	function (key, string) {
		return A2(
			_VirtualDom_property,
			key,
			elm$json$Json$Encode$string(string));
	});
var elm$html$Html$Attributes$class = elm$html$Html$Attributes$stringProperty('className');
var elm$virtual_dom$VirtualDom$keyedNode = function (tag) {
	return _VirtualDom_keyedNode(
		_VirtualDom_noScript(tag));
};
var elm$virtual_dom$VirtualDom$node = function (tag) {
	return _VirtualDom_node(
		_VirtualDom_noScript(tag));
};
var mdgriffith$elm_ui$Internal$Flag$alignBottom = mdgriffith$elm_ui$Internal$Flag$flag(41);
var mdgriffith$elm_ui$Internal$Flag$alignRight = mdgriffith$elm_ui$Internal$Flag$flag(40);
var mdgriffith$elm_ui$Internal$Flag$centerX = mdgriffith$elm_ui$Internal$Flag$flag(42);
var mdgriffith$elm_ui$Internal$Flag$centerY = mdgriffith$elm_ui$Internal$Flag$flag(43);
var mdgriffith$elm_ui$Internal$Flag$heightBetween = mdgriffith$elm_ui$Internal$Flag$flag(45);
var mdgriffith$elm_ui$Internal$Flag$heightFill = mdgriffith$elm_ui$Internal$Flag$flag(37);
var elm$core$Bitwise$and = _Bitwise_and;
var mdgriffith$elm_ui$Internal$Flag$present = F2(
	function (myFlag, _n0) {
		var fieldOne = _n0.a;
		var fieldTwo = _n0.b;
		if (myFlag.$ === 'Flag') {
			var first = myFlag.a;
			return _Utils_eq(first & fieldOne, first);
		} else {
			var second = myFlag.a;
			return _Utils_eq(second & fieldTwo, second);
		}
	});
var mdgriffith$elm_ui$Internal$Flag$widthBetween = mdgriffith$elm_ui$Internal$Flag$flag(44);
var mdgriffith$elm_ui$Internal$Flag$widthFill = mdgriffith$elm_ui$Internal$Flag$flag(39);
var elm$core$Set$Set_elm_builtin = function (a) {
	return {$: 'Set_elm_builtin', a: a};
};
var elm$core$Set$empty = elm$core$Set$Set_elm_builtin(elm$core$Dict$empty);
var elm$core$Tuple$second = function (_n0) {
	var y = _n0.b;
	return y;
};
var elm$core$Set$insert = F2(
	function (key, _n0) {
		var dict = _n0.a;
		return elm$core$Set$Set_elm_builtin(
			A3(elm$core$Dict$insert, key, _Utils_Tuple0, dict));
	});
var elm$core$Dict$member = F2(
	function (key, dict) {
		var _n0 = A2(elm$core$Dict$get, key, dict);
		if (_n0.$ === 'Just') {
			return true;
		} else {
			return false;
		}
	});
var elm$core$Set$member = F2(
	function (key, _n0) {
		var dict = _n0.a;
		return A2(elm$core$Dict$member, key, dict);
	});
var mdgriffith$elm_ui$Internal$Model$lengthClassName = function (x) {
	switch (x.$) {
		case 'Px':
			var px = x.a;
			return elm$core$String$fromInt(px) + 'px';
		case 'Content':
			return 'auto';
		case 'Fill':
			var i = x.a;
			return elm$core$String$fromInt(i) + 'fr';
		case 'Min':
			var min = x.a;
			var len = x.b;
			return 'min' + (elm$core$String$fromInt(min) + mdgriffith$elm_ui$Internal$Model$lengthClassName(len));
		default:
			var max = x.a;
			var len = x.b;
			return 'max' + (elm$core$String$fromInt(max) + mdgriffith$elm_ui$Internal$Model$lengthClassName(len));
	}
};
var elm$core$Basics$round = _Basics_round;
var mdgriffith$elm_ui$Internal$Model$floatClass = function (x) {
	return elm$core$String$fromInt(
		elm$core$Basics$round(x * 255));
};
var mdgriffith$elm_ui$Internal$Model$transformClass = function (transform) {
	switch (transform.$) {
		case 'Untransformed':
			return elm$core$Maybe$Nothing;
		case 'Moved':
			var _n1 = transform.a;
			var x = _n1.a;
			var y = _n1.b;
			var z = _n1.c;
			return elm$core$Maybe$Just(
				'mv-' + (mdgriffith$elm_ui$Internal$Model$floatClass(x) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(y) + ('-' + mdgriffith$elm_ui$Internal$Model$floatClass(z))))));
		default:
			var _n2 = transform.a;
			var tx = _n2.a;
			var ty = _n2.b;
			var tz = _n2.c;
			var _n3 = transform.b;
			var sx = _n3.a;
			var sy = _n3.b;
			var sz = _n3.c;
			var _n4 = transform.c;
			var ox = _n4.a;
			var oy = _n4.b;
			var oz = _n4.c;
			var angle = transform.d;
			return elm$core$Maybe$Just(
				'tfrm-' + (mdgriffith$elm_ui$Internal$Model$floatClass(tx) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(ty) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(tz) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(sx) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(sy) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(sz) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(ox) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(oy) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(oz) + ('-' + mdgriffith$elm_ui$Internal$Model$floatClass(angle))))))))))))))))))));
	}
};
var mdgriffith$elm_ui$Internal$Model$getStyleName = function (style) {
	switch (style.$) {
		case 'Shadows':
			var name = style.a;
			return name;
		case 'Transparency':
			var name = style.a;
			var o = style.b;
			return name;
		case 'Style':
			var _class = style.a;
			return _class;
		case 'FontFamily':
			var name = style.a;
			return name;
		case 'FontSize':
			var i = style.a;
			return 'font-size-' + elm$core$String$fromInt(i);
		case 'Single':
			var _class = style.a;
			return _class;
		case 'Colored':
			var _class = style.a;
			return _class;
		case 'SpacingStyle':
			var cls = style.a;
			var x = style.b;
			var y = style.c;
			return cls;
		case 'PaddingStyle':
			var cls = style.a;
			var top = style.b;
			var right = style.c;
			var bottom = style.d;
			var left = style.e;
			return cls;
		case 'BorderWidth':
			var cls = style.a;
			var top = style.b;
			var right = style.c;
			var bottom = style.d;
			var left = style.e;
			return cls;
		case 'GridTemplateStyle':
			var template = style.a;
			return 'grid-rows-' + (A2(
				elm$core$String$join,
				'-',
				A2(elm$core$List$map, mdgriffith$elm_ui$Internal$Model$lengthClassName, template.rows)) + ('-cols-' + (A2(
				elm$core$String$join,
				'-',
				A2(elm$core$List$map, mdgriffith$elm_ui$Internal$Model$lengthClassName, template.columns)) + ('-space-x-' + (mdgriffith$elm_ui$Internal$Model$lengthClassName(template.spacing.a) + ('-space-y-' + mdgriffith$elm_ui$Internal$Model$lengthClassName(template.spacing.b)))))));
		case 'GridPosition':
			var pos = style.a;
			return 'gp grid-pos-' + (elm$core$String$fromInt(pos.row) + ('-' + (elm$core$String$fromInt(pos.col) + ('-' + (elm$core$String$fromInt(pos.width) + ('-' + elm$core$String$fromInt(pos.height)))))));
		case 'PseudoSelector':
			var selector = style.a;
			var subStyle = style.b;
			var name = function () {
				switch (selector.$) {
					case 'Focus':
						return 'fs';
					case 'Hover':
						return 'hv';
					default:
						return 'act';
				}
			}();
			return A2(
				elm$core$String$join,
				' ',
				A2(
					elm$core$List$map,
					function (sty) {
						var _n1 = mdgriffith$elm_ui$Internal$Model$getStyleName(sty);
						if (_n1 === '') {
							return '';
						} else {
							var styleName = _n1;
							return styleName + ('-' + name);
						}
					},
					subStyle));
		default:
			var x = style.a;
			return A2(
				elm$core$Maybe$withDefault,
				'',
				mdgriffith$elm_ui$Internal$Model$transformClass(x));
	}
};
var mdgriffith$elm_ui$Internal$Model$reduceStyles = F2(
	function (style, nevermind) {
		var cache = nevermind.a;
		var existing = nevermind.b;
		var styleName = mdgriffith$elm_ui$Internal$Model$getStyleName(style);
		return A2(elm$core$Set$member, styleName, cache) ? nevermind : _Utils_Tuple2(
			A2(elm$core$Set$insert, styleName, cache),
			A2(elm$core$List$cons, style, existing));
	});
var elm$core$Maybe$map = F2(
	function (f, maybe) {
		if (maybe.$ === 'Just') {
			var value = maybe.a;
			return elm$core$Maybe$Just(
				f(value));
		} else {
			return elm$core$Maybe$Nothing;
		}
	});
var elm$core$Tuple$mapFirst = F2(
	function (func, _n0) {
		var x = _n0.a;
		var y = _n0.b;
		return _Utils_Tuple2(
			func(x),
			y);
	});
var elm$core$Tuple$mapSecond = F2(
	function (func, _n0) {
		var x = _n0.a;
		var y = _n0.b;
		return _Utils_Tuple2(
			x,
			func(y));
	});
var mdgriffith$elm_ui$Internal$Model$Property = F2(
	function (a, b) {
		return {$: 'Property', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Model$Style = F2(
	function (a, b) {
		return {$: 'Style', a: a, b: b};
	});
var elm$core$String$fromFloat = _String_fromNumber;
var mdgriffith$elm_ui$Internal$Model$formatColor = function (_n0) {
	var red = _n0.a;
	var green = _n0.b;
	var blue = _n0.c;
	var alpha = _n0.d;
	return 'rgba(' + (elm$core$String$fromInt(
		elm$core$Basics$round(red * 255)) + ((',' + elm$core$String$fromInt(
		elm$core$Basics$round(green * 255))) + ((',' + elm$core$String$fromInt(
		elm$core$Basics$round(blue * 255))) + (',' + (elm$core$String$fromFloat(alpha) + ')')))));
};
var mdgriffith$elm_ui$Internal$Model$formatBoxShadow = function (shadow) {
	return A2(
		elm$core$String$join,
		' ',
		A2(
			elm$core$List$filterMap,
			elm$core$Basics$identity,
			_List_fromArray(
				[
					shadow.inset ? elm$core$Maybe$Just('inset') : elm$core$Maybe$Nothing,
					elm$core$Maybe$Just(
					elm$core$String$fromFloat(shadow.offset.a) + 'px'),
					elm$core$Maybe$Just(
					elm$core$String$fromFloat(shadow.offset.b) + 'px'),
					elm$core$Maybe$Just(
					elm$core$String$fromFloat(shadow.blur) + 'px'),
					elm$core$Maybe$Just(
					elm$core$String$fromFloat(shadow.size) + 'px'),
					elm$core$Maybe$Just(
					mdgriffith$elm_ui$Internal$Model$formatColor(shadow.color))
				])));
};
var mdgriffith$elm_ui$Internal$Style$dot = function (c) {
	return '.' + c;
};
var mdgriffith$elm_ui$Internal$Model$renderFocusStyle = function (focus) {
	return A2(
		mdgriffith$elm_ui$Internal$Model$Style,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any) + (':focus .focusable, ' + (mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any) + '.focusable:focus')),
		A2(
			elm$core$List$filterMap,
			elm$core$Basics$identity,
			_List_fromArray(
				[
					A2(
					elm$core$Maybe$map,
					function (color) {
						return A2(
							mdgriffith$elm_ui$Internal$Model$Property,
							'border-color',
							mdgriffith$elm_ui$Internal$Model$formatColor(color));
					},
					focus.borderColor),
					A2(
					elm$core$Maybe$map,
					function (color) {
						return A2(
							mdgriffith$elm_ui$Internal$Model$Property,
							'background-color',
							mdgriffith$elm_ui$Internal$Model$formatColor(color));
					},
					focus.backgroundColor),
					A2(
					elm$core$Maybe$map,
					function (shadow) {
						return A2(
							mdgriffith$elm_ui$Internal$Model$Property,
							'box-shadow',
							mdgriffith$elm_ui$Internal$Model$formatBoxShadow(
								{
									blur: shadow.blur,
									color: shadow.color,
									inset: false,
									offset: A2(
										elm$core$Tuple$mapSecond,
										elm$core$Basics$toFloat,
										A2(elm$core$Tuple$mapFirst, elm$core$Basics$toFloat, shadow.offset)),
									size: shadow.size
								}));
					},
					focus.shadow),
					elm$core$Maybe$Just(
					A2(mdgriffith$elm_ui$Internal$Model$Property, 'outline', 'none'))
				])));
};
var elm$virtual_dom$VirtualDom$text = _VirtualDom_text;
var mdgriffith$elm_ui$Internal$Style$Batch = function (a) {
	return {$: 'Batch', a: a};
};
var mdgriffith$elm_ui$Internal$Style$Child = F2(
	function (a, b) {
		return {$: 'Child', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Style$Class = F2(
	function (a, b) {
		return {$: 'Class', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Style$Descriptor = F2(
	function (a, b) {
		return {$: 'Descriptor', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Style$Left = {$: 'Left'};
var mdgriffith$elm_ui$Internal$Style$Prop = F2(
	function (a, b) {
		return {$: 'Prop', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Style$Right = {$: 'Right'};
var mdgriffith$elm_ui$Internal$Style$Self = function (a) {
	return {$: 'Self', a: a};
};
var mdgriffith$elm_ui$Internal$Style$Supports = F2(
	function (a, b) {
		return {$: 'Supports', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Style$Content = function (a) {
	return {$: 'Content', a: a};
};
var mdgriffith$elm_ui$Internal$Style$Bottom = {$: 'Bottom'};
var mdgriffith$elm_ui$Internal$Style$CenterX = {$: 'CenterX'};
var mdgriffith$elm_ui$Internal$Style$CenterY = {$: 'CenterY'};
var mdgriffith$elm_ui$Internal$Style$Top = {$: 'Top'};
var mdgriffith$elm_ui$Internal$Style$alignments = _List_fromArray(
	[mdgriffith$elm_ui$Internal$Style$Top, mdgriffith$elm_ui$Internal$Style$Bottom, mdgriffith$elm_ui$Internal$Style$Right, mdgriffith$elm_ui$Internal$Style$Left, mdgriffith$elm_ui$Internal$Style$CenterX, mdgriffith$elm_ui$Internal$Style$CenterY]);
var mdgriffith$elm_ui$Internal$Style$contentName = function (desc) {
	switch (desc.a.$) {
		case 'Top':
			var _n1 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.contentTop);
		case 'Bottom':
			var _n2 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.contentBottom);
		case 'Right':
			var _n3 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.contentRight);
		case 'Left':
			var _n4 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.contentLeft);
		case 'CenterX':
			var _n5 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.contentCenterX);
		default:
			var _n6 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.contentCenterY);
	}
};
var mdgriffith$elm_ui$Internal$Style$selfName = function (desc) {
	switch (desc.a.$) {
		case 'Top':
			var _n1 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignTop);
		case 'Bottom':
			var _n2 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignBottom);
		case 'Right':
			var _n3 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignRight);
		case 'Left':
			var _n4 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignLeft);
		case 'CenterX':
			var _n5 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignCenterX);
		default:
			var _n6 = desc.a;
			return mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignCenterY);
	}
};
var mdgriffith$elm_ui$Internal$Style$describeAlignment = function (values) {
	var createDescription = function (alignment) {
		var _n0 = values(alignment);
		var content = _n0.a;
		var indiv = _n0.b;
		return _List_fromArray(
			[
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$contentName(
					mdgriffith$elm_ui$Internal$Style$Content(alignment)),
				content),
				A2(
				mdgriffith$elm_ui$Internal$Style$Child,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any),
				_List_fromArray(
					[
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$selfName(
							mdgriffith$elm_ui$Internal$Style$Self(alignment)),
						indiv)
					]))
			]);
	};
	return mdgriffith$elm_ui$Internal$Style$Batch(
		A2(elm$core$List$concatMap, createDescription, mdgriffith$elm_ui$Internal$Style$alignments));
};
var mdgriffith$elm_ui$Internal$Style$elDescription = _List_fromArray(
	[
		A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex'),
		A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-direction', 'column'),
		A2(mdgriffith$elm_ui$Internal$Style$Prop, 'white-space', 'pre'),
		A2(
		mdgriffith$elm_ui$Internal$Style$Descriptor,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.hasBehind),
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '0'),
				A2(
				mdgriffith$elm_ui$Internal$Style$Child,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.behind),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '-1')
					]))
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Descriptor,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.seButton),
		_List_fromArray(
			[
				A2(
				mdgriffith$elm_ui$Internal$Style$Child,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.text),
				_List_fromArray(
					[
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightFill),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '0')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthFill),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'auto !important')
							]))
					]))
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Child,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightContent),
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', 'auto')
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Child,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightFill),
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '100000')
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Child,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthFill),
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%')
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Child,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthContent),
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'flex-start')
			])),
		mdgriffith$elm_ui$Internal$Style$describeAlignment(
		function (alignment) {
			switch (alignment.$) {
				case 'Top':
					return _Utils_Tuple2(
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'flex-start')
							]),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-bottom', 'auto !important'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-top', '0 !important')
							]));
				case 'Bottom':
					return _Utils_Tuple2(
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'flex-end')
							]),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-top', 'auto !important'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-bottom', '0 !important')
							]));
				case 'Right':
					return _Utils_Tuple2(
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'flex-end')
							]),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'flex-end')
							]));
				case 'Left':
					return _Utils_Tuple2(
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'flex-start')
							]),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'flex-start')
							]));
				case 'CenterX':
					return _Utils_Tuple2(
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'center')
							]),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'center')
							]));
				default:
					return _Utils_Tuple2(
						_List_fromArray(
							[
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-top', 'auto'),
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-bottom', 'auto')
									]))
							]),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-top', 'auto !important'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-bottom', 'auto !important')
							]));
			}
		})
	]);
var mdgriffith$elm_ui$Internal$Style$gridAlignments = function (values) {
	var createDescription = function (alignment) {
		return _List_fromArray(
			[
				A2(
				mdgriffith$elm_ui$Internal$Style$Child,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any),
				_List_fromArray(
					[
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$selfName(
							mdgriffith$elm_ui$Internal$Style$Self(alignment)),
						values(alignment))
					]))
			]);
	};
	return mdgriffith$elm_ui$Internal$Style$Batch(
		A2(elm$core$List$concatMap, createDescription, mdgriffith$elm_ui$Internal$Style$alignments));
};
var mdgriffith$elm_ui$Internal$Style$Above = {$: 'Above'};
var mdgriffith$elm_ui$Internal$Style$Behind = {$: 'Behind'};
var mdgriffith$elm_ui$Internal$Style$Below = {$: 'Below'};
var mdgriffith$elm_ui$Internal$Style$OnLeft = {$: 'OnLeft'};
var mdgriffith$elm_ui$Internal$Style$OnRight = {$: 'OnRight'};
var mdgriffith$elm_ui$Internal$Style$Within = {$: 'Within'};
var mdgriffith$elm_ui$Internal$Style$locations = function () {
	var loc = mdgriffith$elm_ui$Internal$Style$Above;
	var _n0 = function () {
		switch (loc.$) {
			case 'Above':
				return _Utils_Tuple0;
			case 'Below':
				return _Utils_Tuple0;
			case 'OnRight':
				return _Utils_Tuple0;
			case 'OnLeft':
				return _Utils_Tuple0;
			case 'Within':
				return _Utils_Tuple0;
			default:
				return _Utils_Tuple0;
		}
	}();
	return _List_fromArray(
		[mdgriffith$elm_ui$Internal$Style$Above, mdgriffith$elm_ui$Internal$Style$Below, mdgriffith$elm_ui$Internal$Style$OnRight, mdgriffith$elm_ui$Internal$Style$OnLeft, mdgriffith$elm_ui$Internal$Style$Within, mdgriffith$elm_ui$Internal$Style$Behind]);
}();
var mdgriffith$elm_ui$Internal$Style$baseSheet = _List_fromArray(
	[
		A2(
		mdgriffith$elm_ui$Internal$Style$Class,
		'html,body',
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', '100%'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'padding', '0'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0')
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Class,
		_Utils_ap(
			mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any),
			_Utils_ap(
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.single),
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.imageContainer))),
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'block')
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Class,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any) + ':focus',
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'outline', 'none')
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Class,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.root),
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', 'auto'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'min-height', '100%'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '0'),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				_Utils_ap(
					mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any),
					mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightFill)),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', '100%'),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightFill),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', '100%')
							]))
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Child,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.inFront),
				_List_fromArray(
					[
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.nearby),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'fixed')
							]))
					]))
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Class,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.nearby),
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'relative'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'border', 'none'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-direction', 'row'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-basis', 'auto'),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.single),
				mdgriffith$elm_ui$Internal$Style$elDescription),
				mdgriffith$elm_ui$Internal$Style$Batch(
				function (fn) {
					return A2(elm$core$List$map, fn, mdgriffith$elm_ui$Internal$Style$locations);
				}(
					function (loc) {
						switch (loc.$) {
							case 'Above':
								return A2(
									mdgriffith$elm_ui$Internal$Style$Descriptor,
									mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.above),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'absolute'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'bottom', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'left', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '20'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0 !important'),
											A2(
											mdgriffith$elm_ui$Internal$Style$Child,
											mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightFill),
											_List_fromArray(
												[
													A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', 'auto')
												])),
											A2(
											mdgriffith$elm_ui$Internal$Style$Child,
											mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthFill),
											_List_fromArray(
												[
													A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%')
												])),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'none'),
											A2(
											mdgriffith$elm_ui$Internal$Style$Child,
											'*',
											_List_fromArray(
												[
													A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'auto')
												]))
										]));
							case 'Below':
								return A2(
									mdgriffith$elm_ui$Internal$Style$Descriptor,
									mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.below),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'absolute'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'bottom', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'left', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '20'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0 !important'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'none'),
											A2(
											mdgriffith$elm_ui$Internal$Style$Child,
											'*',
											_List_fromArray(
												[
													A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'auto')
												])),
											A2(
											mdgriffith$elm_ui$Internal$Style$Child,
											mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightFill),
											_List_fromArray(
												[
													A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', 'auto')
												]))
										]));
							case 'OnRight':
								return A2(
									mdgriffith$elm_ui$Internal$Style$Descriptor,
									mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.onRight),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'absolute'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'left', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'top', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0 !important'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '20'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'none'),
											A2(
											mdgriffith$elm_ui$Internal$Style$Child,
											'*',
											_List_fromArray(
												[
													A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'auto')
												]))
										]));
							case 'OnLeft':
								return A2(
									mdgriffith$elm_ui$Internal$Style$Descriptor,
									mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.onLeft),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'absolute'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'right', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'top', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0 !important'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '20'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'none'),
											A2(
											mdgriffith$elm_ui$Internal$Style$Child,
											'*',
											_List_fromArray(
												[
													A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'auto')
												]))
										]));
							case 'Within':
								return A2(
									mdgriffith$elm_ui$Internal$Style$Descriptor,
									mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.inFront),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'absolute'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'left', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'top', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0 !important'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'none'),
											A2(
											mdgriffith$elm_ui$Internal$Style$Child,
											'*',
											_List_fromArray(
												[
													A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'auto')
												]))
										]));
							default:
								return A2(
									mdgriffith$elm_ui$Internal$Style$Descriptor,
									mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.behind),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'absolute'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', '100%'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'left', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'top', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0 !important'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '0'),
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'none'),
											A2(
											mdgriffith$elm_ui$Internal$Style$Child,
											'*',
											_List_fromArray(
												[
													A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'auto')
												]))
										]));
						}
					}))
			])),
		A2(
		mdgriffith$elm_ui$Internal$Style$Class,
		mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any),
		_List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'relative'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'border', 'none'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-shrink', '0'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-direction', 'row'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-basis', 'auto'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'resize', 'none'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-feature-settings', 'inherit'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'box-sizing', 'border-box'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'padding', '0'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'border-width', '0'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'border-style', 'solid'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-size', 'inherit'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'color', 'inherit'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-family', 'inherit'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'line-height', '1'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', 'inherit'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-decoration', 'none'),
				A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-style', 'inherit'),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.wrapped),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-wrap', 'wrap')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.noTextSelection),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, '-moz-user-select', 'none'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, '-webkit-user-select', 'none'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, '-ms-user-select', 'none'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'user-select', 'none')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.cursorPointer),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'cursor', 'pointer')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.cursorText),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'cursor', 'text')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.passPointerEvents),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'none !important')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.capturePointerEvents),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'auto !important')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.transparent),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'opacity', '0')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.opaque),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'opacity', '1')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(
					_Utils_ap(mdgriffith$elm_ui$Internal$Style$classes.hover, mdgriffith$elm_ui$Internal$Style$classes.transparent)) + ':hover',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'opacity', '0')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(
					_Utils_ap(mdgriffith$elm_ui$Internal$Style$classes.hover, mdgriffith$elm_ui$Internal$Style$classes.opaque)) + ':hover',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'opacity', '1')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(
					_Utils_ap(mdgriffith$elm_ui$Internal$Style$classes.focus, mdgriffith$elm_ui$Internal$Style$classes.transparent)) + ':focus',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'opacity', '0')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(
					_Utils_ap(mdgriffith$elm_ui$Internal$Style$classes.focus, mdgriffith$elm_ui$Internal$Style$classes.opaque)) + ':focus',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'opacity', '1')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(
					_Utils_ap(mdgriffith$elm_ui$Internal$Style$classes.active, mdgriffith$elm_ui$Internal$Style$classes.transparent)) + ':active',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'opacity', '0')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(
					_Utils_ap(mdgriffith$elm_ui$Internal$Style$classes.active, mdgriffith$elm_ui$Internal$Style$classes.opaque)) + ':active',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'opacity', '1')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.transition),
				_List_fromArray(
					[
						A2(
						mdgriffith$elm_ui$Internal$Style$Prop,
						'transition',
						A2(
							elm$core$String$join,
							', ',
							A2(
								elm$core$List$map,
								function (x) {
									return x + ' 160ms';
								},
								_List_fromArray(
									['transform', 'opacity', 'filter', 'background-color', 'color', 'font-size']))))
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.scrollbars),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'overflow', 'auto'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-shrink', '1')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.scrollbarsX),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'overflow-x', 'auto'),
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.row),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-shrink', '1')
							]))
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.scrollbarsY),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'overflow-y', 'auto'),
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.column),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-shrink', '1')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.single),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-shrink', '1')
							]))
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.clip),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'overflow', 'hidden')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.clipX),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'overflow-x', 'hidden')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.clipY),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'overflow-y', 'hidden')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthContent),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', 'auto')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.borderNone),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'border-width', '0')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.borderDashed),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'border-style', 'dashed')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.borderDotted),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'border-style', 'dotted')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.borderSolid),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'border-style', 'solid')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.text),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'white-space', 'pre'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'inline-block')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.inputText),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'line-height', '1.05')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.single),
				mdgriffith$elm_ui$Internal$Style$elDescription),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.row),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-direction', 'row'),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-basis', '0%'),
								A2(
								mdgriffith$elm_ui$Internal$Style$Descriptor,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthExact),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-basis', 'auto')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightFill),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'stretch !important')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightFillPortion),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'stretch !important')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthFill),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '100000')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.container),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '0'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-basis', 'auto'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'stretch')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						'u:first-of-type.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerRight,
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '1')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						's:first-of-type.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterX,
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '1'),
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignCenterX),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-left', 'auto !important')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						's:last-of-type.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterX,
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '1'),
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignCenterX),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-right', 'auto !important')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						's:only-of-type.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterX,
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '1'),
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignCenterY),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-top', 'auto !important'),
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-bottom', 'auto !important')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						's:last-of-type.' + (mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterX + ' ~ u'),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '0')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						'u:first-of-type.' + (mdgriffith$elm_ui$Internal$Style$classes.alignContainerRight + (' ~ s.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterX)),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '0')
							])),
						mdgriffith$elm_ui$Internal$Style$describeAlignment(
						function (alignment) {
							switch (alignment.$) {
								case 'Top':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'flex-start')
											]),
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'flex-start')
											]));
								case 'Bottom':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'flex-end')
											]),
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'flex-end')
											]));
								case 'Right':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'flex-end')
											]),
										_List_Nil);
								case 'Left':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'flex-start')
											]),
										_List_Nil);
								case 'CenterX':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'center')
											]),
										_List_Nil);
								default:
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'center')
											]),
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'center')
											]));
							}
						}),
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.spaceEvenly),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'space-between')
							]))
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.column),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-direction', 'column'),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.heightFill),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '100000')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthFill),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthFillPortion),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.widthContent),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'flex-start')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						'u:first-of-type.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerBottom,
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '1')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						's:first-of-type.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterY,
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '1'),
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignCenterY),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-top', 'auto !important'),
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-bottom', '0 !important')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						's:last-of-type.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterY,
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '1'),
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignCenterY),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-bottom', 'auto !important'),
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-top', '0 !important')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						's:only-of-type.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterY,
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '1'),
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.alignCenterY),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-top', 'auto !important'),
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-bottom', 'auto !important')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						's:last-of-type.' + (mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterY + ' ~ u'),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '0')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						'u:first-of-type.' + (mdgriffith$elm_ui$Internal$Style$classes.alignContainerBottom + (' ~ s.' + mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterY)),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '0')
							])),
						mdgriffith$elm_ui$Internal$Style$describeAlignment(
						function (alignment) {
							switch (alignment.$) {
								case 'Top':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'flex-start')
											]),
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-bottom', 'auto')
											]));
								case 'Bottom':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'flex-end')
											]),
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin-top', 'auto')
											]));
								case 'Right':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'flex-end')
											]),
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'flex-end')
											]));
								case 'Left':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'flex-start')
											]),
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'flex-start')
											]));
								case 'CenterX':
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'center')
											]),
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'center')
											]));
								default:
									return _Utils_Tuple2(
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'center')
											]),
										_List_Nil);
							}
						}),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.container),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-grow', '0'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'flex-basis', 'auto'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-self', 'stretch !important')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.spaceEvenly),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'space-between')
							]))
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.grid),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', '-ms-grid'),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						'.gp',
						_List_fromArray(
							[
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Supports,
						_Utils_Tuple2('display', 'grid'),
						_List_fromArray(
							[
								_Utils_Tuple2('display', 'grid')
							])),
						mdgriffith$elm_ui$Internal$Style$gridAlignments(
						function (alignment) {
							switch (alignment.$) {
								case 'Top':
									return _List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'flex-start')
										]);
								case 'Bottom':
									return _List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'flex-end')
										]);
								case 'Right':
									return _List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'flex-end')
										]);
								case 'Left':
									return _List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'flex-start')
										]);
								case 'CenterX':
									return _List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'align-items', 'center')
										]);
								default:
									return _List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Style$Prop, 'justify-content', 'center')
										]);
							}
						})
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.page),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'block'),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any + ':first-child'),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0 !important')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(
							mdgriffith$elm_ui$Internal$Style$classes.any + (mdgriffith$elm_ui$Internal$Style$selfName(
								mdgriffith$elm_ui$Internal$Style$Self(mdgriffith$elm_ui$Internal$Style$Left)) + (':first-child + .' + mdgriffith$elm_ui$Internal$Style$classes.any))),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0 !important')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(
							mdgriffith$elm_ui$Internal$Style$classes.any + (mdgriffith$elm_ui$Internal$Style$selfName(
								mdgriffith$elm_ui$Internal$Style$Self(mdgriffith$elm_ui$Internal$Style$Right)) + (':first-child + .' + mdgriffith$elm_ui$Internal$Style$classes.any))),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'margin', '0 !important')
							])),
						mdgriffith$elm_ui$Internal$Style$describeAlignment(
						function (alignment) {
							switch (alignment.$) {
								case 'Top':
									return _Utils_Tuple2(_List_Nil, _List_Nil);
								case 'Bottom':
									return _Utils_Tuple2(_List_Nil, _List_Nil);
								case 'Right':
									return _Utils_Tuple2(
										_List_Nil,
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'float', 'right'),
												A2(
												mdgriffith$elm_ui$Internal$Style$Descriptor,
												'::after',
												_List_fromArray(
													[
														A2(mdgriffith$elm_ui$Internal$Style$Prop, 'content', '\"\"'),
														A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'table'),
														A2(mdgriffith$elm_ui$Internal$Style$Prop, 'clear', 'both')
													]))
											]));
								case 'Left':
									return _Utils_Tuple2(
										_List_Nil,
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'float', 'left'),
												A2(
												mdgriffith$elm_ui$Internal$Style$Descriptor,
												'::after',
												_List_fromArray(
													[
														A2(mdgriffith$elm_ui$Internal$Style$Prop, 'content', '\"\"'),
														A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'table'),
														A2(mdgriffith$elm_ui$Internal$Style$Prop, 'clear', 'both')
													]))
											]));
								case 'CenterX':
									return _Utils_Tuple2(_List_Nil, _List_Nil);
								default:
									return _Utils_Tuple2(_List_Nil, _List_Nil);
							}
						})
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.inputMultiline),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'white-space', 'pre-wrap')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.paragraph),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'block'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'white-space', 'normal'),
						A2(
						mdgriffith$elm_ui$Internal$Style$Descriptor,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.hasBehind),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '0'),
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.behind),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'z-index', '-1')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.text),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'inline'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'white-space', 'normal')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.single),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'inline'),
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'white-space', 'normal'),
								A2(
								mdgriffith$elm_ui$Internal$Style$Descriptor,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.inFront),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex')
									])),
								A2(
								mdgriffith$elm_ui$Internal$Style$Descriptor,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.behind),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex')
									])),
								A2(
								mdgriffith$elm_ui$Internal$Style$Descriptor,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.above),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex')
									])),
								A2(
								mdgriffith$elm_ui$Internal$Style$Descriptor,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.below),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex')
									])),
								A2(
								mdgriffith$elm_ui$Internal$Style$Descriptor,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.onRight),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex')
									])),
								A2(
								mdgriffith$elm_ui$Internal$Style$Descriptor,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.onLeft),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'flex')
									])),
								A2(
								mdgriffith$elm_ui$Internal$Style$Child,
								mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.text),
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'inline'),
										A2(mdgriffith$elm_ui$Internal$Style$Prop, 'white-space', 'normal')
									]))
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.row),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'inline-flex')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.column),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'inline-flex')
							])),
						A2(
						mdgriffith$elm_ui$Internal$Style$Child,
						mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.grid),
						_List_fromArray(
							[
								A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'inline-grid')
							])),
						mdgriffith$elm_ui$Internal$Style$describeAlignment(
						function (alignment) {
							switch (alignment.$) {
								case 'Top':
									return _Utils_Tuple2(_List_Nil, _List_Nil);
								case 'Bottom':
									return _Utils_Tuple2(_List_Nil, _List_Nil);
								case 'Right':
									return _Utils_Tuple2(
										_List_Nil,
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'float', 'right')
											]));
								case 'Left':
									return _Utils_Tuple2(
										_List_Nil,
										_List_fromArray(
											[
												A2(mdgriffith$elm_ui$Internal$Style$Prop, 'float', 'left')
											]));
								case 'CenterX':
									return _Utils_Tuple2(_List_Nil, _List_Nil);
								default:
									return _Utils_Tuple2(_List_Nil, _List_Nil);
							}
						})
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				'.hidden',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'display', 'none')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textThin),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', '100')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textExtraLight),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', '200')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textLight),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', '300')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textNormalWeight),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', '400')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textMedium),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', '500')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textSemiBold),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', '600')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.bold),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', '700')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textExtraBold),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', '800')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textHeavy),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-weight', '900')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.italic),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-style', 'italic')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.strike),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-decoration', 'line-through')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.underline),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-decoration', 'underline'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-decoration-skip-ink', 'auto'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-decoration-skip', 'ink')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				_Utils_ap(
					mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.underline),
					mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.strike)),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-decoration', 'line-through underline'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-decoration-skip-ink', 'auto'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-decoration-skip', 'ink')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textUnitalicized),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-style', 'normal')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textJustify),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-align', 'justify')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textJustifyAll),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-align', 'justify-all')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textCenter),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-align', 'center')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textRight),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-align', 'right')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.textLeft),
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'text-align', 'left')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Descriptor,
				'.modal',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'position', 'fixed'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'left', '0'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'top', '0'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'width', '100%'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'height', '100%'),
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'pointer-events', 'none')
					]))
			]))
	]);
var mdgriffith$elm_ui$Internal$Style$fontVariant = function (_var) {
	return _List_fromArray(
		[
			A2(
			mdgriffith$elm_ui$Internal$Style$Class,
			'.v-' + _var,
			_List_fromArray(
				[
					A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-feature-settings', '\"' + (_var + '\"'))
				])),
			A2(
			mdgriffith$elm_ui$Internal$Style$Class,
			'.v-' + (_var + '-off'),
			_List_fromArray(
				[
					A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-feature-settings', '\"' + (_var + '\" 0'))
				]))
		]);
};
var mdgriffith$elm_ui$Internal$Style$commonValues = elm$core$List$concat(
	_List_fromArray(
		[
			A2(
			elm$core$List$map,
			function (x) {
				return A2(
					mdgriffith$elm_ui$Internal$Style$Class,
					'.border-' + elm$core$String$fromInt(x),
					_List_fromArray(
						[
							A2(
							mdgriffith$elm_ui$Internal$Style$Prop,
							'border-width',
							elm$core$String$fromInt(x) + 'px')
						]));
			},
			A2(elm$core$List$range, 0, 6)),
			A2(
			elm$core$List$map,
			function (i) {
				return A2(
					mdgriffith$elm_ui$Internal$Style$Class,
					'.font-size-' + elm$core$String$fromInt(i),
					_List_fromArray(
						[
							A2(
							mdgriffith$elm_ui$Internal$Style$Prop,
							'font-size',
							elm$core$String$fromInt(i) + 'px')
						]));
			},
			A2(elm$core$List$range, 8, 32)),
			A2(
			elm$core$List$map,
			function (i) {
				return A2(
					mdgriffith$elm_ui$Internal$Style$Class,
					'.p-' + elm$core$String$fromInt(i),
					_List_fromArray(
						[
							A2(
							mdgriffith$elm_ui$Internal$Style$Prop,
							'padding',
							elm$core$String$fromInt(i) + 'px')
						]));
			},
			A2(elm$core$List$range, 0, 24)),
			_List_fromArray(
			[
				A2(
				mdgriffith$elm_ui$Internal$Style$Class,
				'.v-smcp',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-variant', 'small-caps')
					])),
				A2(
				mdgriffith$elm_ui$Internal$Style$Class,
				'.v-smcp-off',
				_List_fromArray(
					[
						A2(mdgriffith$elm_ui$Internal$Style$Prop, 'font-variant', 'normal')
					]))
			]),
			mdgriffith$elm_ui$Internal$Style$fontVariant('zero'),
			mdgriffith$elm_ui$Internal$Style$fontVariant('onum'),
			mdgriffith$elm_ui$Internal$Style$fontVariant('liga'),
			mdgriffith$elm_ui$Internal$Style$fontVariant('dlig'),
			mdgriffith$elm_ui$Internal$Style$fontVariant('ordn'),
			mdgriffith$elm_ui$Internal$Style$fontVariant('tnum'),
			mdgriffith$elm_ui$Internal$Style$fontVariant('afrc'),
			mdgriffith$elm_ui$Internal$Style$fontVariant('frac')
		]));
var mdgriffith$elm_ui$Internal$Style$explainer = '\n.explain {\n    border: 6px solid rgb(174, 121, 15) !important;\n}\n.explain > .' + (mdgriffith$elm_ui$Internal$Style$classes.any + (' {\n    border: 4px dashed rgb(0, 151, 167) !important;\n}\n\n.ctr {\n    border: none !important;\n}\n.explain > .ctr > .' + (mdgriffith$elm_ui$Internal$Style$classes.any + ' {\n    border: 4px dashed rgb(0, 151, 167) !important;\n}\n\n')));
var mdgriffith$elm_ui$Internal$Style$sliderOverrides = '\n\n/* General Input Reset */\ninput[type=range] {\n  -webkit-appearance: none; /* Hides the slider so that custom slider can be made */\n  /* width: 100%;  Specific width is required for Firefox. */\n  background: transparent; /* Otherwise white in Chrome */\n  position:absolute;\n  left:0;\n  top:0;\n  z-index:10;\n  width: 100%;\n  outline: dashed 1px;\n  height: 100%;\n  opacity: 0;\n}\n\n/* Hide all syling for track */\ninput[type=range]::-moz-range-track {\n    background: transparent;\n    cursor: pointer;\n}\ninput[type=range]::-ms-track {\n    background: transparent;\n    cursor: pointer;\n}\ninput[type=range]::-webkit-slider-runnable-track {\n    background: transparent;\n    cursor: pointer;\n}\n\n/* Thumbs */\ninput[type=range]::-webkit-slider-thumb {\n    -webkit-appearance: none;\n    opacity: 0.5;\n    width: 80px;\n    height: 80px;\n    background-color: black;\n    border:none;\n    border-radius: 5px;\n}\ninput[type=range]::-moz-range-thumb {\n    opacity: 0.5;\n    width: 80px;\n    height: 80px;\n    background-color: black;\n    border:none;\n    border-radius: 5px;\n}\ninput[type=range]::-ms-thumb {\n    opacity: 0.5;\n    width: 80px;\n    height: 80px;\n    background-color: black;\n    border:none;\n    border-radius: 5px;\n}\ninput[type=range][orient=vertical]{\n    writing-mode: bt-lr; /* IE */\n    -webkit-appearance: slider-vertical;  /* WebKit */\n}\n';
var mdgriffith$elm_ui$Internal$Style$overrides = '@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {' + (mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any) + (mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.row) + (' > ' + (mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any) + (' { flex-basis: auto !important; } ' + (mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any) + (mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.row) + (' > ' + (mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.any) + (mdgriffith$elm_ui$Internal$Style$dot(mdgriffith$elm_ui$Internal$Style$classes.container) + (' { flex-basis: auto !important; }}' + (mdgriffith$elm_ui$Internal$Style$sliderOverrides + mdgriffith$elm_ui$Internal$Style$explainer))))))))))));
var elm$core$String$concat = function (strings) {
	return A2(elm$core$String$join, '', strings);
};
var mdgriffith$elm_ui$Internal$Style$Intermediate = function (a) {
	return {$: 'Intermediate', a: a};
};
var mdgriffith$elm_ui$Internal$Style$emptyIntermediate = F2(
	function (selector, closing) {
		return mdgriffith$elm_ui$Internal$Style$Intermediate(
			{closing: closing, others: _List_Nil, props: _List_Nil, selector: selector});
	});
var mdgriffith$elm_ui$Internal$Style$renderRules = F2(
	function (_n0, rulesToRender) {
		var parent = _n0.a;
		var generateIntermediates = F2(
			function (rule, rendered) {
				switch (rule.$) {
					case 'Prop':
						var name = rule.a;
						var val = rule.b;
						return _Utils_update(
							rendered,
							{
								props: A2(
									elm$core$List$cons,
									_Utils_Tuple2(name, val),
									rendered.props)
							});
					case 'Supports':
						var _n2 = rule.a;
						var prop = _n2.a;
						var value = _n2.b;
						var props = rule.b;
						return _Utils_update(
							rendered,
							{
								others: A2(
									elm$core$List$cons,
									mdgriffith$elm_ui$Internal$Style$Intermediate(
										{closing: '\n}', others: _List_Nil, props: props, selector: '@supports (' + (prop + (':' + (value + (') {' + parent.selector))))}),
									rendered.others)
							});
					case 'Adjacent':
						var selector = rule.a;
						var adjRules = rule.b;
						return _Utils_update(
							rendered,
							{
								others: A2(
									elm$core$List$cons,
									A2(
										mdgriffith$elm_ui$Internal$Style$renderRules,
										A2(mdgriffith$elm_ui$Internal$Style$emptyIntermediate, parent.selector + (' + ' + selector), ''),
										adjRules),
									rendered.others)
							});
					case 'Child':
						var child = rule.a;
						var childRules = rule.b;
						return _Utils_update(
							rendered,
							{
								others: A2(
									elm$core$List$cons,
									A2(
										mdgriffith$elm_ui$Internal$Style$renderRules,
										A2(mdgriffith$elm_ui$Internal$Style$emptyIntermediate, parent.selector + (' > ' + child), ''),
										childRules),
									rendered.others)
							});
					case 'Descriptor':
						var descriptor = rule.a;
						var descriptorRules = rule.b;
						return _Utils_update(
							rendered,
							{
								others: A2(
									elm$core$List$cons,
									A2(
										mdgriffith$elm_ui$Internal$Style$renderRules,
										A2(
											mdgriffith$elm_ui$Internal$Style$emptyIntermediate,
											_Utils_ap(parent.selector, descriptor),
											''),
										descriptorRules),
									rendered.others)
							});
					default:
						var batched = rule.a;
						return _Utils_update(
							rendered,
							{
								others: A2(
									elm$core$List$cons,
									A2(
										mdgriffith$elm_ui$Internal$Style$renderRules,
										A2(mdgriffith$elm_ui$Internal$Style$emptyIntermediate, parent.selector, ''),
										batched),
									rendered.others)
							});
				}
			});
		return mdgriffith$elm_ui$Internal$Style$Intermediate(
			A3(elm$core$List$foldr, generateIntermediates, parent, rulesToRender));
	});
var mdgriffith$elm_ui$Internal$Style$renderCompact = function (styleClasses) {
	var renderValues = function (values) {
		return elm$core$String$concat(
			A2(
				elm$core$List$map,
				function (_n3) {
					var x = _n3.a;
					var y = _n3.b;
					return x + (':' + (y + ';'));
				},
				values));
	};
	var renderClass = function (rule) {
		var _n2 = rule.props;
		if (!_n2.b) {
			return '';
		} else {
			return rule.selector + ('{' + (renderValues(rule.props) + (rule.closing + '}')));
		}
	};
	var renderIntermediate = function (_n0) {
		var rule = _n0.a;
		return _Utils_ap(
			renderClass(rule),
			elm$core$String$concat(
				A2(elm$core$List$map, renderIntermediate, rule.others)));
	};
	return elm$core$String$concat(
		A2(
			elm$core$List$map,
			renderIntermediate,
			A3(
				elm$core$List$foldr,
				F2(
					function (_n1, existing) {
						var name = _n1.a;
						var styleRules = _n1.b;
						return A2(
							elm$core$List$cons,
							A2(
								mdgriffith$elm_ui$Internal$Style$renderRules,
								A2(mdgriffith$elm_ui$Internal$Style$emptyIntermediate, name, ''),
								styleRules),
							existing);
					}),
				_List_Nil,
				styleClasses)));
};
var mdgriffith$elm_ui$Internal$Style$rules = _Utils_ap(
	mdgriffith$elm_ui$Internal$Style$overrides,
	mdgriffith$elm_ui$Internal$Style$renderCompact(
		_Utils_ap(mdgriffith$elm_ui$Internal$Style$baseSheet, mdgriffith$elm_ui$Internal$Style$commonValues)));
var mdgriffith$elm_ui$Internal$Model$staticRoot = A3(
	elm$virtual_dom$VirtualDom$node,
	'style',
	_List_Nil,
	_List_fromArray(
		[
			elm$virtual_dom$VirtualDom$text(mdgriffith$elm_ui$Internal$Style$rules)
		]));
var elm$core$Basics$min = F2(
	function (x, y) {
		return (_Utils_cmp(x, y) < 0) ? x : y;
	});
var elm$core$Basics$negate = function (n) {
	return -n;
};
var elm$core$List$any = F2(
	function (isOkay, list) {
		any:
		while (true) {
			if (!list.b) {
				return false;
			} else {
				var x = list.a;
				var xs = list.b;
				if (isOkay(x)) {
					return true;
				} else {
					var $temp$isOkay = isOkay,
						$temp$list = xs;
					isOkay = $temp$isOkay;
					list = $temp$list;
					continue any;
				}
			}
		}
	});
var mdgriffith$elm_ui$Internal$Model$fontName = function (font) {
	switch (font.$) {
		case 'Serif':
			return 'serif';
		case 'SansSerif':
			return 'sans-serif';
		case 'Monospace':
			return 'monospace';
		case 'Typeface':
			var name = font.a;
			return '\"' + (name + '\"');
		case 'ImportFont':
			var name = font.a;
			var url = font.b;
			return '\"' + (name + '\"');
		default:
			var name = font.a.name;
			return '\"' + (name + '\"');
	}
};
var mdgriffith$elm_ui$Internal$Model$isSmallCaps = function (_var) {
	switch (_var.$) {
		case 'VariantActive':
			var name = _var.a;
			return name === 'smcp';
		case 'VariantOff':
			var name = _var.a;
			return false;
		default:
			var name = _var.a;
			var index = _var.b;
			return (name === 'smcp') && (index === 1);
	}
};
var mdgriffith$elm_ui$Internal$Model$hasSmallCaps = function (typeface) {
	if (typeface.$ === 'FontWith') {
		var font = typeface.a;
		return A2(elm$core$List$any, mdgriffith$elm_ui$Internal$Model$isSmallCaps, font.variants);
	} else {
		return false;
	}
};
var mdgriffith$elm_ui$Internal$Model$renderProps = F3(
	function (force, _n0, existing) {
		var key = _n0.a;
		var val = _n0.b;
		return force ? (existing + ('\n  ' + (key + (': ' + (val + ' !important;'))))) : (existing + ('\n  ' + (key + (': ' + (val + ';')))));
	});
var mdgriffith$elm_ui$Internal$Model$bracket = F2(
	function (selector, rules) {
		var renderPair = function (_n0) {
			var name = _n0.a;
			var val = _n0.b;
			return name + (': ' + (val + ';'));
		};
		return selector + (' {' + (A2(
			elm$core$String$join,
			'',
			A2(elm$core$List$map, renderPair, rules)) + '}'));
	});
var mdgriffith$elm_ui$Internal$Model$fontRule = F3(
	function (name, modifier, _n0) {
		var parentAdj = _n0.a;
		var textAdjustment = _n0.b;
		return _List_fromArray(
			[
				A2(mdgriffith$elm_ui$Internal$Model$bracket, '.' + (name + ('.' + (modifier + (', ' + ('.' + (name + (' .' + modifier))))))), parentAdj),
				A2(mdgriffith$elm_ui$Internal$Model$bracket, '.' + (name + ('.' + (modifier + ('> .' + (mdgriffith$elm_ui$Internal$Style$classes.text + (', .' + (name + (' .' + (modifier + (' > .' + mdgriffith$elm_ui$Internal$Style$classes.text)))))))))), textAdjustment)
			]);
	});
var mdgriffith$elm_ui$Internal$Model$renderFontAdjustmentRule = F3(
	function (fontToAdjust, _n0, otherFontName) {
		var full = _n0.a;
		var capital = _n0.b;
		var name = _Utils_eq(fontToAdjust, otherFontName) ? fontToAdjust : (otherFontName + (' .' + fontToAdjust));
		return A2(
			elm$core$String$join,
			' ',
			_Utils_ap(
				A3(mdgriffith$elm_ui$Internal$Model$fontRule, name, mdgriffith$elm_ui$Internal$Style$classes.sizeByCapital, capital),
				A3(mdgriffith$elm_ui$Internal$Model$fontRule, name, mdgriffith$elm_ui$Internal$Style$classes.fullSize, full)));
	});
var mdgriffith$elm_ui$Internal$Model$renderNullAdjustmentRule = F2(
	function (fontToAdjust, otherFontName) {
		var name = _Utils_eq(fontToAdjust, otherFontName) ? fontToAdjust : (otherFontName + (' .' + fontToAdjust));
		return A2(
			elm$core$String$join,
			' ',
			_List_fromArray(
				[
					A2(
					mdgriffith$elm_ui$Internal$Model$bracket,
					'.' + (name + ('.' + (mdgriffith$elm_ui$Internal$Style$classes.sizeByCapital + (', ' + ('.' + (name + (' .' + mdgriffith$elm_ui$Internal$Style$classes.sizeByCapital))))))),
					_List_fromArray(
						[
							_Utils_Tuple2('line-height', '1')
						])),
					A2(
					mdgriffith$elm_ui$Internal$Model$bracket,
					'.' + (name + ('.' + (mdgriffith$elm_ui$Internal$Style$classes.sizeByCapital + ('> .' + (mdgriffith$elm_ui$Internal$Style$classes.text + (', .' + (name + (' .' + (mdgriffith$elm_ui$Internal$Style$classes.sizeByCapital + (' > .' + mdgriffith$elm_ui$Internal$Style$classes.text)))))))))),
					_List_fromArray(
						[
							_Utils_Tuple2('vertical-align', '0'),
							_Utils_Tuple2('line-height', '1')
						]))
				]));
	});
var elm$core$Basics$neq = _Utils_notEqual;
var elm$core$List$filter = F2(
	function (isGood, list) {
		return A3(
			elm$core$List$foldr,
			F2(
				function (x, xs) {
					return isGood(x) ? A2(elm$core$List$cons, x, xs) : xs;
				}),
			_List_Nil,
			list);
	});
var elm$core$List$maximum = function (list) {
	if (list.b) {
		var x = list.a;
		var xs = list.b;
		return elm$core$Maybe$Just(
			A3(elm$core$List$foldl, elm$core$Basics$max, x, xs));
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var elm$core$List$minimum = function (list) {
	if (list.b) {
		var x = list.a;
		var xs = list.b;
		return elm$core$Maybe$Just(
			A3(elm$core$List$foldl, elm$core$Basics$min, x, xs));
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var mdgriffith$elm_ui$Internal$Model$adjust = F3(
	function (size, height, vertical) {
		return {height: height / size, size: size, vertical: vertical};
	});
var mdgriffith$elm_ui$Internal$Model$convertAdjustment = function (adjustment) {
	var lines = _List_fromArray(
		[adjustment.capital, adjustment.baseline, adjustment.descender, adjustment.lowercase]);
	var lineHeight = 1.5;
	var normalDescender = (lineHeight - 1) / 2;
	var oldMiddle = lineHeight / 2;
	var descender = A2(
		elm$core$Maybe$withDefault,
		adjustment.descender,
		elm$core$List$minimum(lines));
	var newBaseline = A2(
		elm$core$Maybe$withDefault,
		adjustment.baseline,
		elm$core$List$minimum(
			A2(
				elm$core$List$filter,
				function (x) {
					return !_Utils_eq(x, descender);
				},
				lines)));
	var base = lineHeight;
	var ascender = A2(
		elm$core$Maybe$withDefault,
		adjustment.capital,
		elm$core$List$maximum(lines));
	var capitalSize = 1 / (ascender - newBaseline);
	var capitalVertical = 1 - ascender;
	var fullSize = 1 / (ascender - descender);
	var fullVertical = 1 - ascender;
	var newCapitalMiddle = ((ascender - newBaseline) / 2) + newBaseline;
	var newFullMiddle = ((ascender - descender) / 2) + descender;
	return {
		capital: A3(mdgriffith$elm_ui$Internal$Model$adjust, capitalSize, ascender - newBaseline, capitalVertical),
		full: A3(mdgriffith$elm_ui$Internal$Model$adjust, fullSize, ascender - descender, fullVertical)
	};
};
var mdgriffith$elm_ui$Internal$Model$fontAdjustmentRules = function (converted) {
	return _Utils_Tuple2(
		_List_fromArray(
			[
				_Utils_Tuple2('display', 'block')
			]),
		_List_fromArray(
			[
				_Utils_Tuple2('display', 'inline-block'),
				_Utils_Tuple2(
				'line-height',
				elm$core$String$fromFloat(converted.height)),
				_Utils_Tuple2(
				'vertical-align',
				elm$core$String$fromFloat(converted.vertical) + 'em'),
				_Utils_Tuple2(
				'font-size',
				elm$core$String$fromFloat(converted.size) + 'em')
			]));
};
var mdgriffith$elm_ui$Internal$Model$typefaceAdjustment = function (typefaces) {
	return A3(
		elm$core$List$foldl,
		F2(
			function (face, found) {
				if (found.$ === 'Nothing') {
					if (face.$ === 'FontWith') {
						var _with = face.a;
						var _n2 = _with.adjustment;
						if (_n2.$ === 'Nothing') {
							return found;
						} else {
							var adjustment = _n2.a;
							return elm$core$Maybe$Just(
								_Utils_Tuple2(
									mdgriffith$elm_ui$Internal$Model$fontAdjustmentRules(
										function ($) {
											return $.full;
										}(
											mdgriffith$elm_ui$Internal$Model$convertAdjustment(adjustment))),
									mdgriffith$elm_ui$Internal$Model$fontAdjustmentRules(
										function ($) {
											return $.capital;
										}(
											mdgriffith$elm_ui$Internal$Model$convertAdjustment(adjustment)))));
						}
					} else {
						return found;
					}
				} else {
					return found;
				}
			}),
		elm$core$Maybe$Nothing,
		typefaces);
};
var mdgriffith$elm_ui$Internal$Model$renderTopLevelValues = function (rules) {
	var withImport = function (font) {
		if (font.$ === 'ImportFont') {
			var url = font.b;
			return elm$core$Maybe$Just('@import url(\'' + (url + '\');'));
		} else {
			return elm$core$Maybe$Nothing;
		}
	};
	var fontImports = function (_n2) {
		var name = _n2.a;
		var typefaces = _n2.b;
		var imports = A2(
			elm$core$String$join,
			'\n',
			A2(elm$core$List$filterMap, withImport, typefaces));
		return imports;
	};
	var allNames = A2(elm$core$List$map, elm$core$Tuple$first, rules);
	var fontAdjustments = function (_n1) {
		var name = _n1.a;
		var typefaces = _n1.b;
		var _n0 = mdgriffith$elm_ui$Internal$Model$typefaceAdjustment(typefaces);
		if (_n0.$ === 'Nothing') {
			return A2(
				elm$core$String$join,
				'',
				A2(
					elm$core$List$map,
					mdgriffith$elm_ui$Internal$Model$renderNullAdjustmentRule(name),
					allNames));
		} else {
			var adjustment = _n0.a;
			return A2(
				elm$core$String$join,
				'',
				A2(
					elm$core$List$map,
					A2(mdgriffith$elm_ui$Internal$Model$renderFontAdjustmentRule, name, adjustment),
					allNames));
		}
	};
	return _Utils_ap(
		A2(
			elm$core$String$join,
			'\n',
			A2(elm$core$List$map, fontImports, rules)),
		A2(
			elm$core$String$join,
			'\n',
			A2(elm$core$List$map, fontAdjustments, rules)));
};
var mdgriffith$elm_ui$Internal$Model$renderVariant = function (_var) {
	switch (_var.$) {
		case 'VariantActive':
			var name = _var.a;
			return '\"' + (name + '\"');
		case 'VariantOff':
			var name = _var.a;
			return '\"' + (name + '\" 0');
		default:
			var name = _var.a;
			var index = _var.b;
			return '\"' + (name + ('\" ' + elm$core$String$fromInt(index)));
	}
};
var mdgriffith$elm_ui$Internal$Model$renderVariants = function (typeface) {
	if (typeface.$ === 'FontWith') {
		var font = typeface.a;
		return elm$core$Maybe$Just(
			A2(
				elm$core$String$join,
				', ',
				A2(elm$core$List$map, mdgriffith$elm_ui$Internal$Model$renderVariant, font.variants)));
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var mdgriffith$elm_ui$Internal$Model$topLevelValue = function (rule) {
	if (rule.$ === 'FontFamily') {
		var name = rule.a;
		var typefaces = rule.b;
		return elm$core$Maybe$Just(
			_Utils_Tuple2(name, typefaces));
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var mdgriffith$elm_ui$Internal$Model$transformValue = function (transform) {
	switch (transform.$) {
		case 'Untransformed':
			return elm$core$Maybe$Nothing;
		case 'Moved':
			var _n1 = transform.a;
			var x = _n1.a;
			var y = _n1.b;
			var z = _n1.c;
			return elm$core$Maybe$Just(
				'translate3d(' + (elm$core$String$fromFloat(x) + ('px, ' + (elm$core$String$fromFloat(y) + ('px, ' + (elm$core$String$fromFloat(z) + 'px)'))))));
		default:
			var _n2 = transform.a;
			var tx = _n2.a;
			var ty = _n2.b;
			var tz = _n2.c;
			var _n3 = transform.b;
			var sx = _n3.a;
			var sy = _n3.b;
			var sz = _n3.c;
			var _n4 = transform.c;
			var ox = _n4.a;
			var oy = _n4.b;
			var oz = _n4.c;
			var angle = transform.d;
			var translate = 'translate3d(' + (elm$core$String$fromFloat(tx) + ('px, ' + (elm$core$String$fromFloat(ty) + ('px, ' + (elm$core$String$fromFloat(tz) + 'px)')))));
			var scale = 'scale3d(' + (elm$core$String$fromFloat(sx) + (', ' + (elm$core$String$fromFloat(sy) + (', ' + (elm$core$String$fromFloat(sz) + ')')))));
			var rotate = 'rotate3d(' + (elm$core$String$fromFloat(ox) + (', ' + (elm$core$String$fromFloat(oy) + (', ' + (elm$core$String$fromFloat(oz) + (', ' + (elm$core$String$fromFloat(angle) + 'rad)')))))));
			return elm$core$Maybe$Just(translate + (' ' + (scale + (' ' + rotate))));
	}
};
var mdgriffith$elm_ui$Internal$Model$toStyleSheetString = F2(
	function (options, stylesheet) {
		var renderStyle = F3(
			function (maybePseudo, selector, props) {
				if (maybePseudo.$ === 'Nothing') {
					return selector + ('{' + (A3(
						elm$core$List$foldl,
						mdgriffith$elm_ui$Internal$Model$renderProps(false),
						'',
						props) + '\n}'));
				} else {
					var pseudo = maybePseudo.a;
					switch (pseudo.$) {
						case 'Hover':
							var _n17 = options.hover;
							switch (_n17.$) {
								case 'NoHover':
									return '';
								case 'ForceHover':
									return selector + ('-hv {' + (A3(
										elm$core$List$foldl,
										mdgriffith$elm_ui$Internal$Model$renderProps(true),
										'',
										props) + '\n}'));
								default:
									return selector + ('-hv:hover {' + (A3(
										elm$core$List$foldl,
										mdgriffith$elm_ui$Internal$Model$renderProps(false),
										'',
										props) + '\n}'));
							}
						case 'Focus':
							var renderedProps = A3(
								elm$core$List$foldl,
								mdgriffith$elm_ui$Internal$Model$renderProps(false),
								'',
								props);
							return A2(
								elm$core$String$join,
								'\n',
								_List_fromArray(
									[selector + ('-fs:focus {' + (renderedProps + '\n}')), '.' + (mdgriffith$elm_ui$Internal$Style$classes.any + (':focus ~ ' + (selector + ('-fs:not(.focus)  {' + (renderedProps + '\n}'))))), '.' + (mdgriffith$elm_ui$Internal$Style$classes.any + (':focus ' + (selector + ('-fs  {' + (renderedProps + '\n}'))))), '.focusable-parent:focus ~ ' + ('.' + (mdgriffith$elm_ui$Internal$Style$classes.any + (' ' + (selector + ('-fs {' + (renderedProps + '\n}'))))))]));
						default:
							return selector + ('-act:active {' + (A3(
								elm$core$List$foldl,
								mdgriffith$elm_ui$Internal$Model$renderProps(false),
								'',
								props) + '\n}'));
					}
				}
			});
		var renderStyleRule = F2(
			function (rule, maybePseudo) {
				switch (rule.$) {
					case 'Style':
						var selector = rule.a;
						var props = rule.b;
						return A3(renderStyle, maybePseudo, selector, props);
					case 'Shadows':
						var name = rule.a;
						var prop = rule.b;
						return A3(
							renderStyle,
							maybePseudo,
							'.' + name,
							_List_fromArray(
								[
									A2(mdgriffith$elm_ui$Internal$Model$Property, 'box-shadow', prop)
								]));
					case 'Transparency':
						var name = rule.a;
						var transparency = rule.b;
						var opacity = A2(
							elm$core$Basics$max,
							0,
							A2(elm$core$Basics$min, 1, 1 - transparency));
						return A3(
							renderStyle,
							maybePseudo,
							'.' + name,
							_List_fromArray(
								[
									A2(
									mdgriffith$elm_ui$Internal$Model$Property,
									'opacity',
									elm$core$String$fromFloat(opacity))
								]));
					case 'FontSize':
						var i = rule.a;
						return A3(
							renderStyle,
							maybePseudo,
							'.font-size-' + elm$core$String$fromInt(i),
							_List_fromArray(
								[
									A2(
									mdgriffith$elm_ui$Internal$Model$Property,
									'font-size',
									elm$core$String$fromInt(i) + 'px')
								]));
					case 'FontFamily':
						var name = rule.a;
						var typefaces = rule.b;
						var features = A2(
							elm$core$String$join,
							', ',
							A2(elm$core$List$filterMap, mdgriffith$elm_ui$Internal$Model$renderVariants, typefaces));
						var families = _List_fromArray(
							[
								A2(
								mdgriffith$elm_ui$Internal$Model$Property,
								'font-family',
								A2(
									elm$core$String$join,
									', ',
									A2(elm$core$List$map, mdgriffith$elm_ui$Internal$Model$fontName, typefaces))),
								A2(mdgriffith$elm_ui$Internal$Model$Property, 'font-feature-settings', features),
								A2(
								mdgriffith$elm_ui$Internal$Model$Property,
								'font-variant',
								A2(elm$core$List$any, mdgriffith$elm_ui$Internal$Model$hasSmallCaps, typefaces) ? 'small-caps' : 'normal')
							]);
						return A2(
							elm$core$String$join,
							' ',
							_List_fromArray(
								[
									A3(renderStyle, maybePseudo, '.' + name, families)
								]));
					case 'Single':
						var _class = rule.a;
						var prop = rule.b;
						var val = rule.c;
						return A3(
							renderStyle,
							maybePseudo,
							'.' + _class,
							_List_fromArray(
								[
									A2(mdgriffith$elm_ui$Internal$Model$Property, prop, val)
								]));
					case 'Colored':
						var _class = rule.a;
						var prop = rule.b;
						var color = rule.c;
						return A3(
							renderStyle,
							maybePseudo,
							'.' + _class,
							_List_fromArray(
								[
									A2(
									mdgriffith$elm_ui$Internal$Model$Property,
									prop,
									mdgriffith$elm_ui$Internal$Model$formatColor(color))
								]));
					case 'SpacingStyle':
						var cls = rule.a;
						var x = rule.b;
						var y = rule.c;
						var yPx = elm$core$String$fromInt(y) + 'px';
						var xPx = elm$core$String$fromInt(x) + 'px';
						var single = '.' + mdgriffith$elm_ui$Internal$Style$classes.single;
						var row = '.' + mdgriffith$elm_ui$Internal$Style$classes.row;
						var wrappedRow = '.' + (mdgriffith$elm_ui$Internal$Style$classes.wrapped + row);
						var right = '.' + mdgriffith$elm_ui$Internal$Style$classes.alignRight;
						var paragraph = '.' + mdgriffith$elm_ui$Internal$Style$classes.paragraph;
						var page = '.' + mdgriffith$elm_ui$Internal$Style$classes.page;
						var left = '.' + mdgriffith$elm_ui$Internal$Style$classes.alignLeft;
						var halfY = elm$core$String$fromFloat(y / 2) + 'px';
						var halfX = elm$core$String$fromFloat(x / 2) + 'px';
						var column = '.' + mdgriffith$elm_ui$Internal$Style$classes.column;
						var _class = '.' + cls;
						var any = '.' + mdgriffith$elm_ui$Internal$Style$classes.any;
						return elm$core$String$concat(
							_List_fromArray(
								[
									A3(
									renderStyle,
									maybePseudo,
									_class + (row + (' > ' + (any + (' + ' + any)))),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'margin-left', xPx)
										])),
									A3(
									renderStyle,
									maybePseudo,
									_class + (wrappedRow + (' > ' + any)),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'margin', halfY + (' ' + halfX))
										])),
									A3(
									renderStyle,
									maybePseudo,
									_class + (column + (' > ' + (any + (' + ' + any)))),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'margin-top', yPx)
										])),
									A3(
									renderStyle,
									maybePseudo,
									_class + (page + (' > ' + (any + (' + ' + any)))),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'margin-top', yPx)
										])),
									A3(
									renderStyle,
									maybePseudo,
									_class + (page + (' > ' + left)),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'margin-right', xPx)
										])),
									A3(
									renderStyle,
									maybePseudo,
									_class + (page + (' > ' + right)),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'margin-left', xPx)
										])),
									A3(
									renderStyle,
									maybePseudo,
									_Utils_ap(_class, paragraph),
									_List_fromArray(
										[
											A2(
											mdgriffith$elm_ui$Internal$Model$Property,
											'line-height',
											'calc(1em + ' + (elm$core$String$fromInt(y) + 'px)'))
										])),
									A3(
									renderStyle,
									maybePseudo,
									'textarea' + _class,
									_List_fromArray(
										[
											A2(
											mdgriffith$elm_ui$Internal$Model$Property,
											'line-height',
											'calc(1em + ' + (elm$core$String$fromInt(y) + 'px)'))
										])),
									A3(
									renderStyle,
									maybePseudo,
									_class + (paragraph + (' > ' + left)),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'margin-right', xPx)
										])),
									A3(
									renderStyle,
									maybePseudo,
									_class + (paragraph + (' > ' + right)),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'margin-left', xPx)
										])),
									A3(
									renderStyle,
									maybePseudo,
									_class + (paragraph + '::after'),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'content', '\'\''),
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'display', 'block'),
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'height', '0'),
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'width', '0'),
											A2(
											mdgriffith$elm_ui$Internal$Model$Property,
											'margin-top',
											elm$core$String$fromInt((-1) * ((y / 2) | 0)) + 'px')
										])),
									A3(
									renderStyle,
									maybePseudo,
									_class + (paragraph + '::before'),
									_List_fromArray(
										[
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'content', '\'\''),
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'display', 'block'),
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'height', '0'),
											A2(mdgriffith$elm_ui$Internal$Model$Property, 'width', '0'),
											A2(
											mdgriffith$elm_ui$Internal$Model$Property,
											'margin-bottom',
											elm$core$String$fromInt((-1) * ((y / 2) | 0)) + 'px')
										]))
								]));
					case 'PaddingStyle':
						var cls = rule.a;
						var top = rule.b;
						var right = rule.c;
						var bottom = rule.d;
						var left = rule.e;
						var _class = '.' + cls;
						return A3(
							renderStyle,
							maybePseudo,
							_class,
							_List_fromArray(
								[
									A2(
									mdgriffith$elm_ui$Internal$Model$Property,
									'padding',
									elm$core$String$fromInt(top) + ('px ' + (elm$core$String$fromInt(right) + ('px ' + (elm$core$String$fromInt(bottom) + ('px ' + (elm$core$String$fromInt(left) + 'px')))))))
								]));
					case 'BorderWidth':
						var cls = rule.a;
						var top = rule.b;
						var right = rule.c;
						var bottom = rule.d;
						var left = rule.e;
						var _class = '.' + cls;
						return A3(
							renderStyle,
							maybePseudo,
							_class,
							_List_fromArray(
								[
									A2(
									mdgriffith$elm_ui$Internal$Model$Property,
									'border-width',
									elm$core$String$fromInt(top) + ('px ' + (elm$core$String$fromInt(right) + ('px ' + (elm$core$String$fromInt(bottom) + ('px ' + (elm$core$String$fromInt(left) + 'px')))))))
								]));
					case 'GridTemplateStyle':
						var template = rule.a;
						var toGridLengthHelper = F3(
							function (minimum, maximum, x) {
								toGridLengthHelper:
								while (true) {
									switch (x.$) {
										case 'Px':
											var px = x.a;
											return elm$core$String$fromInt(px) + 'px';
										case 'Content':
											var _n2 = _Utils_Tuple2(minimum, maximum);
											if (_n2.a.$ === 'Nothing') {
												if (_n2.b.$ === 'Nothing') {
													var _n3 = _n2.a;
													var _n4 = _n2.b;
													return 'max-content';
												} else {
													var _n6 = _n2.a;
													var maxSize = _n2.b.a;
													return 'minmax(max-content, ' + (elm$core$String$fromInt(maxSize) + 'px)');
												}
											} else {
												if (_n2.b.$ === 'Nothing') {
													var minSize = _n2.a.a;
													var _n5 = _n2.b;
													return 'minmax(' + (elm$core$String$fromInt(minSize) + ('px, ' + 'max-content)'));
												} else {
													var minSize = _n2.a.a;
													var maxSize = _n2.b.a;
													return 'minmax(' + (elm$core$String$fromInt(minSize) + ('px, ' + (elm$core$String$fromInt(maxSize) + 'px)')));
												}
											}
										case 'Fill':
											var i = x.a;
											var _n7 = _Utils_Tuple2(minimum, maximum);
											if (_n7.a.$ === 'Nothing') {
												if (_n7.b.$ === 'Nothing') {
													var _n8 = _n7.a;
													var _n9 = _n7.b;
													return elm$core$String$fromInt(i) + 'fr';
												} else {
													var _n11 = _n7.a;
													var maxSize = _n7.b.a;
													return 'minmax(max-content, ' + (elm$core$String$fromInt(maxSize) + 'px)');
												}
											} else {
												if (_n7.b.$ === 'Nothing') {
													var minSize = _n7.a.a;
													var _n10 = _n7.b;
													return 'minmax(' + (elm$core$String$fromInt(minSize) + ('px, ' + (elm$core$String$fromInt(i) + ('fr' + 'fr)'))));
												} else {
													var minSize = _n7.a.a;
													var maxSize = _n7.b.a;
													return 'minmax(' + (elm$core$String$fromInt(minSize) + ('px, ' + (elm$core$String$fromInt(maxSize) + 'px)')));
												}
											}
										case 'Min':
											var m = x.a;
											var len = x.b;
											var $temp$minimum = elm$core$Maybe$Just(m),
												$temp$maximum = maximum,
												$temp$x = len;
											minimum = $temp$minimum;
											maximum = $temp$maximum;
											x = $temp$x;
											continue toGridLengthHelper;
										default:
											var m = x.a;
											var len = x.b;
											var $temp$minimum = minimum,
												$temp$maximum = elm$core$Maybe$Just(m),
												$temp$x = len;
											minimum = $temp$minimum;
											maximum = $temp$maximum;
											x = $temp$x;
											continue toGridLengthHelper;
									}
								}
							});
						var toGridLength = function (x) {
							return A3(toGridLengthHelper, elm$core$Maybe$Nothing, elm$core$Maybe$Nothing, x);
						};
						var xSpacing = toGridLength(template.spacing.a);
						var ySpacing = toGridLength(template.spacing.b);
						var rows = function (x) {
							return 'grid-template-rows: ' + (x + ';');
						}(
							A2(
								elm$core$String$join,
								' ',
								A2(elm$core$List$map, toGridLength, template.rows)));
						var msRows = function (x) {
							return '-ms-grid-rows: ' + (x + ';');
						}(
							A2(
								elm$core$String$join,
								ySpacing,
								A2(elm$core$List$map, toGridLength, template.columns)));
						var msColumns = function (x) {
							return '-ms-grid-columns: ' + (x + ';');
						}(
							A2(
								elm$core$String$join,
								ySpacing,
								A2(elm$core$List$map, toGridLength, template.columns)));
						var gapY = 'grid-row-gap:' + (toGridLength(template.spacing.b) + ';');
						var gapX = 'grid-column-gap:' + (toGridLength(template.spacing.a) + ';');
						var columns = function (x) {
							return 'grid-template-columns: ' + (x + ';');
						}(
							A2(
								elm$core$String$join,
								' ',
								A2(elm$core$List$map, toGridLength, template.columns)));
						var _class = '.grid-rows-' + (A2(
							elm$core$String$join,
							'-',
							A2(elm$core$List$map, mdgriffith$elm_ui$Internal$Model$lengthClassName, template.rows)) + ('-cols-' + (A2(
							elm$core$String$join,
							'-',
							A2(elm$core$List$map, mdgriffith$elm_ui$Internal$Model$lengthClassName, template.columns)) + ('-space-x-' + (mdgriffith$elm_ui$Internal$Model$lengthClassName(template.spacing.a) + ('-space-y-' + mdgriffith$elm_ui$Internal$Model$lengthClassName(template.spacing.b)))))));
						var modernGrid = _class + ('{' + (columns + (rows + (gapX + (gapY + '}')))));
						var supports = '@supports (display:grid) {' + (modernGrid + '}');
						var base = _class + ('{' + (msColumns + (msRows + '}')));
						return _Utils_ap(base, supports);
					case 'GridPosition':
						var position = rule.a;
						var msPosition = A2(
							elm$core$String$join,
							' ',
							_List_fromArray(
								[
									'-ms-grid-row: ' + (elm$core$String$fromInt(position.row) + ';'),
									'-ms-grid-row-span: ' + (elm$core$String$fromInt(position.height) + ';'),
									'-ms-grid-column: ' + (elm$core$String$fromInt(position.col) + ';'),
									'-ms-grid-column-span: ' + (elm$core$String$fromInt(position.width) + ';')
								]));
						var modernPosition = A2(
							elm$core$String$join,
							' ',
							_List_fromArray(
								[
									'grid-row: ' + (elm$core$String$fromInt(position.row) + (' / ' + (elm$core$String$fromInt(position.row + position.height) + ';'))),
									'grid-column: ' + (elm$core$String$fromInt(position.col) + (' / ' + (elm$core$String$fromInt(position.col + position.width) + ';')))
								]));
						var _class = '.grid-pos-' + (elm$core$String$fromInt(position.row) + ('-' + (elm$core$String$fromInt(position.col) + ('-' + (elm$core$String$fromInt(position.width) + ('-' + elm$core$String$fromInt(position.height)))))));
						var modernGrid = _class + ('{' + (modernPosition + '}'));
						var supports = '@supports (display:grid) {' + (modernGrid + '}');
						var base = _class + ('{' + (msPosition + '}'));
						return _Utils_ap(base, supports);
					case 'PseudoSelector':
						var _class = rule.a;
						var styles = rule.b;
						var renderPseudoRule = function (style) {
							return A2(
								renderStyleRule,
								style,
								elm$core$Maybe$Just(_class));
						};
						return A2(
							elm$core$String$join,
							' ',
							A2(elm$core$List$map, renderPseudoRule, styles));
					default:
						var transform = rule.a;
						var val = mdgriffith$elm_ui$Internal$Model$transformValue(transform);
						var _class = mdgriffith$elm_ui$Internal$Model$transformClass(transform);
						var _n12 = _Utils_Tuple2(_class, val);
						if ((_n12.a.$ === 'Just') && (_n12.b.$ === 'Just')) {
							var cls = _n12.a.a;
							var v = _n12.b.a;
							return A3(
								renderStyle,
								maybePseudo,
								'.' + cls,
								_List_fromArray(
									[
										A2(mdgriffith$elm_ui$Internal$Model$Property, 'transform', v)
									]));
						} else {
							return '';
						}
				}
			});
		var combine = F2(
			function (style, rendered) {
				return {
					rules: _Utils_ap(
						rendered.rules,
						A2(renderStyleRule, style, elm$core$Maybe$Nothing)),
					topLevel: function () {
						var _n14 = mdgriffith$elm_ui$Internal$Model$topLevelValue(style);
						if (_n14.$ === 'Nothing') {
							return rendered.topLevel;
						} else {
							var topLevel = _n14.a;
							return A2(elm$core$List$cons, topLevel, rendered.topLevel);
						}
					}()
				};
			});
		var _n13 = A3(
			elm$core$List$foldl,
			combine,
			{rules: '', topLevel: _List_Nil},
			stylesheet);
		var topLevel = _n13.topLevel;
		var rules = _n13.rules;
		return _Utils_ap(
			mdgriffith$elm_ui$Internal$Model$renderTopLevelValues(topLevel),
			rules);
	});
var mdgriffith$elm_ui$Internal$Model$toStyleSheet = F2(
	function (options, styleSheet) {
		return A3(
			elm$virtual_dom$VirtualDom$node,
			'style',
			_List_Nil,
			_List_fromArray(
				[
					elm$virtual_dom$VirtualDom$text(
					A2(mdgriffith$elm_ui$Internal$Model$toStyleSheetString, options, styleSheet))
				]));
	});
var mdgriffith$elm_ui$Internal$Model$embedKeyed = F4(
	function (_static, opts, styles, children) {
		return _static ? A2(
			elm$core$List$cons,
			_Utils_Tuple2('static-stylesheet', mdgriffith$elm_ui$Internal$Model$staticRoot),
			A2(
				elm$core$List$cons,
				_Utils_Tuple2(
					'dynamic-stylesheet',
					A2(
						mdgriffith$elm_ui$Internal$Model$toStyleSheet,
						opts,
						A3(
							elm$core$List$foldl,
							mdgriffith$elm_ui$Internal$Model$reduceStyles,
							_Utils_Tuple2(
								elm$core$Set$empty,
								_List_fromArray(
									[
										mdgriffith$elm_ui$Internal$Model$renderFocusStyle(opts.focus)
									])),
							styles).b)),
				children)) : A2(
			elm$core$List$cons,
			_Utils_Tuple2(
				'dynamic-stylesheet',
				A2(
					mdgriffith$elm_ui$Internal$Model$toStyleSheet,
					opts,
					A3(
						elm$core$List$foldl,
						mdgriffith$elm_ui$Internal$Model$reduceStyles,
						_Utils_Tuple2(
							elm$core$Set$empty,
							_List_fromArray(
								[
									mdgriffith$elm_ui$Internal$Model$renderFocusStyle(opts.focus)
								])),
						styles).b)),
			children);
	});
var mdgriffith$elm_ui$Internal$Model$embedWith = F4(
	function (_static, opts, styles, children) {
		return _static ? A2(
			elm$core$List$cons,
			mdgriffith$elm_ui$Internal$Model$staticRoot,
			A2(
				elm$core$List$cons,
				A2(
					mdgriffith$elm_ui$Internal$Model$toStyleSheet,
					opts,
					A3(
						elm$core$List$foldl,
						mdgriffith$elm_ui$Internal$Model$reduceStyles,
						_Utils_Tuple2(
							elm$core$Set$empty,
							_List_fromArray(
								[
									mdgriffith$elm_ui$Internal$Model$renderFocusStyle(opts.focus)
								])),
						styles).b),
				children)) : A2(
			elm$core$List$cons,
			A2(
				mdgriffith$elm_ui$Internal$Model$toStyleSheet,
				opts,
				A3(
					elm$core$List$foldl,
					mdgriffith$elm_ui$Internal$Model$reduceStyles,
					_Utils_Tuple2(
						elm$core$Set$empty,
						_List_fromArray(
							[
								mdgriffith$elm_ui$Internal$Model$renderFocusStyle(opts.focus)
							])),
					styles).b),
			children);
	});
var mdgriffith$elm_ui$Internal$Model$finalizeNode = F6(
	function (has, node, attributes, children, embedMode, parentContext) {
		var createNode = F2(
			function (nodeName, attrs) {
				if (children.$ === 'Keyed') {
					var keyed = children.a;
					return A3(
						elm$virtual_dom$VirtualDom$keyedNode,
						nodeName,
						attrs,
						function () {
							switch (embedMode.$) {
								case 'NoStyleSheet':
									return keyed;
								case 'OnlyDynamic':
									var opts = embedMode.a;
									var styles = embedMode.b;
									return A4(mdgriffith$elm_ui$Internal$Model$embedKeyed, false, opts, styles, keyed);
								default:
									var opts = embedMode.a;
									var styles = embedMode.b;
									return A4(mdgriffith$elm_ui$Internal$Model$embedKeyed, true, opts, styles, keyed);
							}
						}());
				} else {
					var unkeyed = children.a;
					return A2(
						function () {
							switch (nodeName) {
								case 'div':
									return elm$html$Html$div;
								case 'p':
									return elm$html$Html$p;
								default:
									return elm$virtual_dom$VirtualDom$node(nodeName);
							}
						}(),
						attrs,
						function () {
							switch (embedMode.$) {
								case 'NoStyleSheet':
									return unkeyed;
								case 'OnlyDynamic':
									var opts = embedMode.a;
									var styles = embedMode.b;
									return A4(mdgriffith$elm_ui$Internal$Model$embedWith, false, opts, styles, unkeyed);
								default:
									var opts = embedMode.a;
									var styles = embedMode.b;
									return A4(mdgriffith$elm_ui$Internal$Model$embedWith, true, opts, styles, unkeyed);
							}
						}());
				}
			});
		var html = function () {
			switch (node.$) {
				case 'Generic':
					return A2(createNode, 'div', attributes);
				case 'NodeName':
					var nodeName = node.a;
					return A2(createNode, nodeName, attributes);
				default:
					var nodeName = node.a;
					var internal = node.b;
					return A3(
						elm$virtual_dom$VirtualDom$node,
						nodeName,
						attributes,
						_List_fromArray(
							[
								A2(
								createNode,
								internal,
								_List_fromArray(
									[
										elm$html$Html$Attributes$class(mdgriffith$elm_ui$Internal$Style$classes.any + (' ' + mdgriffith$elm_ui$Internal$Style$classes.single))
									]))
							]));
			}
		}();
		switch (parentContext.$) {
			case 'AsRow':
				return (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$widthFill, has) && (!A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$widthBetween, has))) ? html : (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$alignRight, has) ? A2(
					elm$html$Html$u,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class(
							A2(
								elm$core$String$join,
								' ',
								_List_fromArray(
									[mdgriffith$elm_ui$Internal$Style$classes.any, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.container, mdgriffith$elm_ui$Internal$Style$classes.contentCenterY, mdgriffith$elm_ui$Internal$Style$classes.alignContainerRight])))
						]),
					_List_fromArray(
						[html])) : (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$centerX, has) ? A2(
					elm$html$Html$s,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class(
							A2(
								elm$core$String$join,
								' ',
								_List_fromArray(
									[mdgriffith$elm_ui$Internal$Style$classes.any, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.container, mdgriffith$elm_ui$Internal$Style$classes.contentCenterY, mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterX])))
						]),
					_List_fromArray(
						[html])) : html));
			case 'AsColumn':
				return (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$heightFill, has) && (!A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$heightBetween, has))) ? html : (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$centerY, has) ? A2(
					elm$html$Html$s,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class(
							A2(
								elm$core$String$join,
								' ',
								_List_fromArray(
									[mdgriffith$elm_ui$Internal$Style$classes.any, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.container, mdgriffith$elm_ui$Internal$Style$classes.alignContainerCenterY])))
						]),
					_List_fromArray(
						[html])) : (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$alignBottom, has) ? A2(
					elm$html$Html$u,
					_List_fromArray(
						[
							elm$html$Html$Attributes$class(
							A2(
								elm$core$String$join,
								' ',
								_List_fromArray(
									[mdgriffith$elm_ui$Internal$Style$classes.any, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.container, mdgriffith$elm_ui$Internal$Style$classes.alignContainerBottom])))
						]),
					_List_fromArray(
						[html])) : html));
			default:
				return html;
		}
	});
var elm$html$Html$text = elm$virtual_dom$VirtualDom$text;
var mdgriffith$elm_ui$Internal$Model$textElement = function (str) {
	return A2(
		elm$html$Html$div,
		_List_fromArray(
			[
				elm$html$Html$Attributes$class(
				A2(
					elm$core$String$join,
					' ',
					_List_fromArray(
						[mdgriffith$elm_ui$Internal$Style$classes.any, mdgriffith$elm_ui$Internal$Style$classes.text, mdgriffith$elm_ui$Internal$Style$classes.widthContent, mdgriffith$elm_ui$Internal$Style$classes.heightContent])))
			]),
		_List_fromArray(
			[
				elm$html$Html$text(str)
			]));
};
var mdgriffith$elm_ui$Internal$Model$textElementFill = function (str) {
	return A3(
		elm$virtual_dom$VirtualDom$node,
		'div',
		_List_fromArray(
			[
				elm$html$Html$Attributes$class(
				A2(
					elm$core$String$join,
					' ',
					_List_fromArray(
						[mdgriffith$elm_ui$Internal$Style$classes.any, mdgriffith$elm_ui$Internal$Style$classes.text, mdgriffith$elm_ui$Internal$Style$classes.widthFill, mdgriffith$elm_ui$Internal$Style$classes.heightFill])))
			]),
		_List_fromArray(
			[
				elm$virtual_dom$VirtualDom$text(str)
			]));
};
var mdgriffith$elm_ui$Internal$Model$createElement = F3(
	function (context, children, rendered) {
		var gatherKeyed = F2(
			function (_n8, _n9) {
				var key = _n8.a;
				var child = _n8.b;
				var htmls = _n9.a;
				var existingStyles = _n9.b;
				switch (child.$) {
					case 'Unstyled':
						var html = child.a;
						return _Utils_eq(context, mdgriffith$elm_ui$Internal$Model$asParagraph) ? _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								_Utils_Tuple2(
									key,
									html(context)),
								htmls),
							existingStyles) : _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								_Utils_Tuple2(
									key,
									html(context)),
								htmls),
							existingStyles);
					case 'Styled':
						var styled = child.a;
						return _Utils_eq(context, mdgriffith$elm_ui$Internal$Model$asParagraph) ? _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								_Utils_Tuple2(
									key,
									A2(styled.html, mdgriffith$elm_ui$Internal$Model$NoStyleSheet, context)),
								htmls),
							elm$core$List$isEmpty(existingStyles) ? styled.styles : _Utils_ap(styled.styles, existingStyles)) : _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								_Utils_Tuple2(
									key,
									A2(styled.html, mdgriffith$elm_ui$Internal$Model$NoStyleSheet, context)),
								htmls),
							elm$core$List$isEmpty(existingStyles) ? styled.styles : _Utils_ap(styled.styles, existingStyles));
					case 'Text':
						var str = child.a;
						return _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								_Utils_Tuple2(
									key,
									_Utils_eq(context, mdgriffith$elm_ui$Internal$Model$asEl) ? mdgriffith$elm_ui$Internal$Model$textElementFill(str) : mdgriffith$elm_ui$Internal$Model$textElement(str)),
								htmls),
							existingStyles);
					default:
						return _Utils_Tuple2(htmls, existingStyles);
				}
			});
		var gather = F2(
			function (child, _n6) {
				var htmls = _n6.a;
				var existingStyles = _n6.b;
				switch (child.$) {
					case 'Unstyled':
						var html = child.a;
						return _Utils_eq(context, mdgriffith$elm_ui$Internal$Model$asParagraph) ? _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								html(context),
								htmls),
							existingStyles) : _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								html(context),
								htmls),
							existingStyles);
					case 'Styled':
						var styled = child.a;
						return _Utils_eq(context, mdgriffith$elm_ui$Internal$Model$asParagraph) ? _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								A2(styled.html, mdgriffith$elm_ui$Internal$Model$NoStyleSheet, context),
								htmls),
							elm$core$List$isEmpty(existingStyles) ? styled.styles : _Utils_ap(styled.styles, existingStyles)) : _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								A2(styled.html, mdgriffith$elm_ui$Internal$Model$NoStyleSheet, context),
								htmls),
							elm$core$List$isEmpty(existingStyles) ? styled.styles : _Utils_ap(styled.styles, existingStyles));
					case 'Text':
						var str = child.a;
						return _Utils_Tuple2(
							A2(
								elm$core$List$cons,
								_Utils_eq(context, mdgriffith$elm_ui$Internal$Model$asEl) ? mdgriffith$elm_ui$Internal$Model$textElementFill(str) : mdgriffith$elm_ui$Internal$Model$textElement(str),
								htmls),
							existingStyles);
					default:
						return _Utils_Tuple2(htmls, existingStyles);
				}
			});
		if (children.$ === 'Keyed') {
			var keyedChildren = children.a;
			var _n1 = A3(
				elm$core$List$foldr,
				gatherKeyed,
				_Utils_Tuple2(_List_Nil, _List_Nil),
				keyedChildren);
			var keyed = _n1.a;
			var styles = _n1.b;
			var newStyles = elm$core$List$isEmpty(styles) ? rendered.styles : _Utils_ap(rendered.styles, styles);
			if (!newStyles.b) {
				return mdgriffith$elm_ui$Internal$Model$Unstyled(
					A5(
						mdgriffith$elm_ui$Internal$Model$finalizeNode,
						rendered.has,
						rendered.node,
						rendered.attributes,
						mdgriffith$elm_ui$Internal$Model$Keyed(
							A3(mdgriffith$elm_ui$Internal$Model$addKeyedChildren, 'nearby-element-pls', keyed, rendered.children)),
						mdgriffith$elm_ui$Internal$Model$NoStyleSheet));
			} else {
				var allStyles = newStyles;
				return mdgriffith$elm_ui$Internal$Model$Styled(
					{
						html: A4(
							mdgriffith$elm_ui$Internal$Model$finalizeNode,
							rendered.has,
							rendered.node,
							rendered.attributes,
							mdgriffith$elm_ui$Internal$Model$Keyed(
								A3(mdgriffith$elm_ui$Internal$Model$addKeyedChildren, 'nearby-element-pls', keyed, rendered.children))),
						styles: allStyles
					});
			}
		} else {
			var unkeyedChildren = children.a;
			var _n3 = A3(
				elm$core$List$foldr,
				gather,
				_Utils_Tuple2(_List_Nil, _List_Nil),
				unkeyedChildren);
			var unkeyed = _n3.a;
			var styles = _n3.b;
			var newStyles = elm$core$List$isEmpty(styles) ? rendered.styles : _Utils_ap(rendered.styles, styles);
			if (!newStyles.b) {
				return mdgriffith$elm_ui$Internal$Model$Unstyled(
					A5(
						mdgriffith$elm_ui$Internal$Model$finalizeNode,
						rendered.has,
						rendered.node,
						rendered.attributes,
						mdgriffith$elm_ui$Internal$Model$Unkeyed(
							A2(mdgriffith$elm_ui$Internal$Model$addChildren, unkeyed, rendered.children)),
						mdgriffith$elm_ui$Internal$Model$NoStyleSheet));
			} else {
				var allStyles = newStyles;
				return mdgriffith$elm_ui$Internal$Model$Styled(
					{
						html: A4(
							mdgriffith$elm_ui$Internal$Model$finalizeNode,
							rendered.has,
							rendered.node,
							rendered.attributes,
							mdgriffith$elm_ui$Internal$Model$Unkeyed(
								A2(mdgriffith$elm_ui$Internal$Model$addChildren, unkeyed, rendered.children))),
						styles: allStyles
					});
			}
		}
	});
var elm$virtual_dom$VirtualDom$attribute = F2(
	function (key, value) {
		return A2(
			_VirtualDom_attribute,
			_VirtualDom_noOnOrFormAction(key),
			_VirtualDom_noJavaScriptOrHtmlUri(value));
	});
var elm$core$Bitwise$or = _Bitwise_or;
var mdgriffith$elm_ui$Internal$Flag$add = F2(
	function (myFlag, _n0) {
		var one = _n0.a;
		var two = _n0.b;
		if (myFlag.$ === 'Flag') {
			var first = myFlag.a;
			return A2(mdgriffith$elm_ui$Internal$Flag$Field, first | one, two);
		} else {
			var second = myFlag.a;
			return A2(mdgriffith$elm_ui$Internal$Flag$Field, one, second | two);
		}
	});
var mdgriffith$elm_ui$Internal$Flag$height = mdgriffith$elm_ui$Internal$Flag$flag(7);
var mdgriffith$elm_ui$Internal$Flag$heightContent = mdgriffith$elm_ui$Internal$Flag$flag(36);
var mdgriffith$elm_ui$Internal$Flag$merge = F2(
	function (_n0, _n1) {
		var one = _n0.a;
		var two = _n0.b;
		var three = _n1.a;
		var four = _n1.b;
		return A2(mdgriffith$elm_ui$Internal$Flag$Field, one | three, two | four);
	});
var mdgriffith$elm_ui$Internal$Flag$width = mdgriffith$elm_ui$Internal$Flag$flag(6);
var mdgriffith$elm_ui$Internal$Flag$widthContent = mdgriffith$elm_ui$Internal$Flag$flag(38);
var mdgriffith$elm_ui$Internal$Flag$xAlign = mdgriffith$elm_ui$Internal$Flag$flag(30);
var mdgriffith$elm_ui$Internal$Flag$yAlign = mdgriffith$elm_ui$Internal$Flag$flag(29);
var mdgriffith$elm_ui$Internal$Model$Embedded = F2(
	function (a, b) {
		return {$: 'Embedded', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Model$NodeName = function (a) {
	return {$: 'NodeName', a: a};
};
var mdgriffith$elm_ui$Internal$Model$Single = F3(
	function (a, b, c) {
		return {$: 'Single', a: a, b: b, c: c};
	});
var mdgriffith$elm_ui$Internal$Model$Transform = function (a) {
	return {$: 'Transform', a: a};
};
var mdgriffith$elm_ui$Internal$Model$ChildrenBehind = function (a) {
	return {$: 'ChildrenBehind', a: a};
};
var mdgriffith$elm_ui$Internal$Model$ChildrenBehindAndInFront = F2(
	function (a, b) {
		return {$: 'ChildrenBehindAndInFront', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Model$ChildrenInFront = function (a) {
	return {$: 'ChildrenInFront', a: a};
};
var mdgriffith$elm_ui$Internal$Model$nearbyElement = F2(
	function (location, elem) {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					elm$html$Html$Attributes$class(
					function () {
						switch (location.$) {
							case 'Above':
								return A2(
									elm$core$String$join,
									' ',
									_List_fromArray(
										[mdgriffith$elm_ui$Internal$Style$classes.nearby, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.above]));
							case 'Below':
								return A2(
									elm$core$String$join,
									' ',
									_List_fromArray(
										[mdgriffith$elm_ui$Internal$Style$classes.nearby, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.below]));
							case 'OnRight':
								return A2(
									elm$core$String$join,
									' ',
									_List_fromArray(
										[mdgriffith$elm_ui$Internal$Style$classes.nearby, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.onRight]));
							case 'OnLeft':
								return A2(
									elm$core$String$join,
									' ',
									_List_fromArray(
										[mdgriffith$elm_ui$Internal$Style$classes.nearby, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.onLeft]));
							case 'InFront':
								return A2(
									elm$core$String$join,
									' ',
									_List_fromArray(
										[mdgriffith$elm_ui$Internal$Style$classes.nearby, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.inFront]));
							default:
								return A2(
									elm$core$String$join,
									' ',
									_List_fromArray(
										[mdgriffith$elm_ui$Internal$Style$classes.nearby, mdgriffith$elm_ui$Internal$Style$classes.single, mdgriffith$elm_ui$Internal$Style$classes.behind]));
						}
					}())
				]),
			_List_fromArray(
				[
					function () {
					switch (elem.$) {
						case 'Empty':
							return elm$virtual_dom$VirtualDom$text('');
						case 'Text':
							var str = elem.a;
							return mdgriffith$elm_ui$Internal$Model$textElement(str);
						case 'Unstyled':
							var html = elem.a;
							return html(mdgriffith$elm_ui$Internal$Model$asEl);
						default:
							var styled = elem.a;
							return A2(styled.html, mdgriffith$elm_ui$Internal$Model$NoStyleSheet, mdgriffith$elm_ui$Internal$Model$asEl);
					}
				}()
				]));
	});
var mdgriffith$elm_ui$Internal$Model$addNearbyElement = F3(
	function (location, elem, existing) {
		var nearby = A2(mdgriffith$elm_ui$Internal$Model$nearbyElement, location, elem);
		switch (existing.$) {
			case 'NoNearbyChildren':
				if (location.$ === 'Behind') {
					return mdgriffith$elm_ui$Internal$Model$ChildrenBehind(
						_List_fromArray(
							[nearby]));
				} else {
					return mdgriffith$elm_ui$Internal$Model$ChildrenInFront(
						_List_fromArray(
							[nearby]));
				}
			case 'ChildrenBehind':
				var existingBehind = existing.a;
				if (location.$ === 'Behind') {
					return mdgriffith$elm_ui$Internal$Model$ChildrenBehind(
						A2(elm$core$List$cons, nearby, existingBehind));
				} else {
					return A2(
						mdgriffith$elm_ui$Internal$Model$ChildrenBehindAndInFront,
						existingBehind,
						_List_fromArray(
							[nearby]));
				}
			case 'ChildrenInFront':
				var existingInFront = existing.a;
				if (location.$ === 'Behind') {
					return A2(
						mdgriffith$elm_ui$Internal$Model$ChildrenBehindAndInFront,
						_List_fromArray(
							[nearby]),
						existingInFront);
				} else {
					return mdgriffith$elm_ui$Internal$Model$ChildrenInFront(
						A2(elm$core$List$cons, nearby, existingInFront));
				}
			default:
				var existingBehind = existing.a;
				var existingInFront = existing.b;
				if (location.$ === 'Behind') {
					return A2(
						mdgriffith$elm_ui$Internal$Model$ChildrenBehindAndInFront,
						A2(elm$core$List$cons, nearby, existingBehind),
						existingInFront);
				} else {
					return A2(
						mdgriffith$elm_ui$Internal$Model$ChildrenBehindAndInFront,
						existingBehind,
						A2(elm$core$List$cons, nearby, existingInFront));
				}
		}
	});
var mdgriffith$elm_ui$Internal$Model$addNodeName = F2(
	function (newNode, old) {
		switch (old.$) {
			case 'Generic':
				return mdgriffith$elm_ui$Internal$Model$NodeName(newNode);
			case 'NodeName':
				var name = old.a;
				return A2(mdgriffith$elm_ui$Internal$Model$Embedded, name, newNode);
			default:
				var x = old.a;
				var y = old.b;
				return A2(mdgriffith$elm_ui$Internal$Model$Embedded, x, y);
		}
	});
var mdgriffith$elm_ui$Internal$Model$alignXName = function (align) {
	switch (align.$) {
		case 'Left':
			return mdgriffith$elm_ui$Internal$Style$classes.alignedHorizontally + (' ' + mdgriffith$elm_ui$Internal$Style$classes.alignLeft);
		case 'Right':
			return mdgriffith$elm_ui$Internal$Style$classes.alignedHorizontally + (' ' + mdgriffith$elm_ui$Internal$Style$classes.alignRight);
		default:
			return mdgriffith$elm_ui$Internal$Style$classes.alignedHorizontally + (' ' + mdgriffith$elm_ui$Internal$Style$classes.alignCenterX);
	}
};
var mdgriffith$elm_ui$Internal$Model$alignYName = function (align) {
	switch (align.$) {
		case 'Top':
			return mdgriffith$elm_ui$Internal$Style$classes.alignedVertically + (' ' + mdgriffith$elm_ui$Internal$Style$classes.alignTop);
		case 'Bottom':
			return mdgriffith$elm_ui$Internal$Style$classes.alignedVertically + (' ' + mdgriffith$elm_ui$Internal$Style$classes.alignBottom);
		default:
			return mdgriffith$elm_ui$Internal$Style$classes.alignedVertically + (' ' + mdgriffith$elm_ui$Internal$Style$classes.alignCenterY);
	}
};
var mdgriffith$elm_ui$Internal$Model$FullTransform = F4(
	function (a, b, c, d) {
		return {$: 'FullTransform', a: a, b: b, c: c, d: d};
	});
var mdgriffith$elm_ui$Internal$Model$Moved = function (a) {
	return {$: 'Moved', a: a};
};
var mdgriffith$elm_ui$Internal$Model$composeTransformation = F2(
	function (transform, component) {
		switch (transform.$) {
			case 'Untransformed':
				switch (component.$) {
					case 'MoveX':
						var x = component.a;
						return mdgriffith$elm_ui$Internal$Model$Moved(
							_Utils_Tuple3(x, 0, 0));
					case 'MoveY':
						var y = component.a;
						return mdgriffith$elm_ui$Internal$Model$Moved(
							_Utils_Tuple3(0, y, 0));
					case 'MoveZ':
						var z = component.a;
						return mdgriffith$elm_ui$Internal$Model$Moved(
							_Utils_Tuple3(0, 0, z));
					case 'MoveXYZ':
						var xyz = component.a;
						return mdgriffith$elm_ui$Internal$Model$Moved(xyz);
					case 'Rotate':
						var xyz = component.a;
						var angle = component.b;
						return A4(
							mdgriffith$elm_ui$Internal$Model$FullTransform,
							_Utils_Tuple3(0, 0, 0),
							_Utils_Tuple3(1, 1, 1),
							xyz,
							angle);
					default:
						var xyz = component.a;
						return A4(
							mdgriffith$elm_ui$Internal$Model$FullTransform,
							_Utils_Tuple3(0, 0, 0),
							xyz,
							_Utils_Tuple3(0, 0, 1),
							0);
				}
			case 'Moved':
				var moved = transform.a;
				var x = moved.a;
				var y = moved.b;
				var z = moved.c;
				switch (component.$) {
					case 'MoveX':
						var newX = component.a;
						return mdgriffith$elm_ui$Internal$Model$Moved(
							_Utils_Tuple3(newX, y, z));
					case 'MoveY':
						var newY = component.a;
						return mdgriffith$elm_ui$Internal$Model$Moved(
							_Utils_Tuple3(x, newY, z));
					case 'MoveZ':
						var newZ = component.a;
						return mdgriffith$elm_ui$Internal$Model$Moved(
							_Utils_Tuple3(x, y, newZ));
					case 'MoveXYZ':
						var xyz = component.a;
						return mdgriffith$elm_ui$Internal$Model$Moved(xyz);
					case 'Rotate':
						var xyz = component.a;
						var angle = component.b;
						return A4(
							mdgriffith$elm_ui$Internal$Model$FullTransform,
							moved,
							_Utils_Tuple3(1, 1, 1),
							xyz,
							angle);
					default:
						var scale = component.a;
						return A4(
							mdgriffith$elm_ui$Internal$Model$FullTransform,
							moved,
							scale,
							_Utils_Tuple3(0, 0, 1),
							0);
				}
			default:
				var moved = transform.a;
				var x = moved.a;
				var y = moved.b;
				var z = moved.c;
				var scaled = transform.b;
				var origin = transform.c;
				var angle = transform.d;
				switch (component.$) {
					case 'MoveX':
						var newX = component.a;
						return A4(
							mdgriffith$elm_ui$Internal$Model$FullTransform,
							_Utils_Tuple3(newX, y, z),
							scaled,
							origin,
							angle);
					case 'MoveY':
						var newY = component.a;
						return A4(
							mdgriffith$elm_ui$Internal$Model$FullTransform,
							_Utils_Tuple3(x, newY, z),
							scaled,
							origin,
							angle);
					case 'MoveZ':
						var newZ = component.a;
						return A4(
							mdgriffith$elm_ui$Internal$Model$FullTransform,
							_Utils_Tuple3(x, y, newZ),
							scaled,
							origin,
							angle);
					case 'MoveXYZ':
						var newMove = component.a;
						return A4(mdgriffith$elm_ui$Internal$Model$FullTransform, newMove, scaled, origin, angle);
					case 'Rotate':
						var newOrigin = component.a;
						var newAngle = component.b;
						return A4(mdgriffith$elm_ui$Internal$Model$FullTransform, moved, scaled, newOrigin, newAngle);
					default:
						var newScale = component.a;
						return A4(mdgriffith$elm_ui$Internal$Model$FullTransform, moved, newScale, origin, angle);
				}
		}
	});
var mdgriffith$elm_ui$Internal$Model$renderHeight = function (h) {
	switch (h.$) {
		case 'Px':
			var px = h.a;
			var val = elm$core$String$fromInt(px);
			var name = 'height-px-' + val;
			return _Utils_Tuple3(
				mdgriffith$elm_ui$Internal$Flag$none,
				name,
				_List_fromArray(
					[
						A3(mdgriffith$elm_ui$Internal$Model$Single, name, 'height', val + 'px')
					]));
		case 'Content':
			return _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$heightContent, mdgriffith$elm_ui$Internal$Flag$none),
				mdgriffith$elm_ui$Internal$Style$classes.heightContent,
				_List_Nil);
		case 'Fill':
			var portion = h.a;
			return (portion === 1) ? _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$heightFill, mdgriffith$elm_ui$Internal$Flag$none),
				mdgriffith$elm_ui$Internal$Style$classes.heightFill,
				_List_Nil) : _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$heightFill, mdgriffith$elm_ui$Internal$Flag$none),
				mdgriffith$elm_ui$Internal$Style$classes.heightFillPortion + (' height-fill-' + elm$core$String$fromInt(portion)),
				_List_fromArray(
					[
						A3(
						mdgriffith$elm_ui$Internal$Model$Single,
						mdgriffith$elm_ui$Internal$Style$classes.any + ('.' + (mdgriffith$elm_ui$Internal$Style$classes.row + (' > ' + mdgriffith$elm_ui$Internal$Style$dot(
							'height-fill-' + elm$core$String$fromInt(portion))))),
						'flex-grow',
						elm$core$String$fromInt(portion * 100000))
					]));
		case 'Min':
			var minSize = h.a;
			var len = h.b;
			var cls = 'min-height-' + elm$core$String$fromInt(minSize);
			var style = A3(
				mdgriffith$elm_ui$Internal$Model$Single,
				cls,
				'min-height',
				elm$core$String$fromInt(minSize) + 'px');
			var _n1 = mdgriffith$elm_ui$Internal$Model$renderHeight(len);
			var newFlag = _n1.a;
			var newAttrs = _n1.b;
			var newStyle = _n1.c;
			return _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$heightBetween, newFlag),
				cls + (' ' + newAttrs),
				A2(elm$core$List$cons, style, newStyle));
		default:
			var maxSize = h.a;
			var len = h.b;
			var cls = 'max-height-' + elm$core$String$fromInt(maxSize);
			var style = A3(
				mdgriffith$elm_ui$Internal$Model$Single,
				cls,
				'max-height',
				elm$core$String$fromInt(maxSize) + 'px');
			var _n2 = mdgriffith$elm_ui$Internal$Model$renderHeight(len);
			var newFlag = _n2.a;
			var newAttrs = _n2.b;
			var newStyle = _n2.c;
			return _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$heightBetween, newFlag),
				cls + (' ' + newAttrs),
				A2(elm$core$List$cons, style, newStyle));
	}
};
var mdgriffith$elm_ui$Internal$Model$renderWidth = function (w) {
	switch (w.$) {
		case 'Px':
			var px = w.a;
			return _Utils_Tuple3(
				mdgriffith$elm_ui$Internal$Flag$none,
				mdgriffith$elm_ui$Internal$Style$classes.widthExact + (' width-px-' + elm$core$String$fromInt(px)),
				_List_fromArray(
					[
						A3(
						mdgriffith$elm_ui$Internal$Model$Single,
						'width-px-' + elm$core$String$fromInt(px),
						'width',
						elm$core$String$fromInt(px) + 'px')
					]));
		case 'Content':
			return _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$widthContent, mdgriffith$elm_ui$Internal$Flag$none),
				mdgriffith$elm_ui$Internal$Style$classes.widthContent,
				_List_Nil);
		case 'Fill':
			var portion = w.a;
			return (portion === 1) ? _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$widthFill, mdgriffith$elm_ui$Internal$Flag$none),
				mdgriffith$elm_ui$Internal$Style$classes.widthFill,
				_List_Nil) : _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$widthFill, mdgriffith$elm_ui$Internal$Flag$none),
				mdgriffith$elm_ui$Internal$Style$classes.widthFillPortion + (' width-fill-' + elm$core$String$fromInt(portion)),
				_List_fromArray(
					[
						A3(
						mdgriffith$elm_ui$Internal$Model$Single,
						mdgriffith$elm_ui$Internal$Style$classes.any + ('.' + (mdgriffith$elm_ui$Internal$Style$classes.row + (' > ' + mdgriffith$elm_ui$Internal$Style$dot(
							'width-fill-' + elm$core$String$fromInt(portion))))),
						'flex-grow',
						elm$core$String$fromInt(portion * 100000))
					]));
		case 'Min':
			var minSize = w.a;
			var len = w.b;
			var cls = 'min-width-' + elm$core$String$fromInt(minSize);
			var style = A3(
				mdgriffith$elm_ui$Internal$Model$Single,
				cls,
				'min-width',
				elm$core$String$fromInt(minSize) + 'px');
			var _n1 = mdgriffith$elm_ui$Internal$Model$renderWidth(len);
			var newFlag = _n1.a;
			var newAttrs = _n1.b;
			var newStyle = _n1.c;
			return _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$widthBetween, newFlag),
				cls + (' ' + newAttrs),
				A2(elm$core$List$cons, style, newStyle));
		default:
			var maxSize = w.a;
			var len = w.b;
			var cls = 'max-width-' + elm$core$String$fromInt(maxSize);
			var style = A3(
				mdgriffith$elm_ui$Internal$Model$Single,
				cls,
				'max-width',
				elm$core$String$fromInt(maxSize) + 'px');
			var _n2 = mdgriffith$elm_ui$Internal$Model$renderWidth(len);
			var newFlag = _n2.a;
			var newAttrs = _n2.b;
			var newStyle = _n2.c;
			return _Utils_Tuple3(
				A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$widthBetween, newFlag),
				cls + (' ' + newAttrs),
				A2(elm$core$List$cons, style, newStyle));
	}
};
var elm$core$Basics$ge = _Utils_ge;
var mdgriffith$elm_ui$Internal$Flag$borderWidth = mdgriffith$elm_ui$Internal$Flag$flag(27);
var mdgriffith$elm_ui$Internal$Model$skippable = F2(
	function (flag, style) {
		if (_Utils_eq(flag, mdgriffith$elm_ui$Internal$Flag$borderWidth)) {
			if (style.$ === 'Single') {
				var val = style.c;
				switch (val) {
					case '0px':
						return true;
					case '1px':
						return true;
					case '2px':
						return true;
					case '3px':
						return true;
					case '4px':
						return true;
					case '5px':
						return true;
					case '6px':
						return true;
					default:
						return false;
				}
			} else {
				return false;
			}
		} else {
			switch (style.$) {
				case 'FontSize':
					var i = style.a;
					return (i >= 8) && (i <= 32);
				case 'PaddingStyle':
					var name = style.a;
					var t = style.b;
					var r = style.c;
					var b = style.d;
					var l = style.e;
					return _Utils_eq(t, b) && (_Utils_eq(t, r) && (_Utils_eq(t, l) && ((t >= 0) && (t <= 24))));
				default:
					return false;
			}
		}
	});
var mdgriffith$elm_ui$Internal$Model$gatherAttrRecursive = F8(
	function (classes, node, has, transform, styles, attrs, children, elementAttrs) {
		gatherAttrRecursive:
		while (true) {
			if (!elementAttrs.b) {
				var _n1 = mdgriffith$elm_ui$Internal$Model$transformClass(transform);
				if (_n1.$ === 'Nothing') {
					return {
						attributes: A2(
							elm$core$List$cons,
							elm$html$Html$Attributes$class(classes),
							attrs),
						children: children,
						has: has,
						node: node,
						styles: styles
					};
				} else {
					var _class = _n1.a;
					return {
						attributes: A2(
							elm$core$List$cons,
							elm$html$Html$Attributes$class(classes + (' ' + _class)),
							attrs),
						children: children,
						has: has,
						node: node,
						styles: A2(
							elm$core$List$cons,
							mdgriffith$elm_ui$Internal$Model$Transform(transform),
							styles)
					};
				}
			} else {
				var attribute = elementAttrs.a;
				var remaining = elementAttrs.b;
				switch (attribute.$) {
					case 'NoAttribute':
						var $temp$classes = classes,
							$temp$node = node,
							$temp$has = has,
							$temp$transform = transform,
							$temp$styles = styles,
							$temp$attrs = attrs,
							$temp$children = children,
							$temp$elementAttrs = remaining;
						classes = $temp$classes;
						node = $temp$node;
						has = $temp$has;
						transform = $temp$transform;
						styles = $temp$styles;
						attrs = $temp$attrs;
						children = $temp$children;
						elementAttrs = $temp$elementAttrs;
						continue gatherAttrRecursive;
					case 'Class':
						var flag = attribute.a;
						var exactClassName = attribute.b;
						if (A2(mdgriffith$elm_ui$Internal$Flag$present, flag, has)) {
							var $temp$classes = classes,
								$temp$node = node,
								$temp$has = has,
								$temp$transform = transform,
								$temp$styles = styles,
								$temp$attrs = attrs,
								$temp$children = children,
								$temp$elementAttrs = remaining;
							classes = $temp$classes;
							node = $temp$node;
							has = $temp$has;
							transform = $temp$transform;
							styles = $temp$styles;
							attrs = $temp$attrs;
							children = $temp$children;
							elementAttrs = $temp$elementAttrs;
							continue gatherAttrRecursive;
						} else {
							var $temp$classes = exactClassName + (' ' + classes),
								$temp$node = node,
								$temp$has = A2(mdgriffith$elm_ui$Internal$Flag$add, flag, has),
								$temp$transform = transform,
								$temp$styles = styles,
								$temp$attrs = attrs,
								$temp$children = children,
								$temp$elementAttrs = remaining;
							classes = $temp$classes;
							node = $temp$node;
							has = $temp$has;
							transform = $temp$transform;
							styles = $temp$styles;
							attrs = $temp$attrs;
							children = $temp$children;
							elementAttrs = $temp$elementAttrs;
							continue gatherAttrRecursive;
						}
					case 'Attr':
						var actualAttribute = attribute.a;
						var $temp$classes = classes,
							$temp$node = node,
							$temp$has = has,
							$temp$transform = transform,
							$temp$styles = styles,
							$temp$attrs = A2(elm$core$List$cons, actualAttribute, attrs),
							$temp$children = children,
							$temp$elementAttrs = remaining;
						classes = $temp$classes;
						node = $temp$node;
						has = $temp$has;
						transform = $temp$transform;
						styles = $temp$styles;
						attrs = $temp$attrs;
						children = $temp$children;
						elementAttrs = $temp$elementAttrs;
						continue gatherAttrRecursive;
					case 'StyleClass':
						var flag = attribute.a;
						var style = attribute.b;
						if (A2(mdgriffith$elm_ui$Internal$Flag$present, flag, has)) {
							var $temp$classes = classes,
								$temp$node = node,
								$temp$has = has,
								$temp$transform = transform,
								$temp$styles = styles,
								$temp$attrs = attrs,
								$temp$children = children,
								$temp$elementAttrs = remaining;
							classes = $temp$classes;
							node = $temp$node;
							has = $temp$has;
							transform = $temp$transform;
							styles = $temp$styles;
							attrs = $temp$attrs;
							children = $temp$children;
							elementAttrs = $temp$elementAttrs;
							continue gatherAttrRecursive;
						} else {
							if (A2(mdgriffith$elm_ui$Internal$Model$skippable, flag, style)) {
								var $temp$classes = mdgriffith$elm_ui$Internal$Model$getStyleName(style) + (' ' + classes),
									$temp$node = node,
									$temp$has = A2(mdgriffith$elm_ui$Internal$Flag$add, flag, has),
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = attrs,
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							} else {
								var $temp$classes = mdgriffith$elm_ui$Internal$Model$getStyleName(style) + (' ' + classes),
									$temp$node = node,
									$temp$has = A2(mdgriffith$elm_ui$Internal$Flag$add, flag, has),
									$temp$transform = transform,
									$temp$styles = A2(elm$core$List$cons, style, styles),
									$temp$attrs = attrs,
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							}
						}
					case 'TransformComponent':
						var flag = attribute.a;
						var component = attribute.b;
						var $temp$classes = classes,
							$temp$node = node,
							$temp$has = A2(mdgriffith$elm_ui$Internal$Flag$add, flag, has),
							$temp$transform = A2(mdgriffith$elm_ui$Internal$Model$composeTransformation, transform, component),
							$temp$styles = styles,
							$temp$attrs = attrs,
							$temp$children = children,
							$temp$elementAttrs = remaining;
						classes = $temp$classes;
						node = $temp$node;
						has = $temp$has;
						transform = $temp$transform;
						styles = $temp$styles;
						attrs = $temp$attrs;
						children = $temp$children;
						elementAttrs = $temp$elementAttrs;
						continue gatherAttrRecursive;
					case 'Width':
						var width = attribute.a;
						if (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$width, has)) {
							var $temp$classes = classes,
								$temp$node = node,
								$temp$has = has,
								$temp$transform = transform,
								$temp$styles = styles,
								$temp$attrs = attrs,
								$temp$children = children,
								$temp$elementAttrs = remaining;
							classes = $temp$classes;
							node = $temp$node;
							has = $temp$has;
							transform = $temp$transform;
							styles = $temp$styles;
							attrs = $temp$attrs;
							children = $temp$children;
							elementAttrs = $temp$elementAttrs;
							continue gatherAttrRecursive;
						} else {
							switch (width.$) {
								case 'Px':
									var px = width.a;
									var $temp$classes = (mdgriffith$elm_ui$Internal$Style$classes.widthExact + (' width-px-' + elm$core$String$fromInt(px))) + (' ' + classes),
										$temp$node = node,
										$temp$has = A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$width, has),
										$temp$transform = transform,
										$temp$styles = A2(
										elm$core$List$cons,
										A3(
											mdgriffith$elm_ui$Internal$Model$Single,
											'width-px-' + elm$core$String$fromInt(px),
											'width',
											elm$core$String$fromInt(px) + 'px'),
										styles),
										$temp$attrs = attrs,
										$temp$children = children,
										$temp$elementAttrs = remaining;
									classes = $temp$classes;
									node = $temp$node;
									has = $temp$has;
									transform = $temp$transform;
									styles = $temp$styles;
									attrs = $temp$attrs;
									children = $temp$children;
									elementAttrs = $temp$elementAttrs;
									continue gatherAttrRecursive;
								case 'Content':
									var $temp$classes = classes + (' ' + mdgriffith$elm_ui$Internal$Style$classes.widthContent),
										$temp$node = node,
										$temp$has = A2(
										mdgriffith$elm_ui$Internal$Flag$add,
										mdgriffith$elm_ui$Internal$Flag$widthContent,
										A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$width, has)),
										$temp$transform = transform,
										$temp$styles = styles,
										$temp$attrs = attrs,
										$temp$children = children,
										$temp$elementAttrs = remaining;
									classes = $temp$classes;
									node = $temp$node;
									has = $temp$has;
									transform = $temp$transform;
									styles = $temp$styles;
									attrs = $temp$attrs;
									children = $temp$children;
									elementAttrs = $temp$elementAttrs;
									continue gatherAttrRecursive;
								case 'Fill':
									var portion = width.a;
									if (portion === 1) {
										var $temp$classes = classes + (' ' + mdgriffith$elm_ui$Internal$Style$classes.widthFill),
											$temp$node = node,
											$temp$has = A2(
											mdgriffith$elm_ui$Internal$Flag$add,
											mdgriffith$elm_ui$Internal$Flag$widthFill,
											A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$width, has)),
											$temp$transform = transform,
											$temp$styles = styles,
											$temp$attrs = attrs,
											$temp$children = children,
											$temp$elementAttrs = remaining;
										classes = $temp$classes;
										node = $temp$node;
										has = $temp$has;
										transform = $temp$transform;
										styles = $temp$styles;
										attrs = $temp$attrs;
										children = $temp$children;
										elementAttrs = $temp$elementAttrs;
										continue gatherAttrRecursive;
									} else {
										var $temp$classes = classes + (' ' + (mdgriffith$elm_ui$Internal$Style$classes.widthFillPortion + (' width-fill-' + elm$core$String$fromInt(portion)))),
											$temp$node = node,
											$temp$has = A2(
											mdgriffith$elm_ui$Internal$Flag$add,
											mdgriffith$elm_ui$Internal$Flag$widthFill,
											A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$width, has)),
											$temp$transform = transform,
											$temp$styles = A2(
											elm$core$List$cons,
											A3(
												mdgriffith$elm_ui$Internal$Model$Single,
												mdgriffith$elm_ui$Internal$Style$classes.any + ('.' + (mdgriffith$elm_ui$Internal$Style$classes.row + (' > ' + mdgriffith$elm_ui$Internal$Style$dot(
													'width-fill-' + elm$core$String$fromInt(portion))))),
												'flex-grow',
												elm$core$String$fromInt(portion * 100000)),
											styles),
											$temp$attrs = attrs,
											$temp$children = children,
											$temp$elementAttrs = remaining;
										classes = $temp$classes;
										node = $temp$node;
										has = $temp$has;
										transform = $temp$transform;
										styles = $temp$styles;
										attrs = $temp$attrs;
										children = $temp$children;
										elementAttrs = $temp$elementAttrs;
										continue gatherAttrRecursive;
									}
								default:
									var _n4 = mdgriffith$elm_ui$Internal$Model$renderWidth(width);
									var addToFlags = _n4.a;
									var newClass = _n4.b;
									var newStyles = _n4.c;
									var $temp$classes = classes + (' ' + newClass),
										$temp$node = node,
										$temp$has = A2(mdgriffith$elm_ui$Internal$Flag$merge, addToFlags, has),
										$temp$transform = transform,
										$temp$styles = _Utils_ap(newStyles, styles),
										$temp$attrs = attrs,
										$temp$children = children,
										$temp$elementAttrs = remaining;
									classes = $temp$classes;
									node = $temp$node;
									has = $temp$has;
									transform = $temp$transform;
									styles = $temp$styles;
									attrs = $temp$attrs;
									children = $temp$children;
									elementAttrs = $temp$elementAttrs;
									continue gatherAttrRecursive;
							}
						}
					case 'Height':
						var height = attribute.a;
						if (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$height, has)) {
							var $temp$classes = classes,
								$temp$node = node,
								$temp$has = has,
								$temp$transform = transform,
								$temp$styles = styles,
								$temp$attrs = attrs,
								$temp$children = children,
								$temp$elementAttrs = remaining;
							classes = $temp$classes;
							node = $temp$node;
							has = $temp$has;
							transform = $temp$transform;
							styles = $temp$styles;
							attrs = $temp$attrs;
							children = $temp$children;
							elementAttrs = $temp$elementAttrs;
							continue gatherAttrRecursive;
						} else {
							switch (height.$) {
								case 'Px':
									var px = height.a;
									var val = elm$core$String$fromInt(px) + 'px';
									var name = 'height-px-' + val;
									var $temp$classes = name + (' ' + classes),
										$temp$node = node,
										$temp$has = A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$height, has),
										$temp$transform = transform,
										$temp$styles = A2(
										elm$core$List$cons,
										A3(mdgriffith$elm_ui$Internal$Model$Single, name, 'height ', val),
										styles),
										$temp$attrs = attrs,
										$temp$children = children,
										$temp$elementAttrs = remaining;
									classes = $temp$classes;
									node = $temp$node;
									has = $temp$has;
									transform = $temp$transform;
									styles = $temp$styles;
									attrs = $temp$attrs;
									children = $temp$children;
									elementAttrs = $temp$elementAttrs;
									continue gatherAttrRecursive;
								case 'Content':
									var $temp$classes = mdgriffith$elm_ui$Internal$Style$classes.heightContent + (' ' + classes),
										$temp$node = node,
										$temp$has = A2(
										mdgriffith$elm_ui$Internal$Flag$add,
										mdgriffith$elm_ui$Internal$Flag$heightContent,
										A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$height, has)),
										$temp$transform = transform,
										$temp$styles = styles,
										$temp$attrs = attrs,
										$temp$children = children,
										$temp$elementAttrs = remaining;
									classes = $temp$classes;
									node = $temp$node;
									has = $temp$has;
									transform = $temp$transform;
									styles = $temp$styles;
									attrs = $temp$attrs;
									children = $temp$children;
									elementAttrs = $temp$elementAttrs;
									continue gatherAttrRecursive;
								case 'Fill':
									var portion = height.a;
									if (portion === 1) {
										var $temp$classes = mdgriffith$elm_ui$Internal$Style$classes.heightFill + (' ' + classes),
											$temp$node = node,
											$temp$has = A2(
											mdgriffith$elm_ui$Internal$Flag$add,
											mdgriffith$elm_ui$Internal$Flag$heightFill,
											A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$height, has)),
											$temp$transform = transform,
											$temp$styles = styles,
											$temp$attrs = attrs,
											$temp$children = children,
											$temp$elementAttrs = remaining;
										classes = $temp$classes;
										node = $temp$node;
										has = $temp$has;
										transform = $temp$transform;
										styles = $temp$styles;
										attrs = $temp$attrs;
										children = $temp$children;
										elementAttrs = $temp$elementAttrs;
										continue gatherAttrRecursive;
									} else {
										var $temp$classes = classes + (' ' + (mdgriffith$elm_ui$Internal$Style$classes.heightFillPortion + (' height-fill-' + elm$core$String$fromInt(portion)))),
											$temp$node = node,
											$temp$has = A2(
											mdgriffith$elm_ui$Internal$Flag$add,
											mdgriffith$elm_ui$Internal$Flag$heightFill,
											A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$height, has)),
											$temp$transform = transform,
											$temp$styles = A2(
											elm$core$List$cons,
											A3(
												mdgriffith$elm_ui$Internal$Model$Single,
												mdgriffith$elm_ui$Internal$Style$classes.any + ('.' + (mdgriffith$elm_ui$Internal$Style$classes.column + (' > ' + mdgriffith$elm_ui$Internal$Style$dot(
													'height-fill-' + elm$core$String$fromInt(portion))))),
												'flex-grow',
												elm$core$String$fromInt(portion * 100000)),
											styles),
											$temp$attrs = attrs,
											$temp$children = children,
											$temp$elementAttrs = remaining;
										classes = $temp$classes;
										node = $temp$node;
										has = $temp$has;
										transform = $temp$transform;
										styles = $temp$styles;
										attrs = $temp$attrs;
										children = $temp$children;
										elementAttrs = $temp$elementAttrs;
										continue gatherAttrRecursive;
									}
								default:
									var _n6 = mdgriffith$elm_ui$Internal$Model$renderHeight(height);
									var addToFlags = _n6.a;
									var newClass = _n6.b;
									var newStyles = _n6.c;
									var $temp$classes = classes + (' ' + newClass),
										$temp$node = node,
										$temp$has = A2(mdgriffith$elm_ui$Internal$Flag$merge, addToFlags, has),
										$temp$transform = transform,
										$temp$styles = _Utils_ap(newStyles, styles),
										$temp$attrs = attrs,
										$temp$children = children,
										$temp$elementAttrs = remaining;
									classes = $temp$classes;
									node = $temp$node;
									has = $temp$has;
									transform = $temp$transform;
									styles = $temp$styles;
									attrs = $temp$attrs;
									children = $temp$children;
									elementAttrs = $temp$elementAttrs;
									continue gatherAttrRecursive;
							}
						}
					case 'Describe':
						var description = attribute.a;
						switch (description.$) {
							case 'Main':
								var $temp$classes = classes,
									$temp$node = A2(mdgriffith$elm_ui$Internal$Model$addNodeName, 'main', node),
									$temp$has = has,
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = attrs,
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							case 'Navigation':
								var $temp$classes = classes,
									$temp$node = A2(mdgriffith$elm_ui$Internal$Model$addNodeName, 'nav', node),
									$temp$has = has,
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = attrs,
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							case 'ContentInfo':
								var $temp$classes = classes,
									$temp$node = A2(mdgriffith$elm_ui$Internal$Model$addNodeName, 'footer', node),
									$temp$has = has,
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = attrs,
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							case 'Complementary':
								var $temp$classes = classes,
									$temp$node = A2(mdgriffith$elm_ui$Internal$Model$addNodeName, 'aside', node),
									$temp$has = has,
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = attrs,
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							case 'Heading':
								var i = description.a;
								if (i <= 1) {
									var $temp$classes = classes,
										$temp$node = A2(mdgriffith$elm_ui$Internal$Model$addNodeName, 'h1', node),
										$temp$has = has,
										$temp$transform = transform,
										$temp$styles = styles,
										$temp$attrs = attrs,
										$temp$children = children,
										$temp$elementAttrs = remaining;
									classes = $temp$classes;
									node = $temp$node;
									has = $temp$has;
									transform = $temp$transform;
									styles = $temp$styles;
									attrs = $temp$attrs;
									children = $temp$children;
									elementAttrs = $temp$elementAttrs;
									continue gatherAttrRecursive;
								} else {
									if (i < 7) {
										var $temp$classes = classes,
											$temp$node = A2(
											mdgriffith$elm_ui$Internal$Model$addNodeName,
											'h' + elm$core$String$fromInt(i),
											node),
											$temp$has = has,
											$temp$transform = transform,
											$temp$styles = styles,
											$temp$attrs = attrs,
											$temp$children = children,
											$temp$elementAttrs = remaining;
										classes = $temp$classes;
										node = $temp$node;
										has = $temp$has;
										transform = $temp$transform;
										styles = $temp$styles;
										attrs = $temp$attrs;
										children = $temp$children;
										elementAttrs = $temp$elementAttrs;
										continue gatherAttrRecursive;
									} else {
										var $temp$classes = classes,
											$temp$node = A2(mdgriffith$elm_ui$Internal$Model$addNodeName, 'h6', node),
											$temp$has = has,
											$temp$transform = transform,
											$temp$styles = styles,
											$temp$attrs = attrs,
											$temp$children = children,
											$temp$elementAttrs = remaining;
										classes = $temp$classes;
										node = $temp$node;
										has = $temp$has;
										transform = $temp$transform;
										styles = $temp$styles;
										attrs = $temp$attrs;
										children = $temp$children;
										elementAttrs = $temp$elementAttrs;
										continue gatherAttrRecursive;
									}
								}
							case 'Paragraph':
								var newNode = function () {
									switch (node.$) {
										case 'Generic':
											return mdgriffith$elm_ui$Internal$Model$NodeName('p');
										case 'NodeName':
											var name = node.a;
											return mdgriffith$elm_ui$Internal$Model$NodeName(name);
										default:
											var x = node.a;
											var y = node.b;
											return A2(mdgriffith$elm_ui$Internal$Model$Embedded, x, y);
									}
								}();
								var $temp$classes = classes,
									$temp$node = newNode,
									$temp$has = has,
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = attrs,
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							case 'Button':
								var $temp$classes = classes,
									$temp$node = node,
									$temp$has = has,
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = A2(
									elm$core$List$cons,
									A2(elm$virtual_dom$VirtualDom$attribute, 'role', 'button'),
									attrs),
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							case 'Label':
								var label = description.a;
								var $temp$classes = classes,
									$temp$node = node,
									$temp$has = has,
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = A2(
									elm$core$List$cons,
									A2(elm$virtual_dom$VirtualDom$attribute, 'aria-label', label),
									attrs),
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							case 'LivePolite':
								var $temp$classes = classes,
									$temp$node = node,
									$temp$has = has,
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = A2(
									elm$core$List$cons,
									A2(elm$virtual_dom$VirtualDom$attribute, 'aria-live', 'polite'),
									attrs),
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
							default:
								var $temp$classes = classes,
									$temp$node = node,
									$temp$has = has,
									$temp$transform = transform,
									$temp$styles = styles,
									$temp$attrs = A2(
									elm$core$List$cons,
									A2(elm$virtual_dom$VirtualDom$attribute, 'aria-live', 'assertive'),
									attrs),
									$temp$children = children,
									$temp$elementAttrs = remaining;
								classes = $temp$classes;
								node = $temp$node;
								has = $temp$has;
								transform = $temp$transform;
								styles = $temp$styles;
								attrs = $temp$attrs;
								children = $temp$children;
								elementAttrs = $temp$elementAttrs;
								continue gatherAttrRecursive;
						}
					case 'Nearby':
						var location = attribute.a;
						var elem = attribute.b;
						var newStyles = function () {
							switch (elem.$) {
								case 'Empty':
									return styles;
								case 'Text':
									var str = elem.a;
									return styles;
								case 'Unstyled':
									var html = elem.a;
									return styles;
								default:
									var styled = elem.a;
									return _Utils_ap(styles, styled.styles);
							}
						}();
						var $temp$classes = classes,
							$temp$node = node,
							$temp$has = has,
							$temp$transform = transform,
							$temp$styles = newStyles,
							$temp$attrs = attrs,
							$temp$children = A3(mdgriffith$elm_ui$Internal$Model$addNearbyElement, location, elem, children),
							$temp$elementAttrs = remaining;
						classes = $temp$classes;
						node = $temp$node;
						has = $temp$has;
						transform = $temp$transform;
						styles = $temp$styles;
						attrs = $temp$attrs;
						children = $temp$children;
						elementAttrs = $temp$elementAttrs;
						continue gatherAttrRecursive;
					case 'AlignX':
						var x = attribute.a;
						if (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$xAlign, has)) {
							var $temp$classes = classes,
								$temp$node = node,
								$temp$has = has,
								$temp$transform = transform,
								$temp$styles = styles,
								$temp$attrs = attrs,
								$temp$children = children,
								$temp$elementAttrs = remaining;
							classes = $temp$classes;
							node = $temp$node;
							has = $temp$has;
							transform = $temp$transform;
							styles = $temp$styles;
							attrs = $temp$attrs;
							children = $temp$children;
							elementAttrs = $temp$elementAttrs;
							continue gatherAttrRecursive;
						} else {
							var $temp$classes = mdgriffith$elm_ui$Internal$Model$alignXName(x) + (' ' + classes),
								$temp$node = node,
								$temp$has = function (flags) {
								switch (x.$) {
									case 'CenterX':
										return A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$centerX, flags);
									case 'Right':
										return A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$alignRight, flags);
									default:
										return flags;
								}
							}(
								A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$xAlign, has)),
								$temp$transform = transform,
								$temp$styles = styles,
								$temp$attrs = attrs,
								$temp$children = children,
								$temp$elementAttrs = remaining;
							classes = $temp$classes;
							node = $temp$node;
							has = $temp$has;
							transform = $temp$transform;
							styles = $temp$styles;
							attrs = $temp$attrs;
							children = $temp$children;
							elementAttrs = $temp$elementAttrs;
							continue gatherAttrRecursive;
						}
					default:
						var y = attribute.a;
						if (A2(mdgriffith$elm_ui$Internal$Flag$present, mdgriffith$elm_ui$Internal$Flag$yAlign, has)) {
							var $temp$classes = classes,
								$temp$node = node,
								$temp$has = has,
								$temp$transform = transform,
								$temp$styles = styles,
								$temp$attrs = attrs,
								$temp$children = children,
								$temp$elementAttrs = remaining;
							classes = $temp$classes;
							node = $temp$node;
							has = $temp$has;
							transform = $temp$transform;
							styles = $temp$styles;
							attrs = $temp$attrs;
							children = $temp$children;
							elementAttrs = $temp$elementAttrs;
							continue gatherAttrRecursive;
						} else {
							var $temp$classes = mdgriffith$elm_ui$Internal$Model$alignYName(y) + (' ' + classes),
								$temp$node = node,
								$temp$has = function (flags) {
								switch (y.$) {
									case 'CenterY':
										return A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$centerY, flags);
									case 'Bottom':
										return A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$alignBottom, flags);
									default:
										return flags;
								}
							}(
								A2(mdgriffith$elm_ui$Internal$Flag$add, mdgriffith$elm_ui$Internal$Flag$yAlign, has)),
								$temp$transform = transform,
								$temp$styles = styles,
								$temp$attrs = attrs,
								$temp$children = children,
								$temp$elementAttrs = remaining;
							classes = $temp$classes;
							node = $temp$node;
							has = $temp$has;
							transform = $temp$transform;
							styles = $temp$styles;
							attrs = $temp$attrs;
							children = $temp$children;
							elementAttrs = $temp$elementAttrs;
							continue gatherAttrRecursive;
						}
				}
			}
		}
	});
var mdgriffith$elm_ui$Internal$Model$Untransformed = {$: 'Untransformed'};
var mdgriffith$elm_ui$Internal$Model$untransformed = mdgriffith$elm_ui$Internal$Model$Untransformed;
var mdgriffith$elm_ui$Internal$Model$element = F4(
	function (context, node, attributes, children) {
		return A3(
			mdgriffith$elm_ui$Internal$Model$createElement,
			context,
			children,
			A8(
				mdgriffith$elm_ui$Internal$Model$gatherAttrRecursive,
				mdgriffith$elm_ui$Internal$Model$contextClasses(context),
				node,
				mdgriffith$elm_ui$Internal$Flag$none,
				mdgriffith$elm_ui$Internal$Model$untransformed,
				_List_Nil,
				_List_Nil,
				mdgriffith$elm_ui$Internal$Model$NoNearbyChildren,
				elm$core$List$reverse(attributes)));
	});
var mdgriffith$elm_ui$Element$paragraph = F2(
	function (attrs, children) {
		return A4(
			mdgriffith$elm_ui$Internal$Model$element,
			mdgriffith$elm_ui$Internal$Model$asParagraph,
			mdgriffith$elm_ui$Internal$Model$div,
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Internal$Model$Describe(mdgriffith$elm_ui$Internal$Model$Paragraph),
				A2(
					elm$core$List$cons,
					mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill),
					A2(
						elm$core$List$cons,
						mdgriffith$elm_ui$Element$spacing(5),
						attrs))),
			mdgriffith$elm_ui$Internal$Model$Unkeyed(children));
	});
var mdgriffith$elm_ui$Internal$Model$Text = function (a) {
	return {$: 'Text', a: a};
};
var mdgriffith$elm_ui$Element$text = function (content) {
	return mdgriffith$elm_ui$Internal$Model$Text(content);
};
var mdgriffith$elm_ui$Internal$Model$Max = F2(
	function (a, b) {
		return {$: 'Max', a: a, b: b};
	});
var mdgriffith$elm_ui$Element$maximum = F2(
	function (i, l) {
		return A2(mdgriffith$elm_ui$Internal$Model$Max, i, l);
	});
var mdgriffith$elm_ui$Internal$Model$Min = F2(
	function (a, b) {
		return {$: 'Min', a: a, b: b};
	});
var mdgriffith$elm_ui$Element$minimum = F2(
	function (i, l) {
		return A2(mdgriffith$elm_ui$Internal$Model$Min, i, l);
	});
var mdgriffith$elm_ui$Internal$Model$AsTextColumn = {$: 'AsTextColumn'};
var mdgriffith$elm_ui$Internal$Model$asTextColumn = mdgriffith$elm_ui$Internal$Model$AsTextColumn;
var mdgriffith$elm_ui$Element$textColumn = F2(
	function (attrs, children) {
		return A4(
			mdgriffith$elm_ui$Internal$Model$element,
			mdgriffith$elm_ui$Internal$Model$asTextColumn,
			mdgriffith$elm_ui$Internal$Model$div,
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Element$width(
					A2(
						mdgriffith$elm_ui$Element$maximum,
						750,
						A2(mdgriffith$elm_ui$Element$minimum, 500, mdgriffith$elm_ui$Element$fill))),
				attrs),
			mdgriffith$elm_ui$Internal$Model$Unkeyed(children));
	});
var mdgriffith$elm_ui$Internal$Flag$fontSize = mdgriffith$elm_ui$Internal$Flag$flag(4);
var mdgriffith$elm_ui$Internal$Model$FontSize = function (a) {
	return {$: 'FontSize', a: a};
};
var mdgriffith$elm_ui$Element$Font$size = function (i) {
	return A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$fontSize,
		mdgriffith$elm_ui$Internal$Model$FontSize(i));
};
var author$project$View$Home$aboutContent = function (model) {
	var fontSize = function () {
		var _n0 = model.device._class;
		switch (_n0.$) {
			case 'BigDesktop':
				return 35;
			case 'Desktop':
				return 20;
			case 'Tablet':
				var _n1 = model.device.orientation;
				if (_n1.$ === 'Portrait') {
					return 30;
				} else {
					return 25;
				}
			default:
				return 30;
		}
	}();
	return A2(
		mdgriffith$elm_ui$Element$textColumn,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$Font$size(fontSize),
				mdgriffith$elm_ui$Element$spacing(15)
			]),
		_List_fromArray(
			[
				A2(
				mdgriffith$elm_ui$Element$paragraph,
				_List_Nil,
				_List_fromArray(
					[
						mdgriffith$elm_ui$Element$text('my name is Joshua Ji.')
					])),
				A2(
				mdgriffith$elm_ui$Element$paragraph,
				_List_Nil,
				_List_fromArray(
					[
						mdgriffith$elm_ui$Element$text('I am a 17 year old high school student passionate about Computer Science.')
					])),
				A2(
				mdgriffith$elm_ui$Element$paragraph,
				_List_Nil,
				_List_fromArray(
					[
						mdgriffith$elm_ui$Element$text('I attend Old Scona Academic.')
					])),
				A2(
				mdgriffith$elm_ui$Element$paragraph,
				_List_Nil,
				_List_fromArray(
					[
						mdgriffith$elm_ui$Element$text('I program in Elm, Python and Java,')
					])),
				A2(
				mdgriffith$elm_ui$Element$paragraph,
				_List_Nil,
				_List_fromArray(
					[
						mdgriffith$elm_ui$Element$text('though I have ventured into HTML, CSS and Javascript.')
					]))
			]));
};
var mdgriffith$elm_ui$Internal$Model$Height = function (a) {
	return {$: 'Height', a: a};
};
var mdgriffith$elm_ui$Element$height = mdgriffith$elm_ui$Internal$Model$Height;
var mdgriffith$elm_ui$Internal$Model$Content = {$: 'Content'};
var mdgriffith$elm_ui$Element$shrink = mdgriffith$elm_ui$Internal$Model$Content;
var mdgriffith$elm_ui$Element$el = F2(
	function (attrs, child) {
		return A4(
			mdgriffith$elm_ui$Internal$Model$element,
			mdgriffith$elm_ui$Internal$Model$asEl,
			mdgriffith$elm_ui$Internal$Model$div,
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$shrink),
				A2(
					elm$core$List$cons,
					mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$shrink),
					attrs)),
			mdgriffith$elm_ui$Internal$Model$Unkeyed(
				_List_fromArray(
					[child])));
	});
var mdgriffith$elm_ui$Internal$Flag$fontWeight = mdgriffith$elm_ui$Internal$Flag$flag(13);
var mdgriffith$elm_ui$Internal$Model$Class = F2(
	function (a, b) {
		return {$: 'Class', a: a, b: b};
	});
var mdgriffith$elm_ui$Element$Font$bold = A2(mdgriffith$elm_ui$Internal$Model$Class, mdgriffith$elm_ui$Internal$Flag$fontWeight, mdgriffith$elm_ui$Internal$Style$classes.bold);
var author$project$View$Home$greeting = A2(
	mdgriffith$elm_ui$Element$el,
	_List_fromArray(
		[
			mdgriffith$elm_ui$Element$Font$size(55),
			mdgriffith$elm_ui$Element$Font$bold
		]),
	mdgriffith$elm_ui$Element$text('Hey,'));
var mdgriffith$elm_ui$Internal$Model$AsColumn = {$: 'AsColumn'};
var mdgriffith$elm_ui$Internal$Model$asColumn = mdgriffith$elm_ui$Internal$Model$AsColumn;
var mdgriffith$elm_ui$Internal$Model$Attr = function (a) {
	return {$: 'Attr', a: a};
};
var mdgriffith$elm_ui$Internal$Model$htmlClass = function (cls) {
	return mdgriffith$elm_ui$Internal$Model$Attr(
		elm$html$Html$Attributes$class(cls));
};
var mdgriffith$elm_ui$Element$column = F2(
	function (attrs, children) {
		return A4(
			mdgriffith$elm_ui$Internal$Model$element,
			mdgriffith$elm_ui$Internal$Model$asColumn,
			mdgriffith$elm_ui$Internal$Model$div,
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Internal$Model$htmlClass(mdgriffith$elm_ui$Internal$Style$classes.contentTop + (' ' + mdgriffith$elm_ui$Internal$Style$classes.contentLeft)),
				A2(
					elm$core$List$cons,
					mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$shrink),
					A2(
						elm$core$List$cons,
						mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$shrink),
						attrs))),
			mdgriffith$elm_ui$Internal$Model$Unkeyed(children));
	});
var mdgriffith$elm_ui$Element$fillPortion = mdgriffith$elm_ui$Internal$Model$Fill;
var author$project$View$Home$about = function (model) {
	return A2(
		mdgriffith$elm_ui$Element$column,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$spacing(20),
				mdgriffith$elm_ui$Element$width(
				mdgriffith$elm_ui$Element$fillPortion(1))
			]),
		_List_fromArray(
			[
				author$project$View$Home$greeting,
				author$project$View$Home$aboutContent(model)
			]));
};
var mdgriffith$elm_ui$Internal$Model$AlignX = function (a) {
	return {$: 'AlignX', a: a};
};
var mdgriffith$elm_ui$Internal$Model$Right = {$: 'Right'};
var mdgriffith$elm_ui$Element$alignRight = mdgriffith$elm_ui$Internal$Model$AlignX(mdgriffith$elm_ui$Internal$Model$Right);
var mdgriffith$elm_ui$Internal$Model$CenterX = {$: 'CenterX'};
var mdgriffith$elm_ui$Element$centerX = mdgriffith$elm_ui$Internal$Model$AlignX(mdgriffith$elm_ui$Internal$Model$CenterX);
var elm$html$Html$Attributes$alt = elm$html$Html$Attributes$stringProperty('alt');
var elm$html$Html$Attributes$src = function (url) {
	return A2(
		elm$html$Html$Attributes$stringProperty,
		'src',
		_VirtualDom_noJavaScriptOrHtmlUri(url));
};
var mdgriffith$elm_ui$Element$image = F2(
	function (attrs, _n0) {
		var src = _n0.src;
		var description = _n0.description;
		var imageAttributes = A2(
			elm$core$List$filter,
			function (a) {
				switch (a.$) {
					case 'Width':
						return true;
					case 'Height':
						return true;
					default:
						return false;
				}
			},
			attrs);
		return A4(
			mdgriffith$elm_ui$Internal$Model$element,
			mdgriffith$elm_ui$Internal$Model$asEl,
			mdgriffith$elm_ui$Internal$Model$div,
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Internal$Model$htmlClass(mdgriffith$elm_ui$Internal$Style$classes.imageContainer),
				attrs),
			mdgriffith$elm_ui$Internal$Model$Unkeyed(
				_List_fromArray(
					[
						A4(
						mdgriffith$elm_ui$Internal$Model$element,
						mdgriffith$elm_ui$Internal$Model$asEl,
						mdgriffith$elm_ui$Internal$Model$NodeName('img'),
						_Utils_ap(
							_List_fromArray(
								[
									mdgriffith$elm_ui$Internal$Model$Attr(
									elm$html$Html$Attributes$src(src)),
									mdgriffith$elm_ui$Internal$Model$Attr(
									elm$html$Html$Attributes$alt(description))
								]),
							imageAttributes),
						mdgriffith$elm_ui$Internal$Model$Unkeyed(_List_Nil))
					])));
	});
var author$project$View$Home$profilePic = function (model) {
	var _n0 = function () {
		var _n1 = model.device._class;
		switch (_n1.$) {
			case 'BigDesktop':
				return _Utils_Tuple2(500, mdgriffith$elm_ui$Element$alignRight);
			case 'Desktop':
				return _Utils_Tuple2(400, mdgriffith$elm_ui$Element$alignRight);
			case 'Tablet':
				return _Utils_Tuple2(400, mdgriffith$elm_ui$Element$centerX);
			default:
				return _Utils_Tuple2(300, mdgriffith$elm_ui$Element$centerX);
		}
	}();
	var maxSize = _n0.a;
	var alignment = _n0.b;
	return A2(
		mdgriffith$elm_ui$Element$image,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$width(
				A2(mdgriffith$elm_ui$Element$maximum, maxSize, mdgriffith$elm_ui$Element$fill)),
				alignment
			]),
		{description: 'Profile Pic', src: 'src/img/profile_pic.png'});
};
var mdgriffith$elm_ui$Internal$Flag$padding = mdgriffith$elm_ui$Internal$Flag$flag(2);
var mdgriffith$elm_ui$Internal$Model$PaddingStyle = F5(
	function (a, b, c, d, e) {
		return {$: 'PaddingStyle', a: a, b: b, c: c, d: d, e: e};
	});
var mdgriffith$elm_ui$Element$padding = function (x) {
	return A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$padding,
		A5(
			mdgriffith$elm_ui$Internal$Model$PaddingStyle,
			'p-' + elm$core$String$fromInt(x),
			x,
			x,
			x,
			x));
};
var author$project$View$Home$profilePicWrap = function (model) {
	var attributes = A2(
		elm$core$List$cons,
		_Utils_eq(model.device._class, mdgriffith$elm_ui$Element$Tablet) ? mdgriffith$elm_ui$Element$padding(30) : mdgriffith$elm_ui$Element$padding(0),
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$width(
				mdgriffith$elm_ui$Element$fillPortion(1))
			]));
	return A2(
		mdgriffith$elm_ui$Element$el,
		attributes,
		author$project$View$Home$profilePic(model));
};
var mdgriffith$elm_ui$Internal$Model$AsRow = {$: 'AsRow'};
var mdgriffith$elm_ui$Internal$Model$asRow = mdgriffith$elm_ui$Internal$Model$AsRow;
var mdgriffith$elm_ui$Element$row = F2(
	function (attrs, children) {
		return A4(
			mdgriffith$elm_ui$Internal$Model$element,
			mdgriffith$elm_ui$Internal$Model$asRow,
			mdgriffith$elm_ui$Internal$Model$div,
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Internal$Model$htmlClass(mdgriffith$elm_ui$Internal$Style$classes.contentLeft + (' ' + mdgriffith$elm_ui$Internal$Style$classes.contentCenterY)),
				A2(
					elm$core$List$cons,
					mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$shrink),
					A2(
						elm$core$List$cons,
						mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$shrink),
						attrs))),
			mdgriffith$elm_ui$Internal$Model$Unkeyed(children));
	});
var author$project$View$Home$desktopDisplay = F2(
	function (screenSize, model) {
		return A2(
			mdgriffith$elm_ui$Element$row,
			_List_fromArray(
				[
					mdgriffith$elm_ui$Element$padding(40),
					mdgriffith$elm_ui$Element$spacing(40),
					mdgriffith$elm_ui$Element$centerX
				]),
			_List_fromArray(
				[
					author$project$View$Home$profilePicWrap(model),
					author$project$View$Home$about(model)
				]));
	});
var author$project$View$Home$handheldDisplay = F2(
	function (screenSize, model) {
		var space = function () {
			if (screenSize.$ === 'Big') {
				return 40;
			} else {
				return 10;
			}
		}();
		return A2(
			mdgriffith$elm_ui$Element$column,
			_List_fromArray(
				[
					mdgriffith$elm_ui$Element$padding(space),
					mdgriffith$elm_ui$Element$spacing(space),
					mdgriffith$elm_ui$Element$centerX
				]),
			_List_fromArray(
				[
					author$project$View$Home$profilePicWrap(model),
					author$project$View$Home$about(model)
				]));
	});
var author$project$View$Home$view = function (model) {
	var _n0 = model.device._class;
	switch (_n0.$) {
		case 'BigDesktop':
			return A2(author$project$View$Home$desktopDisplay, author$project$View$Home$Big, model);
		case 'Desktop':
			return A2(author$project$View$Home$desktopDisplay, author$project$View$Home$Small, model);
		case 'Tablet':
			return A2(author$project$View$Home$handheldDisplay, author$project$View$Home$Big, model);
		default:
			return A2(author$project$View$Home$handheldDisplay, author$project$View$Home$Small, model);
	}
};
var author$project$View$NotFound$view = mdgriffith$elm_ui$Element$text('Looks like your page wasn\'t found!');
var mdgriffith$elm_ui$Internal$Flag$fontAlignment = mdgriffith$elm_ui$Internal$Flag$flag(12);
var mdgriffith$elm_ui$Element$Font$center = A2(mdgriffith$elm_ui$Internal$Model$Class, mdgriffith$elm_ui$Internal$Flag$fontAlignment, mdgriffith$elm_ui$Internal$Style$classes.textCenter);
var author$project$View$BlogPost$blogDate = function (dateStr) {
	return A2(
		mdgriffith$elm_ui$Element$paragraph,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$Font$center,
				mdgriffith$elm_ui$Element$Font$size(15)
			]),
		_Utils_ap(
			_List_fromArray(
				[
					mdgriffith$elm_ui$Element$text('Published on ')
				]),
			dateStr));
};
var mdgriffith$elm_ui$Element$Font$italic = mdgriffith$elm_ui$Internal$Model$htmlClass(mdgriffith$elm_ui$Internal$Style$classes.italic);
var author$project$View$BlogPost$blogSubtitle = function (subtitle) {
	return A2(
		mdgriffith$elm_ui$Element$paragraph,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$Font$center,
				mdgriffith$elm_ui$Element$Font$italic,
				mdgriffith$elm_ui$Element$Font$size(25)
			]),
		subtitle);
};
var author$project$View$BlogPost$blogTitle = function (title) {
	return A2(
		mdgriffith$elm_ui$Element$el,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$centerX,
				mdgriffith$elm_ui$Element$Font$size(40)
			]),
		mdgriffith$elm_ui$Element$text(title));
};
var author$project$View$BlogPost$applyTuple = F2(
	function (fn, _n0) {
		var one = _n0.a;
		var two = _n0.b;
		return A2(fn, one, two);
	});
var author$project$View$BlogPost$toAttributes = function (list) {
	return A2(
		elm$core$List$filterMap,
		function (_n0) {
			var attribute = _n0.a;
			var bool = _n0.b;
			return bool ? elm$core$Maybe$Just(attribute) : elm$core$Maybe$Nothing;
		},
		list);
};
var mdgriffith$elm_ui$Element$Font$strike = mdgriffith$elm_ui$Internal$Model$htmlClass(mdgriffith$elm_ui$Internal$Style$classes.strike);
var author$project$View$BlogPost$viewText = F2(
	function (styles, string) {
		return (styles.bold || (styles.italic || styles.strike)) ? A2(
			mdgriffith$elm_ui$Element$el,
			author$project$View$BlogPost$toAttributes(
				_List_fromArray(
					[
						_Utils_Tuple2(mdgriffith$elm_ui$Element$Font$bold, styles.bold),
						_Utils_Tuple2(mdgriffith$elm_ui$Element$Font$italic, styles.italic),
						_Utils_Tuple2(mdgriffith$elm_ui$Element$Font$strike, styles.strike)
					])),
			mdgriffith$elm_ui$Element$text(string)) : mdgriffith$elm_ui$Element$text(string);
	});
var mdgriffith$elm_markup$Mark$textToTuple = function (_n0) {
	var style = _n0.a;
	var str = _n0.b;
	return _Utils_Tuple2(style, str);
};
var mdgriffith$elm_markup$Mark$selectedText = function (sel) {
	switch (sel.$) {
		case 'EmptyAnnotation':
			return _List_Nil;
		case 'SelectText':
			var txts = sel.a;
			return A2(elm$core$List$map, mdgriffith$elm_markup$Mark$textToTuple, txts);
		default:
			return _List_Nil;
	}
};
var mdgriffith$elm_markup$Mark$Internal$Description$AnnotationNamed = function (a) {
	return {$: 'AnnotationNamed', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$ProtoRecord = function (a) {
	return {$: 'ProtoRecord', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$Uncertain = function (a) {
	return {$: 'Uncertain', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Outcome$Almost = function (a) {
	return {$: 'Almost', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$uncertain = function (err) {
	return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
		mdgriffith$elm_markup$Mark$Internal$Description$Uncertain(
			_Utils_Tuple2(err, _List_Nil)));
};
var mdgriffith$elm_markup$Mark$Internal$Error$NoMatch = {$: 'NoMatch'};
var mdgriffith$elm_markup$Mark$Internal$Outcome$Failure = function (a) {
	return {$: 'Failure', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Outcome$Success = function (a) {
	return {$: 'Success', a: a};
};
var mdgriffith$elm_markup$Mark$annotation = F2(
	function (name, view) {
		return mdgriffith$elm_markup$Mark$Internal$Description$ProtoRecord(
			{
				blockKind: mdgriffith$elm_markup$Mark$Internal$Description$AnnotationNamed(name),
				expectations: _List_Nil,
				fieldConverter: F2(
					function (desc, selected) {
						if (desc.$ === 'Record') {
							var details = desc.a;
							if (_Utils_eq(details.name, name)) {
								var _n1 = details.found;
								if (_n1.$ === 'Found') {
									var pos = _n1.a;
									var fieldDescriptions = _n1.b;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Success(
										_Utils_Tuple3(
											pos,
											fieldDescriptions,
											view(
												mdgriffith$elm_markup$Mark$selectedText(selected))));
								} else {
									var unexpected = _n1.a;
									return mdgriffith$elm_markup$Mark$Internal$Description$uncertain(unexpected);
								}
							} else {
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
							}
						} else {
							return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
						}
					}),
				fields: _List_Nil,
				name: name
			});
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$Balanced = function (a) {
	return {$: 'Balanced', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$Replacement = F2(
	function (a, b) {
		return {$: 'Replacement', a: a, b: b};
	});
var mdgriffith$elm_markup$Mark$commonReplacements = _List_fromArray(
	[
		A2(mdgriffith$elm_markup$Mark$Internal$Parser$Replacement, '...', '…'),
		A2(mdgriffith$elm_markup$Mark$Internal$Parser$Replacement, '<>', '\u00a0'),
		A2(mdgriffith$elm_markup$Mark$Internal$Parser$Replacement, '---', '—'),
		A2(mdgriffith$elm_markup$Mark$Internal$Parser$Replacement, '--', '–'),
		A2(mdgriffith$elm_markup$Mark$Internal$Parser$Replacement, '//', '/'),
		A2(mdgriffith$elm_markup$Mark$Internal$Parser$Replacement, '\'', '’'),
		mdgriffith$elm_markup$Mark$Internal$Parser$Balanced(
		{
			end: _Utils_Tuple2('\"', '”'),
			start: _Utils_Tuple2('\"', '“')
		})
	]);
var mdgriffith$elm_markup$Mark$Field = F2(
	function (a, b) {
		return {$: 'Field', a: a, b: b};
	});
var mdgriffith$elm_markup$Mark$Internal$Description$getBlockExpectation = function (fromBlock) {
	var expect = fromBlock.a.expect;
	return expect;
};
var mdgriffith$elm_markup$Mark$fieldExpectation = function (_n0) {
	var name = _n0.a;
	var fieldBlock = _n0.b;
	return _Utils_Tuple2(
		name,
		mdgriffith$elm_markup$Mark$Internal$Description$getBlockExpectation(fieldBlock));
};
var mdgriffith$elm_markup$Mark$fieldName = function (_n0) {
	var name = _n0.a;
	return name;
};
var elm$core$Bitwise$shiftRightBy = _Bitwise_shiftRightBy;
var elm$core$String$repeatHelp = F3(
	function (n, chunk, result) {
		return (n <= 0) ? result : A3(
			elm$core$String$repeatHelp,
			n >> 1,
			_Utils_ap(chunk, chunk),
			(!(n & 1)) ? result : _Utils_ap(result, chunk));
	});
var elm$core$String$repeat = F2(
	function (n, chunk) {
		return A3(elm$core$String$repeatHelp, n, chunk, '');
	});
var elm$parser$Parser$Advanced$Token = F2(
	function (a, b) {
		return {$: 'Token', a: a, b: b};
	});
var elm$parser$Parser$Advanced$Parser = function (a) {
	return {$: 'Parser', a: a};
};
var elm$parser$Parser$Advanced$Good = F3(
	function (a, b, c) {
		return {$: 'Good', a: a, b: b, c: c};
	});
var elm$parser$Parser$Advanced$isSubChar = _Parser_isSubChar;
var elm$parser$Parser$Advanced$chompWhileHelp = F5(
	function (isGood, offset, row, col, s0) {
		chompWhileHelp:
		while (true) {
			var newOffset = A3(elm$parser$Parser$Advanced$isSubChar, isGood, offset, s0.src);
			if (_Utils_eq(newOffset, -1)) {
				return A3(
					elm$parser$Parser$Advanced$Good,
					_Utils_cmp(s0.offset, offset) < 0,
					_Utils_Tuple0,
					{col: col, context: s0.context, indent: s0.indent, offset: offset, row: row, src: s0.src});
			} else {
				if (_Utils_eq(newOffset, -2)) {
					var $temp$isGood = isGood,
						$temp$offset = offset + 1,
						$temp$row = row + 1,
						$temp$col = 1,
						$temp$s0 = s0;
					isGood = $temp$isGood;
					offset = $temp$offset;
					row = $temp$row;
					col = $temp$col;
					s0 = $temp$s0;
					continue chompWhileHelp;
				} else {
					var $temp$isGood = isGood,
						$temp$offset = newOffset,
						$temp$row = row,
						$temp$col = col + 1,
						$temp$s0 = s0;
					isGood = $temp$isGood;
					offset = $temp$offset;
					row = $temp$row;
					col = $temp$col;
					s0 = $temp$s0;
					continue chompWhileHelp;
				}
			}
		}
	});
var elm$parser$Parser$Advanced$chompWhile = function (isGood) {
	return elm$parser$Parser$Advanced$Parser(
		function (s) {
			return A5(elm$parser$Parser$Advanced$chompWhileHelp, isGood, s.offset, s.row, s.col, s);
		});
};
var elm$core$Basics$always = F2(
	function (a, _n0) {
		return a;
	});
var elm$parser$Parser$Advanced$Bad = F2(
	function (a, b) {
		return {$: 'Bad', a: a, b: b};
	});
var elm$parser$Parser$Advanced$map2 = F3(
	function (func, _n0, _n1) {
		var parseA = _n0.a;
		var parseB = _n1.a;
		return elm$parser$Parser$Advanced$Parser(
			function (s0) {
				var _n2 = parseA(s0);
				if (_n2.$ === 'Bad') {
					var p = _n2.a;
					var x = _n2.b;
					return A2(elm$parser$Parser$Advanced$Bad, p, x);
				} else {
					var p1 = _n2.a;
					var a = _n2.b;
					var s1 = _n2.c;
					var _n3 = parseB(s1);
					if (_n3.$ === 'Bad') {
						var p2 = _n3.a;
						var x = _n3.b;
						return A2(elm$parser$Parser$Advanced$Bad, p1 || p2, x);
					} else {
						var p2 = _n3.a;
						var b = _n3.b;
						var s2 = _n3.c;
						return A3(
							elm$parser$Parser$Advanced$Good,
							p1 || p2,
							A2(func, a, b),
							s2);
					}
				}
			});
	});
var elm$parser$Parser$Advanced$ignorer = F2(
	function (keepParser, ignoreParser) {
		return A3(elm$parser$Parser$Advanced$map2, elm$core$Basics$always, keepParser, ignoreParser);
	});
var elm$parser$Parser$Advanced$Located = F3(
	function (row, col, context) {
		return {col: col, context: context, row: row};
	});
var elm$parser$Parser$Advanced$changeContext = F2(
	function (newContext, s) {
		return {col: s.col, context: newContext, indent: s.indent, offset: s.offset, row: s.row, src: s.src};
	});
var elm$parser$Parser$Advanced$inContext = F2(
	function (context, _n0) {
		var parse = _n0.a;
		return elm$parser$Parser$Advanced$Parser(
			function (s0) {
				var _n1 = parse(
					A2(
						elm$parser$Parser$Advanced$changeContext,
						A2(
							elm$core$List$cons,
							A3(elm$parser$Parser$Advanced$Located, s0.row, s0.col, context),
							s0.context),
						s0));
				if (_n1.$ === 'Good') {
					var p = _n1.a;
					var a = _n1.b;
					var s1 = _n1.c;
					return A3(
						elm$parser$Parser$Advanced$Good,
						p,
						a,
						A2(elm$parser$Parser$Advanced$changeContext, s0.context, s1));
				} else {
					var step = _n1;
					return step;
				}
			});
	});
var elm$parser$Parser$Advanced$keeper = F2(
	function (parseFunc, parseArg) {
		return A3(elm$parser$Parser$Advanced$map2, elm$core$Basics$apL, parseFunc, parseArg);
	});
var elm$parser$Parser$Advanced$map = F2(
	function (func, _n0) {
		var parse = _n0.a;
		return elm$parser$Parser$Advanced$Parser(
			function (s0) {
				var _n1 = parse(s0);
				if (_n1.$ === 'Good') {
					var p = _n1.a;
					var a = _n1.b;
					var s1 = _n1.c;
					return A3(
						elm$parser$Parser$Advanced$Good,
						p,
						func(a),
						s1);
				} else {
					var p = _n1.a;
					var x = _n1.b;
					return A2(elm$parser$Parser$Advanced$Bad, p, x);
				}
			});
	});
var elm$parser$Parser$Advanced$Empty = {$: 'Empty'};
var elm$parser$Parser$Advanced$Append = F2(
	function (a, b) {
		return {$: 'Append', a: a, b: b};
	});
var elm$parser$Parser$Advanced$oneOfHelp = F3(
	function (s0, bag, parsers) {
		oneOfHelp:
		while (true) {
			if (!parsers.b) {
				return A2(elm$parser$Parser$Advanced$Bad, false, bag);
			} else {
				var parse = parsers.a.a;
				var remainingParsers = parsers.b;
				var _n1 = parse(s0);
				if (_n1.$ === 'Good') {
					var step = _n1;
					return step;
				} else {
					var step = _n1;
					var p = step.a;
					var x = step.b;
					if (p) {
						return step;
					} else {
						var $temp$s0 = s0,
							$temp$bag = A2(elm$parser$Parser$Advanced$Append, bag, x),
							$temp$parsers = remainingParsers;
						s0 = $temp$s0;
						bag = $temp$bag;
						parsers = $temp$parsers;
						continue oneOfHelp;
					}
				}
			}
		}
	});
var elm$parser$Parser$Advanced$oneOf = function (parsers) {
	return elm$parser$Parser$Advanced$Parser(
		function (s) {
			return A3(elm$parser$Parser$Advanced$oneOfHelp, s, elm$parser$Parser$Advanced$Empty, parsers);
		});
};
var elm$parser$Parser$Advanced$succeed = function (a) {
	return elm$parser$Parser$Advanced$Parser(
		function (s) {
			return A3(elm$parser$Parser$Advanced$Good, false, a, s);
		});
};
var elm$parser$Parser$Advanced$AddRight = F2(
	function (a, b) {
		return {$: 'AddRight', a: a, b: b};
	});
var elm$parser$Parser$Advanced$DeadEnd = F4(
	function (row, col, problem, contextStack) {
		return {col: col, contextStack: contextStack, problem: problem, row: row};
	});
var elm$parser$Parser$Advanced$fromState = F2(
	function (s, x) {
		return A2(
			elm$parser$Parser$Advanced$AddRight,
			elm$parser$Parser$Advanced$Empty,
			A4(elm$parser$Parser$Advanced$DeadEnd, s.row, s.col, x, s.context));
	});
var elm$parser$Parser$Advanced$isSubString = _Parser_isSubString;
var elm$parser$Parser$Advanced$token = function (_n0) {
	var str = _n0.a;
	var expecting = _n0.b;
	var progress = !elm$core$String$isEmpty(str);
	return elm$parser$Parser$Advanced$Parser(
		function (s) {
			var _n1 = A5(elm$parser$Parser$Advanced$isSubString, str, s.offset, s.row, s.col, s.src);
			var newOffset = _n1.a;
			var newRow = _n1.b;
			var newCol = _n1.c;
			return _Utils_eq(newOffset, -1) ? A2(
				elm$parser$Parser$Advanced$Bad,
				false,
				A2(elm$parser$Parser$Advanced$fromState, s, expecting)) : A3(
				elm$parser$Parser$Advanced$Good,
				progress,
				_Utils_Tuple0,
				{col: newCol, context: s.context, indent: s.indent, offset: newOffset, row: newRow, src: s.src});
		});
};
var elm$parser$Parser$Advanced$changeIndent = F2(
	function (newIndent, s) {
		return {col: s.col, context: s.context, indent: newIndent, offset: s.offset, row: s.row, src: s.src};
	});
var elm$parser$Parser$Advanced$withIndent = F2(
	function (newIndent, _n0) {
		var parse = _n0.a;
		return elm$parser$Parser$Advanced$Parser(
			function (s0) {
				var _n1 = parse(
					A2(elm$parser$Parser$Advanced$changeIndent, newIndent, s0));
				if (_n1.$ === 'Good') {
					var p = _n1.a;
					var a = _n1.b;
					var s1 = _n1.c;
					return A3(
						elm$parser$Parser$Advanced$Good,
						p,
						a,
						A2(elm$parser$Parser$Advanced$changeIndent, s0.indent, s1));
				} else {
					var p = _n1.a;
					var x = _n1.b;
					return A2(elm$parser$Parser$Advanced$Bad, p, x);
				}
			});
	});
var mdgriffith$elm_markup$Mark$Internal$Description$Found = F2(
	function (a, b) {
		return {$: 'Found', a: a, b: b};
	});
var mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndentation = function (a) {
	return {$: 'ExpectingIndentation', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Error$InRecordField = function (a) {
	return {$: 'InRecordField', a: a};
};
var elm$parser$Parser$Advanced$andThen = F2(
	function (callback, _n0) {
		var parseA = _n0.a;
		return elm$parser$Parser$Advanced$Parser(
			function (s0) {
				var _n1 = parseA(s0);
				if (_n1.$ === 'Bad') {
					var p = _n1.a;
					var x = _n1.b;
					return A2(elm$parser$Parser$Advanced$Bad, p, x);
				} else {
					var p1 = _n1.a;
					var a = _n1.b;
					var s1 = _n1.c;
					var _n2 = callback(a);
					var parseB = _n2.a;
					var _n3 = parseB(s1);
					if (_n3.$ === 'Bad') {
						var p2 = _n3.a;
						var x = _n3.b;
						return A2(elm$parser$Parser$Advanced$Bad, p1 || p2, x);
					} else {
						var p2 = _n3.a;
						var b = _n3.b;
						var s2 = _n3.c;
						return A3(elm$parser$Parser$Advanced$Good, p1 || p2, b, s2);
					}
				}
			});
	});
var elm$parser$Parser$Advanced$getIndent = elm$parser$Parser$Advanced$Parser(
	function (s) {
		return A3(elm$parser$Parser$Advanced$Good, false, s.indent, s);
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$withIndent = function (fn) {
	return A2(elm$parser$Parser$Advanced$andThen, fn, elm$parser$Parser$Advanced$getIndent);
};
var elm$parser$Parser$Advanced$getOffset = elm$parser$Parser$Advanced$Parser(
	function (s) {
		return A3(elm$parser$Parser$Advanced$Good, false, s.offset, s);
	});
var elm$parser$Parser$Advanced$getPosition = elm$parser$Parser$Advanced$Parser(
	function (s) {
		return A3(
			elm$parser$Parser$Advanced$Good,
			false,
			_Utils_Tuple2(s.row, s.col),
			s);
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$getPosition = A2(
	elm$parser$Parser$Advanced$keeper,
	A2(
		elm$parser$Parser$Advanced$keeper,
		elm$parser$Parser$Advanced$succeed(
			F2(
				function (offset, _n0) {
					var row = _n0.a;
					var col = _n0.b;
					return {column: col, line: row, offset: offset};
				})),
		elm$parser$Parser$Advanced$getOffset),
	elm$parser$Parser$Advanced$getPosition);
var mdgriffith$elm_markup$Mark$Internal$Parser$withRange = function (parser) {
	return A2(
		elm$parser$Parser$Advanced$keeper,
		A2(
			elm$parser$Parser$Advanced$keeper,
			A2(
				elm$parser$Parser$Advanced$keeper,
				elm$parser$Parser$Advanced$succeed(
					F3(
						function (start, val, end) {
							return _Utils_Tuple2(
								{end: end, start: start},
								val);
						})),
				mdgriffith$elm_markup$Mark$Internal$Parser$getPosition),
			parser),
		mdgriffith$elm_markup$Mark$Internal$Parser$getPosition);
};
var mdgriffith$elm_markup$Mark$fieldContentParser = F2(
	function (name, parser) {
		return mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
			function (indentation) {
				return A2(
					elm$parser$Parser$Advanced$map,
					function (_n0) {
						var pos = _n0.a;
						var description = _n0.b;
						return _Utils_Tuple2(
							name,
							A2(mdgriffith$elm_markup$Mark$Internal$Description$Found, pos, description));
					},
					mdgriffith$elm_markup$Mark$Internal$Parser$withRange(
						A2(
							elm$parser$Parser$Advanced$keeper,
							elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
							elm$parser$Parser$Advanced$oneOf(
								_List_fromArray(
									[
										A2(
										elm$parser$Parser$Advanced$withIndent,
										indentation + 4,
										A2(
											elm$parser$Parser$Advanced$inContext,
											mdgriffith$elm_markup$Mark$Internal$Error$InRecordField(name),
											parser)),
										A2(
										elm$parser$Parser$Advanced$keeper,
										A2(
											elm$parser$Parser$Advanced$ignorer,
											A2(
												elm$parser$Parser$Advanced$ignorer,
												elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
												elm$parser$Parser$Advanced$chompWhile(
													function (c) {
														return _Utils_eq(
															c,
															_Utils_chr('\n'));
													})),
											elm$parser$Parser$Advanced$token(
												A2(
													elm$parser$Parser$Advanced$Token,
													A2(elm$core$String$repeat, indentation + 4, ' '),
													mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndentation(indentation)))),
										A2(
											elm$parser$Parser$Advanced$withIndent,
											indentation + 4,
											A2(
												elm$parser$Parser$Advanced$inContext,
												mdgriffith$elm_markup$Mark$Internal$Error$InRecordField(name),
												parser)))
									])))));
			});
	});
var mdgriffith$elm_markup$Mark$Internal$Error$ExpectingBlockName = function (a) {
	return {$: 'ExpectingBlockName', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$getParser = F3(
	function (context, seed, _n0) {
		var details = _n0.a;
		var _n1 = details.kind;
		switch (_n1.$) {
			case 'Named':
				var name = _n1.a;
				var _n2 = A2(details.parser, context, seed);
				var newSeed = _n2.a;
				var blockParser = _n2.b;
				return _Utils_Tuple2(
					newSeed,
					A2(
						elm$parser$Parser$Advanced$keeper,
						A2(
							elm$parser$Parser$Advanced$ignorer,
							A2(
								elm$parser$Parser$Advanced$ignorer,
								elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
								elm$parser$Parser$Advanced$token(
									A2(
										elm$parser$Parser$Advanced$Token,
										'|>',
										mdgriffith$elm_markup$Mark$Internal$Error$ExpectingBlockName(name)))),
							elm$parser$Parser$Advanced$chompWhile(
								function (c) {
									return _Utils_eq(
										c,
										_Utils_chr(' '));
								})),
						blockParser));
			case 'Value':
				return A2(details.parser, context, seed);
			case 'VerbatimNamed':
				var name = _n1.a;
				var _n3 = A2(details.parser, context, seed);
				var newSeed = _n3.a;
				var blockParser = _n3.b;
				return _Utils_Tuple2(newSeed, blockParser);
			default:
				var name = _n1.a;
				var _n4 = A2(details.parser, context, seed);
				var newSeed = _n4.a;
				var blockParser = _n4.b;
				return _Utils_Tuple2(newSeed, blockParser);
		}
	});
var mdgriffith$elm_markup$Mark$fieldParser = F3(
	function (_n0, context, seed) {
		var name = _n0.a;
		var myBlock = _n0.b;
		var _n1 = A3(mdgriffith$elm_markup$Mark$Internal$Description$getParser, context, seed, myBlock);
		var newSeed = _n1.a;
		var blockParser = _n1.b;
		return _Utils_Tuple2(
			newSeed,
			_Utils_Tuple2(
				name,
				A2(mdgriffith$elm_markup$Mark$fieldContentParser, name, blockParser)));
	});
var mdgriffith$elm_markup$Mark$Internal$Description$renderBlock = function (fromBlock) {
	var converter = fromBlock.a.converter;
	return converter;
};
var mdgriffith$elm_markup$Mark$matchField = F4(
	function (targetName, targetBlock, _n0, existing) {
		var name = _n0.a;
		var foundDescription = _n0.b;
		if (existing.$ === 'Just') {
			return existing;
		} else {
			if (_Utils_eq(name, targetName)) {
				if (foundDescription.$ === 'Found') {
					var rng = foundDescription.a;
					var description = foundDescription.b;
					return elm$core$Maybe$Just(
						A2(mdgriffith$elm_markup$Mark$Internal$Description$renderBlock, targetBlock, description));
				} else {
					var unexpected = foundDescription.a;
					return elm$core$Maybe$Just(
						mdgriffith$elm_markup$Mark$Internal$Description$uncertain(unexpected));
				}
			} else {
				return existing;
			}
		}
	});
var mdgriffith$elm_markup$Mark$getField = F2(
	function (_n0, fields) {
		var name = _n0.a;
		var fieldBlock = _n0.b;
		return A3(
			elm$core$List$foldl,
			A2(mdgriffith$elm_markup$Mark$matchField, name, fieldBlock),
			elm$core$Maybe$Nothing,
			fields);
	});
var mdgriffith$elm_markup$Mark$Internal$Description$Recovered = F2(
	function (a, b) {
		return {$: 'Recovered', a: a, b: b};
	});
var mdgriffith$elm_markup$Mark$Internal$Description$mapSuccessAndRecovered = F2(
	function (fn, outcome) {
		switch (outcome.$) {
			case 'Success':
				var s = outcome.a;
				return mdgriffith$elm_markup$Mark$Internal$Outcome$Success(
					fn(s));
			case 'Almost':
				if (outcome.a.$ === 'Uncertain') {
					var u = outcome.a.a;
					return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
						mdgriffith$elm_markup$Mark$Internal$Description$Uncertain(u));
				} else {
					var _n1 = outcome.a;
					var e = _n1.a;
					var a = _n1.b;
					return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
						A2(
							mdgriffith$elm_markup$Mark$Internal$Description$Recovered,
							e,
							fn(a)));
				}
			default:
				var f = outcome.a;
				return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(f);
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Error$MissingFields = function (a) {
	return {$: 'MissingFields', a: a};
};
var mdgriffith$elm_markup$Mark$field = F3(
	function (name, value, _n0) {
		var details = _n0.a;
		var newField = A2(mdgriffith$elm_markup$Mark$Field, name, value);
		return mdgriffith$elm_markup$Mark$Internal$Description$ProtoRecord(
			{
				blockKind: details.blockKind,
				expectations: A2(
					elm$core$List$cons,
					mdgriffith$elm_markup$Mark$fieldExpectation(newField),
					details.expectations),
				fieldConverter: F2(
					function (desc, ann) {
						var _n1 = A2(details.fieldConverter, desc, ann);
						switch (_n1.$) {
							case 'Success':
								var _n2 = _n1.a;
								var pos = _n2.a;
								var fieldDescriptions = _n2.b;
								var rendered = _n2.c;
								var _n3 = A2(mdgriffith$elm_markup$Mark$getField, newField, fieldDescriptions);
								if (_n3.$ === 'Just') {
									var outcome = _n3.a;
									return A2(
										mdgriffith$elm_markup$Mark$Internal$Description$mapSuccessAndRecovered,
										function (myField) {
											return _Utils_Tuple3(
												pos,
												fieldDescriptions,
												rendered(myField));
										},
										outcome);
								} else {
									return mdgriffith$elm_markup$Mark$Internal$Description$uncertain(
										{
											problem: mdgriffith$elm_markup$Mark$Internal$Error$MissingFields(
												_List_fromArray(
													[
														mdgriffith$elm_markup$Mark$fieldName(newField)
													])),
											range: pos
										});
								}
							case 'Failure':
								var fail = _n1.a;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(fail);
							default:
								if (_n1.a.$ === 'Recovered') {
									var _n4 = _n1.a;
									var e = _n4.a;
									var _n5 = _n4.b;
									var pos = _n5.a;
									var fieldDescriptions = _n5.b;
									var rendered = _n5.c;
									var _n6 = A2(mdgriffith$elm_markup$Mark$getField, newField, fieldDescriptions);
									if (_n6.$ === 'Just') {
										var outcome = _n6.a;
										return A2(
											mdgriffith$elm_markup$Mark$Internal$Description$mapSuccessAndRecovered,
											function (myField) {
												return _Utils_Tuple3(
													pos,
													fieldDescriptions,
													rendered(myField));
											},
											outcome);
									} else {
										return mdgriffith$elm_markup$Mark$Internal$Description$uncertain(
											{
												problem: mdgriffith$elm_markup$Mark$Internal$Error$MissingFields(
													_List_fromArray(
														[
															mdgriffith$elm_markup$Mark$fieldName(newField)
														])),
												range: pos
											});
									}
								} else {
									var e = _n1.a.a;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
										mdgriffith$elm_markup$Mark$Internal$Description$Uncertain(e));
								}
						}
					}),
				fields: A2(
					elm$core$List$cons,
					mdgriffith$elm_markup$Mark$fieldParser(newField),
					details.fields),
				name: details.name
			});
	});
var elm$core$String$trim = _String_trim;
var elm$parser$Parser$Advanced$mapChompedString = F2(
	function (func, _n0) {
		var parse = _n0.a;
		return elm$parser$Parser$Advanced$Parser(
			function (s0) {
				var _n1 = parse(s0);
				if (_n1.$ === 'Bad') {
					var p = _n1.a;
					var x = _n1.b;
					return A2(elm$parser$Parser$Advanced$Bad, p, x);
				} else {
					var p = _n1.a;
					var a = _n1.b;
					var s1 = _n1.c;
					return A3(
						elm$parser$Parser$Advanced$Good,
						p,
						A2(
							func,
							A3(elm$core$String$slice, s0.offset, s1.offset, s0.src),
							a),
						s1);
				}
			});
	});
var elm$parser$Parser$Advanced$getChompedString = function (parser) {
	return A2(elm$parser$Parser$Advanced$mapChompedString, elm$core$Basics$always, parser);
};
var elm$parser$Parser$Advanced$loopHelp = F4(
	function (p, state, callback, s0) {
		loopHelp:
		while (true) {
			var _n0 = callback(state);
			var parse = _n0.a;
			var _n1 = parse(s0);
			if (_n1.$ === 'Good') {
				var p1 = _n1.a;
				var step = _n1.b;
				var s1 = _n1.c;
				if (step.$ === 'Loop') {
					var newState = step.a;
					var $temp$p = p || p1,
						$temp$state = newState,
						$temp$callback = callback,
						$temp$s0 = s1;
					p = $temp$p;
					state = $temp$state;
					callback = $temp$callback;
					s0 = $temp$s0;
					continue loopHelp;
				} else {
					var result = step.a;
					return A3(elm$parser$Parser$Advanced$Good, p || p1, result, s1);
				}
			} else {
				var p1 = _n1.a;
				var x = _n1.b;
				return A2(elm$parser$Parser$Advanced$Bad, p || p1, x);
			}
		}
	});
var elm$parser$Parser$Advanced$loop = F2(
	function (state, callback) {
		return elm$parser$Parser$Advanced$Parser(
			function (s) {
				return A4(elm$parser$Parser$Advanced$loopHelp, false, state, callback, s);
			});
	});
var mdgriffith$elm_markup$Mark$Internal$Description$Block = function (a) {
	return {$: 'Block', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$DescribeString = F3(
	function (a, b, c) {
		return {$: 'DescribeString', a: a, b: b, c: c};
	});
var mdgriffith$elm_markup$Mark$Internal$Description$ExpectString = function (a) {
	return {$: 'ExpectString', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$Value = {$: 'Value'};
var mdgriffith$elm_markup$Mark$Internal$Id$Id = function (a) {
	return {$: 'Id', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Id$Seed = function (a) {
	return {$: 'Seed', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Id$step = function (_n0) {
	var seed = _n0.a;
	if (!seed.b) {
		return _Utils_Tuple2(
			mdgriffith$elm_markup$Mark$Internal$Id$Id(
				_List_fromArray(
					[0])),
			mdgriffith$elm_markup$Mark$Internal$Id$Seed(
				_List_fromArray(
					[0])));
	} else {
		var current = seed.a;
		var remain = seed.b;
		return _Utils_Tuple2(
			mdgriffith$elm_markup$Mark$Internal$Id$Id(seed),
			mdgriffith$elm_markup$Mark$Internal$Id$Seed(
				A2(elm$core$List$cons, current + 1, remain)));
	}
};
var elm$parser$Parser$Advanced$Done = function (a) {
	return {$: 'Done', a: a};
};
var elm$parser$Parser$Advanced$Loop = function (a) {
	return {$: 'Loop', a: a};
};
var elm$parser$Parser$Advanced$backtrackable = function (_n0) {
	var parse = _n0.a;
	return elm$parser$Parser$Advanced$Parser(
		function (s0) {
			var _n1 = parse(s0);
			if (_n1.$ === 'Bad') {
				var x = _n1.b;
				return A2(elm$parser$Parser$Advanced$Bad, false, x);
			} else {
				var a = _n1.b;
				var s1 = _n1.c;
				return A3(elm$parser$Parser$Advanced$Good, false, a, s1);
			}
		});
};
var elm$parser$Parser$Advanced$end = function (x) {
	return elm$parser$Parser$Advanced$Parser(
		function (s) {
			return _Utils_eq(
				elm$core$String$length(s.src),
				s.offset) ? A3(elm$parser$Parser$Advanced$Good, false, _Utils_Tuple0, s) : A2(
				elm$parser$Parser$Advanced$Bad,
				false,
				A2(elm$parser$Parser$Advanced$fromState, s, x));
		});
};
var mdgriffith$elm_markup$Mark$Internal$Error$End = {$: 'End'};
var mdgriffith$elm_markup$Mark$Internal$Error$Newline = {$: 'Newline'};
var mdgriffith$elm_markup$Mark$Internal$Parser$newline = elm$parser$Parser$Advanced$token(
	A2(elm$parser$Parser$Advanced$Token, '\n', mdgriffith$elm_markup$Mark$Internal$Error$Newline));
var mdgriffith$elm_markup$Mark$Internal$Parser$indentedString = F2(
	function (indentation, found) {
		return elm$parser$Parser$Advanced$oneOf(
			_List_fromArray(
				[
					A2(
					elm$parser$Parser$Advanced$ignorer,
					elm$parser$Parser$Advanced$succeed(
						elm$parser$Parser$Advanced$Done(found)),
					elm$parser$Parser$Advanced$end(mdgriffith$elm_markup$Mark$Internal$Error$End)),
					A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(
							function (extra) {
								return elm$parser$Parser$Advanced$Loop(
									extra ? (found + '\n\n') : (found + '\n'));
							}),
						mdgriffith$elm_markup$Mark$Internal$Parser$newline),
					elm$parser$Parser$Advanced$oneOf(
						_List_fromArray(
							[
								A2(
								elm$parser$Parser$Advanced$ignorer,
								A2(
									elm$parser$Parser$Advanced$ignorer,
									elm$parser$Parser$Advanced$succeed(true),
									elm$parser$Parser$Advanced$backtrackable(
										elm$parser$Parser$Advanced$chompWhile(
											function (c) {
												return _Utils_eq(
													c,
													_Utils_chr(' '));
											}))),
								elm$parser$Parser$Advanced$backtrackable(
									elm$parser$Parser$Advanced$token(
										A2(elm$parser$Parser$Advanced$Token, '\n', mdgriffith$elm_markup$Mark$Internal$Error$Newline)))),
								elm$parser$Parser$Advanced$succeed(false)
							]))),
					(found === '') ? A2(
					elm$parser$Parser$Advanced$keeper,
					elm$parser$Parser$Advanced$succeed(
						function (str) {
							return elm$parser$Parser$Advanced$Loop(
								_Utils_ap(found, str));
						}),
					elm$parser$Parser$Advanced$getChompedString(
						elm$parser$Parser$Advanced$chompWhile(
							function (c) {
								return !_Utils_eq(
									c,
									_Utils_chr('\n'));
							}))) : A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(
							function (str) {
								return elm$parser$Parser$Advanced$Loop(
									_Utils_ap(found, str));
							}),
						elm$parser$Parser$Advanced$token(
							A2(
								elm$parser$Parser$Advanced$Token,
								A2(elm$core$String$repeat, indentation, ' '),
								mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndentation(indentation)))),
					elm$parser$Parser$Advanced$getChompedString(
						elm$parser$Parser$Advanced$chompWhile(
							function (c) {
								return !_Utils_eq(
									c,
									_Utils_chr('\n'));
							}))),
					elm$parser$Parser$Advanced$succeed(
					elm$parser$Parser$Advanced$Done(found))
				]));
	});
var mdgriffith$elm_markup$Mark$string = mdgriffith$elm_markup$Mark$Internal$Description$Block(
	{
		converter: function (desc) {
			if (desc.$ === 'DescribeString') {
				var id = desc.a;
				var range = desc.b;
				var str = desc.c;
				return mdgriffith$elm_markup$Mark$Internal$Outcome$Success(
					elm$core$String$trim(str));
			} else {
				return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
			}
		},
		expect: mdgriffith$elm_markup$Mark$Internal$Description$ExpectString('REPLACE'),
		kind: mdgriffith$elm_markup$Mark$Internal$Description$Value,
		parser: F2(
			function (context, seed) {
				var _n1 = mdgriffith$elm_markup$Mark$Internal$Id$step(seed);
				var id = _n1.a;
				var newSeed = _n1.b;
				return _Utils_Tuple2(
					newSeed,
					function () {
						switch (context.$) {
							case 'ParseInline':
								return A2(
									elm$parser$Parser$Advanced$keeper,
									A2(
										elm$parser$Parser$Advanced$keeper,
										A2(
											elm$parser$Parser$Advanced$keeper,
											elm$parser$Parser$Advanced$succeed(
												F3(
													function (start, str, end) {
														return A3(
															mdgriffith$elm_markup$Mark$Internal$Description$DescribeString,
															id,
															{end: end, start: start},
															elm$core$String$trim(str));
													})),
											mdgriffith$elm_markup$Mark$Internal$Parser$getPosition),
										elm$parser$Parser$Advanced$getChompedString(
											elm$parser$Parser$Advanced$chompWhile(
												function (c) {
													return (!_Utils_eq(
														c,
														_Utils_chr('\n'))) && ((!_Utils_eq(
														c,
														_Utils_chr(','))) && (!_Utils_eq(
														c,
														_Utils_chr('}'))));
												}))),
									mdgriffith$elm_markup$Mark$Internal$Parser$getPosition);
							case 'ParseBlock':
								return A2(
									elm$parser$Parser$Advanced$map,
									function (_n3) {
										var pos = _n3.a;
										var str = _n3.b;
										return A3(mdgriffith$elm_markup$Mark$Internal$Description$DescribeString, id, pos, str);
									},
									mdgriffith$elm_markup$Mark$Internal$Parser$withRange(
										mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
											function (indentation) {
												return A2(
													elm$parser$Parser$Advanced$loop,
													'',
													mdgriffith$elm_markup$Mark$Internal$Parser$indentedString(indentation));
											})));
							default:
								return A2(
									elm$parser$Parser$Advanced$map,
									function (_n4) {
										var pos = _n4.a;
										var str = _n4.b;
										return A3(mdgriffith$elm_markup$Mark$Internal$Description$DescribeString, id, pos, str);
									},
									mdgriffith$elm_markup$Mark$Internal$Parser$withRange(
										mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
											function (indentation) {
												return A2(
													elm$parser$Parser$Advanced$loop,
													'',
													mdgriffith$elm_markup$Mark$Internal$Parser$indentedString(indentation));
											})));
						}
					}());
			})
	});
var mdgriffith$elm_markup$Mark$Internal$Description$ExpectRecord = F2(
	function (a, b) {
		return {$: 'ExpectRecord', a: a, b: b};
	});
var mdgriffith$elm_markup$Mark$Internal$Description$ParseInline = {$: 'ParseInline'};
var mdgriffith$elm_markup$Mark$Internal$Id$threadThrough = F2(
	function (current, _n0) {
		var seed = _n0.a;
		var past = _n0.b;
		var _n1 = current(seed);
		var newSeed = _n1.a;
		var result = _n1.b;
		return _Utils_Tuple2(
			newSeed,
			A2(elm$core$List$cons, result, past));
	});
var mdgriffith$elm_markup$Mark$Internal$Id$thread = F2(
	function (seed, steps) {
		return A2(
			elm$core$Tuple$mapSecond,
			elm$core$List$reverse,
			A3(
				elm$core$List$foldl,
				mdgriffith$elm_markup$Mark$Internal$Id$threadThrough,
				_Utils_Tuple2(seed, _List_Nil),
				steps));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$InlineRecord = {$: 'InlineRecord'};
var elm$parser$Parser$Advanced$chompIf = F2(
	function (isGood, expecting) {
		return elm$parser$Parser$Advanced$Parser(
			function (s) {
				var newOffset = A3(elm$parser$Parser$Advanced$isSubChar, isGood, s.offset, s.src);
				return _Utils_eq(newOffset, -1) ? A2(
					elm$parser$Parser$Advanced$Bad,
					false,
					A2(elm$parser$Parser$Advanced$fromState, s, expecting)) : (_Utils_eq(newOffset, -2) ? A3(
					elm$parser$Parser$Advanced$Good,
					true,
					_Utils_Tuple0,
					{col: 1, context: s.context, indent: s.indent, offset: s.offset + 1, row: s.row + 1, src: s.src}) : A3(
					elm$parser$Parser$Advanced$Good,
					true,
					_Utils_Tuple0,
					{col: s.col + 1, context: s.context, indent: s.indent, offset: newOffset, row: s.row, src: s.src}));
			});
	});
var elm$parser$Parser$Advanced$keyword = function (_n0) {
	var kwd = _n0.a;
	var expecting = _n0.b;
	var progress = !elm$core$String$isEmpty(kwd);
	return elm$parser$Parser$Advanced$Parser(
		function (s) {
			var _n1 = A5(elm$parser$Parser$Advanced$isSubString, kwd, s.offset, s.row, s.col, s.src);
			var newOffset = _n1.a;
			var newRow = _n1.b;
			var newCol = _n1.c;
			return (_Utils_eq(newOffset, -1) || (0 <= A3(
				elm$parser$Parser$Advanced$isSubChar,
				function (c) {
					return elm$core$Char$isAlphaNum(c) || _Utils_eq(
						c,
						_Utils_chr('_'));
				},
				newOffset,
				s.src))) ? A2(
				elm$parser$Parser$Advanced$Bad,
				false,
				A2(elm$parser$Parser$Advanced$fromState, s, expecting)) : A3(
				elm$parser$Parser$Advanced$Good,
				progress,
				_Utils_Tuple0,
				{col: newCol, context: s.context, indent: s.indent, offset: newOffset, row: newRow, src: s.src});
		});
};
var mdgriffith$elm_markup$Mark$Internal$Description$Record = function (a) {
	return {$: 'Record', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$Unexpected = function (a) {
	return {$: 'Unexpected', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Error$Expecting = function (a) {
	return {$: 'Expecting', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$backtrackCharacters = F2(
	function (chars, range) {
		return {
			end: range.end,
			start: {column: range.start.column - chars, line: range.start.line, offset: range.start.offset - chars}
		};
	});
var mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndent = function (a) {
	return {$: 'ExpectingIndent', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Error$UnexpectedField = function (a) {
	return {$: 'UnexpectedField', a: a};
};
var elm$core$Basics$composeL = F3(
	function (g, f, x) {
		return g(
			f(x));
	});
var mdgriffith$elm_markup$Mark$Internal$Error$ExpectingFieldName = function (a) {
	return {$: 'ExpectingFieldName', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$parseField = function (_n0) {
	var name = _n0.a;
	var contentParser = _n0.b;
	return A2(
		elm$parser$Parser$Advanced$keeper,
		A2(
			elm$parser$Parser$Advanced$ignorer,
			A2(
				elm$parser$Parser$Advanced$ignorer,
				A2(
					elm$parser$Parser$Advanced$ignorer,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
						elm$parser$Parser$Advanced$keyword(
							A2(
								elm$parser$Parser$Advanced$Token,
								name,
								mdgriffith$elm_markup$Mark$Internal$Error$ExpectingFieldName(name)))),
					elm$parser$Parser$Advanced$chompWhile(
						function (c) {
							return _Utils_eq(
								c,
								_Utils_chr(' '));
						})),
				A2(
					elm$parser$Parser$Advanced$chompIf,
					function (c) {
						return _Utils_eq(
							c,
							_Utils_chr('='));
					},
					mdgriffith$elm_markup$Mark$Internal$Error$Expecting('='))),
			elm$parser$Parser$Advanced$chompWhile(
				function (c) {
					return _Utils_eq(
						c,
						_Utils_chr(' '));
				})),
		contentParser);
};
var elm$parser$Parser$Advanced$getSource = elm$parser$Parser$Advanced$Parser(
	function (s) {
		return A3(elm$parser$Parser$Advanced$Good, false, s.src, s);
	});
var elm$core$List$head = function (list) {
	if (list.b) {
		var x = list.a;
		var xs = list.b;
		return elm$core$Maybe$Just(x);
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var elm$core$String$lines = _String_lines;
var mdgriffith$elm_markup$Mark$Internal$Parser$sliceRange = F2(
	function (range, source) {
		if (_Utils_eq(range.start.line, range.end.line)) {
			var lineStart = range.start.offset - (range.start.column - 1);
			return A2(
				elm$core$Maybe$withDefault,
				'',
				elm$core$List$head(
					elm$core$String$lines(
						A3(elm$core$String$slice, lineStart, range.end.offset + 20, source))));
		} else {
			var snippet = A3(elm$core$String$slice, range.start.offset, range.end.offset, source);
			var indented = A3(elm$core$String$slice, (range.start.offset + 1) - range.start.column, range.start.offset, source);
			return _Utils_ap(indented, snippet);
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$getRangeAndSource = function (parser) {
	return A2(
		elm$parser$Parser$Advanced$keeper,
		A2(
			elm$parser$Parser$Advanced$keeper,
			A2(
				elm$parser$Parser$Advanced$keeper,
				A2(
					elm$parser$Parser$Advanced$keeper,
					elm$parser$Parser$Advanced$succeed(
						F4(
							function (src, start, result, end) {
								var range = {end: end, start: start};
								return {
									range: range,
									source: A2(mdgriffith$elm_markup$Mark$Internal$Parser$sliceRange, range, src),
									value: result
								};
							})),
					elm$parser$Parser$Advanced$getSource),
				mdgriffith$elm_markup$Mark$Internal$Parser$getPosition),
			parser),
		mdgriffith$elm_markup$Mark$Internal$Parser$getPosition);
};
var mdgriffith$elm_markup$Mark$Internal$Parser$unexpectedField = F2(
	function (recordName, options) {
		return mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
			function (indentation) {
				return A2(
					elm$parser$Parser$Advanced$map,
					function (_n0) {
						var range = _n0.range;
						var value = _n0.value;
						return _Utils_Tuple2(
							value,
							mdgriffith$elm_markup$Mark$Internal$Description$Unexpected(
								{
									problem: mdgriffith$elm_markup$Mark$Internal$Error$UnexpectedField(
										{found: value, options: options, recordName: recordName}),
									range: range
								}));
					},
					mdgriffith$elm_markup$Mark$Internal$Parser$getRangeAndSource(
						A2(
							elm$parser$Parser$Advanced$keeper,
							elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
							A2(
								elm$parser$Parser$Advanced$ignorer,
								A2(
									elm$parser$Parser$Advanced$ignorer,
									A2(
										elm$parser$Parser$Advanced$ignorer,
										A2(
											elm$parser$Parser$Advanced$ignorer,
											elm$parser$Parser$Advanced$getChompedString(
												elm$parser$Parser$Advanced$chompWhile(elm$core$Char$isAlphaNum)),
											elm$parser$Parser$Advanced$chompWhile(
												function (c) {
													return _Utils_eq(
														c,
														_Utils_chr(' '));
												})),
										A2(
											elm$parser$Parser$Advanced$chompIf,
											function (c) {
												return _Utils_eq(
													c,
													_Utils_chr('='));
											},
											mdgriffith$elm_markup$Mark$Internal$Error$Expecting('='))),
									elm$parser$Parser$Advanced$chompWhile(
										function (c) {
											return _Utils_eq(
												c,
												_Utils_chr(' '));
										})),
								A2(
									elm$parser$Parser$Advanced$withIndent,
									indentation + 4,
									elm$parser$Parser$Advanced$getChompedString(
										elm$parser$Parser$Advanced$chompWhile(
											function (c) {
												return !_Utils_eq(
													c,
													_Utils_chr('\n'));
											})))))));
			});
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$captureField = F4(
	function (found, recordName, fields, fieldNames) {
		return A2(
			elm$parser$Parser$Advanced$map,
			function (maybeField) {
				if (maybeField.$ === 'Nothing') {
					return elm$parser$Parser$Advanced$Loop(fields);
				} else {
					var _n1 = maybeField.a;
					var foundFieldname = _n1.a;
					var fieldValue = _n1.b;
					if (fieldValue.$ === 'Found') {
						return elm$parser$Parser$Advanced$Loop(
							{
								found: elm$core$Result$Ok(
									A2(
										elm$core$List$cons,
										_Utils_Tuple2(foundFieldname, fieldValue),
										found)),
								remaining: A2(
									elm$core$List$filter,
									function (_n3) {
										var fieldParserName = _n3.a;
										return !_Utils_eq(fieldParserName, foundFieldname);
									},
									fields.remaining)
							});
					} else {
						var unexpected = fieldValue.a;
						return elm$parser$Parser$Advanced$Loop(
							{
								found: elm$core$Result$Err(
									_Utils_Tuple2(
										elm$core$Maybe$Just(unexpected.range),
										unexpected.problem)),
								remaining: A2(
									elm$core$List$filter,
									function (_n4) {
										var fieldParserName = _n4.a;
										return !_Utils_eq(fieldParserName, foundFieldname);
									},
									fields.remaining)
							});
					}
				}
			},
			elm$parser$Parser$Advanced$oneOf(
				_Utils_ap(
					A2(
						elm$core$List$map,
						A2(
							elm$core$Basics$composeL,
							elm$parser$Parser$Advanced$map(elm$core$Maybe$Just),
							mdgriffith$elm_markup$Mark$Internal$Parser$parseField),
						fields.remaining),
					_List_fromArray(
						[
							A2(
							elm$parser$Parser$Advanced$map,
							elm$core$Maybe$Just,
							A2(mdgriffith$elm_markup$Mark$Internal$Parser$unexpectedField, recordName, fieldNames))
						]))));
	});
var mdgriffith$elm_markup$Mark$Internal$Error$Space = {$: 'Space'};
var mdgriffith$elm_markup$Mark$Internal$Parser$EmptyLine = {$: 'EmptyLine'};
var mdgriffith$elm_markup$Mark$Internal$Parser$Indented = function (a) {
	return {$: 'Indented', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$WeirdIndent = function (a) {
	return {$: 'WeirdIndent', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$newlineWith = function (x) {
	return elm$parser$Parser$Advanced$token(
		A2(
			elm$parser$Parser$Advanced$Token,
			'\n',
			mdgriffith$elm_markup$Mark$Internal$Error$Expecting(x)));
};
var mdgriffith$elm_markup$Mark$Internal$Parser$indentOrSkip = F2(
	function (indentation, successParser) {
		return elm$parser$Parser$Advanced$oneOf(
			_List_fromArray(
				[
					A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
						elm$parser$Parser$Advanced$token(
							A2(
								elm$parser$Parser$Advanced$Token,
								A2(elm$core$String$repeat, indentation, ' '),
								mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndentation(indentation)))),
					elm$parser$Parser$Advanced$oneOf(
						_List_fromArray(
							[
								A2(
								elm$parser$Parser$Advanced$map,
								elm$core$Basics$always(mdgriffith$elm_markup$Mark$Internal$Parser$EmptyLine),
								mdgriffith$elm_markup$Mark$Internal$Parser$newline),
								A2(
								elm$parser$Parser$Advanced$keeper,
								A2(
									elm$parser$Parser$Advanced$keeper,
									A2(
										elm$parser$Parser$Advanced$ignorer,
										elm$parser$Parser$Advanced$succeed(
											F2(
												function (foundIndent, content) {
													return (content !== '') ? mdgriffith$elm_markup$Mark$Internal$Parser$WeirdIndent(
														elm$core$String$length(foundIndent)) : mdgriffith$elm_markup$Mark$Internal$Parser$EmptyLine;
												})),
										A2(
											elm$parser$Parser$Advanced$chompIf,
											function (c) {
												return _Utils_eq(
													c,
													_Utils_chr(' '));
											},
											mdgriffith$elm_markup$Mark$Internal$Error$Space)),
									elm$parser$Parser$Advanced$getChompedString(
										elm$parser$Parser$Advanced$chompWhile(
											function (c) {
												return _Utils_eq(
													c,
													_Utils_chr(' '));
											}))),
								A2(
									elm$parser$Parser$Advanced$ignorer,
									elm$parser$Parser$Advanced$getChompedString(
										elm$parser$Parser$Advanced$chompWhile(
											function (c) {
												return !_Utils_eq(
													c,
													_Utils_chr('\n'));
											})),
									mdgriffith$elm_markup$Mark$Internal$Parser$newlineWith('indentOrSkip one'))),
								A2(
								elm$parser$Parser$Advanced$keeper,
								elm$parser$Parser$Advanced$succeed(mdgriffith$elm_markup$Mark$Internal$Parser$Indented),
								A2(
									elm$parser$Parser$Advanced$ignorer,
									successParser,
									elm$parser$Parser$Advanced$chompWhile(
										function (c) {
											return _Utils_eq(
												c,
												_Utils_chr('\n'));
										})))
							]))),
					A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$keeper,
						elm$parser$Parser$Advanced$succeed(
							F2(
								function (foundIndent, hasContent) {
									return hasContent ? mdgriffith$elm_markup$Mark$Internal$Parser$WeirdIndent(
										elm$core$String$length(foundIndent)) : mdgriffith$elm_markup$Mark$Internal$Parser$EmptyLine;
								})),
						elm$parser$Parser$Advanced$getChompedString(
							elm$parser$Parser$Advanced$chompWhile(
								function (c) {
									return _Utils_eq(
										c,
										_Utils_chr(' '));
								}))),
					elm$parser$Parser$Advanced$oneOf(
						_List_fromArray(
							[
								A2(
								elm$parser$Parser$Advanced$map,
								elm$core$Basics$always(false),
								mdgriffith$elm_markup$Mark$Internal$Parser$newline),
								A2(
								elm$parser$Parser$Advanced$ignorer,
								A2(
									elm$parser$Parser$Advanced$ignorer,
									elm$parser$Parser$Advanced$succeed(true),
									elm$parser$Parser$Advanced$getChompedString(
										elm$parser$Parser$Advanced$chompWhile(
											function (c) {
												return !_Utils_eq(
													c,
													_Utils_chr('\n'));
											}))),
								mdgriffith$elm_markup$Mark$Internal$Parser$newline)
							])))
				]));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$indentationBetween = F2(
	function (lower, higher) {
		var top = A2(elm$core$Basics$max, lower, higher);
		var bottom = A2(elm$core$Basics$min, lower, higher);
		return elm$core$List$reverse(
			A2(
				elm$core$List$map,
				function (numSpaces) {
					return A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(numSpaces),
						elm$parser$Parser$Advanced$token(
							A2(
								elm$parser$Parser$Advanced$Token,
								A2(elm$core$String$repeat, numSpaces, ' '),
								mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndentation(numSpaces))));
				},
				A2(elm$core$List$range, bottom, top)));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$raggedIndentedStringAbove = F2(
	function (indentation, found) {
		return elm$parser$Parser$Advanced$oneOf(
			_List_fromArray(
				[
					A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(
							function (extra) {
								return elm$parser$Parser$Advanced$Loop(
									extra ? (found + '\n\n') : (found + '\n'));
							}),
						elm$parser$Parser$Advanced$token(
							A2(elm$parser$Parser$Advanced$Token, '\n', mdgriffith$elm_markup$Mark$Internal$Error$Newline))),
					elm$parser$Parser$Advanced$oneOf(
						_List_fromArray(
							[
								A2(
								elm$parser$Parser$Advanced$ignorer,
								A2(
									elm$parser$Parser$Advanced$ignorer,
									elm$parser$Parser$Advanced$succeed(true),
									elm$parser$Parser$Advanced$backtrackable(
										elm$parser$Parser$Advanced$chompWhile(
											function (c) {
												return _Utils_eq(
													c,
													_Utils_chr(' '));
											}))),
								elm$parser$Parser$Advanced$backtrackable(
									elm$parser$Parser$Advanced$token(
										A2(elm$parser$Parser$Advanced$Token, '\n', mdgriffith$elm_markup$Mark$Internal$Error$Newline)))),
								elm$parser$Parser$Advanced$succeed(false)
							]))),
					A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$keeper,
						elm$parser$Parser$Advanced$succeed(
							F2(
								function (indentCount, str) {
									return (indentCount <= 0) ? elm$parser$Parser$Advanced$Done(found) : elm$parser$Parser$Advanced$Loop(
										_Utils_ap(
											found,
											_Utils_ap(
												A2(elm$core$String$repeat, indentCount, ' '),
												str)));
								})),
						elm$parser$Parser$Advanced$oneOf(
							A2(mdgriffith$elm_markup$Mark$Internal$Parser$indentationBetween, indentation + 1, indentation + 4))),
					elm$parser$Parser$Advanced$getChompedString(
						elm$parser$Parser$Advanced$chompWhile(
							function (c) {
								return !_Utils_eq(
									c,
									_Utils_chr('\n'));
							}))),
					elm$parser$Parser$Advanced$succeed(
					elm$parser$Parser$Advanced$Done(found))
				]));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$parseFields = F3(
	function (recordName, fieldNames, fields) {
		var _n0 = fields.remaining;
		if (!_n0.b) {
			return mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
				function (indentation) {
					return A2(
						elm$parser$Parser$Advanced$keeper,
						elm$parser$Parser$Advanced$succeed(
							function (remaining) {
								return (elm$core$String$trim(remaining) === '') ? elm$parser$Parser$Advanced$Done(fields.found) : elm$parser$Parser$Advanced$Done(
									elm$core$Result$Err(
										_Utils_Tuple2(
											elm$core$Maybe$Nothing,
											mdgriffith$elm_markup$Mark$Internal$Error$UnexpectedField(
												{
													found: elm$core$String$trim(remaining),
													options: fieldNames,
													recordName: recordName
												}))));
							}),
						elm$parser$Parser$Advanced$oneOf(
							_List_fromArray(
								[
									A2(
									elm$parser$Parser$Advanced$keeper,
									A2(
										elm$parser$Parser$Advanced$ignorer,
										elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
										elm$parser$Parser$Advanced$token(
											A2(
												elm$parser$Parser$Advanced$Token,
												A2(elm$core$String$repeat, indentation, ' '),
												mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndentation(indentation)))),
									elm$parser$Parser$Advanced$getChompedString(
										elm$parser$Parser$Advanced$chompWhile(
											function (c) {
												return !_Utils_eq(
													c,
													_Utils_chr('\n'));
											}))),
									elm$parser$Parser$Advanced$succeed('')
								])));
				});
		} else {
			var _n1 = fields.found;
			if (_n1.$ === 'Ok') {
				var found = _n1.a;
				return mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
					function (indentation) {
						return elm$parser$Parser$Advanced$oneOf(
							_List_fromArray(
								[
									A2(
									elm$parser$Parser$Advanced$map,
									function (indentedField) {
										switch (indentedField.$) {
											case 'Indented':
												var thing = indentedField.a;
												return thing;
											case 'EmptyLine':
												return elm$parser$Parser$Advanced$Loop(fields);
											default:
												var i = indentedField.a;
												return elm$parser$Parser$Advanced$Loop(
													{
														found: elm$core$Result$Err(
															_Utils_Tuple2(
																elm$core$Maybe$Nothing,
																mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndent(indentation))),
														remaining: fields.remaining
													});
										}
									},
									A2(
										mdgriffith$elm_markup$Mark$Internal$Parser$indentOrSkip,
										indentation,
										A4(mdgriffith$elm_markup$Mark$Internal$Parser$captureField, found, recordName, fields, fieldNames))),
									elm$parser$Parser$Advanced$succeed(
									elm$parser$Parser$Advanced$Done(
										elm$core$Result$Err(
											_Utils_Tuple2(
												elm$core$Maybe$Nothing,
												mdgriffith$elm_markup$Mark$Internal$Error$MissingFields(
													A2(elm$core$List$map, elm$core$Tuple$first, fields.remaining))))))
								]));
					});
			} else {
				var unexpected = _n1.a;
				return mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
					function (indentation) {
						return A2(
							elm$parser$Parser$Advanced$ignorer,
							elm$parser$Parser$Advanced$succeed(
								elm$parser$Parser$Advanced$Done(fields.found)),
							A2(
								elm$parser$Parser$Advanced$loop,
								'',
								mdgriffith$elm_markup$Mark$Internal$Parser$raggedIndentedStringAbove(indentation - 4)));
					});
			}
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$parseInlineFields = F3(
	function (recordName, fieldNames, fields) {
		var hasMore = function () {
			var _n2 = fields.remaining;
			if (!_n2.b) {
				return false;
			} else {
				if (!_n2.b.b) {
					var fst = _n2.a;
					return false;
				} else {
					return true;
				}
			}
		}();
		var _n0 = fields.remaining;
		if (!_n0.b) {
			return A2(
				elm$parser$Parser$Advanced$keeper,
				elm$parser$Parser$Advanced$succeed(
					function (remaining) {
						return (elm$core$String$trim(remaining) === '') ? elm$parser$Parser$Advanced$Done(fields.found) : elm$parser$Parser$Advanced$Done(
							elm$core$Result$Err(
								_Utils_Tuple2(
									elm$core$Maybe$Nothing,
									mdgriffith$elm_markup$Mark$Internal$Error$UnexpectedField(
										{
											found: elm$core$String$trim(remaining),
											options: fieldNames,
											recordName: recordName
										}))));
					}),
				elm$parser$Parser$Advanced$oneOf(
					_List_fromArray(
						[
							elm$parser$Parser$Advanced$getChompedString(
							elm$parser$Parser$Advanced$chompWhile(
								function (c) {
									return !_Utils_eq(
										c,
										_Utils_chr('}'));
								})),
							elm$parser$Parser$Advanced$succeed('')
						])));
		} else {
			var _n1 = fields.found;
			if (_n1.$ === 'Ok') {
				var found = _n1.a;
				return elm$parser$Parser$Advanced$oneOf(
					_List_fromArray(
						[
							A2(
							elm$parser$Parser$Advanced$keeper,
							A2(
								elm$parser$Parser$Advanced$ignorer,
								elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
								elm$parser$Parser$Advanced$chompWhile(
									function (c) {
										return _Utils_eq(
											c,
											_Utils_chr(' '));
									})),
							A2(
								elm$parser$Parser$Advanced$ignorer,
								A2(
									elm$parser$Parser$Advanced$ignorer,
									A4(mdgriffith$elm_markup$Mark$Internal$Parser$captureField, found, recordName, fields, fieldNames),
									elm$parser$Parser$Advanced$chompWhile(
										function (c) {
											return _Utils_eq(
												c,
												_Utils_chr(' '));
										})),
								hasMore ? elm$parser$Parser$Advanced$token(
									A2(
										elm$parser$Parser$Advanced$Token,
										',',
										mdgriffith$elm_markup$Mark$Internal$Error$Expecting(','))) : elm$parser$Parser$Advanced$succeed(_Utils_Tuple0))),
							elm$parser$Parser$Advanced$succeed(
							elm$parser$Parser$Advanced$Done(
								elm$core$Result$Err(
									_Utils_Tuple2(
										elm$core$Maybe$Nothing,
										mdgriffith$elm_markup$Mark$Internal$Error$MissingFields(
											A2(elm$core$List$map, elm$core$Tuple$first, fields.remaining))))))
						]));
			} else {
				var unexpected = _n1.a;
				return A2(
					elm$parser$Parser$Advanced$ignorer,
					elm$parser$Parser$Advanced$succeed(
						elm$parser$Parser$Advanced$Done(fields.found)),
					elm$parser$Parser$Advanced$chompWhile(
						function (c) {
							return !_Utils_eq(
								c,
								_Utils_chr('}'));
						}));
			}
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$withRangeResult = function (parser) {
	return A2(
		elm$parser$Parser$Advanced$keeper,
		A2(
			elm$parser$Parser$Advanced$keeper,
			A2(
				elm$parser$Parser$Advanced$keeper,
				elm$parser$Parser$Advanced$succeed(
					F3(
						function (start, result, end) {
							if (result.$ === 'Ok') {
								var val = result.a;
								return elm$core$Result$Ok(
									{
										range: {end: end, start: start},
										value: val
									});
							} else {
								var err = result.a;
								var range = {end: end, start: start};
								return elm$core$Result$Err(
									{error: err, range: range});
							}
						})),
				mdgriffith$elm_markup$Mark$Internal$Parser$getPosition),
			parser),
		mdgriffith$elm_markup$Mark$Internal$Parser$getPosition);
};
var mdgriffith$elm_markup$Mark$Internal$Parser$record = F5(
	function (recordType, id, recordName, expectations, fields) {
		return A2(
			elm$parser$Parser$Advanced$keeper,
			elm$parser$Parser$Advanced$succeed(
				function (result) {
					if (result.$ === 'Ok') {
						var details = result.a;
						return mdgriffith$elm_markup$Mark$Internal$Description$Record(
							{
								expected: expectations,
								found: A2(
									mdgriffith$elm_markup$Mark$Internal$Description$Found,
									A2(mdgriffith$elm_markup$Mark$Internal$Parser$backtrackCharacters, 2, details.range),
									details.value),
								id: id,
								name: recordName
							});
					} else {
						var err = result.a;
						return mdgriffith$elm_markup$Mark$Internal$Description$Record(
							{
								expected: expectations,
								found: mdgriffith$elm_markup$Mark$Internal$Description$Unexpected(
									{
										problem: err.error.b,
										range: A2(
											elm$core$Maybe$withDefault,
											A2(mdgriffith$elm_markup$Mark$Internal$Parser$backtrackCharacters, 2, err.range),
											err.error.a)
									}),
								id: id,
								name: recordName
							});
					}
				}),
			mdgriffith$elm_markup$Mark$Internal$Parser$withRangeResult(
				mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
					function (indentation) {
						return A2(
							elm$parser$Parser$Advanced$keeper,
							A2(
								elm$parser$Parser$Advanced$ignorer,
								A2(
									elm$parser$Parser$Advanced$ignorer,
									elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
									elm$parser$Parser$Advanced$keyword(
										A2(
											elm$parser$Parser$Advanced$Token,
											recordName,
											mdgriffith$elm_markup$Mark$Internal$Error$ExpectingBlockName(recordName)))),
								elm$parser$Parser$Advanced$chompWhile(
									function (c) {
										return _Utils_eq(
											c,
											_Utils_chr(' '));
									})),
							elm$core$List$isEmpty(fields) ? elm$parser$Parser$Advanced$succeed(
								elm$core$Result$Ok(_List_Nil)) : A2(
								elm$parser$Parser$Advanced$keeper,
								A2(
									elm$parser$Parser$Advanced$ignorer,
									elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
									function () {
										if (recordType.$ === 'InlineRecord') {
											return A2(
												elm$parser$Parser$Advanced$chompIf,
												function (c) {
													return _Utils_eq(
														c,
														_Utils_chr('|'));
												},
												mdgriffith$elm_markup$Mark$Internal$Error$Expecting('bar'));
										} else {
											return A2(
												elm$parser$Parser$Advanced$chompIf,
												function (c) {
													return _Utils_eq(
														c,
														_Utils_chr('\n'));
												},
												mdgriffith$elm_markup$Mark$Internal$Error$Newline);
										}
									}()),
								function () {
									if (recordType.$ === 'InlineRecord') {
										return A2(
											elm$parser$Parser$Advanced$loop,
											{
												found: elm$core$Result$Ok(_List_Nil),
												remaining: fields
											},
											A2(
												mdgriffith$elm_markup$Mark$Internal$Parser$parseInlineFields,
												recordName,
												A2(elm$core$List$map, elm$core$Tuple$first, fields)));
									} else {
										return A2(
											elm$parser$Parser$Advanced$withIndent,
											indentation + 4,
											A2(
												elm$parser$Parser$Advanced$loop,
												{
													found: elm$core$Result$Ok(_List_Nil),
													remaining: fields
												},
												A2(
													mdgriffith$elm_markup$Mark$Internal$Parser$parseFields,
													recordName,
													A2(elm$core$List$map, elm$core$Tuple$first, fields))));
									}
								}()));
					})));
	});
var mdgriffith$elm_markup$Mark$recordToInlineBlock = F2(
	function (_n0, annotationType) {
		var details = _n0.a;
		var expectations = A2(mdgriffith$elm_markup$Mark$Internal$Description$ExpectRecord, details.name, details.expectations);
		return mdgriffith$elm_markup$Mark$Internal$Description$Block(
			{
				converter: function (desc) {
					var _n1 = A2(details.fieldConverter, desc, annotationType);
					switch (_n1.$) {
						case 'Success':
							var _n2 = _n1.a;
							var pos = _n2.a;
							var fieldDescriptions = _n2.b;
							var rendered = _n2.c;
							return mdgriffith$elm_markup$Mark$Internal$Outcome$Success(rendered);
						case 'Failure':
							var fail = _n1.a;
							return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(fail);
						default:
							if (_n1.a.$ === 'Uncertain') {
								var e = _n1.a.a;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
									mdgriffith$elm_markup$Mark$Internal$Description$Uncertain(e));
							} else {
								var _n3 = _n1.a;
								var e = _n3.a;
								var _n4 = _n3.b;
								var pos = _n4.a;
								var fieldDescriptions = _n4.b;
								var rendered = _n4.c;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
									A2(mdgriffith$elm_markup$Mark$Internal$Description$Recovered, e, rendered));
							}
					}
				},
				expect: expectations,
				kind: details.blockKind,
				parser: F2(
					function (context, seed) {
						var _n5 = mdgriffith$elm_markup$Mark$Internal$Id$step(seed);
						var parentId = _n5.a;
						var parentSeed = _n5.b;
						var _n6 = A2(
							mdgriffith$elm_markup$Mark$Internal$Id$thread,
							parentSeed,
							A3(
								elm$core$List$foldl,
								F2(
									function (f, ls) {
										return A2(
											elm$core$List$cons,
											f(mdgriffith$elm_markup$Mark$Internal$Description$ParseInline),
											ls);
									}),
								_List_Nil,
								details.fields));
						var newSeed = _n6.a;
						var fields = _n6.b;
						return _Utils_Tuple2(
							newSeed,
							A5(mdgriffith$elm_markup$Mark$Internal$Parser$record, mdgriffith$elm_markup$Mark$Internal$Parser$InlineRecord, parentId, details.name, expectations, fields));
					})
			});
	});
var mdgriffith$elm_markup$Mark$matchKinds = F2(
	function (inline, blockKind) {
		var recordName = function () {
			var _n2 = inline.record;
			if (_n2.$ === 'Record') {
				var rec = _n2.a;
				return elm$core$Maybe$Just(rec.name);
			} else {
				return elm$core$Maybe$Nothing;
			}
		}();
		var _n0 = _Utils_Tuple3(recordName, inline.kind, blockKind);
		_n0$3:
		while (true) {
			if (_n0.a.$ === 'Just') {
				switch (_n0.b.$) {
					case 'SelectString':
						if (_n0.c.$ === 'VerbatimNamed') {
							var inlineName = _n0.a.a;
							var str = _n0.b.a;
							var vertName = _n0.c.a;
							return _Utils_eq(inlineName, vertName);
						} else {
							break _n0$3;
						}
					case 'SelectText':
						if (_n0.c.$ === 'AnnotationNamed') {
							var inlineName = _n0.a.a;
							var annName = _n0.c.a;
							return _Utils_eq(inlineName, annName);
						} else {
							break _n0$3;
						}
					default:
						if (_n0.c.$ === 'Named') {
							var inlineName = _n0.a.a;
							var _n1 = _n0.b;
							var name = _n0.c.a;
							return _Utils_eq(inlineName, name);
						} else {
							break _n0$3;
						}
				}
			} else {
				break _n0$3;
			}
		}
		return false;
	});
var mdgriffith$elm_markup$Mark$Internal$Description$EmptyAnnotation = {$: 'EmptyAnnotation'};
var mdgriffith$elm_markup$Mark$Internal$Description$Text = F2(
	function (a, b) {
		return {$: 'Text', a: a, b: b};
	});
var mdgriffith$elm_markup$Mark$Internal$Description$emptyStyles = {bold: false, italic: false, strike: false};
var mdgriffith$elm_markup$Mark$Internal$Description$startingCharacters = F2(
	function (one, two) {
		var strikeOpening = ((!one.strike) && two.strike) ? '~' : '';
		var strikeClosing = (one.strike && (!two.strike)) ? '~' : '';
		var italicOpening = ((!one.italic) && two.italic) ? '/' : '';
		var italicClosing = (one.italic && (!two.italic)) ? '/' : '';
		var boldOpening = ((!one.bold) && two.bold) ? '*' : '';
		var boldClosing = (one.bold && (!two.bold)) ? '*' : '';
		return _Utils_ap(
			boldClosing,
			_Utils_ap(
				italicClosing,
				_Utils_ap(
					strikeClosing,
					_Utils_ap(
						strikeOpening,
						_Utils_ap(italicOpening, boldOpening)))));
	});
var mdgriffith$elm_markup$Mark$Internal$Description$gatherText = F2(
	function (_n0, _n1) {
		var styles = _n0.a;
		var txt = _n0.b;
		var existingStyles = _n1.a;
		var existingStr = _n1.b;
		return _Utils_Tuple2(
			styles,
			_Utils_ap(
				existingStr,
				_Utils_ap(
					A2(mdgriffith$elm_markup$Mark$Internal$Description$startingCharacters, existingStyles, styles),
					txt)));
	});
var mdgriffith$elm_markup$Mark$Internal$Description$inlineExample = F2(
	function (kind, _n0) {
		var block = _n0.a;
		var selection = function () {
			switch (kind.$) {
				case 'EmptyAnnotation':
					return '';
				case 'SelectText':
					var txts = kind.a;
					var _n5 = A2(
						mdgriffith$elm_markup$Mark$Internal$Description$gatherText,
						A2(mdgriffith$elm_markup$Mark$Internal$Description$Text, mdgriffith$elm_markup$Mark$Internal$Description$emptyStyles, ''),
						A3(
							elm$core$List$foldl,
							mdgriffith$elm_markup$Mark$Internal$Description$gatherText,
							_Utils_Tuple2(mdgriffith$elm_markup$Mark$Internal$Description$emptyStyles, ''),
							txts));
					var newStyles = _n5.a;
					var renderedText = _n5.b;
					return renderedText;
				default:
					var str = kind.a;
					return str;
			}
		}();
		var renderField = function (_n3) {
			var name = _n3.a;
			var contentBlock = _n3.b;
			return name + (' = ' + 'value');
		};
		var containerAsString = function () {
			var _n2 = block.expect;
			if (_n2.$ === 'ExpectRecord') {
				if (!_n2.b.b) {
					var name = _n2.a;
					return '{' + (name + '}');
				} else {
					var name = _n2.a;
					var fields = _n2.b;
					return '{' + (name + ('| ' + (A2(
						elm$core$String$join,
						', ',
						A2(elm$core$List$map, renderField, fields)) + ' }')));
				}
			} else {
				return '';
			}
		}();
		var _n1 = block.kind;
		switch (_n1.$) {
			case 'Named':
				var name = _n1.a;
				return containerAsString;
			case 'Value':
				return containerAsString;
			case 'VerbatimNamed':
				var str = _n1.a;
				return '`' + (selection + ('`' + containerAsString));
			default:
				var name = _n1.a;
				return '[' + (selection + (']' + containerAsString));
		}
	});
var elm$core$List$sum = function (numbers) {
	return A3(elm$core$List$foldl, elm$core$Basics$add, 0, numbers);
};
var mdgriffith$elm_markup$Mark$Internal$Description$textLength = function (_n0) {
	var str = _n0.b;
	return elm$core$String$length(str);
};
var mdgriffith$elm_markup$Mark$Internal$Description$length = function (inlineEl) {
	if (inlineEl.$ === 'Styled') {
		var txt = inlineEl.b;
		return mdgriffith$elm_markup$Mark$Internal$Description$textLength(txt);
	} else {
		var details = inlineEl.a;
		var _n1 = details.kind;
		switch (_n1.$) {
			case 'EmptyAnnotation':
				return 0;
			case 'SelectString':
				var str = _n1.a;
				return elm$core$String$length(str);
			default:
				var txts = _n1.a;
				return elm$core$List$sum(
					A2(elm$core$List$map, mdgriffith$elm_markup$Mark$Internal$Description$textLength, txts));
		}
	}
};
var mdgriffith$elm_markup$Mark$Internal$Description$mergeErrors = F2(
	function (_n0, _n1) {
		var h1 = _n0.a;
		var r1 = _n0.b;
		var h2 = _n1.a;
		var r2 = _n1.b;
		return _Utils_Tuple2(
			h1,
			_Utils_ap(
				r1,
				A2(elm$core$List$cons, h2, r2)));
	});
var mdgriffith$elm_markup$Mark$Internal$Description$mergeWith = F3(
	function (fn, one, two) {
		var _n0 = _Utils_Tuple2(one, two);
		_n0$3:
		while (true) {
			_n0$4:
			while (true) {
				switch (_n0.a.$) {
					case 'Success':
						switch (_n0.b.$) {
							case 'Success':
								var renderedOne = _n0.a.a;
								var renderedTwo = _n0.b.a;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Success(
									A2(fn, renderedOne, renderedTwo));
							case 'Almost':
								if (_n0.b.a.$ === 'Uncertain') {
									break _n0$3;
								} else {
									break _n0$4;
								}
							default:
								break _n0$4;
						}
					case 'Almost':
						if (_n0.a.a.$ === 'Recovered') {
							if (_n0.b.$ === 'Almost') {
								if (_n0.b.a.$ === 'Recovered') {
									var _n1 = _n0.a.a;
									var firstErrs = _n1.a;
									var fst = _n1.b;
									var _n2 = _n0.b.a;
									var secondErrs = _n2.a;
									var snd = _n2.b;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
										A2(
											mdgriffith$elm_markup$Mark$Internal$Description$Recovered,
											A2(mdgriffith$elm_markup$Mark$Internal$Description$mergeErrors, firstErrs, secondErrs),
											A2(fn, fst, snd)));
								} else {
									break _n0$3;
								}
							} else {
								break _n0$4;
							}
						} else {
							var unexpected = _n0.a.a.a;
							return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
								mdgriffith$elm_markup$Mark$Internal$Description$Uncertain(unexpected));
						}
					default:
						if ((_n0.b.$ === 'Almost') && (_n0.b.a.$ === 'Uncertain')) {
							break _n0$3;
						} else {
							break _n0$4;
						}
				}
			}
			return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
		}
		var unexpected = _n0.b.a.a;
		return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
			mdgriffith$elm_markup$Mark$Internal$Description$Uncertain(unexpected));
	});
var mdgriffith$elm_markup$Mark$Internal$Description$recordName = function (desc) {
	if (desc.$ === 'Record') {
		var details = desc.a;
		return elm$core$Maybe$Just(details.name);
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var mdgriffith$elm_markup$Mark$Internal$Error$UnknownInline = function (a) {
	return {$: 'UnknownInline', a: a};
};
var mdgriffith$elm_markup$Mark$convertTextDescription = F4(
	function (id, options, comp, cursor) {
		var blockLength = mdgriffith$elm_markup$Mark$Internal$Description$length(comp);
		if (comp.$ === 'Styled') {
			var range = comp.a;
			var _n1 = comp.b;
			var styling = _n1.a;
			var str = _n1.b;
			return {
				lastOffset: cursor.lastOffset + blockLength,
				outcome: A3(
					mdgriffith$elm_markup$Mark$Internal$Description$mergeWith,
					elm$core$List$cons,
					mdgriffith$elm_markup$Mark$Internal$Outcome$Success(
						A3(
							options.view,
							{
								id: id,
								selection: {anchor: cursor.lastOffset, focus: cursor.lastOffset + blockLength}
							},
							styling,
							str)),
					cursor.outcome)
			};
		} else {
			var details = comp.a;
			var recordName = A2(
				elm$core$Maybe$withDefault,
				'',
				mdgriffith$elm_markup$Mark$Internal$Description$recordName(details.record));
			var matchInlineName = F3(
				function (name, almostInlineBlock, maybeFound) {
					if (maybeFound.$ === 'Nothing') {
						var _n4 = almostInlineBlock(details.kind);
						var inlineDetails = _n4.a;
						return A2(mdgriffith$elm_markup$Mark$matchKinds, details, inlineDetails.kind) ? elm$core$Maybe$Just(inlineDetails) : elm$core$Maybe$Nothing;
					} else {
						return maybeFound;
					}
				});
			var maybeMatched = A3(
				elm$core$List$foldl,
				matchInlineName(recordName),
				elm$core$Maybe$Nothing,
				options.inlines);
			if (maybeMatched.$ === 'Nothing') {
				return {
					lastOffset: cursor.lastOffset + blockLength,
					outcome: mdgriffith$elm_markup$Mark$Internal$Description$uncertain(
						{
							problem: mdgriffith$elm_markup$Mark$Internal$Error$UnknownInline(
								A2(
									elm$core$List$map,
									function (inline) {
										return A2(
											mdgriffith$elm_markup$Mark$Internal$Description$inlineExample,
											details.kind,
											inline(mdgriffith$elm_markup$Mark$Internal$Description$EmptyAnnotation));
									},
									options.inlines)),
							range: details.range
						})
				};
			} else {
				var matched = maybeMatched.a;
				return {
					lastOffset: cursor.lastOffset + blockLength,
					outcome: A3(
						mdgriffith$elm_markup$Mark$Internal$Description$mergeWith,
						elm$core$List$cons,
						matched.converter(details.record),
						cursor.outcome)
				};
			}
		}
	});
var mdgriffith$elm_markup$Mark$renderText = F2(
	function (options, description) {
		if (description.$ === 'DescribeText') {
			var details = description.a;
			return A2(
				mdgriffith$elm_markup$Mark$Internal$Description$mapSuccessAndRecovered,
				elm$core$List$reverse,
				A3(
					elm$core$List$foldl,
					A2(mdgriffith$elm_markup$Mark$convertTextDescription, details.id, options),
					{
						lastOffset: 0,
						outcome: mdgriffith$elm_markup$Mark$Internal$Outcome$Success(_List_Nil)
					},
					details.text).outcome);
		} else {
			return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Description$ExpectInlineBlock = function (a) {
	return {$: 'ExpectInlineBlock', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$ExpectTextBlock = function (a) {
	return {$: 'ExpectTextBlock', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$SelectString = function (a) {
	return {$: 'SelectString', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$SelectText = function (a) {
	return {$: 'SelectText', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$blockKindToSelection = function (kind) {
	switch (kind.$) {
		case 'Value':
			return mdgriffith$elm_markup$Mark$Internal$Description$EmptyAnnotation;
		case 'Named':
			var name = kind.a;
			return mdgriffith$elm_markup$Mark$Internal$Description$EmptyAnnotation;
		case 'VerbatimNamed':
			var name = kind.a;
			return mdgriffith$elm_markup$Mark$Internal$Description$SelectString('');
		default:
			var name = kind.a;
			return mdgriffith$elm_markup$Mark$Internal$Description$SelectText(_List_Nil);
	}
};
var elm$core$String$cons = _String_cons;
var elm$core$String$fromChar = function (_char) {
	return A2(elm$core$String$cons, _char, '');
};
var mdgriffith$elm_markup$Mark$Internal$Description$DescribeText = function (a) {
	return {$: 'DescribeText', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$firstChar = function (str) {
	var _n0 = elm$core$String$uncons(str);
	if (_n0.$ === 'Nothing') {
		return elm$core$Maybe$Nothing;
	} else {
		var _n1 = _n0.a;
		var fst = _n1.a;
		return elm$core$Maybe$Just(fst);
	}
};
var mdgriffith$elm_markup$Mark$Internal$Parser$replacementStartingChars = function (replacements) {
	var first = function (repl) {
		if (repl.$ === 'Replacement') {
			var x = repl.a;
			var y = repl.b;
			return mdgriffith$elm_markup$Mark$Internal$Parser$firstChar(x);
		} else {
			var range = repl.a;
			return mdgriffith$elm_markup$Mark$Internal$Parser$firstChar(range.start.a);
		}
	};
	return A2(elm$core$List$filterMap, first, replacements);
};
var elm$core$List$member = F2(
	function (x, xs) {
		return A2(
			elm$core$List$any,
			function (a) {
				return _Utils_eq(a, x);
			},
			xs);
	});
var elm$core$String$trimRight = _String_trimRight;
var elm$parser$Parser$Advanced$problem = function (x) {
	return elm$parser$Parser$Advanced$Parser(
		function (s) {
			return A2(
				elm$parser$Parser$Advanced$Bad,
				false,
				A2(elm$parser$Parser$Advanced$fromState, s, x));
		});
};
var mdgriffith$elm_markup$Mark$Internal$Description$Bold = {$: 'Bold'};
var mdgriffith$elm_markup$Mark$Internal$Description$DescribeNothing = function (a) {
	return {$: 'DescribeNothing', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$InlineBlock = function (a) {
	return {$: 'InlineBlock', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$Italic = {$: 'Italic'};
var mdgriffith$elm_markup$Mark$Internal$Description$Strike = {$: 'Strike'};
var mdgriffith$elm_markup$Mark$Internal$Description$Styled = F2(
	function (a, b) {
		return {$: 'Styled', a: a, b: b};
	});
var mdgriffith$elm_markup$Mark$Internal$Id$initialSeed = mdgriffith$elm_markup$Mark$Internal$Id$Seed(
	_List_fromArray(
		[0]));
var mdgriffith$elm_markup$Mark$Internal$Parser$ContinueWith = function (a) {
	return {$: 'ContinueWith', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$StopWith = function (a) {
	return {$: 'StopWith', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor = function (a) {
	return {$: 'TextCursor', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$addText = F2(
	function (newTxt, _n0) {
		var cursor = _n0.a;
		var _n1 = cursor.current;
		var styles = _n1.a;
		var txt = _n1.b;
		return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
			_Utils_update(
				cursor,
				{
					current: A2(
						mdgriffith$elm_markup$Mark$Internal$Description$Text,
						styles,
						_Utils_ap(txt, newTxt))
				}));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$addToTextCursor = F2(
	function (_new, _n0) {
		var cursor = _n0.a;
		return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
			_Utils_update(
				cursor,
				{
					found: A2(elm$core$List$cons, _new, cursor.found)
				}));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$advanceTo = F2(
	function (target, _n0) {
		var cursor = _n0.a;
		return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
			{balancedReplacements: cursor.balancedReplacements, current: cursor.current, found: cursor.found, start: target});
	});
var mdgriffith$elm_markup$Mark$Internal$Error$EscapedChar = {$: 'EscapedChar'};
var mdgriffith$elm_markup$Mark$Internal$Parser$almostReplacement = F2(
	function (replacements, existing) {
		var first = function (repl) {
			if (repl.$ === 'Replacement') {
				var x = repl.a;
				var y = repl.b;
				return mdgriffith$elm_markup$Mark$Internal$Parser$firstChar(x);
			} else {
				var range = repl.a;
				return mdgriffith$elm_markup$Mark$Internal$Parser$firstChar(range.start.a);
			}
		};
		var captureChar = function (_char) {
			return A2(
				elm$parser$Parser$Advanced$keeper,
				elm$parser$Parser$Advanced$succeed(
					function (c) {
						return A2(mdgriffith$elm_markup$Mark$Internal$Parser$addText, c, existing);
					}),
				elm$parser$Parser$Advanced$getChompedString(
					A2(
						elm$parser$Parser$Advanced$chompIf,
						function (c) {
							return _Utils_eq(c, _char) && ((!_Utils_eq(
								_char,
								_Utils_chr('{'))) && ((!_Utils_eq(
								_char,
								_Utils_chr('*'))) && (!_Utils_eq(
								_char,
								_Utils_chr('/')))));
						},
						mdgriffith$elm_markup$Mark$Internal$Error$EscapedChar)));
		};
		var allFirstChars = A2(elm$core$List$filterMap, first, replacements);
		return A2(
			elm$core$List$map,
			captureChar,
			A2(
				elm$core$List$cons,
				_Utils_chr('1'),
				allFirstChars));
	});
var mdgriffith$elm_markup$Mark$Internal$Error$ExpectingInlineName = function (a) {
	return {$: 'ExpectingInlineName', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Error$InlineEnd = {$: 'InlineEnd'};
var mdgriffith$elm_markup$Mark$Internal$Error$InlineStart = {$: 'InlineStart'};
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$okUnit = elm$core$Result$Ok(_Utils_Tuple0);
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$chompWhile = function (_while) {
	return A2(
		elm$parser$Parser$Advanced$ignorer,
		elm$parser$Parser$Advanced$succeed(mdgriffith$elm_markup$Mark$Internal$TolerantParser$okUnit),
		elm$parser$Parser$Advanced$chompWhile(_while));
};
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$FastForwardTo = function (a) {
	return {$: 'FastForwardTo', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$fastForwardTo = mdgriffith$elm_markup$Mark$Internal$TolerantParser$FastForwardTo;
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$ignore = F2(
	function (ignorePls, keepPls) {
		return A2(
			elm$parser$Parser$Advanced$andThen,
			function (possiblyKeepThisOne) {
				if (possiblyKeepThisOne.$ === 'Err') {
					var err = possiblyKeepThisOne.a;
					return elm$parser$Parser$Advanced$succeed(
						elm$core$Result$Err(err));
				} else {
					var keepThisOne = possiblyKeepThisOne.a;
					return A2(
						elm$parser$Parser$Advanced$map,
						function (possibly) {
							if (possibly.$ === 'Ok') {
								return elm$core$Result$Ok(keepThisOne);
							} else {
								var newErr = possibly.a;
								return elm$core$Result$Err(newErr);
							}
						},
						ignorePls);
				}
			},
			keepPls);
	});
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$keep = F2(
	function (newDataParser, fnParser) {
		return A2(
			elm$parser$Parser$Advanced$andThen,
			function (existing) {
				if (existing.$ === 'Err') {
					var err = existing.a;
					return elm$parser$Parser$Advanced$succeed(
						elm$core$Result$Err(err));
				} else {
					var fn = existing.a;
					return A2(
						elm$parser$Parser$Advanced$map,
						function (possiblyNew) {
							if (possiblyNew.$ === 'Ok') {
								var _new = possiblyNew.a;
								return elm$core$Result$Ok(
									fn(_new));
							} else {
								var newErr = possiblyNew.a;
								return elm$core$Result$Err(newErr);
							}
						},
						newDataParser);
				}
			},
			fnParser);
	});
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$oneOf = F2(
	function (prob, options) {
		return elm$parser$Parser$Advanced$oneOf(
			_Utils_ap(
				options,
				_List_fromArray(
					[
						elm$parser$Parser$Advanced$succeed(
						elm$core$Result$Err(
							_List_fromArray(
								[prob])))
					])));
	});
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$StopWith = function (a) {
	return {$: 'StopWith', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$stopWith = function (err) {
	return mdgriffith$elm_markup$Mark$Internal$TolerantParser$StopWith(err);
};
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$succeed = function (x) {
	return elm$parser$Parser$Advanced$succeed(
		elm$core$Result$Ok(x));
};
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$till = F2(
	function (chars, prob) {
		return A2(
			elm$parser$Parser$Advanced$ignorer,
			A2(
				elm$parser$Parser$Advanced$ignorer,
				elm$parser$Parser$Advanced$succeed(_Utils_Tuple0),
				elm$parser$Parser$Advanced$chompWhile(
					function (c) {
						return !A2(elm$core$List$member, c, chars);
					})),
			elm$parser$Parser$Advanced$oneOf(
				_List_fromArray(
					[
						A2(
						elm$parser$Parser$Advanced$map,
						elm$core$Basics$always(true),
						A2(
							elm$parser$Parser$Advanced$chompIf,
							function (c) {
								return A2(elm$core$List$member, c, chars);
							},
							prob)),
						elm$parser$Parser$Advanced$succeed(false)
					])));
	});
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$runToken = F2(
	function (details, tokenParser) {
		var _n0 = details.onError;
		switch (_n0.$) {
			case 'FastForwardTo':
				var skipTo = _n0.a;
				return elm$parser$Parser$Advanced$oneOf(
					_List_fromArray(
						[
							A2(elm$parser$Parser$Advanced$map, elm$core$Result$Ok, tokenParser),
							A2(
							elm$parser$Parser$Advanced$ignorer,
							elm$parser$Parser$Advanced$succeed(
								elm$core$Result$Err(
									_List_fromArray(
										[details.problem]))),
							A2(mdgriffith$elm_markup$Mark$Internal$TolerantParser$till, skipTo, details.problem))
						]));
			case 'Skip':
				return A2(elm$parser$Parser$Advanced$map, elm$core$Result$Ok, tokenParser);
			default:
				var err = _n0.a;
				return elm$parser$Parser$Advanced$oneOf(
					_List_fromArray(
						[
							A2(elm$parser$Parser$Advanced$map, elm$core$Result$Ok, tokenParser),
							elm$parser$Parser$Advanced$succeed(
							elm$core$Result$Err(
								_List_fromArray(
									[err])))
						]));
		}
	});
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$token = function (details) {
	return A2(
		mdgriffith$elm_markup$Mark$Internal$TolerantParser$runToken,
		details,
		elm$parser$Parser$Advanced$token(
			A2(elm$parser$Parser$Advanced$Token, details.match, details.problem)));
};
var mdgriffith$elm_markup$Mark$Internal$TolerantParser$try = elm$parser$Parser$Advanced$map(elm$core$Result$Ok);
var mdgriffith$elm_markup$Mark$Internal$Parser$attrContainer = function (recordBlocks) {
	return A2(
		mdgriffith$elm_markup$Mark$Internal$TolerantParser$ignore,
		mdgriffith$elm_markup$Mark$Internal$TolerantParser$token(
			{
				match: '}',
				onError: mdgriffith$elm_markup$Mark$Internal$TolerantParser$fastForwardTo(
					_List_fromArray(
						[
							_Utils_chr('}'),
							_Utils_chr('\n')
						])),
				problem: mdgriffith$elm_markup$Mark$Internal$Error$InlineEnd
			}),
		A2(
			mdgriffith$elm_markup$Mark$Internal$TolerantParser$ignore,
			mdgriffith$elm_markup$Mark$Internal$TolerantParser$chompWhile(
				function (c) {
					return _Utils_eq(
						c,
						_Utils_chr(' '));
				}),
			A2(
				mdgriffith$elm_markup$Mark$Internal$TolerantParser$keep,
				A2(
					mdgriffith$elm_markup$Mark$Internal$TolerantParser$oneOf,
					mdgriffith$elm_markup$Mark$Internal$Error$ExpectingInlineName(''),
					A2(
						elm$core$List$map,
						A2(
							elm$core$Basics$composeL,
							A2(elm$core$Basics$composeL, mdgriffith$elm_markup$Mark$Internal$TolerantParser$try, elm$core$Tuple$second),
							A2(mdgriffith$elm_markup$Mark$Internal$Description$getParser, mdgriffith$elm_markup$Mark$Internal$Description$ParseInline, mdgriffith$elm_markup$Mark$Internal$Id$initialSeed)),
						recordBlocks)),
				A2(
					mdgriffith$elm_markup$Mark$Internal$TolerantParser$ignore,
					mdgriffith$elm_markup$Mark$Internal$TolerantParser$chompWhile(
						function (c) {
							return _Utils_eq(
								c,
								_Utils_chr(' '));
						}),
					A2(
						mdgriffith$elm_markup$Mark$Internal$TolerantParser$ignore,
						mdgriffith$elm_markup$Mark$Internal$TolerantParser$token(
							{
								match: '{',
								onError: mdgriffith$elm_markup$Mark$Internal$TolerantParser$stopWith(mdgriffith$elm_markup$Mark$Internal$Error$InlineStart),
								problem: mdgriffith$elm_markup$Mark$Internal$Error$InlineStart
							}),
						mdgriffith$elm_markup$Mark$Internal$TolerantParser$succeed(elm$core$Basics$identity))))));
};
var mdgriffith$elm_markup$Mark$Internal$Parser$clearText = function (_n0) {
	var styles = _n0.a;
	return A2(mdgriffith$elm_markup$Mark$Internal$Description$Text, styles, '');
};
var mdgriffith$elm_markup$Mark$Internal$Parser$flipStyle = F2(
	function (newStyle, textStyle) {
		var styles = textStyle.a;
		var str = textStyle.b;
		switch (newStyle.$) {
			case 'Bold':
				return A2(
					mdgriffith$elm_markup$Mark$Internal$Description$Text,
					_Utils_update(
						styles,
						{bold: !styles.bold}),
					str);
			case 'Italic':
				return A2(
					mdgriffith$elm_markup$Mark$Internal$Description$Text,
					_Utils_update(
						styles,
						{italic: !styles.italic}),
					str);
			default:
				return A2(
					mdgriffith$elm_markup$Mark$Internal$Description$Text,
					_Utils_update(
						styles,
						{strike: !styles.strike}),
					str);
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$measure = F2(
	function (start, textStr) {
		var len = elm$core$String$length(textStr);
		return _Utils_update(
			start,
			{column: start.column + len, offset: start.offset + len});
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$changeStyle = F2(
	function (_n0, styleToken) {
		var cursor = _n0.a;
		var newText = mdgriffith$elm_markup$Mark$Internal$Parser$clearText(
			A2(mdgriffith$elm_markup$Mark$Internal$Parser$flipStyle, styleToken, cursor.current));
		var cursorText = function () {
			var _n1 = cursor.current;
			var txt = _n1.b;
			return txt;
		}();
		if (cursorText === '') {
			return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
				{balancedReplacements: cursor.balancedReplacements, current: newText, found: cursor.found, start: cursor.start});
		} else {
			var end = A2(mdgriffith$elm_markup$Mark$Internal$Parser$measure, cursor.start, cursorText);
			return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
				{
					balancedReplacements: cursor.balancedReplacements,
					current: newText,
					found: A2(
						elm$core$List$cons,
						A2(
							mdgriffith$elm_markup$Mark$Internal$Description$Styled,
							{end: end, start: cursor.start},
							cursor.current),
						cursor.found),
					start: end
				});
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$commitText = function (existingTextCursor) {
	var cursor = existingTextCursor.a;
	var _n0 = cursor.current;
	if (_n0.b === '') {
		return existingTextCursor;
	} else {
		var styles = _n0.a;
		var cursorText = _n0.b;
		var end = A2(mdgriffith$elm_markup$Mark$Internal$Parser$measure, cursor.start, cursorText);
		return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
			{
				balancedReplacements: cursor.balancedReplacements,
				current: A2(mdgriffith$elm_markup$Mark$Internal$Description$Text, styles, ''),
				found: A2(
					elm$core$List$cons,
					A2(
						mdgriffith$elm_markup$Mark$Internal$Description$Styled,
						{end: end, start: cursor.start},
						cursor.current),
					cursor.found),
				start: end
			});
	}
};
var mdgriffith$elm_markup$Mark$Internal$Parser$getCurrentStyle = function (_n0) {
	var cursor = _n0.a;
	var _n1 = cursor.current;
	var s = _n1.a;
	return s;
};
var mdgriffith$elm_markup$Mark$Internal$Parser$onlyAnnotation = function (thisBlock) {
	var details = thisBlock.a;
	var _n0 = details.kind;
	switch (_n0.$) {
		case 'Value':
			return elm$core$Maybe$Nothing;
		case 'Named':
			var name = _n0.a;
			return elm$core$Maybe$Nothing;
		case 'VerbatimNamed':
			return elm$core$Maybe$Nothing;
		default:
			return elm$core$Maybe$Just(thisBlock);
	}
};
var mdgriffith$elm_markup$Mark$Internal$Parser$onlyVerbatim = function (thisBlock) {
	var details = thisBlock.a;
	var _n0 = details.kind;
	switch (_n0.$) {
		case 'Value':
			return elm$core$Maybe$Nothing;
		case 'Named':
			var name = _n0.a;
			return elm$core$Maybe$Nothing;
		case 'VerbatimNamed':
			return elm$core$Maybe$Just(thisBlock);
		default:
			return elm$core$Maybe$Nothing;
	}
};
var mdgriffith$elm_markup$Mark$Internal$Error$Escape = {$: 'Escape'};
var mdgriffith$elm_markup$Mark$Internal$Parser$addBalance = F2(
	function (id, _n0) {
		var cursor = _n0.a;
		return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
			_Utils_update(
				cursor,
				{
					balancedReplacements: A2(elm$core$List$cons, id, cursor.balancedReplacements)
				}));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$balanceId = function (balance) {
	var join = function (_n0) {
		var x = _n0.a;
		var y = _n0.b;
		return _Utils_ap(x, y);
	};
	return _Utils_ap(
		join(balance.start),
		join(balance.end));
};
var mdgriffith$elm_markup$Mark$Internal$Parser$removeBalance = F2(
	function (id, _n0) {
		var cursor = _n0.a;
		return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
			_Utils_update(
				cursor,
				{
					balancedReplacements: A2(
						elm$core$List$filter,
						elm$core$Basics$neq(id),
						cursor.balancedReplacements)
				}));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$replace = F2(
	function (replacements, existing) {
		var replaceWith = function (repl) {
			if (repl.$ === 'Replacement') {
				var x = repl.a;
				var y = repl.b;
				return A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(
							function (_n1) {
								return A2(mdgriffith$elm_markup$Mark$Internal$Parser$addText, y, existing);
							}),
						elm$parser$Parser$Advanced$token(
							A2(
								elm$parser$Parser$Advanced$Token,
								x,
								mdgriffith$elm_markup$Mark$Internal$Error$Expecting(x)))),
					elm$parser$Parser$Advanced$succeed(_Utils_Tuple0));
			} else {
				var range = repl.a;
				var id = mdgriffith$elm_markup$Mark$Internal$Parser$balanceId(range);
				var balanceCache = function () {
					var cursor = existing.a;
					return cursor.balancedReplacements;
				}();
				if (A2(elm$core$List$member, id, balanceCache)) {
					var _n2 = range.end;
					var x = _n2.a;
					var y = _n2.b;
					return A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(
							A2(
								mdgriffith$elm_markup$Mark$Internal$Parser$removeBalance,
								id,
								A2(mdgriffith$elm_markup$Mark$Internal$Parser$addText, y, existing))),
						elm$parser$Parser$Advanced$token(
							A2(
								elm$parser$Parser$Advanced$Token,
								x,
								mdgriffith$elm_markup$Mark$Internal$Error$Expecting(x))));
				} else {
					var _n3 = range.start;
					var x = _n3.a;
					var y = _n3.b;
					return A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(
							A2(
								mdgriffith$elm_markup$Mark$Internal$Parser$addBalance,
								id,
								A2(mdgriffith$elm_markup$Mark$Internal$Parser$addText, y, existing))),
						elm$parser$Parser$Advanced$token(
							A2(
								elm$parser$Parser$Advanced$Token,
								x,
								mdgriffith$elm_markup$Mark$Internal$Error$Expecting(x))));
				}
			}
		};
		var escaped = A2(
			elm$parser$Parser$Advanced$keeper,
			A2(
				elm$parser$Parser$Advanced$ignorer,
				elm$parser$Parser$Advanced$succeed(
					function (esc) {
						return A2(mdgriffith$elm_markup$Mark$Internal$Parser$addText, esc, existing);
					}),
				elm$parser$Parser$Advanced$token(
					A2(elm$parser$Parser$Advanced$Token, '\\', mdgriffith$elm_markup$Mark$Internal$Error$Escape))),
			elm$parser$Parser$Advanced$getChompedString(
				A2(
					elm$parser$Parser$Advanced$chompIf,
					elm$core$Basics$always(true),
					mdgriffith$elm_markup$Mark$Internal$Error$EscapedChar)));
		return A2(
			elm$core$List$cons,
			escaped,
			A2(elm$core$List$map, replaceWith, replacements));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$resetBalancedReplacements = F2(
	function (newBalance, _n0) {
		var cursor = _n0.a;
		return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
			_Utils_update(
				cursor,
				{balancedReplacements: newBalance}));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$resetTextWith = F2(
	function (_n0, _n1) {
		var styles = _n0.a;
		var cursor = _n1.a;
		return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
			_Utils_update(
				cursor,
				{
					current: A2(mdgriffith$elm_markup$Mark$Internal$Description$Text, styles, '')
				}));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$getStyles = function (_n0) {
	var styles = _n0.a;
	return styles;
};
var mdgriffith$elm_markup$Mark$Internal$Parser$getCurrentStyles = function (_n0) {
	var cursor = _n0.a;
	return mdgriffith$elm_markup$Mark$Internal$Parser$getStyles(cursor.current);
};
var mdgriffith$elm_markup$Mark$Internal$Parser$stylingChars = _List_fromArray(
	[
		_Utils_chr('~'),
		_Utils_chr('['),
		_Utils_chr('/'),
		_Utils_chr('*'),
		_Utils_chr('\n'),
		_Utils_chr('{'),
		_Utils_chr('`')
	]);
var mdgriffith$elm_markup$Mark$Internal$Parser$toText = function (textDesc) {
	if (textDesc.$ === 'Styled') {
		var txt = textDesc.b;
		return elm$core$Maybe$Just(txt);
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var mdgriffith$elm_markup$Mark$Internal$Parser$simpleStyledTextTill = F3(
	function (until, replacements, cursor) {
		return elm$parser$Parser$Advanced$oneOf(
			_List_fromArray(
				[
					A2(
					elm$parser$Parser$Advanced$map,
					elm$parser$Parser$Advanced$Loop,
					elm$parser$Parser$Advanced$oneOf(
						A2(mdgriffith$elm_markup$Mark$Internal$Parser$replace, replacements, cursor))),
					A2(
					elm$parser$Parser$Advanced$map,
					elm$parser$Parser$Advanced$Loop,
					elm$parser$Parser$Advanced$oneOf(
						A2(mdgriffith$elm_markup$Mark$Internal$Parser$almostReplacement, replacements, cursor))),
					A2(
					elm$parser$Parser$Advanced$keeper,
					elm$parser$Parser$Advanced$succeed(
						A2(
							elm$core$Basics$composeL,
							elm$parser$Parser$Advanced$Loop,
							mdgriffith$elm_markup$Mark$Internal$Parser$changeStyle(cursor))),
					elm$parser$Parser$Advanced$oneOf(
						_List_fromArray(
							[
								A2(
								elm$parser$Parser$Advanced$map,
								elm$core$Basics$always(mdgriffith$elm_markup$Mark$Internal$Description$Italic),
								elm$parser$Parser$Advanced$token(
									A2(
										elm$parser$Parser$Advanced$Token,
										'/',
										mdgriffith$elm_markup$Mark$Internal$Error$Expecting('/')))),
								A2(
								elm$parser$Parser$Advanced$map,
								elm$core$Basics$always(mdgriffith$elm_markup$Mark$Internal$Description$Strike),
								elm$parser$Parser$Advanced$token(
									A2(
										elm$parser$Parser$Advanced$Token,
										'~',
										mdgriffith$elm_markup$Mark$Internal$Error$Expecting('~')))),
								A2(
								elm$parser$Parser$Advanced$map,
								elm$core$Basics$always(mdgriffith$elm_markup$Mark$Internal$Description$Bold),
								elm$parser$Parser$Advanced$token(
									A2(
										elm$parser$Parser$Advanced$Token,
										'*',
										mdgriffith$elm_markup$Mark$Internal$Error$Expecting('*'))))
							]))),
					A2(
					elm$parser$Parser$Advanced$andThen,
					function (_new) {
						if ((_new === '') || (_new === '\n')) {
							var _n0 = mdgriffith$elm_markup$Mark$Internal$Parser$commitText(cursor);
							var txt = _n0.a;
							var styling = function () {
								var _n1 = txt.current;
								var s = _n1.a;
								return s;
							}();
							return elm$parser$Parser$Advanced$succeed(
								elm$parser$Parser$Advanced$Done(
									_Utils_Tuple2(
										elm$core$List$reverse(
											A2(elm$core$List$filterMap, mdgriffith$elm_markup$Mark$Internal$Parser$toText, txt.found)),
										mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(txt))));
						} else {
							return elm$parser$Parser$Advanced$succeed(
								elm$parser$Parser$Advanced$Loop(
									A2(mdgriffith$elm_markup$Mark$Internal$Parser$addText, _new, cursor)));
						}
					},
					elm$parser$Parser$Advanced$getChompedString(
						elm$parser$Parser$Advanced$chompWhile(
							function (c) {
								return !A2(
									elm$core$List$member,
									c,
									A2(
										elm$core$List$cons,
										_Utils_chr('\\'),
										A2(
											elm$core$List$cons,
											_Utils_chr('\n'),
											_Utils_ap(
												until,
												_Utils_ap(
													mdgriffith$elm_markup$Mark$Internal$Parser$stylingChars,
													mdgriffith$elm_markup$Mark$Internal$Parser$replacementStartingChars(replacements))))));
							})))
				]));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$textCursor = F2(
	function (inheritedStyles, startingPos) {
		return mdgriffith$elm_markup$Mark$Internal$Parser$TextCursor(
			{
				balancedReplacements: _List_Nil,
				current: A2(mdgriffith$elm_markup$Mark$Internal$Description$Text, inheritedStyles, ''),
				found: _List_Nil,
				start: startingPos
			});
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$textSelection = F2(
	function (replacements, found) {
		return elm$parser$Parser$Advanced$oneOf(
			_List_fromArray(
				[
					A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(
							function (str) {
								return _Utils_Tuple2(
									elm$core$Maybe$Nothing,
									mdgriffith$elm_markup$Mark$Internal$Description$SelectString(str));
							}),
						elm$parser$Parser$Advanced$token(
							A2(
								elm$parser$Parser$Advanced$Token,
								'`',
								mdgriffith$elm_markup$Mark$Internal$Error$Expecting('`')))),
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$getChompedString(
							elm$parser$Parser$Advanced$chompWhile(
								function (c) {
									return (!_Utils_eq(
										c,
										_Utils_chr('`'))) && (!_Utils_eq(
										c,
										_Utils_chr('\n')));
								})),
						elm$parser$Parser$Advanced$chompWhile(
							function (c) {
								return _Utils_eq(
									c,
									_Utils_chr('`'));
							}))),
					A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(
							function (_n0) {
								var txts = _n0.a;
								var cursor = _n0.b;
								return _Utils_Tuple2(
									elm$core$Maybe$Just(cursor),
									mdgriffith$elm_markup$Mark$Internal$Description$SelectText(txts));
							}),
						elm$parser$Parser$Advanced$token(
							A2(
								elm$parser$Parser$Advanced$Token,
								'[',
								mdgriffith$elm_markup$Mark$Internal$Error$Expecting('[')))),
					A2(
						elm$parser$Parser$Advanced$ignorer,
						A2(
							elm$parser$Parser$Advanced$loop,
							A2(
								mdgriffith$elm_markup$Mark$Internal$Parser$textCursor,
								mdgriffith$elm_markup$Mark$Internal$Parser$getCurrentStyles(found),
								{column: 1, line: 1, offset: 0}),
							A2(
								mdgriffith$elm_markup$Mark$Internal$Parser$simpleStyledTextTill,
								_List_fromArray(
									[
										_Utils_chr('\n'),
										_Utils_chr(']')
									]),
								replacements)),
						elm$parser$Parser$Advanced$token(
							A2(
								elm$parser$Parser$Advanced$Token,
								']',
								mdgriffith$elm_markup$Mark$Internal$Error$Expecting(']')))))
				]));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$styledTextLoop = F5(
	function (options, context, meaningful, untilStrings, found) {
		return elm$parser$Parser$Advanced$oneOf(
			_List_fromArray(
				[
					A2(
					elm$parser$Parser$Advanced$map,
					elm$parser$Parser$Advanced$Loop,
					elm$parser$Parser$Advanced$oneOf(
						A2(mdgriffith$elm_markup$Mark$Internal$Parser$replace, options.replacements, found))),
					A2(
					elm$parser$Parser$Advanced$map,
					elm$parser$Parser$Advanced$Loop,
					elm$parser$Parser$Advanced$oneOf(
						A2(mdgriffith$elm_markup$Mark$Internal$Parser$almostReplacement, options.replacements, found))),
					A2(
					elm$parser$Parser$Advanced$keeper,
					elm$parser$Parser$Advanced$succeed(
						A2(
							elm$core$Basics$composeL,
							elm$parser$Parser$Advanced$Loop,
							mdgriffith$elm_markup$Mark$Internal$Parser$changeStyle(found))),
					elm$parser$Parser$Advanced$oneOf(
						_List_fromArray(
							[
								A2(
								elm$parser$Parser$Advanced$map,
								elm$core$Basics$always(mdgriffith$elm_markup$Mark$Internal$Description$Italic),
								elm$parser$Parser$Advanced$token(
									A2(
										elm$parser$Parser$Advanced$Token,
										'/',
										mdgriffith$elm_markup$Mark$Internal$Error$Expecting('/')))),
								A2(
								elm$parser$Parser$Advanced$map,
								elm$core$Basics$always(mdgriffith$elm_markup$Mark$Internal$Description$Strike),
								elm$parser$Parser$Advanced$token(
									A2(
										elm$parser$Parser$Advanced$Token,
										'~',
										mdgriffith$elm_markup$Mark$Internal$Error$Expecting('~')))),
								A2(
								elm$parser$Parser$Advanced$map,
								elm$core$Basics$always(mdgriffith$elm_markup$Mark$Internal$Description$Bold),
								elm$parser$Parser$Advanced$token(
									A2(
										elm$parser$Parser$Advanced$Token,
										'*',
										mdgriffith$elm_markup$Mark$Internal$Error$Expecting('*'))))
							]))),
					A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$keeper,
						A2(
							elm$parser$Parser$Advanced$keeper,
							elm$parser$Parser$Advanced$succeed(
								F3(
									function (start, _n0, end) {
										var maybeNewCursor = _n0.a;
										var newInlineBlock = _n0.b;
										var resetCursor = function (curs) {
											if (maybeNewCursor.$ === 'Nothing') {
												return curs;
											} else {
												var newCursor = maybeNewCursor.a.a;
												return A2(
													mdgriffith$elm_markup$Mark$Internal$Parser$resetTextWith,
													newCursor.current,
													A2(mdgriffith$elm_markup$Mark$Internal$Parser$resetBalancedReplacements, newCursor.balancedReplacements, curs));
											}
										};
										return elm$parser$Parser$Advanced$Loop(
											A2(
												mdgriffith$elm_markup$Mark$Internal$Parser$advanceTo,
												end,
												resetCursor(
													A2(
														mdgriffith$elm_markup$Mark$Internal$Parser$addToTextCursor,
														newInlineBlock(
															{end: end, start: start}),
														mdgriffith$elm_markup$Mark$Internal$Parser$commitText(found)))));
									})),
							mdgriffith$elm_markup$Mark$Internal$Parser$getPosition),
						A2(
							elm$parser$Parser$Advanced$andThen,
							function (_n2) {
								var maybeNewCursor = _n2.a;
								var selection = _n2.b;
								return A2(
									elm$parser$Parser$Advanced$map,
									function (attrResult) {
										return _Utils_Tuple2(
											maybeNewCursor,
											function (range) {
												if (attrResult.$ === 'Err') {
													if ((attrResult.a.b && (attrResult.a.a.$ === 'InlineStart')) && (!attrResult.a.b.b)) {
														var _n4 = attrResult.a;
														var _n5 = _n4.a;
														if (selection.$ === 'SelectString') {
															var str = selection.a;
															return A2(
																mdgriffith$elm_markup$Mark$Internal$Description$Styled,
																range,
																A2(
																	mdgriffith$elm_markup$Mark$Internal$Description$Text,
																	mdgriffith$elm_markup$Mark$Internal$Parser$getCurrentStyle(found),
																	str));
														} else {
															return mdgriffith$elm_markup$Mark$Internal$Description$InlineBlock(
																{
																	kind: selection,
																	range: range,
																	record: mdgriffith$elm_markup$Mark$Internal$Description$DescribeNothing(
																		mdgriffith$elm_markup$Mark$Internal$Id$step(mdgriffith$elm_markup$Mark$Internal$Id$initialSeed).a)
																});
														}
													} else {
														var errs = attrResult.a;
														return mdgriffith$elm_markup$Mark$Internal$Description$InlineBlock(
															{
																kind: selection,
																range: range,
																record: mdgriffith$elm_markup$Mark$Internal$Description$DescribeNothing(
																	mdgriffith$elm_markup$Mark$Internal$Id$step(mdgriffith$elm_markup$Mark$Internal$Id$initialSeed).a)
															});
													}
												} else {
													var foundFields = attrResult.a;
													return mdgriffith$elm_markup$Mark$Internal$Description$InlineBlock(
														{kind: selection, range: range, record: foundFields});
												}
											});
									},
									mdgriffith$elm_markup$Mark$Internal$Parser$attrContainer(
										function () {
											switch (selection.$) {
												case 'SelectString':
													return A2(elm$core$List$filterMap, mdgriffith$elm_markup$Mark$Internal$Parser$onlyVerbatim, options.inlines);
												case 'SelectText':
													return A2(elm$core$List$filterMap, mdgriffith$elm_markup$Mark$Internal$Parser$onlyAnnotation, options.inlines);
												default:
													return _List_Nil;
											}
										}()));
							},
							A2(mdgriffith$elm_markup$Mark$Internal$Parser$textSelection, options.replacements, found))),
					mdgriffith$elm_markup$Mark$Internal$Parser$getPosition),
					A2(
					elm$parser$Parser$Advanced$keeper,
					elm$parser$Parser$Advanced$succeed(
						function (_n8) {
							var _new = _n8.a;
							var _final = _n8.b;
							if ((_new === '') || _final) {
								var _n9 = mdgriffith$elm_markup$Mark$Internal$Parser$commitText(
									A2(
										mdgriffith$elm_markup$Mark$Internal$Parser$addText,
										elm$core$String$trimRight(_new),
										found));
								var txt = _n9.a;
								var styling = function () {
									var _n10 = txt.current;
									var s = _n10.a;
									return s;
								}();
								return elm$parser$Parser$Advanced$Done(
									elm$core$List$reverse(txt.found));
							} else {
								return elm$parser$Parser$Advanced$Loop(
									A2(mdgriffith$elm_markup$Mark$Internal$Parser$addText, _new, found));
							}
						}),
					A2(
						elm$parser$Parser$Advanced$andThen,
						function (str) {
							return elm$parser$Parser$Advanced$oneOf(
								_List_fromArray(
									[
										A2(
										elm$parser$Parser$Advanced$ignorer,
										elm$parser$Parser$Advanced$succeed(
											_Utils_Tuple2(str, true)),
										elm$parser$Parser$Advanced$token(
											A2(elm$parser$Parser$Advanced$Token, '\n\n', mdgriffith$elm_markup$Mark$Internal$Error$Newline))),
										mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
										function (indentation) {
											return A2(
												elm$parser$Parser$Advanced$keeper,
												A2(
													elm$parser$Parser$Advanced$ignorer,
													elm$parser$Parser$Advanced$succeed(
														function (finished) {
															if (finished.$ === 'StopWith') {
																var add = finished.a;
																return _Utils_Tuple2(
																	_Utils_ap(str, add),
																	true);
															} else {
																var add = finished.a;
																return _Utils_Tuple2(
																	_Utils_ap(str, add),
																	false);
															}
														}),
													elm$parser$Parser$Advanced$backtrackable(
														elm$parser$Parser$Advanced$token(
															A2(
																elm$parser$Parser$Advanced$Token,
																'\n' + A2(elm$core$String$repeat, indentation, ' '),
																mdgriffith$elm_markup$Mark$Internal$Error$Newline)))),
												elm$parser$Parser$Advanced$oneOf(
													_Utils_ap(
														_List_fromArray(
															[
																A2(
																elm$parser$Parser$Advanced$map,
																elm$core$Basics$always(
																	mdgriffith$elm_markup$Mark$Internal$Parser$StopWith('')),
																elm$parser$Parser$Advanced$end(mdgriffith$elm_markup$Mark$Internal$Error$End)),
																A2(
																elm$parser$Parser$Advanced$map,
																elm$core$Basics$always(
																	mdgriffith$elm_markup$Mark$Internal$Parser$StopWith('')),
																mdgriffith$elm_markup$Mark$Internal$Parser$newline)
															]),
														function () {
															if (context.$ === 'ParseInTree') {
																return _List_fromArray(
																	[
																		A2(
																		elm$parser$Parser$Advanced$andThen,
																		elm$core$Basics$always(
																			elm$parser$Parser$Advanced$problem(
																				mdgriffith$elm_markup$Mark$Internal$Error$Expecting('---'))),
																		elm$parser$Parser$Advanced$backtrackable(
																			elm$parser$Parser$Advanced$token(
																				A2(elm$parser$Parser$Advanced$Token, '-', mdgriffith$elm_markup$Mark$Internal$Error$Newline)))),
																		A2(
																		elm$parser$Parser$Advanced$andThen,
																		elm$core$Basics$always(
																			elm$parser$Parser$Advanced$problem(
																				mdgriffith$elm_markup$Mark$Internal$Error$Expecting('1.'))),
																		elm$parser$Parser$Advanced$backtrackable(
																			elm$parser$Parser$Advanced$token(
																				A2(elm$parser$Parser$Advanced$Token, '1.', mdgriffith$elm_markup$Mark$Internal$Error$Newline)))),
																		A2(
																		elm$parser$Parser$Advanced$map,
																		function (c) {
																			return mdgriffith$elm_markup$Mark$Internal$Parser$ContinueWith('\n' + c);
																		},
																		elm$parser$Parser$Advanced$getChompedString(
																			A2(
																				elm$parser$Parser$Advanced$chompIf,
																				function (c) {
																					return (!_Utils_eq(
																						c,
																						_Utils_chr('-'))) && ((!_Utils_eq(
																						c,
																						_Utils_chr('1'))) && (!_Utils_eq(
																						c,
																						_Utils_chr(' '))));
																				},
																				mdgriffith$elm_markup$Mark$Internal$Error$Expecting('char'))))
																	]);
															} else {
																return _List_fromArray(
																	[
																		elm$parser$Parser$Advanced$succeed(
																		mdgriffith$elm_markup$Mark$Internal$Parser$ContinueWith('\n'))
																	]);
															}
														}())));
										}),
										A2(
										elm$parser$Parser$Advanced$ignorer,
										elm$parser$Parser$Advanced$succeed(
											_Utils_Tuple2(str, true)),
										elm$parser$Parser$Advanced$token(
											A2(elm$parser$Parser$Advanced$Token, '\n', mdgriffith$elm_markup$Mark$Internal$Error$Newline))),
										A2(
										elm$parser$Parser$Advanced$ignorer,
										elm$parser$Parser$Advanced$succeed(
											_Utils_Tuple2(str, true)),
										elm$parser$Parser$Advanced$end(mdgriffith$elm_markup$Mark$Internal$Error$End)),
										elm$parser$Parser$Advanced$succeed(
										_Utils_Tuple2(str, false))
									]));
						},
						elm$parser$Parser$Advanced$getChompedString(
							elm$parser$Parser$Advanced$chompWhile(
								function (c) {
									return !A2(elm$core$List$member, c, meaningful);
								}))))
				]));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$styledText = F6(
	function (options, context, seed, startingPos, inheritedStyles, until) {
		var vacantText = A2(mdgriffith$elm_markup$Mark$Internal$Parser$textCursor, inheritedStyles, startingPos);
		var untilStrings = A2(elm$core$List$map, elm$core$String$fromChar, until);
		var meaningful = A2(
			elm$core$List$cons,
			_Utils_chr('1'),
			A2(
				elm$core$List$cons,
				_Utils_chr('\\'),
				A2(
					elm$core$List$cons,
					_Utils_chr('\n'),
					_Utils_ap(
						until,
						_Utils_ap(
							mdgriffith$elm_markup$Mark$Internal$Parser$stylingChars,
							mdgriffith$elm_markup$Mark$Internal$Parser$replacementStartingChars(options.replacements))))));
		var _n0 = mdgriffith$elm_markup$Mark$Internal$Id$step(seed);
		var newId = _n0.a;
		var newSeed = _n0.b;
		return elm$parser$Parser$Advanced$oneOf(
			_List_fromArray(
				[
					A2(
					elm$parser$Parser$Advanced$map,
					function (_n1) {
						var pos = _n1.a;
						var textNodes = _n1.b;
						return mdgriffith$elm_markup$Mark$Internal$Description$DescribeText(
							{id: newId, range: pos, text: textNodes});
					},
					mdgriffith$elm_markup$Mark$Internal$Parser$withRange(
						A2(
							elm$parser$Parser$Advanced$loop,
							vacantText,
							A4(mdgriffith$elm_markup$Mark$Internal$Parser$styledTextLoop, options, context, meaningful, untilStrings))))
				]));
	});
var mdgriffith$elm_markup$Mark$textWith = function (options) {
	var inlineRecords = A2(elm$core$List$map, mdgriffith$elm_markup$Mark$recordToInlineBlock, options.inlines);
	var inlineExpectations = A2(
		elm$core$List$map,
		function (_n2) {
			var rec = _n2.a;
			return mdgriffith$elm_markup$Mark$Internal$Description$ExpectInlineBlock(
				{
					fields: rec.expectations,
					kind: mdgriffith$elm_markup$Mark$Internal$Description$blockKindToSelection(rec.blockKind),
					name: rec.name
				});
		},
		options.inlines);
	return mdgriffith$elm_markup$Mark$Internal$Description$Block(
		{
			converter: mdgriffith$elm_markup$Mark$renderText(
				{
					inlines: inlineRecords,
					view: elm$core$Basics$always(options.view)
				}),
			expect: mdgriffith$elm_markup$Mark$Internal$Description$ExpectTextBlock(inlineExpectations),
			kind: mdgriffith$elm_markup$Mark$Internal$Description$Value,
			parser: F2(
				function (context, seed) {
					var _n0 = mdgriffith$elm_markup$Mark$Internal$Id$step(seed);
					var newSeed = _n0.b;
					var _n1 = mdgriffith$elm_markup$Mark$Internal$Id$step(newSeed);
					var returnSeed = _n1.b;
					return _Utils_Tuple2(
						returnSeed,
						A2(
							elm$parser$Parser$Advanced$andThen,
							function (pos) {
								return A6(
									mdgriffith$elm_markup$Mark$Internal$Parser$styledText,
									{
										inlines: A2(
											elm$core$List$map,
											function (x) {
												return x(mdgriffith$elm_markup$Mark$Internal$Description$EmptyAnnotation);
											},
											inlineRecords),
										replacements: options.replacements
									},
									context,
									newSeed,
									pos,
									mdgriffith$elm_markup$Mark$Internal$Description$emptyStyles,
									_List_Nil);
							},
							mdgriffith$elm_markup$Mark$Internal$Parser$getPosition));
				})
		});
};
var elm$html$Html$Attributes$href = function (url) {
	return A2(
		elm$html$Html$Attributes$stringProperty,
		'href',
		_VirtualDom_noJavaScriptUri(url));
};
var elm$html$Html$Attributes$rel = _VirtualDom_attribute('rel');
var mdgriffith$elm_ui$Element$link = F2(
	function (attrs, _n0) {
		var url = _n0.url;
		var label = _n0.label;
		return A4(
			mdgriffith$elm_ui$Internal$Model$element,
			mdgriffith$elm_ui$Internal$Model$asEl,
			mdgriffith$elm_ui$Internal$Model$NodeName('a'),
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Internal$Model$Attr(
					elm$html$Html$Attributes$href(url)),
				A2(
					elm$core$List$cons,
					mdgriffith$elm_ui$Internal$Model$Attr(
						elm$html$Html$Attributes$rel('noopener noreferrer')),
					A2(
						elm$core$List$cons,
						mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$shrink),
						A2(
							elm$core$List$cons,
							mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$shrink),
							A2(
								elm$core$List$cons,
								mdgriffith$elm_ui$Internal$Model$htmlClass(mdgriffith$elm_ui$Internal$Style$classes.contentCenterX + (' ' + mdgriffith$elm_ui$Internal$Style$classes.contentCenterY)),
								attrs))))),
			mdgriffith$elm_ui$Internal$Model$Unkeyed(
				_List_fromArray(
					[label])));
	});
var author$project$View$BlogPost$text = mdgriffith$elm_markup$Mark$textWith(
	{
		inlines: _List_fromArray(
			[
				A3(
				mdgriffith$elm_markup$Mark$field,
				'url',
				mdgriffith$elm_markup$Mark$string,
				A2(
					mdgriffith$elm_markup$Mark$annotation,
					'link',
					F2(
						function (texts, url) {
							return A2(
								mdgriffith$elm_ui$Element$link,
								_List_Nil,
								{
									label: A2(
										mdgriffith$elm_ui$Element$paragraph,
										_List_Nil,
										A2(
											elm$core$List$map,
											author$project$View$BlogPost$applyTuple(author$project$View$BlogPost$viewText),
											texts)),
									url: url
								});
						})))
			]),
		replacements: mdgriffith$elm_markup$Mark$commonReplacements,
		view: F2(
			function (styles, string) {
				return A2(author$project$View$BlogPost$viewText, styles, string);
			})
	});
var mdgriffith$elm_markup$Mark$Internal$Description$Named = function (a) {
	return {$: 'Named', a: a};
};
var mdgriffith$elm_markup$Mark$record = F2(
	function (name, view) {
		return mdgriffith$elm_markup$Mark$Internal$Description$ProtoRecord(
			{
				blockKind: mdgriffith$elm_markup$Mark$Internal$Description$Named(name),
				expectations: _List_Nil,
				fieldConverter: F2(
					function (desc, ann) {
						if (desc.$ === 'Record') {
							var details = desc.a;
							if (_Utils_eq(details.name, name) && _Utils_eq(ann, mdgriffith$elm_markup$Mark$Internal$Description$EmptyAnnotation)) {
								var _n1 = details.found;
								if (_n1.$ === 'Found') {
									var pos = _n1.a;
									var fieldDescriptions = _n1.b;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Success(
										_Utils_Tuple3(pos, fieldDescriptions, view));
								} else {
									var unexpected = _n1.a;
									return mdgriffith$elm_markup$Mark$Internal$Description$uncertain(unexpected);
								}
							} else {
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
							}
						} else {
							return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
						}
					}),
				fields: _List_Nil,
				name: name
			});
	});
var mdgriffith$elm_markup$Mark$Internal$Description$ParseBlock = {$: 'ParseBlock'};
var mdgriffith$elm_markup$Mark$Internal$Parser$BlockRecord = {$: 'BlockRecord'};
var mdgriffith$elm_markup$Mark$toBlock = function (_n0) {
	var details = _n0.a;
	var expectations = A2(mdgriffith$elm_markup$Mark$Internal$Description$ExpectRecord, details.name, details.expectations);
	return mdgriffith$elm_markup$Mark$Internal$Description$Block(
		{
			converter: function (desc) {
				var _n1 = A2(details.fieldConverter, desc, mdgriffith$elm_markup$Mark$Internal$Description$EmptyAnnotation);
				switch (_n1.$) {
					case 'Success':
						var _n2 = _n1.a;
						var pos = _n2.a;
						var fieldDescriptions = _n2.b;
						var rendered = _n2.c;
						return mdgriffith$elm_markup$Mark$Internal$Outcome$Success(rendered);
					case 'Failure':
						var fail = _n1.a;
						return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(fail);
					default:
						if (_n1.a.$ === 'Uncertain') {
							var e = _n1.a.a;
							return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
								mdgriffith$elm_markup$Mark$Internal$Description$Uncertain(e));
						} else {
							var _n3 = _n1.a;
							var e = _n3.a;
							var _n4 = _n3.b;
							var pos = _n4.a;
							var fieldDescriptions = _n4.b;
							var rendered = _n4.c;
							return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
								A2(mdgriffith$elm_markup$Mark$Internal$Description$Recovered, e, rendered));
						}
				}
			},
			expect: expectations,
			kind: details.blockKind,
			parser: F2(
				function (context, seed) {
					var _n5 = mdgriffith$elm_markup$Mark$Internal$Id$step(seed);
					var parentId = _n5.a;
					var parentSeed = _n5.b;
					var _n6 = A2(
						mdgriffith$elm_markup$Mark$Internal$Id$thread,
						parentSeed,
						A3(
							elm$core$List$foldl,
							F2(
								function (f, ls) {
									return A2(
										elm$core$List$cons,
										f(mdgriffith$elm_markup$Mark$Internal$Description$ParseBlock),
										ls);
								}),
							_List_Nil,
							details.fields));
					var newSeed = _n6.a;
					var fields = _n6.b;
					return _Utils_Tuple2(
						newSeed,
						A5(mdgriffith$elm_markup$Mark$Internal$Parser$record, mdgriffith$elm_markup$Mark$Internal$Parser$BlockRecord, parentId, details.name, expectations, fields));
				})
		});
};
var author$project$View$BlogPost$header = mdgriffith$elm_markup$Mark$toBlock(
	A3(
		mdgriffith$elm_markup$Mark$field,
		'date',
		author$project$View$BlogPost$text,
		A3(
			mdgriffith$elm_markup$Mark$field,
			'subtitle',
			author$project$View$BlogPost$text,
			A3(
				mdgriffith$elm_markup$Mark$field,
				'title',
				mdgriffith$elm_markup$Mark$string,
				A2(
					mdgriffith$elm_markup$Mark$record,
					'Header',
					F3(
						function (title, subtitle, date) {
							return A2(
								mdgriffith$elm_ui$Element$column,
								_List_fromArray(
									[
										mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill),
										mdgriffith$elm_ui$Element$spacing(20)
									]),
								_List_fromArray(
									[
										author$project$View$BlogPost$blogTitle(title),
										author$project$View$BlogPost$blogSubtitle(subtitle),
										author$project$View$BlogPost$blogDate(date)
									]));
						}))))));
var elm$html$Html$pre = _VirtualDom_node('pre');
var elm$virtual_dom$VirtualDom$style = _VirtualDom_style;
var elm$html$Html$Attributes$style = elm$virtual_dom$VirtualDom$style;
var mdgriffith$elm_ui$Internal$Model$unstyled = A2(elm$core$Basics$composeL, mdgriffith$elm_ui$Internal$Model$Unstyled, elm$core$Basics$always);
var mdgriffith$elm_ui$Element$html = mdgriffith$elm_ui$Internal$Model$unstyled;
var author$project$View$BlogPost$codeText = function (str) {
	return mdgriffith$elm_ui$Element$html(
		A2(
			elm$html$Html$pre,
			_List_fromArray(
				[
					A2(elm$html$Html$Attributes$style, 'padding', '12px'),
					A2(elm$html$Html$Attributes$style, 'background-color', '#eee')
				]),
			_List_fromArray(
				[
					elm$html$Html$text(str)
				])));
};
var author$project$View$BlogPost$readmeTitle = mdgriffith$elm_ui$Element$text('Readme.md');
var mdgriffith$elm_markup$Mark$Internal$Description$DescribeBlock = function (a) {
	return {$: 'DescribeBlock', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$ExpectBlock = F2(
	function (a, b) {
		return {$: 'ExpectBlock', a: a, b: b};
	});
var mdgriffith$elm_markup$Mark$Internal$Error$InBlock = function (a) {
	return {$: 'InBlock', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$skipBlankLineWith = function (x) {
	return A2(
		elm$parser$Parser$Advanced$ignorer,
		A2(
			elm$parser$Parser$Advanced$ignorer,
			elm$parser$Parser$Advanced$succeed(x),
			elm$parser$Parser$Advanced$token(
				A2(elm$parser$Parser$Advanced$Token, '\n', mdgriffith$elm_markup$Mark$Internal$Error$Newline))),
		elm$parser$Parser$Advanced$oneOf(
			_List_fromArray(
				[
					A2(
					elm$parser$Parser$Advanced$ignorer,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(_Utils_Tuple0),
						elm$parser$Parser$Advanced$backtrackable(
							elm$parser$Parser$Advanced$chompWhile(
								function (c) {
									return _Utils_eq(
										c,
										_Utils_chr(' '));
								}))),
					elm$parser$Parser$Advanced$backtrackable(
						elm$parser$Parser$Advanced$token(
							A2(elm$parser$Parser$Advanced$Token, '\n', mdgriffith$elm_markup$Mark$Internal$Error$Newline)))),
					elm$parser$Parser$Advanced$succeed(_Utils_Tuple0)
				])));
};
var mdgriffith$elm_markup$Mark$block = F3(
	function (name, view, child) {
		return mdgriffith$elm_markup$Mark$Internal$Description$Block(
			{
				converter: function (desc) {
					if (desc.$ === 'DescribeBlock') {
						var details = desc.a;
						if (_Utils_eq(details.name, name)) {
							var _n1 = details.found;
							if (_n1.$ === 'Found') {
								var range = _n1.a;
								var found = _n1.b;
								return A2(
									mdgriffith$elm_markup$Mark$Internal$Description$mapSuccessAndRecovered,
									view,
									A2(mdgriffith$elm_markup$Mark$Internal$Description$renderBlock, child, found));
							} else {
								var unexpected = _n1.a;
								return mdgriffith$elm_markup$Mark$Internal$Description$uncertain(unexpected);
							}
						} else {
							return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
						}
					} else {
						return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
					}
				},
				expect: A2(
					mdgriffith$elm_markup$Mark$Internal$Description$ExpectBlock,
					name,
					mdgriffith$elm_markup$Mark$Internal$Description$getBlockExpectation(child)),
				kind: mdgriffith$elm_markup$Mark$Internal$Description$Named(name),
				parser: F2(
					function (context, seed) {
						var _n2 = A3(mdgriffith$elm_markup$Mark$Internal$Description$getParser, context, seed, child);
						var newSeed = _n2.a;
						var childParser = _n2.b;
						var _n3 = mdgriffith$elm_markup$Mark$Internal$Id$step(newSeed);
						var parentId = _n3.a;
						var finalSeed = _n3.b;
						return _Utils_Tuple2(
							finalSeed,
							A2(
								elm$parser$Parser$Advanced$map,
								function (result) {
									if (result.$ === 'Ok') {
										var details = result.a;
										return mdgriffith$elm_markup$Mark$Internal$Description$DescribeBlock(
											{
												expected: A2(
													mdgriffith$elm_markup$Mark$Internal$Description$ExpectBlock,
													name,
													mdgriffith$elm_markup$Mark$Internal$Description$getBlockExpectation(child)),
												found: A2(mdgriffith$elm_markup$Mark$Internal$Description$Found, details.range, details.value),
												id: parentId,
												name: name
											});
									} else {
										var details = result.a;
										return mdgriffith$elm_markup$Mark$Internal$Description$DescribeBlock(
											{
												expected: A2(
													mdgriffith$elm_markup$Mark$Internal$Description$ExpectBlock,
													name,
													mdgriffith$elm_markup$Mark$Internal$Description$getBlockExpectation(child)),
												found: mdgriffith$elm_markup$Mark$Internal$Description$Unexpected(
													{problem: details.error, range: details.range}),
												id: parentId,
												name: name
											});
									}
								},
								mdgriffith$elm_markup$Mark$Internal$Parser$withRangeResult(
									mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
										function (indentation) {
											return A2(
												elm$parser$Parser$Advanced$keeper,
												A2(
													elm$parser$Parser$Advanced$ignorer,
													A2(
														elm$parser$Parser$Advanced$ignorer,
														A2(
															elm$parser$Parser$Advanced$ignorer,
															elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
															elm$parser$Parser$Advanced$keyword(
																A2(
																	elm$parser$Parser$Advanced$Token,
																	name,
																	mdgriffith$elm_markup$Mark$Internal$Error$ExpectingBlockName(name)))),
														elm$parser$Parser$Advanced$chompWhile(
															function (c) {
																return _Utils_eq(
																	c,
																	_Utils_chr(' '));
															})),
													mdgriffith$elm_markup$Mark$Internal$Parser$skipBlankLineWith(_Utils_Tuple0)),
												elm$parser$Parser$Advanced$oneOf(
													_List_fromArray(
														[
															A2(
															elm$parser$Parser$Advanced$andThen,
															function (start) {
																return elm$parser$Parser$Advanced$oneOf(
																	_List_fromArray(
																		[
																			A2(
																			elm$parser$Parser$Advanced$keeper,
																			A2(
																				elm$parser$Parser$Advanced$ignorer,
																				A2(
																					elm$parser$Parser$Advanced$ignorer,
																					elm$parser$Parser$Advanced$succeed(
																						function (end) {
																							return elm$core$Result$Err(
																								mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndent(indentation + 4));
																						}),
																					A2(
																						elm$parser$Parser$Advanced$chompIf,
																						function (c) {
																							return _Utils_eq(
																								c,
																								_Utils_chr(' '));
																						},
																						mdgriffith$elm_markup$Mark$Internal$Error$Space)),
																				elm$parser$Parser$Advanced$chompWhile(
																					function (c) {
																						return _Utils_eq(
																							c,
																							_Utils_chr(' '));
																					})),
																			A2(
																				elm$parser$Parser$Advanced$ignorer,
																				mdgriffith$elm_markup$Mark$Internal$Parser$getPosition,
																				A2(
																					elm$parser$Parser$Advanced$loop,
																					'',
																					mdgriffith$elm_markup$Mark$Internal$Parser$raggedIndentedStringAbove(indentation)))),
																			A2(
																			elm$parser$Parser$Advanced$map,
																			elm$core$Result$Ok,
																			A2(
																				elm$parser$Parser$Advanced$withIndent,
																				indentation + 4,
																				A2(
																					elm$parser$Parser$Advanced$inContext,
																					mdgriffith$elm_markup$Mark$Internal$Error$InBlock(name),
																					childParser)))
																		]));
															},
															A2(
																elm$parser$Parser$Advanced$keeper,
																elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
																A2(
																	elm$parser$Parser$Advanced$ignorer,
																	mdgriffith$elm_markup$Mark$Internal$Parser$getPosition,
																	elm$parser$Parser$Advanced$token(
																		A2(
																			elm$parser$Parser$Advanced$Token,
																			A2(elm$core$String$repeat, indentation + 4, ' '),
																			mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndentation(indentation + 4)))))),
															A2(
															elm$parser$Parser$Advanced$ignorer,
															elm$parser$Parser$Advanced$succeed(
																elm$core$Result$Err(
																	mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndent(indentation + 4))),
															A2(
																elm$parser$Parser$Advanced$loop,
																'',
																mdgriffith$elm_markup$Mark$Internal$Parser$raggedIndentedStringAbove(indentation)))
														])));
										}))));
					})
			});
	});
var author$project$View$BlogPost$readmeBlock = A3(
	mdgriffith$elm_markup$Mark$block,
	'ReadmeTitle',
	function (str) {
		return A2(
			mdgriffith$elm_ui$Element$column,
			_List_Nil,
			_List_fromArray(
				[
					author$project$View$BlogPost$readmeTitle,
					author$project$View$BlogPost$codeText(str)
				]));
	},
	mdgriffith$elm_markup$Mark$string);
var mdgriffith$elm_markup$Mark$unexpectedFromFound = function (found) {
	if (found.$ === 'Found') {
		return _List_Nil;
	} else {
		var unexpected = found.a;
		return _List_fromArray(
			[unexpected]);
	}
};
var mdgriffith$elm_markup$Mark$getUnexpecteds = function (description) {
	switch (description.$) {
		case 'DescribeBlock':
			var details = description.a;
			return mdgriffith$elm_markup$Mark$spelunkUnexpectedsFromFound(details.found);
		case 'Record':
			var details = description.a;
			var _n2 = details.found;
			if (_n2.$ === 'Found') {
				var fields = _n2.b;
				return A2(
					elm$core$List$concatMap,
					A2(elm$core$Basics$composeR, elm$core$Tuple$second, mdgriffith$elm_markup$Mark$spelunkUnexpectedsFromFound),
					fields);
			} else {
				var unexpected = _n2.a;
				return _List_fromArray(
					[unexpected]);
			}
		case 'OneOf':
			var one = description.a;
			return mdgriffith$elm_markup$Mark$spelunkUnexpectedsFromFound(one.child);
		case 'ManyOf':
			var many = description.a;
			return A2(elm$core$List$concatMap, mdgriffith$elm_markup$Mark$spelunkUnexpectedsFromFound, many.children);
		case 'StartsWith':
			var details = description.a;
			return _Utils_ap(
				mdgriffith$elm_markup$Mark$getUnexpecteds(details.first.found),
				mdgriffith$elm_markup$Mark$getUnexpecteds(details.second.found));
		case 'DescribeTree':
			var details = description.a;
			return _List_Nil;
		case 'DescribeBoolean':
			var details = description.a;
			return mdgriffith$elm_markup$Mark$unexpectedFromFound(details.found);
		case 'DescribeInteger':
			var details = description.a;
			return mdgriffith$elm_markup$Mark$unexpectedFromFound(details.found);
		case 'DescribeFloat':
			var details = description.a;
			return mdgriffith$elm_markup$Mark$unexpectedFromFound(details.found);
		case 'DescribeText':
			var details = description.a;
			return _List_Nil;
		case 'DescribeString':
			var rng = description.a;
			var str = description.c;
			return _List_Nil;
		default:
			return _List_Nil;
	}
};
var mdgriffith$elm_markup$Mark$spelunkUnexpectedsFromFound = function (found) {
	if (found.$ === 'Found') {
		var desc = found.b;
		return mdgriffith$elm_markup$Mark$getUnexpecteds(desc);
	} else {
		var unexpected = found.a;
		return _List_fromArray(
			[unexpected]);
	}
};
var mdgriffith$elm_markup$Mark$Internal$Description$Document = function (a) {
	return {$: 'Document', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$Parsed = function (a) {
	return {$: 'Parsed', a: a};
};
var elm$core$List$sortBy = _List_sortBy;
var elm$core$String$toUpper = _String_toUpper;
var mdgriffith$elm_markup$Mark$Internal$Error$Rendered = function (a) {
	return {$: 'Rendered', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Error$addIndent = F2(
	function (x, str) {
		return _Utils_ap(
			A2(elm$core$String$repeat, x, ' '),
			str);
	});
var mdgriffith$elm_markup$Mark$Internal$Error$CompilerError = {$: 'CompilerError'};
var mdgriffith$elm_markup$Mark$Internal$Error$Global = function (a) {
	return {$: 'Global', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Format$text = function (str) {
	return {bold: false, color: elm$core$Maybe$Nothing, text: str, underline: false};
};
var mdgriffith$elm_markup$Mark$Internal$Format$yellow = function (txt) {
	return _Utils_update(
		txt,
		{
			color: elm$core$Maybe$Just('yellow')
		});
};
var mdgriffith$elm_markup$Mark$Internal$Error$compilerError = mdgriffith$elm_markup$Mark$Internal$Error$Global(
	{
		message: _List_fromArray(
			[
				mdgriffith$elm_markup$Mark$Internal$Format$text('Oh boy, this looks like a  '),
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('compiler error')),
				mdgriffith$elm_markup$Mark$Internal$Format$text('\n\n'),
				mdgriffith$elm_markup$Mark$Internal$Format$text('If you have time, could you file an '),
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('issue')),
				mdgriffith$elm_markup$Mark$Internal$Format$text(' on the elm-markup respository(https://github.com/mdgriffith/elm-markup) describing how you got here?')
			]),
		problem: mdgriffith$elm_markup$Mark$Internal$Error$CompilerError,
		title: 'COMPILER ERROR'
	});
var mdgriffith$elm_markup$Mark$Internal$Error$DocumentMismatch = {$: 'DocumentMismatch'};
var mdgriffith$elm_markup$Mark$Internal$Error$documentMismatch = mdgriffith$elm_markup$Mark$Internal$Error$Global(
	{
		message: _List_fromArray(
			[
				mdgriffith$elm_markup$Mark$Internal$Format$text('Your '),
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('document')),
				mdgriffith$elm_markup$Mark$Internal$Format$text(' and your '),
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('Parsed')),
				mdgriffith$elm_markup$Mark$Internal$Format$text(' structure don\'t match for some reason.\n\n'),
				mdgriffith$elm_markup$Mark$Internal$Format$text('This usually occurs because you\'ve stored the '),
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('Parsed')),
				mdgriffith$elm_markup$Mark$Internal$Format$text(' data somewhere and then made a breaking change to your document.')
			]),
		problem: mdgriffith$elm_markup$Mark$Internal$Error$DocumentMismatch,
		title: 'DOCUMENT MISMATCH'
	});
var mdgriffith$elm_markup$Mark$Internal$Format$red = function (txt) {
	return _Utils_update(
		txt,
		{
			color: elm$core$Maybe$Just('red')
		});
};
var mdgriffith$elm_markup$Mark$Internal$Error$highlightLine = function (_n0) {
	var index = _n0.a;
	var line = _n0.b;
	return _List_fromArray(
		[
			mdgriffith$elm_markup$Mark$Internal$Format$text(
			elm$core$String$fromInt(index)),
			mdgriffith$elm_markup$Mark$Internal$Format$red(
			mdgriffith$elm_markup$Mark$Internal$Format$text('>')),
			mdgriffith$elm_markup$Mark$Internal$Format$text(line + '\n')
		]);
};
var mdgriffith$elm_markup$Mark$Internal$Error$highlight = F2(
	function (range, source) {
		if (_Utils_eq(range.start.line, range.end.line)) {
			var lineStart = range.start.offset - (range.start.column - 1);
			var line = A2(
				elm$core$Maybe$withDefault,
				'',
				elm$core$List$head(
					elm$core$String$lines(
						A3(elm$core$String$slice, lineStart, range.end.offset + 20, source))));
			var lineNumber = _Utils_ap(
				elm$core$String$fromInt(range.start.line),
				A2(elm$core$String$startsWith, '|', line) ? '' : '|');
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text(lineNumber + (line + '\n')),
					mdgriffith$elm_markup$Mark$Internal$Format$red(
					mdgriffith$elm_markup$Mark$Internal$Format$text(
						A2(
							elm$core$String$repeat,
							(range.start.column - 1) + elm$core$String$length(lineNumber),
							' ') + (A2(elm$core$String$repeat, range.end.column - range.start.column, '^') + '\n')))
				]);
		} else {
			var snippet = A3(elm$core$String$slice, range.start.offset, range.end.offset, source);
			var indented = A3(elm$core$String$slice, (range.start.offset + 1) - range.start.column, range.start.offset, source);
			var lines = A2(
				elm$core$List$indexedMap,
				F2(
					function (i, str) {
						return _Utils_Tuple2((i + range.start.line) - 1, str);
					}),
				elm$core$String$lines(
					_Utils_ap(indented, snippet)));
			return A2(elm$core$List$concatMap, mdgriffith$elm_markup$Mark$Internal$Error$highlightLine, lines);
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Format$underline = function (txt) {
	return _Utils_update(
		txt,
		{underline: true});
};
var mdgriffith$elm_markup$Mark$Internal$Error$hint = function (str) {
	return _List_fromArray(
		[
			mdgriffith$elm_markup$Mark$Internal$Format$underline(
			mdgriffith$elm_markup$Mark$Internal$Format$text('Hint')),
			mdgriffith$elm_markup$Mark$Internal$Format$text(': ' + str)
		]);
};
var mdgriffith$elm_markup$Mark$Internal$Error$DocumentDoesntAllow = F2(
	function (a, b) {
		return {$: 'DocumentDoesntAllow', a: a, b: b};
	});
var mdgriffith$elm_markup$Mark$Internal$Error$EditingError = function (a) {
	return {$: 'EditingError', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Error$indent = mdgriffith$elm_markup$Mark$Internal$Format$text(
	A2(elm$core$String$repeat, 4, ' '));
var mdgriffith$elm_markup$Mark$Internal$Error$documentDoesntAllow = F2(
	function (_new, expectations) {
		return mdgriffith$elm_markup$Mark$Internal$Error$Global(
			{
				message: _Utils_ap(
					_List_fromArray(
						[
							mdgriffith$elm_markup$Mark$Internal$Format$text('You tried to insert a\n\n'),
							mdgriffith$elm_markup$Mark$Internal$Error$indent,
							mdgriffith$elm_markup$Mark$Internal$Format$yellow(
							mdgriffith$elm_markup$Mark$Internal$Format$text(_new)),
							mdgriffith$elm_markup$Mark$Internal$Format$text('\n\n'),
							mdgriffith$elm_markup$Mark$Internal$Format$text('but the block at the provided '),
							mdgriffith$elm_markup$Mark$Internal$Format$yellow(
							mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.Edit.Id')),
							mdgriffith$elm_markup$Mark$Internal$Format$text(' is expecting\n\n')
						]),
					A2(
						elm$core$List$concatMap,
						function (exp) {
							return _List_fromArray(
								[
									mdgriffith$elm_markup$Mark$Internal$Error$indent,
									mdgriffith$elm_markup$Mark$Internal$Format$yellow(
									mdgriffith$elm_markup$Mark$Internal$Format$text(exp)),
									mdgriffith$elm_markup$Mark$Internal$Format$text('\n')
								]);
						},
						expectations)),
				problem: mdgriffith$elm_markup$Mark$Internal$Error$EditingError(
					A2(mdgriffith$elm_markup$Mark$Internal$Error$DocumentDoesntAllow, _new, expectations)),
				title: 'DOCUMENT DOESN\'T ALLOW'
			});
	});
var mdgriffith$elm_markup$Mark$Internal$Error$IdNotFound = {$: 'IdNotFound'};
var mdgriffith$elm_markup$Mark$Internal$Error$idNotFound = mdgriffith$elm_markup$Mark$Internal$Error$Global(
	{
		message: _List_fromArray(
			[
				mdgriffith$elm_markup$Mark$Internal$Format$text('The '),
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.Edit.Id')),
				mdgriffith$elm_markup$Mark$Internal$Format$text(' that you provided doesn\'t match any blocks in the document.')
			]),
		problem: mdgriffith$elm_markup$Mark$Internal$Error$EditingError(mdgriffith$elm_markup$Mark$Internal$Error$IdNotFound),
		title: 'ID NOT FOUND'
	});
var mdgriffith$elm_markup$Mark$Internal$Error$InvalidInsert = {$: 'InvalidInsert'};
var mdgriffith$elm_markup$Mark$Internal$Error$invalidDelete = mdgriffith$elm_markup$Mark$Internal$Error$Global(
	{
		message: _List_fromArray(
			[
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.Edit.deleteAt')),
				mdgriffith$elm_markup$Mark$Internal$Format$text(' is only valid for elements within a '),
				mdgriffith$elm_markup$Mark$Internal$Error$indent,
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.manyOf'))
			]),
		problem: mdgriffith$elm_markup$Mark$Internal$Error$EditingError(mdgriffith$elm_markup$Mark$Internal$Error$InvalidInsert),
		title: 'INVALID DELETE'
	});
var mdgriffith$elm_markup$Mark$Internal$Error$invalidInsert = mdgriffith$elm_markup$Mark$Internal$Error$Global(
	{
		message: _List_fromArray(
			[
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.Edit.insertAt')),
				mdgriffith$elm_markup$Mark$Internal$Format$text(' is only valid for elements within a '),
				mdgriffith$elm_markup$Mark$Internal$Error$indent,
				mdgriffith$elm_markup$Mark$Internal$Format$yellow(
				mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.manyOf'))
			]),
		problem: mdgriffith$elm_markup$Mark$Internal$Error$EditingError(mdgriffith$elm_markup$Mark$Internal$Error$InvalidInsert),
		title: 'INVALID INSERT'
	});
var mdgriffith$elm_markup$Mark$Internal$Error$InvalidTextEdit = {$: 'InvalidTextEdit'};
var mdgriffith$elm_markup$Mark$Internal$Error$invalidTextEdit = mdgriffith$elm_markup$Mark$Internal$Error$Global(
	{
		message: _Utils_ap(
			_List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('Text edits such as\n\n'),
					mdgriffith$elm_markup$Mark$Internal$Error$indent,
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.Edit.insertText\n')),
					mdgriffith$elm_markup$Mark$Internal$Error$indent,
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.Edit.deleteText\n')),
					mdgriffith$elm_markup$Mark$Internal$Error$indent,
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.Edit.restyle\n')),
					mdgriffith$elm_markup$Mark$Internal$Error$indent,
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.Edit.addStyles\n')),
					mdgriffith$elm_markup$Mark$Internal$Error$indent,
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.Edit.removeStyles\n\n')),
					mdgriffith$elm_markup$Mark$Internal$Format$text('only work on '),
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.text')),
					mdgriffith$elm_markup$Mark$Internal$Format$text(' or '),
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('Mark.textWith')),
					mdgriffith$elm_markup$Mark$Internal$Format$text(' blocks.\n\n')
				]),
			mdgriffith$elm_markup$Mark$Internal$Error$hint('If you\'re trying to update a simple Mark.string, you probably want to use `Mark.Edit.replace` instead.')),
		problem: mdgriffith$elm_markup$Mark$Internal$Error$EditingError(mdgriffith$elm_markup$Mark$Internal$Error$InvalidTextEdit),
		title: 'INVALID TEXT EDIT'
	});
var mdgriffith$elm_markup$Mark$Internal$Error$renderEditError = function (editErr) {
	switch (editErr.$) {
		case 'IdNotFound':
			return mdgriffith$elm_markup$Mark$Internal$Error$idNotFound;
		case 'InvalidTextEdit':
			return mdgriffith$elm_markup$Mark$Internal$Error$invalidTextEdit;
		case 'InvalidInsert':
			return mdgriffith$elm_markup$Mark$Internal$Error$invalidInsert;
		case 'InvalidDelete':
			return mdgriffith$elm_markup$Mark$Internal$Error$invalidDelete;
		default:
			var _new = editErr.a;
			var exp = editErr.b;
			return A2(mdgriffith$elm_markup$Mark$Internal$Error$documentDoesntAllow, _new, exp);
	}
};
var mdgriffith$elm_markup$Mark$Internal$Error$ParsingIssue = function (a) {
	return {$: 'ParsingIssue', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Error$renderParsingProblem = function (prob) {
	switch (prob.$) {
		case 'ExpectingIndentation':
			var i = prob.a;
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text(
					'I was expecting an indent of ' + (elm$core$String$fromInt(i) + ' spaces'))
				]);
		case 'InlineStart':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('InlineStart')
				]);
		case 'InlineEnd':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting the end of an inline: '),
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('}'))
				]);
		case 'BlockStart':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting the start of a block: '),
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('|>'))
				]);
		case 'Expecting':
			var str = prob.a;
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting \"' + (str + '\"'))
				]);
		case 'ExpectingBlockName':
			var name = prob.a;
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting a block named '),
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text(name))
				]);
		case 'ExpectingInlineName':
			var name = prob.a;
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting an inline named '),
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text(name))
				]);
		case 'ExpectingFieldName':
			var name = prob.a;
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting a field named '),
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text(name))
				]);
		case 'Escape':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expectng a backslash')
				]);
		case 'EscapedChar':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting an escaped character')
				]);
		case 'Newline':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting a newline')
				]);
		case 'Space':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting a space')
				]);
		case 'End':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting the end of a document.')
				]);
		case 'Integer':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting an '),
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('Int'))
				]);
		case 'FloatingPoint':
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I was expecting a '),
					mdgriffith$elm_markup$Mark$Internal$Format$yellow(
					mdgriffith$elm_markup$Mark$Internal$Format$text('Float'))
				]);
		default:
			return _List_fromArray(
				[
					mdgriffith$elm_markup$Mark$Internal$Format$text('I ran into an invalid number.')
				]);
	}
};
var mdgriffith$elm_markup$Mark$Internal$Error$renderParserIssue = function (deadends) {
	return A2(
		elm$core$List$concatMap,
		function (dead) {
			return _Utils_ap(
				mdgriffith$elm_markup$Mark$Internal$Error$renderParsingProblem(dead.problem),
				_List_fromArray(
					[
						mdgriffith$elm_markup$Mark$Internal$Format$text('\n')
					]));
		},
		deadends);
};
var mdgriffith$elm_markup$Mark$Internal$Error$renderParsingErrors = F2(
	function (source, issues) {
		return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
			{
				message: elm$core$List$concat(
					_List_fromArray(
						[
							_List_fromArray(
							[
								mdgriffith$elm_markup$Mark$Internal$Format$text('\n')
							]),
							mdgriffith$elm_markup$Mark$Internal$Error$renderParserIssue(issues)
						])),
				problem: mdgriffith$elm_markup$Mark$Internal$Error$ParsingIssue(issues),
				region: function () {
					if (!issues.b) {
						return {
							end: {column: 0, line: 0, offset: 0},
							start: {column: 0, line: 0, offset: 0}
						};
					} else {
						var first = issues.a;
						return {
							end: {column: first.col, line: first.row, offset: 0},
							start: {column: first.col, line: first.row, offset: 0}
						};
					}
				}(),
				title: 'PARSING ISSUE'
			});
	});
var elm$core$Basics$abs = function (n) {
	return (n < 0) ? (-n) : n;
};
var elm$core$String$foldr = _String_foldr;
var elm$core$String$toList = function (string) {
	return A3(elm$core$String$foldr, elm$core$List$cons, _List_Nil, string);
};
var elm$core$Tuple$pair = F2(
	function (a, b) {
		return _Utils_Tuple2(a, b);
	});
var mdgriffith$elm_markup$Mark$Internal$Error$similarity = F2(
	function (source, target) {
		var lenSimilarity = 0 - A2(
			elm$core$Basics$min,
			2,
			elm$core$Basics$abs(
				elm$core$String$length(source) - elm$core$String$length(target)));
		var addCompared = F2(
			function (_n0, total) {
				var x = _n0.a;
				var y = _n0.b;
				return _Utils_eq(x, y) ? (total + 1) : total;
			});
		return lenSimilarity + A3(
			elm$core$List$foldl,
			addCompared,
			0,
			A3(
				elm$core$List$map2,
				elm$core$Tuple$pair,
				elm$core$String$toList(source),
				elm$core$String$toList(target)));
	});
var mdgriffith$elm_markup$Mark$Internal$Error$styleChars = function (styles) {
	var strike = styles.strike;
	var italic = styles.italic;
	var isBold = styles.bold;
	var _n0 = _Utils_Tuple3(italic, isBold, strike);
	if (_n0.a) {
		if (_n0.b) {
			if (!_n0.c) {
				return '/ and *';
			} else {
				return '/, *, and ~';
			}
		} else {
			if (_n0.c) {
				return '/ and ~';
			} else {
				return '/';
			}
		}
	} else {
		if (_n0.b) {
			if (_n0.c) {
				return '* and ~';
			} else {
				return '*';
			}
		} else {
			if (!_n0.c) {
				return 'Some formatting is';
			} else {
				return '~';
			}
		}
	}
};
var mdgriffith$elm_markup$Mark$Internal$Error$styleNames = function (styles) {
	var strike = styles.strike;
	var italic = styles.italic;
	var isBold = styles.bold;
	var _n0 = _Utils_Tuple3(italic, isBold, strike);
	if (_n0.a) {
		if (_n0.b) {
			if (!_n0.c) {
				return 'Italic and bold formatting are';
			} else {
				return 'Italic, strike, and bold formatting are';
			}
		} else {
			if (_n0.c) {
				return 'Italic and strike formatting are';
			} else {
				return 'Italic formatting is';
			}
		}
	} else {
		if (_n0.b) {
			if (_n0.c) {
				return 'Strike, and bold formatting are';
			} else {
				return 'Bold formatting is';
			}
		} else {
			if (!_n0.c) {
				return 'Some formatting is';
			} else {
				return 'Strike formatting is';
			}
		}
	}
};
var mdgriffith$elm_markup$Mark$Internal$Error$render = F2(
	function (source, current) {
		var _n0 = current.problem;
		switch (_n0.$) {
			case 'CompilerError':
				return mdgriffith$elm_markup$Mark$Internal$Error$compilerError;
			case 'DocumentMismatch':
				return mdgriffith$elm_markup$Mark$Internal$Error$documentMismatch;
			case 'EditingError':
				var editErr = _n0.a;
				return mdgriffith$elm_markup$Mark$Internal$Error$renderEditError(editErr);
			case 'ParsingIssue':
				var issues = _n0.a;
				return A2(mdgriffith$elm_markup$Mark$Internal$Error$renderParsingErrors, source, issues);
			case 'UnknownBlock':
				var expecting = _n0.a;
				var target = A3(elm$core$String$slice, current.range.start.offset, current.range.end.offset, source);
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: elm$core$List$concat(
							_List_fromArray(
								[
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('I don\'t recognize this block name.\n\n')
									]),
									A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source),
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('Do you mean one of these instead?\n\n'),
										mdgriffith$elm_markup$Mark$Internal$Format$yellow(
										mdgriffith$elm_markup$Mark$Internal$Format$text(
											A2(
												elm$core$String$join,
												'\n',
												A2(
													elm$core$List$map,
													mdgriffith$elm_markup$Mark$Internal$Error$addIndent(4),
													A2(
														elm$core$List$sortBy,
														function (exp) {
															return 0 - A2(mdgriffith$elm_markup$Mark$Internal$Error$similarity, target, exp);
														},
														expecting)))))
									])
								])),
						problem: current.problem,
						region: current.range,
						title: 'UNKNOWN BLOCK'
					});
			case 'UnknownInline':
				var expecting = _n0.a;
				var target = A3(elm$core$String$slice, current.range.start.offset, current.range.end.offset, source);
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: elm$core$List$concat(
							_List_fromArray(
								[
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('I ran into an unexpected inline name.\n\n')
									]),
									A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source),
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('But I was expecting one of these instead:\n\n'),
										mdgriffith$elm_markup$Mark$Internal$Format$yellow(
										mdgriffith$elm_markup$Mark$Internal$Format$text(
											A2(
												elm$core$String$join,
												'\n',
												A2(
													elm$core$List$map,
													mdgriffith$elm_markup$Mark$Internal$Error$addIndent(4),
													A2(
														elm$core$List$sortBy,
														function (exp) {
															return 0 - A2(mdgriffith$elm_markup$Mark$Internal$Error$similarity, target, exp);
														},
														expecting)))))
									])
								])),
						problem: current.problem,
						region: current.range,
						title: 'UNKNOWN INLINE'
					});
			case 'FailMatchOneOf':
				var expecting = _n0.a;
				var target = A3(elm$core$String$slice, current.range.start.offset, current.range.end.offset, source);
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: elm$core$List$concat(
							_List_fromArray(
								[
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('I wasn\'t able to match this.\n\n')
									]),
									A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source),
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('to one of the following:\n\n'),
										mdgriffith$elm_markup$Mark$Internal$Format$yellow(
										mdgriffith$elm_markup$Mark$Internal$Format$text(
											A2(
												elm$core$String$join,
												'\n',
												A2(
													elm$core$List$map,
													mdgriffith$elm_markup$Mark$Internal$Error$addIndent(4),
													expecting))))
									])
								])),
						problem: current.problem,
						region: current.range,
						title: 'NO MATCH'
					});
			case 'ExpectingIndent':
				var indentation = _n0.a;
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: _Utils_ap(
							_List_fromArray(
								[
									mdgriffith$elm_markup$Mark$Internal$Format$text(
									'I was expecting ' + (elm$core$String$fromInt(indentation) + ' spaces of indentation.\n\n'))
								]),
							_Utils_ap(
								A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source),
								mdgriffith$elm_markup$Mark$Internal$Error$hint('All indentation in `elm-markup` is a multiple of 4.'))),
						problem: current.problem,
						region: current.range,
						title: 'MISMATCHED INDENTATION'
					});
			case 'CantStartTextWithSpace':
				var line = A3(elm$core$String$slice, current.range.start.offset, current.range.end.offset, source);
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: elm$core$List$concat(
							_List_fromArray(
								[
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('This line of text starts with extra space.\n\n')
									]),
									A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source),
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('Beyond the required indentation, text should start with non-whitespace characters.')
									])
								])),
						problem: current.problem,
						region: current.range,
						title: 'TOO MUCH SPACE'
					});
			case 'UnclosedStyle':
				var styles = _n0.a;
				var line = A3(elm$core$String$slice, current.range.start.offset, current.range.end.offset, source);
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: _Utils_ap(
							elm$core$List$concat(
								_List_fromArray(
									[
										_List_fromArray(
										[
											mdgriffith$elm_markup$Mark$Internal$Format$text(
											mdgriffith$elm_markup$Mark$Internal$Error$styleNames(styles) + (' still open.  Add ' + (mdgriffith$elm_markup$Mark$Internal$Error$styleChars(styles) + ' to close it.\n\n')))
										])
									])),
							_Utils_ap(
								A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source),
								mdgriffith$elm_markup$Mark$Internal$Error$hint('`*` is used for bold and `/` is used for italic.'))),
						problem: current.problem,
						region: current.range,
						title: 'UNCLOSED STYLE'
					});
			case 'UnexpectedField':
				var msgUnexpectedField = _n0.a;
				var target = A3(elm$core$String$slice, current.range.start.offset, current.range.end.offset, source);
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: elm$core$List$concat(
							_List_fromArray(
								[
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('I ran into an unexpected field name for a '),
										mdgriffith$elm_markup$Mark$Internal$Format$yellow(
										mdgriffith$elm_markup$Mark$Internal$Format$text(msgUnexpectedField.recordName)),
										mdgriffith$elm_markup$Mark$Internal$Format$text(' record\n\n')
									]),
									A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source),
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('\nDo you mean one of these instead?\n\n'),
										mdgriffith$elm_markup$Mark$Internal$Format$yellow(
										mdgriffith$elm_markup$Mark$Internal$Format$text(
											A2(
												elm$core$String$join,
												'\n',
												A2(
													elm$core$List$map,
													mdgriffith$elm_markup$Mark$Internal$Error$addIndent(4),
													A2(
														elm$core$List$sortBy,
														function (exp) {
															return 0 - A2(mdgriffith$elm_markup$Mark$Internal$Error$similarity, target, exp);
														},
														msgUnexpectedField.options)))))
									])
								])),
						problem: current.problem,
						region: current.range,
						title: 'UNKNOWN FIELD'
					});
			case 'BadFloat':
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: elm$core$List$concat(
							_List_fromArray(
								[
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('I was trying to parse a float, but this format looks off.\n\n')
									]),
									A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source)
								])),
						problem: current.problem,
						region: current.range,
						title: 'BAD FLOAT'
					});
			case 'BadInt':
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: elm$core$List$concat(
							_List_fromArray(
								[
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('I was trying to parse an integer, but this format looks off.\n\n')
									]),
									A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source)
								])),
						problem: current.problem,
						region: current.range,
						title: 'BAD INT'
					});
			case 'BadBool':
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: elm$core$List$concat(
							_List_fromArray(
								[
									_List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('I was trying to parse a boolean, but this format looks off.\n\n')
									]),
									A2(mdgriffith$elm_markup$Mark$Internal$Error$highlight, current.range, source)
								])),
						problem: current.problem,
						region: current.range,
						title: 'BAD INT'
					});
			case 'NonMatchingFields':
				var fields = _n0.a;
				var remaining = A2(
					elm$core$List$filter,
					function (f) {
						return !A2(elm$core$List$member, f, fields.found);
					},
					fields.expecting);
				var line = A3(elm$core$String$slice, current.range.start.offset, current.range.end.offset, source);
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: function () {
							if (!remaining.b) {
								return _List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('It looks like a field is missing.')
									]);
							} else {
								if (!remaining.b.b) {
									var single = remaining.a;
									return _List_fromArray(
										[
											mdgriffith$elm_markup$Mark$Internal$Format$text('It looks like a field is missing.\n\n'),
											mdgriffith$elm_markup$Mark$Internal$Format$text('You need to add the '),
											mdgriffith$elm_markup$Mark$Internal$Format$yellow(
											mdgriffith$elm_markup$Mark$Internal$Format$text(single)),
											mdgriffith$elm_markup$Mark$Internal$Format$text(' field.')
										]);
								} else {
									var multiple = remaining;
									return _List_fromArray(
										[
											mdgriffith$elm_markup$Mark$Internal$Format$text('It looks like a field is missing.\n\n'),
											mdgriffith$elm_markup$Mark$Internal$Format$text('You still need to add:\n'),
											mdgriffith$elm_markup$Mark$Internal$Format$yellow(
											mdgriffith$elm_markup$Mark$Internal$Format$text(
												A2(
													elm$core$String$join,
													'\n',
													A2(
														elm$core$List$map,
														mdgriffith$elm_markup$Mark$Internal$Error$addIndent(4),
														A2(
															elm$core$List$sortBy,
															function (exp) {
																return 0 - A2(mdgriffith$elm_markup$Mark$Internal$Error$similarity, line, exp);
															},
															remaining)))))
										]);
								}
							}
						}(),
						problem: current.problem,
						region: current.range,
						title: 'MISSING FIELD'
					});
			case 'MissingFields':
				var remaining = _n0.a;
				var line = A3(elm$core$String$slice, current.range.start.offset, current.range.end.offset, source);
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: function () {
							if (!remaining.b) {
								return _List_fromArray(
									[
										mdgriffith$elm_markup$Mark$Internal$Format$text('It looks like a field is missing.')
									]);
							} else {
								if (!remaining.b.b) {
									var single = remaining.a;
									return _List_fromArray(
										[
											mdgriffith$elm_markup$Mark$Internal$Format$text('It looks like a field is missing.\n\n'),
											mdgriffith$elm_markup$Mark$Internal$Format$text('You need to add the '),
											mdgriffith$elm_markup$Mark$Internal$Format$yellow(
											mdgriffith$elm_markup$Mark$Internal$Format$text(single)),
											mdgriffith$elm_markup$Mark$Internal$Format$text(' field.')
										]);
								} else {
									var multiple = remaining;
									return _List_fromArray(
										[
											mdgriffith$elm_markup$Mark$Internal$Format$text('It looks like a field is missing.\n\n'),
											mdgriffith$elm_markup$Mark$Internal$Format$text('You still need to add:\n'),
											mdgriffith$elm_markup$Mark$Internal$Format$yellow(
											mdgriffith$elm_markup$Mark$Internal$Format$text(
												A2(
													elm$core$String$join,
													'\n',
													A2(
														elm$core$List$map,
														mdgriffith$elm_markup$Mark$Internal$Error$addIndent(4),
														A2(
															elm$core$List$sortBy,
															function (exp) {
																return 0 - A2(mdgriffith$elm_markup$Mark$Internal$Error$similarity, line, exp);
															},
															remaining)))))
										]);
								}
							}
						}(),
						problem: current.problem,
						region: current.range,
						title: 'MISSING FIELD'
					});
			default:
				var custom = _n0.a;
				return mdgriffith$elm_markup$Mark$Internal$Error$Rendered(
					{
						message: A2(elm$core$List$map, mdgriffith$elm_markup$Mark$Internal$Format$text, custom.message),
						problem: current.problem,
						region: current.range,
						title: elm$core$String$toUpper(custom.title)
					});
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Error$BlockStart = {$: 'BlockStart'};
var mdgriffith$elm_markup$Mark$Internal$Error$UnknownBlock = function (a) {
	return {$: 'UnknownBlock', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Parser$word = elm$parser$Parser$Advanced$getChompedString(
	elm$parser$Parser$Advanced$chompWhile(elm$core$Char$isAlphaNum));
var mdgriffith$elm_markup$Mark$Internal$Parser$failableBlocks = function (blocks) {
	return A2(
		elm$parser$Parser$Advanced$keeper,
		A2(
			elm$parser$Parser$Advanced$ignorer,
			A2(
				elm$parser$Parser$Advanced$ignorer,
				elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
				elm$parser$Parser$Advanced$token(
					A2(elm$parser$Parser$Advanced$Token, '|>', mdgriffith$elm_markup$Mark$Internal$Error$BlockStart))),
			elm$parser$Parser$Advanced$chompWhile(
				function (c) {
					return _Utils_eq(
						c,
						_Utils_chr(' '));
				})),
		elm$parser$Parser$Advanced$oneOf(
			_Utils_ap(
				A2(
					elm$core$List$map,
					elm$parser$Parser$Advanced$map(elm$core$Result$Ok),
					blocks.parsers),
				_List_fromArray(
					[
						mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
						function (indentation) {
							return A2(
								elm$parser$Parser$Advanced$ignorer,
								A2(
									elm$parser$Parser$Advanced$ignorer,
									A2(
										elm$parser$Parser$Advanced$ignorer,
										A2(
											elm$parser$Parser$Advanced$ignorer,
											elm$parser$Parser$Advanced$succeed(
												elm$core$Result$Err(
													mdgriffith$elm_markup$Mark$Internal$Error$UnknownBlock(blocks.names))),
											mdgriffith$elm_markup$Mark$Internal$Parser$word),
										elm$parser$Parser$Advanced$chompWhile(
											function (c) {
												return _Utils_eq(
													c,
													_Utils_chr(' '));
											})),
									mdgriffith$elm_markup$Mark$Internal$Parser$newline),
								A2(
									elm$parser$Parser$Advanced$loop,
									'',
									mdgriffith$elm_markup$Mark$Internal$Parser$raggedIndentedStringAbove(indentation)));
						})
					]))));
};
var mdgriffith$elm_markup$Mark$Internal$Parser$getFailableBlock = F3(
	function (context, seed, _n0) {
		var details = _n0.a;
		var _n1 = details.kind;
		switch (_n1.$) {
			case 'Named':
				var name = _n1.a;
				var _n2 = A2(details.parser, context, seed);
				var newSeed = _n2.a;
				var blockParser = _n2.b;
				return _Utils_Tuple2(
					newSeed,
					mdgriffith$elm_markup$Mark$Internal$Parser$failableBlocks(
						{
							names: _List_fromArray(
								[name]),
							parsers: _List_fromArray(
								[blockParser])
						}));
			case 'Value':
				return A2(
					elm$core$Tuple$mapSecond,
					elm$parser$Parser$Advanced$map(elm$core$Result$Ok),
					A2(details.parser, context, seed));
			case 'VerbatimNamed':
				var name = _n1.a;
				return A2(
					elm$core$Tuple$mapSecond,
					elm$parser$Parser$Advanced$map(elm$core$Result$Ok),
					A2(details.parser, mdgriffith$elm_markup$Mark$Internal$Description$ParseInline, seed));
			default:
				var name = _n1.a;
				return A2(
					elm$core$Tuple$mapSecond,
					elm$parser$Parser$Advanced$map(elm$core$Result$Ok),
					A2(details.parser, mdgriffith$elm_markup$Mark$Internal$Description$ParseInline, seed));
		}
	});
var mdgriffith$elm_markup$Mark$document = F2(
	function (view, child) {
		var seed = mdgriffith$elm_markup$Mark$Internal$Id$initialSeed;
		var expectation = mdgriffith$elm_markup$Mark$Internal$Description$getBlockExpectation(child);
		var _n0 = A3(mdgriffith$elm_markup$Mark$Internal$Parser$getFailableBlock, mdgriffith$elm_markup$Mark$Internal$Description$ParseBlock, seed, child);
		var currentSeed = _n0.a;
		var blockParser = _n0.b;
		return mdgriffith$elm_markup$Mark$Internal$Description$Document(
			{
				converter: function (_n1) {
					var parsed = _n1.a;
					var _n2 = parsed.found;
					if (_n2.$ === 'Found') {
						var range = _n2.a;
						var childDesc = _n2.b;
						var _n3 = A2(mdgriffith$elm_markup$Mark$Internal$Description$renderBlock, child, childDesc);
						switch (_n3.$) {
							case 'Success':
								var renderedChild = _n3.a;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Success(
									view(renderedChild));
							case 'Failure':
								var err = _n3.a;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(err);
							default:
								if (_n3.a.$ === 'Uncertain') {
									var unexpected = _n3.a.a;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
										mdgriffith$elm_markup$Mark$Internal$Description$Uncertain(unexpected));
								} else {
									var _n4 = _n3.a;
									var errors = _n4.a;
									var renderedChild = _n4.b;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
										A2(
											mdgriffith$elm_markup$Mark$Internal$Description$Recovered,
											errors,
											view(renderedChild)));
								}
						}
					} else {
						var unexpected = _n2.a;
						return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
							mdgriffith$elm_markup$Mark$Internal$Description$Uncertain(
								_Utils_Tuple2(unexpected, _List_Nil)));
					}
				},
				currentSeed: currentSeed,
				expect: expectation,
				initialSeed: seed,
				parser: A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$keeper,
						A2(
							elm$parser$Parser$Advanced$ignorer,
							elm$parser$Parser$Advanced$succeed(
								F2(
									function (source, result) {
										if (result.$ === 'Ok') {
											var details = result.a;
											return mdgriffith$elm_markup$Mark$Internal$Description$Parsed(
												{
													currentSeed: currentSeed,
													errors: A2(
														elm$core$List$map,
														mdgriffith$elm_markup$Mark$Internal$Error$render(source),
														mdgriffith$elm_markup$Mark$getUnexpecteds(details.value)),
													expected: mdgriffith$elm_markup$Mark$Internal$Description$getBlockExpectation(child),
													found: A2(mdgriffith$elm_markup$Mark$Internal$Description$Found, details.range, details.value),
													initialSeed: seed
												});
										} else {
											var details = result.a;
											return mdgriffith$elm_markup$Mark$Internal$Description$Parsed(
												{
													currentSeed: currentSeed,
													errors: _List_fromArray(
														[
															A2(
															mdgriffith$elm_markup$Mark$Internal$Error$render,
															source,
															{problem: details.error, range: details.range})
														]),
													expected: mdgriffith$elm_markup$Mark$Internal$Description$getBlockExpectation(child),
													found: mdgriffith$elm_markup$Mark$Internal$Description$Unexpected(
														{problem: details.error, range: details.range}),
													initialSeed: seed
												});
										}
									})),
							elm$parser$Parser$Advanced$chompWhile(
								function (c) {
									return _Utils_eq(
										c,
										_Utils_chr('\n'));
								})),
						elm$parser$Parser$Advanced$getSource),
					A2(
						elm$parser$Parser$Advanced$ignorer,
						A2(
							elm$parser$Parser$Advanced$ignorer,
							mdgriffith$elm_markup$Mark$Internal$Parser$withRangeResult(
								A2(elm$parser$Parser$Advanced$withIndent, 0, blockParser)),
							elm$parser$Parser$Advanced$chompWhile(
								function (c) {
									return _Utils_eq(
										c,
										_Utils_chr(' ')) || _Utils_eq(
										c,
										_Utils_chr('\n'));
								})),
						elm$parser$Parser$Advanced$end(mdgriffith$elm_markup$Mark$Internal$Error$End)))
			});
	});
var mdgriffith$elm_markup$Mark$Internal$Description$ExpectManyOf = function (a) {
	return {$: 'ExpectManyOf', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$ManyOf = function (a) {
	return {$: 'ManyOf', a: a};
};
var mdgriffith$elm_markup$Mark$Internal$Description$resultToFound = function (result) {
	if (result.$ === 'Ok') {
		var _n1 = result.a;
		var range = _n1.a;
		var desc = _n1.b;
		return A2(mdgriffith$elm_markup$Mark$Internal$Description$Found, range, desc);
	} else {
		var _n2 = result.a;
		var range = _n2.a;
		var prob = _n2.b;
		return mdgriffith$elm_markup$Mark$Internal$Description$Unexpected(
			{problem: prob, range: range});
	}
};
var mdgriffith$elm_markup$Mark$Internal$Id$reseed = function (_n0) {
	var seed = _n0.a;
	return mdgriffith$elm_markup$Mark$Internal$Id$Seed(
		A2(elm$core$List$cons, 0, seed));
};
var mdgriffith$elm_markup$Mark$Internal$Description$blockName = function (_n0) {
	var details = _n0.a;
	var _n1 = details.kind;
	switch (_n1.$) {
		case 'Named':
			var name = _n1.a;
			return elm$core$Maybe$Just(name);
		case 'Value':
			return elm$core$Maybe$Nothing;
		case 'VerbatimNamed':
			var name = _n1.a;
			return elm$core$Maybe$Just(name);
		default:
			var name = _n1.a;
			return elm$core$Maybe$Just(name);
	}
};
var mdgriffith$elm_markup$Mark$Internal$Description$getParserNoBar = F3(
	function (context, seed, _n0) {
		var details = _n0.a;
		var _n1 = details.kind;
		switch (_n1.$) {
			case 'Named':
				var name = _n1.a;
				return A2(details.parser, context, seed);
			case 'Value':
				return A2(details.parser, context, seed);
			case 'VerbatimNamed':
				var name = _n1.a;
				return A2(details.parser, context, seed);
			default:
				var name = _n1.a;
				return A2(details.parser, context, seed);
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$makeBlocksParser = F2(
	function (blocks, seed) {
		var gatherParsers = F2(
			function (myBlock, details) {
				var _n2 = A3(mdgriffith$elm_markup$Mark$Internal$Description$getParserNoBar, mdgriffith$elm_markup$Mark$Internal$Description$ParseBlock, seed, myBlock);
				var parser = _n2.b;
				var _n3 = mdgriffith$elm_markup$Mark$Internal$Description$blockName(myBlock);
				if (_n3.$ === 'Just') {
					var name = _n3.a;
					return {
						blockNames: A2(elm$core$List$cons, name, details.blockNames),
						childBlocks: A2(
							elm$core$List$cons,
							A2(elm$parser$Parser$Advanced$map, elm$core$Result$Ok, parser),
							details.childBlocks),
						childValues: details.childValues
					};
				} else {
					return {
						blockNames: details.blockNames,
						childBlocks: details.childBlocks,
						childValues: A2(
							elm$core$List$cons,
							A2(
								elm$parser$Parser$Advanced$map,
								elm$core$Result$Ok,
								mdgriffith$elm_markup$Mark$Internal$Parser$withRange(parser)),
							details.childValues)
					};
				}
			});
		var children = A3(
			elm$core$List$foldl,
			gatherParsers,
			{blockNames: _List_Nil, childBlocks: _List_Nil, childValues: _List_Nil},
			blocks);
		var blockParser = A2(
			elm$parser$Parser$Advanced$map,
			function (_n0) {
				var pos = _n0.a;
				var result = _n0.b;
				return A2(
					elm$core$Result$map,
					function (desc) {
						return _Utils_Tuple2(pos, desc);
					},
					result);
			},
			mdgriffith$elm_markup$Mark$Internal$Parser$withRange(
				A2(
					elm$parser$Parser$Advanced$keeper,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						A2(
							elm$parser$Parser$Advanced$ignorer,
							elm$parser$Parser$Advanced$succeed(elm$core$Basics$identity),
							elm$parser$Parser$Advanced$token(
								A2(elm$parser$Parser$Advanced$Token, '|>', mdgriffith$elm_markup$Mark$Internal$Error$BlockStart))),
						elm$parser$Parser$Advanced$chompWhile(
							function (c) {
								return _Utils_eq(
									c,
									_Utils_chr(' '));
							})),
					elm$parser$Parser$Advanced$oneOf(
						_Utils_ap(
							elm$core$List$reverse(children.childBlocks),
							_List_fromArray(
								[
									mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
									function (indentation) {
										return A2(
											elm$parser$Parser$Advanced$keeper,
											elm$parser$Parser$Advanced$succeed(
												function (_n1) {
													var pos = _n1.a;
													var foundWord = _n1.b;
													return elm$core$Result$Err(
														_Utils_Tuple2(
															pos,
															mdgriffith$elm_markup$Mark$Internal$Error$UnknownBlock(children.blockNames)));
												}),
											A2(
												elm$parser$Parser$Advanced$ignorer,
												A2(
													elm$parser$Parser$Advanced$ignorer,
													mdgriffith$elm_markup$Mark$Internal$Parser$withRange(mdgriffith$elm_markup$Mark$Internal$Parser$word),
													mdgriffith$elm_markup$Mark$Internal$Parser$newline),
												A2(
													elm$parser$Parser$Advanced$loop,
													'',
													mdgriffith$elm_markup$Mark$Internal$Parser$raggedIndentedStringAbove(indentation))));
									})
								]))))));
		return elm$parser$Parser$Advanced$oneOf(
			A2(
				elm$core$List$cons,
				blockParser,
				elm$core$List$reverse(children.childValues)));
	});
var mdgriffith$elm_markup$Mark$Internal$Parser$blocksOrNewlines = F3(
	function (indentation, blocks, cursor) {
		return elm$parser$Parser$Advanced$oneOf(
			_List_fromArray(
				[
					A2(
					elm$parser$Parser$Advanced$map,
					function (_n0) {
						return elm$parser$Parser$Advanced$Done(
							elm$core$List$reverse(cursor.found));
					},
					elm$parser$Parser$Advanced$end(mdgriffith$elm_markup$Mark$Internal$Error$End)),
					A2(
					elm$parser$Parser$Advanced$ignorer,
					elm$parser$Parser$Advanced$succeed(
						elm$parser$Parser$Advanced$Loop(
							{found: cursor.found, parsedSomething: true, seed: cursor.seed})),
					mdgriffith$elm_markup$Mark$Internal$Parser$newlineWith('empty newline')),
					(!cursor.parsedSomething) ? A2(
					elm$parser$Parser$Advanced$map,
					function (foundBlock) {
						var _n1 = mdgriffith$elm_markup$Mark$Internal$Id$step(cursor.seed);
						var newSeed = _n1.b;
						return elm$parser$Parser$Advanced$Loop(
							{
								found: A2(elm$core$List$cons, foundBlock, cursor.found),
								parsedSomething: true,
								seed: newSeed
							});
					},
					A2(mdgriffith$elm_markup$Mark$Internal$Parser$makeBlocksParser, blocks, cursor.seed)) : elm$parser$Parser$Advanced$oneOf(
					_List_fromArray(
						[
							A2(
							elm$parser$Parser$Advanced$keeper,
							A2(
								elm$parser$Parser$Advanced$ignorer,
								elm$parser$Parser$Advanced$succeed(
									function (foundBlock) {
										var _n2 = mdgriffith$elm_markup$Mark$Internal$Id$step(cursor.seed);
										var newSeed = _n2.b;
										return elm$parser$Parser$Advanced$Loop(
											{
												found: A2(elm$core$List$cons, foundBlock, cursor.found),
												parsedSomething: true,
												seed: newSeed
											});
									}),
								elm$parser$Parser$Advanced$token(
									A2(
										elm$parser$Parser$Advanced$Token,
										A2(elm$core$String$repeat, indentation, ' '),
										mdgriffith$elm_markup$Mark$Internal$Error$ExpectingIndentation(indentation)))),
							A2(mdgriffith$elm_markup$Mark$Internal$Parser$makeBlocksParser, blocks, cursor.seed)),
							A2(
							elm$parser$Parser$Advanced$ignorer,
							A2(
								elm$parser$Parser$Advanced$ignorer,
								elm$parser$Parser$Advanced$succeed(
									elm$parser$Parser$Advanced$Loop(
										{found: cursor.found, parsedSomething: true, seed: cursor.seed})),
								elm$parser$Parser$Advanced$backtrackable(
									elm$parser$Parser$Advanced$chompWhile(
										function (c) {
											return _Utils_eq(
												c,
												_Utils_chr(' '));
										}))),
							elm$parser$Parser$Advanced$backtrackable(mdgriffith$elm_markup$Mark$Internal$Parser$newline)),
							elm$parser$Parser$Advanced$succeed(
							elm$parser$Parser$Advanced$Done(
								elm$core$List$reverse(cursor.found)))
						])),
					A2(
					elm$parser$Parser$Advanced$ignorer,
					A2(
						elm$parser$Parser$Advanced$ignorer,
						elm$parser$Parser$Advanced$succeed(
							elm$parser$Parser$Advanced$Loop(
								{found: cursor.found, parsedSomething: true, seed: cursor.seed})),
						elm$parser$Parser$Advanced$chompWhile(
							function (c) {
								return _Utils_eq(
									c,
									_Utils_chr(' '));
							})),
					mdgriffith$elm_markup$Mark$Internal$Parser$newlineWith('ws-line'))
				]));
	});
var mdgriffith$elm_markup$Mark$manyOf = function (blocks) {
	var expectations = A2(elm$core$List$map, mdgriffith$elm_markup$Mark$Internal$Description$getBlockExpectation, blocks);
	return mdgriffith$elm_markup$Mark$Internal$Description$Block(
		{
			converter: function (desc) {
				var matchBlock = F3(
					function (description, blck, found) {
						if (found.$ === 'Failure') {
							var _n4 = A2(mdgriffith$elm_markup$Mark$Internal$Description$renderBlock, blck, description);
							if (_n4.$ === 'Failure') {
								return found;
							} else {
								var otherwise = _n4;
								return otherwise;
							}
						} else {
							return found;
						}
					});
				var getRendered = F4(
					function (id, choices, found, _n2) {
						var existingResult = _n2.a;
						var index = _n2.b;
						if (found.$ === 'Unexpected') {
							var unexpected = found.a;
							return _Utils_Tuple2(
								mdgriffith$elm_markup$Mark$Internal$Description$uncertain(unexpected),
								index + 1);
						} else {
							var range = found.a;
							var child = found.b;
							return _Utils_Tuple2(
								A3(
									mdgriffith$elm_markup$Mark$Internal$Description$mergeWith,
									elm$core$List$cons,
									A3(
										elm$core$List$foldl,
										matchBlock(child),
										mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch),
										blocks),
									existingResult),
								index + 1);
						}
					});
				if (desc.$ === 'ManyOf') {
					var many = desc.a;
					return A2(
						mdgriffith$elm_markup$Mark$Internal$Description$mapSuccessAndRecovered,
						elm$core$List$reverse,
						A3(
							elm$core$List$foldl,
							A2(getRendered, many.id, many.choices),
							_Utils_Tuple2(
								mdgriffith$elm_markup$Mark$Internal$Outcome$Success(_List_Nil),
								0),
							many.children).a);
				} else {
					return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(mdgriffith$elm_markup$Mark$Internal$Error$NoMatch);
				}
			},
			expect: mdgriffith$elm_markup$Mark$Internal$Description$ExpectManyOf(expectations),
			kind: mdgriffith$elm_markup$Mark$Internal$Description$Value,
			parser: F2(
				function (context, seed) {
					var _n5 = mdgriffith$elm_markup$Mark$Internal$Id$step(seed);
					var parentId = _n5.a;
					var newSeed = _n5.b;
					var _n6 = mdgriffith$elm_markup$Mark$Internal$Id$step(newSeed);
					var childStart = _n6.b;
					var reseeded = mdgriffith$elm_markup$Mark$Internal$Id$reseed(childStart);
					return _Utils_Tuple2(
						reseeded,
						A2(
							elm$parser$Parser$Advanced$keeper,
							elm$parser$Parser$Advanced$succeed(
								function (_n7) {
									var range = _n7.a;
									var results = _n7.b;
									return mdgriffith$elm_markup$Mark$Internal$Description$ManyOf(
										{
											children: A2(elm$core$List$map, mdgriffith$elm_markup$Mark$Internal$Description$resultToFound, results),
											choices: expectations,
											id: parentId,
											range: range
										});
								}),
							mdgriffith$elm_markup$Mark$Internal$Parser$withRange(
								mdgriffith$elm_markup$Mark$Internal$Parser$withIndent(
									function (indentation) {
										return A2(
											elm$parser$Parser$Advanced$loop,
											{found: _List_Nil, parsedSomething: false, seed: childStart},
											A2(mdgriffith$elm_markup$Mark$Internal$Parser$blocksOrNewlines, indentation, blocks));
									}))));
				})
		});
};
var mdgriffith$elm_markup$Mark$map = F2(
	function (fn, _n0) {
		var details = _n0.a;
		return mdgriffith$elm_markup$Mark$Internal$Description$Block(
			{
				converter: A2(
					elm$core$Basics$composeL,
					mdgriffith$elm_markup$Mark$Internal$Description$mapSuccessAndRecovered(fn),
					details.converter),
				expect: details.expect,
				kind: details.kind,
				parser: details.parser
			});
	});
var author$project$View$BlogPost$document = A2(
	mdgriffith$elm_markup$Mark$document,
	function (elements) {
		return A2(
			mdgriffith$elm_ui$Element$column,
			_List_fromArray(
				[
					mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill)
				]),
			elements);
	},
	mdgriffith$elm_markup$Mark$manyOf(
		_List_fromArray(
			[
				author$project$View$BlogPost$header,
				author$project$View$BlogPost$readmeBlock,
				A2(
				mdgriffith$elm_markup$Mark$map,
				mdgriffith$elm_ui$Element$paragraph(_List_Nil),
				author$project$View$BlogPost$text)
			])));
var mdgriffith$elm_markup$Mark$Error$Light = {$: 'Light'};
var mdgriffith$elm_markup$Mark$Error$foregroundClr = function (theme) {
	if (theme.$ === 'Dark') {
		return '#eeeeec';
	} else {
		return 'rgba(16,16,16, 0.9)';
	}
};
var mdgriffith$elm_markup$Mark$Error$monospaceFonts = '\"SFMono-Regular\",Consolas,\"Liberation Mono\",Menlo,Courier,monospace';
var elm$html$Html$span = _VirtualDom_node('span');
var mdgriffith$elm_markup$Mark$Error$redClr = function (theme) {
	if (theme.$ === 'Dark') {
		return '#ef2929';
	} else {
		return '#cc0000';
	}
};
var mdgriffith$elm_markup$Mark$Error$yellowClr = function (theme) {
	if (theme.$ === 'Dark') {
		return '#edd400';
	} else {
		return '#c4a000';
	}
};
var mdgriffith$elm_markup$Mark$Error$renderMessageHtml = F2(
	function (theme, message) {
		return A2(
			elm$html$Html$span,
			A2(
				elm$core$List$filterMap,
				elm$core$Basics$identity,
				_List_fromArray(
					[
						message.bold ? elm$core$Maybe$Just(
						A2(elm$html$Html$Attributes$style, 'font-weight', 'bold')) : elm$core$Maybe$Nothing,
						message.underline ? elm$core$Maybe$Just(
						A2(elm$html$Html$Attributes$style, 'text-decoration', 'underline')) : elm$core$Maybe$Nothing,
						function () {
						var _n0 = message.color;
						if (_n0.$ === 'Nothing') {
							return elm$core$Maybe$Just(
								A2(
									elm$html$Html$Attributes$style,
									'color',
									mdgriffith$elm_markup$Mark$Error$foregroundClr(theme)));
						} else {
							switch (_n0.a) {
								case 'red':
									return elm$core$Maybe$Just(
										A2(
											elm$html$Html$Attributes$style,
											'color',
											mdgriffith$elm_markup$Mark$Error$redClr(theme)));
								case 'yellow':
									return elm$core$Maybe$Just(
										A2(
											elm$html$Html$Attributes$style,
											'color',
											mdgriffith$elm_markup$Mark$Error$yellowClr(theme)));
								default:
									return elm$core$Maybe$Nothing;
							}
						}
					}()
					])),
			_List_fromArray(
				[
					elm$html$Html$text(message.text)
				]));
	});
var mdgriffith$elm_markup$Mark$Error$formatErrorHtml = F2(
	function (theme, error) {
		return A2(
			elm$html$Html$div,
			_List_fromArray(
				[
					A2(
					elm$html$Html$Attributes$style,
					'color',
					mdgriffith$elm_markup$Mark$Error$foregroundClr(theme)),
					A2(elm$html$Html$Attributes$style, 'white-space', 'pre'),
					A2(elm$html$Html$Attributes$style, 'font-family', mdgriffith$elm_markup$Mark$Error$monospaceFonts)
				]),
			_List_fromArray(
				[
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							A2(elm$html$Html$Attributes$style, 'font-size', '1.4em'),
							A2(elm$html$Html$Attributes$style, 'line-height', '2.1em')
						]),
					_List_fromArray(
						[
							elm$html$Html$text(
							elm$core$String$toUpper(error.title))
						])),
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							A2(elm$html$Html$Attributes$style, 'line-height', '1.4')
						]),
					A2(
						elm$core$List$map,
						mdgriffith$elm_markup$Mark$Error$renderMessageHtml(theme),
						error.message))
				]));
	});
var mdgriffith$elm_markup$Mark$Error$toHtml = F2(
	function (theme, error) {
		if (error.$ === 'Rendered') {
			var details = error.a;
			return A2(
				mdgriffith$elm_markup$Mark$Error$formatErrorHtml,
				theme,
				{message: details.message, title: details.title});
		} else {
			var global = error.a;
			return A2(
				mdgriffith$elm_markup$Mark$Error$formatErrorHtml,
				theme,
				{message: global.message, title: global.title});
		}
	});
var author$project$View$BlogPost$viewErrors = function (errors) {
	return A2(
		elm$core$List$map,
		A2(
			elm$core$Basics$composeR,
			mdgriffith$elm_markup$Mark$Error$toHtml(mdgriffith$elm_markup$Mark$Error$Light),
			mdgriffith$elm_ui$Element$html),
		errors);
};
var mdgriffith$elm_markup$Mark$flattenErrors = function (result) {
	if (result.$ === 'Ok') {
		var _n1 = result.a;
		var parsed = _n1.a;
		var outcome = _n1.b;
		return outcome;
	} else {
		var outcome = result.a;
		return outcome;
	}
};
var mdgriffith$elm_markup$Mark$Almost = function (a) {
	return {$: 'Almost', a: a};
};
var mdgriffith$elm_markup$Mark$Failure = function (a) {
	return {$: 'Failure', a: a};
};
var mdgriffith$elm_markup$Mark$Success = function (a) {
	return {$: 'Success', a: a};
};
var mdgriffith$elm_markup$Mark$rewrapOutcome = function (outcome) {
	switch (outcome.$) {
		case 'Success':
			var s = outcome.a;
			return mdgriffith$elm_markup$Mark$Success(s);
		case 'Almost':
			var x = outcome.a;
			return mdgriffith$elm_markup$Mark$Almost(x);
		default:
			var f = outcome.a;
			return mdgriffith$elm_markup$Mark$Failure(f);
	}
};
var elm$parser$Parser$Advanced$bagToList = F2(
	function (bag, list) {
		bagToList:
		while (true) {
			switch (bag.$) {
				case 'Empty':
					return list;
				case 'AddRight':
					var bag1 = bag.a;
					var x = bag.b;
					var $temp$bag = bag1,
						$temp$list = A2(elm$core$List$cons, x, list);
					bag = $temp$bag;
					list = $temp$list;
					continue bagToList;
				default:
					var bag1 = bag.a;
					var bag2 = bag.b;
					var $temp$bag = bag1,
						$temp$list = A2(elm$parser$Parser$Advanced$bagToList, bag2, list);
					bag = $temp$bag;
					list = $temp$list;
					continue bagToList;
			}
		}
	});
var elm$parser$Parser$Advanced$run = F2(
	function (_n0, src) {
		var parse = _n0.a;
		var _n1 = parse(
			{col: 1, context: _List_Nil, indent: 1, offset: 0, row: 1, src: src});
		if (_n1.$ === 'Good') {
			var value = _n1.b;
			return elm$core$Result$Ok(value);
		} else {
			var bag = _n1.b;
			return elm$core$Result$Err(
				A2(elm$parser$Parser$Advanced$bagToList, bag, _List_Nil));
		}
	});
var mdgriffith$elm_markup$Mark$Internal$Description$errorsToList = function (_n0) {
	var fst = _n0.a;
	var remain = _n0.b;
	return A2(elm$core$List$cons, fst, remain);
};
var mdgriffith$elm_markup$Mark$Internal$Description$compile = F2(
	function (_n0, source) {
		var blocks = _n0.a;
		var _n1 = A2(elm$parser$Parser$Advanced$run, blocks.parser, source);
		if (_n1.$ === 'Ok') {
			var parsed = _n1.a;
			var parsedDetails = parsed.a;
			return A3(
				elm$core$Basics$composeL,
				elm$core$Result$Ok,
				elm$core$Tuple$pair(parsed),
				function () {
					var _n2 = parsedDetails.errors;
					if (!_n2.b) {
						var _n3 = blocks.converter(parsed);
						switch (_n3.$) {
							case 'Success':
								var rendered = _n3.a;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Success(rendered);
							case 'Almost':
								if (_n3.a.$ === 'Recovered') {
									var _n4 = _n3.a;
									var errors = _n4.a;
									var rendered = _n4.b;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
										{
											errors: A2(
												elm$core$List$map,
												mdgriffith$elm_markup$Mark$Internal$Error$render(source),
												mdgriffith$elm_markup$Mark$Internal$Description$errorsToList(errors)),
											result: rendered
										});
								} else {
									var errors = _n3.a.a;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(
										A2(
											elm$core$List$map,
											mdgriffith$elm_markup$Mark$Internal$Error$render(source),
											mdgriffith$elm_markup$Mark$Internal$Description$errorsToList(errors)));
								}
							default:
								var _n5 = _n3.a;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(
									_List_fromArray(
										[mdgriffith$elm_markup$Mark$Internal$Error$documentMismatch]));
						}
					} else {
						var _n6 = blocks.converter(parsed);
						switch (_n6.$) {
							case 'Success':
								var rendered = _n6.a;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
									{errors: parsedDetails.errors, result: rendered});
							case 'Almost':
								if (_n6.a.$ === 'Uncertain') {
									var _n7 = _n6.a.a;
									var err = _n7.a;
									var remainError = _n7.b;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(
										A2(
											elm$core$List$map,
											mdgriffith$elm_markup$Mark$Internal$Error$render(source),
											A2(elm$core$List$cons, err, remainError)));
								} else {
									var _n8 = _n6.a;
									var _n9 = _n8.a;
									var err = _n9.a;
									var remainError = _n9.b;
									var result = _n8.b;
									return mdgriffith$elm_markup$Mark$Internal$Outcome$Almost(
										{
											errors: A2(
												elm$core$List$map,
												mdgriffith$elm_markup$Mark$Internal$Error$render(source),
												A2(elm$core$List$cons, err, remainError)),
											result: result
										});
								}
							default:
								var noMatch = _n6.a;
								return mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(
									A2(elm$core$List$cons, mdgriffith$elm_markup$Mark$Internal$Error$documentMismatch, parsedDetails.errors));
						}
					}
				}());
		} else {
			var deadEnds = _n1.a;
			return elm$core$Result$Err(
				mdgriffith$elm_markup$Mark$Internal$Outcome$Failure(
					_List_fromArray(
						[
							A2(mdgriffith$elm_markup$Mark$Internal$Error$renderParsingErrors, source, deadEnds)
						])));
		}
	});
var mdgriffith$elm_markup$Mark$compile = F2(
	function (doc, source) {
		return mdgriffith$elm_markup$Mark$rewrapOutcome(
			mdgriffith$elm_markup$Mark$flattenErrors(
				A2(mdgriffith$elm_markup$Mark$Internal$Description$compile, doc, source)));
	});
var author$project$View$BlogPost$fromMarkup = function (markupString) {
	var _n0 = A2(mdgriffith$elm_markup$Mark$compile, author$project$View$BlogPost$document, markupString);
	switch (_n0.$) {
		case 'Success':
			var element = _n0.a;
			return element;
		case 'Almost':
			var result = _n0.a.result;
			var errors = _n0.a.errors;
			return A2(
				mdgriffith$elm_ui$Element$column,
				_List_Nil,
				_List_fromArray(
					[
						A2(
						mdgriffith$elm_ui$Element$column,
						_List_Nil,
						author$project$View$BlogPost$viewErrors(errors)),
						A2(mdgriffith$elm_ui$Element$el, _List_Nil, result)
					]));
		default:
			var errors = _n0.a;
			return A2(
				mdgriffith$elm_ui$Element$column,
				_List_Nil,
				author$project$View$BlogPost$viewErrors(errors));
	}
};
var author$project$View$Post$view = function (model) {
	var _n0 = model.router.blogSource;
	if (_n0.$ === 'Nothing') {
		return mdgriffith$elm_ui$Element$text('Source not received yet');
	} else {
		var source = _n0.a;
		return author$project$View$BlogPost$fromMarkup(source);
	}
};
var mdgriffith$elm_ui$Internal$Model$Rgba = F4(
	function (a, b, c, d) {
		return {$: 'Rgba', a: a, b: b, c: c, d: d};
	});
var mdgriffith$elm_ui$Element$rgba255 = F4(
	function (red, green, blue, a) {
		return A4(mdgriffith$elm_ui$Internal$Model$Rgba, red / 255, green / 255, blue / 255, a);
	});
var author$project$Colour$shaded = A4(mdgriffith$elm_ui$Element$rgba255, 0, 0, 0, 0.5);
var mdgriffith$elm_ui$Element$rgb = F3(
	function (r, g, b) {
		return A4(mdgriffith$elm_ui$Internal$Model$Rgba, r, g, b, 1);
	});
var author$project$Colour$white = A3(mdgriffith$elm_ui$Element$rgb, 1, 1, 1);
var mdgriffith$elm_ui$Internal$Model$AlignY = function (a) {
	return {$: 'AlignY', a: a};
};
var mdgriffith$elm_ui$Internal$Model$Bottom = {$: 'Bottom'};
var mdgriffith$elm_ui$Element$alignBottom = mdgriffith$elm_ui$Internal$Model$AlignY(mdgriffith$elm_ui$Internal$Model$Bottom);
var author$project$View$Project$description = function (project) {
	return A2(
		mdgriffith$elm_ui$Element$paragraph,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$Font$size(20),
				mdgriffith$elm_ui$Element$alignBottom
			]),
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$text(project.blurb)
			]));
};
var author$project$View$Project$header = function (project) {
	return A2(
		mdgriffith$elm_ui$Element$column,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$spacing(20)
			]),
		_List_fromArray(
			[
				A2(
				mdgriffith$elm_ui$Element$el,
				_List_fromArray(
					[
						mdgriffith$elm_ui$Element$Font$size(30)
					]),
				mdgriffith$elm_ui$Element$text(project.name)),
				A2(
				mdgriffith$elm_ui$Element$el,
				_List_fromArray(
					[
						mdgriffith$elm_ui$Element$Font$size(15)
					]),
				mdgriffith$elm_ui$Element$text(
					elm$core$String$fromInt(project.year)))
			]));
};
var lattyware$elm_fontawesome$FontAwesome$Icon$Presentation = function (a) {
	return {$: 'Presentation', a: a};
};
var lattyware$elm_fontawesome$FontAwesome$Icon$present = function (icon) {
	return lattyware$elm_fontawesome$FontAwesome$Icon$Presentation(
		{attributes: _List_Nil, icon: icon, id: elm$core$Maybe$Nothing, outer: elm$core$Maybe$Nothing, role: 'img', title: elm$core$Maybe$Nothing, transforms: _List_Nil});
};
var elm$html$Html$Attributes$attribute = elm$virtual_dom$VirtualDom$attribute;
var elm$svg$Svg$trustedNode = _VirtualDom_nodeNS('http://www.w3.org/2000/svg');
var elm$svg$Svg$svg = elm$svg$Svg$trustedNode('svg');
var elm$svg$Svg$Attributes$class = _VirtualDom_attribute('class');
var elm$svg$Svg$Attributes$viewBox = _VirtualDom_attribute('viewBox');
var elm$svg$Svg$text = elm$virtual_dom$VirtualDom$text;
var elm$svg$Svg$title = elm$svg$Svg$trustedNode('title');
var elm$svg$Svg$Attributes$id = _VirtualDom_attribute('id');
var lattyware$elm_fontawesome$FontAwesome$Icon$titledContents = F3(
	function (titleId, contents, title) {
		return A2(
			elm$core$List$cons,
			A2(
				elm$svg$Svg$title,
				_List_fromArray(
					[
						elm$svg$Svg$Attributes$id(titleId)
					]),
				_List_fromArray(
					[
						elm$svg$Svg$text(title)
					])),
			contents);
	});
var elm$svg$Svg$clipPath = elm$svg$Svg$trustedNode('clipPath');
var elm$svg$Svg$defs = elm$svg$Svg$trustedNode('defs');
var elm$svg$Svg$g = elm$svg$Svg$trustedNode('g');
var elm$svg$Svg$mask = elm$svg$Svg$trustedNode('mask');
var elm$svg$Svg$path = elm$svg$Svg$trustedNode('path');
var elm$svg$Svg$rect = elm$svg$Svg$trustedNode('rect');
var elm$svg$Svg$Attributes$clipPath = _VirtualDom_attribute('clip-path');
var elm$svg$Svg$Attributes$d = _VirtualDom_attribute('d');
var elm$svg$Svg$Attributes$fill = _VirtualDom_attribute('fill');
var elm$svg$Svg$Attributes$mask = _VirtualDom_attribute('mask');
var elm$svg$Svg$Attributes$maskContentUnits = _VirtualDom_attribute('maskContentUnits');
var elm$svg$Svg$Attributes$maskUnits = _VirtualDom_attribute('maskUnits');
var elm$svg$Svg$Attributes$height = _VirtualDom_attribute('height');
var elm$svg$Svg$Attributes$width = _VirtualDom_attribute('width');
var elm$svg$Svg$Attributes$x = _VirtualDom_attribute('x');
var elm$svg$Svg$Attributes$y = _VirtualDom_attribute('y');
var lattyware$elm_fontawesome$FontAwesome$Icon$allSpace = _List_fromArray(
	[
		elm$svg$Svg$Attributes$x('0'),
		elm$svg$Svg$Attributes$y('0'),
		elm$svg$Svg$Attributes$width('100%'),
		elm$svg$Svg$Attributes$height('100%')
	]);
var lattyware$elm_fontawesome$FontAwesome$Icon$corePath = F2(
	function (attrs, icon) {
		return A2(
			elm$svg$Svg$path,
			A2(
				elm$core$List$cons,
				elm$svg$Svg$Attributes$fill('currentColor'),
				A2(
					elm$core$List$cons,
					elm$svg$Svg$Attributes$d(icon.path),
					attrs)),
			_List_Nil);
	});
var lattyware$elm_fontawesome$FontAwesome$Icon$viewMaskedWithTransform = F4(
	function (id, transforms, inner, outer) {
		var maskInnerGroup = A2(
			elm$svg$Svg$g,
			_List_fromArray(
				[transforms.inner]),
			_List_fromArray(
				[
					A2(
					elm$svg$Svg$path,
					_List_fromArray(
						[
							transforms.path,
							elm$svg$Svg$Attributes$fill('black'),
							elm$svg$Svg$Attributes$d(inner.path)
						]),
					_List_Nil)
				]));
		var maskId = 'mask-' + (inner.name + ('-' + id));
		var maskTag = A2(
			elm$svg$Svg$mask,
			_Utils_ap(
				_List_fromArray(
					[
						elm$svg$Svg$Attributes$id(maskId),
						elm$svg$Svg$Attributes$maskUnits('userSpaceOnUse'),
						elm$svg$Svg$Attributes$maskContentUnits('userSpaceOnUse')
					]),
				lattyware$elm_fontawesome$FontAwesome$Icon$allSpace),
			_List_fromArray(
				[
					A2(
					elm$svg$Svg$rect,
					A2(
						elm$core$List$cons,
						elm$svg$Svg$Attributes$fill('white'),
						lattyware$elm_fontawesome$FontAwesome$Icon$allSpace),
					_List_Nil),
					A2(
					elm$svg$Svg$g,
					_List_fromArray(
						[transforms.outer]),
					_List_fromArray(
						[maskInnerGroup]))
				]));
		var clipId = 'clip-' + (outer.name + ('-' + id));
		var defs = A2(
			elm$svg$Svg$defs,
			_List_Nil,
			_List_fromArray(
				[
					A2(
					elm$svg$Svg$clipPath,
					_List_fromArray(
						[
							elm$svg$Svg$Attributes$id(clipId)
						]),
					_List_fromArray(
						[
							A2(lattyware$elm_fontawesome$FontAwesome$Icon$corePath, _List_Nil, outer)
						])),
					maskTag
				]));
		return _List_fromArray(
			[
				defs,
				A2(
				elm$svg$Svg$rect,
				elm$core$List$concat(
					_List_fromArray(
						[
							_List_fromArray(
							[
								elm$svg$Svg$Attributes$fill('currentColor'),
								elm$svg$Svg$Attributes$clipPath('url(#' + (clipId + ')')),
								elm$svg$Svg$Attributes$mask('url(#' + (maskId + ')'))
							]),
							lattyware$elm_fontawesome$FontAwesome$Icon$allSpace
						])),
				_List_Nil)
			]);
	});
var lattyware$elm_fontawesome$FontAwesome$Icon$viewWithTransform = F2(
	function (transforms, icon) {
		if (transforms.$ === 'Just') {
			var ts = transforms.a;
			return A2(
				elm$svg$Svg$g,
				_List_fromArray(
					[ts.outer]),
				_List_fromArray(
					[
						A2(
						elm$svg$Svg$g,
						_List_fromArray(
							[ts.inner]),
						_List_fromArray(
							[
								A2(
								lattyware$elm_fontawesome$FontAwesome$Icon$corePath,
								_List_fromArray(
									[ts.path]),
								icon)
							]))
					]));
		} else {
			return A2(lattyware$elm_fontawesome$FontAwesome$Icon$corePath, _List_Nil, icon);
		}
	});
var lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$add = F2(
	function (transform, combined) {
		switch (transform.$) {
			case 'Scale':
				var direction = transform.a;
				var amount = function () {
					if (direction.$ === 'Grow') {
						var by = direction.a;
						return by;
					} else {
						var by = direction.a;
						return -by;
					}
				}();
				return _Utils_update(
					combined,
					{size: combined.size + amount});
			case 'Reposition':
				var direction = transform.a;
				var _n2 = function () {
					switch (direction.$) {
						case 'Up':
							var by = direction.a;
							return _Utils_Tuple2(0, -by);
						case 'Down':
							var by = direction.a;
							return _Utils_Tuple2(0, by);
						case 'Left':
							var by = direction.a;
							return _Utils_Tuple2(-by, 0);
						default:
							var by = direction.a;
							return _Utils_Tuple2(by, 0);
					}
				}();
				var x = _n2.a;
				var y = _n2.b;
				return _Utils_update(
					combined,
					{x: combined.x + x, y: combined.y + y});
			case 'Rotate':
				var rotation = transform.a;
				return _Utils_update(
					combined,
					{rotate: combined.rotate + rotation});
			default:
				if (transform.a.$ === 'Vertical') {
					var _n4 = transform.a;
					return _Utils_update(
						combined,
						{flipX: true});
				} else {
					var _n5 = transform.a;
					return _Utils_update(
						combined,
						{flipY: true});
				}
		}
	});
var lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$baseSize = 16;
var lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$meaninglessTransform = {flipX: false, flipY: false, rotate: 0, size: lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$baseSize, x: 0, y: 0};
var lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$combine = function (transforms) {
	return A3(elm$core$List$foldl, lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$add, lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$meaninglessTransform, transforms);
};
var lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$meaningfulTransform = function (transforms) {
	var combined = lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$combine(transforms);
	return _Utils_eq(combined, lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$meaninglessTransform) ? elm$core$Maybe$Nothing : elm$core$Maybe$Just(combined);
};
var elm$svg$Svg$Attributes$transform = _VirtualDom_attribute('transform');
var lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$transformForSvg = F3(
	function (containerWidth, iconWidth, transform) {
		var path = 'translate(' + (elm$core$String$fromFloat((iconWidth / 2) * (-1)) + ' -256)');
		var outer = 'translate(' + (elm$core$String$fromFloat(containerWidth / 2) + ' 256)');
		var innerTranslate = 'translate(' + (elm$core$String$fromFloat(transform.x * 32) + (',' + (elm$core$String$fromFloat(transform.y * 32) + ') ')));
		var innerRotate = 'rotate(' + (elm$core$String$fromFloat(transform.rotate) + ' 0 0)');
		var flipY = transform.flipY ? (-1) : 1;
		var scaleY = (transform.size / lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$baseSize) * flipY;
		var flipX = transform.flipX ? (-1) : 1;
		var scaleX = (transform.size / lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$baseSize) * flipX;
		var innerScale = 'scale(' + (elm$core$String$fromFloat(scaleX) + (', ' + (elm$core$String$fromFloat(scaleY) + ') ')));
		return {
			inner: elm$svg$Svg$Attributes$transform(
				_Utils_ap(
					innerTranslate,
					_Utils_ap(innerScale, innerRotate))),
			outer: elm$svg$Svg$Attributes$transform(outer),
			path: elm$svg$Svg$Attributes$transform(path)
		};
	});
var lattyware$elm_fontawesome$FontAwesome$Icon$internalView = function (_n0) {
	var icon = _n0.a.icon;
	var attributes = _n0.a.attributes;
	var transforms = _n0.a.transforms;
	var role = _n0.a.role;
	var id = _n0.a.id;
	var title = _n0.a.title;
	var outer = _n0.a.outer;
	var alwaysId = A2(elm$core$Maybe$withDefault, icon.name, id);
	var titleId = alwaysId + '-title';
	var semantics = A2(
		elm$core$Maybe$withDefault,
		A2(elm$html$Html$Attributes$attribute, 'aria-hidden', 'true'),
		A2(
			elm$core$Maybe$map,
			elm$core$Basics$always(
				A2(elm$html$Html$Attributes$attribute, 'aria-labelledby', titleId)),
			title));
	var _n1 = A2(
		elm$core$Maybe$withDefault,
		_Utils_Tuple2(icon.width, icon.height),
		A2(
			elm$core$Maybe$map,
			function (o) {
				return _Utils_Tuple2(o.width, o.height);
			},
			outer));
	var width = _n1.a;
	var height = _n1.b;
	var classes = _List_fromArray(
		[
			'svg-inline--fa',
			'fa-' + icon.name,
			'fa-w-' + elm$core$String$fromInt(
			elm$core$Basics$ceiling((width / height) * 16))
		]);
	var svgTransform = A2(
		elm$core$Maybe$map,
		A2(lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$transformForSvg, width, icon.width),
		lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$meaningfulTransform(transforms));
	var contents = function () {
		var resolvedSvgTransform = A2(
			elm$core$Maybe$withDefault,
			A3(lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$transformForSvg, width, icon.width, lattyware$elm_fontawesome$FontAwesome$Transforms$Internal$meaninglessTransform),
			svgTransform);
		return A2(
			elm$core$Maybe$withDefault,
			_List_fromArray(
				[
					A2(lattyware$elm_fontawesome$FontAwesome$Icon$viewWithTransform, svgTransform, icon)
				]),
			A2(
				elm$core$Maybe$map,
				A3(lattyware$elm_fontawesome$FontAwesome$Icon$viewMaskedWithTransform, alwaysId, resolvedSvgTransform, icon),
				outer));
	}();
	var potentiallyTitledContents = A2(
		elm$core$Maybe$withDefault,
		contents,
		A2(
			elm$core$Maybe$map,
			A2(lattyware$elm_fontawesome$FontAwesome$Icon$titledContents, titleId, contents),
			title));
	return A2(
		elm$svg$Svg$svg,
		elm$core$List$concat(
			_List_fromArray(
				[
					_List_fromArray(
					[
						A2(elm$html$Html$Attributes$attribute, 'role', role),
						A2(elm$html$Html$Attributes$attribute, 'xmlns', 'http://www.w3.org/2000/svg'),
						elm$svg$Svg$Attributes$viewBox(
						'0 0 ' + (elm$core$String$fromInt(width) + (' ' + elm$core$String$fromInt(height)))),
						semantics
					]),
					A2(elm$core$List$map, elm$svg$Svg$Attributes$class, classes),
					attributes
				])),
		potentiallyTitledContents);
};
var lattyware$elm_fontawesome$FontAwesome$Icon$view = function (presentation) {
	return lattyware$elm_fontawesome$FontAwesome$Icon$internalView(presentation);
};
var lattyware$elm_fontawesome$FontAwesome$Icon$viewIcon = A2(elm$core$Basics$composeR, lattyware$elm_fontawesome$FontAwesome$Icon$present, lattyware$elm_fontawesome$FontAwesome$Icon$view);
var author$project$Icon$view = function (icon) {
	return mdgriffith$elm_ui$Element$html(
		lattyware$elm_fontawesome$FontAwesome$Icon$viewIcon(icon));
};
var mdgriffith$elm_ui$Internal$Model$CenterY = {$: 'CenterY'};
var mdgriffith$elm_ui$Element$centerY = mdgriffith$elm_ui$Internal$Model$AlignY(mdgriffith$elm_ui$Internal$Model$CenterY);
var author$project$View$Project$iconWrapper = function (icon) {
	return A2(
		mdgriffith$elm_ui$Element$el,
		_List_fromArray(
			[mdgriffith$elm_ui$Element$centerX, mdgriffith$elm_ui$Element$centerY]),
		icon);
};
var mdgriffith$elm_ui$Element$rgb255 = F3(
	function (red, green, blue) {
		return A4(mdgriffith$elm_ui$Internal$Model$Rgba, red / 255, green / 255, blue / 255, 1);
	});
var author$project$Colour$gray = A3(mdgriffith$elm_ui$Element$rgb255, 175, 175, 175);
var mdgriffith$elm_ui$Internal$Flag$hover = mdgriffith$elm_ui$Internal$Flag$flag(33);
var mdgriffith$elm_ui$Internal$Model$Hover = {$: 'Hover'};
var mdgriffith$elm_ui$Internal$Model$PseudoSelector = F2(
	function (a, b) {
		return {$: 'PseudoSelector', a: a, b: b};
	});
var elm$virtual_dom$VirtualDom$mapAttribute = _VirtualDom_mapAttribute;
var mdgriffith$elm_ui$Internal$Model$Nearby = F2(
	function (a, b) {
		return {$: 'Nearby', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Model$NoAttribute = {$: 'NoAttribute'};
var mdgriffith$elm_ui$Internal$Model$TransformComponent = F2(
	function (a, b) {
		return {$: 'TransformComponent', a: a, b: b};
	});
var elm$virtual_dom$VirtualDom$map = _VirtualDom_map;
var mdgriffith$elm_ui$Internal$Model$Empty = {$: 'Empty'};
var mdgriffith$elm_ui$Internal$Model$map = F2(
	function (fn, el) {
		switch (el.$) {
			case 'Styled':
				var styled = el.a;
				return mdgriffith$elm_ui$Internal$Model$Styled(
					{
						html: F2(
							function (add, context) {
								return A2(
									elm$virtual_dom$VirtualDom$map,
									fn,
									A2(styled.html, add, context));
							}),
						styles: styled.styles
					});
			case 'Unstyled':
				var html = el.a;
				return mdgriffith$elm_ui$Internal$Model$Unstyled(
					A2(
						elm$core$Basics$composeL,
						elm$virtual_dom$VirtualDom$map(fn),
						html));
			case 'Text':
				var str = el.a;
				return mdgriffith$elm_ui$Internal$Model$Text(str);
			default:
				return mdgriffith$elm_ui$Internal$Model$Empty;
		}
	});
var mdgriffith$elm_ui$Internal$Model$mapAttrFromStyle = F2(
	function (fn, attr) {
		switch (attr.$) {
			case 'NoAttribute':
				return mdgriffith$elm_ui$Internal$Model$NoAttribute;
			case 'Describe':
				var description = attr.a;
				return mdgriffith$elm_ui$Internal$Model$Describe(description);
			case 'AlignX':
				var x = attr.a;
				return mdgriffith$elm_ui$Internal$Model$AlignX(x);
			case 'AlignY':
				var y = attr.a;
				return mdgriffith$elm_ui$Internal$Model$AlignY(y);
			case 'Width':
				var x = attr.a;
				return mdgriffith$elm_ui$Internal$Model$Width(x);
			case 'Height':
				var x = attr.a;
				return mdgriffith$elm_ui$Internal$Model$Height(x);
			case 'Class':
				var x = attr.a;
				var y = attr.b;
				return A2(mdgriffith$elm_ui$Internal$Model$Class, x, y);
			case 'StyleClass':
				var flag = attr.a;
				var style = attr.b;
				return A2(mdgriffith$elm_ui$Internal$Model$StyleClass, flag, style);
			case 'Nearby':
				var location = attr.a;
				var elem = attr.b;
				return A2(
					mdgriffith$elm_ui$Internal$Model$Nearby,
					location,
					A2(mdgriffith$elm_ui$Internal$Model$map, fn, elem));
			case 'Attr':
				var htmlAttr = attr.a;
				return mdgriffith$elm_ui$Internal$Model$Attr(
					A2(elm$virtual_dom$VirtualDom$mapAttribute, fn, htmlAttr));
			default:
				var fl = attr.a;
				var trans = attr.b;
				return A2(mdgriffith$elm_ui$Internal$Model$TransformComponent, fl, trans);
		}
	});
var mdgriffith$elm_ui$Internal$Model$removeNever = function (style) {
	return A2(mdgriffith$elm_ui$Internal$Model$mapAttrFromStyle, elm$core$Basics$never, style);
};
var mdgriffith$elm_ui$Internal$Model$unwrapDecsHelper = F2(
	function (attr, _n0) {
		var styles = _n0.a;
		var trans = _n0.b;
		var _n1 = mdgriffith$elm_ui$Internal$Model$removeNever(attr);
		switch (_n1.$) {
			case 'StyleClass':
				var style = _n1.b;
				return _Utils_Tuple2(
					A2(elm$core$List$cons, style, styles),
					trans);
			case 'TransformComponent':
				var flag = _n1.a;
				var component = _n1.b;
				return _Utils_Tuple2(
					styles,
					A2(mdgriffith$elm_ui$Internal$Model$composeTransformation, trans, component));
			default:
				return _Utils_Tuple2(styles, trans);
		}
	});
var mdgriffith$elm_ui$Internal$Model$unwrapDecorations = function (attrs) {
	var _n0 = A3(
		elm$core$List$foldl,
		mdgriffith$elm_ui$Internal$Model$unwrapDecsHelper,
		_Utils_Tuple2(_List_Nil, mdgriffith$elm_ui$Internal$Model$Untransformed),
		attrs);
	var styles = _n0.a;
	var transform = _n0.b;
	return A2(
		elm$core$List$cons,
		mdgriffith$elm_ui$Internal$Model$Transform(transform),
		styles);
};
var mdgriffith$elm_ui$Element$mouseOver = function (decs) {
	return A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$hover,
		A2(
			mdgriffith$elm_ui$Internal$Model$PseudoSelector,
			mdgriffith$elm_ui$Internal$Model$Hover,
			mdgriffith$elm_ui$Internal$Model$unwrapDecorations(decs)));
};
var elm$html$Html$Attributes$target = elm$html$Html$Attributes$stringProperty('target');
var mdgriffith$elm_ui$Element$newTabLink = F2(
	function (attrs, _n0) {
		var url = _n0.url;
		var label = _n0.label;
		return A4(
			mdgriffith$elm_ui$Internal$Model$element,
			mdgriffith$elm_ui$Internal$Model$asEl,
			mdgriffith$elm_ui$Internal$Model$NodeName('a'),
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Internal$Model$Attr(
					elm$html$Html$Attributes$href(url)),
				A2(
					elm$core$List$cons,
					mdgriffith$elm_ui$Internal$Model$Attr(
						elm$html$Html$Attributes$rel('noopener noreferrer')),
					A2(
						elm$core$List$cons,
						mdgriffith$elm_ui$Internal$Model$Attr(
							elm$html$Html$Attributes$target('_blank')),
						A2(
							elm$core$List$cons,
							mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$shrink),
							A2(
								elm$core$List$cons,
								mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$shrink),
								A2(
									elm$core$List$cons,
									mdgriffith$elm_ui$Internal$Model$htmlClass(mdgriffith$elm_ui$Internal$Style$classes.contentCenterX + (' ' + mdgriffith$elm_ui$Internal$Style$classes.contentCenterY)),
									attrs)))))),
			mdgriffith$elm_ui$Internal$Model$Unkeyed(
				_List_fromArray(
					[label])));
	});
var mdgriffith$elm_ui$Internal$Flag$fontColor = mdgriffith$elm_ui$Internal$Flag$flag(14);
var mdgriffith$elm_ui$Internal$Model$Colored = F3(
	function (a, b, c) {
		return {$: 'Colored', a: a, b: b, c: c};
	});
var mdgriffith$elm_ui$Internal$Model$formatColorClass = function (_n0) {
	var red = _n0.a;
	var green = _n0.b;
	var blue = _n0.c;
	var alpha = _n0.d;
	return mdgriffith$elm_ui$Internal$Model$floatClass(red) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(green) + ('-' + (mdgriffith$elm_ui$Internal$Model$floatClass(blue) + ('-' + mdgriffith$elm_ui$Internal$Model$floatClass(alpha))))));
};
var mdgriffith$elm_ui$Element$Font$color = function (fontColor) {
	return A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$fontColor,
		A3(
			mdgriffith$elm_ui$Internal$Model$Colored,
			'fc-' + mdgriffith$elm_ui$Internal$Model$formatColorClass(fontColor),
			'color',
			fontColor));
};
var author$project$View$Project$linkWrap = F2(
	function (link, icon) {
		return A2(
			mdgriffith$elm_ui$Element$newTabLink,
			_List_fromArray(
				[
					mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill),
					mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$fill),
					mdgriffith$elm_ui$Element$mouseOver(
					_List_fromArray(
						[
							mdgriffith$elm_ui$Element$Font$color(author$project$Colour$gray)
						]))
				]),
			{label: icon, url: link});
	});
var elm$core$Result$toMaybe = function (result) {
	if (result.$ === 'Ok') {
		var v = result.a;
		return elm$core$Maybe$Just(v);
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var elm$parser$Parser$chompWhile = elm$parser$Parser$Advanced$chompWhile;
var elm$parser$Parser$getChompedString = elm$parser$Parser$Advanced$getChompedString;
var elm$parser$Parser$ignorer = elm$parser$Parser$Advanced$ignorer;
var elm$parser$Parser$DeadEnd = F3(
	function (row, col, problem) {
		return {col: col, problem: problem, row: row};
	});
var elm$parser$Parser$problemToDeadEnd = function (p) {
	return A3(elm$parser$Parser$DeadEnd, p.row, p.col, p.problem);
};
var elm$parser$Parser$run = F2(
	function (parser, source) {
		var _n0 = A2(elm$parser$Parser$Advanced$run, parser, source);
		if (_n0.$ === 'Ok') {
			var a = _n0.a;
			return elm$core$Result$Ok(a);
		} else {
			var problems = _n0.a;
			return elm$core$Result$Err(
				A2(elm$core$List$map, elm$parser$Parser$problemToDeadEnd, problems));
		}
	});
var elm$parser$Parser$succeed = elm$parser$Parser$Advanced$succeed;
var author$project$Routes$emuFileParser = function (file) {
	return elm$core$Result$toMaybe(
		function (parser) {
			return A2(elm$parser$Parser$run, parser, file);
		}(
			elm$parser$Parser$getChompedString(
				A2(
					elm$parser$Parser$ignorer,
					elm$parser$Parser$succeed(_Utils_Tuple0),
					elm$parser$Parser$chompWhile(
						function (c) {
							return !_Utils_eq(
								c,
								_Utils_chr('.'));
						})))));
};
var author$project$Routes$emuPathParser = elm$url$Url$Parser$parse(
	A2(
		elm$url$Url$Parser$slash,
		elm$url$Url$Parser$s('src'),
		A2(
			elm$url$Url$Parser$slash,
			elm$url$Url$Parser$s('post'),
			elm$url$Url$Parser$string)));
var elm$core$Maybe$andThen = F2(
	function (callback, maybeValue) {
		if (maybeValue.$ === 'Just') {
			var value = maybeValue.a;
			return callback(value);
		} else {
			return elm$core$Maybe$Nothing;
		}
	});
var author$project$Routes$getFileName = function (link) {
	return A2(
		elm$core$Maybe$andThen,
		author$project$Routes$emuFileParser,
		A2(
			elm$core$Maybe$andThen,
			author$project$Routes$emuPathParser,
			elm$url$Url$fromString(link)));
};
var mdgriffith$elm_ui$Internal$Flag$cursor = mdgriffith$elm_ui$Internal$Flag$flag(21);
var mdgriffith$elm_ui$Element$pointer = A2(mdgriffith$elm_ui$Internal$Model$Class, mdgriffith$elm_ui$Internal$Flag$cursor, mdgriffith$elm_ui$Internal$Style$classes.cursorPointer);
var elm$virtual_dom$VirtualDom$Normal = function (a) {
	return {$: 'Normal', a: a};
};
var elm$virtual_dom$VirtualDom$on = _VirtualDom_on;
var elm$html$Html$Events$on = F2(
	function (event, decoder) {
		return A2(
			elm$virtual_dom$VirtualDom$on,
			event,
			elm$virtual_dom$VirtualDom$Normal(decoder));
	});
var elm$html$Html$Events$onClick = function (msg) {
	return A2(
		elm$html$Html$Events$on,
		'click',
		elm$json$Json$Decode$succeed(msg));
};
var mdgriffith$elm_ui$Element$Events$onClick = A2(elm$core$Basics$composeL, mdgriffith$elm_ui$Internal$Model$Attr, elm$html$Html$Events$onClick);
var author$project$View$Project$postLinkWrap = F2(
	function (link, icon) {
		var fileName = A2(
			elm$core$Maybe$withDefault,
			'oof',
			author$project$Routes$getFileName(link));
		return A2(
			mdgriffith$elm_ui$Element$el,
			_List_fromArray(
				[
					mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill),
					mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$fill),
					mdgriffith$elm_ui$Element$pointer,
					mdgriffith$elm_ui$Element$Events$onClick(
					author$project$Model$NavigateTo(
						author$project$Routes$Post(fileName))),
					mdgriffith$elm_ui$Element$mouseOver(
					_List_fromArray(
						[
							mdgriffith$elm_ui$Element$Font$color(author$project$Colour$gray)
						]))
				]),
			icon);
	});
var lattyware$elm_fontawesome$FontAwesome$Icon$Icon = F5(
	function (prefix, name, width, height, path) {
		return {height: height, name: name, path: path, prefix: prefix, width: width};
	});
var lattyware$elm_fontawesome$FontAwesome$Brands$github = A5(lattyware$elm_fontawesome$FontAwesome$Icon$Icon, 'fab', 'github', 496, 512, 'M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z');
var lattyware$elm_fontawesome$FontAwesome$Solid$info = A5(lattyware$elm_fontawesome$FontAwesome$Icon$Icon, 'fas', 'info', 192, 512, 'M20 424.229h20V279.771H20c-11.046 0-20-8.954-20-20V212c0-11.046 8.954-20 20-20h112c11.046 0 20 8.954 20 20v212.229h20c11.046 0 20 8.954 20 20V492c0 11.046-8.954 20-20 20H20c-11.046 0-20-8.954-20-20v-47.771c0-11.046 8.954-20 20-20zM96 0C56.235 0 24 32.235 24 72s32.235 72 72 72 72-32.235 72-72S135.764 0 96 0z');
var lattyware$elm_fontawesome$FontAwesome$Solid$link = A5(lattyware$elm_fontawesome$FontAwesome$Icon$Icon, 'fas', 'link', 512, 512, 'M326.612 185.391c59.747 59.809 58.927 155.698.36 214.59-.11.12-.24.25-.36.37l-67.2 67.2c-59.27 59.27-155.699 59.262-214.96 0-59.27-59.26-59.27-155.7 0-214.96l37.106-37.106c9.84-9.84 26.786-3.3 27.294 10.606.648 17.722 3.826 35.527 9.69 52.721 1.986 5.822.567 12.262-3.783 16.612l-13.087 13.087c-28.026 28.026-28.905 73.66-1.155 101.96 28.024 28.579 74.086 28.749 102.325.51l67.2-67.19c28.191-28.191 28.073-73.757 0-101.83-3.701-3.694-7.429-6.564-10.341-8.569a16.037 16.037 0 0 1-6.947-12.606c-.396-10.567 3.348-21.456 11.698-29.806l21.054-21.055c5.521-5.521 14.182-6.199 20.584-1.731a152.482 152.482 0 0 1 20.522 17.197zM467.547 44.449c-59.261-59.262-155.69-59.27-214.96 0l-67.2 67.2c-.12.12-.25.25-.36.37-58.566 58.892-59.387 154.781.36 214.59a152.454 152.454 0 0 0 20.521 17.196c6.402 4.468 15.064 3.789 20.584-1.731l21.054-21.055c8.35-8.35 12.094-19.239 11.698-29.806a16.037 16.037 0 0 0-6.947-12.606c-2.912-2.005-6.64-4.875-10.341-8.569-28.073-28.073-28.191-73.639 0-101.83l67.2-67.19c28.239-28.239 74.3-28.069 102.325.51 27.75 28.3 26.872 73.934-1.155 101.96l-13.087 13.087c-4.35 4.35-5.769 10.79-3.783 16.612 5.864 17.194 9.042 34.999 9.69 52.721.509 13.906 17.454 20.446 27.294 10.606l37.106-37.106c59.271-59.259 59.271-155.699.001-214.959z');
var author$project$View$Project$iconRow = function (project) {
	return A2(
		mdgriffith$elm_ui$Element$row,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill),
				mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$fill)
			]),
		_List_fromArray(
			[
				A2(
				author$project$View$Project$linkWrap,
				project.githubLink,
				author$project$View$Project$iconWrapper(
					author$project$Icon$view(lattyware$elm_fontawesome$FontAwesome$Brands$github))),
				A2(
				author$project$View$Project$postLinkWrap,
				project.aboutLink,
				author$project$View$Project$iconWrapper(
					author$project$Icon$view(lattyware$elm_fontawesome$FontAwesome$Solid$info))),
				A2(
				author$project$View$Project$linkWrap,
				project.link,
				author$project$View$Project$iconWrapper(
					author$project$Icon$view(lattyware$elm_fontawesome$FontAwesome$Solid$link)))
			]));
};
var mdgriffith$elm_ui$Internal$Model$InFront = {$: 'InFront'};
var mdgriffith$elm_ui$Element$inFront = function (element) {
	return A2(mdgriffith$elm_ui$Internal$Model$Nearby, mdgriffith$elm_ui$Internal$Model$InFront, element);
};
var mdgriffith$elm_ui$Internal$Flag$transparency = mdgriffith$elm_ui$Internal$Flag$flag(0);
var mdgriffith$elm_ui$Internal$Model$Transparency = F2(
	function (a, b) {
		return {$: 'Transparency', a: a, b: b};
	});
var mdgriffith$elm_ui$Element$transparent = function (on) {
	return on ? A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$transparency,
		A2(mdgriffith$elm_ui$Internal$Model$Transparency, 'transparent', 1.0)) : A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$transparency,
		A2(mdgriffith$elm_ui$Internal$Model$Transparency, 'visible', 0.0));
};
var mdgriffith$elm_ui$Internal$Flag$bgColor = mdgriffith$elm_ui$Internal$Flag$flag(8);
var mdgriffith$elm_ui$Element$Background$color = function (clr) {
	return A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$bgColor,
		A3(
			mdgriffith$elm_ui$Internal$Model$Colored,
			'bg-' + mdgriffith$elm_ui$Internal$Model$formatColorClass(clr),
			'background-color',
			clr));
};
var author$project$View$Project$textBox = function (project) {
	return A2(
		mdgriffith$elm_ui$Element$column,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$Font$color(author$project$Colour$white),
				mdgriffith$elm_ui$Element$spacing(15),
				mdgriffith$elm_ui$Element$padding(40),
				mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill),
				mdgriffith$elm_ui$Element$Background$color(author$project$Colour$shaded),
				mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$fill),
				mdgriffith$elm_ui$Element$transparent(true),
				mdgriffith$elm_ui$Element$mouseOver(
				_List_fromArray(
					[
						mdgriffith$elm_ui$Element$transparent(false)
					])),
				mdgriffith$elm_ui$Element$inFront(
				author$project$View$Project$iconRow(project))
			]),
		_List_fromArray(
			[
				author$project$View$Project$header(project),
				author$project$View$Project$description(project)
			]));
};
var author$project$View$Project$view = function (project) {
	return A2(
		mdgriffith$elm_ui$Element$el,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$inFront(
				author$project$View$Project$textBox(project)),
				mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill)
			]),
		A2(
			mdgriffith$elm_ui$Element$image,
			_List_fromArray(
				[
					mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill)
				]),
			{description: 'project image for ' + project.name, src: project.imgLink}));
};
var author$project$View$Projects$projectList = _List_fromArray(
	[
		{aboutLink: 'https://joshuaji.com/src/post/ptable.emu', blurb: 'A colour-coded periodic table app with a molar mass calculator.', githubLink: 'https://github.com/joshuanianji/Compsci-IA', imgLink: 'src/img/ptable_ss.png', link: 'https://joshuaji.com/projects/ptable', name: 'Periodic Table', year: 2019},
		{aboutLink: 'https://joshuaji.com/src/post/factFinder.emu', blurb: 'An application that parses and displays information from 5 text files.', githubLink: 'https://github.com/joshuanianji/Country-Fact-Finder', imgLink: 'src/img/country_fact_finder.png', link: 'https://joshuaji.com/projects/fact-finder', name: 'Country Fact Finder', year: 2019},
		{aboutLink: 'https://joshuaji.com/src/post/factFinder.emu', blurb: 'An application that ranks words based on usage from a string input or a text file.', githubLink: 'https://github.com/joshuanianji/Wordrank', imgLink: 'src/img/word_rank_ss.png', link: 'https://joshuaji.com/projects/word-rank', name: 'WordRank', year: 2019},
		{aboutLink: 'https://joshuaji.com/src/post/cryptography.emu', blurb: 'An app that deals with Caesar and Viginere cyphers, and can calculate hashes.', githubLink: 'https://github.com/joshuanianji/Cryptography', imgLink: 'src/img/cryptography.png', link: 'https://joshuaji.com/projects/cryptography', name: 'Cryptography', year: 2018}
	]);
var author$project$View$Projects$toPairs = function (list) {
	if (!list.b) {
		return _List_Nil;
	} else {
		if (!list.b.b) {
			var a = list.a;
			return _List_fromArray(
				[
					_Utils_Tuple2(a, elm$core$Maybe$Nothing)
				]);
		} else {
			var a = list.a;
			var _n1 = list.b;
			var b = _n1.a;
			var c = _n1.b;
			return A2(
				elm$core$List$cons,
				_Utils_Tuple2(
					a,
					elm$core$Maybe$Just(b)),
				author$project$View$Projects$toPairs(c));
		}
	}
};
var mdgriffith$elm_ui$Element$none = mdgriffith$elm_ui$Internal$Model$Empty;
var author$project$View$Projects$projectView = function (model) {
	var projectsPerRow = function () {
		var _n1 = model.device._class;
		switch (_n1.$) {
			case 'BigDesktop':
				return 2;
			case 'Desktop':
				return 2;
			case 'Tablet':
				var _n2 = model.device.orientation;
				if (_n2.$ === 'Portrait') {
					return 1;
				} else {
					return 2;
				}
			default:
				return 1;
		}
	}();
	return (projectsPerRow === 1) ? A2(
		mdgriffith$elm_ui$Element$column,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill)
			]),
		A2(elm$core$List$map, author$project$View$Project$view, author$project$View$Projects$projectList)) : A2(
		mdgriffith$elm_ui$Element$column,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill),
				mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$shrink)
			]),
		A2(
			elm$core$List$map,
			function (_n0) {
				var p = _n0.a;
				var maybeP = _n0.b;
				return A2(
					mdgriffith$elm_ui$Element$row,
					_List_fromArray(
						[
							mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill)
						]),
					_List_fromArray(
						[
							author$project$View$Project$view(p),
							A2(
							mdgriffith$elm_ui$Element$el,
							_List_fromArray(
								[
									mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill)
								]),
							A2(
								elm$core$Maybe$withDefault,
								mdgriffith$elm_ui$Element$none,
								A2(elm$core$Maybe$map, author$project$View$Project$view, maybeP)))
						]));
			},
			author$project$View$Projects$toPairs(author$project$View$Projects$projectList)));
};
var mdgriffith$elm_ui$Element$paddingXY = F2(
	function (x, y) {
		return _Utils_eq(x, y) ? A2(
			mdgriffith$elm_ui$Internal$Model$StyleClass,
			mdgriffith$elm_ui$Internal$Flag$padding,
			A5(
				mdgriffith$elm_ui$Internal$Model$PaddingStyle,
				'p-' + elm$core$String$fromInt(x),
				x,
				x,
				x,
				x)) : A2(
			mdgriffith$elm_ui$Internal$Model$StyleClass,
			mdgriffith$elm_ui$Internal$Flag$padding,
			A5(
				mdgriffith$elm_ui$Internal$Model$PaddingStyle,
				'p-' + (elm$core$String$fromInt(x) + ('-' + elm$core$String$fromInt(y))),
				y,
				x,
				y,
				x));
	});
var author$project$View$Projects$text = A2(
	mdgriffith$elm_ui$Element$paragraph,
	_List_fromArray(
		[
			A2(mdgriffith$elm_ui$Element$paddingXY, 0, 30)
		]),
	_List_fromArray(
		[
			mdgriffith$elm_ui$Element$text('Welcome to my projects page! Here are my projects from the past year, created in my Computer Science Class. Stay tuned as I add in more!')
		]));
var author$project$View$Projects$view = function (model) {
	var _n0 = function () {
		var _n1 = model.device._class;
		switch (_n1.$) {
			case 'BigDesktop':
				return _Utils_Tuple2(1, 4);
			case 'Desktop':
				return _Utils_Tuple2(1, 6);
			case 'Tablet':
				var _n2 = model.device.orientation;
				if (_n2.$ === 'Portrait') {
					return _Utils_Tuple2(1, 8);
				} else {
					return _Utils_Tuple2(0, 1);
				}
			default:
				return _Utils_Tuple2(0, 1);
		}
	}();
	var fillPadding = _n0.a;
	var fillContent = _n0.b;
	var addPadding = function (content) {
		return A2(
			mdgriffith$elm_ui$Element$row,
			_List_fromArray(
				[
					mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill)
				]),
			_List_fromArray(
				[
					A2(
					mdgriffith$elm_ui$Element$el,
					_List_fromArray(
						[
							mdgriffith$elm_ui$Element$width(
							mdgriffith$elm_ui$Element$fillPortion(fillPadding))
						]),
					mdgriffith$elm_ui$Element$none),
					A2(
					mdgriffith$elm_ui$Element$el,
					_List_fromArray(
						[
							mdgriffith$elm_ui$Element$width(
							mdgriffith$elm_ui$Element$fillPortion(fillContent))
						]),
					content),
					A2(
					mdgriffith$elm_ui$Element$el,
					_List_fromArray(
						[
							mdgriffith$elm_ui$Element$width(
							mdgriffith$elm_ui$Element$fillPortion(fillPadding))
						]),
					mdgriffith$elm_ui$Element$none)
				]));
	};
	return addPadding(
		A2(
			mdgriffith$elm_ui$Element$column,
			_List_fromArray(
				[
					mdgriffith$elm_ui$Element$spacing(50)
				]),
			_List_fromArray(
				[
					author$project$View$Projects$text,
					author$project$View$Projects$projectView(model)
				])));
};
var author$project$View$Resume$view = function (model) {
	return mdgriffith$elm_ui$Element$text('Lol nothing\'s here yet');
};
var author$project$View$content = function (model) {
	var _n0 = model.router.route;
	switch (_n0.$) {
		case 'Home':
			return author$project$View$Home$view(model);
		case 'Resume':
			return author$project$View$Resume$view(model);
		case 'Projects':
			return author$project$View$Projects$view(model);
		case 'Post':
			var fileName = _n0.a;
			return author$project$View$Post$view(model);
		default:
			return author$project$View$NotFound$view;
	}
};
var author$project$Text$title = mdgriffith$elm_ui$Element$Font$family(
	_List_fromArray(
		[
			mdgriffith$elm_ui$Element$Font$external(
			{name: 'Antic Didone', url: 'https://fonts.googleapis.com/css?family=Antic+Didone'}),
			mdgriffith$elm_ui$Element$Font$sansSerif
		]));
var author$project$View$title = function (model) {
	var _n0 = function () {
		var _n1 = model.device._class;
		switch (_n1.$) {
			case 'BigDesktop':
				return _Utils_Tuple2(70, 0);
			case 'Desktop':
				return _Utils_Tuple2(50, 0);
			case 'Tablet':
				var _n2 = model.device.orientation;
				if (_n2.$ === 'Portrait') {
					return _Utils_Tuple2(80, 30);
				} else {
					return _Utils_Tuple2(50, 0);
				}
			default:
				return _Utils_Tuple2(80, 30);
		}
	}();
	var fontSize = _n0.a;
	var padding = _n0.b;
	return A2(
		mdgriffith$elm_ui$Element$el,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$Font$size(fontSize),
				mdgriffith$elm_ui$Element$centerX,
				author$project$Text$title
			]),
		mdgriffith$elm_ui$Element$text('Joshua Ji'));
};
var author$project$Colour$black = A3(mdgriffith$elm_ui$Element$rgb255, 0, 0, 0);
var mdgriffith$elm_ui$Internal$Model$BorderWidth = F5(
	function (a, b, c, d, e) {
		return {$: 'BorderWidth', a: a, b: b, c: c, d: d, e: e};
	});
var mdgriffith$elm_ui$Element$Border$width = function (v) {
	return A2(
		mdgriffith$elm_ui$Internal$Model$StyleClass,
		mdgriffith$elm_ui$Internal$Flag$borderWidth,
		A5(
			mdgriffith$elm_ui$Internal$Model$BorderWidth,
			'b-' + elm$core$String$fromInt(v),
			v,
			v,
			v,
			v));
};
var author$project$View$Navbar$navbarElementAttributes = F2(
	function (model, route) {
		var fontSize = function () {
			var _n0 = model.device._class;
			switch (_n0.$) {
				case 'BigDesktop':
					return 25;
				case 'Desktop':
					return 20;
				case 'Tablet':
					var _n1 = model.device.orientation;
					if (_n1.$ === 'Portrait') {
						return 30;
					} else {
						return 25;
					}
				default:
					return 30;
			}
		}();
		var basicNavBarAttributes = _List_fromArray(
			[
				mdgriffith$elm_ui$Element$padding(15),
				mdgriffith$elm_ui$Element$Border$width(0),
				mdgriffith$elm_ui$Element$Font$size(fontSize)
			]);
		return _Utils_eq(model.router.route, route) ? A2(
			elm$core$List$cons,
			mdgriffith$elm_ui$Element$Font$color(author$project$Colour$black),
			basicNavBarAttributes) : A2(
			elm$core$List$cons,
			mdgriffith$elm_ui$Element$Font$color(author$project$Colour$gray),
			basicNavBarAttributes);
	});
var elm$json$Json$Encode$bool = _Json_wrap;
var elm$html$Html$Attributes$boolProperty = F2(
	function (key, bool) {
		return A2(
			_VirtualDom_property,
			key,
			elm$json$Json$Encode$bool(bool));
	});
var elm$html$Html$Attributes$disabled = elm$html$Html$Attributes$boolProperty('disabled');
var elm$html$Html$Attributes$tabindex = function (n) {
	return A2(
		_VirtualDom_attribute,
		'tabIndex',
		elm$core$String$fromInt(n));
};
var mdgriffith$elm_ui$Element$Input$hasFocusStyle = function (attr) {
	if (((attr.$ === 'StyleClass') && (attr.b.$ === 'PseudoSelector')) && (attr.b.a.$ === 'Focus')) {
		var _n1 = attr.b;
		var _n2 = _n1.a;
		return true;
	} else {
		return false;
	}
};
var mdgriffith$elm_ui$Element$Input$focusDefault = function (attrs) {
	return A2(elm$core$List$any, mdgriffith$elm_ui$Element$Input$hasFocusStyle, attrs) ? mdgriffith$elm_ui$Internal$Model$NoAttribute : mdgriffith$elm_ui$Internal$Model$htmlClass('focusable');
};
var mdgriffith$elm_ui$Element$Input$enter = 'Enter';
var elm$virtual_dom$VirtualDom$MayPreventDefault = function (a) {
	return {$: 'MayPreventDefault', a: a};
};
var elm$html$Html$Events$preventDefaultOn = F2(
	function (event, decoder) {
		return A2(
			elm$virtual_dom$VirtualDom$on,
			event,
			elm$virtual_dom$VirtualDom$MayPreventDefault(decoder));
	});
var elm$json$Json$Decode$andThen = _Json_andThen;
var elm$json$Json$Decode$fail = _Json_fail;
var elm$json$Json$Decode$string = _Json_decodeString;
var mdgriffith$elm_ui$Element$Input$onKey = F2(
	function (desiredCode, msg) {
		var decode = function (code) {
			return _Utils_eq(code, desiredCode) ? elm$json$Json$Decode$succeed(msg) : elm$json$Json$Decode$fail('Not the enter key');
		};
		var isKey = A2(
			elm$json$Json$Decode$andThen,
			decode,
			A2(elm$json$Json$Decode$field, 'key', elm$json$Json$Decode$string));
		return mdgriffith$elm_ui$Internal$Model$Attr(
			A2(
				elm$html$Html$Events$preventDefaultOn,
				'keyup',
				A2(
					elm$json$Json$Decode$map,
					function (fired) {
						return _Utils_Tuple2(fired, true);
					},
					isKey)));
	});
var mdgriffith$elm_ui$Element$Input$onEnter = function (msg) {
	return A2(mdgriffith$elm_ui$Element$Input$onKey, mdgriffith$elm_ui$Element$Input$enter, msg);
};
var mdgriffith$elm_ui$Internal$Model$Button = {$: 'Button'};
var mdgriffith$elm_ui$Element$Input$button = F2(
	function (attrs, _n0) {
		var onPress = _n0.onPress;
		var label = _n0.label;
		return A4(
			mdgriffith$elm_ui$Internal$Model$element,
			mdgriffith$elm_ui$Internal$Model$asEl,
			mdgriffith$elm_ui$Internal$Model$div,
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$shrink),
				A2(
					elm$core$List$cons,
					mdgriffith$elm_ui$Element$height(mdgriffith$elm_ui$Element$shrink),
					A2(
						elm$core$List$cons,
						mdgriffith$elm_ui$Internal$Model$htmlClass(mdgriffith$elm_ui$Internal$Style$classes.contentCenterX + (' ' + (mdgriffith$elm_ui$Internal$Style$classes.contentCenterY + (' ' + (mdgriffith$elm_ui$Internal$Style$classes.seButton + (' ' + mdgriffith$elm_ui$Internal$Style$classes.noTextSelection)))))),
						A2(
							elm$core$List$cons,
							mdgriffith$elm_ui$Element$pointer,
							A2(
								elm$core$List$cons,
								mdgriffith$elm_ui$Element$Input$focusDefault(attrs),
								A2(
									elm$core$List$cons,
									mdgriffith$elm_ui$Internal$Model$Describe(mdgriffith$elm_ui$Internal$Model$Button),
									A2(
										elm$core$List$cons,
										mdgriffith$elm_ui$Internal$Model$Attr(
											elm$html$Html$Attributes$tabindex(0)),
										function () {
											if (onPress.$ === 'Nothing') {
												return A2(
													elm$core$List$cons,
													mdgriffith$elm_ui$Internal$Model$Attr(
														elm$html$Html$Attributes$disabled(true)),
													attrs);
											} else {
												var msg = onPress.a;
												return A2(
													elm$core$List$cons,
													mdgriffith$elm_ui$Element$Events$onClick(msg),
													A2(
														elm$core$List$cons,
														mdgriffith$elm_ui$Element$Input$onEnter(msg),
														attrs));
											}
										}()))))))),
			mdgriffith$elm_ui$Internal$Model$Unkeyed(
				_List_fromArray(
					[label])));
	});
var author$project$View$Navbar$navbarFramework = F2(
	function (model, _n0) {
		var name = _n0.a;
		var route = _n0.b;
		return A2(
			mdgriffith$elm_ui$Element$Input$button,
			A2(author$project$View$Navbar$navbarElementAttributes, model, route),
			{
				label: A2(
					mdgriffith$elm_ui$Element$el,
					_List_fromArray(
						[mdgriffith$elm_ui$Element$centerX]),
					mdgriffith$elm_ui$Element$text(name)),
				onPress: elm$core$Maybe$Just(
					author$project$Model$NavigateTo(route))
			});
	});
var author$project$View$Navbar$navbarMapList = _List_fromArray(
	[
		_Utils_Tuple2('Home', author$project$Routes$Home),
		_Utils_Tuple2('Resume', author$project$Routes$Resume),
		_Utils_Tuple2('Projects', author$project$Routes$Projects)
	]);
var author$project$View$Navbar$navbar = function (model) {
	return A2(
		mdgriffith$elm_ui$Element$row,
		_List_fromArray(
			[mdgriffith$elm_ui$Element$centerX]),
		A2(
			elm$core$List$map,
			author$project$View$Navbar$navbarFramework(model),
			author$project$View$Navbar$navbarMapList));
};
var elm$html$Html$node = elm$virtual_dom$VirtualDom$node;
var lattyware$elm_fontawesome$FontAwesome$Styles$css = A3(
	elm$html$Html$node,
	'style',
	_List_Nil,
	_List_fromArray(
		[
			elm$html$Html$text('svg:not(:root).svg-inline--fa {  overflow: visible;}.svg-inline--fa {  display: inline-block;  font-size: inherit;  height: 1em;  overflow: visible;  vertical-align: -0.125em;}.svg-inline--fa.fa-lg {  vertical-align: -0.225em;}.svg-inline--fa.fa-w-1 {  width: 0.0625em;}.svg-inline--fa.fa-w-2 {  width: 0.125em;}.svg-inline--fa.fa-w-3 {  width: 0.1875em;}.svg-inline--fa.fa-w-4 {  width: 0.25em;}.svg-inline--fa.fa-w-5 {  width: 0.3125em;}.svg-inline--fa.fa-w-6 {  width: 0.375em;}.svg-inline--fa.fa-w-7 {  width: 0.4375em;}.svg-inline--fa.fa-w-8 {  width: 0.5em;}.svg-inline--fa.fa-w-9 {  width: 0.5625em;}.svg-inline--fa.fa-w-10 {  width: 0.625em;}.svg-inline--fa.fa-w-11 {  width: 0.6875em;}.svg-inline--fa.fa-w-12 {  width: 0.75em;}.svg-inline--fa.fa-w-13 {  width: 0.8125em;}.svg-inline--fa.fa-w-14 {  width: 0.875em;}.svg-inline--fa.fa-w-15 {  width: 0.9375em;}.svg-inline--fa.fa-w-16 {  width: 1em;}.svg-inline--fa.fa-w-17 {  width: 1.0625em;}.svg-inline--fa.fa-w-18 {  width: 1.125em;}.svg-inline--fa.fa-w-19 {  width: 1.1875em;}.svg-inline--fa.fa-w-20 {  width: 1.25em;}.svg-inline--fa.fa-pull-left {  margin-right: 0.3em;  width: auto;}.svg-inline--fa.fa-pull-right {  margin-left: 0.3em;  width: auto;}.svg-inline--fa.fa-border {  height: 1.5em;}.svg-inline--fa.fa-li {  width: 2em;}.svg-inline--fa.fa-fw {  width: 1.25em;}.fa-layers svg.svg-inline--fa {  bottom: 0;  left: 0;  margin: auto;  position: absolute;  right: 0;  top: 0;}.fa-layers {  display: inline-block;  height: 1em;  position: relative;  text-align: center;  vertical-align: -0.125em;  width: 1em;}.fa-layers svg.svg-inline--fa {  -webkit-transform-origin: center center;          transform-origin: center center;}.fa-layers-counter, .fa-layers-text {  display: inline-block;  position: absolute;  text-align: center;}.fa-layers-text {  left: 50%;  top: 50%;  -webkit-transform: translate(-50%, -50%);          transform: translate(-50%, -50%);  -webkit-transform-origin: center center;          transform-origin: center center;}.fa-layers-counter {  background-color: #ff253a;  border-radius: 1em;  -webkit-box-sizing: border-box;          box-sizing: border-box;  color: #fff;  height: 1.5em;  line-height: 1;  max-width: 5em;  min-width: 1.5em;  overflow: hidden;  padding: 0.25em;  right: 0;  text-overflow: ellipsis;  top: 0;  -webkit-transform: scale(0.25);          transform: scale(0.25);  -webkit-transform-origin: top right;          transform-origin: top right;}.fa-layers-bottom-right {  bottom: 0;  right: 0;  top: auto;  -webkit-transform: scale(0.25);          transform: scale(0.25);  -webkit-transform-origin: bottom right;          transform-origin: bottom right;}.fa-layers-bottom-left {  bottom: 0;  left: 0;  right: auto;  top: auto;  -webkit-transform: scale(0.25);          transform: scale(0.25);  -webkit-transform-origin: bottom left;          transform-origin: bottom left;}.fa-layers-top-right {  right: 0;  top: 0;  -webkit-transform: scale(0.25);          transform: scale(0.25);  -webkit-transform-origin: top right;          transform-origin: top right;}.fa-layers-top-left {  left: 0;  right: auto;  top: 0;  -webkit-transform: scale(0.25);          transform: scale(0.25);  -webkit-transform-origin: top left;          transform-origin: top left;}.fa-lg {  font-size: 1.3333333333em;  line-height: 0.75em;  vertical-align: -0.0667em;}.fa-xs {  font-size: 0.75em;}.fa-sm {  font-size: 0.875em;}.fa-1x {  font-size: 1em;}.fa-2x {  font-size: 2em;}.fa-3x {  font-size: 3em;}.fa-4x {  font-size: 4em;}.fa-5x {  font-size: 5em;}.fa-6x {  font-size: 6em;}.fa-7x {  font-size: 7em;}.fa-8x {  font-size: 8em;}.fa-9x {  font-size: 9em;}.fa-10x {  font-size: 10em;}.fa-fw {  text-align: center;  width: 1.25em;}.fa-ul {  list-style-type: none;  margin-left: 2.5em;  padding-left: 0;}.fa-ul > li {  position: relative;}.fa-li {  left: -2em;  position: absolute;  text-align: center;  width: 2em;  line-height: inherit;}.fa-border {  border: solid 0.08em #eee;  border-radius: 0.1em;  padding: 0.2em 0.25em 0.15em;}.fa-pull-left {  float: left;}.fa-pull-right {  float: right;}.fa.fa-pull-left,.fas.fa-pull-left,.far.fa-pull-left,.fal.fa-pull-left,.fab.fa-pull-left {  margin-right: 0.3em;}.fa.fa-pull-right,.fas.fa-pull-right,.far.fa-pull-right,.fal.fa-pull-right,.fab.fa-pull-right {  margin-left: 0.3em;}.fa-spin {  -webkit-animation: fa-spin 2s infinite linear;          animation: fa-spin 2s infinite linear;}.fa-pulse {  -webkit-animation: fa-spin 1s infinite steps(8);          animation: fa-spin 1s infinite steps(8);}@-webkit-keyframes fa-spin {  0% {    -webkit-transform: rotate(0deg);            transform: rotate(0deg);  }  100% {    -webkit-transform: rotate(360deg);            transform: rotate(360deg);  }}@keyframes fa-spin {  0% {    -webkit-transform: rotate(0deg);            transform: rotate(0deg);  }  100% {    -webkit-transform: rotate(360deg);            transform: rotate(360deg);  }}.fa-rotate-90 {  -ms-filter: \"progid:DXImageTransform.Microsoft.BasicImage(rotation=1)\";  -webkit-transform: rotate(90deg);          transform: rotate(90deg);}.fa-rotate-180 {  -ms-filter: \"progid:DXImageTransform.Microsoft.BasicImage(rotation=2)\";  -webkit-transform: rotate(180deg);          transform: rotate(180deg);}.fa-rotate-270 {  -ms-filter: \"progid:DXImageTransform.Microsoft.BasicImage(rotation=3)\";  -webkit-transform: rotate(270deg);          transform: rotate(270deg);}.fa-flip-horizontal {  -ms-filter: \"progid:DXImageTransform.Microsoft.BasicImage(rotation=0, mirror=1)\";  -webkit-transform: scale(-1, 1);          transform: scale(-1, 1);}.fa-flip-vertical {  -ms-filter: \"progid:DXImageTransform.Microsoft.BasicImage(rotation=2, mirror=1)\";  -webkit-transform: scale(1, -1);          transform: scale(1, -1);}.fa-flip-both, .fa-flip-horizontal.fa-flip-vertical {  -ms-filter: \"progid:DXImageTransform.Microsoft.BasicImage(rotation=2, mirror=1)\";  -webkit-transform: scale(-1, -1);          transform: scale(-1, -1);}:root .fa-rotate-90,:root .fa-rotate-180,:root .fa-rotate-270,:root .fa-flip-horizontal,:root .fa-flip-vertical,:root .fa-flip-both {  -webkit-filter: none;          filter: none;}.fa-stack {  display: inline-block;  height: 2em;  position: relative;  width: 2.5em;}.fa-stack-1x,.fa-stack-2x {  bottom: 0;  left: 0;  margin: auto;  position: absolute;  right: 0;  top: 0;}.svg-inline--fa.fa-stack-1x {  height: 1em;  width: 1.25em;}.svg-inline--fa.fa-stack-2x {  height: 2em;  width: 2.5em;}.fa-inverse {  color: #fff;}.sr-only {  border: 0;  clip: rect(0, 0, 0, 0);  height: 1px;  margin: -1px;  overflow: hidden;  padding: 0;  position: absolute;  width: 1px;}.sr-only-focusable:active, .sr-only-focusable:focus {  clip: auto;  height: auto;  margin: 0;  overflow: visible;  position: static;  width: auto;}')
		]));
var author$project$View$page = function (model) {
	return A2(
		mdgriffith$elm_ui$Element$column,
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$width(mdgriffith$elm_ui$Element$fill),
				mdgriffith$elm_ui$Element$padding(40),
				mdgriffith$elm_ui$Element$spacing(20),
				author$project$Text$body
			]),
		_List_fromArray(
			[
				mdgriffith$elm_ui$Element$html(lattyware$elm_fontawesome$FontAwesome$Styles$css),
				author$project$View$title(model),
				author$project$View$Navbar$navbar(model),
				author$project$View$content(model)
			]));
};
var mdgriffith$elm_ui$Internal$Model$FocusStyleOption = function (a) {
	return {$: 'FocusStyleOption', a: a};
};
var mdgriffith$elm_ui$Element$focusStyle = mdgriffith$elm_ui$Internal$Model$FocusStyleOption;
var mdgriffith$elm_ui$Internal$Model$OnlyDynamic = F2(
	function (a, b) {
		return {$: 'OnlyDynamic', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Model$StaticRootAndDynamic = F2(
	function (a, b) {
		return {$: 'StaticRootAndDynamic', a: a, b: b};
	});
var mdgriffith$elm_ui$Internal$Model$AllowHover = {$: 'AllowHover'};
var mdgriffith$elm_ui$Internal$Model$Layout = {$: 'Layout'};
var mdgriffith$elm_ui$Internal$Model$focusDefaultStyle = {
	backgroundColor: elm$core$Maybe$Nothing,
	borderColor: elm$core$Maybe$Nothing,
	shadow: elm$core$Maybe$Just(
		{
			blur: 3,
			color: A4(mdgriffith$elm_ui$Internal$Model$Rgba, 155 / 255, 203 / 255, 1, 1),
			offset: _Utils_Tuple2(0, 0),
			size: 3
		})
};
var mdgriffith$elm_ui$Internal$Model$optionsToRecord = function (options) {
	var combine = F2(
		function (opt, record) {
			switch (opt.$) {
				case 'HoverOption':
					var hoverable = opt.a;
					var _n4 = record.hover;
					if (_n4.$ === 'Nothing') {
						return _Utils_update(
							record,
							{
								hover: elm$core$Maybe$Just(hoverable)
							});
					} else {
						return record;
					}
				case 'FocusStyleOption':
					var focusStyle = opt.a;
					var _n5 = record.focus;
					if (_n5.$ === 'Nothing') {
						return _Utils_update(
							record,
							{
								focus: elm$core$Maybe$Just(focusStyle)
							});
					} else {
						return record;
					}
				default:
					var renderMode = opt.a;
					var _n6 = record.mode;
					if (_n6.$ === 'Nothing') {
						return _Utils_update(
							record,
							{
								mode: elm$core$Maybe$Just(renderMode)
							});
					} else {
						return record;
					}
			}
		});
	var andFinally = function (record) {
		return {
			focus: function () {
				var _n0 = record.focus;
				if (_n0.$ === 'Nothing') {
					return mdgriffith$elm_ui$Internal$Model$focusDefaultStyle;
				} else {
					var focusable = _n0.a;
					return focusable;
				}
			}(),
			hover: function () {
				var _n1 = record.hover;
				if (_n1.$ === 'Nothing') {
					return mdgriffith$elm_ui$Internal$Model$AllowHover;
				} else {
					var hoverable = _n1.a;
					return hoverable;
				}
			}(),
			mode: function () {
				var _n2 = record.mode;
				if (_n2.$ === 'Nothing') {
					return mdgriffith$elm_ui$Internal$Model$Layout;
				} else {
					var actualMode = _n2.a;
					return actualMode;
				}
			}()
		};
	};
	return andFinally(
		A3(
			elm$core$List$foldr,
			combine,
			{focus: elm$core$Maybe$Nothing, hover: elm$core$Maybe$Nothing, mode: elm$core$Maybe$Nothing},
			options));
};
var mdgriffith$elm_ui$Internal$Model$toHtml = F2(
	function (mode, el) {
		switch (el.$) {
			case 'Unstyled':
				var html = el.a;
				return html(mdgriffith$elm_ui$Internal$Model$asEl);
			case 'Styled':
				var styles = el.a.styles;
				var html = el.a.html;
				return A2(
					html,
					mode(styles),
					mdgriffith$elm_ui$Internal$Model$asEl);
			case 'Text':
				var text = el.a;
				return mdgriffith$elm_ui$Internal$Model$textElement(text);
			default:
				return mdgriffith$elm_ui$Internal$Model$textElement('');
		}
	});
var mdgriffith$elm_ui$Internal$Model$renderRoot = F3(
	function (optionList, attributes, child) {
		var options = mdgriffith$elm_ui$Internal$Model$optionsToRecord(optionList);
		var embedStyle = function () {
			var _n0 = options.mode;
			if (_n0.$ === 'NoStaticStyleSheet') {
				return mdgriffith$elm_ui$Internal$Model$OnlyDynamic(options);
			} else {
				return mdgriffith$elm_ui$Internal$Model$StaticRootAndDynamic(options);
			}
		}();
		return A2(
			mdgriffith$elm_ui$Internal$Model$toHtml,
			embedStyle,
			A4(
				mdgriffith$elm_ui$Internal$Model$element,
				mdgriffith$elm_ui$Internal$Model$asEl,
				mdgriffith$elm_ui$Internal$Model$div,
				attributes,
				mdgriffith$elm_ui$Internal$Model$Unkeyed(
					_List_fromArray(
						[child]))));
	});
var mdgriffith$elm_ui$Internal$Model$Typeface = function (a) {
	return {$: 'Typeface', a: a};
};
var mdgriffith$elm_ui$Internal$Model$rootStyle = function () {
	var families = _List_fromArray(
		[
			mdgriffith$elm_ui$Internal$Model$Typeface('Open Sans'),
			mdgriffith$elm_ui$Internal$Model$Typeface('Helvetica'),
			mdgriffith$elm_ui$Internal$Model$Typeface('Verdana'),
			mdgriffith$elm_ui$Internal$Model$SansSerif
		]);
	return _List_fromArray(
		[
			A2(
			mdgriffith$elm_ui$Internal$Model$StyleClass,
			mdgriffith$elm_ui$Internal$Flag$bgColor,
			A3(
				mdgriffith$elm_ui$Internal$Model$Colored,
				'bg-color-' + mdgriffith$elm_ui$Internal$Model$formatColorClass(
					A4(mdgriffith$elm_ui$Internal$Model$Rgba, 1, 1, 1, 0)),
				'background-color',
				A4(mdgriffith$elm_ui$Internal$Model$Rgba, 1, 1, 1, 0))),
			A2(
			mdgriffith$elm_ui$Internal$Model$StyleClass,
			mdgriffith$elm_ui$Internal$Flag$fontColor,
			A3(
				mdgriffith$elm_ui$Internal$Model$Colored,
				'font-color-' + mdgriffith$elm_ui$Internal$Model$formatColorClass(
					A4(mdgriffith$elm_ui$Internal$Model$Rgba, 0, 0, 0, 1)),
				'color',
				A4(mdgriffith$elm_ui$Internal$Model$Rgba, 0, 0, 0, 1))),
			A2(
			mdgriffith$elm_ui$Internal$Model$StyleClass,
			mdgriffith$elm_ui$Internal$Flag$fontSize,
			mdgriffith$elm_ui$Internal$Model$FontSize(20)),
			A2(
			mdgriffith$elm_ui$Internal$Model$StyleClass,
			mdgriffith$elm_ui$Internal$Flag$fontFamily,
			A2(
				mdgriffith$elm_ui$Internal$Model$FontFamily,
				A3(elm$core$List$foldl, mdgriffith$elm_ui$Internal$Model$renderFontClassName, 'font-', families),
				families))
		]);
}();
var mdgriffith$elm_ui$Element$layoutWith = F3(
	function (_n0, attrs, child) {
		var options = _n0.options;
		return A3(
			mdgriffith$elm_ui$Internal$Model$renderRoot,
			options,
			A2(
				elm$core$List$cons,
				mdgriffith$elm_ui$Internal$Model$htmlClass(
					A2(
						elm$core$String$join,
						' ',
						_List_fromArray(
							[mdgriffith$elm_ui$Internal$Style$classes.root, mdgriffith$elm_ui$Internal$Style$classes.any, mdgriffith$elm_ui$Internal$Style$classes.single]))),
				_Utils_ap(mdgriffith$elm_ui$Internal$Model$rootStyle, attrs)),
			child);
	});
var author$project$View$view = function (model) {
	return A3(
		mdgriffith$elm_ui$Element$layoutWith,
		{
			options: _List_fromArray(
				[
					mdgriffith$elm_ui$Element$focusStyle(author$project$View$focusStyle)
				])
		},
		_List_Nil,
		author$project$View$page(model));
};
var author$project$View$viewApplication = function (model) {
	return {
		body: _List_fromArray(
			[
				author$project$View$view(model)
			]),
		title: author$project$View$tabBarTitle(model)
	};
};
var elm$browser$Browser$application = _Browser_application;
var author$project$Main$main = elm$browser$Browser$application(
	{init: author$project$Model$init, onUrlChange: author$project$Model$UrlChange, onUrlRequest: author$project$Model$UrlRequest, subscriptions: author$project$Subscriptions$subscriptions, update: author$project$Update$update, view: author$project$View$viewApplication});
_Platform_export({'Main':{'init':author$project$Main$main(
	A2(
		elm$json$Json$Decode$andThen,
		function (width) {
			return A2(
				elm$json$Json$Decode$andThen,
				function (height) {
					return elm$json$Json$Decode$succeed(
						{height: height, width: width});
				},
				A2(elm$json$Json$Decode$field, 'height', elm$json$Json$Decode$int));
		},
		A2(elm$json$Json$Decode$field, 'width', elm$json$Json$Decode$int)))(0)}});}(this));