%% *****************************************************************************
%%            Copyright 2024 by M.Y. XIA <xiamyphys@gmail.com>                 *
%%                                                                             *
%%   This work may be distributed and/or modified under the conditions of the  *
%%   LaTeX Project Public License                                              *
%%                                                                             *
%%               http://www.latex-project.org/lppl.txt                         *
%%                                                                             *
%%   either version 1.3c of this license or any later version.                 *
%%                                                                             *
%%   This work has the LPPL maintenance status `maintained'.                   *
%%                                                                             *
%%   The Current Maintainers of this work is M.Y. XIA                          *
%%                                                                             *
%%   This work consists of the files hduthesis.cls,                            *
%%                                   hduthesis-typeset-module.code,            *
%%                                   hduthesis-layout-module.code,             *
%%                                   hduthesis-bc.config-module.code,          *
%%                                   hduthesis-pg.config-module.code,          *
%%                                   beamerthemehdu.sty,                       *
%%                                   hduthesis-hdu.stationery-module.code,     *
%%                                                                             *
%%                                   hduthesis-hdu.l3doc-module.code,          *
%%                               and README.md.                                *
%%   available at https://github.com/myhsia/hduthesis                          *
%% *****************************************************************************
\def\hduthesis@date{2025/01/04}
\def\hduthesis@version{0.5.2}
\def\hduthesis@maintainerid{myhsia}

\RequirePackage{etoolbox}
\ProvidesExplClass{hduthesis} {\hduthesis@date} {\hduthesis@version}
  {LaTeX Template Bundle for Hangzhou Dianzi University}

\cs_if_exist:NF \seq_set_split:Nne
  { \cs_generate_variant:Nn \seq_set_split:Nnn { Nne } }
\cs_if_exist:NF \seq_set_split:Nee
  { \cs_generate_variant:Nn \seq_set_split:Nnn { Nee } }
\cs_if_exist:NF \tl_set:Ne
  { \cs_generate_variant:Nn \tl_set:Nn { Ne } }
\cs_if_exist:NF \tl_gset:Ne
  { \cs_generate_variant:Nn \tl_gset:Nn { Ne } }

\cs_new_protected:Npn \hduthesis_msg_new:nn #1#2 
  { \msg_new:nnn { hduthesis } {#1} {#2} }
\cs_new_protected:Npn \hduthesis_msg_error:nn #1#2
  { \msg_error:nnn { hduthesis } {#1} {#2} }
\cs_generate_variant:Nn \hduthesis_msg_error:nn { nx }
\cs_new_protected:Npn \hduthesis_msg_warning:nn #1#2
  { \msg_warning:nnn { hduthesis } {#1} {#2} }
\cs_generate_variant:Nn \hduthesis_msg_warning:nn { nx }

\hduthesis_msg_new:nn { not found module }
  { The~hduthesis~module~`#1'~not~found. }
