%% ltsaskaita.cls: invoices in Lithuanian
% Copyright (C) 2026 Justas Arbatauskis
%
% This work may be distributed and/or modified under the conditions of the
% LaTeX Project Public License, either version 1.3c of this license or (at your
% option) any later version. The latest version of this license is at
% https://www.latex-project.org/lppl.txt
%
% This work has the LPPL maintenance status "maintained".
% The Current Maintainer of this work is Justas Arbatauskis.
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{ltsaskaita}[2026/11/09 v1.0 Invoices in Lithuanian]
\newif\if@ltspvm
\DeclareOption{pvm}{\@ltspvmtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt,a4paper]{article}
\RequirePackage{iftex}
\ifTUTeX\else
  \RequirePackage[L7x]{fontenc}
  \RequirePackage{lmodern}
\fi
\RequirePackage[a4paper,margin=20mm]{geometry}
\RequirePackage{array,tabularx,booktabs}
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

\ExplSyntaxOn
\tl_new:N \g__lts_serija_tl
\tl_new:N \g__lts_numeris_tl
\tl_new:N \g__lts_data_tl
\tl_new:N \g__lts_terminas_tl
\tl_new:N \g__lts_pastaba_tl
\tl_new:N \g__lts_pardavejas_tl
\tl_new:N \g__lts_pirkejas_tl
\tl_new:N \g__lts_eilutes_tl
\tl_new:N \l__lts_kiekis_tl
\tl_gset:Nn \g__lts_tarifas_tl { 21 }
\int_new:N \g__lts_nr_int
\int_new:N \g__lts_suma_int
\int_new:N \l__lts_eil_int
\int_new:N \l__lts_pvm_int
\int_new:N \l__lts_a_int
\int_new:N \l__lts_b_int
\int_new:N \l__lts_c_int
\int_new:N \l__lts_x_int
\seq_new:N \l__lts_z_seq

