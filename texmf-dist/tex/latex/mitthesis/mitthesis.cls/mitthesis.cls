% MIT thesis class

% !TEX encoding = UTF-8 Unicode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  This file provides the mitthesis LaTeX class for formatting theses according to 
%%  MIT Libraries' requirements as of 2026.
%%
%%  This file's version and date:
	\def\versionno{1.25}
	\def\versiondate{2026/11/23\space}
%%
%%  Author: John H. Lienhard, V
%%          Department of Mechanical Engineering
%%          Massachusetts Institute of Technology
%%          Cambridge, MA 02139-4307 USA
%%
%%  This class is compatible with either pdfLaTeX or LuaLaTeX. 
%%
%%	Use an up-to-date LaTeX distribution:at least TeX Live 2023 with patches 2023/06/01 -- but today's version is recommended!
%%	All packages required by the class are in TeX Live and available at no cost from CTAN (https://ctan.org/). 
%%
%%  The most current version of this package will always be at: https:ctan.org/pkg/mitthesis
%%
%%
% ============================================================
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
%% In no event shall the authors or copyright holders be liable for any claim, damages or other liability, 
%% whether in an action of contract, tort or otherwise, arising from, out of or in connection with the 
%% software or the use or other dealings in the software.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mitthesis}[\versiondate v\versionno\space MIT Thesis Template (JHL)]

