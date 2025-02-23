%%
%% This is file `uantwerpenphdthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uantwerpendocs.dtx  (with options: `pt')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2013-2024  by Walter Daems <walter.daems@uantwerpen.be>
%% 
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Walter Daems.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{uantwerpenphdthesis}
    [2024/08/27 v4.8 .dtx skeleton file]
\newif\if@filled
\DeclareOption{filled}{\@filledtrue}
\newif\if@cameraready
\DeclareOption{cameraready}{\@camerareadytrue}
\newif\if@bare
\DeclareOption{bare}{\@baretrue}
\input{uantwerpencommonoptions.clo}
\ExecuteOptions{a4paper,11pt,final,oneside,openright}
\ProcessOptions\relax
\LoadClassWithOptions{book}
\setlength{\parindent}{0pt}
\addtolength{\parskip}{0.75\baselineskip}
\setcounter{secnumdepth}{3}
\RequirePackage[paperwidth=180mm,paperheight=260mm,
                top=2.5cm,bottom=2.5cm,left=2.6cm,right=1.8cm,twoside]
                {geometry}
\RequirePackage{expl3}
\RequirePackage{xparse}
\RequirePackage{iftex}
\RequirePackage{xstring}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\IfFileExists{shellesc.sty}{\RequirePackage{shellesc}}{}
\RequirePackage{graphicx}
\RequirePackage{graphbox}
\RequirePackage{soul}
\RequirePackage[export]{adjustbox}
\RequirePackage{color}
\RequirePackage{tikz}
\usetikzlibrary{positioning,calc}
\RequirePackage{eso-pic}
\usepackage{ean13isbn}
\RequirePackage{uantwerpencolorlogoscheme}

