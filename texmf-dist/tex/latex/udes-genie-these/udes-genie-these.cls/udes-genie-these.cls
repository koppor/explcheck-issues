%%
%% This is file `udes-genie-these.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% udes-genie-these.dtx  (with options: `these')
%% 
%% Copyright 2026 Charles-Antoine Brunet
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
%% Copyright 2026 Charles-Antoine Brunet
%%
%%------------------------------------------------------------------------------
%%---   IDENTIFICATION   -------------------------------------------------------
%%------------------------------------------------------------------------------
\ProvidesExplClass{udes-genie-these}{2026-11-04}{3.2.0}
  {Université de Sherbrooke, Faculté de génie: classe de document pour thèses, mémoires, DPR et essais}

\IfDocumentMetadataTF
  { \NeedsTeXFormat{ LaTeX2e } [2026-11-01] }
  { \NeedsTeXFormat{ LaTeX2e } [2025-10-24] }

%%------------------------------------------------------------------------------
%%---   DÉCLARATION DES VARIABLES   --------------------------------------------
%%------------------------------------------------------------------------------
\bool_new:N \g__ugt_autobib_bool
\bool_new:N \g__ugt_english_bool
\bool_new:N \g__ugt_francais_bool
\bool_new:N \g__ugt_legendesmin_bool
\bool_new:N \g__ugt_lignes_bool
\bool_new:N \g__ugt_lof_bool
\bool_new:N \g__ugt_lot_bool

\clist_new:N \g__ugt_frefs_clist
\clist_new:N \g__ugt_jurycodirs_mf_clist
\clist_new:N \g__ugt_juryevals_mf_clist

\int_new:N \g__ugt_pages_int

\seq_new:N \g__ugt_jurycodirs_seq
\seq_new:N \g__ugt_juryevals_seq

\str_new:N \g__ugt_ackname_str
\str_new:N \g__ugt_juryname_str
\str_new:N \g__ugt_jurycodirname_f_str
\str_new:N \g__ugt_jurycodirname_m_str
\str_new:N \g__ugt_jurydir_mf_str
\str_new:N \g__ugt_jurydirname_f_str
\str_new:N \g__ugt_jurydirname_m_str
\str_new:N \g__ugt_jurydirname__str % si pas de dir
\str_new:N \g__ugt_juryevalname_f_str
\str_new:N \g__ugt_juryevalname_m_str
\str_new:N \g__ugt_listacronymsname_str
\str_new:N \g__ugt_listsymbolsname_str
\str_new:N \g__ugt_motsclesname_str

\tl_new:N \g__ugt_auteurnom_tl
\tl_new:N \g__ugt_auteurprenom_tl
\tl_new:N \g__ugt_dateannee_tl
\tl_new:N \g__ugt_datemois_tl
\tl_new:N \g__ugt_dedicace_tl
\tl_new:N \g__ugt_facronymes_tl
\tl_new:N \g__ugt_flexique_tl
\tl_new:N \g__ugt_fremerciements_tl
\tl_new:N \g__ugt_fresume_english_tl
\tl_new:N \g__ugt_fresume_francais_tl
\tl_new:N \g__ugt_fsymboles_tl
\tl_new:N \g__ugt_formatdoc_tl
\tl_new:N \g__ugt_jurydir_tl
\tl_new:N \g__ugt_mc_english_tl
\tl_new:N \g__ugt_mc_francais_tl
\tl_new:N \g__ugt_prog_tl
\tl_new:N \g__ugt_refengine_tl
\tl_new:N \g__ugt_stylerefs_tl
\tl_new:N \g__ugt_titre_english_tl
\tl_new:N \g__ugt_titre_francais_tl
\tl_new:N \g__ugt_typedoc_tl

%%------------------------------------------------------------------------------
%%---   DÉCLARATION DES CONSTANTES   -------------------------------------------
%%------------------------------------------------------------------------------
%% Programmes qui permettent uniquement un essai
\clist_const:Nn \c__ugt_check_essai_clist { aerospatial }

%% Types de documents qui peuvent avoir une dédicace
\clist_const:Nn \c__ugt_dedicace_clist { essai, memoire, these }

%% Types de documents sans jury
\clist_const:Nn \c__ugt_pas_jury_clist { essai }

%% Types de documents qui peuvent avoir des remerciements
\clist_const:Nn \c__ugt_remerciements_clist { essai, memoire, these }

\int_const:Nn \c__ugt_max_dprdoctorat_int { 20 }
\int_const:Nn \c__ugt_max_dprmaitrise_int { 19 }
\int_const:Nn \c__ugt_max_essai_int { 70 }
\int_const:Nn \c__ugt_max_memoire_int { 120 }
\int_const:Nn \c__ugt_max_these_int { 250 }

\str_const:Nn \c__ugt_adressname_str { Sherbrooke~(Québec)~Canada }
\str_const:Nn \c__ugt_f_str { f }
\str_const:Nn \c__ugt_facultyname_str { Faculté~de~génie }
\str_const:Nn \c__ugt_m_str { m }
\str_const:Nn \c__ugt_specname_str { Spécialité~:~ }
\str_const:Nn \c__ugt_udesname_str { UNIVERSITÉ~DE~SHERBROOKE }

%% Programme: aerospatial
\str_const:Nn \c__ugt_aerospatial_str
  { Département~de~génie~mécanique }
\str_const:Nn \c__ugt_these_aerospatial_str
  { Thèse~de~doctorat }
\str_const:Nn \c__ugt_memoire_aerospatial_str
  { Mémoire~de~maitrise }
\str_const:Nn \c__ugt_essai_aerospatial_str
  { GMC~809~Projet~en~génie~aérospatial }
\str_const:Nn \c__ugt_dprmaitrise_aerospatial_str
  { GMC727~Définition~du~projet~de~recherche }
\str_const:Nn \c__ugt_dprdoctorat_aerospatial_str
  { GMC912~Définition~du~projet~de~recherche~au~doctorat }
\str_const:Nn \c__ugt_these_aerospatial_spec_str
  { génie~mécanique }
\str_const:Nn \c__ugt_memoire_aerospatial_spec_str
  { génie~mécanique }

%% Programme: biotechnologique
\str_const:Nn \c__ugt_biotechnologique_str
  { Département~de~génie~chimique~et~de~génie~biotechnologique }
