%%% ----------------------------------------------------------------------------
%%% nwafupaper: 西北农林科技大学课程论文/设计/实习报告模板（expl3实现）
%%% author    : Nan Geng <nangeng@nwafu.edu.cn>
%%% Repository: https://gitee.com/nwafu_nan/nwafupaper-l3
%%% License   : The LaTeX Project Public License 1.3c
%%% ----------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\GetIdInfo $Id: nwafupaper.cls 1.02 2026-06-01 Nan Geng <nangeng@nwafu.edu.cn> $
  {Course Paper/Report template for Northwest A\&F University}
\ProvidesExplClass{nwafupaper}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}

%% ===================================================================
%% 环境检查
%% ===================================================================
% LaTeX3环境
\RequirePackage {xtemplate, l3keys2e }
\clist_map_inline:nn { xtemplate, l3keys2e }
  {
    \@ifpackagelater {#1} { 2020/07/17 }
      { } { \msg_error:nnn { nwafupaper } { l3-too-old } {#1} }
  }
\msg_new:nnn { nwafupaper } { l3-too-old }
  {
    Package~ "#1"~ is~ too~ old. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ the~ bundles \\
    "l3kernel"~ and~ "l3packages"~ using~ your~ TeX~ package \\
    manager~ or~ from~ CTAN.
  }

% 编译环境，目前仅支持XeLaTeX和LuaLaTeX编译引擎
\sys_if_engine_xetex:F
  {
    \sys_if_engine_luatex:F
      {
        \msg_fatal:nnx { nwafupaper } { unsupported-engine }
          { \c_sys_engine_str }
      }
  }
\msg_new:nnn { nwafupaper } { unsupported-engine }
  {
    The~ nwafupaper~ class~ requires~ either~ XeTeX~ or~ LuaTeX. \\\\
    "#1"~ is~ not~ supported~ at~ present.~ You~ must~ change \\
    your~ typesetting~ engine~ to~ "xelatex"~ or~ "lualatex".
  }

%% ===================================================================
%% 变量声明
%% ===================================================================
% 临时变量
\box_new:N   \l__nwafu_tmpa_box
\box_new:N   \l__nwafu_tmpb_box
\box_new:N   \l__nwafu_tmpc_box
\box_new:N   \l__nwafu_tmpd_box
\box_new:N   \l__nwafu_tmpt_box
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

% 课程论文类型，取值1、2、3分别对应课程设计、课程论文、实习报告
% 说明：
%   1. 实习报告基于ctexbook实现，章节最高级别为\part（部分）
%   2. 课程设计和课程论文基于ctexart实现，章节最高级别为\section（节）
\int_new:N \g__nwafu_paper_type_int

% 传递给ctexbook/ctexart文档类的选项列表
\clist_new:N \g__nwafu_to_ctexart_clist
% 传递给hyperref的选项列表
\clist_new:N \g__nwafu_to_hyperref_clist
% 单双面模式状态bool全局变量
\bool_new:N \g__nwafu_twoside_bool
\bool_set_true:N \g__nwafu_twoside_bool
% 草稿模式状态bool全局变量
\bool_new:N \g__nwafu_draft_bool
\bool_set_false:N \g__nwafu_draft_bool

%% ===================================================================
%% 需要用到的LaTeX3函数的函数变体
%% ===================================================================
\cs_generate_variant:Nn \file_input:n           { V  }
\cs_generate_variant:Nn \int_to_arabic:n        { v  }
\cs_generate_variant:Nn \keys_define:nn         { nx }
\cs_generate_variant:Nn \tl_map_inline:nn       { xn }
\prg_generate_conditional_variant:Nnn \tl_if_eq:nn { Vn } { T, TF }

%% ===================================================================
%% 辅助函数
%% ===================================================================
% 水平空白
\cs_new:Npn \__nwafu_quad:  { \skip_horizontal:n { 1 em } }
\cs_new:Npn \__nwafu_qquad: { \skip_horizontal:n { 2 em } }

% 垂直空白
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
    \skip_set:Nn \l__nwafu_tmpa_skip { #1 }
    \__nwafu_vspace:N \l__nwafu_tmpa_skip
  }
\cs_generate_variant:Nn \__nwafu_vspace:N { c }

% 符号生成函数
\cs_new:Npn \__nwafu_symbol:n #1 { \tex_char:D #1 \scan_stop: }
% arabic数字生成函数
\cs_new:Npn \__nwafu_arabic:n #1 { \int_to_arabic:v { c@ #1 } }

% 利用PDF Literal实现的伪粗命令
\cs_new:Npn \__nwafu_fake_bold:nn #1#2
  {
    \special{ pdf:code~q~2~Tr~0~G~#1~w }%
    #2%
    \special{ pdf:code~Q }%
  }
\NewDocumentCommand \fakebold {O{0.2} m }
  {
    \__nwafu_fake_bold:nn { #1 }{ #2 }
  }

% 定义nwafupaer Logo命令
\NewDocumentCommand \nwafupaper { }
  {%
    \makebox{\rmfamily%
      N\hspace{-0.2ex}\raisebox{-0.5ex}{W}\raisebox{0.5ex}
      {\hspace{-0.2ex}\textsc{AFU}}\hspace{0.3ex}%
      \textsc{Paper}
    }
  }

% 月份-英文名称属性表常量
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

% 定义输出中英文年月命令
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

% 钩子函数
% 封装 LaTeX 的钩子管理机制。本模板中的字体加载命令位于
% begindocument/before 钩子中，需确保在 xeCJK 之前执行。
\cs_new_protected:Npn \__nwafu_gadd_ltxhook:nn #1#2
  { \hook_gput_code:nnn { #1 } { . } { #2 } }
\hook_gset_rule:nnnn { begindocument/before } { . } { < } { xeCJK }

% 补丁工具，来自 \pkg{ctexpatch} 宏包。
\cs_new_protected:Npn \__nwafu_patch_cmd:Nnn #1#2#3
  {
    \ctex_patch_cmd_once:NnnnTF #1 { } { #2 } { #3 }
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__nwafu_preto_cmd:Nn #1#2
  {
    \ctex_preto_cmd:NnnTF #1 { } { #2 }
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__nwafu_appto_cmd:Nn #1#2
  {
    \ctex_appto_cmd:NnnTF #1 { } { #2 }
      { } { \ctex_patch_failure:N #1 }
  }

% 在环境开始添加代码的补丁函数。
\cs_new_protected:Npn \__nwafu_at_begin_environment:nn #1#2
  {
    \seq_set_from_clist:Nn \l__nwafu_env_hook_name_seq { #1 }
    \seq_map_inline:Nn \l__nwafu_env_hook_name_seq
      { \AtBeginEnvironment{ ##1 }{ #2 } }
  }

% 在导言区结束位置添加代码的补丁函数。
\cs_new_protected:Npn \__nwafu_at_end_preamble:n #1
  {
    \ctex_gadd_ltxhook:nn { env/document/before } { #1 }
  }

% 脚注样式tl常量定义函数
\cs_new_protected:Npn \__nwafu_define_fn_style:nn #1#2
  { \tl_const:cn { c__nwafu_fn_style_ #1 _tl } { #2 } }
% 标点tl常量定义函数
\cs_new_protected:Npn \__nwafu_define_punct:nn #1#2
  { \tl_const:cn { c__nwafu_ #1 _tl } { \__nwafu_symbol:n { #2 } } }
% 中文标签tl常量定义函数
\cs_new_protected:Npn \__nwafu_define_label:nn #1#2
  { \tl_const:cn { c__nwafu_label_ #1 _tl } { #2 } }
% 中英文标签tl常量定义函数
\cs_new_protected:Npn \__nwafu_define_label:nnn #1#2#3
  {
    \tl_const:cn { c__nwafu_label_ #1    _tl } { #2 }
    \tl_const:cn { c__nwafu_label_ #1 _en_tl } { #3 }
  }
% 记录用户配置文件的全局变量
\tl_new:N \g__nwafu_config_file_tl

% 各种输出信息函数的缩略形式
\cs_new:Npn \__nwafu_msg_new:nn  { \msg_new:nnn      { nwafupaper } }
\cs_new:Npn \__nwafu_error:n     { \msg_error:nn     { nwafupaper } }
\cs_new:Npn \__nwafu_error:nn    { \msg_error:nnn    { nwafupaper } }
\cs_new:Npn \__nwafu_error:nx    { \msg_error:nnx    { nwafupaper } }
\cs_new:Npn \__nwafu_error:nnn   { \msg_error:nnnn   { nwafupaper } }
\cs_new:Npn \__nwafu_error:nnnn  { \msg_error:nnnnn  { nwafupaper } }
\cs_new:Npn \__nwafu_warning:n   { \msg_warning:nn   { nwafupaper } }
\cs_new:Npn \__nwafu_warning:nn  { \msg_warning:nnn  { nwafupaper } }
\cs_new:Npn \__nwafu_warning:nxx { \msg_warning:nnxx { nwafupaper } }
\cs_new:Npn \__nwafu_info:nx     { \msg_info:nnx     { nwafupaper } }

%% ===================================================================
%% nwafupaper选项处理
%% ===================================================================
\keys_define:nn { nwafu / option }
  {
    % 类型：
    %   1. 设计，基于ctexart实现，章节最高级别为\section（节）
    %   2. 论文，基于ctexart实现，章节最高级别为\section（节）
    %   3. 报告，基于ctexbook实现，章节最高级别为\part（部分），实际用到\chaper（章）
    type .choice:,
    type .value_required:n = true,
    type .choices:nn = { 设计, 论文, 报告 }
      { \int_gset_eq:NN \g__nwafu_paper_type_int \l_keys_choice_int },
    type .initial:n = 报告,

    % 单双面选择
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n =
      {
        \clist_gput_right:Nn \g__nwafu_to_ctexart_clist { oneside }
        \bool_gset_false:N   \g__nwafu_twoside_bool
      },
    twoside .code:n =
      {
        \clist_gput_right:Nn \g__nwafu_to_ctexart_clist { twoside }
        \bool_gset_true:N    \g__nwafu_twoside_bool
      },

    % 草稿模式选择
    draft .choice:,
    draft / true  .code:n =
      {
        \bool_gset_true:N     \g__nwafu_draft_bool
        \clist_gput_right:Nn \g__nwafu_to_ctexart_clist { draft }
      },
    draft / false .code:n =
      { \bool_gset_false:N    \g__nwafu_draft_bool },
    draft .default:n = true,
    draft .initial:n = false,

    % 配置文件
    cfg-file .tl_gset:N  = \g__nwafu_config_file_tl,
    cfg-file .initial:n = {},
    cfg-file .default:n = {},

    % 未知选项
    unknown .code:n = { \__nwafu_error:n { unknown-option } }
  }

% 未知选项处理函数
\__nwafu_msg_new:nn { unknown-option }
  { Class~ option~ "\l_keys_key_tl"~ is~ unknown. }

% 处理{nwafu / option}选项
\ProcessKeysOptions { nwafu / option }

%% ===================================================================
%% 部分常量定义
%% ===================================================================
% 常用标点符号常量
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

% 将"。"设置为活动符，并定义为句点"."
\cs_new:Npn \__nwafu_set_fullwidth_stop_catcode:
  {
    \char_set_active_eq:NN "3002 \c__nwafu_fwid_full_stop_tl
    \char_set_catcode_active:N "3002
    \clist_map_inline:nn
      { \c__nwafu_orig_decl_text_tl, \c__nwafu_auth_decl_text_tl }
      { \tl_set_rescan:Nno ##1 { } { ##1 } }
  }

% 行距倍数，行距倍数k由下式确定：
%           1.2 * k * 12bp = 20pt
% 式中，1.2是基本行距与文字大小之比，12bp是小四号字的大小，20pt是行距固定值
\fp_const:Nn \c__nwafu_line_spread_fp
  { \dim_ratio:nn { 20 pt } { 12 bp } / 1.2 }

% 定理类标题中英文名称常量
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
  { \__nwafu_define_label:nnn #1 }

%% ===================================================================
%% 文档类选项
%% ===================================================================
% 将选项传入ctex宏集文档类。目前，nwafupaper使用ctexbook/ctexart为基础文档类
\int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
  {
    % 实习报告，基于ctexbook实现
    \PassOptionsToClass
      {
        heading    = true,
        fontset    = none,
        zihao      = -4,
        linespread = \c__nwafu_line_spread_fp,
        \g__nwafu_to_ctexart_clist
      } { ctexbook }
    % 载入ctexbook文档类
    \LoadClass { ctexbook }
  }
  {
    % 论文/设计，基于ctexbook实现
    \PassOptionsToClass
      {
        heading    = true,
        fontset    = none,
        zihao      = -4,
        linespread = \c__nwafu_line_spread_fp,
        \g__nwafu_to_ctexart_clist
      } { ctexart }
    % 载入ctexart文档类
    \LoadClass { ctexart }
  }

%% ===================================================================
%% 其它宏包及其选项
%% ===================================================================
% 为其它宏包传入必要选项
\clist_map_inline:nn
  {
    { shortlabels       } { enumitem  },
    { no-math           } { fontspec  },
    { perpage           } { footmisc  },
    { amsmath, thmmarks } { ntheorem  },
  }
  { \PassOptionsToPackage #1 }

% 载入需要的宏包，其中，amsmath必须在unicode-math之前引入
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
    tabularray,
    booktabs,
    xcolor,
    zhnumber,
  }

% 过时宏包检查函数
\cs_new_protected:Npn \__nwafu_check_package:nnn #1#2#3
  {
    \@ifpackagelater { #1 } { #2 }
      { } { \__nwafu_error:nnnn { package-too-old } { Package } { #1 } { #3 } }
  }
\cs_new_protected:Npn \__nwafu_check_class:nnn #1#2#3
  {
    \@ifclasslater { #1 } { #2 }
      { } { \__nwafu_error:nnnn { package-too-old } { Class } { #1 } { #3 } }
  }
\__nwafu_msg_new:nn { package-too-old }
  {
    #1~ "#2"~ is~ too~ old. \\
    The~ nwafupaper~ class~ only~ supports~ "#2" \\
    with~ a~ version~ higher~ than~ v#3. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ it \\
    using~ your~ TeX~ package~ manager~ or~ from~ CTAN.
  }

\int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
  { \__nwafu_check_class:nnn { ctexbook } { 2021/03/14 } { 2.5.6 } }
  { \__nwafu_check_class:nnn { ctexart } { 2021/03/14 } { 2.5.6 } }
\sys_if_engine_xetex:T
  { \__nwafu_check_package:nnn { xeCJK } { 2020/05/01 } { 3.8.3 } }

%% ===================================================================
%% 字体检查与设置
%% ===================================================================
% 西文字体设置，来源于fontspec和unicode-math
\cs_new_protected:Npn \__nwafu_setmainfont:nn #1#2
  { \__fontspec_main_setmainfont:nn { #2 } { #1 } }
\cs_new_protected:Npn \__nwafu_setsansfont:nn #1#2
  { \__fontspec_main_setsansfont:nn { #2 } { #1 } }
\cs_new_protected:Npn \__nwafu_setmonofont:nn #1#2
  { \__fontspec_main_setmonofont:nn { #2 } { #1 } }
\cs_new_protected:Npn \__nwafu_setmathfont:nn #1#2
  { \__um_setmathfont:nn { #2 } { #1 } }
% 西文字体设置函数变体
\cs_generate_variant:Nn \__nwafu_setmainfont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setsansfont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setmonofont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setmathfont:nn { xx }

% 中文字体设置，来源于xeCJK和CTeX宏集
\cs_new_protected:Npn \__nwafu_setCJKmainfont:nn #1#2
  { \__nwafu_set_family:xnn { \CJKrmdefault } { #2 } { #1 } }
\cs_new_protected:Npn \__nwafu_setCJKsansfont:nn #1#2
  { \__nwafu_set_family:xnn { \CJKsfdefault } { #2 } { #1 } }
\cs_new_protected:Npn \__nwafu_setCJKmonofont:nn #1#2
  { \__nwafu_set_family:xnn { \CJKttdefault } { #2 } { #1 } }
% 中文字体设置函数变体
\cs_generate_variant:Nn \__nwafu_setCJKmainfont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setCJKsansfont:nn { xx }
\cs_generate_variant:Nn \__nwafu_setCJKmonofont:nn { xx }

% 中文黑体需要单独设置
\cs_new_protected:Npn \__nwafu_set_cjk_font_hei:nn #1#2
  { \__nwafu_set_family:nnn { nwafu@hei } { #2 } { #1 } }
\cs_generate_variant:Nn \__nwafu_set_cjk_font_hei:nn { xx }
\cs_new_protected:Npn \nwafu@hei
  { \__nwafu_switch_family:n { nwafu@hei } }

% 中文楷体需要单独设置
\cs_new_protected:Npn \__nwafu_set_cjk_font_kai:nn #1#2
  { \__nwafu_set_family:nnn { nwafu@kai } { #2 } { #1 } }
\cs_generate_variant:Nn \__nwafu_set_cjk_font_kai:nn { xx }
\cs_new_protected:Npn \nwafu@kai
  { \__nwafu_switch_family:n { nwafu@kai } }

% 将中文bold、italic和bold italic统一按roman设置
\tl_const:Nn \__nwafu_cjk_font_options:
 { UprightFont = *, ItalicFont = *, AutoFakeBold = true }

% 设置中文黑体时不启用伪粗体
\tl_const:Nn \__nwafu_cjk_font_hei_options:
 { UprightFont = *, ItalicFont = *, AutoFakeBold = false }
% 设置中文常规字体(衬线字体)
\cs_new_protected:Npx \__nwafu_setCJKmainfont:n   #1
  { \__nwafu_setCJKmainfont:nn   { #1 } { \__nwafu_cjk_font_options: } }
% 设置中文无衬线字体
\cs_new_protected:Npx \__nwafu_setCJKsansfont:n   #1
  { \__nwafu_setCJKsansfont:nn   { #1 } { \__nwafu_cjk_font_hei_options: } }
% 设置中文等宽字体
\cs_new_protected:Npx \__nwafu_setCJKmonofont:n   #1
  { \__nwafu_setCJKmonofont:nn   { #1 } { \__nwafu_cjk_font_options: } }
% 设置中文黑体
\cs_new_protected:Npx \__nwafu_set_cjk_font_hei:n #1
  { \__nwafu_set_cjk_font_hei:nn { #1 } { \__nwafu_cjk_font_hei_options: } }
% 设置中文揩体
\cs_new_protected:Npx \__nwafu_set_cjk_font_kai:n #1
  { \__nwafu_set_cjk_font_kai:nn { #1 } { \__nwafu_cjk_font_options: } }
% 封装CJK字体族设置和切换命令
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

% 重新定义字体选择命令
\cs_new_protected:Npn \__nwafu_set_font_helper:n #1
  {
    \exp_args:Nc \RenewDocumentCommand { set #1 font } { O { } m O { } }
      {
        \ctex_at_end_preamble:n
          { \use:c { __nwafu_set #1 font:nn } { ##2 } { ##1, ##3 } }
      }
  }
% 执行字体选择命令
\clist_map_inline:nn { main, sans, mono, math    } { \__nwafu_set_font_helper:n { #1 } }
\clist_map_inline:nn { CJKmain, CJKsans, CJKmono } { \__nwafu_set_font_helper:n { #1 } }

% 字体配置变量
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

% 设置字体配置变量
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

%% ===================================================================
%% 西文字体配置驱动数据列表
%% 格式：{<字体族>}{<字体名称>}{<字体选项>}
%% 字体族：main, sans, mono, math
%% ===================================================================
% EB Garamond系列，数学粗体用伪粗体实现
\clist_const:Nn \c__nwafu_font_garamond_clist
  {
    { main } { EBGaramond }
      { Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Italic,
        BoldItalicFont = *-BoldItalic },
    { sans } { \g__nwafu_font_family_libertinus_sans_tl }
      { Extension      = .otf,
        UprightFont    = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfsl_tl },
    { mono } { lmmonolt10 }
      { Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique },
    { math } { Garamond-Math.otf }
      { BoldFont = Garamond-Math.otf,
        BoldFeatures = { FakeBold = 1.6 } }
  }
% Libertinus系列，数学粗体用伪粗体实现
\clist_const:Nn \c__nwafu_font_libertinus_clist
  {
    { main } { \g__nwafu_font_family_libertinus_serif_tl }
      { Extension      = .otf,
        UprightFont    = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfit_tl },
    { sans } { \g__nwafu_font_family_libertinus_sans_tl }
      { Extension      = .otf,
        UprightFont    = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfsl_tl },
    { mono } { lmmonolt10 }
      { Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique },
    { math } { \g__nwafu_font_name_libertinus_math_tl .otf }
      { BoldFont = \g__nwafu_font_name_libertinus_math_tl .otf,
        BoldFeatures = { FakeBold = 1.6 } }
  }
% Latin Modern系列，XeLaTeX和LuaLaTeX已默认，仅作数学字体，数学粗体用伪粗体实现
\clist_const:Nn \c__nwafu_font_lm_clist
  {
    { math } { latinmodern-math.otf }
      {BoldFont           = latinmodern-math.otf,
       BoldFeatures       = { RawFeature = { embolden = 3 } },
       BoldItalicFont     = latinmodern-math.otf,
       BoldItalicFeatures = { RawFeature = { embolden = 3 } }}
  }
% Palatino系列，数学粗体用伪粗体实现
\clist_const:Nn \c__nwafu_font_palatino_clist
  {
    { main } { texgyrepagella }
      { Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic },
    { sans } { \g__nwafu_font_family_libertinus_sans_tl }
      { Extension      = .otf,
        UprightFont    = *-\g__nwafu_font_style_libertinus_rm_tl,
        BoldFont       = *-\g__nwafu_font_style_libertinus_bf_tl,
        ItalicFont     = *-\g__nwafu_font_style_libertinus_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_libertinus_bfsl_tl,
        Scale = MatchUppercase },
    { mono } { lmmonolt10 }
      { Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique },
    { math } { texgyrepagella-math.otf }
      { BoldFont = texgyrepagella-math.otf,
        BoldFeatures = { FakeBold = 1.6 } }
  }
% Times系列
\clist_const:Nn \c__nwafu_font_times_clist
  {
    { main } { \g__nwafu_font_family_xits_tl }
      { Extension      = .otf,
        UprightFont    = *-\g__nwafu_font_style_xits_rm_tl,
        BoldFont       = *-\g__nwafu_font_style_xits_bf_tl,
        ItalicFont     = *-\g__nwafu_font_style_xits_it_tl,
        BoldItalicFont = *-\g__nwafu_font_style_xits_bfit_tl },
    { sans } { texgyreheros }
      { Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic },
    { mono } { texgyrecursor }
      { Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic,
        Ligatures = CommonOff },
    { math } { \g__nwafu_font_name_xits_math_rm_tl .otf }
      { BoldFont = \g__nwafu_font_name_xits_math_bf_tl .otf }
  }
% Times*系列
\clist_const:Nn \c__nwafu_font_times_asterisk_clist
  {
    { main } { Times~ New~ Roman } { },
    { sans } { Arial } { },
    { mono } { Courier~ New } { },
    { math } { \g__nwafu_font_name_xits_math_rm_tl .otf }
      { BoldFont = \g__nwafu_font_name_xits_math_bf_tl .otf }
  }

% 通用西文字体加载函数
\cs_new_protected:Npn \__nwafu_load_font_by_family:nn #1#2
  {
    \str_case:nnF { #1 }
      {
        { main } { \__nwafu_setmainfont:xx { #2 } { \l__nwafu_tmpa_tl } }
        { sans } { \__nwafu_setsansfont:xx { #2 } { \l__nwafu_tmpa_tl } }
        { mono } { \__nwafu_setmonofont:xx { #2 } { \l__nwafu_tmpa_tl } }
        { math } { \__nwafu_setmathfont:xx { #2 } { \l__nwafu_tmpa_tl } }
      }
      { \msg_error:nnn { nwafupaper } { unknown-font-family } { #1 } }
  }
\cs_new_protected:Npn \__nwafu_load_font_by_family:nnn #1#2#3
  {
    \tl_set:Nx \l__nwafu_tmpa_tl { #3 }
    \__nwafu_load_font_by_family:nn { #1 } { #2 }
  }

% 报错处理
\msg_new:nnn { nwafupaper } { unknown-font-family }
  { Unknown~ font~ family~ "#1". }

% 批量西文字体加载函数
\cs_new_protected:Npn \__nwafu_load_fontset:n #1
  {
    \clist_map_inline:cn { c__nwafu_font_ #1 _clist }
      {
        \__nwafu_load_font_by_family:nnn ##1
      }
  }
\cs_generate_variant:Nn \__nwafu_load_fontset:n { V }

%% ===================================================================
%% 中文字体配置驱动数据列表
%% 格式：{<字体族>}{<字体名称>}{<字体选项>}
%% 字体族：main, sans, mono, hei, hai
%% ===================================================================
% Adoble字体
\clist_const:Nn \c__nwafu_cjk_font_adobe_clist
  {
    { main } { AdobeSongStd-Light       } { },
    { sans } { AdobeHeitiStd-Regular    } { },
    { mono } { AdobeFangsongStd-Regular } { },
    { hei  } { AdobeHeitiStd-Regular    } { },
    { kai  } { AdobeKaitiStd-Regular    } { }
  }
% fandol字体
\clist_const:Nn \c__nwafu_cjk_font_fandol_clist
  {
    { main } { FandolSong }
      { Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold },
    { sans } { FandolHei }
      { Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold },
    { mono } { FandolFang }
      { Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular },
    { hei  } { FandolHei }
      { Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold },
    { kai  } { FandolKai }
      { Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular }
  }
% 方正字体，方正字体有粗体(方正小标宋等)，但并非免费，故不作处理
\clist_const:Nn \c__nwafu_cjk_font_founder_clist
  {
    { main } { FZShuSong-Z01  } { },
    { sans } { FZHei-B01      } { },
    { mono } { FZFangSong-Z02 } { },
    { hei  } { FZHei-B01      } { },
    { kai  } { FZKai-Z03      } { }
  }
% macOS自带中文字体
\clist_const:Nn \c__nwafu_cjk_font_mac_clist
  {
    { main } { STSongti-SC }
      { UprightFont    = *-Light,
        BoldFont       = *-Bold,
        ItalicFont     = *-Light,
        BoldItalicFont = *-Bold },
    { sans } { STHeitiSC }
      { UprightFont    = *-Medium,
        BoldFont       = *-Medium,
        ItalicFont     = *-Medium,
        BoldItalicFont = *-Medium },
    { mono } { STFangsong }  { },
    { hei  } { STHeitiSC }
      { UprightFont    = *-Medium,
        BoldFont       = *-Medium,
        ItalicFont     = *-Medium,
        BoldItalicFont = *-Medium },
    { kai  } { STKaitiSC }
      { UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold }
  }
% 华文字体
\clist_const:Nn \c__nwafu_cjk_font_sinotype_clist
  {
    { main } { STSong     } { },
    { sans } { STHeiti    } { },
    { mono } { STFangsong } { },
    { hei  } { STHeiti    } { },
    { kai  } { STKaiti    } { }
  }
% 思源字体，无楷体和仿宋，直接给出警告
\clist_const:Nn \c__nwafu_cjk_font_sourcehan_clist
  {
    { main } { Source~ Han~ Serif~ SC }
      { UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold },
    { sans } { Source~ Han~ Sans~ SC }
      { UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold }
  }
% Windows自带中文字体
\clist_const:Nn \c__nwafu_cjk_font_windows_clist
  {
    { main } { SimSun   } { },
    { sans } { SimHei   } { },
    { mono } { FangSong } { },
    { hei  } { SimHei   } { },
    { kai  } { KaiTi    } { }
  }

% 通用中文字体加载函数
\cs_new_protected:Npn \__nwafu_load_cjk_font_by_family:nn #1#2
  {
    \str_case:nnF { #1 }
      {
        { main } { \__nwafu_setCJKmainfont:xx   { #2 } { \__nwafu_cjk_font_options:     } }
        { sans } { \__nwafu_setCJKsansfont:xx   { #2 } { \__nwafu_cjk_font_hei_options: } }
        { mono } { \__nwafu_setCJKmonofont:xx   { #2 } { \__nwafu_cjk_font_options:     } }
        { hei  } { \__nwafu_set_cjk_font_hei:xx { #2 } { \__nwafu_cjk_font_hei_options: } }
        { kai  } { \__nwafu_set_cjk_font_kai:xx { #2 } { \__nwafu_cjk_font_options:     } }
      }
      { \msg_error:nnn { nwafupaper } { unknown-cjk-family } { #1 } }
  }
\cs_new_protected:Npn \__nwafu_load_cjk_font_by_family:nnn #1#2#3
  {
    \__nwafu_load_cjk_font_by_family:nn { #1 } { #2 }
  }

% 报错
\msg_new:nnn { nwafupaper } { unknown-cjk-family }
  { Unknown~ CJK~ font~ family~ "#1". }

% 批量字体加载函数
\cs_new_protected:Npn \__nwafu_load_cjk_fontset:n #1
  {
    \clist_map_inline:cn { c__nwafu_cjk_font_ #1 _clist }
      {
        \__nwafu_load_cjk_font_by_family:nnn ##1
      }
    \str_if_eq:nnT { #1 } { sourcehan }
      { \__nwafu_warning:n { source-han } }
  }
\cs_generate_variant:Nn \__nwafu_load_cjk_fontset:n { V }

% 探测操作系统，进行字体环境检查，根据实际设置字体选择变量值
\tl_new:N \l__nwafu_font_tl
\tl_new:N \l__nwafu_cjkfont_tl
\cs_new_protected:Npn \__nwafu_detect_platform:
  {
    \sys_if_platform_windows:TF
      {
        % Windows平台
        \tl_set:Nn \l__nwafu_cjkfont_tl { windows }
        \tl_set:Nn \l__nwafu_font_tl    { times*  }
      }
      {
        \__nwafu_if_platform_macos:TF
          {
            % macOS平台
            \tl_set:Nn \l__nwafu_cjkfont_tl { mac    }
            \tl_set:Nn \l__nwafu_font_tl    { times* }
          }{
            % Linux平台
            \tl_set:Nn \l__nwafu_cjkfont_tl { fandol }
            \tl_set:Nn \l__nwafu_font_tl    { times  }
          }
      }
  }
% macOS平台探测函数
\cs_new_protected:Npn \__nwafu_if_platform_macos:TF
  { \file_if_exist:nTF { /System/Library/Fonts/Menlo.ttc } }

% 加载字体
\cs_new_protected:Npn \__nwafu_load_font:
  {
    \tl_if_empty:NT \g__nwafu_fontset_tl
      {
        % 未设置英文字体，根据平台选择
        \__nwafu_detect_platform:
        \tl_gset_eq:NN \g__nwafu_fontset_tl \l__nwafu_font_tl
      }
    \tl_if_empty:NT \g__nwafu_cjk_fontset_tl
      {
        % 未设置中文字体，根据平台选择
        \__nwafu_detect_platform:
        \tl_gset_eq:NN \g__nwafu_cjk_fontset_tl \l__nwafu_cjkfont_tl
      }
    \tl_set_eq:NN \l__nwafu_tmpa_tl { \g__nwafu_fontset_tl }
    \tl_if_eq:VnTF \l__nwafu_tmpa_tl { none }
      { } % none 表示用户自行配置，跳过
      {
        % 处理times*选项中的星号
        \tl_replace_all:Nnn \l__nwafu_tmpa_tl { * } { _asterisk }
        % 加载西文字体
        \__nwafu_load_fontset:V \l__nwafu_tmpa_tl
      }
    \tl_set_eq:NN \l__nwafu_tmpa_tl \g__nwafu_cjk_fontset_tl
    \tl_if_eq:VnTF \l__nwafu_tmpa_tl { none }
      { }  % none 表示用户自行配置，跳过
      {
        % 加载中文字体
        \__nwafu_load_cjk_fontset:n { \g__nwafu_cjk_fontset_tl }
      }
  }

% 数学字体设置
\keys_set:nn { unicode-math }
  {
    math-style = ISO,
    bold-style = ISO,
  }

%% ===================================================================
%% 脚注设置
%% ===================================================================
% 脚注样式常量名称定义
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
  }{ \__nwafu_define_fn_style:nn #1 }

% libertinus普通版：1-20为数字，21-46为小字英文字母，47-72为大写英文字母
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
% libertinus阴文衬线版：只含1-20数字
\cs_new:Npn \__nwafu_fn_symbol_libertinus_neg:n #1
  {
    \int_compare:nTF { #1 >= 11 }
      { \__nwafu_symbol:n { \int_eval:n { "24EB - 11 + #1 } } }
      { \__nwafu_symbol:n { \int_eval:n { "2776 -  1 + #1 } } }
  }
% libertinus阳文无衬线版：与普通版相同
\cs_new_eq:NN \__nwafu_fn_symbol_libertinus_sans:n \__nwafu_fn_symbol_libertinus:n

% pifont普通版，以下四种都只包含1-10
\cs_new:Npn \__nwafu_fn_symbol_pifont:n #1
  { \ding { \int_eval:n { 171 + #1 } } }
% pifont阴文衬线版
\cs_new:Npn \__nwafu_fn_symbol_pifont_neg:n #1
  { \ding { \int_eval:n { 181 + #1 } } }
% pifont阳文无衬线版
\cs_new:Npn \__nwafu_fn_symbol_pifont_sans:n #1
  { \ding { \int_eval:n { 191 + #1 } } }
% pifont阴文无衬线版
\cs_new:Npn \__nwafu_fn_symbol_pifont_sans_neg:n #1
  { \ding { \int_eval:n { 201 + #1 } } }

% xits普通版：1-9为数字，10-35为小写英文字母，36-61为大写英文字母
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
% xits阳文衬线版：只包含1-10数字
\cs_new:Npn \__nwafu_fn_symbol_xits_sans:n #1
  { \__nwafu_symbol:n { \int_eval:n { "2780 - 1 + #1 } } }
% xits阴文无衬线版：只包含1-10数字
\cs_new:Npn \__nwafu_fn_symbol_xits_sans_neg:n #1
  { \__nwafu_symbol:n { \int_eval:n { "278A - 1 + #1 } } }

% pifont带圈数字普通版，只包含1-10带圈数字，超过10用普通数字
\cs_new:Npn \__nwafu_fn_symbol_circled:n #1
  {
    \int_compare:nTF { #1 > 10 }
      { \@arabic{ #1 } }
      { \ding { \int_eval:n { 171 + #1 } } }
  }
% pifont带圈数字阴文衬线版，只包含1-10带圈数字，超过10用普通数字
\cs_new:Npn \__nwafu_fn_symbol_circled_neg:n #1
  {
    \int_compare:nTF { #1 > 10 }
      { \@arabic{ #1 } }
      { \ding { \int_eval:n { 181 + #1 } } }
  }
% pifont带圈数字阳文无衬线版，只包含1-10带圈数字，超过10用普通数字
\cs_new:Npn \__nwafu_fn_symbol_circled_sans:n #1
  {
    \int_compare:nTF { #1 > 10 }
      { \@arabic{ #1 } }
      { \ding { \int_eval:n { 191 + #1 } } }
  }
% pifont带圈数字阴文无衬线版，只包含1-10带圈数字，超过10用普通数字
\cs_new:Npn \__nwafu_fn_symbol_circled_sans_neg:n #1
  {
    \int_compare:nTF { #1 > 10 }
      { \@arabic{ #1 } }
      { \ding { \int_eval:n { 201 + #1 } } }
  }

% 重定义脚注编号
\cs_set:Npn \thefootnote { \nwafu_footnote_number:N \c@footnote }
% 脚注编号样式设置
\cs_new:Npn \nwafu_footnote_number:N #1
  {
    \tl_case:NnF \l__nwafu_fn_style_tl
      {
        \c__nwafu_fn_style_plain_tl { \int_use:N #1 }

        \c__nwafu_fn_style_libertinus_tl
          {
            \fontspec { \g__nwafu_font_name_libertinus_serif_tl .otf }
            \__nwafu_fn_symbol_libertinus:n { #1 }
          }
        \c__nwafu_fn_style_libertinus_neg_tl
          {
            \fontspec { \g__nwafu_font_name_libertinus_serif_tl .otf }
            \__nwafu_fn_symbol_libertinus_neg:n { #1 }
          }
        \c__nwafu_fn_style_libertinus_sans_tl
          {
            \fontspec { \g__nwafu_font_name_libertinus_sans_tl .otf }
            \__nwafu_fn_symbol_libertinus_sans:n { #1 }
          }

        \c__nwafu_fn_style_pifont_tl           { \__nwafu_fn_symbol_pifont:n           { #1 } }
        \c__nwafu_fn_style_pifont_neg_tl       { \__nwafu_fn_symbol_pifont_neg:n       { #1 } }
        \c__nwafu_fn_style_pifont_sans_tl      { \__nwafu_fn_symbol_pifont_sans:n      { #1 } }
        \c__nwafu_fn_style_pifont_sans_neg_tl  { \__nwafu_fn_symbol_pifont_sans_neg:n  { #1 } }

        \c__nwafu_fn_style_circled_tl          { \__nwafu_fn_symbol_circled:n          { #1 } }
        \c__nwafu_fn_style_circled_neg_tl      { \__nwafu_fn_symbol_circled_neg:n      { #1 } }
        \c__nwafu_fn_style_circled_sans_tl     { \__nwafu_fn_symbol_circled_sans:n     { #1 } }
        \c__nwafu_fn_style_circled_sans_neg_tl { \__nwafu_fn_symbol_circled_sans_neg:n { #1 } }

        \c__nwafu_fn_style_xits_tl
          {
            \fontspec { \g__nwafu_font_name_xits_tl .otf }
            \__nwafu_fn_symbol_xits:n { #1 }
          }
        \c__nwafu_fn_style_xits_sans_tl
          {
            \fontspec { \g__nwafu_font_name_xits_tl .otf }
            \__nwafu_fn_symbol_xits_sans:n { #1 }
          }
        \c__nwafu_fn_style_xits_sans_neg_tl
          {
            \fontspec { \g__nwafu_font_name_xits_tl .otf }
            \__nwafu_fn_symbol_xits_sans_neg:n { #1 }
          }
      }
      { \int_use:N #1 } % 默认使用plain类型
  }

% 重定义内部脚注文字，使脚注编号不使用上标，宽度为1.5em
\cs_set:Npn \@makefntext #1
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { 1.5 em } { \@thefnmark \hfil }
    #1
  }

%% ===================================================================
%% 定理环境
%% ===================================================================
% 定理样式名称列表
\clist_const:Nn \c__nwafu_thm_style_plain_clist { plain, margin, change }
\clist_const:Nn \c__nwafu_thm_style_break_clist { break, marginbreak, changebreak }

% 复制ntheorem命令
\cs_new_eq:NN \__nwafu_thm_ntheorem_style:n \theoremstyle
\cs_new_eq:NN \__nwafu_thm_ntheorem_new:w   \newtheorem

% 定理类设置需要的变量
\tl_new:N \l__nwafu_thm_style_tl
\tl_new:N \l__nwafu_thm_header_font_tl
\tl_new:N \l__nwafu_thm_body_font_tl
\tl_new:N \l__nwafu_thm_qed_tl
\tl_new:N \l__nwafu_thm_counter_tl

% 重定义\newtheorem命令
\RenewDocumentCommand \newtheorem { s o m m }
  {
    % 证毕符号定义
    \IfBooleanTF { #1 }
      { \tl_set:Nn \l__nwafu_thm_qed_tl { \ensuremath { \QED } } }
      { \tl_set:Nn \l__nwafu_thm_qed_tl { } }

    % 设置默认样式为 plain
    \tl_set:Nn \l__nwafu_thm_style_tl { plain }

    % 处理可选参数
    \IfValueT {#2} { \keys_set:nn { nwafu / theorem } { #2 } }

    % 设置定理头字体
    \nwafu_thm_set_header_font:V \l__nwafu_thm_header_font_tl
    % 设置定理正文字体
    \nwafu_thm_set_body_font:V   \l__nwafu_thm_body_font_tl
    % 设置证毕符号
    \nwafu_thm_set_qed:V         \l__nwafu_thm_qed_tl

    % \newtheorem 负责创建编号定理，而 \newtheorem* 则负责创建无编号定理
    \IfBooleanTF { #1 }
      {
        % 带 * 的版本原则上只接受 plain 和 break 两种样式，其余样式将被转换成这两者其中之一。
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
        % ntheorem 宏包提供的无编号定理带有 nonumber 前缀
        \tl_put_left:Nn \l__nwafu_thm_style_tl { nonumber }
        \nwafu_thm_new_no_number:Vxx \l__nwafu_thm_style_tl { #3 } { #4 }
      }
      {
        % 不带 * 的版本支持不含“nonumber”的所有定理样式。
        \clist_clear:N \l__nwafu_tmpa_clist
        \clist_concat:NNN \l__nwafu_tmpa_clist
          \c__nwafu_thm_style_plain_clist \c__nwafu_thm_style_break_clist
        \clist_if_in:NVF \l__nwafu_tmpa_clist \l__nwafu_thm_style_tl
          {
            \__nwafu_error:nx { unknown-theorem-style }
              { \l__nwafu_thm_style_tl }
          }
        \nwafu_thm_new:VVxx \l__nwafu_thm_style_tl \l__nwafu_thm_counter_tl { #3 } { #4 }
      }
  }
% 重定义定理样式，并给出警告
\cs_new:Npn \__nwafu_thm_redefine_style:n #1
  {
    \__nwafu_warning:nxx { redefine-theorem-style }
      { #1 } { \l__nwafu_thm_style_tl }
    \tl_set:Nn \l__nwafu_thm_style_tl { #1 }
  }
\__nwafu_msg_new:nn { redefine-theorem-style }
  { Theorem~ style~ "#2"~ will~ be~ redefined~ as~ "#1". }
\__nwafu_msg_new:nn { unknown-theorem-style }
  { Theorem~ style~ "#1"~ is~ unknown. }

% 带编号的定理环境
%   #1: 样式
%   #2: 计数器
%   #3: 定理环境名称
%   #4: 定理头文字
\cs_new:Npn \nwafu_thm_new:nnnn #1#2#3#4
  {
    \__nwafu_thm_ntheorem_style:n { #1 }
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % 报告基于ctexbook类，按章进行编号
        \__nwafu_thm_ntheorem_new:w   { #3 } { #4 } [ #2 ]
      }
      {
        % 论文和设计基于ctexart类，全文统一编号
        \__nwafu_thm_ntheorem_new:w   { #3 } { #4 }
      }
  }
\cs_generate_variant:Nn \nwafu_thm_new:nnnn { VVxx }

% 不带编号的定理环境
%   #1: 样式
%   #2: 定理环境名称
%   #3: 定理头文字
\cs_new:Npn \nwafu_thm_new_no_number:nnn #1#2#3
  {
    \__nwafu_thm_ntheorem_style:n { #1 }
    \__nwafu_thm_ntheorem_new:w   { #2 } { #3 }
  }
\cs_generate_variant:Nn \nwafu_thm_new_no_number:nnn { Vxx }

%% 封装 ntheorem 宏包提供的若干命令，
% 证毕符号、
\cs_new:Npn \nwafu_thm_set_qed:n         #1 { \theoremsymbol     { #1 } }
\cs_generate_variant:Nn \nwafu_thm_set_qed:n         { V }
% 定理头字体
\cs_new:Npn \nwafu_thm_set_header_font:n #1 { \theoremheaderfont { #1 } }
\cs_generate_variant:Nn \nwafu_thm_set_header_font:n { V }
% 定理正文字体
\cs_new:Npn \nwafu_thm_set_body_font:n   #1 { \theorembodyfont   { #1 } }
\cs_generate_variant:Nn \nwafu_thm_set_body_font:n   { V }

% 重定义公式编号
\cs_set:Npn \theequation
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        \thechapter - \__nwafu_arabic:n { equation }
      }
      {
        \__nwafu_arabic:n { equation }
      }
  }

%% ===================================================================
%% 本模板使用 xtemplate 提供的面向对象方法绘制封面。
%%
%% 模板分别从页面元素(element)和页面整体(page)的层次进行了抽象。
%% 当把页面部件作为一个对象时，则页面部件只具备有限数量的属性：
%% 内容、格式、边距、对齐方式等。而具体页面是这些对象的实例的集合，
%% 附加边距、行距等属性。通过 xtemplate 提供的功能，可以
%% 根据这些属性创建模板(template)，进而能大量构建具有相似行为
%% 的实例(instance)。
%% ===================================================================
% 声明对象类型，此类对象均不需要带参数。
\DeclareObjectType { nwafu } { \c_zero_int }

% 声明页面元素模板接口。
% 页面元素是一个页面的基本组成单位，包括文字段落、插图等等。
% 一个抽象的元素应当具备以下属性：
%  content:     内容，即剥离了样式的元素本身
%  format:      格式，例如字号、字体、行距等
%  bottom-skip: 底边距，即与下一个元素的垂直距离
%  align:       对齐方式，包括左对齐、右对齐、居中、正常段落
\DeclareTemplateInterface { nwafu } { element } { \c_zero_int }
  {
    content     : tokenlist = \c_empty_tl,
    format      : tokenlist = \c_empty_tl,
    bottom-skip : skip      = \c_zero_skip,
    align       : choice { left, right, center, normal } = normal
  }
% 声明页面元素模板代码，涉及的变量将被自动创建。
\DeclareTemplateCode { nwafu } { element } { \c_zero_int }
  {
    content     = \l__nwafu_elem_content_tl,
    format      = \l__nwafu_elem_format_tl,
    bottom-skip = \l__nwafu_elem_bottom_skip,
    align =
      {
        left = % 左对齐
          { \tl_set_eq:NN \l__nwafu_elem_begin_align_tl \flushleft
            \tl_set_eq:NN \l__nwafu_elem_end_align_tl   \endflushleft  },
        right = % 右对齐
          { \tl_set_eq:NN \l__nwafu_elem_begin_align_tl \flushright
            \tl_set_eq:NN \l__nwafu_elem_end_align_tl   \endflushright },
        center = % 居中对齐
          { \tl_set_eq:NN \l__nwafu_elem_begin_align_tl \center
            \tl_set_eq:NN \l__nwafu_elem_end_align_tl   \endcenter     },
        normal = % 正文对齐方式
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

% 声明页面模板接口。
% 页面是元素的集合。一个抽象的页面应当具备以下属性：
%  content:     内容，包含页面元素模板实例名称的列表
%  prefix:      元素模板实例名称前缀(表示封一、封二等)
%  format:      格式，例如行距
%  top-skip:    上间距，即与页面顶部的距离
%  bottom-skip: 下间距，即与页面底部的距离
\DeclareTemplateInterface { nwafu } { page } { \c_zero_int }
  {
    content     : commalist = \c_empty_clist,
    prefix      : tokenlist = \c_empty_tl,
    format      : tokenlist = \c_empty_tl,
    top-skip    : skip      = \c_zero_skip,
    bottom-skip : skip      = \c_zero_skip
  }
% 声明页面模板代码，涉及的变量将被自动创建。
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

% 封装xtemplate提供的函数，简化创建实例的过程。
%  #1 实例名称
%  #1 参数列表
\cs_new_protected:Npn \__nwafu_declare_element:nn #1#2
  { \DeclareInstance { nwafu } { #1 } { element } { #2 } }
\cs_generate_variant:Nn \__nwafu_declare_element:nn { nx }

\cs_new_protected:Npn \__nwafu_declare_page:nn    #1#2
  { \DeclareInstance { nwafu } { #1 } { page } { #2 } }
\cs_generate_variant:Nn \__nwafu_declare_page:nn { nx }

% 声明一个封面元素
%  #1 封面元素前缀
%  #2 封面元素名称
%  #3 封面元素内容
%  #4 封面元素格式
%  #5 封面元素底部间距
%  #6 封面元素对齐方式
\cs_new_protected:Npn \__nwafu_declare_cover_element:nnnnnn #1#2#3#4#5#6
  {
    \__nwafu_declare_element:nn { #1 / #2 }
      {
        content     = { #3 },
        format      = { #4 },
        bottom-skip = { #5 },
        align       = { #6 }
      }
  }

% 批量声明封面元素
%  #1 封面元素前缀
%  #2 封面元素clist列表
\cs_new_protected:Npn \__nwafu_declare_cover_elements:nn #1#2
  {
    \clist_map_inline:Nn #2
    {
      \__nwafu_declare_cover_element:nnnnnn { #1 } ##1
    }
  }

%% ===================================================================
%% 内容输出例子辅助函数
%% ===================================================================

% 分散对齐的水平盒子
%  #1 宽度
%  #2 内容
% 利用 \tl_map_inline:nn 在字符间插入 \hfil，
% 紧随其后的 \unskip 将会去掉最后一个 \hfil。
% 见 \url{https://tex.stackexchange.com/q/169689}。
% #2 需要完全展开以避免 underfull 警告。
\cs_new_protected:Npn \__nwafu_spread_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { #1 }
      { \tl_map_inline:xn { #2 } { ##1 \hfil } \unskip }
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_spread_box:nn  { Vn }
\cs_generate_variant:Nn \__nwafu_spread_box:nn  { nV }

% 居中对齐的水平盒子
%  #1 宽度
%  #2 内容
\cs_new_protected:Npn \__nwafu_center_box:nn #1#2
  {
    \mode_leave_vertical:
    \dim_set:Nn \l__nwafu_tmpt_dim { #1 }
    \dim_add:Nn \l__nwafu_tmpt_dim { 0.6em }
    \hbox_to_wd:nn { \l__nwafu_tmpt_dim } { \hfil #2 \hfil }
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_center_box:nn  { Vn }

% 居中对齐的下划线水平盒子
%  #1 宽度
%  #2 内容
\cs_new_protected:Npn \__nwafu_center_box_uline:nn #1#2
  {
    \mode_leave_vertical:
    \dim_set:Nn \l__nwafu_tmpt_dim { #1 }
    \dim_add:Nn \l__nwafu_tmpt_dim { 0.6em }
    \makebox[0cm][l]{ \rule[-0.5ex]{ \l__nwafu_tmpt_dim }{ \heavyrulewidth } }
    \hbox_to_wd:nn { \l__nwafu_tmpt_dim } { \hfil #2 \hfil }
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_center_box_uline:nn  { Vn }

% 限宽盒子（允许换行）
%  #1 宽度
%  #2 内容
\cs_new:Npn \__nwafu_fixed_width_box:nn #1#2
  { \parbox { #1 } { #2 } }
% 函数变体
\cs_generate_variant:Nn \__nwafu_fixed_width_box:nn  { Vn }

% 居中对齐的限宽盒子（允许换行）
%  #1 宽度
%  #2 内容
\cs_new:Npn \__nwafu_fixed_width_center_box:nn #1#2
  { \parbox { #1 } { \centering #2 } }

% 带下划线盒子，计算出内容宽度后左右加0.3em后绘制下划线，居中输出
%  #1 内容
\cs_new:Npn \__nwafu_text_uline:n #1
  {
    \__nwafu_get_text_width:Nn \l__nwafu_tmpt_dim { #1 }
    \dim_add:Nn \l__nwafu_tmpt_dim { 0.6em }
    \makebox[0cm][l]{ \rule[-0.5ex]{ \l__nwafu_tmpt_dim }{ \heavyrulewidth } }
      \rule{ .3em }{ 0cm } #1 \rule{ .3em }{ 0cm }
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_text_uline:n { V }

% 空白下划线
%  #1 宽度
\cs_new:Npn \__nwafu_blank_underline:n #1
  { \rule [ -0.5 ex ] { #1 } { \heavyrulewidth } }
% 函数变体
\cs_generate_variant:Nn \__nwafu_blank_underline:n { V }

% 设定输出行距
\cs_new:Npn \__nwafu_line_spread:N #1
  { \linespread { \fp_use:N #1 } \selectfont }
\cs_new:Npn \__nwafu_line_spread:n #1
  { \linespread { #1 } \selectfont }

%% ===================================================================
%% 文本宽度计算辅助函数
%% ===================================================================

% 获取文本宽度，并存入dim型变量
%  #1 dim 型变量
%  #2 内容
\cs_new:Npn \__nwafu_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__nwafu_tmpa_box { #2 }
    \dim_set:Nn #1 { \box_wd:N \l__nwafu_tmpa_box }
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_get_text_width:Nn { NV }
\cs_generate_variant:Nn \__nwafu_get_text_width:Nn { Nx }

% 获取多个文本（clist）中的最大宽度，并存入dim型变量。
\cs_new:Npn \__nwafu_get_max_text_width:NN #1#2
  {
    \group_begin:
      \dim_set:Nn #1 {-999pt}
      \clist_set_eq:NN \l__nwafu_tmpt_clist #2
      \bool_until_do:nn { \clist_if_empty_p:N \l__nwafu_tmpt_clist }
        {
          \clist_pop:NN \l__nwafu_tmpt_clist \l__nwafu_tmpt_tl
          \__nwafu_get_text_width:NV \l__nwafu_tmpt_dim \l__nwafu_tmpt_tl
          \dim_gset:Nn #1 { \dim_max:nn { #1 } { \l__nwafu_tmpt_dim } }
        }
    \group_end:
  }

%% ===================================================================
%% 封面元素作者信息数据列表选择辅助函数
%% ===================================================================
% 定义封面作者信息元素数据全局clist列表变量
\clist_new:N \g__nwafu_cover_info_clist

% 选择指定的封面作者信息元素数据列表
%  #1 数据列表常量主名称
\cs_new_protected:Npn \__nwafu_select_fields:n #1
  {
    \clist_clear:N   \g__nwafu_cover_info_clist
    \clist_gset_eq:Nc \g__nwafu_cover_info_clist { #1 }
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_select_fields:n { V }

% 清空封面作者信息元素数据列表中内容为空白的数据条目
\cs_new_protected:Npn \__nwafu_filter_nonempty_fields:
  {
    % 清空临时clist变量
    \clist_clear:N \l_tmpa_clist

    % 循环判断
    \clist_map_inline:Nn \g__nwafu_cover_info_clist
      {
        % 取出第2个字段(内容)
        \tl_set:Nx \l_tmpa_tl { \exp_after:wN \use_ii:nnn ##1 }

        % 内容为空
        \tl_if_empty:NTF \l_tmpa_tl
          { }
          { \clist_put_right:Nn \l_tmpa_clist { ##1 } }
      }

    % 重置结果
    \clist_gset_eq:NN \g__nwafu_cover_info_clist \l_tmpa_clist
  }

%% ===================================================================
%% 封面作者信息元素数据列表中文本最大宽度计算辅助函数
%% ===================================================================
% 标签列最大宽度，存入\l__nwafu_tmpa_dim变量
\cs_new_protected:Npn \__nwafu_get_max_label_width:
  {
    \dim_set:Nn \l__nwafu_tmpa_dim { -999 pt }
    \clist_map_inline:Nn \g__nwafu_cover_info_clist
      {
        % 计算标签列文本宽度
        \exp_args:NnV \__nwafu_get_text_width:Nn \l__nwafu_tmpt_dim
          { \exp_after:wN \use_i:nnn ##1 }

        % 比较记录最大值
        \dim_set:Nn \l__nwafu_tmpa_dim
          { \dim_max:nn { \l__nwafu_tmpa_dim } { \l__nwafu_tmpt_dim } }
      }
  }

% 数据列最大宽度，存入\l__nwafu_tmpb_dim变量
\cs_new_protected:Npn \__nwafu_get_max_value_width:
  {
    \dim_set:Nn \l__nwafu_tmpb_dim { -999 pt }

    \clist_map_inline:Nn \c__nwafu_cover_info_clist
      {
        % 取得数据列文本
        \tl_set:Nx \l__nwafu_tmpt_tl { \exp_after:wN \use_ii:nnn ##1 }

        % 导师或合作导师需要格式化文本(姓名 职称)
        \bool_if:nT { \int_compare_p:nNn { \exp_after:wN \use_iii:nnn ##1 } = { 1 } ||
                      \int_compare_p:nNn { \exp_after:wN \use_iii:nnn ##1 } = { 2 } }
          { \__nwafu_format_supervisor_list:N \l__nwafu_tmpt_tl }

        % 计算内容列文本宽度
        \__nwafu_get_text_width:NV \l__nwafu_tmpt_dim \l__nwafu_tmpt_tl

        % 比较记录最大值
        \dim_set:Nn \l__nwafu_tmpb_dim
          { \dim_max:nn { \l__nwafu_tmpb_dim } { \l__nwafu_tmpt_dim } }
      }
  }

%% ===================================================================
%% 输出封面作者信息元素单行内容
%% ===================================================================
% 通用单行内容输出函数
%  #1 标签内容
%  #2 实际内容
%  #3 特殊标志：0--普通，1--导师， 2--合作导师，3--其它
\cs_new_protected:Npn \__nwafu_cover_item_output:nnn #1#2#3
  {
    % 需要输出的内容
    \tl_set:Nn \l__nwafu_tmpb_tl { #2 }

    % 导师数据需要规范化处理
    \bool_if:nT { \int_compare_p:nNn { #3 } = { 1 } || \int_compare_p:nNn { #3 } = { 2 } }
      { \__nwafu_format_supervisor_list:N \l__nwafu_tmpb_tl }

    % 分散对齐盒子中输出标签内容
    \__nwafu_spread_box:Vn \l__nwafu_tmpa_dim { #1 }

    % 冒号
    \c__nwafu_fwid_colon_tl

    % 带下划线居中对齐盒子输出数据内容
    \__nwafu_center_box_uline:Vn \l__nwafu_tmpb_dim { \l__nwafu_tmpb_tl }
    \par
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_cover_item_output:nnn { xxx }

%% ===================================================================
%% 格式化姓名+职称数据
%% ===================================================================
% 格式化导师/合作导师数据
%  #1 导师数据，由{{ 姓名, 职称 }, { 姓名, 职称 }, ..., { 姓名, 职称 }}的形式构成
\cs_new_protected:Npn \__nwafu_format_supervisor_list:N #1
  {
    \seq_clear:N \l_tmpa_seq
    \exp_args:Nx \clist_map_inline:nn { #1 }
      {
        % 姓名
        \tl_set:Nx \l__nwafu_tmpa_tl { \clist_item:nn { ##1 } { 1 } }
        % 职称
        \tl_set:Nx \l__nwafu_tmpb_tl { \clist_item:nn { ##1 } { 2 } }

        % 职称是否为空
        \tl_if_empty:NTF \l__nwafu_tmpb_tl
          { \seq_put_right:NV \l_tmpa_seq \l__nwafu_tmpa_tl }
          {
            % 职称不为空，则在姓名与职称间添加空格
            \seq_put_right:Nx \l_tmpa_seq
              { \l__nwafu_tmpa_tl \enskip \l__nwafu_tmpb_tl }
          }
      }

    % 用逗号分隔后写入原clist
    \tl_set:Nx #1 { \seq_use:Nn \l_tmpa_seq { ,\enskip } }
  }

%% ===================================================================
%% 格式化班级编号
%% ===================================================================
% 将班级编号格式化为XX级X班的形式
%  #1 班级编号
\cs_new_protected:Npn \__nwafu_format_class_id:n #1
  {
    % 转为字符串并去除空格
    \tl_set:Nx \l__nwafu_tmpt_tl { \tl_to_str:n { #1 } }
    \tl_trim_spaces:N \l__nwafu_tmpt_tl

    % 获取字符串长度
    \int_set:Nn \l_tmpa_int { \tl_count:N \l__nwafu_tmpt_tl }

    % 判断是否为纯数字（逐字符检查）
    \bool_set_true:N \l_tmpa_bool
    \tl_map_inline:Nn \l__nwafu_tmpt_tl
      {
        \bool_if:nT { \int_compare_p:nNn { `##1 } < { `0 } || \int_compare_p:nNn { `##1 } > { `9 } }
          { \bool_set_false:N \l_tmpa_bool }
      }

    % 仅处理纯数字
    \bool_if:NTF \l_tmpa_bool
      {
        \int_case:nnF { \l_tmpa_int }
          {
            % 3位数：第1位是年级，后2位是班级
            { 3 }
              {
                \tl_set:Nx \l__nwafu_tmpc_tl { \tl_range:Nnn \l__nwafu_tmpt_tl { 1 } { 2 } }
                \tl_set:Nx \l__nwafu_tmpd_tl { \tl_range:Nnn \l__nwafu_tmpt_tl { 3 } { 3 } }
                \regex_replace_once:nnN { ^0+ } { } \l__nwafu_tmpd_tl
                \l__nwafu_tmpc_tl 级 \l__nwafu_tmpd_tl 班
              }
            % 4位数：前2位是年级，后2位是班级
            { 4 }
              {
                \tl_set:Nx \l__nwafu_tmpc_tl { \tl_range:Nnn \l__nwafu_tmpt_tl { 1 } { 2 } }
                \tl_set:Nx \l__nwafu_tmpd_tl { \tl_range:Nnn \l__nwafu_tmpt_tl { 3 } { 4 } }
                \regex_replace_once:nnN { ^0+ } { } \l__nwafu_tmpd_tl
                \l__nwafu_tmpc_tl 级 \l__nwafu_tmpd_tl 班
              }
          }
          { #1 } % 不符合3位/4位数字的规则，原样返回
      }
      { #1 } % 非纯数字，原样返回
  }

%%********************************************************************
%% 用户配置
%%********************************************************************

%% ===================================================================
%% nwafupaper字体选项
%% ===================================================================
% 保存选项结果tl变量
\tl_new:N \g__nwafu_fontset_tl
\tl_new:N \g__nwafu_cjk_fontset_tl

% 定义字体选项
\keys_define:nn { nwafu / style }
  {
    % 西文字体选项
    font .choices:nn =
      { garamond, libertinus, lm, palatino, times, times*, none }
      { \tl_gset_eq:NN \g__nwafu_fontset_tl \l_keys_choice_tl },

    % 中文字体选项
    cjk-font .choices:nn =
      { adobe, fandol, founder, mac, sinotype, sourcehan, windows, none }
      { \tl_gset_eq:NN \g__nwafu_cjk_fontset_tl \l_keys_choice_tl }
  }

% 载入字体
\ctex_at_end_preamble:n { \__nwafu_load_font: }

%% ===================================================================
%% 页面布局设置，利用geometry宏包实现设置
%% ===================================================================
% 页面布局函数
\cs_new_protected:Npn \__nwafu_paper_geometry:
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
  }
% 调用页面布局函数
\__nwafu_paper_geometry:

% 草稿模式时，显示页面边框及页眉、页脚线
\bool_if:NT \g__nwafu_draft_bool { \geometry { showframe } }

%% ===================================================================
%% 字号及句点选择选项处理
%% ===================================================================
% 定义字号及句点选项
\keys_define:nn { nwafu / style }
  {
    font-size .choice:,
    font-size .value_required:n = true,
    font-size / -4 .code:n      = { },
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

    % 句点形状设置(圈或点)
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
% 报告错误
\__nwafu_msg_new:nn { mapping-not-available }
  {
    Option~ "fullwidth-stop = mapping"~ is~ not~ available~ in~ LuaTeX. \\
    "fullwidth-stop = catcode"~ will~ be~ set~ instead.
  }

%% ===================================================================
%% 脚注选项处理
%% ===================================================================
% 脚注选择变量
\tl_new:N \l__nwafu_fn_style_tl

% 定义脚注选项
\keys_define:nn { nwafu / style }
  {
    footnote-style .choices:nn =
      {
        plain,
        libertinus, libertinus*, libertinus-sans,
        pifont,     pifont*,     pifont-sans,     pifont-sans*,
        circled,    circled*,    circled-sans,    circled-sans*,
        xits,                    xits-sans,       xits-sans*
      }{
        \tl_gset_eq:NN \l__nwafu_fn_style_tl \l_keys_choice_tl
        \int_compare:nT { 5 <= \l_keys_choice_int <= 12 }
          { \RequirePackage { pifont } } % 载入pifont宏包
      },
    footnote-style .value_required:n = true
  }

%% ===================================================================
%% 定理选项处理
%% ===================================================================
% 定义定理选项
\keys_define:nn { nwafu / theorem }
  {
    style       .tl_set:N  = \l__nwafu_thm_style_tl,
    header-font .tl_set:N  = \l__nwafu_thm_header_font_tl,
    body-font   .tl_set:N  = \l__nwafu_thm_body_font_tl,
    qed         .tl_set:N  = \l__nwafu_thm_qed_tl,
    counter     .tl_set:N  = \l__nwafu_thm_counter_tl
  }

%% ===================================================================
%% 页眉页脚设置
%% ===================================================================
% 清空页眉页脚
\fancyhf { }
% 获取学校名称
\cs_new:Npn \__nwafu_university_name:
  {
    \c__nwafu_label_simp_tl
  }
% 获取课程论文、课程设计或实习报告内容文本
\cs_new:Npn \__nwafu_paper_type_name:
  {
    \clist_item:Nn \c__nwafu_paper_type_clist { \g__nwafu_paper_type_int }
  }

% 奇数页页眉（章/节标题）
\cs_new:Npn \__nwafu_header_odd:
  { \small \nouppercase { \leftmark } }
% 偶数页页眉（学校名称+类型文本）
\cs_new:Npn \__nwafu_header_even:
  {
    \small \nouppercase
      {
        \__nwafu_university_name: % 取得学校名称
        \__nwafu_paper_type_name: % 取得类型文本
      }
  }

% 获取中间页眉(单面模式)
\cs_new:Npn \__nwafu_header_center:
  { \small \nouppercase { \g__nwafu_header_center_mark_tl } }

% 设置页脚
\cs_new:Npn \__nwafu_footer_page: { \small \thepage }

% 设置前料页面横线粗细（正文前）
\cs_new_protected:Npn \__nwafu_set_headrule_front:
  { \RenewDocumentCommand \headrulewidth { } { 0.75 pt } }
% 设置正文页面横线粗细
\cs_new_protected:Npn \__nwafu_set_headrule_main:
  { \RenewDocumentCommand \headrulewidth { } { 0.75 pt } }

% 统一页眉页脚设置（双面模式）
\cs_new_protected:Npn \__nwafu_set_header_footer_twoside:
  {
    \nwafuhead[OC] { \__nwafu_header_odd:  }
    \nwafuhead[EC] { \__nwafu_header_even: }
    \nwafufoot[C]  { \__nwafu_footer_page: }
  }

% 统一页眉页脚设置（单面模式）
\cs_new_protected:Npn \__nwafu_set_header_footer_oneside:
  {
    \nwafuhead[C] { \__nwafu_header_center: }
    \nwafufoot[C] { \__nwafu_footer_page:   }
  }

% 根据当前单面/双面模式自动选择页眉页脚设置
\cs_new_protected:Npn \__nwafu_apply_header_footer:
  {
    \bool_if:NTF \g__nwafu_twoside_bool
      { \__nwafu_set_header_footer_twoside: }
      { \__nwafu_set_header_footer_oneside: }
  }

% 用于保存中间页眉文字的变量。正文中将其设置为空，
% 目录、摘要、% 插图与附表清单、符号表、术语表、
% 参考文献、附录、致谢、个人简历等设置为相应标题文字。
\tl_new:N \g__nwafu_header_center_mark_tl

% 重定义 \cleardoublepage，使得偶数页面在没有内容时不显示页眉页脚，见
% \url{https://tex.stackexchange.com/a/1683}。最后清空中间页眉，确保正文部分
% 页眉显示正确。
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

% 为ctex宏包使用 heading 选项后，会把页面格式设置为 headings。
% 因此必须在 ctex 调用之后重新设置 \pagestyle 为 fancy。
\pagestyle { fancy }

% 命令复制
\cs_gset_eq:NN \nwafuhead \fancyhead
\cs_gset_eq:NN \nwafufoot \fancyfoot

% \frontmatter和\mainmatter设置
% 根据要求定制摘要、目录、主要符号对照表等前置及正文部分的页眉页脚。
\int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
  {
    % 报告类基于ctexbook，需要重定义\frontmatter
    \RenewDocumentCommand{\frontmatter}{ s O{ Roman } }
      {
        \IfBooleanTF{ #1 }{ \clearpage }{ \cleardoublepage }
        \@mainmatterfalse
        \__nwafu_set_headrule_front:
        \pagenumbering{ #2 }
        \__nwafu_apply_header_footer:
      }

    % 报告类基于ctexbook，需要重定义\mainmatter
    \RenewDocumentCommand{\mainmatter}{ s }
      {
        \IfBooleanTF{ #1 }{ \clearpage }{ \cleardoublepage }
        \@mainmattertrue
        \pagenumbering{ arabic }
        \__nwafu_set_headrule_main:
        \__nwafu_apply_header_footer:
      }
  }
  {
    % 设计和论文类基于ctexart，需要新定义\frontmatter
    \NewDocumentCommand \frontmatter { s O{ Roman } }
      {
        \IfBooleanTF{ #1 }{ \clearpage }{ \cleardoublepage }
        \__nwafu_set_headrule_front:
        \pagenumbering{ #2 }
        \__nwafu_apply_header_footer:
      }

    % 设计和论文类基于ctexart，需要新\mainmatter
    \NewDocumentCommand \mainmatter { s }
      {
        \IfBooleanTF{ #1 }{ \clearpage }{ \cleardoublepage }
        \pagenumbering{ arabic }
        \__nwafu_set_headrule_main:
        \__nwafu_apply_header_footer:
      }
  }

% 参考文献部分
\NewDocumentCommand{\bibmatter}{ s }
  {
    \IfBooleanTF{ #1 }{ \clearpage }{ \cleardoublepage }
    \int_compare:nNnT { \g__nwafu_paper_type_int } = { 3 }
      {
        \@mainmattertrue
      }
    \__nwafu_apply_header_footer:
  }

% 后料部分页码设置（可选，附录等）
\int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
  {
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
  }
  {
    \NewDocumentCommand \backmatter { s }
      {
        \IfBooleanTF{ #1 }{ \clearpage }{ \cleardoublepage }
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
  }

% 为\appendix打补丁
\__nwafu_appto_cmd:Nn \appendix
  {
    \clearpage

    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        \bool_if:NTF \g__nwafu_twoside_bool
          {
            \nwafuhead[OC] { \small \nouppercase {附录~\thechapter} }
            \nwafuhead[EC] { \__nwafu_header_even: }
          }{
            \nwafuhead[C]
              {
                \int_if_odd:nTF \c@page
                  { \small \nouppercase {附录~\thechapter} }
                  { \__nwafu_header_even: }
              }
          }
      }
      {
        % ===== 附录编号设置 =====
        \ctexset{
            section =
              {
                name        = {,．},
                number      = \Alph{section},
                aftername   = \enskip,
                format      = \zihao{-3} \normalfont \nwafu@hei \raggedright,
                beforeskip  = 0.85\baselineskip,
                afterskip   = 0.80\baselineskip,
                fixskip     = true
              },
          }

        % 图表计数器使用简单数字
        \renewcommand{\thefigure}{\arabic{figure}}
        \renewcommand{\thetable}{\arabic{table}}
        \renewcommand{\theequation}{\arabic{equation}}

        % 通过 caption 添加前缀
        % 使用预定义的 listformat
        \captionsetup[figure]{
            name     = 附图,
            labelsep = space,
            list     = no,
            % listformat=appfigure
        }
        \captionsetup[table]{
            name     = 附表,
            labelsep = space,
            list     = no,
            % listformat=apptable
        }

        % 公式编号需要单独处理
        \renewcommand{\theequation}{附式\arabic{ equation }}

        % 重置计数器
        \setcounter{figure}{0}
        \setcounter{table}{0}
        \setcounter{equation}{0}

        % 关键：直接修改 \listoffigures 和 \listoftables 的显示
        % 钩住 \listoffigures 命令，在生成目录前重定义 \numberline
        \appto{\listoffigures}{%
          \let\oldnumberline\numberline
          \renewcommand{\numberline}[1]{附图##1}%
        }
        \appto{\listoftables}{%
          \let\oldnumberline\numberline
          \renewcommand{\numberline}[1]{附表##1}%
        }

        % 修复交叉引用
        \def\p@figure{}
        \def\p@table{}
        \def\p@equation{}

        % section 命令和页眉设置...
        \let\old@section\section
        \RenewDocumentCommand \section { s o m }
          {
            \cleardoublepage
            \IfBooleanTF{ #1 }
              { \old@section*{ #3 } }
              {
                \IfValueTF{ #2 }
                  { \old@section[ #2 ]{ #3 } }
                  { \old@section{ #3 } }
              }
            \bool_if:NTF \g__nwafu_twoside_bool
              { \markboth{ 附录~ \thesection~ #3 }{ 附录~ \thesection~ #3 } }
              { \tl_gset:Nn \g__nwafu_header_center_mark_tl { 附录~ \thesection~ #3 } }
          }

        \bool_if:NTF \g__nwafu_twoside_bool
          {
            \nwafuhead[OC] { \small \nouppercase { \leftmark } }
            \nwafuhead[EC] { \__nwafu_header_even: }
          }{
            \nwafuhead[C]
              {
                \int_if_odd:nTF \c@page
                  { \small \nouppercase { \g__nwafu_header_center_mark_tl } }
                  { \__nwafu_header_even: }
              }
          }
      }
  }

%% ===================================================================
%% 调用ctexset设置各级标题格式
%% ===================================================================
% 标题设置函数
\cs_new_protected:Npn \__nwafu_ctexset_caption:
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        \keys_set:nn { ctex }
          {
            secnumdepth = 4,  % 编号深度：subsubsection 仍然编号
            tocdepth    = 2,   % 目录深度：subsubsection 不出现
            chapter =
              {
                pagestyle   = fancy,
                number      = { \__nwafu_arabic:n { chapter } },
                aftername   = \hspace*{ \ccwd },
                format      = \zihao{3} \normalfont \nwafu@hei \centering,
                beforeskip  = 0.25\baselineskip,
                afterskip   = 0.65\baselineskip,
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
                numbering   = true,
                number      = \arabic{subsubsection},
                name        = {,．},
                aftername   = \hspace*{\c_zero_skip},
                indent      = 2\ccwd, % 首行缩进2个汉字
                hang        = false,  % 确保是首行缩进而非悬挂缩进
                format      = \zihao{-4} \normalfont \raggedright,
                beforeskip  = 0.40\baselineskip,
                afterskip   = 0.40\baselineskip,
                fixskip     = true
              }
          }
      }
      {
        \keys_set:nn { ctex }
          {
            secnumdepth = 3,  % 编号深度：subsubsection 仍然编号
            tocdepth    = 2,   % 目录深度：subsubsection 不出现
            section =
              {
                name        = {,．},
                aftername   = \enskip,
                format      = \zihao{-3} \normalfont \nwafu@hei \raggedright,
                beforeskip  = 0.85\baselineskip,
                afterskip   = 0.80\baselineskip,
                fixskip     = true
              },
            subsection =
              {
                aftername   = \enskip,
                format      = \zihao{4} \normalfont \nwafu@hei \raggedright,
                beforeskip  = 0.80\baselineskip,
                fixskip     = true
              },
            subsubsection =
              {
                aftername   = \enskip,
                format      = \zihao{-4} \normalfont \nwafu@hei \raggedright,
                beforeskip  = 0.40\baselineskip,
                afterskip   = 0.40\baselineskip,
                fixskip     = true
              }
          }
      }
  }
% 调用标题设置函数
\__nwafu_ctexset_caption:

% 手动生成章标题函数
%  用于报告的摘要、主要符号对照表、术语表、参考文献、致谢等章标题排版
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
            },
        }
      \chapter { #1 }

      % 设置页眉内容
      \__nwafu_chapter_header:n { #1 }
    \group_end:
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_chapter:n { V }

% 不出现在目录中的章标题需特别处理。参考 https://tex.stackexchange.com/a/1821。
\cs_new_protected:Npn \__nwafu_chapter_no_toc:n #1
  {
    \chapter*{ #1 }
    \__nwafu_chapter_header:n { #1 }
    \pdfbookmark [0] { #1 } { toc }
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_chapter_no_toc:n { V }

% 特殊章标题的页眉内容
\cs_new_protected:Npn \__nwafu_chapter_header:n #1
  {
    \bool_if:NTF \g__nwafu_twoside_bool
      { \markboth { #1 } { #1 } }
      {
        \markboth { } { }
        \tl_gset:Nn \g__nwafu_header_center_mark_tl { #1 }
      }
  }

% 手动生成节标题，用于设计、论文类摘要、主要符号对照表、术语表、参考文献、致谢等章标题排版
\cs_new_protected:Npn \__nwafu_section:n #1
  {
    \group_begin:
      \ctexset
        {
          section =
            {
              numbering  = false,
              format     = \zihao{4} \normalfont \nwafu@hei \centering,
              beforeskip = 0.25\baselineskip,
              afterskip  = 0.65\baselineskip
            }
        }
      \section { #1 }

      \__nwafu_section_header:n { #1 }
    \group_end:
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_section:n { V }

% 不应出现在目录中的节标题需特别处理。参考 https://tex.stackexchange.com/a/1821。
\cs_new_protected:Npn \__nwafu_section_no_toc:n #1
  {
    \group_begin:
      \ctexset
        {
          section =
            {
              numbering  = false,
              format     = \zihao{4} \normalfont \nwafu@hei \centering,
              beforeskip = 0.25\baselineskip,
              afterskip  = 0.65\baselineskip
            }
        }
      \section { #1 }
      \__nwafu_section_header:n { #1 }
      \pdfbookmark [0] { #1 } { toc }
    \group_end:
  }
% 函数变体
\cs_generate_variant:Nn \__nwafu_section_no_toc:n { V }

% 特殊节标题的页眉页脚内容
\cs_new_protected:Npn \__nwafu_section_header:n #1
  {
    \bool_if:NTF \g__nwafu_twoside_bool
      { \markboth { #1 } { #1 } }
      {
        \markboth { } { }
        \tl_gset:Nn \g__nwafu_header_center_mark_tl { #1 }
      }
  }

%% ===================================================================
%% 封面设计
%% ===================================================================
% 定义标签常量及变量
% 格式：{<主名称>}{<常量内容>}（第1个元素为主名称，第2个元素为常量内容）
%   定义类似\c__nwafu_label_title_tl的tl常量，用于保存各类标签
%   定义类似\l__nwafu_info_title_tl的tl变量，用于接收各类输入数据
\clist_map_inline:nn
  {
    { title        }{ 题目           },
    { author       }{ 学生姓名       },
    { supervisor   }{ 指导教师       },
    { cosupervisor }{ 合作指导教师   },
    { department   }{ 培养单位       },
    { major        }{ 专业名称       },
    { class_id     }{ 班级           },
    { student_id   }{ 学号           },
    { period       }{ 起止日期       },
    { date         }{ 实践日期       },
    { abstract     }{ 摘要           },
    { keywords     }{ 关键词         },
    { figtab       }{ 插图与附表清单 },
    { notation     }{ 符号表         },
    { terminology  }{ 术语表         },
    { toc          }{ 目录           },
    { ack          }{ 致谢           },
    { pdf_creator  }{ 西北农林科技大学LaTeX课程论文模板 }
  }
  {
    % 创建标签tl常量
    \tl_const:cx { c__nwafu_label_ \use_i:nn #1 _tl } { \use_ii:nn #1 }
    % 创建内容数据tl变量
    \tl_new:c { l__nwafu_info_ \use_i:nn #1 _tl }
  }

% 定义nwafu/info选项，以接受用户输入的数据
% 注意：各变量需要提前定义，选项名称可以自行定义，但注意调用时的对应
% 可根据需要进行增/删
\keys_define:nn { nwafu / info }
  {
    % 设计/论文/报告题目
    title        .tl_set:N  = \l__nwafu_info_title_tl,

    % 作者姓名
    author       .tl_set:N  = \l__nwafu_info_author_tl,
    % 学号
    student-id   .tl_set:N  = \l__nwafu_info_student_id_tl,
    % 班级号
    class-id .code:n = { % 如果输入的是3/4位数字，则处理成XX级X班的形式，其它保持不变
                         \tl_set:Nx \l__nwafu_info_class_id_tl { \__nwafu_format_class_id:n { #1 } }
                       },

    % 导师姓名
    supervisor   .tl_set:N  = \l__nwafu_info_supervisor_tl,
    % 合作指导老师姓名
    cosupervisor .tl_set:N  = \l__nwafu_info_cosupervisor_tl,

    % 专业名称
    major        .tl_set:N  = \l__nwafu_info_major_tl,

    % 培养单位（学院）名称
    department   .tl_set:N  = \l__nwafu_info_department_tl,

    % 起止日期
    period       .tl_set:N  = \l__nwafu_info_period_tl,
    period       .initial:n = {},
    period       .default:n = {},

    % 完成日期
    date         .tl_set:N  = \l__nwafu_info_date_tl,
    date         .initial:n = { \int_use:N \c_sys_year_int 年 \int_use:N \c_sys_month_int 月 },
    date         .default:n = { \int_use:N \c_sys_year_int 年 \int_use:N \c_sys_month_int 月 },
  }

% 定义记录课程名称的tl变量
\tl_new:N \l__nwafu_subject_tl

% 封面无数元数据列表名称选项
\keys_define:nn { nwafu / info }
  {
    subject      .tl_set:N  = \l__nwafu_subject_tl,
  }

% 封面LOGO变量
\tl_new:N \l__nwafu_cover_logo_tl
\tl_new:N \l__nwafu_cover_logo_size_tl
% 封面LOGO选项
\keys_define:nn { nwafu / style }
  {
    logo      .tl_set:N = \l__nwafu_cover_logo_tl,
    logo-size .tl_set:N = \l__nwafu_cover_logo_size_tl
  }

% 封面LOGO元素载入函数
\cs_new_protected:Npn \__nwafu_cover_logo:
  {
    % 按指定的缩放比例载入LOGO
    \includegraphics [ scale = \l__nwafu_cover_logo_size_tl ]
      { \l__nwafu_cover_logo_tl }
  }

% 基本信息
\cs_new_protected:Npn \__nwafu_cover_info:
  {
    \begin{minipage} [ c ] { \textwidth }
      \centering
      % 元数据选择
      \__nwafu_select_fields:n { c__nwafu_cover_info_clist }
      % 删除空内容字段
      \__nwafu_filter_nonempty_fields:
      % 取得标签列最大宽度
      \__nwafu_get_max_label_width:
      % 取得内容列最大宽度
      \__nwafu_get_max_value_width:
      % 适当放大标签列宽度
      \dim_add:Nn \l__nwafu_tmpa_dim { 0.8 em }

      % 循环输出各行内容
      \clist_map_inline:Nn \g__nwafu_cover_info_clist
        {
          \__nwafu_cover_item_output:xxx ##1
        }
    \end{minipage}
  }

% 获取单位名称
\cs_new:Nn \__nwafu_department_name:
  {
    \c__nwafu_label_simp_tl % 学校名称
    \l__nwafu_info_department_tl % 学院名称
  }

% 获取课程及论文类型名称
\cs_new:Nn \__nwafu_subject_name:
  {
    \tl_if_empty:NF \l__nwafu_subject_tl
      {
        % \l__nwafu_subject_tl不为空
        \c__nwafu_fwid_left_title_tl  % 左书名号
        \l__nwafu_subject_tl          % 课程名称
        \c__nwafu_fwid_right_title_tl % 右书名号
      }
    \clist_item:Nn \c__nwafu_paper_type_clist { \g__nwafu_paper_type_int } % paper类型
  }

% 绘制封面命令
\NewDocumentCommand \makecover { }
  {
    % 声明封面元素
    \__nwafu_declare_cover_elements:nn { cover } { \c__nwafu_cover_elements_clist }

    % 声明封面
    \__nwafu_declare_page:nx { cover-default }
      {
        content     = { \c__nwafu_cover_contents_tl },
        prefix      = cover /,
        top-skip    = \c_zero_skip,
        bottom-skip = \c_zero_skip
      }

    % 清空页眉页脚
    \thispagestyle { empty }
    % 页面布局
    \newgeometry{ top=1.2in, bottom=1.2in, left=1.25in, right=1.25in }
    % 使用封面
    \UseInstance { nwafu } { cover-default }
    % 恢复原页面布局
    \restoregeometry
  }

% 排版封面
\NewDocumentCommand \makecovers { }
  {
    \begin{titlepage}
      \makecover
      \cleardoublepage
    \end{titlepage}
  }

%% ===================================================================
%% 摘要环境设计
%% ===================================================================
% 定义变量
\tl_new:N    \l__nwafu_abstract_file_tl
\clist_new:N \l__nwafu_abstract_keywords_clist
\tl_new:N    \l__nwafu_notation_file_tl
\tl_new:N    \l__nwafu_terminology_file_tl
% 定义选项
\keys_define:nn { nwafu / abstract }
  {
    % 摘要内容文件
    abstractfile  .tl_set:N  = \l__nwafu_abstract_file_tl,
    % 关键字列表文件
    keywords  .clist_set:N   = \l__nwafu_abstract_keywords_clist,
    % 主要符号对照表文件
    notationfile  .tl_set:N  = \l__nwafu_notation_file_tl,
    notationfile  .default:n = {},
    % 术语表文件
    termfile  .tl_set:N      = \l__nwafu_terminology_file_tl,
    termfile  .default:n     = {},
  }

% 定义摘要环境
\int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
  {
    % ctexbook文档类，新定义摘要环境
    \NewDocumentEnvironment { abstract  } { }
      { \__nwafu_abstract_begin: }
      { \__nwafu_abstract_end:   }
  }
  {
    % ctexart文档类，重定义摘要环境
    \RenewDocumentEnvironment { abstract  } { }
      { \__nwafu_abstract_begin: }
      { \__nwafu_abstract_end:   }
  }

% 摘要环境前处理
\cs_new_protected:Npn \__nwafu_abstract_begin:
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        \__nwafu_chapter:V \c__nwafu_label_abstract_tl
        \par \mode_leave_vertical: \par
        % \small
      }
      {
        \__nwafu_section:V \c__nwafu_label_abstract_tl
        \par \mode_leave_vertical: \par
        % 摘要内容字号
        % \small
        % 可选：调整段落首行缩进
        \parindent = 2em
        % 可选：调整段落间距
        \parskip = 0pt
        \group_begin:
      }
  }

% 摘要环境后处理
\cs_new_protected:Npn \__nwafu_abstract_end:
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        \__nwafu_keywords:nNn
          { \c__nwafu_label_keywords_tl \c__nwafu_fwid_colon_tl }
          \l__nwafu_abstract_keywords_clist { ; ~}
      }
      {
        \group_end:
        \__nwafu_keywords:nNn
          { \c__nwafu_label_keywords_tl \c__nwafu_fwid_colon_tl }
          \l__nwafu_abstract_keywords_clist { ; ~}
      }
  }

% 关键字处理与输出
\cs_new_protected:Npn \__nwafu_keywords:nNn #1#2#3
  {
    \par \mode_leave_vertical: \par \noindent
    \__nwafu_get_text_width:Nn \l__nwafu_tmpa_dim { #1 }
    \group_begin: \small\bfseries \MakeUppercase{ #1 } \group_end:
    \parbox [t] { \dim_eval:n { \textwidth - \l__nwafu_tmpa_dim } }
      {
        \small
        \clist_use:Nn #2 { #3 } \par
      }
  }

% 定义插图和附表清单环境
\NewDocumentEnvironment { figtablist } { }
  {
    \group_begin:
      \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
        {
          % ctexbook文档类章标题
          \__nwafu_chapter:V \c__nwafu_label_figtab_tl
        }
        {
          % ctexart文档类节标题
          \__nwafu_section:V \c__nwafu_label_figtab_tl
        }
      \RenewDocumentCommand \addvspace { m } { }
      \RenewDocumentCommand \listoffigures { } { \@starttoc { lof } }
      \RenewDocumentCommand \listoftables  { } { \@starttoc { lot } }
  }
  {
    \group_end:
  }

%% ===================================================================
%% 符号表与术语表环境设计，基于tabularray实现
%% ===================================================================
% longtblr样式设计
\NewTblrTheme{empty}{
    \SetTblrStyle{firstfoot, middlefoot, lastfoot}{font = \small}
    \DefTblrTemplate{firsthead}{default}{}
    \DefTblrTemplate{middlehead}{default}{}
    \DefTblrTemplate{lasthead}{default}{}
    \DefTblrTemplate{contfoot-text}{default}{（接下页）}
  }

% 符号表环境
\NewDocumentEnvironment { notation } { O{ } }
  {
    \group_begin:
      \__nwafu_notation_begin:
      \begin{longtblr}[
        theme  = empty,
        entry  = none, % 不出现在目录中
        presep = 0pt,
      ]{
        width      = 0.95\textwidth, % 总宽度
        colspec    = { X[2, c, m] X[2, c, m] X[5.5, l, m] }, % 三列比例：2:2:2.5
        hline{1,Z} = { \heavyrulewidth, solid }, % 第1水平线和最后水平线为粗线
        hline{2}   = { \lightrulewidth, solid }, % 第2水平线和最后水平线为细线
        row{1}     = { c, m, font = \small\bfseries },
        #1,
      }
  }
  {
      \end{longtblr}
    \group_end:
  }
% 符号表环境前处理
\cs_new_protected:Npn \__nwafu_notation_begin:
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类章标题
        \__nwafu_chapter:V \c__nwafu_label_notation_tl
      }
      {
        % ctexart文档类节标题
        \cleardoublepage
        % 直接使用 section 命令，但不添加到目录
        \group_begin:
          % 临时将 section 标题格式改为居中
          \ctexset { section = { numbering = false, format = { \centering \zihao{-3}\normalfont \nwafu@hei } } }
          \section*{ \c__nwafu_label_notation_tl }
        \group_end:
        \addcontentsline{ toc }{ section }{ \c__nwafu_label_notation_tl }
      }
  }
\NewDocumentEnvironment { terminology } { O{ } }
  {
    \group_begin:
      \__nwafu_terminology_begin:
      \begin{longtblr}[
        theme  = empty,
        entry  = none, % 不出现在目录中
        presep = 0pt,
      ]{
        width      = 0.95\textwidth, % 总宽度
        colspec    = { X[3, c, m] X[6.5, l, m] }, % 两列比例：3:6.5
        hline{1,Z} = { \heavyrulewidth, solid },  % 第1水平线和最后水平线为粗线
        hline{2}   = { \lightrulewidth, solid },  % 第2水平线和最后水平线为细线
        row{1}     = { c, m, font = \small\bfseries },
        #1,
      }
  }
  {
      \end{longtblr}
    \group_end:
  }
% 术语表环境前处理
\cs_new_protected:Npn \__nwafu_terminology_begin:
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类章标题
        \__nwafu_chapter:V \c__nwafu_label_terminology_tl
      }
      {
        % ctexart文档类节标题
        % 直接使用 section 命令，但不添加到目录
        \cleardoublepage
        \group_begin:
          % 临时将 section 标题格式改为居中
          \ctexset { section = { numbering = false, format = { \centering \zihao{-3}\normalfont \nwafu@hei } } }
          \section*{ \c__nwafu_label_terminology_tl }
        \group_end:
        \addcontentsline{ toc }{ section }{ \c__nwafu_label_terminology_tl }
      }
  }

% 排版摘要
\cs_new_protected:Npn \__nwafu_front_component_abstract:
  {
    \tl_if_empty:NF \l__nwafu_abstract_file_tl
      {
        \cleardoublepage
        \begin{abstract}
          \file_input:V \l__nwafu_abstract_file_tl
        \end{abstract}
      }
  }

% 排版目录
\cs_new_protected:Npn \__nwafu_front_component_toc:
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类无需处理
        \cleardoublepage
        \tableofcontents
      }
      {
        % ctexart文档类需要处理节标题
        \cleardoublepage
        % 在需要生成目录的地方使用分组
        \group_begin:
        % 临时将 section 标题格式改为居中
        \ctexset { section = { format = { \centering \zihao{-3}\normalfont \nwafu@hei } } }
        \tableofcontents
        \group_end:
      }
  }

% 排版符号表
\cs_new_protected:Npn \__nwafu_front_component_notation:
  {
    \tl_if_empty:NF \l__nwafu_notation_file_tl
      {
        \cleardoublepage
        \file_input:V \l__nwafu_notation_file_tl
      }
  }

% 排版术语表
\cs_new_protected:Npn \__nwafu_front_component_terminology:
  {
    \tl_if_empty:NF \l__nwafu_terminology_file_tl
      {
        \cleardoublepage
        \file_input:V \l__nwafu_terminology_file_tl
      }
  }

% 排版插图与附表清单
\cs_new_protected:Npn \__nwafu_front_component_figtab:
  {
    \cleardoublepage

    \begin{figtablist}
      \listoffigures
      \listoftables
    \end{figtablist}
  }

% 排版前料内容
\cs_new_protected:Npn \__nwafu_execute_frontmatter:n #1
  {
    \clist_map_inline:Nn #1
      {
        \use:n { ##1 }
      }
  }
% 前料排版
\cs_new_protected:Npn \__nwafu_makefront:
  {
    \frontmatter
    \__nwafu_execute_frontmatter:n \c__nwafu_frontmatter_clist
  }

% 前料排版命令
\NewDocumentCommand \makefront { }
  {
    \restoregeometry
    \__nwafu_makefront:
  }

% 导言区结束后排版内容
\ctex_after_end_preamble:n
  {
    \makecovers
    \makefront
  }

%% ===================================================================
%% 目录格式设置
%% ===================================================================
% 设置目录名称
\keys_set:nn { ctex }
  {
    contentsname   = \c__nwafu_label_toc_tl,
  }

% 目录格式驱动clist数据
\int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
  {
    % ctexbook文档类
    \clist_const:Nn \c__nwafu_toc_levels_clist
      {

        { chapter    } { 0 },
        { section    } { 0 },
        { subsection } { 0 },
        { figure     } { 1 },
        { table      } { 1 }
      }
  }
  {
    % ctexart文档类
    \clist_const:Nn \c__nwafu_toc_levels_clist
      {
        { section    } { 0 },
        { subsection } { 0 },
        { figure     } { 1 },
        { table      } { 1 }
      }
  }

% 定义目录设置需要的tl和dim变量
\int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
  {
    \clist_map_inline:nn { chapter, section, subsection, figure, table }
      {
        \clist_map_inline:nn { format, indent, rule, numsep }
          { \tl_new:c { g__nwafu_toc_ #1 _ ##1 _tl } }

        \dim_new:c { g__nwafu_toc_ #1 _offset_dim }
      }
  }
  {
    \clist_map_inline:nn { section, subsection, figure, table }
      {
        \clist_map_inline:nn { format, indent, rule, numsep }
          { \tl_new:c { g__nwafu_toc_ #1 _ ##1 _tl } }

        \dim_new:c { g__nwafu_toc_ #1 _offset_dim }
      }
  }
% 目录对齐及悬挂缩进状态bool变量
\bool_new:N \g__nwafu_toc_line_align_bool
\bool_new:N \g__nwafu_titletoc_hang_fix_bool

% 目录模式设置数据
\cs_new_protected:Npn \__nwafu_setup_toc_format_set:
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类
        \tl_set:Nn  \g__nwafu_toc_chapter_format_tl     { \addvspace{1pt} \nwafu@hei }
        \tl_set:Nn  \g__nwafu_toc_chapter_indent_tl     { 0pc                        }
        \tl_set:Nn  \g__nwafu_toc_chapter_rule_tl       { \tocrule{ $\cdot$ }        }
        \tl_set:Nn  \g__nwafu_toc_chapter_numsep_tl     { 0.5\ccwd                   }
        \dim_set:Nn \g__nwafu_toc_chapter_offset_dim    { 0pc                        }
        \tl_set:Nn  \g__nwafu_toc_section_format_tl     { \addvspace{1pt} \small     }
        \tl_set:Nn  \g__nwafu_toc_section_indent_tl     { \ccwd                      }
        \tl_set:Nn  \g__nwafu_toc_section_rule_tl       { \tocrule{ $\cdot$ }        }
        \tl_set:Nn  \g__nwafu_toc_section_numsep_tl     { 0.5\ccwd                   }
        \dim_set:Nn \g__nwafu_toc_section_offset_dim    { 1pt                        }
        \tl_set:Nn  \g__nwafu_toc_subsection_format_tl  { \addvspace{1pt} \small     }
        \tl_set:Nn  \g__nwafu_toc_subsection_indent_tl  { 2.0\ccwd                   }
        \tl_set:Nn  \g__nwafu_toc_subsection_rule_tl    { \tocrule{ $\cdot$ }        }
        \tl_set:Nn  \g__nwafu_toc_subsection_numsep_tl  { 0.5\ccwd                   }
        \dim_set:Nn \g__nwafu_toc_subsection_offset_dim { 1pt                        }
        \tl_set:Nn  \g__nwafu_toc_figure_format_tl      { \addvspace{0pt}            }
        \tl_set:Nn  \g__nwafu_toc_figure_indent_tl      { 0pc                        }
        \tl_set:Nn  \g__nwafu_toc_figure_rule_tl        { \tocrule{ $\cdot$ }        }
        \tl_set:Nn  \g__nwafu_toc_figure_numsep_tl      { 0.5\ccwd                   }
        \dim_set:Nn \g__nwafu_toc_figure_offset_dim     { 1pt                        }
        \tl_set:Nn  \g__nwafu_toc_table_format_tl       { \addvspace{0pt}            }
        \tl_set:Nn  \g__nwafu_toc_table_indent_tl       { 0pc                        }
        \tl_set:Nn  \g__nwafu_toc_table_rule_tl         { \tocrule{ $\cdot$ }        }
        \tl_set:Nn  \g__nwafu_toc_table_numsep_tl       { 0.5\ccwd                   }
        \dim_set:Nn \g__nwafu_toc_table_offset_dim      { 1pt                        }
        \bool_set_false:N \g__nwafu_toc_line_align_bool
        \bool_set_false:N \g__nwafu_titletoc_hang_fix_bool
      }
      {
        % ctexart文档类
        \tl_set:Nn  \g__nwafu_toc_section_format_tl     { \addvspace{1pt} \nwafu@hei }
        \tl_set:Nn  \g__nwafu_toc_section_indent_tl     { 0pc                        }
        \tl_set:Nn  \g__nwafu_toc_section_rule_tl       { \tocrule{ $\cdot$ }        }
        \tl_set:Nn  \g__nwafu_toc_section_numsep_tl     { 0pc                        }
        \dim_set:Nn \g__nwafu_toc_section_offset_dim    { 0pc                        }
        \tl_set:Nn  \g__nwafu_toc_subsection_format_tl  { \addvspace{1pt} \small     }
        \tl_set:Nn  \g__nwafu_toc_subsection_indent_tl  { \ccwd                      }
        \tl_set:Nn  \g__nwafu_toc_subsection_rule_tl    { \tocrule{ $\cdot$ }        }
        \tl_set:Nn  \g__nwafu_toc_subsection_numsep_tl  { 0.5\ccwd                   }
        \dim_set:Nn \g__nwafu_toc_subsection_offset_dim { 1pt                        }
        \tl_set:Nn  \g__nwafu_toc_figure_format_tl      { \addvspace{0pt}            }
        \tl_set:Nn  \g__nwafu_toc_figure_indent_tl      { 0pc                        }
        \tl_set:Nn  \g__nwafu_toc_figure_rule_tl        { \tocrule{ $\cdot$ }        }
        \tl_set:Nn  \g__nwafu_toc_figure_numsep_tl      { 0.5\ccwd                   }
        \dim_set:Nn \g__nwafu_toc_figure_offset_dim     { 1pt                        }
        \tl_set:Nn  \g__nwafu_toc_table_format_tl       { \addvspace{0pt}            }
        \tl_set:Nn  \g__nwafu_toc_table_indent_tl       { 0pc                        }
        \tl_set:Nn  \g__nwafu_toc_table_rule_tl         { \tocrule{ $\cdot$ }        }
        \tl_set:Nn  \g__nwafu_toc_table_numsep_tl       { 0.5\ccwd                   }
        \dim_set:Nn \g__nwafu_toc_table_offset_dim      { 1pt                        }
        \bool_set_false:N \g__nwafu_toc_line_align_bool
        \bool_set_false:N \g__nwafu_titletoc_hang_fix_bool
      }
  }

% 通用目录设置函数
\cs_new_protected:Npn \__nwafu_setup_toc_level:nn #1#2
  {
    \titlecontents{#1}
      [ \use:c { g__nwafu_toc_ #1 _indent_tl } ]
      { \use:c { g__nwafu_toc_ #1 _format_tl } }
      {
        \int_compare:nNnTF { #2 } = { 1 }
          {
            \str_if_eq:nnT { #1 } { figure }
              { \hspace*{0.5em}图~\thecontentslabel\quad }
            \str_if_eq:nnT { #1 } { table }
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

% 循环设置所有目录
\cs_new_protected:Npn \__nwafu_setup_all_toc_levels:
  {
    \clist_map_inline:Nn \c__nwafu_toc_levels_clist
      {
        \__nwafu_setup_toc_level:nn ##1
      }
  }

% 目录格式设置函数
\cs_new_protected:Npn \__nwafu_setup_toc_format:
  {
    \__nwafu_setup_toc_format_set:
    \__nwafu_setup_all_toc_levels:
  }
% 执行目录设置函数
\__nwafu_setup_toc_format:

% 目录导引线
\cs_new:Npn \NWAFUNumberLine #1
  {
    \CTEXifname
      {
        \use:c { CTEXthe#1 }
        \hspace{\use:c { g__nwafu_toc_#1_numsep_tl }}
      }{}
  }

\NewDocumentCommand{\tocrule}{ s O{ 0.3pc } D(){ 1.2 } m O{} }
  {
    \small\normalfont
    \titlerule*[ #2 ]{ \scalebox{ #3 }{ #4 } } #5
    \IfBooleanTF{ #1 }
      {\thecontentspage}
      {
        \bool_if:NTF \g__nwafu_toc_line_align_bool
          { \contentspage }{ \thecontentspage }
      }
  }

% 设置目录导引线
\bool_if:NTF \g__nwafu_titletoc_hang_fix_bool
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类
        \keys_set:nn { ctex }
          {
            chapter/tocline    = \CTEXnumberline{ #1 } #2,
            section/tocline    = \CTEXnumberline{ #1 } #2,
            subsection/tocline = \CTEXnumberline{ #1 } #2
          }
      }
      {
        % ctexart文档类
        \keys_set:nn { ctex }
          {
            section    / tocline = \CTEXnumberline{ #1 } #2,
            subsection / tocline = \CTEXnumberline{ #1 } #2
          }
      }
  }{
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类
        \keys_set:nn { ctex }
          {
            chapter    / tocline = \NWAFUNumberLine{ #1 } #2,
            section    / tocline = \NWAFUNumberLine{ #1 } #2,
            subsection / tocline = \NWAFUNumberLine{ #1 } #2,
          }
      }
      {
        % ctexart文档类
        \keys_set:nn { ctex }
          {
            section/tocline     = \NWAFUNumberLine{ #1 } #2,
            subsection/tocline  = \NWAFUNumberLine{ #1 } #2,
          }
      }
 }

%% ===================================================================
%% 定义致谢环境
%% ===================================================================
\NewDocumentEnvironment { acknowledgement } { }
  {
    \group_begin:
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类，致谢的章标题
        \__nwafu_chapter:V \c__nwafu_label_ack_tl
      }
      {
        % ctexart文档类，致谢的节标题
        \__nwafu_section:V \c__nwafu_label_ack_tl
      }
  }
  {
    \group_end:
  }

%% ===================================================================
%% 参考文献著录与引用设置
%%   直接使用胡振震制定的gb7714-NWAFU实现参考文献样式控制
%% ===================================================================
% 存储参考文献数据库的clist变量
\clist_new:N \l__nwafu_bib_resource_clist

% 参考文献数据库配置选项
\keys_define:nn { nwafu / style }
  {
    bib-resource .clist_set:N = \l__nwafu_bib_resource_clist
  }

% 为了保证导言区中的设置能起作用，biblatex 宏包均需要在
% 导言区末尾载入（仍在 \pkg{hyperref} 之前），并做相关设置。
\__nwafu_at_end_preamble:n
  {
    \__nwafu_biblatex_pre_setup:
      \RequirePackage { biblatex }
    \__nwafu_biblatex_post_setup:
  }

% 参考文献管理前处理
\cs_new_protected:Npn \__nwafu_biblatex_pre_setup:
  {
    \__nwafu_pass_options_to_biblatex:n { style = gb7714-NWAFU }
    \__nwafu_pass_options_to_biblatex:n
      {
        gbtype      = true,      % 文献类型标识 [J]/[M]/[D] 等
        gbfieldtype = true,      % 文献类型字段标识
      }
  }

% 参考文献管理后处理
\cs_new_protected:Npn \__nwafu_biblatex_post_setup:
  {
    \clist_map_function:NN \l__nwafu_bib_resource_clist \addbibresource
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类，参考文献章标题
        \defbibheading { bibliography } [ \bibname ] { \__nwafu_chapter:n { ##1 } }
      }
      {
        % ctexart文档类，参考文献节标题
        \defbibheading { bibliography } [ \bibname ] { \__nwafu_section:n { ##1 } }
      }
    \DeclareDelimFormat[ cite, parencite, citep ]{ nameyeardelim }{ \addcomma\space }
    \renewcommand*{ \nameyeardelim }{ \addcomma\space }
    \DeclareDelimFormat[ bib, biblist ]{ nameyeardelim }{ \addcomma\space }
    \DeclareFieldFormat[ article ]{ journaltitle }{ ##1\isdot }
  }

% 为biblatex宏包传入参数
\cs_new_protected:Npn \__nwafu_pass_options_to_biblatex:n #1
  { \PassOptionsToPackage { #1 } { biblatex } }

%% ===================================================================
%% 各类间距设置
%% ===================================================================
% 段落间距
\skip_set:Nn \parskip { 0pt plus 2pt minus 1pt }
% 浮动体顶端与底端所留距离
\skip_set:Nn \intextsep { 14pt plus 2pt minus 2pt }
% 最后一个浮动对象顶端或第一个浮动对象底端与正文之间的距离
\skip_set:Nn \textfloatsep { 16pt plus 2pt minus 4pt }

% 强烈建议多行公式进行分页
\allowdisplaybreaks[4]
\ctex_after_end_preamble:n
  {
    % 公式前的距离
    \skip_set:Nn \abovedisplayskip { 5pt plus 1pt minus 1pt }
    % 公式后的距离
    \skip_set:Nn \belowdisplayskip { 5pt plus 1pt minus 1pt }
    % 公式前与文本的距离
    \skip_set:Nn \abovedisplayshortskip { 0pt }
    % 公式后与文本的距离
    \skip_set:Nn \belowdisplayshortskip { 5pt plus 1pt minus 1pt }
  }

%% ===================================================================
%% 分别设置浮动体 \env{figure} 和 \env{table} 的标题样式。
%% ===================================================================
\DeclareCaptionLabelSeparator{ ccwd }{ \hspace{ 0.5\ccwd } }
\DeclareCaptionLabelFormat{ parens }{ \bothIfFirst{ #1 }{ ~ }( #2 ) }
\DeclareCaptionFont{ nwafu@table@font     }{ \small }
\DeclareCaptionFont{ nwafu@figure@font    }{ \small }
\DeclareCaptionFont{ nwafu@subtable@font  }{ \small }
\DeclareCaptionFont{ nwafu@subfigure@font }{ \small }
% 图表题注设置。
\captionsetup
  {
    format          = hang,
    font            = { stretch = 1 },
    labelsep        = ccwd,
    singlelinecheck = true,
    skip            = 4bp,
  }
% 图表题注字体设置。
\captionsetup[ table     ]{ font += nwafu@table@font  }
\captionsetup[ figure    ]{ font += nwafu@figure@font }
% 子图题注设置。
\captionsetup[ subfigure ]
  {
    labelformat = parens,
    font        = nwafu@subfigure@font,
    belowskip   = 2pt,
    aboveskip   = 6pt
  }

% 在环境结束前最后执行，对环境中所有内容有效
\AddToHook { env / figure / end }
  { \centering }
\AddToHook { env / table / end }
  { \centering }

%% ===================================================================
%% 图表编号格式
%% ===================================================================
\cs_set:Npn \thefigure
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类，图编号的父计数器为章编号
        \thechapter - \__nwafu_arabic:n { figure }
      }
      {
        % ctexart文档类，图编号的无父计数器编号
        \__nwafu_arabic:n { figure }
      }
  }
\cs_set:Npn \thetable
  {
    \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
      {
        % ctexbook文档类，表编号的父计数器为章编号
        \thechapter - \__nwafu_arabic:n { table }
      }
      {
        % ctexart文档类，表编号的无父计数器编号
        \__nwafu_arabic:n { table }
      }
  }

%% ===================================================================
%% 设置表格行距和字号。
%% ===================================================================
% 注意：\cs{linespread}|{|1.05|}|需要在 \cs{small}\cs{selectfont} 之前使用，
% 这样行距倍数会基于 \cs{small} 字号计算。
\__nwafu_at_begin_environment:nn { tabular }
  {
    \exp_args:Nx \linespread { 1.15 }
    \small\selectfont\ignorespaces
  }

% 设置tabularray的tblr环境的默认参数
\SetTblrDefault
  {
    cells      = { font = \small },
    stretch    = 0.90,
    rowsep     = 0pt,
    colsep     = 6pt,
    hline      = { \lightrulewidth },
    vline      = { \lightrulewidth },
    hline{1,Z} = { \heavyrulewidth, solid },
  }

% 设置tabularray的talltblr和longtblr的新式
\DefTblrTemplate{ caption-tag   }{ default }{ 表\hspace{0.25em}\thetable }
\DefTblrTemplate{ contfoot-text }{ default }{ 接下页                     }
\DefTblrTemplate{ caption-sep   }{ default }{ \enskip                    }
\DefTblrTemplate{ conthead-text }{ default }{ \!（续）                   }

\NewTblrTheme{fancy}{
    \SetTblrStyle{ firsthead, mddlehead, lasthead }{ font = \centering\small }
    \SetTblrStyle{ firstfoot  }{ font = \small }
    \SetTblrStyle{ middlefoot }{ font = \small }
    \SetTblrStyle{ lastfoot   }{ font = \small }
  }

% 设置talltblr和longtblr环境的内部参数
\SetTblrInner[talltblr, longtblr]{
    hline      = { \lightrulewidth },
    vline      = { \lightrulewidth },
    hline{1,Z} = { \heavyrulewidth, solid },
    cells      = {font = \small},
    rowhead    = 1,
    stretch    = 0.90,
    rowsep     = 0pt,
    colsep     = 6pt,
  }

% 为tabularray宏包引入booktabs库
\UseTblrLibrary{booktabs}

%% ===================================================================
%% enumitem宏包的列表环境设置
%% ===================================================================
% 定义标签格式
\cs_new_protected:Npn \__nwafu_enumitem_label_set:nn #1#2
  { \SetEnumitemValue{ label }{ #1 }{ #2 } }

% 循环定义标签格式
\clist_map_inline:nn
  {
    { bullet   } { \textbullet                                                       },
    { endash   } { \normalfont\bfseries\textendash                                   },
    { asterisk } { \textasteriskcentered                                             },
    { numeric  } { \arabic*. \enskip                                                 },
    { arabic   } { \c__nwafu_fwid_left_paren_tl\arabic*\c__nwafu_fwid_right_paren_tl },
    { alph     } { \c__nwafu_fwid_left_paren_tl\alph*\c__nwafu_fwid_right_paren_tl   },
    { roman    } { \c__nwafu_fwid_left_paren_tl\roman*\c__nwafu_fwid_right_paren_tl  },
    { outline  } { \upshape\ding{111}                                                }
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
\setlist[itemize,1]{ label = bullet   }
\setlist[itemize,2]{ label = endash   }
\setlist[itemize,3]{ label = asterisk }
\int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
  {
    \setlist[enumerate,1]{label = numeric, ref = \arabic*}
    \setlist[enumerate,2]{label = arabic, ref = enumii}
    \setlist[enumerate,3]{label = alph, ref = enumiii, labelwidth = *}
  }
  {
    \setlist[enumerate,1]{label = arabic, ref = \arabic*}
    \setlist[enumerate,2]{label = alph, ref = enumii}
    \setlist[enumerate,3]{label = roman, ref = enumiii, labelwidth = *}
  }
\setlist[description]{font = sf, labelwidth = *, leftmargin = 2\ccwd}

%% ===================================================================
% hyperref宏包的设置
%% ===================================================================
% hyperref宏包是在导言区之后才引入的。若要在导言区中使用 \hypersetup 命令，必须另行定义。
\NewDocumentCommand \hypersetup { m }
  { \nwafu_hyperref_setup:n { #1 } }
\cs_new_protected:Npn \nwafu_hyperref_setup:n #1
  { \clist_gput_right:Nn \g__nwafu_to_hyperref_clist { #1 } }

% 设置超链接颜色选项。最后的逗号用于确保l3keys可以正确解析，不能省去。
\cs_new:Npn \__nwafu_set_hyperlink_color_key:n #1
  {
    hyperlink-color / \clist_item:nn { #1 } { 1 } .code:n =
      {
        \__nwafu_define_hyperlink_color:nnn
          { \clist_item:nn { #1 } { 2 } }
          { \clist_item:nn { #1 } { 3 } }
          { \clist_item:nn { #1 } { 4 } }
        \nwafu_hyperref_setup:n
          {
            linkcolor = nwafu@link, linkbordercolor = nwafu@link,
            urlcolor  = nwafu@url,  urlbordercolor  = nwafu@url,
            citecolor = nwafu@cite, citebordercolor = nwafu@cite
          }
      },
  }

% 定义超链接颜色。
\cs_new_protected:Npn \__nwafu_define_hyperlink_color:nnn #1#2#3
  {
    \definecolorset { HTML } { nwafu@ } { }
      { link, #1; url, #2; cite, #3 }
  }

% 定义超链接样式选项
\keys_define:nx { nwafu / style }
  {
    hyperlink .choice:,
    hyperlink .value_required:n = true,
    hyperlink / border .code:n  = { },
    hyperlink / color  .code:n  =
      { \nwafu_hyperref_setup:n { colorlinks = true } },
    hyperlink / none   .code:n  =
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

% 允许 URL 在字母、数字和一些特殊符号处断行。见https://bit.ly/2hhIjLW
\cs_new:Npn \nwafu_allow_url_break:
  {
    \cs_new:Npn \__nwafu_add_url_break_points:
      { \tl_map_function:NN \c__nwafu_url_break_points_tl \do }
    \__nwafu_appto_cmd:Nn \UrlBreaks
      { \UrlOrds \__nwafu_add_url_break_points: }
  }

% 额外的断行位置是 26 个英文字母（大小写）以及 10 个阿拉伯数字。
\tl_const:Nn \c__nwafu_url_break_points_tl
  {
    abcdefghijklmnopqrstuvwxyz
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    0123456789
  }

% 在导言区末尾引入 hyperref 宏包。
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
        pdftitle          = \l_tmpa_tl,
        pdfauthor         = \l__nwafu_info_author_tl,
        pdfkeywords       = \l__nwafu_abstract_keywords_clist,
        pdfcreator        = \c__nwafu_label_pdf_creator_tl,
      }
    \exp_args:NV \hypersetup \g__nwafu_to_hyperref_clist
    \nwafu_allow_url_break:
    \BiblatexManualHyperrefOn
  }

% 在 PDF 字符串中设置 \nwafu@kai 命令为空，以抑制 hyperref 的警告信息。
\ctex_at_end_package:nn { hyperref }
  {
    \pdfstringdefDisableCommands
      {
        \cs_set_eq:NN \nwafu@kai \prg_do_nothing:
        \cs_set_eq:NN \quad      \c_space_tl
        \cs_set_eq:NN \qquad     \c_space_tl
      }
  }

%% ===================================================================
%$ 引用标题配置。
%% ===================================================================
\int_compare:nNnT { \g__nwafu_paper_type_int } = { 3 }
  {
    \labelformat{chapter}{\CTEXthechapter}
  }
\labelformat{figure}{ \figurename~#1 }
\labelformat{table}{ \tablename~#1 }
\def\figureautorefname{ 图 }
\def\tableautorefname{ 表 }
\keys_set_known:nn { ctex }
  {
    figurename          = 图,
    tablename           = 表,
  }
\labelformat{equation}{式( #1 )}
\labelformat{section}{第 #1 节}
\labelformat{subsection}{第 #1 小节}

%% ===================================================================
%% 定义元（meta）键值对。
%% ===================================================================
%   .meta:nn 是一个元键（meta key），它的作用是：
%   将当前模块（nwafu）的选项映射到子模块（nwafu/abstract、nwafu/info、nwafu/style）
%   实现选项的分层管理和简化调用
\keys_define:nn { nwafu }
  {
    abstract  .meta:nn = { nwafu / abstract } { #1 },
    info      .meta:nn = { nwafu / info     } { #1 },
    style     .meta:nn = { nwafu / style    } { #1 }
  }

%% ===================================================================
% 部分选项默认值
%% ===================================================================
\keys_set:nn { nwafu }
  {
    style   / font-size       = -4,
    style   / fullwidth-stop  = false,
    style   / footnote-style  = circled,
    style   / hyperlink       = none,
    style   / hyperlink-color = default,
    theorem / header-font     = { \sffamily },
    theorem / body-font       = { \nwafu@kai },
    theorem / counter         = {
                                  \int_compare:nNnTF { \g__nwafu_paper_type_int } = { 3 }
                                    { chapter }
                                    { section }
                                },
  }

%% ===================================================================
%% 定义参数设置用户接口
%% ===================================================================
\NewDocumentCommand \nwafuset { m }
  { \keys_set:nn { nwafu } { #1 } }

%% ===================================================================
%% 处理用户配置文件
%% ===================================================================
% 判断用户在文档类选项中设置了用户配置文件
\tl_if_empty:NTF \g__nwafu_config_file_tl
  {
    % 未使用配置文件
    \file_if_exist:nTF { nwafupaper.def }
      {
        % 当前路径下有默认配置文件
        \file_input:n { nwafupaper.def }
      }
      {
        % 当前路径下无配置文件，采用默认配置
        % 学校名称tl常量，存储"西北农林科技大学"学校名称
        \tl_const:Nn \c__nwafu_label_simp_tl { 西北农林科技大学 }

        % 文档类型clist常量，可以通过索引输出"课程设计"等名称，
        % 可以根据需要修改，但目前仅支持3类，分别用编号1、2、3获取
        %   1. 编号1对应课程设计，基于ctexart实现，章节最高级别为\section（节）
        %   2. 编号2对应课程论文，基于ctexart实现，章节最高级别为\section（节）
        %   3. 编号3对应实习报告，基于ctexbook实现，章节最高级别为\part（部分），实际用到\chaper（章）
        \clist_const:Nn \c__nwafu_paper_type_clist
          { 课程设计, 课程论文, 实习报告 }

        % 封面作者信息驱动数据clist列表
        %   字段格式：{标签}{内容}{标记}
        %   字段标记：0=普通, 1=导师(需格式化), 2=合作导师(需格式化)
        \clist_const:Nn \c__nwafu_cover_info_clist
          {
            { \c__nwafu_label_student_id_tl   } { \l__nwafu_info_student_id_tl   } { 0 },
            { \c__nwafu_label_author_tl       } { \l__nwafu_info_author_tl       } { 0 },
            { \c__nwafu_label_major_tl        } { \l__nwafu_info_major_tl        } { 0 },
            { \c__nwafu_label_class_id_tl     } { \l__nwafu_info_class_id_tl     } { 0 },
            { \c__nwafu_label_supervisor_tl   } { \l__nwafu_info_supervisor_tl   } { 1 },
            { \c__nwafu_label_cosupervisor_tl } { \l__nwafu_info_cosupervisor_tl } { 1 },
          }

        % 封面元素声明驱动数据clist列表
        %   字段格式：{<名称>}{<内容>}{<格式>}{<底部间距>}{<对齐方式>}
        %   对齐方式: left, right, center, normal
        % 说明：
        %   如不需要底部间距可使用\c_zero_skip，但不可留白，否则会造成编译错误。
        \clist_const:Nn \c__nwafu_cover_elements_clist
          {
            { logo      } { \__nwafu_cover_logo: }
                          {  }
                          { -65 pt plus 0.3 fill }
                          { center },
            { depart    } { \__nwafu_department_name: }
                          { \bfseries \nwafu@kai \zihao { 2 } }
                          { -25 pt }
                          { center },
            { subject   } { \__nwafu_subject_name: }
                          { \bfseries \nwafu@kai \zihao { 1 } }
                          { 15 pt plus 0.3 fill }
                          { center },
            { title     } { \l__nwafu_info_title_tl }
                          { \sffamily \zihao { 2 } }
                          { 25 pt plus 0.3 fill }
                          { center },
            { info      } { \__nwafu_cover_info: }
                          { \__nwafu_line_spread:n {1.60} \nwafu@hei \zihao { 3 } }
                          { 53 pt plus 0.3 fill }
                          { center },
            { date      } { \l__nwafu_info_date_tl }
                          { \nwafu@hei \large }
                          { 0 pt plus 0.3 fill }
                          { center }
          }

        % 封面构成元素名称驱动数据tl常量
        % 各元素名称需是元素声明驱动数据clist列表中声明的元素名称
        \tl_const:Nn \c__nwafu_cover_contents_tl
          { logo, depart, subject, title, info, date }

        % 摘要、目录、插图与附表目录、符号表、术语表等前料排版流程
        \clist_const:Nn \c__nwafu_frontmatter_clist
          {
            { \__nwafu_front_component_abstract:    }, % 摘要
            { \__nwafu_front_component_toc:         }, % 目录
            { \__nwafu_front_component_figtab:      }, % 插图与附表清单
            { \__nwafu_front_component_notation:    }, % 符号表
            { \__nwafu_front_component_terminology: }  % 术语表
          }

        % logo文件名(包含路径)及缩放系数
        \keys_set:nn { nwafu }
          {
            style   / logo            = { logo/nwafu-bar.pdf },
            style   / logo-size       = 0.35,
          }
      }
  }
  {
    % 使用指定配置文件
    \file_input:V \g__nwafu_config_file_tl
  }

%% ===================================================================
%% 定义定理类环境
%% ===================================================================
\newtheorem* { proof       } { \c__nwafu_label_proof_tl      }
\newtheorem  { axiom       } { \c__nwafu_label_axiom_tl      }
\newtheorem  { corollary   } { \c__nwafu_label_corollary_tl  }
\newtheorem  { definition  } { \c__nwafu_label_definition_tl }
\newtheorem  { example     } { \c__nwafu_label_example_tl    }
\newtheorem  { lemma       } { \c__nwafu_label_lemma_tl      }
\newtheorem  { theorem     } { \c__nwafu_label_theorem_tl    }

%% ===================================================================
%% 定义\emph强调命令的格式为揩体
%% ===================================================================
\DeclareEmphSequence
  {
    \bfseries,
    \upshape \CJKfamily { \CJKfamilydefault },
  }

%% ===================================================================
%% 定义实习日志排版环境用户接口
%% ===================================================================
% 环境参数：
%   {#1} 日期，必选项，输入格式：yyyy/mm/dd
%   [#2] 标题，可选项
% 说明：调用 zhnumber 宏包的\zhdate*命令输出带星期的中文格式日期
\NewDocumentEnvironment { internlog } { m o }
  {
    \group_begin:
      \IfNoValueTF{ #2 }%
        { \group_begin: \bfseries\nwafu@hei{}\zhdate*{ #1 } \group_end: \par }
        { \group_begin: \bfseries\nwafu@hei{}\zhdate*{ #1 }：#2 \group_end: \par }
  }
  {
    \group_end:
  }

\endinput
%%
%% End of file `nwafupaper.cls'.
