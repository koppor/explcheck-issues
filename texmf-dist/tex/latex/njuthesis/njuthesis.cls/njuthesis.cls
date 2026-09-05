%%
%% This is file `njuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% njuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2021 - 2026
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
\NeedsTeXFormat{LaTeX2e}
\GetIdInfo $Id: njuthesis.dtx 1.5.1 2026-05-30 18:20:00
  +0800 NJU LUG <git+nju-lug-email-3104-issue-@yaoge123.cn>$
  {Thesis template for Nanjing University}
\ProvidesExplClass{njuthesis}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}

\RequirePackage { xtemplate, l3keys2e }
\msg_new:nnn { njuthesis } { l3-too-old }
  {
    Package~ "#1"~ is~ too~ old. \\
    Please~ update~ an~ up-to-date~ version~ of~ the~
    bundles~ "l3kernel"~ and~ "l3packages"~ using~
    your~ TeX~ package~ manager~ or~ from~ CTAN.
  }
\clist_map_inline:nn { xtemplate, l3keys2e }
  {
    \@ifpackagelater {#1} { 2020/10/01 }
      { } { \msg_error:nnn { njuthesis } { l3-too-old } {#1} }
  }
\@ifpackagelater { expl3 } { 2023/10/10 } { }
  {
    \cs_generate_variant:Nn \tl_set:Nn        { Ne }
    \cs_generate_variant:Nn \tl_gset:Nn       { Ne }
    \cs_generate_variant:Nn \tl_const:Nn      { Ne }
    \cs_generate_variant:Nn \tl_gput_right:Nn { Ne }
  }
\msg_new:nnn { njuthesis } { unsupported-engine }
  {
    The~ njuthesis~ class~ requires~ either~
    XeTeX~ or~ LuaTeX. \\
    "#1"~ is~ not~ supported~ at~ present.~
    You~ must~ change~ your~ typesetting~ engine~
    to~ "xelatex"~ or~ "lualatex".
  }
\bool_lazy_or:nnF
  { \sys_if_engine_xetex_p:  }
  { \sys_if_engine_luatex_p: }
  { \msg_fatal:nne { njuthesis } { unsupported-engine } { \c_sys_engine_str } }
\box_new:N   \l__nju_tmpa_box
\box_new:N   \l__nju_tmpb_box
\box_new:N   \g__nju_tmpc_box
\clist_new:N \l__nju_tmp_clist
\dim_new:N   \l__nju_tmpa_dim
\dim_new:N   \l__nju_tmpb_dim
\int_new:N   \l__nju_tmpa_int
\int_new:N   \l__nju_tmpb_int
\skip_new:N  \l__nju_tmp_skip
\tl_new:N    \l__nju_tmpa_tl
\tl_new:N    \l__nju_tmpb_tl
\int_new:N \g__nju_info_type_int
\bool_new:N \g__nju_opt_academic_bool
\bool_new:N        \g__nju_opt_draft_bool
\bool_gset_false:N \g__nju_opt_draft_bool
\bool_new:N \g__nju_opt_supvii_bool
\tl_new:N \g__nju_info_supvfull_tl
\tl_new:N \g__nju_info_supvfull_en_tl
\tl_new:N \g__nju_info_major_tl
\tl_new:N \g__nju_info_majorc_tl
\tl_new:N \g__nju_font_set_tl
\tl_new:N \g__nju_font_latin_tl
\tl_new:N \g__nju_font_cjk_tl
\tl_new:N \g__nju_font_math_tl
\tl_new:N \g__nju_font_path_tl
\bool_new:N \g__nju_font_path_bool
\tl_new:N \g__nju_config_tl
\clist_new:N \g__nju_keys_excl_clist
\int_new:N \g__nju_uline_count_int
\tl_const:Ne \c__nju_name_today_tl
  {
    \int_to_arabic:n { \c_sys_year_int  } -
    \int_to_arabic:n { \c_sys_month_int } -
    \int_to_arabic:n { \c_sys_day_int   }
  }
\dim_new:N \g__nju_prevdepth_dim
\clist_const:Nn \c__nju_name_type_clist
  { 学士, 硕士, 博士 }
\clist_const:Nn \c__nju_name_type_en_clist
  { Bachelor, Master, Doctor~of~Philosophy }
\clist_const:Nn \c__nju_name_month_en_clist
  {
    January, February, March, April, May, June,
    July, August, September, October, November, December
  }
\clist_const:Nn \c__nju_name_anon_clist
  {
    author, chairman, student-id, reviewer,
    supervisor-contact, supervisor, supervisor-ii
  }
\clist_const:Nn \c__nju_name_anon_en_clist
  { author, supervisor, supervisor-ii }
\cs_new:Nn \__nju_null: { \hbox:n { } }
\cs_new:Nn \__nju_space: { \skip_horizontal:n { .5 em } }
\cs_new:Nn \__nju_quad:  { \skip_horizontal:n {  1 em } }
\cs_new:Nn \__nju_vskip: { \skip_vertical:N   \l__nju_vsep_dim }
\cs_new:Nn \__nju_hskip: { \skip_horizontal:N \l__nju_hsep_dim }
\cs_set_protected:Npn \__nju_vskip:N #1
  {
    \tex_hrule:D \@height \c_zero_dim \scan_stop:
    \tex_penalty:D \@M
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_dim
  }
\cs_new:Npn \__nju_define_name:nn #1
  {
    \tl_new:c  { l__nju_name_ #1    _tl }
    \tl_set:cn { l__nju_name_ #1    _tl }
  }
\cs_new:Npn \__nju_define_name:nnn #1#2#3
  {
    \__nju_define_name:nn { #1     } {#2}
    \__nju_define_name:nn { #1 _en } {#3}
  }
\cs_new:Npn \__nju_define_fmt:nn #1
  {
    \tl_new:c  { l__nju_fmt_ #1 _tl }
    \tl_set:cn { l__nju_fmt_ #1 _tl }
  }
\cs_new:Npn \__nju_define_dim:nn  #1
  {
    \dim_new:c   { l__nju_ #1 _dim  }
    \dim_set:cn  { l__nju_ #1 _dim  }
  }
\cs_new:Npn \__nju_define_skip:nn #1
  {
    \skip_new:c  { l__nju_ #1 _skip }
    \skip_set:cn { l__nju_ #1 _skip }
  }
\cs_new:Npn \__nju_info:n #1 { \tl_use:c { g__nju_info_ #1 _tl } }
\cs_new:Npn \__nju_name:n #1 { \tl_use:c { l__nju_name_ #1 _tl } }
\cs_new:Npn \__nju_fmt:n  #1 { \tl_use:c { l__nju_fmt_  #1 _tl } }
\cs_new:Npn \__nju_name:nn #1#2
  { \group_begin: \__nju_fmt:n {#1} \__nju_name:n {#2} \group_end: }
\cs_new:Npn \__nju_fontsize:nn #1#2
  { \fontsize {#1} {#2} \selectfont }
\cs_new:Npn \__nju_fontsize:nnn #1#2#3
  { \__nju_fontsize:nn {#1} { \fp_to_decimal:n { #3 * #1 } } }
\cs_new:Npn \__nju_zihao:nn #1#2
  {
    \prop_get:NnNTF \c__ctex_font_size_prop {#2} \l__ctex_font_size_tl
      { \exp_after:wN \__nju_fontsize:nnn \l__ctex_font_size_tl {#1} }
      { \msg_error:nnn { ctex } { fontsize } {#2} }
  }
\cs_new:Npn \__nju_zihao:n { \__nju_zihao:nn { 1.3 } }
\cs_generate_variant:Nn \cs_new:Npn { Npo }
\cs_new:Npo \__nju_set_ccglue:n #1
  {
    \sys_if_engine_xetex:TF
      { \skip_set:Nn \l__ctex_ccglue_skip {#1} }
      { \ltjsetparameter { kanjiskip = {#1} } }
  }
\cs_if_exist:NTF \vbox_center:n
  { \cs_new_eq:NN \__nju_vbox_center:n \vbox_center:n }
  {
    \box_new:N \l__nju_vbox_center_box
    \dim_new:N \l__nju_vbox_center_delta_dim
    \cs_new_protected:Npn \__nju_vbox_center:n #1
      {
        \vbox_set:Nn \l__nju_vbox_center_box {#1}
        \dim_set:Nn \l__nju_vbox_center_delta_dim
          {
            \box_ht:N \l__nju_vbox_center_box
            + \box_dp:N \l__nju_vbox_center_box
          }
        \box_set_ht:Nn \l__nju_vbox_center_box
          {
            (
              \tex_ifodd:D \l__nju_vbox_center_delta_dim
                1 sp +
              \tex_fi:D
              \l__nju_vbox_center_delta_dim
            ) / 2
          }
        \box_set_dp:Nn \l__nju_vbox_center_box
          {
            \l__nju_vbox_center_delta_dim
            - \box_ht:N \l__nju_vbox_center_box
          }
        \box_use_drop:N \l__nju_vbox_center_box
      }
  }
\cs_if_exist:NTF \box_underline:Nnn
  { \cs_new_eq:NN \__nju_box_underline:Nnn \box_underline:Nnn }
  {
    \cs_new_protected:Npn \__nju_box_underline:Nnn #1#2#3
      {
        \hbox_set:Nn #1
          {
            \vbox_top:n
              {
                \box_use_drop:N #1
                \tex_kern:D \dim_eval:n {#2}
                \tex_hrule:D height \dim_eval:n {#3} depth \c_zero_dim \scan_stop:
              }
          }
      }
  }
\cs_new_protected:Npn \__nju_box_underline:N #1
  {
    \__nju_box_underline:Nnn #1
      { - \l__nju_ruledpi_dim - \l__nju_rulehti_dim - \box_dp:N #1 }
      { \l__nju_rulehti_dim }
  }
\cs_new_protected:Npn \__nju_box_ulined:NN #1#2
  {
    \mode_leave_vertical:
    \hbox_set_to_wd:Nnn \l__nju_tmpa_box {#1}
      { \tex_hfil:D #2 \tex_hfil:D }
    \__nju_box_underline:N \l__nju_tmpa_box
    \box_use_drop:N \l__nju_tmpa_box
  }
\cs_generate_variant:Nn \__nju_box_ulined:NN { Nc }
\cs_new_protected:Npn \__nju_box_ulined_info:Nn #1#2
  { \__nju_box_ulined:Nc #1 { g__nju_info_ #2 _tl } }
\cs_new_protected:Npn \__nju_box_spread:NNNn #1#2#3#4
  {
    \mode_leave_vertical:
    \__nju_get_width:Nn #1 { #3 #4 }
    \hbox_to_wd:nn {#2}
      {
        \dim_compare:nTF { #1 > #2 }
          {
            \tex_hfil:D \scalebox
              { \dim_to_decimal_in_unit:nn {#2} {#1} }
              [ 1.0 ] { #3 #4 } \tex_hfil:D
          }
          { #3 \tl_map_inline:nn {#4} { ##1 \tex_hfil:D } \tex_unskip:D }
      }
  }
\cs_new:Npn \__nju_box_spread:NNn { \__nju_box_spread:NNNn \l__nju_tmp_skip }
\cs_generate_variant:Nn \__nju_box_spread:NNn { NNv }
\cs_generate_variant:Nn \__nju_box_spread:NNn { NNe }
\cs_new_protected:Npn \__nju_box_spread_name:Nn #1#2
  { \__nju_box_spread:NNv #1 \c_empty_tl { l__nju_name_ #2 _tl } }
\cs_new_protected:Npn \__nju_box_spread_name:NNn #1#2#3
  { \__nju_box_spread:NNv #1 #2 { l__nju_name_ #3 _tl } }
\cs_new_protected:Npn \__nju_box_center:Nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \tex_hfil:D #2 \tex_hfil:D }
  }
\cs_new_protected:Npn \__nju_box_multiline:NNNNn #1#2#3#4#5
  {
    \int_set:Nn #1 { \int_max:nn { \clist_count:N #3 } {#5} }
    \int_step_inline:nn {#1}
      {
        \clist_gpop:NNF #3 #2 { \tl_set_eq:NN #2 \c_empty_tl }
        \__nju_box_ulined:NN #4 #2 \tex_par:D
      }
  }
\cs_new_protected:Npn \__nju_box_paragraph:nn #1#2
  {
    \vbox_top:n
      {
        \@parboxrestore
        \dim_set:Nn \tex_hsize:D {#1}
        #2
        \dim_gset_eq:NN \g__nju_prevdepth_dim \tex_prevdepth:D
      }
    \tex_par:D
    \dim_set_eq:NN \tex_prevdepth:D \g__nju_prevdepth_dim
  }
\cs_new:Npn \__nju_box_multiline:NNn
  { \__nju_box_multiline:NNNNn \l__nju_tmpa_int \l__nju_tmpa_tl }
\cs_new_protected:Npn \__nju_uline:n #1
  {
    \mode_leave_vertical:
    \rule [ \l__nju_ruledpi_dim ] {#1} { \l__nju_rulehti_dim }
    \skip_horizontal:n { -#1 }
  }
\cs_new_protected:Npn \__nju_uuline:n #1
  {
    \mode_leave_vertical:
    \rule [ \l__nju_ruledpii_dim  ] {#1} { \l__nju_rulehtii_dim }
    \skip_horizontal:n { -#1 }
    \rule [ \l__nju_ruledpiii_dim ] {#1} { \l__nju_rulehtii_dim }
    \skip_horizontal:n { -#1 }
  }
\cs_new:Npn \__nju_get_width:Nn #1#2
  {
    \hbox_set:Nn \l__nju_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__nju_tmpa_box }
  }
\cs_generate_variant:Nn \__nju_get_width:Nn { NV }
\cs_generate_variant:Nn \__nju_get_width:Nn { Nv }
\cs_new:Npn \__nju_get_max_width:NN #1#2
  {
    \clist_map_inline:Nn #2
      {
        \__nju_get_width:Nv \l__nju_tmpa_dim { g__nju_info_ ##1 _tl }
        \dim_gset:Nn #1 { \dim_max:nn {#1} { \l__nju_tmpa_dim } }
      }
  }
\cs_new_protected:Npn \__nju_get_width_print:Nn #1#2
  {
    \__nju_get_width:Nn #1 {#2}
    \dim_set:Nn #1 { \textwidth - #1 } #2
  }
\cs_generate_variant:Nn \__nju_get_width_print:Nn { Nv }
\cs_generate_variant:Nn \__nju_get_width_print:Nn { Ne }
\cs_new_protected:Npn \__nju_uline_entry:Nn #1#2
  {
    \__nju_get_width_print:Nv #1 { l__nju_name_ #2 _tl }
    \__nju_box_ulined_info:Nn #1 {#2}
  }
\cs_new_protected:Npn \__nju_uline_bientry:Nn #1#2
  {
    \__nju_get_width_print:Nv #1 { l__nju_name_ #2 _tl }
    \dim_sub:Nn #1 { \textwidth / 2 }
    \__nju_box_ulined_info:Nn #1 {#2}
  }
\cs_new:Npn \__nju_date:www    #1-#2-#3 \q_stop
  { \__zhnum_date_aux:nnn {#1} {#2} {#3} }
\cs_new:Npn \__nju_date_en:www #1-#2-#3 \q_stop
  { \clist_item:Nn \c__nju_name_month_en_clist {#2} ~#3 , ~#1  }
\cs_new:Npn \__nju_date:nnn #1#2#3
  {
    \tl_gset:cx { g__nju_info_ #2 date #1 _tl }
      {
        \tl_if_empty:nTF {#3}
          { \__nju_name:n { blankdate #1 } }
          { \use:c { __nju_date #1 :www } #3 \q_stop }
      }
  }
\cs_new:Npn \__nju_date:nn #1#2
  { \__nju_date:nnn { } {#1} {#2} \__nju_date:nnn { _en } {#1} {#2} }
\cs_new_protected:Npn \__nju_at_begin_document:n #1
  { \hook_gput_next_code:nn { begin document } {#1} }
\cs_new:Npn \__nju_cs_clear:N #1 { \cs_set_eq:NN #1 \scan_stop: }
\cs_new:Npn \__nju_msg:nn { \msg_new:nnn { njuthesis } }
\cs_new:Npn \__nju_loop_until:nnn #1#2#3
  { #2 \bool_if:nF {#1} { #3 \__nju_loop_until:nnn {#1} {#2} {#3} } }

\cs_new_protected:Npn \__nju_underline_par_break:NNn #1#2#3
  {
    \hbox_gset:Nn #2 { }
    \__nju_loop_until:nnn { \box_if_empty_p:N #1 }
      {
        \box_set_to_last:N #1
        \tex_unskip:D \tex_unpenalty:D
      }
      {
        \__nju_box_underline:N #1
        \hbox_gset:Nn #2
          {
            \box_use_drop:N #1
            \tex_penalty:D \c_zero_int
            \hbox_unpack_drop:N #2
          }
        #3
      }
  }
\cs_new_protected:Npn \__nju_underline_par_print:Nnn #1#2#3
  {
    \group_begin:
      \tex_noindent:D #2
      \hbox_unpack_drop:N #1 #3
      \tex_par:D
    \group_end:
  }
\cs_new_protected:Npn \__nju_print_ulined_title:
  {
    \vbox_set:Nn \l__nju_tmpa_box
      {
        \skip_set:Nn \tex_leftskip:D { .5 em plus 1 fill }
        \skip_set_eq:NN \tex_rightskip:D \tex_leftskip:D
        \g__nju_info_title_tl \tex_par:D
        \__nju_underline_par_break:NNn \l__nju_tmpb_box \g__nju_tmpc_box { }
      }
    \__nju_underline_par_print:Nnn \g__nju_tmpc_box { } { }
  }
\cs_new_protected:Npn \__nju_cover_entry_title:NNNN #1#2#3#4
  {
    \tl_if_empty:NT \g__nju_info_title_tl
      { \msg_error:nn { njuthesis } { missing-title } }
    \__nju_box_spread_name:NNn #2 #4 { title }
    \mode_leave_vertical: #1
    \__nju_box_paragraph:nn {#3}
      { \l__nju_fmt_covertitle_tl \__nju_print_ulined_title: }
  }
\cs_new:Npn \__nju_cover_entry_title:NNN { \__nju_cover_entry_title:NNNN \__nju_hskip: }
\cs_new_protected:Npn \__nju_cover_entry:NNNNn #1#2#3#4#5
  {
    \__nju_box_spread_name:NNn #2 #4 {#5} #1
    \__nju_box_ulined_info:Nn  #3    {#5} \tex_par:D
  }
\cs_new:Npn \__nju_cover_entry:NNNn { \__nju_cover_entry:NNNNn \__nju_hskip: }
\cs_new_protected:Npn \__nju_cover_entry:NNNNnn #1#2#3#4#5#6
  {
    \__nju_box_spread_name:NNn #1 #4 {#5} \__nju_hskip:
    \__nju_box_ulined_info:Nn  #3    {#5} \__nju_hskip:
    \__nju_box_spread_name:NNn #2 #4 {#6} \__nju_hskip:
    \__nju_box_ulined_info:Nn  #3    {#6} \tex_par:D
  }
\cs_new_protected:Npn \__nju_cover_entry_supv:NNNNn #1#2#3#4#5
  {
    \tl_set:Nn \l__nju_tmpa_tl
      { \clist_item:cn { g__nju_info_ #5 _clist } { 1 } }
    \tl_set:Nn \l__nju_tmpb_tl
      { \clist_item:cn { g__nju_info_ #5 _clist } { 2 } }
    \__nju_box_spread_name:NNn #1 #4 {#5}        \__nju_hskip:
    \__nju_box_ulined:NN #3 \l__nju_tmpa_tl        \__nju_hskip:
    \__nju_box_spread_name:NNn #2 #4 { supvtitle } \__nju_hskip:
    \__nju_box_ulined:NN #3 \l__nju_tmpb_tl        \tex_par:D
  }
\cs_new_protected:Npn \__nju_abs_bookmark:nn #1#2
  {
    \phantomsection
    \__nju_bookmark:Nnn \g__nju_abs_showentry_bool {#1} {#2}
    \__nju_chapter_header:n {#1}
  }
\cs_generate_variant:Nn \__nju_abs_bookmark:nn { Vn }
\cs_new_protected:Npn \__nju_abs_headline:N #1
  {
    \__nju_get_width:NV \l__nju_tmpa_dim   #1
    \__nju_uuline:n   { \l__nju_tmpa_dim } #1
  }
\cs_new_protected:Npn \__nju_print_labeled_title:NNn #1#2#3
  {
    \vbox_set:Nn \l__nju_tmpa_box
      {
        \__nju_get_width:Nn \tex_hangindent:D {#3}
        \int_set:Nn \tex_hangafter:D { -1 }
        \skip_set_eq:NN \tex_leftskip:D #2
        \skip_set_eq:NN \tex_rightskip:D \tex_leftskip:D
        \tex_noindent:D #1 \tex_par:D
        \int_gzero:N \g__nju_uline_count_int
        \__nju_underline_par_break:NNn \l__nju_tmpb_box \g__nju_tmpc_box
          { \int_gincr:N \g__nju_uline_count_int }
      }
    \__nju_underline_par_print:Nnn \g__nju_tmpc_box {#3}
      {
        \bool_if:NT \g__nju_abs_title_strict_bool
          {
            \int_case:nnF { \g__nju_uline_count_int }
              {
                { 0 } { \msg_error:nn { njuthesis } { missing-title } }
                { 1 } { \__nju_uline:n { \textwidth }                  }
                { 2 } {                                               }
              }
              { \msg_warning:nn { njuthesis } { abs-title-too-long } }
            \tex_par:D
          }
      }
  }
\cs_generate_variant:Nn \__nju_print_labeled_title:NNn { NNe }
\DeclareObjectType { nju } { \c_zero_int }
\DeclareTemplateInterface { nju } { element } { \c_zero_int }
  {
    content     : tokenlist = \c_empty_tl,
    format      : tokenlist = \c_empty_tl,
    bottom-skip : skip      = \c_zero_skip,
    align       : choice { l, r, c, n } = c
  }
\DeclareTemplateCode { nju } { element } { \c_zero_int }
  {
    content     = \l__njuelem_content_tl,
    format      = \l__njuelem_format_tl,
    bottom-skip = \l__njuelem_bottom_skip,
    align =
      {
        l = { \cs_set_eq:NN \__njuelem_align: \raggedright },
        r = { \cs_set_eq:NN \__njuelem_align: \raggedleft  },
        c = { \cs_set_eq:NN \__njuelem_align: \centering   },
        n = { \cs_set:Nn    \__njuelem_align: { }          }
      }
  }
  {
    \AssignTemplateKeys
    \group_begin:
      \__njuelem_align:
      \l__njuelem_format_tl \l__njuelem_content_tl \tex_par:D
    \group_end:
    \__nju_vskip:N \l__njuelem_bottom_skip
  }
\exp_args_generate:n { NVV }
\DeclareTemplateInterface { nju } { page } { \c_zero_int }
  {
    element     : commalist = \c_empty_clist,
    prefix      : tokenlist = \c_empty_tl,
    format      : tokenlist = \c_empty_tl,
    top-skip    : skip      = \c_zero_skip,
    bottom-skip : skip      = \c_zero_skip,
    bm-text     : tokenlist = \c_empty_tl,
    bm-name     : tokenlist = \c_empty_tl,
    bookmark    : choice { toc, pdf, none } = none
  }
\DeclareTemplateCode { nju } { page } { \c_zero_int }
  {
    element     = \l__njupage_element_clist,
    prefix      = \l__njupage_prefix_tl,
    format      = \l__njupage_format_tl,
    top-skip    = \l__njupage_top_skip,
    bottom-skip = \l__njupage_bottom_skip,
    bm-text     = \l__njupage_bm_text_tl,
    bm-name     = \l__njupage_bm_name_tl,
    bookmark    =
      {
        toc  = { \cs_set_eq:NN \__njupage_bookmark:nn \__nju_bookmark_toc:nn },
        pdf  = { \cs_set_eq:NN \__njupage_bookmark:nn \__nju_bookmark_pdf:nn },
        none = { \cs_set:Nn    \__njupage_bookmark:nn { } }
      }
  }
  {
    \AssignTemplateKeys
    \clearpage
    \thispagestyle { empty }
    \__nju_vskip:N \l__njupage_top_skip
    \exp_args:NVV \__njupage_bookmark:nn
      \l__njupage_bm_text_tl \l__njupage_bm_name_tl
    \group_begin:
      \l__njupage_format_tl
      \clist_map_inline:Nn \l__njupage_element_clist
        { \UseInstance { nju } { \l__njupage_prefix_tl ##1 } }
    \group_end:
    \__nju_vskip:N \l__njupage_bottom_skip
  }
\cs_new:Npn \__nju_declare_element:nn #1#2
  { \DeclareInstance { nju } {#1} { element } {#2} }
\cs_new:Npn \__nju_declare_page:nn    #1#2
  { \DeclareInstance { nju } {#1} { page    } {#2} }
\__nju_msg:nn { abs-title-too-long }
  {
    Your~ title~ seems~ too~ long~ to~ fit~ in~ two~ lines.\\
    I~ have~ drawn~ additional~ lines~ to~ contain~ it,~
    which~ will~ probably~ make~ your~ abstract~ page~
    look~ slightly~ different~ from~ the~ standard.~
    You~ can~ use~ the~ "abstract/title-style"~ key~
    to~ disable~ this~ message.
  }
\__nju_msg:nn { empty-theorem-type }
  {
    Empty~ theorem~ list~ to~ define.\\
    The~ key~ "theorem/type"~ should~ not~ be~ left~ empty.
  }
\__nju_msg:nn { load-config }
  { I~ am~ loading~ config~ file~ "#1". }
\__nju_msg:nn { missing-ntheorem }
  {
    "ntheorem"~ package~ not~ detected.\\
    The~ functionality~ of~ built-in~ theorem~ settings~
    requires~ loading~ the~ class~ with~ "ntheorem"~ option~
    set~ to~ "true".
  }
\__nju_msg:nn { missing-stzhongs }
  {
    "STZHONGS.TTF"~ is~ not~ found~ in~ your~ system.\\
    The~ font~ is~ normally~ distributed~ with~ MS~ Windows.~
    I~ have~ used~ songti~ for~ substitution.
  }
\__nju_msg:nn { missing-symbol }
  {
    \string\mdwhtsquare\ and~ \string\checkmark\ are~ not~
    contained~ in~ the~ standard~ amsmath~ package.~ You~
    should~ redefine~ them~ with~ other~ packages~ loaded~
    to~ properly~ generate~ the~ declaration~ page.
  }
\__nju_msg:nn { missing-title }
  {
    Thesis~ title~ should~ not~ be~ left~ blank.\\
    Please~ check~ whether~ you~ have~ fill~ in~
    both Chinese~ and~ English~ titles.
  }
\__nju_msg:nn { no-small-caps }
  {
    I~ am~ using~ TeX~ Gyre~ Termes~ as~ default~ Roman~ font.\\
    This~ is~ because~ the~ "Times~ New~ Roman"~ font~ in~ your~
    system~ does~ not~ embed~ glyphs~ for~ small~ capitals.~
    You~ can~ ignore~ this~ warning~ if~ you~ do~ not~ need~
    \string\textsc.~ For~ more~ information,~
    please~ refer~ to~ section~ 3.2.6~ of~ the~ documentation.
  }
\__nju_msg:nn { package-too-old }
  {
    Package~ "#1"~ is~ too~ old.\\
    The~ "njuthesis"~ class only~ supports~ "#1"~ with~
    a~ version~ higher~ than~ v#2.~
    Please~ update~ an~ up-to-date~ version~ of~ it~
    using~ your~ TeX~ package~ manager~ or~ from~ CTAN.
  }
\__nju_msg:nn { package-conflict }
  {
    The~ "#2"~ package~ is~ incompatible~ with~ "#1".\\
    I~ have~ loaded~ "#1"~ by~ default.~ Maybe~ You~ should~
    refer~ to~ section~ 4~ of~ the~ documentation.
  }
%% \changes{v1.5.1}{2026/05/30}{在 \tn{njusetup} 中禁用文档类选项。}
\cs_new_protected:Npn \__nju_pass_option_to_ctexbook:n #1
  { \PassOptionsToClass {#1} { ctexbook } }
\cs_generate_variant:Nn \__nju_pass_option_to_ctexbook:n { V }
\cs_new_protected:Npn \__nju_pass_option_to_ctexbook:
  { \__nju_pass_option_to_ctexbook:V \l_keys_key_str }
%% \changes{v1.5.0}{2026/05/12}{文档类选项的名空间重命名为 \opt{nju/option}。}
\keys_define:nn { nju / option }
  {
    type               .choices:nn = { bachelor, master, doctor, postdoc }
      { \int_gset_eq:NN \g__nju_info_type_int \l_keys_choice_int },
    type               .initial:n  = bachelor,
    type                 .usage:n  = load,
    degree              .choice:,
    degree / academic     .code:n  =
      { \bool_gset_true:N  \g__nju_opt_academic_bool },
    degree / professional .code:n  =
      { \bool_gset_false:N \g__nju_opt_academic_bool },
    degree             .initial:n  = academic,
    degree               .usage:n  = load,
    nl-cover         .bool_gset:N  = \g__nju_opt_nlcover_bool,
    nl-cover           .initial:n  = false,
    nl-cover             .usage:n  = load,
    decl-page        .bool_gset:N  = \g__nju_opt_decl_bool,
    decl-page          .initial:n  = false,
    decl-page            .usage:n  = load,
    draft      .value_forbidden:n  = true,
    draft                 .code:n  =
      {
        \bool_gset_true:N \g__nju_opt_draft_bool
        \__nju_pass_option_to_ctexbook:
      },
    draft                 .usage:n  = load,
    oneside    .value_forbidden:n  = true,
    twoside    .value_forbidden:n  = true,
    oneside               .code:n  = { \__nju_pass_option_to_ctexbook: },
    twoside               .code:n  = { \__nju_pass_option_to_ctexbook: },
    oneside              .usage:n  = load,
    twoside              .usage:n  = load,
    anonymous  .value_forbidden:n  = true,
    anonymous        .bool_gset:N  = \g__nju_opt_anon_bool,
    anonymous          .initial:n  = false,
    anonymous            .usage:n  = load,
    latin-font         .choices:nn =
      { fandol, gyre, mac, macoffice, win, none }
      { \tl_gset:Nn \g__nju_font_latin_tl {#1} },
    latin-font           .usage:n  = load,
    cjk-font           .choices:nn =
      { fandol, founder, mac, macoffice, noto, source, win, none }
      { \tl_gset:Nn \g__nju_font_cjk_tl   {#1} },
    cjk-font             .usage:n  = load,
    fontset            .choices:nn =
      { fandol, mac, macoffice, win, none }
      { \keys_set:nn { nju / option } { latin-font = #1, cjk-font = #1 } },
    fontset              .usage:n  = load,
    math-font          .choices:nn =
      {
        asana, cambria, fira, garamond, lm, libertinus, newcm,
        stix, bonum, dejavu, pagella, schola, termes, xits, none
      }
      { \tl_gset:Nn \g__nju_font_math_tl {#1} },
    math-font          .initial:n  = xits,
    math-font            .usage:n  = load,
    font-path             .code:n  =
      {
        \bool_gset_true:N \g__nju_font_path_bool
        \tl_gset_eq:NN \g__nju_font_path_tl \l_keys_value_tl
      },
    font-path            .usage:n  = load,
    config          .clist_gset:N  = \g__nju_config_clist,
    config               .usage:n  = load
  }
\__nju_pass_option_to_ctexbook:n { zihao = -4 }
\__nju_pass_option_to_ctexbook:n { linespread = 1.625 }
\clist_new:N \g__nju_name_optional_pkg_clist
\cs_new_protected:Npn \__nju_define_pkg_keys:nnn #1#2#3
  {
    \keys_define:nn { nju / option }
      {
        #1 .bool_gset:c = { g__nju_opt_load_ #2 _bool },
        #1   .initial:n = #3,
        #1     .usage:n = load
      }
    \cs_new_protected:cpn { __nju_loadpkg_ #2 : }
      {
        \bool_if:cT { g__nju_opt_load_ #2 _bool }
          { \RequirePackage {#1} }
      }
    \clist_gput_right:Nn \g__nju_name_optional_pkg_clist {#1}
  }
\clist_map_inline:nn
  {
    { biblatex       } { blx   } { true  },
    { cleveref       } { cref  } { true  },
    { ntheorem       } { nthm  } { true  },
    { enumitem       } { enit  } { true  },
    { footmisc       } { fm    } { true  },
    { unicode-math   } { um    } { true  }
  }
  { \__nju_define_pkg_keys:nnn #1 }
\keys_define:nn { nju / option }
  {
    minimal .value_forbidden:n = true,
    minimal            .code:n =
      {
        \clist_map_inline:Nn \g__nju_name_optional_pkg_clist
          { \keys_set:nn { nju / option } { ##1 = false } }
        \keys_set:nn { nju / option } { math-font = none }
      }
  }
\ProcessKeysOptions { nju / option }
\bool_if:NT \g__nju_opt_anon_bool
  { \keys_set:nn { nju / option } { decl-page = false } }
\cs_new_protected:Npn \__nju_disable_load_options:
  {
    \prop_get:NnN \l_keys_usage_load_prop { nju / option } \l__nju_tmp_clist
    \clist_map_inline:Nn \l__nju_tmp_clist
      { \keys_define:nn { nju } { ##1 .undefine: } }
  }
\__nju_disable_load_options:
\cs_if_exist:NTF \keys_set_exclude_groups:nnn
  {
    \cs_new_eq:NN \__nju_keys_set_exclude_groups:nnn
      \keys_set_exclude_groups:nnn
  }
  {
    \cs_new_protected:Npn \__nju_keys_set_exclude_groups:nnn #1#2#3
      { \use:c { keys_set_filter:nnn } {#1} {#2} {#3} }
  }
\cs_generate_variant:Nn \__nju_keys_set_exclude_groups:nnn { nVn }
\bool_if:NT \g__nju_opt_anon_bool
  { \clist_gput_right:Nn \g__nju_keys_excl_clist { anonymous } }
\bool_if:NF \g__nju_opt_load_um_bool
  { \clist_gput_right:Nn \g__nju_keys_excl_clist { unicode-math } }
\clist_if_empty:NTF \g__nju_keys_excl_clist
  { \cs_new_eq:NN \__nju_keys_set:nn \keys_set:nn }
  {
    \cs_new_protected:Npn \__nju_keys_set:nn #1#2
      { \__nju_keys_set_exclude_groups:nVn {#1} \g__nju_keys_excl_clist {#2} }
  }
\clist_map_inline:nn
  {
    abstract, anonymous-mode, bib, image, footer, footnote,
    header, info, label-sep, listoffigures, listoftables,
    math, style, theorem, tableofcontents
  }
  {
    \keys_define:nn { nju }
      { #1 .code:n = { \__nju_keys_set:nn { nju / #1 } {##1} } }
  }
\NewDocumentCommand \njusetup { o m }
  {
    \tl_if_novalue:nTF {#1}
      { \__nju_keys_set:nn { nju } {#2} }
      { \__nju_keys_set:nn { nju } { #1 = {#2} } }
  }
\@onlypreamble \njusetup
\NewDocumentCommand \njusetformat { m m }
  { \tl_set:cn { l__nju_fmt_ #1 _tl } {#2} }
\NewDocumentCommand \njusetlength { s m m }
  {
    \bool_if:nTF {#1}
      { \skip_set:cn { l__nju_ #2 _skip } {#3} }
      { \dim_set:cn  { l__nju_ #2 _dim  } {#3} }
  }
\NewDocumentCommand \njusetname { s m O{} m }
  { \__nju_set_tokenlist:nnnnn {#1} {#2} {#3} {#4} { name } }
\NewDocumentCommand \njusettext { s m O{} m }
  { \__nju_set_tokenlist:nnnnn {#1} {#2} {#3} {#4} { text } }
\cs_new_protected:Npn \__nju_set_tokenlist:nnnnn #1#2#3#4#5
  {
    \bool_if:nTF {#1}
      { \tl_set_eq:NN \l__nju_tmpb_tl \l__nju_name_suffix_en_tl }
      { \tl_clear:N   \l__nju_tmpb_tl }
    \tl_gset:cn { l__nju_ #5 _ #2 #3 \l__nju_tmpb_tl _tl } {#4}
  }
\__nju_pass_option_to_ctexbook:n
  {
    a4paper,
    UTF8,
    scheme = chinese,
    fontset    = none
  }
\clist_map_inline:nn
  {
    { no-math } { fontspec },
    { perpage } { footmisc },
    { capitalise, nameinlink, noabbrev } { cleveref },
    { amsmath, thmmarks, noconfig      } { ntheorem }
  }
  { \PassOptionsToPackage #1 }
\LoadClass { ctexbook } [ 2018/04/01 ]
\__nju_loadpkg_enit:
\__nju_loadpkg_fm:
\bool_if:NTF \g__nju_opt_load_um_bool
  { \RequirePackage { unicode-math } }
  {
    \RequirePackage { amsmath }
    \bool_if:NT \g__nju_opt_decl_bool
      {
        \msg_warning:nn { njuthesis } { missing-symbol }
        \cs_new:Npn \mdwhtsquare { }
        \cs_new:Npn \checkmark { }
      }
  }
\RequirePackage
  {
    geometry,
    fancyhdr,
    setspace,
    booktabs,
    caption,
    graphicx,
  }
\__nju_loadpkg_nthm:
\RequirePackage { hyperref }
\__nju_loadpkg_cref:
\legacy_if:nT { @twoside } { \RequirePackage { emptypage } }
\sys_if_engine_xetex:T
  {
    \RequirePackage { xeCJKfntef }
    \cs_new_eq:NN \njuline \CJKunderline
  }
\sys_if_engine_luatex:T
  {
    \RequirePackage { lua-ul }
    \NewDocumentCommand \njuline { m } { \underLine {#1} \__nju_null: }
  }
\cs_new:Npn \__nju_check_pkg_version:nnn #1#2#3
  {
    \@ifpackagelater {#1} {#2}
      { } { \msg_error:nnnn { njuthesis } { package-too-old } {#1} {#3} }
  }
\sys_if_engine_luatex:T
  { \__nju_check_pkg_version:nnn { luatexja } { 2021/10/24 } { 20211024.0 } }
\cs_new:Npn \__nju_check_pkg_conflict:nn #1#2
  {
    \ctex_at_begin_package:nn {#2}
      { \msg_warning:nnnn { njuthesis } { package-conflict } {#1} {#2} }
  }
\bool_if:NT \g__nju_opt_load_um_bool
  {
    \clist_map_inline:nn
      {
        amscd, amsfonts, amssymb, bbm, bm, eucal,
        eufrak, mathrsfs, newtxmath, upgreek
      }
      { \__nju_check_pkg_conflict:nn { unicode-math } {#1} }
  }
\bool_if:NT \g__nju_opt_load_cref_bool
  {
    \@ifl@t@r \fmtversion { 2024/11/01 }
      {
        \ctex_at_end_package:nn { cleveref }
          {
            \__ctex_cleveref_hook_aux:N \refstepcounter@noarg
            \hook_gput_code:nnn { begindocument/end } { ctex }
                {
                  \cs_if_exist:NT \firstaid@cref@updatelabeldata
                    { \__ctex_cleveref_hook_aux:N \firstaid@cref@updatelabeldata }
                }
          }
      } { }
  }
\hook_new:n { . / cover / begin }
\hook_new:n { . / cover / body  }
\hook_new:n { . / cover / end   }
\hook_new:n { . / cover / back  }
\hook_gset_rule:nnnn { . / cover / body } { main } < { decl-i }
\exp_args:Ne \file_input:n
  {
    njuthesis-
    \int_case:nn { \g__nju_info_type_int }
      {
        { 1 } { undergraduate }
        { 2 } { graduate      }
        { 3 } { graduate      }
        { 4 } { postdoctoral  }
      }
    .def
  }
\clist_map_inline:Nn \g__nju_config_clist
  {
    \msg_info:nnn { njuthesis } { load-config } {#1}
    \file_input:n {#1}
  }
\keys_define:nn { nju / info }
  {
    title              .tl_gset:N = \g__nju_info_title_tl             ,
    title              .initial:n = { 空 }                            ,
    title*             .tl_gset:N = \g__nju_info_title_en_tl          ,
    title*             .initial:n = { Empty }                         ,
    keywords        .clist_gset:N = \g__nju_info_keywords_clist       ,
    keywords*       .clist_gset:N = \g__nju_info_keywords_en_clist    ,
    grade              .tl_gset:N = \g__nju_info_grade_tl             ,
    student-id         .tl_gset:N = \g__nju_info_id_tl                ,
    author             .tl_gset:N = \g__nju_info_author_tl            ,
    author*            .tl_gset:N = \g__nju_info_author_en_tl         ,
    department         .tl_gset:N = \g__nju_info_dept_tl              ,
    department*        .tl_gset:N = \g__nju_info_dept_en_tl           ,
    major*             .tl_gset:N = \g__nju_info_major_en_tl          ,
    field              .tl_gset:N = \g__nju_info_field_tl             ,
    field*             .tl_gset:N = \g__nju_info_field_en_tl          ,
    major                 .code:n =
      {
        \bool_if:NTF \g__nju_opt_academic_bool
          {
            \clist_pop:NN  \l_keys_value_tl \l__nju_tmpa_tl
            \tl_gset_eq:NN \g__nju_info_major_tl \l__nju_tmpa_tl
          }
          {
            \clist_pop:NN  \l_keys_value_tl \l__nju_tmpa_tl
            \tl_gset_eq:NN \g__nju_info_majorc_tl \l__nju_tmpa_tl
            \clist_pop:NNTF \l_keys_value_tl \l__nju_tmpa_tl
              { \tl_gset_eq:NN \g__nju_info_major_tl \l__nju_tmpa_tl }
              { \tl_gset_eq:NN \g__nju_info_major_tl \g__nju_info_majorc_tl }
          }
      },
    supervisor      .clist_gset:N = \g__nju_info_supv_clist           ,
    supervisor*        .tl_gset:N = \g__nju_info_supv_en_tl           ,
    supervisor-ii   .clist_gset:N = \g__nju_info_supvii_clist         ,
    supervisor-ii*     .tl_gset:N = \g__nju_info_supvii_en_tl         ,
    chairman           .tl_gset:N = \g__nju_info_chairman_tl          ,
    reviewer        .clist_gset:N = \g__nju_info_reviewer_clist       ,
    clc                .tl_gset:N = \g__nju_info_clc_tl               ,
    udc                .tl_gset:N = \g__nju_info_udc_tl               ,
    secret-level       .tl_gset:N = \g__nju_info_secretlv_tl          ,
    supervisor-contact .tl_gset:N = \g__nju_info_supvcont_tl          ,
    school-code        .tl_gset:N = \g__nju_info_code_tl              ,
    school-code        .initial:n = { 10284 }                       ,
    degree             .tl_gset:N = \g__nju_info_degree_tl            ,
    degree*            .tl_gset:N = \g__nju_info_degree_en_tl         ,
  }
\clist_map_inline:nn { submit, defend, confer, bottom }
  {
    \tl_new:c { g__nju_info_ #1 date    _tl }
    \tl_new:c { g__nju_info_ #1 date _en_tl }
    \keys_define:nn { nju / info }
      {
        #1-date    .code:n = \__nju_date:nn {#1} {##1},
        #1-date .initial:V = \c__nju_name_today_tl
      }
  }
\clist_map_inline:Nn \c__nju_name_anon_clist
  { \keys_define:nn { nju / info } { #1   .groups:n = { anonymous } } }
\clist_map_inline:Nn \c__nju_name_anon_en_clist
  { \keys_define:nn { nju / info } { #1 * .groups:n = { anonymous } } }
\__nju_at_begin_document:n
  {
    \tl_gset:Ne \g__nju_info_supvfull_tl
      { \clist_use:Nn \g__nju_info_supv_clist { \__nju_quad: } }
    \clist_if_empty:NF \g__nju_info_supvii_clist
      {
        \bool_gset_true:N \g__nju_opt_supvii_bool
        \tl_gput_right:Ne \g__nju_info_supvfull_tl
          { \__nju_quad: \clist_use:Nn \g__nju_info_supvii_clist { \__nju_quad: } }
      }
    \tl_gset_eq:NN \g__nju_info_supvfull_en_tl \g__nju_info_supv_en_tl
    \tl_if_empty:NF \g__nju_info_supvii_en_tl
      {
        \tl_gput_right:Ne \g__nju_info_supvfull_en_tl
          { \__nju_quad: \g__nju_info_supvii_en_tl }
      }
  }
\tl_const:Nn \c__nju_path_macoffice_tl
  { /Applications/Microsoft~ Word.app/Contents/Resources/DFonts/ }
\sys_if_platform_windows:TF
  { \tl_gset:Nn \g__nju_font_set_tl { win } }
  {
    \ctex_if_platform_macos:TF
      {
        \file_if_exist:nTF { \c__nju_path_macoffice_tl times.ttf }
          { \tl_gset:Nn \g__nju_font_set_tl { macoffice } }
          { \tl_gset:Nn \g__nju_font_set_tl { mac       } }
      }
      { \tl_gset:Nn \g__nju_font_set_tl { fandol } }
  }
\tl_if_empty:NT \g__nju_font_latin_tl
  { \tl_gset_eq:NN \g__nju_font_latin_tl \g__nju_font_set_tl }
\tl_if_empty:NT \g__nju_font_cjk_tl
  { \tl_gset_eq:NN \g__nju_font_cjk_tl   \g__nju_font_set_tl }
\cs_new:Npn \__nju_loadfont_latin:n #1
  {
    \__fontspec_main_setmainfont:nn { } { Times~New~Roman }
    \__fontspec_main_setsansfont:nn { } { Arial           }
    \__fontspec_main_setmonofont:nn { Scale = MatchLowercase } {#1}
  }
\cs_new_protected:Npn \__nju_loadfont_latin_win:
  { \__nju_loadfont_latin:n { Courier~New } }
\cs_new_protected:Npn \__nju_loadfont_latin_mac:
  {
    \__nju_loadfont_latin:n { Menlo }
    \fontspec_if_small_caps:F
      {
        \msg_warning:nn { njuthesis } { no-small-caps }
        \__fontspec_main_setmainfont:nn
          { \c__nju_name_gyrefeature_clist } { texgyretermes }
      }
  }
\cs_new_protected:Npn \__nju_loadfont_latin_macoffice:
  {
    \__fontspec_main_setmainfont:nn
      { \c__nju_name_macofficefeature_clist } { times }
    \__fontspec_main_setsansfont:nn
      { \c__nju_name_macofficefeature_clist } { arial }
    \__fontspec_main_setmonofont:nn
      { Scale     = MatchLowercase } { Menlo }
  }
\clist_const:Nn \c__nju_name_macofficefeature_clist
  {
    Path           = \c__nju_path_macoffice_tl,
    Extension      = .ttf,
    UprightFont    = *,
    BoldFont       = *bd,
    ItalicFont     = *i,
    BoldItalicFont = *bi
  }
\cs_new_protected:Npn \__nju_loadfont_latin_gyre:
  {
    \__fontspec_main_setmainfont:nn
      { \c__nju_name_gyrefeature_clist } { texgyretermes }
    \__fontspec_main_setsansfont:nn
      { \c__nju_name_gyrefeature_clist } { texgyreheros  }
    \__fontspec_main_setmonofont:nn
      {
        \c__nju_name_gyrefeature_clist,
        Scale     = MatchLowercase,
        Ligatures = CommonOff
      }
      { texgyrecursor }
  }
\cs_new_eq:NN \__nju_loadfont_latin_fandol:  \__nju_loadfont_latin_gyre:
\clist_const:Nn \c__nju_name_gyrefeature_clist
  {
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic
  }
\cs_new:Npn \__nju_hide_no_script_msg:
  { \msg_redirect_name:nnn { fontspec } { no-script } { info } }
\cs_new:Npn \__nju_loadfont_cjk_win:N #1
  {
    \setCJKmainfont { SimSun   } [ #1, ItalicFont = KaiTi ]
    \setCJKsansfont { SimHei   } [#1]
    \setCJKmonofont { FangSong } [#1]
    \setCJKfamilyfont { zhsong } { SimSun   } [#1]
    \setCJKfamilyfont { zhhei  } { SimHei   } [#1]
    \setCJKfamilyfont { zhfs   } { FangSong } [#1]
    \setCJKfamilyfont { zhkai  } { KaiTi    } [#1]
    \__nju_define_stzhongs:nn { STZhongsong } {#1}
  }
\cs_new:Npn \__nju_loadfont_cjk_win:
  { \__nju_loadfont_cjk_win:N \c__nju_name_fakebold_tl }
\cs_new_protected:Npn \__nju_loadfont_cjk_mac:
  {
    \__nju_hide_no_script_msg:
    \setCJKmainfont { Songti~SC~Light }
      [
        BoldFont       = Songti~SC~Bold,
        ItalicFont     = Kaiti~SC,
        BoldItalicFont = Kaiti~SC~Bold
      ]
    \setCJKsansfont { Heiti~SC~Light  } [ BoldFont = Heiti~SC~Medium ]
    \setCJKmonofont { STFangsong      }
    \setCJKfamilyfont { zhsong } { Songti~SC~Light } [ BoldFont = Songti~SC~Bold ]
    \setCJKfamilyfont { zhhei  } { Heiti~SC~Light  } [ BoldFont = Heiti~SC~Medium ]
    \setCJKfamilyfont { zhfs   } { STFangsong      }
    \setCJKfamilyfont { zhkai  } { Kaiti~SC        } [ BoldFont = Kaiti~SC~Bold ]
  }
\cs_new:Npn \__nju_loadfont_cjk_macoffice:n #1
  {
    \setCJKmainfont { Simsun.ttc   } [ ItalicFont = Kaiti.ttf, #1 ]
    \setCJKsansfont { SimHei.ttf   } [#1]
    \setCJKmonofont { Fangsong.ttf } [#1]
    \setCJKfamilyfont { zhsong } { Simsun.ttc   } [#1]
    \setCJKfamilyfont { zhhei  } { SimHei.ttf   } [#1]
    \setCJKfamilyfont { zhfs   } { Fangsong.ttf } [#1]
    \setCJKfamilyfont { zhkai  } { Kaiti.ttf    } [#1]
    \__nju_define_stzhongs:nn { STZHONGS.ttf } {#1}
  }
\cs_new:Npn \__nju_loadfont_cjk_macoffice:
  {
    \__nju_loadfont_cjk_macoffice:n
      { Path = \c__nju_path_macoffice_tl, \c__nju_name_fakebold_tl }
  }
\cs_new_protected:Npn \__nju_loadfont_cjk_fandol:
  {
    \__nju_hide_no_script_msg:
    \setCJKmainfont { FandolSong-Regular }
      [
        Extension  = .otf,
        BoldFont   = FandolSong-Bold,
        ItalicFont = FandolKai-Regular
      ]
    \setCJKsansfont { FandolHei-Regular  }
      [
        Extension = .otf,
        BoldFont  = FandolHei-Bold
      ]
    \setCJKmonofont { FandolFang-Regular }
      [ Extension = .otf ]
    \setCJKfamilyfont { zhsong } { FandolSong-Regular }
      [
        Extension = .otf,
        BoldFont  = FandolSong-Bold
      ]
    \setCJKfamilyfont { zhhei  } { FandolHei-Regular  }
      [
        Extension = .otf,
        BoldFont  = FandolHei-Bold
      ]
    \setCJKfamilyfont { zhfs   } { FandolFang-Regular }
      [ Extension = .otf ]
    \setCJKfamilyfont { zhkai  } { FandolKai-Regular  }
      [ Extension = .otf, \c__nju_name_fakebold_tl ]
  }
\cs_new_protected:Npn \__nju_loadfont_cjk_founder:
  {
    \sys_if_engine_xetex:T
      { \xeCJKEditPunctStyle { quanjiao } { optimize-kerning = true } }
    \sys_if_engine_luatex:T
      { \defaultCJKfontfeatures { JFM = { zh_CN / { quanjiao, fzpr } } } }
    \setCJKmainfont { FZShuSong-Z01  }
      [ BoldFont = FZXiaoBiaoSong-B05, ItalicFont = FZKai-Z03 ]
    \setCJKsansfont { FZXiHeiI-Z08   } [ BoldFont = FZHei-B01 ]
    \setCJKmonofont { FZFangSong-Z02 }
    \setCJKfamilyfont { zhsong } { FZShuSong-Z01  }
      [ BoldFont = FZXiaoBiaoSong-B05 ]
    \setCJKfamilyfont { zhhei  } { FZHei-B01      }
      [ \c__nju_name_fakebold_tl ]
    \setCJKfamilyfont { zhkai  } { FZKai-Z03      }
      [ \c__nju_name_fakebold_tl ]
    \setCJKfamilyfont { zhfs   } { FZFangSong-Z02 }
    \defaultCJKfontfeatures { }
  }
\cs_new_protected:Npn \__nju_loadfont_cjk_noto:
  {
    \setCJKmainfont [ \c__nju_name_notofeature_clist ]
      { NotoSerifCJKsc }
    \setCJKsansfont [ \c__nju_name_notofeature_clist ]
      { NotoSansCJKsc  }
    \setCJKmonofont { Noto~Sans~Mono~CJK~SC }
    \setCJKfamilyfont { zhsong } { Noto~Serif~CJK~SC }
    \setCJKfamilyfont { zhhei  } { Noto~Sans~CJK~SC  }
    \setCJKfamilyfont { zhfs   } { FZFangSong-Z02    }
    \setCJKfamilyfont { zhkai  } { FZKai-Z03         }
      [ \c__nju_name_fakebold_tl ]
  }
\cs_new_protected:Npn \__nju_loadfont_cjk_source:
  {
    \setCJKmainfont [ \c__nju_name_notofeature_clist ]
      { SourceHanSerifSC }
    \setCJKsansfont [ \c__nju_name_notofeature_clist ]
      { SourceHanSansSC  }
    \setCJKmonofont { FZFangSong-Z02 }
    \setCJKfamilyfont { zhsong } { Source~Han~Serif~SC }
    \setCJKfamilyfont { zhhei  } { Source~Han~Sans~SC  }
    \setCJKfamilyfont { zhfs   } { FZFangSong-Z02      }
    \setCJKfamilyfont { zhkai  } { FZKai-Z03           }
      [ \c__nju_name_fakebold_tl ]
  }
\tl_const:Nn \c__nju_name_fakebold_tl { AutoFakeBold = 2.17 }
\clist_const:Nn \c__nju_name_notofeature_clist
  {
    Extension          = .otf,
    UprightFont        = *-Regular,
    BoldFont           = *-Bold,
    ItalicFont         = *-Regular,
    BoldItalicFont     = *-Bold,
    ItalicFeatures     = FakeSlant,
    BoldItalicFeatures = FakeSlant
  }
\tl_new:N     \l__nju_name_stzhongsopts_tl
\tl_set_eq:NN \l__nju_name_stzhongsopts_tl \c__nju_name_fakebold_tl
\cs_new:Npn \__nju_define_stzhongs:nn #1#2
  {
    \tl_set:Nn \l__nju_name_stzhongsfile_tl {#1}
    \tl_set:Nn \l__nju_name_stzhongsopts_tl {#2}
  }
\cs_new:Npn \__nju_loadfont_stzhongs:
  { \__nju_loadfont_stzhongs:V \l__nju_name_stzhongsfile_tl }
\cs_new_protected:Npn \__nju_loadfont_stzhongs:n #1
      {
    \fontspec_font_if_exist:nTF {#1}
      {
        \newCJKfontfamily \__nju_stzhongs: {#1}
          [ \l__nju_name_stzhongsopts_tl ]
      }
      {
        \tl_if_eq:NnTF \g__nju_font_set_tl { macoffice }
          {
            \newCJKfontfamily \__nju_stzhongs: {#1}
              [ Path = \c__nju_path_macoffice_tl, \c__nju_name_fakebold_tl ]
          }
          {
            \bool_if:NTF \g__nju_font_path_bool
              {
            \newCJKfontfamily \__nju_stzhongs: {#1}
              [ Path = \g__nju_font_path_tl, \c__nju_name_fakebold_tl ]
              }
              {
                \cs_set_eq:NN \__nju_stzhongs: \rmfamily
                \msg_warning:nn { njuthesis } { missing-stzhongs }
              }
          }
      }
      }
\cs_generate_variant:Nn \__nju_loadfont_stzhongs:n { V }
\cs_new:Npn \__nju_define_math_font:nn #1#2
  {
    \cs_new:cpn { __nju_loadfont_math_ #1 : }
      { \__um_setmathfont:nn { } {#2} }
  }
\clist_map_inline:nn
  {
    { asana      } { Asana-Math.otf             },
    { fira       } { FiraMath-Regular.otf       },
    { garamond   } { Garamond-Math.otf          },
    { lm         } { latinmodern-math.otf       },
    { libertinus } { LibertinusMath-Regular.otf },
    { stix       } { STIXMath-Regular.otf       },
    { bonum      } { texgyrebonum-math.otf      },
    { dejavu     } { texgyredejavu-math.otf     },
    { pagella    } { texgyrepagella-math.otf    },
    { schola     } { texgyreschola-math.otf     },
    { termes     } { texgyretermes-math.otf     }
  }
  { \__nju_define_math_font:nn #1 }
\cs_new:Npn \__nju_loadfont_math_cambria:
  {
    \bool_if:NTF \g__nju_font_path_bool
      {
        \__um_setmathfont:nn
          { Path = \g__nju_font_path_tl/, FontIndex = 1 }
          { cambria.ttc }
      }
      { \__um_setmathfont:nn { } { Cambria~Math } }
  }
\cs_new:Npn \__nju_loadfont_math_xits:
  {
    \bool_if:NTF \g__nju_opt_math_int_bool
      { \tl_set:Nn  \l__nju_tmpa_tl { 8 } }
      { \tl_clear:N \l__nju_tmpa_tl       }
    \__um_setmathfont:nn
      {
        Extension    = .otf,
        StylisticSet = \l__nju_tmpa_tl,
        BoldFont     = XITSMath-Bold
      }
      { XITSMath-Regular }
    \__um_setmathfont:nn
      {
        Extension    = .otf,
        StylisticSet = 1,
        range        = {cal,bfcal}
      }
      { XITSMath-Regular }
  }
\cs_new:Npn \__nju_loadfont_math_newcm:
  {
    \bool_if:NTF \g__nju_opt_math_int_bool
      { \tl_set:Nn  \l__nju_tmpa_tl { 2 } }
      { \tl_clear:N \l__nju_tmpa_tl       }
    \__um_setmathfont:nn
      {
        Extension      = .otf,
        StylisticSet   = \l__nju_tmpa_tl
      }
      { NewCMMath-Book }
    \__um_setmathfont:nn
      {
        Extension      = .otf,
        StylisticSet   = 1,
        range          = {scr,bfscr}
      }
      { NewCMMath-Book }
    \__fontspec_main_setmathrm:nn
      {
        Extension      = .otf,
        UprightFont    = *-Book,
        BoldFont       = *-Bold,
        ItalicFont     = *-BookItalic,
        BoldItalicFont = *-BoldItalic
      }
      { NewCM10 }
    \__fontspec_main_setmathsf:nn
      {
        Extension      = .otf,
        UprightFont    = *-Book,
        BoldFont       = *-Bold,
        ItalicFont     = *-BookOblique,
        BoldItalicFont = *-BoldOblique
      }
      { NewCMSans10 }
    \__fontspec_main_setmathtt:nn
      {
        Extension      = .otf,
        UprightFont    = *-Book,
        ItalicFont     = *-BookItalic,
        BoldFont       = *-Bold,
        BoldItalicFont = *-BoldOblique
      }
      { NewCMMono10 }
  }
\__nju_cs_clear:N \__nju_loadfont_math_none:
\cs_new_protected:Npn \__nju_loadfont:
  {
    \use:c { __nju_loadfont_latin_ \g__nju_font_latin_tl : }
    \use:c { __nju_loadfont_cjk_   \g__nju_font_cjk_tl   : }
    \NewDocumentCommand \songti   { } { \CJKfamily { zhsong } }
    \NewDocumentCommand \heiti    { } { \CJKfamily { zhhei  } }
    \NewDocumentCommand \fangsong { } { \CJKfamily { zhfs   } }
    \NewDocumentCommand \kaishu   { } { \CJKfamily { zhkai  } }
    \NewDocumentCommand \bigger   { } { \ctex_zihao:n { 4   } }
  }
\__nju_loadfont:
\geometry
  {
    vmargin    = 2.54 cm,
    hmargin    = 3.18 cm,
    headheight = 15 pt
  }
\bool_if:NT \g__nju_opt_draft_bool { \geometry { showframe } }
\keys_define:nn { nju / header }
  {
    content  .clist_gset:N = \g__nju_header_twoside_clist,
    content* .clist_gset:N = \g__nju_header_oneside_clist,
    content     .initial:n =
      { { EL } { \leftmark  }, { OR } { \rightmark } },
    content*    .initial:n =
      { {  L } { \leftmark  }, {  R } { \rightmark } }
  }
\keys_define:nn { nju / footer }
  {
    content  .clist_gset:N = \g__nju_footer_twoside_clist,
    content* .clist_gset:N = \g__nju_footer_oneside_clist,
    content     .initial:n = { { C } { \thepage } },
    content*    .initial:n = { { C } { \thepage } }
  }
\clist_new:N \g__nju_header_clist
\clist_new:N \g__nju_footer_clist
\ctex_at_end_preamble:n
  {
    \tl_set:Ne \l__nju_tmpa_tl
      { \legacy_if:nTF { @twoside } { two } { one } }
    \clist_map_inline:nn { header , footer }
      {
        \clist_gset_eq:cc { g__nju_ #1 _clist }
          { g__nju_ #1 _ \l__nju_tmpa_tl side_clist }
      }
  }
\cs_new_protected:Npn \__nju_header:nn #1#2
  { \fancyhead [#1] { \l__nju_fmt_header_tl \nouppercase {#2} } }
\cs_new_protected:Npn \__nju_footer:nn #1#2
  { \fancyfoot [#1] { \l__nju_fmt_footer_tl \nouppercase {#2} } }
\fancypagestyle { plain }
  {
    \fancyhf { }
    \clist_map_inline:Nn \g__nju_footer_clist { \__nju_footer:nn ##1 }
    \tl_set:Nn \headrulewidth { \c_zero_dim }
    \tl_set:Nn \footrulewidth { \c_zero_dim }
  }
\fancypagestyle { headings }
  {
    \fancyhf { }
    \clist_if_empty:NTF \g__nju_header_clist
      {
        \tl_set:Nn \headrulewidth { \c_zero_dim }
      }
      {
        \tl_set:Nn \headrulewidth { 0.4 pt }
        \dim_set:Nn \headheight { 20 pt }
        \clist_map_inline:Nn \g__nju_header_clist
          { \__nju_header:nn ##1 }
      }
    \clist_map_inline:Nn \g__nju_footer_clist { \__nju_footer:nn ##1 }
    \tl_set:Nn \footrulewidth { \c_zero_dim }
  }
\RenewDocumentCommand \frontmatter { }
  {
    \cleardoublepage
    \exp_args:NV \pagestyle \l__nju_fmt_pagestyle_tl
    \pagenumbering { Roman }
  }
\RenewDocumentCommand \mainmatter { }
  {
    \cleardoublepage
    \exp_args:NV \pagestyle \l__nju_fmt_pagestyle_tl
    \pagenumbering { arabic }
    \normalfont \normalsize
  }
\AtBeginEnvironment { document }
  {
    \exp_args:NV \pagestyle \l__nju_fmt_pagestyle_tl
    \pagenumbering { Roman }
  }
\cs_new:Npn \__nju_bookmark_toc:n #1
  { \addcontentsline { toc } { chapter } { \l__nju_fmt_chapterintoc_tl #1 } }
\cs_generate_variant:Nn \__nju_bookmark_toc:n { V }
\cs_new:Npn \__nju_bookmark_toc:nn #1#2
  { \phantomsection \__nju_bookmark_toc:n {#1} }
\cs_new:Npn \__nju_bookmark_pdf_nosec:nn { \pdfbookmark [0] }
\cs_new:Npn \__nju_bookmark_pdf:nn
  { \phantomsection \__nju_bookmark_pdf_nosec:nn }
\cs_new:Npn \__nju_bookmark:Nnn #1#2#3
  {
    \bool_if:NTF #1
      { \__nju_bookmark_toc:n        {#2}      }
      { \__nju_bookmark_pdf_nosec:nn {#2} {#3} }
  }
\cs_new:Npn \__nju_chapter:Nnn #1#2#3
  {
    \chapter *           {#2}
    \__nju_bookmark:Nnn #1  {#2} {#3}
    \__nju_chapter_header:n {#2}
  }
\cs_new:Npn \__nju_chapter:n #1
  { \__nju_chapter:Nnn \c_true_bool {#1} { } }
\cs_generate_variant:Nn \__nju_chapter:Nnn { cnn }
\cs_generate_variant:Nn \__nju_chapter:n   { V   }
\cs_new_protected:Npn \__nju_chapter_header:n #1
  {
    \legacy_if:nTF { @twoside }
      { \markboth {#1} {#1} }
      { \markboth { \hfill #1 \hfill } { } }
  }
\NewDocumentCommand \njuchapter { m } { \__nju_chapter:n {#1} }
\keys_set:nn { ctex }
  {
    chapter        / beforeskip = \l__nju_chapterbefore_dim,
    chapter        / afterskip  = \l__nju_chapterafter_dim,
    chapter        / format     = \l__nju_fmt_chapter_tl,
    section        / format     = \l__nju_fmt_section_tl,
    subsection     / format     = \l__nju_fmt_subsection_tl,
    subsubsection  / format     = \l__nju_fmt_subsubsection_tl,
    paragraph      / format     = \l__nju_fmt_paragraph_tl,
    subparagraph   / format     = \l__nju_fmt_subparagraph_tl,
    contentsname   = \l__nju_name_tableofcontents_tl,
    listfigurename = \l__nju_name_listoffigures_tl,
    listtablename  = \l__nju_name_listoftables_tl,
    chapter / tocline = \l__nju_fmt_chapterintoc_tl \CTEXnumberline {#1} #2
  }
\cs_new_protected:Npn \__nju_make_toc:nn #1#2
  {
    \group_begin:
      \keys_set:nn { ctex }
        { chapter/format = \l__nju_fmt_toctitle_tl }
      \__nju_chapter:cnn { g__nju_ #2 _showentry_bool } {#1} {#2}
    \group_end:
    \@starttoc {#2}
  }
\cs_generate_variant:Nn \__nju_make_toc:nn { vn }
\cs_new_protected:Npn \__nju_define_toc_cmd:nnn #1#2#3
  {
    \keys_define:nn { nju / #1 }
      {
        toc-entry .bool_gset:c = { g__nju_ #3 _showentry_bool },
        toc-entry   .initial:n = true
      }
    \exp_args:Nc \RenewDocumentCommand {#1} { }
      { \__nju_make_toc:vn { #2 name } {#3} }
  }
\clist_map_inline:nn
  {
    { tableofcontents } { contents   } { toc },
    { listoffigures   } { listfigure } { lof },
    { listoftables    } { listtable  } { lot }
  }
  { \__nju_define_toc_cmd:nnn #1 }
\keys_define:nn { nju / tableofcontents }
  {
    dotline         .choice:,
    dotline / chapter .code:n =
      {
        \cs_set_protected_nopar:Npn \l@chapter
          {
            \skip_vertical:N 1.0 em \@plus \p@ \scan_stop:
            \@dottedtocline { \z@ } { \z@ } { 1.5 em }
          }
      },
    dotline / section .code:n = { }
  }
\clist_new:N \g__nju_blx_option_clist
\clist_new:N \g__nju_blx_resource_clist
\keys_define:nn { nju / bib }
  {
    style             .choice:,
    style / numeric     .code:n =
      {
        \clist_gput_right:Nn \g__nju_blx_option_clist
          { style = gb7714-2015      }
      },
    style / author-year .code:n =
      {
        \clist_gput_right:Nn \g__nju_blx_option_clist
          { style = gb7714-2015ay    }
      },
    style / unknown     .code:n =
      { \clist_gput_right:Nn \g__nju_blx_option_clist { style = #1 } },
    style            .initial:n = numeric,
    option              .code:n =
      { \clist_gput_right:NV \g__nju_blx_option_clist \l_keys_value_tl },
    resource            .code:n =
      { \clist_gput_right:NV \g__nju_blx_resource_clist \l_keys_value_tl },
  }
\bool_if:NT \g__nju_opt_load_blx_bool
  {
    \NewDocumentCommand \addbibresource { m }
      { \clist_gput_right:Nn \g__nju_blx_resource_clist {#1} }
  }
\cs_new_protected:Npn \__nju_blx_pre_setup:
  {
    \cs_undefine:N \addbibresource
    \clist_gput_right:Nn \g__nju_blx_option_clist { backend = biber }
    \exp_args:NV \PassOptionsToPackage \g__nju_blx_option_clist { biblatex }
  }
\cs_new_protected:Npn \__nju_blx_post_setup:
  {
    \defbibheading { njubibintoc } [ \bibname ] { \__nju_chapter:n {##1} }
    \tl_if_eq:NnTF \blx@refsecreset@level { 2 }
      { \DeclarePrintbibliographyDefaults { heading = subbibintoc } }
      { \DeclarePrintbibliographyDefaults { heading = njubibintoc } }
    \clist_map_inline:Nn \g__nju_blx_resource_clist { \addbibresource {##1} }
  }
\bool_if:NT \g__nju_opt_load_blx_bool
  {
    \BeforeBeginEnvironment { document }
      {
        \__nju_blx_pre_setup:
        \RequirePackage { biblatex }
        \__nju_blx_post_setup:
      }
  }
\hypersetup
  {
    bookmarksnumbered = true,
    psdextra          = true,
    unicode           = true,
    hidelinks
  }
\pdfstringdefDisableCommands
  {
    \clist_map_inline:nn
      { \\, \quad, \qquad, \bigger }
      { \__nju_cs_clear:N #1 }
    \cs_set_eq:NN \zihao \use_none:n
  }
\ctex_at_end_preamble:n
  {
    \hypersetup
      {
        pdftitle    = \g__nju_info_title_tl,
        pdfkeywords = \g__nju_info_keywords_clist,
        pdfauthor   = \l__nju_name_pdfauthor_tl,
        pdfcreator  = \l__nju_name_pdfcreator_tl
      }
  }
\cs_new:Npn \__nju_cref_name:n #1
  { \crefname {#1} { \__nju_name:n {#1} } { \__nju_name:n {#1} } }
\bool_if:NT \g__nju_opt_load_cref_bool
  {
    \cs_new:Npn \nju@allowbreak { \skip_horizontal:n { 0pt plus 0.02em } }
    \ExplSyntaxOff
    \crefformat{equation}{公式~#2#1#3}
    \crefformat{chapter}{第\nju@allowbreak{}#2#1#3\nju@allowbreak{}章}
    \crefformat{section}{第~#2#1#3 节}
    \crefformat{subsection}{第~#2#1#3 小节}
    \crefformat{subsubsection}{第~#2#1#3 小节}
    \crefrangeformat{equation}{公式~#3#1#4 到 #5#2#6}
    \crefmultiformat{equation}{公式~#2#1#3}
      { 和 #2#1#3}{、#2#1#3}{和 #2#1#3}
    \crefrangeformat{chapter}{第\nju@allowbreak{}#3#1#4\nju@allowbreak
      章到第\nju@allowbreak{}#5#2#6\nju@allowbreak{}章}
    \crefmultiformat{chapter}{第\nju@allowbreak{}#2#1#3\nju@allowbreak{}章}
      {和第\nju@allowbreak{}#2#1#3\nju@allowbreak{}章}
      {、第\nju@allowbreak{}#2#1#3\nju@allowbreak{}章}
      {和第\nju@allowbreak{}#2#1#3\nju@allowbreak{}章}
    \crefrangeformat{section}{第~#3#1#4~节到第~#5#2#6~节}
    \crefmultiformat{section}{第~#2#1#3~节 }
      {和第~#2#1#3~节}{、第~#2#1#3~节}{和第~#2#1#3~节}
    \crefrangeformat{subsection}{第~#3#1#4~小节到第~#5#2#6~小节}
    \crefmultiformat{subsection}{第~#2#1#3~小节 }
      {和第~#2#1#3~小节 }{、第~#2#1#3~小节 }{和第~#2#1#3~小节}
    \crefrangeformat{subsubsection}{第~#3#1#4~小节到第~#5#2#6~小节}
    \crefmultiformat{subsubsection}{第~#2#1#3~小节}
      {和第~#2#1#3~小节 }{、第~#2#1#3~小节}{和第~#2#1#3~小节}
    \ExplSyntaxOn
    \clist_map_inline:nn { figure, table, appendix }
      { \__nju_cref_name:n {#1} }
  }
\clist_gset:Nn \g__nju_fn_ctext_option_clist { charf = \scriptsize }
\keys_define:nn { nju / footnote }
  {
    style .choices:nn = { plain, pifont, circled, circled* }
      {
        \int_case:nnF { \l_keys_choice_int }
          {
            { 2 }
              {
                \RequirePackage { pifont }
                \cs_set_eq:NN \__nju_fn_number:N \__nju_fn_number_pifont:N
              }
            { 3 }
              {
                \RequirePackage { circledtext }
                \cs_set:Npn \__nju_fn_number:N
                  { \__nju_fn_number_circled:NV \c_false_bool }
              }
            { 4 }
              {
                \RequirePackage { circledtext }
                \cs_set:Npn \__nju_fn_number:N
                  { \__nju_fn_number_circled:NV \c_true_bool }
              }
          }
          { \cs_set_eq:NN \__nju_fn_number:N \int_use:N }
      },
    circledtext-option .code:n =
      { \clist_gput_right:Nn \g__nju_fn_ctext_option_clist {#1} },
    hang             .choice:,
    hang / true        .code:n =
      {
        \cs_set:Npn \__nju_fn_hang:
          {
            \int_set:Nn \tex_hangafter:D { 1 }
            \dim_set_eq:NN \tex_hangindent:D \l__nju_fnhang_dim
          }
      },
    hang / false       .code:n = { \__nju_cs_clear:N \__nju_fn_hang: },
    hang            .initial:n = true
  }
\cs_new:Npn \__nju_fn_number_pifont:N #1 { \ding { \int_eval:n { 171 + #1 } } }
\cs_generate_variant:Nn \__circledtext_handle:nn { Vn }
\cs_new_protected:Npn \__nju_fn_number_circled:Nn #1#2
  {
    \group_begin:
      \bool_set_eq:NN \l__circledtext_negative_bool #1
      \__circledtext_handle:Vn \g__nju_fn_ctext_option_clist {#2}
    \group_end:
  }
\cs_generate_variant:Nn \__nju_fn_number_circled:Nn { NV }
\cs_new_eq:NN \__nju_fn_number:N \int_use:N
\bool_if:NT \g__nju_opt_load_fm_bool
  {
    \cs_set:Npn \thefootnote { \__nju_fn_number:N \c@footnote }
    \cs_set:Npn \@makefntext #1
      {
        \mode_leave_vertical:
        \hbox_to_wd:nn { \l__nju_fnhang_dim } { \@thefnmark \tex_hfil:D }
        \tex_penalty:D \@M
        \__nju_fn_hang:
        #1
      }
  }
\keys_define:nn { nju / image } { path .code:n = { \graphicspath {#1} } }
\DeclareGraphicsExtensions { .pdf, .eps, .jpg, .png }
\BeforeBeginEnvironment { tabular } { \centering \l__nju_fmt_tabular_tl }
\ctex_at_end_package:nn { tabularray }
  {
    \__tblr_use_lib_booktabs:
    \tl_set:Nn \l__nju_tmpb_tl
      { , abovesep = 4 pt, stretch  = 0.8, cells = { font = \l__nju_fmt_tabular_tl } }
    \tl_put_right:NV \l__tblr_default_tblr_inner_tl     \l__nju_tmpb_tl
    \tl_put_right:NV \l__tblr_default_talltblr_inner_tl \l__nju_tmpb_tl
    \tl_put_right:NV \l__tblr_default_longtblr_inner_tl \l__nju_tmpb_tl
    \tl_put_right:Nn \l__tblr_default_talltblr_outer_tl { , headsep = 12.63 pt }
    \tl_put_right:Nn \l__tblr_default_longtblr_outer_tl { , headsep = 12.63 pt }
    \DefTblrTemplate { caption-tag } { default }
      { \l__nju_name_table_tl \hspace { 0.25em } \thetable }
    \DefTblrTemplate { caption-sep } { default } { \quad }
    \DefTblrTemplate { firsthead   } { caption }
      {
        \makebox [ \tablewidth ]
          { \parbox { \columnwidth } { \UseTblrTemplate {caption} {normal} } }
      }
    \SetTblrTemplate { firsthead   } { caption }
    \SetTblrStyle { caption } { font = \normalfont \bfseries \small }
    \SetTblrStyle { note    } { font = \normalfont \footnotesize    }
    \SetTblrStyle { remark  } { font = \normalfont \footnotesize    }
  }
\DeclareCaptionStyle { njucap }
  [ justification = centering ]
  {
    justification = justified,
    font          = {small, bf},
    labelsep      = quad
  }
\captionsetup [ figure ] { position = below, style = njucap }
\captionsetup [ table  ] { position = above, style = njucap }
\cs_generate_variant:Nn \ctex_patch_cmd:Nnn { cnv }
\clist_map_inline:nn { figure, table, equation }
  {
    \keys_define:nn { nju / label-sep }
      {
        #1 .tl_gset:c = { g__nju_sep_ #1 _tl },
        #1 .initial:n = { - }
      }
    \__nju_at_begin_document:n
      { \ctex_patch_cmd:cnv { the #1 } {.} { g__nju_sep_ #1 _tl } }
  }
\bool_if:NT \g__nju_opt_load_enit_bool { \setlist { noitemsep } }
\bool_if:NTF \g__nju_opt_load_um_bool
  { \tl_const:Nn \c__nju_name_qed_tl { \ensuremath { \mdlgwhtsquare    } } }
  { \tl_const:Nn \c__nju_name_qed_tl { \ensuremath { \rule {1ex} {1ex} } } }
\tl_new:N \l__nju_thm_share_tl
\keys_define:nn { nju / theorem }
  {
    style           .tl_set:N = \l__nju_thm_style_tl,
    header-font     .tl_set:N = \l__nju_thm_header_font_tl,
    body-font       .tl_set:N = \l__nju_thm_body_font_tl,
    qed-symbol      .tl_set:N = \l__nju_thm_qed_symbol_tl,
    counter         .tl_set:N = \l__nju_thm_counter_tl,
    style          .initial:n = plain,
    header-font    .initial:n = \normalfont \bfseries,
    body-font      .initial:n = \itshape,
    qed-symbol     .initial:V = \c__nju_name_qed_tl,
    counter        .initial:n = chapter,
    type        .clist_gset:N = \g__nju_thm_type_clist,
    type           .initial:n =
      {
        { axiom      } { 公理 },
        { corollary  } { 推论 },
        { definition } { 定义 },
        { example    } { 例   },
        { lemma      } { 引理 },
        { proof, *+  } { 证明 },
        { theorem    } { 定理 }
      },
    share-counter .bool_set:N = \l__nju_thm_share_bool,
    share-counter  .initial:n = false,
    define .value_forbidden:n = true,
    define            .code:n =
      {
        \clist_if_empty:NT \g__nju_thm_type_clist
          { \msg_error:nn { njuthesis } { empty-theorem-type } }
        \tl_clear:N \l__nju_thm_share_tl
        \clist_map_inline:Nn \g__nju_thm_type_clist
          { \__nju_thm_define:Nnn \l__nju_thm_share_tl ##1 }
      }
  }
\cs_new:Npn \__nju_thm_define:Nnn
  { \__nju_thm_define:NNNNnn \l__nju_tmp_clist \l__nju_tmpa_tl \l__nju_tmpb_tl }
\cs_new:Npn \__nju_thm_define:NNNNnn #1#2#3#4#5#6
  {
    \bool_if:NF \g__nju_opt_load_nthm_bool
      { \msg_error:nn { njuthesis } { missing-ntheorem } }
    \exp_args:NV \theoremstyle      \l__nju_thm_style_tl
    \exp_args:NV \theoremheaderfont \l__nju_thm_header_font_tl
    \exp_args:NV \theorembodyfont   \l__nju_thm_body_font_tl
    \clist_set:Nn #1 {#5}
    \clist_pop:NN #1 #2
    \clist_pop:NN #1 #3
    \tl_if_in:NnT  #3 { + }
      { \exp_args:NV \theoremsymbol \l__nju_thm_qed_symbol_tl }
    \tl_if_in:NnTF #3 { * }
      { \__nju_thm_new:VVVn #2 \c_novalue_tl        #4 {#6} }
      { \__nju_thm_new:VVVn #2 \l__nju_thm_counter_tl #4 {#6} }
    \bool_if:NT \l__nju_thm_share_bool
      {
        \tl_gset_eq:NN #4 #2
        \bool_gset_false:N \l__nju_thm_share_bool
      }
    \bool_if:NT \g__nju_opt_load_cref_bool
      { \exp_args:NV \crefname #2 {#6} {#6} }
    \theoremsymbol { }
  }
\cs_new_protected:Npn \__nju_thm_new:nnnn #1#2#3#4
  {
    \group_begin:
      \cs_if_exist:cT { end #1 }
        { \cs_set_eq:NN \newtheorem \renewtheorem }
      \tl_if_novalue:nTF {#2}
        { \newtheorem * {#1} {#4} }
        {
          \tl_if_empty:nTF {#3}
            { \newtheorem {#1}      {#4} [#2] }
            { \newtheorem {#1} [#3] {#4}      }
        }
    \group_end:
  }
\cs_generate_variant:Nn \__nju_thm_new:nnnn { VVVn }
\bool_new:N \g__nju_opt_math_re_bool
\bool_new:N \g__nju_opt_math_int_bool
\bool_new:N \g__nju_opt_math_leq_bool
\bool_new:N \g__nju_opt_math_vec_bool
\tl_new:N \l__nju_name_integral_tl
\bool_if:NT \g__nju_opt_load_um_bool
  { \tl_set_eq:NN \l__nju_name_integral_tl \l__um_nolimits_tl }
\cs_new:Npn \__nju_um_setup:n #1 { \keys_set:nn { unicode-math } {#1} }
\keys_define:nn { nju / math }
  {
    integral                      .groups:n  = { unicode-math },
    integral                      .choice:,
    integral / upright              .code:n  =
      { \bool_gset_true:N  \g__nju_opt_math_int_bool },
    integral / slanted              .code:n  =
      { \bool_gset_false:N \g__nju_opt_math_int_bool },
    integral-limits               .groups:n  = { unicode-math },
    integral-limits               .choice:,
    integral-limits / true          .code:n  =
      { \tl_clear:N   \l__um_nolimits_tl },
    integral-limits / false         .code:n  =
      { \tl_set_eq:NN \l__um_nolimits_tl \l__nju_name_integral_tl },
    less-than-or-equal            .groups:n  = { unicode-math },
    less-than-or-equal            .choice:,
    less-than-or-equal / slanted    .code:n  =
      { \bool_gset_true:N  \g__nju_opt_math_leq_bool },
    less-than-or-equal / horizontal .code:n  =
      { \bool_gset_false:N \g__nju_opt_math_leq_bool },
    math-ellipsis                 .groups:n  = { unicode-math },
    math-ellipsis                 .choice:,
    math-ellipsis / centered        .code:n  =
      {
        \DeclareRobustCommand \mathellipsis
          { \mathinner { \unicodecdots    } }
      },
    math-ellipsis / lower           .code:n  =
      {
        \DeclareRobustCommand \mathellipsis
          { \mathinner { \unicodeellipsis } }
      },
    partial                       .groups:n  = { unicode-math },
    partial                      .choices:nn =
      { upright, italic } { \__nju_um_setup:n { partial = #1 } },
    real-part                     .groups:n  = { unicode-math },
    real-part                     .choice:,
    real-part / roman               .code:n  =
      { \bool_gset_true:N  \g__nju_opt_math_re_bool },
    real-part / fraktur             .code:n  =
      { \bool_gset_false:N \g__nju_opt_math_re_bool },
    vector                        .groups:n  = { unicode-math },
    vector                        .choice:,
    vector / boldfont               .code:n  =
      { \bool_gset_true:N  \g__nju_opt_math_vec_bool },
    vector / arrow                  .code:n  =
      { \bool_gset_false:N \g__nju_opt_math_vec_bool },
    uppercase-greek               .groups:n  = { unicode-math },
    uppercase-greek               .choice:,
    uppercase-greek / upright       .code:n  =
      { \__nju_um_setup:n { math-style = ISO } },
    uppercase-greek / italic        .code:n  =
      { \__nju_um_setup:n { math-style = TeX } },
    style                         .groups:n  = { unicode-math },
    style                         .choice:,
    style / TeX                     .code:n  =
      {
        \keys_set:nn { nju / math }
          {
            integral           = slanted,
            integral-limits    = false,
            less-than-or-equal = horizontal,
            math-ellipsis      = centered,
            partial            = italic,
            real-part          = fraktur,
            vector             = arrow,
            uppercase-greek    = upright
          }
        \__nju_um_setup:n { bold-style = TeX }
      },
    style / ISO                     .code:n  =
      {
        \keys_set:nn { nju / math }
          {
            integral           = upright,
            integral-limits    = true,
            less-than-or-equal = horizontal,
            math-ellipsis      = lower,
            partial            = upright,
            real-part          = roman,
            vector             = arrow,
            uppercase-greek    = italic
          }
        \__nju_um_setup:n { bold-style = ISO }
      },
    style / GB                      .code:n  =
      {
        \keys_set:nn { nju / math }
          {
            integral           = upright,
            integral-limits    = false,
            less-than-or-equal = slanted,
            math-ellipsis      = centered,
            partial            = upright,
            real-part          = roman,
            vector             = boldfont,
            uppercase-greek    = italic
          }
        \__nju_um_setup:n { bold-style = ISO }
      },
  }

\bool_if:NT \g__nju_opt_load_um_bool
  {
    \keys_define:nn { nju / math } { style .initial:n = GB }
    \__nju_at_begin_document:n
      {
        \use:c { __nju_loadfont_math_ \g__nju_font_math_tl : }
        \bool_if:NT \g__nju_opt_math_leq_bool
          {
            \cs_set_eq:NN \le  \leqslant
            \cs_set_eq:NN \ge  \geqslant
            \cs_set_eq:NN \leq \leqslant
            \cs_set_eq:NN \geq \geqslant
          }
        \bool_if:NT \g__nju_opt_math_re_bool
          {
            \cs_set:Npn \Re { \operatorname { Re } }
            \cs_set:Npn \Im { \operatorname { Im } }
          }
        \bool_if:NT \g__nju_opt_math_vec_bool
          { \cs_set_eq:NN \vec \symbf }
      }
  }
\hook_gput_code:nnn { . / cover / begin } { presetup }
  {
    \pagenumbering { gobble }
    \prop_map_inline:Nn \l__nju_logo_file_prop
      { \tl_set:cn { l__nju_logo_file_ #1 _tl } {#2} }
  }
\hook_gput_code:nnn { . / cover / end } { postsetup }
  {
    \tl_gremove_all:Nn \g__nju_info_title_tl    { \\ }
    \tl_gremove_all:Nn \g__nju_info_title_en_tl { \\ }
    \cleardoublepage
    \exp_args:NV \pagestyle \l__nju_fmt_pagestyle_tl
    \pagenumbering { Roman }
  }
\hook_gput_next_code:nn { env / document / end } { \cleardoublepage }
\prop_new:N \l__nju_logo_file_prop
\cs_new:Npn \__nju_logo_file_update:nn
  { \prop_put:Nnn \l__nju_logo_file_prop }
\clist_map_inline:nn { emblem, name }
  {
    \tl_new:c { l__nju_logo_file_ #1 _tl }
    \cs_new_protected:cpn { __nju_logo_ #1 :Nn } ##1
      { \includegraphics [ width = ##1 ] }
    \cs_generate_variant:cn { __nju_logo_ #1 :Nn } { cv }
    \cs_new_protected:cpn { __nju_logo_ #1 :n } ##1
      {
        \use:c { __nju_logo_ #1 :cv } { l__nju_ #1 wd ##1 _dim }
          { l__nju_logo_file_ #1 _tl }
      }
    \cs_new:cpn { __nju_logo_ #1 : } { \use:c { __nju_logo_ #1 :n } { } }
  }
\clist_map_inline:nn { emblem, name }
  {
    \keys_define:nn { nju / image }
      {
        nju-#1         .choice:,
        nju-#1 / black   .code:n =
          { \__nju_logo_file_update:nn {#1} { nju- #1 -black .pdf } },
        nju-#1 / purple  .code:n =
          { \__nju_logo_file_update:nn {#1} { nju- #1 -purple.pdf } },
        nju-#1 / unknown .code:n =
          { \__nju_logo_file_update:nn {#1} {##1}                   }
      }
  }
\keys_define:nn { nju / image }
  {
    nju-logo-color .choices:nn = { black, purple }
      { \keys_set:nn { nju / image } { nju-emblem = #1, nju-name = #1 }},
    nju-logo-color .initial:V  = \c__nju_logo_color_tl,
  }
\RenewDocumentCommand \maketitle { }
  {
    \hook_use:n { njuthesis / cover / begin }
    \hook_use:n { njuthesis / cover / body  }
    \hook_use:n { njuthesis / cover / end   }
    \hook_gput_next_code:nn { enddocument }
      { \hook_use_once:n { njuthesis / cover / back } }
  }
\cs_new_protected:Npn \__nju_print_keywords:nn
  { \__nju_print_keywords:NNnn \l__nju_tmpa_tl \l__nju_tmpa_dim }
\cs_new:Npn \__nju_print_keywords:NNnn #1#2#3#4
  {
    \tl_set:Nv #1 { l__nju_name_keywords #3 _tl }
    \exp_args:NNv \tl_put_left:Nn  #1 { l__nju_fmt_abslabel #3 _tl }
    \exp_args:NNv \tl_put_right:Nn #1 { l__nju_name_colon   #3 _tl }
    \__nju_get_width:NV #2 #1
    \list {#1}
      {
        \labelwidth  #2
        \labelsep    \c_zero_dim
        \leftmargin  \c_zero_dim
        \rightmargin \c_zero_dim
        \advance \leftmargin #2
        \__nju_cs_clear:N \makelabel
      }
    \item \clist_use:cn { g__nju_info_keywords #3 _clist } {#4}
    \endlist
  }
\skip_new:N \g__nju_abs_title_left_skip
\keys_define:nn { nju / abstract }
  {
    toc-entry         .bool_gset:N = \g__nju_abs_showentry_bool,
    toc-entry           .initial:n = true,
    underline         .bool_gset:N = \g__nju_abs_underline_bool,
    underline           .initial:n = true,
    title-style          .choice:,
    title-style / strict   .code:n =
      {
        \bool_gset_true:N  \g__nju_abs_title_strict_bool
        \skip_gset:Nn \g__nju_abs_title_left_skip { 0 pt }
      },
    title-style / centered .code:n =
      {
        \bool_gset_true:N \g__nju_abs_title_strict_bool
        \skip_gset:Nn \g__nju_abs_title_left_skip { 0 pt plus 1 fill }
      },
    title-style / natural  .code:n =
      {
        \bool_gset_false:N \g__nju_abs_title_strict_bool
        \skip_gset:Nn \g__nju_abs_title_left_skip { 0 pt plus 1 fill }
      },
    title-style         .initial:n = strict
  }
\NewDocumentEnvironment { abstract } { +b }
  {
    \cleardoublepage
    \CTEX@setthispagestyle { chapter }
    \__nju_abs_bookmark:Vn \l__nju_name_abstracta_tl { abstract }
    \tl_gremove_all:Nn \g__nju_info_title_tl { \\ }
    \__nju_make_abstract:
    \group_begin: \kaishu \zihao { -4 } #1
  }
  { \__nju_print_keywords:nn { } { ； } \group_end: }
\NewDocumentEnvironment { abstract* } { +b }
  {
    \cleardoublepage
    \CTEX@setthispagestyle { chapter }
    \__nju_abs_bookmark:Vn \l__nju_name_abstracta_en_tl { abstract-en }
    \tl_gremove_all:Nn \g__nju_info_title_en_tl { \\ }
    \__nju_make_abstract_en:
    \group_begin: \zihao { -4 } #1
  }
  { \__nju_print_keywords:nn { _en } { ;~ } \group_end: }
\NewDocumentEnvironment { preface         } { +b }
  { \__nju_chapter:V \l__nju_name_preface_tl #1 }
  { \cleardoublepage }
\NewDocumentEnvironment { acknowledgement } { +b }
  { \__nju_acknowledgement:n {#1} }
  { \cleardoublepage }
\cs_new:Npn \__nju_acknowledgement:n
  { \__nju_chapter:V \l__nju_name_acknowledgement_tl \use:n }
\cs_new:Npn \__nju_acknowledgement_anon:n
  { \__nju_bookmark_toc:V \l__nju_name_acknowledgementa_tl \use_none:n }
\cs_new:Npn \__nju_anon_paperlist_setup:
  {
    \ctex_at_end_package:nn { biblatex }
      {
        \DeclareBibliographyDriver { anonymous }
          {
            \usebibmacro { begentry }
            \usebibmacro { journal  },~
            \usebibmacro { date     }
            \usebibmacro { finentry }
          }
      }
  }
\cs_new:Npn \__nju_paperlist_anon:nn #1#2
  {
    \group_begin:
      \newrefsection
      \nocite {#2}
      \printbiblist
        [ title = #1, driver = anonymous, env = bibliography,
          heading = subbibliography ] { anonymous }
      \endrefsection
    \group_end:
  }
\cs_new:Npn \__nju_paperlist:nn #1#2
  {
    \group_begin:
      \cs_set_eq:NN \MakeCapital \str_uppercase:f
      \RenewDocumentCommand \mkbibnamegiven  { m }
        { \ifitemannotation { thesisauthor }
            { \bfseries \njuline {##1} } {##1} }
      \RenewDocumentCommand \mkbibnamefamily { m }
        { \ifitemannotation { thesisauthor }
            { \bfseries \njuline {##1} } {##1} }
      \RenewDocumentCommand \mkbibdateshort { m m m }
        { \textbf { \thefield {##1} } }
      \newrefsection
      \numdef \blx@maxbibnames { 99 }
      \nocite {#2}
      \printbibliography [ heading = subbibliography, title = #1 ]
      \endrefsection
    \group_end:
  }
\NewDocumentCommand \njupaperlist
  { O { \l__nju_name_paperlist_tl } m } { \__nju_paperlist:nn {#1} {#2} }
\keys_define:nn { nju / anonymous-mode }
  {
    no-nju .bool_gset:N = \g__nju_opt_nonju_bool,
    no-nju   .initial:n = false
  }
\bool_if:NT \g__nju_opt_anon_bool
  {
    \keys_set:nn { nju / info }
      {
        author         = \__nju_name:n { anonymous a },
        author*        = \__nju_name:n { anonymous a },
        supervisor     =
          { \__nju_name:n { anonymous a },          \__nju_name:n { anonymous b } },
        supervisor*    =
          { \__nju_name:n { anonymous c } \__nju_quad: \__nju_name:n { anonymous a } },
        supervisor-ii  = ,
        supervisor-ii* =
      }
    \__nju_anon_paperlist_setup:
    \cs_gset_eq:NN \__nju_paperlist:nn      \__nju_paperlist_anon:nn
    \cs_gset_eq:NN \__nju_acknowledgement:n \__nju_acknowledgement_anon:n
    \tl_clear:N \l__nju_name_pdfauthor_tl
  }
\ctex_at_end_preamble:n
  {
    \bool_lazy_and:nnT
      { \g__nju_opt_anon_bool } { \g__nju_opt_nonju_bool }
      {
        \tl_clear:N  \l__nju_name_nju_tl
        \tl_clear:N  \l__nju_name_nju_en_tl
        \tl_gclear:N \g__nju_info_code_tl
        \cs_gset_eq:NN \__nju_logo_emblem:n \use_none:n
        \cs_gset_eq:NN \__nju_logo_name:n   \use_none:n
      }
  }
\cs_new_protected:Npn \__nju_notation_label:n #1 { #1 \tex_hfil:D }
\cs_new_protected:Npn \__nju_make_notation:nn #1#2
  {
    \dim_set:Nn \l__nju_tmpa_dim { \textwidth - #1 - #2 }
    \list { }
      {
        \labelwidth #2
        \labelsep   \c_zero_dim
        \itemsep    \c_zero_dim
        \parsep     \c_zero_dim
        \leftmargin .5\l__nju_tmpa_dim
        \rightmargin \leftmargin
        \advance \leftmargin #2
        \cs_set_eq:NN \makelabel \__nju_notation_label:n
      }
  }
\NewDocumentEnvironment { notation } { O { 10 em } O { 5 em } }
  {
    \__nju_chapter:V \l__nju_name_notation_tl
    \__nju_make_notation:nn {#1} {#2}
  }
  { \endlist \cleardoublepage }
\NewDocumentEnvironment { notation* } { O { 10 em } O { 5 em } }
  {
    \chapter * { \l__nju_name_notation_tl }
    \__nju_make_notation:nn {#1} {#2}
  }
  { \endlist \cleardoublepage }
\endinput
%%
%% End of file `njuthesis.cls'.
