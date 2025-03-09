% schulmathematik bundle: document class schulma-praes
% Version 1.6
% 30. Dezember 2023
\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{schulma-praes}{2023-12-30}{1.6}{Dokumentenklasse fuer Bildschirmpraesentationen}

\bool_new:N \g_schulma_praes_seitenzahlen_bool
\bool_new:N \g_schulma_praes_druck_bool
\bool_new:N \g_schulma_praes_zwei_folien_pro_seite_bool
\bool_new:N \g_schulma_praes_oesterreich_bool

\DeclareOption {Seitenzahlen}
  {
    \bool_gset_true:N \g_schulma_praes_seitenzahlen_bool
  }

\DeclareOption {Druck}
  {
    \bool_gset_true:N \g_schulma_praes_seitenzahlen_bool
    \bool_gset_true:N \g_schulma_praes_druck_bool
  }

\DeclareOption {Druck2}
  {
    \bool_gset_true:N \g_schulma_praes_seitenzahlen_bool
    \bool_gset_true:N \g_schulma_praes_druck_bool
    \bool_gset_true:N \g_schulma_praes_zwei_folien_pro_seite_bool
  }

\DeclareOption {AT}
  {
    \bool_gset_true:N \g_schulma_praes_oesterreich_bool
  }

\DeclareOption*
  {
    \PassOptionsToClass {\CurrentOption} {beamer}
  }

\ProcessOptions \relax

\tl_new:N \g_schulma_praes_nummer_tl
\tl_new:N \g_schulma_praes_thema_tl

\NewDocumentCommand \Kurs {m}
  {
    \author {#1}
  }

\NewDocumentCommand \Datum {m}
  {
    % \date { \DTMdate {#1} }
    \date { \printdate {#1} } % isodate-Befehl
  }

\NewDocumentCommand \Thema {o m}
  {
    \IfValueT {#1}
      {
        \tl_gset:Nn \g_schulma_praes_nummer_tl {#1}
      }
    \tl_gset:Nn \g_schulma_praes_thema_tl {#2}
  }

\RequirePackage {etoolbox}

\AfterEndPreamble
  {
    \title
      {
        \tl_if_empty:NF \g_schulma_praes_nummer_tl
          {
            \g_schulma_praes_nummer_tl
            \hspace {0,5em}
          }
        \g_schulma_praes_thema_tl
      }

    \begin {frame}
    \maketitle
    \end {frame}
  }

\bool_if:NT \g_schulma_praes_druck_bool
  {
    \PassOptionsToClass {handout} {beamer}
  }

\LoadClass [aspectratio=169, noamsthm] {beamer}
% Die Option noamsthm verhindert, dass die Option intlimits des mathtools-Pakets
% überschrieben wrid.

\RequirePackage {adjustbox}

\bool_if:NTF \g_schulma_praes_oesterreich_bool
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

% \DTMlangsetup* { twodigits = false, datesep = {.\thinspace} } % Option twodigits z. Zt. nicht implementiert

% isodate: Monat ggf. einstellig anzeigen:
\numdate[arabic]
% isodate: Tag ggf. einstellig anzeigen:
\isotwodigitdayfalse
% isodate: Abstand zwischen Monat und Jahr im numerischen Format:
\monthyearsepgerman{\,}{\,}

\bool_if:NT \g_schulma_praes_druck_bool
  {
    \RequirePackage{pgfpages}

    \bool_if:NTF \g_schulma_praes_zwei_folien_pro_seite_bool
      {
        \pgfpagesuselayout {2~on~1} [a4paper, border~shrink = 8mm]
      }
      {
        \pgfpagesuselayout {4~on~1} [a4paper, landscape, border~shrink = 8mm]
      }
  }

% serifenloses Komma im Mathemodus wählen:
\DeclareMathSymbol {,} {\mathpunct} {operators} {"2C}

% Italic-Correction-Problem von XeLaTeX bei "f(x)" etc. beheben:
\sys_if_engine_xetex:T
  {
    \AtBeginDocument
      {
        \DeclareSymbolFont {pureletters} {T1} {lmss} {\mddefault} {it}
      }
  }

\pgfplotsset { axis~line~style = semithick, grid~style = fg!45 }

\RenewDocumentEnvironment {Kosy} {o}
  {
    \tl_set:Nn \l_tmpa_tl
      {
        tick~style = {fg},
        xlabel = {$x$}, ylabel = {$y$},
        minor~tick~num = 1, minor~tick~length = 0pt,
        grid = both
      }
    \begin {tikzpicture}
    \IfValueTF {#1}
      {
        \begin {axis} [\l_tmpa_tl, #1]
      }
      {
        \begin{axis} [\l_tmpa_tl]
      }
  }
  {
    \end {axis}
    \end {tikzpicture}
  }

\RenewDocumentCommand \ehoch {m}
  {
    \mathsf {e} ^ {#1}
  }

\RenewDocumentCommand \diff {m}
  {
    \mathsf {d} #1
  }

\bool_if:NT \g_schulma_praes_seitenzahlen_bool
  {
    \setbeamertemplate {footline}
      {
        \begin {beamercolorbox} {section~in~head/foot}
        \raggedleft \footnotesize \insertframenumber \hspace* {6pt} \vskip 6pt
        \end {beamercolorbox}
      }
  }

\definecolor {dgruen} {rgb} {0,0.7,0}

% tasks: j überspringen
\newcommand*\@schulmaalph[1]{\ifnum #1>9 \@alph{\numexpr #1+1}\else \@alph{#1}\fi}
\newcommand*\schulmaalph[1]{\@schulmaalph{\value{#1}}}

\settasks{label-align=right,
  item-indent=2.2em,
  label-offset=0.5em,
  label-width=1.3em,
  label=\schulmaalph*),
  after-skip=4.5pt plus2pt minus1pt}

\newcommand <> \Unterklammer [2]
  {
    \onslide #3
    \underbrace { \onslide <1-> #1 \onslide #3 } \sb {#2}
    \onslide <1->
  }

\int_new:N \l_schulma_praes_folie_int

\NewDocumentCommand \Produktregel {m m m m m}
  {
    \int_set:Nn \l_schulma_praes_folie_int {#1}
    \colorlet {l_schulma_praes_hauptfarbe} {.}
    \onslide < \l_schulma_praes_folie_int - >
      {
        \int_incr:N \l_schulma_praes_folie_int
        \color {red}
        \underbrace { \onslide < \l_schulma_praes_folie_int - > { \color {l_schulma_praes_hauptfarbe} #2 } }
        \sb {u'}
        \color {l_schulma_praes_hauptfarbe} \cdot
        \int_incr:N \l_schulma_praes_folie_int
        \color {red}
        \underbrace { \onslide < \l_schulma_praes_folie_int - > { \color {l_schulma_praes_hauptfarbe} #3 } }
        \sb { v \mathstrut }
        \color {l_schulma_praes_hauptfarbe} +
        \int_incr:N \l_schulma_praes_folie_int
        \color {red}
        \underbrace { \onslide < \l_schulma_praes_folie_int - > { \color {l_schulma_praes_hauptfarbe} #4 } }
        \sb {u \mathstrut }
        \color {l_schulma_praes_hauptfarbe} \cdot
        \int_incr:N \l_schulma_praes_folie_int
        \color {red}
        \underbrace { \onslide < \l_schulma_praes_folie_int - > { \color {l_schulma_praes_hauptfarbe} #5 } }
        \sb {v'}
        \color {l_schulma_praes_hauptfarbe}
      }
  }
