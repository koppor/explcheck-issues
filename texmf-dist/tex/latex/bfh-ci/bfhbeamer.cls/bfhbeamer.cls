%% This is file `bfhbeamer.cls' version 2.2.3 (2025-04-01),
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
\ProvidesClass{bfhbeamer}[2025-04-01 v2.2.3 BFH-CI beamer layout, CI of Bern University of Applied Sciences]

\RequirePackage{l3keys2e}
\PassOptionsToPackage{table}{xcolor}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Option Processing START

\ExplSyntaxOn
\bool_new:N \g__ptxcd_handoutWithNotes_bool

\keys_define:nn {ptxcd/beamer} {
	authorontitle .code:n = \PassOptionsToPackage{authorontitle=#1}{beamerinnerthemeBFH},
	logofile .code:n = \PassOptionsToPackage{logofile=#1}{beamerinnerthemeBFH},
	enforce-title-logo .code:n = \PassOptionsToPackage{enforce-title-logo=#1}{beamerinnerthemeBFH},
	beamerarticle .bool_gset:N = \g__ptxcd_beamerarticle_bool,
	printNotes .code:n = \bool_gset_true:N \g__ptxcd_handoutWithNotes_bool \PassOptionsToPackage{beamer-notes=true}{handoutWithNotes},
	tabletNotes .code:n = \PassOptionsToClass{handout}{beamer},
	paperNotes .code:n = \bool_gset_true:N \g__ptxcd_handoutWithNotes_bool \PassOptionsToClass{handout}{beamer},
}
\ExplSyntaxOff

\PassOptionsToClass{aspectratio=169}{beamer}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessKeysOptions{ptxcd/beamer}
\ProcessOptions\relax

\ExplSyntaxOn
\bool_if:NT \g__ptxcd_beamerarticle_bool {
	\LoadClassWithOptions{bfhpub}
	\endinput
}
\ExplSyntaxOff

%% Option Processing END
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass{beamer}

\ExplSyntaxOn
\dim_new:N \g__ptxcd_logo_height_dim
\dim_gset:Nn  \g__ptxcd_logo_height_dim {0.125\paperheight}

\setbeamersize{
	text~margin~left=.6\g__ptxcd_logo_height_dim, text~margin~right=.6\g__ptxcd_logo_height_dim
}

\ExplSyntaxOff

\usetheme{BFH}

\ExplSyntaxOn
\bool_if:NT \g__ptxcd_handoutWithNotes_bool {
	\RequirePackage{handoutWithNotes}
	\pgfpagesuselayout{3~on~1~with~notes}[a4paper,border~shrink=5mm]
}
\ExplSyntaxOff


\RequirePackage{bfhmodule}

\endinput
