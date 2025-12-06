%%
%% This is file `uantwerpenexam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uantwerpendocs.dtx  (with options: `ex')
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
\ProvidesClass{uantwerpenexam}
    [2025/06/03 v4.11 .dtx skeleton file]
\newif\if@examiner
\DeclareOption{examiner}{\@examinertrue}
\input{uantwerpencommonoptions.clo}
\ExecuteOptions{a4paper,twoside,10pt}
\ProcessOptions
\LoadClassWithOptions{article}
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
\RequirePackage{uantwerpencolorlogoscheme}

\RequirePackage{fancyhdr}
\definecolor{lightgray}{cmyk}      {0.00,0.00,0.00,0.05}
\definecolor{darkgray}{cmyk}       {0.00,0.00,0.00,0.80}
\definecolor{watermark}{cmyk}      {0.00,0.00,0.00,0.05}
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
\newcommand*{\@shorttitle}{}
\newcommand*{\shorttitle}[1]{%
  \renewcommand*\@shorttitle{#1}
}
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
\newcommand*{\@coursecode}{}
\newcommand*{\@course}{}
\newcommand*{\course}[2]{
  \renewcommand*{\@coursecode}{#1}
  \renewcommand*{\@course}{#2}
}
\newcommand*{\@academicyear}{XXX-YYYY}
\newcommand*{\academicyear}[1]{\renewcommand*{\@academicyear}{#1}}
\newcommand*{\logo}[1]{\renewcommand*{\@logo}{#1}}
\newcommand*{\@exampart}{}
\newcommand*{\exampart}[1]{\renewcommand*{\@exampart}{#1}}
\newcommand*{\@examgroupnumber}{}
\newcommand*{\examgroupnumber}[1]{\renewcommand*{\@examgroupnumber}{#1}}
\newcommand*{\@examdate}{TBD}
\newcommand*{\examdate}[1]{\renewcommand*{\@examdate}{#1}}
\newcommand*{\@examlength}{TBD}
\newcommand*{\examlength}[1]{\renewcommand*{\@examlength}{#1}}
\newcommand*{\@tstart}{TBD}
\newcommand*{\tstart}[1]{\renewcommand*{\@tstart}{#1}}
\newcommand*{\@tend}{TBD}
\newcommand*{\tend}[1]{\renewcommand*{\@tend}{#1}}
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_rooms
\cs_new:Nn \__uantwerpendocs_addroom:n {
  \seq_gpush:Nn \g__uantwerpendocs_rooms { #1 }
}
\NewDocumentCommand{\room}{m}{
  \__uantwerpendocs_addroom:n { #1 }
}
\NewDocumentCommand{\jointrooms}{m}{
  \seq_use:Nn \g__uantwerpendocs_rooms { #1 }
}
\NewDocumentCommand{\roomsname}{}{
  \if_int_compare:w \seq_count:N \g__uantwerpendocs_rooms > 1
  \uantwerpendocsprop{roomsname}
  \else:
  \uantwerpendocsprop{roomname}
  \fi:
}
\AtBeginDocument{
  \seq_greverse:N \g__uantwerpendocs_rooms
}

\ExplSyntaxOff
\newcommand{\@extrainfo}{}
\newcommand\extrainfo[2][separatepage]{
  \ifthenelse{\equal{#1}{separatepage}}{
    % then
    \renewcommand{\@extrainfo}{\clearpage #2 \clearpage}
  }
  {
    % else
    \ifthenelse{\equal{#1}{firstpage}}
    {
      \renewcommand{\@extrainfo}{#2}
    }
    {
      \PackageError{uantwerpendocs}
      {The first (optional) argument of '\protect\extrainfo' can
        only be 'separatepage' or 'firstpage'}
      {See the uantwerpendocs manual)'}
    }
  }
}
\newcommand*{\@studentnr}{0}
\newcommand*{\studentnr}[1]{\renewcommand*{\@studentnr}{#1}}
\lhead[]{}
\chead[]{}
\cfoot[\small \thepage/\pageref{lastpage}]{\small\thepage/\pageref{lastpage}}
\if@examiner
\rhead[\small EXAMINER VERSION]{\small EXAMINER VERSION}
\AddToShipoutPicture{
  \put(60,40){\rotatebox{60}{\textcolor{watermark}{
        \fontsize{105}{130}\selectfont Examiner Version}}}}
\else
\rhead[\small Student nr. \@studentnr]{\small Student nr. \@studentnr}
\fi

\setlength{\headheight}{13.7pt}
\renewcommand*{\headrulewidth}{0pt}
\renewcommand\maketitle{%
  \pagestyle{fancy}
  \AddToShipoutPicture*{%
    \put(0,0){%
      \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
        \clip (0,0) rectangle(\paperwidth,\paperheight);
        \fill[lightgray]
        (2.125,{\paperheight-7cm}) rectangle (\paperwidth,6);

        \node
        [anchor=west,text width={\paperwidth-5cm},align=left]
        at (2.125,{\paperheight-3cm})
        {%
          \fontsize{18}{22}\selectfont%
          \textsf{\textbf{\@course{}}}
          \ifx\@exampart\@empty
          \else \textsf{\textbf{ --- \@exampart}}\fi
        };
        \node
        [anchor=west,text width={\paperwidth-5cm},align=left]
        at (2.125,{\paperheight-4cm})
        {%
          \fontsize{12}{18}\selectfont%
          \textsf{\@coursecode}
        };

        \node
        [anchor=west,text width={\paperwidth-5cm},align=left,font=\large]
        at (2.125,{\paperheight-5cm})
        {%
          \fontsize{12}{18}\selectfont%
          \textsf{\uantwerpendocsprop{seriesname} \@examgroupnumber{} \hfill \@examdate{}}
        };

        \node[anchor=south west,align=left,inner sep=0pt] at (3,21)
        {%
          \fontsize{14}{19}\selectfont%
          \textsf{\uantwerpendocsprop{examname}}
        };

        \node[anchor=south west,align=left,inner sep=0pt] at (3,19)
        {%
          \fontsize{12}{18}\selectfont%
          \textsf{\uantwerpendocsprop{lastname}}
        };
        \foreach \nn in {0,1,...,33} {
          \draw[fill=white] (3,18) ++({0.5*\nn},0) rectangle +(0.5,0.8);
        }

        \node[anchor=south west,align=left,inner sep=0pt] at (3,17)
        {%
          \fontsize{12}{18}\selectfont%
          \textsf{\uantwerpendocsprop{firstname}}
        };

        \foreach \nn in {0,1,...,23} {
          \draw[fill=white] (3,16) ++({0.5*\nn},0) rectangle +(0.5,0.8);
        }

        \node[anchor=south west,align=left,inner sep=0pt] at (16,17)
        {%
          \fontsize{12}{18}\selectfont%
          \textsf{\uantwerpendocsprop{docketname}}
        };
        \foreach \nn in {0,1,...,7} {
          \draw[fill=white] (16,16) ++({0.5*\nn},0) rectangle +(0.5,0.8);
        }

        \node[anchor=south west,align=left,inner sep=0pt,text width=17cm]
        at (3,14)
        {%
          \fontsize{12}{21}\selectfont%
          \textsf{\uantwerpendocsprop{examdurationname}: \@examlength}
        };
        \node[anchor=south west,align=left,inner sep=0pt,text width=17cm]
        at (3,11)
        {%
          \fontsize{12}{15}\selectfont%
          \textsf{\begin{tabular}{@{}l@{}ll}%
            \uantwerpendocsprop{examstartname}& : & \@tstart\\
            \uantwerpendocsprop{examendname}  & : & \@tend
          \end{tabular}}
        };

        \node[anchor=south west,align=left,inner sep=0pt,text width=17cm]
        at (3,8)
        {%
          \fontsize{12}{21}\selectfont%
          \textsf{\roomsname: \jointrooms{, }}
        };

        \node
        [anchor=base west,uauamain,
        text width={\paperwidth-5cm},align=left,font=\LARGE]
        at (2.125,{\paperheight-6.5cm})
        {\textsf{\textbf{\@author}}};

        \fill[gray] (2.125,6)
        -- (\paperwidth,6)
        -- (\paperwidth,2.625)
        -- (2.55,2.625)
        arc (-90:-180:0.425)
        -- cycle;

        \node[white,anchor=west,align=left,font=\large]
        (SN) at (2.55,4.9)
        {
          \begin{tabular}{@{}l@{~\,}p{14.5cm}}
            \textsf{\lecturersname}
            & \textsf{\textbf{\jointlecturers{ | }}}
          \end{tabular}
        };

        \node[white,anchor=west,text width=17.5cm,align=left,font=\small]
        at (2.55,3.7)
        {\textsf{\jointdegrees{\\}{\\}}\\
          \textsf{\textbf{\@faculty{}}}};

        \node[anchor=west] at (2.125,1.313)
        {\includegraphics[width=4.75cm]{\logopos}};
      \end{tikzpicture}
    }
  }
  ~\par\relax
  \clearpage
  \lfoot[\small \@shorttitle]{\small \@shorttitle}
  \rfoot[\small Groep \@examgroupnumber{} ---
  \@academicyear]{\small Groep \@examgroupnumber{} --- \@academicyear}
  \renewcommand*{\footrulewidth}{1pt}
  \@extrainfo{}
}
\newcounter{question}
\setcounter{question}{0}
\renewcommand*\thequestion{\@arabic\c@question}
\newcommand{\question}[1]{
  \stepcounter{question}
  \thequestion.~#1%
}
\newcommand*{\questionweight}[1]{%
  \hspace{\fill}
  \begin{tabular}{|c|}
    \hline
    \small \uantwerpendocsprop{weightname}: #1\\
    \hline
  \end{tabular}\\
}
\newcommand{\engdut}[2]{%
  \begin{tabular}{ccc}%
    \selectlanguage{english}%
    \begin{minipage}[t]{0.45\textwidth}%
      #1
    \end{minipage}%
    &~~~&
          \selectlanguage{dutch}%
          \begin{minipage}[t]{0.45\textwidth}%
            #2
          \end{minipage}%
  \end{tabular}
  \selectlanguage{english}%
}
\newcommand*\@mcsymbol{\square}
\newcommand*\setmcsymbol[1]{\renewcommand\@mcsymbol{#1}}
\newcommand\mc[1]{%
  \hfill\break\qquad\begin{tabular}{cc}
                      $\@mcsymbol$
                      &
                        \begin{minipage}[t]{0.9\textwidth}%
                          #1
                        \end{minipage}%
                    \end{tabular}
                  }
\newcommand{\engdutmc}[2]{%
  \hfill\break\begin{tabular}{cccc}
                $\@mcsymbol$
                &
                  \selectlanguage{english}%
                  \begin{minipage}[t]{0.42\textwidth}%
                    #1
                  \end{minipage}%
                &---&
                      \selectlanguage{dutch}%
                      \begin{minipage}[t]{0.42\textwidth}%
                        #2
                      \end{minipage}%
              \end{tabular}
              \selectlanguage{english}%
            }
\newcommand\insertsolutionspagepartial[1]{
  ~\relax
  \AddToShipoutPicture*{%
    \put(0,0){%
      \begin{tikzpicture}
        \clip (0,0) rectangle (21,#1);
\draw[densely dotted, step=0.5cm,black!20] (0.999,1.499) grid (2,2.5);
\draw[densely dotted, step=0.5cm,black!20] (18.999,1.499) grid (20,2.5);

\draw[densely dotted, step=0.5cm,black!20] (0.999,2.499) grid (20,27);
\draw[densely dotted, step=0.5cm,black!20] (0.999,27) grid (16,28);
\draw[densely dotted, step=0.5cm,black!20] (19.499,27) grid (20,28);
\draw[densely dotted, step=0.5cm,black!20] (0.99,27.999) grid
(20,28.5);
\draw[ultra thick] (1,#1) -- (20,#1);
\end{tikzpicture}
}
}%
\clearpage
\relax
}
\newcommand\insertsolutionspage[1]{
  \clearpage
  \AddToShipoutPicture*{%
    \put(0,0){%
      \begin{tikzpicture}
        \clip (0,0) rectangle (21,29.5);
        \draw[densely dotted, step=0.5cm,black!20] (0.999,1.499) grid (2,2.5);
        \draw[densely dotted, step=0.5cm,black!20] (18.999,1.499) grid (20,2.5);

        \draw[densely dotted, step=0.5cm,black!20] (0.999,2.499) grid (20,28);
        \draw[densely dotted, step=0.5cm,black!20] (0.999,28) grid (16,28.5);
        \draw[densely dotted, step=0.5cm,black!20] (19.499,28) grid (20,28.5);
      \end{tikzpicture}
    }
    \put(120,150){\rotatebox{60}{\textcolor{watermark}{
          \fontsize{105}{130}\selectfont\textsf{#1}}
      }
    }
  }%
  ~\relax
}
\AtEndDocument{
  \label{lastpage}
}
\endinput
%%
%% End of file `uantwerpenexam.cls'.
