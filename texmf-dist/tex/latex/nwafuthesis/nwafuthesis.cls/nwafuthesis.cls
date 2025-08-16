%%
%% This is file `nwafuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% nwafuthesis.dtx  (with options: `class')
%% 
%%     Copyright (C) 2019--2023 by Nan Geng <nangeng@nwafu.edu.cn>
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
\GetIdInfo $Id: nwafuthesis.dtx 1.25 2023-04-18 Nan Geng <nangeng@nwafu.edu.cn> $
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
\bool_new:N \l__nwafu_withchap_bool
\bool_new:N \l__nwafu_withsignature_bool
\bool_new:N \l__nwafu_anonymous_bool
\int_new:N \g__nwafu_chapnum_int
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
\cs_new_protected:Npn \__nwafu_at_end_preamble:n
  {
    \ctex_gadd_ltxhook:nn { env/document/before }
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
      { \int_set_eq:NN \g__nwafu_thesis_type_int \l_keys_choice_int },
    type .initial:n = bachelor,
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n =
      {
        \clist_gput_right:Nn \g__nwafu_to_ctexbook_clist { oneside }
        \bool_set_false:N    \g__nwafu_twoside_bool
      },
    twoside .code:n =
      {
        \clist_gput_right:Nn \g__nwafu_to_ctexbook_clist { twoside, openany }
        \bool_set_true:N     \g__nwafu_twoside_bool
      },
    draft .choice:,
    draft / true  .code:n =
      {
        \bool_set_true:N     \g__nwafu_draft_bool
        \clist_gput_right:Nn \g__nwafu_to_ctexbook_clist { draft }
      },
    draft / false .code:n =
      { \bool_set_false:N    \g__nwafu_draft_bool },
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
\prop_new:N \l__nwafu_dateen_prop
\prop_set_from_keyval:Nn \l__nwafu_dateen_prop
  {
    1  = Jan.,
    2  = Feb.,
    3  = Mar.,
    4  = Apr.,
    5  = May.,
    6  = Jun.,
    7  = Jul.,
    8  = Aug.,
    9  = Sept.,
    10 = Oct.,
    11 = Nov.,
    12 = Dec.,
  }
\NewDocumentCommand \dateen { }
  {
    \prop_get:NVN \l__nwafu_dateen_prop \c_sys_month_int \l__nwafu_tmpa_tl
    \l__nwafu_tmpa_tl ,~ \int_use:N \c_sys_year_int
  }
\tl_const:Nn \c__nwafu_name_simp_tl { 西北农林科技大学            }
\tl_const:Nn \c__nwafu_name_trad_tl { 西北農林科技大學            }
\tl_const:Nn \c__nwafu_name_en_tl   { Northwest~ A\&F~ University }
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
            独立进行的研究工作及取得的研究结果{\c__nwafu_fwid_semicolon_tl}论文中%
            的研究数据及结果的获得完全符合学校{\c__nwafu_fwid_left_title_tl}%
            关于规范西北农林科技大学研究生学术道德的暂行规定{\c__nwafu_fwid_right_title_tl}%
            {\c__nwafu_fwid_comma_tl}如果违反此规定{\c__nwafu_fwid_comma_tl}一切后果与%
            法律责任均由本人承担{\c__nwafu_ideo_full_stop_tl}\par%

            尽我所知{\c__nwafu_fwid_comma_tl}除了文中特别加以标注和致谢的地方外%
            {\c__nwafu_fwid_comma_tl}论文中不包含其他人已经发表或撰写过的研究结果%
            {\c__nwafu_fwid_comma_tl}也不包含其他人和自己本人已获得西北农林科技大学%
            或其它教育机构的学位或证书而使用过的材料{\c__nwafu_ideo_full_stop_tl}与%
            我一同工作的同事对本研究所做的任何贡献均已在论文的致谢中作了明确的说%
            明并表示了谢意{\c__nwafu_ideo_full_stop_tl}%
          }
      }
      {
        \tl_const:Nn \c__nwafu_orig_decl_text_tl
          {
            本人声明{\c__nwafu_fwid_colon_tl}所呈交的毕业%
            \clist_item:Nn \c__nwafu_bachelor_type_clist
              { \l__nwafu_info_bachelor_type_int }%
            是我个人在导师指导下独立进行的研究工作及取得的研究结果{\c__nwafu_ideo_full_stop_tl}%
            尽我所知{\c__nwafu_fwid_comma_tl}除了文中特别加以标注和致谢的地%
            方外{\c__nwafu_fwid_comma_tl}论文中不包含其他人已经发表或撰写过%
            的研究结果{\c__nwafu_fwid_comma_tl}也不包含其他人和自己本人已获%
            得\c__nwafu_name_simp_tl{}或其它教育机构的学位或证书而使用过的材%
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
    \bool_if:NTF \l__nwafu_anonymous_bool
    {
      \__nwafu_text_uline:V \c__nwafu_name_anonname_tl
    }{
      \__nwafu_text_uline:V \l__nwafu_info_author_tl
    }
    }%
    所呈交的学位论文是在我指导下独立开展研究工作及取得的研究结果%
    {\c__nwafu_fwid_comma_tl}属于我现岗职务工作的结果{\c__nwafu_fwid_comma_tl}%
    并严格按照学校{\c__nwafu_fwid_left_title_tl}关于规范西北农林科技大学研%
    究生学术道德的暂行规定{\c__nwafu_fwid_right_title_tl}而%
    获得的研究结果{\c__nwafu_ideo_full_stop_tl}如果违反学校{\c__nwafu_fwid_left_title_tl}%
    关于规范西北农林科技大学研究生学术道德的暂行规定{\c__nwafu_fwid_right_title_tl}%
    {\c__nwafu_fwid_comma_tl}我愿接受按学校%
    有关规定的处罚处理并承担相应导师连带责任{\c__nwafu_ideo_full_stop_tl}%
  }
\cs_new_protected:Npn \__nwafu_auth_orig_decl_text:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \tl_const:Nn \c__nwafu_auth_decl_text_tl
          {
            本学位论文的知识产权归属西北农林科技大学{\c__nwafu_ideo_full_stop_tl}%
            本人同意西北农林科技大学保存或向国家有关部门或机构送交论文的纸%
            质版和电子版{\c__nwafu_fwid_comma_tl}允许论文被查阅和借阅{\c__nwafu_fwid_semicolon_tl}%
            同意西北农林科技大学将本学位论文的全部或部分内容授权汇编录入%
            {\c__nwafu_fwid_left_title_tl}中国博士/硕士学位论文全文数据库%
            {\c__nwafu_fwid_right_title_tl}和{\c__nwafu_fwid_left_title_tl}中国学位%
            论文全文数据库{\c__nwafu_fwid_right_title_tl}进行出版%
            {\c__nwafu_fwid_comma_tl}并享受相关权益{\c__nwafu_ideo_full_stop_tl}\par

            本人保证{\c__nwafu_fwid_comma_tl}在毕业离开(或者工作调离)西北农林科技%
            大学后{\c__nwafu_fwid_comma_tl}发表或者使用本学位论文及其相关的工作成%
            果时{\c__nwafu_fwid_comma_tl}将以西北农林科技大学为第一署名单位%
            {\c__nwafu_fwid_comma_tl}否则{\c__nwafu_fwid_comma_tl}愿意按
            {\c__nwafu_fwid_left_title_tl}中华人民共和国著作权法{\c__nwafu_fwid_right_title_tl}%
            等有关规定接受处理并承担法律责任{\c__nwafu_ideo_full_stop_tl}\par%

            任何收存和保管本论文各种版本的其他单位和个人(包括研究生本人)未经本%
            论文作者的导师同意{\c__nwafu_fwid_comma_tl}不得有对本论文进行复制%
            {\c__nwafu_ideo_comma_tl}修改{\c__nwafu_ideo_comma_tl}发行{\c__nwafu_ideo_comma_tl}%
            出租{\c__nwafu_ideo_comma_tl}改编等侵犯著作权的行为{\c__nwafu_fwid_comma_tl}%
            否则{\c__nwafu_fwid_comma_tl}按违背{\c__nwafu_fwid_left_title_tl}中华人民共和国%
            著作权法{\c__nwafu_fwid_right_title_tl}等有关规定处%
            理并追究法律责任{\c__nwafu_ideo_full_stop_tl}\par%

            {\sffamily (保密的学位论文在保密期限内{\c__nwafu_fwid_comma_tl}不得以任何%
               方式发表{\c__nwafu_ideo_comma_tl}借阅{\c__nwafu_ideo_comma_tl}复印%
               {\c__nwafu_ideo_comma_tl}缩印或扫描复制手段保存{\c__nwafu_ideo_comma_tl}汇编论文)%
            }
          }
      }
      {
        \tl_const:Nn \c__nwafu_auth_decl_text_tl
          {
            本毕业\clist_item:Nn \c__nwafu_bachelor_type_clist
                                 { \l__nwafu_info_bachelor_type_int }%
            的知识产权归属\c__nwafu_name_simp_tl{}{\c__nwafu_ideo_full_stop_tl}本%
            人同意\c__nwafu_name_simp_tl{}保存或向国家有关部门或机构送交论文的%
            纸质版和电子版{\c__nwafu_fwid_comma_tl}允许论文被查阅和借阅%
            {\c__nwafu_ideo_full_stop_tl}\par

            本人保证{\c__nwafu_fwid_comma_tl}在毕业离开\c__nwafu_name_simp_tl{}后%
            {\c__nwafu_fwid_comma_tl}发表或者使用本毕业%
            \clist_item:Nn \c__nwafu_bachelor_type_clist { \l__nwafu_info_bachelor_type_int }%
            及其相关的工作成果时{\c__nwafu_fwid_comma_tl}将以\c__nwafu_name_simp_tl{}%
            为第一署名单位{\c__nwafu_fwid_comma_tl}否则{\c__nwafu_fwid_comma_tl}%
            愿意按{\c__nwafu_fwid_left_title_tl}中华人民共和国著作权法%
            {\c__nwafu_fwid_right_title_tl}等有关规定接受处理并承担法律责任%
            {\c__nwafu_ideo_full_stop_tl}\par%

            任何收存和保管本论文各种版本的其他单位和个人(包括作者本人)未经%
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
        \tl_const:Nn \c__nwafu_orig_decl_sign_tl
          { 研究生签名 }
        \tl_const:Nn \c__nwafu_super_decl_sign_tl
          { 导师签名 }
      }
      {
        \tl_const:Nn \c__nwafu_orig_decl_sign_tl
          { 本科生签名 }
        \tl_const:Nn \c__nwafu_super_decl_sign_tl
          { 指导教师签名 }
      }
  }
\__nwafu_orig_decl_sign:
\clist_const:Nn \c__nwafu_auth_decl_sign_clist
  { 作者签名, 导师签名, 日期 }
\clist_const:Nn \c__nwafu_thesis_type_clist
  { 博士学位论文, 硕士学位论文, 本科生毕业 }
\clist_const:Nn \c__nwafu_degree_type_clist
  { 学术学位, 专业学位 }
\clist_const:Nn \c__nwafu_bachelor_type_clist
  { 论文, 设计 }
