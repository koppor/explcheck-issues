%%
%% This is file `ugentarticle.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ugentdocs.dtx  (with options: `art')
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
\ProvidesClass{ugentarticle}
    [2026/07/03 v1.0.0 .dtx skeleton file]
\RequirePackage{expl3}
\input{ugentcommon.clo}
\ExplSyntaxOn
\tl_set:Nn \l__ugentdocs_covertype_tl {article}
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
\tl_gset:Nn \g__ugentdocs_baseclass_tl { article }
\__ugentdocs_declare_option_group:nnn { paper }
  { a4paper, a5paper, b5paper, letterpaper, legalpaper, executivepaper } { a4paper }
\__ugentdocs_declare_option_group:nnn { size }  { 10pt, 11pt, 12pt }     { 10pt }
\__ugentdocs_declare_option_group:nnn { sides } { oneside, twoside }     { oneside }
\ExplSyntaxOff
\ProcessKeyOptions[ ugentdocs ]
\ExplSyntaxOn
\__ugentdocs_pass_option_groups:
\ExplSyntaxOff
\LoadClass{article}
\@loadfonts
\setlength{\parindent}{0pt}
\addtolength{\parskip}{0.75\baselineskip}
\setcounter{secnumdepth}{3}
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
\RequirePackage{fancyhdr}
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
\setlength\@PW{210mm}
\setlength\@PH{297mm}
\@setgridunit
\RequirePackage[heightrounded,paperwidth=\@PW,paperheight=\@PH,
top=2\gridunit, bottom=2\gridunit, left=2\gridunit, right=2\gridunit]{geometry}
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
\newcommand{\@subtitle}{}
\newcommand*{\@grants}{}
\newcommand*{\grants}[1]{
  \renewcommand*{\@grants}{#1}
}
\ExplSyntaxOn
\str_new:N \l__ugentdocs_doiurl_str
\newcommand*{\@doi}{}
\newcommand*{\doi}[1]{
  \renewcommand*{\@doi}{#1}
  \str_set:Ne \l__ugentdocs_doiurl_str { https://doi.org/ \@doi }
}
\ExplSyntaxOff
\newcommand{\@copyrightnotices}{}
\newcommand{\copyrightnotices}[1]{\renewcommand{\@copyrightnotices}{#1}}
\ExplSyntaxOn
\newcommand{\@abstract}{%
  \msg_warning:nnn { ugentdocs }{ mandatory-macro }{\abstract}%
}
\renewcommand{\abstract}[1]{\renewcommand{\@abstract}{#1}}
\ExplSyntaxOff
\newcommand{\@graphicalabstract}{}
\newcommand{\graphicalabstract}[1]{\renewcommand{\@graphicalabstract}{#1}}
\ExplSyntaxOn
\tl_new:N \g__ugentdocs_highlights_tl

\NewDocumentCommand \highlights { +m } {
  \tl_gset:Nn \g__ugentdocs_highlights_tl {#1}
}

\cs_new_protected:Nn \__ugentdocs_printhighlights: {
  \tl_if_empty:NF \g__ugentdocs_highlights_tl {
    \begin{itemize} \g__ugentdocs_highlights_tl \end{itemize}
  }
}
\ExplSyntaxOff
\ExplSyntaxOn
\clist_new:N \g__ugentdocs_keywords_clist

\NewDocumentCommand \keywords { m }{
  \clist_gput_right:Nn \g__ugentdocs_keywords_clist {#1}
}

\cs_new_protected:Nn \__ugentdocs_printkeywords: {
  \clist_if_empty:NF \g__ugentdocs_keywords_clist {
    \noindent \textbf{ \translatekey{keywords}: }~
    \clist_use:Nn \g__ugentdocs_keywords_clist { ;~ } \par
  }
}
\ExplSyntaxOff
\newcommand{\@journal}{}
\newcommand{\journal}[1]{\renewcommand{\@journal}{#1}}
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
\AtBeginDocument{
  \ifseqempty{authors}{
    \msg_warning:nnn { ugentdocs }{ mandatory-macro }{\author}%
  }{}
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
\ExplSyntaxOn
\renewcommand\maketitle{%
  % First page (if applicable)
  \bool_lazy_or:nnT
    { ! \tl_if_empty_p:o { \@graphicalabstract } }
    { ! \tl_if_empty_p:N \g__ugentdocs_highlights_tl }
  { \thispagestyle{empty}
    \color{covertitlecolor}{
      \fontsize{20}{28}\selectfont\@title\par
    }
    \vskip 0.5\gridunit
    \color{coverdatacolor}{
      \fontsize{14}{17}\selectfont
      \printseq{authorlist}{~\&~}{,~}{\translatekey{andlist}~}
      \par
    }

    \tl_if_empty:oF { \@graphicalabstract }{
      \color{covertitlecolor}{
        \fontsize{20}{28}\selectfont
        \vskip\gridunit
        \translatekey{graphicalabstract}\par
      }
      \@graphicalabstract
    }
    \tl_if_empty:NF \g__ugentdocs_highlights_tl {
      \vskip\gridunit
      \color{covertitlecolor}{
        \fontsize{20}{28}\selectfont
        \translatekey{highlights}\par
      }
      \color{coverdatacolor}{
        \fontsize{14}{17}\selectfont
        \__ugentdocs_printhighlights:
      }
    }
    \ifx\@copyrightnotices\@empty\else
    \null\vfill
    \@copyrightnotices
    \fi
  }
  \newpage
  \thispagestyle{titlepage}
  % Title
  \color{covertitlecolor}{\fontsize{20}{28}\selectfont\@title\par}
  % Author and affiliation list
  \vskip 0.5\gridunit
  \color{coverdatacolor}{
    \fontsize{14}{17}\selectfont
    \__ugentdocs_printauthorlist:
    \par
    \vskip 0.5\gridunit
    \fontsize{10}{12}\selectfont
    \__ugentdocs_printaffiliationlist:
    \ifx\@grants\@empty\else
      \vskip 0.25\gridunit
      {\translatekey{supportedby}~\@grants.}
    \fi
    \vskip 0.5\gridunit
    \hrule \medskip
    \noindent
     % Article info
    \begin{minipage}[t]{0.3\linewidth}
      \raggedright
      \fontsize{14}{17}\selectfont
      \translatekey[uppercase]{articleinfo} \par
      \smallskip \hrule \medskip
      \normalsize
      % keywords
      \clist_if_empty:NF \g__ugentdocs_keywords_clist {
        \textit{ \translatekey{keywords} } \par
        \clist_map_inline:Nn \g__ugentdocs_keywords_clist { ##1 \par }
        \medskip
      }
      % dates
      \tl_if_empty:oF {\@submitteddate} {
        \translatekey{submitted}~\@submitteddate \par
      }
      \tl_if_empty:oF {\@accepteddate} {
        \translatekey{accepted}~\@accepteddate \par
      }
      \tl_if_empty:oF {\@publisheddate} {
        \translatekey{published}~\@publisheddate \par
      }
      % journal
      \tl_if_empty:oF { \@journal } {
        \medskip
        \translatekey{published}~\translatekey[lowercase]{in}:
        {}~\textit{ \@journal } \par
      }
      % doi
      \tl_if_empty:oF { \@doi }{
        \medskip{DOI~
          \@ifpackageloaded{hyperref}{
            \exp_args:NV \href \l__ugentdocs_doiurl_str {\@doi}
          }{
            \@doi
          }
        }
      }
    \end{minipage}
    \hfill
    % Abstract
    \begin{minipage}[t]{0.65\linewidth}
      \fontsize{14}{17}\selectfont
      \translatekey[uppercase]{abstract} \par
      \smallskip \hrule \medskip
      \normalsize
      \@abstract
    \end{minipage}
    \par \medskip \hrule
  }
  \__ugentdocs_printauthorfootnote:
}
\ExplSyntaxOff
\ExplSyntaxOn
\tl_new:N \g__ugentdocs_pdfauthor_tl
\seq_new:N \l__ugentdocs_pdfauthor_seq
\tl_new:N  \l__ugentdocs_pdfauthor_item_tl
\cs_new_protected:Npn \__ugentdocs_pdfauthor_add:n #1{
  \tl_set:Nn \l__ugentdocs_pdfauthor_item_tl {#1}
  \tl_replace_all:Nnn \l__ugentdocs_pdfauthor_item_tl { , } { \xmpcomma }
  \seq_put_right:NV \l__ugentdocs_pdfauthor_seq \l__ugentdocs_pdfauthor_item_tl
}

\AtBeginDocument{
  \@ifpackageloaded{hyperref}{
    \pretocmd{\tableofcontents}{\begingroup\hypersetup{linkcolor=toccolor}}{}{}
    \apptocmd{\tableofcontents}{\endgroup}{}{}

    \begingroup
    \def\\{~}
    \seq_clear:N \l__ugentdocs_pdfauthor_seq
    \cs_if_exist:NTF \xmpcomma {
      \seq_map_function:NN \g__ugentdocs_authorlist_seq \__ugentdocs_pdfauthor_add:n
    }{
      \seq_set_eq:NN \l__ugentdocs_pdfauthor_seq \g__ugentdocs_authorlist_seq
    }
    \tl_gset:Ne \g__ugentdocs_pdfauthor_tl { \seq_use:Nn \l__ugentdocs_pdfauthor_seq { ,~ } }
    \endgroup

    \pdfstringdefDisableCommands{
      \let\leavevmode\@empty
      \def\\{~}
      \def\xspace{}
    }
    \hypersetup{
      breaklinks=true,
      colorlinks=true,
      citecolor=hypercolor,
      filecolor=hypercolor,
      linkcolor=hypercolor,
      pageanchor=true,
      pdfpagemode=UseOutlines,
      urlcolor=hypercolor,
      pdftitle=\@title,
      pdfsubject=\@subtitle,
      pdfauthor=\g__ugentdocs_pdfauthor_tl
    }
    \hypersetup{
      pdfkeywords = { \clist_use:Nn \g__ugentdocs_keywords_clist { ,~ } }
    }
  }{}
}
\ExplSyntaxOff
\AddToHook{package/hyperxmp/after}{\hypersetup{keeppdfinfo}}
\fancyhf{}
\ExplSyntaxOn
\fancyhead[C]{\small {\renewcommand{\\}[1][]{~}\@shorttitle{}}}
\fancyfoot[L]{
  \tl_if_empty:oTF { \@publisheddate }{
    \translatekey{preprint}
    \bool_lazy_and:nnT
    { ! \tl_if_empty_p:o { \@submitteddate } }
    { ! \tl_if_empty_p:o { \@journal } }
    { {}~\translatekey[lowercase]{submittedto}~\@journal }
  }{
    \translatekey{published}
    \tl_if_empty:oF { \@journal }
    { ~\translatekey[lowercase]{in}:~\@journal }
    \tl_if_empty:oF { \@doi }{
      .~{\small DOI~
        \@ifpackageloaded{hyperref}{
          \exp_args:NV \href \l__ugentdocs_doiurl_str {\@doi}
        }{
          \@doi
        }
      }
    }
  }
}
\fancyfoot[R]{\small \thepage/\ztotpages}
\ExplSyntaxOff

\setlength{\headheight}{13.7pt}
\renewcommand*{\headrulewidth}{0pt}
\renewcommand*{\footrulewidth}{1pt}

\pagestyle{fancy}
\fancypagestyle{titlepage}[fancy]{
  \fancyhead{}
}
\RequirePackage[explicit]{titlesec}
\newcommand{\@titlestylechapter}{}
\newcommand{\@titlestyleappendix}{}
\newcommand{\@titlestylesection}{
  \titleformat{\section}
  [block] % shape
  {\fontsize{14}{17} \selectfont \bfseries } % format
  {\thesection \ } % the label
  { 0ex } %separator space
  { ##1 } %before code
  { } %after code

  % Change the spacing above the chapter. This is left - above - below
  \titlespacing*{\section}{0pt}{6pt}{0pt}
}
\AtBeginDocument{
  \@titlestylechapter
  \@titlestylesection
  \apptocmd{\appendix}{\@titlestyleappendix}{}{}
}

\endinput
%%
%% End of file `ugentarticle.cls'.
