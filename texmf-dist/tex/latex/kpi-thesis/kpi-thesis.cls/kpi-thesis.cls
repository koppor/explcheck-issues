% kpi-thesis.cls — diploma / coursework documents for KPI FICE (ІПІ department).
% Based on a 2026 diploma format that passed normcontrol; rules: ДСТУ 3008:2015 and
% the department guide «Дипломний проєкт: ... вимоги до структури, змісту та оформлення» (2024).
% Compile with LuaLaTeX (XeLaTeX still works).
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kpi-thesis}[2026/11/17 v2.0 KPI FICE thesis documents]

% \documentclass[coursework, main-font={Times New Roman}]{kpi-thesis}; other options go to extarticle.
\newif\ifkpi@coursework
\DeclareKeys{
  diploma.code    = \kpi@courseworkfalse,
  coursework.code = \kpi@courseworktrue,
  main-font.code  = \def\kpi@mainfont{#1},
  mono-font.code  = \def\kpi@monofont{#1},
}
\DeclareUnknownKeyHandler{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessKeyOptions

\LoadClass[14pt,a4paper]{extarticle}

\sloppy

% 14 pt with a 17 pt base, then \onehalfspacing — ~29 lines per page, like Word's 1.5.
\renewcommand\normalsize{%
  \@setfontsize\normalsize{14pt}{17pt}%
  \abovedisplayskip 14\p@ \@plus3\p@ \@minus7\p@
  \abovedisplayshortskip \z@ \@plus4\p@
  \belowdisplayshortskip 7\p@ \@plus4\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI
}

% --- Engine ---
% XeTeX gets no new LaTeX features (LaTeX News 40), so LuaLaTeX is the default build.
\ExplSyntaxOn
\sys_if_engine_pdftex:T
  {
    \ClassError { kpi-thesis }
      { Потрібен~LuaLaTeX~(fontspec);~pdfLaTeX~не~підтримується }
      { Зберіть~роботу~через~lualatex:~у~шаблонах~це~робить~.latexmkrc. }
  }
\sys_if_engine_xetex:T
  {
    \ClassWarningNoLine { kpi-thesis }
      { XeLaTeX~ще~працює,~але~рекомендовано~LuaLaTeX:~у~.latexmkrc~роботи~
        замініть~xelatex~на~lualatex }
  }
\ExplSyntaxOff

% --- Fonts, language ---
% Times New Roman and Courier New are what the guide requires, but they are not free: Overleaf
% and Linux without mscorefonts lack them, so the metric-compatible TeX Gyre fonts stand in.
\RequirePackage{fontspec}
% The fallback is loaded by file name: XeTeX doesn't see TeX Live's own fonts by family name.
\NewDocumentCommand\kpi@setfont{m m m m}{%
  \IfFontExistsTF{#2}{#1{#2}}{%
    \ClassWarningNoLine{kpi-thesis}{Шрифту «#2» немає, замість нього «#3». Методичка вимагає
      #2: для здачі встановіть його або завантажте .ttf у проєкт}%
    #1{#4}[Extension=.otf, UprightFont=*-regular, BoldFont=*-bold, ItalicFont=*-italic,
      BoldItalicFont=*-bolditalic]}}
\providecommand\kpi@mainfont{Times New Roman}
\providecommand\kpi@monofont{Courier New}
\expandafter\kpi@setfont\expandafter\setmainfont\expandafter{\kpi@mainfont}{TeX Gyre Termes}{texgyretermes}
\expandafter\kpi@setfont\expandafter\setmonofont\expandafter{\kpi@monofont}{TeX Gyre Cursor}{texgyrecursor}
\RequirePackage[english,ukrainian,shorthands=off]{babel}

% --- Page ---
\RequirePackage[left=30mm,right=20mm,top=20mm,bottom=20mm]{geometry}
\RequirePackage{setspace}
\normalsize
\onehalfspacing
\RequirePackage{indentfirst}
\setlength{\parindent}{1.25cm}
\RequirePackage{ragged2e}
\justifying

% --- Packages used across documents ---
\RequirePackage{ulem}
\setlength{\ULdepth}{2pt}
\RequirePackage{makecell}
\RequirePackage{multirow}
\RequirePackage{float}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{pdfpages}
\RequirePackage{listings}
\RequirePackage{fvextra}
\RequirePackage{xcolor}
\RequirePackage{cite}
% URLs break after / . - _ and the like, never mid-word; \kpisetup{url-breaks=anywhere} for xurl.
\RequirePackage[hyphens]{url}
\urlstyle{same}

\setlength{\tabcolsep}{4pt}
% media/ first: with latexmk -outdir=build, ../media/ also resolves against build/ and breaks loading.
\graphicspath{{media/}{../media/}{./}}
\floatplacement{figure}{H}
\floatplacement{table}{H}

% --- Headings ---
\RequirePackage{titlesec}
\RequirePackage{titletoc}

\titleformat{\section}
  {\centering\bfseries\MakeUppercase}
  {\thesection}{1em}{}
\titleformat{\subsection}
  {\bfseries}
  {\thesubsection}{1em}{}
\titlespacing*{\subsection}
  {\parindent}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titleformat{\subsubsection}
  {\bfseries}
  {\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}
  {\parindent}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\setcounter{secnumdepth}{3}

\AddToHook{cmd/section/before}{\clearpage}

\titlecontents{section}[0em]{\raggedright}{\thecontentslabel\hspace{0.5em}}{}{\titlerule*[1pc]{.}\contentspage}
\titlecontents{subsection}[1em]{\raggedright}{\thecontentslabel\hspace{0.5em}}{}{\titlerule*[1pc]{.}\contentspage}
\titlecontents{subsubsection}[2.75em]{\raggedright}{\thecontentslabel\hspace{0.5em}}{}{\titlerule*[1pc]{.}\contentspage}

\renewcommand\tableofcontents{%
  \section*{\centering ЗМІСТ}%
  \@starttoc{toc}%
}

% Unnumbered structural element (ВСТУП, ВИСНОВКИ, ...) listed in the ToC.
\NewDocumentCommand\structural{m}{%
  \section*{\centering #1}%
  \addcontentsline{toc}{section}{#1}%
}

% --- Page numbers: top right, none until \mainmatter ---
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{17pt}
% Follow margins changed in the preamble (\kpisetup{left-margin=...}, \geometry).
\AtBeginDocument{\setlength{\headwidth}{\textwidth}}
\pagenumbering{gobble}

% Page 1 is the document's title page; numbering is visible from the page after it.
\NewDocumentCommand\mainmatter{}{%
  \clearpage
  \pagenumbering{arabic}%
  \setcounter{page}{2}%
}

% --- Captions: «Рисунок 1.2 – Назва», «Таблиця 1.2 – Назва» ---
\numberwithin{figure}{section}
\numberwithin{table}{section}
\numberwithin{equation}{section}

\DeclareCaptionLabelSeparator{kpidash}{ -- }
% «з абзацного відступу» (ДСТУ 3008 7.6.8); margin= is ignored by longtable captions.
\DeclareCaptionFormat{kpiindent}{\hspace*{1.25cm}#1#2#3\par}
\captionsetup*[figure]{
  name=Рисунок,
  labelsep=kpidash,
  justification=centering,
}
\captionsetup*[table]{
  name=Таблиця,
  labelsep=kpidash,
  format=kpiindent,
  justification=raggedright,
  singlelinecheck=false,
}
\RequirePackage{kpi-thesis-tables}
\RequirePackage{kpi-thesis-where}

% --- Lists: «–» for plain lists; «а)» then «1)» for referenced lists ---
\RequirePackage{kpi-thesis-lists}

% Underlined full-width item, used on the assignment form.
\newcommand{\underitem}[1]{%
  \item
  \uline{\arabic{enumi})\hspace{0.3cm}#1}%
  \leaders\hbox{\rule[-\ULdepth]{1pt}{\ULthickness}}\hfill\kern0pt%
}

% --- Bibliography: «1) Опис», department guide appendix Ж ---
\addto\captionsukrainian{\renewcommand{\refname}{СПИСОК ВИКОРИСТАНИХ ДЖЕРЕЛ}}
\renewcommand{\@biblabel}[1]{#1)}
\renewenvironment{thebibliography}[1]
  {\structural{\refname}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
     {%
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
      \renewcommand{\theenumiv}{\@arabic\c@enumiv}%
      \settowidth{\labelwidth}{\@biblabel{#1}}%
      \labelsep=0.5em
      \leftmargin=0cm
      \itemindent=\dimexpr\parindent+\labelwidth+\labelsep\relax
      \itemsep=0pt \parsep=0pt \topsep=0pt \partopsep=0pt
     }%
   \sloppy
   \clubpenalty4000
   \widowpenalty4000
   \sfcode`\.=\@m}
  {\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
   \global\c@kpi@sources=\c@enumiv
   \endlist}

% --- Appendices: «Додаток А» on its own line, the title under it ---
\newif\ifkpi@inappendix
\NewDocumentCommand\appendices{}{%
  \clearpage
  \global\kpi@inappendixtrue
  \setcounter{section}{0}%
  \renewcommand\thesection{\ukrAlph{section}}%
  \renewcommand\thefigure{\thesection.\arabic{figure}}%
  \renewcommand\thetable{\thesection.\arabic{table}}%
  \renewcommand\theequation{\thesection.\arabic{equation}}%
}
\RenewDocumentCommand\appendix{o m}{%
  \clearpage
  \refstepcounter{section}%
  \global\advance\c@kpi@appendices\@ne
  \IfValueT{#1}{\label{#1}}%
  \ifkpi@appinline
    {\centering Додаток \thesection.\ \textbf{#2}\par}%
  \else
    {\centering Додаток \thesection\par\nopagebreak
     \vspace{0.5\baselineskip}\nopagebreak
     \textbf{#2}\par}%
  \fi
  \addcontentsline{toc}{section}{Додаток \thesection\ #2}%
  \vspace{\baselineskip}%
}
% A ready-made document (similarity report, ...) as an appendix: title sheet, then its pages.
\NewDocumentCommand\appendixpdf{o m m}{%
  \appendix[#1]{#2}%
  \includepdf[pages=-,pagecommand={\thispagestyle{fancy}}]{#3}%
}

% --- Program listings: monospace 8 pt, single spacing (guide §5.7) ---
% \setstretch goes first: it reselects the current font size and would undo \fontsize.
\lstdefinestyle{kpicode}{
  basicstyle=\setstretch{1}\ttfamily\fontsize{8}{9}\selectfont,
  keywordstyle=\bfseries,
  commentstyle=\itshape\color{gray},
  showstringspaces=false,
  columns=fullflexible,
  keepspaces=true,
  breaklines=true,
  tabsize=4,
  frame=none,
  numbers=none,
  extendedchars=true,
  aboveskip=0.5\baselineskip,
  belowskip=0.5\baselineskip,
}
\lstset{style=kpicode}
% listings under XeLaTeX moved punctuation next to Cyrillic in strings and comments, so files
% go through fvextra: \codeinput[firstline=10, lastline=40]{../../app/main.py}, or the Verbatim
% environment. Options are \VerbatimInput's; fontsize= overrides the 8 pt default.
\fvset{fontsize=\setstretch{1}\fontsize{8}{9}\selectfont, breaklines=true, breakanywhere=true}
\NewDocumentCommand\codeinput{O{} m}{\VerbatimInput[#1]{#2}}

% --- Totals for the annotation and the project sheet («Відомість») ---
\RequirePackage{kpi-thesis-stats}

% Placeholder that stays visible in the PDF; `just check` lists every one left.
\NewDocumentCommand\todo{m}{\textcolor{red}{[#1]}}

% «Файл path» + «Реалізація функціональної задачі ...» headings in the program text.
\NewDocumentCommand\codefile{m m}{%
  \par\bigskip\noindent\textbf{Файл }\path{#1}\par
  \noindent Реалізація функціональної задачі #2.\par
}

% --- Where a coursework guide differs from the diploma one: \kpisetup{...} in the preamble ---
%   left-margin    = 20mm     % default 30 mm (diploma guide)
%   hyphenation    = false    % no word breaks (also hides the Underfull noise that follows)
%   enumerate      = arabic   % «1)», nested «а)»; default «а)», nested «1)»
%   table-caption  = left     % from the left edge; default from the paragraph indent
%   appendix-title = inline   % «Додаток А. Назва» on one line; default two lines
%   url-breaks     = anywhere % xurl: a URL may break at any character; default after / . - _
%   algorithms                % algorithm + algpseudocode, «Алгоритм 1.1 – Назва» like tables
\newif\ifkpi@appinline
\def\kpi@nohyphenation{%
  \hyphenpenalty=10000 \exhyphenpenalty=10000
  \emergencystretch=3em \hbadness=10000 }
\def\kpi@arabiclists{%
  \setlist[enumerate,1]{label=\arabic*)}%
  \setlist[enumerate,2]{label=\ukralph*)}}
\def\kpi@leftcaptions{%
  \captionsetup*[table]{format=plain, justification=justified, singlelinecheck=false}}
\def\kpi@algorithms{%
  \RequirePackage{algorithm}%
  \RequirePackage[noend]{algpseudocode}%
  \floatname{algorithm}{Алгоритм}%
  \floatplacement{algorithm}{H}%
  \numberwithin{algorithm}{section}%
  \captionsetup*[algorithm]{labelsep=kpidash, justification=raggedright, singlelinecheck=false}}
\ExplSyntaxOn
\keys_define:nn { kpi / setup }
  {
    left-margin    .code:n = { \geometry { left = #1 } },
    hyphenation    .choices:nn = { true, false }
      { \int_compare:nNnT { \l_keys_choice_int } = { 2 } { \kpi@nohyphenation } },
    enumerate      .choices:nn = { alph, arabic }
      { \int_compare:nNnT { \l_keys_choice_int } = { 2 } { \kpi@arabiclists } },
    table-caption  .choices:nn = { indent, left }
      { \int_compare:nNnT { \l_keys_choice_int } = { 2 } { \kpi@leftcaptions } },
    appendix-title .choices:nn = { separate, inline }
      { \int_compare:nNnT { \l_keys_choice_int } = { 2 } { \kpi@appinlinetrue } },
    url-breaks     .choices:nn = { symbols, anywhere }
      { \int_compare:nNnT { \l_keys_choice_int } = { 2 } { \RequirePackage{xurl} } },
    algorithms     .code:n = { \kpi@algorithms },
    algorithms     .value_forbidden:n = true,
  }
\NewDocumentCommand \kpisetup { m } { \keys_set:nn { kpi / setup } { #1 } }
\ExplSyntaxOff
\@onlypreamble\kpisetup

\RequirePackage[hidelinks]{hyperref}

\endinput
