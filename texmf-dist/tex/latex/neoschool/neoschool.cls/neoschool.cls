% neoschool.cls
%
% Copyright (C) 2025-2026 Razik Ikhlef
%
% The newest version of this documentclass should always be available
% from the following web page: https://apps.edulatex.xyz/neoschool/
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neoschool}[2026/05/25 v1.3.9]

%% ==============================================================================
%% Packages required before option processing
%% ==============================================================================

\RequirePackage[table,svgnames,dvipsnames,x11names]{xcolor}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{xstring}
\RequirePackage{pgffor}
\RequirePackage{siunitx}
\RequirePackage{calc}
\RequirePackage{scalefnt}

\SetupKeyvalOptions{family=neoschool, prefix=neoschool@}

%% ==============================================================================
%% Booleans, dimensions, and internal macros
%% ==============================================================================

% Structure booleans
\newif\ifneo@thmnoframe    \neo@thmnoframefalse
\newif\ifneo@thmnoback     \neo@thmnobackfalse
\newif\ifneo@exnoframe     \neo@exnoframefalse
\newif\ifneo@exnoback      \neo@exnobackfalse
\newif\ifneo@codenoframe   \neo@codenoframefalse
\newif\ifneo@codenoback    \neo@codenobackfalse
\newif\ifneo@codenonum     \neo@codenonumfalse
\newif\ifneo@darktheme     \neo@darkthemefalse
\newif\ifneo@print         \neo@printfalse
\newif\ifneo@gray          \neo@grayfalse
\newif\ifneo@unicolor      \neo@unicolorfalse

% Language booleans
\newif\ifneo@english
\newif\ifneo@french
\newif\ifneo@german

% Font booleans
\newif\ifneo@sfbody
\newif\ifneo@sfall
\newif\ifneo@mathastext
\newif\ifneo@scale

% Feature booleans
\newif\ifneo@shuffle
\newif\ifneo@fullheader
\newif\ifneo@firstpagestyleoverride
\neo@firstpagestyleoverridefalse
\newif\ifneo@exerciseicons
\newif\ifmarginnotesactive
\marginnotesactivefalse

% Package booleans
\newif\ifneo@apmep
\newif\ifneo@loadbasearithmetic
\newif\ifneo@mathics
\newif\ifneo@listings
\newif\ifneo@minted

% TOC booleans
\newif\ifneo@compacttoc
\newif\ifneo@monotoc
\newif\ifneo@twocoltoc

% Output mode booleans
\newif\ifneo@twoupafourmode
\newif\ifneo@twoupathreemode
\newif\ifneo@fourupathreemode
\newif\ifneo@simpletwoupmode
\newif\ifneo@bookletafourmode
\newif\ifneo@bookletathreemode

% Default Dimensions and Spacing
\newlength{\neo@thinrule}        \setlength{\neo@thinrule}{0.4pt}
\newlength{\neo@normalrule}      \setlength{\neo@normalrule}{0.8pt}
\newlength{\neo@thickrule}       \setlength{\neo@thickrule}{1.2pt}
\newlength{\neo@verythickrule}   \setlength{\neo@verythickrule}{1.6pt}
\newlength{\neo@decorativerule}  \setlength{\neo@decorativerule}{0.4pt}

\newlength{\neo@thmborder}       \setlength{\neo@thmborder}{\neo@normalrule}
\newlength{\neo@adborder}        \setlength{\neo@adborder}{\neo@normalrule}
\newlength{\neo@exborder}        \setlength{\neo@exborder}{\neo@normalrule}
\newlength{\neo@codeborder}      \setlength{\neo@codeborder}{0.5pt}

\newlength{\neo@basepadding}
\newlength{\neo@hpadding}
\newlength{\neo@vpadding}
\newlength{\neo@ad@hpadding}
\newlength{\neo@ad@vpadding}
\newlength{\neo@code@box@hpadding}
\newlength{\neo@code@box@vpadding}
\newlength{\neo@code@title@hpadding}
\newlength{\neo@code@title@vpadding}
\newlength{\neo@title@hpadding}
\newlength{\neo@title@vpadding}

\newcommand{\neo@beforeafterskip}{\baselineskip}
\newcommand{\neo@box@beforeafterskip}{\baselineskip}
\newcommand{\neo@code@box@beforeafterskip}{\baselineskip}
\newcommand{\neo@ad@beforeafterskip}{\baselineskip}
\newcommand{\neo@ex@beforeafterskip}{\baselineskip}

\newlength{\neo@title@sep@subject}
\newlength{\neo@title@sep@subjectbox}
\newlength{\neo@title@sep@subtitle}

\AtBeginDocument{%
  \setlength{\neo@title@sep@subject}{6pt}
  \setlength{\neo@title@sep@subjectbox}{8pt}
  \setlength{\neo@title@sep@subtitle}{8pt}
}

\newcommand{\neo@recalc@paddings}{%
  \setlength{\neo@hpadding}{\neo@basepadding}%
  \setlength{\neo@vpadding}{\neo@basepadding}%
  \setlength{\neo@ad@hpadding}{\neo@basepadding}%
  \setlength{\neo@ad@vpadding}{\neo@basepadding}%
  \setlength{\neo@code@box@hpadding}{\neo@basepadding}%
  \setlength{\neo@code@box@vpadding}{0.8\neo@basepadding}%
  \setlength{\neo@code@title@hpadding}{0.75\neo@basepadding}%
  \setlength{\neo@code@title@vpadding}{0.3\neo@basepadding}%
  \setlength{\neo@title@hpadding}{\neo@basepadding}%
  \setlength{\neo@title@vpadding}{0.3\neo@basepadding}%
  \ifneo@codenoframe
    \ifneo@codenoback
      \setlength{\neo@code@box@hpadding}{0pt}%
      \setlength{\neo@code@box@vpadding}{0.2\neo@basepadding}%
    \fi
  \fi
}

% Effective dimensions (computed after vspacing factor)
\newdimen\neo@effective@beforeafterskip
\newdimen\neo@effective@baseskip
\newdimen\neo@effective@code@beforeafterskip
\newdimen\neo@effective@ad@beforeafterskip
\newdimen\neo@effective@ex@beforeafterskip

% Internal Macros
\newcommand{\neo@framehidden}{}
\newcommand{\neo@thm@box@mainback}{white}
\newcommand{\neo@box@lowerback}{white}
\newcommand{\neo@box@uppertext}{black}

\def\neo@default@globalcolor{black}
\def\neo@lang{english}

%% ==============================================================================
%% Colors Configuration (5-Color System)
%% ==============================================================================

\DeclareStringOption[black]{globalcolor}

\definecolor{primaryColor}{HTML}{000000}
\definecolor{tertiaryColor}{HTML}{000000}
\definecolor{secondaryColor}{HTML}{000000}
\definecolor{structuralColor}{HTML}{000000}
\definecolor{backgroundColor}{HTML}{FFFFFF}

%% ==============================================================================
%% Structure Options (Frames and Backgrounds)
%% ==============================================================================

% Theorem boxes
\DeclareOption{thmnoback}{\neo@thmnobacktrue}
\DeclareOption{thmback}{\neo@thmnobackfalse}
\DeclareOption{thmnoframe}{\neo@thmnoframetrue}
\DeclareOption{thmframe}{\neo@thmnoframefalse}

% Code boxes
\DeclareOption{codenoback}{\neo@codenobacktrue}
\DeclareOption{codeback}{\neo@codenobackfalse}
\DeclareOption{codenoframe}{\neo@codenoframetrue}
\DeclareOption{codeframe}{\neo@codenoframefalse}
\DeclareOption{codenonum}{\neo@codenonumtrue}
\DeclareOption{codenum}{\neo@codenonumfalse}

% Exercise boxes
\DeclareOption{exnoback}{\neo@exnobacktrue}
\DeclareOption{exback}{\neo@exnobackfalse}
\DeclareOption{exnoframe}{\neo@exnoframetrue}
\DeclareOption{exframe}{\neo@exnoframefalse}

% All boxes
\DeclareOption{noback}{%
  \neo@thmnobacktrue
  \neo@exnobacktrue
  \neo@codenobacktrue
}

\DeclareOption{noframe}{%
  \neo@thmnoframetrue
  \neo@exnoframetrue
  \neo@codenoframetrue
}

\DeclareOption{back}{%
  \neo@thmnobackfalse
  \neo@exnobackfalse
  \neo@codenobackfalse
}

\DeclareOption{frame}{%
  \neo@thmnoframefalse
  \neo@exnoframefalse
  \neo@codenoframefalse
}

\DeclareOption{clean}{%
  \neo@thmnobacktrue
  \neo@exnobacktrue
  \neo@codenobacktrue
  \neo@thmnoframetrue
  \neo@codenoframetrue
  \neo@exnoframetrue
}

\DeclareOption{styled}{%
  \neo@thmnobackfalse
  \neo@exnobackfalse
  \neo@codenobackfalse
  \neo@thmnoframefalse
  \neo@exnoframefalse
  \neo@codenoframefalse
}

% Profile
\DeclareStringOption{profile}
\DeclareBoolOption{print}

% Box opacity
\DeclareStringOption{boxopacity}

\DeclareStringOption{codeboxopacity}
\DeclareStringOption{exboxopacity}
\DeclareStringOption{thmboxopacity}
\DeclareStringOption{adboxopacity}

\DeclareStringOption[15]{mathboxopacity}

% Frame opacity
\DeclareStringOption{frameopacity}
\DeclareStringOption{thmframeopacity}
\DeclareStringOption{exframeopacity}
\DeclareStringOption{codeframeopacity}
\DeclareStringOption{adframeopacity}
\DeclareStringOption{neoframeopacity}
\DeclareStringOption{sideframeopacity}

% Box rules width
\DeclareStringOption{border}
\DeclareStringOption{exborder}
\DeclareStringOption{thmborder}
\DeclareStringOption{codeborder}
\DeclareStringOption{adborder}

% Theorem and exercise separator
\DeclareStringOption[.\!]{thmterminator}
\DeclareStringOption{thmseparator}
\DeclareStringOption[.]{adterminator}
\DeclareStringOption[~:~]{adseparator}
\DeclareStringOption[.]{exterminator}
\DeclareStringOption{exseparator}
\DeclareStringOption[~~$\cdot$]{codeseparator}

% Dark Theme
\DeclareOption{darktheme}{\neo@darkthemetrue}

%% ==============================================================================
%% Theme, style, colors
%% ==============================================================================

\DeclareStringOption{theme}

\DeclareOption{unicolor}{\neo@unicolortrue}

\DeclareStringOption{thmstyle}
\DeclareStringOption{exstyle}
\DeclareStringOption{solstyle}
\DeclareBoolOption{solrotate}
\DeclareStringOption{codestyle}
\DeclareStringOption{adstyle}

%% ==============================================================================
%% Color options (Legacy Head/Sub params)
%% ==============================================================================

\DeclareStringOption[sectionColor]{headcolor}
\DeclareStringOption[subsectionColor]{subcolor}
\DeclareStringOption[subsubsectionColor]{subsubcolor}
\DeclareStringOption[titleColor]{titlecolor}
\DeclareStringOption{titlehexcolor}
\DeclareStringOption[structuralColor]{headfootcolor}

%% ==============================================================================
%% Typography options
%% ==============================================================================

% Title formatting
\DeclareStringOption[LargeLARGEminus]{titlesize}
\DeclareStringOption{titlelayout}
\DeclareStringOption[none]{titledecor}
\DeclareStringOption[center]{titlealign}

% Heading styles
\DeclareStringOption[sffamily]{headstyle}
\DeclareStringOption[bfseries]{headweight}
\DeclareStringOption[upshape]{headshape}

% Title-specific styles
\DeclareStringOption[\neoschool@headstyle]{titlestyle}
\DeclareStringOption[\neoschool@headweight]{titleweight}
\DeclareStringOption[upshape]{titleshape}

% Header and Footer styles
\DeclareStringOption[\neoschool@headstyle]{headfootstyle}
\DeclareStringOption[none]{headerules}

% Section styles
\DeclareStringOption[circle]{sectionnumstyle}
\DeclareStringOption[sc]{sectiontextstyle}
\DeclareStringOption[normal]{sectionstyle}
\DeclareStringOption[center]{sectionalign}

% Box Padding
\DeclareStringOption[normal]{padding}

%% ==============================================================================
%% Font options
%% ==============================================================================

\DeclareStringOption{mainface}
\DeclareStringOption{mainfaceoptions}
\DeclareStringOption{sansface}
\DeclareStringOption{sansfaceoptions}
\DeclareStringOption{monoface}
\DeclareStringOption{monofaceoptions}
\DeclareStringOption{mathface}
\DeclareStringOption{mathfaceoptions}
\DeclareStringOption[1.0]{mainfacescale}
\DeclareStringOption[1.0]{sansfacescale}
\DeclareStringOption[1.0]{monofacescale}
\DeclareStringOption[1.0]{mathfacescale}
\DeclareStringOption{facefamily}
\DeclareStringOption{facefamilyoptions}

\DeclareOption{sfbody}{\neo@sfbodytrue}
\DeclareOption{sfall}{\neo@sfalltrue\neo@sfbodytrue}
\DeclareOption{mathastext}{\neo@mathastexttrue}
\DeclareBoolOption{scale}

%% ==============================================================================
%% Language options
%% ==============================================================================

% Language setup command
\newcommand{\neo@setupLanguage}[1]{%
  \neo@englishfalse
  \neo@frenchfalse
  \neo@germanfalse
  \@nameuse{neo@#1true}
  \renewcommand{\neo@lang}{#1}
}

% Name definition commands
\newcommand{\neo@definenames@one}[9]{%
  \expandafter\def\csname neo@theoremname\endcsname{#1}
  \expandafter\def\csname neo@propositionname\endcsname{#2}
  \expandafter\def\csname neo@propertyname\endcsname{#3}
  \expandafter\def\csname neo@lemmaname\endcsname{#4}
  \expandafter\def\csname neo@corollaryname\endcsname{#5}
  \expandafter\def\csname neo@definitionname\endcsname{#6}
  \expandafter\def\csname neo@examplename\endcsname{#7}
  \expandafter\def\csname neo@exercisename\endcsname{#8}
  \expandafter\def\csname neo@remarkname\endcsname{#9}
}

\newcommand{\neo@definenames@two}[9]{%
  \expandafter\def\csname neo@problemname\endcsname{#1}
  \expandafter\def\csname neo@conjecturename\endcsname{#2}
  \expandafter\def\csname neo@activityname\endcsname{#3}
  \expandafter\def\csname neo@methodname\endcsname{#4}
  \expandafter\def\csname neo@applicationname\endcsname{#5}
  \expandafter\def\csname neo@competencies\endcsname{#6}
  \expandafter\def\csname neo@codename\endcsname{#7}
  \expandafter\def\csname neo@algorithmname\endcsname{#8}
  \expandafter\def\csname neo@pagename\endcsname{#9}
}

\newcommand{\neo@definenames@three}[3]{%
  \expandafter\def\csname neo@solutionname\endcsname{#1}
  \expandafter\def\csname neo@propertiesname\endcsname{#2}
  \expandafter\def\csname neo@definitionsname\endcsname{#3}
}

\newcommand{\neo@definenames@four}[2]{%
  \expandafter\def\csname neo@examplesname\endcsname{#1}
  \expandafter\def\csname neo@remarksname\endcsname{#2}
}

\newcommand{\neo@definepath}[1]{%
  \expandafter\def\csname neo@pathname\endcsname{#1}
}

\newcommand{\neo@defineextra}[2]{%
  \expandafter\def\csname neo@examplesname\endcsname{#1}
  \expandafter\def\csname neo@solutiongaptext\endcsname{#2}
}

\newcommand{\neo@defineproofnames}[1]{%
  \expandafter\def\csname neo@proofname\endcsname{#1}
}

\newcommand{\neo@definenames@ai}[2]{%
  \expandafter\def\csname neo@ainame\endcsname{#1}
  \expandafter\def\csname neo@noainame\endcsname{#2}
}

\newcommand{\neo@definenames@calculator}[5]{%
  \expandafter\def\csname neo@calcintro\endcsname{#1}
  \expandafter\def\csname neo@calcallowed\endcsname{#2}
  \expandafter\def\csname neo@calcnotallowed\endcsname{#3}
  \expandafter\def\csname neo@calcexammode\endcsname{#4}
  \expandafter\def\csname neo@calcexammodeonly\endcsname{#5}
}

\newcommand{\neo@definenames@mockexam}[5]{%
  \expandafter\def\csname neo@academytxt\endcsname{#1}
  \expandafter\def\csname neo@examoftxt\endcsname{#2}
  \expandafter\def\csname neo@sessiontxt\endcsname{#3}
  \expandafter\def\csname neo@durationtxt\endcsname{#4}
  \expandafter\def\csname neo@nametxt\endcsname{#5}
}

\newcommand{\neo@definenames@mockexam@two}[5]{%
  \expandafter\def\csname neo@pagestxt\endcsname{#1}
  \expandafter\def\csname neo@pagesfromtxt\endcsname{#2}
  \expandafter\def\csname neo@pagestotxt\endcsname{#3}
  \expandafter\def\csname neo@examqualitytxt\endcsname{#4}
  \expandafter\def\csname neo@examattempttxt\endcsname{#5}
}

\newcommand{\neo@defineadmonitionnames}[8]{%
  \def\neo@admonition@note{#1}%
  \def\neo@admonition@info{#2}%
  \def\neo@admonition@warning{#3}%
  \def\neo@admonition@important{#4}%
  \def\neo@admonition@tip{#5}%
  \def\neo@admonition@reminder{#6}%
  \def\neo@admonition@summary{#7}%
  \def\neo@admonition@toolbox{#8}%
}

% English
\DeclareOption{english}{%
  \neo@setupLanguage{english}
  \AtEndOfClass{\sisetup{locale = US,detect-all}}
  \neo@definenames@one{Theorem}{Proposition}{Property}{Lemma}{Corollary}{Definition}{Example}{Exercise}{Remark}
  \neo@definenames@two{Problem}{Conjecture}{Activity}{Method}{Application}{Competencies}{Listing}{Algorithm}{Page}
  \neo@definenames@three{Solution }{Properties}{Definitions}
  \neo@definenames@four{Examples}{Remarks}
  \neo@defineextra{Examples}{of exercise }
  \neo@definepath{Path}
  \neo@defineproofnames{Proof}
  \neo@definenames@ai{AI}{No AI}
  \neo@definenames@calculator{Calculator use}{is allowed}{is not allowed}{exam mode}{only in}
  \neo@definenames@mockexam{Academy of}{EXAM IN}{Session}{Duration:}{Name:}
  \neo@definenames@mockexam@two{This document has}{pages numbered from}{to}{The quality of writing and rigor of reasoning will be taken into account.}{Any attempt, even partial, will be valued.}
  \neo@defineadmonitionnames{Note}{Information}{Warning}{Important}{Tip}{Remember}{Summary}{Toolbox}
}

% French
\DeclareOption{french}{%
  \neo@setupLanguage{french}
  \AtEndOfClass{%
    \sisetup{locale = FR,detect-all}%
    \renewcommand*{\today}{\number\day\space\ifcase\month\or
        janvier\or février\or mars\or avril\or mai\or juin\or
        juillet\or août\or septembre\or octobre\or novembre\or
        décembre\fi\space\number\year}%
  }
  \neo@definenames@one{Théorème}{Proposition}{Propriété}{Lemme}{Corollaire}{Définition}{Exemple}{Exercice}{Remarque}
  \neo@definenames@two{Problème}{Conjecture}{Activité}{Méthode}{Application}{Compétences}{Programme}{Algorithme}{Page}
  \neo@definenames@three{Corrigé }{Propriétés}{Définitions}
  \neo@definenames@four{Exemples}{Remarques}
  \neo@defineextra{Exemples}{de l'exercice }
  \neo@definepath{Parcours}
  \neo@defineproofnames{Démonstration}
  \neo@definenames@ai{IA}{Sans IA}
  \neo@definenames@calculator{L'usage de la calculatrice}{est autorisé}{n'est pas autorisé}{mode examen}{uniquement en}
  \neo@definenames@mockexam{Académie de}{ÉPREUVE DE}{Session}{Durée~:}{Nom~:}
  \neo@definenames@mockexam@two{Ce document comporte}{pages numérotées de}{à}{La qualité de la rédaction et la rigueur des raisonnements seront prises en compte dans l'évaluation des copies.}{Toute tentative, même partielle ou inachevée, sera valorisée.}
  \neo@defineadmonitionnames{Note}{Information}{Attention}{Important}{Conseil}{À retenir}{Résumé}{Boîte à outils}
}

% German
\DeclareOption{german}{%
  \neo@setupLanguage{german}
  \AtEndOfClass{\sisetup{locale = DE,detect-all}}
  \neo@definenames@one{Theorem}{Proposition}{Eigenschaft}{Lemma}{Korollar}{Definition}{Beispiel}{Übung}{Bemerkung}
  \neo@definenames@two{Problem}{Vermutung}{Aktivität}{Methode}{Anwendung}{Fähigkeiten}{Auflistung}{Algorithmus}{Seite}
  \neo@definenames@three{Lösung }{Eigenschaften}{Definitionen}
  \neo@definenames@four{Übungen}{Bemerkungen}
  \neo@defineextra{Beispiele}{von Übung }
  \neo@definepath{Stufe}
  \neo@defineproofnames{Beweis}
  \neo@definenames@ai{AI}{Keine KI}
  \neo@definenames@calculator{Rechnernutzung}{ist erlaubt}{ist nicht erlaubt}{Prüfungsmodus}{nur im}
  \neo@definenames@mockexam{Akademie von}{PRÜFUNG IN}{Sitzung}{Dauer:}{Name:}
  \neo@definenames@mockexam@two{Dieses Dokument enthält}{Seiten, nummeriert von}{bis}{Die Qualität des Schreibens und die Strenge der Argumentation werden bei der Bewertung berücksichtigt.}{Jeder Versuch, auch nur teilweise, wird gewertet.}
  \neo@defineadmonitionnames{Notiz}{Information}{Achtung}{Wichtig}{Tipp}{Merken}{Zusammenfassung}{Werkzeugkasten}
}

\DeclareOption{nofrenchlist}{\AtEndOfClass{\frenchsetup{StandardItemLabels=true}}}
\DeclareOption{frenchlistaspar}{\AtEndOfClass{\frenchsetup{ListItemsAsPar=true}}}

%% ==============================================================================
%% Layout options
%% ==============================================================================

\DeclareStringOption[1em]{indent}
\DeclareBoolOption{noindent}
\DeclareStringOption[half]{parskip}
\DeclareBoolOption[true]{listparskip}
\DeclareComplementaryOption{nolistparskip}{listparskip}

\DeclareStringOption[1.5cm]{margin}
\DeclareStringOption{noteswidth}
\DeclareStringOption{notesposition}

\DeclareStringOption{notes}
\DeclareStringOption{leftnotes}
\DeclareStringOption{rightnotes}

%% ==============================================================================
%% Header/Footer options
%% ==============================================================================

\DeclareOption{fullheader}{\neo@fullheadertrue}
\DeclareOption{nofooter}{\def\neo@pagestyle{empty}\neo@firstpagestyleoverridetrue}
\DeclareOption{pageonlyfooter}{\def\neo@pagestyle{pagenum}\neo@firstpagestyleoverridetrue}

%% ==============================================================================
%% Box options
%% ==============================================================================

\DeclareStringOption{boxtitle}

\DeclareStringOption{boxarc}
\DeclareStringOption{neoboxarc}
\DeclareStringOption{codeboxarc}
\DeclareStringOption{sideboxarc}
\DeclareStringOption{thmboxarc}
\DeclareStringOption{thmtitlearc}
\DeclareStringOption{sectionarc}
\DeclareStringOption{adboxarc}
\DeclareStringOption{exboxarc}
\DeclareStringOption{pseudoboxarc}

\DeclareStringOption{boxshape}
\DeclareStringOption{thmboxshape}
\DeclareStringOption{thmtitleshape}
\DeclareStringOption{exboxshape}
\DeclareStringOption{codeboxshape}
\DeclareStringOption{adboxshape}
\DeclareStringOption{neoboxshape}
\DeclareStringOption{sideboxshape}

\DeclareBoolOption{inlinecodebox}

%% ==============================================================================
%% Theorem/Counter options
%% ==============================================================================

\DeclareBoolOption{sectionthmcounter}
\DeclareBoolOption{sharedthmcounter}
\DeclareBoolOption{thmgroupcounter}

\newif\ifneoschool@sharedexcounter
\DeclareOption{sharedexcounter}{%
  \neoschool@sharedexcountertrue
  \neoschool@sharedthmcountertrue
}

%% ==============================================================================
%% Exercise options
%% ==============================================================================

\DeclareOption{exerciseicons}{\neo@exerciseiconstrue}
\DeclareOption{shuffle}{\neo@shuffletrue}

\DeclareBoolOption{answers}
\DeclareBoolOption{answersonly}

\DeclareStringOption[20]{totalpoints}

%% ==============================================================================
%% Package-Specific options
%% ==============================================================================

\DeclareBoolOption[true]{math}
\DeclareOption{nomath}{\neoschool@mathfalse}
\newif\ifneoschool@frenchmath
\newif\ifneo@nofrenchmath
\DeclareOption{nofrenchmath}{\neo@nofrenchmathtrue}
\DeclareOption{apmep}{\neo@apmeptrue}
\DeclareOption{mathics}{\neo@mathicstrue}
\DeclareOption{listings}{\neo@listingstrue}
\DeclareOption{minted}{\neo@mintedtrue}

\DeclareStringOption[1]{codewidth}
\DeclareBoolOption{centeredcode}

\DeclareBoolOption{faketext}

%% ==============================================================================
%% Vertical spacing options
%% ==============================================================================

\DeclareStringOption[1.0]{vspacing}

%% ==============================================================================
%% TOC options
%% ==============================================================================

\DeclareOption{monotoc}{\neo@monotoctrue}
\DeclareOption{twocoltoc}{\neo@twocoltoctrue}
\DeclareOption{compacttoc}{\neo@compacttoctrue}

%% ==============================================================================
%% Admonition options
%% ==============================================================================

\DeclareBoolOption[true]{inlineadmonition}
\DeclareVoidOption{blockadmonition}{\neoschool@inlineadmonitionfalse}

%% ==============================================================================
%% Output mode options
%% ==============================================================================

\DeclareOption{2a5toa4}{\neo@twoupafourmodetrue}
\DeclareOption{2a4toa3}{\neo@twoupathreemodetrue}
\DeclareOption{4a5toa3}{\neo@fourupathreemodetrue}
\DeclareOption{2toa3}{\neo@simpletwoupmodetrue}
\DeclareOption{bookleta5}{\neo@bookletafourmodetrue}
\DeclareOption{bookleta4}{\neo@bookletathreemodetrue}

%% ==============================================================================
%% Miscellaneous options
%% ==============================================================================

\DeclareBoolOption{inlineabstract}
\DeclareStringOption[DEFAULT]{abstracttitle}
\DeclareBoolOption{boldlistlabels}

%% ==============================================================================
%% Unknown options handler
%% ==============================================================================

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}

%% ==============================================================================
%% Option processing
%% ==============================================================================

% Process keyval options first
\ProcessKeyvalOptions*\relax

% Default language
\ExecuteOptions{english}

% Process remaining options
\ProcessOptions\relax

\ifneo@french
  \ifneo@nofrenchmath\else
    \neoschool@frenchmathtrue
  \fi
\fi

\ExplSyntaxOn

\cs_new:Npn \neo_set_if_empty:Nn #1#2 {
  \tl_if_empty:NTF #1 { \tl_set:Nn #1 {#2} } { }
}

\tl_if_empty:NF \neoschool@profile {
  \str_case:VnF \neoschool@profile
  {
    {academic}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {royal}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {band}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {block}
      \neo_set_if_empty:Nn \neoschool@exstyle          {bar}
      \neo_set_if_empty:Nn \neoschool@adstyle          {modern}
      \neo_set_if_empty:Nn \neoschool@codestyle        {plain}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {8}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@codeboxopacity   {5}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {10}
      \neo_set_if_empty:Nn \neoschool@boxshape         {soft}
      \neo@thmnoframetrue
      \neo@exnoframetrue
      \neo@codenoframetrue
    }
    {minimalist}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {ink}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {stream}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {plain}
      \neo_set_if_empty:Nn \neoschool@exstyle          {line-outline}
      \neo_set_if_empty:Nn \neoschool@adstyle          {classic}
      \neo_set_if_empty:Nn \neoschool@codestyle        {lines}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {0}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@codeboxopacity   {8}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@boxshape         {sharp}
      \neo@thmnoframefalse
      \neo@exnoframetrue
      \neo@codenoframefalse
    }
    {material}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {azure}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {notion}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {tile}
      \neo_set_if_empty:Nn \neoschool@exstyle          {capsule}
      \neo_set_if_empty:Nn \neoschool@adstyle          {material}
      \neo_set_if_empty:Nn \neoschool@codestyle        {shadow}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {12}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {8}
      \neo_set_if_empty:Nn \neoschool@codeboxopacity   {8}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {15}
      \neo_set_if_empty:Nn \neoschool@boxshape         {rounded}
      \neo@thmnoframetrue
      \neo@exnoframetrue
      \neo@codenoframetrue
    }
    {coder}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {marine}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {blocks}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {bar}
      \neo_set_if_empty:Nn \neoschool@exstyle          {shell}
      \neo_set_if_empty:Nn \neoschool@adstyle          {professional}
      \neo_set_if_empty:Nn \neoschool@codestyle        {frame}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {10}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {10}
      \neo_set_if_empty:Nn \neoschool@codeboxopacity   {15}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {10}
      \neo_set_if_empty:Nn \neoschool@boxshape         {chamfer}
      \neo@thmnoframetrue
      \neo@exnoframetrue
      \neo@codenoframefalse
    }
    {memo}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {lagoon}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {bristol}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {sticker}
      \neo_set_if_empty:Nn \neoschool@exstyle          {badge}
      \neo_set_if_empty:Nn \neoschool@adstyle          {soft}
      \neo_set_if_empty:Nn \neoschool@codestyle        {plain}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {10}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {10}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {10}
      \neo_set_if_empty:Nn \neoschool@boxshape         {chat}
      \neo@thmnoframefalse
      \neo@exnoframefalse
      \neo@codenoframefalse
    }
    {exam}
    {
      \neo_set_if_empty:Nn \neoschool@titlelayout      {eval}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {plain}
      \neo_set_if_empty:Nn \neoschool@exstyle          {inline}
      \neo_set_if_empty:Nn \neoschool@adstyle          {classic}
      \neo_set_if_empty:Nn \neoschool@codestyle        {plain}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {0}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@codeboxopacity   {8}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@boxshape         {sharp}
      \neo@thmnoframetrue
      \neo@exnoframetrue
      \neo@codenoframetrue
      \neo@thmnobacktrue
      \neo@exnobacktrue
      \neo@codenobacktrue
      \neo@printtrue
    }
    {organic}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {forest}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {flow}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {curve}
      \neo_set_if_empty:Nn \neoschool@exstyle          {capsule}
      \neo_set_if_empty:Nn \neoschool@adstyle          {soft}
      \neo_set_if_empty:Nn \neoschool@codestyle        {plain}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {8}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {8}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {10}
      \neo_set_if_empty:Nn \neoschool@boxshape         {leaf}
      \neo@thmnoframetrue
      \neo@exnoframetrue
      \neo@codenoframetrue
    }
    {origami}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {crimson}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {geometric}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {fold}
      \neo_set_if_empty:Nn \neoschool@exstyle          {rule}
      \neo_set_if_empty:Nn \neoschool@adstyle          {classic}
      \neo_set_if_empty:Nn \neoschool@codestyle        {lines}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {10}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {5}
      \neo_set_if_empty:Nn \neoschool@boxshape         {bevel}
      \neo@thmnoframefalse
      \neo@exnoframetrue
      \neo@codenoframefalse
    }
    {blueprint}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {frost}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {grid}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {frame}
      \neo_set_if_empty:Nn \neoschool@exstyle          {counter-inline}
      \neo_set_if_empty:Nn \neoschool@adstyle          {classic}
      \neo_set_if_empty:Nn \neoschool@codestyle        {lines}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {5}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {5}
      \neo_set_if_empty:Nn \neoschool@boxshape         {sharp}
      \neo@thmnoframefalse
      \neo@exnoframefalse
      \neo@codenoframefalse
    }
    {swiss}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {crimson}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {brush}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {bar}
      \neo_set_if_empty:Nn \neoschool@exstyle          {capsule-outline}
      \neo_set_if_empty:Nn \neoschool@adstyle          {modern}
      \neo_set_if_empty:Nn \neoschool@codestyle        {lines}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {0}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@codeboxopacity   {0}
      \neo_set_if_empty:Nn \neoschool@boxshape         {southeast}
      \neo@thmnoframetrue
      \neo@exnoframetrue
      \neo@codenoframetrue
      \neo@thmnobacktrue
    }
    {creative}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {neon}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {memphis}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {pastel}
      \neo_set_if_empty:Nn \neoschool@exstyle          {badge}
      \neo_set_if_empty:Nn \neoschool@adstyle          {material}
      \neo_set_if_empty:Nn \neoschool@codestyle        {shadow}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {15}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {10}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {15}
      \neo_set_if_empty:Nn \neoschool@boxshape         {sharpish}
      \neo@thmnoframefalse
      \neo@exnoframetrue
      \neo@codenoframetrue
    }
    {focus}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {rhodium}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {spine}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {tag}
      \neo_set_if_empty:Nn \neoschool@exstyle          {capsule}
      \neo_set_if_empty:Nn \neoschool@adstyle          {classic}
      \neo_set_if_empty:Nn \neoschool@codestyle        {frame}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {10}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@boxshape         {west}
      \neo@thmnoframetrue
      \neo@exnoframetrue
    }
    {elegant}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {velours}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {minimal}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {bar}
      \neo_set_if_empty:Nn \neoschool@exstyle          {line-circle}
      \neo_set_if_empty:Nn \neoschool@adstyle          {classic}
      \neo_set_if_empty:Nn \neoschool@codestyle        {line}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {0}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@codeboxopacity   {8}
      \neo_set_if_empty:Nn \neoschool@boxshape         {sharp}
      \tl_set:Nn \neoschool@sectionstyle               {shadedline}
      \tl_set:Nn \neoschool@sectionalign               {left}
      \neo@thmnoframetrue
      \neo@exnoframetrue
      \neo@codenoframetrue
      \neo@thmnobacktrue
    }
    {slate}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {slate}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {band}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {tile}
      \neo_set_if_empty:Nn \neoschool@exstyle          {bar}
      \neo_set_if_empty:Nn \neoschool@adstyle          {professional}
      \neo_set_if_empty:Nn \neoschool@codestyle        {lines}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {5}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {5}
      \neo_set_if_empty:Nn \neoschool@boxshape         {sharp}
      \neo@thmnoframetrue
      \neo@exnoframetrue
      \neo@codenoframetrue
    }
    {maker}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {terra}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {tech}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {sticker}
      \neo_set_if_empty:Nn \neoschool@exstyle          {rule}
      \neo_set_if_empty:Nn \neoschool@adstyle          {classic}
      \neo_set_if_empty:Nn \neoschool@codestyle        {lines}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {0}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@codeboxopacity   {5}
      \neo_set_if_empty:Nn \neoschool@boxshape         {sharp}
      \neo@thmnoframefalse
      \neo@exnoframefalse
      \neo@codenoframefalse
    }
    {zen}
    {
      \neo_set_if_empty:Nn \neoschool@theme            {moss}
      \neo_set_if_empty:Nn \neoschool@titlelayout      {wave}
      \neo_set_if_empty:Nn \neoschool@thmstyle         {block}
      \neo_set_if_empty:Nn \neoschool@exstyle          {line-outline}
      \neo_set_if_empty:Nn \neoschool@adstyle          {soft}
      \neo_set_if_empty:Nn \neoschool@codestyle        {shadow}
      \neo_set_if_empty:Nn \neoschool@thmboxopacity    {0}
      \neo_set_if_empty:Nn \neoschool@exboxopacity     {0}
      \neo_set_if_empty:Nn \neoschool@codeboxopacity   {3}
      \neo_set_if_empty:Nn \neoschool@adboxopacity     {8}
      \neo_set_if_empty:Nn \neoschool@frameopacity     {30}
      \neo_set_if_empty:Nn \neoschool@codeframeopacity {20}
      \neo_set_if_empty:Nn \neoschool@sideframeopacity {20}
      \neo_set_if_empty:Nn \neoschool@boxshape         {sharpish}
      \neo_set_if_empty:Nn \neoschool@adborder         {0pt}
      \neo@thmnoframefalse
      \neo@exnoframefalse
      \neo@codenoframefalse
      \neo@unicolortrue
    }
  }
  {
    \ClassWarning{neoschool}{Unknown profile '\neoschool@profile'. Using default values.}
  }
}

\neo_set_if_empty:Nn \neoschool@theme            {axiom}
\neo_set_if_empty:Nn \neoschool@titlelayout      {default}

\neo_set_if_empty:Nn \neoschool@thmstyle         {tag}
\neo_set_if_empty:Nn \neoschool@exstyle          {capsule}
\neo_set_if_empty:Nn \neoschool@codestyle        {shadow}
\neo_set_if_empty:Nn \neoschool@adstyle          {soft}
\neo_set_if_empty:Nn \neoschool@solstyle         {inline}

\neo_set_if_empty:Nn \neoschool@boxshape         {rounded}

\ExplSyntaxOff

%% ==============================================================================
%% Post-Processing validation
%% ==============================================================================

\ifneoschool@print
  \neo@printtrue
\fi

% Vertical space compression factor validation
\edef\neo@vspace@factor{\neoschool@vspacing}

\ifdim\neo@vspace@factor pt<0.25pt
  \ClassWarning{neoschool}{vspacing value too small, setting to 0.25}
  \def\neo@vspace@factor{0.25}
\fi
\ifdim\neo@vspace@factor pt>2.0pt
  \ClassWarning{neoschool}{vspacing value too large, setting to 2.0}
  \def\neo@vspace@factor{2.0}
\fi

% Default to listings if neither minted nor listings specified
\ifneo@minted\else
  \ifneo@listings\else
    \neo@listingstrue
  \fi
\fi

% exstyle defaults to thmstyle if not set
\ifx\neoschool@exstyle\@empty
  \let\neoschool@exstyle\neoschool@thmstyle
\fi

%% ==============================================================================
%% Margin Notes
%% ==============================================================================

\ifdefempty{\neoschool@notes}{}{%
  \def\neoschool@noteswidth{\neoschool@notes}%
  \def\neoschool@notesposition{alternate}%
}

\ifdefempty{\neoschool@leftnotes}{}{%
  \def\neoschool@noteswidth{\neoschool@leftnotes}%
  \def\neoschool@notesposition{left}%
}

\ifdefempty{\neoschool@rightnotes}{}{%
  \def\neoschool@noteswidth{\neoschool@rightnotes}%
  \def\neoschool@notesposition{right}%
}

%% ==============================================================================
%% Box Rules
%% ==============================================================================

\ifx\neoschool@border\@empty \else
  \ifx\neoschool@thmborder\@empty \let\neoschool@thmborder\neoschool@border \fi
  \ifx\neoschool@exborder\@empty  \let\neoschool@exborder\neoschool@border  \fi
  \ifx\neoschool@codeborder\@empty\let\neoschool@codeborder\neoschool@border\fi
  \ifx\neoschool@adborder\@empty  \let\neoschool@adborder\neoschool@border  \fi
\fi

\ifx\neoschool@thmborder\@empty \def\neoschool@thmborder{0.8pt} \fi
\ifx\neoschool@exborder\@empty  \def\neoschool@exborder{0.8pt}  \fi
\ifx\neoschool@codeborder\@empty\def\neoschool@codeborder{0.5pt} \fi
\ifx\neoschool@adborder\@empty  \def\neoschool@adborder{0.8pt}  \fi

\setlength{\neo@thmborder}{\neoschool@thmborder}
\setlength{\neo@exborder}{\neoschool@exborder}
\setlength{\neo@codeborder}{\neoschool@codeborder}
\setlength{\neo@adborder}{\neoschool@adborder}

%% ==============================================================================
%% Box Padding
%% ==============================================================================

\newcommand{\neo@configure@padding}{%
  \IfStrEqCase{\neoschool@padding}{%
    {tight}{%
      \setlength{\neo@basepadding}{1ex}%
    }%
    {loose}{%
      \setlength{\neo@basepadding}{2ex}%
    }%
    {normal}{%
      \setlength{\neo@basepadding}{1.5ex}%
    }%
  }[\PackageWarning{neoschool}{Unknown padding option '\neoschool@padding', defaulting to 'normal'.}]%
  \neo@recalc@paddings
}

\AtEndOfClass{%
  \neo@configure@padding
}

%% ==============================================================================
%% Box Arc
%% ==============================================================================

\newcommand{\neo@resolvearc}[2]{%
  \ifdefempty{#1}{%
    \ifdefempty{\neoschool@boxarc}%
      {\def#1{#2}}%
      {\let#1\neoschool@boxarc}%
  }{}%
}

\ifdefempty{\neoschool@thmtitlearc}{%
  \ifdefempty{\neoschool@thmboxarc}%
    {\def\neoschool@thmtitlearc{3pt}}%
    {\let\neoschool@thmtitlearc\neoschool@thmboxarc}%
}{}

\neo@resolvearc{\neoschool@thmboxarc}{3pt}
\neo@resolvearc{\neoschool@exboxarc}{3pt}
\neo@resolvearc{\neoschool@codeboxarc}{3pt}
\neo@resolvearc{\neoschool@adboxarc}{3pt}
\neo@resolvearc{\neoschool@sideboxarc}{3pt}
\neo@resolvearc{\neoschool@neoboxarc}{3pt}
\neo@resolvearc{\neoschool@pseudoboxarc}{3pt}
\neo@resolvearc{\neoschool@sectionarc}{0pt}

%% ==============================================================================
%% Box Shape
%% ==============================================================================

\newcommand{\neo@resolveboxshape}[1]{%
  \ifdefempty{#1}{%
    \ifdefempty{\neoschool@boxshape}%
      {\def#1{rounded}}%
      {\let#1\neoschool@boxshape}%
  }{}%
}

\ifdefempty{\neoschool@thmtitleshape}{%
  \ifdefempty{\neoschool@thmboxshape}%
    {\def\neoschool@thmtitleshape{rounded}}%
    {\let\neoschool@thmtitleshape\neoschool@thmboxshape}%
}{}

\neo@resolveboxshape{\neoschool@thmboxshape}
\neo@resolveboxshape{\neoschool@exboxshape}
\neo@resolveboxshape{\neoschool@codeboxshape}
\neo@resolveboxshape{\neoschool@adboxshape}
\neo@resolveboxshape{\neoschool@neoboxshape}
\neo@resolveboxshape{\neoschool@sideboxshape}

%% ==============================================================================
%% Box frame opacity
%% ==============================================================================

\ifx\neoschool@frameopacity\@empty \else
  \ifx\neoschool@thmframeopacity\@empty \let\neoschool@thmframeopacity\neoschool@frameopacity \fi
  \ifx\neoschool@exframeopacity\@empty  \let\neoschool@exframeopacity\neoschool@frameopacity  \fi
  \ifx\neoschool@codeframeopacity\@empty\let\neoschool@codeframeopacity\neoschool@frameopacity\fi
  \ifx\neoschool@adframeopacity\@empty  \let\neoschool@adframeopacity\neoschool@frameopacity  \fi
  \ifx\neoschool@neoframeopacity\@empty \let\neoschool@neoframeopacity\neoschool@frameopacity \fi
  \ifx\neoschool@sideframeopacity\@empty\let\neoschool@sideframeopacity\neoschool@frameopacity\fi
\fi

\ifx\neoschool@thmframeopacity\@empty \def\neoschool@thmframeopacity{90} \fi
\ifx\neoschool@exframeopacity\@empty  \def\neoschool@exframeopacity{95}  \fi
\ifx\neoschool@codeframeopacity\@empty\def\neoschool@codeframeopacity{90} \fi
\ifx\neoschool@adframeopacity\@empty  \def\neoschool@adframeopacity{90}  \fi
\ifx\neoschool@neoframeopacity\@empty \def\neoschool@neoframeopacity{90} \fi
\ifx\neoschool@sideframeopacity\@empty\def\neoschool@sideframeopacity{90} \fi

%% ==============================================================================
%% Box opacity
%% ==============================================================================

\newcommand{\neo@resolveopacity}[2]{%
  \ifdefempty{#1}{%
    \ifdefempty{\neoschool@boxopacity}%
      {\def#1{#2}}%
      {\let#1\neoschool@boxopacity}%
  }{}%
}

\neo@resolveopacity{\neoschool@thmboxopacity}{8}
\neo@resolveopacity{\neoschool@codeboxopacity}{8}
\neo@resolveopacity{\neoschool@exboxopacity}{0}
\neo@resolveopacity{\neoschool@adboxopacity}{8}
\neo@resolveopacity{\neoschool@boxopacity}{8}

\newcommand{\neo@thmopacity}{\neoschool@thmboxopacity}
\newcommand{\neo@codeopacity}{\neoschool@codeboxopacity}
\newcommand{\neo@exopacity}{\neoschool@exboxopacity}
\newcommand{\neo@adopacity}{\neoschool@adboxopacity}

\ifnum\pdf@strcmp{\neoschool@thmboxopacity}{0}=0\else
  \neo@thmnobackfalse
\fi

\ifnum\pdf@strcmp{\neoschool@exboxopacity}{0}=0\else
  \neo@exnobackfalse
\fi

%% ==============================================================================
%% Theme Logic
%% ==============================================================================

\definecolor{neoCorrectColor}{HTML}{10B981}
\definecolor{neoIncorrectColor}{HTML}{EF4444}

\definecolor{neoFixedWarning}{HTML}{B45309}
\definecolor{neoFixedImportant}{HTML}{B91C1C}
\definecolor{neoFixedInfo}{HTML}{1A6AA5}
\definecolor{neoFixedTip}{HTML}{18794E}

\ExplSyntaxOn

\tl_new:N \l__neo_theme_tl

\cs_new_protected:Npn \__neo_set_palette:nnnn #1 #2 #3 #4 {
  \definecolor{primaryColor}{HTML}{#1}
  \definecolor{secondaryColor}{HTML}{#2}
  \definecolor{tertiaryColor}{HTML}{#3}
  \definecolor{structuralColor}{HTML}{#4}
}

\cs_new_protected:Npn \__neo_map_semantic_colors: {
  \ifneo@darktheme
    \definecolor{backgroundColor}{HTML}{1A1B26}
    \definecolor{textColor}{HTML}{E2E8F0}
    \renewcommand{\neoschool@globalcolor}{textColor}
    \renewcommand{\neoschool@headfootcolor}{textColor!80!backgroundColor}

    \colorlet{primaryColorUsed}{primaryColor!40!white}
    \colorlet{secondaryColorUsed}{secondaryColor!40!white}
    \colorlet{tertiaryColorUsed}{tertiaryColor!40!white}
    \colorlet{structuralColorUsed}{structuralColor!30!white}
  \else
    \definecolor{backgroundColor}{HTML}{FFFFFF}
    \definecolor{textColor}{HTML}{1E293B}

    \colorlet{primaryColorUsed}{primaryColor}
    \colorlet{secondaryColorUsed}{secondaryColor}
    \colorlet{tertiaryColorUsed}{tertiaryColor}
    \colorlet{structuralColorUsed}{structuralColor}
  \fi

  \colorlet{titleColor}{primaryColorUsed}
  \colorlet{sectionColor}{primaryColorUsed}
  \colorlet{subsectionColor}{secondaryColorUsed}
  \colorlet{subsubsectionColor}{structuralColorUsed}
  \colorlet{mathColor}{primaryColorUsed}
  \colorlet{neo@urlcolor}{primaryColorUsed}
  \colorlet{neo@linkcolor}{primaryColorUsed!70!structuralColorUsed}

  \colorlet{definitionColor}{primaryColorUsed}

  \colorlet{theoremColor}{secondaryColorUsed}

  \colorlet{exerciseColor}{tertiaryColorUsed}
  \colorlet{activityColor}{tertiaryColorUsed}

  \colorlet{applicationColor}{tertiaryColorUsed}
  \colorlet{markerColor}{primaryColorUsed}

  \colorlet{methodColor}{secondaryColorUsed}
  \colorlet{exampleColor}{tertiaryColorUsed!80!structuralColorUsed}
  \colorlet{remarkColor}{structuralColorUsed}
  \colorlet{verbColor}{structuralColorUsed}

  \ifneo@darktheme
    \colorlet{warningColor}{neoFixedWarning!50!white}
    \colorlet{importantColor}{neoFixedImportant!50!white}
  \else
    \colorlet{warningColor}{neoFixedWarning}
    \colorlet{importantColor}{neoFixedImportant}
  \fi

  \ifneo@darktheme
    \colorlet{infoColor}{neoFixedInfo!50!white}
    \colorlet{tipColor}{neoFixedTip!50!white}
  \else
    \colorlet{infoColor}{neoFixedInfo}
    \colorlet{tipColor}{neoFixedTip}
  \fi

  \colorlet{noteColor}{structuralColorUsed}
  \colorlet{toolboxColor}{structuralColorUsed}
  \colorlet{reminderColor}{structuralColorUsed}
  \colorlet{summaryColor}{structuralColorUsed}
  \colorlet{codeTitle}{structuralColorUsed}
  \colorlet{codeFrame}{primaryColorUsed}
  \colorlet{codeComment}{structuralColorUsed!80}
  \colorlet{codeNumber}{structuralColorUsed}
  \colorlet{authorColor}{structuralColorUsed}
  \colorlet{subjectColor}{structuralColorUsed}
  \colorlet{subtitleColor}{structuralColorUsed}

  \colorlet{codeKeyword}{primaryColorUsed!85!\neoschool@globalcolor}
  \colorlet{codeIdentifier}{secondaryColorUsed!80!\neoschool@globalcolor}
  \colorlet{codeString}{tertiaryColorUsed!80!\neoschool@globalcolor}
}

\newcommand{\neo@recompute@bgcolors}{%
  \ifneo@thmnoback
    \colorlet{theoremBgColor}{backgroundColor}%
    \colorlet{definitionBgColor}{backgroundColor}%
    \colorlet{exampleBgColor}{backgroundColor}%
  \else
    \colorlet{theoremBgColor}{theoremColor!\neo@thmopacity!backgroundColor}%
    \colorlet{definitionBgColor}{definitionColor!\neo@thmopacity!backgroundColor}%
    \colorlet{exampleBgColor}{exampleColor!\neo@thmopacity!backgroundColor}%
  \fi
  \ifneo@exnoback
    \colorlet{exerciseBgColor}{backgroundColor}%
  \else
    \colorlet{exerciseBgColor}{exerciseColor!\neo@exopacity!backgroundColor}%
  \fi
  \ifneo@codenoback
    \colorlet{codeBackground}{backgroundColor}%
    \colorlet{pseudocodeBackground}{backgroundColor}%
  \else
    \ifneo@darktheme
      \colorlet{codeBackground}{backgroundColor!93}%
    \else
      \colorlet{codeBackground}{structuralColor!\neo@codeopacity}%
    \fi
    \colorlet{pseudocodeBackground}{codeBackground}%
  \fi
  \colorlet{solutionBgColor}{exerciseColor!\neo@exopacity!backgroundColor}%
  \colorlet{lemmaBgColor}{theoremBgColor}%
  \colorlet{corollaryBgColor}{theoremBgColor}%
  \colorlet{propositionBgColor}{theoremBgColor}%
  \colorlet{propertyBgColor}{theoremBgColor}%
  \colorlet{conjectureBgColor}{structuralColor!\neo@thmopacity!backgroundColor}%
  \colorlet{remarkBgColor}{exampleBgColor}%
  \colorlet{comprehensionBgColor}{exampleBgColor}%
  \colorlet{answerframeFrameColor}{exampleColor!60!backgroundColor}%
  \colorlet{answerfieldBgColor}{exerciseColor!8!backgroundColor}%
  \colorlet{emptyboxBgColor}{primaryColor!8!backgroundColor}%
  \colorlet{neoboxBgColor}{primaryColor!\neoschool@boxopacity!backgroundColor}%
  \colorlet{mathHighlightColor}{primaryColor!\neoschool@mathboxopacity!backgroundColor}%
  \colorlet{lemmaColor}{theoremColor}%
  \colorlet{corollaryColor}{theoremColor}%
  \colorlet{propositionColor}{theoremColor}%
  \colorlet{propertyColor}{theoremColor}%
  \colorlet{solutionColor}{exerciseColor}%
  \colorlet{conjectureColor}{structuralColor}%
  \colorlet{remarkColor}{exampleColor}%
  \colorlet{comprehensionColor}{exampleColor}%
  \colorlet{pseudocodeTitle}{primaryColor}%
  \colorlet{pseudocodeFrame}{codeFrame}%
}

\cs_new_protected:Npn \neo_load_theme: {

  \tl_set:Nx \l__neo_theme_tl { \neoschool@theme }
  \tl_trim_spaces:N \l__neo_theme_tl
  \tl_if_empty:nT \l__neo_theme_tl {\neo_set_if_empty:Nn \neoschool@theme {axiom}}

\str_case:VnF \l__neo_theme_tl {

  % --- near black ---

    % secondary: orange/amber
    {mineral}     { \__neo_set_palette:nnnn {0F172A}{92400E}{2A50A8}{2A3A50} }  % tertiary: blue
    {graphite}    { \__neo_set_palette:nnnn {18181B}{8A5C1A}{2A50A8}{383838} }  % tertiary: blue
    % secondary: teal

  % --- dark slate ---

    % secondary: dark red
    {athenee}     { \__neo_set_palette:nnnn {2D4060}{8B2222}{1A7A72}{3D5268} }  % tertiary: teal
    % secondary: crimson
    {renaissance} { \__neo_set_palette:nnnn {2D4060}{9F1239}{1A7A72}{3D5268} }  % tertiary: teal
    % secondary: burgundy
    {prestige}    { \__neo_set_palette:nnnn {2A3F62}{7A2D42}{1E6B5E}{455669} }  % tertiary: teal
    % secondary: dark rose
    {axiom}       { \__neo_set_palette:nnnn {2C3D6A}{6B3040}{1A7A6A}{485A72} }  % tertiary: teal
    % secondary: mahogany
    {studio}      { \__neo_set_palette:nnnn {2C3D55}{6B3A2A}{1E6B5E}{586070} }  % tertiary: teal
    % secondary: green
    {sequoia}     { \__neo_set_palette:nnnn {2E3D5C}{1A7055}{6B3545}{485A6A} }  % tertiary: bordeaux

  % --- navy ---

    % secondary: dark red
    {library}     { \__neo_set_palette:nnnn {18174F}{6B1A1A}{1A6B4A}{4A4453} }  % tertiary: dark green
    % secondary: red/burgundy
    {neon}        { \__neo_set_palette:nnnn {272C5D}{82303E}{1A7A5A}{525568} }  % tertiary: green
    {excellence}  { \__neo_set_palette:nnnn {2E2A6E}{8B1A35}{1AA898}{2D3060} }  % tertiary: teal
    {marine}      { \__neo_set_palette:nnnn {1A3B59}{622537}{2D6A5A}{505A6A} }  % tertiary: teal
    {rubis}       { \__neo_set_palette:nnnn {1A3A6E}{B52412}{1A6B5A}{3A4050} }  % tertiary: teal
    % secondary: orange/brown
    {retro}       { \__neo_set_palette:nnnn {1A3B59}{803D1B}{1A7A6E}{3F4756} }  % tertiary: teal
    {midnight}    { \__neo_set_palette:nnnn {1F2C47}{93491F}{1D6F60}{505560} }  % tertiary: teal
    {dusk}        { \__neo_set_palette:nnnn {192C4D}{85492E}{3A7A60}{505A6A} }  % tertiary: green
    % secondary: purple
    {nocturne}    { \__neo_set_palette:nnnn {1E1B4B}{581C87}{1A6B4A}{2A2040} }  % tertiary: dark green
    % secondary: green
    {taiga}       { \__neo_set_palette:nnnn {1F2C47}{256B42}{7B4A26}{3F4450} }  % tertiary: brown

  % --- blue ---

    % secondary: slate
    {rhodium}     { \__neo_set_palette:nnnn {253141}{3E5871}{607A7C}{34495E} }  % tertiary: teal
    % secondary: red/burgundy
    {velours}     { \__neo_set_palette:nnnn {343A72}{7A2830}{1A7A60}{525568} }  % tertiary: teal
    {azure}       { \__neo_set_palette:nnnn {264F82}{7E3547}{24615E}{404756} }  % tertiary: teal
    {slate}       { \__neo_set_palette:nnnn {34495E}{8B3528}{1A6B63}{424656} }  % tertiary: teal
    {ink}         { \__neo_set_palette:nnnn {1C4662}{783B3D}{3C763F}{46556A} }  % tertiary: green
    % secondary: orange/brown
    {trinity}     { \__neo_set_palette:nnnn {323576}{88411D}{1A7A60}{474554} }  % tertiary: teal
    % secondary: dark green
    {royal}       { \__neo_set_palette:nnnn {264D82}{1A5E3A}{6B2D5B}{424656} }  % tertiary: purple

  % --- teal ---

    % secondary: red/burgundy
    {arctic}      { \__neo_set_palette:nnnn {256880}{7E3446}{1A7A6E}{374955} }  % tertiary: teal
    {mist}        { \__neo_set_palette:nnnn {3A646E}{753D54}{496835}{455C62} }  % tertiary: olive
    % secondary: brown/orange
    {oceanic}     { \__neo_set_palette:nnnn {1E5553}{7B4529}{2A5E8A}{3B4C4E} }  % tertiary: blue
    {woodland}    { \__neo_set_palette:nnnn {294653}{6B5320}{963D35}{3D4947} }  % tertiary: red/brown
    % secondary: purple/mauve
    {lagoon}      { \__neo_set_palette:nnnn {1E4D4A}{5B446A}{7A4E35}{2C3B3D} }  % tertiary: brown
    {frost}       { \__neo_set_palette:nnnn {24687C}{6F4367}{2A7A55}{364954} }  % tertiary: green
    % secondary: olive
    {tundra}      { \__neo_set_palette:nnnn {24687C}{577832}{674C59}{475A66} }  % tertiary: mauve

  % --- green ---

    % secondary: red
    {eton}        { \__neo_set_palette:nnnn {174F33}{8C2626}{185472}{424656} }  % tertiary: blue
    {manor}       { \__neo_set_palette:nnnn {216236}{762730}{6A5E80}{424656} }  % tertiary: purple
    % secondary: blue
    {hearth}      { \__neo_set_palette:nnnn {216236}{1E6B8A}{733318}{424656} }  % tertiary: brown
    {garden}      { \__neo_set_palette:nnnn {546230}{1D6C88}{7E3550}{5A5E4A} }  % tertiary: burgundy
    {ivy}         { \__neo_set_palette:nnnn {174F33}{1E4C8B}{6B2D5B}{424656} }  % tertiary: purple
    {moss}        { \__neo_set_palette:nnnn {3A5C3E}{4A6B8A}{514F64}{354940} }  % tertiary: purple
    % secondary: brown
    {forest}      { \__neo_set_palette:nnnn {254F17}{7A4520}{2D5A6A}{40493B} }  % tertiary: blue
    {sage}        { \__neo_set_palette:nnnn {3E5040}{7A4E2A}{2E5A6E}{555C58} }  % tertiary: blue
    % secondary: purple
    {jewel}       { \__neo_set_palette:nnnn {1E6950}{47176B}{6B5218}{424856} }  % tertiary: gold

  % --- purple ---

    % secondary: dark teal
    {mulberry}    { \__neo_set_palette:nnnn {4A1F60}{104A4D}{3D5878}{4D4351} }  % tertiary: blue
    % secondary: teal
    {amethyst}    { \__neo_set_palette:nnnn {512E5F}{19776F}{2E5F85}{5A5260} }  % tertiary: blue
    % secondary: brown/orange
    {opera}       { \__neo_set_palette:nnnn {4D2682}{784919}{1A6B63}{4B4452} }  % tertiary: teal
    % secondary: gold/olive
    {velvet}      { \__neo_set_palette:nnnn {493144}{766731}{1A7A76}{51424E} }  % tertiary: teal

  % --- red/burgundy ---

    % secondary: dark teal/blue
    {mahogany}    { \__neo_set_palette:nnnn {4F2417}{1A5C6E}{3A6B20}{3D3635} }  % tertiary: green
    {heritage}    { \__neo_set_palette:nnnn {67271E}{1A5E72}{3A6B20}{424656} }  % tertiary: green
    {orchid}      { \__neo_set_palette:nnnn {77224B}{1A7A76}{47476B}{564148} }  % tertiary: purple
    % secondary: dark green
    {bordeaux}    { \__neo_set_palette:nnnn {62241C}{1A6B35}{2A5E96}{56423E} }  % tertiary: blue
    % secondary: blue
    {harvard}     { \__neo_set_palette:nnnn {783423}{1E4C8B}{1A6B35}{424656} }  % tertiary: green
    % secondary: olive/green
    {aurora}      { \__neo_set_palette:nnnn {713751}{427422}{1E5E96}{554149} }  % tertiary: blue
    {crimson}     { \__neo_set_palette:nnnn {822635}{226E50}{1E4C8B}{5A3840} }  % tertiary: blue
    {peony}       { \__neo_set_palette:nnnn {6F3946}{45721A}{1F6A93}{6A5055} }  % tertiary: blue
    {vivid}       { \__neo_set_palette:nnnn {822F26}{4F7A1A}{1A7A72}{56423E} }  % tertiary: teal

  % --- brown ---

    % secondary: blue/teal
    {coffee}      { \__neo_set_palette:nnnn {4A2F1E}{1E5468}{3E5C2A}{5A5048} }  % tertiary: olive
    {terra}       { \__neo_set_palette:nnnn {6B3E1F}{1A4868}{1F8A7A}{46413D} }  % tertiary: teal
    {saffron}     { \__neo_set_palette:nnnn {543F18}{165569}{6B2D5E}{504538} }  % tertiary: purple
    % secondary: dark teal/green
    {study}       { \__neo_set_palette:nnnn {62493C}{1A6B54}{44456E}{464556} }  % tertiary: purple
    % secondary: olive
    {cyprus}      { \__neo_set_palette:nnnn {825226}{5C7A1A}{1A6B72}{534439} }  % tertiary: teal

}
  {
    \PackageWarning{neoschool}{Theme~'\neoschool@theme'~unknown.~Using~axiom.}
    \__neo_set_palette:nnnn {2C3D6A}{6B3040}{1A7A6A}{485A72}
  }

  \__neo_map_semantic_colors:
}

\neo_load_theme:

\ExplSyntaxOff

%% ==============================================================================
%% Structure enforcement
%% ==============================================================================

\newcommand{\neo@enforce@structure}{%
  % A. Frames
  \ifneo@thmnoframe
    \renewcommand{\neo@framehidden}{frame hidden}
    \renewcommand{\neo@thmborder}{0pt}
    \ifneo@thmnoback
      \renewcommand{\neoschool@thmstyle}{raw}
    \fi
  \else
    \renewcommand{\neo@framehidden}{}
    \setlength{\neo@thmborder}{\neoschool@thmborder}
  \fi

  % B. Backgrounds
  \ifneo@thmnoback
    \renewcommand{\neo@thm@box@mainback}{backgroundColor}
    \ifneo@darktheme
      \definecolor{nobacklowercolor}{gray}{0.15}
      \renewcommand{\neo@box@lowerback}{nobacklowercolor}
    \else
      \renewcommand{\neo@box@lowerback}{tcbcolframe!\neoschool@thmboxopacity}
    \fi
  \else
    \renewcommand{\neo@thm@box@mainback}{tcbcolframe!\neo@thmopacity!backgroundColor}
  \fi

  % C. Code
  \ifneo@codenoframe
    \renewcommand{\neo@codeborder}{0pt}
    \ifneo@codenoback
      \renewcommand{\neo@code@box@beforeafterskip}{\dimexpr 0.5\baselineskip\relax}%
      \setlength{\neo@effective@code@beforeafterskip}{0.5\baselineskip}%
    \fi
  \fi

  % D. Exercises
  \ifneo@exnoframe
    \ifneo@exnoback
      \renewcommand{\neoschool@exstyle}{inline}
    \fi
  \fi
}

\neo@enforce@structure

\colorlet{mathColor}{primaryColor}

\ifx\neoschool@titlehexcolor\@empty
\else
  \definecolor{titleColor}{HTML}{\neoschool@titlehexcolor}
\fi

\neo@recompute@bgcolors

\AtBeginDocument{%
  \ifneo@print
    \colorlet{primaryColor}{black}
    \colorlet{secondaryColor}{black}
    \colorlet{tertiaryColor}{black}
    \colorlet{titleColor}{black}
    \colorlet{sectionColor}{black}
    \colorlet{subsectionColor}{black}
    \colorlet{subsubsectionColor}{black}
    \colorlet{subjectColor}{black}
    \colorlet{subtitleColor}{black}
    \colorlet{authorColor}{black!85}
    \colorlet{theoremColor}{black}
    \colorlet{definitionColor}{black}
    \colorlet{exerciseColor}{black}
    \colorlet{exampleColor}{black}
    \colorlet{codeFont}{black}
    \colorlet{codeFrame}{black!\neoschool@codeframeopacity}
    \colorlet{codeTitle}{black}
    \colorlet{codeKeyword}{black!90}
    \colorlet{codeIdentifier}{black!90}
    \colorlet{codeString}{black!80}
    \colorlet{verbColor}{black}
    \colorlet{markerColor}{black}
    \colorlet{noteColor}{black}
    \colorlet{methodColor}{black}
    \colorlet{activityColor}{black}
    \colorlet{applicationColor}{black}
    \colorlet{warningColor}{black}
    \colorlet{importantColor}{black}
    \colorlet{infoColor}{black}
    \colorlet{tipColor}{black}
    \colorlet{toolboxColor}{black}
    \colorlet{reminderColor}{black}
    \colorlet{summaryColor}{black}
    \colorlet{neoCorrectColor}{black}
    \colorlet{neoIncorrectColor}{black}
    \colorlet{structuralColor}{black}
    \colorlet{neo@urlcolor}{black}
    \colorlet{neo@linkcolor}{black}
    \colorlet{neo@citecolor}{black}
    \colorlet{neo@filecolor}{black}
    \neo@recompute@bgcolors
  \fi
  \ifneo@unicolor
    \colorlet{secondaryColor}{primaryColor}
    \colorlet{tertiaryColor}{primaryColor}
    \colorlet{titleColor}{primaryColor}
    \colorlet{sectionColor}{primaryColor}
    \colorlet{subsectionColor}{primaryColor}
    \colorlet{subsubsectionColor}{primaryColor}
    \colorlet{theoremColor}{primaryColor}
    \colorlet{definitionColor}{primaryColor}
    \colorlet{exerciseColor}{primaryColor}
    \colorlet{exampleColor}{primaryColor}
    \colorlet{codeFrame}{primaryColor}
    \colorlet{codeTitle}{primaryColor}
    \colorlet{verbColor}{primaryColor}
    \colorlet{codeKeyword}{primaryColor!90}
    \colorlet{codeIdentifier}{primaryColor!90}
    \colorlet{codeString}{primaryColor!80}
    \colorlet{neoInfo}{primaryColor}
    \colorlet{neoWarning}{primaryColor}
    \colorlet{neoImportant}{primaryColor}
    \colorlet{neoTip}{primaryColor}
    \colorlet{neoToolbox}{primaryColor}
    \colorlet{noteColor}{primaryColor}
    \colorlet{warningColor}{primaryColor}
    \colorlet{importantColor}{primaryColor}
    \colorlet{infoColor}{primaryColor}
    \colorlet{tipColor}{primaryColor}
    \colorlet{toolboxColor}{primaryColor}
    \colorlet{reminderColor}{primaryColor}
    \colorlet{summaryColor}{primaryColor}
    \colorlet{methodColor}{primaryColor}
    \colorlet{activityColor}{primaryColor}
    \colorlet{applicationColor}{primaryColor}
    \colorlet{neoCorrectColor}{primaryColor}
    \colorlet{neoIncorrectColor}{primaryColor}
    \colorlet{markerColor}{primaryColor}
    \colorlet{neo@urlcolor}{primaryColor}
    \colorlet{neo@linkcolor}{primaryColor}
    \colorlet{neo@citecolor}{primaryColor}
    \colorlet{neo@filecolor}{primaryColor}
    \neo@recompute@bgcolors
  \fi
}

%% ==============================================================================
%% Base class loading
%% ==============================================================================

%% Output mode pre-configuration

\ifneo@twoupafourmode
	\PassOptionsToClass{a5paper}{scrartcl}
	\AtEndPreamble{
		\KOMAoptions{paper=a5}
		\neo@setupmargins{last}
		\areaset{12cm}{19cm}
	}
\fi

\ifneo@twoupathreemode
	\PassOptionsToClass{a4paper}{scrartcl}
\fi

\ifneo@fourupathreemode
	\PassOptionsToClass{a5paper}{scrartcl}
	\AtEndPreamble{
		\KOMAoptions{paper=a5}
		\neo@setupmargins{last}
		\areaset{12cm}{19cm}
	}
\fi

\ifneo@simpletwoupmode
	\PassOptionsToClass{a4paper}{scrartcl}
	\AtEndPreamble{
		\KOMAoptions{paper=a4}
		\neo@setupmargins{30}
		\areaset{19cm}{29cm}
	}
\fi

\ifneo@bookletafourmode
	\PassOptionsToClass{a5paper}{scrartcl}
	\AtEndPreamble{
		\KOMAoptions{paper=a5}
		\neo@setupmargins{last}
		\areaset{12cm}{19cm}
	}
\fi

\ifneo@bookletathreemode
	\PassOptionsToClass{a4paper}{scrartcl}
\fi

%% Load base class

\LoadClass{scrartcl}

\KOMAoptions{%
  DIV=last,
  parskip=\neoschool@parskip
}

\let\@unusedoptionlist\@empty

\title{}

%% Page layout configuration

\newcommand{\neo@setupmargins}[1]{%
  \ifdim\paperwidth>\paperheight
    \KOMAoptions{%
      DIV=calc,
      DIV=14,
      BCOR=0pt,
      headinclude=true,
      footinclude=true
    }%
    \areaset{27cm}{20.5cm}
  \else
    \KOMAoptions{%
      DIV=calc,
      DIV=#1,
      BCOR=0pt,
      headinclude=true,
      footinclude=true
    }%
    \areaset{19cm}{29.25cm}
  \fi
}

% Intentionally small margins for teaching materials
\neo@setupmargins{last}
\setlength{\headheight}{27pt}
\setlength{\footskip}{27pt}

\widowpenalty=10000
\clubpenalty=10000
\displaywidowpenalty=10000

\raggedbottom

%% ==============================================================================
%% Output Options
%% ==============================================================================

\AtEndPreamble{
	\ifneo@twoupafourmode
		\usepackage{pgfmorepages}
		\pgfmorepagesloadextralayouts
		\pgfpagesuselayout{repeated 2-up}[a4paper,landscape]
		\pgfpagesphysicalpage{2}{}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.25\pgfphysicalwidth}{.5\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{2}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.75\pgfphysicalwidth}{.5\pgfphysicalheight}
		}
	\fi

	\ifneo@twoupathreemode
		\usepackage{pgfmorepages}
		\pgfmorepagesloadextralayouts
		\pgfpagesuselayout{repeated 2-up}[a3paper,landscape]
		\areaset{19cm}{29cm}
		\pgfpagesphysicalpage{2}{}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.25\pgfphysicalwidth}{.5\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.75\pgfphysicalwidth}{.5\pgfphysicalheight}
		}
	\fi

	\ifneo@fourupathreemode
		\usepackage{pgfmorepages}
		\pgfmorepagesloadextralayouts
		\pgfpagesuselayout{repeated 4-up}[a3paper]
		\pgfpagesphysicalpage{4}{}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.25\pgfphysicalwidth}{.25\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.25\pgfphysicalwidth}{.75\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.75\pgfphysicalwidth}{.25\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.75\pgfphysicalwidth}{.75\pgfphysicalheight}
		}
	\fi

	\ifneo@simpletwoupmode
		\usepackage{pgfmorepages}
		\pgfmorepagesloadextralayouts
		\pgfpagesuselayout{2 on 1}[a3paper,landscape]
		\pgfpagesphysicalpage{2}{}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.25\pgfphysicalwidth}{.5\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{2}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.75\pgfphysicalwidth}{.5\pgfphysicalheight}
		}
	\fi

	\ifneo@bookletafourmode
		\usepackage{pgfmorepages}
		\pgfmorepagesloadextralayouts
		\pgfpagesuselayout{4 on 2, book format}[a4paper,landscape]
		\pgfpagesphysicalpage{4}{}
		\pgfpageslogicalpageoptions{4}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.25\pgfphysicalwidth}{.25\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.25\pgfphysicalwidth}{.75\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{2}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.75\pgfphysicalwidth}{.25\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{3}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.75\pgfphysicalwidth}{.75\pgfphysicalheight}
		}    \fi

	\ifneo@bookletathreemode
		\usepackage{pgfmorepages}
		\pgfmorepagesloadextralayouts
		\pgfpagesuselayout{4 on 2, book format}[a3paper,landscape]
		\areaset{19cm}{29.25cm}
		\setlength{\headheight}{27pt}
		\setlength{\footskip}{27pt}
		\pgfpagesphysicalpage{4}{}
		\pgfpageslogicalpageoptions{4}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.25\pgfphysicalwidth}{.25\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{1}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.25\pgfphysicalwidth}{.75\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{2}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.75\pgfphysicalwidth}{.25\pgfphysicalheight}
		}
		\pgfpageslogicalpageoptions{3}{
			resized width=.9\pgfphysicalwidth,
			resized height=\pgfphysicalheight,
			center=\pgfpoint{.75\pgfphysicalwidth}{.75\pgfphysicalheight}
		}
	\fi
}


%% ==============================================================================
%% Vertical spacing configuration
%% ==============================================================================

\ifdim\neo@vspace@factor pt=1.0pt
  \neo@effective@beforeafterskip=\neo@beforeafterskip
  \neo@effective@baseskip=0.75\baselineskip
  \neo@effective@code@beforeafterskip=\neo@code@box@beforeafterskip
  \neo@effective@ad@beforeafterskip=\neo@ad@beforeafterskip
  \neo@effective@ex@beforeafterskip=0.85\neo@ex@beforeafterskip
\else
  \pgfmathsetmacro{\neo@temp@factor}{\neo@vspace@factor * 0.75}
  \neo@effective@beforeafterskip=\dimexpr\neo@vspace@factor\neo@beforeafterskip\relax
  \neo@effective@baseskip=\dimexpr\neo@temp@factor\baselineskip\relax
  \neo@effective@code@beforeafterskip=\dimexpr\neo@vspace@factor\neo@code@box@beforeafterskip\relax
  \neo@effective@ad@beforeafterskip=\dimexpr\neo@vspace@factor\neo@ad@beforeafterskip\relax
  \neo@effective@ex@beforeafterskip=\dimexpr\neo@vspace@factor\neo@ex@beforeafterskip\relax
\fi

%% ==============================================================================
%% Two-column mode adjustment
%% ==============================================================================

\if@twocolumn
  \setlength{\columnsep}{2em}
\fi

%% ==============================================================================
%% Indentation configuration
%% ==============================================================================

\AtEndOfPackage{%
  \ifneoschool@noindent
    \AtBeginDocument{\setlength{\parindent}{0pt}}%
  \else
    \AtBeginDocument{\setlength{\parindent}{\neoschool@indent}}%
  \fi
}

%% ==============================================================================
%% Package loading
%% ==============================================================================

%% Core packages

\RequirePackage{iftex}
\RequirePackage{xkeyval}
\RequirePackage{pdftexcmds}
\RequirePackage{environ}
\RequirePackage{mathtools}
\RequirePackage{nccmath}

% Warning suppression
\RequirePackage{silence}
\WarningFilter{latexfont}{Font shape}
\renewcommand{\@font@warning}[1]{}
\WarningFilter{multicol}{}
\WarningFilter{frenchmath}{Command \mathscr}
\WarningFilter{frenchmath}{\leqslant and \geqslant}
\WarningFilter{frenchmath}{\varnothing}

%% Language support

\ifneo@french
  \RequirePackage[main=french,shorthands=off]{babel}
\else\ifneo@german
    \RequirePackage[main=german]{babel}
  \else
    \RequirePackage[main=english]{babel}
  \fi
\fi

%% Page layout packages

\RequirePackage{scrlayer-scrpage}
\expandafter\let\expandafter\innerfoot\csname ifoot\endcsname
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{changepage}
\RequirePackage{needspace}

%% Graphics and colors

\RequirePackage[most]{tcolorbox}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}

% TikZ libraries
\usetikzlibrary{%
  backgrounds,
  calc,
  decorations.shapes,
  positioning,
  shadows,
  shadows.blur,
  shapes.arrows,
  shapes.geometric,
  shapes.misc,
  fadings
}

\ifneoschool@faketext
  \RequirePackage{blindtext}
  \RequirePackage{lipsum}
\fi

\RequirePackage{wrapfig}

% Additional TikZ-related packages
\RequirePackage{tikzsymbols}
\RequirePackage{tikzpagenodes}
\RequirePackage{forest}
\useforestlibrary{linguistics}

% LuaTeX specific packages
\ifLuaTeX
  \usetikzlibrary{graphs,graphdrawing,quotes,shadings}
  \usegdlibrary{circular,force,layered,routing,trees}
  \RequirePackage{luacolor}
  \RequirePackage{lua-ul}
  \RequirePackage{luacas}
\fi

%% Tables and arrays

\RequirePackage{colortbl}
\RequirePackage{tabularray}
\UseTblrLibrary{%
  amsmath,
  booktabs,
  diagbox,
  functional,
  varwidth,
  siunitx
}
\RequirePackage{adjustbox}

%% Mathematics

\ifneoschool@math
  \neo@loadbasearithmetictrue
\fi
\ifneo@apmep
  \neo@loadbasearithmetictrue
\fi

\ifneo@loadbasearithmetic
  \RequirePackage{mathrsfs}
  \let\mathscr\relax%
  \RequirePackage[np]{numprint}
  \RequirePackage{esvect}
  \RequirePackage{cancel}
  \ifneoschool@math
    \ifneoschool@frenchmath\else
      \RequirePackage{ncccomma}
    \fi
  \fi
\fi


\ifneoschool@math
  \let\Bbbk\relax \let\mfrac\relax \let\vide\relax \let\Ker\relax

  \ifPDFTeX
    \RequirePackage[suite,taupe]{tdsfrmath}
  \else
    \RequirePackage[suite,taupe,avecmathdesign=true]{tdsfrmath}
  \fi

  \ifneoschool@frenchmath
    \let\vide\relax
    \let\Ker\relax
    \RequirePackage{frenchmath}
  \fi

  \let\mathscr\relax
  \RequirePackage{annotate-equations}
  \RequirePackage{witharrows}
  \RequirePackage{xlop}
  \RequirePackage{tkz-euclide}
  \@ifpackageloaded{tkz-tab}{}{\RequirePackage{tkz-tab}}

  \@ifpackageloaded{unicode-math}{%
    \providecommand{\bm}[1]{\symbf{#1}}%
  }{%
    \providecommand{\bm}[1]{\boldsymbol{#1}}%
  }
\fi

%% APMEP compatibility mode

\ifneo@apmep
  \RequirePackage{textcomp}
  \RequirePackage{fourier-orns}
  \RequirePackage{tabularx}
  \RequirePackage{fancyvrb}
  \let\cfoot\relax%
  \let\chead\relax%
  \let\rfoot\relax%
  \let\rhead\relax%
  \let\lhead\relax%
  \let\lfoot\relax%
  \RequirePackage{fancyhdr}
  \RequirePackage{fancybox}
  \RequirePackage[normalem]{ulem}
  \RequirePackage{pifont}
  \RequirePackage{lscape}
  \RequirePackage{multirow}
  \RequirePackage{eucal}
  \RequirePackage{variations}

  \RequirePackage{pstricks}
  \RequirePackage{pst-plot}
  \RequirePackage{pst-tree}
  \RequirePackage{pst-node}
  \RequirePackage{pst-text}
  \RequirePackage{pst-eucl}
  \RequirePackage{pst-3dplot}
  \let\pscalculate\undefined
  \RequirePackage{pst-bezier}
  \RequirePackage{pstricks-add}

  \@ifpackageloaded{tkz-tab}{}{\RequirePackage{tkz-tab}}

  \AtBeginDocument{%
    \providecommand{\cg}{\texttt{]}}
    \providecommand{\cd}{\texttt{[}}
    \providecommand{\pg}{\geqslant}
    \providecommand{\pp}{\leqslant}
    \def\R{\ensuremath{\mathbb{R}}}
    \def\N{\ensuremath{\mathbb{N}}}
    \def\D{\ensuremath{\mathbb{D}}}
    \def\Z{\ensuremath{\mathbb{Z}}}
    \def\Q{\ensuremath{\mathbb{Q}}}
    \def\C{\ensuremath{\mathbb{C}}}
    \def\e{\ensuremath{\mathrm{e}}}
    \providecommand{\Ci}{\ensuremath{\mathrm{i}}}
    \providecommand{\i}{\ensuremath{\mathrm{i}}}
    \providecommand{\d}{\,\text{d}}
    \providecommand{\dd}{\,\text{d}}
    \providecommand{\dx}{\,\text{d}x}
    \providecommand{\I}{\ensuremath{\mathit{I}}}
    \providecommand{\transformation}{\ensuremath{\mathit{S}}}
    \def\vect#1{\overrightarrow{\,\mathstrut#1\,}}
    \DeclareRobustCommand{\vectt}[1]{\overrightarrow{\,\mathstrut\text{#1}\,}}
    \DeclareRobustCommand{\barre}[1]{\overline{\,\mathstrut#1\,}}
    \providecommand{\ps}[2]{\vect{#1}\cdot \vect{#2}}
    \def\Oij{$\left(\text{O}~;~\vect{\imath},~\vect{\jmath}\right)$}
    \def\Oijk{$\left(\text{O}~;~\vect{\imath},~\vect{\jmath},~\vect{k}\right)$}
    \def\Ouv{$\left(\text{O}~;~\vect{u},~\vect{v}\right)$}
    \providecommand{\vectco}[2]{$\left(\begin{array}{c} #1\\ #2 \end{array}\right)$}
    \providecommand{\vectcol}[3]{$\left(\begin{array}{c} #1\\ #2\\ #3 \end{array}\right)$}
    \def\V#1{\overrightarrow{\textrm{#1}}}
    \providecommand{\ei}[1]{\e^{\i #1}}
    \providecommand{\ein}[1]{\e^{-\i #1}}
    \providecommand{\IM}{\mathrm{i}}
    \providecommand{\cf}{$\mathcal{C}_f$ }
    \providecommand{\cg}{$\mathcal{C}_g$ }
    \providecommand{\dr}{$\mathcal{D}\;$}
    \providecommand{\deprim}{$\mathcal{D'}\;$}
    \providecommand{\ex}{\e^x}
    \providecommand{\defi}{\textbf{Définition : }}
    \providecommand{\prop}{\textbf{Propriété : }}
    \providecommand{\teo}{\textbf{Théorème : }}
    \providecommand{\demo}{\textbf{Démonstration : }}
    \providecommand{\exemp}{\textbf{Exemple : }}
    \newcolumntype{Y}{>{\centering\arraybackslash}X}
    \newcounter{exoBac} \setcounter{exoBac}{1}
    \providecommand{\titreExe}[2][]{%
      \vspace{0.5cm}\par
      \textbf{\textsc{Exercice} \theexoBac{} #1 \hfill #2 points} \par
      \medskip
      \stepcounter{exoBac}%
    }
    \newcounter{partieBac}[exoBac]
    \providecommand{\partieBac}[1]{%
      \stepcounter{partieBac}%
      \vspace{0.25cm}\par
      \textbf{PARTIE \Alph{partieBac} \quad #1}\par
      \medskip
    }
    \DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
    \DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
    \DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
    \DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
    \DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
  }
\fi

%% Computer algebra system support

\ifneo@mathics
  \RequirePackage[mathics]{latexalpha2}
  \RequirePackage{asymptote}
\fi

%% Lists and utilities

\RequirePackage{tasks}
\RequirePackage{cuted}
\RequirePackage{qrcode}
\RequirePackage{xhfill}
\RequirePackage{fontawesome5}
\RequirePackage{pifont}
\RequirePackage{adforn}
\RequirePackage[gen]{eurosym}

\RequirePackage[%
\neo@lang,
textsize=small
]{todonotes}

\RequirePackage{marginnote}
\RequirePackage{algpseudocode}
\RequirePackage[use-files,clear-aux]{xsim}
\RequirePackage[normalem]{ulem}

%% Microtyp eand hyperref

\AtEndOfClass{
  \let\CheckCommand\providecommand
  \RequirePackage{microtype}
}

\RequirePackage{bookmark}
\RequirePackage{lastpage}

\hypersetup{%
  colorlinks=true,
  linkcolor=neo@linkcolor,
  urlcolor=neo@urlcolor,
  citecolor=neo@citecolor,
  filecolor=neo@filecolor,
  menucolor=neo@linkcolor,
  runcolor=neo@filecolor,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=2,
  pdfstartview={FitH},
  pdfdisplaydoctitle=true,
  pdfpagemode=UseOutlines,
  pdfpagelayout=OneColumn,
  pdfborder={0 0 0},
  breaklinks=true,
  hypertexnames=false,
}

%% ==============================================================================
%% Font configuration
%% ==============================================================================

\edef\mainface{\expandonce{\neoschool@mainface}}
\edef\sansface{\expandonce{\neoschool@sansface}}
\edef\monoface{\expandonce{\neoschool@monoface}}
\edef\mathface{\expandonce{\neoschool@mathface}}
\edef\facefamily{\expandonce{\neoschool@facefamily}}

\ifPDFTeX
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}

  \IfStrEq{\facefamily}{}{%
    \IfStrEq{\mathface}{}{%
      \ifneo@mathastext
        \RequirePackage[italic,eulergreek]{mathastext}%
      \else
        \RequirePackage{newpxmath}%
      \fi
    }{%
      \RequirePackage[\neoschool@mathfaceoptions]{\neoschool@mathface}%
    }%

    \IfStrEq{\mainface}{}{%
      \RequirePackage{newpxtext}%
    }{%
      \RequirePackage[\neoschool@mainfaceoptions]{\neoschool@mainface}%
    }%

    \IfStrEq{\sansface}{}{}{%
      \RequirePackage[\neoschool@sansfaceoptions]{\neoschool@sansface}%
    }%
    \IfStrEq{\monoface}{}{}{%
      \RequirePackage[\neoschool@monofaceoptions]{\neoschool@monoface}%
    }%
  }{%
    \RequirePackage[\neoschool@facefamilyoptions]{\neoschool@facefamily}%
  }

\else
  \AtBeginDocument{
    \providecommand{\square}{\mdlgwhtsquare}
    \providecommand{\blacksquare}{\mdlgblksquare}
  }
  \ifXeTeX
    \RequirePackage{fontspec}

    \ifneo@scale
      \defaultfontfeatures[\rmfamily]{Scale=1}
    \fi

    \defaultfontfeatures{Ligatures=TeX,Scale=MatchLowercase}

    \IfStrEq{\mathface}{}{%
      \ifneo@mathastext
        \RequirePackage[italic,eulergreek]{mathastext}%
      \else
        \RequirePackage{unicode-math}
         \IfFileExists{texgyrepagella-math.otf}
           {\setmathfont{texgyrepagella-math.otf}}
           {\setmathfont{latinmodern-math.otf}}
      \fi
    }{%
      \RequirePackage[math-style=ISO, bold-style=ISO]{unicode-math}
      \IfStrEq{\neoschool@mathfaceoptions}{}{%
        \setmathfont{\mathface}%
      }{%
        \setmathfont[\neoschool@mathfaceoptions]{\mathface}%
      }%
    }

    \IfStrEq{\mainface}{}{%
      \IfFileExists{texgyrepagella-regular.otf}{%
        \setmainfont{texgyrepagella-regular.otf}[
        BoldFont=texgyrepagella-bold.otf,
        ItalicFont=texgyrepagella-italic.otf,
        BoldItalicFont=texgyrepagella-bolditalic.otf
        ]%
      }{\setmainfont{lmroman10-regular.otf}[
          BoldFont       = lmroman10-bold.otf,
          ItalicFont     = lmroman10-italic.otf,
          BoldItalicFont = lmroman10-bolditalic.otf
      ]}%
    }{%
      \setmainfont[\neoschool@mainfaceoptions, Scale=\neoschool@mainfacescale]{\neoschool@mainface}%
    }

    \IfStrEq{\sansface}{}{%
      \IfFileExists{texgyreheros-regular.otf}{%
        \setsansfont{texgyreheros-regular.otf}[
        BoldFont=texgyreheros-bold.otf,
        ItalicFont=texgyreheros-italic.otf,
        BoldItalicFont=texgyreheros-bolditalic.otf
        ]%
      }{\setsansfont{lmsans10-regular.otf}[
          BoldFont       = lmsans10-bold.otf,
          ItalicFont     = lmsans10-oblique.otf,
          BoldItalicFont = lmsans10-boldoblique.otf
      ]}%
    }{%
      \setsansfont[\neoschool@sansfaceoptions, Scale=\neoschool@sansfacescale]{\neoschool@sansface}%
    }

    \IfStrEq{\monoface}{}{%
      \IfFileExists{texgyrecursor-regular.otf}{%
        \setmonofont{texgyrecursor-regular.otf}[
        BoldFont=texgyrecursor-bold.otf,
        ItalicFont=texgyrecursor-italic.otf,
        BoldItalicFont=texgyrecursor-bolditalic.otf
        ]%
      }{\setmonofont{lmmono10-regular.otf}[
          BoldFont       = lmmono10-regular.otf,
          ItalicFont     = lmmono10-italic.otf
      ]}%
    }{%
      \setmonofont[\neoschool@monofaceoptions, Scale=\neoschool@monofacescale]{\neoschool@monoface}%
    }

  \else
    \ifLuaTeX
      \RequirePackage{fontspec}

      \defaultfontfeatures{Ligatures=TeX,Scale=MatchLowercase,Renderer=HarfBuzz}

      \ifneo@scale
        \defaultfontfeatures[\rmfamily]{Scale=1}
      \fi

      \IfStrEq{\mathface}{}{%
        \ifneo@mathastext
          \RequirePackage[italic,eulergreeks]{mathastext}%
        \else
          \RequirePackage{newpxmath}%
        \fi
      }{%
        \RequirePackage{unicode-math}
        \IfStrEq{\neoschool@mathfaceoptions}{}{%
          \setmathfont{\mathface}%
        }{%
          \setmathfont[\neoschool@mathfaceoptions]{\mathface}%
        }%
      }

      \IfStrEq{\mainface}{}{%
        \setmainfont{TeX Gyre Pagella}%
      }{%
        \setmainfont[\neoschool@mainfaceoptions, Scale=\neoschool@mainfacescale]{\neoschool@mainface}%
      }

      \IfStrEq{\sansface}{}{%
        \setsansfont[Scale=0.94]{TeX Gyre Heros}%
      }{%
        \setsansfont[\neoschool@sansfaceoptions, Scale=\neoschool@sansfacescale]{\neoschool@sansface}%
      }

      \IfStrEq{\monoface}{}{%
        \setmonofont[Scale=1.05]{Latin Modern Mono}%
      }{%
        \setmonofont[\neoschool@monofaceoptions, Scale=\neoschool@monofacescale]{\neoschool@monoface}%
      }

    \fi
  \fi
\fi

% SemiBold Weight
\ifPDFTeX
  \providecommand{\sbseries}{\bfseries}
  \providecommand{\textsb}[1]{\textbf{#1}}
\else
  \AtEndPreamble{%
    \newcommand{\neo@configure@semibold}[2]{%
      \ifx#1\@empty\else
        \def\neo@temp@extra{}%
        \IfFontExistsTF{#1 SemiBold}{%
          \edef\neo@temp@extra{FontFace={sb}{n}{* SemiBold}}%
        }{}%
        \IfFontExistsTF{#1 SemiBold Italic}{%
          \ifx\neo@temp@extra\@empty\else\appto\neo@temp@extra{,}\fi
          \appto\neo@temp@extra{FontFace={sb}{it}{* SemiBold Italic}}%
        }{}%
        \ifx\neo@temp@extra\@empty\else
          \csname set#2font\endcsname{#1}[\csname neoschool@#2faceoptions\endcsname,\neo@temp@extra]%
        \fi
      \fi
    }

    \neo@configure@semibold{\neoschool@mainface}{main}
    \neo@configure@semibold{\neoschool@sansface}{sans}
    \neo@configure@semibold{\neoschool@monoface}{mono}
  }

  \def\sb@code{sb}

  \DeclareRobustCommand\sbseries{%
    \not@math@alphabet\sbseries\relax
    \begingroup
    \def\@font@warning##1{}%
    \fontseries{sb}\selectfont
    \xdef\temp{\f@series}%
    \endgroup
    \ifx\temp\sb@code
      \fontseries{sb}\selectfont
    \fi
  }

  \DeclareTextFontCommand{\textsb}{\sbseries}
\fi

\ifneo@sfbody
  \renewcommand{\familydefault}{\sfdefault}
\fi

%% ==============================================================================
%% Monospace Text
%% ==============================================================================

\newcommand{\neo@ifmathmode}[2]{%
  \relax\ifmmode #1\else #2\fi
}

\AtEndOfClass{%
  \let\neo@originaltexttt\texttt
  \ifneoschool@inlinecodebox
    \ifneo@darktheme
      \colorlet{inlineCodeBg}{verbColor!20!white!10!black}
      \colorlet{inlineCodeFrame}{verbColor!50!white}
    \else
      \colorlet{inlineCodeBg}{verbColor!6!white}
      \colorlet{inlineCodeFrame}{verbColor!30!white}
    \fi
    \tcbset{
      neoinlinecodestyle/.style={
        enhanced,
        arc=2pt,
        boxsep=0pt,
        top=2pt,
        bottom=2.5pt,
        left=3pt,
        right=3pt,
        colback=inlineCodeBg,
        colframe=inlineCodeFrame,
        boxrule=\neo@thinrule,
        nobeforeafter,
        tcbox raise base,
      }
    }
    \renewrobustcmd{\texttt}[1]{%
      \neo@ifmathmode{%
        \mathtt{#1}%
      }{%
        \tcbox[neoinlinecodestyle]{%
          \ttfamily
          \hyphenchar\font=`\-%
          \color{verbColor}\scalebox{0.92}{#1}%
        }%
      }%
    }%
  \else
    \renewrobustcmd{\texttt}[1]{%
      \neo@ifmathmode{%
        \mathtt{#1}%
      }{%
        \begingroup
        \ttfamily
        \hyphenchar\font=`\-%
        \color{verbColor}#1%
        \endgroup
      }%
    }%
  \fi
}

%% ==============================================================================
%% KOMA-Script Typography
%% ==============================================================================

% Title Content Formatter
\newcommand{\neo@title@style}{%
  \csname\neoschool@headweight\endcsname\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname%
}
\newcommand{\neo@title@other@style}{%
  \csname\neoschool@headweight\endcsname\csname\neoschool@headstyle\endcsname%
}
\newcommand{\neo@main@title@@style}{%
  \csname\neoschool@titleweight\endcsname\csname\neoschool@titlestyle\endcsname%
}

\newcommand{\hugeHuge}{\scalefont{2.47}\selectfont}
\newcommand{\LARGEhuge}{\scalefont{2.06}\selectfont}
\newcommand{\LargeLARGEplus}{\scalefont{1.77}\selectfont}
\newcommand{\LargeLARGE}{\scalefont{1.66}\selectfont}
\newcommand{\LargeLARGEminus}{\scalefont{1.55}\selectfont}
\newcommand{\largeLarge}{\scalefont{1.32}\selectfont}
\newcommand{\normalsizelarge}{\scalefont{1.1}\selectfont}
\newcommand{\smallnormalsize}{\scalefont{0.95}\selectfont}
\newcommand{\footnotesizesmall}{\scalefont{0.82}\selectfont}
\newcommand{\scriptsizefootnotesize}{\scalefont{0.77}\selectfont}
\newcommand{\tinyscriptsize}{\scalefont{0.66}\selectfont}

\setkomafont{disposition}{\mdseries}

\setkomafont{subject}{%
  \normalfont\sffamily
  \fontsize{9}{11}\selectfont
  \color{subjectColor}%
}

\setkomafont{title}{%
  \neo@main@title@@style
  \csname\neoschool@titlesize\endcsname
  \color{titleColor}%
}

\setkomafont{subtitle}{%
  \normalfont\sffamily\mdseries
  \fontsize{12}{16}\selectfont
  \color{subtitleColor}%
}

\setkomafont{author}{%
  \normalfont\rmfamily\scshape
  \fontsize{10}{13}\selectfont
  \color{authorColor}%
}

\setkomafont{section}{%
  \neo@title@other@style
  \Large
  \color{sectionColor}%
}

\setkomafont{subsection}{%
  \neo@title@other@style
  \large
  \color{subsectionColor}%
}

\setkomafont{subsubsection}{%
  \rmfamily
  \bfseries
  \itshape
  \color{subsubsectionColor}%
}

\setkomafont{pagenumber}{\small\csname\neoschool@headfootstyle\endcsname\color{\neoschool@headfootcolor}}
\setkomafont{part}{\neo@title@style\color{titleColor}\huge}
\setkomafont{partnumber}{\neo@title@style\color{titleColor}\LARGE}

\setkomafont{sectionentry}{\sffamily\bfseries\color{tocSectionColor}}
\setkomafont{sectionentrypagenumber}{\sffamily\bfseries\color{tocSectionColor}}

% Part entries in TOC: colored rule separator
\newcommand{\neo@toc@partrule}{%
  \nopagebreak[4]\vskip2pt
  \nopagebreak[4]%
  {\color{tocTitleColor!40}\hrule height 0.6pt}%
  \nopagebreak[4]\vskip4pt\nopagebreak[4]%
}

% Skip KOMA TOC entry styling when etoc will take over (compacttoc/twocoltoc)
\ifneo@compacttoc\else
\ifneo@twocoltoc\else
  \DeclareTOCStyleEntry[%
    beforeskip=2.5em plus 2pt,
    entryformat=\neo@title@style\Large\color{tocTitleColor},
    entrynumberformat=\neo@title@style\Large\color{tocTitleColor},
    pagenumberformat=\neo@title@style\large\color{tocTitleColor},
    linefill=\hfill,
    onstarthigherlevel=\nopagebreak\aftergroup\nopagebreak,
    onstartlowerlevel=\nopagebreak\aftergroup\nopagebreak,
    onstartsamelevel=\nopagebreak\aftergroup\nopagebreak
  ]{tocline}{part}

  \DeclareTOCStyleEntry[linefill=\textcolor{tocSectionColor}{\TOCLineLeaderFill}]{section}{section}
  \DeclareTOCStyleEntry[%
    linefill=\textcolor{tocSubsectionColor}{\TOCLineLeaderFill},
    entryformat=\sffamily\mdseries\color{tocSubsectionColor},
    pagenumberformat=\sffamily\mdseries\color{tocSubsectionColor}
  ]{subsection}{subsection}

  % Add rule after part TOC entries
  \let\neo@orig@l@part\l@part
  \renewcommand*{\l@part}[2]{%
    \neo@orig@l@part{##1}{##2}%
    \neo@toc@partrule
  }
\fi
\fi

% Page number format
\renewcommand*\pagemark{%
  {\usekomafont{pagenumber}
    \csname neo@pagename\endcsname\nobreakspace\thepage\nobreakspace/\nobreakspace
    {\hypersetup{linkcolor=\neoschool@headfootcolor}\pageref{LastPage}}
  }
}

\newpairofpagestyles{firstpage}{%
  \ihead{}\chead{}\ohead{}%
  \innerfoot{\@date}\cfoot{}\ofoot{\pagemark}%
  \KOMAoptions{headsepline=0pt}%
}

\newpairofpagestyles{customfirstpage}{%
  \ihead{}\chead{}\ohead{}%
  \innerfoot{\@date}\cfoot{\textsc{\@author}}\ofoot{\pagemark}%
  \KOMAoptions{headsepline=0pt}%
}

% Short title support
\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\let\@shorttitle\@empty

\newcommand{\neo@displaytitle}{\neo@displaytitle@cached}
\let\neo@displaytitle@cached\@empty

\AtBeginDocument{%
  \ifx\@shorttitle\@empty
    \begingroup
      \edef\neo@title@detok{\detokenize\expandafter{\@title}}%
      \StrLen{\neo@title@detok}[\neo@title@len]%
      \ifnum\neo@title@len>85\relax
        \IfSubStr{\neo@title@detok}{\@backslashchar}{%
          \ClassWarning{neoschool}{%
            The document title is longer than 85 characters and contains
            macros that prevent automatic truncation.\MessageBreak
            Provide a shorter version with \protect\shorttitle{...}%
          }%
          \global\let\neo@displaytitle@cached\@title
        }{%
          \StrLeft{\@title}{85}[\neo@title@trunc]%
          \protected@xdef\neo@displaytitle@cached{\neo@title@trunc\noexpand\ldots}%
        }%
      \else
        \global\let\neo@displaytitle@cached\@title
      \fi
    \endgroup
  \else
    \global\let\neo@displaytitle@cached\@shorttitle
  \fi
}

\newpairofpagestyles{followingpages}{%
  \ihead{}\chead{}\ohead{}%
  \innerfoot{\neo@displaytitle}\cfoot{}\ofoot{\pagemark}%
}

\newpairofpagestyles{pagenum}{%
  \ihead{}\chead{}\ohead{}%
  \innerfoot{}\cfoot{\pagemark}\ofoot{}%
  \KOMAoptions{headsepline=0pt,footsepline=0pt}%
}

% Header font configuration
\renewcommand*{\headfont}{%
  \small
  \csname\neoschool@headfootstyle\endcsname
  \color{\neoschool@headfootcolor}
}

%% ==============================================================================
%% Title Styles and Setting
%% ==============================================================================

\newcommand{\neo@checktitlelayout}{%
  \let\neo@layoutexec\createfulltitle
  \IfStrEq{\neoschool@titlelayout}{exam}{\let\neo@layoutexec\neo@examcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{eval}{\let\neo@layoutexec\neo@evalcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{evalicons}{\let\neo@layoutexec\neo@evaliconscontent}{}%
  \IfStrEq{\neoschool@titlelayout}{evalgrade}{\let\neo@layoutexec\neo@evalgradecontent}{}%
  \IfStrEq{\neoschool@titlelayout}{evaliconsgrade}{\let\neo@layoutexec\neo@evaliconsgradecontent}{}%
  \IfStrEq{\neoschool@titlelayout}{titlebox}{\let\neo@layoutexec\neo@titleboxcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{tighttitle}{\let\neo@layoutexec\neo@tighttitlecontent}{}%
  \IfStrEq{\neoschool@titlelayout}{onlytitle}{\let\neo@layoutexec\neo@onlytitle@content}{}%
  \IfStrEq{\neoschool@titlelayout}{bubbles}{\let\neo@layoutexec\neo@bubblescontent}{}%
  \IfStrEq{\neoschool@titlelayout}{particles}{\let\neo@layoutexec\neo@particlescontent}{}%
  \IfStrEq{\neoschool@titlelayout}{confetti}{\let\neo@layoutexec\neo@confetticontent}{}%
  \IfStrEq{\neoschool@titlelayout}{minimal}{\let\neo@layoutexec\neo@minimalcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{bar}{\let\neo@layoutexec\neo@barcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{spine}{\let\neo@layoutexec\neo@spinecontent}{}%
  \IfStrEq{\neoschool@titlelayout}{wave}{\let\neo@layoutexec\neo@wavecontent}{}%
  \IfStrEq{\neoschool@titlelayout}{blocks}{\let\neo@layoutexec\neo@blockscontent}{}%
  \IfStrEq{\neoschool@titlelayout}{stream}{\let\neo@layoutexec\neo@streamcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{brush}{\let\neo@layoutexec\neo@brushcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{flow}{\let\neo@layoutexec\neo@flowcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{magazine}{\let\neo@layoutexec\neo@magazinecontent}{}%
  \IfStrEq{\neoschool@titlelayout}{tech}{\let\neo@layoutexec\neo@techcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{book}{\let\neo@layoutexec\neo@bookcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{notion}{\let\neo@layoutexec\neo@notioncontent}{}%
  \IfStrEq{\neoschool@titlelayout}{simplenotion}{\let\neo@layoutexec\neo@simplenotioncontent}{}%
  \IfStrEq{\neoschool@titlelayout}{bristol}{\let\neo@layoutexec\neo@bristolcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{band}{\let\neo@layoutexec\neo@bandcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{memphis}{\let\neo@layoutexec\neo@memphiscontent}{}%
  \IfStrEq{\neoschool@titlelayout}{circles}{\let\neo@layoutexec\neo@circlescontent}{}%
  \IfStrEq{\neoschool@titlelayout}{bauhaus}{\let\neo@layoutexec\neo@bauhauscontent}{}%
  \IfStrEq{\neoschool@titlelayout}{grid}{\let\neo@layoutexec\neo@gridcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{geometric}{\let\neo@layoutexec\neo@geometriccontent}{}%
  \IfStrEq{\neoschool@titlelayout}{banner}{\let\neo@layoutexec\neo@bannercontent}{}%
  \IfStrEq{\neoschool@titlelayout}{cloud}{\let\neo@layoutexec\neo@cloudcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{champagne}{\let\neo@layoutexec\neo@champagnecontent}{}%
  \IfStrEq{\neoschool@titlelayout}{mockexam}{\let\neo@layoutexec\neo@mockexamcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{shortexam}{\let\neo@layoutexec\neo@shortexamcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{shorteval}{\let\neo@layoutexec\neo@shortevalcontent}{}%
  \IfStrEq{\neoschool@titlelayout}{shorttitle}{\let\neo@layoutexec\neo@shorttitlecontent}{}%
  \IfStrEq{\neoschool@titlelayout}{shortlesson}{\let\neo@layoutexec\neo@shortlessoncontent}{}%
  \neo@layoutexec
}

\newcommand{\neo@printtitle}{%
  \begingroup
    \csname\neoschool@titlestyle\endcsname
    \csname\neoschool@titleweight\endcsname
    \csname\neoschool@titleshape\endcsname
    \color{titleColor}%
    \usekomafont{title}{\@title}
  \endgroup
}

% Core definitions and lengths
\def\neo@left{left}
\def\neo@right{right}
\def\neo@center{center}

\newlength{\varspace}
\newlength{\titlespacing}
\setlength{\titlespacing}{\baselineskip}
\newcommand\myscaleratio{0.5}

% Define tight spacing commands
\newcommand{\neo@tightspacing}{%
  \setlength{\topsep}{0pt}
  \setlength{\parskip}{0pt}
}

% Redefine center, flushright, and flushleft environments with tight spacing
\let\oldcenter\center
\let\oldendcenter\endcenter

\newenvironment{neo@titlecenter}{%
  \neo@tightspacing
  \oldcenter
}{%
  \oldendcenter
}

\let\oldflushright\flushright
\let\oldendflushright\endflushright
\newenvironment{neo@flushright}{%
  \neo@tightspacing
  \oldflushright
}{%
  \oldendflushright
}

\let\oldflushleft\flushleft
\let\oldendflushleft\endflushleft
\newenvironment{neo@flushleft}{%
  \neo@tightspacing
  \oldflushleft
}{%
  \oldendflushleft
}

% Title decoration handler
\ExplSyntaxOn
\newcommand{\neo@titledecoration}{%
  \str_case:VnF \neoschool@titledecor
  {
    {rule} { \vspace{2\titlespacing}%
      {\color{structuralColor}\rule{0.33\linewidth}{\neo@decorativerule}}}
    {midrule} { \vspace{2\titlespacing}%
      {\color{structuralColor}\rule{0.5\linewidth}{\neo@decorativerule}}}
    {fullrule} { \vspace{2\titlespacing}%
      {\color{structuralColor}\rule{0.66\linewidth}{\neo@decorativerule}}}
    {ornament} { \vspace{2\titlespacing}%
      {\color{structuralColor}\scalebox{2}[1.5]{\adforn{21}\,\adforn{11}\,\adforn{49}}}}
    {none} { }
  }
  { \PackageWarning{neoschool}{Unknown titledecor style '\neoschool@titledecor'. Using none.} }
}
\ExplSyntaxOff

\newlength{\neo@sep@subject}   \setlength{\neo@sep@subject}{6pt}
\newlength{\neo@sep@subtitle}  \setlength{\neo@sep@subtitle}{8pt}
\newlength{\neo@sep@author}    \setlength{\neo@sep@author}{10pt}
\newlength{\neo@sep@after}     \if@twocolumn\setlength{\neo@sep@after}{2em}\else\setlength{\neo@sep@after}{1em}\fi

\let\@subject\@empty
\let\@subtitle\@empty
\let\@author\@empty

\newcommand{\createfulltitle}{%
  \begingroup
    \centering

    \ifx\@subject\empty\else
      {\usekomafont{subject}\MakeUppercase{\textls[50]{\@subject}}\par}
      \vspace{\neo@sep@subject}
    \fi

    {\usekomafont{title}\@title\par}

    \ifx\@subtitle\empty\else
      \vspace{\neo@sep@subtitle}
      {\usekomafont{subtitle}\@subtitle\par}
    \fi

    \ifx\@author\@empty\else
      \vspace{\neo@sep@author}
      {\usekomafont{author}\@author\par}
    \fi

    \neo@titledecoration

    \vspace{\neo@sep@after}
  \endgroup
}

% Only title creation (no author, subject, etc.)
\newcommand{\createonlytitle}{%
  \usekomafont{title}{\@title}\par
  \neo@titledecoration%
}

\renewcommand\maketitle{%
  \thispagestyle{firstpage}
  \IfStrEq{\neoschool@titlelayout}{onlytitle}{%
    \neo@handleonlytitle
    {\neo@onlytitle@content}
    {\neo@onlytitle@content}
  }{%
    \begingroup
    \setlength{\varspace}{\dimexpr\titlespacing+\myscaleratio\oddsidemargin}
    \if@twocolumn
      \twocolumn[{%
        \begingroup
        \ifx\neoschool@titlealign\neo@left
          \begin{neo@titleflushleft}
            \neo@checktitlelayout
          \end{neo@titleflushleft}
        \else
          \ifx\neoschool@titlealign\neo@right
            \noindent\raggedleft
            \neo@checktitlelayout
            \par
          \else
            \begin{neo@titlecenter}
              \neo@checktitlelayout
            \end{neo@titlecenter}
          \fi
        \fi
        \endgroup
      }]
    \else
      \begingroup
      \ifx\neoschool@titlealign\neo@left
        \begin{neo@titleflushleft}
          \noindent\neo@checktitlelayout
        \end{neo@titleflushleft}
      \else
        \ifx\neoschool@titlealign\neo@right
          \noindent\raggedleft
          \neo@checktitlelayout
          \par
        \else
          \begin{neo@titlecenter}
            \neo@checktitlelayout
          \end{neo@titlecenter}
        \fi
      \fi
      \endgroup
    \fi
    \endgroup
  }%
}

% Title box
\newcommand{\neo@titleboxcontent}{%
  \thispagestyle{customfirstpage}
  \newcommand{\neo@fancycolor}{exerciseColor!10!backgroundColor}

  \pgfdeclarelayer{background}
  \pgfsetlayers{background,main}

  \begin{tikzpicture}[remember picture,overlay]
    \def\titleanchor{west}
    \def\titlebasepos{current page text area.north west}
    \def\titlexshift{1ex}
    \def\subtitlepos{title.south west}
    \def\subjectpos{title.north west}

    \ifx\neoschool@titlealign\neo@center
      \def\titleanchor{center}
      \def\titlebasepos{current page text area.north}
      \def\titlexshift{0ex}
      \def\subtitlepos{title.south}
      \def\subjectpos{title.north}
    \fi
    \ifx\neoschool@titlealign\neo@right
      \def\titleanchor{east}
      \def\titlebasepos{current page text area.north east}
      \def\titlexshift{-1ex}
      \def\subtitlepos{title.south east}
      \def\subjectpos{title.north east}
    \fi
    \ifx\@subject\@empty
      \def\startYshift{\dimexpr-\baselineskip\relax}
    \else
      \def\startYshift{\dimexpr-3\baselineskip\relax}
    \fi

    \node[anchor=\titleanchor] (title) at
    ($([xshift=\titlexshift,yshift=\startYshift]\titlebasepos)$)
    {\csname\neoschool@titlestyle\endcsname
      \csname\neoschool@titleweight\endcsname
      \csname\neoschool@titleshape\endcsname
      \color{titleColor}\usekomafont{title}\@title};

    \ifx\@subtitle\@empty\else
      \node[below=5mm of \subtitlepos, anchor=\titleanchor] (subtitle)
      {\usekomafont{subtitle}\@subtitle};
    \fi

    \ifx\@subject\@empty\else
      \node[above=5mm of \subjectpos, anchor=\titleanchor] (subject)
      {\usekomafont{subject}\@subject};
    \fi

    \coordinate (boxtop) at (title.north);
    \coordinate (boxbottom) at (title.south);
    \ifx\@subject\@empty\else
      \coordinate (boxtop) at (subject.north);
    \fi
    \ifx\@subtitle\@empty\else
      \coordinate (boxbottom) at (subtitle.south);
    \fi

    \begin{pgfonlayer}{background}
      \def\boxpaddingH{0cm}
      \def\boxpaddingTop{0.5cm}
      \def\boxpaddingBottom{0.5cm}
      \fill[\neo@fancycolor]
      ($(current page text area.north west)!(boxtop)!(current page text area.south west) + (-\boxpaddingH, \boxpaddingTop)$) -|
      ($(current page text area.north east)!(boxtop)!(current page text area.south east) + (\boxpaddingH, \boxpaddingTop)$) |-
      ($(current page text area.north east)!(boxbottom)!(current page text area.south east) + (\boxpaddingH, -\boxpaddingBottom)$) -|
      ($(current page text area.north west)!(boxbottom)!(current page text area.south west) + (-\boxpaddingH, -\boxpaddingBottom)$) |- cycle;
    \end{pgfonlayer}
  \end{tikzpicture}

  \ifx\@subject\@empty
    \ifx\@subtitle\@empty
      \def\vspaceadjust{-1cm}
    \else
      \def\vspaceadjust{-0.15cm}
    \fi
  \else
    \ifx\@subtitle\@empty
      \def\vspaceadjust{-0.25cm}
    \else
      \def\vspaceadjust{0.5cm}
    \fi
  \fi
  \neo@top@compensate%
  \if@twocolumn\vspace*{\dimexpr10\baselineskip+\oddsidemargin+\vspaceadjust\relax}\par%
  \else\vspace*{\dimexpr7.5\baselineskip+\oddsidemargin+\vspaceadjust\relax}\par\fi
}


% Tight Title
\def\stringleft{left}
\def\stringcenter{center}
\def\stringright{right}

\newlength{\neoTitleHeight}
\newcommand{\neo@tighttitlecontent}{%
  \thispagestyle{customfirstpage}
  \begin{tikzpicture}[remember picture, overlay]
    \def\titleanchor{west}
    \def\titlebasepos{current page text area.north west}
    \def\titlexshift{-1ex}
    \def\subtitlepos{title.south west}
    \def\subjectpos{title.north west}

    \ifx\neoschool@titlealign\neo@center
      \def\titleanchor{center}
      \def\titlebasepos{current page text area.north}
      \def\titlexshift{0ex}
      \def\subtitlepos{title.south}
      \def\subjectpos{title.north}
    \fi
    \ifx\neoschool@titlealign\neo@right
      \def\titleanchor{east}
      \def\titlebasepos{current page text area.north east}
      \def\titlexshift{1ex}
      \def\subtitlepos{title.south east}
      \def\subjectpos{title.north east}
    \fi

    \ifx\@subject\@empty
      \def\startYshift{0cm}
    \else
      \def\startYshift{-0.5cm}
    \fi

    \node[anchor=\titleanchor] (title) at
    ($([xshift=\titlexshift,yshift=\startYshift]\titlebasepos)$)
    {%
      \csname\neoschool@titlestyle\endcsname
      \csname\neoschool@titleweight\endcsname
      \csname\neoschool@titleshape\endcsname
      \color{titleColor}\usekomafont{title}{\@title}%
    };

    \ifx\@subject\@empty\else
      \node[above=4.5mm of \subjectpos, anchor=\titleanchor] (subject)
      {\usekomafont{subject}\@subject};
    \fi

    \ifx\@subtitle\@empty
      \coordinate (lowestPoint) at (title.south);
    \else
      \node[below=5mm of \subtitlepos, anchor=\titleanchor] (subtitle)
      {\usekomafont{subtitle}\@subtitle};
      \coordinate (lowestPoint) at (subtitle.south);
    \fi

    \path let \p1 = (current page text area.north),
    \p2 = (lowestPoint)
    in \pgfextra{
      \global\neoTitleHeight=\dimexpr\y1-\y2\relax
    };
  \end{tikzpicture}

  \neo@top@compensate%

  \def\neo@geo@offset{1in + \topmargin + \headheight + \headsep}

  \if@twocolumn
    \vspace*{\dimexpr\neoTitleHeight - 4\baselineskip + \neo@geo@offset + 1cm\relax}
  \else
    \vspace*{\dimexpr\neoTitleHeight - 4\baselineskip + \neo@geo@offset + 0.35cm\relax}
  \fi
  \par
}

\newcommand{\neo@handleonlytitle}[2]{%
  \if@twocolumn
    \AfterEndPreamble{%
      \twocolumn[{#1\vspace*{.6in}\par}]
    }
  \else
    \AtBeginDocument{%
      #2\vspace*{0.4in}\par
    }
  \fi
  \let\maketitle\relax
  \thispagestyle{firstpage}
}

\newcommand{\neo@onlytitle@content}{%
  \IfStrEq{\neoschool@titlealign}{center}{%
    \begin{neo@titlecenter}\createonlytitle\end{neo@titlecenter}%
  }{%
    \IfStrEq{\neoschool@titlealign}{right}{%
      \begin{neo@flushright}\createonlytitle\end{neo@flushright}%
    }{%
      \begin{neo@flushleft}\createonlytitle\end{neo@flushleft}%
    }%
  }%
}

%% ==============================================================================
%% Table of Contents
%% ==============================================================================

\addto\captionsfrench{\renewcommand{\contentsname}{Sommaire}}

\ifneo@monotoc
  \colorlet{tocTitleColor}{primaryColor}
  \colorlet{tocSectionColor}{primaryColor}
  \colorlet{tocSubsectionColor}{primaryColor}
  \colorlet{tocSubsubsectionColor}{primaryColor}
\else
  \colorlet{tocTitleColor}{primaryColor}
  \colorlet{tocSectionColor}{sectionColor}
  \colorlet{tocSubsectionColor}{subsectionColor}
  \colorlet{tocSubsubsectionColor}{secondaryColorUsed!50!primaryColorUsed}
\fi

\AtBeginDocument{%
  \addtocontents{toc}{%
    \protect\hypersetup{%
      linktoc=all,%
      hidelinks%
    }%
  }
}

\ifboolexpr{bool{neo@compacttoc} or bool{neo@twocoltoc}}{
    \RequirePackage{etoc}
}{}

\newcommand{\neo@toctitle}{\section*{\contentsname}}

\ifneo@compacttoc
  \etocsetstyle{part}
    {}
    {\addvspace{2.5em plus 2pt}\nopagebreak[4]}
    {\noindent\neo@title@style\large\bfseries\color{tocTitleColor}\etocnumber\quad\etocname\hfill
     {\neo@title@style\large\bfseries\color{tocTitleColor}\etocpage}\par
     \nopagebreak[4]\vskip2pt\nopagebreak[4]%
     {\color{tocTitleColor!40}\hrule height 0.6pt}\nopagebreak[4]\vskip4pt\nopagebreak[4]}
    {}

  \etocsetstyle{section}
    {}
    {\addvspace{-0.25em plus 1pt}}
    {\noindent\sffamily\bfseries\color{tocSectionColor}\etocnumber\quad\etocname\dotfill
     {\sffamily\bfseries\color{tocSectionColor}\etocpage}\par}
    {}

  \etocsetstyle{subsection}
    {}
    {\addvspace{-0.5em plus 1pt}}
    {\hspace*{2em}\sffamily\mdseries\color{tocSubsectionColor}\etocnumber\quad\etocname\dotfill
     {\sffamily\mdseries\color{tocSubsectionColor}\etocpage}\par}
    {}

  \etocsetstyle{subsubsection}
    {}
    {\addvspace{-0.5em plus 1pt}}
    {\hspace*{4em}\sffamily\mdseries\small\color{tocSubsubsectionColor}\etocnumber\quad\etocname\dotfill
     {\sffamily\small\mdseries\color{tocSubsubsectionColor}\etocpage}\par}
    {}

  \etocsettocstyle{\neo@toctitle}{}
\fi

\ifneo@twocoltoc
  \ifneo@compacttoc\else
    \etocstandardlines
  \fi
  \etocmulticolstyle[2]{\neo@toctitle}
\fi

%% ==============================================================================
%% Section formatting utilities
%% ==============================================================================

\def\neo@align@right{right}
\def\neo@align@left{left}
\def\neo@align@center{center}

\def\neo@numstyle@circle{circle}
\def\neo@numstyle@box{box}
\def\neo@numstyle@dash{dash}
\def\neo@numstyle@plain{plain}

\def\neo@textstyle@sc{sc}
\def\neo@textstyle@upper{upper}
\def\neo@textstyle@lower{lower}

\def\neo@style@ornaments{ornaments}
\def\neo@style@underline{underline}
\def\neo@style@normal{normal}
\def\neo@style@highlighted{highlighted}
\def\neo@style@shaded{shaded}
\def\neo@style@shadedline{shadedline}

\newcommand{\neo@dynamicvspace}[1]{%
  \vspace{\dimexpr #1 * \neo@vspace@factor\relax}%
}

\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
    \node[shape=circle,draw,inner sep=2pt,line width=1.5pt,baseline=-1.25mm] (char) {#1};}
  \vspace{-2pt}
}

\newcommand*{\IfSCAvailableTF}{%
  \ifcsname\f@encoding/\f@family/\f@series/sc\endcsname
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
}

\newcommand{\applytextstyle}[1]{%
  \Ifstr{\neoschool@sectiontextstyle}{sc}{%
    \IfSCAvailableTF{\scshape\Large\neo@title@other@style #1}{\MakeUppercase{\large \neo@title@style #1}}%
  }{%
    \Ifstr{\neoschool@sectiontextstyle}{upper}{%
      \MakeUppercase{\large \neo@title@other@style #1}%
    }{%
      \Ifstr{\neoschool@sectiontextstyle}{lower}{%
        {\large\neo@title@other@style\upshape #1}%
      }{%
        \neo@title@other@style\Large #1%
      }%
    }%
  }%
}

\renewcommand{\sectionformat}{%
  \Ifstr{\neoschool@sectionnumstyle}{circle}{%
    \circled{{\large\neo@title@other@style\thesection}}\enskip%
  }{%
    \Ifstr{\neoschool@sectionnumstyle}{box}{%
      \raisebox{0ex}{%
        \setlength{\fboxrule}{1.5pt}%
        \fcolorbox{sectionColor}{backgroundColor}{%
          \color{sectionColor}%
          \csname\neoschool@headstyle\endcsname
          \csname\neoschool@headweight\endcsname
          \large\thesection%
        }%
      }\enskip%
    }{%
      \Ifstr{\neoschool@sectionnumstyle}{dash}{%
        \neo@title@style\thesection\enskip\textendash\enskip
      }{%
        \neo@title@style\thesection\autodot\enskip
      }%
    }%
  }%
}

\newcommand{\setsectionraggedstyle}{%
  \Ifstr{\neoschool@sectionalign}{right}{%
    \renewcommand*{\raggedsection}{\raggedleft}%
  }{%
    \Ifstr{\neoschool@sectionalign}{left}{%
      \renewcommand*{\raggedsection}{\raggedright}%
    }{%
      \renewcommand*{\raggedsection}{\centering}%
    }%
  }%
}

\renewcommand{\sectionlinesformat}[4]{%
  \Ifstr{#1}{section}{%
    \Ifstr{\neoschool@sectionstyle}{ornaments}{%
      \sectionformat@ornaments{#3}{#4}%
    }{%
      \Ifstr{\neoschool@sectionstyle}{highlighted}{%
        \sectionformat@highlighted{#3}{#4}%
      }{%
        \Ifstr{\neoschool@sectionstyle}{shaded}{%
          \sectionformat@shaded{#3}{#4}%
        }{%
          \Ifstr{\neoschool@sectionstyle}{shadedline}{%
            \sectionformat@shadedline{#3}{#4}%
          }{%
            \Ifstr{\neoschool@sectionstyle}{normal}{%
              \sectionformat@normal{#2}{#3}{#4}%
            }{%
              \sectionformat@other{#3}{#4}%
            }%
          }%
        }%
      }%
    }%
  }{%
    \@hangfrom{\hskip #2#3}{#4}%
  }%
}

\newcommand{\sectionformat@normal}[3]{%
  \setsectionraggedstyle
  \parbox[t]{\linewidth}{%
    \raggedsection
    \@hangfrom{\color{sectionColor}#2}{%
      \color{sectionColor}%
      \applytextstyle{#3}%
    }%
  }%
  \par\nobreak
}

\newcommand{\sectionformat@ornaments}[2]{%
  \setsectionraggedstyle
  \raggedsection
  \vspace*{0.5em}%
  \Ifstr{\neoschool@sectionalign}{center}{%
    {\color{sectionColor}\adforn{36}}\enskip{\color{sectionColor}#1\applytextstyle{#2}}\enskip{\color{sectionColor}\adforn{36}}%
  }{%
    \Ifstr{\neoschool@sectionalign}{left}{%
      {\color{sectionColor}#1\applytextstyle{#2}}\enskip{\color{sectionColor}\adforn{36}}%
    }{%
      {\color{sectionColor}\adforn{36}}\enskip{\color{sectionColor}#1\applytextstyle{#2}}%
    }%
  }%
  \par\nobreak
  \vspace*{0.2em}%
}

\newcommand{\setsectiontikzalign}{%
  \ifx\neoschool@sectionalign\neo@align@left
    left%
  \else
    \ifx\neoschool@sectionalign\neo@align@right
      right%
    \else
      center%
    \fi
  \fi
}

\newcommand{\setsectiontikzcolor}[1]{%
  \ifx\neoschool@sectionalign\neo@align@left
    \ifnum\pdf@strcmp{#1}{left}=0
      sectionColor!120
    \else
      sectionColor!20
    \fi
  \else
    \ifx\neoschool@sectionalign\neo@align@right
      \ifnum\pdf@strcmp{#1}{right}=0
        sectionColor!120
      \else
        sectionColor!20
      \fi
    \else
      sectionColor!25
    \fi
  \fi
}

\newcommand{\setsectiontikzmiddle}{%
  \ifx\neoschool@sectionalign\neo@align@left
    sectionColor!90
  \else
    \ifx\neoschool@sectionalign\neo@align@right
      sectionColor!90
    \else
      sectionColor!120
    \fi
  \fi
}

\newcommand{\sectionformat@highlighted}[2]{%
  \noindent\begin{tikzpicture}[baseline]
    \node[
    anchor=base,
    align=\setsectiontikzalign,
    text width=.985\linewidth,
    text=titleColor,
    line width=0.5pt,
    fill=titleColor!15,
    rounded corners=\neoschool@sectionarc,
    ] (title) {%
      #1\applytextstyle{#2}%
    };
  \end{tikzpicture}%
  \par%
}

\newcommand{\sectionformat@shaded}[2]{%
  \noindent\begin{tikzpicture}[baseline]
    \node[
    anchor=base,
    align=\setsectiontikzalign,
    text width=.985\linewidth,
    text=backgroundColor,
    line width=0.5pt,
    left color={\setsectiontikzcolor{left}},
    right color={\setsectiontikzcolor{right}},
    middle color={\setsectiontikzmiddle},
    rounded corners=\neoschool@sectionarc,
    ] (title) {%
      #1\applytextstyle{#2}%
    };
  \end{tikzpicture}%
  \par%
}

\newcommand{\sectionformat@shadedline}[2]{%
  \noindent
  \begin{tikzpicture}[baseline]
    \node[
      text=sectionColor,
      anchor=base,
      inner sep=0pt,
      outer sep=0pt,
      align=\setsectiontikzalign,
      text width=\linewidth
    ] (title) {%
      \color{sectionColor}%
      #1\applytextstyle{#2}%
    };

    \ifx\neoschool@sectionalign\neo@align@center

      \shade[
        left color=sectionColor!20,
        right color=sectionColor
      ]
        ([yshift=-0.5em]title.south west)
        rectangle
        ([yshift=-0.6em]title.south west -| {title.south west + (0.33*\linewidth,0)});

      \shade[
        left color=sectionColor,
        middle color=sectionColor!120,
        right color=sectionColor
      ]
        ([yshift=-0.5em]title.south west -| {title.south west + (0.33*\linewidth,0)})
        rectangle
        ([yshift=-0.6em]title.south east -| {title.south west + (0.66*\linewidth,0)});

      \shade[
        left color=sectionColor,
        right color=sectionColor!20
      ]
        ([yshift=-0.5em]title.south east -| {title.south west + (0.66*\linewidth,0)})
        rectangle
        ([yshift=-0.6em]title.south east);

    \else
      \ifx\neoschool@sectionalign\neo@align@left
        \shade[
          left color=sectionColor,
          right color=sectionColor!20
        ]
          ([yshift=-0.5em]title.south west)
          rectangle
          ([yshift=-0.6em]title.south east);

      \else
        \shade[
          left color=sectionColor!20,
          right color=sectionColor
        ]
          ([yshift=-0.5em]title.south west)
          rectangle
          ([yshift=-0.6em]title.south east);
      \fi
    \fi

  \end{tikzpicture}%
  \par
}

\newcommand{\sectionformat@other}[2]{%
  \setsectionraggedstyle
  \Ifstr{\neoschool@sectionstyle}{underline}{%
    \sectionformat@underline{#1}{#2}%
  }{%
    \sectionformat@default{#1}{#2}%
  }%
}

\newcommand{\sectionformat@underline}[2]{%
  \parbox[t]{\linewidth}{%
    \raggedsection
    {\color{sectionColor}#1\applytextstyle{#2}}%
    \par\nobreak
    \kern-.75\ht\strutbox\color{sectionColor!30}\rule{\linewidth}{1pt}%
  }%
}

\newcommand{\sectionformat@default}[2]{%
  \raggedsection
  {\color{sectionColor}#1\applytextstyle{#2}}%
  \par\nobreak
}

%% ==============================================================================
%% Abstract formatting
%% ==============================================================================

\newcommand{\neo@format@text}[1]{%
  \Ifstr{\neoschool@sectiontextstyle}{sc}{%
    \IfSCAvailableTF{\scshape #1}{\MakeUppercase{#1}}%
  }{%
    \Ifstr{\neoschool@sectiontextstyle}{upper}{%
      \MakeUppercase{#1}%
    }{%
      \Ifstr{\neoschool@sectiontextstyle}{lower}{%
        {\upshape #1}%
      }{%
        #1%
      }%
    }%
  }%
}

\if@twocolumn
  \renewenvironment{abstract}{%
    \begin{strip}
      \vspace{-2.5em}
      \def\@tempabstract{DEFAULT}%
      \quotation
      \ifneoschool@inlineabstract
        \noindent
        {%
          \normalfont\neo@main@title@@style\color{titleColor}\normalsize
          \ifx\neoschool@abstracttitle\@tempabstract\abstractname\else\neoschool@abstracttitle\fi.~%
        }%
        \ignorespaces%
      \else
        \ifx\neoschool@abstracttitle\@empty\else
          {\noindent\centering
            \normalfont\neo@main@title@@style\color{titleColor}\normalsize
            \neo@format@text{\ifx\neoschool@abstracttitle\@tempabstract\abstractname\else\neoschool@abstracttitle\fi}\par}
          \vspace{1ex}
        \fi
      \fi}
    {\vspace{1ex}\endquotation\end{strip}}
\else
  \renewenvironment{abstract}{%
    \def\@tempabstract{DEFAULT}%
    \quotation
    \ifneoschool@inlineabstract
      \noindent
      {%
        \normalfont\neo@main@title@@style\color{titleColor}\normalsize
        \ifx\neoschool@abstracttitle\@tempabstract\abstractname\else\neoschool@abstracttitle\fi.~%
      }%
    \else
      \ifx\neoschool@abstracttitle\@empty\else
        {\noindent\centering
          \normalfont\neo@main@title@@style\color{titleColor}\normalsize
          \neo@format@text{\ifx\neoschool@abstracttitle\@tempabstract\abstractname\else\neoschool@abstracttitle\fi}\par}
        \vspace{1ex}
      \fi
    \fi
  }{\endquotation}
\fi

%% ==============================================================================
%% Part Formatting
%% ==============================================================================

\renewcommand*{\partformat}{%
  \textcolor{titleColor}{%
    \neo@title@style
    \huge
    {\usekomafont{partnumber}\partname~\thepart}
  }%
}

\RedeclareSectionCommand[beforeskip=5em]{part}

\renewcommand{\partlineswithprefixformat}[3]{%
  \centering
  \begin{minipage}{\textwidth}%
    \centering
    {#2}%
    \par
    \vspace{0.5em}%
    {\color{titleColor!30}\rule{0.5\linewidth}{2pt}}%
    \par
    \vspace{0.75em}%
    {\usekomafont{part}#3}%
  \end{minipage}%
  \par\nobreak
  \vspace{1.5em}%
}

%% ==============================================================================
%% Header and Footer Styles and Setting
%% ==============================================================================

\newlength{\neo@leftmargin}
\AtBeginDocument{\setlength{\neo@leftmargin}{\dimexpr 1in + \hoffset + \oddsidemargin\relax}}

\def\neo@header@type{}
\def\neo@header@school{}
\def\neo@header@academy{}
\def\neo@header@level{}
\def\neo@header@duration{}
\def\neo@header@calculator{}
\def\neo@header@leftcontent{}
\def\neo@header@rightcontent{}
\def\neo@header@leftcontentfill{}
\def\neo@header@rightcontentfill{}

\define@key[neo]{header}{type}{\def\neo@header@type{#1}}
\define@key[neo]{header}{school}{\def\neo@header@school{#1}}
\define@key[neo]{header}{academy}{\def\neo@header@academy{#1}}
\define@key[neo]{header}{level}{\def\neo@header@level{#1}}
\define@key[neo]{header}{duration}{\def\neo@header@duration{#1}}
\define@key[neo]{header}{calculator}{%
  \IfStrEqCase{#1}{%
    {true}{\def\neo@header@calculator{true}}%
    {false}{\def\neo@header@calculator{false}}%
    {exam}{\def\neo@header@calculator{exam}}%
  }[%
  \PackageError{neoschool}{Invalid calculator value: #1}%
  {Use 'true', 'false' or 'exam'}%
  ]%
}
\define@key[neo]{header}{leftcontent}{\def\neo@header@leftcontent{#1}}
\define@key[neo]{header}{rightcontent}{\def\neo@header@rightcontent{#1}}
\define@key[neo]{header}{leftcontentfill}{\def\neo@header@leftcontentfill{#1}}
\define@key[neo]{header}{rightcontentfill}{\def\neo@header@rightcontentfill{#1}}

\presetkeys[neo]{header}{%
  type={Évaluation},%
  school={CSI Lyon},%
  academy={Lyon},%
  level={Terminale},%
  duration={1 heure},%
  calculator=true,%
  leftcontent={\faBookOpen},%
  rightcontent={\faSchool},%
  leftcontentfill=true,%
  rightcontentfill=true%
}{}

\newcommand{\neoheader}[1]{%
  \setkeys[neo]{header}{#1}%
}

\newif\ifneoheaderused
\neoheaderusedfalse

\let\neo@original@header\neoheader
\renewcommand{\neoheader}[1]{%
  \neoheaderusedtrue
  \neo@original@header{#1}%
}

\AtEndPreamble{%
  \ifneoheaderused\else
    \setkeys[neo]{header}{}%
  \fi
}

% Header configurations
\ifx\neo@pagestyle\@undefined
  \def\neo@pagestyle{followingpages}
\fi

\ifneo@fullheader
  \ihead{\neo@header@type}
  \chead{\@title}
  \ohead{\neo@header@level}
  \innerfoot{\@date}
  \cfoot{\neo@header@school}
  \ofoot{\pagemark}
  \def\neo@pagestyle{scrheadings}
  \neo@firstpagestyleoverridefalse
\fi

\pagestyle{\neo@pagestyle}

\ifneo@firstpagestyleoverride
  \def\neo@tempstyle{empty}
  \ifx\neo@pagestyle\neo@tempstyle
    \let\ps@firstpage\ps@empty
    \let\ps@pagenum\ps@empty
  \else
    \let\ps@firstpage\ps@pagenum
  \fi
\fi

\thispagestyle{firstpage}

\ExplSyntaxOn
\str_case:VnF \neoschool@headerules
{
  {headrule} { \KOMAoptions{headsepline=.4pt} }
  {footrule} { \KOMAoptions{footsepline=.4pt} }
  {headfootrule} { \KOMAoptions{headsepline=.4pt, footsepline=.4pt} }
  {none} { }
}
{ }
\ExplSyntaxOff

%% ==============================================================================
%% Evaluation Headers and Special Styles
%% ==============================================================================

%% Dimensions and Basic Configuration
%% ----------------------------------
\newlength{\neo@headerheight}
\setlength{\neo@headerheight}{35mm}

\newlength{\neo@iconsize}
\setlength{\neo@iconsize}{1.5cm}

\newlength{\neo@default@top@ref}
\if@twocolumn
  \setlength{\neo@default@top@ref}{1.5cm}\else\setlength{\neo@default@top@ref}{1.65cm}\fi

\newlength{\neo@current@total@topspace}
\newlength{\neo@compensation@value}

\newcommand{\neo@top@compensate}{%
  \setlength{\neo@current@total@topspace}{\dimexpr 1in + \voffset + \topmargin + \headheight + \headsep \relax}%
  \setlength{\neo@compensation@value}{\dimexpr \neo@default@top@ref - \neo@current@total@topspace \relax}%
  \vspace*{\neo@compensation@value}%
}

\newcommand{\neo@vspace@short}{%
  \neo@top@compensate%
  \if@twocolumn
    \vspace{2\baselineskip}%
  \else
    \vspace{\baselineskip}%
  \fi
}

\newcommand{\neo@vspace@eval}{%
  \neo@top@compensate%
  \ifx\@subject\empty
    \ifx\@subtitle\empty
      \if@twocolumn \vspace{4.35\baselineskip}\else \vspace{2.75\baselineskip}\fi
    \else
      \if@twocolumn \vspace{5.35\baselineskip}\else \vspace{3.75\baselineskip}\fi
    \fi
  \else
    \ifx\@subtitle\empty
      \if@twocolumn \vspace{5.35\baselineskip}\else \vspace{3.75\baselineskip}\fi
    \else
      \if@twocolumn \vspace{6.35\baselineskip}\else \vspace{4.75\baselineskip}\fi
    \fi
  \fi
}

\newcommand{\neo@vspace@evalicons}{%
  \neo@top@compensate%
  \if@twocolumn
    \vspace{6\baselineskip}%
  \else
    \vspace{4.75\baselineskip}%
  \fi
}

\newcommand{\neo@title@final@gap}{%
  \if@twocolumn
    \vspace{1.5\baselineskip}%
  \else
    \vspace{0.75\baselineskip}%
  \fi
}

\newcommand{\neo@short@exam@gap}{%
  \if@twocolumn
    \vspace{2.5\baselineskip}%
  \else
    \vspace{1.5\baselineskip}%
  \fi
}

\newcommand{\neo@vspace@bubbles}{%
  \neo@top@compensate%
  \if@twocolumn
    \vspace{5cm}%
  \else
    \vspace{4cm}%
  \fi
}

%% Colors Setup
%% ----------------------------------
\newcommand{\neo@setupevalcolors}{%
  \def\neo@evalrulecolor{\neoschool@headfootcolor!25!backgroundColor}%
}

%% Basic Title Components
%% ----------------------------------

\def\neo@titleblock@yshift{-20mm}

\newcommand{\neo@completetitle}[1][]{%
  \node[
  align=center,
  anchor=center,
  text width=0.75\textwidth,
  #1
  ] (title) at ([yshift=\neo@titleblock@yshift]current page.north) {%
    \baselineskip=30pt
    \csname\neoschool@titlestyle\endcsname
    \csname\neoschool@titleweight\endcsname
    \csname\neoschool@titleshape\endcsname
    \color{titleColor}\usekomafont{title}{\@title}
  };

  \ifx\@subject\empty\else
    \node[
    above=1.5mm of title.north,
    anchor=south,
    text width=0.85\textwidth,
    align=center,
    ] {%
      \usekomafont{subject}{\textls[50]{\MakeUppercase{\@subject}}}
    };
  \fi

  \ifx\@subtitle\empty\else
    \node[
    below=1.5mm of title.south,
    anchor=north,
    text width=0.85\textwidth,
    align=center,
    ] {%
      \usekomafont{subtitle}{\@subtitle}
    };
  \fi
}

\newcommand{\neo@completegradetitle}[1][]{%
  \ifx\@subject\empty
    \ifx\@subtitle\empty
      \def\neo@grade@title@yshift{-4.25\baselineskip}
      \def\neo@grade@duration@yshift{-6.25\baselineskip}
      \def\neo@grade@name@yshift{-7.75\baselineskip}
      \if@twocolumn \gdef\neo@vspace@grade@before{\vspace{6.5\baselineskip}}
      \else \gdef\neo@vspace@grade@before{\vspace{6\baselineskip}}\fi
    \else
      \def\neo@grade@title@yshift{-4.25\baselineskip}
      \def\neo@grade@duration@yshift{-7.75\baselineskip}
      \def\neo@grade@name@yshift{-9.25\baselineskip}
      \if@twocolumn \gdef\neo@vspace@grade@before{\vspace{8\baselineskip}}
      \else \gdef\neo@vspace@grade@before{\vspace{7.5\baselineskip}}\fi
    \fi
  \else
    \ifx\@subtitle\empty
      \def\neo@grade@title@yshift{-5.25\baselineskip}
      \def\neo@grade@duration@yshift{-7.25\baselineskip}
      \def\neo@grade@name@yshift{-8.75\baselineskip}
      \if@twocolumn \gdef\neo@vspace@grade@before{\vspace{7.5\baselineskip}}
      \else \gdef\neo@vspace@grade@before{\vspace{7\baselineskip}}\fi
    \else
      \def\neo@grade@title@yshift{-5.25\baselineskip}
      \def\neo@grade@duration@yshift{-8.85\baselineskip}
      \def\neo@grade@name@yshift{-10.35\baselineskip}
      \if@twocolumn \gdef\neo@vspace@grade@before{\vspace{9\baselineskip}}
      \else \gdef\neo@vspace@grade@before{\vspace{8.5\baselineskip}}\fi
    \fi
  \fi

  \node[
  align=center,
  anchor=center,
  text width=0.85\textwidth,
  #1
  ] (title) at ([yshift=\neo@grade@title@yshift]current page.north) {%
    \baselineskip=30pt
    \csname\neoschool@titlestyle\endcsname
    \csname\neoschool@titleweight\endcsname
    \csname\neoschool@titleshape\endcsname
    \color{titleColor}\usekomafont{title}{\@title}
  };

  \ifx\@subject\empty\else
    \node[
    above=1.5mm of title.north,
    anchor=south,
    text width=0.85\textwidth,
    align=center,
    ] {%
      \usekomafont{subject}{\textls[50]{\MakeUppercase{\@subject}}}
    };
  \fi

  \ifx\@subtitle\empty
  \else
    \node[
    below=1.5mm of title.south,
    anchor=north,
    text width=0.85\textwidth,
    align=center,
    ] {%
      \usekomafont{subtitle}{\large\@subtitle}
    };
  \fi

  \node[
  anchor=north,
  align=center,
  font=\small\sffamily,
  yshift=\neo@grade@duration@yshift
  ] at (current page.north) {%
    \neo@durationtxt{} \neo@header@duration\quad\textbullet\quad\neo@calculator
  };

  \node[
  anchor=north,
  align=center,
  font=\small\sffamily,
  yshift=\neo@grade@name@yshift
  ] at (current page.north) {%
    \color{\neoschool@globalcolor}\neo@nametxt{} \vardots[4cm]
  };
}

%% ==============================================================================
%% Enhanced Header without Icons
%% ==============================================================================

%% Configuration for Simple Header
%% ----------------------------------
\newcommand{\neo@setupheaderconfig}{%
  \edef\neo@leftcornershift{\dimexpr(\paperwidth - \textwidth)/4-5pt\relax}%
  \edef\neo@rightcornershift{\dimexpr(\paperwidth - \textwidth)/4\relax}%
  \def\neo@topyshift{8mm}%
  \def\neo@topyshiftgrade{8mm}%
  \def\neo@bottomyshift{40mm}
}

%% Corner Text Nodes
%% ----------------------------------
\newcommand{\neo@cornernode}[4]{%
  \node[
  anchor=#1,
  font={\color{\neoschool@headfootcolor}\small\sffamily}
  ] at ([xshift=#2,yshift=-#3]current page.north #1) {%
    \begingroup
    #4%
    \endgroup
  };
}

%% ==============================================================================
%% Header with Icons
%% ==============================================================================

%% Icon Node Definition
%% ----------------------------------
\newcommand{\neo@iconnode}[5]{%
  % Icon node with color inversion
  \node[
  rectangle,
  minimum height=\neo@iconsize,
  minimum width=\neo@iconsize,
  fill=backgroundColor,
  text=titleColor,
  draw=titleColor,
  line width=0.5pt,
  anchor=center,
  font=\Large,
  rounded corners=2pt
  ] (#1) at #2 {#3};

  % Top text
  \node[
  above=2mm of #1,
  anchor=south,
  font={\color{\neoschool@headfootcolor}\small\sffamily}
  ] (#1-top) {%
    \begingroup
    #4%
    \endgroup
  };

  % Bottom text
  \node[
  below=2mm of #1,
  anchor=north,
  font={\color{\neoschool@headfootcolor}\small\sffamily}
  ] (#1-bottom) {%
    \begingroup
    #5%
    \endgroup
  };
}

%% ==============================================================================
%% Header Type Selection and Setup
%% ==============================================================================

\newcommand{\neo@basetitlecontent}{%
  \begin{tikzpicture}[remember picture,overlay]
    \neo@completetitle
  \end{tikzpicture}%
}

%% Header without Icons
\newcommand{\neo@evalcontent}{%
  \thispagestyle{pagenum}
  \neo@setupevalcolors
  \neo@setupheaderconfig

  \ifx\@subject\empty
    \ifx\@subtitle\empty
      \def\neo@titleblock@yshift{-16mm}
      \def\neo@adjustedbottomyshift{24mm}
      \def\neo@adjustedruleposition{-0.85\neo@headerheight}
    \else
      \def\neo@titleblock@yshift{-16mm}
      \def\neo@adjustedbottomyshift{29mm}
      \def\neo@adjustedruleposition{-\neo@headerheight}
    \fi
  \else
    \ifx\@subtitle\empty
      \def\neo@titleblock@yshift{-22mm}
      \def\neo@adjustedbottomyshift{29mm}
      \def\neo@adjustedruleposition{-\neo@headerheight}
    \else
      \def\neo@titleblock@yshift{-20mm}
      \def\neo@adjustedbottomyshift{34mm}
      \def\neo@adjustedruleposition{-1.1\neo@headerheight}
    \fi
  \fi

  \begin{tikzpicture}[remember picture,overlay]
    \draw[\neo@evalrulecolor,line width=\neo@decorativerule]
    ([yshift=\neo@adjustedruleposition]current page.north west) --
    ([yshift=\neo@adjustedruleposition]current page.north east);
    \neo@completetitle
    \neo@cornernode{west}{\neo@leftcornershift}{\neo@topyshift}{\neo@header@type}
    \neo@cornernode{east}{-\neo@rightcornershift}{\neo@topyshift}{\neo@header@school}
    \neo@cornernode{west}{\neo@leftcornershift}{\neo@adjustedbottomyshift}{\neo@header@level}
    \neo@cornernode{east}{-\neo@rightcornershift}{\neo@adjustedbottomyshift}{\@date}
  \end{tikzpicture}%
  \neo@vspace@eval
}

%% Header with Icons
\newcommand{\neo@evaliconscontent}{%
  \thispagestyle{pagenum}
  \neo@setupevalcolors
  \begin{tikzpicture}[remember picture,overlay]
    \draw[\neo@evalrulecolor,line width=\neo@decorativerule]
    ([yshift=-1.125\neo@headerheight]current page.north west) --
    ([yshift=-1.125\neo@headerheight]current page.north east);
    \neo@completetitle
    \neo@iconnode{typeicon}
    {([xshift=30mm,yshift=-0.575\neo@headerheight]current page.north west)}
    {\neo@header@leftcontent}
    {\neo@header@type}
    {\neo@header@level}
    \neo@iconnode{schoolicon}
    {([xshift=-30mm,yshift=-0.575\neo@headerheight]current page.north east)}
    {\neo@header@rightcontent}
    {\neo@header@school}
    {\@date}
  \end{tikzpicture}%
  \neo@vspace@evalicons
}

%% Header with grading strip without Icons
\newcommand{\neo@evalgradecontent}{%
  \thispagestyle{empty}
  \neo@setupevalcolors
  \neo@setupheaderconfig
  \begin{tikzpicture}[remember picture,overlay]
    \neo@completegradetitle
    \neo@cornernode{west}{\neo@leftcornershift}{\neo@topyshiftgrade}{\neo@header@type}
    \neo@cornernode{east}{-\neo@rightcornershift}{\neo@topyshiftgrade}{\neo@header@level}

    \node[
    anchor=west,
    font={\small\sffamily}
    ] at ([xshift=\neo@leftcornershift,yshift=9mm]current page.south west) {%
      \color{\neoschool@headfootcolor}\@date%
    };

    \node[
    anchor=east,
    font={\small\sffamily}
    ] at ([xshift=-\neo@rightcornershift,yshift=9mm]current page.south east) {%
      \color{\neoschool@headfootcolor}\neo@header@school%
    };

    \node[
    font=\small\sffamily,
    inner sep=3mm
    ] at ([yshift=9mm]current page.south) {%
      \color{\neoschool@headfootcolor}\thepage
    };
  \end{tikzpicture}%
  \neo@vspace@grade@before

  \ifx\neoschool@totalpoints\@empty\gradingstrip\else\gradingstrip[\neoschool@totalpoints]\fi
  \neo@title@final@gap
}

%% Header with grading strip with Icons
\newcommand{\neo@evaliconsgradecontent}{%
  \thispagestyle{pagenum}
  \begin{tikzpicture}[remember picture,overlay]
    \neo@completegradetitle
    \neo@iconnode{typeicon}
    {([xshift=30mm,yshift=-0.675\neo@headerheight]current page.north west)}
    {\neo@header@leftcontent}
    {\neo@header@type}
    {\neo@header@level}
    \neo@iconnode{schoolicon}
    {([xshift=-30mm,yshift=-0.675\neo@headerheight]current page.north east)}
    {\neo@header@rightcontent}
    {\neo@header@school}
    {\@date}
  \end{tikzpicture}%
  \neo@vspace@grade@before

  \ifx\neoschool@totalpoints\@empty\gradingstrip\else\gradingstrip[\neoschool@totalpoints]\fi
  \neo@title@final@gap
}

%% Calculator Notice
%% ----------------------------------
\newcommand{\neo@calculator}{%
  \small \neo@calcintro{}%
  \def\@tempa{true}%
  \def\@tempb{exam}%
  \ifx\neo@header@calculator\@tempa
    ~\neo@calcallowed.%
  \else
    \ifx\neo@header@calculator\@tempb
      ~\neo@calcallowed{} \neo@calcexammodeonly{} \neo@calcexammode.%
    \else
      ~\neo@calcnotallowed.%
    \fi
  \fi
  \par
}

%% Exam Header
%% ----------------------------------
%% Exam style helper commands and setup
\newcommand{\neo@gettext}[1]{%
  \ifneo@french
    \ifcase#1\or Établissement\or Nom\or Classe\or Durée\or Date\or Note\or Appréciation\fi
  \else\ifneo@german
      \ifcase#1\or Einrichtung\or Name\or Klasse\or Dauer\or Datum\or Note\or Bewertung\fi
    \else
      \ifcase#1\or Institution\or Name\or Class\or Duration\or Date\or Mark\or Appreciation\fi
    \fi\fi
}

\newcommand{\examfield}[2]{%
  \textbf{#1}\hspace{0.5em}#2%
}

%% Exam title style
\newcommand{\neo@examcontent}{%
  \thispagestyle{customfirstpage}
  \vspace*{-2cm}%
  \begin{tcolorbox}[%
    enhanced,
    frame hidden,
    colback=backgroundColor,
    colupper=\neoschool@globalcolor,
    top=\baselineskip,
    bottom=\baselineskip,
    left=0pt,
    right=0pt,
    width=\textwidth,
    after skip=0pt,
    ]
    {\renewcommand\arraystretch{1.25}%
      \begin{tblr}{X[4,l]X[2,c]X[3,r]}
        \examfield{\neo@gettext{1} :}{\neo@header@school} &  &
                                                               \examfield{\neo@gettext{5} :}{\@date}                  \\
        \examfield{\neo@gettext{2} :}{\vardots[4cm]}      &  &
                                                               \examfield{\neo@gettext{3} :}{\neo@header@level}
      \end{tblr}
    }

    \vspace{\baselineskip}
    \centering

    \begin{minipage}[c]{\linewidth}
      \centering\color{\neoschool@globalcolor}
      \neo@header@type
    \end{minipage}\vspace{.75\baselineskip}

    \csname\neoschool@titlestyle\endcsname
    \csname\neoschool@titleweight\endcsname
    \csname\neoschool@titleshape\endcsname
    \color{titleColor}
    \usekomafont{title}{\@title}\vspace{.65\baselineskip}

    \normalsize\normalfont\color{\neoschool@globalcolor}
    \begin{minipage}[c]{\linewidth}
      \centering
      \examfield{\neo@gettext{4} :}{\neo@header@duration}\vspace{\baselineskip}

      \neo@calculator
    \end{minipage}
  \end{tcolorbox}

  \medskip

  \ifx\neoschool@totalpoints\@empty\gradingstrip\else\gradingstrip[\neoschool@totalpoints]\fi

  \neo@title@final@gap
}

%% French Exam Headers
%% ----------------------------------
% Common exam title commands
\NewDocumentCommand{\neo@examtitle}{m}{%
  {\color{titleColor}
    \csname\neoschool@titlestyle\endcsname
    \csname\neoschool@titleweight\endcsname
    \csname\neoschool@titleshape\endcsname
    \LARGE\MakeUppercase{#1}\par}
}

\NewDocumentCommand{\neo@examsubtitle}{m}{%
  {\color{titleColor!85!\neoschool@globalcolor}
    \csname\neoschool@titlestyle\endcsname
    \Large #1\par}
}

\NewDocumentCommand{\neo@examinfo}{m}{%
  {\color{titleColor!75!\neoschool@globalcolor}
    \csname\neoschool@titlestyle\endcsname
    \large #1\par}
}

%% Mock exam style
\newcounter{mockexampages}
\AtEndDocument{%
  \immediate\write\@auxout{%
    \string\setcounter{mockexampages}{\thepage}%
  }%
}
\newcommand{\neo@mockexamcontent}{%
  \vspace*{1cm}%
  \begin{center}
    {\textsc{\neo@examinfo{\neo@header@school}}}
    \vspace*{1cm}%
    {\textsc{\neo@examinfo{\neo@academytxt{} \neo@header@academy}}}
    \vspace*{\stretch{2.5}}%

    {\LARGE\bfseries\csname\neoschool@headstyle\endcsname
      \csname\neoschool@headweight\endcsname
      \csname\neoschool@headshape\endcsname
      \neo@examtitle{\neo@header@type}}
    \vspace*{0.8cm}%
    {\color{titleColor!75!\neoschool@globalcolor}\itshape \neo@sessiontxt{} \@date}
    \vspace*{1.5cm}%

    {\Large\csname\neoschool@headstyle\endcsname
      \csname\neoschool@headweight\endcsname
      \csname\neoschool@headshape\endcsname
      \neo@examsubtitle{\neo@examoftxt{} \MakeUppercase{\@subject}}}
    \vspace*{1cm}%
    {\neo@examinfo{\neo@header@level}}
    \vspace*{\stretch{2}}%

    {\textit{\neo@durationtxt{} \neo@header@duration}}
    \vspace*{1.2cm}%

    \begin{minipage}{0.8\textwidth}
      \begin{center}
        \setlength{\baselineskip}{1.6\baselineskip}%
        \neo@calculator
        \vspace*{0.8cm}%
        \neo@examqualitytxt{}
        \vspace*{0.8cm}
        \neo@examattempttxt{}
      \end{center}
    \end{minipage}
    \vspace*{\stretch{1.5}}%

    {\color{titleColor!65!\neoschool@globalcolor}%
      \neo@pagestxt{} \arabic{mockexampages}~\neo@pagesfromtxt{} 1/\arabic{mockexampages} \neo@pagestotxt{} \arabic{mockexampages}/\arabic{mockexampages}.}
    \vspace*{1.5cm}%
  \end{center}
  \thispagestyle{pagenum}%
  \clearpage\newpage
}

\newcommand{\neo@shortexamcontent}{%
  \thispagestyle{customfirstpage}
  \vspace*{-1cm}
  \begin{center}

    {\neo@header@school}

    \vspace{3mm}
    {\Large \csname\neoschool@headstyle\endcsname
      \csname\neoschool@headweight\endcsname
      \csname\neoschool@headshape\endcsname
      \neo@examtitle{\neo@header@type}}

    \vspace{3mm}
    {\small \textit{\neo@sessiontxt{} \@date}}

    \vspace{5mm}
    {\large \csname\neoschool@headstyle\endcsname
      \csname\neoschool@headweight\endcsname
      \csname\neoschool@headshape\endcsname
      \neo@examsubtitle{\neo@examoftxt{} \@subject}}

    \vspace{3mm}
    {\small \neo@examinfo{\neo@header@level}}

    \vspace{5mm}
    {\small \textit{\neo@durationtxt{} \neo@header@duration}}

    \vspace{5mm}
    \neo@calculator

    \vspace{8mm}
    {\color{\neoschool@headfootcolor}%
      \rule{0.5\linewidth}{0.5pt}}

  \end{center}
  \neo@short@exam@gap
}

%% Short Eval Header Style
%% ----------------------------------
\newlength{\sideWidth}
\setlength{\sideWidth}{4.5cm}

\newcommand{\neo@shortevalcontent}{%
  \thispagestyle{customfirstpage}
  \begin{tikzpicture}[remember picture,overlay]
    \draw[line width=\neo@decorativerule, \neoschool@headfootcolor!50!backgroundColor]
    ([yshift=-21mm]current page.north west) --
    ([yshift=-21mm]current page.north east);
    \path let \p1=(current page.east) in node[
    anchor=west,
    align=left,
    text width=\sideWidth,
    font=\small\sffamily,
    text=\neoschool@headfootcolor
    ] at ([xshift=0.75cm,yshift=-11mm]current page.north west)
    {\neo@nametxt{} \\[1mm]
      \neo@header@type};
    \path let \p1=(current page.east) in node[
    anchor=center,
    align=center,
    text width={\dimexpr\paperwidth-2\sideWidth-0.25cm},
    ] at ([yshift=-11mm]current page.north)
    {\color{titleColor}%
      \csname\neoschool@titlestyle\endcsname%
      \csname\neoschool@titleweight\endcsname%
      \csname\neoschool@titleshape\endcsname%
      \usekomafont{title}\@title};
    \path let \p1=(current page.east) in node[
    anchor=east,
    align=right,
    text width=\sideWidth,
    font=\small\sffamily,
    text=\neoschool@headfootcolor
    ] at ([xshift=-0.75cm,yshift=-11mm]current page.north east)
    {\neo@header@school\\[1mm]
      \neo@header@level};
  \end{tikzpicture}%
  \neo@vspace@short
}

%% Short Title Header Style
%% ----------------------------------
\newcommand{\neo@shorttitlecontent}{%
  \thispagestyle{customfirstpage}
  \begin{tikzpicture}[remember picture,overlay]
    \draw[line width=\neo@decorativerule, \neoschool@headfootcolor!50!backgroundColor]
    ([yshift=-21mm]current page.north west) --
    ([yshift=-21mm]current page.north east);

    \def\neo@node@anchor{center}
    \def\neo@node@align{center}
    \def\neo@node@pos{current page.north}
    \def\neo@node@xshift{0cm}

    \ifx\neoschool@titlealign\neo@left
      \def\neo@node@anchor{west}
      \def\neo@node@align{left}
      \def\neo@node@pos{current page.north west}
      \def\neo@node@xshift{1cm}
    \fi

    \ifx\neoschool@titlealign\neo@right
      \def\neo@node@anchor{east}
      \def\neo@node@align{right}
      \def\neo@node@pos{current page.north east}
      \def\neo@node@xshift{-1cm}
    \fi

    \node[
    anchor=\neo@node@anchor,
    align=\neo@node@align,
    text width={\dimexpr\paperwidth-2cm},
    ] at ([xshift=\neo@node@xshift, yshift=-11mm]\neo@node@pos)
    {%
      \color{titleColor}%
      \csname\neoschool@titlestyle\endcsname%
      \csname\neoschool@titleweight\endcsname%
      \csname\neoschool@titleshape\endcsname%
      \usekomafont{title}{\@title}%
    };
  \end{tikzpicture}%
  \neo@vspace@short
}

%% Short Lesson Header Style
%% ----------------------------------
\newcommand{\neo@shortlessoncontent}{%
  \thispagestyle{customfirstpage}
  \begin{tikzpicture}[remember picture,overlay]
    \draw[line width=\neo@decorativerule, \neoschool@headfootcolor!50!backgroundColor]
    ([yshift=-21mm]current page.north west) --
    ([yshift=-21mm]current page.north east);

    \path let \p1=(current page.east) in node[
    anchor=west,
    align=left,
    text width=\sideWidth,
    font=\small\sffamily,
    text=\neoschool@headfootcolor
    ] at ([xshift=0.75cm,yshift=-11mm]current page.north west)
    {\neo@header@type};

    \path let \p1=(current page.east) in node[
    anchor=center,
    align=center,
    text width={\dimexpr\paperwidth-2\sideWidth-0.25cm},
    font=\Large
    ] at ([yshift=-11mm]current page.north)
    {\color{titleColor}%
      \csname\neoschool@titlestyle\endcsname%
      \csname\neoschool@titleweight\endcsname%
      \csname\neoschool@titleshape\endcsname%
      \@title};

    \path let \p1=(current page.east) in node[
    anchor=east,
    align=right,
    text width=\sideWidth,
    font=\small\sffamily,
    text=\neoschool@headfootcolor
    ] at ([xshift=-0.75cm,yshift=-11mm]current page.north east)
    {\neo@header@level};
  \end{tikzpicture}%
  \neo@vspace@short
}

%% Wave Header
%% ----------------------------------
\newsavebox{\neo@wave@headercontent}
\newsavebox{\neo@wave@subject}

\newcommand{\neo@wavecontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \ifx\@subject\empty
    \sbox{\neo@wave@subject}{}
  \else
    \sbox{\neo@wave@subject}{%
      \tcbox[
        on line,
        colback=subjectColor!10!backgroundColor,
        colframe=subjectColor!10!backgroundColor,
        coltext=subjectColor,
        boxrule=0pt, boxsep=0pt,
        left=6pt, right=6pt, top=3pt, bottom=3pt,
        arc=4pt, auto outer arc,
        nobeforeafter
        ]
        {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}}
  \fi

  \sbox{\neo@wave@headercontent}{%
     \begin{minipage}{\dimexpr\textwidth-20pt}
        \centering

        \ifx\@subject\empty\else
          \usebox{\neo@wave@subject}\par\vspace{\neo@title@sep@subjectbox}
        \fi

        \neo@printtitle\par\vspace{\neo@title@sep@subtitle}

        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}
        \fi
     \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[
        anchor=north,
        inner ysep=0pt,
        inner xsep=0pt
    ] (headerbox) at ([yshift=-1.5cm]current page.north) {
        \usebox{\neo@wave@headercontent}
    };

    \coordinate (HeaderBottom) at ([yshift=-2.5cm]headerbox.south);

    \begin{scope}[on background layer]
        
        \fill[backgroundColor] (current page.north west) rectangle (current page.east |- HeaderBottom);
        
        \fill[top color=primaryColor!8!backgroundColor, bottom color=backgroundColor]
             (current page.north west) rectangle (current page.east |- HeaderBottom);

        \begin{scope}
            \clip (current page.north west) rectangle (current page.east |- HeaderBottom);

            \begin{scope}[opacity=0.15, line width=1.5pt, draw=primaryColor]
                
                \draw plot [smooth, tension=1] coordinates {
                    ([yshift=-2.25cm]current page.north west)
                    ([xshift=5cm, yshift=-3.75cm]current page.north west)
                    ([xshift=12cm, yshift=-1.25cm]current page.north west)
                    ([xshift=\paperwidth, yshift=-2.75cm]current page.north west)
                };
                
                \draw plot [smooth, tension=1.2] coordinates {
                    ([yshift=-3cm]current page.north west)
                    ([xshift=6cm, yshift=-4.5cm]current page.north west)
                    ([xshift=15cm, yshift=-1.75cm]current page.north west)
                    ([xshift=\paperwidth, yshift=-4.25cm]current page.north west)
                };
                
                \draw[secondaryColor, line width=1pt] plot [smooth, tension=1] coordinates {
                    ([yshift=-1.25cm]current page.north west)
                    ([xshift=4cm, yshift=-2.75cm]current page.north west)
                    ([xshift=10cm, yshift=-0.75cm]current page.north west)
                    ([xshift=\paperwidth, yshift=-1.75cm]current page.north west)
                };
            \end{scope}
        \end{scope}

        \draw[backgroundColor, line width=3pt]
             (current page.west |- HeaderBottom) --
             (current page.east |- HeaderBottom);

    \end{scope}

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@wave@headercontent + \dp\neo@wave@headercontent + \if@twocolumn 2cm \else 1cm\fi  \relax}
}

%% Blocks Header
%% ----------------------------------
\newsavebox{\neo@blocks@headercontent}
\newsavebox{\neo@blocks@subject}

\newcommand{\neo@blockscontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \ifx\@subject\empty \sbox{\neo@blocks@subject}{} \else
    \sbox{\neo@blocks@subject}{%
      \tcbox[on line, colback=subjectColor!10!backgroundColor, colframe=subjectColor!10!backgroundColor, coltext=subjectColor,
        boxrule=0pt, boxsep=0pt, left=6pt, right=6pt, top=3pt, bottom=3pt, arc=0pt, auto outer arc, nobeforeafter
      ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}%
    }
  \fi

  \sbox{\neo@blocks@headercontent}{%
     \begin{minipage}{\dimexpr\textwidth-20pt}
        \centering
        \ifx\@subject\empty\else \usebox{\neo@blocks@subject}\par\vspace{\neo@title@sep@subjectbox} \fi
        \neo@printtitle\par\vspace{\neo@title@sep@subtitle}
        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}
        \fi
     \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=north, inner ysep=0pt, inner xsep=0pt] (headerbox) at ([yshift=-1.25cm]current page.north) {
       \usebox{\neo@blocks@headercontent}
    };

    \coordinate (RefY) at ([yshift=-1cm]headerbox.south);
    \coordinate (CenterMargin) at (current page.north |- RefY);

    \begin{scope}[on background layer]
        \fill[primaryColor, opacity=0.15]
             ([xshift=-5cm, yshift=0.4cm]CenterMargin) rectangle ([xshift=5cm, yshift=-0.4cm]CenterMargin);

        \fill[primaryColor, opacity=0.4]
             ([xshift=-2cm, yshift=0.1cm]CenterMargin) rectangle ([xshift=4cm, yshift=-0.2cm]CenterMargin);

        \fill[secondaryColor, opacity=0.7]
             ([xshift=-4cm, yshift=-0.1cm]CenterMargin) rectangle ([xshift=-1cm, yshift=0.2cm]CenterMargin);

        \draw[primaryColor, line width=0.5pt]
             ([xshift=-6cm]CenterMargin) -- ([xshift=6cm]CenterMargin);
    \end{scope}
  \end{tikzpicture}
  \neo@top@compensate
  \vspace*{\dimexpr \ht\neo@blocks@headercontent + \dp\neo@blocks@headercontent + 1.15cm + \if@twocolumn 1cm \else 0cm\fi \relax}
}

%% Stream Brush
%% ----------------------------------
\newsavebox{\neo@stream@headercontent}
\newsavebox{\neo@stream@subject}

\newcommand{\neo@streamcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \ifx\@subject\empty \sbox{\neo@stream@subject}{} \else
    \sbox{\neo@stream@subject}{%
      \tcbox[on line, colback=subjectColor!10!backgroundColor, colframe=subjectColor!10!backgroundColor, coltext=subjectColor,
        boxrule=0pt, boxsep=0pt, left=6pt, right=6pt, top=3pt, bottom=3pt, arc=4pt, auto outer arc, nobeforeafter
        ]
        {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}%
    }
  \fi

  \sbox{\neo@stream@headercontent}{%
     \begin{minipage}{\dimexpr\textwidth-20pt}
        \centering
        \ifx\@subject\empty\else \usebox{\neo@stream@subject}\par\vspace{\neo@title@sep@subjectbox} \fi
        \neo@printtitle\par\vspace{\neo@title@sep@subtitle}
        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}
        \fi
     \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=north, inner ysep=0pt, inner xsep=0pt] (headerbox) at ([yshift=-1.25cm]current page.north) {
       \usebox{\neo@stream@headercontent}
    };

    \coordinate (RefY) at ([yshift=-1cm]headerbox.south);
    \coordinate (CenterMargin) at (current page.north |- RefY);

    \begin{scope}[on background layer]
        \draw[primaryColor, line width=1.5pt, opacity=0.8, line cap=round]
             ([xshift=-4cm]CenterMargin) -- ([xshift=4cm]CenterMargin);

        \draw[primaryColor, line width=2.5pt, opacity=0.3, line cap=round]
             ([xshift=-5.5cm, yshift=0.2cm]CenterMargin) -- ([xshift=-2.5cm, yshift=0.2cm]CenterMargin);
        \draw[secondaryColor, line width=1pt, opacity=0.6, line cap=round]
             ([xshift=-3.5cm, yshift=-0.2cm]CenterMargin) -- ([xshift=-1.5cm, yshift=-0.2cm]CenterMargin);

        \draw[primaryColor, line width=2.5pt, opacity=0.3, line cap=round]
             ([xshift=1.5cm, yshift=-0.15cm]CenterMargin) -- ([xshift=6cm, yshift=-0.15cm]CenterMargin);
        \draw[secondaryColor, line width=1pt, opacity=0.6, line cap=round]
             ([xshift=3cm, yshift=0.25cm]CenterMargin) -- ([xshift=5cm, yshift=0.25cm]CenterMargin);

        \fill[primaryColor] ([xshift=-4.5cm]CenterMargin) circle (1.5pt);
        \fill[secondaryColor] ([xshift=4.5cm]CenterMargin) circle (1.5pt);
    \end{scope}
  \end{tikzpicture}
  \neo@top@compensate
  \vspace*{\dimexpr \ht\neo@stream@headercontent + \dp\neo@stream@headercontent + 1cm + \if@twocolumn 1cm \else 0cm\fi \relax}
}

%% Flow Header
%% ----------------------------------
\newsavebox{\neo@flow@headercontent}
\newsavebox{\neo@flow@subject}

\newcommand{\neo@flowcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \ifx\@subject\empty
    \sbox{\neo@flow@subject}{}
  \else
    \sbox{\neo@flow@subject}{%
      \tcbox[
      on line,
      colback=subjectColor!10!backgroundColor,
      colframe=subjectColor!10!backgroundColor,
      coltext=subjectColor,
      boxrule=0pt, boxsep=0pt,
      left=6pt, right=6pt, top=3pt, bottom=3pt,
      arc=4pt, auto outer arc,
      nobeforeafter
      ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}%
    }
  \fi

  \sbox{\neo@flow@headercontent}{%
    \begin{minipage}{\dimexpr\textwidth-20pt}
      \centering
      \ifx\@subject\empty\else
        \usebox{\neo@flow@subject}\par\vspace{\neo@title@sep@subjectbox}
      \fi
      \neo@printtitle\par\vspace{\neo@title@sep@subtitle}
      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[
    anchor=north,
    inner ysep=0pt,
    inner xsep=0pt
    ] (headerbox) at ([yshift=-1.25cm]current page.north) {
      \usebox{\neo@flow@headercontent}
    };

    \coordinate (WaveBaseline) at ([yshift=-1.25cm]headerbox.south);
    \coordinate (WaveL) at ([xshift=3cm]headerbox.south west |- WaveBaseline);
    \coordinate (WaveR) at ([xshift=-3cm]headerbox.south east |- WaveBaseline);

    \begin{scope}[on background layer]

      \begin{scope}[line cap=round]

        \draw[primaryColor, line width=2.5pt, opacity=0.7] plot [smooth, tension=0.6] coordinates {
          ([yshift=0.2cm]WaveL)
          ($(WaveL)!0.25!(WaveR) + (0, 0.5cm)$)
          ($(WaveL)!0.5!(WaveR)  + (0, -0.3cm)$)
          ($(WaveL)!0.75!(WaveR) + (0, 0.4cm)$)
          ([yshift=-0.1cm]WaveR)
        };

        \draw[secondaryColor, line width=1.2pt, opacity=0.6] plot [smooth, tension=0.8] coordinates {
          ([yshift=-0.3cm]WaveL)
          ($(WaveL)!0.15!(WaveR) + (0, 0.3cm)$)
          ($(WaveL)!0.35!(WaveR) + (0, -0.4cm)$)
          ($(WaveL)!0.6!(WaveR)  + (0, 0.5cm)$)
          ($(WaveL)!0.85!(WaveR) + (0, -0.2cm)$)
          ([yshift=0.2cm]WaveR)
        };

        \draw[tertiaryColor!80!backgroundColor, line width=0.6pt, opacity=0.4] plot [smooth, tension=1] coordinates {
          (WaveL)
          ($(WaveL)!0.3!(WaveR) + (0, -0.6cm)$)
          ($(WaveL)!0.7!(WaveR) + (0, 0.4cm)$)
          ([yshift=-0.2cm]WaveR)
        };

        \draw[primaryColor!50!backgroundColor, line width=0.8pt, opacity=0.8] plot [smooth, tension=0.7] coordinates {
          ([yshift=0.05cm]WaveL)
          ($(WaveL)!0.28!(WaveR) + (0, 0.35cm)$)
          ($(WaveL)!0.52!(WaveR) + (0, -0.45cm)$)
          ($(WaveL)!0.78!(WaveR) + (0, 0.25cm)$)
          ([yshift=-0.25cm]WaveR)
        };

      \end{scope}

    \end{scope}

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@flow@headercontent + \dp\neo@flow@headercontent + 1.5cm + \if@twocolumn 1cm \else 0cm\fi  \relax}
}

%% Brush Header
%% ----------------------------------
\newsavebox{\neo@brush@headercontent}
\newsavebox{\neo@brush@subject}

\newcommand{\neo@brushcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \ifx\@subject\empty
    \sbox{\neo@brush@subject}{}
  \else
    \sbox{\neo@brush@subject}{%
      \tcbox[
        on line,
        colback=subjectColor!10!backgroundColor,
        colframe=subjectColor!10!backgroundColor,
        coltext=subjectColor,
        boxrule=0pt, boxsep=0pt,
        left=6pt, right=6pt, top=3pt, bottom=3pt,
        arc=4pt, auto outer arc,
        nobeforeafter
      ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}%
    }
  \fi

  \sbox{\neo@brush@headercontent}{%
     \begin{minipage}{\dimexpr\textwidth-20pt}
        \centering
        \ifx\@subject\empty\else
            \usebox{\neo@brush@subject}\par\vspace{\neo@title@sep@subjectbox}
        \fi
        \neo@printtitle\par\vspace{\neo@title@sep@subtitle}
        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}
        \fi
     \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]

    \coordinate (HeaderCenter) at ([yshift=-1.25cm]current page.north);

    \coordinate (ChaosCenter) at ([yshift=-5cm]current page.north);

    \begin{scope}[shift={(ChaosCenter)}]

        \draw[primaryColor, line width=2pt, opacity=0.6, line cap=round]
            plot [smooth, tension=1.6] coordinates {
                (-4, 0.2)
                (-2, -0.8)
                (0, 0.8)
                (-1, 0.2)
                (2, -0.5)
                (4, 0.3)
            };

        \draw[secondaryColor, line width=1.2pt, opacity=0.8, line cap=round]
            plot [smooth, tension=3] coordinates {
                (-3, -0.3)
                (-0.5, 0.5)
                (1.5, -0.6)
                (3.5, 0.1)
            };

        \fill[primaryColor, opacity=0.4] (-3.5, 0.5) circle (2pt);
        \fill[secondaryColor, opacity=0.6] (2.8, 0.6) circle (1.5pt);
        \fill[primaryColor, opacity=0.3] (0.5, -0.9) circle (3pt);

        \draw[primaryColor, line width=0.8pt, opacity=0.4]
             (2, 0.5) to[out=45, in=180] (3, 0.8);

    \end{scope}

    \node[
        anchor=north,
        inner ysep=0pt, inner xsep=0pt
    ] at (HeaderCenter) {
       \usebox{\neo@brush@headercontent}
    };

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@brush@headercontent + \dp\neo@brush@headercontent + 2.5cm + \if@twocolumn 1cm \else 0cm\fi \relax}
}

%% Magazine Header
%% ----------------------------------
\newsavebox{\neo@magazine@headercontent}
\newcommand{\neo@magazinecontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@magazine@headercontent}{%
     \begin{minipage}{\dimexpr\textwidth-1cm}
        \raggedright

        \ifx\@subject\empty\else
            {\tcbox[
                on line,
                colback=backgroundColor!20!primaryColor,
                colframe=backgroundColor!20!primaryColor,
                boxrule=0pt, boxsep=0pt,
                left=4pt, right=4pt, top=2pt, bottom=2pt,
                sharp corners,
                nobeforeafter
            ]{\usekomafont{subject}\color{backgroundColor}\@subject}}\par\vspace{\neo@title@sep@subjectbox}
        \fi

        {\fontfamily{\sfdefault}\fontsize{32}{38}\selectfont\bfseries\color{backgroundColor}
        \@title}\par\vspace{\neo@title@sep@subtitle}

        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\color{backgroundColor}\@subtitle}\\[0.8em]
        \fi
     \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]

    \coordinate (NW) at (current page.north west);
    \coordinate (NE) at (current page.north east);

    \fill[primaryColor]
        (NW) --
        (NE) --
        ([yshift=-3.5cm]NE) --
        ([yshift=-7.5cm]NW) --
        cycle;

    \fill[secondaryColor]
        ([yshift=-7.5cm]NW) --
        ([yshift=-3.5cm]NE) --
        ([yshift=-4.2cm]NE) --
        ([yshift=-8.5cm]NW) --
        cycle;

    \draw[backgroundColor, opacity=0.1, line width=1pt]
        ([xshift=-2cm, yshift=-1cm]NE) -- ([xshift=-2cm, yshift=-5cm]NE);

    \node[
        anchor=north west,
        inner sep=0pt,
    ] (headerbox) at ([xshift=1.5cm, yshift=-1.25cm]current page.north west) {
        \usebox{\neo@magazine@headercontent}
    };

  \end{tikzpicture}

  \neo@top@compensate
  \if@twocolumn \vspace*{8cm} \else \vspace*{7cm}\fi
}

%% Book Header
%% ----------------------------------
\newsavebox{\neo@book@headercontent}
\newcommand{\neo@bookcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@book@headercontent}{%
     \begin{minipage}{\dimexpr\paperwidth-6cm}
        \centering

        \ifx\@subject\empty\else
            {\fontfamily{\sfdefault}\fontsize{8}{8}\selectfont\bfseries
            \tcbox[
              on line,
              colback=subjectColor!10!backgroundColor,
              colframe=backgroundColor,
              boxrule=0pt,
              left=6pt, right=6pt, top=3pt, bottom=3pt,
              arc=2pt,
              nobeforeafter
            ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}}\par\vspace{\neo@title@sep@subjectbox}
        \fi

        \neo@printtitle\par\vspace{\neo@title@sep@subtitle}
        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}\\[0.8em]
        \fi
     \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \fill[primaryColor]
    (current page.north west) rectangle ([yshift=-4.25cm]current page.north east);

    \begin{scope}
        \clip (current page.north west) rectangle ([yshift=-4.25cm]current page.north east);

        \fill[backgroundColor, opacity=0.05]
        ([xshift=2cm, yshift=0.5cm]current page.north west) circle (2.8cm);

        \fill[secondaryColor, opacity=0.15]
        ([xshift=-3cm, yshift=-0.5cm]current page.north east) circle (3.5cm);

        \fill[backgroundColor, opacity=0.03]
        ([xshift=-5cm, yshift=-2.5cm]current page.north east) circle (1.8cm);
    \end{scope}

    \node[
        anchor=north,
        fill=backgroundColor,
        drop shadow={
            opacity=0.15,
            shadow xshift=0pt,
            shadow yshift=-3pt,
            shadow scale=1.02
        },
        rounded corners=2pt,
        inner ysep=15pt,
        inner xsep=20pt
    ] (card) at ([yshift=-1.65cm]current page.north) {
        \usebox{\neo@book@headercontent}
    };

  \end{tikzpicture}

  \neo@top@compensate
  \vspace*{\dimexpr \ht\neo@book@headercontent + \dp\neo@book@headercontent + 40pt + \if@twocolumn 1cm \else 0cm\fi \relax}
}

%% Tech Header
%% ----------------------------------
\newsavebox{\neo@tech@headercontent}
\newcommand{\neo@techcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@tech@headercontent}{%
     \begin{minipage}{\dimexpr\textwidth-1.5cm}
        \raggedright

        \ifx\@subject\empty\else
            {\fontfamily{\sfdefault}\fontsize{8}{8}\selectfont\bfseries
            \tcbox[
              on line,
              colback=backgroundColor,
              colframe=subjectColor,
              boxrule=0.8pt,
              arc=0pt, outer arc=0pt,
              left=3pt, right=3pt, top=1pt, bottom=1pt,
              nobeforeafter
            ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}}\par\vspace{0.5\neo@title@sep@subjectbox}
        \fi

        \neo@printtitle\par\vspace{0.5\neo@title@sep@subtitle}

        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}
        \fi
     \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \coordinate (ContentBottom) at ([yshift=-1.5cm]current page.north west);

    \fill[primaryColor]
      ([yshift=-1.1cm]current page.north west) rectangle ([xshift=0.8cm, yshift=-3.5cm]current page.north west);

    \foreach \y in {-0.1,0.1,...,2.5} {
        \draw[backgroundColor, line width=0.8pt]
        ([xshift=0cm, yshift=-1cm-\y cm]current page.north west) --
        ([xshift=0.8cm, yshift=-1cm-\y cm - 0.2cm]current page.north west);
    }

    \node[
        anchor=north west,
        inner sep=0pt
    ] (headerbox) at ([xshift=1.5cm, yshift=-1.1cm]current page.north west) {
       \usebox{\neo@tech@headercontent}
    };

    \draw[primaryColor!30, line width=1pt]
      ([yshift=-0.4cm]headerbox.south west) -- ([yshift=-0.4cm, xshift=\textwidth]headerbox.south west);

  \end{tikzpicture}

  \neo@top@compensate
  \vspace*{\dimexpr \ht\neo@tech@headercontent + \dp\neo@tech@headercontent + \if@twocolumn 1cm \else 0cm\fi \relax}
}

%% Simple Notion Header
%% ----------------------------------
\newsavebox{\neo@simplenotion@headercontent}
\newcommand{\neo@simplenotioncontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@simplenotion@headercontent}{%
    \begin{minipage}{0.85\textwidth}
      \centering

      \ifx\@subject\empty\else
        {\tcbox[
           on line,
           colback=subjectColor!8!backgroundColor,
           colframe=subjectColor!8!backgroundColor,
           boxrule=0pt,
           arc=3pt,
           left=2pt,right=2pt,top=0pt,bottom=0pt,
           nobeforeafter
           ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}}\par\vspace{\neo@title@sep@subjectbox}
      \fi

      \neo@printtitle\par\vspace{\neo@title@sep@subtitle}

      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \shade[
      top color=primaryColor!5!backgroundColor,
      bottom color=backgroundColor
    ]
      (current page.north west) rectangle ([yshift=-5.25cm]current page.north east);

    \node[
      anchor=north,
      fill=backgroundColor,
      draw=primaryColor!15!backgroundColor,
      line width=0.8pt,
      rounded corners=6pt,
      inner xsep=25pt,
      inner ysep=20pt,
      drop shadow={opacity=0.05, shadow xshift=0pt, shadow yshift=-3pt, shadow scale=1.01}
    ] (card) at ([yshift=-1.25cm]current page.north) {
      \usebox{\neo@simplenotion@headercontent}
    };

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@simplenotion@headercontent + \dp\neo@simplenotion@headercontent + 30pt + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% Notion Header
%% ----------------------------------
\newsavebox{\neo@notion@headercontent}
\newcommand{\neo@notioncontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@notion@headercontent}{%
    \begin{minipage}{0.85\textwidth}
      \centering

      \vspace*{0.6cm}

      \ifx\@subject\empty\else
        {\fontfamily{\sfdefault}\fontsize{7}{7}\selectfont\bfseries
         \tcbox[
           on line,
           colback=subjectColor!8!backgroundColor,
           colframe=subjectColor!8!backgroundColor,
           coltext=subjectColor,
           boxrule=0pt,
           arc=3pt,
           left=4pt,right=4pt,top=1pt,bottom=1pt,
           nobeforeafter
         ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}}\par\vspace{\neo@title@sep@subjectbox}
      \fi

      \neo@printtitle\par\vspace{\neo@title@sep@subtitlelarge}

      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \fill[
      top color=primaryColor!10!backgroundColor,
      bottom color=backgroundColor,
      rounded corners=0pt
    ]
      (current page.north west) --
      (current page.north east) --
      ([yshift=-6cm]current page.north east) [rounded corners=0pt] --
      ([yshift=-6cm]current page.north west) [sharp corners] --
      cycle;

      \draw[backgroundColor, line width=3pt]
      ([yshift=-6cm]current page.north west) -- ([yshift=-6cm]current page.north east)

    \node[
      anchor=north,
      fill=backgroundColor,
      draw=primaryColor!15!backgroundColor,
      line width=0.8pt,
      rounded corners=8pt,
      inner xsep=25pt,
      inner ysep=12pt,
      drop shadow={opacity=0.08, shadow xshift=0pt, shadow yshift=-4pt, shadow scale=1.01}
    ] (card) at ([yshift=-1.5cm]current page.north) {
      \usebox{\neo@notion@headercontent}
    };

    \node[
        circle,
        fill=backgroundColor,
        draw=primaryColor!20,
        line width=1pt,
        inner sep=4pt,
        anchor=center,
        drop shadow={opacity=0.1, shadow xshift=0pt, shadow yshift=-2pt}
    ] at (card.north) {
        \color{primaryColor}\fontsize{17}{20}\selectfont
        \faBookOpen
    };

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@notion@headercontent + \dp\neo@notion@headercontent + 25pt + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% Bristol header
%% ----------------------------------
\newsavebox{\neo@bristol@headercontent}
\newsavebox{\neo@bristol@subject}

\newcommand{\neo@bristolcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@bristol@headercontent}{%
    \begin{minipage}{\dimexpr\textwidth-3cm}
      \raggedright

      \ifx\@subject\empty\else
         {\sffamily\bfseries\small\color{primaryColor}\MakeUppercase{\@subject}}\par
         \vspace{\neo@title@sep@subjectbox}
      \fi

      {\csname\neoschool@titlestyle\endcsname
       \csname\neoschool@titleweight\endcsname
       \csname\neoschool@titleshape\endcsname
       \huge
       \color{primaryColor!40!black}
       \@title}\par

      \vspace{8pt}
      {\color{primaryColor}\rule{1.5cm}{2pt}}\par

      \ifx\@subtitle\empty\else
          \vspace{8pt}
          {\usekomafont{subtitle}\color{gray}\itshape\large\@subtitle\par}
      \fi
    \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]
    \fill[primaryColor] (current page.north west) rectangle ([yshift=-1.2cm]current page.north east);

    \node[
        anchor=north west,
        inner sep=0pt,
        outer sep=0pt
    ] (headerbox) at ([xshift=\neo@leftmargin, yshift=-2.5cm]current page.north west)
    {\usebox{\neo@bristol@headercontent}};

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@bristol@headercontent + \dp\neo@bristol@headercontent + 1cm \relax}
}

%% Band Header
%% ----------------------------------
\newsavebox{\neo@band@headercontent}
\newcommand{\neo@bandcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@band@headercontent}{%
    \begin{minipage}[b]{\textwidth}
      \raggedright
      \ifx\@subject\empty\else
        \tikz[baseline=(tag.base)]{
          \node[
          draw=primaryColor,
          line width=0.5pt,
          text=primaryColor,
          font=\usekomafont{subject}\mdseries\scriptsize,
          inner xsep=0.5em,
          inner ysep=0.2em,
          rounded corners=2pt
          ] (tag) {\textls[75]{\MakeUppercase{\@subject}}};
        }\par\vspace{\neo@title@sep@subjectbox}%
      \fi
      \raggedright
      \neo@printtitle
    \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]
    \node[
    anchor=north west,
    inner sep=0pt,
    outer sep=0pt
    ] (titlenode) at ([xshift=\dimexpr 1in + \hoffset + \oddsidemargin \relax, yshift=-1.25cm]current page.north west)
    {\usebox{\neo@band@headercontent}};

    \fill[primaryColor]
    ([yshift=-0.3cm]titlenode.south west)
    rectangle
    ([xshift=\textwidth, yshift=-0.7cm]titlenode.south west);

    \ifx\@subtitle\empty\else
      \node[
      anchor=north west,
      inner sep=0pt,
      outer sep=0pt,
      text=textColor!70
      ] at ([yshift=-0.9cm]titlenode.south west)
      {\small\usekomafont{subtitle}\@subtitle};
    \fi
  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@band@headercontent + \dp\neo@band@headercontent + \if@twocolumn 2cm \else 1cm \fi \relax}
}

%% Bauhaus Header
%% ----------------------------------
\newcommand{\neo@bauhauscontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt} \fi

  \begin{tikzpicture}[remember picture, overlay]

    \fill[primaryColor!8!backgroundColor]
    (current page.north west) rectangle ++(\paperwidth, -6cm);

    \fill[primaryColor]
    ([xshift=1.5cm]current page.north west) rectangle ++(0.8cm, -6cm);

    \fill[secondaryColor]
    ([xshift=1.5cm]current page.north west) rectangle ++(0.8cm, -1.5cm);

    \draw[primaryColor, line width=1.5pt]
    ([yshift=-6cm]current page.north west) -- ++(\paperwidth, 0);

    \fill[tertiaryColor, opacity=0.8]
    ([xshift=-2.5cm, yshift=-6cm]current page.north east) circle (0.8cm);

    \node[
        anchor=north west,
        align=left,
        text width={\dimexpr\paperwidth-5cm},
        inner sep=0pt
    ] (textblock) at ([xshift=3.5cm, yshift=-1.8cm]current page.north west) {

        \ifx\@subject\empty\else
            {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}\par\vspace{\neo@title@sep@subject}
        \fi

        {\fontfamily{\sfdefault}\fontsize{32}{38}\selectfont\bfseries\color{primaryColor}
        \noindent\@title}\par\vspace{\neo@title@sep@subtitle}

        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}
        \fi
    };

  \end{tikzpicture}

  \neo@top@compensate
  \if@twocolumn\vspace*{5.5cm}\else\vspace*{5cm}\fi
}

%% Memphis Header
%% ----------------------------------
\newcommand{\neo@memphiscontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt} \fi

  \begin{tikzpicture}[remember picture, overlay]

    \fill[backgroundColor] (current page.north west) rectangle ++(\paperwidth, -8cm);

    \foreach \x in {1, 3, ..., 21} {
        \foreach \y in {-1, -3, ..., -7} {
             \fill[primaryColor!10]
             ([xshift=\x cm, yshift=\y cm]current page.north west) circle (1.5pt);
        }
    }

    \begin{scope}[shift={([xshift=18cm, yshift=-1cm]current page.north west)}, rotate=-15]
        \fill[primaryColor!15] (0,0) rectangle (4,-5);
        \draw[primaryColor, line width=1pt] (0.2,-0.2) rectangle (3.8,-4.8);
    \end{scope}

    \draw[secondaryColor, line width=3.5pt, line cap=round, rotate around={-10:([xshift=7.5cm, yshift=-5cm]current page.north west)}]
    ([xshift=7.5cm, yshift=-5cm]current page.north west)
    sin ++(0.6, 0.4) cos ++(0.6, -0.4) sin ++(0.6, -0.4) cos ++(0.6, 0.4)
    sin ++(0.6, 0.4) cos ++(0.6, -0.4);

    \draw[tertiaryColor, line width=2.5pt, rotate around={25:([xshift=13cm, yshift=-9cm]current page.north west)}]
    ([xshift=13cm, yshift=-9cm]current page.north west) -- ++(1, 1.7) -- ++(1, -1.7) -- cycle;

    \fill[primaryColor]
    ([xshift=14.5cm, yshift=-7.5cm]current page.north west) circle (1.4cm);

    \draw[secondaryColor, line width=3pt]
    ([xshift=20cm, yshift=-5cm]current page.north west) circle (0.9cm);

    \node[text=secondaryColor!50, font=\bfseries\Huge, rotate=12] at ([xshift=12.75cm, yshift=-1.5cm]current page.north west) {x};

    \node[text=tertiaryColor!70, font=\bfseries\LARGE, rotate=-20] at ([xshift=10.5cm, yshift=-5.5cm]current page.north west) {+};

    \fill[tertiaryColor] ([xshift=5cm, yshift=-7.2cm]current page.north west) circle (0.15cm);
    \fill[primaryColor] ([xshift=12.5cm, yshift=-6cm]current page.north west) circle (0.1cm);
    \draw[\neoschool@globalcolor!20, line width=1pt] ([xshift=2cm, yshift=-1.5cm]current page.north west) circle (0.2cm);

    \draw[primaryColor, line width=2pt] ([xshift=0cm, yshift=-8cm]current page.north west) -- ([xshift=15cm, yshift=-8cm]current page.north west);

    \node[
        anchor=west,
        align=left,
        text width={\dimexpr\paperwidth-6cm},
        inner sep=0pt
    ] (textblock) at ([xshift=1.5cm, yshift=-4cm]current page.north west) {

        \ifx\@subject\empty\else
            {\setlength{\fboxsep}{3pt}
            \colorbox{primaryColor!10!backgroundColor}{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}}\par\vspace{\neo@title@sep@subjectbox}
        \fi

        {\fontfamily{\sfdefault}\fontsize{32}{38}\selectfont\bfseries\color{\neoschool@globalcolor!20!backgroundColor}\noindent\hspace{2pt}\raisebox{-2pt}{\@title}}\\[-28pt]
        {\fontfamily{\sfdefault}\fontsize{32}{38}\selectfont\bfseries\color{primaryColor}
        \noindent\@title}\par\vspace{\neo@title@sep@subtitle}

        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}
        \fi
    };

  \end{tikzpicture}

  \neo@top@compensate
  \if@twocolumn\vspace*{8cm}\else\vspace*{7.5cm}\fi
}

%% Grid Header
%% ----------------------------------
\newsavebox{\neo@grid@headercontent}
\newcommand{\neo@gridcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@grid@headercontent}{%
     \begin{minipage}{\dimexpr\paperwidth-5cm-40pt}
        \centering

        \ifx\@subject\empty\else
            {\fontfamily{\sfdefault}\fontsize{8}{8}\selectfont\bfseries
            \tcbox[
                on line,
                colback=subjectColor!10!backgroundColor,
                colframe=subjectColor!10!backgroundColor,
                boxrule=0pt, boxsep=0pt,
                left=4pt, right=4pt, top=2pt, bottom=2pt,
                nobeforeafter
            ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}}\par\vspace{\neo@title@sep@subjectbox}
        \fi

        \neo@printtitle\par\vspace{\neo@title@sep@subtitle}

        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}\\[0.8em]
        \fi
     \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]

    \foreach \x in {1,...,10} {
        \foreach \y in {1,...,10} {
             \fill[primaryColor!40]
             ([xshift=-\x*0.4cm - 0.5cm, yshift=-\y*0.4cm + 0.5cm]current page.north east)
             circle (0.8pt);
        }
    }

    \fill[primaryColor]
    ([yshift=-3cm]current page.north west) rectangle ++(0.15cm, 2cm);

    \node[
        anchor=north,
        fill=titleColor!1!backgroundColor,
        draw=titleColor!20!backgroundColor,
        line width=0.8pt,
        rounded corners=3pt,
        blur shadow={shadow blur steps=15, shadow blur extra rounding=5pt, shadow xshift=0pt, shadow yshift=-3pt, shadow opacity=15},
        inner ysep=15pt,
        inner xsep=20pt
    ] (headerbox) at ([yshift=-1.75cm]current page.north) {
        \usebox{\neo@grid@headercontent}
    };

  \end{tikzpicture}

  \neo@top@compensate
  \if@twocolumn\vspace*{2.25cm}\else\vspace*{1.5cm}\fi
  \vspace*{\dimexpr\ht\neo@grid@headercontent + \dp\neo@grid@headercontent\relax}
}

%% Circles Header
%% ----------------------------------
\newsavebox{\neo@circles@headercontent}
\newcommand{\neo@circlescontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@circles@headercontent}{%
     \begin{minipage}{\dimexpr\paperwidth-5cm-40pt}
        \centering

        \ifx\@subject\empty\else
            {\fontfamily{\sfdefault}\fontsize{8}{8}\selectfont\bfseries
            \tcbox[
                on line,
                colback=subjectColor!10!backgroundColor,
                colframe=subjectColor!10!backgroundColor,
                boxrule=0pt, boxsep=0pt,
                left=4pt, right=4pt, top=2pt, bottom=2pt,
                nobeforeafter
            ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}}\par\vspace{\neo@title@sep@subjectbox}
        \fi

        \neo@printtitle\par\vspace{\neo@title@sep@subtitle}

        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}\\[0.8em]
        \fi
     \end{minipage}%
  }

  \begin{tikzpicture}[remember picture, overlay]

    \fill[primaryColor, opacity=0.08]
    ([xshift=-2cm, yshift=2cm]current page.north east) circle (7cm);

    \fill[secondaryColor, opacity=0.10]
    ([xshift=-8cm, yshift=4cm]current page.north east) circle (5cm);

    \fill[tertiaryColor, opacity=0.6]
    ([xshift=-3cm, yshift=-4cm]current page.north east) circle (3pt);

    \node[
        anchor=north,
        fill=titleColor!1!backgroundColor,
        draw=titleColor!20!backgroundColor,
        line width=0.8pt,
        rounded corners=3pt,
        blur shadow={shadow blur steps=15, shadow blur extra rounding=5pt, shadow xshift=0pt, shadow yshift=-3pt, shadow opacity=15},
        inner ysep=15pt,
        inner xsep=20pt
    ] (headerbox) at ([yshift=-1.75cm]current page.north) {
        \usebox{\neo@circles@headercontent}
    };

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr\ht\neo@circles@headercontent + \dp\neo@circles@headercontent\relax}
  \if@twocolumn\vspace*{2.5cm}\else\vspace*{1.5cm}\fi
}

%% Minimal Header
%% ----------------------------------
\newsavebox{\neo@minimal@headercontent}
\newcommand{\neo@minimalcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@minimal@headercontent}{%
     \begin{minipage}{\textwidth}
        \raggedright

        \ifx\@subject\empty\else
            {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}\par\vspace{\neo@title@sep@subjectbox}
        \fi

        \neo@printtitle\par\vspace{0.75\neo@title@sep@subtitle}

        \ifx\@subtitle\empty\else
          {\usekomafont{subtitle}\@subtitle}
        \fi
     \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[
        anchor=north west,
        inner sep=0pt
    ] (headerbox) at ([xshift=\dimexpr 1in + \hoffset + \oddsidemargin \relax, yshift=-1.5cm]current page.north west) {
       \usebox{\neo@minimal@headercontent}
    };

    \fill[primaryColor]
      ([yshift=0.3cm]headerbox.north west)
      rectangle
      ([xshift=1.5cm, yshift=0.45cm]headerbox.north west);

    \draw[\neoschool@globalcolor!15!backgroundColor, line width=0.5pt]
      ([yshift=-0.4cm]headerbox.south west) -- ([yshift=-0.4cm, xshift=\textwidth]headerbox.south west);

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@minimal@headercontent + \dp\neo@minimal@headercontent + \if@twocolumn 1.25cm \else 0.25cm \fi \relax}
}

%% Bar Header
%% ----------------------------------
\newsavebox{\neo@bar@headercontent}
\newcommand{\neo@barcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@bar@headercontent}{%
    \begin{minipage}{\dimexpr\textwidth-45pt}
      \raggedright

      \ifx\@subject\empty\else
        {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}\par\vspace{0.75\neo@title@sep@subjectbox}
      \fi

      \neo@printtitle\par\vspace{0.75\neo@title@sep@subtitle}

      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[
      anchor=north west,
      fill=backgroundColor,
      draw=\neoschool@globalcolor!15!backgroundColor,
      line width=0.8pt,
      rounded corners=3pt,
      inner ysep=15pt,
      inner xsep=20pt,
      path picture={
        \fill[primaryColor]
          (path picture bounding box.north west) rectangle
          ([xshift=6pt]path picture bounding box.south west);
      }
    ] (content) at ([xshift=\dimexpr 1in + \hoffset + \oddsidemargin \relax, yshift=-1.5cm]current page.north west) {
       \usebox{\neo@bar@headercontent}
    };

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@bar@headercontent + \dp\neo@bar@headercontent + 30pt + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% Spine Header
%% ----------------------------------
\newsavebox{\neo@spine@headercontent}
\newcommand{\neo@spinecontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@spine@headercontent}{%
    \begin{minipage}{\dimexpr\textwidth-1.2cm}
      \raggedright

      \ifx\@subject\empty\else
        {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}\par\vspace{0.75\neo@title@sep@subjectbox}
      \fi

      \neo@printtitle\par\vspace{0.75\neo@title@sep@subtitle}

      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[
      anchor=north west,
      inner sep=0pt,
      outer sep=0pt
    ] (content) at ([xshift=\dimexpr 1in + \hoffset + \oddsidemargin + 1.2cm \relax, yshift=-1.5cm]current page.north west) {
       \usebox{\neo@spine@headercontent}
    };

    \fill[titleColor!10!backgroundColor]
      ([xshift=-1.2cm, yshift=5pt]content.north west)
      rectangle
      ([xshift=-0.4cm, yshift=-5pt]content.south west);

    \fill[secondaryColor]
      ([xshift=-0.85cm, yshift=5pt]content.north west)
      rectangle
      ([xshift=-0.75cm, yshift=-5pt]content.south west);

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@spine@headercontent + \dp\neo@spine@headercontent + 5pt + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% Geometric Header
%% ----------------------------------
\newsavebox{\neo@geometric@headercontent}
\newcommand{\neo@geometriccontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@geometric@headercontent}{%
    \begin{minipage}{\textwidth}
      \raggedright

      \ifx\@subject\empty\else
        {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}\par\vspace{\neo@title@sep@subjectbox}
      \fi

      \neo@printtitle\par\vspace{\neo@title@sep@subtitle}

      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \fill[primaryColor, opacity=0.1]
    (current page.north west) -- ++(0, -5cm) -- ++(5cm, 5cm) -- cycle;

    \fill[secondaryColor, opacity=0.1]
    ([xshift=-3cm, yshift=2cm]current page.north east) circle (5cm);

    \node[
        anchor=north west,
        inner sep=0pt
    ] (headerbox) at ([xshift=\dimexpr 1in + \hoffset + \oddsidemargin \relax, yshift=-1.5cm]current page.north west) {
       \usebox{\neo@geometric@headercontent}
    };

    \coordinate (LineLevel) at ([yshift=-1.2cm]headerbox.south west);

    \draw[primaryColor, line width=2pt]
      ([xshift=1cm]current page.west |- LineLevel) --
      ([xshift=-1cm]current page.east |- LineLevel);

    \fill[tertiaryColor]
      ([xshift=1cm, yshift=-0.15cm]current page.west |- LineLevel)
      rectangle ++(0.3, 0.3);

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr 1.5cm + \ht\neo@geometric@headercontent + \dp\neo@geometric@headercontent + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% Banner Header
%% ----------------------------------
\newsavebox{\neo@banner@headercontent}
\newsavebox{\neo@banner@meta}

\newcommand{\neo@bannercontent}{%
  \thispagestyle{pagenum}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@banner@headercontent}{%
    \begin{minipage}{\textwidth}
      \raggedright

      \ifx\@subject\empty\else
        {\usekomafont{subject}\color{backgroundColor!80}\@subject}\par\vspace{0.75\neo@title@sep@subjectbox}
      \fi

      {\usekomafont{title}\color{backgroundColor}\@title}\par\vspace{0.75\neo@title@sep@subtitle}

      \ifx\@subtitle\empty\else
        {{\usekomafont{subtitle}\color{backgroundColor!90}\@subtitle}}
      \fi
    \end{minipage}
  }

  \sbox{\neo@banner@meta}{%
    \ifx\@author\empty\else
       {\usekomafont{author}\@author \quad\textbullet\quad \@date}
    \fi
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[
        anchor=north west,
        inner sep=0pt
    ] (content) at ([xshift=\dimexpr 1in + \hoffset + \oddsidemargin \relax, yshift=-1cm]current page.north west) {
       \usebox{\neo@banner@headercontent}
    };

    \begin{scope}[on background layer]
        \fill[primaryColor]
            (current page.north west) rectangle
            ([yshift=-28pt]current page.east |- content.south);

        \fill[secondaryColor]
            ([yshift=-28pt]current page.west |- content.south) rectangle
            ([yshift=-32pt]current page.east |- content.south);
    \end{scope}

    \node[
        anchor=north west,
        inner sep=0pt
    ] at ([yshift=-38pt]content.south west) {
       \usebox{\neo@banner@meta}
    };

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@banner@headercontent + \dp\neo@banner@headercontent + 21pt + \ht\neo@banner@meta + \dp\neo@banner@meta + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% Bubbles Header
%% ----------------------------------
\newsavebox{\neo@bubbles@headercontent}
\newcommand{\neo@bubblescontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@bubbles@headercontent}{%
    \begin{minipage}{\dimexpr\textwidth-2cm}
      \centering
      \ifx\@subject\empty\else
        {\fontfamily{\sfdefault}\fontsize{9}{9}\selectfont\bfseries\color{subjectColor}
         \@subject}\par\vspace{\neo@title@sep@subject}
      \fi
      \neo@printtitle\par\vspace{\neo@title@sep@subtitle}
      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[anchor=north, inner sep=0pt] (content) at ([yshift=-2.5cm]current page.north) {
       \usebox{\neo@bubbles@headercontent}
    };

    \begin{scope}[on background layer]

        \fill[primaryColor, opacity=0.08]
             ([xshift=-2.5cm, yshift=0.5cm]content.center) circle (1.2cm);

        \fill[secondaryColor, opacity=0.08]
             ([xshift=2.5cm, yshift=-0.5cm]content.center) circle (1.2cm);

        \pgfmathsetseed{42}
        \foreach \i in {1,...,20} {
            \pgfmathsetmacro{\xPos}{rand*6}
            \pgfmathsetmacro{\yPos}{rand*1.5 + 0.2}
            \pgfmathsetmacro{\rad}{0.2 + rnd*0.6}
            \pgfmathsetmacro{\opac}{0.05 + rnd*0.12}
            \pgfmathsetmacro{\colChoice}{rnd}

            \ifdim \colChoice pt > 0.5pt
                \fill[primaryColor, opacity=\opac] ([xshift=\xPos cm, yshift=\yPos cm]content.center) circle (\rad cm);
            \else
                \fill[secondaryColor, opacity=\opac] ([xshift=\xPos cm, yshift=\yPos cm]content.center) circle (\rad cm);
            \fi
        }

        \fill[backgroundColor, path fading=north]
             ([yshift=2pt]current page.west |- content.south)
             rectangle
             ([yshift=-2.5cm]current page.east |- content.south);

    \end{scope}

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr 1.75cm + \ht\neo@bubbles@headercontent + \dp\neo@bubbles@headercontent + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% Confetti Header
%% ----------------------------------
\newsavebox{\neo@confetti@headercontent}
\newsavebox{\neo@confetti@subject}

\newcommand{\neo@confetticontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \ifx\@subject\empty
    \sbox{\neo@confetti@subject}{}
  \else
    \sbox{\neo@confetti@subject}{%
      \tcbox[
        on line,
        colback=subjectColor!10!backgroundColor,
        colframe=subjectColor!10!backgroundColor,
        boxrule=0pt,
        arc=4pt,
        left=8pt, right=8pt, top=3pt, bottom=3pt
      ]{\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}%
    }
  \fi

  \sbox{\neo@confetti@headercontent}{%
    \begin{minipage}{\dimexpr\textwidth-1.5cm}
      \raggedright

      \ifx\@subject\empty
         \neo@printtitle\par\vspace{\neo@title@sep@subtitle}
      \else
         \parbox[t]{\dimexpr\linewidth-\wd\neo@confetti@subject-1.5cm\relax}{%
            \raggedright
            \neo@printtitle
         }\par\vspace{\neo@title@sep@subtitle}
      \fi

      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}\\[0.5em]
      \fi

      {\color{primaryColor}\rule{3cm}{2pt}}\\[0.4em]

      \ifx\@author\empty\else
         {\usekomafont{author}\@author \quad\textbullet\quad \@date}
      \fi
    \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[
        anchor=north west,
        fill=backgroundColor,
        draw=titleColor!10!backgroundColor,
        line width=1pt,
        rounded corners=6pt,
        inner sep=20pt,
        drop shadow={opacity=0.03, shadow xshift=0pt, shadow yshift=-2pt}
    ] (content) at ([xshift=\dimexpr 1in + \hoffset + \oddsidemargin \relax, yshift=-1.5cm]current page.north west) {
       \usebox{\neo@confetti@headercontent}
    };

    \begin{scope}[on background layer]

        \clip (current page.north west) rectangle ([yshift=-0.75cm]current page.east |- content.south);

        \fill[titleColor!2!backgroundColor]
             (current page.north west) rectangle ([yshift=-0.75cm]current page.east |- content.south);

        \pgfmathsetseed{123}
        \foreach \i in {1,...,50} {
            \pgfmathsetmacro{\xPos}{rnd*21}
            \pgfmathsetmacro{\yPos}{-rnd*6}

            \pgfmathsetmacro{\rad}{0.15 + rnd*0.35}
            \pgfmathsetmacro{\opac}{0.3 + rnd*0.4}

            \pgfmathrandominteger{\colChoice}{1}{3}
            \ifcase\colChoice
                \or \colorlet{bubblecolor}{primaryColor}
                \or \colorlet{bubblecolor}{secondaryColor}
                \or \colorlet{bubblecolor}{tertiaryColor}
            \fi

            \fill[bubblecolor, opacity=\opac]
                 ([xshift=\xPos cm, yshift=\yPos cm]current page.north west)
                 circle (\rad cm);

            \ifnum \i < 15
               \draw[bubblecolor, opacity=\opac, line width=0.8pt]
                    ([xshift=\xPos cm, yshift=\yPos cm]current page.north west)
                    circle (\rad cm + 0.1cm);
            \fi
        }
    \end{scope}

    \ifx\@subject\empty\else
      \node[
        anchor=north east,
        inner sep=0pt
      ] at ([xshift=-20pt, yshift=-20pt]content.north east)
      {\usebox{\neo@confetti@subject}};
    \fi

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr \ht\neo@confetti@headercontent + \dp\neo@confetti@headercontent + 40pt + \if@twocolumn 1.75cm \else 0.75cm \fi \relax}
}

%% Particles Header
%% ----------------------------------
\newsavebox{\neo@particles@headercontent}
\newsavebox{\neo@particles@subject}

\newcommand{\neo@particlescontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@particles@headercontent}{%
    \begin{minipage}{\dimexpr\textwidth-1cm}
      \raggedright

      \ifx\@subject\empty\else
        {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}\par\vspace{\neo@title@sep@subject}
      \fi

      \neo@printtitle\par\vspace{\neo@title@sep@subtitle}

      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[
        anchor=north west,
        inner sep=0pt
    ] (content) at ([xshift=\dimexpr 1in + \hoffset + \oddsidemargin \relax, yshift=-2.5cm]current page.north west) {
       \usebox{\neo@particles@headercontent}
    };

    \begin{scope}[on background layer]

        \pgfmathsetseed{42}
        \foreach \i in {1,...,60} {
            \pgfmathsetmacro{\xPos}{rnd*21}
            \pgfmathsetmacro{\yPos}{-rnd*8 + 1}
            \pgfmathsetmacro{\size}{0.3 + rnd*0.9}
            \pgfmathsetmacro{\opac}{0.05 + rnd*0.15}

            \pgfmathrandominteger{\colChoice}{0}{2}
            \ifcase\colChoice
               \fill[primaryColor, opacity=\opac] (\xPos cm, \yPos cm) circle (\size cm);
            \or
               \fill[secondaryColor, opacity=\opac] (\xPos cm, \yPos cm) circle (\size cm);
            \or
               \fill[tertiaryColor, opacity=\opac] (\xPos cm, \yPos cm) circle (\size cm);
            \fi
        }

        \fill[backgroundColor, path fading=north]
             ([yshift=1cm]current page.west |- content.south)
             rectangle
             ([yshift=-7cm]current page.east |- content.south);

    \end{scope}

    \draw[\neoschool@globalcolor!10!backgroundColor, line width=1pt, line cap=round]
    ([yshift=-0.5cm]content.south west) --
    ([yshift=-0.5cm]content.south east);

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr 2.5cm + \ht\neo@particles@headercontent + \dp\neo@particles@headercontent + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% Cloud Header
%% ----------------------------------
\newsavebox{\neo@cloud@headercontent}
\newsavebox{\neo@cloud@subject}

\newcommand{\neo@cloudcontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@cloud@headercontent}{%
    \begin{minipage}{\dimexpr\textwidth-2cm}
      \centering
      \neo@printtitle\par\vspace{\neo@title@sep@subtitle}

      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}
  }

  \ifx\@subject\empty
    \sbox{\neo@cloud@subject}{}
  \else
    \sbox{\neo@cloud@subject}{%
      \begin{tikzpicture}
        \node[
          inner xsep=12pt, inner ysep=5pt,
          fill=subjectColor!10!backgroundColor,
          text=subjectColor,
          rounded corners=10pt,
          font=\sffamily\fontsize{9}{9}\selectfont\bfseries
        ] {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}};
      \end{tikzpicture}%
    }
  \fi

  \begin{tikzpicture}[remember picture, overlay]

    \node[
        anchor=north,
        inner sep=0pt
    ] (content) at ([yshift=-4cm]current page.north) {
       \usebox{\neo@cloud@headercontent}
    };

    \begin{scope}[on background layer]

        \pgfmathsetseed{42}

        \foreach \i in {1,...,50} {
            \pgfmathsetmacro{\angle}{rnd*180 + 180}
            \pgfmathsetmacro{\xRadius}{10}
            \pgfmathsetmacro{\yRadius}{4}

            \pgfmathsetmacro{\r}{rnd}

            \pgfmathsetmacro{\xPos}{\r * \xRadius * cos(\angle)}
            \pgfmathsetmacro{\yPos}{\r * \yRadius * sin(\angle) * 0.6}

            \pgfmathsetmacro{\size}{0.4 + rnd*1.5}
            \pgfmathsetmacro{\opac}{0.03 + rnd*0.10}

            \pgfmathrandominteger{\colChoice}{0}{2}
            \ifcase\colChoice
               \fill[primaryColor, opacity=\opac]
                    ([xshift=\xPos cm, yshift=\yPos cm]current page.north) circle (\size cm);
            \or
               \fill[secondaryColor, opacity=\opac]
                    ([xshift=\xPos cm, yshift=\yPos cm]current page.north) circle (\size cm);
            \or
               \fill[tertiaryColor, opacity=\opac]
                    ([xshift=\xPos cm, yshift=\yPos cm]current page.north) circle (\size cm);
            \fi
        }

        \fill[backgroundColor, path fading=north]
             ([yshift=1cm]current page.west |- content.north)
             rectangle
             ([yshift=-2cm]current page.east |- content.north);

    \end{scope}

    \ifx\@subject\empty\else
      \node[
        anchor=south,
        inner sep=0pt
      ] at ([yshift=0.25cm]content.north)
      {\usebox{\neo@cloud@subject}};
    \fi

    \fill[\neoschool@globalcolor!10!backgroundColor, rounded corners=1pt]
         ([yshift=-0.6cm]content.south) ++(-1.5cm, 0) rectangle ++(3cm, 2pt);

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr 3.25cm + \ht\neo@cloud@headercontent + \dp\neo@cloud@headercontent + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% Champagne Header
%% ----------------------------------
\newsavebox{\neo@champagne@headercontent}

\newcommand{\neo@champagnecontent}{%
  \thispagestyle{customfirstpage}
  \ifdefined\headrulewidth \renewcommand{\headrulewidth}{0pt}\fi

  \sbox{\neo@champagne@headercontent}{%
    \begin{minipage}{\dimexpr\textwidth-2cm}
      \centering

      \ifx\@subject\empty\else
        {\usekomafont{subject}\textls[50]{\MakeUppercase{\@subject}}}\par\vspace{\neo@title@sep@subject}
      \fi

      \neo@printtitle\par\vspace{\neo@title@sep@subtitle}

      \ifx\@subtitle\empty\else
        {\usekomafont{subtitle}\@subtitle}
      \fi
    \end{minipage}
  }

  \begin{tikzpicture}[remember picture, overlay]

    \node[
        anchor=north,
        inner sep=0pt
    ] (content) at ([yshift=-1.25cm]current page.north) {
       \usebox{\neo@champagne@headercontent}
    };

    \coordinate (CeilingLine) at ([yshift=-0.8cm]content.south);


    \begin{scope}[on background layer]

        \pgfmathsetseed{150}

        \foreach \i in {1,...,50} {
            \pgfmathsetmacro{\xPos}{rand * 8}

            \pgfmathsetmacro{\yPos}{-rnd * 1.5 - 0.5}

            \pgfmathsetmacro{\size}{0.15 + rnd*0.65}

            \pgfmathsetmacro{\opac}{0.05 + rnd*0.15}

            \pgfmathrandominteger{\colChoice}{0}{2}
            \ifcase\colChoice
               \fill[primaryColor, opacity=\opac]
                    ([xshift=\xPos cm, yshift=\yPos cm - 0.2cm]CeilingLine) circle (\size cm);
            \or
               \fill[secondaryColor, opacity=\opac]
                    ([xshift=\xPos cm, yshift=\yPos cm - 0.2cm]CeilingLine) circle (\size cm);
            \or
               \fill[tertiaryColor, opacity=\opac]
                    ([xshift=\xPos cm, yshift=\yPos cm - 0.2cm]CeilingLine) circle (\size cm);
            \fi
        }

        \fill[backgroundColor, path fading=north]
             ([yshift=-2cm]current page.west |- CeilingLine)
             rectangle
             ([yshift=-4cm]current page.east |- CeilingLine);

    \end{scope}

  \end{tikzpicture}

  \neo@top@compensate

  \vspace*{\dimexpr 3.25cm + \ht\neo@champagne@headercontent + \dp\neo@champagne@headercontent + \if@twocolumn 1cm \else 0cm \fi \relax}
}

%% ==============================================================================
%% Box Styles and Environment
%% ==============================================================================

\newcommand{\neo@defineboxshape}[1]{%
  \tcbset{
    #1boxshape/.is choice,
    #1boxshape/.unknown/.style={sharp corners},
    #1boxshape/bevel/.style={sharp corners, rounded corners=downhill, arc is angular, arc=3mm, auto outer arc},
    #1boxshape/chamfer/.style={arc is angular, arc=2.5mm, auto outer arc},
    #1boxshape/chat/.style={rounded corners, sharp corners=southwest, arc=3.5mm, auto outer arc},
    #1boxshape/curve/.style={rounded corners, sharp corners=downhill, arc=3mm, arc is curved, auto outer arc},
    #1boxshape/leaf/.style={rounded corners, sharp corners=uphill, arc=3mm, arc is curved, auto outer arc},
    #1boxshape/soft/.style={arc=2mm, arc is curved, auto outer arc},
    #1boxshape/rounded/.style={rounded corners, arc is curved},
    #1boxshape/sharp/.style={sharp corners},
    #1boxshape/sharpish/.style={sharpish corners},
    #1boxshape/downhill/.style={sharp corners=downhill},
    #1boxshape/uphill/.style={sharp corners=uphill},
    #1boxshape/east/.style={sharp corners=west, rounded corners=east},
    #1boxshape/west/.style={sharp corners=east, rounded corners=west},
    #1boxshape/north/.style={sharp corners=south, rounded corners=north},
    #1boxshape/south/.style={sharp corners=north, rounded corners=south},
    #1boxshape/northeast/.style={sharp corners, rounded corners=northeast},
    #1boxshape/northwest/.style={sharp corners, rounded corners=northwest},
    #1boxshape/southeast/.style={sharp corners, rounded corners=southeast},
    #1boxshape/southwest/.style={sharp corners, rounded corners=southwest},
    #1titleshape/.is choice,
    #1titleshape/.unknown/.style={rounded corners},
    #1titleshape/bevel/.style={sharp corners, rounded corners=downhill, arc is angular, arc=1mm, auto outer arc},
    #1titleshape/chamfer/.style={arc is angular, arc=1mm, auto outer arc},
    #1titleshape/chat/.style={rounded corners, sharp corners=southwest, arc=1mm, auto outer arc},
    #1titleshape/curve/.style={rounded corners, sharp corners=downhill, arc=1mm, arc is curved, auto outer arc},
    #1titleshape/leaf/.style={rounded corners, sharp corners=uphill, arc=1mm, arc is curved, auto outer arc},
    #1titleshape/soft/.style={rounded corners, arc=1mm, arc is curved, auto outer arc},
    #1titleshape/rounded/.style={rounded corners, arc is curved},
    #1titleshape/sharp/.style={sharp corners},
    #1titleshape/sharpish/.style={sharpish corners},
    #1titleshape/downhill/.style={sharp corners=downhill},
    #1titleshape/uphill/.style={sharp corners=uphill},
    #1titleshape/east/.style={sharp corners=west, rounded corners=east},
    #1titleshape/west/.style={sharp corners=east, rounded corners=west},
    #1titleshape/north/.style={sharp corners=south, rounded corners=north},
    #1titleshape/south/.style={sharp corners=north, rounded corners=south},
    #1titleshape/northeast/.style={sharp corners, rounded corners=northeast},
    #1titleshape/northwest/.style={sharp corners, rounded corners=northwest},
    #1titleshape/southeast/.style={sharp corners, rounded corners=southeast},
    #1titleshape/southwest/.style={sharp corners, rounded corners=southwest},
  }%
}

\neo@defineboxshape{thm}
\neo@defineboxshape{ex}
\neo@defineboxshape{code}
\neo@defineboxshape{ad}
\neo@defineboxshape{neo}
\neo@defineboxshape{side}

%% Common Style Parameters
%% ----------------------------------

%% Mathematical Boxes
%% ----------------------------------
% Standard math box with configurable colors%
\NewDocumentCommand\mathbox{D<>{mathHighlightColor}O{tertiaryColor}O{}}{%
  \tcboxmath[%
  colback=#1,
  colframe=#2,
  colupper=\neoschool@globalcolor,
  size=fbox,
  boxrule=\neo@normalrule,
  #3
  ]
}

% Math highlighting with size adaptation
\newcommand{\mhl}[2][mathHighlightColor]{%
  \mathchoice
  {\colorbox{#1}{$\displaystyle#2$}}
  {\colorbox{#1}{$\textstyle#2$}}
  {\colorbox{#1}{$\scriptstyle#2$}}
  {\colorbox{#1}{$\scriptscriptstyle#2$}}
}

%% Answer Fields
%% ----------------------------------
% Empty box for answers
\newcommand{\emptybox}[3][]{%
  \begin{tcolorbox}[%
    enhanced,
    boxrule=\neo@normalrule,
    boxsep=0pt,
    width=#2,
    height=#3,
    colback=emptyboxBgColor,
    colframe=primaryColor!40!backgroundColor,
    arc=\neoschool@neoboxarc,
    neoboxshape=\neoschool@neoboxshape,
    before skip=\neo@effective@common@vsep,
    after skip=\neo@effective@common@vsep,
    #1,
    ]
    \null
  \end{tcolorbox}
}

\newlength{\neo@common@vsep}
\setlength{\neo@common@vsep}{0.75\baselineskip}
\newlength{\neo@effective@common@vsep}
\setlength{\neo@effective@common@vsep}{\neo@vspace@factor\neo@common@vsep}

% Answer field
\newlength{\neo@answerbaselineskip}
\setlength{\neo@answerbaselineskip}{1.35\baselineskip}

\NewDocumentCommand{\answerfield}{O{\linewidth} m}{%
  \begin{tcolorbox}[
    enhanced,
    colback=answerfieldBgColor,
    frame hidden,
    boxrule=0pt,
    arc=\neoschool@neoboxarc,
    neoboxshape=\neoschool@neoboxshape,
    width=#1,
    height=#2\neo@answerbaselineskip,
    boxsep=0pt,
    left=0pt,
    right=0pt,
    top=0pt,
    bottom=0pt,
    before skip=\neo@effective@common@vsep,
    after skip=\neo@effective@common@vsep,
    ]
    \phantom{\rule{1pt}{#2\neo@answerbaselineskip}}
  \end{tcolorbox}
  \par
}

% Answer field with frame and white background
\NewDocumentCommand{\answerframe}{O{\linewidth} m O{}}{%
  \begin{tcolorbox}[%
    enhanced,
    boxrule=\neo@normalrule,
    colframe=answerframeFrameColor,
    colback=backgroundColor,
    arc=\neoschool@neoboxarc,
    neoboxshape=\neoschool@neoboxshape,
    width=#1,
    height=#2\neo@answerbaselineskip,
    boxsep=0pt,
    left=2pt,
    right=2pt,
    top=2pt,
    bottom=2pt,
    before skip=\neo@effective@common@vsep,
    after skip=\neo@effective@common@vsep,
    #3,
    ]
    \phantom{\rule{1pt}{#2\neo@answerbaselineskip}}
  \end{tcolorbox}
  \par
}

% Colored box
\newcommand{\neocolorbox}[2][primaryColor]{%
  \begin{tcolorbox}[%
    enhanced,
    fontupper=\color{\neoschool@globalcolor},
    arc=\neoschool@neoboxarc,
    neoboxshape=\neoschool@neoboxshape,
    boxrule=\neo@normalrule,
    width=\linewidth,
    colback=#1!5!backgroundColor,
    frame hidden,
    before skip=12pt plus 2pt,
    after skip=18pt plus 2pt
    ]
    #2
  \end{tcolorbox}
}

%% Inline Boxes
%% ----------------------------------
\NewDocumentCommand{\inlinebox}{ O{definitionColor!\neoschool@neoframeopacity!backgroundColor} O{\ifnum\neoschool@neoframeopacity<60 definitionColor\else backgroundColor\fi} O{definitionColor!\neoschool@neoframeopacity!backgroundColor} m }{%
  \tcbox[%
  enhanced,
  nobeforeafter,
  tcbox raise base,
  boxrule=\neo@thinrule,
  top=0mm,
  bottom=0mm,
  right=0mm,
  left=0mm,
  arc=\neoschool@neoboxarc,
  neotitleshape=\neoschool@neoboxshape,
  boxsep=2pt,
  colback=#1,
  colupper=#2,
  colframe=#3
  ]{\sffamily #4}%
}

%% General Purpose Box Environment
%% ----------------------------------

\newlength{\neo@neobox@vsep}
\setlength{\neo@neobox@vsep}{0.75\baselineskip}
\newlength{\neo@effective@neobox@vsep}
\setlength{\neo@effective@neobox@vsep}{\neo@vspace@factor\neo@neobox@vsep}

\NewDocumentEnvironment{neobox}{ s O{} }{%
  \begin{tcolorbox}[%
    enhanced,
    bicolor,
    colframe=primaryColor!\neoschool@neoframeopacity!backgroundColor,
    colback=\IfBooleanTF{#1}{neoboxBgColor}{backgroundColor},
    arc=\neoschool@neoboxarc,
    neoboxshape=\neoschool@neoboxshape,
    breakable,
    boxrule=\IfBooleanTF{#1}{0pt}{\neo@normalrule},
    left=\neo@hpadding,
    right=\neo@hpadding,
    toptitle=2pt, bottomtitle=2pt,
    fonttitle=\csname\neoschool@headweight\endcsname\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname,
    colupper=\neoschool@globalcolor,
    before skip=\neo@effective@neobox@vsep,
    after skip=\neo@effective@neobox@vsep,
    #2
    ]
  }{%
  \end{tcolorbox}
}

\ExplSyntaxOn
\cs_new:cpn {neobox*} {\neobox*}
\cs_new_eq:cN {endneobox*} \endneobox
\ExplSyntaxOff

%% Side-by-Side Box Environment
%% ----------------------------------

\ifneo@darktheme
  \newcommand{\neo@sidebysidetop}[1]{#1!20!backgroundColor}
\else
  \newcommand{\neo@sidebysidetop}[1]{#1!10}
\fi

\newtcolorbox{sidebyside}[1][]{%
  sidebyside,
  enhanced,
  bicolor,
  arc=\neoschool@sideboxarc,
  colback=\ifneo@unicolor\neo@sidebysidetop{primaryColor}\else\neo@sidebysidetop{codeFrame}\fi,
  colbacklower=backgroundColor,
  colframe=\ifneo@unicolor primaryColor!\neoschool@sideframeopacity!backgroundColor\else codeFrame!\neoschool@sideframeopacity!backgroundColor\fi,
  colupper=\neoschool@globalcolor,
  collower=\neoschool@globalcolor,
  fonttitle=\csname\neoschool@headweight\endcsname\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname,
  coltitle=\ifnum\neoschool@sideframeopacity<60 codeFrame\else backgroundColor\fi,
  subtitle style={colback=\neo@sidebysidetop{codeFrame}, opacityback=0, colframe=codeFrame!\neoschool@sideframeopacity!backgroundColor, opacityframe=0, boxrule=0pt, before=\vspace{-5pt}, before upper={\centering\color{codeFrame}}},
  boxsep=10pt,
  left=0pt,
  right=0pt,
  top=0pt,
  bottom=0pt,
  boxrule=\neo@normalrule,
  toptitle=-5pt,
  bottomtitle=-6pt,
  lefttitle=0\neo@code@title@hpadding,
  righttitle=\neo@code@title@hpadding,
  sideboxshape=\neoschool@sideboxshape,
  before skip=\neo@effective@beforeafterskip,
  after skip=\neo@effective@beforeafterskip,
  #1
}

%% ==============================================================================
%% Listings Styles and Setting
%% ==============================================================================

\ifneoschool@centeredcode
  \def\neo@codecenter{center,}
\else
  \def\neo@codecenter{}
\fi

%% tcolorbox Styles
%% ----------------------------------

%% Base Box Parameters
%% ----------------------------------
\tcbset{%
  neo@commonbox/.style={%
    enhanced,
    breakable,
    /utils/exec={%
        \pgfmathsetmacro{\neo@frame@opacity}{0.5 * \neoschool@codeframeopacity}%
    },
    colframe=codeFrame!\neo@frame@opacity!backgroundColor,
    colback=codeBackground,
    arc=\neoschool@codeboxarc,
    boxrule=\neo@codeborder,
    titlerule=0pt,
    left=\neo@code@box@hpadding,
    right=\neo@code@box@hpadding,
    top=\neo@code@box@vpadding,
    bottom=\neo@code@box@vpadding,
    toptitle=\neo@code@title@vpadding,
    bottomtitle=\neo@code@title@vpadding,
    lefttitle=\neo@code@title@hpadding,
    righttitle=\neo@code@title@hpadding,
    fonttitle=\csname\neoschool@headweight\endcsname\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname,
    coltitle=\ifnum\neoschool@codeframeopacity<60 codeTitle\else backgroundColor\fi,
    colbacktitle=codeFrame!\neoschool@codeframeopacity!backgroundColor,
    codeboxshape=\neoschool@codeboxshape,
    before skip=\neo@effective@code@beforeafterskip,
    after skip=\neo@effective@code@beforeafterskip,
    \neo@getcodebackstyle
  }
}

%% Box Styles
%% ----------------------------------
\tcbset{%
  neo@code@plain/.style={%
    neo@commonbox,
    \neo@getcodeframestyle,
  },
  neo@code@bar/.style={%
    neo@commonbox,
    frame hidden,
    boxrule=0pt,
    borderline west={3pt}{0pt}{codeFrame!\neoschool@codeframeopacity!backgroundColor},
    shadow={2pt}{-2pt}{0mm}{structuralColor!15!backgroundColor},
    left=1em, right=1em,
    lefttitle=1.85\neo@code@title@hpadding,
    righttitle=1.85\neo@code@title@hpadding,
  },
  neo@code@frame/.style={%
    neo@commonbox,
    \neo@getcodeframestyle,
  },
  neo@code@shadow/.style={%
    neo@commonbox,
    \neo@getcodeframestyle,
    shadow={2pt}{-2pt}{0pt}{structuralColor!20!backgroundColor},
  },
  neo@code@line/.style={%
    neo@commonbox,
    frame hidden,
    boxrule=0pt,
    sharp corners,
    overlay unbroken={\draw[codeFrame!\neoschool@codeframeopacity!backgroundColor, line width=1.2pt] (frame.north west) -- (frame.north east);},
    overlay first={\draw[codeFrame!\neoschool@codeframeopacity!backgroundColor, line width=1.2pt] (frame.north west) -- (frame.north east);},
    overlay last={},
  },
  neo@code@lines/.style={%
    neo@commonbox,
    frame hidden,
    boxrule=0pt,
    sharp corners,
    overlay unbroken={\draw[codeFrame!\neoschool@codeframeopacity!backgroundColor, line width=1.2pt] (frame.north west) -- (frame.north east);
    \draw[codeFrame!\neoschool@codeframeopacity!backgroundColor, line width=1.2pt] (frame.south west) -- (frame.south east);},
    overlay first={\draw[codeFrame!\neoschool@codeframeopacity!backgroundColor, line width=1.2pt] (frame.north west) -- (frame.north east);},
    overlay last={\draw[codeFrame!\neoschool@codeframeopacity!backgroundColor, line width=1.2pt] (frame.south west) -- (frame.south east);},
  },
}

\newcommand{\neo@setcodenumbership}[1]{%
  \def\neo@testval{#1}%
  %
  \ifnum\pdf@strcmp{\neo@testval}{bar}=0
    \ifneo@listings\lstset{numbersep=18pt}\fi
    \ifneo@minted\setminted{numbersep=18pt}\fi
  \else
    \ifneo@codenoframe
      \ifneo@codenoback
        \ifneo@listings\lstset{numbersep=10pt}\fi
        \ifneo@minted\setminted{numbersep=10pt}\fi
      \else
        \ifneo@listings\lstset{numbersep=18pt}\fi
        \ifneo@minted\setminted{numbersep=18pt}\fi
      \fi
    \else
      \ifneo@listings\lstset{numbersep=18pt}\fi
      \ifneo@minted\setminted{numbersep=18pt}\fi
    \fi
  \fi
}

\neo@setcodenumbership{\neoschool@codestyle}

\ifneo@listings

  \ifneo@darktheme
    \definecolor{codeFont}{HTML}{FAFAFA}
  \else
    \definecolor{codeFont}{HTML}{1F2328}
  \fi

  %% Base Listing Style
  %% ----------------------------------
  \lstdefinestyle{neo@lst@base}{%
    basicstyle=\ttfamily\small\color{codeFont},
    columns=fullflexible,
    breaklines=true,
    keepspaces=true,
    showstringspaces=false,
    tabsize=4,
    inputencoding=utf8,
    extendedchars=true,
    escapeinside={(*@}{@*)},
    aboveskip=.25\baselineskip,
    belowskip=.25\baselineskip,
    frame=none,
    literate={%
      á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
    {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
    {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
    {À}{{\`A}}1 {È}{{\`E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
    {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
    {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
    {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
    {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
    {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
    {ẞ}{{\SS}}1 {ç}{{\c{c}}}1 {Ç}{{\c{C}}}1 {ø}{{\o}}1 {Ø}{{\O}}1
    {å}{{\aa}}1 {Å}{{\AA}}1 {ã}{{\~a}}1 {õ}{{\~o}}1 {Ã}{{\~A}}1
    {Õ}{{\~O}}1 {ñ}{{\~n}}1 {Ñ}{{\~N}}1 {¿}{{?`}}1 {¡}{{!`}}1
    {°}{{\textdegree}}1 {º}{{\textordmasculine}}1 {ª}{{\textordfeminine}}1
    {€}{{\euro}}1 {£}{{\pounds}}1 {©}{{\copyright}}1 {®}{{\textregistered}}1
    {«}{{\guillemotleft}}1 {»}{{\guillemotright}}1 {Ð}{{\DH}}1 {ð}{{\dh}}1
    {Ý}{{\'Y}}1 {ý}{{\'y}}1 {Þ}{{\TH}}1 {þ}{{\th}}1 {Ă}{{\u{A}}}1
    {ă}{{\u{a}}}1 {Ą}{{\k{A}}}1 {ą}{{\k{a}}}1 {Ć}{{\'C}}1 {ć}{{\'c}}1
    {Č}{{\v{C}}}1 {č}{{\v{c}}}1 {Ď}{{\v{D}}}1 {ď}{{\v{d}}}1 {Đ}{{\DJ}}1
    {đ}{{\dj}}1 {Ė}{{\.{E}}}1 {ė}{{\.{e}}}1 {Ę}{{\k{E}}}1 {ę}{{\k{e}}}1
    {Ě}{{\v{E}}}1 {ě}{{\v{e}}}1 {Ğ}{{\u{G}}}1 {ğ}{{\u{g}}}1 {Ĩ}{{\~I}}1
    {ĩ}{{\~\i}}1 {Į}{{\k{I}}}1 {į}{{\k{i}}}1 {İ}{{\.{I}}}1 {ı}{{\i}}1
    {Ĺ}{{\'L}}1 {ĺ}{{\'l}}1 {Ľ}{{\v{L}}}1 {ľ}{{\v{l}}}1 {Ł}{{\L{}}}1
    {ł}{{\l{}}}1 {Ń}{{\'N}}1 {ń}{{\'n}}1 {Ň}{{\v{N}}}1 {ň}{{\v{n}}}1
    {Ő}{{\H{O}}}1 {ő}{{\H{o}}}1 {Ŕ}{{\'{R}}}1 {ŕ}{{\'{r}}}1 {Ř}{{\v{R}}}1
    {ř}{{\v{r}}}1 {Ś}{{\'S}}1 {ś}{{\'s}}1 {Ş}{{\c{S}}}1 {ş}{{\c{s}}}1
    {Š}{{\v{S}}}1 {š}{{\v{s}}}1 {Ť}{{\v{T}}}1 {ť}{{\v{t}}}1 {Ũ}{{\~U}}1
  }

  \renewcommand*{\lstlistingname}{\neo@codename}

  %% Specific Listing Styles
  %% -----------------------------------------------------------------------

  \lstdefinestyle{neo@lst@syntax}{%
    style=neo@lst@base,
    keywordstyle=\bfseries\color{codeKeyword},
    commentstyle=\color{codeComment},
    stringstyle=\itshape\color{codeString},
    emphstyle=\bfseries\color{codeIdentifier},
    numberstyle=\tiny\sffamily\color{codeNumber},
    aboveskip=0pt,
    belowskip=0pt,
    frame=none,
    numbers=none,
    backgroundcolor={},
    xleftmargin=-2pt,
    framesep=3pt
  }

  \ifneo@codenonum
    \lstdefinestyle{neo@lst@default}{
      style=neo@lst@syntax,
      numbersep=\neo@codenumbersep
    }
  \else
    \lstdefinestyle{neo@lst@default}{
      style=neo@lst@syntax,
      numbers=left,
      numbersep=\neo@codenumbersep
    }
  \fi

  \lstset{style=neo@lst@default}

  %% Language-Specific Definitions
  %% ----------------------------------

  % JSON
  \lstdefinelanguage{json}{%
    keywords={true,false,null},
    sensitive=false,
    morestring=[b]",
    morecomment=[l]{//},
    morecomment=[s]{/*}{*/},
    literate=
    *{0}{{{\color{codeComment}0}}}{1}
    {1}{{{\color{codeComment}1}}}{1}
    {2}{{{\color{codeComment}2}}}{1}
    {3}{{{\color{codeComment}3}}}{1}
    {4}{{{\color{codeComment}4}}}{1}
    {5}{{{\color{codeComment}5}}}{1}
    {6}{{{\color{codeComment}6}}}{1}
    {7}{{{\color{codeComment}7}}}{1}
    {8}{{{\color{codeComment}8}}}{1}
    {9}{{{\color{codeComment}9}}}{1}
    {:}{{{\color{codeKeyword}{:}}}}{1}
    {,}{{{\color{codeKeyword}{,}}}}{1}
    {\{}{{{\color{codeKeyword}{\{}}}}{1}
    {\}}{{{\color{codeKeyword}{\}}}}}{1}
    {[}{{{\color{codeKeyword}{[}}}}{1}
    {]}{{{\color{codeKeyword}{]}}}}{1},
  }

  % YAML
  \lstdefinelanguage{yaml}{%
    keywords={true,false,null,yes,no,on,off},
    sensitive=false,
    morestring=[b]",
    morestring=[b]',
    morecomment=[l]{\#},
    literate=
    *{:}{{{\color{codeKeyword}{:}}}}{1}
    {-}{{{\color{codeKeyword}{-}}}}{1}
    {>}{{{\color{codeKeyword}{>}}}}{1}
    {|}{{{\color{codeKeyword}{|}}}}{1},
  }

  % TOML
  \lstdefinelanguage{toml}{%
    keywords={true,false},
    sensitive=false,
    morestring=[b]",
    morestring=[b]',
    morecomment=[l]{\#},
    literate=
    *{=}{{{\color{codeKeyword}{=}}}}{1}
    {[}{{{\color{codeKeyword}{[}}}}{1}
    {]}{{{\color{codeKeyword}{]}}}}{1}
    {.}{{{\color{codeKeyword}{.}}}}{1},
  }

  % CSV
  \lstdefinelanguage{csv}{%
    sensitive=false,
    morestring=[b]",
    morecomment=[l]{\#},
    literate=
    *{,}{{{\color{codeKeyword}{,}}}}{1}
    {;}{{{\color{codeKeyword}{;}}}}{1},
  }

  % Markdown
  \lstdefinelanguage{markdown}{%
    sensitive=false,
    morecomment=[l]{\%},
    literate=
    *{\#}{{{\color{codeKeyword}{\#}}}}{1}
    {-}{{{\color{codeKeyword}{-}}}}{1}
    {*}{{{\color{codeKeyword}{*}}}}{1}
    {>}{{{\color{codeKeyword}{>}}}}{1}
    {`}{{{\color{codeKeyword}{`}}}}{1}
    {|}{{{\color{codeKeyword}{|}}}}{1}
    {[}{{{\color{codeKeyword}{[}}}}{1}
    {]}{{{\color{codeKeyword}{]}}}}{1}
    {(}{{{\color{codeKeyword}{(}}}}{1}
    {)}{{{\color{codeKeyword}{)}}}}{1},
  }

  % HTML
  \lstdefinelanguage{html}{%
    sensitive=false,
    keywords={html,head,body,div,span,p,a,img,h1,h2,h3,h4,h5,h6,
      ul,ol,li,table,tr,td,th,thead,tbody,tfoot,
      form,input,button,select,option,textarea,label,
      script,style,link,meta,title,br,hr,
      header,footer,nav,main,section,article,aside,figure,figcaption,
      video,audio,source,canvas,svg,iframe,
      DOCTYPE,doctype},
    morestring=[b]",
    morestring=[b]',
    morecomment=[s]{<!--}{-->},
    tag=[s]<>,
    alsoletter={/},
    literate=
    *{<}{{{\color{codeKeyword}{<}}}}{1}
    {>}{{{\color{codeKeyword}{>}}}}{1}
    {/}{{{\color{codeKeyword}{/}}}}{1}
    {=}{{{\color{codeKeyword}{=}}}}{1},
  }

  %% Language-Specific Styles
  %% ----------------------------------
  \lstdefinestyle{python}{%
    language=Python,
    morekeywords={%
      @property,@classmethod,@staticmethod,
    },
    emph={%
      range,int,str,list,dict,set,bool,float,
      tuple,super,type,print,len,sum,min,max,
      enumerate,zip,map,filter,any,all,as,assert,
      nonlocal,with,yield,self,True,False,None,
      lambda,raise,await,async,
    },
    morestring=[b]""",
  }

  \lstdefinestyle{java}{%
    language=Java,
    morekeywords={%
      @Override,@Deprecated,@SuppressWarnings,
      @FunctionalInterface,@SafeVarargs,
      var,record,sealed,permits,
      public,private,protected,static,final,
      abstract,interface,extends,implements
    },
    morecomment=[s]{/*}{*/},
    morecomment=[l]//,
    morestring=[b]",
  }

  \lstdefinestyle{cpp}{%
    language=C++,
    morekeywords={%
      nullptr,constexpr,override,final,
      template,typename,concept,requires,
      auto,decltype,noexcept,static_assert,
      thread_local,alignas,alignof
    },
    morecomment=[s]{/*}{*/},
    morecomment=[l]//,
    morestring=[b]",
  }

  \lstdefinestyle{js}{%
    language=JavaScript,
    style,
    morekeywords={%
      let,const,var,function,class,extends,
      static,get,set,new,this,super,
      import,export,default,from,as,
      async,await,yield,return,
      undefined,null,true,false
    },
    morecomment=[s]{/*}{*/},
    morecomment=[l]//,
    morestring=[b]",
    morestring=[b]',
    morestring=[b]`,
  }

  \lstdefinestyle{sql}{%
    language=SQL,
    morekeywords={%
      CREATE,TABLE,INSERT,INTO,VALUES,
      SELECT,FROM,WHERE,GROUP,BY,HAVING,
      ORDER,LIMIT,JOIN,LEFT,RIGHT,INNER,
      UPDATE,SET,DELETE,ALTER,DROP,
      CONSTRAINT,PRIMARY,KEY,FOREIGN,
      REFERENCES,CASCADE,INDEX,
      TEXT, REAL, OFFSET, WITH
    },
    sensitive=false,
  }

  \lstdefinestyle{latex}{%
    language={[latex]TeX},
    texcsstyle=*\bfseries\color{codeKeyword},
    moretexcs = {tableofcontents,index,footnote,sout,part,chapter,subsection,subsubsection,paragraph,maketitle,leqslant,geqslant,varnothing,includegraphics,draw,node,theoremstyle,newtcolorbox,tcbuselibrary,newtcbtheorem,SI,ang,ce,chemfig,norm,abs,deriv,R,N,Z,ProvidesPackage,color,ps,montitre,lstset,lstinline,lstinputlisting,definecolor,textcolor,colorlet,setlength,colorbox,fcolorbox,addplot,pgfplotsset,opadd,opsub,opmul,opdiv,opgcd,metre,second,squared,kelvin,coulomb,volt,per,opprint,legend,tkzDefPoint,tkzInterLL,tkzGetPoint,tkzDrawPolygon,tkzDrawSegments,tkzMarkRightAngles,tkzMarkSegments,tkzLabelPoints,boxed,boldsymbol,boldmath,multirow,addbibresource,printbibliography,bm,dfrac,meter,thead,makecell,euro,cellcolor,rowcolor,columncolor,base,repere,rog,ron,rond,derpart,drv,integrer,nuplet,anuplet,ensemble,E,V,suite,suitar,suitgeo,vect,norme,tr,rank,adj,sgn,im,di,intabfx,integrale,e,moinsinf,plusinf,sisetup,restoregeometry,newgeometry,lefttitle,righttitle,colbacklower,neoheader,neograph,textwithimage,withqrcode,positionobject,splitcontent,grid,customgrid,frenchgrid,notebook,nbminorgrid,nbmajorgrid,xsimsetup,correct,choice,checkbox,tcblower,usetheme,usecolortheme,institute,frame,alert,twocoltoc,codeinline,codeinput,tdnote,tdmark,boxnote,barre,cg,pp,pg,cd,ds,Oij,Oijk,Ouv,neoline,neocol,vectt,mhl,competencies,vardots,answerframe,answerfield,mrk,gradingstrip},
    morecomment=[l]{\%},
    morestring=[b]",
    sensitive=true
  }

  \lstdefinestyle{bash}{%
    language=bash,
    morekeywords={%
      source, alias, bg, bind, break, builtin, cd, command, compgen,
      complete, continue, declare, dirs, disown, echo, enable, eval,
      exec, exit, export, fc, fg, getopts, hash, help, history, jobs,
      kill, let, local, logout, mapfile, popd, printf, pushd, pwd,
      read, readarray, readonly, return, set, shift, shopt, suspend,
      test, times, trap, type, typeset, ulimit, umask, unalias,
      unset, wait
    },
    morestring=[b]",
    morestring=[b]',
    morestring=[b]\`,
    morecomment=[l]{\#},
    literate=
    *{\$}{{{\color{codeKeyword}{\$}}}}{1}
    {|}{{{\color{codeKeyword}{|}}}}{1}
    {>}{{{\color{codeKeyword}{>}}}}{1}
    {<}{{{\color{codeKeyword}{<}}}}{1}
    {&}{{{\color{codeKeyword}{\&}}}}{1},
  }

  \lstdefinestyle{assembly}{%
    keywords={%
      % Data transfer
      MOV,LEA,XCHG,MOVZX,MOVSX,LDR,STR,LDA,STA,LOAD,STORE,
      % Arithmetic
      ADD,SUB,MUL,DIV,IMUL,IDIV,INC,DEC,NEG,ADC,SBC,SBB,
      MLA,RSB,
      % Logic
      AND,OR,XOR,NOT,ORR,EOR,TEST,TST,TEQ,CMP,MVN,
      % Shifts and rotations
      SHL,SHR,SAL,SAR,ROL,ROR,LSL,LSR,ASR,
      % Unconditional jumps
      JMP,CALL,RET,LOOP,BL,BX,BRA,
      % Conditional jumps (x86)
      JE,JNE,JG,JGE,JL,JLE,JZ,JNZ,JA,JB,JAE,JBE,
      JC,JNC,JO,JNO,JS,JNS,
      % Conditional branches (ARM)
      BEQ,BNE,BLT,BGT,BLE,BGE,
      % Conditional branches (LMC)
      BRP,BRZ,
      % Stack
      PUSH,POP,STMFD,LDMFD,STMDB,LDMIA,
      % I/O and system
      IN,OUT,INP,OTC,INT,SYSCALL,SWI,SVC,
      % Control
      NOP,HALT,HLT,DAT
    },
    sensitive=false,
    emph={%
      % Directives
      section,global,extern,segment,data,text,bss,
      db,dw,dd,dq,resb,resw,resd,resq,times,equ,
      byte,word,dword,qword,
      % x86 registers (16-bit)
      ax,bx,cx,dx,si,di,bp,
      % x86 registers (32-bit)
      eax,ebx,ecx,edx,esi,edi,esp,ebp,
      % x86 registers (64-bit)
      rax,rbx,rcx,rdx,rsi,rdi,rsp,rbp,
      % ARM registers
      r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,
      sp,lr,pc
    },
    morecomment=[l]{;},
    morecomment=[l]{\#},
    morestring=[b]",
    morestring=[b]',
    literate=
    *{,}{{{\color{codeKeyword}{,}}}}{1}
    {:}{{{\color{codeKeyword}{:}}}}{1}
    {[}{{{\color{codeKeyword}{[}}}}{1}
    {]}{{{\color{codeKeyword}{]}}}}{1}
    {\$}{{{\color{codeKeyword}{\$}}}}{1}
    {\%}{{{\color{codeKeyword}{\%}}}}{1},
  }

  \lstdefinestyle{lisp}{%
    language=Lisp,
    morekeywords={%
      setq, setf, loop, do, progn, when, unless
    },
    literate=
    *{(}{{{\color{codeKeyword}{(}}}}{1}
    {)}{{{\color{codeKeyword}{)}}}}{1}
    {'}{{{\color{codeKeyword}{'}}}}{1}
    {`}{{{\color{codeKeyword}{`}}}}{1}
    {,}{{{\color{codeKeyword}{,}}}}{1},
  }

  \lstdefinestyle{json}{%
    language=json,
  }

  \lstdefinestyle{yaml}{%
    language=yaml,
  }

  \lstdefinestyle{toml}{%
    language=toml,
  }

  \lstdefinestyle{csv}{%
    language=csv,
  }

  \lstdefinestyle{markdown}{%
    language=markdown,
  }

  \lstdefinestyle{html}{%
    language=html,
    emph={%
      class,id,href,src,alt,style,type,name,value,placeholder,
      action,method,target,rel,charset,content,lang,
      width,height,onclick,onload,data,role,aria
    },
  }

  \lstdefinestyle{text}{%
    language={},
    keywords={},
  }

  %% Environment Definitions
  %% ----------------------------------

  % Counter for code listings
  \newcounter{lstcode}

  % Code listing environment
  \NewTCBListing[use counter=lstcode]{code}{ O{} +m !O{} !O{\neoschool@codestyle} !D<>{\neoschool@codewidth} !O{} }{%
    listing only,
    enhanced,
    breakable,
    fontupper=\color{\neoschool@globalcolor},
    width=#5\linewidth,
    listing options={%
      style=#2,
      #1
    },
    code={%
      \neo@setcodenumbership{#4}
      \IfEqCase{#4}{%
        {}{\tcbset{neo@code@plain}}
        {plain}{\tcbset{neo@code@plain}}
        {bar}{\tcbset{neo@code@bar}}
        {frame}{\tcbset{neo@code@frame}}
        {shadow}{\tcbset{neo@code@shadow}}
        {line}{\tcbset{neo@code@line}}
        {lines}{\tcbset{neo@code@lines}}
      }[\PackageError{code}{Unknown Style: #4}{}]
      \ifx\relax#3\relax
        \tcbset{title={}}
      \else
        \tcbset{title={\lstlistingname~\thelstcode\neoschool@codeseparator~~#3},\neoschool@boxtitle}
      \fi
    },
    \neo@codecenter,
    #6
  }

  \NewTCBListing{codenonum}{ O{} m !O{} !O{\neoschool@codestyle} !D<>{\neoschool@codewidth} !O{} }{%
    listing only,
    enhanced,
    breakable,
    fontupper=\color{\neoschool@globalcolor},
    width=#5\linewidth,
    listing options={
      style=#2,
      #1
    },
    code={
      \neo@setcodenumbership{#4}
      \IfEqCase{#4}{%
        {}{\tcbset{neo@code@plain}}
        {plain}{\tcbset{neo@code@plain}}
        {bar}{\tcbset{neo@code@bar}}
        {frame}{\tcbset{neo@code@frame}}
        {shadow}{\tcbset{neo@code@shadow}}
        {line}{\tcbset{neo@code@line}}
        {lines}{\tcbset{neo@code@lines}}
      }[\PackageError{code}{Unknown Style: #4}{}]
      \ifx\relax#3\relax
        \tcbset{title={}}
      \else
        \tcbset{title={#3},\neoschool@boxtitle}
      \fi
    },
    \neo@codecenter,
    #6
  }

  \expandafter\let\csname code*\endcsname\codenonum
  \expandafter\let\csname endcode*\endcsname\endcodenonum

  % Inline code
  \newcommand{\codeinline}[2][]{%
    \lstinline[style=#1]{#2}
  }

  % Code input
  \NewTCBInputListing{\codeinputnum}{ O{} m m !O{} !O{\neoschool@codestyle} !D<>{\neoschool@codewidth} !O{} }{%
    listing only,
    boxrule=0pt,
    enhanced,
    breakable,
    fontupper=\color{\neoschool@globalcolor},
    width=#6\linewidth,
    listing file={#3},
    listing options={%
      style={#2},
      #1
    },
    frame hidden,
    colback=codeBackground,
    boxrule=0pt,
    left=0pt,
    right=0pt,
    top=0pt,
    bottom=0pt,
    code={%
      \neo@setcodenumbership{#5}
      \IfEqCase{#5}{%
        {}{\tcbset{neo@code@plain}}
        {plain}{\tcbset{neo@code@plain}}
        {bar}{\tcbset{neo@code@bar}}
        {frame}{\tcbset{neo@code@frame}}
        {shadow}{\tcbset{neo@code@shadow}}
        {line}{\tcbset{neo@code@line}}
        {lines}{\tcbset{neo@code@lines}}
      }[\PackageError{code}{Unknown Style: #5}{}]
      \ifx\relax#4\relax
        \tcbset{title={}}
      \else
        \tcbset{title={\neo@codename~\thelstcode\neoschool@codeseparator~~#4},\neoschool@boxtitle}
      \fi
    },
    \neo@codecenter,
    #7
  }

  \NewTCBInputListing{\codeinputnonum}{ O{} m m !O{} !O{\neoschool@codestyle} !D<>{\neoschool@codewidth} !O{} }{
    listing only,
    boxrule=0pt,
    enhanced,
    breakable,
    fontupper=\color{\neoschool@globalcolor},
    width=#6\linewidth,
    listing file={#3},
    listing options={
      style={#2},
      #1
    },
    frame hidden,
    colback=codeBackground,
    code={
      \neo@setcodenumbership{#5}
      \IfEqCase{#5}{%
        {}{\tcbset{neo@code@plain}}
        {plain}{\tcbset{neo@code@plain}}
        {bar}{\tcbset{neo@code@bar}}
        {frame}{\tcbset{neo@code@frame}}
        {shadow}{\tcbset{neo@code@shadow}}
        {line}{\tcbset{neo@code@line}}
        {lines}{\tcbset{neo@code@lines}}
      }[\PackageError{code}{Unknown Style: #5}{}]
      \ifx\relax#4\relax
        \tcbset{title={}}
      \else
        \tcbset{title={#4},\neoschool@boxtitle}
      \fi
    },
    \neo@codecenter,
    #7
  }

  \DeclareRobustCommand{\codeinput}{%
    \@ifstar
    {\codeinputnonum}%
    {\codeinputnum}%
  }

  %% Side-by-Side Code Environment
  %% ----------------------------------

  \newtcblisting{codeside}[2][]{%
    standard jigsaw,
    listing only,
    enhanced,
    breakable,
    fontupper=\color{\neoschool@globalcolor},
    opacityback=0,
    opacityframe=0,
    fonttitle=\sffamily\bfseries,
    arc=1pt,
    colback=codeBackground,
    colframe=codeFrame,
    boxsep=0pt,
    left=10pt,
    right=0pt,
    top=0pt,
    bottom=0pt,
    lefttitle=1.7mm,
    width=\linewidth,
    listing options={%
      style=#2,
      #1
    }
  }

\else\ifneo@minted

    %% Environment Definitions
    %% ----------------------------------
    \newcounter{mintcode}

    \ifneo@print
      \ifneo@codenonum
        \setminted{
          style=bw,
          fontsize=\small,
          breaklines=true,
          autogobble,
          frame=none,
          numbersep=\neo@mintednumbersep,
          tabsize=4,
        }
      \else
        \setminted{
          style=bw,
          fontsize=\small,
          breaklines=true,
          autogobble,
          frame=none,
          linenos=true,
          numbersep=\neo@mintednumbersep,
          tabsize=4,
        }
      \fi
    \else
      \ifneo@darktheme
        \ifneo@codenonum
          \setminted{
            style=github-dark,
            backgroundcolor=backgroundColor!85,
            fontsize=\small,
            breaklines=true,
            autogobble,
            frame=none,
            numbersep=\neo@mintednumbersep,
            tabsize=4,
          }
        \else
          \setminted{
            style=github-dark,
            backgroundcolor=backgroundColor!85,
            fontsize=\small,
            breaklines=true,
            autogobble,
            frame=none,
            linenos=true,
            numbersep=\neo@mintednumbersep,
            tabsize=4,
          }
        \fi
      \else
        \ifneo@codenonum
          \setminted{
            style=sas,
            fontsize=\small,
            breaklines=true,
            autogobble,
            frame=none,
            numbersep=\neo@mintednumbersep,
            tabsize=4,
          }
        \else
          \setminted{
            style=sas,
            fontsize=\small,
            breaklines=true,
            autogobble,
            frame=none,
            linenos=true,
            numbersep=\neo@mintednumbersep,
            tabsize=4,
          }
        \fi
      \fi
    \fi

    % Code listing environment
    \NewTCBListing[use counter=mintcode]{code}{ O{} m !O{} !O{\neoschool@codestyle} !D<>{\neoschool@codewidth} !O{} }{%
      listing engine=minted,
      minted language=#2,
      listing only,
      enhanced,
      breakable,
      fontupper=\color{\neoschool@globalcolor},
      width=#5\linewidth,
      minted options={#1},
      code={%
        \neo@setcodenumbership{#4}
        \IfEqCase{#4}{%
          {}{\tcbset{neo@code@plain}}
          {plain}{\tcbset{neo@code@plain}}
          {bar}{\tcbset{neo@code@bar}}
          {frame}{\tcbset{neo@code@frame}}
          {shadow}{\tcbset{neo@code@shadow}}
          {line}{\tcbset{neo@code@line}}
          {lines}{\tcbset{neo@code@lines}}
        }[\PackageError{code}{Unknown Style: #4}{}]
        \ifx\relax#3\relax
          \tcbset{title={}}
        \else
          \tcbset{title={\neo@codename~\themintcode\neoschool@codeseparator~~#3},\neoschool@boxtitle}
        \fi
      },
      \neo@codecenter,
      #6
    }

    \NewTCBListing{codenonum}{ O{} m !O{} !O{\neoschool@codestyle} !D<>{\neoschool@codewidth} !O{} }{
      listing engine=minted,
      minted language=#2,
      listing only,
      enhanced,
      breakable,
      fontupper=\color{\neoschool@globalcolor},
      width=#5\linewidth,
      minted options={#1},
      code={%
        \neo@setcodenumbership{#4}
        \IfEqCase{#4}{%
          {}{\tcbset{neo@code@plain}}
          {plain}{\tcbset{neo@code@plain}}
          {bar}{\tcbset{neo@code@bar}}
          {frame}{\tcbset{neo@code@frame}}
          {shadow}{\tcbset{neo@code@shadow}}
          {line}{\tcbset{neo@code@line}}
          {lines}{\tcbset{neo@code@lines}}
        }[\PackageError{code}{Unknown Style: #4}{}]
        \ifx\relax#3\relax
          \tcbset{title={}}
        \else
          \tcbset{title={#3}, \neoschool@boxtitle}
        \fi
      },
      \neo@codecenter,
      #6
    }

    \expandafter\let\csname code*\endcsname\codenonum
    \expandafter\let\csname endcode*\endcsname\endcodenonum

    % Inline code command
    \newcommand{\codeinline}[2][text]{%
      \mintinline[style=vs,fontsize=\small,breaklines,autogobble]{#1}{#2}
    }

    % Code input from file
    \NewTCBInputListing{\codeinputnum}{ O{} m m !O{} !O{\neoschool@codestyle} !D<>{\neoschool@codewidth} !O{} }{%
      listing engine=minted,
      minted language={#2},
      enhanced,
      breakable,
      fontupper=\color{\neoschool@globalcolor},
      width=#6\linewidth,
      listing file={#3},
      listing only,
      minted options={#1},
      frame hidden,
      colback=codeBackground,
      boxrule=0pt,
      code={%
        \neo@setcodenumbership{#5}
        \IfEqCase{#5}{%
          {}{\tcbset{neo@code@plain}}
          {plain}{\tcbset{neo@code@plain}}
          {bar}{\tcbset{neo@code@bar}}
          {frame}{\tcbset{neo@code@frame}}
          {shadow}{\tcbset{neo@code@shadow}}
          {line}{\tcbset{neo@code@line}}
          {lines}{\tcbset{neo@code@lines}}
        }[\PackageError{code}{Unknown Style: #5}{}]
        \ifx\relax#4\relax
          \tcbset{title={}}
        \else
          \tcbset{title={\neo@codename~\themintcode\neoschool@codeseparator~~#4},\neoschool@boxtitle}
        \fi
      },
      \neo@codecenter,
      #7
    }

    \NewTCBInputListing{\codeinputnonum}{ O{} m m !O{} !O{\neoschool@codestyle} !D<>{\neoschool@codewidth} !O{} }{
      listing engine=minted,
      minted language={#2},
      enhanced,
      breakable,
      fontupper=\color{\neoschool@globalcolor},
      width=#5\linewidth,
      listing file={#3},
      listing only,
      minted options={#1},
      frame hidden,
      colback=codeBackground,
      boxrule=0pt,
      code={%
        \neo@setcodenumbership{#5}
        \IfEqCase{#5}{%
          {}{\tcbset{neo@code@plain}}
          {plain}{\tcbset{neo@code@plain}}
          {bar}{\tcbset{neo@code@bar}}
          {frame}{\tcbset{neo@code@frame}}
          {shadow}{\tcbset{neo@code@shadow}}
          {line}{\tcbset{neo@code@line}}
          {lines}{\tcbset{neo@code@lines}}
        }[\PackageError{code}{Unknown Style: #5}{}]
        \ifx\relax#4\relax
          \tcbset{title={}}
        \else
          \tcbset{title={#4}, \neoschool@boxtitle}
        \fi
      },
      \neo@codecenter,
      #7
    }

    \DeclareRobustCommand{\codeinput}{%
      \@ifstar
      {\codeinputnonum}%
      {\codeinputnum}%
    }

    % Side-by-Side Code Environment

    \newtcblisting{codeside}[2][]{%
      standard jigsaw,
      listing engine=minted,
      listing only,
      enhanced,
      breakable,
      fontupper=\color{\neoschool@globalcolor},
      opacityback=0,
      opacityframe=0,
      fonttitle=\sffamily\bfseries,
      minted language=#2,
      arc=1pt,
      colback=codeBackground,
      colframe=codeFrame,
      boxsep=0pt,
      left=10pt,
      right=0pt,
      top=0pt,
      bottom=0pt,
      lefttitle=1.7mm,
      width=\linewidth,
      minted options={#1}
    }

  \fi

\fi

%% ==============================================================================
%% Algorithm and Pseudocode Environments
%% ==============================================================================

\algrenewcommand\algorithmicwhile{\textbf{tant que}}
\algrenewcommand\algorithmicdo{\textbf{faire}}
\algrenewcommand\algorithmicfor{\textbf{pour}}
\algrenewcommand\algorithmicif{\textbf{si}}
\algrenewcommand\algorithmicthen{\textbf{alors}}
\algrenewcommand\algorithmicelse{\textbf{sinon}}
\algrenewcommand\algorithmicend{\textbf{fin}}
\algrenewcommand\algorithmicreturn{\textbf{retourner}}
\algrenewcommand\algorithmicfunction{\textbf{fonction}}
\algrenewcommand\algorithmicrequire{\textbf{entrée}}
\algrenewcommand\algorithmicensure{\textbf{sortie}}
\algrenewcommand\algorithmicprocedure{\textbf{procédure}}

\newcommand{\To}{\textbf{ à }}
\newcommand{\Gets}{\ensuremath{\leftarrow}}

\tcbset{%
  pseudocode/.style={%
    enhanced,
    breakable,
    before upper={\begin{algorithmic}},
    after upper={\end{algorithmic}},
    fonttitle=\csname\neoschool@headweight\endcsname\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname,
    before skip=\neo@effective@beforeafterskip,
    after skip=\neo@effective@beforeafterskip,
  }
}

\newcounter{pseudocode}
\newtcolorbox[use counter=pseudocode]{pseudocode}[2][]{%
  pseudocode,
  code={%
    \IfEqCase{\neoschool@codestyle}{%
      {}{\tcbset{neo@code@plain}}
      {plain}{\tcbset{neo@code@plain}}
      {bar}{\tcbset{neo@code@bar}}
      {frame}{\tcbset{neo@code@frame}}
      {shadow}{\tcbset{neo@code@shadow}}
      {line}{\tcbset{neo@code@line}}
      {lines}{\tcbset{neo@code@lines}}
    }%
  },
  title={\csname neo@algorithmname\endcsname~\thepseudocode~~\textemdash{}~~#2},
  #1
}

%% ==============================================================================
%% Base Definitions and Styles for Theorems and Exercises
%% ==============================================================================

% Common Styles
\tcbset{
  common@base/.style={
    enhanced,
    breakable,
    before skip=\baselineskip,
    after skip=\baselineskip,
    colupper=\neo@box@uppertext,
    colframe=primaryColor,
    colbacklower=\neo@box@lowerback,
    separator sign={},
  },
  common@title@base/.style={
    fonttitle={\normalshape\neo@title@style},
  },
}

%% ==============================================================================
%% Shared Box Styles for Theorems and Exercises
%% ==============================================================================
\ExplSyntaxOn
\tl_new:N \l__custom_tcb_title_tl
\tl_new:N \l__custom_tcb_label_tl
\tl_new:N \l__custom_tcb_options_tl

\newcommand{\getCustomSlantedTitle}{%
  \tl_if_empty:NTF \l__custom_tcb_title_tl
  {}
  {\tl_use:N \hspace{0.4em}(\l__custom_tcb_title_tl)\!}
}

\newcommand{\getCustomBoxedTitle}{%
  \tl_if_empty:NTF \l__custom_tcb_title_tl
  {}
  {\tl_use:N \hspace{0.4em}(\l__custom_tcb_title_tl)}
}
\ExplSyntaxOff

\def\neo@getcodeframestyle{%
  \ifneo@codenoframe
    frame hidden%
  \else\fi
}

\def\neo@getcodebackstyle{%
  \ifneo@codenoback
    interior hidden%
  \else\fi
}

\def\neo@getexframestyle{%
  \ifneo@exnoframe
    frame hidden%
  \else\fi
}

\def\neo@getthmframestyle{%
  \ifneo@thmnoframe
    frame hidden%
  \else\fi
}

\ifneo@exnoback
  \tcbset{neo@exbackstyle/.style={colback=backgroundColor}}
\else
  \tcbset{neo@exbackstyle/.style={colback=exerciseColor!\neo@exopacity}}
\fi

\ExplSyntaxOn

\cs_new_protected:Nn \neoschool_apply_arcs_ex:
{
  \dim_set:Nn \l_tmpa_dim { \neoschool@exboxarc }

  \dim_compare:nNnTF { \l_tmpa_dim } = { 0pt }
  {
    \tcbset{
      sharp~corners,
      arc = 0pt,
      outer~arc = 0pt
    }
  }
  {
    \tcbset{
      arc = \l_tmpa_dim,
      auto~outer~arc
    }
  }
}

\cs_new_protected:Nn \neoschool_apply_arcs_thm:
{
  \dim_set:Nn \l_tmpa_dim { \neoschool@thmboxarc }

  \dim_compare:nNnTF { \l_tmpa_dim } = { 0pt }
  {
    \tcbset{ sharp~corners, arc=0pt, outer~arc=0pt }
  }
  {
    \tcbset{
      arc = \l_tmpa_dim,
      auto~outer~arc
    }
  }
}

\NewDocumentCommand{\ApplyNeoArcsThm}{}{ \neoschool_apply_arcs_thm: }
\NewDocumentCommand{\ApplyNeoArcsEx}{}{ \neoschool_apply_arcs_ex: }

\ExplSyntaxOff

\tcbset{
  neo thm arcs/.code={ \ApplyNeoArcsThm },
  neo ex arcs/.code={ \ApplyNeoArcsEx }
}

\tcbset{%
  neo@shared@base/.style args={#1}{%
    common@base,
    colframe=#1!\neoschool@thmframeopacity!backgroundColor,
    /utils/exec={\StrSubstitute{#1}{Color}{BgColor}[\correctedBgColor]},
    colback=\ifneo@print black!\neoschool@thmboxopacity\else\correctedBgColor\fi,
    colupper=\neoschool@globalcolor,
    boxrule=\neo@thmborder,
    left=\neo@hpadding,
    right=\neo@hpadding,
    top=\neo@vpadding,
    bottom=\neo@vpadding,
    after skip=\neo@effective@beforeafterskip,
    before skip=\neo@effective@beforeafterskip,
    neo thm arcs,
    thmboxshape=\neoschool@thmboxshape,
    \neo@getthmframestyle,
    parbox=false,
  },
  neo@thm@block/.style args={#1}{%
    neo@shared@base={#1},
    common@title@base, left=0.85em, right=0.85em,
    skin=bicolor, detach title,
    borderline west={4pt}{0pt}{#1!\neoschool@thmframeopacity!backgroundColor},
    before upper={\tcbtitle\enskip},
    left=1em, right=1em,
    terminator sign={\neoschool@thmterminator}, separator sign={\neoschool@thmseparator},
  },
  neo@thm@bar/.style args={#1}{%
    neo@shared@base={#1},
    common@title@base, skin=bicolor, detach title, boxrule=0pt, sharp corners=west,
    borderline west={3.5pt}{0pt}{#1!\neoschool@thmframeopacity!backgroundColor},
    before upper={\tcbtitle\enskip},
    left=1em, right=1em,
    terminator sign={\neoschool@thmterminator}, separator sign={\neoschool@thmseparator},
  },
  neo@thm@tile/.style 2 args={%
    neo@shared@base={#1},
    common@title@base, rounded corners, arc=3pt, outer arc=3.75pt,
    attach boxed title to top left,
    boxed title style={empty, left=\neo@title@hpadding, right=\neo@title@hpadding, top=4pt, bottom=-5pt, left=1.35ex},
    detach title,
    underlay boxed title={%
      \path[draw=\ifneo@thmnoframe none\else #1\fi, line width=\neo@thmborder, rounded corners, fill=\neo@thm@box@mainback]
      ([xshift=.15mm]frame.west) |- ([xshift=-2.5mm]title.north east)
      to[out=0, in=185] ([xshift=5mm, yshift=-.135mm]title.south east);
    },
  },
  neo@thm@fold/.style args={#1}{%
    neo@shared@base={#1},
    common@title@base, skin=bicolor, coltitle=\ifnum\neoschool@thmframeopacity<60 #1\else backgroundColor\fi, detach title
  },
  neo@thm@plain/.style args={#1}{%
    neo@shared@base={#1}, colframe=#1!\neoschool@thmframeopacity!backgroundColor,
    common@title@base, skin=bicolor, detach title,
    terminator sign={\neoschool@thmterminator}, separator sign={\neoschool@thmseparator},
  },
  neo@thm@frame/.style args={#1}{%
    neo@shared@base={#1}, colframe=#1!\neoschool@thmframeopacity!backgroundColor,
    common@title@base, skin=bicolor, coltitle=\ifnum\neoschool@thmframeopacity<60 #1\else backgroundColor\fi, colbacktitle=tcbcolframe,
    toptitle=\neo@title@vpadding, bottomtitle=\neo@title@vpadding
  },
  neo@thm@curve/.style args={#1}{%
    neo@shared@base={#1},
    common@title@base, skin=bicolor,
    attach boxed title to top left={yshift*=-\tcboxedtitleheight},
    coltitle=\ifnum\neoschool@thmframeopacity<60 #1\else backgroundColor\fi,
    boxed title style={sharp corners, rounded corners=northwest, colback=tcbcolframe, boxrule=0pt},
    underlay boxed title={%
      \path[fill=tcbcolframe] (title.south west)--(title.south east)
      to[out=0, in=180] ([xshift=5mm]title.east)--
      (title.center-|frame.east) [rounded corners=\kvtcb@arc] |- (frame.north) -| cycle;
    }
  },
  neo@thm@sticker/.style args={#1}{%
    neo@shared@base={#1},
    common@title@base, enhanced, detach title, colframe=#1!\neoschool@thmframeopacity!backgroundColor, boxrule=\neo@verythickrule,
    neo thm arcs, thmboxshape=\neoschool@thmboxshape,
    attach boxed title to top left={xshift=1em, yshift*=-\tcboxedtitleheight/2},
    boxed title style={colback=#1!\neoschool@thmframeopacity!backgroundColor, colframe=#1!\neoschool@thmframeopacity!backgroundColor, arc=\neoschool@thmtitlearc, thmtitleshape=\neoschool@thmtitleshape, boxrule=\neo@normalrule, bottom=1pt, top=1pt, left=2pt ,right=2pt},
    coltitle=\ifnum\neoschool@thmframeopacity<60 #1\else backgroundColor\fi,
  },
  neo@thm@pastel/.style args={#1}{%
    neo@shared@base={#1},
    common@title@base, enhanced, detach title, colframe=#1!\neoschool@thmframeopacity!backgroundColor, colback=backgroundColor, boxrule=\neo@thickrule, neo thm arcs,
    attach boxed title to top left={xshift=1em, yshift*=-\tcboxedtitleheight/2},
    boxed title style={colback=#1!12!backgroundColor, colframe=#1!\neoschool@thmframeopacity!backgroundColor, arc=\neoschool@thmtitlearc, thmtitleshape=\neoschool@thmtitleshape, boxrule=\neo@thickrule, bottom=1pt, top=1pt, left=2pt ,right=2pt},
    coltitle=#1,
  },
  neo@thm@tag/.style 2 args={%
    neo@shared@base={#1},
    common@title@base, arc=\neoschool@thmboxarc, neo thm arcs, \neo@framehidden,
    coltitle=\ifnum\neoschool@thmframeopacity<60 #1\else backgroundColor\fi, detach title, thmboxshape=\neoschool@thmboxshape,
    before upper*={%
      \noindent\tcbox[enhanced, on line, colupper=backgroundColor, colback=#1, colframe=#1,
      fontupper=\neo@title@style, boxrule=0pt,
      top=0.5pt, bottom=0.5pt, left=1pt, right=1pt,
      nobeforeafter,
      arc=\neoschool@thmtitlearc, thmtitleshape=\neoschool@thmtitleshape,
    ]{#2~\thetcbcounter}%
    }
    {\normalshape\neo@title@style\color{#1}\getCustomBoxedTitle}\space
  }
}

\tcbset{%
  neo@ex@base/.style args={#1}{%
    common@base,
    colframe=#1!\neoschool@exframeopacity!backgroundColor,
    /utils/exec={\StrSubstitute{#1}{Color}{BgColor}[\correctedBgColor]},
    colback=\ifneo@print black!\neoschool@exboxopacity\else\correctedBgColor\fi,
    colupper=\neoschool@globalcolor,
    boxrule=\neo@exborder,
    left=\neo@hpadding, right=\neo@hpadding,
    top=\neo@vpadding, bottom=\neo@vpadding,
    after skip=\neo@effective@ex@beforeafterskip,
    before skip=\neo@effective@ex@beforeafterskip,
    neo ex arcs, exboxshape=\neoschool@exboxshape,
    \neo@getexframestyle, parbox=false,
  },
  neo@ex@block/.style args={#1}{%
    neo@ex@base={#1},
    common@title@base, skin=bicolor, detach title, left=0.85em,
    coltitle=#1,
    borderline west={4pt}{0pt}{#1!\neoschool@exframeopacity!backgroundColor},
    left=1em, right=1em,
    before upper={\tcbtitle\enskip},
  },
  neo@ex@bar/.style args={#1}{%
    neo@ex@base={#1},
    common@title@base, skin=bicolor, detach title, left=0.85em, boxrule=0pt,
    coltitle=#1, sharp corners=west,
    borderline west={3pt}{0pt}{#1!\neoschool@exframeopacity!backgroundColor},
    left=1em, right=1em,
    before upper={\tcbtitle\enskip},
  },
  neo@ex@tile/.style args={#1}{%
    neo@ex@base={#1},
    common@title@base, skin=bicolor, arc=\neoschool@exboxarc, outer arc=\neoschool@exboxarc,
    attach boxed title to top left,
    boxed title style={empty, left=\neo@title@hpadding, right=\neo@title@hpadding, top=4pt, bottom=-5pt},
    detach title,
    underlay boxed title={%
      \path[draw=\ifneo@exnoframe none\else #1\fi, line width=\neo@exborder, rounded corners, fill=exerciseBgColor]
      ([xshift=.15mm]frame.west) |- ([xshift=-2.5mm]title.north east)
      to[out=0, in=185] ([xshift=5mm, yshift=-.135mm]title.south east);
    },
  },
  neo@ex@fold/.style args={#1}{%
    neo@ex@base={#1},
    common@title@base, skin=bicolor, coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi, detach title
  },
  neo@ex@plain/.style args={#1}{%
    neo@ex@base={#1}, colframe=#1!\neoschool@exframeopacity!backgroundColor,
    common@title@base, skin=bicolor, detach title,
  },
  neo@ex@frame/.style args={#1}{%
    neo@ex@base={#1}, colframe=#1!\neoschool@exframeopacity!backgroundColor,
    common@title@base, skin=bicolor, coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi,
    colbacktitle=tcbcolframe, boxrule=\neo@exborder, toptitle=\neo@title@vpadding, bottomtitle=\neo@title@vpadding
  },
  neo@ex@curve/.style args={#1}{%
    neo@ex@base={#1},
    common@title@base, skin=bicolor,
    attach boxed title to top left={yshift*=-\tcboxedtitleheight},
    coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi,
    boxed title style={
      sharp corners,
      rounded corners=northwest,
      colframe=#1!\neoschool@exframeopacity!backgroundColor,
      colback=#1!\neoschool@exframeopacity!backgroundColor,
      boxrule=0pt,
      arc=\neoschool@exboxarc,
      outer arc=\neoschool@exboxarc,
    },
    underlay boxed title={%
      \path[fill=tcbcolframe] (title.south west)--(title.south east)
      to[out=0, in=180] ([xshift=5mm]title.east)--
      (title.center-|frame.east) [rounded corners=\kvtcb@arc] |- (frame.north) -| cycle;
    }
  },
  neo@ex@sticker/.style args={#1}{%
    neo@ex@base={#1},
    common@title@base, boxrule=\neo@verythickrule, enhanced, detach title, colframe=#1!\neoschool@exframeopacity!backgroundColor,
    neo ex arcs,
    attach boxed title to top left={xshift=1em, yshift*=-\tcboxedtitleheight/2},
    boxed title style={colback=#1!\neoschool@exframeopacity!backgroundColor, colframe=#1!\neoschool@exframeopacity!backgroundColor, boxrule=0pt, bottom=1pt, top=1pt, left=2pt ,right=2pt, extitleshape=\neoschool@exboxshape},
    coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi,
  },
  neo@ex@pastel/.style args={#1}{%
    neo@ex@base={#1},
    common@title@base, boxrule=\neo@thickrule, neo ex arcs, enhanced, detach title, colframe=#1!\neoschool@exframeopacity!backgroundColor, colback=backgroundColor,
    attach boxed title to top left={xshift=1em, yshift*=-\tcboxedtitleheight/2},
    boxed title style={colback=#1!12!backgroundColor, colframe=#1!\neoschool@exframeopacity!backgroundColor, boxrule=\neo@thickrule, bottom=1pt, top=1pt, left=2pt ,right=2pt, extitleshape=\neoschool@exboxshape},
    coltitle=#1,
  },
  neo@exbackstyle/.style={%
    colback=backgroundColor,
    /utils/exec={\StrSubstitute{exerciseColor}{Color}{BgColor}[\correctedBgColor]},
    colback=\ifneo@print black!\neoschool@exboxopacity\else\correctedBgColor\fi,
  },
  neo@ex@card/.style args={#1}{%
    neo@ex@base={#1},
    common@title@base,
    skin=bicolor,
    boxrule=\neo@verythickrule,
    neo ex arcs,
    coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi,
    colbacktitle=#1!\neoschool@exframeopacity!backgroundColor,
    colframe=#1!\neoschool@exframeopacity!backgroundColor,
    attach boxed title to top center={yshift*=-\tcboxedtitleheight/2},
    exboxshape=\neoschool@exboxshape,
    boxed title style={
      colframe=#1!\neoschool@exframeopacity!backgroundColor, boxrule=\neo@verythickrule,
      arc=\neoschool@exboxarc,
      bottom=1pt, top=1pt, left=4pt, right=4pt,
      extitleshape=\neoschool@exboxshape
    },
  },
  neo@ex@counter/.style={%
    enhanced, breakable, parbox=false, skin=bicolor, neo ex arcs, \neo@getexframestyle,
    boxrule=\neo@normalrule, colframe=exerciseColor, neo@exbackstyle,
    colupper=\neoschool@globalcolor, coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi,
    fonttitle=\csname\neoschool@headweight\endcsname,
    left=\neo@hpadding, right=\neo@hpadding,
    after skip=\neo@effective@ex@beforeafterskip, before skip=\neo@effective@ex@beforeafterskip,
    top=4pt, exboxshape=\neoschool@exboxshape
  },
  neo@shared@box/.style={
    enhanced,
    size=small,
    neo ex arcs,
    extitleshape=\neoschool@exboxshape,
    nobeforeafter,
    fontupper=\neo@boxfont,
    top=-0.5pt, bottom=-0.5pt, left=-0.5pt, right=-0.5pt,
  },
  neo@linebox@base/.style={
    on line, boxsep=-2pt, left=7pt, right=7pt,
    extitleshape=\neoschool@exboxshape, arc=\neoschool@exboxarc,
    nobeforeafter
  },
  neo@linebox@filled/.style={
    neo@linebox@base,
    boxrule=\neo@thinrule, bottom=6pt,
    colframe=exerciseColor, colback=exerciseColor
  },
  neo@linebox@outlined/.style={
    neo@linebox@base,
    boxrule=\neo@thickrule,
    colframe=exerciseColor, colback=backgroundColor
  }
}

%% ==============================================================================
%% Custom Newtcbtheorem Implementation
%% ==============================================================================

\ExplSyntaxOn
\NewDocumentCommand{\mynewtcbtheorem}{O{}mmmm}{%
  \newtcbtheorem[#1]{#2inner}{#3}{#4}{#5}
  \NewDocumentEnvironment{#2}{O{}}{%
    \keys_set:nn { custom/tcb } { ##1 }
    \tl_if_empty:NTF \l__custom_tcb_options_tl {%
      \use:x {
        \exp_not:N \begin{#2inner}
          {\tl_if_empty:NTF \l__custom_tcb_title_tl
            { }
            { (\exp_not:V \l__custom_tcb_title_tl) }
          }
          {\exp_not:V \l__custom_tcb_label_tl}
        }
      }{%
        \use:x {
          \exp_not:N \begin{#2inner}
            [\exp_not:V \l__custom_tcb_options_tl]
            {\tl_if_empty:NTF \l__custom_tcb_title_tl
              { }
              { (\exp_not:V \l__custom_tcb_title_tl) }
            }
            {\exp_not:V \l__custom_tcb_label_tl}
          }
        }
      }{%
      \end{#2inner}
    }

    \NewDocumentEnvironment{#2*}{O{}}{%
      \keys_set:nn { custom/tcb } { ##1 }
      \tl_if_empty:NTF \l__custom_tcb_options_tl {%
        \use:x {
          \exp_not:N \begin{#2inner*}
            {\tl_if_empty:NTF \l__custom_tcb_title_tl
              { }
              { (\exp_not:V \l__custom_tcb_title_tl) }
            }
            {}
          }
        }{%
          \use:x {
            \exp_not:N \begin{#2inner*}
              [\exp_not:V \l__custom_tcb_options_tl]
              {\tl_if_empty:NTF \l__custom_tcb_title_tl
                { }
                { (\exp_not:V \l__custom_tcb_title_tl) }
              }
              {}
            }
          }
        }{%
        \end{#2inner*}
      }
      \cs_if_exist:cF { c@#5} { \newcounter{#5} }
    }

    \keys_define:nn { custom/tcb } {
      title .tl_set:N = \l__custom_tcb_title_tl,
      label .tl_set:N = \l__custom_tcb_label_tl,
      unknown .code:n = {
        \tl_put_right:Nx \l__custom_tcb_options_tl { \l_keys_key_str = { \exp_not:n {#1} } , }
      }
    }
    \ExplSyntaxOff

    %% ==============================================================================
    %% Theorem Types Implementation
    %% ==============================================================================

    \NewDocumentCommand{\newblocktheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        neo@thm@block={#4},
        coltitle=#4, fontupper={#7}, before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newbartheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        neo@thm@bar={#4},
        boxrule=0pt, frame hidden,
        coltitle=#4, fontupper={#7}, before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newfoldtheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        neo@thm@fold={#4},
        before upper*={%
          \noindent\tcbox[enhanced, colupper=backgroundColor, colback=#4,
          fontupper=\normalshape\neo@title@style, size=small, baseline=3.75pt,
          left=0pt, right=0pt, top=0pt, bottom=0pt, nobeforeafter,
          frame code={%
            \path[fill=tcbcolback] (frame.north west) -- ([xshift=2mm]frame.north east) -- (frame.south east) -- (frame.south west) -- (frame.north west) [sharp corners]-- cycle;
          }]{#3~\thetcbcounter}
          {\normalshape\neo@title@style\color{#4}\getCustomSlantedTitle}\hspace{0.4em}%
        },
        fontupper={#7}, before lower={#6}, #8,
      }{#5}
    }

    \NewDocumentCommand{\newtiletheorem}{O{}mmmmmmO{}}{%
      \expandafter\def\csname neo@titledrawcolor@#2\endcsname{#4}
      \ifneo@thmnoframe\expandafter\def\csname neo@titledrawcolor@#2\endcsname{backgroundColor}\fi
      \mynewtcbtheorem[#1]{#2}{\vspace*{0.35em}#3}{%
        neo@thm@tile={#4}{#2},
        coltitle=#4, fontupper={#7}, before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newplaintheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        neo@thm@plain={#4},
        before upper={\tcbtitle\enskip},
        coltitle=#4, fontupper={#7}, before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newframetheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        neo@thm@frame={#4},
        title={#3}, fontupper={#7}, before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newcurvetheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        neo@thm@curve={#4},
        title={#3}, fontupper={#7}, before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newstickertheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        neo@thm@sticker={#4},
        title={#3}, fontupper={#7}, before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newpasteltheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        neo@thm@pastel={#4},
        title={#3}, fontupper={#7}, before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newtagtheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        neo@thm@tag={#4}{#3},
        fontupper={#7}, before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newrawtheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        enhanced, breakable, frame hidden, opacityback=0, colback=backgroundColor,
        coltitle={#4}, left=-1.5pt, right=0pt, top=0pt, bottom=0pt, boxsep=0pt,
        detach title,
        before upper={\tcbtitle\enskip\space},
        before skip=\neo@effective@baseskip, after skip=\neo@effective@baseskip,
        terminator sign={\neoschool@thmterminator}, separator sign={\neoschool@thmseparator},
        fontupper={#7}, fonttitle={\normalshape\neo@title@style},
        before lower={#6}, #8
      }{#5}
    }

    \NewDocumentCommand{\newamsremarktheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        enhanced,
        breakable,
        frame hidden,
        opacityback=0,
        colback=backgroundColor,
        colupper=\neoschool@globalcolor,
        coltitle={#4},
        left=-1.5pt,
        right=0pt,
        top=0pt,
        bottom=0pt,
        boxsep=0pt,
        detach title,
        before upper={\tcbtitle\enskip},
        before skip=\neo@effective@baseskip,
        after skip=\neo@effective@baseskip,
        terminator sign={\neoschool@thmterminator},
        separator sign={\neoschool@thmseparator},
        fontupper={#7},
        fonttitle={\normalshape\neo@title@style},
        #8
      }{#5}
    }

    \NewDocumentCommand{\newamsremarkstheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        enhanced,
        breakable,
        frame hidden,
        opacityback=0,
        colback=backgroundColor,
        colupper=\neoschool@globalcolor,
        coltitle={#4},
        left=-1.5pt,
        right=0pt,
        top=0pt,
        bottom=0pt,
        boxsep=0pt,
        detach title,
        before upper={\tcbtitle\enskip},
        before skip=\neo@effective@baseskip,
        after skip=\neo@effective@baseskip,
        terminator sign={\neoschool@thmterminator},
        separator sign={\neoschool@thmseparator},
        fontupper={#7},
        fonttitle={\normalshape\neo@title@style},
        #8
      }{#5}
    }

    \NewDocumentCommand{\newamsexampletheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        enhanced,
        breakable,
        frame hidden,
        colback=backgroundColor,
        colupper=\neoschool@globalcolor,
        coltitle={#4},
        left=-1.5pt,
        right=0pt,
        top=0pt,
        bottom=0pt,
        boxsep=0pt,
        detach title,
        before upper={\tcbtitle\enskip},
        before skip=\neo@effective@baseskip,
        after skip=\neo@effective@baseskip,
        terminator sign={\neoschool@thmterminator},
        separator sign={\neoschool@thmseparator},
        fontupper={#7},
        fonttitle={\normalshape\neo@title@style},
        before lower={#6},
        #8
      }{#5}
    }

    \NewDocumentCommand{\newamsexamplestheorem}{O{}mmmmmmO{}}{%
      \mynewtcbtheorem[#1]{#2}{#3}{%
        enhanced,
        breakable,
        frame hidden,
        colback=backgroundColor,
        colupper=\neoschool@globalcolor,
        coltitle={#4},
        left=-1.5pt,
        right=0pt,
        top=0pt,
        bottom=0pt,
        boxsep=0pt,
        detach title,
        before upper={{\color{exampleColor}\neo@title@style #3}\enskip},
        before skip=\neo@effective@baseskip,
        after skip=\neo@effective@baseskip,
        terminator sign={\neoschool@thmterminator},
        separator sign={\neoschool@thmseparator},
        fontupper={#7},
        #8
      }{#5}
    }

    \NewDocumentCommand{\neo@declarespecialtheorem}{m m}{%
      \ifstrequal{#1}{remark}{%
        \newamsremarktheorem{#1}{\csname neo@#1name\endcsname}{#2}{#1}{}{\normalfont}
      }{%
        \ifstrequal{#1}{remarks}{%
          \newamsremarkstheorem{#1}{\csname neo@#1name\endcsname}{#2}{#1}{}{\normalfont}
        }{%
          \ifstrequal{#1}{examples}{%
            \newamsexamplestheorem{#1}{\csname neo@#1name\endcsname}{#2}{#1}{}{\normalfont}
          }{%
            \ifneoschool@sectionthmcounter
              \ifneoschool@sharedthmcounter
                \newamsexampletheorem[number within=section, use counter = thmcounter]{#1}{\csname neo@#1name\endcsname}{#2}{#1}{}{\normalfont}
              \else
                \newamsexampletheorem[number within=section]{#1}{\csname neo@#1name\endcsname}{#2}{#1}{}{\normalfont}
              \fi
            \else
              \ifneoschool@sharedthmcounter
                \newamsexampletheorem[use counter = thmcounter]{#1}{\csname neo@#1name\endcsname}{#2}{#1}{}{\normalfont}
              \else
                \newamsexampletheorem{#1}{\csname neo@#1name\endcsname}{#2}{#1}{}{\normalfont}
              \fi
            \fi
          }%
        }%
      }%
    }

    \neo@declarespecialtheorem{remark}{remarkColor}
    \neo@declarespecialtheorem{remarks}{remarkColor}
    \neo@declarespecialtheorem{example}{exampleColor}
    \neo@declarespecialtheorem{examples}{exampleColor}
    \neo@declarespecialtheorem{application}{applicationColor}

    %% ==============================================================================
    %% Theorem Declaration Command
    %% ==============================================================================

    \NewDocumentCommand{\neo@declaretheorem}{O{}mmmmmmO{}}{%
      % Options handling
      \def\neo@thmoptions{#1}
      \ifneoschool@sectionthmcounter
        \edef\neo@thmoptions{number within=section,\neo@thmoptions}
      \fi
      \ifneoschool@sharedthmcounter
        \edef\neo@thmoptions{use counter=thmcounter,\neo@thmoptions}
      \else
        \ifneoschool@thmgroupcounter
          \ifboolexpr{
            test {\ifstrequal{#2}{theorem}} or test {\ifstrequal{#2}{lemma}} or
            test {\ifstrequal{#2}{proposition}} or test {\ifstrequal{#2}{corollary}} or
            test {\ifstrequal{#2}{property}} or
            test {\ifstrequal{#2}{properties}}
          }{\edef\neo@thmoptions{use counter=thmcounter,\neo@thmoptions}}%
          {\edef\neo@thmoptions{\neo@thmoptions}}
        \else
          \edef\neo@thmoptions{\neo@thmoptions}
        \fi
      \fi

      \def\neo@constructorname{new\neoschool@thmstyle theorem}

      \ifcsname \neo@constructorname \endcsname
        \expandafter\csname \neo@constructorname \expandafter\endcsname\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
      \else
        \expandafter\newblocktheorem\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
        \PackageWarning{neoschool}{Unkown '\neoschool@thmstyle' style for #2. Using 'block'.}%
      \fi
    }

    %% ==============================================================================
    %% Theorem Environment Declarations
    %% ==============================================================================

    \newcounter{thmcounter}

    \def\neo@thmupper@style{
      \IfStrEq{\neoschool@thmstyle}{raw}{%
        \itshape\color{\neoschool@globalcolor}
      }{%
        \color{\neoschool@globalcolor}
      }
    }

    % Standard theorems
    \neo@declaretheorem{theorem}{\neo@theoremname}{theoremColor}{thm}{}{\neo@thmupper@style}
    \neo@declaretheorem{definition}{\neo@definitionname}{definitionColor}{def}{}{\color{\neoschool@globalcolor}}
    \neo@declaretheorem{definitions}{\neo@definitionsname}{definitionColor}{def}{}{\color{\neoschool@globalcolor}}
    \neo@declaretheorem{lemma}{\neo@lemmaname}{lemmaColor}{lem}{}{\neo@thmupper@style}
    \neo@declaretheorem{proposition}{\neo@propositionname}{propositionColor}{propo}{}{\neo@thmupper@style}
    \neo@declaretheorem{corollary}{\neo@corollaryname}{corollaryColor}{cor}{}{\neo@thmupper@style}
    \neo@declaretheorem{conjecture}{\neo@conjecturename}{remarkColor}{conj}{}{\neo@thmupper@style}
    \neo@declaretheorem{property}{\neo@propertyname}{propertyColor}{prop}{}{\neo@thmupper@style}
    \neo@declaretheorem{properties}{\neo@propertiesname}{propertyColor}{prop}{}{\neo@thmupper@style}

    % Proof Environment
    \newenvironment{proof}[1][\neo@proofname]{%
      \par\noindent{\color{theoremColor}\itshape\bfseries #1.}\enskip%
    }{%
      \unskip\nobreak\hfill\makebox[0pt][l]{{\hspace{0.5em}\color{theoremColor}$\blacksquare$}}\par\vspace{0.5\baselineskip}%
    }

    %% ==============================================================================
    %% Exercise Common Elements
    %% ==============================================================================

    % QCM Environment Setup
    \DeclareExerciseEnvironmentTemplate{item}
    {\trivlist\item[\GetExerciseProperty{counter}.]}
    {\endtrivlist}

    % Multiple Choice Elements
    \DeclareRobustCommand{\neocolorcirc}[1]{%
      \begin{tikzpicture}[baseline=-1.25mm]
        \draw[#1] (0.5,0) circle (.75ex);
      \end{tikzpicture}
    }

    \DeclareRobustCommand{\neocolordisk}[2]{%
      \begin{tikzpicture}[baseline=-1.25mm]
        \draw[#1, fill=#2] (0.5,0) circle (.75ex);
      \end{tikzpicture}
    }

    \newcommand{\neocheckbox}{\color{\neoschool@globalcolor}$\square$}
    \newcommand{\neochecksol}{\color{\neoschool@globalcolor}$\blacksquare$}
    \newcommand{\neocheckcirc}{\neocolorcirc{\neoschool@globalcolor}}
    \newcommand{\neocheckdisk}{\neocolordisk{\neoschool@globalcolor}{\neoschool@globalcolor}}

    % Task Environments
    \NewTasksEnvironment[%
    label = \neocheckcirc,
    label-width = 12pt,
    item-indent = 3.5em,
    after-skip = 0pt,
    item-format = {\color{\neoschool@globalcolor}}
    ]{choices}[\choice]

    \NewTasksEnvironment[%
    label = \neocheckbox,
    label-width = 12pt,
    item-indent = 3.5em,
    after-skip = 0pt,
    item-format = {\color{\neoschool@globalcolor}}
    ]{checkboxes}[\checkbox]

    % Shuffle Implementation for Tasks
    \ifneo@shuffle
      \ExplSyntaxOn
      \cs_set_protected:Npn \tasks_environment:nnnn #1#2#3#4
      {
        \bool_if:NT \l__tasks_debug_bool { \dim_set:Nn \fboxsep {0pt} }
        \seq_set_split:Nnn \l__tasks_seq {#3} {#4}
        \seq_pop_left:NN \l__tasks_seq \l__tasks_tmpa_tl
        \seq_shuffle:N \l__tasks_seq
        \tl_if_blank:VF \l__tasks_tmpa_tl
        { \msg_warning:nnVn {tasks}{no-item} \l__tasks_tmpa_tl {#3} }
        \int_gset:Nn \g__tasks_total_items_int
        { \seq_count:N \l__tasks_seq }
        \UseInstance {tasks} {#1}
        { \g__tasks_total_items_int }
        {#2}
        { }
        \seq_clear:N \l__tasks_seq
      }
      \ExplSyntaxOff
    \fi

    % Correct Answer Command
    \NewDocumentCommand{\correct}{s}{%
      \IfBooleanTF#1
      {% \correct*
        \ifneoschool@answers
          \neochecksol
        \else
          \ifneoschool@answersonly
            \neochecksol
          \else
            \neocheckbox
          \fi
        \fi
      }
      {% \correct
        \ifneoschool@answers
          \neocheckdisk
        \else
          \ifneoschool@answersonly
            \neocheckdisk
          \else
            \neocheckcirc
          \fi
        \fi
      }%
    }

    %% ==============================================================================
    %% Exercise Base Box Styles
    %% ==============================================================================

    \newcommand{\neo@tmp@scale}{}

    \ExplSyntaxOn
    \newcommand{\neoexerciserating}{%
      [\raisebox{0.5pt}{%
        \tl_set:Nx \neo@tmp@scale { \fp_eval:n { 1 / \neoschool@mathfacescale } }
        \expandafter\scalebox\expandafter{\neo@tmp@scale}{%
          \normalsize$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$%
        }%
      }]%
    }
    \ExplSyntaxOff

    \AtBeginDocument{%
      \ifneo@french
        \DeclareExerciseTranslation{french}{point}{point}
        \DeclareExerciseTranslation{french}{points}{points}
        \DeclareExerciseTranslation{french}{point-short}{pt}
        \DeclareExerciseTranslation{french}{points-short}{pts}
      \else\ifneo@german
          \DeclareExerciseTranslation{german}{point}{Punkt}
          \DeclareExerciseTranslation{german}{points}{Punkte}
          \DeclareExerciseTranslation{german}{point-short}{Pkt}
          \DeclareExerciseTranslation{german}{points-short}{Pkt}
        \else
          \DeclareExerciseTranslation{english}{point}{point}
          \DeclareExerciseTranslation{english}{points}{points}
          \DeclareExerciseTranslation{english}{point-short}{pt}
          \DeclareExerciseTranslation{english}{points-short}{pts}
        \fi
      \fi
    }

    % Base box style
    \tcbset{%
      neo@base/.style={%
        enhanced,
        breakable,
        fontupper=\color{\neoschool@globalcolor},
        before skip=\baselineskip,
        after skip=\baselineskip,
        colupper=\neo@box@uppertext,
        colframe=exerciseColor,
        colbacklower=\neo@box@lowerback
      },
    }

    %% Box Appearance Styles
    \tcbset{%
      % Basic box style
      neo@box@base/.style={%
        enhanced,
        breakable,
        fontupper=\color{\neoschool@globalcolor},
        colupper=\neo@box@uppertext,
        colframe=exerciseColor,
        colbacklower=\neo@box@lowerback,
        after skip=\neo@effective@beforeafterskip,
        before skip=\neo@effective@beforeafterskip,
        left=1mm,
        right=1mm
      },
      % Basic title style
      neo@title@basic/.style={%
        title={\neo@boxtitle@content},
        fonttitle=\bfseries\sffamily
      },
      % Colored title style
      neo@title@colored/.style={%
        neo@title@basic,
        coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi,
        colbacktitle=tcbcolframe
      },
      % Basic frame style
      neo@frame@basic/.style={%
        colframe=exerciseColor,
        neo@exbackstyle
      },
      % Hidden frame style
      neo@frame@hidden/.style={%
        frame hidden,
        colframe=exerciseColor!12!backgroundColor,
        colback=backgroundColor
      }
    }

    %% Corner Styles
    \tcbset{%
      % Sharp corners
      neo@corners@sharp/.style={%
        sharp corners
      },
      % Rounded corners
      neo@corners@rounded/.style={%
        rounded corners,
        arc=\neoschool@exboxarc
      }
    }

    %% Background Styles
    \tcbset{%
      % Light background
      neo@bg@light/.style={%
        colback=backgroundColor,
        colbacktitle=exerciseColor!12!backgroundColor
      },
      % Shaded background
      neo@bg@shaded/.style={%
        colback=exerciseColor!5!backgroundColor,
        colbacktitle=exerciseColor!12!backgroundColor
      },
      % Gradient background
      neo@bg@gradient/.style={%
        interior style={%
          top color=backgroundColor,
          bottom color=exerciseColor!5!backgroundColor
        }
      }
    }

    %% Title Position Styles
    \tcbset{%
      % Attached title
      neo@title@attached/.style={%
        attach boxed title to top left={
          yshift*=-\tcboxedtitleheight
        },
        boxed title style={%
          sharp corners,
          rounded corners=northwest,
          colback=tcbcolframe,
          boxrule=0pt
        }
      },
      % Detached title
      neo@title@detached/.style={%
        detach title,
        before upper={\tcbtitle\enskip}
      }
    }

    %% Special Elements
    \tcbset{%
      % Left rule
      neo@rule@left/.style={%
        leftrule=3mm
      },
      % Basic border
      neo@border@basic/.style={%
        boxrule=\neo@thinrule
      },
      % Colored border
      neo@border@colored/.style 2 args={%
        borderline west={#1}{#2}{tcbcolframe}
      },
      % Shadow effect
      neo@effect@shadow/.style={%
        drop fuzzy shadow
      }
    }

    %% Color Schemes
    \tcbset{%
      % Standard color scheme
      neo@colors@standard/.style={%
        colframe=exerciseColor,
        colback=backgroundColor,
        colbacktitle=exerciseColor
      }
    }

    %% Solution Style Setup
    \NewDocumentCommand\neo@box@solution{}{%
      {\csname\neoschool@headstyle\endcsname
        \csname\neoschool@headweight\endcsname
        \color{tcbcolframe}\neo@solutionname~\neo@solutiongaptext}\enskip
    }

    \tcbset{%
      neo@solution@basic/.style={%
        before lower={\neo@box@solution}
      }
    }

    %% Box Title Content
    \newcommand{\neo@boxtitle@content}{%
      \sffamily\GetExerciseName~\GetExerciseProperty{counter}
      \IfExercisePropertySetT{level}{%
        \enskip\neoexerciserating
      }
      \IfExercisePropertySetT{subtitle}{ \GetExerciseProperty{subtitle}}\enskip
      \IfExercisePropertySetT{points}{%
        (\GetExerciseProperty{points}~
        \IfExerciseGoalSingularTF{points}
        {~\XSIMtranslate{point}}
        {~\XSIMtranslate{points}})
      }
    }

    %% Exercise Properties and Tagging
    \ExplSyntaxOn
    \newcommand*\neo@replicate{\prg_replicate:nn}
    \ExplSyntaxOff

    \DeclareExerciseTagging{level}
    \DeclareExerciseTagging{grade}
    \DeclareExerciseTagging{topic}
    \DeclareExerciseTagging{subject}

    %% ==============================================================================
    %% Exercise Templates
    %% ==============================================================================

    \DeclareExerciseProperty{icon}

    \newcommand{\neo@exerciseicon}{%
      \ifneo@exerciseicons
        \IfExercisePropertySetTF{icon}{%
          \faIcon{\GetExerciseProperty{icon}}\hspace{5pt}%
        }{%
          \faIcon{book}\hspace{5pt}%
        }%
      \fi
    }

    %%% Chevrons for Rules

    \newcommand{\lchevrons}{%
      \begin{tikzpicture}[scale=0.1, baseline=0.2mm, line width=1.2pt]
        \draw (0,0) -- (-1,1.25) -- (0,2.5);
        \draw (2,0) -- (1,1.25) -- (2,2.5);
        \draw (4,0) -- (3,1.25) -- (4,2.5);
      \end{tikzpicture}%
    }

    \newcommand{\lfchevrons}{%
      \begin{tikzpicture}[scale=0.1, baseline=0.2mm, line width=1.5pt]
        \draw (0,0) -- (-1,1.25) -- (0,2.5);
        \draw (2,0) -- (1,1.25) -- (2,2.5);
        \draw (4,0) -- (3,1.25) -- (4,2.5);
      \end{tikzpicture}%
    }

    \newcommand{\lcircle}{%
      \begin{tikzpicture}[scale=1, baseline=-1mm, line width=1.2pt]
        \draw (0,0) circle (3pt);
      \end{tikzpicture}%
    }

    \newcommand{\ldisk}{%
      \begin{tikzpicture}[scale=1, baseline=-1mm, line width=1.2pt]
        \fill (0,0) circle (3pt);
      \end{tikzpicture}%
    }

    %% Common Style Settings
    \newcommand{\neo@startsection}[1]{%
      \@startsection{paragraph}{4}{\z@}{0.25\baselineskip}{-1em}
      {\neo@title@style\color{#1}}
    }

    \newcommand{\neo@section@content}{%
      \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
      \IfExercisePropertySetT{subtitle}{ {\enskip\normalfont\itshape\GetExerciseProperty{subtitle}}}%
      \IfExercisePropertySetT{points}{ \enskip\normalfont(\GetExerciseProperty{points}~\IfExerciseGoalSingularTF{points}{point}{points})}%
    }

    \newcommand{\neo@boxfont}{%
      \csname\neoschool@headstyle\endcsname
      \csname\neoschool@headweight\endcsname
      \csname\neoschool@headshape\endcsname
    }

    \newcommand{\neo@boxcontent@full}{%
      {\small\neo@exerciseicon}\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
    }

    \newcommand{\neo@boxcontent@digit}{%
      {\small\neo@exerciseicon}\GetExerciseProperty{counter}%
    }

    \newcommand{\neo@boxcontent@counter}{%
      {\small\neo@exerciseicon}Ex.~\GetExerciseProperty{counter}%
    }

    \newcommand{\neo@exercisetitle}{%
      \raisebox{0pt}{\small\neo@exerciseicon}%
      {\neo@title@style%
        \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
        \IfExercisePropertySetT{level}{\enskip\neoexerciserating}%
        \IfExercisePropertySetT{subtitle}{{\enskip\itshape\rmfamily\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}}%
        \IfExercisePropertySetT{points}{%
          \hfill%
          \enskip(\GetExerciseProperty{points}~\IfExerciseGoalSingularTF{points}{point}{points})%
        }%
      }%
    }

    \newcommand{\neo@exercisetitle@inline}{%
      \raisebox{0pt}{\small\neo@exerciseicon}%
      {\neo@title@style%
        \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
        \IfExercisePropertySetT{level}{\enskip\neoexerciserating}%
        \IfExercisePropertySetT{subtitle}{{\enskip\itshape\rmfamily\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}}%
        \IfExercisePropertySetT{points}{%
          \enskip%
          (\GetExerciseProperty{points}~\IfExerciseGoalSingularTF{points}{point}{points})%
        }%
      }%
      \neoschool@exterminator%
    }

    \newcommand{\neo@print@box@meta}{%
      \neo@title@other@style\csname\neoschool@headshape\endcsname
      \color{exerciseColor}%
      \IfExercisePropertySetT{level}{\enskip\neoexerciserating}%
      \IfExercisePropertySetT{subtitle}{{\enskip\itshape\rmfamily\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}}%
      \IfExercisePropertySetT{points}{\enskip(\GetExerciseProperty{points}~\IfExerciseGoalSingularTF{points}{point}{points})}%
      \hspace*{2pt}%
    }

    \newcommand{\neo@linemeta@start}{%
      \color{exerciseColor}%
      \IfExercisePropertySetT{level}{\enskip\neoexerciserating}%
      \IfInsideSolutionF{%
        \GetExercisePropertyT{subtitle}{{\enskip\itshape\rmfamily\csname\neoschool@headweight\endcsname{\PropertyValue}\enskip}}%
      }%
    }

    \newcommand{\neo@linemeta@end}{%
      {\bfseries\color{exerciseColor}%
        \IfExercisePropertySetT{points}{\enskip%
          \GetExerciseProperty{points}~%
          \IfExerciseGoalSingularTF{points}
          {\XSIMtranslate{point}}
          {\XSIMtranslate{points}}%
        }%
      }%
    }

    \newcommand{\neo@lineseparator}[1]{%
      \hspace*{-1pt}\xrfill[.085cm]{1.2pt}[exerciseColor]\hspace*{-1pt}%
      {\color{exerciseColor}#1}%
    }

    \newcommand{\neo@thick@lineseparator}[1]{%
      \hspace*{-1pt}\xrfill[.075cm]{1.5pt}[exerciseColor]\hspace*{-1pt}%
      {\color{exerciseColor}#1}%
    }

    % 0. INLINE
    \DeclareExerciseEnvironmentTemplate{inline}{%
      \neo@startsection{exerciseColor}
      {%
        {\small\neo@exerciseicon}%
        \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
        \IfExercisePropertySetT{level}{%
          \enskip\neoexerciserating
        }%
        \GetExercisePropertyT{subtitle}{{\enskip\itshape\rmfamily\csname\neoschool@headweight\endcsname\PropertyValue}}%
        {\IfExercisePropertySetT{points}{%
            \enskip(\GetExerciseProperty{points}~%
            \IfExerciseGoalSingularTF{points}
            {\XSIMtranslate{point})}
            {\XSIMtranslate{points})}}%
        }\neoschool@exterminator\enskip%
      }
      \color{\neoschool@globalcolor}\nobreak\hspace{-1.15em}
    }{\par\vspace{-\parskip}\vspace{\neo@effective@baseskip}}

    % 1. BLOCK
    \DeclareExerciseEnvironmentTemplate{block}{%
      \begin{tcolorbox}[neo@ex@block={exerciseColor}, title={\neo@exercisetitle@inline}]
      }{\end{tcolorbox}}

    % 2. BAR (former leftrule-box)
    \DeclareExerciseEnvironmentTemplate{bar}{%
      \begin{tcolorbox}[neo@ex@bar={exerciseColor}, frame hidden, title={\neo@exercisetitle@inline}]
      }{\end{tcolorbox}}

    % 3. TILE
    \DeclareExerciseEnvironmentTemplate{tile}{%
      \expandafter\def\csname neo@titledrawcolor@exercise\endcsname{exerciseColor}
      \ifneo@thmnoframe\expandafter\def\csname neo@titledrawcolor@exercise\endcsname{backgroundColor}\fi
      \begin{tcolorbox}[neo@ex@tile={exerciseColor}, left=0.65em, right=0.65em, coltitle=exerciseColor, title={\neo@exercisetitle}]
      }{\end{tcolorbox}}

    % 4. FOLD
    \DeclareExerciseEnvironmentTemplate{fold}{%
      \begin{tcolorbox}[neo@ex@fold={exerciseColor},
        before upper*={%
          \noindent\tcbox[enhanced, colupper=backgroundColor, colback=exerciseColor, fontupper=\normalshape\neo@title@style, size=small, baseline=3pt, left=-0.5pt, right=-1pt, top=-0.5pt, bottom=-0.5pt, nobeforeafter, frame code={\path[fill=tcbcolback] (frame.north west) -- ([xshift=2mm]frame.north east) -- (frame.south east) -- (frame.south west) -- (frame.north west) [sharp corners]-- cycle;}]{%
            \neo@boxcontent@full
          }\hspace{3pt}%
          {\neo@print@box@meta}
        }]%
        {\neo@title@other@style\csname\neoschool@headshape\endcsname}
      }{\end{tcolorbox}}

    % 5. PLAIN
    \DeclareExerciseEnvironmentTemplate{plain}{%
      \begin{tcolorbox}[neo@ex@plain={exerciseColor}, before upper={\tcbtitle\enskip}, coltitle=exerciseColor, title={\neo@exercisetitle@inline}]
      }{\end{tcolorbox}}

    % 6. FRAME
    \DeclareExerciseEnvironmentTemplate{frame}{%
      \begin{tcolorbox}[neo@ex@frame={exerciseColor}, righttitle=-5pt, title={\neo@exercisetitle}]
      }{\end{tcolorbox}}

    % 7. CURVE
    \DeclareExerciseEnvironmentTemplate{curve}{%
      \begin{tcolorbox}[neo@ex@curve={exerciseColor}, title={\neo@exercisetitle}]
      }{\end{tcolorbox}}

    % 8. STICKER
    \DeclareExerciseEnvironmentTemplate{sticker}{%
      \begin{tcolorbox}[neo@ex@sticker={exerciseColor}, title={\neo@exercisetitle}]
      }{\end{tcolorbox}}

    % 9. PASTEL
    \DeclareExerciseEnvironmentTemplate{pastel}{%
      \begin{tcolorbox}[neo@ex@pastel={exerciseColor}, title={\neo@exercisetitle}]
      }{\end{tcolorbox}}

    % 10. BADGE
    \DeclareExerciseEnvironmentTemplate{badge}{%
      \begin{tcolorbox}[enhanced, breakable, parbox=false, skin=bicolor, \neo@getexframestyle, boxrule=\neo@normalrule, neo ex arcs, colframe=exerciseColor, neo@exbackstyle, colupper=\neoschool@globalcolor, coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi, fonttitle=\csname\neoschool@headweight\endcsname, left=\neo@hpadding, right=\neo@hpadding, after skip=\neo@effective@ex@beforeafterskip, before skip=\neo@effective@ex@beforeafterskip, top=4pt, exboxshape=\neoschool@exboxshape,
        before upper*={%
          \setlength{\parindent}{0pt}%
          \tcbox[neo@shared@box, on line, colupper=backgroundColor, colback=exerciseColor, colframe=exerciseColor, boxrule=\neo@verythickrule, neo ex arcs,
            top=-1pt, bottom=-1pt, left=-0.5pt, right=-0.5pt,
            arc=\neoschool@exboxarc, neo ex arcs,
          ]{\neo@boxcontent@full}%
        }]%
        {\neo@print@box@meta}
      }{\end{tcolorbox}}

    % 11. BADGE-OUTLINE
    \DeclareExerciseEnvironmentTemplate{badge-outline}{%
      \begin{tcolorbox}[enhanced, breakable, parbox=false, skin=bicolor, neo ex arcs, \neo@getexframestyle, boxrule=\neo@normalrule, colframe=exerciseColor, neo@exbackstyle, colupper=\neoschool@globalcolor, coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi, fonttitle=\csname\neoschool@headweight\endcsname, left=\neo@hpadding, right=\neo@hpadding, after skip=\neo@effective@ex@beforeafterskip, before skip=\neo@effective@ex@beforeafterskip, top=4pt, exboxshape=\neoschool@exboxshape,
        before upper*={%
          \setlength{\parindent}{0pt}%
          \tcbox[neo@shared@box, on line,
            colupper=exerciseColor, colback=backgroundColor, colframe=exerciseColor, boxrule=\neo@normalrule,
            arc=\neoschool@exboxarc,
          ]{\neo@boxcontent@full}%
        }]%
        {\neo@print@box@meta}
      }{\end{tcolorbox}}

    % 12. DIGIT
    \DeclareExerciseEnvironmentTemplate{digit}{%
      \begin{tcolorbox}[enhanced, breakable, parbox=false, skin=bicolor, \neo@getexframestyle, boxrule=\neo@normalrule,  neo ex arcs, colframe=exerciseColor, neo@exbackstyle, colupper=\neoschool@globalcolor, coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi, fonttitle=\csname\neoschool@headweight\endcsname, left=\neo@hpadding, right=\neo@hpadding, after skip=\neo@effective@ex@beforeafterskip, before skip=\neo@effective@ex@beforeafterskip, top=4pt, exboxshape=\neoschool@exboxshape,
        before upper*={%
          \setlength{\parindent}{0pt}%
          \tcbox[neo@shared@box, on line,
            colupper=backgroundColor, colback=exerciseColor, colframe=exerciseColor, boxrule=\neo@thickrule, neo ex arcs,
            top=-1pt, bottom=-1pt, left=-0.5pt, right=-0.5pt,
          ]{\neo@boxcontent@digit}%
        }]%
        {\neo@print@box@meta}
      }{\end{tcolorbox}}

    % 13. DIGIT-OUTLINE
    \DeclareExerciseEnvironmentTemplate{digit-outline}{%
      \begin{tcolorbox}[enhanced, breakable, parbox=false, skin=bicolor, \neo@getexframestyle, boxrule=\neo@normalrule, neo ex arcs, colframe=exerciseColor, neo@exbackstyle, colupper=\neoschool@globalcolor, coltitle=\ifnum\neoschool@exframeopacity<60 #1\else backgroundColor\fi, fonttitle=\csname\neoschool@headweight\endcsname, left=\neo@hpadding, right=\neo@hpadding, after skip=\neo@effective@ex@beforeafterskip, before skip=\neo@effective@ex@beforeafterskip, top=4pt, exboxshape=\neoschool@exboxshape,
        before upper*={%
          \setlength{\parindent}{0pt}%
          \tcbox[neo@shared@box, on line,
            colupper=exerciseColor, colback=backgroundColor, colframe=exerciseColor, boxrule=\neo@normalrule, neo ex arcs,
            top=-1pt, bottom=-1pt, left=0pt, right=0pt,
          ]{\neo@boxcontent@digit}%
        }]%
        {\neo@print@box@meta}
      }{\end{tcolorbox}}

    % 14. COUNTER
    \DeclareExerciseEnvironmentTemplate{counter}{%
      \begin{tcolorbox}[neo@ex@counter,
        before upper*={%
          \setlength{\parindent}{0pt}%
          \tcbox[neo@shared@box, on line,
            colupper=backgroundColor, colback=exerciseColor, colframe=exerciseColor, boxrule=\neo@thickrule, neo ex arcs,
            top=1pt, bottom=1pt, left=0.75pt, right=0.75pt
          ]{\neo@boxcontent@counter}%
        }]%
        {\neo@print@box@meta}
      }{\end{tcolorbox}}

    % 15. COUNTER-OUTLINE
    \DeclareExerciseEnvironmentTemplate{counter-outline}{%
      \begin{tcolorbox}[neo@ex@counter,
        before upper*={%
          \setlength{\parindent}{0pt}%
          \tcbox[neo@shared@box, on line,
            colupper=exerciseColor, colback=backgroundColor, colframe=exerciseColor, boxrule=\neo@normalrule, neo ex arcs,
            top=1pt, bottom=1pt, left=0.75pt, right=0.75pt
          ]{\neo@boxcontent@counter}%
        }]%
        {\neo@print@box@meta}
      }{\end{tcolorbox}}

    % 16. LINE
    \DeclareExerciseEnvironmentTemplate{line}{%
      \par\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@style
        \tcbox[neo@linebox@filled]{\color{\ifnum\neoschool@exframeopacity<60 exerciseColor\else backgroundColor\fi}\neo@boxcontent@full}%
        \neo@linemeta@start
        \neo@thick@lineseparator{\footnotesize\lfchevrons}
        \neo@linemeta@end
      }%
      {\parfillskip0pt\par}
      \@afterindentfalse\@afterheading
    }{\par\vspace{\neo@effective@ex@beforeafterskip}}

    % 17. LINE OUTLINE
    \DeclareExerciseEnvironmentTemplate{line-outline}{%
      \par\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@style
        \tcbox[neo@linebox@outlined]{\color{exerciseColor}\neo@boxcontent@full}%
        \neo@linemeta@start
        \neo@lineseparator{\footnotesize\lchevrons}
        \neo@linemeta@end
      }%
      {\parfillskip0pt\par}
      \@afterindentfalse\@afterheading
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 18. LINE CIRCLE
    \DeclareExerciseEnvironmentTemplate{line-circle}{%
      \par\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@style\color{exerciseColor}%
        \tcbox[neo@linebox@filled]{\color{\ifnum\neoschool@exframeopacity<60 exerciseColor\else backgroundColor\fi}\neo@boxcontent@full}%
        \neo@linemeta@start
        \neo@thick@lineseparator{\small\ldisk}
        \neo@linemeta@end
      }%
      {\parfillskip0pt\par}
      \@afterindentfalse\@afterheading
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 19. LINE CIRCLE OUTLINE
    \DeclareExerciseEnvironmentTemplate{line-circle-outline}{%
      \par\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@style\color{exerciseColor}%
        \tcbox[neo@linebox@outlined]{\color{exerciseColor}\neo@boxcontent@full}%
        \neo@linemeta@start
        \neo@lineseparator{\small\lcircle}
        \neo@linemeta@end
      }%
      {\parfillskip0pt\par}
      \@afterindentfalse\@afterheading
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 20. CAPSULE
    \DeclareExerciseEnvironmentTemplate{capsule}{%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@other@style\csname\neoschool@headshape\endcsname
        \tcbox[
          on line,
          left skip=-0.5mm,
          top=1pt, bottom=1pt, left=1.5pt, right=1.5pt,
          before skip=0pt,
          colframe=backgroundColor, colback=exerciseColor!\neoschool@exframeopacity!backgroundColor,
          neo ex arcs, extitleshape=\neoschool@exboxshape,
        ]{%
          \color{\ifnum\neoschool@exframeopacity<60 exerciseColor\else backgroundColor\fi}{\small\neo@exerciseicon}%
          \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
        }%
      }%
      {\neo@print@box@meta}
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 21. CAPSULE-OUTLINE
    \DeclareExerciseEnvironmentTemplate{capsule-outline}{%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@other@style\csname\neoschool@headshape\endcsname
        \tcbox[
          on line,
          left skip=-0.5mm,
          top=0.5pt, bottom=0.5pt, left=1pt, right=1  pt,
          before skip=0pt,
          colframe=exerciseColor!\neoschool@exframeopacity!backgroundColor, colback=backgroundColor, boxrule=\neo@normalrule,
          neo ex arcs, extitleshape=\neoschool@exboxshape,
        ]{%
          \color{exerciseColor}{\small\neo@exerciseicon}%
          \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
        }%
      }%
      {\neo@print@box@meta}
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 22. CARD
    \DeclareExerciseEnvironmentTemplate{card}{%
      \begin{tcolorbox}[neo@ex@card={exerciseColor}, title={\neo@exercisetitle}]
      }{\end{tcolorbox}}

    % 23. SEPARATOR
    \DeclareExerciseEnvironmentTemplate{separator}{%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \Needspace*{3\baselineskip}
      \noindent
      \makebox[\linewidth][l]{%
        {\color{exerciseColor}%
          {\small\neo@exerciseicon}%
          \neo@title@style
          \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
          \IfExercisePropertySetT{level}{%
            \enskip\neoexerciserating%
          }%
          \IfExercisePropertySetT{subtitle}{%
            {\enskip\itshape\rmfamily\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}%
          }%
          \hfill%
          \IfExercisePropertySetT{points}{%
            \enskip%
            \GetExerciseProperty{points}~%
            \IfExerciseGoalSingularTF{points}{point}{points}%
          }%
        }%
      }\\[-1ex]%
      \noindent%
      \tikz[baseline]{\draw[line width=\neo@exborder, exerciseColor, line cap=round] (0,0) -- (\linewidth,0);}%
      \par
      \@afterindentfalse\@afterheading
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 24. RULE
    \DeclareExerciseEnvironmentTemplate{rule}{%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \Needspace*{3\baselineskip}
      \noindent
      {%
        \color{exerciseColor}%
        \neo@title@style
        \neo@boxcontent@full
        \neo@linemeta@start
        \enskip
        \leaders\hrule height \neo@normalrule\hfill
        \enskip
        \neo@linemeta@end
      }%
      {\parfillskip0pt\par}\vspace{-0.5\parskip}
      \@afterindentfalse\@afterheading
    }{%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}%
    }

    % 25. SHELL
    \DeclareExerciseEnvironmentTemplate{shell}{%
      \neo@startsection{exerciseColor}
      {%
        {\small\neo@exerciseicon}%
        \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}\enskip%
        \IfExercisePropertySetT{level}{%
          \neoexerciserating\enskip}%
        \IfExercisePropertySetT{subtitle}{{\itshape\rmfamily\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}\enskip}%
        \IfExercisePropertySetT{points}{(%
          \GetExerciseProperty{points}~%
          \IfExerciseGoalSingularTF{points}
          {\XSIMtranslate{point}}%
          {\XSIMtranslate{points}}%
          )\enskip%
        }%
        {\small\faTerminal}%
      }%
      \color{\neoschool@globalcolor}\!%
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 26. SECTION
    \DeclareExerciseEnvironmentTemplate{section}{%
      \section*{\neo@section@content}
    }{}

    % 27. SUBSECTION
    \DeclareExerciseEnvironmentTemplate{subsection}{%
      \subsection*{\neo@section@content}
    }{}

    % 28. DIGIT-INLINE
    \DeclareExerciseEnvironmentTemplate{digit-inline}{%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@other@style\csname\neoschool@headshape\endcsname
        \tcbox[
          on line,
          top=1pt, bottom=1pt, left=0.75pt, right=0.75pt,
          before skip=0pt,
          colframe=backgroundColor, colback=exerciseColor,
          neo ex arcs, extitleshape=\neoschool@exboxshape,
        ]{%
          \color{backgroundColor}\neo@boxcontent@digit
        }%
      }%
      {\neo@print@box@meta}
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 29. DIGIT-OUTLINE-INLINE
    \DeclareExerciseEnvironmentTemplate{digit-outline-inline}{%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@other@style\csname\neoschool@headshape\endcsname
        \tcbox[
          on line,
          top=0pt, bottom=0pt, left=0.5pt, right=0.5pt,
          before skip=0pt,
          colframe=exerciseColor, colback=backgroundColor, boxrule=\neo@normalrule,
          neo ex arcs, extitleshape=\neoschool@exboxshape,
        ]{%
          \color{exerciseColor}\neo@boxcontent@digit
        }%
      }%
      {\neo@print@box@meta}
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 30. COUNTER-INLINE
    \DeclareExerciseEnvironmentTemplate{counter-inline}{%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@other@style\csname\neoschool@headshape\endcsname
        \tcbox[
          on line,
          top=1pt, bottom=1pt, left=0.75pt, right=0.75pt,
          before skip=0pt,
          colframe=backgroundColor, colback=exerciseColor,
          neo ex arcs, extitleshape=\neoschool@exboxshape,
        ]{%
          \color{\ifnum\neoschool@exframeopacity<60 exerciseColor\else backgroundColor\fi}\neo@boxcontent@counter
        }%
      }%
      {\neo@print@box@meta}
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    % 31. COUNTER-OUTLINE-INLINE
    \DeclareExerciseEnvironmentTemplate{counter-outline-inline}{%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\neo@title@other@style\csname\neoschool@headshape\endcsname
        \tcbox[
          on line,
          top=0.5pt, bottom=0.5pt, left=0.75pt, right=0.75pt,
          before skip=0pt,
          colframe=exerciseColor, colback=backgroundColor, boxrule=\neo@normalrule,
          neo ex arcs, extitleshape=\neoschool@exboxshape,
        ]{%
          \color{exerciseColor}\neo@boxcontent@counter
        }%
      }%
      {\neo@print@box@meta}
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

    %% ==============================================================================
    %% Solution Configuration
    %% ==============================================================================

    \newcommand{\neo@sol@rotate@begin}{%
      \ifneoschool@solrotate
        \par\noindent
        \begin{tikzpicture}
          \node[rotate=180, inner sep=0pt] \bgroup
          \begin{minipage}{\linewidth}
          \fi
        }

        \newcommand{\neo@sol@rotate@end}{%
          \ifneoschool@solrotate
          \end{minipage}
          \egroup;
        \end{tikzpicture}
        \par
      \fi
    }

    \DeclareExerciseEnvironmentTemplate{sol-dots}{%
      \neo@sol@rotate@begin
      \needspace{3\baselineskip}%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \noindent%
      {\color{solutionColor}
        \neo@title@style
        \XSIMmixedcase{\GetExerciseName}%
        \csname neo@solutiongaptext\endcsname%
        \GetExerciseProperty{counter}%
      }%
      \enskip{\color{solutionColor}{\dotfill}}%
      \par\vspace{-\parskip}\vspace{0.25\baselineskip}%
    }{\nopagebreak%
      \par\vspace{-\parskip}%
      \noindent{\color{solutionColor}\dotfill}%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}%
      \neo@sol@rotate@end
    }

    \DeclareExerciseEnvironmentTemplate{sol-lines}{%
      \neo@sol@rotate@begin
      \needspace{3\baselineskip}%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}%
      \noindent%
      \makebox[\linewidth]{%
        \color{solutionColor}%
        \neo@title@style
        \neo@solutionname~\csname neo@solutiongaptext\endcsname\GetExerciseProperty{counter}%
        \hspace{.75em}%
        \xrfill[0ex]{\neo@decorativerule}[solutionColor]%
      }%
      \par%
    }{%
      \nopagebreak%
      \par%
      \vspace{-\parskip}%
      \ifneoschool@answersonly\else
        \noindent\color{solutionColor}\rule{\linewidth}{\neo@decorativerule}%
      \fi
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}%
      \neo@sol@rotate@end
    }

    \DeclareExerciseEnvironmentTemplate{sol-box}{%
      \neo@sol@rotate@begin
      \needspace{3\baselineskip}%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}%
      % \par\vspace{\neo@effective@ex@beforeafterskip}%
      \begin{tcolorbox}[
        enhanced,
        breakable,
        colframe=exerciseColor,
        colback=exerciseColor!10!backgroundColor,
        coltitle=exerciseColor,
        detach title,
        before upper={\tcbtitle\enskip},
        fonttitle=\neo@title@style,
        title={\neo@solutionname~\csname neo@solutiongaptext\endcsname\GetExerciseProperty{counter}.},
        arc=\neoschool@exboxarc,
        boxrule=\neo@exborder,
        left=2mm, right=2mm, top=2mm, bottom=2mm,
        before skip=0pt, after skip=0pt,
      ]
    }{%
      \end{tcolorbox}%
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}%
      % \par\vspace{\neo@effective@ex@beforeafterskip}%
      \neo@sol@rotate@end
    }

    \DeclareExerciseEnvironmentTemplate{sol-inline}{%
      \neo@sol@rotate@begin
      \par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
      \noindent
      {\color{solutionColor}
        \neo@title@style
        \XSIMmixedcase{\GetExerciseName}
        \csname neo@solutiongaptext\endcsname
        \GetExerciseProperty{counter}\neoschool@exterminator\hspace{0.55em}%
      }%
    }{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}%
      \neo@sol@rotate@end
    }

    %% ==============================================================================
    %% Exercise Configuration
    %% ==============================================================================

    % Enable solutions if answers option is active
    \ifneoschool@answers
      \xsimsetup{%
        solution/print=true
      }
    \fi

    \ifneoschool@answersonly
      \xsimsetup{%
        exercise/print=false,
        solution/print=true
      }
    \fi

    % Base exercise setup
    \ifneoschool@sectionthmcounter
      \ifneoschool@sharedexcounter
        \xsimsetup{%
          exercise/within = section,
          exercise/name = {\neo@exercisename},
          solution/name = {\neo@solutionname},
          solution/template = sol-inline
        }
        \renewcommand*{\theexercise}{\thesection.\arabic{thmcounter}}
        \AtBeginEnvironment{exercise}{\stepcounter{thmcounter}\addtocounter{exercise}{-1}}
      \else
        \xsimsetup{%
          exercise/within = section,
          exercise/name = {\neo@exercisename},
          solution/name = {\neo@solutionname},
          solution/template = sol-inline
        }
      \fi
    \else
      \ifneoschool@sharedexcounter
        \xsimsetup{%
          exercise/name = {\neo@exercisename},
          solution/name = {\neo@solutionname},
          solution/template = sol-inline
        }
        \renewcommand*{\theexercise}{\arabic{thmcounter}}
        \AtBeginEnvironment{exercise}{\stepcounter{thmcounter}\addtocounter{exercise}{-1}}
      \else
        \xsimsetup{%
          exercise/name = {\neo@exercisename},
          solution/name = {\neo@solutionname},
          solution/template = sol-inline
        }
      \fi
    \fi

    % Style selection based on class options
    \IfStrEqCase{\neoschool@exstyle}{%
      {raw}{\xsimsetup{exercise/template=inline}}
      {inline}{\xsimsetup{exercise/template=inline}}
      {block}{\xsimsetup{exercise/template=block}}
      {bar}{\xsimsetup{exercise/template=bar}}
      {tile}{\xsimsetup{exercise/template=tile}}
      {fold}{\xsimsetup{exercise/template=fold}}
      {plain}{\xsimsetup{exercise/template=plain}}
      {frame}{\xsimsetup{exercise/template=frame}}
      {curve}{\xsimsetup{exercise/template=curve}}
      {sticker}{\xsimsetup{exercise/template=sticker}}
      {pastel}{\xsimsetup{exercise/template=pastel}}
      {badge}{\xsimsetup{exercise/template=badge}}
      {badge-outline}{\xsimsetup{exercise/template=badge-outline}}
      {digit}{\xsimsetup{exercise/template=digit}}
      {digit-outline}{\xsimsetup{exercise/template=digit-outline}}
      {counter}{\xsimsetup{exercise/template=counter}}
      {counter-outline}{\xsimsetup{exercise/template=counter-outline}}
      {digit-inline}{\xsimsetup{exercise/template=digit-inline}}
      {digit-outline-inline}{\xsimsetup{exercise/template=digit-outline-inline}}
      {counter-inline}{\xsimsetup{exercise/template=counter-inline}}
      {counter-outline-inline}{\xsimsetup{exercise/template=counter-outline-inline}}
      {line}{\xsimsetup{exercise/template=line}}
      {line-outline}{\xsimsetup{exercise/template=line-outline}}
      {line-circle}{\xsimsetup{exercise/template=line-circle}}
      {line-circle-outline}{\xsimsetup{exercise/template=line-circle-outline}}
      {capsule}{\xsimsetup{exercise/template=capsule}}
      {capsule-outline}{\xsimsetup{exercise/template=capsule-outline}}
      {card}{\xsimsetup{exercise/template=card}}
      {rule}{\xsimsetup{exercise/template=rule}}
      {separator}{\xsimsetup{exercise/template=separator}}
      {shell}{\xsimsetup{exercise/template=shell}}
      {section}{\xsimsetup{exercise/template=section}}
      {subsection}{\xsimsetup{exercise/template=subsection}}
    }[\xsimsetup{exercise/template=capsule}]

    \IfStrEqCase{\neoschool@solstyle}{%
      {inline}{\xsimsetup{solution/template=sol-inline}}%
      {lines}{\xsimsetup{solution/template=sol-lines}}%
      {dots}{\xsimsetup{solution/template=sol-dots}}%
      {box}{\xsimsetup{solution/template=sol-box}}%
    }[\xsimsetup{solution/template=sol-inline}]%

    %% ==============================================================================
    %% Referencing an exercise
    %% ==============================================================================

    \ExplSyntaxOn
    \NewDocumentCommand \exercisenumber {m}
    {
      \xsim_get_property:nxn
      {exercise}
      { \xsim_get_id_for_property:nn {ID} {#1} }
      {counter}
    }
    \cs_generate_variant:Nn \xsim_get_property:nnn {nx}
    \ExplSyntaxOff

    %% ==============================================================================
    %% Utility Commands for Exercises
    %% ==============================================================================

    % Print exercises by level
    \NewDocumentCommand\printlevelexid{m}{%
      \noindent {\bfseries \csname neo@pathname\endcsname\space#1 :}
      \ForEachUsedExerciseByType{%
        \def\ExerciseType{##1}
        \def\ExerciseID{##2}
        \IfExercisePropertySetT{level}{%
          \ifnum\GetExerciseProperty{level}=#1
            \fbox{\GetExerciseProperty{id}}\hspace*{2mm}
          \else
            \hspace*{5mm}
          \fi
        }
      }
    }

    %% ==============================================================================
    %% Final Configuration Commands
    %% ==============================================================================

    % Dynamic grid fill command
    \newlength{\neo@gridwidth}
    \NewDocumentCommand\gridfill{s O{titleColor} O{5mm} O{5mm}}{%
      \pgfmathsetmacro{\neo@gridwidth}{floor(\linewidth/1cm)}
      \edef\neo@gridwidth{\neo@gridwidth cm}
      \dimen0=\dimexpr\textheight-\pagetotal-2\baselineskip\relax
      \pgfmathsetmacro{\neo@heightcm}{floor((\the\dimen0/28.453)/0.5)*0.5}%
      \vspace*{\fill}%
      \IfBooleanTF{#1}
      {{\noindent\centering
          \frenchgrid[#2]{\neo@gridwidth}{\neo@heightcm cm}}}
      {{\noindent\centering
          \customgrid[#2][#3][#4]{\neo@gridwidth}{\neo@heightcm cm}}}%
    }

    % Solution text formatting
    \NewDocumentCommand\neo@solution@text{}{%
      {\neo@title@other@style
        \color{tcbcolframe}
        \ifx\neo@solutiongaptext\empty
          \neo@solutionname
        \else
          \neo@solutionname~\neo@solutiongaptext
        \fi
      }
    }

    %% ==============================================================================
    %% Utilities
    %% ==============================================================================

    %% Core Document Settings
    %% ----------------------------------
    % Table styling
    \setlength{\arrayrulewidth}{0.5pt}
    % \arrayrulecolor{titleColor}
    \renewcommand{\arraystretch}{1.15}

    % Document color management
    \newcommand{\documentcolor}[1]{%
      \color{#1}\global\let\default@color\current@color
    }

    % Initialize document settings
    \AtBeginDocument{%
      \documentcolor{\neoschool@globalcolor}
      \DeclareGraphicsExtensions{.pdf,.PDF,.eps,.EPS,.png,.PNG,.tif,.TIF,.jpg,.JPG,.jpeg,.JPEG}
    }

    %% Font Settings
    %% ----------------------------------
    \ifneo@sfall
      \renewcommand{\neoschool@headstyle}{sffamily}
      \renewcommand{\neoschool@titlestyle}{sffamily}
      \renewcommand{\familydefault}{\sfdefault}
    \fi

    \ifneo@sfbody
      \renewcommand{\familydefault}{\sfdefault}
    \fi

    %% Graphics Rules
    %% ----------------------------------
    \ifpdf
      \DeclareGraphicsRule{*}{mps}{*}{}
    \fi

    %% Layout and Drawing Tools
    %% ----------------------------------
    % Absolute positioning on page
    \newcommand{\positionobject}[4]{%
      \begin{tikzpicture}[remember picture, overlay]
        \node[inner sep=0pt, outer sep=0pt] at ($([xshift=#1,yshift=-#2]current page.north west)$) {%
          \adjustbox{scale=#3}{#4}
        };
      \end{tikzpicture}
    }

    % Advanced customizable grid
    \NewDocumentCommand{\customgrid}{ O{titleColor} O{5mm} O{5mm} m m }{%
      \tikzset{%
        gridlines/.style={%
          draw=#1,
          opacity=0.5
        },
        majorgrid/.style={%
          gridlines,
          line width=0.35pt
        },
        minorgrid/.style={%
          gridlines,
          line width=0.35pt
        }
      }
      \medskip\noindent\begin{tikzpicture}[inner sep=0, outer sep=0]
        % Calculate dimensions
        \pgfmathsetmacro\mywidth{#4}
        \pgfmathsetmacro\myheight{#5}
        \pgfmathsetmacro\incx{#2}
        \pgfmathsetmacro\incy{#3}

        % Vertical grid lines
        \pgfmathsetmacro\numx{int(\mywidth/\incx)}
        \foreach \x in {0,...,\numx}{%
          \pgfmathparse{mod(\x,5)==0 ? "majorgrid" : "minorgrid"}
          \edef\gridstyle{\pgfmathresult}
          \draw[\gridstyle]
          (\x * \incx pt, 0) -- (\x * \incx pt, \myheight pt);
        }

        % Horizontal grid lines
        \pgfmathsetmacro\numy{int(\myheight/\incy)}
        \foreach \y in {0,...,\numy}{%
          \pgfmathparse{mod(\y,5)==0 ? "majorgrid" : "minorgrid"}
          \edef\gridstyle{\pgfmathresult}
          \draw[\gridstyle]
          (0, \y * \incy pt) -- (\mywidth pt, \y * \incy pt);
        }
      \end{tikzpicture}
      \ignorespaces
      \par\vspace{7pt}
    }

    % Legacy grid command for backwards compatibility
    \NewDocumentCommand{\grid}{ O{titleColor} m m }{%
      \customgrid[#1][5mm][5mm]{#2}{#3}
    }

    \NewDocumentCommand{\frenchgrid}{ s O{titleColor!75} O{titleColor!50} m m }{%
      \tikzset{%
        fine lines/.style={draw={#3},very thin},
        thick lines/.style={draw={#2}},
      }
      \IfBooleanTF{#1}{%
        \noindent\centering
      }{%
        \noindent
      }%
      \begin{tikzpicture}[inner sep=0,outer sep=0]
        \pgfmathsetmacro\mywidth{#4}
        \pgfmathsetmacro\myheight{#5}
        \pgfmathsetmacro\incx{8mm}
        \pgfmathsetmacro\incypetits{2mm}
        \pgfmathsetmacro\incygrands{8mm}

        \pgfmathsetmacro\numx{floor(\mywidth/\incx)}
        \pgfmathsetmacro\adjwidth{\numx * \incx}

        \pgfmathsetmacro\numypetits{floor(\myheight/\incypetits)}
        \pgfmathsetmacro\numygrands{floor(\myheight/\incygrands)}
        \pgfmathsetmacro\adjheight{\numypetits * \incypetits}

        \foreach \x in {0,...,\numx}{%
          \draw[fine lines] (\x * \incx pt,0) -- (\x * \incx pt,\adjheight pt);
        }
        \foreach \y in {0,...,\numypetits}{%
          \draw[fine lines] (0,\y * \incypetits pt) -- (\adjwidth pt,\y * \incypetits pt);
        }
        \foreach \y in {0,...,\numygrands}{%
          \draw[thick lines] (0,\y * \incygrands pt) -- (\adjwidth pt,\y * \incygrands pt);
        }
      \end{tikzpicture}%
    }

    %% Notebook-Style Pages
    %% ----------------------------------
    % Simple lined notebook page
    \newcommand{\notebook}{%
      \begin{tikzpicture}[remember picture,overlay]
        \foreach \i in {3,...,27}{%
          \draw[teal] ($(current page.north west)+(0,-\i)$) --
          ($(current page.north east)+(0,-\i)$);
        }
        \draw [thick,red] ($(current page.north west)+(4,0)$) --
        ($(current page.south west)+(4,0)$);
      \end{tikzpicture}
    }

    % Minor grid notebook page
    \newcommand{\nbminorgrid}{%
      \begin{tikzpicture}[remember picture,overlay]
        \foreach \i in {0.5,1,...,30}{%
          \draw[teal!50] ($(current page.north west)+(0,-\i)$) --
          ($(current page.north east)+(0,-\i)$);
        }
        \foreach \i in {0.5,1,...,21}{%
          \draw [thick,teal!50] ($(current page.north west)+(\i,0)$) --
          ($(current page.south west)+(\i,0)$);
        }
      \end{tikzpicture}
    }

    % Major grid notebook page
    \newcommand{\nbmajorgrid}{%
      \begin{tikzpicture}[remember picture,overlay]
        \foreach \i in {2,2.8,...,30}{%
          \draw[teal!50] ($(current page.north west)+(0,-\i)$) --
          ($(current page.north east)+(0,-\i)$);
        }
        \foreach \i in {2,2.2,...,30}{%
          \draw[teal!25] ($(current page.north west)+(0,-\i)$) --
          ($(current page.north east)+(0,-\i)$);
        }
        \foreach \i in {4.0,4.8,...,21}{%
          \draw [thick,teal!50] ($(current page.north west)+(\i,0)$) --
          ($(current page.south west)+(\i,0)$);
        }
        \draw [thick,red] ($(current page.north west)+(4,0)$) --
        ($(current page.south west)+(4,0)$);
      \end{tikzpicture}
    }

    %% Horizontally Split Content
    %% ----------------------------------
    \NewDocumentCommand{\splitcontent}{ O{0.5} O{0.02} +m +m }{%
      % #1 : Width of the first section (default: 50%)
      % #2 : Horizontal gap between sections (default: 2%)
      % #3 : Content of the first section
      % #4 : Content of the second section
      \noindent
      \begin{minipage}{#1\linewidth}
        #3
      \end{minipage}%
      \hspace*{#2\linewidth}
      \begin{minipage}{\dimexpr\linewidth-#1\linewidth-#2\linewidth\relax}
        #4
      \end{minipage}%
    }

    %% Text With Image Layout
    %% ----------------------------------
    \NewDocumentCommand{\textwithimage}{s +m +m +m +m}{%
      \noindent
      \IfBooleanTF{#1}{%
        \par\begin{minipage}{#2\linewidth}
          \centering\includegraphics[width=#3\linewidth]{#5}
        \end{minipage}
        \hfill
        \begin{minipage}{\dimexpr\linewidth-#2\linewidth-1em\relax}
          #4
        \end{minipage}
      }{%
        \par\begin{minipage}{\dimexpr\linewidth-#2\linewidth-1em\relax}
          #4
        \end{minipage}%
        \hfill%
        \begin{minipage}{#2\linewidth}
          \begin{center}
            \centering\includegraphics[width=#3\linewidth]{#5}
          \end{center}
        \end{minipage}
      }
    }

    %% QR Code Integration
    %% ----------------------------------
    \NewDocumentCommand{\withqrcode}{ s O{2cm} +m +m }{%
      \qrset{hyperlink,height=#2}%
      \noindent%
      \IfBooleanTF{#1}{%
        \par\begin{tblr}{%
          width={\linewidth},
          colspec={X[j,m]Q[c,m]Q[c,m]}
          }
          {{{#4}}} &  & \centering\qrcode{#3}
        \end{tblr}%
      }{%
        \par\begin{tblr}{%
          width={\linewidth},
          colspec={Q[c,m]Q[c,m]X[j,m]}
          }
          \centering\qrcode{#3} &  & {{{#4}}}
        \end{tblr}%
      }%
    }

    %% Assessment Tools
    %% ----------------------------------
    % Point markers

    \NewDocumentCommand{\mrk}{s +O{} m}{%
        \IfBooleanTF{#1}
        {\reversemarginpar}
        {\normalmarginpar}%
        \ifx\empty#2\empty
          \marginnote{\color{structuralColor}\footnotesize\sffamily #3~\ifdim#3pt<2pt pt\else pts\fi}[0em]%
        \else
          \marginnote{%
            \color{structuralColor}
            \small\sffamily
            \parbox[c]{\marginparwidth}{%
              \begin{spacing}{0.8}
                \IfBooleanTF{#1}
                {\raggedleft}
                {\raggedright}
                (#3~\ifdim#3pt<2pt pt\else pts\fi) \tiny #2%
              \end{spacing}
            }%
          }[0em]%
        \fi
        \ignorespaces
    }

    % Answer lines
    \NewDocumentCommand{\lines}{ O{.} O{1.65em} m }{%
      \par
      \vspace*{0.5\baselineskip}
      \foreach \n in {1,...,#3}{%
        \noindent\parbox[t][#2][t]{\linewidth}{%
          \ifstrequal{#1}{.}{%
            \dotfill
          }{%
            \ifstrequal{#1}{-}{%
              \hrulefill
            }{%
              \leaders\hbox{#1}\hfill\kern0pt
            }
          }
        }
        \par
      }
    }

    % Dotted line with variable length
    \newcommand\vardots[1][\linewidth]{%
      \noindent\begin{tikzpicture}
        \draw[dotted, semithick, line cap=round] (0,0) -- ({#1},0);
      \end{tikzpicture}
    }

    %% Task Lists
    %% ----------------------------------
    \newcommand{\cmark}{%
      \ifneo@print
        \ding{51}%
      \else
        {\color{neoCorrectColor}\ding{51}}%
      \fi
    }

    \newcommand{\xmark}{%
      \ifneo@print
        \ding{55}%
      \else
        {\color{neoIncorrectColor}\ding{55}}%
      \fi
    }

    \newcommand{\unchecked}{%
      \item[\rlap{$\square$}\hspace{.7em}]%
    }

    \newcommand{\done}{%
      \item[\rlap{$\square$}{%
        \raisebox{1pt}{\large\hspace{1pt}\cmark}\hspace{-2.5pt}}]%
    }

    \newcommand{\wontfix}{%
      \item[\rlap{$\square$}{\large\hspace{1pt}\xmark}]%
    }

    %% Bold List Labels
    %% ----------------------------------

    \ifneoschool@boldlistlabels
      \AtEndPreamble{%
        \renewcommand{\labelenumi}{\textbf{\arabic{enumi}}.}
        \renewcommand{\labelenumii}{\textbf{\alph{enumii}}.}
        \renewcommand{\labelenumiii}{\textbf{\roman{enumiii}}.}
        \renewcommand{\labelenumiv}{\textbf{\Alph{enumiv}}.}
      }%
    \fi

    %% ==============================================================================
    %% Margin and Notes Management
    %% ==============================================================================

    \newlength{\neo@usernotes}
    \setlength{\neo@usernotes}{0pt}

    \ifdefempty{\neoschool@noteswidth}{}{%
      \setlength{\neo@usernotes}{\neoschool@noteswidth}
    }

    \ifdefempty{\neoschool@notesposition}{}{%
      \IfStrEq{\neoschool@notesposition}{none}{}{%
        \marginnotesactivetrue
      }
    }

    \AtEndPreamble{%
      \ifdefempty{\neoschool@margin}{}{%
        \setlength{\marginparsep}{0.5cm}

        \newlength{\neo@targetwidth}
        \setlength{\neo@targetwidth}{\paperwidth}
        \addtolength{\neo@targetwidth}{-2\dimexpr\neoschool@margin\relax}

        \newlength{\neo@targetheight}
        \setlength{\neo@targetheight}{\paperheight}
        \addtolength{\neo@targetheight}{-.75\dimexpr\neoschool@margin\relax}

        \areaset{\neo@targetwidth}{\neo@targetheight}
      }%
      \ifdefempty{\neoschool@noteswidth}{\def\neoschool@noteswidth{3cm}}{}%
      \ifdefempty{\neoschool@notesposition}{\def\neoschool@notesposition{none}}{}%
      %
      \IfStrEq{\neoschool@notesposition}{none}{%
      }{%
        \setlength{\marginparwidth}{\dimexpr\neoschool@noteswidth-0.25cm\relax}

        \IfStrEq{\neoschool@notesposition}{left}{%
          \setlength{\marginparsep}{0.5cm}
          \addtolength{\oddsidemargin}{\neoschool@noteswidth}
          \addtolength{\evensidemargin}{\neoschool@noteswidth}
          \addtolength{\textwidth}{-\neoschool@noteswidth}
          \reversemarginpar
        }{%
          \IfStrEq{\neoschool@notesposition}{right}{%
            \setlength{\marginparsep}{0.5cm}
            \setlength{\textwidth}{\dimexpr\paperwidth-\oddsidemargin-1in-\marginparsep-\neoschool@noteswidth-0.25cm\relax}
            \normalmarginpar
          }{%
            \IfStrEq{\neoschool@notesposition}{alternate}{%
              \setlength{\marginparwidth}{\dimexpr\neo@usernotes-0.5cm\relax}
              \setlength{\marginparsep}{0.5cm}
              \addtolength{\oddsidemargin}{\neo@usernotes}
              \addtolength{\evensidemargin}{\neo@usernotes}
              \areaset{\dimexpr 19cm-2\neo@usernotes\relax}{\dimexpr 29cm - \neoschool@margin}
            }{}%
          }%
        }%
      }%
    }

    %% Margin Notes Commands
    %% ----------------------------------

    \newtoggle{lmargin}

    \newcommand{\alternatingtodo}[2][]{%
      \IfStrEqCase{\neoschool@notesposition}{%
        {left}      {\reversemarginpar \todo[#1]{#2}}%
        {right}     {\normalmarginpar \todo[#1]{#2}}%
        {alternate} {%
          \iftoggle{lmargin}
          {\normalmarginpar \todo[#1]{#2} \togglefalse{lmargin}}
          {\reversemarginpar \todo[#1]{#2} \toggletrue{lmargin}}%
        }%
        {none} {}%
      }%
    }

    \newcommand{\tdnote}[2][]{%
      \ifmarginnotesactive
        \alternatingtodo[%
        bordercolor=solutionColor,
        linecolor=solutionColor,
        textcolor=solutionColor,
        backgroundcolor=solutionColor!\neoschool@boxopacity!backgroundColor,
        #1%
        ]{#2}%
      \fi
    }

    \newsavebox{\todobox}
    \newcounter{tdnotecounter}

    \newcommand{\neo@ifnodedefined}[3]{%
      \ifcsname pgf@sh@ns@#1\endcsname #2\else #3\fi
    }

    % Command: \tdmark[label]
    % Must be placed after \boxnote
    \newcommand{\tdmark}[1][inNote]{%
      \ifmarginnotesactive
        \IfStrEq{#1}{inNote}%
        {\def\neo@currlabel{neo-note-\thetdnotecounter}}%
        {\def\neo@currlabel{neo-note-#1}}%
        %
        \tikz[remember picture, overlay, baseline=(M.base)]{%
          \node[inner sep=0, outer sep=0, anchor=base] (M) {};

          \neo@ifnodedefined{\neo@currlabel}{%
            \coordinate (Start) at ([yshift=-3pt]M.center);

            \path let \p1 = (\neo@currlabel) in coordinate (NoteX) at (\x1, 0);

            \iftoggle{lmargin}%
            { \coordinate (VertX) at ([xshift=0.15cm]NoteX); }
            { \coordinate (VertX) at ([xshift=-0.15cm]NoteX); }

            \draw[thick, markerColor]
            (Start) -- (Start -| VertX) -- (VertX |- \neo@currlabel) -- (\neo@currlabel);
          }{}%
        }%
      \fi
    }

    % Command: \boxnote[label][options]{Content}
    % [label] for linking, [options] for visual (color, etc.)
    \NewDocumentCommand{\boxnote}{ O{inNote} O{} m }{%
      \IfStrEq{#1}{inNote}%
      {\stepcounter{tdnotecounter}\def\neo@currlabel{neo-note-\thetdnotecounter}}%
      {\def\neo@currlabel{neo-note-#1}}%
      %
      \ifmarginnotesactive
        \IfStrEq{\neoschool@notesposition}{left}{%
          \reversemarginpar\toggletrue{lmargin}%
        }{%
          \IfStrEq{\neoschool@notesposition}{right}{%
            \normalmarginpar\togglefalse{lmargin}%
          }{%
            \IfStrEq{\neoschool@notesposition}{alternate}{%
              \checkoddpage\ifoddpage\normalmarginpar\togglefalse{lmargin}\else\reversemarginpar\toggletrue{lmargin}\fi
            }{}%
          }%
        }%
        %
        \savebox\todobox{%
          \begin{minipage}{\marginparwidth}%
            \tdnote[inline, #2]{#3}%
          \end{minipage}%
        }%
        %
        \marginpar{%
          \usebox\todobox%
          \begin{tikzpicture}[remember picture, overlay]
            \pgfmathsetmacro{\neo@midY}{\ht\todobox/2}
            \iftoggle{lmargin}%
            {%
              \coordinate (\neo@currlabel) at (0pt, \neo@midY pt);
            }%
            {%
              \coordinate (\neo@currlabel) at (-\wd\todobox, \neo@midY pt);
            }%
          \end{tikzpicture}%
        }%
      \fi
    }

    %% Exam-style grading strip
    %% ----------------------------------
    \newcommand{\neo@mark@text}{%
      \ifneo@french
        Note%
      \else\ifneo@german
          Note%
        \else
          Mark%
        \fi\fi
    }

    \newcommand{\neo@appreciation@text}{%
      \ifneo@french
        Appréciation%
      \else\ifneo@german
          Bewertung%
        \else
          Comments%
        \fi\fi
    }

    \newcommand{\smallstrut}{\rule[-0.5ex]{0pt}{1.8ex}}

    \NewDocumentCommand{\gradingstrip}{ O{} }{%
      \noindent
      \begin{minipage}[t]{0.2\textwidth}
        \begin{tcolorbox}[%
          enhanced,
          colback=backgroundColor,
          colbacktitle=backgroundColor,
          colframe=\neoschool@globalcolor,
          sharp corners,
          boxrule=\neo@thinrule,
          height=2.5cm,
          title={\smallstrut\textmd{\color{\neoschool@globalcolor}\neo@mark@text}},
          center title,
          overlay={%
            \IfStrEq{#1}{}{}{%
              \coordinate (start) at ([xshift=-0.1mm,yshift=-0.575cm]frame.north east);
              \coordinate (end) at ([xshift=0.1mm,yshift=0.1mm]frame.south west);
              \draw[line width=\neo@decorativerule] (start) -- (end);
              \node[anchor=south east]
              at ([xshift=-0.4cm,yshift=0.4cm]end -| start) {#1};
            }%
          }
          ]
          \IfStrEq{#1}{}{%
            \vspace{2\baselineskip}
          }{}
        \end{tcolorbox}
      \end{minipage}%
      \hspace{.1cm}%
      \begin{minipage}[t]{0.79\textwidth}
        \begin{tcolorbox}[%
          enhanced,
          colback=backgroundColor,
          colbacktitle=backgroundColor,
          colframe=\neoschool@globalcolor,
          sharp corners,
          boxrule=\neo@thinrule,
          height=2.5cm,
          title={\smallstrut\textmd{\color{\neoschool@globalcolor}\neo@appreciation@text}},
          center title
          ]
          \vspace{2\baselineskip}
        \end{tcolorbox}
      \end{minipage}%
      \par
    }

    %% Skill Assessment Table
    %% ----------------------------------
    \newcommand{\competencies}[1]{%
      \colorlet{tempcolor}{\neoschool@globalcolor}

      \ifneo@print
        \def\iconcolorA{\neoschool@globalcolor!15!backgroundColor}
        \def\iconcolorB{\neoschool@globalcolor!15!backgroundColor}
        \def\iconcolorC{\neoschool@globalcolor!15!backgroundColor}
        \def\iconcolorD{\neoschool@globalcolor!15!backgroundColor}
      \else\ifneo@unicolor
          \ifneo@darktheme
            \def\iconcolorA{titleColor!30!backgroundColor}
            \def\iconcolorB{titleColor!30!backgroundColor}
            \def\iconcolorC{titleColor!30!backgroundColor}
            \def\iconcolorD{titleColor!30!backgroundColor}
          \else
            \def\iconcolorA{titleColor!25!backgroundColor}
            \def\iconcolorB{titleColor!25!backgroundColor}
            \def\iconcolorC{titleColor!25!backgroundColor}
            \def\iconcolorD{titleColor!25!backgroundColor}
          \fi
        \else
          \def\iconcolorA{Tomato}
          \def\iconcolorB{orange}
          \def\iconcolorC{yellow}
          \def\iconcolorD{green}
        \fi\fi

      \begin{center}
        \begin{tblr}{%
          colspec={|[0.5pt,tempcolor]t{.5\linewidth}|[0.5pt,tempcolor]
          Q[c,b]|[0.5pt,tempcolor]Q[c,b]|[0.5pt,tempcolor]
          Q[c,b]|[0.5pt,tempcolor]Q[c,b]|[0.5pt,tempcolor]},
          hlines = {0.5pt, tempcolor},
          row{1} = {abovesep=5pt},
          }
          \SetCell{cmd=\bfseries} \raisebox{0.25em}{\neo@competencies} &
                                                                         \dSadey[1.5][\iconcolorA]                                    & \dNeutrey[1.5][\iconcolorB]    &
                                                                                                                                                                         \dSmiley[1.5][\iconcolorC]                                   & \dChangey[1.5][\iconcolorD]{2}   \\
          #1                                                                                              \\
        \end{tblr}
      \end{center}
    }

    %% Tree and Graph Structure Support
    %% ----------------------------------
    % Forest settings for trees
    \forestset{
      w/.style = {
        edge label={
          node[midway, fill=backgroundColor, text=\neoschool@globalcolor] {$#1$}
        }
      }
    }

    \environbodyname\neotreebody
    \bracketset{action character=@}
    \NewEnviron{neotree}[1][]{%
      \forest
      for tree={%
        grow'=0,
        l=2.5cm,
        s sep=1.5cm,
        anchor=parent,
        math content,
        #1
      },
      [@\neotreebody]
      \endforest
    }

    % Graph settings (LuaTeX only)
    \ifLuaTeX
      \tikzset{%
        graphs/simpleer/.style={%
          nodes={%
            draw,
            circle,
            fill=backgroundColor,
            text=\neoschool@globalcolor,
            inner sep=1pt,
            minimum size=2em
          },
          node distance=2.5cm
        }
      }

      \newcommand{\neograph}[2][]{%
        \tikz \graph[%
        simpleer,
        simple necklace layout,
        edge quotes mid,
        edges={%
          rounded corners,
          nodes={%
            font=\scriptsize,
            fill=backgroundColor,
            #1,
            inner sep=1pt,
            align=center
          }
        },
        nodes={circle,draw}
        ]{#2};
      }
    \fi

    % Math Grid Environment
    \newcounter{neomathline}
    \newcounter{neomathcol}[neomathline]

    \newenvironment{mathgrid}[1]
    {%
      \def\mcols{#1}%
      \setcounter{neomathline}{0}%
      \par\noindent%
    }
    {\bigskip}

    \newcommand{\neoline}{%
      \ifnum\value{neomathcol}>0\\\fi%
      \stepcounter{neomathline}%
      \setcounter{neomathcol}{0}%
    }

    \newcommand{\neocol}[2][1]{%
      \stepcounter{neomathcol}%
      \ifnum\value{neomathcol}>1\quad\fi%
      \begin{minipage}[t]{\dimexpr\linewidth * #1 / \mcols - 2\columnsep}
        \setlength{\abovedisplayskip}{5pt}%
        \setlength{\belowdisplayskip}{5pt}%
        \begin{align*}
          #2
        \end{align*}
      \end{minipage}%
      \ignorespaces%
    }

    % Math Raster

    \NewDocumentEnvironment{mathraster}{ O{1} D<>{ams equation} O{} }
    {%
      \def\item{\tcbitem}%
      \begin{tcbitemize}[
        enhanced,
        size=small,
        raster columns=#1,
        raster equal height=all,
        raster equal skip=-1pt,
        raster halign=center,
        raster width=\linewidth,
        raster left skip=0pt,
        raster right skip=0pt,
        raster every box/.style={
          sharp corners,
          valign=center,
          #2 % math upper, ams equation
        },
        colframe=primaryColor!\neoschool@neoframeopacity!backgroundColor,
        colback=neoboxBgColor,
        #3
        ]%
      }{%
      \end{tcbitemize}
    }

    % Math color

    \newcommand*{\mc}[2][mathColor]{{\color{#1}#2}}
    
    %% ==============================================================================
    %% AI / NoAI Logos
    %% ==============================================================================

    \newcommand{\drawAIChipBase}{
      \shade[top color=titleColor!70!\neoschool@globalcolor, bottom color=titleColor!90!\neoschool@globalcolor, rounded corners=3pt] (0,0) rectangle (2,2);
      \draw[line width=1.5pt, titleColor!40!backgroundColor, rounded corners=3pt] (0,0) rectangle (2,2);

      \foreach \y in {0.2, 0.6, 1.0, 1.4, 1.8} {
        \draw[line width=2.5pt, titleColor!80!\neoschool@globalcolor] (-0.2,\y) -- (0,\y);
        \draw[line width=2.5pt, titleColor!80!\neoschool@globalcolor] (2,\y) -- (2.2,\y);
      }
      \foreach \x in {0.2, 0.6, 1.0, 1.4, 1.8} {
        \draw[line width=2.5pt, titleColor!80!\neoschool@globalcolor] (\x,-0.2) -- (\x,0);
        \draw[line width=2.5pt, titleColor!80!\neoschool@globalcolor] (\x,2) -- (\x,2.2);
      }
    }

    \newcommand{\drawAINeuralNet}{
      \begin{scope}[shift={(1,1)}, scale=0.85, opacity=0.6, color=titleColor!70!backgroundColor]
        \draw[line width=0.8pt] (0,0) circle (0.2);
        \draw[line width=0.8pt] (0.5, 0.6) circle (0.1);
        \draw[line width=0.8pt] (-0.5, 0.6) circle (0.1);
        \draw[line width=0.6pt] (0.6, -0.3) circle (0.1);
        \draw[line width=0.6pt] (-0.6, -0.3) circle (0.1);
        \draw[line width=0.8pt] (0, -0.7) circle (0.1);
        \draw[line width=0.8pt] (0, 0.8) circle (0.1);

        \draw[line width=0.5pt] (0,0) -- (0.5, 0.6);
        \draw[line width=0.5pt] (0,0) -- (-0.5, 0.6);
        \draw[line width=0.5pt] (0,0) -- (0.6, -0.3);
        \draw[line width=0.5pt] (0,0) -- (-0.6, -0.3);
        \draw[line width=0.5pt] (0,0) -- (0, -0.7);
        \draw[line width=0.5pt] (0, 0.8) -- (0.5, 0.6);
        \draw[line width=0.5pt] (0, 0.8) -- (-0.5, 0.6);
        \draw[line width=0.5pt] (-0.5, 0.6) -- (-0.6, -0.3);
        \draw[line width=0.5pt] (0.5, 0.6) -- (0.6, -0.3);
      \end{scope}
    }

    \newcommand{\drawAIText}{
      \node[font=\bfseries\sffamily\Large, backgroundColor] at (1,1) {\neo@ainame};
    }

    \newcommand{\AILogo}[1][scale=0.4]{%
      \begin{tikzpicture}[#1]
        \drawAIChipBase
        \drawAINeuralNet
        \drawAIText
      \end{tikzpicture}
    }
    \newcommand{\NoAILogo}[1][scale=0.4]{%
      \begin{tikzpicture}[#1]

        \drawAIChipBase
        \drawAIText

        \draw[line width=2pt, red!80!\neoschool@globalcolor, opacity=1] (1,1) circle (0.8);
        \draw[line width=2pt, red!80!\neoschool@globalcolor, opacity=1] (1-0.57, 1+0.57) -- (1+0.57, 1-0.57);

      \end{tikzpicture}
    }

    %% ==============================================================================
    %% Admonition Boxes
    %% ==============================================================================


    \tcbset{
      inline/.style={
        after title={\neoschool@adterminator\hspace{1ex}},
        attach title to upper
      },
      block/.style={
        after title={\par\vspace{0.5em}},
        attach title to upper
      },
      neoschool-admonition-layout/.style={
        /utils/exec={%
          \ifneoschool@inlineadmonition
            \pgfkeysalso{inline}%
          \else
            \pgfkeysalso{block}%
          \fi
        }
      }
    }

    \tcbset{
      % Minimal
      neo@ad@minimal/.style n args={3}{
        standard jigsaw,
        boxrule=\neo@adborder,
        colframe=#1!\neoschool@adframeopacity!backgroundColor,
        colback=#1!\neoschool@adboxopacity!backgroundColor,
        colupper=\neoschool@globalcolor,
        fonttitle=\neo@title@style,
        arc=\neoschool@adboxarc, auto outer arc, arc is curved,
        adboxshape=\neoschool@adboxshape,
        title={%
          \tcbox[
          on line,
          colback=#1!\neoschool@adframeopacity!backgroundColor,
          colframe=#1!\neoschool@adframeopacity!backgroundColor,
          boxrule=0pt,
          adtitleshape=\neoschool@adboxshape,
          left=5pt, right=3pt, top=1pt, bottom=1pt,
          ]{%
            \raisebox{-0.01em}{%
             \textcolor{\ifnum\neoschool@adframeopacity<60 #1\else backgroundColor\fi}{%
               \fontsize{10}{10}\selectfont#2%
             }%
          }%
          \hspace{0.55em}%
          \textcolor{\ifnum\neoschool@adframeopacity<60 #1\else backgroundColor\fi}{%
             \csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname#3%
          }%
        }%
      },
        neoschool-admonition-layout
      },
      % Modern
      neo@ad@modern/.style n args={3}{
        frame hidden,
        boxrule=0pt,
        borderline west={3.5pt}{0pt}{\ifneo@darktheme #1!70!white\else #1!\neoschool@adframeopacity\fi},
        colback=#1!\neoschool@adboxopacity!backgroundColor,
        colframe={\ifneo@darktheme #1!70!white\else #1\fi},
        colupper=\neoschool@globalcolor,
        arc=\neoschool@adboxarc, auto outer arc,
        adboxshape=\neoschool@adboxshape,
        fonttitle=\neo@title@style,
        coltitle={\ifneo@darktheme #1!20!white\else #1!85!black\fi},
        title={#2\hspace{0.5em}\bfseries#3},
        left=1em, right=1em,
        neoschool-admonition-layout
      },
      % Material
      neo@ad@material/.style n args={3}{
        boxrule=1.0pt,
        colframe=#1!\neoschool@adframeopacity!backgroundColor,
        colback=#1!\neoschool@adboxopacity!backgroundColor,
        colupper=\neoschool@globalcolor,
        shadow={3pt}{-3pt}{0pt}{#1!25!backgroundColor},
        attach boxed title to top left={xshift=10pt, yshift*=-10pt},
        arc=\neoschool@adboxarc, auto outer arc,
        adboxshape=\neoschool@adboxshape,
        boxed title style={
          frame hidden,
          colback=#1,
          arc=1.5mm,
          auto outer arc,
          boxrule=0pt,
          adtitleshape=\neoschool@adboxshape,
        },
        fonttitle=\sffamily\bfseries\small,
        coltitle=\ifnum\neoschool@adframeopacity<60 #1\else backgroundColor\fi,
        title={#2\hspace{0.5em}#3},
      },
      % Soft
      neo@ad@soft/.style n args={3}{
        frame hidden,
        colback=#1!\neoschool@adboxopacity!backgroundColor,
        colframe=#1,
        colupper=\neoschool@globalcolor,
        arc=\neoschool@adboxarc, auto outer arc,
        adboxshape=\neoschool@adboxshape,
        fonttitle=\neo@title@style,
        coltitle={\ifneo@darktheme #1!15!white\else #1!90!black\fi},
        title={#2\hspace{0.5em}\bfseries#3},
        neoschool-admonition-layout,
      },
      % Classic
      neo@ad@classic/.style n args={3}{
        enhanced,
        boxrule=\neo@adborder,
        colframe=#1!\neoschool@adframeopacity!backgroundColor,
        colback=#1!\neoschool@adboxopacity!backgroundColor,
        colbacktitle=#1!\neoschool@adboxopacity!backgroundColor,
        colupper=\neoschool@globalcolor,
        coltitle={\ifneo@darktheme #1!20!white\else #1!85!black\fi},
        fonttitle=\neo@title@style\bfseries,
        arc=\neoschool@adboxarc, auto outer arc,
        adboxshape=\neoschool@adboxshape,
        title={#2\hspace{0.5em}#3},
        toptitle=\neo@title@vpadding, bottomtitle=\neo@title@vpadding,
        titlerule=0.5pt,
        titlerule style={#1!40!backgroundColor},
      },
      % Professional
      neo@ad@professional/.style n args={3}{
        enhanced,
        boxrule=0.4pt,
        colframe=#1!20!backgroundColor,
        shadow={3pt}{-3pt}{0pt}{#1!25!backgroundColor},
        colback=#1!\neoschool@adboxopacity!backgroundColor,
        colbacktitle=#1!\neoschool@adboxopacity!backgroundColor,
        colupper=\neoschool@globalcolor,
        coltitle={\ifneo@darktheme #1!25!white\else #1!80!black\fi},
        fonttitle=\neo@title@style\bfseries,
        sharp corners=west,
        arc=\neoschool@adboxarc, auto outer arc,
        adboxshape=\neoschool@adboxshape,
        title={#2\hspace{0.5em}#3},
        toptitle=\neo@title@vpadding, bottomtitle=\neo@title@vpadding,
        left=8pt, right=8pt,
        borderline west={3pt}{0pt}{#1!\neoschool@adframeopacity!backgroundColor},
      },
    }

    \newtcolorbox{admonitionbase}[4][]{%
      enhanced,
      breakable,
      lines before break=3,
      left=\neo@ad@hpadding,
      right=\neo@ad@hpadding,
      top=\neo@ad@vpadding,
      bottom=\neo@ad@vpadding,
      before skip=\neo@effective@ad@beforeafterskip,
      after skip=\neo@effective@ad@beforeafterskip,
      neo@ad@\neoschool@adstyle={#2}{#3}{#4},
      #1
    }

    \pgfkeys{
      /neo/admonition/.is family, /neo/admonition,
      style/.store in=\neo@ad@style,
      style/.default=,
      title/.store in=\neo@ad@title,
      title/.default=,
      subtitle/.store in=\neo@ad@subtitle,
      subtitle/.default=,
      icon/.store in=\neo@ad@icon,
      icon/.default=,
      .unknown/.code={\PackageWarning{neoschool}{Unknown admonition key: \pgfkeyscurrentname}},
    }

    \newcommand{\neo@ad@reset}{%
      \def\neo@ad@style{}%
      \def\neo@ad@title{}%
      \def\neo@ad@subtitle{}%
      \def\neo@ad@icon{}%
    }

    \newcommand{\neo@ad@processtitle}[1]{%
      \ifx\neo@ad@title\@empty
        \ifx\neo@ad@subtitle\@empty
          #1%
        \else
          #1\neoschool@adseparator\neo@ad@subtitle
        \fi
      \else
        \neo@ad@title
      \fi
    }

    \newcommand{\neo@declareadmonition}[4]{%
      \expandafter\let\csname #1\endcsname\relax
      \expandafter\let\csname end#1\endcsname\relax
      %
      \NewDocumentEnvironment{#1}{O{} +b}{%
        \neo@ad@reset
        \pgfkeys{/neo/admonition, ##1}%
        \ifx\neo@ad@icon\@empty
          \def\neo@ad@currenticon{#3}%
        \else
          \let\neo@ad@currenticon\neo@ad@icon
        \fi
        \edef\neo@temp@call{%
          \noexpand\begin{admonitionbase}[\unexpanded\expandafter{\neo@ad@style}]{#2}{\noexpand\neo@ad@currenticon}{\noexpand\neo@ad@processtitle{#4}}%
          }%
          \neo@temp@call
          ##2%
        \end{admonitionbase}%
      }{}%
    }

    \neo@declareadmonition{note}     {noteColor}      {\faEdit}               {\neo@admonition@note}
    \neo@declareadmonition{info}     {infoColor}      {\faInfoCircle}         {\neo@admonition@info}
    \neo@declareadmonition{warning}  {warningColor}   {\faExclamationTriangle}{\neo@admonition@warning}
    \neo@declareadmonition{important}{importantColor} {\faExclamationCircle}  {\neo@admonition@important}
    \neo@declareadmonition{tip}      {tipColor}       {\faLightbulb}          {\neo@admonition@tip}
    \neo@declareadmonition{reminder} {reminderColor}  {\faBookmark}           {\neo@admonition@reminder}
    \neo@declareadmonition{summary}  {summaryColor}   {\faBars}               {\neo@admonition@summary}
    \neo@declareadmonition{toolbox}  {toolboxColor}   {\faTools}              {\neo@admonition@toolbox}
    \neo@declareadmonition{method}   {methodColor}    {\faTasks}              {\neo@methodname}
    \neo@declareadmonition{activity} {activityColor}  {\faPen}                {\neo@activityname}

    %% ==============================================================================
    %% Apply vspace factor
    %% ==============================================================================

    \newdimen\@tempdima
    \newdimen\@tempdimatwo

    \AtBeginDocument{%
      \setlength{\parskip}{\dimexpr\neo@vspace@factor\parskip\relax}
      \setlength{\abovedisplayskip}{\dimexpr\neo@vspace@factor\abovedisplayskip\relax}
      \setlength{\belowdisplayskip}{\dimexpr\neo@vspace@factor\belowdisplayskip\relax}
      \setlength{\abovedisplayshortskip}{\dimexpr\neo@vspace@factor\abovedisplayshortskip\relax}
      \setlength{\belowdisplayshortskip}{\dimexpr\neo@vspace@factor\belowdisplayshortskip\relax}
      \setlength{\floatsep}{\dimexpr\neo@vspace@factor\floatsep\relax}
      \setlength{\textfloatsep}{\dimexpr\neo@vspace@factor\textfloatsep\relax}
      \setlength{\intextsep}{\dimexpr\neo@vspace@factor\intextsep\relax}

      \newdimen\neo@list@sep
      \pgfmathsetlength{\neo@list@sep}{0.25 * \neo@vspace@factor * \baselineskip}

      \ifneoschool@listparskip
        \setlist{%
          itemsep=0pt,
          topsep=\neo@list@sep,
          parsep=\parskip,
          partopsep=0pt,
        }%
      \else
        \setlist{%
          itemsep=\neo@list@sep,
          topsep=\neo@list@sep,
          parsep=0pt,
          partopsep=0pt,
        }%
      \fi
    }

    \RedeclareSectionCommand[
    beforeskip=\dimexpr\neo@vspace@factor\dimexpr 1.1\baselineskip\relax\relax,
    afterskip=\dimexpr\neo@vspace@factor\dimexpr 0.5\baselineskip\relax\relax
    ]{section}
    \RedeclareSectionCommand[
    beforeskip=\dimexpr\neo@vspace@factor\dimexpr 0.9\baselineskip\relax\relax,
    afterskip=\dimexpr\neo@vspace@factor\dimexpr 0.3\baselineskip\relax\relax
    ]{subsection}
    \RedeclareSectionCommand[
    beforeskip=\dimexpr\neo@vspace@factor\dimexpr 0.7\baselineskip\relax\relax,
    afterskip=\dimexpr\neo@vspace@factor\dimexpr 0.15\baselineskip\relax\relax
    ]{subsubsection}
    \setlength{\titlespacing}{\dimexpr\neo@vspace@factor\baselineskip\relax}

    \AtBeginDocument{%
      \ifPDFTeX
      \else
        \ifXeTeX
        \else
          \ifx\neoschool@mathface\@empty\else
            \ifx\neoschool@mathfacescale\@empty\else
              \setmathfont[Scale=\neoschool@mathfacescale]{\mathface}
            \fi
          \fi
        \fi
      \fi
    }

    \AtBeginDocument{%
      \ifneo@darktheme
        \pagecolor{backgroundColor}
        \color{textColor}
      \fi
    }

    %% ==============================================================================
    %% End of Class
    %% ==============================================================================
