%%
%% This is file `aalok.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% aalok.dtx  (with options: `class')
%% 
%% --------------------------------------------------------------------------
%% लाटेक्-वर्ग आलोक आवृत्ती ०.६
%% प्रतिमुद्राधिकार © २०२१ निरंजन, आलोक मराठी नियतकालिक
%% 
%% ह्या सामग्रीच्या वितरणाचे व प्रतिमुद्रणाचे अधिकार आलोक नित्यमुक्त परवान्यासह मुक्त करण्यात येत
%% आहेत. ह्या सामग्रीची यथामूल अथवा परिवर्तित प्रतिमुद्रणे व्यावसायिक अथवा अव्यावसायिक स्वरूपात
%% वितरित करण्यास प्रतिमुद्राधिकारधारक संमती देत आहे, परंतु असे करताना वितरकाने
%% प्रतिमुद्राधिकारांचा योग्य श्रेयनिर्देश करणे व सामग्री परिवर्तित असल्यास ती ह्याच अटींसह वितरित
%% करणे बंधनकारक आहे. ही सामग्री जशी आहे तशी पुरवण्यात येत आहे, पुरवणारा/पुरवणारी हिच्याबाबत
%% कोणतीही हमी देत नाही. ह्या (व ह्यावर आधारित) सामग्रीचे अमुक्त वितरण बेकायदेशीर मानले
%% जाईल. आलोक नित्यमुक्त परवान्याचा संपूर्ण मसुदा पुढील दुव्यावर वाचता येईल.
%% 
%% https://gitlab.com/aalok/nityamukta-parwana
%% --------------------------------------------------------------------------
%% LaTeX Class aalok v0.6
%% Copyright © 2021 निरंजन, आलोक मराठी नियतकालिक
%% 
%% This program is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%% 
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%% 
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <https://www.gnu.org/licenses/>.
%% --------------------------------------------------------------------------
%% लाटेक्-वर्ग:       आलोक
%% लेखक:          निरंजन
%% आवृत्ती:          ०.६
%% वर्णन:           आलोक मराठी नियतकालिकाच्या अक्षरजुळणीकरिता लाटेक्-वर्ग.
%% संग्राहिका:        https://git.gnu.org.ua/aalok.git
%% अडचणी:         https://puszcza.gnu.org.ua/bugs/?group=aalok
%% परवाना:          आलोक नित्यमुक्त परवाना. आवृत्ती १.०+
%%                ग्नू पब्लिक परवाना. आवृत्ती ३.०+
%%                ग्नू फ्री डॉक्युमेन्टेशन परवाना. आवृत्ती १.३+
%%                दुवे:
%%                https://gitlab.com/aalok/nityamukta-parwana
%%                https://www.gnu.org/licenses/gpl
%%                https://www.gnu.org/licenses/fdl-1.3
%% ---------------------------------------------------------------------------
%% हे काम आलोक नित्यमुक्त परवान्याच्या (आवृत्ती १.० अथवा त्यापुढील) अटींचे पालन करून वितरित केले
%% जाऊ शकते तसेच सुधारले जाऊ शकते.
%% 
%% ह्या परवान्याची नवीनतम प्रत खालील गिट-संग्राहिकेवर उपलब्ध आहे.
%% 
%% https://gitlab.com/aalok/nityamukta-parwana
%% 
%% ह्या लाटेक्-वर्गाची लाटेक्-प्रकल्पाच्या नियमांनुसार देखरेख केली जात आहे.
%% 
%% ह्या लाटेक्-वर्गाचा लेखक व पालक निरंजन आहे.
%% 
%% ह्या कामात aalok.dtx, aalok.ins तसेच त्यांपासून निर्माण केलेली
%% aalok.cls ही धारिका समाविष्ट आहे.
%% ---------------------------------------------------------------------------
%% 
\def\aalokName{aalok}
\def\aalokVersion{०.६}
\def\aalokDate{२०२१/१२/१६}
\ProvidesClass{aalok}[2021/12/16 v0.6
आलोक लाटेक् आ. ०.६]
\let\पुष्पसंख्या\@empty
\def\पुष्प#1{%
  \def\पुष्पसंख्या{#1}%
}%
\let\कोणतादिनांक\@empty
\def\दिनांक#1{%
  \def\कोणतादिनांक{#1}%
}%
\let\पुष्पसंख्याआकडी\@empty
\def\आकडीपुष्प#1{%
  \def\पुष्पसंख्याआकडी{#1}
}%
\let\दिनांकआकडी\@empty
\def\आकडीदिनांक#1{%
  \def\दिनांकआकडी{#1}
}%
\let\कोणतीतिथी\@empty
\def\तिथी#1{%
  \def\कोणतीतिथी{#1}%
}%
\let\कितवीआवृत्ती\@empty
\def\आवृत्ती#1{%
  \def\कितवीआवृत्ती{#1}%
}%
\let\कोणतेप्रकाशनवर्ष\@empty
\def\प्रकाशनवर्ष#1{%
  \def\कोणतेप्रकाशनवर्ष{#1}%
}%
\let\विद्वान\@empty
\def\प्रीत्यर्थ#1{%
  \def\विद्वान{#1}%
}%
\let\कितवीजयंती\@empty
\def\जयंती#1{%
  \def\कितवीजयंती{#1}%
}%
\let\आकडीमूल्यकिती\@empty
\let\अक्षरीमूल्यकिती\@empty
\def\मूल्य#1#2{%
  \def\आकडीमूल्यकिती{#1}%
  \def\अक्षरीमूल्यकिती{#2}%
}%
\let\लेखाचेनाव\@empty
\def\लेख#1{%
  \def\लेखाचेनाव{#1}%
}%
\let\अभ्यासकाचेनाव\@empty
\def\अभ्यासक#1{%
  \def\अभ्यासकाचेनाव{#1}%
}%
\let\अभ्यासकाचाइपत्तादुवा\@empty
\let\अभ्यासकाचाइपत्तापाठ्य\@empty
\def\इपत्ता#1#2{%
  \def\अभ्यासकाचाइपत्तादुवा{#1}%
  \def\अभ्यासकाचाइपत्तापाठ्य{#2}%
}%
\let\orcidno\@empty
\def\orcid#1{%
  \def\orcidno{#1}%
}%
\newif\ifखासगीवितरण
\DeclareOption{खासगीवितरण}{\खासगीवितरणtrue}
\newif\ifछापील
\DeclareOption{छापील}{\छापीलtrue}
\newif\ifसुटालेख
\newif\ifस्थान
\DeclareOption{सुटालेख}{\सुटालेखtrue\स्थानtrue}
\DeclareOption{रेगे}{% 
  \दिनांक{२४ जानेवारी}% 
  \प्रीत्यर्थ{प्रा.\ मे.\ पुं.\ रेगे}% 
}% 
\DeclareOption{राजवाडे}{% 
  \दिनांक{२४ जून}% 
  \प्रीत्यर्थ{वि.\ का.\ राजवाडे}% 
}%
\ProcessOptions
\ifसुटालेख
\LoadClass[12pt]{article}
\else
\ifछापील
\LoadClass[openright,extrafontsizes,twocolumn]{memoir}
\else
\LoadClass[extrafontsizes,twocolumn,oneside]{memoir}
\fi
\fi
\RequirePackage{expl3}
\IfFileExists{l3pdf.sty}{\RequirePackage{l3pdf}}{}
\ExplSyntaxOn
\pdf_version_gset:n{2.0}
\ExplSyntaxOff
\RequirePackage{expex}
\RequirePackage{xcolor}
\RequirePackage{marathi}
\RequirePackage{microtype}
\RequirePackage{fontawesome5}
\RequirePackage{diagbox}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage{paracol}
\RequirePackage[most]{tcolorbox}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{mdframed}
\RequirePackage{etoolbox}
\newtoggle{स्थान}
\newtoggle{छापील}
\ifसुटालेख
\toggletrue{स्थान}
\else
\fi
\RequirePackage{xcolor}
\colorlet{लाल}{black!50!red}
\colorlet{निळादुवा}{blue!50!black}
\colorlet{निळा}{blue!20!black}
\colorlet{सोनेरी}{yellow!90!white}
\definecolor{कागद}{HTML}{FFF8DC}
\AtEndPreamble{%
  \RequirePackage[%
  unicode,%
  colorlinks,%
  \ifछापील
  linkcolor={black},%
  citecolor={black},%
  urlcolor={black},%
  \else
  linkcolor={लाल},%
  citecolor={निळादुवा},%
  urlcolor={निळादुवा},%
  \fi
  \ifसुटालेख
  pdftitle={\लेखाचेनाव},%
  pdfauthor={\अभ्यासकाचेनाव},%
  \else
  pdftitle={आलोक (पुष्प \पुष्पसंख्या, \कोणतादिनांक)},%
  pdfauthor={आलोक मराठी नियतकालिक},%
  \fi
  pdfsubject={शास्त्रचर्चेस वाहिलेले पहिले मुक्त मराठी नियतकालिक.},%
  pdfkeywords={वर्णमुद्रा प्रकाशन},%
  pdfproducer={आलोक मराठी नियतकालिक},%
  pdfcreator={हायपर्रेफ-सह झीलाटेक्}%
  ]%
  {hyperref}%
  \renewcommand{\tableautorefname}{कोष्टक}%
  \renewcommand{\appendixautorefname}{परिशिष्ट}%
  \renewcommand{\figureautorefname}{आकृती}%
}%
\RequirePackage[%
style=authoryear,%
sorting=none,%
backend=biber,%
]%
{biblatex}%
\addbibresource{सामग्री/संदर्भ.bib}
\DeclareNumChars{०१२३४५६७८९}
\DeclareCiteCommand{\citetitleyear}
{%
  \boolfalse{citetracker}%
  \boolfalse{pagetracker}%
}%
{%
  \ifciteindex
  {%
    \indexfield{indextitle}%
  }%
  {}%
  \printfield[citetitle]{labeltitle}%
  \setunit{\addspace}%
  \printtext[parens]{%
    \usebibmacro{prenote}%
    \printfield{year}\printfield{extrayear}%
    \usebibmacro{postnote}%
  }%
}%
{\multicitedelim}%
{}%
\definecolor{orcidcolor}{HTML}{a6ce39}
\newcommand{\orcidlogo}{%
  \ifछापील
  \faIcon{orcid}
  \else
  \textcolor{orcidcolor}{\faIcon{orcid}}
  \fi
}%
\दुसराटंक{\गोटू}{Gotu}
\दुसराटंक{\यशोमुद्रा}{Yashomudra-Italic.ttf}[Path=सामग्री/टंक/यशोमुद्रा/]
\दुसराटंक{\मुक्त}{Mukta-Regular.ttf}[Path=सामग्री/टंक/मुक्त/]
\ifसुटालेख
\else
\RequirePackage{tocloft}
\setlength\cftpartnumwidth{3em}
\setlength\cftchapternumwidth{2em}
\fi
\setlength{\columnsep}{0.5cm}
\tcbuselibrary{breakable}
\ifछापील
\tcbset{%
  colframe=black,%
  colback=white,%
  fonttitle=\bfseries\Large,%
  colupper=white!10!black,%
  breakable,%
  boxrule=0.5pt%
}%
\else
\tcbset{%
  colframe=black,%
  colback=कागद,%
  fonttitle=\bfseries\Large,%
  colupper=white!10!black,%
  breakable,%
  boxrule=0.5pt%
}%
\fi
\addto\captionsmarathi{%
  \renewcommand\glossaryname{परिभाषासूची}%
  \renewcommand\appendixname{परिशिष्ट}%
  \ifसुटालेख
  \else
  \renewcommand\chaptername{पुष्पदल}%
  \renewcommand\appendixpagename{परिशिष्ट}%
  \fi
}%
\RequirePackage{minitoc}
\renewcommand{\mtctitle}{विषयसूची}
\ifसुटालेख
\else
\dominitoc
\fi
\newcommand{\अनुक्रमणिका}{%
  \ifसुटालेख
  \tableofcontents
  \else
  \minitoc
  \fi
}%
\newcommand{\संदर्भसूची}{%
  {\LARGE\section*{संदर्भसूची}}%
  \printbibliography[heading=none]%
}%
\def\parsecomma#1,#2\endparsecomma{\def\page@x{#1}\def\page@y{#2}}
\tikzdeclarecoordinatesystem{पृष्ठ}{%
  \parsecomma#1\endparsecomma
  \pgfpointanchor{current page}{north east}%
  \pgf@xc=\pgf@x%
  \pgf@yc=\pgf@y%
  \pgfpointanchor{current page}{south west}%
  \pgf@xb=\pgf@x%
  \pgf@yb=\pgf@y%
  \pgfmathparse{(\pgf@xc-\pgf@xb)/2.*\page@x+(\pgf@xc+\pgf@xb)/2.}%
  \expandafter\pgf@x\expandafter=\pgfmathresult pt%
  \pgfmathparse{(\pgf@yc-\pgf@yb)/2.*\page@y+(\pgf@yc+\pgf@yb)/2.}%
  \expandafter\pgf@y\expandafter=\pgfmathresult pt%
}%
\ifसुटालेख
\pagestyle{fancy}
\renewcommand{\footrulewidth}{\headrulewidth}
\lhead{\raisebox{0.2cm}{\लेखाचेनाव}}
\rhead{\raisebox{0.2cm}{\अभ्यासकाचेनाव, \कोणतेप्रकाशनवर्ष}}
\lfoot{{\गोटू ।। आलोक ।।}}
\cfoot{\thepage}
\rfoot{{\गोटू पुष्प \पुष्पसंख्या}}
\else
\makepagestyle{शीर्षके}
\makeheadrule{शीर्षके}{\textwidth}{0.5pt}
\makefootrule{शीर्षके}{\textwidth}{0.5pt}{0pt}
\ifछापील
\makeevenhead{शीर्षके}{\raisebox{0.2cm}{\rightmark}}
{}
{\raisebox{0.2cm}{\leftmark}}
\makeoddhead{शीर्षके}{\raisebox{0.2cm}{\leftmark}}
{}
{\raisebox{0.2cm}{\rightmark}}%
\makeevenfoot{शीर्षके}%
{\raisebox{-0.2cm}{\गोटू पुष्प \पुष्पसंख्या}}%
{\raisebox{-0.2cm}{\thepage}}%
{\raisebox{-0.2cm}{\गोटू ।। आलोक ।।}}
\makeoddfoot{शीर्षके}%
{\raisebox{-0.2cm}{\गोटू ।। आलोक ।।}}%
{\raisebox{-0.2cm}{\thepage}}%
{\raisebox{-0.2cm}{\गोटू पुष्प \पुष्पसंख्या}}
\else
\makeoddhead{शीर्षके}
{\raisebox{0.2cm}{\leftmark}}
{}%
{\raisebox{0.2cm}{\rightmark}}
\makeoddfoot{शीर्षके}%
{\raisebox{-0.2cm}{\गोटू ।। आलोक ।।}}%
{\raisebox{-0.2cm}{\thepage}}%
{\raisebox{-0.2cm}{\गोटू पुष्प \पुष्पसंख्या}}
\makepsmarks{शीर्षके}{%
  \createmark{chapter}{left}{shownumber}{\@chapapp\space}{.\ }
  \createmark{section}{right}{shownumber}{}{.\ }
  \createplainmark{toc}{both}{\contentsname}
  \createplainmark{lof}{both}{\listfigurename}
  \createplainmark{lot}{both}{\listtablename}
  \createplainmark{bib}{both}{\bibname}
  \createplainmark{index}{both}{\indexname}
  \createplainmark{glossary}{both}{\glossaryname}
}%
\fi
\fi
\newcommand{\शीर्षक}
{%
  \frontmatter
  \onecolumn
  {%
    \गोटू
    \pagenumbering{gobble}
    \pagecolor{निळा}
    \begin{tikzpicture}[remember picture, overlay]
      \node[align=center,text width=\textwidth,color=सोनेरी] at (पृष्ठ cs:0,0) {%
        \begin{tabular}{c}
          {\HUGE ।। आलोक ।।}\\
          \\
          \\
          {\Large पुष्प \पुष्पसंख्या}
          \\
          \\
          \phantom{\Large \कोणतादिनांक}\\
        \end{tabular}
      };%
    \end{tikzpicture}

    \clearpage
    \ifछापील
    \pagecolor{white}
    \newpage\null\newpage
    \else
    \pagecolor{कागद}
    \newpage
    \fi
    \begin{tikzpicture}[remember picture,overlay,every node/.style={anchor=center}]
      \node[align=center,text width=\textwidth,color=black] at (पृष्ठ cs:0,0.75) {%
        {\Large शास्त्रचर्चेस वाहिलेले पहिले मुक्त मराठी नियतकालिक}
      };%
      \node[align=center,text width=\textwidth,color=black] at (पृष्ठ cs:0,0) {%
        \begin{tabular}{c}
          {\HUGE ।। आलोक ।।}\\
          \\
          \\
          {\Large पुष्प \पुष्पसंख्या}
          \\
          \\
          {\Large \कोणतादिनांक, \कोणतेप्रकाशनवर्ष}\\
        \end{tabular}
      };%
      \node[align=center,text width=\textwidth,color=black] at (पृष्ठ cs:0,-0.75)
      {%
        \ifखासगीवितरण
        खासगी वितरणासाठी
        \else
        \includegraphics[width=2.5cm,height=3cm]{सामग्री/छायाचित्रे/बोधचिन्ह-काळे}
        \fi
      };%
    \end{tikzpicture}
  }%
  \clearpage
  \begin{paracol}{2}
    \setlength{\parindent}{0pt}
    \begin{tabular}{l}
      \textbf{\underline{\Large संपादक}}\\
      निरंजन, ऋषिकेश\\
    \end{tabular}

    \bigskip
    \begin{tabular}{l}
      \textbf{\underline{\Large प्रकाशक}}\\
      वर्णमुद्रा पब्लिशर्स (\url{https://varnamudra.com})\\
      पृथक् रामकृष्ण सोसायटी,\\
      एसबीआय कॉलनी, शेगाव.\\
      बुलढाणा ४४४२०३\\
    \end{tabular}

    \bigskip

    \begin{tabular}{l}
      \textbf{\underline{\Large अक्षरजुळणी}}\\
      निरंजन, ऋषिकेश\\
      \href{https://gitlab.com/aalok/aalok/आलोक/पुष्प/\पुष्पसंख्या}%
      {%
        \small\ttfamily
        https://gitlab.com/aalok/aalok/%
        {%
          \normalfont\footnotesize
          आलोक/पुष्प/\पुष्पसंख्या%
        }%
      }\\
    \end{tabular}

    \switchcolumn

    {%
      \large\bfseries
      \कितवीआवृत्ती\ आवृत्ती

      \कोणतीतिथी

      \कोणतादिनांक, \कोणतेप्रकाशनवर्ष

      \विद्वान\ ह्यांच्या \कितवीजयंती व्या जयंतीनिमित्त.
    }%

    \smallskip
    \medskip
    \bigskip

    \begin{tabular}{l}
      \textbf{%
        \large
        \faIcon[regular]{envelope} आमच्यापर्यंत कसे पोहोचाल?%
      }\\
      \href{mailto:varnamudra.editors@gmail.com}%
      {%
        \ttfamily
        varnamudra.editors@gmail.com%
      }\\
      \href{mailto:aalokmarathi@protonmail.com}%
      {%
        \ttfamily
        aalokmarathi@protonmail.com%
      }
    \end{tabular}

    \bigskip

    \ifखासगीवितरण
    {%
      \begin{tabular}{p{2.2cm}l}
        \multicolumn{2}{l}{\large\bfseries केवळ खासगी वितरणाकरिता.}\\
        \textbf{\large स्वागतमूल्य} & \textbf{\faIcon{rupee-sign} \large \आकडीमूल्यकिती/-}\\
                                 & \अक्षरीमूल्यकिती\ रुपये फक्त.\\
      \end{tabular}
    }%

    \else

    \ifछापील

    \begin{tabular}{p{0.75cm}l}
      \textbf{\large मूल्य} & \textbf{\faIcon{rupee-sign} \large \आकडीमूल्यकिती/-}\\
                          & \अक्षरीमूल्यकिती\ रुपये फक्त.\\
    \end{tabular}

    \else

    \begin{tabular}{lll}
      \multicolumn{3}{l}{\large\bfseries ह्या प्रकल्पास आर्थिक साहाय्य करण्याकरिता}
      \medskip\\
      बँक खाते क्रमांक & - & ५०२०००४७६२७११४\\
      आयएफएससी क्रमांक & - & HDFC\(0002817\)
                           \bigskip\\
    \end{tabular}
    \fi
    \fi
  \end{paracol}

  \vfill

  \hrule

  \medskip
  \noindent\copyright\ \कोणतेप्रकाशनवर्ष\ आलोक मराठी नियतकालिक

  \medskip
  \noindent ह्या सामग्रीच्या वितरणाचे व प्रतिमुद्रणाचे अधिकार आलोक नित्यमुक्त परवान्यासह मुक्त
  करण्यात येत आहेत. ह्या सामग्रीची यथामूल अथवा परिवर्तित प्रतिमुद्रणे व्यावसायिक अथवा
  अव्यावसायिक स्वरूपात वितरित करण्यास प्रतिमुद्राधिकारधारक संमती देत आहे, परंतु असे करताना
  वितरकाने प्रतिमुद्राधिकारांचा योग्य श्रेयनिर्देश करणे व सामग्री परिवर्तित असल्यास ती ह्याच
  अटींसह वितरित करणे बंधनकारक आहे. ह्या (व ह्यावर आधारित) सामग्रीचे अमुक्त वितरण बेकायदेशीर
  मानले जाईल. आलोक नित्यमुक्त परवान्याचा संपूर्ण मसुदा पुढील दुव्यावर वाचा अथवा
  \autoref{परवाना} पाहा.

  \medskip
  \noindent\url{https://varnamudra.com/aalok/parwana/}

  \medskip
  \hrule

  \clearpage\pagebreak
}%
\newcommand{\लेखाचेशीर्षक}{%
  \ifसुटालेख
  \title{\लेखाचेनाव}
  \author{%
    \अभ्यासकाचेनाव\\
    \small\orcidlogo\quad\url{https://orcid.org/\orcidno}\\
    \href{mailto:\अभ्यासकाचाइपत्तादुवा}{\small\faIcon[regular]{envelope}\quad\ttfamily\अभ्यासकाचाइपत्तापाठ्य}
  }%
  \date{%
    {\small\गोटू ।। आलोक ।।}\\
    {\small\गोटू पुष्प \पुष्पसंख्या}\\
    {\small\गोटू \कोणतादिनांक, \कोणतेप्रकाशनवर्ष}\\
  }%
  \maketitle
  \pagecolor{कागद}
  \else
  \cleardoublepage\onecolumn
  \thispagestyle{empty}
  \vspace*{\fill}
  \noindent\makebox[\textwidth][c]{%
    \begin{minipage}{0.6\textwidth}
      \centering
      \hrule

      \medskip
      {%
        \LARGE\bfseries
        \लेखाचेनाव
      }\\[3ex]%
      \अभ्यासकाचेनाव\\
      \orcidlogo\quad\url{https://orcid.org/\orcidno}\\[1ex]
      \href{mailto:\अभ्यासकाचाइपत्तादुवा}{\faIcon[regular]{envelope}\quad\ttfamily\अभ्यासकाचाइपत्तापाठ्य}
      \medskip
      \hrule
    \end{minipage}
  }%
  \vfill
  \clearpage
  \twocolumn
  \chapter{\लेखाचेनाव}
  \chapterprecistoc{\quad\quad\textemdash\ {\यशोमुद्रा\अभ्यासकाचेनाव}}
  \fi
}%
\ifसुटालेख
\AtEndDocument{%
 \clearpage
 \pagebreak
 \setlength{\parindent}{0pt}

  \section*{ह्या सामग्रीचा संदर्भ कसा द्याल?}

  \fullcite{आलोक\jobname}

  \subsection*{बिबटेक् आज्ञावली}
  {%
    \ttfamily
    $@$article\{{\normalfont आलोक\jobname},\\
    author=\{{\normalfont\अभ्यासकाचेनाव}\},\\
    title=\{{\normalfont\लेखाचेनाव}\},\\
    journaltitle=\{{\normalfont आलोक मराठी नियतकालिक}\},\\
    date=\{{\normalfont\कोणतेप्रकाशनवर्ष-\दिनांकआकडी}\},\\
    series=\{{\normalfont\पुष्पसंख्याआकडी}\},\\
    note=\{{\normalfont बुलढाणा : वर्णमुद्रा प्रकाशन}\}\\
    \}
  }%
}%
\else
\fi
\endinput
%%
%% End of file `aalok.cls'.
