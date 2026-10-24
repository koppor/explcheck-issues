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
\ProvidesExplClass{sblarticle}{2026-07-22}{1.1}
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
    \cs_set_protected:Npn \@makefntext #1
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
    \EditInstance { blockenv } { quotation }
      {
        , final-code = \singlespacing
                       \vspace* { -5pt }
                       \ignorespaces
      }
    \EditInstance { block } { quotation-1 }
      {
        , begin-extra-vspace = 0pt
        , begin-vspace       = 0pt
        , left-margin        = 0.5in
        , right-margin       = 0pt
        , para-indent        = 0.5in
        , para-vspace        = 0pt
      }
    \EditInstance { blockenv } { quote }
      {
        , final-code = \singlespacing
                       \vspace* { -5pt }
                       \ignorespaces
      }
    \EditInstance { block } { quote-1 }
      {
        , begin-extra-vspace = 0pt
        , begin-vspace       = 0pt
        , left-margin        = 0.5in
        , right-margin       = 0pt
        , para-indent        = 0pt
        , para-vspace        = 7pt
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
\NewTaggingSocket{ sblarticle / flatblock / begin } { 1 }
\NewTaggingSocket{ sblarticle / flatblock / end } { 0 }
\NewTaggingSocketPlug { sblarticle / flatblock / begin } { default }
  {
    \tag_struct_begin:n
      {
        tag = #1
      }
    \tagpdfsetup { para / flattened = true }
  }
\NewTaggingSocketPlug { sblarticle / flatblock / end } { default }
  {
    \para_end:
    \tag_struct_end:
  }
\AssignTaggingSocketPlug { sblarticle / flatblock / begin } { default }
\AssignTaggingSocketPlug { sblarticle / flatblock / end } { default }
\cs_set_protected:Npn \maketitle
  {
    \newgeometry { top=2in, bottom=2in }
    \pagenumbering { roman }
    \thispagestyle { empty }
    \group_begin:
      \UseTaggingSocket { sblarticle / flatblock / begin }
        { \UseStructureName { title / block } }
      \singlespacing
      \centering
      \MakeUppercase { \g__sblarticle_institution_tl } \para_end:
      \vfill
      \doublespacing
      \IfDocumentMetadataTF
        {
          \UseTaggingSocket { title } { } { \MakeUppercase { \@title } }
        }
        {
          \MakeUppercase { \@title }
        }
      \para_end:
      \vfill
      \singlespacing
      \MakeUppercase
        { Submitted ~ to ~ \g__sblarticle_professor_tl } \para_end:
      \MakeUppercase { in ~ Partial ~ Fulfilment ~ of } \para_end:
      \MakeUppercase { \g__sblarticle_course_tl } \para_end:
      \vfill
      \MakeUppercase { By } \para_end:
      \MakeUppercase { \@author } \para_end:
      \MakeUppercase { \@date } \para_end:
      \UseTaggingSocket { sblarticle / flatblock / end }
    \group_end:
    \restoregeometry
  }
\cs_set_eq:Nc \__sblarticle_orig_protected_end:n { end~ }
\cs_new_protected_nopar:Nn \__sblarticle_abstract_protected_end:n
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
\int_set:Nn \c@secnumdepth { -2 }
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
    \EditInstance { heading } { part }
      {
        , placement            = top
        , after-penalty-vspace = 41pt
        , after-vspace         = 37pt
        , number-format        =
        , prefix               =
        , heading-decls        = \singlespacing
                                 \normalfont \normalsize
                                 \centering
        , title-decls          =
      }
    \EditInstance { headformat } { part }
      {
        , title-format = \MakeUppercase {#1}
        , number-title-sep = 12pt
      }
    \DeclareDocumentCommand \part { s = { shorttitle } o m }
      {
        \bool_if:nTF {#1}
          {
            \ParseLaTeXeHeading { part } {#1} {#2} {#3}
          }
          {
            \tl_if_novalue:nTF {#2}
              {
                \ParseLaTeXeHeading { part } { \c_true_bool }
                  { shorttitle = {#3} } {#3}
              }
              {
                \ParseLaTeXeHeading { part } { \c_true_bool }
                  {#2} {#3}
              }
          }
        \__sblarticle_after_head_correction:
      }
    \EditInstance { heading } { section }
      {
        , before-vspace = 37pt
        , after-vspace  = 0pt
        , heading-decls = \singlespacing
                          \normalfont \normalsize \bfseries
                          \centering
      }
    \EditInstance { heading } { subsection }
      {
        , before-vspace = 37pt
        , after-vspace  = 0pt
        , heading-decls = \singlespacing
                          \normalfont \normalsize
                          \centering
      }
    \EditInstance { heading } { subsubsection }
      {
        , before-vspace = 37pt
        , after-vspace  = 0pt
        , heading-decls = \singlespacing
                          \normalfont \normalsize \bfseries \itshape
      }
    \DeclareInstance { heading } { paragraph } { display }
      {
        , name                = paragraph
        , parent-name         = subsubsection
        , level               = 4
        , before-vspace       = 37pt
        , after-vspace        = 0pt
        , heading-decls       = \singlespacing
                                \normalfont \normalsize
        , mark-cmd            = \paragraphmark {#1}
        , headformat-instance = paragraph
      }
    \DeclareInstanceCopy { headformat } { paragraph } { std }
    \EditInstance { heading } { subparagraph }
      {
        , before-vspace = 37pt
        , after-vspace  = 1em
        , heading-decls = \normalfont \normalsize \bfseries
      }
    \EditInstance { headformat } { subparagraph }
      {
        , heading-indent = 0pt
      }
    \hook_gput_code:nnn { cmd / section / before } { sblarticle }
      { \__sblarticle_before_head_correction: }
    \hook_gput_code:nnn { cmd / subsection / before } { sblarticle }
      { \__sblarticle_before_head_correction: }
    \hook_gput_code:nnn { cmd / subsubsection / before } { sblarticle }
      { \__sblarticle_before_head_correction: }
    \hook_gput_code:nnn { cmd / paragraph / before } { sblarticle }
      { \__sblarticle_before_head_correction: }
    \hook_gput_code:nnn { cmd / section / after } { sblarticle }
      { \__sblarticle_after_head_correction: }
    \hook_gput_code:nnn { cmd / subsection / after } { sblarticle }
      { \__sblarticle_after_head_correction: }
    \hook_gput_code:nnn { cmd / subsubsection / after } { sblarticle }
      { \__sblarticle_after_head_correction: }
  }
  {
    \RequirePackage [ newparttoc ] { titlesec }
    \titleclass { \part } [ 0 ] { top }
    \titlespacing* { \part }          { 0pt } { 41pt } { 37pt }
    \titlespacing* { \section }       { 0pt } { 37pt } { 0pt }
    \titlespacing* { \subsection }    { 0pt } { 37pt } { 0pt }
    \titlespacing* { \subsubsection } { 0pt } { 37pt } { 0pt }
    \titlespacing* { \paragraph }     { 0pt } { 37pt } { 0pt }
    \titlespacing* { \subparagraph }  { 0pt } { 37pt } { 1em }
    \titleformat
      { \part }
      [ block ]
      {
        \cs_if_exist_use:N \phantomsection
        \normalfont \normalsize \singlespacing \filcenter
      }
      { }
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
      { 1em }
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
      { 1em }
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
      { 1em }
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
      { 1em }
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
\IfDocumentMetadataT
  {
    \hook_gput_code:nnn { cmd / @starttoc / before } { sblarticle }
      {
        \hook_gput_next_code:nn { cmd / @input / before }
          { \singlespacing }
      }
  }
\cs_set_protected:Npn \tableofcontents
  {
    \part* { \contentsname }
    \@mkboth
      { \contentsname }
      { \contentsname }
    \@starttoc { toc }
    \clearpage
    \__sblarticle_frontmatter_peek:
  }
\cs_set_protected:Npn \listoffigures
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
\cs_set_protected:Npn \listoftables
  {
    \part* { \listtablename }
    \addcontentsline { toc } { part } { \listtablename }
    \@mkboth
      { \listtablename }
      { \listtablename }
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
        \addvspace { 14.5pt }
      }
    \hook_gput_code_with_args:nnn { contentsline / text / after }
      { sblarticle }
      {
        \int_compare:nNnT {#1} > { -1 }
          {
            \cs_set_nopar:Npn \leaders ##1 ##2 { }
          }
      }
    \cs_set_nopar:cpn { contentsline@text@-1@format }
      { \MakeUppercase }
    \socket_new:nn { sblarticle / numberline } { 1 }
    \socket_new_plug:nnn { sblarticle / numberline }
      { default }
      {
        \hook_use:nnw { contentsline / number / before } { 1 } {#1}
        #1 \skip_horizontal:n { 1em }
        \hook_use:nnw { contentsline / number / after } { 1 } {#1}
      }
    \socket_new_plug:nnn { sblarticle / numberline }
      { part }
      {
        \hook_use:nnw { contentsline / number / before } { 1 } {#1}
        \int_compare:nNnT { \sblarticle@appendices } = { 1 }
          {
            \MakeUppercase { \appendixname }
            \int_compare:nNnT { \sblarticle@appendix@state } > { 1 }
              {
                \skip_horizontal:n
                  {
                    \InstanceValue { headformat } { part } { prefix-number-sep }
                  }
                #1
              }
            : \enspace
          }
        \hook_use:nnw { contentsline / number / after } { 1 } {#1}
      }
    \socket_assign_plug:nn
      { sblarticle / numberline } { default }
    \cs_set_nopar:Npn \numberline #1
      {
        \socket_use:n { sblarticle / numberline } {#1}
      }
    \cs_set_nopar:Npn \l@part
      {
        \socket_assign_plug:nn { sblarticle / numberline } { part }
        \@dottedtocline { -1 } { 0em } { 0em }
      }
    \cs_set_nopar:Npn \l@section
      {
        \socket_assign_plug:nn { sblarticle / numberline } { default }
        \@dottedtocline { 1 } { 1em } { 0em }
      }
    \cs_set_nopar:Npn \l@subsection
      {
        \socket_assign_plug:nn { sblarticle / numberline } { default }
        \@dottedtocline { 2 } { 2em } { 0em }
      }
    \cs_set_nopar:Npn \l@subsubsection
      {
        \socket_assign_plug:nn { sblarticle / numberline } { default }
        \@dottedtocline { 3 } { 3em } { 0em }
      }
    \cs_set_nopar:Npn \l@paragraph
      {
        \socket_assign_plug:nn { sblarticle / numberline } { default }
        \@dottedtocline { 4 } { 4em } { 0em }
      }
    \cs_set_nopar:Npn \l@subparagraph
      {
        \socket_assign_plug:nn { sblarticle / numberline } { default }
        \@dottedtocline { 5 } { 5em } { 0em }
      }
    \cs_set_nopar:Npn \l@figure
      {
        \socket_assign_plug:nn { sblarticle / numberline } { default }
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
      { \hspace { 0.5em } \titlerule* [ 0.65pc ] { . } \contentspage }
    \titlecontents { table }
      [ 2em ]
      { \singlespacing \filright }
      {
        \__sblarticle_hyperlink:nn
          { \Hy@tocdestname }
          { \makebox [ 2em ] [ l ] { \thecontentslabel . \enspace } }
      }
      { }
      { \hspace { 0.5em } \titlerule* [ 0.65pc ] { . } \contentspage }
    \titlecontents { part }
      [ 0pt ]
      { \singlespacing \filright }
      { \MakeUppercase }
      { \MakeUppercase }
      { \hspace { 0.5em } \titlerule* [ 0.65pc ] { . } \contentspage }
    \titlecontents { section }
      [ 1em ]
      { \singlespacing \filright }
      {
        \__sblarticle_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
    \titlecontents { subsection }
      [ 2em ]
      { \singlespacing \filright }
      {
        \__sblarticle_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
    \titlecontents { subsubsection }
      [ 3em ]
      { \singlespacing \filright }
      {
        \__sblarticle_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
    \titlecontents { paragraph }
      [ 4em ]
      { \singlespacing \filright }
      {
        \__sblarticle_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
    \titlecontents { subparagraph }
      [ 5em ]
      { \singlespacing \filright }
      {
        \__sblarticle_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
  }
\cs_set_eq:NN \sblarticle@hyperlink \__sblarticle_hyperlink:nn
\int_new:N \sblarticle@appendices
\int_new:N \sblarticle@appendix@state
\hook_gput_code:nnn { enddocument / afterlastpage } { sblarticle }
  {
    \protected@write \@auxout
      { }
      {
        \exp_not:N \global
        \exp_not:N \sblarticle@appendix@state
        \int_use:N \sblarticle@appendix@state
      }
  }
\cs_new_protected:Nn \__sblarticle_set_up_appendices:
  {
    \int_compare:nNnT { \c@secnumdepth } < { \c_zero_int }
      {
        \int_set:Nn \c@secnumdepth { 0 }
      }
    \int_compare:nNnT { \sblarticle@appendix@state } = { 1 }
      { \int_gzero:N \sblarticle@appendix@state }
    \cs_if_exist_use:NT \hypersetup
      {
        {
          target-prefix = { part } { \Hy@appendixstring }
        }
      }
    \cs_set_nopar:Npn \thepart { \arabic { part } }
    \cs_set_nopar:Npn \thesection { \arabic { section } }
    \int_zero:N \c@part
    \IfDocumentMetadataTF
      {
        \addtocontents { toc } { \sblarticle@appendices 1 }
        \cs_new:Nn \__sblarticle_appendix_number_format:n
          {
            \int_compare:nNnT
              { \sblarticle@appendix@state } > { 1 }
              { \theheading }
          }
        \cs_new:Nn \__sblarticle_appendix_prefix_number_sep:
          {
            \int_compare:nNnTF
              { \sblarticle@appendix@state } > { 1 }
              { 0.5em }
              { 0em }
          }
        \EditInstance { heading } { part }
          {
            , after-penalty-vspace = 35.7pt
            , number-format        = \__sblarticle_appendix_number_format:n
            , prefix               = \MakeUppercase { \appendixname }
          }
        \EditInstance { headformat } { part }
          {
            , title-format      = \MakeUppercase {##1}
            , number-title-sep  = 12pt
            , prefix-number-sep = \__sblarticle_appendix_prefix_number_sep:
          }
        \DeclareDocumentCommand \part { s = { shorttitle } o m }
          {
            \bool_if:nF {##1}
              {
                \int_compare:nNnT { \sblarticle@appendix@state } < { 2 }
                  { \int_gincr:N \sblarticle@appendix@state }
              }
            \ParseLaTeXeHeading { part } {##1} {##2} {##3}
            \__sblarticle_after_head_correction:
          }
        \DeclareDocumentCommand \section { s = { shorttitle } o m }
          {
            \bool_if:nF {##1}
              {
                \int_compare:nNnT { \sblarticle@appendix@state } < { 2 }
                  { \int_gincr:N \sblarticle@appendix@state }
              }
            \ParseLaTeXeHeading { part } {##1} {##2} {##3}
            \__sblarticle_after_head_correction:
          }
        \DeclareDocumentCommand \subsection { s = { shorttitle } o m }
          {
            \__sblarticle_before_head_correction:
            \ParseLaTeXeHeading { section } {##1} {##2} {##3}
            \__sblarticle_after_head_correction:
          }
        \DeclareDocumentCommand \subsubsection { s = { shorttitle } o m }
          {
            \__sblarticle_before_head_correction:
            \ParseLaTeXeHeading { subsection } {##1} {##2} {##3}
            \__sblarticle_after_head_correction:
          }
        \DeclareDocumentCommand \paragraph { s = { shorttitle } o m }
          {
            \__sblarticle_before_head_correction:
            \ParseLaTeXeHeading { subsubsection } {##1} {##2} {##3}
            \__sblarticle_after_head_correction:
          }
        \DeclareDocumentCommand \subparagraph { s = { shorttitle } o m }
          {
            \__sblarticle_before_head_correction:
            \ParseLaTeXeHeading { paragraph } {##1} {##2} {##3}
          }
      }
      {
        \titlespacing* { \part } { 0pt } { 35.7pt } { 37pt }
        \cs_set_eq:NN \subparagraph  \paragraph
        \cs_set_eq:NN \paragraph     \subsubsection
        \cs_set_eq:NN \subsubsection \subsection
        \cs_set_eq:NN \subsection    \section
        \cs_set_eq:NN \section       \part
        \titleformat
          { \part }
          [ display ]
          {
            \cs_if_exist_use:N \phantomsection
            \singlespacing \normalfont \normalsize \filcenter
          }
          {
            \int_compare:nNnT { \sblarticle@appendix@state } < { 2 }
              { \int_gincr:N \sblarticle@appendix@state }
            \MakeUppercase { \appendixname }
            \int_compare:nNnT { \sblarticle@appendix@state } > { 1 }
              { \space \thepart }
          }
          { 12pt }
          { \MakeUppercase }
          [ \__sblarticle_after_head_correction: ]
        \titlecontents { part }
          [ 0pt ]
          { \singlespacing \filright }
          {
            \sblarticle@hyperlink
              { \Hy@tocdestname }
              {
                \MakeUppercase { \appendixname }
                \ifnum \sblarticle@appendix@state > 1
                  \strut \space \thecontentslabel
                \fi
                : \enspace
              }
            \MakeUppercase
          }
          { \MakeUppercase }
          { \hspace { 0.5em } \titlerule* [ 0.65pc ] { . } \contentspage }
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
\cs_new_protected:Npn \sblarticle@printbiblist@frontmatter@peek
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
\prg_new_protected_conditional:Npnn \__sblarticle_if_page_numbering:n #1 { T }
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
