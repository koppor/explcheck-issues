%%
%% This is file `uantwerpenletter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% uantwerpendocs.dtx  (with options: `le')
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
\ProvidesClass{uantwerpenletter}
    [2025/06/03 v4.11 .dtx skeleton file]
\newif\if@filled
\DeclareOption{filled}{\@filledtrue}
\newif\if@nofoldline
\DeclareOption{nofoldline}{\@nofoldlinetrue}
\input{uantwerpencommonoptions.clo}
\ExecuteOptions{a4paper,10pt,final,oneside,openright}
\ProcessOptions
\LoadClassWithOptions{letter}
\newcommand*\tat{\makeatletter @\makeatother}
\setlength{\parindent}{0pt}
\addtolength{\parskip}{0.75\baselineskip}
\setcounter{secnumdepth}{3}
\RequirePackage[top=1in, bottom=1in, left=1.34in, right=1in]{geometry}
\RequirePackage[normalem]{ulem}
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
\newcommand*{\facultyacronym}[1]{
  \PackageError{uantwerpendocs}
  {The '\protect\facultyacronym{}' macro is no longer available. Use
    your faculty abbreviation in lowercase as class options instead}
  {The interface of uantwerpendocs 4.0 has been changed. See
    the uantwerpendocs manual under section '5.2 The class options explained'}
}

\newcommand*{\@sender}{< Specify sender using
  \textbackslash{}sender\{name\}\{role\} >}
