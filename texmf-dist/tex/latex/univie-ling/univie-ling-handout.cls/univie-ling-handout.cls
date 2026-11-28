%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-handout
%%
%% Student Handouts in (Applied) Linguistics at the University of Vienna
%%
%% This file is part of the univie-ling LaTeX bundle, consisting of:
%%  -- univie-ling-handout.cls: Class for Handouts (this file)
%%  -- univie-ling-expose.cls: Class for PhD Research Proposals
%%  -- univie-ling-handout.cls: Class for student papers
%%  -- univie-ling-paper.cls: Class for student papers
%%  -- univie-ling-poster.cls: Class for scientific posters
%%  -- univie-ling-thesis.cls: Class for BA, MA or PhD theses
%%  -- univie-ling-wlg.cls: Class for the journal Wiener Linguistische Gazette
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
\ProvidesClass{univie-ling-handout}[2026/11/20 v.2.10 Univie Ling handout class (JSp)]

%% ============================================================
%% CLASS OPTIONS
%% ============================================================

\newif\if@uvh@apa\@uvh@apafalse
\newif\if@uvh@biblatex\@uvh@biblatextrue
\newif\if@uvh@breakevent\@uvh@breakeventfalse
\newif\if@uvh@sepeventdate\@uvh@sepeventdatefalse
\newif\if@uvh@captionp\@uvh@captionptrue
\newif\if@uvh@beamer\@uvh@beamerfalse
\newif\if@uvh@covington\@uvh@covingtontrue
\newif\if@uvh@draftmark\@uvh@draftmarkfalse
\newif\if@uvh@draftmarkfp\@uvh@draftmarkfpfalse
\newif\if@uvh@foldmarks\@uvh@foldmarksfalse
\newif\if@uvh@landscape\@uvh@landscapefalse
\newif\if@uvh@lastpage\@uvh@lastpagefalse
\newif\if@uvh@microtype\@uvh@microtypetrue
\newif\if@uvh@otffonts\@uvh@otffontsfalse
\newif\if@uvh@pageonfirst\@uvh@pageonfirsttrue
\newif\if@uvh@polyglossia\@uvh@polyglossiafalse
\newif\if@uvh@pplogo\@uvh@pplogotrue
\newif\if@uvh@psfonts\@uvh@psfontstrue
\newif\if@uvh@punchmark\@uvh@punchmarkfalse
\newif\if@uvh@refsp\@uvh@refsptrue
\newif\if@uvh@swaphead\@uvh@swapheadfalse
\newif\if@uvh@usefontenc\@uvh@usefontenctrue
\newif\if@uvh@usewidesubtitle\@uvh@usewidesubtitlefalse
\newif\if@uvh@monologo\@uvh@monologofalse
\def\uvh@fontenc{T1}
\def\uvh@fontsize{11}
\def\uvh@papersize{a4}


% General strings
\def\uvh@phoneprefix{T}
\def\uvh@faxprefix{F}
\def\uvh@emailprefix{}
\def\uvh@urlprefix{}
\def\uvh@headerdeptsep{\ \textperiodcentered\ }
\def\uvh@headernamesep{,\ }
\def\uvh@secnamesep{,\ }

