% CTAN distribution file generated from the modular repository sources.
% All project-owned runtime modules are inlined below; no external .def files are required.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abntexto-ufc}[2026/09/10 v3.0.1 UFC academic document class]

% Historical UFC template: Ednardo Moreira Rodrigues and Alan Batista de Oliveira.
% Historical v2 redesign and maintenance: Tiago Guimarães Sombra.
% Historical lineage adapted from ueceTeX2 by Thiago Nascimento.
% Distributed under LPPL 1.3c or later; see LICENSE.
% Normative policy and current technical basis: docs/NORMATIVE-BASE.md.
% Always target the latest applicable ABNT edition.

\LoadClass[12pt]{abntexto}

\makeatletter
\@ifclasslater{abntexto}{2026/05/07}{}{%
  \ClassError{abntexto-ufc}
    {abntexto 1.1 or newer is required}
    {Update the TeX distribution before compiling abntexto-ufc.}%
}
\makeatother

% NBR 6023:2025 requires repeated authorship to be rendered explicitly.
\PassOptionsToPackage{repeatfields=true}{biblatex}

% --- BEGIN inlined module: abntexto-ufc/core ---

% Normative mapping: docs/NORMATIVE-BASE.md.

\RequirePackage{iftex}
\RequirePackage[english,brazilian]{babel}
\RequirePackage{microtype}

\ExplSyntaxOn

\tl_new:N \g_ufc_document_type_tl
\tl_new:N \g_ufc_print_mode_tl
\tl_new:N \g_ufc_cover_mode_tl
\bool_new:N \g_ufc_catalog_card_bool
\bool_new:N \g_ufc_coat_of_arms_bool
\prop_new:N \g_ufc_metadata_prop

\prop_gset_from_keyval:Nn \g_ufc_metadata_prop
  {
    institution = {Universidade Federal do Ceará},
    institution-acronym = {UFC},
    center = {},
    department = {},
    undergraduate-program = {},
    undergraduate-degree = {},
    specialization-program = {},
    masters-graduate-program = {},
    masters-program = {},
    masters-degree-field = {},
    masters-concentration = {},
    doctoral-graduate-program = {},
    doctoral-program = {},
    doctoral-degree-field = {},
    doctoral-concentration = {},
    project-program = {},
    project-type = {Projeto de pesquisa},
    submission-entity = {Universidade Federal do Ceará},
    project-nature-statement = {},
    project-identifier = {},
    author = {},
    title = {},
    subtitle = {},
    title-variant = {},
    volume = {},
    year = {},
    location = {Fortaleza},
    submission-date = {},
    approval-date = {},
    article-author-note = {},
    advisor = {},
    advisor-institution = {},
    advisor-unit = {},
    advisor-feminine-label = {false},
    coadvisor = {},
    coadvisor-institution = {},
    coadvisor-unit = {},
    coadvisor-feminine-label = {false},
    epigraph-author = {},
    examiner-2 = {},
    examiner-2-unit = {},
    examiner-2-institution = {},
    examiner-3 = {},
    examiner-3-unit = {},
    examiner-3-institution = {},
    examiner-4 = {},
    examiner-4-unit = {},
    examiner-4-institution = {},
    examiner-5 = {},
    examiner-5-unit = {},
    examiner-5-institution = {},
    examiner-6 = {},
    examiner-6-unit = {},
    examiner-6-institution = {}
  }