\clist_const:Nn \c__nwafu_secret_clist { 限制, 秘密, 机密, 绝密 }
\clist_map_inline:nn
 {
   { secret_level      } { 密级                          },
   { udc               } { UDC                           },
   { school_id         } { 学校代码                      },
   { department        } { 学院                          },
   { enroll            } { 年级                          },
   { class_id          } { 班级                          },
   { instructors       } { 指导小组                      },
   { author_sign       } { 作者签名                      },
   { supervisor_sign   } { 导师签名                      },
   { sign_date         } { 日期                          },
   { toc               } { 目 \quad 录                   },
   { lof               } { 插图目录                      },
   { lot               } { 表格目录                      },
   { bib_en            } { Bibliography                  },
   { ack               } { 致 \quad 谢                   },
   { resume            } { 个人简历                      },
   { pdf_creator       } { LaTeX~ with~ nwafuthesis~ class },
 }
 { \__nwafu_define_name:nn #1 }

\cs_new_protected:Npn \__nwafu_define_name_const_zh:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \clist_map_inline:nn
          {
            { student_id      } { 研究生学号                       },
            { orig_decl       } { 研究生学位论文的独创性声明       },
            { super_decl      } { 导师指导研究生学位论文的承诺     },
            { auth_decl       } { 关于研究生学位论文使用授权的说明 }
          }
          { \__nwafu_define_name:nn ##1 }
       }{
        \clist_map_inline:nn
          {
            { major           } { 专业                           },
            { student_id      } { 学号                           },
            { author          } { 学生姓名                       },
            { cosupervisor    } { 协助指导教师                   },
            { date            } { 完成日期                       },
            { orig_decl       } { 本科生毕业\clist_item:Nn
                                  \c__nwafu_bachelor_type_clist {
                                  \l__nwafu_info_bachelor_type_int
                                  }的独创性声明                  },
            { auth_decl       } { 关于本科生毕业\clist_item:Nn
                                  \c__nwafu_bachelor_type_clist {
                                  \l__nwafu_info_bachelor_type_int
                                  }知识产权的说明                }
          }
          { \__nwafu_define_name:nn ##1 }
      }
  }
\__nwafu_define_name_const_zh:
\clist_map_inline:nn
  {
    { supervisor } { 指导教师   } { Supervisor },
    { anonid     } { ********** } { ********** },
    { anonname   } { ****       } { ****       },
  }
  { \__nwafu_define_name:nnn #1 }
\cs_new_protected:Npn \__nwafu_define_name_const_zh_en:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \clist_map_inline:nn
          {
            { major             } { 学科专业       } { Major                },
            { researchfield     } { 研究方向       } { Research~ Field      },
            { professionaltype  } { 专业学位类型   } { Degree~ Type         },
            { professionalfield } { 领域名称       } { Field                },
            { author            } { 论文作者       } { Candidate            },
            { cosupervisor      } { 联合指导教师   } { Co-Supervisor        },
            { date              } { 论文提交时间   } { Date~ of~ Submission },
            { abstract          } { 摘 \quad 要    } { ABSTRACT             },
            { keywords          } { 关键词         } { KEY~WORDS             },
            { clc               } { 分类号         } { CLC~ number:         },
            { notation          } { 主要符号对照表 } { List~ of~ Symbols    }
          }
          { \__nwafu_define_name:nnn ##1 }
      }{
        \clist_map_inline:nn
          {
            { abstract } { 摘要        } { Abstract          },
            { keywords } { 关键词      } { Keywords          },
            { clc      } { 分类号      } { CLC~ number       },
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
\clist_map_inline:nn
  {
    { shortlabels       } { enumitem },
    { no-math           } { fontspec },
    { perpage           } { footmisc },
    { amsmath, thmmarks } { ntheorem }
  }
  { \PassOptionsToPackage #1 }
\LoadClass { ctexbook }
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
            paper=a4paper,
            top=3.1cm,
            bottom=3.3cm,
            left=2.6cm,
            right=2.6cm,
            headheight=0.8cm,
            headsep=0.7cm,
            footskip=1.4cm,
            %includehead,
            %includefoot,
          }
      }{
        \geometry
          {
            paper=a4paper,
            top=3.14cm,
            bottom=3.8cm,
            left=2.45cm,
            right=2.45cm,
            headheight=0.8cm,
            headsep=0.63cm,
            footskip=2.3cm,
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
      { \tl_set_eq:NN \g__nwafu_fontset_tl \l_keys_choice_tl }
  }
\keys_define:nn { nwafu / style }
  {
    cjk-font .choices:nn =
      { adobe, fandol, founder, mac, sinotype, sourcehan, windows, none }
      { \tl_set_eq:NN \g__nwafu_cjk_fontset_tl \l_keys_choice_tl }
  }
\cs_new_protected:Npn \__nwafu_setmainfont:nn #1#2
  { \__fontspec_main_setmainfont:nn {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setsansfont:nn #1#2
  { \__fontspec_main_setsansfont:nn {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setmonofont:nn #1#2
  { \__fontspec_main_setmonofont:nn {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setmathfont:nn #1#2
  { \__um_setmathfont:nn {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setCJKmainfont:nn #1#2
  { \__nwafu_set_family:xnn { \CJKrmdefault } {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setCJKsansfont:nn #1#2
  { \__nwafu_set_family:xnn { \CJKsfdefault } {#2} {#1} }
\cs_new_protected:Npn \__nwafu_setCJKmonofont:nn #1#2
  { \__nwafu_set_family:xnn { \CJKttdefault } {#2} {#1} }
\cs_new_protected:Npn \__nwafu_set_cjk_font_hei:nn #1#2
  { \__nwafu_set_family:nnn { nwafu@hei } {#2} {#1} }
\cs_new_protected:Npn \nwafu@hei
  { \__nwafu_switch_family:n { nwafu@hei } }
\cs_new_protected:Npn \__nwafu_set_cjk_font_kai:nn #1#2
  { \__nwafu_set_family:nnn { nwafu@kai } {#2} {#1} }
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
\tl_new:N \g__nwafu_font_name_xits_tl
\tl_new:N \g__nwafu_font_name_xits_math_rm_tl
\tl_new:N \g__nwafu_font_name_xits_math_bf_tl
\fontspec_font_if_exist:nTF { LibertinusSerif-Regular.otf }
  {
    \tl_set:Nn \g__nwafu_font_family_libertinus_serif_tl { LibertinusSerif }
    \tl_set:Nn \g__nwafu_font_family_libertinus_sans_tl  { LibertinusSans  }
    \tl_set:Nn \g__nwafu_font_family_libertinus_math_tl  { LibertinusMath  }
    \tl_set:Nn \g__nwafu_font_style_libertinus_rm_tl     { Regular         }
    \tl_set:Nn \g__nwafu_font_style_libertinus_bf_tl     { Bold            }
    \tl_set:Nn \g__nwafu_font_style_libertinus_it_tl     { Italic          }
    \tl_set:Nn \g__nwafu_font_style_libertinus_bfit_tl   { BoldItalic      }
    \fontspec_font_if_exist:nTF { LibertinusSans-BoldOblique.otf }
      { \tl_set:Nn \g__nwafu_font_style_libertinus_bfsl_tl { BoldOblique } }
      { \tl_set:Nn \g__nwafu_font_style_libertinus_bfsl_tl { Bold        } }
  }
  {
    \tl_set:Nn \g__nwafu_font_family_libertinus_serif_tl { libertinusserif }
    \tl_set:Nn \g__nwafu_font_family_libertinus_sans_tl  { libertinussans  }
    \tl_set:Nn \g__nwafu_font_family_libertinus_math_tl  { libertinusmath  }
    \tl_set:Nn \g__nwafu_font_style_libertinus_rm_tl     { regular         }
    \tl_set:Nn \g__nwafu_font_style_libertinus_bf_tl     { bold            }
    \tl_set:Nn \g__nwafu_font_style_libertinus_it_tl     { italic          }
    \tl_set:Nn \g__nwafu_font_style_libertinus_bfit_tl   { bolditalic      }
    \tl_set:Nn \g__nwafu_font_style_libertinus_bfsl_tl   { bolditalic      }
  }
\fontspec_font_if_exist:nTF { XITS-Regular.otf }
  {
    \tl_set:Nn \g__nwafu_font_family_xits_tl        { XITS             }
    \tl_set:Nn \g__nwafu_font_style_xits_rm_tl      { Regular          }
    \tl_set:Nn \g__nwafu_font_style_xits_bf_tl      { Bold             }
    \tl_set:Nn \g__nwafu_font_style_xits_it_tl      { Italic           }
    \tl_set:Nn \g__nwafu_font_style_xits_bfit_tl    { BoldItalic       }
    \tl_set:Nn \g__nwafu_font_name_xits_math_rm_tl  { XITSMath-Regular }
    \tl_set:Nn \g__nwafu_font_name_xits_math_bf_tl  { XITSMath-Bold    }
  }
  {
    \tl_set:Nn \g__nwafu_font_family_xits_tl        { xits          }
    \tl_set:Nn \g__nwafu_font_style_xits_rm_tl      { regular       }
    \tl_set:Nn \g__nwafu_font_style_xits_bf_tl      { bold          }
    \tl_set:Nn \g__nwafu_font_style_xits_it_tl      { italic        }
    \tl_set:Nn \g__nwafu_font_style_xits_bfit_tl    { bolditalic    }
    \tl_set:Nn \g__nwafu_font_name_xits_math_rm_tl  { xits-math     }
    \tl_set:Nn \g__nwafu_font_name_xits_math_bf_tl  { xits-mathbold }
  }
\tl_set:Nx \g__nwafu_font_name_libertinus_serif_tl
  { \g__nwafu_font_family_libertinus_serif_tl - \g__nwafu_font_style_libertinus_rm_tl }
\tl_set:Nx \g__nwafu_font_name_libertinus_sans_tl
  { \g__nwafu_font_family_libertinus_sans_tl  - \g__nwafu_font_style_libertinus_rm_tl }
\tl_set:Nx \g__nwafu_font_name_libertinus_math_tl
  { \g__nwafu_font_family_libertinus_math_tl  - \g__nwafu_font_style_libertinus_rm_tl }
\tl_set:Nx \g__nwafu_font_name_xits_tl
  { \g__nwafu_font_family_xits_tl - \g__nwafu_font_style_xits_rm_tl }
\cs_new_protected:Npn \__nwafu_load_font_garamond:
  {
    \__nwafu_setmainfont:nn { EBGaramond }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Italic,
        BoldItalicFont = *-BoldItalic
      }
    \__nwafu_setsansfont:nn { \g__nwafu_font_family_libertinus_sans_tl }
      {
        Extension      = .otf,
        UprightFont    = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfsl_tl
      }
    \__nwafu_setmonofont:nn { lmmonolt10 }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique
      }
    \__nwafu_setmathfont:nn { Garamond-Math.otf } { }
  }
\cs_new_protected:Npn \__nwafu_load_font_libertinus:
  {
    \__nwafu_setmainfont:nn { \g__nwafu_font_family_libertinus_serif_tl }
      {
        Extension      = .otf,
        UprightFont    = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfit_tl
      }
    \__nwafu_setsansfont:nn { \g__nwafu_font_family_libertinus_sans_tl }
      {
        Extension      = .otf,
        UprightFont    = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfsl_tl
      }
    \__nwafu_setmonofont:nn { lmmonolt10 }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique
      }
    \__nwafu_setmathfont:nn { \g__nwafu_font_name_libertinus_math_tl .otf } { }
  }
\cs_new_protected:Npn \__nwafu_load_font_lm:
  { \__nwafu_setmathfont:nn { latinmodern-math.otf } { } }
\cs_new_protected:Npn \__nwafu_load_font_palatino:
  {
    \__nwafu_setmainfont:nn { texgyrepagella }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic
      }
    \__nwafu_setsansfont:nn { \g__nwafu_font_family_libertinus_sans_tl }
      {
        Extension      = .otf,
        UprightFont    = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfsl_tl,
        Scale          = MatchUppercase
      }
    \__nwafu_setmonofont:nn { lmmonolt10 }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique
      }
    \__nwafu_setmathfont:nn { texgyrepagella-math.otf } { }
  }
\cs_new_protected:Npn \__nwafu_load_font_times:
  {
    \__nwafu_setmainfont:nn { \g__nwafu_font_family_xits_tl }
      {
        Extension          = .otf,
        UprightFont        = *-\g__nwafu_font_style_xits_rm_tl,
        BoldFont           = *-\g__nwafu_font_style_xits_bf_tl,
        ItalicFont         = *-\g__nwafu_font_style_xits_it_tl,
        BoldItalicFont     = *-\g__nwafu_font_style_xits_bfit_tl
      }
    \__nwafu_setsansfont:nn { texgyreheros }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic
      }
    \__nwafu_setmonofont:nn { texgyrecursor }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic,
        Ligatures      = CommonOff
      }
    \__nwafu_setmathfont:nn { \g__nwafu_font_name_xits_math_rm_tl .otf }
      { BoldFont = \g__nwafu_font_name_xits_math_bf_tl .otf }
  }
\cs_new_protected:cpn { __nwafu_load_font_ times* : }
  {
    \__nwafu_setmainfont:nn { Times~ New~ Roman    } { }
    \__nwafu_setsansfont:nn { Arial                } { }
    \__nwafu_setmonofont:nn { Courier~ New         } { }
    \__nwafu_setmathfont:nn { \g__nwafu_font_name_xits_math_rm_tl .otf }
      { BoldFont = \g__nwafu_font_name_xits_math_bf_tl .otf }
  }
\cs_new_protected:Npn \__nwafu_load_cjk_font_adobe:
  {
    \__nwafu_setCJKmainfont:n   { AdobeSongStd-Light       }
    \__nwafu_setCJKsansfont:n   { AdobeHeitiStd-Regular    }
    \__nwafu_setCJKmonofont:n   { AdobeFangsongStd-Regular }
    \__nwafu_set_cjk_font_hei:n { AdobeHeitiStd-Regular    }
    \__nwafu_set_cjk_font_kai:n { AdobeKaitiStd-Regular    }
  }
\cs_new_protected:Npn \__nwafu_load_cjk_font_fandol:
  {
    \__nwafu_setCJKmainfont:nn   { FandolSong }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__nwafu_setCJKsansfont:nn   { FandolHei  }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__nwafu_setCJKmonofont:nn   { FandolFang }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular
      }
    \__nwafu_set_cjk_font_hei:nn { FandolHei  }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__nwafu_set_cjk_font_kai:nn { FandolKai  }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular
      }
  }
\cs_new_protected:Npn \__nwafu_load_cjk_font_founder:
  {
    \__nwafu_setCJKmainfont:n   { FZShuSong-Z01 }
    \__nwafu_setCJKsansfont:n   { FZHei-B01      }
    \__nwafu_setCJKmonofont:n   { FZFangSong-Z02 }
    \__nwafu_set_cjk_font_hei:n { FZHei-B01      }
    \__nwafu_set_cjk_font_kai:n { FZKai-Z03      }
  }
\cs_new_protected:Npn \__nwafu_load_cjk_font_mac:
  {
    \__nwafu_setCJKmainfont:nn   { STSongti-SC }
      {
        UprightFont    = *-Light,
        BoldFont       = *-Bold,
        ItalicFont     = *-Light,
        BoldItalicFont = *-Bold
      }
    \__nwafu_setCJKsansfont:nn   { STHeitiSC   }
      {
        UprightFont    = *-Medium,
        BoldFont       = *-Medium,
        ItalicFont     = *-Medium,
        BoldItalicFont = *-Medium
      }
    \__nwafu_setCJKmonofont:n    { STFangsong  }
    \__nwafu_set_cjk_font_hei:nn { STHeitiSC   }
      {
        UprightFont    = *-Medium,
        BoldFont       = *-Medium,
        ItalicFont     = *-Medium,
        BoldItalicFont = *-Medium
      }
    \__nwafu_set_cjk_font_kai:nn { STKaitiSC   }
      {
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
  }
\cs_new_protected:Npn \__nwafu_load_cjk_font_sinotype:
  {
    \__nwafu_setCJKmainfont:n   { STSong     }
    \__nwafu_setCJKsansfont:n   { STHeiti    }
    \__nwafu_setCJKmonofont:n   { STFangsong }
    \__nwafu_set_cjk_font_hei:n { STHeiti    }
    \__nwafu_set_cjk_font_kai:n { STKaiti    }
  }
\cs_new_protected:Npn \__nwafu_load_cjk_font_sourcehan:
  {
    \__nwafu_setCJKmainfont:nn { SourceHanSerifSC }
      {
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__nwafu_setCJKsansfont:nn { SourceHanSansSC  }
      {
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__nwafu_warning:n { source-han }
  }
\__nwafu_msg_new:nn { source-han }
  { Font~ set~ `sourcehan'~ does~ not~ contain~ kaiti~ and~ fangsong. }
\cs_new_protected:Npn \__nwafu_load_cjk_font_windows:
  {
    \__nwafu_setCJKmainfont:n   { SimSun   }
    \__nwafu_setCJKsansfont:n   { SimHei   }
    \__nwafu_setCJKmonofont:n   { FangSong }
    \__nwafu_set_cjk_font_hei:n { SimHei   }
    \__nwafu_set_cjk_font_kai:n { KaiTi    }
  }
\tl_new:N \l__nwafu_font_tl
\tl_new:N \l__nwafu_cjkfont_tl
\cs_new_protected:Npn \__nwafu_detect_platform:
  {
    \sys_if_platform_windows:TF
      {
        \tl_set:Nn \l__nwafu_cjkfont_tl { windows }
        \tl_set:Nn \l__nwafu_font_tl { times* }
      }
      {
        \__nwafu_if_platform_macos:TF
          {
            \tl_set:Nn \l__nwafu_cjkfont_tl { mac }
            \tl_set:Nn \l__nwafu_font_tl { times* }
          }{
            \tl_set:Nn \l__nwafu_cjkfont_tl { fandol }
            \tl_set:Nn \l__nwafu_font_tl { times }
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
    \use:c { __nwafu_load_font_     \g__nwafu_fontset_tl     : }
    \use:c { __nwafu_load_cjk_font_ \g__nwafu_cjk_fontset_tl : }
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
\fancyhf { }
\tl_new:N \l__nwafu_header_center_mark_tl
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__nwafu_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle{ empty } \newpage }
      }
    \tl_gset:Nn \l__nwafu_header_center_mark_tl { }
  }
\pagestyle { fancy }
\cs_gset_eq:NN \nwafuhead\fancyhead
\cs_gset_eq:NN \nwafufoot\fancyfoot
\RenewDocumentCommand{\frontmatter}{s O{Roman}}
  {
    \IfBooleanTF{#1}{\clearpage}{\cleardoublepage}
    \@mainmatterfalse
    \pagenumbering{#2}
    \bool_if:NTF \g__nwafu_twoside_bool
      {
        \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
          {
            \nwafuhead[OC]{\small \nouppercase{ \leftmark } }
            \nwafuhead[EC]{
                \small \nouppercase{
                  \c__nwafu_name_simp_tl
                  \clist_item:Nn \c__nwafu_thesis_type_clist { \g__nwafu_thesis_type_int }
                }
              }
          }{
            \RenewDocumentCommand \headrulewidth { } { 0 pt }
          }
      }{
        \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
          {
            \nwafuhead [ C ]
              {
                \small \nouppercase { \l__nwafu_header_center_mark_tl }
              }
          }{
            \RenewDocumentCommand \headrulewidth { } { 0 pt }
          }
      }
    \nwafufoot[C]{\small\thepage}
  }
\RenewDocumentCommand{\mainmatter}{s}
  {
    \IfBooleanTF{#1}{\clearpage}{\cleardoublepage}
    \@mainmattertrue
    \pagenumbering{arabic}
    \bool_if:NTF \g__nwafu_twoside_bool
      {
        \nwafuhead[OC]{\small \nouppercase{ \leftmark } }
        \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
          {
            \nwafuhead[EC]{\small \nouppercase{
                \c__nwafu_name_simp_tl
                \clist_item:Nn \c__nwafu_thesis_type_clist
                  { \g__nwafu_thesis_type_int } }
              }
          }{
            \RenewDocumentCommand \headrulewidth { } { 0.4 pt }
            \tl_set_eq:NN \l_tmpa_tl \l__nwafu_info_title_tl
            \tl_replace_all:Nnn \l_tmpa_tl { \\ } { ~ }
            \nwafuhead[EC]{\small \nouppercase{ \l_tmpa_tl } }
          }
      }{
        \RenewDocumentCommand \headrulewidth { } { 0.4 pt }
        \nwafuhead [ C ]
          {
            \int_if_odd:nTF \c@page
              {
                \small \nouppercase{ \leftmark }
              }{
                \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                  {
                    \small \nouppercase{
                        \c__nwafu_name_simp_tl
                        \clist_item:Nn \c__nwafu_thesis_type_clist
                          { \g__nwafu_thesis_type_int } }
                  }{
                    \tl_set_eq:NN \l_tmpa_tl \l__nwafu_info_title_tl
                    \tl_replace_all:Nnn \l_tmpa_tl { \\ } { ~ }
                    \small \nouppercase{ \l_tmpa_tl }
                  }
              }
          }
      }
    \int_compare:nNnTF{ \g__nwafu_thesis_type_int } < { 3 }
      {
        \nwafufoot[C]{\small\thepage}
      }{
        \nwafufoot[C]{\small-\ \thepage\ -}
      }
  }
\NewDocumentCommand{\bibmatter}{s}
  {
    \IfBooleanTF{#1}{\clearpage}{\cleardoublepage}
    \@mainmattertrue
    \bool_if:NTF \g__nwafu_twoside_bool
      {
        \nwafuhead[OC]{\small \nouppercase{ \leftmark } }
        \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
          {
            \nwafuhead[EC]{\small \nouppercase{
                \c__nwafu_name_simp_tl
                \clist_item:Nn \c__nwafu_thesis_type_clist
                  { \g__nwafu_thesis_type_int } }
              }
          }{
            \nwafuhead[EC]{\small \nouppercase{ \leftmark } }
          }
      }{
        \nwafuhead [ C ]
          {
            \int_if_odd:nTF \c@page
              {
                \small \nouppercase{ \leftmark }
              }{
                \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                  {
                    \small \nouppercase{
                        \c__nwafu_name_simp_tl
                        \clist_item:Nn \c__nwafu_thesis_type_clist
                          { \g__nwafu_thesis_type_int } }
                  }{
                    \small \nouppercase{ \leftmark }
                  }
              }
          }
      }
  }

\__nwafu_appto_cmd:Nn \appendix
  {
    \clearpage
    \bool_if:NTF \g__nwafu_twoside_bool
      {
        \nwafuhead[OC]{\small \nouppercase{ \@chapapp } }
        \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
          {
            \nwafuhead[EC]{\small \nouppercase{
                \c__nwafu_name_simp_tl
                \clist_item:Nn \c__nwafu_thesis_type_clist
                  { \g__nwafu_thesis_type_int } }
              }
          }{
            \nwafuhead[EC]{\small \nouppercase{ \@chapapp } }
          }
      }{
        \nwafuhead [ C ]
          {
            \int_if_odd:nTF \c@page
              {
                \small \nouppercase{ \@chapapp }
              }{
                \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                  {
                    \small \nouppercase{
                        \c__nwafu_name_simp_tl
                        \clist_item:Nn \c__nwafu_thesis_type_clist
                          { \g__nwafu_thesis_type_int } }
                  }{
                    \small \nouppercase{ \@chapapp }
                  }
              }
          }
      }
  }

\__nwafu_appto_cmd:Nn \backmatter
  {
    \clearpage
    \bool_if:NTF \g__nwafu_twoside_bool
      {
        \nwafuhead[OC]{\small \nouppercase{ \leftmark } }
        \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
          {
            \nwafuhead[EC]{\small \nouppercase{
                \c__nwafu_name_simp_tl
                \clist_item:Nn \c__nwafu_thesis_type_clist
                  { \g__nwafu_thesis_type_int } }
              }
          }{
            \nwafuhead[EC]{\small \nouppercase{ \leftmark } }
          }
      }{
        \nwafuhead [ C ]
          {
            \int_if_odd:nTF \c@page
              {
                \small \nouppercase{ \leftmark }
              }{
                \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                  {
                    \small \nouppercase{
                        \c__nwafu_name_simp_tl \clist_item:Nn
                        \c__nwafu_thesis_type_clist { \g__nwafu_thesis_type_int } }
                  }{
                    \small \nouppercase{ \leftmark }
                  }
              }
          }
      }
  }
\keys_define:nn { nwafu / style }
  {
    withchapter .bool_set:N = \l__nwafu_withchap_bool,
    withchapter .default:n  = true,
    withchapter .initial:n  = true,
  }
\keys_define:nn { nwafu / style }
  {
    withsig .bool_set:N = \l__nwafu_withsignature_bool,
    withsig .default:n  = true,
    withsig .initial:n  = false,
  }
\keys_define:nn { nwafu / style }
  {
    chapnum .choice:,
    chapnum .value_required:n = true,
    chapnum .choices:nn =
      { zh, en }
      { \int_set_eq:NN \g__nwafu_chapnum_int \l_keys_choice_int },
    chapnum .initial:n = en,
  }
\keys_define:nn { nwafu / style }
  {
    anonymous .bool_set:N = \l__nwafu_anonymous_bool,
    anonymous .default:n  = true,
    anonymous .initial:n  = false,
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
                beforeskip  = 1.47\baselineskip,
                afterskip   = 1.24\baselineskip,
                number      = \chinese{ chapter },
                fixskip     = true
              },
            section =
              {
                format      = \zihao{-3} \normalfont \nwafu@hei \raggedright,
                beforeskip  = 1.09\baselineskip,
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
                name = { \bool_if:NT \l__nwafu_withchap_bool {第},
                         \bool_if:NT \l__nwafu_withchap_bool {章} },
                number = {%
                           \int_compare:nNnTF { \g__nwafu_chapnum_int } = { 1 }
                              {
                                \chinese{ chapter }
                              }{
                                \__nwafu_arabic:n { chapter }
                              }
                         },
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
      \ctexset { chapter / numbering = false }
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
        \tl_gset:Nn \l__nwafu_header_center_mark_tl {#1}
      }
  }
\clist_map_inline:nn
  {
    { plain           } { plain           },
    { libertinus      } { libertinus      },
    { libertinus_neg  } { libertinus*     },
    { libertinus_sans } { libertinus-sans },
    { pifont          } { pifont          },
    { pifont_neg      } { pifont*         },
    { pifont_sans     } { pifont-sans     },
    { pifont_sans_neg } { pifont-sans*    },
    { xits            } { xits            },
    { xits_sans       } { xits-sans       },
    { xits_sans_neg   } { xits-sans*      }
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
        xits,                    xits-sans,       xits-sans*
      }
      {
        \tl_gset_eq:NN \l__nwafu_fn_style_tl \l_keys_choice_tl
        \int_compare:nT { 5 <= \l_keys_choice_int <= 8 }
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
\DeclareCaptionLabelSeparator{ccwd}{\hspace{0.5\ccwd}}
\DeclareCaptionLabelFormat{parens}{\bothIfFirst{#1}{~}(#2)}
\DeclareCaptionFont{nwafu@table@font}{\nwafu@hei\bfseries\small}
\DeclareCaptionFont{nwafu@figure@font}{\nwafu@hei\bfseries\small}
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
\captionsetup[longtable]{font += nwafu@table@font}
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
\AddToHook
  { env/figure/end }
  {
    \centering
  }
\AddToHook
  { env/table/end }
  {
    \centering
  }
\__nwafu_at_begin_environment:nn { tabular,longtable }
  {
    \exp_args:Nx \linespread { 1.05 }
    \small\selectfont\ignorespaces
  }
\cs_set:Npn \thefigure
  { \thechapter - \__nwafu_arabic:n { figure } }
\cs_set:Npn \thetable
  { \thechapter - \__nwafu_arabic:n { table  } }
\clist_map_inline:nn
  {
    title, date, grade, enroll, author, supervisor, cosupervisor
    department, major, researchfield, professionaltype, professionalfield,
    class_id, student_id, school_id, clc, defensedate, udc
  }
  { \tl_new:c { l__nwafu_info_ #1 _tl } }
\clist_new:N \l__nwafu_info_instructors_clist
\clist_new:N \l__nwafu_info_defensecommittees_clist
\clist_new:N \l__nwafu_info_foundation_clist
\clist_map_inline:nn
  { title, author, supervisor, cosupervisor, department,
    major, mastertype, researchfield, professionaltype, professionalfield,date }
  { \tl_new:c { l__nwafu_info_ #1 _en_tl } }
\int_new:N \l__nwafu_info_degree_type_int
\int_new:N \l__nwafu_info_bachelor_type_int
\keys_define:nn { nwafu / info }
  {
    degree      .choices:nn  =
      { academic, professional }
      { \int_set_eq:NN \l__nwafu_info_degree_type_int \l_keys_choice_int },
    btype      .choice:,
    btype      .value_required:n = true,
    btype      .choices:nn  =
      { paper, design }
      { \int_set_eq:NN \l__nwafu_info_bachelor_type_int \l_keys_choice_int },
    btype      .initial:n = paper,
    title       .tl_set:N    = \l__nwafu_info_title_tl,
    title*      .tl_set:N    = \l__nwafu_info_title_en_tl,
    date        .tl_set:N    = \l__nwafu_info_date_tl,
    date*       .tl_set:N    = \l__nwafu_info_date_en_tl,
    grade        .tl_set:N    = \l__nwafu_info_grade_tl,
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
    foundation .clist_set:N = \l__nwafu_info_foundation_clist,
    department  .tl_set:N    = \l__nwafu_info_department_tl,
    department* .tl_set:N    = \l__nwafu_info_department_en_tl,
    major       .tl_set:N    = \l__nwafu_info_major_tl,
    major*      .tl_set:N    = \l__nwafu_info_major_en_tl,
    mastertype .tl_set:N    = \l__nwafu_info_mastertype_en_tl,
    researchfield  .tl_set:N    = \l__nwafu_info_researchfield_tl,
    researchfield* .tl_set:N    = \l__nwafu_info_researchfield_en_tl,
    professionaltype  .tl_set:N    = \l__nwafu_info_professionaltype_tl,
    professionaltype* .tl_set:N    = \l__nwafu_info_professionaltype_en_tl,
    professionalfield  .tl_set:N    = \l__nwafu_info_professionalfield_tl,
    professionalfield* .tl_set:N    = \l__nwafu_info_professionalfield_en_tl,
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
\bool_new:N \l__nwafu_secret_bool
\tl_new:N \l__nwafu_info_secret_level_tl
\keys_define:nn { nwafu / info }
  {
  % 密级。\opt{none} 表示公开，\opt{i}、\opt{ii}、\opt{iii}、\opt{iv} 分别为
    secret-level .choices:nn  =
      { none, i, ii, iii, iv }
      {
        \int_compare:nNnTF { \l_keys_choice_int } > { 1 }
          {
            \bool_set_true:N \l__nwafu_secret_bool
            \tl_set:Nn \l__nwafu_info_secret_level_tl
              {
                \clist_item:Nn \c__nwafu_secret_clist
                  { \l_keys_choice_int - 1 }
              }
          }
          {
            \bool_set_false:N \l__nwafu_secret_bool
            \tl_set:Nn \l__nwafu_info_secret_level_tl { 公开 }
          }
      },
    secret-level .value_required:n = true,
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
    \makebox[0cm][l]{\rule[-0.5ex]{\l__nwafu_tmpt_dim}{0.4 pt}}
    \hbox_to_wd:nn {\l__nwafu_tmpt_dim} { \hfil #2 \hfil }
  }
\cs_generate_variant:Nn \__nwafu_center_box:nn  { Vn }
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
\cs_new_protected:Npn \__nwafu_cover_id:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \group_begin:
        \clist_clear:N \l__nwafu_tmpa_clist
        \clist_set:Nx \l__nwafu_tmpa_clist
          {
            { \c__nwafu_name_clc_tl          },
            { \c__nwafu_name_udc_tl          },
            { \c__nwafu_name_secret_level_tl }
          }
        \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
        \clist_set:Nx \l__nwafu_tmpb_clist
          {
            { \l__nwafu_info_clc_tl              },
            { \l__nwafu_info_udc_tl              },
            { \l__nwafu_info_secret_level_tl     }
          }
        \__nwafu_get_max_text_width:NN \l__nwafu_tmpb_dim \l__nwafu_tmpb_clist
        \clist_set:Nx \l__nwafu_tmpc_clist
          {
            { \c__nwafu_name_school_id_tl         },
            {                                 },
            { \c__nwafu_name_student_id_tl        }
          }
        \__nwafu_get_max_text_width:NN \l__nwafu_tmpc_dim \l__nwafu_tmpc_clist
        \bool_if:NTF \l__nwafu_anonymous_bool
        {
          \clist_set:Nx \l__nwafu_tmpd_clist
            {
              { \l__nwafu_info_school_id_tl              },
              {                                      },
              { \c__nwafu_name_anonid_tl                 }
            }
        }{
          \clist_set:Nx \l__nwafu_tmpd_clist
            {
              { \l__nwafu_info_school_id_tl              },
              {                                      },
              { \l__nwafu_info_student_id_tl             }
            }
        }
        \__nwafu_get_max_text_width:NN \l__nwafu_tmpd_dim \l__nwafu_tmpd_clist
        \begin{minipage} [ c ] { \textwidth }
        \bool_until_do:nn { \clist_if_empty_p:N \l__nwafu_tmpa_clist }
          {
            \clist_pop:NN \l__nwafu_tmpa_clist \l__nwafu_tmpa_tl
            \clist_pop:NN \l__nwafu_tmpb_clist \l__nwafu_tmpb_tl
            \clist_pop:NN \l__nwafu_tmpc_clist \l__nwafu_tmpc_tl
            \clist_pop:NN \l__nwafu_tmpd_clist \l__nwafu_tmpd_tl
            \tl_if_eq:NNTF \l__nwafu_tmpa_tl \c__nwafu_name_udc_tl
              {
                \__nwafu_fixed_width_box:Vn \l__nwafu_tmpa_dim { \l__nwafu_tmpa_tl }
              }{
                \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim { \l__nwafu_tmpa_tl }
              }
            \c__nwafu_fwid_colon_tl
            \__nwafu_center_box:Vn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_tl }
            \hfill
            \tl_if_empty:NTF \l__nwafu_tmpc_tl
              {
              }{
                \__nwafu_spread_box:Vn \l__nwafu_tmpc_dim { \l__nwafu_tmpc_tl }
                \c__nwafu_fwid_colon_tl
                \__nwafu_center_box:Vn \l__nwafu_tmpd_dim { \l__nwafu_tmpd_tl }
              }
            \par
          }
        \end{minipage}
        \group_end:
      }
      {
        \__nwafu_fixed_width_box:nn { 120 pt }
          {
            \__nwafu_cover_id_aux:n { student_id }
          }
      }
  }
\cs_new:Npn \__nwafu_cover_id_aux:n #1
  {
    \tl_use:c { c__nwafu_name_ #1 _tl }
    \c__nwafu_fwid_colon_tl
    \bool_if:NTF \l__nwafu_anonymous_bool
    {
      \__nwafu_text_uline:V \c__nwafu_name_anonid_tl
    }{
      \__nwafu_text_uline:n {\tl_use:c { l__nwafu_info_ #1 _tl }}
    }
  }
\cs_new_protected:Npn \__nwafu_cover_logo:
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
        \__nwafu_fake_bold:nn {0.20}
          {
            \__nwafu_spread_box:nn { 0.50 \textwidth }
              {
                届
                \l__nwafu_tmpa_tl
                \clist_item:Nn \c__nwafu_bachelor_type_clist { \l__nwafu_info_bachelor_type_int }
              }
          }
      }
  }
\cs_new_protected:Npn \__nwafu_cover_info:
  {
    \begin{minipage} [ c ] { \textwidth }
      \centering
      \int_case:nn {\g__nwafu_thesis_type_int}
        {
          {1}{
            \clist_set:Nx \l__nwafu_tmpa_clist
              {
                { \c__nwafu_name_major_tl         },
                { \c__nwafu_name_researchfield_tl },
                { \c__nwafu_name_author_tl        },
                { \c__nwafu_name_supervisor_tl    },
                { \c__nwafu_name_cosupervisor_tl  },
                { \c__nwafu_name_date_tl          }
              }
            \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
            \bool_if:NTF \l__nwafu_anonymous_bool
            {
              \clist_set:Nx \l__nwafu_tmpb_clist
                {
                  { \l__nwafu_info_major_tl              },
                  { \l__nwafu_info_researchfield_tl      },
                  { \c__nwafu_name_anonname_tl           },
                  { \c__nwafu_name_anonname_tl           },
                  { \c__nwafu_name_anonname_tl           },
                  { \l__nwafu_info_date_tl               }
                }
            }{
              \clist_set:Nx \l__nwafu_tmpb_clist
                {
                  { \l__nwafu_info_major_tl              },
                  { \l__nwafu_info_researchfield_tl      },
                  { \l__nwafu_info_author_tl             },
                  { \l__nwafu_info_supervisor_tl         },
                  { \l__nwafu_info_cosupervisor_tl       },
                  { \l__nwafu_info_date_tl               }
                }
            }
            \__nwafu_get_max_text_width:NN \l__nwafu_tmpb_dim \l__nwafu_tmpb_clist
          }
          {2}{
            \int_case:nn {\l__nwafu_info_degree_type_int}
            {
              {1}{
                \clist_set:Nx \l__nwafu_tmpa_clist
                  {
                    { \c__nwafu_name_major_tl         },
                    { \c__nwafu_name_researchfield_tl },
                    { \c__nwafu_name_author_tl        },
                    { \c__nwafu_name_supervisor_tl    },
                    { \c__nwafu_name_cosupervisor_tl  },
                    { \c__nwafu_name_date_tl          }
                  }
                \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
                \bool_if:NTF \l__nwafu_anonymous_bool
                {
                  \clist_set:Nx \l__nwafu_tmpb_clist
                    {
                      { \l__nwafu_info_major_tl              },
                      { \l__nwafu_info_researchfield_tl      },
                      { \c__nwafu_name_anonname_tl           },
                      { \c__nwafu_name_anonname_tl           },
                      { \c__nwafu_name_anonname_tl           },
                      { \l__nwafu_info_date_tl               }
                    }
                }{
                  \clist_set:Nx \l__nwafu_tmpb_clist
                    {
                      { \l__nwafu_info_major_tl              },
                      { \l__nwafu_info_researchfield_tl      },
                      { \l__nwafu_info_author_tl             },
                      { \l__nwafu_info_supervisor_tl         },
                      { \l__nwafu_info_cosupervisor_tl       },
                      { \l__nwafu_info_date_tl               }
                    }
                }
                \__nwafu_get_max_text_width:NN \l__nwafu_tmpb_dim \l__nwafu_tmpb_clist
              }
              {2}{
                \clist_set:Nx \l__nwafu_tmpa_clist
                  {
                    { \c__nwafu_name_professionaltype_tl  },
                    { \c__nwafu_name_professionalfield_tl },
                    { \c__nwafu_name_author_tl            },
                    { \c__nwafu_name_supervisor_tl        },
                    { \c__nwafu_name_cosupervisor_tl      },
                    { \c__nwafu_name_date_tl              }
                  }
                \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
                \bool_if:NTF \l__nwafu_anonymous_bool
                {
                  \clist_set:Nx \l__nwafu_tmpb_clist
                    {
                      { \l__nwafu_info_professionaltype_tl   },
                      { \l__nwafu_info_professionalfield_tl  },
                      { \c__nwafu_name_anonname_tl           },
                      { \c__nwafu_name_anonname_tl           },
                      { \c__nwafu_name_anonname_tl           },
                      { \l__nwafu_info_date_tl               }
                    }
                }{
                  \clist_set:Nx \l__nwafu_tmpb_clist
                    {
                      { \l__nwafu_info_professionaltype_tl   },
                      { \l__nwafu_info_professionalfield_tl  },
                      { \l__nwafu_info_author_tl             },
                      { \l__nwafu_info_supervisor_tl         },
                      { \l__nwafu_info_cosupervisor_tl       },
                      { \l__nwafu_info_date_tl               }
                    }
                }
                \__nwafu_get_max_text_width:NN \l__nwafu_tmpb_dim \l__nwafu_tmpb_clist
              }
            }
          }
          {3}{
            \clist_set:Nx \l__nwafu_tmpa_clist
              {
                { \c__nwafu_name_department_tl                   },
                { \c__nwafu_name_major_tl                        },
                { \c__nwafu_name_enroll_tl\c__nwafu_name_class_id_tl },
                { \c__nwafu_name_author_tl                       },
                { \c__nwafu_name_supervisor_tl                   },
                { \c__nwafu_name_cosupervisor_tl                 },
                { \c__nwafu_name_date_tl                         }
              }
            \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
            \bool_if:NTF \l__nwafu_anonymous_bool
            {
              \clist_set:Nx \l__nwafu_tmpb_clist
                {
                  { \l__nwafu_info_department_tl                          },
                  { \l__nwafu_info_major_tl                               },
                  { \l__nwafu_info_enroll_tl 级 \l__nwafu_info_class_id_tl 班 },
                  { \c__nwafu_name_anonname_tl                            },
                  { \c__nwafu_name_anonname_tl                            },
                  { \c__nwafu_name_anonname_tl                            },
                  { \l__nwafu_info_date_tl                                }
                }
            }{
              \clist_set:Nx \l__nwafu_tmpb_clist
                {
                  { \l__nwafu_info_department_tl                          },
                  { \l__nwafu_info_major_tl                               },
                  { \l__nwafu_info_enroll_tl 级 \l__nwafu_info_class_id_tl 班 },
                  { \l__nwafu_info_author_tl                              },
                  { \l__nwafu_info_supervisor_tl                          },
                  { \l__nwafu_info_cosupervisor_tl                        },
                  { \l__nwafu_info_date_tl                                }
                }
            }
            \__nwafu_get_max_text_width:NN \l__nwafu_tmpb_dim \l__nwafu_tmpb_clist
          }
      }
      \bool_until_do:nn
        { \clist_if_empty_p:N \l__nwafu_tmpa_clist }
        {
          \clist_pop:NN \l__nwafu_tmpa_clist \l__nwafu_tmpa_tl
          \clist_pop:NN \l__nwafu_tmpb_clist \l__nwafu_tmpb_tl
          \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim { \l__nwafu_tmpa_tl }
          \c__nwafu_fwid_colon_tl
          \__nwafu_center_box:Vn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_tl }
          \skip_vertical:n { 1 ex }
        }
    \end{minipage}
  }
\cs_new_protected:Npn \__nwafu_cover_info_en:
  {
    \int_case:nn {\g__nwafu_thesis_type_int}
      {
        {1}{
          \clist_set:Nx \l__nwafu_tmpa_clist
            {
              {\c__nwafu_name_major_en_tl{\l__nwafu_info_major_en_tl}                 },
              {\c__nwafu_name_researchfield_en_tl{\l__nwafu_info_researchfield_en_tl} },
              {\c__nwafu_name_author_en_tl{\l__nwafu_info_author_en_tl}               },
              {\c__nwafu_name_supervisor_en_tl{\l__nwafu_info_supervisor_en_tl}       },
              {\c__nwafu_name_cosupervisor_en_tl{\l__nwafu_info_cosupervisor_en_tl}   },
              {\c__nwafu_name_date_en_tl{\l__nwafu_info_date_en_tl}                   }
            }
          \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
          \dim_add:Nn \l__nwafu_tmpa_dim {2.5em}
          \begin{minipage} [ c ] { \l__nwafu_tmpa_dim }
            \flushleft
            \clist_set:Nx \l__nwafu_tmpa_clist
              {
                { \c__nwafu_name_major_en_tl         },
                { \c__nwafu_name_researchfield_en_tl },
                { \c__nwafu_name_author_en_tl        },
                { \c__nwafu_name_supervisor_en_tl    },
                { \c__nwafu_name_cosupervisor_en_tl  },
                { \c__nwafu_name_date_en_tl          }
              }
            \bool_if:NTF \l__nwafu_anonymous_bool
            {
              \clist_set:Nx \l__nwafu_tmpb_clist
                {
                  { \l__nwafu_info_major_en_tl              },
                  { \l__nwafu_info_researchfield_en_tl      },
                  { \c__nwafu_name_anonname_en_tl           },
                  { \c__nwafu_name_anonname_en_tl           },
                  { \c__nwafu_name_anonname_en_tl           },
                  { \l__nwafu_info_date_en_tl               }
                }
            }{
              \clist_set:Nx \l__nwafu_tmpb_clist
                {
                  { \l__nwafu_info_major_en_tl              },
                  { \l__nwafu_info_researchfield_en_tl      },
                  { \l__nwafu_info_author_en_tl             },
                  { \l__nwafu_info_supervisor_en_tl         },
                  { \l__nwafu_info_cosupervisor_en_tl       },
                  { \l__nwafu_info_date_en_tl               }
                }
            }
            \bool_until_do:nn
              { \clist_if_empty_p:N \l__nwafu_tmpa_clist }
              {
                \clist_pop:NN \l__nwafu_tmpa_clist \l__nwafu_tmpa_tl
                \clist_pop:NN \l__nwafu_tmpb_clist \l__nwafu_tmpb_tl
                \l__nwafu_tmpa_tl
                \c__nwafu_fwid_colon_tl
                \l__nwafu_tmpb_tl
                \skip_vertical:n { 1 ex }
              }
          \end{minipage}
        }
        {2}{
          \int_case:nn {\l__nwafu_info_degree_type_int}
            {
              {1}{
                \clist_set:Nx \l__nwafu_tmpa_clist
                  {
                    {\c__nwafu_name_major_en_tl{\l__nwafu_info_major_en_tl}                 },
                    {\c__nwafu_name_researchfield_en_tl{\l__nwafu_info_researchfield_en_tl} },
                    {\c__nwafu_name_author_en_tl{\l__nwafu_info_author_en_tl}               },
                    {\c__nwafu_name_supervisor_en_tl{\l__nwafu_info_supervisor_en_tl}       },
                    {\c__nwafu_name_cosupervisor_en_tl{\l__nwafu_info_cosupervisor_en_tl}   },
                    {\c__nwafu_name_date_en_tl{\l__nwafu_info_date_en_tl}                   }
                  }
                \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
                \dim_add:Nn \l__nwafu_tmpa_dim {2.5em}
                \begin{minipage} [ c ] { \l__nwafu_tmpa_dim }
                  \flushleft
                  \clist_set:Nx \l__nwafu_tmpa_clist
                     {
                       { \c__nwafu_name_major_en_tl         },
                       { \c__nwafu_name_researchfield_en_tl },
                       { \c__nwafu_name_author_en_tl        },
                       { \c__nwafu_name_supervisor_en_tl    },
                       { \c__nwafu_name_cosupervisor_en_tl  },
                       { \c__nwafu_name_date_en_tl          }
                     }
                  \bool_if:NTF \l__nwafu_anonymous_bool
                  {
                    \clist_set:Nx \l__nwafu_tmpb_clist
                      {
                        { \l__nwafu_info_major_en_tl              },
                        { \l__nwafu_info_researchfield_en_tl      },
                        { \c__nwafu_name_anonname_en_tl           },
                        { \c__nwafu_name_anonname_en_tl           },
                        { \c__nwafu_name_anonname_en_tl           },
                        { \l__nwafu_info_date_en_tl               }
                      }
                  }{
                    \clist_set:Nx \l__nwafu_tmpb_clist
                      {
                        { \l__nwafu_info_major_en_tl              },
                        { \l__nwafu_info_researchfield_en_tl      },
                        { \l__nwafu_info_author_en_tl             },
                        { \l__nwafu_info_supervisor_en_tl         },
                        { \l__nwafu_info_cosupervisor_en_tl       },
                        { \l__nwafu_info_date_en_tl               }
                      }
                  }
                  \bool_until_do:nn
                    { \clist_if_empty_p:N \l__nwafu_tmpa_clist }
                    {
                      \clist_pop:NN \l__nwafu_tmpa_clist \l__nwafu_tmpa_tl
                      \clist_pop:NN \l__nwafu_tmpb_clist \l__nwafu_tmpb_tl
                      \l__nwafu_tmpa_tl
                      \c__nwafu_fwid_colon_tl
                      \l__nwafu_tmpb_tl
                      \skip_vertical:n { 1 ex }
                    }
                \end{minipage}
              }
              {2}{
                \clist_set:Nx \l__nwafu_tmpa_clist
                  {
                    {\c__nwafu_name_professionaltype_en_tl{Master~of~\l__nwafu_info_professionaltype_en_tl}},
                    {\c__nwafu_name_professionalfield_en_tl{\l__nwafu_info_professionalfield_en_tl}},
                    {\c__nwafu_name_author_en_tl{\l__nwafu_info_author_en_tl}},
                    {\c__nwafu_name_supervisor_en_tl{\l__nwafu_info_supervisor_en_tl}},
                    {\c__nwafu_name_cosupervisor_en_tl{\l__nwafu_info_cosupervisor_en_tl}},
                    {\c__nwafu_name_date_en_tl{\l__nwafu_info_date_en_tl}},
                  }
                \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
                \dim_add:Nn \l__nwafu_tmpa_dim {2.5em}
                \begin{minipage} [ c ] { \l__nwafu_tmpa_dim }
                  \flushleft
                  \clist_set:Nx \l__nwafu_tmpa_clist
                     {
                       { \c__nwafu_name_professionaltype_en_tl  },
                       { \c__nwafu_name_professionalfield_en_tl },
                       { \c__nwafu_name_author_en_tl            },
                       { \c__nwafu_name_supervisor_en_tl        },
                       { \c__nwafu_name_cosupervisor_en_tl      },
                       { \c__nwafu_name_date_en_tl              }
                     }
                  \bool_if:NTF \l__nwafu_anonymous_bool
                  {
                    \clist_set:Nx \l__nwafu_tmpb_clist
                      {
                        { Master ~ of ~ \l__nwafu_info_professionaltype_en_tl },
                        { \l__nwafu_info_professionalfield_en_tl              },
                        { \c__nwafu_name_anonname_en_tl                       },
                        { \c__nwafu_name_anonname_en_tl                       },
                        { \c__nwafu_name_anonname_en_tl                       },
                        { \l__nwafu_info_date_en_tl                           }
                      }
                  }{
                    \clist_set:Nx \l__nwafu_tmpb_clist
                      {
                        { Master ~ of ~ \l__nwafu_info_professionaltype_en_tl },
                        { \l__nwafu_info_professionalfield_en_tl              },
                        { \l__nwafu_info_author_en_tl                         },
                        { \l__nwafu_info_supervisor_en_tl                     },
                        { \l__nwafu_info_cosupervisor_en_tl                   },
                        { \l__nwafu_info_date_en_tl                           }
                      }
                  }
                  \bool_until_do:nn
                    { \clist_if_empty_p:N \l__nwafu_tmpa_clist }
                    {
                      \clist_pop:NN \l__nwafu_tmpa_clist \l__nwafu_tmpa_tl
                      \clist_pop:NN \l__nwafu_tmpb_clist \l__nwafu_tmpb_tl
                      \l__nwafu_tmpa_tl
                      \c__nwafu_fwid_colon_tl
                      \l__nwafu_tmpb_tl
                      \skip_vertical:n { 1 ex }
                    }
                \end{minipage}
              }
            }
          }
      }
  }
\cs_new_protected:Npn \__nwafu_cover_instructors:
  {
    \int_case:nn {\g__nwafu_thesis_type_int}
      {
        {1}{
          \clist_set:Nx \l__nwafu_tmpa_clist
            {
              {\c__nwafu_name_author_tl      },
              {\c__nwafu_name_supervisor_tl  },
              {\c__nwafu_name_instructors_tl },
            }
          \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
          \tl_set:Nn \l__nwafu_tmpa_tl {\clist_use:Nn \l__nwafu_info_instructors_clist {\__nwafu_quad: }}
          \bool_if:NTF \l__nwafu_withsignature_bool
            {
              \begin{minipage} [ c ] { 17em }
                \flushleft
                \c__nwafu_name_author_tl
                \c__nwafu_fwid_colon_tl
                \__nwafu_blank_underline:n{ 12em }
                \skip_vertical:n { 1.6 ex }
                \c__nwafu_name_supervisor_tl
                \c__nwafu_fwid_colon_tl
                \__nwafu_blank_underline:n{ 12em }
                \skip_vertical:n { 1.6 ex }
                \c__nwafu_name_instructors_tl
                \c__nwafu_fwid_colon_tl
                \__nwafu_blank_underline:n{ 12em }
                \skip_vertical:n { 1 ex }
              \end{minipage}
            }{
              \bool_if:NTF \l__nwafu_anonymous_bool
              {
                \clist_set:Nx \l__nwafu_tmpb_clist
                  {
                    { \c__nwafu_name_anonname_tl },
                    { \c__nwafu_name_anonname_tl },
                    { \c__nwafu_name_anonname_tl },
                  }
              }{
                \clist_set:Nx \l__nwafu_tmpb_clist
                  {
                    {\l__nwafu_info_author_tl     },
                    {\l__nwafu_info_supervisor_tl },
                    {\l__nwafu_tmpa_tl            },
                  }
              }
              \__nwafu_get_max_text_width:NN \l__nwafu_tmpb_dim \l__nwafu_tmpb_clist
              \dim_set_eq:NN \l__nwafu_tmpt_dim \l__nwafu_tmpa_dim
              \dim_add:Nn \l__nwafu_tmpt_dim { \l__nwafu_tmpb_dim }
              \dim_add:Nn \l__nwafu_tmpt_dim {2.5em}
              \begin{minipage} [ c ] { \l__nwafu_tmpt_dim }
                \centering
                  \bool_until_do:nn { \clist_if_empty_p:N \l__nwafu_tmpa_clist }
                    {
                      \clist_pop:NN \l__nwafu_tmpa_clist \l__nwafu_tmpa_tl
                      \clist_pop:NN \l__nwafu_tmpb_clist \l__nwafu_tmpb_tl
                      \l__nwafu_tmpa_tl
                      \c__nwafu_fwid_colon_tl
                      \__nwafu_center_box:Vn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_tl }
                      \skip_vertical:n { 1.6 ex }
                    }
                  \skip_vertical:n { -0.6 ex }
              \end{minipage}
            }
        }
        {2}{
          \clist_set:Nx \l__nwafu_tmpa_clist
            {
              {\c__nwafu_name_author_tl      },
              {\c__nwafu_name_supervisor_tl  },
            }
          \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
          \bool_if:NTF \l__nwafu_withsignature_bool
            {
              \begin{minipage} [ c ] { 17em }
                \flushleft
                \c__nwafu_name_author_tl
                \c__nwafu_fwid_colon_tl
                \__nwafu_blank_underline:n{ 12em }
                \skip_vertical:n { 1.6 ex }
                \c__nwafu_name_supervisor_tl
                \c__nwafu_fwid_colon_tl
                \__nwafu_blank_underline:n{ 12em }
                \skip_vertical:n { 1 ex }
              \end{minipage}
            }{
              \bool_if:NTF \l__nwafu_anonymous_bool
              {
                \clist_set:Nx \l__nwafu_tmpb_clist
                  {
                    { \c__nwafu_name_anonname_tl },
                    { \c__nwafu_name_anonname_tl },
                  }
              }{
                \clist_set:Nx \l__nwafu_tmpb_clist
                  {
                    {\l__nwafu_info_author_tl     },
                    {\l__nwafu_info_supervisor_tl },
                  }
              }
              \__nwafu_get_max_text_width:NN \l__nwafu_tmpb_dim \l__nwafu_tmpb_clist
              \dim_add:Nn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_dim }
              \dim_set_eq:NN \l__nwafu_tmpt_dim \l__nwafu_tmpa_dim
              \dim_add:Nn \l__nwafu_tmpt_dim { \l__nwafu_tmpb_dim }
              \dim_add:Nn \l__nwafu_tmpt_dim {2.5em}
              \begin{minipage} [ c ] { \l__nwafu_tmpt_dim }
                \centering
                \bool_until_do:nn { \clist_if_empty_p:N \l__nwafu_tmpa_clist }
                  {
                    \clist_pop:NN \l__nwafu_tmpa_clist \l__nwafu_tmpa_tl
                    \clist_pop:NN \l__nwafu_tmpb_clist \l__nwafu_tmpb_tl
                    \l__nwafu_tmpa_tl
                    \c__nwafu_fwid_colon_tl
                    \__nwafu_center_box:Vn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_tl }
                    \skip_vertical:n { 1.6 ex }
                  }
                \skip_vertical:n { -0.6 ex }
              \end{minipage}
            }
        }
      }
  }
\cs_new_protected:Npn \__nwafu_cover_defensecommittees:
  {
    \clist_set:Nn \l__nwafu_tmpa_clist {}
    \clist_set:Nn \l__nwafu_tmpb_clist {}
    \clist_set:Nn \l__nwafu_tmpc_clist {}
    \bool_until_do:nn { \clist_if_empty_p:N \l__nwafu_info_defensecommittees_clist }
      {
        \clist_set:Nn \l__nwafu_tmpt_clist {}
        \clist_pop:NN \l__nwafu_info_defensecommittees_clist \l__nwafu_tmpa_tl
        \clist_set:NV \l__nwafu_tmpt_clist \l__nwafu_tmpa_tl
        \clist_put_right:Nx \l__nwafu_tmpa_clist {
            \clist_item:Nn \l__nwafu_tmpt_clist {1}
        }
        \clist_put_right:Nx \l__nwafu_tmpb_clist {
            \clist_item:Nn \l__nwafu_tmpt_clist {2}
        }
        \clist_put_right:Nx \l__nwafu_tmpc_clist {
            \clist_item:Nn \l__nwafu_tmpt_clist {3}
        }
      }
    \__nwafu_get_max_text_width:NN \l__nwafu_tmpa_dim \l__nwafu_tmpa_clist
    \__nwafu_get_max_text_width:NN \l__nwafu_tmpb_dim \l__nwafu_tmpb_clist
    \__nwafu_get_max_text_width:NN \l__nwafu_tmpc_dim \l__nwafu_tmpc_clist
    \bool_if:NF \l__nwafu_anonymous_bool
      {
        \begin{minipage} [ c ] { \textwidth }
          \centering
          \bool_until_do:nn { \clist_if_empty_p:N \l__nwafu_tmpa_clist }
            {
              \clist_pop:NN \l__nwafu_tmpa_clist \l__nwafu_tmpa_tl
              \clist_pop:NN \l__nwafu_tmpb_clist \l__nwafu_tmpb_tl
              \clist_pop:NN \l__nwafu_tmpc_clist \l__nwafu_tmpc_tl
              \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim { \l__nwafu_tmpa_tl }
              \__nwafu_center_box:Vn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_tl }
              \__nwafu_spread_box:Vn \l__nwafu_tmpc_dim { \l__nwafu_tmpc_tl }
              \skip_vertical:n { 0.5 ex }
            }
        \end{minipage}
      }
  }
\cs_new_protected:Npn \__nwafu_cover_foundation:
  {
    \clist_set:Nn \l__nwafu_tmpa_clist {}
    \clist_set:Nn \l__nwafu_tmpb_clist {}
    \clist_set:Nn \l__nwafu_tmpc_clist {}
    \bool_until_do:nn { \clist_if_empty_p:N \l__nwafu_info_foundation_clist }
      {
        \clist_set:Nn \l__nwafu_tmpt_clist {}
        \clist_pop:NN \l__nwafu_info_foundation_clist \l__nwafu_tmpa_tl
        \clist_set:NV \l__nwafu_tmpt_clist \l__nwafu_tmpa_tl
        \clist_put_right:Nx \l__nwafu_tmpa_clist {
            \clist_item:Nn \l__nwafu_tmpt_clist {1}
        }
        \clist_put_right:Nx \l__nwafu_tmpb_clist {
            \clist_item:Nn \l__nwafu_tmpt_clist {2}
        }
        \clist_put_right:Nx \l__nwafu_tmpc_clist {
            \clist_item:Nn \l__nwafu_tmpt_clist {3}
        }
      }
    \begin{minipage} [ c ] { \textwidth }
    \bool_until_do:nn { \clist_if_empty_p:N \l__nwafu_tmpa_clist }
      {
        \clist_pop:NN \l__nwafu_tmpa_clist \l__nwafu_tmpa_tl
        \clist_pop:NN \l__nwafu_tmpb_clist \l__nwafu_tmpb_tl
        \clist_pop:NN \l__nwafu_tmpc_clist \l__nwafu_tmpc_tl
        \indent
        \__nwafu_qquad:
        本研究得到
        \bool_if:NTF \l__nwafu_anonymous_bool
          {
            \c__nwafu_name_anonname_tl,
          }{
            \l__nwafu_tmpa_tl
          }
        \c__nwafu_fwid_colon_tl
        \bool_if:NTF \l__nwafu_anonymous_bool
          {
            \c__nwafu_name_anonname_tl,
          }{
            \l__nwafu_tmpb_tl
          }
        (编号\c__nwafu_fwid_colon_tl
        \bool_if:NTF \l__nwafu_anonymous_bool
          {
            \c__nwafu_name_anonname_tl,
          }{
            \l__nwafu_tmpc_tl
          }
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
        % \__nwafu_blank_underline:n { 6 em }
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
\__nwafu_declare_element:nn { cover / i / id }
  {
    content     = \__nwafu_cover_id:,
    format      = \bfseries\zihao { 4 },
    bottom-skip = 0 pt plus 0.3 fill,
    align       = right,
  }
\__nwafu_declare_element:nn { cover / i / logo }
  {
    content     = \__nwafu_cover_logo:,
    bottom-skip = \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                    {
                      -45 pt plus 0.3 fill
                    }{
                      -30 pt plus 0.3 fill
                    },
    align       = center,
  }
\__nwafu_declare_element:nn { cover / i / type }
  {
    content     = \__nwafu_cover_type:,
    format      = \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                    {
                      \sffamily \zihao { 0 }
                    }{
                      \nwafu@kai\zihao{ 1 }
                    },
    bottom-skip = -20 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / i / title }
  {
    content     = \__nwafu_fixed_width_center_box:nn { 0.9 \textwidth }
                                           { \l__nwafu_info_title_tl },
    format      = \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                    {
                      \sffamily \zihao { 2 }
                    }{
                      \nwafu@hei\zihao{ 2 }
                    },
    bottom-skip = 80 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / i / info }
  {
    content     = \__nwafu_cover_info:,
    format      = \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                    {
                      \__nwafu_line_spread:n {1.05}\nwafu@hei \zihao { -3 }
                    }{
                      \rmfamily \zihao { 3 }
                    },
    align       = center,
  }
\__nwafu_declare_element:nn { cover / ii / type }
  {
    content     = \int_case:nn { \g__nwafu_thesis_type_int }
                    {
                      {1}{
                        \__nwafu_fixed_width_center_box:nn { 0.7\textwidth } {
                          Thesis~Submitted~to~\c__nwafu_name_en_tl\\
                          in~Partial~Fulfillment~of~the~Requirements\\
                          for~Degree~of\\
                          Doctor~of~Philosophy
                        }
                      }
                      {2}{
                        \__nwafu_fixed_width_center_box:nn { 0.7\textwidth } {
                          Thesis~Submitted~to~\c__nwafu_name_en_tl\\
                          in~Partial~Fulfillment~of~the~Requirements\\
                          for~Degree~of\\
                          Master~of
                          \int_case:nn {\l__nwafu_info_degree_type_int}
                            {
                              {1}{
                                \__nwafu_text_uline:V \l__nwafu_info_mastertype_en_tl
                              }
                              {2}{
                                \__nwafu_text_uline:V \l__nwafu_info_professionaltype_en_tl
                              }
                            }
                        }
                      }
                    },
    format      = \__nwafu_line_spread:n {1.22} \zihao { -3 },
    bottom-skip = 42 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / ii / title }
  {
    content     = \l__nwafu_info_title_en_tl,
    format      = \__nwafu_line_spread:n {0.90} \zihao { 1 } \bfseries,
    bottom-skip = 35 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / ii / info }
  {
    content     = \__nwafu_cover_info_en:,
    format      = \__nwafu_line_spread:n {1.12} \zihao { -3 },
    bottom-skip = 72 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / ii / department }
  {
    content     = \l__nwafu_info_department_en_tl,
    format      = \zihao { -3 },
    bottom-skip = -32 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / ii / nwafu }
  {
    content     = \c__nwafu_name_en_tl,
    format      = \zihao { -3 },
    align       = center,
  }
\__nwafu_declare_element:nn { cover / iii / id }
  {
    content     = \__nwafu_cover_id:,
    format      = \__nwafu_line_spread:n {1.12}\zihao { -4 },
    bottom-skip = 35 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / iii / type }
  {
    content     = \c__nwafu_name_simp_tl
                  \clist_item:Nn \c__nwafu_thesis_type_clist { \g__nwafu_thesis_type_int },
    format      = \zihao { -2 }\bfseries,
    bottom-skip = 0 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / iii / title }
  {
    content     = \l__nwafu_info_title_tl,
    format      = \zihao { 2 }\sffamily,
    bottom-skip = 65 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / iii / instructors }
  {
    content     = \__nwafu_cover_instructors:,
    format      = \__nwafu_line_spread:n {0.88}\zihao { 3 }\bfseries,
    bottom-skip = 75 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / iii / ctitle }
  {
    content     = 答辩委员会\c__nwafu_fwid_colon_tl,
    format      = \zihao { -3 }\bfseries,
    bottom-skip = -20 pt plus 0.3 fill,
    align       = left,
  }
\__nwafu_declare_element:nn { cover / iii / committees }
  {
    content     = \__nwafu_cover_defensecommittees:,
    format      = \__nwafu_line_spread:n {1.12}\zihao { -3 },
    bottom-skip = 60 pt plus 0.3 fill,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / iii / date }
  {
    content     = {\bfseries{}答辩日期}\c__nwafu_fwid_colon_tl\l__nwafu_info_defensedate_tl,
    format      = \zihao { -3 },
    bottom-skip = 0 pt plus 0.3 fill,
    align       = left,
  }
\__nwafu_declare_element:nn { cover / iv / foundation }
  {
    content     = \__nwafu_cover_foundation:,
    format      = \sffamily\zihao{3},
    align       = center,
  }
\__nwafu_declare_element:nn { cover / v / originality-decl-name }
  {
    content     = \c__nwafu_name_orig_decl_tl,
    format      = \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily,
    bottom-skip = 0.25 cm,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / v / originality-decl-text }
  {
    content     = \c__nwafu_orig_decl_text_tl,
    format      = \zihao { -4 },
    bottom-skip = 0.4 cm,
  }
\__nwafu_declare_element:nn { cover / v / originality-decl-sig }
  {
    content     = \__nwafu_cover_signature:N \c__nwafu_orig_decl_sign_tl,
    format      = \zihao { -4 },
    bottom-skip = 0.4 cm,
    align       = left,
  }
\__nwafu_declare_element:nn { cover / v / supervisor-decl-name }
  {
    content     = \c__nwafu_name_super_decl_tl,
    format      = \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily,
    bottom-skip = 0.25 cm,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / v / supervisor-decl-text }
  {
    content     = \c__nwafu_super_decl_text_tl,
    format      = \zihao { -4 },
    bottom-skip = 0.4 cm,
  }
\__nwafu_declare_element:nn { cover / v / supervisor-decl-sig }
  {
    content     = \__nwafu_cover_signature:N \c__nwafu_super_decl_sign_tl,
    format      = \zihao { -4 },
    align       = left,
  }
\__nwafu_declare_element:nn { cover / vi / authorization-decl-name }
  {
    content     = \c__nwafu_name_auth_decl_tl,
    format      = \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily,
    bottom-skip = 0.25 cm,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / vi / authorization-decl-text }
  {
    content     = \c__nwafu_auth_decl_text_tl,
    format      = \zihao { -4 },
    bottom-skip = 0.8 cm,
  }
\__nwafu_declare_element:nn { cover / vi / authorization-decl-sig }
  {
    content     = \__nwafu_cover_signature:N \c__nwafu_orig_decl_sign_tl,
    align       = left,
  }
\__nwafu_declare_element:nn { cover / vi / supervisor-decl-sig }
  {
    content     = \__nwafu_cover_signature:N \c__nwafu_super_decl_sign_tl,
    align       = left,
  }
\__nwafu_declare_element:nn { cover / vii / originality-decl-name }
  {
    content     = \c__nwafu_name_orig_decl_tl,
    format      = \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily,
    bottom-skip = 0.25 cm,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / vii / originality-decl-text }
  {
    content     = \c__nwafu_orig_decl_text_tl,
    format      = \indent \zihao { -4 } \nwafu@kai,
    bottom-skip = 0.4 cm,
  }
\__nwafu_declare_element:nn { cover / vii / originality-decl-sig }
  {
    content     = \__nwafu_cover_signature:N \c__nwafu_orig_decl_sign_tl,
    format      = \zihao { -4 } \nwafu@kai,
    bottom-skip = 0.4 cm,
    align       = left,
  }
\__nwafu_declare_element:nn { cover / vii / authorization-decl-name }
  {
    content     = \c__nwafu_name_auth_decl_tl,
    format      = \__nwafu_line_spread:n { 1.2 } \zihao { 3 } \sffamily,
    bottom-skip = 0.25 cm,
    align       = center,
  }
\__nwafu_declare_element:nn { cover / vii / authorization-decl-text }
  {
    content     = \c__nwafu_auth_decl_text_tl,
    format      = \zihao { -4 } \nwafu@kai,
    bottom-skip = 0.4 cm,
  }
\__nwafu_declare_element:nn { cover / vii / authorization-decl-sig }
  {
    content     = \__nwafu_cover_signature:N \c__nwafu_orig_decl_sign_tl,
    format      = \zihao { -4 } \nwafu@kai,
    bottom-skip = -0.5 cm,
    align       = left,
  }
\__nwafu_declare_element:nn { cover / vii / supervisor-decl-sig }
  {
    content     = \__nwafu_cover_signature:N \c__nwafu_super_decl_sign_tl,
    format      = \zihao { -4 } \nwafu@kai,
    align       = left,
  }
\__nwafu_declare_page:nx { cover-i-default }
  {
    content     = \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
                    {
                      { logo, type, title, info }
                    }{
                      { id, logo, type, title, info }
                    },
    prefix      = cover / i /,
    bottom-skip = 0 pt plus 1.5 fill
  }
\__nwafu_declare_page:nn { cover-ii-default }
  {
    content     = { type, title, info, department, nwafu },
    prefix      = cover / ii /,
    bottom-skip = 0 pt plus 1.5 fill
  }
\__nwafu_declare_page:nn { cover-iii-default }
  {
    content     = { id, type, title, instructors, ctitle, committees, date },
    prefix      = cover / iii /,
    top-skip    = -55 pt plus 0.1 fill,
    bottom-skip = 0 pt plus 0.5 fill
  }
\__nwafu_declare_page:nn { cover-iv-default }
  {
    content     = { foundation },
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
    \newgeometry{top=1.0in, bottom=1.0in, left=1.25in, right=1.25in}
    \UseInstance { nwafu } { cover-v-default }
    \restoregeometry
  }
\NewDocumentCommand \makecovervi { }
  {
    \thispagestyle { empty }
    \newgeometry{top=1.0in, bottom=1.0in, left=1.25in, right=1.25in}
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
\bool_new:N \l__nwafu_auto_make_cover_bool
\keys_define:nn { nwafu / style }
  {
    auto-make-cover .bool_set:N = \l__nwafu_auto_make_cover_bool,
    auto-make-cover .default:n  = true
  }
\NewDocumentCommand \makecovers { }
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \begin{titlepage}
          \makecoveri
          \newpage
          \makecoverii
          \newpage
          \makecoveriii
          \newpage
          \makecoveriv
          \newpage
          \makecoverv
          \newpage
          \makecovervi
        \end{titlepage}
      }{
        \begin{titlepage}
          \makecoveri
          \cleardoublepage
          \makecovervii
        \end{titlepage}
      }
  }
\tl_new:c { l__nwafu_abstract_file_tl }
\tl_new:c { l__nwafu_abstract_file_en_tl }
\clist_new:N \l__nwafu_abstract_keywords_clist
\clist_new:N \l__nwafu_abstract_keywords_en_clist
\tl_new:c { l__nwafu_notation_file_tl }
\keys_define:nn { nwafu / abstract }
  {
    abstractfile  .tl_set:N = \l__nwafu_abstract_file_tl,
    abstractfile* .tl_set:N = \l__nwafu_abstract_file_en_tl,
    keywords  .clist_set:N = \l__nwafu_abstract_keywords_clist,
    keywords* .clist_set:N = \l__nwafu_abstract_keywords_en_clist,
    notationfile  .tl_set:N  = \l__nwafu_notation_file_tl,
    notationfile  .default:n = {},
  }
\NewDocumentCommand \makefront { }
  {
    \restoregeometry
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \frontmatter
        \tl_if_empty:NF \l__nwafu_abstract_file_tl
          {
            \begin{abstract}
              \file_input:V \l__nwafu_abstract_file_tl
            \end{abstract}
          }
        \tl_if_empty:NF \l__nwafu_abstract_file_en_tl
          {
            \begin{abstract*}
              \file_input:V \l__nwafu_abstract_file_en_tl
            \end{abstract*}
          }
        \cleardoublepage
        \pagenumbering{Roman}
        \tableofcontents
        \tl_if_empty:NF \l__nwafu_notation_file_tl
          {
            \cleardoublepage
            \pagenumbering{Roman}
            \file_input:V \l__nwafu_notation_file_tl
          }
      }{
        \cleardoublepage
        \thispagestyle { empty }
        \tl_if_empty:NF \l__nwafu_abstract_file_tl
          {
            \begin{abstract}
              \__nwafu_get_text_width:Nn \l__nwafu_tmpa_dim {\c__nwafu_name_keywords_tl}
              \group_begin:
                \par \indent
                {\nwafu@hei\zihao{-4}
                \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim {\c__nwafu_name_abstract_tl}
                \c__nwafu_fwid_colon_tl}
                \normalfont
                \file_input:V \l__nwafu_abstract_file_tl
              \group_end:
            \end{abstract}
          }
        \cleardoublepage
        \thispagestyle { empty }
        \tl_if_empty:NF \l__nwafu_abstract_file_en_tl
          {
            \begin{abstract*}
              \group_begin:
                \par \indent
                {\bfseries\zihao{-4}
                \c__nwafu_name_abstract_en_tl : ~}
                \normalfont
                \file_input:V \l__nwafu_abstract_file_en_tl
              \group_end:
            \end{abstract*}
          }
        \frontmatter
        \tableofcontents
      }
  }
\ctex_after_end_preamble:n
  {
    \bool_if:NT \l__nwafu_auto_make_cover_bool
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
\clist_map_inline:nn
  {
      chapter, section, subsection, figure, table
  }
  {
    \clist_map_inline:nn
      {
        format, indent, rule, numsep
      }
      {
        \tl_new:c {__nwafu_toc_ #1 _ ##1 _ tl}
      }
  }
\clist_map_inline:nn
  {
      chapter, section, subsection, figure, table
  }
  { \dim_new:c { __nwafu_toc_ #1 _offset_dim } }
\bool_new:N \__nwafu_toc_line_align_bool
\bool_new:N \__nwafu_titletoc_hang_fix_bool
\tl_set:Nn \__nwafu_toc_chapter_format_tl { \addvspace{1pt}\nwafu@hei }
\tl_set:Nn \__nwafu_toc_chapter_indent_tl {0pc}
\tl_set:Nn \__nwafu_toc_chapter_rule_tl {\tocrule{$\cdot$}}
\tl_set:Nn \__nwafu_toc_chapter_numsep_tl {0.5\ccwd}
\dim_set:Nn \__nwafu_toc_chapter_offset_dim
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
          0pc
      }{
          1pt
      }
  }
\tl_set:Nn \__nwafu_toc_section_format_tl
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
          \addvspace{0pt}
      }{
          \addvspace{1pt}\small
      }
  }
\tl_set:Nn \__nwafu_toc_section_indent_tl { \ccwd }
\tl_set:Nn \__nwafu_toc_section_rule_tl {\tocrule{$\cdot$}}
\tl_set:Nn \__nwafu_toc_section_numsep_tl {0.5\ccwd}
\dim_set:Nn \__nwafu_toc_section_offset_dim
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
          0pc
      }{
          1pt
      }
  }
\tl_set:Nn \__nwafu_toc_subsection_format_tl
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
          \addvspace{0pt}
      }{
          \addvspace{1pt}\small
      }
  }
\tl_set:Nn \__nwafu_toc_subsection_indent_tl {2.0\ccwd}
\tl_set:Nn \__nwafu_toc_subsection_rule_tl {\tocrule{$\cdot$}}
\tl_set:Nn \__nwafu_toc_subsection_numsep_tl {0.5\ccwd}
\dim_set:Nn \__nwafu_toc_subsection_offset_dim
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
          0pc
      }{
          1pt
      }
  }
\tl_set:Nn \__nwafu_toc_figure_format_tl
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
          \addvspace{0pt}
      }{
          \addvspace{1pt}
      }
  }
\tl_set:Nn \__nwafu_toc_figure_indent_tl {0pc}
\tl_set:Nn \__nwafu_toc_figure_rule_tl {\tocrule{$\cdot$}}
\tl_set:Nn \__nwafu_toc_figure_numsep_tl {0.5\ccwd}
\dim_set:Nn \__nwafu_toc_figure_offset_dim
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
          0pc
      }{
          1pt
      }
  }
\tl_set:Nn \__nwafu_toc_table_format_tl
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
          \addvspace{0pt}
      }{
          \addvspace{1pt}
      }
  }
\tl_set:Nn \__nwafu_toc_table_indent_tl {0pc}
\tl_set:Nn \__nwafu_toc_table_rule_tl {\tocrule{$\cdot$}}
\tl_set:Nn \__nwafu_toc_table_numsep_tl {0.5\ccwd}
\dim_set:Nn \__nwafu_toc_table_offset_dim
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
          0pc
      }{
          1pt
      }
  }
\bool_set_false:N \__nwafu_toc_line_align_bool
\bool_set_false:N \__nwafu_titletoc_hang_fix_bool
\clist_map_inline:nn
  {
      chapter, section, subsection, figure, table
  }
  {
    \titlecontents{#1}
      [ \use:c { __nwafu_toc_#1_indent_tl } ]
      { \use:c { __nwafu_toc_#1_format_tl } }
      {
        \bool_if:NT \__nwafu_titletoc_hang_fix_bool
          {
            \contentspush
              {
                \thecontentslabel
                \hspace{\use:c { __nwafu_toc_#1_numsep_tl }}
              }
          }
      }
      {}
      {\use:c { __nwafu_toc_#1_rule_tl }}
      [\addvspace{\use:c{ __nwafu_toc_ #1 _offset_dim }}]
  }

\cs_new:Npn \NWAFUNumberLine #1
  {
    \CTEXifname
      {
        \use:c { CTEXthe#1 }
        \hspace{\use:c { __nwafu_toc_#1_numsep_tl }}
      }{}
  }

\bool_if:NTF \__nwafu_titletoc_hang_fix_bool
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
        subsection/tocline  = \NWAFUNumberLine{#1}#2
      }
 }
\NewDocumentCommand{\tocrule}{sO{0.3pc}D(){1.2}mO{}}
  {
    \small\normalfont
    \titlerule*[#2]{\scalebox{#3}{#4}}#5
    \IfBooleanTF{#1}
      {\thecontentspage}
      {
        \bool_if:NTF \__nwafu_toc_line_align_bool
          {\contentspage}{\thecontentspage}
      }
  }
\__nwafu_patch_cmd:Nnn \tableofcontents
  {
    \chapter*{\contentsname
      \@mkboth{\MakeUppercase\contentsname}
              {\MakeUppercase\contentsname}}
  }
  { \__nwafu_chapter_no_toc:V \contentsname }
\__nwafu_patch_cmd:Nnn \listoffigures
  {
    \chapter*{\listfigurename}
    \@mkboth{\MakeUppercase\listfigurename}
            {\MakeUppercase\listfigurename}
  }
  { \__nwafu_chapter:V \listfigurename }
\__nwafu_patch_cmd:Nnn \listoftables
  {
    \chapter*{\listtablename}
    \@mkboth{\MakeUppercase\listtablename}
            {\MakeUppercase\listtablename}
  }
  { \__nwafu_chapter:V \listtablename }
\NewDocumentEnvironment { abstract  } { }
  { \__nwafu_abstract_begin:    } { \__nwafu_abstract_end:      }
\NewDocumentEnvironment { abstract* } { }
  { \__nwafu_abstract_en_begin: } { \__nwafu_abstract_en_end:   }
\cs_new_protected:Npn \__nwafu_abstract_begin:
  {
    % \tl_set_eq:NN \l_tmpa_tl \l__nwafu_info_title_tl
    % \tl_replace_all:Nnn \l_tmpa_tl { \\ } { ~ }
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \__nwafu_chapter:V \c__nwafu_name_abstract_tl
      }{
        \par \mode_leave_vertical: \par
        \begin{center}\nwafu@hei\zihao{3}\l__nwafu_info_title_tl\end{center}
        % \begin{center}\nwafu@hei\zihao{3}\l_tmpa_tl\end{center}
      }
  }
\cs_set_eq:NN \my_uppercase:n \uppercase
\cs_new_protected:Npn \__nwafu_abstract_en_begin:
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \__nwafu_chapter:n \c__nwafu_name_abstract_en_tl
      }{
        \par \mode_leave_vertical: \par
        \begin{center}\bfseries\zihao{3}
          % \exp_args:Nx \my_uppercase:n {\l__nwafu_info_title_en_tl}
          \l__nwafu_info_title_en_tl
        \end{center}
      }
  }
\cs_new_protected:Npn \__nwafu_abstract_end:
  {
    \__nwafu_keywords:nNn
      { \nwafu@hei \zihao{-4} \c__nwafu_name_keywords_tl \c__nwafu_fwid_colon_tl  }
      \l__nwafu_abstract_keywords_clist { ; ~}
  }
\cs_new_protected:Npn \__nwafu_abstract_en_end:
  {
    \__nwafu_keywords:nNn
      { \bfseries \c__nwafu_name_keywords_en_tl : ~ }
      \l__nwafu_abstract_keywords_en_clist { ; ~ }
  }
\cs_new_protected:Npn \__nwafu_keywords:nNn #1#2#3
  {
    \int_compare:nNnTF { \g__nwafu_thesis_type_int } < { 3 }
      {
        \par \mode_leave_vertical: \par \noindent
        \__nwafu_get_text_width:Nn \l__nwafu_tmpa_dim {#1}
        \group_begin: \MakeUppercase{#1} \group_end:
        \parbox [t] { \dim_eval:n { \textwidth - \l__nwafu_tmpa_dim } }
          {
            \clist_use:Nn #2 {#3} \par
            \cs_gset:Npx \__nwafu_keywords_prevdepth: { \dim_use:N \tex_prevdepth:D }
          }
      }{
        \par \mode_leave_vertical: \par
        \__nwafu_get_text_width:Nn \l__nwafu_tmpa_dim {#1}
        \group_begin: #1 \group_end:
        \clist_use:Nn #2 {#3} \par
        \cs_gset:Npx \__nwafu_keywords_prevdepth: { \dim_use:N \tex_prevdepth:D }
      }
  }
\NewDocumentEnvironment { notation } { O { l p { 7.5 cm } } }
  {
    \__nwafu_notation_begin:
    \group_begin:
      \__nwafu_notation_long_table_setup:
      \longtable {#1}
  }
  {
      \endlongtable
    \group_end:
  }
\cs_new_protected:Npn \__nwafu_notation_begin:
  {
    \__nwafu_chapter_no_toc:V \c__nwafu_name_notation_tl
  }
\cs_new_protected:Npn \__nwafu_notation_long_table_setup:
  {
    \dim_set_eq:NN \LTpre  \c_zero_dim
    \dim_set_eq:NN \LTpost \c_zero_dim
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
    % \__nwafu_pass_options_to_biblatex:n
    %   {
    %     backend = biber,
    %     sortlocale=zh__pinyin, gbtype=false,
    %     maxbibnames=99, maxcitenames=2, mincitenames=1,
    %     gbpub=false, uniquename=false, uniquelist=false,
        % gbnamefmt=lowercase,
    %     doi=false, isbn=false,
    %     gbfieldtype=true, gbpunctin=false,
      % }
  }
\cs_new_protected:Npn \__nwafu_biblatex_post_setup:
  {
    \clist_map_function:NN \l__nwafu_bib_resource_clist \addbibresource
    \defbibheading { bibliography } [ \bibname ] { \__nwafu_chapter:n {##1} }
    \renewcommand{\bibfont}{\zihao{5}}
    \DefineBibliographyExtras{english}{%
      \renewcommand*{\bibrangedash}{%
        \iffieldequalstr{userd}{chinese}%
        {%
          \c__nwafu_fwid_tilde_tl%$\sim$
        }{%
          \textendash\penalty\hyphenpenalty
        }
      }
    }
    \def\gbcaselocalset{%
      \renewrobustcmd*{\bibinitperiod}{}%
      \renewcommand*{\revsdnamepunct}{}%
      %\renewrobustcmd*{\bibinitdelim}{}%
    }

    \renewbibmacro*{name:family-given}[4]{%
      \gbcaselocalset%
      \ifuseprefix{%
        \usebibmacro{name:delim}{##3##1}%
        \usebibmacro{name:hook}{##3##1}%
        \mkbibcompletenamefamilygiven{%
          \ifdefvoid{##3}{}
          {%
            \ifcapital
              {\mkbibnameprefix{\MakeCapital{##3}}\isdot}
              {\mkbibnameprefix{##3}\isdot}%
            \ifprefchar{}{\bibnamedelimc}
          }%
          \mkbibnamefamily{##1}\isdot
          \ifdefvoid{##4}{}
          {\bibnamedelimd\mkbibnamesuffix{##4}\isdot}%
          \ifdefvoid{##2}{}
          {\revsdnamepunct\bibnamedelimd\mkbibnamegiven{##2}\isdot}
        }
      }{%
        \usebibmacro{name:delim}{##1}%
        \usebibmacro{name:hook}{##1}%
        \mkbibcompletenamefamilygiven{%
          \mkbibnamefamily{##1}\isdot
          \ifdefvoid{##4}{}
            {\bibnamedelimd\mkbibnamesuffix{##4}\isdot}%
          \ifboolexpe{%
            test {\ifdefvoid{##2}}
            and
            test {\ifdefvoid{##3}}
          }{}
          {\revsdnamepunct}%
          \ifdefvoid{##2}{}
            {\bibnamedelimd\mkbibnamegiven{##2}\isdot}%
          \ifdefvoid{##3}{}
            {\bibnamedelimd\mkbibnameprefix{##3}\isdot}
        }
      }
    }
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
  }
\cs_new_protected:Npn \__nwafu_enumitem_label_set:nn #1#2
  { \SetEnumitemValue{label}{#1}{#2} }
\clist_map_inline:nn
  {
    { bullet   } { \textbullet                                               },
    { endash   } { \normalfont\bfseries\textendash                           },
    { asterisk } { \textasteriskcentered                                     },
    { arabic   } { \c__nwafu_fwid_left_paren_tl\arabic*\c__nwafu_fwid_right_paren_tl },
    { alph     } { \c__nwafu_fwid_left_paren_tl\alph*\c__nwafu_fwid_right_paren_tl   },
    { roman    } { \c__nwafu_fwid_left_paren_tl\roman*\c__nwafu_fwid_right_paren_tl  },
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
\setlist[enumerate,1]{label = arabic,ref = \arabic*}
\setlist[enumerate,2]{label = alph,ref = enumii}
\setlist[enumerate,3]{label = roman,ref = enumiii,labelwidth = *}
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
    info    / degree          = academic,
    info    / secret-level    = none,
    info    / school-id       = { 10712 },
    info    / date            = { \zhtoday },
    theorem / header-font     = { \sffamily },
    theorem / body-font       = { \nwafu@kai },
    theorem / counter         = { chapter }
  }
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
