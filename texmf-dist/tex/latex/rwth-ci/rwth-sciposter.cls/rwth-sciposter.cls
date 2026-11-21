%%
%% This is file `rwth-sciposter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% rwth-sciposter.dtx  (with options: `class,initialize,identification')
%% rwth-ci.dtx  (with options: `options,class,sciposter,print')
%% rwth-sciposter.dtx  (with options: `options,processoptions,class,packages,body')
%% rwth-ci.dtx  (with options: `logoFallback')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from rwth-sciposter.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file rwth-sciposter.dtx rwth-ci.dtx rwth-sciposter.dtx rwth-ci.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}[2022-10-01]
\ProvidesExplClass{rwth-sciposter}{2026-04-03}{1.2}{Sciposter for RWTH-CI}
\tl_new:N \g_ptxcd_boxstyle_tl
\tl_gset:Nn \g_ptxcd_boxstyle_tl {RWTH}
\box_new:N \g_ptxcd_title_box

\dim_const:Nn \c_ptxcd_rulesep_dim {1cm}
\tl_new:N \g_ptxcd_logofile_tl
\prop_new:N \g_ptxcd_clsopts_prop
\int_new:N \g_ptxcd_paper_int
\bool_new:N \g__ptxcd_logo_bottom_bool
\str_const:Nn \c__ptxcd_base_str {
  sciposter
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
  logo .choice:,
  logo / bottom .code:n = { \bool_gset_true:N \g__ptxcd_logo_bottom_bool },
  logo / top .code:n = { \bool_gset_false:N \g__ptxcd_logo_bottom_bool },
  logo / head .meta:n = {logo=top},
  logo / foot .meta:n = {logo=bottom},
  logo .initial:n = {top},
  raggedright .bool_gset:N = \g__ptxcd_raggedright_bool,
  raggedright .initial:n = true,
  raggedright .default:n = true,
  raggedright .usage:n = load,
  fontsize .code:n = \prop_gput:Nnn \g_ptxcd_clsopts_prop {fontsize} {#1},
  fontsize .initial:n =
 23bp,
  paper .multichoices:nn = {
      a0%%,a1,a2,a3
}{
  \int_gset_eq:NN \g_ptxcd_paper_int  \l_keys_choice_int
      \exp_args:Nx \PassOptionsToPackage{\l_keys_choice_tl paper}{geometry}
    },
  paper .initial:n =
  a0,
  paper / landscape .code:n = \PassOptionsToPackage{landscape}{geometry},
  paper / portrait .code:n = \PassOptionsToPackage{portrait}{geometry},
  landscape / .choice:,
  landscape / true .meta:n = {paper = landscape},
  landscape / false .meta:n = {paper = portrait},
  portrait / .choice:,
  portrait / true .meta:n = {paper = portrait},
  portrait / false .meta:n = {paper = landscape},
  unknown .code:n = {\prop_gput:NVn \g_ptxcd_clsopts_prop \l_keys_key_tl {#1}},
}

\prop_gput:Nnn \g_ptxcd_clsopts_prop {captions} {nooneline}

\ProcessKeyOptions[ptxcd/sciposter]

\dim_new:N \g_ptxcd_margin_dim
\dim_const:Nn \c__ptxcd_logo_height_dim {90.5mm}
\dim_const:Nn \c__ptxcd_logo_sep_dim {14.15mm}
\prop_map_inline:Nn \g_ptxcd_clsopts_prop {
  \tl_if_empty:nTF {#2}
  {\PassOptionsToClass{#1}{scrartcl}}
  {\clist_map_inline:nn {#2} {\PassOptionsToClass{#1=##1}{scrartcl}}}
}
\RequirePackage{iftex}
\ifPDFTeX
\RequirePackage{anyfontsize}
\fi
\PassOptionsToPackage{typeareawarninfolimit=-1,DIV=10}{typearea}
\LoadClass[parskip=full-]{scrartcl}
\PassOptionsToPackage{fontdefaults}{rwth-fonts}
\RequirePackage{rwth-fonts}
\PassOptionsToPackage{cmyk}{rwth-colors}
\RequirePackage{rwth-colors}
\RequirePackage[margin=0pt]{geometry}
\RequirePackage{tcolorbox}
\tcbuselibrary{poster}
\RequirePackage{qrcode}

\setkomafont{disposition}{}
\setkomafont{title}{
  \fontsize{90bp}{108bp}\selectfont
}
\setkomafont{subtitle}{\fontsize{48bp}{58bp}\selectfont}
\setkomafont{author}{\bfseries}

\setkomafont{section}{\bfseries\fontsize{38bp}{46bp}\selectfont}
\setkomafont{subsection}{\bfseries\fontsize{38bp}{46bp}\selectfont}
\let\scr@fnt@wrn@pagefoot\relax
\setkomafont{pagefoot}{\fontsize{22.5bp}{27bp}\selectfont}
\setkomafont{captionlabel}{\bfseries}
\setkomafont{caption}{\fontsize{16bp}{20bp}\selectfont}
\tcbset{
RWTH/.style = {
empty,
coltitle=black,
colbacktitle=white,
coltext=black,
size=minimal,
boxrule=\z@,
leftrule=\z@,
rightrule=\z@,
fonttitle=\usekomafont{disposition}\usekomafont{section},
before~title={\strut},
toptitle=.5\c_ptxcd_rulesep_dim,
bottomtitle=.5\c_ptxcd_rulesep_dim,
top=.5\c_ptxcd_rulesep_dim,
bottom=.5\c_ptxcd_rulesep_dim,
parbox=false,
frame~empty,
interior~empty,
},
RWTH-inner/.style =
  {
    RWTH,
    fonttitle=\usekomafont{disposition}\usekomafont{subsubsection}
  }
}

\tcbposterset{boxes ={\g_ptxcd_boxstyle_tl}}

\tcbset{%
  poster/.cd,
  spacing=2\c_ptxcd_rulesep_dim,
  rows=6,
  showframe=false,
  prefix=TCBPOSTER@,
}

\tcbset{
every~ box~ on~ layer~ 3/.style={reset,\g_ptxcd_boxstyle_tl -inner},
every~ box~ on~ layer~ 4/.style={reset,\g_ptxcd_boxstyle_tl -inner},
}

\bool_if:NT \g__ptxcd_raggedright_bool {
\tcbset{RWTH/.append~style={halign=flush~left}}
}

\pagestyle{empty}
\renewcommand*{\title}[1]{\gdef \@title {#1}}
\tl_new:N \g_ptxcd_poster_qrcode_tl
\msg_new:nnnn {rwth-sciposter} {biblatex-required}{
  You~tried~to~use~#1.\\
  This~feature~requires~the~biblatex~package.
} {
  Try~to~remove~the~star~or~load~biblatex.
}
\NewDocumentCommand{\footerqrcode}{sm}{
  \IfBooleanTF {#1} {
    \cs_if_exist:NTF \blx@blxinit {
      \begingroup
      \blx@blxinit
      \entrydata{#2}{
        \tl_gset:Nx \g_ptxcd_poster_qrcode_tl{\thefield{url}}
      }
      \endgroup
    }{
      \msg_error:nnx {rwth-sciposter} {biblatex-required} {\use:c{footerqrcode*}}
    }
  }{
    \tl_gset:Nn \g_ptxcd_poster_qrcode_tl {#2}
  }
}
\seq_new:N \g_ptxcd_author_seq
\renewcommand*\author[1]{
  \seq_gset_split:Nnn \g_ptxcd_author_seq {\and} {#1}
}
\msg_new:nnn {rwth-sciposter} {unknown-language} {
  You~selected~an~unknown~language~#1.\\
  The~Variable~#2~does~not~have~a~predefined~value.\\
  Ensure~to~redefine~#2~to~match~your~language.\\
  Otherwise~the~ngerman~vaue~#3~will~be~used.
}
\providecommand*\authorandname{
  \msg_warning:nnxxx {rwth-sciposter} {unknown-language}
  {\languagename} {\exp_not:N \authorandname} {und}
  und
}
\defcaptionname{ngerman, german}{\authorandname}{und}
\defcaptionname{english, USenglish, american, UKenglish, british}{\authorandname}{and}
\renewcommand*{\@author}{
  \seq_use:Nnnn \g_ptxcd_author_seq {~\authorandname{}~} {,~} {~\&~}
}
\newcommand{\contactinfo}[1]{\def\@contactinfo{\ignorespaces#1}}
\contactinfo{}
\newcommand{\addressdata}[1]{\def\@addressdata{\ignorespaces#1}}
\addressdata{}
\AtBeginDocument{
  \@ifpackageloaded{babel}{
    \addto\extrasngerman{\def\authorandname{und}}
    \addto\extrasgerman{\def\authorandname{und}}
    \addto\extrasenglish{\def\authorandname{and}}
    \addto\extrasbritish{\def\authorandname{and}}
    \addto\captionsngerman{\renewcommand{\figurename}{Abb.}}
    \addto\captionsgerman{\renewcommand{\figurename}{Abb.}}
    \addto\captionsenglish{\renewcommand{\figurename}{Fig.}}
    \addto\captionsbritish{\renewcommand{\figurename}{Fig.}}
  }{}
}

\dim_new:N \g_ptxcd_bottom_margin_dim
\dim_new:N \g_ptxcd_footheight_dim
\dim_new:N \g_ptxcd_qrcode_dim
\dim_new:N \g_ptxcd_footsep_dim
\dim_new:N \g__ptxcd_footerblock_dim

\newlength{\contentwidth}
\newlength{\contentheight}
\tcbposterset{
  coverage =
    {
      spread,
      parbox=false,
      bottom=\dim_eval:n {\g_ptxcd_bottom_margin_dim+ \c_ptxcd_rulesep_dim},
      left=\g_ptxcd_margin_dim,
      right=\g_ptxcd_margin_dim,
      before= {\__ptxcd_poster_setup_margins_and_title:},
      top= \dim_eval:n {
        \bool_if:NTF \g__ptxcd_logo_bottom_bool  {.5\c__ptxcd_logo_height_dim+\g_ptxcd_margin_dim}  {1.5\c__ptxcd_logo_height_dim}
        + \box_dp:N \g_ptxcd_title_box
        + 2.5\c_ptxcd_rulesep_dim
      },
      underlay={%
          \node[
            inner~sep=0pt,
            anchor=north~east
          ](logo) at ([xshift=\dim_eval:n {-\g_ptxcd_margin_dim+\c__ptxcd_logo_sep_dim}]\paperwidth, \dim_eval:n {\bool_if:NTF \g__ptxcd_logo_bottom_bool {\g_ptxcd_bottom_margin_dim}{\paperheight}}){
            \__ptxcd_insert_logo:n {\c__ptxcd_logo_height_dim}
          };
          \node[anchor=base~west,inner~sep=0pt]  (title) at (
          \g_ptxcd_margin_dim,
          \dim_eval:n {\paperheight\bool_if:NTF \g__ptxcd_logo_bottom_bool  {-.5\c__ptxcd_logo_height_dim-\g_ptxcd_margin_dim} {-1.5\c__ptxcd_logo_height_dim}}
          ) {\box_use:N \g_ptxcd_title_box};
          \draw[line~width=1pt] (\g_ptxcd_margin_dim,\g_ptxcd_bottom_margin_dim) --++(\contentwidth,0)
          (\g_ptxcd_margin_dim,\dim_eval:n {\paperheight\bool_if:NTF \g__ptxcd_logo_bottom_bool {-\g_ptxcd_margin_dim} {-\c__ptxcd_logo_height_dim}}) --++(\contentwidth,0);
          \coordinate(lastpos) at (
          \g_ptxcd_margin_dim,
          \g_ptxcd_bottom_margin_dim- \g_ptxcd_footsep_dim
          ) ;
          \tl_if_empty:NF \g_ptxcd_poster_qrcode_tl
          {
            \node[anchor=north~west, inner~sep=\z@,outer~sep=\z@] (qrcode) at (lastpos)
            {
              \exp_args:NnV \use:n {\qrcode[height=\dim_use:N \g_ptxcd_qrcode_dim]}\g_ptxcd_poster_qrcode_tl
            };
            \coordinate (lastpos) at (qrcode.north~east);
          }
          \node[anchor=north~ west, inner~ sep=\z@] (contact) at ([xshift=2\c_ptxcd_rulesep_dim]lastpos) {
            \usekomafont{pagefoot}
            \parbox[t][\dim_eval:n {\g_ptxcd_qrcode_dim+\dp\strutbox}][t]{
              \dim_eval:n {
                \g__ptxcd_footerblock_dim
                - \g_ptxcd_qrcode_dim
                - 2\c_ptxcd_rulesep_dim
              }}{

              \raggedright
              \@author
              \par\medskip
              \vfill
              \strut\@contactinfo\strut
            }
          };
          \if@landscape
            \def\@temp{\use:n}
          \else
            \bool_if:NTF \g__ptxcd_logo_bottom_bool
            {\def\@temp{\use_none:n}}
            {\def\@temp{\use:n}}
          \fi
          \@temp
          {
            \node[anchor=\if@landscape north~west\else north~ east\fi, inner~ sep=\z@] (address) at (
            \dim_eval:n {
              \if@landscape
                \g_ptxcd_margin_dim
                + \g__ptxcd_footerblock_dim
                +2\c_ptxcd_rulesep_dim
              \else
                \paperwidth- \g_ptxcd_margin_dim
              \fi
            },
            \g_ptxcd_bottom_margin_dim- \g_ptxcd_footsep_dim)  {
              \usekomafont{pagefoot}
              \parbox[t][\dim_eval:n {\g_ptxcd_qrcode_dim+\dp\strutbox}][t]{
                \dim_eval:n {\if@landscape1.5\g__ptxcd_footerblock_dim+\c_ptxcd_rulesep_dim\else\g__ptxcd_footerblock_dim\fi}
              }{
                \raggedright
                \@addressdata
              }
            };
          }

        }
    }
}

\dim_new:N \g_ptxcd_titleblock_dim

\cs_new:Nn \__ptxcd_poster_setup_margins_and_title: {

  \if@landscape
    \tcbset{poster/columns=8}
    \dim_gset:Nn \g_ptxcd_margin_dim {4.39cm}
    \dim_gset:Nn \g_ptxcd_bottom_margin_dim  {9.05cm}
    \dim_set:Nn \g_ptxcd_qrcode_dim {2.5cm}
    \dim_gset:Nn \g_ptxcd_footsep_dim {1.25cm}
  \else
    \tcbset{poster/columns=6}
    \dim_gset:Nn \g_ptxcd_margin_dim {4cm}
    \bool_if:NTF \g__ptxcd_logo_bottom_bool  {
      \dim_gset:Nn \g_ptxcd_bottom_margin_dim  {9.05cm}
    } {
      \dim_gset:Nn \g_ptxcd_bottom_margin_dim  {11.4cm}
    }
    \dim_set:Nn \g_ptxcd_qrcode_dim {5.4cm}
    \bool_if:NTF \g__ptxcd_logo_bottom_bool
    {\dim_gset:Nn \g_ptxcd_footsep_dim {1.5cm}}
    {\dim_gset:Nn \g_ptxcd_footsep_dim {1.9cm}}
  \fi
  \setlength{\contentwidth}{\dimexpr\paperwidth-2\g_ptxcd_margin_dim\relax}
  \dim_gset:Nn  \g__ptxcd_footerblock_dim {
    \dim_eval:n {(2\contentwidth +4\c_ptxcd_rulesep_dim)/ \tcb@poster@columns - 2\c_ptxcd_rulesep_dim}
  }
  \hbox_gset:Nn \g_ptxcd_title_box {
    \parbox[t]{\contentwidth}{
      \raggedright
      \usekomafont{disposition}
      {\usekomafont{title}\leavevmode\strut\@title\strut\par}
      {\usekomafont{subtitle}\vskip.5ex\leavevmode\strut\@subtitle\strut\par}
    }
  }
}
\tl_if_empty:NT \g_ptxcd_logofile_tl {
  \msg_new:nnn {rwth-ci} {no-logo-selected} {You~did~not~select~a~logofile.\\
    I~will~try~to~use~the~example~logo~`rwth_mx`~and~enable~the~`accept-missing-logos`}
  \msg_warning:nn {rwth-ci} {no-logo-selected}
  \tl_gset:Nn \g_ptxcd_logofile_tl {rwth_mx}
  \tl_gset:Nn \g__ptxcd_logofile_ext_tl {.pdf}
  \bool_gset_true:N \g__ptxcd_logo_workaround_bool
}
\msg_new:nnn {rwth-ci} {missing-logofile} {%
  The~logofile~(#1)~could~not~be~found.\\
  Please~check~if~if~can~be~found~by~the~compiler.
}
\cs_new:Nn \__ptxcd_insert_logo:n {
  \file_if_exist:nTF {\g_ptxcd_logofile_tl\tl_if_empty:NTF \g__ptxcd_colormode_tl {_rgb} {_\g__ptxcd_colormode_tl}\g__ptxcd_logofile_ext_tl } {
    \bool_set_true:N \l_tmpa_bool
    \bool_set_true:N \l_tmpb_bool
  }{
    \bool_set_false:N \l_tmpa_bool
    \file_if_exist:nTF {\g_ptxcd_logofile_tl\g__ptxcd_logofile_ext_tl}
      {\bool_set_true:N \l_tmpb_bool}
      {\bool_set_false:N \l_tmpb_bool}
  }
  \bool_if:NTF \g__ptxcd_logo_workaround_bool {
    \bool_if:NTF \l_tmpb_bool
    \use_i:nn
    \use_ii:nn
  }{
    \use_i:nn
  }
  {\includegraphics[height=#1]{\g_ptxcd_logofile_tl\bool_if:NT \l_tmpa_bool {\tl_if_empty:NTF \g__ptxcd_colormode_tl {_rgb} {_\g__ptxcd_colormode_tl}}\g__ptxcd_logofile_ext_tl}}
  {
    \frame
    {\parbox[c][#1][c]{2.186\dimexpr#1}{\centering<Missing~Logo~file~\tl_to_str:N \g_ptxcd_logofile_tl>}}
    \msg_warning:nnV {rwth-ci} {missing-logofile} \g_ptxcd_logofile_tl
  }
}
\endinput
%%
%% End of file `rwth-sciposter.cls'.
