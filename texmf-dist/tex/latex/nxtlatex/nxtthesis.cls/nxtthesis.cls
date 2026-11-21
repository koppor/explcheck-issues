%%
%% This is file `nxtthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% nxtlatex.dtx  (with options: `nxtthesis')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2025 Volker Reichenberger.
%% 
%% This file is part of the nxtlatex package.
%% 
%% This file may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3c of this
%% license or (at your option) any later version.
%% The latest version of this license is in
%%    https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nxtthesis}[2026/09/24 v1.3 NXT Thesis Class (LuaLaTeX)]

\LoadClass[a4paper,11pt]{report}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=nxtthesis,prefix=nxtthesis@}

\DeclareBoolOption{german}
\DeclareBoolOption{english}
\DeclareBoolOption{gyre}
\DeclareBoolOption{libertinus}
\DeclareBoolOption{segoeui}
\DeclareBoolOption{stix}
\DeclareBoolOption{fira}
\DeclareBoolOption{newtx}
\DeclareBoolOption{times}
\DeclareBoolOption{bookman}
\DeclareBoolOption{charter}
\DeclareBoolOption{garamond}
\DeclareBoolOption{utopia}
\DeclareBoolOption{concrete}
\DeclareBoolOption{richtlinie}
\DeclareBoolOption{kapitaelchen}
\DeclareBoolOption{logo}

\ProcessKeyvalOptions*

\ifnxtthesis@english
  \RequirePackage[ngerman,main=english]{babel}
\else
  \RequirePackage[english,main=ngerman]{babel}
\fi

\RequirePackage{fontspec}
\RequirePackage{etoolbox}

\RequirePackage{amsmath}

\ifnxtthesis@gyre
  \setmainfont{TeX Gyre Pagella}
  \setsansfont{TeX Gyre Heros}
  \RequirePackage{unicode-math}
  \setmathfont{TeX Gyre Pagella Math}
\fi

\ifnxtthesis@libertinus
  % Semibold statt Bold, wo die Schrift es hergibt: Der fette Schnitt
  % fällt sonst gegenüber dem Grundtext zu schwer aus.
  \setmainfont{Libertinus Serif}[
    BoldFont       = {Libertinus Serif Semibold},
    BoldItalicFont = {Libertinus Serif Semibold Italic},
  ]
  \setsansfont{Source Sans 3}
  \RequirePackage{unicode-math}
  \setmathfont{Libertinus Math}
\fi

\ifnxtthesis@segoeui
  \setmainfont{Segoe UI}[BoldFont={Segoe UI Semibold}]
  \setsansfont{Segoe UI}[BoldFont={Segoe UI Semibold}]
  \setmonofont{Source Code Pro}[BoldFont={Source Code Pro Semibold}]
  \RequirePackage{unicode-math}
  \setmathfont{Euler Math}
\fi

\ifnxtthesis@stix
  \setmainfont{STIX Two Text}[
    BoldFont       = {STIX Two Text SemiBold},
    BoldItalicFont = {STIX Two Text SemiBold Italic},
  ]
  \setsansfont{Source Sans 3}
  \RequirePackage{unicode-math}
  \setmathfont{STIX Two Math}
\fi

\ifnxtthesis@fira
  \setmainfont{Fira Sans}[BoldFont={Fira Sans Medium}]
  \setsansfont{Fira Sans}[BoldFont={Fira Sans Medium}]
  \setmonofont{Fira Mono}
  \RequirePackage{unicode-math}
  \setmathfont{Fira Math}
\fi

\ifnxtthesis@newtx
  % newtx selbst ist ein Paket aus der pdflatex-Zeit und verträgt sich
  % nicht mit fontspec und unicode-math. Es bringt aber OpenType-Dateien
  % mit -- TeX Gyre TermesX, eine überarbeitete Times --, und die lassen
  % sich direkt setzen. Die Mathematik übernimmt TeX Gyre Termes Math,
  % das metrisch dazu passt.
  \setmainfont{TeX Gyre TermesX}
  \setsansfont{TeX Gyre Heros}
  \RequirePackage{unicode-math}
  \setmathfont{TeX Gyre Termes Math}
\fi

\ifnxtthesis@times
  % Times New Roman ist eine Systemschrift und liegt nicht in jeder
  % Installation vor. Eine Mathematikvariante gibt es nicht -- TeX Gyre
  % Termes Math ist metrisch Times-kompatibel und die nächstliegende
  % Wahl.
  %
  % Achtung: Times New Roman bringt keine echten Kapitälchen mit. Die
  % Abkürzungen der Klasse werden damit aus Versalien heruntergerechnet
  % und wirken zu leicht. Wer Times braucht, aber echte Kapitälchen
  % will, nimmt die Option newtx.
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont{Courier New}
  \RequirePackage{unicode-math}
  \setmathfont{TeX Gyre Termes Math}
\fi

\ifnxtthesis@bookman
  % Bookman = TeX Gyre Bonum, die freie URW Bookman. Heros als
  % Serifenlose, weil beide aus derselben URW-Familie stammen.
  \setmainfont{TeX Gyre Bonum}
  \setsansfont{TeX Gyre Heros}
  \RequirePackage{unicode-math}
  \setmathfont{TeX Gyre Bonum Math}
