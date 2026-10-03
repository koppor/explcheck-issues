%%
%% UnBTeX: A class for bachelor, master, and doctoral thesis at the
%% University of Brasilia (UnB), Brazil
%% Version 1.6.6 2026/06/15
%% Copyright (C) 2021-2026 by Henrique C. Ferreira <hcferreira@unb.br>
%%
%% This class file may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version. The latest version of this
%% license is in:
%%
%%   https://www.latex-project.org/lppl.txt
%%
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%%
%% This distribution includes the class file unbtex.cls and the
%% bibliographic style package unbtexcite.sty
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unbtex}[2026/06/15 v1.6.6 Modelo da Universidade de Brasília baseado em abnTeX2]

% ------------------------------------------------------------------------
% Opções para a classe
% ------------------------------------------------------------------------

% ---
% Opção para definição de idioma principal
% ---
\newif\ifbrazilian
\braziliantrue % padrão
\def\unbtex@biblang{pt}
\def\unbtex@brazilianlang{brazilian}
\def\unbtex@portugueselang{portuguese}
\DeclareOption{idioma=brazil}{\braziliantrue\def\unbtex@biblang{pt}%
  \def\unbtex@brazilianlang{brazilian}\def\unbtex@portugueselang{portuguese}}
\DeclareOption{idioma=english}{\brazilianfalse\def\unbtex@biblang{en}%
  \def\unbtex@brazilianlang{english}\def\unbtex@portugueselang{english}}
% ---

% ---
% Opção para indicar na lista de referências as páginas em que cada uma é citada
% ---
\newif\ifrefback
\refbackfalse % padrão: desabilitada
\DeclareOption{refback}{\refbacktrue}
% ---

% ---
% Opção para definição de estilo de referências bibliográficas
% ---
\newif\ifbibalf
\newif\ifbibbrackets
\bibalftrue
\bibbracketsfalse
\def\unbtex@bibstyle{alf}
\def\unbtex@bibstyleopt{abnt-etal-cite=3}
% Estilo autor-data (padrão)
\DeclareOption{bib=alf}{\bibalftrue\def\unbtex@bibstyle{alf}
  \def\unbtex@bibstyleopt{abnt-etal-cite=3}}
% Estilo numérico com número entre colchetes
\DeclareOption{bib=num}{\bibalffalse\def\unbtex@bibstyle{num}
  \def\unbtex@bibstyleopt{}\bibbracketstrue}
% Estilo numérico com número entre parênteses
\DeclareOption{bib=(num)}{\bibalffalse\def\unbtex@bibstyle{num}
  \def\unbtex@bibstyleopt{}}
% Estilo numérico com número sobrescrito
\DeclareOption{bib=overcite}{\bibalffalse\def\unbtex@bibstyle{num}
  \def\unbtex@bibstyleopt{overcite}}
% Estilo numérico com referências nos rodapés
\DeclareOption{bib=foot}{\bibalffalse\def\unbtex@bibstyle{num}
  \def\unbtex@bibstyleopt{foot}\refbackfalse}
% ---

% ---
% Opção para lista de referências conforme normas da ABNT
% ---
\newif\ifrefbibtradicional
\refbibtradicionaltrue % padrão: refbib=tradicional
\DeclareOption{refbib=tradicional}{\refbibtradicionaltrue}
\DeclareOption{refbib=abnt}{\refbibtradicionalfalse}
% ---

% ---
% Opção para dividir o documento em seções ao invés de capítulos
% ---
\newif\ifchapnamesec
\chapnamesecfalse % padrão: desabilitada
\DeclareOption{chapnamesec}{\chapnamesectrue}
% ---

% ---
% Opção para definição de estilo de numeração de figuras, tabelas, etc
% ---
\newif\ifnumtradicional
\numtradicionaltrue % padrão: num=chap
\DeclareOption{num=tradicional}{\numtradicionaltrue}
\DeclareOption{num=abnt}{\numtradicionalfalse}
% ---

% ---
% Opções de diagramação de sumários da classe abntex2
% sumario=tradicional: Sumário tradicional do LaTeX/Memoir
% sumario=abnt       : Sumário conforme normas da ABNT
% ---
\newif\ifUNBTEXsumariotradicional
\newif\ifUNBTEXsumarioabnt
\UNBTEXsumarioabnttrue
\UNBTEXsumariotradicionalfalse
\DeclareOption{sumario=tradicional}
  {\UNBTEXsumariotradicionaltrue\UNBTEXsumarioabntfalse}
\DeclareOption{sumario=abnt}
  {\UNBTEXsumarioabnttrue\UNBTEXsumariotradicionalfalse}
% ---

% ---
% Opção para títulos de capítulos em letras maiúsculas
% ---
\newif\ifUNBTEXupperchapter
\UNBTEXupperchapterfalse
\DeclareOption{chapter=TITLE}{\UNBTEXupperchaptertrue}
% ---

% ---
% Opções article e twocolumn
% ---
% Opção article
\newif\ifUNBTEXisarticle
\UNBTEXisarticlefalse % padrão: desabilitada
\DeclareOption{article}{\UNBTEXisarticletrue
  \PassOptionsToClass{article}{memoir}}
% Opção twocolumn
\newif\ifUNBTEXistwocolumn
\UNBTEXistwocolumnfalse % padrão: desabilitada
\DeclareOption{twocolumn}{\UNBTEXistwocolumntrue
  \PassOptionsToClass{twocolumn}{memoir}}
% ---

% ---
% Repassa demais opções à classe memoir
% ---
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\newcommand{\unbtex@fontsize}{12pt}
\ifUNBTEXisarticle\ifUNBTEXistwocolumn
  \renewcommand{\unbtex@fontsize}{11pt}%
\fi\fi
\LoadClass[a4paper,\unbtex@fontsize]{memoir}
% ---

% ------------------------------------------------------------------------
% Configurações básicas
% ------------------------------------------------------------------------

% ---
% Pacotes matemáticos
% ---
\RequirePackage{mathtools} % Melhoria nas equações
\RequirePackage{amsthm} % Para configuração de ambientes do tipo teorema
% ---

% ---
% Pacotes de fontes tipográficas
% ---
\RequirePackage{stickstootext} % Fonte principal (Stix2)
\RequirePackage[stickstoo,vvarbb]{newtxmath} % Fonte matemática (Stix2)
\RequirePackage{bm} % Negrito em fontes matemáticas
\RequirePackage[scale=0.90]{tgheros} % Fonte sans serif (TeX Gyre Heros)
\RequirePackage[scale=1]{inconsolata} % Fonte monoespaçada
% Tamanho das fontes
\newcommand{\UNBTEXfontereduzida}{\footnotesize}
\newcommand{\UNBTEXchapterfont}{\sffamily}
\newcommand{\UNBTEXchapterfontsize}{\Huge}
\newcommand{\UNBTEXpartfont}{\UNBTEXchapterfont}
\newcommand{\UNBTEXpartfontsize}{\UNBTEXchapterfontsize}
\newcommand{\UNBTEXsectionfont}{\UNBTEXchapterfont}
\newcommand{\UNBTEXsectionfontsize}{\Large}
\newcommand{\UNBTEXsubsectionfont}{\UNBTEXsectionfont}
\newcommand{\UNBTEXsubsectionfontsize}{\large}
\newcommand{\UNBTEXsubsubsectionfont}{\UNBTEXsubsectionfont}
\newcommand{\UNBTEXsubsubsectionfontsize}{\normalsize}
\newcommand{\UNBTEXsubsubsubsectionfont}{\UNBTEXsubsectionfont}
\newcommand{\UNBTEXsubsubsubsectionfontsize}{\normalsize}
% Comandos para controlar as opções de títulos com letras maiúsculas 
\newcommand{\UNBTEXchapterupperifneeded}[1]%
  {\ifUNBTEXupperchapter\MakeTextUppercase{#1}\else#1\fi}
% ---

% ---
% Cores verde e azul UnB
% ---
% Define cores da UnB
\RequirePackage[dvipsnames]{xcolor}
\definecolor{verdeunb}{cmyk}{1,0,1,0.2}
\definecolor{azulunb}{cmyk}{1,0.65,0,0.35}
% ---

% ---
% Controla os bookmarks do pdf
% ---
\RequirePackage{bookmark}   			
% Comando para registro do bookmark interno
\newcounter{unbtex@bookmarkcounter}
\setcounter{unbtex@bookmarkcounter}{0}
\newcommand{\PRIVATEbookmarkthis}[1]{%
  \addtocounter{unbtex@bookmarkcounter}{1}%
  \phantomsection\pdfbookmark[0]{#1}{chapterb\arabic{unbtex@bookmarkcounter}}
}
% Comando que cria capítulos não numerados já com bookmark anotado
\newcommand{\pretextualchapter}[1]{%
  \addtocounter{unbtex@bookmarkcounter}{1}%
  \PRIVATEbookmarkthis{#1}%
  \chapter*[#1]{#1}%
}
\newif\ifunbtex@apendiceousecao
\unbtex@apendiceousecaofalse
% cleardoublepage se a opção article não estiver ativa
\newcommand{\PRIVATEclearpageifneeded}{\ifUNBTEXisarticle\else \cleardoublepage \fi}%
% ---

% ---
% Configurações do sumário
% ---
% nível de profundidade (implementa o quinto nível - subsubsubsection)
\setsecnumdepth{paragraph}
\settocdepth{paragraph}
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}
\maxsecnumdepth{paragraph}
% redefine os comandos de \paragraph para \subsubsubsection
\newcommand{\subsubsubsection}{\paragraph}
\newcommand{\cftbeforesubsubsubsectionskip}{\cftbeforeparagraphskip}
\newcommand{\cftsubsubsubsectionfont}{\cftparagraphfont}
\newcommand{\setsubsubsubsecheadstyle}{\setparaheadstyle}
\setparaheadstyle{\normalfont\sffamily\raggedright}%
\setafterparaskip{\aftersubsubsecskip}
% fonte das partes e dos capítulos no sumário
\renewcommand{\tocheadstart}{\UNBTEXchapterfont}
\renewcommand{\cftpartfont}{\bfseries\sffamily}
\renewcommand{\cftpartpagefont}{\cftpartfont}
\renewcommand{\cftchapterfont}{\bfseries\sffamily}
\renewcommand{\cftchapterpagefont}{\cftchapterfont}
\ifUNBTEXupperchapter
  \let\oldcontentsline\contentsline
  \renewcommand{\contentsline}[4]{%
    \IfSubStr{,chapter,part,appendix,annex,}{,#1,}
      {\oldcontentsline{#1}{\MakeTextUppercase{\texorpdfstring{#2}{#2}}}{#3}{#4}}
      {\oldcontentsline{#1}{#2}{#3}{#4}}
  }
\fi
% leaders para os capítulos
\renewcommand*{\cftchapterdotsep}{\cftdotsep}
% suprime espaço entre os itens de listings de diferentes capítulos 
\setlength{\cftbeforechapterskip}{0pt plus 0pt}
\renewcommand*{\insertchapterspace}{}
% macros para configurar o sumário conforme abnt ou tradicional
\newlength{\cftlastnumwidth}
\setlength{\cftlastnumwidth}{\cftsubsubsectionnumwidth}
\addtolength{\cftlastnumwidth}{1em}
% No caso de sumário tradicional
\ifUNBTEXsumariotradicional
  \settocdepth{subsection}
  \setlength{\cftbeforechapterskip}{5pt plus 1pt minus 1pt}
  \setlength{\cftbeforepartskip}{10pt plus 2pt minus 2pt}
  \newcommand{\tocprintchapter}{}
  \newcommand{\tocinnonumchapter}{}
  \newcommand{\tocprintchapternonum}{}
  \newcommand{\tocpartapendices}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{2em}
    \protect\renewcommand{\protect\cftchapteraftersnum}{\hfill\textendash\hfill}}}
  \newcommand{\tocpartanexos}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{2em}
    \protect\renewcommand{\protect\cftchapteraftersnum}{\hfill\textendash\hfill}}}
\fi
% No caso de sumário abnt
\ifUNBTEXsumarioabnt
  % fontes seções do sumário (até o quinto nível)
  \renewcommand{\cftsectionfont}{\bfseries\sffamily}
  \renewcommand{\cftsectionpagefont}{\cftsectionfont}
  \renewcommand{\cftsubsectionfont}{\normalsize}
  \renewcommand{\cftsubsectionpagefont}{\cftsubsectionfont}
  \renewcommand{\cftsubsubsectionfont}{\small}
  \renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}
  \renewcommand{\cftparagraphfont}{\footnotesize}
  \renewcommand{\cftparagraphpagefont}{\cftparagraphfont}
  % recuo das entradas do sumário
  \cftsetindents{part}{0em}{\cftlastnumwidth}
  \cftsetindents{chapter}{0em}{\cftlastnumwidth}
  \cftsetindents{section}{0em}{\cftlastnumwidth}
  \cftsetindents{subsection}{0em}{\cftlastnumwidth}
  \cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
  \cftsetindents{paragraph}{0em}{\cftlastnumwidth}
  \cftsetindents{subparagraph}{0em}{\cftlastnumwidth}
  \newcommand{\tocprintchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}
  \newcommand{\tocinnonumchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}
    \protect\renewcommand{\protect\cftchapteraftersnum}{\hfill\textendash\hfill}}}
  \newcommand{\tocprintchapternonum}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}}%
  \newcommand{\tocpartapendices}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}
    \protect\renewcommand{\protect\cftchapteraftersnum}{\hfill\textendash\hfill}}}
  \newcommand{\tocpartanexos}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}
    \protect\renewcommand{\protect\cftchapteraftersnum}{\hfill\textendash\hfill}}}
  \setlength{\cftbeforechapterskip}{1em}
  % Ajusta entrada Referências
  \renewcommand{\bibsection}{%
  \chapter*{\bibname}%
  \bibmark%
  \ifnobibintoc\else%
    \phantomsection%
    \addcontentsline{toc}{chapter}{\texorpdfstring{\UNBTEXchapterupperifneeded{\bibname}}{\bibname}}%
  \fi%
  \prebibhook%
  }
