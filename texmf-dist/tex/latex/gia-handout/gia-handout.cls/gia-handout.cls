%% gia-handout.cls
%% Copyright 2026 André Hilbig and Frederick Heyder
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
% The Current Maintainer of this work is André Hilbig.
%
% This work consists of the files
%   gia-handout.cls and
%   gia-handout-doc.tex.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gia-handout}[2026/05/04 v0.99a The gia-handout package]

\LoadClass[%
    a4paper,
    toc=flat,
    fontsize=10pt,
    parskip=half,
]{scrartcl}

\RequirePackage{iftex}

\ifPDFTeX
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
\else
    \RequirePackage{fontspec}
\fi

\RequirePackage[ngerman]{babel}
\RequirePackage[german=guillemets]{csquotes}

\RequirePackage{microtype}
\RequirePackage{setspace}

\RequirePackage[%
    top=1.7cm,
    left=3.5cm,
    right=3.5cm,
    bottom=1.7cm,
    includehead,
    includefoot
]{geometry}
\interfootnotelinepenalty=10000 % prevent page breaks in footnotes
\addtolength{\headheight}{\baselineskip}

\RequirePackage{scrlayer-scrpage}

% --- corporate design (colors) ---
\RequirePackage[dvipsnames,svgnames]{xcolor}
\definecolor{giaBlue}{RGB}{14,32,80}
\definecolor{giaYellow}{RGB}{255,230,0}
\definecolor{giaLightYellow}{RGB}{255,242,204}
\definecolor{giaGray}{RGB}{74,74,74}

\RequirePackage{tikz}
\usetikzlibrary{calc, positioning}

\RequirePackage{pgfkeys}
\RequirePackage{pgfopts}

\RequirePackage{tcolorbox}
\tcbuselibrary{breakable, skins}

\RequirePackage{xparse}

\RequirePackage{hyperref}
\RequirePackage{bookmark}

