%%
%% This is file `udes-genie-these.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% udes-genie-these.dtx  (with options: `these')
%% 
%% Copyright 2023 Charles-Antoine Brunet
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Charles-Antoine Brunet and
%%   can be contacted at Charles-Antoine.Brunet@USherbrooke.ca
%% 
%% This work consists of the files udes-genie-these.dtx and udes-genie-these.ins
%% and the derived files udes-genie-these.cls.
%% 
%% udes-genie-these.dtx
%% Copyright 2023 Charles-Antoine Brunet
%%
%%-----------------------------------------------------------------------------
%%---   IDENTIFICATION   ------------------------------------------------------
%%-----------------------------------------------------------------------------

\ProvidesExplClass{udes-genie-these}{2023/09/01}{3.1.0}
  {Université de Sherbrooke, Faculté de génie: classe de document pour thèses, mémoires, DPR et essais}

%%-----------------------------------------------------------------------------
%%---   DECLARATION DES VARIABLES   -------------------------------------------
%%-----------------------------------------------------------------------------
\bool_new:N \g__udesgeniethese_autobib_bool
\bool_new:N \g__udesgeniethese_legendes_min_bool
\bool_new:N \g__udesgeniethese_lignes_bool
\bool_new:N \g__udesgeniethese_liste_figures_bool
\bool_new:N \g__udesgeniethese_liste_tableaux_bool

\clist_new:N \g__udesgeniethese_dedicace_cl
\clist_new:N \g__udesgeniethese_fichiers_references_cl
\clist_new:N \g__udesgeniethese_jury_codirecteurs_cl
\clist_new:N \g__udesgeniethese_jury_evaluateurs_cl
\clist_new:N \g__udesgeniethese_pas_jury_cl
\clist_new:N \g__udesgeniethese_remerciements_cl
\clist_new:N \g__udesgeniethese_specialite_cl

\int_new:N \g__udesgeniethese_pages_int
\int_new:N \l__udesgeniethese_tmp_int

\seq_new:N \g__udesgeniethese_jury_codirecteurs_mf_seq
\seq_new:N \g__udesgeniethese_jury_evaluateurs_mf_seq

\tl_new:N \g__udesgeniethese_acknowledgementsname_tl
\tl_new:N \g__udesgeniethese_adressname_tl
\tl_new:N \g__udesgeniethese_auteur_nom_tl
\tl_new:N \g__udesgeniethese_auteur_prenom_tl
\tl_new:N \g__udesgeniethese_date_annee_tl
\tl_new:N \g__udesgeniethese_date_mois_tl
\tl_new:N \g__udesgeniethese_dedicace_tl
\tl_new:N \g__udesgeniethese_departement_tl
\tl_new:N \g__udesgeniethese_dprdoctorat_tl
\tl_new:N \g__udesgeniethese_dprmaitrise_tl
\tl_new:N \g__udesgeniethese_essai_tl
\tl_new:N \g__udesgeniethese_facultyname_tl
\tl_new:N \g__udesgeniethese_fichier_acronymes_tl
\tl_new:N \g__udesgeniethese_fichier_lexique_tl
\tl_new:N \g__udesgeniethese_fichier_remerciements_tl
\tl_new:N \g__udesgeniethese_fichier_resume_anglais_tl
\tl_new:N \g__udesgeniethese_fichier_resume_francais_tl
\tl_new:N \g__udesgeniethese_fichier_symboles_tl
\tl_new:N \g__udesgeniethese_format_tl
\tl_new:N \g__udesgeniethese_juryname_tl
\tl_new:N \g__udesgeniethese_jury_codirname_tl
\tl_new:N \g__udesgeniethese_jury_codirnamef_tl
\tl_new:N \g__udesgeniethese_jury_directeur_tl
\tl_new:N \g__udesgeniethese_jury_directeur_mf_tl
\tl_new:N \g__udesgeniethese_jury_dirname_tl
\tl_new:N \g__udesgeniethese_jury_dirnamef_tl
\tl_new:N \g__udesgeniethese_jury_evalname_tl
\tl_new:N \g__udesgeniethese_jury_evalnamef_tl
\tl_new:N \g__udesgeniethese_langue_tl
\tl_new:N \g__udesgeniethese_listacronymsname_tl
\tl_new:N \g__udesgeniethese_listsymbolsname_tl
\tl_new:N \g__udesgeniethese_memoire_tl
\tl_new:N \g__udesgeniethese_mots_cles_anglais_tl
\tl_new:N \g__udesgeniethese_mots_cles_francais_tl
\tl_new:N \g__udesgeniethese_motsclesname_tl
\tl_new:N \g__udesgeniethese_programme_tl
\tl_new:N \g__udesgeniethese_references_engin_tl
\tl_new:N \g__udesgeniethese_specialite_tl
\tl_new:N \g__udesgeniethese_specialityname_tl
\tl_new:N \g__udesgeniethese_style_references_tl
\tl_new:N \g__udesgeniethese_these_tl
\tl_new:N \g__udesgeniethese_titre_anglais_tl
\tl_new:N \g__udesgeniethese_titre_francais_tl
\tl_new:N \g__udesgeniethese_type_tl
\tl_new:N \g__udesgeniethese_udesname_tl

%%-----------------------------------------------------------------------------
%%---   DECLARATION DES CONSTANTES   ------------------------------------------
%%-----------------------------------------------------------------------------
\int_const:Nn \c__udesgeniethese_max_pages_dprdoctorat_int {40}
\int_const:Nn \c__udesgeniethese_max_pages_dprmaitrise_int {25}
\int_const:Nn \c__udesgeniethese_max_pages_essai_int {70}
\int_const:Nn \c__udesgeniethese_max_pages_memoire_int {120}
\int_const:Nn \c__udesgeniethese_max_pages_these_int {250}

\tl_const:Nn \c__udesgeniethese_female_tl {f}
\tl_const:Nn \c__udesgeniethese_format_livre_tl {livre}
\tl_const:Nn \c__udesgeniethese_format_simple_tl {simple}
\tl_const:Nn \c__udesgeniethese_langue_english_tl {english}
\tl_const:Nn \c__udesgeniethese_langue_francais_tl {francais}
\tl_const:Nn \c__udesgeniethese_male_tl {m}
\tl_const:Nn \c__udesgeniethese_programme_aero_tl {aerospatial}
\tl_const:Nn \c__udesgeniethese_programme_chim_tl {chimique}
\tl_const:Nn \c__udesgeniethese_programme_civil_tl {civil}
\tl_const:Nn \c__udesgeniethese_programme_elec_tl {electrique}
\tl_const:Nn \c__udesgeniethese_programme_meca_tl {mecanique}
\tl_const:Nn \c__udesgeniethese_references_biblatex_tl {biblatex}
\tl_const:Nn \c__udesgeniethese_references_bibtex_tl {bibtex}
\tl_const:Nn \c__udesgeniethese_type_dprdoctorat_tl {dprdoctorat}
\tl_const:Nn \c__udesgeniethese_type_dprmaitrise_tl {dprmaitrise}
\tl_const:Nn \c__udesgeniethese_type_essai_tl {essai}
\tl_const:Nn \c__udesgeniethese_type_memoire_tl {memoire}
\tl_const:Nn \c__udesgeniethese_type_these_tl {these}