\NewDocumentCommand \serija { m } { \tl_gset:Nn \g__lts_serija_tl {#1} }
\NewDocumentCommand \numeris { m } { \tl_gset:Nn \g__lts_numeris_tl {#1} }
\NewDocumentCommand \israsyta { m } { \tl_gset:Nn \g__lts_data_tl {#1} }
\NewDocumentCommand \terminas { m } { \tl_gset:Nn \g__lts_terminas_tl {#1} }
\NewDocumentCommand \pastaba { m } { \tl_gset:Nn \g__lts_pastaba_tl {#1} }
\NewDocumentCommand \pardavejas { m } { \tl_gset:Nn \g__lts_pardavejas_tl {#1} }
\NewDocumentCommand \pirkejas { m } { \tl_gset:Nn \g__lts_pirkejas_tl {#1} }
\NewDocumentCommand \pvmtarifas { m } { \tl_gset:Nn \g__lts_tarifas_tl {#1} }

% Amounts are whole cents: 123456 prints as 1 234,56.
\cs_new:Npn \__lts_tri:n #1
  {
    \int_compare:nNnT {#1} < { 100 } { 0 }
    \int_compare:nNnT {#1} < { 10 } { 0 }
    \int_eval:n {#1}
  }
\cs_new:Npn \__lts_tukst:n #1
  {
    \int_compare:nNnTF {#1} < { 1000 }
      { \int_eval:n {#1} }
      {
        \__lts_tukst:n { \int_div_truncate:nn {#1} { 1000 } }
        \exp_not:N \,
        \__lts_tri:n { \int_mod:nn {#1} { 1000 } }
      }
  }
\cs_new:Npn \__lts_pinigai:n #1
  {
    \__lts_tukst:n { \int_div_truncate:nn {#1} { 100 } } ,
    \int_compare:nNnT { \int_mod:nn {#1} { 100 } } < { 10 } { 0 }
    \int_mod:nn {#1} { 100 }
  }

\NewDocumentCommand \preke { m m m m }
  {
    \int_gincr:N \g__lts_nr_int
    \int_set:Nn \l__lts_eil_int { \fp_to_int:n { round ( (#2) * (#4) * 100 , 0 ) } }
    \int_gadd:Nn \g__lts_suma_int { \l__lts_eil_int }
    \tl_set:Nn \l__lts_kiekis_tl {#2}
    \tl_replace_all:Nnn \l__lts_kiekis_tl { . } { , }
    \tl_gput_right:Nx \g__lts_eilutes_tl
      {
        \int_use:N \g__lts_nr_int
        \exp_not:n { & #1 & }
        \exp_not:V \l__lts_kiekis_tl
        \exp_not:n { & #3 & }
        \__lts_pinigai:n { \fp_to_int:n { round ( (#4) * 100 , 0 ) } }
        \exp_not:N &
        \__lts_pinigai:n { \int_use:N \l__lts_eil_int }
        \exp_not:N \tabularnewline
      }
  }

\tl_const:cn { c__lts_v_1_tl } { vienas }
\tl_const:cn { c__lts_v_2_tl } { du }
\tl_const:cn { c__lts_v_3_tl } { trys }
\tl_const:cn { c__lts_v_4_tl } { keturi }
\tl_const:cn { c__lts_v_5_tl } { penki }
\tl_const:cn { c__lts_v_6_tl } { šeši }
\tl_const:cn { c__lts_v_7_tl } { septyni }
\tl_const:cn { c__lts_v_8_tl } { aštuoni }
\tl_const:cn { c__lts_v_9_tl } { devyni }
\tl_const:cn { c__lts_l_10_tl } { dešimt }
\tl_const:cn { c__lts_l_11_tl } { vienuolika }
\tl_const:cn { c__lts_l_12_tl } { dvylika }
\tl_const:cn { c__lts_l_13_tl } { trylika }
\tl_const:cn { c__lts_l_14_tl } { keturiolika }
\tl_const:cn { c__lts_l_15_tl } { penkiolika }
\tl_const:cn { c__lts_l_16_tl } { šešiolika }
\tl_const:cn { c__lts_l_17_tl } { septyniolika }
\tl_const:cn { c__lts_l_18_tl } { aštuoniolika }
\tl_const:cn { c__lts_l_19_tl } { devyniolika }
\tl_const:cn { c__lts_d_2_tl } { dvidešimt }
\tl_const:cn { c__lts_d_3_tl } { trisdešimt }
\tl_const:cn { c__lts_d_4_tl } { keturiasdešimt }
\tl_const:cn { c__lts_d_5_tl } { penkiasdešimt }
\tl_const:cn { c__lts_d_6_tl } { šešiasdešimt }
\tl_const:cn { c__lts_d_7_tl } { septyniasdešimt }
\tl_const:cn { c__lts_d_8_tl } { aštuoniasdešimt }
\tl_const:cn { c__lts_d_9_tl } { devyniasdešimt }

\cs_new_protected:Npn \__lts_triada:n #1
  {
    \int_set:Nn \l__lts_a_int { \int_div_truncate:nn {#1} { 100 } }
    \int_set:Nn \l__lts_b_int { \int_mod:nn {#1} { 100 } }
    \int_compare:nNnT \l__lts_a_int > \c_zero_int
      {
        \seq_put_right:Nv \l__lts_z_seq { c__lts_v_ \int_use:N \l__lts_a_int _tl }
        \int_compare:nNnTF \l__lts_a_int = \c_one_int
          { \seq_put_right:Nn \l__lts_z_seq { šimtas } }
          { \seq_put_right:Nn \l__lts_z_seq { šimtai } }
      }
    \int_compare:nNnTF \l__lts_b_int < { 20 }
      {
        \int_compare:nNnTF \l__lts_b_int < { 10 }
          {
            \int_compare:nNnT \l__lts_b_int > \c_zero_int
              { \seq_put_right:Nv \l__lts_z_seq { c__lts_v_ \int_use:N \l__lts_b_int _tl } }
          }
          { \seq_put_right:Nv \l__lts_z_seq { c__lts_l_ \int_use:N \l__lts_b_int _tl } }
      }
      {
        \seq_put_right:Nv \l__lts_z_seq
          { c__lts_d_ \int_eval:n { \int_div_truncate:nn { \l__lts_b_int } { 10 } } _tl }
        \int_compare:nNnT { \int_mod:nn { \l__lts_b_int } { 10 } } > \c_zero_int
          {
            \seq_put_right:Nv \l__lts_z_seq
              { c__lts_v_ \int_eval:n { \int_mod:nn { \l__lts_b_int } { 10 } } _tl }
          }
      }
  }

% #1 number, #2 one (1, 21, 101), #3 several (2 to 9, 22), #4 many (0, 10 to 20, 30)
\cs_new:Npn \__lts_forma:nnnn #1#2#3#4
  {
    \bool_lazy_any:nTF
      {
        { \int_compare_p:nNn { \int_mod:nn {#1} { 10 } } = { 0 } }
        {
          \bool_lazy_and_p:nn
            { \int_compare_p:nNn { \int_mod:nn {#1} { 100 } } > { 10 } }
            { \int_compare_p:nNn { \int_mod:nn {#1} { 100 } } < { 20 } }
        }
      }
      {#4}
      { \int_compare:nNnTF { \int_mod:nn {#1} { 10 } } = { 1 } {#2} {#3} }
  }

\cs_new_protected:Npn \__lts_zodziai:n #1
  {
    \seq_clear:N \l__lts_z_seq
    \int_set:Nn \l__lts_x_int {#1}
    \int_compare:nNnTF \l__lts_x_int = \c_zero_int
      { \seq_put_right:Nn \l__lts_z_seq { nulis } }
      {
        \int_set:Nn \l__lts_c_int { \int_div_truncate:nn { \l__lts_x_int } { 1000000 } }
        \int_compare:nNnT \l__lts_c_int > \c_zero_int
          {
            \__lts_triada:n { \l__lts_c_int }
            \seq_put_right:Nx \l__lts_z_seq
              { \__lts_forma:nnnn { \l__lts_c_int } { milijonas } { milijonai } { milijonų } }
          }
        \int_set:Nn \l__lts_c_int
          { \int_div_truncate:nn { \int_mod:nn { \l__lts_x_int } { 1000000 } } { 1000 } }
        \int_compare:nNnT \l__lts_c_int > \c_zero_int
          {
            \__lts_triada:n { \l__lts_c_int }
            \int_set:Nn \l__lts_b_int { \int_mod:nn { \l__lts_c_int } { 100 } }
            \__lts_ideti_forma:Nnnn \l__lts_c_int { tūkstantis } { tūkstančiai } { tūkstančių }
          }
        \int_set:Nn \l__lts_c_int { \int_mod:nn { \l__lts_x_int } { 1000 } }
        \int_compare:nNnT \l__lts_c_int > \c_zero_int
          { \__lts_triada:n { \l__lts_c_int } }
      }
  }
\cs_new_protected:Npn \__lts_ideti_forma:Nnnn #1#2#3#4
  {
    \bool_lazy_any:nTF
      {
        { \int_compare_p:nNn { \int_mod:nn {#1} { 10 } } = { 0 } }
        {
          \bool_lazy_and_p:nn
            { \int_compare_p:nNn { \int_mod:nn {#1} { 100 } } > { 10 } }
            { \int_compare_p:nNn { \int_mod:nn {#1} { 100 } } < { 20 } }
        }
      }
      { \seq_put_right:Nn \l__lts_z_seq {#4} }
      {
        \int_compare:nNnTF { \int_mod:nn {#1} { 10 } } = { 1 }
          { \seq_put_right:Nn \l__lts_z_seq {#2} }
          { \seq_put_right:Nn \l__lts_z_seq {#3} }
      }
  }

% \skaiciuszodziais{1921} prints the number in words.
\NewDocumentCommand \skaiciuszodziais { m }
  {
    \group_begin:
    \__lts_zodziai:n {#1}
    \seq_use:Nn \l__lts_z_seq { ~ }
    \group_end:
  }
% \sumazodziais{192148} prints an amount given in cents.
\NewDocumentCommand \sumazodziais { m }
  {
    \group_begin:
    \int_set:Nn \l__lts_eil_int {#1}
    \int_set:Nn \l__lts_pvm_int { \int_div_truncate:nn { \l__lts_eil_int } { 100 } }
    \__lts_zodziai:n { \l__lts_pvm_int }
    \__lts_ideti_forma:Nnnn \l__lts_pvm_int { euras } { eurai } { eurų }
    \text_titlecase_first:n { \seq_use:Nn \l__lts_z_seq { ~ } } ,~
    \int_set:Nn \l__lts_pvm_int { \int_mod:nn { \l__lts_eil_int } { 100 } }
    \int_use:N \l__lts_pvm_int \c_space_tl
    \int_compare:nNnTF { \int_mod:nn { \l__lts_pvm_int } { 10 } } = { 0 }
      { centų }
      {
        \bool_lazy_and:nnTF
          { \int_compare_p:nNn { \l__lts_pvm_int } > { 10 } }
          { \int_compare_p:nNn { \l__lts_pvm_int } < { 20 } }
          { centų }
          {
            \int_compare:nNnTF { \int_mod:nn { \l__lts_pvm_int } { 10 } } = { 1 }
              { centas } { centai }
          }
      }
    \group_end:
  }

\cs_new_protected:Npn \__lts_lentele:
  {
    \renewcommand{\arraystretch}{1.25}
    \begin{tabularx}{\linewidth}{@{} r >{\raggedright\arraybackslash}X r l r r @{}}
      \toprule
      Nr. & Pavadinimas & Kiekis & Mato~vnt. & Kaina,~EUR & Suma,~EUR \tabularnewline
      \midrule
      \tl_use:N \g__lts_eilutes_tl
      \bottomrule
    \end{tabularx}
  }

\int_new:N \g__lts_pvm_int
\tl_new:N \l__lts_viso_tl
\cs_new_protected:Npn \__lts_skaiciuoti_pvm:
  {
    \if@ltspvm
      \int_gset:Nn \g__lts_pvm_int
        { \fp_to_int:n { round ( \int_use:N \g__lts_suma_int * ( \g__lts_tarifas_tl ) / 100 , 0 ) } }
    \else
      \int_gzero:N \g__lts_pvm_int
    \fi
  }
% The rows are built before the table, because every cell of a table is a group.
\cs_new_protected:Npn \__lts_viso:
  {
    \__lts_skaiciuoti_pvm:
    \tl_clear:N \l__lts_viso_tl
    \if@ltspvm
      \tl_put_right:Nx \l__lts_viso_tl
        {
          \exp_not:n { Suma~be~PVM & }
          \__lts_pinigai:n { \int_use:N \g__lts_suma_int }
          \exp_not:n { \,EUR \tabularnewline PVM~ }
          \g__lts_tarifas_tl
          \exp_not:n { \,\% & }
          \__lts_pinigai:n { \int_use:N \g__lts_pvm_int }
          \exp_not:n { \,EUR \tabularnewline }
        }
    \fi
    \tl_put_right:Nx \l__lts_viso_tl
      {
        \exp_not:n { \textbf{Iš~viso} & \textbf }
        { \__lts_pinigai:n { \int_eval:n { \g__lts_suma_int + \g__lts_pvm_int } } \exp_not:n { \,EUR } }
        \exp_not:n { \tabularnewline }
      }
    \hfill
    \begin{tabular}{@{} l r @{}}
      \tl_use:N \l__lts_viso_tl
    \end{tabular}
    \par
  }

\NewDocumentCommand \saskaita { }
  {
    \begin{center}
      {\Large\bfseries \if@ltspvm PVM~ \fi SĄSKAITA~FAKTŪRA \par}
      \vspace{1mm}
      Serija~\g__lts_serija_tl\c_space_tl Nr.~\g__lts_numeris_tl \par
      \g__lts_data_tl \par
    \end{center}
    \vspace{5mm}
    \begin{minipage}[t]{0.48\linewidth}
      \raggedright \textbf{Pardavėjas} \\ \g__lts_pardavejas_tl
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.48\linewidth}
      \raggedright \textbf{Pirkėjas} \\ \g__lts_pirkejas_tl
    \end{minipage}
    \par \vspace{8mm}
    \__lts_lentele:
    \par \vspace{3mm}
    \__lts_viso:
    \vspace{5mm}
    \int_set:Nn \l__lts_x_int { 0 }
    \textbf{Suma~žodžiais:}~
    \__lts_suma_viso:
    \par
    \tl_if_empty:NF \g__lts_terminas_tl
      { \vspace{2mm} \textbf{Apmokėti~iki:}~\g__lts_terminas_tl \par }
    \tl_if_empty:NF \g__lts_pastaba_tl
      { \vspace{2mm} \g__lts_pastaba_tl \par }
    \vspace{18mm}
    \begin{minipage}[t]{0.46\linewidth}
      \rule{\linewidth}{0.4pt} \\ \small Sąskaitą~išrašė
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.46\linewidth}
      \rule{\linewidth}{0.4pt} \\ \small Sąskaitą~gavo
    \end{minipage}
    \par
  }
\cs_new_protected:Npn \__lts_suma_viso:
  {
    \__lts_skaiciuoti_pvm:
    \exp_args:Nx \sumazodziais { \int_eval:n { \g__lts_suma_int + \g__lts_pvm_int } }
  }
\ExplSyntaxOff
\endinput
