% schulmathematik bundle: document class schulma-ab
% Version 1.6
% 30. Dezember 2023
\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{schulma-ab}{2023-12-30}{1.6}{Dokumentenklasse fuer Arbeitsblaetter}

\tl_new:N \g_schulma_ab_kurs_tl
\tl_new:N \g_schulma_ab_thema_tl
\tl_new:N \g_schulma_ab_bearbeiter_tl

\str_new:N \g_schulma_ab_datum_str
\str_new:N \g_schulma_ab_nummer_str

\bool_new:N \g_schulma_ab_afuenf_bool
\bool_new:N \g_schulma_ab_querformat_bool
\bool_new:N \g_schulma_ab_oesterreich_bool
\bool_new:N \g_schulma_ab_musterloesung_bool

\DeclareOption {A4quer}
  {
    \bool_gset_true:N \g_schulma_ab_querformat_bool
  }

\DeclareOption {A5}
  {
    \PassOptionsToClass {a5paper} {scrartcl}
    \bool_gset_true:N \g_schulma_ab_afuenf_bool
  }

\DeclareOption {A5quer}
  {
    \PassOptionsToClass {a5paper} {scrartcl}
    \bool_gset_true:N \g_schulma_ab_afuenf_bool
    \bool_gset_true:N \g_schulma_ab_querformat_bool
  }

\DeclareOption {AT}
  {
    \bool_gset_true:N \g_schulma_ab_oesterreich_bool
  }

\DeclareOption {Musterloesung}
  {
    \bool_gset_true:N \g_schulma_ab_musterloesung_bool
  }

\DeclareOption*
  {
    \PassOptionsToClass {\CurrentOption} {scrartcl}
  }

\ProcessOptions \relax

