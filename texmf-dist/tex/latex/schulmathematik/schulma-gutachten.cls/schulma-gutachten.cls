% schulmathematik bundle: document class schulma-gutachten
% Version 1.6
% 30. Dezember 2023
\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{schulma-gutachten}{2023-12-30}{1.6}{Dokumentenklasse fuer Gutachten ueber schriftliche Abiturklausuren}

\bool_new:N \g_schulma_gutachten_bell_bool
\bool_new:N \g_schulma_gutachten_oesterreich_bool
\bool_new:N \g_schulma_gutachten_referent_weiblich_bool
\bool_new:N \g_schulma_gutachten_korreferent_weiblich_bool

\DeclareOption {BELL}
  {
    \bool_gset_true:N \g_schulma_gutachten_bell_bool
  }

\DeclareOption {AT}
  {
    \bool_gset_true:N \g_schulma_gutachten_oesterreich_bool
  }

\DeclareOption {Referentin}
  {
    \bool_gset_true:N \g_schulma_gutachten_referent_weiblich_bool
  }

\DeclareOption {Korreferentin}
  {
    \bool_gset_true:N \g_schulma_gutachten_korreferent_weiblich_bool
  }

\DeclareOption*
  {
    \PassOptionsToClass {\CurrentOption} {scrartcl}
  }

\ProcessOptions \relax

\tl_new:N \g_schulma_gutachten_schulname_tl
\tl_new:N \g_schulma_gutachten_schulort_tl
\tl_new:N \g_schulma_gutachten_fach_tl
\tl_new:N \l_schulma_gutachten_vorname_tl
\tl_new:N \l_schulma_gutachten_nachname_tl
\tl_new:N \l_schulma_gutachten_note_tl

\int_new:N \g_schulma_gutachten_gesamtpunktzahl_int
\int_new:N \l_schulma_gutachten_notenpunkte_int
\int_new:N \l_schulma_gutachten_notenpunkte_vor_abwertung_int

\bool_new:N \l_schulma_gutachten_pruefling_weiblich_bool

\fp_new:N \l_schulma_gutachten_punktzahl_fp
\fp_new:N \l_schulma_gutachten_prozentsatz_fp

\msg_new:nnn {schulma-gutachten} {Schule fehlt}
  {
    Bitte~geben~Sie~mit~Hilfe~des~Befehls~\Schule~den~Namen~der~Schule~an.
  }

\msg_new:nnn {schulma-gutachten} {Ort fehlt}
  {
    Bitte~geben~Sie~mit~Hilfe~des~Befehls~\Ort~den~Ort~der~Schule~an.
  }

\msg_new:nnn {schulma-gutachten} {Fach fehlt}
  {
    Bitte~geben~Sie~mit~Hilfe~des~Befehls~\Fach~das~Prüfungsfach~an.
  }

\msg_new:nnn {schulma-gutachten} {Gesamtpunktzahl fehlt}
  {
    Bitte~geben~Sie~mit~Hilfe~des~Befehls~\Gesamtpunktzahl~die~in~der~Klausur~
    erreichbare~Gesamtpunktzahl~an.
  }

\cs_generate_variant:Nn \tl_if_eq:nnTF {V}

\cs_new:Npn \schulma_gutachten_notenpunkte_ermitteln:
  {
    \int_set:Nn \l_schulma_gutachten_notenpunkte_int {15}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {95.0}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {14}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {90}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {13}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {85}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {12}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {80}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {11}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {75}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {10}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {70}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {09}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {65}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {08}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {60}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {07}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {55}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {06}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {50}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {05}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {45}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {04}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {40}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {03}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {33}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {02}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {27}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {01}}
    \fp_compare:nNnT {\l_schulma_gutachten_prozentsatz_fp} < {20}{
      \int_set:Nn \l_schulma_gutachten_notenpunkte_int {00}}
  }