\newcommand*{\@senderrole}{~}
\newcommand*{\sender}[2]{\renewcommand*{\@sender}{#1}\renewcommand*{\@senderrole}{#2}}
\newcommand*{\logo}[1]{\renewcommand*{\@logo}{#1}}
\newcommand*{\@unit}{}
\newcommand*{\unit}[1]{\renewcommand*{\@unit}{#1}}
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_emailaddresses
\cs_new:Nn \__uantwerpendocs_addemailaddress:nn {
  \seq_gpush:Nn \g__uantwerpendocs_emailaddresses {#1\tat{}#2}
}
\NewDocumentCommand{\email}{mm}{
  \__uantwerpendocs_addemailaddress:nn { #1 } { #2 }
}
\NewDocumentCommand{\jointemails}{m}{
  \seq_use:Nn \g__uantwerpendocs_emailaddresses { #1 }
}
\NewDocumentCommand{\ifemails}{m}{
  \seq_if_empty:NTF \g__uantwerpendocs_emailaddresses {} {#1}
}
\AtBeginDocument{
  \seq_greverse:N \g__uantwerpendocs_emailaddresses
}
\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_phonenumbers
\cs_new:Nn \__uantwerpendocs_addphonenumber:n {
  \seq_gpush:Nn \g__uantwerpendocs_phonenumbers {#1}
}
\NewDocumentCommand{\phone}{m}{
  \__uantwerpendocs_addphonenumber:n { #1 }
}
\NewDocumentCommand{\jointphones}{m}{
  \seq_use:Nn \g__uantwerpendocs_phonenumbers { #1 }
}
\NewDocumentCommand{\ifphones}{m}{
  \seq_if_empty:NTF \g__uantwerpendocs_phonenumbers {} {#1}
}
\AtBeginDocument{
  \seq_greverse:N \g__uantwerpendocs_phonenumbers
}
\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_faxnumbers
\cs_new:Nn \__uantwerpendocs_addfaxnumber:n {
  \seq_gpush:Nn \g__uantwerpendocs_faxnumbers {#1}
}
\NewDocumentCommand{\fax}{m}{
  \__uantwerpendocs_addfaxnumber:n { #1 }
}
\NewDocumentCommand{\jointfaxes}{m}{
  \seq_use:Nn \g__uantwerpendocs_faxnumbers { #1 }
}
\NewDocumentCommand{\iffaxes}{m}{
  \seq_if_empty:NTF \g__uantwerpendocs_faxnumbers {} {#1}
}
\AtBeginDocument{
  \seq_greverse:N \g__uantwerpendocs_faxnumbers
}
\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__uantwerpendocs_mobilenumbers
\cs_new:Nn \__uantwerpendocs_addmobilenumber:n {
  \seq_gpush:Nn \g__uantwerpendocs_mobilenumbers {#1}
}
\NewDocumentCommand{\mobile}{m}{
  \__uantwerpendocs_addmobilenumber:n { #1 }
}
\NewDocumentCommand{\jointmobiles}{m}{
  \seq_use:Nn \g__uantwerpendocs_mobilenumbers { #1 }
}
\NewDocumentCommand{\ifmobiles}{m}{
  \seq_if_empty:NTF \g__uantwerpendocs_mobilenumbers {} {#1}
}
\AtBeginDocument{
  \seq_greverse:N \g__uantwerpendocs_mobilenumbers
}
\ExplSyntaxOff
\newcommand*{\@returnaddress}{<specify return-address using \textbackslash\{single-line-return-address\}>}
\renewcommand*{\returnaddress}[1]{\renewcommand*{\@returnaddress}{#1}}
\newcommand*{\@to}{<Specify addressee using \textbackslash{}to\{name\}>}
\renewcommand*{\to}[1]{\renewcommand*{\@to}{#1}}
\newcommand*{\@toorganization}{}
\newcommand*{\toorganization}[1]{\renewcommand*{\@toorganization}{#1}}
\newcommand*{\@toaddress}{}
\newcommand*{\toaddress}[1]{\renewcommand*{\@toaddress}{#1}}
\newcommand*{\@subject}{-}
\newcommand*{\subject}[1]{\renewcommand*{\@subject}{#1}}
\renewcommand*{\opening}[1]{#1}
\newcommand*{\@closing}{<specify a closing formula using
  \textbackslash{}closing\{\}>}
\renewcommand*{\closing}[1]{\renewcommand*{\@closing}{#1}}
\newcommand*{\@signature}{\vspace*{8ex}}
\renewcommand*{\signature}[1]{\renewcommand*{\@signature}{#1}}
\newcommand*{\@carboncopy}{}
\newcommand*{\carboncopy}[1]{\renewcommand*{\@carboncopy}{#1}}
\newcommand*{\@enclosed}{}
\newcommand*{\enclosed}[1]{\renewcommand*{\@enclosed}{#1}}
\newcommand*{\@address}{
  \PackageError{uantwerpendocs}
  {Please, set your multi-line address and contact details using the
    '\protect\address{}' command in the preamble of your document}
  {See the uantwerpendocs manual}
}
\renewcommand*{\address}[1]{\renewcommand*{\@address}{#1}}
\lhead[]{}
\chead[]{}
\rhead[]{}
\lfoot[\small\textcolor{gray}{\@date}]{\textcolor{gray}{\@date}}
\cfoot[]{}
\rfoot[\small\textcolor{gray}{\pagename~\thepage~\uantwerpendocsprop{of}~\pageref{lastpage}}]
  {\small\textcolor{gray}{\pagename~\thepage~\uantwerpendocsprop{of}~\pageref{lastpage}}}

\setlength{\headheight}{13.7pt}
\renewcommand*{\headrulewidth}{0pt}
\renewcommand*{\footrulewidth}{0pt}
\if@filled\else
  \raggedright
\fi
\raggedbottom
\onecolumn
\newcommand\maketitle{%
  \pagestyle{fancy}
  \thispagestyle{empty}
  \AddToShipoutPicture*{%
    \put(0,0){%
      \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
        \clip (0,0) rectangle(\paperwidth,\paperheight);
        \path (current page.north west) +(1.8cm,-1.2cm)
        node[anchor=north west] {
          \includegraphics[height=1.1cm]{\@logo}
        };
        \if@nofoldline\else
        \draw (current page.north west)
        +(1cm,-98mm) -- +(1.5cm,-98mm);
        \fi
        % 90 x 45
        % pos: 20mm van kant, 15mm van onderkant
        \path (current page.north east) +(-100mm,-65mm)
        node[anchor=west,text width=80mm,align=left] {
          \scriptsize\textcolor{gray}{\uline{\@returnaddress}}\\*
          \normalsize\@to\\*
          \ifx\@toorganization\@empty\else\@toorganization\\*\fi%
          \@toaddress
        };
      \end{tikzpicture}
    }
  }
  ~\\[3ex]
  \textcolor{uauaside}{\textbf{\@sender}}
  \ifx\@senderrole\@empty\\[1.75ex]\else \\*\@senderrole\\[1.75ex]\fi
  \@faculty{}
  \ifx\@unit\@empty\else\\* \@unit\fi~\\[1.75ex]
  \@address\\[1.75ex]
  \ifemails{E~\jointemails{\\\phantom{E~}}\\}
  \ifphones{T~\jointphones{\\\phantom{T~}}\\}
  \iffaxes{F~\jointfaxes{\\\phantom{F~}}\\}
  \ifmobiles{M~\jointmobiles{\\\phantom{M~}}\\}
  ~\\[4ex]
  \begin{tikzpicture}[anchor=north west,align=left,outer sep=0,inner sep=0]
    \path
    (0,0) node { \scriptsize \strut
      \textcolor{gray}{\uppercase\expandafter{\uantwerpendocsprop{datename}} } }
    (4cm,0) node { \scriptsize \strut
      \textcolor{gray}{\uppercase\expandafter{\uantwerpendocsprop{subjectname}} } }
    (0,-2.5ex) node { \strut \@date }
    (4cm,-2.5ex) node[align=left] { \strut \@subject };
  \end{tikzpicture}~\\[4ex]
}
\newif\ifletterclosed
\letterclosedfalse
\newcommand\closeletter{
  \ifletterclosed
  \else
    \@closing\\*[3ex]\@signature~\\[3ex]
    \@sender
    \ifx\@senderrole\@empty\\[8ex]\else\\*\@senderrole\\[8ex]\fi
    \setlength{\parskip}{0em}
    \ifx\@carboncopy\@empty\else \MakeUppercase{\ccname}: \@carboncopy\\[4ex]\fi
    \ifx\@enclosed\@empty\else \MakeUppercase{\enclname}: \@enclosed\fi
    \label{lastpage}
    \letterclosedtrue
    \pagestyle{empty}
    \clearpage
  \fi
}
\AtEndDocument{
  \closeletter
}
\endinput
%%
%% End of file `uantwerpenletter.cls'.
