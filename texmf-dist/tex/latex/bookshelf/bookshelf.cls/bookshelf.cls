%%
%% This is file `bookshelf.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bookshelf.dtx  (with options: `class')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from bookshelf.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file bookshelf.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{bookshelf}
[2024/10/09 v1.2 Turn your bibliography into a bookshelf image]
\RequirePackage{fix-cm}
  \PassOptionsToPackage{svgnames}{xcolor}
%%
%% ******************************************************************
%%
%% Options
\def\SIL@paper{a0paper}%
\DeclareOption{a0paper}{%
    \def\SIL@paper{a0paper}%
    \setlength\paperheight {1189mm}%
    \setlength\paperwidth  {841mm}}
\DeclareOption{a1paper}{%
    \def\SIL@paper{a1paper}%
    \setlength\paperheight {841mm}%
    \setlength\paperwidth  {594mm}}
\DeclareOption{a2paper}{%
    \def\SIL@paper{a2paper}%
    \setlength\paperheight {594mm}%
    \setlength\paperwidth  {420mm}}
\DeclareOption{a3paper}{%
    \def\SIL@paper{a3paper}%
    \setlength\paperheight {420mm}%
    \setlength\paperwidth  {297mm}}
\DeclareOption{a4paper}{%
    \def\SIL@paper{a4paper}%
    \setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}{%
    \def\SIL@paper{a5paper}%
    \setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}{%
    \def\SIL@paper{b5paper}%
    \setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}{%
    \def\SIL@paper{letterpaper}%
    \setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}{%
    \def\SIL@paper{legalpaper}%
    \setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}{%
    \def\SIL@paper{executivepaper}%
    \setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{ledgerpaper}{%
    \def\SIL@paper{ledgerpaper}%
    \setlength\paperheight {17in}%
    \setlength\paperwidth  {11in}}
\DeclareOption{tabloidpaper}{%
    \def\SIL@paper{tabloidpaper}%
    \setlength\paperheight {17in}%
    \setlength\paperwidth  {11in}}
\def\SIL@orient{landscape}%
\DeclareOption{landscape}{%
    \def\SIL@orient{landscape}%
    \setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{portrait}{%
    \def\SIL@orient{}}
%%
%% ******************************************************************
%%
%% Load the document base class
\DeclareOption*{\ClassWarning{bookshelf}{%
    Unknown option `\CurrentOption', please RTFM}}
\ProcessOptions\relax
\LoadClass{report}
%%
%% Packages required for the class or package
%%
%% Font specification setup for use with \XeLaTeX{}.
\RequirePackage{fontspec}%
%% Required for calculations involving lengths or counters, such as changes to widths for margin adjustment.
\RequirePackage{calc}%
%% Used for fixed-point calculations
\RequirePackage{fp}%
%% Provide for graphics (PNG, JPG, or PDF format (only) for pdflatex; EPS format (only) for standard \LaTeX{}).
\RequirePackage{graphicx}%
%% Provide color.
\RequirePackage{xcolor}%
  \@ifundefined{T}{%
    \newcommand{\T}[2]{{\fontencoding{T1}%
      \selectfont#2}}}{}
%% Add picture commands (or backgrounds) to every page.
\RequirePackage{eso-pic}%
%% Package for establishing margins and text area.
\RequirePackage[\SIL@paper,\SIL@orient,nohead,
  nofoot,margin=1cm]{geometry}%
%%
%% ******************************************************************
%%
%% Non-package resources
\input{random.tex}
%%
%% ******************************************************************
%%
%% The code
\newcounter{SIL@maxfont}
\newcounter{SIL@fontsel}
\input{pickfont.tex}
\newcounter{SIL@maxcolno}
\input{bookshelf-svgnam.tex}
\newcounter{SIL@loopcount}
\newcounter{SIL@maxloop}
\newcounter{SIL@bgcolno}
\newcounter{SIL@fgcolno}
\newlength{\SIL@splitpoint}
\setlength{\SIL@splitpoint}{0.6pt}
\def\SIL@bgcol{White}
\def\SIL@fgcol{Black}
\newlength{\SIL@bgval}
\newlength{\SIL@fgval}
\newlength{\SIL@bgfgdiff}
\newif\ifSIL@notyetcols
\pagecolor{BurlyWood}
\AddToShipoutPictureBG{%
 \AtTextLowerLeft{\color{SaddleBrown}%
   \rule[-\footskip]{\textwidth}{%
     \dimexpr\textheight+\footskip}}}
\newlength{\SIL@bookheight}
\newlength{\SIL@bookwidth}
\newlength{\SIL@minbookwidth}
\newlength{\SIL@maxbookwidth}
\newlength{\SIL@minbookheight}
\newlength{\SIL@maxbookheight}
\newlength{\SIL@titlewidth}
\newlength{\SIL@authorwidth}
\newlength{\SIL@titleheight}
\newlength{\SIL@authorheight}
\newlength{\SIL@scaledtitle}
\newlength{\SIL@heightfortitle}
\newbox\SIL@titlebox
\newif\ifSIL@topauthor
\newif\ifSIL@titleoneline
\newcounter{SIL@scale}
\def\SIL@scaleint#1.#2\sentinel{%
   \setcounter{SIL@scale}{#1}}
\fboxsep1em\fboxrule.1pt
\pagestyle{empty}
\def\SIL@fittext#1#2#3#4{%
  \@tempdima=#2\relax
  \edef\SIL@W{\strip@pt\@tempdima}%
  \@tempdima=#3\relax
  \edef\SIL@H{\strip@pt\@tempdima}%
  \setbox#4=\hbox{\raggedright\noindent#1}%
  \@tempdima=\wd#4\relax
  \edef\SIL@w{\strip@pt\@tempdima}%
  \ifdim#2>\@tempdima\relax
    \FPeval\SIL@S{\SIL@W/\SIL@w}%
    \typeout{Text fits in one line: have H=\SIL@w pt, want \SIL@W pt}%
    \typeout{Trying S=\SIL@S}%
  \else
    \typeout{Text does not fit in one line}%
    \def\SIL@S{1}%
    \FPeval\SIL@w{\SIL@W/\SIL@S}%
    \setbox#4=\vbox{\hsize=\SIL@w pt\relax
      \raggedright\noindent#1\vskip0pt}%
    \@tempdima=\ht#4\relax
    \edef\SIL@h{\strip@pt\@tempdima}%
    \@tempdima = \SIL@S \@tempdima\relax
    \typeout{Trying S=\SIL@S.  Got H=\the\@tempdima.  Want \SIL@H pt}%
    \FPeval\SIL@S{\SIL@H/\SIL@h}%
  \fi
  \FPmax\SIL@S\SIL@S{1}%
  \FPeval\SIL@w{\SIL@W/\SIL@S}%
  \setbox#4=\vbox{\hsize=\SIL@w pt\relax
    \raggedright\noindent#1\vskip0pt}%
  \@tempdima=\ht#4\relax
  \edef\SIL@h{\strip@pt\@tempdima}%
  \@tempdima = \SIL@S \@tempdima\relax
  \typeout{Trying S=\SIL@S.  Got H=\the\@tempdima.  Want \SIL@H pt}%
  \ifdim\@tempdima>#3\relax
    \loop
      \FPeval\SIL@S{0.95*\SIL@S}%
      \FPeval\SIL@w{\SIL@W/\SIL@S}%
      \setbox#4=\vbox{\hsize=\SIL@w pt\relax
        \raggedright\noindent#1\vskip0pt}%
      \@tempdima=\ht#4\relax
      \edef\SIL@h{\strip@pt\@tempdima}%
      \@tempdima = \SIL@S \@tempdima\relax
      \typeout{Trying S=\SIL@S.  Got H=\the\@tempdima.  Want \SIL@H pt}%
    \ifdim\@tempdima>#3\repeat
  \fi
  \setbox#4=\vbox to #3{\hsize=#2\relax
    \vfill
    \noindent
    \scalebox{\SIL@S}{\vbox{\hsize=\SIL@w pt\relax
        \raggedright\noindent#1\vskip0pt}}%
    \vfill}%
}
\ExplSyntaxOn
\prg_new_conditional:Nnn \__SIL_primitive_font_glyph_if_exists:n  {TF,F}
  {
    \tex_iffontchar:D \SILmfont `#1 \scan_stop:
      \prg_return_true:
    \else:
      \prg_return_false:
    \fi:
  }
\prg_new_conditional:Nnn \__SIL_can_typeset:n {TF}
  {
   \typeout{Trying ~ to ~ typeset ~ #1}
    \bool_set_true:N \l_tmpa_bool
    \str_map_inline:nn {#1} {
      \__SIL_primitive_font_glyph_if_exists:nTF {##1} {}{
        \bool_set_false:N \l_tmpa_bool
        \typeout{Cannot ~ typeset ~ ##1}
        \str_map_break:
      }
    }
    \bool_if:nTF \l_tmpa_bool {\prg_return_true:} {\prg_return_false:}
}

\cs_generate_variant:Nn \__SIL_can_typeset:nTF {x}

\NewDocumentCommand\CanTypesetTF { m m m}{
  \__SIL_can_typeset:xTF{#1}{#2}{#3}
}
\ExplSyntaxOff
\def\SIL@maxfonttries{100}
\newif\ifSIL@fontfound
\ExplSyntaxOn
\seq_new:N \l__SIL_fontstack
\NewDocumentCommand\AddFontToStack {m} {%
  \seq_gput_right:Ne \l__SIL_fontstack {#1}
}
\NewDocumentCommand\ReuseFont {} {
  \seq_rand_item:N \l__SIL_fontstack
}
\ExplSyntaxOff
\newcount\SIL@num@fontsel@files
\SIL@num@fontsel@files=0
\def\SIL@max@fontsel@files{5500}
\newcommand{\makebook}[2]{%
  \typeout{^^JTypesetting #1---#2}%
  \setcounter{SIL@maxloop}{10}%
  \setcounter{SIL@loopcount}{0}%
  \setlength{\SIL@minbookwidth}{5mm}%
  \setlength{\SIL@maxbookwidth}{20mm}%
  \setlength{\SIL@minbookheight}{70mm}%
  \setlength{\SIL@maxbookheight}{110mm}%
  \setlength{\SIL@bookwidth}{0pt}%
  \setlength{\SIL@bookheight}{0pt}%
  \setlength{\SIL@heightfortitle}{0pt}%
  \SIL@topauthorfalse
  \loop
    \addtocounter{SIL@loopcount}{1}%
    \typeout{Try \theSIL@loopcount}%
    \setrannum{\c@SIL@bgcolno}{1}{%
      \c@SIL@maxcolno}%
    \typeout{BG=\theSIL@bgcolno}%
    \setrannum{\c@SIL@fgcolno}{1}{%
      \c@SIL@maxcolno}%
    \typeout{FG=\theSIL@fgcolno}%
    \setlength{\SIL@bgval}{%
      \SIL@svgcolval{\theSIL@bgcolno}pt}%
    \typeout{BGval=\the\SIL@bgval}%
    \setlength{\SIL@fgval}{%
      \SIL@svgcolval{\theSIL@fgcolno}pt}%
    \typeout{FGval=\the\SIL@fgval}%
    \setlength{\SIL@bgfgdiff}{%
      \SIL@bgval - \SIL@fgval}%
    \typeout{Split gap is \the\SIL@bgfgdiff}%
    \ifdim\SIL@bgfgdiff<0pt
      \setlength{\SIL@bgfgdiff}{%
        \SIL@fgval - \SIL@bgval}%
      \typeout{Using absolute value
        \the\SIL@bgfgdiff}%
    \fi
    \ifdim\SIL@bgval<\SIL@splitpoint
      \ifdim\SIL@fgval>\SIL@splitpoint
        \ifdim\SIL@bgfgdiff>0.2pt
          \SIL@notyetcolsfalse
        \else
          \SIL@notyetcolstrue
        \fi
      \else
        \SIL@notyetcolstrue
      \fi
    \else
      \ifdim\SIL@fgval<\SIL@splitpoint
        \ifdim\SIL@bgfgdiff>0.2pt
          \SIL@notyetcolsfalse
        \else
          \SIL@notyetcolstrue
        \fi
      \else
        \SIL@notyetcolstrue
      \fi
    \fi
    \typeout{BG=\theSIL@bgcolno,
             FG=\theSIL@fgcolno}%
    \ifnum\c@SIL@loopcount>\c@SIL@maxloop
      \SIL@notyetcolsfalse
    \fi
  \ifSIL@notyetcols\repeat
  \def\SIL@bgcol{\SIL@svgcolname{%
      \theSIL@bgcolno}}%
  \def\SIL@fgcol{\SIL@svgcolname{%
      \theSIL@fgcolno}}%
  \ifnum\c@SIL@loopcount>\c@SIL@maxloop
    \typeout{Using default colors after \the\c@SIL@maxloop\space attempts}%
    \def\SIL@bgcol{Black}%
    \def\SIL@fgcol{White}%
  \fi
  \typeout{BG=\SIL@bgcol, FG=\SIL@fgcol}%
  \c@SIL@loopcount=1\relax
  \loop
    \ifnum\SIL@num@fontsel@files<\SIL@max@fontsel@files
      \advance\SIL@num@fontsel@files by 1\relax
      \typeout{Opening new fontsel file, counter=\the\SIL@num@fontsel@files}%
      \setrannum{\c@SIL@fontsel}{1}{\c@SIL@maxfont}%
      \AddFontToStack{\the\c@SIL@fontsel}%
    \else
      \typeout{Reusing fontsel file}%
      \expandafter\c@SIL@fontsel\ReuseFont\relax
    \fi
    \input{fontsel/\theSIL@fontsel.tex}\unskip%
    \typeout{Trying \SILmfontname, attempt \the\c@SIL@loopcount}%
    \CanTypesetTF{#2---#1}{\global
      \SIL@fontfoundtrue}{\global
      \SIL@fontfoundfalse}%
    \ifSIL@fontfound
      \c@SIL@loopcount=\SIL@maxfonttries\relax
    \else
      \addtocounter{SIL@loopcount}{1}%
    \fi
  \ifnum\c@SIL@loopcount<\SIL@maxfonttries\repeat
  \ifSIL@fontfound
  \typeout{Set in \SILmfontname}%
  \settowidth{\SIL@authorwidth}{%
              \SILmfont#1}%
  \typeout{Author width: \the\SIL@authorwidth}%
  \settoheight{\SIL@authorheight}{%
               \SILmfont#1}%
  \typeout{Author height: \the\SIL@authorheight}%
  \ifdim\SIL@authorwidth<.9\SIL@maxbookwidth
    \typeout{Author width is less than 90\%
             of \the\SIL@maxbookwidth}%
    \setlength{\SIL@bookwidth}{%
               1.1\SIL@authorwidth}%
    \typeout{Book width set to \the\SIL@bookwidth}%
    \ifdim\SIL@bookwidth<\SIL@minbookwidth
      \setlength{\SIL@bookwidth}{%
                 \SIL@minbookwidth}%
      \typeout{Book width reset to min
               \the\SIL@minbookheight}%
    \fi
    \SIL@topauthortrue
  \else
    \typeout{Author won't fit in .9 of
             \the\SIL@maxbookwidth}%
  \fi
  \typeout{Limits: width=\the\SIL@minbookwidth
              –\the\SIL@maxbookwidth;
                   height=\the\SIL@minbookheight
              –\the\SIL@maxbookheight}%
  \setrandim{\SIL@bookheight}%
            {\SIL@minbookheight}%
            {\SIL@maxbookheight}%
  \typeout{Height generated as
           \the\SIL@bookheight}%
  \setlength{\SIL@heightfortitle}%
            {.9\SIL@bookheight}%
  \typeout{Height available for title (90\%):
           \the\SIL@heightfortitle}%
  \ifSIL@topauthor
    \typeout{Width set because author fits:
             \the\SIL@bookwidth}%
    \addtolength{\SIL@heightfortitle}%
                {-1.2\SIL@authorheight}%
    \typeout{Height available for title reset to
             \the\SIL@heightfortitle}%
  \else
  \setrandim{\SIL@bookwidth}%
            {\SIL@minbookwidth}%
            {\SIL@maxbookwidth}%
  \typeout{Width generated as
           \the\SIL@bookwidth}%
  \fi
  \leavevmode\vbox{\hsize\SIL@bookwidth
    \advance\hsize by2\fboxsep
    \advance\hsize by2\fboxrule
  \fcolorbox{black}{\SIL@bgcol}{%
    \ifSIL@topauthor
      \typeout{Setting with top author}%
      \vbox to\SIL@bookheight{\hsize\SIL@bookwidth
        \typeout{Spine is a vbox to
          \the\SIL@bookheight,
          hsize=\the\SIL@bookwidth}%
        \centering
        \SILmfont\color{\SIL@fgcol}%
        #1%
        \par\vfill
        \SIL@fittext{\color{\SIL@fgcol}\SILmfont
          #2}{\SIL@heightfortitle}{\SIL@bookwidth}%
        {\SIL@titlebox}%
        \rotatebox{90}{\box\SIL@titlebox}%
        }%
    \else
      \typeout{Setting author inline to title}%
      \vbox to\SIL@bookheight{\hsize\SIL@bookwidth
        \SIL@fittext{\color{\SIL@fgcol}\SILmfont
          #1\quad
          ---\quad#2}{\SIL@bookheight}{\SIL@bookwidth}%
        {\SIL@titlebox}%
        \rotatebox{90}{\box\SIL@titlebox}%
      }%
    \fi
  }%
  \\\fboxsep0pt\fboxrule0pt%
  \colorbox{BurlyWood}{\hbox to\hsize{%
      \hfil\vrule height3mm depth6mm width0pt
      \normalfont\scriptsize\theSIL@fontsel\hfil}}%
   }%
   \penalty0
\else % font not found
     \typeout{Did not find font for #1--#2}%

\fi}
\raggedright

\endinput
%%
%% End of file `bookshelf.cls'.
