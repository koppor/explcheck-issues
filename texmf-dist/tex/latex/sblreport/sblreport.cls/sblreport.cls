%%
%% This is file `sblreport.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sblreport.dtx  (with options: `class')
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
\ProvidesExplClass{sblreport}{2026-04-04}{1.0}
  {Society of Biblical Literature Report Class (DCP)}
\clist_new:N \l__sblreport_options_to_report_class_clist
\keys_define:nn { sblreport }
  {
    , biblatex .clist_set:N = \l__sblreport_options_to_biblatex_clist
    , sblfonts .clist_set:N = \l__sblreport_options_to_sblfonts_clist
    , unknown  .code:n = {
                           \clist_put_right:No
                             \l__sblreport_options_to_report_class_clist
                             { \CurrentOption }
                         }
  }
\ProcessKeyOptions
\clist_put_left:Nn \l__sblreport_options_to_report_class_clist
  {
    , 12pt
    , titlepage
  }
\clist_put_left:Nn \l__sblreport_options_to_biblatex_clist
  {
    , style    = sbl
    , language = auto
    , autolang = hyphen
  }
\sys_if_engine_opentype:TF
  {
    \clist_put_left:Nn \l__sblreport_options_to_sblfonts_clist
      {
        , mainfont        = TeXGyreTermesX
        , mainfontoptions = {
                              , Extension      = .otf
                              , UprightFont    = *-Regular
                              , ItalicFont     = *-Italic
                              , BoldFont       = *-Bold
                              , BoldItalicFont = *-BoldItalic
                            }
        , sblfonts        = true
      }
  }
  {
    \clist_put_left:Nn \l__sblreport_options_to_sblfonts_clist
      {
        , mainfont = tempora
        , grfont   = Alegreya-LF
        , hefont   = frank
      }
  }
\exp_args:No \PassOptionsToClass
  { \l__sblreport_options_to_report_class_clist }
  { report }
\LoadClass { report }
\exp_args:No \PassOptionsToPackage
  { \l__sblreport_options_to_sblfonts_clist }
  { sblfonts }
\RequirePackage { sblfonts }
\exp_args:No \PassOptionsToPackage
  { \l__sblreport_options_to_biblatex_clist }
  { biblatex }
\RequirePackage { biblatex }
\RequirePackage { csquotes }
\RequirePackage [ margin = 1in, headheight = 14.5pt ] { geometry }
\RequirePackage { setspace }
\RequirePackage { ragged2e }
\doublespacing
\frenchspacing
\dim_set:Nn \RaggedRightParindent { 0.5in }
\dim_set:Nn \RaggedLeftParindent  { 0.5in }
\dim_set:Nn \JustifyingParindent  { 0.5in }
\RaggedRight
\sloppy
\raggedbottom
\sys_if_engine_luatex:F
  {
    \AddBabelHook [ hebrew ] { sblreport } { afterextras }
      {
        \raggedleft
        \parindent 0.5in
      }
    \AddBabelHook { sblreport } { afterextras } { \RaggedRight }
  }
\RequirePackage { fancyhdr }
\pagestyle { fancy }
\fancyhf { }
\fancyhead [ R ] { \thepage }
\cs_set_nopar:Npn \headrulewidth { 0pt }
\cs_set_nopar:Npn \sectionmark #1
  {
    \markboth
      { \int_compare:nNnT
          { \c@secnumdepth } > { \c_zero_int }
          { \thesection \skip_horizontal:n { 1em } }
        #1
      }
      { }
  }
