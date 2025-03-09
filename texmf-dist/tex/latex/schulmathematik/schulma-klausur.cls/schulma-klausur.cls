% schulmathematik bundle: document class schulma-klausur
% Version 1.6
% 30. Dezember 2023
\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{schulma-klausur}{2023-12-30}{1.6}{Dokumentenklasse fuer Klausuren}

\RequirePackage {etoolbox}

\str_new:N \g_schulma_klausur_datum_str
\str_new:N \g_schulma_klausur_loesungsdatum_str
\str_new:N \g_schulma_klausur_titel_str
\str_new:N \g_schulma_klausur_teiltitel_str
\str_new:N \g_schulma_klausur_bearbeitungszeit_str
\str_new:N \g_schulma_klausur_formeldokumentseiten_str

\tl_new:N \g_schulma_klausur_musterloesungstitel_tl
\tl_new:N \g_schulma_klausur_kurs_tl
\tl_new:N \g_schulma_klausur_nummer_tl
\tl_new:N \g_schulma_klausur_untertitel_tl
\tl_new:N \g_schulma_klausur_hilfsmittel_tl
\tl_new:N \l_schulma_klausur_aufgabentitel_tl

\bool_new:N \g_schulma_klausur_oesterreich_bool
\bool_new:N \g_schulma_klausur_afuenfquer_bool
\bool_new:N \g_schulma_klausur_schriftliche_lernkontrolle_bool
\bool_new:N \g_schulma_klausur_gruppe_a_bool
\bool_new:N \g_schulma_klausur_gruppe_b_bool
\bool_new:N \g_schulma_klausur_pqformel_bool
\bool_new:N \g_schulma_klausur_differenzenquotient_bool
\bool_new:N \g_schulma_klausur_differentialquotient_bool
\bool_new:N \g_schulma_klausur_musterloesung_bool
\bool_new:N \g_schulma_klausur_praesentation_bool
\bool_new:N \l_schulma_klausur_loesung_bool

\int_new:N \g_schulma_klausur_anzahl_hilfen_int
\int_new:N \g_schulma_klausur_gesamtzeitbedarf_int
\int_new:N \g_schulma_klausur_gesamtpunktzahl_int

\clist_new:N \l_schulma_klausur_notenliste_clist

\tl_const:Nn \c_schulma_klausur_pqformel_tl
  {
    $p$-$q$-Formel:
    \[ x\sb{1;2} = - \frac{p}{2} \pm \sqrt { \left(\frac{p}{2}\right)^2-q } \]
  }

\tl_const:Nn \c_schulma_klausur_differenzenquotient_tl
  {
    Differenzenquotient:
    \[ m = \frac {f(x\sb{2})-f(x\sb{1})} {x\sb{2}-x\sb{1}} \]
  }

\tl_const:Nn \c_schulma_klausur_differentialquotient_tl
  {
    Differentialquotient:
    \[ f' ( x\sb{0} ) = \lim \sb { x \rightarrow x\sb{0} }
    \frac {f(x)-f(x\sb{0})} {x-x\sb{0}} \]
  }

\msg_new:nnn {schulma-klausur} {Gruppe fehlt}
  {
    In~Zeile~ \msg_line_number: \c_space_tl
    wird~der~Befehl~ \Gruppen \c_space_tl
    verwendet.~Es~wurde~aber~keine~der~Klassenoptionen~GruppeA~und~GruppeB~
    gesetzt.~Ausgegeben~wird~der~Text~für~Gruppe~A.
  }

