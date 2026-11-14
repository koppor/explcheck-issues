%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the asmejour class for formatting papers in a layout similar to ASME Journal papers.
%%  
%%  The asmejour.cls file should be used with the files asmejour.bst (for citations) and asmejour-template.tex.
%%
%%  This file's version and date are:
		\def\versionno{1.28}
		\def\versiondate{2026/11/05\space}
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
%%			7. Provide copyright notices for government employees and government contractors
%%		    8. Enable various math features from the newtxmath or unicode-math packages 
%%		    9. Support inclusion of passages in languages other than English
%%
%%  This class is compatible with both pdfLaTeX and LuaLaTeX. All packages required by the class 
%%  are in standard distributions, such as TeX Live, and are also available at CTAN (https://ctan.org/).
%%  The use of a complete and up-to-date (Nov. 2022 or later) LaTeX distribution is strongly recommended;
%%	    ==> Distributions older than Oct. 2020 are not supported. 
%%
%%  The title block is set by specific commands that are described in the asmejour-template.tex file.
%%
%%  The class defines an abstract environment (with optional keywords) and a nomenclature environment.   
%%  (LaTeX must be run twice to align the columns in the nomenclature list).
%% 
 %=========================================================
%%
%% LICENSE:
%%
%% Copyright (c) 2026 John H. Lienhard
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
\ProvidesClass{asmejour}[\versiondate asmejour paper format (JHL)]

\@ifl@t@r\fmtversion{2020/10/01}{}{% earlier versions are not supported, 2026/11/05
    \GenericError{\space\space\space\space}{Class asmejour Error: LaTeX format is too old%
    }{%
      This class requires a LaTeX format from 2020/10/01 or later.%
    }{%
      Please update your TeX distribution to compile this document. %
      TeX Live is available for download at no charge: see \string https://www.tug.org/texlive/.%
    }%
  \@@end % stop running
}

\ExplSyntaxOn
%\debug_on:n {all}

\cs_if_exist:NT \disable@package@load { \disable@package@load{exscale}{\relax} }
		% stop extarticle from loading exscale: not using CMR + breaks tagging of \section with \mathversion{..}, 2025/04/18
		% appears that this will be fixed soon: https://github.com/latex3/tagging-project/issues/1154  

\LoadClass[twoside,9pt]{extarticle}% twocolumn format is initiated by the \maketitle command 2024/07/20

\str_const:Nn \ClassName { asmejour }
\prop_gput:Nnn \g_msg_module_type_prop { \ClassName } { Class }

\newif\ifpdftex % user command
\newif\ifPDFtex % deprecated legacy macro

\sys_if_engine_pdftex:TF {
    \let\ifasmejour@pdftex\iftrue 
	\pdftextrue
	\PDFtextrue   
	\msg_new:nnnn { \ClassName } { notagpdftex } 
				  { Run~lualatex,~not~pdftex,\iow_newline: when~tagging~is~used~in~\string\DocumentMetadata }
				  { You~appear~to~have~"tagging=on"~in~\string\DocumentMetadata.~Set~to~"off"~with~pdftex.}
	\cs_if_exist:NT \tag_if_active:T % not in TeX Live 2021
		{
		  \tag_if_active:T { \msg_error:nn  { \ClassName } { notagpdftex } }
		}
  }{ 
    \let\ifasmejour@pdftex\iffalse
  }
\ExplSyntaxOff

\RequirePackage{etoolbox}% used to patch subequations environment and old versions of lineno


%%%%%%%%%%%%%  Some compatibility for older distributions  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}%  compare version to date; \If... added to latex 2020/10/01

