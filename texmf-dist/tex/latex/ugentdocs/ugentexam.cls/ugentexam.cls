%%
%% This is file `ugentexam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ugentdocs.dtx  (with options: `ex')
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
\ProvidesClass{ugentexam}
    [2026/07/03 v1.0.0 .dtx skeleton file]
\RequirePackage{expl3}

%%
\input{ugentcommon.clo}
\ExplSyntaxOn
\bool_new:N \l__ugentdocs_examiner_bool

\keys_define:nn { ugentdocs } {
  examiner .bool_set:N = \l__ugentdocs_examiner_bool ,
  examiner .default:n = true ,
}
\keys_define:nn { ugentdocs } {
  coverbg .bool_set:N = \l__ugentdocs_coverbg_bool ,
  coverbg .default:n = true ,
}
\tl_set:Nn \l__ugentdocs_covertype_tl {exam}
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
                top=2.54cm, bottom=2.54cm, left=2\gridunit, right=2.97cm]{geometry}
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
\newcommand*{\@frontcoverlogos}{}
\newcommand*{\frontcoverlogos}[1]{\renewcommand*{\@frontcoverlogos}{#1}}
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
\newcommand*{\@studentnr}{}
\newcommand*{\studentnr}[1]{\renewcommand*{\@studentnr}{#1}}
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
\seq_new:N \g__ugentdocs_courseswcodes_seq
\seq_new:N \g__ugentdocs_courses_seq
\seq_new:N \g__ugentdocs_coursecodes_seq
\cs_new:Nn \__ugentdocs_addcourse:nn {
  \seq_gput_right:Nn \g__ugentdocs_courseswcodes_seq { \texttt{#1}~#2\strut }
  \seq_gput_right:Nn \g__ugentdocs_courses_seq       { #2\strut             }
  \seq_gput_right:Nn \g__ugentdocs_coursecodes_seq   { \texttt{#1}\strut    }
}
\NewDocumentCommand{\course}{mm}{
  \__ugentdocs_addcourse:nn { #1 } { #2 }
}

\AtBeginDocument{
  \ifseqempty{courses}{
    \msg_warning:nnn { ugentdocs }{ mandatory-macro }{\course}%
  }{}
}
\ExplSyntaxOff
\newcommand*{\@exampart}{}
\newcommand*{\exampart}[1]{\renewcommand*{\@exampart}{#1}}
\newcommand*{\@examseries}{}
\newcommand*{\examseries}[1]{\renewcommand*{\@examseries}{#1}}
\newcommand*{\@examduration}{TBD}
\newcommand*{\examduration}[1]{\renewcommand*{\@examduration}{#1}}
\newcommand*{\@examstart}{TBD}
\newcommand*{\examstart}[1]{\renewcommand*{\@examstart}{#1}}
\newcommand*{\@examend}{TBD}
\newcommand*{\examend}[1]{\renewcommand*{\@examend}{#1}}
\ExplSyntaxOn
\seq_new:N \g__ugentdocs_rooms_seq
\cs_new:Nn \__ugentdocs_addroom:n {
  \seq_gput_right:Nn \g__ugentdocs_rooms_seq { #1\strut }
}
\NewDocumentCommand{\room}{m}{
  \__ugentdocs_addroom:n { #1 }
}
\ExplSyntaxOff
\newcommand{\@extrainfo}{}
\NewDocumentCommand{\extrainfo}{+m} {
  \renewcommand{\@extrainfo}{#1}
}
\ExplSyntaxOn
\newcounter{question}
\newcounter{subquestion}[question]
\setcounter{question}{0}

\renewcommand*\thequestion{\@arabic\c@question}
\renewcommand*\thesubquestion{\alph{subquestion}}

\int_new:N \l__ugentdocs_qweight_int
\bool_new:N \l__ugentdocs_qhasweight_bool
\tl_new:N  \l__ugentdocs_pointlabel_tl
\tl_new:N  \g__ugentdocs_pointlabel_default_tl
\tl_gset:Nn \g__ugentdocs_pointlabel_default_tl { p }
\int_new:N \l__ugentdocs_qoverviewtot_int
\tl_new:N \l__ugentdocs_qoverviewrows_tl

\keys_define:nn { ugentdocs/question } {
  weight     .code:n = {
    \int_set:Nn \l__ugentdocs_qweight_int {#1}
    \bool_set_true:N \l__ugentdocs_qhasweight_bool
  } ,
  pointlabel .tl_set:N = \l__ugentdocs_pointlabel_tl ,
}

\cs_new_protected:Npn \__ugentdocs_qmarginlabel:n #1 {
  \leavevmode
  \kern -1cm
  \llap{ #1 }
  \kern 1cm
}

\box_new:N \l__ugentdocs_qlabel_box

\cs_new_protected:Npn \__ugentdocs_hanginglabel:n #1 {
  \hbox_set:Nn \l__ugentdocs_qlabel_box { #1 }
  \hangindent = \wd\l__ugentdocs_qlabel_box
  \hangafter  = 1
  \box_use:N \l__ugentdocs_qlabel_box
}

\NewDocumentCommand{\question}{O{} +m} {
  \par
  \bool_set_false:N \l__ugentdocs_qhasweight_bool
  \int_zero:N \l__ugentdocs_qweight_int
  \tl_set_eq:NN \l__ugentdocs_pointlabel_tl \g__ugentdocs_pointlabel_default_tl
  \keys_set:nn { ugentdocs/question } { #1 }
  \stepcounter{question}
  \begingroup
    \noindent
    \bool_if:NT \l__ugentdocs_qhasweight_bool {
      \textbf{\__ugentdocs_qmarginlabel:n { \int_use:N \l__ugentdocs_qweight_int \l__ugentdocs_pointlabel_tl }}
    }
    \textbf{\translatekey{question}~\thequestion{}:}~#2%
    \bool_if:NT \l__ugentdocs_qhasweight_bool {
      \__ugentdocs_qoverview_write:nnn { 0 }
        { \thequestion } { \int_use:N \l__ugentdocs_qweight_int }
    }
    \par
  \endgroup
}

\NewDocumentCommand{\subquestion}{O{} +m} {
  \par
  \bool_set_false:N \l__ugentdocs_qhasweight_bool
  \int_zero:N \l__ugentdocs_qweight_int
  \tl_set_eq:NN \l__ugentdocs_pointlabel_tl \g__ugentdocs_pointlabel_default_tl
  \keys_set:nn { ugentdocs/question } { #1 }
  \stepcounter{subquestion}
  \begingroup
    \noindent
    \advance\leftskip by 0.25cm\relax
    \parindent=0pt
    \noindent
    \bool_if:NT \l__ugentdocs_qhasweight_bool {
      \__ugentdocs_qmarginlabel:n { \int_use:N \l__ugentdocs_qweight_int \l__ugentdocs_pointlabel_tl }
    }
    \__ugentdocs_hanginglabel:n { \thesubquestion)~ }
    ~#2%
    \bool_if:NT \l__ugentdocs_qhasweight_bool {
      \__ugentdocs_qoverview_write:nnn { 1 }
        { \thequestion\thesubquestion } { \int_use:N \l__ugentdocs_qweight_int }
    }
    \par
  \endgroup
}
\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__ugentdocs_qoverview_seq
\iow_new:N \g__ugentdocs_qoverview_iow

\cs_new_protected:Npn \__ugentdocs_qoverview_addq:nnn #1#2#3 {
  \seq_gput_right:Nn \g__ugentdocs_qoverview_seq { {#1}{#2}{#3} }
}

\cs_new_protected:Npn \__ugentdocs_qoverview_write:nnn #1#2#3 {
  \iow_now:Nx \g__ugentdocs_qoverview_iow {
    \exp_not:N \__ugentdocs_qoverview_addq:nnn {#1}{#2}{#3}
  }
}

\cs_new_protected:Npn \__ugentdocs_qoverview_procq:nnn #1#2#3 {
  \int_compare:nNnT {#1} = {0} { \int_add:Nn \l__ugentdocs_qoverviewtot_int {#3} }
  \tl_put_right:Nn \l__ugentdocs_qoverviewrows_tl {
    \int_compare:nNnTF {#1} = {0}
    { \textbf{~#2}   ~&~ #3 \\}
    { \phantom{~0}#2 ~&~ \phantom{~0}#3 \\}

  }
}

\ExplSyntaxOff

\ExplSyntaxOn
\AddToHook{begindocument}{
  \seq_gclear:N \g__ugentdocs_qoverview_seq
  \ExplSyntaxOn
  \InputIfFileExists{\jobname.exq}{}{}
  \ExplSyntaxOff
  \iow_open:Nn \g__ugentdocs_qoverview_iow { \jobname.exq }
}
\AddToHook{enddocument/afterlastpage}{
  \iow_close:N \g__ugentdocs_qoverview_iow
}
\ExplSyntaxOff

\ExplSyntaxOn
\NewDocumentCommand{\pointoverview}{}{
  \par
  \group_begin:
  \tl_clear:N \l__ugentdocs_qoverviewrows_tl
  \int_zero:N \l__ugentdocs_qoverviewtot_int
  \seq_map_inline:Nn \g__ugentdocs_qoverview_seq { \__ugentdocs_qoverview_procq:nnn ##1 }
  \begin{tabular}{@{}l@{\hspace{2em}}l@{}}
    \textbf{\translatekey{question}} & \textbf{\translatekey{weight}}\\
    \hline
    \l__ugentdocs_qoverviewrows_tl
    \hline
    \textbf{\translatekey{total}} & \int_use:N \l__ugentdocs_qoverviewtot_int \\
  \end{tabular}
  \group_end:
  \par
}
\ExplSyntaxOff
\NewDocumentCommand{\bilingual}{O{english} O{dutch} +m +m}{%
  \par\noindent
  \begin{minipage}[t]{\dimexpr0.5\linewidth-1em\relax}%
    \foreignlanguage{#1}{#3}%
  \end{minipage}%
  \hfill
  \begin{minipage}[t]{\dimexpr0.5\linewidth-1em\relax}%
    \foreignlanguage{#2}{#4}%
  \end{minipage}%
  \par
}
\newcommand*\@mcsymb{\Square}
\newcommand*\mcsymb[1]{\renewcommand\@mcsymb{#1}}
\newcommand\mc[1]{%
  \hfill\break\qquad\begin{tabular}{cc}
    $\@mcsymb$
    &
    \begin{minipage}[t]{0.9\textwidth}%
      #1
    \end{minipage}%
  \end{tabular}
}
\newlength\@PD % Page diagonal
\pgfmathsetlength\@PD{veclen(\@PW,\@PH)}
\pgfmathsetmacro\@WMA{atan(\@PH/\@PW)}% Watermark angle

\newcommand\gridpage[1]{
  \clearpage
  \AddToHookNext{shipout/foreground}{
    \put(0,-\paperheight){%
      \begin{tikzpicture}
      \path (0,0) (\paperwidth,\paperheight);
      \draw[densely dotted, step=0.5\gridunit,black!20] % Left of footer
        (\gridunit,\gridunit) grid (2\gridunit,2\gridunit);
      \draw[densely dotted, step=0.5\gridunit,black!20] % Right of footer
        (\paperwidth-2\gridunit,\gridunit) grid (\paperwidth-\gridunit,2\gridunit);

      \draw[densely dotted, step=0.5\gridunit,black!20] % Main grid
        (\gridunit,2\gridunit) grid (\paperwidth-\gridunit,\paperheight-2\gridunit);
      \draw[densely dotted, step=0.5\gridunit,black!20] % Left of header
        (\gridunit,\paperheight-2\gridunit) grid (10\gridunit,\paperheight-\gridunit);
      \end{tikzpicture}
    }
    \put(0.5\@PW,-0.5\@PH){\makebox(0,0){\rotatebox{\@WMA}{%
          \parbox{\@PD}{\centering\color{watermarkcolor}%
            \fontsize{105}{130}\selectfont\sffamily #1}}}}%
  }%
  ~\relax
}
\ExplSyntaxOn
\NewDocumentCommand{\answerspacing}{m}{
  \dim_set:Nn \l__ugentdocs_anslinestep_dim {#1}
}

\zref@addprops{savepos}{abspage}
\dim_new:N \l__ugentdocs_anslinestep_dim
\dim_new:N \l__ugentdocs_ansytop_dim
\dim_new:N \l__ugentdocs_ansybottom_dim

\dim_new:N \l__ugentdocs_anstolerancesnap_dim
\dim_set:Nn \l__ugentdocs_anstolerancesnap_dim {1cm}
\dim_new:N \l__ugentdocs_ansgapstop_dim
\dim_set:Nn \l__ugentdocs_ansgapstop_dim {0.2cm}
\dim_new:N \l__ugentdocs_textleft_dim

\int_new:N \g__ugentdocs_anscounter_int
\int_new:N \l__ugentdocs_anstargetpage_int
\dim_new:N \l__ugentdocs_cury_dim
\dim_new:N \l__ugentdocs_needed_dim
\dim_new:N \l__ugentdocs_available_dim
\bool_new:N \l__ugentdocs_ansattop_bool
\tl_new:N \l__ugentdocs_ansstyle_tl
\int_new:N \l__ugentdocs_nlines_int

\AtBeginDocument{
  \dim_set:Nn \l__ugentdocs_anslinestep_dim {\baselineskip}
  \dim_set:Nn \l__ugentdocs_ansytop_dim
    { \paperheight - 1in - \voffset - \topmargin - \headheight - \headsep }
  \group_begin:
    \small
    \dim_gset:Nn \g_tmpa_dim { \box_ht:N \strutbox }
  \group_end:
  \dim_set:Nn \l__ugentdocs_ansybottom_dim
    { \l__ugentdocs_ansytop_dim - \textheight - \footskip + \g_tmpa_dim + \footruleskip }
}

\tikzset{
  answer-grid/.style  =
    { densely~dotted, darkgray, step = \l__ugentdocs_anslinestep_dim },
  answer-lines/.style =
    { densely~dotted, darkgray, xstep = \paperwidth, ystep = \l__ugentdocs_anslinestep_dim },
  answer-/.style      =
    { draw = none },
}

\cs_new:Nn \__ugentdocs_trim_span:n {
  \l__ugentdocs_anslinestep_dim *
  \int_div_truncate:nn { \dim_to_decimal_in_sp:n {#1} }
    { \dim_to_decimal_in_sp:n { \l__ugentdocs_anslinestep_dim } }
}

\cs_new_protected:Nn \__ugentdocs_draw_inline_ansgrid:nn {
  \par\noindent
  \begin{tikzpicture}
    \useasboundingbox (0,0) rectangle (\textwidth,#1);
    \draw [answer-#2] (0,0) grid (\textwidth,#1);
    \draw [thick] (0,0) rectangle (\textwidth,#1);
  \end{tikzpicture}
  \par
}
\cs_generate_variant:Nn \__ugentdocs_draw_inline_ansgrid:nn { nV }

\cs_new_protected:Nn \__ugentdocs_shipout_ansgrid:nnnn {
  \int_compare:nNnT { \value{abspage} } = {#1} {
    \dim_set:Nn \l__ugentdocs_textleft_dim
    { 1in + \hoffset + \int_if_odd:nTF { \value{page} } { \oddsidemargin } { \evensidemargin } }
    \put (0,-\paperheight) {
      \begin{tikzpicture}
        \path (0,0) (\paperwidth,\paperheight);
        \begin{scope}
          \clip (\l__ugentdocs_textleft_dim,\l__ugentdocs_ansybottom_dim)
            rectangle (\l__ugentdocs_textleft_dim+\textwidth,#2);
          \draw [answer-#4, shift={(\l__ugentdocs_textleft_dim,#3)}]
            (0,-\textheight) grid (\textwidth,\textheight);
        \end{scope}
        \draw [thick] (\l__ugentdocs_textleft_dim,\l__ugentdocs_ansybottom_dim)
        |- (\l__ugentdocs_textleft_dim+\textwidth,#2) -- ++(0,\l__ugentdocs_ansybottom_dim-#2);
      \end{tikzpicture}
    }
  }
}

\keys_define:nn { ugentdocs/answerspace } {
  style .tl_set:N  = \l__ugentdocs_ansstyle_tl ,
  lines .int_set:N = \l__ugentdocs_nlines_int ,
}

\NewDocumentCommand{\answerspace}{O{}}{%
  \keys_set:nn { ugentdocs/answerspace } { style = , lines = 0, #1 }
  \par
  \int_gincr:N \g__ugentdocs_anscounter_int
  \zsavepos{answerspace-\int_use:N\g__ugentdocs_anscounter_int}%
  \dim_set:Nn \l__ugentdocs_cury_dim { \zposy{answerspace-\int_use:N\g__ugentdocs_anscounter_int} sp }
  \int_set:Nn \l__ugentdocs_anstargetpage_int {
    \zref@extract{answerspace-\int_use:N\g__ugentdocs_anscounter_int}{abspage}
  }
  \bool_set:Nn \l__ugentdocs_ansattop_bool{
    \dim_compare_p:nNn { \l__ugentdocs_ansytop_dim - \l__ugentdocs_cury_dim } < { 0.05cm }
  }
  \dim_sub:Nn \l__ugentdocs_cury_dim { \l__ugentdocs_ansgapstop_dim }
  \dim_set:Nn \l__ugentdocs_needed_dim {
    \int_if_zero:nTF { \l__ugentdocs_nlines_int }{
      \__ugentdocs_trim_span:n { \l__ugentdocs_cury_dim - \l__ugentdocs_ansybottom_dim }
    }{
      \l__ugentdocs_anslinestep_dim * \l__ugentdocs_nlines_int
    }
  }

  \bool_while_do:nn { \dim_compare_p:nNn { \l__ugentdocs_needed_dim } > { 0pt } } {
    \dim_set:Nn \l__ugentdocs_available_dim
      { \__ugentdocs_trim_span:n { \l__ugentdocs_cury_dim - \l__ugentdocs_ansybottom_dim } }
    \dim_compare:nNnTF { \l__ugentdocs_available_dim - \l__ugentdocs_needed_dim } < { \l__ugentdocs_anstolerancesnap_dim }{
      % Ansbox doesn't fit
      \exp_args:Nnx \AddToHook {shipout/background} {
        \__ugentdocs_shipout_ansgrid:nnnn
        { \int_use:N \l__ugentdocs_anstargetpage_int } % target page
        { \dim_eval:n { % y top
            \bool_if:NTF \l__ugentdocs_ansattop_bool{
              \l__ugentdocs_ansytop_dim
            }{
              \l__ugentdocs_ansybottom_dim + \l__ugentdocs_available_dim
            }
          }
        }
        { \dim_eval:n { % y pattern anchor
            \bool_if:NTF \l__ugentdocs_ansattop_bool {
              \l__ugentdocs_ansytop_dim
            }{
              \l__ugentdocs_ansybottom_dim
            }
          }
        }
        { \l__ugentdocs_ansstyle_tl } % pattern style (grid/lines)
      }
      \nointerlineskip\null
      \clearpage
      \int_incr:N \l__ugentdocs_anstargetpage_int
      \dim_sub:Nn \l__ugentdocs_needed_dim { \l__ugentdocs_available_dim }
      \dim_set_eq:NN \l__ugentdocs_cury_dim \l__ugentdocs_ansytop_dim
      \bool_set_true:N \l__ugentdocs_ansattop_bool
    }{
      % Ansbox fits, just inline
      \__ugentdocs_draw_inline_ansgrid:nV { \dim_use:N \l__ugentdocs_needed_dim } \l__ugentdocs_ansstyle_tl
      \dim_zero:N \l__ugentdocs_needed_dim
    }
  }
}
\ExplSyntaxOff
\ExplSyntaxOn
\renewcommand\maketitle{%
\pagestyle{empty}
\begin{titlepage}
  \setlength\parskip{0pt}%
  \setlength\parindent{0pt}%
  %
  \AddToHookNext{shipout/foreground}{%
    \begin{tikzpicture}[remember~picture,overlay]
    \node[anchor=south~west, inner~sep=0pt]
    at (current~page.south~west) {%
      \@frontcover
    };
    \end{tikzpicture}%
  }%
  \null
\end{titlepage}%
~\par\relax
\clearpage
\@extrainfo{}
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \pagestyle{fancy}
  \thispagestyle{empty}
}
\ExplSyntaxOff
\fancyhf{}
\ExplSyntaxOn
\bool_if:NTF \l__ugentdocs_examiner_bool {
  \fancyhead[R]{\small EXAMINER~VERSION}
  \AddToHook{shipout/background}{
    \put(0.5\@PW,-0.5\@PH){\makebox(0,0){\rotatebox{\@WMA}{%
          \parbox{\@PD}{\centering\color{watermarkcolor}%
            \fontsize{105}{130}\selectfont Examiner~Version}}}}%
  }
}{
  \fancyhead[R]{\small \translatekey{studentnr}:
    {}~\phantom{\large 00000000}~\translatekey{name}:\hspace{3cm}}
}
\fancyfoot[L]{\small{\renewcommand{\\}[1][]{~}\@shorttitle{}}}
\fancyfoot[R]{\small
\ifx\@examseries\@empty~\else\translatekey{series}~\@examseries\fi{}
{}~---~\@academicyear}
\ExplSyntaxOff

\setlength{\headheight}{13.7pt}
\renewcommand*{\headrulewidth}{0pt}
\renewcommand*{\footrulewidth}{1pt}
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
\setlength\@HT{0.9\@PH}

\bool_if:NTF \l__ugentdocs_coverbg_bool {
  \setlength\@MTLR{2\gridunit}
}{
  \setlength\@MTLR{\gridunit}
}
\ExplSyntaxOff
\newcommand{\@coverbodybama}{}
\newcommand{\@coverbodyreport}{}
\ExplSyntaxOn
\newcommand{\@coverbodyexam}{
  % Top data
  \node[anchor=north~west,text~width={\paperwidth-\@MTLR-\gridunit},align=flush~left]
  at (\@MTLR,{\paperheight-\@HTS-\gridunit}) {%
    \color{covertitlecolor}{
      \fontsize{18}{22}\selectfont%
      \textsf{\textbf{\printseq{courses}{\\}{\\}{\\}}}\par
      \ifx\@exampart\@empty\else
        \textsf{\textbf{\@exampart}}\par
      \fi
      \fontsize{12}{18}\selectfont%
      \textsf{\printseq{coursecodes}{\\}{\\}{\\}}
    }
    \color{coverdatacolor}{
      \vskip 2em
      \fontsize{12}{18}\selectfont%
      \textsf{
        \ifx\@examseries\@empty{}~\else\translatekey{series}~\@examseries{}\fi
      }
      \vskip 2em
      \fontsize{14}{19}\selectfont%
      \textsf{\translatekey{exam}~\@date{}}
    }
  };

  % Fill-in of surname, name, and student ID
  \node[anchor=south~west,align=left,inner~sep=0pt]
  at (\@MTLR,18){%
    \fontsize{12}{18}\selectfont%
    \color{coverdatacolor}{%
      \textsf{\translatekey{lastname}}
    }
  };
  \foreach \nn in {0,1,...,33} {
    \draw[fill=white] (\@MTLR,17) ++({0.5*\nn},0) rectangle +(0.5,0.8);
  }

  \node[anchor=south~west,align=left,inner~sep=0pt]
  at (\@MTLR,16){%
    \fontsize{12}{18}\selectfont%
    \color{coverdatacolor}{%
      \textsf{\translatekey{firstname}}
    }
  };
  \foreach \nn in {0,1,...,23} {
    \draw[fill=white] (\@MTLR,15) ++({0.5*\nn},0) rectangle +(0.5,0.8);
  }

  \node[anchor=south~west,align=left,inner~sep=0pt]
  at (\@MTLR+26*0.5cm,16){%
    \fontsize{12}{18}\selectfont%
    \color{coverdatacolor}{%
      \textsf{\translatekey{studentnr}}
    }
  };
  \foreach \nn in {0,1,...,7} {
    \draw[fill=white] (\@MTLR+26*0.5cm,15) ++({0.5*\nn},0) rectangle +(0.5,0.8);
  }

  % Bottom data
  \node[anchor=south~west,align=flush~left,inner~sep=0pt,text~width={\paperwidth-\@MTLR-\gridunit}]
  at (\@MTLR,5\gridunit){%
    \color{coverdatacolor}{
      \fontsize{12}{21}\selectfont%
      \textsf{\translatekey{examduration}:~\@examduration}\\
      \textsf{\begin{tabular}{@{}rl}%
        \translatekey{examstart}:~& \@examstart\\
        \translatekey{examend}:~& \@examend
        \end{tabular}}
      \vskip 2em
      \textsf{\getseqcaption{rooms}{:
        {}~\printseq{rooms}{~\&~}{,~}{\translatekey{andlist}~}}}
      \vskip 2em
       \begin{tabular}{@{}l@{~\,}p{14.5cm}}
        \getseqcaption{lecturers}{
        & \textbf{\printseq{lecturers}{~\&~}{,~}{\translatekey{andlist}~}}}
      \end{tabular}
      \vskip 2em
      \textsf{\printseq{degrees}{\\}{\\}{\\}}
    }
  };
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
\newcommand{\@frontcover}{
  \begin{tikzpicture}[inner~sep=0pt, outer~sep=0pt]
  \clip (0,0) rectangle (\@PW,\@PH);

  % Faculty logo
  \begin{scope}[shift={(0,\@PH-3*\gridunit)}]
    \faclogo{3*\gridunit}{ugent@\@fselector}{0}
  \end{scope}

  % Coloured background
  \bool_if:NT \l__ugentdocs_coverbg_bool {
    \fill[coverbgcolor] (\gridunit,4*\gridunit) rectangle (\@PW,\@PH-\@HTS);
    \begingroup
    \colorlet{hypercolor}{covertitlecolor}
  }

  % Cover body
  \@coverbody

  % UGent logo
  \begin{scope}[shift={(0,0)}]
    \ugentlogo{4*\gridunit}{ugent@main}{0}
  \end{scope}

  % Front cover logos
  \ifx\@frontcoverlogos\@empty\else
    \node[anchor=south~east, inner~sep=0pt,
      text~width=\paperwidth-(2+\@ugenttextw/\@logounit)*\gridunit,
      minimum~height=2*\gridunit, align=flush~right]
    at (\paperwidth-\gridunit,\gridunit)
      {\@frontcoverlogos};
  \fi

  \bool_if:NT \l__ugentdocs_coverbg_bool {
    \endgroup
  }
  \end{tikzpicture}
}
\ExplSyntaxOff
\newcommand{\@backcover}{}
\endinput
%%
%% End of file `ugentexam.cls'.
