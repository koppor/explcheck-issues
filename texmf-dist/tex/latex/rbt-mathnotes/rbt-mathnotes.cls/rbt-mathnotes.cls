%% rbt-mathnotes.cls
%% Copyright 2021 Rebecca B. Turner.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Rebecca B. Turner.
%
% This work consists of the files:
%     README.md
%     rbt-mathnotes.tex
%     rbt-mathnotes.sty
%     rbt-mathnotes.cls
%     rbt-mathnotes-util.sty
%     rbt-mathnotes-messages.sty
%     rbt-mathnotes-hw.cls
%     rbt-mathnotes-formula-sheet.cls
%     examples/cheat-sheet.tex
%     examples/multivar.tex
%     examples/topology-hw-1.tex
% and the derived files:
%     rbt-mathnotes.pdf
%     examples/cheat-sheet.pdf
%     examples/multivar.pdf
%     examples/topology-hw-1.pdf

\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplClass{rbt-mathnotes}{2021/11/29}{1.0.2}{Styles for mathematical
  note taking.}

\PassOptionsToClass { openany, oneside } { memoir }

\LoadClass{memoir}
\setsecnumdepth{subsubsection}
\settocdepth{subsubsection}
\nouppercaseheads
\makeevenfoot { plain } { } { } { }
\makeoddfoot  { plain } { } { } { }
\makeevenhead { plain } { } { } { \thepage }
\makeoddhead  { plain } { } { } { \thepage }

\RequirePackage{etoolbox}
\RequirePackage{xparse}
\AtBeginDocument{
    \patchcmd { \@tocmaketitle }
      { \thispagestyle { chapter } }
      { }
      { }
      { }
  }

\makechapterstyle { rbt-mathnotes }
  {
    % allow for 99 chapters!
    \settowidth{\chapindent}{\chapnumfont 999}

    \RenewDocumentCommand \chapnumfont { }
      {
        \normalfont
        \huge
        \exp:w \mn__color:n {MNsecnum}
      }
    \RenewDocumentCommand \chapterheadstart { } { }
    \RenewDocumentCommand \printchaptername { } { }
    \RenewDocumentCommand \chapternamenum   { } { }
    \RenewDocumentCommand \printchapternum  { }
      {
        \noindent
        \llap
          {
            \makebox [ \chapindent ]
              { \chapnumfont \thechapter }
          }
      }
    \RenewDocumentCommand \afterchapternum  { } { }
    \RenewDocumentCommand \printchaptertitle { m }
      {
        \raggedright
        \huge
        ##1
      }
    \RenewDocumentCommand \afterchaptertitle { }
      {
        \vskip \onelineskip
        \hrule
        \vskip \onelineskip
      }
  }

\makeheadstyles { rbt-mathnotes }
  {
    \chapterstyle { rbt-mathnotes }

    \setsecnumformat
      {
        \group_begin:
        \exp:w \mn__color:n {MNsecnum}
        \cs:w the##1 \cs_end:
        \quad
        \group_end:
      }

    % Sections.
    \setbeforesecskip
      {
          -1\onelineskip plus -0.5\onelineskip minus -0.5\onelineskip
      }
    \setaftersecskip
      {
        1\onelineskip plus 0.1\onelineskip
      }
    \setsecheadstyle
      {
        \normalfont
        \memRTLraggedright
        \bfseries
        \LARGE
        % \scshape
        % \MakeTextLowercase
      }

    % Subsections.
    \setbeforesubsecskip
      {
        -1.0\onelineskip plus -0.25\onelineskip minus -0.25\onelineskip
      }
    \setaftersubsecskip
      {
        1.0\onelineskip plus 0.1\onelineskip
      }
    \setsubsecheadstyle
      {
        \sethangfrom { \noindent ####1 }
        \normalfont
        \bfseries
        \memRTLraggedright
      }

    % Subsubsections.
    \setbeforesubsubsecskip
      {
        1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip
      }
    \setaftersubsubsecskip
      {
        1.0\onelineskip plus 0.1\onelineskip
      }
    \setsubsubsecheadstyle
      {
        \normalfont
        \normalsize
        \bfseries
        \memRTLraggedright
      }

    % Paragraphs.
    \setbeforeparaskip
      {
        1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip
      }
    \setafterparaskip { -1em }
    \setparaheadstyle
      {
        \normalfont
        \normalsize
        \bfseries
      }

    % Subparagraphs.
    \setsubparaindent { \parindent }
    \setbeforesubparaskip
      {
        1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip
      }
    \setaftersubparaskip { -1em }
    \setsubparaheadstyle
      {
        \normalfont
        \normalsize
        \itshape
        \addperiod
      }
  }

\headstyles { rbt-mathnotes }

% \chapterstyle{hangnum}
% \cs_set:Npn \chapnumfont
  % {
    % \HUGE \bfseries
    % \exp:w \mn__color:n {MNsecnum}
  % }

\RequirePackage { rbt-mathnotes }
