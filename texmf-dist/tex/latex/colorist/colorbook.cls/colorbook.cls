%%
%% This is file `colorist/colorbook.cls',
%% generated with the docstrip utility.
%%
%% Copyright (C) 2021-2025 by Jinwen XU
%% 
%% This is part of the colorist class series.
%% 
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, either version 1.3c of this license or (at
%% your option) any later version. The latest version of this license is in
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesExplClass
  {colorbook}
  {2025/10/21} {}
  {A colorful book style}

\tl_const:Nn \l__colorclass_base_class_tl { book }


\bool_new:N \l__colorclass_load_custom_font_file_bool
\bool_set_false:N \l__colorclass_load_custom_font_file_bool


\keys_define:nn { colorclass }
  {
    , draft                   .bool_set:N         = \l__colorclass_fast_bool
    , draft                   .initial:n          = { false }
    , fast                    .bool_set:N         = \l__colorclass_fast_bool

    , print                   .bool_set:N         = \l__colorclass_print_mode_bool
    , print                   .initial:n          = { false }
    , print mode              .bool_set:N         = \l__colorclass_print_mode_bool
    , print~mode              .bool_set:N         = \l__colorclass_print_mode_bool
    , print-mode              .bool_set:N         = \l__colorclass_print_mode_bool
    , print version           .bool_set:N         = \l__colorclass_print_mode_bool
    , print~version           .bool_set:N         = \l__colorclass_print_mode_bool
    , print-version           .bool_set:N         = \l__colorclass_print_mode_bool


    , load custom font file   .code:n             = {
                                                      \bool_set_true:N \l__colorclass_load_custom_font_file_bool
                                                      \str_set:Nn \l__colorclass_custom_font_file_str { #1 }
                                                    }
    , load custom font file   .default:n          = { colorist.font }
    , load~custom~font~file   .meta:n             = { load custom font file = { #1 } }
    , load~custom~font~file   .default:n          = { colorist.font }
    , load-custom-font-file   .meta:n             = { load custom font file = { #1 } }
    , load-custom-font-file   .default:n          = { colorist.font }


    , a4paper                 .bool_set:N         = \l__colorclass_a_four_paper_bool
    , a4paper                 .initial:n          = { false }
    , b5paper                 .bool_set:N         = \l__colorclass_b_five_paper_bool
    , b5paper                 .initial:n          = { false }

    , oneside                 .code:n             = { \PassOptionsToClass { \CurrentOption } { \l__colorclass_base_class_tl } }
    , twoside                 .code:n             = { \PassOptionsToClass { \CurrentOption } { \l__colorclass_base_class_tl } }

    , 11pt                    .code:n             = { \PassOptionsToClass { \CurrentOption } { \l__colorclass_base_class_tl } }
    , 12pt                    .code:n             = { \PassOptionsToClass { \CurrentOption } { \l__colorclass_base_class_tl } }

    , unknown                 .code:n             = {
                                                      \PassOptionsToPackage { \CurrentOption } { colorist }
                                                    }
  }
\ProcessKeyOptions [ colorclass ]

\LoadClass{\l__colorclass_base_class_tl}

\NewDocumentCommand \IfPrintModeTF { m m }
  {
    \bool_if:NTF \l__colorclass_print_mode_bool { #1 } { #2 }
  }
\NewDocumentCommand \IfPrintModeT { m }
  {
    \bool_if:NT \l__colorclass_print_mode_bool { #1 }
  }
\NewDocumentCommand \IfPrintModeF { m }
  {
    \bool_if:NF \l__colorclass_print_mode_bool { #1 }
  }

%%================================
%%  Page layout
%%================================
\RequirePackage { silence }
\WarningFilter { geometry } { Over-specification }

\PassOptionsToPackage { heightrounded } { geometry }
\RequirePackage { geometry }

\geometry
  {
    papersize = { 8.5in, 11in },
    total = { 6.500in, 9.130in },
    centering,
    footnotesep = 2em plus 2pt minus 2pt,
    footskip = .5in,
  }

\bool_if:NT \l__colorclass_b_five_paper_bool
  {
    \geometry
      {
        b5paper,
        total = { 5.535in, 8.160in },
        centering,
        footnotesep = 2em plus 2pt minus 2pt,
        footskip = .5in,
      }
  }

\bool_if:NT \l__colorclass_a_four_paper_bool
  {
    \geometry
      {
        a4paper,
        total = { 6.500in, 9.685in },
        centering,
        footnotesep = 2em plus 2pt minus 2pt,
        footskip = .5in,
      }
  }

\bool_if:NT \l__colorclass_fast_bool
  {
    \PassOptionsToPackage { fast } { colorist }
    \RequirePackage { draftwatermark }
    \DraftwatermarkOptions { text = { \normalfont DRAFT }, color = paper!97!-paper }
  }

\RequirePackage { indentfirst }

\RequirePackage { colorist }


%%================================
%%  Fonts
%%================================
\WarningFilter { latexfont } { Font~shape }
\WarningFilter { latexfont } { Some~font  }

\hook_gput_code:nnn { begindocument/before } { colorclass }
  {
    \IfPackageLoadedTF { biblatex }
      {
        \PassOptionsToPackage { biblatex } { embrac }
      } {}
    \RequirePackage { embrac }
  }

\cs_new_protected:Nn \__colorclass_load_file_or_config:Nnn
  {
    \bool_if:NT #1
      {
        \exp_args:Nx \file_if_exist:nT { #2 }
          {
            \exp_args:Nx \file_input:n { #2 }
            \use_none:nn
          }
      }
    \use:n { #3 }
  }


\__colorclass_load_file_or_config:Nnn \l__colorclass_load_custom_font_file_bool { \l__colorclass_custom_font_file_str }
  {
    \RequirePackage { projlib-font }

    \bool_if:NF \g_projlib_font_already_set_bool
      {
        \RequirePackage { mathpazo }
        \RequirePackage { newpxtext }
        \bool_if:NT \l__projlib_font_useosf_bool { \useosf }
        \RequirePackage { amssymb }
        \sys_if_engine_pdftex:F
          {
            \setsansfont { texgyreheros }
              [
                Extension      = .otf ,
                Scale          = MatchUppercase ,
                UprightFont    = *-regular ,
                BoldFont       = *-bold ,
                ItalicFont     = *-italic ,
                BoldItalicFont = *-bolditalic ,
              ]
          }
        % Adjusting the kerning of 'embrac' for 'newpxtext'
        \hook_gput_code:nnn { begindocument/before } { colorclass }
          {
            \RenewEmph{[}{]}
            \RenewEmph{(}{)}
          }
      }
  }


%%================================
%%  Graphics
%%================================
\RequirePackage { graphicx }
\graphicspath { { images/ } }
\RequirePackage { wrapfig2 }
\RequirePackage { float }
\RequirePackage { caption }
\captionsetup { font = small }

%%================================
%%  Icing on the cake
%%================================
\bool_if:NT \l__colorclass_fast_bool { \endinput }

\sys_if_engine_luatex:TF
  {
    \RequirePackage { lua-widow-control }
    \lwcsetup { balanced }
  }
  {
    \PassOptionsToPackage { all } { nowidow }
    \RequirePackage { nowidow }
  }

\sys_if_engine_xetex:T
  {
    \RequirePackage { regexpatch }
    \skip_new:N \g_colorclass_parfillskip_skip
    \xpatchcmd{\@trivlist}{\@flushglue}{\g_colorclass_parfillskip_skip}{}{}
    \hook_gput_code:nnn { begindocument } { colorclass }
      {
        \skip_gset:Nn \g_colorclass_parfillskip_skip { 0pt plus \dim_eval:n { \linewidth - 3em } }
        \skip_gset_eq:NN \parfillskip \g_colorclass_parfillskip_skip
      }
  }

\endinput
%%
%% End of file `colorist/colorbook.cls'.
