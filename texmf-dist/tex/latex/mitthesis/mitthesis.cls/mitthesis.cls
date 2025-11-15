% MIT thesis class

% !TEX encoding = UTF-8 Unicode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the mitthesis LaTeX class for formatting theses according to 
%%  MIT Libraries' requirements as of 2025.
%%
%%  This file's version and date:
	\def\versionno{1.21}
	\def\versiondate{2025/11/02\space}
%%
%%  Author: John H. Lienhard, V
%%          Department of Mechanical Engineering
%%          Massachusetts Institute of Technology
%%          Cambridge, MA 02139-4307 USA
%%
%%  This class is compatible with either pdfLaTeX or LuaLaTeX. 
%%
%%	Use an up-to-date LaTeX distribution: TeX Live 2023 or later is strongly recommended!
%%	All packages required by the class are in TeX Live and available from CTAN (https://ctan.org/). 
%%
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
%% not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. 
%% In no event shall the authors or copyright holders be liable for any claim, damages or other liability, 
%% whether in an action of contract, tort or otherwise, arising from, out of or in connection with the 
%% software or the use or other dealings in the software.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mitthesis}[\versiondate MIT Thesis Template (JHL)]

\LoadClass[12pt,openright]{report}% [twoside] option can be issued in the .tex file; point size must be set here.

\newif\ifpdftex % redeclaration by another package will be ignored
\ExplSyntaxOn
	\str_const:Nn \ClassName {mitthesis}
	\prop_gput:Nnn \g_msg_module_type_prop { \ClassName } { Class }
	\sys_if_engine_pdftex:T  
		{ 
		  \pdftextrue
	   	  \msg_new:nnn { \ClassName } { notagpdftex } { Run~lualatex,~not~pdftex,\iow_newline: 
		  												when~tagging~is~used~in~\DocumentMetadata } 
		  \cs_if_exist:NT \tag_if_active:T % not in TeX Live 2021
			{
		     \tag_if_active:T { \msg_error:nn  { \ClassName } { notagpdftex } }
			}
		}
\ExplSyntaxOff


\providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}% compare version to date; \If... added to latex 2020/10/01

