%%
%% This is file `hustthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hustthesis.dtx  (with options: `class')
%% 
%%     Copyright (C) 2013-2014 by Xu Cheng <xucheng@me.com>
%%                   2014-     by hust-latex <https://github.com/hust-latex>
%%                   2024-     by HUANG Yuxi <hustthesis@hyxi.dev>
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. This version of this license is in
%%        https://www.latex-project.org/lppl/lppl-1-3c.txt
%%     and the latest version of this license is in
%%        https://www.latex-project.org/lppl.txt
%%     and version 1.3c or later is part of all distributions of LaTeX
%%     version 2008 or later.
%% 
%%     This work has the LPPL maintenance status "maintained".
%% 
%%     The Current Maintainer of this work is HUANG Yuxi <hustthesis@hyxi.dev>.
%% 

\NeedsTeXFormat{LaTeX2e}[2024-11-01]
\ProvidesExplClass{hustthesis}
  {2025-02-27}{2.0.0} %
  {Thesis Template for Huazhong University of Science and Technology}

 \RequirePackage { }
\box_new:N \l__hust_tmpa_box
\clist_new:N \l__hust_tmpa_clist
\dim_new:N \l__hust_tmpa_dim
\skip_new:N \l__hust_tmpa_skip
\tl_new:N \l__hust_tmpa_tl
\tl_new:N \l__hust_tmpb_tl
\tl_new:N \g__hust_degree_type_tl
\clist_new:N \g__hust_to_ctex_class_clist
\clist_new:N \g__hust_to_hyperref_clist
\bool_new:N \g__hust_draft_bool
\bool_new:N \g__hust_anonymous_bool
\clist_new:N \g__hust_anonymous_clist
\tl_new:N \g__hust_font_set_tl
\tl_new:N \g__hust_font_latin_tl
\tl_new:N \g__hust_font_cjk_tl
\tl_new:N \g__hust_font_math_tl
\tl_new:N \g__hust_font_dir_tl
\bool_new:N \g__hust_font_dir_bool
\tl_new:N \g__hust_config_tl
\cs_new_protected:Npn \__hust_patch_cmd:Nnn #1#2#3
  {
    \ctex_patch_cmd_once:NnnnTF #1 { } {#2} {#3}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__hust_appto_cmd:Nn #1#2
  {
    \ctex_appto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__hust_define_fn_style:nn #1#2
  { \tl_const:cn { c__hust_fn_style_ #1 _tl } {#2} }
\cs_new_protected:Npn \__hust_define_punct:nn #1#2
  { \tl_const:cn { c__hust_ #1 _tl } {#2} }
\cs_new_protected:Npn \__hust_define_name:nn #1#2
  { \tl_const:cn { c__hust_name_ #1 _tl } {#2} }
\cs_new_protected:Npn \__hust_define_name:nnn #1#2#3
  {
    \tl_const:cn { c__hust_name_ #1 _en_tl } {#2}
    \tl_const:cn { c__hust_name_ #1 _zh_tl } {#3}
  }
\cs_new:Npn \__hust_msg_new:nn { \msg_new:nnn { hustthesis } }
\cs_new:Npn \__hust_error:n { \msg_error:nn { hustthesis } }
\cs_new:Npn \__hust_error:nn { \msg_error:nnn { hustthesis } }
\cs_new:Npn \__hust_error:nx { \msg_error:nnx { hustthesis } }
\cs_new:Npn \__hust_error:nnn { \msg_error:nnnn { hustthesis } }
\cs_new:Npn \__hust_error:nnnn { \msg_error:nnnnn { hustthesis } }
\cs_new:Npn \__hust_warning:n { \msg_warning:nn { hustthesis } }
\cs_new:Npn \__hust_warning:nn { \msg_warning:nnn { hustthesis } }
\cs_new:Npn \__hust_warning:nxx { \msg_warning:nnxx { hustthesis } }
\cs_new:Npn \__hust_info:nx { \msg_info:nnx { hustthesis } }
\cs_new_protected:Npn \__hust_vspace:N #1
  {
    \dim_set_eq:NN \l__hust_tmpa_dim \tex_prevdepth:D
    \tex_hrule:D height \c_zero_dim
    \nobreak
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_skip
    \dim_set_eq:NN \tex_prevdepth:D \l__hust_tmpa_dim
  }
\cs_new_protected:Npn \__hust_vspace:n #1
  {
    \skip_set:Nn \l__hust_tmpa_skip {#1}
    \__hust_vspace:N \l__hust_tmpa_skip
  }
\cs_generate_variant:Nn \__hust_vspace:N { c }
\cs_new_protected:Npn \__hust_hrule:nn #1#2
  {
    \rule [ -0.5 ex ] { #2 } { #1 }
    \skip_horizontal:n { -#2 }
  }
  % \begin{arguments}
  %    \item 下划线粗细
  %    \item 下划线长度
  %    \item 内容
  % \end{arguments}
\dim_new:N \l__hust_ul_dim
\cs_new_protected:Npn \__hust_ul_to_wd:nnn #1#2#3
  {
    \hbox_overlap_right:n { \rule [ - 0.5 ex ] { #2 } { #1 } }
    \hbox_to_wd:nn { #2 } { \tex_hfil:D #3 \tex_hfil:D }
  }
\cs_new:Npn \__hust_line_spread:N #1
  {
    \tl_set:Nn \baselinestretch { \fp_use:N #1 }
    \selectfont
  }
\cs_new:Npn \__hust_line_spread:n #1
  {
    \tl_set:Nn \baselinestretch { #1 }
    \selectfont
  }
\cs_new:Npn \__hust_arabic:n #1
  { \int_to_arabic:v { c@ #1 } }
\keys_define:nn { hust / option }
  {
    type .choices:nn =
      { master, doctor }
      { \tl_gset_eq:NN \g__hust_degree_type_tl \l_keys_choice_tl },
    type .value_required:n = true,
    type .initial:n = { doctor },
    draft .choice:,
    draft / true .code:n =
      {
        \bool_gset_true:N \g__hust_draft_bool
        \clist_gput_right:Nn \g__hust_to_ctex_class_clist { draft }
      },
    draft / false .code:n =
      {
        \bool_gset_false:N \g__hust_draft_bool
      },
    draft .default:n = { true },
    draft .initial:n = { false },
    anonymous .choice:,
    anonymous / true .code:n =
      {
        \bool_gset_true:N \g__hust_anonymous_bool
      },
    anonymous / false .code:n =
      {
        \bool_gset_false:N \g__hust_anonymous_bool
      },
    anonymous .default:n = { true },
    anonymous .initial:n = { false },
    anonymous-list .clist_gset:N = \g__hust_anonymous_clist,
    latin-font .choices:nn =
      { fandol, gyre, mac, macoffice, win, none, }
      { \tl_gset:Nn \g__hust_font_latin_tl {#1} },
    cjk-font .choices:nn =
      { fandol, founder, mac, macoffice, noto, source, win, none, }
      { \tl_gset:Nn \g__hust_font_cjk_tl {#1} },
    fontset .choices:nn =
      { fandol, mac, macoffice, win, none, }
      { \keys_set:nn { hust / option } { latin-font = #1, cjk-font = #1 } },
    math-font .choices:nn =
      {
        asana, cambria, fira, garamond, lm, libertinus, newcm,
        stix, bonum, dejavu, pagella, schola, termes, xits, none,
      }
      { \tl_gset_eq:NN \g__hust_font_math_tl \l_keys_choice_tl },
    math-font .initial:n = xits,
    font-dir .code:n =
      {
        \bool_gset_true:N \g__hust_font_dir_bool
        \tl_gset_eq:NN \g__hust_font_dir_tl \l_keys_value_tl
      },
    config .tl_gset:N = \g__hust_config_tl,
    unknown .code:n =
      { \clist_gput_right:No \g__hust_to_ctex_class_clist { \CurrentOption } }
  }
\ProcessKeyOptions [ hust / option ]
\tl_if_empty:NTF \g__hust_config_tl
  {
    \tl_if_eq:NnT \g__hust_degree_type_tl { master }
      { \file_input:n { hustthesis-m.def } }
    \tl_if_eq:NnT \g__hust_degree_type_tl { doctor }
      { \file_input:n { hustthesis-d.def } }
  }
  {
    \__hust_msg_new:nn { load-config-file }
      { You~ are~ loading~ config~ file~ "#1". }
    \__hust_info:n { load-config-file }
    \file_input:V { \g__hust_config_tl }
  }
\PassOptionsToClass
  {
    a4paper,
    UTF8,
    scheme = chinese,
    fontset = none,
    oneside,
    heading = true,
    zihao = -4,
    linespread = \c__hust_line_spread_fp,
    \g__hust_to_ctex_class_clist,
  }
  { ctexbook }
\LoadClass { ctexbook }
\RequirePackage
  {
    amsmath,
    geometry,
    fancyhdr,
    titletoc,
    graphicx,
    multirow,
    longtable,
    caption,
    utfsym,
  }
\RequirePackage[style=hustthesis]{biblatex}
\clist_map_inline:Nn \g__hust_anonymous_clist
  {
    \tl_gset_eq:cN { g__hust_name_ #1 _tl } \c_empty_tl
  }
\geometry
  {
    top = 4.5 cm,
    bottom = 2.8 cm,
    left = 2.8 cm,
    right = 2.8 cm,
    headheight = 30 pt,
  }
\tl_const:Nn \c__hust_path_macoffice_tl
  { /Applications/Microsoft~ Word.app/Contents/Resources/DFonts/ }
\sys_if_platform_windows:TF
  { \tl_gset:Nn \g__hust_font_set_tl { win } }
  {
    \ctex_if_platform_macos:TF
      {
        \file_if_exist:nTF { \c__hust_path_macoffice_tl times.ttf }
          { \tl_gset:Nn \g__hust_font_set_tl { macoffice } }
          { \tl_gset:Nn \g__hust_font_set_tl { mac } }
      }
      { \tl_gset:Nn \g__hust_font_set_tl { fandol } }
  }
\tl_if_empty:NT \g__hust_font_latin_tl
  { \tl_gset_eq:NN \g__hust_font_latin_tl \g__hust_font_set_tl }
\tl_if_empty:NT \g__hust_font_cjk_tl
  { \tl_gset_eq:NN \g__hust_font_cjk_tl \g__hust_font_set_tl }
\cs_new:Npn \__hust_loadfont_latin:n #1
  {
    \__fontspec_main_setmainfont:nn { } { Times~New~Roman }
    \__fontspec_main_setsansfont:nn { } { Arial }
    \__fontspec_main_setmonofont:nn { Scale = MatchLowercase } {#1}
  }
\cs_new_protected:Npn \__hust_loadfont_latin_win:
  { \__hust_loadfont_latin:n { Courier~New } }
\cs_new_protected:Npn \__hust_loadfont_latin_mac:
  {
    \__hust_loadfont_latin:n { Menlo }
    \fontspec_if_small_caps:F
      {
        \__hust_warning:n { no-small-caps }
        \__fontspec_main_setmainfont:nn
          { \c__hust_name_gyrefeature_clist } { texgyretermes }
      }
  }
\__hust_msg_new:nn { no-small-caps }
  {
    I~ am~ using~ TeX~ Gyre~ Termes~ as~ default~ Roman~ font.\\
    This~ is~ because~ the~ "Times~ New~ Roman"~ font~ in~ your~
    system~ does~ not~ embed~ glyphs~ for~ small~ capitals.~
    You~ can~ ignore~ this~ warning~ if~ you~ do~ not~ need~
    \string\textsc.~ For~ more~ information,~
    please~ refer~ to~ section~ 3.2.6~ of~ the~ documentation.
  }
\cs_new_protected:Npn \__hust_loadfont_latin_macoffice:
  {
    \__fontspec_main_setmainfont:nn
      { \c__hust_name_macofficefeature_clist } { times }
    \__fontspec_main_setsansfont:nn
      { \c__hust_name_macofficefeature_clist } { arial }
    \__fontspec_main_setmonofont:nn
      { Scale = MatchLowercase } { Menlo }
  }
\clist_const:Nn \c__hust_name_macofficefeature_clist
  {
    Path = \c__hust_path_macoffice_tl,
    Extension = .ttf,
    UprightFont = *,
    BoldFont = *bd,
    ItalicFont = *i,
    BoldItalicFont = *bi,
  }
\cs_new_protected:Npn \__hust_loadfont_latin_gyre:
  {
    \__fontspec_main_setmainfont:nn
      { \c__hust_name_gyrefeature_clist } { texgyretermes }
    \__fontspec_main_setsansfont:nn
      { \c__hust_name_gyrefeature_clist } { texgyreheros }
    \__fontspec_main_setmonofont:nn
      {
        \c__hust_name_gyrefeature_clist,
        Scale = MatchLowercase,
        Ligatures = CommonOff,
      }
      { texgyrecursor }
  }
\cs_new_eq:NN \__hust_loadfont_latin_fandol: \__hust_loadfont_latin_gyre:
\clist_const:Nn \c__hust_name_gyrefeature_clist
  {
    Extension = .otf,
    UprightFont = *-regular,
    BoldFont = *-bold,
    ItalicFont = *-italic,
    BoldItalicFont = *-bolditalic,
  }
\cs_new:Npn \__hust_hide_no_script_msg:
  { \msg_redirect_name:nnn { fontspec } { no-script } { info } }
\cs_new:Npn \__hust_loadfont_cjk_win:N #1
  {
    \setCJKmainfont { SimSun } [ #1, ItalicFont = KaiTi ]
    \setCJKsansfont { SimHei } [#1]
    \setCJKmonofont { FangSong } [#1]
    \setCJKfamilyfont { zhsong } { SimSun } [#1]
    \setCJKfamilyfont { zhhei } { SimHei } [#1]
    \setCJKfamilyfont { zhfs } { FangSong } [#1]
    \setCJKfamilyfont { zhkai } { KaiTi } [#1]
    \__hust_define_stzhongs:nn { STZhongsong } {#1}
  }
\cs_new:Npn \__hust_loadfont_cjk_win:
  { \__hust_loadfont_cjk_win:N \c__hust_name_fakebold_tl }
\cs_new_protected:Npn \__hust_loadfont_cjk_mac:
  {
    \__hust_hide_no_script_msg:
    \setCJKmainfont { Songti~SC~Light }
      [
        BoldFont = Songti~SC~Bold,
        ItalicFont = Kaiti~SC,
        BoldItalicFont = Kaiti~SC~Bold,
      ]
    \setCJKsansfont { Heiti~SC~Light } [ BoldFont = Heiti~SC~Medium ]
    \setCJKmonofont { STFangsong }
    \setCJKfamilyfont { zhsong } { Songti~SC~Light } [ BoldFont = Songti~SC~Bold ]
    \setCJKfamilyfont { zhhei } { Heiti~SC~Light } [ BoldFont = Heiti~SC~Medium ]
    \setCJKfamilyfont { zhfs } { STFangsong }
    \setCJKfamilyfont { zhkai } { Kaiti~SC } [ BoldFont = Kaiti~SC~Bold ]
  }
\cs_new:Npn \__hust_loadfont_cjk_macoffice:n #1
  {
    \setCJKmainfont { Simsun.ttc } [ ItalicFont = Kaiti.ttf, #1 ]
    \setCJKsansfont { SimHei.ttf } [#1]
    \setCJKmonofont { Fangsong.ttf } [#1]
    \setCJKfamilyfont { zhsong } { Simsun.ttc } [#1]
    \setCJKfamilyfont { zhhei } { SimHei.ttf } [#1]
    \setCJKfamilyfont { zhfs } { Fangsong.ttf } [#1]
    \setCJKfamilyfont { zhkai } { Kaiti.ttf } [#1]
    \__hust_define_stzhongs:nn { \c__hust_path_macoffice_tl STZHONGS.ttf } {#1}
  }
\cs_new:Npn \__hust_loadfont_cjk_macoffice:
  {
    \__hust_loadfont_cjk_macoffice:n
      { Path = \c__hust_path_macoffice_tl, \c__hust_name_fakebold_tl }
  }
\cs_new_protected:Npn \__hust_loadfont_cjk_fandol:
  {
    \__hust_hide_no_script_msg:
    \setCJKmainfont { FandolSong-Regular }
      [
        Extension = .otf,
        BoldFont = FandolSong-Bold,
        ItalicFont = FandolKai-Regular,
      ]
    \setCJKsansfont { FandolHei-Regular }
      [
        Extension = .otf,
        BoldFont = FandolHei-Bold,
      ]
    \setCJKmonofont { FandolFang-Regular }
      [ Extension = .otf ]
    \setCJKfamilyfont { zhsong } { FandolSong-Regular }
      [
        Extension = .otf,
        BoldFont  = FandolSong-Bold
      ]
    \setCJKfamilyfont { zhhei } { FandolHei-Regular }
      [
        Extension = .otf,
        BoldFont = FandolHei-Bold,
      ]
    \setCJKfamilyfont { zhfs } { FandolFang-Regular }
      [ Extension = .otf ]
    \setCJKfamilyfont { zhkai } { FandolKai-Regular }
      [ Extension = .otf, \c__hust_name_fakebold_tl ]
  }
\cs_new_protected:Npn \__hust_loadfont_cjk_founder:
  {
    \sys_if_engine_xetex:T
      { \xeCJKEditPunctStyle { quanjiao } { optimize-kerning = true } }
    \sys_if_engine_luatex:T
      { \defaultCJKfontfeatures { JFM = { zh_CN / { quanjiao, fzpr } } } }
    \setCJKmainfont { FZShuSong-Z01 }
      [ BoldFont = FZXiaoBiaoSong-B05, ItalicFont = FZKai-Z03 ]
    \setCJKsansfont { FZXiHeiI-Z08 } [ BoldFont = FZHei-B01 ]
    \setCJKmonofont { FZFangSong-Z02 }
    \setCJKfamilyfont { zhsong } { FZShuSong-Z01 }
      [ BoldFont = FZXiaoBiaoSong-B05 ]
    \setCJKfamilyfont { zhhei } { FZHei-B01 }
      [ \c__hust_name_fakebold_tl ]
    \setCJKfamilyfont { zhkai } { FZKai-Z03 }
      [ \c__hust_name_fakebold_tl ]
    \setCJKfamilyfont { zhfs } { FZFangSong-Z02 }
    \defaultCJKfontfeatures { }
  }
\cs_new_protected:Npn \__hust_loadfont_cjk_noto:
  {
    \setCJKmainfont [ \c__hust_name_notofeature_clist ]
      { NotoSerifCJKsc }
    \setCJKsansfont [ \c__hust_name_notofeature_clist ]
      { NotoSansCJKsc  }
    \setCJKmonofont { Noto~Sans~Mono~CJK~SC }
    \setCJKfamilyfont { zhsong } { Noto~Serif~CJK~SC }
    \setCJKfamilyfont { zhhei } { Noto~Sans~CJK~SC }
    \setCJKfamilyfont { zhfs } { FZFangSong-Z02 }
    \setCJKfamilyfont { zhkai } { FZKai-Z03 }
      [ \c__hust_name_fakebold_tl ]
  }
\cs_new_protected:Npn \__hust_loadfont_cjk_source:
  {
    \setCJKmainfont [ \c__hust_name_notofeature_clist ]
      { SourceHanSerifSC }
    \setCJKsansfont [ \c__hust_name_notofeature_clist ]
      { SourceHanSansSC  }
    \setCJKmonofont { FZFangSong-Z02 }
    \setCJKfamilyfont { zhsong } { Source~Han~Serif~SC }
    \setCJKfamilyfont { zhhei } { Source~Han~Sans~SC }
    \setCJKfamilyfont { zhfs } { FZFangSong-Z02 }
    \setCJKfamilyfont { zhkai } { FZKai-Z03 }
      [ \c__hust_name_fakebold_tl ]
  }
\tl_const:Nn \c__hust_name_fakebold_tl { AutoFakeBold = 2.17 }
\clist_const:Nn \c__hust_name_notofeature_clist
  {
    Extension = .otf,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Regular,
    BoldItalicFont = *-Bold,
    ItalicFeatures = FakeSlant,
    BoldItalicFeatures = FakeSlant,
  }
\tl_new:N \l__hust_name_stzhongsopts_tl
\tl_set_eq:NN \l__hust_name_stzhongsopts_tl \c__hust_name_fakebold_tl
\tl_new:N \l__hust_name_stzhongsfile_tl
\cs_new:Npn \__hust_define_stzhongs:nn #1#2
  {
    \tl_set:Nn \l__hust_name_stzhongsfile_tl {#1}
    \tl_set:Nn \l__hust_name_stzhongsopts_tl {#2}
  }
\cs_new:Npn \__hust_loadfont_stzhongs:
  {
    \__hust_loadfont_stzhongs:V \l__hust_name_stzhongsfile_tl
  }
\cs_new_protected:Npn \__hust_loadfont_stzhongs:n #1
  {
    \fontspec_font_if_exist:nTF { #1 }
      {
        \newCJKfontfamily \__hust_stzhongs: { #1 }
          [ \l__hust_name_stzhongsopts_tl ]
      }
      {
        \bool_if:NTF \g__hust_font_dir_bool
          {
            \newCJKfontfamily \__hust_stzhongs: { #1 }
              [ Path = \g__hust_font_dir_tl, \c__hust_name_fakebold_tl ]
          }
          {
            \cs_set_eq:NN \__hust_stzhongs: \rmfamily
            \__hust_warning:n { missing-stzhongs }
          }
      }
  }
\__hust_msg_new:nn { missing-stzhongs }
  {
    "STZHONGS.TTF"~ is~ not~ found~ in~ your~ system.\\
    The~ font~ is~ normally~ distributed~ with~ MS~ Windows.~
    I~ have~ used~ songti~ for~ substitution.
  }
\cs_generate_variant:Nn \__hust_loadfont_stzhongs:n { V }
\cs_new:Npn \__hust_define_math_font:nn #1#2
  {
    \cs_new:cpn { __hust_loadfont_math_ #1 : }
      { \__um_setmathfont:nn { } {#2} }
  }
\clist_map_inline:nn
  {
    { asana } { Asana-Math.otf },
    { fira } { FiraMath-Regular.otf },
    { garamond } { Garamond-Math.otf },
    { lm } { latinmodern-math.otf },
    { libertinus } { LibertinusMath-Regular.otf },
    { stix } { STIXMath-Regular.otf },
    { bonum } { texgyrebonum-math.otf },
    { dejavu } { texgyredejavu-math.otf },
    { pagella } { texgyrepagella-math.otf },
    { schola } { texgyreschola-math.otf },
    { termes } { texgyretermes-math.otf },
  }
  { \__hust_define_math_font:nn #1 }
\cs_new:Npn \__hust_loadfont_math_cambria:
  {
    \bool_if:NTF \g__hust_font_dir_bool
      {
        \__um_setmathfont:nn
          { Path = \g__hust_font_dir_tl/, FontIndex = 1 }
          { cambria.ttc }
      }
      { \__um_setmathfont:nn { } { Cambria~Math } }
  }
\cs_new:Npn \__hust_loadfont_math_xits:
  {
    \bool_if:NTF \g__hust_opt_math_int_bool
      { \tl_set:Nn \l__hust_tmpa_tl { 8 } }
      { \tl_clear:N \l__hust_tmpa_tl }
    \__um_setmathfont:nn
      {
        Extension = .otf,
        StylisticSet = \l__hust_tmpa_tl,
        BoldFont = XITSMath-Bold,
      }
      { XITSMath-Regular }
    \__um_setmathfont:nn
      {
        Extension = .otf,
        StylisticSet = 1,
        range = {cal, bfcal},
      }
      { XITSMath-Regular }
  }
\cs_new:Npn \__hust_loadfont_math_newcm:
  {
    \bool_if:NTF \g__hust_opt_math_int_bool
      { \tl_set:Nn \l__hust_tmpa_tl { 2 } }
      { \tl_clear:N \l__hust_tmpa_tl }
    \__um_setmathfont:nn
      {
        Extension = .otf,
        StylisticSet = \l__hust_tmpa_tl,
      }
      { NewCMMath-Book }
    \__um_setmathfont:nn
      {
        Extension = .otf,
        StylisticSet = 1,
        range = {scr,bfscr},
      }
      { NewCMMath-Book }
    \__fontspec_main_setmathrm:nn
      {
        Extension = .otf,
        UprightFont = *-Book,
        BoldFont = *-Bold,
        ItalicFont = *-BookItalic,
        BoldItalicFont = *-BoldItalic,
      }
      { NewCM10 }
    \__fontspec_main_setmathsf:nn
      {
        Extension = .otf,
        UprightFont = *-Book,
        BoldFont = *-Bold,
        ItalicFont = *-BookOblique,
        BoldItalicFont = *-BoldOblique,
      }
      { NewCMSans10 }
    \__fontspec_main_setmathtt:nn
      {
        Extension = .otf,
        UprightFont = *-Book,
        ItalicFont = *-BookItalic,
        BoldFont = *-Bold,
        BoldItalicFont = *-BoldOblique,
      }
      { NewCMMono10 }
  }
\cs_set_eq:NN \__hust_loadfont_math_none: \tex_relax:D
\cs_new_protected:Npn \__hust_loadfont:
  {
    \use:c { __hust_loadfont_latin_ \g__hust_font_latin_tl : }
    \use:c { __hust_loadfont_cjk_ \g__hust_font_cjk_tl : }
    \NewDocumentCommand \songti { } { \CJKfamily { zhsong } }
    \NewDocumentCommand \heiti { } { \CJKfamily { zhhei } }
    \NewDocumentCommand \fangsong { } { \CJKfamily { zhfs } }
    \NewDocumentCommand \kaishu { } { \CJKfamily { zhkai } }
  }
\__hust_loadfont:
\ctex_at_end_preamble:n { \__hust_loadfont_stzhongs: }
\fancyhf {}
\color_set:nn { headfoot } { red }
\cs_new_protected:Npn \__hust_draw_hf_hline:n #1
  {
    { \color_select:n { headfoot } \tex_hrule:D height #1 }
  }
    \chead
      {
        \zihao{3} \ziju{0.75} \bfseries \kaishu
        \color_group_begin:
        \color_select:n { headfoot }
        \c__hust_header_tl
        \color_group_end:
      }
\tl_set:Nn { \headrulewidth } { 1 pt }
\tl_set:Nn { \headrule }
  {
    \skip_vertical:n { 3 pt }
    \__hust_draw_hf_hline:n \headrulewidth
    \skip_vertical:n \headrulewidth
    \__hust_draw_hf_hline:n \headrulewidth
  }
\cfoot { \zihao{-5} \thepage }
\tl_set:Nn { \footrulewidth } { 0.5 pt }
\tl_set:Nn { \footrule }
  {
    \__hust_draw_hf_hline:n \footrulewidth
    \skip_vertical:n { 3 pt }
  }
\pagestyle { fancy }
\tl_new:N \g__hust_info_title_tl
\tl_new:N \g__hust_info_degree_type_tl
\tl_new:N \g__hust_info_author_tl
\tl_new:N \g__hust_info_major_tl
\tl_new:N \g__hust_info_supervisor_tl
\tl_new:N \g__hust_info_date_tl
\tl_new:N \g__hust_info_clc_tl
\tl_new:N \g__hust_info_student_id_tl
\tl_new:N \g__hust_info_school_id_tl
\tl_new:N \g__hust_info_secret_tl
\tl_new:N \g__hust_info_title_en_tl
\tl_new:N \g__hust_info_author_en_tl
\tl_new:N \g__hust_info_major_en_tl
\tl_new:N \g__hust_info_supervisor_en_tl
\tl_new:N \g__hust_info_date_en_tl
\tl_new:N \g__hust_info_degree_en_tl
\seq_new:N \g__hust_info_committee_seq
\tl_new:N \l__hust_info_title_sanitized_tl
\tl_new:N \l__hust_info_title_en_sanitized_tl
\cs_new_protected:Npn \__hust_set_title:nn #1#2
  {
    \tl_gset:cn { g__hust_info_ #1 _tl } { #2 }
    \tl_set:cn { l__hust_info_ #1 _sanitized_tl } { #2 }
    \tl_replace_all:cnn { l__hust_info_ #1 _sanitized_tl } { \\ } { ~ }
    \regex_replace_all:nnc
      { \s+ } { \ }
      { l__hust_info_ #1 _sanitized_tl }
    \regex_replace_all:nnc
      { ([\x{4e00}-\x{9fff}]) \s+ ([\x{4e00}-\x{9fff}]) } { \1 \2 }
      { l__hust_info_ #1 _sanitized_tl }
  }
\cs_new:Npn \__hust_set_date:n #1
  {
    \__hust_set_date_aux:w #1 \q_stop
  }
\cs_new_protected:Npn \__hust_set_date_aux:w #1 - #2 - #3 \q_stop
  {
    \tl_gset:Nn \g__hust_info_date_tl { {#1} 年 {#2} 月 {#3} 日 }
    \tl_gset:Nn \g__hust_info_date_en_tl
      { \clist_item:Nn \c__hust_month_clist {#2},~ {#1} }
  }
\clist_const:Nn \c__hust_month_clist
  {
    January, February, March, April, May, June,
    July, August, September, October, November, December,
  }
\keys_define:nn { hust / info }
  {
    title .tl_gset:N = \g__hust_info_title_tl,
    title* .tl_gset:N = \g__hust_info_title_en_tl,
    degree .choices:nn =
      { academic, professional }
      {
        \tl_gset_eq:NN \g__hust_info_degree_tl \l_keys_choice_tl
      },
    degree .default:n = { academic },
    degree* .tl_gset:N = \g__hust_info_degree_en_tl,
    author .tl_gset:N = \g__hust_info_author_tl,
    author* .tl_gset:N = \g__hust_info_author_en_tl,
    major .tl_gset:N = \g__hust_info_major_tl,
    major* .tl_gset:N = \g__hust_info_major_en_tl,
    supervisor .tl_gset:N = \g__hust_info_supervisor_tl,
    supervisor* .tl_gset:N = \g__hust_info_supervisor_en_tl,
    date .code:n = { \__hust_set_date:n { #1 } },
    clc .tl_gset:N = \g__hust_info_clc_tl,
    student-id .tl_gset:N = \g__hust_info_student_id_tl,
    school-id .tl_gset:N = \g__hust_info_school_id_tl,
    secret .tl_gset:N = \g__hust_info_secret_tl,
    committee .code:n =
      {
        \seq_gset_from_clist:Nn \g__hust_info_committee_seq { #1 }
      },
  }
\cs_new_protected:Npn \__hust_spread_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \tl_map_inline:nn {#2} { ##1 \hfil } \unskip }
  }
\cs_generate_variant:Nn \__hust_spread_box:nn { no }
\cs_new_protected:Npn \__hust_center_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \tex_hfil:D #2 \tex_hfil:D }
  }
\cs_generate_variant:Nn \__hust_center_box:nn { Vn }
\cs_new:Npn \__hust_fixed_width_box:nn #1#2
  { \parbox {#1} {#2} }
\cs_new:Npn \__hust_fixed_width_center_box:nn #1#2
  { \parbox {#1} { \centering #2 } }
\cs_new:Npn \__hust_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__hust_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__hust_tmpa_box }
  }
\cs_generate_variant:Nn \__hust_get_text_width:Nn { NV }
\cs_new:Npn \__hust_blank_underline:n #1
  { \rule [ -0.5 ex ] {#1} { 0.4 pt } }
\NewTemplateType { hust / component } { 0 }
\DeclareTemplateInterface { hust / component } { plain } { 0 }
{
  content : tokenlist = \c_empty_tl,
  format : tokenlist = \c_empty_tl,
  width: skip = \c_zero_skip,
  height: skip = \c_zero_skip,
  top-lines : integer = \c_zero_int,
  top-skip : skip = \c_zero_skip,
  bottom-skip : skip = \c_zero_skip,
  bottom-lines : integer = \c_zero_int,
  align : choice { left, right, center, justify } = center,
}
\DeclareTemplateCode { hust / component } { plain } { 0 }
{
  content = \l__hust_component_content_tl,
  format = \l__hust_component_format_tl,
  width = \l__hust_component_width_skip,
  height = \l__hust_component_height_skip,
  top-lines = \l__hust_component_top_lines_int,
  top-skip = \l__hust_component_top_skip,
  bottom-skip = \l__hust_component_bottom_skip,
  bottom-lines = \l__hust_component_bottom_lines_int,
  align =
    {
      left =
        \cs_set_eq:NN \l__hust_component_align: \raggedright,
      right =
        \cs_set_eq:NN \l__hust_component_align: \raggedleft,
      center =
        \cs_set_eq:NN \l__hust_component_align: \centering,
      justify =
        \cs_set_eq:NN \l__hust_component_align: \prg_do_nothing:,
    }
}
{
  \AssignTemplateKeys
  \l__hust_component_format_tl
  \int_step_inline:nn { \l__hust_component_top_lines_int }
    {
      \mode_leave_vertical:
      \tex_par:D
    }
  \dim_compare:nNnTF { \l__hust_component_height_skip } > { \c_zero_skip }
    {
      \box_clear_new:N \l__hust_component_box
      \vbox_set_to_ht:Nnn \l__hust_component_box { \l__hust_component_height_skip }
        {
          \skip_vertical:N \l__hust_component_top_skip
          \l__hust_component_align:
          \l__hust_component_content_tl
          \tex_vfill:D
        }
      \box_use:N \l__hust_component_box
    }
    {
      \skip_vertical:N \l__hust_component_top_skip
      \l__hust_component_align:
      \l__hust_component_content_tl
      \tex_par:D
    }
  \int_step_inline:nn { \l__hust_component_bottom_lines_int }
    {
      \mode_leave_vertical:
      \tex_par:D
    }
  \skip_vertical:N \l__hust_component_bottom_skip
  \skip_vertical:N \c_zero_skip
}
\NewTemplateType { hust / page } { 0 }
\DeclareTemplateInterface { hust / page } { title } { 0 }
  {
    prefix : tokenlist,
    components : commalist,
    style : tokenlist = empty,
    format : tokenlist = \linespread { } \selectfont,
    top-skip : skip = \c_zero_skip,
  }
\DeclareTemplateCode { hust / page } { title } { 0 }
  {
    prefix = \l__hust_page_prefix_tl,
    components = \l__hust_page_components_clist,
    style = \l__hust_page_style_tl,
    format = \l__hust_page_format_tl,
    top-skip = \l__hust_page_top_skip,
  }
  {
    \AssignTemplateKeys
    \skip_vertical:N \l__hust_page_top_skip
    \group_begin:
      \exp_args:No \thispagestyle { \l__hust_page_style_tl }
      \l__hust_page_format_tl
      \clist_map_inline:Nn \l__hust_page_components_clist
        {
          \group_begin:
          \UseInstance { hust / component } { \l__hust_page_prefix_tl / ##1 }
          \group_end:
        }
    \group_end:
    \clearpage
  }
\cs_new_protected:Npn \__hust_declare_component_instance:nnn #1#2#3
  { \DeclareInstance { hust / component } { #1/#2 } { plain } {#3} }
\cs_new_protected:Npn \__hust_declare_page_instance:nn #1#2
  {
    \DeclareInstance { hust / page } {#1} { title }
    {
      prefix = #1,
      #2,
    }
  }
\__hust_declare_component_instance:nnn { title zh } { identifiers }
  {
    content =
      {
        \__hust_title_zh_ids_aux:nn { 6em } { clc } % 3 em
        \skip_horizontal:n { \linewidth - 19em }
        \__hust_title_zh_ids_aux:nn { 8em } { student_id } % 4 em
        \tex_par:D
        \__hust_title_zh_ids_aux:nn { 5em } { school_id } % 4 em
        \skip_horizontal:n { \linewidth - 19em }
        \__hust_title_zh_ids_aux:nn { 8em } { secret } % 4 em
      },
    format =
      {
        \zihao{-4} \bfseries \rmfamily \songti
        \__hust_line_spread:n { 1.5 }
      },
    bottom-skip = 2 cm,
  }
\cs_new:Npn \__hust_title_zh_ids_aux:nn #1#2
  {
    \tl_use:c { c__hust_name_ #2 _tl }
    \__hust_ul_to_wd:nnn { 1 pt } { #1 }
      { \tl_use:c { g__hust_info_ #2 _tl } }
  }
\__hust_declare_component_instance:nnn { title zh } { logo }
  {
    content =
      {
        \includegraphics [ height = 1.4 cm ] { hust-title.pdf }
      },
    bottom-skip = 0.5 cm,
  }
\__ctex_save_font_size:nn { a } { 45 bp } % 大初号
\__hust_declare_component_instance:nnn { title zh } { type }
  {
    content = { \c__hust_name_type_zh_tl },
    format = { \zihao { a } \bfseries \songti \ziju { 0.1 } },
    bottom-skip = 0.5 cm,
  }
\__hust_declare_component_instance:nnn { title zh } { degree }
  {
    content =
      {
        （
        \c__hust_name_academic_zh_tl
        \tl_if_eq:NnTF \g__hust_info_degree_tl { academic }
          { \c__hust_checkbox_tl }
          { \c__hust_emptybox_tl }
        \skip_horizontal:n { 2.5 em }
        \c__hust_name_professional_zh_tl
        \tl_if_eq:NnTF \g__hust_info_degree_tl { professional }
          { \c__hust_checkbox_tl }
          { \c__hust_emptybox_tl }
        ）
      },
    format = { \zihao { -3 } \c__hust_name_degree_font_tl },
    bottom-skip = 1.5 cm,
  }
\__hust_declare_component_instance:nnn { title zh } { title }
  {
    content = { \g__hust_info_title_tl },
    format =
      {
        \zihao { 1 } \bfseries \songti
        \__hust_line_spread:n { 1.5 }
      },
    height = 4.8 cm,
    bottom-skip = 1 cm,
  }
\__hust_declare_component_instance:nnn { title zh } { info }
  {
    content =
      {
        \tl_set:Nn \arraystretch { 2 }
        \begin{tabular}{p{5em}@{：\hspace{1em}}l}
          \c__hust_name_author_zh_tl & \g__hust_info_author_tl \\
          \c__hust_name_major_zh_tl & \g__hust_info_major_tl \\
          \c__hust_name_supervisor_zh_tl & \g__hust_info_supervisor_tl \\
          \c__hust_name_date_tl & \g__hust_info_date_tl \\
        \end{tabular}
      },
    format = { \zihao { -3 } \bfseries \rmfamily \songti },
    bottom-skip = 30 pt,
  }
\__hust_declare_component_instance:nnn { title en } { degree }
  {
    content =
      {
        \c__hust_name_type_en_tl
        \tl_if_eq:NnTF \g__hust_info_degree_tl { academic }
          { \c__hust_name_academic_en_tl }
          { \c__hust_name_professional_en_tl }
        \g__hust_info_degree_en_tl
      },
    format =
      {
        \zihao { -3 } \bfseries \rmfamily
        \__hust_line_spread:n { 1.5 }
      },
    bottom-skip = 5.5 cm,
  }
\__hust_declare_component_instance:nnn { title en } { title }
  {
    content = { \g__hust_info_title_en_tl },
    format =
      {
        \zihao { -2 } \bfseries \rmfamily
        \__hust_line_spread:n { 1.5 }
      },
    height = 3 cm,
    bottom-skip = 3 cm,
  }
\__hust_declare_component_instance:nnn { title en } { info }
  {
    content =
      {
        \begin{tabular}{l@{\hspace{0.5em}:\hspace{0.5em}}l}
          \c__hust_name_author_en_tl & \g__hust_info_author_en_tl \\
          \c__hust_name_major_en_tl & \g__hust_info_major_en_tl \\
          \c__hust_name_supervisor_en_tl & \g__hust_info_supervisor_en_tl \\
        \end{tabular}
      },
    format =
      {
        \zihao { -3 } \bfseries \rmfamily
        \__hust_line_spread:n { 1.5 }
      },
    bottom-skip = 4 cm,
  }
\__hust_declare_component_instance:nnn { title en } { address }
  {
    content = { \c__hust_address_tl },
    format =
      {
        \zihao { -3 } \bfseries \rmfamily
        \__hust_line_spread:n { 1.5 }
      },
  }
\__hust_declare_component_instance:nnn { title en } { date }
  {
    content = { \tl_use:N \g__hust_info_date_en_tl },
    format =
      {
        \zihao { -3 } \bfseries \rmfamily
        \__hust_line_spread:n { 1.5 }
      },
  }
\__hust_declare_component_instance:nnn { committee } { title }
  {
    content = { \c__hust_name_committee_tl },
    format =
      {
        \zihao { 3 } \bfseries \sffamily
        \__hust_line_spread:n { 1.5 }
      },
    bottom-lines = 1,
  }
\tl_const:Nn \c__hust_name_committee_tl { 答辩委员会 }
\__hust_declare_component_instance:nnn { committee } { members }
  {
    content =
      {
        \tl_set:Nn \arraystretch { 1.5 }
        \begin{tabular}
          { |c|c|c|c| }
          \hline
          \c__hust_committee_header_tl \\
          \hline
          \int_const:Nn \l__hust_info_committee_count_int
            { \seq_count:N \g__hust_info_committee_seq }
          \seq_map_indexed_inline:Nn \g__hust_info_committee_seq
            {
              \int_case:nnF { #1 }
                {
                  { 1 }
                    {
                      \clist_item:Nn \c__hust_committee_role_clist { 1 }
                      & #2 \\ \hline
                    }
                  { 2 }
                    {
                      \multirow
                        { \int_eval:n { \l__hust_info_committee_count_int - 1 } }
                        { * }
                        { \clist_item:Nn \c__hust_committee_role_clist { 2 } }
                      & #2 \\ \cline{2-4}
                    }
                  { \l__hust_info_committee_count_int }
                    { & #2 }
                }
                { & #2 \\ \cline{2-4} }
            }
            \\ \hline
        \end{tabular}
      },
    format =
      {
        \zihao { 4 } \sffamily
        \__hust_line_spread:n { 1.5 }
      },
    top-lines = 1,
  }
\tl_const:Nn \c__hust_committee_header_tl
  { \makebox[3em]{} & \makebox[4em][c]{姓名} & \makebox[4em][c]{职称} & \makebox[12em][c]{单位} }
\clist_const:Nn \c__hust_committee_role_clist
  { 主席, 委员, }
\tl_new:N \l__hust_committee_member_tl
\__hust_declare_component_instance:nnn { decl } { orig title }
  {
    content = { \c__hust_orig_decl_title_tl },
    format =
      {
        \zihao { 3 } \bfseries \heiti
      },
      bottom-lines = 1,
  }
\__hust_declare_component_instance:nnn { decl } { orig text }
  {
    content = { \c__hust_orig_decl_text_tl },
    align = justify,
    bottom-lines = 1,
  }
\__hust_declare_component_instance:nnn { decl } { orig sign }
  {
    content =
      {
        \clist_map_inline:Nn \c__hust_orig_decl_sign_clist
          {
            #1 \\
          }
      },
    align = right,
    bottom-lines = 3,
  }
\__hust_declare_component_instance:nnn { decl } { auth title }
  {
    content = { \c__hust_auth_decl_title_tl },
    format =
      {
        \zihao { 3 } \bfseries \heiti
      },
    top-lines = 1,
    bottom-lines = 1,
  }
\__hust_declare_component_instance:nnn { decl } { auth text }
  {
    content = { \c__hust_auth_decl_text_tl },
    align = justify,
    bottom-skip = 0.5 cm,
  }
\__hust_declare_component_instance:nnn { decl } { auth secr }
  {
    content =
      {
        \mode_leave_vertical:
        \hbox_overlap_right:n
          { \clist_item:Nn \c__hust_auth_decl_secr_clist { 1 } }
        \skip_vertical:n { -1.2 cm }
        \skip_horizontal:n { 6 em }
        \clist_item:Nn \c__hust_auth_decl_secr_clist { 2 }
        \tex_par:D
        \skip_horizontal:n { 6 em }
        \clist_item:Nn \c__hust_auth_decl_secr_clist { 3 }
        \tex_par:D
        \clist_item:Nn \c__hust_auth_decl_secr_clist { 4 }
      },
    align = justify,
    bottom-lines = 1,
  }
\__hust_declare_component_instance:nnn { decl } { auth sign }
  {
    content =
      {
        \clist_map_inline:Nn \c__hust_auth_decl_sign_clist
          {
            #1
            \tex_par:D
          }
      },
    align = justify,
  }
\__hust_declare_page_instance:nn { title zh }
  {
    components = { identifiers, logo, type, degree, title, info, },
  }
\DeclareDocumentCommand \makezhtitle { }
  {
    \UseInstance { hust / page } { title zh }
  }

\__hust_declare_page_instance:nn { title en }
  {
    components = { degree, title, info, address, date, },
  }
\DeclareDocumentCommand \makeentitle { }
  {
    \UseInstance { hust / page } { title en }
  }
\__hust_declare_page_instance:nn { committee }
  {
    components = { title, members, },
  }
\DeclareDocumentCommand \makecommittee { }
  {
    \UseInstance { hust / page } { committee }
  }
\__hust_declare_page_instance:nn { decl }
  {
    components =
      {
        orig title, orig text, orig sign,
        auth title, auth text, auth secr, auth sign,
      },
    format =
      {
        \zihao { -4 } \rmfamily
        \__hust_line_spread:n { 1.5 }
      }
  }
\DeclareDocumentCommand \makedecl { }
  {
    \UseInstance { hust / page } { decl }
  }
\DeclareDocumentCommand \maketitle { }
  {
    \makezhtitle
    \tl_if_eq:NnT \g__hust_degree_type_tl { doctor }
      { \makecommittee }
    \makeentitle
    \makedecl
  }
\__hust_appto_cmd:Nn \frontmatter
  {
    \pagestyle { fancy }
    \pagenumbering { Roman }
    \__hust_toc_chapter_frontmatter:
  }
\NewDocumentEnvironment { abstract } { }
  {
    \chapter**{\c__hust_name_abstract_zh_tl}
  }
  { }
\NewDocumentEnvironment { abstract* } { }
  {
    \chapter**{\c__hust_name_abstract_en_tl}
  }
  { }
\NewDocumentCommand \keywords { s }
  {
    \IfBooleanTF { #1 }
      { \__hust_keywords:nw { en } }
      { \__hust_keywords:nw { zh } }
  }
\cs_new_nopar:Npn \__hust_keywords:nw #1 #2
  {
    \zihao{-4} \rmfamily
    \tex_par:D
    \skip_horizontal:n \c_zero_skip
    \tex_par:D
    \tex_noindent:D
    \group_begin:
      \bfseries \heiti
      \tl_use:c { c__hust_name_keywords_ #1 _tl }
    \group_end:
    \c_space_tl
    #2
  }
\tl_set:Nn \contentsname { 目\hspace{1em}录 }
\keys_set:nn { ctex }
  {
    tocdepth = section,
  }
\contentsmargin { 0 pt }
\cs_new_protected:Npn \__hust_toc_format:nnnn #1#2#3#4
  {
    \titlecontents
      { #1 }
      [ 0 pt ]
      { #3 }
      { \thecontentslabel \hspace{#2} #3 }
      { #3 }
      { #4 }
  }
\cs_new:Npn \ddotfill
  {
    \leavevmode \leaders \hbox to .22em {\hss .\hss } \hfill \kern 0pt
  }
\cs_new_protected:Npn \__hust_toc_chapter_frontmatter:
  {
    \__hust_toc_format:nnnn
      { chapter }
      { 1 em}
      { \zihao{4} \bfseries \rmfamily \heiti }
      { \mdseries \ddotfill \thecontentspage }
    }
\cs_new_protected:Npn \__hust_toc_chapter_mainmatter:
  {
    \__hust_toc_format:nnnn
      { chapter }
      { 1 em }
      { \zihao{4} \bfseries \rmfamily \heiti }
      { \mdseries \hfill (\thecontentspage) }
  }
\cs_new_protected:Npn \__hust_toc_chapter_backmatter:
  {
    \__hust_toc_format:nnnn
      { chapter }
      { 1 em }
      { \zihao{4} \bfseries \rmfamily \heiti }
      { \mdseries \ddotfill (\thecontentspage) }
  }
\__hust_toc_format:nnnn
  { section }
  { 2 em }
  { \zihao{4} \rmfamily }
  { \ddotfill (\thecontentspage) }
\__hust_appto_cmd:Nn \mainmatter
  {
    \pagestyle { fancy }
    \pagenumbering { arabic }
    \__hust_toc_chapter_mainmatter:
  }
\keys_set:nn { ctex }
  {

    chapter =
      {
        format = \zihao{3} \bfseries \rmfamily \heiti \centering \linespread{1.5},
        name = {},
        beforeskip = 15.5 bp,
        afterskip = 14 bp + \CTEX@chapter@lofskip,
        number = \arabic{ chapter },
        pagestyle = fancy,
        fixskip = true,
      },
    section =
      {
        format = \zihao{4} \bfseries \rmfamily \heiti \raggedright,
        numberformat = \rmfamily,
        beforeskip = 10 bp,
        afterskip = 7 bp,
      },
    subsection =
      {
        format = \zihao{-4} \bfseries \rmfamily \heiti \raggedright,
        numberformat = \rmfamily,
        beforeskip = 7 bp,
        afterskip = 4 bp,
      }
  }
\cs_set_eq:NN \__hust_chapter:D \chapter
\RenewDocumentCommand \chapter { s s o m }
  {
    \IfNoValueTF{#3}
      {
        \IfBooleanTF{#1}
          {
            \__hust_chapter:D*{#4}
            \IfBooleanT{#2}
              {  \CTEX@addtocline{chapter}{#4} }
          }
          { \__hust_chapter:D{#4} }
      }
      {
        \IfBooleanTF{#1}
          {
            \__hust_chapter:D*{#4}
            \IfBooleanT{#2}
              {  \CTEX@addtocline{chapter}{#3} }
          }
          { \__hust_chapter:D[#3]{#4} }

      }
  }
\__hust_appto_cmd:Nn \backmatter
  {
    \__hust_toc_chapter_backmatter:
  }
\NewDocumentEnvironment { acknowledgements } { }
  {
    \chapter**{致\hspace{1em}谢}
  }
  { }
\cs_if_exist:NT \printbibliography
  {
    \defbibheading{bibliography}[\refname]{%
      \chapter**{#1}%
    }
}
\__hust_appto_cmd:Nn \appendix
  {
  }
\keys_set:nn { ctex / appendix }
  {
    number = \arabic{chapter},
  }
\keys_define:nn { hust }
  {
    info .meta:nn = { hust / info } {#1},
    style .meta:nn = { hust / style } {#1}
  }
\keys_set_known:nn { hust }
  {
    info =
      {
        degree = { academic },
        secret = ,
        school-id = { 10487 },
        date =
          {
            \int_use:N \c_sys_year_int -
            \int_use:N \c_sys_month_int -
            \int_use:N \c_sys_day_int
          },
        anonymous-list =
          {
            author, student_id, supervisor,
            author_en, supervisor_en,
          },
        committee =
          {
            { &~&~ },
            { &~&~ },
            { &~&~ },
            { &~&~ },
            { &~&~ },
            { &~&~ },
            { &~&~ },
          }
      }
  }
\NewDocumentCommand \hustsetup { m }
  { \keys_set:nn { hust } {#1} }

%% 
%%     This work consists of the files hustthesis.dtx
%%               and the derived files hustthesis.ins,
%%                                     hustthesis.cls,
%%                                     hustthesis-doc.sty,
%%                                     hustthesis-m.def,
%%                                     hustthesis-d.def,
%%                                     hustthesis.cbx,
%%                                     hustthesis.bbx.
%% 
%%
%% End of file `hustthesis.cls'.