\IfDocumentMetadataTF
  {
    \hook_gput_code:nnn { fntext / para } { sblreport }
      { \RaggedRight }
    \socket_new_plug:nnn { fntext / mark } { sblreport }
      {
        \skip_horizontal:N \footnotemargin
        \@thefnmark . \enspace
      }
    \socket_assign_plug:nn { fntext / mark } { sblreport }
    \socket_assign_plug:nn
      { build / column / outputbox }
      { floats-space-footnotes }
  }
  {
    \RequirePackage [ bottom, ragged ] { footmisc }
    \cs_set:Npn \@makefntext #1
      {
        \dim_set_eq:NN \parindent \footnotemargin
        \@thefnmark . \enspace
        \footnotelayout #1
      }
}
\dim_set:Nn \footnotemargin { 0.5in }
\cs_set:Npn \footnoterule
  {
    \kern -3pt
    \hrule width 2in
    \kern 2.6pt
    \vskip -8pt
  }
\dim_set:Nn \footnotesep { 20pt }
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
    \NewSocketPlug { caption / label } { sblreport }
     {
       \small
       #1:~
     }
    \AssignSocketPlug { caption / label } { sblreport }
  }
  {
    \RequirePackage [ font = small , skip = 6pt ] { caption }
  }
\IfDocumentMetadataTF
  {
    \hook_gput_code:nnn { begindocument / before } { sblreport }
      {
        \RenewDocumentEnvironment { quotation } { !O { } }
          {
            \UseInstance { blockenv } { quotation }
              {
                , begin-extra-vspace = 0pt
                , begin-vspace = 0pt
                , left-margin  = 0.5in
                , right-margin = 0pt
                , para-indent  = 0.5in
                , para-vspace  = 0pt
                , final-code   = \singlespacing
                                 \vspace* { -5pt }
                                 \ignorespaces
                , #1
              }
          }
          { \endblockenv }
        \RenewDocumentEnvironment { quote } { !O { } }
          {
            \UseInstance { blockenv } { quote }
              {
                , begin-extra-vspace = 0pt
                , begin-vspace = 0pt
                , left-margin  = 0.5in
                , right-margin = 0pt
                , para-indent  = 0pt
                , para-vspace  = 7pt
                , final-code   = \singlespacing
                                 \vspace* { -5pt }
                                 \ignorespaces
                , #1
              }
          }
          { \endblockenv }
      }
  }
  {
    \renewenvironment { quotation }
      {
        \list { }
          {
            \dim_set:Nn \leftmargin { 0.5in }
            \dim_zero:N \rightmargin
            \dim_zero:N \topsep
            \dim_zero:N \partopsep
            \dim_zero:N \itemsep
            \dim_zero:N \parsep
            \dim_set:Nn \itemindent { 0.5in }
            \dim_set:Nn \listparindent { 0.5in }
          }
        \item \relax
        \singlespacing
        \vspace* { -5pt }
      }
      {
        \endlist
      }
    \renewenvironment { quote }
      {
        \list { }
          {
            \dim_set:Nn \leftmargin { 0.5in }
            \dim_zero:N \rightmargin
            \dim_zero:N \topsep
            \dim_zero:N \partopsep
            \dim_zero:N \itemsep
            \dim_set:Nn \parsep { 7pt }
            \dim_zero:N \itemindent
            \dim_zero:N \listparindent
          }
        \item \relax
        \singlespacing
        \vspace* { -5pt }
      }
      {
        \endlist
      }
  }
