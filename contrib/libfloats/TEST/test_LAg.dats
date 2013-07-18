(* ****** ****** ****** ****** ****** ****** ****** ****** *)
//
// Some test for Linear Algebra vector and matrix operations
//
(* ****** ****** ****** ****** ****** ****** ****** ****** *)

#include
"share/atspre_staload_tmpdef.hats"
//
staload _ = "prelude/DATS/gnumber.dats"
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "libats/SATS/gvector.sats"
staload "libats/SATS/gmatrix.sats"

(* ****** ****** *)

staload "libfloats/SATS/lavector.sats"
staload "libfloats/SATS/lamatrix.sats"

(* ****** ****** *)

#define t 't'

(* ****** ****** *)

infixr ^
macdef ^ (M, t) = LAgmat_transp (,(M))

(* ****** ****** *)

// TODO:
// Vector ops
// Test copy
// Test incref/decref -- what are these?

val () = 
{
//
typedef T = double
//
val out = stdout_ref
//
macdef
gint = gnumber_int<T>
//
val M = 3 and N = 5
//
local
implement
LAgmat_tabulate$fopr<T> (i, j) = $UN.cast{T}(i+j)
in
val A = LAgmat_tabulate<T> (MORDcol, M, N)
end
//
local
implement
LAgmat_tabulate$fopr<T> (i, j) = $UN.cast{T}(i-j)
in
val B = LAgmat_tabulate<T> (MORDcol, M, N)
end
//
val ApB = A + B
//
val At = A^t
val AAt = A*At
//
val (Af2, Al3) = LAgmat_split_1x2(A, 1)

(* ****** Print Tests ****** *)
//
val () = fprintln! (out, "A =")
val () = fprint (out, A)
val () = fprint_newline (out)
//
val () = fprintln! (out, "B =")
val () = fprint (out, B)
val () = fprint_newline (out)
//
val () = fprintln! (out, "A+B =")
val () = fprint (out, ApB)
val () = fprint_newline (out)
//
val () = fprintln! (out, "A*A' =")
val () = fprint (out, AAt)
val () = fprint_newline (out)
//
val () = fprintln! (out, "First two columns of A: ")
val () = fprint (out, Af2)
val () = fprint_newline (out)
//
val () = fprintln! (out, "Last three columns of A: ")
val () = fprint (out, Al3)
val () = fprint_newline (out)


} (* end of [val] *)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test_LAg.dats] *)
