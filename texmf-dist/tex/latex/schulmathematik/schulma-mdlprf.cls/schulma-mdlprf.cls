% schulmathematik bundle: document class schulma-mdlprf
% Version 1.6
% 30. Dezember 2023
\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{schulma-mdlprf}{2023-12-30}{1.6}{Dokumentenklasse fuer muendliche Abiturpruefungen}

\bool_new:N \g_schulma_mdlprf_oesterreich_bool
\bool_new:N \g_schulma_mdlprf_pruefer_weiblich_bool

\str_new:N \g_schulma_mdlprf_pnummer_str

\tl_new:N \g_schulma_mdlprf_schulname_tl
\tl_new:N \g_schulma_mdlprf_fach_tl
\tl_new:N \g_schulma_mdlprf_vorbereitungsraum_tl
\tl_new:N \g_schulma_mdlprf_pruefungsraum_tl
\tl_new:N \g_schulma_mdlprf_pruefer_tl
\tl_new:N \g_schulma_mdlprf_aufgabe_tl
\tl_new:N \g_schulma_mdlprf_hilfsmittel_tl
\tl_new:N \g_schulma_mdlprf_erwartungshorizont_tl
\tl_new:N \g_schulma_mdlprf_weitere_themen_tl

\int_new:N \g_schulma_mdlprf_dauer_vorbereitungszeit_int

\DeclareOption {AT}
  {
    \bool_gset_true:N \g_schulma_mdlprf_oesterreich_bool
  }

\DeclareOption {Prueferin}
  {
    \bool_gset_true:N \g_schulma_mdlprf_pruefer_weiblich_bool
  }

\DeclareOption*
  {
    \PassOptionsToClass {\CurrentOption} {scrartcl}
  }

\ProcessOptions \relax

\int_gset:Nn \g_schulma_mdlprf_dauer_vorbereitungszeit_int {30}

\msg_new:nnn {schulma-mdlprf} {Schule~fehlt}
  {
    Bitte~geben~Sie~mit~Hilfe~des~Befehls~\Schule~den~
    Schulnamen~an.
  }

\msg_new:nnn {schulma-mdlprf} {Datum~fehlt}
  {
    Bitte~geben~Sie~mit~Hilfe~des~Befehls~\Datum~das~
    Prüfungsdatum~an.
  }

\msg_new:nnn {schulma-mdlprf} {Prüfungsfachnummer~fehlt}
  {
    Bitte~geben~Sie~mit~Hilfe~des~Befehls~\PNummer~die~
    Nummer~des~Prüfungsfachs~an.
  }

\msg_new:nnn {schulma-mdlprf} {Uhrzeit~fehlt}
  {
    Das~zweite~Argument~des~Befehls~\Pruefung~in~Zeile~
    \msg_line_number:
    \c_space_tl
    muss~eine~Uhrzeit~im~Format~SS:MM~sein.
  }

