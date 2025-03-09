%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the asmejour class for formatting papers in a layout similar to ASME Journal papers.
%%  
%%  The asmejour.cls file should be used with the files asmejour.bst (for citations) and asmejour-template.tex.
%%
%%  This file's version and date are:
		\def\versionno{1.24}
		\def\versiondate{2025/01/26\space}
%%
%%  Author: John H. Lienhard V
%%          Department of Mechanical Engineering
%%          Massachusetts Institute of Technology
%%          Cambridge, MA 02139-4307 USA
%%
%%  This class was designed to approach the following aims:
%%
%%          1. Match ASME's current layout and font specifications
%%          2. With amsejour.bst, match ASME's reference formats and support DOI & URL fields
%%          3. Provide hyperref compatibility for hyperlinks, pdf bookmarks, and metadata
%%          4. Support citations, footnotes, and bold face math in section headings
%%			5. Provide optional line numbers for editing and review
%%			6. Support balancing height of columns on the last page
%%			7. Support archival PDF/A standards
%%			8. Provide copyright notices for government employees and government contractors
%%		    9. Enable various math and text features from the newtxmath, mathalfa, and newtxtext packages
%%		   10. Support inclusion of passages in languages other than English
%%
%%  This class is compatible with both pdfLaTeX and LuaLaTeX. All packages required by the class 
%%  are in standard distributions, such as TeX Live, and are also available at CTAN (https://ctan.org/).
%%  The use of an up-to-date (Nov. 2022 or later) and complete LaTeX distribution is strongly recommended. 
%%
%%  The title block is set by specific commands that are described in the asmejour-template.tex file.
%%
%%  The class defines abstract environment (with optional keywords) and a nomenclature environment.   
%%  (LaTeX must be run twice to align the columns in the nomenclature list).
%% 
 %=========================================================
%%
%% LICENSE:
%%
%% Copyright (c) 2025 John H. Lienhard
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
%% associated documentation files (the "Software"), to deal in the Software without restriction, 
%% including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
%% and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
%% subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in all copies or 
%% substantial portions of the Software.
%%
%% The software is provided "as is", without warranty of any kind, express or implied, including but 
%% not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. 
%% in no event shall the authors or copyright holders be liable for any claim, damages or other liability, 
%% whether in an action of contract, tort or otherwise, arising from, out of or in connection with the 
%% software or the use or other dealings in the software.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asmejour}[\versiondate asmejour paper format]

\LoadClass[twoside,9pt]{extarticle}% twocolumn format initiated in \MakeTitle command 2024/07/20

\RequirePackage{iftex}[2019/11/07]% provides \ifpdftex, etc.
\RequirePackage{ifthen}

\ExplSyntaxOn
  \str_const:Nn \ClassName {asmejour}
\ExplSyntaxOff

