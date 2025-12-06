%%
%% This is file `sjtuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sjtutex.dtx  (with options: `class,thesis')
%% 
%%     Copyright (C) SJTUG
%%       2018--2025 Weijian Wu   <alexarawu@outlook.com>
%%       2022--2025 Zilong Li    <logcreative@outlook.com>
%%       2024--2025 Boshi Yuan   <nemoyuan2008@outlook.com>
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. The latest version of this license is in:
%% 
%%       http://www.latex-project.org/lppl.txt
%% 
%%     and version 1.3 or later is part of all distributions of
%%     LaTeX version 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[2024-06-01]
\providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}
\IfFormatAtLeastTF{2024-06-01}{}
 {\PackageError{sjtutex}
   {Your LaTeX format is outdated!\MessageBreak\MessageBreak
    Release '2024-06-01' or newer is required to\MessageBreak
    compile this document.\MessageBreak\MessageBreak
    Please update your TeX distribution}{}}
\GetIdInfo$Id: sjtutex.dtx 24e1ee7 2025-03-29 01:12:32 +0800 Alexara Wu <alexarawu@outlook.com> $
  {Thesis document class for Shanghai Jiao Tong University (SJTUTeX)}
\ProvidesExplClass{sjtuthesis}
  {\ExplFileDate}{2.2.1}{\ExplFileDescription}
\msg_new:nnn { sjtutex } { unsupported-engine }
  {
    The~sjtutex~classes~does~NOT~support~'#1'~engine. \\\\
    Please~set~your~typesetting~program~to~either~
    'xelatex'~or~'lualatex'.
  }
\bool_lazy_any:nF
  {
    { \sys_if_engine_xetex_p:  }
    { \sys_if_engine_luatex_p: }
    { \sys_if_engine_pdftex_p: }
  }
  { \msg_fatal:nnV { sjtutex } { unsupported-engine } \c_sys_engine_str }
