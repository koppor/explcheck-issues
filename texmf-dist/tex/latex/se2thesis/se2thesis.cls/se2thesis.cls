%%
%% This is file `se2thesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% se2thesis.dtx  (with options: `init')
%% se2thesis.dtx  (with options: `class')
%% Copyright (C) 2022--2024 by Stephan Lukasczyk <stephan@dante.de>
%% 
%% It may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License (LPPL), either version 1.3c of
%% this license or (at your option) any later version.  The latest
%% version of this license is in the file:
%% 
%%    https://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status by
%%   Stephan Lukasczyk.
%% 
%% This work consists of the files se2thesis.dtx,
%%                                 se2thesis.ins,
%%                                 se2colors.dtx,
%%                                 se2fonts.dtx,
%%                                 se2packages.dtx,
%%                                 se2thesis-master-thesis-example.tex
%%           and the derived files se2thesis.pdf,
%%                                 se2thesis.cls,
%%                                 se2translations-english.trsl,
%%                                 se2translations-german.trsl,
%%                                 se2colors.sty,
%%                                 se2fonts.sty,
%%                                 se2packages.sty,
%%                                 se2thesis-master-thesis-example.bib, and
%%                                 se2thesis-master-thesis-example.pdf
\@ifundefined{ExplLoaderFileDate}
  { \RequirePackage{expl3} }
  {}
\@ifl@t@r\ExplLoaderFileDate{2020-01-09}
  {}
  {%
    \PackageError{se2colors}{Support package expl3 too old}
    {%
      You need to update your installation of the bundles 'l3kernel' and
      'l3packages'.\MessageBreak
      Loading~se2colors~will~abort!%
    }%
    \endinput
  }%
\providecommand \IfFormatAtLeastTF { \@ifl@t@r \fmtversion }
\ProvidesExplClass {se2thesis} {2024-10-16} {4.4.0}
  {A thesis class for the Chair of Software Engineering II}
\prg_new_conditional:Nnn \slcd_package_if_loaded:n { p, T, F, TF }
  {
    \use:c { @ifpackageloaded }
      { #1 }
      { \prg_return_true: }
      { \prg_return_false: }
  }
\RequirePackage{graphicx}
\RequirePackage{translations}
\LoadDictionary{se2translations}
\DeclareTranslationFallback{version-of-date}{%
  Version~\l__slcd_version_tl\ of~\@date
}
\DeclareTranslation{German}{version-of-date}{%
  Version~\l__slcd_version_tl\ vom~\@date
}
\DeclareTranslation{English}{version-of-date}{%
  Version~\l__slcd_version_tl\ of~\@date
}
\int_new:N \l__slcd_paper_int
\tl_new:N \l__slcd_base_class_tl
\prop_new:N \l__slcd_clsopts_prop
\prop_new:N \l__slcd_unknown_clsopts_prop
\tl_new:N \l__slcd_version_tl
\tl_new:N \l__slcd_degreeprogramme_tl
\tl_new:N \l__slcd_matrnumber_tl
\tl_new:N \l__slcd_supervisor_tl
\tl_new:N \l__slcd_cosupervisor_tl
\tl_new:N \l__slcd_advisor_tl
\tl_new:N \l__slcd_coadvisor_tl
\tl_new:N \l__slcd_department_tl
\tl_new:N \l__slcd_institute_tl
\tl_new:N \l__slcd_external_tl
\tl_new:N \l__slcd_logofile_tl
\tl_new:N \l__slcd_signature_tl
\tl_new:N \l__slcd_location_tl
\dim_new:N \l__slcd_marginspace_dim
\dim_new:N \l__slcd_headmarkspace_dim
\dim_new:N \l__slcd_rulespace_dim
\dim_new:N \l__slcd_pagemark_minipage_dim
\dim_new:N \l__slcd_ruleraise_dim
\dim_new:N \l__slcd_rulewidth_dim
\dim_new:N \l__slcd_rulethickness_dim
\dim_gset:Nn \l__slcd_marginspace_dim { -1.85cm }
\dim_gset:Nn \l__slcd_headmarkspace_dim { 0.75cm }
\dim_gset:Nn \l__slcd_rulespace_dim { 10pt }
\dim_gset:Nn \l__slcd_pagemark_minipage_dim { 1.5cm }
\dim_gset:Nn \l__slcd_ruleraise_dim { -5pt }
\dim_gset:Nn \l__slcd_rulewidth_dim { 1.25pt }
\dim_gset:Nn \l__slcd_rulethickness_dim { 15pt }
\keys_define:nn { seiithesis }
  {
    class .choice:,
    class / report .meta:n = {class=scrreprt},
    class / scrreprt .code:n = \tl_gset:Nn \l__slcd_base_class_tl {scrreprt},
    class / book .meta:n = {class=scrbook},
    class / scrbook .code:n = \tl_gset:Nn \l__slcd_base_class_tl {scrbook},
    class .initial:n = scrbook,

    paper .choices:nn = {a4,b5}{
      \int_gset_eq:NN \l__slcd_paper_int \l_keys_choice_int
    },
    paper .initial:n = a4,

    logofile .tl_gset:N = \l__slcd_logofile_tl,
    logofile .initial:n =,

    thesistype .choice:,
    thesistype / bachelor .code:n = \tl_gset:Nn \l__slcd_thesis_type_tl {bachelor},
    thesistype / bachelorproposal .code:n = {
      \tl_gset:Nn \l__slcd_thesis_type_tl {bachelorproposal}
    },
    thesistype / master .code:n = \tl_gset:Nn \l__slcd_thesis_type_tl {master},
    thesistype / masterproposal .code:n = {
      \tl_gset:Nn \l__slcd_thesis_type_tl {masterproposal}
    },
    thesistype / phd .code:n = \tl_gset:Nn \l__slcd_thesis_type_tl {phd},
    thesistype / phdeng .code:n = \tl_gset:Nn \l__slcd_thesis_type_tl {phdeng},
    thesistype / phdphil .code:n = \tl_gset:Nn \l__slcd_thesis_type_tl {phdphil},
    thesistype / phdproposal .code:n = {
      \tl_gset:Nn \l__slcd_thesis_type_tl {phdproposal}
    },
    thesistype .initial:n = master,

    colormode .choices:nn = {4C,CMYK,cmyk,RGB,rgb,BW,bw,gray}{
      \tl_gset_eq:NN \l__slcd_colormode_tl \l_keys_choice_tl
    },
    colormode .initial:n = cmyk,

    unknown .code:n = {
      \prop_gput:NVn \l__slcd_unknown_clsopts_prop \l_keys_key_tl {#1}
    },
  }
\IfFormatAtLeastTF { 2022-06-01 }
  { \ProcessKeyOptions [ seiithesis ] }
  {
    \RequirePackage{ l3keys2e }
    \ProcessKeysOptions { seiithesis }
  }
\prop_map_inline:Nn \l__slcd_clsopts_prop
  {
    \tl_if_empty:nTF {#2}
      { \PassOptionsToClass {#1} {\l__slcd_base_class_tl} }
      {
        \clist_map_inline:nn {#2}
          { \PassOptionsToClass {#1=##1} {\l__slcd_base_class_tl} }
      }
  }
\LoadClass{\l__slcd_base_class_tl}
\prop_map_inline:Nn \l__slcd_unknown_clsopts_prop
  {
    \cs_if_exist:cT {KV@KOMA.\l__slcd_base_class_tl.cls@#1}
      {
        \tl_if_empty:nTF {#2}
          { \KOMAoptions{#1} }
          { \KOMAoption{#1}{#2}}
      }
  }
\PassOptionsToPackage{\l__slcd_colormode_tl}{se2colors}
\RequirePackage{se2colors}

\RequirePackage{se2fonts}
\ProvideDocumentCommand \version { m }
  {
    \tl_set:Nn \l__slcd_version_tl {#1}
  }
\ProvideDocumentCommand \degreeprogramme { m }
  {
    \tl_set:Nn \l__slcd_degreeprogramme_tl {#1}
  }
\ProvideDocumentCommand \matrnumber { m }
  {
    \tl_set:Nn \l__slcd_matrnumber_tl {#1}
  }
\ProvideDocumentCommand \supervisor { m }
  {
    \tl_set:Nn \l__slcd_supervisor_tl {#1}
  }
\ProvideDocumentCommand \cosupervisor { m }
  {
    \tl_set:Nn \l__slcd_cosupervisor_tl {#1}
  }
\ProvideDocumentCommand \advisor { m }
  {
    \tl_set:Nn \l__slcd_advisor_tl {#1}
  }
\ProvideDocumentCommand \coadvisor { m }
  {
    \tl_set:Nn \l__slcd_coadvisor_tl {#1}
  }
\ProvideDocumentCommand \department { m }
  {
    \tl_set:Nn \l__slcd_department_tl {#1}
  }
\ProvideDocumentCommand \institute { o m }
  {
    \tl_set:Nn \l__slcd_institute_tl {#2}
  }
\ProvideDocumentCommand \external { m }
  {
    \tl_set:Nn \l__slcd_external_tl {#1}
  }
\ProvideDocumentCommand \location { m }
  {
    \tl_set:Nn \l__slcd_location_tl {#1}
  }
\dim_if_exist:NF \l__slcd_logo_height_dim
  {
    \dim_new:N \l__slcd_logo_height_dim
    \int_compare:nTF { \l__slcd_paper_int=1 }
      {
        \dim_gset:Nn \l__slcd_logo_height_dim { 67.5pt }
      } {
        \dim_gset:Nn \l__slcd_logo_height_dim { 56.8pt }
      }
  }
\box_if_exist:NF \l__slcd_logo_box
  {
    \box_new:N \l__slcd_logo_box
  }
\tl_if_empty:NF \l__slcd_logofile_tl
  {
    \hbox_gset:Nn \l__slcd_logo_box
      {
        \includegraphics[%
          height=\l__slcd_logo_height_dim%
        ]{\l__slcd_logofile_tl}
      }
  }
\int_compare:nTF { \l__slcd_paper_int=1 }
  {
    \areaset[current]{350pt}{567pt}
    \setlength{\marginparsep}{8.5cm}
    \setlength{\marginparsep}{1.5em}
  }{
    \areaset[current]{350pt}{567pt}
    \setlength{\marginparsep}{7.4cm}
    \setlength{\marginparsep}{1.5em}
  }
\PassOptionsToPackage{automark}{scrlayer-scrpage}
\RequirePackage{scrlayer-scrpage}
\clearpairofpagestyles
\setkomafont{pagefoot}{\normalfont\sffamily}
\rofoot[{%
  \group_begin: \ \group_end:
  \footnotesize%
  \hspace*{\l__slcd_headmarkspace_dim}%
  \group_begin:
    \color{UPSE2-Blue}%
    \rule[\l__slcd_ruleraise_dim]{\l__slcd_rulewidth_dim}{\l__slcd_rulethickness_dim}%
  \group_end:
  \hspace*{\l__slcd_rulespace_dim}%
  \begin{minipage}[b]{\l__slcd_pagemark_minipage_dim}%
    \normalsize\textbf{\pagemark}%
  \end{minipage}%
  \hspace{\l__slcd_marginspace_dim}%
}]{%
  \group_begin: \ \group_end:
  \footnotesize%
  \group_begin:
    \color{UPSE2-Blue}\headmark
  \group_end:
  \hspace*{\l__slcd_rulespace_dim}%
  \group_begin:
    \color{UPSE2-Blue}%
    \rule[\l__slcd_ruleraise_dim]{\l__slcd_rulewidth_dim}{\l__slcd_rulethickness_dim}%
  \group_end:
  \hspace*{\l__slcd_rulespace_dim}%
  \begin{minipage}[b]{\l__slcd_pagemark_minipage_dim}%
    \normalsize\textbf{\pagemark}%
  \end{minipage}%
  \hspace{\l__slcd_marginspace_dim}%
}
\lefoot[{%
  \null\hspace{\l__slcd_marginspace_dim}%
  \footnotesize%
  \begin{minipage}[b]{\l__slcd_pagemark_minipage_dim}%
    \raggedleft\normalsize\textbf{\pagemark}%
  \end{minipage}%
  \footnotesize%
  \hspace*{\l__slcd_rulespace_dim}%
  \group_begin:
    \color{UPSE2-Blue}%
    \rule[\l__slcd_ruleraise_dim]{\l__slcd_rulewidth_dim}{\l__slcd_rulethickness_dim}%
  \group_end:
}]{%
  \null\hspace{\l__slcd_marginspace_dim}%
  \footnotesize%
  \begin{minipage}[b]{\l__slcd_pagemark_minipage_dim}%
    \raggedleft\normalsize\textbf{\pagemark}%
  \end{minipage}%
  \footnotesize%
  \hspace*{\l__slcd_rulespace_dim}%
  \group_begin:
    \color{UPSE2-Blue}%
    \rule[\l__slcd_ruleraise_dim]{\l__slcd_rulewidth_dim}{\l__slcd_rulethickness_dim}%
  \group_end:
  \hspace*{\l__slcd_headmarkspace_dim}%
  \group_begin:
    \color{UPSE2-Blue}\headmark
  \group_end:
}
\pagestyle{scrheadings}
\setkomafont{title}{\Huge}
\setkomafont{subtitle}{\Large}
\setkomafont{subject}{\normalsize}
\setkomafont{author}{\large}
\setkomafont{date}{\normalsize}
\setkomafont{publishers}{\normalsize}
\seq_new:N \l__slcd_author_seq
\renewcommand*\author[2][]{
  \seq_gset_split:Nnn \l__slcd_author_seq {\and} {#2}
  \tl_if_empty:nTF {#1}
    { \tl_set:Nn \l__slcd_signature_tl {#2} }
    { \tl_set:Nn \l__slcd_signature_tl {#1} }
}
\renewcommand*{\@author}{
  \group_begin:
    \hyphenpenalty=100000
    \seq_use:Nnnn \l__slcd_author_seq {~\GetTranslation{and}~} {,~} {~\&~}
  \group_end:
}
\DeclareNewLayer[
  mode=picture,
  foreground,
  hoffset=\paperwidth-\coverpagerightmargin-\box_wd:N \l__slcd_logo_box,
  voffset=\coverpagetopmargin+1.5in+\ht\strutbox,
  width=\box_wd:N \l__slcd_logo_box,
  height=\box_ht:N \l__slcd_logo_box,
  contents={\putUL{\box_use:N \l__slcd_logo_box}},
]{title.seii.logo}
\DeclareNewPageStyleByLayers{title.seii}{title.seii.logo}
\renewcommand*{\titlepagestyle}{title.seii}
\renewcommand*{\maketitle}[1][1]{
  \begin{titlepage}
    \setcounter{page}{#1}
    \def\thefootnote{\fnsymbol{footnote}}
    \edef\titlepage@restore{%
      \noexpand\endgroup
      \noexpand\global\noexpand\@colht\the\@colht
      \noexpand\global\noexpand\@colroom\the\@colroom
      \noexpand\global\vsize\the\vsize
      \noexpand\global\noexpand\@titlepageiscoverpagefalse
      \noexpand\let\noexpand\titlepage@restore\noexpand\relax
    }%
    \begingroup
    \topmargin=\dimexpr \coverpagetopmargin-1in\relax
    \oddsidemargin=\dimexpr 0in\relax
    \evensidemargin=\dimexpr 0in\relax
    \textwidth=\dimexpr \paperwidth-2in\relax
    \textheight=\dimexpr
    \paperheight-\coverpagetopmargin-\coverpagebottommargin\relax
    \headheight=0pt
    \headsep=0pt
    \footskip=\baselineskip
    \@colht=\textheight
    \@colroom=\textheight
    \vsize=\textheight
    \columnwidth=\textwidth
    \hsize=\textwidth
    \linewidth=\hsize
    \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
    \thispagestyle{title.seii}
    %
    \@maketitle
    %
    \if@twoside
      \@tempswatrue
      \if@tempswa
        \next@tpage
        \begin{minipage}[t]{\textwidth}
          \@uppertitleback
        \end{minipage}
        \vfill
        \begin{minipage}[b]{\textwidth}
          \@lowertitleback
        \end{minipage}\par
        \@thanks\let\@thanks\@empty
      \fi
    \fi
    \ifx\titlepage@restore\relax\else\clearpage\titlepage@restore\fi
  \end{titlepage}
}
\box_if_exist:NF \l__slcd_title_box
  {
    \box_new:N \l__slcd_title_box
  }
\renewcommand*{\@maketitle}{%
  \group_begin:
    \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
    \thispagestyle{title.seii}
    \hbox_gset:Nn \l__slcd_title_box
      {
        \parbox{\textwidth}{\__slcd_print_title:}
      }
    \null
    \skip_vertical:n { 2.5 \box_ht:N \l__slcd_logo_box }
    \box_use:N \l__slcd_title_box
    \skip_vertical:n { .5 \box_ht:N \l__slcd_logo_box }
  \group_end:
  \@thanks\let\@thanks\@empty
}
\RequirePackage{ifthen}
\cs_new:Nn \__slcd_print_title:
  {
    \group_begin:
      \usekomafont{title}\centering\@title\par
    \group_end:
    \ifx\@subtitle\@empty\else{%
      \medskip\usekomafont{subtitle}\centering\@subtitle\par%
    }\fi
    \bigskip
    \group_begin:
      \usekomafont{author}\centering\@author\par
    \group_end:
    \bigskip
    \exp_args:NV
      {
        \begin{center}
          \tl_if_eq:NnTF \l__slcd_thesis_type_tl { phd }
            {
              Dissertation~ zur~ Erlangung~ des~ Doktorgrades\\
              der~ Naturwissenschaften~ (Dr.\,rer.\,nat.)\\
              eingereicht~ an~ der~ Fakultät~ für~ Informatik~ und~ Mathematik\\
              der~ Universität~ Passau\\
              \rule{\textwidth}{.1pt}\\
              Dissertation~ submitted~ to\\
              the~ Faculty~ of~ Computer~ Science~ and~ Mathematics\\
              of~ the~ University~ of~ Passau\\
              in~ partial~ fulfillment~ of~ obtaining\\
              the~ degree~ of~ a~ Doctor~ of~ Natural~ Sciences
            } {
              \tl_if_eq:NnTF \l__slcd_thesis_type_tl { phdeng }
                {
                  Dissertation~ zur~ Erlangung~ des~ Doktorgrades\\
                  der~ Ingenieurwissenschaften~ (Dr.-Ing.)\\
                  eingereicht~ an~ der~ Fakultät~ für~ Informatik~ und~ Mathematik\\
                  der~ Universität~ Passau\\
                  \rule{\textwidth}{.1pt}\\
                  Dissertation~ submitted~ to\\
                  the~ Faculty~ of~ Computer~ Science~ and~ Mathematics\\
                  of~ the~ University~ of~ Passau\\
                  in~ partial~ fulfillment~ of~ obtaining\\
                  the~ degree~ of~ a~ Doctor~ of~ Engineering
                } {
                  \tl_if_eq:NnTF \l__slcd_thesis_type_tl { phdphil }
                    {
                      Dissertation~ zur~ Erlangung~ des~ Doktorgrades\\
                      der~ Naturphilosophie~ (Dr.\,phil.\,nat.)\\
                      eingereicht~ an~ der~ Fakultät~ für~ Informatik~ und~ Mathematik\\
                      der~ Universität~ Passau\\
                      \rule{\textwidth}{.1pt}\\
                      Dissertation~ submitted~ to\\
                      the~ Faculty~ of~ Computer~ Science~ and~ Mathematics\\
                      of~ the~ University~ of~ Passau\\
                      in~ partial~ fulfillment~ of~ obtaining\\
                      the~ degree~ of~ a~ Doctor~ of~ Natural~ Philosophy
                    } {
                      \tl_if_eq:NnT \l__slcd_thesis_type_tl { bachelor }
                        { \GetTranslation{Bachelor-thesis} }
                      \tl_if_eq:NnT \l__slcd_thesis_type_tl { bachelorproposal }
                        { \GetTranslation{Bachelor-thesis-proposal} }
                      \tl_if_eq:NnT \l__slcd_thesis_type_tl { master }
                        { \GetTranslation{Master-thesis} }
                      \tl_if_eq:NnT \l__slcd_thesis_type_tl { masterproposal }
                        { \GetTranslation{Master-thesis-proposal} }
                      \tl_if_eq:NnT \l__slcd_thesis_type_tl { phdproposal }
                        { \GetTranslation{PhD-thesis-proposal} }
                      \tl_if_empty:NF \l__slcd_degreeprogramme_tl
                        {
                          \ in~\l__slcd_degreeprogramme_tl
                        }
                      \par
                      \tl_if_empty:NF \l__slcd_department_tl { \l__slcd_department_tl \par }
                      \tl_if_empty:NF \l__slcd_institute_tl { \l__slcd_institute_tl \par }
                    }
                }
            }
        \end{center}\par\bigskip
        \begin{center}
          \begin{tabular}{@{} l @{\quad} l}
            \tl_if_empty:NF \l__slcd_matrnumber_tl
              {
                \GetTranslation{Matrnumber}    & \l__slcd_matrnumber_tl \\
              }
            \tl_if_empty:NF \l__slcd_supervisor_tl
              {
                \GetTranslation{Supervisor}    & \l__slcd_supervisor_tl \\
              }
            \tl_if_empty:NF \l__slcd_cosupervisor_tl
              {
                \GetTranslation{Co-supervisor} & \l__slcd_cosupervisor_tl \\
              }
            \tl_if_empty:NF \l__slcd_advisor_tl
              {
                \GetTranslation{Advisor}       & \l__slcd_advisor_tl \\
              }
            \tl_if_empty:NF \l__slcd_coadvisor_tl
              {
                \GetTranslation{Co-advisor}    & \l__slcd_coadvisor_tl \\
              }
            \tl_if_empty:NF \l__slcd_external_tl
              {
                \GetTranslation{External}      & \l__slcd_external_tl \\
              }
          \end{tabular}
        \end{center}
        \par\medskip
        \group_begin:
          \usekomafont{date}
          \centering
          \tl_if_empty:NTF \l__slcd_version_tl
            { \@date }
            { \GetTranslation{version-of-date} }
          \par\smallskip
        \group_end:
      }
  }
\renewcommand*{\@lowertitleback}{%
  \group_begin:
    \noindent\textbf{\@author}:\\
    \group_begin:
      \let\\\relax
      \emph{\@title}
    \group_end:\\
    \tl_if_eq:NnT \l__slcd_thesis_type_tl { bachelor }
      { \GetTranslation{Bachelor-thesis},~ }
    \tl_if_eq:NnT \l__slcd_thesis_type_tl { master }
      { \GetTranslation{Master-thesis},~ }
    \tl_if_eq:NnT \l__slcd_thesis_type_tl { phd }
      { \GetTranslation{PhD-thesis},~ }
    \GetTranslation{up},~\the\year.
  \group_end:
}
\addtokomafont{chapterprefix}{\raggedleft\bfseries}
\addtokomafont{chapter}{\mdseries}
\addtokomafont{section}{\large\mdseries}
\addtokomafont{subsection}{\normalsize\mdseries}
\renewcommand*{\chapterformat}{%
  \enskip\mbox{%
    \scalebox{3}{\color{UPSE2-DarkGray}\thechapter\autodot}%
  }%
}
\renewcommand{\chapterlinesformat}[3]{%
  \parbox[b]{\textwidth}{\hrulefill#2}\par%
  #3\par\bigskip%
  \hrule%
}
\RedeclareSectionCommand[afterskip=1.5\baselineskip]{chapter}
\renewcommand*{\chapterlineswithprefixformat}[3]{%
  \Ifstr{#1}{chapter}
    {#2\textls*[75]{\MakeUppercase{#3}}}% change definition for chapter
    {#2#3}% original definition
}%
\renewcommand*{\sectionlinesformat}[4]{%
  #3\textls*[75]{\MakeUppercase{#4}}%
}
\setkomafont{paragraph}{\normalsize\normalfont\itshape}
\AddtoDoHook{heading/endgroup/paragraph}{\headingdot}
\newcommand*{\headingdot}[1]{.}
\renewcommand*{\dictumwidth}{0.42\linewidth}
\providecommand{\abstract}{}
\RenewDocumentEnvironment { abstract } { o }
  {
    \group_begin:
      \IfNoValueF {#1} { \selectlanguage{#1} }
      \scr@ifundefinedorrelax{chapter}{
        \Iftocfeature{toc}{leveldown}
          {\subsection*}
          {\section*}
      }{
        \let\clearpage\relax
        \Iftocfeature{toc}{leveldown}
          {\section*}
          {\chapter*}
      } { \GetTranslation{Abstract} }
  } {
    \group_end:
  }
\NewDocumentEnvironment { acknowledgements } { o }
  {
    \group_begin:
      \IfNoValueF {#1} { \selectlanguage{#1} }
      \scr@ifundefinedorrelax{chapter}{
        \Iftocfeature{toc}{leveldown}
          {\subsection*}
          {\section*}
      }{
        \Iftocfeature{toc}{leveldown}
          {\section*}
          {\chapter*}
      } { \GetTranslation{Acknowledgements} }
  } {
    \group_end:
  }
\newif\if@mainmatter\@mainmattertrue
\providecommand*{\frontmatter}
  {
    \if@twoside\cleardoubleoddpage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering { roman }
  }
\providecommand*{\mainmatter}
  {
    \if@twoside\cleardoubleoddpage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering { arabic }
  }
\providecommand*{\backmatter}
  {
    \if@twoside\cleardoubleoddpage\else\clearpage\fi
    \@mainmatterfalse
  }
\NewDocumentCommand \authorshipDeclaration { o }
  {
    \par
    \group_begin:
      \selectlanguage{ngerman}
      \IfNoValueF {#1}
        { \tl_gset:Nn \l__slcd_location_tl {#1} }

      \tl_if_empty:NT \l__slcd_location_tl
        {
          \msg_new:nnn { seiithesis }
            { no-location-specified }
            {
              You~ need~ to~ specify~ a~ location~ for~ the~ authorship~
              declaration.~ Either~ via~ the~ location~ macro~ or~ via~ the~
              optional~ argument~ of~ the~ authorshipDeclaration~ macro.
            }
          \msg_warning:nn { seiithesis } { no-location-specified }
        }

      \scr@ifundefinedorrelax{chapter}{
        \Iftocfeature{toc}{leveldown}
          {\subsection*}
          {\section*}
      }{
        \Iftocfeature{toc}{leveldown}
          {\section*}
          {\chapter*}
      } { Eigenständigkeitserklärung }

      Hiermit~ versichere~ ich,~ \l__slcd_signature_tl,
      \begin{enumerate}
        \item dass~ ich~ die~ vorliegende~ Arbeit~ selbstständig~ und~ ohne~
          unzulässige~ Hilfe~ verfasst~ und~ keine~ anderen~ als~ die~
          angegebenen~ Quellen~ und~ Hilfsmittel~ benutzt,~ sowie~ die~
          wörtlich~ und~ sinngemäß~ übernommenen~ Passagen~ aus~ anderen~
          Werken~ kenntlich~ gemacht~ habe.
        \item Außerdem~ erkläre~ ich,~ dass~ ich~ der~ Universität~ ein~
          einfaches~ Nutzungsrecht~ zum~ Zwecke~ der~ Überprüfung~ mittels~
          einer~ Plagiatssoftware~ in~ anonymisierter~ Form~ einräume.
      \end{enumerate}\par
      \bigskip
      \noindent \l__slcd_location_tl,~ \@date\hfill
      \signatureBox{\l__slcd_signature_tl}
    \group_end:
    \\\strut\cleardoublepage
  }
\newcommand*{\signatureBox}[2][5cm]{
  \parbox[t]{#1}{
    \centering
    \rule{\linewidth}{.3pt}\\\makebox[0pt][c]{#2}
  }
}
\slcd_package_if_loaded:nT { amsmath }
  {
    \PassOptionsToPackage{amsmath}{ntheorem}
  }
\RequirePackage{ntheorem}
\theoremseparator{:}
\newtheorem{resq}{Research~ Question}
\newtheorem{hyp}{Hypothesis}
\RequirePackage{tcolorbox}
\ExplSyntaxOff
\NewDocumentEnvironment { summary } { m +b }
  {%
    \begin{tcolorbox}[%
      size=fbox,%
      rounded corners=all,%
      attach title to upper,%
      coltitle=black,%
      fonttitle=\bfseries,%
      title={Summary #1},
      after title={:\ },
    ]
      #2
  } {%
    \end{tcolorbox}%
  }
\ExplSyntaxOn
\NewDocumentCommand { \summarybox } { m m }
  {
    \begin{summary}{#1} #2 \end{summary}
  }
