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
%% This work consists of all the files of the gmap-ufrgs repository
%% (https://github.com/GMAp-UFRGS/gmap-ufrgs), all under this same license.
%%
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{gmap-ufrgs}[2026/11/20 v0.1 Relatorios tecnicos GMAp/UFRGS (ABNT ou perfil classico)]

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
% Elementos pre-textuais automaticos (capa, sumario, listas) no
% \begin{document}: padrao no perfil classico, opcional no abnt
\newcommand\gmap@autoopt{}
\DeclareOption{pretextualautomatico}{\def\gmap@autoopt{1}}
\DeclareOption{pretextualmanual}{\def\gmap@autoopt{0}}
% Listas que nao devem sair (nem automaticas nem com \imprimir...)
\DeclareOption{semsiglas}{\csdef{gmap@sem@siglas}{}}
\DeclareOption{semsimbolos}{\csdef{gmap@sem@simbolos}{}}
\DeclareOption{semglossario}{\csdef{gmap@sem@glossario}{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions\relax
\newif\ifgmap@auto
\ifdefstring{\gmap@autoopt}{1}{\gmap@autotrue}{%
  \ifdefstring{\gmap@autoopt}{0}{}{\ifgmap@classico\gmap@autotrue\fi}}
% so no relatorio (a nota tecnica e a carta nao tem sumario)
\ifgmap@nota\gmap@autofalse\fi
\ifgmap@carta\gmap@autofalse\fi

%---------------------------------------------------------------------
% Classe base: abntex2 (memoir). Portugues e' o idioma principal; com a
% opcao english, o idioma ativo passa a ser o ingles no inicio do documento.
% chapter=TITLE: titulos de capitulo (inclusive \chapter* e pre-textuais)
% sempre em maiusculas.
%---------------------------------------------------------------------
\PassOptionsToPackage{english}{babel}
\LoadClass[12pt,a4paper,oneside,openany,sumario=tradicional,chapter=TITLE]{abntex2}
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
\fi
% legendas "Figura 1: Texto" (e nao "Figura 1 -- Texto") em todos os perfis,
% tambem nas listas de figuras e de tabelas
\AtBeginDocument{\captiondelim{:~}}
\renewcommand*{\cftfigureaftersnum}{:\hfill}
\renewcommand*{\cfttableaftersnum}{:\hfill}
% legendas sem palavras hifenizadas ("carrega-mento"). Acrescentado ao estilo
% de legenda do memoir no \begin{document}, para valer mesmo que o documento
% troque o \captionstyle no preambulo (ex.: \captionstyle{\centering}).
\newcommand\gmap@semhifen{\hyphenpenalty=\@M \exhyphenpenalty=\@M}
\AtBeginDocument{%
  \appto\@contcstyle{\gmap@semhifen}%
  \appto\@contcshortstyle{\gmap@semhifen}%
  \appto\@contsubcstyle{\gmap@semhifen}}

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
% PDFs incluidos (logos, figuras) nao levam para o documento final os seus
% metadados (titulo, nome do arquivo, numero da pagina): leitores de PDF
% nao mostram, p.ex., "logo_GMAp" ao passar sobre o logo ou nas propriedades
\ifdefined\pdfsuppressptexinfo \pdfsuppressptexinfo=14 \fi
% os dois logos tem "page group": aviso inofensivo do pdfTeX a cada pagina
\ifdefined\pdfsuppresswarningpagegroup \pdfsuppresswarningpagegroup=1 \fi
\ifLuaTeX\ifdefined\pdfvariable \pdfvariable suppressoptionalinfo 14 \fi\fi
% Pastas onde \includegraphics e \figura procuram as imagens
\graphicspath{{fig/}{figuras/}}
\RequirePackage[table]{xcolor}
\RequirePackage{microtype}
\RequirePackage{indentfirst}
\RequirePackage{amsmath,amssymb}
% Numeros e unidades (siunitx v3): virgula decimal e ponto (\cdot) na
% potencia de 10 (1,5\cdot10^{3}); incerteza separada (1,5 \pm 0,1).
% Na opcao english, ponto decimal. Equivale as chaves antigas (v1)
% decimalsymbol=comma, expproduct=., seperr.
% No texto, numeros e unidades saem na fonte do texto (sem serifa no
% perfil classico e na opcao sans), seguindo negrito/italico ao redor;
% dentro de $...$ continuam na fonte matematica.
\RequirePackage{siunitx}
\sisetup{
  exponent-product     = \cdot,
  separate-uncertainty = true,
  mode                 = match,
  reset-text-family    = false,
  reset-text-series    = false,
  reset-text-shape     = false,
}
\ifgmap@english
  \sisetup{output-decimal-marker = {.}}
\else
  % Listas e faixas em portugues: \qtylist{1;2;3}{\m} -> 1 m, 2 m e 3 m
  \sisetup{
    output-decimal-marker = {,},
    list-final-separator  = {\text{ e }},
    list-pair-separator   = {\text{ e }},
    range-phrase          = {\text{ a }},
  }
\fi
% Polegada: \qty{5.5}{\inch} -> 5,5 in; \qty{9}{\pol} -> 9" (aspas
% coladas ao numero, sem espaco); \unit{\polegada} -> pol (cabecalho de
% tabela, onde as aspas sozinhas confundem)
\DeclareSIUnit\inch{in}
\DeclareSIUnit[quantity-product = {}]\pol{\mbox{\textquotedbl}}
\DeclareSIUnit\polegada{pol}
\RequirePackage{booktabs,tabularx,multirow,longtable}
\RequirePackage{float}
\RequirePackage{xspace}
% o abntex2cite traz uma copia do substr; carregando o original antes, o
% glossaries (que tambem usa o substr) nao gera "already defined"
\RequirePackage{substr}
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
  \def\gmap@glossarioname{Gloss\'ario}%
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
  \def\gmap@glossarioname{Glossary}%
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
% Nomes usados por \reffig, \reftab, ... (singular e plural)
\addto\captionsbrazil{%
  \def\gmap@ref@fig{Figura}\def\gmap@ref@figs{Figuras}%
  \def\gmap@ref@tab{Tabela}\def\gmap@ref@tabs{Tabelas}%
  \def\gmap@ref@eq{Equa\c{c}\~ao}\def\gmap@ref@eqs{Equa\c{c}\~oes}%
  \def\gmap@ref@cap{Cap\'itulo}\def\gmap@ref@caps{Cap\'itulos}%
  \def\gmap@ref@sec{Se\c{c}\~ao}\def\gmap@ref@secs{Se\c{c}\~oes}%
  \def\gmap@ref@ap{Ap\^endice}\def\gmap@ref@aps{Ap\^endices}%
  \def\gmap@ref@anexo{Anexo}\def\gmap@ref@anexos{Anexos}%
  \def\gmap@ref@e{e}%
}
\addto\captionsenglish{%
  \def\gmap@ref@fig{Figure}\def\gmap@ref@figs{Figures}%
  \def\gmap@ref@tab{Table}\def\gmap@ref@tabs{Tables}%
  \def\gmap@ref@eq{Equation}\def\gmap@ref@eqs{Equations}%
  \def\gmap@ref@cap{Chapter}\def\gmap@ref@caps{Chapters}%
  \def\gmap@ref@sec{Section}\def\gmap@ref@secs{Sections}%
  \def\gmap@ref@ap{Appendix}\def\gmap@ref@aps{Appendices}%
  \def\gmap@ref@anexo{Annex}\def\gmap@ref@anexos{Annexes}%
  \def\gmap@ref@e{and}%
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

% Logos (estao no repositorio Git, em fig/; podem ser trocados, ou
% desligados com \logoesquerda{} etc.)
\newcommand\gmap@logoesq{logo-example-01.pdf}
\newcommand\gmap@logodir{logo-example-02.pdf}
\newcommand\gmap@logotopoesq{logo-example-01.pdf}
\newcommand\logoesquerda[1]{\gdef\gmap@logoesq{#1}}
\newcommand\logodireita[1]{\gdef\gmap@logodir{#1}}
\newcommand\logotopoesquerda[1]{\gdef\gmap@logotopoesq{#1}}

% Imprime logo se existir (na pasta do documento, em fig/ ou figuras/, ou
% instalado); senao avisa uma vez e deixa espaco vazio
\newcommand\gmap@logo[2]{%
  \ifdefempty{#1}{}{%
    \IfFileExists{#1}{\includegraphics[#2]{#1}}{%
    \IfFileExists{fig/#1}{\includegraphics[#2]{fig/#1}}{%
    \IfFileExists{figuras/#1}{\includegraphics[#2]{figuras/#1}}{%
      \ifgmap@warned\else
        \global\gmap@warnedtrue
        \PackageWarningNoLine{gmap-ufrgs}{Logo not found (ignored): #1.\MessageBreak
          Get the UFRGS/GMAp logos from\MessageBreak
          https://github.com/GMAp-UFRGS/gmap-ufrgs (fig/)\MessageBreak
          and put them next to your document or in fig/,\MessageBreak
          or disable them with \string\logoesquerda{} etc.\MessageBreak
          See section "Logos" of the manual}%
      \fi}}}}}

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
% Capitulos tambem em maiusculas no sumario, como no titulo (chapter=TITLE).
% Mesmo recurso do sumario=abnt-6027-2012 do abntex2, mas so para os
% capitulos e mantendo o resto do sumario tradicional; os marcadores do
% PDF continuam com o texto original.
\settocpreprocessor{chapter}{%
  \let\gmap@tocorig\f@rtoc
  \def\f@rtoc{\texorpdfstring{\MakeTextUppercase{\gmap@tocorig}}{\gmap@tocorig}}}

%---------------------------------------------------------------------
% Cabecalho e rodape (memoir)
%---------------------------------------------------------------------
% Margens verticais (ABNT): o texto comeca a 3 cm do topo e termina a 2 cm
% da borda inferior. Cabecalho e rodape ficam DENTRO dessas margens, perto
% das bordas: o topo dos logos fica a ~1 cm do topo da pagina e a linha de
% base do rodape a 1 cm da borda inferior.
\newlength{\gmap@margemsup}\setlength{\gmap@margemsup}{3cm}
\newlength{\gmap@margeminf}\setlength{\gmap@margeminf}{2cm}
\newlength{\gmap@headdrop}\setlength{\gmap@headdrop}{0.8cm}
\newlength{\gmap@headh}\setlength{\gmap@headh}{48pt}
\newlength{\gmap@footskip}\setlength{\gmap@footskip}{1cm}
\newlength{\gmap@headsep}% o que sobra entre o cabecalho e o texto
\setlength{\gmap@headsep}{\dimexpr\gmap@margemsup-\gmap@headdrop-\gmap@headh\relax}
\setulmarginsandblock{\gmap@margemsup}{\gmap@margeminf}{*}
% classico: margens laterais de 2 cm (largura de texto de 17 cm em A4)
\ifgmap@classico\setlrmarginsandblock{2cm}{2cm}{*}\fi
\setheadfoot{\gmap@headh}{\gmap@footskip}
\setlength{\headdrop}{\gmap@headdrop}
\setlength{\headsep}{\gmap@headsep}
\checkandfixthelayout[fixed]

% Notas de revisao: \todo{...} na margem, \todo[inline]{...} no texto,
% \missingfigure{...} e \listoftodos (com a cor de cada nota).
% A largura da nota na margem e definida depois do layout, para que o
% \checkandfixthelayout nao a altere; cabe nas margens laterais de 2 cm.
% Texto em \footnotesize: em corpo 12 uma palavra como "Revisar" ja nao
% cabe em 1,5 cm.
\RequirePackage[colorinlistoftodos,textsize=footnotesize]{todonotes}
\setlength{\marginparwidth}{1.5cm}
\ifgmap@english\else
  \renewcommand*{\@todonotes@todolistname}{Lista de pend\^encias}
  \renewcommand*{\@todonotes@MissingFigureText}{Figura}
  \renewcommand*{\@todonotes@MissingFigureUp}{Figura}
  \renewcommand*{\@todonotes@MissingFigureDown}{pendente}
\fi

% Alturas dos logos no cabecalho (cabem na altura do cabecalho, 48pt).
% As letras "UFRGS" ocupam 39% da altura do logo da UFRGS e as maiusculas
% do GMAp 74% do logo do GMAp: com 1,5 cm e 0,8 cm as letras dos dois
% ficam da mesma altura. O GMAp desce 23% da sua altura (a perna do "p")
% para que as letras dos dois logos fiquem na mesma linha de base.
\newlength{\gmap@logoaltesq}\setlength{\gmap@logoaltesq}{1.5cm}
\newlength{\gmap@logoaltdir}\setlength{\gmap@logoaltdir}{0.8cm}
\newcommand\gmap@logodireito{%
  \raisebox{-0.23\gmap@logoaltdir}%
    {\gmap@logo{\gmap@logodir}{height=\gmap@logoaltdir}}}

\makepagestyle{gmap}
\makeoddhead{gmap}%
  {\gmap@logo{\gmap@logotopoesq}{height=\gmap@logoaltesq}}%
  {\ifgmap@prelim\textcolor{red}{\sffamily\bfseries\gmap@prelimname}\fi}%
  {\gmap@logodireito}
\makeoddfoot{gmap}%
  {\ifgmap@prelim\textcolor{red}{\scriptsize\sffamily\gmap@prelimname}\fi}%
  {}%
  {\scriptsize\sffamily\gmap@rodapetexto\thepage}

% Capa: logos no cabecalho e instituicao no rodape, dentro das margens
% (o rodape cresce para cima a partir da linha de base, nunca passa
% para a pagina seguinte, por maior que seja a equipe)
\makepagestyle{gmapcapa}
\makeoddhead{gmapcapa}%
  {\gmap@logo{\gmap@logoesq}{height=\gmap@logoaltesq}}{}%
  {\gmap@logodireito}
\makeoddfoot{gmapcapa}{}%
  {\parbox[b]{\textwidth}{\centering\sffamily\footnotesize\color{gray}%
     \gmap@instname\\ \gmap@univname\\ {\scriptsize\gmap@enderecoinst}}}{}

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
% Referencias cruzadas com o nome: \reffig{fig:viga} -> Figura 1 (o nome
% e o numero formam um so link). Varios rotulos separados por virgula
% saem no plural: \reffig{fig:a,fig:b,fig:c} -> Figuras 1, 2 e 3.
% Com *, sem link. \refeq poe o numero entre parenteses: Equacao (1).
% Nomes no idioma do documento (Figure 1 com a opcao english).
%---------------------------------------------------------------------
\ExplSyntaxOn
\seq_new:N \l__gmap_ref_seq
\tl_new:N \l__gmap_ref_tl
% numero de um rotulo (so no \refeq entre parenteses): #1 = tipo, #2 = rotulo
\cs_new:Npn \__gmap_ref_numero:nn #1#2
  { \str_if_eq:nnTF {#1} { eq } { ( \ref* {#2} ) } { \ref* {#2} } }
% nome e numero de um rotulo: Figura~1
\cs_new:Npn \__gmap_ref_um:nn #1#2
  { \use:c { gmap@ref@#1 } \nobreakspace \__gmap_ref_numero:nn {#1} {#2} }
\cs_generate_variant:Nn \__gmap_ref_um:nn { nV }
% link para o rotulo #1 com o texto #2
\cs_new_protected:Npn \__gmap_ref_link:nn #1#2 { \hyperref [ #1 ] { #2 } }
\cs_generate_variant:Nn \__gmap_ref_link:nn { Vn }
% #1 = estrela, #2 = tipo (fig, tab, ...), #3 = rotulos
\cs_new_protected:Npn \__gmap_ref:nnn #1#2#3
  {
    \seq_set_from_clist:Nn \l__gmap_ref_seq {#3}
    \int_compare:nNnTF { \seq_count:N \l__gmap_ref_seq } = { 1 }
      {
        \seq_get_left:NN \l__gmap_ref_seq \l__gmap_ref_tl
        \bool_if:NTF #1
          { \__gmap_ref_um:nV {#2} \l__gmap_ref_tl }
          { \__gmap_ref_link:Vn \l__gmap_ref_tl { \__gmap_ref_um:nV {#2} \l__gmap_ref_tl } }
      }
      {
        \seq_set_map:NNn \l__gmap_ref_seq \l__gmap_ref_seq
          {
            \bool_if:NTF #1
              { \__gmap_ref_numero:nn {#2} {##1} }
              { \hyperref [ ##1 ] { \__gmap_ref_numero:nn {#2} {##1} } }
          }
        \use:c { gmap@ref@#2s } \nobreakspace
        \seq_use:Nnnn \l__gmap_ref_seq
          { \c_space_tl \gmap@ref@e \c_space_tl }
          { , \c_space_tl }
          { \c_space_tl \gmap@ref@e \c_space_tl }
      }
  }
\clist_map_inline:nn { fig, tab, eq, cap, sec, ap, anexo }
  {
    \exp_args:Nc \NewDocumentCommand { ref #1 } { s m }
      { \__gmap_ref:nnn {##1} {#1} {##2} }
  }
\ExplSyntaxOff

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
  \begin{capa}\aliaspagestyle{titlingpage}{gmapcapa}\begin{SingleSpacing}\sffamily
    \vspace*{\fill}
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
    \vspace*{\fill}
  \end{SingleSpacing}\end{capa}}

% Perfil classico: capa do formato anterior (projeto entre filetes,
% tipo + numero, revisao, titulo, data; equipe deslocada a direita)
\newcommand\gmap@capa@classico{%
  \begin{capa}\aliaspagestyle{titlingpage}{gmapcapa}\begin{SingleSpacing}\sffamily
    \vspace*{\fill}
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
    \vspace*{\fill}
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
% Assinatura no texto (bloco sem serifa, alinhado a direita)
% (\assinatura e' do abntex2, com traco centralizado; nao e' alterado)
%   \blocoassinatura[chaves]{Nome \\ Cargo \\ Grupo \\ Instituicao}
%   chaves: imagem=arquivo (imagem da assinatura, acima do texto),
%     altura=1.2cm (altura da imagem ou do espaco para assinar),
%     linha (traco para assinatura a mao), posicao=direita|centro|esquerda,
%     espaco=1cm (espaco vertical antes do bloco),
%     nofim (adia o bloco para o fim do documento, ver abaixo),
%     novapagina (comeca uma pagina nova antes do bloco; com nofim, as
%       assinaturas guardadas saem juntas numa pagina so delas)
%   Varias pessoas lado a lado (blocos centrados e distribuidos):
%   \begin{assinaturas}[chaves]
%     \blocoassinatura{...}
%     \blocoassinatura{...}
%   \end{assinaturas}
%   \configurarassinatura{chaves} muda o padrao de todas as assinaturas.
%   Sem nofim, a assinatura sai onde o comando esta. Com nofim, ela e'
%   guardada e sai no fim de tudo: depois das referencias, apendices,
%   anexos e das listas automaticas de simbolos, siglas e glossario.
%   \imprimirassinaturas imprime ali as guardadas.
%---------------------------------------------------------------------
\ExplSyntaxOn
\tl_new:N   \l__gmap_ass_img_tl
\tl_new:N   \l__gmap_ass_pos_tl
\dim_new:N  \l__gmap_ass_altura_dim
\skip_new:N \l__gmap_ass_espaco_skip
\bool_new:N \l__gmap_ass_linha_bool
\bool_new:N \l__gmap_ass_grupo_bool
\bool_new:N \l__gmap_ass_nofim_bool
\bool_new:N \l__gmap_ass_novapag_bool
\bool_new:N \g__gmap_ass_novapag_bool
\tl_new:N   \g__gmap_ass_fim_tl
\tl_new:N   \l__gmap_ass_fim_tl

\keys_define:nn { gmap/assinatura }
  {
    imagem  .tl_set:N   = \l__gmap_ass_img_tl ,
    altura  .dim_set:N  = \l__gmap_ass_altura_dim ,
    altura  .initial:n  = 1.2cm ,
    linha   .bool_set:N = \l__gmap_ass_linha_bool ,
    linha   .default:n  = true ,
    espaco  .skip_set:N = \l__gmap_ass_espaco_skip ,
    espaco  .initial:n  = 1cm ,
    posicao .choices:nn =
      { direita , centro , esquerda , right , center , left }
      {
        \tl_set:Ne \l__gmap_ass_pos_tl
          { \clist_item:nn { r , c , l , r , c , l } { \l_keys_choice_int } }
      } ,
    posicao .initial:n  = direita ,
    nofim   .bool_set:N = \l__gmap_ass_nofim_bool ,
    nofim   .default:n  = true ,
    novapagina .bool_set:N = \l__gmap_ass_novapag_bool ,
    novapagina .default:n  = true ,
  }

% o bloco: [imagem ou espaco] [traco] linhas de texto, numa tabela de uma coluna
\cs_new_protected:Npn \__gmap_ass_bloco:n #1
  {
    \group_begin:
    \linespread { 1 } \small \sffamily
    \use:e
      {
        \exp_not:N \begin { tabular } [ t ]
          { @ { } \l__gmap_ass_pos_tl @ { } }
      }
      \tl_if_empty:NTF \l__gmap_ass_img_tl
        { \bool_if:NT \l__gmap_ass_linha_bool { \rule { 0pt } { \l__gmap_ass_altura_dim } \\ } }
        { \includegraphics [ height = \l__gmap_ass_altura_dim ] { \l__gmap_ass_img_tl } \\ }
      \bool_if:NT \l__gmap_ass_linha_bool { \specialrule { 0.4pt } { 0pt } { 2pt } }
      #1
    \end { tabular }
    \group_end:
  }

\NewDocumentCommand \blocoassinatura { O{} m }
  {
    \group_begin:
    \keys_set:nn { gmap/assinatura } {#1}
    \bool_if:NTF \l__gmap_ass_grupo_bool
      {
        \__gmap_ass_bloco:n {#2}
        \hspace* { \fill }
      }
      {
        \bool_if:NTF \l__gmap_ass_nofim_bool
          {
            \tl_gput_right:Nn \g__gmap_ass_fim_tl
              { \blocoassinatura [ #1 , nofim = false , novapagina = false ] {#2} }
            \bool_if:NT \l__gmap_ass_novapag_bool
              { \bool_gset_true:N \g__gmap_ass_novapag_bool }
          }
          {
            \par
            \bool_if:NT \l__gmap_ass_novapag_bool { \clearpage }
            \vspace { \l__gmap_ass_espaco_skip }
            \noindent
            \use:e { \exp_not:N \makebox [ \exp_not:N \linewidth ] [ \l__gmap_ass_pos_tl ] }
              { \__gmap_ass_bloco:n {#2} }
            \par \bigskip
          }
      }
    \group_end:
    \ignorespaces
  }

\NewDocumentEnvironment { assinaturas } { O{} +b }
  {
    \keys_set:nn { gmap/assinatura } { posicao = centro , #1 }
    \bool_if:NTF \l__gmap_ass_nofim_bool
      {
        \tl_gput_right:Nn \g__gmap_ass_fim_tl
          { \begin { assinaturas } [ #1 , nofim = false , novapagina = false ] #2 \end { assinaturas } }
        \bool_if:NT \l__gmap_ass_novapag_bool
          { \bool_gset_true:N \g__gmap_ass_novapag_bool }
        \ignorespacesafterend
      }
      {
        \par
        \bool_if:NT \l__gmap_ass_novapag_bool { \clearpage }
        \vspace { \l__gmap_ass_espaco_skip }
        \bool_set_true:N \l__gmap_ass_grupo_bool
        \skip_set:Nn \parfillskip { 0pt }
        \noindent \hspace* { \fill }
        \ignorespaces #2
        \par \bigskip % cada \blocoassinatura ja deixa um \fill depois de si
      }
  }
  { }

\NewDocumentCommand \configurarassinatura { m }
  { \keys_set:nn { gmap/assinatura } {#1} }

% assinaturas guardadas com nofim: saem uma vez so, todas juntas (numa
% pagina nova se alguma pediu novapagina)
\cs_new_protected:Npn \__gmap_ass_fim:
  {
    \tl_if_empty:NF \g__gmap_ass_fim_tl
      {
        \tl_set_eq:NN \l__gmap_ass_fim_tl \g__gmap_ass_fim_tl
        \tl_gclear:N \g__gmap_ass_fim_tl
        \bool_if:NT \g__gmap_ass_novapag_bool { \par \clearpage }
        \bool_gset_false:N \g__gmap_ass_novapag_bool
        \l__gmap_ass_fim_tl
      }
  }
\NewDocumentCommand \imprimirassinaturas { } { \__gmap_ass_fim: }
% no fim de tudo: depois das listas automaticas de simbolos, siglas e
% glossario (que tambem estao no enddocument, com o rotulo gmap-ufrgs)
\AddToHook { enddocument } [ gmap-ufrgs/assinaturas ] { \__gmap_ass_fim: }
\DeclareHookRule { enddocument } { gmap-ufrgs } { before } { gmap-ufrgs/assinaturas }
\ExplSyntaxOff

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

%---------------------------------------------------------------------
% Siglas, simbolos e glossario automaticos (pacote glossaries-extra, modo
% "noidx": nao precisa de makeindex/makeglossaries nem de configurar o
% latexmk ou o Overleaf; basta compilar duas vezes, como para o sumario)
% Valem os comandos do glossaries-extra e os atalhos da classe:
%   \newabbreviation[chaves]{rotulo}{curta}{longa}  \
%   \newacronym[chaves]{rotulo}{SIGLA}{Expansao}     > abreviaturas e siglas
%   \sigla[chaves]{rotulo}{SIGLA}{Expansao}         |  (= \newacronym)
%   \abreviatura[chaves]{rotulo}{et al.}{et alii}   /  (so a forma curta)
%   \glsxtrnewsymbol[description={...}]{rotulo}{$\sigma$}  \  simbolos
%   \simbolo[chaves]{rotulo}{\ensuremath{\sigma}}{Descricao} / (nao $...$)
%   \newglossaryentry{rotulo}{name={...},description={...}} \ glossario
%   \termo[chaves]{rotulo}{Termo}{Definicao}                /
% (definidos no preambulo). No texto: \gls{rotulo} (\glspl, \Gls, \glsxtrshort,
% \glsxtrlong, \glsxtrfull). So entram nas listas os itens usados no texto.
% Siglas (\newacronym/\sigla): 1.a vez "Expansao (SIGLA)"; com user1={...}
% (p.ex. o nome em ingles), "Expansao (SIGLA, user1)" e, na lista, user1 em
% italico abaixo da expansao. \newabbreviation segue o estilo padrao do
% glossaries-extra (long-short); mude com \setabbreviationstyle{...} no
% preambulo, antes das definicoes.
% Listas: \imprimirsiglas e \imprimirsimbolos (pre-textuais, sem pagina
% propria se vazias) e \imprimirglossario (pos-textual, no sumario; se nao
% for chamado, sai no fim do documento). Com os pre-textuais automaticos,
% as listas de siglas e de simbolos saem sozinhas. No perfil classico as
% listas de simbolos e de siglas e o glossario saem sempre no fim do
% documento (nessa ordem), e \imprimirsiglas, \imprimirsimbolos e \imprimirglossario
% sao ignorados.
%---------------------------------------------------------------------
\RequirePackage[abbreviations,symbols,nonumberlist,nogroupskip,
  translate=false]{glossaries-extra}
\makenoidxglossaries
% documento sem siglas/termos nao deve gerar aviso
\let\warn@noprintglossary\relax
% lista desligada por opcao: \gls dessas entradas sem link (nao ha destino)
\ifcsdef{gmap@sem@siglas}{\GlsDeclareNoHyperList{abbreviations}}{}
\ifcsdef{gmap@sem@simbolos}{\GlsDeclareNoHyperList{symbols}}{}
\ifcsdef{gmap@sem@glossario}{\GlsDeclareNoHyperList{main}}{}
\setabbreviationstyle[acronym]{long-short-user}
% na lista: expansao com inicial maiuscula e o campo user1 (se houver) em
% italico na linha de baixo (\glsxtrpostdescacronym pode ser redefinido)
\glssetcategoryattribute{acronym}{glossdesc}{firstuc}
\newcommand\gmap@postdescuser{%
  \ifglshasfield{\glsxtruserfield}{\glscurrententrylabel}%
    {\newline\textit{\glscurrentfieldvalue}}{}}
\csdef{glsxtrpostdescacronym}{\gmap@postdescuser}
\csdef{glsxtrpostdescabbreviation}{\gmap@postdescuser}

% abreviaturas (et al., p., fig.): sempre so a forma curta no texto
\setabbreviationstyle[abreviatura]{short-nolong}
% "et al." no fim da frase nao vira "et al.."
\glssetcategoryattribute{abreviatura}{discardperiod}{true}

\newcommand\sigla[4][]{\newacronym[#1]{#2}{#3}{#4}}
\newcommand\abreviatura[4][]{\newabbreviation[category=abreviatura,#1]{#2}{#3}{#4}}
\newcommand\simbolo[4][]{\glsxtrnewsymbol[description={#4},#1]{#2}{#3}}
\newcommand\termo[4][]{\newglossaryentry{#2}{name={#3},description={#4},#1}}

% sigla/simbolo a esquerda, descricao a direita, alinhado a margem
\newglossarystyle{gmap}{%
  \setglossarystyle{long}%
  \renewenvironment{theglossary}%
    {\setlength{\LTleft}{0pt}\setlength{\LTright}{\fill}%
     \begin{longtable}{@{}l@{\hspace{1.5em}}p{\glsdescwidth}@{}}}%
    {\end{longtable}}}
% glossario: "Termo: definicao." (inicial maiuscula na lista), em
% paragrafos com recuo pendente (sem \item: o nameref tenta expandir o
% rotulo do \item, o que quebra com os nomes do glossaries-extra)
\newglossarystyle{gmaplista}{%
  \setglossarystyle{list}%
  \renewenvironment{theglossary}%
    {\par\setlength{\parindent}{0pt}\setlength{\parskip}{.5\baselineskip}}%
    {\par}%
  \renewcommand*{\glossaryheader}{}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand*{\glsgroupskip}{}%
  \renewcommand*{\glossentry}[2]{%
    \par\hangindent=1.5em\hangafter=1
    \textbf{\glsentryitem{##1}\glstarget{##1}{\Glossentryname{##1}}:}\space
    \glossentrydesc{##1}\glspostdescription\par}%
  \renewcommand*{\subglossentry}[3]{\glossentry{##2}{##3}}}

% titulos: pre-textual (fora do sumario, como as listas do abntex2) e
% pos-textual (no sumario, sem numero)
\newcommand\gmap@cab@pre[1]{\pretextualchapter{#1}}
\newcommand\gmap@cab@pos[1]{%
  \chapter*{#1}\phantomsection
  \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeTextUppercase{#1}}{#1}}}

% #1 tipo, #2 titulo, #3 ordem, #4 estilo, #5 titulo (\gmap@cab@...)
% (nada e' impresso se nenhum item do tipo foi usado no texto)
\newcommand\gmap@lista[5]{%
  \ifcsundef{@glsref@#1}{}{%
    \begingroup
      \renewcommand*{\glossarysection}[2][]{#5{##2}}%
      \setlength{\glsdescwidth}{0.72\linewidth}%
      \printnoidxglossary[type=#1,title={#2},sort=#3,style=#4]%
    \endgroup}}

% cada lista sai uma vez so (a automatica ou a do usuario); com a opcao
% sem<lista>, nunca sai (sem aviso)
\newcommand\gmap@umavez[3]{%
  \ifcsdef{gmap@sem@#1}{\csgdef{gmap@feito@#1}{}}{\gmap@umavez@{#1}{#2}{#3}}}
\newcommand\gmap@umavez@[3]{%
  \ifcsdef{gmap@feito@#1}%
    {\PackageWarning{gmap-ufrgs}{\string#2 already printed, ignored}}%
    {\csgdef{gmap@feito@#1}{}#3}}
% #1 titulo (\gmap@cab@pre ou \gmap@cab@pos)
\newcommand\gmap@imprimirsiglas[1]{\gmap@umavez{siglas}{\imprimirsiglas}%
  {\gmap@lista{\glsxtrabbrvtype}{\listadesiglasname}{standard}{gmap}{#1}}}
% simbolos na ordem em que aparecem no texto (ABNT NBR 14724)
\newcommand\gmap@imprimirsimbolos[1]{\gmap@umavez{simbolos}{\imprimirsimbolos}%
  {\gmap@lista{symbols}{\listadesimbolosname}{use}{gmap}{#1}}}
\newcommand\gmap@imprimirglossario{\gmap@umavez{glossario}{\imprimirglossario}%
  {\gmap@lista{\glsdefaulttype}{\gmap@glossarioname}{standard}{gmaplista}{\gmap@cab@pos}}}
% classico: as listas de simbolos e de siglas e o glossario saem sempre no
% fim do documento (depois das referencias, apendices e anexos), nessa
% ordem e no sumario; \imprimirsiglas, \imprimirsimbolos e
% \imprimirglossario no texto sao ignorados
\ifgmap@classico
  \newcommand\imprimirsiglas{}
  \newcommand\imprimirsimbolos{}
  \newcommand\imprimirglossario{}
\else
  \newcommand\imprimirsiglas{\gmap@imprimirsiglas\gmap@cab@pre}
  \newcommand\imprimirsimbolos{\gmap@imprimirsimbolos\gmap@cab@pre}
  \let\imprimirglossario\gmap@imprimirglossario
\fi
\AddToHook{enddocument}{%
  \ifgmap@classico
    \ifcsdef{gmap@feito@simbolos}{}{\gmap@imprimirsimbolos\gmap@cab@pos}%
    \ifcsdef{gmap@feito@siglas}{}{\gmap@imprimirsiglas\gmap@cab@pos}%
  \fi
  \ifcsdef{gmap@feito@glossario}{}{\gmap@imprimirglossario}%
  \ifcsdef{gmap@feito@siglas}{}{\ifcsundef{@glsref@\glsxtrabbrvtype}{}{%
    \PackageWarningNoLine{gmap-ufrgs}{Acronyms used but no \string\imprimirsiglas}}}%
  \ifcsdef{gmap@feito@simbolos}{}{\ifcsundef{@glsref@symbols}{}{%
    \PackageWarningNoLine{gmap-ufrgs}{Symbols used but no \string\imprimirsimbolos}}}}

%---------------------------------------------------------------------
% Elementos pre-textuais automaticos (perfil classico, ou opcao
% pretextualautomatico): no \begin{document} saem
%   capa, folha de controle (so se houver \verificador, \aprovador ou a
%   opcao confidencial), sumario e listas de siglas e de simbolos (se
%   usadas), e o documento ja comeca na parte textual.
% classico: so o sumario (as listas vao para o fim do documento);
% abnt: listas antes do sumario (ABNT).
% Documentos antigos que ainda tem \imprimircapa, \pdfbookmark{...}{toc},
% \tableofcontents* e \textual continuam compilando: esses comandos sao
% ignorados (com aviso). Para montar os pre-textuais a mao (resumo,
% lista de figuras...), use a opcao pretextualmanual.
%---------------------------------------------------------------------
\let\gmap@tableofcontents\tableofcontents
\newcommand\gmap@sumario{%
  \clearpage% o sumario do memoir nao comeca pagina nova sozinho
  \pdfbookmark[0]{\contentsname}{gmap-sumario}%
  \gmap@tableofcontents*%
  \cleardoublepage}
\newcommand\gmap@ignorado[1]{%
  \PackageWarning{gmap-ufrgs}{\string#1 ignored: the pre-textual\MessageBreak
    elements are printed automatically. Remove it,\MessageBreak
    or use the class option pretextualmanual}}
\newif\ifgmap@folha
\newcommand\gmap@pretextual@auto{%
  \pretextual
  \imprimircapa
  \gmap@folhafalse
  \ifgmap@conf\gmap@folhatrue\fi
  \ifcsdef{gmap@v@nome}{\gmap@folhatrue}{}%
  \ifcsdef{gmap@p@nome}{\gmap@folhatrue}{}%
  \ifgmap@folha\imprimirfolhadecontrole\fi
  \ifgmap@classico
    \gmap@sumario% listas: no fim do documento
  \else
    \imprimirsiglas\imprimirsimbolos\gmap@sumario
  \fi
  \textual
  % o que ja saiu nao sai de novo se estiver escrito no documento
  \gdef\imprimircapa{\gmap@ignorado{\imprimircapa}}%
  \ifgmap@folha
    \gdef\imprimirfolhadecontrole{\gmap@ignorado{\imprimirfolhadecontrole}}\fi
  \gdef\tableofcontents{\@ifstar{\gmap@ignorado{\tableofcontents}}%
                                {\gmap@ignorado{\tableofcontents}}}%
  \global\let\gmap@pdfbookmark@orig\pdfbookmark
  \gdef\pdfbookmark{\@ifnextchar[\gmap@pdfbookmark{\gmap@pdfbookmark[0]}}%
  \gdef\textual{}}
% \pdfbookmark{...}{toc} dos documentos antigos marcaria o sumario de novo
\def\gmap@pdfbookmark[#1]#2#3{%
  \ifstrequal{#3}{toc}{}{\gmap@pdfbookmark@orig[#1]{#2}{#3}}}
\ifgmap@auto
  \AddToHook{begindocument/end}{\gmap@pretextual@auto}
\fi

\endinput