%%-----------------------------------------------------------------------------
%%---   INITIALISATION DE VARIABLES   -----------------------------------------
%%-----------------------------------------------------------------------------
\tl_gset_eq:NN \g__udesgeniethese_references_engin_tl \c__udesgeniethese_references_bibtex_tl
\tl_gset:Nn \g__udesgeniethese_style_references_tl {plain}

%% Identifie les types de documents avec dedicace (optionnelle)
\clist_gput_right:Nx \g__udesgeniethese_dedicace_cl
  {\c__udesgeniethese_type_essai_tl, \c__udesgeniethese_type_memoire_tl, \c__udesgeniethese_type_these_tl}
%% Identifie les types de documents sans jury
\clist_gput_right:Nx \g__udesgeniethese_pas_jury_cl
  {\c__udesgeniethese_type_essai_tl}
%% Identifie les types de documents avec remerciements (optionnels)
\clist_gput_right:Nx \g__udesgeniethese_remerciements_cl
  {\c__udesgeniethese_type_essai_tl, \c__udesgeniethese_type_memoire_tl, \c__udesgeniethese_type_these_tl}
%% Identifie les types de documents avec specialite
\clist_gput_right:Nx \g__udesgeniethese_specialite_cl
  {\c__udesgeniethese_type_memoire_tl, \c__udesgeniethese_type_these_tl}

%%-----------------------------------------------------------------------------
%%---   MESSAGES D'ERREURS   --------------------------------------------------
%%-----------------------------------------------------------------------------
\msg_new:nnnn {udesgeniethese}{erreur_format}{Un~LaTeX~plus~récent~est~nécessaire.~Veuillez~mettre~à~jour~votre~distribution~LaTeX.}{Le~format~2022-06-01~ou~un~plus~récent~est~nécessaire.}

