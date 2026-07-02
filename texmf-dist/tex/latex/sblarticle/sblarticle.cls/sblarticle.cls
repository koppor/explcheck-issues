%%
%% This is file `sblarticle.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sblarticle.dtx  (with options: `class')
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
\ProvidesExplClass{sblarticle}{2026-04-04}{1.0}
  {Society of Biblical Literature Article Class (DCP)}
\clist_new:N \l__sblarticle_options_to_article_class_clist
\keys_define:nn { sblarticle }
  {
    , biblatex .clist_set:N = \l__sblarticle_options_to_biblatex_clist
    , sblfonts .clist_set:N = \l__sblarticle_options_to_sblfonts_clist
    , unknown  .code:n = {
                           \clist_put_right:No
                             \l__sblarticle_options_to_article_class_clist
                             { \CurrentOption }
                         }
  }
\ProcessKeyOptions
\clist_put_left:Nn \l__sblarticle_options_to_article_class_clist
  {
    , 12pt
    , titlepage
  }
\clist_put_left:Nn \l__sblarticle_options_to_biblatex_clist
  {
    , style    = sbl
    , language = auto
    , autolang = hyphen
  }
\sys_if_engine_opentype:TF
  {
    \clist_put_left:Nn \l__sblarticle_options_to_sblfonts_clist
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
    \clist_put_left:Nn \l__sblarticle_options_to_sblfonts_clist
      {
        , mainfont = tempora
        , grfont   = Alegreya-LF
        , hefont   = frank
      }
  }
\exp_args:No \PassOptionsToClass
  { \l__sblarticle_options_to_article_class_clist }
  { article }
\LoadClass { article }
\exp_args:No \PassOptionsToPackage
  { \l__sblarticle_options_to_sblfonts_clist }
  { sblfonts }
\RequirePackage { sblfonts }
\exp_args:No \PassOptionsToPackage
  { \l__sblarticle_options_to_biblatex_clist }
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
    \AddBabelHook [ hebrew ] { sblarticle } { afterextras }
      {
        \raggedleft
        \parindent 0.5in
      }
    \AddBabelHook { sblarticle } { afterextras } { \RaggedRight }
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
    \hook_gput_code:nnn { fntext / para } { sblarticle }
      { \RaggedRight }
    \socket_new_plug:nnn { fntext / mark } { sblarticle }
      {
        \skip_horizontal:N \footnotemargin
        \@thefnmark . \enspace
      }
    \socket_assign_plug:nn { fntext / mark } { sblarticle }
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
\counterwithout { figure } { part }
\counterwithout { table } { part }
\IfDocumentMetadataTF
  {
    \NewSocketPlug { caption / label } { sblarticle }
     {
       \small
       #1:~
     }
    \AssignSocketPlug { caption / label } { sblarticle }
  }
  {
    \RequirePackage [ font = small , skip = 6pt ] { caption }
  }
