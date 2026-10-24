%%
%% This is file `ugentreport.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ugentdocs.dtx  (with options: `rp')
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
\ProvidesClass{ugentreport}
    [2026/07/03 v1.0.0 .dtx skeleton file]
\RequirePackage{expl3}
\AtEndOfClass{\renewcommand*{\@academicyear}{}}
\input{ugentcommon.clo}
\ExplSyntaxOn
\bool_new:N \l__ugentdocs_thumbs_bool
\bool_new:N \l__ugentdocs_copyright_bool

\keys_define:nn { ugentdocs } {
  copyright .bool_set:N = \l__ugentdocs_copyright_bool ,
  copyright .default:n = true ,
}
\keys_define:nn { ugentdocs } {
  coverbg .bool_set:N = \l__ugentdocs_coverbg_bool ,
  coverbg .default:n = true ,
}
\tl_set:Nn \l__ugentdocs_covertype_tl {report}
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
\tl_gset:Nn \g__ugentdocs_baseclass_tl { book }
\__ugentdocs_declare_option_group:nnn { paper }
  { a4paper, a5paper, b5paper, letterpaper, legalpaper, executivepaper } { a4paper }
\__ugentdocs_declare_option_group:nnn { size }  { 10pt, 11pt, 12pt }     { 11pt }
\__ugentdocs_declare_option_group:nnn { sides } { oneside, twoside }     { oneside }
\__ugentdocs_declare_option_group:nnn { open }  { openright, openany }   { openright }
\ExplSyntaxOff
\ProcessKeyOptions[ ugentdocs ]
\ExplSyntaxOn
\__ugentdocs_pass_option_groups:
\ExplSyntaxOff
\LoadClass{book}
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
\ExplSyntaxOn
\bool_if:NT \l__ugentdocs_copyright_bool {
  \RequirePackage[contents={},color=watermarkcolor,scale=3]{background}
}
\ExplSyntaxOff
\newcommand{\@addthumb}{}
\newlength{\@PW}      % Paper width
\newlength{\@PH}      % Paper height
\newlength{\gridunit} % Grid unit layout
\newcommand*{\@setgridunit}{\pgfmathsetlength{\gridunit}{max(\@PW,\@PH)/7/4}}
\setlength\@PW{210mm}
\setlength\@PH{297mm}
\@setgridunit
\RequirePackage[heightrounded,paperwidth=\@PW,paperheight=\@PH,
                top=2.54cm, bottom=2.54cm, left=2\gridunit, right=2.97cm]{geometry}
