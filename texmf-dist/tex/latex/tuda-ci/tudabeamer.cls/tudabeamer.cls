%%
%% This is file `tudabeamer.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tudabeamer.dtx  (with options: `class,initialize,options')
%% tuda-ci.dtx  (with options: `options,tudabeamer,beamer')
%% tudabeamer.dtx  (with options: `class,body')
%% 
%% it is part of
%% TUDa-CI -- Corporate Design for TU Darmstadt
%% 
%% ----------------------------------------------------------------------------
%% 
%%   Copyright (C) 2018--2025 by Marei Peischl <marei@peitex.de>
%% 
%% ============================================================================
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%% http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008/05/04 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is
%%   Marei Peischl <tuda-ci@peitex.de>
%% 
%% The development repository can be found at
%% https://github.com/tudace/tuda_latex_templates
%% Please use the issue tracker for feedback!
%% 
%% ============================================================================
%% 
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{tudabeamer}
  [2025-03-03 4.03-dev Beamer wrapper class for TUDa-CI – Corporate Design Templates for TU Darmstadt]
\PassOptionsToClass{10pt}{beamer}
\ExplSyntaxOn
\str_new:N \g_ptxcd_department_str
\str_const:Nn \c__ptxcd_base_str {beamer}
  \tl_new:N \g__ptxcd_design_tl
  \cs_new:Nn \__ptxcd_beamer_declare_pass_options:nn {
    \keys_define:nn {ptxcd/beamer} {
      #1 .code:n = \clist_map_inline:nn {#2}{
        \PassOptionsToPackage{#1=##1}{beamer####1themeTUDa2008}
        \PassOptionsToPackage{#1=##1}{beamer####1themeTUDa}
      },
      #1 .default:n = true,
    }
  }

  \__ptxcd_beamer_declare_pass_options:nn {centerframetitle} {outer}
  \__ptxcd_beamer_declare_pass_options:nn {headsepline} {outer}
  \__ptxcd_beamer_declare_pass_options:nn {logo} {outer}
  \__ptxcd_beamer_declare_pass_options:nn {colortitle} {color}
  \__ptxcd_beamer_declare_pass_options:nn {colorbacktitle} {color}
  \__ptxcd_beamer_declare_pass_options:nn {colorback} {color}
  \__ptxcd_beamer_declare_pass_options:nn {colorframetitle} {outer, color}

\keys_define:nn {ptxcd/beamer} {
  accentcolor .code:n = \PassOptionsToPackage{accentcolor=#1}{tudacolors},
  color .code:n = {
    \tl_if_in:nnTF {#1} {=} {
      \msg_new:nnn {tudabeamer} {color-option-warning} {
        The~color~option~should~no~longer~be~used~to~pass~options~to~the~tudacolors~package.\\
        Please~use~tudacolors={##1}~instead~of~color={##1}.\\
        See~the~tudabeamer~documentation~for~more~information.
      }
      \msg_warning:nnn {tudabeamer} {color-option-warning} {#1}
      \PassOptionsToPackage{#1}{tudacolors}
    } {
      \PassOptionsToPackage{color=#1}{tudacolors}
    }
  },
  tudacolors .code:n = \PassOptionsToPackage{#1}{tudacolors},
  design .choice:,
  design / 2023 .code:n = {
      \tl_gset:Nn  \g__ptxcd_design_tl {2023}
      \PassOptionsToClass{aspectratio=169}{beamer}
    },
  design / 2008 .code:n = {
      \tl_gset:Nn  \g__ptxcd_design_tl {2008}
    },
  design / default .code:n = {
    \tl_gset:Nn  \g__ptxcd_design_tl {default}
   },
  design .initial:n = default,
  design2023 .meta:n = {design=2023},
  design2008 .meta:n = {design=2008},
  design .usage:n = load,
  accept-missing-logos .bool_gset:N = \g_ptxcd_logo_workaround_bool,
  accept-missing-logos .initial:n = false,
  accept-missing-logos .usage:n = load,
  accept-missing-logos .default:n = true,
  department .choice:,
  department / default .code:n = \str_gset:Nn \g_ptxcd_department_str {default},
  department / mecheng .code:n = {
      \str_gset:Nn \g_ptxcd_department_str {mecheng}
      \keys_set:nn {ptxcd/beamer} {
        design=2008,
        colorframetitle=false,
        centerframetitle=true,
        headsepline=false,
      }
    },

  department .initial:n = default,
  department / unknown .code:n = {
      \str_gset:Nx \g_ptxcd_department_str {\l_keys_value_tl}
    },
  departmentconfigprefix .tl_gset:N = \g__ptxcd_config_prefix_tl,
  departmentconfigprefix .initial:n = tuda,
  departmentlogofile .tl_gset:N = \g_ptxcd_departmentlogo_tl,
  departmentlogofile .initial:n =,
  mecheng .meta:n = {department=mecheng},
  pdfa .code:n = {
    \msg_error:nn {tuda\c__ptxcd_base_str} {pdfa-option-removed}
  },
  pdfx .bool_gset:N = \g_ptxcd_pdfx_bool,
  pdfx .initial:n = true,
%% color options
%% color options
}
\msg_new:nnn {tuda\c__ptxcd_base_str} {pdfa-option-removed} {
  The~option~"pdfa"~was~removed~for~this~document~class.\\
  In~case~you~need~it,~please~use~the~mechanism~provided~by~the~pdfmanagement~instead.\\
  See~TUDa-CI~documentation~for~details.
}
\cs_if_exist:NT \TUDaDefaultBuildOptions {
  \exp_args:Ne \keys_set:ne { ptxcd /
    \c__ptxcd_base_str
  } {
    \TUDaDefaultBuildOptions
  }
}
\ExplSyntaxOff
\PassOptionsToPackage{
  hidelinks,
  unicode,
  pdfpagelabels=false,
  plainpages=false,
  pdfcreator=LaTeX using the TUDa-CI Bundle,
}{hyperref}
\PassOptionsToClass{t}{beamer}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{beamer}
}
\ProcessKeyOptions[ptxcd/beamer]
\ProcessOptions*
\ExplSyntaxOn
\tl_if_eq:NnT \g__ptxcd_design_tl  {default} {
  \msg_new:nnn {tudabeamer} {default-design-changed} {
    With~version~4.0~tudabeamer~switched~to~the~new~corporate~design~layout.\\
    In~case~this~is~not~intended,~it's~possible~switch~back~using~`design=2008`~option.\\
    `design=2023`~will~disable~this~warning.
  }
  \msg_warning:nn {tudabeamer} {default-design-changed}
  \keys_set:nn {ptxcd/beamer} {design=2023}
}
\ExplSyntaxOff
\LoadClass{beamer}
\ExplSyntaxOn
\def\department{\@dblarg\ptxcd_beamer_department}
\long\def\ptxcd_beamer_department[#1]#2{%
  \def\beamer@temp{#2}%
  \ifx\beamer@temp\@empty
    \def\insertdepartment{}
  \else
    \def\insertdepartment{\def\inst{\beamer@instinst}\def\and{\qquad}#2}%
  \fi
  \def\beamer@shortdepartment{#1}}
\department{}
\newcommand\insertshortdepartment[1][]{%
  {%
      \let\thanks=\@gobble%
      \beamer@setupshort{#1}%
      \beamer@insertshort{\beamer@shortdepartment}%
  }%
}
\usetheme{TUDa\g__ptxcd_design_tl}%
\let\accentfont\normalfont%
\file_if_exist:nTF {\g__ptxcd_config_prefix_tl beamerthemeTUDa-\g_ptxcd_department_str.sty}
  {\RequirePackage{\g__ptxcd_config_prefix_tl beamerthemeTUDa-\g_ptxcd_department_str}}
  {
    \file_if_exist:nT {beamerthemeTUDa-\g_ptxcd_department_str.sty}
      {\RequirePackage{beamerthemeTUDa-\g_ptxcd_department_str}}
  }
\ExplSyntaxOff
\endinput
%%
%% End of file `tudabeamer.cls'.