\fi

\ifnxtthesis@charter
  % XCharter ist die freie TeX-Fassung der Charter von Matthew Carter.
  \setmainfont{XCharter}
  \setsansfont{Source Sans 3}
  \RequirePackage{unicode-math}
  \setmathfont{XCharter Math}
\fi

\ifnxtthesis@garamond
  % EB Garamond mit der dazugehörigen Garamond-Math. Der Semibold-Schnitt
  % ersetzt den fetten; Garamond ist eine leichte Schrift, deren Bold
  % gegenüber dem Grundtext zu schwer ausfällt.
  \setmainfont{EB Garamond}[
    BoldFont       = {EB Garamond SemiBold},
    BoldItalicFont = {EB Garamond SemiBold Italic},
  ]
  \setsansfont{Source Sans 3}
  \RequirePackage{unicode-math}
  \setmathfont{Garamond Math}
\fi

\ifnxtthesis@utopia
  % Erewhon ist die OpenType-Fassung der Utopia von Robert Slimbach.
  % Erewhon-Math löst das ältere »Utopia with Math Design« ab, das nur
  % mit pdflatex funktioniert.
  \setmainfont{Erewhon}
  \setsansfont{Source Sans 3}
  \RequirePackage{unicode-math}
  \setmathfont{Erewhon Math}
\fi

\ifnxtthesis@concrete
  % Concrete mit Euler -- die Schriften aus Knuths »Concrete
  % Mathematics«. CMU Bright ist die dazugehörige Serifenlose, CMU
  % Typewriter die Schreibmaschinenschrift.
  \setmainfont{CMU Concrete}
  \setsansfont{CMU Bright}
  \setmonofont{CMU Typewriter Text}
  \RequirePackage{unicode-math}
  \setmathfont{Euler Math}
\fi

\RequirePackage{nxtlatexlogos}

\newif\ifnxtthesis@titellogo
\ifnxtthesis@richtlinie \nxtthesis@titellogotrue \fi
\ifnxtthesis@logo \nxtthesis@titellogotrue \fi
\ifnxtthesis@richtlinie
  \newcommand*{\nxtthesis@logobreite}{6cm}
\else
  \newcommand*{\nxtthesis@logobreite}{5cm}
\fi
\newcommand{\nxtthesis@titellogo}[1]{%
  \ifnxtthesis@titellogo
    \nxthsrtlogo[width=\nxtthesis@logobreite]\par
    #1%
  \fi
}

\def\abgabedatum#1{\def\@abgabedatum{#1}}
\newcommand{\printabgabedatum}{\@abgabedatum}

\def\fakultaet#1{\def\@fakultaet{#1}}
\newcommand{\printfakultaet}{\@fakultaet}

\def\hochschule#1{\def\@hochschule{#1}}
\newcommand{\printhochschule}{\@hochschule}

\def\studiengang#1{\def\@studiengang{#1}}
\newcommand{\printstudiengang}{\@studiengang}

\def\akademischergrad#1{\def\@akademischergrad{#1}}
\newcommand{\printakademischergrad}{\@akademischergrad}

\def\adresse#1{\def\@adresse{#1}}
\newcommand{\printadresse}{\@adresse}

\def\matrikelnummer#1{\def\@matrikelnummer{#1}}
\newcommand{\printmatrikelnummer}{\@matrikelnummer}

\def\erstpruef#1{\def\@erstpruef{#1}}
\newcommand{\printerstpruef}{\@erstpruef}
\def\erstpruefbezeichnung#1{\def\@erstpruefbezeichnung{#1}}
\newcommand{\printerstpruefbezeichnung}{\@erstpruefbezeichnung}

\def\zweitpruef#1{\def\@zweitpruef{#1}}
\newcommand{\printzweitpruef}{\@zweitpruef}
\def\zweitpruefbezeichnung#1{\def\@zweitpruefbezeichnung{#1}}
\newcommand{\printzweitpruefbezeichnung}{\@zweitpruefbezeichnung}

\newif\ifnxtthesis@echtekapitaelchen
\nxtthesis@echtekapitaelchentrue
\ifnxtthesis@times \nxtthesis@echtekapitaelchenfalse \fi

\ifnxtthesis@kapitaelchen
  \ifnxtthesis@echtekapitaelchen
    \newcommand{\nxtthesis@titelschrift}{\scshape}
    \newcommand{\nxtthesis@ueberschrift}{\rmfamily\scshape}
    \newcommand{\nxtthesis@kopfschrift}{\rmfamily\scshape}
  \else
    \ClassWarningNoLine{nxtthesis}{%
      Die gewaehlte Schrift hat keine echten Kapitaelchen.\MessageBreak
      Ueberschriften werden deshalb serifenlos gesetzt;\MessageBreak
      Titel und Abkuerzungen bleiben in der Serifenschrift%
    }
    \newcommand{\nxtthesis@titelschrift}{\bfseries}
    \newcommand{\nxtthesis@ueberschrift}{\sffamily\bfseries}
    \newcommand{\nxtthesis@kopfschrift}{\sffamily}
  \fi