\IfFormatAtLeastTF{2022/06/01}{\relax}{%
	\ClassWarning{\ClassName}{Your LaTeX format is dated \fmtversion. Formats dated 2022-06-01 or later are strongly recommended for the asmejour class. TeX Live is available for download at no charge: see \string https://www.tug.org/texlive/.  Removing the \string\DocumentMetadata command will help for 2021 releases.}%
}

% Prior to the 2026/06/01 release, multline had an extra \jot above it (10 pt in this style), so subtract  
%		from \abovedisplayskip to remove the imbalance. https://www.latex-project.org/news/latex2e-news/ltnews43.pdf
%
\IfFormatAtLeastTF{2026/06/01}{\relax}{
	\AddToHook{env/multline/begin}{\addtolength\abovedisplayskip{-10pt}}% 2025/04/06 increase to 10pt from 7pt, use hooks not etoolbox
	\AddToHook{env/multline*/begin}{\addtolength\abovedisplayskip{-10pt}}% 2026/11/05
}

% Allow pre 2021/11/15 formats to see the graphicx alt= key without causing an error, 
%    and define two commands.
\IfFormatAtLeastTF{2021/11/15}{
	\relax
  }{ 
    \providecommand\IfPackageLoadedTF{\@ifpackageloaded}%                   \If...added to latex 2021/11/15
    \providecommand\ClassNoteNoLine[2]{\typeout{^^JClass Note #1: #2.^^J}}% log & terminal note... added to latex 2021/11/15
	\AddToHook{begindocument}{
	    \define@key{Gin}{alt}{} % this class loads graphicx by default
    }
  }

\ExplSyntaxOn
%\debug_on:n {all}

% Backward compatibility for expl3 variants 
\cs_generate_variant:Nn \tl_gset:Nn  {Ne} % not def'd in TL 2022
\cs_generate_variant:Nn \seq_item:Nn {NV} % not def'd in TL 2023
\cs_generate_variant:Nn \str_set:Nn  {Ne} % not def'd before 2023-10-10
\cs_if_exist:NF \exp_after:w { \cs_new_eq:NN \exp_after:w \exp_after:wN } % 2026/08 change to expl3

%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifasmejour@mainset
\newif\ifasmejour@varzero

\msg_new:nnn { \ClassName } { mainlang } { Selecting~#1~as~the~primary~language }
\msg_new:nnn { \ClassName } { mathalfa } { 
    The~mathalfa~option~has~been~dropped;~load~the~mathalpha~package~instead.\iow_newline: 
    If~you~see~an~error~"Use~of~\token_to_str:N \???~doesn't~match~its~definition"~or~
    "Misplaced~'='~in~key-value~input",~remove~the~option~from~\token_to_str:N \documentclass.
  }
\tl_if_in:NnT \@classoptionslist   { mathalfa }
  { \msg_warning:nn { \ClassName } { mathalfa } }  

%% Now create options and keys
\IfFormatAtLeastTF{2022/11/01}{
    \str_new:N  \asmejour@barcolor
    \str_set:Nn \asmejour@barcolor { black }% default
%   
    %% Set main language
    \cs_new_protected:Nn \__asmejour_setupmain:n {
    	\PassOptionsToPackage{ main=#1 }{babel}
    	\asmejour@mainsettrue 
    	\msg_term:nnn { \ClassName } { mainlang } {#1}
    }
    \DeclareKeys[\ClassName]
    {
		balance 		.if	 	= asmejour@balance ,% 		Option to balance column height on last page [balance]
		balance 		.usage	= load ,
		barcolor		.store  = \asmejour@barcolor ,% 	Optional color for vertical bar in title block [barcolor= ], from xcolor package
		barcolor		.usage	= preamble ,
		contractor 		.if		= asmejour@contractor ,% 	Option for government contractor copyright notice [contractor]
		contractor 		.usage	= load ,
		govt 			.if	 	= asmejour@govt ,% 			Option for copyright notice if all authors are government employees [govt]
		govt 			.usage	= load ,
		govtsome 		.if		= asmejour@govtsome ,% 		Option for copyright notice if only some authors are government employees [govtsome]
		govtsome 		.usage	= load ,
        hyphenate 		.if	 	= asmejour@hyphenate ,% 	Option to allow hyphenation of typewriter font [hyphenate]
		hyphenate 		.usage	= load ,
		lineno 			.if	 	= asmejour@lineno ,% 		Option to obtain line numbers [lineno] 
		lineno 			.usage	= load ,
		main			.code	= \__asmejour_setupmain:n { #1 },%  Option to set main language (for babel) [main= ]
		main 			.usage	= load ,
		mathalfa		.code	= {} ,%                     Option no longer used, 2025/04/01 
		mathalfa		.usage	= load ,
		mono 			.if	 	= asmejour@mono ,% 			Option to enforce monospacing of typewriter font [mono]
		mono 			.usage	= load ,
		nocopyright 	.if	 	= asmejour@nocopyright ,% 	Option to omit ASME copyright notice [nocopyright]
		nocopyright		.usage	= load ,
		nofoot 			.if	 	= asmejour@nofoot ,% 		Option to omit ASME footers [nofoot]
		nofoot 			.usage	= load ,
		nolists 		.if	 	= asmejour@nolists ,% 		Option to omit lists of figures and tables [nolists]
		nolists 		.usage	= load ,
		singlecolumn 	.if	 	= asmejour@singlecolumn ,% 	Option for single column layout [singlecolumn]
		singlecolumn 	.usage	= load ,
		upint 			.if	 	= asmejour@upint ,% 		Option for upright integrals [upint]
		upint 			.usage	= load ,
		var0 			.if	 	= asmejour@varzero ,% 		Option for unslashed zero in typewriter font [var0]
		var0 			.usage	= load ,
    }
	\DeclareUnknownKeyHandler[\ClassName]{\relax}% suppress warning about unused keys
	\ProcessKeyOptions[\ClassName]
	
}{% And more compatibility code for distributions pre-2022/11     
    \RequirePackage{kvoptions}% this package loads kvsetkeys
    \SetupKeyvalOptions{
      family=\ClassName,
      prefix=asmejour@,
      setkeys=\kvsetkeys,
    }  
    %% Option to balance column height on last page [balance] 
    \DeclareBoolOption{balance}    
    %% Option for government contractor copyright notice [contractor]
    \DeclareBoolOption{contractor}   
    %% Option for copyright notice if all authors are government employees [govt]
    \DeclareBoolOption{govt}    
    %% Option for copyright notice if some (not all) authors are government employees [govtsome]
    \DeclareBoolOption{govtsome}    
    %% Option to obtain line numbers [lineno] 
    \DeclareBoolOption{lineno}    
    %% Option to omit ASME copyright notice [nocopyright]
    \DeclareBoolOption{nocopyright}    
    %% Option to omit ASME footers [nofoot]
    \DeclareBoolOption{nofoot}    
    %% Option to omit lists of figures and tables
    \DeclareBoolOption{nolists}    
    %% Option for single column layout [singlecolumn], 2024/07/20
    \DeclareBoolOption{singlecolumn} 
    %% Typewriter-font and math-font options
    \DeclareBoolOption{hyphenate}
    \DeclareBoolOption{mono}
    \DeclareBoolOption{upint}
    \DeclareVoidOption{var0}{\asmejour@varzerotrue}
      
    %% set key [barcolor=] to pass a color name defined by xcolor package
    \DeclareStringOption[black]{barcolor}    

    %% the key [main= ] to pass the choice of main language to babel
    \define@key{\ClassName}{main}{%
    	  \PassOptionsToPackage{main=#1,#1}{babel}% added #1 resolves conflicts between certain .ldf files under "main=".
    	  \asmejour@mainsettrue
	   	  \msg_note:nnn { \ClassName } { mainlang } {#1}
    }    
    %% the key [mathalfa= ] was dropped with v1.25; instead, load the mathalpha package in your preamble
    \define@key{\ClassName}{mathalfa}{}      
    
    %% Suppress warnings about unused global options, 2021/12/01
    \DeclareDefaultOption{}   
    \ProcessKeyvalOptions{\ClassName}
    
    %% Turn off these keys now that we're done with them
    \NewDocumentCommand\asmejour@DisableOption{m}{%
		\DisableKeyvalOption[%
			action=ignore,%
			class=\ClassName%
        ]{\ClassName}{#1}%
    }
    \NewDocumentCommand\asmejour@DisableKeys{>{\SplitList{;}}m}{\ProcessList{#1}{\asmejour@DisableOption}}
    \asmejour@DisableKeys{singlecolumn;lineno;balance;nolists;nocopyright;nofoot;govt;govtsome;contractor;
                          barcolor;main;mathalfa;hyphenate;mono;upint;var0}
}

%% if main language was not chosen explicitly, default to US English
\ifasmejour@mainset\relax\else
	\IfFormatAtLeastTF{2025/06/01}
	{
		\PassOptionsToPackage{ main=USenglish }{ babel }%
		\msg_log:nnn { \ClassName } { mainlang } { English-US }
	}{
		\PassOptionsToPackage{ main=english }{ babel }%
		\msg_log:nnn { \ClassName } { mainlang } { English }
	}
\fi

\ExplSyntaxOff


%%%%%%%%%  Various font-related options  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% option for upright integral signs, rather than default slanted integrals, [upint]
\def\UpInt{}% default slanted integrals in STIX Two Math font with unicode-math
\ifasmejour@upint
	\ifasmejour@pdftex
		\PassOptionsToPackage{upint}{newtxmath}% this option exists in newtxmath
	\else
		\def\UpInt{+ss08}% upright integrals in STIX Two Math font and Lete Sans Math fonts
	\fi
\fi

%% Select larger small capitals font from newtxtext, set as default 2025/03/30
\ifasmejour@pdftex
	\PassOptionsToPackage{largesc=true}{newtxtext} 
\fi

%% Option to allow hyphenation of typewriter font [hyphenate]
\ifasmejour@hyphenate
	\ifasmejour@pdftex 
		\PassOptionsToPackage{hyphenate}{inconsolata}% hyphenate is a key via xkeyval in inconsolata
		\ClassNoteNoLine{\ClassName}{Allowing hyphenation of typewriter font}%
	\else
		\ClassWarningNoLine{\ClassName}{The [hyphenate] option is only supported with pdftex. It will be ignored}%
	\fi
\fi

%% Option to enforce monospacing of words in the typewriter font [mono]
\def\MonoNotMono{WordSpace={1,1,1}}% rescale fontspec's tt font to match pdf tt font, 2024/07/30
\ifasmejour@mono
	\ifasmejour@pdftex
		\PassOptionsToPackage{mono}{inconsolata}% mono is a key via xkeyval in inconsolata
	\else
		\def\MonoNotMono{WordSpace={1,0,0},PunctuationSpace={3}}% 2024/07/30, these are actually default WordSpace values
	\fi
\fi

%% Option for unslashed zero typewriter font [var0]
\def\asmejour@ssztwo{}% for Inconsolatazi4; default uses slashed zero, +ss02 uses regular zero
\ifasmejour@varzero
	\ifasmejour@pdftex
		\PassOptionsToPackage{var0}{inconsolata}% var0 is a key via xkeyval in inconsolata
	\else
		\def\asmejour@ssztwo{+ss02}% stylistic alternate for regular zero
	\fi
\fi


%%%%%%%%%%%%  Page size, bibliography, graphics, color  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[paperheight=285.75mm, paperwidth=215.900mm, left=21.100mm, right=21.100mm, top=15.9mm, bottom = 24mm, footskip=8mm]{geometry}
\setlength\columnsep{4.5mm}
\setlength\parindent{3.5mm}
%% ASME's pdf pages are 11.25 in. tall, not 11.00 in.

\RequirePackage[sort&compress,numbers]{natbib} 
\AddToHook{begindocument}{\def\NAT@space{\relax}}%   ASME puts no space between numerical references (2020/04/05)
\setlength\bibsep{0pt plus 1pt minus 0pt}%  ASME keeps this tight
\renewcommand*{\bibfont}{\footnotesize}

\RequirePackage{graphicx} 
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}% removed obsolete options, 2023/10/23


%%%%%%%%%%%%%  Table related   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{array} 

\RequirePackage{dcolumn}%  column alignment on decimal places
	\newcolumntype{d}[1]{D{.}{.}{#1}}
	% NB: The above conflicts with babel's Spanish language option which makes "." an active character.
    % Instead: use "," as the decimal separator, choose columntype "," (as in "12,234"), and put
    % 	\newcolumntype{,}[1]{D{,}{,}{#1}} in your preamble.


%% make \hline in tables heavier than default 0.4pt
\setlength\arrayrulewidth{0.5\p@}

%% use double-rules for top and bottom of tables, per ASME style. Weights are fixed, command options are not processed.
\RequirePackage{booktabs}
    \renewcommand*{\toprule}{\specialrule{0.5pt}{0pt}{\doublerulesep}\specialrule{0.5pt}{0pt}{3pt}}
    \renewcommand*{\midrule}{\specialrule{0.5pt}{2pt}{3pt}}
    \renewcommand*{\bottomrule}{\specialrule{0.5pt}{1pt}{\doublerulesep}\specialrule{0.5pt}{0pt}{0pt}}


%%%%%%%%%%%%%  Font related   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{mathtools}% loads and extends amsmath
\RequirePackage[]{babel}%   supports languages other than English, if used.

\ifasmejour@pdftex
    \RequirePackage[T1]{fontenc}
 	%% ASME word separation is greater than newtxtext defaults so change these parameters.  
 	%%     increased shrink from 0.08, 2021/01/30; add this helvetica scaling 2022/06/26
	\RequirePackage[helvratio=0.91, spacing=0.3em, stretch=0.18em, shrink=0.10em]{newtxtext}% default {0.25em,0.2em,0.1em}
	\RequirePackage[varl,varqu]{inconsolata}% sans typewriter font; restored varl, varqu 2020/08/10 
	\RequirePackage[]{newtxmath}
	\RequirePackage{bm}%  load after all math for expanded access to bold math
%
\else
    % Revised 2025/11/20
    \RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}, mathbf=sym]{unicode-math}
%    \RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
    % suppress warnings about lack of integration between mathtools and unicode-math
    % unicode-math loads the fontspec package
%
	\ExplSyntaxOn
        \msg_new:nnn { \ClassName } { missingfont }
            { Required~font~not~found:\iow_newline:`#1'.\iow_newline: This~font~is~in~TeX~Live~and~CTAN. }
        \clist_map_inline:nn
            { TeXGyreTermesX-Regular.otf, texgyretermes-math.otf, texgyreheros-regular.otf, Inconsolatazi4-Regular.otf, 
            XITSMath-Bold.otf, STIXTwoMath-Regular.otf } % LeteSansMath-Bold checked below, assume same as LeteSansMath
            { \IfFontExistsTF {#1} { } { \msg_error:nnn { \ClassName } { missingfont } {#1} } }
    \ExplSyntaxOff

	%
	% The newtx package includes a modified version of TeXGyreTermes called TexGyreTermesX, which could be loaded instead.
    \setmainfont{TeXGyreTermesX}[% Presumes this font is on your system. It is in TeX Live and in CTAN (under the newtx hierarchy)
		WordSpace = {1.20,1.44,1.2},% This stretch matches newtxtext fontdimens (reset 2024/07/30)
    	PunctuationSpace = {1.33},% reset 2024/07/30
	    Extension = .otf,
    	UprightFont = *-Regular,
    	ItalicFont = *-Italic,
    	BoldFont = *-Bold,
    	BoldItalicFont = *-BoldItalic,
		Numbers = Lining,
		]
    \setsansfont{texgyreheros}[% Presumes this font is on your system. It is in TeX Live and at: http://www.gust.org.pl/projects/e-foundry/tex-gyre
		WordSpace = {1,1,1.0036},%% This stretch matches newtxtext fontdimens (reset 2024/07/30)
    	PunctuationSpace = {1.0036},% reset 2024/07/30
    	Scale=0.91,% same as for newtx; former value 0.9 too small 2022/01/15
		Extension = .otf,
    	UprightFont = *-regular,
    	ItalicFont = *-italic,
    	BoldFont = *-bold,
    	BoldItalicFont = *-bolditalic,
		Numbers = Lining,
		]        
   \setmonofont{Inconsolatazi4}[% This otf font ships with the LaTeX Inconsolata package (it's in TeX Live)
        Scale=1.0,% rescaled 1.05, 2022/03/10; reset to 1 2024/07/30, based on fontdimen6 (and all others!)
        Extension = .otf,
        UprightFont = *-Regular,
        ItalicFont = *-Regular,% has no italic face
        BoldFont = *-Bold, 
    	BoldItalicFont = *-Bold,% has no italic face
        RawFeature = {+ss01,\asmejour@ssztwo,-ss03},
        \MonoNotMono,% WordSpace and PunctuationSpace are set in the class option [mono]
        ]
	\setmathfont{texgyretermes-math}[% Presumes it's installed! http://www.gust.org.pl/projects/e-foundry/tex-gyre
    	Scale=MatchUppercase,
	    Extension = .otf,
		]
	\ExplSyntaxOn
    \IfFontExistsTF{XITSMath-Bold.otf}{    
        \setmathfont{XITSMath-Bold.otf}[
        	Scale=MatchUppercase,
			version=bold,
			NFSSFamily=xmb,
            ]% font is missing \cdot U+22C5
        \setmathfontface\mathrm{XITSMath-Bold.otf}[Scale=MatchUppercase,version=bold] 
        % the next command added to LaTeX, 2020/10; not clear why /end is required when other begindocument hooks come first
		\AddToHook{begindocument/end} 
         {
          \NewCommandCopy{\standardcdot}{\cdot} % thanks to Enrico Gregorio and David Carlisle for this solution
          \cs_set_protected:Npn \cdot
           {
            \str_if_eq:vnTF { math@version } { bold }
             { \cdotp }			% U+00B7
             { \standardcdot }	% U+22C5
           }
         }
	}{
		\msg_new:nnn { \ClassName } { noxitsbold } 
		       { XITS~Math~Bold~font~not~found,~falling~back~to~TeX~Gyre~Termes~Math~with~FakeBold}
		\msg_warning:nn { \ClassName } { noxitsbold }
		\setmathfont{texgyretermes-math}[Scale=MatchUppercase,version=bold,FakeBold=3.5]
        \setmathfontface\mathrm{texgyretermes-math}[Scale=MatchUppercase,version=bold,FakeBold=3.5] 
    }
%
    % set up sans and sansbold math fonts
    \IfFontExistsTF{LeteSansMath-Bold.otf}% the bold version was released a few months after the regular, but we need both.
    {
        \setmathfont{LeteSansMath-Bold}[% In TeX Live. A newer math font (2024/05), boldface sans serif
            Scale=MatchUppercase,
	       	Extension = .otf,
			RawFeature={\UpInt},
            version=sansbold,
        ]
        \setmathfontface\mathrm{LeteSansMath-Bold.otf}[
        	Scale=MatchUppercase,
			version=sansbold,
		]
        \setmathfont{LeteSansMath}[
            Scale=MatchUppercase,
	       	Extension = .otf,
			RawFeature={\UpInt},
            version=sans,
            BoldFont = *-Bold,
            NFSSFamily=lsm,
        ]
        \setmathfontface\mathrm{LeteSansMath.otf}[
        	Scale=MatchUppercase,
			version=sans,
		]
        \setmathfontface\mathbf{LeteSansMath-Bold.otf}[
        	Scale=MatchUppercase,
			version=sans,
		]
		\DeclareSymbolFont{lsmgreek}{TU}{lsm}{m}{n}% NFSSFamily lsm set above
        \SetSymbolFont{lsmgreek}{normal}{TU}{lsm}{m}{n} 
        \SetSymbolFont{lsmgreek}{bold}{TU}{lsm}{b}{n}
%
		\DeclareSymbolFont{xmbop}{TU}{xmb}{m}{n}% NFSSFamily xmb set above
        \SetSymbolFont{xmbop}{normal}{TU}{xmb}{m}{n}% pulling individual bold symbols, so not dealing with m/b (cf. lsmgreek) 
%
        \AddToHook{begindocument/end} 
         {
          \NewCommandCopy{\standarddoteq}{\doteq} % thanks to Enrico Gregorio and David Carlisle for this solution
          \cs_set_protected:Npn \doteq
           {
            \str_if_eq:vnTF { math@version } { sansbold }
             { \xmbdoteq }		% specific fallback for sansbold math version
             { \standarddoteq }	% U+2250 (do nothing)
           }
		}
%
        \setmathfont{STIXTwoMath-Regular}[% In TeX Live. Substitution for bigger integrals (similar to newtxmath)
	       	Extension = .otf,
            Scale=MatchUppercase,
            RawFeature={\UpInt},
            BoldFont=*, 
            range={"0222B-"02233,"02A0B-"02A1C}, 
        ] 
    }{
		\msg_new:nnn { \ClassName } { noletebold } 
		             { Lete~Sans~Math~Bold~font~not~found,~falling~back~to~Fira~Math~with~FakeBold }
		\msg_warning:nn { \ClassName } { noletebold }
		\IfFontExistsTF{FiraMath-Regular.otf}{}{\ClassWarningNoLine{\ClassName}{Fira Math font not found}}
		\setmathfont{FiraMath-Regular}[% 2020 version of Regular is in TeX Live
            Scale=MatchUppercase,
	       	Extension = .otf,
            version=sansbold,
            FakeBold = 4,
    	]
        \setmathfontface\mathrm{FiraMath-Regular.otf}[
        	Scale=MatchUppercase,
			version=sansbold,
			FakeBold = 4,
		]
		\setmathfont{FiraMath-Regular}[% 2020 version of Regular is in TeX Live
            Scale=MatchUppercase,
	       	Extension = .otf,
            version=sans,
            NFSSFamily=fsm,
            BoldFont=*, 
			BoldFeatures = {FakeBold=4},
        ]
        \DeclareSymbolFont{fsmgreek}{TU}{fsm}{m}{n}% NFSSFamily fsm set above
        \SetSymbolFont{fsmgreek}{normal}{TU}{fsm}{m}{n}
        \SetSymbolFont{fsmgreek}{bold}{TU}{fsm}{b}{n}
%
        \setmathfontface\mathrm{FiraMath-Regular.otf}[
        	Scale=MatchUppercase,
			version=sans,
		]     
        \setmathfontface\mathbf{FiraMath-Regular.otf}[
        	Scale=MatchUppercase,
			version=sans,
			FakeBold=4,
		]     
        \setmathfont{STIXTwoMath-Regular}[% In TeX Live. Subst. bigger integrals (similar to newtxmath) + cal,scr,frak
	       	Extension = .otf,
            Scale=MatchUppercase,
    		BoldFont = *,
            RawFeature={\UpInt},
            range={"0222B-"02233,"02A0B-"02A1C,frak,bffrak,cal,bfcal,scr,bfscr}
        ]
	}
%	
    \ExplSyntaxOff
%
    \setmathfontface\mathsf{texgyreheros-bold.otf}[Scale=0.91,version=sansbold]       % for sf     
    \setmathfontface\mathit{texgyreheros-bolditalic.otf}[Scale=0.91,version=sansbold] % for it
    \setmathfontface\mathtt{Inconsolatazi4-Bold.otf}[Scale=1.0,version=sansbold] 	  % for tt
%
    \setmathfontface\mathsf{texgyreheros-regular.otf}[Scale=0.91,version=sans]  	% for sf     
    \setmathfontface\mathit{texgyreheros-italic.otf}[Scale=0.91,version=sans]		% for it
    \setmathfontface\mathtt{Inconsolatazi4-Regular.otf}[Scale=1.0,version=sans]		% for tt
\fi
  
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

%% Fonts for author and title only: TeX Gyre Heros Condensed (qhvc, regular is qhv)
\DeclareFontFamily{T1}{qhvc}{}% qhvc is not TU encoded
\DeclareFontShape{T1}{qhvc}{m}{n}{<-> s*[0.91] ec-qhvcr}{} %% see t1qhvc.fd; 0.9-->0.94 2022/01/15; 0.94-->0.91 2022/06/26
\DeclareFontShape{T1}{qhvc}{b}{n}{<-> s*[0.91] ec-qhvcb}{} %% see t1qhvc.fd; 0.9-->0.94 2022/01/15; 0.94-->0.91 2022/06/26
\DeclareFontShape{T1}{qhvc}{bx}{n}{<-> s*[0.91] ec-qhvcb}{} % bx = b, no ssub message, 2026/11/05
\newcommand*{\CondSans}{\fontencoding{T1}\fontfamily{qhvc}\selectfont}% remove extra \selectfont, 2023/10/21
\newcommand*{\CondSansBold}{\fontencoding{T1}\fontfamily{qhvc}\fontseries{bx}\selectfont} % 2026/11/05
\newcommand*\CondHuge{\@setfontsize\Huge{26.5}{26.5}}    %... for title only
\newcommand*\Condhuge{\@setfontsize\huge{14}{14}}        %... for author names only
 
\ifasmejour@pdftex    
    %% sans math version, potential value with PGFPlots, etc., 2021/01/25 %%%
    \DeclareMathVersion{sans}
    \SetSymbolFont{letters}{sans}{OML}{ntxsfmi}{m}{it}
    \SetSymbolFont{lettersA}{sans}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{symbols}{sans}{LMS}{ntxsy}{m}{n}
    \SetSymbolFont{largesymbols}{sans}{LMX}{ntxexx}{m}{n}
    \SetSymbolFont{largesymbolsTXA}{sans}{U}{ntxexa}{m}{n}
    \SetSymbolFont{operators}{sans}{OT1}{\sfdefault}{\mddefault}{n}% fixed encoding 2025/04/04; fixed \mddefault 2026/11/05
    \SetMathAlphabet{\mathsf}{sans}{\encodingdefault}{\sfdefault}{m}{n}% make upright 2021/01/31.
%
    %% sans serif italic and sans serif bold italic math
    \DeclareMathVersion{sansbold}
    \SetSymbolFont{letters}{sansbold}{OML}{ntxsfmi}{b}{it}
    \SetSymbolFont{lettersA}{sansbold}{U}{ntxsfmia}{b}{it}
    \SetSymbolFont{symbols}{sansbold}{LMS}{ntxsy}{b}{n}
    \SetSymbolFont{largesymbols}{sansbold}{LMX}{ntxexx}{b}{n}%  added 2021/01/26
    \SetSymbolFont{largesymbolsTXA}{sansbold}{U}{ntxexa}{b}{n}% added 2021/01/26
    \SetSymbolFont{operators}{sansbold}{OT1}{\sfdefault}{\bfdefault}{n}% fixed encoding 2025/04/04
    \SetMathAlphabet{\mathsf}{sansbold}{\encodingdefault}{\sfdefault}{b}{n}% \mathsf is upright
%
\fi

%%%%%%%%%%%%%%  Sans serif upright greek and sans mathversion  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% revised 2025/04/17
%
\ifasmejour@pdftex
    %% Provide sans-serif *upright* Greek letters, following a suggestion by Michael Sharpe (March 2019).
    %% Following Sharpe's newtxsf implementation of the STIX fonts, under the LaTeX Project Public License.
    %% (Note that \mathversion{sansbold} provides sans-serif *italic* Greek letters.)
    \DeclareSymbolFont{lettersAB}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{lettersAB}{normal}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{lettersAB}{bold}{U}{ntxsfmia}{b}{it}
    \SetSymbolFont{lettersAB}{sans}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{lettersAB}{sansbold}{U}{ntxsfmia}{b}{it}

    \DeclareMathSymbol{\sfGamma}{\mathalpha}{lettersAB}{0}% adjust to avoid overwriting newtxmath commands, 2021/01/25
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
    
    \DeclareMathSymbol{\sfalpha}{\mathord}{lettersAB}{11} % \mathord, not \mathalpha 2026/11/05
    \DeclareMathSymbol{\sfbeta}{\mathord}{lettersAB}{12}
    \DeclareMathSymbol{\sfgamma}{\mathord}{lettersAB}{13}
    \DeclareMathSymbol{\sfdelta}{\mathord}{lettersAB}{14}
    \DeclareMathSymbol{\sfepsilon}{\mathord}{lettersAB}{15}
    
    \DeclareMathSymbol{\sfzeta}{\mathord}{lettersAB}{16}
    \DeclareMathSymbol{\sfeta}{\mathord}{lettersAB}{17}
    \DeclareMathSymbol{\sftheta}{\mathord}{lettersAB}{18}
    \DeclareMathSymbol{\sfiota}{\mathord}{lettersAB}{19}
    \DeclareMathSymbol{\sfkappa}{\mathord}{lettersAB}{20}
    
    \DeclareMathSymbol{\sflambda}{\mathord}{lettersAB}{21}
    \DeclareMathSymbol{\sfmu}{\mathord}{lettersAB}{22}
    \DeclareMathSymbol{\sfnu}{\mathord}{lettersAB}{23}
    \DeclareMathSymbol{\sfxi}{\mathord}{lettersAB}{24}
    \DeclareMathSymbol{\sfpi}{\mathord}{lettersAB}{25}
    
    \DeclareMathSymbol{\sfrho}{\mathord}{lettersAB}{26}
    \DeclareMathSymbol{\sfsigma}{\mathord}{lettersAB}{27}
    \DeclareMathSymbol{\sftau}{\mathord}{lettersAB}{28}
    \DeclareMathSymbol{\sfupsilon}{\mathord}{lettersAB}{29}
    \DeclareMathSymbol{\sfphi}{\mathord}{lettersAB}{30}
    
    \DeclareMathSymbol{\sfchi}{\mathord}{lettersAB}{31}
    \DeclareMathSymbol{\sfpsi}{\mathord}{lettersAB}{32}
    \DeclareMathSymbol{\sfomega}{\mathord}{lettersAB}{33}
    \DeclareMathSymbol{\sfvarepsilon}{\mathord}{lettersAB}{34}
    \DeclareMathSymbol{\sfvartheta}{\mathord}{lettersAB}{35}
    
    \DeclareMathSymbol{\sfvarpi}{\mathord}{lettersAB}{36}% added these 2021/01/25
    \DeclareMathSymbol{\sfvarrho}{\mathord}{lettersAB}{37}
    \DeclareMathSymbol{\sfvarsigma}{\mathord}{lettersAB}{38}
    \DeclareMathSymbol{\sfvarphi}{\mathord}{lettersAB}{39}
    \DeclareMathSymbol{\sfitvarkappa}{\mathord}{lettersAB}{40}
    \DeclareMathSymbol{\sfvarkappa}{\mathord}{lettersAB}{41} % looks same as {40}
    \DeclareMathSymbol{\sfitnabla}{\mathord}{lettersAB}{42}
    \DeclareMathSymbol{\sfnabla}{\mathord}{lettersAB}{43}
    \DeclareMathSymbol{\sfhslash}{\mathord}{lettersAB}{52}% this is not upright
    \DeclareMathSymbol{\sfhbar}{\mathord}{lettersAB}{53}%   this is not upright
\else
    \IfFontExistsTF{LeteSansMath-Bold.otf}
    {
        \def\ac@sansgreek{\symlsmgreek}
        %
		% one-off to deal with gap in LeteSansMath-Bold
    	\Umathchardef\xmbdoteq="2  \symxmbop "2250	 
    }{
        \def\ac@sansgreek{\symfsmgreek}
    }
    % uppercase greek
    \Umathchardef\sfAlpha="0   \ac@sansgreek "0391
    \Umathchardef\sfBeta="0    \ac@sansgreek "0392
    \Umathchardef\sfGamma="0   \ac@sansgreek "0393
    \Umathchardef\sfDelta="0   \ac@sansgreek "0394
    \Umathchardef\sfEpsilon="0 \ac@sansgreek "0395
    \Umathchardef\sfZeta="0    \ac@sansgreek "0396
    \Umathchardef\sfEta="0     \ac@sansgreek "0397
    \Umathchardef\sfTheta="0   \ac@sansgreek "0398
    \Umathchardef\sfIota="0    \ac@sansgreek "0399
    \Umathchardef\sfKappa="0   \ac@sansgreek "039A
    \Umathchardef\sfLambda="0  \ac@sansgreek "039B
    \Umathchardef\sfMu="0      \ac@sansgreek "039C
    \Umathchardef\sfNu="0      \ac@sansgreek "039D
    \Umathchardef\sfXi="0      \ac@sansgreek "039E
    \Umathchardef\sfOmicron="0 \ac@sansgreek "039F
    \Umathchardef\sfPi="0      \ac@sansgreek "03A0
    \Umathchardef\sfRho="0     \ac@sansgreek "03A1
    \Umathchardef\sfSigma="0   \ac@sansgreek "03A3
    \Umathchardef\sfTau="0     \ac@sansgreek "03A4
    \Umathchardef\sfUpsilon="0 \ac@sansgreek "03A5
    \Umathchardef\sfPhi="0     \ac@sansgreek "03A6
    \Umathchardef\sfChi="0     \ac@sansgreek "03A7
    \Umathchardef\sfPsi="0     \ac@sansgreek "03A8
    \Umathchardef\sfOmega="0   \ac@sansgreek "03A9
    %
    % lowercase greek, upright forms selected
    \Umathchardef\sfalpha="0   \ac@sansgreek "03B1 
    \Umathchardef\sfbeta="0    \ac@sansgreek "03B2 
    \Umathchardef\sfgamma="0   \ac@sansgreek "03B3 
    \Umathchardef\sfdelta="0   \ac@sansgreek "03B4 
    \Umathchardef\sfvarepsilon="0 \ac@sansgreek "03B5 % see note below
    \Umathchardef\sfzeta="0    \ac@sansgreek "03B6 
    \Umathchardef\sfeta="0     \ac@sansgreek "03B7 
    \Umathchardef\sftheta="0   \ac@sansgreek "03B8 
    \Umathchardef\sfiota="0    \ac@sansgreek "03B9 
    \Umathchardef\sfkappa="0   \ac@sansgreek "03BA 
    \Umathchardef\sflambda="0  \ac@sansgreek "03BB 
    \Umathchardef\sfmu="0      \ac@sansgreek "03BC 
    \Umathchardef\sfnu="0      \ac@sansgreek "03BD 
    \Umathchardef\sfxi="0      \ac@sansgreek "03BE 
    \Umathchardef\sfomicron="0 \ac@sansgreek "03BF 
    \Umathchardef\sfpi="0      \ac@sansgreek "03C0 
    \Umathchardef\sfrho="0     \ac@sansgreek "03C1 
    \Umathchardef\sfvarsigma="0 \ac@sansgreek "03C2 
    \Umathchardef\sfsigma="0   \ac@sansgreek "03C3 
    \Umathchardef\sftau="0     \ac@sansgreek "03C4 
    \Umathchardef\sfupsilon="0 \ac@sansgreek "03C5 
    \Umathchardef\sfphi="0     \ac@sansgreek "03D5 % note slot transposition with \sfvarphi
    \Umathchardef\sfchi="0     \ac@sansgreek "03C7 
    \Umathchardef\sfpsi="0     \ac@sansgreek "03C8 
    \Umathchardef\sfomega="0   \ac@sansgreek "03C9
    %
    % character variants
    \Umathchardef\sfvartheta="0  \ac@sansgreek "03D1
    \Umathchardef\sfvarphi="0    \ac@sansgreek "03C6 % note slot transposition with \sfphi
    \Umathchardef\sfvarpi="0     \ac@sansgreek "03D6 
    \Umathchardef\sfvarkappa="0  \ac@sansgreek "03F0 
    \Umathchardef\sfvarrho="0    \ac@sansgreek "03F1 
    \Umathchardef\sfvarTheta="0  \ac@sansgreek "03F4
    \Umathchardef\sfepsilon="0   \ac@sansgreek "03F5 % this is the lunate form
    %
    % uppercase bold greek
    \Umathchardef\sfbfAlpha="0   \ac@sansgreek "1D6A8
    \Umathchardef\sfbfBeta="0    \ac@sansgreek "1D6A9
    \Umathchardef\sfbfGamma="0   \ac@sansgreek "1D6AA
    \Umathchardef\sfbfDelta="0   \ac@sansgreek "1D6AB
    \Umathchardef\sfbfEpsilon="0 \ac@sansgreek "1D6AC
    \Umathchardef\sfbfZeta="0    \ac@sansgreek "1D6AD
    \Umathchardef\sfbfEta="0     \ac@sansgreek "1D6AE
    \Umathchardef\sfbfTheta="0   \ac@sansgreek "1D6AF
    \Umathchardef\sfbfIota="0    \ac@sansgreek "1D6B0
    \Umathchardef\sfbfKappa="0   \ac@sansgreek "1D6B1
    \Umathchardef\sfbfLambda="0  \ac@sansgreek "1D6B2
    \Umathchardef\sfbfMu="0      \ac@sansgreek "1D6B3
    \Umathchardef\sfbfNu="0      \ac@sansgreek "1D6B4
    \Umathchardef\sfbfXi="0      \ac@sansgreek "1D6B5
    \Umathchardef\sfbfOmicron="0 \ac@sansgreek "1D6B6
    \Umathchardef\sfbfPi="0      \ac@sansgreek "1D6B7
    \Umathchardef\sfbfRho="0     \ac@sansgreek "1D6B8
    \Umathchardef\sfbfvarTheta="0 \ac@sansgreek "1D6B9
    \Umathchardef\sfbfSigma="0   \ac@sansgreek "1D6BA
    \Umathchardef\sfbfTau="0     \ac@sansgreek "1D6BB
    \Umathchardef\sfbfUpsilon="0 \ac@sansgreek "1D6BC
    \Umathchardef\sfbfPhi="0     \ac@sansgreek "1D6BD
    \Umathchardef\sfbfChi="0     \ac@sansgreek "1D6BE
    \Umathchardef\sfbfPsi="0     \ac@sansgreek "1D6BF
    \Umathchardef\sfbfOmega="0   \ac@sansgreek "1D6C0
	%
    % lowercase bold greek, upright forms selected
    \Umathchardef\sfbfalpha="0   \ac@sansgreek "1D6C2
    \Umathchardef\sfbfbeta="0    \ac@sansgreek "1D6C3
    \Umathchardef\sfbfgamma="0   \ac@sansgreek "1D6C4 
    \Umathchardef\sfbfdelta="0   \ac@sansgreek "1D6C5
    \Umathchardef\sfbfvarepsilon="0 \ac@sansgreek "1D6C6 % see note below
    \Umathchardef\sfbfzeta="0    \ac@sansgreek "1D6C7
    \Umathchardef\sfbfeta="0     \ac@sansgreek "1D6C8
    \Umathchardef\sfbftheta="0   \ac@sansgreek "1D6C9
    \Umathchardef\sfbfiota="0    \ac@sansgreek "1D6CA
    \Umathchardef\sfbfkappa="0   \ac@sansgreek "1D6CB
    \Umathchardef\sfbflambda="0  \ac@sansgreek "1D6CC
    \Umathchardef\sfbfmu="0      \ac@sansgreek "1D6CD
    \Umathchardef\sfbfnu="0      \ac@sansgreek "1D6CE
    \Umathchardef\sfbfxi="0      \ac@sansgreek "1D6CF
    \Umathchardef\sfbfomicron="0 \ac@sansgreek "1D6D0
    \Umathchardef\sfbfpi="0      \ac@sansgreek "1D6D1
    \Umathchardef\sfbfrho="0     \ac@sansgreek "1D6D2
    \Umathchardef\sfbfvarsigma="0 \ac@sansgreek "1D6D3
    \Umathchardef\sfbfsigma="0   \ac@sansgreek "1D6D4
    \Umathchardef\sfbftau="0     \ac@sansgreek "1D6D5
    \Umathchardef\sfbfupsilon="0 \ac@sansgreek "1D6D6
    \Umathchardef\sfbfphi="0     \ac@sansgreek "1D6DF % see notes above
    \Umathchardef\sfbfchi="0     \ac@sansgreek "1D6D8
    \Umathchardef\sfbfpsi="0     \ac@sansgreek "1D6D9
    \Umathchardef\sfbfomega="0   \ac@sansgreek "1D6DA    
	%
    % character variants, bold
    \Umathchardef\sfbfepsilon="0  \ac@sansgreek "1D6DC % this is the lunate form
    \Umathchardef\sfbfvartheta="0 \ac@sansgreek "1D6DD
    \Umathchardef\sfbfvarkappa="0 \ac@sansgreek "1D6DE 
    \Umathchardef\sfbfvarphi="0   \ac@sansgreek "1D6D7 % see notes above
    \Umathchardef\sfbfvarrho="0   \ac@sansgreek "1D6E0
	\Umathchardef\sfbfvarpi="0    \ac@sansgreek "1D6E1
\fi

% and a simple cheat to avoid errors when switching from luatex to pdftex with the template example
\providecommand*\mitDelta{\Delta}


%%%%%%%%%%%%%%%%%  Some adjustments to math layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\jot}{10pt}% <== default is 3pt

%%%%%%%%%%%%%%%%%  Equation and Line Numbering  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ASME puts equation tags in blue
\AddToHook{cmd/tagform@/before}{\begingroup\color{blue}}
\AddToHook{cmd/tagform@/after}{\endgroup}

% To free \eqref from the normal font (e.g., for use in section headings or captions). Revised 2024/07/28
\DeclareRobustCommand{\eqref}[1]{%
    \textup{\hbox{\m@th(\ignorespaces\ref{#1}\unskip\@@italiccorr)}}}
%
% amsmath def:  \DeclareRobustCommand{\eqref}[1]{\textup{\tagform@{\ref{#1}}}}
%				\def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}}
%				\def\maketag@@@#1{\hbox{\m@th\normalfont#1}}

%% Italicize alph part of subequation numbers. Revised 2023/10/20
\patchcmd{\subequations}{\theparentequation\alph{equation}}{\theparentequation\emph{\alph{equation}}}{}{}

%%%%% lineno related %%%%

\ifasmejour@lineno
    \RequirePackage[switch,mathlines]{lineno}%
    \RenewDocumentCommand{\linenumberfont}{}{\normalfont\scriptsize\color{red}}% 
    \AddToHook{begindocument}{\linenumbers}%
    \ifasmejour@balance
        \ClassWarningNoLine{\ClassName}{Package lineno loaded, so final column balancing will be disabled}%
    \fi
	%%% Patch to allow line numbering in AMS math environments.
	%%% This patch is for lineno versions earlier than v5.2 [2023/05/19]. As of mid-2023, the lineno package
	%%% 	has been corrected to account for the AMS math environments. Retaining temporarily for backward compatibility.
	%%% postdisplaypenalty adjusted to avoid extra line number at end, see: https://tex.stackexchange.com/a/461192/ 
	\IfPackageAtLeastTF{lineno}{2023/05/19}{\relax}{
        \NewDocumentCommand{\asmejour@losepostpenalty}{}{\patchcmd{\linenomathWithnumbers}{\advance\postdisplaypenalty\linenopenalty}{}{}{}}
    	%
        \NewDocumentCommand{\asmejour@FixAMSMath}{m}{%
	        \AddToHook{env/#1/begin}{\asmejour@losepostpenalty\linenomath}%
        	\AddToHook{env/#1/end}{\endlinenomath}%
        	\AddToHook{env/#1*/begin}{\asmejour@losepostpenalty\linenomath}%
        	\AddToHook{env/#1*/end}{\endlinenomath}%
        }
    	\NewDocumentCommand{\asmejour@FixAll}{>{\SplitList{;}}m}{\ProcessList{#1}{\asmejour@FixAMSMath}}
    	\asmejour@FixAll{align;alignat;gather;flalign;multline}
	}
%
\else
    \ProvideDocumentEnvironment{linenomath}{}{}{}%
    \ProvideDocumentEnvironment{linenomath*}{}{}{}%
    \ProvideDocumentCommand{\linenumbers}{o}{}%
    \ProvideDocumentCommand{\nolinenumbers}{}{}%
    \ProvideDocumentCommand{\linelabel}{m}{}%
    \ifasmejour@balance          %    balancing by flushend can produce weird errors.
    	\RequirePackage{flushend}%    flushend package is NOT compatible with lineno.
    	\AddToHook{enddocument}{\flushcolsend}% necessary
		\ClassNoteNoLine{\ClassName}{Calling flushend package to balance column height on last page}%
    \fi%
\fi

\providecommand{\@LN@col}[1]{\relax}% avoid errors in the aux file when lineno is dropped
\providecommand{\@LN}[2]{\relax}

%% ASME page proofs seem to align the line number at top of the line, rather than bottom as done here.


%%%%%%%%%%%%%%%%%  Footer Set Up  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%  Footer text names  %%%%%%%%%%%%%%

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
	\ifx R#2 \gdef\@PreprintStringR{#1}\fi
	\ifx L#2 \gdef\@PreprintStringL{#1}\fi
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

\IfFormatAtLeastTF{2025/06/01} % Revised 2026/11/04
	{
		\AssignSocketPlug{build/column/outputbox}{footnotes-floats}
		\patchcmd{\@makefntext}{\parindent 1em}{\parindent 4mm}{}{}
	}{
    	\RequirePackage{footmisc}
    	\RequirePackage{fnpos}
    		\makeFNbottom
    		\makeFNbelow
		\setlength\footnotemargin{4mm}% reduce indentation of footnotes, from footmisc
	}

\setlength{\skip\footins}{12pt plus 2pt minus 1pt}
\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 0.5in height 0.5pt
  \kern 2pt
}

%% Produces an unmarked footnote about the revision date. 
%% This command is invoked by \date as part of \maketitle below.
%% Text can be anything given as the argument to \date{..}.
\NewDocumentCommand{\revfootnote}{m}{\begin{NoHyper}\def\@thefnmark{}\@footnotetext{\hspace{-3pt}#1}\end{NoHyper}}% \gdef -->\def 2021/12/23

%% The above has been offset per style and modified to eliminate missing anchor warning from hyperref that the following \def would cause
%%\def\revfootnote{\gdef\@thefnmark{}\@footnotetext}


\ExplSyntaxOn

%% include a comma for sequential footnotes, revised 2026/11/02
\cs_new_protected:Nn \__asmejour_note_comma: 
	{ 
	  \peek_meaning:NT \footnote { \textsuperscript{ \normalfont, } } 
	}
\IfFormatAtLeastTF{2025/11/01}{	%  Added 2026/11/02
	\hook_gput_code:nnn {cmd/footnote/after}{footnotecomma}{ \exp_after:w \__asmejour_note_comma: } 
	% This hook should be executed last. Otherwise, declare a hook rule.
}{
    \NewCommandCopy \__asmejour_savefootnote: \footnote
    \RenewDocumentCommand \footnote { o +m }
      {
        \tl_if_novalue:nTF {#1}
          { \__asmejour_savefootnote: {#2} }
          { \__asmejour_savefootnote: [{#1}] {#2} }
        \__asmejour_note_comma:
      }
}

%%%%%%%%%  In case tagging is not loaded  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% In case tagging is not loaded, edited 2025/11/07
\cs_if_exist:NF   \tag_struct_begin:n
	{ 
	  \cs_new_protected:Npn \tag_struct_begin:n #1 { \scan_stop: } 
	  \cs_new_protected:Nn  \tag_struct_end:       { \scan_stop: } 
	}
\cs_if_exist:NF   \tag_mc_begin:n
	{ 
	  \cs_new_protected:Npn \tag_mc_begin:n #1 	   { \scan_stop: } 
	  \cs_new_protected:Nn  \tag_mc_end:       	   { \scan_stop: } 
	}
\cs_if_exist:NF   \tagpdfsetup
	{ 
	  \cs_new_protected:Npn \tagpdfsetup #1 	   { \scan_stop: } 
	}
\cs_if_exist:NF   \tagpdfparaOff
	{ 
	  \cs_new_protected:Npn \tagpdfparaOff         { \scan_stop: }
	  \cs_new_protected:Npn \tagpdfparaOn          { \scan_stop: }
	}

%%%%%%%%%  Tags defined by asmejour class  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
\tagpdfsetup { role/user-NS = asmejour }
\tagpdfsetup { role/new-tag = { Author_Block/Div } }
\tagpdfsetup { role/new-tag = { Nomenclature_list/Div            } }
\tagpdfsetup { role/new-tag = { Nomenclature_entry_heading/Span  } }

%%%%%%%%%  CSS styling if the pdf is tagged, for rendering into HTML  %%%%%%%%%%%%%%%%%%%%

\cs_if_exist:NT \tag_if_active:T % not in TeX Live 2021
{
    \tag_if_active:T  % 2025/11/20
      { 
        % Can include some css to style the html-rendered document
        \msg_new:nnn    { \ClassName } { no_css_file } {I~can't~find~the~file~asmejour-style.css.\iow_newline:
        This~optional~file~provides~css~style~if~the~tagged~pdf~is~rendered~into~html.~
        								You~can~ignore~this~warning~if~you~don't~want~styling.}
        \msg_new:nnn    { \ClassName } { css_file_loaded } {The~file~asmejour-style.css~has~been~loaded.}
        \file_if_exist:nTF {asmejour-style.css}
          {
		    \tagpdfsetup {
  			    css-list-add = { asmejour-style.css } % attach this css to the pdf
			    }
			\msg_note:nn { \ClassName } { css_file_loaded } 
		  }{  
			\msg_note:nn { \ClassName } { no_css_file } 
		  }
	  }
}

%%%%%%%%%  Caption Related  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\IfFormatAtLeastTF{2025/11/01}
	{\relax}
	{\RequirePackage{caption}}
%\RequirePackage{subcaption}

\IfPackageLoadedTF{subcaption}{\relax}
{
	% eliminate subcaption package (at the loss of \subref, which has limited utility for us)
    \newcounter{SubFigure}[figure]
    \renewcommand{\theSubFigure}{
    	\number\numexpr\value{figure}+1\relax(\emph{\alph{SubFigure}})
	}
    \NewDocumentCommand\subcaption{m}
    	{
    		\par\rule{0pt}{11pt}
    		{\small
		     \hbox_to_wd:nn { \hsize }
		     {
    		   \hfil
		       (\emph{\alph{SubFigure}})
		       \hfil
		     }
    		}%
    }
    % first  arg is vertical alignment of minipage contents (default is top alignment). [cbt]
    % second arg is width   of minipage (mandatory)
    % third  arg is content of minipage (mandatory) 
    \NewDocumentEnvironment{subfigure}{ O{t} m +b }
    	{
    		\refstepcounter{SubFigure}
    		\begin{minipage}[#1]{#2}
			% in case user has included \subcaption{} inside the minipage;
			\tl_set:Nn \l_tmpa_tl {#3}
			\cs_if_exist:NT \regex_if_match:nVTF % Added to latex: 2025-05-14
				{
				\regex_if_match:nVTF { \c{subcaption} } \l_tmpa_tl 
					{ \msg_error:nn  { \ClassName } { omitsubcaption}  } { \scan_stop: }
				}
			% this won't catch nested braces, e.g. \subcaption{a{b}}
			\regex_replace_all:nnN { \c{subcaption} \s* \{ [^{}]* \} } {} \l_tmpa_tl  
			\l_tmpa_tl  	
		}{
    		\subcaption{}
			\end{minipage}
    		\ignorespacesafterend
    	}
	\msg_new:nnnn { \ClassName } { omitsubcaption } { Do~not~use~\string\subcaption \iow_newline: 
		with~\string\subfigure. } { This~version~of~asmejour.cls~automatically~creates~subcaptions.~In~ 
		ASME~style,~subcaptions~include~only~a~letter~and~no~text,~e.g.~(a),~(b).~But~do~include~\string\label{..}~in~
		your~subfigure. }
}

\IfPackageLoadedTF{caption}{
    \cs_if_exist:NT \tag_if_active:T % not in TeX Live 2021
    {
      \tag_if_active:T % edited 2025/11/18
        {
    	% 	Patch the caption package so that asmejour can validate as pdf 2.0/ua-2. 
		%	Subcaptions are not specifically addressed.
    	%     See github discussion by Ulrike Fischer:
    	% 	  	https://github.com/latex3/tagging-project/issues/720#issuecomment-2386568711
    	%
        \RemoveFromHook{begindocument}[latex-lab-testphase-float]
        \socket_new_plug:nnn{tagsupport/parbox/before}{caption}
          {   
           \tagpdfparaOn %restart para tagging
           \tl_if_empty:NTF\@current@float@struct
            {     
             \tag_struct_begin:n{tag=Caption,firstkid}
            }
            {
             \tag_struct_begin:n{tag=Caption,parent=\@current@float@struct,firstkid}
            }
          }
        \socket_new_plug:nnn{tagsupport/parbox/after}{caption}
          {
           \tag_struct_end:   
          }
        \l@addto@macro\caption@beginex@hook % this is a hook in the caption package
          {
            \tagpdfparaOff %leavevmode in parbox should not start paragraph structure
            \AssignSocketPlug{tagsupport/parbox/before}{caption}
            \AssignSocketPlug{tagsupport/parbox/after}{caption}
          }
    	}
        \AddToHook{begindocument/end}{ % see: https://github.com/latex3/tagging-project/issues/720#issuecomment-2388406105
    		\renewcommand*\caption@anchor[1]{%
            	\ifmeasuring@ \else
               	\caption@raisedlink{\MakeLinkTarget*{#1}}%
            	\fi}%  
    	}
    }
}{\relax}

\IfPackageLoadedTF{caption}{ % using TF form for backward compatibility
    \DeclareCaptionTextFormat{boldmath}{\mathversion{sansbold}#1}
    \DeclareCaptionTextFormat{sansmath}{\mathversion{sans}#1}% ASME actually does not allow math in subcaptions ...
    
    \captionsetup[figure]{labelfont={sf,bf},textfont={sf,bf},textformat=boldmath,labelsep=quad}
    \captionsetup[table]{labelfont={sf,bf},textfont={sf,bf},textformat=boldmath,labelsep=quad,skip=0.5\baselineskip} 
}{\relax}
%% 2021/01/30: ASME only labels subfigures with a sans serif, italic (a), (b),... no caption text or math, no bold face.
\IfPackageLoadedTF{subcaption}{
    \captionsetup[subfigure]{labelfont={sf},textfont={sf},textformat=sansmath,labelformat=simple}% default: =parens
    \renewcommand\thesubfigure{(\emph{\alph{subfigure}})}
    
    \captionsetup[subtable]{labelfont={sf},textfont={sf},textformat=sansmath,labelformat=simple} 
    \renewcommand\thesubtable{(\emph{\alph{subtable}})}
}{\relax}

%%  Use latex-lab hooks/sockets with recent latex version; useful WITHOUT caption package. No support for subcaptions. 2025/11/23
%
\cs_new:Nn \__asmejour_fixcaptions: 
	{
	\setlength\abovecaptionskip{8\p@} % watch for any needed adjustments here
%	\AddToHook{cmd/@makecaption/before}{\bfseries\sffamily\mathversion{sansbold}} % This styles the entire caption.
		\NewSocketPlug{caption/label}{plug-A}    % strictly addresses the caption label, not caption text.
			{{\bfseries\sffamily  ##1\quad}}     % \MakeUppercase{#1} is a bad actor here, so instead cap \figurename below
		\AssignSocketPlug{caption/label}{plug-A}
		\AddToHook{cmd/@makecaption/before}{\bfseries\sffamily\mathversion{sansbold}} % and this does the rest.
	\AddToHook{cmd/@makecaption/after}
		{
	        \str_if_eq:VnT \@captype {table} { \vskip 0.5\baselineskip}
		}
	}

\IfFormatAtLeastTF{2025/11/01}
	{
	\IfPackageLoadedTF{caption}
    	{
    	\tag_if_active:F { \__asmejour_fixcaptions: }
    	}{  
		\__asmejour_fixcaptions: 
    	}
	}{\relax}
	
\ExplSyntaxOff

% Accommodate babel
\addto{\captionsenglish}{%
  \renewcommand{\figurename}{Fig.} % per ASME style (fixed 25 May 2025)
}
\addto{\captionsUSenglish}{%
  \renewcommand{\figurename}{Fig.} % per ASME style (fixed 19 November 2025)
}


%%%%%%%%%%%%  Section Headings  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Revised 2025/03/30, removed titlesec package
% This code should eventually migrate to LaTeX's new template mechanism

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {14pt \@plus 3pt \@minus 2pt}%
                                   {3pt \@plus 2pt \@minus 1pt}%
                                   {\mathversion{bold}\bfseries\large\raggedright}}
\renewcommand\subsection{\@startsection {subsection}{2}{3.5mm}%
                                   {12pt \@plus 3pt \@minus 2pt}%
                                   {-0.5em}%
                                   {\mathversion{bold}\normalsize\bfseries\raggedright}}
\renewcommand\subsubsection{\@startsection {subsubsection}{3}{3.5mm}%
                                   {12pt \@plus 3pt \@minus 2pt}%
                                   {-0.5em}%
                                   {\itshape\normalsize}}
\renewcommand{\thesubsection}{\@arabic\c@section.\@arabic\c@subsection}

% Ensure that unnumbered sections have bookmarks, revised 2026/11/04
%    ...would prefer a more streamlined approach, but there's no simple hook for #8 in \section.
\NewCommandCopy\asmejour@section\section
\RenewDocumentCommand{\section}{s o m}{%
  \IfBooleanTF{#1} 
    {\asmejour@section*{#3} % starred version
     \phantomsection
     \IfNoValueTF{#2} 
        {\addcontentsline{toc}{section}{#3}} % no optional arg
        {\addcontentsline{toc}{section}{#2}}%
     \nobreak
    }% no break point at the following \parskip
    {\IfNoValueTF{#2}
        {\asmejour@section{#3}} % no optional arg
        {\asmejour@section[#2]{#3}}%
    }%
}

%% Period after run-in titles, unless the title already ends in . ? ! :
\protected\def\asmejour@addperiod{\ifhmode\ifnum\spacefactor>\@m\else.\fi\fi}

% Insert period at end of subsection and subsubsection titles, revised 2026/11/04
% Short title has no period, so bookmarks
\NewCommandCopy\asmejour@subsection\subsection
\RenewDocumentCommand{\subsection}{s o m}{%
  \IfBooleanTF{#1}
    {\asmejour@subsection*{#3\asmejour@addperiod}}%
    {\IfNoValueTF{#2}
        {\asmejour@subsection[#3]{#3\asmejour@addperiod}}%
        {\asmejour@subsection[#2]{#3\asmejour@addperiod}}
    }%
}
\NewCommandCopy\asmejour@subsubsection\subsubsection
\RenewDocumentCommand{\subsubsection}{s o m}{%
  \IfBooleanTF{#1}
    {\asmejour@subsubsection*{#3\asmejour@addperiod}}%
    {\IfNoValueTF{#2}
        {\asmejour@subsubsection[#3]{#3\asmejour@addperiod}}%
        {\asmejour@subsubsection[#2]{#3\asmejour@addperiod}}
    }%
}

% these heading levels are not used in ASME journals
\RenewCommandCopy\paragraph\subsubsection
\RenewCommandCopy\subparagraph\subsubsection


\ExplSyntaxOn
%% TeX reads \hangindent at \par
\cs_new_protected:Npn \__asmejour_zero_hang: { \dim_zero:N \hangindent }

\cs_new_protected:Npn \__asmejour_appendix_hang:
  {
    % untagged
    \cs_if_exist:NF \__asmejour_sav_hangfrom:n
      { \cs_gset_eq:NN \__asmejour_sav_hangfrom:n \@hangfrom }
    \cs_gset_protected:Npn \@hangfrom ##1
      { \__asmejour_sav_hangfrom:n {##1} \__asmejour_zero_hang: }
    % tagged: wraps a tagging-module internal; drop if the template handles it
    \cs_if_exist:NT \__tag_set_title_hang:nNnn
      {
        \cs_if_exist:NF \__asmejour_sav_tag_set_title_hang:nNnn
          { \cs_gset_eq:NN \__asmejour_sav_tag_set_title_hang:nNnn \__tag_set_title_hang:nNnn }
        \cs_gset_protected:Npn \__tag_set_title_hang:nNnn ##1 ##2 ##3 ##4
          {
            \__asmejour_sav_tag_set_title_hang:nNnn {##1} ##2 {##3} {##4}
            \__asmejour_zero_hang:
          }
      }
  }

%% Expandable: \@sect uses \@seccntformat inside \protected@edef
\cs_new:Npn \__asmejour_app_seccntformat:n #1
  {
    \str_if_eq:nnTF {#1} { section }
      { \appendixname \nobreakspace \use:c { the#1 } : \space }
      { \use:c { the#1 } . \hspace { 0.5em } }
  }

\IfFormatAtLeastTF{2026/11/01}
  {
    \cs_new_protected:Npn \__asmejour_appendix_headings:
      {
        \AddToHook{cmd/section/before}{
           \EditInstance{heading}{section-@startsection}{
               text = \appendixname,
               number-format = {##1:},   % gives better placement of colon in html
           }
           \EditInstance{headformat}{section-@startsection}{
               separator-b = \nobreakspace,
               order-hang  = {},         % kill hanging indentation
               order = {text, separator-a, number, punct, separator-b, title}
           }
        }
      }
  }
  {
    \cs_new_protected:Npn \__asmejour_appendix_headings: { }  % older formats: \@seccntformat does the work
  }

\bool_new:N \g__asmejour_appendix_bool

%% NB: hyperref must load AFTER this definition
\renewcommand{\appendix}{
    \par
    \__asmejour_appendix_hang:
    \setcounter{section}{0}
    \counterwithin*{equation}{section}
    \cs_gset:Npn \thesection    { \@Alph \c@section }
    \cs_gset:Npn \thesubsection { \@Alph \c@section . \@arabic \c@subsection }
    \cs_gset:Npn \theequation   { \@Alph \c@section \@arabic \c@equation }
    \cs_gset_eq:NN \@seccntformat \__asmejour_app_seccntformat:n
    \bool_if:NF \g__asmejour_appendix_bool  % add hook only once
      {
        \bool_gset_true:N \g__asmejour_appendix_bool
        \__asmejour_appendix_headings:
      }
}
\ExplSyntaxOff

%  natbib's \bibsection controls section heading for References. 
%		If you wish to customize the title of the reference list put \renewcommand{\refname}{Other Title} 
%		into the .tex file, after the preamble (before the other bib commands near the end)


%%%%%%%%%%%%%%%%%%%%  List environments  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Revised 2025/03/30, removed enumitem
% No extra space between list items (cf. size9.clo), revised to expl3 2026/11/04

\ExplSyntaxOn
\IfFormatAtLeastTF{2026/11/01}
    {
        \setlist[enumerate,1]
            {
              label = (\arabic*),
              item-vspace = 0pt,
              para-vspace = 0pt,
              leftmargin = 2em,
            }
    }{    
        \renewcommand\labelenumi{(\theenumi)}	% cf. article.cls
        \setlength\leftmargini{2em}				% reset here b/c @twocolumn not yet invoked
        \cs_new_protected:Npn \__asmejour_tight_listi:
            {
              \skip_zero:N \parsep
              \skip_zero:N \itemsep
            }
        % \normalsize does \let\@listi\@listI, so patch \@listI itself
        \tl_gput_right:Nn \@listI { \__asmejour_tight_listi: }
        \cs_gset_eq:NN \@listi \@listI
        
        % \small and \footnotesize redefine \@listi locally, so append locally afterward
        \hook_gput_code:nnn { cmd/small/after } { asmejour }
             { \tl_put_right:Nn \@listi { \__asmejour_tight_listi: } }
        \hook_gput_code:nnn { cmd/footnotesize/after } { asmejour }
             { \tl_put_right:Nn \@listi { \__asmejour_tight_listi: } }
    }
\ExplSyntaxOff


%%%%%%%%%%%%%%%%%  Hyperref  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifasmejour@pdftex
    %%% to assist with unicode glyph mapping, following M. Sharpe's recommendation in the newtx documentation. 
    %%% as of 2024/07/28, these are still necessary for unicode mapping with \DocumentMetadata{pdfstandard=A-3u}.
    \InputIfFileExists{glyphtounicode-cmr.tex}{}{} 	%% additional mappings
    \InputIfFileExists{glyphtounicode-ntx.tex}{}{} 	%% additional mappings
\fi

%%%

\RequirePackage[psdextra]{hyperref} % provide most hyperref options via \hypersetup, but also per documentation
									% set [psdextra] here (for additional math support in bookmarks) 2021/12/23
\hypersetup{%
	pdfborder={0 0 0},% should be no border if colorlinks=true .. this is a belt-and-suspenders approach.
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
\renewcommand{\doitext}{doi:~} % change from default, {doi:}, to this per ASME specification

\providecommand*{\toclevel@subfigure}{1}%  <== address unknown bookmark level of subfigure (w/subcaption package), 2021/12/24
\providecommand\hrefurl{\href}% <== in case no \DocumentMetadata{..}
%\providecommand\hrefurl[2]{\href{#1}{#2}}% <== in case no \DocumentMetadata{..}


%%%%%% Adjustments to accommodate hyperref bookmarks %%%%%%%%%%%%%%%%%%%%%%

%%%     These changes reduce the need for alternate pdfstrings in section headings.
%%%     Recent development of \pdfstring has removed all robust commands from bookmarks (2021/12/23).
%%%     By mid-2024, no errors are thrown; however, these commands still serve to suppress warnings.
%%%	    Math shift by $..$ still creates a warning, but I am leaving that in place. To avoid, use \( .. \) instead.

\pdfstringdefDisableCommands{%
    \let\bm\@firstofone         % keep argument of \bm, braced or not
    \def\({\relax}%
    \def\){\relax}%
    \def\cite#1#{\@gobble}%     % remove citations, with [options] and {keys}
    \def\eqref#1{(\ref*{#1})}%  % keep tag color out of bookmarks
    \def\footnote#1#{\@gobble}% % remove footnotes, both [num] and {text}
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
\newlength\asmejour@widest
\newlength\nomenwidth
\newlength\savitemsep

\NewDocumentCommand{\entry}{m m}{%
	\ifblank{#2}{%
		\ClassError{\ClassName}{The command \protect\entry should have two arguments. For subheadings, use \protect\EntryHeading}{It appears that you gave only one argument to \protect\entry.  You must include a second argument.}
	}{%
		\item[\hfill{#1${} = {}$}]#2%
		\@itempenalty=-\@lowpenalty%
		\setlength\itemsep\savitemsep%
		\settowidth\asmejour@widest{#1${} = {}$}%
		\ifdim\asmejour@widest>\widest \global\widest=\asmejour@widest\fi%
    }%
}
\ExplSyntaxOn
%% A separate command command for nomenclature subheadings
\NewDocumentCommand\EntryHeading{m}{%
             \itemsep12\p@ plus 4\p@ minus 4\p@
             \goodbreak\item[
                \tag_struct_begin:n { tag = Nomenclature_entry_heading }
             	  \tag_struct_begin:n { tag = Strong }
				    \tag_mc_begin:n  { tag = Strong }
				      {\bfseries#1}
				    \tag_mc_end:
				  \tag_struct_end:
                \tag_struct_end:
				\hfill
			 ]\mbox{}\itemsep3\p@ plus 1\p@ minus 1\p@\@itempenalty=10000% add \mbox for tagged pdf, 2023/10/20
}

\newlength\savwidest
\NewDocumentEnvironment{nomenclature}{O{\nomenwidth} O{\nomname} }{
        \setlength{\widest}{0em}
        \section*{#2}
        \raggedright
        \tag_struct_begin:n { tag = Nomenclature_list }
        \begin{list}{}{%
             \setlength{\topsep}{0pt}
             \setlength{\partopsep}{0pt}
             \setlength{\itemsep}{0pt}
             \setlength{\parsep}{\itemsep}
             \setlength{\labelsep}{0em}
             \tl_if_blank:nTF {#1}  % [] or no option 
                  { \setlength{\labelwidth}{\nomenwidth} }
                  { \setlength{\labelwidth}{#1} }
             \setlength{\leftmargin}{\labelwidth}
             \addtolength{\leftmargin}{\labelsep}
			 \setlength\savitemsep\itemsep % EntryHeading changes \itemsep from 0pt
         }%
   }{%
   \if@filesw
       \immediate\write\@auxout{\global\savwidest=\the\widest}% after the preamble, the aux file will set this value...
   \fi
   \tl_if_blank:nT {#1}
    {
      \dim_compare:nNnF { \widest } = { \savwidest }
        { \ClassWarningNoLine{\ClassName}{Nomenclature~label~width~changed.~Rerun~LaTeX} }
    }
   \end{list}
   \tag_struct_end:
   \ignorespacesafterend
} 
\ExplSyntaxOff

\AddToHook{begindocument}{
	\setlength{\nomenwidth}{\savwidest} % ...and this will set nomenwidth to the saved widest label width
}

      
%%%%%%%%%%%%%%%%  List of figures and list of tables  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ASME requires these lists for production. 
\ifasmejour@nolists
	\ClassNoteNoLine{\ClassName}{Omitting lists of figures and tables}%
\else
    \AddToHook{enddocument}{%
		\twocolumn[%
			\listoffigures
			\listoftables
		]%
	}%
\fi


%%%%%%%%%%%%%%%%  Author/Title/Abstract block  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% converted to expl3 2024/08/19; revised 2026/11/03
\ExplSyntaxOn

\coffin_new:N \g__asmejour_authorblock_coffin
\coffin_new:N \g__asmejour_ruleblock_coffin
\coffin_new:N \g__asmejour_abstract_coffin
\coffin_new:N \g__asmejour_title_coffin
\coffin_new:N \g__asmejour_firstrowauthorblock_coffin

\dim_const:Nn \c__asmejour_coffinsep_dim   { 4.5mm  } % vert space between author coffins
\dim_const:Nn \c__asmejour_coffinspace_dim { 6.75mm } % vert space between title/abstract coffins

\cs_new_protected:Nn \__asmejour_internallinenumbers:n 
{
       \legacy_if:nT { asmejour@lineno } {
          \tl_if_blank:nF {#1} { \rightlinenumbers* }
          \cs_set:Npn \thelinenumber { \@roman\c@linenumber }
		  \internallinenumbers
	   }
}

%% This command is used in the .tex file
\NewDocumentCommand\SetAuthorBlock{m m}{
	\__asmejour_gset_authorblock:nn { #1 } { #2 }
}
\int_gzero_new:N  \g__asmejour_authorno_int
\seq_new:N  \g__asmejour_author_seq
\msg_new:nnn { \ClassName } { missingauthor } { Missing~author~name,~check~\SetAuthorBlock~command[s]! }


%% Attach each successive authorblock to the list, which is saved in \g__asmejour_firstrowauthorblock_coffin
\cs_new_protected:Nn \__asmejour_gset_authorblock:nn {
   \int_gincr:N  \g__asmejour_authorno_int
   \tl_if_blank:nT {#1} { 
		\msg_warning:nn { \ClassName } { missingauthor } 
		}
   \seq_gput_right:Nn \g__asmejour_author_seq {#1}
   \str_set:Ne \l_tmpa_str { Author~\int_use:N \g__asmejour_authorno_int }
   \tag_struct_begin:n { tag=Div, title-o={ \l_tmpa_str } }
   \tag_struct_begin:n { tag=Author_Block, title-o={ \l_tmpa_str } }   
   \vcoffin_gset:Nnn   \g__asmejour_authorblock_coffin { 48.2mm } 
	{
	   \__asmejour_internallinenumbers:n {}
	   \raggedleft\sffamily
	   \leavevmode
	   \tag_struct_begin:n { tag = Strong }
	   \tag_mc_begin:n { tag = Strong }
	   {\Condhuge\CondSansBold \tl_trim_spaces:n { #1 } }
	   \tag_mc_end:
	   \tag_struct_end:
	   \\ 
	   \CondSans#2
	}
	\tag_struct_end:
	\tag_struct_end:
	\coffin_gjoin:NnnNnnnn 
	   \g__asmejour_firstrowauthorblock_coffin { hc } { b } 
       \g__asmejour_authorblock_coffin { hc } { t } 
	   { 0pt } 
       { \int_compare:nNnTF { \g__asmejour_authorno_int } = { 1 } { 0pt } { -\c__asmejour_coffinsep_dim } }
}
%% Standard coffin poles are (l hc r t T vc b B). See xcoffins documentation. 

% build comma-separated list of author names
\tl_new:N  \g_asmejour_authors_tl
\cs_new_protected:Nn \__asmejour_gset_concataut:
{
    \seq_clear:N \l_tmpa_seq
    \seq_map_inline:Nn \g__asmejour_author_seq
      {
        \tl_set:Nn \l_tmpa_tl {##1}
        \regex_replace_all:nnN { \cA\~ } { \  } \l_tmpa_tl          % replace ~ by space in author list
        \tl_replace_all:Nnn \l_tmpa_tl { \affil } { \use_none:n }   % include in case of carry-over from asmeconf
        \tl_remove_all:Nn   \l_tmpa_tl { \JointFirstAuthor }        % include in case of carry-over from asmeconf
        \tl_remove_all:Nn   \l_tmpa_tl { \CorrespondingAuthor }     % takes no argument in asmejour, unlike asmeconf
        \tl_trim_spaces:N   \l_tmpa_tl
        \seq_put_right:NV   \l_tmpa_seq \l_tmpa_tl
      }
    \tl_gset:Ne \g_asmejour_authors_tl { \seq_use:Nn \l_tmpa_seq { ,~ } }
    %\iow_term:e { Authors:~ \tl_to_str:N \g_asmejour_authors_tl } % diagnostic only
}

\cs_new_protected:Nn \__asmejour_gset_title:n 
{
	\cs_gset:Npn \@title {#1} % 2024/07/30 (make this standard command available)
	\tag_struct_begin:n { tag=Title, title=Title }
	\vcoffin_gset:Nnn \g__asmejour_title_coffin { 114mm } 
	  {
		\__asmejour_internallinenumbers:n { R }
		\skip_vertical:n { 0.5mm } % <== ASME doesn't align bar and text
		\noindent\CondHuge\CondSansBold\raggedright
		#1
		\par
	}
	\tag_struct_end:
}

%% \keywords command is used in the .tex file
\tl_new:N \g__asmejour_keywords_tl
\NewDocumentCommand{\keywords}{m}{  % removed g option, 2021/01/30
	\tl_gset:Nn \g__asmejour_keywords_tl { #1 } 
}

\cs_new_protected:Nn \__asmejour_gset_abstract:n
{
  \tag_struct_begin:n { tag=Div, title=Abstract }
  \vcoffin_gset:Nnn \g__asmejour_abstract_coffin { 114mm }
    {
	   \__asmejour_internallinenumbers:n { R }
       \noindent
       \emph{ #1 }
       \tl_if_empty:NF \g__asmejour_keywords_tl
         {
            \par \skip_vertical:N \baselineskip
            \noindent
            \tag_mc_begin:n { tag = Span } 
            \emph{ \keywordname : }~\emph{ \g__asmejour_keywords_tl }
            \tag_mc_end:
         }
       \par 
       \skip_vertical:n { 4mm } % <== at bottom of abstract to extend rule
    }
  \tag_struct_end:
}

%% Now assemble and typeset the author, title, and abstract coffins
\cs_new_protected:Nn 	\__asmejour_constructauthorblock: {
	\coffin_gjoin:NnnNnnnn 
	    \g__asmejour_title_coffin { l } { b } 
		\g__asmejour_abstract_coffin { l } {t } 
		{ 0pt } { - \c__asmejour_coffinspace_dim } 
    \dim_set:Nn \l_tmpa_dim % title + abstract
    	{ \coffin_ht:N \g__asmejour_title_coffin + \coffin_dp:N \g__asmejour_title_coffin }
	\dim_set:Nn \l_tmpb_dim
	    { \coffin_ht:N \g__asmejour_firstrowauthorblock_coffin
	              + \coffin_dp:N \g__asmejour_firstrowauthorblock_coffin }     
	\dim_compare:nTF { \l_tmpa_dim  >  \l_tmpb_dim }
        { \dim_set_eq:NN \l_tmpb_dim \l_tmpa_dim }
        { \dim_add:Nn    \l_tmpb_dim { 7.0mm } }
    \hcoffin_gset:Nn \g__asmejour_ruleblock_coffin 
		{ 
		  \color{\asmejour@barcolor}\rule{2.1mm}{ \l_tmpb_dim } 
		}
	\coffin_gjoin:NnnNnnnn 
	    \g__asmejour_firstrowauthorblock_coffin { vc } { r } 
		\g__asmejour_ruleblock_coffin {vc } { l } 
		{ \c__asmejour_coffinsep_dim } { 0pt } 
	\coffin_gjoin:NnnNnnnn 
	    \g__asmejour_firstrowauthorblock_coffin { vc } { r } 
		\g__asmejour_title_coffin {vc } { l } 
		{ \c__asmejour_coffinsep_dim } { 0pt } 
    \coffin_typeset:Nnnnn  \g__asmejour_firstrowauthorblock_coffin { l }{ t }{ 0pt }{ 0pt }
    \__asmejour_gset_concataut:
    \cs_gset:Npn \@author { \g_asmejour_authors_tl }
}

\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Corresponding author gets footnote #1 and subsequent notes are 2, 3, ....
%% ASME apparently does not recognize joint first authors...so I have not coded that functionality

%% Flag for corresponding author (only one expected, although this code supports more than one)
\newif\ifasmejour@CA

%% ASME prefers email to be in address block, not CA footnote; removed option 2021/01/30
\NewDocumentCommand{\CorrespondingAuthor}{}{%
	\global\asmejour@CAtrue%
	\def\@makefnmark{\hbox{\@textsuperscript{\sffamily\@thefnmark}}}%
	\footnotemark%
	\addtocounter{footnote}{-1}% in case of more than one CA
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% make the title block

\ExplSyntaxOn

%% space between title block and start of two-column text
\skip_new:N   \g__asmejour_AbstractSep_skip
\skip_gset:Nn \g__asmejour_AbstractSep_skip { 12.5mm plus 2mm minus 2mm }

\NewDocumentCommand\AbstractSep{m}{
	\skip_gset:Nn \g__asmejour_AbstractSep_skip {#1}
}

\bool_new:N \g__asmejour_title_made_bool

\cs_new_protected:Npn \__asmejour_maketitle:  
{
    \ifasmejour@singlecolumn % added 2024/07/20
    	\__asmejour_constructauthorblock: 
      	\skip_vertical:N \g__asmejour_AbstractSep_skip 
    \else	
        \twocolumn[
    	\__asmejour_constructauthorblock:
    	\skip_vertical:N \g__asmejour_AbstractSep_skip
        ]
    \fi
    \thispagestyle{title}% after twocolumn's \clearpage
    \bool_gset_true:N \g__asmejour_title_made_bool
    \ifasmejour@CA 
    	\addtocounter{footnote}{1}
    	\footnotetext{\CAwords}
    \fi
    \DateFootnote
    \ifasmejour@contractor\revfootnote{ The~United~States~Government~retains,~and~by~accepting~the~article~for~
         publication,~the~publisher~acknowledges~that~the~United~States~Government~retains,~a~non-exclusive,~
         paid-up,~irrevocable,~worldwide~license~to~publish~or~reproduce~the~published~form~of~this~work,~
         or~allow~others~to~do~so,~for~United~States~Government~purposes. }%
    \fi
    \ifasmejour@govt\revfootnote{ This~material~is~declared~a~work~of~the~U.~S.~Government~and~is~not~subject~to~
         copyright~protection~in~the~United~States.~Approved~for~public~release;~distribution~is~unlimited. }%
    \fi
    \ifasmejour@govtsome\revfootnote{ This~work~was~authored~in~part~by~a~U.~S.~Government~employee~in~the~scope~of~
         his/her~employment.~ASME~disclaims~all~interest~in~the~U.~S.~Government's~contribution. }%
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Redefine titling commands from standard LaTeX article class

\RenewDocumentCommand{\maketitle}{}{ \__asmejour_maketitle: }
\RenewDocumentCommand{\title}{m}{ \__asmejour_gset_title:n {#1} }
\RenewDocumentCommand{\author}{m}{
	\msg_error:nn { \ClassName }{ authornotused }
}
\msg_new:nnnn { \ClassName } { authornotused }{ In~the~asmejour~class,\\ the~\iow_char:N\\author~command~is~not~used.\\ 
      Use~\iow_char:N\\SetAuthorBlock{Name}{Address}~for~each~author~instead. } 
    { The~\iow_char:N\\author~command~is~not~used~in~the~asmejour~class.~Use~\iow_char:N
      \\SetAuthorBlock{Name}{Address}~as~described~in~the~documentation. }

\RenewDocumentEnvironment{abstract}{+b}
	{
%	  \gdef\tmp{ \__asmejour_gset_abstract:n {#1} }\aftergroup\tmp	  
%       Thanks to David Carlisle for the suggestion of \gdef\tmp{..
%       2026/11/03: \tmp is no longer needed, code has evolved
	  \__asmejour_gset_abstract:n {#1}
      \bool_if:NT \g__asmejour_title_made_bool
          { \msg_error:nn { \ClassName } { abstractafter } }
	}{
	  \ignorespacesafterend
	} 
\msg_new:nnn { \ClassName } { abstractafter }
  { The~abstract~environment~must~come~before~\iow_char:N\\maketitle;~it~will~not~be~printed. }

%% Put date as an unnumbered footnote at bottom of first column
%% If \date command is not used, default to \DateFootnote
\bool_new:N 	  \g__asmejour_date_bool
\bool_gset_true:N \g__asmejour_date_bool
\tl_new:N   \g__asmejour_date_tl 
\tl_gset:Nn \g__asmejour_date_tl { \today }
\cs_new_protected:Npn \DateFootnote
    { 
	 \bool_if:NT \g__asmejour_date_bool { \revfootnote{ \g__asmejour_date_tl } }
    }
\RenewDocumentCommand{\date}{m}
{
	\tl_if_blank:nTF {#1}
		{ \bool_gset_false:N \g__asmejour_date_bool }
    	{ 
	      \tl_gset:Nn \g__asmejour_date_tl { #1 } 
	      \bool_gset_true:N \g__asmejour_date_bool
	    }
}

% \thanks is inconsistent with this format
\RenewDocumentCommand{\thanks}{m}{ \msg_warning:nn { \ClassName } { thanksnotused } }
\msg_new:nnn { \ClassName } { thanksnotused }
  { The~\iow_char:N\\thanks~command~is~disabled~in~this~class;~its~text~was~discarded. }

%\debug_off:n {all}
\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
%%
%% End of file `asmejour.cls'.

