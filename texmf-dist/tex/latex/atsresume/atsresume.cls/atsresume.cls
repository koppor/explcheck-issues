%% atsresume.cls
%% A one-column resume class whose PDF text comes out complete and in
%% reading order, which is what applicant tracking systems need to parse it.
%%
%% Copyright (C) 2026 Super Lede
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% The Current Maintainer of this work is Super Lede.
%%
%% This work consists of the files atsresume.cls, atsresume-example.tex
%% and atsresume-doc.tex, and the derived files atsresume-example.pdf
%% and atsresume-doc.pdf.
%%
%% The layout is the Classic template from https://readableresume.com
%% (originally a Google Docs and Word file): centered name, section
%% headings in capitals over a thin rule, places and dates on the right.
\NeedsTeXFormat{LaTeX2e}[2021/11/15]
\ProvidesClass{atsresume}
  [2026/10/20 v1.0.0 One-column resume with ATS-readable PDF text]

% ---------------------------------------------------------------- options
\newif\ifatsresume@afour
\DeclareOption{a4paper}{\atsresume@afourtrue}
\DeclareOption{letterpaper}{\atsresume@afourfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\RequirePackage{iftex}

% The margins of the original: 0.6 in on US Letter, 15 mm on A4.
\RequirePackage{geometry}
\ifatsresume@afour
  \geometry{a4paper, margin=15mm}
\else
  \geometry{letterpaper, margin=0.6in}
\fi

% ---------------------------------------------------------------- fonts
% TeX Gyre Pagella on every engine: the Type 1 version under pdfLaTeX, the
% OpenType version under LuaLaTeX and XeLaTeX, so line breaks match. It is
% part of TeX Live (and of Debian's and Ubuntu's tex-gyre packages), and its
% letters are about as wide as Georgia's, the font of the original, so lines
% break in nearly the same places and a resume that fits on one page there
% fits here too.
%
% Ligatures are turned off. A ligature is one glyph standing for "fi" or
% "fl", and some PDF readers turn it into a single character (U+FB01) that
% a parser doesn't match with "fi". Only the f-ligatures go: the input
% ligatures -- and `` still give an en dash and quotes.
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage{tgpagella}
  \RequirePackage[protrusion=false, expansion=false]{microtype}
  \DisableLigatures[f]{encoding = *}
  % Every glyph gets a Unicode mapping, so copied text matches what was typed
  \input{glyphtounicode}
  \pdfgentounicode=1
  % pdfTeX can also write fake space characters between words
  % (\pdfinterwordspaceon). Not used: OpenResume, a pdf.js-based resume
  % parser, then reads every line as one long word. Readers find the word
  % breaks from the gaps, as they do in LuaLaTeX and XeLaTeX output.
\else
  \RequirePackage{fontspec}
  \setmainfont{texgyrepagella}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
    Ligatures      = {TeX, NoCommon}]
\fi

% ---------------------------------------------------------------- page
% 10.5 pt text, the size of the original. The baseline skip is the
% original's line spacing (1.1 lines of Georgia).
\renewcommand\normalsize{\@setfontsize\normalsize{10.5}{13.1}}
\normalsize
\setlength\topskip{10.5pt}
\setlength\parindent{0pt}
\setlength\parskip{0pt}
\pagestyle{empty}
\frenchspacing

% Left aligned, and no word is ever split across lines. A hyphenated word
% can reach a parser as two fragments and stop matching keywords.
\raggedright
\hyphenpenalty=10000
\exhyphenpenalty=10000
\emergencystretch=2em

\RequirePackage[bookmarks=false, pdfpagelabels=false]{hyperref}
\hypersetup{hidelinks, pdflang={en}}

% ---------------------------------------------------------------- lengths
% Measured against a PDF export of the original at the same size: the
% gaps between baselines come out within half a point of it.
\newlength\atsresume@sectionskip \setlength\atsresume@sectionskip{9pt}
\newlength\atsresume@entryskip   \setlength\atsresume@entryskip{9pt}
\newlength\atsresume@rulegap     \setlength\atsresume@rulegap{3.6pt}
\newlength\atsresume@rulewidth   \setlength\atsresume@rulewidth{0.75pt}
% From the rule down to the next baseline, compared with a normal line
\newlength\atsresume@afterrule   \setlength\atsresume@afterrule{-1pt}

\newcommand\atsresume@namefont{\fontsize{20}{24}\selectfont\bfseries}
\newcommand\atsresume@headingfont{\fontsize{11}{13.2}\selectfont\bfseries}