\cs_new_protected:Npn \ufc_meta_set:nn #1#2
  { \prop_gput:Nnn \g_ufc_metadata_prop {#1} {#2} }

\cs_new:Npn \ufc_meta_use:n #1
  { \prop_item:Nn \g_ufc_metadata_prop {#1} }

\prg_new_conditional:Npnn \ufc_meta_if_blank:n #1 { T, F, TF }
  {
    \tl_if_blank:eTF { \ufc_meta_use:n {#1} }
      { \prg_return_true: }
      { \prg_return_false: }
  }

\keys_define:nn { ufc }
  {
    type .choice:,
    type / undergraduate-capstone .code:n =
      {
        \tl_gset:Nn \g_ufc_document_type_tl { undergraduate-capstone }
        \bool_gset_true:N \g_ufc_coat_of_arms_bool
      },
    type / specialization-capstone .code:n =
      {
        \tl_gset:Nn \g_ufc_document_type_tl { specialization-capstone }
        \bool_gset_true:N \g_ufc_coat_of_arms_bool
      },
    type / masters-thesis .code:n =
      {
        \tl_gset:Nn \g_ufc_document_type_tl { masters-thesis }
        \bool_gset_true:N \g_ufc_coat_of_arms_bool
      },
    type / doctoral-thesis .code:n =
      {
        \tl_gset:Nn \g_ufc_document_type_tl { doctoral-thesis }
        \bool_gset_true:N \g_ufc_coat_of_arms_bool
      },
    type / research-project .code:n =
      {
        \tl_gset:Nn \g_ufc_document_type_tl { research-project }
        \bool_gset_false:N \g_ufc_coat_of_arms_bool
      },
    type / anonymized-research-project .code:n =
      {
        \tl_gset:Nn \g_ufc_document_type_tl { anonymized-research-project }
        \bool_gset_false:N \g_ufc_coat_of_arms_bool
      },
    type / scientific-article .code:n =
      {
        \tl_gset:Nn \g_ufc_document_type_tl { scientific-article }
        \bool_gset_false:N \g_ufc_coat_of_arms_bool
      },

    print-mode .choice:,
    print-mode / single-sided .code:n =
      { \tl_gset:Nn \g_ufc_print_mode_tl { single-sided } },
    print-mode / double-sided .code:n =
      { \tl_gset:Nn \g_ufc_print_mode_tl { double-sided } },

    cover .choice:,
    cover / auto .code:n =
      { \tl_gset:Nn \g_ufc_cover_mode_tl { auto } },
    cover / true .code:n =
      { \tl_gset:Nn \g_ufc_cover_mode_tl { true } },
    cover / false .code:n =
      { \tl_gset:Nn \g_ufc_cover_mode_tl { false } },

    catalog-card .choice:,
    catalog-card / true .code:n =
      { \bool_gset_true:N \g_ufc_catalog_card_bool },
    catalog-card / false .code:n =
      { \bool_gset_false:N \g_ufc_catalog_card_bool },

    coat-of-arms .choice:,
    coat-of-arms / true .code:n =
      { \bool_gset_true:N \g_ufc_coat_of_arms_bool },
    coat-of-arms / false .code:n =
      { \bool_gset_false:N \g_ufc_coat_of_arms_bool },

    institution .code:n = { \ufc_meta_set:nn {institution} {#1} },
    institution-acronym .code:n = { \ufc_meta_set:nn {institution-acronym} {#1} },
    center .code:n = { \ufc_meta_set:nn {center} {#1} },
    department .code:n = { \ufc_meta_set:nn {department} {#1} },
    undergraduate-program .code:n = { \ufc_meta_set:nn {undergraduate-program} {#1} },
    undergraduate-degree .code:n = { \ufc_meta_set:nn {undergraduate-degree} {#1} },
    specialization-program .code:n = { \ufc_meta_set:nn {specialization-program} {#1} },
    masters-graduate-program .code:n = { \ufc_meta_set:nn {masters-graduate-program} {#1} },
    masters-program .code:n = { \ufc_meta_set:nn {masters-program} {#1} },
    masters-degree-field .code:n = { \ufc_meta_set:nn {masters-degree-field} {#1} },
    masters-concentration .code:n = { \ufc_meta_set:nn {masters-concentration} {#1} },
    doctoral-graduate-program .code:n = { \ufc_meta_set:nn {doctoral-graduate-program} {#1} },
    doctoral-program .code:n = { \ufc_meta_set:nn {doctoral-program} {#1} },
    doctoral-degree-field .code:n = { \ufc_meta_set:nn {doctoral-degree-field} {#1} },
    doctoral-concentration .code:n = { \ufc_meta_set:nn {doctoral-concentration} {#1} },
    project-program .code:n = { \ufc_meta_set:nn {project-program} {#1} },
    project-type .code:n = { \ufc_meta_set:nn {project-type} {#1} },
    submission-entity .code:n = { \ufc_meta_set:nn {submission-entity} {#1} },
    project-nature-statement .code:n = { \ufc_meta_set:nn {project-nature-statement} {#1} },
    project-identifier .code:n = { \ufc_meta_set:nn {project-identifier} {#1} },
    author .code:n = { \ufc_meta_set:nn {author} {#1} },
    title .code:n = { \ufc_meta_set:nn {title} {#1} },
    subtitle .code:n = { \ufc_meta_set:nn {subtitle} {#1} },
    title-variant .code:n = { \ufc_meta_set:nn {title-variant} {#1} },
    volume .code:n = { \ufc_meta_set:nn {volume} {#1} },
    year .code:n = { \ufc_meta_set:nn {year} {#1} },
    location .code:n = { \ufc_meta_set:nn {location} {#1} },
    submission-date .code:n = { \ufc_meta_set:nn {submission-date} {#1} },
    approval-date .code:n = { \ufc_meta_set:nn {approval-date} {#1} },
    article-author-note .code:n = { \ufc_meta_set:nn {article-author-note} {#1} },
    advisor .code:n = { \ufc_meta_set:nn {advisor} {#1} },
    advisor-institution .code:n = { \ufc_meta_set:nn {advisor-institution} {#1} },
    advisor-unit .code:n = { \ufc_meta_set:nn {advisor-unit} {#1} },
    advisor-feminine-label .choice:,
    advisor-feminine-label / true .code:n =
      { \ufc_meta_set:nn {advisor-feminine-label} {true} },
    advisor-feminine-label / false .code:n =
      { \ufc_meta_set:nn {advisor-feminine-label} {false} },
    coadvisor .code:n = { \ufc_meta_set:nn {coadvisor} {#1} },
    coadvisor-institution .code:n = { \ufc_meta_set:nn {coadvisor-institution} {#1} },
    coadvisor-unit .code:n = { \ufc_meta_set:nn {coadvisor-unit} {#1} },
    coadvisor-feminine-label .choice:,
    coadvisor-feminine-label / true .code:n =
      { \ufc_meta_set:nn {coadvisor-feminine-label} {true} },
    coadvisor-feminine-label / false .code:n =
      { \ufc_meta_set:nn {coadvisor-feminine-label} {false} },
    epigraph-author .code:n = { \ufc_meta_set:nn {epigraph-author} {#1} },
    examiner-2 .code:n = { \ufc_meta_set:nn {examiner-2} {#1} },
    examiner-2-unit .code:n = { \ufc_meta_set:nn {examiner-2-unit} {#1} },
    examiner-2-institution .code:n = { \ufc_meta_set:nn {examiner-2-institution} {#1} },
    examiner-3 .code:n = { \ufc_meta_set:nn {examiner-3} {#1} },
    examiner-3-unit .code:n = { \ufc_meta_set:nn {examiner-3-unit} {#1} },
    examiner-3-institution .code:n = { \ufc_meta_set:nn {examiner-3-institution} {#1} },
    examiner-4 .code:n = { \ufc_meta_set:nn {examiner-4} {#1} },
    examiner-4-unit .code:n = { \ufc_meta_set:nn {examiner-4-unit} {#1} },
    examiner-4-institution .code:n = { \ufc_meta_set:nn {examiner-4-institution} {#1} },
    examiner-5 .code:n = { \ufc_meta_set:nn {examiner-5} {#1} },
    examiner-5-unit .code:n = { \ufc_meta_set:nn {examiner-5-unit} {#1} },
    examiner-5-institution .code:n = { \ufc_meta_set:nn {examiner-5-institution} {#1} },
    examiner-6 .code:n = { \ufc_meta_set:nn {examiner-6} {#1} },
    examiner-6-unit .code:n = { \ufc_meta_set:nn {examiner-6-unit} {#1} },
    examiner-6-institution .code:n = { \ufc_meta_set:nn {examiner-6-institution} {#1} }
  }

\keys_set:nn { ufc }
  {
    type = undergraduate-capstone,
    print-mode = single-sided,
    cover = auto,
    catalog-card = false,
    coat-of-arms = true
  }

\NewDocumentCommand \ufcsetup { +m }
  { \keys_set:nn { ufc } { #1 } }

\NewExpandableDocumentCommand \ufcDocumentType { }
  { \tl_use:N \g_ufc_document_type_tl }

\NewExpandableDocumentCommand \ufcPrintMode { }
  { \tl_use:N \g_ufc_print_mode_tl }

\NewExpandableDocumentCommand \ufcMeta { m }
  { \ufc_meta_use:n {#1} }

\NewDocumentCommand \ufcIfProjectTF { +m +m }
  {
    \str_case:VnF \g_ufc_document_type_tl
      {
        {research-project} {#1}
        {anonymized-research-project} {#1}
      }
      {#2}
  }

\NewDocumentCommand \ufcIfAnonymizedProjectTF { +m +m }
  {
    \str_if_eq:VnTF \g_ufc_document_type_tl {anonymized-research-project} {#1} {#2}
  }

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/core ---
% --- BEGIN inlined module: abntexto-ufc/fonts ---

\RequirePackage{etoolbox}

\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage{newtxtext}
  \RequirePackage{newtxmath}
\else
  \RequirePackage{fontspec}
  \RequirePackage{unicode-math}
\fi

\ExplSyntaxOn

\tl_new:N \g_ufc_font_family_tl
\tl_new:N \g_ufc_math_font_policy_tl
\bool_new:N \g_ufc_font_strict_bool
\bool_new:N \g_ufc_pdftex_windows_map_loaded_bool
\bool_new:N \l_ufc_font_files_available_bool

\ifPDFTeX
  \tl_gset:Nn \g_ufc_math_font_policy_tl { NEW-TX-MATH }
\else
  \IfFontExistsTF{TeX Gyre Termes Math}
    {
      \setmathfont{TeX Gyre Termes Math}
      \tl_gset:Nn \g_ufc_math_font_policy_tl { TEX-GYRE-TERMES-MATH }
    }
    {
      \IfFontExistsTF{Latin Modern Math}
        {
          \setmathfont{Latin Modern Math}
          \tl_gset:Nn \g_ufc_math_font_policy_tl { LATIN-MODERN-MATH }
          \ClassInfo{abntexto-ufc}{TeX~Gyre~Termes~Math~not~found;~using~Latin~Modern~Math}
        }
        {
          \ClassError{abntexto-ufc}
            {No~supported~OpenType~math~font~was~found}
            {Install~TeX~Gyre~Termes~Math~or~Latin~Modern~Math.}
        }
    }
\fi

\keys_define:nn { ufc }
  {
    font .choice:,
    font / times .code:n =
      { \tl_gset:Nn \g_ufc_font_family_tl { times } },
    font / arial .code:n =
      { \tl_gset:Nn \g_ufc_font_family_tl { arial } },

    strict-font .choice:,
    strict-font / true .code:n =
      { \bool_gset_true:N \g_ufc_font_strict_bool },
    strict-font / false .code:n =
      { \bool_gset_false:N \g_ufc_font_strict_bool },
  }

\keys_set:nn { ufc }
  {
    font = times,
    strict-font = false
  }

\cs_new_protected:Npn \ufc_font_check_files:n #1
  {
    \bool_set_true:N \l_ufc_font_files_available_bool
    \clist_map_inline:nn {#1}
      {
        \file_if_exist:nF {##1}
          { \bool_set_false:N \l_ufc_font_files_available_bool }
      }
  }

\cs_new_protected:Npn \ufc_font_pdftex_load_windows_map:
  {
    \bool_if:NF \g_ufc_pdftex_windows_map_loaded_bool
      {
        \pdfmapfile{+abntexto-ufc-windows.map}
        \bool_gset_true:N \g_ufc_pdftex_windows_map_loaded_bool
      }
  }

% Keep all textual family switches inside the institutional family.
\cs_new_protected:Npn \ufc_font_pdftex_set_text_family:n #1
  {
    \ufc_font_pdftex_load_windows_map:
    \renewcommand{\rmdefault}{#1}
    \renewcommand{\sfdefault}{#1}
    \renewcommand{\ttdefault}{#1}
    \renewcommand{\familydefault}{\rmdefault}
  }

\cs_new_protected:Npn \ufc_font_luatex_set_text_family:n #1
  {
    \setmainfont{#1}
    \setsansfont{#1}
    \setmonofont{#1}
  }

\cs_new_protected:Npn \ufc_font_pdftex_times:
  {
    \ufc_font_check_files:n
      { abntexto-ufc-winfonts-ready.tex, t1times-ttf.fd, ts1times-ttf.fd }
    \bool_if:NTF \l_ufc_font_files_available_bool
      {
        \ufc_font_pdftex_set_text_family:n {times-ttf}
        \ClassInfo{abntexto-ufc}{Using~literal~Times~New~Roman~with~pdfLaTeX}
      }
      {
        \bool_if:NTF \g_ufc_font_strict_bool
          {
            \ClassError{abntexto-ufc}
              {Times~New~Roman~support~is~not~prepared~for~pdfLaTeX}
              {Run~tools/prepare-windows-fonts.ps1~on~Windows~and~compile~again.}
          }
          {
            \renewcommand{\rmdefault}{ntxtlf}
            \renewcommand{\sfdefault}{ntxtlf}
            \renewcommand{\ttdefault}{ntxtlf}
            \renewcommand{\familydefault}{\rmdefault}
            \ClassInfo{abntexto-ufc}{Times~New~Roman~not~prepared~for~pdfLaTeX;~using~NewTX~compatibility~fallback}
          }
      }
  }

\cs_new_protected:Npn \ufc_font_pdftex_arial:
  {
    \ufc_font_check_files:n
      { abntexto-ufc-winfonts-ready.tex, t1arial.fd, ts1arial.fd }
    \bool_if:NTF \l_ufc_font_files_available_bool
      {
        \ufc_font_pdftex_set_text_family:n {arial}
        \ClassInfo{abntexto-ufc}{Using~literal~Arial~with~pdfLaTeX}
      }
      {
        \bool_if:NTF \g_ufc_font_strict_bool
          {
            \ClassError{abntexto-ufc}
              {Arial~support~is~not~prepared~for~pdfLaTeX}
              {Run~tools/prepare-windows-fonts.ps1~on~Windows~and~compile~again.}
          }
          {
            \renewcommand{\rmdefault}{qhv}
            \renewcommand{\sfdefault}{qhv}
            \renewcommand{\ttdefault}{qhv}
            \renewcommand{\familydefault}{\rmdefault}
            \ClassInfo{abntexto-ufc}{Arial~not~prepared~for~pdfLaTeX;~using~TeX~Gyre~Heros~compatibility~fallback}
          }
      }
  }

\cs_new_protected:Npn \ufc_font_luatex_times:
  {
    \IfFontExistsTF{Times New Roman}
      {
        \ufc_font_luatex_set_text_family:n {Times New Roman}
        \ClassInfo{abntexto-ufc}{Using~literal~Times~New~Roman~with~LuaLaTeX}
      }
      {
        \bool_if:NTF \g_ufc_font_strict_bool
          {
            \ClassError{abntexto-ufc}
              {Times~New~Roman~not~found}
              {Install~Times~New~Roman~or~set~strict-font=false.}
          }
          {
            \ClassInfo{abntexto-ufc}{Times~New~Roman~not~found;~using~TeX~Gyre~Termes~compatibility~fallback}
            \ufc_font_luatex_set_text_family:n {TeX Gyre Termes}
          }
      }
  }

\cs_new_protected:Npn \ufc_font_luatex_arial:
  {
    \IfFontExistsTF{Arial}
      {
        \ufc_font_luatex_set_text_family:n {Arial}
        \ClassInfo{abntexto-ufc}{Using~literal~Arial~with~LuaLaTeX}
      }
      {
        \bool_if:NTF \g_ufc_font_strict_bool
          {
            \ClassError{abntexto-ufc}
              {Arial~not~found}
              {Install~Arial~or~set~strict-font=false.}
          }
          {
            \ClassInfo{abntexto-ufc}{Arial~not~found;~using~TeX~Gyre~Heros~compatibility~fallback}
            \ufc_font_luatex_set_text_family:n {TeX Gyre Heros}
          }
      }
  }

\cs_new_protected:Npn \ufc_font_apply:
  {
    \ifPDFTeX
      \str_case:Vn \g_ufc_font_family_tl
        {
          { times } { \ufc_font_pdftex_times: }
          { arial } { \ufc_font_pdftex_arial: }
        }
    \else
      \str_case:Vn \g_ufc_font_family_tl
        {
          { times } { \ufc_font_luatex_times: }
          { arial } { \ufc_font_luatex_arial: }
        }
    \fi
  }

\NewExpandableDocumentCommand \ufcMathFontPolicy { }
  { \tl_use:N \g_ufc_math_font_policy_tl }

\AtEndPreamble{\ufc_font_apply:}

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/fonts ---
% --- BEGIN inlined module: abntexto-ufc/layout ---

% UFC body text uses 12 pt, 1.5 spacing, 2 cm first-line indent and no extra spacing.
\setlength{\parskip}{0pt}
\setlength{\parindent}{2cm}
\AtBeginDocument{\onehalfsp}

% Tagging-safe ABNT alíneas and subalíneas using LaTeX block-list keys.
\NewDocumentEnvironment{ufclettereditems}{}
  {\begin{enumerate}[
    item-label={\alph{enumi})},
    item-vspace=0pt,
    begin-vspace=0pt,
    end-vspace=0pt,
    para-vspace=0pt,
    left-margin=2.8cm,
    label-width=.5cm,
    label-sep=.3cm,
    item-indent=0pt,
    label-align=left
  ]}
  {\end{enumerate}}
\NewDocumentEnvironment{ufcdashedsubitems}{}
  {\begin{enumerate}[
    item-label={---},
    item-vspace=0pt,
    begin-vspace=0pt,
    end-vspace=0pt,
    para-vspace=0pt,
    left-margin=.9cm,
    label-width=.6cm,
    label-sep=.3cm,
    item-indent=0pt,
    label-align=left
  ]}
  {\end{enumerate}}

% UFC section hierarchy. The same hierarchy is mirrored in the table of contents.
\def\sectionfont       {\bfseries\MakeUppercase}
\def\subsectionfont    {\bfseries}
\def\subsubsectionfont {\bfseries\itshape}
\def\paragraphfont     {\itshape}
\def\subparagraphfont  {}

% Use one character space between each section indicator and its title.
\patchcmd{\printsection}{\thesection\quad}{\thesection\space}{}
  {\ClassError{abntexto-ufc}{Cannot patch section separator}{Update the abntexto compatibility layer.}}
\patchcmd{\printsubsection}{\thesubsection\quad}{\thesubsection\space}{}
  {\ClassError{abntexto-ufc}{Cannot patch subsection separator}{Update the abntexto compatibility layer.}}
\patchcmd{\printsubsubsection}{\thesubsubsection\quad}{\thesubsubsection\space}{}
  {\ClassError{abntexto-ufc}{Cannot patch subsubsection separator}{Update the abntexto compatibility layer.}}
\patchcmd{\printparagraph}{\theparagraph\quad}{\theparagraph\space}{}
  {\ClassError{abntexto-ufc}{Cannot patch paragraph separator}{Update the abntexto compatibility layer.}}
\patchcmd{\printsubparagraph}{\thesubparagraph\quad}{\thesubparagraph\space}{}
  {\ClassError{abntexto-ufc}{Cannot patch subparagraph separator}{Update the abntexto compatibility layer.}}

\def\tocsectionfont       {\bfseries\MakeUppercase}
\def\tocsubsectionfont    {\bfseries}
\def\tocsubsubsectionfont {\bfseries\itshape}
\def\tocparagraphfont     {\itshape}
\def\tocsubparagraphfont  {}

% UFC examples use spaced dotted leaders up to the right-aligned page number.
% Preserve a compact visible leader when a primary entry nearly fills the line.
\def\ufctocdot{\hbox{$\mathsurround=0pt\mkern4.5mu\hbox{.}\mkern4.5mu$}}
\def\extdotleaders{%
  \nobreak
  \hbox to 1.1em{\leaders\ufctocdot\hfil}%
  \leaders\ufctocdot\hfil
}
\appto\hooktocsection{\let\extleaders=\extdotleaders}

\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}

% The current UFC normative profile is section-based. Chapter mode is intentionally disabled.
\renewcommand{\usechapters}{%
  \ClassError{abntexto-ufc}
    {Chapter mode is not supported by the current UFC normative profile}
    {Use section as the primary textual level.}%
}

\ExplSyntaxOn

\bool_new:N \g_ufc_physical_parity_inverted_bool

\cs_new_protected:Npn \ufc_layout_one_sided:
  {
    \newgeometry{
      twoside = false,
      left = 3cm,
      top = 3cm,
      right = 2cm,
      bottom = 2cm
    }
  }

\cs_new_protected:Npn \ufc_layout_two_sided:
  {
    \newgeometry{
      twoside = true,
      inner = 3cm,
      outer = 2cm,
      top = 3cm,
      bottom = 2cm
    }
  }

\cs_new_protected:Npn \ufc_blank_page:
  {
    \thispagestyle{empty}
    \hbox{}
    \newpage
  }

\cs_new_protected:Npn \ufc_next_odd_physical_page:
  {
    \clearpage
    \bool_if:NTF \g_ufc_physical_parity_inverted_bool
      { \int_if_odd:nT { \value{page} } { \ufc_blank_page: } }
      { \int_if_odd:nF { \value{page} } { \ufc_blank_page: } }
  }

\cs_new_protected:Npn \ufc_register_uncounted_physical_page:
  {
    \bool_if:NTF \g_ufc_physical_parity_inverted_bool
      { \bool_gset_false:N \g_ufc_physical_parity_inverted_bool }
      { \bool_gset_true:N \g_ufc_physical_parity_inverted_bool }
  }

\cs_new_protected:Npn \ufc_primary_section_break:
  {
    \str_if_eq:VnTF \g_ufc_print_mode_tl { double-sided }
      { \ufc_next_odd_physical_page: }
      { \clearpage }
  }

\cs_new_protected:Npn \ufc_layout_apply:
  {
    \str_if_eq:VnTF \g_ufc_print_mode_tl { double-sided }
      {
        \cs_set_eq:NN \onesidelayout \ufc_layout_two_sided:
        \cs_set_eq:NN \twosidelayout \ufc_layout_two_sided:
      }
      {
        \cs_set_eq:NN \onesidelayout \ufc_layout_one_sided:
        \cs_set_eq:NN \twosidelayout \ufc_layout_one_sided:
      }
  }

\NewDocumentCommand \ufcPrimarySectionBreak { }
  { \ufc_primary_section_break: }

\NewDocumentCommand \ufcPretextualBreak { }
  { \ufc_primary_section_break: }

\NewDocumentCommand \ufcRegisterUncountedPhysicalPage { }
  { \ufc_register_uncounted_physical_page: }

\AtBeginDocument{\ufc_layout_apply:}

\ExplSyntaxOff

% Keep one public extension point instead of relying on abntexto internals.
\providecommand{\ufcSectionHook}{}
\def\hooksection{\ufcPrimarySectionBreak\ufcSectionHook}

% In duplex mode, every pre-textual element except the catalog card starts on recto.
\AtBeginDocument{%
  \AddToHook{cmd/ufcPrintTitlePage/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintApprovalPage/before}{\ufcIfProjectTF{}{\ufcPretextualBreak}}%
  \AddToHook{cmd/ufcPrintDedication/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintAcknowledgments/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintEpigraph/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintErrata/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintSummary/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintAbstract/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintListOfIllustrations/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintListOfFigures/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintListOfTables/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintListOfTextTables/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintListOfCharts/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintListOfCodeListings/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintListOfAlgorithms/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintListOfAbbreviationsAndAcronyms/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintListOfSymbols/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/ufcPrintTableOfContents/before}{\ufcPretextualBreak}%
  \AddToHook{cmd/appendix/before}{\ufcPrimarySectionBreak}%
  \AddToHook{cmd/annex/before}{\ufcPrimarySectionBreak}%
}

% UFC footnotes use reduced type, single spacing and a 5 cm separator rule.
\makeatletter
\renewcommand{\footnoterule}{%
  \kern 3pt
  \hrule width 5cm
  \kern 3pt
}
\long\def\@makefntext#1{%
  \parindent=0pt
  \abntsmall\singlesp
  \hangindent=2cm
  \hangafter=1
  \noindent
  \hbox to 2cm{\hss\@makefnmark\enspace}#1%
}
\makeatother
% --- END inlined module: abntexto-ufc/layout ---
% --- BEGIN inlined module: abntexto-ufc/modules ---

\RequirePackage{etoolbox}

\ExplSyntaxOn

\tl_new:N \g_ufc_table_module_tl
\tl_new:N \g_ufc_code_module_tl
\tl_new:N \g_ufc_algorithm_module_tl
\tl_new:N \g_ufc_glossary_module_tl
\tl_new:N \g_ufc_index_module_tl
\bool_new:N \g_ufc_glossary_initialized_bool
\bool_new:N \g_ufc_index_initialized_bool
\bool_new:N \g_ufc_table_typography_patched_bool

\cs_new_protected:Npn \ufc_table_check_version:
  {
    \IfPackageAtLeastTF{tabularray-abnt}{2025-08-08}
      { }
      {
        \ClassError{abntexto-ufc}
          {tabularray-abnt~2025-08-08~or~newer~is~required}
          {Update~the~TeX~distribution~before~using~tables=tabularray.}
      }
  }

% Compatibility adapter for the tabularray theme store used by tabularray-abnt.
\cs_new_protected:Npn \ufc_table_patch_theme:n #1
  {
    \tl_if_exist:cTF { g__tblr_theme_#1_code_tl }
      {
        \tl_gput_right:cn { g__tblr_theme_#1_code_tl }
          {
            % Keep the upper table identification/title at body size while
            % lower continuation/source/note text remains reduced.
            \SetTblrStyle{caption,lasthead,capcont}{font=\normalsize}
            \SetTblrStyle{firsthead-text,lasthead-text,conthead-text,lastfoot}{font=\abntsmall}
          }
      }
      {
        \ClassError{abntexto-ufc}
          {tabularray-abnt~theme~'#1'~is~unavailable}
          {Update~tabularray-abnt~before~using~tables=tabularray.}
      }
  }

\cs_new_protected:Npn \ufc_table_apply_typography:
  {
    \bool_if:NF \g_ufc_table_typography_patched_bool
      {
        \ufc_table_patch_theme:n { abnt }
        \ufc_table_patch_theme:n { quadro }
        \bool_gset_true:N \g_ufc_table_typography_patched_bool
      }
  }

\keys_define:nn { ufc }
  {
    tables .choice:,
    tables / native .code:n =
      { \tl_gset:Nn \g_ufc_table_module_tl { native } },
    tables / tabularray .code:n =
      {
        \tl_gset:Nn \g_ufc_table_module_tl { tabularray }
        \RequirePackage{xcolor}
        \RequirePackage{tabularray-abnt}
        \ufc_table_check_version:
        \UseTblrLibrary{booktabs}
        \SetAbntTblrFont{\normalsize}
        \ufc_table_apply_typography:
      },

    code .choice:,
    code / none .code:n =
      { \tl_gset:Nn \g_ufc_code_module_tl { none } },
    code / listings .code:n =
      {
        \tl_gset:Nn \g_ufc_code_module_tl { listings }
        \RequirePackage{listings}
        % Source code remains in the institutional text family and body size.
        \lstset{basicstyle=\ttfamily\normalsize}
      },
    code / minted .code:n =
      {
        \tl_gset:Nn \g_ufc_code_module_tl { minted }
        \RequirePackage{minted}
        % minted defaults to tt; abntexto-ufc maps tt to the institutional family.
        \setminted{fontfamily=tt,fontsize=\normalsize}
      },

    algorithms .choice:,
    algorithms / none .code:n =
      { \tl_gset:Nn \g_ufc_algorithm_module_tl { none } },
    algorithms / algpseudocodex .code:n =
      {
        \tl_gset:Nn \g_ufc_algorithm_module_tl { algpseudocodex }
        % Keep EndIf/EndWhile visible: hidden block endings still consume line
        % numbers in algpseudocodex and produce visually empty numbered lines.
        \PassOptionsToPackage{noEnd=false}{algpseudocodex}
        \RequirePackage{algpseudocodex}
      },

    glossary .choice:,
    glossary / none .code:n =
      { \tl_gset:Nn \g_ufc_glossary_module_tl { none } },
    glossary / glossaries .code:n =
      {
        \tl_gset:Nn \g_ufc_glossary_module_tl { glossaries }
        \bool_if:NF \g_ufc_glossary_initialized_bool
          {
            \PassOptionsToPackage{lang-warn=false}{datatool-base}
            \RequirePackage[acronym,toc=false]{glossaries}
            \makeglossaries
            \ufc_setup_glossary_module:
            \bool_gset_true:N \g_ufc_glossary_initialized_bool
          }
      },

    index .choice:,
    index / none .code:n =
      { \tl_gset:Nn \g_ufc_index_module_tl { none } },
    index / imakeidx .code:n =
      {
        \tl_gset:Nn \g_ufc_index_module_tl { imakeidx }
        \bool_if:NF \g_ufc_index_initialized_bool
          {
            \RequirePackage{imakeidx}
            \makeindex
            \ufc_setup_index_module:
            \bool_gset_true:N \g_ufc_index_initialized_bool
          }
      },
  }

\tl_gset:Nn \g_ufc_table_module_tl { native }
\tl_gset:Nn \g_ufc_code_module_tl { none }
\tl_gset:Nn \g_ufc_algorithm_module_tl { none }
\tl_gset:Nn \g_ufc_glossary_module_tl { none }
\tl_gset:Nn \g_ufc_index_module_tl { none }

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/modules ---
% --- BEGIN inlined module: abntexto-ufc/frontmatter ---

\RequirePackage{pdfpages}
\RequirePackage{ragged2e}

\makeatletter
\newcommand{\ufcstarttoc}[1]{\@starttoc{#1}}

% Keep one unified illustration list in source order while preserving typed lists.
\def\loilabelwidth{5.4em}
\def\loiifont{\maintocfont}
\def\l@loii{\extline{0pt}{\loilabelwidth}{\loiifont}}
\AddToHook{begindocument}{%
  \let\ufc@baseaddtoext\addtoext
  \def\addtoext#1#2#3{%
    \ufc@baseaddtoext{#1}{#2}{#3}%
    \def\ufc@ext{#1}%
    \def\ufc@lof{lof}%
    \def\ufc@logr{logr}%
    \def\ufc@loq{loq}%
    \ifx\ufc@ext\ufc@lof \ufc@baseaddtoext{loi}{loii}{#3}\fi
    \ifx\ufc@ext\ufc@logr \ufc@baseaddtoext{loi}{loii}{#3}\fi
    \ifx\ufc@ext\ufc@loq \ufc@baseaddtoext{loi}{loii}{#3}\fi
  }%
}
\makeatother

\ExplSyntaxOn

\cs_new_protected:Npn \ufc_input_file:n #1
  {
    \InputIfFileExists{#1}{}{%
      \ClassWarningNoLine{abntexto-ufc}{Input~file~'#1'~not~found}%
    }
  }

\cs_new_protected:Npn \ufc_pretextual_heading:n #1
  {
    \begin{center}
      \bfseries\MakeUppercase{#1}\par
    \end{center}
    \vspace{\baselineskip}
  }

\NewDocumentCommand \ufcPretextualHeading { m }
  { \ufc_pretextual_heading:n {#1} }

\cs_new:Npn \ufc_title_text:
  {
    \MakeUppercase{\ufc_meta_use:n {title}}
    \ufc_meta_if_blank:nF {subtitle}
      {:\space\MakeUppercase{\ufc_meta_use:n {subtitle}}}
  }

\cs_new_protected:Npn \ufc_optional_upper_line:n #1
  {
    \ufc_meta_if_blank:nF {#1}
      { \MakeUppercase{\ufc_meta_use:n {#1}}\par }
  }

\cs_new_protected:Npn \ufc_print_visible_author:
  {
    \ufcIfAnonymizedProjectTF
      {
        \ufc_meta_if_blank:nF {project-identifier}
          { \MakeUppercase{\ufc_meta_use:n {project-identifier}}\par }
      }
      {
        \ufc_meta_if_blank:nF {author}
          { \MakeUppercase{\ufc_meta_use:n {author}}\par }
      }
  }

\cs_new:Npn \ufc_orientation_label:
  {
    \str_if_eq:eeTF {\ufc_meta_use:n {advisor-feminine-label}} {true}
      {Orientadora}
      {Orientador}
  }

\cs_new:Npn \ufc_coorientation_label:
  {
    \str_if_eq:eeTF {\ufc_meta_use:n {coadvisor-feminine-label}} {true}
      {Coorientadora}
      {Coorientador}
  }

\cs_new:Npn \ufc_nature_text:
  {
    \str_case:VnF \g_ufc_document_type_tl
      {
        {undergraduate-capstone}
          {
            Trabalho~de~Conclusão~de~Curso~apresentado~ao~Curso~de~Graduação~em~
            \ufc_meta_use:n {undergraduate-program}~da~\ufc_meta_use:n {institution},~como~requisito~
            parcial~à~obtenção~do~grau~de~\ufc_meta_use:n {undergraduate-degree}~em~
            \ufc_meta_use:n {undergraduate-program}.
          }
        {specialization-capstone}
          {
            Trabalho~de~Conclusão~de~Curso~apresentado~ao~Curso~de~Especialização~em~
            \ufc_meta_use:n {specialization-program}~da~\ufc_meta_use:n {institution},~como~
            requisito~parcial~à~obtenção~do~título~de~especialista~em~
            \ufc_meta_use:n {specialization-program}.
          }
        {masters-thesis}
          {
            Dissertação~apresentada~ao~\ufc_meta_use:n {masters-graduate-program}~da~
            \ufc_meta_use:n {institution},~como~requisito~parcial~à~obtenção~do~título~de~
            mestre~em~\ufc_meta_use:n {masters-degree-field}.
            \ufc_meta_if_blank:nF {masters-concentration}
              {~Área~de~concentração:~\ufc_meta_use:n {masters-concentration}.}
          }
        {doctoral-thesis}
          {
            Tese~apresentada~ao~\ufc_meta_use:n {doctoral-graduate-program}~da~
            \ufc_meta_use:n {institution},~como~requisito~parcial~à~obtenção~do~título~de~
            doutor~em~\ufc_meta_use:n {doctoral-degree-field}.
            \ufc_meta_if_blank:nF {doctoral-concentration}
              {~Área~de~concentração:~\ufc_meta_use:n {doctoral-concentration}.}
          }
        {research-project}
          {
            \ufc_meta_if_blank:nTF {project-nature-statement}
              {
                \ufc_meta_use:n {project-type}~apresentado~à~
                \ufc_meta_use:n {submission-entity}.
              }
              { \ufc_meta_use:n {project-nature-statement} }
          }
        {anonymized-research-project}
          {
            \ufc_meta_if_blank:nTF {project-nature-statement}
              {
                \ufc_meta_use:n {project-type}~apresentado~à~
                \ufc_meta_use:n {submission-entity}.
              }
              { \ufc_meta_use:n {project-nature-statement} }
          }
      }
      {}
  }

\cs_new_protected:Npn \ufc_print_advisors:
  {
    \ufcIfAnonymizedProjectTF
      {}
      {
        \ufc_meta_if_blank:nF {advisor}
          {
            \par\ufc_orientation_label:\c_colon_str\space
            \ufc_meta_use:n {advisor}.
          }
        \ufc_meta_if_blank:nF {coadvisor}
          {
            \par\ufc_coorientation_label:\c_colon_str\space
            \ufc_meta_use:n {coadvisor}.
          }
      }
  }

\int_new:N \l_ufc_committee_count_int
\dim_new:N \l_ufc_signature_gap_dim

\cs_new_protected:Npn \ufc_count_committee_key:n #1
  {
    \ufc_meta_if_blank:nF {#1}
      { \int_incr:N \l_ufc_committee_count_int }
  }

\cs_new_protected:Npn \ufc_setup_signature_spacing:
  {
    \int_zero:N \l_ufc_committee_count_int
    \ufc_count_committee_key:n {advisor}
    \ufc_count_committee_key:n {coadvisor}
    \ufc_count_committee_key:n {examiner-2}
    \ufc_count_committee_key:n {examiner-3}
    \ufc_count_committee_key:n {examiner-4}
    \ufc_count_committee_key:n {examiner-5}
    \ufc_count_committee_key:n {examiner-6}

    \dim_set:Nn \l_ufc_signature_gap_dim { .65\baselineskip }
    \int_compare:nNnT { \l_ufc_committee_count_int } > {4}
      { \dim_set:Nn \l_ufc_signature_gap_dim { .35\baselineskip } }
    \int_compare:nNnT { \l_ufc_committee_count_int } > {5}
      { \dim_set:Nn \l_ufc_signature_gap_dim { .2\baselineskip } }
  }

\cs_new_protected:Npn \ufc_signature_from_keys:nn #1#2
  {
    \ufc_meta_if_blank:nF {#1}
      {
        \par\vspace{\l_ufc_signature_gap_dim}
        \begingroup
          \centering\singlesp
          \rule{8cm}{0.4pt}\par
          \ufc_meta_use:n {#1}\par
          \ufc_meta_if_blank:nF {#2} { \ufc_meta_use:n {#2}\par }
        \endgroup
      }
  }

\cs_new_protected:Npn \ufc_advisor_signature:
  {
    \ufc_signature_from_keys:nn
      {advisor}
      {advisor-institution}
  }

\cs_new_protected:Npn \ufc_coadvisor_signature:
  {
    \ufc_signature_from_keys:nn
      {coadvisor}
      {coadvisor-institution}
  }

\cs_new_protected:Npn \ufc_examiner_signature:n #1
  {
    \ufc_signature_from_keys:nn
      {examiner-#1}
      {examiner-#1-institution}
  }

\cs_new_protected:Npn \ufc_approval_page:
  {
    \ufcIfProjectTF
      {}
      {
        \clearpage
        \thispagestyle{empty}
        \begingroup
          \centering
          \MakeUppercase{\ufc_meta_use:n {author}}\par
          \vspace{2\baselineskip}
          \bfseries\ufc_title_text:\par
          \normalfont
          \vspace{2\baselineskip}
          \noindent\hspace*{8cm}%
          \begin{minipage}{\dimexpr\textwidth-8cm\relax}
            \singlesp\ufc_nature_text:
          \end{minipage}\par
          \vspace{\baselineskip}
          \raggedright
          Aprovada~em:~\ufc_meta_use:n {approval-date}\par
          \vspace{\baselineskip}
          \centering\bfseries BANCA~EXAMINADORA\normalfont\par
          \ufc_setup_signature_spacing:
          \ufc_advisor_signature:
          \ufc_coadvisor_signature:
          \ufc_examiner_signature:n {2}
          \ufc_examiner_signature:n {3}
          \ufc_examiner_signature:n {4}
          \ufc_examiner_signature:n {5}
          \ufc_examiner_signature:n {6}
        \endgroup
        \clearpage
      }
  }

\NewDocumentCommand \ufcPrintApprovalPage { }
  { \ufc_approval_page: }

% UFC dedicatory and epigraph blocks start below the physical page midpoint.
\NewDocumentCommand \ufcPrintDedication { m }
  {
    \clearpage
    \thispagestyle{empty}
    \vspace*{.5\textheight}
    \noindent\hspace*{8cm}%
    \begin{minipage}{\dimexpr\textwidth-8cm\relax}
      \onehalfsp\justifying
      \setlength{\parindent}{0pt}
      \ufc_input_file:n {#1}
    \end{minipage}\par
    \vfill
    \clearpage
  }

\NewDocumentCommand \ufcPrintAcknowledgments { m }
  {
    \clearpage
    \thispagestyle{empty}
    \ufc_pretextual_heading:n {Agradecimentos}
    \justifying\ufc_input_file:n {#1}
    \clearpage
  }

\cs_new_protected:Npn \ufc_epigraph_short:n #1
  {
    \clearpage
    \thispagestyle{empty}
    \vspace*{.5\textheight}
    \noindent\hspace*{8cm}%
    \begin{minipage}{\dimexpr\textwidth-8cm\relax}
      \textquotedblleft\ufc_input_file:n {#1}\textquotedblright
      \ufc_meta_if_blank:nF {epigraph-author}
        { \par\raggedleft\ufc_meta_use:n {epigraph-author} }
    \end{minipage}\par
    \vfill
    \clearpage
  }

\cs_new_protected:Npn \ufc_epigraph_long:n #1
  {
    \clearpage
    \thispagestyle{empty}
    \vspace*{.5\textheight}
    \noindent\hspace*{4cm}%
    \begin{minipage}{\dimexpr\textwidth-4cm\relax}
      \fontsize{10}{12}\selectfont
      \singlesp
      \justifying
      \setlength{\parindent}{0pt}
      \ufc_input_file:n {#1}
      \ufc_meta_if_blank:nF {epigraph-author}
        { \par\raggedleft\ufc_meta_use:n {epigraph-author} }
    \end{minipage}\par
    \vfill
    \clearpage
  }

\NewDocumentCommand \ufcPrintEpigraph { O{short} m }
  {
    \str_case:nnF {#1}
      {
        {short} { \ufc_epigraph_short:n {#2} }
        {long} { \ufc_epigraph_long:n {#2} }
      }
      {
        \ClassError{abntexto-ufc}
          {Invalid~epigraph~type~'#1'}
          {Use~\string\ufcPrintEpigraph[short]~or~\string\ufcPrintEpigraph[long].}
      }
  }

\NewDocumentCommand \ufcPrintErrata { m }
  {
    \clearpage
    \thispagestyle{empty}
    \ufc_pretextual_heading:n {Errata}
    \justifying
    \ufc_input_file:n {#1}
    \clearpage
  }

\ProvideDocumentCommand \ufcSummaryKeywords { m }
  {
    \par\vspace{\baselineskip}
    \noindent\textbf{Palavras-chave:}\space #1
  }

\ProvideDocumentCommand \keywords { m }
  {
    \par\vspace{\baselineskip}
    \noindent\textbf{Keywords:}\space #1
  }

\NewDocumentCommand \ufcPrintSummary { m }
  {
    \clearpage
    \thispagestyle{empty}
    \ufc_pretextual_heading:n {Resumo}
    \begingroup
      \setlength{\parindent}{0pt}
      \justifying\ufc_input_file:n {#1}
    \endgroup
    \clearpage
  }

\NewDocumentCommand \ufcPrintAbstract { m }
  {
    \clearpage
    \thispagestyle{empty}
    \begingroup
      \selectlanguage{english}
      \ufc_pretextual_heading:n {Abstract}
      \setlength{\parindent}{0pt}
      \justifying\ufc_input_file:n {#1}
    \endgroup
    \clearpage
  }

\cs_new_protected:Npn \ufc_pretextual_list:nn #1#2
  {
    \clearpage
    \thispagestyle{empty}
    \ufc_pretextual_heading:n {#1}
    #2
    \clearpage
  }

\NewDocumentCommand \ufcPrintListOfIllustrations { }
  { \ufc_pretextual_list:nn {Lista~de~Ilustrações} {\ufcstarttoc{loi}} }

\NewDocumentCommand \ufcPrintListOfFigures { }
  { \ufc_pretextual_list:nn {Lista~de~Figuras} {\ufcstarttoc{lof}} }

\NewDocumentCommand \ufcPrintListOfTables { }
  { \ufc_pretextual_list:nn {Lista~de~Tabelas} {\ufcstarttoc{lot}} }

\NewDocumentCommand \ufcPrintListOfTextTables { }
  { \ufc_pretextual_list:nn {Lista~de~Quadros} {\ufcstarttoc{loq}} }

\NewDocumentCommand \ufcPrintListOfAbbreviationsAndAcronyms { m }
  {
    \ufc_pretextual_list:nn
      {Lista~de~Abreviaturas~e~Siglas}
      {\ufc_input_file:n {#1}}
  }

\NewDocumentCommand \ufcPrintListOfSymbols { m }
  {
    \ufc_pretextual_list:nn
      {Lista~de~Símbolos}
      {\ufc_input_file:n {#1}}
  }

\NewDocumentEnvironment { ufcdefinitionlist } { O{3cm} }
  {
    \begin{description}[
      style=standard,
      align=left,
      leftmargin=#1,
      labelwidth=\dimexpr#1-.3cm\relax,
      labelsep=.3cm,
      font=\normalfont,
      itemsep=0pt,
      parsep=0pt,
      topsep=0pt
    ]
  }
  { \end{description} }

\NewDocumentCommand \ufcListEntry { m m }
  { \item[#1] #2 }

\NewDocumentCommand \ufcPrintTableOfContents { }
  {
    \clearpage
    \thispagestyle{empty}
    \ufc_pretextual_heading:n {Sumário}
    \ufcstarttoc{toc}
    \clearpage
  }

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/frontmatter ---
% --- BEGIN inlined module: abntexto-ufc/institutional ---

\ExplSyntaxOn

\tl_new:N \g_ufc_coat_of_arms_file_tl
\tl_gset:Nn \g_ufc_coat_of_arms_file_tl { assets/institutional/ufc-coat-of-arms.png }

\keys_define:nn { ufc }
  {
    coat-of-arms-file .tl_gset:N = \g_ufc_coat_of_arms_file_tl
  }

\cs_new_protected:Npn \ufc_include_coat_of_arms:n #1
  {
    \file_if_exist:nTF {#1}
      {
        \includegraphics[width=2.2cm]{#1}
        \par\vspace{.3\baselineskip}
      }
      {
        \ClassWarningNoLine{abntexto-ufc}
          {UFC~coat~of~arms~asset~not~found;~configure~coat-of-arms-file}
      }
  }

\cs_new_protected:Npn \ufc_print_coat_of_arms:
  {
    \bool_if:NT \g_ufc_coat_of_arms_bool
      { \exp_args:NV \ufc_include_coat_of_arms:n \g_ufc_coat_of_arms_file_tl }
  }

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/institutional ---
% --- BEGIN inlined module: abntexto-ufc/academic-works ---

% NBR 14724:2024: volume identification and continuous pagination.
\ExplSyntaxOn

\int_new:N \g_ufc_initial_page_int
\int_new:N \l_ufc_catalog_page_int
\bool_new:N \l_ufc_catalog_included_bool
\int_gset:Nn \g_ufc_initial_page_int {1}

\keys_define:nn { ufc }
  {
    initial-page .code:n =
      {
        \int_compare:nNnTF {#1} > {0}
          { \int_gset:Nn \g_ufc_initial_page_int {#1} }
          {
            \ClassError{abntexto-ufc}
              {Invalid~initial-page~'#1'}
              {Use~an~integer~greater~than~zero.}
          }
      }
  }

\AtBeginDocument
  { \setcounter{page}{\int_use:N \g_ufc_initial_page_int} }

\cs_new_protected:Npn \ufc_work_volume_line:
  {
    \ufc_meta_if_blank:nF {volume}
      { VOLUME~\ufc_meta_use:n {volume}\par }
  }

\cs_new_protected:Npn \ufc_cover_program_lines:
  {
    \str_case:Vn \g_ufc_document_type_tl
      {
        {undergraduate-capstone}
          {
            \ufc_meta_if_blank:nF {undergraduate-program}
              {
                \MakeUppercase
                  {Curso~de~Graduação~em~\ufc_meta_use:n {undergraduate-program}}\par
              }
          }
        {specialization-capstone}
          {
            \ufc_meta_if_blank:nF {specialization-program}
              {
                \MakeUppercase
                  {Curso~de~Especialização~em~\ufc_meta_use:n {specialization-program}}\par
              }
          }
        {masters-thesis}
          {
            \ufc_optional_upper_line:n {masters-graduate-program}
            \ufc_optional_upper_line:n {masters-program}
          }
        {doctoral-thesis}
          {
            \ufc_optional_upper_line:n {doctoral-graduate-program}
            \ufc_optional_upper_line:n {doctoral-program}
          }
      }
  }

\cs_new_protected:Npn \ufc_cover:
  {
    \clearpage
    \thispagestyle{empty}
    \begingroup
      \centering\bfseries
      \ufc_print_coat_of_arms:
      \MakeUppercase{\ufc_meta_use:n {institution}}\par
      \ufc_optional_upper_line:n {center}
      \ufc_optional_upper_line:n {department}
      \ufc_cover_program_lines:
      \vspace{2cm}
      \ufc_print_visible_author:
      \vfill
      \ufc_title_text:\par
      \ufc_work_volume_line:
      \vfill
      \MakeUppercase{\ufc_meta_use:n {location}}\par
      \ufc_meta_use:n {year}\par
    \endgroup
    \clearpage
    \setcounter{page}{\int_use:N \g_ufc_initial_page_int}
  }

\NewDocumentCommand \ufcPrintCover { }
  {
    \str_if_eq:VnF \g_ufc_cover_mode_tl {false}
      { \ufc_cover: }
  }

\AddToHook{cmd/ufcPrintCover/after}
  { \setcounter{page}{\int_use:N \g_ufc_initial_page_int} }

\cs_new_protected:Npn \ufc_title_page:
  {
    \clearpage
    \thispagestyle{empty}
    \begingroup
      \centering
      \ufc_print_visible_author:
      \vspace{4cm}
      \bfseries\ufc_title_text:\par
      \ufc_work_volume_line:
      \normalfont
      \vspace{4cm}
      \noindent\hspace*{8cm}%
      \begin{minipage}{\dimexpr\textwidth-8cm\relax}
        \singlesp
        \ufc_nature_text:
        \ufc_print_advisors:
      \end{minipage}\par
      \vfill
      \MakeUppercase{\ufc_meta_use:n {location}}\par
      \ufc_meta_use:n {year}\par
    \endgroup
    \clearpage
  }

\NewDocumentCommand \ufcPrintTitlePage { O{} }
  { \ufc_title_page: }

% NBR 14724:2024: the catalog-data verso is physical but neither counted nor numbered.
\cs_new_protected:Npn \ufc_catalog_card:n #1
  {
    \bool_if:NT \g_ufc_catalog_card_bool
      {
        \int_set:Nn \l_ufc_catalog_page_int { \value{page} }
        \bool_set_false:N \l_ufc_catalog_included_bool
        \IfFileExists{#1.pdf}
          {
            \includepdf[pages=1,pagecommand={\thispagestyle{empty}}]{#1.pdf}
            \bool_set_true:N \l_ufc_catalog_included_bool
          }
          {
            \IfFileExists{#1}
              {
                \includepdf[pages=1,pagecommand={\thispagestyle{empty}}]{#1}
                \bool_set_true:N \l_ufc_catalog_included_bool
              }
              { \ClassWarningNoLine{abntexto-ufc}{Catalog~card~file~'#1'~not~found} }
          }
        \bool_if:NT \l_ufc_catalog_included_bool
          {
            \setcounter{page}{\int_use:N \l_ufc_catalog_page_int}
            \str_if_eq:VnT \g_ufc_print_mode_tl {double-sided}
              { \ufcRegisterUncountedPhysicalPage }
          }
      }
  }

\NewDocumentCommand \ufcPrintCatalogCard { m }
  { \ufc_catalog_card:n {#1} }

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/academic-works ---
% --- BEGIN inlined module: abntexto-ufc/articles ---

% Scientific-article presentation is implemented incrementally from the
% retained authority contract in docs/ARTICLE-NORMATIVE-CONTRACT.md.
% Required front-block elements, optional foreign elements and the article-only
% body typography route are available without changing non-article profiles.

\ExplSyntaxOn

\cs_new_protected:Npn \ufc_article_require_profile:
  {
    \str_if_eq:VnF \g_ufc_document_type_tl {scientific-article}
      {
        \ClassError{abntexto-ufc}
          {Scientific-article~command~used~outside~the~scientific-article~profile}
          {Set~type=scientific-article~before~using~article-specific~commands.}
      }
  }

\cs_new_protected:Npn \ufc_article_require_meta:n #1
  {
    \ufc_meta_if_blank:nT {#1}
      {
        \ClassError{abntexto-ufc}
          {Required~scientific-article~metadata~'#1'~is~missing}
          {Provide~the~required~value~through~\string\ufcsetup.}
      }
  }

\cs_new_protected:Npn \ufc_article_require_summary:n #1
  {
    \tl_if_blank:nT {#1}
      {
        \ClassError{abntexto-ufc}
          {Required~scientific-article~primary~summary~is~missing}
          {Provide~the~primary-language~summary~to~\string\ufcPrintArticleFrontMatter.}
      }
  }

\cs_new_protected:Npn \ufc_article_primary_title:
  {
    \begin{center}
      \begingroup
        \normalsize\singlesp\bfseries
        \ufc_title_text:\par
      \endgroup
    \end{center}
  }

\cs_new_protected:Npn \ufc_article_author:
  {
    \begingroup
      \raggedleft
      \ufc_meta_use:n {author}%
      \footnote{\ufc_meta_use:n {article-author-note}}\par
    \endgroup
  }

\cs_new_protected:Npn \ufc_article_dates:
  {
    \par\noindent
    Submetido~em:~\ufc_meta_use:n {submission-date}.\space
    Aprovado~em:~\ufc_meta_use:n {approval-date}.\par
  }

\cs_new_protected:Npn \ufc_article_primary_summary:n #1
  {
    \par\vspace{\baselineskip}
    \begingroup
      \singlesp
      \setlength{\parindent}{0pt}
      \justifying
      \noindent\textbf{Resumo:}\space #1\par
    \endgroup
  }

% Foreign title and summary are independently optional. Their rendering here
% is intentionally minimal: optionality and routing are proven without
% inventing typography requirements absent from the retained rules.
\cs_new_protected:Npn \ufc_article_foreign_title:n #1
  {
    \tl_if_blank:nF {#1}
      {
        \par\vspace{\baselineskip}
        \begingroup
          \noindent #1\par
        \endgroup
      }
  }

\cs_new_protected:Npn \ufc_article_foreign_summary:n #1
  {
    \tl_if_blank:nF {#1}
      {
        \par\vspace{\baselineskip}
        \begingroup
          \setlength{\parindent}{0pt}
          \justifying
          \noindent #1\par
        \endgroup
      }
  }

% The first numbered section enters \textual and restores the shared
% academic-work spacing and indentation. Use the supported \singlesp route
% after the required front block and after every textual transition. The
% profile guard keeps non-article behavior unchanged.
\cs_new_protected:Npn \ufc_article_apply_body_typography:
  {
    \str_if_eq:VnT \g_ufc_document_type_tl {scientific-article}
      {
        \normalsize
        \singlesp
        \setlength{\parindent}{2cm}
        \setlength{\parskip}{0pt}
        \justifying
      }
  }

\AddToHook{cmd/textual/after}{\ufc_article_apply_body_typography:}

\NewDocumentCommand \ufcPrintArticleFrontMatter { +m }
  {
    \ufc_article_require_profile:
    \ufc_article_require_meta:n {title}
    \ufc_article_require_meta:n {author}
    \ufc_article_require_meta:n {article-author-note}
    \ufc_article_require_meta:n {submission-date}
    \ufc_article_require_meta:n {approval-date}
    \ufc_article_require_summary:n {#1}
    \ufc_article_primary_title:
    \ufc_article_author:
    \ufc_article_dates:
    \ufc_article_primary_summary:n {#1}
    \ufc_article_apply_body_typography:
  }

\NewDocumentCommand \ufcPrintArticleForeignElements { +m +m }
  {
    \ufc_article_require_profile:
    \ufc_article_foreign_title:n {#1}
    \ufc_article_foreign_summary:n {#2}
  }

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/articles ---
% --- BEGIN inlined module: abntexto-ufc/research-projects ---

% NBR 15287:2025 + compatible UFC institutional requirements.
% Full normative mapping: docs/NORMATIVE-BASE.md.

\ExplSyntaxOn

\cs_new_protected:Npn \ufc_project_entity_line:
  {
    \ufc_meta_if_blank:nTF {submission-entity}
      { \MakeUppercase{\ufc_meta_use:n {institution}}\par }
      { \MakeUppercase{\ufc_meta_use:n {submission-entity}}\par }
  }

\cs_new_protected:Npn \ufc_project_title_extras:
  {
    \ufc_meta_if_blank:nF {title-variant}
      { \MakeUppercase{\ufc_meta_use:n {title-variant}}\par }
    \ufc_meta_if_blank:nF {volume}
      { VOLUME~\ufc_meta_use:n {volume}\par }
  }

\cs_new_protected:Npn \ufc_project_cover:
  {
    \clearpage
    \thispagestyle{empty}
    \begingroup
      \centering\bfseries
      \ufc_print_coat_of_arms:
      \ufc_project_entity_line:
      \ufc_optional_upper_line:n {center}
      \ufc_optional_upper_line:n {department}
      \ufc_optional_upper_line:n {project-program}
      \vspace{2cm}
      \ufc_print_visible_author:
      \vfill
      \ufc_title_text:\par
      \ufc_project_title_extras:
      \vfill
      \MakeUppercase{\ufc_meta_use:n {location}}\par
      \ufc_meta_use:n {year}\par
    \endgroup
    \clearpage
    \setcounter{page}{1}
  }

\cs_new_protected:Npn \ufc_project_title_page:
  {
    \clearpage
    \thispagestyle{empty}
    \begingroup
      \centering
      \ufc_print_visible_author:
      \vspace{4cm}
      \bfseries\ufc_title_text:\par
      \ufc_project_title_extras:
      \normalfont
      \vspace{4cm}
      \noindent\hspace*{8cm}%
      \begin{minipage}{\dimexpr\textwidth-8cm\relax}
        \singlesp
        \ufc_nature_text:
        \ufc_print_advisors:
      \end{minipage}\par
      \vfill
      \MakeUppercase{\ufc_meta_use:n {location}}\par
      \ufc_meta_use:n {year}\par
    \endgroup
    \clearpage
  }

\RenewDocumentCommand \ufcPrintCover { }
  {
    \str_if_eq:VnF \g_ufc_cover_mode_tl {false}
      {
        \ufcIfProjectTF
          { \ufc_project_cover: }
          { \ufc_cover: }
      }
  }

\RenewDocumentCommand \ufcPrintTitlePage { O{} }
  {
    \ufcIfProjectTF
      { \ufc_project_title_page: }
      { \ufc_title_page: }
  }

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/research-projects ---
% --- BEGIN inlined module: abntexto-ufc/objects ---

% Keep upper object identification/title within the real object width at body size.
\makeatletter
\providecommand{\ufcObjectLegendHook}{}
\def\printlegendbox{\hfil\vtop{%
  \leavevmode\targetlegend
  \setbox0=\hbox{{\legendlabel}\savedlegend}%
  \dimen@=\legendmaxwidth\relax
  \ifdim\savedplacewidth<\dimen@
    \dimen@=\savedplacewidth
  \fi
  \ifdim\wd0>\dimen@
    \hsize=\dimen@
  \else
    \hsize=\wd0
  \fi
  \normalsize\singlesp
  \ufcObjectLegendHook
  \hangfrom{\legendlabel}\savedlegend\strut
}}
\makeatother

\ExplSyntaxOn

% Native abntexto legend areas used by the UFC profile.
\cs_if_exist:cF { IDgrafico }
  { \definelegendplace{grafico}{Gráfico}{logr} }
\cs_if_exist:cF { IDcode }
  { \definelegendplace{code}{Código}{loc} }
\cs_if_exist:cF { IDalgorithm }
  { \definelegendplace{algorithm}{Algoritmo}{loa} }

% tabularray-abnt defines quadro itself when loaded with abntexto.
\cs_new_protected:Npn \ufc_objects_setup_quadro:
  {
    \cs_if_exist:cF { IDquadro }
      { \definelegendplace{quadro}{Quadro}{loq} }
  }
\AtEndPreamble{\ufc_objects_setup_quadro:}

% The unified illustration list follows the same two-argument contract as every
% abntexto l@<extension> renderer: entry payload followed by page.
% Standard LaTeX captions may contribute \numberline entries instead of
% abntexto label-box entries. Initialize LaTeX's number-line width locally so
% both payload forms are rendered within the UFC illustration-label column.
\cs_new_protected:Npn \ufc_objects_set_illustration_renderer:
  {
    \cs_gset_protected:cpn { l@loii } ##1##2
      {
        \group_begin:
          \exp_args:Nc \dim_set:Nn { @tempdima } { \loilabelwidth }
          \extline{0pt}\loilabelwidth\loiifont{##1}{##2}
        \group_end:
      }
  }
\ufc_objects_set_illustration_renderer:

% UFC lists use uppercase headings, but their entries preserve the title casing.
\cs_new_protected:Npn \ufc_objects_setup_list_fonts:
  {
    \cs_gset:Npn \loiifont { \normalfont }

    \cs_if_exist:NT \lofextfont  { \cs_gset:Npn \lofextfont  { \normalfont } }
    \cs_if_exist:NT \logrextfont { \cs_gset:Npn \logrextfont { \normalfont } }
    \cs_if_exist:NT \loqextfont  { \cs_gset:Npn \loqextfont  { \normalfont } }
    \cs_if_exist:NT \lotextfont  { \cs_gset:Npn \lotextfont  { \normalfont } }
    \cs_if_exist:NT \locextfont  { \cs_gset:Npn \locextfont  { \normalfont } }
    \cs_if_exist:NT \loaextfont  { \cs_gset:Npn \loaextfont  { \normalfont } }

    \cs_if_exist:NT \lofifont  { \cs_gset:Npn \lofifont  { \normalfont } }
    \cs_if_exist:NT \logrifont { \cs_gset:Npn \logrifont { \normalfont } }
    \cs_if_exist:NT \loqifont  { \cs_gset:Npn \loqifont  { \normalfont } }
    \cs_if_exist:NT \lotifont  { \cs_gset:Npn \lotifont  { \normalfont } }
    \cs_if_exist:NT \locifont  { \cs_gset:Npn \locifont  { \normalfont } }
    \cs_if_exist:NT \loaifont  { \cs_gset:Npn \loaifont  { \normalfont } }

    \ufc_objects_set_illustration_renderer:
  }
\AddToHook{begindocument/end}{\ufc_objects_setup_list_fonts:}

% Late package initialization can still replace custom list-entry handlers after
% begin-document hooks. Reassert the renderer at the last possible point: just
% before LaTeX reads the populated .loi file.
\cs_new_protected:Npn \ufc_objects_start_illustration_toc:
  {
    \ufc_objects_set_illustration_renderer:
    \ufcstarttoc{loi}
  }

\cs_new_protected:Npn \ufc_objects_print_illustration_list:
  {
    \ufc_pretextual_list:nn
      {Lista~de~Ilustrações}
      {\ufc_objects_start_illustration_toc:}
  }

\RenewDocumentCommand \ufcPrintListOfIllustrations { }
  { \ufc_objects_print_illustration_list: }

\NewDocumentCommand \ufcSource { m }
  { \src{#1} }

\NewDocumentCommand \ufcNote { m }
  { \abntextonote{#1} }

\NewDocumentEnvironment { ufcobject } { O{\placepos} }
  { \begin{place}[#1] }
  { \end{place} }

\NewDocumentCommand \ufcPrintListOfCharts { }
  { \ufc_pretextual_list:nn {Lista~de~Gráficos} {\ufcstarttoc{logr}} }

\NewDocumentCommand \ufcPrintListOfCodeListings { }
  { \ufc_pretextual_list:nn {Lista~de~Códigos} {\ufcstarttoc{loc}} }

\NewDocumentCommand \ufcPrintListOfAlgorithms { }
  { \ufc_pretextual_list:nn {Lista~de~Algoritmos} {\ufcstarttoc{loa}} }

\cs_new_protected:Npn \ufc_listing_apply_number_margins:
  {
    \cs_if_eq:ccF { lst@PlaceNumber } { @empty }
      { \lstset{xleftmargin=3em,xrightmargin=3em} }
  }

\cs_new_protected:Npn \ufc_objects_setup_listings:
  {
    \lstnewenvironment{ufclisting}[1][\placepos]
      {
        \let\medskipamount\smallskipamount
        \ufc_listing_apply_number_margins:
        \place[##1]\vbox\bgroup
      }
      {
        \egroup\endplace
      }

    \NewDocumentCommand \ufcInputListing { O{} m }
      { \lstinputlisting[##1]{##2} }
  }

\cs_new_protected:Npn \ufc_objects_setup_minted:
  {
    \NewDocumentCommand \ufcInputMinted { O{\placepos} O{} m m }
      {
        \place[##1]\vbox\bgroup
          \inputminted[##2]{##3}{##4}
        \egroup\endplace
      }
  }

\cs_new_protected:Npn \ufc_algorithm_begin:n #1
  {
    \int_compare:nNnTF {#1} = {0}
      { \begin{algorithmic} }
      {
        \int_compare:nNnTF {#1} > {0}
          {
            \hbox to \linewidth\bgroup
              \hfil
              \vbox\bgroup
                \hsize=\dimexpr\linewidth-6em\relax
                \linewidth=\hsize
                \begin{algorithmic}[#1]
          }
          {
            \ClassError{abntexto-ufc}
              {Invalid~algorithm~line~numbering~frequency~'#1'}
              {Use~zero~for~no~line~numbers~or~a~positive~integer.}
          }
      }
  }

\cs_new_protected:Npn \ufc_algorithm_end:n #1
  {
    \int_compare:nNnTF {#1} = {0}
      { \end{algorithmic} }
      {
        \int_compare:nNnT {#1} > {0}
          {
            \end{algorithmic}
              \egroup
              \hfil
            \egroup
          }
      }
  }

\cs_new_protected:Npn \ufc_objects_setup_algorithms:
  {
    \NewDocumentEnvironment { ufcalgorithm } { O{\placepos} O{1} }
      {
        \place[##1]\vbox\bgroup
        \normalsize
        \ufc_algorithm_begin:n {##2}
      }
      {
        \ufc_algorithm_end:n {##2}
        \egroup\endplace
      }
  }

\cs_new_protected:Npn \ufc_objects_setup_optional:
  {
    \str_case:Vn \g_ufc_code_module_tl
      {
        { listings } { \ufc_objects_setup_listings: }
        { minted }   { \ufc_objects_setup_minted: }
      }

    \str_if_eq:VnT \g_ufc_algorithm_module_tl { algpseudocodex }
      { \ufc_objects_setup_algorithms: }
  }

\AtBeginDocument{\ufc_objects_setup_optional:}

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/objects ---
% --- BEGIN inlined module: abntexto-ufc/integrations/abntexto ---

% ABNTexto 1.1 writes legend entries with \addcontentsline, while older
% development builds route them through \addtoext. Normalize both paths here.

\makeatletter

\AddToHook{begindocument/end}{%
  \ifcsname ufc@baseaddtoext\endcsname
    \let\addtoext\ufc@baseaddtoext
  \fi

  % Unified illustration entries already contain their native typed label box.
  \def\l@loii{\extline{0pt}{0pt}{\maintocfont}}%

  \let\ufc@baseaddcontentsline\addcontentsline
  \def\addcontentsline#1#2#3{%
    \ufc@baseaddcontentsline{#1}{#2}{#3}%
    \edef\ufc@ext{#1}%
    \def\ufc@lof{lof}%
    \def\ufc@logr{logr}%
    \def\ufc@loq{loq}%
    \ifx\ufc@ext\ufc@lof
      \ufc@baseaddcontentsline{loi}{loii}{#3}%
    \fi
    \ifx\ufc@ext\ufc@logr
      \ufc@baseaddcontentsline{loi}{loii}{#3}%
    \fi
    \ifx\ufc@ext\ufc@loq
      \ufc@baseaddcontentsline{loi}{loii}{#3}%
    \fi
  }%
}

\makeatother

% LaTeX 2026 loads the new block implementation whenever \DocumentMetadata is
% present. Avoid enumitem-only description keys so PDF/A documents use the same
% public UFC list API without depending on the incomplete enumitem emulation.
% Keep labels on the same baseline as their definitions and left-align the
% first column at the text-area margin. The definition column keeps the public
% 3 cm offset (label column plus 0.3 cm separation).
\RenewDocumentEnvironment{ufcdefinitionlist}{O{3cm}}
  {%
    \begin{list}{}{%
      \setlength{\leftmargin}{#1}%
      \setlength{\labelwidth}{\dimexpr#1-.3cm\relax}%
      \setlength{\labelsep}{.3cm}%
      \setlength{\rightmargin}{0pt}%
      \setlength{\itemsep}{0pt}%
      \setlength{\parsep}{0pt}%
      \setlength{\topsep}{0pt}%
      \setlength{\partopsep}{0pt}%
      \setlength{\listparindent}{0pt}%
      \renewcommand*\makelabel[1]{%
        \makebox[\labelwidth][l]{\normalfont ##1}%
      }%
    }%
  }
  {\end{list}}
% --- END inlined module: abntexto-ufc/integrations/abntexto ---
% --- BEGIN inlined module: abntexto-ufc/bibliography ---

\RequirePackage[
  backend=biber,
  style=abnt,
  sorting=nyt,
  sortcites=true,
  maxcitenames=3,
  mincitenames=1,
  maxbibnames=99,
  accite=false,
  extradate=true
]{biblatex}

\ExplSyntaxOn

\seq_new:N \l_ufc_bib_title_words_seq
\tl_new:N \l_ufc_bib_first_word_tl
\tl_new:N \l_ufc_bib_second_word_tl
\clist_const:Nn \c_ufc_bib_leading_words_clist
  { a, o, as, os, um, uma, uns, umas, e, de, da, do, das, dos, em, no, na, nos, nas, por, com, sem, sob, se, que }

\cs_new_protected:Npn \ufc_bib_clean_word:N #1
  { \regex_replace_once:nnN { [\.,;:] \Z } { } #1 }

\cs_new_protected:Npn \ufc_bib_title_cite:n #1
  {
    \seq_set_split:Nnn \l_ufc_bib_title_words_seq { ~ } {#1}
    \tl_set:Nx \l_ufc_bib_first_word_tl
      { \seq_item:Nn \l_ufc_bib_title_words_seq {1} }
    \ufc_bib_clean_word:N \l_ufc_bib_first_word_tl
    \tl_use:N \l_ufc_bib_first_word_tl

    \int_compare:nNnT { \seq_count:N \l_ufc_bib_title_words_seq } > {1}
      {
        \tl_set:Nx \l_tmpa_tl
          { \tl_lower_case:n { \tl_use:N \l_ufc_bib_first_word_tl } }
        \exp_args:NNV \clist_if_in:NnT
          \c_ufc_bib_leading_words_clist \l_tmpa_tl
          {
            \tl_set:Nx \l_ufc_bib_second_word_tl
              { \seq_item:Nn \l_ufc_bib_title_words_seq {2} }
            \ufc_bib_clean_word:N \l_ufc_bib_second_word_tl
            \c_space_tl \tl_use:N \l_ufc_bib_second_word_tl
          }
        \addspace[\textellipsis]\isdot
      }
  }

% NBR 10520:2023 uses normal capitalization in citations.
\DeclareFieldFormat{uppercasecite}{#1}
\DeclareFieldFormat{firstword}{\normalfont\ufc_bib_title_cite:n {#1}}

% Restrict given-name disambiguation to equal surname and publication year.
\prop_new:N \g_ufc_bib_key_hashes_prop
\prop_new:N \g_ufc_bib_id_initial_prop
\prop_new:N \g_ufc_bib_id_level_prop
\clist_new:N \l_ufc_bib_hashes_clist
\tl_new:N \l_ufc_bib_key_tl
\tl_new:N \l_ufc_bib_id_tl
\tl_new:N \l_ufc_bib_hash_tl
\tl_new:N \l_ufc_bib_initial_tl
\tl_new:N \l_ufc_bib_level_tl

\cs_new_protected:Npn \ufc_bib_make_key:nn #1#2
  {
    \tl_set:Nx \l_ufc_bib_key_tl
      { \therefsection | \tl_lower_case:n {#1} | #2 }
  }

\cs_new_protected:Npn \ufc_bib_make_id:n #1
  { \tl_set:Nx \l_ufc_bib_id_tl { \l_ufc_bib_key_tl | #1 } }

\cs_new_protected:Npn \ufc_bib_register_author:nnnn #1#2#3#4
  {
    \ufc_bib_make_key:nn {#1} {#3}
    \tl_set:Nx \l_ufc_bib_hash_tl {#4}
    \tl_set:Nx \l_ufc_bib_initial_tl {#2}
    \ufc_bib_make_id:n { \l_ufc_bib_hash_tl }

    \prop_get:NVNTF
      \g_ufc_bib_key_hashes_prop \l_ufc_bib_key_tl \l_tmpa_tl
      {
        \clist_set:NV \l_ufc_bib_hashes_clist \l_tmpa_tl
        \clist_if_in:NVF \l_ufc_bib_hashes_clist \l_ufc_bib_hash_tl
          {
            \tl_set:Nn \l_ufc_bib_level_tl {1}
            \clist_map_inline:Nn \l_ufc_bib_hashes_clist
              {
                \tl_set:Nx \l_tmpd_tl { \l_ufc_bib_key_tl | ##1 }
                \prop_get:NVN \g_ufc_bib_id_level_prop \l_tmpd_tl \l_tmpb_tl
                \int_compare:nNnT { \l_tmpb_tl } < {1}
                  { \prop_gput:NVn \g_ufc_bib_id_level_prop \l_tmpd_tl {1} }
                \prop_get:NVN \g_ufc_bib_id_initial_prop \l_tmpd_tl \l_tmpc_tl
                \tl_if_eq:NNT \l_tmpc_tl \l_ufc_bib_initial_tl
                  {
                    \prop_gput:NVn \g_ufc_bib_id_level_prop \l_tmpd_tl {2}
                    \tl_set:Nn \l_ufc_bib_level_tl {2}
                  }
              }
            \prop_gput:NVV
              \g_ufc_bib_id_level_prop \l_ufc_bib_id_tl \l_ufc_bib_level_tl
            \prop_gput:NVV
              \g_ufc_bib_id_initial_prop \l_ufc_bib_id_tl \l_ufc_bib_initial_tl
            \clist_put_right:NV \l_ufc_bib_hashes_clist \l_ufc_bib_hash_tl
            \prop_gput:NVx
              \g_ufc_bib_key_hashes_prop \l_ufc_bib_key_tl
              { \clist_use:Nn \l_ufc_bib_hashes_clist {,} }
          }
      }
      {
        \prop_gput:NVV
          \g_ufc_bib_key_hashes_prop \l_ufc_bib_key_tl \l_ufc_bib_hash_tl
        \prop_gput:NVV
          \g_ufc_bib_id_initial_prop \l_ufc_bib_id_tl \l_ufc_bib_initial_tl
        \prop_gput:NVn \g_ufc_bib_id_level_prop \l_ufc_bib_id_tl {0}
      }
  }

\DeclareNameFormat{ufccollectauthor}
  {
    \int_compare:nNnT { \value{listtotal} } = {1}
      {
        \ufc_bib_register_author:nnnn
          { \namepartfamily }
          { \namepartgiveni }
          { \thefield{year} }
          { \thefield{fullhash} }
      }
  }

\ExplSyntaxOff
\AtDataInput{%
  \begingroup
    \setbox0=\hbox{\printnames[ufccollectauthor]{author}}%
  \endgroup
}
\ExplSyntaxOn

\cs_new_protected:Npn \ufc_bib_current_level:
  {
    \ufc_bib_make_key:nn { \namepartfamily } { \thefield{year} }
    \ufc_bib_make_id:n { \thefield{fullhash} }
    \prop_get:NVNF \g_ufc_bib_id_level_prop \l_ufc_bib_id_tl \l_tmpa_tl
      { \tl_set:Nn \l_tmpa_tl {-1} }
  }

\cs_new_protected:Npn \ufc_bib_default_label_name:
  {
    \int_case:nnF { \value{uniquename} }
      {
        {0}
          { \usebibmacro{name:family}
              {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
        {1}
          { \usebibmacro{name:family-given}
              {\namepartfamily}{\namepartgiveni}{\namepartprefix}{\namepartsuffixi} }
        {2}
          { \usebibmacro{name:family-given}
              {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
      }
      { \usebibmacro{name:family}
          {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
  }

\cs_new_protected:Npn \ufc_bib_default_text_label_name:
  {
    \int_case:nnF { \value{uniquename} }
      {
        {0}
          { \usebibmacro{name:family}
              {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
        {1}
          { \usebibmacro{name:given-family}
              {\namepartfamily}{\namepartgiveni}{\namepartprefix}{\namepartsuffix} }
        {2}
          { \usebibmacro{name:given-family}
              {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
      }
      { \usebibmacro{name:family}
          {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
  }

\DeclareNameFormat{labelname}
  {
    \int_compare:nNnTF { \value{listtotal} } = {1}
      {
        \ufc_bib_current_level:
        \int_case:nnF { \l_tmpa_tl }
          {
            {-1} { \ufc_bib_default_label_name: }
            {0}
              { \usebibmacro{name:family}
                  {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
            {1}
              { \usebibmacro{name:family-given}
                  {\namepartfamily}{\namepartgiveni}{\namepartprefix}{\namepartsuffixi} }
            {2}
              { \usebibmacro{name:family-given}
                  {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
          }
          { \ufc_bib_default_label_name: }
      }
      { \ufc_bib_default_label_name: }
    \usebibmacro{name:andothers}
  }

\DeclareNameFormat{textlabelname}
  {
    \int_compare:nNnTF { \value{listtotal} } = {1}
      {
        \ufc_bib_current_level:
        \int_case:nnF { \l_tmpa_tl }
          {
            {-1} { \ufc_bib_default_text_label_name: }
            {0}
              { \usebibmacro{name:family}
                  {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
            {1}
              { \usebibmacro{name:given-family}
                  {\namepartfamily}{\namepartgiveni}{\namepartprefix}{\namepartsuffix} }
            {2}
              { \usebibmacro{name:given-family}
                  {\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix} }
          }
          { \ufc_bib_default_text_label_name: }
      }
      { \ufc_bib_default_text_label_name: }
    \usebibmacro{name:andothers}
  }

\ExplSyntaxOff

\makeatletter

% Keep complete years in same-author citations.
\AtEveryCitekey{\global\let\cbx@lastyear\@undefined}

% Backport the current biblatex-abnt apud formatting.
\renewcommand*{\addapud}{%
  \renewcommand*{\compcitedelim}{%
    \ifnumequal{\value{multicitecount}}{\value{multicitetotal}}%
      {\space\mkbibitalic{\bibstring{apud}}}%
      {\addsemicolon}%
    \space}%
  \renewcommand*{\multicitedelim}{%
    \ifnumequal{\value{multicitecount}}{\value{multicitetotal}}%
      {\space\mkbibitalic{\bibstring{apud}}}%
      {\addsemicolon}%
    \space}%
  \renewcommand*{\textcitedelim}{%
    \ifnumequal{\value{multicitecount}}{\value{multicitetotal}}%
      {\addspace\mkbibitalic{\bibstring{apud}}}%
      {\addsemicolon}%
    \space}%
}

\xpatchcmd{\@apud}
  {\isdot\addspace\bibstring{apud}\addspace}
  {\isdot\addspace\mkbibitalic{\bibstring{apud}}\addspace}
  {}{}

\RenewDocumentCommand{\textapud}{o o m o o m}{%
  \citelastname{#3}\addspace%
  \mkbibparens{%
    \IfNoValueTF{#2}{%
      \IfNoValueTF{#1}{%
        \citeyearorsh*{#3}%
      }{%
        \citeyearorsh*[#1]{#3}%
      }%
    }{%
      \citeyearorsh*[#1][#2]{#3}%
    }\addspace%
    \IfNoValueTF{#5}{%
      \IfNoValueTF{#4}{%
        \plaincite[\mkbibitalic{\blx@imc@bibxstring{apud}}][]{#6}%
      }{%
        \plaincite[\mkbibitalic{\blx@imc@bibxstring{apud}}][#4]{#6}%
      }%
    }{%
      \cite[\mkbibitalic{\blx@imc@bibxstring{apud}} #4][#5]{#6}%
    }%
  }%
}

\makeatother

\ExplSyntaxOn

\NewDocumentCommand \ufcAddBibliographyResource { m }
  { \addbibresource{#1} }

\cs_new_protected:Npn \ufc_print_references:
  {
    \ufc_primary_section_break:
    \cs_if_exist:NT \phantomsection { \phantomsection }
    \addcontentsline{toc}{section}{Referências}
    \begingroup
      \parindent=0pt
      \begin{center}
        \bfseries REFERÊNCIAS\par
      \end{center}
      \vspace{\baselineskip}
      \singlesp
      \raggedright
      \setlength{\bibitemsep}{\baselineskip}
      \printbibliography[heading=none]
    \endgroup
  }

\NewDocumentCommand \ufcPrintReferences { }
  { \ufc_print_references: }

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/bibliography ---
% --- BEGIN inlined module: abntexto-ufc/standards/nbr6023-2025 ---

% Temporary compatibility layer for rules not yet covered by the released
% biblatex-abnt. Normative baseline: docs/NORMATIVE-BASE.md.

% NBR 6023:2025: unknown publication data are omitted for documents with URL.
\renewbibmacro*{publisher}{%
  \iflistundef{publisher}
    {\ifboolexpr{
       test {\iftoggle{nosn}}
       or
       not test {\iffieldundef{url}}
     }
       {}
       {\printtext[brackets]{\mkbibemph{\bibstring{sinenomine}}}}}
    {\printlist{publisher}}%
}

\renewbibmacro*{location}{%
  \iflistundef{location}
    {\ifboolexpr{
       test {\iftoggle{nosl}}
       or
       not test {\iffieldundef{url}}
     }
       {}
       {\printtext[brackets]{\mkbibemph{\bibstring{sineloco}}}}}
    {\printlist{location}}%
}

% NBR 6023:2025: event city is optional.
\renewbibmacro*{venue}{\printfield{venue}}

\renewbibmacro*{publisher+location+date}{%
  \ifboolexpr{
    test {\iflistundef{publisher}}
    and
    test {\iflistundef{location}}
    and
    not test {\iftoggle{nosl}}
    and
    not test {\iftoggle{nosn}}
    and
    test {\iffieldundef{url}}
  }{%
    \printtext[brackets]{\mkbibemph{\bibstring{sineloco}}%
    \setunit{\addcolon\addnbspace}%
    \mkbibemph{\bibstring{sinenomine}}}%
  }{%
    \ifboolexpr{
      test {\ifnameundef{author}}
      and
      test {\ifnameundef{editor}}
      and
      test {\iflistundef{publisher}}
      and
      not test {\iflistundef{organization}}
    }{%
      \usebibmacro{location}%
    }{%
      \usebibmacro{location}%
      \setunit*{\addcolon\addspace}%
      \usebibmacro{publisher}%
    }%
  }%
  \setunit*{\addcomma\addspace}%
  \usebibmacro{date}%
  \newunit%
}

\renewbibmacro*{publisher+location+issue+date}{%
  \ifboolexpr{
    test {\iflistundef{publisher}}
    and
    test {\iflistundef{location}}
    and
    not test {\iftoggle{nosl}}
    and
    not test {\iftoggle{nosn}}
    and
    test {\iffieldundef{url}}
  }{%
    \printtext[brackets]{\mkbibemph{\bibstring{sineloco}}%
    \setunit{\addcolon\addnbspace}%
    \mkbibemph{\bibstring{sinenomine}}}%
  }{%
    \ifboolexpr{
      test {\ifnameundef{author}}
      and
      test {\ifnameundef{editor}}
      and
      test {\iflistundef{publisher}}
      and
      not test {\iflistundef{organization}}
    }{%
      \usebibmacro{location}%
    }{%
      \usebibmacro{location}%
      \setunit*{\addcolon\addspace}%
      \usebibmacro{publisher}%
    }%
  }%
  \setunit*{\addcomma\addspace}%
  \printfield[number]{issue}%
  \setunit*{\addcomma\addspace}%
  \usebibmacro{date}%
  \newunit%
}

% NBR 6023:2025: jurisprudence may include the judgment date.
\newbibmacro*{ufc:judgmentdate}{%
  \iffieldundef{eventyear}
    {}
    {\printtext{julgado em\addspace}%
     \printeventdate}%
}

\DeclareBibliographyDriver{jurisdiction}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/organization}%
  \setunit{\labelnamepunct}%
  \usebibmacro{title}%
  \setunit{\addcomma\addspace}%
  \usebibmacro{ufc:judgmentdate}%
  \newunit
  \newblock
  \printlist{language}%
  \newunit
  \newblock
  \usebibmacro{byauthor}%
  \newunit
  \newblock
  \usebibmacro{byeditor+others}\newunit
  \usebibmacro{bytranslator+others}%
  \newunit
  \newblock
  \printfield{version}%
  \newunit
  \newblock
  \iffieldundef{relatedtype}{}{\bibstring{\strfield{relatedtype}}}%
  \setunit*{\addcolon\addspace}%
  \newblock
  \usebibmacro{journal+section}%
  \setunit*{\addcomma\addspace}%
  \printlist{publisher}%
  \setunit*{\addcomma\addspace}%
  \printlist{location}%
  \setunit*{\addcomma\addspace}%
  \usebibmacro{volume+number+eid}%
  \setunit{\addcomma\addspace}%
  \printfield{pages}%
  \setunit*{\addcomma\addspace}%
  \printfield{pagetotal}%
  \setunit{\addcomma\addspace}%
  \usebibmacro{issue+date}%
  \newunit
  \newblock
  \printfield{note}%
  \printunit{\addperiod\addspace}%
  \newblock
  \iftoggle{bbx:isbn}{\printfield{issn}}{}%
  \newunit
  \newblock
  \usebibmacro{doi+eprint+url}%
  \newunit
  \newblock
  \usebibmacro{addendum+pubstate}%
  \setunit{\bibpagerefpunct}%
  \newblock
  \usebibmacro{pageref}%
  \setunit*{\addperiod\addspace}%
  \newunit
  \newblock
  \iftoggle{bbx:related}
    {\usebibmacro{related:init}\usebibmacro{related}}
    {}%
  \usebibmacro{finentry}%
}
% --- END inlined module: abntexto-ufc/standards/nbr6023-2025 ---
% --- BEGIN inlined module: abntexto-ufc/backmatter ---

% Normative mapping: docs/NORMATIVE-BASE.md.
% References are implemented in bibliography.def. This module owns the optional
% glossary and index presentation; appendices and annexes use abntexto public APIs.

\ExplSyntaxOn

\cs_new_protected:Npn \ufc_posttextual_heading:n #1
  {
    \ufc_primary_section_break:
    \cs_if_exist:NT \phantomsection { \phantomsection }
    \addcontentsline{toc}{section}{\MakeUppercase{#1}}
    \begin{center}
      \bfseries\MakeUppercase{#1}\par
    \end{center}
    \vspace{\baselineskip}
  }

\cs_new_protected:Npn \ufc_setup_glossary_module:
  {
    \newglossarystyle{ufc}
      {
        \setglossarystyle{list}
        \renewcommand*{\glossentry}[2]
          {
            \item[\glstarget{####1}{\glossentryname{####1}:}]
            \glossentrydesc{####1}.%
          }
        \renewcommand*{\subglossentry}[3]
          {
            \item[\glstarget{####2}{\glossentryname{####2}:}]
            \glossentrydesc{####2}.%
          }
      }
    \setglossarystyle{ufc}
    \glstocfalse
  }

\NewDocumentCommand \ufcPrintGlossary { }
  {
    \cs_if_exist:NTF \printglossary
      {
        \ufc_posttextual_heading:n {Glossário}
        \begingroup
          \setglossarysection{none}
          \glstocfalse
          \onehalfsp
          \printglossary[style=ufc,title={}]
        \endgroup
      }
      {
        \ClassWarningNoLine{abntexto-ufc}
          {Glossary~requested~without~glossary=glossaries}
      }
  }

\cs_new_protected:Npn \ufc_index_heading:n #1
  { \ufc_posttextual_heading:n {#1} }

\cs_new_protected:Npn \ufc_setup_index_module:
  { \indexsetup{level=\ufc_index_heading:n} }

\NewDocumentCommand \ufcPrintIndex { }
  {
    \cs_if_exist:NTF \printindex
      {
        \begingroup
          \onehalfsp
          \printindex
        \endgroup
      }
      {
        \ClassWarningNoLine{abntexto-ufc}
          {Index~requested~without~index=imakeidx}
      }
  }

\ExplSyntaxOff
% --- END inlined module: abntexto-ufc/backmatter ---

\endinput
