%% This is file `bfhsciposter.cls' version 2.2.3 (2025-04-01),
%% it is part of
%% BFH-CI -- Corporate Design for Bern University of Applied Sciences
%% ----------------------------------------------------------------------------
%%
%%  Copyright (C) 2021--2025 by
%%      Marei Peischl <marei@peitex.de>
%%      Andreas Habegger <andreas.habegger@bfh.ch>
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
%% The Current Maintainers of this work are
%%   Marei Peischl <bfh-ci@peitex.de>
%%   Andreas Habegger <andreas.habegger@bfh.ch>
%%
%% The development respository can be found at
%% https://gitlab.ti.bfh.ch/bfh-latex/bfh-ci/
%% Please use the issue tracker for feedback!
%%
%% ============================================================================
%%
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplPackage{bfhsciposter}{2025-04-01}{2.2.3}{Scientific poster layout of BFH}

\RequirePackage{l3keys2e}
\prop_new:N \g_ptxcd_clsopts_prop
\tl_new:N \g_ptxcd_boxstyle_tl
\int_new:N \g_ptxcd_paper_int
\str_new:N \g_ptxcd_department_str
\str_const:Nn \c__ptxcd_base_str {sciposter}

\dim_new:N \g_ptxcd_rule_height_dim
\dim_new:N \g_ptxcd_rule_arc_dim

\bool_new:N \g__ptxcd_ruled_footer_bool
\bool_new:N \g__ptxcd_ruled_title_bool
\bool_new:N \g__ptxcd_color_coated_bool

\keys_define:nn {ptxcd/poster} {
	footer .bool_gset:N = \g_ptxcd_poster_foot_bool,
	footer .default:n = true,
	footer .initial:n = true,
	thanks .tl_gset:N = \g_ptxcd_footnote_label_tl,
	thanks .initial:n = arabic*,
	pdfa .bool_gset:N = \g_ptxcd_pdfa_bool,
	pdfa .initial:n = false,
	boxstyle .choice:,
	boxstyle / plain .code:n = \tl_gset:Nn \g_ptxcd_boxstyle_tl {BFH-plain},
	boxstyle / colored .code:n= \tl_gset:Nn \g_ptxcd_boxstyle_tl {BFH-colored},
	boxstyle / framed .code:n= \tl_gset:Nn \g_ptxcd_boxstyle_tl {BFH-framed},
	boxstyle / default .meta:n = {boxstyle=plain},
	boxstyle .initial:n = default,
	unknown .code:n = {\prop_gput:NVn \g_ptxcd_clsopts_prop \l_keys_key_tl {#1}},
	paper .choices:nn = {a0,a1,a2,a3}{
			\int_gset_eq:NN \g_ptxcd_paper_int  \l_keys_choice_int
			\exp_args:Nx \PassOptionsToPackage{\l_keys_choice_tl paper}{geometry}
		},
	paper .initial:n = a1,
	fontsize .tl_gset:N = \g_ptxcd_fontsize_tl,
	title .choice:,
	title / default .meta:n = {title=large},
	title / large .code:n = \bool_gset_false:N \g_ptxcd_smalltitle_bool,
	title / small  .code:n = \bool_gset_true:N \g_ptxcd_smalltitle_bool,
	title .initial:n = default,
	department .choice:,
	department / default .code:n = \str_gset:Nn \g_ptxcd_department_str {default},
	department .initial:n = default,
	logo-language .tl_gset:N = \g__ptxcd_logo_language_tl,
	invert-colors .meta:n = {invert-logo-colors,invert-title-colors,invert-footer-colors},
	invert-logo-colors .bool_gset:N = \g__ptxcd_invert_logo_colors_bool,
	invert-title-colors .bool_gset:N = \g__ptxcd_invert_title_colors_bool,
	invert-footer-colors .bool_gset:N = \g__ptxcd_invert_footer_colors_bool,
	logo-variant .tl_gset:N = \g__ptxcd_logo_variant_tl,
	logo-file .tl_gset:N = \g__ptxcd_logo_file_tl,
	logo .choice:,
	logo / head .code:n = {
			\bool_gset_true:N \g__ptxcd_LogoInHead_bool
			\keys_set:nn {ptxcd/poster} {logo-variant=C}
		},
	logo / foot .code:n = {
			\bool_gset_false:N \g__ptxcd_LogoInHead_bool
			\keys_set:nn {ptxcd/poster} {logo-variant=B}
		},
	logo / top .meta:n = {logo=head},
	logo / bottom  .meta:n = {logo=foot},
	logo .initial:n = foot,
	logofile .tl_gset:N = \g_ptxcd_logofile_tl,
	logofile .initial:n =,
	coated .code:n = \bool_gset:Nn \g__ptxcd_color_coated_bool {#1}\PassOptionsToPackage{coated=#1}{bfhcolors},
	title-style .choice:,
	title-style / ruled .code:n = \bool_gset_true:N \g__ptxcd_ruled_title_bool,
	title-style / plain .code:n = \bool_gset_false:N \g__ptxcd_ruled_title_bool,
	title-style / default .meta:n = {title-style=plain},
	title-style .initial:n = default,
	footer-style .choice:,
	footer-style / ruled .code:n = \bool_gset_true:N \g__ptxcd_ruled_footer_bool,
	footer-style / plain .code:n = \bool_gset_false:N \g__ptxcd_ruled_footer_bool,
	footer-style / default .meta:n = {footer-style=plain},
	footer-style .initial:n = default,
	style .meta:n = {title-style=#1,footer-style=#1},
	style .initial:n = plain,
	align-title .choice:,
	align-title / left .code:n = \let\raggedtitle\raggedright,
	align-title / right .code:n = \let\raggedtitle\raggedleft,
	align-title / center .code:n = \let\raggedtitle\centering,
}

\let\raggedtitle\centering
\let\raggedfooter\raggedright

\ProcessKeysOptions{ptxcd/poster}

\dim_new:N \g_ptxcd_margin_dim
\bool_if:NTF \g_ptxcd_smalltitle_bool {
	\file_input:n {bfh-a\int_use:N \g_ptxcd_paper_int paper.clo}
	\ptxcd_setup_title_sizes:
	\file_input:n {bfh-a\int_use:N \g_ptxcd_paper_int paper.clo}
	\ptxcd_setup_base_sizes:
}{
	\int_gdecr:N \g_ptxcd_paper_int
	\file_input:n {bfh-a\int_use:N \g_ptxcd_paper_int paper.clo}
	\ptxcd_setup_title_sizes:
	\ptxcd_setup_base_sizes:
}

\prop_gput:NnV \g_ptxcd_clsopts_prop {fontsize} \g_ptxcd_fontsize_tl

\prop_map_inline:Nn \g_ptxcd_clsopts_prop {
	\tl_if_empty:nTF {#2}
	{\exp_args:NnV\PassOptionsToClass{#1}\l_tmpa_tl}
	{\clist_map_inline:nn {#2} {\PassOptionsToClass{#1=##1}{scrartcl}}}
}

\ExplSyntaxOff
\PassOptionsToClass{parskip=half-}{scrartcl}
\LoadClass{scrartcl}

% add switch?
\PassOptionsToPackage{colormode=4CU}{bfhcolors}

\RequirePackage{bfhfonts}

\ExplSyntaxOn
\file_if_exist:nTF {bfhlogo.sty}
{\RequirePackage{bfhlogo}}
{
	\tl_if_empty:NT \g_ptxcd_logofile_tl {
		\msg_new:nnnn {bfh-ci} {missing-bfhlogo}
		{I~could~not~find~the~bfhlogo~package.}
		{Please~have~a~look~at~the~bfh-ci~documentation~for~more~information~or~provide~an~alternative~using~the~logofile~option.}
		\msg_warning:nn {bfh-ci} {missing-bfhlogo}
	}
	\RequirePackage{graphicx}
}

\box_if_exist:NF \g__ptxcd_logo_box {
	\box_new:N \g__ptxcd_logo_box
}

\tl_if_empty:NTF \g_ptxcd_logofile_tl {
	\hbox_gset:Nn \g__ptxcd_logo_box {\rule{0pt}{1cm}}%fallback for missing logos
} {
	\hbox_gset:Nn \g__ptxcd_logo_box {\includegraphics{\g_ptxcd_logofile_tl}}
}
\ExplSyntaxOff

\RequirePackage{tikz}
\usetikzlibrary{calc}

\RequirePackage{tcolorbox}
\tcbuselibrary{poster}

\RequirePackage[margin=0pt]{geometry}
\RequirePackage{xparse}% will be only necessary for old debian installations

\ExplSyntaxOn

%Font adjusments
\renewcommand*{\familydefault}{\sfdefault}

\setkomafont{title}{
	\color{titlefgcolor}
	\expandafter\fontsize\ptxcd_title_fontsize:\selectfont
	\bfseries
}

\setkomafont{author}{\bfseries}
\setkomafont{captionlabel}{\bfseries}

\setkomafont{disposition}{\sffamily\bfseries}
\setkomafont{section}{\large}
\setkomafont{subsection}{\normalsize}

\setkomafont{pagefoot}{\small}

% end of font adjustments

\RequirePackage{bfhcolors}
\RequirePackage{qrcode}

%Setup title
\box_new:N \l_ptxcd_tmpa_box
\box_new:N \g_ptxcd_titlegraphic_box
\box_new:N \g_ptxcd_title_box
\box_new:N \g_ptxcd_author_box
\box_new:N \g_ptxcd_credit_box

\tl_new:N \g_ptxcd_thanks_tl
\newcommand*{\ptxcd_title@footnote}[2][1]{
	\begingroup
	\ptxcd_def_footnotelabel:
	\footnotemark[#1]\,#2\quad
	\endgroup
}

\tl_greplace_all:Nnn \g_ptxcd_footnote_label_tl {*} {{footnote}}
\clist_map_inline:nn {alph, arabic, fnsymbol, Alph, roman, Roman} {
	\tl_greplace_all:Nnn \g_ptxcd_footnote_label_tl {#1} {\use:c {#1}}
}

\cs_set:Nn \ptxcd_def_footnotelabel: {
	\renewcommand*{\thefootnote}{\g_ptxcd_footnote_label_tl}
}

\pagestyle{empty}
\renewcommand*{\title}[1]{\gdef \@title {#1}}

\dim_new:N \g_ptxcd_footheight_dim
\dim_gset:Nn \g_ptxcd_footheight_dim {2\g_ptxcd_margin_dim}%\dim_eval:n {}}% taken from PP template

\box_new:N \g_ptxcd_footergraphics_box
\newcommand*{\footergraphics}[1]{
	\begingroup
	\let\height\g_ptxcd_footheight_dim
	\hbox_gset:Nn \g_ptxcd_footergraphics_box {#1}
	\endgroup
}

\tl_new:N \g_ptxcd_poster_foot_tl
\newcommand{\footer}[1]{
	\tl_gset:Nn \g_ptxcd_poster_foot_tl {#1}
}

\tl_new:N \g_ptxcd_poster_qrcode_tl

\msg_new:nnnn {bfhsciposter} {biblatex-required}{
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
			\msg_error:nnx {bfhsciposter} {biblatex-required} {\use:c{footerqrcode*}}
		}
	}{
		\tl_gset:Nn \g_ptxcd_poster_qrcode_tl {#2}
	}
}

%redefine \author to manage \and and \thanks

\seq_new:N \g_ptxcd_author_seq

\renewcommand*\author[1]{
	\seq_gset_split:Nnn \g_ptxcd_author_seq {\and} {#1}
}

\msg_new:nnn{bfhsciposter} {unknown-language} {
	You~selected~an~unknown~language~#1.\\
	The~Variable~#2~does~not~have~a~predefined~value.\\
	Ensure~to~redefine~#2~to~match~your~language.\\
	Otherwise~the~ngerman~vaue~#3~will~be~used.
}

\providecommand*\authorandname{
	\msg_warning:nnxxx{bfhsciposter} {unknown-language}
	{\languagename} {\exp_not:N \authorandname} {und}
	und
}

\defcaptionname{ngerman, german,swissgerman,nswissgerman}{\authorandname}{und}
\defcaptionname{french}{\authorandname}{et}
\defcaptionname{english, USenglish, american, UKenglish, british}{\authorandname}{and}

\renewcommand*{\@author}{
	\seq_use:Nnnn \g_ptxcd_author_seq {~\authorandname{}~} {,~} {~\&~}
}

\newcommand\titlegraphic[1]{\def\@titlegraphic{#1}}
\titlegraphic{}

\newcommand{\institute}[1]{\def\@institute{#1}}
\institute{}

\newlength{\contentwidth}
\setlength{\contentwidth}{\dimexpr\paperwidth-2\g_ptxcd_margin_dim\relax}
\newlength{\contentheight}

\tcbposterset{
	coverage =
		{
			spread,
			parbox=false,
			bottom=\dim_eval:n {
				\g_ptxcd_margin_dim
				\bool_if:NT \g_ptxcd_poster_foot_bool {+\g_ptxcd_footheight_dim}
				\bool_if:NTF \g__ptxcd_ruled_footer_bool {+\g_ptxcd_margin_dim}
				{+.5\g_ptxcd_margin_dim}
			},
			left=\g_ptxcd_margin_dim,
			right=\g_ptxcd_margin_dim,
			before= {\ptxcd_poster_setup_title_box:},
			top= \dim_eval:n {
				\box_ht:N \g_ptxcd_title_box
				+ \box_dp:N \g_ptxcd_title_box
				+ 1.25 \g_ptxcd_margin_dim
				+ \bool_if:NTF \g__ptxcd_ruled_title_bool {.5} {1.25} \g_ptxcd_margin_dim
			},
			overlay={%
					\coordinate(topleft) at ([xshift=\g_ptxcd_margin_dim, yshift=-\g_ptxcd_margin_dim]current~page.north~ west);
					\coordinate(topright) at ([xshift=-\g_ptxcd_margin_dim, yshift=-\g_ptxcd_margin_dim]current~page.north~ east);
					\coordinate(bottomleft) at ([xshift=\g_ptxcd_margin_dim, yshift=\dim_eval:n {\bool_if:NTF \g__ptxcd_ruled_footer_bool {1}{.5}\g_ptxcd_margin_dim}]current~page.south~ west);
					\coordinate(bottomright) at ([xshift=-\g_ptxcd_margin_dim, yshift=\dim_eval:n {\bool_if:NTF \g__ptxcd_ruled_footer_bool {1}{.5}\g_ptxcd_margin_dim}]current~page.south~ east);
					\node[anchor=north~west,inner~sep=0pt,]  (title) at (topleft) {\box_use:N \g_ptxcd_title_box};
					\bool_if:NT \g__ptxcd_ruled_title_bool {\fill[titlerulecolor]([xshift=-\g_ptxcd_margin_dim,yshift=-.5\g_ptxcd_margin_dim]title.south~west)rectangle++(\paperwidth,\g_ptxcd_rule_height_dim);}
					\bool_if:NT \g_ptxcd_poster_foot_bool {\__ptxcd_typeset_footer:}
				}
		}
}

\cs_new:Nn \__ptxcd_typeset_footer: {
	\coordinate(lastpos) at (bottomright);
	\tl_if_empty:NF \g_ptxcd_poster_qrcode_tl
	{
		\node[anchor=south~east, inner~sep=\z@] (qrcode)at (lastpos)
		{
			\exp_args:NnV \use:n {\qrcode[height=\dim_use:N \g_ptxcd_footheight_dim]}\g_ptxcd_poster_qrcode_tl
		};
		\coordinate (lastpos) at (qrcode.south~west);
	}
	\box_if_empty:NF \g_ptxcd_footergraphics_box {
		\node[anchor=south~east, inner~sep=\z@] at (lastpos) {
			\box_use:N \g_ptxcd_footergraphics_box
		};
	}
	\bool_if:NTF \g__ptxcd_LogoInHead_bool {
		\node[inner~sep=\z@,anchor=south~west] (footerlogo) at (bottomleft) {\rule{0pt}{\g_ptxcd_footheight_dim}};
	}{
		\box_if_empty:NF \g__ptxcd_logo_box {\box_gresize_to_ht_plus_dp:Nn \g__ptxcd_logo_box {\g_ptxcd_footheight_dim}}
		\node[anchor=south~ west, inner~ sep=\z@] (footerlogo) at (bottomleft) {
			\box_use:N  \g__ptxcd_logo_box\rule{\footerhsep}{\z@}
		};
	}
	\node[anchor=base~ west,inner~sep=0pt] (infofooter) at (footerlogo.south~east) {
		\parbox[b]{\dim_eval:n {\contentwidth
				-\box_wd:N \g_ptxcd_footergraphics_box
				\bool_if:NF \g__ptxcd_LogoInHead_bool {
					-\box_wd:N \g__ptxcd_logo_box
					-\footerhsep
				}
				\tl_if_empty:NF \g_ptxcd_poster_qrcode_tl {-\g_ptxcd_footheight_dim-\footerhsep}
			}}{
			\raggedfooter
			\usekomafont{pagefoot}
			\g_ptxcd_poster_foot_tl
			\par\medskip
			\let\footnotetext\ptxcd_title@footnote
			\g_ptxcd_thanks_tl}
	};

	\bool_if:NTF \g__ptxcd_ruled_footer_bool {
		\fill[footerrulecolor](footerlogo.north~west)++(-\g_ptxcd_margin_dim,.25\g_ptxcd_footheight_dim) rectangle++(\paperwidth,.7\g_ptxcd_rule_height_dim);
		\fill[footerrulecolor](footerlogo.south~west)++(-\g_ptxcd_margin_dim,-.25\g_ptxcd_footheight_dim) rectangle++(\paperwidth,-.7\g_ptxcd_rule_height_dim);
	}{
		\fill[footerrulecolor](footerlogo.north~west)++(-\g_ptxcd_margin_dim,.25\g_ptxcd_footheight_dim) rectangle++(\paperwidth,\g_ptxcd_rule_height_dim);
	}
}

% Background Colors
\colorlet{backgroundcolor}{white}
\colorlet{framecolor}{BFH-Orange}
% Title Colors
\bool_if:NTF \g__ptxcd_invert_title_colors_bool
{
	\colorlet{titlefgcolor}{BFH-Gray}
	\colorlet{titlerulecolor}{BFH-Orange}
} {
	\colorlet{titlefgcolor}{BFH-Orange}
	\colorlet{titlerulecolor}{BFH-Gray}
}

%Footer colors
\bool_if:NTF \g__ptxcd_invert_footer_colors_bool
{
	\addtokomafont{pagefoot}{\color{BFH-Orange}\leavevmode}
	\bool_if:NTF \g__ptxcd_ruled_footer_bool {
		\colorlet{footerrulecolor}{BFH-Orange}
	}{
		\colorlet{footerrulecolor}{BFH-Gray}
	}
}{
	\addtokomafont{pagefoot}{\color{BFH-Gray}\leavevmode}
	\bool_if:NTF \g__ptxcd_ruled_footer_bool {
		\colorlet{footerrulecolor}{BFH-Gray}
	}{
		\colorlet{footerrulecolor}{BFH-Orange}
	}
}

% Block Colors
\colorlet{blocktitlefgcolor}{BFH-Gray}
\colorlet{blocktitlebgcolor}{blocktitlefgcolor!10}
\colorlet{blockbodybgcolor}{blocktitlefgcolor!10}
\colorlet{blockbodyfgcolor}{black}
% Innerblock Colors
\colorlet{innerblocktitlebgcolor}{BFH-Orange}
\colorlet{innerblocktitlefgcolor}{BFH-Gray}
\colorlet{innerblockbodybgcolor}{BFH-Orange}
\colorlet{innerblockbodyfgcolor}{black}

\dim_new:N \g_ptxcd_titleblock_dim
\dim_new:N \g_ptxcd_titleindent_dim
\dim_new:N \g__ptxcd_titlegraphic_sep_dim
\dim_gset:Nn \g__ptxcd_titlegraphic_sep_dim {1cm}

\cs_new:Nn \__ptxcd_inst:n {\textsuperscript{#1}}

\cs_new:Nn \ptxcd_poster_setup_title_box: {
	\hbox_gset:Nn \g_ptxcd_titlegraphic_box {
		\@titlegraphic
	}
	\hbox_gset_to_wd:Nnn \g_ptxcd_title_box {\contentwidth} {
		\usekomafont{disposition}\usekomafont{title}
		\bool_if:NTF \g__ptxcd_LogoInHead_bool {
			\box_if_empty:NF \g__ptxcd_logo_box {\box_gresize_to_ht:Nn \g__ptxcd_logo_box {\g_ptxcd_footheight_dim}}
			\dim_set:Nn \l_tmpb_dim {\dim_max:nn {\box_wd:N \g_ptxcd_titlegraphic_box} {\box_wd:N \g__ptxcd_logo_box} - \g__ptxcd_titlegraphic_sep_dim}
		}
		{
			\dim_set:Nn \l_tmpb_dim {\dim_compare:nTF {\box_wd:N \g_ptxcd_titlegraphic_box = 0pt} {0pt} {\box_wd:N \g_ptxcd_titlegraphic_box - \g__ptxcd_titlegraphic_sep_dim}}
		}
		\dim_set:Nn \l_tmpa_dim {\cs_if_eq:NNTF \centering \raggedtitle {-2} {-1} \l_tmpb_dim +
			\contentwidth}
		\box_if_empty:NF \g_ptxcd_titlegraphic_box {
			\bool_if:NTF \g__ptxcd_LogoInHead_bool
			{\raisebox{-\height} {\box_use:N \g__ptxcd_logo_box}}
			{\raisebox{-\height} {\box_use:N \g_ptxcd_titlegraphic_box}}
			\hspace{\g__ptxcd_titlegraphic_sep_dim}
		}
		\parbox[t]{\l_tmpa_dim}{
			\vskip0pt
			\raggedtitle
			\leavevmode\@title \par
			\normalfont\normalsize\normalcolor
			\skip_vertical:n {\baselineskip}
			\ptxcd_def_footnotelabel:
			\cs_set_eq:NN \inst\__ptxcd_inst:n
			{\usekomafont{author}\@author\\}
			\tl_gset:No \g_ptxcd_thanks_tl {\@thanks}
			\@institute
		}
		\hspace{\g__ptxcd_titlegraphic_sep_dim}
		\hfill
		\bool_if:NT \g__ptxcd_LogoInHead_bool {
			\hfill
			\raisebox{-\height} {\box_use:N \g_ptxcd_titlegraphic_box}
		}
	}
}

%%%%%%%%%%%%%%%%%%%%%%
%Declare TCBstyles for bfhsciposter

\AtBeginDocument{
	\dim_const:Nn \c_ptxcd_smallrule_dim {5pt}
	\dim_const:Nn \c_ptxcd_rulesep_dim {1ex}
	\setlength{\footerhsep}{1.5cm}

}
\newlength\footerhsep

\tcbset{
	BFH-plain/.style = {
		enhanced,
		coltitle=blocktitlefgcolor,
		colbacktitle=white,
		coltext=blockbodyfgcolor,
		colback=white,
		size=minimal,
		fonttitle=\usekomafont{disposition}\usekomafont{section},
		before~title={\strut},
		bottomtitle=\c_ptxcd_rulesep_dim,
		top=\c_ptxcd_rulesep_dim,
		bottom=\c_ptxcd_rulesep_dim,
		parbox=false,
	},
	BFH-inner/.style = {
		BFH-plain,
		fonttitle=\usekomafont{disposition}\usekomafont{subsection}
	},
	BFH-abstract/.style = {BFH-plain, coltext=BFH-Gray},
	BFH-colored/.style = {
		BFH-plain,
		boxsep=\c_ptxcd_rulesep_dim,
		colbacktitle=blocktitlebgcolor,
		colback=blockbodybgcolor,
		fonttitle=\usekomafont{disposition}\usekomafont{section},
		titlerule=\z@,
	},
	BFH-framed/.style = {
		enhanced,
		size=minimal,
		coltitle=blocktitlefgcolor,
		boxsep=\c_ptxcd_rulesep_dim,
		boxrule=\c_ptxcd_smallrule_dim,
		colframe=framecolor,
		titlerule=\z@,
		arc=1ex,
		auto~outer~arc,
		fonttitle=\usekomafont{disposition}\usekomafont{section},
		before~title={\strut},
		parbox=false,
	},
	BFH-framed-inner/.style = {
		BFH-framed,
		colbacktitle=innerblocktitlebgcolor,
		coltitle=innerblocktitlefgcolor,
		colback=innerblockbodybgcolor,
		coltext=innerblockbodyfgcolor,
		sharp~corners,
		fonttitle=\usekomafont{disposition}\usekomafont{subsection}
	},
	BFH-colored-inner/.style = {BFH-framed-inner},
}

%Select default box styles according to style option
\tcbposterset{boxes ={\g_ptxcd_boxstyle_tl}, poster={spacing=\c_ptxcd_rulesep_dim}}
\tcbset{
	every~ box~ on~ layer~ 3/.style={reset,\g_ptxcd_boxstyle_tl -inner},
	every~ box~ on~ layer~ 4/.style={reset,\g_ptxcd_boxstyle_tl -inner},
}

\RequirePackage{bfhmodule}
\LoadBFHModule{tabular}

\ExplSyntaxOn% because \LoadBFHModule is required to switch it off

%itemize
\AtBeginDocument{
	\cs_if_exist:NT \frenchsetup {\frenchsetup{StandardItemLabels=true}}
}

\@ifundefined {scr@fnt@labelitemi}{\newkomafont{labelitemi}{}}{}
\setkomafont{labelitemi}{\color{BFH-Orange}}
\cs_new:Nn \__ptxcd_itemlabel: {{\ifvmode\leavevmode\fi\usekomafont{labelitemi}\raise1.25pt\hbox{$\blacktriangleright$}}}
\renewcommand*{\labelitemi}{\__ptxcd_itemlabel:}

%custom config depends on department_str
\file_if_exist_input:nF {bfh-\g_ptxcd_department_str.cfg}
	{\file_if_exist_input:n {bfh\g_ptxcd_department_str.cfg}}

\endinput
%end of bfhsciposter.cls