\NewDocumentCommand \Kurs {m}
  {
    \tl_gset:Nn \g_schulma_ab_kurs_tl {#1}
  }

\NewDocumentCommand \Datum {m}
  {
    \str_set:Nn \g_schulma_ab_datum_str {#1}
  }

\NewDocumentCommand \Thema {o m}
  {
    \IfValueT{#1}
      {
        \tl_gset:Nn \g_schulma_ab_nummer_str {#1}
      }
    \tl_gset:Nn \g_schulma_ab_thema_tl {#2}
  }

\NewDocumentCommand \Bearbeiter {m}
  {
    \tl_gset:Nn \g_schulma_ab_bearbeiter_tl {#1}
  }

\LoadClass {scrartcl}

\RequirePackage {adjustbox}

\bool_if:NTF \g_schulma_ab_oesterreich_bool
  {
    \RequirePackage [naustrian] {babel}
    \RequirePackage [naustrian] {isodate}
  }
  {
    \RequirePackage [ngerman] {babel}
    \RequirePackage [ngerman] {isodate}
  }

%\RequirePackage [useregional=numeric] {datetime2} % zeigt Tag und Monat z. Zt. zweistellig an
\RequirePackage {schulma}
\RequirePackage {schulma-physik}
\RequirePackage {tasks}
\RequirePackage {enumitem}
\RequirePackage {scrlayer-scrpage}
\RequirePackage {comment}

\bool_if:NT \g_schulma_ab_querformat_bool
  {
    \KOMAoption {paper} {landscape}
  }

\bool_if:NTF \g_schulma_ab_afuenf_bool
  {
    \KOMAoption {DIV} {11}
  }
  {
    \KOMAoption {DIV} {14}
  }

\ExplSyntaxOff

\BeforeClosingMainAux{\addtocounter{page}{-1}\label{LastPage}}

\setlength\parindent{0pt}

% tasks: j überspringen
\newcommand*\@schulmaalph[1]{\ifnum #1>9 \@alph{\numexpr #1+1}\else \@alph{#1}\fi}
\newcommand*\schulmaalph[1]{\@schulmaalph{\value{#1}}}

\settasks{label-align=right,
  item-indent=2.2em,
  label-offset=0.5em,
  label-width=1.3em,
  label=\schulmaalph*),
  after-skip=4.5pt plus2pt minus1pt}

\settasks{before-skip=9pt plus4pt minus2pt,
  after-item-skip=9pt plus4pt minus2pt}

\addtokomafont{pagefoot}{\upshape}
\cfoot{\pagemark/\pageref{LastPage}}
\ofoot{}

%\DTMlangsetup*{twodigits=false,datesep={.\thinspace}} % Option twodigits z. Zt. nicht implementiert

% isodate: Monat ggf. einstellig anzeigen:
\numdate[arabic]
% isodate: Tag ggf. einstellig anzeigen:
\isotwodigitdayfalse
% isodate: Abstand zwischen Monat und Jahr im numerischen Format:
\monthyearsepgerman{\,}{\,}

\ExplSyntaxOn

\cs_new:Npn \schulma_ab_kopf:
  {
    \noindent
    \parbox [t] {5cm} {\g_schulma_ab_kurs_tl}
    \hfill
    \str_if_empty:NF \g_schulma_ab_datum_str
      {
        %\DTMdate {\g_schulma_ab_datum_str}
        \printdate {\g_schulma_ab_datum_str} % isodate-Befehl
      }
    \tl_if_empty:NF \g_schulma_ab_thema_tl
      {
        \section*
          {
            \str_if_empty:NF \g_schulma_ab_nummer_str
              {
                \g_schulma_ab_nummer_str
                \hspace {0,5em}
              }
            \g_schulma_ab_thema_tl
          }
      }
    \tl_if_empty:NF \g_schulma_ab_bearbeiter_tl
      {
        \lofoot
          {
            \footnotesize
            \g_schulma_ab_bearbeiter_tl
            ,~
            \today
          }
      }
  }

%\AfterEndPreamble {\schulma_ab_kopf:}
\AtBeginDocument {\schulma_ab_kopf:}

\cs_new_protected:Npn \schulma_ab_kreis:n #1
  {
    \tikz [ baseline = (Zahl.base) ]
      {
        \node [ shape=circle, fill=black!60, minimum~width=5.5mm, inner~sep=0pt ]
          (Zahl) { \textcolor {white} { \small \sffamily #1 } } ;
      }
  }

\NewDocumentEnvironment {Kreisliste} { }
  {
    \begin {enumerate} [ label=\schulma_ab_kreis:n {\arabic*},
      labelsep=0.8em, leftmargin=1.2cm ]
  }
  {
    \end {enumerate}
  }

\tl_new:N \l_schulma_ab_aufgabentitel_tl
\tl_set:Nn \l_schulma_ab_aufgabentitel_tl {Aufgabe}

\NewDocumentCommand \Aufgabentitel {m}
  {
    \tl_set:Nn \l_schulma_ab_aufgabentitel_tl {#1}
  }

\newcounter {Aufgabe}

\newlength \Aufgabenabstand
\setlength \Aufgabenabstand {24pt plus12pt minus8pt}

\NewDocumentEnvironment {Aufgaben} { }
  {
    \begin {list} { }
      {
        \setlength \leftmargin {0pt}
        \setlength \partopsep {0pt}
        \setlength \topsep {0.75\Aufgabenabstand}
        \setlength \itemsep {\Aufgabenabstand}
      }
    % innerhalb der Liste Originalwert verwenden
    \setlength \topsep {9pt plus3pt minus5pt}
  }
  {
    \end {list}
  }

% #1 (Stern): ohne Punkt
\NewDocumentCommand \Aufgabe {s}
  {
    \item
    \stepcounter {Aufgabe}
    \group_begin:
    \sffamily \bfseries
    \l_schulma_ab_aufgabentitel_tl
    \c_space_tl
    \arabic {Aufgabe}
    \IfBooleanF {#1} {.~}
    \group_end:
  }

% #1 (Stern): ohne Punkt
\NewDocumentCommand \Uebung {s}
  {
    \group_begin:
    \tl_set:Nn \l_schulma_ab_aufgabentitel_tl {\"Ubung}
    \IfBooleanTF {#1} { \Aufgabe* } { \Aufgabe }
    \group_end:
  }

\newcounter {Teilaufgabe} [Aufgabe]

\newlength \Teilaufgabenabstand
\setlength \Teilaufgabenabstand {4.5pt plus2pt minus1pt}

\NewDocumentEnvironment {Teilaufgaben} { }
  {
    \renewcommand \labelenumi { ( \roman {enumi} ) }

    \begin {list} { \stepcounter {Teilaufgabe} \alph {Teilaufgabe} ) }
      {
        \setlength \topsep {\Teilaufgabenabstand}
        \setlength \itemsep {\Teilaufgabenabstand}
      }
  }
  {
    \end {list}
  }

\NewDocumentCommand \Luecke {m}
  {
    \raisebox {-1,5mm} { \rule {#1} {0,4pt} }
  }

\NewDocumentEnvironment {Lsg} {s}
% Stern: Lösung beginnt mit einer Gleichung, kein Abstand erforderlich
  {
    \IfBooleanF {#1} { \par \medskip }
  }
  {
  }

\bool_if:NF \g_schulma_ab_musterloesung_bool
  {
    \excludecomment {Lsg}
  }

\NewDocumentCommand \NurAufgabe {+m}
  {
    \bool_if:NF \g_schulma_ab_musterloesung_bool {#1}
  }

\NewDocumentCommand \NurLoesung {+m}
  {
    \bool_if:NT \g_schulma_ab_musterloesung_bool {#1}
  }