\NewDocumentCommand \Schule {m}
  {
    \tl_gset:Nn \g_schulma_mdlprf_schulname_tl {#1}
  }

\NewDocumentCommand \Datum {m}
  {
    \DTMsavedate {g_schulma_mdlprf_datum} {#1}
  }

\NewDocumentCommand \Fach {m}
  {
    \tl_gset:Nn \g_schulma_mdlprf_fach_tl {#1}
  }

\NewDocumentCommand \Vorbereitungsraum {m}
  {
    \tl_gset:Nn \g_schulma_mdlprf_vorbereitungsraum_tl {#1}
  }

\NewDocumentCommand \Vorbereitungszeit {m}
  {
    \int_gset:Nn \g_schulma_mdlprf_dauer_vorbereitungszeit_int {#1}
  }

\NewDocumentCommand \Pruefungsraum {m}
  {
    \tl_gset:Nn \g_schulma_mdlprf_pruefungsraum_tl {#1}
  }

\NewDocumentCommand \Pruefer {m}
  {
    \tl_gset:Nn \g_schulma_mdlprf_pruefer_tl {#1}
  }

\NewDocumentCommand \PNummer {m}
  {
    \str_gset:Nn \g_schulma_mdlprf_pnummer_str {#1}
  }

\NewDocumentCommand \Hilfsmittel {m}
  {
    \tl_gset:Nn \g_schulma_mdlprf_hilfsmittel_tl {#1}
  }

\NewDocumentCommand \Aufgabe {+m}
  {
    \tl_gset:Nn \g_schulma_mdlprf_aufgabe_tl {#1}
  }

\NewDocumentCommand \Erwartungshorizont {+m}
  {
    \tl_gset:Nn \g_schulma_mdlprf_erwartungshorizont_tl {#1}
  }

\NewDocumentCommand \WeitereThemen {+m}
  {
    \tl_gset:Nn \g_schulma_mdlprf_weitere_themen_tl {#1}
  }

\LoadClass {scrartcl}

\bool_if:NTF \g_schulma_mdlprf_oesterreich_bool
  {
    \RequirePackage [naustrian] {babel}
  }
  {
    \RequirePackage [ngerman] {babel}
  }

\RequirePackage [ useregional=text, showseconds=false ] {datetime2}
\RequirePackage {schulma}
\RequirePackage {schulma-physik}

\KOMAoption {DIV} {14}

\NewDocumentCommand \Pruefung {mm}
  {
    \tl_if_blank:nTF {#2}
      {
        \msg_warning:nn {schulma-mdlprf} {Uhrzeit~fehlt}
      }
      {
        \str_set:Nx \l_tmpa_str { #2 \c_colon_str 00 }
        \DTMsavetime {l_schulma_mdlprf_beginn_pruefung} {\l_tmpa_str}
        \int_set:Nn \l_tmpa_int
          {
            \DTMfetchhour {l_schulma_mdlprf_beginn_pruefung}
          }
        \int_set:Nn \l_tmpb_int
          {
            \DTMfetchminute {l_schulma_mdlprf_beginn_pruefung}
          }
        \int_sub:Nn \l_tmpb_int
          {
            \g_schulma_mdlprf_dauer_vorbereitungszeit_int
          }
        \int_compare:nNnT \l_tmpb_int < {0}
          {
            \int_decr:N \l_tmpa_int
            \int_add:Nn \l_tmpb_int {60}
          }
        \str_set:Nx \l_tmpa_str
          {
            \int_use:N \l_tmpa_int
            \c_colon_str
            \int_use:N \l_tmpb_int
            \c_colon_str 00
          }
        \DTMsavetime {l_schulma_mdlprf_beginn_vorbereitungszeit} {\l_tmpa_str}
      }

    \newpage
    \tl_if_empty:NTF \g_schulma_mdlprf_schulname_tl
      {
        \msg_warning:nn {schulma-mdlprf} {Schule~fehlt}
      }
      {
        \g_schulma_mdlprf_schulname_tl
      }
    \hfill
    Abiturpr\"ufung
    \DTMifsaveddate {g_schulma_mdlprf_datum}
      {
        \c_space_tl
        \DTMfetchyear {g_schulma_mdlprf_datum}
      }
      {
        \msg_warning:nn {schulma-mdlprf} {Datum~fehlt}
      }

    \vspace {2ex}
    \begin {center}
      \sffamily\bfseries\Large
      Aufgabenblatt~f\"ur~die~m\"undliche~Pr\"ufung
      \str_if_empty:NTF \g_schulma_mdlprf_pnummer_str
        {
          \msg_warning:nn {schulma-mdlprf} {Prüfungsfachnummer~fehlt}
        }
        {
          \c_space_tl
          ( P \, \g_schulma_mdlprf_pnummer_str )
        }
    \end {center}

    \vspace {1ex}
    \begin {tabbing}
    Beginn~der~Vorbereitungszeit:~ \=
    \hspace {4cm} \=
    Vorbereitungsraum:~ \= \kill
    Datum~der~Pr\"ufung: \>
    \DTMifsaveddate {g_schulma_mdlprf_datum}
      {
        \DTMusedate {g_schulma_mdlprf_datum}
      }
      {
      }
    \> Pr\"uf \babelshorthand {"|} ling: \> #1 \\[2ex]
    Fach: \> \g_schulma_mdlprf_fach_tl
    \>
    \bool_if:NTF \g_schulma_mdlprf_pruefer_weiblich_bool
      {
        Pr\"uferin:
      }
      {
        Pr\"ufer:
      }
    \> \g_schulma_mdlprf_pruefer_tl \\[2ex]
    Beginn~der~Vorbereitungszeit: \>
    \tl_if_blank:nF {#2}
      {
        \DTMusetime {l_schulma_mdlprf_beginn_vorbereitungszeit} ~ Uhr
      }
    \> Vorbereitungsraum: \> \g_schulma_mdlprf_vorbereitungsraum_tl \\[2ex]
    Beginn~der~Pr\"ufung: \>
    \tl_if_blank:nF {#2}
      {
        \DTMusetime {l_schulma_mdlprf_beginn_pruefung} ~ Uhr
      }
    \> Pr\"ufungsraum: \> \g_schulma_mdlprf_pruefungsraum_tl
    \end {tabbing}
    \hrule

    \subsubsection* {Aufgabe:}
    \g_schulma_mdlprf_aufgabe_tl

    \tl_if_empty:NF \g_schulma_mdlprf_hilfsmittel_tl
      {
        \par
        \bigskip
        Hilfsmittel:~
        \g_schulma_mdlprf_hilfsmittel_tl
      }

    \newpage
    \subsubsection* {Erwartungshorizont}
    \g_schulma_mdlprf_erwartungshorizont_tl

    \tl_if_empty:NF \g_schulma_mdlprf_weitere_themen_tl
      {
        \bigskip
        \subsubsection* {M\"ogliche~Themen~des~weiteren~Pr\"ufungsgespr\"achs}
        \g_schulma_mdlprf_weitere_themen_tl
      }
  }

\setlength \parindent {0em}

\pagestyle {empty}