% German CD (default)
\def\uvh@cd@german{
    \def\uvh@name{\uvh@name@de}
    \def\uvh@shortname{\uvh@shortname@de}
    \def\uvh@university{Universit\"at Wien}
    \def\uvh@department{\uvh@department@de}
    \def\uvh@location{\uvh@location@de}
    \def\uvh@country{\uvh@country@de}
    \def\uvh@function{\uvh@function@de}
    \def\uvh@secfunction{\uvh@secfunction@de}
    \def\uvh@pageprefix{Seite}
    \def\uvh@logoalt{Logo Universit\"at Wien}
}
\def\uvh@cd@english{%
    \def\uvh@name{\uvh@name@en}
    \def\uvh@shortname{\uvh@shortname@en}
    \def\uvh@university{University of Vienna}
    \def\uvh@department{\uvh@department@en}
    \def\uvh@location{\uvh@location@en}
    \def\uvh@country{\uvh@country@en}
    \def\uvh@function{\uvh@function@en}
    \def\uvh@secfunction{\uvh@secfunction@en}
    \def\uvh@pageprefix{Page}
    \def\uvh@logoalt{Logo University of Vienna}
}
\uvh@cd@german

% Define keys and values
\DeclareKeys[uvh]
{
    % all=<true|false>
    % Load all (most) packages
    all.code:n = 
      { \str_if_eq:NNTF { #1 } { true }
         {
            \@uvh@biblatextrue
            \@uvh@captionptrue
            \@uvh@refsptrue
            \@uvh@covingtontrue
            \@uvh@microtypetrue
         }{
            \@uvh@biblatexfalse
            \@uvh@captionpfalse
            \@uvh@refspfalse
            \@uvh@covingtonfalse
            \@uvh@microtypefalse
         }
      },
    all.default:n = { true },
    all.usage:n = preamble,
    % apa=<true|false>
    % Load APA style
    apa.legacy_if_set:n = @uvh@apa,
    apa.usage:n = preamble,
    % biblatex=<true|false>
    % Load biblatex
    biblatex.legacy_if_set:n = @uvh@biblatex,
    biblatex.usage:n = preamble,
    % breakevent=<true|false>
    % Line break in heading between event and event spec (location, date etc.)
    breakevent.legacy_if_set:n = @uvh@breakevent,
    breakevent.usage:n = preamble,
    % Event date on own line
    sepeventdate.if = @uvh@sepeventdate,
    sepeventdate.usage = preamble,
    % bwlogo=<true|false>
    % Print monochrome logo?
    bwlogo.legacy_if_set:n = @uvh@monologo,
    bwlogo.default:n = { true },
    bwlogo.usage:n = preamble,
    % beamerarticle=<true|false>
    % Load beamerarticle
    beamerarticle.legacy_if_set:n = @uvh@beamer,
    beamerarticle.usage:n = preamble,
    % caption=<true|false>
    % Load caption
    caption.legacy_if_set:n = @uvh@captionp,
    caption.usage:n = preamble,
    % covington=<true|false>
    % Load covington
    covington.legacy_if_set:n = @uvh@covington,
    covington.usage:n = preamble,
    % firstpagination=<true|false>
    % Suppress pagination on first page?
    firstpagination.legacy_if_set:n = @uvh@pageonfirst,
    firstpagination.usage:n = preamble,
    % foldmarks=<true|false>
    % Output fold marks?
    foldmarks.legacy_if_set:n = @uvh@foldmarks,
    foldmarks.usage:n = preamble,
    % fontenc=<value|none>
    % customize font encoding
    fontenc.code:n = 
      { \str_if_eq:NNTF { #1 } { none }
         {
           \@uvh@usefontencfalse
         }{
           \def\uvh@fontenc{#1}
         }
      },
    fontenc.usage:n = preamble,
    % fontsize=<size>
    % Set base font size
    fontsize.tl_set:N = \uvh@fontsize,
    fontsize.usage:n = preamble,
    % landscape=<true|false>
    % Set landscape
    landscape.legacy_if_set:n = @uvh@landscape,
    landscape.usage:n = preamble,
    % microtype=<true|false>
    % Load microtype
    microtype.legacy_if_set:n = @uvh@microtype,
    microtype.usage:n = preamble,
    % papersize=<size>
    % Set paper size
    papersize.tl_set:N = \uvh@papersize,
    papersize.usage:n = preamble,
    % polyglossia=<true|false>
    % Load polyglossia
    polyglossia.code:n = 
      { \str_if_eq:NNTF { #1 } { true }
        {
           \@uvh@psfontsfalse
           \@uvh@otffontstrue
           \@uvh@polyglossiatrue
        }{
           \@uvh@polyglossiafalse
        }
      },
    polyglossia.default:n = { true },
    polyglossia.usage:n = preamble,
    % pplogo=<true|false>
    % Print logo on page 2ff.
    pplogo.legacy_if_set:n = @uvh@pplogo,
    pplogo.usage:n = preamble,
    % punchmarks=<true|false>
    % Output punch marks?
    punchmarks.legacy_if_set:n = @uvh@punchmark,
    punchmarks.usage:n = preamble,
    % ref=<true|false>
    % Load varioref and prettyref
    ref.legacy_if_set:n = @uvh@refsp,
    ref.usage:n = preamble,
    % swaphead=<true|false>
    % Swap title and event in header
    swaphead.legacy_if_set:n = @uvh@swaphead,
    swaphead.usage:n = preamble,
    % totalpages=<true|false>
    % Output total page number
    totalpages.legacy_if_set:n = @uvh@lastpage,
    totalpages.usage:n = preamble,
    % widesubtitle=<true|false>
    % Print subtitle over the whole text width
    % (may conflict with address field)
    widesubtitle.legacy_if_set:n = @uvh@usewidesubtitle,
    widesubtitle.usage:n = preamble,
    % cd=<german|english>
    % CD Language
    cd .choice:,
    % german
    cd / german .code:n = { \uvh@cd@german },
    % english
    cd / english .code:n = { \uvh@cd@english },
    % draftmark=<true|false|firstpage>
    % Print draftmark
    draftmark .choice:,
    % true
    draftmark / true .code:n = 
      { \@uvh@draftmarktrue
        \@uvh@draftmarkfpfalse
      },
    % false
    draftmark / false .code:n = 
      { \@uvh@draftmarkfalse
        \@uvh@draftmarkfpfalse
      },
    % firstpage
    draftmark / firstpage .code:n = 
      { \@uvh@draftmarktrue
        \@uvh@draftmarkfptrue
      },
    % no val equals to true
    draftmark .default:n = {true},
    % fonts=<ps|otf|none>
    % Select font scheme
    fonts .choice:,
    % ps: use PostScript fonts (classic LaTeX)
    fonts / ps .code:n = 
      { \@uvh@psfontstrue
        \@uvh@otffontsfalse
      },
    % otf: use OpenType fonts (fontspec)
    fonts / otf .code:n = 
      { \@uvh@psfontsfalse
        \@uvh@otffontstrue
      },
    % none: Use no font package
    fonts / none .code:n = 
      { \@uvh@psfontsfalse
        \@uvh@otffontsfalse
      },
}

% Process
\ProcessKeyOptions[uvh]


%% ============================================================
%% BASE CLASS
%% ============================================================

% Base class: article
\PassOptionsToClass{\uvh@fontsize pt,oneside,final}{article}
\if@uvh@landscape
  \PassOptionsToClass{landscape}{article}
\fi

\LoadClass{article}


%% ============================================================
%% REQUIRED PACKAGES
%% ============================================================

% Set page layout with geometry
\RequirePackage{geometry}
\geometry{%
  a4paper,
  top=50mm,
  left=26.5mm,
  right=15mm,
  bottom=23mm,
  headsep=3.7cm,
  footskip=10mm
}

% Use headings
\AtEndOfClass{\pagestyle{headings}}

% Use lastpage package if total pages is required
\if@uvh@lastpage
  \AtEndOfClass{\RequirePackage{lastpage}}
\fi

% We need graphicx for the logo
\RequirePackage{graphicx}

% Hyperlinks
\RequirePackage{url}
\newcommand{\urlprefix}{}
% URLs italic
\def\UrlFont{\rmfamily\itshape}
% Format URL dates
\def\uvh@urldate{}
\newcommand*\SetURLDate[1]{\gdef\uvh@urldate{#1}}
\AddToHook{begindocument}{
  \RequirePackage[english,ngerman]{isodate}
  \numdate
  \providecommand*\urldate[1]{[\translate{urlaccess} \printdate{#1}]}
  % Convenience function
  \NewDocumentCommand\weblink{mo}{%
    \url{#1}%
    \IfNoValueTF{#2}%
        {\ifx\uvh@urldate\empty\else%
         \ \urldate{\uvh@urldate}%
        \fi}%
        {\ \urldate{#2}}%
  }
}
% hyperref is loaded with tagging
\PassOptionsToPackage{pdfusetitle,
                      bookmarks=true,
                      bookmarksnumbered=false,
                      bookmarksopen=false,
                      breaklinks=true,
                      pdfborder={0 0 0},
                      pdfborderstyle={},
                      backref=false,
                      colorlinks=false}{hyperref}

% track whether we use tagging
\newif\if@uvh@tagging
\@uvh@taggingfalse
\AddToHook{package/tagpdf/after}{%
   \@ifpackagelater{graphicx}{2024/12/31}{
      \tagpdfsetup
        {
          role/new-tag=expression/Span,
          role/new-tag=concept/Span,
          role/new-tag=meaning/Span,
       }
      \@uvh@taggingtrue
      \RequirePackage{hyperref}
   }{}
}

% Check if \DocumentMetadata is being used
\newif\if@uvh@useDocumentMetadata
\ifx\IfDocumentMetadataT\@undefined\else
    \IfDocumentMetadataT{\global\@uvh@useDocumentMetadatatrue}%
\fi

\RequirePackage{array}
\RequirePackage{ifthen}

% Beamer article needs to be loaded before covington
\if@uvh@beamer
  \RequirePackage{beamerarticle}
\fi

% Covington
\if@uvh@covington
  \RequirePackage{covington}
  \renewcommand{\p@equation}[1]{(#1)}
\fi

% Better ragged text
\RequirePackage{ragged2e}


% ============================================================
% LOGO
% ============================================================

% Set appropriate logo
\if@uvh@monologo
  % Monochrome logo
  \if@uvh@tagging
    \def\uvh@printlogo{\includegraphics[alt=\uvh@logoalt,
                                        width=74mm]{univielogo-sw}}
    \def\uvh@printsmalllogo{\includegraphics[artifact,
                                              alt=\uvh@logoalt,
                                              height=14mm]{univielogo-sw}}
  \else
    \def\uvh@printlogo{\includegraphics[width=74mm]{univielogo-sw}}
    \def\uvh@printsmalllogo{\includegraphics[height=14mm]{univielogo-sw}}
  \fi
\else
  % Colored logo (default)
  \if@uvh@tagging
    \def\uvh@printlogo{\includegraphics[alt=\uvh@logoalt,
                                        width=74mm]{univielogo}}
    \def\uvh@printsmalllogo{\includegraphics[artifact,
                                             alt=\uvh@logoalt,
                                             height=14mm]{univielogo}}
  \else
    \def\uvh@printlogo{\includegraphics[width=74mm]{univielogo}}
    \def\uvh@printsmalllogo{\includegraphics[height=14mm]{univielogo}}
  \fi
\fi

%% ============================================================
%% FONTS
%% ============================================================

% Micro-typographic polishment
\if@uvh@microtype
   \RequirePackage{microtype}
\fi

% Font packages
\if@uvh@psfonts
  \if@uvh@usefontenc
    \RequirePackage[\uvh@fontenc]{fontenc}
  \fi
  % Source Pro fonts
  \RequirePackage[default,osf]{sourceserif}
  \RequirePackage[osf]{sourcesans}
  \RequirePackage{sourcecodepro}
\fi

\if@uvh@otffonts
  \RequirePackage{fontspec}
  % Source Pro fonts
  \setmainfont{SourceSerifPro}[Numbers=OldStyle]
  \setsansfont{SourceSansPro}[Numbers=OldStyle]
  \setmonofont{SourceCodePro}
\fi

% Font settings
\def\uvh@font@event{\fontsize{11}{13pt}\selectfont\mdseries\sffamily}
\def\uvh@font@title{\fontsize{18}{21pt}\selectfont\bfseries\sffamily}
\def\uvh@font@subtitle{\fontsize{13}{16pt}\selectfont\bfseries\sffamily}
\def\uvh@font@sections{\fontsize{13}{16pt}\selectfont\bfseries\sffamily}
\def\uvh@font@department{\fontsize{10}{12pt}\selectfont\bfseries\sffamily}
\def\uvh@font@header{\fontsize{8}{10pt}\selectfont\mdseries\sffamily}
\def\uvh@font@footer{\fontsize{8}{10pt}\selectfont\sffamily}
\def\uvh@font@headertitle{\fontsize{8}{10pt}\selectfont\sffamily}
\def\uvh@font@eventlocdate{\fontsize{11}{13pt}\selectfont\mdseries\sffamily}

%
% Adjust fonts of document elements
\if@uvh@useDocumentMetadata
  \EditInstance{headformat}{part}
    {
      separator-a = \enskip % between text and number
    }
  \EditInstance{heading}{part}%
     {
      text-decls=\uvh@font@part,
      number-decls=\uvh@font@part,
      title-decls=\uvh@font@part
     }
  \EditInstance{heading}{section}%
     {
      text-decls=\uvh@font@sections,
      number-decls=\uvh@font@sections,
      title-decls=\uvh@font@sections
     }
  \EditInstance{heading}{subsection}%
     {
      text-decls=\uvh@font@sections,
      number-decls=\uvh@font@sections,
      title-decls=\uvh@font@sections
     }
  \EditInstance{heading}{subsubsection}%
     {
      text-decls=\uvh@font@sections,
      number-decls=\uvh@font@sections,
      title-decls=\uvh@font@sections
     }
  \EditInstance{heading}{paragraph}%
     {
      text-decls=\uvh@font@sections,
      number-decls=\uvh@font@sections,
      title-decls=\uvh@font@sections
     }
  \EditInstance{heading}{subparagraph}%
     {
      text-decls=\uvh@font@sections,
      number-decls=\uvh@font@sections,
      title-decls=\uvh@font@sections
     }
  \EditInstance{item}{description}{
      label-format = \normalfont\mdseries #1
  }
\else
  % Space after section number
  \def\@seccntformat#1{\csname the#1\endcsname\enskip}

  % \part
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
         \uvh@font@part {\partname~\thepart}%
         \par\nobreak
       \fi
       \raggedright \normalfont
       \uvh@font@part {#2}%
       \markboth{}{}\par}%
      \nobreak
      \vskip 3ex
      \@afterheading}
  % and \part*
  \def\@spart#1{%
      {\parindent \z@ \raggedright
       \interlinepenalty \@M
       \normalfont
       \uvh@font@part {#1}\par}%
       \nobreak
       \vskip 3ex
       \@afterheading}

  % sectioning
  \renewcommand\section{\@startsection {section}{1}{\z@}%
        {-3.5ex \@plus -1ex \@minus -.2ex}%
        {2.3ex \@plus.2ex}%
        {\uvh@font@sections}}
  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
        {-3.25ex\@plus -1ex \@minus -.2ex}%
        {1.5ex \@plus .2ex}%
        {\uvh@font@sections}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
        {-3.25ex\@plus -1ex \@minus -.2ex}%
        {1.5ex \@plus .2ex}%
        {\uvh@font@sections}}
  \renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
        {3.25ex \@plus1ex \@minus.2ex}%
        {-1em}%
        {\uvh@font@sections}}
  \renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
        {3.25ex \@plus1ex \@minus .2ex}%
        {-1em}%
        {\uvh@font@sections}}

  % decription label
  \renewcommand*\descriptionlabel[1]{\hspace\labelsep
                                  \normalfont\mdseries #1}
\fi

% caption label
\if@uvh@tagging
  \NewSocketPlug{caption/label}{univie}
   {%
     \textbf{#1:}\space%
   }
  \AssignSocketPlug{caption/label}{univie}
\else% only with caption=false
  \if@uvh@captionp\else
    \long\def\@makecaption#1#2{%
      \vskip\abovecaptionskip
      \sbox\@tempboxa{\textbf{#1:} #2}%
      \ifdim \wd\@tempboxa >\hsize
        \textbf{#1:} #2\par
      \else
        \global \@minipagefalse
        \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
      \fi
      \vskip\belowcaptionskip}
  \fi
\fi


%% ============================================================
%% LENGTHS
%% ============================================================

% Horizontal offsets 
\newlength\headeroffset
\newlength\titleoffset
\setlength\headeroffset{7mm}
\setlength\titleoffset{-5.7mm}
\newlength\widsubtitleoffset
\setlength\widsubtitleoffset{-1.5pt}

% Vertical spacing
\newlength\beforetitling
\newlength\beforeevent
\newlength\beforetitle
\newlength\beforesubtitle
\newlength\beforedate
\newlength\aftertitle
\setlength\beforetitling{18pt}
\setlength\beforeevent{6pt}
\setlength\beforesubtitle{6pt}
\setlength\beforetitle{6pt}
\setlength\beforedate{8pt}
\setlength\aftertitle{18pt}
\newlength\beforeeventdate
\setlength\beforeeventdate{.3\baselineskip}


%% ============================================================
%% 1 Personal data
%% ============================================================

% a.) Department
\def\uvh@department@de{\empty}
\def\uvh@department@en{\empty}
\newcommand*\hoDept[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@department@en{#2}
  \else\def\uvh@department@en{#1}\fi
  \def\uvh@department@de{#2}
}

% b.) Name & function
\def\uvh@name@de{}
\def\uvh@name@en{}
\newcommand*\hoName[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@name@en{#2}
  \else\def\uvh@name@en{#1}\fi
  \def\uvh@name@de{#2}
}
\def\uvh@shortname@de{}
\def\uvh@shortname@en{}
\newcommand*\hoShortName[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@shortname@en{#2}
  \else\def\uvh@shortname@en{#1}\fi
  \def\uvh@shortname@de{#2}
}
%
\def\uvh@function@de{}
\def\uvh@function@en{}
\newcommand*\hoFunction[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@function@en{#2}
  \else\def\uvh@function@en{#1}\fi
  \def\uvh@function@de{#2}
}

% c.) A collaborator's name & function
\def\uvh@secname{}
\newcommand*\hoSecName[1]{\def\uvh@secname{#1}}
\def\uvh@shortsecname{}
\newcommand*\hoShortSecName[1]{\def\uvh@shortsecname{#1}}
%
\def\uvh@secfunction@de{}
\def\uvh@secfunction@en{}
\newcommand*\hoSecFunction[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@secfunction@en{#2}
  \else\def\uvh@secfunction@en{#1}\fi
  \def\uvh@secfunction@de{#2}
}

% d.) Department address
\def\uvh@street{}
\newcommand*\hoStreet[1]{\def\uvh@street{#1}}
%
\def\uvh@postcode{}
\newcommand*\hoPostCode[1]{\def\uvh@postcode{#1}}
%
\def\uvh@location@de{}
\def\uvh@location@en{}
\newcommand*\hoLoc[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@location@en{#2}
  \else\def\uvh@location@en{#1}\fi
  \def\uvh@location@de{#2}
}
%
\def\uvh@country@de{}
\def\uvh@country@en{}
\newcommand*\hoCountry[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@country@en{#2}
  \else\def\uvh@country@en{#1}\fi
  \def\uvh@country@de{#2}
}

% e.) Contact
\def\uvh@phone{}
\newcommand*\hoPhone[1]{\def\uvh@phone{#1}}
%
\def\uvh@fax{}
\newcommand*\hoFax[1]{\def\uvh@fax{#1}}
%
\def\uvh@email{}
\newcommand*\hoEMail[1]{\def\uvh@email{#1}}
%
\def\uvh@url{}
\newcommand*\hoUrl[1]{\def\uvh@url{#1}}


%% ============================================================
%% 2 Titling
%% ============================================================

% a.) Handout title
\def\uvh@title{}
\def\uvh@title@header{~}
\newcommand{\hoTitle}[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@title@header{#2}
  \else\def\uvh@title@header{#1}\fi
  \def\uvh@title{#2}
  \thispagestyle{firstpage}%
}
\def\uvh@titleprefix{}
\newcommand{\hoTitlePrefix}[1]
{%
  \def\uvh@titleprefix{#1}%
}

% b.) Handout subtitle
\def\uvh@subtitle{}
\def\uvh@widesubtitle{}
\newcommand{\hoSubtitle}{\@ifstar{\@@hoSubtitle}{\@hoSubtitle}}
% Starred version: wide subtitle
\newcommand{\@hoSubtitle}[1]
{%
  \if@uvh@usewidesubtitle
    \def\uvh@widesubtitle{#1}%
  \else
    \def\uvh@subtitle{#1}%
  \fi
}
% Unstarred version: normal (narrow) subtitle
\newcommand{\@@hoSubtitle}[1]
{%
  \def\uvh@widesubtitle{#1}%
}

% c.) Event title 
\def\uvh@event{}
\def\uvh@event@header{~}
\newcommand*{\hoEvent}[2][\@empty]{%
  \ifx\@empty#1\def\uvh@event@header{#2}
  \else\def\uvh@event@header{#1}\fi
  \def\uvh@event{#2}
}

% d.) Event location
\def\uvh@eventlocation{}
\def\uvh@eventlocation@header{}
\newcommand*{\hoEventLoc}[2][\@empty]{%
  \ifx\@empty#1\def\uvh@eventlocation@header{#2}
  \else\def\uvh@eventlocation@header{#1}\fi
  \def\uvh@eventlocation{#2}
}

% e.) Event date
\def\uvh@eventdate{}
\def\uvh@eventdate@header{}
\newcommand*{\hoEventDate}[2][\@empty]{%
  \ifx\@empty#1\def\uvh@eventdate@header{#2}
  \else\def\uvh@eventdate@header{#1}\fi
  \def\uvh@eventdate{#2}
}

% f.) Presentation date
\def\uvh@date{}
\def\uvh@date@header{}
\newcommand*{\hoDate}[2][\@empty]{%
  \ifx\@empty#1\def\uvh@date@header{#2}
  \else\def\uvh@date@header{#1}\fi
  \def\uvh@date{#2}
}

% Indentation of hanging title (w/ title prefix)
\newlength\uvh@titlehang

% The maketitle routine
\renewcommand\maketitle{%
  \newif\ifuvh@eventline\uvh@eventlinefalse%
  \ifx\uvh@event\empty\else\uvh@eventlinetrue\fi%
  \ifx\uvh@eventdate\empty\else\uvh@eventlinetrue\fi%
  \ifx\uvh@eventlocation\empty\else\uvh@eventlinetrue\fi%
  \if@uvh@tagging
    % head of the first page: tagged here, in the reading order before the title
    \tagstructbegin{tag=Part}%
    \global\setbox\uvh@headbox\hbox{\uvh@firstpagehead@setup\uvh@firstpagehead@body}%
    \tagstructend
  \fi%
  \vspace*{\beforetitling}%
  \if@uvh@tagging
    \tagstructbegin{tag=Title}
  \fi%
  \hspace*{\titleoffset}%
  \parbox{0.63\columnwidth}{%
    \raggedright%
    \ifx\uvh@event\empty\else
      \vspace*{\beforeevent}%
      \bgroup\uvh@font@event\uvh@event\egroup%
      \ifx\uvh@eventlocation\empty\else\par\fi%
    \fi%
    \ifx\uvh@eventlocation\empty\else
      \bgroup\uvh@font@eventlocdate\uvh@eventlocation\egroup%
    \fi%
    \if@uvh@sepeventdate\else%
      \ifx\uvh@eventdate\empty\else%
        \bgroup\uvh@font@eventlocdate\ (\uvh@eventdate)\egroup%
      \fi%
    \fi%
    \ifuvh@eventline\par\fi
    \ifx\uvh@title\empty\else
       \ifx\uvh@titleprefix\empty%
          \raggedright\uvh@font@title\uvh@font@title\uvh@title\par%
       \else%
          % width of prefix (incl. space) = hanging indent;
          \settowidth\uvh@titlehang{\uvh@font@title\uvh@titleprefix\enskip}%
          \hangindent\uvh@titlehang \hangafter\@ne% hang on l. 2ff
          \raggedright\uvh@font@title\uvh@titleprefix\enskip\uvh@font@title\uvh@title\par%
       \fi%
       \ifx\uvh@subtitle\empty%
 	 \addtolength\beforeeventdate{.3\baselineskip}%
       \else%
         \vspace{\beforesubtitle}\noindent\bgroup\raggedright%
         \ifx\uvh@titleprefix\empty\else%
	   \hangindent\uvh@titlehang \hangafter\z@% hang on all lines
         \fi%
         \uvh@font@subtitle\uvh@subtitle\par\egroup%
       \fi%
       \@ifundefined{hypersetup}{}{%
          \uvh@set@pdfauthor
          \hypersetup{pdftitle=\ifx\uvh@titleprefix\empty\else\uvh@titleprefix~\fi\uvh@title,
                      pdfauthor=\uvh@pdfauthor,
                      pdfcreator={LaTeX2e}}}%
    \fi%
  }\par%
  \ifx\uvh@widesubtitle\empty\else%
    \vspace{\beforesubtitle}
    \bgroup
       \noindent\hspace{\widsubtitleoffset}\raggedright\uvh@font@subtitle\uvh@widesubtitle\par%
    \egroup%
  \fi%
  \if@uvh@tagging\tagstructend\fi
  \if@uvh@sepeventdate%
     \ifx\uvh@eventdate\empty\else%
        \vspace{\beforeeventdate}%
        \noindent\bgroup\uvh@font@eventlocdate{}\uvh@eventdate\egroup%
      \fi%
  \fi%
  \vspace{\aftertitle}%
  \@afterindentfalse\@afterheading%
}

% Easy way to change bibliography heading
\def\uvh@bibheading{\refname}
\NewDocumentCommand\Bibheading{m}
   {\def\uvh@bibheading{#1}}

\if@uvh@useDocumentMetadata
  \renewenvironment{thebibliography}[1]
     {\section*{\uvh@bibheading}%
      \@mkboth{\MakeUppercase\uvh@bibheading}{\MakeUppercase\uvh@bibheading}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \parsep=0pt
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      % Smaller
      \footnotesize%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
  \let\@openbib@code\@empty
\else
  \AddToHook{env/thebibliography/begin}{
    % Smaller
    \footnotesize%
    % Custom heading
    \renewcommand*\refname{\uvh@bibheading}%
  }
\fi


% Adjust logo positioning for landscape
\newlength\lsoffset
\if@uvh@landscape
  \setlength\lsoffset{8cm}
  \addtolength\headeroffset{\lsoffset}
\fi


%% ============================================================
%% HELPER MACRIOS:
%% ============================================================

% Aux linebreak macro, since \\ is redefined by beamer article
\NewDocumentCommand\uvh@linebreak { o }
{%
   % With beamer(article) we need to pass the action spec
   \ifdefined\beameroriginal
     \IfNoValueTF{#1}
       {\\<all>}
       {\\<all>[#1]}%
   \else
     \IfNoValueTF{#1}
       {\\}
       {\\[#1]}%
  \fi%
}

% \and separates several names or e-mail addresses (as in \author of the
% standard classes, where it ends and restarts a tabular -- which is not
% allowed outside of a tabular). Here it is redefined locally: a line break in
% the head of the first page, \uvh@secnamesep in the running head and in the PDF
% metadata, and a split into separate links for e-mail addresses.
\newif\ifuvh@firstemail

\ExplSyntaxOn
\cs_new_protected:Npn \uvh@printemail #1
  { 
    \exp_args:Ne \uvh@printemail@i { \tl_trim_spaces:n {#1} }
  }

% PDF author: names separated by commas
\cs_new_protected:Npn \uvh@set@pdfauthor
  {
    \group_begin:
      \cs_set_eq:NN \and \scan_stop:
      \tl_set:Ne \l_tmpa_tl { \uvh@name }
      \tl_replace_all:Nnn \l_tmpa_tl { ~ \and } { \and }
      \tl_replace_all:Nnn \l_tmpa_tl { \and } { \uvh@secnamesep }
      \tl_gset_eq:NN \uvh@pdfauthor \l_tmpa_tl
    \group_end:
  }
\ExplSyntaxOff

\newcommand*\uvh@printemail@i[1]{%
  \ifuvh@firstemail
    \ifx\uvh@emailprefix\empty\else\uvh@emailprefix\ \fi
    \global\uvh@firstemailfalse
  \fi
  \href{mailto:#1}{#1}%
}

\def\uvh@printemails@i#1\and#2\@nil{%
  \uvh@printemail{#1}%
  \ifx\relax#2\relax\else
    \uvh@linebreak
    \uvh@printemails@i#2\@nil% #2 already ends with \and
  \fi%
}

\newcommand*\uvh@printemails{%
  \global\uvh@firstemailtrue
  \expandafter\uvh@printemails@i\uvh@email\and\@nil%
}

% \href is not available without hyperref (which is loaded with tagging only)
\AtBeginDocument{\providecommand*\href[2]{#2}}

% Allow hyphenation after \slash
\def\slash{/\penalty\exhyphenpenalty\hskip\z@skip}


%% ============================================================
%% LOCALIZATION:
%% ============================================================

\RequirePackage{translator}
\languagealias{naustrian}{German}
\deftranslation[to=German]{draft}{ENTWURF}
\deftranslation[to=English]{draft}{DRAFT}
\deftranslation[to=German]{section}{Abschnitt}
\deftranslation[to=English]{section}{section}
\deftranslation[to=German]{footnote}{Anm.}
\deftranslation[to=English]{footnote}{fn.}
\deftranslation[to=German]{example}{Beispiel}
\deftranslation[to=English]{example}{example}
\deftranslation[to=German]{urlaccess}{Abruf am:}
\deftranslation[to=English]{urlaccess}{last accessed:}


%% ============================================================
%% Page styles
%% ============================================================

%
% First page

\newlength\logopos

\ExplSyntaxOn
% Head of the first page. The content is defined once; with tagging it is
% typeset in a box by \maketitle (as normal, tagged content before the title)
% and only placed into the header here. The header itself is typeset by the
% output routine, where tagpdf suspends tagging.
\newsavebox\uvh@headbox
\newcommand*\uvh@firstpagehead@setup{%
  % No Div for the \parbox of the head: with tagging the Div of a \parbox in a
  % box would end up beside the Part (tagpdf) and leave empty P behind; without
  % it, the paragraphs of the box are direct children of the Part.
  \if@uvh@tagging
    \AssignSocketPlug{tagsupport/parbox/before}{noop}%
    \AssignSocketPlug{tagsupport/parbox/after}{noop}%
  \fi
  \let\and\uvh@linebreak
  \unitlength1mm
  \setlength\logopos{\textwidth}%
  \addtolength\logopos{-77mm}%
}
\newcommand*\uvh@firstpagehead@body{%
    \hspace*{\logopos}\uvh@printlogo\par
    \hspace*{-52mm}
    \parbox[t]{51.5mm}
      {%
       \if@uvh@landscape\else
          \vspace*{.8\baselineskip}%
       \fi
       \begin{flushleft}%
         \if\uvh@department\empty\else
             \vspace*{8pt}
             \uvh@font@department\uvh@department\par
             \vspace*{3pt}
         \fi%
         \uvh@font@header\uvh@name%
         \ifx\uvh@secname\empty\else
             \uvh@secnamesep\uvh@secname%
         \fi%
         \if\uvh@function\empty\else
            \uvh@linebreak%
            \uvh@function%
         \fi%
         \if\uvh@street\empty\else
            \uvh@linebreak%
            \uvh@street%
         \fi%
         \if\uvh@location\empty\else
            \uvh@linebreak%
            \uvh@postcode\ \uvh@location%
         \fi%
         \vspace{10pt}%
         \if\uvh@phone\empty\else
            \uvh@linebreak%
            \ifx\uvh@phoneprefix\empty\else
                \uvh@phoneprefix\ %
            \fi
            \uvh@phone%
         \fi%
         \if\uvh@fax\empty\else
             \uvh@linebreak%
             \ifx\uvh@faxprefix\empty\else
                 \uvh@faxprefix\ %
             \fi
             \uvh@fax%
         \fi%
         \if\uvh@email\empty\else
             \uvh@linebreak%
             \uvh@printemails%
         \fi%
         \ifx\uvh@url\empty\else
             \uvh@linebreak%
             \ifx\uvh@urlprefix\empty\else
                \uvh@urlprefix\ %
             \fi
             \href{\uvh@url}{\uvh@url}%
         \fi%
      \end{flushleft}%
    }%
}
\def\ps@firstpage{
  \headheight20.5mm%
  \headsep9.5mm%
  \footskip8mm%
  \def\@oddhead{%
    \ifvoid\uvh@headbox
      \uvh@firstpagehead@setup
      \uvh@firstpagehead@body
    \else
      \box\uvh@headbox
    \fi
    % \unitlength is set in \uvh@firstpagehead@setup, i.e. inside the box
    % (tagging) -- the marks below need it as well
    \unitlength1mm
    \if@uvh@punchmark
        \begin{picture}(0,0)
        \put(-192,-123){\line(1,0){4}}
        \end{picture}
    \fi
    \if@uvh@foldmarks
        \begin{picture}(0,0)
        \put(-190,-72){\line(1,0){3}}
        \put(-190,-174){\line(1,0){3}}
        \end{picture}
    \fi
    \hfill%
  }
  \if@uvh@pageonfirst
    \def\@oddfoot{%
       \if@uvh@tagging
          \leavevmode
          \tag_mc_end_push:
          \tagmcbegin{artifact=pagination/footer}
       \fi
       \hfill\uvh@font@footer\raggedright\uvh@pageprefix\ \thepage%
       \if@uvh@lastpage
          /\pageref{LastPage}%
       \fi%
       \if@uvh@tagging
          \tagmcend
          \tag_mc_begin_pop:n{artifact}
       \fi
    }
  \else
    \def\@oddfoot{}
  \fi
  \def\@evenhead{\@oddhead}
  \def\@evenfoot{\@oddfoot}
}

%
% Pages > 1

\newif\ifnoevent\noeventfalse
\def\heventtitlesep{}

\def\ps@headings{%
  \headheight20mm
  \headsep2.5mm
  \footskip8mm
  \def\titleline{%
      \ifx\uvh@title@header\empty\else
          \uvh@font@headertitle%
          \ifx\uvh@titleprefix\empty\else
             \uvh@titleprefix\ %
          \fi%
          \uvh@title@header%
          \linebreak%
      \fi%
  }%
  \ifx\uvh@eventlocation@header\empty%
     \ifx\uvh@eventdate@header\empty
       \noeventtrue%
     \fi%
  \fi%
  \def\eventline{%
      \uvh@font@header\uvh@event@header%
      \ifx\uvh@eventdate@header\empty\else
         \if@uvh@breakevent\linebreak\else\ \fi%
         \ifnoevent\else
            (\ifx\uvh@eventlocation@header\empty\else
               \uvh@eventlocation@header,\ %
             \fi%
             \uvh@eventdate@header)%
         \fi
         \linebreak%
      \fi%
  }
  \def\@oddhead{%
    \def\and{\unskip\uvh@secnamesep}%
    \if@uvh@tagging
          \leavevmode
          \tag_mc_end_push:
          \tagmcbegin{artifact=pagination/header}
    \fi
    \parbox[b]{117mm}
       {\begin{flushleft}%
           \uvh@font@header\if\hfuzz\uvh@shortname\hfuzz
              \uvh@name%
           \else
              \uvh@shortname%
           \fi%
           \ifx\uvh@secname\empty\else
              \uvh@headernamesep%
              \if\hfuzz\uvh@shortsecname\hfuzz
                 \uvh@secname%
              \else
                 \uvh@shortsecname%
              \fi%
           \fi%
           \ifx\uvh@department\empty\else
              \uvh@headerdeptsep\uvh@department%
           \fi
           \linebreak
           \if@uvh@swaphead
             \eventline%
             \heventtitlesep%
             \titleline%
           \else
             \titleline%
             \eventline%
           \fi
         \end{flushleft}%
    }
    \hfill%
    \if@uvh@pplogo
       \if@uvh@landscape
        \raisebox{7mm}{\uvh@printsmalllogo}
       \else
        \raisebox{5mm}{\uvh@printsmalllogo}
       \fi
    \fi
    \if@uvh@tagging
        \tagmcend
        \tag_mc_begin_pop:n{artifact}
    \fi
  }
  \def\@oddfoot{%
       \if@uvh@tagging
          \leavevmode
          \tag_mc_end_push:
          \tagmcbegin{artifact=pagination/footer}
       \fi
       \hfill\uvh@font@footer\raggedright\uvh@pageprefix\ \thepage%
       \if@uvh@lastpage
          /\pageref{LastPage}%
       \fi%
       \if@uvh@tagging
          \tagmcend
          \tag_mc_begin_pop:n{artifact}
       \fi
  }
  \def\@evenhead{\@oddhead}
  \def\@evenfoot{\@oddfoot}
}
\ExplSyntaxOff



%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

\if@uvh@captionp
  \if@uvh@useDocumentMetadata
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
     % For justification=RaggedRight we need to redefine
     % \@makecaption from latex-lab-testphase-float.sty
     % since centering is currently hardcoded there
     % (format=hang is implemented via \hangindent below)
     \newlength\uvh@captionhang
     \AddToHook{begindocument}
      {
        \long\def\@makecaption#1#2{%
          \UseHookWithArguments{cmd/@makecaption/before}{2}{#1}{#2}%
          \vskip\abovecaptionskip%
          \SuspendTagging{\@makecaption}%
          % width of label (incl. separator) = hanging indent;
          % \settowidth uses \@tempboxa, so measure before the next \sbox
          \settowidth\uvh@captionhang{\UseSocket{caption/label}{#1}}%
          \sbox\@tempboxa{\UseSocket{caption/label}{#1}#2}%
          \ResumeTagging{\@makecaption}%
          \UseTaggingSocket{caption/begin}{\@current@float@struct}%
          \ifdim \wd\@tempboxa >\hsize
            \begingroup
              \RaggedRight% justification=RaggedRight
              \hangindent\uvh@captionhang \hangafter\@ne% format=hang
              \UseTaggingSocket{caption/label/begin}
              \UseSocket{caption/label}{#1}
              \UseTaggingSocket{caption/label/end}
              \UseTaggingSocket{para/begin}
                #2%
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
    \RequirePackage[format=hang,
                    justification=RaggedRight,
                    singlelinecheck=false,
                    labelfont=bf,
                    tableposition=top
                   ]{caption}
  \fi
\fi

%% =============================================================
%% POLYGLOSSIA:
%% =============================================================

\if@uvh@polyglossia
  \if@uvh@captionp
    \RequirePackage{ragged2e}
  \fi
  \RequirePackage{polyglossia}
\else
  \RequirePackage{babel}[1997/01/23]
\fi

%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\if@uvh@biblatex

\if@uvh@apa
% Load biblatex with apa style
\RequirePackage[%
  style=apa,
  natbib=true,
  sorting=nyvt,
  sortcites=true,
  backend=biber]
{biblatex}

% Map localization files to the apa variants
\DeclareLanguageMapping{english}{english-apa}
\DeclareLanguageMapping{german}{german-apa}
\DeclareLanguageMapping{ngerman}{ngerman-apa}
\DeclareLanguageMapping{austrian}{austrian-apa}
\DeclareLanguageMapping{naustrian}{naustrian-apa}

% Adapt to the DGPs guidelines:
% 1. Use "et al." (rather than "u.a.") in German
% 2. No comma before final and/& in German
% 3. "forthcoming a" rather than "forthcoming-a"
\DefineBibliographyStrings{german}{%
   andothers = {et al\adddot}%
}
\DefineBibliographyExtras{german}{%
   \def\finalandcomma{}%
}
\DefineBibliographyStrings{ngerman}{%
   andothers = {et al\adddot}%
}
\DefineBibliographyExtras{ngerman}{%
   \def\finalandcomma{}%
}
\DefineBibliographyStrings{austrian}{%
   andothers = {et al\adddot}%
}
\DefineBibliographyExtras{austrian}{%
   \def\finalandcomma{}%
}
\DefineBibliographyStrings{naustrian}{%
   andothers = {et al\adddot}%
}
\DefineBibliographyExtras{naustrian}{%
   \def\finalandcomma{}%
}
\renewcommand{\apashortdash}{~}

% Change cite command for integrated csquotes env.
\AddToHook{package/csquotes/after}{\SetCiteCommand{\parencite}}
% Map \citealp to \nptextcite
\let\citealp\nptextcite
%
\else% Unified Style for Linguistics
\RequirePackage[%
  style=univie-ling,
  sorting=nyvt,
  sortcites=true,
  backend=biber]
{biblatex}

% Change cite command for integrated csquotes env.
\AddToHook{package/csquotes/after}{\SetCiteCommand{\parencite}}

% End of @uvh@apa condition
\fi

\DeclarePrintbibliographyDefaults{title=\uvh@bibheading}

\else% @uvt@biblatex condition FALSE

% Some support for legacy bibtex
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

% End of @uvt@biblatex condition
\fi


%% ============================================================
%% QUOTATION
%% ============================================================

% Quote (smaller)
\let\@uvh@save@quote\quote
\renewcommand*{\quote}{\@uvh@save@quote\small}

% Quotation (smaller)
\let\@uvh@save@quotation\quotation
\renewcommand*{\quotation}{\@uvh@save@quotation\small}

% Smart quotes
\RequirePackage{csquotes}
\ExecuteQuoteOptions{autostyle=tryonce,german=guillemets,austrian=guillemets,maxlevel=3}
% Add quotation marks on displayed quotations
% a.) for commands "\blockquote" and related:
\renewcommand{\mkblockquote}[4]{\openautoquote#1\closeautoquote#2#4#3}
% b.) for environments "displayquote" and related:
\renewcommand{\mkbegdispquote}[2]{\textooquote\advance\csq@qlevel\@ne}
\renewcommand{\mkenddispquote}[2]{\textcoquote\csq@qlevel\@ne#1#2}


%% =============================================================
%% X-REFS:
%% =============================================================

\if@uvh@refsp

\AtBeginDocument{%
 % Varioref:
 \RequirePackage{varioref}
  \vref@addto\extrasnaustrian{%
    \def\reftextafter{auf der \reftextvario{folgenden}{n\"achsten} Seite}%
    \def\reftextfaceafter{auf der gegen\"uberliegenden Seite}%
    \def\reftextbefore{auf der \reftextvario{vorhergehenden}{vorangegangenen} Seite}%
    \def\reftextfacebefore{auf der gegen\"uberliegenden Seite}%
    \def\reftextfaraway#1{auf S.~\pageref{#1}}%
    \def\reftextpagerange#1#2{auf S.~\pageref{#1}--\pageref{#2}}%
  }%
  % Prettyref:
  % (varioref-Befehle mit eingebunden)
  \RequirePackage{prettyref}
  \newrefformat{sec}{\translate{section}~\ref{#1}}
  \newrefformat{sub}{\translate{section}~\ref{#1}}
  \newrefformat{anm}{\translate{footnote}~\ref{#1}}
  \newrefformat{app}{\appendixname~\vref{#1}}
  \newrefformat{tab}{\tablename~\vref{#1}}
  \newrefformat{fig}{\figurename~\vref{#1}}
  \newrefformat{exa}{\translate{example}~\vref{#1}}
}

\fi


%% =============================================================
%% DRAFT:
%% =============================================================

\if@uvh@draftmark

\if@uvh@draftmarkfp
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

%% ============================================================
%% Semantic markup
%% ============================================================

% Helper function (wrapper) for semantic tagging
\ExplSyntaxOn
\if@uvh@tagging
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


\endinput
%%
%% End of file `univie-ling-handout.cls'.
