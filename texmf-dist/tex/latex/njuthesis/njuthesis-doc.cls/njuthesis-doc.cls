%%
%% This is file `njuthesis-doc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% njuthesis.dtx  (with options: `doc-cls')
%% 
%% Copyright (C) 2021 - 2025
%% by Nanjing University Linux User Group
%% <git+nju-lug-email-3104-issue-@yaoge123.cn>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3c of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%% 
%% To produce the documentation run the original source files ending with
%% `.dtx' through XeTeX.
%% 
\GetIdInfo $Id: njuthesis.dtx 1.4.3 2025-05-21 23:00:00
  +0800 NJU LUG <git+nju-lug-email-3104-issue-@yaoge123.cn>$
  {Documentation style for njuthesis}
\ProvidesExplFile{njuthesis-doc.cls}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}

\RequirePackage { l3keys2e }
\keys_define:nn { njudoc }
  {
    codehigh .bool_gset:N = \g__njudoc_codehigh_bool,
    codehigh   .initial:n = false
  }
\ProcessKeysOptions { njudoc }
\PassOptionsToPackage { fontset = fandol } { ctex       }
\PassOptionsToPackage { firstpage = true } { background }
\LoadClass { ctxdoc }
\RequirePackage
  {
    background,
    codehigh,
    listings,
    njuvisual,
    tabularray,
    unicode-math,
    zhlineskip
  }
\sys_if_engine_xetex:TF
  {
    \RequirePackage { xeCJKfntef }
    \renewcommand\emph[1]{\CJKunderdot[textformat=\itshape]{#1}}
  }
  {
    \RequirePackage { lua-ul }
    \NewDocumentCommand \CJKunderline { o m } { \underLine {#1} }
    \NewDocumentCommand \CJKunderdot  { o m } { \underLine {#1} }
    \NewDocumentCommand \CJKsout      { o m }
      { \textcolor { black!50 } {#1} }
  }
\setlength \IndexMin { 100pt }
\msg_new:nnn { njuthesis-doc } { ctxdoc-too-old }
  {
    Your~ ctxdoc~ is~ too~ old. \\
    Please~ update~ to~ the~ latest~ deverlopment~ version~
    of~ the~ ctex-kit~ from~ its~ GitHub~ repository.
  }
\cs_if_exist:NF \__codedoc_get_hyper_target:eN
  { \msg_fatal:nn { njuthesis-doc } { ctxdoc-too-old } }
\backgroundsetup{
  contents={\njuemblem[white!85!gray]{22cm}{!}},
  scale=1, angle=0, hshift=-4cm
}
\definecolor{tpblue}{HTML}{495A80}
\newcommand\tpbutton[1]{\textcolor{tpblue}{\bfseries #1}}
\newcommand\tikzlogo{Ti\emph{k}Z}
\newcommand\OPT[1]{\textcolor{njuyellow}{\bfseries#1}}
\hypersetup{
  pdftitle  = {
    The~ njuthesis~ class~ -~
    LaTeX~ thesis~ template~ for~ Nanjing~ University},
  citecolor = njublue,
  linkcolor = njuviolet,
  urlcolor  = njumagenta}
\UseTblrLibrary{booktabs,siunitx}
\DefTblrTemplate{caption-tag}{default}{表\hspace{0.25em}\thetable}
\SetTblrStyle{caption-tag}{font=\bfseries}
\SetTblrInner{row{1}={font=\bfseries}}
\SetTblrInner[talltblr]{row{1}={font=\bfseries}}
\DefTblrTemplate{caption-sep}{default}{\quad}
\def\TA{\TblrNote{a}}
\def\TB{\TblrNote{b}}
\def\TC{\TblrNote{c}}
\def\TD{\TblrNote{d}}
\def\TE{\TblrNote{e}}
\def\TL{\TeX~Live}
\def\MacTeX{Mac\TeX}
\def\biber{\hologo{biber}}
\def\LaTeXe{\hologo{LaTeX2e}}
\SetTextEnvironmentSinglespace{1.112}
\SetMathEnvironmentSinglespace{1.112}
\setmainfont { texgyretermes }
  [
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic
  ]
\setsansfont{LexendDeca}
\fontspec_font_if_exist:nT { Iosevka }
  {
    \setmonofont { Iosevka }
      [
        UprightFont = *~Light,
        ItalicFont  = *~Light~Italic,
        BoldFont    = *~Semibold
      ]
  }
\fontspec_font_if_exist:nT { Source~ Han~ Serif~ SC }
  {
    \setCJKmainfont{  Source~ Han~ Serif~ SC }
      [
        UprightFont = *~SemiBold,
        ItalicFont  = *~Bold,
        BoldFont    = *~Heavy,
        Language    = Chinese~Simplified
      ]
  }
\setCJKsansfont { FandolHei-Regular }
  [
    Extension = .otf,
    BoldFont  = FandolHei-Bold
  ]
\setCJKmonofont { FandolFang-Regular }
  [ Extension = .otf ]
\setmathfont{XITSMath-Regular}[
  BoldFont = XITSMath-Bold,
  Extension = .otf]
\lstdefinestyle{style@base}
  {
    basewidth       = 0.5 em,
    gobble          = 3,
    lineskip        = 3 pt,
    frame           = l,
    framerule       = 1 pt,
    framesep        = 0 pt,
    xleftmargin     = 2 em,
    xrightmargin    = 3 em,
    escapeinside    = {(*}{*)},
    breaklines      = true,
    basicstyle      = \small\ttfamily,
    keywordstyle    = \bfseries\color{njuviolet},
    commentstyle    = \itshape\color{white!50!gray},
    stringstyle     = \color{nju-chem-red},
    backgroundcolor = \color{white!95!gray}
  }
\lstdefinestyle{style@shell}
  {
    style      = style@base,
    rulecolor  = \color{njumagenta},
    language   = bash,
    alsoletter = {-},
    emphstyle  = \color{nju-cs-green}
  }
\lstdefinestyle{style@latex}
  {
    style      = style@base,
    rulecolor  = \color{njublue},
    language   = [LaTeX]TeX,
    alsoletter = {*, -, .},
    texcsstyle = *\color{njuviolet},
    emphstyle  = [1]\color{nju-ai-orange},
    emphstyle  = [2]\color{nju-cs-green},
    emphstyle  = [3]\bfseries\color{njuyellow}
  }
\lstnewenvironment{shellexample}[1][]{%
  \lstset{style=style@shell, #1}}{}
\lstnewenvironment{latexexample}[1][]{%
  \lstset{style=style@latex, #1}}{}
\colorlet    {    at@guard } { njuviolet }
\definecolor { angle@guard } { gray } { 0.7 }
\definecolor {  star@guard } { rgb  } { 0.8 , 0 , 0 }
\definecolor { u@guard } { HTML } { 5463FF }
\definecolor { g@guard } { HTML } { 2B7A0B }
\definecolor { p@guard } { HTML } { FF1818 }
\definecolor { c@guard } { HTML } { FFC300 }
\prop_const_from_keyval:Nn \c__njudoc_module_color_prop
  {
    def-u = u@guard,
    def-g = g@guard,
    def-p = p@guard
  }
\cs_new:Npn \__njudoc_set_module_color:Nn #1#2
  {
    \prop_get:NnNF \c__njudoc_module_color_prop {#2} #1
      { \tl_set:Nn #1 { c@guard } }
    \exp_args:NV \color #1 #2
  }
\cs_new:Npn \__njudoc_set_module_color:n
  { \__njudoc_set_module_color:Nn \l_tmpa_tl }
\cs_new_protected:Npn \__njudoc_module_angle:Nn #1#2
  {
    \group_begin: \color { angle@guard }    \ttfamily \textlangle \group_end:
    \group_begin: \sffamily #2 \group_end:
    \group_begin: \color { angle@guard } #1 \ttfamily \textrangle \group_end:
  }
\cs_set:Npn \__ctxdoc_module_angle:n
  { \__njudoc_module_angle:Nn \c_empty_tl }
\cs_new_protected:Npn \__njudoc_colored_module_angle:NN #1#2
  {
    \seq_clear:N #2
    \seq_map_inline:Nn #1
      {
        \seq_gput_right:Nn #2
          { \__njudoc_set_module_color:n {##1} }
      }
  }
\cs_new_protected:Npn \__njudoc_print_module:n #1
  {
    \__njudoc_colored_module_angle:NN \l_tmpa_seq \l_tmpb_seq
    \bool_lazy_or:nnTF
      { \str_if_empty_p:n {#1} }
      { \int_compare_p:n { \seq_count:N \l_tmpb_seq = 1 } }
      {
        \str_clear:N \l_tmpa_str
        \str_clear:N \l_tmpb_str
      }
      {
        \str_set:Nn  \l_tmpa_str { ( }
        \str_set:Nn  \l_tmpb_str { ) }
      }
    \__njudoc_module_angle:Nn \l_tmpb_str
      {
        \color { star@guard  } #1
        \color { angle@guard } \l_tmpa_str
        \seq_use:Nn \l_tmpb_seq
          { \color { angle@guard } \orbar }
      }
  }
\cs_new:Npn \__njudoc_split_pm:n
  { \seq_set_split:Nnn \l_tmpa_seq { | } }
\cs_generate_variant:Nn \__njudoc_split_pm:n { V }
\cs_new_protected_nopar:Npn \__njudoc_split_m:n #1
  {
    \tl_set:Nn \l_tmpa_str {#1}
    \clist_map_inline:nn { *, /, (, ) }
      { \str_remove_all:Nn \l_tmpa_str {##1} }
    \__njudoc_split_pm:V \l_tmpa_str
  }
\group_begin:
  \char_set_catcode_active:N \>
  \cs_gset_protected:Npn \__ctxdoc_module_star:w #1 > #2 \q_stop
    {
      \__ctxdoc_output_module:nn
        { \__njudoc_split_m:n {#1} }
        { \__ctxdoc_module_push:n { \__njudoc_print_module:n { * } } }
      \__ctxdoc_output_line:n {#2}
      \__ctxdoc_star_format:
    }
  \cs_gset_protected:Npn \__ctxdoc_module_slash:w #1 > #2 \q_stop
    {
      \__ctxdoc_output_module:nn
        { \__njudoc_split_m:n {#1} }
        { \__ctxdoc_module_pop:n { \__njudoc_print_module:n { / } } }
      \__ctxdoc_output_line:n {#2}
      \__ctxdoc_slash_format:
    }
  \cs_gset_protected:Npn \__ctxdoc_module_pm:w #1 > #2 \q_stop
    {
      \tex_noindent:D
      \hbox_overlap_left:n
        {
          \__ctxdoc_output_module:nn
            { \__njudoc_split_pm:n {#1} }
            { \__njudoc_print_module:n { } }
          \skip_horizontal:n { \leftskip + \smallskipamount }
        }
      \group_begin:
        \__ctxdoc_pm_format:
        \__ctxdoc_output_line:n {#2}
      \group_end:
    }
\group_end:
\NewDocumentCommand \grd { m }
  { \__ctxdoc_module_angle:n { \color { njuviolet } #1 } }
\NewDocumentCommand \sgrd { m }
  { \__ctxdoc_module_angle:n { \color { star@guard } * \color{ c@guard } #1 } }
\NewDocumentCommand \pgrd { m }
  { \__ctxdoc_module_angle:n { \color { #1 @guard } def- #1 } }
\cs_if_exist:NT \__codehigh_parse_code:nN
  { \cs_set_eq:NN \__cdhh_parse_code:nN \__codehigh_parse_code:nN }
\cs_set_protected_nopar:Npn \__njudoc_output_line:N #1
  {
    \tex_noindent:D
    \__ctxdoc_replace_at_at:N #1
    \__cdhh_parse_code:nN { latex / latex3 } #1
    \tex_par:D
  }
\bool_if:NT \g__njudoc_codehigh_bool
  {
    \cs_set:Npn \__ctxdoc_output_line:
      { \__njudoc_output_line:N \l__ctxdoc_verbatim_line_tl }
  }
\endinput
%%
%% End of file `njuthesis-doc.cls'.
