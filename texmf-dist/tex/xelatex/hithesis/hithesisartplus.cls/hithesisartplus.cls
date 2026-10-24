%%
%% This is file `hithesisartplus.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hithesis.dtx  (with options: `artpluscls')
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
\ProvidesExplClass{hithesisartplus}{2026/10/11}{v3.2a}{Harbin Institute of Technology Thesis Template}
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
\csname cs_new_protected:Npn\endcsname \hit@legacy@patch@a{\ExplSyntaxOff
\usetikzlibrary{calc}
\ExplSyntaxOn}
\ExplSyntaxOn

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

\__hit_string_option_declare:n{fontset}
\PassOptionsToPackage{no-math}{fontspec}

\__hit_class_options_process:n{ctexart}

\bool_if:cTF {l__hit_bachelor_bool} {\relax} {
 \bool_if:cTF {l__hit_master_bool} {\relax} {
 \bool_if:cTF {l__hit_doctor_bool} {\relax} {
 \ClassError{hithesisartplus}{%
 \MessageBreak Please~specify~thesis~type~in~option:~
 \MessageBreak type=[bachelor~|~master~|~doctor]~
 }~
 }
 }
}

\bool_if:cTF {l__hit_opening_bool} {\relax} {
 \bool_if:cTF {l__hit_midterm_bool} {\relax} {
 \ClassError{hithesisartplus}{%
 \MessageBreak Please~specify~stage~in~option:~
 \MessageBreak stage=<opening|midterm>~
 }~
 }
}

\bool_if:cTF {l__hit_doctor_bool} {
 \bool_if:cTF {l__hit_midterm_bool} {
 \bool_if:cTF {l__hit_shenzhen_bool} {
 \relax
 } {
 \ClassError{hithesisartplus}{%
 \MessageBreak This~document~class~only~support~midterm~report~for~doctor~
 in~shenzhen~campus~
 }~
 }
 } {
 \ClassError{hithesisartplus}{%
 \MessageBreak This~document~class~only~support~midterm~report~for~doctor~
 in~shenzhen~campus~
 }~
 }
} {
 \ClassError{hithesisartplus}{%
 \MessageBreak This~document~class~only~support~midterm~report~for~doctor~
 in~shenzhen~campus~
 }~
}

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
 \ClassError{hithesis}{Please~use:~\MessageBreak xelatex}~
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

\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{enumitem}~%使用enumitem宏包,改变列表项的格式
\RequirePackage{environ}
\RequirePackage[perpage,hang]{footmisc}
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

\RequirePackage{geometry}
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

\RequirePackage{tikzpagenodes}
\RequirePackage{eso-pic}
\RequirePackage{tikz}
\hit@legacy@patch@a

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

\RequirePackage{lipsum}%random text