\fi
% Comando que simula a finalização de uma parte no bookmark e adiciona espaco de \part no sumário
\newcommand{\phantompart}{%
  \bookmarksetup{startatroot}%
  \phantomsection%
  \ifUNBTEXsumarioabnt
    \addtocontents{toc}{\vspace{\cftbeforechapterskip}}%
  \else
    \addtocontents{toc}{\vspace{\cftbeforepartskip}}%
  \fi
}
% ---

% ---
% Definição do estilo abnt para títulos de capítulos
% ---
% Cores nos títulos
\renewcommand{\tocheadstart}{}
\renewcommand{\UNBTEXchapterfont}{\bfseries\color{verdeunb}\sffamily}
\renewcommand{\UNBTEXsubsectionfont}{}
% Novo estilo da classe memoir 
\newif\ifunbtex@innonumchapter
\unbtex@innonumchaptertrue
\makechapterstyle{abnt}{%
  \renewcommand{\chapterheadstart}{} 
  \ifx\chapternamenumlength\undefined
    \newlength{\chapternamenumlength}
  \fi
  % tamanhos de fontes de chapter e part	
  \ifUNBTEXisarticle
    \setlength{\beforechapskip}{3.5ex \@plus 1ex \@minus 0.2ex}
    \renewcommand*{\chapterheadstart}{\addvspace{\beforechapskip}}
    \setlength{\afterchapskip}{2.3ex \@plus 0.2ex}
    \renewcommand{\chaptitlefont}{\UNBTEXsectionfont\UNBTEXsectionfontsize}
  \else
    \setlength{\beforechapskip}{0pt}
    \renewcommand{\chaptitlefont}{\UNBTEXchapterfont\UNBTEXchapterfontsize}
  \fi
  \renewcommand{\chapnumfont}{\chaptitlefont}
  \renewcommand{\parttitlefont}{\UNBTEXpartfont\UNBTEXpartfontsize\UNBTEXchapterupperifneeded}
  \renewcommand{\partnumfont}{\UNBTEXpartfont\UNBTEXpartfontsize}
  \renewcommand{\partnamefont}{\UNBTEXpartfont\UNBTEXpartfontsize\UNBTEXchapterupperifneeded}
  % tamanhos de fontes de section, subsection, subsubsection e subsubsubsection
  \setsecheadstyle{\UNBTEXsectionfont\UNBTEXsectionfontsize}
  \setsubsecheadstyle{\UNBTEXsubsectionfont\UNBTEXsubsectionfontsize}
  \setsubsubsecheadstyle{\UNBTEXsubsubsectionfont\UNBTEXsubsubsectionfontsize}
  \setsubsubsubsecheadstyle{\UNBTEXsubsubsubsectionfont\UNBTEXsubsubsubsectionfontsize}
  % impressão do número e do nome do capítulo
  \renewcommand{\chapternamenum}{}
  \renewcommand{\printchaptername}{%
    \chaptitlefont
    \ifUNBTEXisarticle\else
      \ifunbtex@apendiceousecao\UNBTEXchapterupperifneeded\appendixname\space\fi
    \fi
  }
  % impressão do título do capítulo
  \def\printchaptertitle##1{%
    \chaptitlefont%
    \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
    \ifunbtex@innonumchapter%
      \centering\UNBTEXchapterupperifneeded{##1}%
    \else%
      \ifunbtex@apendiceousecao%
        \centering\UNBTEXchapterupperifneeded{##1}%
      \else%
        \parbox[t]{\dimexpr\columnwidth-\chapternamenumlength\relax}%
          {\UNBTEXchapterupperifneeded{##1}}%
      \fi%
    \fi%
  }
  % impressão do número do capítulo     	
  \renewcommand{\printchapternum}{%
    \tocprintchapter%
    \unbtex@innonumchapterfalse%
    \chapnumfont\thechapter\space%
    \ifunbtex@apendiceousecao%
      \tocinnonumchapter\space\textendash\space%
    \fi%
    \space%
  }
  \renewcommand{\afterchapternum}{}
  % impressão do capítulo não numerado
  \renewcommand\printchapternonum{%
    \tocprintchapternonum%
    \unbtex@innonumchaptertrue%
  }
}
\chapterstyle{abnt}
% ---

% ---
% Configurações gerais de layout
% ---
\OnehalfSpacing
\setlength{\parindent}{1cm}
\ifUNBTEXistwocolumn \UNBTEXisarticletrue \fi
\ifUNBTEXisarticle
  \chapnamesectrue
  \setlength{\droptitle}{-2em}
  %\addtolength{\droptitle}{-1.5\baselineskip}
  \renewcommand{\maketitlehookb}{\LARGE\center\textit{\theforeigntitle}}
  \renewcommand{\maketitlehookb}{\vskip -1.5\topsep\vskip -1.5\partopsep}
  \renewcommand{\maketitlehookd}{\vskip -0.8em}
  \pretitle{\begin{center}\color{verdeunb}\LARGE\sffamily\bfseries}
  \posttitle{\par\end{center}\vskip 0.5em}
  \renewcommand{\and}{\unskip, }
  \renewcommand{\abstracttextfont}{\normalfont\normalsize}
  \renewcommand{\chapternamenum}[1]
    {\ifanappendix \chaptitlefont\UNBTEXchapterupperifneeded\appendixname~#1\else #1\fi}
  \renewcommand{\chaptitlefont}{\bfseries\sffamily\Large\color{verdeunb}}
  \setsecheadstyle{\large\bfseries\sffamily\color{verdeunb}}
  \setsubsecheadstyle{\normalfont\bfseries\sffamily}
  \ifUNBTEXistwocolumn
    \SingleSpacing
    \setlength{\parindent}{0.75cm} % Tamanho da indentação da primeira linha do parágrafo
    \setlength{\columnsep}{0.75cm}
    \def\@mathmargin{0pt}
    \setlrmarginsandblock{1.5cm}{1.5cm}{*} % Margens esquerda e direita
    \setulmarginsandblock{2.5cm}{2cm}{*} % Margens superior e inferior
    \checkandfixthelayout[nearest]
  \else
    \setlength{\parskip}{2pt plus 1pt minus 1pt} % Espaço entre parágrafos
    \setlrmarginsandblock{2.5cm}{2.5cm}{*}
    \setulmarginsandblock{3cm}{2cm}{*}
    \checkandfixthelayout[nearest]
  \fi
\else% Opção article não utilizada
  \setlength{\parskip}{2pt plus 1pt minus 1pt}
  \setlrmarginsandblock{3cm}{2cm}{*}
  \setulmarginsandblock{3cm}{2cm}{*}
  \checkandfixthelayout[nearest]
\fi
% ---

% ---
% Configurações de estilo e de cabeçalho das páginas
% ---
% Cabeçalho padrão abntex2
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\UNBTEXfontereduzida\thepage}{}{\UNBTEXfontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{\UNBTEXfontereduzida\textit\rightmark}{}{\UNBTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}
% Cabeçalho padrão unbtex
\makepagestyle{simple} % Cabeçalho com número de página e linha horizontal
\makeevenhead{simple}{\footnotesize\thepage}{}{}
\makeoddhead{simple}{}{}{\footnotesize\thepage}
\makeheadrule{simple}{\textwidth}{\normalrulethickness}
\makepagestyle{plain} % Cabeçalho com número de página e sem linha horizontal
\makeevenhead{plain}{\footnotesize\thepage}{}{}
\makeoddhead{plain}{}{}{\footnotesize\thepage}
% Cabecalho da primeira página do capitulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\UNBTEXfontereduzida\thepage}
% Configura layout para elementos pre-textuais
\newcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 
\AtBeginDocument{\pretextual}
% Configura layout para elementos textuais
\newcommand{\textualabntex}{% cabeçalho padrão abntex2
  \ifUNBTEXisarticle%
    \pagestyle{plain}%
  \else
    \pagestyle{abntheadings}%
    \aliaspagestyle{chapter}{abntchapfirst}
  \fi 
  \nouppercaseheads%
  \bookmarksetup{startatroot}% 
}
\newcommand{\textual}{%
  \ifUNBTEXisarticle
    \pagestyle{plain}
  \else 
    \pagestyle{simple}
    \aliaspagestyle{chapter}{abntchapfirst}
  \fi 
}
\renewcommand{\mainmatter}{\textual}
% Configura layout para elementos pos-textuais
\newcommand{\postextual}{\phantompart}
\renewcommand{\backmatter}{\postextual}
% ---

% ---
% Configurações do texto
% ---
\RequirePackage{indentfirst} % Indenta o primeiro parágrafo de cada seção.
\RequirePackage[disable=ifdraft,protrusion=false]{microtype} % Para melhorias de justificação
\RequirePackage{icomma} % Configura casas decimais separadas por vírgula
\frenchspacing % Retira espaço extra entre as frases (após o ponto final)
% Espaçamento para notas de rodapé
\setlength{\footmarkwidth}{1.2em} % largura do footnotemark
\setlength{\footmarksep}{0em}
\footmarkstyle{\footnotesize{\textsuperscript{#1}}\hfill}
\renewcommand{\foottextfont}{\UNBTEXfontereduzida} % tamanho da fonte do footnote
\setlength{\skip\footins}{20pt plus 2pt minus 2pt} % Espaço entre o texto e as notas de rodapé
\addtolength{\footnotesep}{2pt} % Espaço entre as notas de rodapé
\renewcommand*{\footnoterule}{\kern-3pt \hrule width 5cm \kern 2.6pt} % Tamanho do traço superior (5cm)
% Ajusta espaço entre texto e figuras/tabelas
\setlength{\textfloatsep}{14pt plus 2pt minus 2pt} % Espaçamento entre texto e floats no topo/base da página
\setlength{\floatsep}{12pt plus 2pt minus 2pt} % Espaçamento entre floats
\setlength{\intextsep}{14pt plus 2pt minus 2pt} % Espaçamento entre texto e floats no meio da página
% Ambiente para alineas, subalineas e incisos
\RequirePackage{enumitem}
\newlist{alineas}{enumerate}{2}
\setlist[alineas,1]{label={\alph*)},topsep=1pt,itemsep=0pt,parsep=1pt,partopsep=1pt,leftmargin=\parindent}
\setlist[alineas,2]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}
\newlist{subalineas}{enumerate}{1}
\setlist[subalineas,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
\newlist{incisos}{enumerate}{1}
\setlist[incisos,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
% Ajusta espaçamento nos ambientes itemize, enumerate e description
\setlist[itemize,enumerate,description]{topsep=1pt,itemsep=0pt,parsep=1pt,partopsep=1pt,leftmargin=\parindent}
% Numeração de figuras, tabelas, etc. por capítulo ou para o documento inteiro
\AddToHook{begindocument/end}{% Estilo de numeração de figuras, tabelas, etc.
\ifnumtradicional
  \numberwithin{equation}{chapter}
  \numberwithin{figure}{chapter}
  \numberwithin{table}{chapter}
\else% Numeração para o documento inteiro (padrão ABNT)
  \counterwithout{equation}{chapter}
  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}
  \counterwithout{quadro}{chapter}
  \counterwithout{lstlisting}{chapter}
  \counterwithout{algocf}{chapter}
  \counterwithout{theorem}{chapter}
  \counterwithout{lemma}{chapter}
  \counterwithout{proposition}{chapter}
  \counterwithout{corollary}{chapter}
  \counterwithout{definition}{chapter}
  \counterwithout{assumption}{chapter}
  \counterwithout{example}{chapter}
  \counterwithout{remark}{chapter}
\fi
}
% Modifica o tamanho da fonte e espaçamento entre linhas no ambiente verbatim
\RequirePackage{fvextra}
\renewenvironment{verbatim}{\VerbatimEnvironment
  \begin{Verbatim}[fontsize=\footnotesize,baselinestretch=1.1]}
  {\end{Verbatim}}%
\fvset{listparameters=\setlength{\topsep}{4pt}\setlength{\partopsep}{0pt}}
% Citação direta com mais de 3 linhas - ABNT NBR 10520
\newlength{\UNBTEXcitacaorecuo}
\ifUNBTEXistwocolumn
  \setlength{\UNBTEXcitacaorecuo}{1.8cm}
\else
  \setlength{\UNBTEXcitacaorecuo}{4cm}
\fi
\newenvironment*{citacao}[1][]{%
  \begin{adjustwidth}{\UNBTEXcitacaorecuo}{0cm}%
  \UNBTEXfontereduzida\vspace{4pt}%
  \begin{SingleSpace}%
  \if\relax\detokenize{#1}\relax\else
    \itshape\foreignlanguage{#1}%
  \fi
}{%
  \end{SingleSpace}\vspace{4pt}%
  \end{adjustwidth}
}
% ---

% ---
% Definições compartilhadas entre Apêndices e Anexos
% ---
\newcommand\@switch[1]{\@writefile{toc}{\renewcommand*{\cftappendixname}{#1\space}}}
\newcommand{\switchchapname}[1]{\protected@write\@auxout{}{\string\@switch{#1}}}
\newcommand{\PRIVATEapendiceconfig}[2]{%
  \unbtex@apendiceousecaotrue%
  \renewcommand{\appendixname}{#1}
  \renewcommand{\appendixpagename}{#2}
  \renewcommand{\appendixtocname}{\texorpdfstring{\UNBTEXchapterupperifneeded{#2}}{#2}}%
  \switchchapname{\texorpdfstring{\UNBTEXchapterupperifneeded{#1}}{#1}}%
  \renewcommand*{\cftappendixname}{#1\space}
}
% Apêndices
\newenvironment{apendicesenv}{%
  \PRIVATEapendiceconfig{\Apendicename}{\Apendicesname}
  \crefalias{chapter}{appendix} % Adicionado
  \begin{appendix}
}{
  \end{appendix}
  \unbtex@apendiceousecaofalse
  \bookmarksetup{startatroot}
}
% Anexos
\newenvironment{anexosenv}{%
  \PRIVATEapendiceconfig{\Anexoname}{\Anexosname}
  \crefalias{chapter}{annex}%
  \begin{appendix}
  \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}{%
  \end{appendix}
  \unbtex@apendiceousecaofalse
  \bookmarksetup{startatroot}
}
% Imprime uma página de divisão no estilo parte
\newcommand{\partpage}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{part}{\appendixtocname}%
  \appendixpage*
}
% Atalhos para \partpage ou \appendixpage* 
\newcommand{\partapendices}{%
  \tocpartapendices%
  \@ifstar{\appendixpage*}{\partpage}
}
\newcommand{\partanexos}{%
  \tocpartanexos%
  \@ifstar{\appendixpage*}{\partpage}
}
% ---

% ---
% Configurações das legendas de figuras e tabelas
% ---
\RequirePackage{subcaption} % Permite fazer subfiguras
\captionsetup{font=small,format=hang,labelsep=endash,aboveskip=6pt,belowskip=6pt}
\subcaptionsetup{position=top,aboveskip=8pt,belowskip=4pt}
% Define o comando \IBGEtab{}{}{} com caption e legenda da largura do conteúdo
\newsavebox{\myptabbox}
\newlength{\myptabboxwidth}
\newcommand{\IBGEtab}[3]{%
  \savebox{\myptabbox}{\UNBTEXfontereduzida #2}%
  \settowidth{\myptabboxwidth}{\usebox{\myptabbox}}%
  \parbox{\myptabboxwidth}{#1\par \UNBTEXfontereduzida #2\par%
    {\captionsetup{justification=justified,singlelinecheck=false}#3}%
  }%
}
% Redefine o comando \legend da classe memoir
\renewcommand{\legend}[2][]{\par%
  \begingroup
    \@parboxrestore
    \if@minipage \@setminipage \fi
    \captionsetup{position=bottom,font=footnotesize,labelsep=space,aboveskip=6pt,belowskip=0pt}%
    \@makecaption{#1}{\ignorespaces #2}\par
  \endgroup
}
% Define o comando \fonte
\newcommand{\fonte}[2][\fontename]{\legend[#1:]{#2}}
% ---

% ---
% Configurações para tabelas e quadros
% ---
\RequirePackage{longtable}% Para tabelas com quebra de página
\RequirePackage{multirow} % Para combinar linhas nas tabelas
\RequirePackage{colortbl} % Permite alterar cores de linhas e células das tabelas
\arrayrulecolor{verdeunb} % Define a cor das linhas das tabelas
\setlength{\arrayrulewidth}{0.6pt} % Define a espessura das linhas das tabelas
% Alinhamento em colunas com especificação de largura
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
% Criação dos ambientes flutuantes para quadros
\newfloat[chapter]{quadro}{loq}{\Quadroname}
\newlistof{listofquadros}{loq}{\listquadroname}
\newlistentry{quadro}{loq}{0}
\renewcommand{\cftquadroname}{\Quadroname\space}
\renewcommand{\thequadro}{\thechapter.\arabic{quadro}}
\def\QT@c@ption#1[#2]#3{%
  \LT@makecaption#1\fnum@quadro{#3}%
  \def\@tempa{#2}%
  \ifx\@tempa\@empty\else
    {\let\\\space
    \addcontentsline{\ext@quadro}{quadro}{\protect\numberline{\thequadro}{#2}}}%
  \fi
}
\newenvironment{longquadro}
  {\let\LT@c@ption\QT@c@ption\let\c@table\c@quadro\crefalias{table}{quadro}
  \renewcommand{\theHtable}{quadro\thechapter.\arabic{quadro}}\longtable}
  {\endlongtable}
% ---

% ---
% Pacotes para algoritmos
% ---
\RequirePackage[algochapter,linesnumbered,boxed,
  \unbtex@portugueselang,onelanguage]{algorithm2e}
\setlength{\algomargin}{1.8em} % margem esquerda
\SetAlgoInsideSkip{smallskip} % margem superior/inferior
\renewcommand{\CommentSty}[1]{\texttt{\small#1}}
% Configura caption
\renewcommand{\AlCapFnt}{\normalfont\small}
\renewcommand{\@algocf@capt@boxed}{above}
\DontPrintSemicolon
\newlength{\algcaptionwidth}
\newlength{\algcaptiontwidth}
\renewcommand{\algocf@makecaption}[2]{%
  \settowidth{\algcaptionwidth}{#1 -- }%
  \settowidth{\algcaptiontwidth}{\small #1 -- #2}%
  \ifdim\algcaptiontwidth<\columnwidth
    \hspace*{\dimexpr(\columnwidth-\algcaptiontwidth)/2\relax}%
  \fi
  \makebox[\algcaptionwidth][l]{#1 -- }%
  \parbox[t]{\dimexpr\columnwidth-\algcaptionwidth\relax}{\small #2\par\vspace{6pt}}%
}
% Configura fonte e legenda
\newcommand{\unbtex@makebottomlegend}[2]{%
  \par\vspace{6pt}%
  \begingroup
    \@parboxrestore
    \noindent\normalfont\UNBTEXfontereduzida
    \if\relax\detokenize{#1}\relax\else #1\space\fi
    \ignorespaces #2\par
  \endgroup
}
\newcommand{\unbtex@alglegend}{}
\newcommand{\unbtex@addalglegend}[2]
  {\g@addto@macro\unbtex@alglegend{\unbtex@makebottomlegend{#1}{#2}}}
\newcommand{\unbtex@savealglegend}[2][]
  {\unbtex@addalglegend{#1}{#2}}
\newcommand{\unbtex@savealgfonte}[2][\fontename]
  {\unbtex@addalglegend{#1:}{#2}}
\let\unbtex@algocf@start\@algocf@start
\let\unbtex@algocf@finish\@algocf@finish
\let\unbtex@algocf@post@boxed\@algocf@post@boxed
\renewcommand{\@algocf@start}{%
  \gdef\unbtex@alglegend{}%
  \let\unbtex@documentlegend\legend
  \let\unbtex@documentfonte\fonte
  \let\legend\unbtex@savealglegend
  \let\fonte\unbtex@savealgfonte
  \unbtex@algocf@start%
}
\renewcommand{\@algocf@finish}{%
  \let\legend\unbtex@documentlegend
  \let\fonte\unbtex@documentfonte
  \unbtex@algocf@finish%
}
\renewcommand{\@algocf@post@boxed}{%
  \unbtex@algocf@post@boxed
  \unbtex@alglegend
}
% Configura lista de algoritmos
\renewcommand*\listofalgorithms{\listoftoc[\listalgorithmcfname]{loa}}
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{loa}{\protect\noaddvspace}
% ---

% ---
% Pacote para códigos de programação
% ---
\RequirePackage{listings}
% Julia (Linguagem não reconhecida automaticamente pelo pacote listings)
\lstdefinelanguage{Julia}%
  {morekeywords={abstract,break,case,catch,const,continue,do,else,elseif,%
  end,export,false,for,function,immutable,import,importall,if,in,%
  macro,module,otherwise,quote,return,switch,true,try,type,typealias,%
  using,while},%
  sensitive=true,%
  alsoother={\$},%
  morecomment=[l]\#,%
  morecomment=[n]{\#=}{=\#},%
  morestring=[s]{"}{"},%
  morestring=[m]{'}{'},%
}[keywords,comments,strings]%
% Configurações gerais
\definecolor{mygreen}{RGB}{28,172,0} % Color values Red, Green, Blue
\definecolor{mylilas}{RGB}{170,55,241}
\lstset{%
  basicstyle=\linespread{1.1}\ttfamily\scriptsize,
  numbers=left,%
  numberstyle={\tiny\color{black}}, % Size of the numbers
  numbersep=9pt, % This defines how far the numbers are from the text
  backgroundcolor=\color{gray!10},
  tabsize=2,
  frame=single,
  rulecolor=\color{black!30},
  captionpos=t,
  belowcaptionskip=10pt,
  escapeinside={\%*}{*)},
  breaklines=true,%
  breakatwhitespace=true,
  framextopmargin=2pt,
  framexbottommargin=2pt,
  keywordstyle=\color{blue},%
  morekeywords=[2]{1}, keywordstyle=[2]{\color{black}},
  identifierstyle=\color{black},%
  stringstyle=\color{mylilas},
  commentstyle=\color{mygreen},%
  extendedchars=true,
  inputencoding=utf8,
  showstringspaces=false,% Without this there will be a symbol in the places where there is a space
  literate={á}{{\'a}}1 {ã}{{\~a}}1 {é}{{\'e}}1 {ç}{{\c{c}}}1 {â}{{\^a}}1 {õ}{{\~o}}1 {ú}{{\'u}}1 {ó}{{\'o}}1 {í}{{\'i}}1 {Í}{{\'I}}1 
}
% Configura fonte e legenda
\newcommand{\unbtex@lstlegend}{}
\newcommand{\unbtex@addlstlegend}[2]
  {\g@addto@macro\unbtex@lstlegend{\unbtex@makebottomlegend{#1}{#2}}}
\newcommand{\unbtex@setlstlegend}[1]{\unbtex@setlstlegend@#1{}{}\@nil}
\def\unbtex@setlstlegend@#1#2#3\@nil{%
  \if\relax\detokenize{#2}\relax
    \unbtex@addlstlegend{}{#1}%
  \else
    \if\relax\detokenize{#1}\relax
      \unbtex@addlstlegend{}{#2}%
    \else
      \unbtex@addlstlegend{#1}{#2}%
    \fi
  \fi
}
\lst@Key{legend}{}{\unbtex@setlstlegend{#1}}
\lst@Key{fonte}{}{\unbtex@addlstlegend{\fontename:}{#1}}
\lst@AddToHook{PreSet}{\gdef\unbtex@lstlegend{}}
\lst@AddToHook{DeInit}{\unbtex@lstlegend}
% ---

% ---
% Configurações para remissões internas
% ---
\RequirePackage{hyperref}
\pdfstringdefDisableCommands{\def\\{, }\def\and{; }}
\hypersetup{pdfstartview=FitH,breaklinks=true,colorlinks=true,
   allcolors=azulunb,linktocpage,bookmarksdepth=4,draft=false}
\RequirePackage[nameinlink,noabbrev,\unbtex@brazilianlang]{cleveref}
\crefname{annex}{\anexoname}{\anexosname}
\Crefname{annex}{\Anexoname}{\Anexosname}
\crefname{listing}{\codigoname}{\codigosname}
\Crefname{listing}{\Codigoname}{\Codigosname}
\ifchapnamesec \crefname{chapter}{\chaptercrefname}{\chapterscrefname}
\Crefname{chapter}{\Chaptercrefname}{\Chapterscrefname} \fi
\crefname{paragraph}{\paragraphname}{\paragraphsname}
\Crefname{paragraph}{\Paragraphname}{\Paragraphsname}
\crefname{quadro}{\quadroname}{\quadrosname}
\Crefname{quadro}{\Quadroname}{\Quadrosname}
\crefname{assumption}{\aptname}{\aptsname}
\Crefname{assumption}{\Aptname}{\Aptsname}
\creflabelformat{equation}{#2#1#3} % remove os parênteses
% ---

% ---
% Definição de ambientes teorema, definição, demonstração, etc.
% ---
\RequirePackage{mdframed}
\RequirePackage{tablefootnote}
\newcommand{\UNBTEXmdframedfootnotetext}[1]{%
  \begingroup
    \toks@{#1}%
    \xdef\tfn@tablefootnoteprintout{%
      \tfn@tablefootnoteprintout
      \noexpand\footnotetext[\@thefnmark]{\unexpanded\expandafter{\the\toks@}}%
    }%
  \endgroup
}
\AtBeginEnvironment{mdframed}{%
  \let\footnote\tablefootnote
  \let\H@@footnotetext\UNBTEXmdframedfootnotetext
}
\AfterEndEnvironment{mdframed}{\tfn@tablefootnoteprintout\gdef\tfn@tablefootnoteprintout{\relax}\gdef\tfn@fnt{0}}
\theoremstyle{definition}
% Caixa verde
\mdfdefinestyle{plainSty}{hidealllines=true,backgroundcolor=verdeunb!10,innertopmargin=0pt}
\newmdtheoremenv[style=plainSty]{theorem}{\thname}[chapter] % Teorema
\newmdtheoremenv[style=plainSty]{lemma}{\lmname}[chapter] % Lema
\newmdtheoremenv[style=plainSty]{proposition}{\prname}[chapter] % Proposição
\newmdtheoremenv[style=plainSty]{corollary}{\crname}[chapter] % Corolário
% Caixa azul
\mdfdefinestyle{defnSty}{hidealllines=true,backgroundcolor=azulunb!10,innertopmargin=0pt}
\newmdtheoremenv[style=defnSty]{definition}{\dfname}[chapter] % Definição
\newmdtheoremenv[style=defnSty]{assumption}{\Aptname}[chapter] % Hipótese
\newmdtheoremenv[style=defnSty]{example}{\expname}[chapter] % Exemplo
% Observação
\theoremstyle{remark}
\let\proof\relax\let\endproof\relax
\newmdtheoremenv[linecolor=azulunb,linewidth=1pt,hidealllines=false,innertopmargin=4pt]{remark}{\rmname}[chapter]
% Demostração
\newtheoremstyle{myproof}{\topsep}{\topsep}{}{}{\bfseries}{}{ }{\thmname{#1} \thmnote{#3}}
\theoremstyle{myproof}
\let\proof\relax\let\endproof\relax
\newmdtheoremenv[linecolor=verdeunb,linewidth=1pt,hidealllines=false,innertopmargin=0pt]{proof}{\proofname.}
\AtEndEnvironment{proof}{\hfill$\square$}
% ---

% ---
% Listas de abreviaturas/siglas/símbolos
% ---
\RequirePackage[\unbtex@portugueselang]{nomencl}
%\RequirePackage[refpage]{nomencl} % Para imprimir página onde o símbolo foi registrado
%\def\pagedeclaration#1{\dotfill\hyperlink{page.#1}{\nobreakspace#1}\par}
\setlength{\nomitemsep}{0pt} % Espaço entre os itens das listas
% Imprime os títulos dos grupos
\newcommand{\nomenclheader}[1]{\section*{\large#1}}
% Controle da lista de abreviaturas/siglas
\newif\ifhasabbrlist
\hasabbrlistfalse
\providecommand{\sethasabbrlist}{\global\hasabbrlisttrue}
\newcommand{\unbtex@sethasabbrlist}{%
  \global\hasabbrlisttrue
  \protected@write\@auxout{}{\string\sethasabbrlist}%
}
% Controle da lista de símbolos
\newif\ifprintedlistsymbols
\printedlistsymbolsfalse
% Cabeçalhos dos grupos da lista de abreviaturas/siglas
\newcommand{\unbtex@abbrgroups}{,A,B,C,D,}
\newcommand{\unbtex@abbrgroupheader}[1]{%
  \IfStrEqCase{#1}{%
    {A}{\ifdefempty{\nomAname}{}{\nomenclheader{\nomAname}}}% A:
    {B}{\nomenclheader{\nomBname}}% B: Abreviaturas
    {C}{\nomenclheader{\nomCname}}% C: Siglas
    {D}{\ifdefempty{\nomDname}{}{\nomenclheader{\nomDname}}}% D:
  }%
}
% Cabeçalhos dos grupos da lista de símbolos
\newcommand{\unbtex@symbolgroups}{,E,F,G,X,Z,}
\newcommand{\unbtex@symbolgroupheader}[1]{%
  \IfStrEqCase{#1}{%
    {E}{\ifdefempty{\nomEname}{}{\nomenclheader{\nomEname}}}% E:
    {F}{\nomenclheader{\nomFname}}% F: Símbolos romanos
    {G}{\nomenclheader{\nomGname}}% G: Símbolos gregos
    %{H}{\nomenclheader{Nome do grupo H}}%
    {X}{\nomenclheader{\nomXname}}% X: Sobrescritos
    {Z}{\nomenclheader{\nomZname}}% Z: Subescritos
  }%
}
% Inicia a lista de símbolos
\newcommand{\unbtex@startsymbolslist}{%
  \ifprintedlistsymbols\else
    \global\printedlistsymbolstrue
    \ifhasabbrlist
      \PRIVATEclearpageifneeded
      \pretextualchapter{\listadesimbolosname}%
      \vspace{-0.5\baselineskip}%
    \fi
  \fi
}
% Cabeçalho dos grupos
\newcommand{\unbtex@nomenclgroupheader}[1]{%
  \IfSubStr{\unbtex@abbrgroups}{,#1,}{%
    \unbtex@abbrgroupheader{#1}%
  }{%
    \unbtex@startsymbolslist
    \unbtex@symbolgroupheader{#1}%
  }%
}
% Redefine o comando \nomenclature
\let\oldnomenclature\nomenclature
\renewcommand{\nomenclature}[3][]{%
  \ifstrempty{#1}{%
    \PackageWarning{unbtex}{Missing nomenclature group. Entry ignored}%
  }{%
    \edef\unbtex@group{\expandafter\@car#1\@nil}%
    \IfSubStr{\unbtex@abbrgroups\unbtex@symbolgroups}{,\unbtex@group,}{%
      \IfSubStr{\unbtex@abbrgroups}{,\unbtex@group,}{%
        \unbtex@sethasabbrlist
      }{}%
      \oldnomenclature[#1]{#2}{#3}%
    }{\PackageWarning{unbtex}{Undefined nomenclature group '#1'. Entry ignored}}%
  }%
}
% Ajusta a largura do rótulo nas listas de abreviaturas/siglas/símbolos
\newlength{\nomencl@minwidth}
\setlength{\nomencl@minwidth}{0.75cm}
\newcommand{\unbtex@currentnomenclgroup}{}
\providecommand{\unbtexsetnomenclgroupwidth}[2]{%
  \@ifundefined{unbtex@nomenclwidth@#1}%
    {\global\@namedef{unbtex@nomenclwidth@#1}{#2}}%
    {\ifdim#2>\@nameuse{unbtex@nomenclwidth@#1}\relax
       \global\@namedef{unbtex@nomenclwidth@#1}{#2}%
     \fi}%
}
\def\nomencl@measure#1{%
  \sbox0{#1}%
  \ifx\unbtex@currentnomenclgroup\@empty
    \gdef\unbtex@currentnomenclgroup{default}%
  \fi
  \ifdim\wd0<\nomencl@minwidth
    \@tempdima\nomencl@minwidth
  \else
    \@tempdima\wd0
  \fi
  \immediate\write\@mainaux{\string\unbtexsetnomenclgroupwidth%
    {\unbtex@currentnomenclgroup}{\the\@tempdima}}%
}
\newcommand{\unbtex@nomenclitem}[1]{%
  \nomencl@measure{#1}%
  \par\noindent\strut\makebox[\nom@tempdim][l]{#1}%
  \hspace{\labelsep}\hspace{0.25em}\ignorespaces
}
\def\thenomenclature{%
  \providecommand*{\listofnlsname}{\nomname}%
  \let\list@fname\listofnlsname
  \def\@currext{nls}%
  \tocbasic@listhead{\list@fname}%
  \nompreamble
  \parindent0pt\relax
  \parskip\nomitemsep\relax
  \gdef\unbtex@currentnomenclgroup{}%
  \renewcommand{\item}[1][]{\unbtex@nomenclitem{##1}}%
}
\def\endthenomenclature{\par\nompostamble}
\newcommand{\unbtex@setnomenclwidth}[1]{%
  \@ifundefined{unbtex@nomenclwidth@#1}%
    {\nom@tempdim\nomlabelwidth}%
    {\nom@tempdim\@nameuse{unbtex@nomenclwidth@#1}\relax}%
  \ifdim\nom@tempdim<\nomencl@minwidth
    \nom@tempdim\nomencl@minwidth
  \fi
}
\renewcommand{\nomgroup}[1]{%
  \unbtex@nomenclgroupheader{#1}%
  \gdef\unbtex@currentnomenclgroup{#1}%
  \unbtex@setnomenclwidth{#1}%
}
% ---

% ---
% Ajusta a indentação das listas de figuras, de tabelas, de algoritmos e de códigos
% ---
\DeclareTOCStyleEntry[
  indent=0pt,
  entrynumberformat=\entrynumberwithprefix{\figurename},
  dynnumwidth,
]{tocline}{figure}
\DeclareTOCStyleEntry[
  indent=0pt,
  entrynumberformat=\entrynumberwithprefix{\tablename},
  dynnumwidth,
]{tocline}{table}
\DeclareTOCStyleEntry[
  level:=table,
  numwidth:=table,
  indent=0pt,
  entrynumberformat=\entrynumberwithprefix{\Quadroname},
  dynnumwidth,
]{tocline}{quadro}
\DeclareTOCStyleEntry[
  level:=table,
  numwidth:=table,
  indent=0pt,
  entrynumberformat=\entrynumberwithprefix{\algorithmname},
  dynnumwidth,
]{tocline}{algocf}
\AddToHook{begindocument/end}{%
\DeclareTOCStyleEntry[
  level:=table,
  indent=0pt,
  entrynumberformat=\entrynumberwithprefix{\lstlistingname},
  dynnumwidth,
]{tocline}{lstlisting}%
}
\newcommand\entrynumberwithprefix[2]{#1~#2\thinspace\hfill}
% ---

% ---
% Configurações para referências bibliográficas
% ---
% Configurações da lista de referências
\newcommand{\unbtex@bibjustif}{bibjustif}
\edef\mybaselinestretch{\baselinestretch}
\ifrefbibtradicional
  \AtBeginEnvironment{thebibliography}{%
    \linespread{\mybaselinestretch}\selectfont
    \setlength{\bibitemsep}{0pt}%
    \ifbibalf \setlength{\bibindent}{\parindent} \fi
  }
\else
  \AtBeginEnvironment{thebibliography}{%
    \linespread{1}\selectfont
    \ifbibalf \setlength{\bibindent}{0pt} \fi
  }
  \renewcommand{\unbtex@bibjustif}{}
\fi
% Lista na bibliografia o número das páginas em que cada referência é citada
\ifrefback
  \RequirePackage[hyperpageref,\unbtex@brazilianlang]{backref}
  \renewcommand*{\backref}[1]{}
  \renewcommand*{\backrefalt}[4]{\ifcase#1\nocitation\or\citedp~#2.\else\citedpp~#2.\fi}
\fi
% Gera as referências bibliográficas de acordo com as normas da ABNT
\RequirePackage[\unbtex@bibstyle,\unbtex@bibstyleopt,abnt-etal-list=0,
  abnt-emphasize=bf,abnt-missing-year=sd,\unbtex@bibjustif]{unbtexcite}
\ifbibbrackets \citebrackets[] \fi
\bibliographystyle{unbtex-\unbtex@bibstyle-\unbtex@biblang}
% ---

% ---
% Define o texto dos rótulos de acordo com o idioma principal selecionado
% ---
\RequirePackage[english,brazilian,main=\unbtex@brazilianlang]{babel}
% Nomes constantes do unbtex em português (definições padrões)
\newcommand{\folhaderostoname}{Folha de rosto}
\newcommand{\epigraphname}{Epígrafe}
\newcommand{\dedicatorianame}{Dedicatória}
\newcommand{\errataname}{Errata}
\newcommand{\agradecimentosname}{Agradecimentos}
\newcommand{\apendicename}{apêndice}\newcommand{\apendicesname}{apêndices}
\newcommand{\Apendicename}{Apêndice}\newcommand{\Apendicesname}{Apêndices}
\newcommand{\anexoname}{anexo}\newcommand{\anexosname}{anexos}
\newcommand{\Anexoname}{Anexo}\newcommand{\Anexosname}{Anexos}
\newcommand{\folhadeaprovacaoname}{Folha de aprovação}
\newcommand{\resumoname}{Resumo} 
\newcommand{\listadesiglasname}{Lista de abreviaturas e siglas}
\newcommand{\listadesimbolosname}{Lista de símbolos}
\newcommand{\fontename}{Fonte}
\ifchapnamesec \newcommand{\chaptercrefname}{seção}\newcommand{\chapterscrefname}{seções}
\newcommand{\Chaptercrefname}{Seção}\newcommand{\Chapterscrefname}{Seções} \fi
\newcommand{\subsectionname}{seção}
\newcommand{\paragraphname}{seção}\newcommand{\paragraphsname}{seções}
\newcommand{\Paragraphname}{Seção}\newcommand{\Paragraphsname}{Seções}
\newcommand{\codigoname}{código}\newcommand{\codigosname}{códigos}
\newcommand{\Codigoname}{Código}\newcommand{\Codigosname}{Códigos}
\newcommand{\algorithmname}{Algoritmo}
\newcommand{\listquadroname}{Lista de quadros}
\newcommand{\quadroname}{quadro}\newcommand{\quadrosname}{quadros}
\newcommand{\Quadroname}{Quadro}\newcommand{\Quadrosname}{Quadros}
\newcommand{\thname}{Teorema}
\newcommand{\lmname}{Lema}
\newcommand{\prname}{Proposição}
\newcommand{\crname}{Corolário}
\newcommand{\aptname}{hipótese}\newcommand{\aptsname}{hipóteses}
\newcommand{\Aptname}{Hipótese}\newcommand{\Aptsname}{Hipóteses}
\newcommand{\dfname}{Definição}
\newcommand{\expname}{Exemplo}
\newcommand{\rmname}{Observação}
\newcommand{\nocitation}{Nenhuma citação no texto.}
\newcommand{\citedp}{Citado na p.}
\newcommand{\citedpp}{Citado nas pp.}
\newcommand{\nomFname}{Símbolos romanos}
\newcommand{\nomBname}{Abreviaturas}
\newcommand{\nomCname}{Siglas}
\newcommand{\nomDname}{}\newcommand{\nomEname}{}
\renewcommand{\nomAname}{}
% adiciona/altera textos padrão dependentes do idioma
\addto\captionsbrazilian{% português-brasil
  \ifchapnamesec \renewcommand{\chaptername}{Seção} \fi
  \renewcommand{\bibname}{Referências}
  \renewcommand{\indexname}{Índice}
  \renewcommand{\listtablename}{Lista de tabelas}
  \renewcommand{\listfigurename}{Lista de figuras}
  \renewcommand{\lstlistingname}{Código}
  \renewcommand{\lstlistlistingname}{Lista de códigos}
  \renewcommand{\proofname}{Demonstração}
  \renewcommand{\nomGname}{Símbolos gregos}
}
\addto\captionsenglish{% inglês
  \renewcommand{\folhaderostoname}{Title page}
  \renewcommand{\epigraphname}{Epigraph}
  \renewcommand{\dedicatorianame}{Dedication}
  \renewcommand{\errataname}{Errata sheet}
  \renewcommand{\agradecimentosname}{Acknowledgements}
  \renewcommand{\folhadeaprovacaoname}{Approval}
  \renewcommand{\resumoname}{Abstract} 
  \renewcommand{\listadesiglasname}{List of abbreviations and acronyms}
  \renewcommand{\listadesimbolosname}{List of symbols}
  \renewcommand{\fontename}{Source}
  \ifchapnamesec \renewcommand{\chaptername}{Section}
  \renewcommand{\chaptercrefname}{section}\renewcommand{\chapterscrefname}{sections}
  \renewcommand{\Chaptercrefname}{Section}\renewcommand{\Chapterscrefname}{Sections} \fi
  \renewcommand{\bibname}{References}
  \renewcommand{\listfigurename}{List of figures}
  \renewcommand{\listtablename}{List of tables}
  \renewcommand{\apendicename}{appendix}\renewcommand{\apendicesname}{appendices}
  \renewcommand{\Apendicename}{Appendix}\renewcommand{\Apendicesname}{Appendices}
  \renewcommand{\anexoname}{annex}\renewcommand{\anexosname}{annexes}
  \renewcommand{\Anexoname}{Annex}\renewcommand{\Anexosname}{Annexes}
  \renewcommand{\subsectionname}{section}
  \renewcommand{\paragraphname}{section}\renewcommand{\paragraphsname}{sections}
  \renewcommand{\Paragraphname}{Section}\renewcommand{\Paragraphsname}{Sections}
  \renewcommand{\lstlistingname}{Code}
  \renewcommand{\lstlistlistingname}{List of codes}
  \renewcommand{\codigoname}{code}\renewcommand{\codigosname}{codes}
  \renewcommand{\Codigoname}{Code}\renewcommand{\Codigosname}{Codes}
  \renewcommand{\algorithmname}{Algorithm}
  \renewcommand{\listquadroname}{List of charts}
  \renewcommand{\quadroname}{chart}\renewcommand{\quadrosname}{charts}
  \renewcommand{\Quadroname}{Chart}\renewcommand{\Quadrosname}{Charts}
  \renewcommand{\thname}{Theorem}
  \renewcommand{\lmname}{Lemma}
  \renewcommand{\prname}{Proposition}
  \renewcommand{\crname}{Corollary}
  \renewcommand{\aptname}{assumption}\renewcommand{\aptsname}{assumptions}
  \renewcommand{\Aptname}{Assumption}\renewcommand{\Aptsname}{Assumptions}
  \renewcommand{\dfname}{Definition}
  \renewcommand{\expname}{Example}
  \renewcommand{\rmname}{Remark}
  \renewcommand{\proofname}{Proof}
  \renewcommand{\nocitation}{No citations.}
  \renewcommand{\citedp}{Cit. on p.}
  \renewcommand{\citedpp}{Cit. on pp.}
  \renewcommand{\nomFname}{Roman letters}
  \renewcommand{\nomGname}{Greek letters}
  \renewcommand{\nomBname}{Abbreviations}
  \renewcommand{\nomCname}{Acronyms}
}
% ---

% ------------------------------------------------------------------------
% Informações do trabalho
% ------------------------------------------------------------------------
% Titulo do documento
\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\imprimirtitulo}{\thetitle}
\newcommand{\tituloestrangeiro}[1]{\providecommand{\theforeigntitle}{#1}}
\newcommand{\imprimirtituloestrangeiro}{\theforeigntitle}
% Autores
\newcommand{\autor}[1]{\author{#1}}
\newcommand{\imprimirautor}{\theauthor}
\newcommand{\autori}[3][]{\def\autorinome{#2}\def\autorisobrenome{#3}}
\newcommand{\autorii}[3][]{\def\autoriinome{#2}\def\autoriisobrenome{#3}}
% Código Cutter
\newcommand{\numerocutter}[1]{\def\imprimircutter{#1}}
% Orientadores
\newcommand{\orientador}[4][]{\def\orientname{#1}\def\orienttitulo{#2}\def\orientnome{#3}\def\orientsobrenome{#4}}
\newcommand{\coorientador}[4][]{\def\coorientname{#1}\def\coorienttitulo{#2}\def\coorientnome{#3}\def\coorientsobrenome{#4}}
% Tipo de trabalho/curso
\newcommand{\tipotrabalho}[1]{\newcommand{\imprimirtipotrabalho}{#1}}
\newcommand{\tipocurso}[1]{\def\imprimircurso{#1}}
% Informação adicional do trabalho
\newcommand{\publicacao}[1]{\def\imprimirpublicacao{#1}}
% Instituição
\newcommand{\instituicao}[3][]{\def\instituicaoi{#1}\def\instituicaoii{#2}\def\instituicaoiii{#3}}
% Local
\newcommand{\local}[1]{\newcommand{\imprimirlocal}{#1}}
% Preâmbulo
\newcommand{\preambulo}[1]{\newcommand{\imprimirpreambulo}{#1}}
% Data
\let\data\date
\let\imprimirdata\thedate
\newcommand{\dia}[1]{\def\imprimirdia{#1}}
\newcommand{\mes}[1]{\def\imprimirmes{#1}}
\newcommand{\ano}[1]{\def\imprimirano{#1}}
% Membros da banca
\newcommand{\membrodabancai}[1]{\def\membrodabancainome{#1}}
\newcommand{\membrodabancaii}[1]{\def\membrodabancaiinome{#1}}
\newcommand{\membrodabancaiii}[1]{\def\membrodabancaiiinome{#1}}
\newcommand{\membrodabancaiv}[1]{\def\membrodabancaivnome{#1}}
\newcommand{\membrodabancav}[1]{\def\membrodabancavnome{#1}}
\newcommand{\membrodabancaifuncao}[1]{\def\membrodabancaifuncaonome{#1}}
\newcommand{\membrodabancaiifuncao}[1]{\def\membrodabancaiifuncaonome{#1}}
\newcommand{\membrodabancaiiifuncao}[1]{\def\membrodabancaiiifuncaonome{#1}}
\newcommand{\membrodabancaivfuncao}[1]{\def\membrodabancaivfuncaonome{#1}}
\newcommand{\membrodabancavfuncao}[1]{\def\membrodabancavfuncaonome{#1}}
% Palavras-chave / Keywords
\ExplSyntaxOn
% armazenamento das listas
\NewDocumentCommand{\palavraschave}{m}
 { \clist_gset:Nn \g_pchave_clist {#1} }
\NewDocumentCommand{\keywords}{m}
 { \clist_gset:Nn \g_kword_clist {#1} }
% PT - Ficha catalográfica
\NewDocumentCommand{\printpchavecatalogo}{}
 {\int_zero:N \l_tmpa_int
  \clist_map_inline:Nn \g_pchave_clist
   {\int_incr:N \l_tmpa_int
    \int_use:N \l_tmpa_int.~\text_titlecase:n {##1}.\space
   }
 }
% PT - Resumo
\NewDocumentCommand{\printpchaveresumo}{}
 {\int_zero:N \l_tmpa_int
  \int_set:Nn \l_tmpb_int { \clist_count:N \g_pchave_clist }
  \clist_map_inline:Nn \g_pchave_clist
   {\int_incr:N \l_tmpa_int
    ##1
    \int_compare:nNnTF
      { \l_tmpa_int } < { \l_tmpb_int }
      {;~}
      { }
   }
 }
% EN - Ficha catalográfica
\NewDocumentCommand{\printkwordcatalogo}{}
 {\int_zero:N \l_tmpa_int
  \clist_map_inline:Nn \g_kword_clist
   {\int_incr:N \l_tmpa_int
    \int_use:N \l_tmpa_int.~\text_titlecase:n {##1}.\space
   }
 }
% EN - Abstract
\NewDocumentCommand{\printkwordresumo}{}
 {\int_zero:N \l_tmpa_int
  \int_set:Nn \l_tmpb_int { \clist_count:N \g_kword_clist }
  \clist_map_inline:Nn \g_kword_clist
   {\int_incr:N \l_tmpa_int
    ##1
    \int_compare:nNnTF
      { \l_tmpa_int } < { \l_tmpb_int }
      {;~}
      { }
   }
 }
\ExplSyntaxOff
% ---

% ---
% Imprime capa e contracapa
% ---
\RequirePackage{pdfpages}
\newenvironment{capa}{\begin{titlingpage}}{\end{titlingpage}\cleardoublepage}
% Imprime capa
\newcommand{\imprimircapa}{%
\IfFileExists{unbtexcover-front.pdf}{%
\hypersetup{pageanchor=false}
\begin{capa}%
  \begin{adjustwidth}{0cm}{\dimexpr\spinemargin-\foremargin\relax}
    \begin{center}
      \AddToShipoutPictureBG*{%
        \includegraphics[height=\paperheight]{unbtexcover-front.pdf}}
      \vspace*{\dimexpr 7.5cm + 3cm - \uppermargin\relax}
      {\LARGE\sffamily\bfseries
      \instituicaoi\par 
      \ifdefempty{\instituicaoii}{}{\instituicaoii\par}
      \ifdefempty{\instituicaoiii}{}{\instituicaoiii\par}}
      \vfill
      % Define o tamanho da fonte do título
      {\autotitle[4]{\bfseries\imprimirtitulo}
      \titleformat\bfseries\imprimirtitulo\par}
      \vfill
      {\Large\autorinome\ \autorisobrenome \\
      \ifdefempty{\autoriinome}{}{\autoriinome\ \autoriisobrenome}\par}
      \vfill\vfill
      {\color{white}\sffamily\large
      \MakeUppercase\imprimirtipotrabalho \\[2pt]
      \MakeUppercase\imprimircurso \\
      \autotitle[1]{\MakeUppercase\imprimircurso}
      \ifdefined\decvspace \vspace{2pt} \else \vspace{20pt} \fi
      \imprimirlocal \\ \imprimirano\par}
    \end{center}
  \end{adjustwidth}
\end{capa}
\hypersetup{pageanchor=true}
\AtEndDocument{\imprimircontracapa}
}{}%
}
% Imprime contracapa
\newcommand{\imprimircontracapa}{%
\IfFileExists{unbtexcover-back.pdf}{%
  \cleardoublepage
  \pagestyle{empty}
  \if@twoside
    \addtocounter{page}{-2}
    \ifoddpage\else\ \fi
  \else
    \addtocounter{page}{-1}
  \fi
  \hypersetup{pageanchor=false}
  \newpage
  \includepdf[height=\paperheight]{unbtexcover-back.pdf}
  \hypersetup{pageanchor=true}
}{}%
}
% ---

% ---
% Imprime folha de rosto 
% ---
\newenvironment{folhaderosto}[1][\folhaderostoname]
  {\clearpage\PRIVATEbookmarkthis{#1}}{\cleardoublepage}
\newenvironment{folhaderosto*}[1][\folhaderostoname]
  {\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}%
\newcommand{\folhaderostocontent}{%
\begin{center}
  {\LARGE\sffamily\bfseries\instituicaoi\par
  \ifdefempty{\instituicaoii}{}{\instituicaoii\par}
  \ifdefempty{\instituicaoiii}{}{\instituicaoiii\par}}
  \vfill\vfill
  \begin{center}
    \ifdefempty{\theforeigntitle}
    {\autotitle[4]{\bfseries\imprimirtitulo}
    {\color{verdeunb}\titleformat\bfseries\imprimirtitulo\par}}
    {\autotitle[4]{\bfseries\imprimirtituloestrangeiro}
    {\color{verdeunb}\titleformat\bfseries\imprimirtituloestrangeiro\par}}
  \end{center}
  \vfill
  {\Large\autorinome\ \autorisobrenome \\
  \ifdefempty{\autoriinome}{}{\autoriinome\ \autoriisobrenome}\par}
  \vfill
  \ifdefempty{\imprimirpreambulo}{}{%
  \begin{flushright}
    \begin{minipage}{0.5\textwidth}
      \begin{otherlanguage*}{brazilian}
        \begin{SingleSpace}
          \imprimirpreambulo
        \end{SingleSpace}
      \end{otherlanguage*}
    \end{minipage}%
  \end{flushright}
  }
  \vfill%
  {\ifdefempty{\orientnome}{}{\large \orientname: \orienttitulo\ \orientnome\ \orientsobrenome \\
  \ifdefempty{\coorientnome}{}{\coorientname: \coorienttitulo\ \coorientnome\ \coorientsobrenome}\par}}
  \vfill
  {\sffamily\large\ifdefempty{\imprimirpublicacao}{}{\imprimirpublicacao \\ \vfill} \imprimirlocal \\ \imprimirano\par}
\end{center}
}
\newcommand{\imprimirfolhaderostostar}[1]{%
  \begin{folhaderosto*}{#1}
    \folhaderostocontent
  \end{folhaderosto*}
}
\newcommand{\imprimirfolhaderostonostar}[1]{%
  \begin{folhaderosto}{#1}
    \folhaderostocontent
  \end{folhaderosto}
}
\newcommand{\imprimirfolhaderosto}[1][\folhaderostoname]{%
  \@ifstar
    \imprimirfolhaderostostar
    \imprimirfolhaderostonostar
}
% ---

% ---
% Imprime ficha catalográfica
% ---
\newcommand{\imprimirtitulolimpo}{\begingroup \def\\{}\imprimirtitulo \endgroup}
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\gdef\titulopuro{#1}}
\newcommand{\primeiraletra}[2][l]{\expandafter\primeiraletra@aux#2\relax{#1}}
\def\primeiraletra@aux#1#2\relax#3{\ifx#3u\uppercase{#1}\else\lowercase{#1}\fi}
% https://bce.unb.br/elaboracao-de-fichas-catalograficas/
\newcommand{\cutter}{\IfInteger{\imprimircutter}{&\strut}{}}
\newenvironment{fichacatalografica}{\thispagestyle{empty}\UNBTEXfontereduzida}{\newpage}%
\newcommand{\imprimirfichacatalografica}{
\begin{fichacatalografica}
\ifdefempty{\imprimirpublicacao}{}{%
{\noindent\sffamily\large REFERÊNCIA BIBLIOGRÁFICA}\par
\noindent\MakeUppercase\autorisobrenome, \autorinome%
\ifdefempty{\autoriinome}{.}{;~\MakeUppercase\autoriisobrenome, \autoriinome.} %
{\bfseries\imprimirtitulolimpo}. %
\begin{otherlanguage*}{brazilian}%
\imprimirtipotrabalho\ (\imprimircurso)%
\ifdefempty{\imprimirpublicacao}{}{,~\imprimirpublicacao} -- %
\ifdefempty{\instituicaoiii}{}{\instituicaoiii,~}%
\ifdefempty{\instituicaoii}{}{\instituicaoii,~}%
\instituicaoi, \imprimirlocal, \imprimirano. \thelastpage~\if@twoside p. \else f. \fi%
\end{otherlanguage*}
}
\IfInteger{\imprimircutter}{\setlength{\fboxsep}{10pt}}{\setlength{\fboxsep}{18pt}}
\vspace*{\fill}
\begin{SingleSpace}
\begin{center}
{\sffamily\large FICHA CATALOGRÁFICA} \\[18pt]
\fbox{%\ttfamily%
\begin{minipage}[t][7.5cm]{12.5cm}\raggedright
\IfInteger{\imprimircutter}
{\begin{tabular}{p{1cm} >{\raggedright\arraybackslash}p{10.5cm}}}{}
\cutter \autorisobrenome, \autorinome.~\\
\IfInteger{\imprimircutter}{\primeiraletra[u]{\autorisobrenome}%
\imprimircutter\primeiraletra[l]{\titulopuro}}{}
\cutter \hspace*{0.5cm}\noindent \imprimirtitulolimpo~/%
\begin{otherlanguage*}{brazilian}
\autorinome\ \autorisobrenome; %
\ifdefempty{\autoriinome}{}{\autoriinome\ \autoriisobrenome; }%
\orientname:\ \orientnome\ \orientsobrenome%
\ifdefempty{\coorientnome}{.}{;~\coorientname:\ \coorientnome\ \coorientsobrenome.}
-- \imprimirlocal, \imprimirano.%
\end{otherlanguage*}
~\\ \cutter \hspace*{0.5cm}\noindent \thelastpage~\if@twoside p. \else f. \fi
~\\ \cutter~\\ \cutter \hspace*{0.5cm}\noindent%
\begin{otherlanguage*}{brazilian}%
\imprimirtipotrabalho\ (\imprimircurso)\ -- \instituicaoi, \imprimirano.%
\end{otherlanguage*}
~\\ \cutter~\\ \cutter \hspace*{0.5cm}\noindent%
\ifbrazilian \printpchavecatalogo \else \printkwordcatalogo \fi
\begin{otherlanguage*}{brazilian}%
\ifdefempty{\autoriinome}{%
  \ifdefempty{\coorientnome}{%
    I. \orientsobrenome, \orientnome, orient. II. Título.%
  }{%
    I. \orientsobrenome, \orientnome, orient. %
    II. \coorientsobrenome, \coorientnome, coorient. %
    III. Título.%
  }%
}{%
  \ifdefempty{\coorientnome}{%
    I. \autoriisobrenome, \autoriinome. %
    II. \orientsobrenome, \orientnome, orient. %
    III. Título.%
  }{%
    I. \autoriisobrenome, \autoriinome. %
    II. \orientsobrenome, \orientnome, orient. %
    III. \coorientsobrenome, \coorientnome, coorient. %
    IV. Título.%
  }%
}%
\end{otherlanguage*}
\IfInteger{\imprimircutter}
{\end{tabular}}{}
\end{minipage}
}
\end{center}
\end{SingleSpace}
\end{fichacatalografica}
}
% ---

% ---
% Errata
% ---
\newenvironment{errata}[1][\errataname]{\pretextualchapter{#1}}{\PRIVATEclearpageifneeded}
% ---

% ---
% Imprime folha de aprovação
% ---
\RequirePackage{varwidth}
\newenvironment{folhadeaprovacao}[1][\folhadeaprovacaoname]
  {\clearpage\PRIVATEbookmarkthis{#1}\begin{SingleSpace}}{\end{SingleSpace}\cleardoublepage}
% Define comando \assinatura
\newlength{\UNBTEXsignwidth}
\newlength{\UNBTEXsignautowidth}
\newlength{\UNBTEXsignthickness}\setlength{\UNBTEXsignthickness}{1pt}
\newlength{\UNBTEXsignskip}\setlength{\UNBTEXsignskip}{1cm}
\newsavebox{\UNBTEXsignbox}
\newcommand{\UNBTEXchecksignwidth}[1]{%
  \sbox{\UNBTEXsignbox}{\begin{varwidth}{\textwidth}\centering #1\end{varwidth}}%
  \ifdim\wd\UNBTEXsignbox>\UNBTEXsignautowidth
    \setlength{\UNBTEXsignautowidth}{\wd\UNBTEXsignbox}%
  \fi
}
\newcommand{\UNBTEXautosignwidth}{%
  \setlength{\UNBTEXsignautowidth}{0pt}%
  \UNBTEXchecksignwidth{\textbf{\membrodabancainome}}%
  \UNBTEXchecksignwidth{\membrodabancaifuncaonome}%
  \UNBTEXchecksignwidth{\textbf{\membrodabancaiinome}}%
  \UNBTEXchecksignwidth{\membrodabancaiifuncaonome}%
  \UNBTEXchecksignwidth{\textbf{\membrodabancaiiinome}}%
  \UNBTEXchecksignwidth{\membrodabancaiiifuncaonome}%
  \ifdefempty{\membrodabancaivnome}{}
    {\UNBTEXchecksignwidth{\textbf{\membrodabancaivnome}}%
    \UNBTEXchecksignwidth{\membrodabancaivfuncaonome}}%
  \ifdefempty{\membrodabancavnome}{}
    {\UNBTEXchecksignwidth{\textbf{\membrodabancavnome}}%
    \UNBTEXchecksignwidth{\membrodabancavfuncaonome}}%
  \setlength{\UNBTEXsignwidth}{\dimexpr\UNBTEXsignautowidth+1.25cm\relax}%
}
\newcommand{\assinatura}{\@ifstar{\UNBTEXsign}{\UNBTEXcsign}}
\newcommand{\UNBTEXsign}[1]{%
  \parbox[t]{\UNBTEXsignwidth}{\vspace*{\UNBTEXsignskip}%
  \centering\rule{\UNBTEXsignwidth}{\UNBTEXsignthickness}\\\nopagebreak #1\par}%
}%
\newcommand{\UNBTEXcsign}[1]{\begingroup\par\centering\UNBTEXsign{#1}\par\endgroup}  
\newcommand{\signlinewidth}[1]{\setlength{\UNBTEXsignwidth}{#1}}
\newcommand{\imprimirfolhadeaprovacao}{%
\begin{folhadeaprovacao}
\begin{center}
  {\Large\sffamily\bfseries\instituicaoi\par
  \ifdefempty{\instituicaoii}{}{\instituicaoii\par}
  \ifdefempty{\instituicaoiii}{}{\instituicaoiii\par}}
  \vfill
  \begin{center}
    \autotitle[1]{\bfseries\imprimirtitulolimpo}
    \ifdefined\decvspace
      \color{verdeunb}\Large\bfseries\imprimirtitulolimpo\par
    \else
      \color{verdeunb}\titleformat\bfseries\imprimirtitulolimpo\par%
    \fi
  \end{center}
  \vfill
  {\large\autorinome\ \autorisobrenome \\[2pt]
  \ifdefempty{\autoriinome}{}{\autoriinome\ \autoriisobrenome}\par}
  \vfill
  \ifdefempty{\imprimirpreambulo}{}{%
  \begin{flushright}
    \begin{minipage}{0.5\textwidth}
      \begin{otherlanguage*}{brazilian}
        \imprimirpreambulo
      \end{otherlanguage*}
    \end{minipage}%
  \end{flushright}
  }%
  \vspace{24pt}
  \UNBTEXautosignwidth
  \raggedright{Trabalho aprovado. \imprimirlocal, \imprimirdia\ de \imprimirmes\ de \imprimirano:}{%
    \assinatura{\textbf{\membrodabancainome} \\ \membrodabancaifuncaonome}
    \assinatura{\textbf{\membrodabancaiinome} \\ \membrodabancaiifuncaonome}
    \assinatura{\textbf{\membrodabancaiiinome} \\ \membrodabancaiiifuncaonome}
    \ifdefempty{\membrodabancaivnome}{}{\assinatura{\textbf{\membrodabancaivnome} \\ \membrodabancaivfuncaonome}}
    \ifdefempty{\membrodabancavnome}{}{\assinatura{\textbf{\membrodabancavnome} \\ \membrodabancavfuncaonome}}
  }
\end{center}
\end{folhadeaprovacao}
}
% ---

% ---
% Imprime dedicatória
% ---
\RequirePackage{environ}
\newcommand{\storedDedicatoriaAutorI}{}
\newcommand{\storedDedicatoriaAutorII}{}
\NewEnviron{DedicatoriaAutorI}{\global\expandafter
\def\expandafter\storedDedicatoriaAutorI\expandafter{\BODY}}
\NewEnviron{DedicatoriaAutorII}{\global\expandafter
\def\expandafter\storedDedicatoriaAutorII\expandafter{\BODY}}
\newcommand{\imprimirdedicatoria}{
\begin{dedicatoria}
  \begin{center}
  \vspace*{\fill}
  % Primeiro autor
  {\itshape\storedDedicatoriaAutorI}\par
  \ifdefempty{\autoriinome}{}{%
    \vspace{\onelineskip}
    \autorinome\ \autorisobrenome\par
    \vspace*{\fill}
    % Segundo autor
    {\itshape\storedDedicatoriaAutorII}\par
    \vspace{\onelineskip}
    \autoriinome\ \autoriisobrenome
  }%
  \vspace*{\fill}
  \end{center}
\end{dedicatoria}
}
\newenvironment{dedicatoria}[1][]{%
  \if\relax\detokenize{#1}\relax
    \PRIVATEbookmarkthis{\dedicatorianame}%
  \else
    \pretextualchapter{#1}%
  \fi
}{\PRIVATEclearpageifneeded}%
% ---

% ---
% Imprime agradecimentos
% ---
\newcommand{\storedAgradecimentosAutorI}{}
\newcommand{\storedAgradecimentosAutorII}{}
\NewEnviron{AgradecimentosAutorI}{\global\expandafter
\def\expandafter\storedAgradecimentosAutorI\expandafter{\BODY}}
\NewEnviron{AgradecimentosAutorII}{\global\expandafter
\def\expandafter\storedAgradecimentosAutorII\expandafter{\BODY}}
% Define o idioma do título da seção de agradecimentos
\newcommand{\idiomaagradecimentos}[1]{\def\acklang{#1}}
\newcommand{\imprimiragradecimentos}{%
\ifdefstring{\acklang}{brazilian}
  {\renewcommand{\agradecimentosname}{Agradecimentos}}
  {\renewcommand{\agradecimentosname}{Acknowledgements}}
\begin{agradecimentos}
  \begin{otherlanguage*}{\acklang}
  % Primeiro autor
  \storedAgradecimentosAutorI\par
  \vspace{\onelineskip}
  \ifdefempty{\autoriinome}{}{%
    \hfill \autorinome\ \autorisobrenome\par
    \vspace{2\onelineskip}
    % Segundo autor
    \storedAgradecimentosAutorII\par
    \vspace{\onelineskip}
    \hfill \autoriinome\ \autoriisobrenome
  }%
  \end{otherlanguage*}
\end{agradecimentos}
}
\newenvironment{agradecimentos}[1][\agradecimentosname]
  {\pretextualchapter{#1}}{\PRIVATEclearpageifneeded}
% ---

% ---
% Imprime epígrafe
% ---
\newcommand{\storedEpigrafe}{}
\NewEnviron{Epigrafe}{\global\expandafter
\def\expandafter\storedEpigrafe\expandafter{\BODY}}
\newcommand{\imprimirepigrafe}{%
  \begin{epigrafe}
    \storedEpigrafe\par
  \end{epigrafe}
}
\newenvironment{epigrafe}[1][]{%
  \if\relax\detokenize{#1}\relax
    \PRIVATEbookmarkthis{\epigraphname}%
  \else
    \pretextualchapter{#1}%
  \fi
}{\PRIVATEclearpageifneeded}
% ---

% ---
% Imprime resumo e abstract
% ---
\renewcommand{\abstracttextfont}{\normalfont\normalsize}
\AtBeginDocument{
  \setlength{\absparindent}{0pt}
  \setlength{\absleftindent}{0cm}
  \setlength{\absrightindent}{0cm}
}
\setlength{\absparsep}{\parsep}
\ifUNBTEXisarticle
  \setlength{\abstitleskip}{-0.5\baselineskip}
\else
  \setlength{\abstitleskip}{\baselineskip}
\fi
\newcommand{\storedResumo}{}
\newcommand{\storedAbstract}{}
\NewEnviron{Resumo}{\global\expandafter
\def\expandafter\storedResumo\expandafter{\BODY}}
\NewEnviron{Abstract}{\global\expandafter
\def\expandafter\storedAbstract\expandafter{\BODY}}
% Imprime resumo
\newcommand{\imprimirresumo}{%
\begin{resumo}[Resumo]
  \begin{otherlanguage*}{brazilian}
    \storedResumo\par
    \vspace{\onelineskip}
    {\sffamily\bfseries Palavras-chave:}\space\printpchaveresumo.
  \end{otherlanguage*}
\end{resumo}
}
% Imprime abstract
\newcommand{\imprimirabstract}{%
\begin{resumo}[Abstract]
  \begin{otherlanguage*}{english}
    \storedAbstract\par
    \vspace{\onelineskip}
    {\sffamily\bfseries Keywords:}\space\printkwordresumo.
  \end{otherlanguage*}
\end{resumo}
}
% Insere resumo e abstract
\newcommand{\imprimirresumos}{%
\ifbrazilian
  \imprimirresumo
  \imprimirabstract
\else
  \imprimirabstract
  \imprimirresumo
\fi
}
\newenvironment{resumo}[1][\resumoname]{%
  \PRIVATEbookmarkthis{#1}
  \renewcommand{\abstractnamefont}{\chaptitlefont}
  \renewcommand{\abstractname}{\UNBTEXchapterupperifneeded{#1}}
  \begin{abstract}
 }{\end{abstract}\PRIVATEclearpageifneeded}
\newenvironment{resumoumacoluna}[1][\resumoname]{%
  \PRIVATEbookmarkthis{#1}
  \renewcommand{\abstractnamefont}{\chaptitlefont}
  \renewcommand{\abstractname}{\UNBTEXchapterupperifneeded{#1}}
  \begin{onecolabstract}
 }{\end{onecolabstract}\PRIVATEclearpageifneeded}
% ---

% ---
% Imprime lista de figuras
% ---
\newcommand{\imprimirlistadefiguras}{%
  \pdfbookmark[0]{\listfigurename}{lof}
  \listoffigures*
  \PRIVATEclearpageifneeded
}
% ---

% ---
% Imprime lista de quadros
% ---
\newcommand{\imprimirlistadequadros}{%
  \pdfbookmark[0]{\listquadroname}{loq}
  \listofquadros*
  \PRIVATEclearpageifneeded
}
% ---

% ---
% Imprime lista de tabelas
% ---
\newcommand{\imprimirlistadetabelas}{%
  \pdfbookmark[0]{\listtablename}{lot}
  \listoftables*
  \PRIVATEclearpageifneeded
}
% ---

% ---
% Imprime lista de algoritmos
% ---
\newcommand{\imprimirlistadealgoritmos}{%
  \pdfbookmark[0]{\listalgorithmcfname}{loa}
  \listofalgorithms
  \PRIVATEclearpageifneeded
}
% ---

% ---
% Imprime lista de códigos
% ---
\newcommand{\imprimirlistadecodigos}{%
  \pdfbookmark[0]{\lstlistlistingname}{lol}
  \begin{KeepFromToc} % Não inclui a lista de códigos no sumário
    \lstlistoflistings
  \end{KeepFromToc}
\PRIVATEclearpageifneeded
}
% ---

% ---
% Imprime lista de abreviaturas e siglas e lista de símbolos
% ---
\newcommand{\imprimirlistadesiglasesimbolos}{%
  \ifhasabbrlist
    \renewcommand{\nomname}{\listadesiglasname}%
  \else
    \renewcommand{\nomname}{\listadesimbolosname}%
  \fi
  \PRIVATEbookmarkthis{\nomname}%
  \printnomenclature
  \PRIVATEclearpageifneeded
}
% Lista de abreviaturas e siglas (da classe memoir)
\newenvironment{siglas}
  {\pretextualchapter{\listadesiglasname}\begin{symbols}}
  {\end{symbols}\PRIVATEclearpageifneeded}
% Lista de simbolos
\newenvironment{simbolos}
  {\pretextualchapter{\listadesimbolosname}\begin{symbols}}
  {\end{symbols}\PRIVATEclearpageifneeded}
% ---

% ---
% Imprime sumário
% ---
\newcommand{\imprimirsumario}{%
  \pdfbookmark[0]{\contentsname}{toc}
  \tableofcontents*
  \PRIVATEclearpageifneeded
}
% ---

% ---
% Define o tamanho da fonte tipográfica do título
% ---
\newbox\testbox
\newdimen\testblskip
\newcommand*{\testlines}[1]{%
  \setbox\testbox\hbox to\textwidth{\vbox{\centering\testfontsize #1\global\testblskip\baselineskip\par}}%
}
% \autotitle{número de linhas}{texto do título}
\newcommand*{\autotitle}[2][]{%
  \let\testfontsize\huge\sffamily\testlines{#2}% \huge
  \ifdim\ht\testbox>#1\testblskip
    \let\testfontsize\LARGE\sffamily\testlines{#2}% \LARGE
    \ifdim\ht\testbox>#1\testblskip
      \let\testfontsize\Large\sffamily\testlines{#2}% \Large
      \ifdim\ht\testbox>#1\testblskip
        \let\testfontsize\large\sffamily\testlines{#2}% \large
        \ifdim\ht\testbox>#1\testblskip
          \newcommand{\decvspace}{}
        \fi
      \fi
    \fi
  \fi
  \newcommand{\titleformat}{\testfontsize}
}
% ---