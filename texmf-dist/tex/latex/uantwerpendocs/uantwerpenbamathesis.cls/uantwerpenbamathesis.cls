%%
%% This is file `uantwerpenbamathesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uantwerpendocs.dtx  (with options: `bmt')
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
\ProvidesClass{uantwerpenbamathesis}
    [2025/06/03 v4.11 .dtx skeleton file]
\newif\if@filled
\DeclareOption{filled}{\@filledtrue}
\input{uantwerpencommonoptions.clo}
\ExecuteOptions{a4paper,11pt,final,oneside,openright}
\ProcessOptions\relax
\LoadClassWithOptions{scrbook}
\setlength{\parindent}{0pt}
\addtolength{\parskip}{0.75\baselineskip}
\setcounter{secnumdepth}{3}
\RequirePackage[top=2.6cm, bottom=2.5cm, left=3.5cm, right=1.6cm]{geometry}
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
\newcommand\@uantwerpendocshl[1]{%
  \begin{lrbox}{\@tempboxa}#1\end{lrbox}\@uantwerpendocshlbox{\@tempboxa}}
\newcommand{\@uantwerpendocshlbox}[1]{%
  \tikz{%
    \pgfpathrectangle{\pgfpoint{1pt}{0pt}}{\pgfpoint{\wd #1}{\ht #1}}%
    \pgfusepath{use as bounding box}%
    \node[anchor=base
    west,align=center,fill=maincolor,text=white,outer sep=0pt,inner
    xsep=5pt, inner ysep=0pt,minimum height=\ht\strutbox+1pt]
    {\raisebox{1pt}{\strut}\strut\usebox{#1}};
  }%
}
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
\newcommand\disclaimer[1]{
  Disclaimer #1\newline\newline
  This document is an examination document that has not been
  corrected for any errors identified. Without prior written
  permission of both the supervisor(s) and the author(s), any copying,
  copying, using or realizing this publication or parts thereof
  is prohibited. For requests for information regarding the copying
  and/or use and/or realisation of parts of this publication, please
  contact to the university at which the author is registered.
  \newline\newline
  Prior written permission from the supervisor(s) is also
  required for the use for industrial or commercial utility of the
  (original) methods, products, circuits and programs described in this
  thesis,  and for the submission of this publication for participation
  in scientific prizes or competitions.
  \newline\newline
  This document is in accordance with the faculty regulations related to this
  examination document and the Code of Conduct. The text has been reviewed
  by the supervisor and the attendant.
}
\AtBeginDocument{
  \makeatother
  \@ifpackageloaded{babel}{
    \addto\captionsdutch{%
      \renewcommand\disclaimer[1]{
        Disclaimer #1\newline\newline
        Dit document is een examendocument dat niet werd gecorrigeerd voor
        eventueel vastgestelde fouten. Zonder voorafgaande schriftelijke
        toestemming van zowel de promotor(en) als de auteur(s) is overnemen,
        kopiëren, gebruiken of realiseren van deze uitgave of gedeelten ervan
        verboden. Voor aanvragen tot of informatie i.v.m. het overnemen en/of
        gebruik en/of realisatie van gedeelten uit deze publicatie, wendt u
        tot de universiteit waaraan de auteur is ingeschreven.
        \newline\newline
        Voorafgaande schriftelijke toestemming van de promotor(en) is eveneens
        vereist voor het aanwenden van de in dit afstudeerwerk beschreven
        (originele) methoden, producten, schakelingen en programma's voor
        industrieel of commercieel nut en voor de inzending van deze
        publicatie ter deelname aan wetenschappelijke prijzen of wedstrijden.
        \newline\newline
        Dit document is in overeenstemming met het facultair reglement
        gerelateerd aan dit examendocument en de gedragscode. De tekst werd
        nagekeken door de promotor en de begeleider.
      }
    }
  }{}
  \makeatletter
}
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
\newcommand*{\@companylogo}{}
\newcommand*{\companylogo}[1]{\renewcommand*{\@companylogo}{#1}}
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
\seq_new:N \g__uantwerpendocs_cosupervisors
\seq_new:N \g__uantwerpendocs_cosupervisorswithaffiliation
\cs_new:Nn \__uantwerpendocs_addcosupervisor:nn {
  \seq_gpush:Nn \g__uantwerpendocs_cosupervisors { #1 }
  \seq_gpush:Nn \g__uantwerpendocs_cosupervisorswithaffiliation { #1,~#2 }
}
\NewDocumentCommand{\cosupervisor}{mm}{
  \__uantwerpendocs_addcosupervisor:nn { #1 } { #2 }
}
\NewDocumentCommand{\jointcosupervisors}{mm}{
  \seq_use:Nnnn \g__uantwerpendocs_cosupervisors { #2 } { #1 } { #2 }
}
\NewDocumentCommand{\jointcosupervisorswithaffiliation}{mm}{
  \seq_use:Nnnn \g__uantwerpendocs_cosupervisorswithaffiliation { #2 } { #1 } { #2 }
}
\NewDocumentCommand{\cosupervisorsname}{m}{
  \if_int_compare:w \seq_count:N \g__uantwerpendocs_cosupervisors > 2
  \uantwerpendocsprop{cosupervisorsname} #1
  \else:
  \if_int_compare:w \seq_count:N \g__uantwerpendocs_cosupervisors = 2
  \uantwerpendocsprop{cosupervisorname} #1
  \else:
  \fi:
  \fi:
}
\seq_new:N \g__uantwerpendocs_extsupervisors
\seq_new:N \g__uantwerpendocs_extsupervisorswithaffiliation
\cs_new:Nn \__uantwerpendocs_addextsupervisor:nn {
  \seq_gpush:Nn \g__uantwerpendocs_extsupervisors { #1 }
  \seq_gpush:Nn \g__uantwerpendocs_extsupervisorswithaffiliation { #1,~#2 }
}
\NewDocumentCommand{\extsupervisor}{mm}{
  \__uantwerpendocs_addextsupervisor:nn { #1 } { #2 }
}
\NewDocumentCommand{\jointextsupervisors}{mm}{
  \seq_use:Nnnn \g__uantwerpendocs_extsupervisors { #2 } { #1 } { #2 }
}
\NewDocumentCommand{\jointextsupervisorswithaffiliation}{mm}{
  \seq_use:Nnnn \g__uantwerpendocs_extsupervisorswithaffiliation { #2 } { #1 } { #2 }
}
\NewDocumentCommand{\extsupervisorsname}{m}{
  \if_int_compare:w \seq_count:N \g__uantwerpendocs_extsupervisors > 2
  \uantwerpendocsprop{extsupervisorsname} #1
  \else:
  \if_int_compare:w \seq_count:N \g__uantwerpendocs_extsupervisors = 2
  \uantwerpendocsprop{extsupervisorname} #1
  \else:
  \fi:
  \fi:
}
\AtBeginDocument{
  \seq_gpush:Nn \g__uantwerpendocs_supervisors {}
  \seq_greverse:N \g__uantwerpendocs_supervisors
  \seq_gpush:Nn \g__uantwerpendocs_supervisorswithaffiliation {}
  \seq_greverse:N \g__uantwerpendocs_supervisorswithaffiliation
  \seq_gpush:Nn \g__uantwerpendocs_cosupervisors {}
  \seq_greverse:N \g__uantwerpendocs_cosupervisors
  \seq_gpush:Nn \g__uantwerpendocs_cosupervisorswithaffiliation {}
  \seq_greverse:N \g__uantwerpendocs_cosupervisorswithaffiliation
  \seq_gpush:Nn \g__uantwerpendocs_extsupervisors {}
  \seq_greverse:N \g__uantwerpendocs_extsupervisors
  \seq_gpush:Nn \g__uantwerpendocs_extsupervisorswithaffiliation {}
  \seq_greverse:N \g__uantwerpendocs_extsupervisorswithaffiliation
}
\ExplSyntaxOff
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
\NewDocumentCommand{\bamadegree}{m}{
  \seq_new:N \l__uantwerpendocs_degreechunks
  \regex_extract_all:nnN { [^-]+ } { #1 } \l__uantwerpendocs_degreechunks
  \bamadoctype{\seq_item:Nn \l__uantwerpendocs_degreechunks {2} - \seq_item:Nn \l__uantwerpendocs_degreechunks {3}}
  \degree{\uantwerpendocsdegree{#1}}
}
\ExplSyntaxOff
\newcommand*{\diploma}[1]{
  \PackageError{uantwerpendocs}
  {The '\protect\diploma{}' macro is no longer available. Use
    '\protect\degree{}' instead}
  {The interface of uantwerpendocs 4.0 has been changed. Use the
    '\protect\degree' macro to specify your degree in full text (see
    the uantwerpendocs manual)'}
}
\newcommand*{\@academicyear}{XXX-YYYY}
\newcommand*{\academicyear}[1]{\renewcommand*{\@academicyear}{#1}}
\newcommand{\@copyrightnotices}{\disclaimer{\@bamadoctype}}
\ExplSyntaxOn
\seq_new:N \l_title_seq
\cs_generate_variant:Nn \seq_set_split:Nnn { Nnf }
\cs_new_nopar:Npn \__uantwerpendocs_reversevideo:f #1
{
  \seq_set_split:Nnf \l_title_seq {~} { #1 }
  \seq_set_map:NNn \l_title_seq \l_title_seq {\@uantwerpendocshl{##1}}
  \seq_use:Nnnn \l_title_seq { ~ } { ~ } { ~ }
}
\NewDocumentCommand{\reversevideo}{m}{
  \__uantwerpendocs_reversevideo:f { #1 }
}
\ExplSyntaxOff
\AtBeginDocument{
  \setlength{\headheight}{13.7pt}
  \renewcommand*{\headrulewidth}{0pt}
  \renewcommand*{\footrulewidth}{0pt}
  \newsavebox\smallogo
  \savebox\smallogo{\raisebox{-1ex}{\includegraphics[width=2.5cm]{\logopos}}}
  \if@twoside
  \lhead[]{\footnotesize\slshape\rightmark}
  \chead[]{}
  \rhead[\footnotesize\slshape\leftmark]{}
  \lfoot[\footnotesize\thepage~\textcolor{maincolor}{\textbf{|}}]{\usebox\smallogo}
  \cfoot[\footnotesize\@bamadoctype]{\footnotesize\@bamadoctype}
  \rfoot[\usebox\smallogo]{\footnotesize\textcolor{maincolor}{\textbf{|}}~\thepage}
  \else
  \lhead[]{\footnotesize\slshape\leftmark}
  \chead[]{}
  \rhead[]{}
  \lfoot[]{\usebox\smallogo}
  \cfoot[]{\footnotesize\@bamadoctype}
  \rfoot[]{\footnotesize\textcolor{maincolor}{\textbf{|}}~\thepage}
  \fi
  \fancypagestyle{plain}{\pagestyle{fancy}}
  % \patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}
}

\newcommand{\@crnotice}{
  \@copyrightnotices
}
\addtokomafont{section}{\color{basecolor}}
\addtokomafont{chapter}{\color{basecolor}}
\renewcommand\maketitle{%
  \pagestyle{empty}
  \begin{titlepage}
    \AddToShipoutPicture*{%
      \put(0,0){%
        \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
          \clip (0,0) rectangle(\paperwidth,\paperheight);
          \node
          [anchor=north east,align=right]
          at (\paperwidth-1.6cm,\paperheight-2.6cm)
          {\bfseries\large
            \uantwerpendocsprop{acyearname}\\[.75ex]\Large\@academicyear};
          \node (title)
          [anchor=north west,align=left,
          text width={\paperwidth-5.1cm},font=\Huge,text=white,
          xshift=1pt]
          at (3.5cm,\paperheight-6.4cm)
          {\sethlcolor{maincolor}%
            \textsf{\textbf{\reversevideo{\@title}}}%
            \ifx\@subtitle\empty\else\\\textsf{\reversevideo{\@subtitle}}\fi};
          \node
          [anchor=north west,font=\LARGE,yshift=-1cm,xshift=-1pt]
          at (title.south west)
          {%
            \textsf{\textbf{\@author}}
          };

          \node
          [anchor=west,align=left,
          text width={\paperwidth-5.1cm},font=\normalsize]
          at (3.5cm,12cm)
          {\textsf{\@bamadoctype}\\%
            \textsf{\textbf{\@degree}}
          };

          \node
          [anchor=west,align=left,
          text width={\paperwidth-5.1cm},font=\normalsize]
          at (3.5cm,7.5cm)
          {\supervisorsname{\\}
            \textbf{\jointsupervisorswithaffiliation{\\}{~\\~\\}}%
            \cosupervisorsname{\\}
            \textbf{\jointcosupervisorswithaffiliation{\\}{~\\~\\}}%
            \extsupervisorsname{\\}
            \textbf{\jointextsupervisorswithaffiliation{\\}{}}
          };

          \ifx\@companylogo\@empty
          \else
          \node[anchor=south east] at
          (\paperwidth-1.6cm,1.5cm)
          {\@companylogo};
          \fi

          \node[anchor=south west] at
          (1.6cm,1.5cm)
          {\includegraphics[width=6.2cm]{\logopos}};
        \end{tikzpicture}
      }
    }
  \end{titlepage}%
  ~\par\relax
  \clearpage
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
%% End of file `uantwerpenbamathesis.cls'.
