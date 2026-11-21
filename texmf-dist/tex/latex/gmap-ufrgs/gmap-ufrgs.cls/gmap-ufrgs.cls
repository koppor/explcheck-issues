%%
%% This is file `gmap-ufrgs.cls',
%% a LaTeX class for technical reports of GMAp/UFRGS (ABNT).
%%
%% Copyright (C) 2026 Boris N. Rojo Tanzi and GMAp/UFRGS
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Boris N. Rojo Tanzi.
%%
%% This work consists of the files gmap-ufrgs.cls, gmap-math.sty,
%% gmap-codigo.sty, doc/gmap-ufrgs-doc.tex and example/exemplo-minimo.tex.
%% The institutional logos gmap-logo-ufrgs.png and gmap-logo-gmap.pdf are
%% distributed together with this work, but are NOT part of it and are
%% NOT covered by the LPPL: they are trademarks of UFRGS and GMAp (see README).
%%
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{gmap-ufrgs}[2026/11/13 v0.0 Relatorios tecnicos GMAp/UFRGS (ABNT ou perfil classico)]

%---------------------------------------------------------------------
% Pacotes minimos necessarios antes das opcoes
%---------------------------------------------------------------------
\RequirePackage{etoolbox}
\RequirePackage{iftex}

%---------------------------------------------------------------------
% Opcoes
%---------------------------------------------------------------------
\newif\ifgmap@english    \gmap@englishfalse
\newif\ifgmap@nota       \gmap@notafalse
\newif\ifgmap@carta      \gmap@cartafalse
\newif\ifgmap@conf       \gmap@conffalse
\newif\ifgmap@prelim     \gmap@prelimfalse
\newif\ifgmap@sans       \gmap@sansfalse
\newif\ifgmap@warned     \gmap@warnedfalse
\newif\ifgmap@classico   \gmap@classicofalse

\DeclareOption{relatorio}{\gmap@notafalse\gmap@cartafalse}
% Perfil de formatacao: abnt (padrao) ou classico (formato anterior do
% GMAp: Latin Modern Sans, margens de 2 cm, espaco simples, citacao
% numerica, legenda abaixo da figura, revisao na capa, data dd/mm/aaaa)
\DeclareOption{abnt}{\gmap@classicofalse}
\DeclareOption{classico}{\gmap@classicotrue}
% nome antigo do perfil classico (uso interno antes da publicacao),
% mantido por compatibilidade
\DeclareOption{petrobras}{\gmap@classicotrue}
\DeclareOption{notatecnica}{\gmap@notatrue\gmap@cartafalse}
\DeclareOption{carta}{\gmap@cartatrue\gmap@notafalse}
\DeclareOption{english}{\gmap@englishtrue}
\DeclareOption{brazil}{\gmap@englishfalse}
\DeclareOption{confidencial}{\gmap@conftrue}
\DeclareOption{preliminar}{\gmap@prelimtrue}
\DeclareOption{sans}{\gmap@sanstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions\relax

%---------------------------------------------------------------------
% Classe base: abntex2 (memoir). Portugues e' o idioma principal; com a
% opcao english, o idioma ativo passa a ser o ingles no inicio do documento.
%---------------------------------------------------------------------
\PassOptionsToPackage{english}{babel}
\LoadClass[12pt,a4paper,oneside,openany,sumario=tradicional]{abntex2}
\ifgmap@english
  \AtBeginDocument{\selectlanguage{english}}
\fi
% valores padrao para metadados nao informados (evita erro em \imprimir*)
\providecommand\thetitle{}
\providecommand\theauthor{}
\providecommand\thedate{\today}

%---------------------------------------------------------------------
% Perfil classico: espaco simples, data dd/mm/aaaa e legendas como no
% formato anterior (Figura 1: Texto, em negrito e tamanho reduzido)
%---------------------------------------------------------------------
\ifgmap@classico
  \SingleSpacing
  % \today = 10/11/2026 (babel redefine \today ao trocar de idioma)
  \newcommand\gmap@hojenum{\two@digits{\day}/\two@digits{\month}/\number\year}
  \addto\datebrazil{\let\today\gmap@hojenum}
  \addto\dateenglish{\let\today\gmap@hojenum}
  \let\today\gmap@hojenum
  \captionnamefont{\footnotesize\bfseries}
  \captiontitlefont{\footnotesize\bfseries}
  \AtBeginDocument{\captiondelim{:~}}
\fi

%---------------------------------------------------------------------
% Pacotes
%---------------------------------------------------------------------
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage{lmodern}
\fi
% classico: documento inteiro em Latin Modern Sans (como no formato
% anterior); codigo em Latin Modern Typewriter, matematica em LM Math.
% (lmss existe nas codificacoes T1 e TU: vale para pdfLaTeX, LuaLaTeX e XeLaTeX)
\ifgmap@classico\renewcommand{\rmdefault}{lmss}\fi
\RequirePackage{graphicx}
% Pastas onde \includegraphics e \figura procuram as imagens
\graphicspath{{fig/}{figuras/}}
\RequirePackage[table]{xcolor}
\RequirePackage{microtype}
\RequirePackage{indentfirst}
\RequirePackage{amsmath,amssymb}
\RequirePackage{booktabs,tabularx,multirow,longtable}
\RequirePackage{float}
\RequirePackage{xspace}
\ifgmap@classico
  \RequirePackage[num,abnt-etal-cite=2,abnt-etal-list=2]{abntex2cite}
  \citebrackets[]% citacao [1], como no formato anterior
  % \fonte sem o negrito das legendas
  \pretocmd{\fonte}{\captionnamefont{\footnotesize}\captiontitlefont{\footnotesize}}{}{}
\else
  \RequirePackage[alf,abnt-etal-cite=2,abnt-etal-list=2]{abntex2cite}
\fi
\ifgmap@sans \renewcommand{\familydefault}{\sfdefault}\fi

\definecolor{gmapazul}{RGB}{0,35,102}
\definecolor{gmapcinza}{gray}{0.90}

%---------------------------------------------------------------------
% Textos fixos por idioma
%---------------------------------------------------------------------
\addto\captionsbrazil{%
  \def\gmap@tipodocname{Relat\'orio T\'ecnico}%
  \def\gmap@documentoname{Documento}%
  \def\gmap@revisaoname{Revis\~ao}%
  \def\gmap@dataname{Data}%
  \def\gmap@elabname{Elaborado}%
  \def\gmap@verifname{Verificado}%
  \def\gmap@aprovname{Aprovado}%
  \def\gmap@controlename{Folha de controle}%
  \def\gmap@equipename{Equipe}%
  \def\gmap@gerencianame{Ger\^encia t\'ecnica}%
  \def\gmap@instname{GMAp -- Grupo de Mec\^anica Aplicada}%
  \def\gmap@univname{UFRGS -- Universidade Federal do Rio Grande do Sul}%
  \def\gmap@assuntoname{Assunto}%
  \def\gmap@acname{A/C}%
  \def\gmap@atenciosamentename{Atenciosamente,}%
  \def\gmap@prelimname{PRELIMINAR}%
  \def\gmap@confname{ATEN\c{C}\~AO: \textbf{Este \'e um documento confidencial}.
    A utiliza\c{c}\~ao, interpreta\c{c}\~ao e homologa\c{c}\~ao dos dados aqui
    contidos \'e de inteira responsabilidade do solicitante. O Grupo de Mec\^anica
    Aplicada -- GMAp/UFRGS n\~ao se responsabiliza pelas consequ\^encias diretas ou
    indiretas resultantes do uso ou interpreta\c{c}\~ao inadequados das informa\c{c}\~oes
    aqui contidas, ou de aspectos que n\~ao estejam explicitamente referenciados
    no texto. Este trabalho n\~ao pode ser reproduzido sem autoriza\c{c}\~ao do GMAp
    ou do solicitante. Os direitos autorais do texto s\~ao reservados \`as partes e
    nenhuma parte deste documento pode ser utilizada para fins de divulga\c{c}\~ao
    p\'ublica sem pr\'evia autoriza\c{c}\~ao.}%
}
\addto\captionsenglish{\renewcommand{\bibname}{References}}
\addto\captionsenglish{%
  \def\gmap@tipodocname{Technical Report}%
  \def\gmap@documentoname{Document}%
  \def\gmap@revisaoname{Revision}%
  \def\gmap@dataname{Date}%
  \def\gmap@elabname{Prepared by}%
  \def\gmap@verifname{Checked by}%
  \def\gmap@aprovname{Approved by}%
  \def\gmap@controlename{Control sheet}%
  \def\gmap@equipename{Team}%
  \def\gmap@gerencianame{Technical management}%
  \def\gmap@instname{GMAp -- Applied Mechanics Group}%
  \def\gmap@univname{UFRGS -- Federal University of Rio Grande do Sul}%
  \def\gmap@assuntoname{Subject}%
  \def\gmap@acname{Attn.}%
  \def\gmap@atenciosamentename{Sincerely,}%
  \def\gmap@prelimname{PRELIMINARY}%
  \def\gmap@confname{NOTICE: \textbf{This is a confidential document}.
    The use, interpretation and homologation of the data herein is the sole
    responsibility of the requester. The Applied Mechanics Group -- GMAp/UFRGS
    is not liable for any direct or indirect consequences resulting from the
    improper use or interpretation of the information contained herein, or of
    aspects not explicitly referenced in the text. This work may not be
    reproduced without authorization from GMAp or the requester. Copyright of
    the text is reserved to the parties and no part of this document may be
    used for public disclosure without prior authorization.}%
}

%---------------------------------------------------------------------
% Metadados do documento
% (\titulo, \autor, \data, \local, \instituicao vem do abntex2)
%---------------------------------------------------------------------
\newcommand\gmap@projeto{}
\newcommand\gmap@tipodoc{}
\newcommand\gmap@numerodoc{}
\newcommand\gmap@revisao{}
\newcommand\gmap@subtitulo{}
\newcommand\gmap@equipe{}
\newcommand\gmap@codigos{}
\newcommand\gmap@gerencia{}
\newcommand\gmap@rodape{}
\newcommand\gmap@destinatario{}
\newcommand\gmap@aoscuidados{}
\newcommand\gmap@assunto{}
\newcommand\gmap@enderecoinst{%
  Rua Sarmento Leite, 425 | Centro Hist\'orico | 90040-001 | Porto Alegre -- RS}
\newcommand\gmap@autornames{}

\newcommand\projeto[1]{\gdef\gmap@projeto{#1}}
\newcommand\tipodoc[1]{\gdef\gmap@tipodoc{#1}}
\newcommand\numerodoc[1]{\gdef\gmap@numerodoc{#1}}
\newcommand\revisao[1]{\gdef\gmap@revisao{#1}}
\newcommand\subtitulo[1]{\gdef\gmap@subtitulo{#1}}
\newcommand\equipe[1]{\gdef\gmap@equipe{#1}}
\newcommand\codigosprojeto[1]{\gdef\gmap@codigos{#1}}
\newcommand\gerenciatecnica[1]{\gdef\gmap@gerencia{#1}}
\newcommand\rodapeprojeto[1]{\gdef\gmap@rodape{#1}}
\newcommand\gmapendereco[1]{\gdef\gmap@enderecoinst{#1}}
\newcommand\destinatario[1]{\gdef\gmap@destinatario{#1}}
\newcommand\aoscuidados[1]{\gdef\gmap@aoscuidados{#1}}
\newcommand\assunto[1]{\gdef\gmap@assunto{#1}}

% Logos (arquivos instalados junto com a classe; podem ser trocados)
\newcommand\gmap@logoesq{gmap-logo-ufrgs.png}
\newcommand\gmap@logodir{gmap-logo-gmap.pdf}
\newcommand\gmap@logotopoesq{gmap-logo-ufrgs.png}
\newcommand\logoesquerda[1]{\gdef\gmap@logoesq{#1}}
\newcommand\logodireita[1]{\gdef\gmap@logodir{#1}}
\newcommand\logotopoesquerda[1]{\gdef\gmap@logotopoesq{#1}}

% Imprime logo se existir; senao avisa uma vez e deixa espaco vazio
\newcommand\gmap@logo[2]{%
  \ifdefempty{#1}{}{%
    \IfFileExists{#1}{\includegraphics[#2]{#1}}{%
      \ifgmap@warned\else
        \global\gmap@warnedtrue
        \PackageWarningNoLine{gmap-ufrgs}{Logo not found (ignored): #1.\MessageBreak
          See section "Logos" of the manual}%
      \fi}}}

% Pessoas: autores (N), verificador e aprovador
\newcounter{gmap@naut}
\newcounter{gmap@i}
\newcommand\addautor[4][]{%
  \stepcounter{gmap@naut}%
  \csgdef{gmap@a@nome@\arabic{gmap@naut}}{#2}%
  \csgdef{gmap@a@tit@\arabic{gmap@naut}}{#3}%
  \csgdef{gmap@a@reg@\arabic{gmap@naut}}{#4}%
  \csgdef{gmap@a@img@\arabic{gmap@naut}}{#1}%
  \ifnum\value{gmap@naut}>1 \gappto\gmap@autornames{, }\fi
  \gappto\gmap@autornames{#2}%
  \author{\gmap@autornames}}
\newcommand\verificador[4][]{%
  \csgdef{gmap@v@nome}{#2}\csgdef{gmap@v@tit}{#3}\csgdef{gmap@v@reg}{#4}\csgdef{gmap@v@img}{#1}}
\newcommand\aprovador[4][]{%
  \csgdef{gmap@p@nome}{#2}\csgdef{gmap@p@tit}{#3}\csgdef{gmap@p@reg}{#4}\csgdef{gmap@p@img}{#1}}

%---------------------------------------------------------------------
% Fontes de titulos (estilo de capitulo do abntex2 e' mantido: sem
% espaco superior, ANEXO A -- Titulo igual no sumario e no titulo)
%---------------------------------------------------------------------
\renewcommand{\ABNTEXchapterfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\Large}
\renewcommand{\ABNTEXsectionfontsize}{\large}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}

%---------------------------------------------------------------------
% Cabecalho e rodape (memoir)
%---------------------------------------------------------------------
% Margens verticais: o cabecalho comeca a 2 cm do topo da pagina e o
% rodape termina a 2 cm da borda inferior (margens superior = inferior).
\newlength{\gmap@margemvert}\setlength{\gmap@margemvert}{2cm}
\newlength{\gmap@headh}\setlength{\gmap@headh}{48pt}
\newlength{\gmap@headsep}\setlength{\gmap@headsep}{18pt}
\newlength{\gmap@footh}\setlength{\gmap@footh}{32pt}
\newlength{\gmap@upper}
\setlength{\gmap@upper}{\gmap@margemvert}
\addtolength{\gmap@upper}{\gmap@headh}
\addtolength{\gmap@upper}{\gmap@headsep}
\newlength{\gmap@lower}
\setlength{\gmap@lower}{\gmap@margemvert}
\addtolength{\gmap@lower}{\gmap@footh}
\setulmarginsandblock{\gmap@upper}{\gmap@lower}{*}
% classico: margens laterais de 2 cm (largura de texto de 17 cm em A4)
\ifgmap@classico\setlrmarginsandblock{2cm}{2cm}{*}\fi
\setheadfoot{\gmap@headh}{\gmap@footh}
\setlength{\headdrop}{\gmap@margemvert}
\setlength{\headsep}{\gmap@headsep}
\checkandfixthelayout[fixed]

\makepagestyle{gmap}
\makeoddhead{gmap}%
  {\gmap@logo{\gmap@logotopoesq}{height=1.5cm}}%
  {\ifgmap@prelim\textcolor{red}{\sffamily\bfseries\gmap@prelimname}\fi}%
  {\gmap@logo{\gmap@logodir}{height=1.1cm}}
\makeoddfoot{gmap}%
  {\ifgmap@prelim\textcolor{red}{\scriptsize\sffamily\gmap@prelimname}\fi}%
  {}%
  {\scriptsize\sffamily\gmap@rodapetexto\thepage}

% Texto do rodape: \rodapeprojeto; no perfil classico, se nao for dado,
% usa o nome do projeto em maiusculas (nada fica escrito na classe)
\newcommand\gmap@rodapetexto{%
  \ifdefempty{\gmap@rodape}%
    {\ifgmap@classico
       \ifdefempty{\gmap@projeto}{}{\MakeUppercase{\gmap@projeto}\ \textendash\ }%
     \fi}%
    {\gmap@rodape\ \textendash\ }}

\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{gmap}%
  \pagestyle{gmap}%
  \aliaspagestyle{cleared}{empty}%
  \aliaspagestyle{part}{gmap}}
\renewcommand{\textual}{%
  \pagestyle{gmap}%
  \aliaspagestyle{chapter}{gmap}%
  \nouppercaseheads
  \bookmarksetup{startatroot}}

%---------------------------------------------------------------------
% Hyperref (carregado pelo abntex2)
%---------------------------------------------------------------------
\hypersetup{colorlinks=true, linkcolor=black, citecolor=black,
  urlcolor=blue!50!black, pdfborder={0 0 0}}
\AtBeginDocument{%
  \hypersetup{pdftitle={\thetitle}, pdfauthor={\theauthor}}}
% Figuras e tabelas tem numeracao continua (abntex2); ancoras unicas para o hyperref
\renewcommand{\theHfigure}{\arabic{figure}}
\renewcommand{\theHtable}{\arabic{table}}

%---------------------------------------------------------------------
% Aviso de confidencialidade
%---------------------------------------------------------------------
\newcommand\confidencial{%
  \par\vspace{\baselineskip}\noindent
  {\setlength{\fboxsep}{10pt}\setlength{\fboxrule}{0.6pt}%
   \fcolorbox{black}{gmapcinza}{\parbox{\dimexpr\linewidth-2\fboxsep-2\fboxrule}{%
    \footnotesize\sffamily\gmap@confname}}}\par}

%---------------------------------------------------------------------
% Capa
%---------------------------------------------------------------------
\newcommand\gmap@tipodoctext{%
  \ifdefempty{\gmap@tipodoc}{\gmap@tipodocname}{\gmap@tipodoc}%
  \ifdefempty{\gmap@numerodoc}{}{\ \gmap@numerodoc}}
\newcommand\gmap@localdata{%
  \ifdefempty{\imprimirlocal}{}{\imprimirlocal, }\imprimirdata}

\newcommand\gmap@capa@relatorio{%
  \begin{capa}\begin{SingleSpacing}\sffamily
    \thispagestyle{empty}%
    \noindent\gmap@logo{\gmap@logoesq}{width=3.5cm}\hfill\gmap@logo{\gmap@logodir}{width=3.5cm}\par
    \vfill
    \begin{center}
      {\color{gmapazul}\rule{\linewidth}{0.8pt}\par\vspace{1ex}%
       {\large\bfseries\gmap@projeto\par}\vspace{1ex}\rule{\linewidth}{0.8pt}\par}
      \vspace{1.5cm}
      {\large\bfseries\gmap@tipodoctext\par}
      \vspace{3mm}
      {\LARGE\bfseries\imprimirtitulo\par}
      \ifdefempty{\gmap@subtitulo}{}{\vspace{2mm}{\large\gmap@subtitulo\par}}
      \vspace{1cm}
      {\large\gmap@localdata\par}
    \end{center}
    \vfill
    \ifdefempty{\gmap@equipe}{}{%
      \begin{flushright}\begin{minipage}{0.62\linewidth}\raggedright
        \gmap@equipe\par
        \ifdefempty{\gmap@codigos}{}{\medskip\gmap@codigos\par}
      \end{minipage}\end{flushright}}
    \vfill
    \begin{center}\footnotesize\color{gray}
      \gmap@instname\\ \gmap@univname\\ {\scriptsize\gmap@enderecoinst}
    \end{center}
  \end{SingleSpacing}\end{capa}}

% Perfil classico: capa do formato anterior (projeto entre filetes,
% tipo + numero, revisao, titulo, data; equipe deslocada a direita)
\newcommand\gmap@capa@classico{%
  \begin{capa}\begin{SingleSpacing}\sffamily
    \thispagestyle{empty}%
    \noindent\gmap@logo{\gmap@logoesq}{width=3.5cm}\hfill\gmap@logo{\gmap@logodir}{width=3.5cm}\par
    \vfill
    \begin{center}
      {\color{gmapazul}\rule{\linewidth}{0.8pt}\par\vspace{2ex}%
       {\large\bfseries\gmap@projeto\par}\vspace{2ex}\rule{\linewidth}{0.8pt}\par}
      \vspace{1cm}
      {\large\bfseries\gmap@tipodoctext\par}
      \ifdefempty{\gmap@revisao}{}{\vspace{1mm}{\large\gmap@revisaoname\ \gmap@revisao\par}}
      \vspace{3mm}
      {\large\bfseries\imprimirtitulo\par}
      \ifdefempty{\gmap@subtitulo}{}{\vspace{2mm}{\large\gmap@subtitulo\par}}
      \vspace{1cm}
      {\large\gmap@localdata\par}
    \end{center}
    \vspace{1.25cm}
    \ifboolexpr{test {\ifdefempty{\gmap@equipe}} and test {\ifdefempty{\gmap@codigos}}
                and test {\ifdefempty{\gmap@gerencia}}}{}{%
      \noindent\hspace*{6.5cm}\begin{minipage}[t]{\dimexpr\linewidth-6.5cm}\raggedright
        \ifdefempty{\gmap@equipe}{}{\gmap@equipe\par}
        \ifdefempty{\gmap@codigos}{}{\medskip\gmap@codigos\par}
        \ifdefempty{\gmap@gerencia}{}{\medskip\gmap@gerencianame: \gmap@gerencia\par}
      \end{minipage}\par}
    \vfill
    \begin{center}\footnotesize\color{gray}
      \gmap@instname\\ \gmap@univname\\ {\scriptsize\gmap@enderecoinst}
    \end{center}
  \end{SingleSpacing}\end{capa}}

% Nota tecnica: bloco de titulo compacto, sem pagina propria
\newcommand\gmap@capa@nota{%
  \begin{SingleSpacing}\sffamily
  \noindent{\color{gmapazul}\rule{\linewidth}{0.8pt}}\par
  \begin{center}
    {\large\bfseries\gmap@tipodoctext\par}
    {\Large\bfseries\imprimirtitulo\par}
    \ifdefempty{\gmap@subtitulo}{}{{\large\gmap@subtitulo\par}}
    \vspace{2mm}{\small\theauthor\ \textendash\ \gmap@localdata\par}
  \end{center}
  {\color{gmapazul}\rule{\linewidth}{0.8pt}}\par\vspace{4mm}
  \end{SingleSpacing}}

% Carta: papel timbrado + cabecalho
\newcommand\gmap@capa@carta{%
  \begin{SingleSpacing}\sffamily
  \noindent{\color{gmapazul}\rule{\linewidth}{0.8pt}}\par\vspace{1cm}
  \begin{flushright}\gmap@localdata\end{flushright}
  \ifdefempty{\gmap@numerodoc}{}{\noindent\textbf{\gmap@numerodoc}\par\medskip}
  \ifdefempty{\gmap@destinatario}{}{\noindent\gmap@destinatario\par\medskip}
  \ifdefempty{\gmap@aoscuidados}{}{\noindent\textbf{\gmap@acname} \gmap@aoscuidados\par\medskip}
  \ifdefempty{\gmap@assunto}{}{\noindent\textbf{\gmap@assuntoname:} \gmap@assunto\par}
  \vspace{1cm}
  \end{SingleSpacing}}

\renewcommand\imprimircapa{%
  \ifgmap@carta\gmap@capa@carta
  \else\ifgmap@nota\gmap@capa@nota
  \else\ifgmap@classico\gmap@capa@classico
  \else\gmap@capa@relatorio\fi\fi\fi}

% Fecho da carta
\newcommand\fecharcarta[2]{%
  \par\vspace{\baselineskip}\noindent\gmap@atenciosamentename\par
  \vspace{1.8cm}\noindent\rule{6cm}{0.4pt}\par
  \noindent #1\par\noindent #2\par}

%---------------------------------------------------------------------
% Folha de controle: documento, revisao, assinaturas, aviso
%---------------------------------------------------------------------
\newcommand\gmap@pessoa[5]{%
  \xdef\gmap@pt{#3}\xdef\gmap@pr{#4}\xdef\gmap@pi{#5}%
  \textbf{#1} &
  \begin{tabular}[t]{@{}l@{}}#2\ifdefempty{\gmap@pt}{}{\\\gmap@pt}\ifdefempty{\gmap@pr}{}{\\\gmap@pr}\end{tabular} &
  \ifdefempty{\gmap@pi}{\rule{0pt}{1.2cm}\rule{5.5cm}{0.4pt}}{\includegraphics[height=1.2cm]{\gmap@pi}}\\
  \midrule}

\newcommand\gmap@blocoassinaturas{%
  \noindent\begin{tabular}{@{}p{2.6cm}p{6cm}p{6.5cm}@{}}
  \toprule
  \setcounter{gmap@i}{0}%
  \whiledo{\value{gmap@i}<\value{gmap@naut}}{%
    \stepcounter{gmap@i}%
    \gmap@pessoa{\ifnum\value{gmap@i}=1 \gmap@elabname\fi}%
      {\csuse{gmap@a@nome@\arabic{gmap@i}}}{\csuse{gmap@a@tit@\arabic{gmap@i}}}%
      {\csuse{gmap@a@reg@\arabic{gmap@i}}}{\csuse{gmap@a@img@\arabic{gmap@i}}}}%
  \ifcsdef{gmap@v@nome}{\gmap@pessoa{\gmap@verifname}{\csuse{gmap@v@nome}}%
    {\csuse{gmap@v@tit}}{\csuse{gmap@v@reg}}{\csuse{gmap@v@img}}}{}%
  \ifcsdef{gmap@p@nome}{\gmap@pessoa{\gmap@aprovname}{\csuse{gmap@p@nome}}%
    {\csuse{gmap@p@tit}}{\csuse{gmap@p@reg}}{\csuse{gmap@p@img}}}{}%
  \end{tabular}\par}

\newcommand\imprimirfolhadecontrole{%
  \clearpage
  \PRIVATEbookmarkthis{\gmap@controlename}%
  \begin{SingleSpacing}\sffamily
  \begin{center}{\Large\bfseries\gmap@controlename}\end{center}
  \noindent\begin{tabularx}{\linewidth}{@{}lX@{}}
    \textbf{\gmap@documentoname:} & \gmap@tipodoctext \\
    \ifdefempty{\gmap@revisao}{}{\textbf{\gmap@revisaoname:} & \gmap@revisao \\}
    \textbf{\gmap@dataname:} & \imprimirdata \\
  \end{tabularx}
  \vspace{1cm}
  \gmap@blocoassinaturas
  \ifgmap@conf\vfill\confidencial\fi
  \end{SingleSpacing}
  \clearpage}

%---------------------------------------------------------------------
% Listas e tabelas auxiliares
%---------------------------------------------------------------------
\RequirePackage{enumitem}
\newlist{listalfa}{enumerate}{1}
\setlist[listalfa]{label=(\alph*),leftmargin=1.5cm,itemsep=0pt}
\newlist{listtraco}{itemize}{1}
\setlist[listtraco]{label=--,leftmargin=1cm,itemsep=0pt,topsep=0pt,parsep=0pt}
\newlist{checklist}{itemize}{1}
\setlist[checklist]{label={$\square$},leftmargin=1cm}
\newcommand\cinza{\cellcolor{gmapcinza}}
\newcommand\linhacinza{\rowcolor{gmapcinza}}

%---------------------------------------------------------------------
% Figuras automaticas
%   \figura[chaves]{arquivo}{legenda}    figura flutuante (padrao htbp)
%   \figura*[chaves]{arquivo}{legenda}   figura exatamente aqui ([H])
% - escala 1 (tamanho original); so e' reduzida, com aviso, se nao couber
%   na area de texto;
% - rotulo automatico fig:<nome do arquivo sem pasta e extensao>;
% - ABNT: legenda acima e fonte abaixo; classico: legenda abaixo;
% - chaves: fonte={...}, rotulo=fig:x, pos=htb, escala=0.8, largura=.5\linewidth
%   e qualquer chave do \includegraphics (angle=90, trim=..., page=2, ...);
% - tamanho: tamanho=0.6 (ou so [0.6]) = 60% da largura do texto.
% \posicaofiguras{H} muda a posicao padrao de todas as figuras.
% \tamanhofiguras{0.8} faz toda figura sem tamanho proprio ocupar 80% da
%   largura do texto; \tamanhofiguras{} volta a escala 1.
%---------------------------------------------------------------------
\ExplSyntaxOn
\tl_new:N   \l__gmap_fig_gopts_tl
\tl_new:N   \l__gmap_fig_fonte_tl
\tl_new:N   \l__gmap_fig_rotulo_tl
\tl_new:N   \l__gmap_fig_pos_tl
\tl_new:N   \g__gmap_fig_posdefault_tl
\tl_gset:Nn \g__gmap_fig_posdefault_tl { htbp }
\tl_new:N   \g__gmap_fig_tamdefault_tl
\bool_new:N \l__gmap_fig_tamanho_bool
\regex_const:Nn \c__gmap_fig_numero_regex { \A \d* \.? \d+ \Z }
\box_new:N  \l__gmap_fig_box
\clist_const:Nn \c__gmap_fig_tamanhos_clist { width, height, totalheight, scale }

\msg_new:nnn { gmap-ufrgs } { figura-grande }
  { Figura~'#1'~maior~que~a~area~de~texto~em~escala~1;~reduzida~para~caber. }

% acrescenta uma chave ao \includegraphics e anota se ela define o tamanho
\cs_new_protected:Npn \__gmap_fig_add:nn #1#2
  {
    \clist_map_inline:Nn \c__gmap_fig_tamanhos_clist
      { \str_if_eq:nnT {##1} {#1} { \bool_set_true:N \l__gmap_fig_tamanho_bool } }
    \tl_if_blank:nTF {#2}
      { \tl_put_right:Nn \l__gmap_fig_gopts_tl { , #1 } }
      { \tl_put_right:Nn \l__gmap_fig_gopts_tl { , #1 = {#2} } }
  }
\cs_generate_variant:Nn \__gmap_fig_add:nn { V }

% largura como fracao da largura do texto: 0.6 -> width = 0.6\linewidth
\cs_new_protected:Npn \__gmap_fig_tamanho:n #1
  { \__gmap_fig_add:nn { width } { #1 \linewidth } }
\cs_generate_variant:Nn \__gmap_fig_tamanho:n { V }

\keys_define:nn { gmap/figura }
  {
    fonte   .tl_set:N = \l__gmap_fig_fonte_tl ,
    rotulo  .tl_set:N = \l__gmap_fig_rotulo_tl ,
    label   .tl_set:N = \l__gmap_fig_rotulo_tl ,
    pos     .tl_set:N = \l__gmap_fig_pos_tl ,
    escala  .code:n   = { \__gmap_fig_add:nn { scale } {#1} } ,
    largura .code:n   = { \__gmap_fig_add:nn { width } {#1} } ,
    altura  .code:n   = { \__gmap_fig_add:nn { height } {#1} } ,
    tamanho .code:n   = { \__gmap_fig_tamanho:n {#1} } ,
    % [0.6] sozinho (numero sem chave) = tamanho=0.6
    unknown .code:n   =
      {
        \tl_if_blank:nTF {#1}
          {
            \exp_args:NNV \regex_match:NnTF \c__gmap_fig_numero_regex
              \l_keys_key_str
              { \__gmap_fig_tamanho:V \l_keys_key_str }
              { \__gmap_fig_add:Vn \l_keys_key_str { } }
          }
          { \__gmap_fig_add:Vn \l_keys_key_str {#1} }
      } ,
  }

% imagem em escala 1; reduz so se passar da largura (ou de 85% da altura)
\cs_new_protected:Npn \__gmap_fig_imagem:n #1
  {
    \bool_if:NF \l__gmap_fig_tamanho_bool
      { \tl_put_left:Nn \l__gmap_fig_gopts_tl { scale = 1 } }
    \hbox_set:Nn \l__gmap_fig_box
      { \use:e { \exp_not:N \includegraphics [ \exp_not:V \l__gmap_fig_gopts_tl ] } {#1} }
    \bool_if:NF \l__gmap_fig_tamanho_bool
      {
        \dim_compare:nNnT { \box_wd:N \l__gmap_fig_box } > { \linewidth }
          {
            \msg_warning:nnn { gmap-ufrgs } { figura-grande } {#1}
            \box_resize_to_wd:Nn \l__gmap_fig_box { \linewidth }
          }
        \dim_compare:nNnT { \box_ht:N \l__gmap_fig_box } > { 0.85 \textheight }
          {
            \msg_warning:nnn { gmap-ufrgs } { figura-grande } {#1}
            \box_resize_to_ht:Nn \l__gmap_fig_box { 0.85 \textheight }
          }
      }
    \mode_leave_vertical:
    \box_use_drop:N \l__gmap_fig_box
    \par
  }

\cs_new_protected:Npn \__gmap_fig_legenda:n #1
  {
    \caption {#1}
    \exp_args:NV \label \l__gmap_fig_rotulo_tl
  }

\cs_new_protected:Npn \__gmap_fig_fonte:
  { \tl_if_empty:NF \l__gmap_fig_fonte_tl { \exp_args:NV \fonte \l__gmap_fig_fonte_tl } }

\NewDocumentCommand \figura { s O{} m m }
  {
    \group_begin:
    \tl_clear:N \l__gmap_fig_gopts_tl
    \tl_clear:N \l__gmap_fig_fonte_tl
    \tl_clear:N \l__gmap_fig_rotulo_tl
    \bool_set_false:N \l__gmap_fig_tamanho_bool
    \tl_set_eq:NN \l__gmap_fig_pos_tl \g__gmap_fig_posdefault_tl
    \keys_set:nn { gmap/figura } {#2}
    \bool_if:NF \l__gmap_fig_tamanho_bool
      {
        \tl_if_empty:NF \g__gmap_fig_tamdefault_tl
          { \__gmap_fig_tamanho:V \g__gmap_fig_tamdefault_tl }
      }
    \IfBooleanT {#1} { \tl_set:Nn \l__gmap_fig_pos_tl { H } }
    \tl_if_empty:NT \l__gmap_fig_rotulo_tl
      {
        \filename@parse {#3}
        \tl_set:Nx \l__gmap_fig_rotulo_tl { fig: \filename@base }
      }
    \use:e { \exp_not:N \begin {figure} [ \l__gmap_fig_pos_tl ] }
      \centering
      \legacy_if:nTF { gmap@classico }
        {
          \__gmap_fig_imagem:n {#3}
          \__gmap_fig_legenda:n {#4}
          \__gmap_fig_fonte:
        }
        {
          \__gmap_fig_legenda:n {#4}
          \__gmap_fig_imagem:n {#3}
          \__gmap_fig_fonte:
        }
    \end {figure}
    \group_end:
  }

\NewDocumentCommand \posicaofiguras { m }
  { \tl_gset:Nn \g__gmap_fig_posdefault_tl {#1} }
\NewDocumentCommand \tamanhofiguras { m }
  { \tl_gset:Nx \g__gmap_fig_tamdefault_tl { \tl_trim_spaces:n {#1} } }
\ExplSyntaxOff

%---------------------------------------------------------------------
% Nota tecnica: secoes como nivel superior
%---------------------------------------------------------------------
\ifgmap@nota
  \counterwithout{section}{chapter}
\fi

\endinput