\str_const:Nn \c__ugt_these_biotechnologique_str
  { Thèse~de~doctorat }
\str_const:Nn \c__ugt_memoire_biotechnologique_str
  { Mémoire~de~maitrise }
\str_const:Nn \c__ugt_essai_biotechnologique_str
  { GBT808~Essai }
\str_const:Nn \c__ugt_dprmaitrise_biotechnologique_str
  { GBT727~Définition~du~projet~de~recherche }
\str_const:Nn \c__ugt_dprdoctorat_biotechnologique_str
  { SCA773~Définition~du~projet~de~recherche~au~doctorat }
\str_const:Nn \c__ugt_these_biotechnologique_spec_str
  { génie~biotechnologique }
\str_const:Nn \c__ugt_memoire_biotechnologique_spec_str
  { génie~biotechnologique }

%% Programme: chimique
\str_const:Nn \c__ugt_chimique_str
  { Département~de~génie~chimique~et~de~génie~biotechnologique }
\str_const:Nn \c__ugt_these_chimique_str
  { Thèse~de~doctorat }
\str_const:Nn \c__ugt_memoire_chimique_str
  { Mémoire~de~maitrise }
\str_const:Nn \c__ugt_essai_chimique_str
  { GCH808~Essai }
\str_const:Nn \c__ugt_dprmaitrise_chimique_str
  { GCH727~Définition~du~projet~de~recherche }
\str_const:Nn \c__ugt_dprdoctorat_chimique_str
  { SCA773~Définition~du~projet~de~recherche~au~doctorat }
\str_const:Nn \c__ugt_these_chimique_spec_str
  { génie~chimique }
\str_const:Nn \c__ugt_memoire_chimique_spec_str
  { génie~chimique }

%% Programme: civil
\str_const:Nn \c__ugt_civil_str
  { Département~de~génie~civil~et~de~génie~du~bâtiment }
\str_const:Nn \c__ugt_these_civil_str
  { Thèse~de~doctorat }
\str_const:Nn \c__ugt_memoire_civil_str
  { Mémoire~de~maitrise }
