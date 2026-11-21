%%
%% This is file `hithesisart.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hithesis.dtx  (with options: `artcls')
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
\ProvidesExplClass{hithesisart}{2026/10/11}{v3.2a}{Harbin Institute of Technology Thesis Template}
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


%% 处理文档类选项
\__hit_bool_declare:n{bachelor}
\__hit_bool_declare:n{master}
\__hit_bool_declare:n{doctor}
\__hit_key_define:nnn{hit}{type}{%
 \__hit_bool_set_false:n {bachelor}
 \__hit_bool_set_false:n {master}
 \__hit_bool_set_false:n {doctor}
 \__hit_bool_select:n {#1}
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

\__hit_bool_declare:n{opening}
\__hit_bool_declare:n{midterm}
\__hit_key_define:nnn{hit}{stage}{%
 \__hit_bool_set_false:n {opening}
 \__hit_bool_set_false:n {midterm}
 \__hit_bool_select:n {#1}
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

\__hit_bool_option:nn{true}{raggedbottom}
\__hit_bool_option:nn{false}{pifootnote}
\__hit_bool_option:nn{false}{debug}
\__hit_bool_option:nn{true}{toc}
\__hit_bool_option:nn{true}{newtxmath}

\__hit_bool_option:nn{false}{print}

\__hit_string_option_declare:n{fontset}
\PassOptionsToPackage{no-math}{fontspec}

\__hit_class_options_process:n{ctexart}

\bool_if:cTF {l__hit_bachelor_bool} {\relax} {
 \bool_if:cTF {l__hit_master_bool} {\relax} {
 \bool_if:cTF {l__hit_doctor_bool} {\relax} {
 \ClassError{hithesisart}{%
 \MessageBreak Please~specify~thesis~type~in~option:~
 \MessageBreak type=[bachelor~|~master~|~doctor]~
 }~
 }
 }
}

\bool_if:cTF {l__hit_opening_bool} {\relax} {
 \bool_if:cTF {l__hit_midterm_bool} {\relax} {
 \ClassError{hithesisart}{%
 \MessageBreak Please~specify~stage~in~option:~
 \MessageBreak stage=<opening|midterm>~
 }~
 }
}

\bool_if:cTF {l__hit_doctor_bool} {
 \bool_if:cTF {l__hit_midterm_bool} {
 \bool_if:cTF {l__hit_shenzhen_bool} {
 \ClassError{hithesisart}{%
 \MessageBreak This~document~class~does~not~support~midterm~report~for~doctor~
 in~shenzhen~campus.~
 \MessageBreak please~use~\string\documentclass{hithesisartplus}~
 }~
 } {}
 } {}
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
 \PassOptionsToClass{fontset=\hit@fontset}{ctexart}~
}%
\LoadClass[a4paper,UTF8,zihao=-4,scheme=plain]{ctexart}

%% 各种宏包
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

\RequirePackage[sort&compress,numbers]{natbib}
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

\bool_if:cTF {l__hit_debug_bool} {
 \RequirePackage[showframe]{geometry}~
} {
 \RequirePackage{geometry}~
}
\geometry{%根据PlutoThesis 原版定义而来
 a4paper,~% 210 * 297mm
 hcentering,~
 ignoreall,~
 nomarginpar,~
 centering,~
 text={150true~mm,236true~mm},~
 left=30true~mm,~
 head=5true~mm,~
 headsep=2true~mm,~
 footskip=0true~mm,~
 foot=5.2true~mm~
}
\__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{master}}%
 {~
 \bool_if:cTF {l__hit_opening_bool} { \geometry{headsep=25pt}~
 } { \geometry{headsep=17pt}~
 }
 }
 {}

\bool_if:cTF {l__hit_debug_bool} {
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
\RequirePackage{subfigure}%支持子图 %centerlast 设置最后一行是否居中
\RequirePackage[subfigure]{ccaption}~%支持双语标题
\__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{master}~&&~\__hit_bool_p:n{midterm}}{%将图注实现为“图 1-1 标题”的格式
 \RequirePackage{caption}~
 \cs_set:Npn \thefigure {\thesection-\arabic{figure}}%修改图标号为x-x格式
 \captionsetup[figure]{labelsep=space}%取消图标号后面的冒号
}{}
\__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{bachelor}~&&~\__hit_bool_p:n{opening}}{~
 \RequirePackage{caption}~
 \cs_set:Npn \thefigure {\thesection-\arabic{figure}}~
 \cs_set:Npn \thetable {\thesection-\arabic{table}}~
 \cs_set:Npn \theequation {\thesection-\arabic{equation}}~
 \captionsetup[figure]{labelsep=space}~
 \captionsetup[table]{labelsep=space}~
 \@addtoreset{figure}{section}~
 \@addtoreset{table}{section}~
 \@addtoreset{equation}{section}~
}{}

%% 添加字号、行距等设置
\cs_set:Npn \normalsize {%
 \@setfontsize\normalsize{12bp}{20.50398bp}%
 \abovedisplayskip=8pt~
 \abovedisplayshortskip=8pt~
 \belowdisplayskip=\abovedisplayskip
 \belowdisplayshortskip=\abovedisplayshortskip
}

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

%% 进行字号、行距等设置
\skip_set:Nn \parindent {2\ccwd}
\ctexset{%
 section={~
 afterindent=true,~
 beforeskip={7.5bp},%上下空0.5行
 afterskip={7.5bp},~
 format={\heiti\xiaosan[1.25]},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 subsection={~
 afterindent=true,~
 beforeskip={7bp},~
 afterskip={7bp},~
 format={\heiti\sihao[1.25]},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 subsubsection={~
 afterindent=true,~
 beforeskip={3bp},~
 afterskip={3bp},~
 format={\heiti\normalsize},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 paragraph/afterindent=true,~
 subparagraph/afterindent=true~
}
\__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{bachelor}~&&~\__hit_bool_p:n{midterm}}
 {~
 \ctexset{~
 section={~
 number~=~\chinese{section},~
 name~=~{,、},~
 aftername={},~
 }~
 }~
 }{}
\__hit_bool_expr:nTF{\__hit_bool_p:n{weihai}~&&~\__hit_bool_p:n{master}~&&~\__hit_bool_p:n{opening}}
 {~
 \fancypagestyle{hit@weihai@headings@main}{%
 \fancyhf{}~
 \fancyfoot[C]{\xiaowu\thepage}~
 \cs_set:Npn \headrule {~
 \vskip 1.190132pt~
 \hrule\@height2.276208pt\@width\headwidth
 \vskip 0.75pt~
 \hrule\@height.75pt\@width\headwidth
 }~
 \fancyhead[C]{\songti\xiaowu[0]哈尔滨工业大学（威海）硕士学位论文开题报告}~
 \fancyfoot[C]{-\ \thepage\ -}~
 }~
 \pagestyle{hit@weihai@headings@main}~
 }{}
\__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{master}}
{~
 \ctexset{~
 section={~
 beforeskip=25bp,~
 afterskip=27pt,~
 format=\bool_if:cTF {l__hit_opening_bool} {\centering\xiaoer} {\xiaosan}\heiti,~
 aftername=\bool_if:cTF {l__hit_opening_bool} { \quad } { \enspace },~
 break=\bool_if:cTF {l__hit_opening_bool} { \clearpage } { {}~}
 },~
 subsection={~
 beforeskip=\bool_if:cTF {l__hit_opening_bool} { 12pt~} { 15pt~},~
 afterskip=\bool_if:cTF {l__hit_opening_bool} { 12pt~} { 15pt~},~
 format=\heiti\bool_if:cTF {l__hit_opening_bool} { \xiaosan } { \sihao },~
 fixskip=true,~
 aftername=\bool_if:cTF {l__hit_opening_bool} { {\ }~} { \enspace }
 },~
 subsubsection={~
 beforeskip=\bool_if:cTF {l__hit_opening_bool} { 12pt~} { 15pt~},~
 afterskip=\bool_if:cTF {l__hit_opening_bool} { 12pt~} { 15pt~},~
 format=\heiti\sihao,~
 fixskip=true,~
 aftername=\bool_if:cTF {l__hit_opening_bool} { {\ }~} { \enspace }
 }~
 }~
 \fancypagestyle{hit@shenzhen@headings@main}{%
 \fancyhf{}~
 \fancyfoot[C]{\xiaowu\thepage}~
 \cs_set:Npn \headrule {~
 \vskip 1.190132pt~
 \hrule\@height2.276208pt\@width\headwidth
 \vskip 0.75pt~
 \hrule\@height.75pt\@width\headwidth
 }~
 \fancyhead[C]{\songti\xiaowu[0]哈尔滨工业大学（深圳）\bool_if:cTF {l__hit_midterm_bool} { 中期~} { 硕士学位论文开题~} 报告}~
 \fancyfoot[C]{-\ \thepage\ -}~
 }~
 \fancypagestyle{hit@shenzhen@headings@front}{%
 \fancyhf{}~
 \cs_set:Npn \headrule {~
 \vskip 1.190132pt~
 \hrule\@height2.276208pt\@width\headwidth
 \vskip 0.75pt~
 \hrule\@height.75pt\@width\headwidth
 }~
 \fancyhead[C]{\songti\xiaowu[0]哈尔滨工业大学（深圳）硕士学位论文开题报告}~
 }~
}{}

%% 中文封面

\__hit_info_declare:n{ctitlecover}
\__hit_info_declare:n{ctype}
\__hit_info_declare:n{csubject}
\__hit_info_declare:n{cauthor}
\__hit_info_declare:n{cstudentid}
\__hit_info_declare:n{cclassid}
\__hit_info_declare:n{caffil}
\__hit_info_declare:n{csupervisor}
\__hit_info_declare:n{cdate}

\NewDocumentCommand\hitsetup{m}{\__hit_setup:nn{hit}{#1}}

\cs_new:Npn \__hit_report_titlepage_graduate: {~
 \__hit_text_if_equal:nnTF{\hit@fontset}{siyuan}%
 {\xiaosi[1]\vspace*{0.65em}}%
 {\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\__hit_term:n {hi}}}}%
 \vspace*{10mm}~
 \begin{center}~
 % \kaishu\xiaoer\textbf{\__hit_term:n {cschoolname}\ifhit@shenzhen\__hit_term:n {shenzhencampus}\fi}
 \__hit_bool_expr:nTF{(\__hit_bool_p:n{weihai}~||~\__hit_bool_p:n{shenzhen})~&&~\__hit_bool_p:n{master}}%
 {\ziju{1/6}}{}\kaishu\xiaoer\textbf{\__hit_term:n {cschoolname}\bool_if:cTF {l__hit_weihai_bool} { （威海）} {}}~
 \end{center}~
 \vspace{5mm}~
 \begin{center}~
 \__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{master}~&&~\__hit_bool_p:n{opening}}%
 {\xiaoyi\ziju{1/8}}{\erhao}~
 \songti\textbf{\__hit_term:n {cxuewei}\__hit_term:n {cthesisname}
 \bool_if:cTF {l__hit_opening_bool} {
 \__hit_term:n {stage@opening}
 } {
 \bool_if:cTF {l__hit_midterm_bool} {
 \__hit_term:n {stage@midterm}
 } {}
 }
 \__hit_term:n {stage@doctype}
 }~
 \end{center}~
 \vspace{10mm}~
 \parbox[t][3cm][t]{\textwidth}{~
 \begin{center}~
 \songti\xiaoer\textbf{\__hit_term:n {cthesistitleprefix}\__hit_term:n {title@csep}\g__hit_info_ctitlecover_tl}~
 \\[12bp]~
 \par
 \__hit_bool_expr:nTF{\__hit_bool_p:n{harbin}~&&~\__hit_bool_p:n{opening}~&&~\__hit_bool_p:n{master}}{~
 \songti\sanhao\textbf{（\g__hit_info_ctype_tl）}~
 }{}~
 \end{center}~
 }~
 \parbox[b][3cm][t]{\textwidth}{~
 \begin{center}\songti\sanhao
 \cs_set:Npn \arraystretch {2.1}~
 \begin{tabular}{l@{\ \ }c}~
 \textbf{\__hit_term:n {graduate@caffiltitle}}~&~\underline{\makebox[6.1cm]{\textbf{\g__hit_info_caffil_tl}}}\\~
 \textbf{\__hit_term:n {graduate@cmajortitle}}~&~\underline{\makebox[6.1cm]{\textbf{\g__hit_info_csubject_tl}}}\\~
 \textbf{\__hit_term:n {graduate@supervisor}}~&~\underline{\makebox[6.1cm]{\textbf{\g__hit_info_csupervisor_tl}}}\\~
 \textbf{\__hit_term:n {graduate@studenttitle}}~&~\underline{\makebox[6.1cm]{\textbf{\g__hit_info_cauthor_tl}}}\\~
 \textbf{\__hit_term:n {graduate@studentid}}~&~\underline{\makebox[6.1cm]{\textbf{\g__hit_info_cstudentid_tl}}}\\~
 \textbf{\__hit_term:n {graduate@datetitle}}~&~\underline{\makebox[6.1cm]{\textbf{\g__hit_info_cdate_tl}}}\\~
 \end{tabular}\cs_set:Npn \arraystretch {1}~
 \end{center}~
 }~
 \vfill
 \bool_if:cTF {l__hit_harbin_bool} {
 \__hit_term:n {harbin@schoolbottommark}
 } {
 \bool_if:cTF {l__hit_shenzhen_bool} {
 \bool_if:cTF {l__hit_opening_bool} {
 \__hit_term:n {shenzhen@master@schoolbottommark}
 } {}
 } {}
 }
}

\cs_new:Npn \__hit_report_titlepage_bachelor: {~
 \__hit_text_if_equal:nnTF{\hit@fontset}{siyuan}%
 {\xiaosi[1]\vspace*{0.65em}}%
 {\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\__hit_term:n {hi}}}}%
 \vspace*{10mm}~
 \begin{center}~
 \includegraphics[width=6.2cm]{hithesis-logo}~
 \end{center}~
 \begin{center}~
 \songti\xiaoyi\textbf{%
 \bool_if:cTF {l__hit_harbin_bool} {%
 \ziju{1/12}~
 本科%
 } {}%
 \__hit_term:n {bachelor@cthesisname}
 \bool_if:cTF {l__hit_opening_bool} {
 \__hit_term:n {stage@opening}
 } {
 \bool_if:cTF {l__hit_midterm_bool} {
 \__hit_term:n {stage@midterm}
 } {}
 }
 \__hit_term:n {stage@doctype}
 }~
 \end{center}~
 \vspace{15mm}~
 \parbox[t][6.5cm][t]{\textwidth}{~
 \begin{center}~
 \songti\xiaoer\textbf{\__hit_term:n {cthesistitleprefix}\__hit_term:n {title@csep}\g__hit_info_ctitlecover_tl}~
 \end{center}~
 }~
 \parbox[b][6cm][t]{\textwidth}{~
 \begin{center}\songti\sanhao
 \cs_set:Npn \arraystretch {2.1}~
 \dim_new:N \l__hit_report_subject_width_dim
 \dim_new:N \l__hit_report_subject_measure_dim
 \__hit_measure_width:Nn \l__hit_report_subject_measure_dim {\g__hit_info_csubject_tl}~
 \dim_set:Nn \l__hit_report_subject_width_dim {\dim_compare:nNnTF {\l__hit_report_subject_measure_dim} > {6.1cm} {\l__hit_report_subject_measure_dim } { 6.1cm~}}~
 \begin{tabular}{l@{\ \ }c}~
 \textbf{\__hit_term:n {bachelor@cmajortitle}}~&~\underline{\makebox[\l__hit_report_subject_width_dim]{\textbf{\g__hit_info_csubject_tl}}}\\~
 \textbf{\__hit_term:n {bachelor@cstudenttitle}}~&~\underline{\makebox[\l__hit_report_subject_width_dim]{\textbf{\g__hit_info_cauthor_tl}}}\\~
 \textbf{\__hit_term:n {bachelor@cstudentidtitle}}~&~\underline{\makebox[\l__hit_report_subject_width_dim]{\textbf{\g__hit_info_cstudentid_tl}}}\\~
 \bool_if:cTF {l__hit_weihai_bool} { % 威海校区特有
 \textbf{\__hit_term:n {bachelor@cclass}}~&~\underline{\makebox[\l__hit_report_subject_width_dim]{\textbf{\g__hit_info_cclassid_tl}}}\\~
 } {}
 \textbf{\__hit_term:n {bachelor@csupervisortitle}}~&~\underline{\makebox[\l__hit_report_subject_width_dim]{\textbf{\g__hit_info_csupervisor_tl}}}\\~
 \textbf{\__hit_term:n {bachelor@cdatetitle}}~&~\underline{\makebox[\l__hit_report_subject_width_dim]{\textbf{\g__hit_info_cdate_tl}}}\\~
 \end{tabular}\cs_set:Npn \arraystretch {1}~
 \end{center}~
 }~
 \vfill
 \bool_if:cTF {l__hit_weihai_bool} {
 \relax
 } {
 \__hit_term:n {harbin@bachelor@schoolbottommark}
 }
}

