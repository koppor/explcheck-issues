%% ***********************************************************************
%%            Copyright 2024 by M.Y. XIA <xiamyphys@gmail.com>           *
%%                                                                       *
%%    This work may be distributed and/or modified under the conditions  *
%%    of the LaTeX Project Public License                                *
%%                                                                       *
%%               http://www.latex-project.org/lppl.txt                   *
%%                                                                       *
%%    either version 1.3c of this license or any later version.          *
%%                                                                       *
%%    This work has the LPPL maintenance status `maintained'.            *
%%                                                                       *
%%    The Current Maintainers of this work is M.Y. XIA                   *
%%                                                                       *
%%    This work consists of the files whatsnote.cls,                     *
%%                                    whatsnote-cover-module.code.tex,   *
%%                                    whatsnote-layout-module.code.tex,  *
%%                                    whatsnote-font-module.code.tex,    *
%%                                    whatsnote-theorem-module.code.tex, *
%%                                and README.md.                         *
%%    available at https://github.com/xiamyphys/whatsnote                *
%% ***********************************************************************
\def\whatsnote@date{2024/11/26}
\def\whatsnote@version{3.0B}

\ProvidesExplClass {whatsnote} {\whatsnote@date} {\whatsnote@version}
  {LaTeX Class for taking Note}

% module loading
\cs_new_protected:Npn \whatsnote_msg_new:nn #1#2 
  { \msg_new:nnn { whatsnote } {#1} {#2} }
\cs_new_protected:Npn \whatsnote_msg_error:nn #1#2
  { \msg_error:nnn { whatsnote } {#1} {#2} }
\cs_generate_variant:Nn \whatsnote_msg_error:nn { nx }
\whatsnote_msg_new:nn { not found module }
  { The~Whats~module~`#1'~not~found. }

\cs_new_protected_nopar:Npn \whatsnote_provide_module:n #1
  {
    \ProvidesExplFile{Whats-#1-module.code.tex}
      {\whatsnote@date}{\whatsnote@version}
      {WhatsNote~ \text_titlecase:n {#1} ~Module}
  }
\cs_new_protected_nopar:Npn \whatsnote_load_module:n #1 
  {
    \clist_map_inline:nn {#1}
    {
      \file_if_exist_input:nF { Whats-##1-module.code.tex }
        { \whatsnote_msg_error:nn { not found module } {##1} }
    }
  }

% global options
\clist_new:N \g__whats_base_class_options_clist
\keys_define:nn { whats / classoption }
  {
    hideanswer .bool_set:N  = \g__whatsnote_hideanswer_bool,
      hideanswer .initial:n = false,
      hideanswer .default:n = true,
    darkmode .bool_set:N    = \g__whatsnote_darkmode_bool,
      darkmode .initial:n   = false,
      darkmode .default:n   = true,
    math-font .tl_set:N     = \g__whatsnote_math_font,
    main-font .tl_set:N     = \g__whatsnote_main_font,
    sans-font .tl_set:N     = \g__whatsnote_sans_font,
    mono-font .tl_set:N     = \g__whatsnote_mono_font,
    CJKmain-font .tl_set:N  = \g__whatsnote_main_CJK_font,
    CJKsans-font .tl_set:N  = \g__whatsnote_sans_CJK_font,
    CJKmono-font .tl_set:N  = \g__whatsnote_mono_CJK_font,
    unknown .code:n         = \__whatsnote_unknown_option:n { #1 },
  }
\cs_new_protected_nopar:Npn \__whatsnote_unknown_option:n #1
  {
    \tl_if_empty:nTF { #1 }
      {
        \clist_gput_right:NV \g__whats_base_class_options_clist \l_keys_key_str
      }
      {
        \exp_args:NNx \clist_gput_right:Nn \g__whats_base_class_options_clist
          { \l_keys_key_str = \exp_not:n {#1} }
      }
  }

\ProcessKeyOptions[ whats / classoption ]
\PassOptionsToClass{book}{11pt}
\PassOptionsToPackage{svgnames}{xcolor}
\exp_args:NNV \LoadClass[\g__whats_base_class_options_clist]{book}

%% ***********************************************************************

\whatsnote_load_module:n { cover }

\whatsnote_load_module:n { layout }

\whatsnote_load_module:n { theorem }

\whatsnote_load_module:n { font }

\RequirePackage
  { hyperref, cleveref, booktabs, caption, fancyhdr, pgfplots, lipsum }
\sys_if_engine_pdftex:F { \RequirePackage{zhlipsum} }
\hypersetup { hidelinks }
\pgfplotsset{ compat = newest }

\endinput

% End of file whatsnote.cls
