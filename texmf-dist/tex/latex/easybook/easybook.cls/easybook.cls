%%
%% This is file `easybook.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% easybook.dtx  (with options: `class')
%% Copyright (C) 2021-2025 by Qu Yi <toquyi@163.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3c of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
\NeedsTeXFormat{LaTeX2e}[2021/11/15]
\ProvidesExplClass{easybook}{2025/08/01}{2025ae}
  {Easily typesetting Chinese theses or books}

\bool_new:N \l__eb_compile_draft_bool
\bool_new:N \l__eb_title_newline_bool
\bool_set_true:N \l__eb_class_mode_book_bool
\clist_new:N \g__eb_doc_options_clist
\cs_new_protected:Npn \eb_put_ctexbook:n #1
  { \PassOptionsToClass{#1}{ctexbook} }
\cs_generate_variant:Nn \eb_put_ctexbook:n { V }

\keys_define:nn { easybook }
  {
    newline .code:n         = \bool_set_true:N \l__eb_title_newline_bool,
    scheme .code:n          = \eb_put_ctexbook:n { scheme = {#1} },
    enmode .meta:n          = { newline,scheme = plain },
    font .choices:nn        =
      { noto,times,times*,ebgaramond,libertine,palatino,auto }
      { \tl_set:Nn \l__eb_font_value_tl {#1} },
    font .value_required:n  = true,
    font .initial:n         = auto,
    cjkfont .code:n         = \eb_put_ctexbook:n { fontset = {#1} },
    mathfont .tl_set:N      = \l__eb_mathfont_value_tl,
    mathfont .initial:n     = times,
    configs .clist_gset:N   = \g__eb_configs_file_clist,
    unknown .code:n = \clist_gput_right:NV \g__eb_doc_options_clist \CurrentOption
  }
\IfFormatAtLeastTF{2024/06/20}{}
  {
    \keys_define:nn { easybook }
      {
        paper .code:n     = { },
        class .code:n     = { },
        floatpage .code:n = { },
        theorem .code:n   = { },
        chem .code:n      = { }
      }
  }

\cs_if_exist:NTF \ProcessKeyOptions
  { \ProcessKeyOptions[easybook] }
  {
    \RequirePackage{l3keys2e}
    \ProcessKeysOptions{easybook}
  }
\PassOptionsToPackage{no-math,quiet,CJKmath}{xeCJK}
\eb_put_ctexbook:V \g__eb_doc_options_clist
\LoadClass[UTF8]{ctexbook}

\RequirePackage{easybase}
\ctex_at_end_preamble:n
  {
    \use:c { eb@font@load@\l__eb_font_value_tl }
    \clist_if_empty:NF \g__eb_configs_file_clist
      { \clist_map_function:NN \g__eb_configs_file_clist \file_input:n }
  }

\sys_if_engine_xetex:TF
  {
    \cs_new_eq:NN \eb_set_family:nnn \xeCJK_set_family:nnn
    \cs_new_eq:NN \eb_switch_family:n \xeCJK_switch_family:n
  }
  {
    \cs_new_eq:NN \eb_set_family:nnn \ctex_ltj_set_family:nnn
    \cs_new_eq:NN \eb_switch_family:n \ctex_ltj_switch_family:n
  }
\cs_generate_variant:Nn \eb_set_family:nnn { x }
\cs_new_protected:Npn \eb_setmainfont:nn #1#2
  { \__fontspec_main_setmainfont:nn {#2} {#1} }
\cs_new_protected:Npn \eb_setsansfont:nn #1#2
  { \__fontspec_main_setsansfont:nn {#2} {#1} }
\cs_new_protected:Npn \eb_setmonofont:nn #1#2
  { \__fontspec_main_setmonofont:nn {#2} {#1} }
\cs_new_protected:Npn \eb_setCJKmainfont:nn #1#2
  { \eb_set_family:xnn { \CJKrmdefault } {#2} {#1} }
\cs_new_protected:Npn \eb_setCJKsansfont:nn #1#2
  { \eb_set_family:xnn { \CJKsfdefault } {#2} {#1} }
\cs_new_protected:Npn \eb_setCJKmonofont:nn #1#2
  { \eb_set_family:xnn { \CJKttdefault } {#2} {#1} }
\clist_map_inline:nn
  { main,sans,mono,CJKmain,CJKsans,CJKmono }
  {
    \exp_args:Nc \RenewDocumentCommand { set#1font }{O{}mO{}}
      {\use:c { eb_set#1font:nn } {##2} { ##1,##3 }}
  }
\RenewDocumentCommand{\newCJKfontfamily}{omO{}mO{}}
  {
    \tl_set:Nx \l_tmpa_tl { \tl_if_novalue:nTF {#1} { \cs_to_str:N #2 } {#1} }
    \cs_new_protected:Npx #2 { \eb_switch_family:n { \l_tmpa_tl } }
    \eb_set_family:xnn { \l_tmpa_tl } { #3,#5 } {#4}
  }

\cs_new_protected:Npn \eb@font@load@noto
  {
    \eb_setmainfont:nn { NotoSerif }
      {
        Extension   = .ttf,
        UprightFont = *-Regular,
        BoldFont    = *-Bold,
        ItalicFont  = *-Italic
      }
    \eb_setsansfont:nn { NotoSans }
      {
        Extension   = .ttf,
        UprightFont = *-Regular,
        BoldFont    = *-Bold,
        ItalicFont  = *-Italic
      }
    \eb_setmonofont:nn { NotoSansMono }
      {
        Extension   = .ttf,
        UprightFont = *-Regular,
        BoldFont    = *-Bold
      }
  }
\cs_new_protected:Npn \eb@font@load@times
  {
    \eb_setmainfont:nn { XITS }
      {
        Extension       = .otf,
        UprightFont     = *-regular,
        BoldFont        = *-bold,
        ItalicFont      = *-italic,
        BoldItalicFont  = *-bolditalic
      }
    \eb_setsansfont:nn { texgyreheros }
      {
        Extension       = .otf,
        UprightFont     = *-regular,
        BoldFont        = *-bold,
        ItalicFont      = *-italic,
        BoldItalicFont  = *-bolditalic
      }
    \eb_setmonofont:nn { texgyrecursor }
      {
        Extension       = .otf,
        UprightFont     = *-regular,
        BoldFont        = *-bold,
        ItalicFont      = *-italic,
        BoldItalicFont  = *-bolditalic,
        Ligatures       = CommonOff
      }
  }
\cs_new_protected:cpn { eb@font@load@times* }
  {
    \eb_setmainfont:nn { Times~New~Roman } { }
    \eb_setsansfont:nn { Arial } { }
    \eb_setmonofont:nn { Courier~New } { }
  }
\cs_new_protected:Npn \eb@font@load@libertinus@sans
  {
    \eb_setsansfont:nn { LibertinusSans }
      {
        Extension   = .otf,
        UprightFont = *-Regular,
        BoldFont    = *-Bold,
        ItalicFont  = *-Italic
      }
  }
\cs_new_protected:Npn \eb@font@load@lmmonolt@mono
  {
    \eb_setmonofont:nn { lmmonolt10 }
      {
        Extension       = .otf,
        UprightFont     = *-regular,
        BoldFont        = *-bold,
        ItalicFont      = *-oblique,
        BoldItalicFont  = *-boldoblique
      }
  }
\cs_new_protected:Npn \eb@font@load@ebgaramond
  {
    \eb_setmainfont:nn { EBGaramond }
      {
        Extension       = .otf,
        UprightFont     = *-Regular,
        BoldFont        = *-Bold,
        ItalicFont      = *-Italic,
        BoldItalicFont  = *-BoldItalic
      }
    \eb@font@load@libertinus@sans
    \eb@font@load@lmmonolt@mono
  }
\cs_new_protected:Npn \eb@font@load@libertine
  {
    \eb_setmainfont:nn { LibertinusSerif }
      {
        Extension       = .otf,
        UprightFont     = *-Regular,
        BoldFont        = *-Bold,
        ItalicFont      = *-Italic,
        BoldItalicFont  = *-BoldItalic
      }
    \eb@font@load@libertinus@sans
    \eb@font@load@lmmonolt@mono
  }
\cs_new_protected:Npn \eb@font@load@palatino
  {
    \eb_setmainfont:nn { texgyrepagella }
      {
        Extension       = .otf,
        UprightFont     = *-regular,
        BoldFont        = *-bold,
        ItalicFont      = *-italic,
        BoldItalicFont  = *-bolditalic
      }
    \eb@font@load@libertinus@sans
    \eb@font@load@lmmonolt@mono
  }
\cs_new_protected:Npn \eb_put_newtxmath:n #1
  { \PassOptionsToPackage{#1}{newtxmath} }
\cs_generate_variant:Nn \eb_put_newtxmath:n { V }
\str_case:VnF \l__eb_mathfont_value_tl
  {
    { times } { \RequirePackage{newtxmath,bm} }
    { none } { }
  }
  {
    \eb_put_newtxmath:V \l__eb_mathfont_value_tl
    \RequirePackage{newtxmath,bm}
  }

\ctex_set:n
  {
    secnumdepth     = 3,
    tocdepth        = \bool_if:NTF \l__eb_class_mode_book_bool { 1 } { 2 },
    part            =
      {
        pagestyle   = empty,
        format      = \color{ctex@frame}\sffamily\Huge,
        nameformat  = { },
        titleformat = { },
        aftername   =
          {
            \bool_if:NTF \l__eb_title_newline_bool
              { \par\nobreak }
              { \hspace{1em} }
          }
      },
    chapter         =
      {
        pagestyle   = empty,
        format      =
          {
            \color{ctex@frame}\sffamily\LARGE
            \bool_if:NF \l__eb_title_newline_bool { \centering }
          },
        nameformat  = { },
        titleformat = { },
        aftername   =
          {
            \bool_if:NTF \l__eb_title_newline_bool
              { \par\nobreak\vskip 1.5pc }
              { \hspace{1em} }
          },
        beforeskip  = 0pt,
        afterskip   = 25pt
      },
    section         =
      {
        hang        = true,
        format      = \color{ctex@frame}\sffamily\Large,
        aftername   = \hspace{0.5em},
        beforeskip  = 2ex plus .2ex minus .1ex,
        afterskip   = 2ex plus .2ex minus .1ex
      },
    subsection      =
      {
        hang        = true,
        format      = \color{ctex@frame}\sffamily\large,
        aftername   = \hspace{0.5em},
        beforeskip  = 1.5ex plus .2ex minus .1ex,
        afterskip   = 1.5ex plus .2ex minus .1ex
      },
    subsubsection   =
      {
        hang        = true,
        format      = \color{ctex@frame}\sffamily,
        aftername   = \hspace{0.5em},
        beforeskip  = \parskip,
        afterskip   = \parskip
      }
  }
\bool_if:NF \l__eb_class_mode_book_bool
  {
    \ctex_set:nn { part }
      {
        format      = \color{ctex@frame}\sffamily\Large,
        break       = \if@noskipsec\leavevmode\fi\par,
        beforeskip  = 3ex,
        afterskip   = 3ex
      }
    \def\@endpart
      {
        \CTEX@setheadingskip\CTEX@part@afterskip
        \ifodd\CTEX@part@fixskip\CTEX@fixheadingskip\fi
        \vskip\CTEX@headingskip
        \@afterheading
      }
  }
\bool_if:NF \l__eb_title_newline_bool
  {
    \ctex_set:n
      {
        part/hang     = true,
        chapter/hang  = true
      }
  }
\endinput
%%
%% End of file `easybook.cls'.