\cs_new:Npn \__hit_report_backpage_bachelor: {~
 \thispagestyle{empty}~
 \noindent\parbox[t][6.5cm][t]{\textwidth}{\__hit_term:n {bachelor@teachercomment}}~
 \noindent\parbox[b][6cm][t]{\textwidth}{\__hit_term:n {bachelor@teachersign}\underline{\makebox[3cm]{}}\hfill\__hit_term:n {bachelor@checkdate}\underline{\makebox[3cm]{}}}~
}


  % renew \CTEX@toc@width@n,
  % add width of a space to numwidth (stored in \@tempdima)
  \cs_set_protected:Npn \CTEX@toc@width@n #1
  {
    \hbox_set:Nn \l__ctex_tmp_box {#1\,}
    \dim_set:Nn \@tempdima
      {
        \dim_max:nn { \@tempdima }
          { \box_wd:N \l__ctex_tmp_box }
      }
  }

\RequirePackage[subfigure]{tocloft}
\cs_set:Npn \cfttoctitlefont {\hfill\xiaoer\heiti}
\cs_set:Npn \cftaftertoctitle {\hfill\mbox{}}
\cs_set:Npn \cftsecfont {\heiti}
\cs_set:Npn \cftsecpagefont {}
\cs_set:Npn \cftsecdotsep {\cftdotsep}
\cs_set:Npn \cftsecleader {\cftdotfill{\cftsecdotsep}}
\cs_set:Npn \cftdotsep {1}
\skip_set:Nn \cftaftertoctitleskip {40pt}
\skip_set:Nn \cftbeforesecskip {1.2ex}
\skip_set:Nn \cftbeforesubsecskip {1.2ex}
\skip_set:Nn \cftbeforesubsubsecskip {1.2ex}
\skip_set:Nn \cftsubsecindent {1em}% 目录中subsection的缩进
\skip_set:Nn \cftsubsubsecindent {2em}% 目录中subsubsection的缩进
\skip_set:Nn \cftsecnumwidth {1em}% 目录中的section条目序号和标题之间的距离
\skip_set:Nn \cftsubsecnumwidth {1.7em}% 目录中的subsection条目序号和标题之间的距离
\skip_set:Nn \cftsubsubsecnumwidth {2.4em}% 目录中的subsubsection条目序号和标题之间的距离
\__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{master}~&&~\__hit_bool_p:n{opening}}{\tocloftpagestyle{hit@shenzhen@headings@front}}{\tocloftpagestyle{empty}}
 % \renewcommand\tableofcontents{%
 %     \thispagestyle{empty}
 %     \ifboolexpr{ bool {hit@shenzhen} and bool {hit@master} and bool {hit@midterm} }%
 %       {\patchcmd{\l@section}{\bfseries}{\heiti}{}{}}{}
 %     \normalsize\@starttoc{toc}
 %   }