\IfFormatAtLeastTF{2022/06/01}{\relax}{%
	\ClassError{\ClassName}{Your LaTeX format is dated \fmtversion.  Formats dated 2022-06-01 or later are necessary for this class. Older formats are not supported and will generate serious errors.}{UPDATE your LaTeX distribution. TeX Live is available for download at no charge: \string https://www.tug.org/texlive/.}%
}


%%%%%%%%%%%%%  Some compatibility for older latex distributions  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Dropping this backward compatibility 2025/10/24 (needed for formats older than 2022/06/01, i.e., TeX Live pre-2022)

%\providecommand\IfPackageAtLeastTF{\@ifpackagelater}%    compare version to date; \If... added to latex 2020/10/01
%\providecommand\IfPDFManagementActiveTF{\@secondoftwo}%  \If... added to latex 2021/07/23
%\providecommand\IfPackageLoadedTF{\@ifpackageloaded}%    \If... added to latex 2021/11/15
%\providecommand\ClassNoteNoLine[2]{\typeout{^^J Class Note #1: #2. ^^J}}%  log & terminal note... added to latex 2021/11/15

%% check whether pdfmanagement (\DocumentMetadata) has been loaded (if not, fall back to hyperxmp and bookmark packages after loading hyperref)
%\newif\ifmit@pdfmanagement
%\IfPDFManagementActiveTF{
%	\mit@pdfmanagementtrue 
%}{
%	\mit@pdfmanagementfalse
%	\ClassWarningNoLine{\ClassName}{pdfmanagement is not active. Will load hyperxmp and bookmark packages instead}
%}

%% Allow pre 2021/11/15 formats to see the graphicx alt key without causing an error
%\IfFormatAtLeastTF{2021/11/15}{
%	\relax
%}{ 
%	\AtBeginDocument{
%		\IfPackageLoadedTF{graphicx}{\define@key{Gin}{alt}{}}{\relax}
%	}
%}

%% Enable pre-2020/10 formats to access essential macros later moved into LaTeX kernel
%\ifdefined\NewDocumentCommand\else
%  \RequirePackage{xparse}
%\fi

%% Also, more than a dozen expl3 variant control sequences are generated for backward compatibility, mostly ca. 2023.


%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOn

\newif\ifmit@mydesign
\cs_new_protected:Npn \__mitthesis_gset_testdesign:n #1
	{
    	\mit@mydesigntrue
    	\tl_new:N       \g__mitthesis_testkey_tl
    	\tl_gset:Nn     \g__mitthesis_testkey_tl {#1}
    	\tl_if_empty:NT \g__mitthesis_testkey_tl { \tl_gset:Nn \g__mitthesis_testkey_tl {mydesign} } 
	}

\IfFormatAtLeastTF{2022/11/01}{%
    \DeclareKeys{
    	fontset  .store  = \mit@fontset ,
    	fontset  .usage  = load ,
    	lineno   .if     = mit@lineno ,
    	lineno 	 .usage	 = load ,
    	mydesign .code	 = \__mitthesis_gset_testdesign:n {#1} , 
    	mydesign .usage	 = load,
    } 
    \SetKeys[\ClassName]{fontset=defaultfonts}%
	\DeclareUnknownKeyHandler[\ClassName]{\relax}% suppress warning about unused keys
	\ProcessKeyOptions
}{% And more compatibility code for distributions pre-2022/11     
    \RequirePackage{kvoptions}
    \SetupKeyvalOptions{
      family=\ClassName,
      prefix=mit@,
      setkeys=\kvsetkeys,
    }
    % set key [fontset] for font selection
    \DeclareStringOption[defaultfonts]{fontset}[]
    % set key [lineno] to load package lineno
    \DeclareBoolOption{lineno}
    % set key [mydesign] to input file mydesign.tex
    \define@key{\ClassName}{mydesign}
    	{ \__mitthesis_gset_testdesign:n {#1} }
    %
    \ProcessKeyvalOptions{\ClassName}
    %
    %% Turn off these keys now that we're done with them
    \NewDocumentCommand\mit@DisableOption{m}{%
      \DisableKeyvalOption[%
        action=ignore,%
        class=\ClassName%
      ]{#1}{\ClassName}%
    }
    \NewDocumentCommand\mit@DisableKeys{>{\SplitList{;}}m}{\ProcessList{#1}{\mit@DisableOption}}
    %
    \mit@DisableKeys{fontset;lineno;mydesign}%
    %
    % Suppress warnings about unused global options
    \DeclareOption*{}  
    \ProcessOptions \relax
}
\ExplSyntaxOff


%%%%%%%%%%%%%  Line numbering (class option)  %%%%%%%%%%%%%%%%%%%%%%%%%

\ifmit@lineno
    \RequirePackage[mathlines]{lineno} 
    \AtBeginDocument{\linenumbers}
\fi

%%% Enable dropping lineno option without trashing .aux file
\providecommand{\@LN@col}[1]{\relax}
\providecommand{\@LN}[2]{\relax}


%%%%%%%%%%%%%  Patch table of contents, list of figures, and list of tables  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% We'd like these sections to have pdf bookmarks and to have the two lists appear in the table of contents and have
% pdf bookmarks.  This is not automatic for \chapter*, which is the format of toc, lof, and lot.

\RequirePackage{etoolbox}% provides \patchcmd

\patchcmd{\tableofcontents}{\contentsname}{\pdfbookmark[0]{Table of Contents}{toc}\contentsname}{}{} % placement matters.

%% Code to accommodate latex tagging. Rework once LaTeX3 team have finalized tagging structures.
%% Current latex-lab places tags around \@schapter, which is harder to deal with here.

\ProvideDocumentCommand\MakeLinkTarget{ s O{} m }{}

\patchcmd{\listoffigures}{\chapter*{\listfigurename}}%
		{\chapter*{\MakeLinkTarget*{listoffigures}\listfigurename}\addcontentsline{toc}{frontmatter}{\listfigurename}}{}{}
\patchcmd{\listoftables}{\chapter*{\listtablename}}%
		{\chapter*{\MakeLinkTarget*{listoftables}\listtablename}\addcontentsline{toc}{frontmatter}{\listtablename}}{}{}
% removed \phantomsection, move \MakeLinkTarget* inside \chapter*, 2025/04/28. (was \chapter*{\phantomsection\listtablename}\MakeLinkTarget*{listoftables}...)

\NewCommandCopy\l@frontmatter\l@chapter
\NewCommandCopy\l@backmatter\l@chapter
\providecommand*{\toclevel@frontmatter}{0}% prevent warning, see hyperref manual Sec. 13.3
\providecommand*{\toclevel@backmatter}{0}

%% if you want different formatting for front/back matter, change here (cf. report.cls). 
\patchcmd{\l@frontmatter}{\bfseries}{\itshape}{}{}
\patchcmd{\l@frontmatter}{\nobreak\hfil}{\upshape\nobreak\hfil}{}{}
\patchcmd{\l@frontmatter}{1.0em}{3pt}{}{} 
\patchcmd{\l@backmatter}{\bfseries}{\itshape}{}{}
\patchcmd{\l@backmatter}{\nobreak\hfil}{\upshape\nobreak\hfil}{}{}


%%%%%%%%%%%%%  Geometry, mathtools, graphics, design, fonts, hyperrefs, bookmarks, footnotes %%%%%%%%%%%%%%%%%%%

\RequirePackage[letterpaper,top=1in,bottom=1in,left=1in,right=1in,marginparwidth=50pt,headsep=12pt,footskip=0.5in,heightrounded]{geometry} 
% 44\baselineskip = \textheight - \topskip = 650.0pt - 12pt with rounded height

\RequirePackage{mathtools}% loads and extends amsmath; must load before hyperref and unicode-math

% To free \eqref from the normal font (i.e., for use in section headings)
\renewcommand{\eqref}[1]{\textup{\hbox{\m@th{(\ignorespaces\ref{#1}\unskip\@@italiccorr)}}}}
%
% amsmath def:  \newcommand{\eqref}[1]{\textup{\tagform@{\ref{#1}}}}
%				\def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}}
%				\def\maketag@@@#1{\hbox{\m@th\normalfont#1}}

% To streamline switching from lualatex to pdftex when using sample chapter 1, which puts \psi (as \mitpsi) in a toc entry
\ifpdftex\providecommand\mitpsi{\psi}\fi

\RequirePackage{graphicx}


%%%%%%%%%%%%  Design options  %%%%%%%%%%%%%%%%%%%%%%%%%%%

% the packages in mydesign should come before babel (which may be loaded by fontset) and before hyperref

\ExplSyntaxOn
\msg_new:nnnn { \ClassName } { nodesignfile } 
	{ \g__mitthesis_testkey_tl .tex\iow_newline: cannot~be~not~found.~There~shall~no~design~be~loaded;~
	  and~error~messages~shall~be~multiplied~upon~thee.
	}{ 
	  Thou~hast~called~the~class~option~mydesign,~but~neither~\g__mitthesis_testkey_tl .tex\space
	  nor~mydesign.tex~can~be~found.~Thou~mayst~download~mydesign.tex~from\space
	  https://ctan.org/tex-archive/macros/latex/contrib/mitthesis/MIT-thesis-template. }
\ifmit@mydesign
	\IfFileExists{ \g__mitthesis_testkey_tl .tex }
		{ \input{  \g__mitthesis_testkey_tl .tex } }
		{ \msg_error:nn { \ClassName } { nodesignfile } }
\else
	\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}

	\RequirePackage{caption,subcaption}

	% Patch headings to automatically use bold math (removed titlesec 2025/01/27.) Compare to report.cls. 
    % NOT every font includes a bold math version, so you may need to use other math macros in the headings to get bold math <== 
    % Predefined fontsets for which bold math exists are: default fonts (CMR or LMR), Fira-newtxsf, Lucida, Newtx
	\patchcmd{\section}{\normalfont}{\mathversion{bold}\normalfont}{}{}
	\patchcmd{\subsection}{\normalfont}{\mathversion{bold}\normalfont}{}{}
	\patchcmd{\subsubsection}{\normalfont}{\mathversion{bold}\normalfont}{}{}
	\patchcmd{\paragraph}{\normalfont}{\mathversion{bold}\normalfont}{}{}
	\patchcmd{\subparagraph}{\normalfont}{\mathversion{bold}\normalfont}{}{}

	\AtBeginDocument{
		\hypersetup{
		linkcolor=Blue3,% color names from xcolor package
		citecolor=Blue3,
		urlcolor=violet,
		filecolor=red, 
		}
		\ifmit@lineno
			\renewcommand{\linenumberfont}{\sffamily\mdseries\tiny\color{violet}}% add \mdseries 2023/10/11
		\fi
	}	  	
\fi
\ExplSyntaxOff

%%%%%%%%%%%%  Accommodations for tagpdf (if in use)  %%%%%

\ExplSyntaxOn 

%% In case tagging commands are undefined
\cs_if_exist:NF   \tag_struct_begin:n
	{ 
	  \cs_new:Npn \tag_struct_begin:n #1 { \scan_stop: } 
	  \cs_new:Nn  \tag_struct_end:   	 { \scan_stop: } 
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

\cs_if_exist:NT \tag_if_active:T % not in TeX Live 2021
{
    \tag_if_active:T { % 2025/04/26
    %
    % 	temporary patch for lof/lot issue. 2025/01/28
    % 	see discussion here: https://github.com/latex3/tagging-project/issues/720#issuecomment-2388406105
    %   appears to be unneeded by 2025/10/31 latex/tagpdf, so dropping this, 2025/10/31
	%   NB: fix not present in TeX Live 2025
%        \IfPackageLoadedTF{caption}{
%        	\AddToHook{begindocument/end}{ 
%        		\renewcommand*\caption@anchor[1]{
%        	       \ifmeasuring@ \else
%        				\caption@raisedlink{\MakeLinkTarget*{#1}}
%        	        \fi}
%        	}
%        }{\relax}
    %	
    % 	fix tagging bug with large delimiters in some fonts. Drop this code once issue is resolved, 2025/01/28
    % 	patch by Ulrike Fischer: https://github.com/latex3/tagging-project/issues/757#issuecomment-2465417867.
    %   fixed in 2025/07/12 lualatex-dev, so dropping this patch. 2025/10/31
	%   NB: fix not present in TeX Live 2025
%        \ifpdftex\else
%        	\AtBeginDocument{ 
%        		\cs_set:Npn \bBigg@ #1 #2 {
%              	  {
%                    \ensuremath {
%                    	\Uvextensible height~#1~ \dimexpr0.5\big@size\relax ~ depth ~#1~  \dimexpr0.5\big@size\relax~ axis~exact~#2
%                    }
%        		  }
%        		}
%        	}
%        \fi
		%
        % Can include some css to style the html-rendered thesis, 2025/10/15.
        \msg_new:nnn    { \ClassName } { no_css_file } {I~can't~find~the~file~mitthesis-style.css.\iow_newline:
        This~optional~file~provides~css~style~if~the~tagged~pdf~is~rendered~into~html.~
        								You~can~ignore~this~warning~if~you~don't~want~styling.}
        \msg_new:nnn    { \ClassName } { css_file_loaded } {The~file~mitthesis-style.css~has~been~loaded.}
        \file_if_exist:nTF {mitthesis-style.css}
        	{
			\tagpdfsetup
				{
  				css-list-add = { mitthesis-style.css } % attach this css to the pdf
				}
			    \msg_note:nn { \ClassName } { css_file_loaded } 
			    }{  
			    \msg_note:nn { \ClassName } { no_css_file } 
			    }
	}
	\NewDocumentCommand\CiteNolink{m}{ \begin{NoHyper}\cite{#1}\end{NoHyper} } 
	% for use in optional arg of \caption[..]{..} to prevent nested link in lof/lot
	% this gives a limited backward compatibility for TeX Live 2025, if desired. 2025/10/25. Will drop in late 2026.
}
\ExplSyntaxOff


%%%%%%%%%%%%  Font loading  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ClassNoteNoLine{\ClassName}{Fontset key is \mit@fontset}
\IfFileExists{fontsets/\ClassName-\mit@fontset.tex}{% 2023/07/03
	\input{fontsets/\ClassName-\mit@fontset.tex}
}{%
	\ClassWarning{\ClassName}{Fontset file \ClassName-\mit@fontset.tex or subdirectory fontsets not found, will look for \mit@fontset.tex in your working directory}
	\IfFileExists{\mit@fontset.tex}{% 2023/08/30
		\input{\mit@fontset.tex}
		}{
    	\ClassWarning{\ClassName}{Fontset file \mit@fontset.tex not found, using default fonts. You may need to place the fontset file into your working directory}
    	\ifpdftex
        	\ClassNoteNoLine{\ClassName}{Loading Computer Modern text and math fonts (default for pdftex)}
        	\RequirePackage[T1]{fontenc}
        	\RequirePackage{bm}
        \else
        	\ClassNoteNoLine{\ClassName}{Loading Latin Modern text and math fonts (default for unicode engines)}
            \RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
            % suppress warnings about lack of integration between mathtools and unicode-math.
            % Unicode-math loads fontspec package, but default fonts are not set up by fontspec in the default case.
        \fi
       }
}

%%%%%%%%%%%%  Hyperref  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[psdextra]{hyperref}
% authors should use hypersetup to set details, in the main .tex file

\urlstyle{same} 		% changes font for \url to the current text font
\RequirePackage{doi} 	% creates macro for hyperlinking doi numbers

%% In case \DocumentMetadata was not loaded
\providecommand\hrefurl[2]{\href{#1}{#2}}

%% Dropping this backward compatibility 2025/10/24 (needed for formats older than 2022/06/01)
%% pdfmanagement loads bookmarks package internally
%\ifmit@pdfmanagement\else
%    \RequirePackage{hyperxmp}
%    \RequirePackage{bookmark}
%\fi

% the user can alter these choices in the preamble, or by 
% using \AtBeginDocument{ \hypersetup{..} } in mydesign.tex 
\hypersetup{
	colorlinks=true,
	pdfborder={0 0 0},
	bookmarksnumbered=true,
	bookmarksopen=true,
	bookmarksopenlevel=1,
	pdfpagelayout=SinglePage,
	pdfdisplaydoctitle=true,
	pdfstartview=Fit,
	pdfnewwindow=true,
%
	pdfcontactaddress={Massachusetts Institute of Technology, 77 Massachusetts Avenue},
	pdfcontactcity={Cambridge, MA},
	pdfcontactpostcode={02139-4307},
	pdfcontactcountry={USA},
	pdfcontacturl={https://dspace.mit.edu/handle/1721.1/7582},% DSPACE@MIT theses page
}
 		
%%%%%%%%%%%%  PDF bookmark strings  %%%%%%%%%%%%%%%%%%%%%%%

%%%     By early 2024, \pdfstring removes all robust commands from bookmarks, so that such commands 
%%%     don't cause errors; the following \pdfstringdisables serve to suppress warnings.

%% \bm may be useful in headings, but let's disable in the associated bookmarks
\pdfstringdefDisableCommands{%
    \def\bm#1#{\relax}%
}
%% Let's disable \( and \) in pdf bookmarks
\pdfstringdefDisableCommands{%
    \def\({\relax}%
    \def\){\relax}%
}
%%% Let's also make sure \NoCaseChange in section headings won't break pdf bookmarks
\pdfstringdefDisableCommands{%
    \let\NoCaseChange\relax%
}
%%% Let's just remove citations from pdf bookmarks
\pdfstringdefDisableCommands{%
    \def\cite{\@gobble}%
}
%%% Let's fix \eqref in pdf bookmarks
\pdfstringdefDisableCommands{%
    \def\eqref#1{(\ref{#1})}%
}
%%% Let's make sure footnotes in section headings don't break pdf bookmarks. (Note: \footnote, as redefined below, is protected)
% \patchcmd{\section}{\sectionmark}{\let\footnote\@gobble\sectionmark}{}{}% <== not needed unless you implement running headers
\pdfstringdefDisableCommands{%
  \def\footnote#1{}%
}

%%% Here's a more cumbersome removal of the warning for $ (math shift) in pdfbookmarks.
%%% Not implementing this by default, since novice authors may benefit from the warning. :-)
%%% 	see: https://tex.stackexchange.com/a/620360/119566
%\let\oldHyPsd@CatcodeWarning\HyPsd@CatcodeWarning
%\renewcommand{\HyPsd@CatcodeWarning}[1]{% 
%  \ifnum\pdfstrcmp{#1}{math shift}=0    % If 'math shift' is present, do nothing
%  \else                                 
%    \oldHyPsd@CatcodeWarning{#1}%       % else, keep usual warning.
%  \fi
%}


\ExplSyntaxOn
%\debug_on:n { all }

%%%%%%%%%%  Commas between successive footnotes %%%%%%%%%%

\cs_new:Npn   \__mitthesis_NoteComma:n { \peek_meaning:NT \footnote { \textsuperscript{ \mdseries, } } }
\cs_new_eq:NN \__mitthesis_savefootnote: \footnote
\cs_gset_protected:Npn \footnote #1    { \__mitthesis_savefootnote: {#1} \__mitthesis_NoteComma:n } 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%  MACROS FOR HANDLING TITLE AND ABSTRACT PAGES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{ % in case microtype is not loaded
	\ProvideDocumentCommand\textls{s o m}{
		\bgroup
		#3
		\egroup
	}
	\ProvideDocumentCommand\lsstyle{}{\relax}
}

%%%%%%%%%%  Degree Date Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tl_new:N \g__mitthesis_dd_month_tl	
\tl_new:N \g__mitthesis_dd_year_tl

\cs_generate_variant:Nn  \tl_gremove_all:Nn {No}
\cs_new_protected:Nn   \__mitthesis_gset_dd_dates:nn {
	\tl_gset:Nn        \g__mitthesis_dd_month_tl {#1}
	\tl_gset:Nn        \g__mitthesis_dd_year_tl  {#2}
	\tl_gremove_all:No \g__mitthesis_dd_month_tl { \space }
	\tl_gremove_all:No \g__mitthesis_dd_year_tl  { \space }
 	\str_case_e:nnF 
		{ \str_lowercase:f { \tl_to_str:N  \g__mitthesis_dd_month_tl } }
	 	{ {february}{} {may}{} {june}{} {september}{} }
		{ \msg_error:nnn { \ClassName } { wrong_month } {#1} } 
}
\msg_new:nnnn { \ClassName } { wrong_month } 
	{ The~degree~month~must~be~one~of~February,~May,~June,~or~September. } 
	{ MIT~does~not~use~#1~as~the~degree~month. }

\NewDocumentCommand\DegreeDate{mm}{ %   {month}{year}	
	\__mitthesis_gset_dd_dates:nn {#1} {#2}
	\cs_new:Npn \DegreeMonth { \text_titlecase_first:n { \text_lowercase:n \g__mitthesis_dd_month_tl } }
	\cs_new:Npn \DegreeYear  { \text_expand:n { \g__mitthesis_dd_year_tl  } } % edited 2024/06/24
}
\msg_new:nnnn { \ClassName } { no_degree_date } { Missing~degree~date! }{
			You~MUST~issue~the~\DegreeDate{month}{year}~command~between~\string\begin{document}~and~\string\maketitle. }
		
\NewDocumentCommand\ThesisDate{m}{
	\tl_if_exist:NTF \g_mitthesis_dd_thesisdate_tl 
		{ \g_mitthesis_dd_thesisdate_tl } { \__mitthesis_gset_dd_thesisdate:n {#1} }% will use only value given first
}

\cs_if_exist:NF  \tl_gset:Ne { \cs_generate_variant:Nn \tl_gset:Nn {Ne} } % not in TeX Live 2022.
\cs_if_exist:NF  \tl_set:Ne  { \cs_generate_variant:Nn \tl_set:Nn  {Ne} } % not in TeX Live 2022.
\cs_new_protected:Nn \__mitthesis_gset_dd_thesisdate:n {
	\tl_new:N        \g_mitthesis_dd_thesisdate_tl
	\tl_gset:Ne      \g_mitthesis_dd_thesisdate_tl { \tl_trim_spaces:n {#1} }
}

% If for some reason you don't want a warning when you supply the wrong month
\NewDocumentCommand\SuppressMonthError{}
  {
  	\msg_redirect_name:nnn { \ClassName } { wrong_month } { none }
  }

%%%%%%%%%%  End Degree Date Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Author Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\seq_new:N \g__mitthesis_author_name_seq
\seq_new:N \g__mitthesis_author_department_seq
\seq_new:N \g__mitthesis_author_prevdegree_seq
\seq_new:N \g__mitthesis_author_secondprevdegree_seq
\seq_new:N \g__mitthesis_author_thirdprevdegree_seq
\seq_new:N \g__mitthesis_author_fourthprevdegree_seq
\int_gzero_new:N \g__mitthesis_author_cnt_int

\NewDocumentCommand\Author{ mm O{} O{} O{} O{} }
 {
 	\tl_if_blank:nTF {#1} 
		{
		  \msg_error:nn { \ClassName } { blank_author }
		}{
		  \__mitthesis_gset_author_data:nnnnnn { #1 } { #2 } { #3 } { #4 } { #5 } { #6 }
		}
	\tl_if_blank:nT {#2} { \msg_error:nn {\ClassName} {blank_author_dep} }
 }
\msg_new:nnnn { \ClassName } { blank_author } 
				{ Missing~author~name, \iow_newline: check~for~blank~in~\Author~command. }
				{ You~MUST~provide~an~author~name~using~the~\Author{name}{department}~command. }
\msg_new:nnnn { \ClassName } { blank_author_dep } 
				{ Missing~author~department, \iow_newline: check~for~blank~in~\Author~command. }
				{ You~MUST~provide~the~author's~department~using~the~\Author{name}{department}~command. }

\cs_if_exist:NF \seq_gput_right:ce { \cs_generate_variant:Nn \seq_gput_right:Nn {ce} } % not def'd in 2023-06-30 latex3

\cs_new_protected:Nn \__mitthesis_gset_author_data:nnnnnn
 {
	\int_gincr:N \g__mitthesis_author_cnt_int
	\seq_gput_right:ce  { g__mitthesis_author_name_seq }        { \tl_trim_spaces:n {#1} } 
	\seq_gput_right:ce  { g__mitthesis_author_department_seq }  { \tl_trim_spaces:n {#2} }
	\seq_gput_right:ce  { g__mitthesis_author_prevdegree_seq }  { \tl_trim_spaces:n {#3} }
	\seq_gput_right:ce  { g__mitthesis_author_secondprevdegree_seq } { \tl_trim_spaces:n {#4} }
	\seq_gput_right:ce  { g__mitthesis_author_thirdprevdegree_seq  } { \tl_trim_spaces:n {#5} }
	\seq_gput_right:ce  { g__mitthesis_author_fourthprevdegree_seq } { \tl_trim_spaces:n {#6} }
 }

\NewExpandableDocumentCommand\CopyrightAuthor{}{
	\tl_if_exist:NTF \g__mitthesis_copyright_author_tl
		{ \g__mitthesis_copyright_author_tl }
		{ \__mitthesis_gset_copyright_author: \g__mitthesis_copyright_author_tl }
}

\cs_if_exist:NF \cs_gset:Npe      { \cs_generate_variant:Nn \cs_gset:Npn {Npe}      } % for backward compatibility
\cs_if_exist:NF \tl_gput_right:Ne { \cs_generate_variant:Nn \tl_gput_right:Nn {Ne}  } %   not in 2023-06-30 Latex3 

\cs_new_protected:Nn \__mitthesis_gset_copyright_author: {
	\tl_new:N       \g__mitthesis_copyright_author_tl
	\int_set:Nn 	\l_tmpa_int {1} % counts authors
    \tl_gset:Ne     \g__mitthesis_copyright_author_tl  { \seq_item:cn { g__mitthesis_author_name_seq } { \l_tmpa_int } }
	\int_incr:N     \l_tmpa_int
	\int_while_do:nNnn { \l_tmpa_int } < { \g__mitthesis_author_cnt_int }
		{
		  \tl_gput_right:Ne \g__mitthesis_copyright_author_tl 
		  	{ ,~\seq_item:cn { g__mitthesis_author_name_seq } { \l_tmpa_int } }
		  \int_incr:N \l_tmpa_int   
		}
	\int_compare:nNnT { \l_tmpa_int } = { \g__mitthesis_author_cnt_int } 
		{
  	      \tl_gput_right:Ne \g__mitthesis_copyright_author_tl 
	    	{ ,~and~\seq_item:cn { g__mitthesis_author_name_seq } { \l_tmpa_int } } % add comma 2025/10/08
		}
	\tl_set:Nn \l_tmpa_tl { \tl_item:Nn \g__mitthesis_copyright_author_tl {-1} } % get last token
 	\str_case_e:nnT 
		{ \l_tmpa_tl  }
	 	{ {.}{} }
		{ \__mitthesis_copyright_remove_period:N \g__mitthesis_copyright_author_tl } % remove last token if it is a period 
	\__mitthesis_gset_author_pdfcopyright:
	\cs_gset:Npe \@author { \tl_use:N \g__mitthesis_copyright_author_tl }  % 2024/08/06
}
\cs_new_protected:Nn \__mitthesis_copyright_remove_period:N
	{
		\tl_gset:Ne #1 { \tl_range:Nnn #1 { 1 } { \tl_count:N #1 - 1 } }
	}
\cs_new_protected:Nn \__mitthesis_gset_author_pdfcopyright: {
	\tl_new:N    \g__mitthesis_pdfcopyright_author_tl
	\int_set:Nn  \l_tmpa_int {1} % counts authorno
    \tl_gset:Ne  \g__mitthesis_pdfcopyright_author_tl  
    	{ { \seq_item:cn { g__mitthesis_author_name_seq } { \l_tmpa_int } } }
	\int_until_do:nNnn { \l_tmpa_int } = { \g__mitthesis_author_cnt_int }
		{
			\int_incr:N \l_tmpa_int   
			\tl_gput_right:Ne \g__mitthesis_pdfcopyright_author_tl 
				{ ;\ { \seq_item:cn { g__mitthesis_author_name_seq } { \l_tmpa_int } } }
				% changed comma to semicolon for consistency with Dublin Core metadata format, 2024/08/30
		}
}

\tl_new:N   \g__mitthesis_author_namesize_tl
\tl_gset:Nn \g__mitthesis_author_namesize_tl { \large }
\cs_new:Nn  \__mitthesis_author_block: {
	\int_set:Nn \l_tmpa_int {1} % counts authorno
	\int_compare:nNnTF { \g__mitthesis_author_cnt_int } = {0} {
		\msg_error:nn { \ClassName } { no_author }
	}	
	{by\par
	\int_until_do:nNnn { \l_tmpa_int } = { \g__mitthesis_author_cnt_int } {
		{ \g__mitthesis_author_namesize_tl \seq_item:cn { g__mitthesis_author_name_seq } { \l_tmpa_int } } \par
		\tl_set:Ne \l_tmpa_tl { \seq_item:cn { g__mitthesis_author_prevdegree_seq } { \l_tmpa_int} }
		\tl_if_empty:NF \l_tmpa_tl { \normalsize \l_tmpa_tl } % no linebreak or par for empty items
		\tl_set:Ne \l_tmpa_tl { \seq_item:cn { g__mitthesis_author_secondprevdegree_seq } { \l_tmpa_int} } 
		\tl_if_empty:NF \l_tmpa_tl { \linebreak\normalsize \l_tmpa_tl  }
		\tl_set:Ne \l_tmpa_tl { \seq_item:cn { g__mitthesis_author_thirdprevdegree_seq } { \l_tmpa_int} } 
		\tl_if_empty:NF \l_tmpa_tl { \linebreak\normalsize \l_tmpa_tl  }
		\tl_set:Ne \l_tmpa_tl { \seq_item:cn { g__mitthesis_author_fourthprevdegree_seq } { \l_tmpa_int} } 
		\tl_if_empty:NF \l_tmpa_tl { \linebreak\normalsize \l_tmpa_tl  }
		\par and\par
		\int_incr:N \l_tmpa_int
	}
		{ \g__mitthesis_author_namesize_tl \seq_item:cn { g__mitthesis_author_name_seq } { \l_tmpa_int } } \par
		\tl_set:Ne \l_tmpa_tl { \seq_item:cn { g__mitthesis_author_prevdegree_seq } { \l_tmpa_int} }
		\tl_if_empty:NF \l_tmpa_tl { \normalsize \l_tmpa_tl } % no linebreak or par for empty items
		\tl_set:Ne \l_tmpa_tl { \seq_item:cn { g__mitthesis_author_secondprevdegree_seq } { \l_tmpa_int} } 
		\tl_if_empty:NF \l_tmpa_tl { \linebreak\normalsize \l_tmpa_tl }
		\tl_set:Ne \l_tmpa_tl { \seq_item:cn { g__mitthesis_author_thirdprevdegree_seq }  { \l_tmpa_int} } 
		\tl_if_empty:NF \l_tmpa_tl { \linebreak\normalsize \l_tmpa_tl  }
		\tl_set:Ne \l_tmpa_tl { \seq_item:cn { g__mitthesis_author_fourthprevdegree_seq } { \l_tmpa_int} } 
		\tl_if_empty:NF \l_tmpa_tl { \linebreak\normalsize \l_tmpa_tl  }
    	\par 
    }
}
\NewDocumentCommand\AuthorNameSize{m}{
		\tl_gset:Nn \g__mitthesis_author_namesize_tl {#1}
}

\cs_new:Nn \__mitthesis_author_abstractblock: {
	\int_set:Nn \l_tmpa_int {1} % counts authorno
	\int_compare:nNnTF { \g__mitthesis_author_cnt_int } = {0} {
		\msg_error:nn { \ClassName } { no_author }
		}	
		{by\par
		\int_until_do:nNnn { \l_tmpa_int } = { \g__mitthesis_author_cnt_int } {
			\seq_item:cn { g__mitthesis_author_name_seq } { \l_tmpa_int }
			\par and\par
			\int_incr:N \l_tmpa_int
		}
		\seq_item:cn { g__mitthesis_author_name_seq } { \l_tmpa_int } 
    }
}
\msg_new:nnnn { \ClassName } { no_author }
		{ Missing~author!~You~must~issue \iow_newline: the~\Author{name}{department}~command. }{
		You~MUST~issue~the~\Author{name}{department}~command~after~\string\begin{document}~and~before~\string\maketitle. }


%%%%%%%%%%  End Author Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Supervisor Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\seq_new:N \g__mitthesis_supervisor_name_seq
\seq_new:N \g__mitthesis_supervisor_title_seq
\seq_new:N \g__mitthesis_supervisor_dept_seq
\int_gzero_new:N \g__mitthesis_supervisor_cnt_int

\NewDocumentCommand\Supervisor{mmo}{
	\tl_if_blank:nT {#1} { \msg_error:nn { \ClassName } { blank_supervisor }       }
	\tl_if_blank:nT {#2} { \msg_error:nn { \ClassName } { blank_supervisor_title } }
	\IfNoValueTF {#3} 
		{ 	\msg_note:nn { \ClassName } { no_supervisor_dept  } 
			\__mitthesis_gset_supervisor_data:nnn {#1} {#2}
				{ Department~argument~was~not~used~in~\Supervisor~command. }
		} 
		{ 	\tl_if_blank:nTF {#3}
				{ 	\msg_note:nn { \ClassName } { blank_supervisor_dept  } 
					\__mitthesis_gset_supervisor_data:nnn {#1} {#2} { Blank~department~in~\Supervisor~command. }
				}{
					\__mitthesis_gset_supervisor_data:nnn {#1} {#2} {#3}
				}
		}
}
\msg_new:nnnn { \ClassName } { blank_supervisor }
		{ Missing~supervisor~name,~check\iow_newline: for~blank~in~\Supervisor{name}{title}[department]~command. 
		}{
		  You~MUST~provide~the~supervisor's~name~using~the~\Supervisor{name}{title}[department]~command. 
		}
\msg_new:nnnn { \ClassName } { blank_supervisor_title }
		{ Missing~supervisor~title,~check\iow_newline: for~blank~in~\Supervisor{name}{title}[department]~command. 
		}{
		  You~MUST~provide~the~supervisor's~title~using~the~\Supervisor{name}{title}[department]~command. 
		}
\msg_new:nnnn { \ClassName } { blank_supervisor_dept }
		{ 
		  No~supervisor~department_provided,~check\iow_newline: for~blank~in~\Supervisor{name}{title}[department]~command.
		}{
		  The~supervisor's~department~was~blank~in~the~\Supervisor{name}{title}[department]~command.
		}
\msg_new:nnnn { \ClassName } { no_supervisor_dept }
	 	{ No~supervisor~department_provided~with\iow_newline: the~optional~third~argument~of\space
		  the~\Supervisor{name}{title}[department]~command.
		}{
		  The~supervisor's~department~is~used~only~in~the~optional~Thesis~Committee~page.
		}

\cs_new_protected:Nn \__mitthesis_gset_supervisor_data:nnn
 {
	\int_gincr:N \g__mitthesis_supervisor_cnt_int
	\seq_gput_right:ce  { g__mitthesis_supervisor_name_seq }  { \tl_trim_spaces:n {#1} } 
	\seq_gput_right:ce  { g__mitthesis_supervisor_title_seq } { \tl_trim_spaces:n {#2} }
	\seq_gput_right:ce  { g__mitthesis_supervisor_dept_seq }  { \tl_trim_spaces:n {#3} }
 }

\tl_new:N   \g__mitthesis_titlepg_sup_designation_tl
\tl_new:N   \g__mitthesis_abst_sup_designation_tl
\tl_gset:Nn \g__mitthesis_titlepg_sup_designation_tl { Thesis~Supervisor } 
\tl_gset:Nn \g__mitthesis_abst_sup_designation_tl  { Thesis~supervisor } % style per MIT Libraries

% If for some reason you need to change "Thesis Supervisor" to a different string (say, "Doctoral Advisor").
% Note: this construction removes leading and trailing spaces and changes text case of the string.
\NewDocumentCommand\SupervisorDesignation{ m } { 
		\tl_gset:Nn \g__mitthesis_titlepg_sup_designation_tl 
				{ \cs_if_exist:NTF \text_titlecase_all:n % not def'd until 2023/07/08
					{ \text_titlecase_all:n { \text_lowercase:n { \tl_trim_spaces:n {#1} } } }
					{ \tl_trim_spaces:n {#1} }
				}
		\tl_gset:Nn \g__mitthesis_abst_sup_designation_tl  
				{ \text_titlecase_first:n { \text_lowercase:n { \tl_trim_spaces:n {#1} } } }
		}
		
\cs_new:Nn \__mitthesis_supervisor_abstractblock: { % revised 2025/10/09, eliminate bug and use multiple tables
	\int_set:Nn  \l_tmpa_int {1} % counts supervisors
	\setlength{\parindent}{0pt}
	\par\bigskip
	\int_compare:nNnTF { \g__mitthesis_supervisor_cnt_int } = {0} {
		\msg_error:nn { \ClassName } { no_supervisor }
		}	
		{
		\tagpdfsetup{table/tagging=presentation} 
		\int_until_do:nNnn { \l_tmpa_int } = { \g__mitthesis_supervisor_cnt_int } {
			\tl_set:Ne \l_tmpa_tl  { \seq_item:cn { g__mitthesis_supervisor_title_seq } { \l_tmpa_int } }
			\regex_replace_all:nnN { \& \s* } { \c{phantom}{Title:\c{space}} } \l_tmpa_tl 
			\begin{tabular}{@{}l@{}}
    			\g__mitthesis_abst_sup_designation_tl  :\space 
    			\seq_item:cn { g__mitthesis_supervisor_name_seq } { \l_tmpa_int } \\
    			Title:\space \l_tmpa_tl
    			\int_gincr:N \l_tmpa_int
			\end{tabular}
			\skip_vertical:n {12pt}
			}
			\tl_set:Ne \l_tmpa_tl {\seq_item:cn { g__mitthesis_supervisor_title_seq } { \l_tmpa_int } }
			\regex_replace_all:nnN { \& \s* } { \c{phantom}{Title:\c{space}} } \l_tmpa_tl 
			\begin{tabular}{@{}l@{}}
			\g__mitthesis_abst_sup_designation_tl  :\space  
			\seq_item:cn { g__mitthesis_supervisor_name_seq } { \l_tmpa_int } \\
			Title:\space   \l_tmpa_tl 
			\end{tabular}\ignorespaces
    	}
}
\msg_new:nnnn { \ClassName } { no_supervisor }
		{ Missing~supervisor!~You~must~issue~the~\Supervisor{name}{title}~command. }{
		You~MUST~issue~the~\Supervisor{name}{title}~command~after~\string\begin{document}~and~before~\string\maketitle. }


%%%%%%%%%%  End Supervisor Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Acceptor Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\seq_new:N \g__mitthesis_acceptor_name_seq
\seq_new:N \g__mitthesis_acceptor_dept_seq
\seq_new:N \g__mitthesis_acceptor_title_seq
\int_gzero_new:N \g__mitthesis_acceptor_cnt_int

\bool_new:N \g__mitthesis_acceptor_title_bool
\bool_gset_false:N \g__mitthesis_acceptor_title_bool

\NewDocumentCommand\Acceptor{mmm}{
	\tl_if_blank:nTF {#1} {
		\msg_error:nn { \ClassName } { blank_acceptor }
		}{
		\__mitthesis_gset_acceptor_data:nnn {#1} {#2} {#3}
	}
	\tl_if_blank:nT  {#2} { \msg_error:nn { \ClassName } { blank_acceptor_dep } }
	\tl_if_blank:nTF {#3} {
		\bool_gset_true:N \g__mitthesis_acceptor_title_bool
		\msg_warning:nn { \ClassName } { blank_acceptor_title }}{}
}
\msg_new:nnnn { \ClassName } { blank_acceptor }
		{ Missing~acceptor~name,~check~for~blank~in~\Acceptor{name}{department}{title}~command. }{
			You~MUST~provide~the~acceptor's~name~using~the~\Acceptor{name}{department}{title}~command. }
\msg_new:nnnn { \ClassName } { blank_acceptor_dep }
		{ Missing~acceptor~department,~check~for~blank~in~\Acceptor{name}{department}{title}~command. }{
			You~MUST~provide~the~acceptor's~department~using~the~\Acceptor{name}{department}{title}~command. }
\msg_new:nnn { \ClassName } { blank_acceptor_title }
		{ Missing~acceptor~title~(blank~in~\Acceptor{name}{department}{title}~command).\space 
		  Perhaps~you~are~trying~to~save~vertical~space?\space  
		  You~can~put~the~acceptor~title~into~department~field~instead.\space 
		  For~consistency,~I~will~omit~titles~of~ALL~acceptors.
		}

\cs_new_protected:Nn \__mitthesis_gset_acceptor_data:nnn
 {
	\int_gincr:N \g__mitthesis_acceptor_cnt_int
	\seq_gput_right:ce  { g__mitthesis_acceptor_name_seq }       { \tl_trim_spaces:n {#1} } 
	\seq_gput_right:ce  { g__mitthesis_acceptor_dept_seq } { \tl_trim_spaces:n {#2} }
	\seq_gput_right:ce  { g__mitthesis_acceptor_title_seq }      { \tl_trim_spaces:n {#3} }
 }

%%%%%%%%%%  End Acceptor Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Degree Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% extensive edits 2024/06/25

\seq_new:N \g__mitthesis_degree_name_seq
\seq_new:N \g__mitthesis_degree_dept_seq
\int_gzero_new:N \g__mitthesis_degree_cnt_int
\int_gzero_new:N \g__mitthesis_dept_cnt_int

% #1 = degree ; #2 = department
\NewDocumentCommand\Degree{mm}
 {
    \int_compare:nNnTF { \g__mitthesis_dept_cnt_int } = {0} {
    	\tl_if_blank:nTF {#1} {
    		  \msg_error:nn { \ClassName } { no_degree_name }
    		}{
			  \__mitthesis_gset_degree_name:n { #1 }
			  \int_gincr:N \g__mitthesis_degree_cnt_int
    		}
    	\tl_if_blank:nTF {#2} {
    		  \msg_error:nn { \ClassName } { no_degree_dep }
    		}{
			  \__mitthesis_gset_degree_dept:n { #2 }
			  \int_gincr:N \g__mitthesis_dept_cnt_int
			}
    }{
    	\tl_if_blank:nTF {#1} {
    		  \msg_warning:nn { \ClassName } { blank_degree }
    		}{
			  \__mitthesis_gset_degree_name:n { #1 }
			  \int_gincr:N \g__mitthesis_degree_cnt_int
			}
    	\tl_if_blank:nTF {#2} {
    		  \msg_warning:nn { \ClassName } { blank_degree_dep }
    		}{
			  \int_gincr:N \g__mitthesis_dept_cnt_int 
			  \__mitthesis_gset_degree_dept:n { #2 }
    		}
    }
 }

\cs_new_protected:Nn \__mitthesis_gset_degree_name:n
 {
	\seq_gput_right:ce  { g__mitthesis_degree_name_seq }  { \tl_trim_spaces:n {#1} } 
 }
\cs_new_protected:Nn \__mitthesis_gset_degree_dept:n
 {
	\seq_gput_right:ce  { g__mitthesis_degree_dept_seq }  { \tl_trim_spaces:n {#1} }
 }
\msg_new:nnnn { \ClassName } { no_degree_name } 
			{ Missing~degree~name,~check~for\iow_newline: blank~in~\Degree~command. } 
			{ You~MUST~provide~at~least~one~degree~name~using~the~\Degree{name}{department}~command. }
\msg_new:nnnn { \ClassName } { no_degree_dep } 
			{ Missing~degree~department~for\iow_newline: Degree~command. }
			{ You~MUST~provide~at~least~one~department~name~using~the~\Degree{name}{department}~command. }
\msg_new:nnn { \ClassName } { blank_degree } 
			{ Missing~degree~name~in~second~\Degree~command.\iow_newline: 
			  Will~treat~this~as~two~departments~issuing~one~degree. }
\msg_new:nnn { \ClassName } { blank_degree_dep } 
			{ Missing~degree~department~in~second~\Degree~command.~Will~treat~as~one~department~issuing~two~degrees. }

\cs_if_exist:NF \cs_new:Ne { \cs_generate_variant:Nn \cs_new:Nn {Ne} } % not def'd in 2023-06-30 latex3
\cs_if_exist:NF \cs_set:Ne { \cs_generate_variant:Nn \cs_set:Nn {Ne} } % not def'd in 2023-06-30 latex3

\cs_new:Nn \__mitthesis_degree_block: { % edited 2025/10/08
	\int_compare:nNnT { \g__mitthesis_degree_cnt_int } = {0}
		{ 
		  \msg_fatal:nn { \ClassName } { no_degree }
		}	
	\int_set:Nn  \l_tmpa_int {1} % count degree name
	\int_set:Nn  \l_tmpb_int {1} % count degree department
	\tl_set:Ne   \l_tmpa_tl { \seq_item:cn { g__mitthesis_degree_dept_seq } { \l_tmpb_int } }
	{Submitted\ to\ the\ \l_tmpa_tl} 
	\int_until_do:nNnn { \l_tmpb_int } = { \g__mitthesis_dept_cnt_int } {
		\int_incr:N  \l_tmpb_int
		\tl_set:Ne   \l_tmpb_tl { \seq_item:cn { g__mitthesis_degree_dept_seq } { \l_tmpb_int } }
		\mbox {\ and}\linebreak
		\mbox {the\ \l_tmpb_tl }
	}
    \linebreak \mbox {in\ partial\ fulfillment\ of\ the\ requirements\ for\ the\ 
		\int_compare:nNnTF { \g__mitthesis_degree_cnt_int } > {1} {degrees} {degree}
	\ of}
	\par
	\int_until_do:nNnn { \l_tmpa_int } = { \g__mitthesis_degree_cnt_int } {
    	\textls[60]{ \text_uppercase:n { \seq_item:cn { g__mitthesis_degree_name_seq } { \l_tmpa_int } } }\par and\par
		\int_incr:N     \l_tmpa_int
		}
    \textls[60]{\text_uppercase:n { \seq_item:cn { g__mitthesis_degree_name_seq } { \l_tmpa_int } } }\par
}
\msg_new:nnnn { \ClassName } { no_degree }
		{ Missing~degree!~You~must\iow_newline: issue~the~\Degree{name}{department}~command. 
		}{
		  You~MUST~issue~the~\Degree{name}{department}~command~after~\string\begin{document}\space
		  and~before~\string\maketitle.~ You~do~want~the~degree,~don't~you?
		}


\cs_new:Nn \__mitthesis_degree_abstractblock: { % edited 2025/10/08
	\int_set:Nn  \l_tmpa_int {1}
	\int_set:Nn  \l_tmpb_int {1}
	\tl_set:Ne \l_tmpa_tl { \seq_item:cn { g__mitthesis_degree_dept_seq } { \l_tmpb_int } }
	{Submitted\ to\ the\ \l_tmpa_tl} 
	\int_until_do:nNnn { \l_tmpb_int } = { \g__mitthesis_dept_cnt_int } {
		\int_incr:N      \l_tmpb_int
		\tl_set:Ne \l_tmpb_tl { \seq_item:cn { g__mitthesis_degree_dept_seq } { \l_tmpb_int } }
		\mbox {\ and}\linebreak
		\mbox {the\ \l_tmpb_tl }
	}
    \linebreak \mbox{on\ \g_mitthesis_dd_thesisdate_tl\ in\ partial\ fulfillment\ of\ the\ requirements\ for\ the\ 
		\int_compare:nNnTF { \g__mitthesis_degree_cnt_int } > {1} { degrees } { degree }
	\ of}
	\skip_vertical:n { 6pt plus 2pt minus 2pt }
	\int_until_do:nNnn { \l_tmpa_int } = { \g__mitthesis_degree_cnt_int } {
    	\textls[60]{ \text_uppercase:n {\seq_item:cn { g__mitthesis_degree_name_seq } { \l_tmpa_int } } } \par and \par
		\int_incr:N     \l_tmpa_int
		}
    \textls[60]{ \text_uppercase:n {\seq_item:cn { g__mitthesis_degree_name_seq } { \l_tmpa_int } } }
    \skip_vertical:n { 6pt plus 2pt minus 2pt }
}

%%%%%%%%%%  End Degree Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Signature Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NewDocumentCommand\SignatureBlockSize{m}{
	\__mitthesis_gset_signature_size:n {#1}
}

\tl_new:N \g__mitthesis_signature_size_tl
\cs_new_protected:Nn \__mitthesis_gset_signature_size:n 
  {
	\tl_gset:Nf \g__mitthesis_signature_size_tl { \tl_trim_spaces:n {#1} }
	\token_case_meaning:NnF \g__mitthesis_signature_size_tl
	{ 
		\normalsize {} \small {} \footnotesize{} \scriptsize{} \tiny{}
	} {
		\msg_error:nn { \ClassName } { weird_sigsize }
	}
  }
\msg_new:nnnn { \ClassName } { weird_sigsize }
		{ \SignatureBlockSize~expects~a~font-sizing~command,~such~as~\small,~\footnotesize,~etc.
		}{
		  You~used~a~weird~input~value~here.~If~you~did~so~deliberately,~try~continuing.
		}	

\cs_new:Nn \__mitthesis_signature_block: {
	\int_compare:nNnT { \g__mitthesis_supervisor_cnt_int } = {0} {
		\msg_error:nn { \ClassName } { no_supervisor } % this message is def'd in Abstract supervisor block
	}	
	\int_compare:nNnT { \g__mitthesis_acceptor_cnt_int } = {0} {
		\msg_error:nn { \ClassName } { no_acceptor }
	}	
	\tl_if_exist:NF \g_mitthesis_dd_thesisdate_tl { 
		\msg_error:nn { \ClassName } { no_thesis_date }
	}
	\int_gzero_new:N \g__signature_autno_int
	\int_gzero_new:N \g__signature_supno_int
	\int_gzero_new:N \g__signature_accno_int
    \g__mitthesis_signature_size_tl
    \dim_set:Nn \topsep {0pt}
    \dim_set:Nn \partopsep {0pt}
    %\begin{tabbing}
    %\hspace{1.35in} \= \hspace{1in} \kill 
    %%% replaced eight \> by &; eliminate tabbing, 2025/1/15
    \noindent
    { \tagpdfsetup{table/tagging=presentation}
        \begin{tabular}{@{}ll@{}}
    	\int_do_while:nNnn { \g__signature_autno_int } < { \g__mitthesis_author_cnt_int } {
    		\int_gincr:N  \g__signature_autno_int
    		Authored\ by: & \seq_item:cn { g__mitthesis_author_name_seq } { \g__signature_autno_int } \\  
    		& \seq_item:cn { g__mitthesis_author_department_seq } { \g__signature_autno_int } \\
    		& \g_mitthesis_dd_thesisdate_tl \\[1em]
    	}
    	\int_do_while:nNnn { \g__signature_supno_int } < { \g__mitthesis_supervisor_cnt_int } {
    		\int_gincr:N  \g__signature_supno_int
    		Certified\ by: & \seq_item:cn { g__mitthesis_supervisor_name_seq } { \g__signature_supno_int } \\
    		& \seq_item:cn { g__mitthesis_supervisor_title_seq } { \g__signature_supno_int },\ 
    			\g__mitthesis_titlepg_sup_designation_tl \\[1em]
    	}
    	\int_compare:nNnF { \g__mitthesis_acceptor_cnt_int } = {0} {
        	\int_do_while:nNnn { \g__signature_accno_int } < { \g__mitthesis_acceptor_cnt_int } {
        		\int_gincr:N  \g__signature_accno_int
        		Accepted\ by: & \seq_item:cn { g__mitthesis_acceptor_name_seq } { \g__signature_accno_int } \\
        		& \seq_item:cn { g__mitthesis_acceptor_dept_seq } { \g__signature_accno_int }
        			\bool_if:NF \g__mitthesis_acceptor_title_bool
        			{
        				\\
        				& \seq_item:cn { g__mitthesis_acceptor_title_seq } { \g__signature_accno_int }
        			}
    			\int_compare:nNnTF { \g__signature_accno_int } = { \g__mitthesis_acceptor_cnt_int } 
    			{ \\ }{ \\[1em] }
         	}
    	}
    	%\end{tabbing}
    	\end{tabular}
	}
}
\msg_new:nnnn { \ClassName } { no_acceptor }
		{ Missing~acceptor!You~must~issue~the~\Acceptor{name}{department}{title}~command.
		}{
		  You~MUST~issue~the~\Acceptor{name}{department}{title}~command~after~\string\begin{document}\space
		  and~before~\string\maketitle.
		}
\msg_new:nnnn { \ClassName } { no_thesis_date }
		{ Missing~thesis~date!~You~must~issue~the~\ThesisDate{Date~thesis~is~submitted}~command.
		}{
		  You~MUST~issue~the~\ThesisDate{Date~thesis~is~submitted}~command~after~\string\begin{document}\space
		  and~before~\string\maketitle.
		}

% If for some reason you don't want a warning when you omit \Acceptor
\NewDocumentCommand\SuppressAcceptorError{}
  {
  	\msg_redirect_name:nnn { \ClassName } { no_acceptor } { none }
  }

%%%%%%%%%%  End Signature Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Copyright Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Directly add the xmp property that shows work is copyrighted. See l3pdfmeta.pdf. 
% This is not automatic with \DocumentMetadata. "True" must be capitalized.
%
\cs_if_exist:NT \pdfmeta_xmp_add:n { \pdfmeta_xmp_add:n { <xmpRights:Marked>True</xmpRights:Marked> } }

\tl_new:N \g__mitthesis_copyright_ccname_tl
\tl_new:N \g__mitthesis_copyright_cclicense_tl
\tl_new:N \g__mitthesis_copyright_license_tl
\tl_new:N \g__mitthesis_copyright_pdfrights_tl
\tl_new:N \g__mitthesis_copyright_crwords_tl
\tl_new:N \g__mitthesis_copyright_mitpermlast_tl

\tl_new:N \g__mitthesis_copyright_mitpermission_tl
\tl_gset:Nn \g__mitthesis_copyright_mitpermlast_tl 
	{
	  to\ MIT\ a\ nonexclusive,\ worldwide,\ irrevocable,\ royalty-free\ license\ to\ exercise\ 
	  any\ and\ all\ rights\ under\ copyright,\ including\ to\ reproduce,\ preserve,\ distribute\ 
	  and\ publicly\ display\ copies\ of\ the\ thesis,\ or\ release\ the\  thesis\ under\ an\ 
	  open-access\ license.
	}

\bool_new:N \g__mitthesis_cclicense_bool
\bool_gset_false:N \g__mitthesis_cclicense_bool

\NewDocumentCommand\CClicense{mm}{
	\__mitthesis_gset_copyright_licensedata:nn {#1} {#2}
}
\cs_new_protected:Nn \__mitthesis_gset_copyright_licensedata:nn 
  {
	\tl_gset:Nf \g__mitthesis_copyright_cclicense_tl { \hrefurl{ \tl_trim_spaces:n {#2} }{ \tl_trim_spaces:n {#1} } } % #1 - text, #2 - url  
	\tl_gset:Ne \g__mitthesis_copyright_ccname_tl        { \tl_trim_spaces:n {#1} } 
	\bool_gset_true:N \g__mitthesis_cclicense_bool
	\cs_if_exist:NT \pdfmeta_xmp_add:n {
			\pdfmeta_xmp_add:n { <xmpRights:WebStatement>#2</xmpRights:WebStatement> }
	}
	\cs_if_exist:NTF \msg_note:nnn % command was added to expl3 2021/05/18
	  {
		\msg_note:nnn { \ClassName } { cclicense} {#1}
	  }
	  {
		\msg_log:nnn  { \ClassName } { cclicense} {#1}
	  } 
  }
\msg_new:nnn { \ClassName } { cclicense } { Using~Creative~Commons~License~#1. }


%%%%%%%%%%  End Copyright Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Reader module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\seq_new:N \g__mitthesis_reader_name_seq
\seq_new:N \g__mitthesis_reader_title_seq
\seq_new:N \g__mitthesis_reader_department_seq
\int_gzero_new:N \g__mitthesis_readercnt_int

\NewDocumentCommand\Reader{mmm}{
	\tl_if_blank:nTF {#1} {
		\msg_error:nn { \ClassName } { blank_reader }
		}{
		\__mitthesis_gset_reader_data:nnn {#1} {#2} {#3}
	}
	\tl_if_blank:nT {#2} {  \msg_error:nn { \ClassName } { blank_reader_title } }
	\tl_if_blank:nT {#3} {  \msg_error:nn { \ClassName } { blank_reader_dep   } }
}
\msg_new:nnnn { \ClassName } { blank_reader }
		{ Missing~reader~name,~check~for~blank~in~\Reader{name}{title}{department}~command. }{
			You~MUST~provide~the~reader's~name~using~the~\Reader{name}{title}{department}~command. }
\msg_new:nnnn { \ClassName } { blank_reader_title }
		{ Missing~reader~title,~check~for~blank~in~\Reader{name}{department}{title}~command. }{
			You~MUST~provide~the~reader's~title~using~the~\Reader{name}{title}{department}~command. }
\msg_new:nnnn { \ClassName } { blank_reader_dep }
		{ Missing~reader~department,~check~for~blank~in~\Reader{name}{title}{department}~command. }{
			You~MUST~provide~the~reader's~department~using~the~\Reader{name}{title}{department}~command. }

\cs_new_protected:Nn \__mitthesis_gset_reader_data:nnn
 {
	\int_gincr:N \g__mitthesis_readercnt_int
	\seq_gput_right:ce  { g__mitthesis_reader_name_seq  }      { \tl_trim_spaces:n {#1} } 
	\seq_gput_right:ce  { g__mitthesis_reader_title_seq }      { \tl_trim_spaces:n {#2} }
	\seq_gput_right:ce  { g__mitthesis_reader_department_seq } { \tl_trim_spaces:n {#3} }
 }

%%%%%%%%%%  End reader module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Title page Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RenewDocumentCommand\title{m}
	{
		\__mitthesis_gset_title:n { #1 }
		\cs_gset:Npe \@title { \tl_use:N \g_mitthesis_title_tl } % 2024/08/06
		\hypersetup{
			pdftitle={ { \g_mitthesis_title_tl } }, % extra braces protect commas that may be in title tl.
		}
	}

\tl_new:N \g_mitthesis_title_tl

\cs_new_protected:Nn \__mitthesis_gset_title:n
	{
		\tl_gset:Nn \g_mitthesis_title_tl { \tl_trim_spaces:n {#1} }
	}

\tl_new:N \g_titlepage_institution_name_tl
\tl_gset:Nn \g_titlepage_institution_name_tl { Massachusetts\ Institute\ of\ Technology } 
\cs_new_protected:Npn \Institution #1 { \tl_gset:Nn \g_titlepage_institution_name_tl { \tl_trim_spaces:n #1 } }


%%%%%%% Adjust vertical skips between the major blocks of the title page

\bool_new:N \g__mitthesis_title_squashglue_bool
\cs_new_protected:Nn \__mitthesis_titlepage_bottomskip: {
	\if_bool:N \g__mitthesis_title_squashglue_bool 
		{ 	\skip_vertical:n { 0pt plus 1filll  } }
	\else:
		{   \skip_vertical:n { 0pt plus 12fill } }
	\fi:
}
\NewDocumentCommand\Squash{}{ \bool_gset_true:N \g__mitthesis_title_squashglue_bool } % Squashes all glue from bottom upward

\bool_new:N \g__mitthesis_title_tighten_bool
\cs_new_protected:Nn \__mitthesis_titlepage_blockskip:nn {
	\if_bool:N \g__mitthesis_title_tighten_bool 
		{ 	\skip_vertical:n { 6pt plus #2fill    } }
	\else:
		{   \skip_vertical:n { #1pt plus #2fill } }
	\fi:
}
\NewDocumentCommand\Tighten{}{ \bool_gset_true:N \g__mitthesis_title_tighten_bool } % Reduces 12pt and 18pt skips to 6pt

%%%%%%%%%%%%

\RenewDocumentCommand\maketitle{s}{
	\cs_if_exist:NF \DegreeMonth { \msg_error:nn { \ClassName } { no_degree_date } } % msg def'd in degree-date section
%	
	\bool_if:NTF \g__mitthesis_cclicense_bool { 
		\tl_gset:Nn \g__mitthesis_copyright_license_tl 
			{ This\ work\ is\ licensed\ under\ a\ \mbox{ \g__mitthesis_copyright_cclicense_tl }\ license.\par
			  \g__mitthesis_copyright_mitpermission_tl 
			}
		\tl_gset:Nn \g__mitthesis_copyright_pdfrights_tl 	 
			{ This\ work\ is\ licensed\ under\ a\ \g__mitthesis_copyright_ccname_tl\ license.\space 
			  \g__mitthesis_copyright_mitpermission_tl
			}
	}{
		\tl_gset:Nn \g__mitthesis_copyright_license_tl 
			{ All\ rights\ reserved. \par\g__mitthesis_copyright_mitpermission_tl }
		\tl_gset:Nn \g__mitthesis_copyright_pdfrights_tl 	 
			{ All\ rights\ reserved.\space \g__mitthesis_copyright_mitpermission_tl }
   }
   \int_compare:nNnTF { \g__mitthesis_author_cnt_int } > {1} 
   		{   
			\tl_gset:Nn \g__mitthesis_copyright_crwords_tl { The\ authors\ hereby\ grant } 
		}
		{
			\tl_gset:Nn \g__mitthesis_copyright_crwords_tl { The\ author\ hereby\ grants } 
		}
    \IfBooleanTF {#1}{
	    \tl_gset:Nn \g__mitthesis_copyright_mitpermission_tl { \scan_stop: }
    }{
	    \tl_gset:Nn \g__mitthesis_copyright_mitpermission_tl 
	    	{ \g__mitthesis_copyright_crwords_tl\ \g__mitthesis_copyright_mitpermlast_tl }
    }
%
	\clearpage
	\thispagestyle{empty}
	\tag_struct_begin:n { tag=Sect, title=Titlepage }
	\vbox_to_ht:nn { \vsize } % to prevent signature block from breaking across page
		{
			{ \centering
                \setlength{\parskip}{7.5pt plus 1pt minus 1pt} % edited all vertical space on this page 2023/10/25
                \setlength{\parindent}{0pt}\pdfbookmark[0]{Title\ Page}{titlepage}
                {
					\tag_struct_begin:n { tag=Title, title=Title }
					\leavevmode
					\tag_struct_begin:n { tag=Strong }
                    \tag_mc_begin:n { tag=Strong }
                    \Large\textbf{ \g_mitthesis_title_tl }
                    \par
                    \tag_mc_end:
                    \tag_struct_end:
                    \tag_struct_end:
                }
    			\__mitthesis_titlepage_blockskip:nn {12}{1.5}
				\tag_struct_begin:n { tag=Div, title=Author }
                \__mitthesis_author_block:
    			\tag_struct_end:
				\__mitthesis_titlepage_blockskip:nn {12}{1.5}
                \tag_struct_begin:n { tag=Div, title=Degree } 
                \__mitthesis_degree_block:
                at~the\par
                \textls[60]{ \text_uppercase:n { \g_titlepage_institution_name_tl } } \par
                \DegreeMonth\ \DegreeYear\par
                \tag_struct_end:
    			\__mitthesis_titlepage_blockskip:nn {12}{2}
				\tag_struct_begin:n { tag=Div, title=Copyright }
                \copyright\space\DegreeYear\space\CopyrightAuthor\@.\c_space_token \g__mitthesis_copyright_license_tl % \@. in case name ends with III, IV, V,...
				\par % required to center \g_copyrightlicense_tl text.
				\tag_struct_end:
			}
			\__mitthesis_titlepage_blockskip:nn {18}{2}
            \tag_struct_begin:n {tag=Div, title=Signatures}
            \__mitthesis_signature_block:
			\tag_struct_end:
			\__mitthesis_titlepage_bottomskip:
		}
		\tag_struct_end: % end section
		\hypersetup{
    		pdfcopyright={ Copyright\ \DegreeYear\ by\ \CopyrightAuthor.\space \g__mitthesis_copyright_pdfrights_tl },
    		pdfauthor={ \g__mitthesis_pdfcopyright_author_tl },
    		pdfcaptionwriter = { \g__mitthesis_pdfcopyright_author_tl },
    	}
	\cleardoublepage
	\int_compare:nNnF { \g__mitthesis_readercnt_int } = {0} { \__mitthesis_committee_block: }
}

%%%%%%%%%%  End title page module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Thesis committee members page module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Presentation tables are used on this page for rendering the tagged file into html with consistent alignments.
%

% select something other than "Thesis Reader"
\tl_new:N   \g__mitthesis_reader_name_tl
\tl_gset:Nn \g__mitthesis_reader_name_tl { Thesis~Reader } 
\NewDocumentCommand\ThesisReaderName{ m } { 
		\tl_gset:Nn \g__mitthesis_reader_name_tl 
				{ \cs_if_exist:NTF \text_titlecase_all:n % not def'd until 2023/07/08
					{ \text_titlecase_all:n { \text_lowercase:n { \tl_trim_spaces:n {#1} } } }
					{ \tl_trim_spaces:n {#1} }
				}
		}
% use plural "Supervisors" if more than one supervisor
\cs_new_protected:Nn \__mitthesis_gset_supervisor_plurals: {
    \int_compare:nNnT { \g__mitthesis_supervisor_cnt_int } > {1} 
       	{   
    		\tl_gput_right:Nn \g__mitthesis_titlepg_sup_designation_tl { s } 
    	}
    \int_compare:nNnT { \g__mitthesis_readercnt_int } > {1} 
       	{   
    		\tl_gput_right:Nn \g__mitthesis_reader_name_tl { s } 
    	}
}

% selection something other than "THESIS COMMITTEE"
\tl_new:N   \g__mitthesis_committee_name_tl
\tl_gset:Nn \g__mitthesis_committee_name_tl { THESIS~COMMITTEE } 
\NewDocumentCommand\ThesisCommitteeName{ m } { 
		\tl_gset:Nn \g__mitthesis_committee_name_tl 
				{ \cs_if_exist:NTF \text_uppercase:n % not def'd until 2023/07/08
					{ \text_uppercase:n { \tl_trim_spaces:n {#1} } }
					{ \MakeUpperCase{ \tl_trim_spaces:n {#1} } }
				}
		}

% reduce white space around title ("THESIS COMMITTEE"), e.g., if too many committee members
\bool_new:N \g__mitthesis_short_cmtitle_bool
\cs_new_protected:Nn \__mitthesis_cmtitle_blockskip: {
	\if_bool:N \g__mitthesis_short_cmtitle_bool 
		{ 	\skip_vertical:n { 32pt } }
	\else:
		{   \skip_vertical:n { 56pt } }
	\fi:
}
\NewDocumentCommand\CMPShortenTop{}{ \bool_gset_true:N \g__mitthesis_short_cmtitle_bool } % Reduces 56pt skips to 32pt

% styling of text in headings
\cs_new:Nn  \__mitthesis_CMstyle:n    { \bfseries  \Large\lsstyle #1 } 
\cs_new:Nn  \__mitthesis_CMsubstyle:n { \normalfont\scshape\large\lsstyle #1 }


% split title list at "\\ &", convert "\&" to "and", \emph each item in the sequence, output emphasized items each separated by "\\ &".  
\regex_new:N   \g__mitthesis_split_lines_regex
\regex_gset:Nn \g__mitthesis_split_lines_regex   { \\\\ \s* \& }
\regex_new:N   \g__mitthesis_fix_ampersand_regex
\regex_gset:Nn \g__mitthesis_fix_ampersand_regex { \\& }
\seq_new:N     \g__mitthesis_titles_seq

\cs_if_exist:NF \str_set:Ne      { \cs_generate_variant:Nn \str_set:Nn {Ne} } 		% not def'd 2023 TeX Live
\cs_if_exist:NF \regex_split:NVN { \cs_generate_variant:Nn \regex_split:NnN {NVN} } % not def'd 2023 TeX Live
\cs_if_exist:NF \tl_to_str:e     { \cs_generate_variant:Nn \tl_to_str:n {e} } 		% not def'd 2023 TeX Live

\cs_new_protected:Nn  \__mitthesis_assemble_CMtitle_list:n 
  {
    \str_set:Ne \l_tmpa_str { \tl_to_str:e {#1} }
	\regex_split:NVN \g__mitthesis_split_lines_regex \l_tmpa_str \g__mitthesis_titles_seq
    \seq_map_inline:Nn \g__mitthesis_titles_seq
      {
		\regex_replace_all:NnN \g__mitthesis_fix_ampersand_regex { and } \g__mitthesis_titles_seq 
		% replaces "\&" by "and"; the string "\&" would otherwise be typeset verbatim.
	  }
	\seq_set_map:NNn \l_tmpa_seq \g__mitthesis_titles_seq { \emph { ##1 } }
	\seq_use:Nnnn    \l_tmpa_seq { \\ & } { \\ & } { \\ & }
  }


% layout thesis committee members page
\cs_if_exist:NF \str_gset:Ne { \cs_generate_variant:Nn \str_gset:Nn {Ne} }   		 % not def'd 2023 TeX Live
\cs_if_exist:NF \text_titlecase_all:n {\cs_new:Npn \text_titlecase_all:n #1 { #1 } } % not def'd 2023 TeX Live
\cs_if_exist:NF \text_lowercase_all:n {\cs_new:Npn \text_lowercase_all:n #1 { #1 } } % not def'd 2023 TeX Live

\cs_new_protected:Nn \__mitthesis_committee_block: {
	\int_gzero_new:N \g__mitthesis_committee_supno_int
	\int_gzero_new:N \g__mitthesis_committee_readerno_int
	
	\__mitthesis_gset_supervisor_plurals:
    \str_new:N   \g__mitthesis_committee_name_str
    \str_gset:Ne \g__mitthesis_committee_name_str 
    	{
		  \text_titlecase_all:n { \text_lowercase:n { \g__mitthesis_committee_name_tl } }
		}

	\vbox_to_ht:nn { \vsize } % to prevent committee page splitting into two pages
		{ 
        \tag_struct_begin:n { tag=Sect, title=committee_page }
        	\leavevmode   
			\hbox:n {} 
        	\__mitthesis_cmtitle_blockskip:
			{ % to contain \raggedleft
        	\raggedleft	 
            \tagpdfsetup{ table/tagging=presentation }
        	\begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
             	&
            	\tag_struct_begin:n { tag=Strong }
                \tag_mc_begin:n { tag=Strong  }                
            	\__mitthesis_CMstyle:n { \g__mitthesis_committee_name_tl }
            	\tag_mc_end:
                \tag_struct_end:
                \pdfbookmark[0]{ \g__mitthesis_committee_name_str }{ thesiscommittee }
        	\end{tabular*}
        	\__mitthesis_cmtitle_blockskip:
	
        	\begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
    			&\__mitthesis_CMsubstyle:n { \g__mitthesis_titlepg_sup_designation_tl }
        	\end{tabular*}
        	\skip_vertical:n {12pt} 
        	\int_do_while:nNnn { \g__mitthesis_committee_supno_int } < { \g__mitthesis_supervisor_cnt_int } {
             	\int_gincr:N  \g__mitthesis_committee_supno_int
                \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        			&
    				\tag_struct_begin:n { tag=Strong }
                	\tag_mc_begin:n { tag=Strong }
        			\textbf{ \seq_item:cn { g__mitthesis_supervisor_name_seq } { \g__mitthesis_committee_supno_int } }
        			\tag_mc_end:
                    \tag_struct_end:
        			\\      
        			& \__mitthesis_assemble_CMtitle_list:n { \seq_item:cn { g__mitthesis_supervisor_title_seq }
						{ \g__mitthesis_committee_supno_int } } \\ 
					& \__mitthesis_assemble_CMtitle_list:n { \seq_item:cn { g__mitthesis_supervisor_dept_seq }
						{ \g__mitthesis_committee_supno_int } } 
        		\end{tabular*}
        		\skip_vertical:n {14pt}
        	}
        	\skip_vertical:n {32pt}
	
        	\begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        		&\__mitthesis_CMsubstyle:n { \g__mitthesis_reader_name_tl }
        	\end{tabular*}
        	\skip_vertical:n {12pt}
        		
        	\int_compare:nNnF { \g__mitthesis_readercnt_int } = {0} {
            	\int_do_while:nNnn { \g__mitthesis_committee_readerno_int } < { \g__mitthesis_readercnt_int } {
        			\int_gincr:N  \g__mitthesis_committee_readerno_int
                  	\begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        				&
						\tag_struct_begin:n { tag=Strong }
                		\tag_mc_begin:n { tag=Strong }
        				\textbf{ \raggedleft 
							\seq_item:cn { g__mitthesis_reader_name_seq } { \g__mitthesis_committee_readerno_int } }
        	    		\tag_mc_end:
                        \tag_struct_end:
                        \\
                	    & \__mitthesis_assemble_CMtitle_list:n { \seq_item:cn { g__mitthesis_reader_title_seq }
	    					{ \g__mitthesis_committee_readerno_int } } \\
                        & \__mitthesis_assemble_CMtitle_list:n { \seq_item:cn { g__mitthesis_reader_department_seq }
                        	{ \g__mitthesis_committee_readerno_int } }
        		   \end{tabular*}
        		\skip_vertical:n {14pt}
        		}
        	}
    	\tag_struct_end:
		}
		\skip_vertical:n { 0pt plus 16fill }
		}
	\cleardoublepage\ignorespacesafterend
}

%%%%%%%%%%  End thesis committee members page module  %%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Abstract page module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% to change abstract name  (e.g., to "Summary"), follow either approach in your preamble:
%
%	\RenewExpandableDocumentCommand\abstractname{}{Summary}
%	\renewcommand\abstractname{Summary}

\RenewDocumentEnvironment{abstract}{+b}{
	\cleardoublepage % use this (rather than \newpage) in case committee members page is present
    \tag_struct_begin:n { tag=Sect, title=Abstract~page }
    { \centering
    	\tag_struct_begin:n { tag=Div, title=Abstract~title }
        \pdfbookmark[0]{Abstract}{abstract}
        \leavevmode
		\tag_struct_begin:n { tag=Strong }
        \tag_mc_begin:n { tag=Strong }            
        {\large { \textbf{ \g_mitthesis_title_tl } }
        \par}
        \tag_mc_end:
        \tag_struct_end:
        \tag_struct_end:
        \setlength{\parskip}{0.5\baselineskip plus 2pt minus 2pt}
        \tag_struct_begin:n { tag=Div, title=Abstract~author }
        \__mitthesis_author_abstractblock:
        \par\tag_struct_end: % \par is necessary to end the structure, 2025/01/17
        \tag_struct_begin:n { tag=Div, title=Abstract~degree }
        \__mitthesis_degree_abstractblock:
        \tag_struct_end:
	}
    \skip_vertical:n {2\baselineskip}
    \tag_struct_begin:n { tag=Div, title-o=\abstractname }
    \noindent
    \tag_struct_begin:n { tag=Strong }
    \tag_mc_begin:n { tag=Strong }
	\textbf{ \text_uppercase:n { \abstractname } }
	\tag_mc_end:
    \tag_struct_end:
	\skip_vertical:n { 0.5em }
	#1
	\par\tag_struct_end:
	\tl_if_blank:nT {#1} { MISSING\ ABSTRACT!  \msg_error:nn { \ClassName } { missing_abstract } }
}{
	\tag_struct_begin:n { tag=Div, title-o=\g__mitthesis_abst_sup_designation_tl }
    \__mitthesis_supervisor_abstractblock:
    \tag_struct_end: % end div
	\tag_struct_end: % end section
	\cleardoublepage\ignorespacesafterend
}
\msg_new:nnnn { \ClassName } { missing_abstract } { Missing~Abstract!! } 
	{ No~file~was~input~for~the~abstract.~You~need~to~do~\string\input{abstract.tex}. }

%%%%%%%%%%  End abstract page module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\debug_off:n {all}
\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% End title and abstract page codes  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  A nomenclature environment  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecommand{\nomname}{Nomenclature}  
\newlength\nomenwidth
\newlength\savitemsep

% nomenclature entries
\NewDocumentCommand\entry{m m}{%
    \item[#1\hfill]#2%
    \@itempenalty=-\@lowpenalty
}
% nomenclature subheadings 
\NewDocumentCommand\EntryHeading{m}{%
	\itemsep3\p@ plus 1\p@ minus 1\p@
    \goodbreak\item[\emph{#1}\hfill]\mbox{}% mbox added for tagged pdf 2023/10/11; 2025/09/23 replace \itshape by \emph for css
    \setlength{\itemsep}{\savitemsep}\@itempenalty=10000 % increased to 10000, 2025/04/20
}
%
%   Increase first optional argument to > 2em if wide entries cause undesired misalignment of columns. 
%   Second optional argument can be used to rename the environment, e.g., to List of Symbols.
%   Third optional argument selects section-level or chapter-level style for the nomenclature list.
%   Fourth option argument selects the style of the toc entry (by default, same as #3); the values
%		frontmatter or backmatter can be used when nomenclature is located with front or back matter. 2025/01/17
\NewDocumentEnvironment{nomenclature}{O{2em} O{\nomname} O{section} O{#3}}{%
    \setlength\columnsep{2em}% 
    \setlength{\nomenwidth}{#1}%
    \MakeLinkTarget*{nomenclature}\csname #3\endcsname *{#2}\addcontentsline{toc}{#4}{#2}%
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
}{\end{list}\ignorespacesafterend}

%	The *-version, nomenclature*, sets the nomenclature in a two-column format.
%   The user must load the multicol package!
%	The loading is done *inside* the environment and *before* the list starts so that:
%	i) the nomenclature heading is not in two-column; ii) the list margins are correct.
%
\NewDocumentEnvironment{nomenclature*}{ O{2em} O{\nomname} O{section} O{#3} }{%
    \setlength\columnsep{2em}% 
    \setlength{\nomenwidth}{#1}%
    \MakeLinkTarget*{nomenclature}\csname #3\endcsname *{#2}\addcontentsline{toc}{#4}{#2}%
    \vspace{-\multicolsep}% don't to add to the vertical space already provided by the heading
	\begin{multicols}{2}%
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
}{\end{list}\end{multicols}\ignorespacesafterend}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
%%
%% End of file `mitthesis.cls'.