\RequirePackage{fancyhdr}
\definecolor{lightgray}{cmyk}      {0.00,0.00,0.00,0.05}
\definecolor{darkgray}{cmyk}       {0.00,0.00,0.00,0.80}
\definecolor{watermark}{cmyk}      {0.00,0.00,0.00,0.05}
\newcommand\insettext[1]{
  \textcolor{basecolor}{
    \begin{tabular}{@{\hskip3ex\textcolor{maincolor}{\vrule width 2.5pt}\hskip3ex\large\bfseries}p{0.88\textwidth}}
      \strut #1
    \end{tabular}
  }
}
\newcommand\insetquote[1]{
  \insettext{
    \begin{tikzpicture}[scale=0.65]
      \fill[green!60!black] (0.4,0) -- (0.5,0) -- (0.75,-0.15) -- (0.75,0) --
      (0.9,0) arc(-90:0:0.1) -- (1,0.65) arc(0:90:0.1) -- (0.1,0.75) arc
      (90:180:0.1) -- (0,0.1) arc(-180:-90:0.1) -- cycle;
      \foreach \x in {0.35,0.7} {
        \begin{scope}[shift={(\x,0.425)},scale=0.25]
          \fill[white] (0,0) circle[radius=0.5];
          \fill[white] (0.5,0) arc(0:-90:1) --
          (-0.5,-0.725) arc(-90:0:0.725) -- cycle;
        \end{scope}
      }
    \end{tikzpicture}\\
    #1
  }
}
\if@cameraready
\RequirePackage[cam,center,width=21truecm,height=29.7truecm]{crop}
\fi
\ExplSyntaxOn
\prop_new:N \g__uantwerpendocs_data_prop
\NewDocumentCommand{\uantwerpendocsprop}{m}{
  \prop_item:Nn \g__uantwerpendocs_data_prop{#1}
}
\NewDocumentCommand{\uantwerpendocsPROP}{m}{
  \str_uppercase:f { \prop_item:Nn \g__uantwerpendocs_data_prop{#1} }
}
\NewDocumentCommand{\uantwerpendocspropread}{m}{
  \__uantwerpendocs_datareader:n { #1 }
}
\cs_generate_variant:Nn \prop_gput:Nnn{ Nxx }
\cs_new_nopar:Npn \__uantwerpendocs_dataparser:w #1 = #2!! {
  \tl_set:Nn \l_tmpa_tl {#1}
  \tl_set:Nn \l_tmpb_tl {#2}
  \tl_trim_spaces:N \l_tmpa_tl
  \tl_trim_spaces:N \l_tmpb_tl
  \prop_gput:Nxx \g__uantwerpendocs_data_prop { \l_tmpa_tl} { \l_tmpb_tl }
}
\ior_new:N \l__uantwerpendocs_data_ior
\cs_new_nopar:Nn \__uantwerpendocs_datareader:n {
  \ior_open:Nn \l__uantwerpendocs_data_ior { uantwerpendocs-#1.data }
  \ior_str_map_inline:Nn \l__uantwerpendocs_data_ior {
    \regex_match:nnTF {=} {##1} {
      \__uantwerpendocs_dataparser:w ##1!!
    }
    {}
  }
  \ior_close:N \l__uantwerpendocs_data_ior
}
\clist_map_inline:nn {en} {
  \__uantwerpendocs_datareader:n { #1 }
}
\ExplSyntaxOff
\newcommand*\@logo{\logopos}
\AtBeginDocument{
  \makeatother
  \@ifpackageloaded{babel}{
    \addto\captionsenglish{%
      \uantwerpendocspropread{en}
    }
    \addto\captionsdutch{%
      \uantwerpendocspropread{nl}
    }
  }
  {}
  \uantwerpendocspropread{degree}
  \uantwerpendocspropread{doctype}
  \makeatletter
}
\ExplSyntaxOn
\cs_generate_variant:Nn \prop_item:Nn{ Nx }
\NewDocumentCommand{\uantwerpendocsdoctype}{m}{
  \prop_item:Nx \g__uantwerpendocs_data_prop { #1 }
}
\ExplSyntaxOff
\ExplSyntaxOn
\NewDocumentCommand{\uantwerpendocsdegree}{m}{
  \prop_item:Nx \g__uantwerpendocs_data_prop { #1 }
}
\ExplSyntaxOff
\newcommand*{\facultyacronym}[1]{
  \PackageError{uantwerpendocs}
  {The '\protect\facultyacronym{}' macro is no longer available. Use
    your faculty abbreviation in lowercase as class options instead}
  {The interface of uantwerpendocs 4.0 has been changed. See
    the uantwerpendocs manual under section '5.2 The class options explained'}
}
\newcommand*{\@department}{}
\newcommand*{\department}[1]{
  \renewcommand*\@department{#1}
}
\newcommand*{\@titel}{}
\newcommand*{\titel}[1]{%
  \renewcommand*\@titel{#1}
}
\newcommand*{\@subtitle}{~}
\newcommand*{\subtitle}[1]{%
  \renewcommand*\@subtitle{#1}
}
\newcommand*{\@subtitel}{}
\newcommand*{\subtitel}[1]{%
  \renewcommand*\@subtitel{#1}
}
\newcommand\@affiliation{
  \PackageError{uantwerpendocs}
  {Please, define the affiliation of the author using the
    '\protect\affiliation{}' command in the preamble of your
    document.}
  {See the uantwerpendocs manual}
}
\newcommand\affiliation[1]{\renewcommand\@affiliation{#1}}
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_supervisors
\seq_new:N \g__uantwerpendocs_supervisorswithaffiliation
\cs_new:Nn \__uantwerpendocs_addsupervisor:nn {
  \seq_gpush:Nn \g__uantwerpendocs_supervisors { #1 }
  \seq_gpush:Nn \g__uantwerpendocs_supervisorswithaffiliation { #1,~#2 }
}
\NewDocumentCommand{\supervisor}{mm}{
  \__uantwerpendocs_addsupervisor:nn { #1 } { #2 }
}
\NewDocumentCommand{\jointsupervisors}{mm}{
  \seq_use:Nnnn \g__uantwerpendocs_supervisors { #2 } { #1 } { #2 }
}
\NewDocumentCommand{\jointsupervisorswithaffiliation}{mm}{
  \seq_use:Nnnn \g__uantwerpendocs_supervisorswithaffiliation { #2 } { #1 } { #2 }
}
\NewDocumentCommand{\supervisorsname}{m}{
  \if_int_compare:w \seq_count:N \g__uantwerpendocs_supervisors > 2
  \uantwerpendocsprop{supervisorsname} #1
  \else:
  \if_int_compare:w \seq_count:N \g__uantwerpendocs_supervisors = 2
  \uantwerpendocsprop{supervisorname} #1
  \else:
  \fi:
  \fi:
}
\AtBeginDocument{
  \seq_gpush:Nn \g__uantwerpendocs_supervisors {}
  \seq_greverse:N \g__uantwerpendocs_supervisors
  \seq_gpush:Nn \g__uantwerpendocs_supervisorswithaffiliation {}
  \seq_greverse:N \g__uantwerpendocs_supervisorswithaffiliation
}
\ExplSyntaxOff
\newcommand*{\@jurychair}{
  \PackageError{uantwerpendocs}
  {Please, define a chair of the jury using the
    '\protect\jurychair{}' command in the preamble of your
    document.}
  {See the uantwerpendocs manual}
}
\newcommand*{\@jurychairaff}{}
\newcommand*{\jurychair}[2]{
  \renewcommand*{\@jurychair}{#1}\renewcommand*{\@jurychairaff}{#2}}
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_jurymemberswithaffiliation
\cs_new:Nn \__uantwerpendocs_addjurymember:nn {
  \seq_gpush:Nn \g__uantwerpendocs_jurymemberswithaffiliation { #1,~#2 }
}
\NewDocumentCommand{\jurymember}{mm}{
  \__uantwerpendocs_addjurymember:nn { #1 } { #2 }
}
\NewDocumentCommand{\jointjurymembers}{m}{
  \seq_use:Nn \g__uantwerpendocs_jurymemberswithaffiliation { #1 }
}
\AtBeginDocument{
  \seq_greverse:N \g__uantwerpendocs_jurymemberswithaffiliation
}
\ExplSyntaxOff
\newcommand*\phddegree{
  \PackageError{uantwerpendocs}
  {The '\protect\phddegree{}' macro is no longer available. Use
    '\protect\degree{}' instead}
  {The interface of uantwerpendocs 4.0 has been changed. Use the
    '\protect\degree' macro to specify your degree in full text (see
    the uantwerpendocs manual)'}
}
\newcommand*\@degree{
  \PackageError{uantwerpendocs}
  {Please, specify the offical degree description using
    the '\protect\degree{}'  macro in the preamble of your document.}
  {See the uantwerpendocs manual}
}
\newcommand*\degree[1]{\renewcommand*\@degree{#1}}

\newcommand*\@bamadoctype{
  \PackageError{uantwerpendocs}
  {Please, specify the offical document type, either using
    the '\protect\bamadoctype{}'  macro or the '\protect\bamadegree{}'
    macro in the preamble of your document.}
  {See the uantwerpendocs manual}}
\newcommand*\bamadoctype[1]{
  \renewcommand*\@bamadoctype{\uantwerpendocsdoctype{#1}}
}
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_degreechunks
\NewDocumentCommand{\bamadegree}{m}{
  \regex_extract_all:nnN { [^-]+ } { #1 } \g__uantwerpendocs_degreechunks
  \bamadoctype{\seq_item:Nn \g__uantwerpendocs_degreechunks {2} - \seq_item:Nn \g__uantwerpendocs_degreechunks {3}}
  \degree{\uantwerpendocsdegree{#1}}
}
\ExplSyntaxOff
\newcommand*{\programme}[3]{
  \PackageError{uantwerpendocs}
  {The '\protect\programme{}{}{}' macro is no longer available. Use
    '\protect\degree{}' instead}
  {The interface of uantwerpendocs 4.0 has been changed. Use the
    '\protect\degree' macro to specify your degree in full text (see
    the uantwerpendocs manual)'}
}
\newcommand*{\diploma}[1]{
  \PackageError{uantwerpendocs}
  {The '\protect\diploma{}' macro is no longer available. Use
    '\protect\degree{}' instead}
  {The interface of uantwerpendocs 4.0 has been changed. Use the
    '\protect\degree' macro to specify your degree in full text (see
    the uantwerpendocs manual)'}
}
\newcommand*\@defensedate{ERROR}
\newcommand*{\defensedate}[1]{\renewcommand*\@defensedate{#1}}
\newcommand*\@defenselocation{Antwerpen}
\newcommand*{\defenselocation}[1]{\renewcommand*\@defenselocation{#1}}
\newcommand*\@titlepageimage{}
\newcommand*\titlepageimage[1]{\renewcommand*\@titlepageimage{#1}}
\newcommand*{\@isbn}{}
\newcommand*{\isbn}[1]{\renewcommand*{\@isbn}{#1}}
\newcommand*{\@depot}{}
\newcommand*{\depot}[1]{\renewcommand*{\@depot}{#1}}
\newcommand*{\@address}{
  \PackageError{uantwerpendocs}
  {Please, set your multi-line address and contact details using the
    '\protect\address{}' command in the preamble of your document}
  {See the uantwerpendocs manual}
}
\newcommand*{\address}[1]{\renewcommand*{\@address}{#1}}
\if@twoside
  \lhead[\thepage]{\slshape\rightmark}
  \chead[]{}
  \rhead[\slshape\leftmark]{\thepage}
  \lfoot[]{}
  \cfoot[]{}
  \rfoot[]{}
\else
  \lhead[]{\leftmark}
  \chead[]{}
  \rhead[]{\thepage}
  \lfoot[]{}
  \cfoot[]{}
  \rfoot[]{}
\fi

\setlength{\headheight}{13.7pt}
\renewcommand*{\headrulewidth}{0pt}
\renewcommand*{\footrulewidth}{0pt}
\if@filled\else
  \raggedright
\fi
\raggedbottom
\onecolumn
\def\@makechapterhead#1{%
  \vspace*{1ex}%
  \begin{flushright}
    \makebox[0pt][l]{\rule[-0.4em]{10cm}{1.8em}}\textcolor{white}
    {\LARGE\textbf{~\chaptername~}}
    \raisebox{-24pt}{
      \begin{tikzpicture}
        \foreach \theta in {0,5,...,355} {
          \node[color=white] at (\theta:0.025)
          {\fontsize{72}{12}\selectfont\textbf{\thechapter}};
        }
        \node[color=gray] at (0,0)
        {\fontsize{72}{12}\selectfont\textbf{\thechapter}};
      \end{tikzpicture}
    }\hspace*{-8pt}
    \par\nobreak
    \interlinepenalty\@M
    \huge\textbf{\textcolor{darkgray}{\rule[-0.5ex]{0em}{2.6ex}~#1}}
    \par\nobreak
  \end{flushright}
  \rule{\textwidth}{1pt}
  \vspace{5\p@}\par\nobreak
  }
\def\@schapter#1{%
  \@makeschapterhead{#1}%
  \@afterheading
}
\def\@makeschapterhead#1{%
  \vspace*{1ex}%
  \begin{flushright}
    \LARGE\textbf{\textcolor{darkgray}{\rule[-0.5ex]{0em}{2.6ex}~#1}}
  \end{flushright}
  \rule{\textwidth}{1pt}
  \vspace{5\p@}\par
}
\def\appendix{
  \setcounter{chapter}{0}
  \renewcommand*{\thechapter}{\Alph{chapter}}
  \renewcommand*\chaptername\appendixname
}
\renewcommand\maketitle{%
  \pagestyle{empty}
  \if@bare\else
  \begin{titlepage}
    \AddToShipoutPicture*{%
      \put(0,0){%
        \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
          \useasboundingbox (0,0) rectangle(\paperwidth,\paperheight);
          \fill[lightgray]
          (2.125,19) rectangle (\paperwidth+3mm,6);
          \begin{scope}
            \clip (2.125,19) rectangle (\paperwidth+3mm,6);
            \node[anchor=south west]
            at (2.125,6)
            {\ifx\@titlepageimage\@empty
              \else
              \includegraphics[keepaspectratio,
              scale=0.01,
              min size={16.175cm}{13cm}]{\@titlepageimage}
              \fi};
          \end{scope}

          \node
          [anchor=west,text width=13.75cm,align=left,font=\Huge,uauaside]
          at (2.125,23.5)
          {
            \textsf{\textbf{\@title}}
          };

          \node
          [anchor=west,text width=13.75cm,align=left,font=\Large,uauaside]
          at (2.125,21.5)
          {
            \textsf{\textbf{\@subtitle}}
          };

          \node
          [anchor=base west,maincolor,
          text width=13.75cm,align=left,font=\LARGE]
          at (2.125,20)
          {\textsf{\textbf{\@author}}};

          \fill[maincolor] (2.125,6)
          -- (\paperwidth+3mm,6)
          -- (\paperwidth+3mm,2.625)
          -- (2.55,2.625)
          arc (-90:-180:0.425)
          -- cycle;

          \node[white,anchor=west,align=left,font=\large]
          (SN) at (2.55,4.9)
          {
            \begin{tabular}{@{}l@{~\,}p{11.5cm}}
              \textsf{\supervisorsname{}}
              & \textsf{\textbf{\jointsupervisors{ | }{}}}
            \end{tabular}
          };

          \node[white,anchor=west,text width=14.5cm,align=left,font=\small]
          at (2.55,3.7)
          {\textsf{\uantwerpendocsprop{pthesisnamei}
              \@degree{}}\\
          \textsf{\textbf{\@faculty{}  \ifx\@department\empty\else |
              \@department{} \fi | \@defenselocation, \@defensedate}}};

          \node[anchor=west] at
          (2.125,1.313)
          {\includegraphics[width=4.75cm]{\logoposua}};
        \end{tikzpicture}
      }
    }
  \end{titlepage}%
  ~\par\relax
  \cleardoublepage
  \fi
  \begin{center}
    \includegraphics[width=4.75cm]{\logoposua}
    \vfill
    \@faculty\\
    \@department\par
    \vfill
    \Huge\textsf{\@title}\par
    \large\textsf{\@subtitle}\par
    \vfill
    \normalsize\uantwerpendocsprop{pthesisnamei}\\
    \@degree\\
    \uantwerpendocsprop{pthesisnameii}\\
    \medskip
    \textbf{\@author}
    \vfill
    \begin{minipage}[b]{0.4\textwidth}
      \@defenselocation, \@defensedate
    \end{minipage}
    \hfill
    \begin{minipage}[b]{0.4\textwidth}
      \flushright
      \supervisorsname{\\}
      \jointsupervisors{\\}{}
    \end{minipage}
  \end{center}
  \clearpage
  \noindent\textbf{\uantwerpendocsprop{juryname}}\hfill\\[1ex]
  \textit{\uantwerpendocsprop{jurychairname}}\hfill\break
  \@jurychair{}\ifdefvoid{\@jurychairaff}{}{, \@jurychairaff}\\
  \hfill\break
  \textit{\supervisorsname{}}\hfill\break
  \jointsupervisorswithaffiliation{\\}{\\}
  \hfill\break
  \textit{\uantwerpendocsprop{jurymembersname}}\hfill\break
  \jointjurymembers{\\}
  \hfill\break
  \vfill
  \noindent\textbf{Contact}\\
  \smallskip
  \@author\\
  \@affiliation\\
  \@address\\
  \vfill
  \noindent\copyright{} \@defensedate{} \@author\\
  \uantwerpendocsprop{arr}.
  \vfill
  \noindent\begin{minipage}[b]{.5\linewidth}
    \ifdefempty{\@isbn}{}{ISBN \@isbn}~\\
    \ifdefempty{\@depot}{}{Wettelijk depot \@depot}~\\
  \end{minipage}
  \hfill
  \ifdefempty{\@isbn}{}{
    \begin{minipage}[b]{.5\linewidth}
      \expandafter\EAN \@isbn
    \end{minipage}
  }
  \thispagestyle{empty}
  \ifx\@titel\empty
  \else
  \clearpage
  \begin{center}
    \vfill
    ~
    \vfill
    Dutch title:
    \vfill
    \Huge\textsf{\@titel}\par
    \large\textsf{\@subtitel}\par
    \vfill
    ~
    \vfill
  \end{center}
  \fi
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \clearpage
  \pagestyle{fancy}
  \thispagestyle{empty}
}
\newcommand\makefinalpage{
  \if@bare\else
  \cleardoublepage
  \thispagestyle{empty}
  ~% intentionally blank page
  \clearpage
  \thispagestyle{empty}
  \AddToShipoutPicture*{%
    \put(0,0){%
      \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
        \useasboundingbox (0,0) rectangle (\paperwidth,\paperheight);
        \fill[sidecolor] (-3mm,-3mm) rectangle (2.125cm,2.625cm);
      \end{tikzpicture}
    }
  }
  ~
  \fi
}
\AtBeginDocument{
  \@ifpackageloaded{hyperref}{
    \hypersetup{
      breaklinks=true,
      colorlinks=true,
      citecolor=black,
      filecolor=black,
      linkcolor=black,
      pageanchor=true,
      pdfpagemode=UseOutlines,
      urlcolor=black,
      pdftitle={\@title},
      pdfsubject={\@subtitle},
      pdfauthor={\@author}
    }
  }{}
}
\endinput
%%
%% End of file `uantwerpenphdthesis.cls'.