%%%%%%%%%%%%%  Some compatibility for older distributions  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}%  compare version to date; \If... added to latex 2020/10/01
\providecommand\IfPackageAtLeastTF{\@ifpackagelater}%     compare version to date; \If... added to latex 2020/10/01
\providecommand\IfPDFManagementActiveTF{\@secondoftwo}%   \If... added to latex 2021/07/23
\providecommand\IfPackageLoadedTF{\@ifpackageloaded}%     \If...added to latex 2021/11/15
\providecommand\ClassNoteNoLine[2]{\typeout{^^JClass Note #1: #2.^^J}}%  log & terminal note... added to latex 2021/11/15

\IfFormatAtLeastTF{2020/10/01}{\relax}{%
	\ClassError{\ClassName}{Your LaTeX format is dated \fmtversion.  Formats dated 2020/10/01 or later are recommended for the asmejour class. Older formats may generate errors or fail entirely!}{Please UPDATE your LaTeX distribution to obtain best results. TeX Live is available for download at no charge: \string https://www.tug.org/texlive/.  You can try to click past any errors for now, but your abstract will not compile properly if you lack the xparse package [2020/02/25], and the code will crash entirely if you lack the iftex package [2019/11/07].}%
}

% check whether pdfmanagement (\DocumentMetadata) has been loaded (else fall back to hyperxmp and bookmark packages after loading hyperref)
\newif\ifasme@pdfmanagement
\IfPDFManagementActiveTF{
	\asme@pdfmanagementtrue 
}{
	\asme@pdfmanagementfalse
	\ClassWarningNoLine{\ClassName}{pdfmanagement is not active. Will load hyperxmp and bookmark packages instead}
}

% Allow pre 2021/11/15 formats to see the graphicx alt key without causing an error
\IfFormatAtLeastTF{2021/11/15}{
	\relax
}{ 
	\AtBeginDocument{
		\IfPackageLoadedTF{graphicx}{\define@key{Gin}{alt}{}}{\relax}
	}
}

% Enable pre-2020/10 formats to access essential macros later moved into LaTeX kernel
\ifdefined\NewDocumentCommand\else
  \RequirePackage{xparse}[2020/02/25]
\fi 

% Provide pre-2020/10 installations with basic unicode character mappings 
\IfFormatAtLeastTF{2020/10/01}{\relax}{%
	\pdfgentounicode=1  			    %% enable CMaps; was moved into the latex kernel Oct 2020
	\input glyphtounicode.tex 		    %% lists of mappings; was moved into the latex kernel Oct 2020
}


%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}% this package calls kvsetkeys
\SetupKeyvalOptions{
  family=\ClassName,
  prefix=asmejour@,
  setkeys=\kvsetkeys,
}

%% for mathalfa, so we may pass options in this format: mathalfa=cal=euler, mathalfa=frak=boondox
\define@key{\ClassName}{mathalfa}{%
      \PassOptionsToPackage{#1}{mathalfa}%
}

%% Option to obtain line numbers [singlecolumn], 2024/07/20
\DeclareBoolOption{singlecolumn}

%% Option to obtain line numbers [lineno] 
\DeclareBoolOption{lineno}

%% Option to balance column height on last page [balance] 
\DeclareBoolOption{balance}

%% Option to omit lists of figures and tables
\DeclareBoolOption{nolists}

%% Option to omit ASME copyright notice [nocopyright]
\DeclareBoolOption{nocopyright}

%% Option to omit ASME footers [nofoot]
\DeclareBoolOption{nofoot}

%% Option for copyright notice if all authors are government employees [govt]
\DeclareBoolOption{govt}

%% Option for copyright notice if some (not all) authors are government employees [govtsome]
\DeclareBoolOption{govtsome}

%% Option for government contractor copyright notice [contractor]
\DeclareBoolOption{contractor}

%% set key [barcolor=] to pass a color name defined by xcolor package
\DeclareStringOption[black]{barcolor}

%% the key [main= ] to pass the choice of main language to babel
\newif\ifaj@mainset\aj@mainsetfalse
\define@key{\ClassName}{main}{%
	  \PassOptionsToPackage{main=#1,#1}{babel}% added #1 resolves conflicts between certain .ldf files under "main=".
	  \aj@mainsettrue
	  \ClassNoteNoLine{\ClassName}{Selecting #1 as the primary language}
}

%% Suppress warnings about unused global options, 2021/12/01
\DeclareDefaultOption{}

\ProcessKeyvalOptions{\ClassName}

%% Turn off these keys now that we're done with them
\NewDocumentCommand\aj@DisableOption{m}{%
  \DisableKeyvalOption[%
    action=ignore,%
    class=\ClassName%
  ]{#1}{\@KeyFamily}%
}
\NewDocumentCommand\@DisableKeys{>{\SplitList{;}}m}{\ProcessList{#1}{\aj@DisableOption}}

\def\@KeyFamily{\ClassName}
\@DisableKeys{mathalfa;singlecolumn;lineno;balance;nolists;nocopyright;nofoot;govt;govtsome;contractor;barcolor;main}


%% if main language was not was chosen explicitly, default to English
\ifaj@mainset\relax\else
	\PassOptionsToPackage{main=english}{babel}%
	\ClassNoteNoLine{\ClassName}{Selecting English as the primary language, since main= not set}%
\fi


%%%%%%%   PDF/A Compliance Keys  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% new pdf management in LaTeX, with \DocumentMetaData{..}, is preferred to this approach.

\newif\ifaj@setpdfa\aj@setpdfafalse
\newif\ifaj@pdfaone\aj@pdfaonefalse

\ifasme@pdfmanagement\else
    
    \SetupKeyvalOptions{
      family=pdfaopt,
      prefix=pdfaopt@,
      setkeys=\kvsetkeys,
    }
    
    \ifpdftex %% configure pdf/a compliance for pdflatex. Revised 2023/10/20
    %
    	%%% set key [pdfa] to activate pdf/a compliance (default is pdf/A-3u)
    	\define@key{pdfaopt}{pdf-a}[true]{%
          \aj@setpdfatrue
          \PassOptionsToPackage{pdfa}{hyperref}
          \AtBeginDocument{\hypersetup{pdfapart=3,pdfaconformance=u}}% hyperref takes these options if hyperxmp is loaded
    	}
    	%%% to select part 1, 2 or 3 
    	\define@key{pdfaopt}{pdfapart}[3]{%
    	  \def\asmejour@tempa{#1}
          \AtBeginDocument{\hypersetup{pdfapart=\asmejour@tempa}}
    	  \ifthenelse{\equal{#1}{1}}{\aj@pdfaonetrue}{\relax}%
    	}
    	%% to select conformance b or u.  NB: a is not currently possible with pdfLaTeX; u not possible with 1.
    	\ExplSyntaxOn
    	\define@key{pdfaopt}{pdfaconformance}[u]{%
    	  \str_set:Ne \l_tmp_str { \str_uppercase:n {#1} }
          \AtBeginDocument{\hypersetup{pdfaconformance=\l_tmp_str}}
    	}
    	\ExplSyntaxOff
    \else
    	\define@key{pdfaopt}{pdf-a}[true]{%
    	  \aj@setpdfatrue
        }
    \fi

    \ProcessKeyvalOptions{pdfaopt}
    
    %% Done with these keys, so we can now disable them
    \def\@KeyFamily{pdfaopt}
    \@DisableKeys{pdf-a;pdfapart;pdfaconformance}

    %% new pdf management in LaTeX, using \DocumentMetaData{..}, is preferred to this approach.
    \ifpdftex
    	\ifaj@pdfaone
    		\pdfminorversion=4  % for pdf/a-1 need version 4, not 7
    	\else
      		\pdfminorversion=7  % this selection is not required
    	\fi
    \else
    	\ifaj@setpdfa\ClassWarningNoLine{\ClassName}{pdf-a option requires pdfLaTeX. Under LuaLaTeX, use %
    			\protect\DocumentMetadata{pdfstandard=A-3b} before \protect\documentclass[..]{\ClassName}}%
		\fi
    	\ifx\directlua\undefined\else % default under lualatex is 1.4
        	\directlua{
                if pdf.getminorversion() \string~= 7 then
                  if (status.pdf_gone and status.pdf_gone > 0)
                  or (status.pdf_ptr and status.pdf_ptr > 0) then
                    tex.error("PDF version cannot be changed anymore")
                  else
                    pdf.setminorversion(7)
                  end
                end
            }
        \fi
    \fi
\fi


%%%%%%%%%  Various font-related options  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Option for slightly larger small capitals font [largesc], corrected 2021/01/29
\DeclareOption{largesc}{\PassOptionsToPackage{largesc=true}{newtxtext}}% largesc is a boolean key in newtxtext

%% Disable newtxtext osf option, which is not appropriate for documents in this class
\DeclareOption{osf}{%
	\PassOptionsToPackage{lining}{newtxtext}%
}

\DeclareOption{hyphenate}{%
	\ifpdftex
		\PassOptionsToPackage{hyphenate}{inconsolata}% hyphenate is a key via xkeyval in inconsolata
		\ClassNoteNoLine{\ClassName}{Allowing hyphenation of typewriter font}%
	\else
		\ClassWarningNoLine{\ClassName}{The [hyphenate] option is only supported with pdftex. It will be ignored}%
	\fi
}

%% Option to enforce monospacing of words the typewriter font [mono]
\def\MonoNotMono{WordSpace={1,1,1}}% rescaled tt font to match pdf, 2024/07/30
\DeclareOption{mono}{%
	\ifpdftex
		\PassOptionsToPackage{mono}{inconsolata}% mono is a key via xkeyval in inconsolata
	\else
		\def\MonoNotMono{WordSpace={1,0,0},PunctuationSpace={3}}% 2024/07/30, these are actually default WordSpace values
	\fi
}

%% option for unslashed zero typewriter font [var0].
\def\ssztwo{}% for Inconsolatazi4; default uses slashed zero, +ss02 uses regular zero
\DeclareOption{var0}{%
	\ifpdftex
		\PassOptionsToPackage{var0}{inconsolata}% var0 is a key via xkeyval in inconsolata
	\else
		\def\ssztwo{+ss02}% stylistic alternate for regular zero
	\fi
}

%% Suppress warnings about keys as unused global options
\DeclareOption*{}

\ProcessOptions \relax


%%%%%%%%%%%%  Page size, bibliography, graphics, color  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[paperheight=285.7mm, paperwidth=215.900mm, left=21.100mm, right=21.100mm, top=15.9mm, bottom = 24mm, footskip=8mm]{geometry}
\setlength\columnsep{4.5mm}
\setlength\parindent{3.5mm}
%% ASME's pdf pages are 11.25 in. tall, not 11.00 in.

\RequirePackage[sort&compress,numbers]{natbib} 
\AtBeginDocument{\def\NAT@space{\relax}}%   ASME puts no space between numerical references (2020/04/05)
\setlength\bibsep{0pt plus 1pt minus 0pt}%  ASME keeps this tight
\renewcommand*{\bibfont}{\footnotesize}

\RequirePackage{graphicx} 
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}% removed obsolete options, 2023/10/23


%%%%%%%%%%%%%  Table related   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{array} 

\RequirePackage{dcolumn}%  column alignment on decimal places
\newcolumntype{d}[1]{D{.}{.}{#1}}

%% make \hline in tables heavier than default 0.4pt
\setlength\arrayrulewidth{.5\p@}

\RequirePackage{booktabs}
\renewcommand*{\toprule}{\specialrule{0.5pt}{0pt}{\doublerulesep}\specialrule{0.5pt}{0pt}{3pt}}
\renewcommand*{\midrule}{\specialrule{0.5pt}{2pt}{3pt}}
\renewcommand*{\bottomrule}{\specialrule{0.5pt}{1pt}{\doublerulesep}\specialrule{0.5pt}{0pt}{0pt}}


%%%%%%%%%%%%%  Font related   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{mathtools}% loads and extends amsmath
\RequirePackage[]{babel}

\ifpdftex
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}% for backward compatibility with pre-2018 LaTeX distributions
 	%% ASME word separation is greater than newtxtext defaults so change these parameters.  
 	%%     increased shrink from 0.08, 2021/01/30; add this helvetica scaling 2022/06/26
	\RequirePackage[helvratio=0.91, spacing=0.3em, stretch=0.18em, shrink=0.10em]{newtxtext}% default {0.25em,0.2em,0.1em}
	\RequirePackage[varl,varqu]{inconsolata}% sans typewriter font; restored varl, varqu 2020/08/10 
	\RequirePackage[]{newtxmath}
\else % use lualatex with newtxmath and fontspec for text primary fonts.  Revised 2023/10/21.
%
	%% TeX Gyre Heros Condensed is qhvc (regular is qhv). 
    \RequirePackage[T1]{fontenc} % qhvc is not TU encoded
    \DeclareFontFamily{T1}{qhvc}{} 
    \DeclareFontShape{T1}{qhvc}{m}{n}{<-> s*[0.91] ec-qhvcr}{} %% see t1qhvc.fd; 0.9-->0.94 2022/01/15; 0.94-->0.91 2022/06/26
    \DeclareFontShape{T1}{qhvc}{b}{n}{<-> s*[0.91] ec-qhvcb}{} %% see t1qhvc.fd; 0.9-->0.94 2022/01/15; 0.94-->0.91 2022/06/26
%
    \RequirePackage[varqu,varl]{inconsolata}  % typewriter font for math 
    \renewcommand\rmdefault{ntxtlf}           % roman font for math
	\DeclareFontFamily{T1}{\sfdefault}{}      % sf for math
	\DeclareFontShape{T1}{\sfdefault}{m}{n}{<-> s*[0.94] ec-qhvr}{} %% see t1qhv.fd; 0.9-->0.94 2022/01/15
    \RequirePackage[]{newtxmath}			  % newtxmath still handles mathematics        
	\RequirePackage[no-math]{fontspec}
    \defaultfontfeatures{Ligatures=TeX,}
%
	\def\FontWarning{For luaLaTeX, you MUST have these OpenType fonts installed as system fonts on your computer: TeX Gyre Termes and TeX Gyre Heros (from \string http://www.gust.org.pl/projects/e-foundry/tex-gyre) and Inconsolatazi4 (\string https://ctan.org/tex-archive/fonts/inconsolata/opentype). If you DON'T have these fonts, you will see ERROR messages!}
%		    
	\IfFontExistsTF{TeX Gyre Termes}{}{\ClassWarningNoLine{\ClassName}{\FontWarning} }
	\IfFontExistsTF{texgyreheros}{}{  \ClassWarningNoLine{\ClassName}{\FontWarning} }
	\IfFontExistsTF{Inconsolatazi4}{}{\ClassWarningNoLine{\ClassName}{\FontWarning} }
	%
	% The newtx package includes a modified version of TeXGyreTermes called TexGyreTermesX, which could be loaded instead (includes
    \setmainfont{TeXGyreTermes}[% Presumes these are system fonts! Available at: http://www.gust.org.pl/projects/e-foundry/tex-gyre
		WordSpace = {1.20,1.44,1.2},% This stretch matches newtxtext fontdimens (reset 2024/07/30)
    	PunctuationSpace = {1.33},% reset 2024/07/30
	    Extension = .otf,
    	UprightFont = *-Regular,
    	ItalicFont = *-Italic,
    	BoldFont = *-Bold,
    	BoldItalicFont = *-BoldItalic,
		Numbers = Lining,
		]
    \setsansfont{texgyreheros}[% Presumes these are system fonts! Available at: http://www.gust.org.pl/projects/e-foundry/tex-gyre
		WordSpace = {1,1,1.0036},%% This stretch matches newtxtext fontdimens (reset 2024/07/30)
    	PunctuationSpace = {1.0036},% reset 2024/07/30
		Extension = .otf,
    	UprightFont = *-regular,
    	ItalicFont = *-italic,
    	BoldFont = *-bold,
    	BoldItalicFont = *-bolditalic,
		Numbers = Lining,
    	Scale=0.91,% same as for newtx; former value 0.9 too small 2022/01/15
		]        
   \setmonofont{Inconsolatazi4}[% This otf font ships with the LaTeX Inconsolata package (it's in TeX Live)
        Scale=1.0,% rescaled 1.05, 2022/03/10; reset to 1 2024/07/30, based on fontdimen6 (and all others!)
        Extension = .otf,
        UprightFont = *-Regular,
        ItalicFont = *-Regular,% has no italic face
        BoldFont = *-Bold, 
    	BoldItalicFont = *-Bold,% has no italic face
        RawFeature = {+ss01,\ssztwo,+ss03},
        \MonoNotMono,% WordSpace and PunctuationSpace are set in the class option [mono]
        ]
\fi
  
\RequirePackage[]{mathalfa}% load optional fonts for Calligraphy, Script, etc. 

\RequirePackage{bm}%  load after all math for expanded access to bold math

%% In addition to the word spacing options declared in line 371...
%% Relative to size9.clo: leading reduced to 10 pt; displayskips made greater
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@ixpt{10\p@}%               % <== was \@xipt
   \abovedisplayskip 10\p@ \@plus5\p@ \@minus4\p@%      % <== was 8\p@ 4,4...
   \abovedisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@%  % <== was \z@ \@plus3\p@ (3pt stretch)
   \belowdisplayshortskip 10\p@ \@plus5\p@ \@minus4\p@% % <== was 5\p@ 3, 3
   \belowdisplayskip \abovedisplayskip%
   \let\@listi\@listI}
\normalsize

%% The article class calls \sloppy in two-column mode (\tolerance 9999, \emergencystretch 3em)
%% These adjustments affect line breaking; the values below are intended to produce
%% fewer lines with large spaces, without creating the problems of using \fussy in two-column mode.
\tolerance 2500
\emergencystretch 3em 

%% TeX Gyre Heros Condensed is qhvc (regular is qhv). 
\newcommand*{\CondSans}{\fontencoding{T1}\fontfamily{qhvc}\selectfont}% remove extra \selectfont, 2023/10/21
\renewcommand\huge{\@setfontsize\huge{14}{14}}        %... for author names only
\newcommand*{\CondSansBold}{\renewcommand\bfdefault{b}\fontencoding{T1}\fontfamily{qhvc}\selectfont\bfseries} 
\renewcommand\Huge{\@setfontsize\Huge{26.5}{26.5}}    %... for title only
  
\RequirePackage{hologo}% Access to various LaTeX logos (for use in the documentation). Dropped metalog 2024/08/09

%% This provides sans serif italic and sans serif bold italic math, against with fonts from newtxsf.
%% For use in the figure and table captions.
\DeclareMathVersion{sansbold}
    \SetSymbolFont{letters}{sansbold}{OML}{ntxsfmi}{b}{it}
    \SetSymbolFont{lettersA}{sansbold}{U}{ntxsfmia}{b}{it}
    \SetSymbolFont{symbols}{sansbold}{LMS}{ntxsy}{b}{n}
    \SetSymbolFont{largesymbols}{sansbold}{LMX}{ntxexx}{b}{n}%  added 2021/01/26
    \SetSymbolFont{largesymbolsTXA}{sansbold}{U}{ntxexa}{b}{n}% added 2021/01/26
    \SetSymbolFont{operators}{sansbold}{\encodingdefault}{\sfdefault}{\bfdefault}{n}
    \SetMathAlphabet{\mathsf}{sansbold}{\encodingdefault}{\sfdefault}{b}{n}% \mathsf is upright

%% Provide math accents for the sans and sansbold math versions.  Accents from ntxsfmi work normally 
%%    with regular times fonts. 2021/01/27
\DeclareSymbolFont{lettersAB}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{lettersAB}{normal}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{lettersAB}{bold}{U}{ntxsfmia}{b}{it}
    \SetSymbolFont{lettersAB}{sansbold}{U}{ntxsfmia}{b}{it}
    \DeclareFontSubstitution{U}{ntxsfmia}{m}{it}

    \DeclareMathAccent{\grave}{\mathord}{lettersAB}{254}
    \DeclareMathAccent{\acute}{\mathord}{lettersAB}{255}
    \DeclareMathAccent{\check}{\mathord}{lettersAB}{186}
    \DeclareMathAccent{\breve}{\mathord}{lettersAB}{187}
    \DeclareMathAccent{\bar}{\mathord}{lettersAB}{221}
    \DeclareMathAccent{\mathring}{\mathord}{lettersAB}{222}
    \DeclareMathAccent{\hat}{\mathord}{lettersAB}{223}
    \DeclareMathAccent{\dot}{\mathord}{lettersAB}{224}
    \DeclareMathAccent{\tilde}{\mathord}{lettersAB}{219}

%% Provide sans-serif *upright* Greek letters, following a suggestion by Michael Sharpe.  2021/12/22
%% Following Sharpe's newtxsf implementation of the STIX fonts, under the LaTeX Project Public License.
%% (Note that \mathversion{sansbold} provides sans-serif *italic* Greek letters.) 

    \DeclareMathSymbol{\sfGamma}{\mathalpha}{lettersAB}{0}% adjust to avoid overwriting newtxmath commands,
    \DeclareMathSymbol{\sfDelta}{\mathalpha}{lettersAB}{1}
    \DeclareMathSymbol{\sfTheta}{\mathalpha}{lettersAB}{2}
    \DeclareMathSymbol{\sfLambda}{\mathalpha}{lettersAB}{3}
    \DeclareMathSymbol{\sfXi}{\mathalpha}{lettersAB}{4}
    \DeclareMathSymbol{\sfPi}{\mathalpha}{lettersAB}{5}
    
    \DeclareMathSymbol{\sfSigma}{\mathalpha}{lettersAB}{6}
    \DeclareMathSymbol{\sfUpsilon}{\mathalpha}{lettersAB}{7}
    \DeclareMathSymbol{\sfPhi}{\mathalpha}{lettersAB}{8}
    \DeclareMathSymbol{\sfPsi}{\mathalpha}{lettersAB}{9}
    \DeclareMathSymbol{\sfOmega}{\mathalpha}{lettersAB}{10}
    
    \DeclareMathSymbol{\sfalpha}{\mathalpha}{lettersAB}{11}
    \DeclareMathSymbol{\sfbeta}{\mathalpha}{lettersAB}{12}
    \DeclareMathSymbol{\sfgamma}{\mathalpha}{lettersAB}{13}
    \DeclareMathSymbol{\sfdelta}{\mathalpha}{lettersAB}{14}
    \DeclareMathSymbol{\sfepsilon}{\mathalpha}{lettersAB}{15}
    
    \DeclareMathSymbol{\sfzeta}{\mathalpha}{lettersAB}{16}
    \DeclareMathSymbol{\sfeta}{\mathalpha}{lettersAB}{17}
    \DeclareMathSymbol{\sftheta}{\mathalpha}{lettersAB}{18}
    \DeclareMathSymbol{\sfiota}{\mathalpha}{lettersAB}{19}
    \DeclareMathSymbol{\sfkappa}{\mathalpha}{lettersAB}{20}
    
    \DeclareMathSymbol{\sflambda}{\mathalpha}{lettersAB}{21}
    \DeclareMathSymbol{\sfmu}{\mathalpha}{lettersAB}{22}
    \DeclareMathSymbol{\sfnu}{\mathalpha}{lettersAB}{23}
    \DeclareMathSymbol{\sfxi}{\mathalpha}{lettersAB}{24}
    \DeclareMathSymbol{\sfpi}{\mathalpha}{lettersAB}{25}
    
    \DeclareMathSymbol{\sfrho}{\mathalpha}{lettersAB}{26}
    \DeclareMathSymbol{\sfsigma}{\mathalpha}{lettersAB}{27}
    \DeclareMathSymbol{\sftau}{\mathalpha}{lettersAB}{28}
    \DeclareMathSymbol{\sfupsilon}{\mathalpha}{lettersAB}{29}
    \DeclareMathSymbol{\sfphi}{\mathalpha}{lettersAB}{30}
    
    \DeclareMathSymbol{\sfchi}{\mathalpha}{lettersAB}{31}
    \DeclareMathSymbol{\sfpsi}{\mathalpha}{lettersAB}{32}
    \DeclareMathSymbol{\sfomega}{\mathalpha}{lettersAB}{33}
    \DeclareMathSymbol{\sfvarepsilon}{\mathalpha}{lettersAB}{34}
    \DeclareMathSymbol{\sfvartheta}{\mathalpha}{lettersAB}{35}
    
    \DeclareMathSymbol{\sfvarpi}{\mathord}{lettersAB}{36}
    \DeclareMathSymbol{\sfvarrho}{\mathord}{lettersAB}{37}
    \DeclareMathSymbol{\sfvarsigma}{\mathord}{lettersAB}{38}
    \DeclareMathSymbol{\sfvarphi}{\mathord}{lettersAB}{39}
    \DeclareMathSymbol{\sfitvarkappa}{\mathalpha}{lettersAB}{40}
    \DeclareMathSymbol{\sfvarkappa}{\mathalpha}{lettersAB}{40}
    \DeclareMathSymbol{\sfitnabla}{\mathalpha}{lettersAB}{42}
    \DeclareMathSymbol{\sfnabla}{\mathalpha}{lettersAB}{43}
    \DeclareMathSymbol{\sfhslash}{\mathalpha}{lettersAB}{52}% this is not upright
    \DeclareMathSymbol{\sfhbar}{\mathalpha}{lettersAB}{53}%   this is not upright

%%% sans math version, potential value with PGFPlots, called in subfigure captions. 2021/01/30
\DeclareMathVersion{sans}
    \SetSymbolFont{letters}{sans}{OML}{ntxsfmi}{m}{it}
    \SetSymbolFont{lettersA}{sans}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{lettersAB}{sans}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{symbols}{sans}{LMS}{ntxsy}{m}{n}
    \SetSymbolFont{largesymbols}{sans}{LMX}{ntxexx}{m}{n}
    \SetSymbolFont{largesymbolsTXA}{sans}{U}{ntxexa}{m}{n}
    \SetSymbolFont{operators}{sans}{\encodingdefault}{\sfdefault}{m}{n}
    \SetMathAlphabet{\mathsf}{sans}{\encodingdefault}{\sfdefault}{m}{n}


%%%%%%%%%%%%%%%%%  Some adjustments to math layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\jot}{10pt}% <== default is 3pt

%% multline has an "extra line" above it, so subtract from \abovedisplayskip to remove imbalance
\BeforeBeginEnvironment{multline}{\addtolength\abovedisplayskip{-7pt}}
\AfterEndEnvironment{multline}{\addtolength\abovedisplayskip{+7pt}}

\allowdisplaybreaks   % ASME allows these breaks


%%%%%%%%%%%%%%%%%  Equation and Line Numbering  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{etoolbox}% patching amsmath

%% ASME puts equation tags in blue
\patchcmd{\tagform@}{(\ignorespaces#1\unskip\@@italiccorr)}{\color{blue}(\ignorespaces#1\unskip\@@italiccorr)}{}{}

% To free \eqref from the normal font (e.g., for use in section headings or captions). Revised 2024/07/28
\renewcommand{\eqref}[1]{\textup{\hbox{\m@th{(\ignorespaces\ref{#1}\unskip\@@italiccorr)}}}}
%
% amsmath def:  \newcommand{\eqref}[1]{\textup{\tagform@{\ref{#1}}}}
%				\def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}}
%				\def\maketag@@@#1{\hbox{\m@th\normalfont#1}}


%% Italicize alph part of subequation numbers. Revised 2023/10/20
\patchcmd{\subequations}{\theparentequation\alph{equation}}{\theparentequation\itshape\alph{equation}}{}{}


%%%%% lineno related %%%%

\ifasmejour@lineno
    \RequirePackage[switch,mathlines]{lineno}%
    \renewcommand{\linenumberfont}{\normalfont\scriptsize\color{red}}% 
    \AtBeginDocument{\linenumbers}%
    \ifasmejour@balance
		\ClassWarningNoLine{\ClassName}{Package lineno loaded, so final column balancing will be disabled}%
	\fi
	%%% Patch to allow line numbering in AMS math environments.
	%%% This patch is for lineno versions earlier than v5.2 [2023/05/19]. As of mid-2023, the lineno package
	%%% 	has been corrected to account for the AMS math environments.  Retaining temporarily for backward compatibility.
	%%% postdisplaypenalty adjusted to avoid extra line number at end, see: https://tex.stackexchange.com/a/461192/ 
	\IfPackageAtLeastTF{lineno}{2023/05/19}{\relax}{
    	\NewDocumentCommand{\aj@losepostpenalty}{}{\patchcmd{\linenomathWithnumbers}{\advance\postdisplaypenalty\linenopenalty}{}{}{}}
    	%
        \NewDocumentCommand{\aj@FixAMSMath}{m}{%
        	\AtBeginEnvironment{#1}{\aj@losepostpenalty\linenomath}%
        	\AtEndEnvironment{#1}{\endlinenomath}%
        	\AtBeginEnvironment{#1*}{\aj@losepostpenalty\linenomath}%
        	\AtEndEnvironment{#1*}{\endlinenomath}%
        }
    	%
    	\NewDocumentCommand{\aj@FixAll}{>{\SplitList{;}}m}{\ProcessList{#1}{\aj@FixAMSMath}}
    	%
    	\aj@FixAll{align;alignat;gather;flalign;multline}
	}
%
\else
    \ProvideDocumentEnvironment{linenomath}{}{}{}%
    \ifasmejour@balance          %    balancing through flushend can produce weird errors.
    	\RequirePackage{flushend}%    flushend package is NOT compatible with lineno.
    	\AtEndDocument{\flushcolsend}%
		\ClassNoteNoLine{\ClassName}{Calling flushend package to balance column height on last page}%
    \fi%
\fi

\providecommand{\@LN@col}[1]{\relax}% avoid errors in the aux file when lineno is dropped
\providecommand{\@LN}[2]{\relax}

%% ASME page proofs seem to align the number at top of the line, rather than bottom as done here.


%%%%%%%%%%%%%%%%%  Footer Set Up  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%  footer text names  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\JourName}[1]{\gdef\@JourName{#1}}
\providecommand\@JourName{\hbox{ }}

\NewDocumentCommand{\PaperYear}{m}{%
      \gdef\@PaperYear{#1}%
      }
\providecommand\@PaperYear{\the\year}

\def\@PreprintStringL{PREPRINT}% updated 2024/07/24
\def\@PreprintStringR{PREPRINT}

\NewDocumentCommand{\PreprintString}{m o}{%
    \IfNoValueTF{#2}{%
		\gdef\@PreprintStringL{#1}%
		\gdef\@PreprintStringR{#1}%
	}{%
	\ifx R#2{\gdef\@PreprintStringR{#1}}\fi
	\ifx L#2{\gdef\@PreprintStringL{#1}}\fi
	}
}

\newcommand{\PaperNumber}[1]{\gdef\@PaperNumber{#1-}}
\providecommand\@PaperNumber{\relax}

%%%%%%  Fancyhdr  %%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}% options revised 2024/07/23
\pagestyle{fancy}

\fancyhf{}% clear all header and footer fields
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}
\ifasmejour@nofoot
    \fancyfoot[CE,CO]{\thepage}
\else
    \fancyfoot[RE]{\large\bfseries\sffamily Transactions of the ASME} 
    \fancyfoot[LO]{\large\bfseries\sffamily Journal of \@JourName} 
    \fancyfoot[RO]{\large\sffamily \@PreprintStringR\space\space\bfseries/\space\space\@PaperNumber\thepage}
    \fancyfoot[LE]{\large\sffamily {\bfseries \@PaperNumber\thepage\space\space/}\space\space\@PreprintStringL\ }
\fi

\fancypagestyle{title}{% is an odd page
    \fancyhf{}% clear all header and footer fields
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \ifasmejour@nofoot
        \fancyfoot[CO]{\thepage}
    \else
	    \fancyfoot[RO]{\large\sffamily \@PreprintStringR\space\space\bfseries/\space\space\@PaperNumber\thepage} 
	    \fancyfoot[LO]{\large\bfseries\sffamily Journal of \@JourName}
        \ifasmejour@nocopyright
        	\fancyfoot[CO]{}
    	\else
    	    \fancyfoot[CO]{\large\bfseries\sffamily Copyright \textcopyright\ \@PaperYear\ by ASME}
    	\fi
    \fi	
}


%%%%%% Footnotes %%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{footmisc}%
\IfPackageAtLeastTF{footmisc}{2022/02/05}{
	 	\PassOptionsToPackage{belowfloats}{footmisc}%
	}{	\RequirePackage{fnpos}
		\makeFNbottom
		\makeFNbelow
	}%
\setlength\footnotemargin{4mm}% reduce indentation of footnotes, from footmisc
\setlength{\skip\footins}{12pt plus 2pt minus 1pt}

\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 0.5in height 0.5pt
  \kern 2pt
}

%% Produces an unmarked footnote about the revision date. 
%% This command is invoked by \date as part of \MakeTitlePage below.
%% Text can be anything given as the argument to \date{..}.
\NewDocumentCommand{\revfootnote}{m}{\begin{NoHyper}\def\@thefnmark{}\@footnotetext{\hspace{-3pt}#1}\end{NoHyper}}% \gdef -->\def 2021/12/23

%% The above has been offset per style and modified to eliminate missing anchor warning from hyperref that the following version causes
%%\def\revfootnote{\gdef\@thefnmark{}\@footnotetext}


%% include a comma for sequential footnotes
\ExplSyntaxOn
	\cs_new:Npn   \__asmejour_NoteComma:n { \peek_meaning:NT \footnote { \textsuperscript{\mdseries,} } }
	\cs_new_eq:NN \__asmejour_savefootnote \footnote
	\cs_gset_protected:Npn \footnote #1    { \__asmejour_savefootnote{#1}\__asmejour_NoteComma:n } 
\ExplSyntaxOff


%%%%%%%%%  Caption Related  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\addto{\captionsenglish}{%
  \renewcommand{\figurename}{Fig.}  
  \renewcommand{\tablename}{Table}  
}

\RequirePackage[labelfont={sf,bf},hypcap=false]{caption}
\RequirePackage[hypcap=false,list=true]{subcaption}

\DeclareCaptionTextFormat{boldmath}{\mathversion{sansbold}#1}
\DeclareCaptionTextFormat{sansmath}{\mathversion{sans}#1}% strictly speaking, this is unnecessary.

\captionsetup[figure]{labelfont={sf,bf},textfont={sf,bf},textformat=boldmath,labelsep=quad}
\captionsetup[table]{labelfont={sf,bf},textfont={sf,bf},textformat=boldmath,labelsep=quad,skip=0.5\baselineskip} 

%% 2021/01/30: ASME only labels subfigures with a sans serif, italic (a), (b),... no caption text, no bold face.
\captionsetup[subfigure]{labelfont={sf},textfont={sf},textformat=sansmath,labelformat=simple}% default: =parens
\renewcommand\thesubfigure{(\textit{\alph{subfigure}})}

\captionsetup[subtable]{labelfont={sf},textfont={sf},textformat=sansmath,labelformat=simple} 
\renewcommand\thesubtable{(\textit{\alph{subtable}})}


%%%%%%%%%%%%  Section Headings  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[raggedright,indentafter]{titlesec}

\titleformat{\section}{\mathversion{bold}\bfseries\large\raggedright}{\thesection}{1em}{}
\titleformat{\subsection}[runin]{\mathversion{bold}\bfseries}{\thesubsection}{1em}{}[.]
\titleformat{\subsubsection}[runin]{\itshape}{\thesubsubsection}{1em}{}[.]

\titlespacing\section{0pt}{14pt plus 3pt minus 2pt}{3pt plus 2pt minus 1pt} 
\titlespacing{\subsection}{\parindent}{12pt plus 3pt minus 2pt}{0.5em}
\titlespacing{\subsubsection}{\parindent}{12pt plus 3pt minus 2pt}{0.5em}

%% ASME style does not seem to go lower than third level heading, so ...
%%     ...put \paragraph into \subsubsection settings.
\titleformat{\paragraph}[runin]{\itshape}{\thesubsubsection}{0.5em}{}[.]
\titlespacing{\paragraph}{\parindent}{14pt plus 3pt minus 2pt}{0.5em}

%% Special handling of the appendices            
%% Assumes that appendices are the last technical content in paper

\providecommand*{\appendicesname}{Appendices}
\newcounter{appeqn}%%  Code revised to better support tagged pdf, 2024/07/24
\patchcmd{\appendix}{%
   \setcounter{subsection}{0}}{%
   \setcounter{subsection}{0}%
   \pdfbookmark[1]{\appendicesname}{appendices}%
   \@addtoreset{equation}{appeqn}\stepcounter{appeqn}%
   \gdef\theequation{\@Alph\c@section\@arabic\c@equation}%
}{}{}
\apptocmd{\appendix}{\titleformat{\section}[block]{\mathversion{bold}\bfseries\large\raggedright}{\appendixname\ \thesection:}{0.5em}{}}

%% natbib's \bibsection controls section heading for References.


%%%%%%%%%%%%%%%%%  List environments  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{enumitem}

\setlist[enumerate,1]{label = (\arabic*), ref = (\arabic*),labelindent=3mm, leftmargin=*,noitemsep}
%% I have no examples of sublists...


%%%%%%%%%%%%%%%%%  Hyperref  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifpdftex
    %%% to assist with unicode glyph mapping, following M. Sharpe's recommendation in the newtx documentation. 
    %%% as of 2024/07/28, these are still necessary with \DocumentMetadata{pdfstandard=A-3u}. Note: glyphtounicode-cmex.tex is now in latex-lab.
    \InputIfFileExists{glyphtounicode-cmr.tex}{}{} 	%% additional mappings
    \InputIfFileExists{glyphtounicode-ntx.tex}{}{} 	%% additional mappings

    %% new pdf management in LaTeX, with \DocumentMetaData{..}, is preferred to this approach.
    \ifaj@setpdfa
	   %%%% the pdfmanagement options from Ulrike Fischer 2021/06/12
        \ifasme@pdfmanagement
        	\ClassInfo{\ClassName}{pdfmanagement is defined. Class file will not load a color profile}
        \else
        	\ClassInfo{\ClassName}{pdfmanagement not defined. Class file will load a color profile}%
            %%% a fairly generic RGB color profile, aimed at on-screen rendering (not print production)
                \immediate\pdfobj stream attr{/N 3} file{sRGB.icc}
                \pdfcatalog{%
                  /OutputIntents [
                    <<
                      /Type /OutputIntent
                      /S /GTS_PDFA1
                      /DestOutputProfile \the\pdflastobj\space 0 R
                      /OutputConditionIdentifier (sRGB)
                      /Info (sRGB)
                    >>
                  ]
                }
    	\fi
    \fi
\fi

%%%

\RequirePackage[psdextra]{hyperref} % provide most hyperref options via \hypersetup, but per documentation
									% set [psdextra] here (for additional math support in bookmarks) 2021/12/23
\hypersetup{%
	pdfborder={0 0 0}, 
	bookmarksnumbered=true,
	bookmarksopen=true,
	bookmarksopenlevel=1,
	colorlinks=true,
	linkcolor=blue, 
	citecolor=blue,  
	urlcolor=blue,   
	filecolor=red, % added 2021/12/23, to make certain broken links more apparent
	pdfnewwindow=true,
	pdfpagelayout=SinglePage, % was TwoPageRight, changed 2020/08/12
	pdfdisplaydoctitle=true,
}
	
\urlstyle{same}                % don't switch to typewriter font
\RequirePackage{doi}           % supports nasty characters in some doi's
\renewcommand{\doitext}{doi:~} % change the default, {doi:}, to this for ASME specification

\providecommand*{\toclevel@subfigure}{1}% <== to address unknown bookmark level of subfigure. 2021/12/24

\ifasme@pdfmanagement
	\ClassInfo{\ClassName}{pdfmanagement is defined. Class file will not load hyperxmp}
\else
	\providecommand\hrefurl[2]{\href{#1}{#2}}% if new pdf management code is not loaded, 2021/12/22
	% This alias is also incorporated into asmejour.bst
    \RequirePackage{bookmark} %% improves handling of pdf bookmarks
	\RequirePackage{hyperxmp} %% to fix transfer of metadata to Acrobat pdf 
	% Patch bug in hyperxmp, unless a more recent version is used.
        \@ifpackagelater{hyperxmp}{2022/10/15}{% v5.11 or later
            \relax
    %        \ClassInfo{\ClassName}{hyperxmp v5.11 or later is in use}
    	}{%
		\ifx\undefined\hyxmp@no@bad@parts\relax\else
            \newcount\hypxmp@tempcnt
            \define@key{Hyp}{pdfapart}{%
              \afterassignment\hyxmp@no@bad@parts\hypxmp@tempcnt=0#1\relax
              \hyxmp@pdfstringdef\@pdfapart{\the\hypxmp@tempcnt}%
            }
        \fi
    }
\fi

%%%%%% Adjustments to accommodate hyperref bookmarks %%%%%%%%%%%%%%%%%%%%%%

%%%     Recent development of \pdfstring has removed all robust commands from bookmarks (2021/12/23).
%%%     By mid-2024, no errors are thrown except for \bm; however, these commands serve to still suppress warnings.
%%%	    Math shift by $..$ still creates a warning, but I am leaving that in place. To avoid, use \( .. \) instead.

%% Since \bm is useful in headings, this fix will reduce frequency with which
%% alternate pdfstrings must be given in section command as \section[pdfstring]{texstring}
\pdfstringdefDisableCommands{%
    \def\bm#1#{\relax}%
}

%% Let's disable \( and \) in pdf bookmarks, 2020/02/28
\pdfstringdefDisableCommands{%
    \def\({\relax}%
    \def\){\relax}%
}

%% Let's just remove citations from pdf bookmarks
\pdfstringdefDisableCommands{%
    \def\cite{\@gobble}%
}

%% Ensure that tag color does not follow \eqref into bookmarks, 2020/02/28
\pdfstringdefDisableCommands{%
    \def\eqref#1{(\ref*{#1})}%
}

%% Let's make sure footnotes in section headings don't break pdf bookmarks.
%\robustify{\footnote} % redefined footnote above is protected, 2023/10/21
\pdfstringdefDisableCommands{%
    \def\footnote#1{}%
}


%%%%%%%%%%%%%  Define some section and other names for special environments  %%%%%%%%%%%%%%%%%%%%%%%%

\providecommand{\nomname}{Nomenclature}  
\providecommand{\keywordname}{Keywords}
\providecommand{\CAwords}{Corresponding Author.}

%%%%%%%%%%%%%  Nomenclature Environment   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Nomenclature environment in ASME Journal Style.
%% Run twice to get proper label width.
%% Set first optional argument (a dimension) to override automatic label width (e.g., if one label too wide)
%% Second argument can be used to rename the section, e.g., to List of Symbols.

\newlength\widest
\newlength\@widest
\newlength\nomenwidth
\newlength\savitemsep

\NewDocumentCommand{\entry}{m m}{%
	\ifblank{#2}{%
		\ClassError{\ClassName}{The command \protect\entry should have two arguments. For subheadings, use \protect\EntryHeading}{It appears that you gave only one argument for \protect\entry.  You need to include a second argument.}
	}{%
		\item[\hfill#1${} = {}$]#2%
		\@itempenalty=-\@lowpenalty%
		\setlength\itemsep\savitemsep%
		\settowidth\@widest{#1${} = {}$}%
		\ifdim\@widest>\widest \global\setlength\widest\@widest\fi%
    }
}

%% A separate command command for nomenclature subheadings
\NewDocumentCommand\EntryHeading{m}{%
             \itemsep12\p@ plus 4\p@ minus 4\p@
             \goodbreak\item[\bfseries#1\hfill]\mbox{}\itemsep3\p@ plus 1\p@ minus 1\p@\@itempenalty=1000% add \mbox for tagged pdf, 2023/10/20
}

\RequirePackage{totcount}
\newtotcounter{savedlength}
% a total counter for saving the value of \nomenwidth

\AtBeginDocument{\setlength{\nomenwidth}{\totvalue{savedlength}sp}}
% value is the length in scaled points (sp)

\NewDocumentEnvironment{nomenclature}{O{\nomenwidth} O{\nomname}}{%
       \setlength{\widest}{0em}
        \section*{#2}
        \raggedright
        \begin{list}{}{%
             \setlength{\topsep}{0pt}
             \setlength{\partopsep}{0pt}
             \setlength{\itemsep}{0pt}
             \setlength{\parsep}{\itemsep}
             \setlength{\labelsep}{0em}
             \setlength{\labelwidth}{#1}
             \setlength{\leftmargin}{\labelwidth}
             \addtolength{\leftmargin}{\labelsep}
			 \setlength\savitemsep\itemsep
         }%
   }{%
   \setcounter{savedlength}{\widest}%
   \end{list}\ignorespacesafterend
} 
       
%%%%%%%%%%%%%%%%  List of figures and list of tables  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ASME requires these lists for production. 
\ifasmejour@nolists
	\ClassNoteNoLine{\ClassName}{Omitting lists of figures and tables}%
\else
    \AtEndDocument{%
		\twocolumn[%
			\listoffigures
			\listoftables
		]%
	}%
\fi


%%%%%%%%%%%%%%%%  Author/Title/Abstract block  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% convert to expl3 2024/08/19
\ExplSyntaxOn

\coffin_new:N \g__asmejour_authorblock_coffin
\coffin_new:N \g__asmejour_ruleblock_coffin
\coffin_new:N \g__asmejour_abstract_coffin
\coffin_new:N \g__asmejour_title_coffin
\coffin_new:N \g__asmejour_firstrowauthorblock_coffin

\dim_new:N   \g__asmejour_coffinsep_dim %%% vert space between aut coffins
\dim_gset:Nn \g__asmejour_coffinsep_dim {4.5mm}

\dim_new:N   \g__asmejour_coffinspace_dim %%% vert space between title/abst coffins
\dim_gset:Nn \g__asmejour_coffinspace_dim {6.75mm}

\dim_new:N \g__asmejour_rulecofheight_dim
\dim_new:N \g__asmejour_titleheight_dim

\cs_new:Nn \__asmejour_internallinenumbers:n {
       \ifasmejour@lineno
          \str_if_in:nnT {#1} {R} { \rightlinenumbers* }
          \str_if_in:nnT {#1} {r} { \rightlinenumbers* }
	 	  \cs_set:Npn \thelinenumber { \@roman\c@linenumber }
		  \internallinenumbers
	   \fi
}

%% This command is used in the .tex file
\NewDocumentCommand\SetAuthorBlock{m m}{
	\__asmejour_setauthorblock:nn { #1 } { #2 }
}

\hcoffin_gset:Nn  \g__asmejour_firstrowauthorblock_coffin {}
\int_gzero_new:N  \g__asmejour_authorno_int

\cs_new:Nn \__asmejour_setauthorblock:nn {
   \int_gincr:N \g__asmejour_authorno_int
   \vcoffin_set:Nnn \g__asmejour_authorblock_coffin {48.2mm} {
	   \__asmejour_internallinenumbers:n {}
	   \raggedleft\sffamily
	   {\huge\CondSansBold \tl_trim_spaces:n { #1 } }\\ 
	   \CondSans#2
	}
    \int_compare:nNnTF { \g__asmejour_authorno_int } =  { 1 } {
    	\coffin_join:NnnNnnnn \g__asmejour_firstrowauthorblock_coffin { hc } { b } \g__asmejour_authorblock_coffin { hc } {t } { 0pt } { 0pt } 
        \dim_gset:Nn \g__asmejour_rulecofheight_dim  { \coffin_ht:N \g__asmejour_firstrowauthorblock_coffin  +  \coffin_dp:N \g__asmejour_firstrowauthorblock_coffin }
     }{
    	\coffin_join:NnnNnnnn \g__asmejour_firstrowauthorblock_coffin { hc } { b } \g__asmejour_authorblock_coffin {hc } {t } { 0pt } { - \dim_use:N \g__asmejour_coffinsep_dim }
        \dim_gset:Nn \g__asmejour_rulecofheight_dim  { \coffin_ht:N \g__asmejour_firstrowauthorblock_coffin  +  \coffin_dp:N \g__asmejour_firstrowauthorblock_coffin }
    }     
}
%% Standard coffin poles are (l hc r t T vc b B). See xcoffins documentation. 

\NewDocumentCommand\@SetTitle{m}{
   \cs_gset:Npn \@title {#1} % 2024/07/30 (make this standard command available)
   \vcoffin_set:Nnn \g__asmejour_title_coffin {114mm} {
	   \__asmejour_internallinenumbers:n {R}
   	  \vspace*{0.5mm}% <== ASME doesn't align bar and text
   	  \noindent\Huge\CondSansBold\raggedright
   	  #1
   	  \par
   }
}

%% \keywords is used in the .tex file
\cs_new:Npn \__asmejour_keywords {\relax}
\NewDocumentCommand{\keywords}{m}{% removed g option, 2021/01/30
	\cs_gset:Npn \__asmejour_keywords { \par\vskip\baselineskip\noindent{\keywordname :}~#1 }
}

\NewDocumentCommand\@SetAbstract{+m}{% add + to enable blank lines, etc. 2021/01/31
    \vcoffin_set:Nnn \g__asmejour_abstract_coffin {114mm}{
	   \__asmejour_internallinenumbers:n {R}
       \noindent\itshape
       #1
       \__asmejour_keywords\par 
       \vspace*{4mm}% <== at bottom of abstract to extend rule
    }
}

\NewDocumentCommand{\@ConstructAuthorBlock}{}{%
    \__asmejour_constructauthorblock:
}   
\cs_new:Nn 	\__asmejour_constructauthorblock: {
	\coffin_join:NnnNnnnn \g__asmejour_title_coffin { l } { b } \g__asmejour_abstract_coffin { l } {t } { 0pt } { - \dim_use:N \g__asmejour_coffinspace_dim } 
    \dim_gset:Nn \g__asmejour_titleheight_dim  { \coffin_ht:N \g__asmejour_title_coffin + \coffin_dp:N \g__asmejour_title_coffin }
	\if_dim:w \g__asmejour_titleheight_dim > \g__asmejour_rulecofheight_dim
		\dim_gset:Nn \g__asmejour_rulecofheight_dim { \g__asmejour_titleheight_dim }
	\else:
		\dim_add:Nn  \g__asmejour_rulecofheight_dim {7.0mm} 
	\fi:
	\hcoffin_set:Nn \g__asmejour_ruleblock_coffin { \color{\asmejour@barcolor}\rule{2.1mm}{ \dim_use:N \g__asmejour_rulecofheight_dim } }
	\coffin_join:NnnNnnnn \g__asmejour_firstrowauthorblock_coffin { vc } { r } \g__asmejour_ruleblock_coffin {vc } { l } { \dim_use:N \g__asmejour_coffinsep_dim } { 0pt } 
	\coffin_join:NnnNnnnn \g__asmejour_firstrowauthorblock_coffin { vc } { r } \g__asmejour_title_coffin {vc } { l } { \dim_use:N \g__asmejour_coffinsep_dim } { 0pt } 
    \coffin_typeset:Nnnnn \g__asmejour_firstrowauthorblock_coffin { l }{t }{ 0pt }{ 0pt }
}

\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Corresponding author gets footnote #1 and subsequent notes are 2, 3, ....
%% ASME apparently does not recognize joint first authors...so I have not coded that functionality

%% Flag for corresponding author (only one expected, although this code supports more than one)
\newif\ifaj@CA\aj@CAfalse

%% ASME prefers email to be in address block, not CA footnote; removed option 2021/01/30
\NewDocumentCommand{\CorrespondingAuthor}{}{%
	\global\aj@CAtrue%
	\def\@makefnmark{\hbox{\@textsuperscript{\sffamily\@thefnmark}}}%
	\footnotemark%
	\addtocounter{footnote}{-1}% in case of more than one CA
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength{\@AbstractSep}%% <== separation of author/abstract coffin from main two-column text.
\setlength{\@AbstractSep}{12.5mm}
\NewDocumentCommand\AbstractSep{m}{\setlength{\@AbstractSep}{#1}}

\NewDocumentCommand{\@MakeTitlePage}{}{%
    \thispagestyle{title}%
    \ifasmejour@singlecolumn % 2024/07/20
    	\@ConstructAuthorBlock
      	\vspace*{\@AbstractSep} 
    \else	
        \twocolumn[
        	\@ConstructAuthorBlock
          	\vspace*{\@AbstractSep} 
        ]
    \fi
    \ifaj@CA 
    	\addtocounter{footnote}{1}
    	\footnotetext{\CAwords}
    \fi
    \DateFootnote
    \ifasmejour@contractor\revfootnote{The United States Government retains, and by accepting the article for publication, the publisher acknowledges that the United States Government retains, a non-exclusive, paid-up, irrevocable, worldwide license to publish or reproduce the published form of this work, or allow others to do so, for United States Government purposes.}%
    \fi
    \ifasmejour@govt\revfootnote{This material is declared a work of the U.S. Government and is not subject to copyright protection in the United States. Approved for public release; distribution is unlimited.}%
    \fi
    \ifasmejour@govtsome\revfootnote{This work was authored in part by a U.\ S.\ Government employee in the scope of his/her employment. ASME disclaims all interest in the U.\ S.\ Government's contribution.}%
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Provide compatibility with titling commands from standard LaTeX article class

\RenewDocumentCommand{\maketitle}{}{\@MakeTitlePage}
\RenewDocumentCommand{\title}{}{\@SetTitle}

\RenewDocumentEnvironment{abstract}{+b}{\gdef\tmp{\@SetAbstract{#1}}\aftergroup\tmp}{\ignorespaces} 
%% Thanks to DPC for the suggestion of \gdef\tmp{...

%% Put date as an unnumbered footnote at bottom of first column
\ExplSyntaxOn
	\bool_new:N \g__asmejour_date_bool
    \tl_new:N   \g__asmejour_date_tl 
    \tl_new:N   \DateFootnote
	\bool_gset_true:N \g__asmejour_date_bool
    \tl_gset:Nn       \g__asmejour_date_tl { \today }
    \tl_gset:Nn \DateFootnote { 
    		\if_bool:N \g__asmejour_date_bool \revfootnote{\g__asmejour_date_tl} \else: \fi: 
	}
    \RenewDocumentCommand{\date}{m}
    {
    	\tl_if_empty:nTF {#1}
			{ \bool_gset_false:N \g__asmejour_date_bool }
        	{ \tl_gset:Nn \g__asmejour_date_tl { #1 } }
    }
\ExplSyntaxOff

\RenewDocumentCommand{\thanks}{m}{\relax}%% disabling this standard command, as it is inconsistent with this format

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
%%
%% End of file `asmejour.cls'.

