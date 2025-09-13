%% This is file `bfhthesis.cls' version 2.2.3 (2025-04-01),
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
\ProvidesExplClass{bfhthesis}{2025-04-01}{2.2.3}{Theses using Corporate Design of BFH (BFH-CI), CI of Bern University of Applied Sciences}

\RequirePackage{l3keys2e}

\str_const:Nn \c__ptxcd_base_str {pub}
\tl_new:N \g_ptxcd_pub_class_tl

\prop_new:N \g_ptxcd_clsopts_prop
\prop_new:N \g_ptxcd_unknown_clsopts_prop
\prop_gput:Nnn \g_ptxcd_clsopts_prop {titlepage} {firstiscover}
\prop_gput:Nnn \g_ptxcd_clsopts_prop {captions} {nooneline}

\keys_define:nn {ptxcd/pub} {
	class .choice:,
	class/report .meta:n = {class=scrreprt},
	class/scrreprt .code:n  = \tl_gset:Nn \g_ptxcd_pub_class_tl {scrreprt},
	class/article .meta:n = {class=scrartcl},
	class/scrartcl .code:n  = \tl_gset:Nn \g_ptxcd_pub_class_tl {scrartcl},
	class/book .meta:n = {class=scrbook},
	class/scrbook .code:n  = \tl_gset:Nn \g_ptxcd_pub_class_tl {scrbook},
	class .initial:n = scrbook,
	department .choice:,
	department / default .code:n = \str_gset:Nn \g_ptxcd_department_str {default},
	department / hkb-doc .code:n = \str_gset:Nn \g_ptxcd_department_str {hkb-doc}\tl_gset:Nn \g_ptxcd_pub_class_tl {scrartcl},
	department .initial:n = default,
	department / unknown .code:n = {
			\str_gset:Nx \g_ptxcd_department_str {\l_keys_value_tl}
		},
	unknown .code:n = {\prop_gput:NVn \g_ptxcd_unknown_clsopts_prop \l_keys_key_tl {#1}},
}

\ProcessKeysOptions{ptxcd/pub}

\prop_map_inline:Nn \g_ptxcd_clsopts_prop {
	\tl_if_empty:nTF {#2}
	{\PassOptionsToClass  {#1} {\g_ptxcd_pub_class_tl}}
	{\clist_map_inline:nn {#2} {\PassOptionsToClass  {#1=##1} {\g_ptxcd_pub_class_tl}}}
}

\LoadClass{\g_ptxcd_pub_class_tl}

\prop_map_inline:Nn \g_ptxcd_unknown_clsopts_prop {
	\cs_if_exist:cT {KV@KOMA.\g_ptxcd_pub_class_tl.cls@#1} {
		\tl_if_empty:nTF {#2}
		{\KOMAoptions{#1}}
		{\KOMAoption{#1}{#2}}
	}
}

\PassOptionsToPackage{type=thesis}{bfhlayout}
\RequirePackage{bfhlayout}


\clist_map_inline:nn {advisor, coadvisor, projectpartner, expert, degreeprogram} {
	\cs_if_exist:cF {#1}	{
		\cs_new_nopar:cpn {#1}  ##1 {\exp_args:Nc \def {@#1} {##1}}
		\use:c {#1} {}
	}
}
\ExplSyntaxOff

\providecommand{\doade}{German}
\providecommand{\doafr}{French}
\providecommand{\doaen}{English}

\DeclareTranslationFallback{doa-heading}{Declaration of Authorship}
\DeclareTranslation{German}{doa-heading}{Eigenständigkeitserklärung}
\DeclareTranslation{French}{doa-heading}{D\'eclaration sur l'honneur}

\DeclareTranslationFallback{doa-body}{I hereby declare that I have written this thesis independently and have not used any sources or aids other than those acknowledged.\par
	All statements taken from other writings, either literally or in essence, have been marked as such.\par
	I hereby agree that the present work may be reviewed in electronic form using appropriate software.}

\DeclareTranslation{German}{doa-body}{Hiermit erkläre ich, dass ich die hier vorliegende Arbeit selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.\par
	Sämtliche Ausführungen, die anderen Schriften wörtlich oder sinngemäß entnommen wurden, habe ich als solche kenntlich gemacht.\par
	Hiermit stimme ich zu, dass die vorliegende Arbeit in elektronischer Form mit entsprechender Software überprüft wird.}

\DeclareTranslation{French}{doa-body}{Je d\'eclare par la pr\'esente avoir r\'edig\'e cette thèse de mani\`ere ind\'ependante et n'avoir utilis\'e aucune autre source ou aide que celles qui sont mentionn\'ees.\par
	Toutes les d\'eclarations tir\'ees d'autres \'ecrits, litt\'eralement ou en substance, ont \'et\'e marqu\'ees comme telles.\par
	J'accepte par la pr\'esente que le pr\'esent travail puisse \^etre revu sous forme \'electronique \`a l'aide de logiciels appropri\'es.}

%====================== Declaration of Authorship for BFH Thesis ===================================

\ExplSyntaxOn

\dim_new:N \l_ptxcd_signature_dim
\dim_set:Nn \l_ptxcd_signature_dim {5cm}

\skip_new:N \l_ptxcd_signature_skip
\skip_set:Nn \l_ptxcd_signature_skip {5mm}

\tl_new:N \g__ptxcd_signature_tl
\newcommand*{\setupSignature}[1]{\tl_gset:Nn \g__ptxcd_signature_tl {#1}}

\NewDocumentCommand{\SignatureBox}{sm}{%
	\IfBooleanT{#1}{\raisebox{-\height}}
	{\keyval_parse:NNn \__ptxcd_signature_no_image:n  \__ptxcd_signature_image:nn {#2}}
}

\cs_new:Nn \__ptxcd_signature_no_image:n {
	\__ptxcd_signature_image:nn {#1} {}
}

\cs_new:Nn \__ptxcd_signature_image:nn {
	\parbox[b]{\l_ptxcd_signature_dim}{
		\centering
		\tl_if_empty:nF {#2} {{#2}}
		\par\nointerlineskip\rule{\linewidth}{.3pt}\\\makebox[0pt][c]{#1}%
	}%
	\skip_horizontal:N \l_ptxcd_signature_skip
}

\NewDocumentCommand{\declarationOfAuthorship}{o}{
	\clearpage
	\thispagestyle{plain}
	\chapter*{\GetTranslation{doa-heading}}
	\begingroup
	\KOMAoptions{parskip=full}
	\GetTranslation{doa-body}
	\begin{flushright}
		\raisebox{1.3\baselineskip}{\@date}\hfill
		\setlength{\baselineskip}{4\baselineskip}
		\IfNoValueTF{#1}{
			\tl_if_empty:NTF \g__ptxcd_signature_tl
			{\seq_map_inline:Nn \g_ptxcd_author_seq {\SignatureBox{##1}}}
			{\exp_args:NV \SignatureBox \g__ptxcd_signature_tl}
		}{
			\SignatureBox{#1}
		}
	\end{flushright}
	\endgroup
} % End declarationOfAuthorship

%custom config depends on department_str
\file_if_exist_input:nF {bfh-\g_ptxcd_department_str.cfg}
	{\file_if_exist_input:n {bfh\g_ptxcd_department_str.cfg}}

\endinput
%End of class bfhthesis.cls
