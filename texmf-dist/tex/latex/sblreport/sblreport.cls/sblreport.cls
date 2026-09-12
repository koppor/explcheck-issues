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
\ProvidesExplClass{sblreport}{2026-07-22}{1.1}
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
\NewTaggingSocket{ sblreport / flatblock / begin } { 1 }
\NewTaggingSocket{ sblreport / flatblock / end } { 0 }
\NewTaggingSocketPlug { sblreport / flatblock / begin } { default }
  {
    \tag_struct_begin:n
      {
        tag = #1
      }
    \tagpdfsetup { para / flattened = true }
  }
\NewTaggingSocketPlug { sblreport / flatblock / end } { default }
  {
    \para_end:
    \tag_struct_end:
  }
\AssignTaggingSocketPlug { sblreport / flatblock / begin } { default }
\AssignTaggingSocketPlug { sblreport / flatblock / end } { default }
\cs_set_protected:Npn \maketitle
  {
    \newgeometry { top=2in, bottom=2in }
    \pagenumbering { roman }
    \thispagestyle { empty }
    \group_begin:
      \UseTaggingSocket { sblreport / flatblock / begin }
        { \UseStructureName { title / block } }
      \singlespacing
      \centering
      \MakeUppercase { \g__sblreport_institution_tl } \para_end:
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
      \MakeUppercase { Submitted ~ to ~ the ~ Faculty } \para_end:
      \MakeUppercase { in ~ Partial ~ Fulfilment ~ of ~ the } \para_end:
      \MakeUppercase { Requirements ~ for ~ the ~ Degree } \para_end:
      \MakeUppercase { \g__sblreport_degree_tl } \para_end:
      \vfill
      \MakeUppercase { By } \para_end:
      \MakeUppercase { \@author } \para_end:
      \MakeUppercase { \@date } \para_end:
      \UseTaggingSocket { sblreport / flatblock / end }
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
    \UseTaggingSocket { sblreport / flatblock / begin } { text-unit }
  }
  {
    \UseTaggingSocket { sblreport / flatblock / end }
  }
\NewDocumentEnvironment { approvalpage } { }
  {
    \clearpage
    \thispagestyle { empty }
    \UseTaggingSocket { sblreport / flatblock / begin } { text-unit }
  }
  {
    \UseTaggingSocket { sblreport / flatblock / end }
  }
\NewDocumentEnvironment { dedication } { }
  {
    \clearpage
    \thispagestyle { empty }
    \UseTaggingSocket { sblreport / flatblock / begin } { text-unit }
  }
  {
    \UseTaggingSocket { sblreport / flatblock / end }
  }
\NewDocumentEnvironment { epigraph } { }
  {
    \clearpage
    \thispagestyle { empty }
    \UseTaggingSocket { sblreport / flatblock / begin } { text-unit }
  }
  {
    \UseTaggingSocket { sblreport / flatblock / end }
  }
