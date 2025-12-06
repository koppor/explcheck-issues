% neoschool.cls
%
% copyright (C) 2025 Razik Ikhlef
% razik.ikhlef@csilyon.fr
%
% The newest version of this documentclass should always be available
% from the following web page: https://apps.edulatex.xyz/neoschool/

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neoschool}[2025/11/14 v1.1.3]

\RequirePackage[table,svgnames,dvipsnames,x11names]{xcolor}

\RequirePackage{kvoptions}
\RequirePackage{siunitx}
\RequirePackage{pgffor}
\RequirePackage{xstring}

\SetupKeyvalOptions{
	family=neoschool,
	prefix=neoschool@
}

\DeclareStringOption[classic]{theme}

\ProcessKeyvalOptions*\relax

\def\neo@default@globalcolor{black}

\newif\ifneo@darktheme
\neo@darkthemefalse

% Palettes
\ExplSyntaxOn

\bool_new:N \l__neo_theme_found_bool

\cs_new_protected:Npn \__neo_set_theme:nnnnn #1 #2 #3 #4 #5
{%
	\definecolor{definitionBaseColor}{HTML}{#1}
	\definecolor{theoremBaseColor}{HTML}{#2}
	\definecolor{comprehensionBaseColor}{HTML}{#3}
	\definecolor{methodBaseColor}{HTML}{#4}
	\definecolor{exerciseBaseColor}{HTML}{#5}
}

\tl_set:Nx \l_tmpa_tl { \neoschool@theme }
\str_case:VnF \l_tmpa_tl
{%
	{abyss}         {\__neo_set_theme:nnnnn {2A8B86}{0F4D4A}{2D6B8F}{5A6E7A}{7B4B8C}}
		{aether}        {\__neo_set_theme:nnnnn {778899}{5F9EA0}{D48C3A}{708090}{4682B4}}
		{atlantic}      {\__neo_set_theme:nnnnn {006D77}{003087}{B05A3F}{005A66}{8B1E3F}}
		{autumn}        {\__neo_set_theme:nnnnn {5F0F40}{9A031E}{D0700A}{0F4C5C}{B55588}}
		{blossom}       {\__neo_set_theme:nnnnn {B83B3B}{8B5A2B}{C06600}{6D9F71}{AA4465}}
		{botanical}     {\__neo_set_theme:nnnnn {23783F}{04471C}{A0522D}{432818}{A3761F}}
		{burgundy}      {\__neo_set_theme:nnnnn {A34879}{4A0D28}{795548}{6D4653}{A73E5C}}
		{classic}       {\__neo_set_theme:nnnnn {4F7C5B}{2A4C7F}{A37129}{4B5563}{B85C3A}}
		{coral}         {\__neo_set_theme:nnnnn {264653}{2A9D8F}{B2821A}{C26F34}{D15C3E}}
		{cyprus}        {\__neo_set_theme:nnnnn {A7601F}{557400}{A64F2D}{3F6FAF}{9A456F}}
		{day}           {\__neo_set_theme:nnnnn {A45A22}{B04040}{5F7200}{4B5563}{3F60AF}}
		{deepocean}     {\__neo_set_theme:nnnnn {005F73}{003049}{0A9396}{4B5563}{212529}}
		{duo}           {\__neo_set_theme:nnnnn {3F70A0}{9F4A00}{4A7D00}{696969}{6052CF}}
		{eagle}         {\__neo_set_theme:nnnnn {006E50}{304F60}{822478}{696969}{882000}}
		{earth}         {\__neo_set_theme:nnnnn {3E2723}{6D4C41}{689F38}{A67C52}{D14015}}
		{foresthues}    {\__neo_set_theme:nnnnn {2D6F72}{274242}{502F28}{A63B2D}{D9532D}}
		{frost}         {\__neo_set_theme:nnnnn {007A85}{004FC0}{00845F}{5A6E7A}{B03060}}
		{glacier}       {\__neo_set_theme:nnnnn {0077B6}{023E8A}{4682B4}{005F8C}{4169E1}}
		{goldensummer}  {\__neo_set_theme:nnnnn {A67E2D}{172940}{725324}{5A6E7A}{CD2D17}}
		{graphite}      {\__neo_set_theme:nnnnn {606060}{252323}{777777}{545454}{696969}}
		{heather}       {\__neo_set_theme:nnnnn {7A66A3}{6B5B95}{A15036}{588C7E}{6D4653}}
		{heritage}      {\__neo_set_theme:nnnnn {003F2D}{630000}{273E47}{4A403A}{5C2A4F}}
		{kassio}        {\__neo_set_theme:nnnnn {3060AF}{A01F64}{3F6FAF}{696969}{D5305F}}
		{magma}         {\__neo_set_theme:nnnnn {0A9396}{005F73}{AE2012}{001219}{9B2226}}
		{midnight}      {%
			\neo@darkthemetrue
			\definecolor{neo@pagecolor}{HTML}{0B132B}
			\pagecolor{neo@pagecolor}
			\definecolor{neo@textcolor}{HTML}{E2E8F0}
			\def\neo@default@globalcolor{neo@textcolor}
			\__neo_set_theme:nnnnn {00A896}{00BFFF}{F9A620}{94A3B8}{C13B93}
		}
		{modern}        {\__neo_set_theme:nnnnn {2C3E50}{2980B9}{27AE60}{D35400}{C0392B}}
		{neon}          {\__neo_set_theme:nnnnn {1A1A2E}{0F3460}{16C172}{FF6B35}{FF2E63}}
		{nordic}        {\__neo_set_theme:nnnnn {2E3440}{5E81AC}{6B8E68}{5A8399}{BF616A}}
		{purplebliss}   {\__neo_set_theme:nnnnn {7D51A3}{2A1D42}{A3761F}{4F3278}{006D77}}
		{retrocafe}     {\__neo_set_theme:nnnnn {6F1D1B}{3B1F0F}{B58523}{585123}{99582A}}
		{saffronsky}    {\__neo_set_theme:nnnnn {B34400}{2B3A67}{C07336}{0F7497}{054B5C}}
		{scribe}        {\__neo_set_theme:nnnnn {8B0000}{B58523}{273E47}{432818}{003087}}
		{sepia}         {\__neo_set_theme:nnnnn {7C5F53}{4E3A2E}{5A6D55}{6D4C41}{795548}}
		{summer}        {\__neo_set_theme:nnnnn {008080}{4845D0}{A45F22}{1F6FBF}{B03060}}
		{twilight}      {\__neo_set_theme:nnnnn {1E3A5F}{34495E}{16A085}{D48C10}{C0392B}}
		{winkle}        {\__neo_set_theme:nnnnn {5D4EBF}{483D8B}{A37129}{696969}{4169E1}}
}
{%
	\PackageWarning{neoschool}{Theme~'\neoschool@theme'~unknown,~using~'classic'}
	\__neo_set_theme:nnnnn {4F7C5B}{2A4C7F}{A37129}{4B5563}{B85C3A}
}

\ExplSyntaxOff

\colorlet{definitionBgColor}{definitionBaseColor!6!white}
\colorlet{theoremBgColor}{theoremBaseColor!6!white}
\colorlet{comprehensionBgColor}{comprehensionBaseColor!6!white}
\colorlet{methodBgColor}{methodBaseColor!6!white}
\colorlet{exerciseBgColor}{exerciseBaseColor!6!white}

% 1. Fundamental Knowledge
\colorlet{definitionColor}{definitionBaseColor}
\colorlet{theoremColor}{theoremBaseColor}
\colorlet{lemmaColor}{theoremBaseColor}
\colorlet{lemmaBgColor}{theoremBgColor}
\colorlet{corollaryColor}{theoremBaseColor}
\colorlet{corollaryBgColor}{theoremBgColor}
\colorlet{propositionColor}{theoremBaseColor}
\colorlet{propositionBgColor}{theoremBgColor}
\colorlet{propertyColor}{theoremBaseColor}
\colorlet{propertyBgColor}{theoremBgColor}

% 2. Comprehension
\colorlet{comprehensionColor}{comprehensionBaseColor}
\colorlet{exampleColor}{comprehensionBaseColor}
\colorlet{exampleBgColor}{comprehensionBgColor}
\colorlet{remarkColor}{comprehensionBaseColor}
\colorlet{remarkBgColor}{comprehensionBgColor}
\colorlet{applicationColor}{comprehensionBaseColor}
\colorlet{applicationBgColor}{comprehensionBgColor}

% 3. Know-how
\colorlet{methodColor}{methodBaseColor}

% 4. Training
\colorlet{exerciseColor}{exerciseBaseColor}
\colorlet{activityColor}{exerciseBaseColor}
\colorlet{activityBgColor}{exerciseBgColor}

% Solution boxes (using method color for neutrality)
\colorlet{solutionColor}{methodBaseColor}
\colorlet{solutionBgColor}{methodBgColor}

% Structural Colors (titles, sections, etc.)
\colorlet{titleColor}{theoremBaseColor}
\colorlet{sectionColor}{theoremBaseColor}
\colorlet{subsectionColor}{theoremBaseColor!80!black}
\colorlet{subsubsectionColor}{methodBaseColor}

% Lines, headers, footers
\colorlet{structuralColor}{black!70}
\colorlet{alternateColor}{structuralColor}

% Code/Verbatim Colors
\colorlet{codeBackground}{theoremBgColor}
\colorlet{codeFrame}{theoremColor}
\colorlet{codeTitle}{theoremColor}
\colorlet{pseudocodeBackground}{methodColor!8!white}
\colorlet{pseudocodeFrame}{methodColor}
\colorlet{pseudocodeTitle}{methodColor}
\colorlet{verbColor}{methodBaseColor}
\colorlet{codeKeyword}{theoremBaseColor}
\colorlet{codeString}{exerciseBaseColor}
\colorlet{codeComment}{structuralColor!75!white}
\colorlet{codeNumber}{comprehensionBaseColor!70!black}
\colorlet{codeEmph}{definitionBaseColor}

% Other Colors
\definecolor{backgroundColor}{HTML}{FFFFFF}
\colorlet{answerfieldbgColor}{exerciseBgColor}
\colorlet{answerframeBgColor}{backgroundColor}
\colorlet{answerframeFrameColor}{exerciseColor}
\colorlet{emptyboxBgColor}{exerciseBgColor}
\definecolor{neoCorrectColor}{HTML}{16A085}
\definecolor{neoIncorrectColor}{HTML}{C0392B}
\colorlet{mathColor}{definitionColor}
\colorlet{mathHighlightColor}{comprehensionColor!25!white}

% Dark theme adjustments
\ifneo@darktheme
	\definecolor{darkthemegray}{HTML}{1E293B}
	\colorlet{backgroundColor}{neo@pagecolor}
	\colorlet{answerfieldbgColor}{darkthemegray}
	\colorlet{answerframeBgColor}{backgroundColor}
	\colorlet{answerframeFrameColor}{exerciseColor}
	\colorlet{emptyboxBgColor}{exerciseBaseColor!10!black}
	\colorlet{structuralColor}{white!70}
	\colorlet{alternateColor}{black!35}
	\colorlet{codeBackground}{darkthemegray}
	\colorlet{pseudocodeBackground}{darkthemegray}
\fi

% Basic boolean declarations
\newif\ifneo@unicolor
\newif\ifneo@english
\newif\ifneo@french
\newif\ifneo@german

% Style booleans
\newif\ifneo@classythm
\newif\ifneo@soberthm
\newif\ifneo@elegantthm
\newif\ifneo@classicthm
\newif\ifneo@slantedthm
\newif\ifneo@shadedthm
\newif\ifneo@boxedthm
\newif\ifneo@amslikethm

% Title booleans
\newif\ifneo@eval
\newif\ifneo@evalicons
\newif\ifneo@evalgrade
\newif\ifneo@evaliconsgrade
\newif\ifneo@exam
\newif\ifneo@titlebox
\newif\ifneo@tighttitle
\newif\ifneo@onlytitleleft
\newif\ifneo@onlytitle
\newif\ifneo@onlytitleright
\newif\ifneo@bubbles
\newif\ifneo@topbubbles
\newif\ifneo@bottombubbles
\newif\ifneo@mockexam
\newif\ifneo@shortexam
\newif\ifneo@shorteval
\newif\ifneo@shorttitle
\newif\ifneo@shortlesson
\newif\ifneo@examcolor
\neo@examcolorfalse

% Layout booleans
\newif\ifneo@nothmframe
\newif\ifneo@nothmback
\newif\ifneo@nocodeframe
\newif\ifneo@nocodeback
\newif\ifneo@codestyleactive
\newif\ifneo@noadback
\neo@noadbacktrue
\newif\ifneo@noadframe
\neo@noadframetrue

% Font booleans
\newif\ifneo@sfbody
\newif\ifneo@sfall
\newif\ifneo@mathastext

% Other booleans
\newif\ifneo@print
\newif\ifneo@fullheader
\newif\ifneo@headrule
\newif\ifneo@footrule
\newif\ifneo@headfootrule
\newif\ifneo@shuffle
\newif\ifneo@titlerule
\newif\ifneo@titlemidrule
\newif\ifneo@titlefullrule
\newif\ifneo@titleornament
\newif\ifneo@blocksol

%% Package specific options
\newif\ifneo@apmep
\newif\ifneo@mathics
\newif\ifneo@listings
\newif\ifneo@minted
\newif\ifneo@frenchmath

%% ==============================================================================
%% Basic Options and Setup Commands
%% ==============================================================================

\DeclareStringOption[\neo@default@globalcolor]{globalcolor}
\DeclareStringOption[sectionColor]{headcolor}
\DeclareStringOption[subsectionColor]{subcolor}
\DeclareStringOption[subsubsectionColor]{subsubcolor}
\DeclareStringOption[titleColor]{titlecolor}
\DeclareStringOption{titlehexcolor}
\DeclareStringOption[alternateColor]{headfootcolor}
\ProcessKeyvalOptions*\relax

\ifx\neoschool@titlehexcolor\@empty
\else
	\definecolor{titleColor}{HTML}{\neoschool@titlehexcolor}
\fi

\colorlet{subjectColor}{structuralColor}
\colorlet{subtitleColor}{methodBaseColor}

\newif\ifneo@palettechosen
\neo@palettechosenfalse

\newif\ifneo@unicolormode
\neo@unicolormodefalse

% unicolor - Single color throughout (minimalist style)
\DeclareOption{unicolor}{%
	\neo@palettechosentrue
	\neo@unicolormodetrue
	\def\neoschool@palette{unicolor}
	\colorlet{definitionColor}{\neoschool@titlecolor}
	\colorlet{theoremColor}{\neoschool@titlecolor}
	\colorlet{lemmaColor}{\neoschool@titlecolor}
	\colorlet{corollaryColor}{\neoschool@titlecolor}
	\colorlet{propositionColor}{\neoschool@titlecolor}
	\colorlet{propertyColor}{\neoschool@titlecolor}
	\colorlet{comprehensionColor}{\neoschool@titlecolor}
	\colorlet{activityColor}{\neoschool@titlecolor}
	\colorlet{methodColor}{\neoschool@titlecolor}
	\colorlet{applicationColor}{\neoschool@titlecolor}
	\colorlet{exerciseColor}{\neoschool@titlecolor}
	\colorlet{remarkColor}{\neoschool@titlecolor}
	\colorlet{exampleColor}{\neoschool@titlecolor}
	\colorlet{solutionColor}{\neoschool@titlecolor}
	\renewcommand{\neoschool@headcolor}{\neoschool@titlecolor}
	\renewcommand{\neoschool@subcolor}{\neoschool@titlecolor}
	\renewcommand{\neoschool@subsubcolor}{\neoschool@titlecolor}

	\ifneo@darktheme
		\colorlet{codeKeyword}{\neoschool@titlecolor}
		\colorlet{codeString}{\neoschool@titlecolor!85!white}
		\colorlet{codeComment}{black!55}
		\colorlet{codeNumber}{\neoschool@titlecolor!90!white}
		\colorlet{codeEmph}{\neoschool@titlecolor}
		\colorlet{verbColor}{\neoschool@titlecolor}
	\else
		\colorlet{codeBackground}{\neoschool@titlecolor!8!white}
		\colorlet{codeFrame}{\neoschool@titlecolor}
		\colorlet{codeKeyword}{\neoschool@titlecolor}
		\colorlet{codeString}{\neoschool@titlecolor!70!black}
		\colorlet{codeComment}{\neoschool@titlecolor!75!white}
		\colorlet{codeNumber}{\neoschool@titlecolor!80!black}
		\colorlet{codeEmph}{\neoschool@titlecolor}
		\colorlet{verbColor}{\neoschool@titlecolor!90!black}
	\fi

	\colorlet{mathColor}{\neoschool@titlecolor}
	\colorlet{neoCorrectColor}{\neoschool@titlecolor}
	\colorlet{neoIncorrectColor}{\neoschool@titlecolor}
	\colorlet{answerfieldbgColor}{\neoschool@titlecolor!8}
	\colorlet{answerframeFrameColor}{\neoschool@titlecolor}
}

%% ==============================================================================
%% Font Options
%% ==============================================================================

% Fonts
\DeclareStringOption{mainface}
\DeclareStringOption{mainfaceoptions}
\DeclareStringOption{sansface}
\DeclareStringOption{sansfaceoptions}
\DeclareStringOption{monoface}
\DeclareStringOption{monofaceoptions}
\DeclareStringOption{mathface}
\DeclareStringOption{mathfaceoptions}
\DeclareStringOption[1.0]{mathfacescale}
\DeclareStringOption{facefamily}
\DeclareStringOption{facefamilyoptions}

%% ==============================================================================
%% Heading Style Options
%% ==============================================================================

% Global heading styles
\DeclareStringOption[sffamily]{headstyle}
\DeclareStringOption[bfseries]{headweight}
\DeclareStringOption[scshape]{headshape}

% Title-specific styles
\DeclareStringOption[\neoschool@headstyle]{titlestyle}
\DeclareStringOption[\neoschool@headweight]{titleweight}
\DeclareStringOption[upshape]{titleshape}
\DeclareStringOption[center]{titlealign}

% Header and Footer styles
\DeclareStringOption[\neoschool@titlestyle]{headfootstyle}

% Section-specific styles
\DeclareStringOption[circle]{sectionnumstyle}     % circle, box, dash, plain
\DeclareStringOption[sc]{sectiontextstyle}        % sc, upper, lower
\DeclareStringOption[normal]{sectionstyle}        % ornaments, underline, normal, highlighted, shadedline
\DeclareStringOption[center]{sectionalign}

%% ==============================================================================
%% Language Support and Setup
%% ==============================================================================

% Language setup command
\newcommand{\neo@setupLanguage}[1]{%
	\neo@englishfalse
	\neo@frenchfalse
	\neo@germanfalse
	\@nameuse{neo@#1true}
	\renewcommand{\neo@lang}{#1}
}

% Names definition commands
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

\newcommand{\neo@definenames@three}[1]{%
	\expandafter\def\csname neo@solutionname\endcsname{#1}
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

% Language options
\DeclareOption{english}{%
	\neo@setupLanguage{english}
	\AtEndOfClass{\sisetup{locale = US,detect-all}}
	\neo@definenames@one{Theorem}{Proposition}{Property}{Lemma}{Corollary}{Definition}{Example}{Exercise}{Remark}
	\neo@definenames@two{Problem}{Conjecture}{Activity}{Method}{Application}{Competencies}{Listing}{Algorithm}{Page}
	\neo@definenames@three{Solution }
	\neo@defineextra{Examples}{of exercise }
	\neo@definepath{Path}
	\neo@defineproofnames{Proof}
	\neo@definenames@ai{AI}{No AI}
	\neo@definenames@calculator{Calculator use}{is allowed}{is not allowed}{exam mode}{only in}
	\neo@definenames@mockexam{Academy of}{EXAM IN}{Session}{Duration:}{Name:}
	\neo@definenames@mockexam@two{This document has}{pages numbered from}{to}{The quality of writing and rigor of reasoning will be taken into account.}{Any attempt, even partial, will be valued.}
}

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
	\neo@definenames@three{Corrigé }
	\neo@defineextra{Exemples}{de l'exercice }
	\neo@definepath{Parcours}
	\neo@defineproofnames{Démonstration}
	\neo@definenames@ai{IA}{Sans IA}
	\neo@definenames@calculator{L'usage de la calculatrice}{est autorisé}{n'est pas autorisé}{mode examen}{uniquement en}
	\neo@definenames@mockexam{Académie de}{ÉPREUVE DE}{Session}{Durée~:}{Nom~:}
	\neo@definenames@mockexam@two{Ce document comporte}{pages numérotées de}{à}{La qualité de la rédaction et la rigueur des raisonnements seront prises en compte dans l'évaluation des copies.}{Toute tentative, même partielle ou inachevée, sera valorisée.}
}

\DeclareOption{german}{%
	\neo@setupLanguage{german}
	\AtEndOfClass{\sisetup{locale = DE,detect-all}}
	\neo@definenames@one{Theorem}{Proposition}{Eigenschaft}{Lemma}{Korollar}{Definition}{Beispiel}{Übung}{Bemerkung}
	\neo@definenames@two{Problem}{Vermutung}{Aktivität}{Methode}{Anwendung}{Fähigkeiten}{Auflistung}{Algorithmus}{Seite}
	\neo@definenames@three{Lösung }
	\neo@defineextra{Beispiele}{von Übung }
	\neo@definepath{Stufe}
	\neo@defineproofnames{Beweis}
	\neo@definenames@ai{AI}{Keine KI}
	\neo@definenames@calculator{Rechnernutzung}{ist erlaubt}{ist nicht erlaubt}{Prüfungsmodus}{nur im}
	\neo@definenames@mockexam{Akademie von}{PRÜFUNG IN}{Sitzung}{Dauer:}{Name:}
	\neo@definenames@mockexam@two{Dieses Dokument enthält}{Seiten, nummeriert von}{bis}{Die Qualität des Schreibens und die Strenge der Argumentation werden bei der Bewertung berücksichtigt.}{Jeder Versuch, auch nur teilweise, wird gewertet.}
}

\DeclareOption{nofrenchlist}{\AtEndOfClass{\frenchsetup{StandardItemLabels=true}}}
\DeclareOption{frenchlistaspar}{\AtEndOfClass{\frenchsetup{ListItemsAsPar=true}}}

%% ==============================================================================
%% Style Setup
%% ==============================================================================

% Style setup command
\newcommand{\neo@setuptheoremstyle}[1]{%
	\neo@classythmfalse
	\neo@soberthmfalse
	\neo@elegantthmfalse
	\neo@classicthmfalse
	\neo@slantedthmfalse
	\neo@shadedthmfalse
	\neo@boxedthmfalse
	\neo@amslikethmfalse
	\@nameuse{neo@#1true}
	\def\neo@style{#1}
}

% Style options
\DeclareOption{classythm}{\neo@setuptheoremstyle{classythm}}
\DeclareOption{soberthm}{\neo@setuptheoremstyle{soberthm}}
\DeclareOption{classicthm}{\neo@setuptheoremstyle{classicthm}}
\DeclareOption{slantedthm}{\neo@setuptheoremstyle{slantedthm}}
\DeclareOption{shadedthm}{\neo@setuptheoremstyle{shadedthm}}
\DeclareOption{boxedthm}{\neo@setuptheoremstyle{boxedthm}}
\DeclareOption{amslikethm}{\neo@setuptheoremstyle{amslikethm}}
\DeclareOption{elegantthm}{\neo@setuptheoremstyle{elegantthm}}

\DeclareStringOption[]{thmstyle}
\DeclareStringOption[]{exstyle}

\DeclareOption{blocksol}{\neo@blocksoltrue}

\DeclareStringOption[box-elegant]{codestyle}

%% ==============================================================================
%% Layout Settings
%% ==============================================================================

% Layout setup command
\newif\ifneo@nothmback
\newif\ifneo@nothmframe
\newif\ifneo@nocodeback
\newif\ifneo@nocodeframe
\newif\ifneo@nocodenum
\newif\ifneo@noadback
\newif\ifneo@noadframe
\newif\ifneo@noexback

\neo@noadbacktrue
\neo@noadframetrue

% Options
\DeclareOption{nothmback}{\neo@nothmbacktrue}
\DeclareOption{nothmframe}{\neo@nothmframetrue}
\DeclareOption{nocodeback}{\neo@nocodebacktrue}
\DeclareOption{nocodeframe}{\neo@nocodeframetrue}
\DeclareOption{nocodenum}{\neo@nocodenumtrue}
\DeclareOption{noadback}{\neo@noadbacktrue}
\DeclareOption{noadframe}{\neo@noadframetrue}
\DeclareOption{thmback}{\neo@nothmbackfalse}
\DeclareOption{thmframe}{\neo@nothmframefalse}
\DeclareOption{codeback}{\neo@nocodebackfalse}
\DeclareOption{codeframe}{\neo@nocodeframefalse}
\DeclareOption{codenum}{\neo@nocodenumfalse}
\DeclareOption{adback}{\neo@noadbackfalse}
\DeclareOption{adframe}{\neo@noadframefalse}
\DeclareOption{noexback}{\neo@noexbacktrue}

\DeclareStringOption[1em]{indent}
\DeclareBoolOption{noindent}

\AtEndOfPackage{%
	\ifneoschool@noindent
		\AtBeginDocument{\setlength{\parindent}{0pt}}%
	\else
		\AtBeginDocument{\setlength{\parindent}{\neoschool@indent}}%
	\fi
}

%% ==============================================================================
%% Font Settings
%% ==============================================================================

% Font setup command
\newcommand{\neo@setupfont}[1]{%
	\@nameuse{neo@#1true}
	\ifx#1sfall
		\neo@sfbodytrue
	\fi
}

% Font options
\DeclareOption{sfbody}{\neo@setupfont{sfbody}}
\DeclareOption{sfall}{\neo@setupfont{sfall}}
\DeclareOption{mathastext}{\neo@setupfont{mathastext}}

%% ==============================================================================
%% Title Settings
%% ==============================================================================

% Title setup command
\newcommand{\neo@setuptitle}[1]{%
	\neo@evalfalse
	\neo@evaliconsfalse
	\neo@evalgradefalse
	\neo@evaliconsgradefalse
	\neo@examfalse
	\neo@titleboxfalse
	\neo@tighttitlefalse
	\neo@onlytitleleftfalse
	\neo@onlytitlefalse
	\neo@onlytitlerightfalse
	\neo@bubblesfalse
	\neo@topbubblesfalse
	\neo@bottombubblesfalse
	\neo@mockexamfalse
	\neo@shortexamfalse
	\neo@shortevalfalse
	\neo@shorttitlefalse
	\neo@shortlessonfalse
	\@nameuse{neo@#1true}
}

% Title options
\DeclareOption{exam}{\neo@setuptitle{exam}}
\DeclareOption{eval}{\neo@setuptitle{eval}}
\DeclareOption{evalicons}{\neo@setuptitle{evalicons}}
\DeclareOption{evalgrade}{\neo@setuptitle{evalgrade}}
\DeclareOption{evaliconsgrade}{\neo@setuptitle{evaliconsgrade}}
\DeclareOption{titlebox}{\neo@setuptitle{titlebox}}
\DeclareOption{tighttitle}{\neo@setuptitle{tighttitle}}
\DeclareOption{onlytitleleft}{\neo@setuptitle{onlytitleleft}}
\DeclareOption{onlytitle}{\neo@setuptitle{onlytitle}}
\DeclareOption{onlytitleright}{\neo@setuptitle{onlytitleright}}
\DeclareOption{bubbles}{\neo@setuptitle{bubbles}}
\DeclareOption{topbubbles}{\neo@setuptitle{topbubbles}}
\DeclareOption{bottombubbles}{\neo@setuptitle{bottombubbles}}
\DeclareOption{mockexam}{\neo@setuptitle{mockexam}}
\DeclareOption{shortexam}{\neo@setuptitle{shortexam}}
\DeclareOption{shorteval}{\neo@setuptitle{shorteval}}
\DeclareOption{shorttitle}{\neo@setuptitle{shorttitle}}
\DeclareOption{shortlesson}{\neo@setuptitle{shortlesson}}

%% ==============================================================================
%% Print Mode Configuration
%% ==============================================================================

% Print mode overrides all palette options and sets everything to black/grayscale
\newcommand{\neo@setupprint}{%
	\neo@printtrue%
	\neo@palettechosentrue%
	\renewcommand{\neoschool@globalcolor}{black}%
	\renewcommand{\neoschool@titlecolor}{black}%
	\renewcommand{\neoschool@headcolor}{black}%
	\renewcommand{\neoschool@subcolor}{black}%
	\renewcommand{\neoschool@subsubcolor}{black}%
	\renewcommand{\neoschool@headfootcolor}{black}%
	\colorlet{titleColor}{black}%
	\colorlet{subjectColor}{black!80}%
	\colorlet{subtitleColor}{black!60}%
	\colorlet{definitionColor}{black}%
	\colorlet{theoremColor}{black}%
	\colorlet{lemmaColor}{black}%
	\colorlet{corollaryColor}{black}%
	\colorlet{propertyColor}{black}%
	\colorlet{propositionColor}{black}%
	\colorlet{conjectureColor}{black}%
	\colorlet{comprehensionColor}{black}%
	\colorlet{activityColor}{black}%
	\colorlet{methodColor}{black}%
	\colorlet{applicationColor}{black}%
	\colorlet{codeKeyword}{black}%
	\colorlet{codeComment}{black!75}%
	\colorlet{codeString}{black}%
	\colorlet{codeEmph}{black}%
	\colorlet{codeNumber}{black!75}%
	\colorlet{verbColor}{black}%
	\colorlet{exerciseColor}{black}%
	\colorlet{exampleColor}{black}%
	\colorlet{remarkColor}{black}%
	\colorlet{solutionColor}{black}%
	\colorlet{alternateColor}{black}%
	\colorlet{sectionColor}{black}%
	\colorlet{subsectionColor}{black}%
	\colorlet{subsubsectionColor}{black}%
	\colorlet{noteColor}{black}%
	\colorlet{infoColor}{black}%
	\colorlet{warningColor}{black}%
	\colorlet{importantColor}{black}%
	\colorlet{tipColor}{black}%
	\colorlet{reminderColor}{black}%
	\colorlet{summaryColor}{black}%
	\colorlet{toolboxColor}{black}%
	\def\Hy@linkcolor{black}%
	\def\Hy@anchorcolor{black}%
	\def\Hy@citecolor{black}%
	\def\Hy@filecolor{black}%
	\def\Hy@menucolor{black}%
	\def\Hy@runcolor{black}%
	\def\Hy@urlcolor{black}%
	\def\neo@keywordstyle{\color{black}\bfseries}%
	\def\neo@commentstyle{\color{black!75}}%
	\def\neo@stringstyle{\color{black}}%
	\def\neo@emphstyle{\color{black}\bfseries}%
	\colorlet{neoCorrectColor}{black}
	\colorlet{neoIncorrectColor}{black}
	\colorlet{mathColor}{black}%
	\colorlet{answerfieldbgColor}{black!8}
	\colorlet{answerframeFrameColor}{black}
}
\DeclareOption{print}{\neo@setupprint}

\DeclareOption{examcolor}{%
	\neo@examcolortrue
}

%% ==============================================================================
%% Header and Footer Settings
%% ==============================================================================

% Header/footer setup command
\newcommand{\neo@setupheadfoot}[1]{%
	\@nameuse{neo@#1true}
}

% Header/footer options
\DeclareOption{fullheader}{\neo@setupheadfoot{fullheader}}
\DeclareOption{headrule}{\neo@setupheadfoot{headrule}}
\DeclareOption{footrule}{\neo@setupheadfoot{footrule}}
\DeclareOption{headfootrule}{\neo@setupheadfoot{headfootrule}}

\newif\ifneo@firstpagestyleoverride
\neo@firstpagestyleoverridefalse
\DeclareOption{nofooter}{\def\neo@pagestyle{empty}\neo@firstpagestyleoverridetrue}
\DeclareOption{pageonlyfooter}{\def\neo@pagestyle{pagenum}\neo@firstpagestyleoverridetrue}

%% ==============================================================================
%% Title Formatting Settings
%% ==============================================================================

% Title formatting setup command
\newcommand{\neo@setuptitleformat}[1]{%
	\@nameuse{neo@#1true}
}

% Title formatting options
\DeclareOption{titlerule}{\neo@setuptitleformat{titlerule}}
\DeclareOption{titlemidrule}{\neo@setuptitleformat{titlemidrule}}
\DeclareOption{titlefullrule}{\neo@setuptitleformat{titlefullrule}}
\DeclareOption{titleornament}{\neo@setuptitleformat{titleornament}}

%% ==============================================================================
%% Package Specific Options
%% ==============================================================================

% Package setup command
\newcommand{\neo@setuppackage}[1]{%
	\@nameuse{neo@#1true}%
}

% Package options
\DeclareOption{math}{\neo@setuppackage{math}}
\DeclareOption{apmep}{\neo@setuppackage{apmep}}
\DeclareOption{mathics}{\neo@setuppackage{mathics}}
\DeclareOption{listings}{\neo@setuppackage{listings}}
\DeclareOption{minted}{\neo@setuppackage{minted}}
\DeclareStringOption[1]{codewidth}
\DeclareBoolOption{centeredcode}

\DeclareOption{frenchmath}{\neo@setuppackage{frenchmath}}

%% ==============================================================================
%% Abstract Name
%% ==============================================================================

\DeclareStringOption[DEFAULT]{abstracttitle}

%% ==============================================================================
%% Margin Options
%% ==============================================================================

\DeclareStringOption[1cm]{margin}
\DeclareStringOption{notes}

\newif\ifneo@hasmarginoption
\neo@hasmarginoptionfalse

\newif\ifneo@hasnoteoption
\neo@hasnoteoptionfalse

\newif\ifmarginnotesactive
\marginnotesactivefalse

\newif\ifneo@leftnotes
\newif\ifneo@rightnotes

\DeclareStringOption{leftnotes}
\DeclareStringOption{rightnotes}

%% ==============================================================================
%% Bold List Labels
%% ==============================================================================

\DeclareBoolOption{boldlistlabels}

%% ==============================================================================
%% Solution Settings
%% ==============================================================================

% Solution options
\DeclareBoolOption{answers}
\DeclareBoolOption{answersonly}
\DeclareOption{shuffle}{\neo@shuffletrue}

%% ==============================================================================
%% Grading Total
%% ==============================================================================

\DeclareStringOption[20]{totalpoints}

%% ==============================================================================
%% Box Settings
%% ==============================================================================

% Box options
\DeclareStringOption{boxtitle}
\DeclareStringOption[2pt]{adboxarc}
\DeclareStringOption[1mm]{boxarc}
\DeclareStringOption[1mm]{codeboxarc}
\DeclareStringOption[1pt]{sideboxarc}
\DeclareStringOption[1mm]{thmboxarc}
\DeclareStringOption[1mm]{exboxarc}
\DeclareStringOption[1mm]{pseudoboxarc}

\DeclareBoolOption{inlinecodebox}

% Box setup command
\newcommand{\neo@setupbox}[2]{%
	\expandafter\def\csname neo@box@#1\endcsname{#2}
}

%% ==============================================================================
%% Theorem Settings
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
%% Exercices With Icons
%% ==============================================================================

\newif\ifneo@exerciseicons
\DeclareOption{exerciseicons}{\neo@exerciseiconstrue}

%% ==============================================================================
%% Font Scaling Options
%% ==============================================================================

\newif\ifneo@scale
\DeclareBoolOption{scale}

%% ==============================================================================
%% Graphics Mode
%% ==============================================================================

\DeclareBoolOption{graphics}

%% ==============================================================================
%% Extended Math Mode
%% ==============================================================================

\DeclareBoolOption{math}

%% ==============================================================================
%% Draft Mode
%% ==============================================================================

\DeclareBoolOption{faketext}

%% ==============================================================================
%% Vertical Space Compression Option
%% ==============================================================================

\DeclareStringOption[1.0]{vspacing}

%% ==============================================================================
%% TOC Options
%% ==============================================================================

\newif\ifneo@compacttoc
\DeclareOption{compacttoc}{\neo@compacttoctrue}

\newif\ifneo@monotoc
\DeclareOption{monotoc}{\neo@monotoctrue}

\newif\ifneo@twocolumntoc
\DeclareOption{twocolumntoc}{\neo@twocolumntoctrue}

%% ==============================================================================
%% Inline Admonitions
%% ==============================================================================

\DeclareBoolOption[true]{inlineadmonition}
\DeclareVoidOption{blockadmonition}{\neoschool@inlineadmonitionfalse}

%% ==============================================================================
%% Output Options
%% ==============================================================================

\newif\ifneo@twoupafourmode
\newif\ifneo@twoupathreemode
\newif\ifneo@fourupathreemode
\newif\ifneo@simpletwoupmode
\newif\ifneo@bookletafourmode
\newif\ifneo@bookletathreemode

\DeclareOption{2a5toa4}{\neo@twoupafourmodetrue}
\DeclareOption{2a4toa3}{\neo@twoupathreemodetrue}
\DeclareOption{4a5toa3}{\neo@fourupathreemodetrue}
\DeclareOption{2toa3}{\neo@simpletwoupmodetrue}
\DeclareOption{bookleta5}{\neo@bookletafourmodetrue}
\DeclareOption{bookleta4}{\neo@bookletathreemodetrue}

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

%% ==============================================================================
%% Final Class Setup
%% ==============================================================================

% Define default language and style
\def\neo@lang{english}
\def\neo@style{classic}

% Pass unknown options to scrartcl
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}

% Process keyval options
\ProcessKeyvalOptions*\relax

% Default options
\ExecuteOptions{%
	english,               % Default language
	amslikethm,            % Default theorem style
}

% Process remaining options
\ProcessOptions\relax

\ifx\neoschool@thmstyle\@empty
\else
	\def\neo@temp@style{\neoschool@thmstyle}

	\IfStrEq{\neo@temp@style}{classy}{\def\neo@temp@style{classythm}}{}
	\IfStrEq{\neo@temp@style}{sober}{\def\neo@temp@style{soberthm}}{}
	\IfStrEq{\neo@temp@style}{classic}{\def\neo@temp@style{classicthm}}{}
	\IfStrEq{\neo@temp@style}{slanted}{\def\neo@temp@style{slantedthm}}{}
	\IfStrEq{\neo@temp@style}{shaded}{\def\neo@temp@style{shadedthm}}{}
	\IfStrEq{\neo@temp@style}{boxed}{\def\neo@temp@style{boxedthm}}{}
	\IfStrEq{\neo@temp@style}{amslike}{\def\neo@temp@style{amslikethm}}{}
	\IfStrEq{\neo@temp@style}{elegant}{\def\neo@temp@style{elegantthm}}{}

	\expandafter\neo@setuptheoremstyle\expandafter{\neo@temp@style}
\fi

\ifx\neoschool@exstyle\@empty
	\let\neoschool@exstyle\neo@style
\fi

%% Vertical space compression factor
\edef\neo@vspace@factor{\neoschool@vspacing}

\ifdim\neo@vspace@factor pt<0.25pt
	\ClassWarning{neoschool}{vspacing value too small, setting to 0.25}
	\def\neo@vspace@factor{0.25}
\fi
\ifdim\neo@vspace@factor pt>2.0pt
	\ClassWarning{neoschool}{vspacing value too large, setting to 2.0}
	\def\neo@vspace@factor{2.0}
\fi

\ifneo@minted\else
	\ifneo@listings\else
		\neo@listingstrue
	\fi
\fi

% Load base class
\LoadClass{scrartcl}

\KOMAoptions{%
	DIV=last,
	parskip=half
}

\let\@unusedoptionlist\@empty

\ifneo@examcolor
  \AtEndOfClass{%
    \colorlet{exerciseColor}{theoremColor}
    \colorlet{activityColor}{theoremColor}
    \colorlet{tipColor}{theoremColor}
    \colorlet{toolboxColor}{theoremColor}
    \colorlet{infoColor}{theoremColor}
    \colorlet{noteColor}{theoremColor}
    \colorlet{summaryColor}{theoremColor}
    \colorlet{warningColor}{theoremColor!80!black}
    \colorlet{importantColor}{theoremColor!90!black}
    \colorlet{reminderColor}{theoremColor}
    \colorlet{answerfieldbgColor}{theoremColor!6}
    \colorlet{answerframeFrameColor}{theoremColor}
  }
\fi

%% ==============================================================================
%% Page Layout Configuration
%% ==============================================================================

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

% Intentionally small margins for teaching materials - ignore typearea warning
\neo@setupmargins{last}
\setlength{\headheight}{27pt}
\setlength{\footskip}{27pt}

\widowpenalty=9999
\clubpenalty=9999
\displaywidowpenalty=9999

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
%% Box and Frame Conditions Setup
%% ==============================================================================

% Basic color definitions for tcolorbox
\newcommand{\neo@tcbcolbacklower}{white}
\newcommand{\neo@tcbcolupper}{black}
\newcommand{\neo@tcbcoltitle}{white}

% Frame options definitions
\newcommand{\neo@framehidden}{}
\newcommand{\neo@adframehidden}{}
\newcommand{\neo@thmborder}{1pt}
\newcommand{\neo@thinrule}{0.5pt}
\newcommand{\neo@normalrule}{0.8pt}
\renewcommand{\neo@thmborder}{\neo@normalrule}
\newcommand{\neo@thickrule}{1.5pt}
\newcommand{\neo@decorativerule}{0.4pt}

\newcommand{\neo@leftpadding}{1ex}
\newcommand{\neo@rightpadding}{1ex}
\newcommand{\neo@toppadding}{1ex}
\newcommand{\neo@bottompadding}{1ex}
\newcommand{\neo@ad@left@padding}{20pt}
\newcommand{\neo@ad@right@padding}{5pt}
\newcommand{\neo@ad@top@padding}{3pt}
\newcommand{\neo@ad@bottom@padding}{3pt}
\newcommand{\neo@titleleftpadding}{0.5em}
\newcommand{\neo@titlerightpadding}{0.5em}
\newcommand{\neo@titletoppadding}{3pt}
\newcommand{\neo@titlebottompadding}{3pt}
\newcommand{\neo@beforeskip}{\baselineskip}
\newcommand{\neo@afterskip}{\baselineskip}
\newcommand{\neo@box@beforeskip}{\baselineskip}
\newcommand{\neo@box@afterskip}{\baselineskip}
\newcommand{\neo@code@box@beforeskip}{\baselineskip}
\newcommand{\neo@code@box@afterskip}{\baselineskip}
\newcommand{\neo@ad@beforeskip}{\baselineskip}
\newcommand{\neo@ad@afterskip}{\baselineskip}
\newcommand{\neo@code@box@top@padding}{1mm}
\newcommand{\neo@code@box@bottom@padding}{1mm}
\newcommand{\neo@code@box@left@padding}{2mm}
\newcommand{\neo@code@box@right@padding}{2mm}
\newcommand{\neo@codebox@titlecolor}{white}
\newcommand{\neo@ex@beforeafterskip}{\baselineskip}

\newdimen\neo@effective@beforeskip
\newdimen\neo@effective@afterskip
\newdimen\neo@effective@baseskip
\newdimen\neo@effective@code@beforeskip
\newdimen\neo@effective@code@afterskip
\newdimen\neo@effective@ad@beforeskip
\newdimen\neo@effective@ad@afterskip
\newdimen\neo@effective@ex@beforeafterskip

\ifdim\neo@vspace@factor pt=1.0pt
	\neo@effective@beforeskip=\neo@beforeskip
	\neo@effective@afterskip=\neo@afterskip
	\neo@effective@baseskip=0.75\baselineskip
	\neo@effective@code@beforeskip=\neo@code@box@beforeskip
	\neo@effective@code@afterskip=\neo@code@box@afterskip
	\neo@effective@ad@beforeskip=\neo@ad@beforeskip
	\neo@effective@ad@afterskip=\neo@ad@afterskip
	\neo@effective@ex@beforeafterskip=0.85\neo@ex@beforeafterskip
\else
	\pgfmathsetmacro{\neo@temp@factor}{\neo@vspace@factor * 0.75}
	\neo@effective@beforeskip=\dimexpr\neo@vspace@factor\neo@beforeskip\relax
	\neo@effective@afterskip=\dimexpr\neo@vspace@factor\neo@afterskip\relax
	\neo@effective@baseskip=\dimexpr\neo@temp@factor\baselineskip\relax
	\neo@effective@code@beforeskip=\dimexpr\neo@vspace@factor\neo@code@box@beforeskip\relax
	\neo@effective@code@afterskip=\dimexpr\neo@vspace@factor\neo@code@box@afterskip\relax
	\neo@effective@ad@beforeskip=\dimexpr\neo@vspace@factor\neo@ad@beforeskip\relax
	\neo@effective@ad@afterskip=\dimexpr\neo@vspace@factor\neo@ad@afterskip\relax
	\neo@effective@ex@beforeafterskip=\dimexpr\neo@temp@factor\neo@ex@beforeafterskip\relax
\fi

\ifneo@noadframe
	\renewcommand{\neo@adframehidden}{frame hidden}
	\ifneo@noadback
		\neo@effective@ad@beforeskip=\dimexpr0.75\neo@effective@ad@beforeskip\relax
		\neo@effective@ad@afterskip=\dimexpr0.75\neo@effective@ad@afterskip\relax
		\renewcommand{\neo@ad@left@padding}{13pt}
		\renewcommand{\neo@ad@right@padding}{0pt}
		\renewcommand{\neo@ad@top@padding}{0pt}
		\renewcommand{\neo@ad@bottom@padding}{0pt}
	\fi
\fi

\ifneo@darktheme
	\newcommand{\neo@tcbcolback}{darkthemegray}
\else
	\newcommand{\neo@tcbcolback}{tcbcolframe!6}
\fi

\ifneo@nocodeback
	\colorlet{codeBackground}{backgroundColor}
	\colorlet{pseudocodeBackground}{backgroundColor}
\fi

\ifneo@nocodeframe
	\renewcommand{\neo@codebox@titlecolor}{titleColor}
	\ifneo@nocodeback
		\renewcommand{\neo@code@box@left@padding}{0mm}
		\renewcommand{\neo@code@box@right@padding}{0mm}
	\fi
\fi

\ifneo@nothmback
	\ifneo@darktheme
		\definecolor{nobacklowercolor}{gray}{0.15}
		\renewcommand{\neo@tcbcolbacklower}{nobacklowercolor}
	\else
		\renewcommand{\neo@tcbcolbacklower}{tcbcolframe!6}
	\fi
	\renewcommand{\neo@tcbcolback}{backgroundColor}
\fi

\ifneo@nothmframe
	\renewcommand{\neo@framehidden}{frame hidden}
	\renewcommand{\neo@thmborder}{0pt}
	\renewcommand{\neo@tcbcoltitle}{tcbcolframe}
	\ifneo@nothmback
		\renewcommand{\neo@leftpadding}{-3pt}
		\renewcommand{\neo@rightpadding}{-2pt}
		\renewcommand{\neo@toppadding}{-1pt}
		\renewcommand{\neo@bottompadding}{-1pt}
		\renewcommand{\neo@titleleftpadding}{-2.5pt}
		\renewcommand{\neo@titlerightpadding}{-2.5pt}
		\renewcommand{\neo@titletoppadding}{-2pt}
		\renewcommand{\neo@titlebottompadding}{-2pt}
		\renewcommand{\neo@beforeskip}{0.25\baselineskip}
		\renewcommand{\neo@afterskip}{0.25\baselineskip}
		\renewcommand{\neo@box@beforeskip}{-7pt}
		\renewcommand{\neo@box@afterskip}{-7pt}
	\fi
\fi

%% ==============================================================================
%% Adjust spacing for two-column mode
%% ==============================================================================

\if@twocolumn
	\setlength{\columnsep}{2em}
\fi

%% ==============================================================================
%% Required Packages Setup
%% ==============================================================================

%% Core packages
\RequirePackage{iftex}                    % Engine detection
\RequirePackage{xkeyval}                  % Extended key-value support
\RequirePackage{calc}                     % Length calculations
\RequirePackage{ifthen}                   % Boolean expression
\RequirePackage{pdftexcmds}               % Conditionals
\RequirePackage{environ}                  % New Environments

% Hide Some Warnings
\RequirePackage{silence}
\WarningFilter{latexfont}{Font shape}
\renewcommand{\@font@warning}[1]{}
\WarningFilter{multicol}{}

%% Language support
\ifLuaTeX
	\RequirePackage{fontspec}
\fi

\ifneo@french
	\RequirePackage[main=french,shorthands=off]{babel}
\else\ifneo@german
		\RequirePackage[main=german]{babel}
	\else
		\RequirePackage[main=english]{babel}
	\fi
\fi

\RequirePackage{scrlayer-scrpage}        % Headers and footers
\RequirePackage{setspace}                % Line spacing
\RequirePackage{enumitem}                % Better List Options

\RequirePackage{multicol}                % Multiple columns
\RequirePackage{changepage}              % Dynamic page dimensions
\RequirePackage{needspace}               % Control page breaks

%% Graphics and colors
\RequirePackage[most]{tcolorbox}         % Colored boxes and frames
\RequirePackage{tikz}                    % Drawing tools
\RequirePackage{pgfplots}                % Plotting tools
\pgfplotsset{compat=1.8}                 % Set pgfplots version

%% TikZ libraries
\usetikzlibrary{%
	backgrounds,
	calc,
	decorations.shapes,
	positioning,
	shadows,
	shapes.arrows,
	shapes.geometric,
	shapes.misc
}

\ifneoschool@faketext
	\RequirePackage{blindtext}              % Fake Text in English and German
	\RequirePackage{lipsum}                 % Fake Text in Latin
\fi

\ifneoschool@graphics
	\RequirePackage{wrapfig}                 % Wrapped figures
	\RequirePackage{graphicx}                % Images
\fi

%% Additional TikZ-related packages
\RequirePackage{tikzsymbols}             % Additional symbols
\RequirePackage{tikzpagenodes}           % Page coordinate system
\RequirePackage{forest}                  % Tree diagrams
\useforestlibrary{linguistics}

%% LuaTeX specific packages
\ifLuaTeX
	\usetikzlibrary{graphs,graphdrawing,quotes,shadings}
	\usegdlibrary{circular,force,layered,routing,trees}
	\RequirePackage{luacolor}            % Color support for LuaTeX
	\RequirePackage{lua-ul}              % Underlining for LuaTeX
	\RequirePackage{luacas}              % Computer algebra for LuaTeX
\fi

%% Tables and arrays
\RequirePackage{colortbl}
\RequirePackage{tabularray}              % Advanced tables
\UseTblrLibrary{%
	amsmath,
	booktabs,
	diagbox,
	functional,
	varwidth,
	siunitx
}

\RequirePackage{adjustbox}               % Adjusting box dimensions

%% Extended Math packages
\ifneoschool@math
	\RequirePackage[suite,taupe]{tdsfrmath}  % French Math macros
	\let\mathscr\relax
\fi

\RequirePackage{nccmath}                 % Improved math spacing (extends amsmath)

\ifneoschool@math
	\RequirePackage{ncccomma}                % Math Comma
\fi

%% APMEP Compatibility Mode - Option 'apmep'

\ifneo@apmep
	% %% APMEP required packages
	\RequirePackage{textcomp}               % Text companion fonts
	\RequirePackage{esvect}                 % Vector arrows
	\RequirePackage{fourier-orns}           % Ornaments
	\RequirePackage{tabularx}               % Extended tables
	\RequirePackage[np]{numprint}           % Number printing
	\RequirePackage{tkz-tab}                % Variation Tables
	\RequirePackage{fancyvrb}               % Custom Verbatim

	\ifPDFTeX
		\RequirePackage{auto-pst-pdf}           % Needs -shell-escape option
	\fi

	%% PSTricks suite for APMEP
	\RequirePackage{pstricks}               % Base PSTricks
	\RequirePackage{pst-plot}               % Plotting
	\RequirePackage{pst-tree}               % Trees
	\RequirePackage{pst-node}               % Nodes
	\RequirePackage{pst-text}               % Text effects
	\RequirePackage{pst-eucl}               % Euclidean geometry
	\RequirePackage{pst-3dplot}             % 3D plotting
	\undef\pscalculate
	\RequirePackage{pst-bezier}             % Bezier curves
	\RequirePackage{pst-all}                % Loads most PSTricks packages
	\RequirePackage{pstricks-add}           % Additional features

	%% APMEP specific commands
	\newcommand{\euro}{\eurologo{}}
	\newcommand{\cg}{\texttt{]}}            % Left bracket
	\newcommand{\cd}{\texttt{[}}            % Right bracket
	\newcommand{\pg}{\geqslant}             % Greater than or equal
	\newcommand{\pp}{\leqslant}             % Less than or equal
	\newcommand{\vectt}[1]{\overrightarrow{\,\mathstrut\text{#1}\,}}
	\newcommand{\barre}[1]{\overline{\,\mathstrut#1\,}}
	\renewcommand{\d}{\,\text{d}}           % Differential d
	\renewcommand{\i}{\,\text{i}\,}         % Complex i

	\neoschool@boldlistlabelstrue

	%% APMEP coordinate systems
	\def\Oij{$\left(\text{O}~;~\vect{\imath},~\vect{\jmath}\right)$}
	\def\Oijk{$\left(\text{O}~;~\vect{\imath},~\vect{\jmath},~\vect{k}\right)$}
	\def\Ouv{$\left(\text{O}~;~\vect{u},~\vect{v}\right)$}

	%% APMEP font declaration
	\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
	\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
	\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
	\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
	\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\fi

%% Computer algebra system support
\ifneo@mathics
	\RequirePackage[mathics]{latexalpha2}
	\RequirePackage{asymptote}
\fi

%% Lists and enumerations
\RequirePackage{tasks}                     % Horizontal lists

%% Utilities and tools
\RequirePackage{cuted}                     % Abstract settings
\RequirePackage{qrcode}                    % QR code generation
\RequirePackage{xhfill}                    % Extended filling
\RequirePackage{fontawesome5}              % Icons
\RequirePackage{pifont}                    % Symbols
\RequirePackage{adforn}                    % Ornaments

\ifmarginnotesactive
  \RequirePackage[%
  \neo@lang,
  textsize=small
  ]{todonotes}                             % Todo notes
\fi

\RequirePackage{marginnote}                % Margin notes
\RequirePackage{algpseudocode}             % Algorithms
\RequirePackage{textcase}                  % Text case changing
\RequirePackage[use-files,clear-aux]{xsim} % Exercise sheets
\RequirePackage[normalem]{ulem}            % Underlining

%% Microtype
\AtEndOfClass{
  \let\CheckCommand\providecommand
  \RequirePackage{microtype}
}

%% Hyperref setup
\newcommand{\neo@setuphyperrefcolors}{%
	\ifneo@print
		\definecolor{neo@linkcolor}{gray}{0}%
		\definecolor{neo@urlcolor}{gray}{0}%
		\definecolor{neo@citecolor}{gray}{0}%
		\definecolor{neo@filecolor}{gray}{0}%
	\else
		\ifneo@unicolormode
			\colorlet{neo@linkcolor}{\neoschool@titlecolor}%
			\colorlet{neo@urlcolor}{\neoschool@titlecolor!85!black}%
			\colorlet{neo@citecolor}{\neoschool@titlecolor!70!black}%
			\colorlet{neo@filecolor}{\neoschool@titlecolor!80!black}%
		\else
			\colorlet{neo@linkcolor}{\neoschool@titlecolor}%
			\colorlet{neo@urlcolor}{comprehensionBaseColor}%
			\colorlet{neo@citecolor}{definitionBaseColor}%
			\colorlet{neo@filecolor}{methodBaseColor}%
		\fi
	\fi
}

\neo@setuphyperrefcolors

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
}%

%% ==============================================================================
%% Font Settings
%% ==============================================================================

% Font variable definitions
\edef\mainface{\expandonce{\neoschool@mainface}}
\edef\sansface{\expandonce{\neoschool@sansface}}
\edef\monoface{\expandonce{\neoschool@monoface}}
\edef\mathface{\expandonce{\neoschool@mathface}}
\edef\facefamily{\expandonce{\neoschool@facefamily}}

\ifPDFTeX
% PdfLaTeX configuration
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\expandafter\ifblank\expandafter{\facefamily}{%
	\expandafter\ifblank\expandafter{\mathface}{\ifneo@mathastext
			\RequirePackage[italic,eulergreek]{mathastext}\else\RequirePackage{newpxmath}\fi}{\RequirePackage[\neoschool@mathfaceoptions]{\neoschool@mathface}}

	\expandafter\ifblank\expandafter{\mainface}{\RequirePackage{newpxtext}}{\RequirePackage[\neoschool@mainfaceoptions]{\neoschool@mainface}}
	\expandafter\ifblank\expandafter{\sansface}{}{\RequirePackage[\neoschool@sansfaceoptions]{\neoschool@sansface}}
	\expandafter\ifblank\expandafter{\monoface}{}{\RequirePackage[\neoschool@monofaceoptions]{\neoschool@monoface}}
}{
	\RequirePackage[\neoschool@facefamilyoptions]{\neoschool@facefamily}
}

\else\ifXeTeX
% XeLaTeX configuration
\RequirePackage{fontspec}

\ifneo@scale
	\defaultfontfeatures[\rmfamily]{Scale=1}
	\defaultfontfeatures{Scale=MatchLowercase}
\fi

\defaultfontfeatures{Ligatures=TeX}

\expandafter\ifblank\expandafter{\mathface}{%
	\ifneo@mathastext
		\RequirePackage[italic,eulergreek]{mathastext}
	\else
		\IfFileExists{texgyrepagella-math.otf}{%
			\setmathfont{texgyrepagella-math.otf}
		}{%
			\RequirePackage{newpxmath}
		}
	\fi
}{%
	\RequirePackage{unicode-math}
	\expandafter\ifblank\expandafter{\neoschool@mathfaceoptions}{%
		\setmathfont{\mathface}
	}{%
		\setmathfont[\neoschool@mathfaceoptions]{\mathface}
	}
}

\expandafter\ifblank\expandafter{\mainface}{%
	\IfFileExists{texgyrepagella-regular.otf}{%
		\setmainfont{texgyrepagella-regular.otf}[BoldFont=texgyrepagella-bold.otf,
			ItalicFont=texgyrepagella-italic.otf,
			BoldItalicFont=texgyrepagella-bolditalic.otf]
	}{%
		\RequirePackage{newpxtext}
	}
}{%
	\setmainfont[\neoschool@mainfaceoptions]{\neoschool@mainface}
}

\expandafter\ifblank\expandafter{\sansface}{%
	\IfFileExists{texgyreheros-regular.otf}{%
		\setsansfont{texgyreheros-regular.otf}[BoldFont=texgyreheros-bold.otf,
			ItalicFont=texgyreheros-italic.otf,
			BoldItalicFont=texgyreheros-bolditalic.otf]
	}{%
		\setsansfont[Scale=0.92]{Helvetica}
	}
}{%
	\setsansfont[\neoschool@sansfaceoptions]{\neoschool@sansface}
}

\expandafter\ifblank\expandafter{\monoface}{%
	\IfFileExists{texgyrecursor-regular.otf}{%
		\setmonofont{texgyrecursor-regular.otf}[BoldFont=texgyrecursor-bold.otf,
			ItalicFont=texgyrecursor-italic.otf,
			BoldItalicFont=texgyrecursor-bolditalic.otf]
	}{%
		\RequirePackage{newpxtext}
	}
}{%
	\setmonofont[\neoschool@monofaceoptions]{\neoschool@monoface}
}

\else\ifLuaTeX
% LuaLaTeX configuration
\RequirePackage{fontspec}

\ifneo@scale
	\defaultfontfeatures[\rmfamily]{Scale=1}
	\defaultfontfeatures{Scale=MatchLowercase}
\fi

\defaultfontfeatures{Ligatures=TeX,Renderer=HarfBuzz}

\expandafter\ifblank\expandafter{\mathface}{%
	\ifneo@mathastext
		\RequirePackage[italic,eulergreeks]{mathastext}
	\else
		\RequirePackage{newpxmath}
	\fi
}{%
	\RequirePackage{unicode-math}
	\expandafter\ifblank\expandafter{\neoschool@mathfaceoptions}{%
		\setmathfont{\mathface}
	}{%
		\setmathfont[\neoschool@mathfaceoptions]{\mathface}
	}
}

\expandafter\ifblank\expandafter{\mainface}{%
		\setmainfont{TeX Gyre Pagella}
	}{%
		\setmainfont[\neoschool@mainfaceoptions]{\neoschool@mainface}
	}

	\expandafter\ifblank\expandafter{\sansface}{%
			\setsansfont[Scale=0.94]{TeX Gyre Heros}
		}{%
			\setsansfont[\neoschool@sansfaceoptions]{\neoschool@sansface}
		}

		\expandafter\ifblank\expandafter{\monoface}{%
				\setmonofont[Scale=1.05]{Latin Modern Mono}
			}{%
				\setmonofont[\neoschool@monofaceoptions]{\neoschool@monoface}
			}

		\fi\fi\fi

% SemiBold Weight

\AtEndPreamble{%
	\ifx\neoschool@mainface\@empty\else
		\def\neo@main@semibold{\neoschool@mainface SemiBold}%
		\def\neo@main@semibolditalic{\neoschool@mainface SemiBold Italic}%
		\let\neo@main@extra\@empty
		\IfFontExistsTF{\neo@main@semibold}{%
			\edef\neo@main@extra{FontFace={sb}{n}{* SemiBold}}%
		}{}%
		\IfFontExistsTF{\neo@main@semibolditalic}{%
			\ifx\neo@main@extra\@empty\else \appto\neo@main@extra{,}\fi
			\appto\neo@main@extra{FontFace={sb}{it}{* SemiBold Italic}}%
		}{}%
		\ifx\neo@main@extra\@empty\else
			\setmainfont{\neoschool@mainface}[%
				\neoschool@mainfaceoptions ,%
				\neo@main@extra
			]%
		\fi
	\fi
	\ifx\neoschool@sansface\@empty\else
		\def\neo@sans@semibold{\neoschool@sansface SemiBold}%
		\def\neo@sans@semibolditalic{\neoschool@sansface SemiBold Italic}%
		\let\neo@sans@extra\@empty
		\IfFontExistsTF{\neo@sans@semibold}{%
			\edef\neo@sans@extra{FontFace={sb}{n}{* SemiBold}}%
		}{}%
		\IfFontExistsTF{\neo@sans@semibolditalic}{%
			\ifx\neo@sans@extra\@empty\else \appto\neo@sans@extra{,}\fi
			\appto\neo@sans@extra{FontFace={sb}{it}{* SemiBold Italic}}%
		}{}%
		\ifx\neo@sans@extra\@empty\else
			\setsansfont{\neoschool@sansface}[%
				\neoschool@sansfaceoptions ,%
				\neo@sans@extra
			]%
		\fi
	\fi
	\ifx\neoschool@monoface\@empty\else
		\def\neo@mono@semibold{\neoschool@monoface SemiBold}%
		\def\neo@mono@semibolditalic{\neoschool@monoface SemiBold Italic}%
		\let\neo@mono@extra\@empty
		\IfFontExistsTF{\neo@mono@semibold}{%
			\edef\neo@mono@extra{FontFace={sb}{n}{* SemiBold}}%
		}{}%
		\IfFontExistsTF{\neo@mono@semibolditalic}{%
			\ifx\neo@mono@extra\@empty\else \appto\neo@mono@extra{,}\fi
			\appto\neo@mono@extra{FontFace={sb}{it}{* SemiBold Italic}}%
		}{}%
		\ifx\neo@mono@extra\@empty\else
			\setmonofont{\neoschool@monoface}[%
				\neoschool@monofaceoptions ,%
				\neo@mono@extra
			]%
		\fi
	\fi
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

% Common configuration
\ifneo@sfbody
	\renewcommand{\familydefault}{\sfdefault}
\fi

% Advances Math Packages
\ifneoschool@math
	\RequirePackage{mathrsfs}                % Mathematical script font
	\RequirePackage{annotate-equations}      % Equation annotations
	\RequirePackage{witharrows}              % Step-by-step solutions
	\RequirePackage[np]{numprint}            % Number printing
	\RequirePackage{xlop}                    % Arithmetic operations
	\RequirePackage{breqn}                   % Multiline Equations
	\RequirePackage{tkz-euclide}             % Euclidean geometry
	\RequirePackage{cancel}                  % Cancel an expression
	\RequirePackage{bm}                      % Bold Math
\fi

\AtBeginDocument{
	\mathcode`\;="303B
}

% Upright Capital and Greek Letters
\ifneo@frenchmath
	\DeclareMathSymbol{A}{\mathalpha}{operators}{65}
	\DeclareMathSymbol{B}{\mathalpha}{operators}{66}
	\DeclareMathSymbol{C}{\mathalpha}{operators}{67}
	\DeclareMathSymbol{D}{\mathalpha}{operators}{68}
	\DeclareMathSymbol{E}{\mathalpha}{operators}{69}
	\DeclareMathSymbol{F}{\mathalpha}{operators}{70}
	\DeclareMathSymbol{G}{\mathalpha}{operators}{71}
	\DeclareMathSymbol{H}{\mathalpha}{operators}{72}
	\DeclareMathSymbol{I}{\mathalpha}{operators}{73}
	\DeclareMathSymbol{J}{\mathalpha}{operators}{74}
	\DeclareMathSymbol{K}{\mathalpha}{operators}{75}
	\DeclareMathSymbol{L}{\mathalpha}{operators}{76}
	\DeclareMathSymbol{M}{\mathalpha}{operators}{77}
	\DeclareMathSymbol{N}{\mathalpha}{operators}{78}
	\DeclareMathSymbol{O}{\mathalpha}{operators}{79}
	\DeclareMathSymbol{P}{\mathalpha}{operators}{80}
	\DeclareMathSymbol{Q}{\mathalpha}{operators}{81}
	\DeclareMathSymbol{R}{\mathalpha}{operators}{82}
	\DeclareMathSymbol{S}{\mathalpha}{operators}{83}
	\DeclareMathSymbol{T}{\mathalpha}{operators}{84}
	\DeclareMathSymbol{U}{\mathalpha}{operators}{85}
	\DeclareMathSymbol{V}{\mathalpha}{operators}{86}
	\DeclareMathSymbol{W}{\mathalpha}{operators}{87}
	\DeclareMathSymbol{X}{\mathalpha}{operators}{88}
	\DeclareMathSymbol{Y}{\mathalpha}{operators}{89}
	\DeclareMathSymbol{Z}{\mathalpha}{operators}{90}

	\let\alpha\alphaup
	\let\beta\betaup
	\let\gamma\gammaup
	\let\delta\deltaup
	\let\epsilon\epsilonup
	\let\zeta\zetaup
	\let\eta\etaup
	\let\theta\thetaup
	\let\iota\iotaup
	\let\kappa\kappaup
	\let\lambda\lambdaup
	\let\mu\muup
	\let\nu\nuup
	\let\xi\xiup
	\let\pi\piup
	\let\rho\rhoup
	\let\sigma\sigmaup
	\let\tau\tauup
	\let\upsilon\upsilonup
	\let\phi\phiup
	\let\chi\chiup
	\let\psi\psiup
	\let\omega\omegaup
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



\newcommand{\LARGEminus}{\fontsize{14.5}{17.1}\selectfont}
\newcommand{\LARGEplus}{\fontsize{15.5}{18.6}\selectfont}
\newcommand{\LARGEhuge}{\fontsize{16.74}{20.09}\selectfont}
\newcommand{\hugeminus}{\fontsize{18.5}{22.2}\selectfont}

\setkomafont{disposition}{\mdseries}

% Header style configuration
\setkomafont{title}{\csname\neoschool@titlestyle\endcsname\csname\neoschool@titleweight\endcsname\color{\neoschool@titlecolor}\hugeminus}
\setkomafont{subtitle}{\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname\csname\neoschool@titleweight\endcsname\color{subtitleColor}\Large}
% \setkomafont{subtitle}{\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname\color{subtitleColor}}
% \setkomafont{subject}{\color{subjectColor}\csname\neoschool@titleweight\endcsname\large}
\setkomafont{subject}{\color{subjectColor}\large}
\setkomafont{author}{\color{subjectColor}\large}
\setkomafont{date}{\large}
\setkomafont{subsection}{\neo@title@other@style\color{\neoschool@subcolor}\large}
\setkomafont{subsubsection}{\neo@title@other@style\color{\neoschool@subsubcolor}}
\setkomafont{pagenumber}{\csname\neoschool@headstyle\endcsname\color{\neoschool@headfootcolor}}
\setkomafont{descriptionlabel}{\neo@title@style}

% Page number format
\renewcommand*\pagemark{%
	{\usekomafont{pagenumber}
			\color{\neoschool@headfootcolor}
			\csname neo@pagename\endcsname\nobreakspace\thepage\nobreakspace/\nobreakspace
			{\hypersetup{linkcolor=\neoschool@headfootcolor}\pageref{LastPage}}
		}
}

\newpairofpagestyles{firstpage}{%
	\ihead{}\chead{}\ohead{}%
	\ifoot{\@date}\cfoot{}\ofoot{\pagemark}%
	\KOMAoptions{headsepline=0pt}
}{%
	\ihead{}\chead{}\ohead{}%
	\ifoot{\@date}\cfoot{}\ofoot{\pagemark}%
	\KOMAoptions{headsepline=0pt}
}

% Short title support
\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\let\@shorttitle\@empty

\newcommand{\neo@displaytitle}{%
	\ifx\@shorttitle\@empty
		\StrLen{\@title}[\titlelength]%
		\ifnum\titlelength>85
			\StrMid{\@title}{1}{85}[\truncatedtitle]%
			\truncatedtitle\ldots
		\else
			\@title
		\fi
	\else
		\@shorttitle
	\fi
}

\newpairofpagestyles{followingpages}{%
	\ihead{}\chead{}\ohead{}%
	\ifoot{\neo@displaytitle}\cfoot{}\ofoot{\pagemark}%
}{%
	\ihead{}\chead{}\ohead{}%
	\ifoot{\neo@displaytitle}\cfoot{}\ofoot{\pagemark}%
}

\newpairofpagestyles{pagenum}{%
	\ihead{}\chead{}\ohead{}
	\ifoot{}\cfoot{\pagemark}\ofoot{}
	\KOMAoptions{headsepline=0pt,footsepline=0pt}
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
	\setlength\topsep{0pt}
	\setlength\parskip{0pt}
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
\newcommand{\neo@titledecoration}{%
	\ifneo@titlerule
		\vspace{2\titlespacing}%
		{\color{\neoschool@titlecolor}\rule{0.33\linewidth}{\neo@decorativerule}}
	\else
		\ifneo@titlemidrule
			\vspace{2\titlespacing}%
			{\color{\neoschool@titlecolor}\rule{0.5\linewidth}{\neo@decorativerule}}
		\else
			\ifneo@titlefullrule
				\vspace{2\titlespacing}%
				{\color{\neoschool@titlecolor}\rule{0.66\linewidth}{\neo@decorativerule}}%
			\else
				\ifneo@titleornament
					\vspace{2\titlespacing}%
					{\color{\neoschool@titlecolor}\scalebox{2}[1.5]{\adforn{21}\,\adforn{11}\,\adforn{49}}}
				\fi
			\fi
		\fi
	\fi
}

\let\@author\@empty
\let\@subject\@empty
\let\@subtitle\@empty

% Full title creation with all elements
\newcommand{\createfulltitle}{%
% Subject
\ifx\@subject\@empty\else
	{\usekomafont{subject}{\@subject\par}}
	\vspace{\titlespacing}
\fi

% Main title
{\noindent\usekomafont{title}{\@title\par}}

% Subtitle
\ifx\@subtitle\@empty\else
	\vspace{\titlespacing}
	{\noindent\usekomafont{subtitle}{\@subtitle\par}}
\fi

% Author
\ifx\@author\@empty
\else
  \ifx\@subtitle\@empty
    \vspace{1.25\titlespacing}
  \else
    \vspace{1.5\titlespacing}
  \fi
  {\noindent\usekomafont{author}{\@author\par}}%
\fi

% Decorative elements
\neo@titledecoration
\if@twocolumn\vspace{2.5\titlespacing}\else\vspace{1.5\titlespacing}\fi
}

% Only title creation (no author, subject, etc.)
\newcommand{\createonlytitle}{%
	{\noindent\usekomafont{title}{\@title\par}}
	\neo@titledecoration%
}

\renewcommand\maketitle{%
	\thispagestyle{firstpage}
	\bgroup
	\setlength{\varspace}{\dimexpr\titlespacing+\myscaleratio\oddsidemargin}
	\if@twocolumn
		\twocolumn[{%
      \ifx\neoschool@titlealign\neo@left
        \begin{neo@titleflushleft}
          \createfulltitle
        \end{neo@titleflushleft}
      \else
        \ifx\neoschool@titlealign\neo@right
          \noindent\raggedleft
          \createfulltitle
          \par
        \else
          \begin{neo@titlecenter}
            \createfulltitle
          \end{neo@titlecenter}
        \fi
      \fi
    }]
	\else
		\ifx\neoschool@titlealign\neo@left
			\begin{neo@titleflushleft}
				\noindent\createfulltitle
			\end{neo@titleflushleft}
		\else
      \ifx\neoschool@titlealign\neo@right
        \noindent\raggedleft
        \createfulltitle
        \par
			\else
				\begin{neo@titlecenter}
					\createfulltitle
				\end{neo@titlecenter}
			\fi
		\fi
	\fi
	\egroup
}

% Title box
\def\stringleft{left}
\def\stringcenter{center}
\def\stringright{right}
\ifneo@titlebox
  \newcommand{\neo@titleboxcontent}{%
	\newcommand{\neo@fancycolor}{exerciseColor!10!white}
	\begin{tikzpicture}[remember picture,overlay]
	  \def\titleanchor{west}
	  \def\titlebasepos{current page text area.north west}
	  \def\titlexshift{-1ex}
	  \def\subtitlepos{title.south west}
	  \def\subjectpos{title.north west}
	  \ifx\neoschool@titlealign\stringcenter
		\def\titleanchor{center}
		\def\titlebasepos{current page text area.north}
		\def\titlexshift{0ex}
		\def\subtitlepos{title.south}
		\def\subjectpos{title.north}
	  \fi
	  \ifx\neoschool@titlealign\stringright
		\def\titleanchor{east}
		\def\titlebasepos{current page text area.north east}
		\def\titlexshift{1ex}
		\def\subtitlepos{title.south east}
		\def\subjectpos{title.north east}
	  \fi

	  \ifx\@subject\@empty
		\def\startYshift{\dimexpr-2ex+1cm\relax}
	  \else
		\def\startYshift{\dimexpr-5.5ex+1cm\relax}
	  \fi

	  \node[anchor=\titleanchor] (title) at
	  ($([xshift=\titlexshift,yshift=\startYshift]\titlebasepos)$)
	  {\LARGE\csname\neoschool@titlestyle\endcsname
		\csname\neoschool@titleweight\endcsname
		\csname\neoschool@titleshape\endcsname
		\color{\neoschool@titlecolor}\@title};

	  \ifx\@subtitle\@empty\else
		\node[below=5mm of \subtitlepos, anchor=\titleanchor] (subtitle)
		{\usekomafont{subtitle}\large\@subtitle};
	  \fi

	  \ifx\@subject\@empty\else
		\node[above=5mm of \subjectpos, anchor=\titleanchor] (subject)
		{\usekomafont{subject}\large\@subject};
	  \fi

	  \coordinate (boxtop) at (title.north);
	  \coordinate (boxbottom) at (title.south);

	  \ifx\@subject\@empty\else
		\coordinate (boxtop) at (subject.north);
	  \fi

	  \ifx\@subtitle\@empty\else
		\coordinate (boxbottom) at (subtitle.south);
	  \fi

	  \fill[\neo@fancycolor]
	  ($(boxtop) + (-0.85cm, 0.95cm)$) -|
	  ($(current page.north east) + (0, 0)$) |-
	  ($(boxbottom) + (0.85cm, -0.95cm)$) -|
	  ($(current page.north west) + (-0.85cm, 0)$) |- cycle;

	  \node[anchor=\titleanchor] at
	  ($([xshift=\titlexshift,yshift=\startYshift]\titlebasepos)$)
	  {\LARGE\csname\neoschool@titlestyle\endcsname
		\csname\neoschool@titleweight\endcsname
		\csname\neoschool@titleshape\endcsname
		\color{\neoschool@titlecolor}\@title};

	  \ifx\@subtitle\@empty\else
		\node[below=5mm of \subtitlepos, anchor=\titleanchor]
		{\usekomafont{subtitle}\large\@subtitle};
	  \fi

	  \ifx\@subject\@empty\else
		\node[above=5mm of \subjectpos, anchor=\titleanchor]
		{\usekomafont{subject}\large\@subject};
	  \fi

	\end{tikzpicture}
	\ifx\@subject\@empty
	  \ifx\@subtitle\@empty
		\def\vspaceadjust{-1cm}
	  \else
		\def\vspaceadjust{-0.5cm}
	  \fi
	\else
	  \ifx\@subtitle\@empty
		\def\vspaceadjust{-0.5cm}
	  \else
		\def\vspaceadjust{0cm}
	  \fi
	\fi
	\if@twocolumn\vspace*{\dimexpr1.5in+\oddsidemargin+\vspaceadjust\relax}\par%
	\else\vspace*{\dimexpr1.25in+\oddsidemargin+\vspaceadjust\relax}\par\fi
  }

  \AtBeginDocument{%
	\let\neo@oldmaketitle\maketitle
	\renewcommand{\maketitle}{%
	  \if@twocolumn
		\twocolumn[\neo@titleboxcontent]%
	  \else
		\neo@titleboxcontent
	  \fi
	  \thispagestyle{firstpage}%
	}%
  }
\fi

% Tight Title
\def\stringleft{left}
\def\stringcenter{center}
\def\stringright{right}

\ifneo@tighttitle
  \newcommand{\neo@tighttitlecontent}{%
	\begin{tikzpicture}[remember picture,overlay]
	  \def\titleanchor{west}
	  \def\titlebasepos{current page text area.north west}
	  \def\titlexshift{-1ex}
	  \def\subtitlepos{title.south west}
	  \def\subjectpos{title.north west}
	  \ifx\neoschool@titlealign\stringcenter
		\def\titleanchor{center}
		\def\titlebasepos{current page text area.north}
		\def\titlexshift{0ex}
		\def\subtitlepos{title.south}
		\def\subjectpos{title.north}
	  \fi
	  \ifx\neoschool@titlealign\stringright
		\def\titleanchor{east}
		\def\titlebasepos{current page text area.north east}
		\def\titlexshift{1ex}
		\def\subtitlepos{title.south east}
		\def\subjectpos{title.north east}
	  \fi

	  \ifx\@subject\@empty
		\def\startYshift{\dimexpr-2ex+0.75cm\relax}
	  \else
		\def\startYshift{\dimexpr-5.5ex+0.75cm\relax}
	  \fi

	  \node[anchor=\titleanchor] (title) at
	  ($([xshift=\titlexshift,yshift=\startYshift]\titlebasepos)$)
	  {\LARGE\csname\neoschool@titlestyle\endcsname
		\csname\neoschool@titleweight\endcsname
		\csname\neoschool@titleshape\endcsname
		\color{\neoschool@titlecolor}\@title};

	  \ifx\@subtitle\@empty\else
		\node[below=5mm of \subtitlepos, anchor=\titleanchor] (subtitle)
		{\usekomafont{subtitle}\large\@subtitle};
	  \fi

	  \ifx\@subject\@empty\else
		\node[above=5mm of \subjectpos, anchor=\titleanchor] (subject)
		{\usekomafont{subject}\large\@subject};
	  \fi

	  \coordinate (boxtop) at (title.north);
	  \coordinate (boxbottom) at (title.south);

	  \ifx\@subject\@empty\else
		\coordinate (boxtop) at (subject.north);
	  \fi

	  \ifx\@subtitle\@empty\else
		\coordinate (boxbottom) at (subtitle.south);
	  \fi

	  \node[anchor=\titleanchor] at
	  ($([xshift=\titlexshift,yshift=\startYshift]\titlebasepos)$)
	  {\LARGE\csname\neoschool@titlestyle\endcsname
		\csname\neoschool@titleweight\endcsname
		\csname\neoschool@titleshape\endcsname
		\color{\neoschool@titlecolor}\@title};

	  \ifx\@subtitle\@empty\else
		\node[below=5mm of \subtitlepos, anchor=\titleanchor]
		{\usekomafont{subtitle}\large\@subtitle};
	  \fi

	  \ifx\@subject\@empty\else
		\node[above=5mm of \subjectpos, anchor=\titleanchor]
		{\usekomafont{subject}\large\@subject};
	  \fi

	\end{tikzpicture}

	\ifx\@subject\@empty
	  \ifx\@subtitle\@empty
		\def\vspaceadjust{-1.5cm}
	  \else
		\def\vspaceadjust{-0.75cm}
	  \fi
	\else
	  \ifx\@subtitle\@empty
		\def\vspaceadjust{-0.75cm}
	  \else
		\def\vspaceadjust{0.125cm}
	  \fi
	\fi
	\if@twocolumn\vspace*{\dimexpr1.25in+\oddsidemargin+\vspaceadjust\relax}\par%
	\else\vspace*{\dimexpr0.95in+\oddsidemargin+\vspaceadjust\relax}\par\fi
  }
  \AtBeginDocument{%
	\let\neo@oldmaketitle\maketitle
	\renewcommand{\maketitle}{%
	  \if@twocolumn
		\twocolumn[\neo@tighttitlecontent]%
	  \else
		\neo@tighttitlecontent
	  \fi
	  \thispagestyle{firstpage}%
	}%
  }
\fi

\newcommand{\neo@handleonlytitle}[2]{%
  \if@twocolumn
	\AfterEndPreamble{%
	  \twocolumn[{#1\vspace*{.5in}\par}]
	}
  \else
	\AtBeginDocument{%
	  #2\vspace*{0.25in}\par
	}
  \fi
  \let\maketitle\relax
  \thispagestyle{firstpage}
}

% Left-aligned title implementation
\ifneo@onlytitleleft
	\neo@handleonlytitle
	{\begin{neo@titleflushleft}\createonlytitle\end{neo@titleflushleft}}
	{\begin{neo@titleflushleft}\createonlytitle\end{neo@titleflushleft}}
\fi

% Centered title implementation
\ifneo@onlytitle
	\neo@handleonlytitle
	{\begin{neo@titlecenter}\createonlytitle\end{neo@titlecenter}}
	{\begin{neo@titlecenter}\createonlytitle\end{neo@titlecenter}}
\fi

% Right-aligned title implementation
\ifneo@onlytitleright
	\neo@handleonlytitle
	{\begin{neo@titleflushright}\createonlytitle\end{neo@titleflushright}}
	{\begin{neo@titleflushright}\createonlytitle\end{neo@titleflushright}}
\fi

%% ==============================================================================
%% Improved vertical spacing around center, flushleft, flushright
%% ==============================================================================

\newcommand{\neo@body@spacing}{%
	\setlength\topsep{\neo@effective@baseskip}%
	\setlength\partopsep{0pt}%
	\setlength\parskip{0pt}%
}
\renewenvironment{center}{%
	\neo@body@spacing
	\vspace{-\parskip}%
	\oldcenter
}{%
	\oldendcenter
	\vspace{-\topsep}%
}
\renewenvironment{flushright}{%
	\neo@body@spacing
	\vspace{-\parskip}%
	\oldflushright
}{%
	\oldendflushright
	\vspace{-\topsep}
}
\renewenvironment{flushleft}{%
	\neo@body@spacing
	\vspace{-\parskip}%
	\oldflushleft
}{%
	\oldendflushleft
	\vspace{-\topsep}
}

%% ==============================================================================
%% Table of Contents
%% ==============================================================================

\addto\captionsfrench{\renewcommand{\contentsname}{Sommaire}}

\ifneo@monotoc
	\colorlet{tocTitleColor}{\neoschool@globalcolor}
	\colorlet{tocSectionColor}{\neoschool@globalcolor}
	\colorlet{tocSubsectionColor}{\neoschool@globalcolor}
	\colorlet{tocSubsubsectionColor}{\neoschool@globalcolor}
\else
	\colorlet{tocTitleColor}{\neoschool@titlecolor}
	\colorlet{tocSectionColor}{sectionColor}
	\colorlet{tocSubsectionColor}{subsectionColor}
	\colorlet{tocSubsubsectionColor}{subsubsectionColor}
\fi

\AtBeginDocument{
	\addtocontents{toc}{%
		\protect\hypersetup{%
			linktoc=all,%
			hidelinks%
		}%
		\ifneo@compacttoc
			\protect\setlength{\protect\itemsep}{0pt}%
			\protect\setlength{\protect\parskip}{1pt}%
		\fi
	}
}

\DeclareTOCStyleEntry[
	entryformat={\sffamily\bfseries\color{tocSectionColor}},
	pagenumberformat={\sffamily\bfseries\color{tocSectionColor}},
	indent=0em,
	numwidth=2em
]{tocline}{section}

\DeclareTOCStyleEntry[
	entryformat={\sffamily\color{tocSubsectionColor}},
	pagenumberformat={\sffamily\color{tocSubsectionColor}},
	indent=2em,
	numwidth=2.5em
]{tocline}{subsection}

\DeclareTOCStyleEntry[
	entryformat={\sffamily\small\color{tocSubsubsectionColor}},
	pagenumberformat={\sffamily\small\color{tocSubsubsectionColor}},
	indent=4em,
	numwidth=3em
]{tocline}{subsubsection}

\RedeclareSectionCommand[
	tocindent=0em,
	tocnumwidth=2em
]{section}

\RedeclareSectionCommand[
	tocindent=2em,
	tocnumwidth=2.5em
]{subsection}

\RedeclareSectionCommand[
	tocindent=4em,
	tocnumwidth=3em
]{subsubsection}

\ifx\neoschool@titlealign\neo@left
	\renewcommand*\tableofcontents{%
		\section*{\raggedright\contentsname}
		\@starttoc{toc}%
	}
\else\ifx\neoschool@titlealign\neo@right
		\renewcommand*\tableofcontents{%
			\section*{\raggedleft\contentsname}
			\@starttoc{toc}%
		}
	\else
		\renewcommand*\tableofcontents{%
			\section*{\centering\contentsname}
			\@starttoc{toc}%
		}
	\fi
\fi

\ifneo@twocolumntoc
	\renewcommand*\tableofcontents{%
		\ifx\neoschool@titlealign\neo@left
			\section*{\raggedright\contentsname}
		\else\ifx\neoschool@titlealign\neo@right
				\section*{\raggedleft\contentsname}
			\else
				\section*{\centering\contentsname}
			\fi\fi

		\begin{multicols}{2}
			\@starttoc{toc}%
		\end{multicols}
	}
\fi

%% ==============================================================================
%% Abstract formatting
%% ==============================================================================

\if@twocolumn
  \renewenvironment{abstract}{%
	\begin{strip}
	  \def\@tempabstract{DEFAULT}%
	  \ifx\neoschool@abstracttitle\@tempabstract
		\vspace{-4.25em}
		\section*{\abstractname}%
		\quotation
	  \else
		\ifx\neoschool@abstracttitle\@empty
		  \vspace{-2.75em}
		  \quotation
		\else
		  \vspace{-4.25em}
		  \section*{\neoschool@abstracttitle}%
		  \quotation
		\fi
	  \fi}
	{\endquotation\end{strip}}
\else
  \renewenvironment{abstract}{%
	\def\@tempabstract{DEFAULT}%
	\ifx\neoschool@abstracttitle\@tempabstract
	  \vspace{-1.5em}
	  \section*{\abstractname}%
	  \quotation
	\else
	  \ifx\neoschool@abstracttitle\@empty
		\vspace{-0.25em}
		\quotation
	  \else
		\vspace{-1.5em}
		\section*{\neoschool@abstracttitle}%
		\quotation
	  \fi
	\fi
  }{\endquotation}
\fi

%% ==============================================================================
%% Section formatting utilities
%% ==============================================================================

% Style definitions
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

% Utility command for circular number style
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
		\node[shape=circle,draw,inner sep=2pt,line width=1.5pt,baseline=-1.25mm] (char) {#1};}
	\vspace{-2pt}
}

% Check for small caps availability
\newcommand*{\IfSCAvailableTF}{%
	\ifcsname\f@encoding/\f@family/\f@series/sc\endcsname
		\expandafter\@firstoftwo
	\else
		\expandafter\@secondoftwo
	\fi
}

% Apply text style based on options
\newcommand{\applytextstyle}[1]{%
	\ifx\neoschool@sectiontextstyle\neo@textstyle@sc
		\IfSCAvailableTF{\scshape\Large\neo@title@other@style #1}{\MakeUppercase{\large \neo@title@style #1}}%
	\else
		\ifx\neoschool@sectiontextstyle\neo@textstyle@upper
			\MakeUppercase{\large \neo@title@other@style #1}%
		\else
			\neo@title@other@style\Large #1%
		\fi
	\fi
}

% Section number formatting based on style option
\renewcommand{\sectionformat}{%
	\ifx\neoschool@sectionnumstyle\neo@numstyle@circle
		\circled{{\large\neo@title@other@style\thesection}}\enskip%
	\else
		\ifx\neoschool@sectionnumstyle\neo@numstyle@box
			\raisebox{0ex}{%
				\setlength{\fboxrule}{1.5pt}%
				\fcolorbox{\neoschool@headcolor}{white}{%
					\color{\neoschool@headcolor}%
					\csname\neoschool@headstyle\endcsname
					\csname\neoschool@headweight\endcsname
					% \csname\neoschool@headshape\endcsname
					\large\thesection%
				}%
			}\enskip%
		\else
			\ifx\neoschool@sectionnumstyle\neo@numstyle@dash
				\neo@title@style\thesection\enskip\textendash\enskip
			\else
				\neo@title@style\thesection\autodot\enskip
			\fi
		\fi
	\fi
}

% Set section alignment
\newcommand{\setsectionraggedstyle}{%
	\ifx\neoschool@sectionalign\neo@align@right
		\renewcommand*{\raggedsection}{\raggedleft}%
	\else
		\ifx\neoschool@sectionalign\neo@align@left
			\renewcommand*{\raggedsection}{\raggedright}%
		\else
			\renewcommand*{\raggedsection}{\centering}%
		\fi
	\fi
}

% Main section format handler
\renewcommand{\sectionlinesformat}[4]{%
	\Ifstr{#1}{section}{%
		% \vspace*{0.5em}%
		\ifx\neoschool@sectionstyle\neo@style@ornaments
			\sectionformat@ornaments{#3}{#4}%
		\else
			\ifx\neoschool@sectionstyle\neo@style@highlighted
				\sectionformat@highlighted{#3}{#4}%
			\else
				\ifx\neoschool@sectionstyle\neo@style@shaded
					\sectionformat@shaded{#3}{#4}%
				\else
					\ifx\neoschool@sectionstyle\neo@style@shadedline
						\sectionformat@shadedline{#3}{#4}%
					\else
						\ifx\neoschool@sectionstyle\neo@style@normal
							\sectionformat@normal{#2}{#3}{#4}%
						\else
							\sectionformat@other{#3}{#4}%
						\fi
					\fi
				\fi
			\fi
		\fi
		% \vspace*{-0.15em}%
	}{%
		\@hangfrom{\hskip #2#3}{#4}%
	}%
}

% Individual style implementations
\newcommand{\sectionformat@normal}[3]{%
	\setsectionraggedstyle
	\parbox[t]{\linewidth}{%
		\raggedsection
		\@hangfrom{\color{\neoschool@headcolor}#2}{%
			\color{\neoschool@headcolor}%
			\applytextstyle{#3}%
		}%
	}%
	\par\nobreak
}

\newcommand{\sectionformat@ornaments}[2]{%
	\renewcommand*{\raggedsection}{\centering}%
	\raggedsection
	\vspace*{0.5em}%
	\adforn{36}\enskip
	{\color{\neoschool@headcolor}\applytextstyle{#1#2}}%
	\enskip\adforn{36}%
	\par\nobreak
	\vspace*{0.2em}%
}

% Helper commands for TikZ styles
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
      \neoschool@headcolor!120
    \else
      \neoschool@headcolor!20
    \fi
  \else
    \ifx\neoschool@sectionalign\neo@align@right
      \ifnum\pdf@strcmp{#1}{right}=0
        \neoschool@headcolor!120
      \else
        \neoschool@headcolor!20
      \fi
    \else
      \neoschool@headcolor!25
    \fi
  \fi
}

\newcommand{\setsectiontikzmiddle}{%
  \ifx\neoschool@sectionalign\neo@align@left
    \neoschool@headcolor!90
  \else
    \ifx\neoschool@sectionalign\neo@align@right
      \neoschool@headcolor!90
    \else
      \neoschool@headcolor!120
    \fi
  \fi
}

\newcommand{\sectionformat@highlighted}[2]{%
	\noindent\begin{tikzpicture}[baseline]
		\node[
			anchor=base,
			inner sep=3pt,
			outer sep=0pt,
			align=\setsectiontikzalign,
			text width=.985\linewidth,
			text=titleColor,
			line width=0.5pt,
			fill=titleColor!15,
			rounded corners=0pt,
		] (title) {%
			\vspace{-1pt}\hspace*{0.25em}\applytextstyle{#1#2}\hspace*{0.25em}%
			\vspace{3pt}
		};
	\end{tikzpicture}%
	\par\vspace{0.4em}%
}

\newcommand{\sectionformat@shaded}[2]{%
	\noindent\begin{tikzpicture}[baseline]
		\node[
			anchor=base,
			inner sep=3pt,
			outer sep=0pt,
			align=\setsectiontikzalign,
			text width=.985\linewidth,
			text=white,
			line width=0.5pt,
			left color={\setsectiontikzcolor{left}},
			right color={\setsectiontikzcolor{right}},
			middle color={\setsectiontikzmiddle},
			rounded corners=0pt,
		] (title) {%
			\vspace{-1pt}\hspace*{0.25em}\applytextstyle{#1#2}\hspace*{0.25em}%
			\vspace{3pt}
		};
	\end{tikzpicture}%
	\par\vspace{0.4em}%
}

\newcommand{\sectionformat@shadedline}[2]{%
	\noindent
	\begin{tikzpicture}[baseline]
		\node[
			text=\neoschool@headcolor,
			anchor=base,
			inner sep=0pt,
			outer sep=0pt,
			align=\setsectiontikzalign,
			text width=\linewidth
		] (title) {%
			\color{\neoschool@headcolor}%
			\applytextstyle{#1#2}%
		};

		\ifx\neoschool@sectionalign\neo@align@center
			\fill[
				left color=\neoschool@headcolor!20,
				right color=\neoschool@headcolor
			] ([yshift=-0.5em]title.south west) rectangle ++(.33\linewidth,-0.1em);
			\fill[
				left color=\neoschool@headcolor,
				middle color=\neoschool@headcolor!120,
				right color=\neoschool@headcolor
			] ([yshift=-0.5em]title.south west) ++(.33\linewidth,0) rectangle ([yshift=-0.6em]title.south east) ++(-0.33\linewidth,0);
			\fill[
				left color=\neoschool@headcolor,
				right color=\neoschool@headcolor!20
			] ([yshift=-0.5em]title.south east) ++(-0.33\linewidth,0) rectangle ([yshift=-0.6em]title.south east);%
		\else
			\ifx\neoschool@sectionalign\neo@align@left
				\fill[%
					left color=\neoschool@headcolor,
					right color=\neoschool@headcolor!20
				] ([yshift=-0.5em]title.south west) rectangle ([yshift=-0.6em]title.south east);%
			\else
				\fill[%
					left color=\neoschool@headcolor!20,
					right color=\neoschool@headcolor
				] ([yshift=-0.5em]title.south west) rectangle ([yshift=-0.6em]title.south east);%
			\fi
		\fi
	\end{tikzpicture}%
	\par\vspace{0.7em}%
}

\newcommand{\sectionformat@other}[2]{%
	\setsectionraggedstyle
	\ifx\neoschool@sectionstyle\neo@style@underline
		\sectionformat@underline{#1}{#2}%
	\else
		\sectionformat@default{#1}{#2}%
	\fi
}

\newcommand{\sectionformat@underline}[2]{%
	\parbox[t]{\linewidth}{%
		\raggedsection
		{\color{\neoschool@headcolor}\applytextstyle{#1#2}}%
		\par\nobreak
		\kern-.75\ht\strutbox\color{\neoschool@headcolor!30}\rule{\linewidth}{1pt}%
	}%
}

\newcommand{\sectionformat@default}[2]{%
	\raggedsection
	{\color{\neoschool@headcolor}\applytextstyle{#1#2}}%
	\par\nobreak
}

%% ==============================================================================
%% Header and Footer Styles and Setting
%% ==============================================================================

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
	\def\@tempa{#1}%
	\def\@tempb{true}\def\@tempc{false}\def\@tempd{exam}%
	\ifx\@tempa\@tempb
		\def\neo@header@calculator{true}%
	\else
		\ifx\@tempa\@tempc
			\def\neo@header@calculator{false}%
		\else
			\ifx\@tempa\@tempd
				\def\neo@header@calculator{exam}%
			\else
				\PackageError{neoschool}{Invalid calculator value: #1}%
				{Use 'true', 'false' or 'exam'}%
			\fi
		\fi
	\fi
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
	\ifoot{\@date}
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

\ifneo@headrule
	\KOMAoptions{headsepline=.4pt}
\fi
\ifneo@footrule
	\KOMAoptions{footsepline=.4pt}
\fi
\ifneo@headfootrule
	\KOMAoptions{headsepline=.4pt, footsepline=.4pt}
\fi

%% ==============================================================================
%% Evaluation Headers and Special Styles
%% ==============================================================================

%% Dimensions and Basic Configuration
%% ----------------------------------
\newlength{\neo@headerheight}
\setlength{\neo@headerheight}{35mm}

\newlength{\neo@iconsize}
\setlength{\neo@iconsize}{1.5cm}

\newcommand{\neo@vspace@short}{%
	\if@twocolumn
		\vspace{2\baselineskip}%
	\else
		\vspace{0.75\baselineskip}%
	\fi
}

\newcommand{\neo@vspace@eval}{%
	\ifx\@subject\empty
		\ifx\@subtitle\empty
			\if@twocolumn \vspace{4.5\baselineskip}\else \vspace{2.25\baselineskip}\fi
		\else
			\if@twocolumn \vspace{5.5\baselineskip}\else \vspace{3.25\baselineskip}\fi
		\fi
	\else
		\ifx\@subtitle\empty
			\if@twocolumn \vspace{5.5\baselineskip}\else \vspace{3.25\baselineskip}\fi
		\else
			\if@twocolumn \vspace{6\baselineskip}\else \vspace{4\baselineskip}\fi
		\fi
	\fi
}

\newcommand{\neo@vspace@evalicons}{%
	\if@twocolumn
		\vspace{6\baselineskip}%
	\else
		\vspace{4.5\baselineskip}%
	\fi
}

\newcommand{\neo@title@final@gap}{%
	\if@twocolumn
		\vspace{1.5\baselineskip}%
	\else
		\vspace{0.75\baselineskip}%
	\fi
}

\newcommand{\neo@vspace@bubbles}{%
	\if@twocolumn
		\vspace{5.5cm}%
	\else
		\vspace{4cm}%
	\fi
}

\newcommand{\neo@vspace@bottombubbles}{%
	\if@twocolumn
		\vspace{6.5cm}%
	\else
		\vspace{5.25cm}%
	\fi
}

%% Colors Setup
%% ----------------------------------
\newcommand{\neo@setupevalcolors}{%
	\def\neo@evalrulecolor{\neoschool@headfootcolor!25!white}%
}

%% Basic Title Components
%% ----------------------------------

\def\neo@titleblock@yshift{-20mm}

\newcommand{\neo@completetitle}[1][]{%
	% Main title
	\node[
		align=center,
		anchor=center,
		text width=0.75\textwidth,
		#1
	] (title) at ([yshift=\neo@titleblock@yshift]current page.north) {%
		\baselineskip=30pt
		\Large
		\csname\neoschool@titlestyle\endcsname
		\csname\neoschool@titleweight\endcsname
		\csname\neoschool@titleshape\endcsname
		\color{\neoschool@titlecolor}\@title
	};

	% Subject (if provided)
	\ifx\@subject\empty\else
		\node[
			above=1.5mm of title.north,
			anchor=south,
			text width=0.85\textwidth,
			align=center,
		] {%
			\usekomafont{subject}{\normalsize\@subject}
		};
	\fi

	% Subtitle (if provided)
	\ifx\@subtitle\empty\else
		\node[
			below=1.5mm of title.south,
			anchor=north,
			text width=0.85\textwidth,
			align=center,
		] {%
			\usekomafont{subtitle}{\large\@subtitle}
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
            \else \gdef\neo@vspace@grade@before{\vspace{5.5\baselineskip}}\fi
        \else
            \def\neo@grade@title@yshift{-4.25\baselineskip}
            \def\neo@grade@duration@yshift{-7.75\baselineskip}
            \def\neo@grade@name@yshift{-9.25\baselineskip}
            \if@twocolumn \gdef\neo@vspace@grade@before{\vspace{8\baselineskip}}
            \else \gdef\neo@vspace@grade@before{\vspace{7\baselineskip}}\fi
        \fi
    \else
        \ifx\@subtitle\empty
            \def\neo@grade@title@yshift{-5.25\baselineskip}
            \def\neo@grade@duration@yshift{-7.25\baselineskip}
            \def\neo@grade@name@yshift{-8.75\baselineskip}
            \if@twocolumn \gdef\neo@vspace@grade@before{\vspace{7.5\baselineskip}}
            \else \gdef\neo@vspace@grade@before{\vspace{6.5\baselineskip}}\fi
        \else
            \def\neo@grade@title@yshift{-5.25\baselineskip}
            \def\neo@grade@duration@yshift{-8.85\baselineskip}
            \def\neo@grade@name@yshift{-10.35\baselineskip}
            \if@twocolumn \gdef\neo@vspace@grade@before{\vspace{9\baselineskip}}
            \else \gdef\neo@vspace@grade@before{\vspace{8\baselineskip}}\fi
        \fi
    \fi

	\node[
		align=center,
		anchor=center,
		text width=0.85\textwidth,
		#1
	] (title) at ([yshift=\neo@grade@title@yshift]current page.north) {%
		\baselineskip=30pt
		\Large
		\csname\neoschool@titlestyle\endcsname
		\csname\neoschool@titleweight\endcsname
		\csname\neoschool@titleshape\endcsname
		\color{\neoschool@titlecolor}\@title
	};

	\ifx\@subject\empty\else
		\node[
			above=1.5mm of title.north,
			anchor=south,
			text width=0.85\textwidth,
			align=center,
		] {%
			\usekomafont{subject}{\normalsize\@subject}
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
		fill=white,
		text=\neoschool@titlecolor,
		draw=\neoschool@titlecolor,
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
\ifneo@eval
	\newcommand{\neo@evaltitlecontent}{%
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

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@evaltitlecontent]%
			\else
				\neo@evaltitlecontent
			\fi
			\thispagestyle{pagenum}%
		}%
	}
\fi


%% Header with Icons
\ifneo@evalicons
	\newcommand{\neo@evaliconscontent}{%
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

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@evaliconscontent]%
			\else
				\neo@evaliconscontent
			\fi
			\thispagestyle{pagenum}%
		}%
	}
\fi

%% Header with grading strip without Icons
\ifneo@evalgrade
	\newcommand{\neo@evalgradecontent}{%
		\neo@setupevalcolors
		\neo@setupheaderconfig
		\begin{tikzpicture}[remember picture,overlay]
			\neo@completegradetitle
			% Top elements
			\neo@cornernode{west}{\neo@leftcornershift}{\neo@topyshiftgrade}{\neo@header@type}
			\neo@cornernode{east}{-\neo@rightcornershift}{\neo@topyshiftgrade}{\neo@header@level}

			% Bottom elements
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

			% Page number in the center bottom
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

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@evalgradecontent]%
			\else
				\neo@evalgradecontent
			\fi
			\thispagestyle{empty}%
		}%
	}
\fi

%% Header with grading strip with Icons
\ifneo@evaliconsgrade
	\newcommand{\neo@evaliconsgradecontent}{%
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

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@evaliconsgradecontent]%
			\else
				\neo@evaliconsgradecontent
			\fi
			\thispagestyle{pagenum}%
		}%
	}
\fi

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
\ifneo@exam
	\newcommand{\neo@examcontent}{%
		\vspace*{-2cm}%
		\begin{tcolorbox}[%
				enhanced,
				frame hidden,
				colback=white,
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
				\centering
				\neo@header@type
			\end{minipage}\vspace{.75\baselineskip}

			\LARGEhuge\csname\neoschool@titlestyle\endcsname
			\csname\neoschool@titleweight\endcsname
			\csname\neoschool@titleshape\endcsname
			\color{\neoschool@titlecolor}
			\@title\vspace{.65\baselineskip}

			\normalsize\normalfont\color{black}
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

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@examcontent]%
			\else
				\neo@examcontent
			\fi
			\thispagestyle{pagenum}%
		}%
	}
\fi

%% French Exam Headers
%% ----------------------------------
% Common exam title commands
\NewDocumentCommand{\neo@examtitle}{m}{%
	{\color{\neoschool@titlecolor}
			\csname\neoschool@titlestyle\endcsname
			\csname\neoschool@titleweight\endcsname
			\csname\neoschool@titleshape\endcsname
			\LARGE\MakeUppercase{#1}\par}
}

\NewDocumentCommand{\neo@examsubtitle}{m}{%
	{\color{\neoschool@titlecolor!85!black}
			\csname\neoschool@titlestyle\endcsname
			\Large #1\par}
}

\NewDocumentCommand{\neo@examinfo}{m}{%
	{\color{\neoschool@titlecolor!75!black}
			\csname\neoschool@titlestyle\endcsname
			\large #1\par}
}

%% Mock exam style
\ifneo@mockexam
	\newcounter{mockexampages}
	\AtEndDocument{%
		\immediate\write\@auxout{%
			\string\setcounter{mockexampages}{\thepage}%
		}%
	}
	\newcommand{\neo@mockexamcontent}{%
		\vspace*{1cm}%
		\begin{center}
			% Institution info
			{\textsc{\neo@examinfo{\neo@header@school}}}
			\vspace*{1cm}%
			{\textsc{\neo@examinfo{\neo@academytxt{} \neo@header@academy}}}
			\vspace*{\stretch{2.5}}%

			% Title and session
			{\LARGE\bfseries\csname\neoschool@headstyle\endcsname
				\csname\neoschool@headweight\endcsname
				\csname\neoschool@headshape\endcsname
				\neo@examtitle{\neo@header@type}}
			\vspace*{0.8cm}%
			{\color{\neoschool@titlecolor!75!black}\itshape \neo@sessiontxt{} \@date}
			\vspace*{1.5cm}%

			% Subject and level
			{\Large\csname\neoschool@headstyle\endcsname
				\csname\neoschool@headweight\endcsname
				\csname\neoschool@headshape\endcsname
				\neo@examsubtitle{\neo@examoftxt{} \MakeUppercase{\@subject}}}
			\vspace*{1cm}%
			{\neo@examinfo{\neo@header@level}}
			\vspace*{\stretch{2}}%

			% Duration
			{\textit{\neo@durationtxt{} \neo@header@duration}}
			\vspace*{1.2cm}%

			% Instructions
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

			% Page count
			{\color{\neoschool@titlecolor!65!black}%
				\neo@pagestxt{} \arabic{mockexampages}~\neo@pagesfromtxt{} 1/\arabic{mockexampages} \neo@pagestotxt{} \arabic{mockexampages}/\arabic{mockexampages}.}
			\vspace*{1.5cm}%
		\end{center}
		\thispagestyle{pagenum}%
		\clearpage\newpage
	}
	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\onecolumn
				\neo@mockexamcontent
				\twocolumn
			\else
				\neo@mockexamcontent
			\fi
		}%
	}
\fi

\ifneo@shortexam
	\newcommand{\neo@shortexamcontent}{%
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
				\neo@examsubtitle{\neo@examoftxt{} \MakeUppercase{\@subject}}}

			\vspace{3mm}
			{\small \neo@examinfo{\neo@header@level}}

			\vspace{5mm}
			{\small \textit{\neo@durationtxt{} \neo@header@duration}}

			\vspace{5mm}
			\neo@calculator

			\vspace{10mm}
			{\color{\neoschool@headfootcolor}%
				\rule{0.5\linewidth}{0.5pt}}

		\end{center}
		\neo@title@final@gap
	}

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@shortexamcontent]%
			\else
				\neo@shortexamcontent
			\fi
			\thispagestyle{pagenum}%
		}%
	}
\fi

%% Short Eval Header Style
%% ----------------------------------
\newlength{\sideWidth}
\setlength{\sideWidth}{4.5cm}

\ifneo@shorteval
	\newcommand{\neo@shortevalcontent}{%
		\begin{tikzpicture}[remember picture,overlay]
			\draw[line width=\neo@decorativerule, \neoschool@headfootcolor!50!white]
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
					font=\Large
				] at ([yshift=-11mm]current page.north)
			{\color{\neoschool@titlecolor}%
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
			{\neo@header@school\\[1mm]
					\neo@header@level};
		\end{tikzpicture}%
		\neo@vspace@short
	}

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@shortevalcontent]%
			\else
				\neo@shortevalcontent
			\fi
			\thispagestyle{pagenum}%
		}%
	}
\fi


%% Short Title Header Style
%% ----------------------------------
\ifneo@shorttitle
	\newcommand{\neo@shorttitlecontent}{%
		\begin{tikzpicture}[remember picture,overlay]
			\draw[line width=\neo@decorativerule, \neoschool@headfootcolor!50!white]
			([yshift=-21mm]current page.north west) --
			([yshift=-21mm]current page.north east);
			\path let \p1=(current page.east) in node[
					anchor=center,
					align=center,
					text width={\dimexpr\paperwidth-2cm},
					font=\Large
				] at ([yshift=-11mm]current page.north)
			{\color{\neoschool@titlecolor}%
					\csname\neoschool@titlestyle\endcsname%
					\csname\neoschool@titleweight\endcsname%
					\csname\neoschool@titleshape\endcsname%
					\@title};
		\end{tikzpicture}%
		\neo@vspace@short
	}

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn

				\twocolumn[\neo@shorttitlecontent]%
			\else
				\neo@shorttitlecontent
			\fi
			\thispagestyle{pagenum}%
		}%
	}
\fi

%% Short Lesson Header Style
%% ----------------------------------
\ifneo@shortlesson
	\newcommand{\neo@shortlessoncontent}{%
		\begin{tikzpicture}[remember picture,overlay]
			% Line under the header
			\draw[line width=\neo@decorativerule, \neoschool@headfootcolor!50!white]
			([yshift=-21mm]current page.north west) --
			([yshift=-21mm]current page.north east);

			% Left side - Type
			\path let \p1=(current page.east) in node[
					anchor=west,
					align=left,
					text width=\sideWidth,
					font=\small\sffamily,
					text=\neoschool@headfootcolor
				] at ([xshift=0.75cm,yshift=-11mm]current page.north west)
			{\neo@header@type};

			% Center - Title with dynamic width
			\path let \p1=(current page.east) in node[
					anchor=center,
					align=center,
					text width={\dimexpr\paperwidth-2\sideWidth-0.25cm},
					font=\Large
				] at ([yshift=-11mm]current page.north)
			{\color{\neoschool@titlecolor}%
					\csname\neoschool@titlestyle\endcsname%
					\csname\neoschool@titleweight\endcsname%
					\csname\neoschool@titleshape\endcsname%
					\@title};

			% Right side - Level
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

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@shortlessoncontent]%
			\else
				\neo@shortlessoncontent
			\fi
			\thispagestyle{firstpage}%
		}%
	}
\fi

%% Bubbles Header
%% ----------------------------------
\ifneo@bubbles
	\def\neo@bubbles@colbubbles{\neoschool@titlecolor}
	\define@key[neo]{bubbles}{colbubbles}{\def\neo@bubbles@colbubbles{#1}}
	\newcommand{\neo@bubbles@setkeys}{\setkeys[neo]{bubbles}}

	\neo@bubbles@setkeys{%
		colbubbles=\neoschool@titlecolor,
	}

	\newcommand{\neo@drawbubble}[5]{%
		\pgfmathsetmacro{\opacityValue}{#1}
		\ifneo@unicolor
			\colorlet{currentcolor}{\neo@bubbles@colbubbles}
		\else
			\ifcase#2
				\colorlet{currentcolor}{\neoschool@titlecolor}
			\or
				\colorlet{currentcolor}{\neoschool@headcolor}
			\or
				\colorlet{currentcolor}{exerciseColor}
			\or
				\colorlet{currentcolor}{definitionColor}
			\or
				\colorlet{currentcolor}{methodColor}
			\or
				\colorlet{currentcolor}{comprehensionColor}
			\fi
		\fi
		\colorlet{drawcolor}{currentcolor!0}
		\fill[
			color=currentcolor!#3!white,
			draw=drawcolor,
			line width=0.7pt,
			opacity=#4
		] #5;
	}

	\newcommand{\neo@bubblescontent}{%
		\tikzfading[name=fading box, inner color=transparent!25, outer color=transparent!100]
		\begin{tikzpicture}[remember picture,overlay]
			\def\ellipseWidth{18cm}
			\def\ellipseHeight{4.5cm}
			\def\numBubbles{800}
			\coordinate (ellipseCenter) at ([yshift=-3.5cm]current page.north);

			\foreach \i in {1,...,\numBubbles} {%
					\pgfmathsetmacro{\angle}{rnd*360}
					\pgfmathsetmacro{\rawradius}{abs(rnd)}
					\pgfmathsetmacro{\radius}{pow(\rawradius, 0.75)}
					\pgfmathsetmacro{\x}{\radius*\ellipseWidth/2*cos(\angle)}
					\pgfmathsetmacro{\y}{\radius*\ellipseHeight/2*sin(\angle)}

					\pgfmathrandominteger{\sizeGroup}{1}{4}
					\ifnum\sizeGroup=1
						\pgfmathsetmacro{\bubbleRadius}{rand*10 + 3.5}
					\else\ifnum\sizeGroup=2
							\pgfmathsetmacro{\bubbleRadius}{rand*7 + 2}
						\else\ifnum\sizeGroup=3
								\pgfmathsetmacro{\bubbleRadius}{rand*7 + 1.2}
							\else
								\pgfmathsetmacro{\bubbleRadius}{rand*2.5 + 0.6}
							\fi\fi\fi

					\pgfmathsetmacro{\op}{0.15 + 0.15*rand}

					\pgfmathrandominteger{\col}{0}{4}
					\pgfmathrandominteger{\p}{50}{90}
					\neo@drawbubble{\op}{\col}{\p}{\op}
					{([xshift=\x, yshift=\y]ellipseCenter) circle (\bubbleRadius pt)}
				}

			\node[
				anchor=center,
				inner xsep=12cm,
				inner ysep=4cm,
				fill=white,
				fill opacity=1,
				text opacity=1,
				path fading=fading box,
			] at ([yshift=-1mm]ellipseCenter) (backgroundNode) {};

			\node[
				anchor=center,
				align=center,
				text width=0.95\linewidth,
			] at ([yshift=-1mm]ellipseCenter) (titleNode)
			{%
				\csname\neoschool@titlestyle\endcsname%
				\csname\neoschool@titleweight\endcsname%
				\csname\neoschool@titleshape\endcsname%
				\color{\neo@bubbles@colbubbles!95!black}\huge\@title%
			};

			\ifx\@subject\empty\else
				\node[
					above=1mm of titleNode,
					align=center,
					text width=0.95\linewidth,
				] (subjectNode)
				{%
					\usekomafont{subject}{\large\@subject}%
				};
			\fi

			\ifx\@subtitle\empty\else
				\node[
					below=1mm of titleNode,
					align=center,
					text width=0.95\linewidth,
				] (subtitleNode)
				{%
					\usekomafont{subtitle}{\Large\@subtitle}%
				};
			\fi

		\end{tikzpicture}%
		\neo@vspace@bubbles
	}

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@bubblescontent]%
			\else
				\neo@bubblescontent
			\fi
			\thispagestyle{firstpage}%
		}%
	}
\fi

%% Top Bubbles Header
%% ----------------------------------
\ifneo@topbubbles
	\def\neo@bubbles@colbubbles{\neoschool@titlecolor}
	\define@key[neo]{bubbles}{colbubbles}{\def\neo@bubbles@colbubbles{#1}}
	\newcommand{\neo@bubbles@setkeys}{\setkeys[neo]{bubbles}}

	\neo@bubbles@setkeys{%
		colbubbles=\neoschool@titlecolor,
	}

	\newcommand{\neo@drawbubble}[5]{%
		\pgfmathsetmacro{\opacityValue}{#1}
		\ifneo@unicolor
			\colorlet{currentcolor}{\neo@bubbles@colbubbles}
		\else
			\ifcase#2
				\colorlet{currentcolor}{\neoschool@titlecolor}
			\or
				\colorlet{currentcolor}{\neoschool@headcolor}
			\or
				\colorlet{currentcolor}{exerciseColor}
			\or
				\colorlet{currentcolor}{definitionColor}
			\or
				\colorlet{currentcolor}{methodColor}
			\or
				\colorlet{currentcolor}{comprehensionColor}
			\fi
		\fi
		\colorlet{drawcolor}{currentcolor!75}
		\fill[
			color=currentcolor!#3!white,
			draw=drawcolor,
			line width=0.7pt,
			opacity=#4
		] #5;
	}

	\newcommand{\neo@topbubblescontent}{%
		\if@twocolumn
			\ifx\@subject\empty
				\def\neo@topbubbles@title@yshift{-3cm}%
				\ifx\@subtitle\empty
					\def\neo@topbubbles@final@vspace{\vspace{15.5em}}%
				\else
					\def\neo@topbubbles@final@vspace{\vspace{17em}}%
				\fi
			\else
				\def\neo@topbubbles@title@yshift{-3.45cm}%
				\ifx\@subtitle\empty
					\def\neo@topbubbles@final@vspace{\vspace{17em}}%
				\else
					\def\neo@topbubbles@final@vspace{\vspace{18.5em}}%
				\fi
			\fi
		\else
			\ifx\@subject\empty
				\def\neo@topbubbles@title@yshift{-3cm}%
				\ifx\@subtitle\empty
					\def\neo@topbubbles@final@vspace{\vspace{13em}}%
				\else
					\def\neo@topbubbles@final@vspace{\vspace{14.5em}}%
				\fi
			\else
				\def\neo@topbubbles@title@yshift{-3.45cm}%
				\ifx\@subtitle\empty
					\def\neo@topbubbles@final@vspace{\vspace{14.5em}}%
				\else
					\def\neo@topbubbles@final@vspace{\vspace{15em}}%
				\fi
			\fi
		\fi
		\begin{tikzpicture}[remember picture,overlay]
			\def\ellipseWidth{16cm}
			\def\ellipseHeight{3cm}
			\def\numBubbles{500}
			\coordinate (ellipseCenter) at ([yshift=-2.75cm]current page.north);

			\foreach \i in {1,...,\numBubbles} {%
					\pgfmathsetmacro{\angle}{rnd*360}
					\pgfmathsetmacro{\rawradius}{abs(rnd)}
					\pgfmathsetmacro{\radius}{pow(\rawradius, 1.25)}
					\pgfmathsetmacro{\x}{\radius*\ellipseWidth/2.15*cos(\angle)}
					\pgfmathsetmacro{\y}{\radius*\ellipseHeight/2.15*sin(\angle)}

					\pgfmathrandominteger{\sizeGroup}{1}{4}
					\ifnum\sizeGroup=1
						\pgfmathsetmacro{\bubbleRadius}{rand*12 + 3.5}
					\else\ifnum\sizeGroup=2
							\pgfmathsetmacro{\bubbleRadius}{rand*9 + 2}
						\else\ifnum\sizeGroup=3
								\pgfmathsetmacro{\bubbleRadius}{rand*6 + 1.2}
							\else
								\pgfmathsetmacro{\bubbleRadius}{rand*3 + 0.6}
							\fi\fi\fi

					\pgfmathsetmacro{\op}{0.3 + 0.3*rand}

					\pgfmathrandominteger{\col}{0}{4}
					\pgfmathrandominteger{\p}{48}{92}
					\neo@drawbubble{\op}{\col}{\p}{\op}
					{([xshift=\x, yshift=\y]ellipseCenter) circle (\bubbleRadius pt)}
				}

			\node[
				anchor=center,
				align=center,
				text width=0.95\linewidth,
			] at ([yshift=\neo@topbubbles@title@yshift]ellipseCenter) (titleNode)
			{\csname\neoschool@titlestyle\endcsname\csname\neoschool@titleweight\endcsname\csname\neoschool@titleshape\endcsname
				\color{\neo@bubbles@colbubbles}\hugeminus \bfseries \@title};

			\ifx\@subject\empty\else
				\node[
					above=1mm of titleNode,
					align=center,
					text width=0.95\linewidth,
				]
				{\usekomafont{subject}{\@subject}};
			\fi

			\ifx\@subtitle\empty\else
				\node[
					below=1mm of titleNode,
					align=center,
					text width=0.95\linewidth,
				]
				{\usekomafont{subtitle}{\@subtitle}};
			\fi
		\end{tikzpicture}%
		\neo@topbubbles@final@vspace
	}

	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@topbubblescontent]%
			\else
				\neo@topbubblescontent
			\fi
			\thispagestyle{firstpage}%
		}%
	}
\fi

%% Short Bubbles Header
%% ----------------------------------
\ifneo@bottombubbles
	\def\neo@bubbles@colbubbles{\neoschool@titlecolor}
	\define@key[neo]{bubbles}{colbubbles}{\def\neo@bubbles@colbubbles{#1}}
	\newcommand{\neo@bubbles@setkeys}{\setkeys[neo]{bubbles}}
	\neo@bubbles@setkeys{%
		colbubbles=\neoschool@titlecolor,
	}
	\newcommand{\neo@drawbubble}[5]{%
		\pgfmathsetmacro{\opacityValue}{#1}
		\ifneo@unicolor
			\colorlet{currentcolor}{\neo@bubbles@colbubbles}
		\else
			\ifcase#2
				\colorlet{currentcolor}{\neoschool@titlecolor}
			\or
				\colorlet{currentcolor}{\neoschool@headcolor}
			\or
				\colorlet{currentcolor}{exerciseColor}
			\or
				\colorlet{currentcolor}{definitionColor}
			\or
				\colorlet{currentcolor}{methodColor}
			\or
				\colorlet{currentcolor}{comprehensionColor}
			\fi
		\fi
		\colorlet{drawcolor}{currentcolor!75}
		\fill[
			color=currentcolor!#3!white,
			draw=drawcolor,
			line width=0.7pt,
			opacity=#4
		] #5;
	}

	\newcommand{\neo@bottombubblescontent}{%
		\begin{tikzpicture}[remember picture,overlay]
			\def\myheight{4em}
			\def\ellipseWidth{16cm}
			\def\ellipseHeight{3cm}
			\def\numBubbles{500}
			\coordinate (ellipseCenter) at ([yshift=-1.1\neo@headerheight]current page text area.north);
			\foreach \i in {1,...,\numBubbles} {%
					\pgfmathsetmacro{\angle}{rnd*360}
					\pgfmathsetmacro{\rawradius}{abs(rand)}
					\pgfmathsetmacro{\radius}{pow(\rawradius, 1.5)}
					\pgfmathsetmacro{\x}{\radius * \ellipseWidth/2 * cos(\angle)}
					\pgfmathsetmacro{\y}{\radius * \ellipseHeight/2 * sin(\angle)}
					\pgfmathrandominteger{\sizeGroup}{1}{4}
					\ifnum\sizeGroup=1
						\pgfmathsetmacro{\bubbleRadius}{rand*12 + 3.5}
					\else\ifnum\sizeGroup=2
							\pgfmathsetmacro{\bubbleRadius}{rand*9 + 2}
						\else\ifnum\sizeGroup=3
								\pgfmathsetmacro{\bubbleRadius}{rand*6 + 1.2}
							\else
								\pgfmathsetmacro{\bubbleRadius}{rand*3 + 0.6}
							\fi\fi\fi
					\pgfmathsetmacro{\op}{0.3 + 0.3*rand}
					\pgfmathrandominteger{\col}{0}{5}
					\pgfmathrandominteger{\p}{48}{92}
					\neo@drawbubble{\op}{\col}{\p}{\op}
					{([xshift=\x, yshift=\y]ellipseCenter) circle (\bubbleRadius pt)}
				}
			\node[\neoschool@titlecolor,
				text width=0.95\textwidth,
				align=center,
				inner sep=0pt] at
			([yshift={-0.25*\myheight}]current page text area.north) (title) {%
				\hugeminus\csname\neoschool@titlestyle\endcsname
				\csname\neoschool@titleweight\endcsname
				\csname\neoschool@titleshape\endcsname
				\@title
			};
			\ifx\@subject\empty\else
				\node[subjectColor,
					above=3mm of title,
					text width=0.8\textwidth,
					align=center,
					inner sep=0pt] {%
					{\usekomafont{subject}{\@subject}}
				};
			\fi
			\ifx\@subtitle\empty\else
				\node[subtitleColor,
					below=3mm of title,
					text width=0.8\textwidth,
					align=center,
					inner sep=0pt] {%
					{\usekomafont{subtitle}{\@subtitle}}
				};
			\fi
		\end{tikzpicture}%
		\neo@vspace@bottombubbles
	}
	\AtBeginDocument{%
		\let\neo@oldmaketitle\maketitle
		\renewcommand{\maketitle}{%
			\if@twocolumn
				\twocolumn[\neo@bottombubblescontent]%
			\else
				\neo@bottombubblescontent
			\fi
			\thispagestyle{firstpage}%
		}%
	}
\fi

%% ==============================================================================
%% Box Styles and Environment
%% ==============================================================================

%% Common Style Parameters
%% ----------------------------------

%% Mathematical Boxes
%% ----------------------------------
% Standard math box with configurable colors%
\NewDocumentCommand\mathbox{D<>{white}O{definitionColor}}{%
\tcboxmath[%
	colback=#1,
	colframe=#2,
	size=fbox,
	arc=3pt,
	boxrule=\neo@normalrule
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
\newcommand{\emptybox}[2]{%
	\begin{tcolorbox}[%
			enhanced,
			boxrule=\neo@normalrule,
			arc=5pt,
			boxsep=0pt,
			width=#1,
			height=#2,
			colback=emptyboxBgColor,
			frame hidden,
			sharp corners,
			before skip=.5\baselineskip,
			after skip=.5\baselineskip
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
			colback=answerfieldbgColor,
			frame hidden,
			arc=\neoschool@boxarc,
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
			arc=\neoschool@boxarc,
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
\newcommand{\neocolorbox}[2][applicationColor]{%
	\begin{tcolorbox}[%
			enhanced,
			fontupper=\color{\neoschool@globalcolor},
			arc=\neoschool@boxarc,
			boxrule=\neo@normalrule,
			width=\linewidth,
			colback=#1!5!white,
			frame hidden,
			before skip=12pt plus 2pt,
			after skip=18pt plus 2pt
		]
		#2
	\end{tcolorbox}
}

%% Inline Boxes
%% ----------------------------------
\NewDocumentCommand{\inlinebox}{ O{definitionColor} O{white} O{definitionColor} m }{%
	\tcbox[%
		enhanced,
		nobeforeafter,
		tcbox raise base,
		boxrule=\neo@thinrule,
		top=0mm,
		bottom=0mm,
		right=0mm,
		left=0mm,
		arc=1pt,
		boxsep=2pt,
		colback=#1,
		colupper=#2,
		colframe=#3
	]{#4}%
}

%% General Purpose Box Environment
%% ----------------------------------

\newlength{\neo@neobox@vsep}
\setlength{\neo@neobox@vsep}{0.75\baselineskip}
\newlength{\neo@effective@neobox@vsep}
\setlength{\neo@effective@neobox@vsep}{\neo@vspace@factor\neo@neobox@vsep}

\NewDocumentEnvironment{neobox}{ s O{} }{%
	\begin{tcolorbox}[%
			\IfBooleanTF{#1}{frame hidden}{},
			colframe=\neoschool@headcolor,
			colback=\neo@tcbcolback,
			arc=\neoschool@boxarc,
			enhanced,
			breakable,
			boxrule=\neo@normalrule,
			left=0.65em,
			right=0.65em,
			before skip=\neo@effective@neobox@vsep,
			after skip=\neo@effective@neobox@vsep,
			#2
		]
		}{%
	\end{tcolorbox}
}

% Define starred version
\ExplSyntaxOn
\cs_new:cpn {neobox*} {\neobox*}
\cs_new_eq:cN {endneobox*} \endneobox
\ExplSyntaxOff

%% Side-by-Side Box Environment
%% ----------------------------------
% Base colors for example boxes

\ifneo@darktheme
	\newcommand{\neo@sidebysidetop}[1]{#1!20!darkthemegray}
\else
	\newcommand{\neo@sidebysidetop}[1]{#1!10}
\fi

% Environment definition
\newtcolorbox{sidebyside}[1][]{%
	sidebyside,
	enhanced,
	bicolor,
	sharp corners,
	arc=\neoschool@sideboxarc,
	colback=\neo@sidebysidetop{exampleColor},
	colbacklower=backgroundColor,
	colframe=exampleColor,
	colupper=\neoschool@globalcolor,
	collower=\neoschool@globalcolor,
	boxsep=15pt,
	left=0pt,
	right=0pt,
	top=-8pt,
	bottom=-8pt,
	boxrule=\neo@normalrule,
	fonttitle=\sffamily\bfseries,
	lefttitle=-6pt,
	toptitle=-11pt,
	bottomtitle=-11pt,
	before skip=\neo@effective@beforeskip,
	after skip=\neo@effective@afterskip,
	#1
}

%% ==============================================================================
%% Listings Styles and Setting
%% ==============================================================================

\ifneoschool@centeredcode
	\def\neo@codecenter{center}
\else
	\def\neo@codecenter{}
\fi

%% TColorBox Styles
%% ----------------------------------

%% Base Box Parameters
%% ----------------------------------
\tcbset{%
	neo@commonbox/.style={%
			enhanced,
			arc=\neoschool@codeboxarc,
			boxrule=\neo@thinrule,
			left=\neo@code@box@left@padding,
			right=\neo@code@box@right@padding,
			top=\neo@code@box@top@padding,
			bottom=\neo@code@box@bottom@padding,
			toptitle=3pt,
			bottomtitle=3pt,
			fonttitle=\small\neo@title@style,
			coltitle=\neo@codebox@titlecolor,
			before skip=\neo@effective@code@beforeskip,
			after skip=\neo@effective@code@afterskip,
		}
}

%% Box Styles
%% ----------------------------------
\def\neo@notitle{notitle}

\tcbset{%
	box-toptitle/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			enhanced,
			colframe=codeFrame,
			colback=codeBackground,
			colbacktitle=backgroundColor,
			coltitle=codeTitle,
			attach boxed title to top right,
			boxed title style={%
					opacityback=0,
					frame hidden,
					colframe=codeFrame,
					sharp corners
				},
		},
	box-bottomtitle/.style={
			neo@commonbox,
			\neo@getcodeframestyle,
			enhanced,
			colframe=codeFrame,
			colback=codeBackground,
			colbacktitle=backgroundColor,
			coltitle=codeTitle,
			attach boxed title to bottom center,
			boxed title style={%
					opacityback=0,
					frame hidden,
					colframe=codeFrame,
					sharp corners
				},
		},
	box-fancy/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			colback=codeBackground,
			colframe=codeFrame,
			\neo@getcodeshadowstyle,
		},
	box-minimal/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			enhanced,
			breakable,
			skin=bicolor,
			colupper=\neoschool@globalcolor,
			colback=codeBackground,
			colbacktitle=codeBackground,
			colframe=codeFrame,
			coltitle=codeTitle,
			boxrule=0.4pt,
			arc=0pt,
			left=2.5mm,
			lefttitle=2mm,
			finish={
					\draw[codeFrame, line width=3pt]
					(frame.north west) -- (frame.south west);
				},
		},
	box-subtle/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			sharp corners,
			skin=bicolor,
			colback=codeBackground,
			colframe=backgroundColor,
			colbacktitle=codeFrame,
			coltitle=white,
			boxrule=0pt,
			overlay unbroken={%
					\draw[codeFrame, line width=1.5pt] (frame.north west) -- (frame.north east);
				},
			overlay first={%
					\draw[codeFrame, line width=1.5pt] (frame.north west) -- (frame.north east);
				},
			overlay last={%
				}
		},
	box-elegant/.style={%
			neo@commonbox,
			frame hidden,
			boxrule=0pt,
			colback=backgroundColor,
			opacityback=0,
			colframe=backgroundColor,
			colbacktitle=backgroundColor,
			coltitle=codeTitle,
			attach boxed title to top left,
			left=0pt,
			right=0pt,
			top=-5pt,
			bottom=0pt,
			boxed title style={
					top=0pt,
					bottom=6pt,
					left=-3pt,
				},
		},
	box-sober/.style={%
			neo@commonbox,
			frame hidden,
			boxrule=0pt,
			colback=codeBackground,
			colframe=backgroundColor,
			colbacktitle=backgroundColor,
			coltitle=codeTitle,
			attach boxed title to top left,
			left=0pt,
			right=0pt,
			top=0pt,
			bottom=5pt,
			boxed title style={
					top=\neo@elegant@top@title@padding,
					bottom=\neo@elegant@bottom@title@padding,
				},
		},
	box-academic/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			boxrule=0pt,
			colback=backgroundColor,
			opacityback=0,
			colframe=backgroundColor,
			colbacktitle=backgroundColor,
			coltitle=codeTitle,
			attach boxed title to top left,
			boxed title style={
					top=\neo@elegant@top@title@padding,
					bottom=\neo@elegant@bottom@title@padding,
					left=-3pt,
				},
		},
	box-diagonal/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			colback=codeBackground,
			colframe=codeFrame,
			sharp corners=southwest,
			sharp corners=northeast,
		},
	box-bevel/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			colback=codeBackground,
			colframe=codeFrame,
			sharp corners=southeast,
			sharp corners=northwest,
		},
	box-corner/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			colback=codeBackground,
			colframe=codeFrame,
			sharp corners=downhill,
			rounded corners=northeast,
			rounded corners=northwest,
		},
	box-rounded/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			colback=codeBackground,
			colframe=codeFrame,
			rounded corners,
		},
	box-downhill/.style={%
			neo@commonbox,
			\neo@getcodeframestyle,
			colback=codeBackground,
			colframe=codeFrame,
			coltitle=white,
			sharp corners=downhill,
			fontupper=\color{\neoschool@globalcolor},
			attach boxed title to top right={yshift=-\tcboxedtitleheight},
			boxed title style={%
					colback=codeFrame,
					colframe=codeFrame,
					sharp corners=downhill,
					arc=\neoschool@codeboxarc,
					top=1pt,
					bottom=1pt,
					left=2pt,
					right=2pt
				},
		}
}

\def\neo@keywordstyle{\color{codeKeyword}\bfseries}
\def\neo@commentstyle{\color{codeComment}}
\def\neo@stringstyle{\color{codeString}}
\def\neo@emphstyle{\color{codeEmph}\bfseries}

\newcommand{\neo@setcodenumbership}[1]{%
	\def\neo@testval{#1}%
	%
	\ifnum\pdf@strcmp{\neo@testval}{box-minimal}=0
		\ifneo@listings\lstset{numbersep=18pt}\fi
		\ifneo@minted\setminted{numbersep=18pt}\fi
	\else\ifnum\pdf@strcmp{\neo@testval}{box-elegant}=0
			\ifneo@listings\lstset{numbersep=10pt}\fi
			\ifneo@minted\setminted{numbersep=10pt}\fi
		\else
			\ifneo@nocodeframe
				\ifneo@nocodeback
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
		\fi\fi
}

\neo@setcodenumbership{\neoschool@codestyle}

\ifneo@listings

%% Base Listing Style
%% ----------------------------------
\lstdefinestyle{neo@lst@base}{%
basicstyle=\ttfamily\small\color{\neoschool@globalcolor},
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
	keywordstyle=\neo@keywordstyle,
	commentstyle=\neo@commentstyle,
	stringstyle=\neo@stringstyle,
	emphstyle=\neo@emphstyle,
	numberstyle=\tiny\sffamily\color{gray},
	aboveskip=0pt,
	belowskip=0pt,
	frame=none,
	numbers=none,
	backgroundcolor={},
	xleftmargin=-2pt,
	framesep=3pt
}

\ifneo@nocodenum
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

\lstdefinestyle{javascript}{%
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
	language=[latex]TeX,
	texcsstyle=*\bfseries\color{codeKeyword},
	moretexcs = {tableofcontents,index,footnote,sout,part,chapter,subsection,subsubsection,paragraph,maketitle,leqslant,geqslant,varnothing,includegraphics,draw,node,theoremstyle,newtcolorbox,tcbuselibrary,newtcbtheorem,SI,ang,ce,chemfig,norm,abs,deriv,R,N,Z,ProvidesPackage,color,ps,montitre,lstset,lstinline,lstinputlisting,definecolor,textcolor,colorlet,setlength,colorbox,fcolorbox,addplot,pgfplotsset,opadd,opsub,opmul,opdiv,opgcd,metre,second,squared,kelvin,coulomb,volt,per,opprint,legend,tkzDefPoint,tkzInterLL,tkzGetPoint,tkzDrawPolygon,tkzDrawSegments,tkzMarkRightAngles,tkzMarkSegments,tkzLabelPoints,boxed,boldsymbol,boldmath,multirow,addbibresource,printbibliography,bm,dfrac,meter,thead,makecell,euro,cellcolor,rowcolor,columncolor,base,repere,rog,ron,rond,derpart,drv,integrer,nuplet,anuplet,ensemble,E,V,suite,suitar,suitgeo,vect,norme,tr,rank,adj,sgn,im,di,intabfx,integrale,e,moinsinf,plusinf,sisetup,restoregeometry,newgeometry,lefttitle,righttitle,colbacklower,neoheader,neograph,textwithimage,withqrcode,positionobject,splitcontent,grid,customgrid,frenchgrid,notebook,nbminorgrid,nbmajorgrid,xsimsetup,correct,choice,checkbox,tcblower,usetheme,usecolortheme,institute,frame,alert,twocolumntoc,codeinline,codeinput,tdnote,tdmark,boxnote,barre,cg,pp,pg,cd,ds,Oij,Oijk,Ouv,neoline,neocol,vectt,mhl,competencies,vardots,answerframe,answerfield,mrk,mrks,gradingstrip},
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
language=[x86]Assembler,
morekeywords={%
		section, global, extern
	},
morecomment=[l]{;},
morecomment=[l]{\#},
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

%% Environment Definitions
%% ----------------------------------

% Counter for code listings
\newcounter{lstcode}

% Code listing environment
\NewTCBListing[use counter=lstcode]{code}{ O{} m !O{} !O{\neoschool@codestyle} !O{\neoschool@codewidth} }{%
listing only,
enhanced,
breakable,
fontupper=\color{\neoschool@globalcolor},
width=#5\linewidth,
% before skip=1\baselineskip,
% after skip=1\baselineskip,
listing options={%
		style=#2,
		#1
	},
code={%
		\neo@setcodenumbership{#4}
		\IfEqCase{#4}{%
			{}{\tcbset{%
						standard jigsaw,
						opacityback=0,
						opacityframe=0,
						colback=backgroundColor,
						colframe=backgroundColor,
						frame hidden,
						boxrule=0pt,
						left=0pt,
						right=0pt,
						top=0pt,
						bottom=0pt,
						coltitle=\neoschool@titlecolor,
						fonttitle=\small\neo@title@style
					}}
				{box-academic}{\tcbset{box-academic}}
				{box-bevel}{\tcbset{box-bevel}}
				{box-bottomtitle}{\tcbset{box-bottomtitle}}
				{box-corner}{\tcbset{box-corner}}
				{box-diagonal}{\tcbset{box-diagonal}}
				{box-downhill}{\tcbset{box-downhill}}
				{box-elegant}{\tcbset{box-elegant}}
				{box-fancy}{\tcbset{box-fancy}}
				{box-minimal}{\tcbset{box-minimal}}
				{box-rounded}{\tcbset{box-rounded}}
				{box-subtle}{\tcbset{box-subtle}}
				{box-toptitle}{\tcbset{box-toptitle}}
		}[\PackageError{code}{Style not found: #4}{}]
		\ifx\relax#3\relax
			\tcbset{title={}}
		\else
			\tcbset{title={\lstlistingname~\thelstcode~~\textemdash{}~~#3},\neoschool@boxtitle}
		\fi
	},
\neo@codecenter
}

\NewTCBListing{codenonum}{ O{} m !O{} !O{\neoschool@codestyle} !O{\neoschool@codewidth} }{%
listing only,
enhanced,
breakable,
fontupper=\color{\neoschool@globalcolor},
width=#5\linewidth,
% before skip=1.5\baselineskip,
% after skip=1.5\baselineskip,
listing options={
		style=#2,
		#1
	},
code={
		\neo@setcodenumbership{#4}
		\IfEqCase{#4}{
			{}{\tcbset{%
						standard jigsaw,
						opacityback=0,
						opacityframe=0,
						colback=backgroundColor,
						colframe=backgroundColor,
						frame hidden,
						boxrule=0pt,
						left=0pt,
						right=0pt,
						top=0pt,
						bottom=0pt,
						coltitle=\neoschool@titlecolor,
						fonttitle=\small\neo@title@style
					}}
				{box-academic}{\tcbset{box-academic}}
				{box-bevel}{\tcbset{box-bevel}}
				{box-bottomtitle}{\tcbset{box-bottomtitle}}
				{box-corner}{\tcbset{box-corner}}
				{box-diagonal}{\tcbset{box-diagonal}}
				{box-downhill}{\tcbset{box-downhill}}
				{box-elegant}{\tcbset{box-elegant}}
				{box-fancy}{\tcbset{box-fancy}}
				{box-minimal}{\tcbset{box-minimal}}
				{box-rounded}{\tcbset{box-rounded}}
				{box-subtle}{\tcbset{box-subtle}}
				{box-toptitle}{\tcbset{box-toptitle}}
		}[\PackageError{code}{Style not found: #4}{}]
		\ifx\relax#3\relax
			\tcbset{title={}}
		\else
			\tcbset{title={#3},\neoschool@boxtitle}
		\fi
	},
\neo@codecenter
}

\expandafter\let\csname code*\endcsname\codenonum
\expandafter\let\csname endcode*\endcsname\endcodenonum

% Inline code
\newcommand{\codeinline}[2][]{%
	\lstinline[style=#1]{#2}
}

% Language detection
\newcommand{\DetectLanguage}[1]{%
	\filename@parse{#1}
	\ifthenelse{\equal{\filename@ext}{py}}{python}{%
		\ifthenelse{\equal{\filename@ext}{java}}{java}{%
			\ifthenelse{\equal{\filename@ext}{tex}}{latex}{text}
		}
	}
}

% Code input
\NewTCBInputListing{\codeinputnum}{ O{} m m !O{} !O{\neoschool@codestyle} !O{\neoschool@codewidth} }{%
listing only,
boxrule=0pt,
enhanced,
breakable,
fontupper=\color{\neoschool@globalcolor},
width=#6\linewidth,
% before skip=1.5\baselineskip,
% after skip=1.5\baselineskip,
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
			{}{\tcbset{%
						standard jigsaw,
						opacityback=0,
						opacityframe=0,
						colback=backgroundColor,
						colframe=backgroundColor,
						frame hidden,
						boxrule=0pt,
						left=0pt,
						right=0pt,
						top=0pt,
						bottom=0pt,
						coltitle=\neoschool@titlecolor,
						fonttitle=\small\neo@title@style
					}}
				{box-academic}{\tcbset{box-academic}}
				{box-bevel}{\tcbset{box-bevel}}
				{box-bottomtitle}{\tcbset{box-bottomtitle}}
				{box-corner}{\tcbset{box-corner}}
				{box-diagonal}{\tcbset{box-diagonal}}
				{box-downhill}{\tcbset{box-downhill}}
				{box-elegant}{\tcbset{box-elegant}}
				{box-fancy}{\tcbset{box-fancy}}
				{box-minimal}{\tcbset{box-minimal}}
				{box-rounded}{\tcbset{box-rounded}}
				{box-subtle}{\tcbset{box-subtle}}
				{box-toptitle}{\tcbset{box-toptitle}}
		}[\PackageError{code}{Style not found: #5}{}]
		\ifx\relax#4\relax
			\tcbset{title={}}
		\else
			\tcbset{title={\neo@codename~\thelstcode~~\textemdash{}~~#4},\neoschool@boxtitle}
		\fi
	},
\neo@codecenter
}

\NewTCBInputListing{\codeinputnonum}{ O{} m m !O{} !O{\neoschool@codestyle} !O{\neoschool@codewidth} }{
listing only,
boxrule=0pt,
enhanced,
breakable,
fontupper=\color{\neoschool@globalcolor},
width=#6\linewidth,
% before skip=1.5\baselineskip,
% after skip=1.5\baselineskip,
listing file={#3},
listing options={
		style={#2},
		#1
	},
frame hidden,
colback=codeBackground,
code={
		\neo@setcodenumbership{#5}
		\IfEqCase{#5}{
			{}{\tcbset{%
						standard jigsaw,
						opacityback=0,
						opacityframe=0,
						colback=backgroundColor,
						colframe=backgroundColor,
						frame hidden,
						boxrule=0pt,
						left=0pt,
						right=0pt,
						top=0pt,
						bottom=0pt,
						coltitle=\neoschool@titlecolor,
						fonttitle=\small\neo@title@style}}
				{box-academic}{\tcbset{box-academic}}
				{box-bevel}{\tcbset{box-bevel}}
				{box-bottomtitle}{\tcbset{box-bottomtitle}}
				{box-corner}{\tcbset{box-corner}}
				{box-diagonal}{\tcbset{box-diagonal}}
				{box-downhill}{\tcbset{box-downhill}}
				{box-elegant}{\tcbset{box-elegant}}
				{box-fancy}{\tcbset{box-fancy}}
				{box-minimal}{\tcbset{box-minimal}}
				{box-rounded}{\tcbset{box-rounded}}
				{box-subtle}{\tcbset{box-subtle}}
				{box-toptitle}{\tcbset{box-toptitle}}
		}[\PackageError{code}{Style not found: #5}{}]
		\ifx\relax#4\relax
			\tcbset{title={}}
		\else
			\tcbset{title={#4},\neoschool@boxtitle}
		\fi
	},
\neo@codecenter
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
	top=-4pt,
	bottom=-4pt,
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
		\ifneo@nocodenum
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
			\ifneo@nocodenum
				\setminted{
					style=github-dark,
					backgroundcolor=darkthemegray,
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
					backgroundcolor=darkthemegray,
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
			\ifneo@nocodenum
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
	\NewTCBListing[use counter=mintcode]{code}{ O{} m !O{} !O{\neoschool@codestyle} !O{\neoschool@codewidth} }{%
	listing engine=minted,
	minted language=#2,
	listing only,
	enhanced,
	breakable,
	fontupper=\color{\neoschool@globalcolor},
	width=#5\linewidth,
	% before skip=1.5\baselineskip,
	% after skip=1.5\baselineskip,
	minted options={#1},
	code={%
			\neo@setcodenumbership{#4}
			\IfEqCase{#4}{%
				{}{\tcbset{%
							standard jigsaw,
							opacityback=0,
							opacityframe=0,
							colback=backgroundColor,
							colframe=backgroundColor,
							frame hidden,
							boxrule=0pt,
							left=0pt,
							right=0pt,
							top=0pt,
							bottom=0pt,
							coltitle=\neoschool@titlecolor,
							fonttitle=\small\neo@title@style
						}}
					{box-academic}{\tcbset{box-academic}}
					{box-bevel}{\tcbset{box-bevel}}
					{box-bottomtitle}{\tcbset{box-bottomtitle}}
					{box-corner}{\tcbset{box-corner}}
					{box-diagonal}{\tcbset{box-diagonal}}
					{box-downhill}{\tcbset{box-downhill}}
					{box-elegant}{\tcbset{box-elegant}}
					{box-fancy}{\tcbset{box-fancy}}
					{box-minimal}{\tcbset{box-minimal}}
					{box-rounded}{\tcbset{box-rounded}}
					{box-subtle}{\tcbset{box-subtle}}
					{box-toptitle}{\tcbset{box-toptitle}}
			}[\PackageError{code}{Style not found: #4}{}]
			\ifx\relax#3\relax
				\tcbset{title={}}
			\else
				\tcbset{title={\neo@codename~\themintcode~~\textemdash{}~~#3},\neoschool@boxtitle}
			\fi
		},
	\neo@codecenter
	}

	\NewTCBListing{codenonum}{ O{} m !O{} !O{\neoschool@codestyle} !O{\neoschool@codewidth} }{
	listing engine=minted,
	minted language=#2,
	listing only,
	enhanced,
	breakable,
	fontupper=\color{\neoschool@globalcolor},
	width=#5\linewidth,
	% before skip=1.5\baselineskip,
	% after skip=1.5\baselineskip,
	minted options={#1},
	code={%
			\neo@setcodenumbership{#4}
			\IfEqCase{#4}{
				{}{\tcbset{%
							standard jigsaw,
							opacityback=0,
							opacityframe=0,
							colback=backgroundColor,
							colframe=backgroundColor,
							frame hidden,
							boxrule=0pt,
							left=0pt,
							right=0pt,
							top=0pt,
							bottom=0pt,
							coltitle=\neoschool@titlecolor,
							fonttitle=\small\neo@title@style}}
					{box-academic}{\tcbset{box-academic}}
					{box-bevel}{\tcbset{box-bevel}}
					{box-bottomtitle}{\tcbset{box-bottomtitle}}
					{box-corner}{\tcbset{box-corner}}
					{box-diagonal}{\tcbset{box-diagonal}}
					{box-downhill}{\tcbset{box-downhill}}
					{box-elegant}{\tcbset{box-elegant}}
					{box-fancy}{\tcbset{box-fancy}}
					{box-minimal}{\tcbset{box-minimal}}
					{box-rounded}{\tcbset{box-rounded}}
					{box-subtle}{\tcbset{box-subtle}}
					{box-toptitle}{\tcbset{box-toptitle}}
			}[\PackageError{code}{Style not found: #4}{}]
			\ifx\relax#3\relax
				\tcbset{title={}}
			\else
				\tcbset{title={#3}, \neoschool@boxtitle}
			\fi
		},
	\neo@codecenter
	}

	\expandafter\let\csname code*\endcsname\codenonum
	\expandafter\let\csname endcode*\endcsname\endcodenonum

	% Inline code command
	\newcommand{\codeinline}[2][text]{%
		\mintinline[style=vs,fontsize=\small,breaklines,autogobble]{#1}{#2}
	}

	% Code input from file
	\NewTCBInputListing{\codeinputnum}{ O{} m m !O{} !O{\neoschool@codestyle} !O{\neoschool@codewidth} }{%
	listing engine=minted,
	minted language={#2},
	enhanced,
	breakable,
	fontupper=\color{\neoschool@globalcolor},
	width=#6\linewidth,
	% before skip=1.5\baselineskip,
	% after skip=1.5\baselineskip,
	listing file={#3},
	listing only,
	minted options={#1},
	frame hidden,
	colback=codeBackground,
	boxrule=0pt,
	code={%
			\neo@setcodenumbership{#5}
			\IfEqCase{#5}{%
				{}{\tcbset{%
							standard jigsaw,
							opacityback=0,
							opacityframe=0,
							colback=backgroundColor,
							colframe=backgroundColor,
							frame hidden,
							boxrule=0pt,
							left=0pt,
							right=0pt,
							top=0pt,
							bottom=0pt,
							coltitle=\neoschool@titlecolor,
							fonttitle=\small\neo@title@style
						}}
					{box-academic}{\tcbset{box-academic}}
					{box-bevel}{\tcbset{box-bevel}}
					{box-bottomtitle}{\tcbset{box-bottomtitle}}
					{box-corner}{\tcbset{box-corner}}
					{box-diagonal}{\tcbset{box-diagonal}}
					{box-downhill}{\tcbset{box-downhill}}
					{box-elegant}{\tcbset{box-elegant}}
					{box-fancy}{\tcbset{box-fancy}}
					{box-minimal}{\tcbset{box-minimal}}
					{box-rounded}{\tcbset{box-rounded}}
					{box-subtle}{\tcbset{box-subtle}}
					{box-toptitle}{\tcbset{box-toptitle}}
			}[\PackageError{code}{Style not found: #5}{}]
			\ifx\relax#4\relax
				\tcbset{title={}}
			\else
				\tcbset{title={\neo@codename~\themintcode~~\textemdash{}~~#4},\neoschool@boxtitle}
			\fi
		},
	\neo@codecenter
	}

	\NewTCBInputListing{\codeinputnonum}{ O{} m m !O{} !O{\neoschool@codestyle} !O{\neoschool@codewidth} }{
	listing engine=minted,
	minted language={#2},
	enhanced,
	breakable,
	fontupper=\color{\neoschool@globalcolor},
	width=#5\linewidth,
	% before skip=1.5\baselineskip,
	% after skip=1.5\baselineskip,
	listing file={#3},
	listing only,
	minted options={#1},
	frame hidden,
	colback=codeBackground,
	boxrule=0pt,
	code={%
			\neo@setcodenumbership{#5}
			\IfEqCase{#5}{
				{}{\tcbset{%
							standard jigsaw,
							opacityback=0,
							opacityframe=0,
							colback=backgroundColor,
							colframe=backgroundColor,
							frame hidden,
							boxrule=0pt,
							left=0pt,
							right=0pt,
							top=0pt,
							bottom=0pt,
							coltitle=\neoschool@titlecolor,
							fonttitle=\small\neo@title@style}}
					{box-academic}{\tcbset{box-academic}}
					{box-bevel}{\tcbset{box-bevel}}
					{box-bottomtitle}{\tcbset{box-bottomtitle}}
					{box-corner}{\tcbset{box-corner}}
					{box-diagonal}{\tcbset{box-diagonal}}
					{box-downhill}{\tcbset{box-downhill}}
					{box-elegant}{\tcbset{box-elegant}}
					{box-fancy}{\tcbset{box-fancy}}
					{box-minimal}{\tcbset{box-minimal}}
					{box-rounded}{\tcbset{box-rounded}}
					{box-subtle}{\tcbset{box-subtle}}
					{box-toptitle}{\tcbset{box-toptitle}}
			}[\PackageError{code}{Style not found: #5}{}]
			\ifx\relax#4\relax
				\tcbset{title={}}
			\else
				\tcbset{title={#4}, \neoschool@boxtitle}
			\fi
		},
	\neo@codecenter
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
			\neoschool@codestyle,
			enhanced,
			breakable,
			before upper={\begin{algorithmic}},
						after upper={\end{algorithmic}},
			fonttitle=\sffamily\small\bfseries,
			before skip=\neo@effective@beforeskip,
			after skip=\neo@effective@afterskip,
		}
}

\newcounter{pseudocode}
\newtcolorbox[use counter=pseudocode]{pseudocode}[2][]{%
	pseudocode,
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
			separator sign={},
			before skip=\baselineskip,
			after skip=\baselineskip,
			colupper=\neo@tcbcolupper,
			colframe=\neoschool@headcolor,
			colbacklower=\neo@tcbcolbacklower
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
	{\,}
	{\tl_use:N \enskip(\l__custom_tcb_title_tl)\;}
}

\newcommand{\getCustomBoxedTitle}{%
	\tl_if_empty:NTF \l__custom_tcb_title_tl
	{}
	{\tl_use:N \,(\l__custom_tcb_title_tl)\,}
}
\ExplSyntaxOff

\def\neo@getbackcolor{%
	\neo@tcbcolback%
}

\def\neo@getcodeframestyle{%
	\ifneo@nocodeframe
		frame hidden%
	\else\fi
}

\def\neo@getcodeshadowstyle{%
	\ifneo@nocodeframe
	\else
		drop fuzzy shadow%
	\fi
}

\def\neo@getframestyle{%
	\ifneo@nothmframe
		frame hidden%
	\else\fi
}

\ifneo@noexback
  \tcbset{neo@exbackstyle/.style={colback=backgroundColor} }
\else
  \tcbset{ neo@exbackstyle/.style={colback=\neo@getbackcolor} }
\fi

\tcbset{
	neo@shared@base/.style args={#1}{%
			common@base,
			colframe=#1,
      neo@exbackstyle,
			colupper=\neoschool@globalcolor,
			boxrule=\neo@thmborder,
			arc=\neoschool@thmboxarc,
			\neo@getframestyle,
			parbox=false,
		},
	neo@shared@elegant/.style args={#1}{%
			neo@shared@base={#1},
			common@title@base,
			skin=bicolor,
			detach title,
			left=1em,
			right=1em,
			after skip=\neo@effective@afterskip,
			before skip=\neo@effective@beforeskip,
			top=\neo@toppadding,
			bottom=\neo@bottompadding,
			borderline west={4pt}{0pt}{#1},
			before upper={\tcbtitle\enskip}
		},
	neo@shared@shaded/.style 2 args={%
			neo@shared@base={#1},
			common@title@base,
			arc=3pt,
			left=\neo@leftpadding,
			right=\neo@rightpadding,
			after skip=\neo@effective@afterskip,
			before skip=\baselineskip,
			attach boxed title to top left,
			boxed title style={
					empty,
					top=\neo@titletoppadding,
					left=\neo@titleleftpadding,
					right=\neo@titlerightpadding,
					bottom=\neo@titlebottompadding,
				},
			detach title,
			underlay boxed title={%
					\path[draw=\csname neo@titledrawcolor@#2\endcsname,line width=\neo@thmborder,
						rounded corners, fill=\neo@tcbcolback]
					([xshift=.17mm]frame.west) |- ([xshift=-2.5mm]title.north east)
					to[out=0, in=180] ([xshift=7.5mm, yshift=-.18mm]title.south east);
				}
		},
	neo@shared@slanted/.style args={#1}{%
			neo@shared@base={#1},
			common@title@base,
			skin=bicolor,
			separator sign={},
			coltitle=white,
			left=\neo@leftpadding,
			right=\neo@rightpadding,
			after skip=\neo@effective@afterskip,
			before skip=\neo@effective@beforeskip,
			detach title
		},
	neo@shared@sober/.style args={#1}{%
			neo@shared@base={#1},
			common@title@base,
			skin=bicolor,
			detach title,
			left=\neo@leftpadding,
			right=\neo@rightpadding,
			after skip=\neo@effective@afterskip,
			before skip=\neo@effective@beforeskip,
			separator sign={},
			terminator sign=,
		},
	neo@shared@classic/.style args={#1}{%
			neo@shared@base={#1},
			common@title@base,
			skin=bicolor,
			coltitle=white,
			colbacktitle=tcbcolframe,
			boxrule=\neo@normalrule,
			left=1ex,
			right=1ex,
			after skip=\neo@effective@afterskip,
			before skip=\neo@effective@beforeskip,
		},
	neo@shared@classy/.style args={#1}{%
			neo@shared@base={#1},
			common@title@base,
			skin=bicolor,
			left=1ex,
			right=1ex,
			after skip=\neo@effective@afterskip,
			before skip=\neo@effective@beforeskip,
			attach boxed title to top left={
					yshift*=-\tcboxedtitleheight
				},
			boxed title style={
					sharp corners,
					rounded corners=northwest,
					colback=tcbcolframe,
					boxrule=0pt
				},
			underlay boxed title={
					\path[fill=tcbcolframe]
					(title.south west)--(title.south east)
					to[out=0, in=180] ([xshift=5mm]title.east)--
					(title.center-|frame.east)
					[rounded corners=\kvtcb@arc] |-
					(frame.north) -| cycle;
				}
		},
	neo@shared@boxed/.style 2 args={%
			neo@box@base,
			sharp corners,
			\neo@framehidden,
			coltitle=white,
			colframe=#1,
			colback=\neo@tcbcolback,
			left=\neo@leftpadding,
			right=\neo@rightpadding,
			detach title,
			before upper*={%
					\tcbox[enhanced,
						colupper=white,
						colback=#1,
						fontupper=\normalshape\neo@title@style,
						size=small,
						baseline=3pt,
						top=0pt,
						bottom=0pt,
						left=0pt,
						right=0pt,
						nobeforeafter,
						frame code={%
								\path[fill=tcbcolback]
								(frame.north west) --
								(frame.north east) {[rounded corners=5pt]--
									(frame.south east)} --
								(frame.south west) --
								cycle;
							}]%
					{#2~\thetcbcounter}%
				}
				{\normalshape\neo@title@style\color{#1}\getCustomBoxedTitle}
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
	colback .code:n = \tl_put_right:Nx \l__custom_tcb_options_tl { colback=#1, },
	colframe .code:n = \tl_put_right:Nx \l__custom_tcb_options_tl { colframe=#1, },
	coltitle .code:n = \tl_put_right:Nx \l__custom_tcb_options_tl { coltitle=#1, },
	fonttitle .code:n = \tl_put_right:Nx \l__custom_tcb_options_tl { fonttitle=#1, },
	line~width .code:n = \tl_put_right:Nx \l__custom_tcb_options_tl { line~width=#1, },
	frame~style .code:n = \tl_put_right:Nx \l__custom_tcb_options_tl { frame~style=#1, },
	arc .code:n = \tl_put_right:Nx \l__custom_tcb_options_tl { arc=#1, },
	frame~hidden .code:n = \tl_put_right:Nn \l__custom_tcb_options_tl { frame~hidden, },
	sharp~corners .code:n = \tl_put_right:Nn \l__custom_tcb_options_tl { sharp~corners, },
	rounded~corners .code:n = \tl_put_right:Nn \l__custom_tcb_options_tl { rounded~corners, },
	unknown .code:n = \tl_put_right:Nx \l__custom_tcb_options_tl { #1, },
}
\ExplSyntaxOff

%% ==============================================================================
%% Theorem Types Implementation
%% ==============================================================================

\NewDocumentCommand{\neweleganttheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
	neo@shared@elegant={#4},
	coltitle=#4,
	fontupper={#7},
	before lower={#6},
	#8
}{#5}
}

\NewDocumentCommand{\newslantedtheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
	neo@shared@slanted={#4},
	before upper*={%
			\hspace*{-1.5mm}
			\tcbox[enhanced,
				colupper=white,
				colback=#4,
				fontupper=\normalshape\neo@title@style,
				size=small,
				baseline=3pt,
				left=0pt,
				right=0pt,
				bottom=0pt,
				nobeforeafter,
				frame code={%
						\path[fill=tcbcolback] (frame.north west)
						-- ([xshift=2mm]frame.north east)
						-- (frame.south east)
						-- (frame.south west)
						-- (frame.north west)
						[sharp corners]-- cycle;
					}]
			{#3~\thetcbcounter}
			{\normalshape\neo@title@style\color{#4}\getCustomSlantedTitle}
		},
	fontupper={#7},
	before lower={#6},
	#8,
}{#5}
}

\NewDocumentCommand{\newshadedtheorem}{O{}mmmmmmO{}}{%
\expandafter\def\csname neo@titledrawcolor@#2\endcsname{#4}
\ifneo@nothmframe\expandafter\def\csname neo@titledrawcolor@#2\endcsname{backgroundColor}\fi
\mynewtcbtheorem[#1]{#2}{\vspace*{0.35em}#3}{%
	neo@shared@shaded={#4}{#2},
	coltitle=#4,
	fontupper={#7},
	before lower={#6},
	#8
}{#5}
}

\NewDocumentCommand{\newsobertheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
	neo@shared@sober={#4},
	before upper={\tcbtitle\enskip},
	coltitle=#4,
	fontupper={#7},
	before lower={#6},
	#8
}{#5}
}

\NewDocumentCommand{\newclassictheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
	neo@shared@classic={#4},
	title={#3},
	fontupper={#7},
	before lower={#6},
	#8
}{#5}
}

\NewDocumentCommand{\newclassytheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
	neo@shared@classy={#4},
	title={#3},
	fontupper={#7},
	before lower={#6},
	#8
}{#5}
}

\NewDocumentCommand{\newboxedtheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
	neo@shared@boxed={#4}{#3},
	fontupper={#7},
	before lower={#6},
	#8
}{#5}
}

\NewDocumentCommand{\newamstheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
	enhanced,
	breakable,
	frame hidden,
	opacityback=0,
	colback=backgroundColor,
	coltitle={#4},
	left=0pt, right=0pt,
	top=0pt, bottom=0pt,
	boxsep=0pt,
	detach title,
	separator sign={},
	before upper={\tcbtitle\enskip},
	before skip=\neo@effective@baseskip,
	after skip=\neo@effective@baseskip,,
	fontupper={#7},
	fonttitle={\normalshape\neo@title@style},
	before lower={#6},
	#8
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
	left=0pt, right=0pt,
	top=0pt, bottom=0pt,
	boxsep=0pt,
	detach title,
	before upper={{\color{remarkColor}\csname\neoschool@headweight\endcsname\itshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname #3\enskip\textemdash}\enskip},
	before skip=\neo@effective@baseskip,
	after skip=\neo@effective@baseskip,,
	fontupper={#7},
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
	left=0pt, right=0pt,
	top=0pt, bottom=0pt,
	boxsep=0pt,
	detach title,
	before upper={{\color{remarkColor}\csname\neoschool@headweight\endcsname\itshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname #3}\enskip},
	before skip=\neo@effective@baseskip,
	after skip=\neo@effective@baseskip,,
	fontupper={#7},
	#8
}{#5}
}

\NewDocumentCommand{\newamsexampletheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
	enhanced,
	breakable,
	frame hidden,
	opacityback=0,
	colback=backgroundColor,
	colupper=\neoschool@globalcolor,
	coltitle={#4},
	left=0pt, right=0pt,
	top=0pt, bottom=0pt,
	boxsep=0pt,
	detach title,
	separator sign={},
	before upper={\tcbtitle\enskip},
	before skip=\neo@effective@baseskip,
	after skip=\neo@effective@baseskip,,
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
	opacityback=0,
	colback=backgroundColor,
	colupper=\neoschool@globalcolor,
	coltitle={#4},
	left=0pt, right=0pt,
	top=0pt, bottom=0pt,
	boxsep=0pt,
	detach title,
	before upper={{\color{exampleColor}\neo@title@style #3}\enskip},
	before skip=\neo@effective@baseskip,
	after skip=\neo@effective@baseskip,,
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

%% ==============================================================================
%% Theorem Declaration Command
%% ==============================================================================

\NewDocumentCommand{\neo@declaretheorem}{O{}mmmmmmO{}}{%
% #1 = additional options
% #2 = environment name (theorem, definition, etc.)
% #3 = title (\neo@theoremname, etc.)
% #4 = color
% #5 = reference name (thm, def, etc.)
% #6 = text before proof
% #7 = text style (\itshape or not)
% #8 = additional options

% Handle options
\def\neo@thmoptions{#1}

% Section numbering
\ifneoschool@sectionthmcounter
	\edef\neo@thmoptions{number within=section,\neo@thmoptions}
\fi

% Counter handling
\ifneoschool@sharedthmcounter
	\edef\neo@thmoptions{use counter=thmcounter,\neo@thmoptions}
\else
	\ifneoschool@thmgroupcounter
		\ifboolexpr{
			test {\ifstrequal{#2}{theorem}} or
			test {\ifstrequal{#2}{lemma}} or
			test {\ifstrequal{#2}{proposition}} or
			test {\ifstrequal{#2}{corollary}} or
			test {\ifstrequal{#2}{property}}
		}{%
			\edef\neo@thmoptions{use counter=thmcounter,\neo@thmoptions}
		}{%
			\edef\neo@thmoptions{\neo@thmoptions}
		}
	\else
		\edef\neo@thmoptions{\neo@thmoptions}
	\fi
\fi

% Style selection based on class options
\ifneo@slantedthm
	\expandafter\newslantedtheorem\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
\else
	\ifneo@soberthm
		\expandafter\newsobertheorem\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
	\else
		\ifneo@elegantthm
			\expandafter\neweleganttheorem\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
		\else
			\ifneo@shadedthm
				\expandafter\newshadedtheorem\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
			\else
				\ifneo@classicthm
					\expandafter\newclassictheorem\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
				\else
					\ifneo@classythm
						\expandafter\newclassytheorem\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
					\else
						\ifneo@boxedthm
							\expandafter\newboxedtheorem\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
						\else
							\ifneo@amslikethm
								\expandafter\newamstheorem\expandafter[\neo@thmoptions]{#2}{#3}{#4}{#5}{#6}{#7}[#8]%
							\fi
						\fi
					\fi
				\fi
			\fi
		\fi
	\fi
\fi
}

%% ==============================================================================
%% Theorem Environment Declarations
%% ==============================================================================

\newcounter{thmcounter}

% Standard theorems
\neo@declaretheorem{theorem}{\neo@theoremname}{theoremColor}{thm}{}{\itshape\color{\neoschool@globalcolor}}
\neo@declaretheorem{definition}{\neo@definitionname}{definitionColor}{def}{}{\color{\neoschool@globalcolor}}
\neo@declaretheorem{lemma}{\neo@lemmaname}{lemmaColor}{lem}{}{\itshape\color{\neoschool@globalcolor}}
\neo@declaretheorem{proposition}{\neo@propositionname}{propositionColor}{propo}{}{\itshape\color{\neoschool@globalcolor}}
\neo@declaretheorem{corollary}{\neo@corollaryname}{corollaryColor}{cor}{}{\itshape\color{\neoschool@globalcolor}}
\neo@declaretheorem{conjecture}{\neo@conjecturename}{remarkColor}{conj}{}{\itshape\color{\neoschool@globalcolor}}
\neo@declaretheorem{property}{\neo@propertyname}{propertyColor}{prop}{}{\itshape\color{\neoschool@globalcolor}}

% Activity-related theorems
\neo@declaretheorem{activity}{\neo@activityname}{activityColor}{act}{}{\color{\neoschool@globalcolor}}
\neo@declaretheorem{method}{\neo@methodname}{methodColor}{meth}{}{\color{\neoschool@globalcolor}}
\neo@declaretheorem{application}{\neo@applicationname}{applicationColor}{appl}{}{\color{\neoschool@globalcolor}}

% Proof Environment
\ifneo@amslikethm
	\newenvironment{proof}[1][\neo@proofname]{%
		\par\noindent{\itshape #1.}\enskip%
	}{%
		\unskip\nobreak\hfill\makebox[0pt][l]{\hspace{0.5em}$\square$}\par\vspace{0.25\baselineskip plus 1pt}%
	}
\else
	\newenvironment{proof}[1][\neo@proofname]{%
		\par\noindent{\itshape\color{\neoschool@headcolor}\bfseries #1.}\enskip%
	}{%
		\unskip\nobreak\hfill\makebox[0pt][l]{{\hspace{0.5em}\color{\neoschool@headcolor}$\blacksquare$}}\par\vspace{0.5\baselineskip}%
	}
\fi

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
			colupper=\neo@tcbcolupper,
			colframe=\neoschool@headcolor,
			colbacklower=\neo@tcbcolbacklower
		},
}

%% Box Appearance Styles
\tcbset{%
	% Basic box style
	neo@box@base/.style={%
    enhanced,
    breakable,
    fontupper=\color{\neoschool@globalcolor},
    colupper=\neo@tcbcolupper,
    colframe=\neoschool@headcolor,
    colbacklower=\neo@tcbcolbacklower,
    after skip=\neo@effective@afterskip,
    before skip=\neo@effective@beforeskip,
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
    coltitle=white,
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
    colframe=exerciseColor!12,
    colback=white
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
			arc=\neoschool@boxarc
		}
}

%% Background Styles
\tcbset{%
	% Light background
	neo@bg@light/.style={%
			colback=white,
			colbacktitle=exerciseColor!12
		},
	% Shaded background
	neo@bg@shaded/.style={%
			colback=exerciseColor!5!white,
			colbacktitle=exerciseColor!12
		},
	% Gradient background
	neo@bg@gradient/.style={%
			interior style={%
					top color=white,
					bottom color=exerciseColor!5!white
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
			colback=white,
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
%% Basic Exercise Box Templates
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

% Elegant Box Template
\DeclareExerciseEnvironmentTemplate{elegant-box}{%
	\begin{tcolorbox}[
			neo@shared@elegant={exerciseColor},
			title={%
					\csname\neoschool@headstyle\endcsname
					\csname\neoschool@headweight\endcsname
					\color{exerciseColor}
					{\small\neo@exerciseicon}%
					\XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}\enskip$\cdot$\enskip%
					\IfExercisePropertySetT{level}{%
						\neoexerciserating\enskip$\cdot$\enskip%
					}%
					\IfExercisePropertySetT{subtitle}{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip$\cdot$\enskip}%
					\IfExercisePropertySetT{points}{(%
						\GetExerciseProperty{points}~%
						\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point})}{\XSIMtranslate{points})}%
					}%
				}
		]
		}{\end{tcolorbox}}

% Shaded Box Template
\DeclareExerciseEnvironmentTemplate{shaded-box}{%
	\expandafter\def\csname neo@titledrawcolor@exercise\endcsname{exerciseColor}
	\ifneo@nothmframe
		\expandafter\def\csname neo@titledrawcolor@exercise\endcsname{backgroundColor}
	\fi
	\begin{tcolorbox}[
			neo@shared@shaded={exerciseColor}{exercise},
			left=0.65em,
			right=0.65em,
			coltitle=exerciseColor,
			title={%
					\vspace*{0.35em}%
					\neo@title@style\color{exerciseColor}%
					{\small\neo@exerciseicon}%
					\XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
					\IfExercisePropertySetT{level}{%
						\enskip$\cdot$\enskip\neoexerciserating\enskip$\cdot$\enskip%
					}%
					\IfExercisePropertySetT{subtitle}{\enskip$\cdot$\enskip\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}%
					\IfExercisePropertySetT{points}{\enskip$\cdot$\enskip(%
						\GetExerciseProperty{points}~%
						\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point})}{\XSIMtranslate{points})}%
					}%
				}
		]
		}{\end{tcolorbox}}

% Slanted Box Template
\DeclareExerciseEnvironmentTemplate{slanted-box}{%
	\begin{tcolorbox}[
			neo@shared@slanted={exerciseColor},
			before upper*={%
					\hspace*{-1.5mm}
					\tcbox[enhanced,
						colupper=white,
						colback=exerciseColor,
						fontupper=\upshape\bfseries,
						size=small,
						baseline=3pt,
						after skip=1em,
						top=0pt,
						left=0pt,
						right=0pt,
						bottom=0pt,
						nobeforeafter,
						frame code={%
								\path[fill=tcbcolback] (frame.north west)
								-- ([xshift=2mm]frame.north east)
								-- (frame.south east)
								-- (frame.south west)
								-- (frame.north west)
								[sharp corners]-- cycle;
							}
					]{\neo@title@other@style\csname\neoschool@headshape\endcsname
						{\small\neo@exerciseicon}%
						\XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
					}
				}
		]%
		{\neo@title@other@style\csname\neoschool@headshape\endcsname
			\color{exerciseColor}%
			\enskip%
			\IfExercisePropertySetT{level}{%
				\neoexerciserating\enskip%
			}%
			\IfExercisePropertySetT{subtitle}{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip}%
			\IfExercisePropertySetT{points}{%
				(\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point}}{\XSIMtranslate{points}})%
			}%
		}\enskip%
		}{\end{tcolorbox}}

% Sober Box Template
\DeclareExerciseEnvironmentTemplate{sober-box}{%
	\begin{tcolorbox}[
			neo@shared@sober={exerciseColor},
			before upper={\tcbtitle\enskip},
			coltitle=exerciseColor,
			title={%
					\csname\neoschool@headstyle\endcsname
					\csname\neoschool@headweight\endcsname
					{\small\neo@exerciseicon}%
					\XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}\enskip$\cdot$\enskip%
					\IfExercisePropertySetT{level}{%
						\neoexerciserating\enskip$\cdot$\enskip%
					}%
					\IfExercisePropertySetT{subtitle}{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip$\cdot$\enskip}%
					\IfExercisePropertySetT{points}{%
						(\GetExerciseProperty{points}~%
						\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point}}{\XSIMtranslate{points}})%
					}%
				}
		]
		}{\end{tcolorbox}}

% Classic Box Template
\DeclareExerciseEnvironmentTemplate{classic-box}{%
	\begin{tcolorbox}[
			neo@shared@classic={exerciseColor},
			righttitle=-5pt,
			title={%
					\csname\neoschool@headstyle\endcsname
					\csname\neoschool@headweight\endcsname
					\color{white}
					{\small\neo@exerciseicon}%
					\XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
					\IfExercisePropertySetT{level}{%
						\enskip$\cdot$\enskip\neoexerciserating%
					}%
					\IfExercisePropertySetT{subtitle}{\enskip$\cdot$\enskip\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}%
					\hfill
					\IfExercisePropertySetT{points}{%
						\GetExerciseProperty{points}~%
						\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point}}{\XSIMtranslate{points}}%
					}%
				}%
		]%
		}{\end{tcolorbox}}

% Classy Box Template
\DeclareExerciseEnvironmentTemplate{classy-box}{%
	\begin{tcolorbox}[
			neo@shared@classy={exerciseColor},
			title={%
					\csname\neoschool@headstyle\endcsname
					\csname\neoschool@headweight\endcsname
					\color{white}
					{\small\neo@exerciseicon}%
					\XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
					\IfExercisePropertySetT{level}{%
						\enskip$\cdot$\enskip\neoexerciserating%
					}%
					\IfExercisePropertySetT{subtitle}{\enskip$\cdot$\enskip\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip$\cdot$\enskip}%
					\IfExercisePropertySetT{points}{%
						\enskip$\cdot$\enskip(\GetExerciseProperty{points}~%
						\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point}}{\XSIMtranslate{points}})%
					}%
				}
		]
		}{\end{tcolorbox}}

% Rect and Num box Templates
\DeclareExerciseEnvironmentTemplate{rect-box}{%
	\begin{tcolorbox}[
			enhanced,
			breakable,
			parbox=false,
			skin=bicolor,
			sharp corners,
			\neo@framehidden,
			colframe=exerciseColor,
      neo@exbackstyle,
			colupper=\neoschool@globalcolor,
			coltitle=white,
			fonttitle=\csname\neoschool@headweight\endcsname,
			left=\neo@leftpadding,
			right=\neo@rightpadding,
			after skip=\neo@effective@afterskip,
			before skip=\neo@effective@beforeskip,
			top=4pt,
			bottom=4pt,
			before upper*={%
					\hspace*{-3pt}
					\tcbox[enhanced,
						colupper=white,
						fontupper=\csname\neoschool@headweight\endcsname,
						colback=exerciseColor,
						colframe=exerciseColor,
						boxrule=\neo@thickrule,
						size=small,
						baseline=4pt,
						sharp corners,
						arc=5pt,
						rounded corners=southeast,
						top=0pt,
						bottom=0pt,
						left=0pt,
						right=0pt,
						nobeforeafter,
					]%
					{%
						\csname\neoschool@headstyle\endcsname
						\csname\neoschool@headweight\endcsname
						\csname\neoschool@headshape\endcsname
						{\small\neo@exerciseicon}%
						\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
					}%
				}
		]%
		{
			\neo@title@other@style\csname\neoschool@headshape\endcsname
			\color{exerciseColor}%
			\enskip%
			\IfExercisePropertySetT{level}
			{\neoexerciserating\enskip}%
			\IfExercisePropertySetT{subtitle}{{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip}}%
			\IfExercisePropertySetT{points}{%
				(\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}{point}{points})\;%
			}%
		}
		}{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{rect-box-out}{%
	\begin{tcolorbox}[
			enhanced,
			breakable,
			parbox=false,
			skin=bicolor,
			sharp corners,
			\neo@framehidden,
			colframe=exerciseColor,
      neo@exbackstyle,
			colupper=\neoschool@globalcolor,
			left=\neo@leftpadding,
			right=\neo@rightpadding,
			after skip=\neo@effective@afterskip,
			before skip=\neo@effective@beforeskip,
			top=4pt,
			bottom=4pt,
			before upper*={%
					\hspace*{-3pt}
					\tcbox[enhanced,
						colupper=exerciseColor,
						fontupper=\csname\neoschool@headweight\endcsname,
						colback=backgroundColor,
						colframe=exerciseColor,
						boxrule=\neo@thickrule,
						size=small,
						baseline=4pt,
						sharp corners,
						arc=5pt,
						rounded corners=southeast,
						top=0pt,
						bottom=0pt,
						left=0pt,
						right=0pt,
						nobeforeafter,
					]%
					{%
						\csname\neoschool@headstyle\endcsname
						\csname\neoschool@headweight\endcsname
						\csname\neoschool@headshape\endcsname
						{\small\neo@exerciseicon}%
						\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
					}%
				}
		]%
		{
			\neo@title@other@style\csname\neoschool@headshape\endcsname
			\color{exerciseColor}%
			\enskip%
			\IfExercisePropertySetT{level}
			{\neoexerciserating\enskip}%
			\IfExercisePropertySetT{subtitle}{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip}%
			\IfExercisePropertySetT{points}{%
				(\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}{point}{points})\;%
			}%
		}
		}{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{num-box}{%
	\begin{tcolorbox}[
			enhanced,
			breakable,
			parbox=false,
			skin=bicolor,
			before skip=\neo@effective@ex@beforeafterskip,
			after skip=\neo@effective@ex@beforeafterskip,
			frame hidden,
			top=-2pt,
			bottom=-2pt,
			colframe=exerciseColor,
			colback=backgroundColor,
			colupper=\neoschool@globalcolor,
			fontupper=\color{\neoschool@globalcolor},
			enlarge left by=-.5\leftmargin,
			enlarge right by=-.5\rightmargin,
			width=\textwidth+\leftmargin+\rightmargin,
			before upper*={%
					\hspace*{-4pt}
					\tcbox[enhanced,
						colupper=white,
						colback=exerciseColor,
						colframe=exerciseColor,
						fontupper=\csname\neoschool@headweight\endcsname,
						size=small,
						arc=\neoschool@exboxarc,
						baseline=4pt,
						top=0pt,
						bottom=0pt,
						left=0pt,
						right=0pt,
						nobeforeafter,
					]%
					{%
						\csname\neoschool@headstyle\endcsname
						\csname\neoschool@headweight\endcsname
						{\small\neo@exerciseicon}%
						\GetExerciseProperty{counter}%
					}%
				}
		]%
		{\neo@title@other@style
			\color{exerciseColor}
			\enskip%
			\IfExercisePropertySetT{level}
			{\neoexerciserating\enskip}%
			\IfExercisePropertySetT{subtitle}{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip}%
			\IfExercisePropertySetT{points}{%
				(\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point-short}}{\XSIMtranslate{points-short}})%
			}%
		}%
		\enskip
		}{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{num-box-out}{%
	\begin{tcolorbox}[
			enhanced,
			breakable,
			parbox=false,
			skin=bicolor,
			before skip=\neo@effective@ex@beforeafterskip,
			after skip=\neo@effective@ex@beforeafterskip,
			frame hidden,
			top=-2pt,
			bottom=-2pt,
			colback=backgroundColor,
			colupper=\neoschool@globalcolor,
			fontupper=\color{\neoschool@globalcolor},
			enlarge left by=-.5\leftmargin,
			enlarge right by=-.5\rightmargin,
			width=\textwidth+\leftmargin+\rightmargin,
			before upper*={%
					\hspace*{-3.5pt}
					\tcbox[enhanced,
						colupper=exerciseColor,
						colback=backgroundColor,
						colframe=exerciseColor,
						fontupper=\csname\neoschool@headweight\endcsname,
						arc=\neoschool@exboxarc,
						size=small,
						baseline=4pt,
						top=0pt,
						bottom=0pt,
						left=0pt,
						right=0pt,
						nobeforeafter,
					]%
					{%
						\csname\neoschool@headstyle\endcsname
						\csname\neoschool@headweight\endcsname
						{\small\neo@exerciseicon}%
						\GetExerciseProperty{counter}%
					}%
				}
		]%
		{\neo@title@other@style
			\color{exerciseColor}
			\enskip%
			\IfExercisePropertySetT{level}
			{\neoexerciserating\enskip}%
			\IfExercisePropertySetT{subtitle}{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip}%
			\IfExercisePropertySetT{points}{%
				(\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point-short}}{\XSIMtranslate{points-short}})%
			}%
		}%
		\enskip
		}{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{ex-num-box}{%
	\begin{tcolorbox}[
			enhanced,
			breakable,
			parbox=false,
			before skip=\neo@effective@ex@beforeafterskip,
			after skip=\neo@effective@ex@beforeafterskip,
			frame hidden,
			top=-2pt,
			bottom=-2pt,
			colframe=exerciseColor,
			colback=backgroundColor,
			colupper=\neoschool@globalcolor,
			fontupper=\color{\neoschool@globalcolor},
			enlarge left by=-.5\leftmargin,
			enlarge right by=-.5\rightmargin,
			width=\textwidth+\leftmargin+\rightmargin,
			before upper*={%
					\tcbox[enhanced,
						colupper=white,
						colback=exerciseColor,
						colframe=exerciseColor,
						fontupper=\csname\neoschool@headweight\endcsname,
						size=small,
						arc=\neoschool@exboxarc,
						baseline=3pt,
						top=0pt,
						bottom=0pt,
						left=0pt,
						right=0pt,
						nobeforeafter,
					]%
					{%
						\neo@title@other@style
						{\small\neo@exerciseicon}%
						Ex.~\GetExerciseProperty{counter}%
					}%
				}
		]%
		{\neo@title@other@style
			\color{exerciseColor}
			\enskip%
			\IfExercisePropertySetT{level}
			{\neoexerciserating\enskip}%
			\IfExercisePropertySetT{subtitle}{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip}%
			\IfExercisePropertySetT{points}{%
				(\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point-short}}{\XSIMtranslate{points-short}})%
			}%
		}%
		\enskip
		}{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{ex-num-box-out}{%
	\begin{tcolorbox}[
			enhanced,
			breakable,
			parbox=false,
			before skip=\neo@effective@ex@beforeafterskip,
			after skip=\neo@effective@ex@beforeafterskip,
			frame hidden,
			top=-2pt,
			bottom=-2pt,
			colframe=exerciseColor,
			colback=backgroundColor,
			colupper=\neoschool@globalcolor,
			fontupper=\color{\neoschool@globalcolor},
			enlarge left by=-.5\leftmargin,
			enlarge right by=-.5\rightmargin,
			width=\textwidth+\leftmargin+\rightmargin,
			before upper*={%
					\hspace*{-4pt}
					\tcbox[enhanced,
						colupper=exerciseColor,
						colback=backgroundColor,
						colframe=exerciseColor,
						fontupper=\csname\neoschool@headweight\endcsname,
						size=small,
						arc=\neoschool@exboxarc,
						boxrule=\neo@thickrule,
						baseline=4pt,
						top=0pt,
						bottom=0pt,
						left=0pt,
						right=0pt,
						nobeforeafter,
					]%
					{%
						\neo@title@other@style
						{\small\neo@exerciseicon}%
						Ex.~\GetExerciseProperty{counter}%
					}%
				}
		]%
		{\csname\neoschool@headstyle\endcsname
			\csname\neoschool@headweight\endcsname
			\color{exerciseColor}
			\enskip%
			\IfExercisePropertySetT{level}
			{\neoexerciserating\enskip}%
			\IfExercisePropertySetT{subtitle}{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip}%
			\IfExercisePropertySetT{points}{%
				(\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}{\XSIMtranslate{point-short}}{\XSIMtranslate{points-short}})%
			}%
		}%
		\enskip
		}{\end{tcolorbox}}

%%% Chevrons for Rules

\newcommand{\lchevrons}{%
	\begin{tikzpicture}[scale=0.1, baseline=0.2mm, line width=1.2pt]
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

%%% Horizontal Rule with Boxed Title

\DeclareExerciseEnvironmentTemplate{box-hrule}{%
	\par\vspace{\neo@effective@ex@beforeafterskip}
	\noindent
	{\neo@title@style
		\tcbox[on line,boxsep=-2pt,boxrule=\neo@thinrule,left=7pt,right=7pt,colframe=exerciseColor,colback=exerciseColor,sharp corners, rounded corners = southeast]{\color{white}{\small\neo@exerciseicon}\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}}%
		\color{exerciseColor}
		\IfExercisePropertySetT{level}
		{\enskip\neoexerciserating}%
		\IfInsideSolutionF{%
			\GetExercisePropertyT{subtitle}{{\enskip\normalfont\csname\neoschool@headweight\endcsname{\PropertyValue}\enskip}}%
		}%
		\hspace*{-1pt}\xrfill[.085cm]{1.2pt}[exerciseColor]\hspace*{-1pt}%
		{\color{exerciseColor}\footnotesize\lchevrons}%
		{%
			\IfExercisePropertySetT{points}{\bfseries\color{exerciseColor}\enskip%
				\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}
				{\XSIMtranslate{point}}
				{\XSIMtranslate{points}}%
			}%
		}%
	}%
	{\parfillskip0pt\par}
	\@afterindentfalse\@afterheading
}{\par\vspace{\neo@effective@ex@beforeafterskip}}

%%% Horizontal Rule with Boxed Title - Outlined

\DeclareExerciseEnvironmentTemplate{box-hrule-out}{%
	\par\vspace{\neo@effective@ex@beforeafterskip}
	\noindent
	{\neo@title@style\tcbox[on line,boxsep=-2pt,boxrule=\neo@thickrule,left=7pt,right=7pt,colframe=exerciseColor,colback=backgroundColor,sharp corners,
			rounded corners = east,arc=5pt
		]{\color{exerciseColor}{\small\neo@exerciseicon}\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}}%
		\color{exerciseColor}%
		\IfExercisePropertySetT{level}
		{\enskip\neoexerciserating}%
		\IfInsideSolutionF{%
			\GetExercisePropertyT{subtitle}{{\enskip\normalfont\csname\neoschool@headweight\endcsname{\PropertyValue}\enskip}}%
		}%
		\hspace*{-1pt}\xrfill[.085cm]{1.2pt}[exerciseColor]\hspace*{-1pt}%
		{\color{exerciseColor}\footnotesize\lchevrons}%
		{\bfseries\color{exerciseColor}%
			\IfExercisePropertySetT{points}{\enskip%
				\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}
				{\XSIMtranslate{point}}
				{\XSIMtranslate{points}}%
			}%
		}%
	}%
	{\parfillskip0pt\par}
	\@afterindentfalse\@afterheading
}{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

\DeclareExerciseEnvironmentTemplate{box-hrule-in}{%
	\par\vspace{\neo@effective@ex@beforeafterskip}
	\noindent
	{\neo@title@style\color{exerciseColor}%
		\tcbox[on line,boxsep=-2pt,boxrule=\neo@thickrule,left=7pt,right=7pt,colframe=exerciseColor,colback=backgroundColor,sharp corners,
			rounded corners = west,arc=5pt
		]{\color{exerciseColor}{\small\neo@exerciseicon}\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}}%
		\color{exerciseColor}
		\IfExercisePropertySetT{level}
		{\enskip\neoexerciserating}%
		\IfInsideSolutionF{%
			\GetExercisePropertyT{subtitle}{{\enskip\normalfont\csname\neoschool@headweight\endcsname{\PropertyValue}\enskip}}%
		}%
		\hspace{-1pt}\xrfill[.085cm]{1.2pt}[exerciseColor]\hspace{-1pt}%
		{\color{exerciseColor}\small\lcircle}%
		{\bfseries\color{exerciseColor}%
			\IfExercisePropertySetT{points}{\enskip%
				\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}
				{\XSIMtranslate{point}}
				{\XSIMtranslate{points}}%
			}}}%
	{\parfillskip0pt\par}
	\@afterindentfalse\@afterheading
}{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

%%% Boxed Title

\DeclareExerciseEnvironmentTemplate{boxed}{%
	\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
	\noindent
	{\neo@title@other@style\csname\neoschool@headshape\endcsname
		\tcbox[
			on line,
			boxsep=-3pt,
			left=6pt,
			right=6pt,
			before skip=0pt,
			colframe=exerciseColor,
			colback=exerciseColor,
			sharp corners,
			arc=4pt,
			rounded corners = southeast,
		]{%
			\color{white}{\small\neo@exerciseicon}%
			\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
		}%
	}%
	{%
		\neo@title@other@style\csname\neoschool@headshape\endcsname
		\color{exerciseColor}
		\enskip
		\IfExercisePropertySetT{level}
		{\neoexerciserating\enskip}%
		\IfExercisePropertySetT{subtitle}{{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip}}%
		\IfExercisePropertySetT{points}{%
			(\GetExerciseProperty{points}~%
			\IfExerciseGoalSingularTF{points}{point}{points})%
		}%
	}%
	\hspace{2pt}
}{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

%%% Boxed Title - Outlined

\DeclareExerciseEnvironmentTemplate{boxed-out}{%
	\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
	\noindent
	{\csname\neoschool@headstyle\endcsname
		\csname\neoschool@headweight\endcsname
		\csname\neoschool@headshape\endcsname
		\tcbox[
			on line,
			boxrule=\neo@normalrule,
			boxsep=-3pt,
			left=6pt,
			right=6pt,
			before skip=0pt,
			colframe=exerciseColor,
			colback=backgroundColor,
			sharp corners,
			arc=4pt,
			rounded corners = southeast,
		]{%
			\color{exerciseColor}{\small\neo@exerciseicon}%
			\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
		}%
	}%
	{%
		\neo@title@other@style\csname\neoschool@headshape\endcsname
		\color{exerciseColor}
		\enskip%
		\IfExercisePropertySetT{level}
		{\neoexerciserating\enskip}%
		\IfExercisePropertySetT{subtitle}{{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}\enskip}}%
		\IfExercisePropertySetT{points}{%
			(\GetExerciseProperty{points}~%
			\IfExerciseGoalSingularTF{points}{point}{points})%
		}%
	}%
	\hspace{2pt}
}{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}


%% ==============================================================================
%% Simple Style Templates
%% ==============================================================================

%% Common Style Settings
\newcommand{\neo@startsection}[1]{%
	\@startsection{paragraph}{4}{\z@}{0.25\baselineskip}{-1em}
	{\neo@title@style\color{#1}}
}

%% Inline Style
%% ----------------------------------
\DeclareExerciseEnvironmentTemplate{inline}{%
	\neo@startsection{exerciseColor}
	{%
		{\small\neo@exerciseicon}%
		\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
		\IfExercisePropertySetT{level}{\enskip$\cdot$\enskip%
			\neoexerciserating
		}%
		\GetExercisePropertyT{subtitle}{{\enskip$\cdot$\enskip\normalfont\csname\neoschool@headweight\endcsname\PropertyValue}}%
		\IfExercisePropertySetT{points}{\enskip$\cdot$\enskip%
			(\GetExerciseProperty{points}~%
			\IfExerciseGoalSingularTF{points}
			{\XSIMtranslate{point})}
		{\XSIMtranslate{points})}
	}
}
\color{\neoschool@globalcolor}\nobreak\hspace{-1em}
}{\par\vspace{-\parskip}\vspace{\neo@effective@afterskip}}


%% Section Style
%% ----------------------------------
\DeclareExerciseEnvironmentTemplate{section}{%
	\par\vspace{-4\parskip}\vspace{\neo@effective@afterskip}
	\section*{%
	  {\small\neo@exerciseicon}%
	  \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
	  \IfExercisePropertySetT{level}{%
		  [\enskip$\cdot$\enskip\raisebox{0.5pt}{\neo@replicate{\GetExerciseProperty{level}}{{$\star$}}}]}%
	  \IfExercisePropertySetT{subtitle}{{\enskip$\cdot$\enskip\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}}%
	  \IfExercisePropertySetT{points}{\enskip$\cdot$\enskip(%
		  \GetExerciseProperty{points}~%
		  \IfExerciseGoalSingularTF{points}
		  {\XSIMtranslate{point})}
		  {\XSIMtranslate{points})}
	  }%
	 }%
	\vspace*{-3\parskip}\vspace{\neo@effective@ex@beforeafterskip}%
	\color{\neoschool@globalcolor}%
}{\par\vspace{\neo@effective@ex@beforeafterskip}}

%% Terminal Style
\DeclareExerciseEnvironmentTemplate{terminal}{%
	\neo@startsection{exerciseColor}
	{%
		{\small\neo@exerciseicon}%
		\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
		\IfExercisePropertySetT{level}{%
			\enskip$\cdot$\enskip\neoexerciserating}%
		\GetExercisePropertyT{subtitle}{{\enskip$\cdot$\enskip\normalfont\csname\neoschool@headweight\endcsname\PropertyValue}}%
		\IfExercisePropertySetT{points}{\enskip$\cdot$\enskip(%
			\GetExerciseProperty{points}~%
			\IfExerciseGoalSingularTF{points}
			{\XSIMtranslate{point})}%
			{\XSIMtranslate{points})}%
			\enskip%
		}%
		{\small\faTerminal}%
	}%
	\color{\neoschool@globalcolor}\!%
}{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

\DeclareExerciseEnvironmentTemplate{subsection}{%
	\par\vspace{-4\parskip}\vspace{\neo@effective@afterskip}
	\subsection*{%
		\begingroup
		\color{exerciseColor}
		{\small\neo@exerciseicon}%
		\XSIMmixedcase{\GetExerciseName}\nobreakspace
		\GetExerciseProperty{counter}%
		\IfExercisePropertySetT{level}{%
			\enskip$\cdot$\enskip\neoexerciserating}%
		\IfInsideSolutionF{%
			\GetExercisePropertyT{subtitle}
			{{\enskip$\cdot$\enskip\normalfont\normalsize\csname\neoschool@headweight\endcsname\PropertyValue}}
			\IfExercisePropertySetT{points}{%
				\normalsize%
				\hfill
				(\GetExerciseProperty{points}~%
				\IfExerciseGoalSingularTF{points}
				{\XSIMtranslate{point}}%
				{\XSIMtranslate{points}}%
				)%
			}%
		}%
		\endgroup
	}%
	\vspace{-\neo@effective@ex@beforeafterskip}
}{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

%% ==============================================================================
%% Horizontal Rule Style
%% ==============================================================================

\DeclareExerciseEnvironmentTemplate{hrule}{%
	\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
	\Needspace*{3\baselineskip}
	\noindent
	\begingroup
	\color{exerciseColor}
	\neo@title@style
	{\small\neo@exerciseicon}%
	\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
	\IfExercisePropertySetT{level}{%
		\enskip$\cdot$\enskip\neoexerciserating%
	}
	\IfInsideSolutionF{%
		\GetExercisePropertyT{subtitle}{{{\enskip$\cdot$\enskip\normalfont\csname\neoschool@headweight\endcsname\PropertyValue}\enskip}}%
	}%
	\xrfill[.075cm]{\neo@normalrule}[exerciseColor]
	{\color{exerciseColor}
		\IfExercisePropertySetT{points}{\enskip%
			\GetExerciseProperty{points}~%
			\IfExerciseGoalSingularTF{points}
			{\XSIMtranslate{point}}%
			{\XSIMtranslate{points}}%
		}%
	}%
	\endgroup%
	{\parfillskip0pt\par}\vspace{-0.5\parskip}
	\@afterindentfalse\@afterheading
}{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

%% ==============================================================================
%% Solution Configuration
%% ==============================================================================

% Solution templates
\DeclareExerciseEnvironmentTemplate{sol-dotted}{%
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
	\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

\DeclareExerciseEnvironmentTemplate{sol-block}{%
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
}

\DeclareExerciseEnvironmentTemplate{sol-inline}{%
	\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
	\noindent
	{\color{solutionColor}
		\neo@title@style
		\XSIMmixedcase{\GetExerciseName}
		\csname neo@solutiongaptext\endcsname
		\GetExerciseProperty{counter}\hspace{.5em}
	}%
}{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

%% ==============================================================================
%% Smart Boxes
%% ==============================================================================
\DeclareExerciseProperty{answer-type}

\DeclareExerciseEnvironmentTemplate{smart-box}{%
	\begin{tcolorbox}[%
    neo@box@base,
    neo@frame@basic,
    neo@title@colored,
    title={%
      \raisebox{0pt}{\textcolor{white}{\small\neo@exerciseicon}}%
      \neo@title@style
      \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}\enskip$\cdot$\enskip%
      \IfExercisePropertySetT{level}{%
        \neoexerciserating\enskip$\cdot$\enskip%
      }%
      \IfExercisePropertySetT{subtitle}{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}%
      \hfill
      \IfExercisePropertySetT{points}{%
        \GetExerciseProperty{points}~%
        \IfExerciseGoalSingularTF{points}{point}{points}%
      }%
    }%
		]%
  }{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{rule-ams}{%
	\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}
	\Needspace*{3\baselineskip}
	\noindent
	\makebox[\linewidth][l]{%
		{\color{exerciseColor}%
				{\small\neo@exerciseicon}%
				\neo@title@style
				\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}\enskip$\cdot$\enskip%
				\IfExercisePropertySetT{level}{%
					\neoexerciserating\enskip$\cdot$\enskip%
				}%
				\IfExercisePropertySetT{subtitle}{%
					{\normalfont\csname\neoschool@headweight\endcsname\GetExerciseProperty{subtitle}}%
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
	\tikz[baseline]{\draw[line width=\neo@thinrule, exerciseColor!65, line cap=round] (0,0) -- (\linewidth,0);}%
	\par
	\@afterindentfalse\@afterheading
}{\par\vspace{-\parskip}\vspace{\neo@effective@ex@beforeafterskip}}

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
	{amslike}{\xsimsetup{exercise/template=inline}}%
		{amslikethm}{\xsimsetup{exercise/template=inline}}%
		{classy}{\xsimsetup{exercise/template=classy-box}}%
		{classythm}{\xsimsetup{exercise/template=classy-box}}%
		{classic}{\xsimsetup{exercise/template=classic-box}}%
		{classicthm}{\xsimsetup{exercise/template=classic-box}}%
		{sober}{\xsimsetup{exercise/template=sober-box}}%
		{soberthm}{\xsimsetup{exercise/template=sober-box}}%
		{elegant}{\xsimsetup{exercise/template=elegant-box}}%
		{elegantthm}{\xsimsetup{exercise/template=elegant-box}}%
		{shaded}{\xsimsetup{exercise/template=shaded-box}}%
		{shadedthm}{\xsimsetup{exercise/template=shaded-box}}%
		{slanted}{\xsimsetup{exercise/template=slanted-box}}%
		{slantedthm}{\xsimsetup{exercise/template=slanted-box}}%
		{classy-box}{\xsimsetup{exercise/template=classy-box}}%
		{classic-box}{\xsimsetup{exercise/template=classic-box}}%
		{sober-box}{\xsimsetup{exercise/template=sober-box}}%
		{elegant-box}{\xsimsetup{exercise/template=elegant-box}}%
		{shaded-box}{\xsimsetup{exercise/template=shaded-box}}%
		{slanted-box}{\xsimsetup{exercise/template=slanted-box}}%
		{rect-box}{\xsimsetup{exercise/template=rect-box}}%
		{rect-box-out}{\xsimsetup{exercise/template=rect-box-out}}%
		{num-box}{\xsimsetup{exercise/template=num-box}}%
		{num-box-out}{\xsimsetup{exercise/template=num-box-out}}%
		{ex-num-box}{\xsimsetup{exercise/template=ex-num-box}}%
		{ex-num-box-out}{\xsimsetup{exercise/template=ex-num-box-out}}%
		{box-hrule}{\xsimsetup{exercise/template=box-hrule}}%
		{box-hrule-out}{\xsimsetup{exercise/template=box-hrule-out}}%
		{box-hrule-in}{\xsimsetup{exercise/template=box-hrule-in}}%
		{boxed}{\xsimsetup{exercise/template=boxed}}%
		{boxed-out}{\xsimsetup{exercise/template=boxed-out}}%
		{inline}{\xsimsetup{exercise/template=inline}}%
		{section}{\xsimsetup{exercise/template=section}}%
		{subsection}{\xsimsetup{exercise/template=subsection}}%
		{terminal}{\xsimsetup{exercise/template=terminal}}%
		{hrule}{\xsimsetup{exercise/template=hrule}}%
		{rule-ams}{\xsimsetup{exercise/template=rule-ams}}%
		{smart-box}{\xsimsetup{exercise/template=smart-box}}%
}[\xsimsetup{exercise/template=inline}]

\ifneo@blocksol
	\xsimsetup{solution/template=sol-block}
\fi

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
\NewDocumentCommand\gridfill{s O{\neoschool@titlecolor} O{5mm} O{5mm}}{%
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
% \arrayrulecolor{\neoschool@titlecolor}
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
\NewDocumentCommand{\customgrid}{ O{\neoschool@titlecolor} O{5mm} O{5mm} m m }{%
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
\NewDocumentCommand{\grid}{ O{\neoschool@titlecolor} m m }{%
	\customgrid[#1][5mm][5mm]{#2}{#3}
}

\NewDocumentCommand{\frenchgrid}{ s O{\neoschool@titlecolor!75} O{\neoschool@titlecolor!50} m m }{%
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
\NewDocumentCommand{\splitcontent}{ O{0.5} O{0.02} m m }{%
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
\NewDocumentCommand{\textwithimage}{s m m m m}{%
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
\NewDocumentCommand{\withqrcode}{ s O{2cm} m m }{%
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

\NewDocumentCommand{\mrk}{s O{} m}{%
	\ifmarginnotesactive
		\IfBooleanTF{#1}
		{\reversemarginpar}
		{\normalmarginpar}%
		\ifx\empty#2\empty
			\marginnote{\footnotesize #3~\ifdim#3pt<2pt pt\else pts\fi}[0em]%
		\else
			\marginnote{%
				\small
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
	\fi
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
		\draw[densely dotted, semithick, line cap=round] (0,0) -- ({#1},0);
	\end{tikzpicture}
}

%% Task Lists
%% ----------------------------------
\newcommand{\cmark}{%
	\ifneo@unicolor
		{\color{\neoschool@headcolor}\ding{51}}%
	\else
		\ifneo@print
			\ding{51}%
		\else
			{\color{neoCorrectColor}\ding{51}}%
		\fi
	\fi
}

\newcommand{\xmark}{%
	\ifneo@unicolor
		{\color{\neoschool@headcolor}\ding{55}}%
	\else
		\ifneo@print
			\ding{55}%
		\else
			{\color{neoIncorrectColor}\ding{55}}%
		\fi
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

\newlength{\neo@usermargin}
\setlength{\neo@usermargin}{0pt}

\newlength{\neo@usernotes}
\setlength{\neo@usernotes}{0pt}

\ifx\neoschool@margin\@empty
\else
	\neo@hasmarginoptiontrue
	\setlength{\neo@usermargin}{\neoschool@margin}
\fi

\ifx\neoschool@notes\@empty
\else
	\marginnotesactivetrue
	\neo@hasnoteoptiontrue
	\setlength{\neo@usernotes}{\neoschool@notes}
\fi

\ifx\neoschool@leftnotes\@empty
\else
	\marginnotesactivetrue
	\neo@leftnotestrue
\fi

\ifx\neoschool@rightnotes\@empty
\else
	\marginnotesactivetrue
	\neo@rightnotestrue
\fi

\AtEndPreamble{%
	\ifneo@leftnotes
		\newlength{\neo@leftnoteswidth}
		\ifx\neoschool@leftnotes\@empty
			\setlength{\neo@leftnoteswidth}{3cm}
		\else
			\setlength{\neo@leftnoteswidth}{\neoschool@leftnotes}
		\fi
		\setlength{\marginparwidth}{\neo@leftnoteswidth}
		\setlength{\marginparsep}{0.5cm}

		\addtolength{\oddsidemargin}{\neo@leftnoteswidth}
		\addtolength{\evensidemargin}{\neo@leftnoteswidth}

		\addtolength{\textwidth}{-\neo@leftnoteswidth}

		\reversemarginpar
	\else\ifneo@rightnotes
			\newlength{\neo@rightnoteswidth}
			\ifx\neoschool@rightnotes\@empty
				\setlength{\neo@rightnoteswidth}{3cm}
			\else
				\setlength{\neo@rightnoteswidth}{\neoschool@rightnotes}
			\fi
			\setlength{\marginparwidth}{\neo@rightnoteswidth}
			\setlength{\marginparsep}{0.5cm}
			\setlength{\textwidth}{\dimexpr\paperwidth-\oddsidemargin-1in-\marginparsep-\marginparwidth-0.25cm\relax}
			\normalmarginpar
		\else
			\ifneo@hasmarginoption
				\newlength{\neo@basewidth}
				\newlength{\neo@baseheight}

				\ifdim\paperwidth>\paperheight
					\setlength{\neo@basewidth}{27cm}
					\setlength{\neo@baseheight}{20.5cm}
				\else
					\setlength{\neo@basewidth}{19cm}
					\setlength{\neo@baseheight}{29.25cm}
				\fi

				\ifneo@hasnoteoption
					\setlength{\marginparwidth}{\neo@usernotes}
					\setlength{\marginparsep}{0.5cm}
					\addtolength{\oddsidemargin}{\neo@usermargin}
					\addtolength{\evensidemargin}{\neo@usermargin}
					\areaset{\dimexpr\neo@basewidth-\neo@usermargin-\neo@usernotes\relax}{\dimexpr\neo@baseheight-\neo@usermargin\relax}
				\else
					\setlength{\marginparwidth}{\dimexpr\neo@usermargin-0.5cm\relax}
					\setlength{\marginparsep}{0.5cm}
					\addtolength{\oddsidemargin}{\neo@usermargin}
					\addtolength{\evensidemargin}{\neo@usermargin}
					\areaset{\dimexpr\neo@basewidth-\neo@usermargin\relax}{\dimexpr\neo@baseheight-\neo@usermargin\relax}
				\fi
			\else
				\ifneo@hasnoteoption
					\newlength{\neo@basewidth}
					\setlength{\neo@basewidth}{19cm}
					\setlength{\marginparwidth}{\dimexpr\neo@usernotes-0.5cm\relax}
					\setlength{\marginparsep}{0.5cm}
					\addtolength{\oddsidemargin}{\neo@usernotes}
					\addtolength{\evensidemargin}{\neo@usernotes}
					\areaset{\dimexpr\neo@basewidth-\neo@usernotes\relax}{29cm}
				\fi
			\fi
		\fi
	\fi
}

%% Margin Notes Commands
%% ----------------------------------

\newtoggle{lmargin}

\newcommand{\alternatingtodo}[2][]{%
	\ifneo@leftnotes
		\reversemarginpar \todo[#1]{#2}
	\else\ifneo@rightnotes
			\normalmarginpar \todo[#1]{#2}
		\else
			\iftoggle{lmargin}
			{\normalmarginpar \todo[#1]{#2} \togglefalse{lmargin}}
			{\reversemarginpar \todo[#1]{#2} \toggletrue{lmargin}}
		\fi\fi
	\ignorespaces
}

\newcommand{\tdnote}[2][]{%
	\ifmarginnotesactive
		\alternatingtodo[%
			bordercolor=backgroundColor,
			linecolor=solutionColor,
			textcolor=solutionColor,
			backgroundcolor=backgroundColor,
			#1%
		]{#2}%
	\fi
}

\newsavebox{\todobox}
\newcounter{tdnotecounter}

\newcommand{\boxnote}[2][inNote]{%
	\stepcounter{tdnotecounter}
	\ifneo@leftnotes
		\reversemarginpar
		\marginpar{%
			\savebox\todobox{\tdnote[inline]{#2}}%
			\begin{tikzpicture}[remember picture, overlay]
				\coordinate (#1-\thetdnotecounter) at (\marginparwidth,0.5\ht\todobox);
			\end{tikzpicture}%
			\usebox\todobox%
		}%
	\else\ifneo@rightnotes
			\normalmarginpar
			\marginpar{%
				\savebox\todobox{\tdnote[inline]{#2}}%
				\begin{tikzpicture}[remember picture, overlay]
					\coordinate (#1-\thetdnotecounter) at (0pt,0.5\ht\todobox);
				\end{tikzpicture}%
				\usebox\todobox%
			}%
		\else
			\iftoggle{lmargin}%
			{%
				\normalmarginpar
				\marginpar{%
					\savebox\todobox{\tdnote[inline]{#2}}%
					\begin{tikzpicture}[remember picture, overlay]
						\coordinate (#1-\thetdnotecounter) at (0pt,0.5\ht\todobox);
					\end{tikzpicture}%
					\usebox\todobox%
				}%
				\togglefalse{lmargin}
			}%
			{%
				\reversemarginpar
				\marginpar{%
					\savebox\todobox{\tdnote[inline]{#2}}%
					\begin{tikzpicture}[remember picture, overlay]
						\coordinate (#1-\thetdnotecounter) at (\marginparwidth,0.5\ht\todobox);
					\end{tikzpicture}%
					\usebox\todobox%
				}%
				\toggletrue{lmargin}
			}%
		\fi\fi
}

\newcommand{\tdmark}[1][inNote]{%
	\ifmarginnotesactive
		\tikz[remember picture, overlay]{%
			\iftoggle{lmargin}{%
				\draw[thick,color=\ifneo@unicolor\neoschool@headcolor\else ForestGreen\fi]
				(#1-\thetdnotecounter) -- ++(0.25cm,0) |- (0pt,\lineskip-\dp\strutbox)%
			}{%
				\draw[thick,color=\ifneo@unicolor\neoschool@headcolor\else ForestGreen\fi]
				(#1-\thetdnotecounter) -- ++(-0.25cm,0) |- (0pt,\lineskip-\dp\strutbox)%
			}
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
				colback=white,
				colbacktitle=white,
				colframe=\neoschool@globalcolor,
				sharp corners,
				boxrule=\neo@thinrule,
				height=2.5cm,
				title={\smallstrut\textmd{\color{\neoschool@globalcolor}\neo@mark@text}},
				center title,
				overlay={%
						\ifblank{#1}{}{%
							\coordinate (start) at ([xshift=-0.1mm,yshift=-0.575cm]frame.north east);
							\coordinate (end) at ([xshift=0.1mm,yshift=0.1mm]frame.south west);
							\draw[line width=\neo@decorativerule] (start) -- (end);
							\node[anchor=south east]
							at ([xshift=-0.4cm,yshift=0.4cm]end -| start) {#1};
						}%
					}
			]
			\ifblank{#1}{%
				\vspace{2\baselineskip}
			}{}
		\end{tcolorbox}
	\end{minipage}%
	\hspace{.1cm}%
	\begin{minipage}[t]{0.79\textwidth}
		\begin{tcolorbox}[%
				enhanced,
				colback=white,
				colbacktitle=white,
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
	\bigskip
	\colorlet{tempcolor}{\neoschool@globalcolor}

	\ifneo@print
		\def\iconcolorA{black!15}
		\def\iconcolorB{black!15}
		\def\iconcolorC{black!15}
		\def\iconcolorD{black!15}
	\else\ifneo@unicolormode
			\ifneo@darktheme
				\def\iconcolorA{\neoschool@titlecolor!30!white}
				\def\iconcolorB{\neoschool@titlecolor!30!white}
				\def\iconcolorC{\neoschool@titlecolor!30!white}
				\def\iconcolorD{\neoschool@titlecolor!30!white}
			\else
				\def\iconcolorA{\neoschool@titlecolor!25!white}
				\def\iconcolorB{\neoschool@titlecolor!25!white}
				\def\iconcolorC{\neoschool@titlecolor!25!white}
				\def\iconcolorD{\neoschool@titlecolor!25!white}
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
	\medskip
}

%% Tree and Graph Structure Support
%% ----------------------------------
% Forest settings for trees
\forestset{
	w/.style = {
			edge label={
					node[midway, fill=white, text=black] {$#1$}
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
						fill=white,
						text=black,
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
							fill=white,
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

% Math color

\newcommand*{\mc}[2][mathColor]{{\color{#1}#2}}

%% ==============================================================================
%% AI / NoAI Logos
%% ==============================================================================

\newcommand{\drawAIChipBase}{
	\shade[top color=titleColor!70!black, bottom color=titleColor!90!black, rounded corners=3pt] (0,0) rectangle (2,2);
	\draw[line width=1.5pt, titleColor!40!white, rounded corners=3pt] (0,0) rectangle (2,2);

	\foreach \y in {0.2, 0.6, 1.0, 1.4, 1.8} {
			\draw[line width=2.5pt, titleColor!80!black] (-0.2,\y) -- (0,\y);
			\draw[line width=2.5pt, titleColor!80!black] (2,\y) -- (2.2,\y);
		}
	\foreach \x in {0.2, 0.6, 1.0, 1.4, 1.8} {
			\draw[line width=2.5pt, titleColor!80!black] (\x,-0.2) -- (\x,0);
			\draw[line width=2.5pt, titleColor!80!black] (\x,2) -- (\x,2.2);
		}
}

\newcommand{\drawAINeuralNet}{
	\begin{scope}[shift={(1,1)}, scale=0.85, opacity=0.6, color=titleColor!70!white]
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
	\node[font=\bfseries\sffamily\Large, white] at (1,1) {\neo@ainame};
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

		\draw[line width=2pt, red!80!black, opacity=1] (1,1) circle (0.8);
		\draw[line width=2pt, red!80!black, opacity=1] (1-0.57, 1+0.57) -- (1+0.57, 1-0.57);

	\end{tikzpicture}
}

%% ==============================================================================
%% Admonition Boxes - Color Definitions
%% ==============================================================================

\ifneo@print
	\colorlet{noteColor}{black}
	\colorlet{infoColor}{black}
	\colorlet{warningColor}{black}
	\colorlet{importantColor}{black}
	\colorlet{tipColor}{black}
	\colorlet{reminderColor}{black}
	\colorlet{summaryColor}{black}
	\colorlet{toolboxColor}{black}
\else
	\ifneo@unicolormode
		\colorlet{noteColor}{\neoschool@headcolor}
		\colorlet{infoColor}{\neoschool@headcolor}
		\colorlet{warningColor}{\neoschool@headcolor}
		\colorlet{importantColor}{\neoschool@headcolor}
		\colorlet{tipColor}{\neoschool@headcolor}
		\colorlet{reminderColor}{\neoschool@headcolor}
		\colorlet{summaryColor}{\neoschool@headcolor}
		\colorlet{toolboxColor}{\neoschool@headcolor}
	\else
		\colorlet{tipColor}{methodColor}
		\colorlet{toolboxColor}{methodColor}
		\colorlet{infoColor}{comprehensionColor}
		\colorlet{noteColor}{comprehensionColor}
		\colorlet{summaryColor}{alternateColor}
		\ifneo@darktheme
			\definecolor{warningColor}{HTML}{FBBF24}
			\definecolor{importantColor}{HTML}{FB7185}
			\definecolor{reminderColor}{HTML}{60A5FA}
		\else
			\definecolor{warningColor}{HTML}{BF7800}
			\colorlet{importantColor}{theoremColor}
			\colorlet{reminderColor}{definitionColor}
		\fi
	\fi
\fi

%% Multilingual Support
\newcommand{\neo@admonition@note}{%
	\ifneo@french
		Note%
	\else\ifneo@german
			Notiz%
		\else
			Note%
		\fi\fi
}

\newcommand{\neo@admonition@info}{%
	\ifneo@french
		Information%
	\else\ifneo@german
			Information%
		\else
			Information%
		\fi\fi
}

\newcommand{\neo@admonition@warning}{%
	\ifneo@french
		Attention%
	\else\ifneo@german
			Achtung%
		\else
			Warning%
		\fi\fi
}

\newcommand{\neo@admonition@important}{%
	\ifneo@french
		Important%
	\else\ifneo@german
			Wichtig%
		\else
			Important%
		\fi\fi
}

\newcommand{\neo@admonition@tip}{%
	\ifneo@french
		Conseil%
	\else\ifneo@german
			Tipp%
		\else
			Tip%
		\fi\fi
}

\newcommand{\neo@admonition@reminder}{%
	\ifneo@french
		À retenir%
	\else\ifneo@german
			Merken%
		\else
			Remember%
		\fi\fi
}

\newcommand{\neo@admonition@summary}{%
	\ifneo@french
		Résumé%
	\else\ifneo@german
			Zusammenfassung%
		\else
			Summary%
		\fi\fi
}

\newcommand{\neo@admonition@toolbox}{%
	\ifneo@french
		Boîte à outils%
	\else\ifneo@german
			Werkzeugkasten%
		\else
			Toolbox%
		\fi\fi
}

%% Base Style Configuration

\tcbset{
	neoschool-admonition-layout/.style={
			code={
					\ifneoschool@inlineadmonition
						\tcbset{
							after title={~\;},
						}
					\else
						\tcbset{
							after title={\par\vspace{0.5em}},
						}
					\fi
				}
		}
}

\ifneo@darktheme
	\newcommand{\neo@admonitionback}[1]{#1!15!darkthemegray}
\else
	\newcommand{\neo@admonitionback}[1]{#1!5}
\fi

\ifneo@noadback
	\renewcommand{\neo@admonitionback}[1]{backgroundColor}
\fi

\newtcolorbox{admonitionbase}[4][]{%
	enhanced,
	before skip=\neo@effective@ad@beforeskip,
	after skip=\neo@effective@ad@afterskip,
	colback=\neo@admonitionback{#2},
	colframe=#2,
	colupper=\neoschool@globalcolor,
	boxrule=\neo@normalrule,
	frame style={opacity=0.5},
	\neo@adframehidden,
	arc=\neoschool@adboxarc,
	left=\neo@ad@left@padding,
	right=\neo@ad@right@padding,
	top=\neo@ad@top@padding,
	bottom=\neo@ad@bottom@padding,
	breakable,
	lines before break=3,
	fonttitle=\neo@title@style,
	title={%
			\hspace*{-5.35mm}%
			\raisebox{-2pt}{\textcolor{#2}{\Large#3}}%
			\hspace{5pt}%
			\textcolor{#2}{\textbf{#4}}%
		},
	attach title to upper,
	neoschool-admonition-layout,
	#1
}

% Note Box
\NewDocumentEnvironment{note}{O{\neo@admonition@note} O{\faEdit} +b}{%
	\begin{admonitionbase}{noteColor}{#2}{#1}%
		#3%
	\end{admonitionbase}%
}{}

% Info Box
\NewDocumentEnvironment{info}{O{\neo@admonition@info} O{\faInfoCircle} +b}{%
	\begin{admonitionbase}{infoColor}{#2}{#1}%
		#3%
	\end{admonitionbase}%
}{}

% Warning Box
\@ifundefined{endwarning}{%
	\@ifundefined{warning}{}{
		\let\warning\relax
	}
	\NewDocumentEnvironment{warning}{O{\neo@admonition@warning} O{\faExclamationTriangle} +b}{%
		\begin{admonitionbase}{warningColor}{#2}{#1}%
			#3%
		\end{admonitionbase}%
	}{}
}{%
	\RenewDocumentEnvironment{warning}{O{\neo@admonition@warning} O{\faExclamationTriangle} +b}{%
		\begin{admonitionbase}{warningColor}{#2}{#1}%
			#3%
		\end{admonitionbase}%
	}{}
}

% Important Box
\NewDocumentEnvironment{important}{O{\neo@admonition@important} O{\faExclamationCircle} +b}{%
	\begin{admonitionbase}{importantColor}{#2}{#1}%
		#3%
	\end{admonitionbase}%
}{}

% Tip Box
\NewDocumentEnvironment{tip}{O{\neo@admonition@tip} O{\faLightbulb} +b}{%
	\begin{admonitionbase}{tipColor}{#2}{#1}%
		#3%
	\end{admonitionbase}%
}{}

% Reminder Box
\NewDocumentEnvironment{reminder}{O{\neo@admonition@reminder} O{\faBookmark} +b}{%
	\begin{admonitionbase}{reminderColor}{#2}{#1}%
		#3%
	\end{admonitionbase}%
}{}

% Summary Box
\NewDocumentEnvironment{summary}{O{\neo@admonition@summary} O{\faClipboardList} +b}{%
	\begin{admonitionbase}{summaryColor}{#2}{#1}%
		#3%
	\end{admonitionbase}%
}{}

% Toolbox Box
\NewDocumentEnvironment{toolbox}{O{\neo@admonition@toolbox} O{\faTools} +b}{%
	\begin{admonitionbase}{toolboxColor}{#2}{#1}%
		#3%
	\end{admonitionbase}%
}{}

%% ==============================================================================
%% Apply vspace factor
%% ==============================================================================

\newdimen\@tempdima
\newdimen\@tempdimatwo

\AtBeginDocument{%
	\ifdim\neo@vspace@factor pt=1.0pt\else
		\setlength{\parskip}{\dimexpr\neo@vspace@factor\parskip\relax}
		\setlength{\abovedisplayskip}{\dimexpr\neo@vspace@factor\abovedisplayskip\relax}
		\setlength{\belowdisplayskip}{\dimexpr\neo@vspace@factor\belowdisplayskip\relax}
		\setlength{\abovedisplayshortskip}{\dimexpr\neo@vspace@factor\abovedisplayshortskip\relax}
		\setlength{\belowdisplayshortskip}{\dimexpr\neo@vspace@factor\belowdisplayshortskip\relax}
		\setlength{\floatsep}{\dimexpr\neo@vspace@factor\floatsep\relax}
		\setlength{\textfloatsep}{\dimexpr\neo@vspace@factor\textfloatsep\relax}
		\setlength{\intextsep}{\dimexpr\neo@vspace@factor\intextsep\relax}

		\pgfmathsetlength{\@tempdima}{0.25 * \baselineskip}
		\pgfmathsetlength{\@tempdimatwo}{0.25 * \baselineskip}

		\newdimen\neo@final@itemsep
		\newdimen\neo@final@parsep
		\newdimen\neo@final@topsep

		\pgfmathsetlength{\neo@final@itemsep}{\neo@vspace@factor * \@tempdima}
		\pgfmathsetlength{\neo@final@parsep}{\neo@vspace@factor * \@tempdimatwo}
		\pgfmathsetlength{\neo@final@topsep}{\neo@vspace@factor * \@tempdima}

		\setlist{%
			itemsep=\neo@final@itemsep,
			parsep=\neo@final@parsep,
			topsep=\neo@final@topsep,
		}%
	\fi
}

\ifdim\neo@vspace@factor pt=1.0pt\else
	\RedeclareSectionCommand[
		beforeskip=\dimexpr\neo@vspace@factor\dimexpr 1.5\baselineskip\relax\relax,
		afterskip=\dimexpr\neo@vspace@factor\dimexpr 0.75\baselineskip\relax\relax
	]{section}
	\RedeclareSectionCommand[
		beforeskip=\dimexpr\neo@vspace@factor\dimexpr 1.25\baselineskip\relax\relax,
		afterskip=\dimexpr\neo@vspace@factor\dimexpr 0.6\baselineskip\relax\relax
	]{subsection}
	\RedeclareSectionCommand[
		beforeskip=\dimexpr\neo@vspace@factor\dimexpr 1.0\baselineskip\relax\relax,
		afterskip=\dimexpr\neo@vspace@factor\dimexpr 0.5\baselineskip\relax\relax
	]{subsubsection}
	\setlength{\titlespacing}{\dimexpr\neo@vspace@factor\baselineskip\relax}
	\addtocontents{toc}{%
		\protect\setlength{\protect\itemsep}{\dimexpr\neo@vspace@factor\dimexpr 6pt\relax\relax}%
		\protect\setlength{\protect\parskip}{\dimexpr\neo@vspace@factor\dimexpr 2pt\relax\relax}%
	}
\fi

\AtBeginDocument{%
  \ifpdf
  \else
    \ifx\neoschool@mathfacescale\@empty\else
      \setmathfont[Scale=\neoschool@mathfacescale]{\mathface}
    \fi
  \fi
}

%% ==============================================================================
%% End of Class
%% ==============================================================================
