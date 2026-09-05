%%
%% This is file `unigrazpub.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% unigrazpub.dtx  (with options: `unigrazpub.cls,class')
%%  UniGrazPub – LaTeX Templates for Graz University Library Publishing
%%  ----------------------------------------------------------------------------
%% 
%%  Copyright (C) 2022 by Marei Peischl <marei@peitex.de>
%% 
%%  This work may be distributed and/or modified under the
%%  conditions of the LaTeX Project Public License, either version 1.3c
%%  of this license or (at your option) any later version.
%%  The latest version of this license is in
%%  http://www.latex-project.org/lppl.txt
%%  and version 1.3c or later is part of all distributions of LaTeX
%%  version 2008/05/04 or later.
%% 
%%  This work has the LPPL maintenance status `maintained'.
%% 
%%  The Current Maintainers of this work are
%%  Marei Peischl <unigrazpub@peitex.de>
%% 
%%  This work consists of the files unigrazpub.dtx and unigrazpub.ins
%%  and the derived file unigrazpub.cls
%% 
%%  The development respository can be found at
%%  https://github.com/peitex/unigrazpub
%%  Please use the issue tracker for feedback!
%% 
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesClass{unigrazpub}
[2022/10/05 v1.00 LaTeX Templates for Graz University Library Publishing]
\RequirePackage{l3keys2e}

\ExplSyntaxOn
\keys_define:nn {ptxcd} {
collection .bool_gset:N = \g__ptxcd_collection_bool,
collection .initial:n = false,
license-type .tl_gset:N = \g__ptxcd_license_type_tl,
license-type .initial:n = CC,
license-modifier .tl_gset:N =\g__ptxcd_license_modifier_tl,
license-modifier .initial:n =by,
license-version .tl_gset:N =\g__ptxcd_license_version_tl,
license-version .initial:n = 4.0,
}

\ProcessKeysOptions{ptxcd}
\ExplSyntaxOff

\PassOptionsToClass{headings=optiontoheadandtoc,fontsize=10pt,parskip=half}{scrbook}

\LoadClass{scrbook}

\PassOptionsToPackage{black}{roboto}
\RequirePackage{roboto}
\RequirePackage{sourceserifpro}
\RequirePackage{anyfontsize}

\RequirePackage{geometry}
\geometry{
papersize={17cm,24cm},
hmargin=20mm,
bottom=22mm,
top=16mm,
includehead,
headsep=1cm
}

\RequirePackage{ragged2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fontsizes
%% modified version of scrsize10pt.clo
%% Copyright (c) 1994-2019 Markus Kohm [komascript at gmx info]

\def\normalsize{%
\@setfontsize\normalsize{10bp}{13.3bp}%
\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
\abovedisplayshortskip \z@ \@plus3\p@
\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
\belowdisplayskip \abovedisplayskip
\let\@listi\@listI
}
\def\small{%
\@setfontsize\small{9bp}{12bp}%
\abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
\abovedisplayshortskip \z@ \@plus2\p@
\belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
\def\@listi{\leftmargin\leftmargini
\topsep 4\p@ \@plus2\p@ \@minus2\p@
\parsep 2\p@ \@plus\p@ \@minus\p@
\itemsep \parsep}%
\belowdisplayskip \abovedisplayskip
}
\def\footnotesize{%
\@setfontsize\footnotesize{8bp}{10bp}%
\abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
\abovedisplayshortskip \z@ \@plus\p@
\belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
\def\@listi{\leftmargin\leftmargini
\topsep 3\p@ \@plus\p@ \@minus\p@
\parsep 2\p@ \@plus\p@ \@minus\p@
\itemsep \parsep}%
\belowdisplayskip \abovedisplayskip
}

\def\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\def\tiny{\@setfontsize\tiny\@vpt\@vipt}
\def\large{\@setfontsize\large{11bp}{13.8bp}}
\def\Large{\@setfontsize\Large{12bp}{13.8bp}}
\def\LARGE{\@setfontsize\LARGE{13bp}{13.8bp}}
\def\huge{\@setfontsize\huge{15bp}{18bp}}
\def\Huge{\@setfontsize\Huge{21bp}{26bp}}
\def\HUGE{\@setfontsize\HUGE{30bp}{33bp}}
\normalsize
\setlength\footnotesep    {6.65\p@}
\setlength{\skip\footins} {9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep       {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep   {20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep      {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop         {0\p@ \@plus 1fil}
\setlength\@fpsep         {8\p@ \@plus 2fil}
\setlength\@fpbot         {0\p@ \@plus 1fil}
\setlength\@dblfptop      {0\p@ \@plus 1fil}
\setlength\@dblfpsep      {8\p@ \@plus 2fil}
\setlength\@dblfpbot      {0\p@ \@plus 1fil}
\setlength\partopsep      {2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
\parsep\z@
\topsep\z@
\itemsep\z@
}
\let\@listI\@listi
\def\@listii {\leftmargin\leftmarginii
\labelwidth\leftmarginii
\advance\labelwidth-\labelsep}
\def\@listiii{\leftmargin\leftmarginiii
\labelwidth\leftmarginiii
\advance\labelwidth-\labelsep}
\def\@listiv {\leftmargin\leftmarginiv
\labelwidth\leftmarginiv
\advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
\labelwidth\leftmarginv
\advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
\labelwidth\leftmarginvi
\advance\labelwidth-\labelsep}
%%% From File: $Id: scrkernel-paragraphs.dtx 3262 2019-10-10 08:25:29Z kohm $
\@ifundefined{@list@extra}{}{%
\expandafter\ifnum\scr@v@is@ge{3.17}\par@updaterelative\fi
\l@addto@macro{\@listi}{\@list@extra}%
\let\@listI=\@listi
\l@addto@macro{\@listii}{\@list@extra}%
\l@addto@macro{\@listiii}{\@list@extra}%
\l@addto@macro{\footnotesize}{\protect\add@extra@listi{ftns}}%
\l@addto@macro{\small}{\protect\add@extra@listi{sml}}%
}
\@listi

%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newkomafont{chapter-author}{\normalsize}
\newkomafont{article-subtitle}{\fontsize{21bp}{26bp}\selectfont}
\newkomafont{article-imprint}{\fontsize{7bp}{10bp}\selectfont}
\setkomafont{chapter}{\HUGE\selectfont}

\setkomafont{section}{\LARGE\bfseries}
\setkomafont{subsection}{\large\bfseries}
\setkomafont{subsubsection}{\large\bfseries}
\setkomafont{paragraph}{\large\bfseries}

\setkomafont{disposition}{}

\setkomafont{pageheadfoot}{\small}
\setkomafont{pagenumber}{}

\setkomafont{caption}{\bfseries\small}

\newkomafont{quote}{\itshape}

%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\raggedsection}{\raggedright}
\RedeclareSectionCommand[beforeskip=0pt,afterskip=20.8mm]{chapter}
\RedeclareSectionCommands[afterskip=1.5mm,beforeskip=4.5mm,runin=false,afterindent=false]{section,subsection,subsubsection}
\RedeclareSectionCommands[style=section,afterskip=1.5mm,beforeskip=3mm,,runin=false,afterindent=false]{paragraph}

\ExplSyntaxOn
\DeclareNewSectionCommand[
style=chapter,
level=\chaptertocdepth,
tocentryindent=0pt,
tocentrynumwidth=0pt,
beforeskip=0pt,
afterskip=4mm
]{article}

\renewcommand*{\articlemarkformat}{}
\renewcommand*{\articleformat}{}

\bool_if:NT \g__ptxcd_collection_bool {
\renewcommand*{\thesection}{\arabic{section}}
\renewcommand*{\thefigure}{\arabic{figure}}
\renewcommand*{\thetable}{\arabic{table}}
\renewcommand*{\theequation}{\arabic{equation}}
\renewcommand*{\chapterlinesformat}[3]{
\str_if_eq:nnTF {#1} {article} {
\clist_if_empty:NF \l_ptxcd_author_clist {\parbox{\textwidth}{
\usekomafont{chapter-author}\clist_use:Nn \l_ptxcd_author_clist  {,\space}
}\par\vspace{3mm}}
\@hangfrom{#2}{#3}
} {
\@hangfrom{#2}{#3}
}
}

\renewcommand*{\addarticletocentry}[2]{%
\addcontentsline{\ext@toc}{chapter}{\protect\nonumberline\protect\TocAuthorEntry{\clist_use:Nn \l_ptxcd_author_clist  {,\space}}{#2}}%
}
}

\clist_map_inline:nn {title,subtitle,imprint,unknown,head,doi} {
\tl_new:c {l_ptxcd_#1_tl}
}

\clist_new:N \l_ptxcd_author_clist
\clist_new:N \l_ptxcd_authorkeys_clist

\keys_define:nn {ptxcd/article} {
author .clist_set:N = \l_ptxcd_author_clist,
authorkeys .clist_set:N = \l_ptxcd_authorkeys_clist,
title .tl_set:N = \l_ptxcd_title_tl,
head .tl_set:N = \l_ptxcd_head_tl,
subtitle .tl_set:N = \l_ptxcd_subtitle_tl,
imprint .tl_set:N = \l_ptxcd_imprint_tl,
doi .tl_set:N = \l_ptxcd_doi_tl,
imprint .initial:n =  {
\citeimprint {\clist_use:Nn \l_ptxcd_authorkeys_clist {,}}
},
license-type .tl_set:N = \l__ptxcd_license_type_tl,
license-type .initial:n =,
license-modifier .tl_set:N = \l__ptxcd_license_modifier_tl,
license-modifier .initial:n =,
license-version .tl_set:N = \l__ptxcd_license_version_tl,
license-version .initial:n =,
license .tl_set:N = \l__ptxcd_license_tl,
unknown .code:n = \tl_put_right:Nx \l_ptxcd_unknown_tl {,\l_keys_key_tl =\exp_not:n {#1}},
}

\cs_new:Nn \__ptxcd_clear_article_vars: {
\clist_map_inline:nn {title,subtitle,unknown,head,doi} {
\tl_clear:c {l_ptxcd_##1_tl}
}

\tl_set:Nn \l_ptxcd_imprint_tl {\citeimprint {\clist_use:Nn \l_ptxcd_authorkeys_clist {,}}}

\tl_set_eq:NN \l__ptxcd_license_type_tl \g__ptxcd_license_type_tl
\tl_set_eq:NN \l__ptxcd_license_modifier_tl \g__ptxcd_license_modifier_tl
\tl_set_eq:NN \l__ptxcd_license_version_tl \g__ptxcd_license_version_tl

\clist_clear:N \l_ptxcd_author_clist
\clist_clear:N \l_ptxcd_authokeys_clist
\tl_set:Nn \l_ptxcd_head_tl {l_ptxcd_title_tl}
}

\bool_if:NTF \g__ptxcd_collection_bool {
\AddToHook{include/before}{\begin{refsection}}
\AddToHook{include/after}{\end{refsection}}
} {
\AddToHook{include/before}{\begingroup}
\AddToHook{include/after}{\endgroup}
}

\AddToHook{include/end}{\label{\currentarticlelabel.last}}

\AddToHook{env/enumerate/begin}{\setlength{\parskip}{\z@}}
\AddToHook{env/itemize/begin}{\setlength{\parskip}{\z@}}

\newcommand*{\currentarticlelabel}{autolabel-\CurrentFile}

\newcommand*{\Article}[2][]{
\__ptxcd_clear_article_vars:
\keys_set:nn {ptxcd/article} {title={#2},#1}

\tl_set_eq:NN \doclicense@type \l__ptxcd_license_type_tl
\tl_set_eq:NN \doclicense@modifier \l__ptxcd_license_modifier_tl
\tl_set_eq:NN \doclicense@version \l__ptxcd_license_version_tl

\clist_if_empty:NF \l_ptxcd_authorkeys_clist
{
\clist_if_empty:NT \l_ptxcd_author_clist {
\clist_map_inline:Nn \l_ptxcd_authorkeys_clist {
\clist_put_right:Nn \l_ptxcd_author_clist {\citearticleauthor{##1}}
}
}
}
\tl_if_empty:NTF \l_ptxcd_unknown_tl {
\article{#2}
} {
\exp_last_unbraced:Nno \use:n {\article[}
\l_ptxcd_unknown_tl]{#2}
}
\tl_if_empty:NF \l_ptxcd_subtitle_tl {
\begin{flushleft}
\usekomafont{article-subtitle}
\l_ptxcd_subtitle_tl
\end{flushleft}
}
\label{\currentarticlelabel.first}
\vfill
\tl_if_empty:NF \l_ptxcd_imprint_tl {
\setlength{\fboxrule}{.55mm}
\setlength{\fboxsep}{2mm}
\fbox{
\parbox{\dimexpr\textwidth-2\fboxsep-2\fboxrule}{
\usekomafont{article-imprint}
\raggedright
\g_ptxcd_collection_imprint_info_tl\\
\tl_if_empty:NF \l_ptxcd_doi_tl {\exp_args:No \url{https://doi.org/\l_ptxcd_doi_tl}}
\par\addvspace{\baselineskip}
\l__ptxcd_license_tl
\par\addvspace{\baselineskip}
\l_ptxcd_imprint_tl\par
}
}
}
\pagebreak
}

\tl_new:N \g_ptxcd_collection_imprint_info_tl

\tl_gset:Nn \g_ptxcd_collection_imprint_info_tl {
\@title,~\@author,~\@date,~S.~ \pageref{\currentarticlelabel.first}–\pageref{\currentarticlelabel.last}
}

\tl_set:Nn \l__ptxcd_license_tl {
Dieses~Werk~ist~lizenziert~unter~einer~
\doclicenseLongName~Lizenz,~
ausgenommen~von~dieser~Lizenz~sind~Abbildungen,~Screenshots~und~Logos.
}

\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{quote}{%
\vspace{1.5mm}
\begin{addmargin}[5mm]{5mm}
\usekomafont{quote}
\ignorespaces
}{%
\end{addmargin}
\vspace{1.5mm}
}

\let\quotation\quote
\let\enquotation\endquote

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\leftmargini}{7mm}
\setlength{\labelwidth}{0pt}
\setlength{\labelsep}{4mm}
\deffootnote[5mm]{5mm}{-5mm}{\textsuperscript{\thefootnotemark}}

\title{}
\author{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{scrlayer-scrpage}

\ModifyLayers[voffset=16mm]{scrheadings.head.even,scrheadings.head.odd,scrheadings.head.even,scrheadings.head.odd}
\DeclareNewLayer[clone=scrheadings.head.odd,addhoffset=\textwidth,width=18mm,contents={%
\sls@secure@box\headheight{%
\normalfont\usekomafont{pageheadfoot}{\usekomafont{pagehead}%
\strut\smash{\makebox[\layerwidth][l]{\quad\pagemark}}}}}%
]{pagemark.odd}
\DeclareNewLayer[evenpage,head,align=br,voffset=16mm,width=\marginparwidth,contents={%
\sls@secure@box\headheight{%
\normalfont\usekomafont{pageheadfoot}\usekomafont{pagehead}%
\strut\smash{\makebox[\layerwidth][r]{\pagemark\quad}}}}%
]{pagemark.even}
\AddLayersToPageStyle{scrheadings}{pagemark.odd,pagemark.even}
\AddLayersToPageStyle{plain.scrheadings}{pagemark.odd,pagemark.even}
\clearpairofpagestyles
\ohead{\headmark}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ExplSyntaxOn
\bool_if:NT \g__ptxcd_collection_bool {
\providecommand{\abstract}{}% für book
\RenewDocumentEnvironment{abstract}{o}{
\begingroup
\IfNoValueF{#1}{\selectlanguage{#1}}
\section*{\abstractname}
}{
\endgroup
}

\providecaptionname{english}{\keywordsname}{Keywords}
\providecaptionname{ngerman,german,naustrian,austrian}{\keywordsname}{Schlagwörter}

\newcommand*{\keywords}[1]{
\par\vspace{\baselineskip}
\@hangfrom{\usekomafont{keywordlabel}\keywordsname :\space}{#1}}
\newkomafont{keywordlabel}{\bfseries}
}

\clist_map_inline:nn {enum,item} {
\int_step_inline:nn {4} {
\cs_set_eq:cc {orig@label#1\int_to_roman:n{##1}} {label#1\int_to_roman:n{##1}}
\cs_set:cpn  {label#1\int_to_roman:n{##1}} {\rlap{\use:c {orig@label#1\int_to_roman:n{##1}}}}
}
}

\DeclareTOCStyleEntry[
beforeskip=7mm,
entryformat=\bfseries\fontsize{13bp}{13.8bp}
\showthe\dimexpr\linewidth-13.4cm\relax
\selectfont,
rightindent=\dimexpr\linewidth-13.4cm\relax,
]{tocline}{part}

\DeclareTOCStyleEntry[
entryformat=\bfseries,
linefill={\TOCLineLeaderFill[.]},
]{tocline}{chapter}

\DeclareTOCStyleEntry[
entryformat=\LARGE\bfseries,
linefill={\TOCLineLeaderFill[.]},
rightindent=\dimexpr\linewidth-13.4cm\relax,
beforeskip=7mm,
]{tocline}{part}

\DeclareTOCStyleEntry[
indent=5mm,
entryformat=\normalsize,
linefill={\TOCLineLeaderFill[.]},
rightindent=\dimexpr\linewidth-5mm-13.4cm\relax,
]{tocline}{section}

\DeclareTOCStyleEntry[
indent=10mm,
entryformat=\normalsize,
linefill={\TOCLineLeaderFill[.]},
rightindent=\dimexpr\linewidth-10mm-13.4cm\relax,
]{tocline}{subsection}

\DeclareTOCStyleEntry[
indent=15mm,
entryformat=\normalsize,
linefill={\TOCLineLeaderFill[.]},
rightindent=\dimexpr\linewidth-15mm-13.4cm\relax,
]{tocline}{subsubsection}

\DeclareTOCStyleEntry[
indent=20mm,
entryformat=\normalsize,
linefill={\TOCLineLeaderFill[.]},
rightindent=\dimexpr\linewidth-20mm-13.4cm\relax,
]{tocline}{paragraph}

\RedeclareSectionCommand[
style=part,
afterskip = 0pt plus 1 fil,
beforeskip=54mm,%86mm-27mm,
font=\sffamily\huge,
]{part}

\setcounter{tocdepth}{\paragraphnumdepth}
\setcounter{secnumdepth}{\paragraphnumdepth}

\newcommand*{\TocAuthorEntry}[2]{%
{\usekomafont{TocAuthorEntry}#1}\newline
\hspace*{-5mm}
#2
}

\newkomafont{TocAuthorEntry}{\normalfont\normalsize}

\renewcommand*{\raggedpart}{\raggedleft}

\let\orig@backmatter\backmatter
\renewcommand*{\backmatter}{
\__ptxcd_clear_article_vars:
\orig@backmatter
\StartTocPart{\appendixname}
}

\ExplSyntaxOff

\RequirePackage{csquotes}

\PassOptionsToPackage{defernumbers}{biblatex}
\PassOptionsToPackage{notes}{biblatex-chicago}
\RequirePackage{biblatex-chicago}

\DeclareDatamodelEntrytypes{author}

\DeclareDatamodelFields[type=field,datatype=literal]{university, institute, addendum}

\DeclareDatamodelEntryfields[author]{%
author,university,institute,addendum
}

\DeclareBibliographyDriver{author}{%
\mkbibbold{\printnames{author}}\setunit{\addcomma\addspace}%
\printfield{university}\setunit{\addcomma\addspace}%
\printfield{institute}\newunit
\printfield{addendum}\addperiod
}

\renewcommand*{\bibliography@heading}{\section*}

\let\orig@printbibliography\printbibliography

\RenewDocumentCommand{\printbibliography}{O{}}{\orig@printbibliography[nottype=author,#1]}

\setlength{\bibhang}{5mm}

\defbibheading{listofauthors}{%
\addsec{Verzeichnis der Autorinnen und Autoren}%
\markboth{Verzeichnis der Autorinnen und Autoren}{Verzeichnis der Autorinnen und Autoren}%
}

\newcommand*{\listofauthors}{\orig@printbibliography[heading=listofauthors,type=author]}

\renewcommand*{\bibfont}{\normalfont\small}

\DeclareCiteCommand{\citeimprint}{}{%
\printnames[given-family]{author}\setunit{\addcomma\addspace}
\printfield{institute}\setunit{\addcomma\addspace}
\printfield{email}\setunit{\addcomma\addspace}
\printfield{orcid}\setunit{}
}{\par}{}

\DeclareCiteCommand{\citearticleauthor}{}{\printnames[given-family]{author}}{}{}

\let\orig@appendix\appendix

\renewcommand*{\appendix}{%
\orig@appendix\addpart{Anhang}%
}

\RequirePackage{graphicx}

\ExplSyntaxOn
\tl_if_empty:NF \g__ptxcd_license_type_tl {
\PassOptionsToPackage{type=\g__ptxcd_license_type_tl}{doclicense}
\PassOptionsToPackage{modifier=\g__ptxcd_license_modifier_tl}{doclicense}
\PassOptionsToPackage{version=\g__ptxcd_license_version_tl}{doclicense}
\RequirePackage[
hyperxmp=false
]{doclicense}
}
\ExplSyntaxOff

\PassOptionsToPackage{hidelinks}{hyperref}
\RequirePackage{hyperref}

\extratitle{\begingroup\sffamily\bfseries\fontsize{9bp}{12bp}\def\and{,\space}\selectfont\@author\par\vspace{.5\baselineskip}\@title\par\@subtitle\endgroup}

\setkomafont{author}{\sffamily\bfseries\fontsize{15bp}{18bp}\selectfont}

\setkomafont{subtitle}{\sffamily\bfseries\fontsize{27bp}{30bp}\selectfont}

\setkomafont{title}{\sffamily\bfseries\fontsize{41bp}{42bp}\selectfont}

\renewcommand*\maketitle[1][1]{%
\begin{titlepage}
\let\footnotesize\small
\let\footnoterule\relax
\let\footnote\thanks
\renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
\let\@oldmakefnmark\@makefnmark
\renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
\ifx\@extratitle\@empty
\ifx\@frontispiece\@empty
\else
\if@twoside\mbox{}\next@tpage\fi
\noindent\@frontispiece\next@tdpage
\fi
\else
\noindent\@extratitle
\ifx\@frontispiece\@empty
\else
\next@tpage
\noindent\@frontispiece
\fi
\next@tdpage
\fi
\setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
\begin{raggedright}
\begingroup
\def\and{\par}
\usekomafont{author}
\csname text_uppercase:n\endcsname {\@author}
\par\vspace{1.784\baselineskip}
\endgroup
{\usekomafont{title}{\csname text_uppercase:n\endcsname {\@title}\par}}%
\vskip 1em
{\ifx\@subtitle\@empty\else\usekomafont{subtitle}{\@subtitle\par}\fi}%
\end{raggedright}\par
\vfill
{\usekomafont{publishers}{\@publishers \par}}%
\@thanks\global\let\@thanks\@empty
\next@tpage
\begin{minipage}[t]{\textwidth}
\@uppertitleback
\end{minipage}\par
\vfill
\begin{minipage}[b]{\textwidth}
\fontsize{10bp}{10bp}\selectfont
\setlength{\parskip}{\baselineskip}
\raggedright
\@lowertitleback
\end{minipage}\par
\@thanks\global\let\@thanks\@empty
\ifx\@dedication\@empty
\else
\next@tdpage\null\vfill
{\centering\usekomafont{dedication}{\@dedication \par}}%
\vskip \z@ \@plus3fill
\@thanks\global\let\@thanks\@empty
\cleardoubleemptypage
\fi
\ifx\titlepage@restore\relax\else\clearpage\titlepage@restore\fi
\end{titlepage}
\setcounter{footnote}{0}%
\global\let\and\relax
}%

\newcommand*{\edition}[1]{\def\insertedition{#1}}
\newcommand*{\publishersaddress}[1]{\def\insertpublishersaddress{#1}}

\publishers{Graz University Library Publishing \IfFileExists{Logo_Universitaet-Graz_1c.pdf}{\hfill \includegraphics[width=0.25\textwidth]{Logo_Universitaet-Graz_1c.pdf}}{}}
\publishersaddress{
Graz University Library Publishing\\
Universitätsplatz 3a\\
8010 Graz\\
\protect\url{lp.uni-graz.at}}

\newcommand*{\insertauthor}{\@author}
\newcommand*{\insertdate}{\@date}
\newcommand*{\insertpublishers}{\@publishers}

\endinput
%%
%% End of file `unigrazpub.cls'.