\tl_new:N \g__sblreport_degree_tl
\tl_new:N \g__sblreport_institution_tl
\cs_new_protected:Npn \degree #1
  {
    \tl_gset:Nn \g__sblreport_degree_tl { #1 }
  }
\cs_new_protected:Npn \institution #1
  {
    \tl_gset:Nn \g__sblreport_institution_tl { #1 }
  }
\author { [Your ~ Name] }
\title { Title ~ of ~ Paper }
\tl_gset:Nn \g__sblreport_degree_tl { [Degree ~ Name] }
\tl_gset:Nn \g__sblreport_institution_tl { [Name ~ of ~ Institution] }
\cs_set_protected:Npn \maketitle
  {
    \newgeometry { top=2in, bottom=2in }
    \pagenumbering { roman }
    \thispagestyle { empty }
    \group_begin:
      \singlespacing
      \centering
      \MakeUppercase { \g__sblreport_institution_tl } \para_end:
      \vfill
      \doublespacing
      \MakeUppercase { \@title } \para_end:
      \vfill
      \singlespacing
      \MakeUppercase { Submitted ~ to ~ the ~ Faculty } \para_end:
      \MakeUppercase { in ~ Partial ~ Fulfilment ~ of ~ the } \para_end:
      \MakeUppercase { Requirements ~ for ~ the ~ Degree } \para_end:
      \MakeUppercase { \g__sblreport_degree_tl } \para_end:
      \vfill
      \MakeUppercase { By } \para_end:
      \MakeUppercase { \@author } \para_end:
      \MakeUppercase { \@date } \para_end:
    \group_end:
    \restoregeometry
  }
\RenewDocumentEnvironment { abstract } { }
  {
    \chapter* { \abstractname }
    \addcontentsline { toc } { chapter } { \abstractname }
  }
  { }
\cs_set_nopar:Npn  \acknowledgementsname { Acknowledgements }
\NewDocumentEnvironment { acknowledgements } { }
  {
    \chapter* { \acknowledgementsname }
    \addcontentsline { toc } { chapter } { \acknowledgementsname }
  }
  { }
\cs_set_nopar:Npn  \prefacename { Preface }
\NewDocumentEnvironment { preface } { }
  {
    \chapter* { \prefacename }
    \addcontentsline { toc } { chapter } { \prefacename }
  }
  { }
\NewDocumentEnvironment { copyrightpage } { }
  {
    \clearpage
    \thispagestyle { empty }
  }
  { }
\NewDocumentEnvironment { approvalpage } { }
  {
    \clearpage
    \thispagestyle { empty }
  }
  { }
\NewDocumentEnvironment { dedication } { }
  {
    \clearpage
    \thispagestyle { empty }
  }
  { }
\NewDocumentEnvironment { epigraph } { }
  {
    \clearpage
    \thispagestyle { empty }
  }
  { }
\cs_new_nopar:Nn \__sblreport_before_head_correction:
  {
    \hook_gclear_next_code:n { para / before }
  }
\cs_new_nopar:Nn \__sblreport_after_head_correction:
  {
    \vspace* { -5.5pt }
    \hook_gput_next_code:nn { para / before } { \vspace* { 5.5pt } }
  }
\IfDocumentMetadataTF
  {
    \cs_set:Npn \section
      {
        \hook_gput_next_code:nn { para / end }
          { \dim_zero:N \hangindent }
        \__sblreport_before_head_correction:
        \hook_gput_next_code:nn { para / after }
          { \__sblreport_after_head_correction: }
        \@startsection { section } { 1 } { 0pt } { -37pt } { 1sp }
          { \singlespacing \normalfont \normalsize \bfseries \centering }
      }
    \cs_set:Npn \subsection
      {
        \hook_gput_next_code:nn { para / end }
          { \dim_zero:N \hangindent }
        \__sblreport_before_head_correction:
        \hook_gput_next_code:nn { para / after }
          { \__sblreport_after_head_correction: }
        \@startsection { subsection } { 2 } { 0pt } { -37pt } { 1sp }
          { \singlespacing \normalfont \normalsize \centering }
      }
    \cs_set:Npn \subsubsection
      {
        \__sblreport_before_head_correction:
        \hook_gput_next_code:nn { para / after }
          { \__sblreport_after_head_correction: }
        \@startsection { subsubsection } { 3 } { 0pt } { -37pt } { 1sp }
          { \singlespacing \normalfont \normalsize \bfseries \itshape }
      }
    \cs_set:Npn \paragraph
      {
        \__sblreport_before_head_correction:
        \hook_gput_next_code:nn { para / end } { \strut }
        \@startsection { paragraph } { 4 } { 0pt } { -37pt } { 1sp }
          { \singlespacing \normalfont \normalsize }
      }
    \cs_set:Npn \subparagraph
      {
        \@startsection { subparagraph } { 5 } { 0pt } { -37pt } { -1em }
          { \singlespacing \normalfont \normalsize \bfseries }
      }
    \cs_set_nopar:Npn \@chapter [#1]#2
      {
        \__sblreport_if_page_numbering:nT { roman }
          { \pagenumbering { arabic } }
        \mode_leave_vertical:
        \par
        \addvspace { 37pt }
        \int_compare:nNnTF { \c@secnumdepth } > { -1 }
          {
            \refstepcounter { chapter }
            \addcontentsline { toc } { chapter }
              { \chaptername \space \thechapter : \enspace #1 }
          }
          {
            \addcontentsline { toc } { chapter } {#1}
          }
        \group_begin:
          \dim_zero:N \parindent
          \centering
          \interlinepenalty 10000
          \normalfont
          \int_compare:nNnT { \c@secnumdepth } > { -1 }
            {
              \MakeUppercase { \chaptername } \nobreakspace \thechapter
              \par
              \nobreak
            }
          \singlespacing
          \MakeUppercase {#2}
          \hook_gput_next_code:nn { para / after }
            { \__sblreport_after_head_correction: }
          \markboth { } { }
          \par
        \group_end:
        \nobreak
        \skip_vertical:n { 39pt }
        \@afterheading
      }
    \cs_set_nopar:Npn  \@schapter #1
      {
        \mode_leave_vertical:
        \par
        \addvspace { 37pt }
        \group_begin:
          \dim_zero:N \parindent
          \centering
          \interlinepenalty 10000
          \normalfont
          \singlespacing
          \MakeUppercase {#1}
          \hook_gput_next_code:nn { para / after }
            { \__sblreport_after_head_correction: }
          \par
        \group_end:
        \nobreak
        \skip_vertical:n { 39pt }
        \@afterheading
      }
  }
  {
    \RequirePackage { titlesec }
    \titlespacing* { \chapter }       { 0pt } { 41pt } { 37pt }
    \titlespacing* { \section }       { 0pt } { 37pt } { 0pt }
    \titlespacing* { \subsection }    { 0pt } { 37pt } { 0pt }
    \titlespacing* { \subsubsection } { 0pt } { 37pt } { 0pt }
    \titlespacing* { \paragraph }     { 0pt } { 37pt } { 0pt }
    \titlespacing* { \subparagraph }  { 0pt } { 37pt } { 0pt }
    \titleformat
      { \chapter }
      [ display ]
      { \normalfont \normalsize \singlespacing \filcenter }
      {
        \__sblreport_if_page_numbering:nT { roman }
          { \pagenumbering { arabic } }
        \MakeUppercase { \chaptername } \space \thechapter
      }
      { 12pt }
      { \MakeUppercase }
      [ \__sblreport_after_head_correction: ]
    \titleformat
      { \section }
      [ block ]
      {
        \__sblreport_before_head_correction:
        \normalfont \normalsize \singlespacing \bfseries \filcenter
      }
      { \thesection }
      { 0.5em }
      { }
      [ \__sblreport_after_head_correction: ]
    \titleformat
      { \subsection }
      [ block ]
      {
        \__sblreport_before_head_correction:
        \normalfont \normalsize \singlespacing \filcenter
      }
      { \thesubsection }
      { 0.5em }
      { }
      [ \__sblreport_after_head_correction: ]
    \titleformat
      { \subsubsection }
      [ block ]
      {
        \__sblreport_before_head_correction:
        \normalfont \normalsize \singlespacing \bfseries \itshape \filright
      }
      { \thesubsubsection }
      { 0.5em }
      { }
      [ \__sblreport_after_head_correction: ]
    \titleformat
      { \paragraph }
      [ block ]
      {
        \__sblreport_before_head_correction:
        \normalfont \normalsize \singlespacing \filright
      }
      { \theparagraph }
      { 0.5em }
      { }
    \titleformat
      { \subparagraph }
      [ runin ]
      { \normalfont \normalsize \bfseries }
      { \thesubparagraph }
      { 1em }
      { }
  }
\int_set:Nn \c@tocdepth { 2 }
\hook_gput_code:nnn { cmd / @starttoc / before } { sblreport }
  {
    \hook_gput_next_code:nn { cmd / @input / before }
      { \singlespacing }
  }
\cs_set:Npn \tableofcontents
  {
    \chapter* { \contentsname }
    \@mkboth
      { \contentsname }
      { \contentsname }
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
    \text_declare_expand_equivalent:Nn \numberline
      {
        \exp_not:n { \numberline }
      }
    \hook_gput_code:nnn { cmd / @dottedtocline / before }
      { sblreport }
      {
        \addvspace { \baselineskip }
      }
    \hook_gput_code_with_args:nnn { contentsline / text / after }
      { sblreport }
      {
        \int_compare:nNnT {#1} > { -1 }
          {
            \cs_set_nopar:Npn \leaders ##1 ##2 { }
            \hook_gput_next_code:nn { cmd / SuspendTagging / after }
              {
                \cs_set_nopar:Npn \leaders ##1 ##2 { }
              }
          }
      }
    \cs_set_nopar:cpn { contentsline@text@0@format }
      { \MakeUppercase }
    \cs_set_nopar:Npn \numberline #1
      {
        \hook_use:nnw { contentsline / number / before } { 1 } {#1}
        #1 \enspace
        \hook_use:nnw { contentsline / number / after } { 1 } {#1}
      }
    \cs_set_nopar:Npn \l@chapter
      {
        \@dottedtocline { 0 } { 0em } { 0em }
      }
    \cs_set_nopar:Npn \l@section
      {
        \@dottedtocline { 1 } { 1em } { 0em }
      }
    \cs_set_nopar:Npn \l@subsection
      {
        \@dottedtocline { 2 } { 2em } { 0em }
      }
    \cs_set_nopar:Npn \l@subsubsection
      {
        \@dottedtocline { 3 } { 3em } { 0em }
      }
    \cs_set_nopar:Npn \l@paragraph
      {
        \@dottedtocline { 4 } { 4em } { 0em }
      }
    \cs_set_nopar:Npn \l@subparagraph
      {
        \@dottedtocline { 5 } { 5em } { 0em }
      }
    \cs_set_nopar:Npn \l@figure
      {
        \@dottedtocline { 1 } { 0em } { 0em }
      }
    \cs_set_eq:NN \l@table \l@figure
  }
  {
    \RequirePackage { titletoc }
    \cs_new_protected:Nn \__sblreport_hyperlink:nn
      {
        \cs_if_exist_use:NTF \hyperlink
          { { #1 } { #2 } }
          { #2 }
      }
    \titlecontents { figure }
      [ 0pt ]
      { \singlepacing \filright }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          { \makebox [ 2em ] [ r ] { \thecontentslabel . \enspace } }
      }
      { }
      { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
    \titlecontents { table }
      [ 0pt ]
      { \singlespacing \filright }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          { \makebox [ 2em ] [ r ] { \thecontentslabel . \enspace } }
      }
      { }
      { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
    \titlecontents { chapter }
      [ 0pt ]
      { \singlespacing \filright }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          {
            \MakeUppercase { \chaptername } \space
            \thecontentslabel : \enspace
          }
        \MakeUppercase
      }
      { \MakeUppercase }
      { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
    \titlecontents { section }
      [ 1em ]
      { \singlespacing \filright }
      { }
      { }
      { \hfill \contentspage }
    \titlecontents { subsection }
      [ 2em ]
      { \singlespacing \filright }
      { }
      { }
      { \hfill \contentspage }
    \titlecontents { subsubsection }
      [ 3em ]
      { \singlespacing \filright }
      { }
      { }
      { \hfill \contentspage }
    \titlecontents { paragraph }
      [ 4em ]
      { \singlespacing \filright }
      { }
      { }
      { \hfill \contentspage }
    \titlecontents { subparagraph }
      [ 5em ]
      { \singlespacing \filright }
      { }
      { }
      { \hfill \contentspage }
  }
\cs_set_eq:NN \sblreport@hyperlink \__sblreport_hyperlink:nn
\newcounter { sblreport@appendix@count }
\cs_new_protected:Nn \__sblreport_set_up_appendices:
  {
    \cs_set_nopar:Npn \chaptername { \appendixname }
    \addtocontents { toc } { \def \protect \chaptername { \appendixname } }
    \int_compare:nNnT { \c@sblreport@appendix@count } = { \c_one_int }
      {
        \int_zero:N \c@sblreport@appendix@count
      }
    \IfDocumentMetadataTF
      {
        \cs_set_nopar:Npn \@chapter [##1]##2
          {
            \mode_leave_vertical:
            \par
            \addvspace { 37pt }
            \stepcounter { sblreport@appendix@count }
            \int_compare:nNnTF { \c@secnumdepth } > { -1 }
              {
                \refstepcounter { chapter }
                \protected@write \@auxout
                  { }
                  {
                    \string \setcounter
                      { sblreport@appendix@count } { \the \c@chapter }
                  }
                \addcontentsline { toc } { chapter }
                  {
                    \chaptername
                    \ifnum \c@sblreport@appendix@count > 1
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
              \int_compare:nNnT { \c@secnumdepth } > { -1 }
                {
                  \MakeUppercase { \chaptername }
                  \int_compare:nNnT
                    { \c@sblreport@appendix@count } > { \c_one_int }
                    {
                       \nobreakspace \thechapter
                    }
                  \par
                  \nobreak
                }
              \singlespacing
              \MakeUppercase {##2}
              \hook_gput_next_code:nn { para / after }
                { \__sblreport_after_head_correction: }
              \markboth { } { }
              \par
            \group_end:
            \nobreak
            \skip_vertical:n { 39pt }
            \@afterheading
          }
      }
      {
        \titleformat
          { \chapter }
          [ display ]
          {
            \stepcounter { sblreport@appendix@count }
            \protected@write \@auxout
              { }
              {
                \protect \setcounter
                  { sblreport@appendix@count } { \the \c@chapter }
              }
            \singlespacing \normalfont \normalsize \filcenter
          }
          {
            \MakeUppercase { \chaptername }
            \ifnum \c@sblreport@appendix@count > 1
              \strut \space \thechapter
            \fi
          }
          { 12pt }
          { \MakeUppercase }
        \titlecontents { chapter }
          [ 0pt ]
          { \singlespacing \filright }
          {
            \sblreport@hyperlink
              { \Hy@tocdestname }
              {
                \MakeUppercase { \chaptername }
                \ifnum \c@sblreport@appendix@count > 1
                  \strut \space \thecontentslabel
                \fi
                : \enspace
              }
            \MakeUppercase
          }
          { \MakeUppercase }
          { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
      }
  }
\hook_gput_code:nnn
  { cmd / appendix / after }
  { sblreport }
  { \__sblreport_set_up_appendices: }
\DefineBibliographyStrings { english }
  {
    shorthands = { List~of~Abbreviations }
  }
\cs_set_nopar:Npn \bibsetup { \singlespacing }
\dim_set:Nn \bibhang { 0.5in }
\dim_set:Nn \bibitemsep { 12pt }
\dim_set:Nn \biblabelsep { 0.5in }
\prg_new_conditional:Npnn \__sblreport_if_page_numbering:n #1 { T }
  {
    \cs_set_nopar:Nn \__sblreport_thepage_test:
      { \csname @ #1 \endcsname \c@page }
    \if_meaning:w \thepage \__sblreport_thepage_test:
      \prg_return_true:
    \else:
      \prg_return_false:
    \fi:
  }
%% 
%%
%% End of file `sblreport.cls'.
