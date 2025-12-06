%% This is file `bfhpub.cls' version 2.2.3 (2025-04-01),
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
\ProvidesExplClass{bfhpub}{2025-04-01}{2.2.3}{Publications using Corporate Design of BFH (BFH-CI)}

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
	class .initial:n = scrartcl,
	department .choice:,
	department / default .code:n = \str_gset:Nn \g_ptxcd_department_str {default},
	department / hkb-doc .code:n = \str_gset:Nn \g_ptxcd_department_str {hkb-doc}\tl_gset:Nn \g_ptxcd_pub_class_tl {scrartcl},
	department .initial:n = default,
	department / unknown .code:n = {
			\str_gset:Nx \g_ptxcd_department_str {\l_keys_value_tl}
		},
	type / factsheet .meta:n = {class=scrartcl},
	beamerarticle .code:n = \PassOptionsToPackage{type=beamerarticle}{bfhlayout},
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

\RequirePackage{bfhlayout}

%custom config depends on department_str
\file_if_exist_input:nF {bfh-\g_ptxcd_department_str.cfg}
	{\file_if_exist_input:n {bfh\g_ptxcd_department_str.cfg}}

\endinput
%End of class bfhpub.cls
