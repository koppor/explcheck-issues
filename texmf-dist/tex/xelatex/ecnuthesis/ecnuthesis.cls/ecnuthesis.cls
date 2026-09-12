%%
%% This is file `ecnuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ecnuthesis.dtx  (with options: `class')
%% 
%%     Copyright (C) 2021--2026 by Koyamin <contact@koyamin.com>
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
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\GetIdInfo $Id: ecnuthesis.dtx 1.1 2026-05-28 15:00:00Z Koyamin <contact@koyamin.com> $
  {LaTeX Thesis Template for East China Normal University (ECNU)}
\ProvidesExplClass{\ExplFileName}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\RequirePackage { xparse, xtemplate, l3keys2e }
\msg_new:nnn { ecnuthesis } { engine-unsupportd }
  { \\
    This~ class~ requires~ XeTeX~ to~ compile. \\
    The~ engine~ "#1"~ is~ not~ supported.
  }
\sys_if_engine_xetex:F
  {
    \msg_fatal:nnx { ecnuthesis } { engine-unsupportd } { \c_sys_engine_str }
  }
\box_new:N   \l__ecnu_tmpa_box
\box_new:N   \l__ecnu_tmpb_box
\box_new:N   \l__ecnu_tmpc_box
\clist_new:N \l__ecnu_tmpa_clist
\clist_new:N \l__ecnu_tmpb_clist
\skip_new:N  \l__ecnu_tmpa_skip
\tl_new:N    \l__ecnu_tmpa_tl
\tl_new:N    \l__ecnu_tmpb_tl
\dim_new:N   \l__ecnu_tmpa_dim
\dim_new:N   \l__ecnu_tmpb_dim
\dim_new:N   \l__ecnu_tmpc_dim
\tl_new:N \g__ecnu_thesis_type_tl
\bool_new:N \g__ecnu_is_bachelor_bool
\bool_set_false:N \g__ecnu_is_bachelor_bool
\bool_new:N \g__ecnu_twoside_bool
\bool_set_false:N \g__ecnu_twoside_bool
\bool_new:N \g__ecnu_cover_page_bool
\bool_set_true:N \g__ecnu_cover_page_bool
\bool_new:N \g__ecnu_declaration_page_bool
\bool_set_false:N \g__ecnu_declaration_page_bool
\clist_new:N \g__ecnu_to_ctexrep_clist
\cs_new:Npn \__ecnu_quad:  { \skip_horizontal:n { 1 em } }
\cs_new:Npn \__ecnu_qquad: { \skip_horizontal:n { 2 em } }
\cs_new_protected:Npn \__ecnu_vspace:N #1
  {
    \dim_set_eq:NN \l__ecnu_tmpa_dim \prevdepth
    \hrule height \c_zero_dim
    \nobreak
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_skip
    \dim_set_eq:NN \prevdepth \l__ecnu_tmpa_dim
  }
