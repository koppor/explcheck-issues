%%
%% This is file `sblbook.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sblbook.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (c) 2026 David Purton <dcpurton@marshwiggle.net>
%% 
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project2 Public License, either version 1.3c of this license
%% or (at your option) any later version. The latest version of this
%% license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work is "maintained" (as per the LPPL maintenance status)
%% by David Purton.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{sblbook}{2026-04-04}{1.0}
  {Society of Biblical Literature Book Class (DCP)}
\clist_new:N \l__sblbook_options_to_book_class_clist
\keys_define:nn { sblbook }
  {
    , biblatex .clist_set:N = \l__sblbook_options_to_biblatex_clist
    , sblfonts .clist_set:N = \l__sblbook_options_to_sblfonts_clist
    , sblidx   .clist_set:N = \l__sblbook_options_to_sblidx_clist
    , trim     .bool_set:N  = \l__sblbook_trim_bool
    , trim     .default:n   = true
    , trim     .initial:n   = false
    , unknown  .code:n = {
                           \clist_put_right:No
                             \l__sblbook_options_to_book_class_clist
                             { \CurrentOption }
                         }
  }
\ProcessKeyOptions
\clist_put_left:Nn \l__sblbook_options_to_book_class_clist
  { }
\clist_put_left:Nn \l__sblbook_options_to_biblatex_clist
  {
    , style    = sbl
    , language = auto
    , autolang = hyphen
  }
\sys_if_engine_opentype:TF
  {
    \clist_put_left:Nn \l__sblbook_options_to_sblfonts_clist
      {
        , mainfont        = Baskervaldx
        , mainfontoptions = {
                              , Extension      = .otf
                              , UprightFont    = *-Reg
                              , ItalicFont     = *-Ita
                              , BoldFont       = *-Bol
                              , BoldItalicFont = *-BolIta
                            }
        , sblfonts        = true
      }
  }
  {
    \clist_put_left:Nn \l__sblbook_options_to_sblfonts_clist
      {
        , mainfont = Baskervaldx
        , grfont   = Alegreya-LF
        , hefont   = frank
      }
  }
\exp_args:No \PassOptionsToClass
  { \l__sblbook_options_to_book_class_clist }
  { book }
\LoadClass { book }
\exp_args:No \PassOptionsToPackage
  { \l__sblbook_options_to_sblfonts_clist }
  { sblfonts }
\RequirePackage { sblfonts }
\sys_if_engine_opentype:T
  {
    \hook_gput_code:nnn
      { cmd / MakeUppercase / before }
      { sblbook }
      { \addfontfeature { Kerning = Uppercase } }
    \hook_gput_code:nnn
      { cmd / MakeUppercase / after }
      { sblbook }
      { \addfontfeature { Kerning = UppercaseOff } }
  }
\exp_args:No \PassOptionsToPackage
  { \l__sblbook_options_to_biblatex_clist }
  { biblatex }
\RequirePackage { biblatex }
\RequirePackage { csquotes }
\clist_if_exist:NT \l__sblbook_options_to_sblidx_clist
  {
    \exp_args:No \PassOptionsToPackage
      { \l__sblbook_options_to_sblidx_clist }
      { sblidx }
    \RequirePackage { sblidx }
    \@ifpackageloaded { bibleref }
      {
        \RequirePackage { bibleref-parse }
      }
      { }
  }
\bool_if:NTF \l__sblbook_trim_bool
  {
    \RequirePackage
      [
        , paperwidth  = 6in
        , paperheight = 9in
      ]
      { geometry }
  }
  {
    \RequirePackage { geometry }
  }
\dim_new:N \l__sblbook_top_margin_dim
\dim_new:N \l__sblbook_inner_margin_dim
\dim_set:Nn \l__sblbook_top_margin_dim
  { 0.5 \paperheight - 3.75in }
\dim_set:Nn \l__sblbook_inner_margin_dim
  { 0.5 \paperwidth - 2.25in }
\geometry
  {
    , includehead    = true
    , marginparwidth = 0.5in
    , textwidth      = 4.5in
    , height         = 7.5in
    , top            = \l__sblbook_top_margin_dim
    , inner          = \l__sblbook_inner_margin_dim
    , headsep        = 12pt
    , headheight     = 12pt
    , footskip       = 12pt
  }
\dim_set:Nn \parindent { 0.25in }
\RequirePackage [ all ] { nowidow }
\RequirePackage [ hyphenation , lastparline ] { impnattypo }
\RequirePackage { microtype }
\RequirePackage { fancyhdr }
\pagestyle { fancy }
\fancyhf { }
\fancyhead [ LE , RO ] { \thepage }
\fancyhead [ CE ] { \itshape \nouppercase { \leftmark } }
\fancyhead [ CO ] { \itshape \nouppercase { \rightmark } }
\cs_set_nopar:Npn \headrulewidth { 0pt }
\cs_set_nopar:Npn \chaptermark #1
  {
    \markboth { \@title } { #1 }
  }
\cs_set_nopar:Npn \sectionmark #1 { }
\fancypagestyle { plain }
  {
    \fancyhf { }
    \fancyfoot
      [ C ]
      {
        \smash { \raisebox { 12pt } { -\,\thepage\,- } }
      }
    \cs_set_nopar:Npn \headrulewidth { 0pt }
    \cs_set_nopar:Npn \footrulewidth { 0pt }
  }
\cs_set_nopar:Npn \thispagestyle #1
  {
    \cs_if_exist:cTF { ps@#1 }
      {
        \tl_if_eq:nnT {#1} { plain }
          {
            \enlargethispage { -24pt }
          }
        \legacy_if_gset_true:n { @specialpage }
        \cs_gset_nopar:Npn \@specialstyle {#1}
      }
      {
        \undefinedpagestyle
      }
  }
\cs_set_nopar:Npn \cleardoublepage
  {
    \clearpage
    \int_if_even:nT { \c@page }
      {
        \hbox:n { }
        \thispagestyle { empty }
        \newpage
      }
  }

\IfDocumentMetadataTF
  {
    \socket_new_plug:nnn { fntext / mark } { sblbook }
      {
        \skip_horizontal:N \footnotemargin
        \@thefnmark . \enspace
      }
    \socket_assign_plug:nn { fntext / mark } { sblbook }
    \socket_assign_plug:nn
      { build / column / outputbox }
      { floats-space-footnotes }
  }
  {

    \RequirePackage [ bottom ] { footmisc }
    \cs_set:Npn \@makefntext #1
      {
        \dim_set_eq:NN \parindent \footnotemargin
        \@thefnmark . \enspace
        \footnotelayout #1
      }
}
\dim_set:Nn \footnotemargin { 0.25in }
\cs_set:Npn \footnoterule
  {
    \kern -3pt
    \hrule width 1.5in height .5pt depth 0pt
    \kern 0.0625in
  }
\skip_set:Nn \abovecaptionskip { 6pt }
\skip_set:Nn \belowcaptionskip { 6pt }
\cs_set:Npn \thefigure
  {
    \arabic { figure }
  }
\cs_set:Npn \thetable
  {
    \arabic { table }
  }
\counterwithout { figure } { chapter }
\counterwithout { table } { chapter }
\IfDocumentMetadataTF
  {
    \NewSocketPlug { caption / label } { sblbook }
     {
       \small
       #1:~
     }
    \AssignSocketPlug { caption / label } { sblbook }
  }
  {
    \RequirePackage [ font = small , skip = 6pt ] { caption }
  }
\IfDocumentMetadataTF
  {
    \hook_gput_code:nnn { begindocument / before } { sblbook }
      {
        \RenewDocumentEnvironment { quotation } { !O { } }
          {
            \UseInstance { blockenv } { quotation }
              {
                , begin-extra-vspace = 0pt
                , begin-vspace       = 11pt plus 5pt minus 3pt
                , left-margin        = \parindent
                , right-margin       = \parindent
                , para-indent        = \parindent
                , para-vspace        = 0pt
                , final-code         = \small \ignorespaces
                , #1
              }
          }
          { \endblockenv }
        \RenewDocumentEnvironment { quote } { !O { } }
          {
            \UseInstance { blockenv } { quote }
              {
                , begin-extra-vspace = 0pt
                , begin-vspace       = 11pt plus 5pt minus 3pt
                , left-margin        = \parindent
                , right-margin       = \parindent
                , para-indent        = 0pt
                , para-vspace        = 6pt plus 2pt minus 1pt
                , final-code         = \small \ignorespaces
                , #1
              }
          }
          { \endblockenv }
      }
  }
  {
    \renewenvironment { quotation }
      {
        \small
        \list { }
          {
            \dim_set_eq:NN \leftmargin \parindent
            \dim_set_eq:NN \rightmargin \leftmargin
            \skip_set:Nn   \topsep { 11pt plus 5pt minus 3pt }
            \skip_zero:N   \partopsep
            \skip_zero:N   \itemsep
            \skip_zero:N   \parsep
            \dim_set_eq:NN \itemindent \parindent
            \dim_set_eq:NN \listparindent \parindent
          }
        \item \ignorespaces
      }
      {
        \endlist
      }
    \renewenvironment { quote }
      {
        \small
        \list { }
          {
            \dim_set_eq:NN \leftmargin \parindent
            \dim_set_eq:NN \rightmargin \leftmargin
            \skip_set:Nn   \topsep { 11pt plus 5pt minus 3pt }
            \skip_zero:N   \partopsep
            \skip_zero:N   \itemsep
            \skip_set:Nn   \parsep { 6pt plus 2pt minus 1pt }
            \dim_zero:N    \itemindent
            \dim_zero:N    \listparindent
          }
        \item \ignorespaces
      }
      {
        \endlist
      }
  }
\cs_new_protected:Nn \__sblbook_supplied_page:
  {
    \group_begin:
      \vfill
      \normalfont
      \footnotesize
      \centering
      This ~ page ~ is ~ supplied ~ by ~ SBL ~ Press
      \para_end:
    \group_end:
  }
\tl_new:N \g__sblbook_subtitle_tl
\cs_set:Npn \subtitle #1
  {
    \tl_gset:Nn \g__sblbook_subtitle_tl {#1}
  }
\tl_new:N \g__sblbook_series_tl
\cs_set:Npn \series #1
  {
    \tl_gset:Nn \g__sblbook_series_tl {#1}
  }
\title    { [Title ~ of ~ Book] }
\subtitle { [Subtitle ~ of ~ Book] }
\author   { [Your ~ Name] }
\series   { [Series ~ Name] }
\cs_set_protected:Npn \maketitle
  {
    \group_begin:
      \thispagestyle { empty }
      \centering
      \vspace* { 0.5in }
      \LARGE
      \MakeUppercase { \@title }
      \para_end:
      \tl_if_empty:NF \g__sblbook_subtitle_tl
        {
          \vspace { 0.5in }
          \Large
          \g__sblbook_subtitle_tl
          \para_end:
        }
      \__sblbook_supplied_page:
    \group_end:
  }
\RenewDocumentEnvironment { titlepage } { }
  {
    \clearpage
    \thispagestyle { empty }
    \centering
    \vspace* { 0.5in }
    \LARGE
    \MakeUppercase { \@title }
    \para_end:
    \tl_if_empty:NF \g__sblbook_subtitle_tl
      {
        \vspace { 0.5in }
        \Large
        \g__sblbook_subtitle_tl
        \para_end:
      }
    \vspace { 0.5in }
    \large
    By
    \para_end:
    \@author
    \para_end:
    \normalsize
  }
  { \__sblbook_supplied_page: }
\NewDocumentEnvironment { copyrightpage } { }
  {
    \clearpage
    \thispagestyle { empty }
    \vspace* { 0.5in }
    \noindent
    Copyright ~ © ~ \number \year \space by ~ \@author
  }
  { \__sblbook_supplied_page: }
\NewDocumentEnvironment { seriespage } { }
  {
    \clearpage
    \thispagestyle { empty }
    \centering
    \vspace* { 0.5in }
    \LARGE
    \MakeUppercase { \g__sblbook_series_tl }
    \para_end:
    \normalsize
  }
  { \__sblbook_supplied_page: }
\NewDocumentEnvironment { dedication } { }
  {
    \cleardoublepage
    \int_compare:nNnT { \c@page } < { 5 }
      {
        \int_gset:Nn \c@page { 5 }
      }
    \thispagestyle { empty }
    \centering
    \vspace* { 1.5in }
    \itshape
  }
  { \para_end: }
\NewDocumentEnvironment { epigraph } { }
  {
    \cleardoublepage
    \int_compare:nNnT { \c@page } < { 5 }
      {
        \int_gset:Nn \c@page { 5 }
      }
    \thispagestyle { empty }
    \vspace* { 0.5in }
  }
  { \para_end: }
\cs_new_nopar:Npn \acknowledgementsname { Acknowledgements }
\NewDocumentEnvironment { acknowledgements } { }
  {
    \chapter* { \acknowledgementsname }
    \chaptermark { \acknowledgementsname }
    \addcontentsline { toc } { chapter } { \acknowledgementsname }
  }
  { \para_end: }
\cs_new_nopar:Npn \forewordname { Foreword }
\NewDocumentEnvironment { foreword } { }
  {
    \chapter* { \forewordname }
    \chaptermark { \forewordname }
    \addcontentsline { toc } { chapter } { \forewordname }
  }
  { \para_end: }
\cs_new_nopar:Npn \introductionname { Introduction }
\NewDocumentEnvironment { introduction } { }
  {
    \chapter* { \introductionname }
    \chaptermark { \introductionname }
    \addcontentsline { toc } { chapter } { \introductionname }
  }
  { \para_end: }
\cs_new_nopar:Npn \prefacename { Preface }
\NewDocumentEnvironment { preface } { }
  {
    \chapter* { \prefacename }
    \chaptermark { \prefacename }
    \addcontentsline { toc } { chapter } { \prefacename }
  }
  { \para_end: }
\setcounter { secnumdepth } { 0 }
\cs_set_nopar:Npn \thepart { \arabic { part } }
\IfDocumentMetadataTF
  {
    \cs_set:Npn \section
      {
        \hook_gput_next_code:nn { para / end }
          {
            \strut
            \dim_zero:N \hangindent
          }
        \@startsection { section } { 1 } { 0pt }
          { -12pt plus -4pt minus -2pt } { 10pt plus 4pt minus 2pt }
          { \normalfont \normalsize \centering \MakeUppercase }
      }
    \cs_set:Npn \subsection
      {
        \hook_gput_next_code:nn { para / end } { \strut }
        \@startsection { subsection } { 2 } { 0pt }
          { -6pt plus -2pt minus -1pt } { 4pt plus 2pt minus 1pt }
          { \normalfont \normalsize \scshape \raggedright }
      }
    \cs_set:Npn \subsubsection
      {
        \@startsection { subsubsection } { 3 } { 0pt }
          { 6pt plus 2pt minus 1pt } { -1em }
          { \normalfont \normalsize \scshape }
      }
    \cs_set:Npn \paragraph
      {
        \@startsection { paragraph } { 4 } { 0pt }
          { 6pt plus 2pt minus 1pt } { -1em }
          { \normalfont \normalsize \itshape }
      }
    \cs_set:Npn \subparagraph
      {
        \@startsection { subparagraph } { 5 } { 0.25in }
          { 0pt } { -1em }
          { \normalfont \normalsize \scshape }
      }
  }
  {
    \RequirePackage [ newparttoc ] { titlesec }
    \titleclass { \part } { page }
    \assignpagestyle { \part } { empty }
    \titlespacing* { \part }         { 0pt } { 0.5in }
      { 0.5in plus 12pt minus 6pt }
    \titlespacing* { \chapter }      { 0pt } { 0.5in }
      { 0.5in plus 12pt minus 6pt }
    \titlespacing* { \section }      { 0pt } { 12pt plus 4pt minus 2pt }
      { 10pt plus 4pt minus 2pt }
    \titlespacing* { \subsection }   { 0pt } { 6pt plus 2pt minus 1pt }
      { 4pt plus 2pt minus 1pt }
    \titlespacing* {\subsubsection } { 0pt } { 6pt plus 2pt minus 1pt }
      { 1em }
    \titlespacing* { \paragraph }    { 0pt } { 6pt plus 2pt minus 1pt }
      { 1em }
    \titlespacing* { \subparagraph } { 0.25in } { 0pt } { 1em }
    \titleformat
      { \part }
      [ block ]
      { \normalfont \Large \scshape \filcenter }
      { \partname \space \thepart : }
      { 0.5em }
      { }
    \titleformat
      { \chapter }
      [ display ]
      { \normalfont \Large \filcenter }
      { \thechapter }
      { 12pt }
      { }
    \titleformat
      { \section }
      [ block ]
      { \normalfont \normalsize \filcenter }
      { \thesection }
      { .5em }
      { \MakeUppercase }
    \titleformat
      { \subsection }
      [ block ]
      { \normalfont \normalsize \scshape \filright }
      { \thesubsection }
      { .5em }
      { }
    \titleformat
      { \subsubsection }
      [ runin ]
      { \normalfont \normalsize \scshape }
      { \thesubsubsection }
      { .5em }
      { }
    \titleformat
      { \paragraph }
      [ runin ]
      { \normalfont \normalsize \itshape }
      { \theparagraph }
      { .5em }
      { }
    \titleformat
      { \subparagraph }
      [ runin ]
      { \normalfont \normalsize \scshape }
      { \thesubparagraph }
      { .5em }
      { }
  }
\int_set:Nn \c@tocdepth { 1 }
\cs_set:Npn \tableofcontents
  {
    \chapter* { \contentsname }
    \@mkboth
      { \contentsname }
      { \contentsname }
    \int_compare:nNnT { \c@page } < { 5 }
      { \int_gset:Nn \c@page { 5 } }
    \@starttoc { toc }
  }
\cs_set:Npn \listoffigures
  {
    \chapter* { \listfigurename }
    \addcontentsline { toc } { chapter } { \listfigurename }
    \@mkboth
      { \listfigurename }
      { \listfigurename }
    \@starttoc { lof }
  }
\cs_set:Npn \listoftables
  {
    \chapter* { \listtablename }
    \addcontentsline { toc } { chapter } { \listtablename }
    \@mkboth
      { \listtablename }
      { \listtablename }
    \@starttoc { lot }
  }
\IfDocumentMetadataTF
  {
    \cs_set:Npn \@pnumwidth { 2em }
    \hook_gput_code_with_args:nnn { contentsline / text / after }
      { sblbook }
      {
        \int_compare:nNnT {#1} = { 1 }
          {
            \cs_set_nopar:Npn \leaders ##1 ##2 { }
            \hook_gput_next_code:nn { cmd / SuspendTagging / after }
              {
                \cs_set_nopar:Npn \leaders ##1 ##2 { }
              }
          }
      }
     \cs_set_nopar:Npn \numberline #1
       {
         \hbox_to_wd:nn { \@tempdima }
           {
             \hook_use:nnw { contentsline / number / before } { 1 } {#1}
             \hfill #1. \enspace
             \hook_use:nnw { contentsline / number / after } { 1 } {#1}
           }
       }
    \cs_set_nopar:Npn \l@chapter
      {
        \@dottedtocline { 0 } { 0em } { 2em }
      }
    \cs_set_nopar:Npn \l@section
      {
        \@dottedtocline { 1 } { 2em } { 2.5em }
      }
    \cs_set_nopar:Npn \l@subsection
      {
        \@dottedtocline { 2 } { 4.5em } { 3em }
      }
    \cs_set_nopar:Npn \l@subsubsection
      {
        \@dottedtocline { 3 } { 7.5em } { 3em }
      }
    \cs_set_nopar:Npn \l@paragraph
      {
        \@dottedtocline { 4 } { 10.5em } { 3em }
      }
    \cs_set_nopar:Npn \l@subparagraph
      {
        \@dottedtocline { 5 } { 13.5em } { 0em }
      }
    \cs_set_nopar:Npn \l@figure
      {
        \@dottedtocline { 0 } { 0em } { 2em }
      }
    \cs_set_eq:NN \l@table \l@figure
    \cs_set_nopar:Npn \@chapter [#1]#2
      {
        \__sblbook_if_page_numbering:nT { roman }
          { \pagenumbering { arabic } }
        \mode_leave_vertical:
        \par
        \addvspace { 0.5in }
        \int_compare:nNnTF { \c@secnumdepth } > { -1 }
          {
            \addtocontents { toc } { \addvspace { \bigskipamount } }
            \refstepcounter { chapter }
            \addcontentsline { toc } { chapter }
              {
                \protect \numberline { \thechapter } #1
              }
          }
          {
            \addcontentsline { toc } { chapter } {#1}
          }
        \group_begin:
          \dim_zero:N \parindent
          \centering
          \interlinepenalty 10000
          \normalfont
          \Large
          \int_compare:nNnT { \c@secnumdepth } > { -1 }
            {
              \thechapter
              \par
              \nobreak
              \skip_vertical:n { \bigskipamount }
            }
          #2
          \strut
          \chaptermark {#1}
          \par
        \group_end:
        \nobreak
        \skip_vertical:n { 0.5in plus 12pt minus 6pt }
        \@afterheading
      }
    \cs_set_nopar:Npn  \@schapter #1
      {
        \mode_leave_vertical:
        \par
        \addvspace { 0.5in }
        \group_begin:
          \dim_zero:N \parindent
          \centering
          \interlinepenalty 10000
          \normalfont
          \Large
          #1
          \strut
          \par
        \group_end:
        \nobreak
        \skip_vertical:n { 0.5in plus 12pt minus 6pt }
        \@afterheading
      }
    \cs_set:Npn \@part [#1]#2
      {
        \unskip
        \skip_vertical:n { 0.5in }
        \thispagestyle { empty }
        \int_compare:nNnTF { \c@secnumdepth } > { -2 }
          {
            \addtocontents { toc } { \addvspace { \bigskipamount } }
            \refstepcounter { part }
            \addcontentsline { toc } { part }
              {
                \partname \space \thepart : \hspace { 0.5em } #1
              }
          }
          {
            \addcontentsline { toc } { part } {#1}
          }
        \markboth { } { }
        \group_begin:
          \centering
          \interlinepenalty 10000
          \normalfont
          \Large
          \scshape
          \int_compare:nNnT { \c@secnumdepth } > { -2 }
            { \partname \nobreakspace \thepart : \enspace }
          #2
          \strut
          \par
        \group_end:
        \@endpart
      }
    \cs_set:Npn \@spart #1
      {
        \unskip
        \skip_vertical:n { 0.5in }
        \thispagestyle { empty }
        \group_begin:
          \centering
          \interlinepenalty 10000
          \normalfont
          \Large
          \scshape
          #1
          \strut
          \par
        \group_end:
        \@endpart
      }
  }
  {
    \RequirePackage { titletoc }
    \contentsmargin { 2em }
    \cs_new_protected:Nn \__sblbook_hyperlink:nn
      {
        \cs_if_exist_use:NTF \hyperlink
          { { #1 } { #2 } }
          { #2 }
      }
    \cs_new_protected:Nn \__sblbook_contents_label_box:nn
      {
        \__sblbook_hyperlink:nn
          { \Hy@tocdestname }
          {
            \makebox [ #1 ] [ #2 ] { \thecontentslabel . \enspace }
          }
      }
    \cs_new_protected:Nn \__sblbook_contents_label:
      {
        \__sblbook_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel . \enspace }
      }
    \cs_new_protected:Nn \__sblbook_contents_above:n
      {
        \hspace* { -#1 }
        \filright
      }
    \titlecontents { figure }
      [ 2em ]
      {
        \__sblbook_contents_above:n { 2em }
      }
      {
        \__sblbook_contents_label_box:nn { 2em } { r }
      }
      { }
      { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
    \titlecontents { table }
      [ 2em ]
      {
        \__sblbook_contents_above:n { 2em }
      }
      {
        \__sblbook_contents_label_box:nn { 2em } { r }
      }
      { }
      { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
    \titlecontents { part }
      [ 2em ]
      {
        \addvspace { \bigskipamount }
        \scshape \filcenter
      }
      {
        \__sblbook_hyperlink:nn
          { \Hy@tocdestname }
          {
            \partname \space \thecontentslabel : \hspace { 0.5em }
          }
      }
      { }
      { }
    \titlecontents { chapter }
      [ 2em ]
      {
        \tl_if_empty:NF \thecontentslabel
          {
            \addvspace { \bigskipamount }
          }
        \__sblbook_contents_above:n { 2em }
      }
      {
        \__sblbook_contents_label_box:nn { 2em } { r }
      }
      { }
      { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
    \titlecontents { section }
      [ 4.5em ]
      {
        \__sblbook_contents_above:n { 2.5em }
      }
      {
        \__sblbook_contents_label_box:nn { 2.5em } { r }
      }
      { }
      { \hfill \contentspage }
    \titlecontents { subsection }
      [ 7.5em ]
      {
        \__sblbook_contents_above:n { 3em }
      }
      {
        \__sblbook_contents_label:
      }
      { }
      { \hfill \contentspage }
    \titlecontents { subsubsection }
      [ 10.5em ]
      {
        \__sblbook_contents_above:n { 3em }
      }
      {
        \__sblbook_contents_label:
      }
      { }
      { \hfill \contentspage }
    \titlecontents { paragraph }
      [ 13.5em ]
      {
        \__sblbook_contents_above:n { 3em }
      }
      {
        \__sblbook_contents_label:
      }
      { }
      { \hfill \contentspage }
    \titlecontents { subparagraph }
      [ 16.5em ]
      {
        \__sblbook_contents_above:n { 3em }
      }
      {
        \__sblbook_contents_label:
      }
      { }
      { \hfill \contentspage }
  }
\hook_gput_code:nnn
  { cmd / backmatter / after }
  { sblbook }
  {
    \bool_if:NF \g__sblbook_appendix_bool
      {
        \addtocontents { toc } { \addvspace { \bigskipamount } }
      }
  }
\cs_set_eq:NN \sblbook@hyperlink \__sblbook_hyperlink:nn
\bool_new:N \g__sblbook_appendix_bool
\newcounter { sblbook@appendix@count }
\cs_new_protected:Nn \__sblbook_set_up_appendices:
  {
    \bool_gset_true:N \g__sblbook_appendix_bool
    \cs_gset_nopar:Npn \thechapter
      { \@arabic \c@chapter }
    \cs_set_nopar:Npn \chaptername
      { \appendixname }
    \addtocontents { toc } { \def \protect \chaptername { \appendixname } }
    \addtocontents { toc } { \addvspace { \bigskipamount } }
    \int_compare:nNnT { \c@sblbook@appendix@count } = { \c_one_int }
      {
        \int_zero:N \c@sblbook@appendix@count
      }
    \IfDocumentMetadataTF
      {
        \cs_set_nopar:Npn \@chapter [##1]##2
          {
            \stepcounter { sblbook@appendix@count }
            \mode_leave_vertical:
            \par
            \addvspace { 0.5in }
            \int_compare:nNnTF { \c@secnumdepth } > { -1 }
              {
                \refstepcounter { chapter }
                \protected@write \@auxout
                  { }
                  {
                    \string \setcounter
                      { sblbook@appendix@count } { \the \c@chapter }
                  }
                \addcontentsline { toc } { chapter }
                  {
                    \chaptername
                    \ifnum \c@sblbook@appendix@count > 1
                      \space \thechapter
                    \fi
                    : \enspace ##1
                  }
              }
              {
                \addcontentsline { toc } { chapter } {##1}
              }
            \group_begin:
              \dim_zero:N \parindent
              \centering
              \interlinepenalty 10000
              \normalfont
              \Large
              \int_compare:nNnT { \c@secnumdepth } > { -1 }
                {
                  \chaptername
                  \int_compare:nNnT
                    { \c@sblbook@appendix@count } > { \c_one_int }
                    {
                       \nobreakspace \thechapter
                    }
                  \par
                  \nobreak
                  \skip_vertical:n { \bigskipamount }
                }
              ##2
              \chaptermark {##1}
              \par
            \group_end:
            \nobreak
            \skip_vertical:n { 0.5in plus 12pt minus 6pt }
            \@afterheading
          }
      }
      {
        \titleformat
          { \chapter }
          [ display ]
          {
            \stepcounter { sblbook@appendix@count }
            \protected@write \@auxout
              { }
              {
                \protect \setcounter
                  { sblbook@appendix@count } { \the \c@chapter }
              }
            \normalfont \Large \filcenter
          }
          {
            \chaptername
            \ifnum \c@sblbook@appendix@count > 1
              \strut \space \thechapter
            \fi
          }
          { 12pt }
          { }
        \titlecontents { chapter }
          [ 2em ]
          {
            \hspace* { -2em }
            \filright
          }
          {
            \sblbook@hyperlink
              { \Hy@tocdestname }
              {
                \chaptername
                \ifnum \c@sblbook@appendix@count > 1
                  \strut \space \thecontentslabel
                \fi
                : \enspace
              }
          }
          { }
          { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
      }
  }
\hook_gput_code:nnn
  { cmd / appendix / after }
  { sblbook }
  { \__sblbook_set_up_appendices: }
\cs_set_nopar:Npn \bibfont { \small }
\dim_set:Nn \bibhang { 0.25in }
\dim_set:Nn \biblabelsep { 0.25in }
\prg_new_conditional:Npnn \__sblbook_if_page_numbering:n #1 { T }
  {
    \cs_set_nopar:Nn \__sblbook_thepage_test:
      { \csname @ #1 \endcsname \c@page }
    \if_meaning:w \thepage \__sblbook_thepage_test:
      \prg_return_true:
    \else:
      \prg_return_false:
    \fi:
  }
%% 
%%
%% End of file `sblbook.cls'.
