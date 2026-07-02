%%
%% This is file `heria.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% heria.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright 2023-2025 Tristan Miller
%% Copyright 2016 John Kormylo
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{heria}
[2025-08-16 v4.0.1.0 Class for Horizon Europe (R)IA proposals]
\LoadClass[11pt,a4paper]{article}
\RequirePackage[T1]{fontenc} % T1 font encoding
\RequirePackage[left=15mm,
                top=15mm,
                bottom=15mm,
                right=15mm,
                includehead,
                includefoot,
                headheight=10pt,
                headsep=5mm,
                footskip=18pt,
               ]{geometry}
\RequirePackage[pdftex]{graphicx} % For graphics

\RequirePackage[pdftex,pdfusetitle]{hyperref} % Hyperlinks
\hypersetup{%
    colorlinks=true,
    breaklinks=true,
    urlcolor=black,
    linkcolor=black,
    citecolor=black,
    pdfsubject={},
    pdfkeywords={},
}

\RequirePackage{xfp} % Floating point numbers

\newcommand{\disptoken}[1]{%
  \csname#1\endcsname
}
\RequirePackage{colortbl} % for shaded table rows
\RequirePackage{xltabular} % for breakable tables with var-width columns
\RequirePackage[table]{xcolor} % for colours and shaded table cells
\RequirePackage[breakable,raster]{tcolorbox} % for framed boxes
\definecolor{taggrey}{HTML}{B5B5B5}
\definecolor{footergrey}{HTML}{D8D8D8}
\definecolor{tablegrey}{HTML}{F2F2F2}
\definecolor{summaryblue}{HTML}{00B0F0}
\gdef\@templateversion{4.0} % Default version
\def\@supportedtemplateversions{3.2,3.3,3.4,4.0} % Supported versions
\ExplSyntaxOn
\NewDocumentCommand{\templateversion}{m}{%
 \clist_if_in:NnTF {\@supportedtemplateversions} {#1}
   {\gdef\@templateversion{#1}}
   {\PackageError{heria}%
     {unsupported~template~version}%
     {Use~one~of~\@supportedtemplateversions}
   }%
}
\ExplSyntaxOff
\newcommand{\callname}[1]{\gdef\@callname{#1}}%
\newcommand{\callidentifier}[1]{\gdef\@callidentifier{#1}}%
\newcommand{\calltopic}[1]{\gdef\@calltopic{#1}}%
\newcounter{@pcount} % Participant counter
\newcommand{\participant}[3]{%
  \stepcounter{@pcount}%
  \newcounter{@p#2num}%
  \setcounter{@p#2num}{\value{@pcount}}%
  \expandafter\xdef\csname @pFullName\arabic{@p#2num}\endcsname{#1}%
  \expandafter\xdef\csname @pShortName\arabic{@p#2num}\endcsname{#2}%
  \expandafter\xdef\csname @pCountry\arabic{@p#2num}\endcsname{#3}%
  \newcounter{@pSubcontractingCosts\arabic{@p#2num}}%
  \newcounter{@pPurchaseCosts\arabic{@p#2num}}%
  \newcounter{@pOtherCosts\arabic{@p#2num}}%
  \newcounter{@pInkindContributions\arabic{@p#2num}}%
}
\newcommand{\getPnum}[1]{%
  \@ifundefined{c@@p#1num}{}{\arabic{@p#1num}}%
}
\newcommand{\ptablerow}[1]{%
  \stepcounter{#1}
  \the\value{#1}
  \ifthenelse{\value{#1}=1}{ (Coordinator) &}{&}%
  \disptoken{@pFullName\arabic{#1}} (\disptoken{@pShortName\arabic{#1}}) &
  \disptoken{@pCountry\arabic{#1}} \\
  \hline%
}
\newcommand{\makeparticipantstable}{%
  \newcounter{@ptable}
  \begin{center}
    \begin{xltabular}{0.9\textwidth}{|l|X|l|}
      \hline
      \textbf{Participant No.} &
      \textbf{Participant organisation name} &
      \textbf{Country} \\
      \hline
      \whiledo%
        {\value{@ptable}<\numexpr\value{@pcount}-1}%
        {\ptablerow{@ptable}}%
      \ptablerow{@ptable}
    \end{xltabular}
  \end{center}
}
\RequirePackage{atveryend}
\newcounter{@wpcount} % Work package counter
\newcommand{\workpackage}[5]{%
  \stepcounter{@wpcount}%
  \newcounter{@wp\arabic{@wpcount}deliverable}%
  \newcounter{@wp\arabic{@wpcount}task}%
  \newcounter{@wp#1num}%
  \setcounter{@wp#1num}{\value{@wpcount}}%
  \expandafter\xdef\csname %
    @wpPersonMonths\arabic{@wp#1num}\endcsname{0}%
  \expandafter\xdef\csname @wpShortName\arabic{@wp#1num}\endcsname{#1}%
  \expandafter\xdef\csname @wpTitle\arabic{@wp#1num}\endcsname{#2}%
  \expandafter\xdef\csname %
    @wpLeadParticipantShortName\arabic{@wp#1num}\endcsname{#3}%
  \expandafter\xdef\csname @wpStartMonth\arabic{@wp#1num}\endcsname{#4}%
  \expandafter\xdef\csname @wpEndMonth\arabic{@wp#1num}\endcsname{#5}%
  \@bsphack
  \protected@write\@auxout{}%
    {\string\makeworkpackagestable@data{\arabic{@wp#1num}
    & #2 & \getPnum{#3} & #3 & %
    \@ifundefined{@wpTotalPersonMonths\arabic{@wp#1num}}%
    {\textbf{??}}%
    {\fpeval{\disptoken{@wpTotalPersonMonths\arabic{@wp#1num}}/2}}%
    & #4 & #5}}%
  \@esphack
  \ifthenelse{\arabic{@wp#1num}=1}{}{\bigskip}
  \noindent\begin{tabularx}%
    {1.0\linewidth}{|>{\columncolor{tablegrey}}l|X|}
    \hline
    \bfseries Work package number & \arabic{@wp#1num} \\
    \hline
    \bfseries Work package title & #2 \\
      \hline
  \end{tabularx}
}
\newcommand{\makeworkpackagestable@data}[1]{%
  \g@addto@macro\makeworkpackagestable@body{#1 \\ \hline}%
}
\def\makeworkpackagestable@body{}% initialize
\AtBeginDocument{\global\let\makeworkpackagestable@body@startup%
  \makeworkpackagestable@body}
\AtEndDocument{%
  \global\let\makeworkpackagestable@body@end\@empty
  \def\makeworkpackagestable@data#1%
    {\g@addto@macro\makeworkpackagestable@body@end{#1 \\ \hline}}%
}
\AtVeryEndDocument{%
  \ifx\makeworkpackagestable@body@startup%
    \makeworkpackagestable@body@end\else
    \@latex@warning{Rerun for \string\makeworkpackagestable}%
  \fi
}
\RequirePackage{makecell}
\newcommand{\makeworkpackagestable}{%
  \begin{center}
    \renewcommand\theadfont{\normalsize\bfseries}
    \begin{xltabular}{1.0\textwidth}{|c|X|c|c|c|c|c|}
      \hline
      \rowcolor{tablegrey}%
      \thead{Work\\ package\\ No.} &
      \thead{Work package title} &
      \thead{Lead\\ participant\\ No.} &
      \thead{Lead\\ participant\\ short name} &
      \thead{Person-\\months} &
      \thead{Start\\ month} &
      \thead{End\\ month} \\
      \hline
      \makeworkpackagestable@body
    \end{xltabular}
  \end{center}
}
\newcommand{\getWPnum}[1]{%
  \@ifundefined{c@@wp#1num}{}{\arabic{@wp#1num}}%
}
\newenvironment{objectives}{%
  \begin{tcolorbox}[colback=white,
                    parbox=false,
                    boxrule=0.75pt,
                    boxsep=0mm,
                    breakable
  ]%
  \textsf{\textbf{Objectives}~~~}%
  \begin{enumerate*}[nolistsep,noitemsep,itemjoin={~---~},%
    label=\textbf{O\arabic{@wpcount}.\arabic*}]%
  }{%
  \end{enumerate*}%
  \end{tcolorbox}%
  }
\newenvironment{descriptionofwork}{%
  \begin{tcolorbox}[colback=white,
                    parbox=false,
                    boxrule=0.75pt,
                    boxsep=0mm,
                    breakable
  ]%
  \textsf{\textbf{Description of work}~~~}
  }{%
  \end{tcolorbox}%
  }
\NewDocumentCommand{\task}{mmmm}{%
  \stepcounter{@wp\arabic{@wpcount}task}
  \par\medskip\noindent\textbf{Task %
  \arabic{@wpcount}.\arabic{@wp\arabic{@wpcount}task}: #1}
  \textit{(Lead: #2; Participants: #3; Month: #4)}\hspace{1em}%
}
\newcounter{@dcount} % Deliverable counter
\newcommand{\deliverable}[6]{%
  \stepcounter{@wp\arabic{@wpcount}deliverable}%
  \stepcounter{@dcount}%
  \expandafter\xdef\csname @dNumber\arabic{@dcount}\endcsname%
    {\arabic{@wpcount}.\arabic{@wp\arabic{@wpcount}deliverable}}%
  \expandafter\xdef\csname %
    @dWorkPackage\arabic{@dcount}\endcsname{\arabic{@wpcount}}%
  \expandafter\xdef\csname @dName\arabic{@dcount}\endcsname{#1}%
  \expandafter\gdef\csname @dDescription\arabic{@dcount}\endcsname{#2}%
  \expandafter\xdef\csname @dLead\arabic{@dcount}\endcsname{#3}%
  \expandafter\xdef\csname @dType\arabic{@dcount}\endcsname{#4}%
  \expandafter\xdef\csname %
    @dDisseminationLevel\arabic{@dcount}\endcsname{#5}%
  \expandafter\xdef\csname @dDeliveryDate\arabic{@dcount}\endcsname{#6}%
}
\newcommand{\dtablerow}[1]{%
  \stepcounter{#1}
  \disptoken{@dNumber\arabic{#1}} &
  \disptoken{@dName\arabic{#1}} &
  \disptoken{@dDescription\arabic{#1}} &
  \disptoken{@dWorkPackage\arabic{#1}} &
  \disptoken{@dLead\arabic{#1}} &
  \disptoken{@dType\arabic{#1}} &
  \disptoken{@dDisseminationLevel\arabic{#1}} &
  \disptoken{@dDeliveryDate\arabic{#1}} \\
  \hline%
}
\newcommand{\makedeliverablestable}{%
  \newcounter{@dtable}
  \begin{center}
    \renewcommand\theadfont{\normalsize\bfseries}
    \begin{xltabular}{1.0\textwidth}%
      {|c|>{\raggedright\hsize=.667\hsize\linewidth=\hsize}X%
      |>{\hsize=1.333\hsize\linewidth=\hsize}X|c|c|c|c|p{15mm}|}
      \hline
      \rowcolor{tablegrey}%
      \thead{\#} &
      \thead{Name} &
      \thead{Short description} &
      \thead{WP\\ \#} &
      \thead{Lead\\ participant} &
      \thead{Type} &
      \thead{Dissem.\\ level} &
      \thead{Delivery\\ month} \\
      \hline
      \whiledo%
        {\value{@dtable}<\numexpr\value{@dcount}-1}%
        {\dtablerow{@dtable}}%
      \dtablerow{@dtable}
    \end{xltabular}
  \end{center}
}
\newcounter{@mcount} % Milestone counter
\newcommand{\milestone}[4]{%
  \stepcounter{@mcount}%
  \expandafter\gdef\csname @mName\arabic{@mcount}\endcsname{#1}%
  \expandafter\xdef\csname @mWorkPackages\arabic{@mcount}\endcsname{#2}%
  \expandafter\xdef\csname @mDueDate\arabic{@mcount}\endcsname{#3}%
  \expandafter\xdef\csname %
    @mMeansOfVerification\arabic{@mcount}\endcsname{#4}%
}
\newcommand{\mtablerow}[1]{%
  \stepcounter{#1}
  \arabic{#1} &
  \disptoken{@mName\arabic{#1}} &
  \disptoken{@mWorkPackages\arabic{#1}} &
  \disptoken{@mDueDate\arabic{#1}} &
  \disptoken{@mMeansOfVerification\arabic{#1}} \\
  \hline%
}
\newcommand{\makemilestonestable}{%
  \newcounter{@mtable}
  \begin{center}
    \renewcommand\theadfont{\normalsize\bfseries}
    \begin{xltabular}{1.0\textwidth}{|c|X|p{26mm}|c|p{26mm}|}
      \hline
      \rowcolor{tablegrey}%
      \thead{\#} &
      \thead{Milestone\\ name} &
      \thead{Related\\ WP(s)} &
      \thead{Month\\ due} &
      \thead{Means of\\ verification} \\
      \hline
      \whiledo%
        {\value{@mtable}<\numexpr\value{@mcount}-1}%
        {\mtablerow{@mtable}}%
      \mtablerow{@mtable}
    \end{xltabular}
  \end{center}
}
\newtcbox{\risktag}[1][black]{%
  fontupper=\scriptsize\sffamily\bfseries,%
  on line,%
  arc=3pt,%
  colupper=white,%
  colback=#1!50!black,%
  colframe=#1!50!black,%
  before upper={\rule[-3pt]{0pt}{10pt}},%
  boxrule=1pt,%
  boxsep=0pt,%
  left=2pt,%
  right=2pt,%
  top=1pt,%
  bottom=.5pt%
}
\newcounter{@crcount} % Critical risk counter
\newcommand{\criticalrisk}[5]{%
  \stepcounter{@crcount}%
  \expandafter\gdef\csname %
    @crDescription\arabic{@crcount}\endcsname{#1}%
  \expandafter\xdef\csname @crLikelihood\arabic{@crcount}\endcsname{#2}%
  \expandafter\xdef\csname @crSeverity\arabic{@crcount}\endcsname{#3}%
  \expandafter\xdef\csname %
    @crWorkPackages\arabic{@crcount}\endcsname{#4}%
  \expandafter\gdef\csname @crMitigation\arabic{@crcount}\endcsname{#5}%
}
\newcommand{\crtablerow}[1]{%
  \stepcounter{#1}%
  \disptoken{@crDescription\arabic{#1}}\newline
    \risktag[blue]{Likelihood: \disptoken{@crLikelihood\arabic{#1}}}
    \risktag[red]{Severity: \disptoken{@crSeverity\arabic{#1}}} &
  \disptoken{@crWorkPackages\arabic{#1}} &
  \disptoken{@crMitigation\arabic{#1}} \\
  \hline%
}
\newcommand{\makecriticalriskstable}{%
  \newcounter{@crtable}
  \begin{center}
    \renewcommand\theadfont{\normalsize\bfseries}
    \begin{xltabular}{1.0\textwidth}{|p{60mm}|c|X|}
      \hline
      \rowcolor{tablegrey}%
      \thead{Description of risk (indicate level of\\ %
        (i) likelihood, and (ii) severity:\\ %
        Low\slash Medium\slash High)} &
      \thead{WP(s)\\ involved} &
      \thead{Proposed risk-mitigation measures} \\
      \hline
      \whiledo%
        {\value{@crtable}<\numexpr\value{@crcount}-1}%
        {\crtablerow{@crtable}}%
      \crtablerow{@crtable}
    \end{xltabular}
  \end{center}
}
\newcommand{\staffeffort}[3]{%
  \expandafter\xdef\csname @se#1.#2\endcsname{#3}%
}
\newcommand{\setablerow}[1]{%
  \def\serowtotal{0}%
  \setcounter{@secolumn}{0}%
  \bfseries\the\value{#1} \disptoken{@pShortName\arabic{#1}}%
  \edef\serowtemp{}%
  \whiledo{\value{@secolumn}<\value{@wpcount}}{%
    \stepcounter{@secolumn}%
    \edef\sewpname{\disptoken{@wpShortName\the\value{@secolumn}}}%
    \edef\sewpcell%
      {\disptoken{@se\disptoken{@pShortName\the\value{#1}}.\sewpname}}%
    \edef\serowtotal%
      {\fpeval{\serowtotal + \sewpcell}}% Total PMs per participant
    \xdef\setotalpm{\fpeval{\setotalpm + \sewpcell}}% Total PMs
    \expandafter\xdef\csname %
      @wpPersonMonths\arabic{@secolumn}\endcsname{\fpeval{%
      \sewpcell+\csname %
      @wpPersonMonths\arabic{@secolumn}\endcsname}}% Total PMs per WP
    \IfEq% If...
    {\disptoken{@pShortName\the\value{#1}}}% ...the current PI
    {\disptoken{@wpLeadParticipantShortName%
      \the\value{@secolumn}}}% ...is the WP lead
    {\protected@edef\seformat{\bfseries}}% ...then apply boldface
    {\edef\seformat{}}% ...otherwise don't.
    \protected@edef\serowtemp%
      {\serowtemp&\seformat \sewpcell}% Print PI's PMs for this WP
  }%
  \protected@edef\serowtemp{\serowtemp&\fpeval{round(\serowtotal,0)}}%
  \serowtemp%
  \stepcounter{#1}%
}
\newcommand{\makestaffefforttable}{%
  \newcounter{@setable}
  \stepcounter{@setable}
  \newcounter{@secolumn}
  \xdef\setotalpm{0}
  \edef\serowtemp{}
  \begin{center}
    \renewcommand\theadfont{\normalsize\bfseries}
    \begin{xltabular}{1.0\textwidth}%
      {|>{\columncolor{tablegrey}}l|*{\value{@wpcount}}{r|}%
      >{\columncolor{tablegrey}}r|}
      \hline
      % Table header
      \rowcolor{tablegrey}%
      \whiledo{\value{@secolumn}<\value{@wpcount}}{%
        \stepcounter{@secolumn}%
        \protected@edef\serowtemp%
          {\serowtemp&\protect\thead{WP\the\value{@secolumn}}}%
      }
      \serowtemp & \thead{Total PMs\\ per Participant} \\
      \hline
      % Participant rows
      \whiledo%
        {\value{@setable}<\numexpr\value{@pcount}}%
        {\setablerow{@setable}\\ \hline}%
      \setablerow{@setable} \\ \hline%
      % Total
      \rowcolor{tablegrey}%
      \setcounter{@secolumn}{0}
      \bfseries Total PMs
      \whiledo{\value{@secolumn}<\value{@wpcount}}{%
        \stepcounter{@secolumn}%
        \edef\serowtemp{\serowtemp&\fpeval{round(\csname %
          @wpPersonMonths\arabic{@secolumn}\endcsname/2,0)}}%
        \@bsphack
        \protected@write\@auxout{}%
        {\string\expandafter\string\expandafter\string\expandafter%
        \string\gdef\string\disptoken{@wpTotalPersonMonths%
        \arabic{@secolumn}}{\fpeval{round(\disptoken{@wpPersonMonths%
        \arabic{@secolumn}},0)}}}%
        \@esphack
      }
      \serowtemp & \fpeval{round(\setotalpm/2,0)} \\
      \hline
    \end{xltabular}
  \end{center}
}
\newcommand{\subcontractingcost}[3]{%
  \stepcounter{@pSubcontractingCosts\getPnum{#1}}
  \expandafter\xdef\csname %
    @scCost\getPnum{#1}.\arabic{@pSubcontractingCosts\getPnum{#1}}%
    \endcsname{#2}%
  \expandafter\xdef\csname %
    @scJustification\getPnum{#1}.\arabic{@pSubcontractingCosts\getPnum%
      {#1}}\endcsname{#3}%
}
\newcommand{\makesubcontractingcoststable}{%
  \newcounter{@scparticipant}
  \begin{center}
    % For each participant
    \whiledo{\value{@scparticipant}<\value{@pcount}}{%
      \stepcounter{@scparticipant}%
      \ifthenelse%
        {\value{@pSubcontractingCosts\arabic%
        {@scparticipant}}>0}% If they have subcontracting costs
      {\sctablesection%
        {@scparticipant}}% Print their subcontracting costs table
      {}% Otherwise, do nothing
    }%
  \end{center}
}
\newcommand{\sctablesection}[1]{%
  \newcounter{@sccost\arabic{#1}}
  \edef\scrowtemp{}
  \renewcommand\theadfont{\normalsize\bfseries}
  \begin{xltabular}{\textwidth}{|>{\columncolor{tablegrey}}l|r|X|}
    \hline
    \rowcolor{tablegrey}
    \multicolumn{3}{|l|}{\bfseries\the\value{#1} %
      \disptoken{@pShortName\arabic{#1}}} \\
    \hline
    \rowcolor{tablegrey}
    & \thead{Cost (€)}
    & \thead{Description of tasks and justification} \\
    \hline
    % For each subcontracting cost
    \whiledo%
      {\value{@sccost\arabic{#1}}<\numexpr\value%
      {@pSubcontractingCosts\arabic{#1}}-1}{%
    \stepcounter{@sccost\arabic{#1}}%
    \sctablerow{#1}{@sccost\arabic{#1}}%
    }%
    \stepcounter{@sccost\arabic{#1}}%
    \sctablerow{#1}{@sccost\arabic{#1}}%
  \end{xltabular}
}
\newcommand{\sctablerow}[2]{%
  \thead{Subcontracting} &
  \disptoken{@scCost\arabic{#1}.\arabic{#2}} &
  \disptoken{@scJustification\arabic{#1}.\arabic{#2}}
  \\ \hline
}
\newcommand{\othercost}[3]{%
  \stepcounter{@pOtherCosts\getPnum{#1}}
  \expandafter\xdef\csname %
    @ocCost\getPnum{#1}.\arabic{@pOtherCosts\getPnum{#1}}\endcsname{#2}%
  \expandafter\xdef\csname %
    @ocJustification\getPnum{#1}.\arabic%
    {@pOtherCosts\getPnum{#1}}\endcsname{#3}%
}
\newcommand{\makeothercoststable}{%
  \newcounter{@ocparticipant}
  \begin{center}
    % For each participant
    \whiledo{\value{@ocparticipant}<\value{@pcount}}{%
      \stepcounter{@ocparticipant}%
      \ifthenelse%
        {\value{@pOtherCosts\arabic%
        {@ocparticipant}}>0}% If they have other costs
      {\octablesection{@ocparticipant}}% Print their other costs table
      {}% Otherwise, do nothing
    }%
  \end{center}
}
\newcommand{\octablesection}[1]{%
  \newcounter{@occost\arabic{#1}}
  \edef\ocrowtemp{}
  \renewcommand\theadfont{\normalsize\bfseries}
  \begin{xltabular}{\textwidth}{|>{\columncolor{tablegrey}}l|r|X|}
    \hline
    \rowcolor{tablegrey}
    \multicolumn{3}{|l|}{\bfseries\the\value{#1} %
      \disptoken{@pShortName\arabic{#1}}} \\
    \hline
    \rowcolor{tablegrey}
    & \thead{Cost (€)} & \thead{Justification} \\
    \hline
    % For each other cost
    \whiledo%
      {\value{@occost\arabic{#1}}<\numexpr\value%
      {@pOtherCosts\arabic{#1}}-1}{%
    \stepcounter{@occost\arabic{#1}}%
    \octablerow{#1}{@occost\arabic{#1}}%
    }%
    \stepcounter{@occost\arabic{#1}}%
    \octablerow{#1}{@occost\arabic{#1}}%
  \end{xltabular}
}
\newcommand{\octablerow}[2]{%
  \thead{Internally invoiced\\ goods and services} &
  \disptoken{@ocCost\arabic{#1}.\arabic{#2}} &
  \disptoken{@ocJustification\arabic{#1}.\arabic{#2}}
  \\ \hline
}
\newcommand{\purchasecost}[8]{%
  \stepcounter{@pPurchaseCosts\getPnum{#1}}
  \expandafter\xdef\csname @pcTravelCost\getPnum{#1}\endcsname{#2}%
  \expandafter\xdef\csname %
    @pcTravelJustification\getPnum{#1}\endcsname{#3}%
  \expandafter\xdef\csname @pcEquipmentCost\getPnum{#1}\endcsname{#4}%
  \expandafter\xdef\csname %
    @pcEquipmentJustification\getPnum{#1}\endcsname{#5}%
  \expandafter\xdef\csname @pcOtherCost\getPnum{#1}\endcsname{#6}%
  \expandafter\xdef\csname %
    @pcOtherJustification\getPnum{#1}\endcsname{#7}%
  \expandafter\xdef\csname @pcRemainingCost\getPnum{#1}\endcsname{#8}%
  \expandafter\xdef\csname %
    @pcTotalCost\getPnum{#1}\endcsname%
    {\the\numexpr #2+#4+#6+#8 \relax}% TO DO
  %  \expandafter\xdef\csname @pcTotalCost\getPnum{#1}\endcsname{100}%
}
\newcommand{\makepurchasecoststable}{%
  \newcounter{@pcparticipant}
  \begin{center}
    % For each participant
    \whiledo{\value{@pcparticipant}<\value{@pcount}}{%
      \stepcounter{@pcparticipant}%
      \ifthenelse%
        {\value{@pPurchaseCosts\arabic%
        {@pcparticipant}}>0}% If they have purchase costs
      {\pctablesection%
      {@pcparticipant}}% Print their purchase costs table
      {}% Otherwise, do nothing
    }%
  \end{center}
}
\newcommand\swap[2]{
  \let\pcTemp#1
  \let#1#2
  \let#2\pcTemp
}
\newcommand{\pctablesection}[1]{%
  \newcounter{@pccost\arabic{#1}}
  % Define table rows
  \def\pcRowA{%
     \thead{Travel and subsistence} &
     \disptoken{@pcTravelCost\arabic{#1}} &
     \disptoken{@pcTravelJustification\arabic{#1}}
  }%
  \edef\pcCostA{\disptoken{@pcTravelCost\arabic{#1}}}%
  \def\pcRowB{%
     \thead{Equipment} &
     \disptoken{@pcEquipmentCost\arabic{#1}} &
     \disptoken{@pcEquipmentJustification\arabic{#1}}
  }%
  \edef\pcCostB{\disptoken{@pcEquipmentCost\arabic{#1}}}%
  \def\pcRowC{%
     \thead{Other goods, works\\ and services} &
     \disptoken{@pcOtherCost\arabic{#1}} &
     \disptoken{@pcOtherJustification\arabic{#1}}
  }%
  \edef\pcCostC{\disptoken{@pcOtherCost\arabic{#1}}}%
  % Sort table rows
  \ifthenelse{\pcCostA<\pcCostC}{%
    \swap{\pcRowA}{\pcRowC}
    \swap{\pcCostA}{\pcCostC}
    }{}
  \ifthenelse{\pcCostA<\pcCostB}{%
    \swap{\pcRowA}{\pcRowB}
    \swap{\pcCostA}{\pcCostB}
    }{}
  \ifthenelse{\pcCostB<\pcCostC}{%
    \swap{\pcRowC}{\pcRowB}
    \swap{\pcCostC}{\pcCostB}
    }{}

  \renewcommand\theadfont{\normalsize\bfseries}
  \begin{xltabular}{\textwidth}{|>{\columncolor{tablegrey}}p{43mm}|r|X|}
    \hline
    \rowcolor{tablegrey}
    \multicolumn{3}{|l|}{\bfseries\the\value{#1} %
      \disptoken{@pShortName\arabic{#1}}} \\
    \hline
    \rowcolor{tablegrey}
    & \thead{Cost (€)} & \thead{Justification} \\
    \hline
    % Output purchase costs in sorted order
    \pcRowA \\ \hline
    \pcRowB \\ \hline
    \pcRowC \\ \hline
    % Output remaining and total costs
    \thead{Remaining purchase\\ costs (<15\% of pers.\\ costs)}
      & \disptoken{@pcRemainingCost\arabic{#1}} \\
    \cline{1-2}
    \thead{Total} & \disptoken{@pcTotalCost\arabic{#1}} \\
    \cline{1-2}
  \end{xltabular}
}
\newcommand{\inkindcontribution}[5]{%
  \stepcounter{@pInkindContributions\getPnum{#1}}
  \expandafter\xdef\csname %
    @ikcThirdPartyName\getPnum{#1}.\arabic%
    {@pInkindContributions\getPnum{#1}}\endcsname{#2}%
  \expandafter\xdef\csname %
    @ikcCategory\getPnum{#1}.\arabic%
    {@pInkindContributions\getPnum{#1}}\endcsname{#3}%
  \expandafter\xdef\csname %
    @ikcCost\getPnum{#1}.\arabic%
    {@pInkindContributions\getPnum{#1}}\endcsname{#4}%
  \expandafter\xdef\csname %
    @ikcJustification\getPnum{#1}.\arabic%
    {@pInkindContributions\getPnum{#1}}\endcsname{#5}%
}
\newcommand{\makeinkindcontributionstable}{%
  \newcounter{@ikcparticipant}
  \begin{center}
    % For each participant
    \whiledo{\value{@ikcparticipant}<\value{@pcount}}{%
      \stepcounter{@ikcparticipant}%
      \ifthenelse%
        {\value{@pInkindContributions\arabic%
        {@ikcparticipant}}>0}% If they have in-kind contributions
      {\ikctablesection%
        {@ikcparticipant}}% Print their in-kind contributions table
      {}% Otherwise, do nothing
    }%
  \end{center}
}
\newcommand{\ikctablesection}[1]{%
  \newcounter{@ikccost\arabic{#1}}
  \edef\ikcrowtemp{}
  \renewcommand\theadfont{\normalsize\bfseries}
  \begin{xltabular}{\textwidth}%
    {|>{\raggedright}p{40mm}|>{\raggedright}p{35mm}|r|X|}
    \hline
    \rowcolor{tablegrey}
    \multicolumn{4}{|l|}{\bfseries\the\value{#1} %
      \disptoken{@pShortName\arabic{#1}}} \\
    \hline
    \rowcolor{tablegrey}
    \thead{Third party name} & \thead{Category} &
    \thead{Cost (€)} & \thead{Justification} \\
    \hline
    % For each in-kind contribution
    \whiledo%
      {\value{@ikccost\arabic{#1}}<\numexpr\value%
      {@pInkindContributions\arabic{#1}}-1}{%
    \stepcounter{@ikccost\arabic{#1}}%
    \ikctablerow{#1}{@ikccost\arabic{#1}}%
    }%
    \stepcounter{@ikccost\arabic{#1}}%
    \ikctablerow{#1}{@ikccost\arabic{#1}}%
  \end{xltabular}
}
\newcommand{\ikctablerow}[2]{%
  \disptoken{@ikcThirdPartyName\arabic{#1}.\arabic{#2}} &
  \disptoken{@ikcCategory\arabic{#1}.\arabic{#2}} &
  \disptoken{@ikcCost\arabic{#1}.\arabic{#2}} &
  \disptoken{@ikcJustification\arabic{#1}.\arabic{#2}}
  \\ \hline
}
\RequirePackage{pdflscape} % PDF landscape for Summary canvas
\newenvironment{summarycanvas}{%
  \begin{tcbraster}[%
    raster columns=3,
    ]%
}{%
  \end{tcbraster}%
}
\newenvironment{summarybox}[1]{%
  \begin{tcolorbox}[%
    colframe=summaryblue,
    colbacktitle=summaryblue,
    %height fill,
    fonttitle=\bfseries\sffamily,
    halign title=center,
    title={#1}
    ]
}{%
  \end{tcolorbox}%
}
\RequirePackage{environ}
\newcounter{abspage}% \thepage not reliab
\newcommand{\newSFPage}[1]% #1 = \theabspage
  {\global\expandafter\let\csname SFPage@#1\endcsname\null}
\NewEnviron{SidewaysFigure}{\begin{figure}[p]
\protected@write\@auxout%
  {\let\theabspage=\relax}% delays expansion until shipout
  {\string\newSFPage{\theabspage}}%
\ifdim\textwidth=\textheight
  \rotatebox{90}{\parbox[c][\textwidth][c]{\linewidth}{\BODY}}%
\else
  \rotatebox{90}{\parbox[c][\textwidth][c]{\textheight}{\BODY}}%
\fi
\end{figure}}
\AddToHook{shipout/background}{% check if sideways figure on this page
  \put(1in,-1in){%
    \ifdim\textwidth=\textheight
      \stepcounter{abspage}% already in landscape
    \else
      \@ifundefined{SFPage@\theabspage}{}{\global\pdfpageattr{/Rotate 0}}%
      \stepcounter{abspage}%
      \@ifundefined{SFPage@\theabspage}{}%
        {\global\pdfpageattr{/Rotate 90}}%
    \fi}%
    }
\RequirePackage{newtxtext} % Use Times for main text
\RequirePackage{newtxmath} % Use Times for math
\renewcommand*\ttdefault{lmvtt} % Latin Modern Typewriter Proportional
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\newcommand{\Paragraph}[1]{\vspace*{-.45em}\paragraph{#1.}}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt} % Remove line at top
\lhead{\sffamily\scriptsize Call: \@callidentifier\ --- \@callname}
\rhead{}
\chead{}
\cfoot{\raisebox{\dimexpr(-\height+\ht\strutbox-\dp\strutbox)/2}{%
    \begin{tcolorbox}[nobeforeafter,
                      fontupper=\scriptsize\sffamily,
                      colback=footergrey,
                      boxrule=0.75pt,
                      halign=center,
                      boxsep=0mm,
                     ]%
      \strut Part~B -- Page \thepage\ of \pageref*{LastPage}%
    \end{tcolorbox}%
  }%
}
\def\@maketitle{%
  \newpage%
  \noindent%
  \large%
  \framebox[\textwidth]%
    {\null\hfill\textsf{\textbf{\textsc{\@title}}}\hfill\null}%
  \par
  \vskip 1.5em\thispagestyle{fancy}%
  \ifdefined\@calltopic
  \vspace{-5mm}
  \begin{center}
    Topic: \@calltopic
  \end{center}
  \fi
}
\NewDocumentCommand{\showpagelimit}{m}
{%
   \ifheria@showinstructions%
   {\normalfont\sffamily\itshape [e.g.\ #1]}%
   \fi%
}
\ExplSyntaxOn
\NewDocumentCommand{\hetag}{mm}
 {%
   \textcolor{taggrey}{\normalfont\sffamily\footnotesize%
   \clist_map_inline:nn { #2 } { \# #1 ##1 #1 \# ~}%
   }%
 }
\ExplSyntaxOff
\NewDocumentCommand{\opentag}{m}{\hetag{@}{#1}}
\NewDocumentCommand{\closetag}{m}{\noindent\hetag{§}{#1}}
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\normalfont\normalsize\bfseries\sffamily}%
  {\thesection}{1em}{#1 \sectiontag\sectionpagelimit}
\titleformat{\subsection}
  {\normalfont\normalsize\bfseries\sffamily}%
  {\thesubsection}{1em}{#1 \sectiontag\sectionpagelimit}
\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries\sffamily}%
  {\thesubsubsection}{1em}{#1 \sectiontag\sectionpagelimit}
\NewDocumentCommand{\extendedsection}{sO{#3}mooo}{%
  \IfValueTF{#4}%
    {\renewcommand{\sectiontag}{\opentag{#4}}}%
    {\renewcommand{\sectiontag}{}}%
  \IfValueTF{#6}%
    {\renewcommand{\sectionpagelimit}{\showpagelimit{#6}}}%
    {\renewcommand{\sectionpagelimit}{}}%
  \IfValueT{#5}{%
    \closetag{#5}%
  }%
  \IfBooleanTF{#1}{%
    \latexsection*{#3}%
  }{%
    \latexsection[#2]{#3}%
  }%
}
\NewDocumentCommand{\extendedsubsection}{sO{#3}mooo}{%
  \IfValueTF{#4}%
    {\renewcommand{\sectiontag}{\opentag{#4}}}%
    {\renewcommand{\sectiontag}{}}%
  \IfValueTF{#6}%
    {\renewcommand{\sectionpagelimit}{\showpagelimit{#6}}}%
    {\renewcommand{\sectionpagelimit}{}}%
  \IfValueT{#5}{%
    \closetag{#5}%
  }%
  \IfBooleanTF{#1}{%
    \latexsubsection*{#3}%
  }{%
    \latexsubsection[#2]{#3}%
  }%
}
\NewDocumentCommand{\extendedsubsubsection}{sO{#3}mooo}{%
  \IfValueTF{#4}%
    {\renewcommand{\sectiontag}{\opentag{#4}}}%
    {\renewcommand{\sectiontag}{}}%
  \IfValueTF{#6}%
    {\renewcommand{\sectionpagelimit}{\showpagelimit{#6}}}%
    {\renewcommand{\sectionpagelimit}{}}%
  \IfValueT{#5}{%
    \closetag{#5}%
  }%
  \IfBooleanTF{#1}{%
    \latexsubsubsection*{#3}%
  }{%
    \latexsubsubsection[#2]{#3}%
  }%
}
\newcommand{\sectiontag}{}
\newcommand{\sectionpagelimit}{}
\AtBeginDocument{%
  \NewCommandCopy{\latexsection}{\section}%
  \RenewCommandCopy{\section}{\extendedsection}%
  \NewCommandCopy{\latexsubsection}{\subsection}%
  \RenewCommandCopy{\subsection}{\extendedsubsection}%
  \NewCommandCopy{\latexsubsubsection}{\subsubsection}%
  \RenewCommandCopy{\subsubsection}{\extendedsubsubsection}%
}
\RequirePackage[inline]{enumitem} % For custom bullets
\RequirePackage[normalem]{ulem} % For underlined text
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=heria,
  prefix=heria@
}
\DeclareBoolOption{showinstructions}
\ProcessKeyvalOptions*

\RequirePackage{twemojis}
\RequirePackage{xspace}
\newcommand{\twarn}{\twemoji{warning}\xspace}
\RequirePackage{verbatim}
\newenvironment{instructions}{%
  \begin{tcolorbox}[fontupper=\sffamily,
                    fonttitle=\sffamily\bfseries,
                    colback=blue!5!white,
                    colframe=blue!75!black,
                    parbox=false,
                    breakable
  ]%
  }{%
  \end{tcolorbox}%
  }

\newcommand{\heinstructions}[1]{%
  \ifheria@showinstructions%
  \begin{instructions}%
    \input{hi-#1}%
  \end{instructions}%
  \fi%
}
\endinput
%%
%% End of file `heria.cls'.