\msg_new:nnn {schulma-klausur} {Aufgabennachricht}
  {
    Aufgabe~ \arabic {Aufgabe} :~
    \str_if_eq:nnTF {#1} {-NoValue-} {[ohne~Titel]} {#1}
    \str_if_eq:nnF {#2} {-NoValue-} {,~#2~min}
    \str_if_eq:nnF {#3} {-NoValue-} {,~#3~Punkte}
  }

\msg_new:nnn {schulma-klausur} {Aufgabensumme}
  {
    insgesamt~ \arabic {Aufgabe} ~Aufgaben
    \int_compare:nNnT { \g_schulma_klausur_gesamtzeitbedarf_int } > {0}
      {
        ,~
        \int_to_arabic:n { \g_schulma_klausur_gesamtzeitbedarf_int }
        \c_space_tl min
      }
    \int_compare:nNnT { \g_schulma_klausur_gesamtpunktzahl_int } > {0}
      {
        ,~
        \int_to_arabic:n { \g_schulma_klausur_gesamtpunktzahl_int }
        \c_space_tl Punkte
      }
  }

\tl_set:Nn \l_schulma_klausur_aufgabentitel_tl {Aufgabe}

\DeclareOption {SLK}
  {
    \bool_gset_true:N \g_schulma_klausur_schriftliche_lernkontrolle_bool
  }

\DeclareOption {p-q-Formel}
  {
    \int_incr:N \g_schulma_klausur_anzahl_hilfen_int
    \bool_set_true:N \g_schulma_klausur_pqformel_bool
  }

\DeclareOption {Differenzenquotient}
  {
    \int_incr:N \g_schulma_klausur_anzahl_hilfen_int
    \bool_set_true:N \g_schulma_klausur_differenzenquotient_bool
  }

\DeclareOption {Differentialquotient}
  {
    \int_incr:N \g_schulma_klausur_anzahl_hilfen_int
    \bool_set_true:N \g_schulma_klausur_differentialquotient_bool
  }

\DeclareOption {A5quer}
  {
    \PassOptionsToClass {a5paper} {scrartcl}
    \bool_gset_true:N \g_schulma_klausur_afuenfquer_bool
  }

\DeclareOption {AT}
  {
    \bool_gset_true:N \g_schulma_klausur_oesterreich_bool
  }

\DeclareOption {GruppeA}
  {
    \bool_gset_true:N \g_schulma_klausur_gruppe_a_bool
    \bool_gset_false:N \g_schulma_klausur_gruppe_b_bool
  }

\DeclareOption {GruppeB}
  {
    \bool_gset_true:N \g_schulma_klausur_gruppe_b_bool
    \bool_gset_false:N \g_schulma_klausur_gruppe_a_bool
  }

\DeclareOption {Musterloesung}
  {
    \bool_gset_true:N \g_schulma_klausur_musterloesung_bool
    \bool_gset_true:N \g_schulma_klausur_praesentation_bool
  }

\DeclareOption {MusterloesungD}
  {
    \bool_gset_true:N \g_schulma_klausur_musterloesung_bool
    \bool_gset_false:N \g_schulma_klausur_praesentation_bool
  }

\DeclareOption*
  {
    \PassOptionsToClass {\CurrentOption} {scrartcl}
    \PassOptionsToClass {\CurrentOption} {schulma-praes}
  }

\ProcessOptions \relax

\bool_if:NTF \g_schulma_klausur_schriftliche_lernkontrolle_bool
  {
    \str_gset:Nn \g_schulma_klausur_titel_str {Schriftliche~Lernkontrolle}
  }
  {
    \str_gset:Nn \g_schulma_klausur_titel_str {Klausur}
  }

\tl_gset:Nn \g_schulma_klausur_musterloesungstitel_tl
  {
    Musterl\"osung~der~
    \tl_if_empty:NF \g_schulma_klausur_nummer_tl
      {
        \g_schulma_klausur_nummer_tl.~
      }
    \bool_if:NTF \g_schulma_klausur_schriftliche_lernkontrolle_bool
      {
        schriftlichen~Lernkontrolle
      }
      {
        \g_schulma_klausur_titel_str
      }
    \str_if_empty:NF \g_schulma_klausur_datum_str
      {
        \c_space_tl
        \mbox { vom~ \DTMdate { \g_schulma_klausur_datum_str } }
      }
    \str_if_empty:NF \g_schulma_klausur_teiltitel_str
      {
        \\ [1ex]
        \textit { \g_schulma_klausur_teiltitel_str }
      }
  }

% \PassOptionsToPackage {override} {xcolor} % verursacht seit 17. Nov. 2023 Fehlermeldung

\NewDocumentCommand \Nr {m}
  {
    \tl_gset:Nn \g_schulma_klausur_nummer_tl {#1}
  }

\NewDocumentCommand \Loesungsdatum {m}
  {
    \str_gset:Nn \g_schulma_klausur_loesungsdatum_str {#1}
  }

\NewDocumentCommand \Formeldokument {m}
  {
    \str_gset:Nn \g_schulma_klausur_formeldokumentseiten_str {#1}
  }

\newcounter {Aufgabe}
\newcounter {Teilaufgabe} [Aufgabe]

\newlength \Aufgabenabstand
\setlength \Aufgabenabstand {24pt plus12pt minus8pt}

\newlength \Teilaufgabenabstand
\setlength \Teilaufgabenabstand {4.5pt plus2pt minus1pt}

\RequirePackage {schulma}
\RequirePackage {schulma-physik}

\bool_if:NTF \g_schulma_klausur_praesentation_bool
  {
    \LoadClass [t] {schulma-praes}

    \date
      {
        \str_if_empty:NTF \g_schulma_klausur_loesungsdatum_str
          {
            \today
          }
          {
            \printdate { \g_schulma_klausur_loesungsdatum_str } % isodate-Befehl
          }
      }

    \tl_set:Nn \g_schulma_praes_nummer_tl
      {
        \g_schulma_klausur_musterloesungstitel_tl
      }

    \resetcounteronoverlays {Aufgabe}

    \NewDocumentCommand \Aufgabe {s o o d()}
      {
        \stepcounter {Aufgabe}
        \frametitle
          {
            \l_schulma_klausur_aufgabentitel_tl
            \c_space_tl
            \arabic {Aufgabe}
            \IfValueT {#2} { \c_colon_str \c_space_tl #2 }
          }
        \FarbeAufgabe
      }

    \NewDocumentCommand \Gruppen {smm}
      {
        \bool_if:nTF \g_schulma_klausur_gruppe_a_bool {#2}
          {
            \bool_if:nTF \g_schulma_klausur_gruppe_b_bool {#3}
              {
                \IfBooleanTF {#1}
                  {
                    \fbox { \textbf{A} } \nobreakspace #2
                    \c_space_tl
                    \fbox { \textbf{B} } \nobreakspace #3
                  }
                  {
                    \par
                    \medskip
                    \fbox { \textbf {A} } \c_space_tl #2
                    \par
                    \medskip
                    \fbox { \textbf {B} } \c_space_tl #3
                  }
              }
          }
      }

    \resetcounteronoverlays {Teilaufgabe}

    \NewDocumentEnvironment {Teilaufgaben} { }
      {
        \begin {list}
          {
            \FarbeAufgabe
            \stepcounter {Teilaufgabe}
            \alph {Teilaufgabe} )
          }
          {
            \setlength \topsep { \Teilaufgabenabstand }
            \setlength \itemsep { \Teilaufgabenabstand }
            \bool_if:NF \l_schulma_klausur_loesung_bool
              {
                \FarbeAufgabe
              }
          }
      }
      {
        \end {list}
      }

    \RenewDocumentCommand \Datum {m}
      {
        \str_gset:Nn \g_schulma_klausur_datum_str {#1}
      }
  }
  {
    \LoadClass {scrartcl}
    \RequirePackage {scrlayer-scrpage}

    \BeforeClosingMainAux
      {
        \addtocounter{page}{-1}
        \label{LastPage}
      }

    \bool_if:NT \g_schulma_klausur_musterloesung_bool
      {
        \bool_if:NTF \g_schulma_klausur_oesterreich_bool
          {
            \RequirePackage [naustrian] {isodate}
          }
          {
            \RequirePackage [ngerman] {isodate}
          }

        % isodate: Monat ggf. einstellig anzeigen:
        \numdate[arabic]
        % isodate: Tag ggf. einstellig anzeigen:
        \isotwodigitdayfalse
        % isodate: Abstand zwischen Monat und Jahr im numerischen Format:
        \monthyearsepgerman{\,}{\,}
      }

    \NewDocumentCommand \Kurs {m}
      {
        \tl_gset:Nn \g_schulma_klausur_kurs_tl {#1}
      }

    \NewDocumentCommand \Datum {m}
      {
        \str_gset:Nn \g_schulma_klausur_datum_str {#1}
      }

    \NewDocumentEnvironment {Teilaufgaben} { }
      {
        \renewcommand \labelenumi { ( \roman {enumi} ) }

        \begin {list} { \stepcounter {Teilaufgabe} \alph {Teilaufgabe} ) }
          {
            \setlength \topsep { \Teilaufgabenabstand }
            \setlength \itemsep { \Teilaufgabenabstand }
          }
      }
      {
        \end {list}
      }

    \AfterEndPreamble
      {
        \begin {list} { }
          {
            \setlength \leftmargin {0pt}
            \setlength \partopsep {0pt}
            \setlength \topsep { 0.75 \Aufgabenabstand }
            \setlength \itemsep { \Aufgabenabstand }
          }
        % innerhalb der Liste Originalwert verwenden
        \setlength \topsep {9pt plus3pt minus5pt}
      }

    \AtBeginDocument { \schulma_klausur_kopf: }

    \RequirePackage {pdfpages}
    \RequirePackage {comment}

    \pretocmd { \enddocument }
      {
        \end {list}
        \par
        \int_compare:nNnT { \g_schulma_klausur_anzahl_hilfen_int } > {1}
          {
            \vfill
            \noindent
            \textsl {Hilfen:}
            \begin {itemize}

            \bool_if:NT \g_schulma_klausur_pqformel_bool
              {
                \item
                \c_schulma_klausur_pqformel_tl
              }
            \bool_if:NT \g_schulma_klausur_differenzenquotient_bool
              {
                \item
                \c_schulma_klausur_differenzenquotient_tl
              }
            \bool_if:NT \g_schulma_klausur_differentialquotient_bool
              {
                \item
                \c_schulma_klausur_differentialquotient_tl
              }

            \end {itemize}
          }
        \int_compare:nNnT { \g_schulma_klausur_anzahl_hilfen_int } = {1}
          {
            \vfill
            \noindent
            \textsl {Hilfe:} ~

            \bool_if:NT \g_schulma_klausur_pqformel_bool
              {
                \c_schulma_klausur_pqformel_tl
              }
            \bool_if:NT \g_schulma_klausur_differenzenquotient_bool
              {
                \c_schulma_klausur_differenzenquotient_tl
              }
            \bool_if:NT \g_schulma_klausur_differentialquotient_bool
              {
                \c_schulma_klausur_differentialquotient_tl
              }
          }
        \str_if_empty:NF \g_schulma_klausur_formeldokumentseiten_str
          {
            \includepdf [ pages = \g_schulma_klausur_formeldokumentseiten_str ]
              {
                M_Dokument_mit_mathematischen_Formeln
              }
          }
      }{}{} % pretocmd hat vier Argumente

    \AtEndDocument { \msg_note:nn {schulma-klausur} {Aufgabensumme} }

    \NewDocumentCommand \Aufgabe {s o o d()}
      {
        \item
        \stepcounter {Aufgabe}
        \msg_note:nnnnn {schulma-klausur} {Aufgabennachricht} {#2} {#3} {#4}
        \group_begin:
        \sffamily \bfseries
        \l_schulma_klausur_aufgabentitel_tl
        \c_space_tl
        \arabic {Aufgabe}
        \IfValueT {#3}
          {
            \int_gadd:Nn \g_schulma_klausur_gesamtzeitbedarf_int {#3}
          }
        \IfValueT {#4}
          {
            \mdseries
            \rmfamily
            \slshape
            \c_space_tl
            (#4~Punkte)
            \int_gadd:Nn \g_schulma_klausur_gesamtpunktzahl_int {#4}
          }
        \IfBooleanF {#1} {.}
        \group_end:
        \peek_catcode:NF \c_space_token { \c_space_tl }
      }

    \NewDocumentCommand \Gruppen {smm}
      {
        \bool_if:NTF \g_schulma_klausur_gruppe_a_bool {#2}
          {
            \bool_if:NTF \g_schulma_klausur_gruppe_b_bool {#3}
              {
                \msg_warning:nn {schulma-klausur} {Gruppe fehlt}
                #2
              }
          }
      }

    \bool_if:NTF \g_schulma_klausur_afuenfquer_bool
      {
        \KOMAoption {paper} {landscape}
        \RequirePackage [top=2.7cm, bottom=3cm, hmargin=2.5cm] {geometry}
      }
      {
        \RequirePackage [top=2.7cm, hmargin=2.5cm] {geometry}
      }

    \addtokomafont {pagefoot} { \slshape }
    \addtokomafont {pagenumber} { \slshape }

    \bool_if:NF \g_schulma_klausur_musterloesung_bool
      {
        \rohead { Name:~ \raisebox {-1mm} { \rule {7cm} {0,4pt} } }
        \excludecomment {Lsg}
      }

    \cfoot { Seite~ \pagemark \c_space_tl von~ \pageref {LastPage} }
    \ofoot { }

    \RequirePackage {beamerarticle}
    \RequirePackage {tasks}

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
  }

\RequirePackage {adjustbox}

\cs_new:Npn \schulma_klausur_notentabelle:n #1
  {
    \clist_set:Nn \l_schulma_klausur_notenliste_clist {#1}
    \begin {tabular} { * {5} {c|} c }
      1 & 2 & 3 & 4 & 5 & 6
      \tabularnewline
      \hline
      \int_step_inline:nnnn {1} {1} {6}
        {
          \int_zero:N \l_tmpa_int
          \clist_map_inline:Nn \l_schulma_klausur_notenliste_clist
            {
              \int_compare:nNnT {####1} = {##1}
                {
                  \int_incr:N \l_tmpa_int
                }
            }
          \int_compare:nNnF { \l_tmpa_int } = {0} { \int_use:N \l_tmpa_int }
          \int_compare:nNnF {##1} = {6} {&}
        }
      \end {tabular}
  }

\cs_new:Npn \schulma_klausur_notenpunkttabelle:n #1
  {
    \clist_set:Nn \l_schulma_klausur_notenliste_clist {#1}
    \setlength \tabcolsep {0pt}
    \begin {tabular}
      {
        * {5}
          {
            > {\centering} p{0,06\linewidth}
            > {\centering} p{0,06\linewidth}
            > {\centering} p{0,06\linewidth} |
          }
        > {\centering} p{0,06\linewidth}
      }
      15 & 14 & 13 & 12 & 11 & 10 & 9 & 8 & 7 & 6 & 5 & 4 & 3 & 2 & 1 & 0
      \tabularnewline
      \hline
      \int_step_inline:nnnn {15} {-1} {0}
        {
          \int_zero:N \l_tmpa_int
          \clist_map_inline:Nn \l_schulma_klausur_notenliste_clist
            {
              \int_compare:nNnT {####1} = {##1}
                {
                  \int_incr:N \l_tmpa_int
                }
            }
          \int_compare:nNnF { \l_tmpa_int } = {0} { \int_use:N \l_tmpa_int }
          \int_compare:nNnF {##1} = {0} {&}
        }
      \end {tabular}
  }

\bool_if:NTF \g_schulma_klausur_oesterreich_bool
  {
    \RequirePackage [naustrian] {babel}
  }
  {
    \RequirePackage [ngerman] {babel}
  }

\RequirePackage [useregional=text] {datetime2}

\NewDocumentCommand \Klausurtitel {m}
  {
    \str_gset:Nn \g_schulma_klausur_titel_str {#1}
  }

\NewDocumentCommand \Klausuruntertitel {m}
  {
    \tl_gset:Nn \g_schulma_klausur_untertitel_tl {#1}
  }

\NewDocumentCommand \Klausurteiltitel {m}
  {
    \str_gset:Nn \g_schulma_klausur_teiltitel_str {#1}
  }

\NewDocumentCommand \Bearbeitungszeit {m}
  {
    \str_gset:Nn \g_schulma_klausur_bearbeitungszeit_str {#1}
  }

\NewDocumentCommand \Hilfsmittel {m}
  {
    \tl_gset:Nn \g_schulma_klausur_hilfsmittel_tl {#1}
  }

\DeclareDocumentCommand \Aufgabentitel {m}
  {
    \tl_set:Nn \l_schulma_klausur_aufgabentitel_tl {#1}
  }

\NewDocumentCommand \Notenspiegel {m}
  {
    \bool_if:NT \g_schulma_klausur_musterloesung_bool
      {
        \begin {frame}
        \frametitle {Notenspiegel}
        \begin {center}
        \LARGE
        \schulma_klausur_notentabelle:n {#1}
        \end {center}
        \end {frame}
      }
  }

\NewDocumentCommand \Notenpunktspiegel {m}
  {
    \bool_if:NT \g_schulma_klausur_musterloesung_bool
      {
        \begin {frame}
        \frametitle {Notenspiegel}
        \begin {center}
        \large
        \schulma_klausur_notenpunkttabelle:n {#1}
        \end {center}
        \end {frame}
      }
  }

\cs_set:Npn \schulma_klausur_kopf:
  {
    \noindent
    \parbox [t] {5cm} { \g_schulma_klausur_kurs_tl }
    \hfill
    \bool_if:NTF \g_schulma_klausur_musterloesung_bool
      {
        \str_if_empty:NF \g_schulma_klausur_loesungsdatum_str
          {
            \printdate { \g_schulma_klausur_loesungsdatum_str } % isodate-Befehl
          }
      }
      {
        \str_if_empty:NF \g_schulma_klausur_datum_str
          {
            \DTMdate { \g_schulma_klausur_datum_str }
          }
      }

    \begin {center}
    \sffamily
    \bfseries
    \Large
    \bool_if:NTF \g_schulma_klausur_musterloesung_bool
      {
        \g_schulma_klausur_musterloesungstitel_tl
      }
      {
        \g_schulma_klausur_titel_str
        \tl_if_empty:NF \g_schulma_klausur_nummer_tl
          {
            \c_space_tl
            Nr.~
            \g_schulma_klausur_nummer_tl
          }
      }

    \bool_if:NT \g_schulma_klausur_gruppe_a_bool { \c_space_tl (A) }
    \bool_if:NT \g_schulma_klausur_gruppe_b_bool { \c_space_tl (B) }

    \tl_if_empty:NF \g_schulma_klausur_untertitel_tl
      {
        \par \smallskip
        \normalsize
        \g_schulma_klausur_untertitel_tl
      }

    \str_if_empty:NF \g_schulma_klausur_teiltitel_str
      {
        \par \vspace {3ex}
        \large
        \textit { \g_schulma_klausur_teiltitel_str }
      }

    \str_if_empty:NF \g_schulma_klausur_bearbeitungszeit_str
      {
        \par \smallskip
        \normalsize
        \rmfamily
        \mdseries
        \textsl {Bearbeitungszeit:} ~
        \g_schulma_klausur_bearbeitungszeit_str \, min
      }

    \tl_if_empty:NF \g_schulma_klausur_hilfsmittel_tl
      {
        \par \smallskip
        \normalsize
        \rmfamily
        \mdseries
        \textsl {Hilfsmittel:} ~
        \g_schulma_klausur_hilfsmittel_tl
      }

    \end {center}
  }

\NewDocumentCommand \FarbeAufgabe { }
  {
    \usebeamercolor [fg] {frametitle}
  }

\NewDocumentCommand \FarbeLoesung { }
  {
    \usebeamercolor [fg] {normal~text}
  }

\NewDocumentCommand \NurAufgabe {+m}
  {
    \bool_if:NF \g_schulma_klausur_musterloesung_bool {#1}
  }

\NewDocumentCommand \NurLoesung {+m}
  {
    \bool_if:NT \g_schulma_klausur_musterloesung_bool {#1}
  }

\bool_if:NT \g_schulma_klausur_musterloesung_bool
  {
    \NewDocumentEnvironment {Lsg} {s}
    % Stern: Lösung beginnt mit einer Gleichung, kein Abstand erforderlich
      {
        \IfBooleanF {#1} { \par \medskip }
        \bool_gset_true:N \l_schulma_klausur_loesung_bool
        \FarbeLoesung
      }
      {
        \bool_gset_false:N \l_schulma_klausur_loesung_bool
      }
  }
