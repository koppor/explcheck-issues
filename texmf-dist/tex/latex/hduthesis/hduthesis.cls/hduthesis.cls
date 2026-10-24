%%
%% This is file `hduthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hduthesis.dtx  (with options: `class')
%% -----------------------------------------------------------------------
%%   Copyright (C) 2023-2025 by Mingyu Xia <myhsia@outlook.com>          *
%%                                                                       *
%%   It may be distributed and/or modified under the conditions of the   *
%%   LaTeX Project Public License (LPPL), either version 1.3c of this    *
%%   license or (at your option) any later version. The latest version   *
%%   of this license is in the file                                      *
%%                                                                       *
%%       http://www.latex-project.org/lppl.txt                           *
%%                                                                       *
%%   This work has the LPPL maintenance status `maintained'.             *
%%                                                                       *
%%   The Current Maintainer of this work is Mingyu Xia.                  *
%% -----------------------------------------------------------------------
\def \hduthesis@date {2025-03-23}
\def \hduthesis@version {1.1.1}
\def \hduthesis@maintainerid {myhsia}
\ProvidesExplClass {hduthesis} {\hduthesis@date} {\hduthesis@version}
  {LaTeX Template Bundle for Hangzhou Dianzi University}
\cs_if_exist:NF \seq_set_split:Nne
  { \cs_generate_variant:Nn \seq_set_split:Nnn { Nne } }
\cs_if_exist:NF \seq_set_split:Nee
  { \cs_generate_variant:Nn \seq_set_split:Nnn { Nee } }
\cs_if_exist:NF \tl_set:Ne
  { \cs_generate_variant:Nn \tl_set:Nn { Ne } }
\cs_if_exist:NF \tl_gset:Ne
  { \cs_generate_variant:Nn \tl_gset:Nn { Ne } }
\cs_new_protected:Npn \__hdu_msg_new:nn #1#2
  { \msg_new:nnn { hduthesis } {#1} {#2} }
\cs_new_protected:Npn \__hdu_msg_error:nn #1#2
  { \msg_error:nnn { hduthesis } {#1} {#2} }
\cs_generate_variant:Nn \__hdu_msg_error:nn { nx }
\cs_new_protected:Npn \__hdu_msg_warning:nn #1#2
  { \msg_warning:nnn { hduthesis } {#1} {#2} }
\cs_generate_variant:Nn \__hdu_msg_warning:nn { nx }
\__hdu_msg_new:nn { not found module }
  { The ~ hduthesis ~ module ~ `#1' ~ not ~ found. }
\__hdu_msg_new:nn { unknown mode }
  {
    Unknown ~ hduthesis ~ mode ~ `#1',~
    loading ~ mode ~ `thesis' ~ instead.
  }
