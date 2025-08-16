%%
%% This is file `uantwerpencoursetext.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uantwerpendocs.dtx  (with options: `ct')
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
\ProvidesClass{uantwerpencoursetext}
    [2025/06/03 v4.11 .dtx skeleton file]
\newif\if@modern
\@modernfalse
\DeclareOption{modern}{\@moderntrue}
\newif\if@copyright
\DeclareOption{copyright}{\@copyrighttrue}
\newif\if@filled
\DeclareOption{filled}{\@filledtrue}
\newif\if@cameraready
\DeclareOption{cameraready}{\@camerareadytrue}
\input{uantwerpencommonoptions.clo}
\ExecuteOptions{a4paper,11pt,final,oneside,openright}
\ProcessOptions\relax
\LoadClassWithOptions{book}
\setlength{\parindent}{0pt}
\addtolength{\parskip}{0.75\baselineskip}
\setcounter{secnumdepth}{3}
\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}
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
\if@copyright
\RequirePackage[contents={},color=lightgray,scale=3]{background}
\fi
\RequirePackage{uantwerpencolorlogoscheme}

\RequirePackage{fancyhdr}
\definecolor{lightgray}{cmyk}      {0.00,0.00,0.00,0.05}
\definecolor{darkgray}{cmyk}       {0.00,0.00,0.00,0.80}
\definecolor{watermark}{cmyk}      {0.00,0.00,0.00,0.05}
\newcommand\insettext[1]{
  \textcolor{basecolor}{
    \begin{tabular}{@{\hskip3ex\textcolor{maincolor}{\vrule width 2.5pt}%
      \hskip3ex\large\bfseries}p{0.88\textwidth}}
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
\newcommand*{\@subtitle}{~}
\newcommand*{\subtitle}[1]{%
  \renewcommand*\@subtitle{#1}
}
\newcommand*{\@courseversion}{}
\newcommand*{\courseversion}[1]{\renewcommand*{\@courseversion}{#1}}
\newcommand*{\@versionyear}{}
\newcommand*{\versionyear}[1]{\renewcommand*{\@versionyear}{#1}}
\newcommand{\@publisher}{Universitas Cursusdienst |
  Prinsesstraat 16 |
  2000 Antwerpen |
  T +32 3 233 23 73 |
  E info@cursusdienst.be}
\newcommand*{\publisher}[1]{\renewcommand*{\@publisher}{#1}}
\newcommand*{\@publishercode}{}
\newcommand*{\publishercode}[1]{\renewcommand*{\@publishercode}{#1}}
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_lecturers
\cs_new:Nn \__uantwerpendocs_addlecturer:n {
  \seq_gpush:Nn \g__uantwerpendocs_lecturers { #1 }
}
\NewDocumentCommand{\lecturer}{m}{
  \__uantwerpendocs_addlecturer:n { #1 }
}
\NewDocumentCommand{\jointlecturers}{m}{
  \seq_use:Nn \g__uantwerpendocs_lecturers { #1 }
}
\NewDocumentCommand{\lecturersname}{}{
  \if_int_compare:w \seq_count:N \g__uantwerpendocs_lecturers > 1
  \uantwerpendocsprop{lecturersname}
  \else:
  \if_int_compare:w \seq_count:N \g__uantwerpendocs_lecturers > 0
  \uantwerpendocsprop{lecturername}
  \fi
  \fi:
}
\AtBeginDocument{
  \seq_greverse:N \g__uantwerpendocs_lecturers
}

\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_degrees
\cs_new:Nn \__uantwerpendocs_adddegree:n {
  \seq_gpush:Nn \g__uantwerpendocs_degrees { #1 }
}
\NewDocumentCommand{\degree}{m}{
  \__uantwerpendocs_adddegree:n { #1 }
}
\NewDocumentCommand{\jointdegrees}{mm}{
  \seq_use:Nnnn \g__uantwerpendocs_degrees { #2 } { #1 } { #2 }
}
\AtBeginDocument{
  \seq_greverse:N \g__uantwerpendocs_degrees
  \let\degree\relax
}
\ExplSyntaxOff

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
\NewDocumentCommand{\bamadegree}{m}{
  \seq_new:N \l__uantwerpendocs_degreechunks
  \regex_extract_all:nnN { [^-]+ } { #1 } \l__uantwerpendocs_degreechunks
  \bamadoctype{\seq_item:Nn \l__uantwerpendocs_degreechunks {2} - \seq_item:Nn \l__uantwerpendocs_degreechunks {3}}
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
\newcommand*\coursei[2]{
  PackageError{uantwerpendocs}
  {The '\protect\coursei{}' macro is no longer available. Use
    '\protect\course{}' instead (multiple times if you need to)}
  {The interface of uantwerpendocs 4.0 has been changed. Use the
    '\protect\course macro instead of the \protect\coursei,
    \protect\courseii, \protect\courseiii and \protect\courseiv macros
    that existed earlier (see
    the uantwerpendocs manual)'}
}
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_courseswithcodes
\cs_new:Nn \__uantwerpendocs_addcourse:nn {
  \seq_gpush:Nn \g__uantwerpendocs_courseswithcodes{ \texttt{#1}~#2 }
}
\NewDocumentCommand{\course}{mm}{
  \__uantwerpendocs_addcourse:nn { #1 } { #2 }
}
\NewDocumentCommand{\jointcourseswithcodes}{m}{
  \seq_use:Nn \g__uantwerpendocs_courseswithcodes { #1 }
}
\AtBeginDocument{
  \seq_greverse:N \g__uantwerpendocs_courseswithcodes
}
\ExplSyntaxOff
\newcommand*\@titlepageimage{}
\newcommand*\titlepageimage[1]{\renewcommand*\@titlepageimage{#1}}
\newcommand*{\@academicyear}{XXX-YYYY}
\newcommand*{\academicyear}[1]{\renewcommand*{\@academicyear}{#1}}
\newcommand{\@copyrightnotices}{}
\newcommand{\copyrightnotices}[1]{\renewcommand{\@copyrightnotices}{#1}}
\if@twoside
\lhead[\thepage]{\slshape\rightmark}
\chead[]{}
\rhead[\slshape\leftmark]{\thepage}
\lfoot[\uantwerpendocsprop{org-ua} -- \@facultyacronym]{\@courseversion}
\cfoot[]{}
\rfoot[]{\@title{}\ifdefvoid{\@subtitle}{}{ --- \@subtitle}}
\else
\lhead[]{\leftmark}
\chead[]{}
\rhead[]{\thepage}
\lfoot[]{\@courseversion}
\cfoot[]{UAntwerpen--\@facultyacronym}
\rfoot[]{\@title{}}
\fi

\setlength{\headheight}{13.7pt}
\renewcommand*{\headrulewidth}{1pt}
\renewcommand*{\footrulewidth}{1pt}
\pagenumbering{arabic}
\if@filled\else
  \raggedright
\fi
\raggedbottom
\onecolumn
\newcommand{\@crnotice}{
  {
    \setlength\parindent{0em}
    This document has been typeset using \LaTeX{} and the
    \texttt{uantwerpendocs} package.\\
    \@copyrightnotices

    \@courseversion

    CONFIDENTIAL AND PROPRIETARY.

    \copyright{} \@versionyear{} \uantwerpendocsprop{org-ua},
    \uantwerpendocsprop{arr}.
  }
}
\renewcommand\maketitle{%
  \pagestyle{empty}
  \begin{titlepage}
    \AddToShipoutPicture*{%
      \put(0,0){%
        \if@modern
        \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
          \clip (0,0) rectangle(\paperwidth,\paperheight);

          \begin{scope}
            \clip (2.125,20.192) rectangle (\paperwidth,6);
            \fill[sidecolor]
            (2.125,20.192) rectangle (\paperwidth,6);
            \node[anchor=south west]
            at (2.125,6)
            {\ifx\@titlepageimage\@empty
              \else
              \includegraphics[keepaspectratio,
              scale=0.01,
              min size={18.875cm}{14.192cm}]{\@titlepageimage}
              \fi};
          \end{scope}

           \node
           [anchor=west,text width=13.75cm,align=left,font=\Huge,uauaside]
          at (2.125,27)
          {
            \textsf{\textbf{\@title}}
          };

          \node
          [anchor=west,text width=13.75cm,align=left,font=\Large,uauaside]
          at (2.125,25.5)
          {
            \textsf{\textbf{\@subtitle}}
          };

          \node
          [anchor=base west,maincolor,text width=13.75cm,align=left,font=\LARGE]
          at (2.125,24)
          {\textsf{\textbf{\@author}}};

          \node
          [anchor=west,text width=13.75cm,align=left,font=\large,uauaside]
          at (2.125,22)
          {\textsf{\jointcourseswithcodes{\\}}};

         \fill[maincolor] (2.125,6)
          -- (\paperwidth,6)
          -- (\paperwidth,2.625)
          -- (2.55,2.625)
          arc (-90:-180:0.425)
          -- cycle;

          \node[white,anchor=west,align=left,font=\large]
          (SN) at (2.55,5.1)
          {
            \begin{tabular}{@{}l@{~\,}p{14.5cm}}
              \textsf{\lecturersname}
              & \textsf{\textbf{\jointlecturers{ | }}}
            \end{tabular}
          };

          \node[white,anchor=west,text width=17.5cm,align=left,font=\small]
          at (2.55,3.7)
          {\textsf{\jointdegrees{\\}{\\}}\\
            \textsf{\textbf{\@faculty{} \ifx\@department\empty\else |
                \@department{} \fi | \@academicyear \hfill
                \@publishercode}}\\
          \textsf{\@publisher}};

          \node[anchor=west] at (2.125,1.313)
          {\includegraphics[width=4.75cm]{\logopos}};
        \end{tikzpicture}
        \else
        \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
          \clip (0,0) rectangle(\paperwidth,\paperheight);
          \if@cameraready
          \else
          \fill[uauamain] (0,29.7) -- (2.2,29.7) -- (2.2,21.435) arc
          (0:-90:0.235) -- (0,21.2) -- cycle;
          \node[anchor=west] at (2.2,1.8)
          {\includegraphics[width=5.2cm]{\logoposua}};
          \fi

          \node
          [anchor=north west,text width=14.75cm,align=left]
          at (5,27.1)
          {
            \fontsize{16}{20}\selectfont\textsf{\textbf{\uantwerpendocsprop{acyearname}}}\\[1ex]
            \fontsize{16}{20}\selectfont\textsf{\@academicyear}
          };

          \node
          [anchor=north west,text width=14.75cm,align=left]
          at (5,22.7)
          {
            \fontsize{16}{20}\selectfont\textsf{\@faculty{}
              \ifx\@department\empty\else | \@department{} \fi}
          };

          \node
          [anchor=north west,text width=14.75cm,align=left] (title)
          at (5,20.9)
          {
            \fontsize{24}{30}\selectfont\textsf{\textbf{\@title}}\\[1ex]
            \fontsize{18}{24}\selectfont\textsf{\@subtitle}
          };

          \node
          [anchor=north west,below=of title,
          text width=14.75cm,align=left,
          yshift=-0.5cm,color=uauamain] (author)
          {
            \fontsize{18}{24}\selectfont{\textsf{\@author}}
          };

          \node
          [anchor=north west,below=of author,
          text width=14.75cm,align=left,
          yshift=-0.5cm]
          {
            \fontsize{12}{15}\selectfont{\textsf{\jointdegrees{\\}{\\}}}
          };

          \node
          [anchor=north west,text width=14.75cm,align=left] (title)
          at (5,13.3)
          {
            \fontsize{12}{15}\selectfont\textsf{\textbf{\jointlecturers{\\}}}
          };

          \node
          [anchor=north west,text width=14.75cm,align=left] (title)
          at (5,10)
          {
            \fontsize{12}{15}\selectfont\textsf{\jointcourseswithcodes{\\}}
          };

          \node[anchor=east]
          at (19,1.8)
          {
            \fontsize{12}{15}\selectfont\textsf{\@publishercode}
          };

        \end{tikzpicture}
        \fi
      }
    }
  \end{titlepage}%
  ~\par\relax
  \clearpage
  \if@copyright
  \backgroundsetup{contents={Copyright University of Antwerp, All
      Rights Reserved}}
  \fi
  \vspace*{\stretch{1}}
  \@crnotice
  \clearpage
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \pagestyle{fancy}
  \thispagestyle{empty}
}
\newcommand\makefinalpage{
  \if@cameraready
  \else
  \cleardoublepage
  \thispagestyle{empty}
  \if@copyright\NoBgThispage\fi
  ~% intentionally blank page
  \clearpage
  \thispagestyle{empty}
  \if@copyright\NoBgThispage\fi
  \AddToShipoutPicture*{%
    \put(0,0){%
      \if@modern
      \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
        \clip (0,0) rectangle(\paperwidth,\paperheight);
        \fill[sidecolor] (0,0) rectangle (2.125cm,2.625cm);
      \end{tikzpicture}
      \else
      \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
        \clip (0,0) rectangle(\paperwidth,\paperheight);
        \fill[uauamain] (0,21.2) rectangle (21,29.7);
      \end{tikzpicture}
      \fi
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
%% End of file `uantwerpencoursetext.cls'.