\IfDocumentMetadataTF
  {
    \hook_gput_code:nnn { begindocument / before } { sblarticle }
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
\tl_new:N \g__sblarticle_course_tl
\tl_new:N \g__sblarticle_institution_tl
\tl_new:N \g__sblarticle_professor_tl
\cs_new_protected:Npn \course #1
  {
    \tl_gset:Nn \g__sblarticle_course_tl { #1 }
  }
\cs_new_protected:Npn \institution #1
  {
    \tl_gset:Nn \g__sblarticle_institution_tl { #1 }
  }
\cs_new_protected:Npn \professor #1
  {
    \tl_gset:Nn \g__sblarticle_professor_tl { #1 }
  }
\author { [Your ~ Name] }
\title { Title ~ of ~ Paper }
\tl_gset:Nn \g__sblarticle_course_tl { [Course ~ Number ~ and ~ Title] }
\tl_gset:Nn \g__sblarticle_institution_tl { [Name ~ of ~ Institution] }
\tl_gset:Nn \g__sblarticle_professor_tl { [Name ~ of ~ Professor] }
\cs_set_protected:Npn \maketitle
  {
    \newgeometry { top=2in, bottom=2in }
    \pagenumbering { roman }
    \thispagestyle { empty }
    \group_begin:
      \singlespacing
      \centering
      \text_uppercase:n { \g__sblarticle_institution_tl } \para_end:
      \vfill
      \doublespacing
      \text_uppercase:n { \@title } \para_end:
      \vfill
      \singlespacing
      \text_uppercase:n
        { Submitted ~ to ~ \g__sblarticle_professor_tl } \para_end:
      \text_uppercase:n { in ~ Partial ~ Fulfilment ~ of } \para_end:
      \text_uppercase:n { \g__sblarticle_course_tl } \para_end:
      \vfill
      \text_uppercase:n { By } \para_end:
      \text_uppercase:n { \@author } \para_end:
      \text_uppercase:n { \@date } \para_end:
    \group_end:
    \restoregeometry
  }
\cs_set_eq:Nc \__sblarticle_orig_protected_end:n { end~ }
\cs_new_nopar:Nn \__sblarticle_abstract_protected_end:n
  {
    \__sblarticle_orig_protected_end:n { #1 }
    \tl_if_eq:nnT { #1 } { abstract }
      {
        \cs_gset_eq:cN { end~ } \__sblarticle_orig_protected_end:n
        \peek_remove_spaces:n
          {
            \peek_analysis_map_inline:n
              {
                \exp_args:No \token_if_eq_meaning:NNF { ##1 } \para_end:
                  {
                    \peek_analysis_map_break:n
                      {
                        \exp_after:wN
                        \__sblarticle_frontmatter_peek:
                        ##1
                      }
                  }
                ##1
              }
          }
      }
  }
\renewenvironment { abstract }
  {
    \part* { \abstractname }
    \addcontentsline { toc } { part } { \abstractname }
    \cs_gset_eq:cN { end~ } \__sblarticle_abstract_protected_end:n
  }
  {
    \par
    \clearpage
    \pagestyle { fancy }
  }
\int_set:Nn \c@secnumdepth { -1 }
\cs_set_nopar:Npn \thepart
  {
    \@arabic \c@part
  }
\cs_new_nopar:Nn \__sblarticle_before_head_correction:
  {
    \hook_gclear_next_code:n { para / before }
  }
\cs_new_nopar:Nn \__sblarticle_after_head_correction:
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
        \__sblarticle_before_head_correction:
        \hook_gput_next_code:nn { para / after }
          { \__sblarticle_after_head_correction: }
        \@startsection { section } { 1 } { 0pt } { -37pt } { 1sp }
          { \singlespacing \normalfont \normalsize \bfseries \centering }
      }
    \cs_set:Npn \subsection
      {
        \hook_gput_next_code:nn { para / end }
          { \dim_zero:N \hangindent }
        \__sblarticle_before_head_correction:
        \hook_gput_next_code:nn { para / after }
          { \__sblarticle_after_head_correction: }
        \@startsection { subsection } { 2 } { 0pt } { -37pt } { 1sp }
          { \singlespacing \normalfont \normalsize \centering }
      }
    \cs_set:Npn \subsubsection
      {
        \__sblarticle_before_head_correction:
        \hook_gput_next_code:nn { para / after }
          { \__sblarticle_after_head_correction: }
        \@startsection { subsubsection } { 3 } { 0pt } { -37pt } { 1sp }
          { \singlespacing \normalfont \normalsize \bfseries \itshape }
      }
    \cs_set:Npn \paragraph
      {
        \__sblarticle_before_head_correction:
        \@startsection { paragraph } { 4 } { 0pt } { -37pt } { 1sp }
          { \singlespacing \normalfont \normalsize }
      }
    \cs_set:Npn \subparagraph
      {
        \@startsection { subparagraph } { 5 } { 0pt } { -37pt } { -1em }
          { \normalfont \normalsize \bfseries }
      }
    \hook_gput_code:nnn { cmd / part / before } { sblarticle }
      {
        \clearpage
        \mode_leave_vertical:
        \par
        \thispagestyle { plain }
      }
    \cs_set_nopar:Npn \@part [#1]#2
      {
        \addvspace { 37pt }
        \int_compare:nNnTF { \c@secnumdepth } > { -1 }
          {
            \refstepcounter { part }
            \addcontentsline { toc } { part }
              { \chaptername \space \thepart : \enspace #1 }
          }
          {
            \addcontentsline { toc } { part } {#1}
          }
        \group_begin:
          \dim_zero:N \parindent
          \centering
          \interlinepenalty 10000
          \normalfont
          \int_compare:nNnT { \c@secnumdepth } > { -1 }
            {
              \MakeUppercase { \chaptername } \nobreakspace \thepart
              \par
              \nobreak
            }
          \singlespacing
          \MakeUppercase {#2}
          \hook_gput_next_code:nn { para / after }
            { \__sblarticle_after_head_correction: }
          \markboth { } { }
          \par
        \group_end:
        \nobreak
        \skip_vertical:n { 39pt }
        \@afterheading
      }
    \cs_set_nopar:Npn  \@spart #1
      {
        \addvspace { 37pt }
        \group_begin:
          \dim_zero:N \parindent
          \centering
          \interlinepenalty 10000
          \normalfont
          \singlespacing
          \MakeUppercase {#1}
          \hook_gput_next_code:nn { para / after }
            { \__sblarticle_after_head_correction: }
          \par
        \group_end:
        \nobreak
        \skip_vertical:n { 39pt }
        \@afterheading
      }
  }
  {
    \RequirePackage [ newparttoc ] { titlesec }
    \providecommand \phantomsection { }
    \titleclass { \part } [ 0 ] { top }
    \titlespacing* { \part }          { 0pt } { 41pt } { 37pt }
    \titlespacing* { \section }       { 0pt } { 37pt } { 0pt }
    \titlespacing* { \subsection }    { 0pt } { 37pt } { 0pt }
    \titlespacing* { \subsubsection } { 0pt } { 37pt } { 0pt }
    \titlespacing* { \paragraph }     { 0pt } { 37pt } { 0pt }
    \titlespacing* { \subparagraph }  { 0pt } { 37pt } { 1em }
    \titleformat
      { \part }
      [ display ]
      { \normalfont \normalsize \singlespacing \filcenter }
      {
        \MakeUppercase { \chaptername } \space \thepart
      }
      { 12pt }
      { \MakeUppercase }
      [ \__sblarticle_after_head_correction: ]
    \titleformat
      { \section }
      [ block ]
      {
        \__sblarticle_before_head_correction:
        \normalfont \normalsize \singlespacing \bfseries \filcenter
      }
      { \thesection }
      { 0.5em }
      { }
      [ \__sblarticle_after_head_correction: ]
    \titleformat
      { \subsection }
      [ block ]
      {
        \__sblarticle_before_head_correction:
        \normalfont \normalsize \singlespacing \filcenter
      }
      { \thesubsection }
      { 0.5em }
      { }
      [ \__sblarticle_after_head_correction: ]
    \titleformat
      { \subsubsection }
      [ block ]
      {
        \__sblarticle_before_head_correction:
        \normalfont \normalsize \singlespacing \bfseries \itshape \filright
      }
      { \thesubsubsection }
      { 0.5em }
      { }
      [ \__sblarticle_after_head_correction: ]
    \titleformat
      { \paragraph }
      [ block ]
      {
        \__sblarticle_before_head_correction:
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
\cs_set:Npn \tableofcontents
  {
    \part* { \contentsname }
    \@mkboth
      { \contentsname }
      { \contentsname }
    \@starttoc { toc }
    \clearpage
    \__sblarticle_frontmatter_peek:
  }
\cs_set:Npn \listoffigures
  {
    \part* { \listfigurename }
    \addcontentsline { toc } { part } { \listfigurename }
    \@mkboth
      { \listfigurename }
      { \listfigurename }
    \@starttoc { lof }
    \clearpage
    \__sblarticle_frontmatter_peek:
  }
\cs_set:Npn \listoftables
  {
    \part* { \listtablename }
    \addcontentsline { toc } { part } { \listtablename }
    \@mkboth
      { \listfigurename }
      { \listfigurename }
    \@starttoc { lot }
    \clearpage
    \__sblarticle_frontmatter_peek:
  }
\IfDocumentMetadataTF
  {
    \text_declare_expand_equivalent:Nn \numberline
      {
        \exp_not:n { \numberline }
      }
    \hook_gput_code:nnn { cmd / @dottedtocline / before }
      { sblarticle }
      {
        \addvspace { \baselineskip }
      }
    \hook_gput_code_with_args:nnn { contentsline / text / after }
      { sblarticle }
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
    \cs_set_nopar:cpn { contentsline@text@-1@format }
      { \MakeUppercase }
    \cs_set_nopar:Npn \numberline #1
      {
        \hook_use:nnw { contentsline / number / before } { 1 } {#1}
        #1 \enspace
        \hook_use:nnw { contentsline / number / after } { 1 } {#1}
      }
    \cs_set_nopar:Npn \l@part
      {
        \@dottedtocline { -1 } { 0em } { 0em }
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
    \cs_set_eq:NN \l@table \@figure
  }
  {
    \RequirePackage { titletoc }
    \cs_new_protected:Nn \__sblarticle_hyperlink:nn
      {
        \cs_if_exist_use:NTF \hyperlink
          { { #1 } { #2 } }
          { #2 }
      }
    \titlecontents { figure }
      [ 2em ]
      { \singlespacing \filright }
      {
        \__sblarticle_hyperlink:nn
          { \Hy@tocdestname }
          { \makebox [ 2em ] [ l ] { \thecontentslabel . \enspace } }
      }
      { }
      { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
    \titlecontents { table }
      [ 2em ]
      { \singlespacing \filright }
      {
        \__sblarticle_hyperlink:nn
          { \Hy@tocdestname }
          { \makebox [ 2em ] [ l ] { \thecontentslabel . \enspace } }
      }
      { }
      { \hspace { 0.5em } \titlerule* [ 0.5pc ] { . } \contentspage }
    \titlecontents { part }
      [ 0pt ]
      { \singlespacing \filright }
      {
        \__sblarticle_hyperlink:nn
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
\cs_set_eq:NN \sblarticle@hyperlink \__sblarticle_hyperlink:nn
\newcounter { sblarticle@appendix@count }
\cs_new_protected:Nn \__sblarticle_set_up_appendices:
  {
    \cs_set_eq:NN \section \part
    \int_set:Nn \c@secnumdepth { \c_one_int }
    \cs_set_nopar:Npn \chaptername { \appendixname }
    \addtocontents { toc } { \def \protect \chaptername { \appendixname } }
    \int_compare:nNnT { \c@sblarticle@appendix@count } = { \c_one_int }
      {
        \int_zero:N \c@sblarticle@appendix@count
      }
    \IfDocumentMetadataTF
      {
        \cs_set_nopar:Npn \@part [##1]##2
          {
            \addvspace { 37pt }
            \stepcounter { sblarticle@appendix@count }
            \int_compare:nNnTF { \c@secnumdepth } > { -1 }
              {
                \refstepcounter { part }
                \protected@write \@auxout
                  { }
                  {
                    \string \setcounter
                      { sblarticle@appendix@count } { \the \c@part }
                  }
                \addcontentsline { toc } { part }
                  {
                    \chaptername
                    \ifnum \c@sblarticle@appendix@count > 1
                      \space \thechapter
                    \fi
                    : \enspace ##1
                  }
              }
              {
                \addcontentsline { toc } { part } {##1}
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
                    { \c@sblarticle@appendix@count } > { \c_one_int }
                    {
                       \nobreakspace \thechapter
                    }
                  \par
                  \nobreak
                }
              \singlespacing
              \MakeUppercase {##2}
              \hook_gput_next_code:nn { para / after }
                { \__sblarticle_after_head_correction: }
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
          { \part }
          [ display ]
          {
            \stepcounter { sblarticle@appendix@count }
            \protected@write \@auxout
              { }
              {
                \string \setcounter
                  { sblarticle@appendix@count } { \the \c@part }
              }
            \singlespacing \normalfont \normalsize \filcenter
          }
          {
            \MakeUppercase { \chaptername }
            \ifnum \c@sblarticle@appendix@count > 1
              \strut \space \thepart
            \fi
          }
          { 12pt }
          { \MakeUppercase }
        \titlecontents { part }
          [ 0pt ]
          { \singlespacing \filright }
          {
            \sblarticle@hyperlink
              { \Hy@tocdestname }
              {
                \MakeUppercase { \chaptername }
                \ifnum \c@sblarticle@appendix@count > 1
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
  { sblarticle }
  { \__sblarticle_set_up_appendices: }
\DefineBibliographyStrings { english }
  {
    shorthands = { List~of~Abbreviations }
  }
\cs_set_nopar:Npn \bibsetup { \singlespacing }
\dim_set:Nn \bibhang { 0.5in }
\dim_set:Nn \bibitemsep { 12pt }
\dim_set:Nn \biblabelsep { 0.5in }
\defbibheading { bibliography } [ \bibname ]
  {
    \part* {#1}
  }
\defbibheading { bibintoc } [ \bibname ]
  {
    \part* {#1}
    \addcontentsline { toc } { part } {#1}
  }
\defbibheading { biblist } [ \biblistname ]
  {
    \part* {#1}
  }
\defbibheading { biblistintoc } [ \biblistname ]
  {
    \part* {#1}
    \addcontentsline { toc } { part } {#1}
  }
\cs_new:Npn \sblarticle@printbiblist@frontmatter@peek
  {
    \__sblarticle_if_page_numbering:nT { roman }
      {
        \__sblarticle_frontmatter_peek:
      }
  }
\ExplSyntaxOff
\expandafter\apptocmd\csname\string\printbiblist\endcsname
  {\sblarticle@printbiblist@frontmatter@peek}
  {}
  {}
\ExplSyntaxOn
\prg_new_conditional:Npnn \__sblarticle_if_page_numbering:n #1 { T }
  {
    \cs_set_nopar:Nn \__sblarticle_thepage_test:
      { \csname @ #1 \endcsname \c@page }
    \if_meaning:w \thepage \__sblarticle_thepage_test:
      \prg_return_true:
    \else:
      \prg_return_false:
    \fi:
  }
\cs_new_protected:Nn \__sblarticle_frontmatter_peek:
  {
    \peek_analysis_map_inline:n
      {
        \int_compare:nNnTF {##2} = { -1 }
          {
            \exp_args:No \token_if_eq_meaning:NNF {##1} \par
              {
                \bool_case:nTF
                  {
                    {
                      \exp_args:No \token_if_eq_meaning_p:NN
                        {##1} \begin
                    }
                      { }
                    {
                      \exp_args:No \token_if_eq_meaning_p:NN
                        {##1} \tableofcontents
                    }
                      { }
                    {
                      \exp_args:No \token_if_eq_meaning_p:NN
                        {##1} \listoffigures
                    }
                      { }
                    {
                      \exp_args:No \token_if_eq_meaning_p:NN
                        {##1} \listoftables
                    }
                      { }
                    {
                      \exp_args:No \token_if_eq_meaning_p:NN
                        {##1} \printbiblist
                    }
                      { }
                  }
                  { \peek_analysis_map_break:n {##1} }
                  {
                    \peek_analysis_map_break:n
                      {
                        \part { \@title }
                        \pagenumbering { arabic }
                        ##1
                      }
                  }
              }
          }
          {
            \exp_args:No \token_if_space:NF {##1}
              {
                \peek_analysis_map_break:n
                  {
                    \part { \@title }
                    \pagenumbering { arabic }
                    ##1
                  }
              }
          }
      }
  }
\hook_gput_code:nnn
  { begindocument / before }
  { sblarticle }
  {
    \g@addto@macro \maketitle { \__sblarticle_frontmatter_peek: }
  }
%% 
%%
%% End of file `sblarticle.cls'.
