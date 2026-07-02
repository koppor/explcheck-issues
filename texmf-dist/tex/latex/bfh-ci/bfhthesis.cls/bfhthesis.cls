%% This is file `bfhthesis.cls' version 2.2.6 (2026-01-12),
%% it is part of
%% BFH-CI -- Corporate Design for Bern University of Applied Sciences
%% ----------------------------------------------------------------------------
%%
%%  Copyright (C) 2021--2026 by
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
\ProvidesExplClass{bfhthesis}{2026-01-12}{2.2.6}{Theses using Corporate Design of BFH (BFH-CI), CI of Bern University of Applied Sciences}

\RequirePackage{l3keys2e}
\RequirePackage{bfhcolors}

\AddToHook{begindocument/before}{\RequirePackage{hyperref}}

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

%% \providecommand{\doade}{German}
%% \providecommand{\doafr}{French}
%% \providecommand{\doaen}{English}


\DeclareTranslationFallback{doa-heading}{Declaration of Authorship}
\DeclareTranslation{German}{doa-heading}{Eigenständigkeitserklärung}
\DeclareTranslation{French}{doa-heading}{D\'eclaration d'ind\'ependance pour les travaux d’\'etudiant-e-s}

\DeclareTranslationFallback{doa-KiPolicy}{\textcolor{BFH-DarkBlue}{\href{https://www.bfh.ch/dam/jcr:ead6bdcd-9c3e-4c67-b4e0-3c4b7babf989/ki-policy-e-barrierefrei.pdf}{AI principles of BFH}}}
\DeclareTranslation{German}{doa-KiPolicy}{\textcolor{BFH-DarkBlue}{\href{https://www.bfh.ch/dam/jcr:3b64bdc7-c5d6-4c62-8dc5-0e6a60901c70/KI-Policy_BFH_FHL7Mai25_verabschiedet-1.pdf}{KI-Grundsätze der BFH}}}
\DeclareTranslation{French}{doa-KiPolicy}{\textcolor{BFH-DarkBlue}{\href{https://www.bfh.ch/dam/jcr:5b0a3e77-f0da-46ba-9347-e6ddcc85b481/FR_KI-Policy_BFH_FHL7Mai25_verabschiedet_Alphabetisch.pdf}{r\`eglement IA de la BFH}}}

\DeclareTranslationFallback{doa-WissIR}{\textcolor{BFH-DarkBlue}{\href{https://www.bfh.ch/dam/jcr:4c5d701f-c16a-4d9e-9dcc-83e39078409b/20221116\%20WissIR\%20e\%20barrierefrei.pdf}{regulations on Scientific Integrity}}}
\DeclareTranslation{German}{doa-WissIR}{\textcolor{BFH-DarkBlue}{\href{https://www.bfh.ch/dam/jcr:44166581-ea8b-4a91-aeac-330048e431bb/20221116\%20WissIR\%20barrierefrei.pdf}{Reglement zur wissenschaftlichen Integrität an der BFH}}}
\DeclareTranslation{French}{doa-WissIR}{\textcolor{BFH-DarkBlue}{\href{https://www.bfh.ch/dam/jcr:5b0234cc-bf4a-40ef-af89-70cbdd37ee38/2022--2026\%20WissIR\%20fr\%20barrierefrei.pdf}{r\`eglement sur l'int\'egrit\'e scientifique \`a la BFH}}}


\DeclareTranslationFallback{doa-body}{With my signature, I confirm that I have completed this work independently. All sources of information (specialist literature, discussions with experts, AI tools, etc.) and other aids that have contributed significantly to my work are listed in full in my work report in the appendix. All content that does not originate from me is marked with a precise reference to its source.\par
I further confirm that I have worked independently throughout the preparation of this student project and have not uncritically adopted content generated by AI in accordance with the \GetTranslation{doa-KiPolicy}.\par
I confirm that I am aware of Articles 38 to 40 of the BFH's \GetTranslation{doa-WissIR} and agree that this thesis may be checked for plagiarism in electronic form using appropriate software.}


\DeclareTranslation{German}{doa-body}{Ich bestätige mit meiner Unterschrift, dass ich die hier vorliegende Arbeit selbstständig durchgeführt habe. Alle Informationsquellen (Fachliteratur, Besprechungen mit Fachleuten, KI-Tools usw.) und anderen Hilfsmittel, die wesentlich zu meiner Arbeit beigetragen haben, sind in meinem Arbeitsbericht im Anhang vollständig aufgeführt. Sämtliche Inhalte, die nicht von mir stammen, sind mit dem genauen Hinweis auf ihre Quelle gekennzeichnet.\par
Ich bestätige weiterhin, dass ich bei der Erstellung dieser Studienarbeit durchgehend steuernd gearbeitet habe und von einer KI erzeugte Inhalte im Sinne der \GetTranslation{doa-KiPolicy} nicht unreflektiert übernommen habe.\par
Ich bestätige, über die Artikel 38 bis 40 im \GetTranslation{doa-WissIR} informiert zu sein und stimme zu, dass die vorliegende Arbeit in elektronischer Form mit entsprechender Software auf Plagiarismus überprüft werden darf. }


\DeclareTranslation{French}{doa-body}{Je confirme par ma signature que j\'ai r\'ealis\'e le pr\'esent travail de mani\`ere ind\'ependante. Toutes les sources d'information (litt\'erature sp\'ecialis\'ee, discussions avec des expert-e-s, outils d'IA, etc.) et autres ressources qui ont contribu\'e de mani\`ere significative \`a mon travail sont r\'epertori\'ees dans leur int\'egralit\'e dans mon rapport de travail en annexe. Tous les contenus qui ne proviennent pas de moi sont signal\'es avec la mention exacte de leur source.\par
Je confirme en outre que j'ai travaill\'e de mani\`ere autonome tout au long de la r\'edaction de ce travail d'\'etude et que, conform\'ement aux \GetTranslation{doa-KiPolicy}, je n'ai pas repris sans r\'eflexion des contenus g\'en\'er\'es par une IA.\par
Je confirme \'egalement avoir pris connaissance des articles 38 \`a 40 du \GetTranslation{doa-WissIR} et j'accepte que le pr\'esent travail soit v\'erifi\'e sous forme \'electronique \`a l'aide d'un logiciel appropri\'e afin de d\'etecter tout plagiat.\par
}

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
