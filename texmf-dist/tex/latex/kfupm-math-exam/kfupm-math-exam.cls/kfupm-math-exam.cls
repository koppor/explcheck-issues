%%
%% This is file `kfupm-math-exam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% kfupm-math-exam.dtx  (with options: `kfupm-math-exam.cls,package')
%% 
%%  kfupm-math-exam.dtx
%%  Copyright 2022 Mohammed Alshahrani
%% 
%%  This work may be distributed and/or modified under the
%%  conditions of the LaTeX Project Public License, either version 1.3
%%  of this license or (at your option) any later version.
%%  The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%%  and version 1.3 or later is part of all distributions of LaTeX
%%  version 2005/12/01 or later.
%% 
%%  This work has the LPPL maintenance status `maintained'.
%% 
%%  The Current Maintainer of this work is Mohammed Alshahrani.
%% 
%%  This work consists of the files kfupm-math-exam.dtx and kfupm-math-exam.ins and the derived file kfupm-math-exam.cls.
%% 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}

\def\fileversion{0.1.0}
\def\filedate{2022/07/25}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kfupm-math-exam}[\filedate\space Version \fileversion\space by
  Department of Mathematics, KFUPM]
\RequirePackage{kvoptions} \SetupKeyvalOptions{
  family = kfupmmathexam,
  prefix = kfupmmathexam@,
  setkeys = \kvsetkeys
}
\DeclareStringOption[212]%
  {term}
\DeclareStringOption[Exam]%
  {topic}
\DeclareStringOption[King Fahd University of Petroleum \& Minerals]%
  {university}
\DeclareStringOption[Department of Mathematics]%
  {dept}
\DeclareStringOption[MATH101 CALCULUS I]%
  {course}
\DeclareStringOption[3]%
  {quartile}
\DeclareStringOption[1]%
  {examtitle}
\DeclareStringOption[March 9, 2022]%
  {examdate}
\DeclareStringOption[4]%
  {numofversions}
\DeclareStringOption[15]%
  {numofquestions}
\DeclareStringOption[5]%
  {numofoptions}
\DeclareStringOption[0123456]%
  {studentnumber}
\DeclareStringOption[snumver@kfupm.edu.sa]%
  {email}
\DeclareStringOption[1]%
  {firstexercise}
\DeclareStringOption[3.5cm]{betweenquestions}
\DeclareStringOption[0.762cm]{spaceafterbody}
\DeclareStringOption[0.5cm]{betweenoptions}
\DeclareDefaultOption{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessKeyvalOptions{kfupmmathexam}
\LoadClass[a4paper, 12pt]{article}
\RequirePackage[
    paperheight=33cm,
    paperwidth=21.5cm,
    headheight = 20pt,
    margin = 2cm,
    tmargin = \dimexpr 2cm - 10pt \relax,
  ]{geometry} % set up nicer margins
  \addtolength{\footskip}{20pt}
\RequirePackage{fancyhdr} % for headers and footers
\RequirePackage{graphicx} % for including figures
\RequirePackage{amsmath} % use AMS math package
\RequirePackage{amssymb} % use AMS symbols
\RequirePackage{amsthm} % for writing proofs
\RequirePackage{array} % for setting up arguments to columns
\RequirePackage{booktabs} % for professional tables
\RequirePackage%
  [tworuled, linesnumbered, noend, noline]%
  {algorithm2e} % for typesetting pseudo-code
\RequirePackage{xcolor} % for colored text (comments in algorithms)
\RequirePackage{trimspaces, xstring} % for multiple author parsing
\RequirePackage[shortlabels]{enumitem} \labelsep=.75cm
\RequirePackage{mathrsfs}
\RequirePackage{xparse}
\RequirePackage{environ}
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}
\RequirePackage{tcolorbox}

\newcommand{\kme@temp}{}
\newcommand{\kme@sub}[4]{%
  \ifnum#3 = 1\relax%
    \ifnum#4 = 1\relax%
      \renewcommand{\kme@temp}{#1}%
    \else%
      \StrBefore{#1}{#2}[\kme@temp]%
    \fi%
  \else%
    \ifnum#3 = #4\relax%
      \StrBehind[\numexpr#3 - 1\relax]{#1}{#2}[\kme@temp]%
    \else%
      \StrBetween[\numexpr#3 - 1\relax,#3]{#1}{#2}{#2}[\kme@temp]%
    \fi%
  \fi%
  \expandafter\trim@spaces\expandafter{\kme@temp}%
}
\newcommand{\kme@authorProcessed}[1]{%
  \kme@sub{\kfupmmathexam@name}{;}{#1}{\arabic{kme@numAuthors}}~%
  (\kme@sub{\kfupmmathexam@studentnumber}{;}{#1}{\arabic{kme@numAuthors}})\\%
  \texttt{\kme@sub{\kfupmmathexam@email}{;}{#1}{\arabic{kme@numAuthors}}}%
  % if there are more authors, do a recursive call for the next one
  \ifnum#1 < \arabic{kme@numAuthors}\relax\and\kme@authorProcessed{\numexpr#1 + 1\relax}\fi%
}
\newcommand{\kme@authorsProcessed}{%
  % count number of authors; one more than number of semicolons
  \StrCount{\kfupmmathexam@name}{;}[\kme@numAuthors]%
  \newcounter{kme@numAuthors}%
  \setcounter{kme@numAuthors}{\kme@numAuthors}%
  \stepcounter{kme@numAuthors}%
  % produce output
  \kme@authorProcessed{1}%
}
\graphicspath{{figures/}}
\setlength{\headheight}{10pt}
\newcommand{\kfupmmathexam@setupHF}{%
  \fancyhf{}
  \fancyhead[L]{\sffamily \small KFUPM  }
  \fancyhead[C]{\sffamily Page \thepage ~of  \pageref{LastPage}}
  \fancyhead[R]{\sffamily Term \kfupmmathexam@term}
  \fancyfoot[L]{\sffamily /\kfupmmathexam@dept}
  \fancyfoot[R]{\sffamily\bfseries\thepage}
  \renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\footrulewidth}{0.5pt}
}
\fancypagestyle{plain}{\kfupmmathexam@setupHF{}} \kfupmmathexam@setupHF{}
\pagestyle{fancy}
\NewDocumentCommand{\coverpage}{O{\kfupmmathexam@course} O{\kfupmmathexam@examtitle} O{\kfupmmathexam@term} O{\kfupmmathexam@examdate}}{%
\thispagestyle{empty}
\begin{center}
    \begin{large}
        Kink Fahd University of Petroleum and Minerals\\
        Mathematics\\
        \vspace*{2cm}
        {\bf #1}  \\
        {\bf #2}  \\
        {\bf #3}  \\
        {\bf #4}  \\

        \vspace*{3cm}
        {\bf{\Huge{\fbox{EXAM COVER }}}}\\
        \vspace*{2cm}
        {\bf Number of versions: \kfupmmathexam@numofversions }  \\
        {\bf Number of questions: \kfupmmathexam@numofquestions }  \\
        {\bf Number of Answers: \kfupmmathexam@numofoptions  }  \\

        \vspace*{0.2cm}

    \end{large}

    \vfill

    \tiny{This exam was prepared using EXAM SHUFFLER}
    \tiny{For questions send an email to Dr. Mohammed Alshahrani (mshahrani@kfupm.edu.sa) }
\end{center}
\newpage
}
\newcommand{\versioncover}[1]{
\thispagestyle{empty}
\begin{center}
    \begin{large}
        Kink Fahd University of Petroleum and Minerals \\
        Mathematics \\
        \vspace*{4.5cm}
        {\bf \fbox{ \codestr{CODE}{#1} } }  \hfill {\bf \fbox{ \codestr{CODE}{#1} }} \\
        {\bf math333 }  \\
        {\bf exam 1 }  \\
        {\bf 182 }  \\
        {\bf monday march 13 }  \\
        {\bf Net Time Allowed: 120 minutes }  \\

        \vspace*{0.2cm}

    \end{large}
\end{center}
\ifthenelse{\equal{#1}{0}}{
\begin{center}
\vspace*{6cm}
{\bf {\Huge{MASTER VERSION}}}  \\
\end{center}
}{
\large{Name:  }\hrulefill

\vspace{3mm}

\large{ID: } \hrulefill \large{  Sec: } \hrulefill \large{.}

\vspace{1cm}

\large{\bf{Check that this exam has {\underline{ \thenumberofquestions }} questions.}}

\vspace{1cm}

\getInstructions
}
\newpage

\renewcommand{\thepage}{\noindent Term 182, math333, exam 1 \hfill Page {\bf \arabic{page} of \pagecount{\thenumberofpages} } \hfill {\bf \fbox{ \codestr{CODE}{#1} }}}
\setcounter{page}{1}

}
\title{\coverpage}
\author{}
\date{}
\AtBeginDocument{\pagestyle{myheadings}}%\maketitle

\SetKw{And}{and} \SetKw{Or}{or} \SetKw{To}{to}
\let\oldnl\nl
\newcommand{\nonl}{\renewcommand{\nl}{\let\nl\oldnl}}
\newcommand{\kfupmmathexam@capsty}[1]{\!}
\SetAlCapSty{kfupmmathexam@capsty} \SetAlCapNameFnt{\scshape\hspace{.69em}}
\DontPrintSemicolon
\newcommand\agacommfont[1]{\footnotesize\ttfamily\textcolor{gray}{#1}}
\SetCommentSty{agacommfont}
\newcommand*{\R}{{\mathbb R}}
\newcommand*{\N}{{\mathbb N}}
\newcommand*{\Z}{{\mathbb Z}}
\newcommand*{\Q}{{\mathbb Q}}

\newcount\numberofversions
\numberofversions=\kfupmmathexam@numofversions
\advance\numberofversions +1
\newcounter{numberofquestions}
\setcounter{numberofquestions}{\kfupmmathexam@numofquestions}
\newcounter{numberofpages}
\setcounter{numberofpages}{0}
\newcounter{examcodecounter}
\setcounter{examcodecounter}{1}

\ExplSyntaxOn
\str_new:N \l_alphabets_str
\str_set:Nn \l_alphabets_str {abcdefghigklmnopqrstuvwxuz}
\newcommand{\instructions}[1]{
  \tl_set:Nn \l_tmpa_str {#1}
}
\newcommand{\getInstructions}[1]{
  \tl_use:N \l_tmpa_str
}
\int_new:N \l_tmppages_int
\int_set:Nn \l_tmppages_int {0}
\cs_set:Npn \l_calc_pages_int:n #1 {
    \int_set:Nn \l_tmppages_int {\int_div_truncate:nn {#1}{2}}
    \int_set:Nn \l_tmppages_int {\int_compare:nNnTF {0}={\int_mod:nn {#1}{2}}{\l_tmppages_int}{\l_tmppages_int+1}}
    \int_use:N \l_tmppages_int
}
\newcommand{\pagecount}[1]{
    \l_calc_pages_int:n {15}
}

\str_new:N \l_exam_code_str
\int_new:N \l_exam_version_int
\cs_set:Npn \l_concat_codenumber_str:nn #1#2 {
    \int_set:Nn \l_exam_version_int {100+#2}
    \str_clear_new:N \l_partone_str
    \str_clear_new:N \l_parttwo_str
    \str_set:Nn \l_partone_str {#1}
    \str_set:Nx \l_parttwo_str {\int_use:N \l_exam_version_int}
    \str_set:Nx \l_parttwo_str {\str_range:Nnn \l_parttwo_str {-2}{-1}}
    \str_concat:NNN \l_exam_code_str \l_partone_str \l_parttwo_str
    \str_use:N \l_exam_code_str
}
\newcommand{\codestr}[2]{
    \int_compare:nNnTF {0}={#2}{MASTER}{
    \l_concat_codenumber_str:nn {#1}{#2}
    }
}


\ExplSyntaxOff
\endinput
%%
%% End of file `kfupm-math-exam.cls'.
