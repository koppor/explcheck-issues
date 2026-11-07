%%
%% This is file `rwth-beamer.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% rwth-beamer.dtx  (with options: `class,identification')
%% rwth-ci.dtx  (with options: `class,beamer,options,titlesepline')
%% rwth-beamer.dtx  (with options: `class,options,processoptions,')
%% rwth-ci.dtx  (with options: `buildOptions,beamer')
%% rwth-beamer.dtx  (with options: `class,head')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from rwth-beamer.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file rwth-beamer.dtx rwth-ci.dtx rwth-beamer.dtx rwth-ci.dtx rwth-beamer.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}[2023-10-01]
\ProvidesExplClass{rwth-beamer}{2026-04-03}{1.2}{Beamer slides using the Corporate Design of RWTH Aachen University}
\tl_new:N \g_ptxcd_logofile_tl
\str_const:Nn \c__ptxcd_base_str {
  beamer
}
\msg_if_exist:nnF {rwth-ci} {no-departmentconfig-found} {
\msg_new:nnn {rwth-ci} {no-departmentconfig-found} {
The~package~has~been~configured~to~load~the~config~file~“#1”.\\
I~can't~find~this~file.~Skipping.
}
}
\hook_gput_code:nnn {
 class/\@currname/after
}{
  \@currname/department-config
}{
  \file_if_exist_input:nF {\g__ptxcd_config_prefix_tl\g_ptxcd_department_str.cfg} {
    \str_if_eq:eeF {\g__ptxcd_config_prefix_tl\g_ptxcd_department_str} {rwth-default} {
      \msg_note:nne {rwth-ci} {no-departmentconfig-found} {\g__ptxcd_config_prefix_tl\g_ptxcd_department_str.cfg}
    }
  }
}
\exp_args:Ne \keys_define:nn {ptxcd/\c__ptxcd_base_str} {
  logofile .code:n = {
    \file_parse_full_name:nNNN {#1} \g_tmpa_tl \l_tmpa_tl \l_tmpb_tl
    \tl_gset:Ne \g_ptxcd_logofile_tl {\tl_if_empty:NF \g_tmpa_tl  {\g_tmpa_tl/}\l_tmpa_tl}
    \tl_if_empty:NTF \l_tmpb_tl {
      \tl_if_empty:NT \g__ptxcd_logofile_ext_tl {
        \tl_gset:Nn \g__ptxcd_logofile_ext_tl {.pdf}
      }
    }{
      \tl_gset_eq:NN \g__ptxcd_logofile_ext_tl \l_tmpb_tl
    }
  },
  logofile .initial:n = ,
  logofile-ext .tl_gset:N = \g__ptxcd_logofile_ext_tl,
  logofile-ext .initial:n = .pdf,
  accept-missing-logos .bool_gset:N = \g__ptxcd_logo_workaround_bool,
  accept-missing-logos .initial:n = false,
  accept-missing-logos .usage:n = load,
  accept-missing-logos .default:n = true,
  LaTeX-logo .bool_gset:N = \g__ptxcd_use_LaTeX_Logo_bool,
  department .choice:,
  department / default .code:n = \str_gset:Nn \g_ptxcd_department_str {default},
  department .initial:n = default,
  department / unknown .code:n = {
      \str_gset:NV \g_ptxcd_department_str \l_keys_value_tl
    },
  departmentconfigprefix .tl_gset:N = \g__ptxcd_config_prefix_tl,
  departmentconfigprefix .initial:n = rwth-,
  colormode .code:n = \PassOptionsToPackage{colormode=#1}{rwth-colors},
  RGB .code:n = \PassOptionsToPackage{colormode=RGB}{rwth-colors},
  cmyk .code:n = \PassOptionsToPackage{colormode=RGB}{rwth-colors},
  titlegraphic .code:n = \PassOptionsToPackage{titlegraphic={#1}}{beamerinnerthemeRWTH},
  titlesepline .bool_gset:N = \g__ptxcd_titlesepline_bool,
  titlesepline .initial:n = true,
  titlesepline .default:n = true,
  plain-titlepage .bool_set:N = \l__ptxcd_plain_title_bool,
  titlepage .choice:,
  titlepage / graphics .meta:n = {plain-titlepage=false},
  titlepage / plain .meta:n = {plain-titlepage=true},
  titlepage .initial:n = graphics,
}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{beamer}
}
\ProcessKeyOptions[ptxcd/beamer]
\ProcessOptions*
\RequirePackage{iftex}
\ifPDFTeX
\RequirePackage{anyfontsize}
\fi
\PassOptionsToClass{t,aspectratio=169,9pt}{beamer}
\LoadClass{beamer}
\let\normalsize\@undefined
\DeclareRobustCommand\normalsize{%
  \@setfontsize\normalsize{8.50966pt}\@xipt%
  \abovedisplayskip 8\p@ \@plus4\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 5\p@ \@plus3\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize
\let\large\@undefined
\DeclareRobustCommand\large{\@setfontsize\large{9.45517}\@xiipt}
\let\huge\@undefined
\DeclareRobustCommand\huge{\@setfontsize\huge{15.12828pt}{20pt}}
\cs_if_exist:NT \ptxcdDefaultBuildOptions {
  \exp_args:Ne \keys_set:ne { ptxcd /
    \c__ptxcd_base_str
  } {
    \ptxcdDefaultBuildOptions
  }
}
\usetheme{RWTH}
\endinput
%%
%% End of file `rwth-beamer.cls'.