\@ifl@t@r\fmtversion{2023/06/01}{\relax}{% earlier versions are not supported
	\ClassError{mitthesis}{Your LaTeX format is dated \fmtversion.  Formats dated 2023-06-01 or later are necessary for this class. Older formats are not supported and will generate serious errors.}{UPDATE your LaTeX distribution. TeX Live is available for download at no charge: https://www.tug.org/texlive/.}%
	\@@end % hard stop. You need to update to run this code.
}

\newif\ifpdftex % user command
\ExplSyntaxOn
%\debug_on:n {all}
	\str_const:Nn \ClassName {mitthesis}
	\prop_gput:Nnn \g_msg_module_type_prop { \ClassName } { Class }
	\sys_if_engine_pdftex:TF  
		{ 
		  \let\ifmitthesis@pdftex\iftrue 
		  \pdftextrue
	   	  \msg_new:nnn { \ClassName } { notagpdftex } { Run~lualatex,~not~pdflatex,\iow_newline: 
		  												when~tagging~is~used~in~\token_to_str:N \DocumentMetadata } 
		  \cs_if_exist:NT \tag_if_active:T % def'd in 2022/06/01 LaTeX *if* \DocumentMetadata is loaded.
			{
		     \tag_if_active:T { \msg_error:nn  { \ClassName } { notagpdftex } }
			}
		}{
		 \let\ifmitthesis@pdftex\iffalse 
		}
\ExplSyntaxOff


%%%%%%%%%%%%%  Some compatibility for older latex distributions  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOn
%%% backward compatibility for TeX Live 2023
\cs_generate_variant:Nn \cs_gset:Npn  {Npe}      % not in 2023-06-30 Latex3 
\cs_generate_variant:Nn \msg_note:nnn {nnV}      % not def'd in TL 2023
\cs_generate_variant:Nn \regex_split:NnN   {NVN} % not def'd in TL 2023
\cs_generate_variant:Nn \seq_gput_right:Nn {Ne}  % not def'd in TL 2023
\cs_generate_variant:Nn \seq_item:Nn       {NV}  % not def'd in TL 2023
\cs_generate_variant:Nn \tl_gput_right:Nn  {Ne}  % not in 2023-06-30 Latex3 
%
%\cs_generate_variant:Nn \str_gset:Nn {Ne}      % looks ok by mid-2023
%
\cs_if_exist:NF \text_titlecase_all:n { \cs_new:Npn \text_titlecase_all:n #1 { \text_titlecase_first:n {#1} }  }        % not def'd until 2023/07/08
\cs_if_exist:NF \text_uppercase:n { \cs_new:Npn \text_titlecase_all:n #1 { \MakeUpperCase{ \tl_trim_spaces:n {#1} } } } % not def'd until 2023/07/08
%
\cs_if_exist:NF \exp_after:w      { \cs_new_eq:NN \exp_after:w \exp_after:wN } % 2026/08 change to expl3
%
\ExplSyntaxOff

\NewDocumentCommand\CiteNolink{om}{\begin{NoHyper}\IfValueTF{#1}{\cite[#1]{#2}}{\cite{#2}}\end{NoHyper}}
% for use in optional arg of \caption[..]{..} to prevent nested link in lof/lot, which breaks tagging.
% included for limited backward compatibility with tagging under TeX Live 2025, 2025/10/25. Not needed with TL 2026.


%%%%%%%%%%%%%% Options for the class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOn

\bool_new:N \g__mitthesis_mydesign_bool
\tl_new:N   \g__mitthesis_fontset_tl
\tl_new:N   \g__mitthesis_designfile_tl
\tl_gset:Nn \g__mitthesis_fontset_tl  { defaultfonts }

\cs_new_protected:Npn \__mitthesis_gset_testdesign:n #1
	{
	    \bool_gset_true:N \g__mitthesis_mydesign_bool
     	\tl_gset:Nn       \g__mitthesis_designfile_tl {#1}
    	\tl_if_empty:NT   \g__mitthesis_designfile_tl { \tl_gset:Nn \g__mitthesis_designfile_tl {mydesign} }
	}

\DeclareKeys[\ClassName]{
	fontset  	  .code   = \tl_gset:Nn \g__mitthesis_fontset_tl {#1} ,
	fontset  	  .usage  = load ,
	lineno   	  .if     = mitthesis@lineno ,% produces \ifmitthesis@lineno, usable outside expl3 in mydesign.tex
	lineno 	 	  .usage  = load ,
	mydesign 	  .code	  = \__mitthesis_gset_testdesign:n {#1} , 
	mydesign 	  .usage  = load ,
} 
\DeclareUnknownKeyHandler[\ClassName]
    { \PassOptionsToClass{\CurrentOption}{report} }
\ProcessKeyOptions[\ClassName]

\ExplSyntaxOff

%%%%%%%%%%%%%  Load the base class  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[12pt,openright]{report}% [twoside] option can be issued in the .tex file; point size must be set here.


%%%%%%%%%%%%  Accommodations for tagpdf  %%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOn

% Fallbacks in case \DocumentMetadata is omitted (so that tagpdf-base is not loaded).
% With \DocumentMetadata, all of these exist and none of this code runs.
\cs_if_exist:NF \tag_if_active:TF
  {
    \prg_new_conditional:Npnn \tag_if_active: { p , T , F , TF }
      { \prg_return_false: }
  }

\cs_if_exist:NF \tag_struct_begin:n
  {
    \cs_new_protected:Npn \tag_struct_begin:n #1 { }
    \cs_new_protected:Npn \tag_struct_end:       { }
  }

\cs_if_exist:NF \tag_mc_begin:n
  {
    \cs_new_protected:Npn \tag_mc_begin:n #1 { }
    \cs_new_protected:Npn \tag_mc_end:       { }
  }

\cs_if_exist:NF \tagpdfsetup
  { \cs_new_protected:Npn \tagpdfsetup #1 { } }


% Can include some css to style the html-rendered thesis, 2025/10/15.
\tag_if_active:T { % 2025/04/26
    \msg_new:nnn    { \ClassName } { no_css_file } {I~can't~find~the~file~mitthesis-style.css.\iow_newline:
    This~optional~file~provides~css~style~if~the~tagged~pdf~is~rendered~into~html.~
								    You~can~ignore~this~warning~if~you~don't~want~styling.}
    \msg_new:nnn    { \ClassName } { css_file_loaded } {The~file~mitthesis-style.css~has~been~loaded.}
    \file_if_exist:nTF {mitthesis-style.css}
        {
          \msg_note:nn { \ClassName } { css_file_loaded } 
          \tagpdfsetup { css-list-add = { mitthesis-style.css } } % attach this css to the pdf
        }{  
          \msg_note:nn { \ClassName } { no_css_file } 
        }
}

%%%  Custom tags for this class  %%%%%

\tag_if_active:T {
    \tagpdfsetup { role/user-NS = mitthesis }
        
    \tagpdfsetup { role/new-tag = { Thesis_title/H1 } }       % new: replaces standard Title, 2026/11/19
    \tagpdfsetup { role/new-tag = { Author/Sect } }           % was Div
    \tagpdfsetup { role/new-tag = { Degree/Sect } }           % was Div
    \tagpdfsetup { role/new-tag = { Copyright/Sect } }        % was Div
    \tagpdfsetup { role/new-tag = { Title_sig_block/Sect } }  % was Div
    
    \tagpdfsetup { role/new-tag = { Committee_page/Sect } }
    \tagpdfsetup { role/new-tag = { Committee_name/H1 } }           % was Span
    \tagpdfsetup { role/new-tag = { Committee_supervisors/Sect } }  % new: 2026/11/19
    \tagpdfsetup { role/new-tag = { Committee_readers/Sect } }      % new: 2026/11/19
    \tagpdfsetup { role/new-tag = { Committee_block_title/H2 } }    % was Span
    
    \tagpdfsetup { role/new-tag = { Abstract_page/Sect } }
    \tagpdfsetup { role/new-tag = { Abstract_title/H1 } }         % was Div
    \tagpdfsetup { role/new-tag = { Abstract_info/Sect } }        % new: 2026/11/19
    \tagpdfsetup { role/new-tag = { Abstract_heading/H2 } }       % new: 2026/11/19
    \tagpdfsetup { role/new-tag = { Abstract_text/Sect } }        % was Div
    \tagpdfsetup { role/new-tag = { Abstract_supervisor/Sect  } } % was Div
    
    \tagpdfsetup { role/new-tag = { Nomenclature_list/Div  } }
    \tagpdfsetup { role/new-tag = { Nomenclature_entry_heading/Span  } }
    
    \tagpdfsetup { role/new-tag = { Cmidrule/Span } }             % use inside part-row header cells
}

% Note: Div and Span are non-semantic text-grouping elements, which 
%       gain semantic meaning only if attributes are assigned to them.

\ExplSyntaxOff


%%%%%%%%%%%%%  Patch table of contents, list of figures, and list of tables  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% We'd like these sections to have pdf bookmarks and to have the two lists appear in the table of contents and have
% pdf bookmarks.  This is not automatic for \chapter*, which is the format of toc, lof, and lot.

\RequirePackage{etoolbox}% provides \patchcmd

\patchcmd{\tableofcontents}{\contentsname}{\pdfbookmark[0]{\contentsname}{toc}\contentsname}{}{} % placement matters.

%% Code to accommodate latex tagging. Rework once LaTeX3 team have finalized tagging structures and templates.
%% Current latex-lab places tags outside \@schapter, which is harder to deal with here.

\ProvideDocumentCommand\MakeLinkTarget{ s O{} m }{}

\patchcmd{\listoffigures}{\chapter*{\listfigurename}}%
		{\chapter*{\MakeLinkTarget*{listoffigures}\listfigurename}\addcontentsline{toc}{frontmatter}{\listfigurename}}{}{}
\patchcmd{\listoftables}{\chapter*{\listtablename}}%
		{\chapter*{\MakeLinkTarget*{listoftables}\listtablename}\addcontentsline{toc}{frontmatter}{\listtablename}}{}{}
% removed \phantomsection, move \MakeLinkTarget* inside \chapter*, 2025/04/28. (was \chapter*{\phantomsection\listtablename}\MakeLinkTarget*{listoftables}...)

% \patchcmd{\listoffigures}{\chapter*{\listfigurename}}         % 2026/06/01 latex uses templates to add keyvalues to \chapter*
%		{\chapter*[toc={\listfigurename}]{\listfigurename}}{}{} % same effect as above, but still with \l@chapter (no font control)

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

\RequirePackage{graphicx}

\RequirePackage{mathtools}% loads and extends amsmath; must load before hyperref and unicode-math

% To free \eqref from the normal font (i.e., for use in section headings), revised 2026/11/06
\def\mitthesis@eqref@maketag#1{\hbox{\m@th#1}}%
\RenewDocumentCommand\eqref{m}{%
     \textup{\begingroup\let\maketag@@@\mitthesis@eqref@maketag\tagform@{\ref{#1}}\endgroup}%
    }
% amsmath def:  \newcommand{\eqref}[1]{\textup{\tagform@{\ref{#1}}}}
%				\def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}}
%				\def\maketag@@@#1{\hbox{\m@th\normalfont#1}}
\AddToNoCaseChangeList{\eqref}

% To streamline switching from lualatex to pdftex when using sample chapters 1 and 2, which put \psi as \mitpsi (etc.) in a toc entry
\ifmitthesis@pdftex
  \providecommand*\mitpsi{\psi}
  \providecommand*\mitdelta{\delta}
  \providecommand*\mitDelta{\Delta}
  \providecommand*\mittheta{\theta}
  \providecommand*\mitTheta{\Theta}
\fi

%%%%%%%%%%%%%  Line numbering (class option)  %%%%%%%%%%%%%%%%%%%%%%%%%

% load after mathtools/amsmath, 2026/11/23

\ifmitthesis@lineno
    \RequirePackage[mathlines]{lineno} 
    \AtBeginDocument{\linenumbers}
\fi

% Enable dropping lineno option without trashing .aux file
\providecommand{\@LN@col}[1]{\relax}
\providecommand{\@LN}[2]{\relax}


%%%%%%%%%%%%  Design options  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Some packages that might be loaded in mydesign should come before the class loads hyperref (as done here)

\ExplSyntaxOn
\msg_new:nnnn { \ClassName } { nodesignfile } 
	{ \g__mitthesis_designfile_tl .tex\iow_newline: cannot~be~found.~There~shall~no~design~be~loaded;~
	  and~error~messages~shall~be~multiplied~upon~thee.
	}{ 
	  Thou~hast~called~the~class~option~mydesign,~but~\g__mitthesis_designfile_tl .tex\space
	  cannot~be~found.~Thou~mayst~download~mydesign.tex~from\space
	  https://ctan.org/tex-archive/macros/latex/contrib/mitthesis/MIT-thesis-template. }
\cs_new:Npn \mitthesis@designfile { \g__mitthesis_designfile_tl }

\bool_if:NTF \g__mitthesis_mydesign_bool 
{
    \file_if_exist:nTF { \g__mitthesis_designfile_tl .tex }
      {
        \ClassNoteNoLine { \ClassName } { Loading~\g__mitthesis_designfile_tl .tex }
        \file_input:n { \g__mitthesis_designfile_tl .tex }
      }
      { \msg_error:nn { \ClassName } { nodesignfile } }
}{
	\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}
	%
	\AddToHook{package/hyperref/after}{%
    		\hypersetup{
    		  linkcolor=Blue3,% color name from xcolor package
    		  citecolor=Blue3,
    		  urlcolor=violet,
    		  filecolor=red, 
		    }
		}
	\ifmitthesis@lineno
		\renewcommand{\linenumberfont}{ \sffamily \mdseries \tiny \color{violet} }% add \mdseries 2023/10/11
	\fi
	% \RequirePackage{caption,subcaption} % no longer loaded by default; can load in mydesign if desired.
	% Caption package can be loaded in mydesign.tex, if such features are really needed.
	% Replaced subcaption package with code that follows. 2026/01/24	
}
\ExplSyntaxOff

\AddToNoCaseChangeList{\eqref \footnote}% In case style uses capitalized headings

%%%%%% Captions and subcaptions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOn

\cs_new_protected:Npn \__mitthesis_caption_setup:
{
    \IfPackageLoadedTF{caption}{ % added 2026/01/16
        \tag_if_active:T
          {
            % 	Patch the caption package so we can validate as pdf 2.0/ua-2.
            %     See github discussion by Ulrike Fischer:
            % 	  	https://github.com/latex3/tagging-project/issues/720#issuecomment-2386568711
            %
            \RemoveFromHook{begindocument}[latex-lab-testphase-float]
            \socket_new_plug:nnn{tagsupport/parbox/before}{caption}
              {   
               \tagpdfparaOn % restart para tagging
               \tl_if_empty:NTF\@current@float@struct
                {     
                 \tag_struct_begin:n{tag = Caption,firstkid}
                }
                {
                 \tag_struct_begin:n{tag = Caption,parent=\@current@float@struct,firstkid}
                }
              }
            \socket_new_plug:nnn{tagsupport/parbox/after}{caption}
              {
               \tag_struct_end:   
              }
            \l@addto@macro\caption@beginex@hook % this is a hook in the caption package
              {
                \tagpdfparaOff % \leavevmode in parbox should not start paragraph structure
                \AssignSocketPlug{tagsupport/parbox/before}{caption}
                \AssignSocketPlug{tagsupport/parbox/after}{caption}
              }
        	% Address issue with LOT/LOF. see: https://github.com/latex3/tagging-project/issues/720#issuecomment-2388406105
            \AddToHook{begindocument/end}{
                \renewcommand*\caption@anchor[1]{%
                  \ifmeasuring@ \else
                  \caption@raisedlink{\MakeLinkTarget*{##1}}%
                  \fi
                }%
              }
          }
    }{\relax}  
    %%  Use latex-lab hooks/sockets with recent latex version; useful WITHOUT caption package. 
    %%  At present, these options do not address the evolving code for tagged longtable captions. 2026/01/28
    %%  (Note that subcaption package, if used, loads caption package.)
    %
    \cs_new_protected:Nn \__mitthesis_adjustcaptions: 
    	{
    %	\setlength\abovecaptionskip{5\p@} % If you desire some adjustments to this dimension.
    %
    %%  The next two are used in mydesign, as examples of making captions/labels bold. Leaving code here only for reference.    
    %
    %	\NewSocketPlug{caption/label}{plug-A} % This strictly addresses the caption label, not caption text.
    %		{{\bfseries  ##1:\space}}
    %	\AssignSocketPlug{caption/label}{plug-A}
    %	\AddToHook{cmd/@makecaption/before}{\bfseries\mathversion{bold}} % Bolds entire caption, incl. math IFF font has bold version.
    %
    	\AddToHook{cmd/@makecaption/after}
    		{ 
    	       \str_if_eq:VnT \@captype { table } { \vskip 0.5\baselineskip } % Separates table caption from tabular below it.
    		}
    	}
	%   
    \IfFormatAtLeastTF{2025/11/01}
      {
    	  \IfPackageLoadedTF{caption}
    	  {
    	    \relax
    	  }{  
    	    \__mitthesis_adjustcaptions:
    	  }
      }{\relax}
}

\AddToHook{begindocument/before}
  {
    \__mitthesis_caption_setup: 
  }  

%%%%%%%%% Subfigures and subcaptions *without* using the subcaption package %%%%

\newcounter{SubFigure}[figure]
\tl_new:N  \l__mitthesis_subcap_tl
\box_new:N \l__mitthesis_subcap_box
\int_new:N \l__mitthesis_figstart_int
\int_set_eq:NN \l__mitthesis_figstart_int \c_max_int  % outside a hooked float: act like the original code

\cs_gset:Npn \theSubFigure
  { \thefigure ( \int_to_alph:n { \c@SubFigure } ) } % style of subfigure label in \ref

% At the start of each figure, record the figure counter and reset the subfigure counter
\cs_new_protected:Npn \__mitthesis_figure_start:
  {
    \int_set_eq:NN \l__mitthesis_figstart_int \c@figure
    \int_gzero:N \c@SubFigure
  }
\AddToHook{env/figure/begin}  { \__mitthesis_figure_start: }
\AddToHook{env/figure*/begin} { \__mitthesis_figure_start: }

\NewDocumentCommand\mitthesis@subcaption{m}
  {
    \skip_vertical:n { 5\p@ }
    \group_begin:
    \small
    \tl_set:Nn   \l__mitthesis_subcap_tl  { ( \alph{SubFigure}) \space #1 } % If you want a different subcaption style, edit this.
    \tag_if_active:T {\tag_suspend:n { mitthesis / subcaption-width } }
	\hbox_set:Nn \l__mitthesis_subcap_box { \tl_use:N \l__mitthesis_subcap_tl }
    \tag_if_active:T {\tag_resume:n  { mitthesis / subcaption-width } }
	\dim_compare:nNnTF { \box_wd:N \l__mitthesis_subcap_box } > { 0.9\hsize }
      {
        \skip_add:Nn \leftskip  {  0.05\hsize } % confined to group
        \skip_add:Nn \rightskip {  0.05\hsize }      
        \l__mitthesis_subcap_tl \par      
      }{
        \global \@minipagefalse
        \hbox_to_wd:nn { \hsize } % this won't tag paragraph (it's in vmode) unless sockets are used manually
          { 
            \hfil
            \tag_if_active:T { \UseTaggingSocket { para/begin } }
            \l__mitthesis_subcap_tl
            \tag_if_active:T { \UseTaggingSocket { para/end } }
            \hfil
          }
      }
  \skip_vertical:n { 5\p@ }
  \group_end:
 }

% first  arg (optional)  is vertical alignment of subfigure's contents (default is top alignment). [cbt]
% second arg (mandatory) is width of this subfigure
% the content of the subfigure should include a \subcaption{..}, if one is needed
\NewDocumentEnvironment { mitthesis@subfigure } { O{t} m }
  {
    \begin{minipage}[#1]{#2}
    \int_compare:nNnTF { \c@figure } > { \l__mitthesis_figstart_int }
      { \refstepcounter{SubFigure} }   % \caption already issued: counter is correct
      {                                % \caption still to come: borrow the next number
        \int_gincr:N \c@figure
        \refstepcounter{SubFigure}     % label and anchor both see the right figure number
        \int_gdecr:N \c@figure
      }
  }
  {
    \end{minipage}
    \ignorespacesafterend
  }

\msg_new:nnn { \ClassName } { subcaptionloaded }
    { Subcaption~package~has~been~loaded,~so~I~won't\iow_newline: load~mitthesis's~subfigure~and~subcaption~code. } 

\AddToHook{begindocument/before}
  {
    \IfPackageLoadedTF{subcaption}
      { \msg_warning:nn { \ClassName } { subcaptionloaded } }
      {
        \DeclareCommandCopy     \subcaption  \mitthesis@subcaption
        \DeclareEnvironmentCopy {subfigure}  {mitthesis@subfigure} }
  }
\ExplSyntaxOff

%%%%%%%%%%%%  Font loading  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NewDocumentCommand\LoadDefaultFonts{}{ %2026/11/20
	\ifmitthesis@pdftex
    	\ClassNoteNoLine{\ClassName}{Loading Computer Modern text and math fonts (typical pdftex engines will call CM-super fonts)}
    	\RequirePackage[T1]{fontenc}
	        \RequirePackage{amssymb}% covered by unicode-math, libertinus, lucidabr, newtx, newtxsf packages.
    	\RequirePackage{bm}	
    \else
    	\ClassNoteNoLine{\ClassName}{Loading Latin Modern text and math fonts (default for unicode engines)}
        \RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket},mathbf=sym]{unicode-math}
        % suppress warnings about lack of integration between mathtools and unicode-math.
        % add mathbf=sym for proper html rendering, 2026/05/12
        % Unicode-math loads fontspec package, but default fonts are not set up by fontspec in the default case.
    \fi
}

\ExplSyntaxOn
% Input file using LaTeX2e catcodes, with no group around it
\cs_new_protected:Npn \__mitthesis_input_latex_file:n #1
  {
    \ExplSyntaxOff
    \file_input:n {#1}
    \ExplSyntaxOn
  }

\msg_new:nnn { \ClassName } { fontset-key } { Fontset~key~is~#1 }
\msg_new:nnn { \ClassName } { fontset-subdir-missing }
    { Fontset~file~\ClassName-#1.tex~or~subdirectory~fontsets~not~found.~
      Will~look~for~#1.tex~in~your~working~directory. }
\msg_new:nnn { \ClassName } { fontset-missing }
    { Fontset~file~#1.tex~not~found,~using~default~fonts.~
      You~may~need~to~place~the~fontset~file~into~your~working~directory. }

\msg_note:nnV { \ClassName } { fontset-key } \g__mitthesis_fontset_tl

\file_if_exist:nTF { fontsets/ \ClassName - \g__mitthesis_fontset_tl .tex }
    {
     \__mitthesis_input_latex_file:n { fontsets/ \ClassName - \g__mitthesis_fontset_tl .tex }
    }
    {
     \msg_warning:nnV { \ClassName } { fontset-subdir-missing } \g__mitthesis_fontset_tl
     \file_if_exist:nTF { \g__mitthesis_fontset_tl .tex }
        { \__mitthesis_input_latex_file:n { \g__mitthesis_fontset_tl .tex } }
        {
         \msg_warning:nnV { \ClassName } { fontset-missing } \g__mitthesis_fontset_tl
         \LoadDefaultFonts
        }
    }
\ExplSyntaxOff


%%%%%%%%%%%%  Hyperref  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[psdextra]{hyperref} % with option [linktoc=page], page number is linked, not title
% use hypersetup to set details, in the main .tex file

\urlstyle{same} 		% changes font for \url to the current text font
\RequirePackage{doi} 	% creates macro for hyperlinking doi numbers

%% In case \DocumentMetadata was not loaded. Revised 2026/11/06 to accommodate odd characters
\providecommand\hrefurl{\href}

% the user can alter these choices in the preamble, or by 
% using \AtBeginDocument{ \hypersetup{..} } in mydesign.tex
%
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
 		
%%%%%%%%%%%%  PDF bookmark strings  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%     By early 2024, \pdfstringdef removes all robust commands from bookmarks, leaving their arguments.
%%%     These commands remove the arguments and suppress "Token not allowed" warnings.

\pdfstringdefDisableCommands{%
    \let\bm\@firstofone         % keep argument of \bm, braced or not
    \let\(\@empty
    \let\)\@empty
    \def\cite#1#{\@gobble}%       % remove citations, with [options] and {keys}
    \def\eqref#1{(\ref*{#1})}%    % to get the bare equation number
    \def\footnote#1#{\@gobble}%   % remove footnotes, both [num] and {text} (Note: \footnote is robust/protected)
    \let\NoCaseChange\@firstofone % in case \NoCaseChange is used in cap'd headings
}
% \patchcmd{\section}{\sectionmark}{\let\footnote\@gobble\sectionmark}{}{}% <== not needed unless you implement running headers


%%%%%%%%%%  Commas between consecutive footnotes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOn

\cs_new_protected:Nn \__mitthesis_note_comma: 
	{ 
	  \peek_meaning:NT \footnote { \textsuperscript{ \normalfont, } } 
	}
\IfFormatAtLeastTF{2025/11/01}{	% revised 2026/08/07
    % \exp_after:w is needed because an internal token of footnote follows the hook.
    % This hook should be executed last; otherwise declare a hook rule. 
	\hook_gput_code:nnn {cmd/footnote/after}{mitthesis/footnotecomma}{ \exp_after:w \__mitthesis_note_comma: } 
}{
	\cs_new_eq:NN \__mitthesis_savefootnote:w \footnote
	\RenewDocumentCommand \footnote { o +m }
      {
        \tl_if_novalue:nTF {#1}
          { \__mitthesis_savefootnote:w {#2} }
          { \__mitthesis_savefootnote:w [{#1}] {#2} }
        \__mitthesis_note_comma:
      }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%  MACROS FOR HANDLING TITLE AND ABSTRACT PAGES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% in case microtype package is not loaded
\hook_gput_code:nnn {begindocument} {mitthesis} %same as \AtBeginDocument 
  {
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
\tl_new:N \g__mitthesis_dd_thesisdate_tl

\cs_new_protected:Nn   \__mitthesis_gset_dd_dates:nn {
	\tl_gset:Nn        \g__mitthesis_dd_month_tl {#1}
	\tl_gset:Nn        \g__mitthesis_dd_year_tl  {#2}
	\tl_gremove_all:Nn \g__mitthesis_dd_month_tl { ~ }
	\tl_gremove_all:Nn \g__mitthesis_dd_year_tl  { ~ }
 	\str_case_e:nnF 
		{ \str_lowercase:f { \tl_to_str:N  \g__mitthesis_dd_month_tl } }
	 	{ {february}{} {may}{} {june}{} {september}{} }
		{ \msg_error:nnn { \ClassName } { wrong_month } {#1} } 
}
\msg_new:nnnn { \ClassName } { wrong_month } 
	{ The~degree~month~must~be~one~of~February,~May,~June,~or~September. } 
	{ MIT~does~not~use~#1~as~the~degree~month. }

\NewDocumentCommand\DegreeDate{mm}{ %   {month}{year}	
	\cs_if_exist:NTF \DegreeMonth
		{ \msg_error:nn { \ClassName } { degree_date_given } }
		{
	     \__mitthesis_gset_dd_dates:nn {#1} {#2}
	     \cs_new:Npn \DegreeMonth { \text_titlecase_first:n { \text_lowercase:n \g__mitthesis_dd_month_tl } }
	     \cs_new:Npn \DegreeYear  { \text_expand:n { \g__mitthesis_dd_year_tl  } } % edited 2024/06/24
        }
}
\msg_new:nnn { \ClassName } { degree_date_given }
	{ \iow_char:N \\DegreeDate\ has~already~been~set! \\ The~second~value~will~be~ignored. }
	
\NewDocumentCommand\ThesisDate{m}{
	\tl_if_blank:VTF \g__mitthesis_dd_thesisdate_tl 
		{ \__mitthesis_gset_dd_thesisdate:n {#1} }
		{ \msg_error:nn { \ClassName } { date_given } } 
}
\msg_new:nnnn { \ClassName } { date_given } { \iow_char:N \\ThesisDate\ has~already~been~set!
        \\ The~second~value~will~be~ignored. } {You~must~only~use \iow_char:N \\ThesisDate\ once.}

\cs_new_protected:Nn \__mitthesis_gset_dd_thesisdate:n {
 	\tl_gset:Ne  \g__mitthesis_dd_thesisdate_tl { \tl_trim_spaces:n {#1} }
}

% If for some reason you don't want an error message when you supply the wrong month
\NewDocumentCommand\SuppressMonthError{}
  {
  	\msg_redirect_name:nnn { \ClassName } { wrong_month } { none }
  }

%%%%%%%%%%  End Degree Date Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Author Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rev. 2026/11/08

\int_gzero_new:N \g__mitthesis_author_cnt_int

\regex_const:Nn \c__mitthesis_trailing_period_regex { \. \Z } % strip trailing period, e.g. on "Harvard, B.A." or ", Jr."

\seq_new:N \g__mitthesis_author_name_seq
\seq_new:N \g__mitthesis_author_department_seq
\seq_new:N \g__mitthesis_author_prevdegree_seq
\seq_new:N \g__mitthesis_author_secondprevdegree_seq
\seq_new:N \g__mitthesis_author_thirdprevdegree_seq
\seq_new:N \g__mitthesis_author_fourthprevdegree_seq
\seq_new:N \l__mitthesis_degree_seq

\tl_new:N  \g__mitthesis_author_namesize_tl
\tl_new:N  \g__mitthesis_copyright_author_tl
\tl_new:N  \g__mitthesis_pdfcopyright_author_tl
\tl_new:N  \l__mitthesis_degree_tl

\NewDocumentCommand\Author{ m m O{} O{} O{} O{} } % avoids -NoValue- marker of an o argument
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
				{ Missing~author~name, \iow_newline: check~for~blank~in~\iow_char:N \\Author~command. }
				{ You~MUST~provide~an~author~name~using~the~\iow_char:N \\Author{name}{department}~command. }
\msg_new:nnnn { \ClassName } { blank_author_dep } 
				{ Missing~author~department, \iow_newline: check~for~blank~in~\iow_char:N \\Author~command. }
				{ You~MUST~provide~the~author's~department~using~the~\iow_char:N \\Author{name}{department}~command. }

\cs_new_protected:Nn \__mitthesis_gset_author_data:nnnnnn
 {
	\int_gincr:N \g__mitthesis_author_cnt_int
	\seq_gput_right:Ne  \g__mitthesis_author_name_seq             { \tl_trim_spaces:n {#1} } 
	\seq_gput_right:Ne  \g__mitthesis_author_department_seq       { \tl_trim_spaces:n {#2} }
	\seq_gput_right:Ne  \g__mitthesis_author_prevdegree_seq       { \tl_trim_spaces:n {#3} }
	\seq_gput_right:Ne  \g__mitthesis_author_secondprevdegree_seq { \tl_trim_spaces:n {#4} }
	\seq_gput_right:Ne  \g__mitthesis_author_thirdprevdegree_seq  { \tl_trim_spaces:n {#5} }
	\seq_gput_right:Ne  \g__mitthesis_author_fourthprevdegree_seq { \tl_trim_spaces:n {#6} }
 }

\cs_new_protected:Nn \__mitthesis_gset_copyright_author: {
	\tl_gset:Ne \g__mitthesis_copyright_author_tl
        { \seq_use:Nnnn \g__mitthesis_author_name_seq { ~and~ } { ,~ } { ,~and~ } }
	\cs_gset:Npe \@author { \exp_not:V \g__mitthesis_copyright_author_tl }
	\regex_replace_once:NnN \c__mitthesis_trailing_period_regex { } 
	    \g__mitthesis_copyright_author_tl % remove last token if it is a period
	\__mitthesis_gset_author_pdfcopyright:
	% \iow_term:e { The~\iow_char:N \\@author~is~\use:c { @author } }      % diagnostic
}

\cs_new_protected:Nn \__mitthesis_gset_author_pdfcopyright: {
	\int_set:Nn  \l_tmpa_int {1} % counts authorno
    \tl_gset:Ne  \g__mitthesis_pdfcopyright_author_tl  
    	{ { \seq_item:NV \g__mitthesis_author_name_seq \l_tmpa_int } } % braces protect names with commas, e.g. ", Jr."
	\int_until_do:nNnn { \l_tmpa_int } = { \g__mitthesis_author_cnt_int }
		{
			\int_incr:N \l_tmpa_int   
			\tl_gput_right:Ne \g__mitthesis_pdfcopyright_author_tl 
				{ ;~{ \seq_item:NV \g__mitthesis_author_name_seq \l_tmpa_int } }
				% changed comma to semicolon for consistency with Dublin Core metadata format, 2024/08/30
		}
}

\tl_gset:Nn \g__mitthesis_author_namesize_tl { \large }
\cs_new_protected:Nn  \__mitthesis_author_block: {
	\int_compare:nNnTF { \g__mitthesis_author_cnt_int } = {0} {
		\msg_error:nn { \ClassName } { no_author }
	}	
	{by\par
	\int_step_inline:nn { \g__mitthesis_author_cnt_int }
        {
          \int_compare:nNnT {##1} > {1} { \par and \par }
          \__mitthesis_author_entry:n {##1}
        }
    \par
    }
}

\cs_new_protected:Nn \__mitthesis_author_entry:n {
    { 
	  \leavevmode
	  \tag_struct_begin:n { tag = Span }
	    \tag_mc_begin:n { tag = Span }
	      \g__mitthesis_author_namesize_tl \seq_item:Nn \g__mitthesis_author_name_seq {#1}
        \tag_mc_end:
	  \tag_struct_end:
	  \par
    } 
    \__mitthesis_author_degrees:n { #1 }
}

\cs_new_protected:Nn \__mitthesis_author_degrees:n {
    \seq_clear:N \l__mitthesis_degree_seq
    \clist_map_inline:nn
      { prevdegree, secondprevdegree, thirdprevdegree, fourthprevdegree }
      {
        \tl_set:Ne \l__mitthesis_degree_tl
           { \seq_item:cn { g__mitthesis_author_##1_seq } {#1} }
        \regex_replace_once:NnN \c__mitthesis_trailing_period_regex { }
           \l__mitthesis_degree_tl
        \seq_put_right:NV \l__mitthesis_degree_seq \l__mitthesis_degree_tl
      }
    \seq_remove_all:Nn \l__mitthesis_degree_seq { } % drop empty degree fields
    \seq_if_empty:NF   \l__mitthesis_degree_seq
      { \normalsize \seq_use:Nn \l__mitthesis_degree_seq { .\linebreak } . }
}

\NewDocumentCommand\AuthorNameSize{m}{
		\tl_gset:Nn \g__mitthesis_author_namesize_tl {#1}
}

\cs_new_protected:Nn \__mitthesis_author_abstractblock: {
    \int_compare:nNnTF { \g__mitthesis_author_cnt_int } = { 0 }
       { \msg_error:nn { \ClassName } { no_author } }
       {
         by \par
        \seq_use:Nn \g__mitthesis_author_name_seq { \par and \par }
    }
}

\msg_new:nnnn { \ClassName } { no_author }
		{ Missing~author!~You~must~issue \iow_newline: the~
		  \iow_char:N \\Author{name}{department}~command. 
		}{
		  You~MUST~issue~the~\iow_char:N \\Author{name}{department}~command~after~
		  \iow_char:N \\begin{document}~and~before~\iow_char:N \\maketitle.
		}

%%%%%%%%%%  End Author Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Supervisor Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\seq_new:N \g__mitthesis_supervisor_name_seq
\seq_new:N \g__mitthesis_supervisor_title_seq
\seq_new:N \g__mitthesis_supervisor_dept_seq
\int_gzero_new:N \g__mitthesis_supervisor_cnt_int
\regex_const:Nn  \c__mitthesis_amp_regex { \& \s* } 

\NewDocumentCommand\Supervisor{mmo}{
	\tl_if_blank:nT {#1} { \msg_error:nn { \ClassName } { blank_supervisor }       }
	\tl_if_blank:nT {#2} { \msg_error:nn { \ClassName } { blank_supervisor_title } }
	\IfNoValueTF {#3} 
		{ 	\msg_note:nn { \ClassName } { no_supervisor_dept  } 
			\__mitthesis_gset_supervisor_data:nnn {#1} {#2}
				{ Department~argument~was~not~used~in~\iow_char:N \\Supervisor~command. }
		} 
		{ 	\tl_if_blank:nTF {#3}
				{ 	\msg_note:nn { \ClassName } { blank_supervisor_dept  } 
					\__mitthesis_gset_supervisor_data:nnn {#1} {#2} { Blank~department~in~\iow_char:N \\Supervisor~command. }
				}{
					\__mitthesis_gset_supervisor_data:nnn {#1} {#2} {#3}
				}
		}
}
\msg_new:nnnn { \ClassName } { blank_supervisor }
		{ Missing~supervisor~name,~check\iow_newline: for~blank~in~\iow_char:N \\Supervisor{name}{title}[department]~command. 
		}{
		  You~MUST~provide~the~supervisor's~name~using~the~\iow_char:N \\Supervisor{name}{title}[department]~command. 
		}
\msg_new:nnnn { \ClassName } { blank_supervisor_title }
		{ Missing~supervisor~title,~check\iow_newline: for~blank~in~
		  \iow_char:N \\Supervisor{name}{title}[department]~command. 
		}{
		  You~MUST~provide~the~supervisor's~title~using~the~
		  \iow_char:N \\Supervisor{name}{title}[department]~command. 
		}
\msg_new:nnn { \ClassName } { blank_supervisor_dept }
		{ 
		  No~supervisor~department~provided,~check\iow_newline: for~blank~in~
		  \iow_char:N \\Supervisor{name}{title}[department]~command.
		}
\msg_new:nnn { \ClassName } { no_supervisor_dept }
	 	{ No~supervisor~department~provided~with\iow_newline: the~optional~third~argument~of~
		  the~\iow_char:N \\Supervisor{name}{title}[department]~command.~
		  The~supervisor's~department~is~used~only~in~the~optional~Thesis~Committee~page.
		}

\cs_new_protected:Nn \__mitthesis_gset_supervisor_data:nnn
 {
	\int_gincr:N \g__mitthesis_supervisor_cnt_int
	\seq_gput_right:Ne  \g__mitthesis_supervisor_name_seq   { \tl_trim_spaces:n {#1} } 
	\seq_gput_right:Ne  \g__mitthesis_supervisor_title_seq  { \tl_trim_spaces:n {#2} }
	\seq_gput_right:Ne  \g__mitthesis_supervisor_dept_seq   { \tl_trim_spaces:n {#3} }
 }

\tl_new:N   \g__mitthesis_titlepg_sup_designation_tl
\tl_new:N   \g__mitthesis_abst_sup_designation_tl
\tl_gset:Nn \g__mitthesis_titlepg_sup_designation_tl { Thesis~Supervisor } 
\tl_gset:Nn \g__mitthesis_abst_sup_designation_tl  { Thesis~supervisor } % style per MIT Libraries

% If for some reason you need to change "Thesis Supervisor" to a different string (say, "Doctoral Advisor").
% Note: this construction removes leading and trailing spaces, and it changes capitalization.
\NewDocumentCommand\SupervisorDesignation{ m } {% revised 2026/11/08
	\tl_gset:Ne \g__mitthesis_titlepg_sup_designation_tl 
	            { \text_titlecase_all:n   { \text_lowercase:n { \tl_trim_spaces:n {#1} } } }
    \tl_gset:Ne \g__mitthesis_abst_sup_designation_tl 
                { \text_titlecase_first:n { \text_lowercase:n { \tl_trim_spaces:n {#1} } } }
}

\cs_new_protected:Nn \__mitthesis_supervisor_abstractblock: {% revised 2026/11/19
    \dim_set:Nn \parindent { 0pt }
    \par \bigskip
    \int_compare:nNnTF { \g__mitthesis_supervisor_cnt_int } = { 0 }
      { \msg_error:nn { \ClassName } { no_supervisor } }
      {
        \int_step_inline:nn { \g__mitthesis_supervisor_cnt_int }
          {
           \int_compare:nNnT { ##1 } > { 1 } { \skip_vertical:n { 12pt } }
           \tl_set:Ne \l_tmpa_tl { \seq_item:Nn \g__mitthesis_supervisor_title_seq { ##1 } }
           \regex_replace_all:NnN 
                \c__mitthesis_amp_regex { \c{phantom}{Title:\c{space}} } \l_tmpa_tl
             \g__mitthesis_abst_sup_designation_tl {:} \space
             \seq_item:Nn \g__mitthesis_supervisor_name_seq { ##1 } \par
             Title:\space \l_tmpa_tl \par
          }
      }
}		
\msg_new:nnnn { \ClassName } { no_supervisor }
		{ Missing~supervisor!~You~must~issue~the~\iow_char:N \\Supervisor{name}{title}~command. }{
		You~MUST~issue~the~\iow_char:N \\Supervisor{name}{title}~command~after~
		\iow_char:N \\begin{document}~and~before~\iow_char:N \\maketitle. }


%%%%%%%%%%  End Supervisor Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Acceptor Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\seq_new:N \g__mitthesis_acceptor_name_seq
\seq_new:N \g__mitthesis_acceptor_dept_seq
\seq_new:N \g__mitthesis_acceptor_title_seq
\int_gzero_new:N \g__mitthesis_acceptor_cnt_int

\NewDocumentCommand\Acceptor{mmm}{
	\tl_if_blank:nTF {#1} {
		\msg_error:nn { \ClassName } { blank_acceptor }
		}{
		\__mitthesis_gput_acceptor_data:nnn {#1} {#2} {#3}
	    }
	\tl_if_blank:nT  {#2} { \msg_error:nn { \ClassName } { blank_acceptor_dep } }
	\tl_if_blank:nT {#3} 
	    {
		 \msg_warning:nn { \ClassName } { blank_acceptor_title }
		}
}

\msg_new:nnnn { \ClassName } { blank_acceptor }
		{ Missing~acceptor~name,~check~for~blank~in~\iow_char:N \\Acceptor{name}{department}{title}~command. }{
			You~MUST~provide~the~acceptor's~name~using~the~\iow_char:N \\Acceptor{name}{department}{title}~command. }
\msg_new:nnnn { \ClassName } { blank_acceptor_dep }
		{ Missing~acceptor~department,~check~for~blank~in~\iow_char:N \\Acceptor{name}{department}{title}~command. }{
			You~MUST~provide~the~acceptor's~department~using~the~\iow_char:N \\Acceptor{name}{department}{title}~command. }
\msg_new:nnn { \ClassName } { blank_acceptor_title }
		{ Missing~acceptor~title~(blank~in~\iow_char:N \\Acceptor{name}{department}{title}~command).~ 
		  Perhaps~you~are~trying~to~save~vertical~space?\space  
		  You~can~put~the~acceptor~title~into~department~field~instead.~
		  For~consistency,~I~will~omit~titles~of~ALL~acceptors.
		}

\cs_new_protected:Nn \__mitthesis_gput_acceptor_data:nnn
 {
	\int_gincr:N \g__mitthesis_acceptor_cnt_int
	\seq_gput_right:Ne  \g__mitthesis_acceptor_name_seq  { \tl_trim_spaces:n {#1} } 
	\seq_gput_right:Ne  \g__mitthesis_acceptor_dept_seq  { \tl_trim_spaces:n {#2} }
	\seq_gput_right:Ne  \g__mitthesis_acceptor_title_seq { \tl_trim_spaces:n {#3} }
 }

%%%%%%%%%%  End Acceptor Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Degree Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% edited 2024/06/25, 2026/11/09

\seq_new:N \g__mitthesis_degree_name_seq
\seq_new:N \g__mitthesis_degree_dept_seq
\int_gzero_new:N \g__mitthesis_degree_cnt_int
\int_gzero_new:N \g__mitthesis_dept_cnt_int

% #1 = degree ; #2 = department
\NewDocumentCommand\Degree{mm}
 {
    \int_compare:nNnTF { \g__mitthesis_dept_cnt_int } = {0} {
    	\tl_if_blank:nTF {#1} {
    		  \msg_fatal:nn { \ClassName } { no_degree_name }
    		}{
			  \__mitthesis_gset_degree_name:n { #1 }
			  \int_gincr:N \g__mitthesis_degree_cnt_int
    		}
    	\tl_if_blank:nTF {#2} {
    		  \msg_fatal:nn { \ClassName } { no_degree_dep }
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
			  \__mitthesis_gset_degree_dept:n { #2 }
			  \int_gincr:N \g__mitthesis_dept_cnt_int 
    		}
    }
 }
\cs_new_protected:Nn \__mitthesis_gset_degree_name:n
 {
	\seq_gput_right:Ne  \g__mitthesis_degree_name_seq  { \tl_trim_spaces:n {#1} } 
 }
\cs_new_protected:Nn \__mitthesis_gset_degree_dept:n
 {
	\seq_gput_right:Ne  \g__mitthesis_degree_dept_seq  { \tl_trim_spaces:n {#1} }
 }
\msg_new:nnnn { \ClassName } { no_degree_name } 
			{ Missing~degree~name,~check~for\iow_newline: blank~in~\iow_char:N \\Degree~command. } 
			{ You~MUST~provide~at~least~one~degree~name~in~the~first~use~of~the~
			  \iow_char:N \\Degree{name}{department}~command. }
\msg_new:nnnn { \ClassName } { no_degree_dep } 
			{ Missing~degree~department~for\iow_newline: \iow_char:N \\Degree~command. }
			{ You~MUST~provide~at~least~one~department~name~in~the~first~use~of~the~
			  \iow_char:N \\Degree{name}{department}~command. }
\msg_new:nnn { \ClassName } { blank_degree } 
			{ Missing~degree~name~in~second~\iow_char:N \\Degree~command.\iow_newline: 
			  Will~treat~this~as~two~departments~issuing~one~degree. }
\msg_new:nnn { \ClassName } { blank_degree_dep } 
			{ Missing~degree~department~in~second~\iow_char:N \\Degree~command.
			  \iow_newline: Will~treat~as~one~department~issuing~two~degrees. }

% one degree or multiple degrees?
\cs_new:Nn \__mitthesis_degree_word:
  { \int_compare:nNnTF { \g__mitthesis_degree_cnt_int } > {1} { degrees } { degree } }

% submitted to one or more departments
\cs_new_protected:Nn \__mitthesis_degree_depts: {
   Submitted~to~the~\seq_item:Nn \g__mitthesis_degree_dept_seq {1}
   \int_step_inline:nnn {2} { \g__mitthesis_dept_cnt_int }
     {
       \mbox{~and}\linebreak
       \mbox{the~\seq_item:Nn \g__mitthesis_degree_dept_seq {##1}}
     }
}

% for the award of one or more degrees
\cs_new_protected:Nn \__mitthesis_degree_names: {
   \int_step_inline:nn { \g__mitthesis_degree_cnt_int }
     {
       \int_compare:nNnF {##1} = {1} { \par and \par }
       \textls[60]{ \text_uppercase:n { \seq_item:Nn \g__mitthesis_degree_name_seq {##1} } }
     }
   \par
}

% text block for title page
\cs_new_protected:Nn \__mitthesis_degree_block: {
   \int_compare:nNnT { \g__mitthesis_degree_cnt_int } = {0}
     { \msg_fatal:nn { \ClassName } { no_degree } }
   \__mitthesis_degree_depts:
   \linebreak
   \mbox{in~partial~fulfillment~of~the~requirements~for~the~\__mitthesis_degree_word: \c_space_tl of}
   \par
   \__mitthesis_degree_names:
}
\msg_new:nnnn { \ClassName } { no_degree }
		{ Missing~degree!~You~must\iow_newline: issue~the~\iow_char:N \\Degree{name}{department}~command. 
		}{
		  You~MUST~issue~the~\iow_char:N \\Degree{name}{department}~command~after~\iow_char:N \\begin{document}~
		  and~before~\iow_char:N \\maketitle.~ You~do~want~the~degree,~don't~you?
		}

% text block for abstract page
\cs_new_protected:Nn \__mitthesis_degree_abstractblock: {
   \__mitthesis_degree_depts:
   \linebreak
   \mbox{on~\g__mitthesis_dd_thesisdate_tl \c_space_tl 
       in~partial~fulfillment~of~the~requirements~for~the~\__mitthesis_degree_word: \c_space_tl of }
   \par
   \skip_vertical:n { 6pt plus 2pt minus 2pt }
   \__mitthesis_degree_names:
   \skip_vertical:n { 6pt plus 2pt minus 2pt }
}

%%%%%%%%%%  End Degree Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Copyright Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% revised 2026/11/11

\bool_new:N \g__mitthesis_publicdomain_bool  % false = copyrighted (default)
\bool_new:N \g__mitthesis_xmp_rights_bool    % true after xmpRights properties written
\bool_new:N \g__mitthesis_cclicense_bool     % true = CClicense has been declared

\tl_new:N   \g__mitthesis_copyright_ccname_tl
\tl_new:N   \g__mitthesis_copyright_cclicense_tl
\tl_new:N   \g__mitthesis_copyright_crwords_tl
\tl_new:N   \g__mitthesis_copyright_license_tl
\tl_new:N   \g__mitthesis_copyright_mitpermlast_tl
\tl_new:N   \g__mitthesis_copyright_mitpermission_tl
\tl_new:N   \g__mitthesis_copyright_pdfrights_tl
\tl_new:N   \g__mitthesis_copyright_ccurl_tl

\tl_gset:Nn \g__mitthesis_copyright_mitpermlast_tl 
	{
	  to~MIT~a~nonexclusive,~worldwide,~irrevocable,~royalty-free~license~to~exercise~
	  any~and~all~rights~under~copyright,~including~to~reproduce,~preserve,~distribute~
	  and~publicly~display~copies~of~the~thesis,~or~release~the~thesis~under~an~
	  open-access~license.
	}

\NewDocumentCommand \CClicense { m m } {
    \bool_lazy_or:nnTF { \tl_if_blank_p:n {#1} } { \tl_if_blank_p:n {#2} }
      { \msg_error:nn { \ClassName } { cclicense_blank } }
      {
        \bool_if:NTF \g__mitthesis_cclicense_bool
          { \msg_warning:nnV { \ClassName } { cclicense_repeat } \g__mitthesis_copyright_ccname_tl }
          { \__mitthesis_gset_copyright_licensedata:nn {#1} {#2} }
      }
}
\msg_new:nnnn { \ClassName } { cclicense_blank }
  { Blank~argument~in~\iow_char:N \\CClicense.\iow_newline: No~license~will~be~applied. }
  { Use~\iow_char:N \\CClicense{license~name}{license~URL}~with~both~arguments~filled~in. }
\msg_new:nnn { \ClassName } { cclicense_repeat }
  { \iow_char:N \\CClicense~used~more~than~once.\iow_newline:
    Keeping~the~first~license~(#1);~later~ones~are~ignored. }

\cs_new_protected:Nn \__mitthesis_gset_copyright_licensedata:nn {
	\tl_gset:Ne \g__mitthesis_copyright_cclicense_tl 
	    { \exp_not:N \hrefurl{ \tl_trim_spaces:n {#2} }{ \tl_trim_spaces:n {#1} } } % #1 - text, #2 - url  
	\tl_gset:Ne \g__mitthesis_copyright_ccname_tl    { \tl_trim_spaces:n {#1} } 
	\tl_gset:Ne \g__mitthesis_copyright_ccurl_tl     { \tl_trim_spaces:n {#2} }
	\bool_gset_true:N \g__mitthesis_cclicense_bool
    \tl_if_in:NnT \g__mitthesis_copyright_ccurl_tl { /publicdomain/ }
	     { \bool_gset_true:N \g__mitthesis_publicdomain_bool }
    \msg_note:nnV { \ClassName } { cclicense } \g__mitthesis_copyright_ccname_tl
}
\msg_new:nnn { \ClassName } { cclicense } { Applying~#1~to~the~thesis. }


% Write XMP rights properties from \maketitle, after any CClicense is declared.
% This is not automatic with \DocumentMetadata; see l3pdfmeta.pdf. "True"/"False" must be capitalized.
% True = copyrighted (default); False = public domain (CC0 or public domain marked URL).
\cs_new_protected:Nn \__mitthesis_xmp_rights: {
    \bool_if:NF \g__mitthesis_xmp_rights_bool
      {
       \bool_gset_true:N \g__mitthesis_xmp_rights_bool
       \cs_if_exist:NT \pdfmeta_xmp_add:n
         {
          \bool_if:NTF \g__mitthesis_publicdomain_bool
              { \pdfmeta_xmp_add:n { <xmpRights:Marked>False</xmpRights:Marked> } }
              { \pdfmeta_xmp_add:n { <xmpRights:Marked>True</xmpRights:Marked> } }
          \bool_if:NT \g__mitthesis_cclicense_bool
              {
                \exp_args:Ne \pdfmeta_xmp_add:n
                  { <xmpRights:WebStatement>\exp_not:V \g__mitthesis_copyright_ccurl_tl</xmpRights:WebStatement> }
              }
         }
     }
}

%%%%%%%%%%  End Copyright Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Signature Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% revised 2026/11/10

\tl_new:N \g__mitthesis_signature_size_tl
\tl_new:N \g__mitthesis_sig_sep_tl

\NewDocumentCommand\SignatureBlockSize{m}{
	\__mitthesis_gset_signature_size:n {#1}
}

\cs_new_protected:Nn \__mitthesis_gset_signature_size:n 
  {
    \tl_gset:Nn        \g__mitthesis_signature_size_tl {#1}
    \tl_gtrim_spaces:N \g__mitthesis_signature_size_tl
    \str_case:VnF      \g__mitthesis_signature_size_tl
       { {\normalsize}{} {\small}{} {\footnotesize}{} {\scriptsize}{} {\tiny}{} }
       { \msg_error:nn { \ClassName } { weird_sigsize } }
  }
\msg_new:nnnn { \ClassName } { weird_sigsize }
		{ \iow_char:N \\SignatureBlockSize~expects~a~font-sizing~command,~such~as~
		  \iow_char:N \\small,~\iow_char:N \\footnotesize,~etc.
		}{
		  You~used~a~weird~input~value~here.~If~you~did~so~deliberately,~try~continuing.
		}	

\cs_new_protected:Nn \__mitthesis_signature_block: {
	\int_compare:nNnT { \g__mitthesis_supervisor_cnt_int } = {0} {
		\msg_error:nn { \ClassName } { no_supervisor } % this message is def'd in Abstract supervisor block
	}	
	\int_compare:nNnT { \g__mitthesis_acceptor_cnt_int } = {0} {
		\msg_error:nn { \ClassName } { no_acceptor }
	}	
	\tl_if_blank:VT \g__mitthesis_dd_thesisdate_tl { 
		\msg_error:nn { \ClassName } { no_thesis_date }
	}
    {
     \tl_use:N \g__mitthesis_signature_size_tl
     \skip_zero:N \topsep
     \skip_zero:N \partopsep
     \noindent
     \tagpdfsetup{ table/tagging=presentation }
     \tl_gclear:N \g__mitthesis_sig_sep_tl
         \begin{tabular}{@{}ll@{}}
         \int_step_inline:nn { \g__mitthesis_author_cnt_int }
           {
             \tl_use:N \g__mitthesis_sig_sep_tl
             \tag_struct_begin:n { tag = Span }
               \tag_mc_begin:n { tag = Span }
                 Authored\ by:
               \tag_mc_end:
             \tag_struct_end:
             & \seq_item:Nn \g__mitthesis_author_name_seq       { ##1 } \\
             & \seq_item:Nn \g__mitthesis_author_department_seq { ##1 } \\
             & \g__mitthesis_dd_thesisdate_tl 
             \tl_gset:Nn \g__mitthesis_sig_sep_tl { \\[1em] }
           }
         \int_step_inline:nn { \g__mitthesis_supervisor_cnt_int }
           {
            \tl_use:N \g__mitthesis_sig_sep_tl
            \tag_struct_begin:n { tag = Span }
              \tag_mc_begin:n { tag = Span }
                Certified\ by:
              \tag_mc_end:
            \tag_struct_end:
            & \seq_item:Nn \g__mitthesis_supervisor_name_seq  { ##1 } \\
            & \seq_item:Nn \g__mitthesis_supervisor_title_seq { ##1 } ,\ 
                \g__mitthesis_titlepg_sup_designation_tl
            \tl_gset:Nn \g__mitthesis_sig_sep_tl { \\[1em] }
           }
           \int_step_inline:nn { \g__mitthesis_acceptor_cnt_int }
             {
              \tl_use:N \g__mitthesis_sig_sep_tl
              \tag_struct_begin:n { tag = Span }
                \tag_mc_begin:n { tag = Span }
                  Accepted\ by:
                \tag_mc_end:
              \tag_struct_end:
              & \seq_item:Nn \g__mitthesis_acceptor_name_seq { ##1 } \\
              & \seq_item:Nn \g__mitthesis_acceptor_dept_seq { ##1 }
                  \tl_if_blank:eF { \seq_item:Nn \g__mitthesis_acceptor_title_seq { ##1 } }
                {
                  \\
                  & \seq_item:Nn \g__mitthesis_acceptor_title_seq { ##1 }
                }
              \tl_gset:Nn \g__mitthesis_sig_sep_tl { \\[1em] }
             }
         \end{tabular}
         \par
    }
}
\msg_new:nnnn { \ClassName } { no_acceptor }
		{ Missing~acceptor! \iow_newline: You~must~issue~the~\iow_char:N \\Acceptor{name}{department}{title}~command.
		}{
		  You~MUST~issue~the~\iow_char:N \\Acceptor{name}{department}{title}~command~after~\iow_char:N \\begin{document}~
		  and~before~\iow_char:N \\maketitle.
		}
\msg_new:nnnn { \ClassName } { no_thesis_date }
		{ Missing~thesis~date! \iow_newline: You~must~issue~the~\iow_char:N \\ThesisDate{Date~thesis~is~submitted}~command.
		}{
		  You~MUST~issue~the~\iow_char:N \\ThesisDate\{Date~thesis~is~submitted\}~command~after~\iow_char:N \\begin{document}~
		  and~before~\iow_char:N \\maketitle.
		}

% If for some reason you don't want an error message when you omit \Acceptor:
\NewDocumentCommand\SuppressAcceptorError{}
  {
  	\msg_redirect_name:nnn { \ClassName } { no_acceptor } { none }
  }

%%%%%%%%%%  End Signature Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Reader module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\seq_new:N  \g__mitthesis_reader_name_seq
\seq_new:N  \g__mitthesis_reader_title_seq
\seq_new:N  \g__mitthesis_reader_dept_seq

\int_new:N  \g__mitthesis_reader_cnt_int

\NewDocumentCommand\Reader{mmm}{
	\tl_if_blank:nTF {#1} {
		\msg_error:nn { \ClassName } { blank_reader }
		}{
		\__mitthesis_gput_reader_data:nnn
 {#1} {#2} {#3}
	}
	\tl_if_blank:nT {#2} {  \msg_error:nn { \ClassName } { blank_reader_title } }
	\tl_if_blank:nT {#3} {  \msg_error:nn { \ClassName } { blank_reader_dep   } }
}
\msg_new:nnnn { \ClassName } { blank_reader }
		{ Missing~reader~name! \iow_newline: Check~for~blank~in~\iow_char:N \\Reader{name}{title}{department}~command.
		}{
		  You~MUST~provide~the~reader's~name~using~the~\iow_char:N \\Reader{name}{title}{department}~command.
		}
\msg_new:nnnn { \ClassName } { blank_reader_title }
		{ Missing~reader~title! \iow_newline: Check~for~blank~in~\iow_char:N \\Reader{name}{title}{department}~command.
		}{
		  You~MUST~provide~the~reader's~title~using~the~\iow_char:N \\Reader{name}{title}{department}~command.
		}
\msg_new:nnnn { \ClassName } { blank_reader_dep }
		{ Missing~reader~department! \iow_newline: Check~for~blank~in~\iow_char:N \\Reader{name}{title}{department}~command.
		}{
	      You~MUST~provide~the~reader's~department~using~the~\iow_char:N \\Reader{name}{title}{department}~command.
		}
\msg_new:nnnn { \ClassName } { no_title } 
        { Missing~thesis~title! }
        { You~MUST~issue~the~\iow_char:N \\title\{Thesis~title\}~command~before~\iow_char:N \\maketitle. }

\cs_new_protected:Nn \__mitthesis_gput_reader_data:nnn

 {
	\int_gincr:N \g__mitthesis_reader_cnt_int
	\seq_gput_right:Ne  \g__mitthesis_reader_name_seq       { \tl_trim_spaces:n {#1} } 
	\seq_gput_right:Ne  \g__mitthesis_reader_title_seq      { \tl_trim_spaces:n {#2} }
	\seq_gput_right:Ne  \g__mitthesis_reader_dept_seq
 { \tl_trim_spaces:n {#3} }
 }

%%%%%%%%%%  End reader module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Title page Module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% revised 2026/11/19

\tl_new:N   \g_mitthesis_title_tl
\tl_new:N   \g__mitthesis_title_bookmark_tl
\tl_gset:Nn \g__mitthesis_title_bookmark_tl {Title~page}

\RenewDocumentCommand\title{m}
	{
		\__mitthesis_gset_title:n { #1 }
		\cs_gset_eq:NN \@title \g_mitthesis_title_tl
		\hypersetup{
			pdftitle={ { \g_mitthesis_title_tl } }, % extra braces protect commas that may be in title tl.
		}
	}

\NewDocumentCommand\TitlePageBookmark{m}{
    \tl_gset:Nn \g__mitthesis_title_bookmark_tl {#1} }
    
\cs_new_protected:Nn \__mitthesis_gset_title:n
	{
		\tl_gset:Ne \g_mitthesis_title_tl { \tl_trim_spaces:n {#1} }
	}

\tl_new:N   \g_mitthesis_institution_name_tl
\tl_gset:Nn \g_mitthesis_institution_name_tl { Massachusetts~Institute~of~Technology } 

\NewDocumentCommand\Institution{m} { 
    \tl_gset:Ne \g_mitthesis_institution_name_tl { \tl_trim_spaces:n #1 } 
}


%%%%%%% Adjust vertical skips between the major blocks of the title page

\bool_new:N \g__mitthesis_title_squashglue_bool

\cs_new_protected:Nn \__mitthesis_titlepage_bottomskip: {
    \bool_if:NTF \g__mitthesis_title_squashglue_bool 
		{ 	\skip_vertical:n { 0pt plus 1filll  } }
		{   \skip_vertical:n { 0pt plus 12fill } }
}

\NewDocumentCommand\Squash{}{ \bool_gset_true:N \g__mitthesis_title_squashglue_bool } % Squashes all glue from bottom upward

\bool_new:N \g__mitthesis_title_tighten_bool

\cs_new_protected:Nn \__mitthesis_titlepage_blockskip:nn {
    \bool_if:NTF \g__mitthesis_title_tighten_bool 
		{ 	\skip_vertical:n { 6pt plus #2fill    } }
		{   \skip_vertical:n { #1pt plus #2fill } }
}

\NewDocumentCommand\Tighten{}{ \bool_gset_true:N \g__mitthesis_title_tighten_bool } % Reduces 12pt and 18pt skips to 6pt


%%%%%%%% Some programs alter the title page text slightly 

% accommodation for LGO program, 2026/05/13
\bool_new:N        \g__mitthesis_program_note_bool
\tl_new:N          \g__mitthesis_program_note_tl

\NewDocumentCommand\LGO{}{ 
    \bool_gset_true:N \g__mitthesis_program_note_bool 
    \tl_gset:Nn       \g__mitthesis_program_note_tl 
        { in~conjunction~with~the~Leaders~for~Global~Operations~program \par }
}

\NewDocumentCommand\TitlePageProgramNote{m}{% extend to other programs that add to title page in the same way
	\tl_gset:Nn       \g__mitthesis_program_note_tl   {#1 \par}
	\bool_gset_true:N \g__mitthesis_program_note_bool
}


%%%%%%%%%%%%
\msg_new:nnnn { \ClassName } { no_degree_date } { Missing~degree~date! }{
			You~MUST~issue~the~\iow_char:N \\DegreeDate{month}{year}~command~before~\iow_char:N \\maketitle. }
		
\RenewDocumentCommand\maketitle{s}{
    \__mitthesis_gset_copyright_author:
    \__mitthesis_xmp_rights:
    %
    \ifmitthesis@lineno
        \internallinenumbers
    \fi
    %
    \tl_if_blank:VT \g_mitthesis_title_tl { \msg_error:nn { \ClassName } { no_title } }
    \cs_if_exist:NF \DegreeMonth {
        \msg_error:nn { \ClassName } { no_degree_date }
        \cs_gset:Npn \DegreeMonth { MISSING~MONTH }
        \cs_gset:Npn \DegreeYear  { MISSING~YEAR  }
    }
    %
    \int_compare:nNnTF { \g__mitthesis_author_cnt_int } > {1}
        { \tl_gset:Nn \g__mitthesis_copyright_crwords_tl { The\ authors\ hereby\ grant } }
        { \tl_gset:Nn \g__mitthesis_copyright_crwords_tl { The\ author\ hereby\ grants } }
    \IfBooleanTF {#1}
        {
            \tl_gset:Nn \g__mitthesis_copyright_mitpermission_tl
                { \tl_gclear:N \g__mitthesis_copyright_mitpermission_tl }
        }
        {
            \tl_gset:Nn \g__mitthesis_copyright_mitpermission_tl
                { \g__mitthesis_copyright_crwords_tl\ \g__mitthesis_copyright_mitpermlast_tl }
        }
    \bool_if:NTF \g__mitthesis_cclicense_bool
        {
            \tl_gset:Nn \g__mitthesis_copyright_license_tl
                {
                    This~work~is~licensed~under~a~\mbox{ \g__mitthesis_copyright_cclicense_tl }~license.\par
                    \g__mitthesis_copyright_mitpermission_tl
                }
            \tl_gset:Nn \g__mitthesis_copyright_pdfrights_tl
                {
                    This~work~is~licensed~under~a~\g__mitthesis_copyright_ccname_tl~license.
                    \tl_if_empty:NF \g__mitthesis_copyright_mitpermission_tl
                        { \space \g__mitthesis_copyright_mitpermission_tl }
                }
        }
        {
            \tl_gset:Nn \g__mitthesis_copyright_license_tl
                { All~rights~reserved. \par \g__mitthesis_copyright_mitpermission_tl }
            \tl_gset:Nn \g__mitthesis_copyright_pdfrights_tl
                {
                    All~rights~reserved.
                    \tl_if_empty:NF \g__mitthesis_copyright_mitpermission_tl
                        { \space \g__mitthesis_copyright_mitpermission_tl }
                }
        }
    %
    \clearpage
    \thispagestyle{empty}
    \tag_struct_begin:n { tag = Sect, title-o = \g__mitthesis_title_bookmark_tl }
        \vbox_to_ht:nn { \vsize } { % to prevent signature block from breaking across page
            { \centering
                \skip_set:Nn \parskip {7.5pt plus 1pt minus 1pt}
                \dim_zero:N  \parindent
                \pdfbookmark[0]{\g__mitthesis_title_bookmark_tl}{titlepage}
                % ---- H1: thesis title ----
                \group_begin:
                    \tagpdfsetup { para/tagging = false }
                    \Large
                    \tag_struct_begin:n { tag = Thesis_title, title = Title }
                        \leavevmode
                        \tag_mc_begin:n { }
                            \bfseries \g_mitthesis_title_tl
                        \tag_mc_end:
                        \par
                    \tag_struct_end:
                \group_end:
                \__mitthesis_titlepage_blockskip:nn {12}{1.5}
                % ---- Sect: author ----
                \tag_struct_begin:n { tag = Author, title = Author }
                    \__mitthesis_author_block:
                    \par
                \tag_struct_end:
                \__mitthesis_titlepage_blockskip:nn {12}{1.5}
                % ---- Sect: degree ----
                \tag_struct_begin:n { tag = Degree, title = Degree }
                    \__mitthesis_degree_block:
                    \bool_if:NT \g__mitthesis_program_note_bool { \g__mitthesis_program_note_tl }
                    at~the\par
                    \textls[60]{ \text_uppercase:n { \g_mitthesis_institution_name_tl } } \par
                    \DegreeMonth\ \DegreeYear\par
                \tag_struct_end:
                \__mitthesis_titlepage_blockskip:nn {12}{2}
                % ---- Sect: copyright ----
                \tag_struct_begin:n { tag = Copyright, title = Copyright }
                    \copyright\space\DegreeYear\space\g__mitthesis_copyright_author_tl\@.\c_space_token % \@. in case name ends with III, IV, V,...
                    \g__mitthesis_copyright_license_tl
                    \par % required to center \g__mitthesis_copyright_license_tl text.
                \tag_struct_end:
            }
            \__mitthesis_titlepage_blockskip:nn {18}{2}
            % ---- Sect: signatures ----
            \tag_struct_begin:n { tag = Title_sig_block, title = Signatures }
                \__mitthesis_signature_block:
                \par
            \tag_struct_end:
            \__mitthesis_titlepage_bottomskip:
        }
    \tag_struct_end: % end title-page Sect
    \hypersetup{
        pdfcopyright = { Copyright\ \DegreeYear\ by\ \g__mitthesis_copyright_author_tl.\space
                         \g__mitthesis_copyright_pdfrights_tl },
        pdfauthor        = { \g__mitthesis_pdfcopyright_author_tl },
        pdfcaptionwriter = { \g__mitthesis_pdfcopyright_author_tl },
    }
    \cleardoublepage
    \int_compare:nNnF { \g__mitthesis_reader_cnt_int } = {0} { \__mitthesis_committee_block: }
}

%%%%%%%%%%  End title page module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Thesis committee members page module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Presentation tables are used on this page for rendering the tagged file into html with consistent alignments.
%

% select something other than "Thesis Reader"
\tl_new:N   \g__mitthesis_reader_designation_tl
\tl_gset:Nn \g__mitthesis_reader_designation_tl { Thesis~Readers } 
\NewDocumentCommand\ThesisReaderName{ m } { 
		 \tl_gset:Ne \g__mitthesis_reader_designation_tl 
		     { \text_titlecase_all:n { \text_lowercase:n { \tl_trim_spaces:n {#1} } } }
		}
% use plural "Supervisors" if more than one supervisor
\cs_new_protected:Nn \__mitthesis_gset_supervisor_plurals: {
    \int_compare:nNnT { \g__mitthesis_supervisor_cnt_int } > {1} 
       	{   
    		\tl_gput_right:Nn \g__mitthesis_titlepg_sup_designation_tl { s } 
    	}
}

% select something other than "THESIS COMMITTEE" for the page title
\tl_new:N   \g__mitthesis_committee_name_tl
\tl_gset:Nn \g__mitthesis_committee_name_tl { THESIS~COMMITTEE } 
\NewDocumentCommand\ThesisCommitteeName{ m } { 
		 \tl_gset:Ne \g__mitthesis_committee_name_tl 
		     { \text_uppercase:n { \tl_trim_spaces:n {#1} } }
        }

% reduce white space around title ("THESIS COMMITTEE"), e.g., if too many committee members
\bool_new:N \g__mitthesis_short_cmtitle_bool
\cs_new_protected:Nn \__mitthesis_cmtitle_blockskip: {
	\bool_if:NTF  \g__mitthesis_short_cmtitle_bool 
		{ \skip_vertical:n { 32pt } }
		{ \skip_vertical:n { 56pt } }
}
\NewDocumentCommand\CMPShortenTop{}{ \bool_gset_true:N \g__mitthesis_short_cmtitle_bool } % Reduces 56pt skips to 32pt

% styling of text in headings
\cs_new_protected:Nn  \__mitthesis_CMstyle:n    { { \bfseries  \Large\lsstyle #1 } } 
\cs_new_protected:Nn  \__mitthesis_CMsubstyle:n { { \normalfont\scshape\large\lsstyle #1 } }


% Convert all "\&" to "and", split title list at each "\\ &", \emph each item in the sequence, output emphasized items each separated by "\\ &". 
% Rev: 2026/07/04, 2026/08/07 to handle unicode characters & to streamline code.

\tl_const:Nn    \c__mitthesis_bsbs_tl { \\ }
\tl_const:Nn    \c__mitthesis_amp_tl  { \& }
\regex_const:Nn \c__mitthesis_split_lines_regex   { \u{c__mitthesis_bsbs_tl} \s* & }
\regex_const:Nn \c__mitthesis_fix_ampersand_regex { \u{c__mitthesis_amp_tl} }
\seq_new:N      \l__mitthesis_titles_seq
 
\cs_new_protected:Nn \__mitthesis_assemble_CMtitle_list:n
  {
    \tl_set:Nn \l_tmpa_tl {#1}
    \regex_replace_all:NnN \c__mitthesis_fix_ampersand_regex { and } \l_tmpa_tl
    \regex_split:NVN       \c__mitthesis_split_lines_regex   \l_tmpa_tl \l__mitthesis_titles_seq
    \seq_set_map:NNn       \l_tmpa_seq \l__mitthesis_titles_seq { \emph { ##1 } }
    \seq_use:Nn            \l_tmpa_seq { \\ & } 
  }

% layout thesis committee members page (rev. 2026/11/11)
\cs_generate_variant:Nn \__mitthesis_assemble_CMtitle_list:n { e }
\tl_new:N \l__mitthesis_committee_bookmark_tl


% heading outside the tables: #1 tag, #2 title (tl var), #3 styled content
\cs_new_protected:Nn \__mitthesis_CM_heading:nnn
  {
    \group_begin:
        \tagpdfsetup { para/tagging = false }
        \tag_struct_begin:n { tag = #1, title-o = #2 }
            \noindent
            \tag_mc_begin:n { }
                #3
            \tag_mc_end:
            \par
        \tag_struct_end:
    \group_end:
  }

% a single committee member: #1 name, #2 title(s), #3 department(s)
\cs_new_protected:Nn \__mitthesis_CM_person:nnn
  {
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        &
        \tag_struct_begin:n { tag = Strong }
            \tag_mc_begin:n { tag = Strong }
                \textbf{ #1 }
            \tag_mc_end:
        \tag_struct_end:
        \\
        & \__mitthesis_assemble_CMtitle_list:e { #2 } \\
        & \__mitthesis_assemble_CMtitle_list:e { #3 }
    \end{tabular*}
    \skip_vertical:n {14pt}
  }

\cs_new_protected:Nn \__mitthesis_committee_block: {
    \__mitthesis_gset_supervisor_plurals:
    \tl_set:Ne \l__mitthesis_committee_bookmark_tl
        { \text_titlecase_all:n { \text_lowercase:n { \g__mitthesis_committee_name_tl } } }
    \vbox_to_ht:nn { \vsize } { % to prevent committee page splitting into two pages
        \tag_struct_begin:n { tag = Committee_page, title-o = \l__mitthesis_committee_bookmark_tl }
            \__mitthesis_cmtitle_blockskip:
            \pdfbookmark[0]{ \l__mitthesis_committee_bookmark_tl }{ thesiscommittee }
            { \raggedleft
                \tagpdfsetup { table/tagging = presentation }
                % ---- H1: committee name ----
                \__mitthesis_CM_heading:nnn { Committee_name } { \l__mitthesis_committee_bookmark_tl }
                    { \__mitthesis_CMstyle:n { \g__mitthesis_committee_name_tl } }
                \__mitthesis_cmtitle_blockskip:
                % ---- Sect: supervisor(s) ----
                \tag_struct_begin:n { tag = Committee_supervisors, title-o = \g__mitthesis_titlepg_sup_designation_tl }
                    \__mitthesis_CM_heading:nnn { Committee_block_title } { \g__mitthesis_titlepg_sup_designation_tl }
                        { \__mitthesis_CMsubstyle:n { \g__mitthesis_titlepg_sup_designation_tl } }
                    \skip_vertical:n {12pt}
                    \int_step_inline:nn { \g__mitthesis_supervisor_cnt_int }
                      {
                        \__mitthesis_CM_person:nnn
                            { \seq_item:Nn \g__mitthesis_supervisor_name_seq  {##1} }
                            { \seq_item:Nn \g__mitthesis_supervisor_title_seq {##1} }
                            { \seq_item:Nn \g__mitthesis_supervisor_dept_seq  {##1} }
                      }
                \tag_struct_end:
                \skip_vertical:n {32pt}
                % ---- Sect: reader(s) ----
                \tag_struct_begin:n { tag = Committee_readers, title-o = \g__mitthesis_reader_designation_tl }
                    \__mitthesis_CM_heading:nnn { Committee_block_title } { \g__mitthesis_reader_designation_tl }
                        { \__mitthesis_CMsubstyle:n { \g__mitthesis_reader_designation_tl } }
                    \skip_vertical:n {12pt}
                    \int_step_inline:nn { \g__mitthesis_reader_cnt_int }
                      {
                        \__mitthesis_CM_person:nnn
                            { \seq_item:Nn \g__mitthesis_reader_name_seq  {##1} }
                            { \seq_item:Nn \g__mitthesis_reader_title_seq {##1} }
                            { \seq_item:Nn \g__mitthesis_reader_dept_seq  {##1} }
                      }
                \tag_struct_end:
            }
        \tag_struct_end:
        \skip_vertical:n { 0pt plus 16fill }
    }
    \cleardoublepage
}

%%%%%%%%%%  End thesis committee members page module  %%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  Abstract page module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rev. 2026/11/19

% to change the abstract name  (e.g., from "Abstract" to "Summary"):
%
%	\renewcommand*\abstractname{Summary}
%	with babel, use instead: \setlocalecaption{english}{abstract}{Summary}

\RenewDocumentEnvironment{abstract}{+b}{
  \cleardoublepage % use this (rather than \newpage) in case committee members page is present
  \tag_struct_begin:n { tag = Abstract_page, title = Abstract~page }
    { \centering
      \pdfbookmark[0]{\abstractname}{abstract}
      % ---- H1: thesis title ----
      \group_begin:
        \tagpdfsetup { para/tagging = false }
        \large
        \tag_struct_begin:n { tag = Abstract_title, title = Abstract~title }
          \leavevmode
          \tag_mc_begin:n { }
            \bfseries \g_mitthesis_title_tl
          \tag_mc_end:
          \par
        \tag_struct_end:
      \group_end:
      % ---- Sect: author and degree ----
      \skip_set:Nn \parskip { 0.5\baselineskip plus 2pt minus 2pt }
      \tag_struct_begin:n { tag = Abstract_info, title = Author~and~degree }
        \__mitthesis_author_abstractblock:
        \par
        \__mitthesis_degree_abstractblock:
        \par  % end the paragraph while still centered and inside the Sect
      \tag_struct_end:
    }
    \skip_vertical:n {2\baselineskip}
    % ---- Sect: abstract text ----
    \tag_struct_begin:n { tag = Abstract_text, title = Abstract~text }
      % ---- H2: abstract ----
      \group_begin:
        \tagpdfsetup { para/tagging = false }
        \tag_struct_begin:n { tag = Abstract_heading, title-o = \abstractname  }
          \noindent
          \tag_mc_begin:n { }
            \bfseries \text_uppercase:n { \abstractname }
          \tag_mc_end:
          \par
        \tag_struct_end:
      \group_end:
      \skip_vertical:n { 0.5em }
      \tl_if_blank:nT {#1} { MISSING\ ABSTRACT!  \msg_error:nn { \ClassName } { missing_abstract } }
      #1
      \par
    \tag_struct_end:
}{
    % ---- Sect: abstract supervisor[s] ----
    \tag_struct_begin:n { tag = Abstract_supervisor, title = Abstract~supervisor }
       \__mitthesis_supervisor_abstractblock:
       \par
    \tag_struct_end:
  \tag_struct_end: % end the Sect structure surrounding the abstract pages.
  \cleardoublepage
}
\msg_new:nnnn { \ClassName } { missing_abstract } { Missing~abstract! } 
	{ No~file~was~input~for~the~abstract. \iow_newline: You~need~to~do~\iow_char:N \\input{abstract.tex}. }

%%%%%%%%%%  End abstract page module  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% End title and abstract page codes  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%  A nomenclature environment  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rev. 2026/11/21

\newlength\savitemsep
\newlength\nomenwidth

% nomenclature entries
\NewDocumentCommand\entry{m +m}{%
    \item[{#1\hfill}]#2%
    \@itempenalty=-\@lowpenalty
}

\ExplSyntaxOn

% nomenclature subheadings 
\NewDocumentCommand\EntryHeading{m}{%
	\itemsep3\p@ plus 1\p@ minus 1\p@
    \@itempenalty -500 \scan_stop: %  \item omits it at the top of the list
    \item[\tag_struct_begin:n { tag = Nomenclature_entry_heading } 
          \emph{#1}\tag_struct_end: \hfill]\mbox{}% add mbox for tagged pdf 2023/10/11; 2025/09/23 replace \itshape by \emph for css
    \setlength{\itemsep}{\savitemsep}% restore the list's item spacing
    \@itempenalty=\@M 
}

% Variables
\int_new:N  \g__mitthesis_nom_int           % unique link targets
\tl_new:N   \l__mitthesis_nomname_tl        % heading text
\tl_new:N   \l__mitthesis_nom_short_tl      % empty means same as title
\tl_new:N   \l__mitthesis_nom_heading_tl
\tl_new:N   \l__mitthesis_nom_toc_tl        % empty means same as heading
\dim_new:N  \l__mitthesis_nom_indent_dim
\int_new:N  \l__mitthesis_nom_columns_int
\dim_new:N  \l__mitthesis_nom_colsep_dim
\bool_new:N \l__mitthesis_nom_multicol_bool
\skip_new:N \l__mitthesis_nom_mcsep_skip    % saved \multicolsep

% Keys
\keys_define:nn { mitthesis / nomenclature }
  {
    indent      .dim_set:N        = \l__mitthesis_nom_indent_dim ,
    indent      .initial:n        = 2em ,
    indent      .value_required:n = true ,
    title       .tl_set:N         = \l__mitthesis_nomname_tl ,
    title       .initial:n        = Nomenclature ,
    short-title .tl_set:N         = \l__mitthesis_nom_short_tl ,
    heading     .tl_set:N         = \l__mitthesis_nom_heading_tl ,
    heading     .initial:n        = section ,
    heading     .value_required:n = true ,
    toc         .tl_set:N         = \l__mitthesis_nom_toc_tl ,
    columns     .int_set:N        = \l__mitthesis_nom_columns_int ,
    columns     .initial:n        = 1 ,
    columns     .value_required:n = true ,
    column-sep  .dim_set:N        = \l__mitthesis_nom_colsep_dim ,
    column-sep  .initial:n        = 2em ,
    column-sep  .value_required:n = true ,
  }

% Messages
\msg_new:nnnn { \ClassName } { no_multicol }
  { The~multicol~package~has~not~been~loaded!~Using~one~column. }
  { The~nomenclature~option~'columns'~requires~the~multicol~package.~
    Load~it~in~your~preamble. }
\msg_new:nnn { \ClassName } { bad-heading }
  { Heading~command~'\iow_char:N\\#1'~is~not~defined;~using~'section'. }
\msg_new:nnn { \ClassName } { bad-toc-level }
  { TOC~entry~style~'#1'~is~not~defined;~using~'section'. }

% Fallbacks
\cs_new_protected:Npn \__mitthesis_nom_resolve:
  {
    \cs_if_exist:cF { \l__mitthesis_nom_heading_tl }
      {
        \msg_error:nnV { \ClassName } { bad-heading } \l__mitthesis_nom_heading_tl
        \tl_set:Nn \l__mitthesis_nom_heading_tl { section }
      }
    \tl_if_empty:NT \l__mitthesis_nom_toc_tl
      { \tl_set_eq:NN \l__mitthesis_nom_toc_tl \l__mitthesis_nom_heading_tl }
    \cs_if_exist:cF { l@ \l__mitthesis_nom_toc_tl }
      {
        \msg_error:nnV { \ClassName } { bad-toc-level } \l__mitthesis_nom_toc_tl
        \tl_set:Nn \l__mitthesis_nom_toc_tl { section }
      }
    % Copy the title before expanding it
    \tl_if_empty:NT \l__mitthesis_nom_short_tl
      { \tl_set_eq:NN \l__mitthesis_nom_short_tl \l__mitthesis_nomname_tl }
    \tl_set:Ne \l__mitthesis_nomname_tl { \l__mitthesis_nomname_tl }
    % More than one column requires multicol
    \bool_set:Nn \l__mitthesis_nom_multicol_bool
      { \int_compare_p:nNn { \l__mitthesis_nom_columns_int } > { 1 } }
    \bool_if:NT \l__mitthesis_nom_multicol_bool
      {
        \IfPackageLoadedTF { multicol } { }
          {
            \msg_error:nn { \ClassName } { no_multicol }
            \bool_set_false:N \l__mitthesis_nom_multicol_bool
          }
      }
  }

% User interface
\NewDocumentCommand \NomenSetup { m }
  { \keys_set:nn { mitthesis / nomenclature } {#1} }

% For more than one column, load multicols package in preamble
\NewDocumentEnvironment { nomenclature } { O{} }
  {
    \keys_set:nn { mitthesis / nomenclature } {#1}
    \__mitthesis_nom_resolve:
    \setlength { \nomenwidth } { \l__mitthesis_nom_indent_dim }
    \int_gincr:N \g__mitthesis_nom_int
    % link inside heading name to account for tagpdf's evolving approaches to starred chapters
    % keep the target unique in case of more than one nomenclature
    \use:c { \l__mitthesis_nom_heading_tl } *
      {
        \use:e { \exp_not:N \MakeLinkTarget * { nomenclature - \int_use:N \g__mitthesis_nom_int } }
        \l__mitthesis_nomname_tl
      }
    \addcontentsline { toc } { \l__mitthesis_nom_toc_tl } { \l__mitthesis_nom_short_tl }
    \str_if_eq:VnTF \l__mitthesis_nom_heading_tl { chapter }
      { \@mkboth { \l__mitthesis_nom_short_tl } { \l__mitthesis_nom_short_tl } }
      { \markright { \l__mitthesis_nom_short_tl } }
    \tag_struct_begin:n { tag = Nomenclature_list }
    \bool_if:NT \l__mitthesis_nom_multicol_bool
      {
        \setlength { \columnsep } { \l__mitthesis_nom_colsep_dim }
        \skip_set_eq:NN \l__mitthesis_nom_mcsep_skip \multicolsep
        \skip_zero:N \multicolsep % heading supplies the space above
        \begin{multicols} { \int_use:N \l__mitthesis_nom_columns_int } [ ] [ 0pt ]  % 0pt: no room check
      }
    \raggedright
    \nobreak
    \begin{list}{}{%
         \setlength{\itemsep}{0pt}%
         \setlength{\parsep}{\itemsep}%
         \setlength{\labelsep}{1em}%
         \setlength{\labelwidth}{\nomenwidth}%
         \setlength{\leftmargin}{\labelwidth}%
         \addtolength{\leftmargin}{\labelsep}%
         \setlength{\savitemsep}{\itemsep}%
    }%
  }
  {
    \end{list}
    \bool_if:NT \l__mitthesis_nom_multicol_bool { \end{multicols} }
    \tag_struct_end:                                  % after multicols: matches the begin
    \bool_if:NT \l__mitthesis_nom_multicol_bool
      { \addvspace { \l__mitthesis_nom_mcsep_skip } } % normal space below
    \ignorespacesafterend
  }
  

%\debug_off:n {all}
\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
%%
%% End of file `mitthesis.cls'.
