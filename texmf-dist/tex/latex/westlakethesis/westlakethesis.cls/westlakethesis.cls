%%
%% This is file `westlakethesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% westlakethesis.dtx  (with options: `class')
%% -----------------------------------------------------------------------
%%   Copyright (C) 2026 by Mingyu Xia <myhsia@outlook.com>               *
%% -----------------------------------------------------------------------
%%   This work may be distributed and/or modified under the conditions   *
%%   of the LaTeX Project Public License (LPPL), either version 1.3c of  *
%%   this license or (at your option) any later version.                 *
%%   The latest version of this license is in                            *
%%                                                                       *
%%       http://www.latex-project.org/lppl.txt                           *
%%                                                                       *
%%   and version 1.3c or later is part of all distributions of LaTeX     *
%%   version 2008 or later.                                              *
%%                                                                       *
%%   This work has the LPPL maintenance status `maintained'.             *
%%                                                                       *
%%   The Current Maintainer of this work is Mingyu Xia.                  *
%% -----------------------------------------------------------------------
\GetIdInfo $Id: westlakethesis.dtx v0.0.2 2026-06-18 myhsia<myhsia@outlook.com>$
  {LaTeX Template Bundle for Westlake University (WESTLAKE)}
\ProvidesExplClass {\ExplFileName}
  {\ExplFileDate} {\ExplFileVersion} {\ExplFileDescription}
\edef \WUFileDate        {\ExplFileDate}
\edef \WUFileVersion     {\ExplFileVersion}
\edef \WUFileDescription {\ExplFileDescription}
\tl_greplace_all:Nnn \WUFileDate { / } { - }
\color_set:nnn { Knowledge Orange } { HTML } { F18B1C }
\color_set:nnn { Exploration Blue } { HTML } { 00498F }
\clist_map_inline:nn { new, error, warning, info }
  {
    \cs_new_protected:cpn { __wu_msg_#1:nn }
      { \use:c { msg_#1:nnn } { westlakethesis } }
  }
\__wu_msg_new:nn { not ~ found ~ module }
  { The ~ WestlakeThesis ~ module ~ `#1' ~ not ~ found. }
\__wu_msg_new:nn { not ~ recommended ~ fontset }
  {
    The ~ fontset ~ `#1' ~ is ~ not ~ recommended, ~ using ~ `windows' ~
    fontset ~ to ~ achieve ~ a ~ maximum ~ compliance ~ of ~ the ~ official ~
    requirement.
  }
\__wu_msg_new:nn { unknown ~ mode }
  { Couldn't ~ load ~ the ~ `#1' ~ mode ~ of ~ WestlakeThesis. }
\cs_new_protected_nopar:Npn \__wu_unknown_option:n #1
  {
    \tl_if_empty:nTF {#1}
      {
        \clist_gput_right:NV \g__wu_base_cls_opt_clist \l_keys_key_str
      }
      {
        \exp_args:NNx \clist_gput_right:Nn \g__wu_base_cls_opt_clist
          { \l_keys_key_str = \exp_not:n {#1} }
      }
  }
\clist_clear_new:N \g__wu_base_cls_opt_clist
\cs_new_protected_nopar:Npn \__wu_load_module:N #1
  {
    \clist_map_inline:Nn #1
      {
        \file_if_exist_input:nF { wu-##1.code.tex }
          { \__wu_msg_error:nn { not ~ found ~ module } { ##1 } }
      }
  }
\str_new:N \g__wu_clsoption_mode_str
\clist_new:N \g__wu_module_usage_clist
\keys_define:nn { __wu / clsoption }
  {
    mode          .choices:nn =
      { thesis, beamer, poster, usrdoc }
      { \str_gset:Nn \g__wu_clsoption_mode_str {#1} },
    mode          .initial:n  = { thesis },
    mode          .usage:n    = { load   },
    unknown       .code:n     = \__wu_unknown_option:n {#1},
  }
\ProcessKeyOptions [ __wu / clsoption ]
\str_case:NnF \g__wu_clsoption_mode_str
  {
    { thesis }
    {
      \clist_gset:Nn \g__wu_module_usage_clist
        { depend, kernel, params, thesis }
    }
    { usrdoc }
    {
      \clist_gset:Nn \g__wu_module_usage_clist
        { depend, kernel, usrdoc }
    }
    { beamer }
    {
      \clist_gset:Nn \g__wu_module_usage_clist
        { depend, kernel, params, beamer }
    }
    { poster }
    {
      \clist_gset:Nn \g__wu_module_usage_clist
        { poster }
    }
  } { \__wu_msg_error:nn { unknown mode } { \g__wu_clsoption_mode_str } }
\__wu_load_module:N \g__wu_module_usage_clist
\@onlypreamble \westlakeset
\NewDocumentCommand \westlakeset { m }
  {
    \exp_args:No \keys_set:nn { \g__wu_clsoption_mode_str / set } {#1}
    \cs_if_exist_use:N \__wu_westlakeset_aux:
  }
\file_input_stop:
%% -----------------------------------------------------------------------
%%   This work consists of the files westlakethesis.dtx,                 *
%%                                   westlakethesis.ins,                 *
%%                 the derived files westlakethesis.cls,                 *
%%                                   wu-depend.code.tex,                 *
%%                                   wu-kernel.code.tex,                 *
%%                                   wu-params.code.tex,                 *
%%                                   wu-thesis.code.tex,                 *
%%                                   wu-beamer.code.tex,                 *
%%                                   wu-poster.code.tex,                 *
%%                                   wu-usrdoc.code.tex,                 *
%%                                   westlake-logo.pdf,                  *
%%                                   westlake-badge-en.pdf,              *
%%                                   westlake-badge-cn.pdf,              *
%%                                   westlake-paint-a.png,               *
%%                                   westlake-paint-b.png,               *
%%           the documentation files westlakethesis.pdf,                 *
%%                               and README.md.                          *
%% -----------------------------------------------------------------------
%%
%% End of file `westlakethesis.cls'.
