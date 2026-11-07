%%
%% This is file `ugentbookcover.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ugentdocs.dtx  (with options: `bkc')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2026 Seppe Ongena <seppe.ongena@ugent.be>
%% Portions Copyright (C) 2013-2026 Walter Daems (uantwerpendocs v4.12)
%% Portions Copyright (C) 2017-2026 Joris Meys, adapted with permission
%% 
%% This work is derived from uantwerpendocs v4.12 by Walter Daems
%% (https://ctan.org/pkg/uantwerpendocs), substantially rewritten and
%% expanded for the Ghent University house style. Code for the styling and
%% GAI disclaimer from Joris Meys' LaTeX at UGent was adapted with permission
%% and used for the bama and report classes. The full development history
%% can be found in the CHANGELOG.md and at:
%% 
%%    https://github.com/SeppeOngena/ugentdocs/
%% 
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    https://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Seppe Ongena.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugentbookcover}
    [2026/07/03 v1.0.0 .dtx skeleton file]
\RequirePackage{expl3}

%%
\input{ugentcommon.clo}
\ExplSyntaxOn
\bool_new:N \l__ugentdocs_cameraready_bool

\keys_define:nn { ugentdocs } {
  cameraready .bool_set:N = \l__ugentdocs_cameraready_bool ,
  cameraready .default:n = true ,
}
\keys_define:nn { ugentdocs } {
  covertype .tl_set:N = \l__ugentdocs_covertype_tl ,
  phd .code:n   = { \tl_set:Nn \l__ugentdocs_covertype_tl {phd} } ,
  course       .code:n   = { \tl_set:Nn \l__ugentdocs_covertype_tl {course} } ,
}
\ExplSyntaxOff
\ExplSyntaxOn
\clist_new:N \l__ugentdocs_optgroups_clist
\clist_new:N \l__ugentdocs_tmp_clist
\tl_new:N    \g__ugentdocs_baseclass_tl

\cs_new_protected:Npn \__ugentdocs_declare_option_group:nnn #1#2#3 {
  \tl_new:c { l__ugentdocs_opt_#1_tl }
  \tl_set:cn { l__ugentdocs_opt_#1_tl } {#3}
  \clist_put_right:Nn \l__ugentdocs_optgroups_clist {#1}
  \clist_map_inline:nn {#2} {
    \keys_define:nn { ugentdocs } {
      ##1 .code:n = \tl_set:cn { l__ugentdocs_opt_#1_tl } {##1}
    }
  }
}

\cs_new_protected:Npn \__ugentdocs_pass_option_groups: {
  \clist_clear:N \l__ugentdocs_tmp_clist
  \clist_map_inline:Nn \l__ugentdocs_optgroups_clist
  { \clist_put_right:Nv \l__ugentdocs_tmp_clist { l__ugentdocs_opt_##1_tl } }
  \exp_args:Nee \PassOptionsToClass
  { \clist_use:Nn \l__ugentdocs_tmp_clist { , } }
  { \g__ugentdocs_baseclass_tl }
}

\keys_define:nn { ugentdocs } {
  unknown .code:n = {
    \tl_if_blank:nTF {#1} {
      \exp_args:Nee \PassOptionsToClass
      { \l_keys_key_str } { \g__ugentdocs_baseclass_tl }
    }{
      \exp_args:Nee \PassOptionsToClass
      { \l_keys_key_str = { \exp_not:n {#1} } }
      { \g__ugentdocs_baseclass_tl }
    }
  }
}
\ExplSyntaxOff
\ExplSyntaxOn
\tl_gset:Nn \g__ugentdocs_baseclass_tl { bookcover }
\ExplSyntaxOff
\ProcessKeyOptions[ ugentdocs ]
\ExplSyntaxOn
\__ugentdocs_pass_option_groups:
\ExplSyntaxOff
\newlength{\@bleedspace}
\newlength{\@markerlength}
\ExplSyntaxOn
\bool_if:NTF \l__ugentdocs_cameraready_bool {
  \setlength\@bleedspace{3mm}
  \setlength\@markerlength{10mm}
}{
  \setlength\@bleedspace{0mm}
  \setlength\@markerlength{0mm}
}

\exp_args:Nx \str_case:nnF { \l__ugentdocs_covertype_tl } {
  { phd } {
    \PassOptionsToClass{
      coverheight=24cm,
      coverwidth=16cm,
      bleedwidth=\the\@bleedspace,
      marklength=\the\@markerlength
    }{bookcover}
  }
  { course }{
    \PassOptionsToClass{
      coverheight=29.7cm,
      coverwidth=21cm,
      bleedwidth=\the\@bleedspace,
      marklength=\the\@markerlength
    }{bookcover}
  }
}{
  \msg_error:nnx { ugentdocs } { cover~type~not~implemented } { \l__ugentdocs_covertype_tl }
}
\ExplSyntaxOff
\LoadClass{bookcover}
\ExplSyntaxOn
\exp_args:Nx \str_if_eq:eeT { \l__ugentdocs_fselector_tl } { bw } {
  \exp_args:Nx \str_if_eq:eeT { \l__ugentdocs_covertype_tl } { phd } {
    \bool_set_true:N \l__ugentdocs_bwphdcover_bool
  }
}
\ExplSyntaxOff
\@loadfonts
\RequirePackage{etoolbox}
\IfFileExists{shellesc.sty}{
  \RequirePackage{shellesc}}{}
\RequirePackage{hyphenat}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{graphbox}
\RequirePackage{soul}
\RequirePackage[export]{adjustbox}
\RequirePackage{color}
\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\usetikzlibrary{positioning,calc,fit,backgrounds}
\RequirePackage{zref-totpages}
\RequirePackage{zref-savepos}
\RequirePackage{zref-abspage}
\RequirePackage[normalem]{ulem}
\renewcommand{\ULthickness}{1pt}
\RequirePackage{setspace}
\RequirePackage{wasysym}
\RequirePackage{ugentcolor}
\RequirePackage{GS1}
\DeclareFontFamily{U}{wasy}{}
\DeclareFontShape{U}{wasy}{m}{n}{
  <-5.5> wasy5 <5.5-6.5> wasy6 <6.5-7.5> wasy7
  <7.5-8.5> wasy8 <8.5-9.5> wasy9 <9.5-> wasy10}{}
\DeclareFontShape{U}{wasy}{b}{n}{<-> wasyb10}{}
\ExplSyntaxOn
\str_if_eq:VnTF \l__ugentdocs_language_tl {dutch} {
  \PassOptionsToPackage{main=dutch}{babel}
}{
  \PassOptionsToPackage{main=english}{babel}
}
\RequirePackage[dutch,english]{babel}
\RequirePackage{csquotes}
\ExplSyntaxOff
\ExplSyntaxOn
\bool_if:NTF \l__ugentdocs_localizedates_bool {
  \RequirePackage[useregional]{datetime2}
}{
  \RequirePackage{datetime2}
}
\ExplSyntaxOff
\newlength{\@PW}      % Paper width
\newlength{\@PH}      % Paper height
\newlength{\gridunit} % Grid unit layout
\newcommand*{\@setgridunit}{\pgfmathsetlength{\gridunit}{max(\@PW,\@PH)/7/4}}
\ExplSyntaxOn
\exp_args:Nx \str_case:nnF { \l__ugentdocs_covertype_tl } {
  { phd } {
    \setlength\@PW{160mm}
    \setlength\@PH{240mm}
  }
  { course } {
    \setlength\@PW{210mm}
    \setlength\@PH{297mm}
  }
}{
  \msg_error:nnx { ugentdocs } { cover~type~not~implemented } { \l__ugentdocs_covertype_tl }
}
\@setgridunit
\ExplSyntaxOff
\ExplSyntaxOn
\renewcommand{\@title}{%
  <This~is~your~document~title>%
  \msg_warning:nnn { ugentdocs }{ mandatory-macro }{\title}
}
\newcommand{\@shorttitle}{\@title}
\RenewDocumentCommand{\title}{o m}{
  \gdef\@title{#2}
  \@ifundefined{inserttitle}{}{\gdef\inserttitle{#2}}
  \IfNoValueTF{#1}
  {\gdef\@shorttitle{#2}
   \@ifundefined{shorttitle}{}{\gdef\shorttitle{#2}}}
  {\gdef\@shorttitle{#1}
   \@ifundefined{shorttitle}{}{\gdef\shorttitle{#1}}}
}
\ExplSyntaxOff
\ExplSyntaxOn
\newcommand{\@subtitle}{}
\newcommand{\@shortsubtitle}{\@subtitle}
\NewDocumentCommand{\subtitle}{o m}{
  \gdef\@subtitle{#2}
  \IfNoValueTF{#1}
  {\gdef\@shortsubtitle{#2}}
  {\gdef\@shortsubtitle{#1}}
}
\ExplSyntaxOff
\newcommand*\@coverimage{}
\newcommand*\coverimage[1]{\renewcommand*\@coverimage{#1}}
\newcommand*{\@frontcoverlogos}{}
\newcommand*{\frontcoverlogos}[1]{\renewcommand*{\@frontcoverlogos}{#1}}
\newcommand*{\@backcoverlogos}{}
\newcommand*{\backcoverlogos}[1]{\renewcommand*{\@backcoverlogos}{#1}}
\ExplSyntaxOn
\seq_new:N \g__ugentdocs_degrees_seq
\seq_new:N \g__ugentdocs_degreecalls_seq

\cs_new:Nn \__ugentdocs_adddegree:n {
  \seq_gput_right:Nn \g__ugentdocs_degrees_seq { #1 }
  \seq_gput_right:Nx \g__ugentdocs_degreecalls_seq
  { \exp_not:N\degree { \exp_not:n{#1} } }
}
\NewDocumentCommand{\degree}{m}{
  \__ugentdocs_adddegree:n { #1\strut }
}
\AtBeginDocument{
  \let\degree\relax
  \ifseqempty{degrees}{
    \msg_warning:nnn { ugentdocs }{ mandatory-macro }{\degree}%
  }{}

}
\ExplSyntaxOff
\ExplSyntaxOn
\newcommand*\@doctype{
  \msg_warning:nnn { ugentdocs }{ mandatory-macro }{\doctype}%
}
\newcommand*\doctype[1]{
  \renewcommand*\@doctype{\translatekey{#1}}
}
\ExplSyntaxOff
\newcommand*{\@isbn}{}
\newcommand*{\isbn}[1]{\renewcommand*{\@isbn}{#1}}
\ExplSyntaxOn
\bool_new:N \l__ugentdocs_embargo_bool
\bool_new:N \l__ugentdocs_embargotemp_bool
\tl_new:N \@embargotempstart
\tl_new:N \@embargotempend
\tl_new:N \l__ugentdocs_embargostartdate_tl
\tl_new:N \l__ugentdocs_embargoenddate_tl

\msg_new:nnn { ugentdocs }
{ embargo-start-without-end }
{ An~embargo~start~date~was~given,~but~no~end~date}
\msg_new:nnn { ugentdocs }
{ embargo-end-without-start }
{ An~embargo~end~date~was~given,~but~no~start~date}

\keys_define:nn { ugentdocs/embargo } {
  start .tl_set:N = \l__ugentdocs_embargostartdate_tl ,
  end   .tl_set:N = \l__ugentdocs_embargoenddate_tl ,
}

\NewDocumentCommand{\embargo}{O{}}{
  \bool_set_true:N \l__ugentdocs_embargo_bool
  \tl_clear:N \l__ugentdocs_embargostartdate_tl
  \tl_clear:N \l__ugentdocs_embargoenddate_tl
  \keys_set:nn { ugentdocs/embargo } { #1 }
  \tl_if_empty:NTF \l__ugentdocs_embargostartdate_tl {
    \tl_if_empty:NF \l__ugentdocs_embargoenddate_tl {
      \msg_error:nn { ugentdocs } { embargo-end-without-start }
    }
  }{
    \tl_if_empty:NTF \l__ugentdocs_embargoenddate_tl {
      \msg_error:nn { ugentdocs } { embargo-start-without-end }
    }{
      \bool_set_true:N \l__ugentdocs_embargotemp_bool
      \regex_replace_all:nnN {\s} {\c{space}} \l__ugentdocs_embargostartdate_tl
      \regex_replace_all:nnN {\s} {\c{space}} \l__ugentdocs_embargoenddate_tl
      \__ugentdocs_embargostoredate:NN \@embargotempstart \l__ugentdocs_embargostartdate_tl
      \__ugentdocs_embargostoredate:NN \@embargotempend \l__ugentdocs_embargoenddate_tl
    }
  }
}

\tl_new:N \l__ugentdocs_embargodatetmp_tl
\cs_new_protected:Nn \__ugentdocs_embargostoredate:NN {
  \tl_set:Nx \l__ugentdocs_embargodatetmp_tl {#2}
  \exp_args:Nnx \regex_match:nnTF {^\d{4}-\d{2}-\d{2}$} {\l__ugentdocs_embargodatetmp_tl} %$
  {
    \tl_gset:Nx #1 {
      \exp_not:N \DTMdisplaydate
      { \exp_args:NV \tl_range:nnn \l__ugentdocs_embargodatetmp_tl {1} {4} }
      { \exp_args:NV \tl_range:nnn \l__ugentdocs_embargodatetmp_tl {6} {7} }
      { \exp_args:NV \tl_range:nnn \l__ugentdocs_embargodatetmp_tl {9} {10} }
      {-1}
    }
  }{
    \tl_gset_eq:NN #1 #2
  }
}

\tl_new:N \l__ugentdocs_embargotemp_tl
\seq_new:N \l__ugentdocs_embargosplit_seq
\cs_new:Nn \__ugentdocs_embargosubstitute:nN {
  \regex_split:nVN {#1} \l__ugentdocs_embargotemp_tl \l__ugentdocs_embargosplit_seq
  \tl_clear:N \l__ugentdocs_embargotemp_tl
  \tl_put_right:Nx \l__ugentdocs_embargotemp_tl { \seq_item:Nn \l__ugentdocs_embargosplit_seq {1} }
  \tl_put_right:Nx \l__ugentdocs_embargotemp_tl { \exp_not:V #2 }
  \tl_put_right:Nx \l__ugentdocs_embargotemp_tl { \seq_item:Nn \l__ugentdocs_embargosplit_seq {2} }
}
\NewDocumentCommand{\@embargotempwithdates}{}{
  \tl_set:Nx \l__ugentdocs_lookup_key_tl { \languagename {} : embargotempphd }
  \tl_set:Nx \l__ugentdocs_embargotemp_tl { \prop_item:NV \g__ugentdocs_dict_keyvals_prop \l__ugentdocs_lookup_key_tl }
  \__ugentdocs_embargosubstitute:nN {__START__} \@embargotempstart
  \__ugentdocs_embargosubstitute:nN {__END__} \@embargotempend
  \l__ugentdocs_embargotemp_tl
}
\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__ugentdocs_affiliations_seq
\seq_new:N \l__ugentdocs_affidx_seq
\seq_new:N \g__ugentdocs_affiliationscalls_seq

\tl_new:N \l__ugentdocs_affiltext_tl
\tl_new:N \l__ugentdocs_affsep_tl
\tl_set:Nn \l__ugentdocs_affsep_tl { ,~ }
\tl_new:N  \l__ugentdocs_nameaffsep_tl
\tl_set:Nn \l__ugentdocs_nameaffsep_tl { \\ }
\int_new:N \l__ugentdocs_affindex_int

\regex_const:Nn \c__ugentdocs_affkeys_regex
{ \A \s* (?: [a-zA-Z] | \d+ ) (?: \s* , \s* (?: [a-zA-Z] | \d+ ) )* \s* \Z }
\regex_const:Nn \c__ugentdocs_affnum_regex { \A \d+ \Z }

\msg_new:nnn { ugentdocs } { unknown-affiliation }
{ Affiliation~key~'#1'~does~not~refer~to~a~declared~affiliation~
  (#2~declared~so~far). }

\cs_new_protected:Nn \__ugentdocs_addaffiliation:n {
  \int_zero:N \l__ugentdocs_affindex_int
  \seq_map_indexed_inline:Nn \g__ugentdocs_affiliations_seq {
    \tl_if_eq:nnT {##2} {#1} {
      \seq_map_break:n { \int_set:Nn \l__ugentdocs_affindex_int {##1} }
    }
  }
  \int_compare:nNnT \l__ugentdocs_affindex_int = 0 {
    \seq_gput_right:Nn \g__ugentdocs_affiliations_seq {#1}
    \seq_gput_right:Nn \g__ugentdocs_affiliationscalls_seq { \affiliation {#1} }
    \int_set:Nn \l__ugentdocs_affindex_int { \seq_count:N \g__ugentdocs_affiliations_seq }
  }
}

\cs_new_protected:Nn \__ugentdocs_addaffindex: {
  \seq_put_right:Nx \l__ugentdocs_affidx_seq {
    \use:c { int_to_ \l__ugentdocs_affformat_tl :n } { \l__ugentdocs_affindex_int }
  }
  \tl_if_empty:NF \l__ugentdocs_affiltext_tl {
    \tl_put_right:NV \l__ugentdocs_affiltext_tl \l__ugentdocs_affsep_tl
  }
  \tl_put_right:Nx \l__ugentdocs_affiltext_tl {
    \seq_item:Nn \g__ugentdocs_affiliations_seq { \l__ugentdocs_affindex_int }
  }
}

\cs_new_protected:Nn \__ugentdocs_addto_affseq:n {
  \seq_clear:N \l__ugentdocs_affidx_seq
  \tl_clear:N \l__ugentdocs_affiltext_tl
  \regex_match:NnTF \c__ugentdocs_affkeys_regex {#1} {
    \clist_map_inline:nn {#1} {
      \regex_match:NnTF \c__ugentdocs_affnum_regex {##1}{
        \int_set:Nn \l__ugentdocs_affindex_int {##1}
      }{
        \int_set:Nn \l__ugentdocs_affindex_int { \int_from_alph:n {##1} }
      }
      \bool_lazy_or:nnTF
      { \int_compare_p:nNn \l__ugentdocs_affindex_int < 1 }
      { \int_compare_p:nNn \l__ugentdocs_affindex_int > { \seq_count:N \g__ugentdocs_affiliations_seq } }{
        \msg_error:nnee { ugentdocs } { unknown-affiliation }
        {##1} { \seq_count:N \g__ugentdocs_affiliations_seq }
      }{
        \__ugentdocs_addaffindex:
      }
    }
    \tl_if_empty:NF \l__ugentdocs_affiltext_tl{
      \tl_put_left:Nn \l__ugentdocs_affiltext_tl { \l__ugentdocs_nameaffsep_tl }
    }
  }{
    \tl_if_blank:nF {#1}{
      \__ugentdocs_addaffiliation:n {#1}
      \__ugentdocs_addaffindex:
    }
  }
  \seq_gput_right:Nx \g__ugentdocs_authoraffs_seq { \seq_use:Nn \l__ugentdocs_affidx_seq {,} }
}

\cs_new_protected:Nn \__ugentdocs_printaffiliationlist: {
  \seq_map_indexed_inline:Nn \g__ugentdocs_affiliations_seq {
    \hbox_set:Nn \l_tmpa_box {
      \textsuperscript { \use:c { int_to_ \l__ugentdocs_affformat_tl :n } {##1} } ~
    }
    \noindent
    \hangindent = \box_wd:N \l_tmpa_box
    \box_use:N \l_tmpa_box ##2 \par
  }
}

\NewDocumentCommand{\affiliation}{m}{
  \__ugentdocs_addaffiliation:n {#1}
}
\ExplSyntaxOff
\ExplSyntaxOn
\cs_new_protected:Nn \__ugentdocs_addto_nameseq:nnn {
  % args: seq, title, name
  \exp_args:Nc \seq_gput_right:Nn { g__ugentdocs_#1_seq } { #2~\@formatname{#3}\strut }
}

\cs_new_protected:Nn \__ugentdocs_addto_nameaffiliationseq:nnnn {
  % args: seq, title, name, affiliation
  \exp_args:Nc \seq_gput_right:Nn { g__ugentdocs_#1waff_seq } {%
    \tl_if_blank:nF {#2} { #2~ }
    \@formatname{#3}\strut
    \tl_if_blank:nF {#4} { #4\strut }
  }
}
\cs_generate_variant:Nn \__ugentdocs_addto_nameaffiliationseq:nnnn { nnnV }

\cs_new_protected:Nn \__ugentdocs_addto_callseq:nnnnn {
  % args: seq, options, title, name, affiliation
  \exp_args:Ncx \seq_gput_right:Nn { g__ugentdocs_#1calls_seq } {
    \exp_not:c { \tl_range:nnn {#1} {1} {-2} }
    \tl_if_blank:nF {#5} { [ \exp_not:n {#5} ] }
    { \exp_not:n{#2} } { \exp_not:n{#3} } { \exp_not:n{#4} }
  }
}
\cs_new_protected:Nn \__ugentdocs_addto_callseq:nnnn {
  \__ugentdocs_addto_callseq:nnnnn {#1} {#2} {#3} {#4} {}
}

\seq_new:N \l__ugentdocs_authorentries_seq
\tl_new:N  \l__ugentdocs_authorentry_tl
\tl_new:N  \l__ugentdocs_authorfirst_tl
\tl_new:N  \l__ugentdocs_authorsup_tl
\tl_new:N \l__ugentdocs_authororcid_tl

\cs_new_protected:Nn \__ugentdocs_orcidlink:n {
  \cs_if_exist:NTF \href {
    \exp_args:Ne \href { \tl_to_str:n { https://orcid.org/#1 } }
    { \XeTeXLinkBox { \tikz[baseline=0pt]{\orcidicon {1.6ex} {orcidcolor} {0}} } }
  }{
    \tikz[baseline=0pt]{\orcidicon {1.6ex} {orcidcolor} {0}}
  }
}
\cs_new_protected:Nn \__ugentdocs_printauthorlist: {
  \seq_clear:N \l__ugentdocs_authorentries_seq
  \seq_map_indexed_inline:Nn \g__ugentdocs_authorsurnames_seq {
    % Name
    \tl_set:Nn \l__ugentdocs_surname_tl {##2}
    \tl_set:Nx \l__ugentdocs_firstname_tl { \seq_item:Nn \g__ugentdocs_authorfirstnames_seq {##1} }
    \tl_if_empty:NF \l__ugentdocs_firstname_tl {
      \tl_set:Nx \l__ugentdocs_firstname_tl
      { \exp_not:N \textcolor { firstnamecolor } { \exp_not:V \l__ugentdocs_firstname_tl } }
    }
    \__ugentdocs_buildformattedname:
    \tl_set_eq:NN \l__ugentdocs_authorentry_tl \l__ugentdocs_formattedname_tl

     % Superscript
    \tl_set:Nx \l__ugentdocs_authorsup_tl { \seq_item:Nn \g__ugentdocs_authoraffs_seq {##1} }
    \seq_if_in:NnT \g__ugentdocs_authorcorr_seq {##1} {
      \tl_if_empty:NF \l__ugentdocs_authorsup_tl { \tl_put_right:Nn \l__ugentdocs_authorsup_tl {,} }
      \tl_put_right:Nn \l__ugentdocs_authorsup_tl { * }
    }
    \tl_if_empty:NF \l__ugentdocs_authorsup_tl {
      \tl_put_right:Nx \l__ugentdocs_authorentry_tl
      { \exp_not:N \textsuperscript { \exp_not:V \l__ugentdocs_authorsup_tl } }
    }
    % ORCID
    \tl_set:Nx \l__ugentdocs_authororcid_tl { \seq_item:Nn \g__ugentdocs_authororcids_seq {##1} }
    \tl_if_blank:VF \l__ugentdocs_authororcid_tl {
      \tl_put_right:Nx \l__ugentdocs_authorentry_tl {
        \exp_not:N \,
        \exp_not:N \__ugentdocs_orcidlink:n { \exp_not:V \l__ugentdocs_authororcid_tl }
      }
    }
    \seq_put_right:NV \l__ugentdocs_authorentries_seq \l__ugentdocs_authorentry_tl
  }
  \seq_use:Nnnn \l__ugentdocs_authorentries_seq{~\&~}{,~}{\translatekey{andlist}~}
}

\seq_new:N \l__ugentdocs_fnemails_seq
\seq_new:N \l__ugentdocs_fnorcids_seq
\tl_new:N  \l__ugentdocs_fnname_tl
\str_new:N \l__ugentdocs_orcidurl_str

\cs_new_protected:Nn \__ugentdocs_printauthorfootnote: {
  \seq_clear:N \l__ugentdocs_fnemails_seq
  \seq_clear:N \l__ugentdocs_fnorcids_seq
  \seq_map_indexed_inline:Nn \g__ugentdocs_authoremails_seq {
    % name
    \tl_set:Nx \l__ugentdocs_fnname_tl { \seq_item:Nn \g__ugentdocs_authorfirstnames_seq {##1} }
    \tl_if_empty:NF \l__ugentdocs_fnname_tl {
      \tl_set:Nx \l__ugentdocs_fnname_tl { \tl_head:N \l__ugentdocs_fnname_tl . ~ }
    }
    \tl_put_right:Nx \l__ugentdocs_fnname_tl { \seq_item:Nn \g__ugentdocs_authorsurnames_seq {##1} }
    % email
    \tl_if_blank:nF {##2} {
      \seq_put_right:Nx \l__ugentdocs_fnemails_seq
      { \exp_not:n {##2} ~ ( \exp_not:V \l__ugentdocs_fnname_tl ) }
    }
    % ORCID
    \tl_set:Nx \l_tmpa_tl { \seq_item:Nn \g__ugentdocs_authororcids_seq {##1} }
    \tl_if_blank:VF \l_tmpa_tl {
      \str_set:Nx \l__ugentdocs_orcidurl_str { https://orcid.org/ \l_tmpa_tl }
      \seq_put_right:Nx \l__ugentdocs_fnorcids_seq {
        \cs_if_exist:NTF \href{
          \exp_not:N \href { \l__ugentdocs_orcidurl_str } { \exp_not:V \l_tmpa_tl }
        }{
          \exp_not:V \l_tmpa_tl
        }
        {}~ ( \exp_not:V \l__ugentdocs_fnname_tl )
      }
    }
  }
  \bool_lazy_all:nF {
    { \seq_if_empty_p:N \g__ugentdocs_authorcorr_seq }
    { \seq_if_empty_p:N \l__ugentdocs_fnemails_seq }
    { \seq_if_empty_p:N \l__ugentdocs_fnorcids_seq }
  }{
    \group_begin:
    \cs_set_eq:NN \thefootnote \relax % unnumbered
    \cs_set:Npn \@makefntext ##1
    { \dim_zero:N \parindent \noindent ##1 }
    \footnotetext {
      \seq_if_empty:NF \g__ugentdocs_authorcorr_seq {
        \textsuperscript{*} ~ \translatekey{corrauthor}. \par
      }
      \seq_if_empty:NF \l__ugentdocs_fnemails_seq {
        \translatekey{emails}: ~
        \seq_use:Nn \l__ugentdocs_fnemails_seq { , ~ } . \par
      }
      \seq_if_empty:NF \l__ugentdocs_fnorcids_seq {
        ORCID: ~ \seq_use:Nn \l__ugentdocs_fnorcids_seq { , ~ } . \par
      }
    }
    \group_end:
  }
}

\seq_new:N \g__ugentdocs_authors_seq
\seq_new:N \g__ugentdocs_authorswaff_seq
\seq_new:N \g__ugentdocs_authoraffs_seq
\seq_new:N \g__ugentdocs_authorlist_seq
\seq_new:N \g__ugentdocs_authorscalls_seq
\seq_new:N \g__ugentdocs_authoremails_seq
\seq_new:N \g__ugentdocs_authororcids_seq
\seq_new:N \g__ugentdocs_authorcorr_seq
\seq_new:N \g__ugentdocs_authorsurnames_seq
\seq_new:N \g__ugentdocs_authorfirstnames_seq

\bool_new:N \l__ugentdocs_author_iscorresponding_bool
\tl_new:N   \l__ugentdocs_author_email_tl
\tl_new:N   \l__ugentdocs_author_orcid_tl

\cs_new:Nn \__ugentdocs_addauthor:nnnn {
  \tl_clear:N \l__ugentdocs_author_email_tl
  \tl_clear:N \l__ugentdocs_author_orcid_tl
  \bool_set_false:N \l__ugentdocs_author_iscorresponding_bool
  \keys_set:nn { ugentdocs / author } {#4}

  \__ugentdocs_addto_affseq:n {#3} % must be before nameaffiliationseq

  \__ugentdocs_addto_nameseq:nnn             {authors} {#1}{#2}
  \__ugentdocs_addto_nameaffiliationseq:nnnV {authors} {#1}{#2}{\l__ugentdocs_affiltext_tl}
  \__ugentdocs_addto_callseq:nnnnn           {authors} {#1}{#2}{#3}{#4}

  \tl_if_blank:VTF \l__ugentdocs_author_email_tl {
    \seq_gput_right:Nn \g__ugentdocs_authoremails_seq {}
  }{
    \__ugentdocs_formatemail:V \l__ugentdocs_author_email_tl
    \seq_gput_right:NV \g__ugentdocs_authoremails_seq \l__ugentdocs_email_tl
  }
  \seq_gput_right:NV \g__ugentdocs_authororcids_seq \l__ugentdocs_author_orcid_tl
  \bool_if:NT \l__ugentdocs_author_iscorresponding_bool{
    \seq_gput_right:Nx \g__ugentdocs_authorcorr_seq
    { \seq_count:N \g__ugentdocs_authors_seq }
  }

  \__ugentdocs_parsename:n {#2}
  \seq_gput_right:NV \g__ugentdocs_authorsurnames_seq   \l__ugentdocs_surname_tl
  \seq_gput_right:NV \g__ugentdocs_authorfirstnames_seq \l__ugentdocs_firstname_tl
  \seq_gput_right:Nx \g__ugentdocs_authorlist_seq {
    \exp_not:V \l__ugentdocs_surname_tl ,~\tl_head:N \l__ugentdocs_firstname_tl .
  }
}

\keys_define:nn { ugentdocs / author }{
  corresponding .bool_set:N = \l__ugentdocs_author_iscorresponding_bool,
  corresponding .default:n  = true,
  email         .tl_set:N   = \l__ugentdocs_author_email_tl,
  orcid         .tl_set:N   = \l__ugentdocs_author_orcid_tl,
}

\RenewDocumentCommand{\author}{O{} mmm}{
  \__ugentdocs_addauthor:nnnn { #2 } { #3 } { #4 } { #1 }
}
\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__ugentdocs_lecturers_seq
\seq_new:N \g__ugentdocs_lecturerscalls_seq
\seq_new:N \g__ugentdocs_lecturerswaff_seq
\cs_new:Nn \__ugentdocs_addlecturer:nnn {
  \__ugentdocs_addto_affseq:n {#3}

  \__ugentdocs_addto_nameseq:nnn             {lecturers} {#1}{#2}
  \__ugentdocs_addto_nameaffiliationseq:nnnV {lecturers} {#1}{#2}{\l__ugentdocs_affiltext_tl}
  \__ugentdocs_addto_callseq:nnnn            {lecturers} {#1}{#2}{#3}
}
\NewDocumentCommand{\lecturer}{mmm}{
  \__ugentdocs_addlecturer:nnn { #1 } { #2 } { #3 }
}
\ExplSyntaxOff
\ExplSyntaxOn
\AtBeginDocument{
  \exp_args:Nx \str_case:nn { \l__ugentdocs_covertype_tl } {
    { course }  {
      \ifseqempty{lecturers}{

      \ifseqempty{authors}{
        \msg_warning:nnn { ugentdocs }{ mandatory-macro }{\lecturer~or~\author}%
      }{}
      }{}
    }
  }
}
\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__ugentdocs_supervisors_seq
\seq_new:N \g__ugentdocs_supervisorscalls_seq
\seq_new:N \g__ugentdocs_supervisorswaff_seq
\seq_new:N \g__ugentdocs_allsupervisors_seq
\seq_new:N \g__ugentdocs_allsupervisorstutors_seq
\seq_new:N \g__ugentdocs_allsupervisorswaff_seq
\cs_new:Nn \__ugentdocs_addsupervisor:nnn {
  \__ugentdocs_addto_affseq:n {#3}

  \__ugentdocs_addto_nameseq:nnn             {supervisors} {#1}{#2}
  \__ugentdocs_addto_nameaffiliationseq:nnnV {supervisors} {#1}{#2}{\l__ugentdocs_affiltext_tl}
  \__ugentdocs_addto_callseq:nnnn            {supervisors} {#1}{#2}{#3}

  \__ugentdocs_addto_nameseq:nnn             {allsupervisors}        {#1}{#2}
  \__ugentdocs_addto_nameseq:nnn             {allsupervisorstutors}  {#1}{#2}
  \__ugentdocs_addto_nameaffiliationseq:nnnV {allsupervisors}        {#1}{#2}{\l__ugentdocs_affiltext_tl}
}
\NewDocumentCommand{\supervisor}{mmm}{
  \__ugentdocs_addsupervisor:nnn { #1 } { #2 } { #3 }
}

\AtBeginDocument{
  \exp_args:Nx \str_case:nn { \l__ugentdocs_covertype_tl } {
    { phd }    {
      \ifseqempty{supervisors}{
        \msg_warning:nnn { ugentdocs }{ mandatory-macro }{\supervisor}%
      }{}
    }
  }
}
\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__ugentdocs_emails_seq
\tl_new:N \l__ugentdocs_domain_tl
\tl_new:N  \l__ugentdocs_email_tl
\seq_new:N \l__ugentdocs_emailparts_seq

\cs_new_protected:Nn \__ugentdocs_formatemail:nn {
  \tl_set:Nn \l__ugentdocs_domain_tl {#1}
  \tl_if_empty:NT \l__ugentdocs_domain_tl {
    \tl_set:Nx \l__ugentdocs_lookup_key_tl { \languagename {}: domain }
    \prop_if_in:NVTF \g__ugentdocs_dict_keyvals_prop \l__ugentdocs_lookup_key_tl
      { \tl_set:Nx \l__ugentdocs_domain_tl { \prop_item:NV \g__ugentdocs_dict_keyvals_prop \l__ugentdocs_lookup_key_tl } }
      { \tl_set:Nx \l__ugentdocs_domain_tl { \prop_item:Nn \g__ugentdocs_dict_keyvals_prop {english:domain} } }
  }
  \@ifpackageloaded{hyperref}{
    \tl_set:Nx \l__ugentdocs_email_tl
    { \exp_not:N \href{mailto:#2@\l__ugentdocs_domain_tl}{#2@\l__ugentdocs_domain_tl} }
  }{
    \tl_set:Nx \l__ugentdocs_email_tl { #2@\l__ugentdocs_domain_tl }
  }
}
\cs_generate_variant:Nn \__ugentdocs_formatemail:nn { ee }

\cs_new_protected:Nn \__ugentdocs_formatemail:n {
  \regex_extract_once:nnNTF { \A (.*) @ (.*) \Z } {#1} \l__ugentdocs_emailparts_seq {
    \__ugentdocs_formatemail:ee
      { \seq_item:Nn \l__ugentdocs_emailparts_seq {3} }
      { \seq_item:Nn \l__ugentdocs_emailparts_seq {2} }
  }{
    \__ugentdocs_formatemail:nn {} {#1}
  }
}
\cs_generate_variant:Nn \__ugentdocs_formatemail:n { V }

\cs_new_protected:Nn \__ugentdocs_addemail:nn {
  \__ugentdocs_formatemail:nn {#1} {#2}
  \seq_gput_right:Nx \g__ugentdocs_emails_seq { \exp_not:V \l__ugentdocs_email_tl \exp_not:N \strut }
}
\NewDocumentCommand{\email}{O{} m}{
  \__ugentdocs_addemail:nn { #1 } { #2 }
}
\ExplSyntaxOff
\IfPackageLoadedTF{wasysym}{
  \def\Phone {{\wasyfamily\char7}}
}{}
\ExplSyntaxOn
\msg_new:nnnn { bookcover } { spine-too-small }
{ The~spine~width~(#1mm)~is~too~small. }
{ It~must~be~at~least~10mm~to~typeset~any~spine~text. }
\msg_new:nnnn { bookcover } { spine-big-enough }
{ The~spine~width~(#1mm)~is~big~enough. }
{ It~must-be~at~least~10mm~to~typeset~the~spine~text. }
\ExplSyntaxOff
\ExplSyntaxOn
\bool_new:N \l__ugentdocs_printonspine_bool
\AtBeginDocument{
  \fp_compare:nNnTF { \spinewidth } < { 10.0mm } {
    \msg_warning:nnx { bookcover } { spine-too-small } { \fp_to_decimal:n{\spinewidth/1mm} }
    \bool_set_false:N \l__ugentdocs_printonspine_bool
  }{
    \msg_info:nnx { bookcover } { spine-big-enough } { \fp_to_decimal:n{\spinewidth/1mm} }
    \bool_set_true:N \l__ugentdocs_printonspine_bool
  }
}

\renewcommand\makebookcover{
  \begin{bookcover}
    \bookcovercomponent{normal}{front}{\@frontcover}
    \makeatletter
    \bookcovercomponent{color}{bg~spine}{spinecolor}
    \bool_if:NT \l__ugentdocs_printonspine_bool {
      \bookcovercomponent{logo}{spine}{spinetextcolor}
      \bookcovercomponent{title}{spine}{{\renewcommand{\\}[1][]{~}\@title{}}}
      \bookcovercomponent{authoryear}{spine}{
        \exp_args:Nx \str_case:nn { \l__ugentdocs_covertype_tl } {
          { phd }    {
            \printseq{authors}{~\&~}{,~}{\translatekey{andlist}~}
          }
          { course }  {
            \ifseqempty{lecturers}{
              \printseq{authors}{~\&~}{,~}{\translatekey{andlist}~}
            }{
              \printseq{lecturers}{~\&~}{,~}{\translatekey{andlist}~}
            }
          }
        }
      }
    }
    \makeatother
    \bookcovercomponent {normal}{back}{\@backcover}
  \end{bookcover}
}
\ExplSyntaxOff
\ExplSyntaxOn
\newlength{\@B}     % Bleed outside crop / cameraready
\newlength{\@HBS}   % Height bottom strip
\newlength{\@HTS}   % Height top strip
\newlength{\@MS}    % Margin Spine (front/back cover)
\newlength{\@MTLR}  % Margin Text Left Right
\newlength{\@MTTB}  % Margin Text Top Bottom
\newlength{\@HT}    % Height Title
\newlength{\@WD}    % Width Data area
\newlength{\@HD}    % Height Data area
\newlength{\@BT}    % Bleed Top
\newlength{\@WI}    % Width Image
\newlength{\@HI}    % Height Image
\ExplSyntaxOff
\ExplSyntaxOn
\setlength\@B{3mm}
\bool_if:NTF \l__ugentdocs_bwphdcover_bool {
  % BW phd cover
  \setlength\@HBS{4\gridunit}
  \setlength\@HTS{0mm}
  \setlength\@BT{\@B}
  \setlength\@MS{0mm}
  \setlength\@MTLR{2\gridunit}
  \setlength\@MTTB{\gridunit}
  \setlength\@WD{0mm}
  \setlength\@HD{0mm}
  \setlength\@HT{2\@HBS}
}{
  % UGent cover
  \setlength\@HBS{4\gridunit}
  \tl_if_empty:NTF \l__ugentdocs_fselector_tl {
    \setlength\@HTS{0mm}
    \setlength\@BT{\@B}
  }{
    \setlength\@HTS{3\gridunit}
    \setlength\@BT{0mm}
  }
  \setlength\@MS{\gridunit}
  \setlength\@MTLR{\gridunit}
  \setlength\@MTTB{\gridunit}
  \setlength\@WD{12\gridunit}
  \setlength\@HD{10\gridunit}
  \pgfmathsetlength{\@HT}{0.5*\@PH+0.5*\@HBS-0.5*\@HTS+0.5*\@HD}
}
\ExplSyntaxOff
\ExplSyntaxOn
\exp_args:Nx \str_case:nnF { \l__ugentdocs_covertype_tl } {
  { phd } { }
  { course } {
    \setlength\@WD{10\gridunit}
  }
}{
  \msg_error:nnx { ugentdocs } { cover~type~not~implemented } { \l__ugentdocs_covertype_tl }
}
\ExplSyntaxOff
\newcommand\@coverbodycourse{
  \newlength\@parboxheight
  \newlength\@parboxwidth
  \pgfmathsetlength{\@parboxheight}{\@HD-2*\@MTTB}
  \pgfmathsetlength{\@parboxwidth}{\@WD-2*\@MTLR}

  \node[anchor=north west, inner sep=0pt, text=coverdatacolor]
  at (\@MS+\@MTLR, \@HBS+\@HD-\@MTTB) {
    \parbox[t][\@parboxheight][t]{\@parboxwidth}{
      \raggedright
      {\fontsize{35}{42}\selectfont\bfseries
        \MakeUppercase{\uline{\@title}}\par}
      %
      \ifx\@subtitle\@empty\else
        \vspace{5pt}
        \hyphenpenalty=100000
        {\fontsize{30}{36}\selectfont\bfseries
          \@subtitle}
      \fi
      \par
      \vfill
      \par
      {\fontsize{18}{22}\selectfont \printseq{lecturers}{\\}{\\}{\\}}%
      %
      \vskip 2 em
      %
      {\fontsize{15}{20}\selectfont
        \printseq{degrees}{\\}{\\}{\\}\\
        \translatekey{acyear}~\@academicyear}%
    }
  };
}
\ExplSyntaxOn
\newcommand\@coverbodyphd{
  % Title, subtitle, author
  \bool_if:NTF \l__ugentdocs_bwphdcover_bool {
    \node[anchor=south~east, text~width=\@PW-2*\@MTLR, align=flush~right, text=covertitlecolor]
    at (\@PW-\@MTLR, \@HT) {
      {\fontsize{28}{30}\selectfont\bfseries\nohyphens{\@title}\par}%
      \ifx\@subtitle\@empty\else\vspace{4pt}\hyphenpenalty=100000%
      {\fontsize{20}{28}\selectfont\bfseries\@subtitle\par}%
      \fi%
      \vspace{30pt}\hyphenpenalty=100000%
      {\fontsize{20}{24}\selectfont\printseq{authors}{\\}{\\}{\\}}};
  }{
    \node[anchor=west, text~width=\@PW-2*\@MTLR-\@MS, align=flush~left, text=covertitlecolor]
    at (\@MS+\@MTLR, \@HT) {
      {\fontsize{28}{30}\selectfont\bfseries\nohyphens{\@title}\par}%
      \ifx\@subtitle\@empty\else\vspace{5pt}\hyphenpenalty=100000%
        {\fontsize{20}{28}\selectfont\bfseries\@subtitle\par}
      \fi
    };

    \node[anchor=north~west, text~width=\@WD-2*\@MTLR, align=flush~left, text=coverdatacolor]
    at (\@MS+\@MTLR, \@HBS+\@HD-\@MTTB) {
      {\fontsize{20}{24}\selectfont\bfseries\printseq{authors}{\\}{\\}{\\}}%
      \\[15pt]
      {\fontsize{14}{17}\selectfont\getseqcaption{supervisors}{:\newline}
        \printseq{supervisors}{\\}{\\}{\\}}%
      \\[15pt]
      {\fontsize{11}{15}\selectfont\translatekey{acyear}~\@academicyear}};

    \node[anchor=south~west, text~width=\@WD-2*\@MTLR, align=flush~left, text=coverdatacolor]
    at (\@MS+\@MTLR, \@HBS+\@MTTB){%
      \fontsize{11}{15}\selectfont\nohyphens{%
        \@doctype{}~\translatekey[lowercase]{submittedto}%
        \ifx\@fselector\@empty\else{}%
          {}~\translatekey[lowercase]{the-de}~\@faculty{}~\translatekey[lowercase]{of}%
        \fi{}%
        {}~\translatekey{org-deugent},%
        {}~\translatekey{phdfulfil}~\printseq{degrees}{~\&~}{,~}{\translatekey{andlist}~}}};
  }

  \bool_if:NT \l__ugentdocs_embargo_bool {
    \@printconfidentialcover
  }
}
\ExplSyntaxOff

\ExplSyntaxOn
\newcommand{\@printconfidentialcover}{
  \bool_if:NTF \l__ugentdocs_bwphdcover_bool {
    \node[anchor=north~east,font=\fontsize{15}{18}\selectfont,covertitlecolor]
    at (\@PW-\gridunit,\@PH-\gridunit)
    {\textbf{\translatekey[uppercase]{confidential}}};

  }{
    \node[anchor=north~east,font=\fontsize{15}{18}\selectfont,ugent@main]
    at (\@PW-\gridunit,\@PH-\gridunit)
    {\textbf{\translatekey[uppercase]{confidential}}};
  }
}
\ExplSyntaxOff
\ExplSyntaxOn
\newcommand*\@coverbody{
  \exp_args:Nx \str_case:nnF { \l__ugentdocs_covertype_tl } {
    { phd }    { \@coverbodyphd }
    { course } { \@coverbodycourse }
    { bama }   { \@coverbodybama }
    { report } { \@coverbodyreport }
    { exam }   { \@coverbodyexam }
  }{
    \msg_error:nnx { ugentdocs } { cover~type~not~implemented } { \l__ugentdocs_covertype_tl }
  }
}
\ExplSyntaxOff
\ExplSyntaxOn
\newcommand{\@frontcover}{%
  \begin{tikzpicture}[inner~sep=0pt,outer~sep=0pt]
  \useasboundingbox (0,0) rectangle (\@PW,\@PH);

  % Faculty logo
  \bool_if:NTF \l__ugentdocs_bwphdcover_bool {
    \begin{scope}[shift={(\@PW,0)}]
      \faclogo{3\gridunit}{ugent@\@fselector}{1}
    \end{scope}
  } {
    \begin{scope}[shift={(\@MS-\gridunit,\@PH-\@HTS)}]
      \faclogo{3\gridunit}{ugent@\@fselector}{0}
    \end{scope}
  }

  % Image zone
  {\ifx\@coverimage\@empty%
    \fill[coverbgcolor] (\@MS,\@HBS) rectangle (\@PW+\@B,\@PH-\@HTS+\@BT);%
    \@coverblankimage
  \else%
    \begin{scope}%
      \pgfmathsetlength{\@WI}{\@PW+\@B-\@MS}
      \pgfmathsetlength{\@HI}{\@PH-\@HBS-\@HTS+\@BT}
      \clip (\@MS,\@HBS) rectangle (\@PW+\@B,\@PH-\@HTS+\@BT);
      \node[anchor=south~west, inner~sep=0pt] at (\@MS, \@HBS)%
      {\adjustbox{min~width=\@WI, min~height=\@HI, keepaspectratio}{%
        \includegraphics[width=\@WI]{\@coverimage}%
      }%
    };%
    \end{scope}
  \fi}

  % Front cover data area
  \fill[coverareacolor] (\@MS,\@HBS) rectangle (\@MS+\@WD,\@HBS+\@HD);

  % Cover body
  \@coverbody

  % UGent logo
  \pgfmathsetmacro{\@ugentlogoxoffset}{max(\@MS-\gridunit,0)}
  \begin{scope}[shift={(\@ugentlogoxoffset pt,0mm)}]
    \ugentlogo{\@HBS}{ugent@main}{0}
  \end{scope}

  % Front cover logos
  \ifx\@frontcoverlogos\@empty\else
    \node[anchor=south~east, inner~sep=0pt,
      text~width=\@PW-(2+\@ugenttextw/\@logounit)*\gridunit,
      minimum~height=2*\gridunit, align=flush~right]
    at (\@PW-\gridunit,\gridunit)
      {\@frontcoverlogos};
  \fi

  \end{tikzpicture}
}
\ExplSyntaxOff
\ExplSyntaxOn
\newcommand*\@coverblankimage{
  \exp_args:Nx \str_case:nnF { \l__ugentdocs_covertype_tl } {
    { phd } { }
    { course } {
      \bool_if:NF \l__ugentdocs_neutralcolors_bool {
        \newlength{\@WFI}      % Width Faculty Icon
        \newlength{\@FIoffset} % Faculty Icon offset
        \pgfmathsetlength{\@WFI}{\@PW-\@MS-4*\gridunit}
        \pgfmathsetlength{\@FIoffset}{0.5*(\@ficonw/\@logounit)}
        \begin{scope}[shift={(\@PW-\gridunit-0.5*\@WFI,\@PH-\@HTS-\gridunit-\@WFI)}]
          \ficon{\@WFI}{coverbgcolor!60}{\@FIoffset}
        \end{scope}
      }
    }
  }{
    \msg_error:nnx { ugentdocs } { cover~type~not~implemented } { \l__ugentdocs_covertype_tl }
  }
}
\ExplSyntaxOff
\newcommand\@backcover{%
  \begin{tikzpicture}[inner sep=0pt,outer sep=0pt]
  \useasboundingbox (0,0) rectangle (\@PW,\@PH);

  % ISBN barcode
  \pgfmathsetmacro{\@isbnscale}{0.81}% GS1 minimum scale
  \pgfmathsetlengthmacro{\@isbnheight}{0.75*25.01mm}
  \pgfmathsetlengthmacro{\@grpH}{\@isbnscale*\@isbnheight+15pt}% box+spacing+text
  \begin{scope}[shift={(10mm, 0.5*\@HBS - 0.5*\@grpH)}]
  \ifx\@isbn\@empty% ISBN text and barcode placeholder
  %\fill[coverareacolor] (0,0) rectangle (34.2mm, \@isbnscale*\@isbnmoduleht);
  \else
  \node[anchor=south] at (0.5*34.2mm,0)
  {\edef\__ugentdocs_isbnbarcodecall{\noexpand\EANBarcode[%
      scale=\@isbnscale,module_height=\@isbnheight]{%
        ISBN\space\@isbn%
    }}%
    \__ugentdocs_isbnbarcodecall};
  \fi

    \node[anchor=south, font=\usefont{OT1}{ocrb}{m}{n}\fontsize{5}{5}\selectfont,
      text=black, inner sep=0pt]
    at (0.5*34.2mm, \@isbnscale*\@isbnheight+ 10pt) {
      \ifx\@isbn\@empty% {ISBN: XXX-X-XXX-XXXXX-X}
      \else {ISBN:  \@isbn}
      \fi
    };
  \end{scope}

  % Back cover logos
  \pgfmathsetmacro{\@backcoverlogosxoffset}{min(\@PW-\@MS,\@PW-10mm)}
  \begin{scope}[inner sep=0pt, shift = {(\@backcoverlogosxoffset pt, 0.5*\@HBS)}]
    \node[anchor=east, inner sep=0pt]
    at (0, 0)
    {\@backcoverlogos};
  \end{scope}

  % Full background
  \fill[coverbgcolor] (0-\@B,\@HBS) rectangle (\@PW-\@MS,\@PH-\@HTS+\@BT);
  \end{tikzpicture}
}
\newbookcovercomponenttype{title}{
  \newlength{\@HST}  % Height spine title
  \pgfmathsetlength{\@HST}{3*\gridunit}
  \vspace{\@HST}\centering
  \rotatebox[origin=c]{-90}{%
    \begin{tabular}{@{}l@{}}
      {\renewcommand{\\}[1][]{~}%
        \fontsize{15}{0}\selectfont\color{spinetextcolor}\textbf{#1}}
      \ifx\@subtitle\@empty\else
      \\[0.25em]
      {\fontsize{10}{0}\selectfont\color{spinetextcolor}\@subtitle}
      \fi
    \end{tabular}
  }%
  \vfill
}
\ExplSyntaxOn
\newbookcovercomponenttype{authoryear}{
  \vfill\centering
  \bool_if:NTF \l__ugentdocs_bwphdcover_bool {
    \rotatebox[origin=c]{-90}{
      \fontsize{13}{0}\selectfont\color{spinetextcoloralt}\textbf{\vphantom{Ag}#1%
        \hspace{30pt}\the\year%
        }
    }
  }{
    \rotatebox[origin=c]{-90}{
      \fontsize{13}{0}\selectfont\color{spinetextcoloralt}\textbf{\vphantom{Ag}#1}
    }
  }
  \vspace{10mm}
}
\ExplSyntaxOff
\newbookcovercomponenttype{logo}{
  \vspace{0mm}\centering
  \rotatebox{-90}{
  \begin{tikzpicture}[overlay,x=1pt,y=1pt]
  \begin{scope}[shift={(0,-7.75mm)}]
    \ugentlogo{15.5mm}{#1}{0.0}
  \end{scope}
  \end{tikzpicture}%
}
  \vfill
}
\endinput
%%
%% End of file `ugentbookcover.cls'.
