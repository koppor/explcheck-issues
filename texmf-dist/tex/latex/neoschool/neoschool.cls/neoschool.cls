% neoschool.cls
%
% copyright (C) 2025 Razik Ikhlef
% razik.ikhlef@csilyon.fr
%
% The newest version of this documentclass should always be available
% from the following web page: https://apps.edulatex.xyz/neoschool/

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neoschool}[2025/01/03 v1.0.0]

\RequirePackage[table,svgnames,dvipsnames,x11names]{xcolor}

\RequirePackage{kvoptions}
\RequirePackage{siunitx}
\RequirePackage{pgffor}

\SetupKeyvalOptions{
    family=neoschool,
    prefix=neoschool@
}

\DeclareStringOption[cyprus]{theme}
\def\neo@cyprus{cyprus}
\def\neo@kassio{kassio}
\def\neo@frost{frost}
\def\neo@spring{spring}
\def\neo@arbutus{arbutus}
\def\neo@duo{duo}
\def\neo@navy{navy}
\def\neo@royal{royal}

\ProcessKeyvalOptions*\relax

% Main Colors
\ifx\neoschool@theme\neo@cyprus
    \definecolor{titleColor}{HTML}{a7601f}
    \definecolor{theoremColor}{HTML}{557400}
    \definecolor{definitionColor}{HTML}{bf4400}
    \definecolor{methodColor}{HTML}{3f6faf}
    \definecolor{remarkColor}{HTML}{7f475a}
    \definecolor{alternateColor}{HTML}{59786f}
    \definecolor{applicationColor}{HTML}{00824f}
    \definecolor{codeColor}{HTML}{9a456f}
    \colorlet{sectionColor}{theoremColor}
    \colorlet{subsectionColor}{definitionColor}
    \colorlet{subsubsectionColor}{methodColor}
\else\ifx\neoschool@theme\neo@kassio
        \definecolor{titleColor}{HTML}{3c3bbe}
        \definecolor{theoremColor}{HTML}{a01f64}
        \definecolor{definitionColor}{HTML}{2f5f9f}
        \definecolor{methodColor}{HTML}{a04646}
        \definecolor{remarkColor}{HTML}{af4988}
        \definecolor{alternateColor}{HTML}{776f79}
        \definecolor{applicationColor}{HTML}{7022bf}
        \definecolor{codeColor}{HTML}{9f248a}
        \colorlet{sectionColor}{theoremColor}
        \colorlet{subsectionColor}{definitionColor}
        \colorlet{subsubsectionColor}{methodColor}
    \else\ifx\neoschool@theme\neo@frost
            \definecolor{titleColor}{HTML}{007a85}
            \definecolor{theoremColor}{HTML}{004fc0}
            \definecolor{definitionColor}{HTML}{00845f}
            \definecolor{methodColor}{HTML}{7f5ae0}
            \definecolor{remarkColor}{HTML}{204f9a}
            \definecolor{alternateColor}{HTML}{66657f}
            \definecolor{applicationColor}{HTML}{1f6fbf}
            \definecolor{codeColor}{HTML}{004fc0}
            \colorlet{sectionColor}{theoremColor}
            \colorlet{subsectionColor}{definitionColor}
            \colorlet{subsubsectionColor}{methodColor}
        \else\ifx\neoschool@theme\neo@spring
                \definecolor{titleColor}{HTML}{cf2f4f}
                \definecolor{theoremColor}{HTML}{007f68}
                \definecolor{definitionColor}{HTML}{cb26a0}
                \definecolor{methodColor}{HTML}{5f5fdf}
                \definecolor{remarkColor}{HTML}{9d5e7a}
                \definecolor{alternateColor}{HTML}{777294}
                \definecolor{applicationColor}{HTML}{b6540f}
                \definecolor{codeColor}{HTML}{1f6fbf}
                \colorlet{sectionColor}{theoremColor}
                \colorlet{subsectionColor}{definitionColor}
                \colorlet{subsubsectionColor}{methodColor}
            \else\ifx\neoschool@theme\neo@arbutus
                    \definecolor{titleColor}{HTML}{007000}
                    \definecolor{theoremColor}{HTML}{8f2f30}
                    \definecolor{definitionColor}{HTML}{00704f}
                    \definecolor{methodColor}{HTML}{906200}
                    \definecolor{remarkColor}{HTML}{8a5f4a}
                    \definecolor{alternateColor}{HTML}{6e678f}
                    \definecolor{applicationColor}{HTML}{557000}
                    \definecolor{codeColor}{HTML}{0f7688}
                    \colorlet{sectionColor}{theoremColor}
                    \colorlet{subsectionColor}{definitionColor}
                    \colorlet{subsubsectionColor}{methodColor}
                \else\ifx\neoschool@theme\neo@duo
                        \definecolor{titleColor}{HTML}{375cd8}
                        \definecolor{theoremColor}{HTML}{9f4a00}
                        \definecolor{definitionColor}{HTML}{4250ef}
                        \definecolor{methodColor}{HTML}{8f5a3a}
                        \definecolor{remarkColor}{HTML}{856f4a}
                        \definecolor{alternateColor}{HTML}{63728f}
                        \definecolor{applicationColor}{HTML}{6052cf}
                        \definecolor{codeColor}{HTML}{4a7d00}
                        \colorlet{sectionColor}{theoremColor}
                        \colorlet{subsectionColor}{definitionColor}
                        \colorlet{subsubsectionColor}{methodColor}
                    \else\ifx\neoschool@theme\neo@navy
                            \definecolor{titleColor}{RGB}{25,75,125}
                            \definecolor{theoremColor}{RGB}{145,45,45}
                            \definecolor{definitionColor}{RGB}{35,105,85}
                            \definecolor{methodColor}{RGB}{125,75,25}
                            \definecolor{remarkColor}{RGB}{125,75,95}
                            \definecolor{alternateColor}{RGB}{85,95,105}
                            \definecolor{applicationColor}{RGB}{75,55,125}
                            \definecolor{codeColor}{RGB}{45,95,115}
                            \colorlet{sectionColor}{theoremColor}
                            \colorlet{subsectionColor}{definitionColor}
                            \colorlet{subsubsectionColor}{methodColor}
                        \else\ifx\neoschool@theme\neo@royal
                                \definecolor{titleColor}{RGB}{5,80,174}
                                \definecolor{theoremColor}{RGB}{161,40,40}
                                \definecolor{definitionColor}{RGB}{0,115,85}
                                \definecolor{methodColor}{RGB}{180,95,45}
                                \definecolor{remarkColor}{RGB}{130,75,95}
                                \definecolor{alternateColor}{RGB}{90,100,110}
                                \definecolor{applicationColor}{RGB}{180,145,35}
                                \definecolor{codeColor}{RGB}{60,89,90}
                                \colorlet{sectionColor}{theoremColor}
                                \colorlet{subsectionColor}{definitionColor}
                                \colorlet{subsubsectionColor}{methodColor}
                            \fi
                        \fi
                    \fi
                \fi
            \fi
        \fi
    \fi
\fi

% Colors for code environments
\colorlet{codeBackground}{codeColor!5}
\colorlet{codeEmph}{methodColor}
\colorlet{codeKeyword}{titleColor}
\colorlet{codeString}{theoremColor}
\colorlet{codeComment}{alternateColor}
\colorlet{codeNumber}{alternateColor}

% Initial setup
\def\neo@palette{unicolor}

% Basic boolean declarations
\newif\ifneo@normal
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
\newif\ifneo@fancybox
\newif\ifneo@onlytitleleft
\newif\ifneo@onlytitle
\newif\ifneo@onlytitleright
\newif\ifneo@bubbles
\newif\ifneo@shortbubbles
\newif\ifneo@mockexam
\newif\ifneo@shortexam
\newif\ifneo@shorteval
\newif\ifneo@shorttitle
\newif\ifneo@shortlesson

% Layout booleans
\newif\ifneo@noframe
\newif\ifneo@nocodeframe
\newif\ifneo@noback

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

%% Package specific options
\newif\ifneo@apmep
\newif\ifneo@mathics
\newif\ifneo@listings
\newif\ifneo@minted
\newif\ifneo@frenchmath

%% ==============================================================================
%% Basic Options and Setup Commands
%% ==============================================================================

% String options declarations
\DeclareStringOption[black]{globalcolor}
\DeclareStringOption[sectionColor]{headcolor}
\DeclareStringOption[subsectionColor]{subcolor}
\DeclareStringOption[subsubsectionColor]{subsubcolor}
\DeclareStringOption[titleColor]{titlecolor}
\DeclareStringOption[]{titlehexcolor}
\DeclareStringOption[alternateColor]{headfootcolor}

\ProcessKeyvalOptions*\relax

\ifx\neoschool@titlehexcolor\@empty
\else
    \definecolor{titleColor}{HTML}{\neoschool@titlehexcolor}
    \colorlet{subjectColor}{titleColor!80}
    \colorlet{subtitleColor}{titleColor!60}
\fi

\DeclareOption{normal}{%
    \neo@normaltrue\neo@unicolorfalse
    \colorlet{lemmaColor}{theoremColor}
    \colorlet{corollaryColor}{theoremColor}
    \colorlet{propertyColor}{theoremColor}
    \colorlet{propositionColor}{theoremColor}
    \colorlet{solutionColor}{theoremColor}
    \colorlet{activityColor}{applicationColor}
    \colorlet{codebackColor}{codeColor!5}
    \colorlet{exerciseColor}{\neoschool@titlecolor}
    \colorlet{exampleColor}{titleColor}
    \colorlet{subjectColor}{sectionColor!80!white}
    \colorlet{subtitleColor}{sectionColor!60!white}
}

% Unicolor option setup
\DeclareOption{unicolor}{%
    \def\neo@palette{unicolor}
    \neo@normalfalse\neo@unicolortrue
    \colorlet{definitionColor}{\neoschool@titlecolor}
    \colorlet{theoremColor}{\neoschool@titlecolor}
    \colorlet{lemmaColor}{\neoschool@titlecolor}
    \colorlet{corollaryColor}{\neoschool@titlecolor}
    \colorlet{propositionColor}{\neoschool@titlecolor}
    \colorlet{propertyColor}{\neoschool@titlecolor}
    \colorlet{activityColor}{\neoschool@titlecolor}
    \colorlet{methodColor}{\neoschool@titlecolor}
    \colorlet{applicationColor}{\neoschool@titlecolor}
    \colorlet{codeColor}{\neoschool@titlecolor}
    \colorlet{exerciseColor}{\neoschool@titlecolor}
    \colorlet{remarkColor}{\neoschool@titlecolor}
    \colorlet{exampleColor}{\neoschool@titlecolor}
    \colorlet{solutionColor}{\neoschool@titlecolor}
    \colorlet{codebackColor}{\neoschool@titlecolor!5!white}
    \colorlet{subjectColor}{\neoschool@titlecolor!80}
    \colorlet{subtitleColor}{\neoschool@titlecolor!60}
    \renewcommand{\neoschool@headcolor}{\neoschool@titlecolor}
    \renewcommand{\neoschool@subcolor}{\neoschool@titlecolor}
    \renewcommand{\neoschool@subsubcolor}{\neoschool@titlecolor}
}