\tl_new:N \l__sjtu_tmp_tl
\clist_new:N \l__sjtu_tmp_clist
\box_new:N \l__sjtu_tmp_box
\cs_generate_variant:Nn \clist_use:Nn { Nv, cv }
\exp_args_generate:n { Nnv }
\cs_generate_variant:Nn \exp_last_unbraced:Ne { ce }
\cs_new_protected:Npn \__sjtu_conditional_const:nn #1#2
  {
    \bool_if:nTF {#2}
      {
        \cs_new_eq:cN { __sjtu_if_ #1 :T  } \use:n
        \cs_new_eq:cN { __sjtu_if_ #1 :F  } \use_none:n
        \cs_new_eq:cN { __sjtu_if_ #1 :TF } \use_i:nn
        \cs_new_eq:cN { __sjtu_if_ #1 _p: } \c_true_bool
      }
      {
        \cs_new_eq:cN { __sjtu_if_ #1 :T  } \use_none:n
        \cs_new_eq:cN { __sjtu_if_ #1 :F  } \use:n
        \cs_new_eq:cN { __sjtu_if_ #1 :TF } \use_ii:nn
        \cs_new_eq:cN { __sjtu_if_ #1 _p: } \c_false_bool
      }
  }
\__sjtu_conditional_const:nn { engine_opentype }
  {
    \bool_lazy_or_p:nn
      { \sys_if_engine_xetex_p:  }
      { \sys_if_engine_luatex_p: }
  }
\msg_new:nnn { sjtutex } { package-disabled }
  { The~loading~of~package~'#1'~is~disabled. }
\cs_new_protected:Npn \__sjtu_disable_package_load:n #1
  {
    \disable@package@load {#1}
      { \msg_warning:nnn { sjtutex } { package-disabled } {#1} }
  }
\cs_new:Npn \__sjtu_dim_set_to_wd:Nn #1#2
  {
    \hbox_set:Nn \l__sjtu_tmp_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__sjtu_tmp_box }
  }
\cs_generate_variant:Nn \__sjtu_dim_set_to_wd:Nn { Nv }
\cs_new_protected:Npn \__sjtu_cs_provide_eq:NN #1#2
  { \cs_if_exist:NF #1 { \cs_set_eq:NN #1 #2 } }
\cs_generate_variant:Nn \__sjtu_cs_provide_eq:NN { cc }
\cs_new_protected:Npn \__sjtu_name_set:nnn #1#2#3
  { \tl_set:cn   { l__sjtu_name_ #2 _ #1 _tl } {#3} }
\cs_new_protected:Npn \__sjtu_name_const:nnn #1#2#3
  { \tl_const:cn { c__sjtu_name_ #2 _ #1 _tl } {#3} }
\cs_new_protected:Npn \__sjtu_name_const_from_clist:nnnn #1#2#3#4
  { \tl_const:ce { c__sjtu_name_ #2 _ #1 _tl } { \clist_item:nn {#4} {#3} } }
\int_new:N \g__sjtu_thesis_type_int
\tl_new:N \g__sjtu_lang_tl
\clist_set:Nn \g__sjtu_lang_clist { zh, en }
\dim_new:N \g__sjtu_baseline_skip_dim
\bool_new:N \g__sjtu_fixed_baselineskip_bool
\tl_new:N \g__sjtu_text_font_tl
\tl_new:N \g__sjtu_math_font_tl
\tl_new:N \g__sjtu_cjk_font_tl
\bool_new:N \g__sjtu_slanted_uppercase_greek_bool
\bool_new:N \g__sjtu_upright_integral_bool
\bool_new:N \g__sjtu_integral_limits_bool
\clist_new:N \g__sjtu_math_font_options_clist
\bool_new:N \g__sjtu_review_bool
\clist_set:Nn \g__sjtu_options_to_ctex_class_clist
  {
    UTF8,
    zihao = -4,
    scheme = plain,
    fontset = none
  }
\clist_set:Nn \g__sjtu_options_to_packages_clist
  {
    { no-math           } { fontspec     } ,
    { list = off        } { bicaption    } ,
    { warnings-off =
      {
        mathtools-overbracket,
        mathtools-colon
      }
    }                     { unicode-math } ,
    { chapter           } { algorithm    } ,
    { algochapter       } { algorithm2e  } ,
    { amsmath, thmmarks } { ntheorem     }
  }
\msg_new:nnn { sjtutex } { deprecated-option }
  { Option~'\l_keys_key_str'~is~deprecated! \\ #1 }
\cs_new_protected:Npn \__sjtu_set_deprecated_option:n #1
  {
    \msg_warning:nnn { sjtutex } { deprecated-option } { Option~'#1'~is~set. }
    \keys_set:nn { sjtu / option } {#1}
  }
\msg_new:nnn { sjtutex } { unsupported-option }
  { Option~'\l_keys_key_str'~is~not~supported! \\ Will~be~ignored. }
\keys_define:nn { sjtu / option }
  {
    type .choice: ,
    type .value_required:n = true ,
    type .choices:nn =
      { bachelor, master, doctor }
      { \int_gset_eq:NN \g__sjtu_thesis_type_int \l_keys_choice_int } ,
    type .initial:n = { master } ,
    lang .choice: ,
    lang .value_required:n = true ,
    lang .choices:nn =
      { zh, en, de, ja }
      {
        \tl_gset_eq:NN \g__sjtu_lang_tl \l_keys_choice_tl
        \clist_if_in:NnF \g__sjtu_lang_clist {#1}
          { \clist_gput_right:Nn \g__sjtu_lang_clist {#1} }
      } ,
    lang .initial:n = { zh } ,
    baselineskip .choice: ,
    baselineskip .value_required:n = true ,
    baselineskip / false   .code:n =
      { \bool_gset_false:N \g__sjtu_fixed_baselineskip_bool } ,
    baselineskip / unknown .code:n =
      {
        \bool_gset_true:N  \g__sjtu_fixed_baselineskip_bool
        \dim_gset:Nn \g__sjtu_baseline_skip_dim {#1}
      } ,
    baselineskip .initial:n = { 20 bp } ,
    text-font .tl_gset:N = \g__sjtu_text_font_tl ,
    text-font .initial:n = { newtx } ,
    math-font .tl_gset:N = \g__sjtu_math_font_tl ,
    cjk-font  .tl_gset:N = \g__sjtu_cjk_font_tl ,
    fontset    .code:n = { \__sjtu_set_deprecated_option:n { cjk-font = #1 } } ,
    nofonts    .code:n = { \__sjtu_set_deprecated_option:n { cjk-font = none } } ,
    adobefonts .code:n = { \__sjtu_set_deprecated_option:n { cjk-font = adobe } } ,
    winfonts   .code:n = { \__sjtu_set_deprecated_option:n { cjk-font = windows } } ,
    math-style .choice: ,
    math-style .value_required:n = true,
    math-style / TeX .code:n =
      {
        \bool_gset_false:N \g__sjtu_slanted_uppercase_greek_bool
        \bool_gset_false:N \g__sjtu_upright_integral_bool
        \bool_gset_false:N \g__sjtu_integral_limits_bool
      } ,
    math-style / ISO .code:n =
      {
        \bool_gset_true:N \g__sjtu_slanted_uppercase_greek_bool
        \bool_gset_true:N \g__sjtu_upright_integral_bool
        \bool_gset_true:N \g__sjtu_integral_limits_bool
      } ,
    math-style .initial:n = { ISO } ,
    uppercase-greek .choice: ,
    uppercase-greek .value_required:n = true ,
    uppercase-greek / slanted .code:n =
      { \bool_gset_true:N  \g__sjtu_slanted_uppercase_greek_bool } ,
    uppercase-greek / upright .code:n =
      { \bool_gset_false:N \g__sjtu_slanted_uppercase_greek_bool } ,
    integral .choice: ,
    integral .value_required:n = true ,
    integral / slanted .code:n =
      { \bool_gset_false:N \g__sjtu_upright_integral_bool } ,
    integral / upright .code:n =
      { \bool_gset_true:N  \g__sjtu_upright_integral_bool } ,
    integral-limits .choice: ,
    integral-limits .value_required:n = true ,
    integral-limits / false .code:n =
      { \bool_gset_false:N \g__sjtu_integral_limits_bool } ,
    integral-limits / true  .code:n =
      { \bool_gset_true:N  \g__sjtu_integral_limits_bool } ,
    review .bool_gset:N = \g__sjtu_review_bool ,
    review .initial:n = false ,
    unknown .code:n =
      { \clist_gput_right:No \g__sjtu_options_to_ctex_class_clist { \CurrentOption } }
  }
\clist_map_inline:nn
  { GBK, scheme, cap, nocap }
  {
    \keys_define:nn { sjtu / option }
      {
        #1 .code:n =
          { \msg_warning:nn { sjtutex } { unsupported-option } }
      }
  }
\ProcessKeyOptions [ sjtu / option ]
\__sjtu_conditional_const:nn { main_lang_de }
  { \str_if_eq_p:Vn \g__sjtu_lang_tl { de } }
\__sjtu_conditional_const:nn { main_lang_ja }
  { \str_if_eq_p:Vn \g__sjtu_lang_tl { ja } }
\bool_if:NT \g__sjtu_slanted_uppercase_greek_bool
  { \clist_put_right:Nn \g__sjtu_math_font_options_clist { slantedGreek } }
\bool_if:NT \g__sjtu_upright_integral_bool
  { \clist_put_right:Nn \g__sjtu_math_font_options_clist { upint } }
\clist_put_left:Nn \@classoptionslist { a4paper }
\__sjtu_if_main_lang_de:T
  { \clist_put_right:Nn \@classoptionslist { german, ngerman } }
\bool_if:NTF \g__sjtu_integral_limits_bool
  {
    \clist_put_right:Nn \@classoptionslist { intlimits }
    \clist_put_right:Nn \g__sjtu_options_to_packages_clist
      { { displaylimits } { cmupint } }
  }
  {
    \clist_put_right:Nn \g__sjtu_options_to_packages_clist
      { { nolimits      } { cmupint } }
  }
\clist_concat:NNN \@classoptionslist
  \@classoptionslist \g__sjtu_math_font_options_clist
\cs_set_protected:Npe \__sjtu_setup:n
  {
    \bool_if:NTF \g__sjtu_review_bool
      { \exp_not:N \keys_set_exclude_groups:nnn { sjtu } { sensitive } }
      { \exp_not:N \keys_set:nn { sjtu } }
  }
\exp_args:No \PassOptionsToClass
  { \g__sjtu_options_to_ctex_class_clist }
  { ctexbook }
\clist_map_inline:Nn \g__sjtu_options_to_packages_clist
  { \PassOptionsToPackage #1 }
\LoadClass { ctexbook }
\RequirePackage
  {
    array,
    mathtools,
    geometry,
    fancyhdr,
    titletoc,
    caption,
    bicaption,
    subcaption,
    graphicx,
    enumitem
  }
\normalsize
\cs_set_protected:Npe \SJTU@orig@normalsize
  { \exp_not:N \fontsize { \f@size } { \f@baselineskip } \exp_not:N \selectfont }
\msg_new:nnn { sjtutex } { baselineskip-invalid }
  { Invalid~baselineskip~value~'#1'! \\ Using~default~value~instead. }
\cs_new_protected:Npn \__sjtu_set_font_size:nnNn #1#2#3#4
  { \cs_set_protected:Npn #3 { \@setfontsize #3 {#1} {#2} #4 } }
\bool_if:NT \g__sjtu_fixed_baselineskip_bool
  {
    \dim_compare:nNnTF { \f@size pt } > { \g__sjtu_baseline_skip_dim }
      {
        \msg_warning:nne { sjtutex } { baselineskip-invalid }
          { \dim_to_decimal:n { \g__sjtu_baseline_skip_dim } pt }
      }
      {
        \tl_set:Ne \l__sjtu_font_size_tl
          { { \f@size } { \dim_to_decimal:n { \g__sjtu_baseline_skip_dim } } }
        \int_case:nn { \@ptsize }
          {
            { 0 }
              {
                \exp_after:wN \__sjtu_set_font_size:nnNn \l__sjtu_font_size_tl
                  \normalsize
                  {
                    \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
                    \abovedisplayshortskip \z@ \@plus3\p@
                    \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
                    \belowdisplayskip \abovedisplayskip
                    \let\@listi\@listI
                  }
              }
            { 1 }
              {
                \exp_after:wN \__sjtu_set_font_size:nnNn \l__sjtu_font_size_tl
                  \normalsize
                  {
                    \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
                    \abovedisplayshortskip \z@ \@plus3\p@
                    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
                    \belowdisplayskip \abovedisplayskip
                    \let\@listi\@listI
                  }
              }
            { 2 }
              {
                \exp_after:wN \__sjtu_set_font_size:nnNn \l__sjtu_font_size_tl
                  \normalsize
                  {
                    \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
                    \abovedisplayshortskip \z@ \@plus3\p@
                    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
                    \belowdisplayskip \abovedisplayskip
                    \let\@listi\@listI
                  }
              }
          }
        \normalsize
      }
  }
\NewDocumentCommand \setbaselineskip { m }
  { \fontsize { \f@size } {#1} \selectfont }
\msg_new:nnn { sjtutex } { font-unavailable }
  { '#1-font~=~#2'~is~unavailable~in~current~mode. }
\cs_new_protected:Npn \__sjtu_fontset_error:nn #1#2
  { \msg_critical:nnnn { sjtutex } { font-unavailable } {#1} {#2} }
\cs_set_protected:Npn \ctex_fontset_error:n #1
  { \msg_critical:nnnn { sjtutex } { font-unavailable } { cjk } {#1} }
\cs_new_protected:Nn \__sjtu_declare_math_symbol:nnNn
  {
    \cs_undefine:N #3
    \DeclareMathSymbol {#3} {#1} {#2} {#4}
  }
\cs_new_protected:Nn \__sjtu_set_slanted_greek:
  {
    \clist_const:Nn \c__sjtu_uppercase_greek_clist
      { Gamma, Delta, Theta, Lambda, Xi, Pi, Sigma, Upsilon, Phi, Psi, Omega }
    \clist_map_inline:Nn \c__sjtu_uppercase_greek_clist
      {
        \cs_set_eq:cc { up ##1 } {     ##1 }
        \cs_set_eq:cc { it ##1 } { var ##1 }
      }
    \bool_if:NT \g__sjtu_slanted_uppercase_greek_bool
      {
        \clist_map_inline:Nn \c__sjtu_uppercase_greek_clist
          { \cs_set_eq:cc { ##1 } { it ##1 } }
      }
  }
\cs_new_protected:Nn \__sjtu_set_unimath_symbol:
  {
    \clist_map_inline:nn
      {
        { increment } { upDelta     } ,
        { QED       } { blacksquare }
      }
      { \__sjtu_cs_provide_eq:cc ##1 }
  }
\tl_if_empty:NT \g__sjtu_math_font_tl
  { \tl_gset_eq:NN \g__sjtu_math_font_tl \g__sjtu_text_font_tl }
\tl_if_empty:NT \g__sjtu_cjk_font_tl
  {
    \sys_if_platform_windows:TF
      { \tl_gset:Nn \g__sjtu_cjk_font_tl { windows } }
      {
        \ctex_if_platform_macos:TF
          { \tl_gset:Nn \g__sjtu_cjk_font_tl { mac    } }
          { \tl_gset:Nn \g__sjtu_cjk_font_tl { fandol } }
      }
  }
\msg_new:nnn { sjtutex } { invalid-font }
  {
    Invalid~value~'#1-font~=~\tl_use:c { g__sjtu_ #1 _font_tl }'! \\
    Using~'#2'~instead.
  }
\cs_new_protected:Npn \__sjtu_load_font:nn #1#2
  {
    \str_if_eq:vnF { g__sjtu_ #1 _font_tl } { none }
      {
        \file_if_exist:nF
          { sjtu- #1 -font- \tl_use:c { g__sjtu_ #1 _font_tl } .def }
          {
            \msg_warning:nnnn { sjtutex } { invalid-font } {#1} {#2}
            \tl_gset:cn { g__sjtu_ #1 _font_tl } {#2}
          }
        \ctex_file_input:n
          { sjtu- #1 -font- \tl_use:c { g__sjtu_ #1 _font_tl } .def }
      }
  }
\cs_new_protected:Nn \__sjtu_load_fontset:
  {
    \clist_map_inline:nn
      {
        { math } { newtx  },
        { text } { newtx  },
        { cjk  } { fandol }
      }
      { \__sjtu_load_font:nn ##1 }
  }
\@onlypreamble \__sjtu_load_font:nn
\@onlypreamble \__sjtu_load_fontset:
\ctex_at_end_package:nn { unicode-math }
  {
    \DeclareDocumentCommand \bm { m }
      { { \symbf {#1} } }
    \DeclareDocumentCommand \boldsymbol { m }
      { { \symbf {#1} } }
    \bool_if:NTF \g__sjtu_slanted_uppercase_greek_bool
      { \keys_set:nn { unicode-math } { math-style = ISO } }
      { \keys_set:nn { unicode-math } { math-style = TeX } }
    \bool_if:NTF \g__sjtu_integral_limits_bool
      { \removenolimits } { \addnolimits }
      {
        \int\iint\iiint\iiiint\oint\oiint\oiiint
        \intclockwise\varointclockwise\ointctrclockwise\sumint
        \intbar\intBar\fint\cirfnint\awint\rppolint
        \scpolint\npolint\pointint\sqint\intlarhk\intx
        \intcap\intcup\upint\lowint
      }
    \clist_map_inline:nn
      { amsfonts, amssymb, bm, upgreek }
      { \__sjtu_disable_package_load:n {#1} }
  }
\ctex_at_end_preamble:n
  {
    \IfPackageLoadedF { unicode-math }
      {
        \RequirePackage { bm }
        \cs_if_exist:NF \uppi
          { \RequirePackage { upgreek  } }
        \cs_if_exist:NF \checkmark
          { \RequirePackage { amsfonts } }
      }
  }
\NewDocumentCommand \CJKrmfamily { } { \CJKfamily { \CJKrmdefault } }
\NewDocumentCommand \CJKsffamily { } { \CJKfamily { \CJKsfdefault } }
\NewDocumentCommand \CJKttfamily { } { \CJKfamily { \CJKttdefault } }
\sys_if_engine_xetex:T
  {
    \xeCJK_declare_char_class:nn { CJK }
      { "24EA, "2460->"2473, "3251->"32BF, "25A1 }
  }
\sys_if_engine_luatex:T
  {
    \ltjdefcharrange { 99 }
      { "24EA, "2460- "2473, "3251- "32BF, "25A1 }
    \ltjsetparameter { jacharrange = { +99 } }
  }
\sys_if_engine_pdftex:TF
  {
    \cs_new:Npn \__sjtu_unicode_char:n #1
      {
        \exp_not:N \Unicode
          { \int_div_truncate:nn {#1} { 256 } }
          { \int_mod:nn          {#1} { 256 } }
      }
  }
  { \cs_new:Npn \__sjtu_unicode_char:n #1 { \tex_Uchar:D #1 \scan_stop: } }
\cs_new_protected:Npn \__sjtu_symbol_const:nn #1#2
  { \tl_const:ce { c__sjtu_symbol_ #1 _tl } { \__sjtu_unicode_char:n {#2} } }
\__sjtu_load_fontset:
\keys_define:nn { sjtu / name }
  {
    contents        .meta:nn = { ctex } { contentsname   = {#1} } ,
    listfigure      .meta:nn = { ctex } { listfigurename = {#1} } ,
    listtable       .meta:nn = { ctex } { listtablename  = {#1} } ,
    figure          .meta:nn = { ctex } { figurename     = {#1} } ,
    table           .meta:nn = { ctex } { tablename      = {#1} } ,
    index           .meta:nn = { ctex } { indexname      = {#1} } ,
    appendix        .meta:nn = { ctex } { appendixname   = {#1} } ,
    proof           .meta:nn = { ctex } { proofname      = {#1} } ,
    bib             .meta:nn = { ctex } { bibname        = {#1} } ,
    part           .tl_set:N = \partname ,
    chapter        .tl_set:N = \chaptername ,
    figure*        .tl_set:N = \SJTU@figurename@bi@second ,
    figure*       .initial:n = { 图 } ,
    table*         .tl_set:N = \SJTU@tablename@bi@second ,
    table*        .initial:n = { 表 } ,
    algorithm      .tl_set:N = \SJTU@algorithmname ,
    algorithm     .initial:n = { Algorithm } ,
    listalgorithm  .tl_set:N = \SJTU@listalgorithmname ,
    listalgorithm .initial:n = { List~of~Algorithms } ,
    abbr           .tl_set:N = \SJTU@abbrname ,
    abbr          .initial:n = { Abbreviations } ,
    nom            .tl_set:N = \SJTU@nomname ,
    nom           .initial:n = { Nomenclature } ,
    ack            .tl_set:N = \SJTU@ackname ,
    ack           .initial:n = { Acknowledgements } ,
    resume         .tl_set:N = \SJTU@resumename ,
    resume        .initial:n = { Resume } ,
    digest         .tl_set:N = \SJTU@digestname ,
    digest        .initial:n = { Digest } ,
    achv           .tl_set:N = \SJTU@achvname ,
    achv          .initial:n = { List~of~Research~Achievements },
  }
\geometry
  {
    vmargin       = { 3.5 cm , 4.0 cm } ,
    hmargin       = 2.5 cm ,
    bindingoffset = 0.5 cm ,
    headheight    = 1.5 cm ,
    headsep       = 0.5 cm ,
    footskip      = 1.0 cm
  }
\AtEndOfClass { \raggedbottom }
\pagestyle { fancy }
\fancyhf { }
\keys_define:nn { sjtu / style }
  {
    header-font  .tl_set:N = \l__sjtu_style_header_font_tl ,
    header-font .initial:n = \zihao { -5 } \setbaselineskip { 12 bp } ,
    footer-font  .tl_set:N = \l__sjtu_style_footer_font_tl ,
    footer-font .initial:n = \zihao { -5 } \setbaselineskip { 12 bp }
  }
\fancyheadinit { \l__sjtu_style_header_font_tl }
\fancyfootinit { \l__sjtu_style_footer_font_tl }
\keys_define:nn { sjtu / style }
  {
    header-uppercase       .choice: ,
    header-uppercase / true  .code:n =
      { \cs_set_eq:NN \__sjtu_nouppercase:n \use:n                 } ,
    header-uppercase / false .code:n =
      { \cs_set:Nn    \__sjtu_nouppercase:n { \nouppercase {##1} } } ,
    header-uppercase      .default:n = { true  } ,
    header-uppercase      .initial:n = { false }
  }
\cs_generate_variant:Nn \__sjtu_nouppercase:n { V }
\tl_set:Nn \__sjtu_the_page_tl { \thepage }
\tl_new:N \__sjtu_the_last_page_tl
\msg_new:nnn { sjtutex } { require-pageslts }
  {
    Add~'\token_to_str:N \usepackage{pageslts}'~in~your~preamble \\
    to~enable~the~page~number~of~the~last~page.
  }
\keys_define:nn { sjtu / style }
  {
    page-number    .code:n =
      {
        \regex_match:nnT { \#2 } { #1 }
          {
            \ctex_if_preamble:TF
              { \RequirePackage { pageslts } }
              {
                \IfPackageLoadedF { pageslts }
                  { \msg_warning:nn { sjtutex } { require-pageslts } }
              }
          }
        \cs_set:Nn \__sjtu_page:nn { #1 }
      } ,
    page-number .initial:n = { {#1} }
  }
\tl_set:Nn \l__sjtu_header_tl
  {
    { \songti \l__sjtu_info_subject_zh_tl }
  }
\tl_set:Nn \l__sjtu_leftmark_tl  { \leftmark }
\tl_set:Nn \l__sjtu_rightmark_tl { \leftmark }
\legacy_if:nTF { @twoside }
  {
    \fancyhead [ LO, RE ] { \l__sjtu_header_tl }
    \fancyhead [ LE ]     { \__sjtu_nouppercase:V \l__sjtu_leftmark_tl  }
    \fancyhead [ RO ]     { \__sjtu_nouppercase:V \l__sjtu_rightmark_tl }
  }
  {
    \fancyhead [ L ] { \l__sjtu_header_tl }
    \fancyhead [ R ] { \__sjtu_nouppercase:V \l__sjtu_rightmark_tl }
  }
\fancyfoot [ C ]
  { \__sjtu_page:nn { \__sjtu_the_page_tl } { \__sjtu_the_last_page_tl } }
\tl_set:Nn \headrule
  {
    \hrule height 2.25 pt width \headwidth
    \skip_vertical:n {  0.75 pt }
    \hrule height 0.75 pt width \headwidth
    \skip_vertical:n { -3.75 pt }
  }
\cs_new_eq:NN \ps@SJTU@null \prg_do_nothing:
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \legacy_if:nT { @twoside }
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
  }
\pagenumbering { Alph }
\RenewDocumentCommand \frontmatter { }
  {
    \cleardoublepage
    \@mainmatterfalse
    \pagenumbering { Roman }
  }
\ctex_set:nn { chapter }
  {
    pagestyle   = SJTU@null ,
    fixskip     = true ,
    beforeskip  = 27 bp ,
    afterskip   = 27 bp ,
    format      = \zihao { 3 } \setbaselineskip{ 20 bp } \bfseries
                  \CJKsffamily \centering ,
    nameformat  = ,
    titleformat = ,
    lofskip     = \c_zero_skip ,
    lotskip     = \c_zero_skip ,
    aftername   = \quad
  }
\ctex_set:nn { section }
  {
    beforeskip  = 24 bp ,
    afterskip   =  6 bp ,
    format      = \zihao { 4 } \setbaselineskip { 18 bp } \bfseries
                  \CJKsffamily
  }
\ctex_set:nn { subsection }
  {
    beforeskip  = 12 bp ,
    afterskip   =  6 bp ,
    format      = \zihao { -4 } \setbaselineskip { 16 bp } \bfseries
                  \CJKsffamily
  }
\ctex_set:nn { subsubsection }
  {
    beforeskip  =  6 bp ,
    afterskip   =  6 bp ,
    format      = \zihao { -4 } \setbaselineskip { 16 bp } \normalfont
  }
\ctex_set:n { secnumdepth = 3 }
\keys_define:nn { sjtu / style }
  {
    indent-first    .choice: ,
    indent-first   .choices:nn =
      { true, false }
      {
        \clist_map_inline:nn
          {
            chapter,
            section, subsection, subsubsection,
            paragraph, subparagraph
          }
          { \ctex_set:nn {####1} { afterindent = #1 } }
      } ,
    indent-first   .default:n = { true } ,
    indent-first   .initial:n = { true }
  }
\cs_new_eq:NN \__sjtu_pdf_bookmark:nn \use_none:nn
\cs_new_eq:NN \__sjtu_phantom_section: \prg_do_nothing:
\setlist { nosep }
\keys_define:nn { sjtu / style }
  {
    equation-font  .tl_set:N = \SJTU@style@equation@font ,
    equation-font .initial:n = \linespread { } \SJTU@orig@normalsize
  }
\clist_map_inline:nn
  {
    array, matrix, pmatrix, bmatrix, Bmatrix, vmatrix, Vmatrix,
    matrix*, pmatrix*, bmatrix*, Bmatrix*, vmatrix*, Vmatrix*,
    cases, cases*, dcases, dcases*, rcases, rcases*, drcases, drcases*,
    aligned, alignedat, gathered, multlined, lgathered, rgathered
  }
  { \AtBeginEnvironment {#1} { \SJTU@style@equation@font } }
\clist_map_inline:nn
  { \start@gather, \start@align, \start@multline }
  {
    \ctex_patch_cmd:Nnn #1
      { \collect@body }
      {
        \SJTU@style@equation@font
        \collect@body
      }
  }
\ctex_patch_cmd:Nnn \gather@split
  { \spread@equation }
  {
    \SJTU@style@equation@font
    \spread@equation
  }
\keys_define:nn { sjtu / style }
  {
    theorem-header-font  .tl_set:N = \SJTU@style@thm@header@font ,
    theorem-header-font .initial:n = \bfseries \CJKsffamily ,
    theorem-body-font    .tl_set:N = \SJTU@style@thm@body@font ,
    theorem-body-font   .initial:n = \normalfont ,
  }
\tl_set:Nn \textfraction      { 0.15 }
\tl_set:Nn \topfraction       { 0.85 }
\tl_set:Nn \bottomfraction    { 0.65 }
\tl_set:Nn \floatpagefraction { 0.60 }
\keys_define:nn { sjtu / style }
  {
    float-font  .tl_set:N = \SJTU@style@float@font ,
    float-font .initial:n = \zihao { 5 } \setbaselineskip { 14 bp }
  }
\ctex_patch_cmd:Nnn \@floatboxreset
  { \normalsize } { \SJTU@style@float@font }
\keys_define:nn { sjtu / style }
  {
    caption-font       .code:n =
      { \DeclareCaptionFont { normalsize    } {#1} } ,
    caption-font    .initial:n = \zihao { 5 } \setbaselineskip { 14 bp }
                                 \bfseries ,
    subcaption-font    .code:n =
      { \DeclareCaptionFont { SJTU@sub@font } {#1} } ,
    subcaption-font .initial:n = \zihao { 5 } \setbaselineskip { 14 bp }
                                 \normalfont
  }
\captionsetup
  {
    bi-slc   = off ,
    labelsep = quad ,
    skip     = 6 bp
  }
\captionsetup [ sub ]
  {
    bi-slc   = on ,
    font     = SJTU@sub@font ,
    format   = hang
  }
\DeclareCaptionOption { bi-second-names } [ ]
  {
    \tl_set:Nn \figurename { \SJTU@figurename@bi@second }
    \tl_set:Nn \tablename  { \SJTU@tablename@bi@second  }
  }
\captionsetup [ bi-second ] { bi-second-names }
\keys_define:nn { sjtu / style }
  {
    num-sep            .code:n =
      {
        \tl_set:Nn \SJTU@style@fl@num@sep {#1}
        \tl_set:Nn \SJTU@style@eq@num@sep {#1}
        \tl_set:Nn \@thmcountersep        {#1}
      } ,
    num-sep         .initial:n = { . } ,
    float-num-sep    .tl_set:N = \SJTU@style@fl@num@sep ,
    equation-num-sep .tl_set:N = \SJTU@style@eq@num@sep ,
    theorem-num-sep  .tl_set:N = \@thmcountersep
  }
\NewDocumentCommand \SJTU@counterwithin
  { s O{ \SJTU@style@fl@num@sep } O{ \arabic } m m }
  {
    \@ifbothcounters {#4} {#5}
      {
        \@addtoreset {#4} {#5}
        \IfBooleanF {#1}
          {
            \exp_args:Nco \cs_gset:Npn { the #4 }
              { \cs:w the #5 \cs_end: #2 #3 {#4} }
          }
      }
  }
\SJTU@counterwithin { figure } { chapter }
\SJTU@counterwithin { table  } { chapter }
\SJTU@counterwithin [ \SJTU@style@eq@num@sep ] { equation } { chapter }
\clist_set:Nn \l__sjtu_counter_without_chapter_clist
  { section, figure, table, equation }
\msg_new:nnn { sjtutex } { circled-number-exceed }
  { Circled~number~exceed~50! }
\cs_new:Npn \__sjtu_circled_number:N #1
  {
    \int_compare:nNnTF {#1} < { 21 }
      { \__sjtu_unicode_char:n { \int_eval:n { "2460 - 1 + #1 } } }
      {
        \int_compare:nNnTF {#1} < { 36 }
          { \__sjtu_unicode_char:n { \int_eval:n { "3251 - 21 + #1 } } }
          {
            \int_compare:nNnTF {#1} < { 51 }
              { \__sjtu_unicode_char:n { \int_eval:n { "32B1 - 36 + #1 } } }
              {
                \msg_warning:nn { sjtutex } { circled-number-exceed }
                \int_to_arabic:n {#1}
              }
          }
      }
  }
\keys_define:nn { sjtu / style }
  {
    fnmark-font           .choice: ,
    fnmark-font / haranoaji .code:n =
      {
        \__sjtu_if_engine_opentype:TF
          {
            \tl_set:Nn \l__sjtu_style_fnmark_font_tl
              {
                \CJKfontspec { HaranoAjiMincho }
                  [
                    Extension   = .otf ,
                    UprightFont = *-Regular ,
                    BoldFont    = *-Bold
                  ]
              }
          }
          { \tl_set_eq:NN \l__sjtu_style_fnmark_font_tl \c_empty_tl }
      } ,
    fnmark-font / unknown .tl_set:N = \l__sjtu_style_fnmark_font_tl ,
    fnmark-font          .initial:V = \c_empty_tl
  }
\keys_define:nn { sjtu / style }
  {
    fnmark-style           .choice: ,
    fnmark-style / plain   .code:n =
      {
        \cs_set:Npn \SJTU@makefnmark
          { \hbox:n { \@textsuperscript { \normalfont \@thefnmark } } }
        \tl_set:Nn \thefootnote
          { \arabic { footnote } }
        \tl_set:Nn \thempfootnote
          { { \itshape \alph { mpfootnote } } }
      } ,
    fnmark-style / circled .code:n =
      {
        \cs_set:Npn \SJTU@makefnmark
          { \hbox:n { \@thefnmark } }
        \tl_set:Nn \thefootnote
          { { \l__sjtu_style_fnmark_font_tl \__sjtu_circled_number:N \c@footnote } }
        \tl_set:Nn \thempfootnote
          { { \l__sjtu_style_fnmark_font_tl \__sjtu_circled_number:N \c@mpfootnote } }
      }
  }
\ctex_at_end_preamble:n
  {
    \cs_set_eq:NN \SJTU@orig@makefntext \@makefntext
    \cs_set:Npn \@makefntext #1
      {
        \group_begin:
          \cs_set_eq:NN \@makefnmark \SJTU@makefnmark
          \SJTU@orig@makefntext {#1}
        \group_end:
      }
  }
\tl_set_eq:NN \l__sjtu_lang_tl \g__sjtu_lang_tl
\msg_new:nnn { sjtutex } { lang-validation }
  { Invalid~language~argument~'#1'! }
\keys_define:nn { sjtu / private }
  {
    lang .choice: ,
    lang .value_required:n = true ,
    lang .groups:n = { lang } ,
    lang / unknown .code:n =
      { \msg_warning:nnn { sjtutex } { lang-validation } {#1} }
  }
\cs_new_protected:Npn \__sjtu_select_language:n
  { \keys_set_groups:nnn { sjtu / private } { lang } }
\clist_map_inline:Nn \g__sjtu_lang_clist
  { \file_input:n { sjtu-lang- #1 .def } }
\file_input:n { sjtu-scheme- \g__sjtu_lang_tl .def }
\msg_new:nnn { sjtutex } { key-already-defined }
  { Key~'#1'~is~already~defined~and~redefination~is~being~ignored. }
\msg_new:nnn { sjtutex } { key-invalid }
  { Key~'#1'~is~invalid~and~ignored. }
\msg_new:nnn { sjtutex } { key-needs-two-arguments }
  { Key~'#1'~needs~two~arguments~otherwise~ignored. }
\cs_new_protected:Npn \__sjtu_info_keys_define:n #1
  {
    \clist_map_inline:nn
      {
        title, display_title, subject, date, department, major,
        author, supervisor, assoc_supervisor, co_supervisor, degree
      }
      { \tl_new:c { l__sjtu_info_ ##1 _ #1 _tl } }
    \clist_map_inline:nn
      { keywords, fund }
      { \clist_new:c { l__sjtu_info_ ##1 _ #1 _clist } }
    \bool_if:NTF \g__sjtu_review_bool
      {
        \seq_set_from_clist:cn { l__sjtu_info_show_ #1 _seq }
          { author, id, supervisor, department, major, degree }
      }
      { \seq_new:c { l__sjtu_info_show_ #1 _seq } }
    \keys_define:nn { sjtu }
      { info / #1 .meta:nn = { sjtu / info / #1 } {##1} }
    \keys_define:nn { sjtu / info }
      {        #1 .meta:nn = { sjtu / info / #1 } {##1} }
    \keys_define:nn { sjtu / info / #1 }
      {
        display-title       .code:n =
          {
            \tl_set:co { l__sjtu_info_display_title_ #1 _tl }
              { \cs:w __sjtu_title_case_aux_ #1 :n \cs_end: {##1} }
          } ,
        title               .code:n =
          {
            \tl_set:cn { l__sjtu_info_title_ #1 _tl } {##1}
            \tl_if_empty:cT { l__sjtu_info_display_title_ #1 _tl }
              { \keys_set:nn { sjtu / info / #1 } { display-title = {##1} } }
          } ,
        subject           .tl_set:c = { l__sjtu_info_subject_ #1 _tl } ,
        keywords       .clist_set:c = { l__sjtu_info_keywords_ #1 _clist } ,
        fund           .clist_set:c = { l__sjtu_info_fund_ #1 _clist } ,
        fund              .groups:n = { sensitive } ,
        date               .meta:nn = { sjtu / info } { date = {##1} } ,
        display-date      .tl_set:c = { l__sjtu_info_date_ #1 _tl } ,
        @show+              .code:n =
          {
            \seq_if_in:cnF { l__sjtu_info_show_ #1 _seq } {##1}
              { \seq_put_right:cn { l__sjtu_info_show_ #1 _seq } {##1} }
          } ,
        @show+            .groups:n = { sensitive } ,
        custom             .meta:nn = { sjtu / info / #1 / custom } {##1} ,
        custom / unknown    .code:n =
          {
            \regex_match:nVTF { \A [a-z] [a-z0-9\-]* \Z } \l_keys_key_str
              {
                \keys_if_exist:neTF { sjtu / info / #1 } \l_keys_key_str
                  {
                    \msg_warning:nne { sjtutex } { key-already-defined }
                      \l_keys_path_str
                  }
                  {
                    \int_compare:nNnTF { \tl_count:n {##1} } = { 2 }
                      {
                        \tl_set_eq:NN \l__sjtu_tmp_tl \l_keys_key_str
                        \tl_replace_all:Nnn \l__sjtu_tmp_tl { - } { _ }
                        \tl_set:co { l__sjtu_name_ \l__sjtu_tmp_tl _ #1 _tl }
                          { \use_i:nn  ##1 }
                        \tl_set:co { l__sjtu_info_ \l__sjtu_tmp_tl _ #1 _tl }
                          { \use_ii:nn ##1 }
                        \exp_args:Ne \__sjtu_setup:n
                          { info / #1 / @show+ = \l__sjtu_tmp_tl }
                      }
                      {
                        \msg_warning:nne { sjtutex } { key-needs-two-arguments }
                          \l_keys_path_str
                      }
                  }
              }
              { \msg_warning:nne { sjtutex } { key-invalid } \l_keys_path_str }
          }
      }
    \clist_map_inline:nn
      {
        author, supervisor, assoc-supervisor, co-supervisor,
        department, major, degree
      }
      {
        \tl_set:Nn \l__sjtu_tmp_tl {##1}
        \tl_replace_all:Nnn \l__sjtu_tmp_tl { - } { _ }
        \keys_define:ne { sjtu / info / #1 }
          {
            ##1 .code:n =
              {
                \exp_not:N \tl_set:cn
                  { l__sjtu_info_ \l__sjtu_tmp_tl _ #1 _tl } {####1}
                \exp_not:N \__sjtu_setup:n
                  { info / #1 / @show+ = \l__sjtu_tmp_tl }
              }
          }
      }
    \clist_map_inline:nn
      { author, supervisor, assoc-supervisor, co-supervisor }
      { \keys_define:nn { sjtu / info / #1 } { ##1 .groups:n = { sensitive } } }
  }
\tl_new:N \l__sjtu_info_id_zh_tl
\keys_define:nn { sjtu / info }
  {
    id   .code:n =
      {
        \tl_set:Nn \l__sjtu_info_id_zh_tl {#1}
        \__sjtu_setup:n { info / zh / @show+ = id }
      } ,
    id .groups:n = { sensitive }
  }
\clist_map_inline:Nn \g__sjtu_lang_clist
  { \__sjtu_info_keys_define:n {#1} }
\keys_define:nn { sjtu / info }
  {
    date    .code:n =
      {
        \regex_match:nnTF { \A \d+ \- \d+ \- \d+ \Z } {#1}
          {
            \clist_map_inline:Nn \g__sjtu_lang_clist
              {
                \tl_set:ce { l__sjtu_info_date_ ##1 _tl }
                  { \exp_last_unbraced:ce { __sjtu_date_aux_ ##1 :w } #1 \q_stop }
              }
          }
          {
            \regex_match:nnT { \A \d+ \- \d+ \Z } {#1}
              {
                \clist_map_inline:Nn \g__sjtu_lang_clist
                  {
                    \tl_set:ce { l__sjtu_info_date_ ##1 _tl }
                      { \exp_last_unbraced:ce { __sjtu_date_aux_short_ ##1 :w } #1 \q_stop }
                  }
              }
          }
      } ,
    date .initial:e =
      {
        \int_to_arabic:n { \c_sys_year_int  } -
        \int_to_arabic:n { \c_sys_month_int } -
        \int_to_arabic:n { \c_sys_day_int   }
      }
  }
\tl_set_eq:Nc \today { l__sjtu_info_date_ \g__sjtu_lang_tl _tl }
\NewTemplateType { sjtu / element } { 0 }
\DeclareTemplateInterface { sjtu / element } { plain } { 0 }
  {
    format      : tokenlist = \c_empty_tl ,
    content     : tokenlist = \c_empty_tl ,
    bottom-skip : skip      = \c_zero_skip ,
    align       : choice { left, right, center, normal } = center
  }
\DeclareTemplateCode { sjtu / element } { plain } { 0 }
  {
    format      = \l__sjtu_element_format_tl ,
    content     = \l__sjtu_element_content_tl ,
    bottom-skip = \l__sjtu_element_bottom_skip ,
    align       =
      {
        left    =
          \cs_set_eq:NN \l__sjtu_element_align: \raggedright ,
        right   =
          \cs_set_eq:NN \l__sjtu_element_align: \raggedleft ,
        center  =
          \cs_set_eq:NN \l__sjtu_element_align: \centering ,
        normal  =
          \cs_set_eq:NN \l__sjtu_element_align: \prg_do_nothing:
      }
  }
  {
    \AssignTemplateKeys
    \group_begin:
      \l__sjtu_element_align:
      \l__sjtu_element_format_tl
      \l__sjtu_element_content_tl
      \par
    \group_end:
    \skip_vertical:N \l__sjtu_element_bottom_skip
    \skip_vertical:N \c_zero_skip
  }
\NewTemplateType { sjtu / page } { 1 }
\DeclareTemplateInterface { sjtu / page } { title } { 1 }
  {
    bookmark : tokenlist ,
    style    : tokenlist = empty ,
    format   : tokenlist = \linespread { } \selectfont ,
    precode  : tokenlist ,
    prefix   : tokenlist ,
    elements : commalist
  }
\DeclareTemplateCode { sjtu / page } { title } { 1 }
  {
    bookmark = \l__sjtu_page_bookmark_tl ,
    style    = \l__sjtu_page_style_tl ,
    format   = \l__sjtu_page_format_tl ,
    precode  = \l__sjtu_page_precode_tl ,
    prefix   = \l__sjtu_page_prefix_tl ,
    elements = \l__sjtu_page_elements_clist
  }
  {
    \tl_set_eq:NN \l__sjtu_page_bookmark_tl \c_novalue_tl
    \AssignTemplateKeys
    \legacy_if:nTF { @openright }
      { \cleardoublepage } { \clearpage }
    \l__sjtu_page_precode_tl
    \exp_args:No \thispagestyle { \l__sjtu_page_style_tl }
    \group_begin:
      \__sjtu_select_language:n {#1}
      \clist_gset_eq:Nc \l__sjtu_info_fund_clist
        { l__sjtu_info_fund_ \l__sjtu_lang_tl _clist }
      \exp_args:No \tl_if_novalue:nF { \l__sjtu_page_bookmark_tl }
        { \__sjtu_pdf_bookmark:nn { 0 } { \l__sjtu_page_bookmark_tl } }
      \l__sjtu_page_format_tl
      \clist_map_inline:Nn \l__sjtu_page_elements_clist
        { \UseInstance { sjtu / element } { \l__sjtu_page_prefix_tl / ##1 } }
      \clearpage
    \group_end:
    \restoregeometry
  }
\cs_new_protected:Npn \__sjtu_declare_element_instance:nnn #1#2#3
  { \DeclareInstance { sjtu / element } {#1/#2} { plain } {#3} }
\cs_new_protected:Npn \__sjtu_declare_page_instance:nnn #1#2
  { \DeclareInstance { sjtu / page } {#1} { title } {#2} }
\tl_set:Nn \SJTU@CT@W@width { 5 em }
\newcolumntype { \SJTU@CT@W } [ 1 ]
  {
    w {#1} { \SJTU@CT@W@width }
    @{ \tl_use:c { c__sjtu_name_info_sep_ \l__sjtu_lang_tl _tl } }
  }
\newcolumntype { \SJTU@CT@R }
  { r @{ \tl_use:c { c__sjtu_name_info_sep_ \l__sjtu_lang_tl _tl } } }
\newcolumntype { \SJTU@CT@L }
  { >{ \linespread { 0.75 } \normalfont } l }
\cs_new:Npn \__sjtu_info_table_row:nn #1#2
  {
    \exp_not:n {#1}
    &
    \exp_not:N \hbox:n
      {
        \exp_not:N \tabular [ t ] { @{} l @{} }
          \exp_not:n {#2}
        \exp_not:N \endtabular
      }
  }
\cs_generate_variant:Nn \__sjtu_info_table_row:nn { vv }
\cs_new_protected:Npn \__sjtu_title_page_info_table:n #1
  {
    \group_begin:
      \clist_clear:N \l__sjtu_tmp_clist
      \seq_map_inline:cn { l__sjtu_info_show_ \l__sjtu_lang_tl _seq }
        {
          \bool_lazy_all:nT
            {
              { \tl_if_exist_p:c { l__sjtu_name_ ##1 _ \l__sjtu_lang_tl _tl } }
              { \tl_if_exist_p:c { l__sjtu_info_ ##1 _ \l__sjtu_lang_tl _tl } }
            }
            {
              \clist_put_right:Ne \l__sjtu_tmp_clist
                {
                  \__sjtu_info_table_row:vv
                    { l__sjtu_name_ ##1 _ \l__sjtu_lang_tl _tl }
                    { l__sjtu_info_ ##1 _ \l__sjtu_lang_tl _tl }
                }
            }
        }
      \tl_set:Nn \arraystretch { 1 }
      \int_set_eq:NN \hbadness \c_max_int
      \tabular {#1}
        \clist_use:Nn \l__sjtu_tmp_clist { \\ }
      \endtabular
    \group_end:
  }
\cs_new:Npn \ps@SJTU@fund
  {
    \ps@empty
    \tl_set:Nn \@oddfoot
      {
        \hfil
        \minipage [ t ] { \textwidth }
          \centering \zihao { - 5 }
          \clist_use:Nn \l__sjtu_info_fund_clist { \par }
        \endminipage
        \hfil
      }
    \tl_set_eq:NN \@evenfoot \@oddfoot
  }
\clist_map_inline:nn
  {
    { logo    }
      {
        content     =
          {
            \includegraphics [ width = 3 cm ]
              { sjtu-vi-badge-reg-red.pdf }
          }
      } ,
    { subject }
      {
        format      = \zihao { -2 } \setbaselineskip { 30 bp } ,
        content     = \tl_use:c { l__sjtu_info_subject_ \l__sjtu_lang_tl _tl } ,
        bottom-skip = \c_zero_dim plus 1 fill
      } ,
    { title   }
      {
        format      = \zihao { 2 } \setbaselineskip { 36 bp } \bfseries ,
        content     = \tl_use:c { l__sjtu_info_display_title_ \l__sjtu_lang_tl _tl } ,
        bottom-skip = 30 bp plus 1 fill
      } ,
    { info    }
      {
        format      = \zihao { 4 } \setbaselineskip { 30 bp } \heiti ,
        content     = \__sjtu_title_page_info_table:n
                        { \SJTU@CT@W { s } \SJTU@CT@L } ,
        bottom-skip = 30 bp
      } ,
    { date    }
      {
        format      = \zihao { 4 } \setbaselineskip { 30 bp } \bfseries ,
        content     = \tl_use:c { l__sjtu_info_date_ \l__sjtu_lang_tl _tl } ,
      }
  }
  { \__sjtu_declare_element_instance:nnn { title a } #1 }
\__sjtu_declare_page_instance:nnn { title a }
  {
    bookmark = \tl_use:c { c__sjtu_name_title_page_ \g__sjtu_lang_tl _tl } ,
    style    = SJTU@fund ,
    prefix   = title a ,
    elements = { logo, subject, title, info, date }
  }
\clist_map_inline:nn
  {
    { subject }
      {
        format      = \zihao { 4 } \setbaselineskip { 24 bp } \bfseries ,
        content     = \tl_use:c { l__sjtu_info_subject_ \l__sjtu_lang_tl _tl } ,
        bottom-skip = \c_zero_dim plus 1 fill
      } ,
    { title   }
      {
        format      = \zihao { -2 } \setbaselineskip { 30 bp } \bfseries ,
        content     = \tl_use:c { l__sjtu_info_display_title_ \l__sjtu_lang_tl _tl } ,
        bottom-skip = \c_zero_dim plus 1 fill
      } ,
    { info    }
      {
        format      = \zihao { 3 } \setbaselineskip { 30 bp } \bfseries ,
        content     = \__sjtu_title_page_info_table:n
                        { \SJTU@CT@R \SJTU@CT@L } ,
        bottom-skip = 30 bp plus 1 fill
      } ,
    { date    }
      {
        format      = \zihao { 3 } \setbaselineskip { 30 bp } ,
        content     =
          {
            \tl_use:c { l__sjtu_info_department_ \l__sjtu_lang_tl _tl }
            \skip_vertical:N \c_zero_skip
            \tl_use:c { c__sjtu_name_univ_ \l__sjtu_lang_tl _tl }
            \skip_vertical:N \c_zero_skip
            \tl_use:c { c__sjtu_name_address_ \l__sjtu_lang_tl _tl }
            \skip_vertical:N \c_zero_skip
            \tl_use:c { l__sjtu_info_date_ \l__sjtu_lang_tl _tl }
          }
      }
  }
  { \__sjtu_declare_element_instance:nnn { title b } #1 }
\__sjtu_declare_page_instance:nnn { title b }
  {
    prefix   = title b ,
    style    = SJTU@fund ,
    elements = { subject, title, info, date }
  }
\clist_map_inline:Nn \g__sjtu_lang_clist
  { \file_input:n { sjtu-thesis- #1 .def } }
\RenewDocumentCommand \maketitle { }
  {
    \clist_map_inline:Nn \g__sjtu_lang_clist
      { \UseInstance { sjtu / page } { title / ##1 } { ##1 } }
  }
\clist_map_inline:nn
  {
    { orig / title }
      {
        format      = \zihao { 3 } \setbaselineskip { 30 bp }
                      \bfseries \heiti ,
        content     =
          {
            \c__sjtu_name_univ_zh_tl
            \skip_vertical:N \c_zero_skip
            \c__sjtu_name_thesis_zh_tl
            \c__sjtu_name_orig_decl_zh_tl
          } ,
        bottom-skip = 12 bp
      },
    { orig / text  }
      {
        format      = \zihao { -4 } \setbaselineskip { 24 bp } ,
        bottom-skip = 24 bp ,
        align       = normal
      },
    { orig / sign  }
      {
        format      = \zihao { 4 } \setbaselineskip { 30 bp } ,
        content     =
          {
            \__sjtu_signature:N \c__sjtu_name_decl_author_zh_tl
            \skip_horizontal:n { 2 em } \hbox:n { }
          } ,
        bottom-skip = 24 bp plus 1 fill ,
        align       = right
      },
    { auth / title }
      {
        format      = \zihao { 3 } \setbaselineskip { 30 bp }
                      \bfseries \heiti ,
        content     =
          {
            \c__sjtu_name_univ_zh_tl
            \skip_vertical:N \c_zero_skip
            \c__sjtu_name_thesis_zh_tl
            \c__sjtu_name_auth_decl_zh_tl
          } ,
        bottom-skip = 12 bp
      },
    { auth / text  }
      {
        format      = \zihao { -4 } \setbaselineskip { 24 bp } ,
        content     = \c__sjtu_auth_decl_text_zh_tl ,
        bottom-skip = 24 bp ,
        align       = normal
      },
    { auth / sign  }
      {
        format      = \zihao { 4 } \setbaselineskip { 30 bp } ,
        content     =
          {
            \__sjtu_signature:N \c__sjtu_name_decl_author_zh_tl
            \hfill
            \__sjtu_signature:N \c__sjtu_name_decl_supervisor_zh_tl
          } ,
        bottom-skip = \c_zero_dim plus 1 fill ,
        align       = normal
      }
  }
  {
    \__sjtu_declare_element_instance:nnn { copyright } #1
  }
\__sjtu_declare_page_instance:nnn { copyright }
  {
    bookmark  = \tl_use:c { c__sjtu_name_declaration_ \g__sjtu_lang_tl _tl } ,
    precode   = \newgeometry
                  {
                    margin        = 3.0 cm ,
                    bindingoffset = 0.5 cm
                  } ,
    prefix    = copyright ,
    elements  =
      {
        orig / title, orig / text, orig / sign,
        auth / title, auth / text, auth / sign
      }
  }
\tl_new:N \l__sjtu_copyright_page_file_tl
\keys_define:nn { sjtu / private / copyright }
  {
    file .tl_set:N = \l__sjtu_copyright_page_file_tl ,
    file .value_required:n = true ,
    filename .meta:n = { file = #1 } ,
    variant .choice: ,
    variant .choices:nn =
      { a, b }
      {
        \EditInstance { sjtu / element } { copyright / orig / text }
          { content = \tl_use:c { c__sjtu_orig_decl_text_ #1 _zh_tl } }
      } ,
    variant  .initial:e = \int_compare:nNnTF { \g__sjtu_thesis_type_int } > { 1 }
                            { a } { b }
  }
\msg_new:nnn { sjtutex } { require-pdfpages }
  {
    Add~'\token_to_str:N \usepackage{pdfpages}'~in~your~preamble \\
    before~inserting~pages~of~external~PDF.
  }
\NewDocumentCommand \copyrightpage { O{ } }
  {
    \bool_if:NF \g__sjtu_review_bool
      {
        \group_begin:
          \keys_set_known:nnN { sjtu / private / copyright }
            {#1} \l__sjtu_tmp_tl
          \tl_if_empty:NTF \l__sjtu_copyright_page_file_tl
            { \UseInstance { sjtu / page } { copyright } { zh } }
            {
              \cs_if_exist:NTF \includepdf
                {
                  \legacy_if:nTF { @openright }
                    { \cleardoublepage } { \clearpage }
                  \exp_args:Nnv \__sjtu_pdf_bookmark:nn
                    { 0 } { c__sjtu_name_declaration_ \g__sjtu_lang_tl _tl }
                  \tl_set_rescan:NnV \l__sjtu_tmp_tl { } \l__sjtu_tmp_tl
                  \exp_args:NNo \includepdf [ \l__sjtu_tmp_tl ]
                    { \l__sjtu_copyright_page_file_tl }
                }
                {
                  \msg_warning:nn { sjtutex } { require-pdfpages }
                  \UseInstance { sjtu / page } { copyright } { zh }
                }
            }
        \group_end:
      }
  }
\bool_new:N \l__sjtu_heading_numbering_bool
\bool_new:N \l__sjtu_heading_in_toc_bool
\tl_new:N \l__sjtu_heading_title_tl
\tl_new:N \l__sjtu_heading_marking_tl
\AddToHook { cmd / mainmatter / after }
  { \bool_set_true:N \l__sjtu_heading_in_toc_bool }
\keys_define:nn { sjtu / private }
  {
    intoc    .value_forbidden:n = true,
    intoc    .groups:n = { heading } ,
    intoc    .code:n = { \bool_set_true:N  \l__sjtu_heading_in_toc_bool } ,
    notintoc .value_forbidden:n = true,
    notintoc .groups:n = { heading } ,
    notintoc .code:n = { \bool_set_false:N \l__sjtu_heading_in_toc_bool } ,
    title    .tl_set:N = \l__sjtu_heading_title_tl ,
    title    .groups:n = { heading } ,
    marking  .tl_set:N = \l__sjtu_heading_marking_tl ,
    marking  .groups:n = { heading }
  }
\NewDocumentCommand \SJTU@heading { O{#2} m }
  {
    \bool_if:nTF
      { \l__sjtu_heading_numbering_bool && \l__sjtu_heading_in_toc_bool }
      { \chapter [#1] {#2} }
      {
        \CTEX@chapter@break
        \bool_if:NTF \l__sjtu_heading_in_toc_bool
          {
            \__sjtu_phantom_section:
            \addcontentsline { toc } { chapter } {#1}
          }
          { \__sjtu_pdf_bookmark:nn { 0 } {#1} }
        \chapter* {#2}
        \CTEX@gettitle {#1}
        \@mkboth { \MakeUppercase {#1} } { \MakeUppercase {#1} }
      }
  }
\cs_new_protected:Npn \__sjtu_heading:nn #1#2
  { \SJTU@heading [#1] {#2} }
\cs_generate_variant:Nn \__sjtu_heading:nn { VV }
\cs_new_protected:Npn \__sjtu_make_heading:n #1
  {
    \tl_set_eq:NN \l__sjtu_heading_marking_tl \c_novalue_tl
    \keys_set_groups:nnn { sjtu / private } { heading } {#1}
    \__sjtu_heading:VV
      \l__sjtu_heading_marking_tl \l__sjtu_heading_title_tl
  }
\keys_define:nn { sjtu / style }
  {
    keywords-format       .choice: ,
    keywords-format / plain .code:n =
      { \cs_set:Nn \__sjtu_keywords_format:n { \noindent  { \bfseries ##1 } } } ,
    keywords-format / hang  .code:n =
      { \cs_set:Nn \__sjtu_keywords_format:n { \@hangfrom { \bfseries ##1 } } } ,
    keywords-format      .initial:n = { plain }
  }
\DeclareDocumentEnvironment { abstract } { O{ } }
  {
    \__sjtu_select_language:n {#1}
    \tl_set_eq:Nc \l__sjtu_heading_title_tl
      { c__sjtu_name_abstract_ \l__sjtu_lang_tl _tl }
    \__sjtu_make_heading:n {#1}
  }
  {
    \clist_if_empty:cF { l__sjtu_info_keywords_ \l__sjtu_lang_tl _clist }
      {
        \par \mode_leave_vertical: \par
        \__sjtu_keywords_format:n
          {
            \tl_use:c { c__sjtu_name_keywords_ \l__sjtu_lang_tl _tl }
            \tl_use:c { c__sjtu_name_info_sep_ \l__sjtu_lang_tl _tl }
          }
        \clist_use:cv { l__sjtu_info_keywords_ \l__sjtu_lang_tl _clist }
          { c__sjtu_name_item_sep_ \l__sjtu_lang_tl _tl }
        \par
      }
  }
\DeclareDocumentCommand \tableofcontents { O{ } }
  {
    \group_begin:
      \__sjtu_make_heading:n { title = \contentsname, #1 }
      \@starttoc { toc }
    \group_end:
  }
\tl_set:Nn \SJTU@leaders { \titlerule* [ 4bp ] { . } }
\contentsmargin [ 2.55 em ] { 0 pt }
\titlecontents { chapter }
  [ 0 pt ] { \addvspace { 6 bp } \bfseries }
  { \contentspush { \thecontentslabel \enskip } } { }
  { \SJTU@leaders \thecontentspage }
\titlecontents { section }
  [ 2 em ] { }
  { \contentspush { \thecontentslabel \enskip } } { }
  { \SJTU@leaders \thecontentspage }
\titlecontents { subsection }
  [ 4 em ] { }
  { \contentspush { \thecontentslabel \enskip } } { }
  { \SJTU@leaders \thecontentspage }
\NewDocumentCommand \SJTU@listof { m m O{ } }
  {
    \group_begin:
      \__sjtu_make_heading:n { title = #1, #3 }
      \exp_args:Nv \@starttoc { ext@ #2 }
    \group_end:
  }
\cs_new_protected:Npn \__sjtu_new_list_of:Nnnn #1#2#3#4
  {
    \DeclareDocumentCommand #1 { }
      { \SJTU@listof {#4} {#2} }
    \titlecontents {#2}
      [ 0 pt ] { }
      { \contentspush { #3 \space \thecontentslabel \enskip } } { }
      { \SJTU@leaders \thecontentspage }
    \exp_args:Nnv \contentsuse {#2} { ext@ #2 }
  }
\__sjtu_new_list_of:Nnnn \listoffigures { figure }
  { \figurename } { \listfigurename }
\__sjtu_new_list_of:Nnnn \listoftables  { table  }
  { \tablename  } { \listtablename  }
\NewDocumentEnvironment { abbreviation } { O{ } }
  {
    \bool_set_true:N \l__sjtu_heading_numbering_bool
    \__sjtu_make_heading:n { title = \SJTU@abbrname, #1 }
    \tl_clear:N \SJTU@style@float@font
  } { }
\NewDocumentEnvironment { nomenclature } { O{ } }
  {
    \bool_set_true:N \l__sjtu_heading_numbering_bool
    \__sjtu_make_heading:n { title = \SJTU@nomname, #1 }
    \tl_clear:N \SJTU@style@float@font
  } { }
\NewDocumentEnvironment { acknowledgements } { O{ } +b }
  {
    \bool_if:NF \g__sjtu_review_bool
      {
        \__sjtu_select_language:n {#1}
        \__sjtu_make_heading:n { title = \SJTU@ackname, #1 }
        #2
      }
  } { }
\newcounter { SJTU@bib }
\bool_new:N \l__sjtu_bibliolist_resume_bool
\keys_define:nn { sjtu / private / bibliolist }
  {
    resume .value_forbidden:n = true,
    resume .code:n =
      { \bool_set_true:N \l__sjtu_bibliolist_resume_bool }
  }
\msg_new:nnn { sjtutex } { empty-environment }
  { Empty~'#1'~environment. }
\NewDocumentEnvironment { @bibliolist } { m m }
  {
    \keys_set:nn { sjtu / private / bibliolist } {#1}
    \cs_if_exist_use:N \bibfont
    \list
      {
        \tl_if_blank:nTF {#2}
          { \hfill }
          { \@biblabel { \arabic{ SJTU@bib } } }
      }
      {
        \tl_if_blank:nTF {#2}
          {
            \skip_if_exist:NTF \bibhang
              { \dim_set_eq:NN \leftmargin \bibhang }
              { \dim_set:Nn    \leftmargin { 1 em } }
            \dim_set:Nn \itemindent { - \leftmargin }
          }
          {
            \__sjtu_dim_set_to_wd:Nn \labelwidth { \@biblabel {#2} }
            \dim_set_eq:NN \leftmargin \labelwidth
            \dim_add:Nn    \leftmargin { \labelsep }
          }
        \skip_if_exist:NTF \bibitemsep
          {
            \skip_set_eq:NN \itemsep \bibitemsep
            \skip_if_exist:NT \bibparsep
              { \skip_set_eq:NN \parsep \bibparsep }
          }
          {
            \skip_if_exist:NT \bibsep
              {
                \skip_set_eq:NN \itemsep \bibsep
                \skip_zero:N    \parsep
              }
          }
        \@nmbrlisttrue
        \tl_set:Nn \@listctr { SJTU@bib }
        \tl_clear:N \p@SJTU@bib
        \bool_if:NF \l__sjtu_bibliolist_resume_bool
          { \setcounter { SJTU@bib } { 0 } }
        \tl_set:Nn \theSJTU@bib { \arabic { SJTU@bib } }
      }
      \sloppy
      \int_set:Nn \clubpenalty  { 4000 }
      \int_set_eq:NN \@clubpenalty \clubpenalty
      \int_set:Nn \widowpenalty { 4000 }
      \char_set_sfcode:nn { `\. } { 1000 }
  }
  {
    \tl_set:Nn \@noitemerr
      { \msg_warning:nnn { sjtutex } { empty-environment } { bibliolist } }
    \endlist
  }
\NewDocumentEnvironment { achievements } { O{ } }
  {
    \__sjtu_select_language:n {#1}
    \__sjtu_make_heading:n { title = \SJTU@achvname, #1 }
  } { }
\NewDocumentEnvironment { bibliolist  } { O{ } m +b }
  {
    \bool_if:NF \g__sjtu_review_bool
      {
        \begin { @bibliolist } {#1} {#2}
          #3
        \end { @bibliolist }
      }
  } { }
\NewDocumentEnvironment { bibliolist* } { O{ } m +b }
  {
    \bool_if:NT \g__sjtu_review_bool
      {
        \begin { @bibliolist } {#1} {#2}
          #3
        \end { @bibliolist }
      }
  } { }
\NewDocumentEnvironment { resume } { O{ } +b }
  {
    \bool_if:NF \g__sjtu_review_bool
      {
        \__sjtu_select_language:n {#1}
        \__sjtu_make_heading:n { title = \SJTU@resumename, #1 }
        #2
      }
  } { }
\NewHook { sjtutex / digest }
\NewDocumentEnvironment { digest } { O{ } +b }
  {
    \AtEndDocument
      {
        \group_begin:
          \__sjtu_select_language:n { en, #1 }
          \legacy_if:nTF { @openright }
            { \cleardoublepage } { \clearpage }
          \pagenumbering { roman }
          \tl_gset:Nn \__sjtu_the_page_tl { \arabic { page } }
          \UseHook { sjtutex / digest }
          \cs_gset_eq:NN \addcontentsline \use_none:nnn
          \clist_map_inline:Nn \l__sjtu_counter_without_chapter_clist
            {
              \counterwithout {##1} { chapter }
              \setcounter     {##1} { 0 }
            }
          \tl_set_eq:Nc \l__sjtu_heading_title_tl
            { l__sjtu_info_display_title_ \l__sjtu_lang_tl _tl }
          \__sjtu_make_heading:n { marking = \SJTU@digestname, #1, notintoc }
          #2
        \group_end:
      }
  } { }
\NewDocumentCommand \sjtusetup { } { \__sjtu_setup:n }
\keys_define:nn { sjtu }
  {
    style .meta:nn = { sjtu / style } {#1} ,
    info  .meta:nn = { sjtu / info  } {#1} ,
    name  .meta:nn = { sjtu / name  } {#1}
  }
\keys_define:nn { sjtu / info }
  {
    title             .meta:n = { zh / title            = {#1} } ,
    title*            .meta:n = { en / title            = {#1} } ,
    display-title     .meta:n = { zh / display-title    = {#1} } ,
    display-title*    .meta:n = { en / display-title    = {#1} } ,
    subject           .meta:n = { zh / subject          = {#1} } ,
    subject*          .meta:n = { en / subject          = {#1} } ,
    keywords          .meta:n = { zh / keywords         = {#1} } ,
    keywords*         .meta:n = { en / keywords         = {#1} } ,
    author            .meta:n = { zh / author           = {#1} } ,
    author*           .meta:n = { en / author           = {#1} } ,
    supervisor        .meta:n = { zh / supervisor       = {#1} } ,
    supervisor*       .meta:n = { en / supervisor       = {#1} } ,
    assoc-supervisor  .meta:n = { zh / assoc-supervisor = {#1} } ,
    assoc-supervisor* .meta:n = { en / assoc-supervisor = {#1} } ,
    co-supervisor     .meta:n = { zh / co-supervisor    = {#1} } ,
    co-supervisor*    .meta:n = { en / co-supervisor    = {#1} } ,
    degree            .meta:n = { zh / degree           = {#1} } ,
    degree*           .meta:n = { en / degree           = {#1} } ,
    department        .meta:n = { zh / department       = {#1} } ,
    department*       .meta:n = { en / department       = {#1} } ,
    major             .meta:n = { zh / major            = {#1} } ,
    major*            .meta:n = { en / major            = {#1} } ,
    fund              .meta:n = { zh / fund             = {#1} } ,
    fund*             .meta:n = { en / fund             = {#1} } ,
    display-date      .meta:n = { zh / date             = {#1} } ,
    display-date*     .meta:n = { en / date             = {#1} }
  }
\keys_define:nn { sjtu / name }
  {
    abbreviation      .meta:n = { abbr  = {#1} } ,
    nomenclature      .meta:n = { nom   = {#1} } ,
    acknowledgements  .meta:n = { ack   = {#1} } ,
    publications      .meta:n = { achv  = {#1} } ,
    achievements      .meta:n = { achv  = {#1} }
  }
\ctex_at_end_package:nn { hyperref }
  {
    \hypersetup
      {
        linktoc            = all,
        bookmarksdepth     = 2,
        bookmarksnumbered  = true,
        bookmarksopen      = true,
        bookmarksopenlevel = 1,
        unicode            = true,
        psdextra           = true,
        breaklinks         = true,
        pdfdisplaydoctitle = true
      }
    \int_new:N \g__sjtu_bookmark_int
    \cs_set_protected:Npn \__sjtu_pdf_bookmark:nn #1#2
      {
        \phantomsection
        \int_gincr:N \g__sjtu_bookmark_int
        \pdfbookmark [#1] {#2}
          { sjtubookmark. \int_use:N \g__sjtu_bookmark_int }
      }
    \cs_set_eq:NN \__sjtu_phantom_section: \phantomsection
    \DeclareExpandableDocumentCommand
      { \__sjtu_pdfstring_newline:w } { s o m } {#3}
    \pdfstringdefDisableCommands
      {
        \cs_set_eq:NN \\       \__sjtu_pdfstring_newline:w
        \cs_set_eq:NN \hspace  \use_none:n
        \cs_set_eq:NN \zihao   \use_none:n
        \tl_set_eq:NN \quad    \c_empty_tl
        \tl_set_eq:NN \qquad   \c_empty_tl
      }
    \ctex_after_end_preamble:n
      {
        \hypersetup
          {
            pdftitle    = \l__sjtu_info_title_zh_tl ,
            pdfauthor   = \l__sjtu_info_author_zh_tl ,
            pdfsubject  = \l__sjtu_info_subject_zh_tl ,
            pdfkeywords = \l__sjtu_info_keywords_zh_clist
          }
      }
  }
\ctex_at_end_package:nn { pageslts }
  {
    \pagenumbering { Alph }
    \tl_set:Nn \__sjtu_the_last_page_tl
      { \lastpageref { pagesLTS.\pagesLTS@pnc } }
    \AddToHook { sjtutex / digest }
      {
        \tl_gset:Nn \__sjtu_the_last_page_tl
          { \lastpageref { pagesLTS.roman.local } }
      }
  }
\ctex_at_end_package:nn { threeparttable }
  { \tl_put_right:Nn \TPTnoteSettings { \footnotesize } }
\ctex_at_end_package:nn { longtable }
  { \AtBeginEnvironment { longtable } { \SJTU@style@float@font } }
\cs_new_protected:Nn \__sjtu_new_theorems:
  {
    \clist_map_inline:nn
      {
        assumption, axiom, conjecture, corollary, definition, example,
        exercise, lemma, problem, proposition, theorem
      }
      {
        \cs_if_exist:cF {##1}
          {
            \exp_args:Nnv  \newtheorem  {##1}
              { c__sjtu_name_ ##1 _ \g__sjtu_lang_tl _tl } [ chapter ]
          }
      }
    \clist_map_inline:nn
      { remark, solution }
      {
        \cs_if_exist:cF {##1}
          {
            \exp_args:NNnv \newtheorem* {##1}
              { c__sjtu_name_ ##1 _ \g__sjtu_lang_tl _tl }
          }
      }
  }
\ctex_at_begin_package:nn { amsthm }
  {
    \cs_if_exist:NT \openbox
      {
        \cs_new_eq:NN \SJTU@orig@openbox \openbox
        \cs_undefine:N \openbox
      }
  }
\ctex_at_end_package:nn { amsthm }
  {
    \__sjtu_cs_provide_eq:NN \QED \openbox
    \cs_if_exist:NT \SJTU@orig@openbox
      { \cs_set_eq:NN \openbox \SJTU@orig@openbox }
    \tl_set:Nn \qedsymbol { \ensuremath { \QED } }
    \RenewDocumentEnvironment { proof } { O{ \proofname } }
      {
        \par \pushQED { \qed }
        \SJTU@style@thm@body@font \dim_zero:N \topsep
        \trivlist
        \item
          [
            \skip_horizontal:N \labelsep
            \SJTU@style@thm@header@font #1 \@addpunct { \enskip }
          ]
        \ignorespaces
      }
      { \popQED \endtrivlist \@endpefalse }
    \newtheoremstyle { sjtu }
      { } { } { \SJTU@style@thm@body@font } { }
      { \SJTU@style@thm@header@font } { } { \ccwd } { }
    \__sjtu_disable_package_load:n { ntheorem }
    \ctex_at_end_preamble:n
      {
        \theoremstyle { sjtu }
        \__sjtu_new_theorems:
      }
  }
\ctex_at_end_package:nn { ntheorem }
  {
    \__sjtu_disable_package_load:n { amsthm }
    \ctex_at_end_preamble:n
      {
        \__sjtu_cs_provide_eq:NN \QED \c_empty_tl
        \theoremheaderfont { \SJTU@style@thm@header@font }
        \theorembodyfont   { \SJTU@style@thm@body@font   }
        \theoremseparator  { \enskip }
        \theoremsymbol { \ensuremath { \QED } }
        \qedsymbol     { \ensuremath { \QED } }
        \cs_if_exist:NF \proof
          { \newtheorem* { proof } { \proofname } }
        \theoremsymbol { }
        \__sjtu_new_theorems:
      }
  }
\ctex_at_end_package:nn { thmtools }
  {
    \cs_set:Npn \thmtlo@newentry
      {
        \exp_args:NV \titlecontents \thmt@envname
          [ \thmt@listnumwidth ] { }
          { \contentslabel { \thmt@listnumwidth } }
          { \hspace* { - \thmt@listnumwidth } }
          { \SJTU@leaders \thecontentspage }
        \exp_args:NV \contentsuse \thmt@envname { loe }
      }
    \cs_set:Npn \thmtlo@chaptervspacehack { }
    \RenewDocumentCommand \listoftheorems { O{ } }
      {
        \group_begin:
          \tl_set_eq:NN \l__sjtu_heading_marking_tl \c_novalue_tl
          \keys_set_groups:nnnN { sjtu / private } { heading }
            { title = \listtheoremname, #1 } \l__sjtu_tmp_tl
          \tl_set_rescan:NnV \l__sjtu_tmp_tl { } \l__sjtu_tmp_tl
          \__sjtu_heading:VV
            \l__sjtu_heading_marking_tl \l__sjtu_heading_title_tl
          \exp_args:No \setlisttheoremstyle { \l__sjtu_tmp_tl }
          \cs_set:Npn \contentsline ##1
            { \use:c { thmt@contentsline@ ##1 } {##1} }
          \clist_map_inline:Nn \thmt@allenvs
            {
              \tl_set:Nn \thmt@envname {##1}
              \thmtlo@newentry
            }
          \@fileswfalse
          \AddToHook { enddocument / afterlastpage }
            {
              \if@filesw
                \@ifundefined { tf@loe }
                  {
                    \expandafter\newwrite\csname tf@loe\endcsname
                    \immediate\openout \csname tf@loe\endcsname \jobname.loe\relax
                  } { }
              \fi
            }
          \@starttoc { loe }
        \group_end:
      }
  }
\ctex_at_end_package:nn { algorithm }
  {
    \tl_set:Nn \fname@algorithm   { \SJTU@algorithmname     }
    \tl_set:Nn \listalgorithmname { \SJTU@listalgorithmname }
    \SJTU@counterwithin { algorithm } { chapter }
    \clist_put_right:Nn \l__sjtu_counter_without_chapter_clist { algorithm }
    \__sjtu_new_list_of:Nnnn \listofalgorithms { algorithm }
      { \fname@algorithm } { \listalgorithmname }
  }
\ctex_at_begin_package:nn { algorithm2e }
  { \cs_set_eq:NN \SJTU@orig@at@chapter \@chapter }
\ctex_at_end_package:nn { algorithm2e }
  {
    \cs_set_eq:NN \@chapter \SJTU@orig@at@chapter
    \SetAlgorithmName { \SJTU@algorithmname     }
                      { \SJTU@algorithmname     }
                      { \SJTU@listalgorithmname }
    \SetAlgoCaptionSeparator { \enskip }
    \SJTU@counterwithin { algocf } { chapter }
    \clist_put_right:Nn \l__sjtu_counter_without_chapter_clist { algocf }
    \__sjtu_new_list_of:Nnnn \listofalgorithms { algocf }
      { \algorithmcfname } { \listalgorithmcfname }
    \ctex_patch_cmd:Nnn \algocf@latexcaption
      { \addcontentsline }
      { \caption@iflist { \addcontentsline } { \@gobblethree } }
  }
\ctex_at_end_package:nn { nomencl }
  { \tl_set:Nn \nomname { \SJTU@nomname } }
\ctex_at_end_package:nn { translations }
  {
    \DeclareLanguage { chinese }
    \DeclareLanguageAlias { Chinese } { chinese }
  }
\ctex_at_end_package:nn { siunitx }
  {
    \RequirePackage { translations }
    \DeclareTranslation { Chinese  } { and } { 和 }
    \DeclareTranslation { Japanese } { and } { と }
    \DeclareTranslation { Chinese  }
      { to~(numerical~range) } { \textasciitilde }
    \DeclareTranslation { Japanese }
      { to~(numerical~range) } { \textasciitilde }
    \IfPackageAtLeastTF { siunitx } { 2021/05/17 } { }
      {
        \DeclareTranslation { English } { to~(numerical~range) } { to  }
        \DeclareTranslation { German }  { to~(numerical~range) } { bis }
        \keys_set:nn { siunitx }
          {
            list-final-separator =
              {
                \ifmmode \  \else \space \fi
                \text { \GetTranslation { and } }
                \ifmmode \  \else \space \fi
              } ,
            list-pair-separator  =
              {
                \ifmmode \  \else \space \fi
                \text { \GetTranslation { and } }
                \ifmmode \  \else \space \fi
              } ,
            range-phrase         =
              {
                \ifmmode \  \else \space \fi
                \text { \GetTranslation { to~(numerical~range) } }
                \ifmmode \  \else \space \fi
              }
          }
      }
  }
\endinput
%%
%% End of file `sjtuthesis.cls'.
