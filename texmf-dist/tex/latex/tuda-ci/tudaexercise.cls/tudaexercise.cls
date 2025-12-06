%%
%% This is file `tudaexercise.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tudaexercise.dtx  (with options: `class,initialization')
%% tuda-ci.dtx  (with options: `options,exercise,print')
%% tudaexercise.dtx  (with options: `class,center')
%% tuda-ci.dtx  (with options: `margin,geometry,exercise')
%% tudaexercise.dtx  (with options: `class,body')
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
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesExplClass{tudaexercise}{2025-11-13}{4.05}{Exercise sheets and exams using TU Darmstadt's Corporate Desing (TUDa-CI)}
\msg_new:nnnn {tudaexercise} {outdated-koma-script} {
  Your~KOMA-Script~is~outdated.\\
  To~use~the~feature~'#1'~you~will~be~required~to~update.
} {
  Please~do~not~use~this~feature~or~update~your~TeX~distribution.\\
  The~feature~requires~KOMA-Script~v#2~or~newer.
}
\str_const:Nn \c__ptxcd_base_str {exercise}
\prop_new:N \g_ptxcd_clsopts_prop
\prop_new:N \g_ptxcd_unknown_clsopts_prop
\prop_gput:Nnn \g_ptxcd_clsopts_prop {captions} {nooneline}
\prop_gput:Nnn \g_ptxcd_clsopts_prop {parskip} {half-}
\prop_new:N \g__ptxcd_points_collector_prop
\prop_new:N \g__ptxcd_subtask_points_collector_prop
\prop_new:N \g__ptxcd_property_collector_prop
\bool_new:N \l__ptxcd_points_auto_bool
\bool_new:N \g__ptxcd_points_bool
\prop_new:N \g__ptxcd_loaded_points_prop
\fp_new:N \g__ptxcd_points_total_fp
\int_new:N \g_ptxcd_paper_int
\bool_new:N \g_ptxcd_geometry_bool
\bool_new:N \g_ptxcd_custommargins_bool
\bool_new:N \l__ptxcd_solution_bool
\bool_new:N \g_ptxcd_smalltitle_bool
\str_new:N \g_ptxcd_department_str
\tl_new:N \g_ptxcd_tmp_tl
\int_new:N \g_ptxcd_tmp_int
\tl_new:N \l_ptxcd_tmp_tl
\clist_map_inline:nn {section,subsection,subsubsection,task,subtask,@solution} {
  \bool_new:c {g__ptxcd_ruled_#1_bool}
  \bool_gset_true:c {g__ptxcd_ruled_#1_bool}
}
\bool_new:N \g__ptxcd_runin_subtask_bool
\newenvironment{solution}{}{}
\newenvironment{solution*}{}{}
\cs_new:Nn \__ptxcd_setup_solution: {
  \bool_if:NTF \l__ptxcd_solution_bool {
    \def\solution{\__ptxcd_solutionheader:}
    \def\endsolution{}
    \expandafter\def\csname solution*\endcsname{\ignorespaces}
    \expandafter\let\csname endsolution*\endcsname\endsolution
  }{
    \RenewDocumentEnvironment{solution}{+b}{}{}
    \RenewDocumentEnvironment{solution*}{+b}{}{}
  }
}
\__ptxcd_setup_solution:
\prg_new_conditional:Nnn \__ptxcd_if_solution: {T,F,TF} {
  \bool_if:NTF \l__ptxcd_solution_bool
    {\prg_return_true:}
    {\prg_return_false:}
}
\let\IfSolutionT \__ptxcd_if_solution:T
\let\IfSolutionF \__ptxcd_if_solution:F
\let\IfSolutionTF \__ptxcd_if_solution:TF
\msg_new:nnn{tudaexercise} {titlepage-option-disabled} {
  You~set~the~titlepage~option~to~#1.\\
  This option is not supported by tudaexercise.cls.\\
  The~KOMA-Script~option~titlepage~is~forced~to~"false".
}
\PassOptionsToPackage{pdfusetitle,bookmarksnumbered=true}{hyperref}
\keys_define:nn {ptxcd/exercise} {
  bookmarksnumbered  .code:n = \PassOptionsToPackage{bookmarksnumbered=#1}{hyperref},
  compat .bool_gset:N = \g__ptxcd_compatibility_bool,
  compat .initial:n = false,
  compatilibity .meta:n = {compat=#1},
  compatibility .default:n = true,
  credit .tl_set:N = \l__ptxcd_credit_tl,
  credit .initial:n =,
  headontitle .bool_gset:N = \g_ptxcd_headontitle_bool,
  headontitle .initial:n = false,
  headontitle .default:n =true,
  titlepage .code:n = {\msg_warning:nnn {tudapub} {titlepage-option-disabled} {#1}},
  match-task-subtask-syntax .bool_gset:N = \g_ptxcd_match_task_subtask_bool,
  match-task-subtask-syntax .initial:n = false,
  match-task-subtask-syntax .default:n = true,
  solution .code:n = {
      \bool_set_eq:Nc \l__ptxcd_solution_bool {c_#1_bool}
      \__ptxcd_setup_solution:
    },
  solution .default:n = true,
  unknown .code:n = {\prop_gput:NVn \g_ptxcd_unknown_clsopts_prop \l_keys_key_tl {#1}},
  points .choice:,
  points / true .code:n = \bool_set_false:N \l__ptxcd_points_auto_bool\bool_gset_true:N \g__ptxcd_points_bool,
  points /false .code:n =  \bool_set_false:N \l__ptxcd_points_auto_bool\bool_gset_false:N \g__ptxcd_points_bool,
  points / auto .code:n = \bool_set_true:N \l__ptxcd_points_auto_bool\bool_gset_true:N \g__ptxcd_points_bool,
  points .initial:n = false,
  subtask .choice:,
  subtask / ruled .code:n =
  \bool_gset_true:N \g__ptxcd_ruled_subtask_bool
  \bool_gset_false:N  \g__ptxcd_runin_subtask_bool,
  subtask / runin .code:n =
  \bool_gset_false:N \g__ptxcd_ruled_subtask_bool
  \bool_gset_true:N  \g__ptxcd_runin_subtask_bool,
  subtask / plain .code:n =
  \bool_gset_false:N \g__ptxcd_ruled_subtask_bool
  \bool_gset_false:N  \g__ptxcd_runin_subtask_bool,
  logofile .tl_gset:N = \g_ptxcd_logofile_tl,
  logofile .initial:n = tuda_logo,
  accept-missing-logos .bool_gset:N = \g_ptxcd_logo_workaround_bool,
  accept-missing-logos .initial:n = false,
  accept-missing-logos .usage:n = load,
  accept-missing-logos .default:n = true,
  department .choice:,
  department / default .code:n = \str_gset:Nn \g_ptxcd_department_str {default},
  department / mecheng .code:n = {
      \str_gset:Nn \g_ptxcd_department_str {mecheng}
      \exp_args:Ne \keys_set:ne {

        ptxcd / \c__ptxcd_base_str
      }{
        colorback=false,
        departmentlogofile=tuda_maschinenbau_logo,
        color=Primary1,
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
%% color options
%% color options
  color .meta:n = {accentcolor=#1},
  accentcolor .code:n = {\PassOptionsToPackage{accentcolor=#1}{tudacolors}},
  textaccentcolor .code:n = {\PassOptionsToPackage{textaccentcolor=#1}{tudacolors}},
  identbarcolor .code:n = {\PassOptionsToPackage{identbarcolor=#1}{tudacolors}},
  colorback .bool_gset:N = \g_ptxcd_colorback_bool,
  colorback .default:n = true,
  colorback .initial:n = true,
  custommargins .choice:,
  custommargins / true .code:n ={
      \bool_gset_true:N \g_ptxcd_custommargins_bool
      \bool_gset_false:N \g_ptxcd_geometry_bool
    },
  custommargins / false .code:n ={
      \bool_gset_false:N \g_ptxcd_custommargins_bool
      \bool_gset_true:N \g_ptxcd_geometry_bool
    },
  custommargins / geometry .code:n = {
      \bool_gset_true:N \g_ptxcd_custommargins_bool
      \bool_gset_true:N \g_ptxcd_geometry_bool
    },
  custommargins .initial:n = false,
  custommargins .default:n = true,
  fontsize .code:n = \prop_gput:Nnn \g_ptxcd_clsopts_prop {fontsize} {#1},
  fontsize .initial:n =
  {10pt},
  BCOR .code:n = \PassOptionsToPackage{bindingoffset=#1}{geometry},
  bindingoffset .meta:n = {BCOR=#1},
  captions .code:n = {\prop_gput:Nnx \g_ptxcd_clsopts_prop {captions} {
        \use:n {\prop_item:Nn \g_ptxcd_clsopts_prop {captions}}, #1}
    },
  paper .choices:nn = {
      a0,a1,a2,a3,a4,a5,a6
  }{
  \int_gset_eq:NN \g_ptxcd_paper_int  \l_keys_choice_int
  \exp_args:Nx \PassOptionsToPackage{paper=\l_keys_choice_tl}{tudarules}
      \exp_args:Nx \PassOptionsToPackage{paper=\l_keys_choice_tl}{typearea}
      \exp_args:Nx \PassOptionsToPackage{\l_keys_choice_tl paper}{geometry}
  },
  paper .initial:n =

  a4,
  title .choice:,
  title / default .meta:n = {title=large},
  title / large .code:n = \bool_gset_false:N \g_ptxcd_smalltitle_bool,
  title / small  .code:n = \bool_gset_true:N \g_ptxcd_smalltitle_bool,
  title .initial:n = default,
}
\cs_if_exist:NT \TUDaDefaultBuildOptions {
  \exp_args:Ne \keys_set:ne { ptxcd /
    \c__ptxcd_base_str
  } {
    \TUDaDefaultBuildOptions
  }
}
\cs_new:Nn \__ptxcd_insert_logo: {
  \bool_if:NTF \g_ptxcd_logo_workaround_bool {
    \file_if_exist:nTF {\g_ptxcd_logofile_tl.pdf}
    \use_ii:nn
    \use_i:nn
  } {
    \use_ii:nn
  }
  {\rule{0pt}{\c_ptxcd_logoheight_dim}\makebox[2.5\c_ptxcd_logoheight_dim][c]{\rule[.1\c_ptxcd_logoheight_dim]{2.05\c_ptxcd_logoheight_dim}{.8\c_ptxcd_logoheight_dim}}}
  {\includegraphics[height=\c_ptxcd_logoheight_dim]{\g_ptxcd_logofile_tl}}
}
\ProcessKeyOptions[ptxcd/exercise]
\prop_map_inline:Nn \g_ptxcd_clsopts_prop {
    \tl_if_empty:nTF {#2}
    {\PassOptionsToClass  {#1} {scrartcl}}
    {
      \clist_map_inline:nn {#2} {\PassOptionsToClass  {#1=##1} {scrartcl}}
    }
}
  \bool_new:N \l__ptxcd_subtask_fallback_bool
  \fp_new:N \l__ptxcd_task_points_fp
  \fp_new:N \g__ptxcd_ex_collected_points_fp
  \tl_new:N \l__ptxcd_task_credit_tl
  \keys_define:nn {ptxcd/task}{
    points .choice:,
    points / auto .code:n =
    \bool_set_true:N \l__ptxcd_points_auto_bool,
    points / unknown .code:n = \fp_set:Nn \l__ptxcd_task_points_fp  {#1}
    \bool_set_false:N \l__ptxcd_points_auto_bool,
    credit .code:n = \tl_set:Nn \l__ptxcd_task_credit_tl {#1}
    \bool_set_false:N \l__ptxcd_points_auto_bool,
    solution .meta:nn ={ptxcd/exercise}{solution=#1},
  }
\fp_new:N \l__ptxcd_subtask_points_fp
\keys_define:nn {ptxcd/subtask} {
  credit .tl_set:N = \l__ptxcd_subtask_credit_tl,
  credit .initial:n =,
  points .code:n = \fp_set:Nn \l__ptxcd_subtask_points_fp {#1}
    \bool_set_false:N \l__ptxcd_points_auto_bool,
  title .tl_set:N = \l__ptxcd_title_tl,
  title .initial:n =,
  unknown .code:n = {
    \bool_set_true:N \l__ptxcd_subtask_fallback_bool
    \tl_clear:N \l__ptxcd_subtask_credit_tl
    \fp_zero:N \l__ptxcd_subtask_points_fp
  },
}
\keys_define:nn {ptxcd/exercise/headline} {
  headline .code:n = {
    \if@twoside
      \keys_set:nn  {ptxcd/exercise/headline} {odd=#1,even=#1}
    \else
      \keys_set:nn {ptxcd/exercise/headline} {oneside=#1}
    \fi
  },
}
\clist_map_inline:nn {odd, even, oneside} {
  \tl_new:c {g__ptxcd_headline_#1_tl}
  \box_new:c {g__ptxcd_headline_#1_box}
  \keys_define:nn {ptxcd/exercise/headline} {
    #1 .choice:,
    #1 / title-name-id .meta:n = {
      #1 = {
        \g_ptxcd_shorttitle_tl\par
        \StudentName\StudentID
      }
    },
    #1 / title-name .meta:n = {
      #1 = {
        \g_ptxcd_shorttitle_tl\par
        \smallskip
        \StudentName
      }
    },
    #1 / title .meta:n = {#1 = {\g_ptxcd_shorttitle_tl}},
    #1 / name-id .meta:n = {#1 = {\StudentName\StudentID}},
    #1 / name .meta:n = {#1 = {\StudentName}},
    #1 / unknown .code:n = \tl_gset:cn {g__ptxcd_headline_#1_tl} {##1}
    }
}
\file_if_exist:nT {tudasize\prop_item:Nn \g_ptxcd_clsopts_prop {fontsize}.clo}
{\providecommand*{\@fontsizefilebase}{tudasize}}
\LoadClass{scrartcl}
\bool_if:NT \g__ptxcd_points_bool {
  \cs_if_exist:NF \AddtoDoHook{
    \msg_error:nnnn  {tudaexercise} {outdated-koma-script} {points=true/auto} {3.27}
    \keys_set:nn {ptxcd/exercise} {points=false}
  }
}
\RequirePackage{tudarules}
\RequirePackage[draft=false]{scrlayer-scrpage}
\KOMAoptions {twoside = false}
\prop_map_inline:Nn \g_ptxcd_unknown_clsopts_prop {
  \cs_if_exist:cT {KV@KOMA.scrartcl.cls@#1} {
    \tl_if_empty:nTF {#2}
      {\KOMAoptions{#1}}
      {\KOMAoption{#1}{#2}
    }
  }
}
\renewcommand*\sectionlinesformat[4]{%
  \parbox{\linewidth}{
    \bool_if:cT {g__ptxcd_ruled_#1_bool} {
      \rule[5\g_ptxcd_titlerule_dim]{\linewidth}{\g_ptxcd_titlerule_dim}\par\nointerlineskip
    }
    \@hangfrom{%
      \hskip #2#3}{
      \tl_if_eq:nnT {#1} {task} {
        \exp_args:No \tl_if_empty:nF {#4}
        {:~}
        \bool_if:NT \l__ptxcd_points_auto_bool {
          \exp_args:NNx \prop_get:NnN \g__ptxcd_loaded_points_prop {\thetask} \l_ptxcd_tmp_tl
          \quark_if_no_value:NF \l_ptxcd_tmp_tl {
            \fp_set:Nn \l__ptxcd_task_points_fp  {\l_ptxcd_tmp_tl}
          }
        }
      }
      #4
      \tl_if_in:nnT {#1} {task} {
        \tl_if_empty:cTF{l__ptxcd_#1_credit_tl}
        {\pointformat{\fp_to_decimal:c {l__ptxcd_#1_points_fp}}}
        {\creditformat{\tl_use:c {l__ptxcd_#1_credit_tl}}}
      }
      \rule[-\dp\strutbox]{0pt}{\dp\strutbox}\par}\nointerlineskip
    \skip_vertical:n {\ptxcd_titlerule_sep: -\dp\strutbox}
    \bool_if:cT {g__ptxcd_ruled_#1_bool}
      {\smash{\rule{\linewidth}{\g_ptxcd_titlerule_dim}}}
  }
}
\RequirePackage{tudafonts}
\dim_new:N \g_ptxcd_innerMargin_dim
\dim_new:N \g_ptxcd_outerMargin_dim
\dim_new:N \g_ptxcd_bottomMargin_dim
\dim_new:N \g_ptxcd_topMargin_dim

\int_compare:nTF {4<=\g_ptxcd_paper_int<=5}
{
\dim_gset:Nn \g_ptxcd_bottomMargin_dim {20mm}
\dim_gset:Nn \g_ptxcd_outerMargin_dim {15mm}
\dim_gset_eq:NN \g_ptxcd_innerMargin_dim \g_ptxcd_outerMargin_dim
\dim_gset_eq:NN \g_ptxcd_topMargin_dim \g_ptxcd_outerMargin_dim
}{
\int_compare:nT {1<=\g_ptxcd_paper_int<=3}
{
\dim_gset:Nn \g_ptxcd_bottomMargin_dim {35mm}
\dim_gset:Nn \g_ptxcd_outerMargin_dim {30mm}
\dim_gset_eq:NN \g_ptxcd_innerMargin_dim \g_ptxcd_outerMargin_dim
\dim_gset_eq:NN \g_ptxcd_topMargin_dim \g_ptxcd_outerMargin_dim
}
\int_compare:nT {\g_ptxcd_paper_int<=6}
{
\dim_gset:Nn \g_ptxcd_bottomMargin_dim {16mm}
\dim_gset:Nn \g_ptxcd_outerMargin_dim {12mm}
\dim_gset_eq:NN \g_ptxcd_innerMargin_dim \g_ptxcd_outerMargin_dim
\dim_gset_eq:NN \g_ptxcd_topMargin_dim \g_ptxcd_outerMargin_dim
}
\int_compare:nT {\g_ptxcd_paper_int<=7}
{
\dim_gset:Nn \g_ptxcd_bottomMargin_dim {15mm}
\dim_gset:Nn \g_ptxcd_outerMargin_dim {10mm}
\dim_gset_eq:NN \g_ptxcd_innerMargin_dim \g_ptxcd_outerMargin_dim
\dim_gset_eq:NN \g_ptxcd_topMargin_dim \g_ptxcd_outerMargin_dim
}
}

\dim_new:N \g_ptxcd_columnSep_dim
\dim_gset:Nn \g_ptxcd_columnSep_dim {10pt}
\dim_new:N \g_ptxcd_headheight_dim
\dim_gset:Nn \g_ptxcd_headheight_dim {\c_ptxcd_largerule_dim +\c_ptxcd_rulesep_dim +\c_ptxcd_smallrule_dim}
\bool_if:NTF  \g_ptxcd_geometry_bool {
\RequirePackage{geometry}
\geometry{
top=\g_ptxcd_topMargin_dim,
inner=\g_ptxcd_innerMargin_dim,
outer=\g_ptxcd_outerMargin_dim,
bottom=\g_ptxcd_bottomMargin_dim,
columnsep= \g_ptxcd_columnSep_dim,
includehead,
includefoot,
headheight=\g_ptxcd_headheight_dim
}
}{
\KOMAoptions{headinclude, footinclude}
      \KOMAoptions{headwidth=text,footwidth=text}
}
\newcommand*{\institution}[1]{
\def\ptxcd_institution{#1}
}
\gdef\ptxcd_datename{Datum}
\gdef\ptxcd_dateseparator{:~}
\setkomafont{disposition}{\sffamily\bfseries}
\cs_new:Nn \ptxcd_titlerule_sep: {\the\dp\strutbox}
\RequirePackage{tudacolors}
\setkomafont{pageheadfoot}{\sffamily\small}
\setkomafont{pagenumber}{}
\addtokomafont{captionlabel}{\sffamily}
\addtokomafont{caption}{\sffamily}
\cs_new:Nn \__ptxcd_preamble_ConfigureHeadline:n {
  \tl_if_empty:nF {#1} {\keys_set:nn {ptxcd/exercise/headline} {#1}}
}
\cs_new:Nn \ptxcd_ConfigureHeadline:n {
  \__ptxcd_preamble_ConfigureHeadline:n {#1}
  \ptxcd_update_headline_boxes:
  \__ptxcd_adjust_headheight:
}
\NewDocumentCommand{\ConfigureHeadline}{m}{\__ptxcd_preamble_ConfigureHeadline:n {#1}}
\bool_if:NT \g__ptxcd_compatibility_bool {
  \cs_new:Npn \__ptxcd_env_to_tl_aux:w #1 \q_stop { \tl_gset:Nn     \g__ptxcd_headline_oneside_tl {#1} }
  \NewDocumentEnvironment{examheader}{+b}{}{
    \tl_gset:Nn \g__ptxcd_headline_oneside_tl {#1}
    \tl_gset:Nn \g__ptxcd_headline_odd_tl {#1}
    \tl_gset:Nn \g__ptxcd_headline_even_tl {#1}
    \ptxcd_ConfigureHeadline:n {}
  }
  \newcommand*{\examheaderdefault}{\par\StudentName\StudentID}
}
\cs_new:Nn \ptxcd_update_headline_boxes: {
  \clist_map_inline:nn {even, odd, oneside}
  {
    \tl_if_empty:cF {g__ptxcd_headline_##1_tl} {
      \vbox_gset:cn {g__ptxcd_headline_##1_box} {
        \begin{minipage}[b]{\textwidth}
          \usekomafont{pagehead}
          \raggedright
          \leavevmode\rule{\z@}{\dimexpr\ht\strutbox+\c_ptxcd_rulesep_dim}
          \ignorespaces
          \use:c {g__ptxcd_headline_##1_tl}\ignorespaces\strut
          \par\vspace{\z@}
        \end{minipage}
      }
    }
  }
}
\cs_new:Nn \__ptxcd_adjust_headheight: {
  \if@twoside
    \dim_set:Nn \l_tmpa_dim {
      \dim_max:nn
      {\box_ht:N \g__ptxcd_headline_odd_box+\box_dp:N \g__ptxcd_headline_odd_box}
      {\box_ht:N \g__ptxcd_headline_even_box+\box_dp:N \g__ptxcd_headline_even_box}
    }
  \else
    \dim_set:Nn \l_tmpa_dim {
      \box_ht:N \g__ptxcd_headline_oneside_box
      + \box_dp:N \g__ptxcd_headline_oneside_box
    }
  \fi
  \dim_compare:nT {\l_tmpa_dim > \z@}
  {
    \dim_add:Nn \l_tmpa_dim {\box_dp:N \ptxcd_headrule_box +\c_ptxcd_rulesep_dim}
    \KOMAoptions{headinclude, headheight=\l_tmpa_dim,headsepline = .5\c_ptxcd_smallrule_dim}
    \if@twoside
      \cehead{\box_use:c {g__ptxcd_headline_even_box}}
      \cohead{\box_use:c {g__ptxcd_headline_odd_box}}
    \else
      \chead{\box_use:c {g__ptxcd_headline_oneside_box}}
    \fi
    \global\setlength{\headheight}{\l_tmpa_dim}
  }
}
\newpairofpagestyles{TUDa.exercise}{
  \KOMAoptions{plainfootsepline,headtopline,plainheadtopline}
  \KOMAoptions {
    headwidth=text,
    footwidth=text
  }
  \setkomafont{pagehead}{}
  \box_if_exist:NF \ptxcd_headrule_box {
    \ptxcd_makeheadrule[color=identbarcolor, width=\sls@headwidth]{ptxcd_headrule}
  }
  \ModifyLayer[
    background,
    height=\box_dp:N \ptxcd_headrule_box,
    align=tl,
    voffset=\g_ptxcd_topMargin_dim,
    contents=\raisebox{\depth}{\box_use:N \ptxcd_headrule_box},
  ]{plain.TUDa.exercise.head.above.line}
  \ModifyLayer[
    background,
    height=\box_dp:N \ptxcd_headrule_box,
    align=tl,
    voffset=\g_ptxcd_topMargin_dim,
    contents=\raisebox{\depth}{\box_use:N \ptxcd_headrule_box},
  ]{TUDa.exercise.head.above.line}
  \ofoot[\pagemark]{\pagemark}
  \ModifyLayer[addvoffset=\c_ptxcd_rulesep_dim]{TUDa.exercise.foot.even}
  \ModifyLayer[addvoffset=\c_ptxcd_rulesep_dim]{TUDa.exercise.foot.odd}
  \ModifyLayer[addvoffset=\c_ptxcd_rulesep_dim]{TUDa.exercise.foot.oneside}
  \ModifyLayer[addvoffset=\c_ptxcd_rulesep_dim]{plain.TUDa.exercise.foot.even}
  \ModifyLayer[addvoffset=\c_ptxcd_rulesep_dim]{plain.TUDa.exercise.foot.odd}
  \ModifyLayer[addvoffset=\c_ptxcd_rulesep_dim]{plain.TUDa.exercise.foot.oneside}
}
\DeclarePageStyleAlias{TUDa}{TUDa.exercise}
\DeclarePageStyleAlias{plain.TUDa}{plain.TUDa.exercise}
\renewcommand{\titlepagestyle}{plain.TUDa}
\pagestyle{TUDa}
\seq_new:N \g_ptxcd_author_seq
\renewcommand*\author[1]{
\seq_gset_split:Nnn \g_ptxcd_author_seq {\and} {#1}
}
\msg_new:nnn{tudapub} {unknown-language} {
  You~selected~an~unknown~language~#1.\\
  The~Variable~#2~does~not~have~a~predefined~value.\\
  Ensure~to~redefine~#2~to~match~your~language.\\
  Otherwise~the~ngerman~vaue~#3~will~be~used.
}
\cs_new:Nn \ptxcd_define_captionFallback:Nn {
  \providecommand*#1{
    \msg_warning:nnxxx{tudapub} {unknown-language}
    {\languagename} {\exp_not:N #1} {#2}
    \def#1{#2}
  }
}
\cs_new:Nn \ptxcd_declare_caption:Nnnn {
  \ptxcd_define_captionFallback:Nn #1 {#2}
  \defcaptionname{ngerman, german}{#1}{#2}
  \defcaptionname{english, USenglish, american}{#1}{#3}
  \defcaptionname{UKenglish, british}{#1}{#4}
}
\cs_new:Nn \ptxcd_declare_caption:Nnn {
  \ptxcd_declare_caption:Nnnn #1 {#2} {#3} {#3}
}
\ptxcd_declare_caption:Nnn \authorandname {und} {and}
\renewcommand*{\@author}{
  \seq_use:Nnnn \g_ptxcd_author_seq {~\authorandname{}~} {,~} {~\&~}
}
\tl_new:N \g_ptxcd_shorttitle_tl
\RenewDocumentCommand{\title}{om}{
  \IfNoValueTF{#1}{
    \tl_gset:Nn  \g_ptxcd_shorttitle_tl {#2}
  }{
    \tl_gset:Nn \g_ptxcd_shorttitle_tl {#1}
  }
  \def\@title{#2}
}
\newcommand*{\subsubtitle}[1]{
  \def\@subsubtitle{#1}
}
\subsubtitle{}
\newcommand*{\ptxcd_title@footnote}[2][1]{
  \textsuperscript{\@fnsymbol{#1}}#2
}
\renewcommand*{\@maketitle}{%
\global\@topnum=\z@
\setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
\vspace*{-\dim_eval:n {
    \headheight
    -\c_ptxcd_largerule_dim -\c_ptxcd_rulesep_dim
    +\headsep
    +\ht\strutbox
    +\p@
  }}
\par
\nointerlineskip
\begingroup
\setlength{\fboxsep}{\z@}
\bool_if:NT \g_ptxcd_colorback_bool {\colorbox{accentcolor}}{\parbox[t]{\linewidth}{
    \rule{0pt}{\bool_if:NTF \g_ptxcd_smalltitle_bool {.25} {.5}\c_ptxcd_logoheight_dim}
    \par\nointerlineskip
    \raisebox{-\height}{%
      \begin{minipage}[t]{\dimexpr\linewidth-\__ptxcd_logowidth:-1ex}
        \bool_if:NT \g_ptxcd_colorback_bool  {\begin{addmargin}{3mm}}
            \raggedright
            \bool_if:NT \g_ptxcd_colorback_bool {\color{textonaccentcolor}}
            \tl_if_empty:NF \@titlehead {\usekomafont{titlehead}{\@titlehead\par}}
            \leavevmode\usekomafont{title}%
            {\usekomafont{title}\bool_if:NTF \g_ptxcd_smalltitle_bool {\LARGE} {\huge} {\@title\par}}%
            \vskip 1em
            \bool_if:NF \g__ptxcd_compatibility_bool
            {
              {\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\fi}%
              \gdef\@subtitle{}
              \vskip .5em
            }
            {
              \xdef\@author {\@author}
              \ifx\@author\@empty\else\usekomafont{author}\@author\par\fi
            }
            \vskip .5em
            \bool_if:NTF \g_ptxcd_colorback_bool {\end{addmargin}} {\par}
      \end{minipage}}
    \tl_if_empty:NF \g_ptxcd_logofile_tl {
      \hfill\raisebox{\dim_eval:n {
          \bool_if:NTF \g_ptxcd_colorback_bool
          {-\height}
          {-.9\c_ptxcd_logoheight_dim}
        }}
      [0pt]
      [\dim_eval:n {
          \bool_if:NTF \g_ptxcd_smalltitle_bool
          {\bool_if:NTF \g_ptxcd_colorback_bool {1.15}{1}}
          {\bool_if:NTF \g_ptxcd_colorback_bool {1.5}{1.3}
          }\c_ptxcd_logoheight_dim}]
      {\makebox[\__ptxcd_logowidth:][l]{\__ptxcd_insert_logo:}}
    }
    \par\medskip
  }}
\par
\nointerlineskip
\rule{\linewidth}{\g_ptxcd_titlerule_dim}
\exp_args:Nf \tl_if_empty:nF {\g_ptxcd_ex_sheetnum_tl\@date\g_ptxcd_ex_term_tl\use:c {@subsubtitle}\@subtitle}{
  \par\nointerlineskip
  \bool_if:NT \g_ptxcd_colorback_bool {\colorbox{accentcolor}}{
    \parbox{\linewidth}{
      \begin{minipage}{\linewidth}
        \bool_if:NT \g_ptxcd_colorback_bool {
          \color{textonaccentcolor}
          \begin{addmargin}{3mm}
            }
            \null\par
            \def\ptxcd_nextsep{}
            \clist_map_inline:nn {@subtitle, @subsubtitle, g_ptxcd_ex_term_tl, @date} {
              \tl_if_empty:cF {##1} {\ptxcd_nextsep\use:c {##1}\def\ptxcd_nextsep{\\}}
            }
            \tl_if_empty:NF \g_ptxcd_ex_sheetnum_tl {\ptxcd_nextsep\sheetname\sheetsep\g_ptxcd_ex_sheetnum_tl}
            \bool_if:NT \g_ptxcd_colorback_bool {\end{addmargin}}
      \end{minipage}
      \vspace*{\dp\strutbox}
    }}\par\nointerlineskip
  \rule{\linewidth}{\g_ptxcd_titlerule_dim}
}
\par
\bool_if:NT  \g_ptxcd_headontitle_bool {
  \if@twoside
    \box_use:N \g__ptxcd_headline_odd_box
  \else
    \box_use:N \g__ptxcd_headline_oneside_box
  \fi
  \par
  \rule{\linewidth}{\g_ptxcd_titlerule_dim}
  \par
}
\endgroup
\vskip 2em
\ConfigureHeadline{}
}%
\setkomafont{subtitle}{\bfseries}
\setkomafont{author}{}
\setkomafont{date}{}
\newkomafont{sheetnumber}{\usekomafont{date}}
\newkomafont{term}{\usekomafont{date}}
\date{}
\tl_new:N \g_ptxcd_ex_sheetnum_tl
\newcommand*{\sheetnumber}[1]{\tl_gset:Nn \g_ptxcd_ex_sheetnum_tl {#1}}
\sheetnumber{}
\tl_new:N \g_ptxcd_ex_term_tl
\newcommand*{\term}[1]{\tl_gset:Nn \g_ptxcd_ex_term_tl {#1}}
\term{}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\hypersetup{hidelinks, unicode}
\providecaptionname{ngerman, german}{\sheetname}{Übungsblatt}
\providecaptionname{english, american, british}{\sheetname}{Sheet}
\newcommand*{\sheetsep}{~}
\providecaptionname{ngerman, german}{\taskname}{Aufgabe}
\providecaptionname{english, american, british}{\taskname}{Task}
\newcommand*{\tasksep}{~}%TODO
\providecaptionname{ngerman, german}{\solutionname}{Lösungsvorschlag}
\providecaptionname{english, american, british}{\solutionname}{Solution}
\newcommand*{\solutionsep}{:~}
\providecaptionname{ngerman, german}{\StudentNamename}{Nachname,~Vorname}
\providecaptionname{english, american, british}{\StudentNamename}{Last Name,~ First Name}
\newcommand*{\StudentNamesep}{:~}
\providecommand{\StudentIDname}{Matrikelnummer}
\providecaptionname{ngerman, german}{\StudentIDname}{Matrikelnummer}
\providecaptionname{english, american, british}{\StudentIDname}{Enrollment ID}
\newcommand*{\StudentIDsep}{:~}
\providecommand{\creditformat}[1]{\space(#1)}
\providecommand{\creditformatsum}[1]{\creditformat{#1}}
\newcommand*{\pointformat}[1]{
  \fp_compare:nF {#1 = 0} {
    \bool_if:NTF \l__ptxcd_points_auto_bool
    \creditformatsum
    \creditformat
    {
      \fp_to_decimal:n {#1}\space
      \fp_compare:nTF {#1=1}
      \PointName
      \PointsName
    }
  }
}
\providecaptionname{ngerman, german}{\PointName}{Punkt}
\providecaptionname{english, american, british}{\PointName}{Point}
\providecommand{\PointsName}{Punkte}
\providecaptionname{ngerman, german}{\PointsName}{Punkte}
\providecaptionname{english, american, british}{\PointsName}{Points}
\AtBeginDocument{
  \ptxcd_update_headline_boxes:
  \__ptxcd_adjust_headheight:
  \global\let\ConfigureHeadline\ptxcd_ConfigureHeadline:n
}
\DeclareSectionCommand[%
  style=section,%
  level=2,%
  indent=\z@,%
  beforeskip=\cs_if_exist_use:NF \scr@subsection@beforeskip {-3.25ex\@plus -1ex \@minus -.2ex},%
  afterskip=\cs_if_exist_use:NF \scr@subsection@afterskip {1.5ex \@plus .2ex},%
  tocstyle=section,%
  tocindent=\cs_if_exist_use:NF \scr@tso@subsection@indent {1.5em},%
  tocnumwidth=\cs_if_exist_use:NF \scr@tso@subsection@numwidth {2.3em},%
]{task}
\renewcommand*{\thetask}{
  \g_ptxcd_ex_sheetnum_tl\tl_if_empty:NF \g_ptxcd_ex_sheetnum_tl{.}
  \arabic{task}
}
\newcommand*{\tasklabel}{\thetask}
\renewcommand*{\taskformat}{\taskname\tasksep\tasklabel{}}
\let\@task\task
\cs_undefine:N \task
\NewDocumentEnvironment{task}{om}{
  \IfNoValueF{#1}{\keys_set:nn {ptxcd/task}{#1}}
  \@task{#2}
  \edef\@currenttasklabel{\tasklabel}
}{
  \__ptxcd_save_task_properties:nnnn {} {\thetask} {#2} {
    \bool_if:NTF \l__ptxcd_points_auto_bool {
      \fp_to_decimal:N \g__ptxcd_ex_collected_points_fp
    }{
      \fp_to_decimal:N \l__ptxcd_task_points_fp
    }
  }
  \fp_gzero:N \g__ptxcd_ex_collected_points_fp
}
\cs_new:Nn \__ptxcd_save_task_properties:nnnn {
    \iow_now:Ne \@auxout {
            \exp_not:N \ptxcd@TaskProperties {#1} {#2} {
                \tl_if_empty:cF  {l__ptxcd_#1credit_tl} {credit=\tl_to_str:v  {l_ptxcd_#1credit_tl},}
                \tl_if_blank:nF {#3} {title={\tl_to_str:n {#3}},}
            } {#4}
     }
     \prop_gput:cee {g__ptxcd_#1points_collector_prop}
        {#2} {#4}
}
\cs_generate_variant:Nn \__ptxcd_save_task_properties:nnnn {nnon}
\iffalse
\newcommand*{\addsubtasktocentry}[4]{
    \show\subtaskentry
    %%    {Dateierweiterung }{Ebene }{Gliederungsnummer }{Eintrag }
    %\IfArgIsEmpty {#3}{\addcontentsline {#1}{#2}{\protect \nonumberline #4}}{\addcontentsline {#1}{#2}{\protect \numberline {#3}#4}}
    \tocbasic@addxcontentsline{#1}{#2}{#3}{#4}
    \iow_now:Ne \@auxout {
        \exp_not:N \ptxcd@TaskProperties {\the\c@task} {\the\c@subtask} {\tl_to_str:n {#2}} {
            \bool_if:NTF \l__ptxcd_points_auto_bool {
                \fp_to_decimal:N \l__ptxcd_task_points_fp
            }{
                \fp_to_decimal:N \g__ptxcd_ex_collected_points_fp
            }
        }
    }
}
\fi

\newcommand*\ptxcd@TaskProperties [4]{
    \prop_gput:cnn {g__ptxcd_#1points_collector_prop}
        {#2} {#4}
    \clist_map_inline:nn {#3} {
        \prop_gput_from_keyval:Nn \g__ptxcd_property_collector_prop {
            #2-##1
        }
    }
    \prop_gput:Nnn \g__ptxcd_property_collector_prop {#2-points} {#4}
}
\cs_set_eq:cN {task*} \task
\cs_set_eq:cN {endtask*} \endtask
\DeclareSectionCommand[%
  style=section,%
  level=3,%
  indent=\z@,%
  beforeskip=\cs_if_exist_use:NF \scr@subsubsection@beforeskip {-3.25ex\@plus -1ex \@minus -.2ex},%
  afterskip=\cs_if_exist_use:NF \scr@subsubsection@afterskip {1.5ex \@plus .2ex},%
  tocstyle=subsection,%
  tocindent=\cs_if_exist_use:NF \scr@tso@subsubsection@indent {1.5em},%
  tocnumwidth=\cs_if_exist_use:NF \scr@tso@subsubsection@numwidth {2.3em},%
  counterwithin=task,%
]{subtask}
\bool_if:NT \g__ptxcd_runin_subtask_bool {
  \RedeclareSectionCommand[runin=true]{subtask}
}
\renewcommand*{\thesubtask}{\alph{subtask})}
\newcommand*{\subtasklabel}{\thetask\thesubtask}
\renewcommand*{\subtaskformat}{\subtasklabel\enskip}
\setkomafont{subtask}{\mdseries\normalsize}
\let\@subtask\subtask
\cs_undefine:N \subtask
\NewDocumentEnvironment{subtask}{o}{
  \begingroup
    \tl_if_in:nnTF {#1} {=} {
      \keys_set:nn {ptxcd/subtask} {#1}
    } {
     \keys_set:nn {ptxcd/subtask} {title={#1}}
    }
    \bool_if:NTF \l__ptxcd_subtask_fallback_bool {
      \@subtask{\IfNoValueF{#1}{#1}}
    }{
      \@subtask{\l__ptxcd_title_tl}
    }
  \edef\@currenttasklabel{\subtasklabel}
    \__ptxcd_save_task_properties:nnon {subtask_} {\@currenttasklabel}
      {\l__ptxcd_title_tl} {\fp_to_decimal:N  \l__ptxcd_subtask_points_fp}
    \bool_if:NT  \g__ptxcd_runin_subtask_bool \strut
    \tl_gset_eq:NN \g_tmpa_tl \@currentlabel
  \endgroup
  \edef\@currentcounter{subtask}
  \protected@edef\@currentlabel{\p@subtask\thesubtask}
}{}
\NewDocumentEnvironment{subtask*}{om}{
  \begingroup
  \IfNoValueF{#1}{\keys_set:nn {ptxcd/subtask}{#1}}
  \@subtask{#2}
  \tl_gset_eq:NN \g_tmpa_tl \@currentlabel
  \endgroup
  \tl_set_eq:NN \@currentlabel \g_tmpa_tl
}{}
    \DeclareSectionCommand[%
      style=section,%
      level=3,%
      indent=\z@,%
      beforeskip=\cs_if_exist_use:NF \scr@subsubsection@beforeskip {-3.25ex\@plus -1ex \@minus -.2ex},%
      afterskip=\cs_if_exist_use:NF \scr@subsubsection@afterskip {1.5ex \@plus .2ex},%
      tocstyle=subsection,%
      tocindent=\cs_if_exist_use:NF \scr@tso@subsubsection@indent {1.5em},%
      tocnumwidth=\cs_if_exist_use:NF \scr@tso@subsubsection@numwidth {2.3em},%
    ]{@solution}
    \setkomafont{@solution}{\normalfont}
    \cs_new:Nn \__ptxcd_solutionheader: {
      \@solution*{\solutionname\solutionsep}
      \if@newlist\global\@newlistfalse\fi
    }
\box_new:N \g_ptxcd_NumberForm_box
\hbox_gset:Nn \g_ptxcd_NumberForm_box {
  \rule{\fboxrule}{1ex}
  \rule{1em}{\fboxrule}
  \rule{\fboxrule}{1ex}
  \,
}
\newcommand*\ptxcd_StudentID[1][7]{
  \StudentIDname\StudentIDsep\prg_replicate:nn {#1} {\box_use:N \g_ptxcd_NumberForm_box}
}
\let\StudentID\ptxcd_StudentID
\newcommand*\ptxcd_StudentName{
  \StudentNamename\StudentNamesep\hrulefill\qquad
}
\let\StudentName\ptxcd_StudentName
\let\ShortTitle\g_ptxcd_shorttitle_tl
\bool_if:NT \g__ptxcd_compatibility_bool {
  \cs_set_eq:NN \c@subsection \c@task
  \cs_set_eq:NN \subsection \task
  \cs_set_eq:NN \c@subsubsection \c@subtask
  \cs_set_eq:NN \subsubsection \subtask
  \cs_set_eq:NN \thetask \thesubsection
  \cs_set_eq:NN \thesubtask \thesubsection
}
\file_if_exist_input:n {\g__ptxcd_config_prefix_tl\g_ptxcd_department_str.cfg}
\ptxcd_makeheadrule[color=identbarcolor, width=\textwidth]{ptxcd_headrule}
\cs_if_exist:NTF \AddtoDoHook {
  \AddtoDoHook{heading/preinit/subtask}{
    \bool_if:NT \g__ptxcd_points_bool {
      \fp_gadd:Nn \g__ptxcd_ex_collected_points_fp {\l__ptxcd_subtask_points_fp}
    }
  }
  \AddtoDoHook{heading/preinit/task}{
    \fp_gzero:N \g__ptxcd_ex_collected_points_fp
  }
} {
  \msg_warning:nnnn  {tudaexercise} {outdated-koma-script} {point~references} {3.27}
}
\msg_new:nnn {tudaexercise} {points-differ} {
  Value~of~points~changed~for~at~least~one~task.\\
  Please~rerun~LaTeX~to~get~correct~references~and~calculations.
}
\msg_new:nnn {tudaexercise} {empty-point-mapping} {
  I~could~not~find~references~for~points~in~the~aux~file.\\
  Please~rerun~LaTeX~to~get~correct~references~and~calculations.
}
\msg_new:nnn {tudaexercise} {point-referencing-disabled} {
  You~try~to~use~#1.\\
  This~function~is~only~available~with~points=true~or~points=auto.\\
  Please~activate~referencing~to~use~it.
}
\bool_if:NTF \g__ptxcd_points_bool {
  \BeforeClosingMainAux{
    \tl_clear:N \l_tmpa_tl
    \tl_clear:N \l_tmpb_tl
    \fp_zero:N \l_tmpa_fp
    \prop_map_inline:Nn  \g__ptxcd_points_collector_prop {
      \tl_put_right:Nn \l_tmpa_tl {#1=#2,}
      \fp_add:Nn \l_tmpa_fp {#2}
    }
    \prop_map_inline:Nn  \g__ptxcd_subtask_points_collector_prop {
      \tl_put_right:Nn \l_tmpa_tl {#1=#2,}
    }
    \prop_map_inline:Nn \g__ptxcd_loaded_points_prop {
      \tl_put_right:Nn \l_tmpb_tl {#1=#2,}
    }
    \tl_if_eq:NNF \l_tmpa_tl \l_tmpb_tl {
      \msg_warning:nn {tudaexercise} {points-differ}
    }
    \iow_now:Nx \@auxout{
      \exp_not:N \ptxcd@LoadPoints[\the\c@task][\fp_use:N \l_tmpa_fp]{\l_tmpa_tl}
    }
  }
  \cs_new:Nn \__ptxcd_getPoints:n {
    \prop_if_in:NnTF \g__ptxcd_loaded_points_prop {#1}
    {\prop_item:Nn \g__ptxcd_loaded_points_prop {#1}}
    {\nfss@text{\reset@font\bfseries??}}
  }
  \cs_generate_variant:Nn \__ptxcd_getPoints:n {x}
  \newcommand{\getPoints}[1]{\__ptxcd_getPoints:x {#1}}
  \newcommand{\refPoints}[1]{
    \edef\x{#1}
    \cs_if_exist:cTF {r@\x} {
      \str_if_in:cnTF {r@\x} {subtask} {
        \tl_set_eq:Nc \l_tmpa_tl {r@\x}
        \getPoints{\tl_item:Nn \l_tmpa_tl  {2}\tl_item:Nn \l_tmpa_tl  {1}}
      } {
        \getPoints{\tl_head:v {r@\x}}
      }
    }{
      \nfss@text{\reset@font\bfseries??}
    }
  }
  \newcommand{\getPointsTotal}{
    \fp_use:N \g__ptxcd_points_total_fp
  }
\NewDocumentCommand{\getTaskProperty}{O{\@currenttasklabel}m}{
    \exp_args:Ne \tl_show:n {#1-#2}
    \prop_if_in:NnTF \g__ptxcd_property_collector_prop {#1-#2}
        {\prop_item:Nn \g__ptxcd_property_collector_prop {#1-#2}}
        {{\nfss@text{\reset@font\bfseries??}}}
}

  \NewDocumentCommand{\mapPoints}{sO{1}m}{
    \mapTasks[skip-zero-points=true,\IfBooleanF{#1}{subtask=false},start-task=#2]{#3}{#3}
  }
\cs_new:Nn \__ptxcd_point_mapping_aux:nnn {
  \bool_set_true:c {l__ptxcd_#1_bool}
  \cs_set:ce {__ptxcd_cached_#1_counter:} {\int_eval:n {\value{#1}}}
  \setcounter{#1}{#2}
\bool_while_do:cn  {l__ptxcd_#1_bool} {
          \prop_get:NeNTF \g__ptxcd_loaded_points_prop {\use:c {#1label}} \l_tmpa_tl {
      \bool_if:NT \l__ptxcd_skip_zero_points_bool
        {\fp_compare:nF {\l_tmpa_tl = 0}}
        \use:n
          {
            \tl_build_put_right:Ne \l_ptxcd_tmp_tl {
             \exp_not:c {__ptxcd_map_points_#1:nn} {\use:c {#1label}} {\l_tmpa_tl}
            }
          }
      #3
      \stepcounter{#1}
    } {\bool_set_false:c {l__ptxcd_#1_bool}}
  }
  \setcounter{#1}{\use:c {__ptxcd_cached_#1_counter:}}
}
\keys_define:nn {ptxcd/task-mapping} {
  task .bool_set:N = \l__ptxcd_task_bool,
  task .initial:n = false,
  subtask .bool_set:N = \l__ptxcd_subtask_bool,
  subtask .initial:n = false,
  skip-zero-points .bool_set:N = \l__ptxcd_skip_zero_points_bool,
  skip-zero-points .initial:n = false,
  start-task .int_set:N = \l__ptxcd_start_task_int,
  start-task .initial:n = 1,
}

\NewDocumentCommand{\mapTasks}{O{}+m+m}{
  \cs_gset:Ne \__ptxcd_restore_task_counters: {
    \exp_not:N \setcounter{task}{\the\value{task}}
    \exp_not:N \setcounter{subtask}{\the\value{subtask}}
  }
  \group_begin:
    \keys_set:ne {ptxcd/task-mapping} {
      task = true,
      subtask=true,
      #1
    }
    \cs_gset:Nn \__ptxcd_map_points_task:nn {#2}
    \cs_gset:Nn \__ptxcd_map_points_subtask:nn {#3}

  \prop_if_empty:NTF \g__ptxcd_loaded_points_prop {
    \msg_warning:nn {tudaexercise} {empty-point-mapping}
    \tl_set:Nn \l_ptxcd_tmp_tl {\__ptxcd_map_points_task:nn {?task?} {?points?}}
  } {
      \tl_build_begin:N \l_ptxcd_tmp_tl
      \exp_args:Nne \use:n {
        \bool_if:NTF \l__ptxcd_task_bool \use:n \use_ii:nn
          {\__ptxcd_point_mapping_aux:nnn  {task} {\int_use:N \l__ptxcd_start_task_int}}
      }{
        \bool_if:NT \l__ptxcd_subtask_bool {
          \exp_not:n {
            \bool_set_true:N \l__ptxcd_subtask_bool
            \__ptxcd_point_mapping_aux:nnn  {subtask} {1} {}
          }
        }
      }
    \tl_build_end:N \l_ptxcd_tmp_tl
  }
  \cs_gset_eq:NN \g_ptxcd_tmp_tl \l_ptxcd_tmp_tl
  \exp_last_unbraced:No
  \group_end:
  \g_ptxcd_tmp_tl
  \ifhmode\else\ifvoid\@arstrutbox\else\noalign\fi\fi
    {\__ptxcd_restore_task_counters:}
 }
} {
  \newcommand{\getPoints}[1]{
    \msg_error:nnn {tudaexercise} {point-referencing-disabled} {\getPoints}
  }
  \newcommand{\refPoints}[1]{
    \msg_error:nnn {tudaexercise} {point-referencing-disabled} {\refPoints}
  }
  \newcommand{\getPointsTotal}[1]{
    \msg_error:nnn {tudaexercise} {point-referencing-disabled} {\getPointsTotal}
  }
  \NewDocumentCommand{\mapPoints}{som} {
    \msg_error:nnn {tudaexercise} {point-referencing-disabled} {\mapPoints}
  }
  \NewDocumentCommand{\getTaskProperty}{om}{
    \msg_error:nnn {tudaexercise} {point-referencing-disabled} {\getTaskProperty}
  }
}
\int_new:N \g__ptxcd_max_task_int
\NewDocumentCommand{\ptxcd@LoadPoints}{oO{0}m}{
    \IfNoValueF{#1}{\int_gset:Nn \g__ptxcd_max_task_int {#1}}
      \prop_gset_from_keyval:Nn \g__ptxcd_loaded_points_prop {
      #3
    }
  \fp_gset:Nn \g__ptxcd_points_total_fp {#2}
}
\endinput
%%
%% End of file `tudaexercise.cls'.
