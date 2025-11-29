%%
%% This is file `sysuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sysuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2024 - 2025 by Renier Tan <irantan@163.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%% 
%% To produce the documentation run the original source files ending with
%% `.dtx' through XeTeX.
%% 
\NeedsTeXFormat{LaTeX2e}
  \GetIdInfo $Id: sysuthesis.dtx 0.7.0 2025-11-26 12:00:00 +0800 Renier Tan <irantan@163.com> $
  {Thesis template for Sun Yat-sen University}
\ProvidesExplClass{sysuthesis}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\msg_new:nnn { sysuthesis } { l3-too-old }
  {
    LaTeX3~ programming~ layer~ is~ too~ old. \\\\
    The~ sysuthesis~ class~ requires~ at~ least~ \\
    a~ version~ of~ L3~ programming~ layer~\\
    after~ #1.
  }
\cs_new_protected:Npn \__sysu_if_expl_as_least:n #1
  {
    \@ifl@t@r \ExplLoaderFileDate { #1 } { }
      { \msg_error:nnn { sysuthesis } { l3-too-old } { #1 } }
  }
\__sysu_if_expl_as_least:n { 2024/06/01 }
\msg_new:nnn { sysuthesis } { unsupported-engine }
  {
    The~ sysuthesis~ class~ requires~ either~ XeTeX~ or~ LuaTeX. \\\\
    "#1"~ is~ not~ supported~ at~ present.~ You~ must~ change \\
    your~ typesetting~ engine~ to~ "xelatex"~ or~ "lualatex".
  }
\bool_if:nF { \sys_if_engine_xetex_p: || \sys_if_engine_luatex_p: }
  { \msg_fatal:nne { sysuthesis } { unsupported-engine } { \c_sys_engine_str } }
\msg_new:nnn { sysuthesis } { unknown-option }
  { Class~ option~ "#1"~ is~ unknown. }
\msg_new:nnn { sysuthesis } { invalid-option }
  {
    The~ option~ "#1"~ is~ not~ valid.\\
    Please~ select~ one~ of~ the~ following~ valid~ options:~ #2.
  }
\msg_new:nnn { sysuthesis } { load-config-file }
  { You~ are~ loading~ config~ file~ "#1". }
\msg_new:nnn { sysuthesis } { package-conflict }
  { The~ "#2"~ package~ is~ incompatible~ with~ "#1". }
\msg_new:nnn { sysuthesis } { too-many-footnotes }
  { Too~many~footnotes.~ Maximum~allowed~is~50. }
\msg_new:nnn { sysuthesis } { image-not-found }
  {
    The~ image~ "#1"~ is~ not~ found. \\
    TikZ~ will~ be~ used~ to~ generate~ the~ figure~ instead, \\
    which~ may~ slow~ down~ the~ compilation~ speed.
  }
\box_new:N \l__sysu_tmpa_box
\seq_new:N \l__sysu_tmpa_seq
\dim_new:N \l__sysu_tmpa_dim
\skip_new:N \l__sysu_tmpa_skip
\int_new:N \l__sysu_tmpa_int
\tl_new:N \l__sysu_tmpa_tl
\int_new:N \g__sysu_info_type_int
\seq_new:N \g__sysu_pass_to_ctexbook_seq
\bool_new:N \g__sysu_opt_twoside_bool
\bool_gset_true:N \g__sysu_opt_twoside_bool
\bool_new:N \g__sysu_opt_draft_bool
\bool_new:N \g__sysu_opt_anon_bool
\tl_new:N \g__sysu_opt_config_tl
\cs_new:Npn \__sysu_quad: { \skip_horizontal:n { 1 em } }
\cs_new:Npn \__sysu_qquad: { \skip_horizontal:n { 2 em } }
\cs_new_protected:Npn \__sysu_vskip:N #1
  {
    \tex_hrule:D \@height \c_zero_dim \scan_stop:
    \tex_penalty:D \@M
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_dim
  }
\cs_new_protected:Npn \__sysu_box_ulined:nn #1#2
  {
    \mode_leave_vertical:
    \rule [ -0.8 ex ] { #1 } { 0.5 pt }
    \skip_horizontal:n { -#1 }
    \hbox_to_wd:nn { #1 } { \tex_hss:D #2 \tex_hss:D }
  }
\cs_new_protected:Npn \__sysu_box_ulined:nN #1#2
  {
    \mode_leave_vertical:
    \rule [ -0.8 ex ] { #1 } { 0.5 pt }
    \skip_horizontal:n { -#1 }
    \hbox_to_wd:nn { #1 } { \tex_hss:D #2 \tex_hss:D }
  }
\cs_generate_variant:Nn \__sysu_box_ulined:nN { nc }
\cs_new_protected:Npn \__sysu_box_spread:nN #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { #1 } { #2 }
  }
\cs_new_protected:Npn \__sysu_box_spread:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { #1 } { #2 }
  }
\cs_generate_variant:Nn \__sysu_box_spread:nN { nc }
\cs_new:Npn \__sysu_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__sysu_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__sysu_tmpa_box }
  }
\cs_new:Npn \__sysu_symbol:n #1 { \tex_char:D #1 \scan_stop: }
\cs_new_protected:Npn \__sysu_define_name:nn #1#2
  { \tl_const:cn { c__sysu_name_ #1 _tl } {#2} }
\cs_new_protected:Npn \__sysu_define_name:nnn #1#2#3
  {
    \tl_const:cn { c__sysu_name_ #1 _tl } {#2}
    \tl_const:cn { c__sysu_name_ #1 _en_tl } {#3}
  }
\cs_new:Npn \__sysu_check_pkg_conflict:nn #1#2
  {
    \hook_gput_code:nnn { package / #1 / after } { . }
      {
        \hook_gput_code:nnn { package / #2 / before } { . }
          { \msg_error:nnnn { sysuthesis } { package-conflict } { #1 } { #2 } }
      }
  }
\cs_new:Npn \__sysu_clearpage:
  {
    \if@openright
      \cleardoublepage
    \else
      \clearpage
    \fi
  }
\cs_new_protected:Npn \__sysu_chapter:Nnn #1#2#3
  {
    \chapter* { #3 #2 }
    \bool_if:NTF #1
      { \addcontentsline { toc } { chapter } { #2 } }
      { \pdfbookmark [ 0 ] { #2 } { \@currentHref } }
    \markboth { #2 } { }
  }
\cs_new_protected:Npn \__sysu_chapter:nn #1#2
  { \__sysu_chapter:Nnn \c_false_bool { #1 } { #2 } }
\cs_new_protected:Npn \__sysu_chapter:n #1
  { \__sysu_chapter:Nnn \c_false_bool { #1 } { } }
\cs_generate_variant:Nn \__sysu_chapter:nn { en }
\cs_new_protected:Npn \__sysu_bookmark:n #1
  {
    \phantomsection
    \pdfbookmark [ 0 ] { #1 } { \@currentHref }
    \markboth { #1 } { }
  }
\cs_new_eq:NN \__sysu_keys_set:nn \keys_set:nn
\clist_map_inline:nn
  {
    { secret_level } { 密级 },
    { thesis_code } { 编号 },
    { student_id } { 学号 },
    { author } { 姓名 },
    { date } { 日期 },
    { toc } { 目录 },
    { loa } { 算法目录 },
    { lof } { 插图目录 },
    { lot } { 表格目录 },
    { integr_decl } { 学术诚信声明 },
    { orig_decl } { 论文原创性声明 },
    { auth_decl } { 学位论文使用授权声明 },
    { author_sign } { 作者签名 },
    { algorithm } { 算法 }
  }
  { \__sysu_define_name:nn #1 }
\clist_map_inline:nn
  {
    { school } { 中山大学 } { Sun Yat-sen University },
    { department } { 院系 } { Department },
    { major } { 专业 } { Major },
    { supervisor } { 指导教师 } { Supervisor },
    { supervisors } { 指导教师 } { Supervisors },
    { abstract } { 摘要 } { Abstract },
    { keywords } { 关键词 } { Keywords },
    { acknowledgements } { 致谢 } { Acknowledgements }
  }
  { \__sysu_define_name:nnn #1 }
\seq_const_from_clist:Nn \c__sysu_name_degree_seq
  { 本科生, 硕士生, 博士生 }
\tl_new:N \g__sysu_name_degree_tl
\tl_gset:Nn \g__sysu_name_degree_tl
  { \seq_item:Nn \c__sysu_name_degree_seq { \g__sysu_info_type_int } }
\seq_const_from_clist:Nn \c__sysu_thesis_type_seq
  { 本科生毕业论文（设计）, 硕士学位论文, 博士学位论文 }
\tl_new:N \g__sysu_name_thesis_tl
\tl_new:N \g__sysu_name_school_thesis_tl
\tl_gset:Nn \g__sysu_name_thesis_tl
  { \seq_item:Nn \c__sysu_thesis_type_seq { \g__sysu_info_type_int } }
\tl_gset:Nn \g__sysu_name_school_thesis_tl
  { \c__sysu_name_school_tl \g__sysu_name_thesis_tl }
\clist_map_inline:nn
  { option, style, info, bib }
  {
    \keys_define:nn { sysu }
      { #1 .meta:nn = { sysu / #1 } { ##1 } }
  }
\keys_define:nn { sysu / option }
  {
    type .choices:nn = { bachelor, master, doctor }
      { \int_gset_eq:NN \g__sysu_info_type_int \l_keys_choice_int },
    type .initial:n  = bachelor,
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n =
      {
        \seq_gpush:Nn \g__sysu_pass_to_ctexbook_seq { oneside }
        \bool_gset_false:N \g__sysu_opt_twoside_bool
      },
    twoside .code:n =
      {
        \seq_gpush:Nn \g__sysu_pass_to_ctexbook_seq { twoside }
        \bool_gset_true:N \g__sysu_opt_twoside_bool
      },
    draft .choices:nn =
      { true , false }
      {
        \int_compare:nNnTF { \l_keys_choice_int } = { 1 }
          {
            \bool_gset_true:N \g__sysu_opt_draft_bool
            \seq_gpush:Nn \g__sysu_pass_to_ctexbook_seq { draft }
          }
          { \bool_gset_false:N \g__sysu_opt_draft_bool }
      },
    draft .default:n = true,
    draft .initial:n = false,
    anonymous .choice:,
    anonymous / true .code:n =
      {
        \bool_gset_true:N \g__sysu_opt_anon_bool
        \cs_set:Npn \__sysu_keys_set:nn ##1##2
          { \keys_set_exclude_groups:nnn { ##1 } { anonymous } { ##2 } }
      },
    anonymous / false .code:n =
        { \bool_gset_false:N \g__sysu_opt_anon_bool },
    anonymous .default:n = true,
    anonymous .initial:n = false,
    config .tl_gset:N = \g__sysu_opt_config_tl,
    unknown .code:n =
      {
        \msg_warning:nne { sysuthesis } { unknown-option }
          { \l_keys_key_str }
      }
  }
\ProcessKeyOptions [ sysu / option ]
\tl_if_empty:NF \g__sysu_opt_config_tl
  {
    \msg_info:nne { sysuthesis } { load-config-file }
      { \g__sysu_opt_config_tl }
    \file_input:V \g__sysu_opt_config_tl
  }
\keys_define:nn { sysu / style }
  {
    cjk-font .tl_gset:N = \g__sysu_style_cjk_font_tl,
    math-font .tl_gset:N = \g__sysu_style_math_font_tl,
    math-font .initial:n = xits,
    color .tl_gset:N = \g__sysu_style_color_tl,
    color .initial:n = sysugreen,
    logo-path .tl_gset:N = \g__sysu_style_logo_path_tl
  }
\exp_args:Ne \PassOptionsToClass
  {
    scheme = chinese,
    fontset = none,
    zihao = -4,
    linespread = 1.5,
    \seq_use:Nn \g__sysu_pass_to_ctexbook_seq { , }
  }
  { ctexbook }
\LoadClass { ctexbook }
\clist_map_inline:nn
  {
    { no-math } { fontspec },
    { perpage } { footmisc }
  }
  { \PassOptionsToPackage #1 }
\RequirePackage
  {
    geometry,
    fancyhdr,
    footmisc,
    unicode-math,
    amsmath,
    amsthm,
    graphicx,
    caption,
    xcolor,
    bookmark
  }
\bool_if:NT \g__sysu_opt_twoside_bool { \RequirePackage { emptypage } }
\clist_map_inline:nn
  {
    amscd, amsfonts, amssymb, bbm, bm, eucal,
    eufrak, mathrsfs, newtxmath, upgreek
  }
  { \__sysu_check_pkg_conflict:nn { unicode-math } { #1 } }
\geometry
  {
    paper = a4paper,
    headheight = 0.75 cm,
    headsep = 0.5 cm,
    footskip = 0.75 cm
  }
\hook_gput_code:nnn { begindocument / before } { . }
  {
    \int_compare:nNnTF { \g__sysu_info_type_int } = { 1 }
      {
        \geometry
          {
            hmargin = 3.0 cm,
            vmargin = { 2.5 cm, 2.0 cm }
          }
      }
      {
        \geometry
          {
            hmargin = 1.25 in,
            vmargin = 1 in
          }
      }
  }
\cs_new_protected:Npn \__sysu_load_cjk_font:
  {
    \keys_set:ne { ctex }
      { fontset = \g__sysu_style_cjk_font_tl }
  }
\sys_if_platform_windows:TF
  { \tl_gset:Nn \g__sysu_style_cjk_font_tl { windows } }
    {
      \ctex_if_platform_macos:TF
        { \tl_gset:Nn \g__sysu_style_cjk_font_tl { mac } }
        { \tl_gset:Nn \g__sysu_style_cjk_font_tl { ubuntu } }
    }
\hook_gput_code:nnn { begindocument / before } { . }
  {
    \bool_lazy_and:nnT
      { \sys_if_engine_xetex_p: }
      { \str_if_eq_p:Vn \g__sysu_style_cjk_font_tl { windows } }
      {
        \keys_set:nn { xeCJK / options }
          { AutoFakeBold = 2.5 }
      }
  }
\tl_const:Nn \c__sysu_name_gyrefeature_tl
  {
    Extension = .otf,
    UprightFont = *-regular,
    BoldFont = *-bold,
    ItalicFont = *-italic,
    BoldItalicFont = *-bolditalic
  }
\cs_new_protected:Npn \__sysu_load_latin_font:
  {
    \bool_lazy_or:nnTF
      { \sys_if_platform_windows_p: }
      { \str_if_eq_p:Vn \g__sysu_style_cjk_font_tl { windows } }
      {
        \setmainfont { Times~ New~ Roman }
        \setsansfont { Arial }
        \setmonofont { Consolas }
      }
      {
        \setmainfont { texgyretermes } [ \c__sysu_name_gyrefeature_tl ]
        \setsansfont { texgyreheros } [ \c__sysu_name_gyrefeature_tl ]
        \setmonofont { inconsolata }
      }
  }
\sys_if_engine_xetex:T
  {
    \xeCJKDeclareCharClass { CJK }
      {
        "24EA, "2460->"2473, "3251->"32BF,
        "24FF, "2776->"277F, "24EB->"24F4
        }
  }
\sys_if_engine_luatex:T
  {
    \ltjdefcharrange { 6 }
      {
        "24EA, "2460-"2473, "3251-"32BF,
        "24FF, "2776-"277F, "24EB-"24F4
      }
  }
\cs_new_protected:Npn \__sysu_load_math_font:
  {
    \str_case:VnF \g__sysu_style_math_font_tl
      {
        { asana } { \setmathfont { Asana-Math.otf } }
        { bonum } { \setmathfont { texgyrebonum-math.otf } }
        { cambria } { \setmathfont { Cambria~Math } }
        { dejavu } { \setmathfont { texgyredejavu-math.otf } }
        { fira } { \setmathfont { FiraMath-Regular.otf } }
        { garamond } { \setmathfont { Garamond-Math.otf } }
        { gfsneohellenic } { \setmathfont { GFSNeohellenicMath.otf } }
        { ibmplex } { \setmathfont { IBMPlexMath-Regular.otf } }
        { lete } { \setmathfont { LeteSansMath.otf } }
        { libertinus } { \setmathfont { LibertinusMath-Regular.otf } }
        { lm } { \setmathfont { latinmodern-math.otf } }
        { luciole } { \setmathfont { Luciole-Math.otf } }
        { pagella } { \setmathfont { texgyrepagella-math.otf } }
        { schola } { \setmathfont { texgyreschola-math.otf } }
        { stix } { \setmathfont { STIXMath-Regular.otf } }
        { stix2 } { \setmathfont { STIXTwoMath-Regular.otf } }
        { termes } { \setmathfont { texgyretermes-math.otf } }
        { kp }
          {
            \setmathfont { KpMath-Regular }
              [
                Extension = .otf,
                BoldFont = KpMath-Bold
              ]
            \setmathfont { KpMath-Regular }
              [
                Extension = .otf,
                range = { cal, bfcal },
                StylisticSet = 1
              ]
          }
        { newcm }
          {
            \setmathfont { NewCMMath-Book }
              [
                Extension = .otf,
                BoldFont = NewCMMath-Bold
              ]
            \setmathfont { NewCMMath-Book }
              [
                Extension = .otf,
                range = { scr, bfscr },
                StylisticSet = 1
              ]
          }
        { xits }
          {
            \setmathfont { XITSMath-Regular }
              [
                Extension = .otf,
                BoldFont = XITSMath-Bold
              ]
            \setmathfont { XITSMath-Regular }
              [
                Extension = .otf,
                range = { cal, bfcal },
                StylisticSet = 1
              ]
          }
        { none } { }
      }
      {
        \msg_error:nnVn { sysuthesis } { invalid-option }
          \g__sysu_style_math_font_tl
          {
            asana,~ bonum,~ cambria,~ dejavu,~ fira,~ garamond,~
            gfsneohellenic,~ ibmplex,~ kp,~ lete,~ libertinus,~ lm,~ luciole,~
            newcm,~ pagella,~ schola,~ stix,~ stix2,~ termes,~ xits~
          }
      }
  }
\keys_define:nn { sysu }
  {
    unicode-math .tl_gset:c = { g__sysu_unicode_math_meta_tl },
    unicode-math .initial:n =
      {
        math-style = ISO,
        bold-style = ISO,
        sans-style = italic
      }
  }
\hook_gput_code:nnn { begindocument / before } { . }
  { \keys_set:nV { unicode-math } \g__sysu_unicode_math_meta_tl }
\hook_gput_code:nnn { begindocument / before } { . }
  { \__sysu_load_cjk_font: \__sysu_load_latin_font: \__sysu_load_math_font: }
\hook_gset_rule:nnnn { begindocument / before } { . } { before } { xeCJK }
\tl_new:N \l__sysu_section_style_i_tl
\tl_new:N \l__sysu_section_style_ii_tl
\tl_new:N \l__sysu_section_style_iii_tl
\tl_set:Nn \l__sysu_section_style_i_tl
  {
    chapter =
      {
        name = \c_empty_tl,
        number = \thechapter,
        format = \centering \heiti \zihao { 3 },
        numberformat = \rmfamily \bfseries,
        aftername = \__sysu_quad:,
        beforeskip = \baselineskip,
        afterskip = \baselineskip,
        fixskip = true
      },
    section =
      {
        number = \thesection,
        format = \raggedright \heiti \zihao { 4 },
        numberformat = \rmfamily \bfseries,
        aftername = \__sysu_quad:,
        beforeskip = \baselineskip,
        afterskip = \baselineskip,
        fixskip = true
      },
    subsection =
      {
        number = \thesubsection,
        format = \raggedright \songti \bfseries \zihao { -4 },
        numberformat = \rmfamily \bfseries,
        aftername = \__sysu_quad:,
        indent = 2 \ccwd,
        beforeskip = \baselineskip,
        afterskip = \baselineskip,
        fixskip = true
      },
    paragraph =
      {
        numbering = false,
        format = \raggedright \songti \bfseries \zihao { -4 },
        indent = 2 \ccwd,
        beforeskip = \baselineskip,
        afterskip = \baselineskip,
        fixskip = true
      }
  }
\tl_set:Nn \l__sysu_section_style_ii_tl
  {
    chapter =
      {
        name = { 第, 章 },
        number = \thechapter,
        format = \centering \heiti \zihao { -2 },
        numberformat = \rmfamily \bfseries,
        aftername = \__sysu_quad:,
        beforeskip = \baselineskip,
        afterskip = \baselineskip,
        fixskip = true
      },
    section =
      {
        number = \thesection,
        format = \raggedright \songti \bfseries \zihao { -3 },
        aftername = \__sysu_quad:,
        indent = 2 \ccwd,
        beforeskip = \baselineskip,
        afterskip = \baselineskip,
        fixskip = true
      },
    subsection =
      {
        number = \thesubsection,
        format = \raggedright \songti \bfseries \zihao { 4 },
        aftername = \__sysu_quad:,
        indent = 2 \ccwd,
        beforeskip = \baselineskip,
        afterskip = \baselineskip,
        fixskip = true
      },
    paragraph =
      {
        numbering = false,
        format = \raggedright \songti \bfseries \zihao { -4 },
        indent = 2 \ccwd,
        beforeskip = \baselineskip,
        afterskip = \baselineskip,
        fixskip = true
      }
  }
\tl_set_eq:NN \l__sysu_section_style_iii_tl
  \l__sysu_section_style_ii_tl
\tl_new:N \l__sysu_appendix_section_style_i_tl
\tl_set:Nn \l__sysu_appendix_section_style_i_tl
  {
    section / name = { 附~ },
    subsection / name = { 附~ },
    subsubsection / name = { 附~ }
  }
\hook_gput_code:nnn { begindocument / before } { . }
  {
    \keys_set:nv { ctex }
      {
        l__sysu_section_style_
        \int_to_roman:n { \g__sysu_info_type_int }
        _tl
      }
  }
\hook_gput_code:nnn { cmd / appendix / before } { . }
  {
    \int_compare:nNnT { \g__sysu_info_type_int } = { 1 }
      { \keys_set:nV { ctex } \l__sysu_appendix_section_style_i_tl }
  }
\clist_map_inline:nn
  { title, author, date, department, major, student_id, supervisors, keywords }
  { \tl_new:c { g__sysu_info_ #1 _tl } }
\clist_new:N \g__sysu_info_supervisors_clist
\clist_new:N \g__sysu_info_keywords_clist
\seq_new:N \g__sysu_info_title_lines_seq
\clist_map_inline:nn
  { title, author, department, major, supervisors, keywords }
  { \tl_new:c { g__sysu_info_ #1 _en_tl } }
\clist_new:N \g__sysu_info_supervisors_en_clist
\clist_new:N \g__sysu_info_keywords_en_clist
\tl_new:N \g__sysu_info_secret_level_tl
\tl_new:N \g__sysu_info_thesis_code_tl
\clist_map_inline:nn
  { author, date, department, major }
  {
    \keys_define:nn { sysu / info }
      { #1 .tl_gset:c = { g__sysu_info_ #1 _tl } }
  }
\keys_define:nn { sysu / info }
  {
    student-id .tl_gset:c = { g__sysu_info_student_id_tl },
    secret-level .tl_gset:c = { g__sysu_info_secret_level_tl },
    thesis-code .tl_gset:c = { g__sysu_info_thesis_code_tl },
    date .initial:n = { \c_sys_year_int / \c_sys_month_int / \c_sys_day_int },
    title .code:n =
      {
        \tl_gset:Nn \g__sysu_info_title_tl { #1 }
        \seq_gset_split:Nnn \g__sysu_info_title_lines_seq { \\ } { #1 }
      }
  }
\clist_map_inline:nn
  { title, author, department, major }
  {
    \keys_define:nn { sysu / info }
      { #1* .tl_gset:c = { g__sysu_info_ #1 _en_tl } }
  }
\cs_new_protected:Npn \__sysu_set_clist_tl:nnn #1#2#3
  {
    \clist_gset:cn { g__sysu_info_ #1 _clist } { #3 }
    \tl_gset:cn { g__sysu_info_ #1 _tl }
      { \clist_use:cn { g__sysu_info_ #1 _clist } { #2 } }
  }
\keys_define:nn { sysu / info }
  {
    supervisors .code:n =
      { \__sysu_set_clist_tl:nnn { supervisors } { ,~ } { #1 } },
    supervisors* .code:n =
      { \__sysu_set_clist_tl:nnn { supervisors_en } { ,~ } { #1 } },
    keywords .code:n =
      { \__sysu_set_clist_tl:nnn { keywords } { ， } { #1 } },
    keywords* .code:n =
      { \__sysu_set_clist_tl:nnn { keywords_en } { ,~ } { #1 } }
  }
\clist_map_inline:nn
  { author, supervisors, student-id }
  { \keys_define:nn { sysu / info } { #1 .groups:n = { anonymous } } }
\clist_map_inline:nn
  { author, supervisors }
  { \keys_define:nn { sysu / info } { #1 * .groups:n = { anonymous } } }
\NewDocumentCommand \sysusetup { o m }
  {
    \tl_if_novalue:nTF { #1 }
      { \__sysu_keys_set:nn { sysu } { #2 } }
      {
        \tl_if_in:nnTF { #1 } { / }
          { \__sysu_keys_set:nn { sysu } { #1 = { #2 } } }
          { \__sysu_keys_set:nn { sysu / #1 } { #2 } }
      }
  }
\NewTemplateType { sysu } { \c_zero_int }
\DeclareTemplateInterface { sysu } { element } { \c_zero_int }
  {
    content : tokenlist = \c_empty_tl,
    format : tokenlist = \c_empty_tl,
    code-before : tokenlist = \c_empty_tl,
    code-after : tokenlist = \c_empty_tl,
    top-skip : skip = \c_zero_skip,
    bottom-skip : skip = \c_zero_skip,
    align : choice { l, r, c, n } = c
  }
\DeclareTemplateCode { sysu } { element } { \c_zero_int }
  {
    content = \l__sysu_elem_content_tl,
    format = \l__sysu_elem_format_tl,
    code-before = \l__sysu_elem_code_before_tl,
    code-after = \l__sysu_elem_code_after_tl,
    top-skip = \l__sysu_elem_top_skip,
    bottom-skip = \l__sysu_elem_bottom_skip,
    align =
      {
        l = { \cs_set_eq:NN \__sysu_elem_align: \raggedright },
        r = { \cs_set_eq:NN \__sysu_elem_align: \raggedleft },
        c = { \cs_set_eq:NN \__sysu_elem_align: \centering },
        n = { \cs_set:Nn \__sysu_elem_align: { } }
      }
  }
  {
    \AssignTemplateKeys
    \__sysu_vskip:N \l__sysu_elem_top_skip
    \group_begin:
      \l__sysu_elem_code_before_tl
      \__sysu_elem_align:
      \l__sysu_elem_format_tl \l__sysu_elem_content_tl
      \l__sysu_elem_code_after_tl \para_end:
    \group_end:
    \__sysu_vskip:N \l__sysu_elem_bottom_skip
  }
\cs_new:Npn \__sysu_define_element:nn #1#2
  { \DeclareInstance { sysu } { #1 } { element } { #2 } }
\cs_new:Npn \__sysu_use_element:nn #1#2
  {
    \clist_map_inline:nn { #2 }
      { \UseInstance { sysu } { #1 / ##1 } }
  }
\clist_map_inline:nn
  { ./figures, ./images, ./logos, ./pictures }
  { \seq_push:Nn \l_file_search_path_seq { #1 } }
\hook_gput_code:nnn { begindocument / before } { . }
  {
    \tl_if_empty:NT \g__sysu_style_logo_path_tl
      {
        \int_compare:nNnTF { \g__sysu_info_type_int } = { 1 }
          { \tl_gset:Nn \g__sysu_style_logo_path_tl { sysu-emblem.pdf } }
          { \tl_gset:Nn \g__sysu_style_logo_path_tl { sysu-name-cn.pdf } }
      }
    \file_if_exist:VF \g__sysu_style_logo_path_tl
      {
        \RequirePackage { sysuvisual }
        \msg_warning:nnV { sysuthesis } { image-not-found }
          \g__sysu_style_logo_path_tl
      }
  }
\cs_new_protected:Npn \__sysu_logo:
  {
    \file_if_exist:VTF \g__sysu_style_logo_path_tl
      {
        \int_compare:nNnTF { \g__sysu_info_type_int } = { 1 }
          { \includegraphics [ width = 3 cm ] { \g__sysu_style_logo_path_tl } }
          { \includegraphics [ width = 9 cm ] { \g__sysu_style_logo_path_tl } }
      }
      {
        \int_compare:nNnTF { \g__sysu_info_type_int } = { 1 }
          {
            \sysudraw { badge } [ landscape ] [ 3 cm ]
              [ \g__sysu_style_color_tl ]
          }
          {
            \sysudraw { name-cn } [ landscape ] [ 2.5 cm ] [ white ]
              [ draw = \g__sysu_style_color_tl, line~width = 1 pt ]
          }
      }
  }
\__sysu_define_element:nn { i / cover / emblem-image }
  {
    content = \__sysu_logo:,
    bottom-skip = 20 pt
  }
\__sysu_define_element:nn { i / cover / thesis-type-name }
  {
    content = \g__sysu_name_thesis_tl,
    format =
      {
        \color { \g__sysu_style_color_tl } \bfseries
        \str_if_eq:VnTF \g__sysu_style_cjk_font_tl { windows }
          { \CJKfontspec { STZHONGS.TTF } } { \songti }
        \fontsize { 36 bp } { 36 bp } \selectfont
      },
    bottom-skip = 20 pt
  }
\__sysu_define_element:nn { i / cover / divide-lines }
  {
    content =
      {
        \rule { \paperwidth } { 3.75 pt } \para_end: \skip_vertical:n { 2.5 pt }
        \rule [ \baselineskip ] { \paperwidth } { 1.25 pt }
      },
    format = \color { \g__sysu_style_color_tl },
    bottom-skip = 0 pt plus 0.5 fil
  }
\__sysu_define_element:nn { i / cover / title }
  {
    code-before =
      {
        \seq_set_map:NNn \l__sysu_tmpa_seq \g__sysu_info_title_lines_seq
          { \__sysu_box_ulined:nn { 16 em } { #1 } }
      },
    content =
      {
        \begin { tabular } { r @ { } p { 18 em } }
          题目： &
            \seq_use:Nn \l__sysu_tmpa_seq { \\ [ 10 pt ] & }
        \end { tabular }
      },
    format = \heiti \LARGE,
    bottom-skip = 0 pt plus 1 fil
  }
\__sysu_define_element:nn { i / cover / info }
  {
    content =
      {
        \begin { tabular } { r p { 16 em } }
          \clist_map_inline:nn
            { author, student_id, department, major, supervisors }
            {
              \__sysu_box_spread:nc { 4 em } { c__sysu_name_ #1 _tl } &
                \__sysu_box_ulined:nc { 14 em } { g__sysu_info_ #1 _tl }
                \\ [ 20 pt ]
            }
        \end { tabular }
      },
    format = \heiti \large,
    bottom-skip = -\baselineskip
  }
\__sysu_define_element:nn { i / cover / date }
  {
    content = \exp_args:Ne \zhdate { \g__sysu_info_date_tl },
    format = \heiti \normalsize,
    bottom-skip = 0 pt plus 0.5 fil
  }
\__sysu_define_element:nn { i / title-page / title }
  {
    content = \g__sysu_info_title_tl,
    format = \heiti \LARGE,
    top-skip = 0 pt plus 1 fil,
    bottom-skip = 0 pt plus 2 fil
  }
\__sysu_define_element:nn { i / title-page / title-en }
  {
    content = \g__sysu_info_title_en_tl,
    format = \heiti \LARGE,
    bottom-skip = 0 pt plus 2 fil
  }
\DeclareInstanceCopy { sysu } { i / title-page / info } { i / cover / info }
\EditInstance { sysu } { i / title-page / info }
  {
    code-before = \c_empty_tl,
    format = \heiti \zihao { 3 }
  }
\__sysu_define_element:nn { i / title-page / date }
  {
    content = \exp_args:Ne \zhdate { \g__sysu_info_date_tl },
    format = \heiti \fontsize { 14 bp } { 21 bp } \selectfont,
    bottom-skip = 0 pt plus 1 fil
  }
\__sysu_define_element:nn { i / declaration / integr-decl }
  {
    content =
      {
        本人郑重声明：所呈交的毕业论文（设计），
        是本人在导师的指导下，
        独立进行研究工作所取得的成果。
        除文中已经注明引用的内容外，
        本论文（设计）不包含
        任何其他个人或集体已经发表或撰写过的作品成果。
        对本论文（设计）的研究做出重要贡献的个人和集体，
        均已在文中以明确方式标明。
        本论文（设计）的知识产权归属于培养单位。
        本人完全意识到本声明的法律结果由本人承担。
      },
    bottom-skip = 2 \baselineskip,
    align = n
  }
\__sysu_define_element:nn { i / declaration / author-sign }
  {
    content =
      {
        \parbox { 16 em }
          {
            \c__sysu_name_author_sign_tl ： \\ [ 15 pt ]
            \__sysu_box_spread:nN { 4 em } \c__sysu_name_date_tl ：
            \skip_horizontal:n { 6 ex } 年
            \skip_horizontal:n { 6 ex } 月
            \skip_horizontal:n { 6 ex } 日
          }
      },
    align = r
  }
\__sysu_define_element:nn { ii / cover / secret-code }
  {
    content =
      {
        \begin { tabular } { l @ { ： } l @ { } }
          密级 & \g__sysu_info_secret_level_tl \\
          编号 & \g__sysu_info_thesis_code_tl
        \end { tabular }
      },
    format = \kaishu \large,
    top-skip = -20 pt,
    bottom-skip = 0 pt plus 1 fil,
    align = r
  }
\__sysu_define_element:nn { ii / cover / school-image }
  {
    content = \__sysu_logo:,
    bottom-skip = 20 pt
  }
\__sysu_define_element:nn { ii / cover / thesis-type-name }
  {
    content = \g__sysu_name_thesis_tl,
    format =
      {
        \color { \g__sysu_style_color_tl } \songti \bfseries
        \fontsize { 42 bp } { 63 bp } \selectfont
      },
    bottom-skip = 0 pt plus 1 fil
  }
\__sysu_define_element:nn { ii / cover / title }
  {
    content =
      {
        \g__sysu_info_title_tl \para_end:
        \rule [ 0.6 \baselineskip ] { 0.6 \paperwidth } { 0.8 pt }
      },
    format = \heiti \Large
  }
\__sysu_define_element:nn { ii / cover / title-en }
  {
    content =
      {
        \g__sysu_info_title_en_tl \para_end:
        \rule [ 0.6 \baselineskip ] { 0.6 \paperwidth } { 0.8 pt }
      },
    format = \Large,
    bottom-skip = 0 pt plus 1 fil
  }
\__sysu_define_element:nn { ii / cover / info }
  {
    content =
      {
        \begin { tabular } { l @ { ： } c }
          \__sysu_box_spread:nn { 7em } { 学位申请人 } &
            \__sysu_box_ulined:nN { 10 em } \g__sysu_info_author_tl \\
          \__sysu_box_spread:nn { 7em } { 导师姓名及职称 } &
            \__sysu_box_ulined:nN { 10 em } \g__sysu_info_supervisors_tl \\
          \__sysu_box_spread:nn { 7em } { 专业名称 } &
            \__sysu_box_ulined:nN { 10 em } \g__sysu_info_major_tl
        \end { tabular }
      },
    format = \kaishu \large,
    bottom-skip = 0 pt plus 1 fil
  }
\__sysu_define_element:nn { ii / cover / date }
  {
    content = \exp_args:Ne \zhdate { \g__sysu_info_date_tl },
    format = \kaishu \large,
    bottom-skip = 0 pt plus -1 fil
  }
\__sysu_define_element:nn { ii / title-page / thesis-type-name }
  {
    content = \g__sysu_name_school_thesis_tl,
    format = \zihao { 4 },
    bottom-skip = 0 pt plus 1 fil
  }
\__sysu_define_element:nn { ii / title-page / title }
  {
    content = \g__sysu_info_title_tl,
    format = \heiti \huge,
    bottom-skip = 2 \baselineskip
  }
\__sysu_define_element:nn { ii / title-page / title-en }
  {
    content = \g__sysu_info_title_en_tl,
    format = \huge,
    bottom-skip = 0 pt plus 1 fil
  }
\__sysu_define_element:nn { ii / title-page / info }
  {
    content =
      {
        \begin { tabular } { l @ { ： } c }
          \__sysu_box_spread:nn { 4 em } { 专业 } &
            \g__sysu_info_major_tl \\
          \__sysu_box_spread:nn { 4 em } { 申请人 } &
            \g__sysu_info_author_tl \\
          \__sysu_box_spread:nn { 4 em } { 指导教师 } &
            \g__sysu_info_supervisors_tl
        \end { tabular }
      },
    format = \zihao { 3 },
    bottom-skip = 2 \baselineskip
  }
\__sysu_define_element:nn { ii / title-page / committee }
  {
    content =
      {
        \begin { tabular } { r @ { } p { 14 em } }
          答辩委员会（签名） & \\
          主席： & \\
          成员： & \\
        \end { tabular }
      },
    format = \zihao { 3 },
    bottom-skip = 0 pt plus 2 fil
  }
\__sysu_define_element:nn { ii / title-page / date }
  {
    content = \exp_args:Ne \zhdate { \g__sysu_info_date_tl },
    bottom-skip = 0 pt plus -1 fil
  }
\__sysu_define_element:nn { ii / declaration / orig-decl }
  {
    content =
      {
        本人郑重声明：所呈交的毕业论文，
        是本人在导师的指导下，
        独立进行研究工作所取得的成果。
        除文中已经注明引用的内容外，
        本论文不包含任何其他
        个人或集体已经发表或撰写过的作品成果。
        对本论文的研究做出重要贡献的个人和集体，
        均已在文中以明确方式标明。
        本人完全意识到本声明的法律结果由本人承担。
      },
    bottom-skip = 2 \baselineskip,
    align = n
  }
\__sysu_define_element:nn { ii / declaration / author-sign }
  {
    content =
      {
        \parbox { 15 em }
          {
            学位论文作者签名： \\ [ 15 pt ]
            日期：
            \skip_horizontal:n { 6 ex } 年
            \skip_horizontal:n { 6 ex } 月
            \skip_horizontal:n { 6 ex } 日
          }
      },
    align = l,
    bottom-skip = 0 pt plus 1 fil
  }
\__sysu_define_element:nn { ii / declaration / auth-title }
  {
    content = \c__sysu_name_auth_decl_tl,
    format = \heiti \zihao { -2 },
    bottom-skip = \baselineskip
  }
\__sysu_define_element:nn { ii / declaration / auth-decl }
  {
    content =
      {
        本人完全了解中山大学有关保留、
        使用学位论文的规定，即：
        学校有权保留学位论文
        并向国家主管部门或其指定机构
        送交论文的电子版和纸质版；
        有权将学位论文用于非赢利目的的少量复制
        并允许论文进入学校图书馆、院系资料室被查阅；
        有权将学位论文的内容编入有关数据库进行检索；
        可以采用复印、缩印或其他方法保存学位论文；
        可以为建立了馆际合作关系的兄弟高校用户
        提供文献传递服务和交换服务。
        \para_end:
        保密论文保密期满后，适用本声明。
      },
    bottom-skip = 2 \baselineskip,
    align = n
  }
\__sysu_define_element:nn { ii / declaration / author-supervisors-sign }
  {
    content =
      {
        \parbox { 15 em }
          {
            学位论文作者签名： \\ [ 15 pt ]
            日期：
            \skip_horizontal:n { 6 ex } 年
            \skip_horizontal:n { 6 ex } 月
            \skip_horizontal:n { 6 ex } 日
          }
        \tex_hfill:D
        \parbox { 15 em }
          {
            导师签名： \\ [ 15 pt ]
            日期：
            \skip_horizontal:n { 6 ex } 年
            \skip_horizontal:n { 6 ex } 月
            \skip_horizontal:n { 6 ex } 日
          }
      },
    align = l,
    bottom-skip = 0 pt plus 0.5 fil
  }
\cs_new_protected:Npn \__sysu_cover_i:
  {
    \__sysu_clearpage:
    \newgeometry { hmargin = 0 pt, vmargin = { 2.5 cm, 2 cm } }
    \__sysu_use_element:nn { i / cover }
      { emblem-image, thesis-type-name, divide-lines, title, info, date }
    \restoregeometry
  }
\cs_new_protected:Npn \__sysu_titlepage_i:
  {
    \__sysu_clearpage:
    \newgeometry { hmargin = 0 pt, vmargin = { 2.5 cm, 2 cm } }
    \__sysu_use_element:nn { i / title-page }
      { title, title-en, info, date }
    \restoregeometry
  }
\cs_new_protected:Npn \__sysu_declaration_i:
  {
    \__sysu_clearpage:
    \__sysu_chapter:n { \c__sysu_name_integr_decl_tl }
    \thispagestyle { empty }
    \__sysu_use_element:nn { i / declaration }
      { integr-decl, author-sign }
  }
\cs_new_protected:Npn \__sysu_cover_ii:
  {
    \__sysu_clearpage:
    \__sysu_use_element:nn { ii / cover }
      {
        secret-code, school-image, thesis-type-name,
        title, title-en, info, date
      }
  }
\cs_new_protected:Npn \__sysu_titlepage_ii:
  {
    \__sysu_clearpage:
    \__sysu_use_element:nn { ii / title-page }
      { thesis-type-name, title, title-en, info, committee, date }
  }
\cs_new_protected:Npn \__sysu_declaration_ii:
  {
    \__sysu_clearpage:
    \__sysu_chapter:n { \c__sysu_name_orig_decl_tl }
    \thispagestyle { empty }
    \__sysu_use_element:nn { ii / declaration }
      {
        orig-decl, author-sign, auth-title,
        auth-decl, author-supervisors-sign
      }
  }
\cs_set_eq:NN \__sysu_cover_iii: \__sysu_cover_ii:
\cs_set_eq:NN \__sysu_titlepage_iii: \__sysu_titlepage_ii:
\cs_set_eq:NN \__sysu_declaration_iii: \__sysu_declaration_ii:
\RenewDocumentCommand \maketitle { o }
  {
    \bool_lazy_or:nnF
      { \g__sysu_opt_draft_bool } { \g__sysu_opt_anon_bool }
      {
        \tl_set:Nn \l__sysu_tmpa_tl
          { \int_to_roman:n { \g__sysu_info_type_int } }
        \seq_set_from_clist:Nn \l__sysu_tmpa_seq
          { cover, titlepage, declaration }
        \begin { titlepage }
          \pagestyle { empty }
          \pagenumbering { Alph }
          \tl_if_novalue:nTF { #1 }
            {
              \seq_map_inline:Nn \l__sysu_tmpa_seq
                { \use:c { __sysu_ ##1 _ \l__sysu_tmpa_tl : } }
            }
            {
              \clist_map_inline:nn { #1 }
                {
                  \seq_if_in:NnTF \l__sysu_tmpa_seq { ##1 }
                    { \use:c { __sysu_ ##1 _ \l__sysu_tmpa_tl : } }
                    {
                      \msg_error:nnne { sysuthesis } { invalid-option }
                        { ##1 } { \seq_use:Nn \l__sysu_tmpa_seq { ,~ } }
                    }
                }
            }
        \end { titlepage }
      }
  }
\cs_new:Npn \__sysu_keywords:nN #1#2
  {
    \para_end: \mode_leave_vertical: \para_end: \noindent
    \__sysu_get_text_width:Nn \l__sysu_tmpa_dim { #1 }
    \group_begin: #1 \group_end:
    \parbox [ t ] { \dim_eval:n { \textwidth - \l__sysu_tmpa_dim } }
      { #2 }
  }
\cs_new:Npn \__sysu_abstract_begin_i:
  { \__sysu_chapter:n { \c__sysu_name_abstract_tl } }
\cs_new:Npn \__sysu_abstract_end_i:
  {
    \__sysu_keywords:nN { \bfseries \c__sysu_name_keywords_tl ： }
      \g__sysu_info_keywords_tl
    \para_end:
  }
\cs_new:Npn \__sysu_abstract_en_begin_i:
  {
    \__sysu_chapter:en
      { \text_uppercase:n { \c__sysu_name_abstract_en_tl } }
      { \bfseries }
  }
\cs_new:Npn \__sysu_abstract_en_end_i:
  {
    \__sysu_keywords:nN { \bfseries \c__sysu_name_keywords_en_tl :~ }
      \g__sysu_info_keywords_en_tl
    \para_end:
  }
\__sysu_define_element:nn { ii / abstract / title }
  {
    code-before = \__sysu_bookmark:n { \c__sysu_name_abstract_tl },
    content = \g__sysu_info_title_tl,
    format = \heiti \zihao { -2 },
    bottom-skip = \baselineskip
  }
\__sysu_define_element:nn { ii / abstract / info }
  {
    content =
      {
        \begin { tabular } { l @ { ： } c }
          \__sysu_box_spread:nN { 4 em } \c__sysu_name_major_tl &
            \g__sysu_info_major_tl \\
          \__sysu_box_spread:nN { 4 em } \g__sysu_name_degree_tl &
            \g__sysu_info_author_tl \\
          \__sysu_box_spread:nN { 4 em } \c__sysu_name_supervisors_tl &
            \g__sysu_info_supervisors_tl
        \end { tabular }
      },
    format = \zihao { 4 },
    bottom-skip = 2 \baselineskip
  }
\__sysu_define_element:nn { ii / abstract / abstract }
  {
    content = \c__sysu_name_abstract_tl,
    format = \bfseries,
    bottom-skip = \baselineskip,
    align = c
  }
\__sysu_define_element:nn { ii / abstract-en / title }
  {
    code-before = \__sysu_bookmark:n { \c__sysu_name_abstract_en_tl },
    content = \g__sysu_info_title_en_tl,
    format = \bfseries \zihao { -2 },
    bottom-skip = \baselineskip
  }
\__sysu_define_element:nn { ii / abstract-en / info }
  {
    code-before =
      {
        \int_compare:nNnTF
          { \clist_count:N \g__sysu_info_supervisors_en_clist } = { 1 }
          { \tl_set_eq:NN \l__sysu_tmpa_tl \c__sysu_name_supervisor_en_tl }
          { \tl_set_eq:NN \l__sysu_tmpa_tl \c__sysu_name_supervisors_en_tl }
      },
    content =
      {
        \begin { tabular } { l l }
          \c__sysu_name_major_en_tl : & \g__sysu_info_major_en_tl \\
          Name : & \g__sysu_info_author_en_tl \\
          \l__sysu_tmpa_tl : & \g__sysu_info_supervisors_en_tl
        \end { tabular }
      },
    format = \zihao { 4 },
    bottom-skip = 2 \baselineskip
  }
\__sysu_define_element:nn { ii / abstract-en / abstract }
  {
    content = \c__sysu_name_abstract_en_tl,
    format = \bfseries,
    bottom-skip = \baselineskip,
    align = c
  }
\cs_new:Npn \__sysu_abstract_begin_ii:
  {
    \__sysu_clearpage:
    \__sysu_use_element:nn { ii / abstract } { title, info, abstract }
  }
\cs_new:Npn \__sysu_abstract_end_ii:
  {
    \__sysu_keywords:nN { \bfseries \c__sysu_name_keywords_tl ： }
      \g__sysu_info_keywords_tl
    \para_end:
  }
\cs_new:Npn \__sysu_abstract_en_begin_ii:
  {
    \__sysu_clearpage:
    \__sysu_use_element:nn { ii / abstract-en } { title, info, abstract }
  }
\cs_new:Npn \__sysu_abstract_en_end_ii:
  {
    \__sysu_keywords:nN { \bfseries \c__sysu_name_keywords_en_tl :~ }
      \g__sysu_info_keywords_en_tl
    \para_end:
  }
\cs_new_eq:NN \__sysu_abstract_begin_iii: \__sysu_abstract_begin_ii:
\cs_new_eq:NN \__sysu_abstract_end_iii: \__sysu_abstract_end_ii:
\cs_new_eq:NN \__sysu_abstract_en_begin_iii: \__sysu_abstract_en_begin_ii:
\cs_new_eq:NN \__sysu_abstract_en_end_iii: \__sysu_abstract_en_end_ii:
\NewDocumentEnvironment { abstract } { }
  {
    \tl_set:Nn \l__sysu_tmpa_tl
      { \int_to_roman:n { \g__sysu_info_type_int } }
    \use:c { __sysu_abstract_begin_ \l__sysu_tmpa_tl : }
  }
  { \use:c { __sysu_abstract_end_ \l__sysu_tmpa_tl : } }
\NewDocumentEnvironment { abstract* } { }
  {
    \tl_set:Nn \l__sysu_tmpa_tl
      { \int_to_roman:n { \g__sysu_info_type_int } }
    \use:c { __sysu_abstract_en_begin_ \l__sysu_tmpa_tl : }
  }
  { \use:c { __sysu_abstract_en_end_ \l__sysu_tmpa_tl : } }
\NewDocumentEnvironment { acknowledgements } { +b }
  {
    \bool_if:NF \g__sysu_opt_anon_bool
      { \__sysu_chapter:n { \c__sysu_name_acknowledgements_tl } #1 }
  } { }
\hook_gput_code:nnn { begindocument / before } { . }
  {
    \keys_set:nn { ctex }
      {
        contentsname = \c__sysu_name_toc_tl,
        listfigurename = \c__sysu_name_lof_tl,
        listtablename  = \c__sysu_name_lot_tl,
        tocdepth =
          { \int_eval:n { 2 - \int_sign:n { \g__sysu_info_type_int - 1 } } }
      }
  }
\RenewDocumentCommand { \tableofcontents } { }
  {
    \__sysu_chapter:n { \contentsname }
    \@starttoc { toc }
  }
\RenewDocumentCommand { \listoffigures } { }
  {
    \__sysu_chapter:n { \listfigurename }
    \@starttoc { lof }
  }
\RenewDocumentCommand { \listoftables } { }
  {
    \__sysu_chapter:n { \listtablename }
    \@starttoc { lot }
  }
\bool_if:NT \g__sysu_opt_draft_bool { \geometry { showframe } }
\hook_gput_code:nnn { begindocument / before } { . }
  {
    \fancypagestyle { plain } [ fancy ]
      {
        \fancyhf { }
        \bool_if:NTF \g__sysu_opt_twoside_bool
          {
            \fancyhead [ CO ] { \small \leftmark }
            \fancyhead [ CE ] { \small \g__sysu_name_school_thesis_tl }
          }
          { \fancyhead [ C ] { \small \leftmark } }
        \fancyfoot [ C ] { \small \thepage }
      }
    \pagestyle { plain }
  }
\RenewDocumentCommand \frontmatter { }
  {
    \__sysu_clearpage:
    \@mainmatterfalse
    \pagenumbering { Roman }
  }
\cs_new:Npn \__sysu_circled_number:n #1
  {
    \int_compare:nNnTF { #1 } < { 21 }
      { \__sysu_symbol:n { \int_eval:n { "2460 + #1 - 1 } } }
      {
        \int_compare:nNnTF { #1 } < { 36 }
          { \__sysu_symbol:n { \int_eval:n { "3251 + #1 - 21 } } }
          {
            \int_compare:nNnTF { #1 } < { 51 }
              { \__sysu_symbol:n { \int_eval:n { "32B1 + #1 - 36 } } }
              { \msg_error:nn { sysuthesis } { too-many-footnotes } }
          }
      }
  }
\cs_gset:Npn \thefootnote { \__sysu_circled_number:n { \c@footnote } }
\cs_gset:Npn \@makefntext #1
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { 1.5 em } { \@thefnmark \tex_hss:D }
    #1
  }
\providecolor { sysugreen } { cmyk } { 1, 0, 1, 0.6 }
\providecolor { sysured } { cmyk } { 0.3, 1, 1, 0.5 }
\__sysu_check_pkg_conflict:nn { amsthm } { ntheorem }
\__sysu_check_pkg_conflict:nn { thmtools } { keytheorems }
\seq_new:N \g__sysu_thms_seq
\seq_gset_from_clist:Nn \g__sysu_thms_seq
  {
    { theorem } { 定理 } { plain } { parent = chapter },
    { definition } { 定义 } { definition } { parent = chapter },
    { example } { 例 } { definition } { parent = chapter },
    { remark } { 注 } { remark } { parent = chapter },
    { lemma } { 引理 } { plain } { sibling = theorem },
    { proposition } { 命题 } { plain } { sibling = theorem },
    { corollary } { 推论 } { plain } { sibling = theorem },
    { assumption } { 假设 } { plain } { sibling = theorem },
  }
\hook_gput_code:nnn { package / thmtools / after } { . }
  {
    \cs_new:Npn \__sysu_thmtools_newthm:nnnn #1#2#3#4
      {
        \declaretheorem
          [
            name = { #2 },
            refname = { #2 },
            style = { #3 },
            #4
           ] { #1 }
      }
    \seq_map_inline:Nn \g__sysu_thms_seq
      { \__sysu_thmtools_newthm:nnnn #1 }
  }
\hook_gput_code:nnn { package / keytheorems / after } { . }
  {
    \cs_new:Npn \__sysu_keythm_newthm:nnnn #1#2#3#4
      {
        \keythms_thm_newkeythm:nn { #1 }
          {
            name = { #2 },
            refname = { #2 },
            style = { #3 },
            #4
          }
      }
    \seq_map_inline:Nn \g__sysu_thms_seq
      { \__sysu_keythm_newthm:nnnn #1 }
  }
\hook_gput_code:nnn { package / algorithm2e / after } { . }
  {
    \SetAlgorithmName { \c__sysu_name_algorithm_tl }
      { \c__sysu_name_algorithm_tl } { \c__sysu_name_loa_tl }
    \RenewDocumentCommand { \listofalgorithms } { }
      {
        \__sysu_chapter:n { \c__sysu_name_loa_tl }
        \@starttoc { loa }
      }
  }
\captionsetup
  {
    font = small,
    labelsep = quad,
    figureposition = bottom,
    tableposition = top
  }
\cs_gset:Npn \topfraction { 0.85 }
\cs_gset:Npn \bottomfraction { 0.7 }
\cs_gset:Npn \textfraction { 0.15 }
\cs_gset:Npn \floatpagefraction { 0.66 }
\cs_gset:Npn \dbltopfraction { 0.66 }
\cs_gset:Npn \dblfloatpagefraction { 0.66 }
\int_gset:Nn \c@topnumber { 9 }
\int_gset:Nn \c@bottomnumber { 9 }
\int_gset:Nn \c@totalnumber { 20 }
\int_gset:Nn \c@dbltopnumber { 9 }
\bool_new:N \g__sysu_bib_backend_bool
\tl_new:N \g__sysu_bbx_style_tl
\clist_new:N \g__sysu_blx_option_clist
\tl_new:N \g__sysu_bib_resource_tl
\keys_define:nn { sysu / bib }
  {
    backend .choice:,
    backend / bibtex .code:n =
      { \bool_gset_true:N \g__sysu_bib_backend_bool },
    backend / biblatex .code:n =
      { \bool_gset_false:N \g__sysu_bib_backend_bool },
    backend .initial:n = bibtex,
    style .code:n =
      {
        \tl_gset:Nn \g__sysu_bbx_style_tl { #1 }
        \clist_gput_right:Nn \g__sysu_blx_option_clist
          { backend = biber, style = #1 }
      },
    style .value_required:n = true,
    option .code:n =
      { \clist_gput_right:NV \g__sysu_blx_option_clist \l_keys_value_tl },
    resource .tl_gset:N = \g__sysu_bib_resource_tl,
    resource .value_required:n = true
  }
\cs_new_protected:Npn \__sysu_load_bibtex:
  {
    \RequirePackage [ sort&compress ] { gbt7714 }
    \exp_args:Ne \bibliographystyle { \g__sysu_bbx_style_tl }
  }
\cs_new_protected:Npn \__sysu_load_biblatex:
  {
    \exp_args:Ne \PassOptionsToPackage
      { \clist_use:N \g__sysu_blx_option_clist } { biblatex }
    \RequirePackage { biblatex }
    \exp_args:Ne \addbibresource { \g__sysu_bib_resource_tl }
  }
\hook_gput_code:nnn { env / document / before } { . }
  {
    \tl_if_empty:NF \g__sysu_bib_resource_tl
      {
        \bool_if:NTF \g__sysu_bib_backend_bool
          { \__sysu_load_bibtex: } { \__sysu_load_biblatex: }
        \tl_gset:Nn \bibfont { \small }
      }
  }
\hook_gput_code:nnn { cmd / appendix / after } { . }
  {
    \tl_if_empty:NF \g__sysu_bib_resource_tl
      {
        \bool_if:NTF \g__sysu_bib_backend_bool
          { \exp_args:Ne \bibliography { \g__sysu_bib_resource_tl } }
          { \printbibliography }
        \addcontentsline { toc } { chapter } { \bibname }
      }
  }
\hook_gput_code:nnn { begindocument / before } { . }
  {
    \RequirePackage { hyperref }
    \pdfstringdefDisableCommands
      {
        \cs_set_eq:NN \\ \prg_do_nothing:
        \cs_set_eq:NN \quad \prg_do_nothing:
        \cs_set_eq:NN \qquad \prg_do_nothing:
        \cs_set_eq:NN \hspace \use_none:n
      }
    \hypersetup
      {
        CJKbookmarks = true,
        linktoc = all,
        pdftitle = \g__sysu_info_title_tl,
        pdfauthor = \g__sysu_info_author_tl,
        pdfkeywords = \g__sysu_info_keywords_tl
      }
    \tl_gset_eq:NN \figureautorefname \figurename
    \tl_gset_eq:NN \tableautorefname \tablename
    \tl_gset_eq:NN \appendixautorefname \appendixname
    \tl_gset:Nn \equationautorefname { 公式 }
    \tl_gset:Nn \footnoteautorefname { 脚注 }
  }
\endinput
%%
%% End of file `sysuthesis.cls'.