\cs_new:Npn \schulma_gutachten_note_ermitteln:
  {
    \int_case:nn {\l_schulma_gutachten_notenpunkte_int}
      {
        {15} {\tl_set:Nn \l_schulma_gutachten_note_tl {sehr~gut}}
        {14} {\tl_set:Nn \l_schulma_gutachten_note_tl {sehr~gut}}
        {13} {\tl_set:Nn \l_schulma_gutachten_note_tl {sehr~gut}}
        {12} {\tl_set:Nn \l_schulma_gutachten_note_tl {gut}}
        {11} {\tl_set:Nn \l_schulma_gutachten_note_tl {gut}}
        {10} {\tl_set:Nn \l_schulma_gutachten_note_tl {gut}}
        {09} {\tl_set:Nn \l_schulma_gutachten_note_tl {befriedigend}}
        {08} {\tl_set:Nn \l_schulma_gutachten_note_tl {befriedigend}}
        {07} {\tl_set:Nn \l_schulma_gutachten_note_tl {befriedigend}}
        {06} {\tl_set:Nn \l_schulma_gutachten_note_tl {ausreichend}}
        {05} {\tl_set:Nn \l_schulma_gutachten_note_tl {ausreichend}}
        {04} {\tl_set:Nn \l_schulma_gutachten_note_tl {ausreichend}}
        {03} {\tl_set:Nn \l_schulma_gutachten_note_tl {mangelhaft}}
        {02} {\tl_set:Nn \l_schulma_gutachten_note_tl {mangelhaft}}
        {01} {\tl_set:Nn \l_schulma_gutachten_note_tl {mangelhaft}}
        {00} {\tl_set:Nn \l_schulma_gutachten_note_tl {ungen\"ugend}}
      }
  }

\cs_new:Npn \schulma_gutachten_notenpunktausgabe:N #1
  {
    \num [minimum-integer-digits=2] { \int_use:N #1 } ~
    \int_compare:nNnTF {#1} = {1} {Notenpunkt} {Notenpunkten}
  }

\NewDocumentCommand \Schule {m}
  {
    \tl_gset:Nn \g_schulma_gutachten_schulname_tl {#1}
  }

\NewDocumentCommand \Ort {m}
  {
    \tl_gset:Nn \g_schulma_gutachten_schulort_tl {#1}
  }

\NewDocumentCommand \Datum {m}
  {
    \DTMsavedate{g_schulma_gutachten_datum} {#1}
  }

\NewDocumentCommand \Fach {m}
  {
    \tl_gset:Nn \g_schulma_gutachten_fach_tl {#1}
  }

\NewDocumentCommand \Gesamtpunktzahl {m}
  {
    \int_gset:Nn \g_schulma_gutachten_gesamtpunktzahl_int {#1}
  }

\NewDocumentCommand \Name { }
  {
    \bool_if:NTF \l_schulma_gutachten_pruefling_weiblich_bool {Frau~} {Herr~}
    \l_schulma_gutachten_nachname_tl
  }

\NewDocumentCommand \NameDativ { }
  {
    \bool_if:NTF \l_schulma_gutachten_pruefling_weiblich_bool {Frau~} {Herrn~}
    \l_schulma_gutachten_nachname_tl
  }

% #1: Vorname, #2: Nachname
% #3: Geschlecht (m/w)
% #4: Punktzahl
% #5: Abwertung in Notenpunkten
\NewDocumentEnvironment {Gutachten} {m m m m o}
  {
    \tl_set:Nn \l_schulma_gutachten_vorname_tl {#1}
    \tl_set:Nn \l_schulma_gutachten_nachname_tl {#2}
    \tl_if_eq:nnT {#3} {w}
      {
        \bool_set_true:N \l_schulma_gutachten_pruefling_weiblich_bool
      }
    \noindent
    \tl_if_empty:NTF \g_schulma_gutachten_schulname_tl
      {
        \msg_warning:nn {schulma-gutachten} {Schule fehlt}
      }
      {
        \parbox [t] {8cm} {\g_schulma_gutachten_schulname_tl}
        \hfill
      }
    Abiturpr\"ufung~
    \DTMifsaveddate {g_schulma_gutachten_datum}
      {
        \DTMfetchyear{g_schulma_gutachten_datum}
      }
      {
        \the\year
      }
    \bigskip
    \begin {center}
    \huge \textbf {Gutachten} \\[1mm]
    \normalsize
    \bool_if:nTF {\g_schulma_gutachten_bell_bool}
      {\"uber~die~schriftliche~Dokumentation~zur~besonderen~Lernleistung}
      {\"uber~die~schriftliche~Pr\"ufungsarbeit} \\
    des~Pr\"uf\babelshorthand{"|}lings \\
    \Large
    \textbf
      {
        \l_schulma_gutachten_vorname_tl
        \c_space_tl
        \l_schulma_gutachten_nachname_tl
      }
    \\[1mm]
    \normalsize
    \tl_if_empty:NTF \g_schulma_gutachten_fach_tl
      {
        \msg_warning:nn {schulma-gutachten} {Fach fehlt}
      }
      {
        im~Fach~
        \g_schulma_gutachten_fach_tl
      }
    \end{center}
    \bigskip
  }
  {
    \bool_if:nF {\g_schulma_gutachten_bell_bool}
      {
        \fp_set:Nn \l_schulma_gutachten_punktzahl_fp {#4}

        \int_compare:nNnTF {\g_schulma_gutachten_gesamtpunktzahl_int} = {0}
          {
            \msg_warning:nn {schulma-gutachten} {Gesamtpunktzahl fehlt}
          }
          {
            \fp_set:Nn \l_schulma_gutachten_prozentsatz_fp
              {
                round ( \l_schulma_gutachten_punktzahl_fp*100
                        /\g_schulma_gutachten_gesamtpunktzahl_int, 1, 1 )
              }
          }

        \schulma_gutachten_notenpunkte_ermitteln:

        \IfValueT {#5}
          {
            \int_set:Nn \l_schulma_gutachten_notenpunkte_vor_abwertung_int
              {
                \l_schulma_gutachten_notenpunkte_int
              }
            \int_set:Nn \l_schulma_gutachten_notenpunkte_int
              {
                \l_schulma_gutachten_notenpunkte_vor_abwertung_int - #5
              }
          }

        \schulma_gutachten_note_ermitteln:
        \bigskip \par \noindent
        \bool_if:NTF \l_schulma_gutachten_pruefling_weiblich_bool
          {
            Frau
          }
          {
            Herr
          }
        \c_space_tl
        \l_schulma_gutachten_nachname_tl
        \c_space_tl
        erreicht~
        \num { \fp_to_decimal:N \l_schulma_gutachten_punktzahl_fp } ~von~
        \int_use:N \g_schulma_gutachten_gesamtpunktzahl_int
        \c_space_tl
        Bewertungseinheiten;~
        dies~entspricht~
        \qty { \fp_to_decimal:N \l_schulma_gutachten_prozentsatz_fp } {\percent}
        .~
        \IfValueTF {#5}
          {
            Auf~dieser~Grundlage~w\"are~die~Arbeit~mit~
            \schulma_gutachten_notenpunktausgabe:N
              \l_schulma_gutachten_notenpunkte_vor_abwertung_int
            \c_space_tl
            zu~bewerten.~Aufgrund~der~beschriebenen~formalen~Fehler~wird~
            die~Arbeit~um~
            \int_compare:nNnTF {#5} = {1} {einen~Notenpunkt}
              {zwei~Notenpunkte}
            \c_space_tl
            abgewertet.~Sie~
          }
          {
            Die~Arbeit~
          }
        ist~daher~
        \l_schulma_gutachten_note_tl
        \c_space_tl
        und~wird~mit
        \begin {center}
        \schulma_gutachten_notenpunktausgabe:N
          \l_schulma_gutachten_notenpunkte_int
        \end {center}
        bewertet.
      }
    \vfill \bigskip \par
    \noindent
    \tl_if_empty:NTF \g_schulma_gutachten_schulort_tl
      {
        \msg_warning:nn {schulma-gutachten} {Ort fehlt}
      }
      {
        \g_schulma_gutachten_schulort_tl,~den~
      }
    \DTMifsaveddate {g_schulma_gutachten_datum}
      {
        \DTMusedate {g_schulma_gutachten_datum}
      }
      {
        \today
      }
    \hfill
    \begin {tabular} [t] {p{6cm}} \\
      \hline \footnotesize Referent
      \bool_if:NT \g_schulma_gutachten_referent_weiblich_bool {in}
    \end{tabular}
    \medskip \par
    \noindent Ich~schlie\ss e~mich~der~Bewertung~an.
    \vspace {6mm} \par
    \noindent
    \tl_if_empty:NF \g_schulma_gutachten_schulort_tl
      {
        \g_schulma_gutachten_schulort_tl,~den~
      }
    \begin {tabular} {p{5cm}} \\
      \hline
    \end{tabular}
    \hfill
    \begin {tabular} [t] {p{6cm}} \\
      \hline
      \footnotesize Korreferent
      \bool_if:NT \g_schulma_gutachten_korreferent_weiblich_bool {in}
    \end {tabular}
    \clearpage
  }

\LoadClass [ fontsize=12 ] {scrartcl}

\bool_if:NTF \g_schulma_gutachten_oesterreich_bool
  {
    \RequirePackage [naustrian] {babel}
  }
  {
    \RequirePackage [ngerman] {babel}
  }

\RequirePackage [useregional=text] {datetime2}
\RequirePackage {siunitx}

\sisetup { locale = DE , mode = match }
\KOMAoption {DIV} {13}

\pagestyle {empty}
