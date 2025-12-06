%%
%% This is file `ltugboat.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tugboat.dtx  (with options: `latex,classtop,common,classtail,latex2e,ltugboatcls')
%% 
%% This is a generated file.
%% 
%% Copyright 1994-2023 TeX Users Group.
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    https://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%% 
%% This file has the LPPL maintenance status "maintained".
%% 
%% The Current Maintainer of this work is the TeX Users Group
%% (https://tug.org/TUGboat).
%% 
%% The list of all files belonging to the distribution is given in the file
%% `manifest.txt'.
%% 
%% The list of derived (unpacked) files belonging to the distribution
%% and covered by LPPL is defined by the unpacking scripts (with
%% extension .ins) which are part of the distribution.
%% 
\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass  {ltugboat}
                   [2025-10-27 v2.35
                       TUGboat journal class%
                   ]
\newif\ifTBunicodeengine
\ifx\Umathchardef\@thisisundefined % not (xetex|luatex)
  \TBunicodeenginefalse
\else
  \TBunicodeenginetrue
\fi
\csname tugstyloaded@\endcsname
\def\tugstyloaded@{\tugstyinit\endinput}
\providecommand{\@tugclass}{ltugboat}
\def\TBError{\ClassError{\@tugclass}}
\def\TBWarning{\ClassWarning{\@tugclass}}
\def\TBWarningNL{\ClassWarningNoLine{\@tugclass}}
\def\TBInfo{\ClassInfo{\@tugclass}}
\def\tbdebug#1{\message{^^J*** #1}}
\def\tbloggingall{\loggingall \tracingonline=0 }
\DeclareOption{draft}{% [draft], the default
  % If the user loads hyperref, avoid passing on the global draft option
  % (which would remove all links in the pdf).
  \PassOptionsToPackage{final}{hyperref}
  %
  \AtEndOfClass{%
    \setcounter{page}{901}%
    \BlackBoxes
    \def\MakeRegistrationMarks{}%
    \PrelimDrafttrue
  }%
}

\newif\ifpreprint
\def\preprint{\preprinttrue} % [preprint], hardly used
\DeclareOption{preprint}{%
   \preprinttrue
}

\newif\iftubfinaloption % [final], manually inserted by us for processing
\DeclareOption{final}{%
  \tubfinaloptiontrue
  \AtEndOfClass{%
    % Insert draft date into the header even with [final], if we are not
    % doing a production run. (|tugboat.dates| sets up page numbers
    % above 900 in such pseudo-draft mode.) We use [final] in the first
    % place for this case because draft vs. final can change page
    % layout, wrt registration marks, etc. (Not good, but too painful to
    % change at this late date.)
    \ifnum\value{page}>900 \PrelimDrafttrue \else \PrelimDraftfalse \fi
    \@tubrunningfull
  }%
}
\AtBeginDocument{%
  \ifx\undefined\texorpdfstring
    \DeclareRobustCommand{\texorpdfstring}[2]{#1}%
  \fi
  %
  \ifx\undefined\pdfstringdefDisableCommands\else
    \pdfstringdefDisableCommands{%
      \let\acro\relax
      \let\origDash=\Dash \def\Dash{\texorpdfstring{\origDash}{--}}%
      % lots more could/should be added.
    }%
  \fi
}
\DeclareOption{11pt}{%
  \TBWarning{The \@tugclass\space class only supports 10pt fonts:
    \MessageBreak option \CurrentOption\space ignored}%
}
\DeclareOption{12pt}{\csname ds@11pt\endcsname}
\DeclareOption{oneside}{\TBWarning{Option \CurrentOption\space ignored}}
\DeclareOption{twoside}{\ds@oneside}
\DeclareOption{tugproc}{%
  \TBWarning{Option \CurrentOption\space ignored: use class ltugproc
    instead of \@tugclass}%
}
\DeclareOption{rawcite}{\let\if@Harvardcite\iffalse}
\DeclareOption{harvardcite}{\let\if@Harvardcite\iftrue}
\DeclareOption{extralabel}{\let\UseExtraLabel\@firstofone}
\DeclareOption{noextralabel}{\let\UseExtraLabel\@gobble}
\DeclareOption{numbersec}{\let\if@numbersec\iftrue}
\DeclareOption{nonumber}{\let\if@numbersec\iffalse}
\DeclareOption{runningoff}{\AtEndOfClass{\@tubrunningoff}}
\DeclareOption{runningminimal}{\AtEndOfClass{\@tubrunningminimal}}
\DeclareOption{runningfull}{\AtEndOfClass{\@tubrunningfull}}
\newif\iftubomitdoioption
\DeclareOption{omitdoi}{%
   \tubomitdoioptiontrue
}
\newif\if@tubtwocolumn  \@tubtwocolumntrue
\DeclareOption{onecolumn}{\@tubtwocolumnfalse}
\newif\iftubsecondcolstart
\DeclareOption{secondcolstart}{\tubsecondcolstarttrue}
\let\tubsecondcolstartextra\relax
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{draft,extralabel,numbersec,rawcite,runningminimal}
\ProcessOptions
\LoadClass[twoside]{article}
\def\sectitlefont{\fontfamily\sfdefault\fontseries{bx}\fontshape{n}%
         \fontsize\@xviipt\stbaselineskip\selectfont}
\def\tensl{\fontseries{m}\fontshape{sl}\fontsize\@xpt\@xiipt
          \selectfont}
\ifTBunicodeengine
  % there is no "LM unslanted" in OpenType, so use the standard cmu
  % scaled for the current text size. Not worth more effort.
  \def\EdNoteFont{\font\ednotefont = cmu10 at 1em }
\else % traditional engine:
  \def\EdNoteFont{\fontfamily{cmr}\fontseries{m}\fontshape{ui}\selectfont}
\fi
\IfFileExists{mflogo.sty}%
  {\RequirePackage{mflogo}}%
 {\TBWarning
     {Package mflogo.sty not available --\MessageBreak
       Proceeding to emulate mflogo.sty}
   \DeclareRobustCommand{\logofamily}{%
     \not@math@alphabet\logofamily\relax
     \fontencoding{U}\fontfamily{logo}\selectfont}
   \DeclareTextFontCommand{\textlogo}{\logofamily}
   \def\MF{\textlogo{META}\-\textlogo{FONT}\@}
   \def\MP{\textlogo{META}\-\textlogo{POST}\@}
   \DeclareFontFamily{U}{logo}{}
   \DeclareFontShape{U}{logo}{m}{n}{%
     <8><9>gen*logo%
     <10><10.95><12><14.4><17.28><20.74><24.88>logo10%
   }{}
   \DeclareFontShape{U}{logo}{m}{sl}{%
     <8><9>gen*logosl%
     <10><10.95><12><14.4><17.28><20.74><24.88>logosl10%
   }{}
   \DeclareFontShape{U}{logo}{m}{it}{%
     <->ssub*logo/m/sl%
   }{}%
  }
\newtoks\ResetCommands
\ResetCommands{%
  \setcounter{part}{0}%
  \setcounter{section}{0}%
  \setcounter{footnote}{0}%
  \authornumber\z@
}
\newcommand{\AddToResetCommands}[1]{%
  \AddToResetCommands\expandafter{\AddToResetCommands#1}%
}
\def\makeescape#1{\catcode`#1=\z@}
\def\makebgroup#1{\catcode`#1=\@ne}
\def\makeegroup#1{\catcode`#1=\tw@}
\def\makemath  #1{\catcode`#1=\thr@@}
\def\makealign #1{\catcode`#1=4 }
\def\makeeol   #1{\catcode`#1=5 }
\def\makeparm  #1{\catcode`#1=6 }
\def\makesup   #1{\catcode`#1=7 }
\def\makesub   #1{\catcode`#1=8 }
\def\makeignore#1{\catcode`#1=9 }
\def\makespace #1{\catcode`#1=10 }
\def\makeletter#1{\catcode`#1=11 }
\chardef\other=12
\let\makeother\@makeother
\def\makeactive#1{\catcode`#1=13 }
\def\makecomment#1{\catcode`#1=14 }
\def\savecat#1{%
  \expandafter\xdef\csname\string#1savedcat\endcsname{\the\catcode`#1}}
\def\restorecat#1{\catcode`#1=\csname\string#1savedcat\endcsname}
\def\SaveCS#1{\expandafter\let\csname saved@@#1\expandafter\endcsname
  \csname#1\endcsname}
\def\RestoreCS#1{\expandafter\let\csname#1\expandafter\endcsname
  \csname saved@@#1\endcsname}
\def\plaintubstyle{plain}
\def\latextubstyle{latex}
\providecommand\hb@xt@{\hbox to}
\providecommand\textsuperscript[1]{\ensuremath{\m@th
                                     ^{\mbox{\fontsize\sf@size\z@
                                         \selectfont #1}}}}
\def\tubline{\hbox to \hsize}
\DeclareRobustCommand{\AllTeX}{%
  \texorpdfstring{(\La\kern-.075em)\kern-.05em\TeX}{(La)TeX}}
\def\AMS{American Mathematical Society}
\def\AmS{$\mathcal{A}$\kern-.1667em\lower.5ex\hbox
    {$\mathcal{M}$}\kern-.125em$\mathcal{S}$}
\def\AmSLaTeX{\AmS-\LaTeX}
\def\AmSTeX{\AmS-\TeX}
\def\ANSI{\acro{ANSI}}
\def\API{\acro{API}}
\def\ASCII{\acro{ASCII}}
\def\aw{\acro{A\kern.04em\raise.115ex\hbox{-}W}}
\def\AW{Addison\kern.1em-\penalty\z@\hskip\z@skip Wesley}
\def\Bib{%
  \ifdim \fontdimen1\font>0pt
     B{\SMC\SMC IB}%
  \else
     B\textsc{ib}%
  \fi
}
\def\BibLaTeX{\texorpdfstring{\Bib\-\kern.02em \LaTeX}{BibLaTeX}}
\def\BibTeX{\texorpdfstring{\Bib\-\kern-.08em \TeX}{BibTeX}}
\def\bfBib{B{\SMC\SMC IB}}
\def\bfBibTeX{\texorpdfstring{\bfBib\TeX}{BibTeX}}
\def\bfBibLaTeX{\texorpdfstring{\bfBib\LaTeX}{BibLaTeX}}
\def\BSD{\acro{BSD}}
\def\CandT{\textsl{Computers \& Typesetting}}
\def\ConTeXt{\texorpdfstring{C\kern-.0333emon\-\kern-.0667em\TeX\kern-.0333emt}
  {ConTeXt}}
\def\CMkIV{\ConTeXt\ \MkIV}
\def\Cplusplus{C\plusplus}
\def\plusplus{\raisebox{.7ex}{$_{++}$}}
\def\CPU{\acro{CPU}}
\def\CSczabbr{\ensuremath{\cal C}\kern-.1667em\lower.5ex\hbox{$\cal S$}}
\def\CSS{\acro{CSS}}
\def\CSTUG{\CSczabbr\kern.05em\acro{TUG}}
\def\CSV{\acro{CSV}}
\def\CTAN{\acro{CTAN}}
\def\DTD{\acro{DTD}}
\def\DTK{\acro{DTK}}
\def\DVD{\acro{DVD}}
\def\DVI{\acro{DVI}}
\def\DVIPDFMx{\acro{DVIPDFM}$x$}
\def\DVItoVDU{DVIto\kern-.12em VDU}
\def\ECMA{\acro{ECMA}}
\def\EPS{\acro{EPS}}
\def\TUBdefaulteTeX{\ensuremath{\varepsilon}\mbox{-}\kern-.125em\TeX}%
\DeclareRobustCommand{\eTeX}{%
  \ifx\f@series\bfseries@rm
    \ifx\boldsymbol\undefined % \boldsymbol is from amsmath; also support bm?
      \TBWarning{bold varepsilon for \string\eTeX\space not available; load amsmath}%
      \TUBdefaulteTeX
    \else
      \ensuremath{\boldsymbol{\varepsilon}}\mbox{-}\kern-.125em\TeX
    \fi
  \else
    \TUBdefaulteTeX
  \fi
}
\DeclareRobustCommand{\ExTeX}{%
  \ensuremath{\textstyle\varepsilon_{\kern-0.15em\cal{X}}}\kern-.2em\TeX}
\def\FAQ{\acro{FAQ}}
\def\FTP{\acro{FTP}}
\def\Ghostscript{Ghost\-script}
\def\GNU{\acro{GNU}}
\def\GUI{\acro{GUI}}
\DeclareRobustCommand{\HarfBuzz}{Harf\discretionary{-}{}{\kern.077em}Buzz}
\def\Hawaii{Hawai`i}
\def\HTML{\acro{HTML}}
\def\HTTP{\acro{HTTP}}
\def\HTTPS{\acro{HTTPS}}
\def\iOS{i\acro{OS}}
\def\IDE{\acro{IDE}}
\def\IEEE{\acro{IEEE}}
\def\ISBN{\acro{ISBN}}
\def\ISO{\acro{ISO}}
\def\ISSN{\acro{ISSN}}
\def\JPEG{\acro{JPEG}}
\def\JTeX{\leavevmode\hbox{\lower.5ex\hbox{J}\kern-.18em\TeX}}
\def\JoT{\textsl{The Joy of \TeX}}
\DeclareRobustCommand{\KOMAScript}{\textsf{K\kern.05em O\kern.05em%
     M\kern.05em A\kern.1em\hyph\kern.1em Script}}
\def\LAMSTeX{L\raise.42ex\hbox{\kern-.3em
                   $\m@th$\fontsize\sf@size\z@\selectfont
                   $\m@th\mathcal{A}$}%
    \kern-.2em\lower.376ex\hbox{$\m@th\mathcal{M}$}\kern-.125em
    {$\m@th\mathcal{S}$}-\TeX}
\DeclareRobustCommand{\La}%
   {L\kern-.36em
        {\setbox0\hbox{T}%
         \vbox to\ht0{\hbox{$\m@th$%
                            \csname S@\f@size\endcsname
                            \fontsize\sf@size\z@
                            \math@fontsfalse\selectfont
                            A}%
                      \vss}%
        }}
\def\LMTX{\acro{LMTX}}
\def\LuaHBTeX{Lua\acro{HB}\-\TeX}%
\def\LuaHBLaTeX{Lua\acro{HB}\-\LaTeX}%
\def\LuaLaTeX{Lua\-\LaTeX}% dtk-logos defines it and people like to use it
\def\LuaTeX{Lua\-\TeX}% ditto
\def\luatex{\LuaTeX}% ditto
\def\LyX{L\kern-.1667em\lower.25em\hbox{Y}\kern-.125emX}
\def\macOS{mac\acro{OS}}
\def\MacOSX{Mac\,\acro{OS\,X}}
\def\MathML{Math\acro{ML}}
\def\Mc{\setbox\TestBox=\hbox{M}M\vbox
   to\ht\TestBox{\hbox{c}\vfil}} %  for Robert McGaffey
\def\mf{\textsc{Metafont}}
\def\MFB{\textsl{The \MF\kern.1em\-book}}
\def\MkIV{Mk\acro{IV}}
\let\TB@@mp\mp
\DeclareRobustCommand{\mp}{\ifmmode\TB@@mp\else MetaPost\fi}
\def\mtex{T\kern-.1667em\lower.424ex\hbox{\^E}\kern-.125emX\@}
\DeclareRobustCommand{\NTG}{\acro{NTG}}
\DeclareRobustCommand{\NTS}{\ensuremath{\mathcal{N}\mkern-4mu
  \raisebox{-0.5ex}{$\mathcal{T}$}\mkern-2mu \mathcal{S}}}
\DeclareTextSymbol{\textohm}{OT1}{'012}
\DeclareTextSymbolDefault{\textohm}{OT1}
\newcommand{\OMEGA}{\textohm}
\DeclareRobustCommand{\OCP}{\OMEGA\acro{CP}}
\DeclareRobustCommand{\OOXML}{\acro{OOXML}}
\DeclareRobustCommand{\OTF}{\acro{OTF}}
\DeclareRobustCommand{\OTP}{\OMEGA\acro{TP}}
\DeclareRobustCommand{\OpTeX}{\texorpdfstring{Op\kern-.05em\TeX}{OpTeX}}
\def\Pas{Pascal}
\def\pcMF{\leavevmode\raise.5ex\hbox{p\kern-.3\p@ c}MF\@}
\def\PCTeX{PC\thinspace\TeX}
\def\pcTeX{\leavevmode\raise.5ex\hbox{p\kern-.3\p@ c}\TeX}
\def\pdfLaTeX{pdf\/\-\LaTeX}% dtk-logos
\def\pdflatex{\pdfLaTeX}
\def\pdfTeX{pdf\/\-\TeX}% dtk-logos
\def\pdftex{\pdfTeX}
\def\PDF{\acro{PDF}}
\def\PDFUA{\acro{PDF/UA}}
\def\PGF{\acro{PGF}}
\def\PHP{\acro{PHP}}
\def\PiC{P\kern-.12em\lower.5ex\hbox{I}\kern-.075emC\@}
\def\PiCTeX{\PiC\kern-.11em\TeX}
\def\plain{\texttt{plain}}
\def\PNG{\acro{PNG}}
\def\POBox{P.\thinspace O.~Box }
\def\PS{{Post\-Script}}
\def\PSTricks{\acro{PST}ricks}
\def\RIT{\acro{RIT}}
\def\RTF{\acro{RTF}}
\def\SC{Steering Committee}
\def\SGML{\acro{SGML}}
\def\SliTeX{\textrm{S\kern-.06em\textsc{l\kern-.035emi}%
                     \kern-.06em\TeX}}
\def\slMF{\textsl{\MF}} % should never be used
\def\SQL{\acro{SQL}}
\def\stTeX{\textsc{st}\kern-0.13em\TeX}
\def\STIX{\acro{STIX}}
\def\SVG{\acro{SVG}}
\def\TANGLE{\texttt{TANGLE}\@}
\def\TB{\textsl{The \TeX\-book}}
\def\TIFF{\acro{TIFF}}
\def\TP{\textsl{\TeX:\ The Program\/}}
\DeclareRobustCommand{\TeX}{T\kern-.1667em\lower.424ex\hbox{E}\kern-.125emX\@}
\def\TeXhax{\TeX hax}
\def\TeXMaG{\TeX M\kern-.1667em\lower.5ex\hbox{A}%
   \kern-.2267emG\@}
\def\TeXtures{\textit{Textures}}
\let\Textures=\TeXtures
\def\TeXworks{\TeX\kern-.07em works}
\def\TeXXeT{\TeX-{}-\XeT}
\def\TFM{\acro{TFM}}
\ifTBunicodeengine
  \AtBeginDocument{% in case a different font is loaded
    % \iffontchar is from e-TeX; safe to use under Unicode engines.
    \iffontchar\font"1EBF
      \def\TBecircacute{\char"1EBF }%
    \else
      \def\TBecircacute{\^e\llap{\raise 0.5ex\hbox{\'{}}}}%
    \fi
    \def\Thanh{H\`an~Th\TBecircacute~Th\`anh}%
  }%
\else % non-Unicode engine, use our traditional definition.
  \def\Thanh{H\`an~Th\^e\llap{\raise 0.5ex\hbox{\'{}}}~Th\`anh}
  % We could also go the other direction, and always use the Unicode
  % character, after:
  % \ifdefined\DeclareUnicodeCharacter
  %   \DeclareUnicodeCharacter{1EBF}{\^e\llap{\raise 0.5ex\hbox{\'{}}}}
  % \fi
  % but let's make the smaller change.
\fi
\def\TikZ{Ti\/{\em k}Z}
\def\ttn{\textsl{TTN}\@}
\def\TTN{\textsl{\TeX{} and TUG News}}
\def\TUB{\texttub{TUGboat}}\def\texttub{\textsl} % redefined in some situations
\def\TUG{\TeX\ \UG}
\def\tug{\acro{TUG}}
\def\UG{Users Group}
\def\UNIX{\acro{UNIX}}
\def\tbUTF{\acro{UTF}\futurelet\@nextchar\@tbUTFcheck}
  \def\@tbUTFcheck{\ifx\@nextchar-%
                      \mbox{-}\let\next=\tbgobbledash
                    \else
                      \let\next=\empty
                    \fi\next}
  \def\tbgobbledash-{}
\def\VAX{V\kern-.12em A\kern-.1em X\@}
\def\VnTeX{V\kern-.03em n\kern-.02em \TeX}
\def\VorTeX{V\kern-2.7\p@\lower.5ex\hbox{O\kern-1.4\p@ R}\kern-2.6\p@\TeX}
\def\XeT{X\kern-.125em\lower.424ex\hbox{E}\kern-.1667emT\@}
\def\XML{\acro{XML}}
\def\XMP{\acro{XMP}}
\def\WEB{\texorpdfstring{\texttt{WEB}\@}{WEB}}
\def\WEAVE{\texttt{WEAVE}\@}
\def\WYSIWYG{\acro{WYSIWYG}}
\def\tubreflect#1{%
  \@ifundefined{reflectbox}{%
    \TBError{A graphics package must be loaded to use \string\XeTeX}
            {Load graphicx or graphics.}%
  }{%
    \ifdim \fontdimen1\font>0pt
      \raise 1.75ex \hbox{\kern.1em\rotatebox{180}{#1}}\kern-.1em
    \else
      \reflectbox{#1}%
    \fi
  }%
}
\def\tubhideheight#1{\setbox0=\hbox{#1}\ht0=0pt \dp0=0pt \box0 }
\def\XekernbeforeE{-.125em}
\def\XekernafterE{-.1667em}
\NewDocumentCommand\tub@Xe{}{\leavevmode
  \tubhideheight{\hbox{X%
    \setbox0=\hbox{\TeX}\setbox1=\hbox{E}%
    \ifdim \fontdimen1\font>0pt
      % XeTeX logo needs tinkering when slanted/italic font,
      % so make kerns changeable
      \def\XekernbeforeE{-.11em}%
      \def\XekernafterE{-.16em}%
      \dp1=-.17ex
    \fi
    \lower\dp0\hbox{\raise\dp1\hbox{\kern\XekernbeforeE\tubreflect{E}}}%
    \kern\XekernafterE}}}
\newcommand\Xe{\texorpdfstring{\tub@Xe}{Xe}}
\def\XeTeX{\texorpdfstring{\Xe\TeX}{XeTeX}}
\def\XeLaTeX{\texorpdfstring{\Xe{\kern.11em \LaTeX}}{XeLaTeX}}
\def\XHTML{\acro{XHTML}}
\def\XSL{\acro{XSL}}
\def\XSLFO{\acro{XSL}\raise.08ex\hbox{-}\acro{FO}}
\def\XSLT{\acro{XSLT}}
\def\YAML{\acro{YAML}}
\newlinechar=`\^^J
\normallineskiplimit=\p@
\clubpenalty=10000
\widowpenalty=10000
\def\NoParIndent{\parindent=\z@}
\newdimen\normalparindent
\normalparindent=20\p@
\def\NormalParIndent{\global\parindent=\normalparindent}
\NormalParIndent
\def\BlackBoxes{\overfullrule=5\p@}
\def\NoBlackBoxes{\overfullrule=\z@}
\def\newline{\hskip\z@\@plus\pagewd\break}
\def\tubsentencespace{\spacefactor=3000{}\space\ignorespaces}
\DeclareRobustCommand{\tubdots}{\ifmmode\mathellipsis\else
   .\kern\fontdimen3\font
   .\kern\fontdimen3\font
   .\kern\fontdimen3\font\fi}
\edef\allowhyphens{\noexpand\hyphenpenalty\the\hyphenpenalty\relax
  \noexpand\exhyphenpenalty\the\exhyphenpenalty\relax}
\def\nohyphens{\hyphenpenalty\@M\exhyphenpenalty\@M}
\newbox\T@stBox                 \newbox\TestBox
\newcount\T@stCount             \newcount\TestCount
\newdimen\T@stDimen             \newdimen\TestDimen
\newif\ifT@stIf                 \newif\ifTestIf
\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax }
\newif\iftop@           \newif\ifbot@
\def\topsmash{\top@true\bot@false\smash@}
\def\botsmash{\top@false\bot@true\smash@}
\def\smash{\top@true\bot@true\smash@}
\def\smash@{\relax\ifmmode\def\next{\mathpalette\mathsm@sh}%
        \else\let\next\makesm@sh\fi \next }
\def\finsm@sh{\iftop@\ht\z@\z@\fi\ifbot@\dp\z@\z@\fi\box\z@}
\long\def\ulap#1{\vbox to \z@{\vss#1}}
\long\def\dlap#1{\vbox to \z@{#1\vss}}
\def\xlap#1{\hb@xt@\z@{\hss#1\hss}}
\long\def\ylap#1{\vbox to \z@{\vss#1\vss}}
\long\def\zlap#1{\ylap{\xlap{#1}}}
\def\basezero{\baselineskip\z@skip \lineskip\z@skip}
\def\nullhrule{\hrule \@height\z@ \@depth\z@ \@width\z@ }
\def\nullvrule{\vrule \@height\z@ \@depth\z@ \@width\z@ }
\def\makestrut[#1;#2]{\vrule \@height#1 \@depth#2 \@width\z@ }
\def\drawoutlinebox[#1;#2;#3]{\T@stDimen=#3
        \vbox to#1{\hrule \@height\T@stDimen \@depth\z@
            \vss\hb@xt@#2{\vrule \@width\T@stDimen
                \hfil\makestrut[#1;\z@]%
                \vrule \@width\T@stDimen}\vss
            \hrule \@height\T@stDimen \@depth\z@}}
\newcount\hours
\newcount\minutes
\def\SetTime{\hours=\time
        \global\divide\hours by 60
        \minutes=\hours
        \multiply\minutes by 60
        \advance\minutes by-\time
        \global\multiply\minutes by-1 }
\SetTime
\def\now{\ifnum\hours<10 0\fi\number\hours:%
         \ifnum\minutes<10 0\fi\number\minutes}
\def\Now{\today\ \now}
\newif\ifPrelimDraft    % true if ([draft] or [preprint] or pageno>900)
\def\midrtitle{} % center of running heads
\def\rtitlenexttopage{\ifPrelimDraft \textsl{\small draft: \Now}\fi}
\let\thisissuepageref\empty
\newdimen\raggedskip    \raggedskip=\z@
\newdimen\raggedstretch \raggedstretch=5em    % ems of font set now (10pt)
\newskip\raggedparfill  \raggedparfill=\z@\@plus 1fil
\def\raggedspaces{\spaceskip=.3333em \relax \xspaceskip=.5em \relax }
\def\raggedright{%
  \nohyphens \raggedspaces
  \rightskip=\raggedskip\@plus\raggedstretch
  \parfillskip=\raggedparfill
}
\def\raggedleft{%
  \nohyphens \raggedspaces
  \leftskip=\raggedskip\@plus\raggedstretch
  \parfillskip=\z@skip
  \let\\ \@centercr % else tabulararray fails,
                    % https://github.com/lvjr/tabularray/issues/348
}
\def\raggedcenter{%
  \nohyphens \raggedspaces
  \leftskip=\raggedskip\@plus\raggedstretch
  \rightskip=\leftskip
  \parindent=\z@
  \parfillskip=\z@skip
}
\def\normalspaces{\spaceskip\z@skip \xspaceskip\z@skip}
\def\tubjustifiedpar{\rightskip=0pt \parfillskip=0pt plus1fil
                     \allowhyphens \normalspaces}
\let\latexnobreakspace=\nobreakspace
\DeclareRobustCommand{\nobreakspace}{\unskip\nobreak\ \ignorespaces}
\def\boxcs#1{\box\csname#1\endcsname}
\def\setboxcs#1{\setbox\csname#1\endcsname}
\def\newboxcs#1{\expandafter\newbox\csname#1\endcsname}
\let\gobble\@gobble
\def\vellipsis{%
  \leavevmode\kern0.5em
  \raise\p@\vbox{\baselineskip6\p@\vskip7\p@\hbox{.}\hbox{.}\hbox{.}}
  }
\def\bull{\vrule \@height 1ex \@width .8ex \@depth -.2ex }
\DeclareRobustCommand{\cents}{\textcent}
\def\tubcentsold{{\rm\raise.2ex\rlap{\kern.05em$\scriptstyle/$}c}}
\def\careof{\leavevmode\hbox{\raise.75ex\hbox{c}\kern-.15em
                /\kern-.125em\smash{\lower.3ex\hbox{o}}} \ignorespaces}
\def\Dag{\raise .6ex\hbox{$\scriptstyle\dagger$}}
\DeclareRobustCommand{\sfrac}[1]{\@ifnextchar/{\@sfrac{#1}}%
                                            {\@sfrac{#1}/}}
\def\@sfrac#1/#2{\leavevmode\kern.1em\raise.5ex
         \hbox{$\m@th\mbox{\fontsize\sf@size\z@
                           \selectfont#1}$}\kern-.1em
         /\kern-.15em\lower.25ex
          \hbox{$\m@th\mbox{\fontsize\sf@size\z@
                            \selectfont#2}$}}
\DeclareRobustCommand\meta[1]{%
  \ensuremath{\langle}%
  \ifmmode \expandafter\mbox \fi % if in math
  {\it #1\/}% no typewriter italics, please
  \ensuremath{\rangle}%
}
\DeclareRobustCommand{\cs}[1]{\texorpdfstring
  {{\tt \char`\\#1}\@}%
  {\textbackslash #1}%
}
\DeclareRobustCommand{\tubbraced}[1]{\texorpdfstring
  {\mbox{\texttt{\char`\{#1\char`\}}}}%
  {\textbraceleft #1\textbraceright}%
}
\DeclareRobustCommand{\tbcode}[1]{\mbox{\texttt{#1}}}
\AtBeginDocument{%
\ifx\nolinkurl\undefined
  \DeclareRobustCommand{\tbcodebreak}{\url}
\else
  \DeclareRobustCommand{\tbcodebreak}{\nolinkurl}
\fi
}
\DeclareRobustCommand{\thinskip}{\hskip 0.16667em\relax}
\AtBeginDocument{%
\ifx\hyper@normalise\undefined
  \ifx\url\undefined      % define our own simplistic non-hyperref \url
    \def\url{\begingroup  % might as well catch common special chars
      \catcode`\#=12 \catcode`\$=12 \catcode`\%=12 \catcode`\^=12
      \catcode`\&=12 \catcode`\_=12 \catcode`\~=12
      \finish@tub@url}
  \def\finish@tub@url#1{\tt #1\endgroup}
  \fi
  \let\tburl\url  % no hyperref, so just \url is fine;
  \let\tbsurl\url % \let instead of \def so we can still
  \let\tbhurl\url % use \def\url{\tbsurl} without infloop.
\else
  % This hyperref hook-in is due to Ulrike Fischer.
  % \url{https://github.com/latex3/hyperref/issues/125}.
  % \tb[sh]url@ are defined next.
  \DeclareRobustCommand*{\tburl}{\tbsurl}%
  \DeclareRobustCommand*{\tbsurl}{\hyper@normalise\tbsurl@}%
  \DeclareRobustCommand*{\tbhurl}{\hyper@normalise\tbhurl@}%
\fi
}
\ExplSyntaxOn
\def\tbsurl@#1  % https
 {
   \str_set:Nn\l_tmpa_str{#1}
   \str_if_in:NnTF \l_tmpa_str {http://}
    {
      \tbhurl@{#1} % if http, redirect to remove protocol
      % this version prints the http, as we originally thought was better.
      % \expandafter\hyper@linkurl
      % \expandafter{\expandafter\Hurl\expandafter{\l_tmpa_str}}{\l_tmpa_str}
    }
    {
      \str_remove_once:Nn \l_tmpa_str {https://}
      \expandafter\hyper@linkurl
        \expandafter{\expandafter\Hurl\expandafter{\l_tmpa_str}}
                                                          {https://\l_tmpa_str}
    }
 }
\def\tbhurl@#1  % http
 {
   \str_set:Nn\l_tmpa_str{#1}
   \str_remove_once:Nn \l_tmpa_str {http://}
   \expandafter\hyper@linkurl\expandafter{\expandafter\Hurl\expandafter
                                            {\l_tmpa_str}}{http://\l_tmpa_str}
 }
\ExplSyntaxOff
\def\tburlfootnote{\tbsurlfootnote}
\def\tbsurlfootnote#1{\unskip\footnote{\raggedright\tbsurl{#1}}}
\def\tbhurlfootnote#1{\unskip\footnote{\raggedright\tbhurl{#1}}}
\DeclareRobustCommand{\tbppkernfoot}{\tubthinnerspace}

\DeclareRobustCommand{\!}{\ifmmode\mskip-\thinmuskip \else\kern-0.16667em \fi}
\DeclareRobustCommand{\tubthinnerspace}
  {\ifmmode\mskip.5\thinmuskip \else\kern0.08333em \fi}
\DeclareRobustCommand{\tubthinnerspaceneg}
  {\ifmmode\mskip-.5\thinmuskip \else\kern-0.08333em \fi}
\DeclareRobustCommand{\tubsmallerskip}
  {\vskip 1.5pt plus .75pt minus .75pt\relax}
\def\endash{--}
\def\emdash{\endash-}
\def\d@sh#1#2{\unskip#1\thinskip#2\thinskip\ignorespaces}
\def\dash{\d@sh\nobreak\endash}
\def\Dash{\d@sh\nobreak\emdash}
\def\ldash{\d@sh\empty{\hbox{\endash}\nobreak}}
\def\rdash{\d@sh\nobreak\endash}
\def\Ldash{\d@sh\empty{\hbox{\emdash}\nobreak}}
\def\Rdash{\d@sh\nobreak\emdash}
\def\hyph{-\penalty\z@\hskip\z@skip }
\def\slash{/\penalty\z@\hskip\z@skip }
\def\nth#1{%
    \def\reserved@a##1##2\@nil{\ifcat##1n%
           0%
          \let\reserved@b\ensuremath
      \else##1##2%
          \let\reserved@b\relax
      \fi}%
    \TestCount=\reserved@a#1\@nil\relax
    \ifnum\TestCount <0 \multiply\TestCount by\m@ne \fi % subdue negatives
    \T@stCount=\TestCount
    \divide\T@stCount by 100 \multiply\T@stCount by 100
    \advance\TestCount by-\T@stCount     % n mod 100
    \ifnum\TestCount >20 \T@stCount=\TestCount
      \divide\T@stCount by 10 \multiply\T@stCount by 10
      \advance\TestCount by-\T@stCount   % n mod 10
    \fi
     \reserved@b{#1}%
       \textsuperscript{\ifcase\TestCount th%    0th
                        \or   st%                1st
                        \or   nd%                2nd
                        \or   rd%                3rd
                        \else th%                nth
                        \fi}%
}
\def\Review{\@ifnextchar:{\@Review}{\@Review:}}
\def\@Review:{\@ifnextchar[%]
  {\@Rev}%
  {\@Rev[Book review]}}
\def\@Rev[#1]#2{{\ignorespaces#1\unskip:\enspace\ignorespaces
                                        \slshape\mdseries#2}}
\def\reviewitem{\addvspace{\BelowTitleSkip}%
  \def\revauth##1{\def\therevauth{##1, }\ignorespaces}%
  \def\revtitle##1{\def\therevtitle{{\slshape##1}. }\ignorespaces}%
  \def\revpubinfo##1{\def\therevpubinfo{##1.}\ignorespaces}%
}
\def\endreviewitem{{\noindent\interlinepenalty=10000
  \therevauth\therevtitle\therevpubinfo\endgraf}%
  \vskip\medskipamount
}
\def\titleref#1{{\slshape\frenchspacing#1\nocorr}}
\let\booktitle=\titleref % older name
\newcount\issueseqno \issueseqno=-1
\def\v@lx{\gdef\volx{Volume~\volno~(\volyr), No.~\issno}}
\def\volyr{}
\def\volno{}
\def\vol#1, #2.{%
        \gdef\volno{#1}%
        \gdef\issno{#2}%
        \setbox\TestBox=\hbox{\volyr}%
        \ifdim \wd\TestBox > .2em \v@lx \fi }
\def\issyear#1.{%
        \gdef\issdt{#1}\gdef\volyr{#1}%
        \gdef\bigissdt{#1}%
        \setbox\TestBox=\hbox{\volno}%
        \ifdim \wd\TestBox > .2em \v@lx \fi }
\def\issdate#1#2 #3.{%
        \gdef\issdt{#1#2 #3}\gdef\volyr{#3}%
        \gdef\bigissdt{#1{\smc\uppercase{#2}} #3}%
        \setbox\TestBox=\hbox{\volno}%
        \ifdim \wd\TestBox > .2em \v@lx \fi }
\vol 0, 0.
\issdate Thermidor, 9999.
\def\tubissue#1{\@ifnextchar(%)
  {\@tubissue@b{#1}}
  {\@tubissue@a{#1}}}
\def\@tubissue@b#1(#2){\@tubissue@a{#1}{#2}}
\def\@tubissue@a#1#2%
  {\TUB~#1, no.~#2}
\def\infil@{\jobname}
\def\Input #1 {\ifnum\issueseqno<0
    \def\infil@{#1}%
  \else
    \def\infil@{tb\number\issueseqno#1}
  \fi
  \edef\jobname{\infil@}\@readFLN
  \@@input \infil@\relax
  \if@RMKopen
    \immediate\closeout\@TBremarkfile\@RMKopenfalse
  \fi
}
\newif\if@RMKopen        \@RMKopenfalse
\newwrite\@TBremarkfile
\def\@TBremark#1{%
  \if@RMKopen
  \else
    \@RMKopentrue\immediate\openout\@TBremarkfile=\infil@.rmk
  \fi
  \toks@={#1}%
  \immediate\write\@TBremarkfile{^^J\the\toks@}%
  \immediate\write16{^^JTBremark:: \the\toks@^^J}%
}
\let\TBremark=\gobble
\def\TBEnableRemarks{\let\TBremark\@TBremark}
\def\TUBedit#1{}
\def\TUBfilename#1#2{\expandafter\def\csname file@@#1\endcsname{#2}}
\newread\@altfilenames
\def\@readFLN{\immediate\openin\@altfilenames=\jobname.fln
  \ifeof\@altfilenames\let\@result\relax\else
  \def\@result{\@@input\jobname.fln }\fi
  \immediate\closein\@altfilenames
  \@result}
\@readFLN
\everyjob=\expandafter{\the\everyjob\@readFLN}
\InputIfFileExists{\jobname.fln}%
   {\TBInfo{Reading alternative file \jobname.fln}}
   {}
\def\@tubfilename#1{\expandafter\ifx\csname file@@#1\endcsname\relax
  #1\else\csname file@@#1\endcsname\fi}
\def\fileinput#1{\@@input\@tubfilename{#1} }
\def\pagexrefON#1{%
        \write-1{\def\expandafter\noexpand\csname#1\endcsname{\number\c@page}}%
        \write\ppoutfile{%
                \def\expandafter\noexpand\csname#1\endcsname{\number\c@page}}%
        }
\def\PageXrefON#1{%
        \immediate\write-1{\def\expandafter
                        \noexpand\csname#1\endcsname{\number\c@page}}%
        \immediate\write\ppoutfile{\def\expandafter
                        \noexpand\csname#1\endcsname{\number\c@page}}}
\def\pagexrefOFF#1{}
\let\pagexref=\pagexrefOFF
\def\PageXrefOFF#1{}
\let\PageXref=\PageXrefOFF
\def\xreftoON#1{%
  \ifundefined{#1}%
    ???\TBremark{Need cross reference for #1.}%
  \else\csname#1\endcsname\fi}
\def\xreftoOFF#1{???}
\let\xrefto=\xreftoOFF
\let\TBdriver\gobble
\ifx\tubomithyphenations\@thisisundefined
\InputIfFileExists{ushyphex.tex}{}{} % ok if it's missing
\hyphenation{Del-a-ware Dijk-stra Duane Eijk-hout
  Flor-i-da Free-BSD Ghost-script
  Hara-lam-bous Jac-kow-ski Ja-pa-nese Karls-ruhe Lua-Meta
  Mac-OS Math-Sci-Net
  Net-BSD Open-BSD Open-Office
  Pak-i-stan Post-Script Rich-ard Skoup South-all
  Vieth VM-ware Win-Edt
  acro-nym acro-nyms analy-sis ap-pen-di-ces ap-pen-dix asyn-chro-nous
  bib-lio-graph-i-cal bit-map bit-mapped bit-maps buf-fer buf-fers bool-ean
  col-umns com-put-able com-put-abil-ity
  data-base data-bases
   de-allo-cate de-allo-cates de-allo-cated de-allo-ca-tion
   de-riv-a-tive de-riv-a-tives de-riv-a-ble der-i-va-tion dis-trib-ut-able
  es-sence
  fall-ing
  half-way
  in-fra-struc-ture
  key-note
  long-est
  ma-gyar man-u-script man-u-scripts meta-table meta-tables
   mne-mon-ic mne-mon-ics mono-space mono-spaced
  name-space name-spaces
  off-line over-view
  pal-ettes par-a-digm par-a-dig-matic par-a-digms
   pipe-line pipe-lines
   plug-in plug-ins pres-ent-ly pro-gram-mable
  re-allo-cate re-allo-cates re-allo-cated re-printed
  set-ups se-vere-ly spell-ing spell-ings stand-alone strong-est
   sub-ex-pres-sion sub-tables sur-gery syn-chro-ni-city syn-chro-nous
  text-height text-length text-width
   time-stamp time-stamped time-stamps
  vis-ual vis-ual-ly
  which-ever white-space white-spaces wide-spread wrap-around
}
\fi
\PrelimDrafttrue
\textheight 54pc     % 648pt = 645.58bp = 8.97in
\textwidth 39pc      % 468pt = 466.25bp = 6.48in
\columnsep 1.5pc     %  18pt =  17.93bp =  .249in
\columnwidth 18.75pc % 225pt = 224.16bp = 3.11in
\hfuzz 1pt
\parindent \normalparindent % 20pt
\parskip \z@ % \@plus\p@
\leftmargini 2em
\leftmarginv .5em
\leftmarginvi .5em
\oddsidemargin \z@
\evensidemargin \z@
\topmargin -2.5pc   % 30pt = 29.89bp = .415in
\headheight 12\p@
\headsep 20\p@
\marginparwidth 48\p@
\marginparsep 10\p@
\partopsep=\z@
\topsep=3\p@\@plus\p@\@minus\p@
\parsep=3\p@\@plus\p@\@minus\p@
\itemsep=\parsep
\newdimen\tubcolwidthandgutter
  \tubcolwidthandgutter=\columnwidth
  \advance\tubcolwidthandgutter by \columnsep
\if@tubtwocolumn \twocolumn \else
  \onecolumn
  \textwidth=34pc
  \oddsidemargin=30.8775pt
  \evensidemargin=\oddsidemargin
\fi
\newdimen\pagewd        \pagewd=\textwidth
\newdimen\trimwd        \trimwd=\pagewd
\newdimen\trimlgt       \trimlgt=11in
\newdimen\headmargin    \headmargin=3.5pc
\renewcommand{\topfraction}{.9}  % don't go to a float page so soon
\renewcommand{\dbltopfraction}{.9}
\renewcommand{\bottomfraction}{.7}
\renewcommand{\textfraction}{.1}
\renewcommand{\floatpagefraction}{.8}
\renewcommand{\dblfloatpagefraction}{.8} % the most common one used
\newcommand{\DeclareLaTeXLogo}[5]{\expandafter\def
  \csname @LaTeX@#1/#2/#3\endcsname{{#4}{#5}}}
\def\@LaTeX@default{{.36}{.15}}
\DeclareLaTeXLogo{cmss}{bx}{n}{.3}{.15}
\DeclareLaTeXLogo{lmss}{bx}{n}{.3}{.15}
\DeclareLaTeXLogo{cmr}{m}{it}{.29}{.2}
\DeclareLaTeXLogo{lmr}{m}{it}{.29}{.2}
\DeclareLaTeXLogo{cmr}{m}{sl}{.29}{.15}
\DeclareLaTeXLogo{lmr}{m}{sl}{.29}{.15}
\DeclareLaTeXLogo{cmr}{bx}{it}{.29}{.2}
\DeclareLaTeXLogo{lmr}{bx}{it}{.29}{.2}
\DeclareLaTeXLogo{cmr}{bx}{sl}{.29}{.2}
\DeclareLaTeXLogo{lmr}{bx}{sl}{.29}{.2}
\DeclareLaTeXLogo{bch}{m}{n}{.2}{.08}
\DeclareLaTeXLogo{bch}{m}{it}{.2}{.08}
\DeclareRobustCommand{\LaTeX}{\expandafter\let\expandafter\reserved@a
  \csname @LaTeX@\f@family/\f@series/\f@shape\endcsname
  \ifx\reserved@a\relax\let\reserved@a\@LaTeX@default\fi
  \expandafter\@LaTeX\reserved@a}
\newcommand{\@LaTeX}[2]{%
  %\wlog{latex logo family=\f@family/\f@series/\f@shape -> #1, #2.}%
  L\kern-#1em
  {\sbox\z@ T%
   \vbox to\ht0{\hbox{$\m@th$%
                      \csname S@\f@size\endcsname
                      \fontsize\sf@size\z@
                      \math@fontsfalse\selectfont
                      A}%
                \vss}%
  }%
  \kern-#2em%
  \TeX}
\def\theauthor#1{\csname theauthor#1\endcsname}
\def\theaddress#1{\csname theaddress#1\endcsname}
\def\thenetaddress#1{\csname thenetaddress#1\endcsname}
\def\thePersonalURL#1{\csname thePersonalURL#1\endcsname}
\def\theORCID#1{\csname theORCID#1\endcsname}
\def\@defaultauthorlist{%
  \@getauthorlist\@firstofone
}
\def\@getauthorlist#1{%
  \count@\authornumber
  \advance\count@ by -2
  \@tempcnta0
  \loop
    \ifnum\count@>0
      \advance\@tempcnta by \@ne
      #1{\ignorespaces\theauthor{\number\@tempcnta}\unskip, }%
      \advance\count@ by \m@ne
  \repeat
  \count@\authornumber
  \advance\count@ by -\@tempcnta
  \ifnum\authornumber>0
    \ifnum\count@>1
      \count@\authornumber
      \advance\count@ by \m@ne
      #1{\ignorespaces\theauthor{\number\count@}\unskip\@tubauthorlastsep}%
    \fi
    #1{\ignorespaces\theauthor{\number\authornumber}\unskip}
  \fi
}
\def\@tubauthorlastsep{, }% until 2018, was: "\ and "
\def\signature#1{\def\@signature{#1}}
\def\@signature{\@defaultsignature}
\def\@defaultsignature{{%
    \let\thanks\@gobble
    \frenchspacing
    %
    \ifnum\authornumber<0
      \medskip
      \signaturemark
      \theauthor{\number\authornumber}\\
      \theaddress{\number\authornumber}\\
      \allowhyphens
      \thenetaddress{\number\authornumber}\\
      \thePersonalURL{\number\authornumber}\\
      \theORCID{\number\authornumber}\\
    \else
      \count@=0
      \loop
        \ifnum\count@<\authornumber
          \medskip
          \advance\count@ by \@ne
          \signaturemark
          \theauthor{\number\count@}\\
          \theaddress{\number\count@}\\
          {%
            \allowhyphens
            \thenetaddress{\number\count@}\\
            \thePersonalURL{\number\count@}\\
            \theORCID{\number\count@}\\
          }%
      \repeat
    \fi
  }%
}
\newdimen\signaturewidth   \signaturewidth=12pc
\newcommand{\makesignature}[1][\medskipamount]{%
  \@tempdima\signaturewidth
  \advance\@tempdima 1.5pc
  \ifdim \@tempdima>\columnwidth
    \signaturewidth \columnwidth
    \advance\signaturewidth -1.5pc
  \fi
  \par
  \penalty9000
  \vspace{#1}%
  \rightline{%
    \vbox{\hsize\signaturewidth \ninepoint \raggedright
      \parindent \z@ \everypar={\hangindent 1pc }%
      \parskip \z@skip
      \def\|{\unskip\hfil\break}%
      \def\\{\endgraf}%
      \def\phone{\rm Phone: }%
      \def\tubmultipleaffilauthor{\unskip,\\\hspace*{1em}}%
      \rm\@signature}%
  }%
  \ifnum\authornumber<0 \endgroup\fi
}
\def\signaturemark{\leavevmode\llap{$\diamond$\enspace}}
\def\tubmultipleaffilauthor{\unskip,\ \ignorespaces}%
\def\tubmultipleaffilnet{\unskip\textrm{\,,\ \ignorespaces}}
\newcount\authornumber
\authornumber=0
\def\author{%
  \global\advance\authornumber\@ne
  \TB@author
}
\def\contributor{%
  \begingroup
  \authornumber\m@ne
  \TB@author
}
\def\TB@author#1{%
  \expandafter\def\csname theauthor\number\authornumber\endcsname
      {\ignorespaces#1\unskip}%
  \expandafter\let\csname thePersonalURL\number\authornumber\endcsname
    \@gobble
  \expandafter\let\csname theORCID\number\authornumber\endcsname
    \@gobble
  }
\def\EDITORnoaddress{%
  \expandafter\let\csname theaddress\number\authornumber\endcsname
    \@gobble
}
\def\EDITORnonetaddress{%
  \expandafter\let\csname thenetaddress\number\authornumber\endcsname
    \@gobble
}
\def\address#1{%
  \expandafter\def\csname theaddress\number\authornumber\endcsname
      {\leavevmode\ignorespaces#1\unskip}}
\def\network#1{\def\@network{#1: }}
\newcommand{\netaddress}[1][\relax]{%
  \begingroup
  \def\@network{}%
  #1\@sanitize\makespace\ \makeactive\@%
  \makeescape! \makebgroup[ \makeegroup]% seems more useful than literals
  \makeactive\.\makeactive\%\@relay@netaddress}%
\def\@relay@netaddress#1{%
  \ProtectNetChars
  \expandafter\protected@xdef
      \csname thenetaddress\number\authornumber\endcsname
    {\protect\leavevmode\textrm{\@network}%
     {\protect\NetAddrChars\net
      \ignorespaces#1\unskip}}%
  \endgroup
}
\def\personalURL#1{%
  % define \cs{thePersonalURL}\meta{n} for author \meta{n}'s \personalURL.
  \expandafter\protected@xdef
    \csname thePersonalURL\number\authornumber\endcsname{%
      \protect\leavevmode
      \ignorespaces
      \protect\tburl{#1}%
      \unskip
  }%
}
{%
  \makecomment\*
  \makeactive\@
  \gdef\netaddrat{\makeactive\@*
    \def@{\discretionary{\char"40}{}{\char"40}}}
  \makeactive\%
  \gdef\netaddrpercent{\makeactive\%*
    \def%{\discretionary{\char"25}{}{\char"25}}}
  \makeactive\.
  \gdef\netaddrdot{\makeactive\.*
    \def.{\discretionary{\char"2E}{}{\char"2E}}}
  \gdef\NetAddrChars{\netaddrat \netaddrpercent \netaddrdot}
  \makeactive\/
  \gdef\URLchars{*
    \NetAddrChars
    \makeactive\/*
    \def/{\discretionary{\char"2F}{}{\char"2F}}}
  \gdef\ProtectNetChars{*
    \def@{\protect@}*
    \def%{\protect%}*
    \def.{\protect.}*
    \def/{\protect/}*
    }
}
\if@compatibility
  \DeclareRobustCommand{\net}{\normalfont\ttfamily\mathgroup\symtypewriter}
\else
  \DeclareOldFontCommand{\net}{\ttfamily\upshape\mdseries}{\mathtt}
\fi
\def\authorlist#1{\def\@author{#1}}
\def\@author{\@defaultauthorlist}
\def\ORCID#1{%
  \expandafter\def\csname theORCID\number\authornumber\endcsname
      {\leavevmode \ignorespaces {\SMC ORCID} #1\unskip}}
\def\mspmetavar#1#2{}
\newif\if@articletitle
\def\maketitle{\@ifstar
  {\@articletitlefalse\@r@maketitle}%
  {\@articletitletrue\@r@maketitle}%
}
\def\@r@maketitle{\par
 \iftubsecondcolstart \null\newpage\tubsecondcolstartextra \fi
 \ifdim\PreTitleDrop > \z@
   \loop
   \ifdim \PreTitleDrop > \textheight
     \vbox{}\vfil\eject
     \advance\PreTitleDrop by -\textheight
   \repeat
   \vbox to \PreTitleDrop{\vfil}%
   \global\PreTitleDrop=\z@
 \fi
 \begingroup
 \setcounter{footnote}{0}
 \global\@topnum\z@ % disallow floats above the title
 \def\thefootnote{\fnsymbol{footnote}}
 \@maketitle
 \@thanks
 \endgroup
 \setcounter{footnote}{0}
 \gdef\@thanks{}
 }
\def\rhTitle{}% avoid error if no author or title
\renewcommand{\title}{\@dblarg\TB@title}
\def\TB@title[#1]#2{\gdef\@title{#2}%
  \bgroup
    \let\thanks\@gobble
    \def\\{\unskip\space\ignorespaces}%
    \protected@xdef\rhTitle{#1}%
  \egroup
}
\def\shortTitle #1{\def\rhTitle{#1}}
\newif\ifshortAuthor
\def\shortAuthor #1{\def\rhAuthor{#1}\shortAuthortrue}
\def\secsep{\vskip 5\baselineskip}
\newdimen\stbaselineskip        \stbaselineskip=18\p@
\newdimen\stfontheight
\settoheight{\stfontheight}{\sectitlefont O}
\newif\ifWideSecTitle
\newif\iftubtitlerulefullwidth
\newif\ifSecTitle \SecTitlefalse
\newcommand{\sectitle}{%
  \SecTitletrue
  \@ifstar
    {\WideSecTitletrue\def\s@ctitle}%
    {\WideSecTitlefalse\def\s@ctitle}%
}
\newdimen\PreTitleDrop   \PreTitleDrop=\z@
\newskip\AboveTitleSkip   \AboveTitleSkip=12pt
\newskip\BelowTitleSkip   \BelowTitleSkip=8pt plus2pt minus1pt
\newdimen\strulethickness \strulethickness=.6pt
\def\@sectitle #1{%
  \par
  \penalty-1000
  \ifWideSecTitle\else\secsep\fi
  {%
    \fboxrule\strulethickness
    \fboxsep\z@
    \noindent\framebox[\hsize]{%
      \vbox{%
        \raggedcenter
        \let\\\@sectitle@newline
        \sectitlefont
        \makestrut[2\stfontheight;\z@]%
        #1%
        \makestrut[\z@;\stfontheight]\endgraf
      }%
    }%
  }%
  \nobreak
  \vskip\baselineskip
}
\newcommand{\@sectitle@newline}[1][\z@]{%
  \ifdim#1>\z@
    \makestrut[\z@;#1]%
  \fi
  \unskip\break
}
\def\@makesectitle{\ifSecTitle
    \global\SecTitlefalse
    \ifWideSecTitle
      \twocolumn[\@sectitle{\s@ctitle}]%
      \global\WideSecTitlefalse
    \else
      \@sectitle{\s@ctitle}%
    \fi
  \else
    \vskip\AboveTitleSkip
    \kern\topskip
    \hrule \@height\z@ \@depth\z@ \@width 10\p@
    \kern-\topskip
    \kern-\strulethickness
    \iftubtitlerulefullwidth
      \hrule \@height\strulethickness \@depth\z@ width\textwidth
    \else
      \hrule \@height\strulethickness \@depth\z@
    \fi
    \kern\medskipamount
    \nobreak
  \fi
}
\def\@maketitle{%
  \@makesectitle
  \if@articletitle{%
    \nohyphens \interlinepenalty\@M
    \setbox0=\hbox{%
      \let\thanks\@gobble
      \let\\=\quad
      \let\and=\quad
      \ignorespaces\@author}%
    {%
      \noindent\bf\raggedright\ignorespaces\frenchspacing
      \let\BibTeX=\bfBibTeX % else LaTeX Font Warning:
                            %      Font shape `OT1/cmr/bx/sc' undefined
      \@title\endgraf
    }%
    \ifdim \wd0 < 5\p@               % omit if author is null
    \else
      \nobreak \vskip 4\p@
      {%
        \leftskip=\normalparindent
        \raggedright
        \def\and{\unskip\\}%
        \noindent\@author\endgraf
      }%
    \fi
    \nobreak
    \vskip\BelowTitleSkip
  }\fi%
  \global\@afterindentfalse
  \aftergroup\@afterheading
}
\newenvironment{dedication}%
  {\raggedright\noindent\itshape\ignorespaces}%
  {\endgraf\medskip}
\def\@tubonecolumnabstractstart{%
      \list{}{\listparindent\normalparindent
         \itemindent\z@ \leftmargin\@tubfullpageindent
         \rightmargin\leftmargin \parsep \z@}\item[]\ignorespaces
}
\def\@tubonecolumnabstractfinish{%
      \endlist
}
\renewenvironment{abstract}%
  {\begin{SafeSection}%
    \section*{%
        \if@tubtwocolumn\else \hspace*{\@tubfullpageindent}\fi
        Abstract}%
    \if@tubtwocolumn\else \@tubonecolumnabstractstart \fi
  }%
  {\if@tubtwocolumn\else \@tubonecolumnabstractfinish \fi
   \end{SafeSection}}
\newenvironment{longabstract}%
  {\begin{SafeSection}%
    \section*{Abstract}%
    \bgroup\small
  }%
  {\endgraf\egroup
    \end{SafeSection}%
  \vspace{.25\baselineskip}
  \begin{center}
    {$--*--$}
  \end{center}
  \vspace{.5\baselineskip}}
\def\tubsechook{}
\def\tubsecfmt{\normalsize\bf\raggedright\frenchspacing\nohyphens\tubsechook}
\def\tubruninglue{-1em plus-2\fontdimen3\font minus-\fontdimen4\font}
\def\tubruninsecfmt{\normalsize\bf\tubsechook}
\if@numbersec
  \def\section{\TB@startsection{%
    {section}                 % name of counter
    {1}                       % level
    {0pt}                     % indent
    {-8pt plus-2pt minus-2pt} % beforeskip; negative -> \noindent after
    {4pt}                     % afterskip;  negative -> hspace for run-in
    {\tubsecfmt}}}            % style
  %
  \def\subsection{\TB@startsection{%
    {subsection}%
    2%
    \z@
    {-8\p@ \@plus-2\p@ \@minus-2\p@}%
    {4\p@}%
    {\tubsecfmt}}}
  %
  \def\subsubsection{\TB@startsection{%
    {subsubsection}%
    3%
    \z@
    {-8\p@ \@plus-2\p@ \@minus-2\p@}%
    {4\p@}%
    {\tubsecfmt}}}
  %
  \def\paragraph{\TB@startsection{%
    {paragraph}%
    4%
    \z@
    {4\p@ \@plus1\p@ \@minus1\p@}%
    {\tubruninglue}
    {\tubruninsecfmt}}}
\else
  \setcounter{secnumdepth}{0}
  \def\section{\TB@nolimelabel\TB@startsection{%
    {section}% same as numbered
    1%
    \z@
    {-8\p@ \@plus-2\p@ \@minus-2\p@}%
    {4\p@}%
    {\tubsecfmt}}}
  %
  \def\subsection{\TB@nolimelabel\TB@startsection{%
    {subsection}%
    2%
    \z@
    {-8\p@ \@plus-2\p@ \@minus-2\p@}%
    {\tubruninglue}
    {\tubruninsecfmt}}}
  %
  \def\subsubsection{\TB@nolimelabel\TB@startsection{%
    {subsubsection}%
    3%
    \parindent
    {-8\p@ \@plus-2\p@ \@minus-2\p@}%
    {\tubruninglue}
    {\tubruninsecfmt}}}
\fi
\def\TB@startsection#1{\@startsection#1}%
\def\TB@safe@startsection#1{\@startsection#1}
\newenvironment{SafeSection}%
  {\let\TB@startsection\TB@safe@startsection}%
  {}
\if@numbersec
  \def\subparagraph{\TB@nosection\subparagraph\paragraph}
\else
  \def\paragraph{\TB@nosection\paragraph\subsubsection}
  \def\subparagraph{\TB@nosection\subparagraph\subsubsection}
\fi
\def\chapter{\TB@nosection\chapter\section}
\def\part{\TB@nosection\part\section}
\def\TB@nosection#1#2{\TBWarning{class does not support \string#1,
    \string#2\space used instead}#2}
\def\TBtocsectionfont{\normalfont}
\newskip\TBtocsectionspace  \TBtocsectionspace=1.0ex\@plus\p@
\def\l@section#1#2{%
  \addpenalty{\@secpenalty}%
  \addvspace{\TBtocsectionspace}%
  \@tempdima 1.5em
  \begingroup
    \parindent\z@
    \rightskip=0pt plus2em
    \parfillskip\z@
    \hyphenpenalty=10000
    \TBtocsectionfont
    \leavevmode
    \advance\leftskip by \@tempdima % space between section number and text
    \hskip-\leftskip
    %
    \ifx\UseHookWithArguments\undefined\else % hook before number and text
      \UseHookWithArguments{contentsline/text/before}{4}
        {\toclevel@part}{#1}{#2}{\@contentsline@destination}%
    \fi
    %
    % don't worry if this cs is not defined, hence the \csname.
    % If it doesn't exist, we just typeset #1 as text.
    \csname contentsline@text@1@format\endcsname
    {#1% number and title
     \unskip % avoid extra space just in case
     \csname pdffakespace\endcsname % fake space if pdftex
     ~% ensure at least a word space between text and page number
    }
    %
    \ifx\UseHookWithArguments\undefined\else % hook after number and text
      \UseHookWithArguments{contentsline/text/after}{4}
        {\toclevel@part}{#1}{#2}{\@contentsline@destination}%
    \fi
    \nobreak\hfil
    \nobreak
    % page number
    \hb@xt@\@pnumwidth{\hfil
      \ifx\UseHookWithArguments\undefined\else
        \UseHookWithArguments{contentsline/page/before}{4}
          {\toclevel@part}{#1}{#2}{\@contentsline@destination}%
      \fi
      \tubtypesetpageno{#2}%
      \ifx\UseHookWithArguments\undefined\else
        \UseHookWithArguments{contentsline/page/after}{4}
          {\toclevel@part}{#1}{#2}{\@contentsline@destination}%
      \fi
    }\par
  \endgroup}
\renewcommand{\appendix}{\par
  \renewcommand{\thesection}{\@Alph\c@section}%
  \setcounter{section}{0}%
  \if@numbersec
  \else
    \setcounter{secnumdepth}{1}%
  \fi
  \def\@tempa{appendix}
  \ifx\@tempa\@currenvir
    \expandafter\@appendix@env
  \fi
}
\newcommand{\app@prefix@section}{}
\newcommand{\@appendix@env}[1][Appendix]{%
  \renewcommand{\@seccntformat}[1]{\csname app@prefix@##1\endcsname
    \csname the##1\endcsname\quad}%
  \renewcommand{\app@prefix@section}{#1 }%
}
\let\endappendix\relax
\def\TB@nolimelabel{%
  \def\@currentlabel{%
    \protect\TBWarning{%
      Invalid reference to numbered label on page \thepage
      \MessageBreak made%
    }%
    \textbf{?!?}%
  }%
}
\@ifl@t@r\fmtversion{2023-06-01}{}{%
\let\TB@@sect\@sect
\let\TB@@ssect\@ssect
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \def\@currentlabelname{#7}%
  \TB@@sect{#1}{#2}{#3}{#4}{#5}{#6}[{#7}]{#8}%
}
\def\@ssect#1#2#3#4#5{%
 \def\@currentlabelname{#5}%
 \TB@@ssect{#1}{#2}{#3}{#4}{#5}%
}
} % LaTeX earlier than June 2023
\@ifl@t@r\fmtversion{2023-06-01}{%
  \RequirePackage{gettitlestring}
  \AddToHookWithArguments{cmd/@sect/before}{%
    \GetTitleString{#7}%
    \let\@currentlabelname\GetTitleStringResult}%
  \AddToHookWithArguments{cmd/@ssect/before}{%
    \GetTitleString{#5}%
    \let\@currentlabelname\GetTitleStringResult}%
}{% else older latex:
  \let\@savelatexlabel=\label  % so save original LaTeX command
  %
  \def\label#1{%
    \@savelatexlabel{#1}%
    \@bsphack
    \if@filesw
      \protected@write\@auxout{}%
        {\string\newlabel{nr@#1}{{\@currentlabel}{\@currentlabelname}}}%
    \fi
    \@esphack}
  % in case there are no sectioning commands:
  \let\@currentlabelname\@empty
}
\AtBeginDocument{%
  \@ifl@t@r\fmtversion{2023-06-01}%
  { % after June 2023, LaTeX stores the label name; use that.
    \long\def\@thirdoffive#1#2#3#4#5{#3}
    \providecommand\nameref[1]{%
      \expandafter\@setref
      \csname r@#1\endcsname\@thirdoffive{#1}}%
  }
  { % for earlier versions, still avoid overwriting \nameref per above.
    % but if not otherwise defined, use the "nr" label defined by our \label.
   \providecommand\nameref[1]{%
     \expandafter\@setref
     \csname r@nr@#1\endcsname\@secondoftwo{#1}}%
  }%
}
\newdimen\@tubfullpageindent
\@tubfullpageindent = \if@tubtwocolumn 4.875pc \else 3.875pc \fi
\let\tubcaptionleftglue=\hfil
\def\tubcaptionfonts{\small}%
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  % try in an hbox:
  \sbox\@tempboxa{\tubcaptionfonts \frenchspacing \tubmakecaptionbox{#1}{#2}}%
  \ifdim \wd\@tempboxa > \hsize
    {% caption doesn't fit on one line; set as a paragraph.
     \tubcaptionfonts \raggedright \hyphenpenalty=\@M \parindent=1em
     % indent full-width captions {figure*}, but not single-column {figure}.
     \ifdim\hsize = \textwidth
       \leftskip=\@tubfullpageindent \rightskip=\leftskip
       \advance\rightskip by 0pt plus2em  % increase acceptable raggedness
     \fi
     \noindent \tubmakecaptionbox{#1}{#2}\par}%
  \else
    % fits on one line; use the hbox, usually centered.  Do not reset its glue.
    \global\@minipagefalse
    \hb@xt@\hsize{\tubcaptionleftglue\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\def\tubmakecaptionbox#1#2{{\tubcaptionfonts\textbf{#1}}:\ #2}%
\def\lstlistingnamestyle{\bfseries}
\setlength\abovecaptionskip{3pt plus1pt minus1pt}
\setlength\floatsep    { 9pt plus3pt minus2pt} % default 12pt plus2pt minus2pt
\setlength\textfloatsep{12pt plus4pt minus3pt} % default 20pt plus2pt minus4pt
\setcounter{bottomnumber}{2} % default 1
\setcounter{topnumber}{4}    % default 2
\setcounter{totalnumber}{6}  % default 3
\renewcommand{\normalsize}{%
   \@setfontsize\normalsize\@xpt\@xiipt
   \abovedisplayskip=3\p@\@plus 3\p@\@minus\p@
   \belowdisplayskip=\abovedisplayskip
   \abovedisplayshortskip=\z@\@plus 3\p@
   \belowdisplayshortskip=\p@\@plus 3\p@\@minus\p@
}

\renewcommand{\small}{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip=2.5\p@\@plus 2.5\p@\@minus\p@
   \belowdisplayskip=\abovedisplayskip
   \abovedisplayshortskip=\z@\@plus 2\p@
   \belowdisplayshortskip=\p@\@plus 2\p@\@minus\p@
}

\renewcommand{\footnotesize}{%
    \@setfontsize\footnotesize\@viiipt{9.5}%
    \abovedisplayskip=3\p@\@plus 3\p@\@minus\p@
    \belowdisplayskip=\abovedisplayskip
    \abovedisplayshortskip=\z@\@plus 3\p@
    \belowdisplayshortskip=\p@\@plus 3\p@\@minus\p@
}
\def\@listi{%
  \leftmargin\leftmargini\parsep=\p@\@plus\p@\@minus\p@
  \itemsep=\parsep
  \listparindent=1em
  }

\def\@listii{%
  \leftmargin\leftmarginii
  \labelwidth=\leftmarginii \advance\labelwidth-\labelsep
  \topsep=2\p@\@plus\p@\@minus\p@ % space between first item and preceding
  \parsep=\p@\@plus\p@\@minus\p@
  \itemsep=\parsep                % space between successive items
  \listparindent=1em              % indentation of subsequent paragraphs
  }

\def\@listiii{%
  \leftmargin=\leftmarginiii
  \labelwidth=\leftmarginiii \advance\labelwidth-\labelsep
  \topsep=\p@\@plus\p@\@minus\p@
  \parsep=\z@
  \itemsep=\topsep
  \listparindent=1em
  }
\def\quote{\list{}{\rightmargin.5\leftmargin}\item[]}
\renewcommand{\quotation}{\list{}{\listparindent 1.5em
     \rightmargin.5\leftmargin\parsep \z@\@plus\p@}\item[]}
\newenvironment{compactitemize}%
   {\begin{itemize}%
     \setlength{\itemsep}{0pt}%
     \setlength{\parskip}{0pt}%
     \setlength{\parsep} {0pt}%
   }%
   {\end{itemize}}
\newenvironment{compactenumerate}%
   {\begin{enumerate}%
     \setlength{\itemsep}{0pt}%
     \setlength{\parskip}{0pt}%
     \setlength{\parsep} {0pt}%
   }%
   {\end{enumerate}}
\newenvironment{compactdescription}%
   {\begin{description}%
     \setlength{\itemsep}{0pt}%
     \setlength{\parskip}{0pt}%
     \setlength{\parsep} {0pt}%
   }%
   {\end{description}}
\let\@TBverbatim\verbatim
\let\@TBendverbatim\endverbatim
\def\verbatim{\par\obeylines
  \futurelet\reserved@a\@switch@sqbverbatim}
\def\@switch@sqbverbatim{\ifx\reserved@a[%]
  \expandafter\@sqbverbatim\else
  \def\reserved@b{\@sqbverbatim[]}\expandafter\reserved@b\fi}
\def\@sqbverbatim[#1]{%
  \def\ruled{\let\if@ruled\iftrue}%
  \def\makevmeta{\makeescape\! \let\<\tubverb@meta \tubverb@clearliglist}
  \def\tubverb@meta##1>{\meta{##1}}
  \def\tubverb@clearliglist{%
    \def\verbatim@nolig@list{\do\`\do\,\do\'\do\-}%
  }
  #1\@TBverbatim}
\def\@verbatim{%
    \if@ruled\trivlist\item\hrule\kern5\p@\nobreak\fi
  \trivlist \item\relax
  \if@minipage\else\vskip\parskip\fi
  \leftskip\@totalleftmargin\rightskip\z@skip
  \parindent\z@\parfillskip\@flushglue\parskip\z@skip
  \@@par
  \@tempswafalse
  \def\par{%
    \if@tempswa
      \leavevmode \null \@@par\penalty\interlinepenalty
    \else
      \@tempswatrue
      \ifhmode\@@par\penalty\interlinepenalty\fi
    \fi}%
  \obeylines \verbatim@font \@noligs
  \let\do\@makeother \dospecials
  \everypar \expandafter{\the\everypar \unpenalty}%
}% end |\@sqbverbatim|
\def\endverbatim{\@TBendverbatim
  \if@ruled\kern5\p@\hrule\endtrivlist\fi}
\let\if@ruled\iffalse
\AtBeginDocument{%
   \@ifpackageloaded{microtype}
     {\g@addto@macro\@verbatim{\microtypesetup{activate=false}}}{}
}
\if@Harvardcite
\let\@internalcite\cite
\def\cite{\def\@citeseppen{-1000}%
    \def\@cite##1##2{(##1\if@tempswa , ##2\fi)}%
    \def\citeauthoryear##1##2##3{##1, ##3}\@internalcite}
\def\citeNP{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2\fi}%
    \def\citeauthoryear##1##2##3{##1, ##3}\@internalcite}
\def\citeN{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2)\else{)}\fi}%
    \def\citeauthoryear##1##2##3{##1 (##3}\@citedata}
\def\citeA{\def\@citeseppen{-1000}%
    \def\@cite##1##2{(##1\if@tempswa , ##2\fi)}%
    \def\citeauthoryear##1##2##3{##1}\@internalcite}
\def\citeANP{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2\fi}%
    \def\citeauthoryear##1##2##3{##1}\@internalcite}
\def\shortcite{\def\@citeseppen{-1000}%
    \def\@cite##1##2{(##1\if@tempswa , ##2\fi)}%
    \def\citeauthoryear##1##2##3{##2, ##3}\@internalcite}
\def\shortciteNP{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2\fi}%
    \def\citeauthoryear##1##2##3{##2, ##3}\@internalcite}
\def\shortciteN{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2)\else{)}\fi}%
    \def\citeauthoryear##1##2##3{##2 (##3}\@citedata}
\def\shortciteA{\def\@citeseppen{-1000}%
    \def\@cite##1##2{(##1\if@tempswa , ##2\fi)}%
    \def\citeauthoryear##1##2##3{##2}\@internalcite}
\def\shortciteANP{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2\fi}%
    \def\citeauthoryear##1##2##3{##2}\@internalcite}
\def\citeyear{\def\@citeseppen{-1000}%
    \def\@cite##1##2{(##1\if@tempswa , ##2\fi)}%
    \def\citeauthoryear##1##2##3{##3}\@citedata}
\def\citeyearNP{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2\fi}%
    \def\citeauthoryear##1##2##3{##3}\@citedata}
\def\@citedata{%
        \@ifnextchar [{\@tempswatrue\@citedatax}%
                                  {\@tempswafalse\@citedatax[]}%
}

\def\@citedatax[#1]#2{%
\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi%
  \def\@citea{}\@cite{\@for\@citeb:=#2\do%
    {\@citea\def\@citea{, }\@ifundefined% by Young
       {b@\@citeb}{{\bf ?}%
       \@warning{Citation `\@citeb' on page \thepage \space undefined}}%
{\csname b@\@citeb\endcsname}}}{#1}}%
\def\@citex[#1]#2{%
\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi%
  \def\@citea{}\@cite{\@for\@citeb:=#2\do%
    {\@citea\def\@citea{; }\@ifundefined% by Young
       {b@\@citeb}{{\bf ?}%
       \@warning{Citation `\@citeb' on page \thepage \space undefined}}%
{\csname b@\@citeb\endcsname}}}{#1}}%
\def\@biblabel#1{}
\newlength{\bibhang}
\setlength{\bibhang}{2em}
\newdimen\bibindent
\bibindent=1.5em
\@ifundefined{refname}%
   {\newcommand{\refname}{References}}%
   {}%
\def\thebibliography#1{% for harvardcite
  \let\TB@startsection\TB@safe@startsection
  \section*{\refname
    \@mkboth{\uppercase{\refname}}{\uppercase{\refname}}}%
  \list{[\arabic{enumi}]}{%
    \labelwidth\z@ \labelsep\z@
    \leftmargin\bibindent
    \itemindent -\bibindent
    \listparindent \itemindent
    \parsep \z@
    \usecounter{enumi}}%
  \def\newblock{}%
  \BibJustification
  \frenchspacing % more than just period, see comments below
}
\def\etal{et\,al.\@}
\def\bibentry{%
  \smallskip
  \hangindent=\parindent
  \hangafter=1
  \noindent
  \sloppy
  \clubpenalty500 \widowpenalty500
  \frenchspacing
}
\def\bibliography#1{%
  \if@filesw
    \immediate\write\@auxout{\string\bibdata{\@tubfilename{#1}}}%
  \fi
  \@input{\jobname.bbl}%
}
\def\bibliographystyle#1{%
  \if@filesw
    \immediate\write\@auxout{\string\bibstyle{\@tubfilename{#1}}}%
  \fi
}
\else % not harvardcite
\let\TB@origthebibliography\thebibliography
\def\thebibliography{%
  \let\TB@startsection\TB@safe@startsection
  \def\sloppy{\frenchspacing\BibJustification}%
  \TB@origthebibliography} % latex's thebibliography now reads args.
\fi  % not harvardcite
\let\TB@@sloppy\sloppy
\let\BibJustification\TB@@sloppy
\newcommand{\SetBibJustification}[1]{%
  \renewcommand{\BibJustification}{#1}%
}
\ResetCommands\expandafter{\the\ResetCommands
  \let\BibJustification\TB@@sloppy
}
\def\HorzR@gisterRule{\vrule \@height 0.2\p@ \@depth\z@ \@width 0.5in }
\def\DownShortR@gisterRule{\vrule \@height 0.2\p@ \@depth 1pc \@width 0.2\p@ }
\def\UpShortR@gisterRule{\vrule \@height 1pc \@depth\z@ \@width 0.2\p@ }
\def\ttopregister{\dlap{%
        \hb@xt@\trimwd{\HorzR@gisterRule \hfil \HorzR@gisterRule
                        \HorzR@gisterRule \hfil \HorzR@gisterRule}%
        \hb@xt@\trimwd{\hfil \DownShortR@gisterRule \hfil}}}
\def\tbotregister{\ulap{%
        \hb@xt@\trimwd{\hfil \UpShortR@gisterRule \hfil}%
        \hb@xt@\trimwd{\HorzR@gisterRule \hfil \HorzR@gisterRule
                        \HorzR@gisterRule \hfil \HorzR@gisterRule}}}
\def\topregister{\ttopregister}
\def\botregister{\tbotregister}
\def\rtitlex{\def\texttub##1{{\normalsize\textrm{##1}}}\TUB, \volx}
\def\MakeRegistrationMarks{}
\def\UseTrimMarks{%
  \def\MakeRegistrationMarks{%
    \ulap{\rlap{%
       \vbox{\dlap{\vbox to\trimlgt{\vfil\botregister}}%
             \topregister\vskip \headmargin \vskip 10\p@}}}}%
  }
\def\@oddhead{\MakeRegistrationMarks
  \frenchspacing
  \normalsize\csname normalshape\endcsname\rm \tubheadhook
  \rtitlex\qquad \midrtitle\hfil
  \rtitlenexttopage\quad\tubtypesetpageno{\thepage}}
\def\@evenhead{\MakeRegistrationMarks
  \frenchspacing
  \normalsize\csname normalshape\endcsname\rm \tubheadhook
  \tubtypesetpageno{\thepage}\quad\rtitlenexttopage
  \hfil\midrtitle \qquad\rtitlex}

\newcommand{\tubtypesetpageno}[1]{%
  \ifnum #1>900
    % in CM, numerals are exactly .5em.
    %
    % The \texorpdfstring avoids the usual hyperref warning:
    %   Token not allowed in a PDF string ... removing `\@ifnextchar'
    \texorpdfstring{\makebox[.5em][l]{\small ?}}{?}%
    %
    \textsl{\@arabic{\numexpr#1-900\relax}}% assuming e-tex
  \else
    \@arabic{#1}%
  \fi
}

\def\tubheadhook{}

\def\tubrunningauthor{\@author}

\def\@tubrunningfull{%
  \def\@oddfoot{% make line break commands produce a normal space
    \def\\{\unskip\ \ignorespaces}%
    \let\newline=\\%
    \tubtypesetdoi
    \frenchspacing\hfil\rhTitle}
  \def\@evenfoot{%
    \let\thanks\@gobble
    \tubtypesetdoi
    \frenchspacing\tubrunningauthor\hfil}
}

\def\@tubrunningminimal{%
  \def\@oddfoot{\tubtypesetdoi\hfil}%
  \def\@evenfoot{\tubtypesetdoi\hfil}%
}

\def\@tubrunningoff{%
  \@tubrunningminimal
  \def\@oddhead{\hfil}%
  \def\@evenhead{\hfil}%
}

\def\ps@headings{}
\pagestyle{headings}
\def\tubdoiprefix{10.47397/tb} % the number crossref assigned us
\def\tubabovedoi{}             % fudge spacing or whatever.
\def\tubtypesetdoi{%
  \iftubomitdoioption\else % do if not explicit omission ...
    \ifnum\volno>0         % and if being run for production ...
      \iftubfinaloption    % and if [final], even if pageno>900
       \vbox to 0pt{% don't impact normal layout
         \edef\thedoi{% but make url invalid if >900
                      \ifnum\count0>900 example.org%
                                  \else doi.org\fi
                       /\tubdoiprefix/\volno-\issno/\jobname}%
         \scriptsize
         \vskip\baselineskip
         \tubabovedoi
         \iftubsecondcolstart \moveright \tubcolwidthandgutter \fi
         \rlap{\expandafter\tbsurl\expandafter{\thedoi}}%
         \vss
       }%
     \fi  % tubfinaloption
   \fi    % volno>0
  \fi     % !tubomitdoioption
  \global\let\tubtypesetdoi\@empty % only do it once, no matter what.
}
\def\@outputdblcol{\if@firstcolumn \global\@firstcolumnfalse
    \global\setbox\@leftcolumn\box\@outputbox
    \global\brokenpenalty10000
  \else \global\@firstcolumntrue
    \global\brokenpenalty100
    \setbox\@outputbox\vbox{\hb@xt@\textwidth{\hb@xt@\columnwidth
      {\box\@leftcolumn \hfil}\hfil \vrule \@width\columnseprule\hfil
       \hb@xt@\columnwidth{\box\@outputbox \hfil}}}\@combinedblfloats
       \@outputpage \begingroup \@dblfloatplacement \@startdblcolumn
       \@whilesw\if@fcolmade \fi{\@outputpage\@startdblcolumn}\endgroup
    \fi}
\newif\ifFirstPar       \FirstParfalse
\def\smc{\sc}
\def\ninepoint{\small}
\DeclareRobustCommand{\SMC}{%
  \ifx\@currsize\normalsize\small\else
   \ifx\@currsize\small\footnotesize\else
    \ifx\@currsize\footnotesize\scriptsize\else
     \ifx\@currsize\large\normalsize\else
      \ifx\@currsize\Large\large\else
       \ifx\@currsize\LARGE\Large\else
        \ifx\@currsize\scriptsize\tiny\else
         \ifx\@currsize\tiny\tiny\else
          \ifx\@currsize\huge\LARGE\else
           \ifx\@currsize\Huge\huge\else
            \small\SMC@unknown@warning
 \fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
}
\newcommand{\SMC@unknown@warning}{\TBWarning{\string\SMC: nonstandard
    text font size command -- using \string\small}}
\newcommand{\textSMC}[1]{{\SMC #1}}
\DeclareRobustCommand{\acro}[1]{\textSMC{#1}\@}
\def\xEdNote{{\EdNoteFont Editor's note:\enspace }}
\def\EdNote{\@ifnextchar[%]
  {%
    \ifvmode
      \smallskip\noindent\let\@EdNote@\@EdNote@v
    \else
      \unskip\quad\def\@EdNote@{\unskip\quad}%
    \fi
    \@EdNote
  }%
  \xEdNote
}
\long\def\@EdNote[#1]{%
  [\thinspace\xEdNote\ignorespaces
   #1%
   \unskip\thinspace]%
  \@EdNote@
}
\def\@EdNote@v{\par\smallskip}
\def\SelfDocumenting{%
  \setlength\textwidth{31pc}
  \onecolumn
  \parindent \z@
  \parskip 2\p@\@plus\p@\@minus\p@
  \oddsidemargin 8pc
  \evensidemargin 8pc
  \marginparwidth 8pc
  \toks@\expandafter{\@oddhead}%
  \xdef\@oddhead{\hss\hb@xt@\pagewd{\the\toks@}}%
  \toks@\expandafter{\@evenhead}%
  \xdef\@evenhead{\hss\hb@xt@\pagewd{\the\toks@}}%
  \def\ps@titlepage{}%
}
\def\ps@titlepage{}

\long\def\@makefntext#1{\parindent 1em\noindent\hb@xt@2em{}%
  \llap{\@makefnmark}\null$\mskip5mu$#1}

%% \long\def\@makefntext#1{\parindent 1em
%%   \noindent
%%   \hb@xt@2em{\hss\@makefnmark}%
%%   \hskip0.27778\fontdimen6\textfont\z@\relax
%%   #1%
%% }
\newcommand{\tubraggedfoot}{\rightskip=\raggedskip plus\raggedstretch\relax}
\def\creditfootnote{\nomarkfootnote\xEdNote}
\def\supportfootnote{\nomarkfootnote\relax}
\gdef\nomarkfootnote#1#2{\begingroup
  \def\thefootnote{}%
  % no period, please, also no fnmark. Also no hyperref warning.
  \def\@makefntext##1{##1}%
  \def\Hy@Warning##1{}%
  \footnotetext{\noindent #1#2}%
\endgroup}
\if@Harvardcite
  \AtBeginDocument{%
    \bibliographystyle{ltugbib}%
  }
\fi
\authornumber\z@
\let\@signature\@defaultsignature
\InputIfFileExists{ltugboat.cfg}
  {\TBInfo{Loading ltugboat.cfg configuration information}}
  {}
\endinput
%%
%% End of file `ltugboat.cls'.