\__hdu_msg_new:nn { Users Agreement }
  {
    \exp_not:n
      {
        编译受阻!~ 使用模板前请阅读用户手册中的「用户协议」
        \MessageBreak
        !模板作者 (@myhsia) 不对使用本模板产生的格式审查问题负责!
        \MessageBreak
        如果您同意协议，在全局选项中添加 `agreed' 即可解除本错误
        \MessageBreak
        欢迎您通过邮件 (myhsia@hdu.edu.cn) 或 GitHub 反馈意见
      }
  }
\cs_new_protected_nopar:Npn \__hdu_load_module:n #1
  {
    \clist_map_inline:nn {#1}
    {
      \file_if_exist_input:nF { hdu-##1.code.tex }
        { \__hdu_msg_error:nn { not found module } {##1} }
    }
  }
\cs_new_protected_nopar:Npn \__hdu_provide_module:n #1
  {
    \ProvidesExplFile{hdu-#1.code.tex}
      {\hduthesis@date}{\hduthesis@version}
      {hduThesiS ~ \text_titlecase:n {#1} ~ Module}
  }
\keys_define:nn { hduthesis / classoption }
  {
    agreed       .bool_set:N = \g__hdu_agreement_bool,
      agreed     .initial:n  = false,
      agreed     .default:n  = true,
    mode         .tl_set:N   = \g__hdu_mode_tl,
    math-font    .tl_set:N   = \g__hdu_math_font,
    CJKmain-font .tl_set:N   = \g__hdu_main_CJK_font,
    CJKsans-font .tl_set:N   = \g__hdu_sans_CJK_font,
    CJKmono-font .tl_set:N   = \g__hdu_mono_CJK_font,
    unknown      .code:n     = \__hdu_unknown_option:n {#1},
  }
\clist_new:N \g__hdu_base_options_clist
\cs_new_protected_nopar:Npn \__hdu_unknown_option:n #1
  {
    \tl_if_empty:nTF { #1 }
      {
        \clist_gput_right:NV
          \g__hdu_base_options_clist \l_keys_key_str
      }
      {
        \exp_args:NNx
        \clist_gput_right:Nn \g__hdu_base_options_clist
          { \l_keys_key_str = \exp_not:n {#1} }
      }
  }
\ProcessKeyOptions [ hduthesis / classoption ]
\bool_lazy_all:nT
  {
    { !\str_if_empty_p:N \g__hdu_mode_tl }
    { !\str_if_eq_p:ee { \g__hdu_mode_tl } { thesis }     }
    { !\str_if_eq_p:ee { \g__hdu_mode_tl } { beamer }     }
    { !\str_if_eq_p:ee { \g__hdu_mode_tl } { stationery } }
    { !\str_if_eq_p:ee { \g__hdu_mode_tl } { exam }       }
    { !\str_if_eq_p:ee { \g__hdu_mode_tl } { l3doc }      }
  }
  { \__hdu_msg_warning:nx { unknown mode } { \g__hdu_mode_tl } }
\str_if_eq:eeT { \g__hdu_mode_tl } { beamer }
  {
    \PassOptionsToClass { aspectratio = 2013 } { beamer }
    \exp_args:NNV
      \LoadClass [ \g__hdu_base_options_clist ] { beamer }
    \usetheme{hdu}
    \endinput
  }
\str_if_eq:eeT { \g__hdu_mode_tl } { stationery }
  {
    \PassOptionsToClass { 12pt } { letter }
    \exp_args:NNV
      \LoadClass [ \g__hdu_base_options_clist ] { letter }
    \__hdu_load_module:n { stationery }
    \endinput
  }
\str_if_eq:eeT { \g__hdu_mode_tl } { exam }
  {
    \exp_args:NNV
      \LoadClass [ \g__hdu_base_options_clist ] { article }
    \__hdu_load_module:n { exam }
    \endinput
  }
\str_if_eq:eeT { \g__hdu_mode_tl } { l3doc }
  {
    \PassOptionsToClass { 11pt, letterpaper, kernel } { l3doc }
    \RequirePackage{minted}
    \exp_args:NNV
      \LoadClass [ \g__hdu_base_options_clist ] { l3doc }
    \__hdu_load_module:n { l3doc }
    \endinput
  }
\bool_lazy_any:nT
  {
    {  \str_if_eq_p:ee { \g__hdu_mode_tl } { thesis }     }
    { !\str_if_eq_p:ee { \g__hdu_mode_tl } { beamer }     }
    { !\str_if_eq_p:ee { \g__hdu_mode_tl } { stationery } }
    { !\str_if_eq_p:ee { \g__hdu_mode_tl } { exam }       }
    { !\str_if_eq_p:ee { \g__hdu_mode_tl } { l3doc }      }
  }
  {
    \PassOptionsToClass { a4paper, zihao = -4 } { ctexrep }
    \PassOptionsToPackage { quiet, no-math } { xeCJK }
    \exp_args:NNV
      \LoadClass [ \g__hdu_base_options_clist ] { ctexrep }
    \bool_if:NTF \g__hdu_agreement_bool
      {
        \RequirePackage{hyperref}
        \pdfstringdefDisableCommands
          {
            \def \cite#1 {<#1>}
            \def \hologoRobust#1 {<#1>}
          }
        \AtBeginDocument
          {
            \hypersetup
              { hidelinks, pdfproducer = hduThesiS ~ by ~ Mingyu ~ Xia }
          }
      } { \__hdu_msg_error:nn { Users Agreement } { Unconfirmed } }
    \__hdu_load_module:n { typeset }
    \__hdu_load_module:n { layout }
    \cs_new_protected:Nn \__hdu_docinfo_degree_if_aux:
      {
        \int_compare:nNnTF
          { \tl_count:N \l__hdu_set_stdntid_tl } = { 8 }
          { \__hdu_load_module:n { bc.config } }
          { \__hdu_load_module:n { pg.config } }
      }
    \endinput
  }
%% -----------------------------------------------------------------------
%%   This work consists of the files hduthesis.dtx,                      *
%%                                   hdu-graphics.dtx,                   *
%%                               and hduthesis.ins,                      *
%%             and the derived files hduthesis.cls,                      *
%%                                   hdu-<module>.code.tex,              *
%%                                   beamerthemehdu.sty,                 *
%%                                   hdu-logo.pdf,                       *
%%                                   hdu-title.pdf,                      *
%%                                   hdu-badge.pdf,                      *
%%                                   hdu-motto.pdf,                      *
%%                                   hduthesis.pdf,                      *
%%                                   hdu-graphics.pdf,                   *
%%                               and README.md.                          *
%% -----------------------------------------------------------------------
%%
%% End of file `hduthesis.cls'.