\msg_new:nnnn {udesgeniethese}{biblatex_en_trop}{Avec~l'option~bibtex,~il~ne~faut~pas~charger~le~package~biblatex.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{biblatex_manquant}{L'option~biblatex~requiert~de~charger~le~package~biblatex~dans~le~preambule.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{auteur_nom_vide}{Le~nom~de~l'auteur~du~document~n'est~pas~specifie.~Specifiez-le~avec~la~macro~\Auteur~dans~le~preambule.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{auteur_prenom_vide}{Le~prenom~de~l'auteur~du~document~n'est~pas~specifie.~Specifiez-le~avec~la~macro~\Auteur~dans~le~preambule.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{config_fichier_vide}{Le~fichier~pour~#1~n'est~pas~specifie.~Specifiez-le~avec~la~cle~'#2'~dans~la~configuration~du~document.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{config_fichiers_vides}{Les~fichiers~pour~#1~ne~sont~pas~specifies.~Specifiez-les~avec~la~cle~'#2'~dans~la~configuration~du~document.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{config_langue_vide}{La~langue~principale~du~document~n'est~pas~specifiee.~Specifiez-la~avec~la~cle~'langue'~dans~la~configuration~du~document.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{config_programme_vide}{Le~programme~du~document~n'est~pas~specifie.~Specifiez-le~avec~la~cle~'programme'~dans~la~configuration~du~document.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{config_type_vide}{Le~type~du~document~n'est~pas~specifie.~Specifiez-le~avec~la~cle~'type'~dans~la~configuration~du~document.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{date_annee_vide}{L'annee~de~la~date~du~document~n'est~pas~specifiee.~Specifiez-la~avec~la~macro~\Date~dans~le~preambule.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{date_mois_vide}{Le~mois~de~la~date~du~document~n'est~pas~specifie.~Specifiez-le~avec~la~macro~\Date~dans~le~preambule.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{dprdoctorat_max_pages}{La~DPR~de~doctorat~semble~longue.~Le~protocole~exige~un~maximum~de~40~pages.}{Consultez~le~protocole~de~redaction.}

\msg_new:nnnn {udesgeniethese}{dprmaitrise_max_pages}{La~DPR~de~maitrise~semble~longue.~Le~protocole~exige~un~maximum~de~25~pages.}{Consultez~le~protocole~de~redaction.}

\msg_new:nnnn {udesgeniethese}{essai_max_pages}{L'essai~semble~long.~Le~protocole~exige~un~maximum~de~70~pages.}{Consultez~le~protocole~de~redaction.}

\msg_new:nnnn {udesgeniethese}{memoire_max_pages}{Le~memoire~semble~long.~Le~protocole~exige~un~maximum~de~120~pages.}{Consultez~le~protocole~de~redaction.}

\msg_new:nnnn {udesgeniethese}{mots_cles_anglais_vide}{Les~mots-cles~anglais~ne~sont~pas~specifies.~Specifiez-les~avec~la~macro~\MotsClesAnglais~dans~le~preambule.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{mots_cles_francais_vide}{Les~mots-cles~francais~ne~sont~pas~specifies.~Specifiez-les~avec~la~macro~\MotsClesFrancais~dans~le~preambule.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{remerciements_longs}{Les~remerciements~doivent~etre~d'une~page~maximum.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{resume_anglais_long}{Le~resume~anglais~doit~etre~d'une~page~maximum,~incluant~les~mots-cles.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{titre_resume_mots_cles_anglais}{Le~titre,~le~resume~et~les~mots-cles~anglais~doivent~etre~donnes.~On~ne~peut~donner~l'un~sans~les~autres.}{Consultez~la~documentation.}

\msg_new:nnnn {udesgeniethese}{resume_francais_long}{Le~resume~francais~doit~etre~d'une~page~maximum,~incluant~les~mots-cles.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{these_max_pages}{La~these~semble~longue.~Le~protocole~exige~un~maximum~de~250~pages}{Consultez~le~protocole~de~redaction.}

\msg_new:nnnn {udesgeniethese}{titre_anglais_vide}{Le~titre~anglais~du~document~n'est~pas~specifie.~Specifiez-le~avec~la~macro~\TitreAnglais~dans~le~preambule.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{titre_francais_vide}{Le~titre~francais~du~document~n'est~pas~specifie.~Specifiez-le~avec~la~macro~\TitreFrancais~dans~le~preambule.}{Consultez~la~documentation~de~la~classe.}

\msg_new:nnnn {udesgeniethese}{aerospatial}{Le~type~du~document~doit~etre~essai~si~le~programme~est~aerospatial.~Specifiez-le~~bon~type~dans~la~configuration~du~document.}{Consultez~la~documentation~de~la~classe.}

%%-----------------------------------------------------------------------------
%%---   OPTIONS DE CLASSE   ---------------------------------------------------
%%-----------------------------------------------------------------------------
\IfFormatAtLeastTF {2022-06-01}
  {}{\msg_fatal:nn{udesgeniethese}{erreur_format}}

\DeclareKeys
{
  biblatex .code:n = {\tl_gset_eq:NN \g__udesgeniethese_references_engin_tl \c__udesgeniethese_references_biblatex_tl},
  biblatex .usage:n = load,
  bibtex .code:n = {\tl_gset_eq:NN \g__udesgeniethese_references_engin_tl \c__udesgeniethese_references_bibtex_tl},
  bibtex .usage:n = load,
  livre .code:n = {
    \PassOptionsToClass{twoside,openright}{book}
    \PassOptionsToPackage{twoside=true}{geometry}
    \tl_gset_eq:NN \g__udesgeniethese_format_tl \c__udesgeniethese_format_livre_tl
  },
  livre .usage:n = load,
  simple .code:n = {
    \PassOptionsToClass{oneside,openany}{book}
    \PassOptionsToPackage{twoside=false}{geometry}
    \tl_gset_eq:NN \g__udesgeniethese_format_tl \c__udesgeniethese_format_simple_tl
  },
  simple .usage:n = load,
  unknown .code:n = {\PassOptionsToClass{\CurrentOption}{book}},
}

\SetKeys{livre}

\ProcessKeyOptions

%%-----------------------------------------------------------------------------
%%---   DEPENDANCES DE CLASSE   -----------------------------------------------
%%-----------------------------------------------------------------------------
\LoadClass[letterpaper,12pt]{book}

\RequirePackage[english,french]{babel}
\RequirePackage{caption,fancyhdr,flafter,geometry,parskip,setspace}

%%-----------------------------------------------------------------------------
%%---   MACROS DE DOCUMENT (USAGER)   --------------------------------------
%%-----------------------------------------------------------------------------
\DeclareDocumentCommand \ConfigurationDocument { m }
{ \keys_set:nn { udes-genie-these } { #1 } }

\keys_define:nn {udes-genie-these}
{
  langue .choices:nn = {francais,english}
    {\tl_gset_eq:NN \g__udesgeniethese_langue_tl \l_keys_choice_tl},
  langue .value_required:n = true,
  type .choices:nn = {dprmaitrise,dprdoctorat,essai,memoire,these}
    {\tl_gset_eq:NN \g__udesgeniethese_type_tl \l_keys_choice_tl},
  type .value_required:n = true,
  programme .choices:nn = {electrique,mecanique,aerospatial,chimique,civil}
    {\tl_gset_eq:NN \g__udesgeniethese_programme_tl \l_keys_choice_tl},
  programme .value_required:n = true,
  liste-figures .bool_gset:N = \g__udesgeniethese_liste_figures_bool,
  liste-figures .default:n = true,
  liste-tableaux .bool_gset:N = \g__udesgeniethese_liste_tableaux_bool,
  liste-tableaux .default:n = true,
  lignes .bool_gset:N = \g__udesgeniethese_lignes_bool,
  lignes .default:n = true,
  fichier-resume-francais .tl_gset:N = \g__udesgeniethese_fichier_resume_francais_tl,
  fichier-resume-francais .value_required:n = true,
  fichier-resume-anglais .tl_gset:N = \g__udesgeniethese_fichier_resume_anglais_tl,
  fichier-resume-anglais .value_required:n = true,
  fichier-remerciements .tl_gset:N = \g__udesgeniethese_fichier_remerciements_tl,
  fichier-remerciements .value_required:n = true,
  fichier-lexique .tl_gset:N = \g__udesgeniethese_fichier_lexique_tl,
  fichier-lexique .value_required:n = true,
  fichier-symboles .tl_gset:N = \g__udesgeniethese_fichier_symboles_tl,
  fichier-symboles .value_required:n = true,
  fichier-acronymes .tl_gset:N = \g__udesgeniethese_fichier_acronymes_tl,
  fichier-acronymes .value_required:n = true,
  fichiers-references .clist_gset:N = \g__udesgeniethese_fichiers_references_cl,
  fichiers-references .value_required:n = true,
  style-references .tl_gset:N = \g__udesgeniethese_style_references_tl,
  style-references .value_required:n = true,
  auto-bib .bool_gset:N = \g__udesgeniethese_autobib_bool,
  auto-bib .default:n = true,
  legendes-min .bool_gset:N = \g__udesgeniethese_legendes_min_bool,
  legendes-min .default:n = true,
}

\DeclareDocumentCommand \Auteur {mm}
{
  \tl_gset:Nn \g__udesgeniethese_auteur_prenom_tl {#1}
  \tl_gset:Nn \g__udesgeniethese_auteur_nom_tl {#2}
}

\DeclareDocumentCommand \Date {mm}
{
  \tl_gset:Nn \g__udesgeniethese_date_mois_tl {#1}
  \tl_gset:Nn \g__udesgeniethese_date_annee_tl {#2}
}

\DeclareDocumentCommand \Dedicace {+m}
{ \tl_gset:Nn \g__udesgeniethese_dedicace_tl {#1} }

\DeclareDocumentCommand \Directeur {mm}
{
  \tl_gset:Nn \g__udesgeniethese_jury_directeur_tl {#1\ #2}
  \tl_gset_eq:NN \g__udesgeniethese_jury_directeur_mf_tl \c__udesgeniethese_male_tl
}

\DeclareDocumentCommand \Directrice {mm}
{
  \tl_gset:Nn \g__udesgeniethese_jury_directeur_tl {#1\ #2}
  \tl_gset_eq:NN \g__udesgeniethese_jury_directeur_mf_tl \c__udesgeniethese_female_tl
}

\DeclareDocumentCommand \Codirecteur {mm}
{
  \clist_gput_right:Nn \g__udesgeniethese_jury_codirecteurs_cl {#1\ #2}
  \seq_gput_right:NV \g__udesgeniethese_jury_codirecteurs_mf_seq \c__udesgeniethese_male_tl
}

\DeclareDocumentCommand \Codirectrice {mm}
{
  \clist_gput_right:Nn \g__udesgeniethese_jury_codirecteurs_cl {#1\ #2}
  \seq_gput_right:NV \g__udesgeniethese_jury_codirecteurs_mf_seq \c__udesgeniethese_female_tl
}

\DeclareDocumentCommand \Evaluateur {mm}
{
  \clist_gput_right:Nn \g__udesgeniethese_jury_evaluateurs_cl {#1\ #2}
  \seq_gput_right:NV \g__udesgeniethese_jury_evaluateurs_mf_seq \c__udesgeniethese_male_tl
}

\DeclareDocumentCommand \Evaluatrice {mm}
{
  \clist_gput_right:Nn \g__udesgeniethese_jury_evaluateurs_cl {#1\ #2}
  \seq_gput_right:NV \g__udesgeniethese_jury_evaluateurs_mf_seq \c__udesgeniethese_female_tl
}

\DeclareDocumentCommand \MotsClesAnglais {m}
{ \tl_gset:Nn \g__udesgeniethese_mots_cles_anglais_tl {#1} }

\DeclareDocumentCommand \MotsClesFrancais {m}
{ \tl_gset:Nn \g__udesgeniethese_mots_cles_francais_tl {#1} }

\DeclareDocumentCommand \TitreAnglais {+m}
{ \tl_gset:Nn \g__udesgeniethese_titre_anglais_tl {#1} }

\DeclareDocumentCommand \TitreFrancais {+m}
{ \tl_gset:Nn \g__udesgeniethese_titre_francais_tl {#1} }

%%-----------------------------------------------------------------------------
%%---   MISE EN PAGE   --------------------------------------------------------
%%-----------------------------------------------------------------------------
\setlength{\parskip}{1.5ex plus0.25ex minus0ex}
\setlength{\parindent}{0em}
\clubpenalty=10000
\widowpenalty=10000
\geometry{letterpaper,hmargin={2.5cm,2.5cm},vmargin={2.5cm,2.5cm},
  foot=1.25cm,head=0.9cm,headsep=0.35cm,bindingoffset=0.5cm}
\captionsetup[table]{labelsep=quad,textformat=simple,font=normal,margin=5ex,position=top,skip=0.5ex}
\captionsetup[figure]{labelsep=quad,textformat=simple,font=normal,margin=5ex,position=bottom,skip=1ex}
\frenchsetup{ItemLabels=\textendash}

%%-----------------------------------------------------------------------------
%%---   REDEFINITION MACROS STANDARDS   ------------------------------------
%%-----------------------------------------------------------------------------
\renewcommand*{\appendix}
{
  \par\singlespacing
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \renewcommand*{\chaptername}{\appendixname}
  \renewcommand*{\thechapter}{\Alph{chapter}}
  \int_gset:Nn \g__udesgeniethese_pages_int {\value{page}}
}

\renewcommand*{\subsubsection}{\@startsection{subsubsection}{3}{0pt}
  {-0.3ex plus-0.03ex minus0ex}{0.15ex plus 0.015ex minus0ex}{\normalfont\normalsize\sffamily\bfseries}}

\renewcommand*{\subsection}{\@startsection{subsection}{2}{0pt}
  {-0.6ex plus-0.06ex minus0ex}{0.3ex plus0.03ex minus0ex}{\normalfont\large\sffamily\bfseries}}

\renewcommand*{\section}{\@startsection{section}{1}{0pt}
  {-1.2ex plus-0.12ex minus0ex}{0.6ex plus0.06ex minus0ex}{\normalfont\Large\sffamily\bfseries}}

\renewcommand*{\chapter}
{
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{chapitre}
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\__udesgeniethese_chapter\__udesgeniethese_schapter
}

%%-----------------------------------------------------------------------------
%%---   MACROS INTERNES   --------------------------------------------------
%%-----------------------------------------------------------------------------
\fancypagestyle{chapitre}
{\fancyhf{} \cfoot{\thepage} \renewcommand{\headrulewidth}{0pt}}

\newcommand*{\__udesgeniethese_chapter}[2][default]
{
  \ifnum \c@secnumdepth >\m@ne
  \if@mainmatter
  \refstepcounter{chapter}
  \typeout{\chaptername\space\thechapter.}
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
  \else
  \addcontentsline{toc}{chapter}{\protect\numberline#1}
  \fi
  \else
  \addcontentsline{toc}{chapter}{\protect\numberline#1}
  \fi
  \chaptermark{#1}
  \addtocontents{lof}{\protect\addvspace{10\p@}}
  \addtocontents{lot}{\protect\addvspace{10\p@}}
  \if@twocolumn
  \@topnewpage[\__udesgeniethese_makechapterhead{#2}]
  \else
  \__udesgeniethese_makechapterhead{#2}
  \@afterheading
  \fi
}

\newcommand*{\__udesgeniethese_makechapterhead}[1]
{
  \group_begin:
  \parindent \z@ \normalfont % \raggedright
  \ifnum \c@secnumdepth >\m@ne
  \if@mainmatter
  \LARGE\sffamily\bfseries \chaptername\space \thechapter
  \par\nobreak
  \vskip 0\p@
  \fi
  \fi
  \interlinepenalty\@M
  \LARGE\sffamily\bfseries #1 \par\nobreak
  \vskip 30\p@
  \group_end:
}

\newcommand*{\__udesgeniethese_schapter}[1]
{
  \if@twocolumn
  \@topnewpage[\__udesgeniethese_makeschapterhead{#1}]
  \else
  \__udesgeniethese_makeschapterhead{#1}
  \@afterheading
  \fi
}

\newcommand*{\__udesgeniethese_makeschapterhead}[1]
{
  \group_begin:
  \parindent \z@ \normalfont %\raggedright
  \vskip 0\p@
  \interlinepenalty\@M
  \LARGE\sffamily\bfseries #1 \par\nobreak
  \vskip 30\p@
  \group_end:
}

\cs_new:Npn \__udesgeniethese_caption_fmt #1 { #1 }

\cs_new:Npn \__udesgeniethese_setup_captions
{
  \addto\captionsfrench
  {
    \tl_gset:Nn \contentsname {TABLE~DES~MATIÈRES}
    \tl_gset:Nn \listfigurename {LISTE~DES~FIGURES}
    \tl_gset:Nn \listtablename {LISTE~DES~TABLEAUX}
    \tl_gset:Nn \chaptername {CHAPITRE}
    \tl_gset:Nn \bibname {LISTE~DES~RÉFÉRENCES}
    \tl_gset:Nn \appendixname {ANNEXE}
    \tl_gset:Nn \partname {PARTIE}
    \tl_gset:Nn \figurename {Figure}
    \tl_gset:Nn \tablename {Tableau}
    \tl_gset:Nn \glossaryname {LEXIQUE}
    \tl_gset:Nn \indexname {INDEX}
    \tl_gset:Nn \abstractname {RÉSUMÉ}
    \tl_gset:Nn \refname {LISTE~DES~RÉFÉRENCES}
    \tl_gset:Nn \prefacename {PRÉFACE}
    \tl_gset:Nn \CaptionSeparator {~~}
    \tl_gset:Nn \g__udesgeniethese_listsymbolsname_tl {LISTE~DES~SYMBOLES}
    \tl_gset:Nn \g__udesgeniethese_listacronymsname_tl {LISTE~DES~ACRONYMES}
    \tl_gset:Nn \g__udesgeniethese_acknowledgementsname_tl {REMERCIEMENTS}
    \tl_gset:Nn \g__udesgeniethese_udesname_tl {UNIVERSITÉ~DE~SHERBROOKE}
    \tl_gset:Nn \g__udesgeniethese_facultyname_tl {Faculté~de~génie}
    \tl_gset:Nn \g__udesgeniethese_specialityname_tl {Spécialité~:~}
    \tl_gset:Nn \g__udesgeniethese_juryname_tl {MEMBRES~DU~JURY}
    \tl_gset:Nn \g__udesgeniethese_adressname_tl {Sherbrooke~(Québec)~Canada}
    \tl_gset:Nn \g__udesgeniethese_motsclesname_tl {Mots-clés~:}
    \tl_gset:Nn \g__udesgeniethese_jury_codirname_tl {Codirecteur}
    \tl_gset:Nn \g__udesgeniethese_jury_codirnamef_tl {Codirectrice}
    \tl_gset:Nn \g__udesgeniethese_jury_dirname_tl {Directeur}
    \tl_gset:Nn \g__udesgeniethese_jury_dirnamef_tl {Directrice}
    \tl_gset:Nn \g__udesgeniethese_jury_evalname_tl {Évaluateur}
    \tl_gset:Nn \g__udesgeniethese_jury_evalnamef_tl {Évaluatrice}
  }

  \addto\captionsenglish
  {
    \tl_gset:Nn \contentsname {TABLE~OF~CONTENTS}
    \tl_gset:Nn \listfigurename {LIST~OF~FIGURES}
    \tl_gset:Nn \listtablename {LIST~OF~TABLES}
    \tl_gset:Nn \chaptername {CHAPTER}
    \tl_gset:Nn \bibname {LIST~OF~REFERENCES}
    \tl_gset:Nn \appendixname {APPENDIX}
    \tl_gset:Nn \partname {PART}
    \tl_gset:Nn \figurename {\__udesgeniethese_caption_fmt{Figure}}
    \tl_gset:Nn \tablename {\__udesgeniethese_caption_fmt{Table}}
    \tl_gset:Nn \glossaryname {GLOSSARY}
    \tl_gset:Nn \indexname {INDEX}
    \tl_gset:Nn \abstractname {ABSTRACT}~
    \tl_gset:Nn \refname {LIST~OF~REFERENCES}
    \tl_gset:Nn \prefacename {PREFACE}
    \tl_gset:Nn \CaptionSeparator {~~}
    \tl_gset:Nn \g__udesgeniethese_listsymbolsname_tl {LIST~OF~SYMBOLS}
    \tl_gset:Nn \g__udesgeniethese_listacronymsname_tl {LIST~OF~ACRONYMS}
    \tl_gset:Nn \g__udesgeniethese_acknowledgementsname_tl {ACKNOWLEDGEMENTS}
    \tl_gset:Nn \g__udesgeniethese_udesname_tl {UNIVERSITÉ~DE~SHERBROOKE}
    \tl_gset:Nn \g__udesgeniethese_facultyname_tl {Faculté~de~génie}
    \tl_gset:Nn \g__udesgeniethese_specialityname_tl {Specialité:~}
    \tl_gset:Nn \g__udesgeniethese_juryname_tl {JURY~MEMBERS}
    \tl_gset:Nn \g__udesgeniethese_adressname_tl {Sherbrooke~(Québec)~Canada}
    \tl_gset:Nn \g__udesgeniethese_motsclesname_tl {Keywords:}
    \tl_gset:Nn \g__udesgeniethese_jury_codirname_tl {Co-supervisor}
    \tl_gset:Nn \g__udesgeniethese_jury_codirnamef_tl {Co-supervisor}
    \tl_gset:Nn \g__udesgeniethese_jury_dirname_tl {Supervisor}
    \tl_gset:Nn \g__udesgeniethese_jury_dirnamef_tl {Supervisor} %Directress
    \tl_gset:Nn \g__udesgeniethese_jury_evalname_tl {Examiner} %Internal et external
    \tl_gset:Nn \g__udesgeniethese_jury_evalnamef_tl {Examiner} %Internal et external
  }
}

\cs_new:Npn \__udesgeniethese_validation
{
  \tl_if_blank:VT \g__udesgeniethese_fichier_resume_francais_tl
  { \tl_gclear:N \g__udesgeniethese_fichier_resume_francais_tl }

  \tl_if_blank:VT \g__udesgeniethese_fichier_resume_anglais_tl
  { \tl_gclear:N \g__udesgeniethese_fichier_resume_anglais_tl }

  \tl_if_blank:VT \g__udesgeniethese_fichier_remerciements_tl
  { \tl_gclear:N \g__udesgeniethese_fichier_remerciements_tl }

  \tl_if_blank:VT \g__udesgeniethese_fichier_lexique_tl
  { \tl_gclear:N \g__udesgeniethese_fichier_lexique_tl }

  \tl_if_blank:VT \g__udesgeniethese_fichier_symboles_tl
  { \tl_gclear:N \g__udesgeniethese_fichier_symboles_tl }

  \tl_if_blank:VT \g__udesgeniethese_fichier_acronymes_tl
  { \tl_gclear:N \g__udesgeniethese_fichier_acronymes_tl }

  \tl_if_blank:VT \g__udesgeniethese_titre_francais_tl
  { \tl_gclear:N \g__udesgeniethese_titre_francais_tl }

  \tl_if_blank:VT \g__udesgeniethese_titre_anglais_tl
  { \tl_gclear:N \g__udesgeniethese_titre_anglais_tl }

  \tl_if_blank:VT \g__udesgeniethese_auteur_nom_tl
  { \tl_gclear:N \g__udesgeniethese_auteur_nom_tl }

  \tl_if_blank:VT \g__udesgeniethese_auteur_prenom_tl
  { \tl_gclear:N \g__udesgeniethese_auteur_prenom_tl }

  \tl_if_blank:VT \g__udesgeniethese_date_mois_tl
  { \tl_gclear:N \g__udesgeniethese_date_mois_tl }

  \tl_if_blank:VT \g__udesgeniethese_date_annee_tl
  { \tl_gclear:N \g__udesgeniethese_date_annee_tl }

  \tl_if_blank:VT \g__udesgeniethese_jury_directeur_tl
  { \tl_gclear:N \g__udesgeniethese_jury_directeur_tl }

  \tl_if_blank:VT \g__udesgeniethese_dedicace_tl
  { \tl_gclear:N \g__udesgeniethese_dedicace_tl }

  \tl_if_blank:VT \g__udesgeniethese_mots_cles_francais_tl
  { \tl_gclear:N \g__udesgeniethese_mots_cles_francais_tl }

  \tl_if_blank:VT \g__udesgeniethese_mots_cles_anglais_tl
  { \tl_gclear:N \g__udesgeniethese_mots_cles_anglais_tl }

  \tl_if_empty:NT \g__udesgeniethese_langue_tl
  { \msg_error:nn {udesgeniethese}{config_langue_vide} }

  \tl_if_empty:NT \g__udesgeniethese_type_tl
  { \msg_error:nn {udesgeniethese}{config_type_vide}{type} }

  \tl_if_empty:NT \g__udesgeniethese_programme_tl
  { \msg_error:nn {udesgeniethese}{config_programme_vide}{type} }

  \clist_if_empty:NT \g__udesgeniethese_fichiers_references_cl
  { \msg_error:nnnn {udesgeniethese}{config_fichiers_vides}{la~bibliographie}{fichiersReferences} }

  \tl_if_empty:NT \g__udesgeniethese_auteur_nom_tl
  { \msg_error:nn {udesgeniethese}{auteur_nom_vide} }

  \tl_if_empty:NT \g__udesgeniethese_auteur_prenom_tl
  { \msg_error:nn {udesgeniethese}{auteur_prenom_vide} }

  \tl_if_empty:NT \g__udesgeniethese_date_annee_tl
  { \msg_error:nn {udesgeniethese}{date_annee_vide} }

  \tl_if_empty:NT \g__udesgeniethese_date_mois_tl
  { \msg_error:nn {udesgeniethese}{date_mois_vide} }

  \token_case_meaning:Nn \g__udesgeniethese_langue_tl
  {
    \c__udesgeniethese_langue_francais_tl
    {
      \tl_if_empty:NT \g__udesgeniethese_titre_francais_tl
        { \msg_error:nn {udesgeniethese}{titre_francais_vide} }
      \tl_if_empty:NT \g__udesgeniethese_mots_cles_francais_tl
        { \msg_error:nn {udesgeniethese}{mots_cles_francais_vide} }

      \tl_if_empty:NT \g__udesgeniethese_fichier_resume_francais_tl
        { \msg_error:nnnn {udesgeniethese}{config_fichier_vide}{le~resume~francais}{fichierResumeFrancais} }

      \int_zero:N \l_tmpa_int
      \tl_if_empty:NF \g__udesgeniethese_titre_anglais_tl
        { \int_incr:N \l_tmpa_int }
      \tl_if_empty:NF \g__udesgeniethese_fichier_resume_anglais_tl
        { \int_incr:N \l_tmpa_int }
      \tl_if_empty:NF \g__udesgeniethese_mots_cles_anglais_tl
        { \int_incr:N \l_tmpa_int }
      \int_case:nnF { \l_tmpa_int }
      {  {0}{}{3}{} }
      {
        \msg_error:nn {udesgeniethese}{titre_resume_mots_cles_anglais}
        \tl_gclear:N \g__udesgeniethese_fichier_resume_anglais_tl % resume pas genere
      }
    }
    \c__udesgeniethese_langue_english_tl
    {
      \tl_if_empty:NT \g__udesgeniethese_titre_francais_tl
      { \msg_error:nn {udesgeniethese}{titre_francais_vide} }
      \tl_if_empty:NT \g__udesgeniethese_mots_cles_francais_tl
      { \msg_error:nn {udesgeniethese}{mots_cles_francais_vide} }
      \tl_if_empty:NT \g__udesgeniethese_fichier_resume_francais_tl
      { \msg_error:nnnn {udesgeniethese}{config_fichier_vide}{le~resume~francais}{fichierResumeFrancais} }
      \tl_if_empty:NT \g__udesgeniethese_titre_anglais_tl
      { \msg_error:nn {udesgeniethese}{titre_anglais_vide} }
      \tl_if_empty:NT \g__udesgeniethese_mots_cles_anglais_tl
      { \msg_error:nn {udesgeniethese}{mots_cles_anglais_vide} }
      \tl_if_empty:NT \g__udesgeniethese_fichier_resume_anglais_tl
      { \msg_error:nnnn {udesgeniethese}{config_fichier_vide}{le~resume~anglais}{fichierResumeAnglais} }
    }
  }
}

\cs_new:Npn \__udesgeniethese_setup_electrique
{
  \tl_gset:Nn \g__udesgeniethese_departement_tl
    {Département~de~génie~électrique~et~de~génie~informatique}
  \tl_gset:Nn \g__udesgeniethese_specialite_tl
    {génie~électrique}
  \tl_gset:Nn \g__udesgeniethese_essai_tl
    {GEI~808~Essai}
  \tl_gset:Nn \g__udesgeniethese_dprmaitrise_tl
    {GEI~727~Définition~du~projet~de~recherche}
  \tl_gset:Nn \g__udesgeniethese_dprdoctorat_tl
    {SCA~772~Définition~du~projet~de~recherche~au~doctorat}
  \tl_gset:Nn \g__udesgeniethese_memoire_tl
    {Mémoire~de~maitrise}
  \tl_gset:Nn \g__udesgeniethese_these_tl
    {Thèse~de~doctorat}
}

\cs_new:Npn \__udesgeniethese_setup_mecanique
{
  \tl_gset:Nn \g__udesgeniethese_departement_tl
    {Département~de~génie~mécanique}
  \tl_gset:Nn \g__udesgeniethese_specialite_tl
    {génie~mécanique}
  \tl_gset:Nn \g__udesgeniethese_essai_tl
    {GMC~808~Essai}
  \tl_gset:Nn \g__udesgeniethese_dprmaitrise_tl
    {GMC~727~Définition~du~projet~de~recherche}
  \tl_gset:Nn \g__udesgeniethese_dprdoctorat_tl
    {SCA~772~Définition~du~projet~de~recherche~au~doctorat}
  \tl_gset:Nn \g__udesgeniethese_memoire_tl
    {Mémoire~de~maitrise}
  \tl_gset:Nn \g__udesgeniethese_these_tl
    {Thèse~de~doctorat}
}

\cs_new:Npn \__udesgeniethese_setup_aerospatial
{
  \__udesgeniethese_setup_mecanique
  \tl_gset:Nn \g__udesgeniethese_essai_tl
    {GMC~809~Projet~en~génie~aérospatial}
  \tl_if_eq:NNF \g__udesgeniethese_type_tl \c__udesgeniethese_type_essai_tl
    {\msg_error:nn {udesgeniethese}{aerospatial}}
}

\cs_new:Npn \__udesgeniethese_setup_chimique
{
  \tl_gset:Nn \g__udesgeniethese_departement_tl
    {Département~de~génie~chimique~et~de~génie~biotechnologique}
  \tl_gset:Nn \g__udesgeniethese_specialite_tl
    {génie~chimique}
  \tl_gset:Nn \g__udesgeniethese_essai_tl
    {GCH~808~Essai}
  \tl_gset:Nn \g__udesgeniethese_dprmaitrise_tl
    {GCH~727~Définition~du~projet~de~recherche}
  \tl_gset:Nn \g__udesgeniethese_dprdoctorat_tl
    {SCA~772~Définition~du~projet~de~recherche~au~doctorat}
  \tl_gset:Nn \g__udesgeniethese_memoire_tl
    {Mémoire~de~maitrise}
  \tl_gset:Nn \g__udesgeniethese_these_tl
    {Thèse~de~doctorat}
}

\cs_new:Npn \__udesgeniethese_setup_civil
{
  \tl_gset:Nn \g__udesgeniethese_departement_tl
    {Département~de~génie~civil}
  \tl_gset:Nn \g__udesgeniethese_specialite_tl
    {génie~civil}
  \tl_gset:Nn \g__udesgeniethese_essai_tl
    {GCI~808~Projet~d'intégration:~essai}
  \tl_gset:Nn \g__udesgeniethese_dprmaitrise_tl
    {GCI~727~Définition~du~projet~de~recherche}
  \tl_gset:Nn \g__udesgeniethese_dprdoctorat_tl
    {SCA~772~Définition~du~projet~de~recherche~au~doctorat}
  \tl_gset:Nn \g__udesgeniethese_memoire_tl
    {Mémoire~de~maitrise}
  \tl_gset:Nn \g__udesgeniethese_these_tl
    {Thèse~de~doctorat}
}

\cs_new:Npn \__udesgeniethese_setup
{
  \token_case_meaning:Nn \g__udesgeniethese_langue_tl
  {
    \c__udesgeniethese_langue_francais_tl {
      \selectlanguage{french}
    }
    \c__udesgeniethese_langue_english_tl {
      \selectlanguage{english}
    }
  }

  \bool_if:NTF \g__udesgeniethese_lignes_bool
  {
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.4pt}
  }
  {
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
  }

  \token_case_meaning:Nn \g__udesgeniethese_format_tl
  {
    \c__udesgeniethese_format_livre_tl
    {
      \pagestyle{fancy}
      \fancyhf{}
      \fancyhead[RO,LE]{\thepage}
      \fancyhead[LO]{\rightmark}
      \fancyhead[RE]{\leftmark}
    }
    \c__udesgeniethese_format_simple_tl
    {
      \pagestyle{fancy}
      \fancyhf{}
      \cfoot{\thepage}
    }
  }

  \use:c {__udesgeniethese_setup_ \g__udesgeniethese_programme_tl}
}

\cs_new:Npn \__udesgeniethese_generer_page_titre
{
  \group_begin:
  \begin{titlepage}
    \renewcommand*{\thepage}{T1}
    \vspace*{-0.5 in}
    \begin{center}
      \begin{tabular}{c}
        \Large \g__udesgeniethese_udesname_tl \\
        \Large\g__udesgeniethese_facultyname_tl\\
        \Large\g__udesgeniethese_departement_tl\\[0.5ex]
      \end{tabular}
      \vfill
      \token_case_meaning:Nn \g__udesgeniethese_langue_tl
      {
        \c__udesgeniethese_langue_francais_tl {
          {\huge\g__udesgeniethese_titre_francais_tl\par}
        }
        \c__udesgeniethese_langue_english_tl {
          \begin{otherlanguage}{french}
            {\huge\g__udesgeniethese_titre_francais_tl}
          \end{otherlanguage}\par
          {\Large\g__udesgeniethese_titre_anglais_tl\par}
        }
      }
      \vfill
      \begin{tabular}{c}
        \Large \use:c {g__udesgeniethese_ \g__udesgeniethese_type_tl _tl}
        \clist_if_in:NVT \g__udesgeniethese_specialite_cl \g__udesgeniethese_type_tl
        {
          \\[0.5ex]\Large\g__udesgeniethese_specialityname_tl\g__udesgeniethese_specialite_tl
        }
      \end{tabular}
      \vfill
      \begin{tabular}{c}
        {\Large\g__udesgeniethese_auteur_prenom_tl\ \g__udesgeniethese_auteur_nom_tl}
      \end{tabular}
      \vfill
      {\Large \g__udesgeniethese_adressname_tl \par \vspace{2ex}\g__udesgeniethese_date_mois_tl\ \g__udesgeniethese_date_annee_tl}
    \end{center}
  \end{titlepage}
  \clearpage
  \if@openright\null\thispagestyle{empty}\renewcommand*{\thepage}{T2}\cleardoublepage\fi
  \group_end:
}

\cs_new:Npn \__udesgeniethese_generer_jury
{
  \group_begin:
  {\centering\chapter*{\g__udesgeniethese_juryname_tl}}

  \begin{center}
    \vspace{4ex}
    \begin{tabular}{p{3in}}
      \hfill\large\g__udesgeniethese_jury_directeur_tl\hfill\null \\ \hline
      \centering\small
      \token_case_meaning:Nn \g__udesgeniethese_jury_directeur_mf_tl
      {
        \c__udesgeniethese_male_tl   {\g__udesgeniethese_jury_dirname_tl}
        \c__udesgeniethese_female_tl {\g__udesgeniethese_jury_dirnamef_tl}
      }
    \end{tabular}\par

    \tl_if_empty:NF \g__udesgeniethese_jury_codirecteurs_cl
    { \vspace{6ex} }

    \clist_map_inline:Nn \g__udesgeniethese_jury_codirecteurs_cl
    {
      \begin{tabular}{p{3in}}
        \hfill\large ##1 \hfill\null \\ \hline
        \seq_gpop_left:NN \g__udesgeniethese_jury_codirecteurs_mf_seq \l_tmpa_tl
        \centering\small
        \token_case_meaning:Nn \l_tmpa_tl
        {
          \c__udesgeniethese_male_tl   {\g__udesgeniethese_jury_codirname_tl}
          \c__udesgeniethese_female_tl {\g__udesgeniethese_jury_codirnamef_tl}
        }
      \end{tabular}\par
    }

    \tl_if_empty:NF \g__udesgeniethese_jury_evaluateurs_cl
    { \vspace{6ex} }

    \clist_map_inline:Nn \g__udesgeniethese_jury_evaluateurs_cl
    {
      \begin{tabular}{p{3in}}
        \hfill\large ##1 \hfill\null \\ \hline
        \seq_gpop_left:NN \g__udesgeniethese_jury_evaluateurs_mf_seq \l_tmpa_tl
        \centering\small
        \token_case_meaning:Nn \l_tmpa_tl
        {
          \c__udesgeniethese_male_tl   {\g__udesgeniethese_jury_evalname_tl}
          \c__udesgeniethese_female_tl {\g__udesgeniethese_jury_evalnamef_tl}
        }
      \end{tabular}\par
    }
  \end{center}

  \thispagestyle{empty}\clearpage
  \if@openright\null\thispagestyle{empty}\cleardoublepage\fi
  \group_end:
}

\cs_new:Npn \__udesgeniethese_generer_dedicace
{
  \tl_if_empty:NF \g__udesgeniethese_dedicace_tl
  {
    \group_begin:
    \null\vfill\flushright
    \begin{minipage}{0.5\linewidth}
      \setlength{\parskip}{1.5ex}\setlength{\parindent}{0em}
      \g__udesgeniethese_dedicace_tl
    \end{minipage}
    \vfill\vfill
    \thispagestyle{empty}\clearpage
    \if@openright\null\thispagestyle{empty}\cleardoublepage\fi
    \group_end:
  }
}

\cs_new:Npn \__udesgeniethese_generer_resume_francais
{
  \begin{otherlanguage}{french}
    \chapter*{\abstractname}
    \int_set:Nn \l__udesgeniethese_tmp_int {\value{page}}
    \input{\g__udesgeniethese_fichier_resume_francais_tl}\par
    \textbf{\g__udesgeniethese_motsclesname_tl}~\g__udesgeniethese_mots_cles_francais_tl \par
    \thispagestyle{empty}\clearpage
    \int_sub:Nn \l__udesgeniethese_tmp_int {\value{page}}
    \int_compare:nNnT {\l__udesgeniethese_tmp_int} < {-1}
    { \msg_error:nn {udesgeniethese}{resume_francais_long} }
    \ifodd\value{page}\else\if@openright\null\thispagestyle{empty}\cleardoublepage\fi\fi
  \end{otherlanguage}
}

\cs_new:Npn \__udesgeniethese_generer_resume_anglais
{
  \begin{otherlanguage}{english}
    \chapter*{\abstractname}
    \int_set:Nn \l__udesgeniethese_tmp_int {\value{page}}

    \tl_if_eq:NNT \g__udesgeniethese_langue_tl \c__udesgeniethese_langue_francais_tl
    {{\bfseries\g__udesgeniethese_titre_anglais_tl}\par}

    \input{\g__udesgeniethese_fichier_resume_anglais_tl}\par
    \textbf{\g__udesgeniethese_motsclesname_tl}~\g__udesgeniethese_mots_cles_anglais_tl \par
    \thispagestyle{empty}\clearpage
    \int_sub:Nn \l__udesgeniethese_tmp_int {\value{page}}
    \int_compare:nNnT {\l__udesgeniethese_tmp_int} < {-1}
    {
      \msg_error:nn {udesgeniethese}{resume_anglais_long}
    }
    \ifodd\value{page}\else\if@openright\null\thispagestyle{empty}\cleardoublepage\fi\fi
  \end{otherlanguage}
}

\cs_new:Npn \__udesgeniethese_generer_remerciements
{
  \tl_if_empty:NF \g__udesgeniethese_fichier_remerciements_tl
  {
    \chapter*{\g__udesgeniethese_acknowledgementsname_tl}
    \int_set:Nn \l__udesgeniethese_tmp_int {\value{page}}
    \input{\g__udesgeniethese_fichier_remerciements_tl}\par
    \thispagestyle{empty}\clearpage
    \int_sub:Nn \l__udesgeniethese_tmp_int {\value{page}}
    \int_compare:nNnT {\l__udesgeniethese_tmp_int} < {-1}
    {
      \msg_error:nn {udesgeniethese}{remerciements_longs}
    }
    \ifodd\value{page}\else\if@openright\null\thispagestyle{empty}\cleardoublepage\fi\fi
  }
}

\cs_new:Npn \__udesgeniethese_generer_pages_preliminaires
{
  \setcounter{page}{1}
  \clist_if_in:NVF \g__udesgeniethese_pas_jury_cl \g__udesgeniethese_type_tl
  { \__udesgeniethese_generer_jury }

  \__udesgeniethese_generer_resume_francais
  \token_case_meaning:Nn \g__udesgeniethese_langue_tl
  {
    \c__udesgeniethese_langue_francais_tl {
      \tl_if_blank:VF \g__udesgeniethese_fichier_resume_anglais_tl
      { \__udesgeniethese_generer_resume_anglais }
    }
    \c__udesgeniethese_langue_english_tl {
      \__udesgeniethese_generer_resume_anglais
    }
  }

  \clist_if_in:NVT \g__udesgeniethese_dedicace_cl \g__udesgeniethese_type_tl
  { \__udesgeniethese_generer_dedicace  }

  \clist_if_in:NVT \g__udesgeniethese_remerciements_cl \g__udesgeniethese_type_tl
  { \__udesgeniethese_generer_remerciements  }

  \tableofcontents
  \if@openright\cleardoublepage\else\clearpage\fi

  \bool_if:NT \g__udesgeniethese_liste_figures_bool
  {
    \listoffigures
    \if@openright\cleardoublepage\else\clearpage\fi
  }

  \bool_if:NT \g__udesgeniethese_liste_tableaux_bool
  {
    \listoftables
    \if@openright\cleardoublepage\else\clearpage\fi
  }

  \tl_if_empty:NF \g__udesgeniethese_fichier_lexique_tl
  {
    \chapter*{\glossaryname}
    \markboth{\glossaryname}{\glossaryname}
    \input{\g__udesgeniethese_fichier_lexique_tl}\par
    \if@openright\cleardoublepage\else\clearpage\fi
  }

  \tl_if_empty:NF \g__udesgeniethese_fichier_symboles_tl
  {
    \chapter*{\g__udesgeniethese_listsymbolsname_tl}
    \markboth{\g__udesgeniethese_listsymbolsname_tl}{\g__udesgeniethese_listsymbolsname_tl}
    \input{\g__udesgeniethese_fichier_symboles_tl}\par
    \if@openright\cleardoublepage\else\clearpage\fi
  }

  \tl_if_empty:NF \g__udesgeniethese_fichier_acronymes_tl
  {
    \chapter*{\g__udesgeniethese_listacronymsname_tl}
    \markboth{\g__udesgeniethese_listacronymsname_tl}{\g__udesgeniethese_listacronymsname_tl}
    \input{\g__udesgeniethese_fichier_acronymes_tl}\par
    \if@openright\cleardoublepage\else\clearpage\fi
  }
}

\cs_new:Npn \__udesgeniethese_generer_liste_references
{
  \refstepcounter{chapter}
  \addcontentsline{toc}{chapter}{\bibname}

  \token_case_meaning:Nn \g__udesgeniethese_references_engin_tl
  {
    \c__udesgeniethese_references_bibtex_tl
      { \bibliography{\g__udesgeniethese_fichiers_references_cl} }
    \c__udesgeniethese_references_biblatex_tl
      { \printbibliography }
  }

  \if@openright\cleardoublepage\else\clearpage\fi
}

%%-----------------------------------------------------------------------------
%%---   GESTION AUTOMATISEE   -------------------------------------------------
%%-----------------------------------------------------------------------------
\AddToHook{begindocument/before}
{
  \bool_if:NTF \g__udesgeniethese_legendes_min_bool
    {\frenchsetup{SmallCapsFigTabCaptions=false}}
    {\cs_gset:Npn \__udesgeniethese_caption_fmt #1 { \textsc{#1} }}

  \token_case_meaning:Nn \g__udesgeniethese_references_engin_tl
  {
    \c__udesgeniethese_references_bibtex_tl
    {
     \IfPackageLoadedTF{biblatex}
        {\msg_error:nn {udesgeniethese}{biblatex_en_trop}}{}
     \bibliographystyle{\g__udesgeniethese_style_references_tl}
    }
    \c__udesgeniethese_references_biblatex_tl
    {
     \IfPackageLoadedTF{biblatex}
       {}{\msg_error:nn {udesgeniethese}{biblatex_manquant}}

      \clist_map_inline:Nn \g__udesgeniethese_fichiers_references_cl
      {
        \bool_if:nTF \g__udesgeniethese_autobib_bool
          { \addbibresource{#1.bib} }
          { \addbibresource{#1} }
      }
    }
  }
  \__udesgeniethese_setup_captions
}

\AddToHook{begindocument/end}
{
  \__udesgeniethese_validation
  \__udesgeniethese_setup
  \frontmatter
  \singlespacing
  \__udesgeniethese_generer_page_titre
  \__udesgeniethese_generer_pages_preliminaires
  \mainmatter
  \onehalfspacing
}

\AddToHook{enddocument}
{
  % Si pas eu d'annexes avec \appendix
  \int_compare:nNnT {\g__udesgeniethese_pages_int} = {0}
  { \int_gset:Nn \g__udesgeniethese_pages_int {\value{page}} }

  \int_compare:nNnT {\g__udesgeniethese_pages_int} > {\use:c {c__udesgeniethese_max_pages_ \g__udesgeniethese_type_tl _int}}
  { \msg_error:nn {udesgeniethese}{\g__udesgeniethese_type_tl _max_pages} }

  \backmatter
  \singlespacing
  \__udesgeniethese_generer_liste_references
}
%% 
%%
%% End of file `udes-genie-these.cls'.