\str_const:Nn \c__ugt_essai_civil_str
  { GCI808~Projet~d'intégration:~essai }
\str_const:Nn \c__ugt_dprmaitrise_civil_str
  { GCI727~Définition~du~projet~de~recherche }
\str_const:Nn \c__ugt_dprdoctorat_civil_str
  { SCA773~Définition~du~projet~de~recherche~au~doctorat }
\str_const:Nn \c__ugt_these_civil_spec_str
  { génie~civil }
\str_const:Nn \c__ugt_memoire_civil_spec_str
  { génie~civil }

%% Programme: electrique
\str_const:Nn \c__ugt_electrique_str
  { Département~de~génie~électrique~et~de~génie~informatique }
\str_const:Nn \c__ugt_these_electrique_str
  { Thèse~de~doctorat }
\str_const:Nn \c__ugt_memoire_electrique_str
  { Mémoire~de~maitrise }
\str_const:Nn \c__ugt_essai_electrique_str
  { GEI808~Essai }
\str_const:Nn \c__ugt_dprmaitrise_electrique_str
  { GEI727~Définition~du~projet~de~recherche }
\str_const:Nn \c__ugt_dprdoctorat_electrique_str
  { SCA773~Définition~du~projet~de~recherche~au~doctorat }
\str_const:Nn \c__ugt_these_electrique_spec_str
  { génie~électrique }
\str_const:Nn \c__ugt_memoire_electrique_spec_str
  { génie~électrique }

%% Programme: informatique
\str_const:Nn \c__ugt_informatique_str
  { Département~de~génie~électrique~et~de~génie~informatique }
\str_const:Nn \c__ugt_these_informatique_str
  { Thèse~de~doctorat }
\str_const:Nn \c__ugt_memoire_informatique_str
  { Mémoire~de~maitrise }
\str_const:Nn \c__ugt_essai_informatique_str
  { GEI808~Essai }
\str_const:Nn \c__ugt_dprmaitrise_informatique_str
  { GEI727~Définition~du~projet~de~recherche }
\str_const:Nn \c__ugt_dprdoctorat_informatique_str
  { SCA773~Définition~du~projet~de~recherche~au~doctorat }
\str_const:Nn \c__ugt_these_informatique_spec_str
  { génie~informatique }
\str_const:Nn \c__ugt_memoire_informatique_spec_str
  { génie~informatique }

%% Programme: mecanique
\str_const:Nn \c__ugt_mecanique_str
  { Département~de~génie~mécanique }
\str_const:Nn \c__ugt_these_mecanique_str
  { Thèse~de~doctorat }
\str_const:Nn \c__ugt_memoire_mecanique_str
  { Mémoire~de~maitrise }
\str_const:Nn \c__ugt_essai_mecanique_str
  { GMC808~Essai }
\str_const:Nn \c__ugt_dprmaitrise_mecanique_str
  { GMC727~Définition~du~projet~de~recherche }
\str_const:Nn \c__ugt_dprdoctorat_mecanique_str
  { GMC912~Définition~du~projet~de~recherche~au~doctorat }
\str_const:Nn \c__ugt_these_mecanique_spec_str
  { génie~mécanique }
\str_const:Nn \c__ugt_memoire_mecanique_spec_str
  { génie~mécanique }

%%------------------------------------------------------------------------------
%%---   INITIALISATION DE VARIABLES   ------------------------------------------
%%------------------------------------------------------------------------------
\bool_gset_true:N \g__ugt_lignes_bool
\bool_gset_true:N \g__ugt_lof_bool
\bool_gset_true:N \g__ugt_lot_bool

\tl_gset:Nn \g__ugt_stylerefs_tl { plain }

%%------------------------------------------------------------------------------
%%---   MESSAGES D'ERREURS   ---------------------------------------------------
%%------------------------------------------------------------------------------
\msg_new:nnnn { udes-genie-these } { biblatex_en_trop }
  { Avec~l'option~bibtex,~il~ne~faut~pas~charger~le~package~biblatex. }
  { Consultez~la~documentation~de~la~classe. }

\msg_new:nnnn { udes-genie-these } { biblatex_manquant }
  { L'option~biblatex~requiert~de~charger~le~package~biblatex. }
  { Consultez~la~documentation~de~la~classe. }

\msg_new:nnnn { udes-genie-these } { maxpage }
  { Le~document~semble~long~(max~#1~pages).~Voir~le~protocole~à~ce~sujet. }
  { Consultez~le~protocole~de~redaction. }

\msg_new:nnnn { udes-genie-these } { champ_vide }
  { Aucune~valeur~n'est~donnée~pour~le~champ~#1~de~la~configuration. }
  { Consultez~la~documentation~de~la~classe. }

\msg_new:nnnn { udes-genie-these } { valeur_manquante }
  { Aucune~valeur~pour~#1:~utlisez~la~macro~correspondante. }
  { Consultez~la~documentation~de~la~classe. }

\msg_new:nnnn { udes-genie-these } { pas_essai }
  { Le~programme~#1~requiert~le~type~essai. }
  { Consultez~la~documentation~de~la~classe. }

\msg_new:nnnn { udes-genie-these } { incomplet }
  { Titre,~résumé~et~les~mots-clés~anglais:~tous~sont~donnés~ou~aucun. }
  { Consultez~la~documentation. }

\msg_new:nnnn { udes-genie-these } { long }
  { #1:~doit~être~une~page~maximum. }
  { Consultez~la~documentation~de~la~classe. }

\msg_new:nnnn { udes-genie-these } { ignoree }
  { L'option~'#1'~est~ignorée. }
  { Consultez~la~documentation~de~la~classe. }

%%------------------------------------------------------------------------------
%%---   OPTIONS DE CLASSE   ----------------------------------------------------
%%------------------------------------------------------------------------------
\DeclareKeys[udes-genie-these]
{
  biblatex .code:n =
    { \tl_gset_eq:NN \g__ugt_refengine_tl \l_keys_key_tl },
  biblatex .usage:n = load,
  biblatex .value_forbidden:n = true,
  biblatex .pass-to-packages = false,
  bibtex .code:n =
    { \tl_gset_eq:NN \g__ugt_refengine_tl \l_keys_key_tl },
  bibtex .usage:n = load,
  bibtex .value_forbidden:n = true,
  bibtex .pass-to-packages = false,
  livre .code:n =
    {
      \tl_gset_eq:NN \g__ugt_formatdoc_tl \l_keys_key_tl
      \PassOptionsToClass{ letterpaper, 12pt } { book }
      \PassOptionsToPackage{ twoside = true } { geometry }
    },
  livre .usage:n = load,
  livre .value_forbidden:n = true,
  livre .pass-to-packages = false,
  simple .code:n =
    {
      \tl_gset_eq:NN \g__ugt_formatdoc_tl \l_keys_key_tl
      \PassOptionsToClass{ letterpaper, 12pt, oneside, openany } { book }
      \PassOptionsToPackage { twoside = false } { geometry }
    },
  simple .usage:n = load,
  simple .value_forbidden:n = true,
  simple .pass-to-packages = false,
  % Toute autre option est ignorée.
  unknown .code:n =
    { \msg_warning:nnV { udes-genie-these } { ignoree } \l_keys_key_str },
}

\SetKeys{ livre, bibtex }

\PassOptionsToPackage
{
  letterpaper, portrait, onecolumn,
  hmargin = { 2.5cm, 2.5cm },
  vmargin = { 2.5cm, 2.5cm },
  foot=1.25cm,
  head=0.9cm,
  headsep=0.35cm,
  bindingoffset=0.5cm
} { geometry }

\ProcessKeyOptions

%%------------------------------------------------------------------------------
%%---   DÉPENDANCES DE CLASSE   ------------------------------------------------
%%------------------------------------------------------------------------------
\LoadClass { book }
\RequirePackage[ english, french ] { babel }
\RequirePackage{ caption, fancyhdr, flafter, geometry, setspace }

%%------------------------------------------------------------------------------
%%---   MACROS DE DOCUMENT (USAGER)   ------------------------------------------
%%------------------------------------------------------------------------------
\DeclareDocumentCommand \ConfigurationDocument { m }
  { \keys_set:nn { udes-genie-these } { #1 } }

\keys_define:nn { udes-genie-these }
{
  langue .choices:nn = { francais, english }
    {
      \int_compare:nNnTF { \l_keys_choice_int } = { 1 }
      {
        \bool_set_true:N \g__ugt_francais_bool
        \bool_set_false:N \g__ugt_english_bool
      }
      {
        \bool_set_false:N \g__ugt_francais_bool
        \bool_set_true:N \g__ugt_english_bool
      }
    },
  langue .value_required:n = true,
  langue .usage:n = preamble,
  type .choices:nn = { dprdoctorat, dprmaitrise, essai, memoire, these }
    { \tl_gset_eq:NN \g__ugt_typedoc_tl \l_keys_choice_tl },
  type .value_required:n = true,
  type .usage:n = preamble,
  programme .choices:nn =
    { aerospatial, biotechnologique, chimique, civil, electrique, informatique, mecanique }
    { \tl_gset_eq:NN \g__ugt_prog_tl \l_keys_choice_tl },
  programme .value_required:n = true,
  programme .usage:n = preamble,
  liste-figures .bool_gset:N = \g__ugt_lof_bool,
  liste-figures .default:n = true,
  liste-figures .usage:n = preamble,
  liste-tableaux .bool_gset:N = \g__ugt_lot_bool,
  liste-tableaux .default:n = true,
  liste-tableaux .usage:n = preamble,
  lignes .bool_gset:N = \g__ugt_lignes_bool,
  lignes .default:n = true,
  lignes .usage:n = preamble,
  fichier-resume-francais .tl_gset:N = \g__ugt_fresume_francais_tl,
  fichier-resume-francais .value_required:n = true,
  fichier-resume-francais .usage:n = preamble,
  fichier-resume-anglais .tl_gset:N = \g__ugt_fresume_english_tl,
  fichier-resume-anglais .value_required:n = true,
  fichier-resume-anglais .usage:n = preamble,
  fichier-remerciements .tl_gset:N = \g__ugt_fremerciements_tl,
  fichier-remerciements .value_required:n = true,
  fichier-remerciements .usage:n = preamble,
  fichier-lexique .tl_gset:N = \g__ugt_flexique_tl,
  fichier-lexique .value_required:n = true,
  fichier-lexique .usage:n = preamble,
  fichier-symboles .tl_gset:N = \g__ugt_fsymboles_tl,
  fichier-symboles .value_required:n = true,
  fichier-symbole .usage:n = preamble,
  fichier-acronymes .tl_gset:N = \g__ugt_facronymes_tl,
  fichier-acronymes .value_required:n = true,
  fichier-acronymes .usage:n = preamble,
  fichiers-references .clist_gset:N = \g__ugt_frefs_clist,
  fichiers-references .value_required:n = true,
  fichiers-references .usage:n = preamble,
  style-references .tl_gset:N = \g__ugt_stylerefs_tl,
  style-references .value_required:n = true,
  style-references .usage:n = preamble,
  auto-bib .bool_gset:N = \g__ugt_autobib_bool,
  auto-bib .default:n = true,
  auto-bib .usage:n = preamble,
  legendes-min .bool_gset:N = \g__ugt_legendesmin_bool,
  legendes-min .default:n = true,
  legendes-min .usage:n = preamble,
}

\DeclareDocumentCommand \Auteur { > { \TrimSpaces } m > { \TrimSpaces } m }
{
  \tl_gset:Nn \g__ugt_auteurprenom_tl {#1}
  \tl_gset:Nn \g__ugt_auteurnom_tl {#2}
  \author{ \g__ugt_auteurprenom_tl \space \g__ugt_auteurnom_tl } % for tagging
}

\DeclareDocumentCommand \Date { > { \TrimSpaces } m > { \TrimSpaces } m }
{
  \tl_gset:Nn \g__ugt_datemois_tl {#1}
  \tl_gset:Nn \g__ugt_dateannee_tl {#2}
  \date{ \g__ugt_datemois_tl \space \g__ugt_dateannee_tl } % for tagging
}

\DeclareDocumentCommand \Dedicace { > { \TrimSpaces } +m }
{
  \tl_gset:Nn \g__ugt_dedicace_tl {#1}
}

\DeclareDocumentCommand \Directeur { > { \TrimSpaces } m > { \TrimSpaces } m }
{
  \tl_gset:Nn \g__ugt_jurydir_tl {#1~#2}
  \str_gset_eq:NN \g__ugt_jurydir_mf_str \c__ugt_m_str
}

\DeclareDocumentCommand \Directrice { > { \TrimSpaces } m > { \TrimSpaces } m }
{
  \tl_gset:Nn \g__ugt_jurydir_tl {#1~#2}
  \str_gset_eq:NN \g__ugt_jurydir_mf_str \c__ugt_f_str
}

\DeclareDocumentCommand \Codirecteur { > { \TrimSpaces } m > { \TrimSpaces } m }
{
  \seq_gput_right:Nn \g__ugt_jurycodirs_seq { #1~#2 }
  \clist_gput_right:NV \g__ugt_jurycodirs_mf_clist \c__ugt_m_str
}

\DeclareDocumentCommand \Codirectrice { > { \TrimSpaces } m > { \TrimSpaces } m }
{
  \seq_gput_right:Nn \g__ugt_jurycodirs_seq {#1~#2}
  \clist_gput_right:NV \g__ugt_jurycodirs_mf_clist \c__ugt_f_str
}

\DeclareDocumentCommand \Evaluateur { > { \TrimSpaces } m > { \TrimSpaces } m }
{
  \seq_gput_right:Nn \g__ugt_juryevals_seq {#1~#2}
  \clist_gput_right:NV \g__ugt_juryevals_mf_clist \c__ugt_m_str
}

\DeclareDocumentCommand \Evaluatrice { > { \TrimSpaces } m > { \TrimSpaces } m }
{
  \seq_gput_right:Nn \g__ugt_juryevals_seq {#1~#2}
  \clist_gput_right:NV \g__ugt_juryevals_mf_clist \c__ugt_f_str
}

\DeclareDocumentCommand \MotsClesAnglais  { > { \TrimSpaces } m }
{
  \tl_gset:Nn \g__ugt_mc_english_tl {#1}
}

\DeclareDocumentCommand \MotsClesFrancais { > { \TrimSpaces } m }
{
  \tl_gset:Nn \g__ugt_mc_francais_tl {#1}
}

\DeclareDocumentCommand \TitreAnglais { > { \TrimSpaces } +m }
{
  \tl_gset:Nn \g__ugt_titre_english_tl {#1}
}

\DeclareDocumentCommand \TitreFrancais { > { \TrimSpaces } +m }
{
  \tl_gset:Nn \g__ugt_titre_francais_tl {#1}
  \title{ \g__ugt_titre_francais_tl } % for tagging
}

%%------------------------------------------------------------------------------
%%---   MISE EN PAGE   ---------------------------------------------------------
%%------------------------------------------------------------------------------
\setlength{ \parskip } { 1.5ex plus0.25ex minus0ex }
\setlength{ \parindent } { 0em }

\fancypagestyle{ chapitre }
  { \fancyhf{} \cfoot{ \thepage } \renewcommand{ \headrulewidth } { 0pt } }

\captionsetup [ table ]
{
  labelsep=quad,
  textformat=simple,
  font=normal,
  margin=5ex,
  position=top,
  skip=0.5ex
}

\captionsetup [ figure ]
{
  labelsep=quad,
  textformat=simple,
  font=normal,
  margin=5ex,
  position=bottom,
  skip=1ex
}

%%------------------------------------------------------------------------------
%%---   REDÉFINITION MACROS STANDARDS   ----------------------------------------
%%------------------------------------------------------------------------------
\AddToHook{ cmd/appendix/before } [udes-genie-these]
{
  \int_gset:Nn \g__ugt_pages_int { \value{ page } }
  \setstretch { 1 }
}

\IfDocumentMetadataTF
{
  \AddToHook{ cmd/chapter/after } [udes-genie-these]
  {
    \thispagestyle{ chapitre }
  }

  \EditInstance{ heading } { chapter }
  {
    heading-decls = \parindent 0pt \raggedright \normalfont \bfseries \sffamily \LARGE,
    title-decls = ,
    after-vspace = 30pt,
    after-penalty-vspace = \maxdimen,
  }

  \EditInstance { headformat } { chapter }
  {
    separator-b = \par \nobreak,
  }

  \EditInstance{ heading } { section }
  {
    heading-decls = \parindent 0pt \raggedright \normalfont \bfseries \sffamily \Large,
    title-decls = ,
    before-vspace = 1.5ex plus0.2ex,
    after-vspace = 1ex,
    after-penalty-vspace = \maxdimen,
  }

  \EditInstance{ heading } { subsection }
  {
    heading-decls = \parindent 0pt \raggedright \normalfont \bfseries \sffamily \large,
    title-decls = ,
    before-vspace = 1.5ex plus0.2ex,
    after-vspace = 1ex,
    after-penalty-vspace = \maxdimen,
  }

  \EditInstance{ heading } { subsubsection }
  {
    force-unnumbered = true,
    heading-decls = \parindent 0pt \raggedright \normalfont \bfseries \sffamily \normalsize,
    title-decls = ,
    before-vspace = 1.5ex plus0.2ex,
    after-vspace = 1ex,
    after-penalty-vspace = \maxdimen,
  }
}
{
  \AddToHook{ cmd/appendix/before } [udes-genie-these]
  {
    \renewcommand* { \chaptername } { \appendixname }
    \renewcommand* { \thechapter } { \Alph{ chapter } }
  }

  \renewcommand* { \subsubsection }
    {\@startsection{ subsubsection } { 3 } { 0pt }
    { -0.3ex plus-0.03ex minus0ex } { 0.15ex plus 0.015ex minus0ex }
    {\normalfont\normalsize\sffamily\bfseries}}

  \renewcommand* { \subsection }
    {\@startsection{ subsection } { 2 } { 0pt }
    { -0.6ex plus-0.06ex minus0ex } { 0.3ex plus0.03ex minus0ex }
    {\normalfont\large\sffamily\bfseries}}

  \renewcommand* { \section }
    {\@startsection{ section } { 1 } { 0pt }
    { -1.2ex plus-0.12ex minus0ex } { 0.6ex plus0.06ex minus0ex }
    {\normalfont\Large\sffamily\bfseries}}

  \renewcommand* { \chapter }
  { % Adapté de book.cls
    \if@openright\cleardoublepage\else\clearpage\fi
    \thispagestyle{ chapitre }
    \global\@topnum\z@
    \@afterindentfalse
    \secdef \__ugt_chapter \__ugt_schapter
  }

  \newcommand* { \__ugt_chapter } [2] [default]
  { % Adapté de book.cls
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \refstepcounter{ chapter }
        \typeout{ \chaptername\space\thechapter. }
        \addcontentsline{ toc } { chapter  }
          { \protect\numberline{ \thechapter } #1 }
      \else
        \addcontentsline{ toc } { chapter }
          { \protect\numberline #1 }
      \fi
    \else
      \addcontentsline{ toc } { chapter }
        { \protect\numberline #1 }
    \fi
    \chaptermark{#1}
    \addtocontents{ lof } { \protect\addvspace{ 10\p@ } }
    \addtocontents{ lot } { \protect\addvspace{ 10\p@ } }
    \if@twocolumn
      \@topnewpage[ \__ugt_makechapterhead { #2 } ]
    \else
      \__ugt_makechapterhead { #2 }
      \@afterheading
    \fi
  }

  \newcommand* { \__ugt_makechapterhead } [1]
  { % Adapté de book.cls
    \group_begin:
    \parindent \z@ \normalfont %\raggedright
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

  \newcommand* { \__ugt_schapter } [1]
  { % Adapté de book.cls
    \if@twocolumn
      \@topnewpage[ \__ugt_makeschapterhead { #1 } ]
    \else
      \__ugt_makeschapterhead { #1 }
      \@afterheading
    \fi
  }

  \newcommand* { \__ugt_makeschapterhead } [1]
  { % Adapté de book.cls
    \group_begin:
    \parindent \z@ \normalfont %\raggedright
    \interlinepenalty\@M
    \LARGE\sffamily\bfseries #1 \par\nobreak
    \vskip 30\p@
    \group_end:
  }
}

\frenchsetup{PartNameFull=false,TocPartNameFull=false}

\addto\captionsfrench
{
  \renewcommand\contentsname{ TABLE~DES~MATIÈRES }
  \renewcommand\listfigurename{ LISTE~DES~FIGURES }
  \renewcommand\listtablename{ LISTE~DES~TABLEAUX }
  \renewcommand\chaptername{ CHAPITRE }
  \renewcommand\bibname{ LISTE~DES~RÉFÉRENCES }
  \renewcommand\appendixname{ ANNEXE }
  \renewcommand\figurename{ Figure }
  \renewcommand\partname{ PARTIE }
  \renewcommand\tablename{ Tableau }
  \renewcommand\glossaryname{ LEXIQUE }
  \renewcommand\indexname{ INDEX }
  \renewcommand\abstractname{ RÉSUMÉ }
  \renewcommand\refname{ LISTE~DES~RÉFÉRENCES }
  \renewcommand\prefacename { PRÉFACE }
  \str_gset:Nn \g__ugt_listsymbolsname_str { LISTE~DES~SYMBOLES }
  \str_gset:Nn \g__ugt_listacronymsname_str { LISTE~DES~ACRONYMES }
  \str_gset:Nn \g__ugt_ackname_str { REMERCIEMENTS }
  \str_gset:Nn \g__ugt_juryname_str { MEMBRES~DU~JURY }
  \str_gset:Nn \g__ugt_motsclesname_str { Mots-clés }
  \str_gset:Nn \g__ugt_jurycodirname_m_str { Codirecteur }
  \str_gset:Nn \g__ugt_jurycodirname_f_str { Codirectrice }
  \str_gset:Nn \g__ugt_jurydirname_m_str { Directeur }
  \str_gset:Nn \g__ugt_jurydirname_f_str { Directrice }
  \str_gset:Nn \g__ugt_jurydirname__str { Directrice~ou~directeur }
  \str_gset:Nn \g__ugt_juryevalname_m_str { Évaluateur }
  \str_gset:Nn \g__ugt_juryevalname_f_str { Évaluatrice }
}

\addto\captionsenglish
{
  \renewcommand\contentsname { TABLE~OF~CONTENTS }
  \renewcommand\listfigurename { LIST~OF~FIGURES }
  \renewcommand\listtablename { LIST~OF~TABLES }
  \renewcommand\chaptername { CHAPTER }
  \renewcommand\bibname { LIST~OF~REFERENCES }
  \renewcommand\appendixname { APPENDIX }
  \renewcommand\partname { PART }
  \renewcommand\figurename { Figure }
  \renewcommand\tablename { Table }
  \renewcommand\glossaryname { GLOSSARY }
  \renewcommand\indexname { INDEX }
  \renewcommand\abstractname { ABSTRACT }
  \renewcommand\refname { LIST~OF~REFERENCES }
  \renewcommand\prefacename { PREFACE }
  \str_gset:Nn \g__ugt_listsymbolsname_str { LIST~OF~SYMBOLS }
  \str_gset:Nn \g__ugt_listacronymsname_str { LIST~OF~ACRONYMS }
  \str_gset:Nn \g__ugt_ackname_str { ACKNOWLEDGEMENTS }
  \str_gset:Nn \g__ugt_juryname_str { JURY~MEMBERS }
  \str_gset:Nn \g__ugt_motsclesname_str { Keywords }
  \str_gset:Nn \g__ugt_jurycodirname_m_str { Co-supervisor }
  \str_gset:Nn \g__ugt_jurycodirname_f_str { Co-supervisor }
  \str_gset:Nn \g__ugt_jurydirname_m_str { Supervisor }
  \str_gset:Nn \g__ugt_jurydirname_f_str { Supervisor }
  \str_gset:Nn \g__ugt_jurydirname__str { Supervisor }
  \str_gset:Nn \g__ugt_juryevalname_m_str { Examiner }
  \str_gset:Nn \g__ugt_juryevalname_f_str { Examiner }
}

%%------------------------------------------------------------------------------
%%---   MACROS INTERNES   ------------------------------------------------------
%%------------------------------------------------------------------------------
\cs_new:Npn \__ugt_check_tmcr_all:nn #1 #2
{
  \tl_if_empty:cT { g__ugt_titre_ #1 _tl }
    { \msg_error:nnn { udes-genie-these } { valeur_manquante } { le~titre~#2 } }

  \tl_if_empty:cT { g__ugt_mc_ #1 _tl }
    { \msg_error:nnn { udes-genie-these } { valeur_manquante } { les~mots-clés~#2 } }

  \tl_if_empty:cT { g__ugt_fresume_ #1 _tl }
    { \msg_error:nnn { udes-genie-these } { valeur_manquante } { le~résumé~#2 } }
}

\prg_new_conditional:Npnn \__ugt_check_tmcr_all:n #1 { p }
{
  \tl_if_empty:cTF { g__ugt_titre_ #1 _tl }
  {
    \prg_return_false:
  }
  {
    \tl_if_empty:cTF { g__ugt_mc_ #1 _tl }
    {
      \prg_return_false:
    }
    {
      \tl_if_empty:cTF { g__ugt_fresume_ #1 _tl }
        { \prg_return_false: }
        { \prg_return_true: }
    }
  }
}

\prg_new_conditional:Npnn \__ugt_check_tmcr_none:n #1 { p  }
{
  \tl_if_empty:cTF { g__ugt_titre_ #1 _tl }
  {
    \tl_if_empty:cTF { g__ugt_mc_ #1 _tl }
    {
      \tl_if_empty:cTF { g__ugt_fresume_ #1 _tl }
        { \prg_return_true: }
        { \prg_return_false: }
    }
    {
      \prg_return_false:
    }
  }
  {
    \prg_return_false:
  }
}

\cs_new_protected:Npn \__ugt_validation:
{
  \tl_if_empty:NT \g__ugt_typedoc_tl
    { \msg_error:nnn { udes-genie-these } { champ_vide  } { type } }

  \tl_if_empty:NT \g__ugt_prog_tl
    { \msg_error:nnn { udes-genie-these } { champ_vide } { programme } }

  \tl_if_empty:NT \g__ugt_auteurnom_tl
    { \msg_error:nnn { udes-genie-these } { valeur_manquante } { le~nom~de l'auteur } }

  \tl_if_empty:NT \g__ugt_auteurprenom_tl
    { \msg_error:nnn { udes-genie-these } { valeur_manquante } { le~prénom~de l'auteur } }

  \tl_if_empty:NT \g__ugt_dateannee_tl
    { \msg_error:nnn { udes-genie-these } { valeur_manquante } { l'année~de~la~date } }

  \tl_if_empty:NT \g__ugt_datemois_tl
    { \msg_error:nnn { udes-genie-these } { valeur_manquante } { le~mois~de~la~date } }

  \clist_if_empty:NT \g__ugt_frefs_clist
    { \msg_error:nnn { udes-genie-these } { valeur_manquante } { fichiers~bibliographiques } }

  % Pour certains programmes, le type de document doit être 'essai'.
  \clist_if_in:NVT \c__ugt_check_essai_clist \g__ugt_prog_tl
  {
    \tl_if_eq:VnF \g__ugt_typedoc_tl { essai }
      { \msg_error:nnV { udes-genie-these } { pas_essai } \g__ugt_prog_tl }
  }

  \__ugt_check_tmcr_all:nn { francais } { francais }

  \bool_if:NTF \g__ugt_francais_bool
  { % En français, titre, mots-clés et résumé anglais: c'est aucun ou les trois.
    \bool_lazy_and:nnT
      { ! \__ugt_check_tmcr_all_p:n  { english } }
      { ! \__ugt_check_tmcr_none_p:n { english } }
      { \msg_error:nn { udes-genie-these } { incomplet } }
  }
  {
    \__ugt_check_tmcr_all:nn { english } { anglais }
   }
}

\cs_new:Npn \__ugt_setup_lignes:
{
  \bool_if:NTF \g__ugt_lignes_bool
  {
    \renewcommand{ \headrulewidth } { 0.4pt }
    \renewcommand{ \footrulewidth } { 0.4pt }
  }
  {
    \renewcommand{ \headrulewidth } { 0pt }
    \renewcommand{ \footrulewidth } { 0pt }
  }
}

\cs_new:Npn \__ugt_setup_livre:
{
  \pagestyle{ fancy }
  \fancyhf{}
  \fancyhead[RO,LE] { \thepage }
  \fancyhead[LO] { \rightmark }
  \fancyhead[RE] { \leftmark }
}

\cs_new:Npn \__ugt_setup_simple:
{
  \pagestyle{ fancy }
  \fancyhf{}
  \cfoot{ \thepage }
}

\cs_new_protected:Npn \__ugt_generer_page_titre:
{
  \group_begin:
  \begin{ titlepage }
  \renewcommand{ \thepage } { T1 }
  \vspace* { -0.5 in }
  \begin{ center }
    \Large
    \c__ugt_udesname_str \\
    \c__ugt_facultyname_str
    \\ \str_use:c { c__ugt_ \g__ugt_prog_tl _str }
    \par
    \vfill
    \huge \g__ugt_titre_francais_tl \par
    \Large
    \bool_if:NT \g__ugt_english_bool
    {
      \begin{ selectlanguage } { english }
      \g__ugt_titre_english_tl \par
      \end{ selectlanguage }
    }
    \vfill
    \str_use:c { c__ugt_ \g__ugt_typedoc_tl _ \g__ugt_prog_tl _str }
    \str_if_exist:cT { c__ugt_ \g__ugt_typedoc_tl _ \g__ugt_prog_tl _spec_str }
    {
      \\[0.5ex]
      \c__ugt_specname_str
      \str_use:c { c__ugt_ \g__ugt_typedoc_tl _ \g__ugt_prog_tl _spec_str }
    } \par
    \vfill
    \g__ugt_auteurprenom_tl \space \g__ugt_auteurnom_tl \par
    \vfill
    \c__ugt_adressname_str \par
    \vspace{ 2ex }
    \g__ugt_datemois_tl \space \g__ugt_dateannee_tl \par
  \end{ center }
  \end{ titlepage }
  \clearpage
  {
    \thispagestyle{ empty }
    \renewcommand{ \thepage } { T2 }
    \cleardoublepage
  }
  \group_end:
}

\cs_new_protected:Npn \__ugt_generer_jury:
{
  \clist_if_in:NVF \c__ugt_pas_jury_clist \g__ugt_typedoc_tl
  {
    \group_begin:
    \IfDocumentMetadataTF
    {
      \chapter*[title-decls=\centering] { \g__ugt_juryname_str }
    }
    {
      \centering \chapter* { \g__ugt_juryname_str }
    }

    \large
    \null \hfill \g__ugt_jurydir_tl \hfill \null \newline
    \null \hfill \rule{ 3.25in } { 0.4pt } \hfill \null \newline
    \small
    \null \hfill \str_use:c { g__ugt_jurydirname_ \g__ugt_jurydir_mf_str _str } \hfill \null
    \par

    \seq_if_empty:NF \g__ugt_jurycodirs_seq
      { \vspace{ 6ex } }

    \seq_map_inline:Nn \g__ugt_jurycodirs_seq
    {
      \large \hfill ##1 \hfill \null \newline
      \null \hfill \rule{ 3.25in } { 0.4pt } \hfill \null \newline
      \clist_gpop:NN \g__ugt_jurycodirs_mf_clist \l_tmpa_tl
      \small
      \null \hfill \str_use:c { g__ugt_jurycodirname_ \l_tmpa_tl _str } \hfill \null
      \par \vspace{ 2ex }
    }

    \seq_if_empty:NF \g__ugt_juryevals_seq
      { \vspace { 6ex } }

    \seq_map_inline:Nn \g__ugt_juryevals_seq
    {
      \null \hfill \large ##1 \hfill \null \newline
      \null \hfill \rule{ 3.25in } { 0.4pt } \hfill \null \newline
      \clist_gpop:NN \g__ugt_juryevals_mf_clist \l_tmpa_tl
      \small
      \null \hfill \str_use:c { g__ugt_juryevalname_ \l_tmpa_tl _str } \hfill \null
      \par \vspace{ 2ex }
    }
    \thispagestyle{ empty } \clearpage
    { \thispagestyle{ empty } \cleardoublepage }
    \group_end:
  }
}

\cs_new_protected:Npn \__ugt_generer_dedicace:
{
  \clist_if_in:NVT \c__ugt_dedicace_clist \g__ugt_typedoc_tl
  {
    \tl_if_empty:NF \g__ugt_dedicace_tl
    {
      \null\vfill
      \group_begin:
      \hfill
      \begin{ minipage } { 0.5\linewidth }
      \setlength{ \parskip } { 1.5ex }
      \setlength{ \parindent } { 0em }
      \g__ugt_dedicace_tl
      \end{ minipage }
      \group_end:
      \vfill\vfill
      \thispagestyle{ empty } \clearpage
      { \thispagestyle{ empty } \cleardoublepage }
    }
  }
}

\cs_new_protected:Npn \__ugt_generer_resume_francais:
{
  \tl_if_empty:NF \g__ugt_fresume_francais_tl
  {
    \begin{ selectlanguage } { french }
    \chapter* { \abstractname }
    \int_set:Nn \l_tmpa_int { \value{ page } }
    \input{ \g__ugt_fresume_francais_tl } \par
    \textbf{ \g__ugt_motsclesname_str : }~\g__ugt_mc_francais_tl \par
    \thispagestyle{ empty }\clearpage
    \int_sub:Nn \l_tmpa_int { \value{ page } }
    \int_compare:nNnT { \l_tmpa_int } < { -1 }
      { \msg_error:nnn { udes-genie-these } { long } { Résumé français } }
    \end{ selectlanguage }
    { \thispagestyle{ empty } \cleardoublepage }
  }
}

\cs_new_protected:Npn \__ugt_generer_resume_anglais:
{
  \tl_if_empty:NF \g__ugt_fresume_english_tl
  {
    \begin{ selectlanguage } { english }
    \chapter* { \abstractname }
    \int_set:Nn \l_tmpa_int { \value{ page } }
    \group_begin:
    \setlength{ \topskip } { 0pt }
    \bool_if:NT \g__ugt_francais_bool
    {
      \begin{ center }
      \large \bfseries \g__ugt_titre_english_tl
      \end{ center }
      \par
    }
    \input{ \g__ugt_fresume_english_tl } \par
    \textbf{ \g__ugt_motsclesname_str : }~\g__ugt_mc_english_tl \par
    \group_end:
    \thispagestyle{ empty } \clearpage
    \int_sub:Nn \l_tmpa_int { \value{ page } }
    \int_compare:nNnT { \l_tmpa_int } < { -1 }
      { \msg_error:nnn { udes-genie-these } { long } { Résumé anglais } }
    \end{ selectlanguage }
    { \thispagestyle{ empty } \cleardoublepage }
  }
}

\cs_new_protected:Npn \__ugt_generer_remerciements:
{
  \clist_if_in:NVT \c__ugt_remerciements_clist \g__ugt_typedoc_tl
  {
    \tl_if_empty:NF \g__ugt_fremerciements_tl
    {
      \chapter* { \g__ugt_ackname_str }
      \int_set:Nn \l_tmpa_int { \value { page } }
      \input{ \g__ugt_fremerciements_tl } \par
      \thispagestyle{ empty }\clearpage
      \int_sub:Nn \l_tmpa_int { \value{ page } }
      \int_compare:nNnT { \l_tmpa_int } < { -1 }
        { \msg_error:nnn { udes-genie-these } { long } { Remerciements } }
      { \thispagestyle{ empty } \cleardoublepage }
    }
  }
}

\cs_new:Npn \__ugt_generer_toc:
{
  { \setlength{ \parskip } { 0pt } \tableofcontents }
  \cleardoublepage
}

\cs_new:Npn \__ugt_generer_lof:
{
  \bool_if:NT \g__ugt_lof_bool
  {
    { \setlength{ \parskip } { 0pt } \listoffigures }
    \cleardoublepage
  }
}

\cs_new:Npn \__ugt_generer_lot:
{
  \bool_if:NT \g__ugt_lot_bool
  {
    { \setlength{ \parskip } { 0pt } \listoftables }
    \cleardoublepage
  }
}

\cs_new:Npn \__ugt_generer_lexique:
{
  \tl_if_empty:NF \g__ugt_flexique_tl
  {
    \chapter* { \glossaryname }
    \markboth{ \glossaryname } { \glossaryname }
    \input{ \g__ugt_flexique_tl }
    \cleardoublepage
  }
}

\cs_new:Npn \__ugt_generer_symboles:
{
  \tl_if_empty:NF \g__ugt_fsymboles_tl
  {
    \chapter* { \g__ugt_listsymbolsname_str }
    \markboth{ \g__ugt_listsymbolsname_str } { \g__ugt_listsymbolsname_str }
    \input{ \g__ugt_fsymboles_tl }
    \cleardoublepage
  }
}

\cs_new:Npn \__ugt_generer_acronymes:
{
  \tl_if_empty:NF \g__ugt_facronymes_tl
  {
    \chapter* { \g__ugt_listacronymsname_str }
    \markboth { \g__ugt_listacronymsname_str } { \g__ugt_listacronymsname_str }
    \input{ \g__ugt_facronymes_tl }
    \cleardoublepage
  }
}

\cs_new_protected:Npn \__ugt_generer_pages_preliminaires:
{
  \setcounter{ page } { 1 }
  \__ugt_generer_jury:
  \__ugt_generer_resume_francais:
  \__ugt_generer_resume_anglais:
  \__ugt_generer_dedicace:
  \__ugt_generer_remerciements:
  \__ugt_generer_toc:
  \__ugt_generer_lof:
  \__ugt_generer_lot:
  \__ugt_generer_lexique:
  \__ugt_generer_symboles:
  \__ugt_generer_acronymes:
}

\cs_new_protected:Npn \__ugt_refengine_setup_bibtex:
{
  \IfPackageLoadedT{ biblatex }
    { \msg_error:nn { udes-genie-these } { biblatex_en_trop } }
  \bibliographystyle{ \g__ugt_stylerefs_tl }
}

\cs_new_protected:Npn \__ugt_refengine_setup_biblatex:
{
  \IfPackageLoadedF{ biblatex }
    { \msg_error:nn { udes-genie-these } { biblatex_manquant } }
  \clist_map_inline:Nn \g__ugt_frefs_clist
  {
    \bool_if:nTF \g__ugt_autobib_bool
      { \addbibresource{ ##1.bib } }
      { \addbibresource{ ##1 } }
  }
}

\cs_new_protected:Npn \__ugt_references_bibtex:
{
  \bibliography{ \g__ugt_frefs_clist }
}

\cs_new_protected:Npn \__ugt_references_biblatex:
{
  \printbibliography
}

\cs_new:Npn \__ugt_generer_liste_references:
{
  \refstepcounter{ chapter }
  \addcontentsline{ toc } { chapter } { \bibname }
  \setlength{ \parskip } { 0.5ex plus0.1ex minus0.1ex }
  \use:c { __ugt_references_ \g__ugt_refengine_tl : }
  \cleardoublepage
}

%%------------------------------------------------------------------------------
%%---   GESTION AUTOMATISÉE   --------------------------------------------------
%%------------------------------------------------------------------------------
\AddToHook{ begindocument/before }
{
  \use:c { __ugt_refengine_setup_ \g__ugt_refengine_tl : }
  \bool_if:NTF \g__ugt_legendesmin_bool
    { \frenchsetup{ SmallCapsFigTabCaptions=false } }
    { \frenchsetup{ SmallCapsFigTabCaptions=true } }
}

\AddToHook{ begindocument/end }
{
  \__ugt_validation:
  \__ugt_setup_lignes:
  \use:c { __ugt_setup_ \g__ugt_formatdoc_tl : }
  \bool_if:NT \g__ugt_english_bool
    { \selectlanguage{ english } }
  \frontmatter
  \setstretch { 1 }
  \__ugt_generer_page_titre:
  \__ugt_generer_pages_preliminaires:
  \mainmatter
  \setstretch { 1.2 }
}

\AddToHook{ enddocument }
{
  % Si pas eu d'annexes avec \appendix
  \int_compare:nNnT { \g__ugt_pages_int } = { 0 }
    { \int_gset:Nn \g__ugt_pages_int { \value{ page } } }
  \int_compare:nNnT { \g__ugt_pages_int } > { \int_use:c { c__ugt_max_ \g__ugt_typedoc_tl _int } }
    { \msg_error:nne { udes-genie-these } { maxpage } { \int_use:c { c__ugt_max_ \g__ugt_typedoc_tl _int } } }
  \backmatter
  \setstretch { 1 }
  \__ugt_generer_liste_references:
}
%% 
%%
%% End of file `udes-genie-these.cls'.
