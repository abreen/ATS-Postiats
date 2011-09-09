(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
// Start Time: September, 2011
//
(* ****** ****** *)

fun{a:t@ype}
g0float_add
  (x: g0float (a), y: g0float (a)):<> g0float (a)
overload + with g0float_add

fun{a:t@ype}
g0float_sub
  (x: g0float (a), y: g0float (a)):<> g0float (a)
overload - with g0float_sub

fun{a:t@ype}
g0float_mul
  (x: g0float (a), y: g0float (a)):<> g0float (a)
overload * with g0float_mul

fun{a:t@ype}
g0float_div
  (x: g0float (a), y: g0float (a)):<> g0float (a)
overload / with g0float_div

(* ****** ****** *)

(* end of [float.sats] *)
