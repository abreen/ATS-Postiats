(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(*                              Hongwei Xi                             *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS - Unleashing the Potential of Types!
** Copyright (C) 2002-2011 Hongwei Xi, Boston University
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by the
** Free Software Foundation; either version 2.1, or (at your option)  any
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

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: November, 2011 *)

(* ****** ****** *)
//
// HX-2012-12: ported to ATS/Postiats
//
(* ****** ****** *)
//
// License: LGPL 3.0 (available at http://www.gnu.org/licenses/lgpl.txt)
//
(* ****** ****** *)

#define ATS_STALOADFLAG 0 // no static loading at run-time

(* ****** ****** *)

absviewtype
heap_viewtype (a:viewt@ype+)
stadef heap = heap_viewtype

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)

fun{a:vt0p}
compare_elt_elt (x1: &a, x2: &a):<> int

(* ****** ****** *)

fun{} linheap_nil {a:vt0p} ():<> heap (a)

(* ****** ****** *)

fun linheap_is_nil {a:vt0p} (hp: !heap (a)):<> bool
fun linheap_isnot_nil {a:vt0p} (hp: !heap (a)):<> bool

(* ****** ****** *)

fun{a:vt0p}
linheap_size (hp: !heap a): size_t

(* ****** ****** *)

fun{a:vt0p}
linheap_insert (hp: &heap (a) >> _, x: a): void

(* ****** ****** *)

fun{a:t@ype}
linheap_getmin (
  hp: !heap (a), res: &a? >> opt (a, b)
) : #[b:bool] bool b // endfun

fun{a:vt0p}
linheap_getmin_ref (hp: !heap (a)): Ptr0

fun{a:vt0p}
linheap_getmin_opt (hp: !heap (a)): Option_vt (a)

(* ****** ****** *)

fun{a:vt0p}
linheap_delmin (
  hp: &heap (a) >> _, res: &a? >> opt (a, b)
) : #[b:bool] bool b // endfun

fun{a:vt0p}
linheap_delmin_opt (hp: &heap (a) >> _): Option_vt (a)

(* ****** ****** *)

fun{a:vt0p}
linheap_merge
  (hp1: heap (a), hp2: heap (a)): heap (a)
// end of [linheap_merge]

(* ****** ****** *)

fun{a:t0p}
linheap_free (hp: heap (a)):<!wrt> void

fun{a:vt0p}
linheap_freelin (hp: heap (a)):<!wrt> void

(* ****** ****** *)
//
// HX: a heap is freed only if it is empty
//
fun{a:vt0p}
linheap_free_vt
  (hp: !heap (a) >> opt (heap (a), b)) :<> #[b:bool] bool(b)
// end of [linheap_free_vt]

(* ****** ****** *)

(* end of [linheap_binomial.sats] *)