\cs_new_protected:Npn \__ecnu_vspace:n #1
  {
    \skip_set:Nn \l__ecnu_tmpa_skip {#1}
    \__ecnu_vspace:N \l__ecnu_tmpa_skip
  }
\cs_generate_variant:Nn \__ecnu_vspace:N { c }
\cs_new:Npn \__ecnu_symbol:n #1 { \tex_char:D #1 \scan_stop: }
\cs_new:Npn \__ecnu_arabic:n #1
  { \int_to_arabic:v { c@ #1 } }
\cs_new_protected:Npn \__ecnu_gadd_ltxhook:nn #1#2
  { \hook_gput_code:nnn {#1} { . } {#2} }
\hook_gset_rule:nnnn { begindocument/before } { . } { < } { xeCJK }
\cs_new_protected:Npn \__ecnu_patch_cmd:Nnn #1#2#3
  {
    \ctex_patch_cmd_once:NnnnTF #1 { } {#2} {#3}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__ecnu_preto_cmd:Nn #1#2
  {
    \ctex_preto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__ecnu_appto_cmd:Nn #1#2
  {
    \ctex_appto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new:Npn \__ecnu_msg_new:nn  { \msg_new:nnn      { ecnuthesis } }
\cs_new:Npn \__ecnu_error:n     { \msg_error:nn     { ecnuthesis } }
\cs_new:Npn \__ecnu_error:nn    { \msg_error:nnn    { ecnuthesis } }
\cs_new:Npn \__ecnu_error:nx    { \msg_error:nnx    { ecnuthesis } }
\cs_new:Npn \__ecnu_error:nnn   { \msg_error:nnnn   { ecnuthesis } }
\cs_new:Npn \__ecnu_error:nnnn  { \msg_error:nnnnn  { ecnuthesis } }
\cs_new:Npn \__ecnu_warning:n   { \msg_warning:nn   { ecnuthesis } }
\cs_new:Npn \__ecnu_warning:nn  { \msg_warning:nnn  { ecnuthesis } }
\cs_new:Npn \__ecnu_warning:nxx { \msg_warning:nnxx { ecnuthesis } }
\cs_new:Npn \__ecnu_info:nx     { \msg_info:nnx     { ecnuthesis } }
\keys_define:nn { ecnu / option }
  {
    type        .choices:nn =
      { doctor, master, bachelor }
      {
        \tl_gset_eq:NN \g__ecnu_thesis_type_tl \l_keys_choice_tl
        \tl_if_eq:NnTF \l_keys_choice_tl { bachelor }
          { \bool_set_true:N \g__ecnu_is_bachelor_bool }
          { \bool_set_false:N \g__ecnu_is_bachelor_bool }
      },
    type .value_required:n  = true,
    type .initial:n         = master,
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n =
      {
        \clist_gput_right:Nn \g__ecnu_to_ctexrep_clist { oneside }
        \bool_gset_false:N   \g__ecnu_twoside_bool
      },
    twoside .code:n =
      {
        \clist_gput_right:Nn \g__ecnu_to_ctexrep_clist { twoside }
        \bool_gset_true:N    \g__ecnu_twoside_bool
      },
    cover         .bool_gset:N = \g__ecnu_cover_page_bool,
    cover         .default:n = { true },
    cover         .initial:n = { true },
    declaration   .bool_gset:N = \g__ecnu_declaration_page_bool,
    declaration   .default:n = { true },
    declaration   .initial:n = { false },
    unknown .code:n = { \__ecnu_error:n { unknown-option } }
  }
\__ecnu_msg_new:nn { unknown-option }
  { Class~ option~ "\l_keys_key_str"~ is~ unknown. }
\ProcessKeysOptions { ecnu / option }
\file_input:n { ecnuthesis.def }
\fp_const:Nn \c__ecnu_ug_line_spread_fp { 1.625 }
\fp_const:Nn \c__ecnu_pg_line_spread_fp
  { \dim_ratio:nn { 25 bp } { 12 bp } / 1.2 }
\fp_const:Nn \c__ecnu_single_space_line_spread_fp
  { \dim_ratio:nn { 15.6 bp } { 12 bp } / 1.2 }
\PassOptionsToClass
  {
    UTF8,
    heading     = true,
    zihao       = -4,
    fontset     = none,
    linespread  = \bool_if:NTF \g__ecnu_is_bachelor_bool
      { \c__ecnu_ug_line_spread_fp }
      { \c__ecnu_pg_line_spread_fp },
    \g__ecnu_to_ctexrep_clist,
  }
  { ctexrep }
\clist_map_inline:nn
  {
    { no-math           } { fontspec },
    { perpage           } { footmisc },
  }
  { \PassOptionsToPackage #1 }
\LoadClass { ctexrep }
\RequirePackage
  {
    amsmath,
    unicode-math,
    geometry,
    fancyhdr,
    footmisc,
    graphicx,
    caption,
    bicaption,
    xcolor,
    xeCJKfntef
  }
\bool_if:NTF \g__ecnu_is_bachelor_bool
  {
    \geometry
      {
        paper     = a4paper,
        top       = 2.5 cm,
        bottom    = 2.0 cm,
        left      = 3.0 cm,
        right     = 2.5 cm,
        headsep   = \dim_eval:n { 10 mm - 12.6713575 bp },
        footskip  = 6 mm
      }
  }
  {
    \geometry
      {
        paper     = a4paper,
        hmargin   = 1.25 in,
        vmargin   = 1 in,
        headsep   = \dim_eval:n { 1 in - 15 mm - 12.6713575 bp },
        footskip  = \dim_eval:n { 1 in - 17.5 mm }
      }
  }
\tl_new:N \g__ecnu_cjk_fontset_tl
\tl_new:N \g__ecnu_fontset_tl
\keys_define:nn { ecnu / style }
  {
    font  .choices:nn =
      { lm, times, xits }
      { \tl_gset_eq:NN \g__ecnu_fontset_tl \l_keys_choice_tl },
    font  .value_required:n = true,
    font  .initial:n  = lm
  }
\keys_define:nn { ecnu / style }
  {
    font-cjk  .choices:nn =
      { auto, fandol, mac, windows }
      {
        \tl_gset_eq:NN \g__ecnu_cjk_fontset_tl \l_keys_choice_tl
        \tl_if_eq:NnT \g__ecnu_cjk_fontset_tl { auto }
          {
            \sys_if_platform_windows:TF
              { \tl_gset:Nn \g__ecnu_cjk_fontset_tl { windows } }
              {
                \ctex_if_platform_macos:TF
                  { \tl_gset:Nn \g__ecnu_cjk_fontset_tl { mac    } }
                  { \tl_gset:Nn \g__ecnu_cjk_fontset_tl { fandol } }
              }
          }
      },
    font-cjk  .value_required:n = true,
    font-cjk  .initial:n  = auto
  }
\cs_new_protected:Npn \__ecnu_setmainfont:nn #1#2
  { \__fontspec_main_setmainfont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setsansfont:nn #1#2
  { \__fontspec_main_setsansfont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setmonofont:nn #1#2
  { \__fontspec_main_setmonofont:nn {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setmathfont:nn #1#2
  { \__um_setmathfont:nn {#2} {#1} }
\cs_new_eq:NN \__ecnu_set_family:nnn  \xeCJK_set_family:nnn
\cs_new_eq:NN \__ecnu_switch_family:n \xeCJK_switch_family:n
\cs_generate_variant:Nn \__ecnu_set_family:nnn { x }
\cs_new_protected:Npn \__ecnu_setCJKmainfont:nn #1#2
  { \__ecnu_set_family:xnn { \CJKrmdefault } {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setCJKsansfont:nn #1#2
  { \__ecnu_set_family:xnn { \CJKsfdefault } {#2} {#1} }
\cs_new_protected:Npn \__ecnu_setCJKmonofont:nn #1#2
  { \__ecnu_set_family:xnn { \CJKttdefault } {#2} {#1} }
\cs_new_protected:Npn \__ecnu_set_cjk_font_kai:nn #1#2
  { \__ecnu_set_family:nnn { ecnu@kai } {#2} {#1} }
\cs_new_protected:Npn \ecnu@kai
  { \__ecnu_switch_family:n { ecnu@kai } }
\tl_const:Nn \__ecnu_cjk_font_options:
 { UprightFont = *, ItalicFont = *, AutoFakeBold = true }
\cs_new_protected:Npx \__ecnu_setCJKmainfont:n   #1
  { \__ecnu_setCJKmainfont:nn   {#1} { \__ecnu_cjk_font_options: } }
\cs_new_protected:Npx \__ecnu_setCJKsansfont:n   #1
  { \__ecnu_setCJKsansfont:nn   {#1} { \__ecnu_cjk_font_options: } }
\cs_new_protected:Npx \__ecnu_setCJKmonofont:n   #1
  { \__ecnu_setCJKmonofont:nn   {#1} { \__ecnu_cjk_font_options: } }
\cs_new_protected:Npx \__ecnu_set_cjk_font_kai:n #1
  { \__ecnu_set_cjk_font_kai:nn {#1} { \__ecnu_cjk_font_options: } }
\cs_new_protected:Npn \__ecnu_set_font_helper:n #1
  {
    \exp_args:Nc \RenewDocumentCommand { set #1 font } { O { } m O { } }
      {
        \ctex_at_end_preamble:n
          { \use:c { __ecnu_set #1 font:nn } {##2} { ##1, ##3 } }
      }
  }
\clist_map_inline:nn { main, sans, mono, math }
  { \__ecnu_set_font_helper:n {#1} }
\clist_map_inline:nn { CJKmain, CJKsans, CJKmono }
  { \__ecnu_set_font_helper:n {#1} }
\cs_new_protected:Npn \__ecnu_load_font_times:
  {
    \__ecnu_setmainfont:nn { Times~ New~ Roman    } { }
    \__ecnu_setsansfont:nn { Arial                } { }
    \__ecnu_setmonofont:nn { Courier~ New         } { }
    \__ecnu_setmathfont:nn { XITSMath-Regular.otf }
      { BoldFont = XITSMath-Bold.otf }
  }
\cs_new_protected:Npn \__ecnu_load_font_xits:
  {
    \__ecnu_setmainfont:nn { XITS }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Italic,
        BoldItalicFont = *-BoldItalic,
      }
    \__ecnu_setsansfont:nn { texgyreheros }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic
      }
    \__ecnu_setmonofont:nn { texgyrecursor }
      {
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic,
        Ligatures      = CommonOff
      }
    \__ecnu_setmathfont:nn { XITSMath-Regular.otf }
      { BoldFont = XITSMath-Bold.otf }
  }
\cs_new_protected:Npn \__ecnu_load_font_lm:
  { \__ecnu_setmathfont:nn { latinmodern-math.otf } { } }
\cs_new_protected:Npn \__ecnu_load_cjk_font_fandol:
  {
    \__ecnu_setCJKmainfont:nn   { FandolSong }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__ecnu_setCJKsansfont:nn   { FandolHei  }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \__ecnu_setCJKmonofont:nn   { FandolFang }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular
      }
    \__ecnu_set_cjk_font_kai:nn { FandolKai  }
      {
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Regular,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Regular
      }
  }
\cs_new_protected:Npn \__ecnu_load_cjk_font_mac:
  {
    \__ecnu_setCJKmainfont:nn   { STSongti-SC }
      {
        UprightFont    = *-Light,
        BoldFont       = *-Bold,
        ItalicFont     = *-Light,
        BoldItalicFont = *-Bold
      }
    \__ecnu_setCJKsansfont:nn   { STHeitiSC   }
      {
        UprightFont    = *-Medium,
        BoldFont       = *-Medium,
        ItalicFont     = *-Medium,
        BoldItalicFont = *-Medium
      }
    \__ecnu_setCJKmonofont:n    { STFangsong  }
    \__ecnu_set_cjk_font_kai:nn { STKaitiSC   }
      {
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
  }
\cs_new_protected:Npn \__ecnu_load_cjk_font_windows:
  {
    \__ecnu_setCJKmainfont:n   { SimSun   }
    \__ecnu_setCJKsansfont:n   { SimHei   }
    \__ecnu_setCJKmonofont:n   { FangSong }
    \__ecnu_set_cjk_font_kai:n { KaiTi    }
  }
\cs_new_protected:Npn \__ecnu_load_font:
  {
    \use:c { __ecnu_load_font_ \g__ecnu_fontset_tl :         }
    \use:c { __ecnu_load_cjk_font_ \g__ecnu_cjk_fontset_tl : }
  }
\ctex_at_end_preamble:n { \__ecnu_load_font: }
\keys_set:nn { unicode-math }
  {
    math-style = ISO,
    bold-style = ISO,
  }
\DeclareEmphSequence
  {
    \itshape \ecnu@kai,
    \upshape \CJKfamily { \CJKfamilydefault },
  }
\setcounter{secnumdepth}{5}
\bool_if:NTF \g__ecnu_is_bachelor_bool
  {
    \keys_set:nn { ctex }
      {
        chapter = {
          format        = \sffamily\normalsize,
          pagestyle     = fancy,
          beforeskip    = 1ex,
          afterskip     = 2.5ex plus .2ex,
          fixskip       = true,
          tocline       = {\CTEXifname{\protect\numberline{\CTEXthechapter}}{}#2}
        },
        section = {
          format        = \sffamily\normalsize,
          beforeskip    = 2.5ex plus 1ex minus .2ex,
          afterskip     = 2.5ex plus .2ex,
          fixskip       = true,
        },
        subsection = {
          format        = \sffamily\normalsize,
          beforeskip    = 2.5ex plus 1ex minus .2ex,
          afterskip     = 2.5ex plus .2ex,
          indent        = 1 em,
          fixskip       = true,
        },
        subsubsection   = {
          format        = \sffamily\normalsize,
          beforeskip    = 2.5ex plus 1ex minus .2ex,
          afterskip     = 2.5ex plus .2ex,
          indent        = 2 em,
          fixskip       = true,
        },
        paragraph = {
          format        = \sffamily\normalsize,
          beforeskip    = 2.5ex plus 1ex minus .2ex,
          afterskip     = 2.5ex plus .2ex,
          runin         = false,
          fixskip       = true,
        },
      }
  }
  {
    \keys_set:nn { ctex }
      {
        chapter = {
          format        = \zihao {3} \sffamily \bfseries \centering,
          pagestyle     = fancy,
          beforeskip    = 4ex,
          afterskip     = 6ex,
          fixskip       = true,
          tocline       = { \CTEXifname{\protect\numberline{\CTEXthechapter}}{}#2 }
        },
        section = {
          format        = \zihao {4} \bfseries \sffamily,
          beforeskip    = 3.5ex plus 1ex minus .2ex,
          afterskip     = 3.5ex plus .2ex,
          fixskip       = true,
          tocline       = { \CTEXnumberline {#1} #2 },
        },
        subsection = {
          format        = \bfseries \sffamily \normalsize,
          beforeskip    = 3.5ex plus 1ex minus .2ex,
          afterskip     = 3.5ex plus .2ex,
          fixskip       = true,
        },
        subsubsection   = {
          format        = \sffamily \normalsize,
          beforeskip    = 3.5ex plus 1ex minus .2ex,
          afterskip     = 3ex plus .2ex,
          indent        = 0em,
          fixskip       = true,
        },
        paragraph = {
          format        = \sffamily \normalsize,
          beforeskip    = 3.5ex plus 1ex minus .2ex,
          afterskip     = 3ex plus .2ex,
          indent        = 2em,
          runin         = false,
          fixskip       = true,
        },
      }
  }
\tl_new:N \g__ecnu_numbering_tl
\keys_define:nn { ecnu / style }
  {
    numbering .choice:,
    numbering / arabic  .code:n =
      {
        \tl_gset:Nn \g__ecnu_numbering_tl { arabic }
        \bool_if:NTF \g__ecnu_is_bachelor_bool
          {
            \keys_set:nn { ctex }
              {
                chapter = {
                  name          = {,、},
                  number        = {\arabic{chapter}},
                  numberformat  = \rmfamily,
                  aftername     = ,
                },
                section = {
                  name          = {,},
                  number        = {\arabic{chapter}.\arabic{section}},
                  numberformat  = \rmfamily,
                },
                subsection = {
                  name          = {,},
                  number        =
                    {\arabic{chapter}.\arabic{section}.\arabic{subsection}},
                  numberformat  = \rmfamily,
                },
                subsubsection = {
                  name          = {,},
                  number        =
                    {
                      \arabic{chapter}.\arabic{section}.
                      \arabic{subsection}.\arabic{subsubsection}
                    },
                  numberformat  = \rmfamily,
                  indent        = 2 em,
                },
                paragraph = {
                  name          = {,）},
                  number        = {\arabic{paragraph}},
                  numberformat  = \rmfamily,
                  aftername     = ,
                  indent        = 3 em,
                }
              }
          }
          {
            \keys_set:nn { ctex }
              {
                chapter = {
                  name          = {第,章},
                  number        = {\chinese{chapter}},
                },
                section = {
                  name          = {,},
                  number        = {\arabic{chapter}.\arabic{section}},
                  numberformat  = \rmfamily,
                },
                subsection = {
                  name          = {,},
                  number        =
                    {\arabic{chapter}.\arabic{section}.\arabic{subsection}},
                  numberformat  = \rmfamily,
                },
                subsubsection = {
                  name          = {,},
                  number        =
                    {
                      \arabic{chapter}.\arabic{section}.
                      \arabic{subsection}.\arabic{subsubsection}
                    },
                  numberformat  = \rmfamily,
                },
                paragraph = {
                  name          = {,）},
                  number        = {\arabic{paragraph}},
                  numberformat  = \rmfamily,
                  aftername     = ,
                }
              }
          }
      },
    numbering / chinese .code:n =
      {
        \tl_gset:Nn \g__ecnu_numbering_tl { chinese }
        \bool_if:NTF \g__ecnu_is_bachelor_bool
          {
            \keys_set:nn { ctex }
              {
                chapter = {
                  name          = {,、},
                  number        = {\chinese{chapter}},
                  numberformat  = \sffamily,
                },
                section = {
                  name          = {（,）},
                  number        = {\chinese{section}},
                  numberformat  = \sffamily,
                  aftername     = ,
                },
                subsection = {
                  name          = {,.},
                  number        = {\arabic{subsection}},
                  indent        = 2 em,
                },
                subsubsection = {
                  name          = {（,）},
                  number        = {\arabic{subsubsection}},
                  aftername     = {\ },
                  indent        = 2 em,
                },
                paragraph = {
                  name          = {,）},
                  number        = {\arabic{paragraph}},
                  aftername     = ,
                  indent        = 4 em,
                }
              }
          }
          {
            \keys_set:nn { ctex }
              {
                chapter = {
                  name          = {第,章},
                  number        = {\chinese{chapter}},
                  numberformat  = \sffamily,
                },
                section = {
                  name          = {第,节},
                  number        = {\chinese{section}},
                  numberformat  = \sffamily,
                },
                subsection = {
                  name          = {,、},
                  number        = {\chinese{subsection}},
                  numberformat  = \sffamily,
                  aftername     = ,
                },
                subsubsection = {
                  name          = {（,）},
                  number        = {\chinese{subsubsection}},
                  numberformat  = \sffamily,
                  aftername     = ,
                },
                paragraph = {
                  name          = {,）},
                  number        = {\arabic{paragraph}},
                  numberformat  = \rmfamily,
                  aftername     = ,
                }
              }
          }
        },
    numbering / unknown   .code:n = { \__ecnu_error:n { unknown-value } },
    numbering .value_required:n = true,
    numbering .initial:n = arabic
  }
\__ecnu_msg_new:nn { unknown-value }
  { The~ value~ "\l_keys_value_tl"~ is~ unknown. }
\cs_new_eq:NN \__ecnu_pdf_bookmark:nn \use_none:nn
\fancyhf { }
\cs_new_protected:Npn \__ecnu_pg_header_content:
  {
    \prop_get:NVN \c__ecnu_thesis_type_prop
      \g__ecnu_thesis_type_tl \l__ecnu_tmpa_tl
    \c__ecnu_university_name_tl \l__ecnu_tmpa_tl
    \tl_if_eq:NnT \l__ecnu_info_degree_type_tl
      { professional } { \c__ecnu_professional_tl }
    \c__ecnu_degree_tl \c__ecnu_thesis_tl
  }
\bool_if:NTF \g__ecnu_is_bachelor_bool
  {
    \fancyhead[C]
      {
        \footnotesize \sffamily
        \l__ecnu_info_title_trim_tl
      }
    \fancyfoot[C] { \footnotesize \thepage }
  }
  {
    \fancyhead[C] { \footnotesize \__ecnu_pg_header_content: }
    \bool_if:NTF \g__ecnu_twoside_bool
      { \fancyfoot[LE,RO] { \footnotesize \thepage } }
      { \fancyfoot[C] { \footnotesize \thepage } }
  }
\RenewDocumentCommand \headrulewidth { } { 0.5 bp }
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__ecnu_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
  }
\pagestyle { fancy }
\cs_new_protected:Npn \__ecnu_define_fn_style:nn #1#2
  { \tl_const:cn { c__ecnu_fn_style_ #1 _tl } {#2} }
\clist_map_inline:nn
  {
    { plain       } { plain       },
    { xits        } { xits        },
    { libertinus  } { libertinus  },
  }
  { \__ecnu_define_fn_style:nn #1 }
\tl_new:N \l__ecnu_fn_style_tl
\keys_define:nn { ecnu / style }
  {
    footnote  .choices:nn = { plain, xits, libertinus }
      {
        \tl_set_eq:NN \l__ecnu_fn_style_tl \l_keys_choice_tl
      },
    footnote  .value_required:n = true,
    footnote  .initial:n = plain
  }
\cs_new:Npn \__ecnu_fn_symbol_libertinus:n #1
  {
    \int_compare:nTF { #1 >= 21 }
      {
        \int_compare:nTF { #1 >= 47 }
          { \__ecnu_symbol:n { \int_eval:n { "24B6 - 47 + #1 } } }
          { \__ecnu_symbol:n { \int_eval:n { "24D0 - 21 + #1 } } }
      }
      { \__ecnu_symbol:n { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_new:Npn \__ecnu_fn_symbol_xits:n #1
  {
    \int_compare:nTF { #1 >= 10 }
      {
        \int_compare:nTF { #1 >= 36 }
          { \__ecnu_symbol:n { \int_eval:n { "24B6 - 36 + #1 } } }
          { \__ecnu_symbol:n { \int_eval:n { "24D0 - 10 + #1 } } }
      }
      { \__ecnu_symbol:n { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_set:Npn \thefootnote { \__ecnu_footnote_number:N \c@footnote }
\cs_new:Npn \__ecnu_footnote_number:N #1
  {
    \tl_case:NnF \l__ecnu_fn_style_tl
      {
        \c__ecnu_fn_style_plain_tl
          { \int_use:N #1 }
        \c__ecnu_fn_style_xits_tl
          {
            \fontspec { XITS-Regular.otf }
            \__ecnu_fn_symbol_xits:n { #1 }
          }
        \c__ecnu_fn_style_libertinus_tl
          {
            \fontspec { LibertinusSerif-Regular.otf }
            \__ecnu_fn_symbol_libertinus:n { #1 }
          }
      }
      { \int_use:N #1 }
  }
\cs_set:Npn \@makefntext #1
  {
    \dim_set:Nn \parindent
      { \bool_if:NTF \g__ecnu_is_bachelor_bool { 0 em } { 2 em } }
    \mode_leave_vertical:
    \textsuperscript{\@thefnmark} #1
  }
\captionsetup
  {
    font          = small,
    labelsep      = quad,
    justification = centering
  }
\captionsetup [ figure ] [ bi-second ] { name=Figure }
\captionsetup [ table  ] [ bi-second ] { name=Table  }
\bool_if:NT \g__ecnu_is_bachelor_bool
  {
    \cs_set:Npn \thefigure
      {  \thechapter - \int_to_arabic:n { \c@figure } }
    \cs_set:Npn \thetable
      {  \thechapter - \int_to_arabic:n { \c@table  } }
  }
\clist_map_inline:nn
  {
    title, title_en,
    author, author_en,
    student_id,
    department, department_en,
    major, major_en,
    supervisor, supervisor_en,
    field, field_en,
    academic_title
  }
  { \tl_new:c { l__ecnu_info_ #1 _tl } }
\clist_new:N \l__ecnu_info_keywords_clist
\clist_new:N \l__ecnu_info_keywords_en_clist
\tl_new:N \l__ecnu_info_degree_type_tl
\tl_new:N \l__ecnu_info_cic_index_tl
\tl_new:N \l__ecnu_info_secret_level_tl
\int_new:N   \l__ecnu_info_year_int
\int_new:N   \l__ecnu_info_month_int
\int_new:N   \l__ecnu_info_graduation_year_int
\tl_new:N \l__ecnu_info_title_trim_tl
\tl_new:N \l__ecnu_info_title_en_trim_tl
\cs_generate_variant:Nn \regex_replace_all:nnN { nnc }
\cs_new_protected:Npn \__ecnu_set_title:nn #1#2
  {
    \tl_set:cn { l__ecnu_info_ #1 _tl      } {#2}
    \tl_set:cn { l__ecnu_info_ #1 _trim_tl } {#2}
    \tl_replace_all:cnn { l__ecnu_info_ #1 _trim_tl } { \\ } { ~ }
    \regex_replace_all:nnc
      { \s+ } { \ }
      { l__ecnu_info_ #1 _trim_tl }
    \regex_replace_all:nnc
      { ([\x{4e00}-\x{9fff}]) \s+ ([\x{4e00}-\x{9fff}]) } { \1 \2 }
      { l__ecnu_info_ #1 _trim_tl }
  }
\keys_define:nn { ecnu / info }
  {
    degree          .choices:nn   =
      { academic, professional }
      { \tl_set_eq:NN \l__ecnu_info_degree_type_tl \l_keys_choice_tl },
    degree          .value_required:n = true,
    degree          .initial:n = academic,
    clc             .tl_set:N     = \l__ecnu_info_cic_index_tl,
    secret-level    .tl_set:N     = \l__ecnu_info_secret_level_tl,
    title           .code:n       = { \__ecnu_set_title:nn { title    } {#1} },
    title-en        .code:n       = { \__ecnu_set_title:nn { title_en } {#1} },
    author          .tl_set:N     = \l__ecnu_info_author_tl,
    author-en       .tl_set:N     = \l__ecnu_info_author_en_tl,
    student-id      .tl_set:N     = \l__ecnu_info_student_id_tl,
    department      .tl_set:N     = \l__ecnu_info_department_tl,
    department-en   .tl_set:N     = \l__ecnu_info_department_en_tl,
    major           .tl_set:N     = \l__ecnu_info_major_tl,
    major-en        .tl_set:N     = \l__ecnu_info_major_en_tl,
    field           .tl_set:N     = \l__ecnu_info_field_tl,
    field-en        .tl_set:N     = \l__ecnu_info_field_en_tl,
    supervisor      .tl_set:N     = \l__ecnu_info_supervisor_tl,
    supervisor-en   .tl_set:N     = \l__ecnu_info_supervisor_en_tl,
    academic-title   .tl_set:N     = \l__ecnu_info_academic_title_tl,
    keywords        .clist_set:N  = \l__ecnu_info_keywords_clist,
    keywords-en     .clist_set:N  = \l__ecnu_info_keywords_en_clist,
    year            .int_set:N    = \l__ecnu_info_year_int,
    month           .int_set:N    = \l__ecnu_info_month_int,
    graduation-year .int_set:N    = \l__ecnu_info_graduation_year_int,
  }
\NewDocumentCommand \theyear { }
  {
    \int_compare:nNnTF { \l__ecnu_info_year_int } = { \c_zero_int }
      { \int_set_eq:NN \l__ecnu_info_year_int \c_sys_year_int }
      { }
    \int_use:N \l__ecnu_info_year_int
  }
\NewDocumentCommand \themonth { }
  {
    \int_compare:nNnTF { \l__ecnu_info_month_int } = { \c_zero_int }
      { \int_set_eq:NN \l__ecnu_info_month_int \c_sys_month_int }
      { }
    \int_use:N \l__ecnu_info_month_int
  }
\NewDocumentCommand \graduationyear { }
  {
    \int_compare:nNnTF { \l__ecnu_info_graduation_year_int } = { \c_zero_int }
      {
        \int_compare:nNnTF { \l__ecnu_info_year_int } = { \c_zero_int }
          {
            \int_set_eq:NN  \l__ecnu_info_graduation_year_int
                            \c_sys_year_int
          }
          {
            \int_set_eq:NN  \l__ecnu_info_graduation_year_int
                            \l__ecnu_info_year_int
          }
      }
      { }
    \int_use:N  \l__ecnu_info_graduation_year_int
  }
\cs_new_protected:Npn \__ecnu_spread_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \tl_map_inline:nn {#2} { ##1 \hfil } \unskip }
  }
\cs_generate_variant:Nn \__ecnu_spread_box:nn { no }
\cs_new_protected:Npn \__ecnu_center_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \hfil #2 \hfil }
  }
\cs_generate_variant:Nn \__ecnu_center_box:nn { Vn }
\cs_new_protected:Npn \__ecnu_right_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \hfil #2 }
  }
\cs_generate_variant:Nn \__ecnu_right_box:nn { no }
\cs_new:Npn \__ecnu_fixed_width_box:nn #1#2
  { \parbox {#1} {#2} }
\cs_new:Npn \__ecnu_fixed_width_align_top_box:nn #1#2
  { \parbox [t] {#1} {#2} }
\cs_new:Npn \__ecnu_fixed_width_center_box:nn #1#2
  { \parbox {#1} { \centering #2 } }
\cs_new:Npn \__ecnu_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__ecnu_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__ecnu_tmpa_box }
  }
\cs_generate_variant:Nn \__ecnu_get_text_width:Nn { NV }
\cs_new:Npn \__ecnu_line_spread:N #1
  { \linespread { \fp_use:N #1 } \selectfont }
\cs_new:Npn \__ecnu_line_spread:n #1
  { \linespread {#1} \selectfont }
\bool_if:NF \g__ecnu_is_bachelor_bool
  { \RenewDocumentCommand \ULthickness { } { 0.5 pt } }
\cs_new_protected:Npn \__ecnu_cover_ug_thesis_info:
  {
    \prop_get:NVN \c__ecnu_thesis_type_prop
      \g__ecnu_thesis_type_tl \l__ecnu_tmpa_tl
    \graduationyear \c__ecnu_graduation_year_tl
    \c__ecnu_undergraduate_tl \l__ecnu_tmpa_tl
    \c__ecnu_degree_tl \c__ecnu_thesis_tl
  }
\cs_new_protected:Npn \__ecnu_cover_pg_thesis_info:
  {
    \prop_get:NVN \c__ecnu_thesis_type_prop
      \g__ecnu_thesis_type_tl \l__ecnu_tmpa_tl
    \graduationyear \c__ecnu_graduation_year_tl
    \tl_if_eq:NnTF \l__ecnu_info_degree_type_tl { professional }
      {
        \l__ecnu_tmpa_tl \c__ecnu_professional_tl \c__ecnu_degree_tl
        \c__ecnu_postgraduate_tl
      }
      { \c__ecnu_postgraduate_tl \l__ecnu_tmpa_tl }
    \c__ecnu_degree_tl \c__ecnu_thesis_tl
  }
\cs_new_protected:Npn \__ecnu_cover_pg_thesis_info_en:
  {
    \tl_if_eq:NnT \g__ecnu_thesis_type_tl { master }
      {
        \tl_if_eq:NnTF \l__ecnu_info_degree_type_tl { professional }
          { \c__ecnu_thesis_en_tl } { \c__ecnu_dissertation_en_tl }
        \c_space_token \c__ecnu_for_en_tl \c_space_token
        \c__ecnu_masters_en_tl \c_space_token \c__ecnu_degree_en_tl
        \tl_if_eq:NnT \l__ecnu_info_degree_type_tl { professional }
          { \c_space_token ( \c__ecnu_professional_en_tl ) }
      }
    \tl_if_eq:NnT \g__ecnu_thesis_type_tl { doctor }
      {
        \c__ecnu_dissertation_en_tl \c_space_token
        \c__ecnu_for_en_tl \c_space_token
        \c__ecnu_doctoral_en_tl \c_space_token \c__ecnu_degree_en_tl
        \tl_if_eq:NnT \l__ecnu_info_degree_type_tl { professional }
          { \c_space_token ( \c__ecnu_professional_en_tl ) }
      }
    \c_space_token in \c_space_token \graduationyear
  }
\cs_new_protected:Npn \__ecnu_cover_ug_school_num:
  {
    \c__ecnu_university_code_tl \c__ecnu_colon_tl
    \underline{\c__ecnu_university_code_val_tl}
  }
\cs_new_protected:Npn \__ecnu_cover_pg_school_num:
  {
    \__ecnu_spread_box:no { 4 em } { \c__ecnu_university_code_tl }
    \c__ecnu_colon_tl
    \uline{\__ecnu_center_box:nn { 3 cm } { \c__ecnu_university_code_val_tl }}
  }
\cs_new_protected:Npn \__ecnu_cover_pg_school_num_en:
  {
    \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim
      {
        \zihao {5}
        \c__ecnu_university_code_en_tl \c__ecnu_colon_en_tl \c_space_token
      }
    \__ecnu_fixed_width_box:nn { \l__ecnu_tmpa_dim }
      { \c__ecnu_university_code_en_tl \c__ecnu_colon_en_tl \c_space_token }
    \uline{\__ecnu_center_box:nn { 3 cm } { \c__ecnu_university_code_val_tl }}
  }
\cs_new_protected:Npn \__ecnu_cover_pg_student_id:
  {
    \__ecnu_spread_box:no { 4 em } { \c__ecnu_info_student_id_tl }
    \c__ecnu_colon_tl
    \uline{ \__ecnu_center_box:nn { 3 cm } { \l__ecnu_info_student_id_tl } }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_student_id_en:
  {
    \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim
      {
        \zihao {5} \c__ecnu_university_code_en_tl
        \c__ecnu_colon_en_tl \c_space_token
      }
    \__ecnu_fixed_width_box:nn { \l__ecnu_tmpa_dim }
      { \c__ecnu_info_student_id_en_tl \c__ecnu_colon_en_tl \c_space_token }
    \uline{ \__ecnu_center_box:nn { 3 cm } { \l__ecnu_info_student_id_tl } }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_cic_index:
  {
    \__ecnu_spread_box:no { 4 em } { \c__ecnu_cic_index_tl } \c__ecnu_colon_tl
    \uline{ \__ecnu_center_box:nn { 3 cm } { \l__ecnu_info_cic_index_tl } }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_secret_level:
  {
    \__ecnu_spread_box:no { 4 em } { \c__ecnu_secret_level_tl  } \c__ecnu_colon_tl
    \uline{ \__ecnu_center_box:nn { 3 cm } { \l__ecnu_info_secret_level_tl } }
  }
\cs_new_protected:Npn \__ecnu_cover_ug_top:
  {
    \__ecnu_fixed_width_box:nn { \textwidth }
      {
        \bfseries \zihao { 4 }
        \__ecnu_cover_ug_thesis_info: \hfill \__ecnu_cover_ug_school_num:
      }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_top:
  {
    \__ecnu_fixed_width_box:nn { \textwidth }
      {
        \__ecnu_cover_pg_thesis_info:
        \skip_vertical:n { 0 em }
        \__ecnu_cover_pg_cic_index: \hfill \__ecnu_cover_pg_school_num:
        \skip_vertical:n { 0 em }
        \__ecnu_cover_pg_secret_level: \hfill \__ecnu_cover_pg_student_id:
      }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_top_en:
  {
    \__ecnu_fixed_width_box:nn { \textwidth }
      {
        \__ecnu_cover_pg_thesis_info_en:
        \skip_vertical:n { 0 em }
        \hbox:n {} \mode_leave_vertical:
        \hfill \__ecnu_cover_pg_school_num_en:
        \skip_vertical:n { 0 em }
        \hfill \__ecnu_cover_pg_student_id_en:
      }
  }
\cs_new_protected:Npn \__ecnu_pg_title_fixed_ht_box:nnn #1#2#3
  {
    \vbox_top:n
      {
        \tex_splittopskip:D 0pt plus 1fil
        \vbox_set:Nn \l__ecnu_tmpa_box
          {
            \tex_vskip:D 0pt plus 1fil
            \tex_hsize:D #1 \centering #3
          }
        \bool_until_do:nn { \box_if_empty_p:N \l__ecnu_tmpa_box }
          {
            \vbox_set_split_to_ht:NNn \l__ecnu_tmpb_box \l__ecnu_tmpa_box
              { \baselineskip }
            \vbox_set_to_ht:Nnn \l__ecnu_tmpc_box { #2 }
              { \tex_vfil:D \vbox_unpack:N \l__ecnu_tmpb_box }
            \box_set_dp:Nn \l__ecnu_tmpc_box { 0.2 em }
            \box_use:N \l__ecnu_tmpc_box
            \tex_hrule:D width #1 height 0.5pt
          }
      }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_title:
  {
    \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim
      { \bfseries \zihao {1} \c__ecnu_thesis_title_tl \c__ecnu_colon_tl }
    \group_begin:
      \bfseries \c__ecnu_thesis_title_tl \c__ecnu_colon_tl
    \group_end:
    \__ecnu_pg_title_fixed_ht_box:nnn { 9.8 cm } { 1.8 cm }
      { \l__ecnu_info_title_tl }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_title_en:
  {
    \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim
      {
        \bfseries \zihao {3} \c__ecnu_thesis_title_en_tl
        \c__ecnu_colon_en_tl \c_space_token
      }
    \group_begin:
      \c__ecnu_thesis_title_en_tl \c__ecnu_colon_en_tl \c_space_token
    \group_end:
    \__ecnu_pg_title_fixed_ht_box:nnn { 12 cm } { 1.2 cm }
      { \l__ecnu_info_title_en_tl }
  }
\cs_new_protected:Npn \__ecnu_cover_ug_info:
  {
    \begin{minipage} [ c ] { \textwidth }
      \centering \zihao { 4 }
      \clist_set:Nx \l__ecnu_tmpa_clist
        {
          \c__ecnu_info_name_tl,
          \c__ecnu_info_student_id_tl,
          \c__ecnu_info_department_tl,
          \c__ecnu_info_major_tl,
          \c__ecnu_info_supervisor_tl,
          \c__ecnu_info_academic_title_tl
        }
      \clist_set:Nx \l__ecnu_tmpb_clist
        {
          { \l__ecnu_info_author_tl        },
          { \l__ecnu_info_student_id_tl     },
          { \l__ecnu_info_department_tl    },
          { \l__ecnu_info_major_tl         },
          { \l__ecnu_info_supervisor_tl    },
          { \l__ecnu_info_academic_title_tl }
        }
      \dim_set:Nn \l__ecnu_tmpb_dim { 6 cm }
      \clist_map_inline:Nn \l__ecnu_tmpb_clist
        {
          \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim { \bfseries ##1 }
          \dim_set:Nn \l__ecnu_tmpb_dim
            { \dim_max:nn { \l__ecnu_tmpb_dim } { \l__ecnu_tmpa_dim } }
        }
      \bool_until_do:nn
        { \clist_if_empty_p:N \l__ecnu_tmpa_clist }
        {
          \bfseries
          \clist_pop:NN \l__ecnu_tmpa_clist \l__ecnu_tmpa_tl
          \clist_pop:NN \l__ecnu_tmpb_clist \l__ecnu_tmpb_tl
          \__ecnu_spread_box:no { 4 em } { \l__ecnu_tmpa_tl }
          \c__ecnu_colon_tl
          \underline{
            \__ecnu_center_box:nn { \l__ecnu_tmpb_dim } { \l__ecnu_tmpb_tl }
          }
          \skip_vertical:n { 0 ex }
        }
    \end{minipage}
  }
\cs_new_protected:Npn \__ecnu_cover_pg_info:
  {
    \begin{minipage} [ c ] { \textwidth }
      \centering \zihao { 4 }
      \tl_if_eq:NnTF \l__ecnu_info_degree_type_tl { professional }
        {
          \clist_set:Nx \l__ecnu_tmpa_clist
            {
              \c__ecnu_info_school_tl,
              \c__ecnu_info_major_professional_tl,
              \c__ecnu_info_field_professional_tl,
              \c__ecnu_info_candidate_tl,
              \c__ecnu_info_supervisor_tl,
            }
        }
        {
          \clist_set:Nx \l__ecnu_tmpa_clist
            {
              \c__ecnu_info_school_tl,
              \c__ecnu_info_major_tl,
              \c__ecnu_info_field_tl,
              \c__ecnu_info_candidate_tl,
              \c__ecnu_info_supervisor_tl,
            }
        }
      \clist_set:Nx \l__ecnu_tmpb_clist
        {
          { \l__ecnu_info_department_tl    },
          { \l__ecnu_info_major_tl         },
          { \l__ecnu_info_field_tl         },
          { \l__ecnu_info_author_tl        },
          { \l__ecnu_info_supervisor_tl    },
        }
      \dim_set:Nn \l__ecnu_tmpb_dim { 10 em }
      \clist_map_inline:Nn \l__ecnu_tmpb_clist
        {
          \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim { \bfseries ##1 }
          \dim_set:Nn \l__ecnu_tmpb_dim
            { \dim_max:nn { \l__ecnu_tmpb_dim } { \l__ecnu_tmpa_dim } }
        }
      \bool_until_do:nn
        { \clist_if_empty_p:N \l__ecnu_tmpa_clist }
        {
          \bfseries
          \clist_pop:NN \l__ecnu_tmpa_clist \l__ecnu_tmpa_tl
          \clist_pop:NN \l__ecnu_tmpb_clist \l__ecnu_tmpb_tl
          \tl_if_eq:NnTF \l__ecnu_info_degree_type_tl { professional }
            { \__ecnu_spread_box:no { 6 em } { \l__ecnu_tmpa_tl } }
            { \__ecnu_spread_box:no { 5 em } { \l__ecnu_tmpa_tl } }
          \c__ecnu_colon_tl
          \uline{\__ecnu_center_box:nn { \l__ecnu_tmpb_dim } { \l__ecnu_tmpb_tl }}
          \skip_vertical:n { 0 ex }
        }
    \end{minipage}
  }
\cs_new_protected:Npn \__ecnu_cover_pg_info_en:
  {
    \begin{minipage} [ c ] { \textwidth }
      \centering \zihao { -4 }
      \tl_if_eq:NnTF \l__ecnu_info_degree_type_tl { professional }
        {
          \clist_set:Nx \l__ecnu_tmpa_clist
            {
              \c__ecnu_info_school_en_tl,
              \c__ecnu_info_major_pro_en_tl,
              \c__ecnu_info_field_pro_en_tl,
              \c__ecnu_info_candidate_en_tl,
              \c__ecnu_info_supervisor_en_tl,
            }
        }
        {
          \clist_set:Nx \l__ecnu_tmpa_clist
            {
              \c__ecnu_info_school_en_tl,
              \c__ecnu_info_major_en_tl,
              \c__ecnu_info_field_en_tl,
              \c__ecnu_info_candidate_en_tl,
              \c__ecnu_info_supervisor_en_tl,
            }
        }
      \clist_set:Nx \l__ecnu_tmpb_clist
        {
          { \l__ecnu_info_department_en_tl    },
          { \l__ecnu_info_major_en_tl         },
          { \l__ecnu_info_field_en_tl         },
          { \l__ecnu_info_author_en_tl        },
          { \l__ecnu_info_supervisor_en_tl    },
        }
      \dim_set:Nn \l__ecnu_tmpb_dim { 10 em }
      \dim_set:Nn \l__ecnu_tmpc_dim { 1 em }
      \clist_map_inline:Nn \l__ecnu_tmpb_clist
        {
          \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim { \bfseries \zihao{-4} ##1 }
          \dim_set:Nn \l__ecnu_tmpb_dim
            { \dim_max:nn { \l__ecnu_tmpb_dim } { \l__ecnu_tmpa_dim } }
        }
      \clist_map_inline:Nn \l__ecnu_tmpa_clist
        {
          \__ecnu_get_text_width:Nn \l__ecnu_tmpa_dim
            { \bfseries \zihao{-4} ##1 \c__ecnu_colon_en_tl \c_space_token }
          \dim_set:Nn \l__ecnu_tmpc_dim
            { \dim_max:nn { \l__ecnu_tmpc_dim } { \l__ecnu_tmpa_dim } }
        }
      \bool_until_do:nn
        { \clist_if_empty_p:N \l__ecnu_tmpa_clist }
        {
          \bfseries
          \clist_pop:NN \l__ecnu_tmpa_clist \l__ecnu_tmpa_tl
          \clist_pop:NN \l__ecnu_tmpb_clist \l__ecnu_tmpb_tl
          \mode_leave_vertical:
          \hbox_to_wd:nn { \l__ecnu_tmpc_dim }
            { \l__ecnu_tmpa_tl \c__ecnu_colon_en_tl \c_space_token \tex_hfil:D }
          \uline{\__ecnu_center_box:nn { \l__ecnu_tmpb_dim } { \l__ecnu_tmpb_tl }}
          \skip_vertical:n { 0 ex }
        }
    \end{minipage}
  }
\cs_new_protected:Npn \__ecnu_cover_ug_date:
  {
    \__ecnu_fixed_width_center_box:nn { \textwidth }
      {
        \bfseries \zihao { 4 }
        \theyear \c__ecnu_year_tl \themonth \c__ecnu_month_tl
      }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_date:
  {
    \__ecnu_fixed_width_center_box:nn { \textwidth }
      {
        \bfseries
        \theyear \c__ecnu_year_tl \themonth \c__ecnu_month_tl
      }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_date_en:
  {
    \__ecnu_fixed_width_center_box:nn { \textwidth }
      {
        \bfseries
        \clist_item:Nn \c__ecnu_month_en_clist { \themonth }
        , \c_space_token \theyear
      }
  }
\cs_new_protected:Npn \__ecnu_orig_text_pg:
  {
    \indent \c__ecnu_orig_text_pg_part_one_tl
    \c__ecnu_left_guillemet_tl
    \l__ecnu_info_title_trim_tl
    \c__ecnu_right_guillemet_tl
    \c__ecnu_orig_text_pg_part_two_tl
  }
\cs_new_protected:Npn \__ecnu_auth_text_pg:
  {
    \indent
    \c__ecnu_left_guillemet_tl \l__ecnu_info_title_trim_tl
    \c__ecnu_right_guillemet_tl
    \c__ecnu_auth_text_pg_part_one_tl \par
    \c__ecnu_auth_text_pg_part_two_tl \par
    \c__ecnu_left_round_bracket_tl
    \hbox_to_wd:nn { 2.5 em } { } \c__ecnu_right_round_bracket_tl
    \c__ecnu_auth_text_pg_option_one_tl \par
    \c__ecnu_left_round_bracket_tl
    \hbox_to_wd:nn { 2.5 em } { } \c__ecnu_right_round_bracket_tl
    \c__ecnu_auth_text_pg_option_two_tl \par
  }
\cs_new_protected:Npn \__ecnu_orig_sign_area_ug:
  {
    \c__ecnu_orig_sign_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 15 em } { }
    \c__ecnu_date_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 3.4 em } { } \c__ecnu_year_tl
    \hbox_to_wd:nn { 1.5 em } { } \c__ecnu_month_tl
    \hbox_to_wd:nn { 1.5 em } { } \c__ecnu_day_tl
  }
\cs_new_protected:Npn \__ecnu_orig_sign_area_pg:
  {
    \indent
    { \bfseries \c__ecnu_author_sign_tl } \hbox_to_wd:nn { 15.5 em } { }
    { \bfseries \c__ecnu_date_tl }
    \hbox_to_wd:nn { 4 em } { } \c__ecnu_year_tl
    \hbox_to_wd:nn { 2 em } { } \c__ecnu_month_tl
    \hbox_to_wd:nn { 2 em } { } \c__ecnu_day_tl
  }
\cs_new_protected:Npn \__ecnu_auth_sign_area_ug:
  {
    \c__ecnu_author_sign_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 5.5 em } { }
    \c__ecnu_supervisor_sign_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 5.5 em } { }
    \c__ecnu_date_tl \c__ecnu_colon_tl
    \hbox_to_wd:nn { 3.4 em } { } \c__ecnu_year_tl
    \hbox_to_wd:nn { 1.5 em } { } \c__ecnu_month_tl
    \hbox_to_wd:nn { 1.5 em } { } \c__ecnu_day_tl
  }
\cs_new_protected:Npn \__ecnu_auth_sign_area_pg:
  {
    \indent
    { \bfseries \c__ecnu_supervisor_sign_tl } \hfill
    { \bfseries \c__ecnu_author_sign_tl } \hbox_to_wd:nn { 14 em } { } \par
    \hfill
    { \bfseries \c__ecnu_date_tl }
    \hbox_to_wd:nn { 4 em } { } \c__ecnu_year_tl
    \hbox_to_wd:nn { 2 em } { } \c__ecnu_month_tl
    \hbox_to_wd:nn { 2 em } { } \c__ecnu_day_tl
    \hbox_to_wd:nn { 5 em } { }
  }
\tl_new:N \l__ecnu_logo_resource_tl
\keys_define:nn { ecnu / style }
  {
    logo-src  .tl_set:N   = \l__ecnu_logo_resource_tl,
  }
\AtBeginDocument
  {
    \tl_if_empty:NT \l__ecnu_logo_resource_tl
      { \RequirePackage { ecnuvi } }
  }
\cs_new_protected:Npn \__ecnu_cover_pg_logo_title:
  {
    \prop_get:NVN \c__ecnu_thesis_type_prop
      \g__ecnu_thesis_type_tl \l__ecnu_tmpa_tl
    \l__ecnu_tmpa_tl
    \tl_if_eq:NnT \l__ecnu_info_degree_type_tl { professional }
      { \c__ecnu_professional_tl }
    \c__ecnu_degree_tl \c__ecnu_thesis_tl
  }
\cs_new_protected:Npn \__ecnu_cover_pg_logo_title_en:
  {
    \tl_if_eq:NnTF \l__ecnu_info_degree_type_tl { professional }
      {
        \tl_if_eq:NnTF \g__ecnu_thesis_type_tl { master }
          {
            \c__ecnu_masters_en_tl \c_space_token \c__ecnu_degree_en_tl
            \c_space_token \c__ecnu_thesis_en_tl
            \c_space_token (\c__ecnu_professional_en_tl)
          }
          {
            \text_uppercase:n { \c__ecnu_doctoral_en_tl }
            \c_space_token
            \text_uppercase:n { \c__ecnu_dissertation_en_tl }
          }
      }
      {
        \tl_if_eq:NnTF \g__ecnu_thesis_type_tl { master }
          { \text_uppercase:n { \c__ecnu_masters_en_tl } }
          { \text_uppercase:n { \c__ecnu_doctoral_en_tl } }
        \c_space_token
        \text_uppercase:n { \c__ecnu_dissertation_en_tl }
      }
  }
\cs_new_protected:Npn \__ecnu_cover_ug_logo:
  {
    \begin{minipage} [ c ] { \textwidth }
      \centering
      \tl_if_empty:NTF \l__ecnu_logo_resource_tl
        { \resizebox {9.54 cm} {!} { \ecnulogoug } }
        { \includegraphics { \l__ecnu_logo_resource_tl } }
    \end{minipage}
  }
\cs_new_protected:Npn \__ecnu_cover_pg_logo:
  {
    \begin{minipage} [ c ] { \textwidth }
      \__ecnu_line_spread:N \c__ecnu_single_space_line_spread_fp
      \centering \zihao { 5 }
      \tl_if_empty:NTF \l__ecnu_logo_resource_tl
        { \resizebox {8cm} {!} { \ecnulogopg } }
        {
          \includegraphics [width=8cm] { \l__ecnu_logo_resource_tl }
        }
      \skip_vertical:n { 0 em }
      \c__ecnu_university_name_en_tl \skip_vertical:n { 5 bp }
      \group_begin:
        \bfseries
        \__ecnu_cover_pg_logo_title:
        \skip_vertical:n { 1.12 bp }
        \__ecnu_cover_pg_logo_title_en:
      \group_end:
    \end{minipage}
  }
\cs_new_protected:Npn \__ecnu_cover_pg_logo_en:
  {
    \begin{minipage} [ c ] { \textwidth }
      \__ecnu_line_spread:N \c__ecnu_single_space_line_spread_fp
      \centering \zihao { 5 } \bfseries
      \c__ecnu_university_name_en_tl
    \end{minipage}
  }
\tl_new:N \l__ecnu_cover_template_tl
\DeclareObjectType { ecnu / cover } { \c_zero_int }
\cs_new_protected:Npn \__ecnu_cover_declare_template_interface:nn #1#2
  { \DeclareTemplateInterface { ecnu / cover } {#1} { \c_zero_int } {#2} }
\cs_new_protected:Npn \__ecnu_cover_declare_template_code:nnn #1#2#3
  { \DeclareTemplateCode { ecnu / cover } {#1} { \c_zero_int } {#2} {#3} }
\cs_generate_variant:Nn \__ecnu_cover_declare_template_interface:nn { nx  }
\cs_generate_variant:Nn \__ecnu_cover_declare_template_code:nnn     { nxn }
\cs_new:Npn \__ecnu_cover_key_type:n #1
  {
    #1 / content     : tokenlist,
    #1 / format      : tokenlist,
    #1 / bottom-skip : skip,
    #1 / align       : choice { left, right, center, normal } = normal,
  }
\cs_new:Npn \__ecnu_cover_key_binding:n #1
  {
    #1 / content     =
      \exp_not:c
        { l__ecnu_cover / \l__ecnu_cover_template_tl / #1 / content_tl  },
    #1 / format      =
      \exp_not:c
        { l__ecnu_cover / \l__ecnu_cover_template_tl / #1 / format_tl   },
    #1 / bottom-skip =
      \exp_not:c
        { l__ecnu_cover / \l__ecnu_cover_template_tl / #1 / bottom_skip },
    #1 / align       =
      {
        left   =
          \exp_not:N \cs_set_protected:cpn
            { __ecnu_cover / \l__ecnu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \raggedright ##1
                  \group_end:
                }
            },
        right  =
          \exp_not:N \cs_set_protected:cpn
            { __ecnu_cover / \l__ecnu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \raggedleft ##1
                  \group_end:
                }
            },
        center =
          \exp_not:N \cs_set_protected:cpn
            { __ecnu_cover / \l__ecnu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \centering ##1
                  \group_end:
                }
            },
        normal =
          \exp_not:N \cs_set_protected:cpn
            { __ecnu_cover / \l__ecnu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            { \exp_not:n { \group_begin: ##1 \group_end: } }
      },
  }
\cs_new_protected:Npn \__ecnu_cover_declare_template:nn #1#2
  {
    \tl_set:Nn \l__ecnu_cover_template_tl {#1}
    \__ecnu_cover_declare_template_interface:nx {#1}
      {
        format      : tokenlist,
        top-skip    : skip,
        bottom-skip : skip,
        \clist_map_function:nN {#2} \__ecnu_cover_key_type:n
      }
    \tl_new:c   { l__ecnu_cover / #1 / format_tl   }
    \skip_new:c { l__ecnu_cover / #1 / top_skip    }
    \skip_new:c { l__ecnu_cover / #1 / bottom_skip }
    \clist_map_inline:nn {#2}
      {
        \tl_new:c   { l__ecnu_cover / #1 / ##1 / content_tl  }
        \tl_new:c   { l__ecnu_cover / #1 / ##1 / format_tl   }
        \skip_new:c { l__ecnu_cover / #1 / ##1 / bottom_skip }
      }
    \__ecnu_cover_declare_template_code:nxn {#1}
      {
        format      = \exp_not:c { l__ecnu_cover / #1 / format_tl   },
        top-skip    = \use:c     { l__ecnu_cover / #1 / top_skip    },
        bottom-skip = \use:c     { l__ecnu_cover / #1 / bottom_skip },
        \clist_map_function:nN {#2} \__ecnu_cover_key_binding:n
      }
      {
        \AssignTemplateKeys
        \tl_use:c        { l__ecnu_cover / #1 / format_tl }
        \clist_map_inline:nn {#2}
          {
            \noindent
            \use:c { __ecnu_cover / #1 / ####1 / align:n }
              {
                \tl_use:c { l__ecnu_cover / #1 / ####1 / format_tl  }
                \tl_use:c { l__ecnu_cover / #1 / ####1 / content_tl }
                \par
              }
            \__ecnu_vspace:c { l__ecnu_cover / #1 / ####1 / bottom_skip }
          }
        \__ecnu_vspace:c { l__ecnu_cover / #1 / bottom_skip }
        \clearpage{\thispagestyle{empty}\cleardoublepage}
      }
  }
\NewDocumentCommand \DeclareCoverTemplate { m m }
  { \__ecnu_cover_declare_template:nn {#1} {#2} }
\DeclareCoverTemplate { cover-i   }
  { top, logo, title, title-en, info, date }
\DeclareCoverTemplate { cover-ii  }
  {
    originality-title,
    originality-text,
    originality-sign,
    authorization-title,
    authorization-text,
    authorization-sign,
    others,
  }
\DeclareInstance { ecnu / cover } { cover-i-ug } { cover-i }
  {
    bottom-skip            = 0 pt plus 0.5 fill,
    top      / content     = \__ecnu_cover_ug_top:,
    logo     / content     = \__ecnu_cover_ug_logo:,
    title    / content     =
      \expandafter\uline\expandafter{\l__ecnu_info_title_tl},
    title-en / content     =
      \expandafter\uline\expandafter{\l__ecnu_info_title_en_tl},
    info     / content     = \__ecnu_cover_ug_info:,
    date     / content     = \__ecnu_cover_ug_date:,
    title    / format      =
      \__ecnu_line_spread:n { 1.1 } \zihao { 1 } \bfseries,
    title-en / format      =
      \__ecnu_line_spread:n { 1.1 } \zihao { 1 } \bfseries,
    top      / bottom-skip = 0 pt plus 0.5 fill,
    logo     / bottom-skip = 0 pt plus 0.3 fill,
    title-en / bottom-skip = 0 pt plus 1 fill,
    info     / bottom-skip = 31.2 bp,
    top      / align       = right,
    logo     / align       = center,
    title    / align       = center,
    title-en / align       = center,
    info     / align       = center,
    date     / align       = center,
  }
\DeclareInstance { ecnu / cover } { cover-i-pg } { cover-i }
  {
    bottom-skip            = 0 pt,
    top      / content     = \__ecnu_cover_pg_top:,
    logo     / content     = \__ecnu_cover_pg_logo:,
    title    / content     = \__ecnu_cover_pg_title:,
    info     / content     = \__ecnu_cover_pg_info:,
    date     / content     = \__ecnu_cover_pg_date:,
    title    / format      = \zihao { 1 } \bfseries,
    top      / format      = \zihao { 5 },
    top      / bottom-skip = 25.272 bp,
    logo     / bottom-skip = 1 em plus .5 fill,
    title    / bottom-skip = 1 em plus 1 fill,
    info     / bottom-skip = 2 em plus .5 fill,
    top      / align       = center,
    logo     / align       = center,
    title    / align       = center,
    info     / align       = center,
    date     / align       = center,
  }
  \DeclareInstance { ecnu / cover } { cover-i-pg-en } { cover-i }
  {
    bottom-skip            = 0 pt,
    top      / content     = \__ecnu_cover_pg_top_en:,
    logo     / content     = \__ecnu_cover_pg_logo_en:,
    title    / content     = \__ecnu_cover_pg_title_en:,
    info     / content     = \__ecnu_cover_pg_info_en:,
    date     / content     = \__ecnu_cover_pg_date_en:,
    title    / format      = \zihao { 3 } \bfseries,
    top      / format      = \zihao { 5 },
    top      / bottom-skip = 49.696 bp,
    logo     / bottom-skip = 1 em plus .5 fill,
    title    / bottom-skip = 1 em plus 1 fill,
    info     / bottom-skip = 2 em plus .5 fill,
    top      / align       = center,
    logo     / align       = center,
    title    / align       = center,
    info     / align       = center,
    date     / align       = center,
  }
\DeclareInstance { ecnu / cover } { cover-ii-ug } { cover-ii }
  {
    originality-title   / content     = \c__ecnu_orig_title_ug_tl,
    originality-text    / content     = \c__ecnu_orig_text_ug_tl,
    originality-sign    / content     = \__ecnu_orig_sign_area_ug:,
    authorization-title / content     = \c__ecnu_auth_title_ug_tl,
    authorization-text  / content     = \c__ecnu_auth_text_ug_tl,
    authorization-sign  / content     = \__ecnu_auth_sign_area_ug:,
    originality-title   / format      =
      \__ecnu_line_spread:n { 1.85714286 } \zihao { 4 } \bfseries,
    originality-text    / format      = \__ecnu_line_spread:n { 1.625 },
    authorization-title / format      =
      \__ecnu_line_spread:n { 1.85714286 } \zihao { 4 } \bfseries,
    authorization-text  / format      = \__ecnu_line_spread:n { 1.625 },
    originality-sign    / bottom-skip = 70.2 bp,
    authorization-text  / bottom-skip = 23.4 bp,
    originality-title   / align       = center,
    originality-sign    / align       = right,
    authorization-title / align       = center,
    authorization-sign  / align       = right,
  }
\DeclareInstance { ecnu / cover } { cover-ii-pg } { cover-ii }
  {
    format                            =
      \__ecnu_line_spread:n { 1.85714286 } \zihao { 5 },
    originality-title   / content     = \c__ecnu_orig_title_pg_tl,
    originality-text    / content     = \__ecnu_orig_text_pg:,
    originality-sign    / content     = \__ecnu_orig_sign_area_pg:,
    authorization-title / content     = \c__ecnu_auth_title_pg_tl,
    authorization-text  / content     = \__ecnu_auth_text_pg:,
    authorization-sign  / content     = \__ecnu_auth_sign_area_pg:,
    others              / content     =
      \indent \c__ecnu_auth_others_text_pg_tl,
    originality-title   / format      = \zihao { 4 } \bfseries,
    originality-text    / format      = \zihao { 5 },
    others              / format      =
      \__ecnu_line_spread:n { 2.1388889 } \zihao { -5 },
    authorization-title / format      = \zihao { 4 } \bfseries,
    authorization-text  / format      = \zihao { 5 },
    originality-title   / bottom-skip = 6 bp,
    originality-text    / bottom-skip = 3 bp,
    originality-sign    / bottom-skip = 55.8 bp,
    authorization-title / bottom-skip = 6 bp,
    authorization-text  / bottom-skip = 3 bp,
    authorization-sign  / bottom-skip = 29.4 bp,
    originality-title   / align       = center,
    authorization-title / align       = center,
  }
\tl_new:N \l__ecnu_declaration_page_tl
\keys_define:nn { ecnu / style }
  {
    declaration-src   .tl_set:N = \l__ecnu_declaration_page_tl
  }
\AtBeginDocument
  {
    \tl_if_empty:NF \l__ecnu_declaration_page_tl
      { \RequirePackage { pdfpages } }
  }
\NewDocumentCommand \innercover { }
  {
    \thispagestyle { empty }
    \tl_set:Nn \thepage { A }
    \bool_if:NTF \g__ecnu_is_bachelor_bool
      { \UseInstance { ecnu / cover } { cover-i-ug } }
      { \UseInstance { ecnu / cover } { cover-i-pg } }
  }
\NewDocumentCommand \innercoverEN { }
  {
    \thispagestyle { empty }
    \tl_set:Nn \thepage { A-EN }
    \UseInstance { ecnu / cover } { cover-i-pg-en }
  }
\NewDocumentCommand \declarationpage { }
  {
    \cleardoublepage
    \thispagestyle { empty }
    \tl_set:Nn \thepage { B }
    \tl_if_empty:NTF \l__ecnu_declaration_page_tl
      {
        \bool_if:NTF \g__ecnu_is_bachelor_bool
          { \UseInstance { ecnu / cover } { cover-ii-ug } }
          { \UseInstance { ecnu / cover } { cover-ii-pg } }
      }
      { \includepdf [pages=-] { \l__ecnu_declaration_page_tl } }
  }
\bool_new:N \l__ecnu_heading_in_toc_bool
\tl_new:N \l__ecnu_heading_contents_tl
\tl_new:N \l__ecnu_env_lang_tl
\keys_define:nn { ecnu / customize }
  {
    toc     .bool_set:N   = \l__ecnu_heading_in_toc_bool,
    toc     .default:n    = true,
    toc     .initial:n    = true,
    toc     .groups:n     = { heading },
    title   .tl_set:N     = \l__ecnu_heading_contents_tl,
    title   .groups:n     = { heading },
  }
\keys_define:nn { ecnu / customize }
  {
    lang    .choices:nn       =
      { zh, en }
      { \tl_set_eq:NN \l__ecnu_env_lang_tl \l_keys_choice_tl },
    lang    .value_required:n = true,
    lang    .initial:n        = zh,
    lang    .groups:n         = { lang },
  }
\cs_new_protected:Npn \__ecnu_select_language:n #1
  { \keys_set_groups:nnn { ecnu / customize } { lang } { #1 } }
\cs_new_protected:Npn \__ecnu_heading:nnn #1#2#3
  {
    \group_begin:
      \ctexset
        {
          chapter / numbering = false,
          chapter / format    = { #1 }
        }
      \bool_if:NTF \l__ecnu_heading_in_toc_bool
        { \tl_if_empty:nTF { #2 } { \chapter{#3} } { \chapter[#2]{#3} } }
        {
          \__ecnu_pdf_bookmark:nn { 0 }
            { \tl_if_empty:nTF { #2 } { #3 } { #2 } }
          \chapter*{#3}
        }
    \group_end:
  }
\cs_generate_variant:Nn \__ecnu_heading:nnn { nVV }
\cs_new_protected:Npn \__ecnu_make_heading:n #1
  {
    \keys_set_groups:nnn { ecnu / customize } { heading } { #1 }
    \__ecnu_heading:nnn
      {
        \sffamily \bfseries \centering
        \bool_if:NTF \g__ecnu_is_bachelor_bool
          { \zihao {-3} } { \zihao {3} }
      }
      { } { \l__ecnu_heading_contents_tl }
  }
\cs_new_protected:Npn \__ecnu_make_abs_heading:n #1
  {
    \keys_set_groups:nnn { ecnu / customize } { heading } { #1 }
    \bool_if:NTF \g__ecnu_is_bachelor_bool
      {
        \tl_if_eq:NnTF \l__ecnu_env_lang_tl { zh }
          { \tl_set:Nn \l__ecnu_tmpa_tl { \c__ecnu_name_abstract_tl } }
          {
            \tl_set:Nn \l__ecnu_tmpa_tl
              { \text_uppercase:n { \c__ecnu_name_abstract_en_tl } }
          }
      }
      { \tl_set_eq:NN \l__ecnu_tmpa_tl \l__ecnu_heading_contents_tl }
    \__ecnu_heading:nVV
      {
        \tl_if_eq:NnTF \l__ecnu_env_lang_tl { zh }
          { \sffamily } { \rmfamily }
        \bfseries \centering \zihao {-3}
      }
      \l__ecnu_tmpa_tl \l__ecnu_heading_contents_tl
  }
\keys_set:nn { ctex }
  {
    contentsname    = \c__ecnu_name_toc_tl,
    listfigurename  = \c__ecnu_name_lof_tl,
    listtablename   = \c__ecnu_name_lot_tl,
    tocdepth        = \bool_if:NTF \g__ecnu_is_bachelor_bool { 1 } { 2 },
  }
\RequirePackage { titletoc }
\NewDocumentCommand \tocchapterformat { }
  {
    \addvspace{6pt} \contentsmargin{0pt}
    \bool_if:NTF \g__ecnu_is_bachelor_bool
      { \rmfamily \bfseries }
      { \sffamily \zihao{ 4 } }
  }
\NewDocumentCommand \tocsectionformat {}
  {
    \contentsmargin{0pt}
    \bool_if:NF \g__ecnu_is_bachelor_bool { \sffamily }
  }
\NewDocumentCommand \tocchaptercontents { }
  {
    \thecontentslabel
    \bool_if:NF \g__ecnu_is_bachelor_bool { \hspace*{2ex} }
  }
\NewDocumentCommand \tocsectioncontents { }
  {
    \thecontentslabel
    \bool_if:NTF \g__ecnu_is_bachelor_bool
      { \tl_if_eq:NnT \g__ecnu_numbering_tl { arabic } { \hspace*{1ex} } }
      { \hspace*{2ex} }
  }
\NewDocumentCommand \tocsubsectioncontents { }
  {
    \thecontentslabel
    \tl_if_eq:NnT \g__ecnu_numbering_tl { arabic } { \hspace*{2ex} }
  }
\titlecontents{chapter}[0em]
              {\tocchapterformat}{\tocchaptercontents}{}
              {\titlerule*[.25pc]{.}{\rmfamily\thecontentspage}}
              [\addvspace{3pt}]
\titlecontents{section}[1em]
              {\tocsectionformat}{\tocsectioncontents}{}
              {\titlerule*[.25pc]{.}{\rmfamily\thecontentspage}}
              [\addvspace{3pt}]
\titlecontents{subsection}[2em]
              {\contentsmargin{0pt}}{\tocsubsectioncontents}{}
              {\titlerule*[.25pc]{.}{\rmfamily\thecontentspage}}
\titlecontents{figure}[0em]{\contentsmargin{0pt}}
              {\figurename\thecontentslabel\hspace*{2ex}}{}
              {\titlerule*[.25pc]{.}\thecontentspage}
\titlecontents{table}[0em]{\contentsmargin{0pt}}
              {\tablename\thecontentslabel\hspace*{2ex}}{}
              {\titlerule*[.25pc]{.}\thecontentspage}
\cs_new_protected:Npn \__ecnu_toc_page:Nn #1#2
  {
    \group_begin:
      \bool_if:NT \g__ecnu_is_bachelor_bool
        {
          \pagestyle{ empty }
          \ctexset
            {
              chapter / pagestyle   = empty,
              chapter / numbering   = false,
              chapter / format      = \rmfamily\bfseries\centering,
            }
        }
      \__ecnu_pdf_bookmark:nn { 0 } { #1 }
      \chapter* { #1 }
      \bool_if:NTF \g__ecnu_is_bachelor_bool
        { \__ecnu_line_spread:N \c__ecnu_single_space_line_spread_fp }
        { \__ecnu_line_spread:n { 1.3 } }
      \@starttoc{#2}
    \group_end:
    \cleardoublepage
    \pagestyle{ fancy }
  }
\RenewDocumentCommand \tableofcontents { }
  { \__ecnu_toc_page:Nn \contentsname {toc} }
\RenewDocumentCommand \listoffigures { }
  { \__ecnu_toc_page:Nn \listfigurename {lof} }
\RenewDocumentCommand \listoftables { }
  { \__ecnu_toc_page:Nn \listtablename {lot} }
\RenewDocumentEnvironment { abstract } { O { } }
  { \__ecnu_abstract_begin:n { #1 } } { \__ecnu_abstract_end: }
\NewDocumentEnvironment { abstractEN } { O { } }
  { \__ecnu_abstract_en_begin:n { #1 } } { \__ecnu_abstract_en_end: }
\cs_new_protected:Npn \__ecnu_abstract_begin:n #1
  {
    \__ecnu_select_language:n { lang = zh }
    \bool_if:NTF \g__ecnu_is_bachelor_bool
      {
        \__ecnu_make_abs_heading:n
          { title = { \l__ecnu_info_title_trim_tl }, #1 }
        \small
        \group_begin:
          \skip_vertical:n { 17.6 bp }
          \noindent \rmfamily \bfseries
          \c__ecnu_name_abstract_tl \c__ecnu_colon_tl
          \skip_vertical:n { 3 bp }
        \group_end:
        \par
      }
      {
        \__ecnu_make_abs_heading:n
          {
            title = { \c__ecnu_name_chinese_abstract_tl },
            toc = false,
            #1
          }
      }
  }
\cs_new_protected:Npn \__ecnu_abstract_en_begin:n #1
  {
    \__ecnu_select_language:n { lang = en }
    \bool_if:NTF \g__ecnu_is_bachelor_bool
      {
        \__ecnu_make_abs_heading:n
          { title = { \l__ecnu_info_title_en_trim_tl }, #1 }
        \small
        \group_begin:
          \skip_vertical:n { 17.6 bp }
          \noindent \rmfamily \bfseries
          \c__ecnu_name_abstract_en_tl \c__ecnu_colon_en_tl
          \skip_vertical:n { 3 bp }
        \group_end:
        \par
      }
      {
        \__ecnu_make_abs_heading:n
          {
            title =
              { \text_uppercase:n { \c__ecnu_name_abstract_en_tl } },
            toc = false,
            #1
          }
      }
  }
\cs_new_protected:Npn \__ecnu_abstract_end:
  {
    \__ecnu_keywords:nNnn
      {
        \bool_if:NTF \g__ecnu_is_bachelor_bool
          { \rmfamily\bfseries }
          { \zihao{4}\sffamily\bfseries }
        \c__ecnu_name_keywords_tl \c__ecnu_colon_tl
      }
      \l__ecnu_info_keywords_clist { ， } { }
    \cleardoublepage
  }
\cs_new_protected:Npn \__ecnu_abstract_en_end:
  {
    \__ecnu_keywords:nNnn
      {
        \bool_if:NTF \g__ecnu_is_bachelor_bool
          { \rmfamily\bfseries } { \zihao{4}\bfseries }
        \c__ecnu_name_keywords_en_tl \c__ecnu_colon_en_tl \c_space_token
      }
      \l__ecnu_info_keywords_en_clist { ,\c_space_token }
      { \bool_if:NF \g__ecnu_is_bachelor_bool { \itshape } }
    \cleardoublepage
  }
\cs_new_protected:Npn \__ecnu_keywords:nNnn #1#2#3#4
  {
    \par \__ecnu_vspace:n { \skip_use:N \baselineskip minus 1 em }
    \par \noindent
    \group_begin: #1 \group_end:
    \group_begin:
      #4
      \clist_use:Nn #2 {#3}
    \group_end:
  }
\RenewDocumentEnvironment { appendix } { O { } }
  { \__ecnu_appendix_begin:n { #1 } }
  { \__ecnu_appendix_end: }
\cs_new_protected:Npn \__ecnu_appendix_begin:n #1
  {
    \cleardoublepage
    \__ecnu_make_heading:n { title = \c__ecnu_name_appendix_tl, #1 }
    \setcounter{section}{0}
    \bool_if:NT \g__ecnu_is_bachelor_bool { \zihao { 5 } }
  }
\cs_new_protected:Npn \__ecnu_appendix_end:
  { \cleardoublepage }
\NewDocumentEnvironment { acknowledgement } { O{ } }
  { \__ecnu_acknowledgement_begin:n { #1 } }
  { \__ecnu_acknowledgement_end: }
\cs_new_protected:Npn \__ecnu_acknowledgement_begin:n #1
  {
    \cleardoublepage
    \__ecnu_make_heading:n
      {
        title =
          {
            \bool_if:NTF \g__ecnu_is_bachelor_bool
              { \c__ecnu_name_acknowledgement_tl }
              { \c__ecnu_name_epilogue_tl }
          },
        #1
      }
  }
\cs_new_protected:Npn \__ecnu_acknowledgement_end:
  { \cleardoublepage }
\tl_new:N \l__ecnu_bib_resource_tl
\keys_define:nn { ecnu / style }
  {
    bib-src .tl_set:N = \l__ecnu_bib_resource_tl
  }
\__ecnu_gadd_ltxhook:nn { env/document/begin }
{
  \__ecnu_biblatex_pre_setup:
  \RequirePackage { biblatex }
  \__ecnu_biblatex_post_setup:
}
\cs_new_protected:Npn \__ecnu_biblatex_pre_setup:
  {
    \PassOptionsToPackage
      {
        backend       = biber,
        style         = gb7714-2015,
        seconds       = true,
        hyperref      = true,
        gbpub         = false,
        gbpunctin     = true,
      }
      { biblatex }
  }
\cs_new_protected:Npn \__ecnu_biblatex_post_setup:
  {
    \exp_args:NV \addbibresource \l__ecnu_bib_resource_tl
    \__ecnu_biblatex_allow_url_break:
    \bool_if:NT \g__ecnu_is_bachelor_bool
      { \RenewDocumentCommand \bibfont { } { \small } }
    \setlength{\bibitemsep}{0pt}
    \defbibheading { bibliography } [ \bibname ]
      { \__ecnu_make_heading:n { title = ##1 } }
  }
\cs_new:Npn \__ecnu_biblatex_allow_url_break:
  {
    \int_set_eq:NN \c@biburlucpenalty  \c_one_int
    \int_set_eq:NN \c@biburlnumpenalty \c_one_int
    \int_set_eq:NN \c@biburllcpenalty  \c_one_int
  }
\ctex_at_end_preamble:n
  {
    \RequirePackage { hyperref }
    \hypersetup
      {
        hidelinks,
        unicode         = true,
        pdftitle        = \l__ecnu_info_title_trim_tl,
        pdfauthor       = \l__ecnu_info_author_tl,
        pdfkeywords     = \l__ecnu_info_keywords_clist,
        pdfcreator      = \c__ecnu_name_pdf_creator_tl
      }
    \int_new:N \g__ecnu_bookmark_int
    \cs_set_protected:Npn \__ecnu_pdf_bookmark:nn #1#2
      {
        \phantomsection
        \int_gincr:N \g__ecnu_bookmark_int
        \pdfbookmark [#1] {#2}
          { ecnu. bookmark. \int_use:N \g__ecnu_bookmark_int }
      }
  }
\bool_lazy_or:nnT
  { \g__ecnu_cover_page_bool } { \g__ecnu_declaration_page_bool }
  {
    \AtBeginDocument
      {
        \bool_if:NT \g__ecnu_is_bachelor_bool
          {
            \newgeometry
              {
                top     = 2.0 cm,
                bottom  = 2.0 cm,
                left    = 3.0 cm,
                right   = 3.0 cm
              }
          }
        \begin{titlepage}
          \bool_if:NT \g__ecnu_cover_page_bool
            {
              \innercover
              \bool_if:NF \g__ecnu_is_bachelor_bool { \newpage \innercoverEN }
            }
          \bool_if:NT \g__ecnu_declaration_page_bool
            { \declarationpage }
        \end{titlepage}
        \bool_if:NT \g__ecnu_is_bachelor_bool { \restoregeometry }
      }
  }
\keys_define:nn { ecnu }
  {
    info  .meta:nn = { ecnu / info  } {#1},
    style .meta:nn = { ecnu / style } {#1}
  }
\NewDocumentCommand \ecnusetup { m }
  { \keys_set:nn { ecnu } {#1} }
\NewDocumentCommand \frontmatter { }
  { \cleardoublepage\pagenumbering{Roman} }
\NewDocumentCommand \mainmatter { }
  { \cleardoublepage\pagenumbering{arabic} }
\NewDocumentCommand \backmatter { }
  {
    \cleardoublepage
    \setcounter{section}{0}
    \ctexset
      {
        secnumdepth             = 1,
        chapter / numbering     = false,
        chapter / format        += \setcounter{section}{0},
        section / name          = {,.},
        section / number        = {\arabic{section}},
      }
    \bool_if:NF \g__ecnu_is_bachelor_bool
      { \addtocontents{toc}{\protect\vspace{25bp}} }
  }
\keys_set:nn { ecnu / info }
  {
    degree          = academic,
    clc             = {(分类号)},
    secret-level    = {},
    title           = {(中文标题)},
    title-en        = {(English~Title)},
    author          = {(作者姓名)},
    author-en       = {(Author~Name)},
    student-id      = {(学号)},
    department      = {(学院)},
    department-en   = {(Department)},
    major           = {(专业)},
    major-en        = {(Major)},
    supervisor      = {(导师姓名)},
    supervisor-en   = {(Supervisor)},
    academic-title  = {(导师职称)},
    keywords        = {关键词1, 关键词2, 关键词3},
    keywords-en     = {keyword1, keyword2, keyword3}
  }
\endinput
%%
%% End of file `ecnuthesis.cls'.
