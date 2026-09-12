% ********************************************************* %
% ** This is file `tutodoc.cls' generated automatically. ** %
% **                                                     ** %
% ** Copyright (C) 2023-2024 by Christophe, BAL          ** %
% **                                                     ** %
% ** This file may be distributed and/or modified under  ** %
% ** the conditions of the GNU 3 License.                ** %
% ********************************************************* %

\ProvidesExplClass
  {tutodoc}
  {2024-12-18}  % Creation: 2023-11-29
  {1.7.1}
  {This package proposes tools for writing "human friendly" documentations of LaTeX packages.}


% ================== %
% == \CLS OPTIONS == %
% ================== %

%%%
% refs::
%     + https://tex.stackexchange.com/a/729929/6880
%     + https://tex.stackexchange.com/a/729913/6880
%%%

\ExplSyntaxOn

\msg_set:nnnn { tutodoc ~ (main) }
  { main : scrartcl-illegal-option }
  { The ~ option ~ << ~ #1 ~ >> ~ is ~ not ~ allowed. }
  { \msg_see_documentation_text:n { tutodoc } }


%%%
% The theme is identified by the following macro that can be changed
% when the class is loaded.
%%%
\newcommand{\tutodoc@theme}{color}


%%%
% prototype::
%     theme    : the theme to format the document.
%     fontsize : this key is one of those of the '''scrartcl'' class.
%                As \tutodoc imposes the value of this key, we must
%                forbid its use.
%     DIV      : similar to the preceding key but here we just want
%                to avoid any use of special ''DIV'' value.
%%%
\keys_define:nn { tutodoc / main / class / options } {
  theme .choices:nn = {
    bw,
    color,
    dark,
    draft
  } {
    \exp_args:NNV \renewcommand \tutodoc@theme \l_keys_choice_tl
  },
  fontsize .code:n = {
    \msg_error:nnn { tutodoc ~ (main) }
      { main : scrartcl-illegal-option }
      { fontsize }
  },
  DIV .code:n = {
    \msg_error:nnn { tutodoc ~ (main) }
      { main : scrartcl-illegal-option }
      { DIV }
  },
}

\PassOptionsToClass{ fontsize = 10pt }{ scrartcl }

\DeclareUnknownKeyHandler[ tutodoc / main / class / options ]{
  \PassOptionsToClass{ \CurrentOption }{ scrartcl }
}

\ProcessKeyOptions[ tutodoc / main / class / options ]

\LoadClass{ scrartcl }

\ExplSyntaxOff


% =============================================== %
% == OPTIONS FOR \PACKS IMPORTED BY OTHER ONES == %
% =============================================== %

% ''xcolor'' will be loaded by ''minted'' and ''tcolorbox'' below.
\PassOptionsToPackage{svgnames}{xcolor}


% ============= %
% == IMPORTS == %
% ============= %

\RequirePackage{geometry}

\RequirePackage{marginnote}
\RequirePackage{fontawesome5}
\RequirePackage{keytheorems}

\RequirePackage{clrstrip}

% Special settings for ''minted'' need to be done before the loading
% of the ''tcolorbox'' library ''minted''.
\RequirePackage[highlightmode = immediate]
               {minted}

\RequirePackage{tcolorbox}
\tcbuselibrary{
  minted,
  breakable,
  skins
}

\RequirePackage{hyperref}


%%%
% We delegate the management of quoting to the ''csquotes'' package,
% which takes care of the locale settings.
%
% warning::
%     We must load ''inputenc'' before ''csquotes''
%%%
\RequirePackage[utf8]
               {inputenc}

\RequirePackage{csquotes}


% ===================== %
% == LOCALE SETTINGS == %
% ===================== %

\ExplSyntaxOn

\msg_set:nnnn { tutodoc ~ (main) }
  { main : unsupported-lang }
  {
    unsupported ~ language ~ << ~ #1 ~ >>. %
    ~ %
    We ~ will ~ use ~ << ~ en ~ >>.
  }
  { \msg_see_documentation_text:n { tutodoc } }


% Babel requires colon management for our translations.
\newcommand{\tutodoc@colon}{:}

\AtBeginDocument{
%%%
% Settings if ''babel'' \pack is used.
%%%
  \@ifpackageloaded{babel}{
% We must take care of spacings with colons.
    \iflanguage{french}{
      \renewcommand{\tutodoc@colon}{\babelshorthand{:}}
    }{}
  }{}

%%%
% Settings if ''polyglossia'' \pack is used.
%%%
  \@ifpackageloaded{polyglossia}{
% If ''polyglossia'' is used, we must load english if necessary
% (see the ''\tutodoc@use@english'' macro below).
    \iflanguageloaded{english}{}{
      \setotherlanguage{english}
    }
  }{}%

% Standard way to find the \lang to use.
  \newcommand{\tdoclang}{\BCPdata{language}}

% We must take care of English rules for English contents.
  \newcommand\tutodoc@use@english{%
    \foreignlanguage{english}%
  }

% If the \lang is not supported, we emit a warning and just use
% the english language.
  \makeatletter

  \InputIfFileExists{tutodoc-\tdoclang.loc.cls}{}{
    \input{tutodoc-en.loc.cls}

    \msg_critical:nnx { tutodoc ~ (main) }
      { main : unsupported-lang }
      { \tdoclang }
  }

  \makeatother
}

\ExplSyntaxOff


% =================== %
% == PAGE GEOMETRY == %
% =================== %

\geometry{
  top            = 1.9cm,
  bottom         = 1.9cm,
  left           = 2.25cm,
  right          = 2.25cm,
  marginparwidth = 2cm,
  marginparsep   = 2pt,
  heightrounded
}

\setlength{\parindent}{0cm}


% ================== %
% == TITLES & TOC == %
% ================== %

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\arabic{subsection}}
\renewcommand{\thesubsubsection}{\alph{subsubsection}}

% Source
%  * https://tex.stackexchange.com/a/558025/6880
\DeclareTOCStyleEntries[
  raggedentrytext,
  linefill = \hfill,
  indent   = 0pt,
  dynindent,
  numwidth = 0pt,
  numsep   = 1ex,
  dynnumwidth
]{tocline}{
  chapter,
  section,
  subsection,
  subsubsection,
  paragraph,
  subparagraph
}


% =========================== %
% == COLOR TRANSFORMATIONS == %
% =========================== %

%%%
% prototype::
%     #1 : (black-rate)
%          the amount of color relative to black.
%     #2 : (color)
%          one color following the ''color'' format.
%
%     :return: a "darker" version of the color ''#1''.
%%%
\NewExpandableDocumentCommand{\tdocdarkcolor}{ O{50} m }{#2!#1!black}


%%%
% prototype::
%     #1 : (transparency)
%          the transparency rate.
%     #2 : (color)
%          one color following the ''color'' format.
%
%     :return: a "transparent" version of the color `#1`.
%%%
\NewExpandableDocumentCommand{\tdoclightcolor}{ O{5} m }{#2!#1}


% =========== %
% == ICONS == %
% =========== %

%%%
% prototype::
%     #1 : (aws-icon)
%          one material that expects to be an icon command from the
%          ''fontawsome5'' \pack.
%
%     :return: the icon followed by a small insecable space.
%%%
\NewDocumentCommand{\tdocicon}{ m }{%
  #1\kern.45em%
}


% ============== %
% == LISTINGS == %
% ============== %

%%%
% We use a \std \latex boolean to switch on or off lexers for listings
% (this allows the ''draft'' mode to display listings in verbatim).
%%%
\newif\ifcodenolexer
\codenolexerfalse


\ExplSyntaxOn

%%%
% prototype::
%     #1 : (style-abbrev)
%          a shortcut for a \tcolorbox styling command.
%        @ #1 in [code, sbs, std]
%
% In the following easy-to-understand macro, we use one fictive \tcolorbox
% style such as to indicate an unknown ''tutodoc'' shortcut style. For example,
% this will give the following message if the user type ''MISTYPED-STYLE''.
%
% term::
%     Package pgfkeys Error: I do not know the key '/tcb/[[tutodoc : tdoclatex
%     bad option "MISTYPED-STYLE"]]' and I am going to ignore it. Perhaps you
%     misspelled it.
%
%     See the pgfkeys package documentation for explanation.
%%%

