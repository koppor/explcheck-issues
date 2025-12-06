%%
%% This is file `matapli.cls',
%%
%% -----------------------------------------------------------------------------
%% MATAPLI --- SMAI class for the French SMAI journal "MATAPLI",
%% version 1.2.0
%%
%% E-mail: chupin@ceremade.dauphine.fr
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% -----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}

% on charge expl3 pour LaTeX3
\RequirePackage{expl3}
% on lance la syntax LaTeX3
\ExplSyntaxOn
\ProvidesExplClass{matapli}
{2022/03/11}
{1.2}
{SMAI class for the French jornal MATAPLI}

% classe de base
\LoadClass[twoside, 11pt]{book}

% pour tester si on compile avec lualatex
\RequirePackage{iftex}
\RequirePackage{latexsym,amssymb,subfig,amsthm,mathtools}
% pour la fonte
% cas différent si on utilise LuaLaTeX ou non
\ifluatex
%\RequirePackage[sfdefault,scaled=.85]{FiraSans}
%\RequirePackage{newtxsf}
\RequirePackage[osf]{libertinus-otf}
\else
\RequirePackage{libertine}
\fi
% gestion des langues
\RequirePackage[english,french]{babel}
\frenchbsetup{AutoSpaceFootnotes=false}
\selectlanguage{french}
% pour l'option valign d'incladegraphics
\RequirePackage[export]{adjustbox}
% paramétrage des listes
\RequirePackage{enumitem}
% les graphiques, les couleurs
\RequirePackage{graphicx}
% paramétrer les haut et bas de page
\RequirePackage{fancyhdr}
% symboles par exemple pour \Telefon
\RequirePackage{marvosym}
% pour quelques symboles
\RequirePackage{eurosym}
% gestion de la composition multicolonne
\RequirePackage{multicol}
\RequirePackage{xcolor}
% les tableaux
\RequirePackage{tabularx,booktabs}
% les liens hypertext
\RequirePackage{url}
\PassOptionsToPackage{hyphens}{url}
\RequirePackage[colorlinks = true,
linkcolor = principale,
urlcolor  = secondaire,
citecolor = principale,
anchorcolor = principale,
unicode]{hyperref}
% charger tikz
\RequirePackage{tikz}
% les boites colorées
\RequirePackage[breakable,most]{tcolorbox}
% programmation en LaTeX
\RequirePackage{ifthen}
% personnalisation des sections
\RequirePackage{titlesec, titletoc}
% personnalisation des légendes pour figure et tableaux
\RequirePackage{caption}

% bibliographie biblatex
\RequirePackage[refsection=chapter]{biblatex}

%%%%%%%% taille des pages %%%%%%
\RequirePackage{calc}
\RequirePackage{geometry}
\geometry{
  paperwidth=170mm,
  paperheight=240mm,
  inner=20mm,
  outer=25mm,
  top=30mm,
  bottom=20mm
}
%le package pour les marques de découpe pour imprimeur
%\RequirePackage[cam,a4,center]{crop}

% les couleurs definies
\definecolor{gris}{gray}{0.8}
\definecolor{grisclair}{gray}{0.90}
\definecolor{principale}{RGB}{93,138,168}
\definecolor{secondaire}{RGB}{168, 93, 94}
\definecolor{troisieme}{RGB}{168, 93, 94}
\definecolor{quatrieme}{RGB}{168, 154, 93}
\definecolor{chapitre}{RGB}{0,0,0}


% quelques définitions LaTeX3
\int_new:N \g__matapli_articles_int % compteur des articles (chapter)
\int_new:N \g__matapli_parties_int % compteur des parties dans les articles (chapter)
\int_set:Nn \g__matapli_articles_int {0} % compteur pour le nombre d'articles
\int_set:Nn \g__matapli_parties_int {0} % compteur pour le nombre de parties par articles

\tl_new:N \g__matapli_auteurs_first_last_names_list_tl % la liste de noms d'auteurs
\tl_new:N \g__matapli_auteurs_affiliation_list_tl % la liste des affilations correspondante
\tl_new:N \g__matapli_auteurs_email_list_tl % la liste des email correspondante
\tl_new:N \g__matapli_auteurs_minibio_list_tl % la liste des minibio correspondante
\tl_new:N \g__matapli_auteurs_photo_list_tl % la liste des photos correspondante
\tl_new:N \g__matapli_auteurs_webpage_list_tl % la liste des webpage correspondantes
\tl_new:N \g__matapli_auteurs_type_list_tl % la liste des type correspondant (unique ou organisation)


\tl_new:N \g__matapli_auteurs_first_last_names_tl % variable noms d'auteurs
\tl_new:N \g__matapli_auteurs_affiliation_tl % variable affilations correspondante
\tl_new:N \g__matapli_auteurs_email_tl % variable des email correspondante
\tl_new:N \g__matapli_auteurs_minibio_tl % variable des minibio correspondante
\tl_new:N \g__matapli_auteurs_photo_tl % variable des photos correspondante
\tl_new:N \g__matapli_auteurs_webpage_tl % variable des webpage correspondantes
\tl_new:N \g__matapli_auteurs_type_tl % variable des type correspondant (unique ou organisation)

% la chaine de caractère de la liste de tous les auteurs
\str_new:N \g__matapli_auteurs_articles_list_str


%% on stoppe la syntaxe LaTeX3
\ExplSyntaxOff

% les commandes numero et mois avec valeur initiale
\newcommand{\numero}{XXX}
\newcommand{\mois}{Mois Année}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% définition de l'apparence du chapitre %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\MatapliChapterFont{}

\newcommand\chapformat[1]{%
  \begin{tikzpicture}[overlay, remember picture]
    \fill[principale] ($(current page.north west)-(0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.north east)+(0.1\hoffset,-2in)$);
    \fill[white] ($(current
    page.north east)+(-1.5,-0.5in)$) circle (1);
    \fill[white] ($(current
    page.north east)+(-1,-1.3in)$) circle (0.7);
    \fill[white] ($(current
    page.north east)+(-2.3,-1.7in)$) circle (0.5);
    \node[anchor= west, align=left,text width=\linewidth,font=\Huge\bfseries,color=white,
    execute at begin node=\setlength{\baselineskip}{1.5em}] at
    ($(current page.north west)+(1,-1in)$)
    {\MatapliChapterFont #1 };
  \end{tikzpicture}
}

\titleformat{\chapter}{\normalfont}{}{0pt}{\chapformat}

\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{titreHDR}}{}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% fin définition des chapitres %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% définition du titre et parties    %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOn

% des compteurs globaux
\tl_new:N \g__matapli_titre_auteur_tl
\tl_new:N \g__matapli_titre_court_tl

% definitions des clés/valeurs pour la commande \titre
\keys_define:nn{matapli/titre}{%
  auteur .tl_gset:N = \g__matapli_titre_auteur_tl,
  court .tl_gset:N = \g__matapli_titre_court_tl,
  auteur .value_required:n = true,
  court .value_required:n = true,
}

% commande titre qui est surcharge \chapter
% arguments optionnels  entre []
%     - court={} : pour titre court pour header
%                  ex. : \titre[court={titre court}]{titre long}
%     - auteur=article/partie : défini si les auteurs sont affichés
%     juste après le titre de chapitre (article)
%     ou si on souhaite afficher les auteurs des parties (partie)

\NewDocumentCommand\titre { o m } {
  % pour les clés à valeur par défaut
  \keys_set:nn { matapli/titre } { auteur=article } %
  \IfNoValueF {#1}
  {
    \keys_set:nn { matapli/titre } { #1 }
  }
  \tl_if_empty:NTF \g__matapli_titre_court_tl {% si pas de titre court
    \tl_set:Nn \l__matapli_titre_court_tl {#2}%
  }{% si on met un titre court
    \tl_set:Nx \l__matapli_titre_court_tl \g__matapli_titre_court_tl
  }
  \chapter[\tl_use:N \l__matapli_titre_court_tl]{#2}
  % increment le compteur des articles
  \int_gincr:N \g__matapli_articles_int
  % on reset le compteur de partie
  \int_set:Nn \g__matapli_parties_int {0}
  % si on n'affiche pas les auteurs par partie dans le chapitre
  \str_if_eq:VnTF \g__matapli_titre_auteur_tl {article}{%
    \__matapli_markauteurs
  }{}
  \tl_clear:N \g__matapli_titre_auteur_tl
  \tl_clear:N \g__matapli_titre_court_tl
}

\ExplSyntaxOff
%\let\titre\chapter

% on réinitialise le compteur de section avec les parties dans les chapitre
\newcounter{chapterpart}[chapter]
\@addtoreset{section}{chapterpart}
\newcommand\l@chapterpart{\@dottedtocline{1}{0em}{0em}}

\ExplSyntaxOn
% option pour afficher les auteurs par parties dans un chapitre
\tl_new:N \g__matapli_partie_auteur_tl
% definitions des clés/valeurs pour la commande \partie
\keys_define:nn{matapli/partie}{%
  auteur .tl_gset:N = \g__matapli_partie_auteur_tl,
  auteur .value_required:n = true,
}

% commande qui crée une partie entre section et chapitre
% \partie{Titre de la partie}
% argument optionnel auteur : si on souhaite afficher les auteurs par partie
%        \partie[auteur=partie]{Titre de la partie}
\NewDocumentCommand\partie { o m } {
  % on incrémente le compte de parties
  \int_gincr:N \g__matapli_parties_int
  % pour les clés à valeur par défaut
  \keys_set:nn { matapli/partie } { auteur=article }
  \IfNoValueF {#1}
  {
    \keys_set:nn { matapli/partie } { #1 }
  }
  % on incréente le compteur LaTeX2 correspondant
  \refstepcounter{chapterpart}
  % on ajoute dans la TOC
  \addcontentsline{toc}{section}{\protect \scshape{Partie~:~#2 }}
  \tcbset{%
    arc=0pt,%
    outer~arc=0pt,%
    colback=gray!10!white,%
    colframe=principale,%
    boxsep=0pt,%
    left=10pt,%
    right=10pt,%
    top=8pt,%
    bottom=10pt,%
    bottomtitle = 3pt,%
    toptitle=3pt,%
    boxrule=0pt,%
    bottomrule=0.5pt,%
    toprule=0.5pt}%
  \medskip
  \begin{tcolorbox}[fontupper=\huge\bfseries\scshape,halign=center]%
  #2
  \end{tcolorbox}\medskip
  % si l'option auteur=partie, alors on affiche les auteurs
  \str_if_eq:VnTF \g__matapli_partie_auteur_tl {partie}{%
    \__matapli_markauteurs[partie]
  }{}
  \tl_clear:N \g__matapli_partie_auteur_tl
}
\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% fin titre et sous titre      %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% définition de l'apparence des section %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% personnalisation de l'apparence des section et sous-section
\renewcommand\thesection{\arabic{section}}

\renewcommand{\section}{\@startsection {section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  {\normalfont\Large\sffamily\bfseries\ruleunder}%
}
\newcommand{\ruleunder}[1]{{#1\par\nobreak\vskip -1ex\noindent\tikz{\draw[color=principale,
      line width=2pt]
      (0,0)--(1.1\linewidth,0);\fill[color=principale] (1.1\linewidth,0)
      circle (5pt);}}\par\nobreak\vskip -1ex}

\newcommand{\ruleundersub}[1]{{#1\par\nobreak\vskip -1ex\noindent\hspace{-1cm}\tikz{\draw[color=principale,
      line width=2pt]
      (0,0)--(0.6\linewidth,0);\fill[color=principale] (0,0)
      circle (2pt);}}\par\nobreak\vskip -1ex}

%\renewcommand\thesubsection{\fcolorbox{principale}{principale}{\color{white}\arabic{section}.\arabic{subsection}}}
\renewcommand{\subsection}{\@startsection {subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\large\sffamily\bfseries\ruleundersub}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% fin section %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% personnalisation des figures et table %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareCaptionLabelSeparator{tiret}{ — }
\DeclareCaptionFont{matapli}{\color{principale}\bfseries\scshape}
\captionsetup[figure]{labelfont={matapli},name={Figure},textfont=it,labelsep=tiret}
\captionsetup[table]{labelfont={matapli},name={Table},textfont=it,labelsep=tiret}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% fin figures et tables %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Sommaire et minitoc     %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{etoc}[2016/09/29]%
\AtBeginDocument{\renewcommand{\contentsname}{Sommaire}}
\newcommand\sommaire{\setcounter{tocdepth}{0}
  \tableofcontents}
% pour formater l'apparence des chapitres dans le sommaire
\contentsmargin{0pt}
\titlecontents{chapter}[0pt]
{\large}
{\normalfont\scshape}
{}
{~---~\thecontentspage}
[\vspace{2pt}]

% local tables des matières pour les chapitres/articles
\newcommand\articletableofcontents{%
  \etocmulticolstyle{\noindent\bfseries
    \leaders\hrule height1pt\hfill
    \MakeUppercase{Table des matières}}
  \etocsettocdepth{2}
\begingroup
\parindent 0pt \parfillskip 0pt \leftskip 0cm \rightskip 1cm
\renewcommand*\etocmulticolsep{0ex}
\renewcommand*\etoccolumnsep{0em}
\etocsetstyle {section}
{}
{\leavevmode\leftskip 0cm\relax}
{\bfseries\normalsize
\etocifnumbered{\makebox[.6cm][l]{\etocnumber}}{}%
\etocname\nobreak\leaders\hbox to.2cm{\hss.}\hfill\nobreak
\rlap{\makebox[0.6cm]{\mdseries\etocpage}}
\par}
{}
\etocsetstyle {subsection}
{}
{\leavevmode\leftskip 0.3cm\relax }
{\mdseries\normalsize\makebox[0.6cm][l]{\etocnumber}%
\etocname\nobreak\leaders\hbox to.2cm{\hss.}\hfill\nobreak
\rlap{\makebox[0.6cm]{\etocpage}}
\par}
{}
  \localtableofcontents
\endgroup}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Fin Sommaire et minitoc %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% auteurs et autrices %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ExplSyntaxOn
% definitions des clés/valeurs pour la commande \author
% avec passage par des variables globales.
\keys_define:nn{matapli/authors}{%
  affiliation .tl_gset:N = \g__matapli_auteurs_affiliation_tl,
  email .tl_gset:N = \g__matapli_auteurs_email_tl,
  minibio .tl_gset:N = \g__matapli_auteurs_minibio_tl,
  photo .tl_gset:N = \g__matapli_auteurs_photo_tl,
  webpage .tl_gset:N = \g__matapli_auteurs_webpage_tl,
  type .tl_gset:N = \g__matapli_auteurs_type_tl,
  affiliation .value_required:n = true,
  email .value_required:n = true,
  minibio .value_required:n = true,
  photo .value_required:n = true,
  webpage .value_required:n = true,
}

% commande qui ajoute aux variables globales de stockage de tous les auteur·e·s
%
\cs_new:Nn \__matapli_auteurs:nnnnnnnn
{
  \tl_put_right:Nn \g__matapli_auteurs_first_last_names_list_tl {{#1}}
  \tl_put_right:Nn \g__matapli_auteurs_affiliation_list_tl {{#2}}
  \tl_put_right:Nn \g__matapli_auteurs_type_list_tl {{#6}}
  \tl_put_right:Nn \g__matapli_auteurs_minibio_list_tl {{#4}}
  \tl_put_right:Nn \g__matapli_auteurs_photo_list_tl {{#5}}
  \tl_put_right:Nn \g__matapli_auteurs_webpage_list_tl {{#8}}
  \tl_put_right:Nn \g__matapli_auteurs_email_list_tl {{#3}}
  % \tl_item:Nn \g__matapli_auteurs_first_last_names_tl{1}
}
% variation pour permettre l'appel avec des variables
\cs_generate_variant:Nn \__matapli_auteurs:nnnnnnnn { nVVVVVxV }

% Redéfinition de la commande \author
% \author[ ⟨options⟩ ]{ ⟨Nom⟩ ,⟨Prénom⟩ }
% options sous forme clé=valeur :
% — affiliation  : qui permet d’indiquer l’affiliation de l’auteur ou de
% l’autrice, c’est-à-dire, son laboratoire, son université, son
% organisme de recherche, son entreprise, etc.
% – email : àqui permet d’indiquer l’email de l’auteur ou autrice. On
% veillera à mettre l'email en texte brut
% – minibio : qui permet d’indiquer une bibliographie courte
% qui est composée dans l’encart généré en fin d’article.
% – photo : qui permet d’afficher une photo dans l’encart généré
% en fin d’article. Il faut indiquer le nom du fichier (qui sera chargé par un
% \includegraphics ), avec s’il a lieu, le chemin pour y acceder.
% — webpage : qui permet de renseigner l’url d’une page web relative à
% l’auteur ou autrice qui sera composé dans l’encart généré en fin
% d’article
% – type : ⟨unique ou collectif⟩ qui permet de spécifier le type
% d’auteur pour permettre de renseigner un collectif (qui ne suit pas
% la structure nom, prénom). Les deux valeurs possibles
% sont unique ou collectif et la valeur par défaut est unique
\RenewDocumentCommand\author { o m } {
  % pour les clés à valeur par défaut
  \keys_set:nn { matapli/authors } { type=unique }
  \IfNoValueF {#1}
  {
    \keys_set:nn { matapli/authors } { #1 }
  }
  \tl_gset:Nn \l__matapli_auteurs_first_last_name_tl {#2}
  \__matapli_auteurs:nVVVVVxV
  {#2}
  {\g__matapli_auteurs_affiliation_tl}
  {\g__matapli_auteurs_email_tl}
  {\g__matapli_auteurs_minibio_tl}
  {\g__matapli_auteurs_photo_tl}
  {\g__matapli_auteurs_type_tl}
  {author-art-\int_use:N \g__matapli_articles_int}
  {\g__matapli_auteurs_webpage_tl}
  % on nettoie
  \tl_clear:N \g__matapli_auteurs_affiliation_tl
  \tl_clear:N \g__matapli_auteurs_type_tl
  \tl_clear:N \g__matapli_auteurs_auteurs_first_last_name_tl
  \tl_clear:N \g__matapli_auteurs_minibio_tl
  \tl_clear:N \g__matapli_auteurs_photo_tl
  \tl_clear:N \g__matapli_auteurs_email_tl
  \tl_clear:N \g__matapli_auteurs_webpage_tl
}

% on définit une variable pour écrire les fihiers externes.
\iow_new:N \g_auxfile_iow
\tl_new:N \l__matapli_auteurs_name_tl
\seq_new:N \l__matapli_names_seq


% commande à mettre à la fin de son article/chapitre ou la fin de sa partie
% pour générer la liste des auteurs et généré le cas échéant (s'il y a
% une minibio) des encarts avec la description des auteur·e·s.
\NewDocumentCommand\printauthors { o } {
  % on veut aligner les encart pour les auteurs et autrices en bas de page.
  ~\vfill
  \tl_clear:N \l__matapli_auteurs_name_tl
  \seq_clear:N \l__matapli_names_seq
  \cs_generate_variant:Nn \regex_split:nnN {nVN}
  % on fabrique un fichier auxiliare pour mettre le code \LaTeX
  % qui servira à afficher les auteur·e·s après le titre ou les sous parties
  \str_if_eq:nnTF{#1}{partie}{% si fonction appelée dans la partie
    \iow_open:Nn \g_auxfile_iow {\jobname-chap\int_use:N \g__matapli_articles_int-p\int_use:N \g__matapli_parties_int.aux}
  }{ % sinon
    \iow_open:Nn \g_auxfile_iow {\jobname-chap\int_use:N \g__matapli_articles_int.aux}
  }
  \iow_now:Nn \g_auxfile_iow {\begin{matapliauteurtitre}} % on commence par centrer le texte
    % on parcours tous les éléments des listes d'auteur·e·s
  \int_step_inline:nn {\tl_count:N \g__matapli_auteurs_first_last_names_list_tl}{
    %   % get the ##1-th element from \l_student_group_tl
    \tl_set:Nx \l__matapli_auteur_type_tl {\tl_item:Nn\g__matapli_auteurs_type_list_tl{##1}}
    \str_if_eq:VnTF{\l__matapli_auteur_type_tl}{unique}{ % si on a un nom propre
      \tl_set:Nx \l__matapli_auteurs_name_tl {\tl_item:Nn \g__matapli_auteurs_first_last_names_list_tl {##1}}
      \regex_split:nVN {,} \l__matapli_auteurs_name_tl \l__matapli_names_seq
      \tl_set:Nx \l__matapli_auteur_email_tl {\tl_item:Nn \g__matapli_auteurs_email_list_tl {##1}}
      \tl_if_empty:NTF{\l__matapli_auteur_email_tl}{%true
        \str_set:Nn \l__matapli_auteur_email_str {}
      }{% false
        \str_set:Nx \l__matapli_auteur_email_str {\tl_item:Nn\g__matapli_auteurs_email_list_tl{##1}}
      }
      \iow_now:Nx \g_auxfile_iow {%
        \seq_item:Nn\l__matapli_names_seq {2}~ % prenom
        \token_to_str:N \bsc \iow_char:N \{
        \seq_item:Nn\l__matapli_names_seq {1}\iow_char:N \} %nom
        \tl_if_empty:NTF{\l__matapli_auteur_email_tl}{
          % rien
        }{%False
          \token_to_str:N \footnote \iow_char:N \{\token_to_str:N \url \iow_char:N \{
          \l__matapli_auteur_email_str
          \iow_char:N \}\iow_char:N \}
        }
      }
      \tl_set:Nx \l__matapli_aff_tl {\tl_item:Nn \g__matapli_auteurs_affiliation_list_tl {##1}}
      \tl_if_empty:NTF{\l__matapli_aff_tl}{ % si l'affiliation est vide
        \iow_now:Nx \g_auxfile_iow {
          \token_to_str:N \par
        }  % en revient à la ligne
      }{% sinon
        \iow_now:Nx \g_auxfile_iow {---~
          \tl_item:Nn \g__matapli_auteurs_affiliation_list_tl {##1}
          \token_to_str:N \par
        }
      }
    }{% s'il s'agit d'un collectif
      \iow_now:Nx \g_auxfile_iow {%
        \tl_item:Nn \g__matapli_auteurs_first_last_names_list_tl {##1}
        \token_to_str:N \par
      }
    }
    \tl_set:Nx \l__matapli_bio_tl {\tl_item:Nn \g__matapli_auteurs_minibio_list_tl {##1}}
    \tl_if_empty:NTF{\l__matapli_bio_tl}{}{
      % si on a une bio
      \begin{matapli@auteur}{%
          \str_if_eq:VnTF{\l__matapli_auteur_type_tl}{unique}{ % si on a un nom propre
            \seq_item:Nn\l__matapli_names_seq {2}~ % prenom
            \bsc{\seq_item:Nn\l__matapli_names_seq {1}} %nom
          }{%
            \tl_item:Nn \g__matapli_auteurs_first_last_names_list_tl {##1}
          }
        }
        \tl_set:Nx \l__matapli_photo_tl {\tl_item:Nn \g__matapli_auteurs_photo_list_tl {##1}}
        \tl_if_empty:NTF{\l__matapli_photo_tl}{% pas de photo
          \tl_item:Nn \g__matapli_auteurs_minibio_list_tl {##1}
        }{% si photo
          \noindent\begin{tabularx}{0.9\linewidth}{c>{\raggedright}p{0.7\linewidth}}
            \includegraphics[width=0.18\linewidth,valign=T]{\tl_item:Nn \g__matapli_auteurs_photo_list_tl {##1}} & \tl_item:Nn \g__matapli_auteurs_minibio_list_tl {##1}\par

            \tl_if_empty:NTF{\l__matapli_auteur_email_tl}{}{\textbf{Email~:}~\url{\tl_item:Nn \g__matapli_auteurs_email_list_tl {##1}}\par}
            \tl_set:Nx \l__matapli_auteur_webpage_tl {\tl_item:Nn \g__matapli_auteurs_webpage_list_tl {##1}}
            \tl_if_empty:NTF{\l__matapli_auteur_webpage_tl}{}{\textbf{Site~web~:}~\url{\tl_item:Nn \g__matapli_auteurs_webpage_list_tl {##1}}}


          \end{tabularx}
        }
      \end{matapli@auteur}
    }

  } % fin boucle auteurs
  \clearpage % on change de page avant
  \iow_now:Nn \g_auxfile_iow {\end{matapliauteurtitre}}
\iow_close:N \g_auxfile_iow
\tl_clear:N \g__matapli_auteurs_first_last_names_list_tl
\tl_clear:N \g__matapli_auteurs_affiliation_list_tl
\tl_clear:N \g__matapli_auteurs_type_list_tl
\tl_clear:N \g__matapli_auteurs_auteurs_first_last_name_list_tl
\tl_clear:N \g__matapli_auteurs_minibio_list_tl
\tl_clear:N \g__matapli_auteurs_photo_list_tl
\tl_clear:N \g__matapli_auteurs_email_list_tl
\tl_clear:N \g__matapli_auteurs_webpage_list_tl
}

% lecture du fichier auxiliaire pour affichage des auteurs après le titre d'article/chapitre
% ou le titre de la partie.
\NewDocumentCommand\__matapli_markauteurs { o } {
  \str_if_eq:nnTF{#1}{partie}{% si fonction appelée dans la partie
    \file_if_exist:nTF {\jobname-chap\int_use:N \g__matapli_articles_int-p\int_use:N \g__matapli_parties_int.aux}
    {
      \input{\jobname-chap\int_use:N \g__matapli_articles_int-p\int_use:N \g__matapli_parties_int.aux}
    }{}
  }{%
    \file_if_exist:nTF {\jobname-chap\int_use:N \g__matapli_articles_int.aux}
    {
      \input{\jobname-chap\int_use:N \g__matapli_articles_int.aux}
    }{}
  }
}
\ExplSyntaxOff

% environnement pour le formattage des auteur·e·s après le titre de l'article
\newenvironment{matapliquote}%
  {\list{}{\leftmargin=1in\rightmargin=1in}\item[]}%
  {\endlist}
\newenvironment{matapliauteurtitre}{
  \begin{matapliquote}
    \small
  \itshape par :\vspace*{-0.4cm}\par
  \hrulefill\vspace*{-0.3cm}
  \flushright
}
{\end{matapliquote}\bigskip
}

% environnement interne de formattage de la présentation des auteur·e·s
\newenvironment{matapli@auteur}[1]{%
  \setlength{\logowidth}{17pt}
  \tcbset{%
    arc=0pt,outer arc=0pt,colback=gray!10!white,colframe=gray!80!white,
    boxsep=0pt,left=5pt,right=5pt,top=5pt,bottom=5pt, bottomtitle = 3pt, toptitle=3pt,
    boxrule=0pt,bottomrule=0.5pt,toprule=0.5pt}
  \medskip
  \begin{tcolorbox}[title={\large\bfseries #1}]%
    \small
  }%
  {\end{tcolorbox}\medskip}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% definition des entetes et pied de page  %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usetikzlibrary{calc}
\renewcommand{\headrulewidth}{0pt}


\fancyhead{}
\fancyhead[E]{
  \begin{tikzpicture}[overlay, remember picture]%
    \fill[principale] ($(current page.north west)-(0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.north east)+(0.1\hoffset,-0.8in)$);
    \node[anchor=north west, text=white, font=\large\scshape\bfseries,
    minimum size=1in, inner xsep=5mm] at (current page.north
    west) {\leftmark};
    %\node[anchor=north east, minimum size=1in, inner
    %xsep=5mm] at (current page.north east)
    %{\rightmark};
  \end{tikzpicture}
}
\fancyhead[O]{
  \begin{tikzpicture}[overlay, remember picture]%
    \fill[principale] ($(current page.north west)-(0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.north east)+(0.1\hoffset,-0.8in)$);
    %\node[anchor=north east, text=white, font=\large\scshape\bfseries,
    %minimum size=1in, inner xsep=5mm] at (current page.north
    %east) {\leftmark};
    \node[anchor=north east, minimum size=1in, inner
    xsep=5mm] at (current page.north east)
    {\rightmark};
  \end{tikzpicture}
}
\fancyfoot{}
\fancyfoot[RO]{
  \begin{tikzpicture}[overlay, remember picture]%
    \fill[principale] ($(current page.south west)+(-0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.south east)-(-0.1\hoffset,-0.5in)$);
    \node[anchor=south east, text=white, font=\Large\scshape,
    inner
    xsep=5mm] at ($(current page.south
    east)+(0,0.15in)$) {\thepage};
  \end{tikzpicture}
}
\fancyfoot[LE]{
  \begin{tikzpicture}[overlay, remember picture]%
    \fill[principale] ($(current page.south west)+(-0.1\hoffset,-0.07\voffset)$) rectangle ($(current
    page.south east)-(-0.1\hoffset,-0.5in)$);
    \node[anchor=south west, text=white, font=\Large\scshape,
    inner
    xsep=5mm] at ($(current page.south
    west)+(0,0.15in)$) {\thepage};
  \end{tikzpicture}
}

\fancypagestyle{titreHDR}{\fancyhead{}
  \fancyfoot{}
  \fancyfoot[RO]{
    \begin{tikzpicture}[overlay, remember picture]%
      \fill[principale] ($(current page.south west)+(-0.1\hoffset,-0.07\voffset)$) rectangle ($(current
      page.south east)-(-0.1\hoffset,-0.5in)$);
      \node[anchor=south east, text=white, font=\Large\scshape,
      inner
      xsep=5mm] at ($(current page.south
      east)+(0,0.15in)$) {\thepage};
    \end{tikzpicture}
  }
  \fancyfoot[LE]{
    \begin{tikzpicture}[overlay, remember picture]%
      \fill[principale] ($(current page.south west)+(-0.1\hoffset,-0.07\voffset)$) rectangle ($(current
      page.south east)-(-0.1\hoffset,-0.5in)$);
      \node[anchor=south west, text=white, font=\Large\scshape,
      inner
      xsep=5mm] at ($(current page.south
      west)+(0,0.15in)$) {\thepage};
    \end{tikzpicture}
  }

}

\pagestyle{fancy}

\renewcommand{\chaptermark}[1]{\markboth{#1}{\sffamily
    MATAPLI  \no\numero~ --- \mois}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% fin definition des entetes et pied de page  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Rubrique soutenances de thèse %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% commande pour les soutenances de thèses de doctorat
% 4 arguments :
% - #1 nom du, de la docteure
% - #2 date et lieu
% - #3 titre
% - #4 nom du ou de la directrice
\newenvironment{soutenance}[4]{
  \begin{tcolorbox}[
    colback=gray!5!white,
    boxrule=0pt,
    boxsep=0pt,
    breakable,
    enhanced jigsaw,
    borderline west={2pt}{0pt}{principale},
    %colbacktitle={black},
    ]
  \noindent $\blacktriangleright$~\textit{Thèse soutenue par} : \textbf{#1}\par\smallskip
  \noindent$\blacktriangleright$~\textit{Sous la direction de } : #4\par
  \begin{center}
    \interlinepenalty10000
    \hrule\medskip
    {\bfseries\ignorespaces#3\unskip}\par
    \penalty10000  \vskip3pt plus 3pt
    {\slshape\ignorespaces#2\unskip}
    \medskip\hrule
  \end{center}
  \noindent\textbf{Résumé : }
}
{\end{tcolorbox}\bigskip}

% commande pour les soutenances d'HDR
% 3 arguments
% - #1 nom
% - #2 date et lieu
% - #3 titre
\newenvironment{soutenanceHDR}[3]{
  \begin{tcolorbox}[
    colback=gray!5!white,
    boxrule=0pt,
    boxsep=0pt,
    breakable,
    enhanced jigsaw,
    borderline west={2pt}{0pt}{principale},
    % colbacktitle={black},
    ]
    \noindent $\blacktriangleright$~\textit{Habilitation soutenue par} : \textbf{#1}\par\smallskip
    \begin{center}
      \interlinepenalty10000
      \hrule\medskip
      {\bfseries\ignorespaces#3\unskip}\par
      \penalty10000  \vskip3pt plus 3pt
      {\slshape\ignorespaces#2\unskip}
      \medskip\hrule
    \end{center}
    \noindent\textbf{Résumé : }
  }
  {\end{tcolorbox}\bigskip}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% fin Rubrique soutenances de thèse %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Rubrique correspondant        %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% pour l'affichage des correspondant·e·s
% 3 arguments :
% - #1 ville
% - #2 Nom Prénom
% - #3 laboratoire/université
% - #4 email
\newcommand{\correspondant}[4]{%
  \noindent%
  \begin{empty}
    \small%
    \renewcommand{\arraystretch}{0.9}%
    \begin{minipage}{0.95\columnwidth}
      \setlength{\baselineskip}{0.9\baselineskip}
      {\textbf{#1}\hfill\textit{#2}}\\
      #3\\
      \texttt{#4}
    \end{minipage}
  \end{empty}
}

\let\corrsp\correspondant
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Fin Rubrique correspondant    %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Rubrique colloque             %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pour la composition des colloques
% 3 arguments :
% - #1 : Titre du colloque
% - #2 : date et lieu
% - #3 : site web à ne pas mettre dans un \url
\newcommand\colloque[3]{%
\noindent$\blacktriangleright$~\textsc{#1}\\
\textit{#2}\\
\url{#3}\\[0.4em]
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Fin Rubrique colloque             %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% itemize
\setlist[itemize,1]{label={\color{principale}\small$\blacksquare$}}

\renewcommand\thefigure{\arabic{figure}}
\renewcommand\thetable{\arabic{table}}
\renewcommand\theequation{\arabic{equation}}





% environnement d'affichage d'un bloc avec titre.
% \begin{bloc}{Titre}
%   ... contenu
% \end{bloc}
\newenvironment{bloc}[1][]{%
  \tcbset{%
    arc=0pt,outer
    arc=0pt,colback=gray!10!white,colframe=principale,
    boxsep=0pt,left=10pt,right=10pt,top=8pt,bottom=10pt,
    bottomtitle = 3pt, toptitle=3pt,
    boxrule=0pt,bottomrule=0.5pt,toprule=0.5pt,
    fonttitle=\scshape\bfseries}
  \medskip
  \begin{tcolorbox}[halign=center,title={#1}]}%
  {\end{tcolorbox}\medskip
}



\RequirePackage[tikz]{bclogo}
\RequirePackage{lettrine}
% environnement Important, sans titre, avec
% ajout d'une icone important au début du texte
% \begin{Important}
%   ......
% \end{Important}
\newenvironment{Important}{%
  \setlength{\logowidth}{24pt}
  \tcbset{%
    arc=0pt,outer arc=0pt,colback=gray!10!white,colframe=gray!60!white,
    boxsep=0pt,left=5pt,right=5pt,top=5pt,bottom=5pt, bottomtitle = 3pt, toptitle=3pt,
    boxrule=0pt,bottomrule=0.5pt,toprule=0.5pt}
  \medskip
  \begin{tcolorbox}%
    \lettrine[
    % lines=2,
    % lraise=0.05,
    findent=.5em]{\bcinfo}{}
  }%
  {\end{tcolorbox}\medskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% les articles interview %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% commande pour composer une question dans un article/chapitre/partie
% de type interview
% \MatapliQuestion[optionel]{Question} où l'argument optionel est le nom de
% la personne ou organisme qui pose la question
\NewDocumentCommand\MatapliQuestion { o m } {
  \par\bigskip\noindent
  \begingroup%
  \bfseries
  \bgroup\color{principale}$\blacktriangleright$
  \IfNoValueTF {#1}{ %
  }%
  {%
    #1 :
  }%
  \egroup
  {#2}
  \endgroup
  \smallskip
}
% commande pour composer la réponse à une question dans un
% article/chapitre/partie de type interview
% \MatapliReponse{Nom}{Réponse}
\newcommand\MatapliReponse[2]{\par\noindent\textbf{\color{principale}$\blacktriangleright$
    #1 :~} {\itshape #2}}


% la famille de font par défault
\renewcommand{\familydefault}{\sfdefault}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Les théorèmes etc. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tcbuselibrary{theorems}
\newtcbtheorem[number within=chapter,
number freestyle={\noexpand\arabic{\tcbcounter}},
]{theorem}{Théorème}%
{ breakable,  arc=0pt,outer
  arc=0pt,colback=gray!10!white,colframe=principale,
  boxsep=0pt,left=10pt,right=10pt,top=8pt,bottom=10pt,
  bottomtitle = 3pt, toptitle=3pt,
  boxrule=0pt,bottomrule=0.5pt,toprule=0.5pt,
  fonttitle=\scshape\bfseries\hypersetup{hidelinks},
  separator sign={~: }}{th}

\newtcbtheorem[number within=chapter,
number freestyle={\noexpand\arabic{\tcbcounter}},
]{definition}{Définition}%
{  breakable, arc=0pt,outer
  arc=0pt,colback=gray!10!white,colframe=secondaire,
  boxsep=0pt,left=10pt,right=10pt,top=8pt,bottom=10pt,
  bottomtitle = 3pt, toptitle=3pt,
  boxrule=0pt,bottomrule=0.5pt,toprule=0.5pt,
  fonttitle=\scshape\bfseries\hypersetup{hidelinks},
  separator sign={~: }}{def}

\newtheorem{lemma}{Lemme}[chapter]
\renewcommand{\thelemma}{\arabic{lemma}}
\newtheorem{corollary}{Corollaire}[chapter]
\renewcommand{\thecorollary}{\arabic{corollary}}

\newtheorem*{remark}{Remarque}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  couverture %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% commande pour composer les rédacteurs et rédactrices du comité
% de rédaction de la revue
% 4 arguments
% #1 : le titre ou le thèmes
% #2 : le prénom nombre
% #3 : l'affiliation (labo et université)
% #4 : l'adresse email (ajouter \url pour permettre plusieurs emails)
\newcommand\redacteurMatapli[4]{%
  \medskip
  {\textbf{#1}\hfill\textbf{#2}}\par
  {\small
    \hfill\begin{minipage}{\dimexpr\textwidth-0.5cm}
      \noindent#3\hfill{\scriptsize#4}
    \end{minipage}\par
  }
}

% commande pour créditer les illustrations de la couverture en deuxième de couverture
\newcommand\creditcouverture[1]{\marginpar{
\hspace*{2cm}
\rotatebox{90}{
\scriptsize \itshape Couverture : #1}
}
}