\else
  \newcommand{\nxtthesis@titelschrift}{\bfseries}
  \newcommand{\nxtthesis@ueberschrift}{\rmfamily\bfseries}
  \newcommand{\nxtthesis@kopfschrift}{\rmfamily}
\fi

\ifnxtthesis@richtlinie
  \newcommand*{\nxtthesis@gliederung}{\bfseries}
\else
  \newcommand*{\nxtthesis@gliederung}{\nxtthesis@ueberschrift}
\fi

\ifnxtthesis@richtlinie
  \RequirePackage[a4paper,left=3cm,top=2.5cm,right=2.5cm,bottom=2.5cm]{geometry}
  \RequirePackage{setspace}
  \onehalfspacing
  % Absätze durch eine Leerzeile getrennt, ohne Einzug. parskip richtet
  % auch Listen darauf ein. Der Abstand ist eine Zeile im 1,5-fachen
  % Zeilenabstand, deshalb erst zu Dokumentbeginn gesetzt.
  \RequirePackage{parskip}
  % \dimexpr ist nötig: \baselineskip ist ein Glue-Register, danach
  % liest TeX kein »plus« mehr -- »plus1pt« landete als Text auf einer
  % eigenen Seite vor der Titelseite.
  \AtBeginDocument{\parskip=\dimexpr\baselineskip\relax \@plus \p@\relax}
  % Flattersatz mit Silbentrennung. Das \raggedright des Kerns gäbe dem
  % rechten Rand unendliche Dehnbarkeit; TeX müsste dann nie trennen, und
  % der Rand franste aus. Endliche Dehnbarkeit (2 em) lässt die Trennung
  % aktiv und den Rand gleichmäßig -- die Richtlinie verlangt in
  % Abschnitt 3.3 ausdrücklich eine sinnvolle Silbentrennung. Das leistete
  % früher ragged2e; das Paket ist mit dem Tagging nur teilweise
  % verträglich, die drei Zuweisungen genügen.
  \rightskip=\z@ \@plus 2em\relax
  \@rightskip=\rightskip
  \parfillskip=\z@ \@plus 1fil\relax
\else
  % Der Satzspiegel der früheren KOMA-Fassung: 147 mm breit, 44 Zeilen,
  % gleiche Ränder links und rechts, großzügiger Fußsteg.
  \RequirePackage[a4paper,textwidth=418pt,hmarginratio=1:1,top=84.5pt,
    lines=44,headheight=17pt,headsep=20.4pt,footskip=47.6pt]{geometry}
  \setlength{\parindent}{1em}
\fi

\ifnxtthesis@richtlinie
  \newcommand*{\nxtthesis@kapitelgroesse}{\normalsize}
  \newcommand*{\nxtthesis@abschnittgroesse}{\normalsize}
  \newcommand*{\nxtthesis@unterabschnittgroesse}{\normalsize}
  \newcommand*{\nxtthesis@kapitelvor}{\z@}
  \newcommand*{\nxtthesis@kapitelnach}{\baselineskip}
\else
  \newcommand*{\nxtthesis@kapitelgroesse}{\huge}
  \newcommand*{\nxtthesis@abschnittgroesse}{\Large}
  \newcommand*{\nxtthesis@unterabschnittgroesse}{\large}
  \newcommand*{\nxtthesis@kapitelvor}{2\baselineskip}
  \newcommand*{\nxtthesis@kapitelnach}{2\baselineskip}
\fi
\renewcommand*{\@makechapterhead}[1]{%
  \vspace*{\nxtthesis@kapitelvor}%
  {\parindent\z@ \raggedright
   \normalfont\nxtthesis@gliederung\nxtthesis@kapitelgroesse
   \ifnum\c@secnumdepth>\m@ne
     \setbox\z@\hbox{\thechapter\hspace{.6em}}%
     \noindent\hangindent\wd\z@ \hangafter\@ne \box\z@
   \fi
   #1\par\nobreak}%
  \vskip\nxtthesis@kapitelnach\relax
}
\renewcommand*{\@makeschapterhead}[1]{%
  \vspace*{\nxtthesis@kapitelvor}%
  {\parindent\z@ \raggedright
   \normalfont\nxtthesis@gliederung\nxtthesis@kapitelgroesse
   #1\par\nobreak}%
  \vskip\nxtthesis@kapitelnach\relax
}
\IfInstanceExistsT{heading}{chapter}{%
  \DeclareInstance{heading}{chapter}{display}{
    name                 = chapter,
    level                = 0,
    placement            = top,
    before-vspace        = \z@,
    after-penalty-vspace = \nxtthesis@kapitelvor,
    after-vspace         = \nxtthesis@kapitelnach,
    number-format        = \thechapter,
    heading-decls        = \raggedright\normalfont\nxtthesis@gliederung
                           \nxtthesis@kapitelgroesse,
    headformat-instance  = nxtkapitel,
    mark-cmd             = \chaptermark{#1},
    contents-extra       = \addtocontents{lof}{\protect\addvspace{10\p@}}%
                           \addtocontents{lot}{\protect\addvspace{10\p@}},
  }%
  \DeclareInstance{headformat}{nxtkapitel}{hang}{
    heading-indent   = \z@,
    number-title-sep = .6em,
  }%
}
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus .2ex}%
  {\normalfont\nxtthesis@gliederung\nxtthesis@abschnittgroesse\raggedright}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {-3.25ex \@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}%
  {\normalfont\nxtthesis@gliederung\nxtthesis@unterabschnittgroesse\raggedright}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex \@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}%
  {\normalfont\nxtthesis@gliederung\normalsize\raggedright}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus 1ex \@minus .2ex}{-1em}%
  {\normalfont\nxtthesis@gliederung\normalsize}}
