%%
%% This is file `simplivre/simplivre.cls',
%% generated with the docstrip utility.
%%
%% Copyright (C) 2021-2024 by Jinwen XU
%% 
%% This is part of the minimalist class series.
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
  {simplivre}
  {2024/03/01} {}
  {A simple and clear book style}

\tl_const:Nn \l__minimclass_base_class_tl { book }


\bool_new:N \l__minimclass_load_custom_font_file_bool
\bool_set_false:N \l__minimclass_load_custom_font_file_bool

\bool_new:N \l__minimclass_load_custom_font_file_latin_bool
\bool_set_false:N \l__minimclass_load_custom_font_file_latin_bool

\bool_new:N \l__minimclass_load_custom_font_file_cjk_bool
\bool_set_false:N \l__minimclass_load_custom_font_file_cjk_bool

\bool_new:N \l__minimclass_load_custom_font_file_math_bool
\bool_set_false:N \l__minimclass_load_custom_font_file_math_bool

\keys_define:nn { minimclass }
  {
    , draft                   .bool_set:N         = \l__minimclass_fast_bool
    , draft                   .initial:n          = { false }
    , fast                    .bool_set:N         = \l__minimclass_fast_bool

    , print                   .bool_set:N         = \l__minimclass_print_mode_bool
    , print                   .initial:n          = { false }
    , print mode              .bool_set:N         = \l__minimclass_print_mode_bool
    , print~mode              .bool_set:N         = \l__minimclass_print_mode_bool
    , print-mode              .bool_set:N         = \l__minimclass_print_mode_bool
    , print version           .bool_set:N         = \l__minimclass_print_mode_bool
    , print~version           .bool_set:N         = \l__minimclass_print_mode_bool
    , print-version           .bool_set:N         = \l__minimclass_print_mode_bool

    , use indent              .bool_set:N         = \l__minimclass_useindent_bool
    , use indent              .initial:n          = { true }
    , use~indent              .bool_set:N         = \l__minimclass_useindent_bool
    , use-indent              .bool_set:N         = \l__minimclass_useindent_bool

    , load custom font file   .code:n             = {
                                                      \bool_set_true:N \l__minimclass_load_custom_font_file_bool
                                                      \str_set:Nn \l__minimclass_custom_font_file_str { #1 }
                                                      \bool_set_true:N \l__minimclass_load_custom_font_file_latin_bool
                                                      \str_set:Nn \l__minimclass_custom_font_file_latin_str { minimalist.font.latin }
                                                      \bool_set_true:N \l__minimclass_load_custom_font_file_cjk_bool
                                                      \str_set:Nn \l__minimclass_custom_font_file_cjk_str   { minimalist.font.cjk }
                                                      \bool_set_true:N \l__minimclass_load_custom_font_file_math_bool
                                                      \str_set:Nn \l__minimclass_custom_font_file_math_str  { minimalist.font.math }
                                                    }
    , load custom font file   .default:n          = { minimalist.font }
    , load~custom~font~file   .meta:n             = { load custom font file = { #1 } }
    , load~custom~font~file   .default:n          = { minimalist.font }
    , load-custom-font-file   .meta:n             = { load custom font file = { #1 } }
    , load-custom-font-file   .default:n          = { minimalist.font }

    , load custom latin font file   .code:n       = {
                                                      \bool_set_true:N \l__minimclass_load_custom_font_file_latin_bool
                                                      \str_set:Nn \l__minimclass_custom_font_file_latin_str { #1 }
                                                    }
    , load custom latin font file   .default:n    = { minimalist.font.latin }
    , load~custom~latin~font~file   .meta:n       = { load custom latin font file = { #1 } }
    , load~custom~latin~font~file   .default:n    = { minimalist.font.latin }
    , load-custom-latin-font-file   .meta:n       = { load custom latin font file = { #1 } }
    , load-custom-latin-font-file   .default:n    = { minimalist.font.latin }

    , load custom cjk font file     .code:n       = {
                                                      \bool_set_true:N \l__minimclass_load_custom_font_file_cjk_bool
                                                      \str_set:Nn \l__minimclass_custom_font_file_cjk_str { #1 }
                                                    }
    , load custom cjk font file     .default:n    = { minimalist.font.cjk }
    , load~custom~cjk~font~file     .meta:n       = { load custom cjk font file = { #1 } }
    , load~custom~cjk~font~file     .default:n    = { minimalist.font.cjk }
    , load-custom-cjk-font-file     .meta:n       = { load custom cjk font file = { #1 } }
    , load-custom-cjk-font-file     .default:n    = { minimalist.font.cjk }

    , load custom math font file    .code:n       = {
                                                      \bool_set_true:N \l__minimclass_load_custom_font_file_math_bool
                                                      \str_set:Nn \l__minimclass_custom_font_file_math_str { #1 }
                                                    }
    , load custom math font file    .default:n    = { minimalist.font.math }
    , load~custom~math~font~file    .meta:n       = { load custom math font file = { #1 } }
    , load~custom~math~font~file    .default:n    = { minimalist.font.math }
    , load-custom-math-font-file    .meta:n       = { load custom math font file = { #1 } }
    , load-custom-math-font-file    .default:n    = { minimalist.font.math }

    , a4paper                 .bool_set:N         = \l__minimclass_a_four_paper_bool
    , a4paper                 .initial:n          = { false }
    , b5paper                 .bool_set:N         = \l__minimclass_b_five_paper_bool
    , b5paper                 .initial:n          = { false }

    , oneside                 .code:n             = { \PassOptionsToClass { \CurrentOption } { \l__minimclass_base_class_tl } }
    , twoside                 .code:n             = { \PassOptionsToClass { \CurrentOption } { \l__minimclass_base_class_tl } }

    , 11pt                    .code:n             = { \PassOptionsToClass { \CurrentOption } { \l__minimclass_base_class_tl } }
    , 12pt                    .code:n             = { \PassOptionsToClass { \CurrentOption } { \l__minimclass_base_class_tl } }

    , unknown                 .code:n             = {
                                                      \PassOptionsToPackage { \CurrentOption } { minimalist }
                                                    }
  }
\ProcessKeyOptions [ minimclass ]

\LoadClass{\l__minimclass_base_class_tl}

\NewDocumentCommand \IfPrintModeTF { m m }
  {
    \bool_if:NTF \l__minimclass_print_mode_bool { #1 } { #2 }
  }
\NewDocumentCommand \IfPrintModeT { m }
  {
    \bool_if:NT \l__minimclass_print_mode_bool { #1 }
  }
\NewDocumentCommand \IfPrintModeF { m }
  {
    \bool_if:NF \l__minimclass_print_mode_bool { #1 }
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
    papersize = { 7in, 10in },
    total = { 5.535in, 8.300in },
    centering,
    footnotesep = 2em plus 2pt minus 2pt,
    footskip = .5in,
  }

\bool_if:NT \l__minimclass_b_five_paper_bool
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

\bool_if:NT \l__minimclass_a_four_paper_bool
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

\bool_if:NT \l__minimclass_fast_bool
  {
    \PassOptionsToPackage { fast } { minimalist }
    \RequirePackage { draftwatermark }
    \DraftwatermarkOptions { text = { \normalfont DRAFT }, color = paper!97!-paper }
  }

\RequirePackage { minimalist }

\str_if_eq:onT { \l__minimalist_style_str } { classical }
  {
    \bool_set_false:N \l__minimclass_useindent_bool
  }

\bool_if:NTF \l__minimclass_useindent_bool
  {
    \RequirePackage { indentfirst }
  }
  {
    \hook_gput_code:nnn { begindocument/before } { minimclass }
      {
        \RequirePackage { parskip }
      }
  }


%%================================
%%  Fonts
%%================================
\WarningFilter { latexfont } { Font~shape }
\WarningFilter { latexfont } { Some~font  }

\hook_gput_code:nnn { begindocument/before } { minimclass }
  {
    \IfPackageLoadedTF { biblatex }
      {
        \PassOptionsToPackage { biblatex } { embrac }
      } {}
    \RequirePackage { embrac }
  }

\cs_new_protected:Nn \__minimclass_load_file_or_config:Nnn
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

\cs_new_protected:Nn \__minimclass_if_font_exist:nnn
  {
    \bool_if:NTF \l__minimclass_fast_bool
      { #3 }
      { \fontspec_font_if_exist:nTF { #1 } { #2 } { #3 } }
  }

\__minimclass_load_file_or_config:Nnn \l__minimclass_load_custom_font_file_bool { \l__minimclass_custom_font_file_str }
  {
    \RequirePackage { projlib-font }

    \bool_if:NF \g_projlib_font_already_set_bool
      {
        \bool_if:NT \l__minimclass_fast_bool
          {
            \RequirePackage { mathpazo }
          }

        \PassOptionsToPackage { no-math,quiet } { fontspec }
        \RequirePackage { fontspec }

        \__minimclass_load_file_or_config:Nnn \l__minimclass_load_custom_font_file_latin_bool { \l__minimclass_custom_font_file_latin_str }
          {
            \bool_if:NTF \l__projlib_font_useosf_bool
              {
                \setmainfont { TeXGyrePagellaX }
                  [
                    Extension      = .otf,
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-Italic,
                    BoldItalicFont = *-BoldItalic,
                    Numbers        = OldStyle ,
                  ]
                \setsansfont { texgyreheros }
                  [
                    Extension      = .otf ,
                    Scale          = MatchUppercase ,
                    UprightFont    = *-regular ,
                    BoldFont       = *-bold ,
                    ItalicFont     = *-italic ,
                    BoldItalicFont = *-bolditalic ,
                    Numbers        = OldStyle ,
                  ]
                % \setsansfont { SourceSansPro }
                %   [
                %     Extension      = .otf,
                %     UprightFont    = *-Regular,
                %     BoldFont       = *-Semibold,
                %     ItalicFont     = *-RegularIt,
                %     BoldItalicFont = *-SemiboldIt,
                %     WordSpace      = {1.25, 1, 1} ,
                %     Numbers        = OldStyle ,
                %   ]
              }
              {
                \setmainfont { TeXGyrePagellaX }
                  [
                    Extension      = .otf,
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-Italic,
                    BoldItalicFont = *-BoldItalic,
                  ]
                \setsansfont { texgyreheros }
                  [
                    Extension      = .otf ,
                    Scale          = MatchUppercase ,
                    UprightFont    = *-regular ,
                    BoldFont       = *-bold ,
                    ItalicFont     = *-italic ,
                    BoldItalicFont = *-bolditalic ,
                  ]
                % \setsansfont { SourceSansPro }
                %   [
                %     Extension      = .otf,
                %     UprightFont    = *-Regular,
                %     BoldFont       = *-Semibold,
                %     ItalicFont     = *-RegularIt,
                %     BoldItalicFont = *-SemiboldIt,
                %     WordSpace      = {1.25, 1, 1} ,
                %   ]
              }
            \setmonofont { NewCMMono10 }
              [
                Scale          = 1.05 ,
                Extension      = .otf,
                UprightFont    = *-Regular,
                BoldFont       = *-Bold,
                ItalicFont     = *-Italic,
                BoldItalicFont = *-BoldOblique,
              ]

            \projlib_language_set_linespacing_latin:n { \setstretch { 1.07 } }

            \hook_gput_code:nnn { begindocument/before } { minimclass }
              {
                \RenewEmph{[}{]}
                \RenewEmph{(}{)}
              }
          }
      }

    \PassOptionsToPackage { fontset = none, scheme = plain } { ctex }
    \RequirePackage { ctex }

    \__minimclass_load_file_or_config:Nnn \l__minimclass_load_custom_font_file_cjk_bool { \l__minimclass_custom_font_file_cjk_str }
      {
        \__minimclass_if_font_exist:nnn { SourceHanSerifSC-Regular }
          {
            \setCJKmainfont { SourceHanSerifSC }
              [
                UprightFont    = *-Regular,
                BoldFont       = *-Bold,
                ItalicFont     = *-Regular,
                BoldItalicFont = *-Bold,
              ]
          }
          {
            \setCJKmainfont { FandolSong }
              [
                Extension      = .otf,
                UprightFont    = *-Regular,
                BoldFont       = *-Bold,
                ItalicFont     = FandolKai-Regular ,
                BoldItalicFont = FandolKai-Regular ,
                BoldItalicFeatures = { FakeBold = 4 } ,
              ]
          }

        \__minimclass_if_font_exist:nnn { SourceHanSansSC-Regular }
          {
            \setCJKsansfont { SourceHanSansSC }
              [
                UprightFont    = *-Regular,
                BoldFont       = *-Bold,
                ItalicFont     = *-Regular,
                BoldItalicFont = *-Bold,
              ]
          }
          {
            \setCJKsansfont { FandolHei }
              [
                Extension      = .otf,
                UprightFont    = *-Regular,
                BoldFont       = *-Bold,
                ItalicFont     = *-Regular,
                BoldItalicFont = *-Bold,
              ]
          }

        \__minimclass_if_font_exist:nnn { SourceHanMonoSC-Regular }
          {
            \setCJKmonofont { SourceHanMonoSC }
              [
                UprightFont    = *-Regular,
                BoldFont       = *-Medium,
                ItalicFont     = *-Regular,
                BoldItalicFont = *-Medium,
              ]
          }
          {
            \setCJKmonofont { FandolFang-Regular.otf }
              [
                BoldFont       = * ,
                BoldFeatures   = { FakeBold = 4 } ,
                ItalicFont     = * ,
                BoldItalicFont = * ,
                BoldItalicFeatures = { FakeBold = 4 } ,
              ]
          }

        \bool_if:NT \g__projlib_language_enabled_schinese_bool
          {
            \__minimclass_if_font_exist:nnn { SourceHanSerifSC-Regular }
              {
                \setCJKfamilyfont { SCmain } { SourceHanSerifSC }
                  [
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-ExtraLight,
                    BoldItalicFont = *-SemiBold,
                  ]
              }
              {
                \setCJKfamilyfont { SCmain } { FandolSong }
                  [
                    Extension      = .otf,
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = FandolKai-Regular ,
                    BoldItalicFont = FandolKai-Regular ,
                    BoldItalicFeatures = { FakeBold = 4 } ,
                  ]
              }
            \__minimclass_if_font_exist:nnn { SourceHanSansSC-Regular }
              {
                \setCJKfamilyfont { SCsans } { SourceHanSansSC }
                  [
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-Regular,
                    BoldItalicFont = *-Bold,
                  ]
              }
              {
                \setCJKfamilyfont { SCsans } { FandolHei }
                  [
                    Extension      = .otf,
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-Regular,
                    BoldItalicFont = *-Bold,
                  ]
              }
            \__minimclass_if_font_exist:nnn { SourceHanMonoSC-Regular }
              {
                \setCJKfamilyfont { SCmono } { SourceHanMonoSC }
                  [
                    UprightFont    = *-Regular,
                    BoldFont       = *-Medium,
                    ItalicFont     = *-Regular,
                    BoldItalicFont = *-Medium,
                  ]
              }
              {
                \setCJKfamilyfont { SCmono } { FandolFang-Regular.otf }
                  [
                    BoldFont       = * ,
                    BoldFeatures   = { FakeBold = 4 } ,
                    ItalicFont     = * ,
                    BoldItalicFont = * ,
                    BoldItalicFeatures = { FakeBold = 4 } ,
                  ]
              }
          }

        \bool_if:NT \g__projlib_language_enabled_tchinese_bool
          {
            \__minimclass_if_font_exist:nnn { SourceHanSerifTC-Regular }
              {
                \setCJKfamilyfont { TCmain } { SourceHanSerifTC }
                  [
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-ExtraLight,
                    BoldItalicFont = *-SemiBold,
                  ]
              }
              {
                \setCJKfamilyfont { TCmain } { FandolSong }
                  [
                    Extension      = .otf,
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = FandolKai-Regular ,
                    BoldItalicFont = FandolKai-Regular ,
                    BoldItalicFeatures = { FakeBold = 4 } ,
                  ]
              }
            \__minimclass_if_font_exist:nnn { SourceHanSansTC-Regular }
              {
                \setCJKfamilyfont { TCsans } { SourceHanSansTC }
                  [
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-Regular,
                    BoldItalicFont = *-Bold,
                  ]
              }
              {
                \setCJKfamilyfont { TCsans } { FandolHei }
                  [
                    Extension      = .otf,
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-Regular,
                    BoldItalicFont = *-Bold,
                  ]
              }
            \__minimclass_if_font_exist:nnn { SourceHanMonoTC-Regular }
              {
                \setCJKfamilyfont { TCmono } { SourceHanMonoTC }
                  [
                    UprightFont    = *-Regular,
                    BoldFont       = *-Medium,
                    ItalicFont     = *-Regular,
                    BoldItalicFont = *-Medium,
                  ]
              }
              {
                \setCJKfamilyfont { TCmono } { FandolFang-Regular.otf }
                  [
                    BoldFont       = * ,
                    BoldFeatures   = { FakeBold = 4 } ,
                    ItalicFont     = * ,
                    BoldItalicFont = * ,
                    BoldItalicFeatures = { FakeBold = 4 } ,
                  ]
              }
          }

        \bool_if:NT \g__projlib_language_enabled_japanese_bool
          {
            \__minimclass_if_font_exist:nnn { SourceHanSerif-Regular }
              {
                \setCJKfamilyfont { JPmain } { SourceHanSerif }
                  [
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-ExtraLight,
                    BoldItalicFont = *-SemiBold,
                  ]
              }
              {
                \setCJKfamilyfont { JPmain } { FandolSong }
                  [
                    Extension      = .otf,
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = FandolKai-Regular ,
                    BoldItalicFont = FandolKai-Regular ,
                    BoldItalicFeatures = { FakeBold = 4 } ,
                  ]
              }
            \__minimclass_if_font_exist:nnn { SourceHanSans-Regular }
              {
                \setCJKfamilyfont { JPsans } { SourceHanSans }
                  [
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-Regular,
                    BoldItalicFont = *-Bold,
                  ]
              }
              {
                \setCJKfamilyfont { JPsans } { FandolHei }
                  [
                    Extension      = .otf,
                    UprightFont    = *-Regular,
                    BoldFont       = *-Bold,
                    ItalicFont     = *-Regular,
                    BoldItalicFont = *-Bold,
                  ]
              }
            \__minimclass_if_font_exist:nnn { SourceHanMono-Regular }
              {
                \setCJKfamilyfont { JPmono } { SourceHanMono }
                  [
                    UprightFont    = *-Regular,
                    BoldFont       = *-Medium,
                    ItalicFont     = *-Regular,
                    BoldItalicFont = *-Medium,
                  ]
              }
              {
                \setCJKfamilyfont { JPmono } { FandolFang-Regular.otf }
                  [
                    BoldFont       = * ,
                    BoldFeatures   = { FakeBold = 4 } ,
                    ItalicFont     = * ,
                    BoldItalicFont = * ,
                    BoldItalicFeatures = { FakeBold = 4 } ,
                  ]
              }
          }

        \cs_new:Nn \minimclass_cjk_sffamily: {}
        \cs_new:Nn \minimclass_cjk_ttfamily: {}

        \hook_gput_code:nnn { cmd/sffamily/after } { minimclass } { \minimclass_cjk_sffamily: }
        \hook_gput_code:nnn { cmd/ttfamily/after } { minimclass } { \minimclass_cjk_ttfamily: }

        \AddLanguageSetting [schinese]
          {
            \cs_set:Nn \minimclass_cjk_sffamily: { \CJKfamily { SCsans } }
            \cs_set:Nn \minimclass_cjk_ttfamily: { \CJKfamily { SCmono } }
            \CJKfamily { SCmain }
            \hook_gput_code:nnn { normalfont } { minimclass } { \CJKfamily{SCmain} }
          }
        \AddLanguageSetting [tchinese]
          {
            \cs_set:Nn \minimclass_cjk_sffamily: { \CJKfamily { TCsans } }
            \cs_set:Nn \minimclass_cjk_ttfamily: { \CJKfamily { TCmono } }
            \CJKfamily { TCmain }
            \hook_gput_code:nnn { normalfont } { minimclass } { \CJKfamily{TCmain} }
          }
        \AddLanguageSetting [japanese]
          {
            \cs_set:Nn \minimclass_cjk_sffamily: { \CJKfamily { JPsans } }
            \cs_set:Nn \minimclass_cjk_ttfamily: { \CJKfamily { JPmono } }
            \CJKfamily { JPmain }
            \hook_gput_code:nnn { normalfont } { minimclass } { \CJKfamily{JPmain} }
          }

        % \tl_gset:Nn \g_minimalist_title_font_common_tl { \minimclass_cjk_sffamily: }
      }

    \__minimclass_load_file_or_config:Nnn \l__minimclass_load_custom_font_file_math_bool { \l__minimclass_custom_font_file_math_str }
      {
        \bool_if:NF \g_projlib_font_already_set_bool
          {
            \RequirePackage { amssymb }
            \bool_if:NF \l__minimclass_fast_bool
              {
                \PassOptionsToPackage { warnings-off = { mathtools-colon, mathtools-overbracket } } { unicode-math }
                \RequirePackage { unicode-math }
                \unimathsetup { math-style = ISO, partial = upright, nabla = upright }
                \setmathfont { KpMath-Regular.otf }
                \setmathfont { KpMath-Regular.otf }
                  [
                    range = \amalg ,
                    Scale = 0.84625
                  ]
                \setmathfont { KpMath-Sans.otf }
                  [
                    range = { \sum }
                  ]
                \setmathfont { latinmodern-math.otf }
                  [
                    range = { frak, bffrak, \mitvarpi, \mupvarpi, \ast } ,
                    Scale = 1.10
                  ]
                \setmathfont { texgyrepagella-math.otf }
                  [
                    range = { `(, `), `/, \setminus } ,
                    Scale = 1.10
                  ]
                \setmathfont { texgyrepagella-math.otf }
                  [
                    range = { \mathcomma, \mathsemicolon } ,
                  ]
                \setmathfont { texgyrepagella-math.otf }
                  [
                    range = { it / { Latin, latin }, bfit / { Latin, latin }, up / num, bfup / num }
                  ]
                \setmathfont { KpMath-Regular.otf } [ range = { cal, bfcal }, RawFeature=+ss01 ]
                % \setmathfont { KpMath-Regular.otf } [ range = {} ]

                % https://tex.stackexchange.com/a/646715
                \sys_if_engine_luatex:T
                  {
                    \mathitalicsmode=1
                  }

                \hook_gput_code:nnn { begindocument } { minimclass }
                  {
                    \cs_gset_eq:NN \overline \wideoverbar
                    \cs_gset_eq:NN \square \mdwhtsquare

                    % https://tex.stackexchange.com/a/678611
                    \newcommand{\limstrut}{\vrule depth0.2ex width 0pt}
                    \renewcommand{\varprojlim}{\mathop{\underleftarrow{{\lim}\limstrut}}}
                    \renewcommand{\varinjlim}{\mathop{\underrightarrow{{\lim}\limstrut}}}

                    \let\setminus@old\setminus
                    \renewcommand*{\setminus}{\!\setminus@old\!}
                  }

                % https://tex.stackexchange.com/a/647789
                \hook_gput_code:nnn { begindocument } { minimclass }
                  {
                    \NewCommandCopy\unicodevdots\vdots
                    \RenewDocumentCommand{\vdots}{}{\mathrel{\loweredvdots}}
                  }
                \newcommand{\loweredvdots}{\mathpalette\loweredvdots@\relax}
                \newcommand{\loweredvdots@}[2]{%
                  \begingroup
                  \sbox\z@{$\m@th#1\unicodevdots$}%
                  \vrule width \z@ height 2.25\ht\z@ depth 0.012\ht\z@
                  \raisebox{0.25\height}{\usebox\z@}%
                  \endgroup
                }

                % https://tex.stackexchange.com/a/678998
                \hook_gput_code:nnn { begindocument } { minimclass }
                  {
                    \NewCommandCopy\standarddashv\dashv
                    \NewCommandCopy\standardvdash\vdash
                    \RenewDocumentCommand{\dashv}{}{\mathrel{\mathpalette\raisesymbol\standarddashv}}
                    \RenewDocumentCommand{\vdash}{}{\mathrel{\mathpalette\raisesymbol\standardvdash}}
                  }
                \newcommand{\raisesymbol}[2]{%
                  \begingroup
                  \sbox\z@{$\m@th#1A$}%
                  \sbox\tw@{$\m@th#1#2$}%
                  \raisebox{\dimexpr(\ht\z@-\ht\tw@)/2}{\usebox{\tw@}}%
                  \endgroup
                }

                \RequirePackage { tikz-cd }
                \tikzcdset { arrow~style = tikz, diagrams = { >={Stealth[round,length=3.4pt,width=6.15pt,inset=2.25pt]} } }

                \box_new:N \l__minimclass_xarrows_above_box
                \box_new:N \l__minimclass_xarrows_below_box
                \dim_new:N \l__minimclass_xarrows_length_dim
                \cs_new_protected:Nn \minimclass_xarrows_generic:nnnn
                  % #3 = option of \tikz
                  % #4 = edge of \draw
                  {
                    \hbox_set:Nn \l__minimclass_xarrows_below_box { \ensuremath { \scriptstyle #1 } }
                    \hbox_set:Nn \l__minimclass_xarrows_above_box { \ensuremath { \scriptstyle #2 } }
                    \dim_set:Nn \l__minimclass_xarrows_length_dim
                      { \dim_eval:n { \dim_max:nn { \box_wd:N \l__minimclass_xarrows_below_box } { \box_wd:N \l__minimclass_xarrows_above_box } + 1em } }
                    \mathrel
                      {
                        \tikz [ #3, line~width = .6pt, baseline = -.5ex, every~node/.style = { inner~sep = 0pt }, >={Stealth[round,length=3.4pt,width=6.15pt,inset=2.25pt]} ]
                          \draw (0,0) #4
                            node [ below = 3pt ] { \box_use:N \l__minimclass_xarrows_below_box }
                            node [ above = 2pt ] { \box_use:N \l__minimclass_xarrows_above_box }
                            ( \l__minimclass_xarrows_length_dim ,0) ;
                      }
                  }

                \RenewDocumentCommand \xrightarrow { O{} m }
                  {
                    \minimclass_xarrows_generic:nnnn { #1 } { #2 } { -> } { -- }
                  }
                \RenewDocumentCommand \xleftarrow { O{} m }
                  {
                    \minimclass_xarrows_generic:nnnn { #1 } { #2 } { <- } { -- }
                  }
                \RenewDocumentCommand \xleftrightarrow { O{} m }
                  {
                    \minimclass_xarrows_generic:nnnn { #1 } { #2 } { <-> } { -- }
                  }
                \RenewDocumentCommand \xhookrightarrow { O{} m }
                  {
                    \minimclass_xarrows_generic:nnnn { #1 } { #2 } {} { edge [ commutative~diagrams/hookrightarrow ] }
                  }
                \RenewDocumentCommand \xhookleftarrow { O{} m }
                  {
                    \minimclass_xarrows_generic:nnnn { #1 } { #2 } {} { edge [ commutative~diagrams/hookleftarrow ] }
                  }
                \RenewDocumentCommand \xmapsto { O{} m }
                  {
                    \minimclass_xarrows_generic:nnnn { #1 } { #2 } {} { edge [ commutative~diagrams/mapsto ] }
                  }
                \NewDocumentCommand \xlongequal { O{} m }
                  {
                    \minimclass_xarrows_generic:nnnn { #1 } { #2 } {} { edge [ commutative~diagrams/equal ] }
                  }
                \NewDocumentCommand \xtwoheadrightarrow { O{} m }
                  {
                    \minimclass_xarrows_generic:nnnn { #1 } { #2 } {} { edge [ commutative~diagrams/twoheadrightarrow ] }
                  }
                \NewDocumentCommand \xtwoheadleftarrow { O{} m }
                  {
                    \minimclass_xarrows_generic:nnnn { #1 } { #2 } {} { edge [ commutative~diagrams/twoheadleftarrow ] }
                  }

                \cs_new_protected:Nn \minimclass_xarrows_double_generic:nnnnnn
                  % #3 = option of \tikz
                  % #4 = edge 1 of \draw
                  % #5 = edge 2 of \draw
                  % #6 = sep/2
                  {
                    \hbox_set:Nn \l__minimclass_xarrows_below_box { \ensuremath { \scriptstyle #1 } }
                    \hbox_set:Nn \l__minimclass_xarrows_above_box { \ensuremath { \scriptstyle #2 } }
                    \dim_set:Nn \l__minimclass_xarrows_length_dim
                      { \dim_eval:n { \dim_max:nn { \box_wd:N \l__minimclass_xarrows_below_box } { \box_wd:N \l__minimclass_xarrows_above_box } + 1em } }
                    \mathrel
                      {
                        \tikz [ #3, line~width = .6pt, baseline = -.5ex, every~node/.style = { inner~sep = 0pt }, >={Stealth[round,length=3.4pt,width=6.15pt,inset=2.25pt]} ]
                          {
                            \draw (0,#6) #4
                              node [ below = 4pt+#6 ] { \box_use:N \l__minimclass_xarrows_below_box }
                              ( \l__minimclass_xarrows_length_dim ,#6) ;
                            \draw (0,-#6) #5
                              node [ above = 3pt+#6 ] { \box_use:N \l__minimclass_xarrows_above_box }
                              ( \l__minimclass_xarrows_length_dim ,-#6) ;
                          }
                      }
                  }

                \NewDocumentCommand \xrightrightarrows { O{} m }
                  {
                    \minimclass_xarrows_double_generic:nnnnnn { #1 } { #2 } {} { edge [ commutative~diagrams/rightarrow ] } { edge [ commutative~diagrams/rightarrow ] } { .2em }
                  }

                \NewDocumentCommand \xleftleftarrows { O{} m }
                  {
                    \minimclass_xarrows_double_generic:nnnnnn { #1 } { #2 } {} { edge [ commutative~diagrams/leftarrow ] } { edge [ commutative~diagrams/leftarrow ] } { .2em }
                  }

                \hook_gput_code:nnn { begindocument/end } { minimclass }
                  {
                    \RenewDocumentCommand \twoheadrightarrow {}
                      {
                        \minimclass_xarrows_generic:nnnn {
                          \mathchoice { \,\, } { \, } { } { }
                        } {} {} { edge [ commutative~diagrams/twoheadrightarrow ] }
                      }
                    \RenewDocumentCommand \twoheadleftarrow {}
                      {
                        \minimclass_xarrows_generic:nnnn {
                          \mathchoice { \,\, } { \, } { } { }
                        } {} {} { edge [ commutative~diagrams/twoheadleftarrow ] }
                      }
                  }
              }
          }
      }
  }

\char_set_catcode_active:n { `\· }
\cs_new_protected:Npn · { \ensuremath\cdot }

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
\bool_if:NT \l__minimclass_fast_bool { \endinput }

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
    \skip_new:N \g_minimclass_parfillskip_skip
    \xpatchcmd{\@trivlist}{\@flushglue}{\g_minimclass_parfillskip_skip}{}{}
    \hook_gput_code:nnn { begindocument } { minimclass }
      {
        \skip_gset:Nn \g_minimclass_parfillskip_skip { 0pt plus \dim_eval:n { \linewidth - 3em } }
        \skip_gset_eq:NN \parfillskip \g_minimclass_parfillskip_skip
      }
  }

\endinput
%%
%% End of file `simplivre/simplivre.cls'.