\hduthesis_msg_new:nn { unknown mode }
  { Unknown~hduthesis~mode~`#1',~ loading~mode~`thesis'~instead. }
\hduthesis_msg_new:nn { Users Agreement }
  { \exp_not:n
    {
      编译受阻!~ 使用模板前请阅读用户手册封面上的「用户协议」~
      !!!模板作者(@myhsia)不对使用本模板产生的格式审查问题负责!!!~
      如果您同意用户协议，在全局选项中添加 `agreed' 即可解除本错误~
      欢迎您通过邮件(myhsia@hdu.edu.cn)或GitHub提交反馈意见
    }
  }
\cs_new_protected_nopar:Npn \hduthesis_load_module:n #1 
  {
    \clist_map_inline:nn {#1}
    {
      \file_if_exist_input:nF { hduthesis-##1-module.code.tex }
        { \hduthesis_msg_error:nn { not found module } {##1} }
    }
  }
\cs_new_protected_nopar:Npn \hduthesis_provide_module:n #1
  {
    \ProvidesExplFile{hduthesis-#1-module.code.tex}
      {\hduthesis@date}{\hduthesis@version}
      {hduThesiS~ \text_titlecase:n {#1} ~Module}
  }

\clist_new:N \g__hdu_base_class_options_clist
\keys_define:nn { hduthesis / classoption }
  {
    agreed .bool_set:N      = \g__hduthesis_agreement_bool,
      agreed .initial:n     = false,
      agreed .default:n     = true,
    mode .tl_set:N          = \g__hduthesis_mode_tl,
    math-font .tl_set:N     = \g__hduthesis_math_font,
    CJKmain-font .tl_set:N  = \g__hduthesis_main_CJK_font,
    CJKsans-font .tl_set:N  = \g__hduthesis_sans_CJK_font,
    CJKmono-font .tl_set:N  = \g__hduthesis_mono_CJK_font,
    unknown .code:n         = \__hduthesis_unknown_option:n {#1},
  }
\cs_new_protected_nopar:Npn \__hduthesis_unknown_option:n #1
  {
    \tl_if_empty:nTF { #1 }
      {
        \clist_gput_right:NV \g__hdu_base_class_options_clist \l_keys_key_str
      }
      {
        \exp_args:NNx \clist_gput_right:Nn \g__hdu_base_class_options_clist
          { \l_keys_key_str = \exp_not:n {#1} }
      }
  }
\ProcessKeyOptions [ hduthesis / classoption ]

\bool_if:nT
  {
    !\str_if_empty_p:N \g__hduthesis_mode_tl &&
    !\str_if_eq_p:ee { \g__hduthesis_mode_tl } { thesis } &&
    !\str_if_eq_p:ee { \g__hduthesis_mode_tl } { beamer } &&
    !\str_if_eq_p:ee { \g__hduthesis_mode_tl } { stationery } &&
    % !\str_if_eq_p:ee { \g__hduthesis_mode_tl } { exam } &&
    !\str_if_eq_p:ee { \g__hduthesis_mode_tl } { l3doc }
  }
  { \hduthesis_msg_warning:nx { unknown mode } { \g__hduthesis_mode_tl } }

\str_if_eq:eeT { \g__hduthesis_mode_tl } { beamer }
  {
    \PassOptionsToClass { aspectratio = 2013 } { beamer }
    \exp_args:NNV \LoadClass [ \g__hdu_base_class_options_clist ] { beamer }
    \usetheme{hdu}
    \endinput
  }

\str_if_eq:eeT { \g__hduthesis_mode_tl } { stationery }
  {
    \PassOptionsToClass { 12pt } { letter }
    \exp_args:NNV \LoadClass [ \g__hdu_base_class_options_clist ] { letter }
    \hduthesis_load_module:n { hdu.stationery }
    \endinput
  }

% \str_if_eq:eeT { \g__hduthesis_mode_tl } { exam }
%   {
%     \exp_args:NNV \LoadClass [ \g__hdu_base_class_options_clist ] { article }
%     \hduthesis_load_module:n { hdu.exam }
%     \endinput
%   }

\str_if_eq:eeT { \g__hduthesis_mode_tl } { l3doc }
  {
    \PassOptionsToClass { 11pt, letterpaper, kernel } { l3doc }
    \exp_args:NNV \LoadClass [ \g__hdu_base_class_options_clist ] { l3doc }
    \hduthesis_load_module:n { hdu.l3doc }
    \endinput
  }

\bool_if:nT
  {
     \str_if_eq_p:ee { \g__hduthesis_mode_tl } { thesis } ||
    !\str_if_eq_p:ee { \g__hduthesis_mode_tl } { beamer } ||
    !\str_if_eq_p:ee { \g__hduthesis_mode_tl } { stationery } ||
    % !\str_if_eq_p:ee { \g__hduthesis_mode_tl } { exam } ||
    !\str_if_eq_p:ee { \g__hduthesis_mode_tl } { l3doc }
  }
  {
    \PassOptionsToClass { a4paper, zihao = -4 } { ctexrep }
    \PassOptionsToPackage { quiet, no-math } { xeCJK }
    \exp_args:NNV \LoadClass [ \g__hdu_base_class_options_clist ] { ctexrep }
    \bool_if:NTF \g__hduthesis_agreement_bool
      {
        \RequirePackage{hyperref}
        \pdfstringdefDisableCommands
          {
            \def \cite#1 {<#1>}
            \def \hologoRobust#1 {<#1>}
          }
        \AtBeginDocument
          { \hypersetup { hidelinks, pdfproducer = hduThesiS~by~Mingyu~Xia } }
      } { \hduthesis_msg_error:nn { Users Agreement } { Unconfirmed } }
    \hduthesis_load_module:n { typeset }
    \hduthesis_load_module:n { layout }
    \cs_new_protected:Nn \__hduthesis_docinfo_degree_if_aux:
      {
        \int_compare:nNnTF { \tl_count:N \l__docinfo_stdntid_tl } = { 8 }
          { \hduthesis_load_module:n { bc.config } }
          { \hduthesis_load_module:n { pg.config } }
      }
    \endinput
  }

\endinput
% End of file hduthesis.cls