% --- class options ---
\newif\ifautorenliste
\newif\ifkoordination
\newif\ifgiaHandout@frontcover@set
\newif\ifgiaHandout@backcover@set
\newcommand{\giaHandout@autorenListe}{keine Autoren}
\newcommand{\giaHandout@koordination}{keine Angabe}
\newcommand{\giaHandout@frontcover}{}
\newcommand{\giaHandout@backcover}{}
\newcommand{\GIAsetzeautorenListe}[2][]{\renewcommand{\giaHandout@autorenListe}{#2}}
\newcommand{\GIAsetzekoordination}[2][]{\renewcommand{\giaHandout@koordination}{#2}}
\newcommand{\GIAautorenListe}{\ifautorenliste\giaHandout@autorenListe\fi}
\newcommand{\GIAkoordination}{\ifkoordination\giaHandout@koordination\fi}
\pgfkeys{
    /giaHandout/.is family, /giaHandout,
    autorenListe/.code = {\autorenlistetrue},
    koordination/.code = {\koordinationtrue},
    frontcover/.code = {
        \renewcommand{\giaHandout@frontcover}{#1}%
        \giaHandout@frontcover@settrue
    },
    backcover/.code = {
        \renewcommand{\giaHandout@backcover}{#1}%
        \giaHandout@backcover@settrue
    },
}
\ProcessPgfPackageOptions{/giaHandout}

% --- corporate design (fonts) ---
\RequirePackage[sfdefault]{FiraSans}
\RequirePackage{FiraMono}

\RequirePackage{qrcode}
% --- external code (Ulrike Fischer, Stack Exchange, 2024) ---
% https://tex.stackexchange.com/q/718239 (accessed 2026-03-20)
\ExplSyntaxOn
\cs_new_protected:Npn\qr@savepos
 {
  \tex_savepos:D
  \RecordProperties{qr@save-\theqrcodecnt}{xpos,ypos}
  \tex_savepos:D
 }
\cs_new:Npn \qr@diminbp #1 {\dim_to_decimal_in_bp:n {#1}}
\ExplSyntaxOff

\newcounter{qrcodecnt}
\NewSocket{tagsupport/qrcode/begin}{0}
\NewSocket{tagsupport/qrcode/end}{0}
\NewSocketPlug{tagsupport/qrcode/begin}{tag}
 {%
   \leavevmode
   \tagmcend%
   \stepcounter{qrcodecnt}\qr@savepos%
   \ExpandArgs{e}\tagpdfsetup
     {role/new-attribute=
      {qrcode-\theqrcodecnt}
      {
       /O /Layout
       /BBox [\qr@diminbp{\RefProperty{qr@save-\theqrcodecnt}{xpos}sp}
              \qr@diminbp{\RefProperty{qr@save-\theqrcodecnt}{ypos}sp-0.5\qr@desiredheight}
              \qr@diminbp{\RefProperty{qr@save-\theqrcodecnt}{xpos}sp+\qr@desiredheight}
              \qr@diminbp{\RefProperty{qr@save-\theqrcodecnt}{ypos}sp+0.5\qr@desiredheight}]
      }%
     }%
   \tagstructbegin{tag=Figure,alt=\qr@texttoencode,
    attribute=qrcode-\theqrcodecnt}%
   \tagmcbegin{}%
  }

\NewSocketPlug{tagsupport/qrcode/end}{tag}
 {\tagmcend\tagstructend\tagmcbegin{}}

\AssignSocketPlug{tagsupport/qrcode/begin}{tag}
\AssignSocketPlug{tagsupport/qrcode/end}{tag}

\def\qrcode@hyperwrapper@hyperref#1{%
  \href{\qr@texttoencode}%
   {\UseTaggingSocket{qrcode/begin}\SuspendTagging{qrcode}%
    #1\ResumeTagging{qrcode}\UseTaggingSocket{qrcode/end}}}

\def\qrcode@hyperwrapper@nohyperref#1{%
  \UseTaggingSocket{qrcode/begin}\SuspendTagging{qrcode}%
  #1\ResumeTagging{qrcode}\UseTaggingSocket{qrcode/end}}

\patchcmd\qrcode@int{\relax}{\qrcode@hyperwrapper@nohyperref}{}{\fail}
% --- end of external code ---

\setcounter{tocdepth}{1}

\colorlet{seccolor}{giaBlue}
\renewcommand{\sectionformat}{%
\begin{tcolorbox}[
    %size=small,
    on line,
    top = 4pt,
    bottom = 4pt,
    left = 4pt,
    right = 4pt,
    colback=seccolor!70,
    boxrule=0pt,
    boxsep=0pt,
    sharp corners,
    width=0cm,
    grow to left by=1.5cm,
    flushright upper,
    tcbox raise=-4pt,
]
    \usekomafont{section}\color{white}\thesection
\end{tcolorbox}
\hspace{1em}
}
\addtokomafont{section}{\color{seccolor!90}}
\colorlet{subseccolor}{giaBlue}
\renewcommand{\subsectionformat}{%
\begin{tcolorbox}[
    %size=small,
    on line,
    top = 4pt,
    bottom = 4pt,
    left = 4pt,
    right = 4pt,
    colback=subseccolor!70,
    boxrule=0pt,
    boxsep=0pt,
    sharp corners,
    width=0cm,
    grow to left by=1.5cm,
    flushright upper,
    tcbox raise=-4pt,
]
    \usekomafont{subsection}\color{white}\thesubsection
\end{tcolorbox}
\hspace{1em}
}
\addtokomafont{subsection}{\color{subseccolor!90}}

% --- custom commands ---

\newcommand{\hervor}[2][]{\textcolor{giaBlue}{\textbf{#2}}}

\newcommand{\GI}{GI}

\newcommand{\gi}{Gesellschaft f\"ur Informatik e.\,V.}

\newcommand{\GIAmitwirkende}{%
\begin{minipage}{0.4\textwidth}
    \begin{onehalfspace}
        \GIAautorenListe
    \end{onehalfspace}
\end{minipage}

Der Arbeitskreis wurde von \GIAkoordination\ koordiniert.
}

% --- custom environments ---

\setlength\columnsep{30pt}
\newenvironment{zweispaltig}[1][2]{
    \begin{multicols}{#1}
}{
    \end{multicols}
}

\newlength{\giacolorboxskip}
\setlength{\giacolorboxskip}{4mm}
\addtolength{\giacolorboxskip}{3pt}
\NewDocumentEnvironment{giacolorbox}{o}
{
    \tagstructbegin{tag=Div}
    \begin{tcolorbox}[%
        colback=white,
        colframe=giaBlue!0!giaYellow,
        sharp corners=all,
        title=#1,
        fonttitle=\color{black},
        enhanced jigsaw,
        grow sidewards by=2mm,
        borderline={4mm}{-4mm}{giaGray!5!white},
        borderline={0.5pt}{0pt}{giaYellow},
        before skip=\giacolorboxskip,
        after skip=\giacolorboxskip,
        \IfNoValueT{#1}{notitle}
    ]
}{
    \end{tcolorbox}
    \tagstructend
}

% --- cover handling ---
\AtBeginDocument{%
    \thispagestyle{empty}
    \newgeometry{left=0cm,top=0cm,bottom=0cm,right=0cm}
    \ifgiaHandout@frontcover@set
        \begin{tikzpicture}[remember picture, overlay]
            \node[inner sep=0pt] at (current page.center) {\includegraphics[width=\paperwidth,height=\paperheight]{\giaHandout@frontcover}};
        \end{tikzpicture}
    \else
        \makeatletter
        \begin{tikzpicture}[remember picture, overlay]
            \fill[giaBlue] ([xshift=0.5cm, yshift=0.5cm] current page.south west) rectangle ([xshift=-0.5cm, yshift=-0.5cm] current page.north east);
            \node[
                fill=giaYellow,
                anchor=west,
                inner xsep=40pt,
                inner ysep=32pt,
                text width=.5678\paperwidth,
                font=\Huge
            ] at ($(current page.north west)!.7!(current page.south west)$) {%
                \begin{minipage}{\linewidth}
                    \raggedright
                    {\large
                        \MakeUppercase{\@author}
                    }\\[16pt]
                    {\Huge
                        \MakeUppercase{\@title}
                    }\\[20pt]
                    {\large
                        \MakeUppercase{\@date}
                    }
                \end{minipage}
            };
        \end{tikzpicture}
        \makeatother
    \fi
    \clearpage
    \restoregeometry
    \setcounter{page}{1}
}
\AtEndDocument{%
    \thispagestyle{empty}
    \newgeometry{left=0cm,top=0cm,bottom=0cm,right=0cm}
    \ifgiaHandout@backcover@set
        \begin{tikzpicture}[remember picture, overlay]
            \node[inner sep=0pt] at (current page.center) {\includegraphics[width=\paperwidth,height=\paperheight]{\giaHandout@backcover}};
        \end{tikzpicture}
    \else
        \pagecolor{giaBlue}\null
    \fi
}

\endinput