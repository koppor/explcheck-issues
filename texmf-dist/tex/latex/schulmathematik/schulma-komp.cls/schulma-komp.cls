% schulmathematik bundle: document class schulma-komp
% Version 1.6
% 30. Dezember 2023
\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{schulma-komp}{2023-12-30}{1.6}{Dokumentenklasse fuer Kompetenzlisten}

\DeclareOption*
  {
    \PassOptionsToClass {\CurrentOption} {schulma-ab}
  }

\ProcessOptions \relax

\LoadClass {schulma-ab}

\RequirePackage [useregional] {datetime2}

\int_new:N \g_schulma_komp_klausurnummer_int
\str_new:N \g_schulma_komp_klausurdatum_str

\dim_const:Nn \c_schulma_komp_abstand_dim {0.5em}
\dim_new:N \g_schulma_komp_einrueckunga_dim
\dim_new:N \g_schulma_komp_einrueckungb_dim

\hbox_set:Nn \l_tmpa_box {9}
\dim_gset:Nn \g_schulma_komp_einrueckunga_dim { \box_wd:N \l_tmpa_box }
\dim_gadd:Nn \g_schulma_komp_einrueckunga_dim {\c_schulma_komp_abstand_dim}

\hbox_set:Nn \l_tmpa_box {9.9}
\dim_gset:Nn \g_schulma_komp_einrueckungb_dim { \box_wd:N \l_tmpa_box }
\dim_gadd:Nn \g_schulma_komp_einrueckungb_dim {\c_schulma_komp_abstand_dim}
\dim_gadd:Nn \g_schulma_komp_einrueckungb_dim {\g_schulma_komp_einrueckunga_dim}

\renewcommand \labelenumi { ( \arabic {enumi} ) }

\cs_new:Npn \schulma_komp_listeneinstellung:
  {
    \setlist
      {
        leftmargin = 2cm,
        topsep = \medskipamount,
        itemsep = \smallskipamount
      }
  }

\cs_new:Npn \schulma_komp_ueberschrift:
  {
    \bool_if:NTF \g_schulma_ab_musterloesung_bool
      {
        L\"osungen~der~\"Ubungsaufgaben
      }
      {
        Kompetenzen
      }
  }

\cs_new:Npn \schulma_komp_thema_festlegen:
  {
    \int_if_zero:nTF { \g_schulma_komp_klausurnummer_int }
      {
        \str_if_empty:NF \g_schulma_komp_klausurdatum_str
          {
            \tl_gset:Nn \g_schulma_ab_thema_tl
              {
                \schulma_komp_ueberschrift:
                \c_space_tl
                zur~Klausur~am~
                \DTMdate { \g_schulma_komp_klausurdatum_str }
              }
          }
      }
      {
        \str_if_empty:NTF \g_schulma_komp_klausurdatum_str
          {
            \tl_gset:Nn \g_schulma_ab_thema_tl
              {
                \schulma_komp_ueberschrift:
                \c_space_tl
                zur~
                \int_to_arabic:n { \g_schulma_komp_klausurnummer_int }
                .~Klausur
              }
          }
          {
            \tl_gset:Nn \g_schulma_ab_thema_tl
              {
                \schulma_komp_ueberschrift:
                \c_space_tl
                zur~
                \int_to_arabic:n { \g_schulma_komp_klausurnummer_int }
                .~Klausur~am~
                \DTMdate { \g_schulma_komp_klausurdatum_str }
              }
          }
      }
  }

\NewDocumentCommand \Nr {m}
  {
    \int_set:Nn \g_schulma_komp_klausurnummer_int {#1}
    \schulma_komp_thema_festlegen:
  }

\NewDocumentCommand \Klausurdatum {m}
  {
    \str_set:Nn \g_schulma_komp_klausurdatum_str {#1}
    \schulma_komp_thema_festlegen:
  }

\NewDocumentCommand \Abschnitt {o m}
  {
    \bool_if:NF \g_schulma_ab_musterloesung_bool
      {
        \IfValueTF {#1}
          {
            \setcounter {section} {#1}
          }
          {
            \stepcounter {section}
          }
        \arabic {section}
        \skip_horizontal:N \c_schulma_komp_abstand_dim
        #2
        \par
        \smallskip
      }
  }

\NewDocumentCommand \Unterabschnitt {o m o}
  {
    \bool_if:NF \g_schulma_ab_musterloesung_bool
      {
        \IfValueTF {#1}
          {
            \setcounter{subsection} {#1}
          }
          {
            \stepcounter{subsection}
          }
        \setcounter {subsubsection} {0}
        \skip_horizontal:N \g_schulma_komp_einrueckunga_dim
        \arabic {section} . \arabic {subsection}
        \skip_horizontal:N \c_schulma_komp_abstand_dim
        #2
        \IfValueT {#3}
          {
            \group_begin:
            \schulma_komp_listeneinstellung:
            \emph {#3}
            \group_end:
          }
        \par
        \smallskip
      }
  }

\NewDocumentCommand \Unterunterabschnitt {o m m}
  {
    \bool_if:NF \g_schulma_ab_musterloesung_bool
      {
        \par
        \IfValueTF {#1}
          {
            \setcounter {subsubsection} {#1}
          }
          {
            \stepcounter {subsubsection}
          }
        \skip_horizontal:N \g_schulma_komp_einrueckungb_dim
        \arabic {section} . \arabic {subsection} . \arabic {subsubsection}
        \skip_horizontal:N \c_schulma_komp_abstand_dim
        #2
        \group_begin:
        \schulma_komp_listeneinstellung:
        \emph {#3}
        \group_end:
        \par
        \smallskip
      }
  }
