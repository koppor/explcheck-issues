%% rbt-mathnotes-formula-sheet.cls
%% Copyright 2021 Rebecca B. Turner.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Rebecca B. Turner.
%
% This work consists of the files:
%     README.md
%     rbt-mathnotes.tex
%     rbt-mathnotes.sty
%     rbt-mathnotes.cls
%     rbt-mathnotes-util.sty
%     rbt-mathnotes-messages.sty
%     rbt-mathnotes-hw.cls
%     rbt-mathnotes-formula-sheet.cls
%     examples/cheat-sheet.tex
%     examples/multivar.tex
%     examples/topology-hw-1.tex
% and the derived files:
%     rbt-mathnotes.pdf
%     examples/cheat-sheet.pdf
%     examples/multivar.pdf
%     examples/topology-hw-1.pdf

\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplClass{rbt-mathnotes-formula-sheet}{2021/11/29}{1.0.2}{Styles
  for mathematical exam formula sheets.}

\LoadClass{article}

\RequirePackage{rbt-mathnotes}

\cs_set:Npn \@maketitle
  {
    \textbf{\@title}~
    (\@author,~\@date)
  }

\cs_set:Npn \mn__tiny_thm:nn #1#2
  {
    \RenewDocumentEnvironment { #1 } { o }
      {
        \textbf
          {
            #2
            \IfValueT { ##1 }
              {
                :~##1
              }
            .
          }
      }
      {
      }
  }

\mn__tiny_thm:nn { thm } { Thm }
\mn__tiny_thm:nn { lem } { Lem }
\mn__tiny_thm:nn { cor } { Cor }
\mn__tiny_thm:nn { prop } { Prop }
\mn__tiny_thm:nn { defn } { Defn }
\mn__tiny_thm:nn { ex } { Ex }
\mn__tiny_thm:nn { note } { Note }
\mn__tiny_thm:nn { remark } { Rmrk }

\prg_new_conditional:Npnn \mn__if_should_use_multicols:
  { T, }
  {
    \int_compare:nNnTF
      { \g__mn_fs_columns_int } = { \c_one_int }
      { \prg_return_false: }
      { \prg_return_true: }
  }

\RequirePackage{multicol}
\AtBeginDocument
  {
    \scriptsize
    \mn__if_should_use_multicols:T
      {
        \begin
          {
            multicols
            \bool_if:NF \g__mn_should_balance_multicols_bool
              { * }
          }
          {
            \int_use:N \g__mn_fs_columns_int
          }
      }
    \skip_set:Nn \abovedisplayskip { 0pt }
    \skip_set:Nn \belowdisplayskip { 0pt }
  }

\AtEndDocument
  {
    \mn__if_should_use_multicols:T
      {
        \end
          {
            multicols
            \bool_if:NF \g__mn_should_balance_multicols_bool
              { * }
          }
      }
  }

\bool_new:N \g__mn_should_balance_multicols_bool

\keys_define:nn { mn__main }
  {
    columns .int_set:N = \g__mn_fs_columns_int ,
    columns .initial:x = 3 ,

    balance~columns .default:n = true ,
    balance~columns .bool_set:N = \g__mn_should_balance_multicols_bool ,

    width .value_required:n = true ,
    width .code:n = \geometry{ paperwidth = #1 } ,

    height .value_required:n = true ,
    height .code:n = \geometry{ paperheight = #1 } ,
  }

\RequirePackage
  [
    letterpaper ,
    margin = 0.1in ,
  ]
  { geometry }

\skip_set:Nn \parskip { 0.25em }

\RequirePackage { enumitem }
\setlist
  {
    nosep
  }

\def\section#1{\hrulefill\\\textbf{#1}\\}
