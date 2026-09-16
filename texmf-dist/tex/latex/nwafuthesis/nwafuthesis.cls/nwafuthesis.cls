%%
%% This is file `nwafuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% nwafuthesis.dtx  (with options: `class')
%% 
%%     Copyright (C) 2019--2026 by Nan Geng <nangeng@nwafu.edu.cn>
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
%%     This work has the LPPL maintenance status `maintained'.
%% 
%%     The Current Maintainer of this work is Nan Geng.
%% 
%%     This work consists of the files nwafuthesis.dtx,
%%                                     nwafuthesis-doc.dtx,
%%               and the derived files nwafuthesis.ins,
%%                                     nwafuthesis.cls,
%%                                     nwafudoc.cls,
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\GetIdInfo $Id: nwafuthesis.dtx 2.17 2026-05-16 Nan Geng <nangeng@nwafu.edu.cn> $
  {Thesis template for Northwest A\&F University}
\ProvidesExplClass{\ExplFileName}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}

\RequirePackage {xtemplate, l3keys2e }
\clist_map_inline:nn { xtemplate, l3keys2e }
  {
    \@ifpackagelater {#1} { 2020/07/17 }
      { } { \msg_error:nnn { nwafuthesis } { l3-too-old } {#1} }
  }
\msg_new:nnn { nwafuthesis } { l3-too-old }
  {
    Package~ "#1"~ is~ too~ old. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ the~ bundles \\
    "l3kernel"~ and~ "l3packages"~ using~ your~ TeX~ package \\
    manager~ or~ from~ CTAN.
  }
\sys_if_engine_xetex:F
  {
    \sys_if_engine_luatex:F
      {
        \msg_fatal:nnx { nwafuthesis } { unsupported-engine }
          { \c_sys_engine_str }
      }
  }
\msg_new:nnn { nwafuthesis } { unsupported-engine }
  {
    The~ nwafuthesis~ class~ requires~ either~ XeTeX~ or~ LuaTeX. \\\\
    "#1"~ is~ not~ supported~ at~ present.~ You~ must~ change \\
    your~ typesetting~ engine~ to~ "xelatex"~ or~ "lualatex".
  }
\box_new:N   \l__nwafu_tmpa_box
\clist_new:N \l__nwafu_tmpa_clist
\clist_new:N \l__nwafu_tmpb_clist
\clist_new:N \l__nwafu_tmpc_clist
\clist_new:N \l__nwafu_tmpd_clist
\clist_new:N \l__nwafu_tmpt_clist
\dim_new:N   \l__nwafu_tmpa_dim
\dim_new:N   \l__nwafu_tmpb_dim
\dim_new:N   \l__nwafu_tmpc_dim
\dim_new:N   \l__nwafu_tmpd_dim
\dim_new:N   \l__nwafu_tmpt_dim
\skip_new:N  \l__nwafu_tmpa_skip
\tl_new:N    \l__nwafu_tmpa_tl
\tl_new:N    \l__nwafu_tmpb_tl
\tl_new:N    \l__nwafu_tmpc_tl
\tl_new:N    \l__nwafu_tmpd_tl
\tl_new:N    \l__nwafu_tmpt_tl
\int_new:N \g__nwafu_thesis_type_int
\clist_new:N \g__nwafu_to_ctexbook_clist
\clist_new:N \g__nwafu_to_hyperref_clist
\bool_new:N \g__nwafu_twoside_bool
\bool_set_true:N \g__nwafu_twoside_bool
\bool_new:N \g__nwafu_draft_bool
\bool_set_false:N \g__nwafu_draft_bool
\bool_new:N \g__nwafu_figtabtoc_bool
\bool_set_false:N \g__nwafu_figtabtoc_bool
\bool_new:N \g__nwafu_withsignature_bool
\bool_set_false:N \g__nwafu_withsignature_bool
\bool_new:N \g__nwafu_anonymous_bool
\bool_set_false:N \g__nwafu_anonymous_bool
\cs_generate_variant:Nn \file_input:n           { V  }
\cs_generate_variant:Nn \int_to_arabic:n        { v  }
\cs_generate_variant:Nn \keys_define:nn         { nx }
\cs_generate_variant:Nn \tl_map_inline:nn       { xn }
\prg_generate_conditional_variant:Nnn \tl_if_eq:nn { Vn } { T, TF }
\cs_new:Npn \__nwafu_quad:  { \skip_horizontal:n { 1 em } }
\cs_new:Npn \__nwafu_qquad: { \skip_horizontal:n { 2 em } }
\cs_new_protected:Npn \__nwafu_vspace:N #1
  {
    \dim_set_eq:NN \l__nwafu_tmpa_dim \prevdepth
    \hrule height \c_zero_dim
    \nobreak
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_skip
    \dim_set_eq:NN \prevdepth \l__nwafu_tmpa_dim
  }
\cs_new_protected:Npn \__nwafu_vspace:n #1
  {
    \skip_set:Nn \l__nwafu_tmpa_skip {#1}
    \__nwafu_vspace:N \l__nwafu_tmpa_skip
  }
\cs_generate_variant:Nn \__nwafu_vspace:N { c }
\cs_new:Npn \__nwafu_symbol:n #1 { \tex_char:D #1 \scan_stop: }
\cs_new:Npn \__nwafu_arabic:n #1
  { \int_to_arabic:v { c@ #1 } }
\cs_new:Npn \__nwafu_fake_bold:nn #1#2
  {
    \special{pdf:code~q~2~Tr~0~G~#1~w}%
    #2%
    \special{pdf:code~Q}%
  }
\NewDocumentCommand \fakebold {O{0.2} m }
  {
    \__nwafu_fake_bold:nn { #1 }{ #2 }
  }
\cs_new_protected:Npn \__nwafu_gadd_ltxhook:nn #1#2
  { \hook_gput_code:nnn {#1} { . } {#2} }
\hook_gset_rule:nnnn { begindocument/before } { . } { < } { xeCJK }
\cs_new_protected:Npn \__nwafu_patch_cmd:Nnn #1#2#3
  {
    \ctex_patch_cmd_once:NnnnTF #1 { } {#2} {#3}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__nwafu_preto_cmd:Nn #1#2
  {
    \ctex_preto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__nwafu_appto_cmd:Nn #1#2
  {
    \ctex_appto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__nwafu_at_begin_environment:nn #1#2
  {
    \seq_set_from_clist:Nn \l__nwafu_env_hook_name_seq {#1}
    \seq_map_inline:Nn \l__nwafu_env_hook_name_seq
      { \AtBeginEnvironment{##1}{#2} }
  }
\cs_new_protected:Npn \__nwafu_at_end_preamble:n #1
  {
    \ctex_gadd_ltxhook:nn { env/document/before } { #1 }
  }
\cs_new_protected:Npn \__nwafu_define_fn_style:nn #1#2
  { \tl_const:cn { c__nwafu_fn_style_ #1 _tl } {#2} }
\cs_new_protected:Npn \__nwafu_define_punct:nn #1#2
  { \tl_const:cn { c__nwafu_ #1 _tl } { \__nwafu_symbol:n {#2} } }
\cs_new_protected:Npn \__nwafu_define_name:nn #1#2
  { \tl_const:cn { c__nwafu_name_ #1 _tl } {#2} }
\cs_new_protected:Npn \__nwafu_define_name:nnn #1#2#3
  {
    \tl_const:cn { c__nwafu_name_ #1    _tl } {#2}
    \tl_const:cn { c__nwafu_name_ #1 _en_tl } {#3}
  }
\cs_new:Npn \__nwafu_msg_new:nn  { \msg_new:nnn      { nwafuthesis } }
\cs_new:Npn \__nwafu_error:n     { \msg_error:nn     { nwafuthesis } }
\cs_new:Npn \__nwafu_error:nn    { \msg_error:nnn    { nwafuthesis } }
\cs_new:Npn \__nwafu_error:nx    { \msg_error:nnx    { nwafuthesis } }
\cs_new:Npn \__nwafu_error:nnn   { \msg_error:nnnn   { nwafuthesis } }
\cs_new:Npn \__nwafu_error:nnnn  { \msg_error:nnnnn  { nwafuthesis } }
\cs_new:Npn \__nwafu_warning:n   { \msg_warning:nn   { nwafuthesis } }
\cs_new:Npn \__nwafu_warning:nn  { \msg_warning:nnn  { nwafuthesis } }
\cs_new:Npn \__nwafu_warning:nxx { \msg_warning:nnxx { nwafuthesis } }
\cs_new:Npn \__nwafu_info:nx     { \msg_info:nnx     { nwafuthesis } }
\keys_define:nn { nwafu / option }
  {
    type .choice:,
    type .value_required:n = true,
    type .choices:nn =
      { doctor, master, bachelor }
      { \int_gset_eq:NN \g__nwafu_thesis_type_int \l_keys_choice_int },
    type .initial:n = bachelor,
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n =
      {
        \clist_gput_right:Nn \g__nwafu_to_ctexbook_clist { oneside }
        \bool_gset_false:N   \g__nwafu_twoside_bool
      },
    twoside .code:n =
      {
        \clist_gput_right:Nn \g__nwafu_to_ctexbook_clist { twoside }
        \bool_gset_true:N    \g__nwafu_twoside_bool
      },
    draft .choice:,
    draft / true  .code:n =
      {
        \bool_gset_true:N     \g__nwafu_draft_bool
        \clist_gput_right:Nn \g__nwafu_to_ctexbook_clist { draft }
      },
    draft / false .code:n =
      { \bool_gset_false:N    \g__nwafu_draft_bool },
    draft .default:n = true,
    draft .initial:n = false,
    unknown .code:n = { \__nwafu_error:n { unknown-option } }
  }
\__nwafu_msg_new:nn { unknown-option }
  { Class~ option~ "\l_keys_key_tl"~ is~ unknown. }
\ProcessKeysOptions { nwafu / option }
\NewDocumentCommand \nwafuthesis { }
  {%
    \makebox{\rmfamily%
      N\hspace{-0.2ex}\raisebox{-0.5ex}{W}\raisebox{0.5ex}
      {\hspace{-0.2ex}\textsc{AFU}}\hspace{0.3ex}%
      \textsc{Thesis}
    }
  }
\NewDocumentCommand \datezh { }
  {
    \int_use:N \c_sys_year_int 年
    \int_use:N \c_sys_month_int 月
  }
\prop_const_from_keyval:Nn \g__nwafu_month_en_prop
  {
    1  = January,
    2  = February,
    3  = March,
    4  = April,
    5  = May,
    6  = June,
    7  = July,
    8  = August,
    9  = September,
    10 = October,
    11 = November,
    12 = December,
  }
\NewDocumentCommand \dateen { }
  {
    \prop_get:NVN \g__nwafu_month_en_prop \c_sys_month_int \l__nwafu_tmpa_tl
    \l__nwafu_tmpa_tl ,~ \int_use:N \c_sys_year_int
  }
\NewDocumentCommand \dateym { s O{ 6 } o }
  {
    \IfBooleanTF{ #1 }
      {
        \prop_get:NnN \g__nwafu_month_en_prop { #2 } \l__nwafu_tmpt_tl
        \l__nwafu_tmpt_tl ,~
        \IfNoValueTF{ #3 } { \int_use:N \c_sys_year_int } { #3 }
      }{
        \IfNoValueTF{ #3 } { \int_use:N \c_sys_year_int } { #3 }
        年 #2 月
      }
  }
\tl_const:Nn \c__nwafu_name_simp_tl { 西北农林科技大学 }
\tl_const:Nn \c__nwafu_name_trad_tl { 西北農林科技大學 }
\tl_const:Nn \c__nwafu_name_en_tl { Northwest~ A\&F~ University }
\clist_map_inline:nn
  {
    { ideo_comma       } { "3001 },
    { ideo_full_stop   } { "3002 },
    { fwid_tilde       } { "FF5E },
    { fwid_comma       } { "FF0C },
    { fwid_full_stop   } { "FF0E },
    { fwid_colon       } { "FF1A },
    { fwid_semicolon   } { "FF1B },
    { fwid_left_paren  } { "FF08 },
    { fwid_right_paren } { "FF09 },
    { fwid_left_title  } { "300A },
    { fwid_right_title } { "300B }
  }
  { \__nwafu_define_punct:nn #1 }
\fp_const:Nn \c__nwafu_line_spread_fp
  { \dim_ratio:nn { 20 pt } { 12 bp } / 1.2 }
\cs_new_protected:Npn \__nwafu_define_orig_decl_text:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \tl_const:Nn \c__nwafu_orig_decl_text_tl
          {
            本人声明{\c__nwafu_fwid_colon_tl}所呈交的学位论文是我个人在导师指导下%
            独立进行的研究工作及取得的研究成果{\c__nwafu_fwid_semicolon_tl}论文中%
            的研究数据及结果的获得完全符合学术道德的有关规定{\c__nwafu_fwid_comma_tl}%
            如有违反{\c__nwafu_fwid_comma_tl}一切后果与法律责任均由本人承担{\c__nwafu_ideo_full_stop_tl}\par%

            尽我所知{\c__nwafu_fwid_comma_tl}除了文中特别加以标注和致谢的地方外%
            {\c__nwafu_fwid_comma_tl}论文中不包含其他人已经发表或撰写过的研究成果%
            {\c__nwafu_fwid_comma_tl}也不包含为获得\__nwafu_name_simp: {}%
            或其它教育机构的学位或证书而使用过的材料{\c__nwafu_ideo_full_stop_tl}与%
            我一同工作的同事对本研究所做的任何贡献均已在论文的致谢中作了明确的%
            说明并表示了谢意{\c__nwafu_ideo_full_stop_tl}%
          }
      }{
        \tl_const:Nn \c__nwafu_orig_decl_text_tl
          {
            本人声明{\c__nwafu_fwid_colon_tl}所呈交的本科毕业%
            \clist_item:Nn \c__nwafu_bachelor_type_clist
              { \g__nwafu_info_bachelor_type_int }%
            是我个人在导师指导下独立进行的研究工作及取得的研究结果%
            {\c__nwafu_ideo_full_stop_tl}%
            尽我所知{\c__nwafu_fwid_comma_tl}除了文中特别加以标注和致谢的地%
            方外{\c__nwafu_fwid_comma_tl}论文中不包含其他人已经发表或撰写过%
            的研究结果{\c__nwafu_fwid_comma_tl}也不包含其他人和自己本人已获%
            得\__nwafu_name_simp: {}或其它教育机构的学位或证书而使用过的材%
            料{\c__nwafu_ideo_full_stop_tl}与我一同工作的同事对本研究所做的%
            任何贡献均已在论文的致谢中作了明确的说明并表示了谢意{\c__nwafu_ideo_full_stop_tl}%
            如违反此声明{\c__nwafu_fwid_comma_tl}一切后果与法律责任均由本人%
            承担{\c__nwafu_ideo_full_stop_tl}%
          }
      }
  }
\__nwafu_define_orig_decl_text:
\tl_const:Nn \c__nwafu_super_decl_text_tl
  {
    本人承诺{\c__nwafu_fwid_colon_tl}我的研究生{%
      \bool_if:NTF \g__nwafu_anonymous_bool
      {
        \__nwafu_text_uline:V \c__nwafu_name_anonname_tl
      }{
        \bool_if:NTF \g__nwafu_withsignature_bool
          {
            \__nwafu_get_text_width:NV \l__nwafu_tmpt_dim \l__nwafu_info_author_tl
            \dim_add:Nn \l__nwafu_tmpt_dim { 0.6em }
            \__nwafu_blank_underline:V \l__nwafu_tmpt_dim
          }
          { \__nwafu_text_uline:V \l__nwafu_info_author_tl }
      }
    }%
    所呈交的学位论文是在我指导下独立开展研究工作及取得的研究成果%
    {\c__nwafu_fwid_comma_tl}并严格遵守学校道德的有关规定{\c__nwafu_ideo_full_stop_tl}%
    如果违反{\c__nwafu_fwid_comma_tl}我愿接受按学校%
    有关规定的处罚处理并承担相应导师连带责任{\c__nwafu_ideo_full_stop_tl}%
  }
\cs_new_protected:Npn \__nwafu_auth_orig_decl_text:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \tl_const:Nn \c__nwafu_auth_decl_text_tl
          {
            本学位论文的知识产权归属\__nwafu_name_simp: {}{\c__nwafu_ideo_full_stop_tl}%
            本人及导师同意学校保存或向国家有关部门或机构送交论文的纸质版和%
            电子版{\c__nwafu_fwid_comma_tl}允许论文被查阅和借阅{\c__nwafu_fwid_semicolon_tl}%
            同意学校将本学位论文的全部或部分内容授权汇编录入%
            {\c__nwafu_fwid_left_title_tl}中国博士/硕士学位论文全文数据库%
            {\c__nwafu_fwid_right_title_tl}和{\c__nwafu_fwid_left_title_tl}中国学位%
            论文全文数据库{\c__nwafu_fwid_right_title_tl}进行出版%
            {\c__nwafu_fwid_comma_tl}并享受相关权益{\c__nwafu_ideo_full_stop_tl}\par

            本人保证{\c__nwafu_fwid_comma_tl}在毕业离开{\c__nwafu_fwid_left_paren_tl}%
            或者工作调离{\c__nwafu_fwid_right_paren_tl}\__nwafu_name_simp: {}%
            后{\c__nwafu_fwid_comma_tl}发表或者使用本学位论文及其相关的工作成果时%
            {\c__nwafu_fwid_comma_tl}将以\__nwafu_name_simp: {}为第一署名单位%
            {\c__nwafu_fwid_comma_tl}否则{\c__nwafu_fwid_comma_tl}愿意按
            {\c__nwafu_fwid_left_title_tl}中华人民共和国著作权法{\c__nwafu_fwid_right_title_tl}%
            等有关规定接受处理并承担法律责任{\c__nwafu_ideo_full_stop_tl}\par%

            任何收存和保管本论文各种版本的其他单位和个人{\c__nwafu_fwid_left_paren_tl}%
            包括研究生本人{\c__nwafu_fwid_right_paren_tl}未经本%
            论文作者的导师同意{\c__nwafu_fwid_comma_tl}不得有对本论文进行复制%
            {\c__nwafu_ideo_comma_tl}修改{\c__nwafu_ideo_comma_tl}发行{\c__nwafu_ideo_comma_tl}%
            出租{\c__nwafu_ideo_comma_tl}改编等侵犯著作权的行为{\c__nwafu_fwid_comma_tl}%
            否则{\c__nwafu_fwid_comma_tl}按违背{\c__nwafu_fwid_left_title_tl}中华人民共和国%
            著作权法{\c__nwafu_fwid_right_title_tl}等有关规定处%
            理并追究法律责任{\c__nwafu_ideo_full_stop_tl}\par%

            {\sffamily {\c__nwafu_fwid_left_paren_tl}保密的学位论文在保密期限内{\c__nwafu_fwid_comma_tl}不得以任何%
               方式发表{\c__nwafu_ideo_comma_tl}借阅{\c__nwafu_ideo_comma_tl}复印%
               {\c__nwafu_ideo_comma_tl}缩印或扫描复制保存{\c__nwafu_fwid_right_paren_tl}%
            }
          }
      }{
        \tl_const:Nn \c__nwafu_auth_decl_text_tl
          {
            本毕业\clist_item:Nn \c__nwafu_bachelor_type_clist
                                 { \g__nwafu_info_bachelor_type_int }%
            的知识产权归属\__nwafu_name_simp: {}{\c__nwafu_ideo_full_stop_tl}本%
            人同意\__nwafu_name_simp: {}保存或向国家有关部门或机构送交论文的%
            纸质版和电子版{\c__nwafu_fwid_comma_tl}允许论文被查阅和借阅%
            {\c__nwafu_ideo_full_stop_tl}\par

            本人保证{\c__nwafu_fwid_comma_tl}在毕业离开\__nwafu_name_simp: {}后%
            {\c__nwafu_fwid_comma_tl}发表或者使用本毕业%
            \clist_item:Nn \c__nwafu_bachelor_type_clist { \g__nwafu_info_bachelor_type_int }%
            及其相关的工作成果时{\c__nwafu_fwid_comma_tl}将以\__nwafu_name_simp: {}%
            为第一署名单位{\c__nwafu_fwid_comma_tl}如有违反{\c__nwafu_fwid_comma_tl}%
            愿意按{\c__nwafu_fwid_left_title_tl}中华人民共和国著作权法%
            {\c__nwafu_fwid_right_title_tl}等有关规定接受处理并承担法律责任%
            {\c__nwafu_ideo_full_stop_tl}\par%

            任何收存和保管本论文各种版本的其他单位和个人{\c__nwafu_fwid_left_paren_tl}%
            包括作者本人{\c__nwafu_fwid_right_paren_tl}未经%
            本论文作者的导师同意{\c__nwafu_fwid_comma_tl}不得有对本论文进行复制%
            {\c__nwafu_ideo_comma_tl}修改{\c__nwafu_ideo_comma_tl}发行{\c__nwafu_ideo_comma_tl}%
            出租{\c__nwafu_ideo_comma_tl}改编等侵犯著作权的行为{\c__nwafu_fwid_comma_tl}%
            否则{\c__nwafu_fwid_comma_tl}按违背{\c__nwafu_fwid_left_title_tl}中华人民%
            共和国著作权法{\c__nwafu_fwid_right_title_tl}%
            等有关规定处理并追究法律责任{\c__nwafu_ideo_full_stop_tl}%
          }
      }
  }
\__nwafu_auth_orig_decl_text:
\cs_new_protected:Npn \__nwafu_orig_decl_sign:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \tl_const:Nn \c__nwafu_orig_decl_sign_tl  { 研究生签名 }
        \tl_const:Nn \c__nwafu_super_decl_sign_tl { 导师签名   }
      }{
        \tl_const:Nn \c__nwafu_orig_decl_sign_tl  { 本科生签名   }
        \tl_const:Nn \c__nwafu_super_decl_sign_tl { 指导教师签名 }
      }
  }
\__nwafu_orig_decl_sign:
\clist_const:Nn \c__nwafu_thesis_type_clist
  { 博士学位论文, 硕士学位论文, 本科毕业 }
\clist_const:Nn \c__nwafu_postgraduate_type_clist
  { 学术学位, 专业学位 }
\clist_const:Nn \c__nwafu_bachelor_type_clist
  { 论文, 设计 }
\clist_const:Nn \c__nwafu_secret_clist { 公开, 限制, 秘密 }
\cs_new_protected:Npn \__nwafu_define_name_const_zh:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \clist_map_inline:nn
          {
            { secret_level    } { 密级                             },
            { udc             } { UDC                              },
            { school_id       } { 学校代码                         },
            { instructors     } { 指导小组                         },
            { ack             } { 致 \quad 谢                      },
            { toc             } { 目 \quad 录                      },
            { student_id      } { 研究生学号                       },
            { orig_decl       } { 研究生学位论文的独创性声明       },
            { super_decl      } { 导师指导研究生学位论文的承诺     },
            { auth_decl       } { 关于研究生学位论文使用授权的说明 },
            { resume          } { 个人简历                         },
            { lof             } { 插图目录                         },
            { lot             } { 表格目录                         },
          }
          { \__nwafu_define_name:nn ##1 }
       }{
        \clist_map_inline:nn
          {
            { ack             } { 致谢                           },
            { department      } { 培养单位                       },
            { bachelor_title  } { 申请学位类别                   },
            { major           } { 专业名称                       },
            { student_id      } { 学号                           },
            { authorbrief     } { 作者                           },
            { author          } { 学生姓名                       },
            { cosupervisor    } { 合作指导教师                   },
            { resume          } { 作者简历                       },
            { date            } { 完成日期                       },
            { toc             } { 目次                           },
            { notation        } { 主要符号注释表                 },
            { terminology     } { 术语表                         },
            { figtabtoc       } { 插图和附表清单                 },
            { orig_decl       } { 本科生毕业\clist_item:Nn
                                  \c__nwafu_bachelor_type_clist {
                                  \g__nwafu_info_bachelor_type_int
                                  }的原创性声明                  },
            { auth_decl       } { 本科生毕业\clist_item:Nn
                                  \c__nwafu_bachelor_type_clist {
                                  \g__nwafu_info_bachelor_type_int
                                  }的使用授权说明                }
          }
          { \__nwafu_define_name:nn ##1 }
      }
  }
\__nwafu_define_name_const_zh:
\cs_new_protected:Npn \__nwafu_define_name_const_zh_en:
  {
    \clist_map_inline:nn
      {
        { supervisor  } { 指导教师   } { Supervisor },
        { anonid      } { ********** } { ********** },
        { anonname    } { ********** } { ********** },
        { anonhead    } { ********** } { ********** },
        { bib_en      } { 参考文献   } { Bibliography },
        { pdf_creator } { 西北农林科技大学\LaTeX{}模板 }{ \LaTeX{}~ with~ nwafuthesis~ class },
      }
      { \__nwafu_define_name:nnn ##1 }

    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \clist_map_inline:nn
          {
            { department        } { 培养单位       } { Colleges             },
            { major             } { 学科专业       } { Major                },
            { engineering_title } { 专业学位类别   } { Degree~ Type         },
            { engineeringfield  } { 专业学位领域   } { Field                },
            { author            } { 论文作者       } { Candidate            },
            { cosupervisor      } { 合作指导教师   } { Co-Supervisor        },
            { date              } { 论文提交时间   } { Date~ of~ Submission },
            { abstract          } { 摘 \quad 要    } { ABSTRACT             },
            { keywords          } { 关键词         } { KEY~WORDS            },
            { clc               } { 分类号         } { CLC~ number:         },
            { notation          } { 主要符号对照表 } { List~ of~ Symbols    }
          }
          { \__nwafu_define_name:nnn ##1 }
      }{
        \clist_map_inline:nn
          {
            { abstract    } { 摘要           } { ABSTRACT              },
            { keywords    } { 关键词         } { KEY~WORDS             },
          }
          { \__nwafu_define_name:nnn ##1 }
      }
  }
\__nwafu_define_name_const_zh_en:
\clist_map_inline:nn
  {
    { proof      } { 证明 } { Proof      },
    { axiom      } { 公理 } { Axiom      },
    { corollary  } { 推论 } { Corollary  },
    { definition } { 定义 } { Definition },
    { example    } { 例   } { Example    },
    { lemma      } { 引理 } { Lemma      },
    { theorem    } { 定理 } { Theorem    }
  }
  { \__nwafu_define_name:nnn #1 }
\PassOptionsToClass
  {
    UTF8,
    heading    = true,
    fontset    = none,
    zihao      = -4,
    linespread = \c__nwafu_line_spread_fp,
    \g__nwafu_to_ctexbook_clist
  }
  { ctexbook }
\LoadClass { ctexbook }
\clist_map_inline:nn
  {
    { shortlabels       } { enumitem  },
    { no-math           } { fontspec  },
    { perpage           } { footmisc  },
    { amsmath, thmmarks } { ntheorem  },
    { list=off          } { bicaption }
  }
  { \PassOptionsToPackage #1 }
\RequirePackage
  {
    amsmath,
    unicode-math,
    geometry,
    fancyhdr,
    titletoc,
    footmisc,
    ntheorem,
    enumitem,
    graphicx,
    caption,
    bicaption,
    tabularray,
    booktabs,
    xcolor,
  }
\cs_new_protected:Npn \__nwafu_check_package:nnn #1#2#3
  {
    \@ifpackagelater {#1} {#2}
      { } { \__nwafu_error:nnnn { package-too-old } { Package } {#1} {#3} }
  }
\cs_new_protected:Npn \__nwafu_check_class:nnn #1#2#3
  {
    \@ifclasslater {#1} {#2}
      { } { \__nwafu_error:nnnn { package-too-old } { Class } {#1} {#3} }
  }
\__nwafu_msg_new:nn { package-too-old }
  {
    #1~ "#2"~ is~ too~ old. \\
    The~ nwafuthesis~ class~ only~ supports~ "#2" \\
    with~ a~ version~ higher~ than~ v#3. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ it \\
    using~ your~ TeX~ package~ manager~ or~ from~ CTAN.
  }
\__nwafu_check_class:nnn { ctexbook } { 2021/03/14 } { 2.5.6 }
\sys_if_engine_xetex:T
  { \__nwafu_check_package:nnn { xeCJK } { 2020/05/01 } { 3.8.3 } }
\cs_new_protected:Npn \__nwafu_thesis_geometry:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \geometry
          {
            paper         = a4paper,
            top           = 1.45cm,
            bottom        = 2.60cm,
            left          = 2.60cm,
            right         = 2.60cm,
            bindingoffset = 0.00cm,
            headheight    = 0.80cm,
            headsep       = 0.70cm,
            footskip      = 0.75cm,
            includehead,
            includefoot,
          }
      }{
        \geometry
          {
            paper         = a4paper,
            top           = 1.45cm,
            bottom        = 2.60cm,
            left          = 2.60cm,
            right         = 2.60cm,
            bindingoffset = 0.00cm,
            headheight    = 0.80cm,
            headsep       = 0.70cm,
            footskip      = 0.75cm,
            includehead,
            includefoot,
          }
      }
  }
\__nwafu_thesis_geometry:
\bool_if:NT \g__nwafu_draft_bool { \geometry { showframe } }
\tl_new:N \g__nwafu_fontset_tl
\tl_new:N \g__nwafu_cjk_fontset_tl
\keys_define:nn { nwafu / style }
  {
    font .choices:nn =
      { garamond, libertinus, lm, palatino, times, times*, none }
      { \tl_gset_eq:NN \g__nwafu_fontset_tl \l_keys_choice_tl }
  }
\keys_define:nn { nwafu / style }
  {
    cjk-font .choices:nn =
      { adobe, fandol, founder, mac, sinotype, sourcehan, windows, none }
      { \tl_gset_eq:NN \g__nwafu_cjk_fontset_tl \l_keys_choice_tl }
  }
\cs_new_protected:Npn \__nwafu_setmainfont:nn #1#2
  { \__fontspec_main_setmainfont:nn {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setsansfont:nn #1#2
  { \__fontspec_main_setsansfont:nn {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setmonofont:nn #1#2
  { \__fontspec_main_setmonofont:nn {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setmathfont:nn #1#2
  { \__um_setmathfont:nn {#2} {#1} }
\cs_generate_variant:Nn \__nwafu_setmainfont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setsansfont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setmonofont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setmathfont:nn { xx }
\cs_new_protected:Npn \__nwafu_setCJKmainfont:nn #1#2
  { \__nwafu_set_family:xnn { \CJKrmdefault } {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setCJKsansfont:nn #1#2
  { \__nwafu_set_family:xnn { \CJKsfdefault } {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setCJKmonofont:nn #1#2
  { \__nwafu_set_family:xnn { \CJKttdefault } {#2} {#1} }
\cs_generate_variant:Nn \__nwafu_setCJKmainfont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setCJKsansfont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setCJKmonofont:nn { xx }
\cs_new_protected:Npn \__nwafu_set_cjk_font_hei:nn #1#2
  { \__nwafu_set_family:nnn { nwafu@hei } {#2} {#1} }
\cs_generate_variant:Nn \__nwafu_set_cjk_font_hei:nn { xx }
\cs_new_protected:Npn \nwafu@hei
  { \__nwafu_switch_family:n { nwafu@hei } }
\cs_new_protected:Npn \__nwafu_set_cjk_font_kai:nn #1#2
  { \__nwafu_set_family:nnn { nwafu@kai } {#2} {#1} }
\cs_generate_variant:Nn \__nwafu_set_cjk_font_kai:nn { xx }
\cs_new_protected:Npn \nwafu@kai
  { \__nwafu_switch_family:n { nwafu@kai } }
\tl_const:Nn \__nwafu_cjk_font_options:
 { UprightFont = *, ItalicFont = *, AutoFakeBold = true }
\tl_const:Nn \__nwafu_cjk_font_hei_options:
 { UprightFont = *, ItalicFont = *, AutoFakeBold = false }
\cs_new_protected:Npx \__nwafu_setCJKmainfont:n   #1
  { \__nwafu_setCJKmainfont:nn   {#1} { \__nwafu_cjk_font_options: } }
\cs_new_protected:Npx \__nwafu_setCJKsansfont:n   #1
  { \__nwafu_setCJKsansfont:nn   {#1} { \__nwafu_cjk_font_hei_options: } }
\cs_new_protected:Npx \__nwafu_setCJKmonofont:n   #1
  { \__nwafu_setCJKmonofont:nn   {#1} { \__nwafu_cjk_font_options: } }
\cs_new_protected:Npx \__nwafu_set_cjk_font_hei:n #1
  { \__nwafu_set_cjk_font_hei:nn {#1} { \__nwafu_cjk_font_hei_options: } }
\cs_new_protected:Npx \__nwafu_set_cjk_font_kai:n #1
  { \__nwafu_set_cjk_font_kai:nn {#1} { \__nwafu_cjk_font_options: } }
\sys_if_engine_xetex:TF
  {
    \cs_new_eq:NN \__nwafu_set_family:nnn  \xeCJK_set_family:nnn
    \cs_new_eq:NN \__nwafu_switch_family:n \xeCJK_switch_family:n
  }
  {
    \cs_new_eq:NN \__nwafu_set_family:nnn  \ctex_ltj_set_family:nnn
    \cs_new_eq:NN \__nwafu_switch_family:n \ctex_ltj_switch_family:n
  }
\cs_generate_variant:Nn \__nwafu_set_family:nnn { x }
\cs_new_protected:Npn \__nwafu_set_font_helper:n #1
  {
    \exp_args:Nc \RenewDocumentCommand { set #1 font } { O { } m O { } }
      {
        \ctex_at_end_preamble:n
          { \use:c { __nwafu_set #1 font:nn } {##2} { ##1, ##3 } }
      }
  }
\clist_map_inline:nn { main, sans, mono, math    } { \__nwafu_set_font_helper:n {#1} }
\clist_map_inline:nn { CJKmain, CJKsans, CJKmono } { \__nwafu_set_font_helper:n {#1} }
\tl_new:N \g__nwafu_font_family_libertinus_serif_tl
\tl_new:N \g__nwafu_font_family_libertinus_sans_tl
\tl_new:N \g__nwafu_font_style_libertinus_rm_tl
\tl_new:N \g__nwafu_font_style_libertinus_bf_tl
\tl_new:N \g__nwafu_font_style_libertinus_it_tl
\tl_new:N \g__nwafu_font_style_libertinus_bfit_tl
\tl_new:N \g__nwafu_font_style_libertinus_bfsl_tl
\tl_new:N \g__nwafu_font_family_xits_tl
\tl_new:N \g__nwafu_font_style_xits_rm_tl
\tl_new:N \g__nwafu_font_style_xits_bf_tl
\tl_new:N \g__nwafu_font_style_xits_it_tl
\tl_new:N \g__nwafu_font_style_xits_bfit_tl
\tl_new:N \g__nwafu_font_name_libertinus_serif_tl
\tl_new:N \g__nwafu_font_name_libertinus_sans_tl
\tl_new:N \g__nwafu_font_name_libertinus_math_tl
\tl_new:N \g__nwafu_font_name_libertinus_math_bf_tl
\tl_new:N \g__nwafu_font_name_xits_tl
\tl_new:N \g__nwafu_font_name_xits_math_rm_tl
\tl_new:N \g__nwafu_font_name_xits_math_bf_tl
\fontspec_font_if_exist:nTF { LibertinusSerif-Regular.otf }
  {
    \tl_gset:Nn \g__nwafu_font_family_libertinus_serif_tl { LibertinusSerif     }
    \tl_gset:Nn \g__nwafu_font_family_libertinus_sans_tl  { LibertinusSans      }
    \tl_gset:Nn \g__nwafu_font_family_libertinus_math_tl  { LibertinusMath      }
    \tl_gset:Nn \g__nwafu_font_name_libertinus_math_bf_tl { LibertinusMath-Bold }
    \tl_gset:Nn \g__nwafu_font_style_libertinus_rm_tl     { Regular             }
    \tl_gset:Nn \g__nwafu_font_style_libertinus_bf_tl     { Bold                }
    \tl_gset:Nn \g__nwafu_font_style_libertinus_it_tl     { Italic              }
    \tl_gset:Nn \g__nwafu_font_style_libertinus_bfit_tl   { BoldItalic          }
    \fontspec_font_if_exist:nTF { LibertinusSans-BoldOblique.otf }
      { \tl_gset:Nn \g__nwafu_font_style_libertinus_bfsl_tl { BoldOblique } }
      { \tl_gset:Nn \g__nwafu_font_style_libertinus_bfsl_tl { Bold        } }
  }
  {
    \tl_gset:Nn \g__nwafu_font_family_libertinus_serif_tl { libertinusserif     }
    \tl_gset:Nn \g__nwafu_font_family_libertinus_sans_tl  { libertinussans      }
    \tl_gset:Nn \g__nwafu_font_family_libertinus_math_tl  { libertinusmath      }
    \tl_gset:Nn \g__nwafu_font_name_libertinus_math_bf_tl { libertinusmath-bold }
    \tl_gset:Nn \g__nwafu_font_style_libertinus_rm_tl     { regular             }
    \tl_gset:Nn \g__nwafu_font_style_libertinus_bf_tl     { bold                }
    \tl_gset:Nn \g__nwafu_font_style_libertinus_it_tl     { italic              }
    \tl_gset:Nn \g__nwafu_font_style_libertinus_bfit_tl   { bolditalic          }
    \tl_gset:Nn \g__nwafu_font_style_libertinus_bfsl_tl   { bolditalic          }
  }
\fontspec_font_if_exist:nTF { XITS-Regular.otf }
  {
    \tl_gset:Nn \g__nwafu_font_family_xits_tl        { XITS             }
    \tl_gset:Nn \g__nwafu_font_style_xits_rm_tl      { Regular          }
    \tl_gset:Nn \g__nwafu_font_style_xits_bf_tl      { Bold             }
    \tl_gset:Nn \g__nwafu_font_style_xits_it_tl      { Italic           }
    \tl_gset:Nn \g__nwafu_font_style_xits_bfit_tl    { BoldItalic       }
    \tl_gset:Nn \g__nwafu_font_name_xits_math_rm_tl  { XITSMath-Regular }
    \tl_gset:Nn \g__nwafu_font_name_xits_math_bf_tl  { XITSMath-Bold    }
  }
  {
    \tl_gset:Nn \g__nwafu_font_family_xits_tl        { xits          }
    \tl_gset:Nn \g__nwafu_font_style_xits_rm_tl      { regular       }
    \tl_gset:Nn \g__nwafu_font_style_xits_bf_tl      { bold          }
    \tl_gset:Nn \g__nwafu_font_style_xits_it_tl      { italic        }
    \tl_gset:Nn \g__nwafu_font_style_xits_bfit_tl    { bolditalic    }
    \tl_gset:Nn \g__nwafu_font_name_xits_math_rm_tl  { xits-math     }
    \tl_gset:Nn \g__nwafu_font_name_xits_math_bf_tl  { xits-mathbold }
  }
\tl_gset:Nx \g__nwafu_font_name_libertinus_serif_tl
  { \g__nwafu_font_family_libertinus_serif_tl - \g__nwafu_font_style_libertinus_rm_tl }
\tl_gset:Nx \g__nwafu_font_name_libertinus_sans_tl
  { \g__nwafu_font_family_libertinus_sans_tl  - \g__nwafu_font_style_libertinus_rm_tl }
\tl_gset:Nx \g__nwafu_font_name_libertinus_math_tl
  { \g__nwafu_font_family_libertinus_math_tl  - \g__nwafu_font_style_libertinus_rm_tl }
\tl_gset:Nx \g__nwafu_font_name_xits_tl
  { \g__nwafu_font_family_xits_tl - \g__nwafu_font_style_xits_rm_tl }
\clist_const:Nn \c__nwafu_font_garamond_clist
  {
    { main } { EBGaramond }
      { Extension = .otf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic },
    { sans } { \g__nwafu_font_family_libertinus_sans_tl }
      { Extension = .otf,
        UprightFont = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfsl_tl },
    { mono } { lmmonolt10 }
      { Extension = .otf,
        UprightFont = *-regular,
        BoldFont = *-bold,
        ItalicFont = *-oblique,
        BoldItalicFont = *-boldoblique },
    { math } { Garamond-Math.otf }
      { BoldFont = Garamond-Math.otf,
        BoldFeatures = { FakeBold = 1.6 } }
  }
\clist_const:Nn \c__nwafu_font_libertinus_clist
  {
    { main } { \g__nwafu_font_family_libertinus_serif_tl }
      { Extension = .otf,
        UprightFont = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfit_tl },
    { sans } { \g__nwafu_font_family_libertinus_sans_tl }
      { Extension = .otf,
        UprightFont = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfsl_tl },
    { mono } { lmmonolt10 }
      { Extension = .otf,
        UprightFont = *-regular,
        BoldFont = *-bold,
        ItalicFont = *-oblique,
        BoldItalicFont = *-boldoblique },
    { math } { \g__nwafu_font_name_libertinus_math_tl .otf }
      { BoldFont = \g__nwafu_font_name_libertinus_math_tl .otf,
        BoldFeatures = { FakeBold = 1.6 } }
  }
\clist_const:Nn \c__nwafu_font_lm_clist
  {
    { math } { latinmodern-math.otf }
      {BoldFont       = latinmodern-math.otf,
       BoldFeatures   = { RawFeature = { embolden = 3 } },
       BoldItalicFont = latinmodern-math.otf,
       BoldItalicFeatures = { RawFeature = { embolden = 3 } }}
  }
\clist_const:Nn \c__nwafu_font_palatino_clist
  {
    { main } { texgyrepagella }
      { Extension = .otf,
        UprightFont = *-regular,
        BoldFont = *-bold,
        ItalicFont = *-italic,
        BoldItalicFont = *-bolditalic },
    { sans } { \g__nwafu_font_family_libertinus_sans_tl }
      { Extension = .otf,
        UprightFont = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfsl_tl,
        Scale = MatchUppercase },
    { mono } { lmmonolt10 }
      { Extension = .otf,
        UprightFont = *-regular,
        BoldFont = *-bold,
        ItalicFont = *-oblique,
        BoldItalicFont = *-boldoblique },
    { math } { texgyrepagella-math.otf }
      { BoldFont = texgyrepagella-math.otf,
        BoldFeatures = { FakeBold = 1.6 } }
  }
\clist_const:Nn \c__nwafu_font_times_clist
  {
    { main } { \g__nwafu_font_family_xits_tl }
      { Extension = .otf,
        UprightFont = *-\g__nwafu_font_style_xits_rm_tl,
        BoldFont = *-\g__nwafu_font_style_xits_bf_tl,
        ItalicFont = *-\g__nwafu_font_style_xits_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_xits_bfit_tl },
    { sans } { texgyreheros }
      { Extension = .otf,
        UprightFont = *-regular,
        BoldFont = *-bold,
        ItalicFont = *-italic,
        BoldItalicFont = *-bolditalic },
    { mono } { texgyrecursor }
      { Extension = .otf,
        UprightFont = *-regular,
        BoldFont = *-bold,
        ItalicFont = *-italic,
        BoldItalicFont = *-bolditalic,
        Ligatures = CommonOff },
    { math } { \g__nwafu_font_name_xits_math_rm_tl .otf }
      { BoldFont = \g__nwafu_font_name_xits_math_bf_tl .otf }
  }
\clist_const:Nn \c__nwafu_font_times_asterisk_clist
  {
    { main } { Times~ New~ Roman } { },
    { sans } { Arial } { },
    { mono } { Courier~ New } { },
    { math } { \g__nwafu_font_name_xits_math_rm_tl .otf }
      { BoldFont = \g__nwafu_font_name_xits_math_bf_tl .otf }
  }
\cs_new_protected:Npn \__nwafu_load_font_by_family:nn #1#2
  {
    \str_case:nnF {#1}
      {
        { main } { \__nwafu_setmainfont:xx {#2} { \l__nwafu_tmpa_tl } }
        { sans } { \__nwafu_setsansfont:xx {#2} { \l__nwafu_tmpa_tl } }
        { mono } { \__nwafu_setmonofont:xx {#2} { \l__nwafu_tmpa_tl } }
        { math } { \__nwafu_setmathfont:xx {#2} { \l__nwafu_tmpa_tl } }
      }
      { \msg_error:nnn { nwafuthesis } { unknown-font-family } {#1} }
  }
\cs_new_protected:Npn \__nwafu_load_font_by_family:nnn #1#2#3
  {
    \tl_set:Nx \l__nwafu_tmpa_tl { #3 }
    \__nwafu_load_font_by_family:nn { #1 } { #2 }
  }
\msg_new:nnn { nwafuthesis } { unknown-font-family }
  { Unknown~ font~ family~ "#1". }
\cs_new_protected:Npn \__nwafu_load_fontset:n #1
  {
    \clist_map_inline:cn { c__nwafu_font_ #1 _clist }
      {
        \__nwafu_load_font_by_family:nnn ##1
      }
  }
\cs_generate_variant:Nn \__nwafu_load_fontset:n { V }
\clist_const:Nn \c__nwafu_cjk_font_adobe_clist
  {
    { main } { AdobeSongStd-Light       } { },
    { sans } { AdobeHeitiStd-Regular    } { },
    { mono } { AdobeFangsongStd-Regular } { },
    { hei  } { AdobeHeitiStd-Regular    } { },
    { kai  } { AdobeKaitiStd-Regular    } { }
  }
\clist_const:Nn \c__nwafu_cjk_font_fandol_clist
  {
    { main } { FandolSong }
      { Extension = .otf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Regular,
        BoldItalicFont = *-Bold },
    { sans } { FandolHei }
      { Extension = .otf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Regular,
        BoldItalicFont = *-Bold },
    { mono } { FandolFang }
      { Extension = .otf,
        UprightFont = *-Regular,
        BoldFont = *-Regular,
        ItalicFont = *-Regular,
        BoldItalicFont = *-Regular },
    { hei  } { FandolHei }
      { Extension = .otf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Regular,
        BoldItalicFont = *-Bold },
    { kai  } { FandolKai }
      { Extension = .otf,
        UprightFont = *-Regular,
        BoldFont = *-Regular,
        ItalicFont = *-Regular,
        BoldItalicFont = *-Regular }
  }
\clist_const:Nn \c__nwafu_cjk_font_founder_clist
  {
    { main } { FZShuSong-Z01  } { },
    { sans } { FZHei-B01      } { },
    { mono } { FZFangSong-Z02 } { },
    { hei  } { FZHei-B01      } { },
    { kai  } { FZKai-Z03      } { }
  }
\clist_const:Nn \c__nwafu_cjk_font_mac_clist
  {
    { main } { STSongti-SC }
      { UprightFont = *-Light,
        BoldFont = *-Bold,
        ItalicFont = *-Light,
        BoldItalicFont = *-Bold },
    { sans } { STHeitiSC }
      { UprightFont = *-Medium,
        BoldFont = *-Medium,
        ItalicFont = *-Medium,
        BoldItalicFont = *-Medium },
    { mono } { STFangsong }  { },
    { hei  } { STHeitiSC }
      { UprightFont = *-Medium,
        BoldFont = *-Medium,
        ItalicFont = *-Medium,
        BoldItalicFont = *-Medium },
    { kai  } { STKaitiSC }
      { UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Regular,
        BoldItalicFont = *-Bold }
  }
\clist_const:Nn \c__nwafu_cjk_font_sinotype_clist
  {
    { main } { STSong     } { },
    { sans } { STHeiti    } { },
    { mono } { STFangsong } { },
    { hei  } { STHeiti    } { },
    { kai  } { STKaiti    } { }
  }
\clist_const:Nn \c__nwafu_cjk_font_sourcehan_clist
  {
    { main } { Source~ Han~ Serif~ SC }
      { UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Regular,
        BoldItalicFont = *-Bold },
    { sans } { Source~ Han~ Sans~ SC }
      { UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Regular,
        BoldItalicFont = *-Bold }
  }
\clist_const:Nn \c__nwafu_cjk_font_windows_clist
  {
    { main } { SimSun   } { },
    { sans } { SimHei   } { },
    { mono } { FangSong } { },
    { hei  } { SimHei   } { },
    { kai  } { KaiTi    } { }
  }
\cs_new_protected:Npn \__nwafu_load_cjk_font_by_family:nn #1#2
  {
    \str_case:nnF {#1}
      {
        { main } { \__nwafu_setCJKmainfont:xx   {#2} { \__nwafu_cjk_font_options:     } }
        { sans } { \__nwafu_setCJKsansfont:xx   {#2} { \__nwafu_cjk_font_hei_options: } }
        { mono } { \__nwafu_setCJKmonofont:xx   {#2} { \__nwafu_cjk_font_options:     } }
        { hei  } { \__nwafu_set_cjk_font_hei:xx {#2} { \__nwafu_cjk_font_hei_options: } }
        { kai  } { \__nwafu_set_cjk_font_kai:xx {#2} { \__nwafu_cjk_font_options:     } }
      }
      { \msg_error:nnn { nwafuthesis } { unknown-cjk-family } {#1} }
  }
\cs_new_protected:Npn \__nwafu_load_cjk_font_by_family:nnn #1#2#3
  {
    \__nwafu_load_cjk_font_by_family:nn { #1 } { #2 }
  }
\msg_new:nnn { nwafuthesis } { unknown-cjk-family }
  { Unknown~ CJK~ font~ family~ "#1". }
\cs_new_protected:Npn \__nwafu_load_cjk_fontset:n #1
  {
    \clist_map_inline:cn { c__nwafu_cjk_font_ #1 _clist }
      {
        \__nwafu_load_cjk_font_by_family:nnn ##1
      }
    \str_if_eq:nnT {#1} { sourcehan }
      { \__nwafu_warning:n { source-han } }
  }
\cs_generate_variant:Nn \__nwafu_load_cjk_fontset:n { V }
\tl_new:N \l__nwafu_font_tl
\tl_new:N \l__nwafu_cjkfont_tl
\cs_new_protected:Npn \__nwafu_detect_platform:
  {
    \sys_if_platform_windows:TF
      {
        \tl_set:Nn \l__nwafu_cjkfont_tl { windows }
        \tl_set:Nn \l__nwafu_font_tl    { times*  }
      }
      {
        \__nwafu_if_platform_macos:TF
          {
            \tl_set:Nn \l__nwafu_cjkfont_tl { mac    }
            \tl_set:Nn \l__nwafu_font_tl    { times* }
          }{
            \tl_set:Nn \l__nwafu_cjkfont_tl { fandol }
            \tl_set:Nn \l__nwafu_font_tl    { times  }
          }
      }
  }
\cs_new_protected:Npn \__nwafu_if_platform_macos:TF
  { \file_if_exist:nTF { /System/Library/Fonts/Menlo.ttc } }
\cs_new_protected:Npn \__nwafu_load_font:
  {
    \tl_if_empty:NT \g__nwafu_fontset_tl
      {
        \__nwafu_detect_platform:
        \tl_gset_eq:NN \g__nwafu_fontset_tl \l__nwafu_font_tl
      }
    \tl_if_empty:NT \g__nwafu_cjk_fontset_tl
      {
        \__nwafu_detect_platform:
        \tl_gset_eq:NN \g__nwafu_cjk_fontset_tl \l__nwafu_cjkfont_tl
      }
    \tl_set_eq:NN \l__nwafu_tmpa_tl { \g__nwafu_fontset_tl }
    \tl_if_eq:VnTF \l__nwafu_tmpa_tl { none }
      { }
      {
        \tl_replace_all:Nnn \l__nwafu_tmpa_tl { * } { _asterisk }
        \__nwafu_load_fontset:V \l__nwafu_tmpa_tl
      }
    \tl_set_eq:NN \l__nwafu_tmpa_tl \g__nwafu_cjk_fontset_tl
    \tl_if_eq:VnTF \l__nwafu_tmpa_tl { none }
      { }  % none 表示用户自行配置，跳过
      {
        \__nwafu_load_cjk_fontset:n { \g__nwafu_cjk_fontset_tl }
      }
  }
\ctex_at_end_preamble:n { \__nwafu_load_font: }
\keys_set:nn { unicode-math }
  {
    math-style = ISO,
    bold-style = ISO,
  }
\keys_define:nn { nwafu / style }
  {
    font-size .choice:,
    font-size .value_required:n = true,
    font-size / -4 .code:n = { },
    font-size /  5 .code:n =
      {
        \RenewDocumentCommand \tiny         { } { \zihao {  7 } }
        \RenewDocumentCommand \scriptsize   { } { \zihao { -6 } }
        \RenewDocumentCommand \footnotesize { } { \zihao {  6 } }
        \RenewDocumentCommand \small        { } { \zihao { -5 } }
        \RenewDocumentCommand \normalsize   { } { \zihao {  5 } }
        \RenewDocumentCommand \large        { } { \zihao { -4 } }
        \RenewDocumentCommand \Large        { } { \zihao { -3 } }
        \RenewDocumentCommand \LARGE        { } { \zihao { -2 } }
        \RenewDocumentCommand \huge         { } { \zihao {  2 } }
        \RenewDocumentCommand \Huge         { } { \zihao {  1 } }
      },
    fullwidth-stop .choice:,
    fullwidth-stop .value_required:n = true,
    fullwidth-stop / catcode .code:n =
      { \__nwafu_set_fullwidth_stop_catcode: },
    fullwidth-stop / mapping .code:n =
      {
        \sys_if_engine_xetex:TF
          {
            \clist_gset:Nn \g__xeCJK_default_features_clist
              { Mapping = fullwidth-stop }
          }
          {
            \sys_if_engine_luatex:T
              {
                \__nwafu_warning:n { mapping-not-available }
                \__nwafu_set_fullwidth_stop_catcode:
              }
          }
      },
    fullwidth-stop / false .code:n = { }
  }
\__nwafu_msg_new:nn { mapping-not-available }
  {
    Option~ "fullwidth-stop = mapping"~ is~ not~ available~ in~ LuaTeX. \\
    "fullwidth-stop = catcode"~ will~ be~ set~ instead.
  }
\cs_new:Npn \__nwafu_set_fullwidth_stop_catcode:
  {
    \char_set_active_eq:NN ^^^^3002 \c__nwafu_fwid_full_stop_tl
    \char_set_catcode_active:N ^^^^3002
    \clist_map_inline:nn
      { \c__nwafu_orig_decl_text_tl, \c__nwafu_auth_decl_text_tl }
      { \tl_set_rescan:Nno ##1 { } {##1} }
  }
\DeclareEmphSequence
  {
    \bfseries,
    \upshape \CJKfamily { \CJKfamilydefault },
  }
\keys_define:nn { nwafu / style }
  {
    anonymous .bool_gset:N = \g__nwafu_anonymous_bool,
    anonymous .default:n  = true,
    anonymous .initial:n  = false,
  }
\fancyhf { }
\cs_new:Npn \__nwafu_university_name:
  {
    \bool_if:NTF \g__nwafu_anonymous_bool
      { **************** }
      { \__nwafu_name_simp: }
  }
\cs_new:Npn \__nwafu_thesis_type_name:
  {
    \clist_item:Nn \c__nwafu_thesis_type_clist { \g__nwafu_thesis_type_int }
    \int_compare:nNnT { \g__nwafu_thesis_type_int } = { 3 }
      { \clist_item:Nn \c__nwafu_bachelor_type_clist { \g__nwafu_info_bachelor_type_int } }
  }
\cs_new:Npn \__nwafu_header_odd:
  { \small \nouppercase { \leftmark } }
\cs_new:Npn \__nwafu_header_even:
  {
    \small \nouppercase
      {
        \__nwafu_university_name:
        \__nwafu_thesis_type_name:
      }
  }
\cs_new:Npn \__nwafu_header_center:
  { \small \nouppercase { \g__nwafu_header_center_mark_tl } }
\cs_new:Npn \__nwafu_footer_page: { \small \thepage }
\cs_new_protected:Npn \__nwafu_set_headrule_front:
  { \RenewDocumentCommand \headrulewidth { } { 0.75 pt } }
\cs_new_protected:Npn \__nwafu_set_headrule_main:
  { \RenewDocumentCommand \headrulewidth { } { 0.75 pt } }
\cs_new_protected:Npn \__nwafu_set_header_footer_twoside:
  {
    \nwafuhead[OC] { \__nwafu_header_odd: }
    \nwafuhead[EC] { \__nwafu_header_even: }
    \nwafufoot[C]  { \__nwafu_footer_page: }
  }
\cs_new_protected:Npn \__nwafu_set_header_footer_oneside:
  {
    \nwafuhead[C] { \__nwafu_header_center: }
    \nwafufoot[C] { \__nwafu_footer_page: }
  }
\cs_new_protected:Npn \__nwafu_apply_header_footer:
  {
    \bool_if:NTF \g__nwafu_twoside_bool
      { \__nwafu_set_header_footer_twoside: }
      { \__nwafu_set_header_footer_oneside: }
  }
\tl_new:N \g__nwafu_header_center_mark_tl
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__nwafu_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle{ empty } \newpage }
      }
    \tl_gset:Nn \g__nwafu_header_center_mark_tl { }
  }
\pagestyle { fancy }
\cs_gset_eq:NN \nwafuhead \fancyhead
\cs_gset_eq:NN \nwafufoot \fancyfoot
\RenewDocumentCommand{\frontmatter}{s O{Roman}}
  {
    \IfBooleanTF{#1}{\clearpage}{\cleardoublepage}
    \@mainmatterfalse
    \__nwafu_set_headrule_front:
    \pagenumbering{#2}
    \__nwafu_apply_header_footer:
  }
\RenewDocumentCommand{\mainmatter}{s}
  {
    \IfBooleanTF{#1}{\clearpage}{\cleardoublepage}
    \@mainmattertrue
    \pagenumbering{arabic}
    \__nwafu_set_headrule_main:
    \__nwafu_apply_header_footer:
  }
\NewDocumentCommand{\bibmatter}{s}
  {
    \IfBooleanTF{#1}{\clearpage}{\cleardoublepage}
    \@mainmattertrue
    \__nwafu_apply_header_footer:
  }

\__nwafu_appto_cmd:Nn \appendix
  {
    \clearpage
    \bool_if:NTF \g__nwafu_twoside_bool
      {
        \nwafuhead[OC] { \small \nouppercase { 附录 \thechapter } }
        \nwafuhead[EC] { \__nwafu_header_even: }
      }{
        \nwafuhead[C]
          {
            \int_if_odd:nTF \c@page
              { \small \nouppercase { 附录 \thechapter } }
              { \__nwafu_header_even: }
          }
      }
  }

\__nwafu_appto_cmd:Nn \backmatter
  {
    \clearpage
    \bool_if:NTF \g__nwafu_twoside_bool
      {
        \nwafuhead[OC] { \__nwafu_header_odd: }
        \nwafuhead[EC] { \__nwafu_header_even: }
      }{
        \nwafuhead[C]
          {
            \int_if_odd:nTF \c@page
              { \__nwafu_header_odd: }
              { \__nwafu_header_even: }
          }
      }
  }
\keys_define:nn { nwafu / style }
  {
    figtabtoc .bool_gset:N = \g__nwafu_figtabtoc_bool,
    figtabtoc .initial:n  = false,
    figtabtoc .default:n  = true,
  }
\keys_define:nn { nwafu / style }
  {
    withsign .bool_gset:N = \g__nwafu_withsignature_bool,
    withsign .initial:n  = false,
    withsign .default:n  = true,
  }
\cs_new_protected:Npn \__nwafu_ctexset_caption:
  {
    \int_compare:nNnTF{ \g__nwafu_thesis_type_int } < { 3 }
      {
        \keys_set:nn { ctex }
          {
            secnumdepth = 3,
            chapter =
              {
                pagestyle   = fancy,
                aftername   = \hspace*{1.0\ccwd},
                format      = \zihao{3} \normalfont \nwafu@hei \centering,
                beforeskip  = 0.50\baselineskip,
                afterskip   = 1.25\baselineskip,
                number      = \chinese{ chapter },
                fixskip     = true
              },
            section =
              {
                format      = \zihao{-3} \normalfont \nwafu@hei \raggedright,
                beforeskip  = 0.85\baselineskip,
                afterskip   = 0.80\baselineskip,
                fixskip     = true
              },
            subsection =
              {
                format      = \zihao{4} \normalfont \nwafu@hei \raggedright,
                beforeskip  = 0.80\baselineskip,
                fixskip     = true
              },
            subsubsection =
              {
                format      = \zihao{-4} \normalfont \nwafu@hei \raggedright,
                beforeskip  = 0.40\baselineskip,
                afterskip   = 0.40\baselineskip,
                fixskip     = true
              }
          }
      }{
        \keys_set:nn { ctex }
          {
            secnumdepth = 3,
            chapter =
              {
                pagestyle   = fancy,
                number = { \__nwafu_arabic:n { chapter } },
                aftername   = \hspace*{\ccwd},
                format      = \zihao{3} \normalfont \nwafu@hei \centering,
                beforeskip  = 0.25\baselineskip,
                afterskip   = 0.65\baselineskip,
                fixskip     = true
              },
            section =
              {
                aftername   = \hspace*{0.5\ccwd},
                format      = \zihao{4} \normalfont \nwafu@hei \raggedright,
                beforeskip  = 0.60\baselineskip,
                afterskip   = 0.65\baselineskip,
                fixskip     = true,
                afterindent = true,
              },
            subsection =
              {
                aftername   = \hspace*{0.5\ccwd},
                format      = \zihao{-4} \normalfont \nwafu@hei ,
                beforeskip  = 0.60\baselineskip,
                afterskip   = 0.65\baselineskip,
                fixskip     = true,
                afterindent = true,
                % indent      = 2\ccwd,
              },
            subsubsection =
              {
                name        = {{\c__nwafu_fwid_left_paren_tl},{\c__nwafu_fwid_right_paren_tl}},
                aftername   = \hspace*{0.0pt},
                number      = \__nwafu_arabic:n { subsubsection },
                format      = \zihao{-4} \normalfont,
                beforeskip  = 0.60\baselineskip,
                afterskip   = 0.65\baselineskip,
                fixskip     = true,
                % afterindent = true,
                indent      = 2\ccwd,
              }
          }
      }
  }
\__nwafu_ctexset_caption:
\cs_new_protected:Npn \__nwafu_chapter:n #1
  {
    \group_begin:
      \ctexset
        {
          chapter =
            {
              numbering  = false,
              beforeskip = 0.25\baselineskip,
              afterskip  = 0.65\baselineskip
            }
        }
      \chapter {#1}
      \__nwafu_chapter_header:n {#1}
    \group_end:
  }
\cs_generate_variant:Nn \__nwafu_chapter:n { V }
\cs_new_protected:Npn \__nwafu_chapter_no_toc:n #1
  {
    \chapter *           {#1}
    \__nwafu_chapter_header:n {#1}
    \pdfbookmark [0] {#1} { toc }
  }
\cs_generate_variant:Nn \__nwafu_chapter_no_toc:n { V }
\cs_new_protected:Npn \__nwafu_chapter_header:n #1
  {
    \bool_if:NTF \g__nwafu_twoside_bool
      { \markboth {#1} {#1} }
      {
        \markboth { } { }
        \tl_gset:Nn \g__nwafu_header_center_mark_tl {#1}
      }
  }
\clist_map_inline:nn
  {
    { plain            } { plain           },
    { libertinus       } { libertinus      },
    { libertinus_neg   } { libertinus*     },
    { libertinus_sans  } { libertinus-sans },
    { pifont           } { pifont          },
    { pifont_neg       } { pifont*         },
    { pifont_sans      } { pifont-sans     },
    { pifont_sans_neg  } { pifont-sans*    },
    { circled          } { circled         },
    { circled_neg      } { circled*        },
    { circled_sans     } { circled-sans    },
    { circled_sans_neg } { circled-sans*   },
    { xits             } { xits            },
    { xits_sans        } { xits-sans       },
    { xits_sans_neg    } { xits-sans*      }
  }
  { \__nwafu_define_fn_style:nn #1 }
\tl_new:N \l__nwafu_fn_style_tl
\keys_define:nn { nwafu / style }
  {
    footnote-style .choices:nn =
      {
        plain,
        libertinus, libertinus*, libertinus-sans,
        pifont,     pifont*,     pifont-sans,     pifont-sans*,
        circled,    circled*,    circled-sans,    circled-sans*,
        xits,                    xits-sans,       xits-sans*
      }
      {
        \tl_gset_eq:NN \l__nwafu_fn_style_tl \l_keys_choice_tl
        \int_compare:nT { 5 <= \l_keys_choice_int <= 12 }
          { \RequirePackage { pifont } }
      },
    footnote-style .value_required:n = true
  }
\cs_new:Npn \__nwafu_fn_symbol_libertinus:n #1
  {
    \int_compare:nTF { #1 >= 21 }
      {
        \int_compare:nTF { #1 >= 47 }
          { \__nwafu_symbol:n { \int_eval:n { "24B6 - 47 + #1 } } }
          { \__nwafu_symbol:n { \int_eval:n { "24D0 - 21 + #1 } } }
      }
      { \__nwafu_symbol:n { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_new:Npn \__nwafu_fn_symbol_libertinus_neg:n #1
  {
    \int_compare:nTF { #1 >= 11 }
      { \__nwafu_symbol:n { \int_eval:n { "24EB - 11 + #1 } } }
      { \__nwafu_symbol:n { \int_eval:n { "2776 -  1 + #1 } } }
  }
\cs_new_eq:NN \__nwafu_fn_symbol_libertinus_sans:n \__nwafu_fn_symbol_libertinus:n
\cs_new:Npn \__nwafu_fn_symbol_pifont:n #1
  { \ding { \int_eval:n { 171 + #1 } } }
\cs_new:Npn \__nwafu_fn_symbol_pifont_neg:n #1
  { \ding { \int_eval:n { 181 + #1 } } }
\cs_new:Npn \__nwafu_fn_symbol_pifont_sans:n #1
  { \ding { \int_eval:n { 191 + #1 } } }
\cs_new:Npn \__nwafu_fn_symbol_pifont_sans_neg:n #1
  { \ding { \int_eval:n { 201 + #1 } } }
\cs_new:Npn \__nwafu_fn_symbol_xits:n #1
  {
    \int_compare:nTF { #1 >= 10 }
      {
        \int_compare:nTF { #1 >= 36 }
          { \__nwafu_symbol:n { \int_eval:n { "24B6 - 36 + #1 } } }
          { \__nwafu_symbol:n { \int_eval:n { "24D0 - 10 + #1 } } }
      }
      { \__nwafu_symbol:n { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_new:Npn \__nwafu_fn_symbol_xits_sans:n #1
  { \__nwafu_symbol:n { \int_eval:n { "2780 - 1 + #1 } } }
\cs_new:Npn \__nwafu_fn_symbol_xits_sans_neg:n #1
  { \__nwafu_symbol:n { \int_eval:n { "278A - 1 + #1 } } }
\cs_new:Npn \__nwafu_fn_symbol_circled:n #1
  {
    \int_compare:nTF { #1 > 10 }
      { \@arabic{#1} }
      { \ding { \int_eval:n { 171 + #1 } } }
  }
\cs_new:Npn \__nwafu_fn_symbol_circled_neg:n #1
  {
    \int_compare:nTF { #1 > 10 }
      { \@arabic{#1} }
      { \ding { \int_eval:n { 181 + #1 } } }
  }
\cs_new:Npn \__nwafu_fn_symbol_circled_sans:n #1
  {
    \int_compare:nTF { #1 > 10 }
      { \@arabic{#1} }
      { \ding { \int_eval:n { 191 + #1 } } }
  }
\cs_new:Npn \__nwafu_fn_symbol_circled_sans_neg:n #1
  {
    \int_compare:nTF { #1 > 10 }
      { \@arabic{#1} }
      { \ding { \int_eval:n { 201 + #1 } } }
  }
\cs_set:Npn \thefootnote { \nwafu_footnote_number:N \c@footnote }
\cs_new:Npn \nwafu_footnote_number:N #1
  {
    \tl_case:NnF \l__nwafu_fn_style_tl
      {
        \c__nwafu_fn_style_plain_tl
          { \int_use:N #1 }
        \c__nwafu_fn_style_libertinus_tl
          {
            \fontspec { \g__nwafu_font_name_libertinus_serif_tl .otf }
            \__nwafu_fn_symbol_libertinus:n {#1}
          }
        \c__nwafu_fn_style_libertinus_neg_tl
          {
            \fontspec { \g__nwafu_font_name_libertinus_serif_tl .otf }
            \__nwafu_fn_symbol_libertinus_neg:n {#1}
          }
        \c__nwafu_fn_style_libertinus_sans_tl
          {
            \fontspec { \g__nwafu_font_name_libertinus_sans_tl .otf }
            \__nwafu_fn_symbol_libertinus_sans:n {#1}
          }
        \c__nwafu_fn_style_pifont_tl
          { \__nwafu_fn_symbol_pifont:n {#1} }
        \c__nwafu_fn_style_pifont_neg_tl
          { \__nwafu_fn_symbol_pifont_neg:n {#1} }
        \c__nwafu_fn_style_pifont_sans_tl
          { \__nwafu_fn_symbol_pifont_sans:n {#1} }
        \c__nwafu_fn_style_pifont_sans_neg_tl
          { \__nwafu_fn_symbol_pifont_sans_neg:n {#1} }
        \c__nwafu_fn_style_circled_tl
          {
            \__nwafu_fn_symbol_circled:n {#1}
          }
        \c__nwafu_fn_style_circled_neg_tl
          {
            \__nwafu_fn_symbol_circled_neg:n {#1}
          }
        \c__nwafu_fn_style_circled_sans_tl
          {
            \__nwafu_fn_symbol_circled_sans:n {#1}
          }
        \c__nwafu_fn_style_circled_sans_neg_tl
          {
            \__nwafu_fn_symbol_circled_sans_neg:n {#1}
          }
        \c__nwafu_fn_style_xits_tl
          {
            \fontspec { \g__nwafu_font_name_xits_tl .otf }
            \__nwafu_fn_symbol_xits:n {#1}
          }
        \c__nwafu_fn_style_xits_sans_tl
          {
            \fontspec { \g__nwafu_font_name_xits_tl .otf }
            \__nwafu_fn_symbol_xits_sans:n {#1}
          }
        \c__nwafu_fn_style_xits_sans_neg_tl
          {
            \fontspec { \g__nwafu_font_name_xits_tl .otf }
            \__nwafu_fn_symbol_xits_sans_neg:n {#1}
          }
      }
      { \int_use:N #1 }
  }
\cs_set:Npn \@makefntext #1
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { 1.5 em } { \@thefnmark \hfil }
    #1
  }
\clist_const:Nn \c__nwafu_thm_style_plain_clist
  { plain, margin, change }
\clist_const:Nn \c__nwafu_thm_style_break_clist
  { break, marginbreak, changebreak }
\tl_new:N \l__nwafu_thm_style_tl
\tl_new:N \l__nwafu_thm_header_font_tl
\tl_new:N \l__nwafu_thm_body_font_tl
\tl_new:N \l__nwafu_thm_qed_tl
\tl_new:N \l__nwafu_thm_counter_tl
\keys_define:nn { nwafu / theorem }
  {
    style       .tl_set:N  = \l__nwafu_thm_style_tl,
    header-font .tl_set:N  = \l__nwafu_thm_header_font_tl,
    body-font   .tl_set:N  = \l__nwafu_thm_body_font_tl,
    qed         .tl_set:N  = \l__nwafu_thm_qed_tl,
    counter     .tl_set:N  = \l__nwafu_thm_counter_tl
  }
\cs_new_eq:NN \__nwafu_thm_ntheorem_style:n \theoremstyle
\cs_new_eq:NN \__nwafu_thm_ntheorem_new:w   \newtheorem
\RenewDocumentCommand \newtheorem { s o m m }
  {
    \IfBooleanTF {#1}
      { \tl_set:Nn \l__nwafu_thm_qed_tl { \ensuremath { \QED } } }
      { \tl_set:Nn \l__nwafu_thm_qed_tl { } }
    \tl_set:Nn \l__nwafu_thm_style_tl { plain }
    \IfValueT {#2} { \keys_set:nn { nwafu / theorem } {#2} }
    \nwafu_thm_set_header_font:V \l__nwafu_thm_header_font_tl
    \nwafu_thm_set_body_font:V   \l__nwafu_thm_body_font_tl
    \nwafu_thm_set_qed:V         \l__nwafu_thm_qed_tl
    \IfBooleanTF {#1}
      {
        \clist_if_in:nVF { plain, break } \l__nwafu_thm_style_tl
          {
            \clist_if_in:NVTF
              \c__nwafu_thm_style_plain_clist \l__nwafu_thm_style_tl
              { \__nwafu_thm_redefine_style:n { plain } }
              {
                \clist_if_in:NVTF
                  \c__nwafu_thm_style_break_clist \l__nwafu_thm_style_tl
                  { \__nwafu_thm_redefine_style:n { break } }
                  {
                    \__nwafu_error:nx { unknown-theorem-style }
                      { \l__nwafu_thm_style_tl }
                  }
              }
          }
        \tl_put_left:Nn \l__nwafu_thm_style_tl { nonumber }
        \nwafu_thm_new_no_number:Vxx \l__nwafu_thm_style_tl {#3} {#4}
      }
      {
        \clist_clear:N \l__nwafu_tmpa_clist
        \clist_concat:NNN \l__nwafu_tmpa_clist
          \c__nwafu_thm_style_plain_clist \c__nwafu_thm_style_break_clist
        \clist_if_in:NVF \l__nwafu_tmpa_clist \l__nwafu_thm_style_tl
          {
            \__nwafu_error:nx { unknown-theorem-style }
              { \l__nwafu_thm_style_tl }
          }
        \nwafu_thm_new:VVxx \l__nwafu_thm_style_tl \l__nwafu_thm_counter_tl
          {#3} {#4}
      }
  }
\cs_new:Npn \__nwafu_thm_redefine_style:n #1
  {
    \__nwafu_warning:nxx { redefine-theorem-style }
      {#1} { \l__nwafu_thm_style_tl }
    \tl_set:Nn \l__nwafu_thm_style_tl {#1}
  }
\__nwafu_msg_new:nn { redefine-theorem-style }
  { Theorem~ style~ "#2"~ will~ be~ redefined~ as~ "#1". }
\__nwafu_msg_new:nn { unknown-theorem-style }
  { Theorem~ style~ "#1"~ is~ unknown. }
\cs_new:Npn \nwafu_thm_new:nnnn #1#2#3#4
  {
    \__nwafu_thm_ntheorem_style:n {#1}
    \__nwafu_thm_ntheorem_new:w   {#3} {#4} [#2]
  }
\cs_generate_variant:Nn \nwafu_thm_new:nnnn { VVxx }
\cs_new:Npn \nwafu_thm_new_no_number:nnn #1#2#3
  {
    \__nwafu_thm_ntheorem_style:n {#1}
    \__nwafu_thm_ntheorem_new:w   {#2} {#3}
  }
\cs_generate_variant:Nn \nwafu_thm_new_no_number:nnn { Vxx }
\cs_new:Npn \nwafu_thm_set_qed:n         #1 { \theoremsymbol     {#1} }
\cs_new:Npn \nwafu_thm_set_header_font:n #1 { \theoremheaderfont {#1} }
\cs_new:Npn \nwafu_thm_set_body_font:n   #1 { \theorembodyfont   {#1} }
\cs_generate_variant:Nn \nwafu_thm_set_qed:n         { V }
\cs_generate_variant:Nn \nwafu_thm_set_header_font:n { V }
\cs_generate_variant:Nn \nwafu_thm_set_body_font:n   { V }
\cs_set:Npn \theequation
  { \thechapter - \__nwafu_arabic:n { equation } }

\clist_map_inline:nn
  {
    title, date, grade, enroll, author, supervisor, cosupervisor,
    department, major, bachelor_title, researchfield, engineering_title, engineeringfield,
    class_id, student_id, school_id, clc, defensedate, udc
  }
  { \tl_new:c { l__nwafu_info_ #1 _tl } }
\clist_new:N \l__nwafu_info_instructors_clist
\clist_new:N \l__nwafu_info_defensecommittees_clist
\clist_new:N \l__nwafu_info_foundation_clist
\clist_map_inline:nn
  { title, author, supervisor, cosupervisor, department,
    major, mastertype, researchfield, engineering_title, engineeringfield,date }
  { \tl_new:c { l__nwafu_info_ #1 _en_tl } }
\int_new:N \g__nwafu_info_postgraduate_type_int
\int_new:N \g__nwafu_info_bachelor_type_int
\keys_define:nn { nwafu / info }
  {
    ptype      .choices:nn  =
      { academic, engineering }
      { \int_gset_eq:NN \g__nwafu_info_postgraduate_type_int \l_keys_choice_int },
    btype      .choice:,
    btype      .value_required:n = true,
    btype      .choices:nn  =
      { paper, design }
      { \int_gset_eq:NN \g__nwafu_info_bachelor_type_int \l_keys_choice_int },
    btype      .initial:n = paper,
    title       .tl_set:N    = \l__nwafu_info_title_tl,
    title*      .tl_set:N    = \l__nwafu_info_title_en_tl,
    date        .tl_set:N  = \l__nwafu_info_date_tl,
    date        .initial:n = { \int_use:N \c_sys_year_int 年 6 月 },
    date        .default:n = { \int_use:N \c_sys_year_int 年 6 月 },
    date*       .tl_set:N  = \l__nwafu_info_date_en_tl,
    date*       .initial:n = {
                               \prop_get:NnN \g__nwafu_month_en_prop { 6 } \l__nwafu_tmpt_tl
                               \l__nwafu_tmpt_tl ,~
                               \int_use:N \c_sys_year_int
                             },
    date*       .default:n = {
                               \prop_get:NnN \g__nwafu_month_en_prop { 6 } \l__nwafu_tmpt_tl
                               \l__nwafu_tmpt_tl ,~
                               \int_use:N \c_sys_year_int
                             },
    grade        .tl_set:N    = \l__nwafu_info_grade_tl,
    grade        .initial:n = { \int_use:N \c_sys_year_int },
    grade        .default:n = { \int_use:N \c_sys_year_int },
    enroll        .tl_set:N    = \l__nwafu_info_enroll_tl,
    author      .tl_set:N    = \l__nwafu_info_author_tl,
    author*     .tl_set:N    = \l__nwafu_info_author_en_tl,
    supervisor  .tl_set:N    = \l__nwafu_info_supervisor_tl,
    supervisor* .tl_set:N    = \l__nwafu_info_supervisor_en_tl,
    cosupervisor        .tl_set:N    = \l__nwafu_info_cosupervisor_tl,
    cosupervisor*       .tl_set:N    = \l__nwafu_info_cosupervisor_en_tl,
    instructors .clist_set:N = \l__nwafu_info_instructors_clist,
    defensecommittees .clist_set:N = \l__nwafu_info_defensecommittees_clist,
    defensedate        .tl_set:N    = \l__nwafu_info_defensedate_tl,
    defensedate        .initial:n = { \today },
    defensedate        .default:n = { \today },
    foundation .clist_set:N = \l__nwafu_info_foundation_clist,
    department  .tl_set:N    = \l__nwafu_info_department_tl,
    department* .tl_set:N    = \l__nwafu_info_department_en_tl,
    major       .tl_set:N    = \l__nwafu_info_major_tl,
    major*      .tl_set:N    = \l__nwafu_info_major_en_tl,
    btitle .tl_set:N    = \l__nwafu_info_bachelor_title_tl,
    mastertype .tl_set:N    = \l__nwafu_info_mastertype_en_tl,
    researchfield  .tl_set:N    = \l__nwafu_info_researchfield_tl,
    researchfield* .tl_set:N    = \l__nwafu_info_researchfield_en_tl,
    engtitle  .tl_set:N    = \l__nwafu_info_engineering_title_tl,
    engtitle* .tl_set:N    = \l__nwafu_info_engineering_title_en_tl,
    engfield  .tl_set:N    = \l__nwafu_info_engineeringfield_tl,
    engfield* .tl_set:N    = \l__nwafu_info_engineeringfield_en_tl,
    class-id  .tl_set:N    = \l__nwafu_info_class_id_tl,
    student-id  .tl_set:N    = \l__nwafu_info_student_id_tl,
    school-id   .tl_set:N    = \l__nwafu_info_school_id_tl,
    clc         .tl_set:N    = \l__nwafu_info_clc_tl,
    udc         .tl_set:N    = \l__nwafu_info_udc_tl,
  }
\tl_new:N    \l__nwafu_cover_logo_tl
\clist_new:N \l__nwafu_cover_logo_size_clist
\keys_define:nn { nwafu / style }
  {
    logo      .tl_set:N    = \l__nwafu_cover_logo_tl,
    logo-size .clist_set:N = \l__nwafu_cover_logo_size_clist
  }
\tl_new:N \l__nwafu_info_secret_level_tl
\keys_define:nn { nwafu / info }
  {
    secret-level .choice:,
    secret-level .value_required:n = true,
    secret-level .choices:nn  =
      { none, i, ii }
      {
        \tl_set:Nx \l__nwafu_info_secret_level_tl
          {
            \clist_item:Nn \c__nwafu_secret_clist { \l_keys_choice_int }
          }
      },
    secret-level .initial:n = none,
  }
\cs_new_protected:Npn \__nwafu_spread_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1}
      { \tl_map_inline:xn {#2} { ##1 \hfil } \unskip }
  }
\cs_generate_variant:Nn \__nwafu_spread_box:nn  { Vn }
\cs_generate_variant:Nn \__nwafu_spread_box:nn  { nV }
\cs_new_protected:Npn \__nwafu_center_box:nn #1#2
  {
    \mode_leave_vertical:
    \dim_set:Nn \l__nwafu_tmpt_dim {#1}
    \dim_add:Nn \l__nwafu_tmpt_dim {0.6em}
    \hbox_to_wd:nn {\l__nwafu_tmpt_dim} { \hfil #2 \hfil }
  }
\cs_generate_variant:Nn \__nwafu_center_box:nn  { Vn }
\cs_new_protected:Npn \__nwafu_center_box_uline:nn #1#2
  {
    \mode_leave_vertical:
    \dim_set:Nn \l__nwafu_tmpt_dim {#1}
    \dim_add:Nn \l__nwafu_tmpt_dim {0.6em}
    \makebox[0cm][l]{\rule[-0.5ex]{\l__nwafu_tmpt_dim}{0.4 pt}}
    \hbox_to_wd:nn {\l__nwafu_tmpt_dim} { \hfil #2 \hfil }
  }
\cs_generate_variant:Nn \__nwafu_center_box_uline:nn  { Vn }
\cs_new:Npn \__nwafu_fixed_width_box:nn #1#2
  { \parbox {#1} {#2} }
\cs_generate_variant:Nn \__nwafu_fixed_width_box:nn  { Vn }
\cs_new:Npn \__nwafu_fixed_width_center_box:nn #1#2
  { \parbox {#1} { \centering #2 } }
\cs_new:Npn \__nwafu_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__nwafu_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__nwafu_tmpa_box }
  }
\cs_generate_variant:Nn \__nwafu_get_text_width:Nn { NV }
\cs_generate_variant:Nn \__nwafu_get_text_width:Nn { Nx }
\cs_new:Npn \__nwafu_get_max_text_width:NN #1#2
  {
    \group_begin:
      \dim_set:Nn #1 {-999pt}
      \clist_set_eq:NN \l__nwafu_tmpt_clist #2
      \bool_until_do:nn { \clist_if_empty_p:N \l__nwafu_tmpt_clist }
        {
          \clist_pop:NN \l__nwafu_tmpt_clist \l__nwafu_tmpt_tl
          \__nwafu_get_text_width:NV \l__nwafu_tmpt_dim \l__nwafu_tmpt_tl
          \dim_gset:Nn #1 { \dim_max:nn {#1} { \l__nwafu_tmpt_dim } }
        }
    \group_end:
  }
\cs_new:Npn \__nwafu_blank_underline:n #1
  { \rule [ -0.5 ex ] {#1} { 0.4 pt } }
\cs_generate_variant:Nn \__nwafu_blank_underline:n { V }
\cs_new:Npn \__nwafu_text_uline:n #1
  {
    \__nwafu_get_text_width:Nn \l__nwafu_tmpt_dim {#1}
    \dim_add:Nn \l__nwafu_tmpt_dim {0.6em}
    \makebox[0cm][l]{\rule[-0.5ex]{\l__nwafu_tmpt_dim}{0.4 pt}}
      \rule{.3em}{0cm}#1\rule{.3em}{0cm}
  }
\cs_generate_variant:Nn \__nwafu_text_uline:n { V }
\cs_new:Npn \__nwafu_line_spread:N #1
  { \linespread { \fp_use:N #1 } \selectfont }
\cs_new:Npn \__nwafu_line_spread:n #1
  { \linespread {#1} \selectfont }
\cs_new:Npn \__nwafu_name_simp:
  {
    \bool_if:NTF \g__nwafu_anonymous_bool
      { **************** }
      { 西北农林科技大学 }
  }
\cs_new:Npn \__nwafu_name_trad:
  {
    \bool_if:NTF \g__nwafu_anonymous_bool
      { **************** }
      { 西北農林科技大學 }
  }
\cs_new:Npn \__nwafu_name_en:
  {
    \bool_if:NTF \g__nwafu_anonymous_bool
      { ********************* }
      { Northwest~ A\&F~ University }
  }
\clist_const:Nn \c__nwafu_cover_brief_doctor_academic_clist
  {
    { \c__nwafu_name_authorbrief_tl  } { \l__nwafu_info_author_tl     } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl   } { \l__nwafu_info_supervisor_tl } { 1 } { 1 }
  }
\clist_const:Nn \c__nwafu_cover_brief_doctor_engineering_clist
  {
    { \c__nwafu_name_authorbrief_tl  } { \l__nwafu_info_author_tl     } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl   } { \l__nwafu_info_supervisor_tl } { 1 } { 1 }
  }
\clist_const:Nn \c__nwafu_cover_brief_master_academic_clist
  {
    { \c__nwafu_name_authorbrief_tl  } { \l__nwafu_info_author_tl     } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl   } { \l__nwafu_info_supervisor_tl } { 1 } { 1 }
  }
\clist_const:Nn \c__nwafu_cover_brief_master_engineering_clist
  {
    { \c__nwafu_name_authorbrief_tl  } { \l__nwafu_info_author_tl     } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl   } { \l__nwafu_info_supervisor_tl } { 1 } { 1 }
  }
\clist_const:Nn \c__nwafu_cover_brief_bachelor_clist
  {
    { \c__nwafu_name_authorbrief_tl  } { \l__nwafu_info_author_tl     } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl   } { \l__nwafu_info_supervisor_tl } { 1 } { 1 }
  }
\clist_const:Nn \c__nwafu_cover_detail_doctor_academic_clist
  {
    { \c__nwafu_name_department_tl    } { \l__nwafu_info_department_tl    } { 0 } { 0 },
    { \c__nwafu_name_major_tl         } { \l__nwafu_info_major_tl         } { 0 } { 0 },
    { \c__nwafu_name_author_tl        } { \l__nwafu_info_author_tl        } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl    } { \l__nwafu_info_supervisor_tl    } { 1 } { 1 },
    { \c__nwafu_name_cosupervisor_tl  } { \l__nwafu_info_cosupervisor_tl  } { 1 } { 2 }
  }
\clist_const:Nn \c__nwafu_cover_detail_doctor_engineering_clist
  {
    { \c__nwafu_name_department_tl        } { \l__nwafu_info_department_tl        } { 0 } { 0 },
    { \c__nwafu_name_engineering_title_tl } { \l__nwafu_info_engineering_title_tl } { 0 } { 0 },
    { \c__nwafu_name_engineeringfield_tl  } { \l__nwafu_info_engineeringfield_tl  } { 0 } { 0 },
    { \c__nwafu_name_author_tl            } { \l__nwafu_info_author_tl            } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl        } { \l__nwafu_info_supervisor_tl        } { 1 } { 1 },
    { \c__nwafu_name_cosupervisor_tl      } { \l__nwafu_info_cosupervisor_tl      } { 1 } { 2 },
  }
\clist_const:Nn \c__nwafu_cover_detail_master_academic_clist
  {
    { \c__nwafu_name_department_tl    } { \l__nwafu_info_department_tl    } { 0 } { 0 },
    { \c__nwafu_name_major_tl         } { \l__nwafu_info_major_tl         } { 0 } { 0 },
    { \c__nwafu_name_author_tl        } { \l__nwafu_info_author_tl        } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl    } { \l__nwafu_info_supervisor_tl    } { 1 } { 1 },
    { \c__nwafu_name_cosupervisor_tl  } { \l__nwafu_info_cosupervisor_tl  } { 1 } { 2 }
  }
\clist_const:Nn \c__nwafu_cover_detail_master_engineering_clist
  {
    { \c__nwafu_name_department_tl        } { \l__nwafu_info_department_tl        } { 0 } { 0 },
    { \c__nwafu_name_engineering_title_tl } { \l__nwafu_info_engineering_title_tl } { 0 } { 0 },
    { \c__nwafu_name_engineeringfield_tl  } { \l__nwafu_info_engineeringfield_tl  } { 0 } { 0 },
    { \c__nwafu_name_author_tl            } { \l__nwafu_info_author_tl            } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl        } { \l__nwafu_info_supervisor_tl        } { 1 } { 1 },
    { \c__nwafu_name_cosupervisor_tl      } { \l__nwafu_info_cosupervisor_tl      } { 1 } { 2 },
  }
\clist_const:Nn \c__nwafu_cover_detail_bachelor_clist
  {
    { \c__nwafu_name_author_tl         } { \l__nwafu_info_author_tl         } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl     } { \l__nwafu_info_supervisor_tl     } { 1 } { 1 },
    { \c__nwafu_name_cosupervisor_tl   } { \l__nwafu_info_cosupervisor_tl   } { 1 } { 2 },
    { \c__nwafu_name_bachelor_title_tl } { \l__nwafu_info_bachelor_title_tl } { 0 } { 0 },
    { \c__nwafu_name_major_tl          } { \l__nwafu_info_major_tl          } { 0 } { 0 },
    { \c__nwafu_name_department_tl     } { \l__nwafu_info_department_tl     } { 0 } { 0 }
  }
\clist_const:Nn \c__nwafu_cover_detail_en_doctor_academic_clist
  {
    { \c__nwafu_name_department_en_tl    } { \l__nwafu_info_department_en_tl    } { 0 } { 0 },
    { \c__nwafu_name_major_en_tl         } { \l__nwafu_info_major_en_tl         } { 0 } { 0 },
    { \c__nwafu_name_author_en_tl        } { \l__nwafu_info_author_en_tl        } { 1 } { 0 },
    { \c__nwafu_name_supervisor_en_tl    } { \l__nwafu_info_supervisor_en_tl    } { 1 } { 1 },
    { \c__nwafu_name_cosupervisor_en_tl  } { \l__nwafu_info_cosupervisor_en_tl  } { 1 } { 2 }
  }
\clist_const:Nn \c__nwafu_cover_detail_en_doctor_engineering_clist
  {
    { \c__nwafu_name_department_en_tl    } { \l__nwafu_info_department_en_tl    } { 0 } { 0 },
    { \c__nwafu_name_major_en_tl         } { \l__nwafu_info_major_en_tl         } { 0 } { 0 },
    { \c__nwafu_name_author_en_tl        } { \l__nwafu_info_author_en_tl        } { 1 } { 0 },
    { \c__nwafu_name_supervisor_en_tl    } { \l__nwafu_info_supervisor_en_tl    } { 1 } { 1 },
    { \c__nwafu_name_cosupervisor_en_tl  } { \l__nwafu_info_cosupervisor_en_tl  } { 1 } { 2 }
  }
\clist_const:Nn \c__nwafu_cover_detail_en_master_academic_clist
  {
    { \c__nwafu_name_department_en_tl    } { \l__nwafu_info_department_en_tl    } { 0 } { 0 },
    { \c__nwafu_name_major_en_tl         } { \l__nwafu_info_major_en_tl         } { 0 } { 0 },
    { \c__nwafu_name_author_en_tl        } { \l__nwafu_info_author_en_tl        } { 1 } { 0 },
    { \c__nwafu_name_supervisor_en_tl    } { \l__nwafu_info_supervisor_en_tl    } { 1 } { 1 },
    { \c__nwafu_name_cosupervisor_en_tl  } { \l__nwafu_info_cosupervisor_en_tl  } { 1 } { 2 }
  }
\clist_const:Nn \c__nwafu_cover_detail_en_master_engineering_clist
  {
    { \c__nwafu_name_department_en_tl    } { \l__nwafu_info_department_en_tl    } { 0 } { 0 },
    { \c__nwafu_name_major_en_tl         } { \l__nwafu_info_major_en_tl         } { 0 } { 0 },
    { \c__nwafu_name_author_en_tl        } { \l__nwafu_info_author_en_tl        } { 1 } { 0 },
    { \c__nwafu_name_supervisor_en_tl    } { \l__nwafu_info_supervisor_en_tl    } { 1 } { 1 },
    { \c__nwafu_name_cosupervisor_en_tl  } { \l__nwafu_info_cosupervisor_en_tl  } { 1 } { 2 }
  }
\clist_const:Nn \c__nwafu_cover_id_doctor_academic_clist
  {
    { \c__nwafu_name_clc_tl          } { \l__nwafu_info_clc_tl          } { 0 } { 0 },
    { \c__nwafu_name_school_id_tl    } { \l__nwafu_info_school_id_tl    } { 1 } { 0 },
    { \c__nwafu_name_udc_tl          } { \l__nwafu_info_udc_tl          } { 0 } { 0 },
    { \c__nwafu_name_secret_level_tl } { \l__nwafu_info_secret_level_tl } { 0 } { 0 },
    { \c__nwafu_name_student_id_tl   } { \l__nwafu_info_student_id_tl   } { 1 } { 0 }
  }
\clist_const:Nn \c__nwafu_cover_id_doctor_engineering_clist
  {
    { \c__nwafu_name_clc_tl          } { \l__nwafu_info_clc_tl          } { 0 } { 0 },
    { \c__nwafu_name_school_id_tl    } { \l__nwafu_info_school_id_tl    } { 1 } { 0 },
    { \c__nwafu_name_udc_tl          } { \l__nwafu_info_udc_tl          } { 0 } { 0 },
    { \c__nwafu_name_secret_level_tl } { \l__nwafu_info_secret_level_tl } { 0 } { 0 },
    { \c__nwafu_name_student_id_tl   } { \l__nwafu_info_student_id_tl   } { 1 } { 0 }
  }
\clist_const:Nn \c__nwafu_cover_id_master_academic_clist
  {
    { \c__nwafu_name_clc_tl          } { \l__nwafu_info_clc_tl          } { 0 } { 0 },
    { \c__nwafu_name_school_id_tl    } { \l__nwafu_info_school_id_tl    } { 1 } { 0 },
    { \c__nwafu_name_udc_tl          } { \l__nwafu_info_udc_tl          } { 0 } { 0 },
    { \c__nwafu_name_secret_level_tl } { \l__nwafu_info_secret_level_tl } { 0 } { 0 },
    { \c__nwafu_name_student_id_tl   } { \l__nwafu_info_student_id_tl   } { 1 } { 0 }
  }
\clist_const:Nn \c__nwafu_cover_id_master_engineering_clist
  {
    { \c__nwafu_name_clc_tl          } { \l__nwafu_info_clc_tl          } { 0 } { 0 },
    { \c__nwafu_name_school_id_tl    } { \l__nwafu_info_school_id_tl    } { 1 } { 0 },
    { \c__nwafu_name_udc_tl          } { \l__nwafu_info_udc_tl          } { 0 } { 0 },
    { \c__nwafu_name_secret_level_tl } { \l__nwafu_info_secret_level_tl } { 0 } { 0 },
    { \c__nwafu_name_student_id_tl   } { \l__nwafu_info_student_id_tl   } { 1 } { 0 }
  }
\clist_const:Nn \c__nwafu_cover_id_bachelor_clist
  {
    { \c__nwafu_name_student_id_tl   } { \l__nwafu_info_student_id_tl   } { 1 } { 0 }
  }
\clist_const:Nn \c__nwafu_cover_instructors_doctor_academic_clist
  {
    { \c__nwafu_name_author_tl      } { \l__nwafu_info_author_tl         } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl  } { \l__nwafu_info_supervisor_tl     } { 1 } { 1 },
    { \c__nwafu_name_instructors_tl } { \l__nwafu_info_instructors_clist } { 1 } { 2 }
  }
\clist_const:Nn \c__nwafu_cover_instructors_doctor_engineering_clist
  {
    { \c__nwafu_name_author_tl      } { \l__nwafu_info_author_tl         } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl  } { \l__nwafu_info_supervisor_tl     } { 1 } { 1 },
    { \c__nwafu_name_instructors_tl } { \l__nwafu_info_instructors_clist } { 1 } { 2 }
  }
\clist_const:Nn \c__nwafu_cover_instructors_master_academic_clist
  {
    { \c__nwafu_name_author_tl      } { \l__nwafu_info_author_tl         } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl  } { \l__nwafu_info_supervisor_tl     } { 1 } { 1 },
  }
\clist_const:Nn \c__nwafu_cover_instructors_master_engineering_clist
  {
    { \c__nwafu_name_author_tl      } { \l__nwafu_info_author_tl         } { 1 } { 0 },
    { \c__nwafu_name_supervisor_tl  } { \l__nwafu_info_supervisor_tl     } { 1 } { 1 },
  }
\cs_new_protected:Npn \__nwafu_select_fields:n #1
  {
    \clist_clear:N \l__nwafu_tmpa_clist
    \int_case:nnF { \g__nwafu_thesis_type_int }
      {
        {1}
          {
            \int_case:nnF { \g__nwafu_info_postgraduate_type_int }
              {
                {1}
                  {
                    \clist_set_eq:Nc \l__nwafu_tmpa_clist { c__nwafu_cover_ #1 _doctor_academic_clist }
                  }
                {2}
                  {
                    \clist_set_eq:Nc \l__nwafu_tmpa_clist { c__nwafu_cover_ #1 _doctor_engineering_clist }
                  }
              }
              {
                \clist_set_eq:Nc \l__nwafu_tmpa_clist { c__nwafu_cover_ #1 _doctor_academic_clist }
              }
          }
        {2}
          {
            \int_case:nnF { \g__nwafu_info_postgraduate_type_int }
              {
                {1}
                  {
                    \clist_set_eq:Nc \l__nwafu_tmpa_clist { c__nwafu_cover_ #1 _master_academic_clist }
                  }
                {2}
                  {
                    \clist_set_eq:Nc \l__nwafu_tmpa_clist { c__nwafu_cover_ #1 _master_engineering_clist }
                  }
              }
              {
                \clist_set_eq:Nc \l__nwafu_tmpa_clist { c__nwafu_cover_ #1 _master_academic_clist }
              }
          }
        {3}
          {
            \clist_if_exist:cTF { c__nwafu_cover_ #1 _bachelor_clist }
              { \clist_set_eq:Nc \l__nwafu_tmpa_clist { c__nwafu_cover_ #1 _bachelor_clist } }
              { \clist_clear:N \l__nwafu_tmpa_clist }
          }
      }
      { \clist_clear:N \l__nwafu_tmpa_clist }
  }
\cs_generate_variant:Nn \__nwafu_select_fields:n { V }
\cs_new_protected:Npn \__nwafu_get_max_label_width:
  {
    \dim_set:Nn \l__nwafu_tmpa_dim { -999 pt }
    \clist_map_inline:Nn \l__nwafu_tmpa_clist
      {
        \exp_args:NnV \__nwafu_get_text_width:Nn \l__nwafu_tmpt_dim { \exp_after:wN \use_i:nnnn ##1 }
        \dim_set:Nn \l__nwafu_tmpa_dim { \dim_max:nn { \l__nwafu_tmpa_dim } { \l__nwafu_tmpt_dim } }
      }
  }
\cs_new_protected:Npn \__nwafu_get_max_value_width:
  {
    \dim_set:Nn \l__nwafu_tmpb_dim { -999 pt }
    \clist_map_inline:Nn \l__nwafu_tmpa_clist
      {
        \tl_set:Nx \l__nwafu_tmpt_tl { \exp_after:wN \use_ii:nnnn ##1 }
        \bool_if:nT { \g__nwafu_anonymous_bool &&
                      \int_compare_p:nNn { \exp_after:wN \use_iii:nnnn ##1 } = { 1 } }
          { \tl_set:Nn \l__nwafu_tmpt_tl { \c__nwafu_name_anonname_tl } }
        \bool_if:nT { \int_compare_p:nNn { \exp_after:wN \use_iv:nnnn ##1 } = { 1 } ||
                      \int_compare_p:nNn { \exp_after:wN \use_iv:nnnn ##1 } = { 2 } }
          { \__nwafu_format_supervisor_list:N \l__nwafu_tmpt_tl }
        \__nwafu_get_text_width:NV \l__nwafu_tmpt_dim \l__nwafu_tmpt_tl
        \dim_set:Nn \l__nwafu_tmpb_dim
          { \dim_max:nn { \l__nwafu_tmpb_dim } { \l__nwafu_tmpt_dim } }
      }
  }
\cs_new_protected:Npn \__nwafu_get_max_value_en_width:
  {
    \dim_set:Nn \l__nwafu_tmpb_dim { -999 pt }
    \clist_map_inline:Nn \l__nwafu_tmpa_clist
      {
        \tl_set:Nx \l__nwafu_tmpt_tl { \exp_after:wN \use_ii:nnnn ##1 }
        \bool_if:nT { \g__nwafu_anonymous_bool &&
                      \int_compare_p:nNn { \exp_after:wN \use_iii:nnnn ##1 } = { 1 } }
          { \tl_set:Nn \l__nwafu_tmpt_tl { \c__nwafu_name_anonname_tl } }
        \bool_if:nT { \int_compare_p:nNn { \exp_after:wN \use_iv:nnnn ##1 } = { 1 } ||
                      \int_compare_p:nNn { \exp_after:wN \use_iv:nnnn ##1 } = { 2 } }
          { \__nwafu_format_supervisor_list:N \l__nwafu_tmpt_tl }
        \__nwafu_get_text_width:Nx \l__nwafu_tmpt_dim
          { \exp_after:wN \use_i:nnnn ##1\c__nwafu_fwid_colon_tl\l__nwafu_tmpt_tl }
        \dim_set:Nn \l__nwafu_tmpb_dim
          { \dim_max:nn { \l__nwafu_tmpb_dim } { \l__nwafu_tmpt_dim } }
      }
  }
\cs_new_protected:Npn \__nwafu_get_max_instructors_value_width:
  {
    \dim_set:Nn \l__nwafu_tmpb_dim { -999 pt }
    \clist_map_inline:Nn \l__nwafu_tmpa_clist
      {
        \tl_set:Nx \l__nwafu_tmpt_tl { \exp_after:wN \use_ii:nnnn ##1 }
        \bool_if:nT { \g__nwafu_anonymous_bool &&
                      \int_compare_p:nNn { \exp_after:wN \use_iii:nnnn ##1 } = { 1 } }
          { \tl_set:Nn \l__nwafu_tmpt_tl { \c__nwafu_name_anonname_tl } }
        \bool_if:nT { \int_compare_p:nNn { \exp_after:wN \use_iv:nnnn ##1 } = { 1 } ||
                      \int_compare_p:nNn { \exp_after:wN \use_iv:nnnn ##1 } = { 2 } }
          { \__nwafu_format_supervisor_list:N \l__nwafu_tmpt_tl }
        \hbox_set:Nn \l__nwafu_tmpa_box
          {
            \zihao{3}\bfseries
            \l__nwafu_tmpt_tl
          }
        \dim_set:Nn \l__nwafu_tmpt_dim { \box_wd:N \l__nwafu_tmpa_box }
        \dim_set:Nn \l__nwafu_tmpb_dim
          { \dim_max:nn { \l__nwafu_tmpb_dim } { \l__nwafu_tmpt_dim } }
      }
  }
\cs_new_protected:Npn \__nwafu_filter_nonempty_fields:
  {
    \clist_clear:N \l_tmpa_clist
    \clist_map_inline:Nn \l__nwafu_tmpa_clist
      {
        \tl_set:Nx \l_tmpa_tl { \exp_after:wN \use_ii:nnnn ##1 }
        \tl_set:Nx \l_tmpb_tl { \exp_after:wN \use_iv:nnnn ##1 }
        \int_compare:nNnTF { \l_tmpb_tl } = { 2 }
          {
            \tl_if_empty:NTF \l_tmpa_tl
              { }
              { \clist_put_right:Nn \l_tmpa_clist {##1} }
          }
          { \clist_put_right:Nn \l_tmpa_clist {##1} }
      }
    \clist_set_eq:NN \l__nwafu_tmpa_clist \l_tmpa_clist
  }
\int_const:Nn \c__nwafu_output_type_generic_int     { 1 }
\int_const:Nn \c__nwafu_output_type_en_int          { 2 }
\int_const:Nn \c__nwafu_output_type_id_int          { 3 }
\int_const:Nn \c__nwafu_output_type_instructors_int { 4 }
\cs_new_protected:Npn \__nwafu_cover_item_output:nnnnn #1#2#3#4#5
  {
    \tl_set:Nn \l__nwafu_tmpb_tl { #3 }
    \bool_if:nT { \g__nwafu_anonymous_bool && \int_compare_p:nNn { #4 } = { 1 } }
      { \tl_set:Nn \l__nwafu_tmpb_tl { \c__nwafu_name_anonname_tl } }
    \bool_if:nT { \int_compare_p:nNn { #5 } = { 1 } || \int_compare_p:nNn { #5 } = { 2 } }
      { \__nwafu_format_supervisor_list:N \l__nwafu_tmpb_tl }
    \int_case:nnF { #1 }
      {
        { \c__nwafu_output_type_generic_int }
          {
            \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim { #2 }
            \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
              {
                \__nwafu_quad:
                \__nwafu_center_box_uline:Vn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_tl }
              }{
                \c__nwafu_fwid_colon_tl
                \__nwafu_center_box:Vn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_tl }
              }
            \par
          }
        { \c__nwafu_output_type_en_int }
          {
            #2 \c__nwafu_fwid_colon_tl \l__nwafu_tmpb_tl \par
          }
        { \c__nwafu_output_type_id_int }
          {
            \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
              {
                \tl_if_eq:NnTF \c__nwafu_name_udc_tl { #2 }
                  { \__nwafu_fixed_width_box:Vn \l__nwafu_tmpa_dim { #2 } }
                  { \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim { #2 } }
                \c__nwafu_fwid_colon_tl
                \__nwafu_center_box_uline:Vn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_tl }
                \tl_set:Nn \l__nwafu_tmpt_tl { #2 }
                \bool_if:nTF
                  {
                    \tl_if_eq_p:NN \l__nwafu_tmpt_tl \c__nwafu_name_school_id_tl ||
                    \tl_if_eq_p:NN \l__nwafu_tmpt_tl \c__nwafu_name_udc_tl       ||
                    \tl_if_eq_p:NN \l__nwafu_tmpt_tl \c__nwafu_name_student_id_tl
                  }
                  { \par } { \hfill }
              }{
                \hfill
                \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim { #2 }
                \c__nwafu_fwid_colon_tl
                \l__nwafu_tmpb_tl
              }
          }
        { \c__nwafu_output_type_instructors_int }
          {
            \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim { #2 }
            \c__nwafu_fwid_colon_tl
            \l__nwafu_tmpb_tl
            \par
          }
      }
      {
        #2 \c__nwafu_fwid_colon_tl \l__nwafu_tmpb_tl \par
      }
  }
\cs_generate_variant:Nn \__nwafu_cover_item_output:nnnnn { xxxxx }
\cs_new_protected:Npn \__nwafu_format_supervisor_list:N #1
  {
    \seq_clear:N \l_tmpa_seq
    \exp_args:Nx \clist_map_inline:nn { #1 }
      {
        \tl_set:Nx \l__nwafu_tmpa_tl { \clist_item:nn { ##1 } { 1 } }
        \tl_set:Nx \l__nwafu_tmpb_tl { \clist_item:nn { ##1 } { 2 } }
        \tl_if_empty:NTF \l__nwafu_tmpb_tl
          { \seq_put_right:NV \l_tmpa_seq \l__nwafu_tmpa_tl }
          {
            \seq_put_right:Nx \l_tmpa_seq
              { \l__nwafu_tmpa_tl \enskip \l__nwafu_tmpb_tl }
          }
      }
    \tl_set:Nx #1 { \seq_use:Nn \l_tmpa_seq { ,\enskip } }
  }

\cs_new_protected:Npn \__nwafu_format_instructors_list:N #1
  {
    \tl_set_eq:NN \l_tmpa_tl #1
    \__nwafu_format_supervisor_list:N \l_tmpa_tl
    \tl_set_eq:NN #1 \l_tmpa_tl
  }
\cs_new_protected:Npn \__nwafu_cover_id:
  {
    \group_begin:
      \__nwafu_select_fields:n { id }
      \__nwafu_get_max_label_width:
      \__nwafu_get_max_value_width:
      \begin{minipage}[c]{\textwidth}
        \flushleft
        \clist_map_inline:Nn \l__nwafu_tmpa_clist
          {
            \__nwafu_cover_item_output:xxxxx { \c__nwafu_output_type_id_int } ##1
          }
      \end{minipage}
    \group_end:
  }
\cs_new_protected:Npn \__nwafu_cover_logo:
  {
    \bool_if:NTF \g__nwafu_anonymous_bool
      { **************** }
      {
        \clist_pop:NN   \l__nwafu_cover_logo_size_clist \l__nwafu_tmpa_tl
        \clist_pop:NNTF \l__nwafu_cover_logo_size_clist \l__nwafu_tmpb_tl
          {
            \tl_if_empty:NTF \l__nwafu_tmpa_tl
              { \includegraphics [ height = \l__nwafu_tmpb_tl ] }
              {
                \includegraphics
                  [ width  = \l__nwafu_tmpa_tl, height = \l__nwafu_tmpb_tl ]
              }
          }
          { \includegraphics [ width = \l__nwafu_tmpa_tl ] }
          { \l__nwafu_cover_logo_tl }
      }
  }
\cs_new_protected:Npn \__nwafu_cover_type:
  {
    \tl_set:Nx \l__nwafu_tmpa_tl
      {
        \clist_item:Nn \c__nwafu_thesis_type_clist { \g__nwafu_thesis_type_int }
      }
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \__nwafu_spread_box:nn { 0.75 \textwidth } { \l__nwafu_tmpa_tl }
      }{
        \__nwafu_get_text_width:NV \l__nwafu_tmpa_dim \l__nwafu_info_grade_tl
        \__nwafu_center_box:Vn \l__nwafu_tmpa_dim { \l__nwafu_info_grade_tl }
        \__nwafu_spread_box:nn { 0.50 \textwidth }
          {
            届
            \l__nwafu_tmpa_tl
            \clist_item:Nn \c__nwafu_bachelor_type_clist { \g__nwafu_info_bachelor_type_int }
          }
      }
  }
\cs_new_protected:Npn \__nwafu_cover_author_brief:
  {
     \begin{minipage} [ c ] { \textwidth }
       \centering
       \__nwafu_select_fields:n { brief }
      \__nwafu_filter_nonempty_fields:
      \__nwafu_get_max_label_width:
      \__nwafu_get_max_value_width:
      \dim_add:Nn \l__nwafu_tmpa_dim { 1.2 em }
      \clist_map_inline:Nn \l__nwafu_tmpa_clist
        {
          \__nwafu_cover_item_output:xxxxx { \c__nwafu_output_type_generic_int } ##1
        }
    \end{minipage}
  }

\cs_new_protected:Npn \__nwafu_cover_author_detailed:
  {
    \begin{minipage} [ c ] { \textwidth }
      \centering
      \__nwafu_select_fields:n { detail }
      \__nwafu_filter_nonempty_fields:
      \__nwafu_get_max_label_width:
      \__nwafu_get_max_value_width:
    \int_compare:nNnT { \g__nwafu_thesis_type_int } = { 3 }
      {
        \dim_add:Nn \l__nwafu_tmpa_dim { 1.2 em }
      }
      \clist_map_inline:Nn \l__nwafu_tmpa_clist
        {
          \__nwafu_cover_item_output:xxxxx { \c__nwafu_output_type_generic_int } ##1
        }
    \end{minipage}
  }
\cs_new_protected:Npn \__nwafu_cover_author_detailed_en:
  {
    \__nwafu_select_fields:n { detail_en }
    \__nwafu_filter_nonempty_fields:
    \__nwafu_get_max_value_en_width:
    \begin{minipage} [ c ] { \textwidth }
      \flushleft
      \clist_map_inline:Nn \l__nwafu_tmpa_clist
        {
          \__nwafu_cover_item_output:xxxxx { \c__nwafu_output_type_en_int } ##1
        }
    \end{minipage}
  }
\cs_new_protected:Npn \__nwafu_cover_instructors:
  {
    \begin{minipage}[c]{\textwidth}
      \flushleft
      \__nwafu_select_fields:n { instructors }
      \clist_if_empty:NTF \l__nwafu_tmpa_clist
        { }
        {
          \__nwafu_get_max_label_width:
          \__nwafu_get_max_instructors_value_width:
          \dim_add:Nn \l__nwafu_tmpb_dim { 0.8 em }
          \clist_map_inline:Nn \l__nwafu_tmpa_clist
            {
              \__nwafu_cover_item_output:xxxxx { \c__nwafu_output_type_instructors_int } ##1
            }
        }
    \end{minipage}
  }
\cs_new_protected:Npn \__nwafu_cover_defensecommittees:
  {
    \bool_if:NF \g__nwafu_anonymous_bool
      {
        \clist_if_empty:NTF \l__nwafu_info_defensecommittees_clist
          { }
          {
            \begin{minipage}[c]{\textwidth}
              \centering
              \dim_set:Nn \l__nwafu_tmpa_dim { -999pt }
              \dim_set:Nn \l__nwafu_tmpb_dim { -999pt }
              \dim_set:Nn \l__nwafu_tmpc_dim { -999pt }
              \clist_map_inline:Nn \l__nwafu_info_defensecommittees_clist
                {
                  \clist_set:Nn \l__nwafu_tmpt_clist { ##1 }
                  \__nwafu_get_text_width:Nx \l__nwafu_tmpt_dim { \clist_item:Nn \l__nwafu_tmpt_clist { 1 } }
                  \dim_set:Nn \l__nwafu_tmpa_dim { \dim_max:nn { \l__nwafu_tmpa_dim } { \l__nwafu_tmpt_dim } }
                  \__nwafu_get_text_width:Nx \l__nwafu_tmpt_dim { \clist_item:Nn \l__nwafu_tmpt_clist { 2 } }
                  \dim_set:Nn \l__nwafu_tmpb_dim { \dim_max:nn { \l__nwafu_tmpb_dim } { \l__nwafu_tmpt_dim } }
                  \__nwafu_get_text_width:Nx \l__nwafu_tmpt_dim { \clist_item:Nn \l__nwafu_tmpt_clist { 3 } }
                  \dim_set:Nn \l__nwafu_tmpc_dim { \dim_max:nn { \l__nwafu_tmpc_dim } { \l__nwafu_tmpt_dim } }
                }
              \dim_add:Nn \l__nwafu_tmpb_dim { 0.5 em }
              \clist_map_inline:Nn \l__nwafu_info_defensecommittees_clist
                {
                  \clist_set:Nn \l__nwafu_tmpt_clist { ##1 }
                  \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim { \clist_item:Nn \l__nwafu_tmpt_clist { 1 } }
                  \__nwafu_center_box_uline:Vn \l__nwafu_tmpb_dim { \clist_item:Nn \l__nwafu_tmpt_clist { 2 } }
                  \__nwafu_spread_box:Vn \l__nwafu_tmpc_dim { \clist_item:Nn \l__nwafu_tmpt_clist { 3 } }
                  \par
                }
            \end{minipage}
          }
      }
  }
\cs_new_protected:Npn \__nwafu_cover_foundation:
  {
    \begin{minipage}[c]{\textwidth}
      \clist_map_inline:Nn \l__nwafu_info_foundation_clist
        {
          \indent
          \__nwafu_qquad:
          本研究得到
          \bool_if:NTF \g__nwafu_anonymous_bool
            { \c__nwafu_name_anonname_tl }
            { \clist_item:nn {##1} {1} }  % 项目来源
          \c__nwafu_fwid_colon_tl
          \bool_if:NTF \g__nwafu_anonymous_bool
            { \c__nwafu_name_anonname_tl }
            { \clist_item:nn {##1} {2} }  % 项目名称
          (编号\c__nwafu_fwid_colon_tl
          \bool_if:NTF \g__nwafu_anonymous_bool
            { \c__nwafu_name_anonname_tl }
            { \clist_item:nn {##1} {3} }  % 项目编号
          )资助
          \par
        }
    \end{minipage}
  }
\cs_new_protected:Npn \__nwafu_cover_signature:N #1
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \__nwafu_qquad:
        \__nwafu_spread_box:nV { 5 em } #1
        \c__nwafu_fwid_colon_tl
        \hspace*{\fill}
      }{
        \__nwafu_spread_box:nV { 6 em } #1
        \c__nwafu_fwid_colon_tl
        \hspace*{\fill}
      }
    时间\c__nwafu_fwid_colon_tl
    \__nwafu_qquad:\__nwafu_qquad: 年
    \__nwafu_qquad: 月
    \__nwafu_qquad: 日
    \hspace*{\fill}
    % \__nwafu_qquad:
  }
\DeclareObjectType { nwafu } { \c_zero_int }
\DeclareTemplateInterface { nwafu } { element } { \c_zero_int }
  {
    content     : tokenlist = \c_empty_tl,
    format      : tokenlist = \c_empty_tl,
    bottom-skip : skip      = \c_zero_skip,
    align       : choice { left, right, center, normal } = normal
  }
\DeclareTemplateCode { nwafu } { element } { \c_zero_int }
  {
    content     = \l__nwafu_elem_content_tl,
    format      = \l__nwafu_elem_format_tl,
    bottom-skip = \l__nwafu_elem_bottom_skip,
    align =
      {
        left =
          { \tl_set_eq:NN \l__nwafu_elem_begin_align_tl \flushleft
            \tl_set_eq:NN \l__nwafu_elem_end_align_tl   \endflushleft  },
        right =
          { \tl_set_eq:NN \l__nwafu_elem_begin_align_tl \flushright
            \tl_set_eq:NN \l__nwafu_elem_end_align_tl   \endflushright },
        center =
          { \tl_set_eq:NN \l__nwafu_elem_begin_align_tl \center
            \tl_set_eq:NN \l__nwafu_elem_end_align_tl   \endcenter     },
        normal =
          { \tl_clear:N   \l__nwafu_elem_begin_align_tl
            \tl_clear:N   \l__nwafu_elem_end_align_tl                  }
      }
  }
  {
    \AssignTemplateKeys
    \group_begin:
      \l__nwafu_elem_begin_align_tl
      \l__nwafu_elem_format_tl
      \l__nwafu_elem_content_tl \par
      \l__nwafu_elem_end_align_tl
    \group_end:
    \__nwafu_vspace:N \l__nwafu_elem_bottom_skip
  }
\DeclareTemplateInterface { nwafu } { page } { \c_zero_int }
  {
    content     : commalist = \c_empty_clist,
    prefix      : tokenlist = \c_empty_tl,
    format      : tokenlist = \c_empty_tl,
    top-skip    : skip      = \c_zero_skip,
    bottom-skip : skip      = \c_zero_skip
  }
\DeclareTemplateCode { nwafu } { page } { \c_zero_int }
  {
    content     = \l__nwafu_page_content_clist,
    prefix      = \l__nwafu_page_prefix_tl,
    format      = \l__nwafu_page_format_tl,
    top-skip    = \l__nwafu_page_top_skip,
    bottom-skip = \l__nwafu_page_bottom_skip
  }
  {
    \AssignTemplateKeys
    \__nwafu_vspace:N \l__nwafu_page_top_skip
    \group_begin:
      \l__nwafu_page_format_tl
      \clist_map_inline:Nn \l__nwafu_page_content_clist
        { \UseInstance { nwafu } { \l__nwafu_page_prefix_tl ##1 } }
    \group_end:
    \__nwafu_vspace:N \l__nwafu_page_bottom_skip
  }
\cs_new_protected:Npn \__nwafu_declare_element:nn #1#2
  { \DeclareInstance { nwafu } {#1} { element } {#2} }
\cs_generate_variant:Nn \__nwafu_declare_element:nn { nx }
\cs_new_protected:Npn \__nwafu_declare_page:nn    #1#2
  { \DeclareInstance { nwafu } {#1} { page    } {#2} }
\cs_generate_variant:Nn \__nwafu_declare_page:nn { nx }
\clist_const:Nn \c__nwafu_cover_elements_o_clist
  {
    { logo      } { \__nwafu_cover_logo: } { }
                  { -20 pt plus 0.3 fill } { center },
    { type      } { \__nwafu_cover_type: } { \nwafu@hei \huge }
                  { 5 pt plus 0.3 fill } { center },
    { titlezh   } { \l__nwafu_info_title_tl }
                  { \__nwafu_line_spread:n {0.95} \nwafu@hei \Huge }
                  { 0 pt plus 0.3 fill } { center },
    { titleen   } { \l__nwafu_info_title_en_tl }
                  { \__nwafu_line_spread:n {0.95} \Huge }
                  { 80 pt plus 0.3 fill } { center },
    { info      } { \__nwafu_cover_author_brief: } { \__nwafu_line_spread:n {3.00} \nwafu@hei \large }
                  { 120 pt plus 0.3 fill } { center },
    { date      } { \l__nwafu_info_date_tl } { \nwafu@hei \large }
                  { 0 pt plus 0.3 fill } { center }
  }
\clist_const:Nn \c__nwafu_cover_elements_i_graduate_clist
  {
    { logo      } { \__nwafu_cover_logo: } { }
                  { -50 pt plus 0.3 fill } { center },
    { type      } { \__nwafu_cover_type: } { \sffamily \zihao { 0 } }
                  { 55 pt plus 0.3 fill } { center },
    { titlezh   } { \l__nwafu_info_title_tl }
                  { \sffamily \zihao { 2 } }
                  { 75 pt plus 0.3 fill } { center },
    { info      } { \__nwafu_cover_author_detailed: } { \__nwafu_line_spread:n {1.60} \nwafu@hei \zihao { 3 } }
                  { 53 pt plus 0.3 fill } { center },
    { date      } { \l__nwafu_info_date_tl } { \nwafu@hei \large }
                  { 0 pt plus 0.3 fill } { center }
  }
\clist_const:Nn \c__nwafu_cover_elements_i_bachelor_clist
  {
    { id        } { \__nwafu_cover_id: } { \zihao { 4 } }
                  { 10 pt plus 0.3 fill } { right },
    { logo      } { \__nwafu_cover_logo: } { }
                  { -10 pt plus 0.3 fill } { center },
    { type      } { \__nwafu_cover_type: } { \nwafu@hei \huge }
                  { 0 pt plus 0.3 fill } { center },
    { titlezh   } { \l__nwafu_info_title_tl } { \__nwafu_line_spread:n {0.95} \nwafu@hei \Huge }
                  { -5 pt plus 0.3 fill } { center },
    { titleen   } { \l__nwafu_info_title_en_tl }
                  { \__nwafu_line_spread:n {0.95} \Huge }
                  { 15 pt plus 0.3 fill } { center },
    { info      } { \__nwafu_cover_author_detailed: } { \__nwafu_line_spread:n {1.60} \nwafu@hei \zihao { 3 } }
                  { 30 pt plus 0.3 fill } { center },
    { date      } { \l__nwafu_info_date_tl } { \nwafu@hei \large }
                  { 0 pt plus 0.3 fill } { center }
  }
\clist_const:Nn \c__nwafu_cover_elements_ii_clist
  {
    { type       } { \__nwafu_cover_ii_type_content: } { \__nwafu_line_spread:n {1.62} \zihao { -3 } }
                   { 50 pt plus 0.3 fill } { center },
    { title      } { \l__nwafu_info_title_en_tl } { \__nwafu_line_spread:n {0.90} \zihao { 1 } \bfseries }
                   { 75 pt plus 0.3 fill } { center },
    { info       } { \__nwafu_cover_author_detailed_en: } { \__nwafu_line_spread:n {1.47} \zihao { -3 } }
                   { 73 pt plus 0.3 fill } { left },
    { date       } { \l__nwafu_info_date_en_tl } { \nwafu@hei \large }
                   { 0 pt plus 0.3 fill } { center },
  }
\clist_const:Nn \c__nwafu_cover_elements_iii_clist
  {
    { id          } { \__nwafu_cover_id: } { \__nwafu_line_spread:n {1.12} \zihao { -4 } }
                    { 35 pt plus 0.3 fill } { center },
    { type        } { \__nwafu_name_simp: \clist_item:Nn \c__nwafu_thesis_type_clist { \g__nwafu_thesis_type_int } }
                    { \zihao { -2 } \bfseries }
                    { 0 pt plus 0.3 fill } { center },
    { title       } { \l__nwafu_info_title_tl } { \zihao { 2 } \sffamily }
                    { 65 pt plus 0.3 fill } { center },
    { instructors } { \__nwafu_cover_instructors: } { \__nwafu_line_spread:n {1.50} \zihao { 3 } \bfseries }
                    { 73 pt plus 0.3 fill } { left },
    { ctitle      } { 答辩委员会 \c__nwafu_fwid_colon_tl } { \zihao { -3 } }
                    { -20 pt plus 0.3 fill } { left },
    { committees  } { \__nwafu_cover_defensecommittees: } { \__nwafu_line_spread:n {1.25} \zihao { -3 } }
                    { 60 pt plus 0.3 fill } { center },
    { date        } { 答辩日期 \c__nwafu_fwid_colon_tl \l__nwafu_info_defensedate_tl } { \zihao { -3 } }
                    { 0 pt plus 0.3 fill } { left }
  }
\clist_const:Nn \c__nwafu_cover_elements_iv_clist
  {
    { foundationtitle } { 项目资助 } { \nwafu@hei \Large }
                        { \c_zero_skip } { center },
    { foundation      } { \__nwafu_cover_foundation: } { \sffamily \zihao { 3 } }
                        { 0 pt plus 0.3 fill } { center }
  }
\clist_const:Nn \c__nwafu_cover_elements_v_clist
  {
    { originality-decl-name } { \c__nwafu_name_orig_decl_tl } { \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily }
                              { 0.25 cm } { center },
    { originality-decl-text } { \par \indent \c__nwafu_orig_decl_text_tl \par } { \zihao { -4 } }
                              { 0.4 cm } { normal },
    { originality-decl-sig  } { \__nwafu_cover_signature:N \c__nwafu_orig_decl_sign_tl } { \zihao { -4 } }
                              { 0.4 cm } { left },
    { supervisor-decl-name  } { \c__nwafu_name_super_decl_tl } { \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily }
                              { 0.25 cm } { center },
    { supervisor-decl-text  } { \par \indent \c__nwafu_super_decl_text_tl \par } { \zihao { -4 } }
                              { 0.4 cm } { normal },
    { supervisor-decl-sig   } { \__nwafu_cover_signature:N \c__nwafu_super_decl_sign_tl } { \zihao { -4 } }
                              { 0 pt plus 0.3 fill } { left }
  }
\clist_const:Nn \c__nwafu_cover_elements_vi_clist
  {
    { authorization-decl-name } { \c__nwafu_name_auth_decl_tl } { \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily }
                                { 0.25 cm } { center },
    { authorization-decl-text } { \par \indent \c__nwafu_auth_decl_text_tl \par } { \zihao { -4 } }
                                { 0.8 cm } { normal },
    { authorization-decl-sig  } { \__nwafu_cover_signature:N \c__nwafu_orig_decl_sign_tl } { \zihao { -4 } }
                                { 0 pt plus 0.3 fill } { left },
    { supervisor-decl-sig     } { \__nwafu_cover_signature:N \c__nwafu_super_decl_sign_tl } { \zihao { -4 } }
                                { 0 pt plus 0.3 fill } { left }
  }
\clist_const:Nn \c__nwafu_cover_elements_vii_clist
  {
    { originality-decl-name   } { \c__nwafu_name_orig_decl_tl } { \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily }
                                { 0.25 cm } { center },
    { originality-decl-text   } { \par \indent \c__nwafu_orig_decl_text_tl \par } { \zihao { -4 } \nwafu@kai }
                                { 0.4 cm } { normal },
    { originality-decl-sig    } { \__nwafu_cover_signature:N \c__nwafu_orig_decl_sign_tl } { \zihao { -4 } \nwafu@kai }
                                { 0.4 cm } { left },
    { authorization-decl-name } { \c__nwafu_name_auth_decl_tl } { \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily }
                                { 0.25 cm } { center },
    { authorization-decl-text } { \par \indent \c__nwafu_auth_decl_text_tl \par } { \zihao { -4 } \nwafu@kai }
                                { 0.4 cm } { normal },
    { authorization-decl-sig  } { \__nwafu_cover_signature:N \c__nwafu_orig_decl_sign_tl } { \zihao { -4 } \nwafu@kai }
                                { -0.5 cm } { left },
    { supervisor-decl-sig     } { \__nwafu_cover_signature:N \c__nwafu_super_decl_sign_tl } { \zihao { -4 } \nwafu@kai }
                                { 0 pt plus 0.3 fill } { left }
  }
\cs_new:Npn \__nwafu_cover_ii_type_content:
  {
    \int_case:nn { \g__nwafu_thesis_type_int }
      {
        {1}
          {
            \__nwafu_fixed_width_center_box:nn { 0.85 \textwidth }
              {
                Dissertation~Submitted~to~\__nwafu_name_en: \\
                in~Partial~Fulfillment~of~the~Requirements \\
                \int_case:nn { \g__nwafu_info_postgraduate_type_int }
                  {
                    {1}{ for~the~Degree~of \\ }
                    {2}{ for~the~Professional~Degree~of \\ }
                  }
                Doctor~of~
                \int_case:nn { \g__nwafu_info_postgraduate_type_int }
                  {
                    {1}{ Philosophy }
                    {2}{ \l__nwafu_info_engineering_title_en_tl }
                  }
              }
          }
        {2}
          {
            \__nwafu_fixed_width_center_box:nn { 0.85 \textwidth }
              {
                Dissertation~Submitted~to~\__nwafu_name_en: \\
                in~Partial~Fulfillment~of~the~Requirements \\
                \int_case:nn { \g__nwafu_info_postgraduate_type_int }
                  {
                    {1}{ for~the~Degree~of \\ }
                    {2}{ for~the~Professional~Degree~of \\ }
                  }
                Master~of~
                \int_case:nn { \g__nwafu_info_postgraduate_type_int }
                  {
                    {1}{ \l__nwafu_info_mastertype_en_tl }
                    {2}{ \l__nwafu_info_engineering_title_en_tl }
                  }
              }
          }
      }
  }
\cs_new_protected:Npn \__nwafu_declare_cover_element:nnnnnn #1#2#3#4#5#6
  {
    \__nwafu_declare_element:nn { #1 / #2 }
      {
        content     = {#3},
        format      = {#4},
        bottom-skip = {#5},
        align       = {#6}
      }
  }
\cs_new_protected:Npn \__nwafu_declare_cover_elements:nn #1#2
  {
    \clist_map_inline:Nn #2
    {
      \__nwafu_declare_cover_element:nnnnnn { #1 } ##1
    }
  }
\__nwafu_declare_cover_elements:nn { cover / o } { \c__nwafu_cover_elements_o_clist }
\__nwafu_declare_cover_elements:nn { cover / i / grad } { \c__nwafu_cover_elements_i_graduate_clist }
\__nwafu_declare_cover_elements:nn { cover / i / bach } { \c__nwafu_cover_elements_i_bachelor_clist }
\__nwafu_declare_cover_elements:nn { cover / ii } { \c__nwafu_cover_elements_ii_clist }
\__nwafu_declare_cover_elements:nn { cover / iii } { \c__nwafu_cover_elements_iii_clist }
\__nwafu_declare_cover_elements:nn { cover / iv } { \c__nwafu_cover_elements_iv_clist }
\__nwafu_declare_cover_elements:nn { cover / v } { \c__nwafu_cover_elements_v_clist }
\__nwafu_declare_cover_elements:nn { cover / vi } { \c__nwafu_cover_elements_vi_clist }
\__nwafu_declare_cover_elements:nn { cover / vii } { \c__nwafu_cover_elements_vii_clist }
\__nwafu_declare_page:nx { cover-o-default }
  {
    content     = { logo, type, titlezh, titleen, info, date },
    prefix      = cover / o /,
    bottom-skip = 0 pt plus 1.5 fill
  }
\__nwafu_declare_page:nx { cover-i-default }
  {
    content     = \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                    {
                      { logo, type, titlezh, info, date}
                    }{
                      { id, logo, type, titlezh, titleen, info, date }
                    },
    prefix      = cover / i / \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                                { grad } { bach } /,
    top-skip    = \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                    {
                      30 pt plus 1.5 fill,
                    }{
                      -40 pt plus 1.5 fill,
                    },
    bottom-skip = 0 pt plus 1.5 fill
  }
\__nwafu_declare_page:nn { cover-ii-default }
  {
    content     = { type, title, info, date },
    prefix      = cover / ii /,
    top-skip    = 30 pt plus 0.1 fill,
    bottom-skip = 0 pt plus 1.5 fill
  }
\__nwafu_declare_page:nn { cover-iii-default }
  {
    content     = { id, type, title, instructors, ctitle, committees, date },
    prefix      = cover / iii /,
    top-skip    = -55 pt plus 0.1 fill,
    bottom-skip = 0 pt plus 0.5 fill
  }
\__nwafu_declare_page:nx { cover-iv-default }
  {
    content     = \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                {
                    { foundation }
                }{
                    { foundationtitle, foundation }
                },
    prefix      = cover / iv /,
  }
\__nwafu_declare_page:nn { cover-v-default }
  {
    content     = { originality-decl-name,
                    originality-decl-text,
                    originality-decl-sig,
                    supervisor-decl-name,
                    supervisor-decl-text,
                    supervisor-decl-sig
                  },
    prefix      = cover / v /,
    format      = \__nwafu_line_spread:n { 1.25 },
    top-skip    = 0 pt plus 0.2 fill,
    bottom-skip = 0 pt plus 2.5 fill
  }
\__nwafu_declare_page:nn { cover-vi-default }
  {
    content     = { authorization-decl-name,
                    authorization-decl-text,
                    authorization-decl-sig,
                    supervisor-decl-sig
                  },
    prefix      = cover / vi /,
    format      = \__nwafu_line_spread:n { 1.25 },
    top-skip    = 0 pt plus 0.2 fill,
    bottom-skip = 0 pt plus 2.5 fill
  }
\__nwafu_declare_page:nn { cover-vii-default }
  {
    content     = { originality-decl-name,
                    originality-decl-text,
                    originality-decl-sig,
                    authorization-decl-name,
                    authorization-decl-text,
                    authorization-decl-sig,
                    supervisor-decl-sig
                  },
    prefix      = cover / vii /,
    format      = \__nwafu_line_spread:n { 1.25 },
    top-skip    = 0 pt plus 0.2 fill,
    bottom-skip = 0 pt plus 2.5 fill
  }
\NewDocumentCommand \makecovero { }
  {
    \thispagestyle { empty }
    \newgeometry{top=1.0in, bottom=1.0in, left=1.25in, right=1.25in}
    \UseInstance { nwafu } { cover-o-default }
    \restoregeometry
  }
\NewDocumentCommand \makecoveri { }
  {
    \thispagestyle { empty }
    \newgeometry{top=1.0in, bottom=1.0in, left=1.25in, right=1.25in}
    \UseInstance { nwafu } { cover-i-default }
    \restoregeometry
  }
\NewDocumentCommand \makecoverii { }
  {
    \thispagestyle { empty }
    \newgeometry{top=1.0in, bottom=1.0in, left=1.25in, right=1.25in}
    \UseInstance { nwafu } { cover-ii-default }
    \restoregeometry
  }
\NewDocumentCommand \makecoveriii { }
  {
    \thispagestyle { empty }
    \newgeometry{top=1.0in, bottom=1.0in, left=1.25in, right=1.25in}
    \UseInstance { nwafu } { cover-iii-default }
    \restoregeometry
  }
\NewDocumentCommand \makecoveriv { }
  {
    \thispagestyle { empty }
    \newgeometry{top=1.0in, bottom=1.0in, left=1.25in, right=1.25in}
    \UseInstance { nwafu } { cover-iv-default }
    \restoregeometry
  }
\NewDocumentCommand \makecoverv { }
  {
    \thispagestyle { empty }
    \newgeometry{top=1.0in, bottom=1.0in, left=1.15in, right=1.15in}
    \UseInstance { nwafu } { cover-v-default }
    \restoregeometry
  }
\NewDocumentCommand \makecovervi { }
  {
    \thispagestyle { empty }
    \newgeometry{top=1.0in, bottom=1.0in, left=1.12in, right=1.12in}
    \UseInstance { nwafu } { cover-vi-default }
    \restoregeometry
  }
\NewDocumentCommand \makecovervii { }
  {
    \thispagestyle { empty }
    \newgeometry{top=1.0in, bottom=1.0in, left=1.25in, right=1.25in}
    \UseInstance { nwafu } { cover-vii-default }
    \restoregeometry
  }
\bool_new:N \g__nwafu_auto_make_cover_bool
\keys_define:nn { nwafu / style }
  {
    auto-make-cover .bool_gset:N = \g__nwafu_auto_make_cover_bool,
    auto-make-cover .default:n  = true
  }
\NewDocumentCommand \makecovers { }
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \begin{titlepage}
          \makecoveri
          \cleardoublepage
          \makecoverii
          \cleardoublepage
          \makecoveriii
          \clist_if_empty:NF \l__nwafu_info_foundation_clist
            {
              \cleardoublepage
              \makecoveriv
            }
          \cleardoublepage
          \makecoverv
          \newpage
          \makecovervi
        \end{titlepage}
      }{
        \begin{titlepage}
          \makecovero
          \cleardoublepage
          \makecoveri
          \clist_if_empty:NF \l__nwafu_info_foundation_clist
            {
              \cleardoublepage
              \makecoveriv
            }
          \cleardoublepage
          \makecovervii
        \end{titlepage}
      }
  }
\tl_new:N    \l__nwafu_abstract_file_tl
\tl_new:N    \l__nwafu_abstract_file_en_tl
\clist_new:N \l__nwafu_abstract_keywords_clist
\clist_new:N \l__nwafu_abstract_keywords_en_clist
\tl_new:N    \l__nwafu_notation_file_tl
\tl_new:N    \l__nwafu_terminology_file_tl
\keys_define:nn { nwafu / abstract }
  {
    abstractfile  .tl_set:N = \l__nwafu_abstract_file_tl,
    abstractfile* .tl_set:N = \l__nwafu_abstract_file_en_tl,
    keywords  .clist_set:N = \l__nwafu_abstract_keywords_clist,
    keywords* .clist_set:N = \l__nwafu_abstract_keywords_en_clist,
    notationfile  .tl_set:N  = \l__nwafu_notation_file_tl,
    notationfile  .default:n = {},
    termfile  .tl_set:N  = \l__nwafu_terminology_file_tl,
    termfile  .default:n = {},
  }
\NewDocumentEnvironment { abstract  } { }
  { \__nwafu_abstract_begin:    } { \__nwafu_abstract_end:      }
\NewDocumentEnvironment { abstract* } { }
  { \__nwafu_abstract_en_begin: } { \__nwafu_abstract_en_end:   }
\cs_new_protected:Npn \__nwafu_abstract_begin:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \__nwafu_chapter:V \c__nwafu_name_abstract_tl
        \par \mode_leave_vertical: \par
      }{
        \__nwafu_chapter:V \c__nwafu_name_abstract_tl
        \par \mode_leave_vertical: \par
      }
  }
\cs_new_protected:Npn \__nwafu_abstract_en_begin:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \__nwafu_chapter:n \c__nwafu_name_abstract_en_tl
        \par \mode_leave_vertical: \par
      }{
        \__nwafu_chapter:n \c__nwafu_name_abstract_en_tl
        \par \mode_leave_vertical: \par
      }
  }
\cs_new_protected:Npn \__nwafu_abstract_end:
  {
    \__nwafu_keywords:nNn
      { \c__nwafu_name_keywords_tl \c__nwafu_fwid_colon_tl }
      \l__nwafu_abstract_keywords_clist { ; ~}
  }
\cs_new_protected:Npn \__nwafu_abstract_en_end:
  {
    \__nwafu_keywords:nNn
      {\c__nwafu_name_keywords_en_tl : ~ }
      \l__nwafu_abstract_keywords_en_clist { ; ~ }
  }
\cs_new_protected:Npn \__nwafu_keywords:nNn #1#2#3
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \par \mode_leave_vertical: \par \noindent
        \__nwafu_get_text_width:Nn \l__nwafu_tmpa_dim {#1}
        \group_begin: \small\bfseries \MakeUppercase{#1} \group_end:
        \parbox [t] { \dim_eval:n { \textwidth - \l__nwafu_tmpa_dim } }
          {
            \small
            \clist_use:Nn #2 {#3} \par
          }
      }{
        \par \mode_leave_vertical: \par
        \__nwafu_get_text_width:Nn \l__nwafu_tmpa_dim {#1}
        \group_begin:  \small\bfseries \MakeUppercase{#1} \group_end:
        \group_begin:
          \small
          \clist_use:Nn #2 {#3} \par
        \group_end:
      }
  }
\NewDocumentEnvironment { figtablist } { }
  {
    \group_begin:
      \__nwafu_chapter:V \c__nwafu_name_figtabtoc_tl
      \RenewDocumentCommand \addvspace { m } { }
      \RenewDocumentCommand \listoffigures { } { \@starttoc { lof } }
      \RenewDocumentCommand \listoftables  { } { \@starttoc { lot } }
  }
  {
    \group_end:
  }
\NewTblrTheme{empty}{
    \SetTblrStyle{firstfoot,middlefoot,lastfoot}{font=\small}
    \DefTblrTemplate{firsthead}{default}{}
    \DefTblrTemplate{middlehead}{default}{}
    \DefTblrTemplate{lasthead}{default}{}
    \DefTblrTemplate{contfoot-text}{default}{（接下页）}
  }
\NewDocumentEnvironment { notation } { O{ } }
  {
    \group_begin:
      \__nwafu_notation_begin:
      \begin{longtblr}[
        theme = empty,
        entry = none,
        presep = 0pt,
      ]{
        width      = 0.95\textwidth,
        colspec    = { X[2,c,m] X[2,c,m] X[5.5,l,m] },
        hline{1,Z} = { \heavyrulewidth, solid },
        hline{2}   = { \lightrulewidth, solid },
        row{1}     = { c, m, font = \small\bfseries },
        #1,
      }
  }
  {
      \end{longtblr}
    \group_end:
  }
\cs_new_protected:Npn \__nwafu_notation_begin:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \__nwafu_chapter_no_toc:V \c__nwafu_name_notation_tl
      }{
        \__nwafu_chapter:V \c__nwafu_name_notation_tl
      }
  }
\NewDocumentEnvironment { terminology } { O{ } }
  {
    \group_begin:
      \__nwafu_terminology_begin:
      \begin{longtblr}[
        theme = empty,
        entry = none,
        presep = 0pt,
      ]{
        width      = 0.95\textwidth,
        colspec    = { X[3,c,m] X[6.5,l,m] },
        hline{1,Z} = { \heavyrulewidth, solid },
        hline{2}   = { \lightrulewidth, solid },
        row{1}     = {c, m, font = \small\bfseries },
        #1,
      }
  }
  {
      \end{longtblr}
    \group_end:
  }
\cs_new_protected:Npn \__nwafu_terminology_begin:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \__nwafu_chapter_no_toc:V \c__nwafu_name_terminology_tl
      }{
        \__nwafu_chapter:V \c__nwafu_name_terminology_tl
      }
  }
\cs_new_protected:Npn \__nwafu_front_component_abstract_zh:
  {
    \tl_if_empty:NF \l__nwafu_abstract_file_tl
      {
        \cleardoublepage
        \begin{abstract}
          \file_input:V \l__nwafu_abstract_file_tl
        \end{abstract}
      }
  }
\cs_new_protected:Npn \__nwafu_front_component_abstract_en:
  {
    \tl_if_empty:NF \l__nwafu_abstract_file_en_tl
      {
        \cleardoublepage
        \begin{abstract*}
          \file_input:V \l__nwafu_abstract_file_en_tl
        \end{abstract*}
      }
  }
\cs_new_protected:Npn \__nwafu_front_component_abstract_en_bachelor:
  {
    \tl_if_empty:NF \l__nwafu_abstract_file_en_tl
      {
        \cleardoublepage
        \begin{abstract*}
          \file_input:V \l__nwafu_abstract_file_en_tl
        \end{abstract*}
      }
  }
\cs_new_protected:Npn \__nwafu_front_component_toc_graduate:
  {
    \cleardoublepage
    \tableofcontents
  }
\cs_new_protected:Npn \__nwafu_front_component_toc_bachelor:
  {
    \cleardoublepage
    \tableofcontents
  }
\cs_new_protected:Npn \__nwafu_front_component_notation:
  {
    \tl_if_empty:NF \l__nwafu_notation_file_tl
      {
        \cleardoublepage
        \file_input:V \l__nwafu_notation_file_tl
      }
  }
\cs_new_protected:Npn \__nwafu_front_component_notation_graduate:
  {
    \tl_if_empty:NF \l__nwafu_notation_file_tl
      {
        \cleardoublepage
        \file_input:V \l__nwafu_notation_file_tl
      }
  }
\cs_new_protected:Npn \__nwafu_front_component_terminology:
  {
    \tl_if_empty:NF \l__nwafu_terminology_file_tl
      {
        \cleardoublepage
        \file_input:V \l__nwafu_terminology_file_tl
      }
  }
\cs_new_protected:Npn \__nwafu_front_component_figtabtoc:
  {
    \bool_if:NT \g__nwafu_figtabtoc_bool
      {
        \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
          {
            \group_begin:
              \cleardoublepage
              \RenewDocumentCommand \addvspace { m } { }
              \listoffigures
              \listoftables
            \group_end:
          }{
            \cleardoublepage
            \begin{figtablist}
              \listoffigures
              \listoftables
            \end{figtablist}
          }
      }
  }
\cs_new_protected:Npn \__nwafu_execute_frontmatter:n #1
  {
    \clist_map_inline:Nn #1
      {
        \use:n { ##1 }
      }
  }
\cs_new_protected:Npn \__nwafu_makefront_graduate:
  {
    \frontmatter
    \__nwafu_execute_frontmatter:n \c__nwafu_frontmatter_graduate_clist
  }
\cs_new_protected:Npn \__nwafu_makefront_bachelor:
  {
    \frontmatter
    \__nwafu_execute_frontmatter:n \c__nwafu_frontmatter_bachelor_clist
  }
\clist_const:Nn \c__nwafu_frontmatter_graduate_clist
  {
    { \__nwafu_front_component_abstract_zh:       },
    { \__nwafu_front_component_abstract_en:       },
    { \__nwafu_front_component_toc_graduate:      },
    { \__nwafu_front_component_figtabtoc:         },
    { \__nwafu_front_component_notation_graduate: }
  }
\clist_const:Nn \c__nwafu_frontmatter_bachelor_clist
  {
    { \__nwafu_front_component_abstract_zh:          },
    { \__nwafu_front_component_abstract_en_bachelor: },
    { \__nwafu_front_component_toc_bachelor:         },
    { \__nwafu_front_component_figtabtoc:            },
    { \__nwafu_front_component_notation:             },
    { \__nwafu_front_component_terminology:          }
  }
\NewDocumentCommand \makefront { }
  {
    \restoregeometry
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      { \__nwafu_makefront_graduate: }
      { \__nwafu_makefront_bachelor: }
  }
\ctex_after_end_preamble:n
  {
    \bool_if:NT \g__nwafu_auto_make_cover_bool
      {
        \makecovers
        \makefront
      }
  }
\keys_set:nn { ctex }
  {
    contentsname   = \c__nwafu_name_toc_tl,
    listfigurename = \c__nwafu_name_lof_tl,
    listtablename  = \c__nwafu_name_lot_tl,
  }
\clist_const:Nn \c__nwafu_toc_levels_clist
  {
    { chapter    } { 0 },
    { section    } { 0 },
    { subsection } { 0 },
    { figure     } { 1 },
    { table      } { 1 }
  }
\clist_map_inline:nn { chapter, section, subsection, figure, table }
  {
    \clist_map_inline:nn { format, indent, rule, numsep }
      { \tl_new:c {g__nwafu_toc_ #1 _ ##1 _tl } }

    \dim_new:c {g__nwafu_toc_ #1 _offset_dim }
  }
\bool_new:N \g__nwafu_toc_line_align_bool
\bool_new:N \g__nwafu_titletoc_hang_fix_bool

\cs_new_protected:Npn \__nwafu_setup_toc_format_graduate:
  {
    \tl_set:Nn  \g__nwafu_toc_chapter_format_tl  { \addvspace{1pt} \nwafu@hei }
    \tl_set:Nn  \g__nwafu_toc_chapter_indent_tl  { 0pc                        }
    \tl_set:Nn  \g__nwafu_toc_chapter_rule_tl    { \tocrule{$\cdot$}          }
    \tl_set:Nn  \g__nwafu_toc_chapter_numsep_tl  { 0.5\ccwd                   }
    \dim_set:Nn \g__nwafu_toc_chapter_offset_dim { 0pc                        }
    \tl_set:Nn  \g__nwafu_toc_section_format_tl  { \addvspace{0pt}   }
    \tl_set:Nn  \g__nwafu_toc_section_indent_tl  { \ccwd             }
    \tl_set:Nn  \g__nwafu_toc_section_rule_tl    { \tocrule{$\cdot$} }
    \tl_set:Nn  \g__nwafu_toc_section_numsep_tl  { 0.5\ccwd          }
    \dim_set:Nn \g__nwafu_toc_section_offset_dim { 0pc               }
    \tl_set:Nn  \g__nwafu_toc_subsection_format_tl  { \addvspace{0pt}   }
    \tl_set:Nn  \g__nwafu_toc_subsection_indent_tl  { 2.0\ccwd          }
    \tl_set:Nn  \g__nwafu_toc_subsection_rule_tl    { \tocrule{$\cdot$} }
    \tl_set:Nn  \g__nwafu_toc_subsection_numsep_tl  { 0.5\ccwd          }
    \dim_set:Nn \g__nwafu_toc_subsection_offset_dim { 0pc               }
    \tl_set:Nn  \g__nwafu_toc_figure_format_tl  { \addvspace{0pt}   }
    \tl_set:Nn  \g__nwafu_toc_figure_indent_tl  { 0pc               }
    \tl_set:Nn  \g__nwafu_toc_figure_rule_tl    { \tocrule{$\cdot$} }
    \tl_set:Nn  \g__nwafu_toc_figure_numsep_tl  { 0.5\ccwd          }
    \dim_set:Nn \g__nwafu_toc_figure_offset_dim { 0pc               }
    \tl_set:Nn  \g__nwafu_toc_table_format_tl  { \addvspace{0pt}   }
    \tl_set:Nn  \g__nwafu_toc_table_indent_tl  { 0pc               }
    \tl_set:Nn  \g__nwafu_toc_table_rule_tl    { \tocrule{$\cdot$} }
    \tl_set:Nn  \g__nwafu_toc_table_numsep_tl  { 0.5\ccwd          }
    \dim_set:Nn \g__nwafu_toc_table_offset_dim { 0pc               }
    \bool_set_false:N \g__nwafu_toc_line_align_bool
    \bool_set_false:N \g__nwafu_titletoc_hang_fix_bool
  }
\cs_new_protected:Npn \__nwafu_setup_toc_format_bachelor:
  {
    \tl_set:Nn  \g__nwafu_toc_chapter_format_tl  { \addvspace{1pt} \nwafu@hei }
    \tl_set:Nn  \g__nwafu_toc_chapter_indent_tl  { 0pc                        }
    \tl_set:Nn  \g__nwafu_toc_chapter_rule_tl    { \tocrule{$\cdot$}          }
    \tl_set:Nn  \g__nwafu_toc_chapter_numsep_tl  { 0.5\ccwd                   }
    \dim_set:Nn \g__nwafu_toc_chapter_offset_dim { 1pt                        }
    \tl_set:Nn  \g__nwafu_toc_section_format_tl  { \addvspace{1pt} \small }
    \tl_set:Nn  \g__nwafu_toc_section_indent_tl  { \ccwd                  }
    \tl_set:Nn  \g__nwafu_toc_section_rule_tl    { \tocrule{$\cdot$}      }
    \tl_set:Nn  \g__nwafu_toc_section_numsep_tl  { 0.5\ccwd               }
    \dim_set:Nn \g__nwafu_toc_section_offset_dim { 1pt                    }
    \tl_set:Nn  \g__nwafu_toc_subsection_format_tl  { \addvspace{1pt} \small }
    \tl_set:Nn  \g__nwafu_toc_subsection_indent_tl  { 2.0\ccwd               }
    \tl_set:Nn  \g__nwafu_toc_subsection_rule_tl    { \tocrule{$\cdot$}      }
    \tl_set:Nn  \g__nwafu_toc_subsection_numsep_tl  { 0.5\ccwd               }
    \dim_set:Nn \g__nwafu_toc_subsection_offset_dim { 1pt                    }
    \tl_set:Nn  \g__nwafu_toc_figure_format_tl  { \addvspace{0pt}   }
    \tl_set:Nn  \g__nwafu_toc_figure_indent_tl  { 0pc               }
    \tl_set:Nn  \g__nwafu_toc_figure_rule_tl    { \tocrule{$\cdot$} }
    \tl_set:Nn  \g__nwafu_toc_figure_numsep_tl  { 0.5\ccwd          }
    \dim_set:Nn \g__nwafu_toc_figure_offset_dim { 1pt               }
    \tl_set:Nn  \g__nwafu_toc_table_format_tl  { \addvspace{0pt}    }
    \tl_set:Nn  \g__nwafu_toc_table_indent_tl  { 0pc               }
    \tl_set:Nn  \g__nwafu_toc_table_rule_tl    { \tocrule{$\cdot$} }
    \tl_set:Nn  \g__nwafu_toc_table_numsep_tl  { 0.5\ccwd          }
    \dim_set:Nn \g__nwafu_toc_table_offset_dim { 1pt               }
    \bool_set_false:N \g__nwafu_toc_line_align_bool
    \bool_set_false:N \g__nwafu_titletoc_hang_fix_bool
  }
\cs_new_protected:Npn \__nwafu_setup_toc_level:nn #1#2
  {
    \titlecontents{#1}
      [ \use:c { g__nwafu_toc_ #1 _indent_tl } ]
      { \use:c { g__nwafu_toc_ #1 _format_tl } }
      {
        \int_compare:nNnTF {#2} = { 1 }
          {
            \str_if_eq:nnT {#1} { figure }
              { \hspace*{0.5em}图~\thecontentslabel\quad }
            \str_if_eq:nnT {#1} { table }
              { \hspace*{0.5em}表~\thecontentslabel\quad }
          }{
            \bool_if:NT \g__nwafu_titletoc_hang_fix_bool
              {
                \contentspush
                  {
                    \thecontentslabel
                    \hspace{ \use:c { g__nwafu_toc_ #1 _numsep_tl } }
                  }
              }
          }
      }
      { }
      { \use:c { g__nwafu_toc_ #1 _rule_tl } }
      [ \addvspace { \use:c { g__nwafu_toc_ #1 _offset_dim } } ]
  }
\cs_new_protected:Npn \__nwafu_setup_all_toc_levels:
  {
    \clist_map_inline:Nn \c__nwafu_toc_levels_clist
      {
        \__nwafu_setup_toc_level:nn ##1
      }
  }
\cs_new_protected:Npn \__nwafu_setup_toc_format:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      { \__nwafu_setup_toc_format_graduate: }
      { \__nwafu_setup_toc_format_bachelor: }
    \__nwafu_setup_all_toc_levels:
  }
\__nwafu_setup_toc_format:
\cs_new:Npn \NWAFUNumberLine #1
  {
    \CTEXifname
      {
        \use:c { CTEXthe#1 }
        \hspace{\use:c { g__nwafu_toc_#1_numsep_tl }}
      }{}
  }

\bool_if:NTF \g__nwafu_titletoc_hang_fix_bool
  {
    \keys_set:nn { ctex }
      {
        chapter/tocline     = \CTEXnumberline{#1}#2,
        section/tocline     = \CTEXnumberline{#1}#2,
        subsection/tocline  = \CTEXnumberline{#1}#2
      }
  }{
    \keys_set:nn { ctex }
      {
        chapter/tocline     = \NWAFUNumberLine{#1}#2,
        section/tocline     = \NWAFUNumberLine{#1}#2,
        subsection/tocline  = \NWAFUNumberLine{#1}#2,
      }
 }
\NewDocumentCommand{\tocrule}{sO{0.3pc}D(){1.2}mO{}}
  {
    \small\normalfont
    \titlerule*[#2]{\scalebox{#3}{#4}}#5
    \IfBooleanTF{#1}
      {\thecontentspage}
      {
        \bool_if:NTF \g__nwafu_toc_line_align_bool
          {\contentspage}{\thecontentspage}
      }
  }
\NewDocumentEnvironment { acknowledgement } { }
  {
    \group_begin:
    \__nwafu_chapter:V \c__nwafu_name_ack_tl
  }
  {
    \group_end:
  }
\NewDocumentEnvironment { resume } { }
  {
    \group_begin:
    \__nwafu_chapter:V \c__nwafu_name_resume_tl
  }
  {
    \group_end:
  }
\NewDocumentCommand{ \resumitem }{ O{ 学习经历 } }
  {%
    \vspace{24bp}{\zihao{-4}\nwafu@hei\bfseries\centerline{#1}}\par\vspace{6bp}
  }
\NewDocumentCommand{ \researchitem }{ O{ 发表的学术论文 } }
  {%
    \vspace{32bp}{\zihao{-4}\nwafu@hei\bfseries\centerline{#1}}\par\vspace{14bp}
  }
\newlist{publications}{enumerate}{1}
\setlist[publications]{label=[\arabic*],align=left,nosep,itemsep=3bp,
  leftmargin=10mm,before=\zihao{5},resume}
\newlist{achievements}{enumerate}{1}
\setlist[achievements]{label=[\arabic*],align=left,nosep,itemsep=3bp,
  leftmargin=10mm,before=\zihao{5}}
\def\publicationskip{\bigskip\bigskip}
\clist_new:N \l__nwafu_bib_resource_clist
\keys_define:nn { nwafu / style }
  {
    bib-resource .clist_set:N = \l__nwafu_bib_resource_clist
  }
\__nwafu_at_end_preamble:n
  {
    \__nwafu_biblatex_pre_setup:
    \RequirePackage { biblatex }
    \__nwafu_biblatex_post_setup:
  }
\cs_new_protected:Npn \__nwafu_biblatex_pre_setup:
  {
    \__nwafu_pass_options_to_biblatex:n { style = gb7714-NWAFU }
    \__nwafu_pass_options_to_biblatex:n
      {
        gbtype = true,           % 文献类型标识 [J]/[M]/[D] 等
        gbfieldtype = true,      % 文献类型字段标识
      }
  }
\cs_new_protected:Npn \__nwafu_biblatex_post_setup:
  {
    \clist_map_function:NN \l__nwafu_bib_resource_clist \addbibresource
    \defbibheading { bibliography } [ \bibname ] { \__nwafu_chapter:n {##1} }
    \DeclareDelimFormat[cite,parencite,citep]{nameyeardelim}{\addcomma\space}
    \renewcommand*{\nameyeardelim}{\addcomma\space}
    \DeclareDelimFormat[bib,biblist]{nameyeardelim}{\addcomma\space}
    \DeclareFieldFormat[article]{journaltitle}{##1\isdot}
  }
\cs_new_protected:Npn \__nwafu_pass_options_to_biblatex:n #1
  { \PassOptionsToPackage {#1} { biblatex } }
\skip_set:Nn \parskip { 0pt plus 2pt minus 1pt }
\skip_set:Nn \intextsep { 14pt plus 2pt minus 2pt }
\skip_set:Nn \textfloatsep { 16pt plus 2pt minus 4pt }
\allowdisplaybreaks[4]
\ctex_after_end_preamble:n
  {
    \skip_set:Nn \abovedisplayskip { 5pt plus 1pt minus 1pt }
    \skip_set:Nn \belowdisplayskip { 5pt plus 1pt minus 1pt }
    \skip_set:Nn \abovedisplayshortskip { 0pt }
    \skip_set:Nn \belowdisplayshortskip { 5pt plus 1pt minus 1pt }
    \bool_if:NT \g__nwafu_anonymous_bool
      {
        \RenewDocumentEnvironment { acknowledgement } { } { } { }
        \RenewDocumentEnvironment { resume } { } { } { }
      }
  }
\DeclareCaptionLabelSeparator{ccwd}{\hspace{0.5\ccwd}}
\DeclareCaptionLabelFormat{parens}{\bothIfFirst{#1}{~}(#2)}
\DeclareCaptionFont{nwafu@table@font}{\small}
\DeclareCaptionFont{nwafu@figure@font}{\small}
\DeclareCaptionFont{nwafu@subtable@font}{\small}
\DeclareCaptionFont{nwafu@subfigure@font}{\small}
\captionsetup
  {
    format          = hang,
    font            = {stretch = 1},
    labelsep        = ccwd,
    singlelinecheck = true,
    skip            = 4bp,
  }
\captionsetup[table]{font += nwafu@table@font}
\captionsetup[figure]{font += nwafu@figure@font}
\captionsetup[subfigure]
  {
    labelformat = parens,
    font       = nwafu@subfigure@font,
    belowskip   = 2pt,
    aboveskip   = 6pt
  }
\DeclareCaptionOption{bi-first}[format=hang,hangindent=-0.5em]{
    \def\tablename{表}
    \def\figurename{图}
  }
\DeclareCaptionOption{bi-second}[format=hang,hangindent=-2em]{
    \def\tablename{Tab.}
    \def\figurename{Fig.}
  }
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\AddToHook { env/figure/end }
  { \centering }
\AddToHook { env/table/end }
  { \centering }
\__nwafu_at_begin_environment:nn { tabular }
  {
    \exp_args:Nx \linespread { 1.15 }
    \small\selectfont\ignorespaces
  }
\cs_set:Npn \thefigure { \thechapter - \__nwafu_arabic:n { figure } }
\cs_set:Npn \thetable  { \thechapter - \__nwafu_arabic:n { table  } }
\SetTblrDefault
  {
    cells = { font = \small },
    stretch = 0.90,
    rowsep = 0pt,
    colsep = 6pt,
    hline = { \lightrulewidth },
    vline = { \lightrulewidth },
    hline{1,Z} = { \heavyrulewidth, solid },
  }
\DefTblrTemplate{caption-tag}{default}{表\hspace{0.25em}\thetable}
\DefTblrTemplate{contfoot-text}{default}{接下页}
\DefTblrTemplate{caption-sep}{default}{\enskip}
\DefTblrTemplate{conthead-text}{default}{\!（续）}

\NewTblrTheme{fancy}{
    \SetTblrStyle{firsthead,mddlehead,lasthead}{font=\centering\small}
    \SetTblrStyle{firstfoot}{font=\small}
    \SetTblrStyle{middlefoot}{font=\small}
    \SetTblrStyle{lastfoot}{font=\small}
  }
\SetTblrInner[talltblr, longtblr]{
    hline = { \lightrulewidth },
    vline = { \lightrulewidth },
    hline{1,Z} = { \heavyrulewidth, solid },
    cells = {font=\small},
    rowhead = 1,
    stretch = 0.90,
    rowsep = 0pt,
    colsep = 6pt,
  }
\UseTblrLibrary{booktabs}
\cs_new_protected:Npn \__nwafu_enumitem_label_set:nn #1#2
  { \SetEnumitemValue{label}{#1}{#2} }
\clist_map_inline:nn
  {
    { bullet   } { \textbullet                                               },
    { endash   } { \normalfont\bfseries\textendash                           },
    { asterisk } { \textasteriskcentered                                     },
    { numeric  } { \arabic*. \enskip                                         },
    { arabic   } { \c__nwafu_fwid_left_paren_tl\arabic*\c__nwafu_fwid_right_paren_tl },
    { alph     } { \c__nwafu_fwid_left_paren_tl\alph*\c__nwafu_fwid_right_paren_tl   },
    { roman    } { \roman*.                                                  },
    { outline  } { \upshape\ding{111}                                        }
  }
  { \__nwafu_enumitem_label_set:nn #1 }
\SetEnumitemValue{font}{sf}{\normalfont\sffamily}
\SetEnumitemValue{ref}{enumii}{\arabic{enumi}.\alph*}
\SetEnumitemValue{ref}{enumiii}{\arabic{enumi}.\alph{enumii}.\roman*}
\setlist
  {
    nosep,
    leftmargin  = *,
    labelindent = \dimexpr\parindent+0pt\relax,
    labelsep    = 0pt,
    wide        = \parindent,
  }
\setlist[itemize,1]{label = bullet}
\setlist[itemize,2]{label = endash}
\setlist[itemize,3]{label = asterisk}
\setlist[enumerate,1]{label = numeric,ref = \arabic*}
\setlist[enumerate,2]{label = arabic,ref = enumii}
\setlist[enumerate,3]{label = alph,ref = enumiii,labelwidth = *}
\setlist[description]{font = sf,labelwidth = *,leftmargin = 2\ccwd}
\NewDocumentCommand \hypersetup { m }
  { \nwafu_hyperref_setup:n {#1} }
\cs_new_protected:Npn \nwafu_hyperref_setup:n #1
  { \clist_gput_right:Nn \g__nwafu_to_hyperref_clist {#1} }
\cs_new:Npn \__nwafu_set_hyperlink_color_key:n #1
  {
    hyperlink-color / \clist_item:nn {#1} {1} .code:n =
      {
        \__nwafu_define_hyperlink_color:nnn
          { \clist_item:nn {#1} {2} }
          { \clist_item:nn {#1} {3} }
          { \clist_item:nn {#1} {4} }
        \nwafu_hyperref_setup:n
          {
            linkcolor = nwafu@link, linkbordercolor = nwafu@link,
            urlcolor  = nwafu@url,  urlbordercolor  = nwafu@url,
            citecolor = nwafu@cite, citebordercolor = nwafu@cite
          }
      },
  }
\cs_new_protected:Npn \__nwafu_define_hyperlink_color:nnn #1#2#3
  {
    \definecolorset { HTML } { nwafu@ } { }
      { link, #1; url, #2; cite, #3 }
  }
\keys_define:nx { nwafu / style }
  {
    hyperlink .choice:,
    hyperlink .value_required:n = true,
    hyperlink / border .code:n = { },
    hyperlink / color  .code:n =
      { \nwafu_hyperref_setup:n { colorlinks = true } },
    hyperlink / none   .code:n =
      { \nwafu_hyperref_setup:n { hidelinks  = true } },
    hyperlink-color .choice:,
    hyperlink-color .value_required:n = true,
    \clist_map_function:nN
      {
        { autumn,    D70000, D75F00, AF8700 },
        { business,  D14542, 295497, 1F6E43 },
        { classic,   FF0000, 0000FF, 00FF00 },
        { default,   990000, 0000B2, 007F00 },
        { elegant,   961212, C31818, 9B764F },
        { fantasy,   FF4A19, FF3F94, 934BA1 },
        { material,  E91E63, 009688, 4CAF50 },
        { science,   CA0619, 389F9D, FF8920 },
        { summer,    00AFAF, 5F5FAF, 5F8700 },
        { graylevel, 616161, 616161, 616161 },
        { prl,       2D3092, 2D3092, 2D3092 }
      }
      \__nwafu_set_hyperlink_color_key:n
  }
\cs_new:Npn \nwafu_allow_url_break:
  {
    \cs_new:Npn \__nwafu_add_url_break_points:
      { \tl_map_function:NN \c__nwafu_url_break_points_tl \do }
    \__nwafu_appto_cmd:Nn \UrlBreaks
      { \UrlOrds \__nwafu_add_url_break_points: }
  }
\tl_const:Nn \c__nwafu_url_break_points_tl
  {
    abcdefghijklmnopqrstuvwxyz
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    0123456789
  }
\ctex_at_end_preamble:n
  {
    \RequirePackage { hyperref }
    \tl_set_eq:NN \l_tmpa_tl \l__nwafu_info_title_tl
    \tl_replace_all:Nnn \l_tmpa_tl { \\ } { ~ }
    \hypersetup
      {
        bookmarksnumbered = true,
        psdextra          = true,
        unicode           = true,
        pdftitle    = \l_tmpa_tl,
        pdfauthor   = \l__nwafu_info_author_tl,
        pdfkeywords = \l__nwafu_abstract_keywords_clist,
        pdfcreator  = \c__nwafu_name_pdf_creator_tl
      }
    \exp_args:NV \hypersetup \g__nwafu_to_hyperref_clist
    \nwafu_allow_url_break:
    \BiblatexManualHyperrefOn
  }
\ctex_at_end_package:nn { hyperref }
  {
    \pdfstringdefDisableCommands
      {
        \cs_set_eq:NN \nwafu@kai \prg_do_nothing:
        \cs_set_eq:NN \quad    \c_space_tl
        \cs_set_eq:NN \qquad   \c_space_tl
      }
  }
\labelformat{part}{\CTEXthepart}
\labelformat{chapter}{\CTEXthechapter}
\labelformat{figure}{\figurename~#1}
\labelformat{table}{\tablename~#1}
\def\figureautorefname{图}
\def\tableautorefname{表}
\keys_set_known:nn { ctex }
  {
    figurename          = 图,
    tablename           = 表,
  }
\labelformat{equation}{式(#1)}
\labelformat{section}{第 #1 节}
\labelformat{subsection}{第 #1 小节}
\keys_define:nn { nwafu }
  {
    abstract  .meta:nn = { nwafu / abstract } {#1},
    info      .meta:nn = { nwafu / info     } {#1},
    style     .meta:nn = { nwafu / style    } {#1}
  }
\keys_set:nn { nwafu }
  {
    style   / font-size       = -4,
    style   / fullwidth-stop  = false,
    style   / auto-make-cover = true,
    style   / logo            = { logo/nwafu-bar.pdf },
    style   / logo-size       = { 0.65 \textwidth },
    style   / hyperlink       = none,
    style   / hyperlink-color = default,
    info    / ptype           = academic,
    info    / secret-level    = none,
    info    / school-id       = { 10712 },
    theorem / header-font     = { \sffamily },
    theorem / body-font       = { \nwafu@kai },
    theorem / counter         = { chapter },
  }
\int_compare:nNnTF { \g__nwafu_thesis_type_int } = { 3 }
  { \keys_set:nn { nwafu } { style / footnote-style = circled } }
  { \keys_set:nn { nwafu } { style / footnote-style = plain } }
\NewDocumentCommand \nwafuset { m }
  { \keys_set:nn { nwafu } {#1} }
\newtheorem* { proof       } { \c__nwafu_name_proof_tl      }
\newtheorem  { axiom       } { \c__nwafu_name_axiom_tl      }
\newtheorem  { corollary   } { \c__nwafu_name_corollary_tl  }
\newtheorem  { definition  } { \c__nwafu_name_definition_tl }
\newtheorem  { example     } { \c__nwafu_name_example_tl    }
\newtheorem  { lemma       } { \c__nwafu_name_lemma_tl      }
\newtheorem  { theorem     } { \c__nwafu_name_theorem_tl    }
\endinput
%%
%% End of file `nwafuthesis.cls'.
