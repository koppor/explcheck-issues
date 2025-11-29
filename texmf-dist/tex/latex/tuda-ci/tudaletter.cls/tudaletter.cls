%%
%% This is file `tudaletter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tudaletter.dtx  (with options: `class,initialization')
%% tuda-ci.dtx  (with options: `options,letter,print,process-options,pdfa')
%% tudaletter.dtx  (with options: `class,packages')
%% tuda-ci.dtx  (with options: `pdfx')
%% tudaletter.dtx  (with options: `class,body')
%% tuda-ci.dtx  (with options: `xmpdata')
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
\ProvidesExplClass{tudaletter}{2025-11-13}{4.05}{Letters for TUDa-CI, Corporate Design of TU Darmstadt}
\str_const:Nn \c__ptxcd_base_str {letter}
\str_new:N  \g_ptxcd_department_str
\bool_new:N \g__ptxcd_adjust_textwidth_bool
\keys_define:nn {ptxcd/letter} {
  logo .bool_gset:N = \g__ptxcd_letter_logo_bool,
  logo .default:n = true,
  logo .initial:n = true,
  premium .bool_gset:N = \g__ptxcd_letter_premium_bool,
  premium .default:n = true,
  firstpagenumber .bool_gset:N = \g__ptxcd_firstpagenumber_bool,
  firstpagenumber .initial:n = true,
  raggedright .bool_gset:N = \g__ptxcd_letter_raggedright_bool,
  headrule .bool_gset:N = \g__ptxcd_letter_headrule_bool,
  headrule .initial:n = true,
  headrule .default:n = true,
  textwidth .choice:,
  textwidth / wide .code:n = \bool_gset_true:N \g__ptxcd_adjust_textwidth_bool,
  textwidth / narrow .code:n = \bool_gset_false:N  \g__ptxcd_adjust_textwidth_bool,
  textwidth .initial:n = wide,
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
        departmentlogofile=tuda_maschinenbau_logo,
        headrule=false,
        logo=false,
        textwidth=narrow,
      }
      \PassOptionsToPackage{identbar=Primary1,accent=Primary2}{tudacolors}
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
  pdfa .bool_gset:N = \g_ptxcd_pdfa_bool,
  pdfa .initial:n =
  true,
  pdfx .bool_gset:N = \g_ptxcd_pdfx_bool,
  pdfx .initial:n = true,
%% color options
%% color options
  color .meta:n = {accentcolor=#1},
  accentcolor .code:n = {\PassOptionsToPackage{accentcolor=#1}{tudacolors}},
  textaccentcolor .code:n = {\PassOptionsToPackage{textaccentcolor=#1}{tudacolors}},
  identbarcolor .code:n = {\PassOptionsToPackage{identbarcolor=#1}{tudacolors}},
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

\ProcessKeyOptions[ptxcd/\c__ptxcd_base_str]

\bool_if:NF \g_ptxcd_pdfa_bool {\bool_gset_false:N \g_ptxcd_pdfx_bool}

\bool_if:NT \g_ptxcd_pdfa_bool {
  \msg_new:nnn {tudapub} {colors-to-rgb} {
    You~did~not~add~a~color~profile.\\
    I~will~use~the~default~one~and~automatically~try~to~convert~internal~colors~to~RGB.\\
    This~is~required~to~be~able~to~create~PDF/A~compliance.
  }

  \cs_if_exist:NT \pdfmeta_standard_get:nN {
    \pdfmeta_standard_get:nN  {outputintent_A} \l_tmpa_tl
    \quark_if_no_value:NF \l_tmpa_tl  {
      \bool_gset_false:N \g_ptxcd_pdfx_bool
      \msg_new:nnn{tudapub} {pdfmanagement-detected} {
        I~detected~usage~of~l3pdfmeta~(\DocumentMetadata)~to~create~PDF/A.\\
        tudapub~will~not~load~pdfx~to~avoid~conflicts.\\
        To~disable~this~message~use~pdfx=false.
      }
      \msg_info:nn {tudapub} {pdfmanagement-detected}
    }
    \prop_if_in:NnF \g__pdfmeta_outputintents_prop {GTS_PDFA1} {
      \use_iii:nnn
    }
  }
  \bool_if:NT \g_ptxcd_pdfx_bool {
    \PassOptionsToPackage{RGB}{xcolor}
    \msg_info:nn {tudapub} {colors-to-rgb}
  }
}

\newcommand*{\@fontsizefilebase}{tudalettersize}
\PassOptionsToClass{fontsize=10pt,parskip=full-}{scrletter}
\PassOptionsToPackage{refline=nodate,addrfield=topaligned,firstfoot=false,pagenumber=botright}{scrletter}
\LoadClass{scrletter}
\RequirePackage{tudacolors}
\RequirePackage{tudafonts}
\RequirePackage{graphicx}
\RequirePackage{afterpage}
\RequirePackage{ragged2e}
\bool_if:NTF \g__ptxcd_letter_premium_bool {
  \cs_new:Nn \ptxcd_premiumcolor: {accentcolor}
  \cs_new:Nn \ptxcd_use_premiumcolor: {\color{accentcolor}}
  \cs_set:Nn \ptxcd_use_premiumcolor_text: {\color{textaccentcolor}}
}{
  \cs_new:Nn \ptxcd_premiumcolor: {black}
  \let\ptxcd_use_premiumcolor:\relax
  \let\ptxcd_use_premiumcolor_text:\relax
}
\dim_const:Nn \c_ptxcd_HeadMargin_dim {12.5mm}
\dim_const:Nn \c_ptxcd_LeftMargin_dim {24.0mm}
\dim_const:Nn \c__ptxcd_firstpage_extraindent_dim {-\paperwidth+120mm +\c_ptxcd_LeftMargin_dim  +\c_ptxcd_HeadMargin_dim}
\bool_if:NTF \g__ptxcd_adjust_textwidth_bool
  {
    \dim_const:Nn \c_ptxcd_RightMargin_dim  {\c_ptxcd_HeadMargin_dim}
  }{
    \dim_const:Nn \c_ptxcd_RightMargin_dim  {\c_ptxcd_HeadMargin_dim-\c__ptxcd_firstpage_extraindent_dim}
  }
\dim_const:Nn \c_ptxcd_BottomMargin_dim {20mm}
\dim_const:Nn \c_ptxcd_Linewidth_dim {\paperwidth-\c_ptxcd_LeftMargin_dim-\c_ptxcd_RightMargin_dim}
\RequirePackage{geometry}
\geometry{
  twoside=false,
  left=\c_ptxcd_LeftMargin_dim,
  right=\c_ptxcd_RightMargin_dim,
  bottom=\c_ptxcd_BottomMargin_dim,
  footskip=7mm,
}
\dim_const:Nn \c_ptxcd_textwidth_dim {\textwidth}
\bool_if:NTF \g__ptxcd_letter_logo_bool {
  \geometry{top=64mm}
} {
  \geometry{top=30mm}
}
\PassOptionsToPackage{hidelinks, unicode}{hyperref}
\bool_if:NT \g_ptxcd_pdfx_bool {
%% only apply the hack if pdfx is older than the working version
  \PassOptionsToPackage{a-2b}{pdfx}
%% Workaround posted by David Carlisle on tex.stackexchange
%% Thanks to Ulrike Fischer for mentioning it in #472
  \let \__ptxcd_grouplevel_before_pdfx: \currentgrouplevel
  \chardef\currentgrouplevel0
  \ExplSyntaxOff
  \RequirePackage{pdfx}
  \ExplSyntaxOn
  \let \currentgrouplevel \__ptxcd_grouplevel_before_pdfx:
  \cs_undefine:N \__ptxcd_grouplevel_before_pdfx:
%% end of the workaround

  \msg_new:nnn{tuda-ci} {prefer-lualatex} {
    You~use~pdfa-mode~in~#1.\\
    This~can~lead~to~incompatiblities~especially~with~older~compiler~versions.\\
    You~should~prefer~using~lualatex.
  }
  \msg_new:nnnn{tuda-ci} {outdated-package-pdfa} {
    Your~Version~of~the~#1-package~is~too~old~to~support~all~methods~required~by~tudapubs~pdfa-mode.\\
    Either~update~your~TeX-distribution~or~switch~to~pdfa=false.
  }{See~DEMO-tudapub~for~further~information.}

  \sys_if_engine_pdftex:T {
    \msg_warning:nnn{tuda-ci} {prefer-lualatex} {PDFTeX}
  }

  \sys_if_engine_xetex:T {
    \msg_warning:nnn{tuda-ci} {prefer-lualatex} {XeTeX}
  }
  \@ifpackageloaded{pdfx}{}{
      \msg_new:nnnn {tuda-ci} {pdfx-not-loaded} {
  The~pdfx~package~was~not~loaded.\\
  You~probably~used~\DocumentMetadata~but~did~not~select~PDF/A.\\
  I disable~pdfa~due~to~that~incompatiblity.
      } {Select~the~standard~using~the~pdfmanagement~to~enable~PDF/A~or~set~pdfa=false~to~disable~this~message.}
      \msg_error:nn {tuda-ci}{pdfx-not-loaded}
      \bool_gset_false:N \g_ptxcd_pdfx_bool
      \bool_gset_false:N \g_ptxcd_pdfa_bool
  }
  \@ifpackageloaded{xmpincl}{
      \@ifpackagelater{xmpincl}{2021/09/22}{}{
  \msg_error:nnn{tuda-ci}  {outdated-package-pdfa} {xmpincl}
      }
  }{}
}
\bool_if:NF \g_ptxcd_pdfx_bool {
  \RequirePackage{hyperref}
}
\RequirePackage[paper=a4]{tudarules}% might load pgfcore, so it has to be loaded after pdfx
\setplength{firstheadhpos}{\c_ptxcd_HeadMargin_dim}
\setplength{firstheadvpos}{\c_ptxcd_HeadMargin_dim}
\setplength{firstheadwidth}{\dim_eval:n {\paperwidth - 2\c_ptxcd_HeadMargin_dim}}
\setplength{firstfootvpos}{\dim_eval:n {\paperheight -17mm}}
\setplength{firstfoothpos}{\useplength{firstheadhpos}}
\setplength{firstfootwidth}{\useplength{firstheadwidth}}
\setplength{toaddrhpos}{\c_ptxcd_LeftMargin_dim}
\setplength{toaddrvpos}{50mm}
\setplength{backaddrheight}{4mm}
\setplength{toaddrindent}{0mm}
\setplength{refhpos}{\c_ptxcd_LeftMargin_dim}
\setplength{refvpos}{106mm}
\setplength{subjectaftervskip}{2\baselineskip}
\setplength{lochpos}{\c_ptxcd_HeadMargin_dim}
\setplength{locvpos}{\dimexpr\useplength{refvpos}+\useplength{subjectaftervskip}+1.4\baselineskip\relax}
\setplength{refaftervskip}{0pt}
\setplength{subjectbeforevskip}{0pt}
\setplength{locwidth}{\dimexpr\paperwidth-154,5mm -\c_ptxcd_HeadMargin_dim\relax}
\setplength{locheight}{\dimexpr\paperheight-\useplength{locvpos}-\c_ptxcd_BottomMargin_dim\relax}
\bool_if:NTF \g__ptxcd_letter_headrule_bool {
  \ptxcd_makeheadrule[width=\useplength{firstheadwidth},color=identbarcolor]{ptxcd_LetterheadRule}
} {
  \box_new:N \ptxcd_LetterheadRule_box
  \def\ptxcd_LetterheadRule{}
}
\ptxcd_makefootrule[width=\useplength{firstheadwidth}]{ptxcd_LetterfootRule}
\box_new:N \g_TUDaLetter_firsthead_box
\hbox_gset:Nn \g_TUDaLetter_firsthead_box {
  \parbox[t]{\useplength{firstheadwidth}}{
    \raggedleft
    \smash{\ptxcd_LetterheadRule}
    \par
    \vspace{.5\c_ptxcd_logoheight_dim}
    \makebox[\__ptxcd_logowidth:][l]{\__ptxcd_insert_logo:}
  }
}
\box_gset_dp:Nn \g_TUDaLetter_firsthead_box {\c_zero_dim}
\setkomavar{firsthead}{
  \box_use:N \g_TUDaLetter_firsthead_box
}
\KOMAoptions{backaddress=plain}
\setkomavar{backaddressseparator}{\,$\vert$\,}
\newkomavar{frominstitution}
\newkomavar{frominstitution-en}
\newkomavar{fromfunction}
\newkomafont{ptxcd_location}{\accentfont\normalcolor}
\setkomafont{fromname}{\small}
\newkomafont{ptxcd_frominst}{\small\ptxcd_use_premiumcolor_text: }
\setkomafont{fromaddress}{\footnotesize}
\setkomafont{refname}{}
\setkomafont{refvalue}{}
\setkomafont{pageheadfoot}{\footnotesize}
\newcommand{\TUD@locfield}{%
  \usekomafont{ptxcd_location}\usekomafont{fromaddress}
  \setparsizes{\z@}{\z@}{\z@ plus 1fil}
  \par@updaterelative
  \begingroup
  \int_compare:nT {0 < \@pageat <3} {
    \ptxcd_letterpagemark:\\[\baselineskip]
  }
  \usekomafont{ptxcd_frominst}
  \Ifkomavarempty{frominstitution}{}{%
    {\usekomavar[\raggedright]{frominstitution}}
    \\[\baselineskip]}%
  \Ifkomavarempty{frominstitution-en}{}{%
    \usekomavar[\raggedright]{frominstitution-en}
    \\[\baselineskip]}%
  \endgroup
  \Ifkomavarempty{fromlogo}{}{\usekomavar{fromlogo}\\[\baselineskip]}%
  \Ifkomavarempty{fromname}{}
  {{\usekomafont{fromname}\usekomavar{fromname}}
    \Ifkomavarempty{fromfunction}{}{\\\usekomavar{fromfunction}}
    \\[\baselineskip]}%
  \Ifkomavarempty{fromaddress}{}{\usekomavar{fromaddress}\\[\baselineskip]}%
  \@tempswafalse
  \clist_map_inline:nn {fromphone, fromfax, fromemail, fromurl}{
    \@tempswatrue
    \Ifkomavarempty{##1}{}{
      \Ifkomavarempty*{##1}{}{\makebox[1cm][l]{\usekomavar*{##1}}}\usekomavar{##1}\par
    }
  }
  \if@tempswa
    \vspace{2\baselineskip}
  \fi
  \Ifkomavarempty*{date}{}{\usekomavar*{date}\\\usekomavar{date}}
  \seq_use:Nn  \g__ptxcd_reffields_seq {}
  \Ifkomavarempty{frombank}{}{\vfill%
    \Ifkomavarempty*{frombank}{Bankverbindung}{\usekomavar*{frombank}}\\\usekomavar{frombank}
  }
}
\setkomavar{location}{\parbox[t][.45\paperheight][t]{\useplength{locwidth}}{\TUD@locfield}}
\tl_const:Nn \ptxcd_reffield_separator_tl {\\}
\cs_new:Nn \ptxcd_set_reffield:n {
  \Ifkomavarempty{#1}{}{%
    \if@tempswa\\[\baselineskip]\fi
    \parbox[t]{\linewidth}{\noindent\raggedright
      \usekomafont{refname}
      \usekomavar*{#1}\ptxcd_reffield_separator_tl
      \usekomafont{refvalue}
      \usekomavar{#1}
    }%
    \@tempswatrue
  }%
}
\seq_new:N  \g__ptxcd_reffields_seq
\newlength{\TUD@page@free}
\newcounter{TUD@page@free@lines}
\dim_new:N \g__ptxcd_page_free_dim
\int_new:N \g__ptxcd_free_lines_int
\renewcommand{\opening}[1]{%
  \widowpenalty=100
  \@PapersizeWarning
  \seq_gclear:N \g__ptxcd_reffields_seq
  \renewcommand*{\@set@reffield}[1]{
    \typeout{Field: ##1}%
    \str_if_eq:nnT {##1}{datemarkerfield}{%
      \let\scr@datemarkerfield@var=\scr@date@var
      \let\scr@datemarkerfield@name=\scr@date@name
      \setkomavar{date}{}%
    }
    \Ifkomavarempty{##1}{}{%
      \seq_gput_right:Nn \g__ptxcd_reffields_seq {%
        \ptxcd_set_reffield:n {##1}
      }%
    }%
  }
  \let\do@set@reffield\@set@reffield
  \@set@reffields
  \removereffields
  \@gen@firsthead
  \@mkboth{\scr@fromname@var}{\scr@subject@var}%
  \thispagestyle{letter.first}\noindent
  \Ifkomavarempty{toname}{\setkomavar{toname}{\mbox{}}}{}
  \@foldmarks\@firstheadfootfield\@addrfield\@locfield
  \ifdim\useplength{subjectvpos}=\z@\else\@subjfield\fi
  \@datefield
  \@makelettertitle
  \ifdim\useplength{subjectvpos}=\z@\if@subjafter\else\@subjfield\fi\fi
  {\setparsizes{\z@}{\z@}{\z@ plus 1fil}\par@updaterelative#1\par}%
  {\setlength{\@tempdima}{\baselineskip}%
    \addtolength{\@tempdima}{-\parskip}%
    \ifdim \@tempdima>\z@\vskip\@tempdima\fi}%
  \ifdim\useplength{subjectvpos}=\z@\if@subjafter\@subjfield\fi\fi
  \setcounter{equation}{0}%
  \@afterheading%
  \@nobreaktrue
  \@afterindentfalse
  \bool_if:NT \g__ptxcd_adjust_textwidth_bool {
    \everypar{%
      \if@nobreak
        \@nobreakfalse\clubpenalty\@M
        \if@afterindent
          \else{\setbox\z@\lastbox}
        \fi
      \else
        \clubpenalty\@clubpenalty
      \fi
      \ifnum\thepage=1%
        \dim_gset:Nn \g__ptxcd_page_free_dim {-\pagegoal + \pagetotal}
        \dim_compare:nTF {-\g__ptxcd_page_free_dim>2\baselineskip}
        {
          \int_gset:Nn \g__ptxcd_free_lines_int {\fp_eval:n {ceil(\g__ptxcd_page_free_dim/\baselineskip)}}
          \int_compare:nT {\g__ptxcd_free_lines_int<0} {
            \hangafter=\g__ptxcd_free_lines_int\hangindent=\c__ptxcd_firstpage_extraindent_dim%
          }
        } {
          \dim_compare:nT {-\TUD@page@free>\baselineskip} {
            \hangafter=-2\hangindent=\c__ptxcd_firstpage_extraindent_dim%
          }
        }
      \fi%
    }%
    \global\setlength{\linewidth}{\dim_eval:n {\c_ptxcd_Linewidth_dim + \c__ptxcd_firstpage_extraindent_dim}}
    \afterpage{
      \global\setlength{\linewidth}{\c_ptxcd_Linewidth_dim}
      \widowpenalty=10000
    }
  }
}
\AtBeginDocument{%
  \raggedbottom%
}
\setkomafont{backaddress}{\accentfont\tiny\ptxcd_use_premiumcolor_text:\raisebox{\dimexpr-\totalheight+\ht\strutbox\relax}{\rule{\z@}{4mm}}}
\raggedbottom
\int_new:N \l_ptxcd_letter_lastpage_int
\cs_new:Nn \ptxcd_letterpagemark: {
  %get lastpage for this letter if not already done
  \int_compare:nNnTF {\value{page}} = {1} {
      \bool_if:NTF \g__ptxcd_firstpagenumber_bool
      {\bool_set_true:N \l_tmpa_bool}
      {\bool_set_false:N \l_tmpa_bool}
    }
    {\bool_set_true:N \l_tmpa_bool}
  \bool_if:NT \l_tmpa_bool {
    \int_if_exist:cF {c_ptxcd_letter\thisletter _lastpage_int} {
      \cs_if_exist:cTF {r@\thisletter.lastpage} {
        \int_const:cn {c_ptxcd_letter\thisletter _lastpage_int} {
          \exp_args:NNc \expandafter \@secondoffive { r@\thisletter.lastpage}
        }
      } {
        %warning -> rerun latex
        \int_const:cn {c_ptxcd_letter\thisletter _lastpage_int} {0}
      }
    }
    \usekomafont{pagenumber}\pagename\nobreakspace\thepage
    \int_compare:nT {
      \int_use:c {c_ptxcd_letter\thisletter _lastpage_int}
      > 1
    } {/\int_to_arabic:n{\int_use:c {c_ptxcd_letter\thisletter _lastpage_int}}}
  }
}
\setkomavar{firstfoot}{\usekomavar{nextfoot}}
\setkomavar{nextfoot}{%
  \ifnum\@pageat>2
    \parbox[c]{\layerwidth}{%
      \ifcase\@pageat\or\or\or\raggedright\or\centering\or\raggedleft\fi
      \strut\pagemark%
    }%
  \fi
}
\cs_set_eq:NN \letterpagemark \ptxcd_letterpagemark:
\bool_if:NT \g__ptxcd_letter_headrule_bool {
  \bool_if:NTF \g__ptxcd_letter_logo_bool {
    \setkomavar{nexthead}{\raisebox{\topskip}{\box_use:N \g_TUDaLetter_firsthead_box}}
  }{
    \setkomavar{nexthead}{\raisebox{\depth}{\ptxcd_LetterheadRule}}
  }
}
\newpairofpagestyles[letter]{TUDaLetter}{
  \exp_args:Nx \KOMAoptions{
    footwidth=\dimexpr\paperwidth-2\c_ptxcd_HeadMargin_dim \c_colon_str-\dim_eval:n {\c_ptxcd_HeadMargin_dim -1mm},
    headwidth=\dimexpr\paperwidth-2\c_ptxcd_HeadMargin_dim \c_colon_str-\dim_eval:n {\c_ptxcd_HeadMargin_dim -1mm},
    footsepline=.5\c_ptxcd_smallrule_dim,plainfootsepline
  }
  \ModifyLayer[voffset=\c_ptxcd_HeadMargin_dim,align=tl]{TUDaLetter.head.even}
  \ModifyLayer[voffset=\c_ptxcd_HeadMargin_dim,align=tl]{TUDaLetter.head.odd}
  \ModifyLayer[voffset=\c_ptxcd_HeadMargin_dim,align=tl]{TUDaLetter.head.oneside}
  \ModifyLayer[voffset=\c_ptxcd_HeadMargin_dim,align=tl]{plain.TUDaLetter.head.even}
  \ModifyLayer[voffset=\c_ptxcd_HeadMargin_dim,align=tl]{plain.TUDaLetter.head.odd}
  \ModifyLayer[voffset=\c_ptxcd_HeadMargin_dim,align=tl]{plain.TUDaLetter.head.oneside}
  \lehead{\usekomavar{nexthead}}%
  \lohead{\usekomavar{nexthead}}%
  \lefoot{\usekomavar{nextfoot}}%
  \lofoot{\usekomavar{nextfoot}}%
}
\DeclarePageStyleByLayers{TUDaLetter.first}{TUDaLetter.foot.even,TUDaLetter.foot.odd,TUDaLetter.foot.oneside,TUDaLetter.foot.above.line}
\pagestyle{TUDaLetter}
\DeclarePageStyleAlias{letter.first}{TUDaLetter.first}
\def\letterpagestyle{TUDaLetter}
\widowpenalty=10000
\clubpenalty=10000
\setkomavar*{fromemail}{}
\setkomavar*{fromurl}{}
\setkomavar{backaddress}{Technische~ Universität~ Darmstadt\\Karolinenplatz~ 5\\64289~ Darmstadt}
\defcaptionname{german,ngerman,austrian,naustrian,%
  swissgerman,nswissgerman}\yourmailname{Ihre~ Nachricht}%
\defcaptionname{german, ngerman,austrian,naustrian,%
  swissgerman,nswissgerman}\phonename{Tel.}%
\let\raggedsignature\raggedright
\bool_if:NT \g__ptxcd_letter_raggedright_bool {\AtBeginLetter{\RaggedRight}}
\cs_if_exist:NF \Ifkomavarempty{
  \let\Ifkomavarempty\ifkomavarempty
}
\file_if_exist_input:n {\g__ptxcd_config_prefix_tl\g_ptxcd_department_str.cfg}

\if_bool:N \g_ptxcd_pdfx_bool
  \iow_new:N \ptxcd_xmpdata_stream
  \tl_new:N \g_ptxcd_xmp_title_tl
  \tl_new:N \g_ptxcd_xmp_author_tl

  \cs_if_exist:NF \prop_gput_if_new:Nnx {
    \cs_generate_variant:Nn \prop_gput_if_new:Nnn {Nnx}
  }

  \cs_if_exist:NF \tl_to_str:V {\cs_generate_variant:Nn \tl_to_str:N {V}}

  \cs_new:Nn \ptxcd_pass_TitleData: {
    \iow_open:Nn \ptxcd_xmpdata_stream {\jobname.xmpdata}
    \begingroup
      \def\newline{}
      \def\\{}
      \let\thanks\use_none:n
      \cs_set:Npn \and {\exp_not:n {\exp_not:N \sep}}
      \use:c {Hy@pdfstringtrue}
      \tl_gset:Nf \g_ptxcd_xmp_title_tl {\@title}
      \prop_gput_if_new:Nnx \g_ptxcd_MetaData_prop {Title} {\tl_to_str:V \g_ptxcd_xmp_title_tl}
      \prop_if_in:NnF \g_ptxcd_MetaData_prop {Author} {
        \tl_gset:Nx \g_ptxcd_xmp_author_tl {\seq_use:Nn \g_ptxcd_author_seq {\exp_not:N \sep}}
        \tl_gset:Nx \g_ptxcd_xmp_author_tl {\g_ptxcd_xmp_author_tl}
        \prop_gput:Nnx \g_ptxcd_MetaData_prop {Author} {\tl_to_str:V \g_ptxcd_xmp_author_tl}
      }
      \prop_gput_if_new:Nnn \g_ptxcd_MetaData_prop {Publisher}{TU~Darmstadt}
      \prop_gput_if_new:Nnn \g_ptxcd_MetaData_prop {Creator}{LaTeX~using~TUDa-CI}
      \use:c {pdfx@localcommands}%should be held inside group
      \prop_map_function:NN \g_ptxcd_MetaData_prop  \ptxcd_write_xmp_line:nn
    \endgroup
    \iow_close:N \ptxcd_xmpdata_stream
    \let\ptxcd_pass_TitleData:\relax
  }
  \cs_new:Nn \ptxcd_write_xmp_line:nn {
    \begingroup
    \cs_set:Npn \sep {\exp_not:N \sep}
    \cs_if_exist:cTF {#1}{
      \iow_now:Nx \ptxcd_xmpdata_stream {
        \c_backslash_str #1 {\exp_not:n {#2}}
      }
    }{
      \msg_error:nnn{tuda-ci} {unknown-metadata} {#1}
    }
    \endgroup
  }

  \prop_new:N \g_ptxcd_MetaData_prop

  \newcommand*{\Metadata}[1]{
    \keyval_parse:NNn  \use_none:n \ptxcd_set_metadata_prop:nn
    {#1}
  }

  \cs_set:Nn \ptxcd_set_metadata_prop:nn {
  % Fallback test for older kernels doesn't support mixed case eintries
    \cs_if_exist:NTF \text_titlecase_first:n {
      \exp_args:NNf \prop_gput:Nnn \g_ptxcd_MetaData_prop {\text_titlecase_first:n {#1}} {#2}
    } {
      \exp_args:NNx \prop_gput:Nnn \g_ptxcd_MetaData_prop {
        \str_uppercase:f {\tl_head:n {#1}}
        \str_lowercase:f {\tl_tail:n {#1}}
      } {#2}
    }
  }
  \msg_new:nnnn{tuda-ci} {unknown-metadata} {
    You~ used~ the~ #1~ metadata~ entry.\\
    I~ don't~ know~ how~ to~ handle~ that.\\
    It~ will~ be~ ignored.
  } {See~ TUDa-CI~ or~ pdfx~ documentation~ for~ details.}
\else:
  \hypersetup{pdfcreator=LaTeX~using~TUDa-CI}
  \msg_new:nnnn {tuda-ci} {metadata-to-hypersetup} {
    You~don't~use~pdfx.~
    Here~the~\string\Metadata ~command~only~exists~for~compatibility~reasons.\\
    I~will~pass~the~data~to~ḩypersetup.
  }{
    If~possible~please~use~hyperref's~\string\hypersetup~command~for~the~metadata~directly.\\
    See~hyperref~documentation~for~details~on~usage.
  }

    \newcommand*{\Metadata}[1]{
      \tl_set:Nn \l_tmpa_tl {#1}
      \tl_replace_all:Nnn \l_tmpa_tl {\sep} {;~}% pdfx-Syntax compatibility
      \clist_map_inline:Nn \l_tmpa_tl {
        \exp_args:Nx \hypersetup{pdf\tl_trim_spaces:n {##1}}
      }
      \msg_warning:nn {tuda-ci} {metadata-to-hypersetup}
    }
    \cs_new:Nn \ptxcd_pass_TitleData: {
      \prop_if_exist:NTF \g__pdfmanagement_documentproperties_prop {
        \prop_set_eq:NN \l_tmpa_prop \g__pdfmanagement_documentproperties_prop
      } {
        \prop_set_eq:NN \l_tmpa_prop   \g__hyp_documentproperties_prop
      }
      \prop_if_in:NnF \l_tmpa_prop {hyperref/pdftitle} {
      \begingroup
        \def\newline{}
        \def\\{}
        \let\thanks\use_none:n
        \tl_gset:Nf \g_tmpa_tl {\@title}
      \endgroup
      \hypersetup{pdftitle={\tl_to_str:V \g_tmpa_tl}}
      }
      \prop_if_in:NnF \l_tmpa_prop {hyperref/pdfauthor} {
        \begingroup
          \def\newline{}
          \def\\{}
          \let\thanks\use_none:n
          \tl_gset:Nx \g_tmpa_tl {\seq_use:Nn \g_ptxcd_author_seq {\exp_not:N \and}}
          \tl_gset:Nx \g_tmpa_tl  {\g_tmpa_tl }
        \endgroup
        \hypersetup{pdfauthor=\g_tmpa_tl}
      }
    }
    \bool_if:NF \g_ptxcd_pdfa_bool {
      \msg_new:nnn{tuda-ci} {no-pdfa}{The~ tuda\c__ptxcd_base_str\space class~ will~ not~ create~ PDF/A.}
      \msg_info:nn{tuda-ci} {no-pdfa}
    }
\fi:
\endinput
%%
%% End of file `tudaletter.cls'.