\NewExpandableDocumentCommand{\tdoctcb}{ m }{
  \str_case:nnF { #1 } {
    { sbs  } { listing ~ side ~ text }
    { code } { listing ~ only }
    { std  } { listing ~ and ~ text }
  } {
    [[tutodoc ~ : ~ LaTeX ~ listing ~ illegal ~ style ~ "#1"]]
  }
}

\ExplSyntaxOff


% ============================== %
% == THEME - GENERAL SETTINGS == %
% ============================== %

\input{tutodoc-\tutodoc@theme.css.cls}

\pagecolor{tutodoc@page@color}
\color{tutodoc@text@color}

\hypersetup{
  colorlinks,
  citecolor = tutodoc@link@color,
  filecolor = tutodoc@link@color,
  linkcolor = tutodoc@link@color,
  urlcolor  = tutodoc@link@color
}



% ============= %
% == QUOTING == %
% ============= %

%%%
% prototype::
%     #1 : (text)
%          a text to quote.
%
% For example, ''\tdocquote{Something}'' prints **"Something"**.
%%%
\NewDocumentCommand{\tdocquote}{ m }{%
  \enquote{\emph{#1}}%
}


% ============================== %
% == EXPLAINING ENGLISH WORDS == %
% ============================== %

%%%
% prototype::
%     #1 : (EN-text)
%          an english text that will be explained in another \lang.
%
%     :extra: this macro has a star version.
%
% For example, if the language chosen is ''french'', we have
% the following outputs.
%
%     1) ''\tdocinEN{Something}'' prints
%        **"Something" en anglais**.
%
%     2) ''\tdocinEN*{Something}'' just prints
%        **"Something"**.
%
%     3) ''\tdocinEN*{Something} et \tdocinEN{Another thing}''
%        gives
%        **"Something" et "Another thing" en anglais**.
%%%
\NewDocumentCommand{\tdocinEN}{ s m }{%
  \IfBooleanTF{#1}{}{\tutodoc@trans@in@EN}%
% We must activate the English typesetting rules.
  {%
    \tdocquote{\tutodoc@use@english{#2}}%
  }%
}



% =========================== %
% == HIGHLIGHTING CONTENTS == %
% =========================== %

% ---------------------- %
% -- EXAMPLE & REMARK -- %
% ---------------------- %

\ExplSyntaxOn

%%%
% We use a ''seq'' variable to factorize the code just after.
%%%
\seq_new:N             \g__tutodoc_focus_std_seq
\seq_set_from_clist:Nn \g__tutodoc_focus_std_seq {
  exa,
  rem
}


%%%
% Themes define specific vertical spacings.
%%%
\newkeytheoremstyle{tutodoc@admonition@exa@style}{
  spaceabove = \tutodoc@admonition@space@below,
  spacebelow = \tutodoc@admonition@space@below
}

%%%
% prototype::
%     :action: looping over ''\g__tutodoc_focus_std_seq'' to build new
%              numbered theorems sharing the same section level counter.
%              To achieve that, we use the ''\newkeytheorem'' macro from
%              the ''keytheorems'' \pack.
%%%
\seq_map_inline:Nn \g__tutodoc_focus_std_seq {
  \str_if_eq:nnTF { #1 } { exa } {
    \newkeytheorem{tdoc#1}[
      name   = \use:c { tutodoc@trans@#1@title },
      within = section,
      style  = tutodoc@admonition@exa@style
    ]
  } {
    \newkeytheorem{tdoc#1}[
      name       = \use:c { tutodoc@trans@#1@title },
      numberlike = tdocexa,
      style      = tutodoc@admonition@exa@style
    ]
  }

  \cs_set:cpn { the tdoc #1 } { \thesection.\arabic{tdoc#1} }
}

\ExplSyntaxOff


% ----------------- %
% -- ADMONITIONS -- %
% ----------------- %

%%%
% note::
%     We provide two ways to define admonitions.
%
%         1) ''\g__tutodoc_focus_color_prop'' and ''g__tutodoc_focus_icon_prop''
%         are for iconised and colored frames.
%
%         1) ''\g__tutodoc_focus_color_seq'' is to use a dedicated basic theorem
%         (this should be only useful for the draft theme).
%
%
% warning::
%     The variables should be defined inside the themes!
%
%
% refs::
%     + https://tex.stackexchange.com/a/727022/6880
%     + https://tex.stackexchange.com/a/682332/6880
%     + https://tex.stackexchange.com/a/623232/6880
%%%
\ifcsundef{g__tutodoc_focus_color_seq}{
  \tcbset{
    tutodoc-focus-color-style/.style = {
% General.
      use color stack, % Must be before breakable!
      breakable,
      enhanced,
% Colors.
      coltitle = \tutodoc@build@title@color{#1},
      colupper = \tutodoc@build@upper@color{#1},
      colback  = \tutodoc@build@back@color{#1},
      colframe = \tutodoc@build@frame@color{#1},
% We want to use the same color for the footnotes in the frame.
      before upper = {\let\default@color\current@color},
% Padding.
      left  = 3pt,
      right = 3pt,
      arc   = 2pt,
% Frame.
      shadow = {.75mm}{-.75mm}{0mm}{tutodoc@admonition@shadow@color},
   }
  }
}{}

\ExplSyntaxOn

\ifcsundef{g__tutodoc_focus_color_seq}{
%%%
% prototype::
%     :action: ''key/value'' iteration over ''\g__tutodoc_focus_color_prop''
%              to build new colorful unumbered theorems. To achieve that,
%              we use a \tcolorbox style given to the ''\newkeytheorem''
%              macro from the ''keytheorems'' \pack, and icons from the
%              ''fontawesome5'' \pack.
%%%
  \prop_map_inline:Nn \g__tutodoc_focus_color_prop {
    \newkeytheorem{tdoc#1}[
      numbered  = false,
% tcolorbox-no-titlebar can be used.
      tcolorbox = {tutodoc-focus-color-style=#2},
      name      = {
        \tdocicon{ \prop_item:Nn \g__tutodoc_focus_icon_prop { #1 } }
        \use:c { tutodoc@trans@#1@title }
      }
    ]
  }
} {
%%%
% prototype::
%     :action: looping over ''\g__tutodoc_focus_color_seq'' to build new
%              numbered theorems sharing the same section level counter.
%              To achieve that, we use the ''\newkeytheorem'' macro from
%              the ''keytheorems'' \pack.
%%%
  \seq_map_inline:Nn \g__tutodoc_focus_color_seq {
    \newkeytheorem{tdoc#1}[
      name       = \use:c { tutodoc@trans@#1@title },
      numberlike = tdocexa,,
      style      = tutodoc@admonition@exa@style,
% Some hooks...
      preheadhook  = \small,
      postheadhook = \leavevmode,
      postfoothook = \normalsize
    ]
  }
}

\ExplSyntaxOff



% ========================================= %
% == \PACKS, \CLSS, MACROS & \ENVS NAMES == %
% ========================================= %

%%%
% prototype::
%     #1 : (cls-name)
%          the name of a class
%
%     :action: ''\tdoccls{myclass}'' prints verb::''myclass''.
%%%
\NewDocumentCommand{\tdoccls}{ m }{%
  \texttt{#1}%
}


%%%
% prototype::
%     #1 : (pck-name)
%          the name of a package
%
%     :action:''\tdocpack{mypack}'' prints verb::''mypack''.
%%%
\NewDocumentCommand{\tdocpack}{ m }{%
  \texttt{#1}%
}


%%%
% prototype::
%     #1 : (cmd-name)
%          the name of a macro
%
%     :action: ''\tdocmacro{mymacro}'' prints verb::''\mymacro''.
%%%
\NewDocumentCommand{\tdocmacro}{ m }{%
  \texttt{\textbackslash{}#1}%
}


%%%
% prototype::
%     #1 : (env-name)
%          the name of an environment
%
%     :extra: this macro has a star version.
%
% Here are the different outputs available.
%
%     1) ''\tdocenv{myenv}'' prints
%        verb::''\begin{myenv} ... \end{myenv}''.
%
%     2) ''\tdocenv*{myenv}'' prints
%        verb::''myenv''.
%%%
\NewDocumentCommand{\tdocenv}{ s m }{%
  \IfBooleanTF{#1}{%
    \texttt{#2}%
  }{%
% Source: https://tex.stackexchange.com/a/703379/6880 .
    \texttt{\string\begin\string{#2\string} %
            \!\!...\@\!\!\! %
            \string\end\string{#2\string}}%
  }%
}


% ========================= %
% == EXPLAINING PREFIXES == %
% ========================= %

\ExplSyntaxOn

\msg_set:nnnn { tutodoc ~ (macroenv) }
  { macroenv : prefix-why-bad-format }
  { Bad ~ format, ~ something ~ like ~ ''pre.fix'' ~ expected. }
  { You ~ must ~ use ~ one ~ single ~ point. }


% -------------------- %
% -- PREFIX FROM... -- %
% -------------------- %

\seq_new:N \l__tutodoc_prewhy_parts_seq
\int_new:N \l__tutodoc_prewhy_nbparts_int
\tl_new:N  \l__tutodoc_pretext_tl
\tl_new:N  \l__tutodoc_posttext_tl


%%%
% prototype::
%     #1 : (pre.fix)
%          a prefix and a suffix separated by one colon.
%
%     :action: ''\tdocprewhy{pre.fix}'' prints verb::''pre''.fix.
%%%
\NewDocumentCommand{\tdocprewhy}{ m }{%
% Do we have 2 parts?
  \seq_set_split:Nnn \l__tutodoc_prewhy_parts_seq { . } { #1 }

  \int_set:Nn \l__tutodoc_prewhy_nbparts_int
              {\int_eval:n {\seq_count:N \l__tutodoc_prewhy_parts_seq}}

  \if_int_compare:w \l__tutodoc_prewhy_nbparts_int = 2
  \else:
    \msg_error:nn { tutodoc ~ (macroenv) }
      { macroenv : prefix-why-bad-format }
  \fi:

% Let's go.
  \seq_pop:NN \l__tutodoc_prewhy_parts_seq \l__tutodoc_pretext_tl
  \seq_pop:NN \l__tutodoc_prewhy_parts_seq \l__tutodoc_posttext_tl

  \textbf{
    \tdocpre{\tl_use:N \l__tutodoc_pretext_tl}
    \kern.5pt
    \textperiodcentered
    \kern.5pt
    {\tl_use:N \l__tutodoc_posttext_tl}
  }
}

\ExplSyntaxOff


% --------------------- %
% -- JUST ONE PREFIX -- %
% --------------------- %

%%%
% prototype::
%     #1 : (pre)
%          just a prefix
%
%     :action: ''\tdocpre{pre}'' only prints verb::''pre''.
%              This can be useful in a case like
%              ''\tdocpre{pre} comes from \tdocprewhy{pre}{fix}''
%              which prints:
%              verb::''pre'' comes from verb::''pre''-fix.
%%%
\NewDocumentCommand{\tdocpre}{ m }{%
  \texttt{#1}%
}



% ======================== %
% == TEXT BETWEEN RULES == %
% ======================== %

\ExplSyntaxOn

\box_new:N \l__tutodoc_content_box
\dim_new:N \l__tutodoc_content_dim


%%%
% prototype::
%     #1 : (color)
%          the color for the rule and the text
%     #2 : (text)
%          the text surrounded by two horizontal rules
%
%     :action: this macro adds two horizontal lines on either side of the text.
%              The final output is centered.
%
% note::
%     The code used comes from
%     cf::''this post ;
%           https://tex.stackexchange.com/a/604708/6880''.
%%%
\NewDocumentCommand{\tdocruler}{
  O{\tutodoc@showcase@rule@color}
  m
}{
  \par
  {
    \centering
      \scriptsize
      \itshape
      \bfseries
      \color{#1}

      \hbox_set:Nn \l__tutodoc_content_box { \,\, #2 \,\, }
      \dim_set:Nn  \l__tutodoc_content_dim {
        .35 \linewidth - .5 \box_wd:N \l__tutodoc_content_box
      }

      \rule[.75pt] { \dim_use:N \l__tutodoc_content_dim }
                   { 2.5pt }
      \box_use:N   \l__tutodoc_content_box
      \rule[.75pt] { \dim_use:N \l__tutodoc_content_dim }
                   { 2.5pt }
      \par
  }
}

\ExplSyntaxOff


% ============== %
% == SHOWCASE == %
% ============== %

% --------------------------- %
% -- INTERNAL ENVIRONMENTS -- %
% --------------------------- %

%%%
% prototype::
%     #1 : (up-text)
%          the descriptive text before the real output
%     #2 : (down-text)
%          the descriptive text after the real output
%     #3 : (color)
%          one color used to set the one for the decorated texts printed
%          corresponding to the two first arguments.
%     #4 : (rule color builder)
%          the macro used to build the color from the user's rule color
%
%     :action: this environment just adds its content processed by \latex
%              between centered materials produced by the macro ''\tdocruler''
%              such as to stress the start and the end of the content.
%%%
\NewDocumentEnvironment{tutodoc@showcase@rules}{ m m m m }{%
  \tdocruler[#4{#3}]{#1}%
  \nopagebreak\medskip\nopagebreak%
}{%
  \nopagebreak\medskip\nopagebreak%
  \tdocruler[#4{#3}]{#2}%
}


%%%
% prototype::
%     #1 .. #4 : :see: env.tutodoc@showcase@rules
%     #5       : (back color builder)
%                the macro used to build the color from the user's back color
%
%     :action: this environment adds a page-width colored stripe in the
%              background of the environment content processed by \latex.
%              This stripe is preceded and followed by centered materials
%              produced by the macro ''\tdocruler'' such as to stress the
%              start and the end of the content.
%%%
\NewDocumentEnvironment{tutodoc@showcase@colorstrip}{ m m m m m }{
  \begin{colorstrip}{#5{#3}}%
    \begin{tutodoc@showcase@rules}{#1}{#2}{#3}{#4}%
}{%
    \end{tutodoc@showcase@rules}%
  \end{colorstrip}
}


\ExplSyntaxOn

% ----------------------- %
% -- SETTING SOME KEYS -- %
% ----------------------- %

\tl_new:N \g_tutodoc_showcase_style_tl
\tl_new:N \l_tutodoc_showcase_before_tl
\tl_new:N \l_tutodoc_showcase_after_tl
\tl_new:N \l_tutodoc_showcase_stripe_color_tl
\tl_new:N \l_tutodoc_showcase_text_color_tl


%%%
% prototype::
%     col-stripe : the color of the stripe
%     col-text   : the color of the descriptive texts
%     nostripe   : a boolean flag to avoid the use of a stripe
%     before     : the descriptive text before the real output
%     after      : the descriptive text after the real output
%%%
\keys_define:nn { tutodoc / showcase } {
% Style?
  style .choices:nn = {
    minimal,
    rule,
    stripe
  } {
    \tl_gset:Nx \g_tutodoc_showcase_style_tl {#1}
  },
% Colors.
  col-stripe .tl_set:N  = \l_tutodoc_showcase_stripe_color_tl,
  col-stripe .initial:n = \tutodoc@showcase@stripe@color,
  col-text .tl_set:N    = \l_tutodoc_showcase_text_color_tl,
  col-text .initial:n   = \tutodoc@showcase@text@color,
% Texts.
  before .tl_set:N  = \l_tutodoc_showcase_before_tl,
  before .initial:n = \tutodoc@trans@latex@show@start,
  after  .tl_set:N  = \l_tutodoc_showcase_after_tl,
  after  .initial:n = \tutodoc@trans@latex@show@end,
}


% ------------------------------ %
% -- SHOWCASE FROM TYPED CODE -- %
% ------------------------------ %

% prototype::
%     #1 : (key-val options)
%          :see: l3keys(tutodoc / showcase)
%
%     :action: this \env formats \latex code, given as an argument,
%              by framing it with texts decorated by ''\tdocruler'',
%              in order to clearly identify a rendering used as an
%              example.
%              It is also possible to have a coloured strip of the width
%              of the page in the background of the content.
%
%     :see: env.tutodoc@showcase@rules ,
%           env.tutodoc@showcase@colorstrip
%%%
\NewDocumentEnvironment{tdocshowcase}{ O{} }{
  \group_begin:
    \tl_gset:Nn \g_tutodoc_showcase_style_tl {minimal}
    \keys_set:nn { tutodoc / showcase } { #1 }

    \str_case:Nn { \g_tutodoc_showcase_style_tl } {
      { minimal } {
        \smallskip\par
      }
      { rule } {
        \smallskip
        \begin{tutodoc@showcase@rules}
          { \tl_use:N \l_tutodoc_showcase_before_tl }
          { \tl_use:N \l_tutodoc_showcase_after_tl }
          { \tl_use:N \l_tutodoc_showcase_stripe_color_tl }
          { \tutodoc@showcase@build@rule@color }
      }
      { stripe } {
        \begin{tutodoc@showcase@colorstrip}
          { \tl_use:N \l_tutodoc_showcase_before_tl }
          { \tl_use:N \l_tutodoc_showcase_after_tl }
          { \tl_use:N \l_tutodoc_showcase_stripe_color_tl }
          { \tutodoc@showcase@build@rule@color }
          { \tutodoc@showcase@build@back@color }
      }
    }

    \color{ \tl_use:N \l_tutodoc_showcase_text_color_tl }
}{
  \str_case:Nn { \g_tutodoc_showcase_style_tl } {
    { rule } {
      \end{tutodoc@showcase@rules}
    }
    { stripe } {
      \end{tutodoc@showcase@colorstrip}
    }
  }
  \group_end:
}


% ------------------------ %
% -- SHOWCASE FROM FILE -- %
% ------------------------ %

\tl_new:N \l__tutodoc_showcase_options_tl


%%%
% prototype::
%     #1 : (key-val options)
%          :see: env.tdocshowcase
%     #2 : (file path)
%          the path of a file
%%%
\NewDocumentCommand{\tdocshowcaseinput}{ O{} m }{
  \begin{tdocshowcase}[#1]
    \input{#2}
  \end{tdocshowcase}
}

\ExplSyntaxOff



% ==================== %
% == LATEX EXAMPLES == %
% ==================== %

% ----------------------------- %
% -- INLINE LATEX CODE MACRO -- %
% ----------------------------- %

%%%
% See the \doc of the macro ''\newmintinline'' from the package \minted
% to have \infos about the macro ''tdoclatexin''.
%%%
\newmintinline[tdoclatexin]{\tutodoc@latex@lexer}{
  bgcolor            = tutodoc@latex@back@color,
  style/.expand once = \tutodoc@latex@style
}


% ------------------------------------------------ %
% -- MINTED/TCOLORBOX LATEX LISTING ENVIRONMENT -- %
% ------------------------------------------------ %

%%%
% prototype::
%     #1 : (minted-like-options)
%          a list of legal \minted options.
%     #2 : (tcolorbox-styling-commands)
%          you can override the default \tcolorbox settings with the help
%          of the macro ''\tdoctcb''.
%
%     :see: macro.tdoctcb
%
% refs::
%     + https://tex.stackexchange.com/a/604821/6880
%     + https://tex.stackexchange.com/a/327983/6880
%%%
\tcbset{
  tutodoc-latex-listing-style/.style 2 args = {
% General.
    minted language/.expand once = \tutodoc@latex@lexer,
    minted style/.expand once    = \tutodoc@latex@style,
    breakable,
    enhanced,
% Colors.
    colframe = tutodoc@latex@frame@color,
    colback  = tutodoc@latex@back@color,
    colupper = tutodoc@latex@text@color,
    collower = tutodoc@latex@text@color,
% Padding.
    boxsep = 0pt,
    left   = \tutodoc@latex@left@len,
    right  = \tutodoc@latex@right@len,
    bottom = \tutodoc@latex@bottom@len,
    top    = \tutodoc@latex@top@len,
% Frame.
    shadow     = {\tutodoc@latex@shadow@xshift@len}%
                 {\tutodoc@latex@shadow@yshift@len}%
                 {\tutodoc@latex@shadow@offset@len}%
                 {tutodoc@latex@shadow@color},
    arc        = \tutodoc@latex@arc@len,
    leftrule   = \tutodoc@latex@left@rule@len,
    rightrule  = \tutodoc@latex@right@rule@len,
    bottomrule = \tutodoc@latex@bottom@rule@len,
    toprule    = \tutodoc@latex@top@rule@len,
% Separating line.
    segmentation style = {
      tutodoc@latex@segment@color,
      dash pattern = {on 5pt off 2.5pt},
      line width   = .75pt
    },
% Extra minted otpions.
    minted options = {#1},
% Extra tcolorbox styles.
    #2
  },
}


%%%
% prototype::
%     #1 : (minted-like-options)
%          :see: tcbset(tutodoc-latex-listing-style)
%     #2 : (tcolorbox-styling-commands)
%          :see: tcbset(tutodoc-latex-listing-style)
%
% note::
%     See the \doc of the macro ''\newtcblisting'' from the package
%     \tcolorbox to have \infos about the environment ''tdoclatex''.
%%%
\NewTCBListing{tdoclatex}{ O{} D<>{} }{%
  tutodoc-latex-listing-style = {#1}{#2}
}


% -------------------------------------- %
% -- TCOLORBOX IMPORTED LISTING MACRO -- %
% -------------------------------------- %

%%%
% prototype::
%     #1 : (minted-like-options)
%          :see: tcbset(tutodoc-latex-listing-style)
%     #2 : (tcolorbox-styling-commands)
%          :see: tcbset(tutodoc-latex-listing-style)
%     #3 : (file path)
%          the path of the file to input and format.
%
% note::
%     See the \doc of the macro ''\newtcbinputlisting'' from the package
%     \tcolorbox to have more \infos about the macro ''\tdoclatexinput''.
%%%
\NewTCBInputListing{\tdoclatexinput}{ O{} D<>{} m }{
  listing file                = {#3},
  tutodoc-latex-listing-style = {#1}{#2}
}


% ===================== %
% == LATEX USE CASES == %
% ===================== %

\ExplSyntaxOn

% --------------------- %
% -- SETTING THE KEY -- %
% --------------------- %

\tl_new:N \l_tutodoc_listing_explain_tl


%%%
% prototype::
%     explain : the text between the code and its highlighted output.
%
% note::
%     This key can be used in addition to those of the ''tdocshowcase''
%     \env,
%%%
\keys_define:nn { tutodoc / listing / latexshow } {
  explain .tl_set:N  = \l_tutodoc_listing_explain_tl,
  explain .initial:n = { \tutodoc@trans@this@gives \tutodoc@colon },
}


% --------------------- %
% -- LATEXSHOW MACRO -- %
% --------------------- %

\tl_new:N \l__tutodoc_showcase_options_passed_tl


%%%
% prototype::
%     #1 : (key-val options)
%          :see: l3keys(tutodoc / listing / latexshow) ,
%                l3keys(tutodoc / showcase)
%     #2 : (file path)
%          the path of a file
%
%     :see: env.tdocshowcase ,
%           macro.tdoclatexinput
%%%
\NewDocumentCommand{\tdoclatexshow}{ O{} m} {
  \group_begin:
    \keys_set_known:nnN { tutodoc / listing / latexshow }
      { #1 }
      \l__tutodoc_showcase_options_passed_tl

    \tdoclatexinput<\tdoctcb{code}>{#2}

    \tl_use:N \l_tutodoc_listing_explain_tl

% Source: https://tex.stackexchange.com/a/696700/6880
    \exp_last_unbraced:NNV \tdocshowcaseinput [\l__tutodoc_showcase_options_passed_tl] {#2}
  \group_end:
}

\ExplSyntaxOff



% ========================= %
% == LISTINGS - AGNOSTIC == %
% ========================= %

% ---------------------------------- %
% -- DOES THE THEME AVOID LEXERS? -- %
% ---------------------------------- %

\NewExpandableDocumentCommand{\tutodoc@code@lexer}{ m }{%
  \ifcodenolexer text\else #1\fi%
}


% ---------------------------------- %
% -- INLINE GENERALIST CODE MACRO -- %
% ---------------------------------- %

%%%
% prototype::
%     #1 : (minted-like-options)
%          a list of legal \minted options.
%     #2 : (coding-lang)
%          the name of the \minted lexer corresponding to the coding langage
%          for the formating.
%
% warning::
%     There are only two arguments, because the \mintinline macro will eat
%     the bit of inline code to be colored.
%%%
\NewDocumentCommand{\tdoccodein}{ O{} m }{%
  \mintinline[
    bgcolor            = tutodoc@code@back@color,
    style/.expand once = \tutodoc@code@style,
    #1
  ]{\tutodoc@code@lexer{#2}}%
}


% ----------------------------------------------------- %
% -- MINTED/TCOLORBOX GENERALIST LISTING ENVIRONMENT -- %
% ----------------------------------------------------- %

%%%
% prototype::
%     #1 : (minted-like-options)
%          :see: macro.tdoccodein
%     #2 : (tcolorbox-styling-commands)
%          you can override the default \tcolorbox settings with the help
%          of the macro ''\tdoctcb''.
%     #3 : (coding-lang)
%          :see: macro.tdoccodein
%
%     :see: macro.tdoctcb
%
% refs::
%     + https://tex.stackexchange.com/a/604821/6880
%     + https://tex.stackexchange.com/a/327983/6880
%%%
\tcbset{
  tutodoc-full-listing-style/.style n args = {3}{
% General.
    minted style/.expand once    = \tutodoc@code@style,
    minted language/.expand once = \tutodoc@code@lexer{#3},
    breakable,
    enhanced,
% Colors.
    colframe = tutodoc@code@frame@color,
    colback  = tutodoc@code@back@color,
    colupper = tutodoc@code@text@color,
    collower = tutodoc@code@text@color,
% Padding.
    boxsep = 0pt,
    left   = \tutodoc@code@left@len,
    right  = \tutodoc@code@right@len,
    bottom = \tutodoc@code@bottom@len,
    top    = \tutodoc@code@top@len,
% Frame.
    shadow     = {\tutodoc@code@shadow@xshift@len}%
                 {\tutodoc@code@shadow@yshift@len}%
                 {\tutodoc@code@shadow@offset@len}%
                 {tutodoc@code@shadow@color},
    arc        = \tutodoc@code@arc@len,
    leftrule   = \tutodoc@code@left@rule@len,
    rightrule  = \tutodoc@code@right@rule@len,
    bottomrule = \tutodoc@code@bottom@rule@len,
    toprule    = \tutodoc@code@top@rule@len,
% Separating line.
    segmentation style = {
      tutodoc@code@segment@color,
      dash pattern = {on 5pt off 2.5pt},
      line width   = .75pt
    },
    listing only,
% Extra minted otpions.
    minted options = {#1},
% Extra tcolorbox styles.
    #2
  },
}


%%%
% prototype::
%     #1 : (minted-like-options)
%          :see: macro.tdoccodein
%     #2 : (tcolorbox-styling-commands)
%          :see: \tcbset{tutodoc-full-listing-style}
%     #3 : (coding-lang)
%          :see: macro.tdoccodein
%
% note::
%     See the \doc of the macro ''\NewTCBListing'' from the package
%     \tcolorbox to have \infos about the environment ''tdoccode''.
%%%
\NewTCBListing{tdoccode}{ O{} D<>{} m }{%
  tutodoc-full-listing-style = {#1}{#2}{#3}
}


% -------------------------------------- %
% -- TCOLORBOX IMPORTED LISTING MACRO -- %
% -------------------------------------- %

%%%
% prototype::
%     #1 : (minted-like-options)
%          :see: macro.tdoccodein
%     #2 : (tcolorbox-styling-commands)
%          :see: \tcbset{tutodoc-full-listing-style}
%     #3 : (coding-lang)
%          :see: macro.tdoccodein
%     #4 : (file path)
%          the path of the file to input and format.
%
% note::
%     See the \doc of the macro ''\NewTCBInputListing'' from the package
%     \tcolorbox to have more \infos about the macro ''\tdoccodeinput''.
%%%
\NewTCBInputListing{\tdoccodeinput}{ O{} D<>{} m m }{
  listing file               = {#4},
  tutodoc-full-listing-style = {#1}{#2}{#3}
}



% == CHANGES - WHEN? --%

\ExplSyntaxOn

\msg_set:nnnn { tutodoc ~ (version-n-change) }
  { version-n-change : date-bad-format }
  { Bad ~ format ~ for ~ a ~ date. }
  { Use ~ YYYY-MM-DD. }


% ----------------- %
% -- MARGIN NOTE -- %
% ----------------- %

\reversemarginpar{}

%%%
% prototype::
%     #1 : (color)
%          the color of the margin note
%     #2 : (up-text)
%          the first material (a version number or nothing)
%     #3 : (down-text)
%          the second material (a date or nothing)
%     #4 : (spacing)
%          the last negative vertical spacing for the 2nd rule
%     #5 : (vertical offset)
%          algebraic distance to move vertically the material
%
%     :action: this macro factorizes the printing of the changes
%              in the left margin.
%
%     :see: \__tutodoc_translate_date:n
%%%
\NewDocumentCommand{\tutodoc@new@change@margin}{ m m m m m }{
  \marginnote{
    \color{#1}
    \scriptsize
    \normalfont
    \centering

    \vspace{0pt}
    \rule{1.65cm}{.95pt}
    \vspace{-2.9pt}

    \IfBlankTF{#2}{}{
      \par
        #2\vphantom{Mp}
      \par
    }

    \IfBlankTF{#3}{}{
      \IfBlankTF{#2}{}{
        \vspace{1pt}
      }

      \par
        \__tutodoc_translate_date:n { #3 }
        \vphantom{Mp}
      \par
    }

    \vspace{#4}
    \rule{1.65cm}{.95pt}
  }[#5]
}


%%%
% prototype::
%     #1 : (EN-num-date)
%          a content that should have the numerical English date
%          format ''YYYY-MM-DD''.
%
%     :action: this function checks if we have something like
%              ''YYYY-MM-DD'', and then it calls the function
%              ''\__tutodoc_translate_date_process:w'' to
%              activate the transformation to the locale format.
%
%     :see: \__tutodoc_translate_date_process:w
%%%
\cs_new:Nn \__tutodoc_translate_date:n {
  \regex_match:nnTF { \A \d{1,4} \- \d{2} \- \d{2} \Z } { #1 }{
    \__tutodoc_translate_date_process:w #1 \q_stop
  }{
    \msg_error:nn { tutodoc ~ (version-n-change) }
      { version-n-change : date-bad-format }
  }
}


%%%
% prototype::
%     #1 : (year-extracted)
%          a 1 to 4 digits integer
%     #2 : (month-extracted)
%          a 2 digits integer
%     #3 : (day-extracted)
%          a 2 digits integer
%
%     :action: this function extracts year, month and day in something
%              like ''YYYY-MM-DD'' and then it calls ''\tutodoc@trans@date''
%              to use the format expected for a "localised" date.
%%%
\cs_new:Npn \__tutodoc_translate_date_process:w #1 - #2 - #3 \q_stop {
    \tutodoc@trans@date{#1}{#2}{#3}
}

\ExplSyntaxOff


% ---------------------- %
% -- VERSION AND DATE -- %
% ---------------------- %

\newlength{\tutodoc@version@date@vertical@sep@len}
\setlength{\tutodoc@version@date@vertical@sep@len}{-4.25pt}

\newlength{\tutodoc@version@date@vertical@offset@len}
\setlength{\tutodoc@version@date@vertical@offset@len}{-8pt}


%%%
% prototype::
%     #1 : (color)
%          the color of the margin note
%     #2 : (version)
%          a version number
%     #3 : (date)
%          a date ''YYYY-MM-DD''
%     #4 : (vertical offset)
%          algebraic distance to move vertically the material
%
%     :action: this macro prints a margin note showing a version number
%              below a date, and the optional argument is used to colorize
%              all this text.
%
% warning::
%     The date must use an english formatting like ''2021-07-14''. This allows
%     to parse the date such as to display it following the standard convention
%     of the language chosen when loading the package.
%%%
\NewDocumentCommand{\tdocversion}{ %
  O{\tutodoc@changes@when@color} %
  m %
  O{} %
  D<>{\tutodoc@version@date@vertical@offset@len}%
}{
  \tutodoc@new@change@margin%
    {#1}                                % Color
    {#2}                                % Version
    {#3}                                % Date
    {\tutodoc@version@date@vertical@sep@len} % Last negative vertical spacing
    {#4}                                % Vertical offset
}


% ---------- %
% -- DATE -- %
% ---------- %

%%%
% prototype::
%     #1 : (color)
%          the color of the margin note
%     #2 : (date)
%          a date ''YYYY-MM-DD''
%     #3 : (vertical offset)
%          algebraic distance to move vertically the material
%
%     :action: this macro is similar to ''\tdocversion'' except that it just
%              prints a date.
%%%
\NewDocumentCommand{\tdocdate}{
  O{\tutodoc@changes@when@color}
  m
  D<>{\tutodoc@version@date@vertical@offset@len}
}{
  \tutodoc@new@change@margin%
    {#1}                             % Color
    {}                               % Version
    {#2}                             % Date
    {\tutodoc@version@date@vertical@sep@len} % Last negative spacing
    {#3}                             % Vertical offset
}


% ===================== %
% == CHANGES - WHAT? == %
% ===================== %

\ExplSyntaxOn

\msg_set:nnnn { tutodoc ~ (version-n-change) }
  { version-n-change : topic-missing-title }
  { Missing ~ title. }
  { One ~ single ~ title ~ must ~ be ~ indicated. }


% ------------------- %
% -- GENERIC TOPIC -- %
% ------------------- %

\tl_new:N \l_tutodoc_topic_what_color_tl
\tl_new:N \l_tutodoc_topic_when_color_tl
\tl_new:N \l_tutodoc_topic_date_tl
\tl_new:N \l_tutodoc_topic_version_tl


%%%
% prototype::
%     col       : the color of the full content of a topic \env
%     col-chges : the color of the material for changes for a topic \env
%     date      : the date of the changes a topic \env
%     version   : the number version of the changes a topic \env
%%%
\keys_define:nn { tutodoc / version-n-change / topic / options } {
% Colors.
  col       .tl_set:N  = \l_tutodoc_topic_what_color_tl,
  col       .initial:n = tutodoc@text@color,
  col-chges .tl_set:N  = \l_tutodoc_topic_when_color_tl,
  col-chges .initial:n = \tutodoc@changes@when@color,
% Date.
  date .tl_set:N  = \l_tutodoc_topic_date_tl,
  date .initial:n = \c_empty_tl,
% Version.
  version .tl_set:N  = \l_tutodoc_topic_version_tl,
  version .initial:n = \c_empty_tl,
}

\tl_new:N \l__tutodoc_topic_all_user_options_tl


%%%
% For themes using icons, we need a specific paragraph with less vertical
% space consuming.
%%%
\ifcsundef{g__tutodoc_topic_change_seq}{
  \newcommand{\tutodoc@what@change@paragraph}{%
    \@startsection{paragraph}          %
      {4}                              % Level 4 (after section and co)
      {\z@}                            % No indentation before the title
      {1.25ex \@plus 1ex \@minus .2ex} % Vertical space before:
                                       % 2ex with flexibility (+1ex / -0.2ex)
      {-1em}                           % Negative spacing after
                                       % ==> Title slightly aligned to the left.
      {\normalfont\normalsize          % Title style
       \bfseries\sffamily}             %
  }
}{}


%%%
% prototype::
%     #1 : (title)
%          a title that will be followed by a colon.
%     #2 : (aws-icon)
%          one material that expects to be an icon command from the
%          ''fontawsome5'' \pack
%     #3 : (key-val options)
%          :see: l3keys(tutodoc / version-n-change / topic / options)
%
%     :action: this environment prints some \infos about specific changes
%              achieved in a new version (no special formatting is applied).
%              Key-val options allow to add a date \andor a \nbver with
%              a specific color if needed.
%%%
\NewDocumentEnvironment{tdoctopic}{ m D<>{} O{} }{
  \IfBlankT{#1}{
    \msg_fatal:nn { tutodoc ~ (version-n-change) }
      { version-n-change : topic-missing-title }
  }

  \keys_set:nn { tutodoc / version-n-change / topic / options } { #3 }

  \tl_clear:N      \l__tutodoc_topic_all_user_options_tl
  \tl_set_eq:NN    \l__tutodoc_topic_all_user_options_tl \l_tutodoc_topic_version_tl
  \tl_put_right:Nn \l__tutodoc_topic_all_user_options_tl { \l_tutodoc_topic_date_tl }

  \group_begin:
    \color{\tl_use:N \l_tutodoc_topic_what_color_tl}

    \ifcsundef{g__tutodoc_topic_change_seq}{{}
% Icon used by the theme.
      \tutodoc@what@change@paragraph{
        \color{\tl_use:N \l_tutodoc_topic_what_color_tl}
        \IfBlankF{#2}{\tdocicon{#2}}
        \textsc{#1.}
      }
    }{
% No icon used by the theme.
      \smallskip
      {
        \normalfont\normalsize\bfseries\sffamily
        \textsc{#1.}
      }
    }

% A date and/or a version.
    \exp_args:Ne \IfBlankF{\l__tutodoc_topic_all_user_options_tl}{
      \exp_args:NNee \tutodoc@new@change@margin
        {\l_tutodoc_topic_when_color_tl}
        {\l_tutodoc_topic_version_tl}
        {\l_tutodoc_topic_date_tl}
        {\tutodoc@version@date@vertical@sep@len}
        {\tutodoc@version@date@vertical@offset@len}
    }

    \begin{itemize}
}{
    \end{itemize}
  \group_end:
}


% ---------------------- %
% -- CLASSICAL TOPICS -- %
% ---------------------- %

%%%
% prototype::
%     :see: env.tdoctopic
%
%     :action: ''key/value'' iteration over ''\g__tutodoc_topic_change_prop''
%              to build topic-like \envs using the \env ''tdoctopic''
%              (the title respects the locale settings).
%%%
\ifcsundef{g__tutodoc_topic_change_seq}{
  \prop_map_inline:Nn \g__tutodoc_topic_change_prop {
    \NewDocumentEnvironment{ tdoc#1 } { O{} } {
      \begin{tdoctopic}{ \use:c { tutodoc@trans@chges@#1 } } < #2 > [##1]
    }{
      \end{tdoctopic}
    }
  }
}{
  \seq_map_inline:Nn \g__tutodoc_topic_change_seq {
    \NewDocumentEnvironment{ tdoc#1 } { O{} } {
      \begin{tdoctopic}{ \use:c { tutodoc@trans@chges@#1 } } [##1]
    }{
      \end{tdoctopic}
    }
  }
}


%%%
% prototype::
%     #1 : (color-content)
%          the color of the full content
%     #2 : (short-desc)
%          a short text expected to indicate the very first version of a project.
%
%     :action: the short text printed will be preceded by a pretty anchor icon.
%%%
\NewDocumentCommand{ \tdocstartproj }{
  O{tutodoc@text@color}
  m
} {
  \group_begin:
    \color{#1}
    \ifcsundef{g__tutodoc_topic_change_seq}{
% Icon used.
      \tdocicon{\tutodoc@changes@start@project@icon}
    }{
% No icon used.
      \raisebox{4pt}{\normalfont\tiny\bfseries\sffamily[Init]}\kern2pt
    }

    #2
  \group_end:
}

\ExplSyntaxOff



% ================ %
% == DECORATION == %
% ================ %

% refs::
%    + https://tex.stackexchange.com/a/130529/6880
%      (for the leaders trick)
%    + https://tex.stackexchange.com/a/269887/6880
%      (for the \hrule width)
%    + https://tex.stackexchange.com/a/729710/6880
%      (centering the \hrule)

\newlength{\tutodoc@vertical@space@deco@len}
\setlength{\tutodoc@vertical@space@deco@len}{\dimeval{2\medskipamount+1.25pt}}


%%%
% prototype::
%     :action: this macro draws a centered horizontal rule with a height
%              of qty::''0.75 pt'', and a width equal to half of the current
%              text width, and extra vertical spaces are added above and
%              below the rule.
%
%     :see: len.tutodoc@vertical@space@deco@len
%%%
\newcommand{\tdocsep}{
  \par
  \cleaders
    \vbox to \tutodoc@vertical@space@deco@len{
      \vfill\centerline{\vrule width 0.5\hsize height 0.75pt}\vfill
    }\vskip\tutodoc@vertical@space@deco@len
}
