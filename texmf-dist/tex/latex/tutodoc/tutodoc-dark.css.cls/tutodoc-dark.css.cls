% ================= %
% == ADMONITIONS == %
% ================= %

% ------------------------- %
% -- ICONS & ENV. COLORS -- %
% ------------------------- %

\ExplSyntaxOn

%%%
% We use two ''prop'' variables to associate each \env to its icon
% and color.
%%%
\prop_new:N \g__tutodoc_focus_color_prop
\prop_new:N \g__tutodoc_focus_icon_prop

\prop_set_from_keyval:Nn \g__tutodoc_focus_color_prop {
  note = cyan,
  tip  = ForestGreen,
  imp  = orange,
  caut = violet,
  warn = red,
}

\prop_set_from_keyval:Nn \g__tutodoc_focus_icon_prop {
  note = \faInfoCircle,
  tip  = \faLightbulb,
  imp  = \faHighlighter,
  caut = \faBiohazard,
  warn = \faSkullCrossbones,
}

\ExplSyntaxOff


% ------------------ %
% -- EXTRA COLORS -- %
% ------------------ %

\NewExpandableDocumentCommand{\tutodoc@build@title@color}{m}{%
  \tdocdarkcolor[95]{white}%
}

\NewExpandableDocumentCommand{\tutodoc@build@upper@color}{m}{%
  \tdocdarkcolor[95]{white}%
}

\NewExpandableDocumentCommand{\tutodoc@build@lower@color}{m}{%
  \tdocdarkcolor[95]{white}%
}

\NewExpandableDocumentCommand{\tutodoc@build@back@color}{m}{%
  #1!75!black!65%
}

\NewExpandableDocumentCommand{\tutodoc@build@frame@color}{m}{%
  \tdocdarkcolor[65]{#1}%
}

\colorlet{tutodoc@admonition@shadow@color}{black!80}


% ----------------------- %
% -- VERTICAL SPACINGS -- %
% ----------------------- %

\newcommand{\tutodoc@admonition@space@above}{\medskipamount}
\newcommand{\tutodoc@admonition@space@below}{\medskipamount}



% ========================= %
% == LISTINGS - AGNOSTIC == %
% ========================= %

% ----------------- %
% -- INLINE CODE -- %
% ----------------- %

\newcommand{\tutodoc@code@style}{github-dark}

\colorlet{tutodoc@code@back@color}{\tdocdarkcolor[30]{white}}
\colorlet{tutodoc@code@text@color}{\tdocdarkcolor[80]{white}}


% -------------------------------- %
% -- FRAMED LISTING (tcolorbox) -- %
% -------------------------------- %

\colorlet{tutodoc@code@frame@color}{darkgray}

\newcommand{\tutodoc@code@left@len}{3pt}
\newcommand{\tutodoc@code@right@len}{3pt}
\newcommand{\tutodoc@code@top@len}{1.5pt}
\newcommand{\tutodoc@code@bottom@len}{1.5pt}

\newcommand{\tutodoc@code@arc@len}{2pt}

\newcommand{\tutodoc@code@left@rule@len}{1pt}
\newcommand{\tutodoc@code@right@rule@len}{1pt}
\newcommand{\tutodoc@code@top@rule@len}{1pt}
\newcommand{\tutodoc@code@bottom@rule@len}{1pt}

\colorlet{tutodoc@code@shadow@color}{black!80}

\newcommand{\tutodoc@code@shadow@xshift@len}{.75mm}
\newcommand{\tutodoc@code@shadow@yshift@len}{-.75mm}
\newcommand{\tutodoc@code@shadow@offset@len}{0mm}

\colorlet{tutodoc@code@segment@color}{gray}



% ====================== %
% == LISTINGS - LATEX == %
% ====================== %

% ---------------- %
% -- LEXER USED -- %
% ---------------- %

\newcommand{\tutodoc@latex@lexer}{latex}


% ----------------- %
% -- INLINE CODE -- %
% ----------------- %

\newcommand{\tutodoc@latex@style}{github-dark}

\colorlet{tutodoc@latex@back@color}{\tdocdarkcolor[30]{white}}
\colorlet{tutodoc@latex@text@color}{\tdocdarkcolor[80]{white}}


% -------------------------------- %
% -- FRAMED LISTING (tcolorbox) -- %
% -------------------------------- %

\colorlet{tutodoc@latex@frame@color}{darkgray}

\newcommand{\tutodoc@latex@left@len}{3pt}
\newcommand{\tutodoc@latex@right@len}{3pt}
\newcommand{\tutodoc@latex@top@len}{1.5pt}
\newcommand{\tutodoc@latex@bottom@len}{1.5pt}

\newcommand{\tutodoc@latex@arc@len}{2pt}

\newcommand{\tutodoc@latex@left@rule@len}{1pt}
\newcommand{\tutodoc@latex@right@rule@len}{1pt}
\newcommand{\tutodoc@latex@top@rule@len}{1pt}
\newcommand{\tutodoc@latex@bottom@rule@len}{1pt}

\colorlet{tutodoc@latex@shadow@color}{black!80}

\newcommand{\tutodoc@latex@shadow@xshift@len}{.75mm}
\newcommand{\tutodoc@latex@shadow@yshift@len}{-.75mm}
\newcommand{\tutodoc@latex@shadow@offset@len}{0mm}

\colorlet{tutodoc@latex@segment@color}{gray}



% ========================== %
% == TEXT AND PAGE COLORS == %
% ========================== %

\colorlet{tutodoc@page@color}{black}
\colorlet{tutodoc@text@color}{\tdocdarkcolor[80]{white}}


% ================= %
% == LINKS COLOR == %
% ================= %

\definecolor{tutodoc@link@color}{HTML}{9591A6}



% ============== %
% == SHOWCASE == %
% ============== %

\NewExpandableDocumentCommand{\tutodoc@showcase@rule@color}{}{%
  white%
}

\NewExpandableDocumentCommand{\tutodoc@showcase@stripe@color}{}{%
  white%
}

\NewExpandableDocumentCommand{\tutodoc@showcase@text@color}{}{%
  white%
}

\NewExpandableDocumentCommand{\tutodoc@showcase@build@rule@color}{m}{%
  \tdocdarkcolor[80]{#1}%
}

\NewExpandableDocumentCommand{\tutodoc@showcase@build@back@color}{m}{%
  \tdocdarkcolor[30]{#1}%
}



% ======================= %
% == VERSION & CHANGES == %
% ======================= %

% -------------------- %
% -- DATE & VERSION -- %
% -------------------- %

\NewExpandableDocumentCommand{\tutodoc@changes@when@color}{}{%
  \tdoclightcolor[60]{cyan}%
}


% --------------------------- %
% -- ENVS FOR CHANGES MADE -- %
% --------------------------- %

\newcommand{\tutodoc@changes@start@project@icon}{\faAnchor}

\ExplSyntaxOn

\prop_new:N              \g__tutodoc_topic_change_prop
\prop_set_from_keyval:Nn \g__tutodoc_topic_change_prop {
  break  = \faCodeBranch,
  fix    = \faWrench,
  new    = \faGem,
  prob   = \faFire*,
  tech   = \faFlask,
  update = \reflectbox{\faHistory},
  todo   = \faCompass[regular],
}

\ExplSyntaxOff