% True when the argument is empty. Nothing in it is expanded, so a user's
% text is never run during the test.
\newcommand\atsresume@ifempty[1]{%
  \if\relax\detokenize{#1}\relax
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi}

% ---------------------------------------------------------------- header
\let\atsresume@name\@empty
\let\atsresume@contactitems\@empty
\newcommand\name[1]{%
  \def\atsresume@name{#1}%
  \hypersetup{pdfauthor={#1}, pdftitle={#1 – Resume}}}
\newcommand\contact[1]{%
  \g@addto@macro\atsresume@contactitems{\atsresume@contactitem{#1}}}

% Links. The address is shown as typed; a bare web address gets https://
% in the link only. The address is taken as plain characters, so _ # & ~
% need no escaping; if they are escaped anyway (first\_last, out of LaTeX
% habit), the backslash is dropped rather than printed into the address.
% A % must be typed \% (TeX reads a bare % as the start of a comment).
\ExplSyntaxOn
\cs_generate_variant:Nn \str_replace_all:Nnn { Nee }
\cs_generate_variant:Nn \tl_set_rescan:Nnn { Nno }
\cs_new_protected:Npn \atsresume@setaddress #1
  {
    \str_set:Nn \l_tmpa_str {#1}
    % A # typed as is arrives doubled
    \str_replace_all:Nee \l_tmpa_str { \c_hash_str \c_hash_str } { \c_hash_str }
    \clist_map_inline:nn
      { \c_underscore_str , \c_hash_str , \c_percent_str , \c_ampersand_str , \c_tilde_str }
      { \str_replace_all:Nee \l_tmpa_str { \c_backslash_str ##1 } { ##1 } }
    % The link target
    \cs_set_eq:NN \atsresume@address \l_tmpa_str
    % The text to print: the same characters read again, specials as plain
    % characters, so that under pdfLaTeX a UTF-8 letter (zoë) prints as
    % that letter rather than as its separate bytes
    \tl_set_rescan:Nno \atsresume@display
      {
        \char_set_catcode_other:N \\
        \char_set_catcode_other:N \#
        \char_set_catcode_other:N \%
        \char_set_catcode_other:N \&
        \char_set_catcode_other:N \~
        \char_set_catcode_other:N \_
        \char_set_catcode_other:N \^
        \char_set_catcode_other:N \$
      }
      { \l_tmpa_str }
  }
% True if the address starts with http:// or https://
\cs_new:Npn \atsresume@ifscheme
  {
    \bool_lazy_or:nnTF
      { \str_if_eq_p:ee { \str_range:Nnn \l_tmpa_str { 1 } { 8 } } { https:// } }
      { \str_if_eq_p:ee { \str_range:Nnn \l_tmpa_str { 1 } { 7 } } { http:// } }
  }
\ExplSyntaxOff
\newcommand\email[1]{%
  \begingroup
  \atsresume@setaddress{#1}%
  \href{mailto:\atsresume@address}{\atsresume@display}%
  \endgroup}
\newcommand\weblink[1]{%
  \begingroup
  \atsresume@setaddress{#1}%
  \atsresume@ifscheme
    {\href{\atsresume@address}{\atsresume@display}}%
    {\href{https://\atsresume@address}{\atsresume@display}}%
  \endgroup}

\newcommand\makeheader{%
  \par
  \ifx\atsresume@name\@empty
    \ClassError{atsresume}{No name given}
      {Put \protect\name{Your Name} in the preamble.}%
  \fi
  % The strut puts the first baseline where the original has it, one
  % ascent below the top margin, whatever letters the name has.
  {\centering\atsresume@namefont\vrule\@width\z@\@height 18.3pt\relax
   \atsresume@name\par}%
  \ifx\atsresume@contactitems\@empty\else
    \vskip 2.5pt\relax
    {\centering
     % Each item stays on one line; a long contact line wraps at the bars.
     \let\atsresume@sep\@empty
     \def\atsresume@contactitem##1{%
       \atsresume@sep\mbox{##1}%
       \def\atsresume@sep{\nobreakspace\textbar\space}}%
     \atsresume@contactitems\par}%
  \fi
  \global\atsresume@firstentrytrue}

% ---------------------------------------------------------------- sections
\newif\ifatsresume@firstentry

% Centered, in capitals, over a rule. The heading always stays on the same
% page as the entry under it.
\renewcommand\section{\@ifstar\atsresume@section\atsresume@section}
\newcommand\atsresume@section[1]{%
  \par
  \@nobreakfalse
  \addvspace{\atsresume@sectionskip}%
  {\centering\atsresume@headingfont\MakeUppercase{#1}\par}%
  \nobreak
  \vskip-\prevdepth
  \vskip\atsresume@rulegap
  \hrule\@height\atsresume@rulewidth\relax
  \nobreak
  % The next baseline sits one \baselineskip under the rule, less a little
  \prevdepth\z@
  \vskip\atsresume@afterrule
  \global\atsresume@firstentrytrue
  \@afterindentfalse
  \@afterheading}

% ---------------------------------------------------------------- entries
% One line with a left part and a right part. Both are plain text in reading
% order: the right part is pushed to the margin with glue, not placed in a
% table, a column or a box at a fixed position, so a parser reads "Company
% City" left to right. If the two don't fit on one line the right part moves
% to the next line, still flush right. (The glue trick is from The TeXbook,
% chapter 14.)
% #1 the left part, ready to print; #2 a style for the right part (a
% command taking one argument); #3 the right part as the user typed it.
\newcommand\atsresume@row[3]{%
  \begingroup
  % Finite stretch, so the \hfil below wins and the right part sits flush
  % right, while a long left part still wraps ragged.
  \rightskip\z@\@plus 4em\relax
  % A row that wraps stays on one page
  \interlinepenalty\@M
  \noindent#1%
  \atsresume@ifempty{#3}{}{%
    \unskip\nobreak\hfil\penalty50\hskip1em\hbox{}\nobreak\hfil
    \mbox{#2{#3}}%
    \parfillskip\z@skip}%
  \par
  \endgroup}

\newcommand\atsresume@startentry{%
  \par
  \ifatsresume@firstentry\else
    \addvspace{\atsresume@entryskip}%
  \fi
  \global\atsresume@firstentryfalse
  % Left over from a heading with nothing under it; it would stop the
  % list below from adding its no-break penalty
  \@nobreakfalse}

% The lines of an entry are joined with \nobreak. The entry stays with its
% first bullet through the list's \@beginparpenalty (see itemize below);
% nothing joins it to what follows otherwise, so a run of entries without
% bullets can still break across pages.

% \education{School}{City, ST}{Degree}{Dates}
\newcommand\education[4]{%
  \atsresume@startentry
  \atsresume@row{\atsresume@ifempty{#1}{}{\textbf{#1}}}\@firstofone{#2}%
  \atsresume@ifempty{#3#4}{}{%
    \nobreak
    \atsresume@row{\atsresume@ifempty{#3}{}{\textit{#3}}}\textit{#4}}}

% \experience{Company}{City, ST}{Job title}{Dates}
\newcommand\experience[4]{%
  \atsresume@startentry
  \atsresume@row{\atsresume@ifempty{#1}{}{\textbf{#1}}}\@firstofone{#2}%
  \atsresume@ifempty{#3#4}{}{%
    \nobreak
    \atsresume@row{\atsresume@ifempty{#3}{}{\textit{#3}}}\@firstofone{#4}}}

% \activity{Name}{Role}{Dates}: one line, "Name | Role" and the dates
\newcommand\activity[3]{%
  \atsresume@startentry
  \atsresume@row
    {\atsresume@ifempty{#1}{}{\textbf{#1}}%
     \atsresume@ifempty{#1}{}{\atsresume@ifempty{#2}{}{ \textbar\ }}%
     \atsresume@ifempty{#2}{}{\textit{#2}}}
    \@firstofone{#3}}

% \skill{Label}{Text}: one line per call, the label in bold
\newcommand\skill[2]{%
  \par
  \global\atsresume@firstentryfalse
  {\rightskip\z@\@plus 4em\relax\noindent\textbf{#1:} #2\par}}

% ---------------------------------------------------------------- bullets
% Bullets hang like the original: the dot at 0.1 in, the text at 0.25 in.
% The dot is the text font's U+2022 bullet, not a math or symbol-font glyph,
% so it extracts as a bullet. It stays at text size on the text baseline:
% a smaller or raised dot looks closer to the original, but then pdftotext
% and other layout-guessing readers can split the dots off from their text
% as if they were a column. A bullet point never splits across pages.
\renewcommand\labelitemi{\textbullet}
\renewenvironment{itemize}
  {\list{\labelitemi}{%
     \setlength\leftmargin{0.25in}%
     \setlength\labelwidth{0.15in}%
     \setlength\labelsep{0pt}%
     \setlength\itemindent{0pt}%
     \setlength\listparindent{0pt}%
     \setlength\topsep{0pt}%
     \setlength\partopsep{0pt}%
     \setlength\parsep{0pt}%
     \setlength\itemsep{0pt}%
     \def\makelabel##1{##1\hfil}%
     % No break inside a bullet point, and none between an entry's lines
     % and its first bullet
     \interlinepenalty\@M
     \@beginparpenalty\@M}}
  {\endlist\global\atsresume@firstentryfalse}

\endinput
%%
%% End of file `atsresume.cls'.