\int_set:Nn \c@secnumdepth { 0 }
\cs_set_nopar:Npn \thepart { \arabic { part } }
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
    \EditInstance { heading } { part }
      {
        , heading-decls        = \singlespacing
                                 \normalfont \normalsize
                                 \centering
        , prefix               = \MakeUppercase { \partname }
        , title-decls          =
        , start-code           = \cleardoublepage
                                 \thispagestyle { empty }
                                 \null \vfil
      }
    \EditInstance { headformat } { part }
      {
        , title-format     = \MakeUppercase {#1}
        , number-title-sep = 12pt
      }
    \DeclareDocumentCommand \part { s = { shorttitle } o m }
      {
        \ParseLaTeXeHeading { part } {#1} {#2} {#3}
      }
    \EditInstance { heading } { chapter }
      {
        , placement            = top
        , after-penalty-vspace = 35.7pt
        , after-vspace         = 37pt
        , prefix               = \MakeUppercase { \chaptername }
        , heading-decls        = \singlespacing
                                 \normalfont \normalsize
                                 \centering
        , title-decls          =
      }
    \EditInstance { headformat } { chapter }
      {
        , title-format     = \MakeUppercase {#1}
        , number-title-sep = 12pt
      }
    \DeclareDocumentCommand \chapter { s = { shorttitle } o m }
      {
        \IfBooleanF {#1}
          {
            \__sblreport_if_page_numbering:nT { roman }
              {
                \cleardoublepage
                \pagenumbering { arabic }
              }
          }
        \ParseLaTeXeHeading { chapter } {#1} {#2} {#3}
        \__sblreport_after_head_correction:
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
    \hook_gput_code:nnn { cmd / section / before } { sblreport }
      { \__sblreport_before_head_correction: }
    \hook_gput_code:nnn { cmd / subsection / before } { sblreport }
      { \__sblreport_before_head_correction: }
    \hook_gput_code:nnn { cmd / subsubsection / before } { sblreport }
      { \__sblreport_before_head_correction: }
    \hook_gput_code:nnn { cmd / paragraph / before } { sblreport }
      { \__sblreport_before_head_correction: }
    \hook_gput_code:nnn { cmd / section / after } { sblreport }
      { \__sblreport_after_head_correction: }
    \hook_gput_code:nnn { cmd / subsection / after } { sblreport }
      { \__sblreport_after_head_correction: }
    \hook_gput_code:nnn { cmd / subsubsection / after } { sblreport }
      { \__sblreport_after_head_correction: }
  }
  {
    \RequirePackage [ newparttoc ] { titlesec }
    \titleclass { \part } { page }
    \assignpagestyle { \part } { empty }
    \titlespacing* { \part }          { 0pt } { 0pt }    { 0pt }
    \titlespacing* { \chapter }       { 0pt } { 35.7pt } { 37pt }
    \titlespacing* { \section }       { 0pt } { 37pt }   { 0pt }
    \titlespacing* { \subsection }    { 0pt } { 37pt }   { 0pt }
    \titlespacing* { \subsubsection } { 0pt } { 37pt }   { 0pt }
    \titlespacing* { \paragraph }     { 0pt } { 37pt }   { 0pt }
    \titlespacing* { \subparagraph }  { 0pt } { 37pt }   { 1em }
    \titleformat
      { \part }
      [ display ]
      {
        \cs_if_exist_use:N \phantomsection
        \vfil \normalfont \normalsize \singlespacing \filcenter
      }
      {
        \MakeUppercase { \partname } \space \thepart
      }
      { 12pt }
      { \MakeUppercase }
      [ \vfil ]
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
      { 1em }
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
      { 1em }
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
      { 1em }
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
    \hook_gput_code:nnn { cmd / @starttoc / before } { sblreport }
      {
        \hook_gput_next_code:nn { cmd / @input / before }
          { \singlespacing }
      }
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
        \addvspace { 14.5pt }
      }
    \hook_gput_code_with_args:nnn { contentsline / text / after }
      { sblreport }
      {
        \int_compare:nNnT {#1} > { \c_zero_int }
          {
            \cs_set_nopar:Npn \leaders ##1 ##2 { }
          }
      }
    \cs_set_nopar:cpn { contentsline@text@0@format }
      { \MakeUppercase }
    \socket_new:nn { sblreport / numberline } { 1 }
    \socket_new_plug:nnn { sblreport / numberline }
      { default }
      {
        \hook_use:nnw { contentsline / number / before } { 1 } {#1}
        #1 \skip_horizontal:n { 1em }
        \hook_use:nnw { contentsline / number / after } { 1 } {#1}
      }
    \socket_new_plug:nnn { sblreport / numberline }
      { chapter }
      {
        \hook_use:nnw { contentsline / number / before } { 1 } {#1}
        \int_compare:nNnTF { \int_use:N \sblreport@appendices } = { 1 }
          {
            \InstanceValue { heading } { chapter } { prefix }
            \int_compare:nNnT { \sblreport@appendix@state } > { 1 }
              {
                \skip_horizontal:n
                  {
                    \InstanceValue
                      { headformat } { chapter } { prefix-number-sep }
                  }
                #1
              }
          }
          {
            \InstanceValue { heading } { chapter } { prefix }
            \skip_horizontal:n
              {
                \InstanceValue { headformat } { chapter } { prefix-number-sep }
              }
            #1
          }
        : \enspace
        \hook_use:nnw { contentsline / number / after } { 1 } {#1}
      }
    \socket_new_plug:nnn { sblreport / numberline }
      { part }
      {
        \hook_use:nnw { contentsline / number / before } { 1 } {#1}
        \InstanceValue { heading } { part } { prefix }
        \skip_horizontal:n
          {
            \InstanceValue { headformat } { part } { prefix-number-sep }
          }
        #1
        : \enspace
        \hook_use:nnw { contentsline / number / after } { 1 } {#1}
      }
    \socket_assign_plug:nn
      { sblreport / numberline } { default }
    \cs_set_nopar:Npn \numberline #1
      {
        \socket_use:n { sblreport / numberline } {#1}
      }
    \cs_set_nopar:cpn { contentsline@text@-1@format }
      { \MakeUppercase }
    \cs_set_nopar:Npn \l@part #1#2
      {
        \socket_assign_plug:nn { sblreport / numberline } { part }
        \addpenalty { -\@highpenalty }
        \addvspace { 14.5pt }
        \group_begin:
          \centering
          \skip_set:Nn \leftskip  { \@pnumwidth plus 1.0fil }
          \skip_set_eq:NN \rightskip \leftskip
          {
            \mode_leave_vertical:
            \hook_use:nnw { contentsline / text / before } { 4 }
              { \toclevel@part }
              {#1}
              {#2}
              { \@contentsline@destination }
            \use:c { contentsline@text@-1@format } {#1}
            \hook_use:nnw { contentsline / text / after } { 4 }
              { \toclevel@part }
              {#1}
              {#2}
              { \@contentsline@destination }
            \hook_use:nnw { contentsline / page / before } { 4 }
              { \toclevel@part }
              {#1}
              {#2}
              { \@contentsline@destination }
            \hook_use:nnw { contentsline / page / after } { 4 }
              { \toclevel@part }
              {#1}
              {#2}
              { \@contentsline@destination }
          }
          \par
          \nobreak
        \group_end:
      }
    \cs_set_nopar:Npn \l@chapter
      {
        \socket_assign_plug:nn { sblreport / numberline } { chapter }
        \@dottedtocline { 0 } { 0em } { 0em }
      }
    \cs_set_nopar:Npn \l@section
      {
        \socket_assign_plug:nn { sblreport / numberline } { default }
        \@dottedtocline { 1 } { 1em } { 0em }
      }
    \cs_set_nopar:Npn \l@subsection
      {
        \socket_assign_plug:nn { sblreport / numberline } { default }
        \@dottedtocline { 2 } { 2em } { 0em }
      }
    \cs_set_nopar:Npn \l@subsubsection
      {
        \socket_assign_plug:nn { sblreport / numberline } { default }
        \@dottedtocline { 3 } { 3em } { 0em }
      }
    \cs_set_nopar:Npn \l@paragraph
      {
        \socket_assign_plug:nn { sblreport / numberline } { default }
        \@dottedtocline { 4 } { 4em } { 0em }
      }
    \cs_set_nopar:Npn \l@subparagraph
      {
        \socket_assign_plug:nn { sblreport / numberline } { default }
        \@dottedtocline { 5 } { 5em } { 0em }
      }
    \cs_set_nopar:Npn \l@figure
      {
        \socket_assign_plug:nn { sblreport / numberline } { default }
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
      { \hspace { 0.5em } \titlerule* [ 0.65pc ] { . } \contentspage }
    \titlecontents { table }
      [ 0pt ]
      { \singlespacing \filright }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          { \makebox [ 2em ] [ r ] { \thecontentslabel . \enspace } }
      }
      { }
      { \hspace { 0.5em } \titlerule* [ 0.65pc ] { . } \contentspage }
    \titlecontents { part }
      [ 0pt ]
      { \singlespacing \filcenter }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          {
            \MakeUppercase { \partname } \space
            \thecontentslabel : \enspace
          }
        \MakeUppercase
      }
      { \MakeUppercase }
      { }
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
      { \hspace { 0.5em } \titlerule* [ 0.65pc ] { . } \contentspage }
    \titlecontents { section }
      [ 1em ]
      { \singlespacing \filright }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
    \titlecontents { subsection }
      [ 2em ]
      { \singlespacing \filright }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
    \titlecontents { subsubsection }
      [ 3em ]
      { \singlespacing \filright }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
    \titlecontents { paragraph }
      [ 4em ]
      { \singlespacing \filright }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
    \titlecontents { subparagraph }
      [ 5em ]
      { \singlespacing \filright }
      {
        \__sblreport_hyperlink:nn
          { \Hy@tocdestname }
          { \thecontentslabel \hspace { 1em } }
      }
      { }
      { \hfill \contentspage }
  }
\cs_set_eq:NN \sblreport@hyperlink \__sblreport_hyperlink:nn
\int_new:N \sblreport@appendices
\int_new:N \sblreport@appendix@state
\hook_gput_code:nnn { enddocument / afterlastpage } { sblreport }
  {
    \protected@write \@auxout
      { }
      {
        \exp_not:N \global
        \exp_not:N \sblreport@appendix@state
        \int_use:N \sblreport@appendix@state
      }
  }
\cs_new_protected:Nn \__sblreport_set_up_appendices:
  {
    \int_compare:nNnT { \sblreport@appendix@state } = { 1 }
      { \int_gzero:N \sblreport@appendix@state }
    \cs_set_nopar:Npn \thechapter { \arabic { chapter } }
    \IfDocumentMetadataTF
      {
        \addtocontents { toc } { \sblreport@appendices 1 }
        \addtocontents { toc }
          { \def \protect \chaptername { \appendixname } }
        \cs_new:Nn \__sblreport_appendix_number_format:n
          {
            \int_compare:nNnT
              { \sblreport@appendix@state } > { 1 }
              { \theheading }
          }
        \cs_new:Nn \__sblreport_appendix_prefix_number_sep:
          {
            \int_compare:nNnTF
              { \sblreport@appendix@state } > { 1 }
              { 0.5em }
              { 0em }
          }
        \EditInstance { heading } { chapter }
          {
            , number-format = \__sblreport_appendix_number_format:n
            , prefix        = \MakeUppercase { \appendixname }
          }
        \EditInstance { headformat } { chapter }
          {
            , prefix-number-sep = \__sblreport_appendix_prefix_number_sep:
          }
        \DeclareDocumentCommand \chapter { s = { shorttitle } o m }
          {
            \bool_if:nF {##1}
              {
                \int_compare:nNnT { \sblreport@appendix@state } < { 2 }
                  { \int_gincr:N \sblreport@appendix@state }
              }
            \ParseLaTeXeHeading { chapter } {##1} {##2} {##3}
            \__sblreport_after_head_correction:
          }
      }
      {
        \titleformat
          { \chapter }
          [ display ]
          {
            \singlespacing \normalfont \normalsize \filcenter
          }
          {
            \int_compare:nNnT { \sblreport@appendix@state } < { 2 }
              { \int_gincr:N \sblreport@appendix@state }
            \MakeUppercase { \appendixname }
            \int_compare:nNnT { \sblreport@appendix@state } > { 1 }
              {
                \space \thechapter
              }
          }
          { 12pt }
          { \MakeUppercase }
          [ \__sblreport_after_head_correction: ]
        \titlecontents { chapter }
          [ 0pt ]
          { \singlespacing \filright }
          {
            \sblreport@hyperlink
              { \Hy@tocdestname }
              {
                \MakeUppercase { \appendixname }
                \ifnum \sblreport@appendix@state > 1
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
\prg_new_protected_conditional:Npnn \__sblreport_if_page_numbering:n #1 { T }
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