\cs_set_nopar:Npn \makecover {~
 \begin{titlepage}~
 \bool_if:cTF {l__hit_bachelor_bool} {
 \__hit_report_titlepage_bachelor:
 } {
 \__hit_report_titlepage_graduate:
 }
 \clearpage
 \bool_if:cTF {l__hit_print_bool} { \thispagestyle{empty}\mbox{}~\clearpage } {}
 \bool_if:cTF {l__hit_toc_bool} {
 \tableofcontents
 \clearpage
 } {}
 \end{titlepage}~
 \__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen}~&&~\__hit_bool_p:n{master}}{\pagestyle{hit@shenzhen@headings@main}}{}{}~
}
\cs_set_nopar:Npn \makebackcover {~
 \clearpage
 \__hit_report_backpage_bachelor:
}

%% 引用和参考文献格式
\cs_new:Npn \bibstyle@numerical {\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\cs_new:Npn \bibstyle@inline {\bibpunct{[}{]}{,}{n}{,}{\hit@inline@sep}}

\citestyle{numerical}
\cs_set_protected:Npn \inlinecite {\@inlinecite}
\cs_set_nopar:Npn \@inlinecite #1{\begingroup\citestyle{inline}\cs_set_eq:NN \@cite \NAT@citenum \citep{#1}\endgroup}
\cs_set_eq:NN \onlinecite \inlinecite

\cs_set:Npn \thebibliography #1
  {%
  \__hit_bool_expr:nTF{\__hit_bool_p:n{shenzhen} && \__hit_bool_p:n{master} && \__hit_bool_p:n{opening}}%
  {%
    \section*{参考文献}
    \addcontentsline{toc}{section}{参考文献}
  }{}
  \list{\@biblabel{\@arabic\c@enumiv}}{%
    \str_if_eq:VnT \g_bib_labelalign_str {left} {
      \RenewDocumentCommand\makelabel{m}{##1\hfill}
    }
    \settowidth{\labelwidth}{\@biblabel{#1}}
    \skip_set:Nn \labelsep {0.5em}
    \skip_set:Nn \itemindent {0pt}
    \skip_set:Nn \leftmargin {\labelsep+\labelwidth}
    \skip_add:Nn \itemsep {-0.8em}
    \usecounter{enumiv}%
    \cs_set_eq:NN \p@enumiv \@empty
  \cs_set:Npn \theenumiv {\@arabic\c@enumiv}}%
  \sloppy\frenchspacing
  \flushbottom
  \clubpenalty0
  \@clubpenalty \clubpenalty
  \widowpenalty0%
  \interlinepenalty-50%
  \sfcode`\.\@m
}
\cs_set:Npn \endthebibliography
  {\cs_set_nopar:Npn \@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
\endlist\frenchspacing}
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


%% 杂项
\AtEndOfClass{\input{hithesisart.cfg}}
\AtEndOfClass{\sloppy}

\endinput
%%
%% End of file `hithesisart.cls'.