\patchcmd{\l@chapter}{\bfseries}{\nxtthesis@gliederung}{}%
  {\ClassWarningNoLine{nxtthesis}{Kapiteleintraege im Verzeichnis unveraendert}}

\NewDocumentCommand{\addchap}{s o m}{%
  \chapter*{#3}%
  \IfBooleanF{#1}{%
    \phantomsection
    \addcontentsline{toc}{chapter}{\IfValueTF{#2}{#2}{#3}}}%
  \markboth{\IfValueTF{#2}{#2}{#3}}{\IfValueTF{#2}{#2}{#3}}%
}
\NewDocumentCommand{\addsec}{s o m}{%
  \section*{#3}%
  \IfBooleanF{#1}{%
    \phantomsection
    \addcontentsline{toc}{section}{\IfValueTF{#2}{#2}{#3}}}%
}
\providecommand*{\nonumberline}{}
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\let\@subtitle\@empty
\ifnxtthesis@richtlinie
  % Die Richtlinie kennt für die Titelseite nur 14 pt fett (Titel) und
  % 12 pt (alles Übrige). Der Untertitel bleibt deshalb bei 12 pt.
  \newcommand*{\nxtthesis@untertitelschrift}{\normalfont}
\else
  % Der Untertitel bleibt ohne Auszeichnung: Er steht direkt unter dem
  % Titel, und zwei gleich ausgezeichnete Zeilen übereinander verlieren
  % den Kontrast, der die Hierarchie sichtbar macht.
  \newcommand*{\nxtthesis@untertitelschrift}{\normalfont\Large}
\fi

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand*{\headrulewidth}{\z@}
\renewcommand*{\footrulewidth}{\z@}
\ifnxtthesis@richtlinie
  \fancyfoot[R]{\normalfont\thepage}
\else
  % Der Kolumnentitel folgt der Schrift der Überschriften, bleibt aber
  % klein und ohne Fettung -- fett wäre zu laut für eine
  % Orientierungshilfe.
  \fancyhead[L]{\normalfont\nxtthesis@kopfschrift\small\leftmark}
  \fancyhead[R]{\normalfont\small\thepage}
\fi
\fancypagestyle{plain}{}
\renewcommand*{\chaptermark}[1]{%
  \markboth{\ifnum\c@secnumdepth>\m@ne\thechapter\enskip\fi#1}{}}
\renewcommand*{\sectionmark}[1]{}
\let\nxtthesis@markboth\markboth
\let\nxtthesis@markright\markright
\renewcommand*{\markboth}[2]{%
  \begingroup\let\MakeUppercase\@firstofone
  \nxtthesis@markboth{#1}{#2}\endgroup}
\renewcommand*{\markright}[1]{%
  \begingroup\let\MakeUppercase\@firstofone
  \nxtthesis@markright{#1}\endgroup}

\RequirePackage{nxtlatexcolors}

\def\ort#1{\def\@ort{#1}}
\newcommand{\printort}{\@ort}
\ort{Reutlingen}

\adresse{}
\matrikelnummer{}
\akademischergrad{}
\studiengang{}
\abgabedatum{}
\erstpruef{}
\zweitpruef{}

\ifnxtthesis@english
  \newcommand*{\nxtthesis@txt@thesisgrad}{Thesis submitted for the degree of}
  \newcommand*{\nxtthesis@txt@arbeitgrad}{Thesis submitted for the degree of}
  \newcommand*{\nxtthesis@txt@fakultaet}{at the faculty}
  \newcommand*{\nxtthesis@txt@derhochschule}{of}
  \newcommand*{\nxtthesis@txt@anderhochschule}{at}
  \newcommand*{\nxtthesis@txt@studiengang}{in the degree programme}
  \newcommand*{\nxtthesis@txt@vorgelegtvon}{Submitted by:}
  \newcommand*{\nxtthesis@txt@vorgelegtbei}{Submitted to:}
  \newcommand*{\nxtthesis@txt@matrikel}{Matriculation number}
  \newcommand*{\nxtthesis@txt@abgabe}{Date of submission:}
  \erstpruefbezeichnung{First examiner}
  \zweitpruefbezeichnung{Second examiner}
\else
  \newcommand*{\nxtthesis@txt@thesisgrad}{Thesis zur Erlangung des akademischen Grades}
  \newcommand*{\nxtthesis@txt@arbeitgrad}{Arbeit zur Erlangung des akademischen Grades}
  \newcommand*{\nxtthesis@txt@fakultaet}{an der Fakultät}
  \newcommand*{\nxtthesis@txt@derhochschule}{der}
  \newcommand*{\nxtthesis@txt@anderhochschule}{an der}
  \newcommand*{\nxtthesis@txt@studiengang}{im Studiengang}
  \newcommand*{\nxtthesis@txt@vorgelegtvon}{Vorgelegt von:}
  \newcommand*{\nxtthesis@txt@vorgelegtbei}{Vorgelegt bei:}
  \newcommand*{\nxtthesis@txt@matrikel}{Matrikelnummer}
  \newcommand*{\nxtthesis@txt@abgabe}{Abgabedatum:}
  \erstpruefbezeichnung{Erstprüfer}
  \zweitpruefbezeichnung{Zweitprüfer}
\fi

\newcommand{\nxtthesis@vorspannzahlen}{%
  \setcounter{page}{2}%
}

\newcommand{\nxtthesis@zeile}[2]{%
  \ifdefempty{#1}{}{\noindent #2\par}%
}

\newcommand{\nxtthesis@untertitel}[1]{%
  \ifdefempty{\@subtitle}{}{%
    #1%
    {\nxtthesis@untertitelschrift\@subtitle\par}%
  }%
}

\newcommand{\hauptteil}{%
  \cleardoublepage
  \pagenumbering{arabic}%
  \setcounter{page}{1}%
}

\ifnxtthesis@richtlinie
  \newcommand*{\nxtthesis@zehnpunkt}{\fontsize{10pt}{12pt}\selectfont}
  % Fußnoten in 10 pt; einzeilig setzt setspace sie ohnehin.
  \renewcommand*{\footnotesize}{\nxtthesis@zehnpunkt}
  \counterwithout{table}{chapter}
  \counterwithout{figure}{chapter}
  \counterwithout{equation}{chapter}
  % Beschriftungen: 10 pt fett, zentriert, »Tabelle 3.« mit Punkt. Die
  % Richtlinie ist hier widersprüchlich: Ihre Tabelle in Abschnitt 3.2
  % nennt Beschriftungen linksbündig, ihre eigenen Beispiele setzen sie
  % zentriert. Wir folgen den Beispielen. Früher über das Paket caption,
  % das mit dem Tagging unverträglich ist.
  \setlength{\abovecaptionskip}{.5\baselineskip}
  \setlength{\belowcaptionskip}{\z@}
  \long\def\@makecaption#1#2{%
    \vskip\abovecaptionskip
    {\nxtthesis@zehnpunkt\bfseries\centering #1.\ #2\par}%
    \vskip\belowcaptionskip}
  \AtBeginDocument{%
    \@ifpackageloaded{biblatex}{%
      \setlength{\bibhang}{1cm}%
      \renewcommand*{\bibfont}{\normalfont\normalsize\setstretch{1}}%
    }{}%
  }
\fi

\ifnxtthesis@english
  \fakultaet{NXT Sustainability and Technology}
  \hochschule{Reutlingen University}
\else
  \fakultaet{NXT Nachhaltigkeit und Technologie}
  \hochschule{Hochschule Reutlingen}
\fi

\PassOptionsToPackage{pdfusetitle}{hyperref}
\RequirePackage{hyperref}
\hypersetup{
  hidelinks,
  pdfdisplaydoctitle,
}
\ifnxtthesis@english
  \hypersetup{pdflang=en}
\else
  \hypersetup{pdflang=de-DE}
\fi

\RequirePackage{makeidx}
\makeindex

\RequirePackage{booktabs}

\newcommand{\Index}[1]{\index{#1}\emph{#1}}

\RequirePackage{acro}
\RequirePackage{accsupp}
\RequirePackage{array}
\RequirePackage{longtable}
\NewAcroTemplate[heading]{nxtkapitel}
  {\chapter*{\acrolistname}\markboth{\acrolistname}{\acrolistname}}
\acsetup{
  list/heading  = nxtkapitel,
  list/display  = used,
  list/template = longtable,
  list/exclude  = symbol,
  make-links    = true,
}
\newcommand{\nxtthesis@kapitaelchen}[1]{%
  \ifcsname\f@encoding/\f@family/\f@series/sc\endcsname
    {\scshape #1}%
  \else
    \MakeUppercase{#1}%
  \fi
}
\ifnxtthesis@echtekapitaelchen
  \acsetup{format/short = \nxtthesis@kapitaelchen}
\fi
\NewDocumentCommand{\kapitaelchen}{m}{%
  \ifnxtthesis@echtekapitaelchen
    \nxtthesis@kapitaelchen{#1}%
  \else
    \MakeUppercase{#1}%
  \fi
}
\acsetup{
  templates/colspec = {
    >{\bfseries}l@{\hspace{2em}}>{\raggedright\arraybackslash}m{.72\linewidth}
  }
}
\ifnxtthesis@english
  \acsetup{list/name = List of Abbreviations}
\else
  \acsetup{list/name = Abkürzungsverzeichnis}
\fi

\ExplSyntaxOn
\tl_new:N \l__nxt_akronym_id_tl
\tl_new:N \l__nxt_akronym_kurz_tl
\cs_new_protected:Npn \__nxt_akronym:nnn #1#2#3
  {
    \tl_set:Nx \l__nxt_akronym_id_tl { \text_lowercase:n {#2} }
    % Die Kurzform wird nur dann klein geschrieben, wenn sie auch in
    % Kapitälchen gesetzt wird -- echte Kapitälchen entstehen nur aus
    % Kleinbuchstaben. Bringt die Schrift keine mit, bleibt die Kurzform
    % groß, sonst stünde »mse« klein im Text.
    \legacy_if:nTF { nxtthesis@echtekapitaelchen }
      { \tl_set_eq:NN \l__nxt_akronym_kurz_tl \l__nxt_akronym_id_tl }
      { \tl_set:Nn \l__nxt_akronym_kurz_tl {#2} }
    \use:x
      {
        \exp_not:N \DeclareAcronym { \l__nxt_akronym_id_tl }
          {
            short     = { \l__nxt_akronym_kurz_tl } ,
            long      = { \exp_not:n {#3} } ,
            pdfstring = { \exp_not:n {#2} } ,
            short-acc = { \exp_not:n {#2} } ,
            \exp_not:n {#1}
          }
      }
  }
\NewDocumentCommand \akronym { O{} m m }
  { \__nxt_akronym:nnn {#1} {#2} {#3} }

\cs_new_protected:Npn \__nxt_symbol:nnnn #1#2#3#4
  {
    \use:x
      {
        \exp_not:N \DeclareAcronym { sym- \exp_not:n {#2} }
          {
            short        = { \exp_not:N \ensuremath { \exp_not:n {#3} } } ,
            long         = { \exp_not:n {#4} } ,
            short-format = { } ,
            tag          = symbol ,
            % Sortiert wird nach dem Kürzel, nicht nach dem Zeichen: Die
            % Kurzform ist hier Mathematik und ließe sich nicht ordnen.
            sort         = { \exp_not:n {#2} } ,
            % short-acc muss gesetzt sein. Die Klasse lädt accsupp (damit
            % die Kapitälchen der Abkürzungen kopierbar bleiben), und acro
            % leitet den Kopiertext sonst selbst aus der Kurzform ab --
            % dabei wendet es » ` « auf deren erstes Token an. Bei einem
            % Zeichen wie \lambda ist das ein Makro, und der Lauf bricht
            % mit »Improper alphabetic constant« ab. Das Kürzel ist als
            % Kopiertext ohnehin die bessere Wahl: aus \lambda wird beim
            % Kopieren »lambda« statt eines unbrauchbaren Zeichens.
            short-acc    = { \exp_not:n {#2} } ,
            % Aus demselben Grund das Kürzel für die PDF-Lesezeichen und
            % Linkziele: Mathematik lässt sich dort nicht darstellen, und
            % hyperref warnte sonst für jedes Symbol.
            pdfstring    = { \exp_not:n {#2} } ,
            \tl_if_empty:nF {#1} { extra = { \exp_not:n {#1} } , }
          }
      }
  }
\NewDocumentCommand \Symbol { O{} m m m }
  { \__nxt_symbol:nnnn {#1} {#2} {#3} {#4} }
\ExplSyntaxOff

\newcommand{\printsymbols}{%
  \begingroup
  \renewcommand*{\theHtable}{symbole.\arabic{table}}%
  \printacronyms[
    include = symbol,
    exclude = {},
    display = all,
    name    = \nxtthesis@symbolname,
  ]%
  \endgroup
}

\ifnxtthesis@english
  \newcommand{\nxtthesis@symbolname}{List of Symbols}
\else
  \newcommand{\nxtthesis@symbolname}{Symbolverzeichnis}
\fi

\ifnxtthesis@english
  \akronym[first-style = long]{NXT}{\acs*{nxt} Sustainability and Technology}
  \akronym{HSRT}{Reutlingen University}
\else
  \akronym[first-style = long]{NXT}{\acs*{nxt} Nachhaltigkeit und Technologie}
  \akronym{HSRT}{Hochschule Reutlingen}
\fi

\ifnxtthesis@richtlinie
\renewcommand*{\maketitle}{%
  \pagenumbering{roman}%
  \begin{titlepage}
    % Die Zeilen der Titelseite sind Absätze (siehe \nxtthesis@zeile);
    % der Absatzabstand der Richtlinie gilt hier nicht.
    \parskip=\z@\relax
    \setstretch{1}%
    \fontsize{12pt}{16pt}\selectfont
    \begin{center}
      % Wie in der anderen Titelseite wird der Block mit \par gesetzt
      % und nicht mit \\: Ein \\ hinter einem leeren Feld bricht mit
      % »There's no line here to end« ab.
      \nxtthesis@titellogo{\vspace{2\baselineskip}}%
      {\fontsize{14pt}{18pt}\selectfont\bfseries\@title\par}
      \nxtthesis@untertitel{\vspace{.5\baselineskip}}
      \vspace{3\baselineskip}
      \ifdefempty{\@akademischergrad}{}{%
        \nxtthesis@txt@arbeitgrad\par
        \printakademischergrad\par
        \vspace{3\baselineskip}
      }%
      \nxtthesis@zeile{\@studiengang}{\nxtthesis@txt@studiengang\ \printstudiengang}%
      \nxtthesis@txt@anderhochschule\ \printhochschule\par
    \end{center}
    \vfill
    \noindent\nxtthesis@txt@vorgelegtvon\par
    \vspace{.5\baselineskip}
    \nxtthesis@zeile{\@author}{\@author}%
    \nxtthesis@zeile{\@matrikelnummer}{\nxtthesis@txt@matrikel\ \@matrikelnummer}%
    \vspace{2\baselineskip}

    \nxtthesis@zeile{\@erstpruef}{\nxtthesis@txt@vorgelegtbei}%
    \vspace{.5\baselineskip}
    \nxtthesis@zeile{\@erstpruef}{\@erstpruef}%
    \nxtthesis@zeile{\@zweitpruef}{\@zweitpruef}%
    \vspace{2\baselineskip}

    \noindent
    \printort, \@abgabedatum
  \end{titlepage}
  \nxtthesis@vorspannzahlen
}
\else
\renewcommand*{\maketitle}{%
  \pagenumbering{roman}%
  \begin{titlepage}
    \parskip=\z@\relax
    % Der Satzspiegel gibt dem Fußsteg viel Raum -- auf einer Textseite
    % ist das richtig, auf der Titelseite lässt es den unteren Block zu
    % hoch enden. \enlargethispage gilt nur für diese eine Seite und
    % lässt sie tiefer laufen; der dehnbare Raum verteilt sich dann bis
    % dorthin.
    \enlargethispage{3cm}%
    \begin{center}
      \null\vspace{2cm}
      % Ohne die Option »logo« oder ohne NXT_Logo.pdf entsteht auch der
      % Abstand darunter nicht, sonst rutschte der Titel ohne Grund nach
      % unten.
      \nxtthesis@titellogo{\vspace{2\baselineskip}}%
      {\huge\nxtthesis@titelschrift\@title\par}
      \nxtthesis@untertitel{\vspace{.75\baselineskip}}
      \vfill
      % Auch hier \par statt \\: Ein leeres Feld ließe sonst ein \\ ins
      % Leere laufen (»There's no line here to end«).
      \ifdefempty{\@akademischergrad}{}{%
        \nxtthesis@txt@thesisgrad\par
        \vspace{.5\baselineskip}
        \printakademischergrad\par
        \vspace{.5\baselineskip}
      }%
      \nxtthesis@txt@fakultaet\ \printfakultaet\par
      \nxtthesis@txt@derhochschule\ \printhochschule\par
      \ifdefempty{\@studiengang}{}{%
        \vspace{.5\baselineskip}
        \nxtthesis@txt@studiengang\par
        \vspace{.5\baselineskip}
        \printstudiengang\par
      }%
    \end{center}
    \vfill
    \noindent\nxtthesis@txt@vorgelegtvon\par
    \nxtthesis@zeile{\@author}{\@author}%
    \nxtthesis@zeile{\@adresse}{\@adresse}%
    \nxtthesis@zeile{\@matrikelnummer}{\nxtthesis@txt@matrikel\ \@matrikelnummer}%
    \vspace{24pt}
    \nxtthesis@zeile{\@abgabedatum}{\nxtthesis@txt@abgabe\ \@abgabedatum}%
    \vspace{1em}
    \nxtthesis@zeile{\@erstpruef}{\@erstpruefbezeichnung: \@erstpruef}%
    \nxtthesis@zeile{\@zweitpruef}{\@zweitpruefbezeichnung: \@zweitpruef}%
  \end{titlepage}
  \nxtthesis@vorspannzahlen
}
\fi

\ExplSyntaxOn
\cs_new_protected:Npn \__nxt_listings_tagging:
  {
    \cs_if_exist:NT \tag_if_active:T
      {
        \tag_if_active:T
          {
            \IfFileExists { latex-lab-listings.sty }
              { \RequirePackage { latex-lab-listings } }
              {
                \IfFileExists { tagpdfdocu-listings-support.ltx }
                  {
                    \char_set_catcode_letter:N \@
                    \input { tagpdfdocu-listings-support.ltx }
                    \char_set_catcode_other:N \@
                  }
                  { }
              }
          }
      }
  }
\AddToHook { begindocument/before }
  { \IfPackageLoadedT { listings } { \__nxt_listings_tagging: } }
\ExplSyntaxOff

\newcommand{\nxtthesis@erkl@grundsatz}{%
  Ich versichere hiermit, die Arbeit selbstständig verfasst und keine
  anderen als die angegebenen Quellen und Hilfsmittel benutzt, die
  wörtlich oder inhaltlich übernommenen Stellen als solche kenntlich
  gemacht und die Allgemeine Studien- und Prüfungsordnung für das
  Bachelor- und Masterstudium der Hochschule Reutlingen, die
  fachspezifische Studien- und Prüfungsordnung und die Regeln zur
  Sicherung der guten wissenschaftlichen Praxis der Hochschule
  Reutlingen beachtet zu haben.\par}
\newcommand{\nxtthesis@erkl@nurhier}{%
  Diese Arbeit oder Teile dieser Arbeit sind weder Bestandteil einer
  anderen Prüfungsleistung an dieser noch an einer anderen
  wissenschaftlichen Institution.\par}
\newcommand{\nxtthesis@erkl@partner}[2]{%
  Diese Arbeit wird gemäß der fachspezifischen Studien- und
  Prüfungsordnung\ifblank{#1}{}{ #1} auch an der Partnerhochschule #2
  eingereicht. Darüber hinaus sind diese Arbeit oder Teile dieser
  Arbeit weder Bestandteil einer anderen Prüfungsleistung an dieser
  noch an einer anderen wissenschaftlichen Institution.\par}
\newcommand{\nxtthesis@erkl@ki@keine}{%
  Ich versichere außerdem, keine KI-basierten, inhaltsgenerierenden
  Hilfsmittel verwendet zu haben.\par}
\newcommand{\nxtthesis@erkl@ki@kennzeichnung}{%
  Ich versichere außerdem, dass die Nutzung von KI-Tools von der/m
  Prüfenden explizit erlaubt wurde und ich in meiner Arbeit davon
  Gebrauch gemacht habe. Die verwendeten KI-Tools sind der Arbeit nach
  fakultätsinternen Zitier- und Dokumentationsvorgaben angefügt. Ich
  habe inhaltsgenerierende KI-Tools lediglich unterstützend eingesetzt
  und die Kernthesen meiner Arbeit nicht von der KI übernehmen lassen.
  Ich bin mir bewusst, dass die Nutzung von KI-Tools keine Garantie für
  Richtigkeit bietet und ich die Verantwortung für alle KI-generierten
  Inhalte in dieser Arbeit trage.\par}
\newcommand{\nxtthesis@erkl@ki@ohnekennzeichnung}{%
  Ich versichere außerdem, dass ich inhaltsgenerierende KI-Tools
  lediglich unterstützend eingesetzt und die Kernthesen meiner Arbeit
  nicht von der KI habe übernehmen lassen. Ich bin mir bewusst, dass die
  Nutzung von KI-Tools keine Garantie für Richtigkeit bietet und ich die
  Verantwortung für alle KI-generierten Inhalte in dieser Arbeit
  trage.\par}

\ExplSyntaxOn
\tl_new:N \l__nxt_erkl_ki_tl
\tl_new:N \l__nxt_erkl_partner_tl
\tl_new:N \l__nxt_erkl_ordnung_tl
\keys_define:nn { nxtthesis / erklaerung }
  {
    ki .choices:nn =
      { keine , kennzeichnung , ohnekennzeichnung }
      { \tl_set_eq:NN \l__nxt_erkl_ki_tl \l_keys_choice_tl } ,
    partnerhochschule .tl_set:N = \l__nxt_erkl_partner_tl ,
    partnerordnung    .tl_set:N = \l__nxt_erkl_ordnung_tl ,
  }
\NewDocumentCommand \eigenständigkeitserklärung { O{} }
  {
    \group_begin:
    \keys_set:nn { nxtthesis / erklaerung } {#1}
    \tl_if_empty:NT \l__nxt_erkl_ki_tl
      {
        \msg_warning:nn { nxtthesis } { ki-fehlt }
      }
    % V: die Inhalte übergeben, nicht die Variablen -- \ifblank prüft
    % sonst den Namen der Variablen und hielte sie nie für leer.
    \use:e
      {
        \exp_not:N \nxtthesis@erklaerung
          { \exp_not:V \l__nxt_erkl_ki_tl }
          { \exp_not:V \l__nxt_erkl_partner_tl }
          { \exp_not:V \l__nxt_erkl_ordnung_tl }
      }
    \group_end:
  }
\msg_new:nnn { nxtthesis } { ki-fehlt }
  {
    Die~Erklärung~zur~wissenschaftlichen~Arbeit~verlangt~eine~Angabe~
    zur~Nutzung~von~KI-Tools. \\
    Bitte~\iow_char:N\\eigenständigkeitserklärung[ki=...]~mit~
    keine,~kennzeichnung~oder~ohnekennzeichnung~angeben.
  }
\ExplSyntaxOff

\newcommand{\nxtthesis@erklaerung}[3]{%
  \clearpage
  \begin{otherlanguage}{ngerman}%
    \addchap{Erklärung zur wissenschaftlichen Arbeit}%
    \nxtthesis@erkl@grundsatz
    \ifblank{#2}{\nxtthesis@erkl@nurhier}{\nxtthesis@erkl@partner{#3}{#2}}%
    \ifblank{#1}{}{%
      \csname nxtthesis@erkl@ki@#1\endcsname
    }%
    \vspace{3\baselineskip}%
    % Links Ort und Datum, rechts die Linie für die Unterschrift und
    % darunter der Name -- wie in der Vorlage der Richtlinie. Beide
    % Blöcke hängen an ihrer ersten Grundlinie ([t]); die Linie steht
    % damit auf der Höhe von Ort und Datum.
    \par\noindent
    \begin{minipage}[t]{.45\textwidth}
      \printort, \ifdefempty{\@abgabedatum}{\hrulefill}{\@abgabedatum}%
    \end{minipage}%
    \hfill
    \begin{minipage}[t]{.45\textwidth}
      \rule{\linewidth}{.4pt}\par
      \@author
    \end{minipage}\par
  \end{otherlanguage}%
}
\endinput
%%
%% End of file `nxtthesis.cls'.
