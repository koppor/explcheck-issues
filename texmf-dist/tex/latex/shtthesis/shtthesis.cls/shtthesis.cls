% shtthesis, an unofficial LaTeX thesis template for ShanghaiTech University.
% Copyright (C) 2022 Li Rundong <rundong.001@gmail.com>
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>
% ==============================================================================
% Identification
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\newcommand\version{0.3.3}
\newcommand\versiondate{2022/03/03}
\ProvidesClass{shtthesis}[%
  \versiondate\space%
  v\version\space%
  An Unofficial Thesis Template for ShanghaiTech University%
]
\hyphenation{sht-thesis}
\hyphenation{Sht-Thesis}
\newcommand\shtthesis{\textup{\sffamily shtthesis}}
\newcommand\ShtThesis{\textup{\sffamily ShtThesis}}
\def\sht@compile@err@help{%
  Pass `-pdflua' or `-pdfxe' option to `latexmk' on compilation.%
}
\newcommand\sht@error[2][\sht@compile@err@help]{\ClassError{shtthesis}{#2}{#1}}
\newcommand\sht@warning[1]{\ClassWarning{shtthesis}{#1}}
\RequirePackage{iftex}
\ifluatex\else\ifxetex\else%
  \sht@error{shtthesis only works with LuaLaTeX or XeLaTeX}%
\fi\fi
% ==============================================================================
% Options and Declarations
% ==============================================================================
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\RequirePackage{datetime}
% ------------------------------------------------------------------------------
%   Define \shtsetup command
%
%   Following key-value setup mechanism is adapted from `thuthesis'.
%   thuthesis (https://github.com/xueruini/thuthesis) is licensed under the
%   conditions of the LaTeX Project Public License, either version 1.3. 
% ------------------------------------------------------------------------------
\newcommand\shtsetup{%
  \kvsetkeys{sht}%
}
\newcommand\sht@define@key[1]{%
  \kvsetkeys{sht@key}{#1}%
}
\kv@set@family@handler{sht@key}{%
  \@namedef{sht@#1@@name}{#1}%
  \def\sht@@default{}%
  \def\sht@@choices{}%
  \kv@define@key{sht@value}{name}{%
    \@namedef{sht@#1@@name}{##1}%
  }%
  \kv@define@key{sht@value}{code}{%
    \@namedef{sht@#1@@code}{##1}%
  }%
  \@namedef{sht@#1@@check}{}%
  \@namedef{sht@#1@@code}{}%
  \@namedef{sht@#1@@hook}{%
    \expandafter\ifx\csname\@currname.\@currext-h@@k\endcsname\relax
      \@nameuse{sht@#1@@code}%
    \else
      \AtEndOfClass{%
        \@nameuse{sht@#1@@code}%
      }%
    \fi
  }%
  \kv@define@key{sht@value}{choices}{%
    \def\sht@@choices{##1}%
    \@namedef{sht@#1@@reset}{}%
    \@namedef{sht@#1@@check}{%
      \@ifundefined{%
        ifsht@\@nameuse{sht@#1@@name}@\@nameuse{sht@\@nameuse{sht@#1@@name}}%
      }{%
        \sht@error{Invalid value "#1 = \@nameuse{sht@\@nameuse{sht@#1@@name}}"}%
      }%
      \@nameuse{sht@#1@@reset}%
      \@nameuse{sht@\@nameuse{sht@#1@@name}@\@nameuse{sht@\@nameuse{sht@#1@@name}}true}%
    }%
  }%
  \kv@define@key{sht@value}{default}{%
    \def\sht@@default{##1}%
  }%
  \kvsetkeys{sht@value}{#2}%
  \@namedef{sht@\@nameuse{sht@#1@@name}}{}%
  \kv@set@family@handler{sht@choice}{%
    \ifx\sht@@default\@empty
      \def\sht@@default{##1}%
    \fi
    \expandafter\newif\csname ifsht@\@nameuse{sht@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname sht@#1@@reset\endcsname{%
      \@nameuse{sht@\@nameuse{sht@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{sht@choice}{\sht@@choices}%
  \expandafter\let\csname sht@\@nameuse{sht@#1@@name}\endcsname\sht@@default
  \expandafter\ifx\csname sht@\@nameuse{sht@#1@@name}\endcsname\@empty\else
    \@nameuse{sht@#1@@check}%
    \@nameuse{sht@#1@@hook}%
  \fi
  \kv@define@key{sht}{#1}{%
    \@namedef{sht@\@nameuse{sht@#1@@name}}{##1}%
    \@nameuse{sht@#1@@check}%
    \@nameuse{sht@#1@@hook}%
  }%
}
% ------------------------------------------------------------------------------
%   Options for \shtsetup
% ------------------------------------------------------------------------------
\sht@define@key{
  degree-name = {
    default = {工学博士},
    name    = degree@name,
  },
  degree-name* = {
    default = {Doctor~of~Philosophy},
    name    = degree@name@en,
  },
  language = {
    choices = {
      chinese,
      english,
    },
  },
  secret-level = {
    name = secret@level,
  },
  secret-year = {
    name = secret@year,
  },
  title = {
    default = {标题},
  },
  title* = {
    default = {Title},
    name    = title@en,
  },
  keywords,
  keywords* = {
    name = keywords@en,
  },
  author = {
    default = {姓名},
  },
  author* = {
    default = {Name of author},
    name    = author@en,
  },
  author-id = {
    default = {Id of author},
    name    = author@id,
  },
  entrance-year = {
    default = {Year of entrance},
    name    = entrance@year,
  },
  supervisor = {
    default = {导师姓名},
  },
  supervisor* = {
    default = {Name of supervisor},
    name    = supervisor@en,
  },
  supervisor-institution = {
    name = supervisor@institution,
  },
  supervisor-institution* = {
    name = supervisor@institution@en,
  },
  institution = {
    % default = {上海科技大学信息科学与技术学院},
  },
  institution* = {
    % default = {%
    %   School~of~Information~Science~and~Technology\\%
    %   ShanghaiTech~University%
    % },
    name = institution@en
  },
  discipline = {
    % default = {计算机科学与技术},
  },
  discipline* = {
    % default = {Computer Science and Technology},
    name = discipline@en,
  },
  discipline-level-1 = {
    default = {一级学科名称},
    name    = discipline@level@i,
  },
  discipline-level-1* = {
    default = {Name of Level-one Discipline},
    name    = discipline@level@i@en,
  },
  discipline-level-2 = {
    default = {二级学科名称},
    name    = discipline@level@ii,
  },
  discipline-level-2* = {
    default = {Name of Level-two Discipline},
    name    = discipline@level@ii@en,
  },
  date = {
    default = {\the\year~年~\the\month~月},
  },
  date* = {
    default = {\monthname,~\the\year},
    name = date@en,
  },
  clc,
  udc,
  id,
  anonymous-str = {
    name = anonymous@str,
    default = {***},
  },
  bib-resource = {
    name = bib@resource,
  }
}
% ------------------------------------------------------------------------------
%   Class options
% ------------------------------------------------------------------------------
\SetupKeyvalOptions{
  family = sht,
  prefix = sht@,
}
\newif\ifsht@undergraduate
\newif\ifsht@graduate
\newif\ifsht@degree@set
\sht@degree@setfalse
\newcommand\sht@check@degree@set{%
  \ifsht@degree@set%
    \sht@error{you can only set degree once}%
  \else%
    \sht@degree@settrue%
  \fi%
}
\DeclareVoidOption{bachelor}{%
  \sht@check@degree@set%
  \sht@undergraduatetrue%
  \sht@graduatefalse%
  \def\sht@degree{bachelor}%
}
\DeclareVoidOption{master}{%
  \sht@check@degree@set%
  \sht@undergraduatefalse%
  \sht@graduatetrue%
  \def\sht@degree{master}%
}
\DeclareVoidOption{doctor}{%
  \sht@check@degree@set%
  \sht@undergraduatefalse%
  \sht@graduatetrue%
  \def\sht@degree{doctor}%
}
\DeclareBoolOption{anonymous}
\DeclareBoolOption{print}
\DeclareBoolOption{comfort}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\ifsht@degree@set%
\else%
  \sht@error{you have not set degree (bachelor, master or doctor) yet}%
\fi%
% ------------------------------------------------------------------------------
%   Load minimum mandatory packages
% ------------------------------------------------------------------------------
\ifsht@undergraduate
  \PassOptionsToClass{zihao = 5}{ctexbook}
  \PassOptionsToPackage{style = gb7714-2015}{biblatex}
\else
  \PassOptionsToClass{zihao = -4}{ctexbook}
  \PassOptionsToPackage{style = gb7714-2015ay}{biblatex}
\fi
\PassOptionsToClass{
  UTF8,
  a4paper,
  twoside, 
  openany, 
  scheme = plain,
}{ctexbook}
\PassOptionsToPackage{
  natbib = true,
  hyperref = manual,
  backend = biber,
  gbpub = false,
  gbcitelocal = chinese,
  sortcites = false,
}{biblatex}
\LoadClass{ctexbook}
\RequirePackage{expl3}
\RequirePackage{xparse}
\RequirePackage[hyperref, table]{xcolor}
\RequirePackage{geometry}
\RequirePackage{calc}
\RequirePackage{verbatim}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
\RequirePackage[normalem]{ulem}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{tocvsec2}
\RequirePackage{letltxmacro}
\RequirePackage{fontspec}
\RequirePackage{caption}
\RequirePackage[shortlabels, inline]{enumitem}
\RequirePackage{mathtools}
\RequirePackage{amsthm}
\RequirePackage[mathbf=sym]{unicode-math}
\RequirePackage{biblatex}
\AtEndPreamble{
  \RequirePackage{hyperref}
  \addbibresource{\sht@bib@resource}
  \BiblatexManualHyperrefOn
  \hypersetup{
    pdfencoding = auto,
    psdextra = true,
    bookmarksnumbered = true,
    pdftitle = {\sht@flat@title},
    pdfauthor = {\sht@author},
  }
  \ifsht@print
    \hypersetup{
      hidelinks,
      colorlinks = false,
    }
  \else
    % `default' color scheme from `fduthesis'
    \definecolor{fdu@link}{HTML}{990000}
    \definecolor{fdu@url}{HTML}{0000B2}
    \definecolor{fdu@cite}{HTML}{007F00}
    \hypersetup{
      colorlinks = true,
      linkcolor = fdu@link,
      urlcolor = fdu@url,
      citecolor = fdu@cite,
    }
  \fi
  \urlstyle{tt}
}
% ==============================================================================
% Format Specifications
% ==============================================================================
% ------------------------------------------------------------------------------
%   Basic information
% ------------------------------------------------------------------------------
\def\@title{\sht@title}
\def\@author{\sht@author}
\def\contentsname{目\hspace{1\ccwd}录}
\def\listfigurename{图形列表}
\def\listtablename{表格列表}
\def\appendixname{附录}
\def\indexname{索引}
\def\refname{参考文献}
\def\bibname{参考文献}
\def\tablename{表}
\def\figurename{图}
\definecolor{ShtRed}{RGB}{146,46,23}
\def\school@logo@missing{%
  校徽文件缺失，请至\href{https://github.com/lirundong/shtthesis/raw/v0.3/%
  shanghaitech-emblem.pdf}{项目主页}下载！%
}
% ------------------------------------------------------------------------------
%   Geometry and layouts
% ------------------------------------------------------------------------------
\def\binding@width{0.63cm}
\def\horizontal@margin{3.17cm}
\def\sht@head@logo@height{1.17cm}
\ifsht@print
  \geometry{
    inner = \horizontal@margin + \binding@width,
    outer = \horizontal@margin - \binding@width,
  }
\else
  \geometry{
    inner = \horizontal@margin,
    outer = \horizontal@margin,
  }
\fi
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
\setlength{\parindent}{2\ccwd}
\ifsht@undergraduate
  \linespread{1.3}
  \geometry{
    includeheadfoot,
    top = 1.5cm,
    bottom = 1.75cm,
    headheight = \sht@head@logo@height,
    headsep = \baselineskip,
    footskip = 2.54cm - 1.75cm,
  }
\else
  \linespread{1.6}
  \geometry{
    top = 2.54cm,
    bottom = 2.54cm,
    headheight = 12pt,
    headsep = 17.5pt,
    footskip = 2.54cm - 1.75cm,
  }
\fi
\raggedbottom
% ------------------------------------------------------------------------------
%   Headers and footers
% ------------------------------------------------------------------------------
\def\sht@flat@title{\renewcommand\\{\space} \sht@title}
\def\sht@flat@title@upper@en{%
  \renewcommand\\{\space}%
  \MakeUppercase{\sht@title@en}%
}
\newcommand\sht@head@logo{%
  \IfFileExists{shanghaitech-emblem.pdf}{%
    \includegraphics[height=\sht@head@logo@height]{shanghaitech-emblem.pdf}%
  }{%
    \fbox{%
      \begin{minipage}[b][\sht@head@logo@height][c]{0.4\columnwidth}%
        \zihao{-5}\bfseries\sffamily\color{ShtRed} \school@logo@missing%
      \end{minipage}%
    }%
  }
}
\pagestyle{fancy}
\fancypagestyle{Plain}{}
\fancypagestyle{RomanNumbered}{
  \fancyhf{}
  \pagenumbering{Roman}
  \fancyhead[OC]{\footnotesize\nouppercase\leftmark}
  \fancyhead[EC]{\footnotesize\nouppercase\sht@flat@title}
  \fancyfoot[C]{\footnotesize\thepage}
  \renewcommand{\headrulewidth}{0.8pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{LRNumbered}{
  \fancyhf{}
  \fancyhead[OC]{\footnotesize\nouppercase\leftmark}
  \fancyhead[EC]{\footnotesize\nouppercase\sht@flat@title}
  \fancyfoot[OR]{\footnotesize\thepage}
  \fancyfoot[EL]{\footnotesize\thepage}
  \renewcommand{\headrulewidth}{0.8pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{LRNumberedAppendix}{
  \fancyhf{}
  \fancyhead[OC]{\footnotesize 附\hspace*{1\ccwd}录}
  \fancyhead[EC]{\footnotesize\nouppercase\sht@flat@title}
  \fancyfoot[OR]{\footnotesize\thepage}
  \fancyfoot[EL]{\footnotesize\thepage}
  \renewcommand{\headrulewidth}{0.8pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{RomanNumberedWithLogo}{
  \fancyhf{}
  \pagenumbering{Roman}
  \fancyhead[L]{\sht@head@logo}
  \fancyhead[R]{\zihao{-5}\sffamily\sht@flat@title}
  \fancyfoot[C]{\footnotesize\thepage}
  \renewcommand{\headrulewidth}{0.8pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{MNNumberedWithLogo}{
  \fancyhf{}
  \fancyhead[L]{\sht@head@logo}
  \fancyhead[R]{\zihao{-5}\sffamily\sht@flat@title}
  \fancyfoot[C]{%
    \footnotesize%
    第~\thepage~页\hspace*{1\ccwd}共~\pageref*{LastPage}~页%
  }
  \renewcommand{\headrulewidth}{0.8pt}
  \renewcommand{\footrulewidth}{0pt}
}
\providecommand{\frontmatter}{}
\LetLtxMacro{\TmpFrontmatter}{\frontmatter}
\renewcommand{\frontmatter}{%
  \TmpFrontmatter%
  \ifsht@undergraduate%
    \pagestyle{RomanNumberedWithLogo}%
  \else%
    \pagestyle{RomanNumbered}%
  \fi%
}
\providecommand{\mainmatter}{}
\LetLtxMacro{\TmpMainmatter}{\mainmatter}
\renewcommand{\mainmatter}{%
  \TmpMainmatter%
  \renewcommand{\chaptermark}[1]{%
    \markboth{第~\thechapter~章\hspace{1\ccwd}##1}{}%
  }%
  \ifsht@undergraduate%
    \pagestyle{MNNumberedWithLogo}%
  \else%
    \pagestyle{LRNumbered}%
  \fi%
}
% ------------------------------------------------------------------------------
%   Font utilities
% ------------------------------------------------------------------------------
\newcommand\sht@fontset{\csname g__ctex_fontset_tl\endcsname}
\newcommand\currentfontset{\sht@fontset}
% ------------------------------------------------------------------------------
%   English fonts
% ------------------------------------------------------------------------------
\setmainfont{texgyretermes} [
  Extension      = .otf,
  UprightFont    = *-regular,
  BoldFont       = *-bold,
  ItalicFont     = *-italic,
  BoldItalicFont = *-bolditalic,
  Ligatures      = TeX,
]
\setsansfont{texgyreheros} [
  Extension      = .otf,
  UprightFont    = *-regular,
  BoldFont       = *-bold,
  ItalicFont     = *-italic,
  BoldItalicFont = *-bolditalic,
  Ligatures      = TeX,
]
\setmonofont{texgyrecursor} [
  Extension      = .otf,
  UprightFont    = *-regular,
  BoldFont       = *-bold,
  ItalicFont     = *-italic,
  BoldItalicFont = *-bolditalic,
  Ligatures      = CommonOff,
]
% ------------------------------------------------------------------------------
%   Chinese fonts
% ------------------------------------------------------------------------------
\ifthenelse{\equal{\sht@fontset}{windows}}{
  \def\fake@bold@factor{2.5}
  \setCJKmainfont{SimSun}[
    AutoFakeBold = \fake@bold@factor,
      ItalicFont = KaiTi,
  ]
  \setCJKsansfont{SimHei}[
    AutoFakeBold = \fake@bold@factor,
  ]
  \setCJKfamilyfont{zhsong}{SimSun}[
    AutoFakeBold = \fake@bold@factor,
  ]
  \setCJKfamilyfont{zhhei}{SimHei}[
    AutoFakeBold = \fake@bold@factor,
  ]
  \setCJKfamilyfont{zhkai}{KaiTi}[
    AutoFakeBold = \fake@bold@factor,
  ]
}{
  \ifthenelse{\equal{\sht@fontset}{mac}}{
    \setCJKmainfont{Songti SC}[
         UprightFont = * Regular,
            BoldFont = * Bold,
          ItalicFont = Kaiti SC Regular,
      BoldItalicFont = Kaiti SC Bold,
    ]
    \setCJKsansfont{Heiti SC}[
      UprightFont = * Light,
         BoldFont = * Medium,
    ]
    \setCJKfamilyfont{zhsong}{Songti SC}[
      UprightFont = * Regular,
         BoldFont = * Bold,
    ]
    \setCJKfamilyfont{zhhei}{Heiti SC}[
      UprightFont = * Light,
         BoldFont = * Medium,
    ]
    \setCJKfamilyfont{zhkai}{Kaiti SC}[
      UprightFont = * Regular,
         BoldFont = * Bold,
    ]
  }{
    \IfFontExistsTF{Noto Serif CJK SC}{
      \def\unix@songti{Noto Serif CJK SC}
    }{
      \IfFontExistsTF{Source Han Serif SC}{
        \def\unix@songti{Source Han Serif SC}
      }{
        \def\unix@songti{FandolSong}
      }
    }
    \IfFontExistsTF{Noto Sans CJK SC}{
      \def\unix@heiti{Noto Sans CJK SC}
    }{
      \IfFontExistsTF{Source Han Sans SC}{
        \def\unix@heiti{Source Han Sans SC}
      }{
        \def\unix@heiti{FandolHei}
      }
    }
    \edef\unix@heiti@medium@impl{\unix@heiti\space Medium}
    \edef\unix@heiti@bold@impl{\unix@heiti\space Bold}
    \IfFontExistsTF{\unix@heiti@medium@impl}{
      \def\unix@heiti@bold{\unix@heiti@medium@impl}
    }{
      \def\unix@heiti@bold{\unix@heiti@bold@impl}
    }
    \IfFontExistsTF{FZKai-Z03}{
      \def\unix@kaiti{FZKai-Z03}
    }{
      \def\unix@kaiti{FandolKai}
    }
    \IfFontExistsTF{FZFangSong-Z02}{
      \def\unix@fangsong{FZFangSong-Z02}
    }{
      \def\unix@fangsong{FandolFang}
    }
    \ifluatex
      \setCJKmainfont{\unix@songti}[ItalicFont=\unix@kaiti]
      \setCJKsansfont{\unix@heiti}[BoldFont=\unix@heiti@bold]
      \setCJKmonofont{\unix@fangsong}
      \setCJKfamilyfont{zhsong}{\unix@songti}
      \setCJKfamilyfont{zhhei}{\unix@heiti}[BoldFont=\unix@heiti@bold]
      \setCJKfamilyfont{zhkai}{\unix@kaiti}
      \setCJKfamilyfont{zhfs}{\unix@fangsong}
    \else
      \ifthenelse{\equal{\unix@songti}{FandolSong}}{
        \setCJKmainfont{FandolSong}[
          Extension   = .otf,
          UprightFont = *-Regular,
          BoldFont    = *-Bold,
          ItalicFont  = FandolKai-Regular,
        ]
        \setCJKfamilyfont{zhsong}{FandolSong}[
          Extension   = .otf,
          UprightFont = *-Regular,
          BoldFont    = *-Bold,
        ]
      }{
        \ifthenelse{\equal{\unix@kaiti}{FandolKai}}{
          \setCJKmainfont{\unix@songti}[
            ItalicFont  = FandolKai-Regular,
            ItalicFeatures = {Extension = .otf},
          ]
        }{
          \setCJKmainfont{\unix@songti}[ItalicFont=\unix@kaiti]
        }
        \setCJKfamilyfont{zhsong}{\unix@songti}
      }
      \ifthenelse{\equal{\unix@heiti}{FandolHei}}{
        \setCJKsansfont{FandolHei}[
          Extension   = .otf,
          UprightFont = *-Regular,
          BoldFont    = *-Bold,
        ]
        \setCJKfamilyfont{zhhei}{FandolHei}[
          Extension   = .otf,
          UprightFont = *-Regular,
          BoldFont    = *-Bold,
        ]
      }{
        \setCJKsansfont{\unix@heiti}[BoldFont=\unix@heiti@bold]
        \setCJKfamilyfont{zhhei}{\unix@heiti}[BoldFont=\unix@heiti@bold]
      }
      \ifthenelse{\equal{\unix@kaiti}{FandolKai}}{
        \setCJKfamilyfont{zhkai}{FandolKai}[
          Extension   = .otf,
          UprightFont = *-Regular,
        ]
      }{
        \setCJKfamilyfont{zhkai}{\unix@kaiti}
      }
      \ifthenelse{\equal{\unix@fangsong}{FandolFang}}{
        \setCJKfamilyfont{zhfs}{FandolFang}[
          Extension   = .otf,
          UprightFont = *-Regular,
        ]
        \setCJKmonofont{FandolFang}[
          Extension   = .otf,
          UprightFont = *-Regular,
        ]
      }{
        \setCJKmonofont{\unix@fangsong}
        \setCJKfamilyfont{zhfs}{\unix@fangsong}
      }
    \fi
    \providecommand{\songti}{\CJKfamily{zhsong}}
    \providecommand{\heiti}{\CJKfamily{zhhei}}
    \providecommand{\kaishu}{\CJKfamily{zhkai}}
    \providecommand{\fangsong}{\CJKfamily{zhfs}}
  }
}
% ------------------------------------------------------------------------------
%   Math content specifications
%
%   Following setup is adapted from `thuthesis'
% ------------------------------------------------------------------------------
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\protected\def\le{\leqslant}
\protected\def\ge{\geqslant}
\AtBeginDocument{%
  \renewcommand\leq{\leqslant}%
  \renewcommand\geq{\geqslant}%
}
\removenolimits{%
  \int\iint\iiint\iiiint\oint\oiint\oiiint
  \intclockwise\varointclockwise\ointctrclockwise\sumint
  \intbar\intBar\fint\cirfnint\awint\rppolint
  \scpolint\npolint\pointint\sqint\intlarhk\intx
  \intcap\intcup\upint\lowint
}
\AtBeginDocument{%
  \renewcommand{\Re}{\operatorname{Re}}%
  \renewcommand{\Im}{\operatorname{Im}}%
}
\newcommand\bm{\symbf}
\renewcommand\boldsymbol{\symbf}
\newcommand\square{\mdlgwhtsquare}
\AtBeginDocument{%
  \renewcommand\checkmark{\ensuremath{✓}}%
}
\allowdisplaybreaks[4]
\ifsht@graduate
  \newtagform{dots}{\ldots\ (}{)}
  \usetagform{dots}
  \renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
\fi
% ------------------------------------------------------------------------------
%   Math fonts
% ------------------------------------------------------------------------------
\IfFontExistsTF{XITSMath-Regular.otf}{
  \def\sht@math@font{XITSMath-Regular.otf}
}{
  \def\sht@math@font{xits-math.otf}
}
\setmathfont{\sht@math@font}[
  StylisticSet = 8, % upright integral variants, please refer to stix2-otf doc
]
% please refer to "Caligraphic vs. Script variants" section of unicode-math doc
\setmathfont{\sht@math@font}[
  range        = {cal, bfcal},
  StylisticSet = 1,
]
\setmathfont{\sht@math@font}[
  range        = {scr, bfscr},
  StylisticSet = 2,
]
% ------------------------------------------------------------------------------
%   Math environmrnts
% ------------------------------------------------------------------------------
\theoremstyle{plain}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{corollary}{推论}[theorem]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\theoremstyle{definition}
\newtheorem{definition}{定义}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{problem}{问题}[chapter]
\theoremstyle{remark}
\newtheorem{remark}{注}[chapter]
\renewcommand*{\proofname}{证明}
\expandafter\patchcmd\csname\string\proof\endcsname{\@addpunct{.}}%
  {\@addpunct{\emph{：}}}{}{}
% ------------------------------------------------------------------------------
%   Utility functions for ToC and bookmarks
% ------------------------------------------------------------------------------
\newcommand{\artxmaincnt}{%
  \ifcsname c@chapter\endcsname%
    chapter%
  \else%
    section%
  \fi%
}
\long\def\artxaux#1{}
\newcommand{\intotocnostar}[3]{%
  % [<\chapter|...>,<*>,<title>]
  #1#2{%
    \phantomsection%
    \addcontentsline{toc}{\expandafter\artxaux\string#1}{#3}%
    #3%
  }
  \markboth{\MakeUppercase{#3}}{}%
}
\newcommand{\intotocstar}[3][\artxmaincnt]{%
  % [<chapter|...>,<extra commands>,<title>]
  #2%
  \phantomsection%
  \addcontentsline{toc}{#1}{#3}%
  \markboth{\MakeUppercase{#3}}{}%
}
\newcommand{\intotoc}{\@ifstar{\intotocstar}{\intotocnostar}}
\newcommand{\intobmknostar}[4][0]{%
  % [<level>,<\chapter|...>,<*>,<title>]
  #2#3{%
    \phantomsection%
    \Hy@writebookmark%
    {}%
    {#4}%
    {\@currentHref}%
    {#1}%
    {toc}%
    #4%
  }%
  \markboth{\MakeUppercase{#4}}{}%
}
\newcommand{\intobmkstar}[3][0]{%
  % [<level>,<extra commands>,<title>]
  #2%
  \phantomsection%
  \Hy@writebookmark%
  {}%
  {#3}%
  {\@currentHref}%
  {#1}%
  {toc}%
  \markboth{\MakeUppercase{#3}}{}%
}
\newcommand{\intobmk}{\@ifstar{\intobmkstar}{\intobmknostar}}
% \cleardoublepage only works on graduate or undergraduate print mode
\LetLtxMacro{\OriginCleardoublepage}{\cleardoublepage}
\renewcommand{\cleardoublepage}{%
  \ifthenelse{\boolean{sht@undergraduate} \AND \NOT\boolean{sht@print}}{%
    \relax\clearpage%
  }{%
    \OriginCleardoublepage%
  }%
}
% ------------------------------------------------------------------------------
%   Table of contents, figures and tables
% ------------------------------------------------------------------------------
\DeclareCaptionFont{wuhaocuti}{\zihao{5}\bfseries}
\captionsetup{
  format = plain,
  hangindent = 2.0em,
  labelsep = quad,
  font = {wuhaocuti},
}
\ifsht@undergraduate
  \captionsetup{
    skip = 6pt,
  }
  \def\sht@toc@chapter@fmt{\zihao{5}\rmfamily}
  \def\sht@toc@section@fmt{\zihao{5}\rmfamily}
\else
  \captionsetup{
    skip = 8pt,
  }
  \def\sht@toc@chapter@fmt{\zihao{4}\heiti}
  \def\sht@toc@section@fmt{\zihao{-4}\heiti}
\fi
\def\@dotsep{1.5mu}
\def\@pnumwidth{2em}
\def\@tocrmarg{2em}
\def\@chaptervspace{1ex}
% [<level>,<indent>,<numwidth>,<title>,<page>]
\renewcommand*{\@dottedtocline}[5]{
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode \sht@toc@section@fmt
    \@tempdima #3\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {#4}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
    \nobreak
    \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
    \par\penalty\@highpenalty}%
  \fi
}
% [<title>,<page>]
\renewcommand*{\l@part}[2]{
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
      \sht@toc@chapter@fmt #1
      \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
      \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
      \nobreak
      \global\@nobreaktrue
      \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi
}
% [<title>,<page>]
\renewcommand*{\l@chapter}[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \ifsht@undergraduate%
    \else%
      \vskip \@chaptervspace \@plus\p@%
    \fi%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \sht@toc@chapter@fmt
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi
}
\renewcommand*\l@section{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{2.8em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3em}{3.8em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{4em}{4.8em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{5em}{5.8em}}
\renewcommand*\l@figure{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@table{\@dottedtocline{1}{1em}{1.8em}}
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}
\newcommand{\makeindices}{%
  \begingroup%
  \linespread{1.2}%
  \hypersetup{linkcolor=black}%
  \intobmk*{\cleardoublepage}{\contentsname}%
  \tableofcontents%
  \ifsht@graduate%
    \intobmk*{\cleardoublepage}{\listfigurename}%
    \listoffigures%
    \intobmk*{\cleardoublepage}{\listtablename}%
    \listoftables%
  \fi%
  \endgroup%
}
% ------------------------------------------------------------------------------
%   Content specifications
% ------------------------------------------------------------------------------
\ctexset {
  chapter = {
    format = \bfseries\heiti\zihao{4}\linespread{1.0}\centering,
    nameformat = {},
    numberformat = \rmfamily,
    titleformat = {},
    name = {第, 章},
    number = \arabic{chapter},
    aftername = \hspace{0.75\ccwd},
    beforeskip = {7pt},
    afterskip = {18pt},
    pagestyle = Plain,
  },
  section = {
    format = \heiti\normalsize\linespread{1.0}\raggedright,
    nameformat = {},
    numberformat = \rmfamily,
    titleformat = {},
    aftername = \hspace{0.75\ccwd},
    beforeskip = {24pt},
    afterskip = {6pt},
  },
  subsection = {
    format = \heiti\normalsize\linespread{1.0}\raggedright,
    nameformat = {},
    numberformat = \rmfamily,
    titleformat = {},
    aftername = \hspace{0.75\ccwd},
    beforeskip = {12pt},
    afterskip = {6pt},
  },
  subsubsection = {
    format = \heiti\normalsize\linespread{1.0}\raggedright,
    nameformat = {},
    numberformat = \rmfamily,
    titleformat = {},
    aftername = \hspace{0.75\ccwd},
    beforeskip = {12pt},
    afterskip = {6pt},
  },
  paragraph = {
    indent = 2\ccwd,
    beforeskip = {0pt},
    afterskip = {0.75\ccwd},
  },
  punct = quanjiao,
  space = auto,
  autoindent = true,
}
\ifsht@undergraduate
  \newlength{\sht@section@indent}
  \ifsht@comfort
    \def\sht@chapter@fmt{\bfseries\sffamily\zihao{4}\linespread{1.0}\centering}
    \def\sht@section@fmt{\sffamily\zihao{-4}\linespread{1.0}\raggedright}
    \def\sht@subsection@fmt{\sffamily\zihao{5}\linespread{1.0}\raggedright}
    \setlength{\sht@section@indent}{0pt}
  \else
    \def\sht@chapter@fmt{\bfseries\sffamily\zihao{3}\linespread{1.0}\centering}
    \def\sht@section@fmt{\sffamily\zihao{4}\linespread{1.0}\raggedright}
    \def\sht@subsection@fmt{\rmfamily\zihao{-4}\linespread{1.0}\raggedright}
    \setlength{\sht@section@indent}{2\ccwd}
  \fi
  \ctexset{
    chapter = {
      format = \sht@chapter@fmt,
      number = \chinese{chapter},
      numberformat = {},
    },
    section = {
      format = \sht@section@fmt,
      numberformat = {},
      indent = \sht@section@indent,
      beforeskip = {18pt},
    },
    subsection = {
      format = \sht@subsection@fmt,
      numberformat = {},
      indent = \sht@section@indent,
    },
    subsubsection = {
      format = \sht@subsection@fmt,
      numberformat = {},
      indent = \sht@section@indent,
    }
  }
\fi
% ------------------------------------------------------------------------------
%   List environments
% ------------------------------------------------------------------------------
\newcommand{\textbf@with@colon}[1]{\textbf{#1：}}
\setlist{
  nosep,
  labelindent = 2\ccwd,
  labelwidth = *,
  labelsep = 0.5\ccwd,
  leftmargin = 0em,
  itemindent = *,
  listparindent = 2\ccwd,
}
\setlist[description]{
  labelsep = 0em,
  format = \normalfont\textbf@with@colon,
}
% ------------------------------------------------------------------------------
%   Quotation environments
% ------------------------------------------------------------------------------
\ExplSyntaxOn
\ctex_patch_cmd:Nnn \quotation { 1.5em } { 2 \ccwd }
\ExplSyntaxOff
\BeforeBeginEnvironment{quotation}{%
  \begingroup%
  \setlength\leftmargini{2\ccwd}%
}
\AtBeginEnvironment{quotation}{%
  \itshape%
}
\AfterEndEnvironment{quotation}{%
  \endgroup%
}
% ==============================================================================
% Cover Generation
% ==============================================================================
\def\ubox@right@shift{0.5\ccwd}
\def\content@left@shift{2.75\ccwd}
\def\cover@tab@entry@width{350pt}
\def\cover@tab@last@entry@width{\cover@tab@entry@width - 2\ccwd - 0.5\ccwd}
\def\cover@tab@uline@thick{1.2pt}
\ExplSyntaxOn
\ProvideDocumentCommand{\shifted@uline}{%
    O{\cover@tab@uline@thick} %
    O{\ubox@right@shift} %
    m}{%
  \def\ULthickness{#1}%
  \setlength{\ULdepth}{0.3em}%
  \hspace*{#2}%
  \uline{#3}%
}
\ProvideDocumentCommand{\shifted@box}{%
    O{\cover@tab@entry@width} %
    O{\content@left@shift} %
    m}{%
  \makebox[#1][c]{\hspace*{-#2} #3 }%
}
\ProvideDocumentCommand{\sht@lines@to@tab}{%
    O{\cover@tab@uline@thick} %
    O{\cover@tab@entry@width} %
    O{\content@left@shift} %
    m}{%
  % convert lines into table lines, adapted from `ucasthesis'
  \seq_set_split:NnV \l_tmpa_seq {\\} {#4}
  \clist_set_from_seq:NN \l_tmpa_clist \l_tmpa_seq
  \clist_clear:N \l_tmpb_clist
  \clist_map_inline:Nn \l_tmpa_clist
    {%
      \clist_put_right:Nn \l_tmpb_clist 
        { \shifted@uline[#1]{\shifted@box[#2][#3]{##1}} }
    }
  \clist_use:Nn \l_tmpb_clist { \\ & }
}
\ExplSyntaxOff
\newcommand\sht@schoollogo{%
  \IfFileExists{shanghaitech-emblem.pdf}{%
    \includegraphics[width=10.48cm]{shanghaitech-emblem.pdf}%
  }{%
    \begin{center}%
      \fbox{%
        \begin{minipage}[t][2.79cm][c]{10.48cm}%
          \centering\bfseries\color{ShtRed} \school@logo@missing%
        \end{minipage}%
      }%
    \end{center}%
  }%
}
\newcommand\sht@schoollogo@undergraduate{%
  \noindent%
  \IfFileExists{shanghaitech-emblem.pdf}{%
    \includegraphics[width=5.39cm]{shanghaitech-emblem.pdf}%
  }{%
    \fbox{%
      \begin{minipage}[t][1.45cm][c]{0.75\columnwidth}%
        \bfseries\color{ShtRed} \school@logo@missing%
      \end{minipage}%
    }%
  }%
}
\renewcommand{\maketitle}{%
  \ifsht@undergraduate
    \sht@maketitle@undergraduate
    \sht@maketitle@undergraduate@en
  \else
    \ifthenelse{\equal{\sht@degree}{doctor}}{
      \sht@maketitle@graduate{博士}
      \sht@maketitle@graduate@en{dissertation}
    }{
      \ifthenelse{\equal{\sht@degree}{master}}{
        \sht@maketitle@graduate{硕士}
        \sht@maketitle@graduate@en{thesis}
      }{
        \sht@error{Degree type `\sht@degree' is not supported yet}
      }
    }
  \fi
  \ifthenelse{\not \boolean{sht@anonymous}}{%
    \ifsht@undergraduate%
      \makedeclarations@undergraduate%
    \else%
      \makedeclarations%
    \fi
  }{}
}
% ------------------------------------------------------------------------------
%   PhD/Master covers
% ------------------------------------------------------------------------------
\newcommand{\sht@maketitle@graduate}[1]{%
  \intobmk*{\cleardoublepage}{封面}
  \thispagestyle{empty}
  \begin{center}
    \linespread{1.6}\zihao{4}\bfseries
    \hfill{}
    \ifdefempty{\sht@secret@level}{}{%
      密级：%
      \shifted@uline[1pt][0pt]{%
        \shifted@box[50pt][0pt]{%
          \zihao{5} \sht@secret@level%
        }%
      }%
    }

    \vspace*{\stretch{4}}

    \sht@schoollogo

    \vspace*{\stretch{2}}

    {\zihao{1}\heiti #1学位论文}

    \vspace*{\stretch{3}}

    {\zihao{-3}\heiti \shifted@uline[1.5pt][0pt]{\sht@title}}

    \vspace*{\stretch{3}}

    {
      \songti
      \def\tabcolsep{1pt}
      \def\arraystretch{1.3}
      \begin{tabular}{llc}
        作者姓名：&
          \multicolumn{2}{c}{\shifted@uline{\shifted@box{%
            \ifsht@anonymous%
              \sht@anonymous@str%
            \else%
              \sht@author%
            \fi%
          }}} \\
        指导教师：&
          \multicolumn{2}{c}{\shifted@uline{\shifted@box{%
            \ifsht@anonymous%
              \sht@anonymous@str%
            \else%
              \sht@supervisor%
            \fi%
          }}} \\
        \ifdefempty{\sht@supervisor@institution}{}{ &
          \multicolumn{2}{c}{\shifted@uline{%
            \shifted@box{\sht@supervisor@institution}}} \\
        }
        学位类别：&
          \multicolumn{2}{c}{\shifted@uline{\shifted@box{\sht@degree@name}}} \\
        一级学科：&
          \multicolumn{2}{c}{\shifted@uline{%
            \shifted@box{\sht@discipline@level@i}}} \\
        \multicolumn{2}{l}{学校/学院名称：} &
          \shifted@uline{\shifted@box[\cover@tab@last@entry@width]{%
            \sht@institution}} \\
      \end{tabular}
    }

    \vspace*{\stretch{4}}

    \sht@date

    \vspace{\stretch{4}}
  \end{center}
  \clearpage
  \thispagestyle{empty}
  \cleardoublepage
}
\newcommand{\sht@maketitle@graduate@en}[1]{
  \intobmk*{\cleardoublepage}{Cover}
  \thispagestyle{empty}
  \begin{center}
    \linespread{1.6}
    \zihao{4}\bfseries

    \vspace*{50pt}

    {\zihao{-3}\bfseries \shifted@uline[1.5pt][0pt]{\sht@title@en}}

    \vspace*{\stretch{3}}

    {
      A~#1~submitted~to\\
      ShanghaiTech~University\\
      in~partial~fulfillment~of~the~requirement\\
      for~the~degree~of\\
      \ifthenelse{\equal{\sht@degree}{doctor}}{
        Doctor~of~Philosophy\\
      }{
        \sht@degree@name@en\\
      }
      in~\sht@discipline@level@i@en

      By

      \ifsht@anonymous%
        \sht@anonymous@str%
      \else%
        \sht@author@en%
      \fi%

      Supervisor:~%
      \ifsht@anonymous%
        \sht@anonymous@str%
      \else%
        \sht@supervisor@en%
      \fi%
    }

    \vspace*{\stretch{3}}

    {\sht@institution@en}

    \vspace*{\stretch{1}}

    {\sht@date@en}

    \vspace{\stretch{3}}
  \end{center}
  \clearpage
  \thispagestyle{empty}
  \cleardoublepage
}
% ------------------------------------------------------------------------------
%   Bachelor covers
% ------------------------------------------------------------------------------
\def\cover@tab@entry@width@undergraduate{300pt}
\def\cover@tab@uline@thick@undergraduate{1pt}
\def\content@left@shift@en{2.5\ccwd}
\newcommand{\sht@maketitle@undergraduate}{%
  \intobmk*{\cleardoublepage}{封面}
  \thispagestyle{empty}
  \sht@schoollogo@undergraduate
  \begin{center}
    \linespread{1.6}

    \vspace*{\stretch{20}}

    {\zihao{2}\bfseries 本科毕业论文（设计）}

    \vspace*{\stretch{54}}

    {
      \zihao{4}
      \def\tabcolsep{1pt}
      \def\arraystretch{1.3}
      \begin{tabular}{cc}
        题\hspace{2\ccwd}目：&
          \sht@lines@to@tab[\cover@tab@uline@thick@undergraduate]%
            [\cover@tab@entry@width@undergraduate]{\sht@title} \\
        学生姓名：&
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]{%
              \sht@author}} \\
        学\hspace{2\ccwd}号：&
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]{%
              \sht@author@id}} \\
        入学年份：&
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]{%
              \sht@entrance@year}} \\
        所在学院：&
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]{%
              \sht@institution}} \\
        攻读专业：&
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]{%
              \sht@discipline}} \\
        指导教师：&
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]{%
              \sht@supervisor}} \\
      \end{tabular}
    }

    \vspace*{\stretch{70}}

    {
      \zihao{-4}
      上海科技大学
      \par\sht@date
    }

    \vspace{\stretch{11}}
  \end{center}
  \clearpage
  \thispagestyle{empty}
  \cleardoublepage
}
\newcommand{\sht@maketitle@undergraduate@en}{%
  \intobmk*{\cleardoublepage}{Cover}
  \thispagestyle{empty}
  \sht@schoollogo@undergraduate
  \begin{center}
    \linespread{1.6}

    \vspace*{\stretch{20}}

    {\zihao{2}\bfseries\sffamily THESIS}

    \vspace*{\stretch{54}}

    {
      \zihao{4}
      \def\tabcolsep{1pt}
      \def\arraystretch{1.3}
      \begin{tabular}{lc}
        Subject: &
          \sht@lines@to@tab[\cover@tab@uline@thick@undergraduate]%
            [\cover@tab@entry@width@undergraduate][\content@left@shift@en]{%
              \sht@title@en} \\
        Student Name: &
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]%
              [\content@left@shift@en]{\sht@author@en}} \\
        Student ID: &
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]%
              [\content@left@shift@en]{\sht@author@id}} \\
        Year of Entrance: &
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]%
              [\content@left@shift@en]{\sht@entrance@year}} \\
        School: &
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]%
              [\content@left@shift@en]{\sht@institution@en}} \\
        Major: &
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]%
              [\content@left@shift@en]{\sht@discipline@en}} \\
        Advisor: &
          \shifted@uline[\cover@tab@uline@thick@undergraduate]%
            {\shifted@box[\cover@tab@entry@width@undergraduate]%
              [\content@left@shift@en]{\sht@supervisor@en}} \\
      \end{tabular}
    }

    \vspace*{\stretch{70}}

    {
      \zihao{-4}
      ShanghaiTech University
      \par Date:~\sht@date@en
    }

    \vspace{\stretch{11}}
  \end{center}
  \clearpage
  \thispagestyle{empty}
  \cleardoublepage
}
% ------------------------------------------------------------------------------
%   Declarations
% ------------------------------------------------------------------------------
\newcommand{\makedeclarations}{%
  \intobmk*{\cleardoublepage}{声明}
  \thispagestyle{empty}
  {
    \linespread{1.6}\zihao{-4}

    \vspace*{2ex}

    \begin{center}
      \zihao{4}\bfseries\sffamily 上海科技大学\\研究生学位论文原创性声明
    \end{center}

    本人郑重声明:所呈交的学位论文是本人在导师的指导下独立进行研究工作所取得的成果。%
    尽我所知，除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写%
    过的研究成果。对论文所涉及的研究工作做出贡献的其他个人和集体，均已在文中以明确方式%
    标明或致谢。

    \vspace*{3ex}

    {\hfill{}作者签名：\hspace*{14em}}

    {\hfill{}日\hspace*{2\ccwd}期：\hspace*{14em}}

    \vspace*{6ex}

    \begin{center}
      \zihao{4}\bfseries\sffamily 上海科技大学\\学位论文授权使用声明
    \end{center}

    本人完全了解并同意遵守上海科技大学有关保存和使用学位论文的规定，即上海科技大学有权%
    保留送交学位论文的副本，允许该论文被查阅，可以按照学术研究公开原则和保护知识产权%
    的原则公布该论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存、汇编本%
    学位论文。
    
    涉密及延迟公开的学位论文在解密或延迟期后适用本声明。

    \vspace*{3ex}

    {\hfill{}作者签名：\hspace*{10em}导师签名：\hspace*{9em}}

    \hfill{}日\hspace*{2\ccwd}期：%
    \hspace*{10em}日\hspace*{2\ccwd}期：\hspace*{9em}%

    \vspace{3ex}
  }
  \clearpage
  \thispagestyle{empty}
  \cleardoublepage
}
\newcommand{\makedeclarations@undergraduate}{%
  \intobmk*{\cleardoublepage}{声明}
  % P1: 学术诚信声明
  \thispagestyle{empty}
  {
    \linespread{1.6}\zihao{4}

    \vspace*{\stretch{1}}

    \begin{center}
      \zihao{-2}\bfseries\sffamily 上海科技大学\\毕业论文(设计)学术诚信声明
    \end{center}

    \vspace*{\stretch{1}}

    本人郑重声明：所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作%
    所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表%
    或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式%
    标明。本人完全意识到本声明的法律结果由本人承担。

    \vspace*{\stretch{3}}

    \hfill{}作者签名：\hspace*{9.5\ccwd}

    \vspace*{\stretch{1}}

    \hfill{}日\hspace*{2\ccwd}期：%
    \hspace*{2.5\ccwd}年%
    \hspace*{1.5\ccwd}月%
    \hspace*{1.5\ccwd}日%
    \hspace*{1\ccwd}

    \vspace{\stretch{6}}
  }
  \clearpage
  % P2: empty
  \thispagestyle{empty}
  \cleardoublepage
  % P3: 版权使用授权书
  \thispagestyle{empty}
  {
    \linespread{1.6}\zihao{4}

    \vspace*{\stretch{1}}

    \begin{center}
      \zihao{-2}\bfseries\sffamily 上海科技大学\\毕业论文（设计）版权使用授权书
    \end{center}

    \vspace*{\stretch{1}}

    本毕业论文（设计）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，%
    允许论文被查阅和借阅。本人授权上海科技大学可以将本毕业论文（设计）的全部或部分内容%
    编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本%
    毕业论文（设计）。

    \hspace*{6\ccwd}\textbf{保\hspace*{1\ccwd}密}$\square$，%
    在\uline{\mbox{\hspace*{2\ccwd}}}年解密后适用本授权书。

    本论文属于

    \hspace*{6\ccwd}\textbf{不保密}$\square$。

    （请在以上方框内打“\checkmark”）

    \vspace*{\stretch{3}}

    \noindent 作者签名：\hspace{12.5\ccwd}指导教师签名：

    \vspace*{\stretch{1}}

    \noindent 日期：%
    \hspace*{2.5\ccwd}年%
    \hspace*{1.5\ccwd}月%
    \hspace*{1.5\ccwd}日%
    \hspace*{6\ccwd}日期：%
    \hspace*{2.5\ccwd}年%
    \hspace*{1.5\ccwd}月%
    \hspace*{1.5\ccwd}日

    \vspace{\stretch{4}}
  }
  \clearpage
  % P4: empty
  \thispagestyle{empty}
  \cleardoublepage
}
% ------------------------------------------------------------------------------
%   Abstract
% ------------------------------------------------------------------------------
\newenvironment{abstract}[1][\sht@null@arg]{%
  \cleardoublepage%
  \ifthenelse{\equal{#1}{flattitle}}{%
    \def\sht@abs@title{\sht@flat@title}%
  }{%
    \def\sht@abs@title{\sht@title}%
  }%
  \ifsht@undergraduate
    \let\clearpage\relax%
    \vspace*{\baselineskip}%
    \begin{center}%
      \zihao{3}\bfseries\sffamily\sht@abs@title%
    \end{center}%
    \vspace*{\baselineskip}%
    \ctexset{chapter/format += \zihao{4}, chapter/beforeskip = 0pt}%
    \ifsht@comfort%
      \def\sht@abstract@name{摘\hspace{1\ccwd}要}
    \else%
      \def\sht@abstract@name{摘要}
    \fi
  \else%
    \def\sht@abstract@name{摘\hspace{1\ccwd}要}
  \fi
  \intobmk\chapter*{\sht@abstract@name}%
}{%
  \vspace{\baselineskip}%
  \ifsht@undergraduate%
    \ifsht@comfort%
      \par\noindent{\bfseries\sffamily 关键词：} \sht@keywords%
    \else%
      \par\noindent{\zihao{-4}\bfseries\sffamily 关键词：} \sht@keywords%
    \fi%
  \else%
    \par\noindent{\bfseries 关键词：} \sht@keywords%
  \fi%
}
\newenvironment{abstract*}[1][\sht@null@arg]{%
  \cleardoublepage%
  \ifthenelse{\equal{#1}{flattitle}}{%
    \def\sht@abs@title@en{\sht@flat@title@upper@en}%
  }{%
    \def\sht@abs@title@en{\sht@title@en}%
  }%
  \ifsht@undergraduate
    \let\clearpage\relax%
    \vspace*{\baselineskip}%
    \begin{center}%
      \zihao{3}\bfseries\sht@abs@title@en%
    \end{center}%
    \vspace*{\baselineskip}%
    \ctexset{chapter/format += \zihao{4}\rmfamily, chapter/beforeskip = 0pt}%
    \intobmk\chapter*{ABSTRACT}%
  \else
    \intobmk\chapter*{Abstract}%
  \fi
}{%
  \vspace{\baselineskip}%
  \ifsht@undergraduate%
    \ifsht@comfort%
      \par\noindent{\bfseries Key words:} \sht@keywords@en%
    \else%
      \par\noindent{\zihao{-4}\bfseries Key words:} \sht@keywords@en%
    \fi%
  \else%
    \par\noindent{\bfseries Key Words:} \sht@keywords@en%
  \fi%
}
% ------------------------------------------------------------------------------
%   Nomenclatures
% ------------------------------------------------------------------------------
\newcounter{sht@nomenclature@cnt}
\setcounter{sht@nomenclature@cnt}{0}
\def\sht@null@arg{}
\newenvironment{nomenclatures}[1][\sht@null@arg]{%
  \ifnum\thesht@nomenclature@cnt=0
    \cleardoublepage
    \intobmk\chapter*{符号列表}%
  \fi
  \stepcounter{sht@nomenclature@cnt}
  \ifthenelse{\not \equal{#1}{\sht@null@arg}}{%
    \ifsht@undergraduate%
      \ctexset{section/format += \zihao{-4}, section/indent = 0pt}%
    \fi%
    \section*{#1}%
  }{
    \ifsht@undergraduate%
      \par\vspace{18pt}%
    \else%
      \par\vspace{24pt}%
    \fi%
  }
  \renewcommand{\item}[3][\sht@null@arg]{
    \ifthenelse{\not \equal{##1}{\sht@null@arg}}{
      \par\noindent\makebox[0.15\columnwidth][l]{##2}{{##3}\hfill{##1}}
    }{
      \par\noindent\makebox[0.15\columnwidth][l]{##2}{##3}
    }
  }
  \providecommand{\header}[3][\sht@null@arg]{
    \item[\textbf{##1}]{\textbf{##2}}{\textbf{##3}}
  }
}{
}
% ------------------------------------------------------------------------------
%   Bibliography
% ------------------------------------------------------------------------------
\providecommand{\makebiblio}{%
  \renewcommand{\bibfont}{\zihao{5}}%
  \intotoc*{\cleardoublepage}{\bibname}%
  \urlstyle{same}%
  \printbibliography%
  \urlstyle{tt}%
}
% ------------------------------------------------------------------------------
%   Appendix
% ------------------------------------------------------------------------------
\LetLtxMacro{\origin@appendix}{\appendix}
\renewcommand{\appendix}{%
  \origin@appendix%
  \intotoc*{\cleardoublepage}{\appendixname}%
  \settocdepth{part}%
  \ifsht@undergraduate%
    \pagestyle{MNNumberedWithLogo}%
  \else%
    \pagestyle{LRNumberedAppendix}%
  \fi%
}
% ------------------------------------------------------------------------------
%   Backmatter
% ------------------------------------------------------------------------------
\providecommand{\backmatter}{}
\LetLtxMacro{\origin@backmatter}{\backmatter}
\renewcommand{\backmatter}{%
  \origin@backmatter%
  \settocdepth{chapter}%
  \renewcommand{\chaptermark}[1]{%
    \markboth{##1}{}%
  }%
  \ifsht@undergraduate%
    \pagestyle{MNNumberedWithLogo}%
  \else%
    \pagestyle{LRNumbered}%
  \fi%
  \ifsht@undergraduate%
    \ctexset{section/format += \zihao{-4}, section/indent = 0pt}%
  \fi%
}
\newcounter{sht@resume@cnt}
\setcounter{sht@resume@cnt}{0}
\newcommand{\sht@check@resume@title}{
  \ifnum\thesht@resume@cnt=0
    \cleardoublepage
    \chapter{作者简历及攻读学位期间发表的学术论文与研究成果}
  \fi
  \stepcounter{sht@resume@cnt}
}
\newenvironment{resume}{%
  \sht@check@resume@title
  \section*{作者简历：}
  \ifsht@anonymous
    \sht@anonymous@str\par
    \comment
  \fi
}{%
  \ifsht@anonymous
    \endcomment
  \fi
}
\newenvironment{publications}{%
  \sht@check@resume@title
  \ifsht@anonymous
    \comment
  \fi
  \section*{已发表（或正式接受）的学术论文：}
}{%
  \ifsht@anonymous
    \endcomment
  \fi
}
\newenvironment{publications*}{%
  \sht@check@resume@title
  \ifthenelse{\not \boolean{sht@anonymous}}{
    \comment
  }{}
  \section*{已发表（或正式接受）的学术论文：}
}{%
  \ifthenelse{\not \boolean{sht@anonymous}}{
    \endcomment
  }{}
}
\newenvironment{patents}{%
  \sht@check@resume@title
  \ifsht@anonymous
    \comment
  \fi
  \section*{申请或已获得的专利：}
}{%
  \ifsht@anonymous
    \endcomment
  \fi
}
\newenvironment{patents*}{%
  \sht@check@resume@title
  \ifthenelse{\not \boolean{sht@anonymous}}{
    \comment
  }{}
  \section*{申请或已获得的专利：}
}{%
  \ifthenelse{\not \boolean{sht@anonymous}}{
    \endcomment
  }{}
}
\newenvironment{projects}{%
  \sht@check@resume@title
  \section*{参加的研究项目及获奖情况：}
  \ifsht@anonymous
    \sht@anonymous@str\par
    \comment
  \fi
}{%
  \ifsht@anonymous
    \endcomment
  \fi
}
\newenvironment{acknowledgement}{%
  \ifsht@anonymous
    \comment
  \else
    \cleardoublepage
    \chapter[致谢]{致\hspace{1\ccwd}谢}\chaptermark{致\hspace{1\ccwd}谢}%
  \fi
}{%
  \ifsht@anonymous
    \endcomment
  \fi
}
% ==============================================================================
% Post-processing
% ==============================================================================
\AtEndDocument{
  \cleardoublepage
}
\endinput
