(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start Time: November, 2013
//
(* ****** ****** *)
//
staload
ATSPRE = "./pats_atspre.dats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./pats_jsonize.sats"

(* ****** ****** *)

staload
LEX = "./pats_lexing.sats"
typedef token = $LEX.token

(* ****** ****** *)

staload "./pats_dynexp2.sats"

(* ****** ****** *)

macdef
jsonize_loc (x) = jsonize_location (,(x))

(* ****** ****** *)

extern
fun jsonize_i0nt (tok: token): jsonval

(* ****** ****** *)

extern
fun jsonize_d2var : jsonize_type (d2var)
extern
fun jsonize_d2cst : jsonize_type (d2cst)
extern
fun jsonize_p2at : jsonize_type (p2at)
extern
fun jsonize_d2exp : jsonize_type (d2exp)
extern
fun jsonize_d2explst : jsonize_type (d2explst)
extern
fun jsonize_d2ecl : jsonize_type (d2ecl)
(*
//
// HX-2013-11:
// it is declared in [pats_dynexp2.sats]
//
extern
fun jsonize_d2eclist : jsonize_type (d2eclist)
*)
  
(* ****** ****** *)

implement
jsonize_i0nt
  (tok) = let
//
val-$LEX.T_INTEGER
  (base, rep, sfx) = tok.token_node
//
in
  jsonval_string (rep)
end // end of [jsonize_i0nt]

(* ****** ****** *)

implement
jsonize_d2var
  (d2v) = let
//
val sym = jsonize_symbol (d2var_get_sym (d2v))
val stamp = jsonize_stamp (d2var_get_stamp (d2v))
//
in
//
jsonval_labval2 ("d2var_name", sym, "d2var_stamp", stamp)
//
end // end of [jsonize_d2var]

(* ****** ****** *)

implement
jsonize_d2cst
  (d2c) = let
//
val sym = jsonize_symbol (d2cst_get_sym (d2c))
val stamp = jsonize_stamp (d2cst_get_stamp (d2c))
//
in
//
jsonval_labval2 ("d2cst_name", sym, "d2cst_stamp", stamp)
//
end // end of [jsonize_d2cst]

(* ****** ****** *)

extern fun jsonize_v2aldec : jsonize_type (v2aldec)
extern fun jsonize_v2aldeclst : jsonize_type (v2aldeclst)

(* ****** ****** *)

local

fun aux0
(
  d2c: string
) : jsonval = let
  val d2c = jsonval_string (d2c)
  val arglst = jsonval_list (list_nil)
in
  jsonval_labval2 ("d2exp_name", d2c, "d2exp_arglst", arglst)
end // end of [aux0]

fun aux1
(
  d2c: string, arg: jsonval
) : jsonval = let
  val d2c = jsonval_string (d2c)
  val arglst = jsonval_sing (arg)
in
  jsonval_labval2 ("d2exp_name", d2c, "d2exp_arglst", arglst)
end // end of [aux1]

fun aux2
(
  d2c: string
, arg1: jsonval, arg2: jsonval
) : jsonval = let
  val d2c = jsonval_string (d2c)
  val arglst = jsonval_pair (arg1, arg2)
in
  jsonval_labval2 ("d2exp_name", d2c, "d2exp_arglst", arglst)
end // end of [aux2]

in (* in of [local] *)

implement
jsonize_p2at
  (p2t0) = let
//
fun auxmain
  (p2t0: p2at): jsonval = let
in
//
case+ p2t0.p2at_node of
//
| P2Tany () => aux0 ("P2Tany")
| P2Tvar (d2v) => let
    val jsv1 = jsonize_d2var (d2v)
  in
    aux1 ("P2Tvar", jsv1)
  end // end of [P2Tvar]
| _ => jsonize_anon (p2t0)
//
end // end of [auxmain]
//
val loc0 = p2t0.p2at_loc
val loc0 = jsonize_loc (loc0)
val p2t0 = auxmain (p2t0)
//
in
  jsonval_labval2 ("p2at_loc", loc0, "p2at_node", p2t0)
end // end of [jsonize_p2at]

(* ****** ****** *)

implement
jsonize_d2exp
  (d2e0) = let
//
fun auxmain
  (d2e0: d2exp): jsonval = let
in
//
case+
d2e0.d2exp_node of
//
| D2Ecst (d2c) => let
    val jsv1 = jsonize_d2cst (d2c)
  in
    aux1 ("D2Ecst", jsv1)
  end // end of [D2Ecst]
| D2Evar (d2v) => let
    val jsv1 = jsonize_d2var (d2v)
  in
    aux1 ("D2Evar", jsv1)
  end // end of [D2Evar]
//
| D2Eint (int) =>
    aux1 ("D2Eint", jsonval_int (int))
//
| D2Ei0nt (tok) =>
    aux1 ("D2Ei0nt", jsonize_i0nt (tok))
//
| _ => jsonize_anon (d2e0)
//
end // end of [auxmain]
//
val loc0 = d2e0.d2exp_loc
val loc0 = jsonize_loc (loc0)
val d2e0 = auxmain (d2e0)
//
in
  jsonval_labval2 ("d2exp_loc", loc0, "d2exp_node", d2e0)
end // end of [jsonize_d2exp]

(* ****** ****** *)

implement
jsonize_d2ecl
  (d2c0) = let
//
fun auxmain
  (d2c0: d2ecl): jsonval = let
in
//
case+
d2c0.d2ecl_node of
//
| D2Cnone () => aux0 ("D2Cnone")
| D2Clist (d2cs) =>
    aux1 ("D2Clist", jsonize_d2eclist (d2cs))
  // end of [D2Clist]
//
| D2Cvaldecs
    (knd, v2ds) => let
    val knd = jsonize_valkind (knd)
    val v2ds = jsonize_v2aldeclst (v2ds)
  in
    aux2 ("D2Cvaldecs", knd, v2ds)
  end // end of [D2Cvaldecs]
//
| D2Cinclude (d2cs) =>
    aux1 ("D2Cinclude", jsonize_d2eclist (d2cs))
  // end of [D2Cinclude]
//
| _ => jsonize_anon (d2c0)
//
end // end of [auxmain]
//
val loc0 = d2c0.d2ecl_loc
val loc0 = jsonize_loc (loc0)
val d2c0 = auxmain (d2c0)
//
in
  jsonval_labval2 ("d2ecl_loc", loc0, "d2ecl_node", d2c0)
end // end of [jsonize_d2ecl]

(* ****** ****** *)

implement
jsonize_v2aldec
  (v2d) = let
//
val loc = jsonize_loc (v2d.v2aldec_loc)
val pat = jsonize_p2at (v2d.v2aldec_pat)
val def = jsonize_d2exp (v2d.v2aldec_def)
val ann = jsonize_anon (v2d.v2aldec_ann)
//
in
//
jsonval_labval4 (
  "v2aldec_loc", loc, "v2aldec_pat", pat, "v2aldec_def", def, "v2aldec_ann", ann
) (* end of [jsonize_labval4] *)
//
end // end of [json_v2aldec]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
jsonize_d2explst
  (d2es) = let
//
val jsvs =
  list_map_fun (d2es, jsonize_d2exp)
//
in
  jsonval_list (list_of_list_vt (jsvs))
end // end of [jsonize_d2explst]

(* ****** ****** *)

implement
jsonize_d2eclist
  (d2cs) = let
//
val jsvs =
  list_map_fun (d2cs, jsonize_d2ecl)
//
in
  jsonval_list (list_of_list_vt (jsvs))
end // end of [jsonize_d2eclist]

(* ****** ****** *)

implement
jsonize_v2aldeclst
  (d2cs) = let
//
val jsvs =
  list_map_fun (d2cs, jsonize_v2aldec)
//
in
  jsonval_list (list_of_list_vt (jsvs))
end // end of [jsonize_v2aldeclst]

(* ****** ****** *)

(* end of [pats_dynexp2_jsonize.dats] *)