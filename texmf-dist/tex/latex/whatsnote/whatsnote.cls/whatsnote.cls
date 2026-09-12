%%
%% This is file `whatsnote.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% whatsnote.dtx  (with options: `class')
%% -----------------------------------------------------------------------
%%   Copyright (C) 2024-2025 by Mingyu Xia <myhsia@outlook.com>          *
%%                                                                       *
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
\def \whatsnote@date    {2025-11-12}
\def \whatsnote@version {v5.0B}
\def \whatsnote@tldr
  {LaTeX class for taking notes in science, engineering, etc.}
\ProvidesExplClass {whatsnote} {\whatsnote@date}
  {\whatsnote@version} {\whatsnote@tldr}
\cs_new_protected:Npn \__whats_msg_new:nn #1#2
  { \msg_new:nnn { whatsnote } {#1} {#2} }
\cs_new_protected:Npn \__whats_msg_error:nn #1#2
  { \msg_error:nnn { whatsnote } {#1} {#2} }
\cs_new_protected:Npn \__whats_msg_warning:nn #1#2
  { \msg_error:nnn { whatsnote } {#1} {#2} }
\cs_new_protected_nopar:Npn \__whats_provide_module:n #1
  {
    \ProvidesExplFile {whats-#1-module.code.tex}
      {\whatsnote@date} {\whatsnote@version}
      { whatsNote ~ \text_titlecase:n {#1} ~ Module }
  }
\cs_new_protected_nopar:Npn \__whats_load_module:n #1
  {
    \clist_map_inline:nn {#1}
      {
        \file_if_exist_input:nF { whats-##1-module.code.tex }
          { \__whats_msg_error:nn { not found module } {##1} }
      }
  }
\__whats_msg_new:nn { not found module }
  { The ~ whats ~ module ~ `#1' ~ not ~ found. }
\clist_new:N \g__whats_base_class_options_clist
\keys_define:nn { whats / classoption }
  {
    unknown .code:n = \__whats_unknown_option:n { #1 },
  }
\cs_new_protected_nopar:Npn \__whats_unknown_option:n #1
  {
    \tl_if_empty:nTF { #1 }
      { \clist_gput_right:NV \g__whats_base_class_options_clist \l_keys_key_str }
      {
        \exp_args:NNx \clist_gput_right:Nn \g__whats_base_class_options_clist
          { \l_keys_key_str = \exp_not:n {#1} }
      }
  }
\ProcessKeyOptions [ whats / classoption ]
\PassOptionsToClass { book } { 11pt }
\PassOptionsToPackage { svgnames } { xcolor }
\exp_args:NNV \LoadClass [ \g__whats_base_class_options_clist ] { book }
\__whats_load_module:n { typeset, layout, theorem, cover }
\file_input_stop:
%% -----------------------------------------------------------------------
%%   This work consists of the files whatsnote.dtx,                      *
%%                                   whatsnote.ins,                      *
%%                 the derived files whatsnote.cls,                      *
%%                                   whats-*-module.code.tex,            *
%%           the documentation files whatsnote.pdf,                      *
%%                               and README.md.                          *
%% -----------------------------------------------------------------------
%%
%% End of file `whatsnote.cls'.
