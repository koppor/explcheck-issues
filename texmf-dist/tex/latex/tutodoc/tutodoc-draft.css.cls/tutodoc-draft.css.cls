% ================= %
% == ADMONITIONS == %
% ================= %

% -------------------------------------- %
% -- ONY CLASSICAL THEOREM-LIKE \ENVS -- %
% -------------------------------------- %

\ExplSyntaxOn

%%%
% Without icons and colors, we just use a ''seq'' variable to give
% all the suffixes for the environments concerned.
%%%
\seq_new:N \g__tutodoc_focus_color_seq

\seq_set_from_clist:Nn \g__tutodoc_focus_color_seq {
  note,
  tip,
  imp,
  caut,
  warn,
}

\ExplSyntaxOff


% ----------------------- %
% -- VERTICAL SPACINGS -- %
% ----------------------- %

\newcommand{\tutodoc@admonition@space@above}{2pt plus 2pt}
\newcommand{\tutodoc@admonition@space@below}{2pt plus 2pt}



% ========================= %
% == LISTINGS - AGNOSTIC == %
% ========================= %

% ----------------- %
% -- INLINE CODE -- %
% ----------------- %

\codenolexertrue
\newcommand{\tutodoc@code@style}{default}

\colorlet{tutodoc@code@back@color}{white}
\colorlet{tutodoc@code@text@color}{black}


% -------------------------------- %
% -- FRAMED LISTING (tcolorbox) -- %
% -------------------------------- %

\colorlet{tutodoc@code@frame@color}{darkgray}

\newcommand{\tutodoc@code@left@len}{2pt}
\newcommand{\tutodoc@code@right@len}{2pt}
\newcommand{\tutodoc@code@top@len}{0pt}
\newcommand{\tutodoc@code@bottom@len}{0pt}

\newcommand{\tutodoc@code@arc@len}{0pt}

\newcommand{\tutodoc@code@left@rule@len}{1pt}
\newcommand{\tutodoc@code@right@rule@len}{0pt}
\newcommand{\tutodoc@code@top@rule@len}{0pt}
\newcommand{\tutodoc@code@bottom@rule@len}{0pt}

\colorlet{tutodoc@code@shadow@color}{black}

\newcommand{\tutodoc@code@shadow@xshift@len}{0mm}
\newcommand{\tutodoc@code@shadow@yshift@len}{0mm}
\newcommand{\tutodoc@code@shadow@offset@len}{0mm}

\colorlet{tutodoc@code@segment@color}{black}



% ====================== %
% == LISTINGS - LATEX == %
% ====================== %

% ---------------- %
% -- LEXER USED -- %
% ---------------- %

\newcommand{\tutodoc@latex@lexer}{text}


% ----------------- %
% -- INLINE CODE -- %
% ----------------- %

\newcommand{\tutodoc@latex@style}{default}

\colorlet{tutodoc@latex@back@color}{white}
\colorlet{tutodoc@latex@text@color}{black}


% -------------------------------- %
% -- FRAMED LISTING (tcolorbox) -- %
% -------------------------------- %

\colorlet{tutodoc@latex@frame@color}{darkgray}

\newcommand{\tutodoc@latex@left@len}{2pt}
\newcommand{\tutodoc@latex@right@len}{2pt}
\newcommand{\tutodoc@latex@top@len}{0pt}
\newcommand{\tutodoc@latex@bottom@len}{0pt}

\newcommand{\tutodoc@latex@arc@len}{0pt}

\newcommand{\tutodoc@latex@left@rule@len}{1pt}
\newcommand{\tutodoc@latex@right@rule@len}{0pt}
\newcommand{\tutodoc@latex@top@rule@len}{0pt}
\newcommand{\tutodoc@latex@bottom@rule@len}{0pt}

\colorlet{tutodoc@latex@shadow@color}{black}

\newcommand{\tutodoc@latex@shadow@xshift@len}{0mm}
\newcommand{\tutodoc@latex@shadow@yshift@len}{0mm}
\newcommand{\tutodoc@latex@shadow@offset@len}{0mm}

\colorlet{tutodoc@latex@segment@color}{black}



% ========================== %
% == TEXT AND PAGE COLORS == %
% ========================== %

\colorlet{tutodoc@page@color}{white}
\colorlet{tutodoc@text@color}{black}


% ================ %
% == LINK COLOR == %
% ================ %

\definecolor{tutodoc@link@color}{named}{black}


% ======================= %
% == VERTICAL SPACINGS == %
% ======================= %

\setlength{\parskip}{0.5pt plus 1pt}

\RedeclareSectionCommands[
  runin       = false,
  afterindent = false,
  beforeskip  = .25\baselineskip,
  afterskip   = 5pt
]{section, subsection, subsubsection}



% ============== %
% == SHOWCASE == %
% ============== %

\NewExpandableDocumentCommand{\tutodoc@showcase@rule@color}{}{%
  black%
}

\NewExpandableDocumentCommand{\tutodoc@showcase@stripe@color}{}{%
  black%
}

\NewExpandableDocumentCommand{\tutodoc@showcase@text@color}{}{%
  black%
}

\NewExpandableDocumentCommand{\tutodoc@showcase@build@rule@color}{m}{%
  black%
}

\NewExpandableDocumentCommand{\tutodoc@showcase@build@back@color}{m}{%
  white%
}



% ======================= %
% == VERSION & CHANGES == %
% ======================= %

% -------------------- %
% -- DATE & VERSION -- %
% -------------------- %

\NewExpandableDocumentCommand{\tutodoc@changes@when@color}{}{%
  black%
}


% --------------------------- %
% -- ENVS FOR CHANGES MADE -- %
% --------------------------- %

%%%
% The draft theme doesn't use any icon.
%%%

% \newcommand{\tutodoc@changes@start@project@icon}{}

\ExplSyntaxOn

\seq_new:N \g__tutodoc_topic_change_seq

\seq_set_from_clist:Nn \g__tutodoc_topic_change_seq {
  break ,
  fix   ,
  new   ,
  prob  ,
  tech  ,
  update,
  todo  ,
}

\ExplSyntaxOff
