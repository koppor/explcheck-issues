%%
%% This is file `hithesisbook.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hithesis.dtx  (with options: `bookcls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2017-2026 by Chu Yanshuo <yanshuoc@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
\NeedsTeXFormat{LaTeX2e}[2023/06/01]
\ProvidesExplClass{hithesisbook}{2026/10/11}{v3.2a}{Harbin Institute of Technology Thesis Template}
\RequirePackage{expl3,l3keys2e}

\tl_const:Ne \c__hit_class_name_tl {\@currname}
\cs_new_protected:Npn \__hit_measure_width:Nn #1#2
  {
    \hbox_set:Nn \l__hit_measure_box {\color@setgroup #2\color@endgroup}
    \dim_set:Nn #1 {\box_wd:N \l__hit_measure_box}
  }
\box_new:N \l__hit_measure_box
\cs_new:Npn \__hit_month_name:n #1
  {
    \int_case:nn {#1}
      {
        {1} {January} {2} {February} {3} {March} {4} {April}
        {5} {May} {6} {June} {7} {July} {8} {August}
        {9} {September} {10} {October} {11} {November} {12} {December}
      }
  }
\cs_new_protected:Npn \__hit_bool_set_true:n #1
  {\bool_set_true:c {l__hit_#1_bool}
   \cs_set_eq:cN {ifhit@#1} \if_true:}
\cs_new_protected:Npn \__hit_bool_set_false:n #1
  {\bool_set_false:c {l__hit_#1_bool}
   \cs_set_eq:cN {ifhit@#1} \if_false:}
\cs_new_protected:Npn \__hit_bool_select:n #1
  {
    \cs_if_exist:cTF {l__hit_#1_bool}
      {\__hit_bool_set_true:n {#1}}
      {\use:c {hit@#1true}}
  }
\cs_new_protected:Npn \__hit_bool_set:nn #1#2
  {\str_if_eq:eeTF {#2} {true}
    {\__hit_bool_set_true:n {#1}} {\__hit_bool_set_false:n {#1}}}
\cs_new_protected:Npn \__hit_bool_declare:n #1
  {
    \bool_new:c {l__hit_#1_bool}
    \cs_new_eq:cN {ifhit@#1} \if_false:
    \cs_new_protected:cpn {hit@#1true}
      {\__hit_bool_set_true:n {#1}}
    \cs_new_protected:cpn {hit@#1false}
      {\__hit_bool_set_false:n {#1}}
  }
\cs_new_protected:Npn \__hit_key_define:nnn #1#2#3
  {\keys_define:nn {#1} {#2 .code:n = {#3}}}
\cs_new_protected:Npn \__hit_bool_option:nn #1#2
  {
    \__hit_bool_declare:n {#2}
    \keys_define:nn {hit}
      {
        #2 .choices:nn = {true,false}
          {\__hit_bool_set:nn {#2} {\l_keys_choice_tl}},
        #2 / unknown .code:n =
          {\ClassWarning{\c__hit_class_name_tl}
            {Value~`##1'~is~not~supported~by~option~`#2'}},
        #2 .default:n = true,
        #2 .initial:n = #1
      }
  }
\cs_new_protected:Npn \__hit_string_option_declare:n #1
  {
    \tl_new:c {l__hit_option_#1_tl}
    \cs_new:cpn {hit@#1} {\tl_use:c {l__hit_option_#1_tl}}
    \keys_define:nn {hit}
      {#1 .code:n = {\tl_set:cn {l__hit_option_#1_tl} {##1}}}
  }
\cs_new_protected:Npn \__hit_class_options_process:n #1
  {
    \keys_define:nn {hit}
      {
        unknown .code:n =
          {\exp_args:Ne \PassOptionsToClass
            {\l_keys_key_str
             \quark_if_no_value:nF {##1} {={\exp_not:n {##1}}}} {#1}}
      }
    \ProcessKeysOptions {hit}
    \keys_define:nn {hit}
      {unknown .code:n = {\msg_error:nnxx {keys} {unknown}
        {hit/\l_keys_key_str} {hit}}}
  }
\cs_new_protected:Npn \__hit_setup:nn #1#2 {\keys_set:nn {#1} {#2}}
\cs_new:Npn \__hit_bool_p:n #1 {\bool_if_p:c {l__hit_#1_bool}}
\cs_new:Npn \__hit_bool_if:nTF #1 {\bool_if:cTF {l__hit_#1_bool}}
\cs_new:Npn \__hit_bool_expr:nTF #1 {\bool_if:nTF {#1}}
\tl_new:N \l__hit_compare_a_tl
\tl_new:N \l__hit_compare_b_tl
\cs_new_protected:Npn \__hit_text_if_equal:nnTF #1#2#3#4
  {
    \group_begin:
      % Original titles contain robust LaTeX commands such as hspace.
      % Preserve them during comparison, just as ifthen's equal did.
      \protected@edef \l__hit_compare_a_tl {#1}
      \protected@edef \l__hit_compare_b_tl {#2}
      \tl_if_eq:NNTF \l__hit_compare_a_tl \l__hit_compare_b_tl
        {\group_end: #3} {\group_end: #4}
  }
\cs_new_eq:NN \__hit_engine_if_xetex:TF \sys_if_engine_xetex:TF
\tl_const:Nn \c__hit_info_prefix_tl {hit@}
\prop_new:N \g__hit_info_exports_prop
\cs_new_protected:Npn \__hit_info_export:n #1
  {
    \cs_gset_nopar:cpe {\c__hit_info_prefix_tl #1}
      {\exp_not:v {g__hit_info_#1_tl}}
    \exp_args:NNe \prop_gput:Nnn \g__hit_info_exports_prop
      {\c__hit_info_prefix_tl #1} {g__hit_info_#1_tl}
  }
\cs_new_protected:Npn \__hit_info_set:nn #1#2
  {
    \tl_if_exist:cF {g__hit_info_#1_tl}
      {\tl_new:c {g__hit_info_#1_tl}}
    \tl_gset:cn {g__hit_info_#1_tl} {#2}
    \__hit_info_export:n {#1}
  }
\cs_new_protected:Npn \__hit_info_define:nn #1#2
  {
    \cs_gset_nopar:cpn {#1} ##1
      {\__hit_info_set:nn {#2} {##1}}
    \use:c {#1} {}
  }
\cs_new_protected:Npn \__hit_info_declare:n #1
  {
    \keys_define:nn {hit}
      {#1 .code:n = {\use:c {#1} {##1}}}
    \__hit_info_define:nn {#1} {#1}
  }
\prop_new:N \g__hit_terms_prop
\tl_new:N \l__hit_term_scope_tl
\cs_new_protected:Npn \__hit_term_store:nn #1#2
  {
    \str_case:Vn \l__hit_term_scope_tl
      {
        {global}
          {\prop_gput:Nnn \g__hit_terms_prop {#1} {#2}
           \cs_gset_nopar:cpn {hit@#1} {#2}}
        {global-long}
          {\prop_gput:Nnn \g__hit_terms_prop {#1} {#2}
           \cs_gset:cpn {hit@#1} {#2}}
        {local}
          {\prop_put:Nnn \g__hit_terms_prop {#1} {#2}
           \cs_set_nopar:cpn {hit@#1} {#2}}
        {local-long}
          {\prop_put:Nnn \g__hit_terms_prop {#1} {#2}
           \cs_set:cpn {hit@#1} {#2}}
        {new}
          {\prop_put:Nnn \g__hit_terms_prop {#1} {#2}
           \cs_new:cpn {hit@#1} {#2}}
        {new-nopar}
          {\prop_put:Nnn \g__hit_terms_prop {#1} {#2}
           \cs_new_nopar:cpn {hit@#1} {#2}}
      }
  }
\keys_define:nn {hit/internal/terms}
  {
    unknown .code:n =
      {\exp_args:NV \__hit_term_store:nn \l_keys_key_str {#1}}
  }
\cs_new_protected:Npn \__hit_terms_set:nn #1#2
  {
    \tl_set:Nn \l__hit_term_scope_tl {#1}
    \keys_set:nn {hit/internal/terms} {#2}
  }
\cs_new:Npn \__hit_term:n #1
  {\exp_args:Ne \use:n {\prop_item:Nn \g__hit_terms_prop {#1}}}
\seq_new:N \l__hit_keywords_seq
\tl_new:N \l__hit_keywords_input_tl
\cs_new_protected:Npn \__hit_keywords_join:NNnnn #1#2#3#4#5
  {
    \seq_set_split_keep_spaces:Nnn #1 {,} {#4}
    \seq_map_inline:Nn #1
      {
        \tl_if_empty:NF #2 {\tl_gput_right:Nn #2 {#3}}
        \bool_if:nTF {#5}
          {\tl_gput_right:Ne #2 {\tl_trim_spaces:n {##1}}}
          {\tl_gput_right:Nn #2 {##1}}
      }
  }
\cs_generate_variant:Nn \__hit_keywords_join:NNnnn {Nc, NcnV, NcV}
\cs_new_protected:Npn \__hit_keywords_append:nn #1#2
  {
    \tl_set:No \l__hit_keywords_input_tl {#2}
    \tl_if_empty:NF \l__hit_keywords_input_tl
      {
        \__hit_keywords_join:NcnVn
          \l__hit_keywords_seq {g__hit_info_#1_tl}
          {\ignorespaces\use:c {hit@#1@separator}}
          \l__hit_keywords_input_tl {\c_false_bool}
      }
    \__hit_info_export:n {#1}
  }
\cs_new_protected:Npn \__hit_keywords_declare:n #1
  {
    \keys_define:nn {hit} {#1 .code:n = {\use:c {#1} {##1}}}
    \tl_new:c {g__hit_info_#1_tl}
    \__hit_info_export:n {#1}
    \cs_gset_nopar:cpn {#1} ##1 {\__hit_keywords_append:nn {#1} {##1}}
  }
\cs_new:Npn \__hit_wiseref_gap:
  {\cs_if_exist:cT {l__hit_english_bool}
     {\bool_if:cT {l__hit_english_bool} {\nobreakspace}}}
\cs_new:Npn \__hit_wiseref_algorithm_name:
  {\cs_if_exist:NTF \algorithmcfname {\algorithmcfname}
    {\cs_if_exist:cTF {l__hit_english_bool}
      {\bool_if:cTF {l__hit_english_bool} {Algorithm} {算法}} {算法}}}
\cs_new:Npn \__hit_wiseref_listing_name:
  {\cs_if_exist:NTF \lstlistingname {\lstlistingname}
    {\cs_if_exist:cTF {l__hit_english_bool}
      {\bool_if:cTF {l__hit_english_bool} {Listing} {代码}} {代码}}}
\cs_new_protected:Npn \__hit_wiseref_setup:
  {
    \RequirePackage {wiseref} [2026/10/10]
    \cs_if_exist:cTF {l__hit_english_bool}
      {\wiserefsetup{lang={\bool_if:cTF{l__hit_english_bool}{en}{zh}}}}
      {\wiserefsetup{lang=zh}}
    \wiserefsetup{
      figure={prefix={\figurename\__hit_wiseref_gap:},suffix={}},
      subfigure={prefix={\figurename\__hit_wiseref_gap:},suffix={}},
      table={prefix={\tablename\__hit_wiseref_gap:},suffix={}},
      subtable={prefix={\tablename\__hit_wiseref_gap:},suffix={}},
      appendix={prefix={\appendixname\__hit_wiseref_gap:},suffix={}},
      algocf={prefix={\__hit_wiseref_algorithm_name:\__hit_wiseref_gap:},suffix={}},
      lstlisting={prefix={\__hit_wiseref_listing_name:\__hit_wiseref_gap:},suffix={}}
    }
    \cs_if_exist:NTF \equationname
      {\wiserefsetup{equation={prefix={\equationname\__hit_wiseref_gap:},suffix={},
        number-format={\textup{(##1)}}}}}
      {\wiserefsetup{equation={prefix={式},suffix={},number-format={\textup{(##1)}}}}}
  }
\AddToHook {class/hithesisbook/after} [hithesis/wiseref] {\__hit_wiseref_setup:}
\AddToHook {class/hithesisart/after} [hithesis/wiseref] {\__hit_wiseref_setup:}
\AddToHook {class/hithesisartplus/after} [hithesis/wiseref] {\__hit_wiseref_setup:}

\ExplSyntaxOff
\csname cs_new_protected:Npn\endcsname \hit@legacy@patch@b{\ExplSyntaxOff
\patchcmd{\NAT@citexnum}{\def@NAT@last@yr{-\NAT@penalty}}
 {%
 \ifx\NAT@last@yr\relax
 \def@NAT@last@yr{\@citea}%
 \else
 \def@NAT@last@yr{-\NAT@penalty}%
 \fi
 }%
 {\typeout{Use comma between neighboring citations}}%
 {\ClassError{hithesisbook}{fail to patch \NAT@citexnum}{}}
\ExplSyntaxOn}
\csname cs_new_protected:Npn\endcsname \hit@legacy@patch@c{\ExplSyntaxOff
\pretocmd{\@makefntext}{\let\@makefnmark\hit@@makefnmark}{}{}
\ExplSyntaxOn}
\csname cs_new_protected:Npn\endcsname \hit@legacy@patch@d{\ExplSyntaxOff
\apptocmd{\@makefntext}{\let\@makefnmark\hit@makefnmark}{}{}
\ExplSyntaxOn}
\csname cs_new_protected:Npn\endcsname \hit@legacy@patch@e{\ExplSyntaxOff
\patchcmd{\@dottedtocline}{##4}{\csname hit@toc@font\endcsname ##4}{}{}
\ExplSyntaxOn}
\csname cs_new_protected:Npn\endcsname \hit@legacy@patch@f{\ExplSyntaxOff
\patchcmd{\@dottedtocline}{\hb@xt@\@pnumwidth}{\hbox}{}{}
\ExplSyntaxOn}
\csname cs_new_protected:Npn\endcsname \hit@legacy@patch@g{\ExplSyntaxOff
\patchcmd\NAT@citexnum{%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*##2*\else\NAT@cmt##2\fi
  }{}%
  \NAT@mbox{\NAT@@close}%
}{%
  \NAT@mbox{\NAT@@close}%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*##2*\else\textsuperscript{##2}\fi
  }{}%
}{}{}
\ExplSyntaxOn}
\csname cs_new_protected:Npn\endcsname \hit@legacy@patch@h{\ExplSyntaxOff
\patchcmd{\NAT@citex}{%
  \if*##2*\else\NAT@cmt##2\fi
  \if\relax\NAT@date\relax\else\NAT@@close\fi
}{%
  \if\relax\NAT@date\relax\else\NAT@@close\fi
  \if*##2*\else\textsuperscript{##2}\fi
}{}{}
\ExplSyntaxOn}
\ExplSyntaxOn
\__hit_bool_declare:n{bachelor}
\__hit_bool_declare:n{master}
\__hit_bool_declare:n{doctor}
\__hit_bool_declare:n{postdoc}
\__hit_key_define:nnn{hit}{type}{%
 \__hit_bool_set_false:n {bachelor}
 \__hit_bool_set_false:n {master}
 \__hit_bool_set_false:n {doctor}
 \__hit_bool_set_false:n {postdoc}
 \__hit_bool_select:n {#1}
}
\bool_if:cTF {l__hit_master_bool} {\relax} {
 \bool_if:cTF {l__hit_doctor_bool} {\relax} {
 \bool_if:cTF {l__hit_postdoc_bool} {\relax} {
 \__hit_bool_set_true:n {bachelor}
 }
 }
}
\__hit_bool_declare:n{shenzhen}
\__hit_bool_declare:n{weihai}
\__hit_bool_declare:n{harbin}
\__hit_key_define:nnn{hit}{campus}{%
 \__hit_bool_set_false:n {shenzhen}
 \__hit_bool_set_false:n {weihai}
 \__hit_bool_set_false:n {harbin}
 \__hit_bool_select:n {#1}
}
\bool_if:cTF {l__hit_weihai_bool} {\relax} {
 \bool_if:cTF {l__hit_shenzhen_bool} {\relax} {
 \__hit_bool_set_true:n {harbin}
 }
}
\__hit_bool_declare:n{english}
\__hit_bool_declare:n{chinese}
\__hit_key_define:nnn{hit}{language}{%
 \__hit_bool_set_false:n {english}
 \__hit_bool_set_false:n {chinese}
 \__hit_bool_select:n {#1}
}
\bool_if:cTF {l__hit_english_bool} {\relax} {
 \__hit_bool_set_true:n {chinese}
}
\__hit_bool_declare:n{geometrynewone}
\__hit_bool_declare:n{geometrynewtwo}
\__hit_bool_declare:n{geometrynewno}
\__hit_key_define:nnn{hit}{newgeometry}{%
 \__hit_bool_set_false:n {geometrynewone}
 \__hit_bool_set_false:n {geometrynewtwo}
 \__hit_bool_set_false:n {geometrynewno}
 \__hit_bool_select:n {geometrynew#1}
}
\__hit_bool_declare:n{zijvregu}
\__hit_bool_declare:n{zijvword}
\__hit_key_define:nnn{hit}{zijv}{%
 \__hit_bool_set_false:n {zijvregu}
 \__hit_bool_set_false:n {zijvword}
 \__hit_bool_select:n {zijv#1}
}
\__hit_bool_declare:n{citetwocomma}
\__hit_bool_declare:n{citetwoendash}
\__hit_bool_set_true:n {citetwoendash}
\__hit_key_define:nnn{hit}{citetwo}{%
 \__hit_bool_set_false:n {citetwocomma}
 \__hit_bool_set_false:n {citetwoendash}
 \__hit_bool_select:n {citetwo#1}
}

\bool_new:N \g_bib_authorupper_bool
\bool_set_false:N \g_bib_authorupper_bool
\__hit_key_define:nnn{hit}{bibauthorupper}{%
  \str_if_eq:nnT {#1} {full} {
    \bool_set_true:N \g_bib_authorupper_bool
  }
}

\int_new:N \g_bib_maxauthor_int
\int_set:Nn \g_bib_maxauthor_int {3}
\__hit_key_define:nnn{hit}{bibmaxauthor}{%
  \int_set:Nn \g_bib_maxauthor_int {#1}
  \int_if_zero:nT {\g_bib_maxauthor_int} {
    \int_gdecr:N \g_bib_maxauthor_int
  }
}

\str_new:N \g_bib_labelalign_str
\__hit_key_define:nnn{hit}{biblabelalign}{%
  \str_set:Nn \g_bib_labelalign_str {#1}
}

\__hit_bool_option:nn{false}{arialtoc}
\__hit_bool_option:nn{false}{arialtitle}
\__hit_bool_option:nn{true}{chapterbold}
\__hit_bool_option:nn{true}{raggedbottom}
\__hit_bool_option:nn{false}{pifootnote}
\__hit_bool_option:nn{false}{glue}
\__hit_bool_option:nn{false}{tocfour}
\__hit_bool_option:nn{true}{tocblank}
\__hit_bool_option:nn{true}{chapterhang}
\__hit_bool_option:nn{true}{fulltime}
\__hit_bool_option:nn{false}{etitleauto}
\__hit_bool_option:nn{false}{subtitle}
\__hit_bool_option:nn{false}{debug}
\__hit_bool_option:nn{false}{openright}
\__hit_bool_option:nn{false}{library}
\__hit_bool_option:nn{false}{capcenterlast}
\__hit_bool_option:nn{false}{subcapcenterlast}
\__hit_bool_option:nn{false}{absupper}
\__hit_bool_option:nn{true}{bsmainpagenumberline}
\bool_if:cTF {l__hit_harbin_bool} {\bool_if:cTF {l__hit_bachelor_bool} {
 \__hit_bool_option:nn{true}{bsfrontpagenumberline}~
} {\__hit_bool_option:nn{false}{bsfrontpagenumberline}}
} {\__hit_bool_option:nn{false}{bsfrontpagenumberline}}
\__hit_bool_option:nn{true}{bsheadrule}
\__hit_bool_option:nn{true}{newtxmath}
\__hit_bool_option:nn{false}{splitbibitem}
\__hit_bool_option:nn{false}{engtoc}
\__hit_string_option_declare:n{fontset}
\__hit_class_options_process:n{ctexbook}
\PassOptionsToPackage{no-math}{fontspec}
\bool_if:cTF {l__hit_bachelor_bool} {
\PassOptionsToClass{oneside}{book}~
} {}
\bool_if:cTF {l__hit_master_bool} {
\PassOptionsToClass{oneside}{book}~
} {}
\bool_if:cTF {l__hit_doctor_bool} {
\PassOptionsToClass{twoside}{book}~
} {}
\RequirePackage{ifthen}
\__hit_text_if_equal:nnTF{\hit@fontset}{}%
{%
 \PassOptionsToPackage{AutoFakeBold=2}{xeCJK}~
}%
{%
 \__hit_text_if_equal:nnTF{\hit@fontset}{siyuan}%
 {\relax}%
 {%
 \PassOptionsToPackage{AutoFakeBold=2}{xeCJK}~
 }%
 \PassOptionsToClass{fontset=\hit@fontset}{ctexbook}~
}%
\LoadClass[a4paper,openany,UTF8,zihao=-4,scheme=plain]{ctexbook}
\bool_if:cTF {l__hit_bachelor_bool} {\relax} {
 \bool_if:cTF {l__hit_master_bool} {\relax} {
 \bool_if:cTF {l__hit_doctor_bool} {\relax} {
 \bool_if:cTF {l__hit_postdoc_bool} {\relax} {
 \ClassError{hithesis}{%
 \MessageBreak Please~specify~thesis~type~in~option:~
 \MessageBreak type=[bachelor~|~master~|~doctor~|~postdoc]}{}~
 }
 }
 }
}
\bool_if:cTF {l__hit_zijvregu_bool} {\relax} {
 \bool_if:cTF {l__hit_zijvword_bool} {\relax} {
 \__hit_bool_set_true:n {zijvregu}
 }
}
\bool_if:cTF {l__hit_geometrynewone_bool} {\relax} {
 \bool_if:cTF {l__hit_geometrynewtwo_bool} {\relax} {
 \bool_if:cTF {l__hit_geometrynewno_bool} {\relax} {
 \__hit_bool_set_true:n {geometrynewtwo}
 }
 }
}
\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\__hit_engine_if_xetex:TF{}{%
 \ClassError{hithesis}{Please~use:~\MessageBreak xelatex}{}~
}
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{amssymb}
\setmainfont{TeXGyreTermesX}[
 UprightFont~=~*-Regular~,
 BoldFont~=~*-Bold~,
 ItalicFont~=~*-Italic~,
 BoldItalicFont~=~*-BoldItalic~,
 Extension~=~.otf~,
 ]
\setsansfont{texgyreheros}[
 UprightFont~=~*-regular~,
 BoldFont~=~*-bold~,
 ItalicFont~=~*-italic~,
 BoldItalicFont~=~*-bolditalic~,
 Extension~=~.otf~,
 ]
\setmonofont{texgyrecursor}[
 UprightFont~=~*-regular~,
 BoldFont~=~*-bold~,
 ItalicFont~=~*-italic~,
 BoldItalicFont~=~*-bolditalic~,
 Extension~=~.otf~,
]
\bool_if:cTF {l__hit_newtxmath_bool} {
 \cs_set_eq:NN \oldencodingdefault \encodingdefault
 \cs_set_eq:NN \oldrmdefault \rmdefault
 \cs_set_eq:NN \oldsfdefault \sfdefault
 \cs_set_eq:NN \oldttdefault \ttdefault
 \cs_set_nopar:Npn \encodingdefault {T1}~
 \cs_set:Npn \rmdefault {ntxtlf}~
 \cs_set:Npn \sfdefault {qhv}~
 \cs_set:Npn \ttdefault {ntxtt}~
 \RequirePackage{newtxmath}~
 \cs_set_eq:NN \encodingdefault \oldencodingdefault
 \cs_set_eq:NN \rmdefault \oldrmdefault
 \cs_set_eq:NN \sfdefault \oldsfdefault
 \cs_set_eq:NN \ttdefault \oldttdefault
} {}
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{enumitem}~%使用enumitem宏包,改变列表项的格式
\RequirePackage{environ}
\bool_if:cTF {l__hit_raggedbottom_bool} {
 \RequirePackage[bottom,perpage,hang]{footmisc}~
 \raggedbottom
} {
 \RequirePackage[perpage,hang]{footmisc}~
}
\bool_if:cTF {l__hit_pifootnote_bool} {
 \RequirePackage{pifont}~
} {}
\RequirePackage{xeCJKfntef}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\heavyrulewidth=1.5pt
\lightrulewidth=1pt
\cmidrulewidth=0.5pt
\RequirePackage{hyperref}
\hypersetup{%
 CJKbookmarks=true,~
 linktoc=all,~
 bookmarksnumbered=true,~
 bookmarksopen=true,~
 bookmarksopenlevel=1,~
 breaklinks=true,~
 colorlinks=false,~
 plainpages=false,~
 pdfborder=0~0~0~
}
\urlstyle{same}
\RequirePackage[sort&compress]{gbt7714}
\bool_if:cTF {l__hit_citetwocomma_bool} {
 \hit@legacy@patch@b%
} {}
\prop_new:N \c__hit_book_geometry_prop
\prop_gset_from_keyval:Nn \c__hit_book_geometry_prop
  {
    two =
      {centering,text={150true~mm,236true~mm},left=30true~mm,
       head=5true~mm,headsep=2true~mm,footskip=0true~mm,foot=5.2true~mm},
    one =
      {centering,text={150true~mm,240true~mm},left=30true~mm,
       head=5true~mm,headsep=0true~mm,footskip=0true~mm,foot=0true~mm},
    no =
      {text={150true~mm,224true~mm},top=35.5true~mm,left=30true~mm,
       head=5true~mm,headsep=2.5true~mm,foot=8.5true~mm}
  }
\tl_new:N \l__hit_geometry_options_tl
\cs_new_protected:Npn \__hit_book_geometry_apply:n #1
  {
    \prop_get:NnN \c__hit_book_geometry_prop {#1} \l__hit_geometry_options_tl
    \exp_args:NV \geometry \l__hit_geometry_options_tl
  }
\cs_new_protected:Npn \__hit_book_geometry_setup:
  {
    \bool_if:cTF {l__hit_debug_bool}
      {\RequirePackage[showframe]{geometry}} {\RequirePackage{geometry}}
    \geometry{a4paper,hcentering,ignoreall,nomarginpar}
    \bool_if:cTF {l__hit_geometrynewtwo_bool}
      {\__hit_book_geometry_apply:n {two}}
      {\bool_if:cTF {l__hit_geometrynewone_bool}
        {\__hit_book_geometry_apply:n {one}} {\__hit_book_geometry_apply:n {no}}}
    \bool_lazy_and:nnT
      {\bool_if_p:c {l__hit_harbin_bool}}
      {\bool_if_p:c {l__hit_bachelor_bool}}
      {\geometry{top=36.5true~mm,headsep=1true~mm,bottom=28.8true~mm}}
  }
\__hit_book_geometry_setup:
\bool_if:cTF {l__hit_debug_bool} {%
 \RequirePackage{layout}~
 \RequirePackage{layouts}~
 \RequirePackage{lineno}~
} {}
\RequirePackage{fancyhdr}
\RequirePackage{tabularx}
\RequirePackage{varwidth}
\RequirePackage{changepage}
\RequirePackage{multicol}
\RequirePackage[below]{placeins}%允许上一个section的浮动图形出现在下一个section的开始部分,还提供\FloatBarrier命令,使所有未处理的浮动图形立即被处理
\RequirePackage{flafter}~% 使得所有浮动体不能被放置在其浮动环境之前，以免浮动体在引述它的文本之前出现.
\RequirePackage{multirow}~%使用Multirow宏包，使得表格可以合并多个row格
\bool_if:cTF {l__hit_subcapcenterlast_bool} {
 \PassOptionsToPackage{centerlast}{subfigure}~
} {}
\RequirePackage{subfigure}%支持子图 %centerlast 设置最后一行是否居中
\RequirePackage[subfigure]{ccaption}~%支持双语标题
\RequirePackage[makeindex]{splitidx}
\newindex[]{china}
\newindex[]{english}
\bool_if:cTF {l__hit_english_bool} {
\RequirePackage[xindy,order=letter]{glossaries-extra}~
\newglossarystyle{engstyle}{%
 \setglossarystyle{long}%
 \cs_set:Npn \theglossary
  {\vspace{-\intextsep}\centering\begin{longtable}{@{\hskip 1cm}p{3.5cm}p{\glsdescwidth}}}
\cs_set:Npn \endtheglossary
  {\end{longtable}}}~
\setabbreviationstyle[acronym]{long-short}~
} {
\RequirePackage{glossaries}~
\setacronymstyle{short-long}~
}

\cs_set_nopar:Npn \genacrfullformat #1 #2 {%
 \glsentrylong{#1}%
}
\bool_if:cTF {l__hit_english_bool} {
\makenoidxglossaries
} {
\makeglossaries
}
\bool_if:cTF {l__hit_library_bool} {\__hit_bool_set_false:n {openright}} {\relax}
\cs_set_eq:NN \hit@cleardoublepage \cleardoublepage
\cs_new:Npn \__hit_clear_empty_double_page:N #1
  {\clearpage{\pagestyle{hit@empty}#1}}
\cs_new:Npn \__hit_clearemptydoublepage: {%
 \__hit_clear_empty_double_page:N \hit@cleardoublepage ~
}
\cs_set_eq:NN \cleardoublepage \__hit_clearemptydoublepage:
\cs_new:Npn \__hit_frontmatter:
  {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \@mainmatterfalse
 \pagenumbering{Roman}~
 \pagestyle{hit@empty}~
\bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
\bool_if:cTF {l__hit_zijvword_bool} {
\ziju{0.05416667}~
} {
\bool_if:cTF {l__hit_zijvregu_bool} {
\ziju{0.05580808}~
} {}
}
}
\cs_set:Npn \frontmatter {\__hit_frontmatter:}
\cs_new:Npn \__hit_mainmatter:
  {%
 \bool_if:cTF {l__hit_english_bool} {
 \relax
 } {
 \bool_if:cTF {l__hit_tocblank_bool} {%
 \addtocontents{toc}{\vspace{\baselineskip}}~%规范中并没有这一要求，此处不应该加
 \addtocontents{toe}{\vspace{\baselineskip}}~
 } {}%
 }
 \bool_if:cTF {l__hit_doctor_bool} {%
 \bool_if:cTF {l__hit_library_bool} {\clearpage} {\cleardoublepage}
 } {%
 \clearpage
 }%
 \@mainmattertrue
 \pagenumbering{arabic}~
 \pagestyle{hit@headings}~
}
\cs_set:Npn \mainmatter {\__hit_mainmatter:}
\cs_new:Npn \__hit_backmatter:
  {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \@mainmattertrue}
\cs_set:Npn \backmatter {\__hit_backmatter:}
\cs_set:Npn \normalsize {%
 \@setfontsize\normalsize{12bp}{\bool_if:cTF {l__hit_glue_bool} { 20.50394bp~\@plus 2.834646bp~\@minus 0bp} { 20.50394bp}}%
 \abovedisplayskip=8pt~
 \abovedisplayshortskip=8pt~
 \belowdisplayskip=\abovedisplayskip
 \belowdisplayshortskip=\abovedisplayshortskip}

\cs_new_protected:Npn \__hit_fontsize_declare:nn #1#2
  {
    \exp_args:Nc \NewDocumentCommand {#1} { O{1.3} }
      { \fontsize {#2} { ##1 \dimexpr #2 } \selectfont }
  }

\__hit_fontsize_declare:nn{dachu}{58bp}
\__hit_fontsize_declare:nn{chuhao}{42bp}
\__hit_fontsize_declare:nn{xiaochu}{36bp}
\__hit_fontsize_declare:nn{yihao}{26bp}
\__hit_fontsize_declare:nn{xiaoyi}{24bp}
\__hit_fontsize_declare:nn{erhao}{22bp}
\__hit_fontsize_declare:nn{xiaoer}{18bp}
\__hit_fontsize_declare:nn{sanhao}{16bp}
\__hit_fontsize_declare:nn{xsanhao}{15.9bp}
\__hit_fontsize_declare:nn{xiaosan}{15bp}
\__hit_fontsize_declare:nn{sihao}{14bp}
\__hit_fontsize_declare:nn{banxiaosi}{13bp}
\__hit_fontsize_declare:nn{xiaosi}{12bp}
\__hit_fontsize_declare:nn{dawu}{11bp}
\__hit_fontsize_declare:nn{wuhao}{10.5bp}
\__hit_fontsize_declare:nn{xiaowu}{9bp}
\__hit_fontsize_declare:nn{liuhao}{7.5bp}
\__hit_fontsize_declare:nn{xiaoliu}{6.5bp}
\__hit_fontsize_declare:nn{qihao}{5.5bp}
\__hit_fontsize_declare:nn{bahao}{5bp}
\cs_set_eq:NN \hit@headrule \headrule
\cs_new:Npn \__hit_book_headrule:
  {~
    \skip_vertical:n {1.190132pt}~
    \tex_hrule:D height~2.276208pt~width~\headwidth
    \skip_vertical:n {0.75pt}~
    \tex_hrule:D height~0.75pt~width~\headwidth
  }
\cs_new:Npn \__hit_page_number_plain: {\thepage}
\cs_new:Npn \__hit_page_number_simple:
  {-\nobreakspace{}\thepage\nobreakspace{}-}
\cs_new:Npn \__hit_page_number_bachelor:
  {-\hspace{\l__hit_page_number_sep_skip}\thepage\hspace{\l__hit_page_number_sep_skip}-}
\cs_new:Npn \__hit_page_number_main:
  {\bool_if:cTF {l__hit_bsmainpagenumberline_bool}
    {\__hit_page_number_bachelor:} {\__hit_page_number_plain:}}
\cs_new:Npn \__hit_page_number_front:
  {\bool_if:cTF {l__hit_bsfrontpagenumberline_bool}
    {\__hit_page_number_bachelor:} {\__hit_page_number_plain:}}
\cs_new:Npn \__hit_page_number_current:
  {\legacy_if:nTF {@mainmatter}
    {\__hit_page_number_main:} {\__hit_page_number_front:}}
\fancypagestyle{hit@empty}{%
 \fancyhf{}~
 \cs_set_eq:NN \headrule \hit@headrule %
 \cs_set:Npn \headrulewidth {0pt}~
 \cs_set:Npn \footrulewidth {0pt}~
}
\fancypagestyle{hit@scanpage}{%
 \fancyhf{}~
 \fancyfoot[C]{\xiaowu\__hit_page_number_simple:}~
 \cs_set_eq:NN \headrule \relax
 \cs_set:Npn \headrulewidth {0pt}~
 \cs_set:Npn \footrulewidth {0pt}~
}
\skip_new:N \l__hit_page_number_sep_skip
\__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{bachelor}}
{\skip_set:Nn \l__hit_page_number_sep_skip {.3333333em}}
{\skip_set:Nn \l__hit_page_number_sep_skip {.1666667em}}
\fancypagestyle{hit@headings}{%
 \fancyhf{}~
 \bool_if:cTF {l__hit_english_bool} {
 \fancyhead[C]{\xiaowu[0]\leftmark}~
 \fancyfoot[C]{\xiaowu\__hit_page_number_simple:}~
 \cs_set_eq:NN \headrule \__hit_book_headrule:
 } {
 \bool_if:cTF {l__hit_postdoc_bool} {
 \fancyhead[CO]{\songti\xiaowu[0]\leftmark}~
 \fancyhead[CE]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {postdoc@documenttitlenospace}}~
 } {}
 \bool_if:cTF {l__hit_doctor_bool} {
 \fancyhead[CO]{\songti\xiaowu[0]\leftmark}~
 \bool_if:cTF {l__hit_harbin_bool} {
 \fancyhead[CE]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {cxuewei}\__hit_term:n {cthesisname}}~
 } {}
 \bool_if:cTF {l__hit_shenzhen_bool} {
 \fancyhead[CE]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\bool_if:cTF {l__hit_doctor_bool} {} {\__hit_term:n {shenzhencampus}}\__hit_term:n {cdegree}\__hit_term:n {cthesisname}}~
 } {}
 \bool_if:cTF {l__hit_weihai_bool} {
 \fancyhead[CE]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {weihaicampus}\__hit_term:n {cdegree}\__hit_term:n {cthesisname}}~
 } {}
 } {
 \bool_if:cTF {l__hit_master_bool} {
 \bool_if:cTF {l__hit_harbin_bool} {
 \fancyhead[C]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {cxuewei}\__hit_term:n {cthesisname}}~
 } {}
 \bool_if:cTF {l__hit_shenzhen_bool} {
 \legacy_if:nTF {@mainmatter} {
 \fancyhead[C]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {cdegree}\__hit_term:n {cthesisname}}~
 } {
 \fancyhead[C]{\xiaowu[0]\leftmark}~
 }
 } {}
 \bool_if:cTF {l__hit_weihai_bool} {
 \fancyhead[C]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {weihaicampus}\__hit_term:n {cdegree}\__hit_term:n {cthesisname}}~
 } {}
 } {}
 }
 \bool_if:cTF {l__hit_bachelor_bool} {
 \bool_if:cTF {l__hit_harbin_bool} {
 \fancyhead[C]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {bachelor@cxuewei}\__hit_term:n {bachelor@cthesisname}}%
 } {}
 \bool_if:cTF {l__hit_shenzhen_bool} {
 \fancyhead[C]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {shenzhencampus}\__hit_term:n {bachelor@cxuewei}\__hit_term:n {bachelor@cthesisname}}%
 } {}
 \bool_if:cTF {l__hit_weihai_bool} {
 \bool_if:cTF {l__hit_bachelor_bool} {
 \fancyhead[C]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {bachelor@cxuewei}\__hit_term:n {bachelor@cthesisname}}%
 } {
 \fancyhead[C]{\songti\xiaowu[0]\__hit_term:n {cschoolname}\__hit_term:n {weihaicampus}\__hit_term:n {bachelor@cxuewei}\__hit_term:n {bachelor@cthesisname}}%
 }
 } {}
 \fancyfoot[C]{~
 \xiaowu
 \__hit_page_number_current:
 }~
 \bool_if:cTF {l__hit_bsheadrule_bool} {
 \cs_set_eq:NN \headrule \__hit_book_headrule:
 } {
 \cs_set:Npn \headrulewidth {0pt}~
 }
 } {
 \fancyfoot[C]{\xiaowu\__hit_page_number_simple:}~
 \cs_set_eq:NN \headrule \__hit_book_headrule:
 }
 }
 % 此处可能和word模板不一致
 % 页眉中小五汉字，0行距时，占用9bt，页眉高度为14pt, 所以以下数字之和要保持等于14pt-9bt=4.96634pt
 % 根据PlutoThesis模板中rule宽度定义为2.25， 0.75， 保持粗线和细线之间的间距为细线宽度。
 % 如果页眉是多行的情况，rule向下溢出
 \cs_set:Npn \footrulewidth {0pt}~
}
\AtBeginDocument{%此处解决页眉经典bug
 \pagestyle{hit@empty}~
 \cs_set:Npn \chaptermark #1 {\@mkboth{\CTEXthechapter\enspace#1}{}}}
\ctexset{%
 punct=quanjiao,~
 space=auto,~
 autoindent=true}
\setlist{nosep}
\cs_set_nopar:Npn \__hit_textcircled:n #1{%
 \int_compare:nNnTF {\value{#1}} > {9} {
 \ClassError{hithesis}%
 {Too~many~footnotes~in~this~page.}{Keep~footnote~less~than~10.}~
 } {}
 \bool_if:cTF {l__hit_pifootnote_bool} {%
 \ding{\the\numexpr\value{#1}+171\relax}%
 } {%
 \textcircled{\xiaoliu\arabic{#1}}%
 }}
\cs_set:Npn \thefootnote {\__hit_textcircled:n{footnote}}
\cs_set:Npn \thempfootnote {\__hit_textcircled:n{mpfootnote}}
\cs_set_nopar:Npn \footnoterule {\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\cs_set_eq:NN \__hit_latex_footnotesize: \footnotesize
\cs_set:Npn \footnotesize {\__hit_latex_footnotesize:\xiaowu[1.5]}
\footnotemargin1.5em\relax
\cs_set_eq:NN \hit@makefnmark \@makefnmark
\cs_set_nopar:Npn \hit@@makefnmark {\hbox{{\normalfont\@thefnmark}}}
\hit@legacy@patch@c
\hit@legacy@patch@d
\allowdisplaybreaks[4]
\predisplaypenalty=0~%公式之前可以换页，公式出现在页面顶部
\postdisplaypenalty=0
\cs_set:Npn \theequation {\int_compare:nNnTF {\c@chapter} > {\z@} {\thechapter-} {}\@arabic\c@equation}
\cs_set_nopar:Npn \make@df@tag {\@ifstar\__hit_make_df_tag__:n\make@df@tag@@@}
\cs_set_nopar:Npn \__hit_make_df_tag__:n #1{\cs_gset_nopar:Npn \df@tag {\__hit_maketag:n{#1}\cs_set_nopar:Npn \@currentlabel {#1}}}
\iffalse
\bool_if:cTF {l__hit_bachelor_bool} {
 \cs_set_nopar:Npn \__hit_maketag:n #1{\maketag@@@{%
 (\ignorespaces\text{\equationname\hskip0.5em}#1\unskip\@@italiccorr)}}~
 \cs_set_nopar:Npn \tagform@ #1{\maketag@@@{%
 (\ignorespaces\text{\equationname\hskip0.5em}#1\unskip\@@italiccorr)\equcaption{#1}}}~
} {}
\fi
\cs_set_nopar:Npn \__hit_maketag:n #1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
\cs_set_nopar:Npn \tagform@ #1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)\equcaption{#1}}}
\cs_set:Npn \eqref #1 {\textup{(\ref{#1})}}
\bool_if:cTF {l__hit_postdoc_bool} {
\skip_set:Nn \intextsep {10.5bp}~
\skip_set:Nn \textfloatsep {10.5bp}~
\skip_set:Nn \floatsep {10.5bp}~
} {
\skip_set:Nn \intextsep {\bool_if:cTF {l__hit_glue_bool} { 8.50398bp~\@plus 2.83465bp~\@minus 0bp} { 8.50398bp}}~
\skip_set:Nn \textfloatsep {\bool_if:cTF {l__hit_glue_bool} { 8.50398bp~\@plus 2.83465bp~\@minus 0bp} { 8.50398bp}}~
\skip_set:Nn \floatsep {\bool_if:cTF {l__hit_glue_bool} { 12bp~\@plus 2.83465bp~\@minus 0bp} { 12bp}}~
}
\tl_gput_right:Nn \appendix {\cs_set_nopar:Npn \thefigure {\thechapter-\arabic{figure}}}
\tl_gput_right:Nn \appendix {\cs_set_nopar:Npn \thetable {\thechapter-\arabic{table}}}
\tl_gput_right:Nn \appendix {\cs_set_nopar:Npn \theequation {\thechapter-\arabic{equation}}}
\cs_set:Npn \textfraction {0.15}
\cs_set:Npn \topfraction {0.85}
\cs_set:Npn \bottomfraction {0.65}
\cs_set:Npn \floatpagefraction {0.60}
\box_new:N \l__hit_caption_measure_box
\box_new:N \l__hit_caption_lines_box
\box_new:N \l__hit_caption_output_box
\box_new:N \l__hit_caption_last_line_box
\cs_new:Npn \__hit_caption_separator:nn #1#2
  {\bool_if:nTF {#1} {\hskip #2} {\enskip}}
\cs_new:Npn \__hit_caption_separator:
  {\__hit_caption_separator:nn
    {\bool_if_p:c {l__hit_bachelor_bool}} {\ccwd}}
\cs_new_protected:Npn \__hit_caption_measure:n #1
  {
    % Preserve the color grouping used by the original LaTeX savebox.
    \hbox_set:Nn \l__hit_caption_measure_box
      {\color@setgroup #1\color@endgroup}
  }
\cs_new_protected:Npn \__hit_caption_center_last:n #1
  {
    \skip_vertical:n {6.3bp}
    \group_begin:
      \vbox_set:Nn \l__hit_caption_lines_box {#1}~
      \vbox_set:Nn \l__hit_caption_output_box
        {
          \vbox_unpack_drop:N \l__hit_caption_lines_box ~
          \box_set_to_last:N \l__hit_caption_last_line_box
          \hbox_to_wd:nn {\textwidth}
            {\hfill\hbox_unpack:N \l__hit_caption_last_line_box ~\unskip\unskip\hfill}~
        }~
      \vbox_unpack_drop:N \l__hit_caption_output_box
    \group_end: ~
  }
\cs_new_protected:Npn \__hit_caption_typeset:n #1
  {
    \wuhao
    \__hit_caption_measure:n {#1}
    \dim_compare:nNnTF {\box_wd:N \l__hit_caption_measure_box} > {\hsize}
      {
        \bool_if:cTF {l__hit_capcenterlast_bool}
          {\__hit_caption_center_last:n {#1}} {#1}
        \par
      }
      {
        \legacy_if_gset_false:n {@minipage}
        \hbox_to_wd:nn {\hsize}
          {\hfil\box_use_drop:N \l__hit_caption_measure_box\hfil}
      }
  }
\cs_new_protected:Npn \__hit_caption_make:nn #1#2
  {
    \skip_vertical:N \abovecaptionskip
    \__hit_caption_typeset:n {#1\__hit_caption_separator: #2}
    \skip_vertical:N \belowcaptionskip
  }
\cs_set:Npn \@makecaption #1#2 {\__hit_caption_make:nn {#1}{#2}}
\cs_new:Npn \__hit_longtable_caption:nnn #1#2#3
  {
    \LT@mcol\LT@cols c
      {
        \hbox_to_wd:nn {0pt}
          {
            \hss
            \parbox[t]\LTcapwidth
              {
                \__hit_caption_typeset:n {#1{#2\__hit_caption_separator: ~}#3}
                \endgraf\skip_vertical:N \belowcaptionskip
              }
            \hss
          }
      }
  }
\cs_set:Npn \LT@makecaption #1#2#3
  {\__hit_longtable_caption:nnn {#1}{#2}{#3}}
\cs_set_nopar:Npn \longbionenumcaption #1 #2 #3 #4 #5 #6 #7 {%
\@if@contemptyarg{#1}{\caption{#2}}{\caption[#1]{#2}}%
\cs_gset_eq:NN \@cont@oldtablename \tablename
\cs_gset_nopar:Npn \tablename {#3}~
\cs_gset_eq:NN \LT@c@ption \@cont@LT@nonumintoc
\\[#6]~
\@if@contemptyarg{#4}{\caption{#5}}{\caption[#4]{#5}}%
\cs_gset_eq:NN \tablename \@cont@oldtablename
\cs_gset_eq:NN \LT@c@ption \@cont@oldLT@c@ption
\vspace{#7}}
\cs_set_eq:NN \__hit_longtable_array:w \LT@array
\cs_set_nopar:Npn \LT@array {\wuhao\__hit_longtable_array:w}~% set default font size
\cs_new:Npn \ltfontsize #1 {\cs_set_nopar:Npn \LT@array {#1\__hit_longtable_array:w}}
\cs_set:Npn \thesubtable {(\alph{subtable})}
\cs_set:Npn \thefigure {\arabic{chapter}-\arabic{figure}}%使图编号为 7-1 的格式 %\protect{~}
\cs_set:Npn \thesubfigure {(\alph{subfigure})}%使子图编号为 a)的格式
\exp_args:NNne \tl_set_rescan:Nnn \p@subfigure
  {\char_set_catcode_active:n {126}}
  {\exp_not:N \thefigure \c_tilde_str}
\cs_set:Npn \thetable {\arabic{chapter}-\arabic{table}}%使表编号为 7-1 的格式
\setitemize{leftmargin=0em,itemsep=0em,partopsep=0em,parsep=0em,topsep=0em,itemindent=3em}
\setenumerate{leftmargin=0em,itemsep=0em,partopsep=0em,parsep=0em,topsep=0em,itemindent=3.5em}
\cs_new:Npn \citeup #1 {\textsuperscript{\cite{#1}}}
\captionnamefont{\wuhao}
\captiontitlefont{\wuhao}
\cs_set:Npn \subcapsize {\wuhao}
\skip_set:Nn \abovecaptionskip {0pt}%为了双标题之间的间距，不能设置
\skip_set:Nn \belowcaptionskip {0pt}
\newcounter{pubctr}~%自定义新计数器
\cs_new:Npn \publist
  {%%%%%定义新环境
\begin{list}{[\arabic{pubctr}]}~%%标签格式
 {~
 \usecounter{pubctr}~
 \skip_set:Nn \leftmargin {1.7em}~% 左边界 \leftmargin =\itemindent + \labelwidth + \labelsep
 \skip_set:Nn \itemindent {0em}~% 标号缩进量
 \skip_set:Nn \labelsep {0.5em}~% 标号和列表项之间的距离,默认0.5em
 \skip_set:Nn \rightmargin {0em}~% 右边界
 \skip_set:Nn \topsep {0ex}~% 列表到上下文的垂直距离
 \skip_set:Nn \parsep {0ex}~% 段落间距
 \skip_set:Nn \itemsep {0ex}~% 标签间距
 \skip_set:Nn \listparindent {0pt}~% 段落缩进量
 }}
\cs_new:Npn \endpublist
  {\end{list}}
\renewtheoremstyle{plain}
{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\theorem@separator]}
{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\ ##3\theorem@separator]}
\theorembodyfont{\songti\rmfamily}
\theoremheaderfont{\heiti\rmfamily}
\theoremsymbol{$\square$}
\skip_set:Nn \theorempreskipamount {0pt}
\skip_set:Nn \theorempostskipamount {-2pt}
\skip_set:Nn \parindent {2em}
\arraycolsep=1.6pt
\cs_set_nopar:Npn \__hit_title_font: {%
 \bool_if:cTF {l__hit_arialtitle_bool} {\sffamily} {\heiti}}
\cs_new:Npn \__hit_chapter_titleformat:n #1 {%开启悬挂缩进选项
 \bool_if:cTF {l__hit_english_bool} {
 \MakeUppercase{#1}~
 } {
 \__hit_text_if_equal:nnTF{#1}{\eabstractcname}%
 {\bool_if:cTF {l__hit_chapterbold_bool} {\bfseries} {} #1}%
 % 实现章标题的居中加悬挂缩进，注意，此处一定是\CTEX@chaptername\CTEX@chapter@aftername, 否则是英文标题长度
  {\bool_if:cTF {l__hit_chapterhang_bool}
    {\__hit_measure_width:Nn \tex_hangindent:D {\CTEX@chaptername\CTEX@chapter@aftername}
     \int_set:Nn \tex_hangafter:D {1}} {}#1}~
 }
}
\cs_new:Npn \__hit_chapter_engformat:n #1 {%开启悬挂缩进选项
 \begin{center}~
 \__hit_title_font:
 \legacy_if:nTF {@mainmatter} {
 \xiaoer[1.57481]~
 } {
 \sanhao[1.57481]~
 }\bfseries
 #1~
 \end{center}}
\cs_new:Npn \__hit_chapter_engnameformat:n #1 {%开启悬挂缩进选项
 \begin{center}~
 \MakeUppercase{#1}~
 \end{center}}
\cs_new:Npn \__hit_chapter_postdocformat:n #1 {\centering\__hit_title_font:\xiaoer[1.57481]\textbf{#1}}
\box_new:N \l__hit_afterheading_indent_box
\cs_set:Npn \@afterheading {%
 \@nobreaktrue
 \everypar{%
 \legacy_if:nTF {@nobreak} {
 \@nobreakfalse
 \clubpenalty 1~
 \legacy_if:nTF {@afterindent} { } {
  {\box_set_to_last:N \l__hit_afterheading_indent_box}%
 }
 } {
 \clubpenalty 1~
 \everypar{}%
 }}}
\bool_if:cTF {l__hit_english_bool} {
 \ctexset{%
 chapter={~
 afterindent=true,~
 pagestyle={hit@headings},~
 beforeskip={28.34646bp},%一个空行 1.57481 × 18
 afterskip={28.74646bp},%0.8应该不计算间距 0.8 × 18 + 0.57481×18
 aftername={\par},~
 format={\__hit_chapter_engformat:n},~
 nameformat={\__hit_chapter_engnameformat:n},%\center 会影响之后全局
 numberformat=\relax,~
 titleformat={\__hit_chapter_titleformat:n},~
 fixskip=true,~% 添加这一行去除默认间距
 %hang=true,
 },~
 section={~
 afterindent=true,~
 beforeskip={\bool_if:cTF {l__hit_glue_bool} { 19.84252bp~\@plus 2.834646bp~\@minus 0bp~} { 19.84252bp~}},%上下空0.5行
 afterskip={\bool_if:cTF {l__hit_glue_bool} { 19.84252bp~\@plus 2.834646bp~\@minus 0bp~} { 19.84252bp~}},~
 format={\__hit_title_font:\bool_if:cTF {l__hit_glue_bool} {\fontsize{15bp}{21bp~\@plus 1.677267bp~\@minus 1.157391bp}} {\fontsize{15bp}{21bp}}\selectfont\bfseries},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 subsection={~
 afterindent=true,~
 beforeskip={\bool_if:cTF {l__hit_glue_bool} { 17.00787bp~\@plus 2.834646bp~\@minus 0bp~} { 17.00787bp~}},~
 afterskip={\bool_if:cTF {l__hit_glue_bool} { 17.00787bp~\@plus 2.834646bp~\@minus 0bp~} { 17.00787bp~}},~
 format={\__hit_title_font:\bool_if:cTF {l__hit_glue_bool} {\fontsize{14bp}{18bp~\@plus 1.842609bp~\@minus 0.9920497bp}} {\fontsize{14bp}{18bp}}\selectfont\bfseries},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 subsubsection={~
 afterindent=true,~
 beforeskip={\bool_if:cTF {l__hit_glue_bool} { 8.503937bp~\@plus 2.834646bp~\@minus 0bp~} { 8.503937bp~}},~
 afterskip={\bool_if:cTF {l__hit_glue_bool} { 8.503937bp~\@plus 2.834646bp~\@minus 0bp~} { 8.503937bp~}},~
 format={\__hit_title_font:\normalsize},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 paragraph/afterindent=true,~
 subparagraph/afterindent=true~
 }~
} {
\bool_if:cTF {l__hit_postdoc_bool} {
 \ctexset{%
 chapter={~
 afterindent=true,~
 pagestyle={hit@headings},~
 beforeskip={28.34646bp},%一个空行 1.57481 × 18
 afterskip={28.74646bp},%0.8应该不计算间距 0.8 × 18 + 0.57481×18
 aftername=\enspace,~
 format={\__hit_chapter_postdocformat:n},%\center 会影响之后全局
 nameformat=\relax,~
 numberformat=\relax,~
 titleformat=\__hit_chapter_titleformat:n,~
 fixskip=true,~% 添加这一行去除默认间距
 %hang=true,
 },~
 section={~
 afterindent=true,~
 beforeskip={\bool_if:cTF {l__hit_glue_bool} { 19.84252bp~\@plus 2.834646bp~\@minus 0bp~} { 19.84252bp~}},%上下空0.5行
 afterskip={\bool_if:cTF {l__hit_glue_bool} { 19.84252bp~\@plus 2.834646bp~\@minus 0bp~} { 19.84252bp~}},~
 format={\__hit_title_font:\bool_if:cTF {l__hit_glue_bool} {\fontsize{15bp}{21bp~\@plus 1.677267bp~\@minus 1.157391bp}} {\fontsize{15bp}{21bp}}\selectfont\bfseries},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 subsection={~
 afterindent=true,~
 beforeskip={\bool_if:cTF {l__hit_glue_bool} { 17.00787bp~\@plus 2.834646bp~\@minus 0bp~} { 17.00787bp~}},~
 afterskip={\bool_if:cTF {l__hit_glue_bool} { 17.00787bp~\@plus 2.834646bp~\@minus 0bp~} { 17.00787bp~}},~
 format={\__hit_title_font:\bool_if:cTF {l__hit_glue_bool} {\fontsize{14bp}{18bp~\@plus 1.842609bp~\@minus 0.9920497bp}} {\fontsize{14bp}{18bp}}\selectfont\bfseries},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 subsubsection={~
 afterindent=true,~
 beforeskip={\bool_if:cTF {l__hit_glue_bool} { 8.503937bp~\@plus 2.834646bp~\@minus 0bp~} { 8.503937bp~}},~
 afterskip={\bool_if:cTF {l__hit_glue_bool} { 8.503937bp~\@plus 2.834646bp~\@minus 0bp~} { 8.503937bp~}},~
 format={\__hit_title_font:\normalsize},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 paragraph/afterindent=true,~
 subparagraph/afterindent=true~
 }~
\par
} {
 \ctexset{%
 chapter={~
 afterindent=true,~
 pagestyle={hit@headings},~
 beforeskip={\__hit_bool_expr:nTF{\__hit_bool_p:n{weihai}~&&~\__hit_bool_p:n{bachelor}}{49bp}{28.34646bp}},%一个空行 1.57481 × 18
 afterskip={\__hit_bool_expr:nTF{\__hit_bool_p:n{weihai}~&&~\__hit_bool_p:n{bachelor}}{46bp}{28.74646bp}},%0.8应该不计算间距 0.8 × 18 + 0.57481×18
 aftername=%
 {%
 \__hit_bool_expr:nTF{(\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{master})~||~
 (\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{bachelor})}%
 {\quad}{\enspace}%
 },~
 format={\centering\__hit_title_font:\xiaoer[1.57481]\bool_if:cTF {l__hit_chapterbold_bool} {\bool_if:cTF {l__hit_bachelor_bool} {\bfseries} {}} {}},%\center 会影响之后全局
 nameformat=\relax,~
 numberformat=\relax,~
 titleformat=\__hit_chapter_titleformat:n,~
 fixskip=true,~% 添加这一行去除默认间距
 %hang=true,
 },~
 section={~
 afterindent=true,~
 beforeskip={\bool_if:cTF {l__hit_glue_bool} { 19.84252bp~\@plus 2.834646bp~\@minus 0bp~} { 19.84252bp~}},%上下空0.5行
 afterskip={\bool_if:cTF {l__hit_glue_bool} { 19.84252bp~\@plus 2.834646bp~\@minus 0bp~} { 19.84252bp~}},~
 format={\__hit_title_font:\bool_if:cTF {l__hit_glue_bool} {\fontsize{15bp}{21bp~\@plus 1.677267bp~\@minus 1.157391bp}} {\fontsize{15bp}{21bp}}\selectfont},~
 aftername=%
 {%
 \__hit_bool_expr:nTF{(\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{master})~||~
 ((\__hit_bool_p:n{shenzhen}~||~\__hit_bool_p:n{harbin})~&&~\__hit_bool_p:n{bachelor})}%
 {\quad}{\enspace}%
 },~
 fixskip=true,~
 break={},~
 },~
 subsection={~
 afterindent=true,~
 beforeskip={\bool_if:cTF {l__hit_glue_bool} { 17.00787bp~\@plus 2.834646bp~\@minus 0bp~} { 17.00787bp~}},~
 afterskip={\bool_if:cTF {l__hit_glue_bool} { 17.00787bp~\@plus 2.834646bp~\@minus 0bp~} { 17.00787bp~}},~
 format={\__hit_title_font:\bool_if:cTF {l__hit_glue_bool} {\fontsize{14bp}{18bp~\@plus 1.842609bp~\@minus 0.9920497bp}} {\fontsize{14bp}{18bp}}\selectfont},~
 aftername=%
 {%
 \__hit_bool_expr:nTF{(\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{master})~||~
 ((\__hit_bool_p:n{shenzhen}~||~\__hit_bool_p:n{harbin})~&&~\__hit_bool_p:n{bachelor})}%
 {\quad}{\enspace}%
 },~
 fixskip=true,~
 break={},~
 },~
 subsubsection={~
 afterindent=true,~
 beforeskip={\bool_if:cTF {l__hit_glue_bool} { 8.503937bp~\@plus 2.834646bp~\@minus 0bp~} { 8.503937bp~}},~
 afterskip={\bool_if:cTF {l__hit_glue_bool} { 8.503937bp~\@plus 2.834646bp~\@minus 0bp~} { 8.503937bp~}},~
 format={\__hit_title_font:\normalsize},~
 aftername=%
 {%
 \__hit_bool_expr:nTF{(\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{master})~||~
 ((\__hit_bool_p:n{shenzhen}~||~\__hit_bool_p:n{harbin})~&&~\__hit_bool_p:n{bachelor})}%
 {\quad}{\enspace}%
 },~
 fixskip=true,~
 break={},~
 },~
 paragraph/afterindent=true,~
 subparagraph/afterindent=true~
 }~
}
}
\bool_if:cTF {l__hit_english_bool} {
\NewDocumentCommand{\__hit_appendix_chapter:w}{s~o~m~o}{%
 \IfBooleanT{#1}%
 {~
 \phantomsection
 \IfValueTF{#2}{~
 \markboth{#2}{#2}~
 }{~
 \markboth{#3}{#3}~
 }~
\par
 \__hit_text_if_equal:nnTF{#3}{\cabstractcname}%
 {\relax}~
 {\addcontentsline{toc}{chapter}{\texorpdfstring{\bool_if:cTF {l__hit_arialtitle_bool} {\sffamily\heiti} {\heiti} #3}{#3}}}~
\par
 \IfValueT{#4}{\addcontentsline{toe}{chapter}{\texorpdfstring{\bfseries #4}{#4}}}~
 \__hit_latex_chapter:w*{#3}~
 }~
}~
} {
\NewDocumentCommand{\__hit_appendix_chapter:w}{s~o~m~o}{%
 \IfBooleanT{#1}%
 {~
 \phantomsection
 \IfValueTF{#2}{~
 \markboth{#2}{#2}~
 }{~
 \markboth{#3}{#3}~
 }~
 \__hit_text_if_equal:nnTF{#3}{\eabstractcname}%
 {\addcontentsline{toc}{chapter}{\texorpdfstring{\bool_if:cTF {l__hit_arialtitle_bool} {\sffamily\heiti} {\heiti} \bool_if:cTF {l__hit_absupper_bool} {\MakeUppercase{#3}} {#3}}{#3}}}~
 {\addcontentsline{toc}{chapter}{\texorpdfstring{\bool_if:cTF {l__hit_arialtitle_bool} {\sffamily\heiti} {\heiti} #3}{#3}}}~
 \IfValueT{#4}{\addcontentsline{toe}{chapter}{\texorpdfstring{\bfseries #4}{#4}}}~
 \__hit_latex_chapter:w*{#3}~
 }~
}~
}
\cs_new:Npn \BiAppChapter #1 #2 {\phantomsection
 \chapter{#1}~
 \addcontentsline{toe}{chapter}{\texorpdfstring{\bfseries \xiaosi Appendix~\thechapter\nobreakspace{}\nobreakspace{}#2}{Appendix~\thechapter\nobreakspace{}\nobreakspace{}#2}}~
}
\cs_set_eq:NN \__hit_latex_chapter:w \chapter
\RenewDocumentCommand{\chapter}{s~o~m~o}{%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}\phantomsection%
 \IfBooleanTF{#1}%
 {% if \chapter*
 \IfNoValueTF{#2}%
 {\__hit_latex_chapter:w*{#3}}%
 {\__hit_latex_chapter:w*[#2]{#3}}%
 \IfValueT{#4}{%
 \addcontentsline{toe}{chapter}{\texorpdfstring{\bfseries #4}{#4}}~
 }~
 }%
 {% if \chapter
 \IfNoValueTF{#2}%
 {\__hit_latex_chapter:w{#3}}%
 {\__hit_latex_chapter:w[#2]{#3}}%
 \IfValueT{#4}{%
 \addcontentsline{toe}{chapter}~
 {%
 \texorpdfstring
 {\bfseries\relax \__hit_engtoc_chapapp: \thechapter\hspace{0.5em}\ignorespaces #4}~
 {\__hit_engtoc_chapapp: \thechapter\hspace{0.5em}\ignorespaces #4}~
 }~
 }~
 }~
}
\cs_set_eq:NN \__hit_latex_section:w \section
\RenewDocumentCommand\section{s~o~m~o}{~
 \IfBooleanTF{#1}%
 {% if \section*
 \IfNoValueTF{#2}%
 {\__hit_latex_section:w*{#3}}%
 {\__hit_latex_section:w*[#2]{#3}}%
 \IfValueT{#4}{%
 \addcontentsline{toe}{section}{#4}~
 }~
 }%
 {% if \section
 \IfNoValueTF{#2}%
 {\__hit_latex_section:w{#3}}%
 {\__hit_latex_section:w[#2]{#3}}%
 \IfValueT{#4}{%
 \addcontentsline{toe}{section}{\protect\numberline{\use:c {thesection}}\ignorespaces #4}~
 }~
 }~
}
\cs_set_eq:NN \__hit_latex_subsection:w \subsection
\RenewDocumentCommand\subsection{s~o~m~o}{~
 \IfBooleanTF{#1}%
 {% if \subsection*
 \IfNoValueTF{#2}%
 {\__hit_latex_subsection:w*{#3}}%
 {\__hit_latex_subsection:w*[#2]{#3}}%
 \IfValueT{#4}{%
 \addcontentsline{toe}{subsection}{#4}~
 }~
 }%
 {% if \subsection
 \IfNoValueTF{#2}%
 {\__hit_latex_subsection:w{#3}}%
 {\__hit_latex_subsection:w[#2]{#3}}%
 \IfValueT{#4}{%
 \addcontentsline{toe}{subsection}{\protect\numberline{\use:c {thesubsection}}\ignorespaces #4}~
 }~
 }~
}
\cs_set_eq:NN \__hit_latex_subsubsection:w \subsubsection
\RenewDocumentCommand\subsubsection{s~o~m~o}{~
 \IfBooleanTF{#1}%
 {% if \subsubsection*
 \IfNoValueTF{#2}%
 {\__hit_latex_subsubsection:w*{#3}}%
 {\__hit_latex_subsubsection:w*[#2]{#3}}%
 \IfValueT{#4}{%
 \addcontentsline{toe}{subsubsection}{#4}~
 }~
 }%
 {% if \subsubsection
 \IfNoValueTF{#2}%
 {\__hit_latex_subsubsection:w{#3}}%
 {\__hit_latex_subsubsection:w[#2]{#3}}%
 \IfValueT{#4}{%
 \addcontentsline{toe}{subsubsection}{\protect\numberline{\use:c {thesubsubsection}}\ignorespaces #4}~
 }~
 }~
}

\__hit_info_declare:n{statesecrets}~%密级
\__hit_info_declare:n{natclassifiedindex}~%国内图书分类号
\__hit_info_declare:n{intclassifiedindex}~%国际图书分类号

\__hit_info_declare:n{ctitlecover}~%中文标题封面
\__hit_info_declare:n{ctitle}~%中文标题
\__hit_info_declare:n{csubtitle}~%中文副标题
\__hit_info_declare:n{cxueke}~%中文学科
\__hit_info_declare:n{cauthor}~%中文作者
\__hit_info_declare:n{csupervisor}~%中文导师
\__hit_info_declare:n{cassosupervisor}~%中文副导师
\__hit_info_declare:n{ccosupervisor}%中文联合导师
\__hit_info_declare:n{caffil}%中文院系
\__hit_info_declare:n{csubject}%中文专业
\__hit_info_declare:n{firstpagecdate}
\__hit_info_declare:n{cdate}
\__hit_info_declare:n{cnumber}
\__hit_info_declare:n{cpositionname}
\__hit_info_declare:n{cfinishdate}
\__hit_info_declare:n{csubmitdate}
\__hit_info_declare:n{cstartdate}
\__hit_info_declare:n{cenddate}

\__hit_info_declare:n{cstudentid}%
\__hit_info_declare:n{cstudenttype}%
\__hit_info_declare:n{ctitleone}%
\__hit_info_declare:n{ctitletwo}%

\__hit_info_declare:n{etitle}~%英文标题
\__hit_info_declare:n{esubtitle}~%英文标题
\__hit_info_declare:n{exueke}~%英文学科
\__hit_info_declare:n{eauthor}~%英文作者
\__hit_info_declare:n{esupervisor}~%英文导师
\__hit_info_declare:n{eassosupervisor}~%英文副导师
\__hit_info_declare:n{ecosupervisor}~%英文联合导师
\__hit_info_declare:n{eaffil}
\__hit_info_declare:n{esubject}
\__hit_info_declare:n{edate}
\__hit_info_declare:n{estudenttype}
\tl_new:N \g__hit_info_cabstract_tl
\cs_new:Npn \__hit_cabstract_collect:n #1
  {\__hit_info_set:nn {cabstract} {#1}}
\cs_new:Npn \cabstract
  {\Collect@Body\__hit_cabstract_collect:n}
\cs_new:Npn \endcabstract
  {}
\tl_new:N \g__hit_info_eabstract_tl
\cs_new:Npn \__hit_eabstract_collect:n #1
  {\__hit_info_set:nn {eabstract} {#1}}
\cs_new:Npn \eabstract
  {\Collect@Body\__hit_eabstract_collect:n}
\cs_new:Npn \endeabstract
  {}
\__hit_keywords_declare:n{ckeywords}
\__hit_keywords_declare:n{ekeywords}
\NewDocumentCommand\hitsetup{m}{\__hit_setup:nn{hit}{#1}}
\AfterPreamble{%
 \tl_if_empty:NTF \g__hit_info_firstpagecdate_tl{\firstpagecdate{\g__hit_info_cdate_tl}}{}%
}
\dim_new:N \l__hit_cover_title_width_dim
\cs_new:Npn \__hit_cover_label:nn #1#2
  {\begin{CJKfilltwosides}[b]{#1}#2\end{CJKfilltwosides}}
\cs_new:Npn \__hit_cover_label:n #1
  {\__hit_cover_label:nn {\l__hit_cover_title_width_dim} {#1}}
\NewDocumentCommand \hit@put@title {O{\l__hit_cover_title_width_dim} m}
  {\__hit_cover_label:nn {#1}{#2}}

\cs_set_nopar:Npn \__hit_first_titlepage: {%
 \bool_if:cTF {l__hit_postdoc_bool} {
 \__hit_first_titlepage_postdoc:
 } {
 \bool_if:cTF {l__hit_bachelor_bool} {
 \bool_if:cTF {l__hit_harbin_bool} {
 \__hit_first_titlepage_other:
 } {
 \__hit_first_titlepage_bachelor:
 }
 } {
 \__hit_first_titlepage_other:
 }
 }
 }

\cs_set_nopar:Npn \__hit_second_titlepage: {%
 \bool_if:cTF {l__hit_postdoc_bool} {
 \__hit_second_titlepage_postdoc:
 } {
 \bool_if:cTF {l__hit_bachelor_bool} {
 \bool_if:cTF {l__hit_harbin_bool} {
 \__hit_second_titlepage_harbinbachelor:
 } {
 \__hit_second_titlepage_bachelor:
 }
 } {
 \__hit_second_titlepage_other:
 }
 }
 }
\cs_new:Npn \__hit_first_titlepage_postdoc: {~
 {\songti\sihao\cs_set:Npn \arraystretch {2}\ %
 \begin{tabular}{@{}r@{}l@{\hspace{7\ccwd}}r@{}l@{\hspace{3em}}r}~
 \__hit_term:n {postdoc@classifiedindex}&\underline{\makebox[6\ccwd]{\g__hit_info_natclassifiedindex_tl}}&\__hit_term:n {postdoc@secretlevel}&\underline{\makebox[6\ccwd]{\g__hit_info_statesecrets_tl}}&\\~
 \__hit_term:n {postdoc@UDC}&\underline{\makebox[6\ccwd]{\g__hit_info_intclassifiedindex_tl}}&\__hit_term:n {postdoc@number}&\underline{\makebox[6\ccwd]{\g__hit_info_cnumber_tl}}&\\~
 \end{tabular}\cs_set:Npn \arraystretch {1}}~
 \parbox[t][5cm][b]{\textwidth}{\begin{center}\heiti\xiaoer[2]\__hit_term:n {cschoolname}\par
 \__hit_term:n {postdoc@documenttitle}\end{center}}~
 \parbox[b][4cm][b]{\textwidth}{~
 \songti\xiaosan[2]\cs_set:Npn \arraystretch {1.5}~
 \begin{center}~
 \begin{tabular}{c}~
 \makebox[9cm]{\g__hit_info_ctitleone_tl}\\~
 \hline
 \makebox[9cm]{\g__hit_info_ctitletwo_tl}\\~
 \hline
 \end{tabular}\cs_set:Npn \arraystretch {1}~
 \end{center}}~
 \begin{center}~
 \songti\sihao[2]\centering\g__hit_info_cauthor_tl
 \end{center}~
 \parbox[b][4.5cm][b]{\textwidth}{~
 \songti\sihao[2]\cs_set:Npn \arraystretch {1.5}~
 \begin{center}~
 \begin{tabular}{rl}~
 \__hit_term:n {postdoc@finishdate} &~\underline{\makebox[6cm]{\g__hit_info_cfinishdate_tl}}\\~
 \__hit_term:n {postdoc@submitdate} &~\underline{\makebox[6cm]{\g__hit_info_csubmitdate_tl\hfill}}\\~
 \end{tabular}\cs_set:Npn \arraystretch {1}~
 \end{center}~
 }~
 \vfill
 {\songti\sihao[2]~
 \begin{center}~
 \__hit_term:n {cschoolname}%
 \bool_if:cTF {l__hit_harbin_bool} {
 \__hit_term:n {harbincampus}
 } {}
 \bool_if:cTF {l__hit_weihai_bool} {
 \__hit_term:n {weihaicampus}
 } {}
 \bool_if:cTF {l__hit_shenzhen_bool} {
 \__hit_term:n {shenzhencampus@postdoc}
 } {}
 \end{center}~
 \begin{center}~
 \g__hit_info_cdate_tl
 \end{center}}~
}

\cs_new:Npn \__hit_second_titlepage_postdoc: {~
 \__hit_text_if_equal:nnTF{\hit@fontset}{siyuan}%
 {\xiaosi[1]\vspace*{0.65em}}%
 {\xiaosi[1]\songti\textcolor[rgb]{1,1,1}{{\__hit_term:n {hi}}}}%
 \vspace*{1.2cm}~
 \begin{center}~
 \parbox[t][8cm][t]{\textwidth}{~
 \begin{center}\songti\sanhao[2]\g__hit_info_ctitlecover_tl\end{center}~
 \vspace*{16bp}~
 \begin{center}\sihao[2]\MakeUppercase{\g__hit_info_etitle_tl}\end{center}~
 }~
 \parbox[t][5cm][t]{\textwidth}{~
 \begin{center}\songti\sihao[2]~
 \begin{tabularx}{0.6\linewidth}{l@{\__hit_term:n {postdoc@separator}}l}~
 \__hit_term:n {postdoc@authorname} &~\g__hit_info_cauthor_tl \\~
 \__hit_term:n {postdoc@supervisor} &~\g__hit_info_csupervisor_tl \\~
 \__hit_term:n {postdoc@positionname} &~\g__hit_info_cpositionname_tl \\~
 \__hit_term:n {postdoc@major} &~\g__hit_info_csubject_tl \\~
 \end{tabularx}~
 \begin{tabularx}{0.6\linewidth}{l@{\__hit_term:n {postdoc@separator}}l}~
 \__hit_term:n {postdoc@startdate} &~\g__hit_info_cstartdate_tl \\~
 \__hit_term:n {postdoc@enddate} &~\g__hit_info_cenddate_tl \\~
 \end{tabularx}~
 \end{center}~
 }~
 \end{center}~
 \vfill
 {\songti\sihao[2]~
 \begin{center}~
 \__hit_term:n {cschoolname}%
 \bool_if:cTF {l__hit_harbin_bool} {
 \__hit_term:n {harbincampus}
 } {}
 \bool_if:cTF {l__hit_weihai_bool} {
 \__hit_term:n {weihaicampus}
 } {}
 \bool_if:cTF {l__hit_shenzhen_bool} {
 \__hit_term:n {shenzhencampus@postdoc}
 } {}
 \end{center}~
 \begin{center}~
 \g__hit_info_cdate_tl
 \end{center}}}

\cs_new:Npn \__hit_first_titlepage_bachelor: {~
\__hit_text_if_equal:nnTF{\hit@fontset}{siyuan}%
{\xiaosi[1]\vspace*{0.65em}}%
{\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\__hit_term:n {hi}}}}%
 \vspace*{1.2cm}~
 \begin{center}~
 \parbox[t][3.4cm][t]{\textwidth}{~
 \begin{center}\erhao[0]\heiti\g__hit_info_ctitlecover_tl\end{center}~}~
 \parbox[t][9cm][t]{\textwidth}{~
 \begin{center}\xiaoer[0]\songti\textbf{\g__hit_info_cauthor_tl}\end{center}~
 }~
 \begin{center}~
 \dim_set:Nn \l__hit_cover_title_width_dim {4em}~
 \heiti\xiaosi
 \bool_if:cTF {l__hit_shenzhen_bool} {%
 \begin{tabular}{r@{}>{\normalfont\songti\bfseries}lr@{}>{\normalfont\songti\bfseries}l}%
 } {%
 \begin{tabular}{rcrc}%
 }%
 {\__hit_cover_label:n {%
 \bool_if:cTF {l__hit_harbin_bool} {%
 \__hit_term:n {bachelor@caffiltitle}%
 } {%
 \bool_if:cTF {l__hit_shenzhen_bool} {%
 \__hit_term:n {bachelor@caffiltitlesz}%
 % \else%
 %   \ifhit@weihai%
 %     \__hit_term:n {bachelor@caffiltitlewh}%
 %   \fi%
 } {}%
 }%
 }\__hit_term:n {title@csep}}~&~\g__hit_info_caffil_tl &~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@cmajortitle}}\__hit_term:n {title@csep}}~&\g__hit_info_csubject_tl\\[14pt]~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@cstudentidtitle}}\__hit_term:n {title@csep}}~
 &~\g__hit_info_cstudentid_tl
 &~{\__hit_cover_label:n {\__hit_term:n {bachelor@csupervisortitle}}\__hit_term:n {title@csep}}~
 &\g__hit_info_csupervisor_tl
 \end{tabular}~
 \end{center}~
 \vspace{2.6cm}~
 {\xiaosi[0]\songti\textbf{%
 \g__hit_info_firstpagecdate_tl
 }~
 }~
 \end{center}~
}

\dim_new:N \l__hit_cover_title_one_dim %
\dim_new:N \l__hit_cover_title_two_dim %
\cs_new:Npn \__hit_second_titlepage_bachelor: {~
 \vspace*{0.8cm}~
 \bool_if:cTF {l__hit_shenzhen_bool} {%
 % \centering{\includegraphics[width=6.2cm]{hithesis-shenzhenbthesistitle}~~\raisebox{0.2em}{\kaishu\yihao\__hit_term:n {shenzhencampus}}}
 \centering{\includegraphics[width=15cm]{hithesis-shenzhenbthesistitle}}~
 \vspace{-.5cm}~
 } {%
 \centering{\includegraphics[width=6.2cm]{hithesis-logo}}~
 }%
 \vspace{1.3cm}~
 \begin{center}~
 \centering\includegraphics[width=10.5cm]{hithesis-bthesistitle}~
 \vfill
 \parbox[t][14.2cm][b]{\textwidth}~
 {\heiti\xiaosan
 \begin{center}~\cs_set:Npn \arraystretch {2.5}~\heiti
 \dim_set:Nn \l__hit_cover_title_width_dim {5.5em}~
 \begin{tabular}%
 {l@{\ \  }>{\bool_if:cTF {l__hit_shenzhen_bool} { \normalfont\songti } { }}c}~
 \__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{bachelor}}~
 {%
 {\xiaoer \__hit_cover_label:n {\__hit_term:n {bachelor@cthesistitle}}}~
 &~\underline{\makebox[6.1cm][l]{%
 \__hit_measure_width:Nn \l__hit_cover_title_one_dim {\xiaoer \g__hit_info_ctitleone_tl}%
 \dim_compare:nNnTF {\l__hit_cover_title_one_dim} > {6.1cm} {\sanhao} {\xiaoer}\g__hit_info_ctitleone_tl}}\\~
 &~\underline{\makebox[6.1cm][l]{%
 \__hit_measure_width:Nn \l__hit_cover_title_two_dim {\xiaoer \g__hit_info_ctitletwo_tl}%
 \dim_compare:nNnTF {\l__hit_cover_title_two_dim} > {6.1cm} {\sanhao} {\xiaoer}\g__hit_info_ctitletwo_tl}}\\~
 &~\\~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@cstudenttitle}}}~
 &~\underline{\makebox[6.1cm][l]{\g__hit_info_cauthor_tl}}\\~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@cstudentidtitle}}}~
 &~\underline{\makebox[6.1cm][l]{\g__hit_info_cstudentid_tl}}\\~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@caffiltitlesz}}}~
 &~\underline{\makebox[6.1cm][l]{\g__hit_info_caffil_tl}}\\~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@cmajortitle}}}~
 &~\underline{\makebox[6.1cm][l]{\g__hit_info_csubject_tl}}\\~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@csupervisortitle}}}~
 &~\underline{\makebox[6.1cm][l]{\g__hit_info_csupervisor_tl}}\\~
 {\__hit_cover_label:n {\__hit_term:n {cdatetitle}}}~
 &~\underline{\makebox[6.1cm][l]{\g__hit_info_cdate_tl}}~
 }~
 {%
 {\xiaoer \__hit_cover_label:n {\__hit_term:n {bachelor@cthesistitle}}}~
 &~\underline{\makebox[6.1cm]{%
 \__hit_measure_width:Nn \l__hit_cover_title_one_dim {\xiaoer \g__hit_info_ctitleone_tl}%
 \dim_compare:nNnTF {\l__hit_cover_title_one_dim} > {6.1cm} {\sanhao} {\xiaoer}\g__hit_info_ctitleone_tl}}\\~
 &~\underline{\makebox[6.1cm]{%
 \__hit_measure_width:Nn \l__hit_cover_title_two_dim {\xiaoer \g__hit_info_ctitletwo_tl}%
 \dim_compare:nNnTF {\l__hit_cover_title_two_dim} > {6.1cm} {\sanhao} {\xiaoer}\g__hit_info_ctitletwo_tl}}\\~
 &~\\~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@cmajortitle}}}~
 &~\underline{\makebox[6.1cm]{\g__hit_info_csubject_tl}}\\~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@cstudentidtitle}}}~
 &~\underline{\makebox[6.1cm]{\g__hit_info_cstudentid_tl}}\\~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@cstudenttitle}}}~
 &~\underline{\makebox[6.1cm]{\g__hit_info_cauthor_tl}}\\~
 {\__hit_cover_label:n {\__hit_term:n {bachelor@csupervisortitle}}}~
 &~\underline{\makebox[6.1cm]{\g__hit_info_csupervisor_tl}}\\~
 {\__hit_cover_label:n {\__hit_term:n {cdatetitle}}}~
 &~\underline{\makebox[6.1cm]{\g__hit_info_cdate_tl}}~
 }~
 \end{tabular}~\cs_set:Npn \arraystretch {1}~
 \end{center}~
 }~
 \end{center}~
}


\dim_new:N \l__hit_cover_school_date_height_dim
\__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{bachelor}}
{\dim_set:Nn \l__hit_cover_school_date_height_dim {10.8mm}}
{\dim_set:Nn \l__hit_cover_school_date_height_dim {1.4cm}}

\dim_new:N \l__hit_cover_english_title_dim %
\cs_new:Npn \__hit_first_titlepage_other: {~
 % 封面一
\__hit_text_if_equal:nnTF{\hit@fontset}{siyuan}%
{\xiaosi[1]\vspace*{0.65em}}%
{\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\__hit_term:n {hi}}}}%
\__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{bachelor}}~
{\vspace*{8.5mm}}{\vspace*{1.2cm}}~
\begin{center}~
 \begin{center}\xiaoyi[1]\songti\textbf{%
 \__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{bachelor}}~
 {\__hit_term:n {bachelor@cxuewei}\__hit_term:n {bachelor@cthesisname}}~
 {\__hit_term:n {cxuewei}\__hit_term:n {cthesisname}}~
 }\end{center}~
 \begin{center}\xiaoer[1]\songti\bfseries
 \__hit_bool_expr:nTF
 {~!\__hit_bool_p:n{shenzhen}~&&~!\__hit_bool_p:n{master}~&&~\__hit_bool_p:n{fulltime}~}{}~
 {~
 \__hit_term:n {cbraceleft}\g__hit_info_cstudenttype_tl\__hit_term:n {cbraceright}
 }~
 \end{center}~
 \__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{bachelor}}~
 {\vspace{-3.5mm}}{}~
 \parbox[t][7.8cm][t]{\textwidth}{%
 \begin{center}\erhao\heiti\g__hit_info_ctitlecover_tl\end{center}~
\bool_if:cTF {l__hit_subtitle_bool} {\begin{center}\hspace{-4em}\xiaoer\heiti\pozhehao\g__hit_info_csubtitle_tl\end{center}} {}
 \__hit_measure_width:Nn \l__hit_cover_english_title_dim {\erhao\g__hit_info_etitle_tl\bool_if:cTF {l__hit_subtitle_bool} {\__hit_term:n {title@esep}\g__hit_info_esubtitle_tl} {}}%
 \begin{center}%
 \dim_compare:nNnTF {\l__hit_cover_english_title_dim} > {250mm} {\xiaoer} {\erhao}%
 \bool_if:cTF {l__hit_harbin_bool} {\bool_if:cTF {l__hit_bachelor_bool} {
 \vspace{1.27cm}~
 } {}} {}
 \textbf{\MakeUppercase{\g__hit_info_etitle_tl}%
 \bool_if:cTF {l__hit_subtitle_bool} {\__hit_term:n {title@esep}\MakeUppercase{\g__hit_info_esubtitle_tl}} {}}\end{center}}~
\par
 \parbox[t][7.4cm][t]{\textwidth}{~
 \begin{center}\xiaoer\songti\textbf{\g__hit_info_cauthor_tl}\end{center}}\\~
 \bool_if:cTF {l__hit_harbin_bool} {\bool_if:cTF {l__hit_bachelor_bool} {
 \vspace{-12.5mm}~
 } {}} {}
 \parbox[t][\l__hit_cover_school_date_height_dim][t]{\textwidth}{\centering\kaishu\xiaoer\textbf{\__hit_term:n {cschoolname}}}~
 {\songti\xiaoer\textbf{\g__hit_info_firstpagecdate_tl}}~
\end{center}~
}

\cs_new:Npn \__hit_second_titlepage_harbinbachelor: {~
 \begin{center}~
 \vspace*{-3mm}~
 \begin{flushright}~
 \xiaosi
 % SimSun下效果最好
 \raisebox{0em}{% 盒子高度调整，感觉Fandol用-.05em比较好
 \fboxsep=0pt\fbox{\rule{.7em}{0pt}\rule{0pt}{.7em}}%
 \llap{\raisebox{0em}{\checkmark}}%
 }\hspace{.05em}毕业论文%
 \hspace{1em}%
 \raisebox{0em}{% 盒子高度调整，同上
 \fboxsep=0pt\fbox{\rule{.7em}{0pt}\rule{0pt}{.7em}}%
 }\hspace{.05em}毕业设计%
 \hfill%
 \__hit_term:n {secretlevel}：公开%\hspace{14mm}% 右侧不再留空白
 \end{flushright}~
 \vspace{2.1cm}~
 {\songti\bfseries\xiaoer \__hit_term:n {bachelor@cxuewei} \__hit_term:n {bachelor@cthesisname}}\\[0.8cm]~
 \parbox[t][5cm][t]{\textwidth}{%
 \erhao
 \begin{center}~
 \heiti
 \g__hit_info_ctitlecover_tl%
 \end{center}~
 \bool_if:cTF {l__hit_subtitle_bool} {
 \begin{center}\hspace{-4em}\xiaoer\heiti\pozhehao\g__hit_info_csubtitle_tl\end{center}} {}
 }~
 \vspace{16mm}~
 {\sihao
 \dim_set:Nn \l__hit_cover_title_width_dim {6em}~
 \begin{center}~\cs_set:Npn \arraystretch {1.62}~\songti
 \begin{tabular}{l@{\__hit_term:n {title@csep}}l}~
 {\heiti \__hit_cover_label:n {\__hit_term:n {cauthortitle}}}~&~\g__hit_info_cauthor_tl\\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {bachelor@cstudentidtitle}}}~&~\g__hit_info_cstudentid_tl \\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {bachelor@csupervisortitle}}}~&~\g__hit_info_csupervisor_tl\\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {bachelor@cmajortitle}}}~&~\g__hit_info_csubject_tl \\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {bachelor@caffiltitle}}}~&~\g__hit_info_caffil_tl\\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {cdatetitle}}}~&~\g__hit_info_cdate_tl\\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {cschoolnametitle}}}~&~\__hit_term:n {cschoolname}
 \end{tabular}~\cs_set:Npn \arraystretch {1}~
 \end{center}~}~
 \end{center}~
}

\cs_new:Npn \__hit_second_titlepage_other: {~
 \begin{center}~
 {~
 \songti \xiaosi
 \__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{master}}~
 {~
 \begin{tabular}{l}~
 \__hit_term:n {natclassifiedindextitle}：~\g__hit_info_natclassifiedindex_tl\\~
 \__hit_term:n {internatclassifiedindextitle}：~\g__hit_info_intclassifiedindex_tl
 \end{tabular}\hfill
 \begin{tabular}{l}~
 \__hit_term:n {schoolidtitle}：\__hit_term:n {schoolid}\\~
 \__hit_term:n {secretlevel}：\g__hit_info_statesecrets_tl
 \end{tabular}~
 }%
 {~
 \begin{tabular}{@{}r@{：}l@{}}~
 \__hit_term:n {natclassifiedindextitle} &~\g__hit_info_natclassifiedindex_tl\\~
 \__hit_term:n {internatclassifiedindextitle} &~\g__hit_info_intclassifiedindex_tl
 \end{tabular}\hfill
 \begin{tabular}{@{}r@{：}l@{}}~
 \__hit_term:n {schoolidtitle} &~\__hit_term:n {schoolid}\\~
 \__hit_term:n {secretlevel} &~\g__hit_info_statesecrets_tl
 \end{tabular}~
 }%
 }~
 \parbox[t][3.2cm][t]{\textwidth}{\begin{center}~\end{center}~}~
 \parbox[t][2.4cm][t]{\textwidth}{~
 \xiaoer[1]~
 \begin{center}~
 \songti\bfseries
 \__hit_bool_expr:nTF{(\__hit_bool_p:n{harbin}~&&~(\__hit_bool_p:n{master}~||~\__hit_bool_p:n{doctor}))~||~(\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{master})}~
 {\__hit_term:n {cxuewei}}{\__hit_term:n {cdegree}}\__hit_term:n {cthesisname}
 \end{center}}~
 \parbox[t][5cm][t]{\textwidth}{\erhao
 \begin{center}\heiti\g__hit_info_ctitlecover_tl\end{center}~
\bool_if:cTF {l__hit_subtitle_bool} {\begin{center}\hspace{-4em}\xiaoer\heiti\pozhehao\g__hit_info_csubtitle_tl\end{center}} {}}~
 \parbox[t][9.8cm][b]{\textwidth}~
 {\sihao
 \dim_set:Nn \l__hit_cover_title_width_dim {6em}~
 \begin{center}~\cs_set:Npn \arraystretch {1.62}~\songti
 \begin{tabular}{l@{\__hit_term:n {title@csep}}l}~
 {\heiti \__hit_cover_label:n {\__hit_term:n {cauthortitle}}}~&~\g__hit_info_cauthor_tl\\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {csupervisortitle}}}~&~\g__hit_info_csupervisor_tl\\~
 \tl_if_empty:NTF \g__hit_info_cassosupervisor_tl {} {%
 {\heiti \__hit_cover_label:n {\__hit_term:n {cassosupervisortitle}}}&~\g__hit_info_cassosupervisor_tl\\~
 }
 \tl_if_empty:NTF \g__hit_info_ccosupervisor_tl {} {%
 {\heiti \__hit_cover_label:n {\__hit_term:n {ccosupervisortitle}}}~&~\g__hit_info_ccosupervisor_tl\\~
 }
 {\heiti \__hit_cover_label:n {\__hit_term:n {cdegreetitle}}}~&~\__hit_term:n {cdegree}\\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {csubjecttitle}}}~&~\g__hit_info_csubject_tl\\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {caffiltitle}}}~&~\g__hit_info_caffil_tl\\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {cdatetitle}}}~&~\g__hit_info_cdate_tl\\~
 {\heiti \__hit_cover_label:n {\__hit_term:n {cschoolnametitle}}}~&~\__hit_term:n {cschoolname}
 \end{tabular}~\cs_set:Npn \arraystretch {1}~
 \end{center}~}~
 \end{center}~
}


\NewDocumentCommand \emultiline {O{c} m}
  {%
 \cs_set:Npn \arraystretch {1}%
 \begin{tabular}[#1]{@{}l@{}}#2\end{tabular}~\cs_set:Npn \arraystretch {1.3}%
 }
\cs_new:Npn \__hit_engcover: {~
 {%
 \xiaosi[1.667]\noindent Classified~Index:~\g__hit_info_natclassifiedindex_tl \\[8pt]~
 U.D.C:~\g__hit_info_intclassifiedindex_tl %
 }~
 \vspace*{1em}~
 \begin{center}~
 %    \end{macrocode}
 \parbox[t][1.6cm][t]{\textwidth}{\begin{center}~\end{center}~}~
 \parbox[t][3.5cm][t]{\textwidth}{\xiaoer[1]~
 \begin{center}~
 \__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{master}}~
 {%
 Dissertation~for~the~Master~Degree~
 }~
 {%
 \__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~(\__hit_bool_p:n{master}~||~\__hit_bool_p:n{doctor})}~
 {Dissertation~for~the~{\__hit_term:n {exueweier}}~Degree}~
 {Dissertation~for~the~{\__hit_term:n {exueweier}}~Degree~in~\g__hit_info_exueke_tl}~
 }~
 \end{center}~
 \bool_if:cTF {l__hit_fulltime_bool} {\relax%
 } {%
 \begin{center}\__hit_term:n {ebraceleft}\g__hit_info_estudenttype_tl\__hit_term:n {ebraceright}\end{center}%
 }}~%与中文保持一致，删除in {\g__hit_info_exueke_tl}
 \parbox[t][7cm][t]{\textwidth}{%
 \__hit_measure_width:Nn \l__hit_cover_english_title_dim {\erhao\g__hit_info_etitle_tl\bool_if:cTF {l__hit_subtitle_bool} {\__hit_term:n {title@esep}\g__hit_info_esubtitle_tl} {}}%
 \begin{center}%
 \bool_if:cTF {l__hit_etitleauto_bool} {
 \dim_compare:nNnTF {\l__hit_cover_english_title_dim} > {450mm} {\xiaoer} {\erhao}%
 } {
 \erhao%
 }%
 \textbf{\MakeUppercase{\g__hit_info_etitle_tl}%
\bool_if:cTF {l__hit_subtitle_bool} {\__hit_term:n {title@esep}\MakeUppercase{\g__hit_info_esubtitle_tl}} {}}\end{center}}~
 %★★★★若信息内容不太长，不会引起信息内容分行时，使用tabular环境，否则使用下面的tabularx环境。
 {\sihao\cs_set:Npn \arraystretch {1.3}~
 \begin{tabular}{@{}l@{\nobreakspace{}}l@{}}~
 \textbf{\__hit_term:n {eauthortitle}\__hit_term:n {title@esep}}~&~\g__hit_info_eauthor_tl\\~
 \textbf{\__hit_term:n {esupervisortitle}\__hit_term:n {title@esep}}~&~\g__hit_info_esupervisor_tl\\~
 \tl_if_empty:NTF \g__hit_info_eassosupervisor_tl {} {%
 \textbf{\__hit_term:n {eassosupervisortitle}\__hit_term:n {title@esep}}~&~\g__hit_info_eassosupervisor_tl\\~
 }
 \tl_if_empty:NTF \g__hit_info_ecosupervisor_tl {} {%
 \textbf{\__hit_term:n {ecosupervisortitle}\__hit_term:n {title@esep}}~&~\g__hit_info_ecosupervisor_tl\\~
 }
 \textbf{\__hit_term:n {edegreetitle}\__hit_term:n {title@esep}}~&~\__hit_term:n {edegree}\\~
 \textbf{\__hit_term:n {esubjecttitle}\__hit_term:n {title@esep}}~&\g__hit_info_esubject_tl\\~
 \textbf{\__hit_term:n {eaffiltitle}\__hit_term:n {title@esep}}~&\g__hit_info_eaffil_tl\\~
 \textbf{\__hit_term:n {edatetitle}\__hit_term:n {title@esep}}~&~\g__hit_info_edate_tl\\~
 \textbf{\__hit_term:n {eschoolnametitle}\__hit_term:n {title@esep}}~&~\__hit_term:n {eschoolname}
 \end{tabular}\cs_set:Npn \arraystretch {1}}~
 \end{center}~
}


\cs_new_protected:Npn \__hit_clearpage:
  { \bool_if:cTF {l__hit_openright_bool} { \cleardoublepage } { \clearpage } }
\cs_new_protected:Npn \__hit_cover_break:
  { \bool_if:cTF {l__hit_library_bool} { \clearpage } { \cleardoublepage } }
\cs_set_protected:Npn \makecover
  {
    \phantomsection
    \pdfbookmark [0] { \g__hit_info_ctitle_tl } { ctitle }
    \xiaosi [1]
    \begin { titlepage }
      \bool_lazy_and:nnF
        { \bool_if_p:c {l__hit_weihai_bool} }
        { \bool_if_p:c {l__hit_bachelor_bool} }
        { \__hit_first_titlepage: \__hit_cover_break: }
      \__hit_second_titlepage:
      \__hit_cover_break:
      \bool_lazy_or:nnF
        { \bool_if_p:c {l__hit_postdoc_bool} }
        { \bool_if_p:c {l__hit_bachelor_bool} }
        {
          \phantomsection
          \pdfbookmark [0] { \g__hit_info_etitle_tl } { etitle }
          \__hit_engcover:
          \__hit_cover_break:
        }
    \end { titlepage }
    \normalsize
    \__hit_makeabstract:
  }

\box_new:N \l__hit_keywords_label_box
\cs_new_protected:Npn \__hit_keywords_typeset:NNnnn #1#2#3#4#5
  {
    \group_begin:
      #1 #2 {#4}
      \noindent
      \bool_if:nT {#3}
        {
          \dim_set:Nn \tex_hangindent:D {\box_wd:N #2}
          \int_set:Nn \tex_hangafter:D {1}
        }
      \box_use_drop:N #2 #5\par
    \group_end:
  }
\cs_new_protected:Npn \__hit_keywords_typeset:nn #1#2
  {
    \__hit_keywords_typeset:NNnnn
      \hbox_set:Nn \l__hit_keywords_label_box {\c_true_bool} {#1} {#2}
  }

\cs_new:Npn \__hit_makeabstract: {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \bool_if:cTF {l__hit_english_bool} {
 \addtocontents{toc}{\nobreakspace{}\hfill\textbf{Page}\par}~
 \addtocontents{\ext@table}{{\noindent\sihao\textbf{Table}\nobreakspace{}\hfill\textbf{Page}}\par}%
 \addtocontents{\ext@figure}{{\noindent\sihao\textbf{Figure}\nobreakspace{}\hfill\textbf{Page}}\par}%
 } {}
 \__hit_appendix_chapter:w*{\cabstractcname}[\cabstractename]~
 \pagestyle{hit@headings}~
 \pagenumbering{Roman}~
 \hit@cabstract
 \vskip12bp~
 \__hit_keywords_typeset:nn {\bool_if:cTF {l__hit_postdoc_bool} {\bfseries} {}\heiti\__hit_term:n {ckeywords@title}}{\g__hit_info_ckeywords_tl}~
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*{\eabstractcname}[\eabstractename]~
 \hit@eabstract
 \vskip12bp~
 \__hit_keywords_typeset:nn {\textbf{Keywords:\enskip}}{\g__hit_info_ekeywords_tl}}
\NewDocumentEnvironment {denotation} {O{2.5cm}}
  {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*{\__hit_term:n {denotation@ctitle}}[\__hit_term:n {denotation@etitle}]~
\setcounter{table}{0}~
\cs_set:Npn \thetable {\arabic{table}}%使表编号为 1 的格式
 }
  {\cs_set:Npn \thetable {\arabic{chapter}-\arabic{table}}%使表编号为 7-1 的格式
\setcounter{table}{0}}%
\cs_set_nopar:Npn \__hit_starttoc:n #1{% #1: float type, prepend type name in \listof*** entry.
 \cs_set_eq:NN \oldnumberline \numberline
 \cs_set_nopar:Npn \numberline ##1{\oldnumberline{\use:c {#1name}\hskip.4em~##1}}~
 \@starttoc{\use:c {ext@#1}}~
 \cs_set_eq:NN \numberline \oldnumberline }
\cs_set_nopar:Npn \__hit_listof:nn #1#2{% #1: float type
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*[\use:c {list#1name}]{\use:c {list#1name}}[#2]~
 \__hit_starttoc:n{#1}}

\cs_set:Npn \listoffigures {\__hit_listof:nn{figure}{\listfigureename}}
\cs_set_nopar:Npn \l@figure {\addvspace{6bp}\@dottedtocline{1}{0em}{4em}}
\cs_set:Npn \listoftables {\__hit_listof:nn{table}{\listtableename}}
\cs_set_eq:NN \l@table \l@figure
\cs_set_nopar:Npn \ext@equation {loe}

\cs_set_protected:Npn \equcaption #1
  {
    \group_begin:
      % hyperref may include this anchor in the argument of tagform@.
      % It belongs to the displayed equation, not to the protected index write.
      \cs_set_eq:NN \Hy@make@anchor \prg_do_nothing:
      \addcontentsline {\ext@equation} {equation}
        {\protect\numberline {#1}}
    \group_end:
  }

\cs_new:Npn \listofequations {\__hit_listof:nn{equation}{\listequationename}}
\cs_set_eq:NN \l@equation \l@figure
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\bool_if:cTF {l__hit_bachelor_bool} {\bool_if:cTF {l__hit_tocfour_bool} {\setcounter{tocdepth}{3}} {}} {}
\cs_set:Npn \tableofcontents {%
\bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
\par
\bool_if:cTF {l__hit_english_bool} {} {
 \phantomsection
 \markboth{\contentsname}{ccontent}~
 \__hit_latex_chapter:w*{\contentsname}~
 \pdfbookmark[0]{\contentsname}{ccontent}~
 \normalsize\@starttoc{toc}~
}
\bool_if:cTF {l__hit_doctor_bool} {
\tableofengcontents
} {
\bool_if:cTF {l__hit_engtoc_bool} {
\tableofengcontents
} {}
}
\bool_if:cTF {l__hit_english_bool} {
\printnoidxglossary[sort=word,style=engstyle,title={Nomenclature},nopostdot,nonumberlist]~
\listoftables
\listoffigures
} {}
}
\bool_if:cTF {l__hit_arialtoc_bool} {
 \cs_set_nopar:Npn \__hit_toc_font: {\sffamily}~
} {}
\cs_set_nopar:Npn \@pnumwidth {4em}%规定中的提前悬挂
\cs_set_nopar:Npn \@tocrmarg {\@pnumwidth}
\cs_set_nopar:Npn \@dotsep {1}
\skip_set:Nn \@tempdima {4em}%
\hit@legacy@patch@e
\hit@legacy@patch@f
\cs_set_nopar:Npn \l@chapter #1 #2 {%
 \int_compare:nNnTF {\c@tocdepth} > {\m@ne} { \addpenalty{-\@highpenalty}%
 %\vskip 4bp \@plus\p@
 \begingroup
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth
 \leavevmode
 \advance\leftskip\@tempdima
 \hskip -\leftskip
 % numberline is called here, and it uses \@tempdima
 {\bool_if:cTF {l__hit_bachelor_bool} {\rmfamily} {\use:c {hit@toc@font}}\heiti\bool_if:cTF {l__hit_postdoc_bool} {\bfseries} {}\bool_if:cTF {l__hit_chapterbold_bool} {\bool_if:cTF {l__hit_bachelor_bool} {\bfseries} {}} {}\bool_if:cTF {l__hit_english_bool} {\bfseries} {} #1}~
 \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
 \nobreak{\normalfont\normalcolor #2}\par
 \penalty\@highpenalty
 \endgroup
 } {}}
\cs_set_nopar:Npn \l@section {\@dottedtocline{1}{1em}{2em}}
\cs_set_nopar:Npn \l@subsection {\@dottedtocline{2}{2em}{3em}}
\cs_set_nopar:Npn \l@subsubsection {\@dottedtocline{3}{3\ccwd}{3.1em}}
\cs_set_nopar:Npn \@dotsep {0.75}~% 定义英文目录的点间距
\skip_set:Nn \leftmargini {0pt}
\skip_set:Nn \leftmarginii {0pt}
\skip_set:Nn \leftmarginiii {0pt}
\skip_set:Nn \leftmarginiv {0pt}
\skip_set:Nn \leftmarginv {0pt}
\skip_set:Nn \leftmarginvi {0pt}

\cs_set_nopar:Npn \engcontentsname {\bfseries Contents}
\cs_new:Npn \tableofengcontents {~
 \cs_set_nopar:Npn \l@chapter {\@dottedtocline{0}{0em}{5em}}%控制英文目录： 细点\@dottedtocline  粗点\@dottedtoclinebold
 \@restonecolfalse
 \chapter*{\engcontentsname %chapter*上移一行，避免在toc中出现。
 \pdfbookmark[0]{Contents}{econtent}~
 \@mkboth{%
 \engcontentsname}{\engcontentsname}}~
 \@starttoc{toe}%
 \legacy_if:nTF {@restonecol} {\twocolumn} {}}
\cs_set_nopar:Npn \@dotsep {0.75}~% 定义英文目录的点间距
\ctexset{%
 appendix/number=\bool_if:cTF {l__hit_bachelor_bool} {\arabic{chapter}} {\Alph{chapter}},~
}
\cs_set_eq:NN \hit@appendix \appendix
\__hit_bool_declare:n{inappendix}
\cs_set_nopar:Npn \__hit_engtoc_chapapp: {~
 \bool_if:cTF {l__hit_inappendix_bool} { Appendix~} { Chapter~}
}
\cs_set:Npn \appendix
  {%
 \cs_set_eq:NN \title \__hit_appendix_title:n
 \hit@appendix
 \bool_if:cTF {l__hit_bachelor_bool} {\cs_set:Npn \thechapter {\arabic{chapter}}} {}
 \__hit_bool_set_true:n {inappendix}
 }
\cs_set:Npn \endappendix
  {%
 \cs_set_eq:NN \title \@gobble }
\cs_set_eq:NN \title \@gobble
\cs_new:Npn \__hit_appendix_title:n #1 {%
 \begin{center}~
 \bfseries\xiaosi #1~
 \end{center}}
\newlist{translationbib}{enumerate}{1}
\setlist[translationbib]{label=[\arabic*],align=left,nosep,itemsep=6bp,~
 leftmargin=10mm,labelsep=!,before=\vspace{0.5\baselineskip}\wuhao[1.3]}
\cs_new:Npn \conclusions
  {%
\bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
\bool_if:cTF {l__hit_english_bool} {
\__hit_appendix_chapter:w*{\__hit_term:n {conclusion@etitle}}[\__hit_term:n {conclusion@etitle}]~
} {
\__hit_appendix_chapter:w*{\__hit_term:n {conclusion@ctitle}}[\__hit_term:n {conclusion@etitle}]~
}
}
\cs_new:Npn \endconclusions
  {}
\cs_new:Npn \acknowledgements
  {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \bool_if:cTF {l__hit_english_bool} {
 \__hit_appendix_chapter:w*{\__hit_term:n {acknowledgement@etitle}}[\__hit_term:n {acknowledgement@etitle}]~
 } {
 \__hit_appendix_chapter:w*{\__hit_term:n {acknowledgement@ctitle}}[\__hit_term:n {acknowledgement@etitle}]~
 }}
\cs_new:Npn \endacknowledgements
  {}

\cs_new:Npn \correspondingaddr
  {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*{\__hit_term:n {correspondingaddr@ctitle}}}
\cs_new:Npn \endcorrespondingaddr
  {}

\cs_new:Npn \resume
  {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*{\__hit_term:n {resume@ctitle}}[\__hit_term:n {resume@etitle}]}
\cs_new:Npn \endresume
  {}
\cs_new:Npn \publication
  {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*{\__hit_term:n {publication@ctitle}}[\__hit_term:n {publication@etitle}]}
\cs_new:Npn \endpublication
  {}

\cs_new:Npn \doctorpublication
  {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*{\__hit_term:n {doctorpublication@ctitle}}}
\cs_new:Npn \enddoctorpublication
  {}
\cs_new:Npn \ceindex
  {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*{\indexname}[\__hit_term:n {index@etitle}]~
 \skip_set:Nn \columnsep {4em}~
 \begin{adjustwidth}{2em}{2em}~
 \begin{multicols*}{2}}
\cs_new:Npn \endceindex
  {\end{multicols*}~
 \end{adjustwidth}~
 }

\newlist{idxwordlist}{description}{3}
\setlist[idxwordlist,~1]{%
 itemsep=\baselineskip,~
 labelindent=8em,~
 font=\normalsize\bfseries,~
}
\setlist[idxwordlist,~2]{%
 nosep,~
 labelindent=2em,~
 font=\wuhao\rm,~
}
\setlist[idxwordlist,~3]{%
 nosep,~
 labelindent=4em,~
 font=\wuhao\rm,~
}
\cs_set_nopar:Npn \__hit_authorization_other: {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*{\__hit_term:n {authorization@ctitle}}[\__hit_term:n {authorization@etitle}]~
 \xiaosi[1.6]\vspace{\baselineskip}~
\begin{center}\xiaosan\heiti\__hit_term:n {declarename}\end{center}~
\par\__hit_term:n {declaretext}
\vspace{\baselineskip}~
\par\hspace{6em}\__hit_term:n {authorsig}\hfill\__hit_term:n {frontdate}\__hit_term:n {datefill}
\vspace{2\baselineskip}~
\begin{center}\xiaosan\heiti\__hit_term:n {authorizationtitle}\end{center}~
\par\__hit_term:n {authorizationtext}
\vspace{2\baselineskip}~
\par\hspace{6em}\__hit_term:n {authorsig}\hfill\__hit_term:n {frontdate}\__hit_term:n {datefill}
\bool_if:cTF {l__hit_english_bool} {\vspace{\baselineskip}} {\vspace{2\baselineskip}}
\par\hspace{6em}\__hit_term:n {teachersig}\hfill\__hit_term:n {frontdate}\__hit_term:n {datefill}
}
\cs_set_nopar:Npn \__hit_authorization_bachelor: {%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \bool_if:cTF {l__hit_shenzhen_bool} {
 \ctexset{~
 chapter/format~=~{\centering\__hit_title_font:\xsanhao\ziju{0}}~
 }~
 \phantomsection
 \markboth{原创性声明}{原创性声明}~
 \addcontentsline{toc}{chapter}{原创性声明}~
 \__hit_latex_chapter:w*{\__hit_term:n {declarename@bachelor}}~
 } {
 \bool_if:cTF {l__hit_harbin_bool} {
 \ctexset{chapter/beforeskip=4mm}~
 \__hit_latex_chapter:w*{哈尔滨工业大学本科毕业论文（设计）\\~原创性声明和使用权限}~
 \addcontentsline{toc}{chapter}{\texorpdfstring{\bool_if:cTF {l__hit_chapterbold_bool} { \bfseries } {} 哈尔滨工业大学本科毕业论文（设计）原创性声明和使用权限}{哈尔滨工业大学本科毕业论文（设计）原创性声明和使用权限}}~
 } {
 \__hit_appendix_chapter:w*{\__hit_term:n {declarename@bachelor}}~
 }
 }
 \bool_if:cTF {l__hit_harbin_bool} {
 {\centering\xiaosan\heiti 本科毕业论文（设计）原创性声明\par}\vspace{3mm}~
 } {}
 \__hit_term:n {authorizationtext@bachelor}
 \vspace{\bool_if:cTF {l__hit_harbin_bool} { 4mm~} { 2\baselineskip }}~
 \bool_if:cTF {l__hit_weihai_bool} {
 \par\hfill\__hit_term:n {authorsig}\hspace{6em}~
 \vspace{1\baselineskip}~
 \par\hfill\__hit_term:n {teachersig}\hspace{6em}~
 \vspace{2\baselineskip}~
 \par\hfill\__hit_term:n {datefill}
 \songti
 } {
 \par\hspace{6em}~\__hit_term:n {authorsig}\hfill\__hit_term:n {frontdate}\__hit_term:n {datefill}
 }
 \bool_if:cTF {l__hit_harbin_bool} {
 \par\vspace{19mm}{\centering\xiaosan\heiti 本科毕业论文（设计）使用权限\par}\vspace{4mm}~
 \__hit_term:n {second@authorizationtext@bachelor}
 \vspace{1\baselineskip}~
 \par\hspace{6em}\__hit_term:n {authorsig}\hfill\__hit_term:n {frontdate}\__hit_term:n {datefill}
 \vspace{0.7\baselineskip}~
 \par\hspace{6em}\__hit_term:n {teachersig}\hfill\__hit_term:n {frontdate}\__hit_term:n {datefill}
 } {}
}
\NewDocumentCommand{\authorization}{s~o}{%
 \IfNoValueTF{#2}{%
 \bool_if:cTF {l__hit_bachelor_bool} {\__hit_authorization_bachelor:} {\__hit_authorization_other:}
 }{%
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}%
 \phantomsection\addcontentsline{toc}{chapter}{\bool_if:cTF {l__hit_bachelor_bool} {
 \bool_if:cTF {l__hit_shenzhen_bool} { 原创性声明~} {
 \__hit_term:n {declarename@bachelor}}} {\__hit_term:n {authorization@ctitle}}}%
 \bool_if:cTF {l__hit_doctor_bool} {%
 \addcontentsline{toe}{chapter}{\texorpdfstring{\bfseries \__hit_term:n {authorization@etitle}}{\__hit_term:n {authorization@etitle}}}%
 } {}%
 \IfBooleanTF{#1}{%有星号，显示页码
 \includepdf[fitpaper=true,pagecommand={\thispagestyle{hit@scanpage}}]{#2}%
 }{%无星号，不显示页码
 \includepdf[fitpaper=true,pagecommand={\thispagestyle{empty}}]{#2}%
 }%
 }%
 }
\NewDocumentCommand{\resolution}{s~o}{%
\__hit_bool_if:nTF{doctor}~
{~
 \IfNoValueTF{#2}{~
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}
 \__hit_appendix_chapter:w*{\__hit_term:n {resolution@ctitle}}[\__hit_term:n {resolution@etitle}]~
 \begin{center}~
 \includegraphics[width=\textwidth]{figures/empty-resolution.pdf}~
 \end{center}~
 }{%有文件，读入PDF
 \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}%
 \phantomsection\addcontentsline{toc}{chapter}{\__hit_term:n {resolution@ctitle}}%
 \addcontentsline{toe}{chapter}{\texorpdfstring{\bfseries \__hit_term:n {resolution@etitle}}{\__hit_term:n {resolution@etitle}}}%
 \IfBooleanTF{#1}{%有星号，显示页码
 \includepdf[fitpaper=true,pages=-,pagecommand={\thispagestyle{hit@scanpage}}]{#2}%
 }{%无星号，不显示页码
 \includepdf[fitpaper=true,pages=-,pagecommand={\thispagestyle{empty}}]{#2}%
 }%
 }%
}{}~
}
\cs_new:Npn \bibstyle@numerical {\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\citestyle{numerical}
\cs_set_protected:Npn \inlinecite {\@inlinecite}
\cs_set_nopar:Npn \@inlinecite #1{\begingroup\citestyle{inline}\cs_set_eq:NN \@cite \NAT@citenum \citep{#1}\endgroup}
\cs_set_eq:NN \onlinecite \inlinecite
\__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen}~||~(\__hit_bool_p:n{harbin}~&&~(\__hit_bool_p:n{master}~||~\__hit_bool_p:n{doctor}))}
 {\cs_set_nopar:Npn \@biblabel #1{\mbox{［#1］}}}{}

\cs_set:Npn \thebibliography #1
  {%
  % \xeCJKDeclareCharClass{FullRight}{"002E}%
  \bool_if:cTF {l__hit_openright_bool} {\cleardoublepage} {\clearpage}\phantomsection%
  \__hit_appendix_chapter:w*{\bibname}[\__hit_term:n {bibname@etitle}]
  \normalsize
  \list{\@biblabel{\@arabic\c@enumiv}}{%
    \str_if_eq:VnT \g_bib_labelalign_str {left} {
      \RenewDocumentCommand\makelabel{m}{##1\hfill}
    }
    \settowidth{\labelwidth}{\@biblabel{#1}}
    \bool_if:cTF {l__hit_shenzhen_bool} {
      \skip_set:Nn \labelsep {0pt}
    } {
      \skip_set:Nn \labelsep {0.5em}
    }
    \skip_set:Nn \itemindent {0pt}
    \skip_set:Nn \leftmargin {\labelsep+\labelwidth}
    \skip_add:Nn \itemsep {-0.8em}
    \usecounter{enumiv}%
    \cs_set_eq:NN \p@enumiv \@empty
  \cs_set:Npn \theenumiv {\@arabic\c@enumiv}}%
  \sloppy\frenchspacing
  \flushbottom
  \bool_if:cTF {l__hit_splitbibitem_bool} {
  \clubpenalty0
  \@clubpenalty \clubpenalty
  \widowpenalty0%
  \interlinepenalty-50%
  } {
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \interlinepenalty4000%
  }
\sfcode`\.\@m}
\cs_set:Npn \endthebibliography
  {\cs_set_nopar:Npn \@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
\endlist\frenchspacing}
\hit@legacy@patch@g
\cs_set:Npn \NAT@citesuper #1 #2 #3 {\ifNAT@swa
  \if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\hit@legacy@patch@h
\cs_set:Npn \NAT@cite #1 #2 #3 {\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
%% 用以控制参考文献列表中单个作者的格式
\exp_args:NNe \cs_new:Nn \g_bib_author_cs:n {
    \bool_if:NTF \g_bib_authorupper_bool {
        \exp_not:N \text_uppercase:n {#1}
    } {
        {#1}
    }
}
%% 用以输出参考文献列表中的作者
\NewDocumentCommand{\bibauthor}{m}{
  \int_zero:N \l_tmpa_int
  \exp_args:Ne \tl_map_inline:nn {
    \exp_args:Ne \tl_tail:n {#1}
  } {
    \int_compare:nNnT
      \l_tmpa_int = \g_bib_maxauthor_int {
      \prg_break:n {\tl_head:N {#1}}
    }
    \int_incr:N \l_tmpa_int
    \g_bib_author_cs:n {##1}
  }
  \prg_break_point:
}

\AtEndOfClass{\input{hithesisbook.cfg}}
\AtEndOfClass{\sloppy}

\endinput
%%
%% End of file `hithesisbook.cls'.