\newcommand{\insettext}[2]{
  \par\noindent
  \begin{adjustbox}{center}%
    \begin{tikzpicture}%
      \node[align=flush left, text width=\linewidth-6mm, inner sep=3mm] (body) {#2};
      \ifblank{#1}{}{%
        \node[align=flush left, text width=\linewidth-6mm, inner sep=3mm,
        fill=insetboxcolor, text=white, font=\bfseries,
        above=0pt of body, anchor=south] (title) {#1};
      }%
      \begin{scope}[on background layer]
      \ifblank{#1}{%
        \node[fill=insetboxcolor!10, fit=(body), inner sep=0mm] {};
      }{%
        \node[fill=insetboxcolor!10, fit=(body)(title), inner sep=0mm] {};
      }%
      \end{scope}
    \end{tikzpicture}%
  \end{adjustbox}%
  \par
}
\newlength{\@quotetextwidth}
\newlength{\@quoteinnerxsep}
\setlength{\@quoteinnerxsep}{10mm}

\newcommand{\@insetquotepicture}[2]{
  \begin{tikzpicture}[baseline]
    \node[align=#1, text width=\@quotetextwidth,
    inner xsep=\@quoteinnerxsep, inner ysep=6mm] (qtext) {#2};
    \node[font=\Huge, anchor=north west] at (qtext.north west) {``};
    \node[font=\Huge, anchor=south east] at (qtext.south east) {''};
  \end{tikzpicture}
}

\newcommand{\insetquote}[2]{
  \insettext{}{%
    \settowidth{\@quotetextwidth}{#1}%
    \ifdim\@quotetextwidth>\dimexpr\linewidth-6mm-2\@quoteinnerxsep\relax
    \setlength{\@quotetextwidth}{\dimexpr\linewidth-6mm-2\@quoteinnerxsep\relax}%
    \@insetquotepicture{justify}{#1}\par
    \else
    \begin{center}
      \@insetquotepicture{center}{#1}\par
    \end{center}
    \fi
    \ifblank{#2}{}{\raggedleft #2\par}%
  }%
}
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
\newcommand\@extra{}
\newcommand\extra[1]{\renewcommand\@extra{#1}}
\newcommand*{\@frontcoverlogos}{}
\newcommand*{\frontcoverlogos}[1]{\renewcommand*{\@frontcoverlogos}{#1}}
\ExplSyntaxOn
\newcommand*\@doctype{
  \msg_warning:nnn { ugentdocs }{ mandatory-macro }{\doctype}%
}
\newcommand*\doctype[1]{
  \renewcommand*\@doctype{\translatekey{#1}}
}
\ExplSyntaxOff
\newcommand*\@wordcount{}
\newcommand*\wordcount[1]{
  \renewcommand*\@wordcount{#1}
}
\ExplSyntaxOn
\cs_new:Nn \__ugentdocs_runwordcount: {
  \ShellEscape{texcount~-1~-sum~-merge~-q~\jobname.tex~>~\jobname.wc}
  \file_if_exist:nTF { \jobname.wc } {
    \file_get:nnN { \jobname.wc } { } \l_tmpa_tl
    \tl_to_str:N \l_tmpa_tl
    \xdef\@wordcount{\l_tmpa_tl}
  }{
    \gdef\@wordcount{?}
  }
}
\NewDocumentCommand{\runwordcount}{}{
  \__ugentdocs_runwordcount:
}
\ExplSyntaxOff
\ExplSyntaxOn
\bool_new:N \l__ugentdocs_embargo_bool
\bool_new:N \l__ugentdocs_embargotemp_bool
\ExplSyntaxOff
\newcommand{\@copyrightnotices}{}
\newcommand{\copyrightnotices}[1]{\renewcommand{\@copyrightnotices}{#1}}
\newcommand{\@extranotices}{}
\newcommand{\extranotices}[1]{\renewcommand{\@extranotices}{#1}}
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
\newcommand*{\@address}{}
\newcommand*{\address}[1]{\renewcommand*{\@address}{#1}}
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
\seq_new:N \g__ugentdocs_phones_seq
\cs_new:Nn \__ugentdocs_addphone:n {
  \seq_gput_right:Nn \g__ugentdocs_phones_seq {#1\strut}
}
\RenewDocumentCommand{\phone}{m}{ % Already def'ed in wasysym
  \__ugentdocs_addphone:n { #1 }
}
\ExplSyntaxOff
\ExplSyntaxOn
\seq_new:N \g__ugentdocs_mobiles_seq
\cs_new:Nn \__ugentdocs_addmobile:n {
  \seq_gput_right:Nn \g__ugentdocs_mobiles_seq {#1\strut}
}
\NewDocumentCommand{\mobile}{m}{
  \__ugentdocs_addmobile:n { #1 }
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
\ifx\@copyrightnotices\@empty\else
\noindent\@copyrightnotices
\fi
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
  }{}
}
\ExplSyntaxOff
\AddToHook{package/hyperxmp/after}{\hypersetup{keeppdfinfo}}
\apptocmd{\frontmatter}{\pagestyle{frontmatter}}{}{}
  % Auto set when calling frontmatter
\if@twoside
\fancypagestyle{frontmatter}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[RO]{\thepage}
  \fancyfoot[LE]{\thepage}
}
\else
\fancypagestyle{frontmatter}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[R]{\thepage}
}
\fi

\renewcommand{\chaptermark}[1]{\markboth{\thechapter. \ #1}{}}
  % Set chapter mark to e.g. 1. Chapter title
\renewcommand{\sectionmark}[1]{%
  \ifnum\c@chapter=\z@
  \markboth{\thesection. \ #1}{}%
  \else
  \markright{\thesection. \ #1}%
  \fi
}
\apptocmd{\mainmatter}{\pagestyle{mainmatter}}{}{}
  % Auto set when calling mainmatter

\if@twoside
\fancypagestyle{mainmatter}{
  \fancyhf{}
  \fancyhead[LO]{ \leftmark}
  % \fancyhead[RE]{ \rightmark}
  \fancyfoot[RO]{\thepage}
  \fancyfoot[LE]{\thepage}
  \renewcommand{\headrulewidth}{0.15pt}
}
\else
\fancypagestyle{mainmatter}{
  \fancyhf{}
  \fancyhead[L]{ \leftmark}
  \fancyfoot[R]{\thepage}
  \fancyfoot[L]{
      \begin{tikzpicture}[overlay,remember picture]
      \begin{scope}[shift={(current page.south west)}, xshift=2\gridunit-0.45cm]
        \ugentlogo{1.8cm}{ugent@main}{0.0}
      \end{scope}
      \end{tikzpicture}
  }
  \renewcommand{\headrulewidth}{0.15pt}
}
\fi

\if@twoside
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[RO]{\thepage}
  \fancyfoot[LE]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\else
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[R]{\thepage}
  \fancyfoot[L]{
    \begin{tikzpicture}[overlay,remember picture]
      \begin{scope}[shift={(current page.south west)}, xshift=2\gridunit-0.45cm]
        \ugentlogo{1.8cm}{ugent@main}{0.0}
      \end{scope}
    \end{tikzpicture}
  }
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fi

\setlength{\headheight}{21pt}
\setlength{\footskip}{1.5cm}
\ExplSyntaxOn
\tl_new:N \l__ugentdocs_chaptitlestyle_tl
\ExplSyntaxOff
\ExplSyntaxOn
\tl_set:Nn \l__ugentdocs_chaptitlestyle_tl {plain}
\ExplSyntaxOff
\RequirePackage[explicit]{titlesec}
\ExplSyntaxOn
\newcommand{\@titlestyleappendix}{}

\newcommand{\@titlestylechapter}{
  \exp_args:Nx \str_case:nnF { \l__ugentdocs_chaptitlestyle_tl } {
    { plain } {
      \titleformat{\chapter}
      [block] % shape
      {\fontsize{16}{19} \selectfont \color{titlecolor} \bfseries } % format
      {\thechapter. \ } % the label
      { 0ex } %separator space
      {\MakeUppercase{\uline{##1}} } %before code
      [\@addthumb] %after code

      \titleformat{name=\chapter,numberless}
      [block] % shape
      {\fontsize{16}{19} \selectfont \color{titlecolor} \bfseries } % format
      {} % the label
      {0ex}%separator space
      {\uline{\MakeUppercase{##1}}} %before code

      % Change the spacing above the chapter. This is left - above - below
      \titlespacing*{\chapter}{0pt}{-3em}{12pt}

      \renewcommand{\@titlestyleappendix}{ % Adds "appendix" to title
        \titleformat{\chapter}
        [display] % shape
        {\fontsize{18}{22}\selectfont\color{titlecolor}} % format
        {\MakeUppercase{\chaptertitlename\ \thechapter}} % the label
        {-2ex} %separator space
        {\fontsize{24}{32}\selectfont\bfseries\raggedright\MakeUppercase{%
            \uline{####1}}} %before code
        [\@addthumb] %after code
      }
    }
    { fancy } {
      \titleformat{\chapter}
        [display] % shape
        {}{}{0pt} % format, label, sep (unused: box+number are drawn manually)
        {%
          \begin{tikzpicture}[remember~picture, overlay]
          % Number coloured box
          \node[fill=titlecolor, minimum~height=3\gridunit, minimum~width=
          4\gridunit+\the\hoffset, inner~sep=0pt, anchor=north~east]
          (numbox)
          at ([xshift=\the\hoffset,yshift=-3\gridunit]current~page.north~east) {};

          % Chapter number
          \node[white, font=\fontsize{70}{70}\selectfont\bfseries, anchor=center]
          at ([xshift=1.5\gridunit]numbox.west |- numbox.center) {\thechapter};

          % Chapter name
          \node[white, font=\bfseries\normalsize, rotate=90, anchor=center, inner~sep=2pt]
          at ([xshift=3.5\gridunit]numbox.west |- numbox.center) {\chaptername};

          \end{tikzpicture}%
          \group_begin:
          \skip_set:Nn \topsep    { \dim_eval:n { \topsep } }
          \skip_set:Nn \partopsep { \dim_eval:n { \partopsep } }
          \skip_set:Nn \parskip   { \dim_eval:n { \parskip } }
          \vspace*{20pt}
          \begin{flushright}
            \color{titlecolor}\huge\bfseries##1%
          \end{flushright}%
          \vspace*{-10pt}%
          {\color{titlecolor}\rule{\textwidth}{1pt}}
          \group_end:
        }
        [\@addthumb] %after code

      \titleformat{name=\chapter,numberless}
      [block]
      {}{}{0pt}
      {%
        \group_begin:
        \skip_set:Nn \topsep    { \dim_eval:n { \topsep } }
        \skip_set:Nn \partopsep { \dim_eval:n { \partopsep } }
        \skip_set:Nn \parskip   { \dim_eval:n { \parskip } }
        \begin{flushright}
          \color{titlecolor}\huge\bfseries##1%
        \end{flushright}%
        \vspace*{-10pt}%
        {\color{titlecolor}\rule{\textwidth}{1pt}}
        \group_end:
      }

      \titlespacing*{\chapter}{0pt}{0pt}{20pt}

      % No thumb on chapter page
      \bool_if:NT \l__ugentdocs_thumbs_bool {
        \apptocmd{\@addthumb}{\stopthumb}{}{}
        \AddToHook{shipout/foreground}{\continuethumb}
      }

    }
    { fancycompact} {
      \titleformat{\chapter}
      [display] % shape
      {}{}{0pt} % format, label, sep (unused: box+number are drawn manually)
      {%
        \begin{tikzpicture}[remember~picture, overlay]
        % Number coloured box
        \node[fill=titlecolor, minimum~height=3\gridunit, minimum~width=
        4\gridunit+\the\hoffset, inner~sep=0pt, anchor=north~east]
        (numbox)
        at ([xshift=\the\hoffset,yshift=-3\gridunit]current~page.north~east) {};

        % Chapter number
        \node[white, font=\fontsize{70}{70}\selectfont\bfseries, anchor=center]
         at ([xshift=1.5\gridunit]numbox.west |- numbox.center) {\thechapter};

        % Chapter name
        \node[white, font=\bfseries\normalsize, rotate=90,
        anchor=center,inner~sep=2pt]
        at ([xshift=3.5\gridunit]numbox.west |- numbox.center) {\chaptername};

        % Chapter title
        \node[titlecolor, font=\huge\bfseries,
        anchor=south~east, align=flush~right, text~width=0.85\textwidth]
        at ([xshift=-10pt,yshift=10pt]numbox.west |- numbox.south) {##1};

        % Rule
        \draw[titlecolor, line~width=1pt]
        ([xshift=-\the\hoffset]current~page~text~area.west |- numbox.south)
          -- (numbox.south~east);
        \end{tikzpicture}%
        \vspace*{40pt}
      }
      [\@addthumb] %after code

      \titleformat{name=\chapter,numberless}
      [block]
      {}{}{0pt}
      {%
        \group_begin:
        \skip_set:Nn \topsep    { \dim_eval:n { \topsep } }
        \skip_set:Nn \partopsep { \dim_eval:n { \partopsep } }
        \skip_set:Nn \parskip   { \dim_eval:n { \parskip } }
        \begin{flushright}
          \color{titlecolor}\huge\bfseries##1%
        \end{flushright}%
        \vspace*{-10pt}%
        {\color{titlecolor}\rule{\textwidth}{1pt}}
        \group_end:
      }

      \titlespacing*{\chapter}{0pt}{0pt}{20pt}

      % No thumb on chapter page
      \bool_if:NT \l__ugentdocs_thumbs_bool {
        \apptocmd{\@addthumb}{\stopthumb}{}{}
        \AddToHook{shipout/foreground}{\continuethumb}
      }
    }
    { uantwerpen } {
      % Adapted from uantwerpendocs v4.12, (C) Walter Daems, LPPL 1.3c
      \def\@makechapterhead##1{%
        \vspace*{1ex}%
        \begin{flushright}
          \makebox[0pt][l]{\color{titlecolor}\rule[-0.4em]{10cm}{1.8em}}\textcolor{white}
          {\LARGE\textbf{~\chaptername~}}
          \raisebox{-24pt}{
            \@UAChapNum
          }\hspace*{-8pt}
          \par\nobreak
          \interlinepenalty\@M
          \huge\textbf{\textcolor{titlecolor}{\rule[-0.5ex]{0em}{2.6ex}~##1}}
          \par\nobreak
        \end{flushright}
        \rule{\textwidth}{1pt}
        \vspace{5\p@}%
        \@addthumb % Add thumb for every numbered chapter
        \par\nobreak
      }
      \def\@schapter##1{%
        \@makeschapterhead{##1}%
        \@afterheading
      }
      \def\@makeschapterhead##1{%
        \vspace*{1ex}%
        \begin{flushright}
          \LARGE\textbf{\textcolor{titlecolor}{\rule[-0.5ex]{0em}{2.6ex}~##1}}
        \end{flushright}
        \rule{\textwidth}{1pt}
        \vspace{5\p@}\par
      }
    }
    { legacyplain }{
      \newcommand*{\@legacychapshape}[3]{%
        % args: label text, text col, font style
        \begin{tikzpicture}[baseline=(o), overlay]
        \node[draw, text~width=3cm, align=flush~right, anchor=base~east,
        ##2, fill=titlecolor] (n) at (-10pt, 0) {{##3\textbf{##1}}};
        \node[inner~sep=0, outer~sep=0] (o) at (0,0) {};
        \end{tikzpicture}%
      }

      \titleformat{\chapter}[block]
      {\Large\bfseries}{}{20pt}{%
        \makebox[0pt][r]{\@legacychapshape{\thechapter}{white}{\fontsize{16}{18}\selectfont}}%
        ##1%
      }[\@addthumb]

      \titleformat{name = \chapter, numberless}[block]
      {\Large\bfseries}{}{0pt}{%
        \makebox[0pt][r]{\@legacychapshape{0}{ugent@main}{\large}}%
        ##1%
      }
      \titlespacing*{\section}{0pt}{-20pt}{10pt}
    }
  }{
    \PackageError{ugentdocs}
    { The~chapter~styling~specified~is~not~implemented }
    { See~the~ugentdocs~manual. }
  }
}

\def\appendix{
  \cleardoublepage
  \setcounter{chapter}{0}
  \renewcommand*{\thechapter}{\Alph{chapter}}
  \renewcommand*\chaptername\appendixname
}

\ExplSyntaxOff
%% Adapted from uantwerpendocs v4.12, (C) Walter Daems, LPPL 1.3c
\newcommand*{\@UAChapNum}{%
  \begin{tikzpicture}
  \foreach \theta in {0,5,...,355} {
    \node[color=white] at (\theta:0.025)
    {\fontsize{72}{12}\selectfont\textbf{\thechapter}};
  }
  \node[color=titlecolor!50] at (0,0)
  {\fontsize{72}{12}\selectfont\textbf{\thechapter}};
  \end{tikzpicture}%
}
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
\ExplSyntaxOn
\tl_new:N \l__ugentdocs_authortable_tl
\ExplSyntaxOff
\newcommand{\@coverbodybama}{}
\ExplSyntaxOn
\newcommand{\@coverbodyreport}{
  \node[anchor=north~west, inner~sep=0pt, text~width=\paperwidth-\@MTLR-\gridunit,
  minimum~height=22.05cm, align=flush~left] at (\@MTLR,\@HT)
  {%
    \raggedright
    \begin{spacing}{2.5}
      {\fontsize{25}{30}\selectfont\color{covertitlecolor}\bfseries
        \MakeUppercase{\uline{\@title}}}
    \end{spacing}

    \vskip 1em

    {\fontsize{15}{18}\selectfont\color{covertitlecolor}
      \MakeUppercase{\@subtitle}}

    \vskip 2em

    \begingroup\color{coverdatacolor}
    \ifx\@extra\@empty\else
    {\fontsize{12}{15}\selectfont\@extra}
    \fi

    \ifx\@wordcount\@empty\else
    \translatekey{wordcount}:~\@wordcount
    \fi

    \ifseqempty{authors}{
      \vskip 10em
    }{
      \vskip 5em
      \tl_set:Nx \l__ugentdocs_authortable_tl { \printseq{authorswaff}{\cr}{\cr}{\cr} }
      {\fontsize{12}{15}\selectfont
        \leavevmode\vbox{\halign{##\hfil&\hskip1em##\hfil\cr
            \l__ugentdocs_authortable_tl
            \cr}}
      }
      \ifx\@studentnr\@empty\else
      \translatekey{studentnr}:~\@studentnr
      \fi
      \vskip 5em
    }

    \ifseqempty{lecturers}{}{
      {\fontsize{12}{15}\selectfont
        \getseqcaption{lecturers}{}:~\printseq{lecturers}{~\&~}{,~}{\translatekey{andlist}~}}
      \vskip 2 em
    }

    \ifx\@address\@empty\else
    {\fontsize{12}{15}\selectfont\@address}
    \vskip 2 em
    \fi

    \ifx\@academicyear\@empty\else
    {\fontsize{12}{15}\selectfont\translatekey{acyear}:~\@academicyear}
    \fi
    \endgroup
  };
}
\ExplSyntaxOff
\newcommand{\@coverbodyexam}{}

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
\renewcommand{\@copyrightnotices}{
  \null\par
  \vspace*{\stretch{1}}
  {
    \setlength\parindent{0em}
    \translatekey{typeset}~\textrm{\LaTeX{}}~\translatekey[lowercase]{and}
    {}~\translatekey[lowercase]{the-het}~\texttt{ugentdocs}~\translatekey[lowercase]{package}.\\
    \@extranotices

    \copyright{}~\the\year~\translatekey{org-ugent},
    \translatekey[lowercase]{arr}.
  }
}
\endinput
%%
%% End of file `ugentreport.cls'.