%% 添加字号、行距等设置
\cs_set:Npn \normalsize {%
 \@setfontsize\normalsize{12bp}{15bp}%
 \abovedisplayskip=6pt~
 \abovedisplayshortskip=6pt~
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
\ctexset{%
 section={~
 afterindent=true,~
 beforeskip={7.5bp},%上下空0.5行
 afterskip={7.5bp},~
 format={\normalsize},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 subsection={~
 afterindent=true,~
 beforeskip={7bp},~
 afterskip={7bp},~
 format={\normalsize},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 subsubsection={~
 afterindent=true,~
 beforeskip={3bp},~
 afterskip={3bp},~
 format={\normalsize},~
 aftername=\enspace,~
 fixskip=true,~
 break={},~
 },~
 paragraph/afterindent=true,~
 subparagraph/afterindent=true~
}

\cs_set_eq:NN \__hit_latex_section:w \section
\RenewDocumentCommand\section{s~o~m~s}{%
 \IfBooleanF{#4}{\noindent\tikz[overlay]~\draw (-5mm,0mm)~--~(155mm,0mm);}%
 \IfBooleanTF{#1}%
 {% if \section*
 \IfNoValueTF{#2}%
 {\__hit_latex_section:w*{#3}}%
 {\__hit_latex_section:w*[#2]{#3}}%
 }%
 {% if \section
 \IfNoValueTF{#2}%
 {\__hit_latex_section:w{#3}}%
 {\__hit_latex_section:w[#2]{#3}}%
 }~
}

%% 中文封面
\__hit_info_declare:n{ctitleone}
\__hit_info_declare:n{ctitletwo}
\__hit_info_declare:n{csubject}
\__hit_info_declare:n{cauthor}
\__hit_info_declare:n{cstudentid}
\__hit_info_declare:n{cclassid}
\__hit_info_declare:n{caffil}
\__hit_info_declare:n{csupervisor}
\__hit_info_declare:n{cdate}
\__hit_info_declare:n{cenrolldate}

\NewDocumentCommand\hitsetup{m}{\__hit_setup:nn{hit}{#1}}

\cs_new:Npn \__hit_report_titlepage_graduate: {~
 \__hit_text_if_equal:nnTF{\hit@fontset}{siyuan}%
 {\xiaosi[1]\vspace*{0.65em}}%
 {\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\__hit_term:n {hi}}}}%
 \vspace*{10mm}~
 \begin{center}~
 \songti\erhao\textbf{\__hit_term:n {cschoolname}\bool_if:cTF {l__hit_shenzhen_bool} {\__hit_term:n {shenzhencampus}} {}}~
 \end{center}~
 \begin{center}~
 \songti\erhao\textbf{\__hit_term:n {cthesismidtermcheck}}~
 \end{center}~
 \vspace{66bp}~
 \parbox[b][3cm][t]{\textwidth}{~
 \begin{center}\songti\sihao
 \cs_set:Npn \arraystretch {1.67}~
 \begin{tabular}{l@{\ \ }c}~
 \textbf{\__hit_term:n {graduate@studenttitle}}~&~\textbf{\g__hit_info_cauthor_tl}\\~
 \hline
 \textbf{\__hit_term:n {graduate@enrolldate}}~&~\textbf{\g__hit_info_cenrolldate_tl}\\~
 \hline
 \textbf{\__hit_term:n {graduate@thesistitle}}~&~\textbf{\g__hit_info_ctitleone_tl}\\~
 \hline
 &\textbf{\g__hit_info_ctitletwo_tl}\\~
 \hline
 \textbf{\__hit_term:n {graduate@cafflimajor}}~&~\textbf{\g__hit_info_csubject_tl}\\~
 \hline
 \textbf{\__hit_term:n {graduate@datetitle}}~&~\textbf{\g__hit_info_cdate_tl}\\~
 \hline
 \textbf{\__hit_term:n {graduate@supervisor}}~&~\textbf{\g__hit_info_csupervisor_tl}\\~
 \hline
 \end{tabular}\cs_set:Npn \arraystretch {1}~
 \end{center}~
 }~
}

\cs_set_nopar:Npn \makecover {~
 \begin{titlepage}~
 \__hit_report_titlepage_graduate:
 \clearpage
 \__hit_term:n {shenzhen@doctor@midterm@note}
 \end{titlepage}~
 \AddToShipoutPicture{%
 \begin{tikzpicture}[remember~picture,overlay]~
 \draw ($(current~page~text~area.south~west)+(-5mm,0mm)$)~rectangle~($(current~page~text~area.north~east)+(5mm,2mm)$);~
 \end{tikzpicture}~
 }~
 \pagestyle{fancy}~
 \fancyhead{}~
 \cs_set:Npn \headrulewidth {0pt}~
 \cs_set:Npn \footrulewidth {0pt}~
 \fancyfoot[C]{\xiaowu-\nobreakspace{}\thepage\nobreakspace{}-}~
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
  {}
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
%% End of file `hithesisartplus.cls'.
