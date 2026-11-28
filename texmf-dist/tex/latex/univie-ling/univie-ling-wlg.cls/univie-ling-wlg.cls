%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-wlg
%%
%% A layout suitable for the journal Wiener Linguistische Gazette (WLG)
%% (https://www.wlg.univie.ac.at/).
%%
%% This file is part of the univie-ling LaTeX bundle, consisting of:
%%  -- univie-ling-handout.cls: Class for Handouts
%%  -- univie-ling-expose.cls: Class for PhD Research Proposals
%%  -- univie-ling-paper.cls: Class for student papers
%%  -- univie-ling-poster.cls: Class for scientific posters
%%  -- univie-ling-thesis.cls: Class for BA, MA or PhD theses
%%  -- univie-ling-wlg.cls: Class for the journal Wiener Linguistische Gazette (this file)
%%  -- univielogo.pdf: University of Vienna logo (colored)
%%  -- univielogo-sw.pdf: University of Vienna logo (black/white)
%%  -- univie-ling-wlg-logo.pdf: Logo of the journal Wiener Linguistische Gazette
%%  -- univie-ling.bbx: Biblatex bibliography style
%%  -- univie-ling.cbx: Biblatex citation style
%%
%% Author: Juergen Spitzmueller
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%
%% This work has the LPPL maintenance status "maintained".
%% 
%% The Current Maintainer of this work is Juergen Spitzmueller.
%% Please report issues to https://codeberg.org/jspitz/univie-ling/issues
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesPackage{univie-ling-wlg}[2026/11/20 v.2.10 Univie WLG journal layout (JSp)]


%% ============================================================
%% CLASS OPTIONS:
%% ============================================================

\newif\if@wlg@biblatex\@wlg@biblatexfalse
\newif\if@wlg@covington\@wlg@covingtontrue
\newif\if@wlg@draftmark\@wlg@draftmarkfalse
\newif\if@wlg@draftmarkfp\@wlg@draftmarkfpfalse
\newif\if@wlg@expert\@wlg@expertfalse
\newif\if@wlg@titlepage\@wlg@titlepagefalse
\newif\if@wlg@specialprint\@wlg@specialprintfalse
\newif\if@wlg@review\@wlg@reviewfalse

% Define keys and values
\DeclareKeys[wlg]
{
    % biblatex=<true|false>
    % Load biblatex
    biblatex.legacy_if_set:n = @wlg@biblatex,
    biblatex.usage:n = preamble,
    % covington=<true|false>
    % Load covington
    covington.legacy_if_set:n = @wlg@covington,
    covington.usage:n = preamble,
    % expertfonts=<true|false>
    % Load MinionPro
    expertfonts.legacy_if_set:n = @wlg@expert,
    expertfonts.usage:n = preamble,
    % preprint=<true|false>
    preprint.legacy_if_set:n = @wlg@preprint,
    preprint.usage:n = preamble,
    % type=<paper|review>
    type .choice:,
    % paper
    type / paper .code:n = 
      { 
        \@wlg@reviewfalse
      },
    % review
    type / review .code:n = 
      { 
        \@wlg@reviewtrue
      },
    % no val equals paper
    type .default:n = {paper},
    % peerrev=<true|false>
    peerrev.legacy_if_set:n = @wlg@peerrev,
    peerrev.usage:n = preamble,
    % titlepage=<none|specialprint|issue>
    titlepage .choice:,
    % none
    titlepage / none .code:n = 
      { \@wlg@titlepagefalse
        \@wlg@specialprintfalse
      },
    % specialprint
    titlepage / specialprint .code:n = 
      { \@wlg@titlepagetrue
        \@wlg@specialprinttrue
      },
    % issue
    titlepage / issue .code:n = 
      { \@wlg@titlepagetrue
        \@wlg@specialprintfalse
      },
    % draftmark=<true|false|firstpage>
    % Print draftmark
    draftmark .choice:,
    % true
    draftmark / true .code:n = 
      { \@wlg@draftmarktrue
        \@wlg@draftmarkfpfalse
      },
    % false
    draftmark / false .code:n = 
      { \@wlg@draftmarkfalse
        \@wlg@draftmarkfpfalse
      },
    % firstpage
    draftmark / firstpage .code:n = 
      { \@wlg@draftmarktrue
        \@wlg@draftmarkfptrue
      },
    % no val equals to true
    draftmark .default:n = {true},
}

\ProcessKeyOptions[wlg]


%% ============================================================
%% BASE CLASS:
%% ============================================================

\LoadClass[12pt]{article}

%% ============================================================
%% PAGE LAYOUT:
%% ============================================================

\RequirePackage[
    footlines=2,
    paper=152mm:229mm,
    DIV=calc,
    twoside=semi
]{typearea}

\recalctypearea

% Headings and pagination:
% (fancyhdr)
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\RequirePackage{fancyhdr}
\fancyhf{}
\fancyhead[LE,RO]{\small\rmfamily\thepage}
\pagestyle{fancy}

%% ============================================================
%% CONFIGURATION:
%% ============================================================

% Current structure
\newcommand*\jedboard[1]{\def\wlg@jedboard{#1}}
\newcommand*\jeditors[1]{\def\wlg@jeditors{#1}}
% Old structure
\newcommand*\edboardAL[1]{\def\wlg@edboardAL{#1}}
\newcommand*\edboardGL[1]{\def\wlg@edboardGL{#1}}
\newcommand*\edboardHL[1]{\def\wlg@edboardHL{#1}}
\newcommand*\techboard[1]{\def\wlg@techboard{#1}}

\InputIfFileExists{univie-ling-wlg.cfg}

%% ============================================================
%% HELPERS:
%% ============================================================

\newif\if@wlg@inputeencloaded\@wlg@inputeencloadedfalse
\newcommand*\AfterInputencOrAtEndPreamble[1]{%
    \AddToHook{package/inputenc/after}{%
       #1%
      \@wlg@inputeencloadedtrue
    }
    \AddToHook{begindocument/before}{%
       \if@wlg@inputeencloaded\else
          #1%
       \fi%
   }%
}

%% ============================================================
%% FONTS UND MICROTYPOGRAPHY:
%% ============================================================

\if@wlg@expert
  % Roman Font: Adobe Minion (Expert)
  \RequirePackage[footnotefigures]{MinionPro}
  % Sans; Myriad
  \RequirePackage[medfamily,scale=0.925]{MyriadPro}
  % Mono: DejaVu
  \RequirePackage[scaled=0.83]{DejaVuSansMono}
\else
  % Roman Font: Crimson
  \RequirePackage[osf]{cochineal}
  % Enable bold and slanted in IPA
  \AddToHook{package/tipa/after}{%
     \DeclareFontFamilySubstitution{T3}{Cochineal-TOsF}{cmr}
  }
  % Sans: Alegreya
  \RequirePackage[osf,scaled=.9]{sourcesans}
  % Mono: DejaVu
  \RequirePackage[scaled=0.8]{DejaVuSansMono}
\fi

% Hyperlinks
\RequirePackage{url}
\newcommand{\urlprefix}{}
% Italic URLs
\def\UrlFont{\rmfamily\itshape}

% Format URL dates
\def\wlg@urldate{}
\newcommand*\SetURLDate[1]{\gdef\wlg@urldate{#1}}
\AddToHook{begindocument}{
  \RequirePackage[english,ngerman]{isodate}
  \numdate
  \providecommand*\urldate[1]{[\translate{urlaccess} \printdate{#1}]}
  % Convenience function
  \NewDocumentCommand\weblink{mo}{%
    \url{#1}%
    \IfNoValueTF{#2}%
        {\ifx\wlg@urldate\empty\else%
         \ \urldate{\wlg@urldate}%
        \fi}%
        {\ \urldate{#2}}%
  }
}

% Microtype tweaks
\RequirePackage{microtype}

% Full capitals (slightly scaled and tracked):
\RequirePackage{scalefnt}
\RequirePackage{textcase}
\DeclareRobustCommand*\versal[1]{%
  \textls{\MakeTextUppercase{\scalefont{.92}#1}}%
}

% Fix for \slash macro, courtesy of Donald Arsenau
\def\slash{/\penalty\exhyphenpenalty\hskip\z@skip}

% Better ragged text
\RequirePackage{ragged2e}


%% ============================================================
%% ACCESSIBILITY
%% ============================================================

\RequirePackage{xcolor}
\RequirePackage{graphicx}

%% Check if \DocumentMetadata is being used
\newif\if@wlg@useDocumentMetadata
\ifx\IfDocumentMetadataT\@undefined\else
    \IfDocumentMetadataT{\global\@wlg@useDocumentMetadatatrue}%
\fi

% Tagging
\newif\if@wlg@tagging
\@wlg@taggingfalse
\AddToHook{package/tagpdf/after}{%
   \@ifpackagelater{graphicx}{2024/12/31}{
      \tagpdfsetup
        {
          page/exclude-header-footer=pagination,
          role/user-NS=univie-ling-wlg,
          role/new-tag=FrontMatter/Part,
          role/new-tag=Imprint/Part,
          role/new-tag=TitleBlock/Part,
          role/new-tag=motto/BlockQuote,
          role/new-tag=keywords/P,
          role/new-tag=expression/Span,
          role/new-tag=concept/Span,
          role/new-tag=meaning/Span,
       }
      \@wlg@taggingtrue
   }{}
}

% Explicit line break that keeps a real space character in the tagged
% text. tagpdf only adds spaces for ordinary interword glue, so a plain \\
% makes words run together in the structure text (screen reader, braille).
\DeclareRobustCommand*\wlg@nl{\if@wlg@tagging\unskip\char"20 \fi\\}

% Same, but the tagged text gets a separator (ActualText) instead of a bare
% space, e.g. \wlg@nls{: }: the layout shows a line break only, while
% screen readers and braille read "Author: Title".
% The Span needs an MC of its own: otherwise its (space) character stays in
% the surrounding MC and the ActualText ends up behind the whole text in the
% reading order ("Author Title Subtitle: :").
\ExplSyntaxOn
\cs_new_protected:Npn \wlg@nls@sep #1
  {
    \if@wlg@tagging
      \unskip
      \tag_mc_end_push:
      \tagstructbegin { tag=Span , actualtext={#1} }
      \tagmcbegin { }
      \char"20 \scan_stop:
      \tagmcend
      \tagstructend
      \tag_mc_begin_pop:n { }
    \fi
  }
\ExplSyntaxOff
\DeclareRobustCommand*\wlg@nls[1]{\wlg@nls@sep{#1}\\}

% Variant with a fixed 5pt skip (author/title in toc entries). No optional
% argument, since the kernel purifies the toc text (title of the TOCI
% structure) and would keep a literal "[5pt]".
\DeclareRobustCommand*\wlg@nlsa[1]{\wlg@nls@sep{#1}\\[5pt]}

\newcommand*\wlg@license@logo{%
  \if@wlg@tagging%
    \includegraphics[alt={Logo Creative-Commons-Lizenz CC BY-NC-ND 4.0}, width=8em]{univie-ling-wlg-license}%
  \else%
    \includegraphics[width=8em]{univie-ling-wlg-license}%
  \fi%
}

\newcommand*\wlg@logo{%
  \if@wlg@tagging%
    \includegraphics[alt={Logo [WLG] Wiener Linguistische Gazette}]{univie-ling-wlg-logo}%
  \else%
    \includegraphics{univie-ling-wlg-logo}%
  \fi%
}


%% ============================================================
%% LOCALIZATION
%% ============================================================

\RequirePackage{translator}
\languagealias{austrian}{German}
\languagealias{german}{German}
\languagealias{german-at}{German}
\languagealias{german-ch}{German}
\languagealias{german-de}{German}
\languagealias{german-at-1901}{German}
\languagealias{german-ch-1901}{German}
\languagealias{german-de-1901}{German}
\languagealias{german-austria}{German}
\languagealias{german-germany}{German}
\languagealias{german-switzerland}{German}
\languagealias{german-austria-1901}{German}
\languagealias{german-germany-1901}{German}
\languagealias{german-switzerland-1901}{German}
\languagealias{naustrian}{German}
\languagealias{ngerman}{German}
\languagealias{nswissgerman}{German}
\languagealias{swissgerman}{German}
\deftranslation[to=German]{chapter}{Kapitel}
\deftranslation[to=English]{chapter}{chapter}
\deftranslation[to=German]{draft}{ENTWURF}
\deftranslation[to=English]{draft}{DRAFT}
\deftranslation[to=German]{section}{Abschnitt}
\deftranslation[to=English]{section}{section}
\deftranslation[to=German]{footnote}{Anm.}
\deftranslation[to=English]{footnote}{fn.}
\deftranslation[to=German]{example}{Beispiel}
\deftranslation[to=English]{example}{example}
\deftranslation[to=German]{argumentation}{Argumentation}
\deftranslation[to=English]{argumentation}{argumentation}
\deftranslation[to=German]{issue}{Ausgabe}
\deftranslation[to=English]{issue}{Issue}
\deftranslation[to=German]{review}{Rezension}
\deftranslation[to=English]{review}{Review}
\deftranslation[to=German]{reviewedby}{Besprochen von}
\deftranslation[to=English]{reviewedby}{Reviewed by}
\deftranslation[to=German]{univie}{Universit\"at Wien}
\deftranslation[to=English]{univie}{University of Vienna}
\deftranslation[to=German]{lingdep}{Institut f\"ur Sprachwissenschaft}
\deftranslation[to=English]{lingdep}{Department of Linguistics}
\deftranslation[to=German]{published}{Publiziert am}
\deftranslation[to=English]{published}{Published}
\deftranslation[to=German]{specialprint}{Sonderdruck aus:}
\deftranslation[to=English]{specialprint}{Special print from:}
\deftranslation[to=German]{peerrev}{Die Beitr\"age dieser Ausgabe wurden einer Doppelblindbegutachtung unterzogen.}
\deftranslation[to=English]{peerrev}{The papers of this issue have undergone double-blind peer review.}
\deftranslation[to=German]{preprintfrom}{Vorabdruck aus:}
\deftranslation[to=English]{preprintfrom}{Preprint from:}
\deftranslation[to=German]{preprint}{Vorabdruck}
\deftranslation[to=English]{preprint}{Preprint}
\deftranslation[to=German]{specialissue}{Themenheft}
\deftranslation[to=English]{specialissue}{Special Issue}
\deftranslation[to=German]{keywords}{Schlagw\"orter}
\deftranslation[to=English]{keywords}{Keywords}
\deftranslation[to=German]{corrauthor}{Korrespondenzautor}
\deftranslation[to=English]{corrauthor}{Corresponding author}
\deftranslation[to=German]{corrauthorf}{Korrespondenzautorin}
\deftranslation[to=English]{corrauthorf}{Corresponding author}
\deftranslation[to=German]{corrauthors}{Korrespondenzautoren}
\deftranslation[to=English]{corrauthors}{Corresponding authors}
\deftranslation[to=German]{edby}{Hg.\,v.}
\deftranslation[to=English]{edby}{Ed.\,by}
\deftranslation[to=German]{imp-editor}{Eigent\"umer, Herausgeber und Verleger}
\deftranslation[to=English]{imp-editor}{Owner, editor and publisher}
\deftranslation[to=German]{univie-address}{Sensengasse 3a\wlg@nl 1090 Wien\wlg@nl\"Osterreich}
\deftranslation[to=English]{univie-address}{Sensengasse 3a\wlg@nl 1090 Vienna\wlg@nl Austria}
\deftranslation[to=German]{edboard}{Redaktion}
\deftranslation[to=English]{edboard}{Editorial board}
\deftranslation[to=German]{jeditors}{Redaktion}
\deftranslation[to=English]{jeditors}{Editors}
\deftranslation[to=German]{jedboard}{Redaktioneller Beirat}
\deftranslation[to=English]{jedboard}{Editorial board}
\deftranslation[to=German]{techboard}{Technische Redaktion}
\deftranslation[to=English]{techboard}{Technical editor}
\deftranslation[to=German]{contact}{Kontakt}
\deftranslation[to=English]{contact}{Contact}
\deftranslation[to=German]{appform}{Die \emph{Wiener Linguistische Gazette} erscheint in loser Folge
                                     im Open-Access-Format.\wlg@nl
                                     Alle Ausgaben ab Nr. 72 (2005) sind online verf\"ugbar.}
\deftranslation[to=English]{appform}{The \versal{WLG} journal is published in loose sequence and in
                                      open access format.\wlg@nl
                                      All issues as of 72 (2005) are available online.}
\deftranslation[to=German]{applied}{Angewandte Sprachwissenschaft}
\deftranslation[to=English]{applied}{Applied Linguistics}
\deftranslation[to=German]{genhist}{Allgemeine Sprachwissenschaft}
\deftranslation[to=German]{general}{Allgemeine Sprachwissenschaft}
\deftranslation[to=German]{hist}{Historische Sprachwissenschaft}
\deftranslation[to=English]{genhist}{General and Historical Linguistics}
\deftranslation[to=English]{general}{General Linguistics}
\deftranslation[to=English]{hist}{Historical Linguistics}
\deftranslation[to=German]{license}{Dieses Werk unterliegt der Creative-Commons-Lizenz
                                    \href{https://creativecommons.org/licenses/by-nc-nd/4.0/deed.de}{CC BY-NC-ND 4.0}\wlg@nl
                                    (Namensnennung -- Nicht kommerziell -- Keine Bearbeitungen)}
\deftranslation[to=English]{license}{This work is published under a Creative Commons
                                    \href{https://creativecommons.org/licenses/by-nc-nd/4.0/deed.en}{CC BY-NC-ND 4.0} license\wlg@nl
                                    (Attribution-NonCommercial-NoDerivatives)}
\deftranslation[to=German]{urlaccess}{Abruf am:}
\deftranslation[to=English]{urlaccess}{last accessed:}


\AddToHook{begindocument}{%
  \addto\captionsngerman{\renewcommand*\contentsname{Inhalt}}%
  \addto\captionsnaustrian{\renewcommand*\contentsname{Inhalt}}%
  \addto\captionsgerman{\renewcommand*\contentsname{Inhalt}}%
  \addto\captionsaustrian{\renewcommand*\contentsname{Inhalt}}%
}

% Special description list for editorial board
\newlength{\edblength}
\newcommand*\ebdlabel[1]{\makebox[\labelwidth][r]{\normalfont\bfseries #1\hfill}}
\newenvironment{wlgedboard}[1][\translate{jedboard}:]
  {\list{}%
        {\settowidth\edblength{\textbf{#1}}
         \setlength\leftmargin{\edblength}
         \addtolength\leftmargin{\labelsep}
         \setlength\labelwidth{\edblength}
         \setlength\itemsep{0pt}
         \setlength\parsep{0pt}
         \setlength\parskip{0pt}
         \let\makelabel\ebdlabel}
  }
  {\endlist}

\newlength\wlg@license@width

\newcommand\impressum{%
  \bgroup
  \scriptsize
  \noindent\textbf{\translate{imp-editor}:}\wlg@nl
  \translate{univie}, \translate{lingdep}\wlg@nl
  \translate{univie-address}
  \vspace*{-.5em}
  \begin{wlgedboard}
    \def\wlg@lb{}
    \ifcsname wlg@edboardAL\endcsname
      \item[\textbf{\translate{edboard}:}]
        \ifcsname wlg@edboardGL\endcsname
           \wlg@edboardGL\ (\translate{general}),%
           \def\wlg@lb{\wlg@nl}%
        \fi
        \ifcsname wlg@edboardAL\endcsname
           \wlg@lb\wlg@edboardAL\ (\translate{applied}),%
           \def\wlg@lb{\wlg@nl}%
        \fi
        \ifcsname wlg@edboardHL\endcsname
           \wlg@lb\wlg@edboardHL\ (\translate{hist})
        \fi
    \else
      \ifcsname wlg@jeditors\endcsname
        \item[\textbf{\translate{jeditors}:}]
            \wlg@jeditors%
      \fi
      \ifcsname wlg@jedboard\endcsname
        \item[\textbf{\translate{jedboard}:}]
           \wlg@lb\wlg@jedboard%
      \fi
    \fi
    \ifcsname wlg@techboard\endcsname
       \item[\textbf{\translate{techboard}:}] \wlg@techboard
    \fi
    \item[\textbf{\translate{contact}:}] \href{mailto:wlg@univie.ac.at}{wlg@univie.ac.at}
    \item[\textbf{Homepage:}] \expandafter\url{\wlgurl}
  \end{wlgedboard}
  \vspace*{-2em}
  \begin{wlgedboard}[\textbf{\textsc{issn}:}]
    \item[\textbf{\textsc{issn}:}] 2224-1876
    \item[\textbf{\textsc{nbn}:}] BI,078,1063
  \end{wlgedboard}
  \vspace*{-.5em}
  \if@wlg@peerrev
    \noindent\translate{peerrev}\par\vspace*{.5em}
  \fi
  \noindent\translate{appform}\par
  \setlength{\wlg@license@width}{\textwidth-9em}%
  \begin{center}
        \begin{minipage}{8em}
          \wlg@license@logo%
        \end{minipage}
        \hfill
        \begin{minipage}{\wlg@license@width}
          \translate{license}%
        \end{minipage}
  \end{center}
  \par
  \egroup
}


%% ============================================================
%% TOC
%% ============================================================

% The table of contents uses the standard \tableofcontents/\@starttoc with
% own \l@part and \l@chapter instead of etoc: the kernel tags it as
% TOC/TOCI, whereas etoc (own line styles) bypasses the kernel tagging.
\if@wlg@specialprint\else
  \providecommand*\toclevel@chapter{0}
  \renewcommand*\l@part[2]{%
    \addvspace{12pt}%
    {\parindent\z@ \raggedright \normalsize\bfseries\rmfamily
     \leavevmode #1\par}%
    \nobreak\vspace{10pt}}
  \newcommand*\wlg@l@chapter[2]{%
    \@dottedtocline{0}{0em}{0em}{\normalsize\mdseries\rmfamily #1}{#2}%
    \vspace{10pt}}
  % smaller variant for the table of contents on the title page
  \newcommand*\wlg@l@chapter@small[2]{%
    \@dottedtocline{0}{0em}{0em}{\scriptsize\mdseries\rmfamily #1}%
      {\scriptsize #2}%
    \vspace{8pt}}
  \let\l@chapter\wlg@l@chapter
  \setcounter{tocdepth}{0}
\fi


%% ============================================================
%% STRUCTURE
%% ============================================================

% Macrotypographic sectioning
\newif\if@wlg@mainmatter\@wlg@mainmattertrue
\newif\if@wlg@frontmatter\@wlg@frontmatterfalse
\newcommand*\frontmatter{%
  \if@twoside\cleardoubleoddpage\else\clearpage\fi
  \@wlg@mainmatterfalse\@wlg@frontmattertrue\pagenumbering{roman}%
  \def\computelastpage{\pageref{TotPages}}%
  \edef\startpageref{%
    \romannumeral\thestartpage\relax}%
}
\newcommand*\mainmatter{%
  \if@twoside\cleardoubleoddpage\else\clearpage\fi%
  \immediate\write\@auxout{\noexpand\newlabel{LastFrontPage}{{}{\arabic{page}}}}%
  \@wlg@mainmattertrue\@wlg@frontmatterfalse%
  \pagenumbering{arabic}%
  \def\computelastpage{\pageref{TotPages}}%
  \def\startpageref{\thestartpage}%
}
\newcommand*\backmatter{%
  \if@openright\cleardoubleoddpage\else\clearpage\fi\@wlg@mainmatterfalse\@wlg@frontmatterfalse%
  \def\computelastpage{\pageref{TotPages}}%
  \def\startpageref{\thestartpage}%
}

% No widows and orphans
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty = 10000
\vfuzz \hfuzz
\raggedbottom

% Quotation marks
\AfterInputencOrAtEndPreamble{%
  \RequirePackage{csquotes}
  \ExecuteQuoteOptions{autostyle=try,german=guillemets,austrian=guillemets,maxlevel=3}
  \AfterPackage*{biblatex}{%
     % Change cite command for integrated csquotes env.
     \SetCiteCommand{\parencite}
  }
  \renewcommand{\mktextdel}[1]{[\,]}
}

% Conditional page break
\def\condbreak#1{%
\vskip 0pt plus #1\pagebreak[3]\vskip 0pt plus -#1\relax}

% sectioning
% Heading sizes as in KOMA-Script's headings=small:
% \LARGE for \part (title and number), \normalsize for all other
% levels. subsubsection, paragraph and subparagraph of the standard classes
% are \normalsize\bfseries already.
\def\wlg@partfont{\LARGE\bfseries}
\def\wlg@sectionfont{\normalfont\normalsize\bfseries}

\if@wlg@useDocumentMetadata
  \EditInstance{heading}{part}%
     {
      text-decls=\wlg@partfont,
      number-decls=\wlg@partfont,
      title-decls=\wlg@partfont
     }
  \EditInstance{heading}{section}%
     {
      text-decls=\wlg@sectionfont,
      number-decls=\wlg@sectionfont,
      title-decls=\wlg@sectionfont
     }
  \EditInstance{heading}{subsection}%
     {
      text-decls=\wlg@sectionfont,
      number-decls=\wlg@sectionfont,
      title-decls=\wlg@sectionfont
     }
\else
  % section/subsection use \@startsection, which is also supported (via a
  % compatibility layer) if the kernel heading templates are active
  \renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {-3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\wlg@sectionfont}}
  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\wlg@sectionfont}}
  \def\@part[#1]#2{%
      \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{part}%
        \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
      \else
        \addcontentsline{toc}{part}{#1}%
      \fi
      {\parindent \z@ \raggedright
       \interlinepenalty \@M
       \normalfont
       \ifnum \c@secnumdepth >\m@ne
         \wlg@partfont \partname\nobreakspace\thepart
         \par\nobreak
       \fi
       \wlg@partfont #2%
       \markboth{}{}\par}%
      \nobreak
      \vskip 3ex
      \@afterheading}
  \def\@spart#1{%
      {\parindent \z@ \raggedright
       \interlinepenalty \@M
       \normalfont
       \wlg@partfont #1\par}%
       \nobreak
       \vskip 3ex
       \@afterheading}
\fi


%% ============================================================
%% TITLING
%% ============================================================

\RequirePackage{totpages}
\RequirePackage{refcount}
\def\computelastpage{\pageref{TotPages}}%
\def\lastpageref{\computelastpage}%
\def\startpageref{\thestartpage}%

\AtEndOfClass{%
  \RequirePackage{hyperref}
  \hypersetup{%
     bookmarksnumbered=true,
     colorlinks=false,
     pdfborder={0 0 0}
  }%
}

\let\@author\@empty
\let\@@author\@empty
\let\@pdf@author\@empty
\newcounter{numauthors}
\RenewDocumentCommand\author{om}
{%
    \IfNoValueTF{#1}{
        \mkauthors{#2}{#2}
    }{
        \mkauthors{#1}{#2}
    }
}

\NewDocumentCommand\mkauthors{>{\SplitList{\and}}m>{\SplitList{\and}}m}
{%
  \setcounter{numauthors}{0}%
  \ProcessList{#1}{\@@mkauthors}%
  \setcounter{numauthors}{0}%
  \ProcessList{#2}{\@mkauthors}%
}
  
\newcommand\@mkauthors[1]{%
  \ifnum\value{numauthors}=0
    \edef\@author{\unexpanded{#1}}
    \edef\@pdf@author{\unexpanded{#1}}%
  \else
     \edef\@author{\expandonce\@author\unexpanded{\slash#1}}%
     \edef\@pdf@author{\expandonce\@pdf@author\unexpanded{; #1}}%
  \fi
  \stepcounter{numauthors}
}

\newcommand\@@mkauthors[1]{%
  \ifnum\value{numauthors}=0
    \edef\@@author{\unexpanded{#1}}
  \else
     \edef\@@author{\expandonce\@@author\unexpanded{\slash#1}}%
  \fi
  \stepcounter{numauthors}
}

% Author affiliation (starred: corresponding author)
\DeclareExpandableDocumentCommand{\aff}{ s O{} m }
{%
  \texorpdfstring
    {\IfBooleanTF{#1}{\@@aff}{\@aff}[#2]{#3}}
    {}%
}

% Empty (will be redefined in the article title)
\newcommand*\@@aff[2][]{}
\newcommand*\@aff[2][]{}

\def\@title{}
\def\@@title{}
\renewcommand*\title[2][]{%
    \ifx\\#1\\%
        \def\@@title{#2}
    \else
        \def\@@title{#1}
    \fi
    \def\@title{#2}
}

\def\@subtitle{}
\newcommand*\subtitle[1]{%
    \def\@subtitle{#1}
}

\def\@issuetitle{}
\newcommand*\issuetitle[1]{%
    \def\@issuetitle{#1}
}
\def\@issuesubtitle{}
\newcommand*\issuesubtitle[1]{%
    \def\@issuesubtitle{#1}
}
\def\@issueeditors{}
\newcommand*\issueeditors[1]{%
    \def\@issueeditors{#1}
}

\def\@issue{}
\def\@pubyear{}
\newcommand\issue[2]{\def\@issue{#1}\def\@pubyear{#2}}

\newif\if@wlg@titlepageneeded\@wlg@titlepageneededtrue
\newif\if@wlg@startpageset\@wlg@startpagesetfalse

\def\ljobname{\jobname}

\renewcommand*\maketitle[1][1]{%
  \if@wlg@review
     \ifx\@subtitle\@empty\else
        \ClassWarning{univie-ling-wlg}{subtitle is not supported with type=review}%
        \global\let\@subtitle\@empty%
     \fi%
  \fi
  \if@wlg@titlepage
    \if@wlg@tagging
      \tagstructbegin{tag=FrontMatter}
    \fi
    \@maketitlepage[#1]%
    \if@wlg@tagging
      \tagstructend
    \fi
    \if@wlg@mainmatter
      \pagenumbering{arabic}
    \fi
  \fi
  \if@wlg@startpageset\else
   \setcounter{page}{\thestartpage}
   \global\@wlg@startpagesettrue
  \fi
  \fancyhead[RE]{\small\rmfamily\@@author}
  \translatelet{\@revtitle}{review}%
  \fancyhead[LO]{\small\rmfamily\if@wlg@review\@revtitle\ \enquote{\@@title}\else\@@title\fi}
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyfoot[R]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
    \if@wlg@tagging
       \fancyfoot[LO]{\scriptsize{\ResumeTagging{foot}\tagmcend\expandafter\url{\wlgurl/fileadmin/user_upload/p_wlg/\@issue\@pubyear/\ljobname.pdf}\\
           \tagmcbegin{artifact}\SuspendTagging{foot}}\translate{published} \ifx\@subtitle\@empty\today\else\@date\fi}%
    \else
       \fancyfoot[LO]{\scriptsize\expandafter\url{\wlgurl/fileadmin/user_upload/p_wlg/\@issue\@pubyear/\ljobname.pdf}\\
            \translate{published} \ifx\@subtitle\@empty\today\else\@date\fi}%
  \fi
  }
    \par
    \@tempcnta=%
    #1%
    \relax\ifnum\@tempcnta=1\else
      \ClassWarning{univie-ling-wlg}{%
        Optional argument of \string\maketitle\space ignored
        at\MessageBreak
        notitlepage-mode%
      }%
    \fi
    \begingroup
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}
       \@maketitle
       \thispagestyle{plain}\@thanks
    \endgroup
  \renewcommand*\@@aff[2][]{}
  \renewcommand*\@aff[2][]{}
  \DeclareExpandableDocumentCommand{\aff}{ s O{} m }{}
  \if@wlg@review
        \hypersetup{pdfauthor=\@pdf@author,
                  pdftitle={\@revtitle\ \enquote{\@@title} -- WLG \@issue\ (\@pubyear)}}
  \else
      \hypersetup{pdfauthor=\@pdf@author,
                  pdftitle={\@@title\ -- WLG \@issue\ (\@pubyear)}}
  \fi
  \ifx\@subtitle\@empty\else
    \if@wlg@tagging
      \hypersetup{pdfsubtitle=\@subtitle}
    \fi
  \fi
    \if@wlg@tagging
     \hypersetup{pdfurl=\wlgurl/fileadmin/user_upload/p_wlg/\@issue\@pubyear/\ljobname.pdf}%
  \fi
  \setcounter{footnote}{0}%
  \setcounter{page}{\thestartpage}%
  \global\let\@cauthor\@empty
  \gdef\@ccauthor{\translate{corrauthor}}
  \let\thanks\relax
  \let\maketitle\relax
  \let\@maketitle\relax
  \let\@maketitlepage\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@pdf@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@subtitle\@empty
  \global\let\author\relax
  \global\let\cauthor\relax
  \global\let\title\relax
  \global\let\date\relax
}%

% The heading of the table of contents on the title page opens a Sect
% structure that the kernel closes only at the next heading. Without closing
% it here, the \tagstructend of FrontMatter would close that Sect instead
% and FrontMatter would stay open ("structure section can not be closed").
\ExplSyntaxOn
\cs_new_protected:Npn \wlg@close@sections
  {
    \cs_if_exist:NT \__tag_sec_end:n { \__tag_sec_end:n { 1 } }
  }
\ExplSyntaxOff

\newcommand{\@maketitlepage}[1][1]{%
   \if@wlg@titlepageneeded%
    \begin{titlepage}
      \pagenumbering{roman}%
      \thispagestyle{empty}%
      \setcounter{page}{#1}%
      \let\footnotesize\small%
      \let\footnoterule\relax%
      \let\footnote\thanks%
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark%
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
      \noindent\wlg@logo\par
      \null\vfill
      {\raggedright%
        \if@wlg@specialprint
        \if@wlg@review
           {\reviewfont\translate{review}\par\vskip .5em}%
        \fi
        \if@wlg@tagging
          \tagstructbegin{tag=Title}
        \fi
        {\if@wlg@review\reviewtitlefont\else\titlefont\fi{\@title\par}}%
        {\ifx\@subtitle\@empty\else\vskip 1em{\subtitlefont\@subtitle\par}\fi}%
        \if@wlg@tagging
          \tagstructend
        \fi
        \vskip 2em
        {%
          \authorfont%
              \if@wlg@review\translate{reviewedby}: \fi\@author\par%
        }%
          \vfill
          {\datefont\if@wlg@preprint\translate{preprintfrom}%
                              \else\translate{specialprint}\fi\ \emph{Wiener Linguistische Gazette}
                              (\versal{WLG})
         \@issue\ (\@pubyear)\if@wlg@preprint\else: \startpageref--\lastpageref\fi\par}
        {\ifx\@issuetitle\@empty\else
            \vskip 1em
            {\datefont\translate{specialissue} \itshape\@issuetitle
                         \ifx\@issuesubtitle\@empty\else.\ \@issuesubtitle\fi\par}%
         \fi}%
         \ifx\@issueeditors\@empty\else
          {\datefont%
              \translate{edby}\ \@issueeditors\par
          }%
                 \fi
        \else
        {\ifx\@issuetitle\@empty
           {\titlefont\translate{issue} \@issue\ (\@pubyear)\par}
                   \begingroup
                     \let\l@chapter\wlg@l@chapter@small
                     \subsubsection*{\contentsname}%
                     \@starttoc{toc}%
                   \endgroup
                   \if@wlg@tagging\wlg@close@sections\fi
        \else
           {\datefont\translate{issue} \@issue\ (\@pubyear)\par}
        \fi}
        {\ifx\@issuetitle\@empty\else
            \vskip 1em
            {\datefont\translate{specialissue}\par}%
            \if@wlg@review
              {\reviewfont\translate{review}\par}%
            \fi
            {\titlefont\@issuetitle\par}%
                \vskip 3pt
                {\ifx\@issuesubtitle\@empty\else{\subtitlefont\@issuesubtitle\par}\fi}%
                 \vskip 2em
                {%
                 \ifx\@issueeditors\@empty\else
                 {\datefont%
                    \translate{edby}\ \@issueeditors\par
                 }%
                         \fi
                       }%
         \fi}%
        \fi%
        \vfill
        {\publishersfont\translate{univie} \textperiodcentered\ \translate{lingdep} \textperiodcentered\ \@pubyear\par}%
      }\par
      \@thanks\let\@thanks\@empty
      \null
    \end{titlepage}
    \if@wlg@tagging
        \SuspendTagging{impressumpage}
        \tagmcbegin{artifact}
    \fi
    \clearpage
    \thispagestyle{empty}
    \strut\vfill
    \if@wlg@tagging
        \tagmcend%
        \ResumeTagging{impressumpage}
    \fi
    \if@wlg@tagging
      \tagstructbegin{tag=Imprint}
    \fi
    \impressum
    \if@wlg@tagging
      \tagstructend
    \fi
    \clearpage
    \if@wlg@specialprint\else
     \ifx\@issuetitle\@empty\else
       \thispagestyle{plain}
       \tableofcontents
       \if@wlg@tagging\wlg@close@sections\fi
       \clearpage
     \fi
    \fi
    \global\@wlg@titlepageneededfalse%
   \fi%
}

\renewcommand*\@maketitle{%
  % Anchor for the toc link and the bookmark. Without it \addcontentsline
  % takes the last anchor, e.g. the toc heading on a roman-numbered page.
  \phantomsection
  % Affiliations must not end up in the toc entry (they would show up in the
  % purified title of the TOCI structure), so \aff is empty here.
  \begingroup
  \RenewExpandableDocumentCommand{\aff}{ s O{} m }{}%
  \if@wlg@review
     \addcontentsline{toc}{chapter}{\@author\texorpdfstring{\wlg@nlsa{: }\translate{review}}{: Review}: \@title%
                           \if@wlg@review\reviewtitlefont%
                           \else\ifx\@subtitle\empty\else\texorpdfstring{\wlg@nls{: }}{. }\@subtitle\fi\fi}%
  \else
      \addcontentsline{toc}{chapter}{\@author\texorpdfstring{\wlg@nlsa{: }}{: }\@title%
                           \if@wlg@review\reviewtitlefont%
                           \else\ifx\@subtitle\empty\else\texorpdfstring{\wlg@nls{: }}{. }\@subtitle\fi\fi}%
  \fi
  \endgroup
  \global\@topnum=\z@
  \null
  \vskip 2em%
  \DeclareExpandableDocumentCommand{\aff}{ s O{} m }
  {%
    \texorpdfstring
      {\IfBooleanTF{##1}{\@@aff}{\@aff}[##2]{##3}}
      {}%
  }
  \renewcommand*\@@aff[2][]{%
    \def\@ccauthor{\translate{corrauthor}}%
    \ifx##1f%
        \def\@ccauthor{\translate{corrauthorf}}%
    \else\ifx##1p%
        \def\@ccauthor{\translate{corrauthors}}%
    \fi\fi%
    \def\@cauthor{##2}%
    \thanks{\protect\raggedright ##2 (\@ccauthor).}
  }
  \renewcommand*\@aff[2][]{%
    \thanks{\protect\raggedright ##2.}
  }
  \if@wlg@tagging
      \tagstructbegin{tag=TitleBlock}
  \fi
  {%
    \raggedright%
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
    \let\@ooldmakefnmark\@makefnmark
    \renewcommand*{\@makefnmark}{\rlap\@ooldmakefnmark}%
    \vskip 1em%
    \if@wlg@review
       {\reviewfont\translate{review}\par\vskip .5em}%
    \fi
    {%
      \if@wlg@review
         \reviewtitlefont
      \else
         \titlefont
      \fi
      {%
       \if@wlg@tagging
         \tagstructbegin{tag=Title}
       \fi
       \@title\par%
      }%
    }%
    {%
      \ifx\@subtitle\@empty\else%
         \vskip .5em\subtitlefont\@subtitle\par\fi%
       \if@wlg@tagging
         \tagstructend
       \fi
    }%
    \vskip 1em
    {\authorfont\if@wlg@review\translate{reviewedby}: \fi\@author\par}%
    {%
      \if@wlg@tagging
        \SuspendTagging{titlerule}
        \tagmcbegin{artifact}
        \color{gray}\rule{1\columnwidth}{.7pt}\par%
        \tagmcend%
        \ResumeTagging{titlerule}
      \else
        \color{gray}\rule{1\columnwidth}{.7pt}\par%
      \fi
    }%
  }%
  {\vskip 1em
   \raggedleft%
   \footnotesize
   \emph{Wiener Linguistische Gazette} (\versal{WLG})\par
   \translate{lingdep}\par
   \translate{univie}\par
   \vskip .25\baselineskip
   \translate{issue} \@issue\ (\@pubyear):
   \if@wlg@preprint
      \translate{preprint}%
   \else
      \thepage--\lastpageref%
   \fi%
   \par%
  }%
  \if@wlg@tagging
    \tagstructend
  \fi
  \vskip 2em
  \if@wlg@mainmatter
    \pagenumbering{arabic}
  \fi
}%

% Rewrite \include for local LastPage counter
\def\@include#1 {%
  \def\ljobname{#1}%
  \def\lastpageref{\pageref{TotPages#1}}%
  \clearpage
  \if@filesw
    \immediate\write\@mainaux{\string\@input{#1.aux}}%
  \fi
  \@tempswatrue
  \if@partsw
    \@tempswafalse
    \edef\reserved@b{#1}%
    \@for\reserved@a:=\@partlist\do
      {\ifx\reserved@a\reserved@b\@tempswatrue\fi}%
  \fi
  \if@tempswa
    \let\@auxout\@partaux
    \if@filesw
      \immediate\openout\@partaux #1.aux
      \immediate\write\@partaux{\relax}%
    \fi
    \if@wlg@biblatex
       \newrefsection
    \fi
    \@input@{#1.tex}%
    \label{TotPages#1}%
    \clearpage
    \@writeckpt{#1}%
    \if@filesw
      \immediate\closeout\@partaux
    \fi
  \else
    \deadcycles\z@
    \@nameuse{cp@#1}%
  \fi
  \let\@auxout\@mainaux}

\def\authorfont{\normalsize\normalfont\mdseries\itshape}
\def\titlefont{\normalfont\bfseries\Large}
\def\subtitlefont{\normalsize\normalfont\bfseries}
\def\datefont{\normalsize\normalfont\mdseries}
\def\publishersfont{\small\mdseries}
\def\reviewfont{\normalfont\mdseries}
\def\reviewtitlefont{\normalsize\normalfont\bfseries}


%% =============================================================
%% CONVENIENCE FUNCTION FOR COMPLETE ISSUES:
%% =============================================================

\RequirePackage{pdfpages}
\def\@iauthor{}
\def\@ititle{}
\def\@isubtitle{}
\define@key{wlgissue}{author}{\def\@iauthor{#1}}
\define@key{wlgissue}{title}{\def\@ititle{#1}}
\define@key{wlgissue}{subtitle}{\def\@isubtitle{#1}}
\newcommand*\makeissuetitle{\@maketitlepage}
\newcommand*\includefinalpaper[2][]{%
   \def\@iauthor{}
   \def\@ititle{}
   \def\@isubtitle{}
   \setkeys{wlgissue}{#1}
   \def\@ipaper{#2}
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\@iauthor\texorpdfstring{\wlg@nlsa{: }}{: }\@ititle%
                       \ifx\@isubtitle\empty\else\texorpdfstring{\wlg@nls{: }}{. }\@isubtitle\fi}%
    \includepdf[pages=3-]{\@ipaper}
}


%% =============================================================
%% FOOTNOTES:
%% =============================================================

% Footnote at botton despite \raggedbottom
\RequirePackage[bottom,hang]{footmisc}

% Increase distance between text and footnotes
\renewcommand\footnoterule{%
  \if@wlg@tagging\tagmcbegin{artifact}\fi
  % Distance between text and footnote rule
  \vspace{.25\baselineskip}%
  \hrule\@width 2in%
  \kern2.6\p@%
  % Distance between footnote rule and footnotes
  \vspace{0.2em}%
  \if@wlg@tagging\tagmcend\fi
}

% Adapt number width to maximum footnote count (footnotesize)
\newlength\footnumwidth
\newcommand*\maxfn{199}
\settowidth{\footnumwidth}{{\normalfont\footnotesize\maxfn\space\space}}
\setlength{\footnotemargin}{\footnumwidth}

% Footnote mark not superscripted
\def\mk@app@fnmark{\hfill\normalfont\@thefnmark\hspace{.5em}}
% Change defs
% 1. Without tagging
% adopted from footmisc.sty
\long\def\wlg@makefntext#1{%
  \bgroup
      \setbox\@tempboxa\hbox{%
        \hb@xt@\footnotemargin{\mk@app@fnmark}%
      }%
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      \@totalleftmargin \leftmargin
      \footnotesize
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      \parskip\hangfootparskip\relax
      \parindent\hangfootparindent\relax
    \footnotelayout#1%
    \par%
  \egroup
}

% 2. Same with tagging=on
% adopted from latex-lab-footmisc.ltx
\newlength\fnlabelwidth
\long\def\wlg@tagged@makefntext#1{%
      \bgroup
        \SuspendTagging{footmisc}%
        \setbox\@tempboxa\hbox{%
          \ifdim\footnotemargin>\z@
            \hb@xt@\footnotemargin{\mk@app@fnmark}%
          \else
            \@makefnmark
          \fi
        }%
        \leftmargin\wd\@tempboxa
        \rightmargin\z@
        \linewidth \columnwidth
        \advance \linewidth -\leftmargin
        \parshape \@ne \leftmargin \linewidth
        \footnotesize
        \parskip\hangfootparskip\relax
        \parindent\hangfootparindent\relax
        \@setpar{{\@@par}}%
        \ResumeTagging{footmisc}%
        \leavevmode
        \UseSocket{fntext/mark/link}%
        \UseTaggingSocket{fntext/mark}{}%
                  {\llap{%
                    \ifdim\footnotemargin>\z@
                      \hb@xt@\footnotemargin{\mk@app@fnmark}%
                    \else
                      \@makefnmark
                    \fi
                  }}%
        \footnotelayout#1%
        \par
      \egroup
}

\AddToHook{begindocument}{
  \if@wlg@tagging
    \let\@makefntext\wlg@tagged@makefntext
  \else
     \let\@makefntext\wlg@makefntext
  \fi
}


%% =============================================================
%% ADAPT ENVIRONMENTS:
%% =============================================================

% empty part pages
\AddToHook{cmd/part/before}{\cleardoublepage\thispagestyle{empty}}

% Abstract
\renewenvironment{abstract}{%
    \section*{\hspace*{2.5em}Abstract}
    \quotation\noindent\ignorespaces%
}{%
    \if@twocolumn\else\endquotation\fi%
}

% Lists
\RequirePackage{enumitem}
\setlist{itemsep=0pt}
% Itemize
\def\labelitemi{--}

% Keywords
% array is needed for >{...} in the tabular preamble below
\RequirePackage{array}
\newcommand\@mkkeywords[1]{%
  \ifundef{\wlg@keywords}
    {\edef\wlg@keywords{\unexpanded{#1}}
     \edef\wlg@pdf@keywords{\unexpanded{#1}}%
    }
    {
     \edef\wlg@keywords{\expandonce\wlg@keywords\unexpanded{, #1}}%
     \edef\wlg@pdf@keywords{\expandonce\wlg@pdf@keywords\unexpanded{; #1}}%
    }
}
\newlength\wlg@keywordlblwidth
\newlength\wlg@keywordindent
\newlength\wlg@keywordwidth
\newcommand*\wlg@keywordsep{\ }
\ExplSyntaxOn
% Keywords are tagged as one single paragraph (role keywords -> P) containing
% the label (Lbl) and the keyword list in reading order. The tabular is layout
% only.
\NewDocumentCommand\keywords{>{\SplitList{,}}m}
  {%
    \ProcessList{#1}{\@mkkeywords}%
    % calculate widths
    \settowidth\wlg@keywordlblwidth{\textbf{\translate{keywords}:}\ }%
    \setlength\wlg@keywordindent{\leftmargin-\parindent}%
    \setlength\wlg@keywordwidth{\linewidth-\wlg@keywordlblwidth}%
    % label starts at \leftmargin (paragraph indent + keywordindent)
    \addtolength\wlg@keywordwidth{-\leftmargin}%
    \addtolength\wlg@keywordwidth{-\rightmargin}%
    \group_begin:
    % disable table tagging for the layout tabular below; this assigns
    % socket plugs locally, so it must stay inside the group (otherwise
    % all later tables in the document are untagged as well)
    \cs_if_exist_use:N\__tag_tbl_disable:
    \if@wlg@tagging
      \bool_set_false:N \l__tag_para_bool% no automatic para structure
      \tagstructbegin{tag=keywords}%
      % the space between label and keywords is a real character (inside the
      % label) in the tagged text, so the column separator is empty
      \renewcommand*\wlg@keywordsep{}%
    \fi
    \begin{tabular}{@{\hspace{\wlg@keywordindent}}l@{\wlg@keywordsep}>{\raggedright}p{\wlg@keywordwidth}@{}}
      \if@wlg@tagging
        \tagstructbegin{tag=Lbl}%
        \tagmcbegin{}%
      \fi
      \small\textbf{\translate{keywords}:}%
      \if@wlg@tagging
        \char"20\scan_stop:
        \tagmcend
        \tagstructend
      \fi
      &
      \if@wlg@tagging\tagmcbegin{}\fi
      \small\wlg@keywords
      \if@wlg@tagging\tagmcend\fi
    \end{tabular}%
    \if@wlg@tagging\tagstructend\fi
    % close the paragraph while para tagging is still off
    \par
    \group_end:
    \hypersetup{pdfkeywords=\wlg@pdf@keywords}%
  }
\ExplSyntaxOff

% Motto
\newcommand*{\mottosourceformat}[1]{(#1)}

\NewDocumentCommand\motto{ o m }
{\par%
  \begingroup
    \if@wlg@tagging
      \tagpdfparaOff %leavevmode in parbox should not start paragraph structure
    \fi
    \raggedleft\parbox{.7\textwidth}{%
       \if@wlg@tagging
         \tagpdfparaOn %restart para tagging inside the box
         \tagstructbegin{tag=motto}
       \fi
      {\rmfamily{\raggedleft #2\strut\par}%
        \def\@tempa{#1}\ifx\@tempa\@empty\else%
          {\raggedleft}%
          \raggedleft\rmfamily\mottosourceformat{#1}%
          \strut\par%
        \fi%
      }%
       \if@wlg@tagging
         \tagstructend
       \fi
    }\par%
  \endgroup
  \medskip%
  \@afterindentfalse%
  \@afterheading%
}

% Quote (smaller)
\AddToHook{env/quote/begin}{\small}

% Quotation (smaller)
\AddToHook{env/quotation/begin}{\small}

% Description (normal italic)
\if@wlg@useDocumentMetadata
  \EditInstance{item}{description}{
      label-format = \normalfont\itshape #1
  }
\else
  \renewcommand*\descriptionlabel[1]{\hspace\labelsep
                                  \normalfont\itshape #1}
\fi

% ldots centered
\let\olddots\ldots
\renewcommand*{\ldots}{\olddots\unkern}

\if@wlg@covington
  \RequirePackage{covington}
  \renewcommand{\p@equation}[1]{(#1)}
  \setlength\reflistindent{\parindent}
  \setlength\reflistparsep{0pt}
\fi


%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

\if@wlg@useDocumentMetadata
    % The caption package is currently incompatible with tagging,
    % so we hook into \@makecaption for font adjustments
    \ExplSyntaxOn
    \AddToHook{cmd/@makecaption/before}{%
      % tableposition=top
      \str_if_eq:VnTF \@captype {table}
         {
           \setlength{\abovecaptionskip}{0pt}% 
           \setlength{\belowcaptionskip}{9.5bp}% skip=9.5bp
         }
         {
           \setlength{\abovecaptionskip}{9.5bp}% skip=9.5bp
           \setlength{\belowcaptionskip}{0pt}%
         }%
    }%
    \ExplSyntaxOff
    % labelfont=bf
    \NewSocketPlug{caption/label}{wlg}
     {%
       \textbf{#1:}\space%
     }
     \AssignSocketPlug{caption/label}{wlg}
     % For justification=RaggedRight we need to redefine
     % \@makecaption from latex-lab-testphase-float.sty
     % since centering is currently hardcoded there
     % (format=hang is implemented via \hangindent below)
     \newlength\wlg@captionhang
     \AddToHook{begindocument}
      {
        \long\def\@makecaption#1#2{%
          \UseHookWithArguments{cmd/@makecaption/before}{2}{#1}{#2}%
          \vskip\abovecaptionskip%
          \SuspendTagging{\@makecaption}%
          % width of label (incl. separator) = hanging indent;
          % \settowidth uses \@tempboxa, so measure before the next \sbox
          \settowidth\wlg@captionhang{\UseSocket{caption/label}{#1}}%
          \sbox\@tempboxa{\UseSocket{caption/label}{#1}#2}%
          \ResumeTagging{\@makecaption}%
          \UseTaggingSocket{caption/begin}{\@current@float@struct}%
          \ifdim \wd\@tempboxa >\hsize
            \begingroup
              \RaggedRight% justification=RaggedRight
              \hangindent\wlg@captionhang \hangafter\@ne% format=hang
              \UseTaggingSocket{caption/label/begin}
              \UseSocket{caption/label}{#1}
              \UseTaggingSocket{caption/label/end}
              \UseTaggingSocket{para/begin}
                  #2
              \par
            \endgroup
          \else
            \global\@minipagefalse%
            \hb@xt@\hsize{%\hfil
               \RaggedRight% justification=RaggedRight
               \UseTaggingSocket{caption/label/begin}%
               \UseSocket{caption/label}{#1}%
               \UseTaggingSocket{caption/label/end}%
               \UseTaggingSocket{para/begin}%
                #2%
               \UseTaggingSocket{para/end}%
             \hfil}%
          \fi
          \UseTaggingSocket{caption/end}
          \vskip\belowcaptionskip}
     }
\else% no \DocumentMetadata
   %% caption settings
   \RequirePackage[%
      format=hang,
      justification=RaggedRight,
      singlelinecheck=false,
      labelfont=bf,
      tableposition=top
      ]{caption}
\fi

%% Nicer tables with booktabs.sty
\RequirePackage{booktabs}

%% allow multiple rows
\RequirePackage{multirow}


%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\if@wlg@biblatex
  \AfterInputencOrAtEndPreamble{%
      \RequirePackage[%
           style=univie-ling,
           sorting=nyvt,
           autolang=hyphen]
      {biblatex}
  }
\fi
\AtBeginDocument{%
  \@ifundefined{bibhang}{}{%
    \setlength{\bibhang}{\parindent}%
  }%
  \@ifundefined{bibfont}{}{%
    \renewcommand{\bibfont}{\small}%
  }%
  \@ifundefined{bibsep}{}{%
    \setlength\bibsep{0pt}%
  }%
}

%% =============================================================
%% REFERENCES:
%% =============================================================

% Varioref:
\AtBeginDocument{%
  \RequirePackage[ngerman]{varioref}
  \vref@addto\extrasnaustrian{%
    \def\reftextafter{auf der \reftextvario{folgenden}{n\"achsten} Seite}%
    \def\reftextfaceafter{auf der gegen\"uberliegenden Seite}%
    \def\reftextbefore{auf der \reftextvario{vorhergehenden}{vorangegangenen} Seite}%
    \def\reftextfacebefore{auf der gegen\"uberliegenden Seite}%
    \def\reftextfaraway#1{auf S.~\pageref{#1}}%
    \def\reftextpagerange#1#2{auf S.~\pageref{#1}--\pageref{#2}}%
  }%
  % Prettyref:
  % (varioref included)
  \RequirePackage{prettyref}
  \newrefformat{cha}{\translate{chapter}~\vref{#1}}
  \newrefformat{sec}{\translate{section}~\vref{#1}}
  \newrefformat{sub}{\translate{section}~\vref{#1}}
  \newrefformat{anm}{\translate{footnote}~\vref{#1}}
  \newrefformat{app}{\appendixname~\vref{#1}}
  \newrefformat{tab}{\tablename~\vref{#1}}
  \newrefformat{fig}{\figurename~\vref{#1}}
  \newrefformat{exp}{\translate{argumentation}~\vref{#1}}
  \newrefformat{exa}{\translate{example}~\vref{#1}}
}

%% =============================================================
%% SEMANTIC MARKUP:
%% =============================================================

% Helper function (wrapper) for semantic tagging
\ExplSyntaxOn
\if@wlg@tagging
  \NewDocumentCommand \SemTag { m m } % #1 = Tag, #2 = Content
    {
      \mode_if_math:TF
        { #2 } % Just pass content in math
        {
          \mode_leave_vertical:
          \tag_mc_end_push:
          \tag_struct_begin:n { tag=#1 }
          \tag_mc_begin:n {}
          #2
          \tag_mc_end:
          \tag_struct_end:
          \tag_mc_begin_pop:n {}
        }
    }
\else
  % Just pass the content
  \NewDocumentCommand \SemTag { m m } { #2 }
\fi
\ExplSyntaxOff

\NewDocumentCommand\Expression{ m }
   {\SemTag{expression}{\textit{#1}}}
\NewDocumentCommand\Concept{ m }
   {\SemTag{concept}{\textsc{#1}}}
\NewDocumentCommand\Meaning{ m }
   {\SemTag{meaning}{\enquote*{#1}}}


%% =============================================================
%% EDITORIAL MACROS:
%% =============================================================

% Adapt start page number
\newcounter{startpage}
\setcounter{startpage}{1}
\newcommand*\startpage[1]{\setcounter{startpage}{#1}}

% Main url
\def\wlgurl{http://wlg.univie.ac.at}

%% =============================================================
%% DRAFT:
%% =============================================================

\if@wlg@draftmark

\if@wlg@draftmarkfp
  \RequirePackage[firstpageonly]{draftwatermark}
\else
  \RequirePackage{draftwatermark}
\fi

\DraftwatermarkOptions{%
  angle=0,
  vpos=10pt,
  anchor=ct,
  fontsize=14pt,
  text={\translate{draft} (\today)}
}

\fi

%% Finis.