% Palette of headings color
\DeclareOption{gradientheadpalette}{%
    \renewcommand{\neoschool@headcolor}{\neoschool@titlecolor!80!white}
    \renewcommand{\neoschool@subcolor}{\neoschool@titlecolor!70!white}
    \renewcommand{\neoschool@subsubcolor}{\neoschool@titlecolor!60!white}
    \colorlet{subjectColor}{\neoschool@titlecolor!80}
    \colorlet{subtitleColor}{\neoschool@titlecolor!60}
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

% Language options
\DeclareOption{english}{%
    \neo@setupLanguage{english}
    \AtEndOfClass{\sisetup{locale = US,detect-all}}
    \neo@definenames@one{Theorem}{Proposition}{Property}{Lemma}{Corollary}{Definition}{Example}{Exercise}{Remark}
    \neo@definenames@two{Problem}{Conjecture}{Activity}{Method}{Application}{Competencies}{Listing}{Algorithm}{Page}
    \neo@definenames@three{Solution}
    \neo@defineextra{Examples}{of exercise }
    \neo@definepath{Path}
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
    \neo@definenames@three{Corrigé}
    \neo@defineextra{Exemples}{de l'exercice }
    \neo@definepath{Parcours}
}

\DeclareOption{german}{%
    \neo@setupLanguage{german}
    \AtEndOfClass{\sisetup{locale = DE,detect-all}}
    \neo@definenames@one{Theorem}{Proposition}{Eigenschaft}{Lemma}{Korollar}{Definition}{Beispiel}{Übung}{Bemerkung}
    \neo@definenames@two{Problem}{Vermutung}{Aktivität}{Methode}{Anwendung}{Fähigkeiten}{Auflistung}{Algorithmus}{Seite}
    \neo@definenames@three{Lösung}
    \neo@defineextra{Beispiele}{von Übung }
    \neo@definepath{Stufe}
}

\DeclareOption{nofrenchlist}{\AtEndOfClass{\frenchsetup{StandardItemLabels=true}}}
\DeclareOption{frenchlistaspar}{\AtEndOfClass{\frenchsetup{ListItemsAsPar=true}}}

%% ==============================================================================
%% Style Setup
%% ==============================================================================

% Style setup command
\newcommand{\neo@setupstyle}[1]{%
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
\DeclareOption{classythm}{\neo@setupstyle{classythm}}
\DeclareOption{soberthm}{\neo@setupstyle{soberthm}}
\DeclareOption{classicthm}{\neo@setupstyle{classicthm}}
\DeclareOption{slantedthm}{\neo@setupstyle{slantedthm}}
\DeclareOption{shadedthm}{\neo@setupstyle{shadedthm}}
\DeclareOption{boxedthm}{\neo@setupstyle{boxedthm}}
\DeclareOption{amslikethm}{\neo@setupstyle{amslikethm}}
\DeclareOption{elegantthm}{\neo@setupstyle{elegantthm}}

\DeclareStringOption[colorful]{lststyle}

%% ==============================================================================
%% Layout Settings
%% ==============================================================================

% Layout setup command
\newcommand{\neo@setuplayout}[1]{%
    \@nameuse{neo@#1true}
}

% Frame and background options
\DeclareOption{noback}{\neo@setuplayout{noback}}
\DeclareOption{noframe}{\neo@setuplayout{noframe}}
\DeclareOption{nocodeframe}{\neo@setuplayout{nocodeframe}}

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
    \neo@fancyboxfalse
    \neo@onlytitleleftfalse
    \neo@onlytitlefalse
    \neo@onlytitlerightfalse
    \neo@bubblesfalse
    \neo@shortbubblesfalse
    \neo@mockexamfalse
    \neo@shortexamfalse
    \@nameuse{neo@#1true}
}

% Title options
\DeclareOption{exam}{\neo@setuptitle{exam}}
\DeclareOption{eval}{\neo@setuptitle{eval}}
\DeclareOption{evalicons}{\neo@setuptitle{evalicons}}
\DeclareOption{evalgrade}{\neo@setuptitle{evalgrade}}
\DeclareOption{evaliconsgrade}{\neo@setuptitle{evaliconsgrade}}
\DeclareOption{fancybox}{\neo@setuptitle{fancybox}}
\DeclareOption{onlytitleleft}{\neo@setuptitle{onlytitleleft}}
\DeclareOption{onlytitle}{\neo@setuptitle{onlytitle}}
\DeclareOption{onlytitleright}{\neo@setuptitle{onlytitleright}}
\DeclareOption{bubbles}{\neo@setuptitle{bubbles}}
\DeclareOption{shortbubbles}{\neo@setuptitle{shortbubbles}}
\DeclareOption{mockexam}{\neo@setuptitle{mockexam}}
\DeclareOption{shortexam}{\neo@setuptitle{shortexam}}
\DeclareOption{shorteval}{\neo@setuptitle{shorteval}}
\DeclareOption{shorttitle}{\neo@setuptitle{shorttitle}}
\DeclareOption{shortlesson}{\neo@setuptitle{shortlesson}}

%% ==============================================================================
%% Print and Color Settings
%% ==============================================================================

% Print setup command
\newcommand{\neo@setupprint}{%
    \neo@printtrue%
    \neo@normaltrue\neo@unicolortrue% Force unicolor mode
    % Set all colors to black
    \renewcommand{\neoschool@globalcolor}{black}%
    \renewcommand{\neoschool@headcolor}{black}%
    \renewcommand{\neoschool@subcolor}{black}%
    \renewcommand{\neoschool@subsubcolor}{black}%
    \renewcommand{\neoschool@titlecolor}{black}%
    \renewcommand{\neoschool@headfootcolor}{black}%
    \colorlet{subjectColor}{black!80}%
    \colorlet{subtitleColor}{black!60}%
    \AtEndOfClass{%
        \colorlet{verbColor}{\neoschool@titlecolor}%
    }
    % Override all theme colors to black
    \colorlet{definitionColor}{black}%
    \colorlet{theoremColor}{black}%
    \colorlet{lemmaColor}{black}%
    \colorlet{corollaryColor}{black}%
    \colorlet{propertyColor}{black}%
    \colorlet{propositionColor}{black}%
    \colorlet{activityColor}{black}%
    \colorlet{methodColor}{black}%
    \colorlet{applicationColor}{black}%
    \colorlet{codeColor}{black}%
    \colorlet{codebackColor}{black!5}%
    \colorlet{exerciseColor}{black}%
    \colorlet{exampleColor}{black}%
    \colorlet{solutionColor}{black}%
    \colorlet{alternateColor}{black}%
    % Override admonition colors
    \colorlet{noteColor}{black}%
    \colorlet{infoColor}{black}%
    \colorlet{warningColor}{black}%
    \colorlet{importantColor}{black}%
    \colorlet{tipColor}{black}%
    \colorlet{reminderColor}{black}%
    \colorlet{summaryColor}{black}%
    \colorlet{toolboxColor}{black}%
    % Override hyperref colors
    \def\Hy@linkcolor{black}
    \def\Hy@anchorcolor{black}
    \def\Hy@citecolor{black}
    \def\Hy@filecolor{black}
    \def\Hy@menucolor{black}
    \def\Hy@runcolor{black}
    \def\Hy@urlcolor{black}
    % Code syntax colors
    \def\neo@keywordstyle{\color{black}\bfseries}%
    \def\neo@commentstyle{\color{black!75}}%
    \def\neo@stringstyle{\color{black}}%
    \def\neo@emphstyle{\color{black}\bfseries}%
    % Set minted style to bw if minted is used
    \ifneo@minted
        \usemintedstyle{bw}%
    \fi
}

% Print option
\DeclareOption{print}{\neo@setupprint}

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
    \@nameuse{neo@#1true}
}

% Package options
\DeclareOption{math}{\neo@setuppackage{math}}
\DeclareOption{apmep}{\neo@setuppackage{apmep}}
\DeclareOption{mathics}{\neo@setuppackage{mathics}}
\DeclareOption{listings}{\neo@setuppackage{listings}}
\DeclareOption{minted}{\neo@setuppackage{minted}}
\DeclareOption{frenchmath}{\neo@setuppackage{frenchmath}}

%% ==============================================================================
%% Abstract Name
%% ==============================================================================

\DeclareStringOption[abstractname]{abstracttitle}

%% ==============================================================================
%% Margin Options
%% ==============================================================================

\DeclareStringOption{margin}
\DeclareStringOption{notes}

%% ==============================================================================
%% Solution Settings
%% ==============================================================================

% Solution options
\DeclareBoolOption{answers}
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
\DeclareStringOption[2mm]{boxarc}
\DeclareStringOption[2pt]{pseudoboxarc}

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
%% Compact Option
%% ==============================================================================

\newif\ifneo@compact
\DeclareOption{compact}{\neo@compacttrue}

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
    normal,                % Default color palette
    listings,              % Default packages for Listings
}

% Process remaining options
\ProcessOptions\relax

% Load base class
\LoadClass{scrartcl}

\KOMAoptions{%
    DIV=last,
    parskip=half
}

\let\@unusedoptionlist\@empty

%% ==============================================================================
%% Page Layout Configuration
%% ==============================================================================

\newcommand{\neo@setupmargins}[1]{%
    \KOMAoptions{%
        DIV=calc,
        DIV=#1,
        BCOR=0pt,
        headinclude=true,
        footinclude=true
    }%
}

% Intentionally small margins for teaching materials - ignore typearea warning
\neo@setupmargins{last}
\areaset{19cm}{29.25cm}
\setlength{\headheight}{27pt}
\setlength{\footskip}{27pt}

\widowpenalty=10000
\clubpenalty=10000

\displaywidowpenalty=10000
\predisplaypenalty=10000
\postdisplaypenalty=10000
\interlinepenalty=10000

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
\newcommand{\neo@tcbcolback}{tcbcolframe!5}
\newcommand{\neo@tcbcolbacklower}{white}
\newcommand{\neo@tcbcolupper}{black}
\newcommand{\neo@tcbcoltitle}{white}

% Frame options definitions
\newcommand{\neo@framehidden}{}
\newcommand{\neo@thmborder}{1pt}
\newcommand{\neo@leftpadding}{1ex}
\newcommand{\neo@rightpadding}{1ex}
\newcommand{\neo@toppadding}{1ex}
\newcommand{\neo@bottompadding}{1ex}
\newcommand{\neo@titleleftpadding}{0.5em}
\newcommand{\neo@titlerightpadding}{0.5em}
\newcommand{\neo@titletoppadding}{3pt}
\newcommand{\neo@titlebottompadding}{3pt}
\newcommand{\neo@beforeskip}{0.5\baselineskip}
\newcommand{\neo@afterskip}{0.5\baselineskip}

% Handle noback option:
% Changes background colors to white for main boxes
\ifneo@noback
    \renewcommand{\neo@tcbcolback}{white}
    \colorlet{codebackColor}{white}
    \renewcommand{\neo@tcbcolbacklower}{tcbcolframe!5}
\fi

% Handle noframe option:
% Hides frames and adjusts title color
\ifneo@noframe
    \renewcommand{\neo@framehidden}{frame hidden}
    \renewcommand{\neo@thmborder}{0pt}
    \renewcommand{\neo@tcbcoltitle}{tcbcolframe}
    \ifneo@noback
        \renewcommand{\neo@leftpadding}{-2pt}
        \renewcommand{\neo@rightpadding}{-2pt}
        \renewcommand{\neo@toppadding}{-1pt}
        \renewcommand{\neo@bottompadding}{-1pt}
        \renewcommand{\neo@titleleftpadding}{-2.5pt}
        \renewcommand{\neo@titlerightpadding}{-2.5pt}
        \renewcommand{\neo@titletoppadding}{-2pt}
        \renewcommand{\neo@titlebottompadding}{-2pt}
        \renewcommand{\neo@beforeskip}{0.25\baselineskip}
        \renewcommand{\neo@afterskip}{0.25\baselineskip}
    \fi
\fi

% Handle nocodeframe option:
% Hides code block frames and adjusts colors
\ifneo@nocodeframe
    \colorlet{codeColor}{codebackColor}
\fi

% Adjust spacing for two-column mode
\if@twocolumn
    \setlength{\columnsep}{1em}
\fi

%% ==============================================================================
%% Required Packages Setup
%% ==============================================================================

%% Core packages
\RequirePackage{iftex}                    % Engine detection
\RequirePackage{xkeyval}                  % Extended key-value support
\RequirePackage{xstring}                  % String manipulation
\RequirePackage{calc}                     % Length calculations
\RequirePackage{ifthen}                   % Boolean expression
\RequirePackage{pdftexcmds}               % Conditionals
\RequirePackage{environ}                  % New Environments

% Hide Some Warnings
\RequirePackage{silence}
\WarningFilter{latexfont}{Font shape}
\renewcommand{\@font@warning}[1]{}
\WarningFilter{mismath}{}
\WarningFilter{multicol}{}

%% Language support
\ifluatex
    \RequirePackage{fontspec}
\fi

\ifneo@french
    \RequirePackage[main=french,shorthands=off]{babel}
\else\ifneo@german
        \RequirePackage[main=german]{babel}
    \else
        \RequirePackage[main=english]{babel}
    \fi\fi

\RequirePackage{scrlayer-scrpage}        % Headers and footers

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
\ifluatex
    \usetikzlibrary{graphs,graphdrawing,quotes}
    \usegdlibrary{circular,force,layered,routing,trees}
    \RequirePackage{luacolor}            % Color support for LuaTeX
    \RequirePackage{lua-ul}              % Underlining for LuaTeX
    \RequirePackage{luacas}              % Computer algebra for LuaTeX
\fi

%% Tables and arrays
\RequirePackage{tabularray}              % Advanced tables
\UseTblrLibrary{%
    amsmath,
    booktab,
    diagbox,
    functional,
    varwidth,
    siunitx
}

\RequirePackage{adjustbox}               % Adjusting box dimensions

%% Extended Math packages
\ifneoschool@math
  \RequirePackage[suite,taupe]{tdsfrmath}  % French Math macros
\fi

\RequirePackage{mismath}                 % Miscellaneous math macros (includes mathtools)

\ifneoschool@math
  \RequirePackage{amssymb}                 % Mathematical symbols
  \RequirePackage{ncccomma}                % Math Comma
\fi

%% APMEP Compatibility Mode - Option 'apmep'

\ifneo@apmep
    %% APMEP required packages
    \RequirePackage{textcomp}               % Text companion fonts
    \RequirePackage{esvect}                 % Vector arrows
    \RequirePackage{fourier-orns}           % Ornaments
    \RequirePackage{tabularx}               % Extended tables
    \RequirePackage[np]{numprint}           % Number printing

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

    %% APMEP enumeration style
    \renewcommand{\theenumi}{\textbf{\arabic{enumi}}}
    \renewcommand{\labelenumi}{\textbf{\theenumi.}}
    \renewcommand{\theenumii}{\textbf{\alph{enumii}}}
    \renewcommand{\labelenumii}{\textbf{\theenumii.}}

    %% APMEP coordinate systems
    \def\Oij{$\left(\text{O}~;~\vect{\imath},~\vect{\jmath}\right)$}
    \def\Oijk{$\left(\text{O}~;~\vect{\imath},~\vect{\jmath},~\vect{k}\right)$}
    \def\Ouv{$\left(\text{O}~;~\vect{u},~\vect{v}\right)$}

    %% APMEP font declaration
    \DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
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
\RequirePackage{adforn}                    % Ornaments
\ifx\neoschool@notes\@empty\else
    \RequirePackage[%
        \neo@lang,
        textsize=scriptsize
    ]{todonotes}                               % Todo notes
\fi
\RequirePackage{marginnote}                % Margin notes
\RequirePackage{algpseudocode}             % Algorithms
\RequirePackage{textcase}                  % Text case changing
\RequirePackage[use-files,clear-aux]{xsim} % Exercise sheets
\RequirePackage[normalem]{ulem}            % Underlining

%% Microtype
\AtEndOfClass{\RequirePackage{microtype}}

%% Hyperref setup
\definecolor{neo@linkcolor}{named}{\neoschool@titlecolor}
\definecolor{neo@filecolor}{named}{\neoschool@titlecolor}
\definecolor{neo@urlcolor}{named}{\neoschool@titlecolor}

\RequirePackage{bookmark}
\RequirePackage{lastpage}

\hypersetup{%
    colorlinks=true,
    linkcolor=neo@linkcolor,
    filecolor=neo@filecolor,
    urlcolor=neo@urlcolor,
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

% PdfLaTeX configuration
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\expandafter\ifblank\expandafter{\facefamily}{%
    % Load individual fonts if facefamily is not defined
    \expandafter\ifblank\expandafter{\mathface}{\ifneo@mathastext
    \RequirePackage[italic,eulergreek]{mathastext}\else\RequirePackage{newpxmath}\fi}{\RequirePackage[\neoschool@mathfaceoptions]{\neoschool@mathface}}

    \expandafter\ifblank\expandafter{\mainface}{\RequirePackage{newpxtext}}{\RequirePackage[\neoschool@mainfaceoptions]{\neoschool@mainface}}
    \expandafter\ifblank\expandafter{\sansface}{}{\RequirePackage[\neoschool@sansfaceoptions]{\neoschool@sansface}}
    \expandafter\ifblank\expandafter{\monoface}{}{\RequirePackage[\neoschool@monofaceoptions]{\neoschool@monoface}}
}{
    % Load font family if defined
    \RequirePackage[\neoschool@facefamilyoptions]{\neoschool@facefamily}
}
\else
% % LuaLaTeX configuration
\RequirePackage{fontspec}

\ifneo@scale
  \defaultfontfeatures[\rmfamily]{Scale=1}
  \defaultfontfeatures{Scale=MatchLowercase}
\fi

\defaultfontfeatures{Ligatures=TeX,Renderer=HarfBuzz}

\expandafter\ifblank\expandafter{\mathface}{%
    \ifneo@mathastext
    \RequirePackage[italic,eulergreek]{mathastext}
    \else
    \RequirePackage{newpxmath}
    \fi
  }{%
    \RequirePackage{\mathface}
  }
\expandafter\ifblank\expandafter{\mainface}{%
    \setmainfont{TeX Gyre PagellaX}
  }{%
    \setmainfont[\neoschool@mainfaceoptions]{\neoschool@mainface}
  }
\expandafter\ifblank\expandafter{\sansface}{%
    \setsansfont{TeX Gyre Heros}
  }{%
    \setsansfont[\neoschool@sansfaceoptions]{\neoschool@sansface}
  }
\expandafter\ifblank\expandafter{\monoface}{%
    \setmonofont{Cascadia Code}
  }{%
    \setmonofont[\neoschool@monofaceoptions]{\neoschool@monoface}
  }
\fi

\RequirePackage{bm} % Bold Math

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
%% KOMA-Script Typography
%% ==============================================================================

\newcommand{\LARGEplus}{\fontsize{15.5}{18.6}\selectfont}
\newcommand{\LARGEhuge}{\fontsize{16.74}{20.09}\selectfont}
\newcommand{\hugeminus}{\fontsize{18.5}{22.2}\selectfont}

% Monospace font and color configuration
\AtEndOfClass{%
    \colorlet{verbColor}{\neoschool@titlecolor}%
    \let\oldtexttt\texttt
    \renewrobustcmd{\texttt}[1]{\oldtexttt{\color{verbColor}#1}}
}

\setkomafont{disposition}{\mdseries}

% Header style configuration
\setkomafont{title}{\csname\neoschool@titlestyle\endcsname\csname\neoschool@titleweight\endcsname\color{\neoschool@titlecolor}\hugeminus}
\setkomafont{subtitle}{\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\color{subtitleColor}}
\setkomafont{subject}{\csname\neoschool@headweight\endcsname\color{subjectColor}\large}
\setkomafont{author}{\large}
\setkomafont{date}{\large}
\setkomafont{subsection}{\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\color{\neoschool@subcolor}\large}
\setkomafont{subsubsection}{\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\color{\neoschool@subsubcolor}}
% \renewcommand{\subsubsection}{%
%     \@startsection{subsubsection}{3}{\z@}%
%     {1ex plus 1ex minus .2ex}%
%     {-2em}%
%     {\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\color{\neoschool@subsubcolor}\itshape\secpunct}%
% }
% \newcommand{\secpunct}[1]{#1\hspace{-3ex}}
\setkomafont{pagenumber}{\csname\neoschool@headstyle\endcsname\color{\neoschool@headfootcolor}}
\setkomafont{descriptionlabel}{\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname}

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

\newpairofpagestyles{followingpages}{%
    \ihead{}\chead{}\ohead{}%
    \ifoot{\@title}\cfoot{}\ofoot{\pagemark}%
}{%
    \ihead{}\chead{}\ohead{}%
    \ifoot{\@title}\cfoot{}\ofoot{\pagemark}%
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
\setlength{\titlespacing}{1.5\baselineskip}
\newcommand\myscaleratio{0.5}

% Define tight spacing commands
\newcommand{\neo@tightspacing}{%
    \setlength\topsep{0pt}
    \setlength\parskip{0pt}
}

% Redefine center, flushright, and flushleft environments with tight spacing
\let\oldcenter\center
\let\oldendcenter\endcenter
\renewenvironment{center}{%
    \neo@tightspacing
    \oldcenter
}{%
    \oldendcenter
}

\let\oldflushright\flushright
\let\oldendflushright\endflushright
\renewenvironment{flushright}{%
    \neo@tightspacing
    \oldflushright
}{%
    \oldendflushright
}

\let\oldflushleft\flushleft
\let\oldendflushleft\endflushleft
\renewenvironment{flushleft}{%
    \neo@tightspacing
    \oldflushleft
}{%
    \oldendflushleft
}

% Title decoration handler
\newcommand{\neo@titledecoration}{%
    \ifneo@titlerule
        \vspace{1.25\titlespacing}%
        {\color{\neoschool@titlecolor}\rule{5em}{0.4pt}}
    \else
        \ifneo@titlemidrule
            \vspace{1.25\titlespacing}%
            {\color{\neoschool@titlecolor}\rule{0.5\linewidth}{0.4pt}}
        \else
            \ifneo@titlefullrule
                \vspace{1.25\titlespacing}%
                {\color{\neoschool@titlecolor}\rule{\linewidth}{0.4pt}}%
                \vspace{-0.75\titlespacing}%
            \else
                \ifneo@titleornament
                    \vspace{1.25\titlespacing}%
                    {\color{\neoschool@titlecolor}\scalebox{2}[1.5]{\adforn{21}\,\adforn{11}\,\adforn{49}}}
                \fi
            \fi
        \fi
    \fi
    \vspace*{.15\baselineskip}
}

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
\ifx\@author\@empty\else
    \vspace{\titlespacing}
    {\noindent\usekomafont{author}{\@author\par}}
\fi

% Decorative elements
\neo@titledecoration
\if@twocolumn\vspace{2\titlespacing}\else\vspace{\titlespacing}\fi
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
                        \begin{flushleft}
                            \createfulltitle
                        \end{flushleft}
                    \else
                        \ifx\neoschool@titlealign\neo@right
                            \begin{flushright}
                                \createfulltitle
                            \end{flushright}
                        \else
                            \begin{center}
                                \createfulltitle
                            \end{center}
                        \fi
                    \fi
                }]
    \else
        \ifx\neoschool@titlealign\neo@left
            \begin{flushleft}
                \createfulltitle
            \end{flushleft}
        \else
            \ifx\neoschool@titlealign\neo@right
                \begin{flushright}
                    \createfulltitle
                \end{flushright}
            \else
                \begin{center}
                    \createfulltitle
                \end{center}
            \fi
        \fi
    \fi
    \egroup
}

% Enhanced fancy title box with rotation
\ifneo@fancybox
    \newcommand{\neo@fancycolor}{exerciseColor!5!white}
    \AtBeginDocument{%
        \begin{tikzpicture}[remember picture,overlay]
            % Rotated background box
            \fill[\neo@fancycolor,rotate=-15]
            ($(current page.north west) +(0,-1in)$)
            rectangle ($(current page.north west) +(2.25in,2.0in)$);

            % Title node with improved positioning
            \node[anchor=west] (title) at
            ($([xshift=-1ex,yshift=2ex]current page text area.north west)$)
            {\LARGE\csname\neoschool@titlestyle\endcsname
                \csname\neoschool@titleweight\endcsname
                \csname\neoschool@titleshape\endcsname
                \color{\neoschool@titlecolor}\@title};
        \end{tikzpicture}
        \vspace*{\dimexpr1.25in+\oddsidemargin\relax}\par
        \let\maketitle\relax
        \thispagestyle{firstpage}
    }
\fi

% Unified handling of single-column and two-column title layouts with only title
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
    {\begin{flushleft}\createonlytitle\end{flushleft}}
    {\begin{flushleft}\createonlytitle\end{flushleft}}
\fi

% Centered title implementation
\ifneo@onlytitle
    \neo@handleonlytitle
    {\begin{center}\createonlytitle\end{center}}
    {\begin{center}\createonlytitle\end{center}}
\fi

% Right-aligned title implementation
\ifneo@onlytitleright
    \neo@handleonlytitle
    {\begin{flushright}\createonlytitle\end{flushright}}
    {\begin{flushright}\createonlytitle\end{flushright}}
\fi

%% ==============================================================================
%% Table of Contents
%% ==============================================================================

\addto\captionsfrench{\renewcommand{\contentsname}{Sommaire}}

\DeclareTOCStyleEntry[
    entryformat={\sffamily\csname\neoschool@headweight\endcsname\color{\neoschool@headcolor}}
]{tocline}{section}

\DeclareTOCStyleEntry[
    entryformat={\sffamily}
]{tocline}{subsection}

\DeclareTOCStyleEntry[
    entryformat={\sffamily}
]{tocline}{subsubsection}

%% ==============================================================================
%% Abstract formatting
%% ==============================================================================

\if@twocolumn
    \renewenvironment{abstract}{%
        \begin{strip}
            \ifx\neoschool@abstracttitle\@empty
                \vspace{-4em}
                \quotation
            \else
                \vspace{-5em}
                \section*{\csname\neoschool@abstracttitle\endcsname}%
                \quotation
            \fi}
            {\endquotation\end{strip}}
\else
    \renewenvironment{abstract}{%
        \ifx\neoschool@abstracttitle\@empty
            % \vspace{-1em}
            \quotation
        \else
            \vspace{-2em}
            \section*{\csname\neoschool@abstracttitle\endcsname}%
            \quotation
        \fi}
    {\endquotation}
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
        \IfSCAvailableTF{\scshape\Large\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname #1}{\MakeUppercase{\large \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname #1}}%
    \else
        \ifx\neoschool@sectiontextstyle\neo@textstyle@upper
            \MakeUppercase{\large \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname #1}%
        \else
            \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\Large #1%
        \fi
    \fi
}

% Section number formatting based on style option
\renewcommand{\sectionformat}{%
    \ifx\neoschool@sectionnumstyle\neo@numstyle@circle
        \circled{{\large\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\thesection}}\enskip%
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
                \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\thesection\enskip\textendash\enskip
            \else
                \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\thesection\autodot\enskip
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

% Configuration defaults for header fields
\def\neo@header@type{}
\def\neo@header@school{}
\def\neo@header@academy{}
\def\neo@header@level{}
\def\neo@header@duration{}
\def\neo@header@calculator{false}
\def\neo@header@leftcontent{\faBookOpen}
\def\neo@header@rightcontent{\faSchool}
\def\neo@header@leftcontentfill{true}
\def\neo@header@rightcontentfill{true}

\define@key[neo]{header}{type}{\def\neo@header@type{#1}}
\define@key[neo]{header}{school}{\def\neo@header@school{#1}}
\define@key[neo]{header}{academy}{\def\neo@header@academy{#1}}
\define@key[neo]{header}{level}{\def\neo@header@level{#1}}
\define@key[neo]{header}{duration}{\def\neo@header@duration{#1}}
\define@key[neo]{header}{calculator}[false]{%
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
                \PackageError{neoschool}{Invalid calculator value: #1}
                {Use 'true', 'false' or 'exam'}%
            \fi
        \fi
    \fi
}
\define@key[neo]{header}{leftcontent}[\faBookOpen]{\def\neo@header@leftcontent{#1}}
\define@key[neo]{header}{rightcontent}[\faSchool]{\def\neo@header@rightcontent{#1}}
\define@key[neo]{header}{leftcontentfill}[true]{\def\neo@header@leftcontentfill{#1}}
\define@key[neo]{header}{rightcontentfill}[true]{\def\neo@header@rightcontentfill{#1}}

\newcommand{\neo@header@setkeys}{\setkeys[neo]{header}}

\newcommand{\neoheader}[1]{%
    \neo@header@setkeys{#1}%
}

% Full header configuration
\ifneo@fullheader
    \ihead{\neo@header@type}
    \chead{\@title}
    \ohead{\neo@header@level}
    \ifoot{\@date}
    \cfoot{\neo@header@school}
    \ofoot{\pagemark}
    \pagestyle{scrheadings}
    \thispagestyle{firstpage}
\else
    \pagestyle{followingpages}
    \thispagestyle{firstpage}
\fi

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

%% Colors Setup
%% ----------------------------------
\newcommand{\neo@setupevalcolors}{%
    \def\neo@evalrulecolor{\neoschool@headfootcolor!25!white}%
}

%% Basic Title Components
%% ----------------------------------
\newcommand{\neo@completetitle}[1][]{%
    % Main title
    \node[
        align=center,
        anchor=center,
        text width=0.85\textwidth,
        #1
    ] (title) at ([yshift=-24mm]current page.north) {%
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
            font=\normalsize
        ] {%
            \usekomafont{subject}{\@subject}
        };
    \fi

    % Subtitle (if provided)
    \ifx\@subtitle\empty\else
        \node[
            below=1.5mm of title.south,
            anchor=north,
            text width=0.85\textwidth,
            align=center,
            font=\normalsize
        ] {%
            \usekomafont{subtitle}{\@subtitle}
        };
    \fi
}

\newcommand{\neo@completegradetitle}[1][]{%
    % Main title
    \node[
        align=center,
        anchor=center,
        text width=0.85\textwidth,
        #1
    ] (title) at ([yshift=-24mm]current page.north) {%
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
            font=\normalsize
        ] {%
            \usekomafont{subject}{\@subject}
        };
    \fi
    % Subtitle (if provided)
    \ifx\@subtitle\empty\else
        \node[
            below=1.5mm of title.south,
            anchor=north,
            text width=0.85\textwidth,
            align=center,
            font=\normalsize
        ] {%
            \usekomafont{subtitle}{\@subtitle}
        };
    \fi
    % Duration
    \node[
        below=10mm of title.south,
        anchor=north,
        align=center,
        font=\small\sffamily
    ] {%
        Durée : \neo@header@duration\quad\textbullet\quad\neo@calculator
    };
    % Name field
    \node[
        below=17.5mm of title.south,
        anchor=north,
        align=center,
        font=\small\sffamily
    ] {%
        \color{\neoschool@globalcolor}Nom : \vardots[4cm]
    };
}

%% ==============================================================================
%% Enhanced Header without Icons
%% ==============================================================================

%% Configuration for Simple Header
%% ----------------------------------
\newcommand{\neo@setupheaderconfig}{%
    \def\neo@cornershift{5mm}%
    \def\neo@topyshift{8mm}%
    \def\neo@topyshiftgrade{8mm}%
    \def\neo@bottomyshift{40mm}%
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
        font=\normalsize,
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
        \begin{tikzpicture}[remember picture,overlay]
            \draw[\neo@evalrulecolor,line width=0.4pt]
            ([yshift=-1.3\neo@headerheight]current page.north west) --
            ([yshift=-1.3\neo@headerheight]current page.north east);
            \neo@completetitle
            \neo@cornernode{west}{\neo@cornershift}{\neo@topyshift}{\neo@header@type}
            \neo@cornernode{east}{-\neo@cornershift}{\neo@topyshift}{\neo@header@school}
            \neo@cornernode{west}{\neo@cornershift}{\neo@bottomyshift}{\neo@header@level}
            \neo@cornernode{east}{-\neo@cornershift}{\neo@bottomyshift}{\@date}
        \end{tikzpicture}%
        \if@twocolumn\vspace{0.95\neo@headerheight}\else\vspace{0.85\neo@headerheight}\fi%
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
            \draw[\neo@evalrulecolor,line width=0.4pt]
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
        \if@twocolumn\vspace{0.85\neo@headerheight}\else\vspace{0.75\neo@headerheight}\fi%
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

%% Header with grading stip without Icons
\ifneo@evalgrade
    \newcommand{\neo@evalgradecontent}{%
        \neo@setupevalcolors
        \neo@setupheaderconfig
        \begin{tikzpicture}[remember picture,overlay]
            \neo@completegradetitle
            % Top elements
            \neo@cornernode{west}{\neo@cornershift}{\neo@topyshiftgrade}{\neo@header@type}
            \neo@cornernode{east}{-\neo@cornershift}{\neo@topyshiftgrade}{\neo@header@level}

            % Bottom elements
            \node[
                anchor=west,
                font={\small\sffamily}
            ] at ([xshift=5mm,yshift=9mm]current page.south west) {%
                \color{\neoschool@headfootcolor}\@date%
            };

            \node[
                anchor=east,
                font={\small\sffamily}
            ] at ([xshift=-5mm,yshift=9mm]current page.south east) {%
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

        \if@twocolumn\vspace{\neo@headerheight}\else\vspace{0.95\neo@headerheight}\fi%

        \ifx\neoschool@totalpoints\@empty\gradingstrip\else\gradingstrip[\neoschool@totalpoints]\fi
        \vspace{1.5em}%
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
    \newcommand{\neo@maketitlecontent}{%
        \begin{tikzpicture}[remember picture,overlay]
            \neo@completegradetitle
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

        \if@twocolumn\vspace{\neo@headerheight}\else\vspace{0.95\neo@headerheight}\fi%

        \ifx\neoschool@totalpoints\@empty\gradingstrip\else\gradingstrip[\neoschool@totalpoints]\fi
        \vspace{1.5em}%
    }

    \AtBeginDocument{%
        \let\neo@oldmaketitle\maketitle
        \renewcommand{\maketitle}{%
            \if@twocolumn
                \twocolumn[\neo@maketitlecontent]%
            \else
                \neo@maketitlecontent
            \fi
            \thispagestyle{pagenum}%
        }%
    }
\fi

%% Calculator Notice
%% ----------------------------------
\newcommand{\neo@calculator}{%
    \small L'usage de la calculatrice%
    \ifnum\pdf@strcmp{\neo@header@calculator}{true}=0
        \ est autorisé.%
    \else\ifnum\pdf@strcmp{\neo@header@calculator}{exam}=0
            \ est autorisé uniquement en mode examen.%
        \else
            \ n'est pas autorisé.%
        \fi\fi
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
            {\renewcommand\arraystretch{1.25}
                \begin{tblr}{X[4,l]X[2,c]X[3,r]}
                    \examfield{\neo@gettext{1} :}{\neo@header@school} &  &
                    \examfield{\neo@gettext{5} :}{\@date}                      \\
                    \examfield{\neo@gettext{2} :}{\vardots[4cm]}               &  &
                    \examfield{\neo@gettext{3} :}{\neo@header@level}
                \end{tblr}
            }

            \vspace{\baselineskip}
            \centering

            \begin{minipage}[c]{\linewidth}
                \centering
                \neo@header@type
            \end{minipage}\vspace{.85\baselineskip}

            \LARGE\csname\neoschool@titlestyle\endcsname
            \csname\neoschool@titleweight\endcsname
            \csname\neoschool@titleshape\endcsname
            \color{\neoschool@titlecolor}
            \@title\vspace{.75\baselineskip}

            \normalsize\normalfont\color{black}
            \begin{minipage}[c]{\linewidth}
                \centering
                \examfield{\neo@gettext{4} :}{\neo@header@duration}\vspace{\baselineskip}

                \neo@calculator
            \end{minipage}
        \end{tcolorbox}

        \ifx\neoschool@totalpoints\@empty\gradingstrip\else\gradingstrip[\neoschool@totalpoints]\fi
        \vspace{2em}
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
            {\textsc{\neo@examinfo{Académie de \neo@header@academy}}}
            \vspace*{\stretch{2.5}}%

            % Title and session
            {\LARGE\bfseries\csname\neoschool@headstyle\endcsname
                \csname\neoschool@headweight\endcsname
                \csname\neoschool@headshape\endcsname
                \neo@examtitle{\neo@header@type}}
            \vspace*{0.8cm}%
            {\color{\neoschool@titlecolor!75!black}\itshape Session \@date}
            \vspace*{1.5cm}%

            % Subject and level
            {\Large\csname\neoschool@headstyle\endcsname
                \csname\neoschool@headweight\endcsname
                \csname\neoschool@headshape\endcsname
                \neo@examsubtitle{ÉPREUVE DE \MakeUppercase{\@subject}}}
            \vspace*{1cm}%
            {\neo@examinfo{\neo@header@level}}
            \vspace*{\stretch{2}}%

            % Duration
            {\textit{Durée : \neo@header@duration}}
            \vspace*{1.2cm}%

            % Instructions
            \begin{minipage}{0.8\textwidth}
                \begin{center}
                    \setlength{\baselineskip}{1.6\baselineskip}%
                    \neo@calculator
                    \vspace*{0.8cm}%
                    La qualité de la rédaction et la rigueur des raisonnements
                    seront prises en compte dans l'évaluation des copies.
                    \vspace*{0.8cm}

                    Toute tentative, même partielle ou inachevée, sera valorisée.
                \end{center}
            \end{minipage}
            \vspace*{\stretch{1.5}}%

            % Page count
            {\color{\neoschool@titlecolor!65!black}%
                Ce document comporte \arabic{mockexampages}~pages numérotées de 1/\arabic{mockexampages}  à \arabic{mockexampages}/\arabic{mockexampages}.}
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
        \vspace*{-0.5cm}
        \begin{center}
            {\Large \csname\neoschool@headstyle\endcsname
                \csname\neoschool@headweight\endcsname
                \csname\neoschool@headshape\endcsname
                \neo@examtitle{\neo@header@type}}

            \vspace{3mm}
            {\small \textit{Session \@date}}

            \vspace{5mm}
            {\large \csname\neoschool@headstyle\endcsname
                \csname\neoschool@headweight\endcsname
                \csname\neoschool@headshape\endcsname
                \neo@examsubtitle{ÉPREUVE DE \MakeUppercase{\@subject}}}

            \vspace{3mm}
            {\small \neo@examinfo{\neo@header@level}}

            \vspace{5mm}
            {\small \textit{Durée : \neo@header@duration}}

            \vspace{5mm}
            \neo@calculator

            \vspace{15mm}
            {\color{\neoschool@headfootcolor}%
                \rule{\linewidth}{0.5pt}}
        \end{center}
        \vspace{10mm}%
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
            \draw[line width=0.4pt, \neoschool@headfootcolor!50!white]
            ([yshift=-21mm]current page.north west) --
            ([yshift=-21mm]current page.north east);
            \path let \p1=(current page.east) in node[
                    anchor=west,
                    align=left,
                    text width=\sideWidth,
                    font=\small\sffamily,
                    text=\neoschool@headfootcolor
                ] at ([xshift=0.75cm,yshift=-11mm]current page.north west)
            {Nom :\\[1mm]
                    \neo@header@type};
            \path let \p1=(current page.east) in node[
                    anchor=center,
                    align=center,
                    text width={\dimexpr\paperwidth-2\sideWidth-2cm},
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
        \vspace{2em}%
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
            \draw[line width=0.4pt, \neoschool@headfootcolor!50!white]
            ([yshift=-21mm]current page.north west) --
            ([yshift=-21mm]current page.north east);
            \path let \p1=(current page.east) in node[
                    anchor=center,
                    align=center,
                    text width={\dimexpr\paperwidth-2cm},
                    font=\LARGE
                ] at ([yshift=-11mm]current page.north)
            {\color{\neoschool@titlecolor}%
                    \csname\neoschool@titlestyle\endcsname%
                    \csname\neoschool@titleweight\endcsname%
                    \csname\neoschool@titleshape\endcsname%
                    \@title};
        \end{tikzpicture}%
        \if@twocolumn\vspace{2em}\else\vspace{1em}\fi%
    }

    \AtBeginDocument{%
        \let\neo@oldmaketitle\maketitle
        \renewcommand{\maketitle}{%
            \if@twocolumn
                \twocolumn[\neo@shorttitlecontent]%
            \else
                \neo@shorttitlecontent
            \fi
            \thispagestyle{firstpage}%
        }%
    }
\fi

%% Short Lesson Header Style
%% ----------------------------------
\ifneo@shortlesson
    \newcommand{\neo@shortlessoncontent}{%
        \begin{tikzpicture}[remember picture,overlay]
            % Line under the header
            \draw[line width=0.4pt, \neoschool@headfootcolor!50!white]
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
                    text width={\dimexpr\paperwidth-2\sideWidth-2cm},
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
        \if@twocolumn\vspace{3em}\else\vspace{1.5em}\fi%
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
                \colorlet{currentcolor}{theoremColor}
            \or
                \colorlet{currentcolor}{definitionColor}
            \or
                \colorlet{currentcolor}{methodColor}
            \or
                \colorlet{currentcolor}{applicationColor}
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

    \newcommand{\neo@bubblescontent}{%
      \begin{tikzpicture}[remember picture,overlay]
        \def\ellipseWidth{20cm}
        \def\ellipseHeight{5cm}
        \def\numBubbles{500}
        \coordinate (ellipseCenter) at ([yshift=-4cm]current page.north);

        \foreach \i in {1,...,\numBubbles} {%
          \pgfmathsetmacro{\angle}{random()*360}
          \pgfmathsetmacro{\rawradius}{rand}
          \pgfmathsetmacro{\radius}{pow(\rawradius, 2)}
          \pgfmathsetmacro{\x}{\radius*\ellipseWidth/2.25*cos(\angle)}
          \pgfmathsetmacro{\y}{\radius*\ellipseHeight/2.25*sin(\angle)}

          \pgfmathrandominteger{\sizeGroup}{1}{3}
          \ifnum\sizeGroup=1
            \pgfmathsetmacro{\bubbleRadius}{rand*12 + 5}
          \else\ifnum\sizeGroup=2
              \pgfmathsetmacro{\bubbleRadius}{rand*8 + 3}
            \else
              \pgfmathsetmacro{\bubbleRadius}{rand*4 + 1}
            \fi\fi

          \pgfmathsetmacro{\op}{0.4 + 0.2*rand}

          \pgfmathrandominteger{\col}{0}{4}
          \pgfmathrandominteger{\p}{50}{90}
          \neo@drawbubble{\op}{\col}{\p}{\op}
          {([xshift=\x, yshift=\y]ellipseCenter) circle (\bubbleRadius pt)}
        }

        \node[%
        anchor=north,
        align=center,
        inner sep=3mm,
        minimum width=0.5\linewidth,
        text opacity=1,
        draw opacity=0.85,
        fill=white,
        rounded corners=2pt,
        draw=\neoschool@headfootcolor,
        line width=0.4pt
        ] at ([yshift=0.5cm]ellipseCenter)
        {\csname\neoschool@titlestyle\endcsname\csname\neoschool@titleweight\endcsname\csname\neoschool@titleshape\endcsname
          \color{\neo@bubbles@colbubbles}\LARGE \@title};
      \end{tikzpicture}%
      \if@twocolumn\vspace{6cm}\else\vspace{11em}\fi%
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

%% Short Bubbles Header
\ifneo@shortbubbles
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
            \colorlet{currentcolor}{theoremColor}
        \or
            \colorlet{currentcolor}{definitionColor}
        \or
            \colorlet{currentcolor}{methodColor}
        \or
            \colorlet{currentcolor}{applicationColor}
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

    \newcommand{\neo@shortbubblescontent}{%
        \ifx\@subtitle\empty
            \setlength{\neo@headerheight}{7em}
        \else
            \setlength{\neo@headerheight}{8em}
        \fi

        \begin{tikzpicture}[remember picture,overlay]
            \def\myheight{4em}
            % Set dimensions of the ellipse
            \def\ellipseWidth{12cm}
            \def\ellipseHeight{3cm}
            \def\numBubbles{300}
            \coordinate (ellipseCenter) at ([yshift=-.9\neo@headerheight]current page text area.north);

            \foreach \i in {1,...,\numBubbles} {%
                \pgfmathsetmacro{\angle}{random()*360}
                \pgfmathsetmacro{\rawradius}{rand}
                \pgfmathsetmacro{\radius}{pow(\rawradius, 2)} % Non-linear distribution
                \pgfmathsetmacro{\x}{\radius * \ellipseWidth/2 * cos(\angle)}
                \pgfmathsetmacro{\y}{\radius * \ellipseHeight/2 * sin(\angle)}

                \pgfmathrandominteger{\sizeGroup}{1}{3}
                \ifnum\sizeGroup=1
                    \pgfmathsetmacro{\bubbleRadius}{rand*8 + 3}
                \else\ifnum\sizeGroup=2
                    \pgfmathsetmacro{\bubbleRadius}{rand*5 + 2}
                \else
                    \pgfmathsetmacro{\bubbleRadius}{rand*3 + 1}
                \fi\fi

                \pgfmathsetmacro{\op}{0.3 + 0.4*rand}

                \pgfmathrandominteger{\col}{0}{4}
                \pgfmathrandominteger{\p}{50}{90}
                \neo@drawbubble{\op}{\col}{\p}{\op}
                {([xshift=\x, yshift=\y]ellipseCenter) circle (\bubbleRadius pt)}
            }

            \node[\neoschool@titlecolor] at
            ([yshift=0.5\myheight]current page text area.north) (title) {%
                \LARGE\csname\neoschool@titlestyle\endcsname
                \csname\neoschool@titleweight\endcsname
                \csname\neoschool@titleshape\endcsname
                \@title
            };

            \ifx\@subtitle\empty\else
                \node[subtitleColor, below=0.3em of title] {%
                    \large\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\@subtitle
                };
            \fi
        \end{tikzpicture}%
        \if@twocolumn
            \vspace{1.75\neo@headerheight}%
        \else
            \vspace{1.5\neo@headerheight}%
        \fi
      }

    \AtBeginDocument{%
        \let\neo@oldmaketitle\maketitle
        \renewcommand{\maketitle}{%
            \if@twocolumn
                \twocolumn[\neo@shortbubblescontent]%
            \else
                \neo@shortbubblescontent
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
    boxrule=0.8pt
]
}

% Math highlighting with size adaptation
\newcommand{\mhl}[2][yellow]{%
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
            boxrule=1pt,
            arc=5pt,
            boxsep=0pt,
            width=#1,
            height=#2,
            colback=exerciseColor!5!white,
            frame hidden,
            before skip=.5\baselineskip,
            after skip=.5\baselineskip
        ]
        \null
    \end{tcolorbox}
}

% Answer field with line spacing
\newlength{\neo@answerbaselineskip}
\setlength{\neo@answerbaselineskip}{1.35\baselineskip}

\newcommand{\answerfield}[2][.975\linewidth]{%
    \vspace{0.25\baselineskip}%
    \noindent
    \colorbox{exerciseColor!5!white}{%
        \parbox{#1}{%
            \phantom{\rule{1pt}{#2\neo@answerbaselineskip}}
        }
    }
    \vspace{0.1cm}
}

% Answer field with frame and white background
\newcommand{\answerframe}[2][\linewidth]{%
    \noindent\par
    \begin{tcolorbox}[%
            enhanced,
            boxrule=0.8pt,
            colframe=exerciseColor!50,
            colback=white,
            width=#1,
            height=#2\neo@answerbaselineskip,
            nobeforeafter,
            arc=2pt,
            boxsep=0pt,
            left=2pt,
            right=2pt,
            top=2pt,
            bottom=2pt,
            before skip=.5\baselineskip,
            after skip=.5\baselineskip,
        ]
        \phantom{\rule{1pt}{#2\neo@answerbaselineskip}}
    \end{tcolorbox}
}

%% Solution and Application Boxes
%% ----------------------------------
% Solution box with fixed dimensions
\newcommand{\solutionbox}[3][\linewidth]{%
    \begin{tcolorbox}[%
            enhanced,
            boxrule=1pt,
            fontupper=\color{\neoschool@globalcolor},
            arc=5pt,
            boxsep=0mm,
            width=#1,
            height=#2,
            colback=solutionColor!5!white,
            frame hidden,
            before skip=0.5\baselineskip,
            after skip=\baselineskip
        ]
        #3
    \end{tcolorbox}
    \par%
}

% Colored box for applications
\newcommand{\neocolorbox}[2][applicationColor]{%
    \begin{tcolorbox}[%
            enhanced,
            fontupper=\color{\neoschool@globalcolor},
            boxrule=1pt,
            sharpish corners,
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
        boxrule=0.4pt,
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
\NewDocumentEnvironment{neobox}{ s O{} }{%
    \begin{tcolorbox}[%
            \IfBooleanTF{#1}{frame hidden}{},
            colframe=\neoschool@headcolor,
            colback=\neo@tcbcolback,
            enhanced,
            breakable,
            boxrule=1pt,
            arc=4pt,
            sharp corners,
            left=0.65em,
            right=0.65em,
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
\colorlet{neo@examplecomp}{-exampleColor}
\colorlet{neo@exampledark}{neo@examplecomp!50!black}

% Environment definition
\newtcolorbox{sidebyside}[1][]{%
    sidebyside,
    enhanced,
    bicolor,
    sharp corners,
    arc=1pt,
    colback=exampleColor!5,
    colbacklower=exampleColor!10,
    colframe=exampleColor!85!black,
    left=0pt,
    right=0pt,
    boxrule=1pt,
    fonttitle=\sffamily\bfseries,
    lefttitle=1.7mm,
    before skip=\baselineskip,
    after skip=\baselineskip,
    #1
}

%% ==============================================================================
%% Listings Styles and Setting
%% ==============================================================================

%% TColorBox Styles
%% ----------------------------------

%% Base Box Parameters
%% ----------------------------------
\tcbset{%
    neo@commonbox/.style={%
            enhanced,
            boxrule=\neo@thmborder,
            top=0pt,
            bottom=0pt,
            left=2mm,
            right=2mm,
            fonttitle=\small\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname,
            coltitle=\neo@tcbcolback,
            before skip=\baselineskip,
            after skip=\baselineskip
        }
}

%% Box Styles
%% ----------------------------------
\def\neo@notitle{notitle}

\tcbset{%
    box-classic/.style={%
            neo@commonbox,
            colback=white,
            colframe=codeColor,
            frame style={opacity=0.5},
            boxrule=0.5pt,
            arc=0pt,
            toptitle=2pt,
            bottomtitle=2pt,
            colbacktitle=white,
            coltitle=black,
            fonttitle=\sffamily
        },
    box-bottomtitle/.style={%
            neo@commonbox,
            enhanced,
            frame hidden,
            colback=white,
            colbacktitle=white,
            coltitle=black,
            fonttitle=\small\sffamily,
            attach boxed title to bottom center,
            bottom=0pt,
            boxed title style={%
                    frame hidden,
                    colframe=white,
                    top=0pt,
                }
        },
    box-bottomtitlef/.style={
            neo@commonbox,
            enhanced,
            colframe=codeColor,
            frame style={opacity=0.5},
            boxrule=0.5pt,
            colback=white,
            colbacktitle=white,
            coltitle=black,
            fonttitle=\small\sffamily,
            sharp corners,
            attach boxed title to bottom center,
            top=0pt,
            bottom=0pt,
            boxed title style={%
                    frame hidden,
                    colframe=white,
                    top=5pt
                }
        },
    box-fancy/.style={%
            neo@commonbox,
            colback=codebackColor,
            colframe=codeColor,
            arc=\neoschool@boxarc,
            toptitle=1pt,
            bottomtitle=2pt,
            colbacktitle=codeColor,
            drop fuzzy shadow
        },
    box-minimal/.style={%
            neo@commonbox,
            colback=white,
            colframe=codeColor,
            frame style={opacity=0.5},
            toptitle=2pt,
            bottomtitle=2pt,
            boxrule=0.3pt,
            arc=0pt,
            colbacktitle=white,
            coltitle=codeColor
        },
    box-elegant/.style={%
            neo@commonbox,
            colback=codebackColor,
            colframe=codeColor,
            toptitle=1pt,
            bottomtitle=2pt,
            sharp corners=all,
            drop fuzzy shadow
        },
    box-diagonal/.style={%
            neo@commonbox,
            colback=codebackColor,
            colframe=codeColor,
            toptitle=1pt,
            bottomtitle=2pt,
            arc=\neoschool@boxarc,
            sharp corners=southwest,
            sharp corners=northeast
        },
    box-bevel/.style={%
            neo@commonbox,
            colback=codebackColor,
            colframe=codeColor,
            toptitle=1pt,
            bottomtitle=2pt,
            arc=\neoschool@boxarc,
            sharp corners=southeast,
            sharp corners=northwest
        },
    box-corner/.style={%
            neo@commonbox,
            colback=codebackColor,
            colframe=codeColor,
            toptitle=1pt,
            bottomtitle=2pt,
            sharp corners=downhill,
            rounded corners=northeast,
            rounded corners=northwest,
            arc=\neoschool@boxarc
        },
    box-rounded/.style={%
            neo@commonbox,
            colback=codebackColor,
            colframe=codeColor,
            rounded corners,
            toptitle=1pt,
            bottomtitle=2pt,
            arc=\neoschool@boxarc,
        },
    box-downhill/.style={%
            neo@commonbox,
            colback=codebackColor,
            colframe=codeColor,
            sharp corners=downhill,
            arc=\neoschool@boxarc,
            top=0mm,
            bottom=0mm,
            fontupper=\color{\neoschool@globalcolor},
            attach boxed title to top right={yshift=-\tcboxedtitleheight},
            boxed title style={%
                    colback=codeColor,
                    colframe=codeColor,
                    sharp corners=downhill,
                    arc=.2cm,
                    top=1pt,
                    bottom=1pt,
                    left=2pt,
                    right=2pt
                },
        }
}

\ifneo@unicolor
    \def\neo@keywordstyle{\color{\neoschool@headcolor}\bfseries}
    \def\neo@commentstyle{\color{alternateColor}}
    \def\neo@stringstyle{\color{\neoschool@headcolor!85}}
    \def\neo@emphstyle{\color{\neoschool@headcolor}\bfseries}
\else
    \def\neo@keywordstyle{\color{codeKeyword}\bfseries}
    \def\neo@commentstyle{\color{codeComment}}
    \def\neo@stringstyle{\color{codeString}}
    \def\neo@emphstyle{\color{codeEmph}\bfseries}
\fi

\ifneo@listings

    %% Base Listing Style
    %% ----------------------------------
    \lstdefinestyle{neo@lst@base}{%
        basicstyle=\ttfamily\small,
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

    %% Common Style Elements
    %% ----------------------------------

    %% ==============================================================================
    %% Listings Styles and Settings - Part 2
    %% Defines specific listing styles and environments
    %% ==============================================================================

    %% Specific Listing Styles
    %% ----------------------------------
    % Style Colorful and variants
    \lstdefinestyle{neo@lst@colorful}{%
        style=neo@lst@base,
        keywordstyle=\neo@keywordstyle,
        commentstyle=\neo@commentstyle,
        stringstyle=\neo@stringstyle,
        emphstyle=\neo@emphstyle,
        numbers=none,
        numberstyle=\tiny\color{codeBackground},
        frame=none
    }

    % Variants with background color
    \lstdefinestyle{neo@lst@colorfulb}{%
        style=neo@lst@colorful,
        backgroundcolor=\color{codebackColor}
    }

    % Variants with line numbers
    \lstdefinestyle{neo@lst@colorfuln}{%
        style=neo@lst@colorful,
        numbers=left,
        numbersep=10pt
    }

    % Variants with line numbers and background
    \lstdefinestyle{neo@lst@colorfulbn}{%
        style=neo@lst@colorfulb,
        numbers=left,
        numbersep=10pt
    }

    % Variants with frame
    \lstdefinestyle{neo@lst@colorfulf}{%
        style=neo@lst@colorful,
        frame=single
    }

    % Variants with frame and background
    \lstdefinestyle{neo@lst@colorfulbf}{%
        style=neo@lst@colorfulb,
        frame=single
    }

    % Variants with frame and numbers
    \lstdefinestyle{neo@lst@colorfulfn}{%
        style=neo@lst@colorfuln,
        frame=single
    }

    % Variants with all options
    \lstdefinestyle{neo@lst@colorfulbfn}{%
        style=neo@lst@colorfulbn,
        frame=single
    }

    %% Minimal Style and Variants
    %% ----------------------------------
    \lstdefinestyle{neo@lst@minimal}{%
        style=neo@lst@base,
        keywordstyle=\ifneo@unicolor\color{\neoschool@headcolor}\fi\bfseries,
        commentstyle=\ifneo@unicolor\color{\neoschool@headcolor}\fi,
        stringstyle=\ifneo@unicolor\color{\neoschool@headcolor}\else\ttfamily\fi,
        emphstyle=\ifneo@unicolor\color{\neoschool@headcolor}\else\bfseries\fi,
        numbers=none,
        frame=none,
    }

    % Define all variants using the same pattern as colorful styles
    \lstdefinestyle{neo@lst@minimalb}{style=neo@lst@minimal,backgroundcolor=\color{codebackColor}}
    \lstdefinestyle{neo@lst@minimaln}{style=neo@lst@minimal,numbers=left,numbersep=10pt}
    \lstdefinestyle{neo@lst@minimalbn}{style=neo@lst@minimalb,numbers=left,numbersep=10pt}
    \lstdefinestyle{neo@lst@minimalf}{style=neo@lst@minimal,frame=single}
    \lstdefinestyle{neo@lst@minimalbf}{style=neo@lst@minimalb,frame=single}
    \lstdefinestyle{neo@lst@minimalfn}{style=neo@lst@minimaln,frame=single}
    \lstdefinestyle{neo@lst@minimalbfn}{style=neo@lst@minimalbn,frame=single}

    %% Academic and Modern Styles
    %% ----------------------------------
    \lstdefinestyle{neo@lst@academic}{%
        style=neo@lst@base,
        keywordstyle=\ifneo@unicolor\color{\neoschool@headcolor}\fi\bfseries,
        commentstyle=\ifneo@unicolor\color{\neoschool@headcolor}\fi,
        stringstyle=\ifneo@unicolor\color{\neoschool@headcolor}\else\ttfamily\fi,
        numbers=left,
        numberstyle=\tiny,
        numbersep=12pt,
        frame=leftline,
        framesep=3pt,
        framexleftmargin=3pt,
        xleftmargin=15pt
    }

    \lstdefinestyle{neo@lst@modern}{%
        style=neo@lst@base,
        keywordstyle=\ifneo@unicolor\color{\neoschool@headcolor}\else\color{codeKeyword}\fi\bfseries,
        commentstyle=\ifneo@unicolor\color{\neoschool@headcolor}\else\color{codeComment}\fi,
        stringstyle=\ifneo@unicolor\color{\neoschool@headcolor}\else\color{codeString}\fi,
        numbers=none,
        frame=single,
        framerule=1pt,
        framesep=3pt,
        rulecolor=\ifneo@unicolor\color{\neoschool@headcolor}\else\color{codeKeyword}\fi,
        backgroundcolor=\ifneo@unicolor\color{codebackColor}\else\color{codeKeyword!5}\fi,
        framesep=7pt,
        xleftmargin=1em,
        linewidth={\dimexpr \linewidth-10pt},
    }

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
        style=neo@lst@\neoschool@lststyle,
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
        style=neo@lst@\neoschool@lststyle,
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
        style=neo@lst@\neoschool@lststyle,
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
        style=neo@lst@\neoschool@lststyle,
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
        style=neo@lst@\neoschool@lststyle,
        morekeywords={%
                CREATE,TABLE,INSERT,INTO,VALUES,
                SELECT,FROM,WHERE,GROUP,BY,HAVING,
                ORDER,LIMIT,JOIN,LEFT,RIGHT,INNER,
                UPDATE,SET,DELETE,ALTER,DROP,
                CONSTRAINT,PRIMARY,KEY,FOREIGN,
                REFERENCES,CASCADE,INDEX
            },
        sensitive=false,
    }

    \lstdefinestyle{latex}{%
        language=[latex]TeX,
        style=neo@lst@\neoschool@lststyle,
        texcsstyle=*\bfseries\color{codeKeyword},
        moretexcs = {tableofcontents,index,footnote,sout,part,chapter,subsection,subsubsection,paragraph,maketitle,leqslant,geqslant,varnothing,includegraphics,draw,node,theoremstyle,newtcolorbox,tcbuselibrary,newtcbtheorem,SI,ang,ce,chemfig,norm,abs,deriv,R,N,Z,ProvidesPackage,color,ps,montitre,lstset,lstinline,lstinputlisting,definecolor,textcolor,colorlet,setlength,colorbox,fcolorbox,addplot,pgfplotsset,opadd,opsub,opmul,opdiv,opgcd,metre,second,squared,kelvin,coulomb,volt,per,opprint,legend,tkzDefPoint,tkzInterLL,tkzGetPoint,tkzDrawPolygon,tkzDrawSegments,tkzMarkRightAngles,tkzMarkSegments,tkzLabelPoints,boxed,boldsymbol,boldmath,multirow,addbibresource,printbibliography,bm,dfrac,meter,thead,makecell,euro,cellcolor,rowcolor,columncolor,base,repere,rog,ron,rond,derpart,drv,integrer,nuplet,anuplet,ensemble,E,V,suite,suitar,suitgeo,vect,norme,tr,rank,adj,sgn,im,di,intabfx,integrale,e,moinsinf,plusinf,sisetup,restoregeometry,newgeometry,lefttitle,righttitle,colbacklower,neoheader,neograph,textwithimage,withqrcode,positionobject,splitcontent,grid,customgrid,frenchgrid,notebook,nbminorgrid,nbmajorgrid},
        emph={width,axis~lines,xlabel,ylabel,xmin,ymin,grid,domain,samples,displayshiftintermediary,colback,colframe,colbacktitle,coltitle,enhanced,,fonttitle,margin,leftmargin,publisher,year,carrysub,lastcarry,locale,xmax,ymax,coordinates,mark,style,hmargin,vmargin,top,bottom,left,right,showframe,includeheadfoot,opacity,fill,above,},
        morecomment=[l]{\%},
        morestring=[b]",
        sensitive=true
    }

    \lstdefinestyle{bash}{%
        language=bash,
        style=neo@lst@\neoschool@lststyle,
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
    style=neo@lst@\neoschool@lststyle,
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
        style=neo@lst@\neoschool@lststyle,
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
        style=neo@lst@\neoschool@lststyle,
        language=json,
    }

    \lstdefinestyle{yaml}{%
        style=neo@lst@\neoschool@lststyle,
        language=yaml,
    }

    \lstdefinestyle{toml}{%
        style=neo@lst@\neoschool@lststyle,
        language=toml,
    }

    \lstdefinestyle{csv}{%
        style=neo@lst@\neoschool@lststyle,
        language=csv,
    }

    \lstdefinestyle{markdown}{%
        style=neo@lst@\neoschool@lststyle,
        language=markdown,
    }

    %% Environment Definitions
    %% ----------------------------------
    % Counter for code listings
    \newcounter{lstcode}

    % Code listing environment
    \NewTCBListing[use counter=lstcode]{code}{ O{} m !O{} !O{} }{%
        listing only,
        enhanced,
        breakable,
        listing options={%
                style=#2,
                #1
            },
        code={%
                \IfEqCase{#4}{%
                    {}{\tcbset{%
                                standard jigsaw,
                                opacityback=0,
                                opacityframe=0,
                                frame hidden,
                                boxrule=0pt,
                                left=0pt,
                                right=0pt,
                                top=0pt,
                                bottom=0pt,
                                title={},
                                notitle
                            }}
                        {box-minimal}{\tcbset{box-minimal}}
                        {box-fancy}{\tcbset{box-fancy}}
                        {box-classic}{\tcbset{box-classic}}
                        {box-elegant}{\tcbset{box-elegant}}
                        {box-diagonal}{\tcbset{box-diagonal}}
                        {box-bevel}{\tcbset{box-bevel}}
                        {box-corner}{\tcbset{box-corner}}
                        {box-rounded}{\tcbset{box-rounded}}
                        {box-downhill}{\tcbset{box-downhill}}
                        {box-bottomtitle}{\tcbset{box-bottomtitle}}
                        {box-bottomtitlef}{\tcbset{box-bottomtitlef}}
                }[\PackageError{code}{Style not found: #4}{}]
                \ifx\relax#3\relax\else
                    \tcbset{title={\lstlistingname~\thelstcode~~\textemdash{}~~#3},\neoschool@boxtitle}
                \fi
            }
    }

    % Style selector command
    \newcommand{\setcodestyle}[1]{%
        \renewcommand{\neoschool@lststyle}{#1}
    }

    % Default style
    \AtBeginDocument{%
        \ifneo@listings
            \lstset{style=neo@lst@\neoschool@lststyle}
        \else
            \PackageWarning{neoschool}{The 'listings' package is not enabled, lststyle option will be ignored.}
        \fi
    }

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
    \NewTCBInputListing{\codeinput}{ O{} m m !O{} !O{} }{%
        listing file={#3},
        listing only,
        boxrule=0pt,
        enhanced,
        breakable,
        listing file={#3},
        listing options={%
                style={#2},
                #1
            },
        frame hidden,
        colback=codebackColor,
        boxrule=0pt,
        left=0pt,
        right=0pt,
        top=0pt,
        bottom=0pt,
        code={%
                \IfEqCase{#5}{%
                    {}{\tcbset{%
                                standard jigsaw,
                                opacityback=0,
                                opacityframe=0,
                                frame hidden,
                                boxrule=0pt,
                                left=0pt,
                                right=0pt,
                                top=0pt,
                                bottom=0pt,
                                title={},
                                notitle
                            }}
                        {box-minimal}{\tcbset{box-minimal}}
                        {box-fancy}{\tcbset{box-fancy}}
                        {box-classic}{\tcbset{box-classic}}
                        {box-elegant}{\tcbset{box-elegant}}
                        {box-diagonal}{\tcbset{box-diagonal}}
                        {box-bevel}{\tcbset{box-bevel}}
                        {box-corner}{\tcbset{box-corner}}
                        {box-rounded}{\tcbset{box-rounded}}
                        {box-downhill}{\tcbset{box-downhill}}
                        {box-bottomtitle}{\tcbset{box-bottomtitle}}
                        {box-bottomtitlef}{\tcbset{box-bottomtitlef}}
                }[\PackageError{code}{Style not found: #5}{}]
                \ifx\relax#4\relax\else
                    \tcbset{title={\neo@codename~\thelstcode~~\textemdash{}~~#4},\neoschool@boxtitle}
                \fi
            }
    }

    %% Side-by-Side Code Environment
    %% ----------------------------------
    \newtcblisting{codeside}[2][]{%
        standard jigsaw,
        enhanced,
        breakable,
        opacityback=0,
        opacityframe=0,
        fonttitle=\sffamily\bfseries,
        listing only,
        arc=1pt,
        colback=codebackColor,
        colframe=codeColor,
        left=0pt,
        right=0pt,
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

        % Define the minted style
        \setminted{
            style=vs,
            fontsize=\small,
            breaklines=true,
            autogobble,
            frame=none,
            linenos=false,
            tabsize=4,
        }

        % Code listing environment
        \NewTCBListing[use counter=mintcode]{code}{ O{} m !O{} !O{} }{%
            listing engine=minted,
            minted language=#2,
            listing only,
            enhanced,
            breakable,
            minted options={#1},
            code={%
                    \IfEqCase{#4}{%
                        {}{\tcbset{%
                                    standard jigsaw,
                                    opacityback=0,
                                    opacityframe=0,
                                    frame hidden,
                                    boxrule=0pt,
                                    left=0pt,
                                    right=0pt,
                                    top=0pt,
                                    bottom=0pt,
                                    title={},
                                    notitle
                                }}
                            {box-minimal}{\tcbset{box-minimal}}
                            {box-fancy}{\tcbset{box-fancy}}
                            {box-classic}{\tcbset{box-classic}}
                            {box-elegant}{\tcbset{box-elegant}}
                            {box-diagonal}{\tcbset{box-diagonal}}
                            {box-bevel}{\tcbset{box-bevel}}
                            {box-corner}{\tcbset{box-corner}}
                            {box-rounded}{\tcbset{box-rounded}}
                            {box-downhill}{\tcbset{box-downhill}}
                            {box-bottomtitle}{\tcbset{box-bottomtitle}}
                            {box-bottomtitlef}{\tcbset{box-bottomtitlef}}
                    }[\PackageError{code}{Style not found: #4}{}]
                    \ifx\relax#3\relax\else
                        \tcbset{title={\neo@codename~\themintcode~~\textemdash{}~~#3},\neoschool@boxtitle}
                    \fi
                }
        }

        % Inline code command
        \newcommand{\codeinline}[2][text]{%
            \mintinline[style=vs,fontsize=\small,breaklines,autogobble]{#1}{#2}
        }

        % Code input from file
        \NewTCBInputListing{\codeinput}{ O{} m m !O{} !O{} }{%
            listing engine=minted,
            minted language={#2},
            enhanced,
            breakable,
            listing file={#3},
            listing only,
            minted options={#1},
            frame hidden,
            colback=codebackColor,
            boxrule=0pt,
            code={%
                    \IfEqCase{#5}{%
                        {}{\tcbset{%
                                    standard jigsaw,
                                    opacityback=0,
                                    opacityframe=0,
                                    frame hidden,
                                    boxrule=0pt,
                                    left=0pt,
                                    right=0pt,
                                    top=0pt,
                                    bottom=0pt,
                                    title={},
                                    notitle
                                }}
                            {box-minimal}{\tcbset{box-minimal}}
                            {box-fancy}{\tcbset{box-fancy}}
                            {box-classic}{\tcbset{box-classic}}
                            {box-elegant}{\tcbset{box-elegant}}
                            {box-diagonal}{\tcbset{box-diagonal}}
                            {box-bevel}{\tcbset{box-bevel}}
                            {box-corner}{\tcbset{box-corner}}
                            {box-rounded}{\tcbset{box-rounded}}
                            {box-downhill}{\tcbset{box-downhill}}
                            {box-bottomtitle}{\tcbset{box-bottomtitle}}
                            {box-bottomtitlef}{\tcbset{box-bottomtitlef}}
                    }[\PackageError{code}{Style not found: #5}{}]
                    \ifx\relax#4\relax\else
                        \tcbset{title={\neo@codename~\themintcode~~\textemdash{}~~#4},\neoschool@boxtitle}
                    \fi
                }
        }

        % Side-by-Side Code Environment
        \newtcblisting{codeside}[2][]{%
            standard jigsaw,
            listing engine=minted,
            enhanced,
            breakable,
            opacityback=0,
            opacityframe=0,
            fonttitle=\sffamily\bfseries,
            minted language=#2,
            arc=1pt,
            colback=codebackColor,
            colframe=codeColor,
            left=0pt,
            right=0pt,
            lefttitle=1.7mm,
            width=\linewidth,
            minted options={#1}
        }

    \fi
\fi

%% ==============================================================================
%% Algorithm and Pseudocode Environments
%% ==============================================================================

%% Algorithm Keywords Translation
%% ----------------------------------
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

%% Additional Algorithm Commands
%% ----------------------------------
\newcommand{\To}{\textbf{ à }}
\newcommand{\Gets}{\ensuremath{\leftarrow}}

%% Pseudocode Box Style
%% ----------------------------------
\tcbset{%
    pseudocode/.style={%
            enhanced,
            breakable,
            colback=white,
            colframe=\ifneo@unicolor\neoschool@headcolor\else\neoschool@headcolor!50\fi,
            boxrule=0.5pt,
            arc=0pt,
            top=3mm,
            bottom=3mm,
            left=3mm,
            right=3mm,
            colbacktitle=white,
            coltitle=black,
            fonttitle=\sffamily\bfseries,
            before upper={\begin{algorithmic}},
                        after upper={\end{algorithmic}},
            breakable
        }
}

%% Pseudocode Environment
%% ----------------------------------
\newtcolorbox[use counter=lstcode]{pseudocode}[2][]{%
    pseudocode,
    title={\csname neo@algorithmname\endcsname~\thelstcode~~\textemdash{}~~#2},
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
            fonttitle={\normalshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname},
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
    \ifneo@noback
        white%
    \else
        \neo@tcbcolback%
    \fi
}

\def\neo@getframestyle{%
    \ifneo@noframe
        frame hidden%
    \else\fi
}

\tcbset{
    neo@shared@base/.style args={#1}{%
            common@base,
            colframe=#1,
            colback=\neo@getbackcolor,
            boxrule=\neo@thmborder,
            \neo@getframestyle
        },
    neo@shared@elegant/.style args={#1}{%
            neo@shared@base={#1},
            common@title@base,
            skin=bicolor,
            sharp corners,
            detach title,
            left=1em,
            right=1em,
            top=\neo@toppadding,
            bottom=\neo@bottompadding,
            borderline west={4pt}{0pt}{#1},
            before upper={\tcbtitle\enskip}
        },
    neo@shared@shaded/.style 2 args={%
            neo@shared@base={#1},
            common@title@base,
            left=\neo@leftpadding,
            right=\neo@rightpadding,
            after skip=\neo@afterskip,
            before skip=\neo@beforeskip,
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
                    \path[draw=\csname neo@titledrawcolor@#2\endcsname,line width=1pt,
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
            after skip=\neo@afterskip,
            before skip=\neo@beforeskip,
            detach title
        },
    neo@shared@sober/.style args={#1}{%
            neo@shared@base={#1},
            common@title@base,
            skin=bicolor,
            detach title,
            left=1ex,
            right=1ex,
            separator sign={},
            terminator sign=,
        },
    neo@shared@classic/.style args={#1}{%
            neo@shared@base={#1},
            common@title@base,
            skin=bicolor,
            coltitle=white,
            colbacktitle=tcbcolframe,
            boxrule=1pt,
            toptitle=1mm,
            bottomtitle=1mm,
            left=1ex,
            right=1ex,
        },
    neo@shared@classy/.style args={#1}{%
            neo@shared@base={#1},
            common@title@base,
            skin=bicolor,
            left=1ex,
            right=1ex,
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
            after skip=\neo@afterskip,
            before skip=\neo@beforeskip,
            detach title,
            before upper*={%
                    \tcbox[enhanced,
                        colupper=white,
                        colback=#1,                        fontupper=\normalshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname,
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
                {\normalshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\color{#1}\getCustomBoxedTitle}
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

% Title Content Formatters
\NewDocumentCommand{\neo@theorem@title}{mm}{%
    \csname\neoschool@headstyle\endcsname
    \csname\neoschool@headweight\endcsname
    \color{#1}#2~\thetcbcounter
}

\NewDocumentCommand{\neo@exercise@title}{}{%
    \sffamily\GetExerciseName~\GetExerciseProperty{counter}%
    \IfExercisePropertySetT{level}{%
        \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
    }%
    \IfExercisePropertySetT{subtitle}{\enskip\GetExerciseProperty{subtitle}}%
    \IfExercisePropertySetT{points}{%
        \enskip(\GetExerciseProperty{points}%
        \IfExerciseGoalSingularTF{points}{\XSIMtranslate{point}}{\XSIMtranslate{points}})%
    }%
}

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
        \fi\fi
}

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
                fontupper=\normalshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname,
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
            {\normalshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\color{#4}\getCustomSlantedTitle}
        },
    fontupper={#7},
    before lower={#6},
    #8,
}{#5}
}

\NewDocumentCommand{\newshadedtheorem}{O{}mmmmmmO{}}{%
\expandafter\def\csname neo@titledrawcolor@#2\endcsname{#4}
\ifneo@noframe\expandafter\def\csname neo@titledrawcolor@#2\endcsname{white}\fi
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
    colback=white,
    coltitle={#4},
    left=0pt, right=0pt,
    top=0pt, bottom=0pt,
    boxsep=0pt,
    detach title,
    separator sign={},
    before upper={\tcbtitle\enskip},
    before skip=\baselineskip,
    after skip=\baselineskip,
    fontupper={#7},
    fonttitle={\normalshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname},
    before lower={#6},
    #8
}{#5}
}

\NewDocumentCommand{\newamsremarktheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
    enhanced,
    breakable,
    frame hidden,
    colback=white,
    coltitle={#4},
    left=0pt, right=0pt,
    top=0pt, bottom=0pt,
    boxsep=0pt,
    detach title,
    before upper={{\color{remarkColor}\csname\neoschool@headweight\endcsname\itshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname #3\enskip\textemdash}\enskip},
    before skip=.5\baselineskip,
    after skip=.5\baselineskip,
    fontupper={#7},
    #8
}{#5}
}

\NewDocumentCommand{\newamsremarkstheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
    enhanced,
    breakable,
    frame hidden,
    colback=white,
    coltitle={#4},
    left=0pt, right=0pt,
    top=0pt, bottom=0pt,
    boxsep=0pt,
    detach title,
    before upper={{\color{remarkColor}\csname\neoschool@headweight\endcsname\itshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headshape\endcsname #3}\enskip},
    before skip=.5\baselineskip,
    after skip=.5\baselineskip,
    fontupper={#7},
    #8
}{#5}
}

\NewDocumentCommand{\newamsexampletheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
    enhanced,
    breakable,
    frame hidden,
    colback=white,
    coltitle={#4},
    left=0pt, right=0pt,
    top=0pt, bottom=0pt,
    boxsep=0pt,
    detach title,
    separator sign={},
    before upper={\tcbtitle\enskip},
    before skip=.5\baselineskip,
    after skip=.5\baselineskip,
    fontupper={#7},
    fonttitle={\normalshape\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname},
    before lower={#6},
    #8
}{#5}
}

\NewDocumentCommand{\newamsexamplestheorem}{O{}mmmmmmO{}}{%
\mynewtcbtheorem[#1]{#2}{#3}{%
    enhanced,
    breakable,
    frame hidden,
    colback=white,
    coltitle={#4},
    left=0pt, right=0pt,
    top=0pt, bottom=0pt,
    boxsep=0pt,
    detach title,
    before upper={{\color{exampleColor}\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname #3}\enskip},
    before skip=.5\baselineskip,
    after skip=.5\baselineskip,
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
\neo@declaretheorem{conjecture}{\neo@conjecturename}{\neo@conjecturecolor}{conj}{}{\itshape\color{\neoschool@globalcolor}}
\neo@declaretheorem{property}{\neo@propertyname}{propertyColor}{prop}{}{\itshape\color{\neoschool@globalcolor}}

% Activity-related theorems
\neo@declaretheorem{activity}{\neo@activityname}{activityColor}{act}{}{\color{\neoschool@globalcolor}}
\neo@declaretheorem{method}{\neo@methodname}{methodColor}{meth}{}{\color{\neoschool@globalcolor}}
\neo@declaretheorem{application}{\neo@applicationname}{applicationColor}{appl}{}{\color{\neoschool@globalcolor}}

%% ==============================================================================
%% Exercise Common Elements
%% ==============================================================================

% QCM Environment Setup
\DeclareExerciseEnvironmentTemplate{item}
{\description\item[\GetExerciseProperty{counter}]}
{\enddescription}

% Multiple Choice Elements
\DeclareRobustCommand{\neocolorcirc}[2]{%
    \begin{tikzpicture}[baseline=-1.25mm]
        \draw[#1,fill=#2] (0.5,0) circle (.75ex);
    \end{tikzpicture}
}

\newcommand{\neocheckbox}{$\square$}
\newcommand{\neochecksol}{$\blacksquare$}
\newcommand{\neocheckcirc}{\neocolorcirc{black}{white}}

% Task Environments
\NewTasksEnvironment[%
    label = \neocheckcirc,
    label-width = 12pt,
    item-indent = 3.5em,
]{choices}[\choice]

\NewTasksEnvironment[%
    label = \neocheckbox,
    label-width = 12pt,
    item-indent = 3.5em,
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
    {\ifneoschool@answers\neochecksol\else\neocheckbox\fi}
    {\ifneoschool@answers\neocolorcirc{black}{black}\else\neocheckcirc\fi}%
}

%% ==============================================================================
%% Exercise Base Box Styles
%% ==============================================================================

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
    % Title base style
    neo@title@base/.style={%
            title={\sffamily\GetExerciseName~\GetExerciseProperty{counter}
                    \IfExercisePropertySetT{level}
                    {\enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}
                    \IfExercisePropertySetT{subtitle}{ \GetExerciseProperty{subtitle}}
                    \IfExercisePropertySetT{points}{%
                        \enskip(%
                        \GetExerciseProperty{points}
                        \IfExerciseGoalSingularTF{points}
                        {~\XSIMtranslate{point}}
                        {~\XSIMtranslate{points}}
                        )
                    }
                }
        }
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
            before skip=\baselineskip,
            after skip=\baselineskip,
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
            colback=\neo@tcbcolback
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
            boxrule=0.5pt
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
        \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]
    }
    \IfExercisePropertySetT{subtitle}{ \GetExerciseProperty{subtitle}}\enskip
    \IfExercisePropertySetT{points}{%
        (\GetExerciseProperty{points}
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

% Standard Box Template
\DeclareExerciseEnvironmentTemplate{box}{%
    \begin{tcolorbox}[%
            neo@box@base,
            skin=bicolor,
            neo@frame@basic,
            neo@corners@sharp,
            neo@rule@left,
            neo@title@basic
        ]
        {%
            \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\color{exerciseColor}
            {\small\neo@exerciseicon}\enskip
            \MakeUppercase{%
                \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}
                \IfExercisePropertySetT{level}{%
                    \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]
                }
            }
            \GetExercisePropertyT{subtitle}{\;(\textit{#1})}
            {\color{exerciseColor}
                \IfExercisePropertySetT{points}{\enskip%
                    \GetExerciseProperty{points}
                    \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]\;}
                    \IfExerciseGoalSingularTF{points}
                    {~\XSIMtranslate{point}}
                    {~\XSIMtranslate{points}}
                    \enskip\enskip\textemdash{}
                }
            }
        }
        \enskip
        }{\end{tcolorbox}}

% No Frame Box Template
\DeclareExerciseEnvironmentTemplate{noframe-box}{%
    \begin{tcolorbox}[%
            neo@box@base,
            neo@frame@hidden,
            neo@title@basic
        ]
        }{\end{tcolorbox}}

%% ==============================================================================
%% Advanced Box Templates
%% ==============================================================================

% Elegant Box Template
\DeclareExerciseEnvironmentTemplate{elegant-box}{%
    \begin{tcolorbox}[
            neo@shared@elegant={exerciseColor},
            title={%
                    \csname\neoschool@headstyle\endcsname
                    \csname\neoschool@headweight\endcsname
                    \color{exerciseColor}
                    {\small\neo@exerciseicon}%
                    \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
                    \IfExercisePropertySetT{level}{%
                        \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
                    }%
                    \IfExercisePropertySetT{subtitle}{{\itshape\enskip\GetExerciseProperty{subtitle}}}%
                    \IfExercisePropertySetT{points}{%
                        \enskip(\GetExerciseProperty{points}%
                        \IfExerciseGoalSingularTF{points}{~\XSIMtranslate{point}}{~\XSIMtranslate{points}})%
                    }%
                }
        ]
        }{\end{tcolorbox}}

% Shaded Box Template
\DeclareExerciseEnvironmentTemplate{shaded-box}{%
    \expandafter\def\csname neo@titledrawcolor@exercise\endcsname{exerciseColor}
    \ifneo@noframe
        \expandafter\def\csname neo@titledrawcolor@exercise\endcsname{white}
    \fi
    \begin{tcolorbox}[
            neo@shared@shaded={exerciseColor}{exercise},
            left=0.65em,
            right=0.65em,
            coltitle=exerciseColor,
            title={%
                    \vspace*{0.35em}%
                    \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\color{exerciseColor}%
                    {\small\neo@exerciseicon}%
                    \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
                    \IfExercisePropertySetT{level}{%
                        \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
                    }%
                    \IfExercisePropertySetT{subtitle}{{\itshape\enskip\GetExerciseProperty{subtitle}}}%
                    \IfExercisePropertySetT{points}{%
                        \enskip(\GetExerciseProperty{points}%
                        \IfExerciseGoalSingularTF{points}{~\XSIMtranslate{point}}{~\XSIMtranslate{points}})%
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
                ]{\csname\neoschool@headstyle\endcsname
                    \csname\neoschool@headweight\endcsname
                    \csname\neoschool@headshape\endcsname
                    {\small\neo@exerciseicon}%
                    \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
                }
            }
        ]
        {\csname\neoschool@headstyle\endcsname
        \csname\neoschool@headweight\endcsname
        \csname\neoschool@headshape\endcsname
        \color{exerciseColor}
        \IfExercisePropertySetT{level}{%
        \;[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
        }%
        \IfExercisePropertySetT{subtitle}{{\enskip\GetExerciseProperty{subtitle}}}%
        \IfExercisePropertySetT{points}{%
            \enskip(\GetExerciseProperty{points}%
            \IfExerciseGoalSingularTF{points}{~\XSIMtranslate{point}}{~\XSIMtranslate{points}})%
        }%
        }\;%
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
                    \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
                    \IfExercisePropertySetT{level}{%
                        \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
                    }%
                    \IfExercisePropertySetT{subtitle}{{\itshape\enskip\GetExerciseProperty{subtitle}}}%
                    \IfExercisePropertySetT{points}{%
                        \enskip(\GetExerciseProperty{points}%
                        \IfExerciseGoalSingularTF{points}{~\XSIMtranslate{point}}{~\XSIMtranslate{points}})%
                    }%
                }
        ]
        }{\end{tcolorbox}}

% Classic Box Template
\DeclareExerciseEnvironmentTemplate{classic-box}{%
    \begin{tcolorbox}[
            neo@shared@classic={exerciseColor},
            title={%
                    \csname\neoschool@headstyle\endcsname
                    \csname\neoschool@headweight\endcsname
                    \color{white}
                    {\small\neo@exerciseicon}%
                    \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
                    \IfExercisePropertySetT{level}{%
                        \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
                    }%
                    \IfExercisePropertySetT{subtitle}{{\itshape\enskip\GetExerciseProperty{subtitle}}}%
                    \IfExercisePropertySetT{points}{%
                        \enskip(\GetExerciseProperty{points}%
                        \IfExerciseGoalSingularTF{points}{~\XSIMtranslate{point}}{~\XSIMtranslate{points}})%
                    }%
                }
        ]
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
                        \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
                    }%
                    \IfExercisePropertySetT{subtitle}{{\itshape\enskip\GetExerciseProperty{subtitle}}}%
                    \IfExercisePropertySetT{points}{%
                        \enskip(\GetExerciseProperty{points}%
                        \IfExerciseGoalSingularTF{points}{~\XSIMtranslate{point}}{~\XSIMtranslate{points}})%
                    }%
                }
        ]
        }{\end{tcolorbox}}

% Rect and Num box Templates
\DeclareExerciseEnvironmentTemplate{rect-box}{%
    \begin{tcolorbox}[
        enhanced,
        skin=bicolor,
        sharp corners,
        \neo@framehidden,
        coltitle=white,
        colframe=exerciseColor,
        colback=\neo@tcbcolback,
        colupper=\neoschool@globalcolor,
        fonttitle=\csname\neoschool@headweight\endcsname,
        fontupper=\color{\neoschool@globalcolor},
        left=\neo@leftpadding,
        right=\neo@rightpadding,
        after skip=\neo@afterskip,
        before skip=\neo@beforeskip,
        before upper*={%
                \tcbox[enhanced,
                    colupper=white,
                    colback=exerciseColor,
                    fontupper=\csname\neoschool@headweight\endcsname,
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
        \csname\neoschool@headstyle\endcsname
        \csname\neoschool@headweight\endcsname
        \csname\neoschool@headshape\endcsname
        \color{exerciseColor}
        \IfExercisePropertySetT{level}
        {\;[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
        \IfExercisePropertySetT{subtitle}{{\enskip\GetExerciseProperty{subtitle}}}%
        \IfExercisePropertySetT{points}{%
            \enskip(\GetExerciseProperty{points}%
            \IfExerciseGoalSingularTF{points}{\,point}{\,points})\;%
        }%
        }
        \!%
        }{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{rect-box-outlined}{%
    \begin{tcolorbox}[
            enhanced,
            skin=bicolor,
            sharp corners,
            \neo@framehidden,
            coltitle=exerciseColor,
            colframe=exerciseColor,
            colback=white,
            colupper=\neoschool@globalcolor,
            fonttitle=\csname\neoschool@headweight\endcsname,
            fontupper=\color{\neoschool@globalcolor},
            left=\neo@leftpadding,
            right=\neo@rightpadding,
            after skip=\neo@afterskip,
            before skip=\neo@beforeskip,
            before upper*={%
                    \tcbox[enhanced,
                        colupper=exerciseColor,
                        colback=white,
                        colframe=exerciseColor,
                        fontupper=\csname\neoschool@headweight\endcsname,
                        size=small,
                        baseline=3pt,
                        top=0pt,
                        bottom=0pt,
                        left=1pt,
                        right=1pt,
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
        {  \csname\neoschool@headstyle\endcsname
            \csname\neoschool@headweight\endcsname
            \csname\neoschool@headshape\endcsname
            \color{exerciseColor}
            \IfExercisePropertySetT{level}
            {\enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
            \IfExercisePropertySetT{subtitle}{{\enskip\GetExerciseProperty{subtitle}}}%
            \IfExercisePropertySetT{points}{%
                \enskip(\GetExerciseProperty{points}%
                \IfExerciseGoalSingularTF{points}{\,point-short}{\,points-short})%
            }%
        }\enskip
        }{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{num-box}{%
    \begin{tcolorbox}[
            enhanced,
            skin=bicolor,
            sharp corners,
            before skip=-.25\baselineskip,
            after skip=-.25\baselineskip,
            frame hidden,
            colframe=\neoschool@headcolor,
            colback=white,
            colupper=\neoschool@globalcolor,
            fontupper=\color{\neoschool@globalcolor},
            enlarge left by=-.5\leftmargin,
            enlarge right by=-.5\rightmargin,
            width=\textwidth+\leftmargin+\rightmargin,
            before upper*={%
                    \tcbox[enhanced,
                        colupper=white,
                        colback=\neoschool@headcolor,
                        fontupper=\csname\neoschool@headweight\endcsname,
                        size=small,
                        baseline=4pt,
                        top=1pt,
                        bottom=1pt,
                        left=1pt,
                        right=1pt,
                        nobeforeafter,
                        frame code={%
                                \path[fill=tcbcolback] (frame.north west) -- (frame.north east)
                                -- (frame.south east) -- (frame.south west) -- cycle;
                            }]%
                    {%
                        \csname\neoschool@headstyle\endcsname
                        \csname\neoschool@headweight\endcsname
                        {\small\neo@exerciseicon}%
                        \GetExerciseProperty{counter}%
                    }%
                }
        ]%
        {\csname\neoschool@headstyle\endcsname
            \csname\neoschool@headweight\endcsname
            \color{exerciseColor}
            \IfExercisePropertySetT{level}
            {\enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
            \IfExercisePropertySetT{subtitle}{{\itshape\enskip\GetExerciseProperty{subtitle}}}%
            \IfExercisePropertySetT{points}{%
                \;(\GetExerciseProperty{points}%
                \IfExerciseGoalSingularTF{points}{\,point-short}{\,points-short})%
            }%
        }%
        \enskip
        }{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{num-box-outlined}{%
    \begin{tcolorbox}[
            enhanced,
            skin=bicolor,
            sharp corners,
            before skip=-.25\baselineskip,
            after skip=-.25\baselineskip,
            colframe=exerciseColor,
            colback=white,
            colupper=\neoschool@globalcolor,
            fontupper=\color{\neoschool@globalcolor},
            enlarge left by=-.5\leftmargin,
            enlarge right by=-.5\rightmargin,
            width=\textwidth+\leftmargin+\rightmargin,
            before upper*={%
                    \tcbox[enhanced,
                        colupper=exerciseColor,
                        colback=white,
                        colframe=exerciseColor,
                        fontupper=\csname\neoschool@headweight\endcsname,
                        size=small,
                        baseline=4pt,
                        top=1pt,
                        bottom=1pt,
                        left=1pt,
                        right=1pt,
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
        {\csname\neoschool@headstyle\endcsname
            \csname\neoschool@headweight\endcsname
            \color{exerciseColor}
            \IfExercisePropertySetT{level}
            {\enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
            \IfExercisePropertySetT{subtitle}{{\itshape\enskip\GetExerciseProperty{subtitle}}}%
            \IfExercisePropertySetT{points}{%
                \;(\GetExerciseProperty{points}%
                \IfExerciseGoalSingularTF{points}{\,point-short}{\,points-short})%
            }%
        }%
        \enskip
        }{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{ex-num-box}{%
    \begin{tcolorbox}[
            enhanced,
            skin=bicolor,
            sharp corners,
            before skip=-.25\baselineskip,
            after skip=-.25\baselineskip,
            frame hidden,
            colframe=\neoschool@headcolor,
            colback=white,
            colupper=\neoschool@globalcolor,
            fontupper=\color{\neoschool@globalcolor},
            enlarge left by=-.5\leftmargin,
            enlarge right by=-.5\rightmargin,
            width=\textwidth+\leftmargin+\rightmargin,
            before upper*={%
                    \tcbox[enhanced,
                        colupper=white,
                        colback=\neoschool@headcolor,
                        fontupper=\csname\neoschool@headweight\endcsname,
                        size=small,
                        baseline=4pt,
                        top=1pt,
                        bottom=1pt,
                        left=1pt,
                        right=1pt,
                        nobeforeafter,
                        frame code={%
                                \path[fill=tcbcolback] (frame.north west) -- (frame.north east)
                                -- (frame.south east) -- (frame.south west) -- cycle;
                            }]%
                    {%
                        \csname\neoschool@headstyle\endcsname
                        \csname\neoschool@headweight\endcsname
                        {\small\neo@exerciseicon}%
                        Ex.~\GetExerciseProperty{counter}%
                    }%
                }
        ]%
        {\csname\neoschool@headstyle\endcsname
            \csname\neoschool@headweight\endcsname
            \color{exerciseColor}
            \IfExercisePropertySetT{level}
            {\enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
            \IfExercisePropertySetT{subtitle}{{\itshape\enskip\GetExerciseProperty{subtitle}}}%
            \IfExercisePropertySetT{points}{%
                \;(\GetExerciseProperty{points}%
                \IfExerciseGoalSingularTF{points}{\,point-short}{\,points-short})%
            }%
        }%
        \enskip
        }{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{ex-num-box-outlined}{%
    \begin{tcolorbox}[
            enhanced,
            skin=bicolor,
            sharp corners,
            before skip=-.25\baselineskip,
            after skip=-.25\baselineskip,
            colframe=exerciseColor,
            colback=white,
            colupper=\neoschool@globalcolor,
            fontupper=\color{\neoschool@globalcolor},
            enlarge left by=-.5\leftmargin,
            enlarge right by=-.5\rightmargin,
            width=\textwidth+\leftmargin+\rightmargin,
            before upper*={%
                    \tcbox[enhanced,
                        colupper=exerciseColor,
                        colback=white,
                        colframe=exerciseColor,
                        fontupper=\csname\neoschool@headweight\endcsname,
                        size=small,
                        baseline=4pt,
                        top=1pt,
                        bottom=1pt,
                        left=1pt,
                        right=1pt,
                        nobeforeafter,
                    ]%
                    {%
                        \csname\neoschool@headstyle\endcsname
                        \csname\neoschool@headweight\endcsname
                        {\small\neo@exerciseicon}%
                        Ex.~\GetExerciseProperty{counter}%
                    }%
                }
        ]%
        {\csname\neoschool@headstyle\endcsname
            \csname\neoschool@headweight\endcsname
            \color{exerciseColor}
            \IfExercisePropertySetT{level}
            {\enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
            \IfExercisePropertySetT{subtitle}{{\itshape\enskip\GetExerciseProperty{subtitle}}}%
            \IfExercisePropertySetT{points}{%
                \;(\GetExerciseProperty{points}%
                \IfExerciseGoalSingularTF{points}{\,point-short}{\,points-short})%
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
    \par\vspace{3.25ex plus 1ex minus .2ex}
    \Needspace*{3\baselineskip}%
    \noindent
    {\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname
        \tcbox[on line,boxsep=-2pt,boxrule=0.4pt,left=7pt,right=7pt,colframe=exerciseColor,colback=exerciseColor,sharp corners, rounded corners = southeast]{\color{white}{\small\neo@exerciseicon}\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}}%
        \color{exerciseColor}
        \IfExercisePropertySetT{level}
        {\enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
        \IfInsideSolutionF{%
            \GetExercisePropertyT{subtitle}{{\itshape\enskip{\PropertyValue}\enskip}}%
        }%
        \hspace{-1pt}\xrfill[.085cm]{1.2pt}[exerciseColor]\hspace{-1pt}%
        {\color{exerciseColor}\footnotesize\lchevrons}%
        {%
            \IfExercisePropertySetT{points}{\bfseries\color{exerciseColor}\enskip%
                \GetExerciseProperty{points}
                \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]\;}%
                \IfExerciseGoalSingularTF{points}
                {\XSIMtranslate{point}}
                {\XSIMtranslate{points}}%
            }%
        }%
    }%
    \par\vspace{1.5ex plus .2ex}
    \@afterindentfalse\@afterheading
}{}

%%% Horizontal Rule with Boxed Title - Outlined

\DeclareExerciseEnvironmentTemplate{box-hrule-out}{%
    \par\vspace{3.25ex plus 1ex minus .2ex}
    \Needspace*{3\baselineskip}%
    {\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\tcbox[on line,boxsep=-2pt,boxrule=1.2pt,left=7pt,right=7pt,colframe=exerciseColor,colback=white,sharp corners,
            rounded corners = east,arc=5pt
        ]{\color{exerciseColor}{\small\neo@exerciseicon}\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}}%
        \color{exerciseColor}%
        \IfExercisePropertySetT{level}
        {\enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
        \IfInsideSolutionF{%
            \GetExercisePropertyT{subtitle}{{\itshape\enskip{\PropertyValue}}}%
        }%
        \hspace{-1pt}\xrfill[.085cm]{1.2pt}[exerciseColor]\hspace{-1pt}%
        % \!\!{\color{exerciseColor}\small\lcircle}%
        {\color{exerciseColor}\footnotesize\lchevrons}%
        {\bfseries\color{exerciseColor}%
            \IfExercisePropertySetT{points}{\enskip%
                \GetExerciseProperty{points}
                \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]\;}%
                \IfExerciseGoalSingularTF{points}
                {\XSIMtranslate{point}}
                {\XSIMtranslate{points}}%
            }%
        }%
    }%
    \par\vspace{1.5ex plus .2ex}
    \@afterindentfalse\@afterheading
}{}

\DeclareExerciseEnvironmentTemplate{box-hrule-in}{%
    \par\vspace{3.25ex plus 1ex minus .2ex}
    \Needspace*{3\baselineskip}%
    \noindent
    {\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\color{exerciseColor}%
        \tcbox[on line,boxsep=-2pt,boxrule=1.2pt,left=7pt,right=7pt,colframe=exerciseColor,colback=white,sharp corners,
            rounded corners = west,arc=5pt
        ]{\color{exerciseColor}{\small\neo@exerciseicon}\XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}}%
        \color{exerciseColor}
        \IfExercisePropertySetT{level}
        {\enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
        \IfInsideSolutionF{%
            \GetExercisePropertyT{subtitle}{{\itshape\enskip{\PropertyValue}}}%
        }%
        \hspace{-1pt}\xrfill[.085cm]{1.2pt}[exerciseColor]\hspace{-1pt}%
        {\color{exerciseColor}\small\lcircle}%
        {\bfseries\color{exerciseColor}%
            \IfExercisePropertySetT{points}{\enskip%
                \GetExerciseProperty{points}
                \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]\;}%
                \IfExerciseGoalSingularTF{points}
                {\XSIMtranslate{point}}
                {\XSIMtranslate{points}}%
            }}}%
    \par\vspace{1.5ex plus .2ex}
    \@afterindentfalse\@afterheading
}{}

%%% Boxed Title

\DeclareExerciseEnvironmentTemplate{boxed}{%
    \par\vspace{2ex plus .5ex minus .1ex}%
    \noindent
    {\csname\neoschool@headstyle\endcsname
        \csname\neoschool@headweight\endcsname
        \csname\neoschool@headshape\endcsname
        \tcbox[
            on line,
            boxsep=-3pt,
            left=7pt,
            right=7pt,
            colframe=exerciseColor,
            colback=exerciseColor,
            sharp corners,
            rounded corners = southeast,
        ]{%
            \color{white}{\small\neo@exerciseicon}%
            \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
        }%
    }%
    {%
        \csname\neoschool@headstyle\endcsname
        \csname\neoschool@headweight\endcsname
        \csname\neoschool@headshape\endcsname
        \color{exerciseColor}
        \IfExercisePropertySetT{level}
        {\hspace{5pt}[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
        \IfExercisePropertySetT{subtitle}{{\enskip\GetExerciseProperty{subtitle}}}%
        \IfExercisePropertySetT{points}{%
            \enskip(\GetExerciseProperty{points}%
            \IfExerciseGoalSingularTF{points}{\,point}{\,points})%
        }%
    }%
    \hspace{2pt}
}{}

%%% Boxed Title - Outlined

\DeclareExerciseEnvironmentTemplate{boxed-out}{%
    \par\vspace{2ex plus .5ex minus .1ex}%
    \noindent
    {\csname\neoschool@headstyle\endcsname
        \csname\neoschool@headweight\endcsname
        \csname\neoschool@headshape\endcsname
        \tcbox[
            on line,
            boxrule=0.8pt,
            boxsep=-3pt,
            left=7pt,
            right=7pt,
            colframe=exerciseColor,
            colback=white,
            sharp corners,
            rounded corners = southeast,
        ]{%
            \color{exerciseColor}{\small\neo@exerciseicon}%
            \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
        }%
    }%
    {%
        \csname\neoschool@headstyle\endcsname
        \csname\neoschool@headweight\endcsname
        \csname\neoschool@headshape\endcsname
        \color{exerciseColor}
        \IfExercisePropertySetT{level}
        {\hspace{5pt}[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]}%
        \IfExercisePropertySetT{subtitle}{{\enskip\GetExerciseProperty{subtitle}}}%
        \IfExercisePropertySetT{points}{%
            \enskip(\GetExerciseProperty{points}%
            \IfExerciseGoalSingularTF{points}{\,point}{\,points})%
        }%
    }%
    \hspace{2pt}
}{}


%% ==============================================================================
%% Simple Style Templates
%% ==============================================================================

%% Common Style Settings
\newcommand{\neo@startsection}[1]{%
    \@startsection{paragraph}{4}{\z@}{0.25\baselineskip}{-1em}
    {\csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname\color{#1}}
}

%% Inline Style
%% ----------------------------------
\DeclareExerciseEnvironmentTemplate{inline}{%
    \neo@startsection{exerciseColor}
    {%
        {\small\neo@exerciseicon}%
        \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
        \IfExercisePropertySetT{level}{\enskip%
            [\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]
        }%
        \GetExercisePropertyT{subtitle}{{\enskip\normalfont\rmfamily\itshape\csname\neoschool@headweight\endcsname\PropertyValue}}%
        \IfExercisePropertySetT{points}{\enskip(%
            \GetExerciseProperty{points}%
            \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]}%
            \IfExerciseGoalSingularTF{points}
            {\;\XSIMtranslate{point})\!}
        {\;\XSIMtranslate{points})\!}
    }
}
\color{\neoschool@globalcolor}\hspace{-1em}
}{\par\vspace{0.5\baselineskip}}


%% Section Style
%% ----------------------------------
\DeclareExerciseEnvironmentTemplate{section}{%
    \section*{%
        {\small\neo@exerciseicon}%
        \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
        \IfExercisePropertySetT{level}{\enskip%
            [\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]
        }%
        \GetExercisePropertyT{subtitle}{{\:\itshape\PropertyValue}}%
        \IfExercisePropertySetT{points}{\enskip(%
            \GetExerciseProperty{points}%
            \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]}%
            \IfExerciseGoalSingularTF{points}
            {\;\XSIMtranslate{point})\!}
            {\;\XSIMtranslate{points})\!}
        }%
    }%
    \color{\neoschool@globalcolor}%
}{\par\vspace{0.5\baselineskip}}

% %% Terminal Style
\DeclareExerciseEnvironmentTemplate{terminal}{%
    \neo@startsection{exerciseColor}
    {%
        {\small\neo@exerciseicon}%
        \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}
        \enskip{\small\faTerminal}
        \IfExercisePropertySetT{level}{%
            \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]
        }
        \GetExercisePropertyT{subtitle}{{\enskip\PropertyValue}}
        \IfExercisePropertySetT{points}{\enskip(%
            \GetExerciseProperty{points}
            \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]\;}
            \IfExerciseGoalSingularTF{points}
            {~\XSIMtranslate{point})\!}
        {~\XSIMtranslate{points})\!}
    }
}
\color{\neoschool@globalcolor}\hspace{-2em}
}{\par}

%% Subsection Style
\DeclareExerciseEnvironmentTemplate{subsection}{%
  \subsection*{%
        {\small\neo@exerciseicon}%
        \XSIMmixedcase{\GetExerciseName}\nobreakspace
        \GetExerciseProperty{counter}
        \IfExercisePropertySetT{level}{%
            ~[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]
        }
        \IfInsideSolutionF{%
            \GetExercisePropertyT{subtitle}
            {{~\normalfont\csname\neoschool@headweight\endcsname\itshape\PropertyValue}}
        }{%
            \IfExercisePropertySetT{points}{%
                \GetExerciseProperty{points}
                \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]\;}
                \IfExerciseGoalSingularTF{points}
                {\hfill\XSIMtranslate{point}}
                {\hfill\XSIMtranslate{points}}
            }
          }
      }%
}{\par}

%% Block Style
\DeclareExerciseEnvironmentTemplate{block}{%
  \subsection*{%
        {\small\neo@exerciseicon}%
        \XSIMmixedcase{\GetExerciseName}\nobreakspace
        \GetExerciseProperty{counter}
        \IfExercisePropertySetT{level}{%
            ~[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]
        }
        \IfInsideSolutionF{%
            \GetExercisePropertyT{subtitle}
            {{~\normalfont\csname\neoschool@headweight\endcsname\itshape\PropertyValue}}
        }{%
            \IfExercisePropertySetT{points}{%
                \GetExerciseProperty{points}
                \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]\;}
                \IfExerciseGoalSingularTF{points}
                {\hfill\XSIMtranslate{point}}
                {\hfill\XSIMtranslate{points}}
            }
          }
  }%
  \vspace{-0.5em}
}{%
  \vspace{-1em}
}

%% ==============================================================================
%% Horizontal Rule Style
%% ==============================================================================

\ifneo@amslikethm
    \DeclareExerciseEnvironmentTemplate{hrule}{%
        \par\vspace{2ex plus 0.5ex minus .1ex}
        \Needspace*{3\baselineskip}
        \noindent
        \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname
        {\small\neo@exerciseicon}%
        \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}\enskip
        \IfExercisePropertySetT{level}{%
            [\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]\enskip
        }
        \IfInsideSolutionF{%
            \GetExercisePropertyT{subtitle}{{{\normalfont\PropertyValue}\enskip}}
        }
        \xrfill[.075cm]{0.4pt}[exerciseColor]
        {\color{exerciseColor}
            \IfExercisePropertySetT{points}{\enskip
                \GetExerciseProperty{points}
                \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]\;}
                \IfExerciseGoalSingularTF{points}
                {~\XSIMtranslate{point}}
                {~\XSIMtranslate{points}}
            }
        }
        \par\vspace{1ex plus .1ex}
        \@afterindentfalse\@afterheading
    }{\par}
\else
    \DeclareExerciseEnvironmentTemplate{hrule}{%
        \par\vspace{2ex plus 0.5ex minus .1ex}
        \Needspace*{3\baselineskip}
        \noindent
        \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname
        {\small\neo@exerciseicon}%
        \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}\enskip
        \IfExercisePropertySetT{level}{%
            [\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]\enskip
        }
        \IfInsideSolutionF{%
            \GetExercisePropertyT{subtitle}{{({\PropertyValue})\enskip}}
        }
        \xrfill[.075cm]{1.2pt}[exerciseColor]
        {\color{exerciseColor}
            \IfExercisePropertySetT{points}{\enskip
                \GetExerciseProperty{points}
                \GetExercisePropertyT{bonus-points}{[+\printgoal{\PropertyValue}]\;}
                \IfExerciseGoalSingularTF{points}
                {~\XSIMtranslate{point}}
                {~\XSIMtranslate{points}}
            }
        }
        \par\vspace{1ex plus .1ex}
        \@afterindentfalse\@afterheading
    }{\par}
\fi

%% ==============================================================================
%% Solution Box Configuration
%% ==============================================================================

% Solution box template
\DeclareExerciseEnvironmentTemplate{sol-box}{%
    \begin{tcolorbox}[%
            enhanced,
            breakable,
            frame hidden,
            before skip=0.5\baselineskip,
            after skip=0.5\baselineskip,
            left=0.75em,
            right=0.5em,
            boxsep=1ex,
            colframe=solutionColor,
            colback=solutionColor!5,
        ]
        {\color{solutionColor}
            \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname
            \XSIMmixedcase{\GetExerciseName}
            \csname neo@solutiongaptext\endcsname
            \GetExerciseProperty{counter}
        }
        }{\end{tcolorbox}}

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
                    \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname
                    \XSIMmixedcase{\GetExerciseName}~\GetExerciseProperty{counter}%
                    \IfExercisePropertySetT{level}{%
                        \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
                    }%
                    \IfExercisePropertySetT{subtitle}{\enskip\GetExerciseProperty{subtitle}}%
                    \IfExercisePropertySetT{points}{%
                        \enskip(\GetExerciseProperty{points}%
                        \IfExerciseGoalSingularTF{points}{~point}{~points})%
                    }%
                }%
        ]%
        }{\end{tcolorbox}}

\DeclareExerciseEnvironmentTemplate{minimal-ams}{%
    \par\vspace{2ex plus 0.5ex minus .1ex}
    \Needspace*{3\baselineskip}
    \noindent
    {%
        {\small\neo@exerciseicon}
        \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname
        \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
        \IfExercisePropertySetT{level}{%
            \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
        }%
        \IfExercisePropertySetT{subtitle}{%
            \enskip{\itshape\GetExerciseProperty{subtitle}}%
        }%
        \IfExercisePropertySetT{points}{%
            \enskip(%
            \GetExerciseProperty{points}%
            \IfExerciseGoalSingularTF{points}%
            {~point}%
            {~points}%
            )%
        }%
        \enskip
    }%
}{\par\vspace{1ex plus .5ex}}

\DeclareExerciseEnvironmentTemplate{rule-ams}{%
    \par\vspace{2ex plus 0.5ex minus .1ex}
    \Needspace*{3\baselineskip}
    \noindent
    {%
        {\small\neo@exerciseicon}
        \csname\neoschool@headstyle\endcsname\csname\neoschool@headweight\endcsname\csname\neoschool@headshape\endcsname
        \XSIMmixedcase{\GetExerciseName}\nobreakspace\GetExerciseProperty{counter}%
        \IfExercisePropertySetT{level}{%
            \enskip[\raisebox{0.5pt}{$\neo@replicate{\GetExerciseProperty{level}}{{\star}}$}]%
        }%
        \IfExercisePropertySetT{subtitle}{%
            \enskip{\itshape\GetExerciseProperty{subtitle}}%
        }%
        \IfExercisePropertySetT{points}{%
            \enskip(%
            \GetExerciseProperty{points}%
            \IfExerciseGoalSingularTF{points}%
            {~point}%
            {~points}%
            )%
        }%
        \enskip
    }%
    \par\nobreak\vspace{.4ex}%
    \noindent\hspace*{2em}%
    \tikz[baseline]{\draw[line width=0.4pt, exerciseColor!20] (0,0) -- (\linewidth-4em,0);}%
    \par\vspace{.8ex}%
    \@afterindentfalse\@afterheading
}{\par\vspace{1ex plus .5ex}}

%% ==============================================================================
%% Exercise Configuration
%% ==============================================================================

% Enable solutions if answers option is active
\ifneoschool@answers
    \xsimsetup{%
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
            solution/template = sol-box
        }
        \renewcommand*{\theexercise}{\thesection.\arabic{thmcounter}}
        \AtBeginEnvironment{exercise}{\stepcounter{thmcounter}\addtocounter{exercise}{-1}}
    \else
        \xsimsetup{%
            exercise/within = section,
            exercise/name = {\neo@exercisename},
            solution/name = {\neo@solutionname},
            solution/template = sol-box
        }
    \fi
\else
    \ifneoschool@sharedexcounter
        \xsimsetup{%
            exercise/name = {\neo@exercisename},
            solution/name = {\neo@solutionname},
            solution/template = sol-box
        }
        \renewcommand*{\theexercise}{\arabic{thmcounter}}
        \AtBeginEnvironment{exercise}{\stepcounter{thmcounter}\addtocounter{exercise}{-1}}
    \else
        \xsimsetup{%
            exercise/name = {\neo@exercisename},
            solution/name = {\neo@solutionname},
            solution/template = sol-box
        }
    \fi
\fi

%% Style selection based on class options
\ifneo@amslikethm
    \xsimsetup{exercise/template=inline}
\fi

\ifneo@classythm
    \xsimsetup{exercise/template=classy-box}
\fi

\ifneo@classicthm
    \xsimsetup{exercise/template=classic-box}
\fi

\ifneo@soberthm
    \xsimsetup{exercise/template=sober-box}
\fi

\ifneo@elegantthm
    \xsimsetup{exercise/template=elegant-box}
\fi

\ifneo@shadedthm
    \xsimsetup{exercise/template=shaded-box}
\fi

\ifneo@slantedthm
    \xsimsetup{exercise/template=slanted-box}
\fi

\ifneo@boxedthm
    \xsimsetup{exercise/template=rect-box}
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
\NewDocumentCommand\gridfill{ s O{\neoschool@titlecolor} O{5mm} O{5mm} }{%
    \pgfmathsetmacro{\neo@gridwidth}{floor(\linewidth/1cm)}
    \edef\neo@gridwidth{\neo@gridwidth cm}
    \vspace*{\fill}
    \IfBooleanTF#1
    {{\noindent\centering
                \frenchgrid[#2]{\neo@gridwidth}{\dimexpr\textheight-\pagetotal-2\baselineskip\relax}}
    }
    {{\noindent\centering
                \customgrid[#2][#3][#4]{\neo@gridwidth}{\dimexpr\textheight-\pagetotal-2\baselineskip\relax}}
    }
}

% Solution text formatting
\NewDocumentCommand\neo@solution@text{}{%
    {\csname\neoschool@headstyle\endcsname
            \csname\neoschool@headweight\endcsname
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
        {\noindent\centering}
    }{%
        \noindent
    }
    \begin{tikzpicture}[inner sep=0,outer sep=0]
        \pgfmathsetmacro\mywidth{#4}
        \pgfmathsetmacro\myheight{#5}
        \pgfmathsetmacro\incx{8mm}
        \pgfmathsetmacro\incypetits{2mm}
        \pgfmathsetmacro\incygrands{8mm}

        % Adjust the width to be an exact multiple of incx
        \pgfmathsetmacro\numx{floor(\mywidth/\incx)} % Number of full columns
        \pgfmathsetmacro\adjwidth{\numx * \incx} % Adjusted width

        % Adjust the height to be an exact multiple of incypetits
        \pgfmathsetmacro\numypetits{floor(\myheight/\incypetits)} % Number of fine lines
        \pgfmathsetmacro\numygrands{floor(\myheight/\incygrands)} % Number of thick lines
        \pgfmathsetmacro\adjheight{\numypetits * \incypetits} % Adjusted height

        % Draw vertical lines
        \foreach \x in {0,...,\numx}{%
                \draw[fine lines]
                (\x * \incx pt,0) -- (\x * \incx pt,\adjheight pt);
            }
        % Draw thin horizontal lines
        \foreach \y in {0,...,\numypetits}{%
                \draw[fine lines]
                (0,\y * \incypetits pt) -- (\adjwidth pt,\y * \incypetits pt);
            }
        % Draw thick horizontal lines
        \foreach \y in {0,...,\numygrands}{%
                \draw[thick lines]
                (0,\y * \incygrands pt) -- (\adjwidth pt,\y * \incygrands pt);
            }
    \end{tikzpicture}
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
            width={.975\linewidth},
            colspec={X[j,m]Q[c,m]Q[c,m]}
            }
            {{{#4}}} &  & \centering\qrcode{#3}
        \end{tblr}%
    }{%
        \par\begin{tblr}{%
            width={.975\linewidth},
            colspec={Q[c,m]Q[c,m]X[j,m]}
            }
            \centering\qrcode{#3} &  & {{{#4}}}
        \end{tblr}%
    }%
}

%% Assessment Tools
%% ----------------------------------
% Point markers
\NewDocumentCommand{\mrks}{s O{} m}{%
    \IfBooleanTF{#1}
    {\reversemarginpar}
    {\normalmarginpar}%
    \marginnote{\small (#3 pts)\ifx\empty#2\empty\else\\\small#2\fi}[0em]\ignorespaces}

\NewDocumentCommand{\mrk}{s O{} m}{%
    \IfBooleanTF{#1}
    {\reversemarginpar}
    {\normalmarginpar}%
    \marginnote{\small (#3 pt)\ifx\empty#2\empty\else\\\small#2\fi}[0em]\ignorespaces}

% Answer lines
\NewDocumentCommand{\lines}{ O{.} O{1.65em} m }{%
    \par
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
            {\color{definitionColor}\ding{51}}%
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
            {\color{theoremColor}\ding{55}}%
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

%% Margin
%% ----------------------------------

\ifx\neoschool@margin\@empty\else
    \AtEndPreamble{%
        \newlength{\neo@originalwidth}%
        \setlength{\neo@originalwidth}{18cm}%
        \addtolength{\evensidemargin}{\neoschool@margin}%
        \addtolength{\oddsidemargin}{\neoschool@margin}%
        \setlength{\marginparwidth}{\dimexpr\neoschool@margin-0.5cm\relax}%
        \setlength{\marginparsep}{0.5cm}%
        \areaset{\dimexpr\neo@originalwidth-\neoschool@margin\relax}{\dimexpr29cm-\neoschool@margin}%
        % \recalctypearea
    }
\fi

%% Margin Notes
%% ----------------------------------

\newtoggle{lmargin}

\newcommand{\alternatingtodo}[2][]{%
    \iftoggle{lmargin}
    {\normalmarginpar \todo[#1]{#2} \togglefalse{lmargin}}
    {\reversemarginpar \todo[#1]{#2} \toggletrue{lmargin}}
    \ignorespaces
}

\newif\ifmarginnotesactive
\ifx\neoschool@notes\@empty
    \marginnotesactivefalse
\else
    \marginnotesactivetrue
    \AtEndPreamble{%
        \newlength{\neo@originalwidth}
        \setlength{\neo@originalwidth}{18cm}
        \addtolength{\evensidemargin}{\neoschool@notes}
        \addtolength{\oddsidemargin}{\neoschool@notes}
        \setlength{\marginparwidth}{\dimexpr\neoschool@notes-0.5cm\relax}
        \setlength{\marginparsep}{0.5cm} \areaset{\dimexpr\neo@originalwidth-\neoschool@notes\relax}{\dimexpr29cm-\neoschool@notes}
    }
    % \recalctypearea
\fi

\newcommand{\tdnote}[2][]{%
    \ifmarginnotesactive
        \alternatingtodo[%
            bordercolor=\ifneo@unicolor\neoschool@headcolor\else ForestGreen\fi,
            linecolor=\ifneo@unicolor\neoschool@headcolor\else ForestGreen\fi,
            backgroundcolor=\ifneo@unicolor\neoschool@headcolor!10\else Gold\fi,
            #1%
        ]{#2}%
    \fi
}

\newsavebox{\todobox}
\newcounter{tdnotecounter}

\newcommand{\boxnote}[2][inNote]{%
    \stepcounter{tdnotecounter}
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
    \vspace*{1em}
    \noindent
    \begin{minipage}[t]{0.2\textwidth}
        \begin{tcolorbox}[%
                enhanced,
                colback=white,
                colbacktitle=white,
                colframe=\neoschool@globalcolor,
                sharp corners,
                boxrule=0.5pt,
                height=2.5cm,
                title={\smallstrut\textmd{\color{\neoschool@globalcolor}\neo@mark@text}},
                center title,
                overlay={%
                    \ifblank{#1}{}{%
                        \coordinate (start) at ([xshift=-0.1mm,yshift=-0.575cm]frame.north east);
                        \coordinate (end) at ([xshift=0.1mm,yshift=0.1mm]frame.south west);
                        \draw[line width=0.4pt] (start) -- (end);
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
                boxrule=0.5pt,
                height=2.5cm,
                title={\smallstrut\textmd{\color{\neoschool@globalcolor}\neo@appreciation@text}},
                center title
            ]
            \vspace{2\baselineskip}
        \end{tcolorbox}
    \end{minipage}
    \vspace*{1em}
}

%% Skill Assessment Table
%% ----------------------------------
\newcommand{\competencies}[1]{%
    \bigskip
    % \colorlet{tempcolor}{\neoschool@titlecolor}
    \colorlet{tempcolor}{\neoschool@globalcolor}
    \ifneo@unicolor
        \def\iconcolorA{\neoschool@titlecolor!5}%
        \def\iconcolorB{\neoschool@titlecolor!5}%
        \def\iconcolorC{\neoschool@titlecolor!5}%
        \def\iconcolorD{\neoschool@titlecolor!5}%
    \else
        \def\iconcolorA{Tomato}%
        \def\iconcolorB{orange}%
        \def\iconcolorC{yellow}%
        \def\iconcolorD{green}%
    \fi
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
\ifluatex
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

\ifneo@unicolor
    \colorlet{mathColor}{\neoschool@headcolor}
\else
    \colorlet{mathColor}{Maroon}
\fi

\newcommand*{\mc}[2][mathColor]{{\color{#1}#2}}

%% ==============================================================================
%% Admonition Boxes - Multilingual Version
%% ==============================================================================

%% Color Definitions for Admonition Boxes
\ifneo@unicolor
    \colorlet{noteColor}{\neoschool@headcolor}
    \colorlet{infoColor}{\neoschool@headcolor}
    \colorlet{warningColor}{\neoschool@headcolor}
    \colorlet{importantColor}{\neoschool@headcolor}
    \colorlet{tipColor}{\neoschool@headcolor}
    \colorlet{reminderColor}{\neoschool@headcolor}
    \colorlet{summaryColor}{\neoschool@headcolor}
    \colorlet{toolboxColor}{\neoschool@headcolor}
\else\ifx\neoschool@theme\neo@cyprus
        \colorlet{noteColor}{methodColor}
        \colorlet{infoColor}{theoremColor}
        \colorlet{warningColor}{titleColor}
        \colorlet{importantColor}{definitionColor}
        \colorlet{tipColor}{codeColor}
        \colorlet{reminderColor}{applicationColor}
        \colorlet{summaryColor}{remarkColor}
        \colorlet{toolboxColor}{alternateColor}
    \else\ifx\neoschool@theme\neo@kassio
            \colorlet{noteColor}{definitionColor}
            \colorlet{infoColor}{applicationColor}
            \colorlet{warningColor}{methodColor}
            \colorlet{importantColor}{theoremColor}
            \colorlet{tipColor}{codeColor}
            \colorlet{reminderColor}{titleColor}
            \colorlet{summaryColor}{remarkColor}
            \colorlet{toolboxColor}{alternateColor}
        \else\ifx\neoschool@theme\neo@frost
                \colorlet{noteColor}{methodColor}
                \colorlet{infoColor}{definitionColor}
                \colorlet{warningColor}{titleColor}
                \colorlet{importantColor}{theoremColor}
                \colorlet{tipColor}{applicationColor}
                \colorlet{reminderColor}{codeColor}
                \colorlet{summaryColor}{remarkColor}
                \colorlet{toolboxColor}{alternateColor}
            \else\ifx\neoschool@theme\neo@spring
                    \colorlet{noteColor}{methodColor}
                    \colorlet{infoColor}{theoremColor}
                    \colorlet{warningColor}{applicationColor}
                    \colorlet{importantColor}{titleColor}
                    \colorlet{tipColor}{definitionColor}
                    \colorlet{reminderColor}{codeColor}
                    \colorlet{summaryColor}{remarkColor}
                    \colorlet{toolboxColor}{alternateColor}
                \else\ifx\neoschool@theme\neo@arbutus
                        \colorlet{noteColor}{codeColor}
                        \colorlet{infoColor}{titleColor}
                        \colorlet{warningColor}{methodColor}
                        \colorlet{importantColor}{theoremColor}
                        \colorlet{tipColor}{applicationColor}
                        \colorlet{reminderColor}{definitionColor}
                        \colorlet{summaryColor}{remarkColor}
                        \colorlet{toolboxColor}{alternateColor}
                    \else\ifx\neoschool@theme\neo@duo
                            \colorlet{noteColor}{titleColor}
                            \colorlet{infoColor}{applicationColor}
                            \colorlet{warningColor}{theoremColor}
                            \colorlet{importantColor}{methodColor}
                            \colorlet{tipColor}{definitionColor}
                            \colorlet{reminderColor}{codeColor}
                            \colorlet{summaryColor}{remarkColor}
                            \colorlet{toolboxColor}{alternateColor}
                        \else\ifx\neoschool@theme\neo@navy
                                \colorlet{noteColor}{titleColor}
                                \colorlet{infoColor}{definitionColor}
                                \colorlet{warningColor}{methodColor}
                                \colorlet{importantColor}{theoremColor}
                                \colorlet{tipColor}{applicationColor}
                                \colorlet{reminderColor}{codeColor}
                                \colorlet{summaryColor}{remarkColor}
                                \colorlet{toolboxColor}{alternateColor}
                            \else\ifx\neoschool@theme\neo@royal
                                    \colorlet{noteColor}{titleColor}
                                    \colorlet{infoColor}{definitionColor}
                                    \colorlet{warningColor}{methodColor}
                                    \colorlet{importantColor}{theoremColor}
                                    \colorlet{tipColor}{applicationColor}
                                    \colorlet{reminderColor}{codeColor}
                                    \colorlet{summaryColor}{remarkColor}
                                    \colorlet{toolboxColor}{alternateColor}
                                \fi\fi\fi\fi\fi\fi\fi\fi\fi

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
\newtcolorbox{admonitionbase}[4][]{%
    enhanced,
    before skip=0.5\baselineskip,
    after skip=.5\baselineskip,
    colback=#2!5,
    colframe=#2,
    boxrule=1pt,
    frame style={opacity=0.5},
    \neo@framehidden,
    arc=2pt,
    left=10pt,
    right=5pt,
    top=3pt,
    bottom=3pt,
    breakable,
    fonttitle=\sffamily\bfseries,
    title={%
        \hspace*{-2mm}%
        \raisebox{-2pt}{\textcolor{#2}{\Large#3}}%
        \hspace{5pt}%
        \textcolor{#2}{\textbf{#4}}%
    },
    attach title to upper,
    after title={\par\vspace{0.5em}},
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
\@ifundefined{warning}{%
    \NewDocumentEnvironment{warning}{O{\neo@admonition@warning} O{\faExclamationTriangle} +b}{%
        \begin{admonitionbase}{warningColor}{#2}{#1}%
            #3%
        \end{admonitionbase}%
    }{}
}{}

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
%% Compact Mode Adjustments
%% ==============================================================================

\ifneo@compact

    \neo@fullheaderfalse

    \PassOptionsToPackage{singlespacing}{setspace}

    \renewcommand{\arraystretch}{1.05}

    \settasks{%
        item-indent=2em,
        column-sep=0.5em,
        label-width=12pt,
        label-offset=0.3em,
        before-skip=0pt,
        after-skip=0pt,
        after-item-skip=0pt
    }

    \AtBeginDocument{
        \setlength{\abovedisplayskip}{3pt}
        \setlength{\belowdisplayskip}{3pt}
        \setlength{\abovedisplayshortskip}{0pt}
        \setlength{\belowdisplayshortskip}{0pt}
    }

    \setlength{\parindent}{1em}
    \setlength{\parskip}{0pt plus 0.1pt}

    \tcbset{
        before skip=0.5\baselineskip,
        after skip=0.5\baselineskip,
    }

    \RedeclareSectionCommand[
        % beforeskip=-0.25\baselineskip,
        afterskip=0.5\baselineskip
    ]{section}

    \RedeclareSectionCommand[
        % beforeskip=-0.25\baselineskip,
        afterskip=0.5\baselineskip
    ]{subsection}

    \setlength{\floatsep}{5pt plus 2pt minus 2pt}
    \setlength{\textfloatsep}{5pt plus 2pt minus 2pt}
    \setlength{\intextsep}{5pt plus 2pt minus 2pt}

    \tcbset{
        neo@shared@base/.style args={#1}{
                common@base,
                colframe=#1,
                colback=\neo@getbackcolor,
                boxrule=\neo@thmborder,
                \neo@getframestyle,
                before skip=0.5\baselineskip,
                after skip=0.5\baselineskip,
                top=3pt,
                bottom=3pt,
                left=5pt,
                right=5pt
            }
    }

    \tcbset{
        neo@commonbox/.style={
                enhanced,
                top=3pt,
                bottom=3pt,
                left=2mm,
                right=2mm,
                coltitle=white,
                fonttitle=\small\sffamily,
                before skip=0.5\baselineskip,
                after skip=0.5\baselineskip
            }
    }

    \setlength{\titlespacing}{0.8\baselineskip}

    \renewcommand{\createfulltitle}{%
    \ifx\@subject\@empty\else
        {\usekomafont{subject}{\@subject\par}}
        \vspace{0.5\titlespacing}
    \fi

    {\noindent\usekomafont{title}{\@title\par}}

    \ifx\@subtitle\@empty\else
        \vspace{0.5\titlespacing}
        {\noindent\usekomafont{subtitle}{\@subtitle\par}}
    \fi

    \ifx\@author\@empty\else
        \vspace{0.5\titlespacing}
        {\noindent\usekomafont{author}{\@author\par}}
    \fi

    \neo@titledecoration
    \if@twocolumn\vspace{\titlespacing}\else\vspace{0.5\titlespacing}\fi
    }

    \renewcommand{\neo@titledecoration}{%
        \ifneo@titlerule
            \vspace{0.75\titlespacing}%
            {\color{\neoschool@titlecolor}\rule{4em}{0.4pt}}
        \else
            \ifneo@titlemidrule
                \vspace{0.75\titlespacing}%
                {\color{\neoschool@titlecolor}\rule{0.4\linewidth}{0.4pt}}
            \else
                \ifneo@titlefullrule
                    \vspace{0.75\titlespacing}%
                    {\color{\neoschool@titlecolor}\rule{\linewidth}{0.4pt}}%
                    \vspace{-0.5\titlespacing}%
                \else
                    \ifneo@titleornament
                        \vspace{0.75\titlespacing}%
                        {\color{\neoschool@titlecolor}\scalebox{1.5}[1.2]{\adforn{21}\,\adforn{11}\,\adforn{49}}}
                    \fi
                \fi
            \fi
        \fi
        \vspace*{.1\baselineskip}
    }

\fi

%% ==============================================================================
%% End of Class
%% ==============================================================================
