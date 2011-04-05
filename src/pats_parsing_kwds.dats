(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(*                              Hongwei Xi                             *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, Boston University
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
// Start Time: March, 2011
//
(* ****** ****** *)

staload _(*anon*) = "prelude/DATS/list_vt.dats"

(* ****** ****** *)

staload "pats_symbol.sats"
staload "pats_syntax.sats"

(* ****** ****** *)

staload "pats_lexing.sats" // for tokenizing
staload "pats_tokbuf.sats" // for token buffering

(* ****** ****** *)

staload "pats_parsing.sats"

(* ****** ****** *)

implement
is_AND (x) = case+ x of
  | T_AND () => true | _ => false
implement
p_AND (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_AND, PE_AND)
implement
p_AND_test (buf) = ptoken_test_fun (buf, is_AND)

implement
is_OF (x) = case+ x of
  | T_OF () => true | _ => false
implement
p_OF (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_OF, PE_OF)

implement
is_IN (x) = case+ x of
  | T_IN () => true | _ => false
implement
p_IN (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_IN, PE_IN)

implement
is_END (x) = case+ x of
  | T_END () => true | _ => false
implement
p_END (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_END, PE_END)

implement
is_REC (x) = case+ x of
  | T_REC () => true | _ => false
implement
p_REC (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_REC, PE_REC)
implement
p_REC_test (buf) = ptoken_test_fun (buf, is_REC)

implement
is_WITH (x) = case+ x of
  | T_WITH () => true | _ => false
implement
p_WITH (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_WITH, PE_WITH)

(* ****** ****** *)

implement
is_BAR (x) = case+ x of
  | T_BAR () => true | _ => false
implement
p_BAR (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_BAR, PE_BAR)
implement
p_BAR_test (buf) = ptoken_test_fun (buf, is_BAR)

implement
is_COLON (x) = case+ x of
  | T_COLON () => true | _ => false
implement
p_COLON (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_COLON, PE_COLON)
implement
p_COLON_test (buf) = ptoken_test_fun (buf, is_COLON)

implement
is_COMMA (x) = case+ x of
  | T_COMMA () => true | _ => false
implement
p_COMMA (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_COMMA, PE_COMMA)
implement
p_COMMA_test (buf) = ptoken_test_fun (buf, is_COMMA)

implement
is_SEMICOLON (x) = case+ x of
  | T_SEMICOLON () => true | _ => false
implement
p_SEMICOLON (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_SEMICOLON, PE_SEMICOLON)
implement
p_SEMICOLON_test
  (buf) = ptoken_test_fun (buf, is_SEMICOLON)
// end of [p_SEMICOLON_test]

implement
is_BARSEMI (x) = case+ x of
  | T_BAR () => true | T_SEMICOLON () => true | _ => false
implement
p_BARSEMI_test (buf) = ptoken_test_fun (buf, is_BARSEMI)

(* ****** ****** *)

implement
is_LPAREN (x) = case+ x of
  | T_LPAREN () => true | _ => false
implement
p_LPAREN (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_LPAREN, PE_LPAREN)

implement
is_RPAREN (x) = case+ x of
  | T_RPAREN () => true | _ => false
implement
p_RPAREN (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_RPAREN, PE_RPAREN)

(* ****** ****** *)

implement
is_LBRACKET (x) = case+ x of
  | T_LBRACKET () => true | _ => false
implement
p_LBRACKET (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_LBRACKET, PE_LBRACKET)

implement
is_RBRACKET (x) = case+ x of
  | T_RBRACKET () => true | _ => false
implement
p_RBRACKET (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_RBRACKET, PE_RBRACKET)

(* ****** ****** *)

implement
is_LBRACE (x) = case+ x of
  | T_LBRACE () => true | _ => false
implement
p_LBRACE (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_LBRACE, PE_LBRACE)

implement
is_RBRACE (x) = case+ x of
  | T_RBRACE () => true | _ => false
implement
p_RBRACE (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_RBRACE, PE_RBRACE)

(* ****** ****** *)

implement
is_DOT (x) = case+ x of
  | T_DOT () => true | _ => false
implement
p_DOT (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_DOT, PE_DOT)
// end of [p_DOT]

implement
is_EQ (x) = case+ x of
  | T_EQ () => true | _ => false
implement
p_EQ (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_EQ, PE_EQ)
// end of [p_EQ]

implement
is_EQGT (x) = case+ x of
  | T_EQGT () => true | _ => false
// end of [is_EQGT]
implement
p_EQGT (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_EQGT, PE_EQGT)
// end of [p_EQGT]

implement
is_GT (x) = case+ x of
  | T_GT () => true | _ => false
// end of [is_GT]
implement
p_GT (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_GT, PE_GT)
// end of [p_GT]

implement
is_GTDOT (x) = case+ x of
  | T_GTDOT () => true | _ => false
// end of [is_GTDOT]
implement
p_GTDOT (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_GTDOT, PE_GTDOT)
// end of [p_GTDOT]

(* ****** ****** *)

implement
is_SRPTHEN (x) = case+ x of
  | T_SRPTHEN () => true | _ => false
// end of [is_SRPTHEN]
implement
p_SRPTHEN (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_SRPTHEN, PE_SRPTHEN)
// end of [p_SRPTHEN]

implement
is_SRPENDIF (x) = case+ x of
  | T_SRPENDIF () => true | _ => false
// end of [is_SRPENDIF]
implement
p_SRPENDIF (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_SRPENDIF, PE_SRPENDIF)
// end of [p_SRPENDIF]

(* ****** ****** *)

implement
is_EOF (x) = case+ x of
  | T_EOF () => true | _ => false
// end of [is_EOF]
implement
p_EOF (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_EOF, PE_EOF)
// end of [p_EOF]

(* ****** ****** *)

implement
is_ATLPAREN (x) =
  case+ x of
  | T_ATLPAREN () => true | _ => false
// end of [is_ATLPAREN]
implement
is_LPAREN_deco (x) =
  case+ x of
  | T_ATLPAREN () => true
  | T_QUOTELPAREN () => true
  | _ => false
// end of [is_LPAREN_deco]

implement
is_ATLBRACE (x) =
  case+ x of
  | T_ATLBRACE () => true | _ => false
// end of [is_ATLBRACE]
implement
is_LBRACE_deco (x) =
  case+ x of
  | T_ATLBRACE () => true
  | T_QUOTELBRACE () => true
  | _ => false
// end of [is_LBRACE_deco]

(* ****** ****** *)

(* end of [pats_parsing_kwds.dats] *)
