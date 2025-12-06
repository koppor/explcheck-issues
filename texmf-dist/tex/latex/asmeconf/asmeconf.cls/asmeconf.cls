% !TEX encoding = UTF-8 Unicode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the asmeconf LaTeX class for formatting conference papers according to 
%%  ASME conference requirements as represented on ASME's conference web pages in 2025.
%%
%%  This file's version and date:
	\def\versionno{1.45}
	\def\versiondate{2025/11/10\space}
%%
%%  Author: John H. Lienhard, V
%%          Department of Mechanical Engineering
%%          Massachusetts Institute of Technology
%%          Cambridge, MA 02139-4307 USA
%%
%%  This LaTeX template was designed to approach the following aims:
%%
%%          1. Match ASME's current layout and font specifications
%%          2. With asmeconf.bst, match ASME's reference formats including DOI & URL (replaces asmems4.bst)
%%          3. Provide hyperref compatibility for hyperlinks, pdf bookmarks, and metadata
%%          4. Set author names in either the traditional grid or the more recent inline style
%%          5. Support citations, footnotes, and bold face, sans serif math in section headings
%%			6. Provide line numbers for editing and review
%%			7. Support balancing length of columns on last page
%%			8. Provide copyright footer for federal employees and contractors
%%			9. Support archival PDF/A standards
%%		   10. Enable various math features from the newtx or unicode-math/fontspec packages
%%		   11. Support inclusion of passages in languages other than English
%%
%%  This class is compatible with either pdfLaTeX or LuaLaTeX. Fontspec and unicode-math will load automatically 
%%  with LuaLaTeX. To use LuaLaTeX without fontspec and unicode-math, call the [nofontspec] option.
%%
%%	Use an up-to-date LaTeX distribution: for pdfLaTeX, TeX Live 2020 or later; for LuaLaTeX, TeX Live 2021 or later.
%%  A complete LaTeX installation is also recommended: asmeconf loads ~25 packages in addition to the LaTeX format.
%%	All packages required by the class are in TeX Live and CTAN (https://ctan.org/). 
%%
%%  Commands for entering conference headers and author names are specific to this class.
%%  See asmeconf-template.tex for details.
%%
%%  The class defines abstract (with keywords), abstract* (no keywords), and nomenclature environments. 
%%  The latter has an optional argument to control the space between the entries and the definitions.
%%
% =========================================================
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
%% not limited to the warranties of merchantability, fitness for a particular purpose, and noninfringement. 
%% In no event shall the authors or copyright holders be liable for any claim, damages, or other liability, 
%% whether in an action of contract, tort or otherwise, arising from, out of, or in connection with the 
%% software or the use or other dealings in the software.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{asmeconf}[\versiondate ASME Conference Paper LaTeX Template (JHL)]

\LoadClass[twoside,10pt]{article}% twocolumn is initiated in \MakeTitle
% Even/odd page layout is not used in ASME's specs, although the papers are printed in two-sided format.

\RequirePackage{etoolbox}% using \patchcmd in section, nocasechange, & lineno code and \pretocmd in appendix code

\newif\ifpdftex % redeclaration by other packages will be ignored
\newif\ifPDFtex % *deprecated* user macro
\ExplSyntaxOn
	\str_const:Nn \ClassName {asmeconf}
	\prop_put:Nnn \g_msg_module_type_prop { \ClassName } { Class }
	\sys_if_engine_pdftex:T  
		{ 
		  \pdftextrue 
		  \PDFtextrue
	   	  \msg_new:nnn { \ClassName } { notagpdftex } { Run~lualatex,~not~pdftex,\iow_newline: 
		  												when~tagging~is~used~in~\DocumentMetadata } 
		  \cs_if_exist:NT \tag_if_active:T % not in TeX Live 2021
			{
		     \tag_if_active:T { \msg_error:nn  { \ClassName } { notagpdftex } }
			}
		}
\ExplSyntaxOff


%%%%%%%%%%%%%  Compatibility codes for older distributions  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% these will be dropped as time goes by ... 

\providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}%  compare version to date; \If... added to latex 2020/10/01
\providecommand\IfPackageAtLeastTF{\@ifpackagelater}%     compare version to date; \If... added to latex 2020/10/01
\providecommand\IfPackageLoadedTF{\@ifpackageloaded}%     \If...added to latex 2021/11/15
\providecommand\ClassNoteNoLine[2]{\typeout{^^JClass Note #1: #2.^^J}}%  log & terminal note... added to latex 2021/11/15

\IfFormatAtLeastTF{2022/06/01}{\relax}{%
	\ClassError{\ClassName}{Your LaTeX format is dated \fmtversion.  Formats dated 2022-06-01 or later are very strongly recommended for the asmeconf class. Older formats and packages may generate errors or fail entirely!!}{UPDATE your LaTeX distribution. TeX Live is available for download at no charge: \string https://www.tug.org/texlive/.  You can try to click past the errors for now...}%
}

% If latex release is pre 2022/06, need to load textcase package
\ifx\AddToNoCaseChangeList\@undefined % updated 2022/07/03, see https://github.com/John02139/asmeconf/issues/5 
	\RequirePackage{textcase} %% Allows uppercase titles and captions without errors from math and citations
	\typeout{asmeconf is loading textcase package.}
\else
	\let\MakeTextUppercase\MakeUppercase% keep using \MakeTextUppercase for backward compatibility
\fi

% Allow pre 2021/11/15 formats to see the graphicx alt key without causing an error
\IfFormatAtLeastTF{2021/11/15}{
	\relax % keep the T option for backward compatibility
}{ 
	\AtBeginDocument{
		\IfPackageLoadedTF{graphicx}{\define@key{Gin}{alt}{}}{\relax}
	}
}

% Enable pre-2020/10 formats to access essential macros later moved into LaTeX kernel
\ifdefined\NewDocumentCommand\else
  \RequirePackage{xparse}% need at least 2018/04, but other things also break at that age.
\fi

% fnpos is loaded if footmisc package is older than 2022/02/05 
% kvoptions is loaded if latex is older than 2022/11/01


%%% fallbacks for tagging commands, in case tagpdf is not loaded

\ExplSyntaxOn
%% In case tagging is not loaded, edited 2025/11/07.
\cs_if_exist:NF   \tag_struct_begin:n
	{ 
	  \cs_new:Npn \tag_struct_begin:n #1 { \scan_stop: } 
	  \cs_new:Nn  \tag_struct_end:       { \scan_stop: } 
	}
\cs_if_exist:NF   \tag_mc_begin:n
	{ 
	  \cs_new:Npn \tag_mc_begin:n #1 	{ \scan_stop: } 
	  \cs_new:Nn  \tag_mc_end:       	{ \scan_stop: } 
	}
\cs_if_exist:NF   \tagpdfsetup
	{ 
	  \cs_new:Npn \tagpdfsetup	  #1 	{ \scan_stop: } 
	}
\cs_if_exist:NF   \tagpdfparaOff
	{ 
	  \cs_new:Npn \tagpdfparaOff         { \scan_stop: }
	  \cs_new:Npn \tagpdfparaOn          { \scan_stop: }
	}
\ExplSyntaxOff	

%%%%%%%%%%%%%  Options for the class  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Some helper code first

%% Related to loading other alphabets for Cyrillic, Greek, Japanese, and Vietnamese text
\newif\ifac@cyrillic
\newif\ifac@greek
\newif\ifac@japanese
\newif\ifac@vietnamese
\newif\ifac@mainset

\providecommand\ac@TtwoA{}
\providecommand\ac@LGR{}
\providecommand\ac@Tfive{}

\ExplSyntaxOn
\str_new:N   \g__asmeconf_main_str
\str_gset:Nn \g__asmeconf_main_str {english}

\msg_new:nnn  { \ClassName } { mainlang }
	{ Selecting~#1~as~the~primary~language }
\msg_new:nnn  { \ClassName } { mathalfa }    
	{ Former~mathalfa~option~has~been~dropped;~instead,~load~mathalpha~package~in~your~preamble }
\msg_new:nnnn { \ClassName } { nogreekmain } 
	{ To~set~Greek~as~the~main~language,~you~should~use~luaLaTeX~not~pdfTeX.~
	  You~will~need~the~NotoSerif~and~NotoSans~fonts }
	{ Under~pdfTeX,~asmeconf~is~not~compatible~with~Greek~as~the~main~font,~as~you~will~see. }

%% Test whether main language is from a group that use the Cyrillic alphabet
\cs_new:Nn \__asmeconf_findcyr:n 
	{
		  \seq_set_split:Nnn   \l_tmpa_seq { ; } { #1 }
		  \seq_map_function:NN \l_tmpa_seq \__asmeconf_flagcyr:n 
	}
\cs_new:Nn \__asmeconf_flagcyr:n 
	{ 
		\str_if_eq:VnT \g__asmeconf_main_str {#1} { 
			\gdef\ac@TtwoA{T2A}
			\ac@cyrillictrue
		}
	}
%% Set main language	 
\cs_new:Nn \__asmeconf_setupmain:n {% revised 2025/03/24
	\str_gset:Nn \g__asmeconf_main_str {#1}%
	\PassOptionsToPackage{ main=\g__asmeconf_main_str }{babel}
	\ac@mainsettrue 
	\str_if_eq:nnF {english} {#1} 
	{
		\str_if_eq:nnTF {vietnamese} {#1} {
			\PassOptionsToPackage{vietnamese.noencoding}{babel}% suppress unneeded warning about encoding
			%\RequirePackage[vietnamese=nohyphenation]{hyphsubst}% eliminates a warning, but not needed with recent versions of babel
			\ac@vietnamesetrue
			\gdef\ac@Tfive{T5}
		}{
    		\str_if_eq:nnTF {greek} {#1} {
    			\ifpdftex
    				\msg_error:nn { \ClassName } { nogreekmain }
    			\else
    				\ac@greektrue
    				\gdef\ac@TLGR{LGR}
    			\fi
    		}{
				\__asmeconf_findcyr:n{russian;belarusian;bulgarian;macedonian;serbianc;ukrainian}
			}
		}		
	}
	\msg_note:nnn { \ClassName } { mainlang } {#1}
}

\typeout{ ^^J If~you~see~an~error~"Use~of~\string\???~doesn't~match~its~definition...
			   Misplaced~'='~in~key-value~input",~remove~
			   the~deprecated~option~[mathalfa=ccc=ddd]~from~\string\documentclass.^^J }
            
%%% Now create options and keys
\IfFormatAtLeastTF{2022/11/01}{
    \DeclareKeys[\ClassName]
    {
		balance 		.if	 	= asmeconf@balance ,% Option to balance column height on last page [balance]
		balance 		.usage	= load ,
		colorlinks		.code	= \PassOptionsToPackage{colorlinks}{hyperref} ,% Option to have colored hyperlinks, rather than black [colorlinks]
		colorlinks		.usage	= load ,
		contractor 		.if		= asmeconf@contractor ,% Option for government contractor copyright notice [contractor]
		contractor 		.usage	= load ,
		govt 			.if	 	= asmeconf@govt ,% Option for copyright notice if all authors are government employees [govt]
		govt 			.usage	= load ,
		govtsome 		.if		= asmeconf@govtsome ,% Option for copyright notice if some (not all) authors are government employees [govtsome]
		govtsome 		.usage	= load ,
		grid 			.if	 	= asmeconf@grid ,% Option to convert inline author data to a grid of authors [grid]
		grid 			.usage	= load ,
		lineno 			.if	 	= asmeconf@lineno ,% Option to obtain line numbers [lineno] 
		lineno 			.usage	= load ,
		loadscripts 	.if	 	= asmeconf@loadscripts ,% Option to load support for 19 languages in non-Latin scripts [loadscripts] 
		loadscripts		.usage	= load ,
		main 			.store	= \g__asmeconf_main_str ,% set main language (for babel)
		main 			.usage	= preamble , 
		main			.code	= \__asmeconf_setupmain:n { #1 },
		mathalfa		.code	= \msg_warning:nn { \ClassName } { mathalfa },% Warn about old [mathalfa= ] keyvalue; an imperfect fix. 2025/04/07 
		mathalfa		.usage	= load ,
		nofontspec 		.if		= asmeconf@nofontspec ,% Option NOT to use fontspec package under luaLaTeX [nofontspec]
		nofontspec 		.usage	= load ,
		nofoot 			.if	 	= asmeconf@nofoot ,% Option to omit the footer [nofoot]
		nofoot 			.usage	= load ,
		nohead 			.if	 	= asmeconf@nohead ,% Option to omit the conference headers [nohead]
		nohead 			.usage	= load ,
		unboldcaption 	.if 	= asmeconf@unboldcaption ,% Option for caption text not to use boldface type [unboldcaption]
		unboldcaption 	.usage	= load,
    } 
	\DeclareUnknownKeyHandler[\ClassName]{\relax}% suppress warning about unused keys
	\ProcessKeyOptions
}{% And more compatibility code for distributions pre-2022/11     
    \RequirePackage{kvoptions}
    \SetupKeyvalOptions{
       family=\ClassName,
       prefix=asmeconf@,
       setkeys=\kvsetkeys,
    }
    
    %%% set key [colorlinks] to have colored hyperlinks, rather than black links (use a key with new pdfmanagement, 2021/12/01)
    \define@key{\ClassName}{colorlinks}[colorlinks]{%
       \PassOptionsToPackage{#1}{hyperref}%
    }
    %% Option for caption text not to use boldface type [unboldcaption]
    \DeclareBoolOption{unboldcaption}
    %% Option to obtain line numbers [lineno] 
    \DeclareBoolOption{lineno}
    %% Option to balance column height on last page [balance] 
    \DeclareBoolOption{balance}
    %% Option to convert inline author data to a grid of authors [grid]
    \DeclareBoolOption{grid}%
    %% Option to omit the footer [nofoot]
    \DeclareBoolOption{nofoot}
    %% Option to omit the conference headers [nohead]
    \DeclareBoolOption{nohead}
    %% Option for copyright notice if all authors are government employees [govt]
    \DeclareBoolOption{govt}
    %% Option for copyright notice if some (not all) authors are government employees [govtsome]
    \DeclareBoolOption{govtsome}
    %% Option for government contractor copyright notice [contractor]
    \DeclareBoolOption{contractor}
    %% Option NOT to use fontspec package under luaLaTeX [nofontspec]
    \DeclareBoolOption{nofontspec} 
    %% Option to load support for 19 languages in non-Latin scripts [loadscripts] 
    \DeclareBoolOption{loadscripts}
    %% Key to set main language
    \define@key{\ClassName}{main}{% remove default 2024/07/26, to avoid conflict with subsequent logic
    	  \PassOptionsToPackage{main=#1,#1}{babel}% Adding #1 resolves conflict of russianb.ldf & ukrainianb.ldf under "main=". 
    	  										  % If only reality were this simple...
    	  \ac@mainsettrue
    	  \__asmeconf_setupmain:n { #1 }
    }
    %% the key [mathalfa= ] was dropped with v1.41; instead, load the mathalpha package in your preamble
    \define@key{\ClassName}{mathalfa}{%
	   	  \msg_note:nn { \ClassName } { mathalfa }
    }      
    
    \DeclareDefaultOption{}% suppress warnings about unused options
    \ProcessKeyvalOptions{\ClassName}
    
    
    %% Turn off these keys now that we're done with them
    \def\ac@KeyFamily{\ClassName}
    \cs_new:Nn \__asmeconf_disablekeys:n 
    	{
    		  \seq_set_split:Nnn \l_tmpa_seq { ; } { #1 }
    		  \seq_map_function:NN \l_tmpa_seq \__asmeconf_disableoptions:n 
    	}
    \cs_new:Nn \__asmeconf_disableoptions:n 
    	{ 
          \DisableKeyvalOption[%
    		action=ignore,%
    		class=\ClassName%
          	]{#1}{\ac@KeyFamily}%
    	} 
    \__asmeconf_disablekeys:n 
    	{ colorlinks;unboldcaption;lineno;balance;grid;nofoot;nohead;govt;govtsome;
    	    contractor;mathalfa;nofontspec;loadscripts;main
		}
}

%% if main language was not chosen explicitly, ensure default to English
\ifac@mainset\else
  	\PassOptionsToPackage{main=USenglish}{babel}
	\ClassWarning{\ClassName}{Selecting~US~English~as~babel's~primary~language,~since~main=~not~set}%
\fi

\ExplSyntaxOff

%% The expl3 code required for [grid] was not def'd until the June 2021 release
\IfFormatAtLeastTF{2021/06/01}{\relax}{%
	\ifasmeconf@grid
	\ClassWarning{\ClassName}{Your LaTeX format is dated \fmtversion.  Formats dated 2021-06-01 or later are required for the [grid] option. It will be ignored.}
	\fi
	\asmeconf@gridfalse 
}

%%%%%%%%%  Various font-related options  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% switches for fontspec, from [nofontspec] option
\newif\ifac@fontspec
\newif\ifFontspecLoaded % so user can test in .tex file; CamelCased 2025/04/12
\newif\ifScriptsLoaded  % so user can test in .tex file

\ifpdftex
	\ifasmeconf@nofontspec
		\ClassWarningNoLine{\ClassName}{The [nofontspec] option requires LuaLaTeX. It will be ignored under pdfLaTeX}%
	\fi
	% at this point: ac@pdftex is true, ac@fontspec is false, and asmeconf@nofontspec is true.
	\ifasmeconf@loadscripts
		\ClassWarningNoLine{\ClassName}{The [loadscripts] option requires LuaLaTeX. It will be ignored under pdfLaTeX}%
	\fi
	\asmeconf@loadscriptsfalse
\else
	\ifasmeconf@nofontspec
		\ClassWarningNoLine{\ClassName}{The [nofontspec] option has been issued. LuaLaTeX will run without fontspec and unicode-math}%
    	\ifasmeconf@loadscripts
    		\ClassWarningNoLine{\ClassName}{The [loadscripts] option requires fontspec. It will be ignored with the [nofontspec] option}%
    	\fi
		\asmeconf@loadscriptsfalse
	\else
    	\IfFormatAtLeastTF{2020/10/01}{%
    		\ac@fontspectrue
    		\FontspecLoadedtrue
			\ifasmeconf@loadscripts\ScriptsLoadedtrue\fi
    	}{%
    	\ClassError{\ClassName}{Your LaTeX format is dated \fmtversion. LaTeX installations dated 2020-10-01 or later are needed to run LuaLaTeX with the fontspec package. Fontspec will NOT be loaded. Language support will be minimal}{Please UPDATE your LaTeX distribution to obtain best results. TeX Live is available for download at no charge: \string https://www.tug.org/texlive/. You may alternatively choose the [nofontspec] option.}%
    	}
	\fi
\fi
% asmeconf@nofontspec is not used from this point forward.


%% dropped class option [largesc] and made it the default (pdftex only). 2025/03/16
\ifpdftex
	\PassOptionsToPackage{largesc=true}{newtxtext}% largesc is a boolean key in newtxtext
\fi

%% option for upright integral signs, rather than default slanted integrals, [upint]
\def\UpInt{}% default slanted integrals in STIX Two Math font with unicode-math
\DeclareOption{upint}{%
	\ifac@fontspec
		\def\UpInt{+ss08}% upright integrals in STIX Two Math font and Lete Sans Math fonts
	\else
		\PassOptionsToPackage{upint}{newtxmath}% this option exists in newtxmath
	\fi
}

%% option to hyphenate the inconsolata typewriter font [hyphenate] and to issue a warning when that's done.
\DeclareOption{hyphenate}{%
	\ifac@fontspec
		\ClassWarningNoLine{\ClassName}{hyphenate option is not supported by fontspec. It will be ignored}%
	\else
		\PassOptionsToPackage{hyphenate}{inconsolata}% hyphenate is a key via xkeyval in inconsolata
		\ClassNoteNoLine{\ClassName}{Allowing hyphenation of typewriter font}%
	\fi
}
%% option for monospacing in inconsolata typewriter font [mono]. (Does not work with Inconsolata-Bold)
\def\MonoNotMono{WordSpace={1,1,1}}% rescaled tt font to match pdf, 2024/07/28
\DeclareOption{mono}{%
	\ifac@fontspec
		\def\MonoNotMono{WordSpace={1,0,0},PunctuationSpace={3}}% NB: these are the default WordSpace values
	\else
		\PassOptionsToPackage{mono}{inconsolata}% mono is a key via xkeyval in inconsolata
	\fi
}
%% option for unslashed zero in inconsolata typewriter font [var0].
\def\ssztwo{}% for Inconsolatazi4; default uses slashed zero, +ss02 uses regular zero
\DeclareOption{var0}{%
	\ifac@fontspec
		\def\ssztwo{+ss02}% stylistic alternate for regular zero
	\else
		\PassOptionsToPackage{var0}{inconsolata}% var0 is a key via xkeyval in inconsolata
	\fi
}


%%%%%%%%%%%%%   More Language options  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifJapaneseLoaded % user-level switch

\DeclareOption{japanese}{% to control loading of fontspec options and luatxja-fontspec
	\ifac@fontspec	
		\PassOptionsToPackage{japanese}{babel}%
		\ac@japanesetrue
		\JapaneseLoadedtrue
	\else
		\ClassWarningNoLine{\ClassName}{[japanese] option is supported only under LuaLaTeX with fontspec. It will be ignored}%
	\fi
}

\DeclareOption{greek}{%
	\PassOptionsToPackage{greek}{babel}%
	\ac@greektrue
	\gdef\ac@LGR{LGR}
}

\DeclareOption{vietnamese}{%
	\PassOptionsToPackage{vietnamese,vietnamese.noencoding}{babel}% noencoding suppresses unnecessary warning about inputenc
	%\RequirePackage[vietnamese=nohyphenation]{hyphsubst} % Eliminates babel warning; not needed with recent versions of babel
	\ac@vietnamesetrue
	\gdef\ac@Tfive{T5}
}

\ExplSyntaxOn

%% Cyrillic languages
\cs_new:Nn \__asmeconf_cyroptions:n 
	{
		  \seq_set_split:Nnn \l_tmpa_seq { ; } { #1 }
		  \seq_map_function:NN \l_tmpa_seq \__asmeconf_cyroptset:n 
	}
\cs_new:Nn \__asmeconf_cyroptset:n 
	{ 
	\DeclareOption{#1}{%
		\PassOptionsToPackage{#1}{babel}%
		\gdef\ac@TtwoA{T2A}
		\ac@cyrillictrue
		}
	}
\__asmeconf_cyroptions:n {russian;belarusian;bulgarian;macedonian;serbianc;ukrainian}

\ExplSyntaxOff

% Several languages do not have .ldf files to load. Babel will call these on demand.
%
\DeclareOption{arabic}{\ClassError{\ClassName}{Do not specify "arabic" as a class option}{Instead, give the option [bidi=basic] and specify "arabic" when you call the language within your document.}}
%
\DeclareOption{bengali}{\ClassError{\ClassName}{Do not specify "bengali" as a class option}{Instead, specify "bengali" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{chinese-simplified}{\ClassError{\ClassName}{Do not specify "chinese-simplified" as class option}{Instead, specify "chinese-simplified" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{chinese-traditional}{\ClassError{\ClassName}{Do not specify "chinese-traditional" as class option}{Instead, specify "chinese-traditional" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{chinese}{\ClassError{\ClassName}{Do not specify "chinese" as a class option}{Instead, specify either "chinese-simplified" or "chinese-traditional" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{hindi}{\ClassError{\ClassName}{Do not specify "hindi" as a class option}{Instead, specify "hindi" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{korean}{\ClassError{\ClassName}{Do not specify "korean" as class option}{Instead, specify "korean"when you call the language within your document. No class option is needed.}}
%
\DeclareOption{marathi}{\ClassError{\ClassName}{Do not specify "marathi" as a class option}{Instead, specify "marathi" when you call the language within your document. No class option is needed.}}
%
\DeclareOption{tamil}{\ClassError{\ClassName}{Do not specify "tamil" as a class option}{Instead, specify "tamil" when you call the language within your document. No class option is needed.}}

%% Suppress warnings about unused global options
\DeclareOption*{}

\ProcessOptions \relax %% end of options section


%%%%%%%%%%%%%  Geometry, graphics, colors, bibliography %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[letterpaper, left=0.5in, right=0.5in, top=0.5in, bottom = 1.in, footskip=0.5in, columnsep=0.38in]{geometry}
% conforms to ASME required margins
\setlength\parindent{0.25in}

\RequirePackage{graphicx} % removed obsolete options, 2023/11/19
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}

\RequirePackage[sort&compress,numbers]{natbib} 
\setlength\bibsep{1pt plus 1pt minus 1pt}


%%%%%%%%%%%%  Table related %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{booktabs}
\RequirePackage{array} 

\RequirePackage{dcolumn}% alignment on decimal places
% use d{x.y} to center on "." as in "12.234" 
\newcolumntype{d}[1]{D{.}{.}{#1}}
% NB: The above conflicts with babel's Spanish language option which makes "." an active character.
% Instead, to use "," as the decimal separator, choose columntype "," (as in "12,234")
\newcolumntype{,}[1]{D{,}{,}{#1}}


%%%%%%%%%  Caption related  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Needs to come before babel messes with the captions, to keep uppercase text.

\RequirePackage[labelfont={sf,bf},hypcap=false]{caption}
\RequirePackage[list=true,hypcap=false]{subcaption}

\ExplSyntaxOn
\IfPackageLoadedTF{caption}{
    \cs_if_exist:NT \tag_if_active:T % not in TeX Live 2021
    {
      \tag_if_active:T % 2025/11/02
        {
    	% 	Patches the caption packages so that asmeconf can validate as pdf 2.0/ua-2. Subcaptions are not specifically addressed.
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
    }
%
    %\DeclareCaptionLabelFormat{uppercase}{\MakeTextUppercase{#1} #2} % stopped functioning... 2025/11/07
    \DeclareCaptionLabelFormat{uppercasebold}{\small\bfseries\sffamily\MakeTextUppercase{#1}~#2\mathversion{sansbold}} % addressing new strange behavior, 2025/11/07
    \DeclareCaptionLabelFormat{uppercase}{\small\sffamily{\bfseries\MakeTextUppercase{#1}~#2}\mathversion{sans}}       % addressing new strange behavior, 2025/11/07
    
    \DeclareCaptionTextFormat{boldmath}{\small\bfseries\sffamily\mathversion{sansbold}#1}
    \DeclareCaptionTextFormat{sansmath}{\sffamily\mathversion{sans}#1}
    
    \ifasmeconf@unboldcaption
    	\captionsetup[figure]{labelformat=uppercase,labelfont={sf,bf,small},textfont={sf,md,small},textformat=sansmath,labelsep=colon}
    	\captionsetup[table]{ labelformat=uppercase,labelfont={sf,bf,small},textfont={sf,md,small},textformat=sansmath,labelsep=colon,skip=0.5\baselineskip}
    \else
    	\captionsetup[figure]{labelformat=uppercasebold,labelfont={sf,bf,small},textfont={sf,bf,small},textformat=boldmath,labelsep=colon}
    	\captionsetup[table]{ labelformat=uppercasebold,labelfont={sf,bf,small},textfont={sf,bf,small},textformat=boldmath,labelsep=colon,skip=0.5\baselineskip}
    \fi
}{\relax}

%%  Use latex-lab hooks/sockets with recent latex version; useful WITHOUT caption package. No support for subcaptions. 2025/11/08
%
\cs_new:Nn \__asmeconf_fixcaptions: 
	{
	\setlength\abovecaptionskip{5\p@} % may need some adjustments to this.
	\ifasmeconf@unboldcaption
		\NewSocketPlug{caption/label}{plug-A}    % strictly addresses the caption label, not caption text.
			{{\small\bfseries\sffamily  ##1:}}   % \MakeUppercase{#1} is a bad actor here, so instead cap \figurename below
		\AssignSocketPlug{caption/label}{plug-A}
		\AddToHook{cmd/@makecaption/before}{\small\sffamily\mathversion{sans}}
	\else
		\AddToHook{cmd/@makecaption/before}{\small\bfseries\sffamily\mathversion{sansbold}} % This styles the entire caption.
	\fi
	\AddToHook{cmd/@makecaption/after}
		{
	        \str_if_eq:VnT \@captype {table} { \vskip 0.5\baselineskip}
		}
	}

\IfFormatAtLeastTF{2025/11/01}
	{
	\IfPackageLoadedTF{caption}
    	{
    	\tag_if_active:F { \__asmeconf_fixcaptions: }
    	}{  
		\__asmeconf_fixcaptions: 
    	}
	}{\relax}
 
\ExplSyntaxOff

%% Capitalize Figure and Table in all languages. 
%% Caption package can override this.

\renewcommand{\fnum@figure}{\MakeTextUppercase{\figurename}~\thefigure}
\renewcommand{\fnum@table} {\MakeTextUppercase{\tablename}~\thetable}

%%%%%%%%%%%%  Font related  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{mathtools}% loads and extends amsmath

\ifpdftex
	% must load before babel
	\RequirePackage[\ac@TtwoA,\ac@Tfive,\ac@LGR,T1]{fontenc}
	% T2A - Cyrillic (w/o babel warning); LGR - Greek; T5 - Vietnamese; put T1 last 2022/03/10
\fi

\RequirePackage[]{babel} 

\ifpdftex
    \RequirePackage[helvratio=.91]{newtxtext}% rescaled 22/03/10
    \RequirePackage[varqu,varl,scale=1.03]{inconsolata}% sans typewriter font % rescaled to 1.05 22/03/10; rescaled to 1.03 2025/03/09
    \RequirePackage[]{newtxmath}
\else
    \ifac@fontspec
        \RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket},mathbf=sym]{unicode-math} % add mathbf=sym 2025/11/02
        % suppress warnings about lack of integration between mathtools and unicode-math...
        % unicode-math loads the fontspec package
%        
    	\def\FontWarning{For luaLaTeX, you MUST have these OpenType fonts installed on your computer: TeX Gyre Termes X, TeX Gyre Termes Math, TeX Gyre Heros, Inconsolatazi4, LeteSansMath-Bold, LeteSansMath, and STIXTwoMath. All are in TeX Live and CTAN. If you DON'T have these fonts, you will see warning or ERROR messages}
    %
    	\IfFontExistsTF{TexGyreTermesX-regular.otf}{}{  \ClassErrorNoLine{\ClassName}{\FontWarning} }
    	\IfFontExistsTF{texgyretermes-math.otf}{}{ 		\ClassErrorNoLine{\ClassName}{\FontWarning} }
    	\IfFontExistsTF{texgyreheros-regular.otf}{}{    \ClassErrorNoLine{\ClassName}{\FontWarning} }
    	\IfFontExistsTF{Inconsolatazi4-Regular.otf}{}{  \ClassErrorNoLine{\ClassName}{\FontWarning} }
    	\IfFontExistsTF{LeteSansMath-Bold.otf}{}{  		\ClassWarningNoLine{\ClassName}{\FontWarning} }
    	\IfFontExistsTF{LeteSansMath.otf}{}{  			\ClassWarningNoLine{\ClassName}{\FontWarning} }
    	\IfFontExistsTF{STIXTwoMath-Regular.otf}{}{  	\ClassErrorNoLine{\ClassName}{\FontWarning} }	    
%	    
		% The newtx package includes a modified version of TeXGyreTermes called TexGyreTermesX, which is loaded here.
		% Can fall back to TeXGyreTermes if desired, available at: http://www.gust.org.pl/projects/e-foundry/tex-gyre
        \setmainfont{TeXGyreTermesX}[
 			WordSpace = {1,1.6,1.2},%% This stretch matches newtxtext a little better; rescaled 2024/07/28
			PunctuationSpace = 1.332,%% match fontdimen7 to newtxtext, 2024/07/28
        	Extension = .otf,
        	UprightFont = *-Regular,
        	ItalicFont = *-Italic,
        	BoldFont = *-Bold,
        	BoldItalicFont = *-BoldItalic,
			Numbers = Lining,
			]
        \setsansfont{texgyreheros}[% Presumes it's installed! http://www.gust.org.pl/projects/e-foundry/tex-gyre
        	Scale=0.91,% same as for newtx; former value 0.9 too small 2022/01/15
 			WordSpace = {1,1,1},% These spacings match newtxtext; rescaled to unity 2024/07/28
			Extension = .otf,
        	UprightFont = *-regular,
        	ItalicFont = *-italic,
        	BoldFont = *-bold,
        	BoldItalicFont = *-bolditalic,
			Numbers = Lining,
			]        
       \setmonofont{Inconsolatazi4}[% This otf font ships with the LaTeX Inconsolata package (it's in TeX Live)
            Scale=1.03,% rescaled to 1.05 from 1, 22/03/10; rescaled to 1.03 2025/03/09
            Extension = .otf,
            UprightFont = *-Regular,
            ItalicFont = *-Regular,% has no italic face
            BoldFont = *-Bold, 
        	BoldItalicFont = *-Bold,% has no italic face
            RawFeature = {+ss01,\ssztwo}, % drop +ss03 2025/04/07
            \MonoNotMono,% match newtxtext if we enable wordspacing; note wordspace def'd in option above.
            ]
       \setmathfont{texgyretermes-math}[% Presumes it's installed! http://www.gust.org.pl/projects/e-foundry/tex-gyre
        	Scale=MatchUppercase,
	       	Extension = .otf,
    		BoldFont = *, % termes-math does not have a bold version
    		]        
        \setmathfont[Scale=MatchUppercase,version=bold,FakeBold=3]{texgyretermes-math}
        	% FakeBold is fairly robust ==>> must be loaded before range substitutions that follow <<===       
%	        
        % set up sans and sansbold math fonts
    \IfFontExistsTF{LeteSansMath-Bold.otf}% the bold version was released a few months after the regular, but we need both.
    {
        \setmathfont{LeteSansMath-Bold}[% In TeX Live. A newer math font (2024/05), bold-face sans-serif
            Scale=MatchUppercase,
	       	Extension = .otf,
			RawFeature={\UpInt},
            version=sansbold,
        ]
        \setmathfontface\mathrm{LeteSansMath-Bold.otf}[
        	Scale=MatchUppercase,
			version=sansbold
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
		\DeclareSymbolFont{lsmgreek}{TU}{lsm}{m}{n}
        \SetSymbolFont{lsmgreek}{normal}{TU}{lsm}{m}{n}
        \SetSymbolFont{lsmgreek}{bold}{TU}{lsm}{b}{n}
%
        \setmathfont{STIXTwoMath-Regular}[% In TeX Live. Substitution for bigger integrals (similar to newtxmath)
	       	Extension = .otf,
            Scale=MatchUppercase,
            RawFeature={\UpInt},
            BoldFont=*, 
            range={"0222B-"02233,"02A0B-"02A1C,}, 
        ] 
    }{
    	\ClassWarningNoLine{\ClassName}{Lete Sans Math Bold font not found, falling back to Fira Math with FakeBold}%
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
        \setmathfontface\mathrm{FiraMath-Regular.otf}[
        	Scale=MatchUppercase,
			version=sans,
		]     
        \setmathfontface\mathbf{FiraMath-Regular.otf}[
        	Scale=MatchUppercase,
			version=sans,
			FakeBold=4,
		] 
		\DeclareSymbolFont{fsmgreek}{TU}{fsm}{m}{n}
        \SetSymbolFont{fsmgreek}{normal}{TU}{fsm}{m}{n}
        \SetSymbolFont{fsmgreek}{bold}{TU}{fsm}{b}{n}
%    
        \setmathfont{STIXTwoMath-Regular}[% In TeX Live. Subst. bigger integrals (similar to newtxmath) + cal,scr,frak
	       	Extension = .otf,
            Scale=MatchUppercase,
    		BoldFont = *,
            RawFeature={\UpInt},
            range={"0222B-"02233,"02A0B-"02A1C,frak,bffrak,cal,bfcal,scr,bfscr}
        ]
	}
%
        \setmathfontface\mathsf{texgyreheros-bold.otf}[Scale=0.91,version=sansbold] 		% for sf     
        \setmathfontface\mathit{texgyreheros-bolditalic.otf}[Scale=0.91,version=sansbold] 	% for it
        \setmathfontface\mathtt{Inconsolatazi4-Bold.otf}[Scale=1.03,version=sansbold] 		% for tt

        \setmathfontface\mathsf{texgyreheros-regular.otf}[Scale=0.91,version=sans]  % for sf     
        \setmathfontface\mathit{texgyreheros-italic.otf}[Scale=0.91,version=sans]   % for it
        \setmathfontface\mathtt{Inconsolatazi4-Regular.otf}[Scale=1.03,version=sans]% for tt
%
        \setoperatorfont\normalfont % to enable sans or bold operators, etc.
% 
		%%% The next blocks load fonts for non-Latin scripts. Most are from the extensive Noto font family, but Amiri is called for serifed Arabic. 
		%%% Font loading is done with \babelfont. Twenty languages are supported. See example file included in this distribution.
		%
		\ifasmeconf@loadscripts  
            % For many languages, using babel commands helps font loading. 
            % Switched Harfbuzz to OpenType throughout, 2024/07/28
            % Noto fonts are available at https://github.com/googlefonts
        	\def\Noto@scale{0.92}
    	   	\def\Ara@scale{0.91}% For the serif font only
        	\def\NotoBan@scale{0.92}% 1.} should probably stay consistent within the Noto family.
        	\def\NotoDev@scale{0.92}% 1.} should probably stay consistent within the Noto family.
        	\def\NotoTam@scale{0.92}
    		\def\Noto@color{Color=black}% 2024/07/28. Changed this diagnostic command to by-pass a bug in luatexja-fontspec.	
    		% dropping this unused diagnostic option completely, owing to global conflict with luatexja
%
            \babelprovide[import, language=Default]{arabic}
            \babelfont [arabic]{rm}[Scale=\Ara@scale,
    	 		 %Renderer=OpenType,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% don't use italic face, I am told
    			 BoldFont = *-Bold,%
            	 BoldItalicFont = *-Bold,% don't use italic face, I am told
    			 ]{Amiri}% NotoNaskhArabic}% Some readers prefer Amiri font
            \babelfont [arabic]{sf}[Scale=\Noto@scale,
    	 		 %Renderer=OpenType,
                 Extension =.ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% font has no italic face
    			 BoldFont = *-SemiBold,% I'm told that legibility better than Bold
            	 BoldItalicFont = *-SemiBold,% font has no italic face
    			 ]{NotoSansArabic}%DejaVuSans}%NotoKufiArabic}% .otf,%
            \babelfont [arabic]{tt}[%
    	 		 %Renderer=OpenType,
                 Extension =.ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-SemiBold,% I'm told that legibility is better than Bold
            	 BoldItalicFont = *-SemiBold,% has no italic face
    			 ]{NotoSansArabic}%same as above!
            \providecommand\arabicabstractname{ملخص}% NB: utf-8
%
            \babelprovide[import,language=Default,script=Bangla]{bengali}
            \babelfont [bengali]{rm}[%
    	 		 %Renderer=OpenType,
                 Scale=\NotoBan@scale,% same as Devanagari
    %             \Noto@color,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-Bold, 
            	 BoldItalicFont = *-Bold,% has no italic face
            ]{NotoSerifBengali}
            \babelfont [bengali]{sf}[%
    	 		 %Renderer=OpenType,
                 Scale=\NotoBan@scale,
    %             \Noto@color,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-Bold, 
            	 BoldItalicFont = *-Bold,% has no italic face
            ]{NotoSansBengali}
            \babelfont [bengali]{tt}[
    	 		 %Renderer=OpenType,
    			 Scale=\NotoBan@scale,
    %             \Noto@color,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-Bold, 
            	 BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSansBengali}		
%
            % Cyrillic languages
    		\NewDocumentCommand\ac@LoadBabelCyr{>{\SplitList{;}}m}{\ProcessList{#1}{\ac@CyrillicBabel}}
    		\NewDocumentCommand\ac@CyrillicBabel{m}{%
            	\babelprovide[import,language=Default,script=Cyrillic]{#1} % rescaled 2025/03/14
                \babelfont [#1]{rm}[%
    %            	Scale=\Noto@scale,
    	        	Scale=0.84,%\Noto@scale, % matching x-height to Termes
    	 			WordSpace = {1.14,1.8,1.37},
    				PunctuationSpace = 1.52,
    %    			\Noto@color,
        			Extension = .ttf,
                    UprightFont = *-Regular,
                    ItalicFont = *-Italic,
                    BoldFont = *-Bold, 
                	BoldItalicFont = *-BoldItalic,%
                ]{NotoSerif}
                \babelfont [#1]{sf}[%
    %            	Scale=\Noto@scale,
    	        	Scale=0.8896,%\Noto@scale, % matching x-height to Heros
    				WordSpace={1.094},% increase word spacing slightly
    				PunctuationSpace = 1.094,%% match fontdimen7
    %				\Noto@color,
       				Extension = .ttf,
                    UprightFont = *-Regular,
                    ItalicFont = *-Italic,
                    BoldFont = *-Bold, 
                	BoldItalicFont = *-BoldItalic,%
    			]{NotoSans}
                \babelfont [#1]{tt}[%
    	            Scale=0.878,%\Noto@scale, % matching x-height to Inconsolata
    %				\Noto@color,
    				Extension = .ttf,
    				UprightFont = *-Regular,
        			ItalicFont = *-Regular,% has no italic face
        			BoldFont = *-Bold, 
                	BoldItalicFont = *-Bold,% has no italic face
    			]{NotoSansMono}
    		}
    		\ac@LoadBabelCyr{russian;belarusian;bulgarian;macedonian;serbian-cyrillic;ukrainian}% serbianc has no .ini under fontspec
    		\setlocalecaption{serbian-cyrillic}{abstract}{Сажетак}% NB: utf-8
%
            % Devanagari languages
            \newfontscript{Devanagari}{deva}% OpenType has some problems in Hindi, see babel manual Sect. 1.13 (main issue is ra)
    		\NewDocumentCommand\ac@LoadBabelDev{>{\SplitList{;}}m}{\ProcessList{#1}{\ac@DevBabel}}
    		\NewDocumentCommand\ac@DevBabel{m}{%
            	\babelprovide[import,language=Default]{#1}
                \babelfont [#1]{rm}[%
    %		 		 %Renderer=OpenType,% Marathi and Hindi may respond differently...
                     Scale=\NotoDev@scale,
    %                 \Noto@color,
                     Extension = .ttf,
        			 UprightFont = *-Regular,
        			 ItalicFont = *-Regular,% has no italic face
        			 BoldFont = *-Bold, 
                	 BoldItalicFont = *-Bold,% has no italic face
                 ]{NotoSerifDevanagari}
                \babelfont [#1]{sf}[%
    %		 		 %Renderer=OpenType,% % Marathi and Hindi may respond differently...
                     Scale=\NotoDev@scale,
    %                 \Noto@color,
                     Extension = .ttf,
        			 UprightFont = *-Regular,
        			 ItalicFont = *-Regular,% has no italic face
        			 BoldFont = *-Bold, 
                	 BoldItalicFont = *-Bold,% has no italic face
                 ]{NotoSansDevanagari}
                \babelfont [#1]{tt}[
    %		 		 %Renderer=OpenType,% % Marathi and Hindi may respond differently...
                     Scale=\NotoDev@scale,
    %                 \Noto@color,
                     Extension = .ttf,
        			 UprightFont = *-Regular,
        			 ItalicFont = *-Regular,% has no italic face
        			 BoldFont = *-Bold, 
                	 BoldItalicFont = *-Bold,% has no italic face
    			 ]{NotoSansDevanagari}		
    		}
    		\ac@LoadBabelDev{hindi;marathi;kashmiri;nepali;sanskrit}
    		% No .ldf files for these languages, but they do have .ini files. Nepali: no abstractname
%
    		% Greek
    		\babelprovide[import,language=Default]{greek} % adjust scales 2025/03/14
            \babelfont [greek]{rm}[%
            	Scale=0.84,%\Noto@scale,
     			WordSpace = {1.14,1.8,1.37},
    			PunctuationSpace = 1.52,
    %			WordSpace={1.1},% increase word spacing slightly
    %			\Noto@color,
    			Extension = .ttf,
                UprightFont = *-Regular,
                ItalicFont = *-Italic,
                BoldFont = *-Bold, 
            	BoldItalicFont = *-BoldItalic,%
    		]{NotoSerif}
            \babelfont [greek]{sf}[%
            	Scale=0.8896,%\Noto@scale,
    			WordSpace={1.094},% increase word spacing slightly
    			PunctuationSpace = 1.094,%% match fontdimen7
    %			\Noto@color,
    			Extension = .ttf,
                UprightFont = *-Regular,
                ItalicFont = *-Italic,
                BoldFont = *-Bold, 
            	BoldItalicFont = *-BoldItalic,%
    		]{NotoSans}
            \babelfont [greek]{tt}[%
                Scale=0.878,%\Noto@scale,
    %			\Noto@color,
    			Extension = .ttf,
    			UprightFont = *-Regular,
        		ItalicFont = *-Regular,% has no italic face
        		BoldFont = *-Bold, 
                BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSansMono}
%    				
    		% Korean
    		\babelprovide[import,language=Default]{korean} 
            \babelfont [korean]{rm}[%
            	Scale=\Noto@scale,
    %			\Noto@color,
    			Extension = .otf,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
            ]{NotoSerifCJKkr}
            \babelfont [korean]{sf}[%
            	Scale=\Noto@scale,
    %			\Noto@color,
    			Extension = .ttc,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSansCJK}
            \babelfont [korean]{tt}[%
            	Scale=\Noto@scale,
    %			\Noto@color,
    %			Extension = .ttc,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSansMonoCJKkr}
    		\renewcommand\koreanabstractname{초록} % NB: utf-8
%    
    		% Simplified Chinese
    		\babelprovide[import,language=Default]{chinese-simplified} % throws an error when tagging is active, 2025/03/06
            \babelfont [chinese-simplified]{rm}[%
            	Scale=\Noto@scale,
    %        	\Noto@color,
            	Extension = .otf,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSerifCJKsc}
            \babelfont [chinese-simplified]{sf}[%
            	Scale=\Noto@scale,
    %			\Noto@color,
    			Extension = .ttc,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSansCJK}
            \babelfont [chinese-simplified]{tt}[%
            	Scale=\Noto@scale,
    %			\Noto@color,
    %			Extension = .ttc,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSansMonoCJKsc}
    %
    		% Traditional Chinese (includes characters for Cantonese also)
    		\babelprovide[import,language=Default]{chinese-traditional} % throws an error when tagging is active, 2025/03/06
            \babelfont [chinese-traditional]{rm}[% fixed 2024/07/28
            	Scale=\Noto@scale,
    %        	\Noto@color,
            	Extension = .otf,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSerifCJKtc}
            \babelfont [chinese-traditional]{sf}[%
            	Scale=\Noto@scale,
    %			\Noto@color,
    			Extension = .ttc,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSansCJK}
            \babelfont [chinese-traditional]{tt}[Scale=\Noto@scale,\Noto@color]{NotoSansMonoCJKtc}
    %
            \babelprovide[import,language=Default]{tamil}
            \babelfont [tamil]{rm}[%
    	 		 %Renderer=OpenType,
                 Scale=\NotoTam@scale,
    %             \Noto@color,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-Bold, 
            	 BoldItalicFont = *-Bold,% has no italic face
            ]{NotoSerifTamil}
            \babelfont [tamil]{sf}[%
    	 		 %Renderer=OpenType,
                 Scale=\NotoTam@scale,
    %             \Noto@color,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-Bold, 
            	 BoldItalicFont = *-Bold,% has no italic face
            ]{NotoSansTamil}
            \babelfont [tamil]{tt}[
    	 		 %Renderer=OpenType,
    			 Scale=\NotoTam@scale,
    %             \Noto@color,
                 Extension = .ttf,
    			 UprightFont = *-Regular,
    			 ItalicFont = *-Regular,% has no italic face
    			 BoldFont = *-Bold, 
            	 BoldItalicFont = *-Bold,% has no italic face
    		]{NotoSansTamil}		
    %
    	    \babelprovide[import, captions/abstract = Muhtasari, language = Default]{swahili}
		\fi
		%      
        % Japanese
        % luatexja-fontspec seems to want lc "color" now, rather than normal "Color", as before. Commenting out.
        % ongoing issues with color in these fonts, conflicting with Greek and Russian.  Eliminating color from all three. 2025/03/07
        % NB: luatexja-fontspec color breakage appears to be global.
        \ifac@japanese
%       	\let\savNoto@color\Noto@color
%           \def\Noto@color{}% by-pass bug in luatexja-fontspec, 2024/07/28.
        	\RequirePackage[no-math]{luatexja-fontspec}% japanese typesets *much* better with this loaded
            \setmainjfont{NotoSerifCJKjp}[%
            	Scale=0.92,
%				\Noto@color,
%    			Extension = .otf,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,% has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
			]
            \setsansjfont{NotoSansCJKjp}[%
            	Scale=0.92,
%				\Noto@color,
%    			Extension = .ttc,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
			]
            \setmonojfont{NotoSansMonoCJKjp}[%
            	Scale=0.92,
%				\Noto@color,	
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
			]
            \ltjsetparameter{jacharrange={-1, -2, +3, -4, -5, +6, +7, +8}}% this prevents luatexja from breaking Russian and Greek.
            % see: https://tex.stackexchange.com/questions/222320/russian-in-document-with-japanese-as-main-language-lualatex-ltjsarticle
    		% Need at least one of the following to load the Japanese dictionary.
    		\babelfont [japanese]{rm}[%
    			Scale=0.92,
%    			\Noto@color,
    			Extension = .otf,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,% has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
    			]{NotoSerifCJKjp}% Scale estimated
        	\babelfont [japanese]{sf}[%
            	Scale=0.92,
%    			\Noto@color,
%   			Extension = .ttc,
    			UprightFont = *-Regular,
    			ItalicFont = *-Regular,%  has no italic face
    			BoldFont = *-Bold, 
            	BoldItalicFont = *-Bold,% has no italic face
			]{NotoSansCJKjp}
            \babelfont [japanese]{tt}[%
            	Scale=0.92,
%				\Noto@color,
%				Extension = .ttc,
				UprightFont = *-Regular,
				ItalicFont = *-Regular,%  has no italic face
				BoldFont = *-Bold, 
        		BoldItalicFont = *-Bold,% has no italic face
			]{NotoSansMonoCJKjp}% renders same as Sans!
%			\let\Noto@color\savNoto@color
		\fi
		% Note: \japaneseabstractname is not defined if japanese is not called as a package option.
%	
   \else % use lualatex without support for system fonts (enables luacode for numerics while retaining newtx etc.)
    	 % dropped newtxtext completely, 2024/01/19
		\renewcommand*\rmdefault{ntxtlf}          % roman font for math
		\RequirePackage[T1]{fontenc} 			  % qhv and zi4 are not TU encoded, 2021/12/24
			\DeclareFontFamily{T1}{\sfdefault}{}  % sf for math
	    	\DeclareFontShape{T1}{\sfdefault}{m}{n}{<-> s*[0.91] ec-qhvr}{}  %% see t1qhv.fd; 0.9-->0.94 2022/01/15; 0.94-->0.91, 2025/04/08
	    	\DeclareFontShape{T1}{\sfdefault}{b}{n}{<-> s*[0.91] ec-qhvb}{}  %% see t1qhv.fd; 0.9-->0.94 2022/01/15; 0.94-->0.91, 2025/04/08
	    	\DeclareFontShape{T1}{\sfdefault}{bx}{n}{<-> s*[0.91] ec-qhvb}{} %% see t1qhv.fd; 0.9-->0.94 2022/01/15; 0.94-->0.91, 2025/04/08
			\RequirePackage[varqu,varl,scale=1.03]{inconsolata}% sans typewriter font, revised 2025/04/11
    	\RequirePackage[]{newtxmath} % options will be as passed from newtx
   \fi
\fi

%% the bm package is loaded only without unicode-math (bm = bold math macro)
\ifac@fontspec
	\let\bm\symbf % in case of user error...
\else
	\RequirePackage{bm}% load after all math
\fi

% To free \eqref from the normal font (e.g., for use in section headings or captions). Revised 2024/07/28
\renewcommand{\eqref}[1]{\textup{\hbox{\m@th{(\ignorespaces\ref{#1}\unskip\@@italiccorr)}}}}
%
% amsmath def:  \newcommand{\eqref}[1]{\textup{\tagform@{\ref{#1}}}}
%				\def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}}
%				\def\maketag@@@#1{\hbox{\m@th\normalfont#1}}


% The article class calls \sloppy in two-column mode (\tolerance 9999, \emergencystretch 3em)
% The following adjustments affect line breaking; the values below are intended to produce
% fewer lines with large spaces, without creating the problems of using \fussy in two-column mode.
\tolerance 2500
\emergencystretch 3em 

%\RequirePackage{hologo}% Moved to .tex file, 2025/03/26.  Dropped metalogo, 2024/08/09.

%% font size selection  
%% ASME's specs differ slightly from latex standard article-10 class 
\renewcommand\LARGE{\@setfontsize\LARGE{16}{19.2}}              %{18}{21.6}}  updated 2019/7/7 to match new ASME spec.  
                                                                % ...default is 17.28/22 ... used for paper#
\renewcommand\large{\@setfontsize\large{11}{13.6}}              % default is 12/14 ... used for headings

%\renewcommand\Large{\@setfontsize\Large{14.4}{18}}             % same as default
%\renewcommand\normalsize{\@setfontsize\normalsize{10}{12}}     % same as default
%\renewcommand\small{\@setfontsize\small{9}{11}}                % same as default
%\renewcommand\footnotesize{\@setfontsize\footnotesize{8}{9.5}} % same as default


%% set up sansbold and sans mathversions for pdftex
\ifac@fontspec\else
    %% This provides sans-serif italic and sans-serif bold italic math.
    %% These fonts are for use in the figure captions and section headings. 
    %% Use \mathbf{..}, \mathversion{bold}, or \bm{..} elsewhere.
    \DeclareMathVersion{sansbold}
    \SetSymbolFont{letters}{sansbold}{OML}{ntxsfmi}{b}{it}
    \SetSymbolFont{lettersA}{sansbold}{U}{ntxsfmia}{b}{it}
    \SetSymbolFont{symbols}{sansbold}{LMS}{ntxsy}{b}{n}
    \SetSymbolFont{largesymbols}{sansbold}{LMX}{ntxexx}{b}{n}%  added 25 Jan 2021
    \SetSymbolFont{largesymbolsTXA}{sansbold}{U}{ntxexa}{b}{n}% added 25 Jan 2021
    \SetSymbolFont{operators}{sansbold}{OT1}{\sfdefault}{\bfdefault}{n}% fixed encoding 2025/04/07
    \SetMathAlphabet{\mathsf}{sansbold}{\encodingdefault}{\sfdefault}{b}{n}% changed from it, 2021/01/31: \mathsf is upright.
    
    %% Added 2023/10/19
    \DeclareMathVersion{sans}
    \SetSymbolFont{letters}{sans}{OML}{ntxsfmi}{m}{it}
    \SetSymbolFont{lettersA}{sans}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{symbols}{sans}{LMS}{ntxsy}{m}{n}
    \SetSymbolFont{largesymbols}{sans}{LMX}{ntxexx}{m}{n}
    \SetSymbolFont{largesymbolsTXA}{sans}{U}{ntxexa}{m}{n}
    \SetSymbolFont{operators}{sans}{OT1}{\sfdefault}{\rmdefault}{n}% fixed encoding 2025/04/07
    \SetMathAlphabet{\mathsf}{sans}{\encodingdefault}{\sfdefault}{m}{n}% \mathsf is upright.
\fi 

%%%%%%%%  Footers and Footnotes  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\AtBeginDocument{\edef\ac@EncodingMain{\encodingdefault}}
\ExplSyntaxOn
	\cs_new:Npn \ac@SetFont { 
		\fontencoding\ac@EncodingMain\selectfont
		\selectlanguage{english}% add english to deal with lualatex, 2025/03/18
    }
\ExplSyntaxOff

\fancyfoot{}
\fancyhead{}
\fancyfoot[CE,CO]{\ac@SetFont\thepage}% force encoding so that passages in some languages won't switch footer font from the main font.
\fancyfoot[RO,RE]{\ac@SetFont Copyright \textcopyright \the\year\ by ASME}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}

\ifasmeconf@govt
	\newgeometry{left=0.5in, right=0.5in, top=0.5in, bottom = 1.in, footskip = 0.3in, columnsep = 0.38in}
	\fancyfoot[RO,RE]{}
	\fancyfoot[CE,CO]{\ac@SetFont\thepage\\[1ex]\small This material is declared a work of the U. S.~Government and is not subject to copyright protection in the United States.\\Approved for public release; distribution is unlimited.}
\fi

\ifasmeconf@contractor
	\newgeometry{left=0.5in, right=0.5in, top=0.5in, bottom = 1.in, footskip = 0.3in, columnsep = 0.38in}
	\fancyfoot[RO,RE]{}
	\fancyfoot[CE,CO]{\ac@SetFont\thepage\\[1ex]\footnotesize The United States Government retains, and by accepting the article for publication, the publisher acknowledges that the United States Government retains, a non-exclusive, paid-up, irrevocable, worldwide license to publish or reproduce the published form of this work, or allow others to do so, for United States Government purposes.}
\fi

\ifasmeconf@govtsome
	\newgeometry{left=0.5in, right=0.5in, top=0.5in, bottom = 1.in, footskip = 0.3in, columnsep = 0.38in}
	\fancyfoot[RO,RE]{}
	\fancyfoot[CE,CO]{\ac@SetFont\thepage\\[1ex]\small This work was authored in part by a U. S. Government employee in the scope of his/her employment. ASME disclaims all interest in the U. S. Government's contribution.}
\fi

\ifasmeconf@nofoot
		\fancyfoot[RO,RE]{}
\fi

%%%%%% Footnotes %%%%%%%

\RequirePackage{footmisc}%
\IfPackageAtLeastTF{footmisc}{2022/02/05}{
	 	\PassOptionsToPackage{belowfloats}{footmisc}%
	}{	\RequirePackage{fnpos}% this package is not loaded if footmisc is up to date.
		\makeFNbottom
		\makeFNbelow
	}%
\setlength\footnotemargin{2ex}% reduce indentation of footnotes, from footmisc
\setlength{\skip\footins}{\baselineskip}% <=== per ASME, 1 extra line

\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 0.5in height 0.4pt
  \kern 2pt
}
    
%% include a comma for sequential footnotes. 2024/01/18
\ExplSyntaxOn
	\cs_new:Npn   \__asmeconf_NoteComma:n { \peek_meaning:NT \footnote { \textsuperscript{\mdseries,} } }
	\cs_new_eq:NN \__asmeconf_savefootnote: \footnote
	\cs_gset_protected:Npn \footnote #1    { \__asmeconf_savefootnote: {#1} \__asmeconf_NoteComma:n } 
\ExplSyntaxOff


%%%%%%%%%  Section headings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ASME specifies 10 pt headings

%% This approach is intended to avoid breaking tagging code, 2025/01/29
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {12pt \@plus 4pt \@minus 2pt}%
                                   {1pt \@plus 2pt \@minus 2pt}%
                                   {\mathversion{sansbold}\normalsize\bfseries\sffamily\raggedright\MakeTextUppercase}}
%                                   {\mathversion{sansbold}\normalsize\bfseries\sffamily\raggedright\MakeTextUppercase}}
\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
                                   {12pt \@plus 4pt \@minus 2pt}%
                                   {1pt \@plus 1pt \@minus 1pt}%
                                   {\mathversion{sansbold}\normalsize\bfseries\sffamily\raggedright}}
\renewcommand\subsubsection{\@startsection {subsubsection}{3}{\parindent}%
                                   {6pt \@plus 3pt \@minus 2pt}%
                                   {-0.5em}%
                                   {\mathversion{sansbold}\bfseries\normalsize\sffamily}}
\patchcmd{\thesection}{\@arabic\c@section}{\@arabic\c@section}{}{}
\patchcmd{\thesubsection}{\thesection.\@arabic\c@subsection}{\@arabic\c@section.\@arabic\c@subsection}{}{}
\patchcmd{\@seccntformat}{\quad}{.\hspace{0.5em}}{}{}
\patchcmd{\@ssect}{\relax #5}{\relax #5.}{}{}% only \subsubsection* will follow this path
\let\paragraph\subsubsection

\ExplSyntaxOn
\cs_new_protected:Nn \__asmeconf_change_hangindent: {
    \cs_if_exist:NT \@kernel@tag@hangfrom {
		  \cs_new_eq:NN  \__asmeconf_sav@kernel@tag@hangfrom \@kernel@tag@hangfrom
		  % modify command in latex-lab-sec
          \cs_gset_protected:Npn \@app@kernel@tag@hangfrom ##1
          {
            \tagstructbegin{ tag=\l__tag_para_tag_tl }
            \cs_if_exist_use:N \__tag_gincr_para_begin_int:
            \tagstructbegin{tag=Lbl}
            \setbox\@tempboxa
             \hbox
              {
                \bool_lazy_and:nnT
                { \tag_if_active_p: }
                { \g__tag_mode_lua_bool }
                { \tag_mc_begin:n { tag=Lbl } }
                {##1}
              }
            \tag_suspend:n{hangfrom}
        %   \hangindent \wd\@tempboxa\noindent %% changing this line only
            \hangindent 0pt\noindent
            \tag_resume:n{hangfrom}
            \tag_mc_begin:n {}\box\@tempboxa\tag_mc_end:\tagstructend\tag_mc_begin:n {}
          }
		  \cs_set_eq:NN  \@kernel@tag@hangfrom \@app@kernel@tag@hangfrom
	}
          \cs_new_eq:NN \__asmeconf_sav@hangfrom \@hangfrom
          \cs_gset_protected:Npn \@app@hangfrom ##1
          {
            \setbox\@tempboxa\hbox{{##1}}%
         %  \hangindent \wd\@tempboxa\noindent\box\@tempboxa} %% changing this line only
            \hangindent 0pt\noindent\box\@tempboxa
          }   
}
\renewcommand{\appendix}{
    \par
    \__asmeconf_change_hangindent:
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \gdef\thesection{\@Alph\c@section}
    \gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}
    \pretocmd{\section}{\gdef\@seccntformat##1{\appendixname\ \csname the##1\endcsname.\hspace{0.5em}}}{}{}
    \pretocmd{\section}{\def\@hangfrom{\@app@hangfrom}}{}{}
    \pretocmd{\section}{\def\@kernel@tag@hangfrom{\@app@kernel@tag@hangfrom}}{}{}
    \pretocmd{\subsection}{\gdef\@seccntformat##1{\csname the##1\endcsname.\hspace{0.5em}}}{}{}
    \pretocmd{\subsection}{\def\@hangfrom{\__asmeconf_sav@hangfrom}}{}{}
    \pretocmd{\subsection}{\def\@kernel@tag@hangfrom{\__asmeconf_sav@kernel@tag@hangfrom}}{}{}
}
\ExplSyntaxOff

%% Let's also add \footnote to the \TextUppercase exception list, so that footnote text won't be capitalized
%%   if given in a section heading. Ditto for \eqref
%
\ifx\AddToNoCaseChangeList\@undefined % updated 2022/07/03, see https://github.com/John02139/asmeconf/issues/5 
	\patchcmd{\@uclcnotmath}{\@nonchangecase\ref}{\@nonchangecase\ref\@nonchangecase\footnote\@nonchangecase\eqref}{\typeout{Asmeconf patched textcase nonchangecase to include footnote and eqref.}}{}
\else
    \AddToNoCaseChangeList{\eqref \footnote}
\fi


%%%%%%%%%%  Hyperref  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifpdftex
    %%% to assist with unicode glyph mapping, following M. Sharpe's recommendation in the newtx documentation. 
    %%% as of 2025/04/17, both are still necessary for \DocumentMetadata{pdfstandard=A-3u}.
    \InputIfFileExists{glyphtounicode-cmr.tex}{}{} 	%% additional mappings
    \InputIfFileExists{glyphtounicode-ntx.tex}{}{} 	%% additional mappings
\fi

\RequirePackage[psdextra]{hyperref} % recent kernel transition suggests providing most hyperref options via \hypersetup, 
									% but setting psdextra here (for additional math support in bookmarks) 2021/12/01
\hypersetup{%
	pdfborder={0 0 0},% 
	bookmarksnumbered=true,%
	bookmarksopen=true,
	bookmarksopenlevel=1,%
	linkcolor=blue, %
	citecolor=blue, % 
	urlcolor=blue,  %
	filecolor=red,  % added 2021/12/02, to make certain broken links more apparent
	pdfnewwindow=true,%
	pdfpagelayout=SinglePage,
	pdfdisplaydoctitle=true%
%	colorlinks=true,% <=== set true to get colored type, but do so via package options in .tex file
}
	
\urlstyle{same}     		  % don't switch to typewriter font for urls
\RequirePackage{doi}          % supports the nasty characters in some doi's
\renewcommand{\doitext}{DOI } % change to this from default value, {doi:}, per ASME specification

\providecommand*{\toclevel@subfigure}{1}% <== to address unknown bookmark level of subfigure. 2021/12/24
\providecommand\hrefurl[2]{\href{#1}{#2}}% in case no \DocumentMetadata{..}


%%% ==> recent development of \pdfstring removes all robust commands from bookmarks, so that
%%%     by early 2024, errors are not present; the following serve to suppress warnings.

%% Since \bm may be useful in headings, this fix will reduce frequency with which
%%    alternate pdfstrings must be given in revised section command as \section[pdfstring]{texstring}
\pdfstringdefDisableCommands{%
    \def\bm#1#{\relax}%
}

% Let's disable \( and \) in pdf bookmarks, 2020/02/28
\pdfstringdefDisableCommands{%
    \def\({\relax}%
    \def\){\relax}%
}

% Let's also make sure \NoCaseChange in section headings won't break pdf bookmarks
\pdfstringdefDisableCommands{%
      \let\NoCaseChange\relax%
}

% Let's just remove citations from pdf bookmarks
\pdfstringdefDisableCommands{%
    \def\cite{\@gobble}%
}

%% Ensure that tag color does not follow \eqref into bookmarks, 2020/02/28
\pdfstringdefDisableCommands{%
    \def\eqref#1{(\ref*{#1})}% \ref* is from hyperref
}

% Let's make sure footnotes in section headings don't break pdf bookmarks.
% Revised footnote command above is already robust
\pdfstringdefDisableCommands{%
  \def\footnote#1{}%
}

%%% There should be no errors for section headings with \(, \), \cite, \ref, \eqref, \label, \footnote, \NoCaseChange, or \bm 


%%%%%%%%%%%%%  CSS styling if the pdf is tagged and rendered into HTML  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOn
\cs_if_exist:NT \tag_if_active:T % not in TeX Live 2021
{
    \tag_if_active:T  % 2025/11/02
      { 
        % Can include some css to style the html-rendered document
        \msg_new:nnn    { \ClassName } { no_css_file } {I~can't~find~the~file~asmeconf-style.css.\iow_newline:
        This~optional~file~provides~css~style~if~the~tagged~pdf~is~rendered~into~html.~
        								You~can~ignore~this~warning~if~you~don't~want~styling.}
        \msg_new:nnn    { \ClassName } { css_file_loaded } {The~file~asmeconf-style.css~has~been~loaded.}
        \file_if_exist:nTF {asmeconf-style.css}
          {
		    \tagpdfsetup {
  			    css-list-add = { asmeconf-style.css } % attach this css to the pdf
			    }
			\msg_note:nn { \ClassName } { css_file_loaded } 
		  }{  
			\msg_note:nn { \ClassName } { no_css_file } 
		  }
	  }
}
\ExplSyntaxOff


%%%%%%%%%%%%%  Line numbering and balancing columns on last page  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Adjustments when [lineno] option is used
\ifasmeconf@lineno%
    \RequirePackage[switch,mathlines]{lineno}    
    \renewcommand{\linenumberfont}{\normalfont\footnotesize\color{red}} 
    \AtBeginDocument{\linenumbers}
    \ifasmeconf@balance
		\ClassWarningNoLine{\ClassName}{Package lineno loaded, so final column balancing will be disabled}%
	\fi
	%%% Patch to allow line numbering in AMS math environments.
	%%% This patch is for lineno versions earlier than v5.2 [2023/05/19]. As of mid-2023, the lineno package
	%%% 	has been corrected to account for the AMS math environments.  Retaining patch for backward compatibility.
	%%% postdisplaypenalty adjusted to avoid extra line number at end, see: https://tex.stackexchange.com/a/461192/ 
	\IfPackageAtLeastTF{lineno}{2023/05/19}{\relax}{
    	\NewDocumentCommand{\ac@losepostpenalty}{}{\patchcmd{\linenomathWithnumbers}{\advance\postdisplaypenalty\linenopenalty}{}{}{}}
    	%
        \NewDocumentCommand{\ac@FixAMSMath}{m}{%
        	\AtBeginEnvironment{#1}{\ac@losepostpenalty\linenomath}%
        	\AtEndEnvironment{#1}{\endlinenomath}%
        	\AtBeginEnvironment{#1*}{\ac@losepostpenalty\linenomath}%
        	\AtEndEnvironment{#1*}{\endlinenomath}%
        }
    	%
    	\NewDocumentCommand{\ac@FixAll}{>{\SplitList{;}}m}{\ProcessList{#1}{\ac@FixAMSMath}}
    	%
    	\ac@FixAll{align;alignat;gather;flalign;multline}
	}
\else
    \ProvideDocumentEnvironment{linenomath}{}{}{}%
    \ifasmeconf@balance
    	\RequirePackage{flushend}% flushend package is NOT compatible with lineno
    	\AtEndDocument{\flushcolsend}%
		\ClassNoteNoLine{\ClassName}{Calling flushend package to balance column height on last page}%
    \fi%
\fi
\providecommand{\@LN@col}[1]{\relax}% Enable dropping lineno option without needing to trash .aux file
\providecommand{\@LN}[2]{\relax}


%%%%%%%%%%%%%  Define special environments  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Introduce some special section and other names %%%%%%%%%%%

\providecommand{\nomname}{Nomenclature}  
\providecommand{\keywordname}{Keywords}
%\providecommand{\appendicesname}{APPENDICES} % no longer used, 2025/04/11
\providecommand{\JAwords}{Joint~first~authors}
\providecommand{\CAwords}{Corresponding~author}

%%  Abstract environment  %%%%%%%%%%%%%%%%%%
%%  \keywords command should be given someplace before the \end{abstract} command.

\ExplSyntaxOn

\tl_new:N \g_asmeconf_keywords_tl
\cs_new_protected:Nn \__asmeconf_gset_keywords:n
	{
	  \tl_gset:Nn \g_asmeconf_keywords_tl { #1 }
	}
\NewDocumentCommand{\keywords}{m}{
	  \__asmeconf_gset_keywords:n { #1} 
    }

\cs_new:Nn \__asmeconf_keywords:
	{ 
	\tl_if_blank:VTF \g_asmeconf_keywords_tl
		{ 
		  \scan_stop: 
		}
		{
			\par
			\skip_vertical:n { 3pt plus 1pt minus 1pt }
			\noindent
			\upshape
    		\tag_struct_begin:n { tag=Strong }
        	\tag_mc_begin:n     { tag=Strong }
    			{\sffamily
        			{ \bfseries \keywordname : }~ 
    			}
        		\g_asmeconf_keywords_tl
    		\tag_mc_end:
   			\tag_struct_end:
			\par
		}
	}

\DeclareDocumentEnvironment{abstract}{+b}{% Overwrites default abstract environment
	\section*{\abstractname}\itshape
	#1
	}
	{
		\__asmeconf_keywords: 
		\par\ignorespacesafterend
	}
\ExplSyntaxOff
	
\NewDocumentEnvironment{abstract*}{+b}{% Abstract with no keywords (same as using empty \keywords{} with abstract env.)
	\section*{\abstractname}\itshape
	#1
	}
	{
	\par\ignorespacesafterend % \par needed to present spurious vertical space after full line in lualatex, 2025/03/18
	}

%%   Nomenclature environment  %%%%%%%%%%%%%%%%%%
%%

\newlength\nomenwidth
\newlength\savitemsep

\NewDocumentCommand\entry{m m}{% simplified greatly 2024/01/18
             \item[#1\hfill]#2%
             \@itempenalty=-\@lowpenalty
}

%% A separate command command for nomenclature subheadings 
\NewDocumentCommand\EntryHeading{m}{%
	\itemsep3\p@ plus 1\p@ minus 1\p@
    \goodbreak\item[\emph{#1}\hfill]\mbox{}%
    \setlength{\itemsep}{\savitemsep}\@itempenalty=1000	
}

%%   Increase first optional argument to a dimension > 2em if wide entries cause undesired misalignment of columns. 
%%   Second optional argument can be used to rename the environment, e.g., to List of Symbols.
\NewDocumentEnvironment{nomenclature}{O{2em} O{\nomname}}{%
		\setlength{\columnsep}{2em} 
        \setlength{\nomenwidth}{#1}
        \section*{#2}
        \raggedright
        \begin{list}{}{%
             \setlength{\itemsep}{0pt}%
             \setlength{\parsep}{\itemsep}%
             \setlength{\labelsep}{1em}%
             \setlength{\labelwidth}{\nomenwidth}%
             \setlength{\leftmargin}{\labelwidth}%
             \addtolength{\leftmargin}{\labelsep}%
			 \setlength{\savitemsep}{\itemsep}%
        }%
}{\end{list}
  \ignorespacesafterend
}


%%%%%%%%%%%%%%%%%  Headers and Title  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOn

\tl_new:N   \g__asmeconf_confname_tl	
\tl_gset:Nn \g__asmeconf_confname_tl    { {\itshape Missing~conference~name!}    }
\tl_new:N   \g__asmeconf_confacronym_tl
\tl_gset:Nn \g__asmeconf_confacronym_tl { {\itshape Missing~conference~acronym!} }
\tl_new:N   \g__asmeconf_confdate_tl
\tl_gset:Nn \g__asmeconf_confdate_tl    { {\itshape Missing~conference~date!}    }
\tl_new:N   \g__asmeconf_confcity_tl
\tl_gset:Nn \g__asmeconf_confcity_tl    { {\itshape Missing~conference~city!}    }
\tl_new:N   \g__asmeconf_papernumber_tl
\tl_gset:Nn \g__asmeconf_papernumber_tl { Add~paper~number                       }
\tl_new:N   \g__asmeconf_papertitle_tl
\tl_gset:Nn \g__asmeconf_papertitle_tl  { {\itshape Missing~title!}  }

\NewDocumentCommand\ConfName{m}{ \tl_gset:Nn \g__asmeconf_confname_tl { \tl_trim_spaces:n {#1} } }
\NewDocumentCommand\ConfDate{m}{ \tl_gset:Nn \g__asmeconf_confdate_tl { \tl_trim_spaces:n {#1} } }
\NewDocumentCommand\ConfCity{m}{ \tl_gset:Nn \g__asmeconf_confcity_tl { \tl_trim_spaces:n {#1} } }
\NewDocumentCommand\ConfAcronym{m}{ 
	\tl_gset:Nn \g__asmeconf_confacronym_tl { \tl_trim_spaces:n \str_uppercase:f {#1} }
}
\NewDocumentCommand\PaperNo{m}{  
	\tl_gset:Nn \g__asmeconf_papernumber_tl { \tl_trim_spaces:n \str_uppercase:f {#1} } 
}

\cs_new_protected:Nn \__asmeconf_gset_papertitle:n {
	\tl_gset:Nn \g__asmeconf_papertitle_tl { \tl_trim_spaces:n {#1} }
	\gdef\@title{#1}% added 2024/07/28, use \gdef for consistency with other latex usage
}

\cs_new:Nn \__asmeconf_nbaseline_skip:n {
 	\skip_vertical:n { #1\baselineskip } 
}

\tagpdfsetup { role/user-NS = asmeconf }
\tagpdfsetup { role/new-tag = { Conference_information/Div } }
\cs_new:Nn \__asmeconf_headertitle: {
	\begingroup\bfseries\sffamily
    \ifasmeconf@nohead
		\__asmeconf_nbaseline_skip:n {5}
		{ \LARGE \hbox:n { } \__asmeconf_nbaseline_skip:n {1} }
		\__asmeconf_nbaseline_skip:n {3}
	\else
     	\tag_struct_begin:n { tag=Conference_information }
    	\parbox{\linewidth}{
    		\raggedleft
    		\g__asmeconf_confname_tl \par
    		\g__asmeconf_confacronym_tl \par
    		\g__asmeconf_confdate_tl ,\c_space_tl \g__asmeconf_confcity_tl
        }
        \par\tag_struct_end:
    	\__asmeconf_nbaseline_skip:n {2}
    	\tag_struct_begin:n{tag=Div, title=Paper~number}
    	\parbox{\linewidth}{\raggedleft\LARGE
    		\g__asmeconf_papernumber_tl
        }
        \par\tag_struct_end:
    	\__asmeconf_nbaseline_skip:n {3}
	    
   	\fi
	\tag_struct_begin:n{tag=Title, title=Title}
	\parbox{\linewidth}{\mathversion{sansbold}\centering{\large
		\MakeTextUppercase{ \g__asmeconf_papertitle_tl }\par}% <=== Extra \par makes the font leading stick. See adjustment in \MakeTitle. 
	}												   %      Using \MakeTextUppercase to enable \NoCaseChange when it's needed.
	\endgroup
    \tag_struct_end:
}

%%%%%%%%%%%   Author and affiliation block  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Inline author style resets the footnote mark; save the definitions so we can restore them later
\cs_gset_eq:NN \savethefootnote \thefootnote
\cs_gset_eq:NN \savemakefnmark  \@makefnmark

%% Flag for joint first authors (two or more)
\bool_new:N \g__asmeconf_JA_bool

\NewDocumentCommand{\JointFirstAuthor}{}{%
	\bool_gset_true:N \g__asmeconf_JA_bool
    \ifac@fontspec
      	$^{\textbf{\textrm{\dagger}}}$\ignorespaces
    \else
      	$\bm{^\dagger}$\ignorespaces % \ignorespaces is ignored due to code for commas in successive footnotes, below.
    \fi
}
%% Flag for corresponding author (expecting just one, but if two enter both email addresses and flag both authors)
\bool_new:N \g__asmeconf_CA_bool

% backward compatibility
\cs_if_exist:NF \str_case_e:enTF { \cs_generate_variant:Nn \str_case_e:nnTF {enTF} }

\tl_new:N  \g__asmeconf_CAsep_tl
\tl_new:N  \g__asmeconf_CAemail_tl
\NewDocumentCommand\CorrespondingAuthor{>{\TrimSpaces} m}{% Revised 2020/12/29 (make CA email mandatory but possibly empty); edit 2025/01/27
	\bool_gset_true:N \g__asmeconf_CA_bool
	\tl_if_blank:nTF {#1} {
         \tl_gset:Nn \g__asmeconf_CAsep_tl   { \scan_stop: }
         \tl_gset:Nn \g__asmeconf_CAemail_tl { \scan_stop: }
         }{
         \tl_gset:Nn \g__asmeconf_CAsep_tl   { :\space }
         \tl_gset:Nn \g__asmeconf_CAemail_tl { #1 }
	}
	\ifac@fontspec % modified 2025/03/16 to deal with occasional tofu; likely to need additional options for other scripts
		\str_case_e:enTF { \g__asmeconf_main_str }
		{
			{greek}{} {russian}{} {ukrainian}{} {serbianc}{} {macedonian}{} {belarusian}{} {bulgarian}{}
		}
		{ {\mathversion{bold}$^{\ast}$}\ignorespaces }
		{ \ifac@japanese% shouldn't be needed, but it is...2025/03/26
				\mathversion{bold}$^{\ast}$\ignorespaces
			\else
				$^{\textbf{\textrm{\ast}}}$\ignorespaces 
			\fi
		}
 	\else
      	$\bm{^\ast}$\ignorespaces %\ignorespaces is ignored due to code for commas in successive footnotes, below.
	\fi
}
\ExplSyntaxOff

%%%% option to use the traditional grid layout of authors or the inline style

\ifasmeconf@grid
	\ClassNoteNoLine{\ClassName}{Selected option for a grid of author blocks}%
    
    %%%%%%%%%%%%%%%%%%%%  Gridded author layout  %%%%%%%%%%%%%%%%%%%%%%%%%
	%%
	%% converted to expl3 18 August 2024

	\ExplSyntaxOn
    %% Allows for up to fifteen author blocks.
    \coffin_new:N \g__asmeconf_authorblock_coffin
    \coffin_new:N \g__asmeconf_firstrowauthorblock_coffin
    \coffin_new:N \g__asmeconf_secondrowauthorblock_coffin
    \coffin_new:N \g__asmeconf_thirdrowauthorblock_coffin
    \coffin_new:N \g__asmeconf_fourthrowauthorblock_coffin
    \coffin_new:N \g__asmeconf_fifthrowauthorblock_coffin

	\dim_new:N    \g__asmeconf_coffinsep_dim 
	\dim_gset:Nn  \g__asmeconf_coffinsep_dim { 0.03\textwidth }

	\dim_new:N    \g__asmeconf_authorblockwidth_dim 
	\dim_gset:Nn  \g__asmeconf_authorblockwidth_dim { 0.3\textwidth }

	\seq_new:N    \g__asmeconf_author_seq
	\seq_new:N    \g__asmeconf_authoraffil_seq
	\seq_new:N    \g__asmeconf_affiliation_seq


    \int_gzero_new:N  \g__asmeconf_authorcnt_int
    
    \NewDocumentCommand\SetAuthors{>{\SplitList{,}}m}{
    	\ProcessList{#1}{ \__asmeconf_gset_author:n }
		}
	\cs_new_protected:Nn \__asmeconf_gset_author:n
     {
    	\int_gincr:N        \g__asmeconf_authorcnt_int
    	\tl_if_empty:nT {#1} { 
			\msg_warning:nn { \ClassName } { missingauthor } 
    	}
		\seq_gput_right:Nn  \g__asmeconf_author_seq      {#1}
		\__asmeconf_stripaffilnumber:n { #1 }
		\seq_gput_right:Nn  \g__asmeconf_affiliation_seq { \c_empty_tl } % clear sequence for later use	
		\seq_gput_right:NV  \g__asmeconf_authoraffil_seq \g__asmeconf_affiltagno_int 	
	 }
	\msg_new:nnn { \ClassName } { missingauthor } { Missing~author~name,~check~for~extra~comma~in~\SetAuthors! }

	%% The following captures the affiliation tag number from the \SetAuthors command.
	%% It would be simpler to replace \affil{#} by an additional _argument_ in \SetAuthors; 
	%%    however, legacy syntax seem pretty locked in...
    \int_gzero_new:N \g__asmeconf_affiltagno_int
    \cs_new_protected:Nn \__asmeconf_stripaffilnumber:n
      {
	    \int_zero_new:N \l__asmeconf_affil_flag_int
        \tl_set:Nn \l_tmpa_tl { #1 }
        \tl_map_inline:Nn \l_tmpa_tl
          {
%          \int_if_zero:nTF { \l__asmeconf_affil_flag_int }  % not added to expl3 until 2023-05-17
		   \int_compare:nTF { \l__asmeconf_affil_flag_int = 0 } 
            {
            \tl_if_eq:nnT { ##1 } { \affil } { \int_incr:N \l__asmeconf_affil_flag_int  }
            }{
              \tl_map_break:n { 
                \tl_if_blank:nTF { ##1 }
                { 
                	\msg_error:nn { \ClassName } { missingaffilno } 
                }{
                  	\int_gset:Nn \g__asmeconf_affiltagno_int { ##1 }
					\int_set:Nn  \l__asmeconf_affil_flag_int {0} 
                }
              }
            }
          }
      }
    \NewDocumentCommand\affil{m}{}
	\msg_new:nnn { \ClassName } { missingaffilno } { Missing~number~in~\affil{..}~tag! }
      
    \NewDocumentCommand\SetAffiliation{mm}{
    	\__asmeconf_gset_affiliation:nn {#1}{#2}
		}
	\cs_new_protected:Nn \__asmeconf_gset_affiliation:nn
    	{
 		\seq_gset_item:Nnn  \g__asmeconf_affiliation_seq {#1} {#2} % this command added to L3 2021/04/29
    	}
    
	\cs_new:Nn \__asmeconf_setauthorblock: {
    	\int_zero_new:N \l__asmeconf_authorno_int
		\int_zero_new:N \l__asmeconf_authoraffilno_int
	    \tl_clear:N     \l_tmpa_tl
		\int_while_do:nNnn { \l__asmeconf_authorno_int } < { \g__asmeconf_authorcnt_int } { % starting with authorno = 0 ensures we reach authorcnt with +1
			\int_incr:N \l__asmeconf_authorno_int
            \centering\vcoffin_gset:Nnn \g__asmeconf_authorblock_coffin { \dim_use:N \g__asmeconf_authorblockwidth_dim } {
            	\sffamily
            	\textbf{ \seq_item:Nn \g__asmeconf_author_seq { \l__asmeconf_authorno_int }} \\
					\int_set:Nn \l__asmeconf_authoraffilno_int { \seq_item:Nn  \g__asmeconf_authoraffil_seq  { \l__asmeconf_authorno_int } }
					\tl_set:Nn  \l_tmpa_tl { \seq_item:Nn \g__asmeconf_affiliation_seq { \l__asmeconf_authoraffilno_int } }  
					\tl_if_empty:NTF \l_tmpa_tl
						{ \msg_warning:nnV { \ClassName } { missingaffiliation } { \l__asmeconf_authorno_int } 
						}{
						\l_tmpa_tl
						}
        			\par
			}
			\int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 1 } {
				\coffin_gjoin:NnnNnnnn \g__asmeconf_firstrowauthorblock_coffin { r } { t } 
					\g__asmeconf_authorblock_coffin { l } { t } { 0pt} { 0pt } 
				}
				{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 2 }  {
					\coffin_gjoin:NnnNnnnn \g__asmeconf_firstrowauthorblock_coffin { r } { t } 
						\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
                	}
                 	{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 3 }  {
						\coffin_gjoin:NnnNnnnn \g__asmeconf_firstrowauthorblock_coffin { r } { t } 
							\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
                  		}
            			{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 4 } {
            				\coffin_gjoin:NnnNnnnn \g__asmeconf_secondrowauthorblock_coffin { r } { t } 
            					\g__asmeconf_authorblock_coffin { l } { t } { 0pt} { 0pt } 
            				}
            				{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 5 } {
            					\coffin_gjoin:NnnNnnnn \g__asmeconf_secondrowauthorblock_coffin { r } { t } 
            						\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
            					}
            					{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 6 } {
            						\coffin_gjoin:NnnNnnnn \g__asmeconf_secondrowauthorblock_coffin { r } { t } 
            							\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
            						}
                        			{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 7 } {
                        				\coffin_gjoin:NnnNnnnn \g__asmeconf_thirdrowauthorblock_coffin { r } { t } 
                        					\g__asmeconf_authorblock_coffin { l } { t } { 0pt} { 0pt } 
                        				}
                        				{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 8 } {
                        					\coffin_gjoin:NnnNnnnn \g__asmeconf_thirdrowauthorblock_coffin { r } { t } 
                        						\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
                        					}
                        					{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 9 } {
                        						\coffin_gjoin:NnnNnnnn \g__asmeconf_thirdrowauthorblock_coffin { r } { t } 
                        							\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
                        						}
                                				{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 10 } {
                                					\coffin_gjoin:NnnNnnnn \g__asmeconf_fourthrowauthorblock_coffin { r } { t } 
                                						\g__asmeconf_authorblock_coffin { l } { t } { 0pt} { 0pt } 
                                					}
                                					{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 11 } {
                                						\coffin_gjoin:NnnNnnnn \g__asmeconf_fourthrowauthorblock_coffin { r } { t } 
                                							\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
                                						}
                                						{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 12 } {
                                							\coffin_gjoin:NnnNnnnn \g__asmeconf_fourthrowauthorblock_coffin { r } { t } 
                                								\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
                                							}
                                                			{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 13 } {
                                                				\coffin_gjoin:NnnNnnnn \g__asmeconf_fifthrowauthorblock_coffin { r } { t } 
                                                					\g__asmeconf_authorblock_coffin { l } { t } { 0pt} { 0pt } 
                                                				}
                                                				{ \int_compare:nNnTF { \l__asmeconf_authorno_int } =  { 14 } {
                                                					\coffin_gjoin:NnnNnnnn \g__asmeconf_fifthrowauthorblock_coffin { r } { t } 
                                                						\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
                                                					}
                                                					{ \int_compare:nNnT { \l__asmeconf_authorno_int } =  { 15 } {
                                                						\coffin_gjoin:NnnNnnnn \g__asmeconf_fifthrowauthorblock_coffin { r } { t } 
                                                							\g__asmeconf_authorblock_coffin { l } { t } { \dim_use:N \g__asmeconf_coffinsep_dim } { 0pt } 
                                                					}
                                                				}
                                                			}
                                						}
                                					}
                        						}
                        					}
										}
            						}
            					}
							}
						}
					}
				}
			}
			\int_compare:nNnT { \l__asmeconf_authorno_int } >  { 15 } {
				\msg_error:nn { \ClassName } { toomanyforgrid }
    		}
    	}% end loop
	}
	\msg_new:nnnn { \ClassName } { missingaffiliation } { Missing~affiliation~for~author~no.~#1! } {#1}
	\msg_new:nnnn { \ClassName } { toomanyforgrid }     { The~class~is~programmed~for~a~maximum~of~15~author~blocks.} 
			{ For~authors~at~the~same~institution,\ you~may~put~more~than~one~name~above~a~single~address.\ 
			Else~use~the~in-line~author~style,\ not~the~[grid]~option.} 

    % backward compatibility
    \cs_if_exist:NF \tl_set:Ne  { \cs_generate_variant:Nn \tl_set:Nn {Ne} }

	\cs_new:Nn \__asmeconf_constructauthorblock: {
     	\int_compare:nNnT { \g__asmeconf_authorcnt_int } >  { 3 } {
   			\coffin_gjoin:NnnNnnnn \g__asmeconf_firstrowauthorblock_coffin { hc } { b } \g__asmeconf_secondrowauthorblock_coffin { hc } { t } { 0pt } { -1.5\baselineskip } 
        }
     	\int_compare:nNnT { \g__asmeconf_authorcnt_int } >  { 6 } {
   			\coffin_gjoin:NnnNnnnn \g__asmeconf_firstrowauthorblock_coffin { hc } { b } \g__asmeconf_thirdrowauthorblock_coffin { hc } { t } { 0pt } { -1.5\baselineskip } 
        }
     	\int_compare:nNnT { \g__asmeconf_authorcnt_int } >  { 9 } {
   			\coffin_gjoin:NnnNnnnn \g__asmeconf_firstrowauthorblock_coffin { hc } { b } \g__asmeconf_fourthrowauthorblock_coffin { hc } { t } { 0pt } { -1.5\baselineskip } 
        }
     	\int_compare:nNnT { \g__asmeconf_authorcnt_int } >  { 12 } {
   			\coffin_gjoin:NnnNnnnn \g__asmeconf_firstrowauthorblock_coffin { hc } { b } \g__asmeconf_fifthrowauthorblock_coffin { hc } { t } { 0pt } { -1.5\baselineskip } 
        }
		\coffin_typeset:Nnnnn \g__asmeconf_firstrowauthorblock_coffin { l }{ t }{ 0pt }{ 0pt }
        \__asmeconf_gset_concataut:
        \cs_gset:Npn \@author { \tl_use:N \g_asmeconf_authors_tl }
    }

    % backward compatibility
    \cs_if_exist:NF \seq_item:NV  { \cs_generate_variant:Nn \seq_item:Nn {NV} }
    
    % build comma-separated list of author names
 	\tl_new:N     \g_asmeconf_authors_tl
 	\tl_gset:NV   \g_asmeconf_authors_tl \c_empty_tl
    \cs_new_protected:Nn \__asmeconf_gset_concataut: { 
    	\int_set:Nn  \l_tmpa_int {1}
		\tl_clear:N \l_tmpb_tl 
	    \int_do_until:nNnn { \l_tmpa_int } > { \g__asmeconf_authorcnt_int }
    		{
			    \tl_set:Ne  \l_tmpb_tl { \seq_item:NV \g__asmeconf_author_seq \l_tmpa_int }
            	\regex_replace_all:nnN  { \cA\~ } {\ } \l_tmpb_tl % replace ~ by space in author list
            	\tl_replace_all:Nnn \l_tmpb_tl { \affil } { \use_none:n  }
            	\tl_remove_all:Nn   \l_tmpb_tl { \JointFirstAuthor }
            	\tl_replace_all:Nnn \l_tmpb_tl { \CorrespondingAuthor } { \use_none:n }
        		\int_compare:nNnT   { \l_tmpa_int } < { \g__asmeconf_authorcnt_int } {
            		\tl_put_right:Nn \l_tmpb_tl { ,~ }
        		}
			    \tl_gput_right:NV  \g_asmeconf_authors_tl \l_tmpb_tl
				\int_incr:N  \l_tmpa_int  
    		}
			%\iow_term:e { Authors:~ \tl_use:N \g_asmeconf_authors_tl } % diagnostic only		
    }
	\ExplSyntaxOff
	   
%%% otherwise use the new compact layout of authors
\else
	%%%%%%%%%%%%%%%%%%%%%%   Inline author layout  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%
	%% converted to expl3, 17 August 2024; revised 27 January 2025
	
	\ExplSyntaxOn
    \coffin_new:N \g__asmeconf_authorblock_coffin
    \coffin_new:N \g__asmeconf_affiliationblock_coffin
    \coffin_new:N \g__asmeconf_affiliationsblock_coffin

    \cs_if_exist:NF \cs_gset:Npe  { \cs_generate_variant:Nn \cs_gset:Npn {Npe} } % needed through 2023    
	\tl_new:N \g_asmeconf_formattedauthors_tl
    \NewDocumentCommand\SetAuthors{m}{
		\tl_gset:Nn \g_asmeconf_formattedauthors_tl 
         {
	         \centering\sffamily\bfseries #1
	     }
	         \__asmeconf_gset_stripauttokens:n {#1}
	  		 \cs_gset:Npe \@author { \tl_use:N \g_asmeconf_authors_tl } % set \@author = list of authors, 2024/07/31
    }

    %% strip \affil{..}, \JointFirstAuthor, \CorrespondingAuthor{...} from argument
    \cs_new_protected:Nn  \__asmeconf_gset_stripauttokens:n { 
        \tl_set:Nn \l_tmpa_tl {#1}
		\regex_replace_all:nnN  { \cA\~ } {\ } \l_tmpa_tl % replace ~ by space in author list
    	\tl_remove_all:Nn   \l_tmpa_tl { \JointFirstAuthor }
		\tl_replace_all:Nnn \l_tmpa_tl { \affil } { \use_none:n }
		\tl_replace_all:Nnn \l_tmpa_tl { \CorrespondingAuthor } { \use_none:n }
        \tl_new:N   \g_asmeconf_authors_tl	
		\tl_gset:NV \g_asmeconf_authors_tl \l_tmpa_tl
		% \iow_term:e { \tl_use:N \g_asmeconf_authors_tl }% diagnostic only
    }   
    
    \cs_gset:Npn \@makefnmark { \hbox{ \@textsuperscript{ \sffamily\@thefnmark } } }

    \seq_gclear_new:N \g__asmeconf_affiliations_seq
    \NewDocumentCommand\SetAffiliation{mm}{
       \tl_if_blank:nTF {#1}
       {
       		\seq_gput_right:Nn \g__asmeconf_affiliations_seq { \centering\sffamily \tl_trim_spaces:n{ #2 } }%
		}{
		    \seq_gput_right:Nn \g__asmeconf_affiliations_seq { \centering\NoHyper\footnotemark[#1]\endNoHyper\sffamily\tl_trim_spaces:n{ #2 } }%
    	}
	}
            
	%%% Affiliation mark
		\msg_new:nnn { \ClassName } { missingaffilno } { Missing~number~in~an~\affil~tag! }
        \NewDocumentCommand{\affil}{>{\TrimSpaces} m}{
       \tl_if_blank:nTF {#1}
       {
			\msg_warning:nn { \ClassName } { missingaffilno } 
			\use_none:n % addresses modification for commas
        }{
        	\kern0.5pt\bfseries\NoHyper\footnotemark[#1]\endNoHyper
		}
    }
          
 	%%% to deal with sequential notes as, e.g., "1,*", or "1,2,*" %%%%%%%%%%
    \cs_new:Npn   \__asmeconf_OtherNoteComma:n { 
    	\peek_remove_spaces:n { % added 2025/01/27
    		\peek_meaning:NTF \affil 
				{ \textsuperscript{\mdseries,} }
				{ \peek_meaning:NTF \CorrespondingAuthor 
							{ \textsuperscript{\mdseries,} } 
    						{ \peek_meaning:NT \JointFirstAuthor { \textsuperscript{\mdseries,} } }
			}
		}
	}
    \cs_new_eq:NN \__asmeconf_saveAF: \affil
    \cs_gset_protected:Npn \affil #1               { \__asmeconf_saveAF: {#1} \__asmeconf_OtherNoteComma:n } 
    \cs_new_eq:NN \__asmeconf_saveCA: \CorrespondingAuthor
    \cs_gset_protected:Npn \CorrespondingAuthor #1 { \__asmeconf_saveCA: {#1} \__asmeconf_OtherNoteComma:n  } 
    \cs_new_eq:NN \__asmeconf_saveJA: \JointFirstAuthor
    \cs_gset_protected:Npn \JointFirstAuthor       { \__asmeconf_saveJA:     \__asmeconf_OtherNoteComma:n }  

	%%% 
	%% next construct author/affiliation coffin 
	\int_zero_new:N   \g_asmeconf_count_affil_int
	\cs_new:Nn \__asmeconf_constructauthorblock: {
        \leavevmode
        \tagpdfparaOff % this pair of tagpdf macros may change over time, 2025/01/28
%           \vcoffin_gset:Nnn \g__asmeconf_authorblock_coffin {\textwidth} % switched to vcoffin to accommodate tagging, 2024/10/16 
%           		{ \tl_use:N \g_asmeconf_formattedauthors_tl }
    		\seq_remove_duplicates:N \g__asmeconf_affiliations_seq
    		\int_gset:Nn \g_asmeconf_count_affil_int {\seq_count:N \g__asmeconf_affiliations_seq}
    		\int_zero_new:N  \l__asmeconf_affilno_int
    		\int_until_do:nNnn { \l__asmeconf_affilno_int } > { \g_asmeconf_count_affil_int } {
    	        \vcoffin_set:Nnn \g__asmeconf_affiliationblock_coffin { \textwidth } {
    	        	\seq_item:Nn \g__asmeconf_affiliations_seq { \l__asmeconf_affilno_int }
            	}
            \coffin_gjoin:NnnNnnnn \g__asmeconf_affiliationsblock_coffin { hc } { b } \g__asmeconf_affiliationblock_coffin {hc } { t } { 0pt} { -1pt }
            \int_incr:N \l__asmeconf_affilno_int
    		}
%% separate author from affiliation, 2025/11/04, for tagging/css purposes
%           \coffin_gjoin:NnnNnnnn \g__asmeconf_authorblock_coffin { hc } { b } \g__asmeconf_affiliationsblock_coffin {hc } { t } { 0pt} { -\baselineskip } 
%           \coffin_typeset:Nnnnn  \g__asmeconf_authorblock_coffin { l }{ T }{ 0pt }{ 0pt }
           \coffin_typeset:Nnnnn  \g__asmeconf_affiliationsblock_coffin { l }{ T }{ 0pt }{ 0pt }
		   \tagpdfparaOn\par
    }
    \ExplSyntaxOff
\fi % end if...else for grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Make the title and author section
\ExplSyntaxOn

\tagpdfsetup { role/new-tag = { Author_affiliation/Div } }
\tagpdfsetup { role/new-tag = { Affiliation/Div } }
\cs_new:Nn \__asmeconf_maketitlepage: { % 2025/03/11, removed \MakeTitlePage
    \twocolumn[
		  \__asmeconf_headertitle:
          \__asmeconf_nbaseline_skip:n {2}
          \ifasmeconf@grid
	        \par\tag_struct_begin:n { tag=Author_affiliation }
          	\__asmeconf_setauthorblock:
			\__asmeconf_constructauthorblock:
		    \par\tag_struct_end:
          \else
          	\parbox{ \linewidth }{ \centering \g_asmeconf_formattedauthors_tl }\par
	        \tag_struct_begin:n { tag=Affiliation }
			\__asmeconf_constructauthorblock:
			\tag_struct_end:
          \fi
          \__asmeconf_nbaseline_skip:n {3}
    ]
	\cs_gset_eq:NN \@makefnmark \savemakefnmark % restore footnote mark font
    \cs_gset:Npn \thefootnote { \fnsymbol{footnote} }
    \bool_if:NT \g__asmeconf_JA_bool { \footnotetext[2]{\JAwords} }
    \bool_if:NT \g__asmeconf_CA_bool 
    	{
          \footnotetext[1]{\CAwords\g__asmeconf_CAsep_tl\g__asmeconf_CAemail_tl}
        }
	\cs_gset_eq:NN \thefootnote \savethefootnote % restore footnote symbol
}


%% Redefine titling commands from standard LaTeX article class
\RenewDocumentCommand{\maketitle}{}{ \__asmeconf_maketitlepage:    }
\RenewDocumentCommand{\title}{m}{    \__asmeconf_gset_papertitle:n {#1} }

\ExplSyntaxOff

\RenewDocumentCommand{\thanks}{m}{\relax}% disabling this standard command (inconsistent with this format)

%% \versionfootnote produces an unmarked footnote about the version date, to replace "date"
%% This tool is for editing and should not be used in the final draft

%% This form provides working hyperlink, but it throws warning; also, \gdef -->\def. 2021/12/09
%\NewDocumentCommand\versionfootnote{m}{\def\@thefnmark{}\@footnotetext{#1}}

%% A hyperlink in this footnote will not function, since NoHyper is used to suppress 'missing anchor' warning
\NewDocumentCommand\versionfootnote{m}{\def\@thefnmark{}\begin{NoHyper}\@footnotetext{#1}\end{NoHyper}}

\RenewDocumentCommand{\date}{m}{\versionfootnote{#1}}% if one wants to use \date this same way; fixed bug 2021/01/14


%%%%%%%%%%%%%%  THE REST OF THE CODE DEALS WITH FONTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%  Sans serif upright greek and sans mathversion  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% revised 2025/03/23
%
\ifac@fontspec
    \IfFontExistsTF{LeteSansMath-Bold}
    {
        \def\ac@sansgreek{\symlsmgreek}
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
    \Umathchardef\sfphi="0     \ac@sansgreek "03C6 
    \Umathchardef\sfchi="0     \ac@sansgreek "03C7 
    \Umathchardef\sfpsi="0     \ac@sansgreek "03C8 
    \Umathchardef\sfomega="0   \ac@sansgreek "03C9
    %
    % character variants
    \Umathchardef\sfvartheta="0  \ac@sansgreek "03D1
    \Umathchardef\sfvarphi="0    \ac@sansgreek "03D5
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
    \Umathchardef\sfbfphi="0     \ac@sansgreek "1D6D7
    \Umathchardef\sfbfchi="0     \ac@sansgreek "1D6D8
    \Umathchardef\sfbfpsi="0     \ac@sansgreek "1D6D9
    \Umathchardef\sfbfomega="0   \ac@sansgreek "1D6DA    
	%
    % character variants, bold
    \Umathchardef\sfbfepsilon="0  \ac@sansgreek "1D6DC % this is the lunate form
    \Umathchardef\sfbfvartheta="0 \ac@sansgreek "1D6DD
    \Umathchardef\sfbfvarkappa="0 \ac@sansgreek "1D6DE 
    \Umathchardef\sfbfvarphi="0   \ac@sansgreek "1D6DF
    \Umathchardef\sfbfvarrho="0   \ac@sansgreek "1D6E0
	\Umathchardef\sfbfvarpi="0    \ac@sansgreek "1D6E1
    %
\else
    %% Provide sans-serif *upright* Greek letters, following a suggestion by Michael Sharpe (March 2019).
    %% Following Sharpe's newtxsf implementation of the STIX fonts, under the LaTeX Project Public License.
    %% (Note that \mathversion{sansbold} provides sans-serif *italic* Greek letters.) Various edits 2021/01/25
    
    \DeclareSymbolFont{lettersAB}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{lettersAB}{normal}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{lettersAB}{bold}{U}{ntxsfmia}{b}{it}
    \SetSymbolFont{lettersAB}{sans}{U}{ntxsfmia}{b}{it}% added 2025/04/18
    \SetSymbolFont{lettersAB}{sansbold}{U}{ntxsfmia}{b}{it}% added 2021/01/25, to get this bold in captions, etc.
    
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
    
    \DeclareMathSymbol{\sfvarpi}{\mathord}{lettersAB}{36}% added these 2021/01/25
    \DeclareMathSymbol{\sfvarrho}{\mathord}{lettersAB}{37}
    \DeclareMathSymbol{\sfvarsigma}{\mathord}{lettersAB}{38}
    \DeclareMathSymbol{\sfvarphi}{\mathord}{lettersAB}{39}
    \DeclareMathSymbol{\sfitvarkappa}{\mathalpha}{lettersAB}{40}
    \DeclareMathSymbol{\sfvarkappa}{\mathalpha}{lettersAB}{40}
    \DeclareMathSymbol{\sfitnabla}{\mathalpha}{lettersAB}{42}
    \DeclareMathSymbol{\sfnabla}{\mathalpha}{lettersAB}{43}
    \DeclareMathSymbol{\sfhslash}{\mathalpha}{lettersAB}{52}% this is not upright
    \DeclareMathSymbol{\sfhbar}{\mathalpha}{lettersAB}{53}%   this is not upright
    
    \DeclareMathAccent{\grave}{\mathord}{lettersAB}{254}% added these after bug report 2021/01/24
    \DeclareMathAccent{\acute}{\mathord}{lettersAB}{255}
    \DeclareMathAccent{\check}{\mathord}{lettersAB}{186}
    \DeclareMathAccent{\breve}{\mathord}{lettersAB}{187}
    \DeclareMathAccent{\bar}{\mathord}{lettersAB}{221}
    \DeclareMathAccent{\mathring}{\mathord}{lettersAB}{222}
    \DeclareMathAccent{\hat}{\mathord}{lettersAB}{223}
    \DeclareMathAccent{\dot}{\mathord}{lettersAB}{224}
    \DeclareMathAccent{\tilde}{\mathord}{lettersAB}{219}
    
    %%% sans math version, potential value with PGFPlots, etc., 2021/01/25 %%%
    \DeclareMathVersion{sans}
    \SetSymbolFont{letters}{sans}{OML}{ntxsfmi}{m}{it}
    \SetSymbolFont{lettersA}{sans}{U}{ntxsfmia}{m}{it}
    \SetSymbolFont{lettersAB}{sans}{U}{ntxsfmia}{m}{it}
    \IfFormatAtLeastTF{2016/01/05}{%
    	\SetSymbolFont{symbols}{sans}{LMS}{ntxsy}{m}{n}
    	}{\relax}
    \SetSymbolFont{largesymbols}{sans}{LMX}{ntxexx}{m}{n}
    \SetSymbolFont{largesymbolsTXA}{sans}{U}{ntxexa}{m}{n}
    \SetSymbolFont{operators}{sans}{OT1}{\sfdefault}{m}{n}% fixed encoding 2025/04/07
    \SetMathAlphabet{\mathsf}{sans}{OT1}{\sfdefault}{m}{n}% make upright 2021/01/31.
\fi

%%%%%%%%%%%%%%%%%%  Times-like fonts for specific languages  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifpdftex
		% Under lualatex, babel has problems with the following approach, which assumes that fontspec has not been loaded.
        % Recommend not to choose the [nofontspec] option.
        % These font options (vietnamese, greek, cyrillic) require LaTeX distributions 2020/02/02 or later.
	% Several modifications made in response to newtx v1.71, 2022/03/14
	\ifac@vietnamese
%
		\AtBeginDocument{%
			\let\babel@aux\@gobbletwo % eliminate warnings about missing .fd. Brute force approach, revisit eventually. 2022/03/14
			\DeclareFontFamilySubstitution{T5}{\rmdefault}{qtm}  % new in 02/20/2020 format of LaTeX!  Need to test.
			\DeclareFontFamilySubstitution{T5}{\ttdefault}{qcr}
		}
		% Vietnamese is in T5 encoding, can use Tex Gyre Termes font (qtm); 
    	% qhv = Heros (helvetica). We get the right font w/o loading this.        	
    	% qcr = Cursor (monospaced) is poor match to inconsolata; qhv (the sf font) matches better, but isn't monospaced.
%
    	% From TeX Gyre Termes and Cursor .fd files by B. Jackowski and J. M. Nowacki, released under the GUST license
        \begingroup
        \nfss@catcodes
%        
        \def\qtm@scale{s*[0.97]}
        \DeclareFontFamily{T5}{qtm}{}% not adjusting wordspacing
        \DeclareFontShape{T5}{qtm}{b}{sc}{<-> \qtm@scale t5-qtmb-sc}{}
        \DeclareFontShape{T5}{qtm}{b}{n}{<-> \qtm@scale t5-qtmb}{}
        \DeclareFontShape{T5}{qtm}{b}{scit}{<-> \qtm@scale t5-qtmbi-sc}{}
        \DeclareFontShape{T5}{qtm}{b}{it}{<-> \qtm@scale t5-qtmbi}{}
        \DeclareFontShape{T5}{qtm}{m}{sc}{<-> \qtm@scale t5-qtmr-sc}{}
        \DeclareFontShape{T5}{qtm}{m}{n}{<-> \qtm@scale t5-qtmr}{}
        \DeclareFontShape{T5}{qtm}{m}{scit}{<-> \qtm@scale t5-qtmri-sc}{}
        \DeclareFontShape{T5}{qtm}{m}{it}{<-> \qtm@scale t5-qtmri}{}
        \DeclareFontShape{T5}{qtm}{bx}{sc}{<->ssub * qtm/b/sc}{}
        \DeclareFontShape{T5}{qtm}{bx}{n}{<->ssub * qtm/b/n}{}
        \DeclareFontShape{T5}{qtm}{bx}{scit}{<->ssub * qtm/b/scit}{}
        \DeclareFontShape{T5}{qtm}{bx}{it}{<->ssub * qtm/b/it}{}
        \DeclareFontShape{T5}{qtm}{b}{sl}{<->sub * qtm/b/it}{}
        \DeclareFontShape{T5}{qtm}{m}{sl}{<->sub * qtm/m/it}{}
        \DeclareFontShape{T5}{qtm}{b}{scsl}{<->sub * qtm/b/scit}{}
        \DeclareFontShape{T5}{qtm}{m}{scsl}{<->sub * qtm/m/scit}{}
%                
        \def\qcr@scale{s*[0.95]}
        \DeclareFontFamily{T5}{qcr}{}% not adjusting wordspacing
        \DeclareFontShape{T5}{qcr}{b}{sc}{<-> \qcr@scale t5-qcrb-sc}{}
        \DeclareFontShape{T5}{qcr}{b}{n}{<-> \qcr@scale t5-qcrb}{}
        \DeclareFontShape{T5}{qcr}{b}{scit}{<-> \qcr@scale t5-qcrbi-sc}{}
        \DeclareFontShape{T5}{qcr}{b}{it}{<-> \qcr@scale t5-qcrbi}{}
        \DeclareFontShape{T5}{qcr}{m}{sc}{<-> \qcr@scale t5-qcrr-sc}{}
        \DeclareFontShape{T5}{qcr}{m}{n}{<-> \qcr@scale t5-qcrr}{}
        \DeclareFontShape{T5}{qcr}{m}{scit}{<-> \qcr@scale t5-qcrri-sc}{}
        \DeclareFontShape{T5}{qcr}{m}{it}{<-> \qcr@scale t5-qcrri}{}
        \DeclareFontShape{T5}{qcr}{bx}{sc}{<->ssub * qcr/b/sc}{}
        \DeclareFontShape{T5}{qcr}{bx}{n}{<->ssub * qcr/b/n}{}
        \DeclareFontShape{T5}{qcr}{bx}{scit}{<->ssub * qcr/b/scit}{}
        \DeclareFontShape{T5}{qcr}{bx}{it}{<->ssub * qcr/b/it}{}
        \DeclareFontShape{T5}{qcr}{b}{sl}{<->sub * qcr/b/it}{}
        \DeclareFontShape{T5}{qcr}{m}{sl}{<->sub * qcr/m/it}{}
        \DeclareFontShape{T5}{qcr}{b}{scsl}{<->sub * qcr/b/scit}{}
        \DeclareFontShape{T5}{qcr}{m}{scsl}{<->sub * qcr/m/scit}{}
    	\endgroup
    \fi
%
    \ifac@greek
%
    	\AtBeginDocument{%
			\let\babel@aux\@gobbletwo % eliminate warnings about missing .fd. Brute force approach, revisit eventually. 2022/03/14
    		\DeclareFontFamilySubstitution{LGR}{\familydefault}{artemisia} % scale these
    		\DeclareFontFamilySubstitution{LGR}{\sfdefault}{maksf}% kerkis
    		\DeclareFontFamilySubstitution{LGR}{\ttdefault}{DejaVuSansMono-TLF}
    	}	
%        %% Based on Artemisia fd files by A. Tsolomitis and ideas from substitutefont package by G. Milde, both LaTeX Public License.
        \begingroup
        \nfss@catcodes
%        
        \def\artemisiasc@scaled{s*[0.95]}
        \def\artemisia@scaled{s*[0.93]}
        \DeclareFontFamily{LGR}{artemisia}{%
        	\fontdimen2\font=.25em
    		\fontdimen3\font=.2em
    		\fontdimen4\font=.1em
    		}% adjusted word spacing to match newtxtext... this is tighter.
        \DeclareFontShape{LGR}{artemisia}{m}{n}{<->  \artemisia@scaled gartemisiarg6a}{}
        \DeclareFontShape{LGR}{artemisia}{m}{it}{<-> \artemisia@scaled gartemisiai6a}{}
        \DeclareFontShape{LGR}{artemisia}{b}{n}{<->  \artemisia@scaled gartemisiab6a}{}
        \DeclareFontShape{LGR}{artemisia}{b}{it}{<-> \artemisia@scaled gartemisiabi6a}{}
        \DeclareFontShape{LGR}{artemisia}{m}{sl}{<-> \artemisia@scaled gartemisiao6a}{}
        \DeclareFontShape{LGR}{artemisia}{b}{sl}{<-> \artemisia@scaled gartemisiabo6a}{}
        \DeclareFontShape{LGR}{artemisia}{m}{sc}{<-> \artemisiasc@scaled gartemisiasc6a}{}
        \DeclareFontShape{LGR}{artemisia}{m}{sco}{<->\artemisiasc@scaled gartemisiasco6a}{}
%        
        %% nextx names oblique sc as both scit and scsl. ("largesc" option of newtx is different font, not a scaling.) 
        \DeclareFontShape{LGR}{artemisia}{m}{scsl}{<->\artemisiasc@scaled gartemisiasco6a}{}% sco
        \DeclareFontShape{LGR}{artemisia}{m}{scit}{<->\artemisiasc@scaled gartemisiasco6a}{}% sco
%        
        \DeclareFontShape{LGR}{artemisia}{bx}{n}{<-> \artemisia@scaled gartemisiab6a}{}
        \DeclareFontShape{LGR}{artemisia}{bx}{it}{<->\artemisia@scaled gartemisiabi6a}{}
        \DeclareFontShape{LGR}{artemisia}{bx}{sl}{<->\artemisia@scaled gartemisiabo6a}{}
%        
%        % Sans Serif Greek font Kerkis
%        % Based on Kerkis fd file, by Antonis Tsolomitis, under the LaTeX Project Public License
        \def\kerkissf@scaled{s*[0.95]}
        \DeclareFontFamily{LGR}{maksf}{}% not adjusting wordspacing
        \DeclareFontShape{LGR}{maksf}{m}{n}{<-> \kerkissf@scaled gksf7t}{}
        \DeclareFontShape{LGR}{maksf}{m}{it}{<->\kerkissf@scaled gksfi7t}{}  
        \DeclareFontShape{LGR}{maksf}{m}{sl}{<->\kerkissf@scaled gksfi7t}{}
        \DeclareFontShape{LGR}{maksf}{m}{sc}{<->\kerkissf@scaled gksfsc7t}{}
        \DeclareFontShape{LGR}{maksf}{b}{n}{ <->\kerkissf@scaled gksfb7t}{}  
        \DeclareFontShape{LGR}{maksf}{b}{it}{<->\kerkissf@scaled gksfbi7t}{}
        \DeclareFontShape{LGR}{maksf}{b}{sl}{<->\kerkissf@scaled gksfbi7t}{}  
%        
        \DeclareFontShape{LGR}{maksf}{bx}{n}{  <-> \kerkissf@scaled gksfb7t}{}
        \DeclareFontShape{LGR}{maksf}{bx}{it}{ <-> \kerkissf@scaled gksfbi7t}{}
        \DeclareFontShape{LGR}{maksf}{bx}{sl}{ <-> \kerkissf@scaled gksfbi7t}{}
%    
%        %% Greek monospaced font, DejaVuSansMono
%        %% Based on DejaVu fd files by Pavel Farar, under the LaTeX Project Public License
        \def\DejaVuSansMono@@scale{s*[0.85]}%
        \DeclareFontFamily{LGR}{DejaVuSansMono-TLF}{}% not adjusting wordspacing
        \DeclareFontShape{LGR}{DejaVuSansMono-TLF}{b}{it}{<-> \DejaVuSansMono@@scale DejaVuSansMono-BoldOblique-tlf-lgr}{}
        \DeclareFontShape{LGR}{DejaVuSansMono-TLF}{b}{n}{ <-> \DejaVuSansMono@@scale DejaVuSansMono-Bold-tlf-lgr}{}
        \DeclareFontShape{LGR}{DejaVuSansMono-TLF}{m}{it}{<-> \DejaVuSansMono@@scale DejaVuSansMono-Oblique-tlf-lgr}{}
        \DeclareFontShape{LGR}{DejaVuSansMono-TLF}{m}{n}{ <-> \DejaVuSansMono@@scale DejaVuSansMono-tlf-lgr}{}
        
        \DeclareFontShape{LGR}{DejaVuSansMono-TLF}{m}{sl}{<-> \DejaVuSansMono@@scale DejaVuSansMono-TLF/m/it}{}
        \DeclareFontShape{LGR}{DejaVuSansMono-TLF}{b}{sl}{<-> \DejaVuSansMono@@scale DejaVuSansMono-TLF/b/it}{}
        
        \DeclareFontShape{LGR}{DejaVuSansMono-TLF}{bx}{sl}{<->\DejaVuSansMono@@scale DejaVuSansMono-TLF/b/it}{}
        \DeclareFontShape{LGR}{DejaVuSansMono-TLF}{bx}{it}{<->\DejaVuSansMono@@scale DejaVuSansMono-TLF/b/it}{}
        \DeclareFontShape{LGR}{DejaVuSansMono-TLF}{bx}{n}{ <->\DejaVuSansMono@@scale DejaVuSansMono-TLF/b/n}{}
%
    	\endgroup
    \fi

    \ifac@cyrillic
%
    	\AtBeginDocument{%
    		\let\babel@aux\@gobbletwo % eliminate warnings about missing .fd. Brute force approach, revisit eventually. 2022/03/14
    		\DeclareFontFamilySubstitution{T2A}{\familydefault}{PTSerif-TLF}
    		\DeclareFontFamilySubstitution{T2A}{\sfdefault}{PTSans-TLF}
%			\DeclareFontFamilySubstitution{T2A}{\ttdefault}{DejaVuSansMono-TLF} % if one prefers an SF monospace font
    		\DeclareFontFamilySubstitution{T2A}{\ttdefault}{PTMono} 
    	}
       %% Paratype fonts for cyrillic, maintained by Pavel Farar, under Latex Project Public License
        \begingroup
        \nfss@catcodes
%        
        \def\PTSerif@@scale{s*[0.95]}% had had 0.94...
        \DeclareFontFamily{T2A}{PTSerif-TLF}{}% not adjusting wordspacing, since it matches newtxtext as is
        \DeclareFontShape{T2A}{PTSerif-TLF}{m}{n}{ <->\PTSerif@@scale PTSerif-Regular-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{m}{it}{<->\PTSerif@@scale PTSerif-Italic-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{b}{n}{ <->\PTSerif@@scale PTSerif-Bold-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{b}{it}{<->\PTSerif@@scale PTSerif-BoldItalic-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{m}{ui}{<->\PTSerif@@scale PTSerif-UprightItalic-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{m}{sl}{<->\PTSerif@@scale PTSerif-Slanted-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{b}{ui}{<->\PTSerif@@scale PTSerif-BoldUprightItalic-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{b}{sl}{<->\PTSerif@@scale PTSerif-BoldSlanted-tlf-t2a}{}
%        
        \DeclareFontShape{T2A}{PTSerif-TLF}{bx}{n}{<->ssub * PTSerif-TLF/b/n}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{bx}{it}{<->ssub * PTSerif-TLF/b/it}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{bx}{ui}{<->ssub * PTSerif-TLF/b/ui}{}
        \DeclareFontShape{T2A}{PTSerif-TLF}{bx}{sl}{<->ssub * PTSerif-TLF/b/sl}{}
%        
        \def\PTSans@@scale{s*[0.94]}%
        \DeclareFontFamily{T2A}{PTSans-TLF}{}% not adjusting wordspacing
        \DeclareFontShape{T2A}{PTSans-TLF}{b}{it}{<->\PTSans@@scale PTSans-BoldItalic-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSans-TLF}{b}{n}{<-> \PTSans@@scale PTSans-Bold-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSans-TLF}{m}{it}{<->\PTSans@@scale PTSans-Italic-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSans-TLF}{m}{n}{<-> \PTSans@@scale PTSans-Regular-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSans-TLF}{c}{n}{<-> \PTSans@@scale PTSans-Narrow-tlf-t2a}{}
        \DeclareFontShape{T2A}{PTSans-TLF}{bc}{n}{<->\PTSans@@scale PTSans-NarrowBold-tlf-t2a}{}
%        
        \DeclareFontShape{T2A}{PTSans-TLF}{m}{sl}{<->ssub * PTSans-TLF/m/it}{}
        \DeclareFontShape{T2A}{PTSans-TLF}{b}{sl}{<->ssub * PTSans-TLF/b/it}{}
        \DeclareFontShape{T2A}{PTSans-TLF}{bx}{sl}{<->ssub * PTSans-TLF/b/it}{}
        \DeclareFontShape{T2A}{PTSans-TLF}{bx}{it}{<->ssub * PTSans-TLF/b/it}{}
        \DeclareFontShape{T2A}{PTSans-TLF}{bx}{n}{<->ssub * PTSans-TLF/b/n}{}
%
%        %% the tt cyrillic is slightly larger than the latin characters.    
         \def\PTMono@@scale{s*[0.92]}%
         \DeclareFontFamily{T2A}{PTMono}{}% not adjusting wordspacing
         \DeclareFontShape{T2A}{PTMono}{m}{n}{<-> \PTMono@@scale PTMono-Regular-tlf-t2a}{}
         \DeclareFontShape{T2A}{PTMono}{b}{n}{<-> \PTMono@@scale PTMono-Bold-tlf-t2a}{}
         \DeclareFontShape{T2A}{PTMono}{m}{sl}{<->\PTMono@@scale PTMono-Slanted-tlf-t2a}{}
         \DeclareFontShape{T2A}{PTMono}{b}{sl}{<->\PTMono@@scale PTMono-BoldSlanted-tlf-t2a}{}
         \DeclareFontShape{T2A}{PTMono}{m}{it}{<->\PTMono@@scale PTMono-Slanted-tlf-t2a}{}
         \DeclareFontShape{T2A}{PTMono}{b}{it}{<->\PTMono@@scale PTMono-BoldSlanted-tlf-t2a}{}
        
         \DeclareFontShape{T2A}{PTMono}{bx}{n}{<->ssub * PTMono-TLF/b/n}{}
         \DeclareFontShape{T2A}{PTMono}{bx}{sl}{<->ssub * PTMono-TLF/b/sl}{}
%
        \def\DejaVuSansMono@@scale{s*[0.85]}%
        \DeclareFontFamily{T2A}{DejaVuSansMono-TLF}{}% not adjusting wordspacing
        \DeclareFontShape{T2A}{DejaVuSansMono-TLF}{b}{it}{<-> \DejaVuSansMono@@scale DejaVuSansMono-BoldOblique-tlf-t2a}{}
        \DeclareFontShape{T2A}{DejaVuSansMono-TLF}{b}{n}{ <-> \DejaVuSansMono@@scale DejaVuSansMono-Bold-tlf-t2a}{}
        \DeclareFontShape{T2A}{DejaVuSansMono-TLF}{m}{it}{<-> \DejaVuSansMono@@scale DejaVuSansMono-Oblique-tlf-t2a}{}
        \DeclareFontShape{T2A}{DejaVuSansMono-TLF}{m}{n}{ <-> \DejaVuSansMono@@scale DejaVuSansMono-tlf-t2a}{}
%        
        \DeclareFontShape{T2A}{DejaVuSansMono-TLF}{m}{sl}{<-> \DejaVuSansMono@@scale DejaVuSansMono-TLF/m/it}{}
        \DeclareFontShape{T2A}{DejaVuSansMono-TLF}{b}{sl}{<-> \DejaVuSansMono@@scale DejaVuSansMono-TLF/b/it}{}
%        
        \DeclareFontShape{T2A}{DejaVuSansMono-TLF}{bx}{sl}{<->\DejaVuSansMono@@scale DejaVuSansMono-TLF/b/it}{}
        \DeclareFontShape{T2A}{DejaVuSansMono-TLF}{bx}{it}{<->\DejaVuSansMono@@scale DejaVuSansMono-TLF/b/it}{}
        \DeclareFontShape{T2A}{DejaVuSansMono-TLF}{bx}{n}{ <->\DejaVuSansMono@@scale DejaVuSansMono-TLF/b/n}{}
%   
        \endgroup 
    \fi
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
%%
%% End of file `asmeconf.cls'.

