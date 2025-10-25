%%
%% This is file `phimisci.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% phimisci.dtx  (with options: `class')
%% -------------------------------------------------------------------------------
%% Template for the journal Philosophy and the Mind Sciences
%% 
%% Copyright (c) 2025 Ruhr-Universität Bochum
%% 
%% This file may be distributed and/or modified under the conditions of the LaTeX
%% Project Public License, either version 1.3c of this license or (at your option)
%% any later version. The latest version of this license is available at:
%% http://www.latex-project.org/lppl.txt
%% -------------------------------------------------------------------------------
\NeedsTeXFormat {LaTeX2e}
\ProvidesExplClass {phimisci} {2025-09-26} {1.0.1}
                   {Philosophy and the Mind Sciences Journal Template}
\msg_new:nnnn { phimisci } { missing-logo-url }
              { I~didn't~find~a~logo~file~to~print~in~the~article's~header. }
              {
                Please~supply~the~file~location~with~the~document~class~
                option~'settings/logo-url~=~path/to/file.pdf'.
              }
\msg_new:nnnn { phimisci } { missing-font }
              { A~font~could~not~be~found. }
              {
                Neither~the~file~"#1"~nor~a~system-installed~font~named~
                "#2"~could~be~found.~Please~install~the~font~(file)~or~
                adjust~your~font~settings.~
                For~now,~I'm~defaulting~to~the~default~sans~font.
              }
\msg_new:nnn {phimisci} { tex-installation-too-old }
             {
               The~phimisci~class~requires~a~TeX~installation~from~2022~or~
               newer.~Please~update~your~TeX~installation.
             }
\msg_new:nnn { phimisci } { wrong-tex-engine }
             {
               You~are~using~the~\str_use:N \c_sys_engine_str~engine,~but~
               your~document~can~only~be~compiled~with~the~#1~engine(s).
             }
\RequirePackage{xparse}
\@ifpackagelater {xparse} {2022/01/01}
  {}
  {
    \msg_fatal:nn { phimisci } { tex-installation-too-old }
  }
\sys_if_engine_xetex:F
  {
    \sys_if_engine_luatex:F
      {
        \msg_fatal:nnn { phimisci } { wrong-tex-engine }
                       { lualatex~or~xelatex }
      }
  }
\LoadClass [fontsize=10.5bp, oneside] {scrartcl}
\RequirePackage[autoenlargeheadfoot=off]{scrlayer-scrpage}
\RequirePackage{scrlayer-notecolumn}
\KOMAoption{onpsinit}{\protect\PhiMiSci@DetectKomaHeader{}}
\RequirePackage{amsmath, amsthm, amssymb, array, booktabs,
                csquotes, enumitem, graphicx, hyphenat}
\RequirePackage[final, hyperfootnotes=false, pdfusetitle=true]{hyperref}
\RequirePackage[table]{xcolor}
\RequirePackage{etoolbox, expl3, l3keys2e, microtype, orcidlink}
\ExplSyntaxOn
\bool_new:N \l__phimisci_output_keywords_bool
\bool_new:N \l__phimisci_output_abstract_bool
\bool_new:N \l__phimisci_output_contact_bool
\bool_new:N \l__phimisci_output_rights_bool
\bool_new:N \l__phimisci_output_doi_bool
\bool_new:N \l__phimisci_output_authors_bool
\bool_new:N \l__phimisci_output_publication_header_footer_bool
\bool_new:N \l__phimisci_output_draft_footer_bool
\bool_new:N \l__phimisci_koma_head_mode_bool
\bool_new:N \l__phimisci_settings_sloppybottom_bool
\bool_new:N \l__phimisci_settings_luawidow_bool
\cs_new:Nn \__phimisci_affiliation_line_separator: { \thickspace }
\cs_new:Nn \__phimisci_affiliation_name_separator: { \thinspace }
\cs_generate_variant:Nn \seq_set_split:Nnn { NVn }
\cs_generate_variant:Nn \seq_set_split:Nnn { NVx }
\cs_generate_variant:Nn \int_set:Nn { Nx }
\cs_generate_variant:Nn \tl_rescan:nn { nx }
\int_new:N \l__phimisci_abstract_length_int
\int_new:N \l__phimisci_output_authors_int
\iow_new:N \l__phimisci_citation_file_stream
\prop_new:N \l__phimisci_authors_to_ids_prop
\prop_new:N \l__phimisci_author_ids_to_affiliations_prop
\prop_new:N \l__phimisci_author_ids_to_orcids_prop
\prop_new:N \l__phimisci_affiliation_id_resolver_prop
\seq_new:N \l__phimisci_keywords_seq
\seq_new:N \l__phimisci_authors_seq
\tl_const:Nn \l__phimisci_parnum_excluded_objects_base_tl
  {
    env/quote, env/quotation, env/itemize, env/enumerate, env/description,
    env/list, env/table, env/figure, env/tabbing, env/lstlisting,
    env/verbatim
  }
\tl_new:N \l_phimisci_header_authors_tl
\tl_new:N \l_phimisci_authors_tl
\tl_new:N \l__phimisci_authors_citation_footer_tl
\tl_new:N \l__phimisci_custom_header_authors_tl
\tl_new:N \l__phimisci_keywords_tl
\tl_new:N \l__phimisci_dedication_tl
\tl_new:N \l__phimisci_copyright_holder_tl
\tl_new:N \l__phimisci_contact_tl
\tl_new:N \l__phimisci_contact_author_tl
\tl_new:N \l__phimisci_tmp_orcid_link_tl
\ExplSyntaxOff

\RequirePackage[semibold]{libertinus}
\RequirePackage[regular, semibold]{noto-sans}
\RequirePackage{fontspec}
\ExplSyntaxOn
\IfFontExistsTF { NotoSansDisplay-Regular.ttf }
  {
    \newfontfamily \PhiMiSciTitleFont
      { NotoSansDisplay-Regular.ttf }
      [ Ligatures = TeX,
        BoldFont = NotoSansDisplay-SemiBold.ttf,
        ItalicFont = NotoSansDisplay-SemiBoldItalic.ttf ]
  }
  {
    \IfFontExistsTF { Noto~Sans~Display }
      {
        \newfontfamily \PhiMiSciTitleFont
          { Noto~Sans~Display }
          [ Ligatures = TeX,
            BoldFont = Noto~Sans~Display~SemiBold,
            ItalicFont = Noto~Sans~Display~SemiBold~Italic ]
      }
      {
        \let\PhiMiSciTitleFont\sffamily
        \msg_warning:nnnn { phimisci } { missing-font }
                          { NotoSansDisplay-SemiBold.ttf }
                          { Noto~Sans~Display~SemiBold }
      }
  }
\ExplSyntaxOff
\newfontfamily \PhiMiSciMediumFont {NotoSans-Medium.ttf}
  [Ligatures = TeX, ItalicFont = NotoSans-MediumItalic.ttf]
\AtBeginDocument{\fontsize{10.5bp}{13.5bp}\selectfont}
\setkomafont{title}
  {%
    \raggedright%
    \PhiMiSciTitleFont%
    \bfseries%
    \color{PhiMiSciHeadingBlue}%
    \fontsize{23bp}{28bp}\selectfont%
  }
\setkomafont{subtitle}
  {%
    \raggedright%
    \PhiMiSciTitleFont%
    \bfseries%
    \color{PhiMiSciHeadingBlue}%
    \fontsize{17.25bp}{22bp}\selectfont%
  }
\setkomafont{subject}
  {%
    \PhiMiSciMediumFont%
    \fontsize{9.8bp}{13.72bp}\selectfont%
    \color{PhiMiSciHeadingBlue}%
  }
\setkomafont{author}
  {%
    \raggedright%
    \PhiMiSciTitleFont%
    \color{PhiMiSciHeadingBlue}%
    \fontsize{12bp}{17bp}\selectfont%
    \bfseries%
  }
\newkomafont{PhiMiSciAffiliationItem}
  {%
    \sffamily\bfseries%
    \fontsize{10bp}{13.5bp}\selectfont%
    \color{PhiMiSciHeadingBlue}%
  }
\newkomafont{PhiMiSciAffiliationLine}
  {%
    \usekomafont{footnote}%
  }
\newkomafont{PhiMiSciDedication}
  {%
    \normalfont\normalsize%
    \fontsize{10bp}{13.72bp}\selectfont%
    \itshape\bfseries%
    \color{PhiMiSciHeadingBlue}%
  }
\newkomafont{PhiMiSciEmail}{\normalfont\slshape}
\newkomafont{PhiMiSciFooter}
  {%
    \raggedright%
    \usekomafont{footnote}%
    \color{PhiMiSciHeadingBlue}%
  }
\newkomafont{PhiMiSciKeywords}
  {%
    \normalfont\fontsize{10bp}{13.5bp}\selectfont%
    \color{PhiMiSciHeadingBlue}%
  }
\newkomafont{PhiMiSciTableBody}
  {%
    \sffamily\fontsize{9bp}{13.5bp}\selectfont%
  }
\newkomafont{PhiMiSciWatermark}
  {%
    \normalfont\normalcolor\color{black!15}%
  }
\addtokomafont{pagefoot}{\normalfont\color{PhiMiSciHeadingBlue}}
\addtokomafont{pagehead}
  {%
    \normalfont%
    \PhiMiSciMediumFont%
    \footnotesize%
    \color{PhiMiSciBlueThree}%
  }
\addtokomafont{headsepline}{\sffamily\bfseries}
\addtokomafont{disposition}{%
    \PhiMiSciTitleFont%
    \bfseries%
    \color{PhiMiSciHeadingBlue}%
  }
\addtokomafont{section}
  {%
    \fontsize{15.25bp}{18.5bp}%
    \selectfont%
  }
\addtokomafont{subsection}
  {%
    \color{PhiMiSciBlueThree}%
    \fontsize{13.25bp}{17bp}%
    \selectfont%
  }
\addtokomafont{subsubsection}
  {%
    \color{PhiMiSciBlueThree}%
    \fontsize{12bp}{17bp}%
    \selectfont%
  }
\addtokomafont{paragraph}
  {%
    \color{PhiMiSciBlueThree}%
    \fontsize{10bp}{13.5bp}%
    \selectfont%
  }
\setkomafont{dictum}{\normalfont\normalsize\itshape}
\setkomafont{dictumauthor}{\normalfont\normalsize}
\setkomafont{descriptionlabel}{\normalfont\bfseries}
\addtokomafont{footnote}{\fontsize{9.25bp}{11.5bp}\selectfont}
\setkomafont{footnotelabel}{\sffamily\bfseries\color{PhiMiSciBlueTwo}}
\addtokomafont{footnotereference}{\sffamily\small\bfseries\color{PhiMiSciBlueTwo}}
\setkomafont{caption}{\usekomafont{footnote}\bfseries}
\setkomafont{captionlabel}
  {%
    \sffamily\bfseries%
    \fontsize{8bp}{10bp}\selectfont%
    \color{PhiMiSciHeadingBlue}%
  }
\setkomafont{notecolumn.marginpar}{\normalfont\color{black!50}}
\newkomafont{PhiMiSciQuote}{\normalfont\fontsize{10bp}{13.5bp}\selectfont}
\RequirePackage[style=apa, natbib=true]{biblatex}
\hypersetup{breaklinks=true,
            colorlinks=true,
            linkcolor=PhiMiSciBlueTwo,
            citecolor=PhiMiSciBlueTwo,
            urlcolor=PhiMiSciBlueTwo}
\ExplSyntaxOn
\AtEndPreamble
  {
    \hypersetup
      {
        pdftitle  = { \tl_use:N \l_phimisci_document_title_tl }
      }
  }
\ExplSyntaxOff
\ExplSyntaxOn
\cs_new:Nn \__phimisci_stage_preparation:
  {
    \KOMAoptions{overfullrule=false}
    \bool_set_true:N \l__phimisci_output_authors_bool
    \bool_set_true:N \l__phimisci_output_contact_bool
    \bool_set_false:N \l__phimisci_output_publication_header_footer_bool
    \bool_set_false:N \l__phimisci_output_draft_footer_bool
    \bool_set_true:N \l__phimisci_output_rights_bool
    \bool_set_false:N \l__phimisci_output_doi_bool
  }
\cs_new:Nn \__phimisci_stage_submission:
  {
    \KOMAoptions{overfullrule=false}
    \bool_set_false:N \l__phimisci_output_authors_bool
    \bool_set_false:N \l__phimisci_output_contact_bool
    \bool_set_false:N \l__phimisci_output_publication_header_footer_bool
    \bool_set_false:N \l__phimisci_output_draft_footer_bool
    \bool_set_false:N \l__phimisci_output_rights_bool
    \bool_set_false:N \l__phimisci_output_doi_bool
  }
\cs_new:Nn \__phimisci_stage_draft:
  {
    \KOMAoptions{overfullrule=true}
    \RequirePackage{scrtime}
    \RequirePackage{tikz}
    \AddToHook{shipout/background}{%
      \put(0pt, 0pt) {%
        \begin{tikzpicture}[remember~picture, overlay]
          \node [rotate=45, scale=5] at (current~page.center)
                {
                  \usekomafont{PhiMiSciWatermark}
                  \tl_use:N \l__phimisci_draft_watermark_tl
                };
        \end{tikzpicture}
      }
    }
    \RequirePackage[pagewise, switch]{lineno}
    \AtBeginDocument{\linenumbers}
    \bool_set_true:N \l__phimisci_output_authors_bool
    \bool_set_true:N \l__phimisci_output_contact_bool
    \bool_set_true:N \l__phimisci_output_publication_header_footer_bool
    \bool_set_true:N \l__phimisci_output_draft_footer_bool
    \bool_set_true:N \l__phimisci_output_rights_bool
    \bool_set_true:N \l__phimisci_output_doi_bool
  }
\cs_new:Nn \__phimisci_stage_final:
  {
    \KOMAoptions{overfullrule=false}
    \bool_set_true:N \l__phimisci_output_authors_bool
    \bool_set_true:N \l__phimisci_output_contact_bool
    \bool_set_true:N \l__phimisci_output_publication_header_footer_bool
    \bool_set_false:N \l__phimisci_output_draft_footer_bool
    \bool_set_true:N \l__phimisci_output_rights_bool
    \bool_set_true:N \l__phimisci_output_doi_bool
  }

\keys_define:nn { phimisci }
  {
    stage .choice:,
    stage / preparation .code:n = { \__phimisci_stage_preparation: },
    stage / submission .code:n = { \__phimisci_stage_submission: },
    stage / draft .code:n = { \__phimisci_stage_draft: },
    stage / final .code:n = { \__phimisci_stage_final: },
    stage .default:n = {preparation},
    volume .tl_set:N = \l_phimisci_volume_tl,
    volume .initial:n = { \int_eval:n { \the\year - 2019 } },
    number .tl_set:N = \l_phimisci_number_tl,
    number .initial:n = {00},
    doi .tl_set:N = \l_phimisci_doi_tl,
    doi .initial:n = {10.33735/phimisci.0000.0000},
    year .int_set:N = \l_phimisci_publication_year_int,
    year .initial:x = {\the\year},
    issue .tl_set:N = \l_phimisci_issue_title_tl,
    issue .initial:n = {},
    editor .code:n =
      { \seq_set_split:Nnn \l_phimisci_issue_editor_seq { ; } { #1 } },
    discussed-book .tl_set:N = \l_phimisci_discussed_book_tl,
    discussed-book .initial:n = {},
    discussed-book-authors .code:n =
      {
        \seq_set_split:Nnn \l_phimisci_discussed_book_authors_seq
                           { ; } { #1 }
      },
    language .clist_set:N = \l__phimisci_languages_clist,
    language .initial:n = {english}
  }
\keys_define:nn { phimisci / settings }
  {
    author-output-separator .tl_set:N = \l__phimisci_authors_osep_tl,
    author-output-separator .initial:n = {,~},
    author-output-final-separator .tl_set:N =
      \l__phimisci_authors_osep_final_tl,
    author-output-final-separator .initial:n = {~\&~},
    affiliations-input-separator .tl_set:N =
      \l__phimisci_affiliations_isep_tl,
    affiliations-input-separator .initial:n = { ; },
    citation-file .tl_set:N = \l__phimisci_citation_file_name_tl,
    citation-file .initial:n = { phimisci-current-article.bib },
    copyright-text .tl_set:N = \l__phimisci_copyright_tl,
    copyright-text .initial:n = { },
    emergency-stretch .dim_set:N = \l__phimisci_settings_emergencystretch_dim,
    emergency-stretch .initial:n = { 2em },
    paragraph-indent .dim_set:N = \parindent,
    paragraph-indent .initial:n = { 6.5mm },
    list-indent .dim_set:N = \leftmargini,
    list-indent .initial:n = { 6.5mm },
    extra-sentence-spacing .bool_set:N =
      \l__phimisci_settings_extra_sentence_spacing_bool,
    extra-sentence-spacing .initial:n = {false},
    dictum-width .code:n = { \renewcommand* { \dictumwidth } { #1 } },
    dictum-width .initial:n = { 0.62\textwidth },
    draft-footer-text .tl_set:N = \l__phimisci_draft_footer_tl,
    draft-footer-text .initial:n =
      {
        \textit{Draft~generated~on~\today{}~at~\thistime{}.}
      },
    draft-watermark .tl_set:N = \l__phimisci_draft_watermark_tl,
    draft-watermark .initial:n = {PhiMiSci~uncorrected~proofs},
    footnote-break-penalty .int_set:N =
      \l__phimisci_settings_footnote_penalty_int,
    footnote-break-penalty .initial:n = { 1000 },
    footnote-distance-from-main .code:n = { \setlength{\skip\footins}{#1} },
    footnote-distance-from-main .initial:n = { 13.5bp plus 4pt minus 2pt },
    head-rule-thickness .dim_set:N = \l__phimisci_head_rule_height_dim,
    head-rule-thickness .initial:n = { 0.25bp },
    logo-url .tl_set:N = \l__phimisci_branding_logo_tl,
    logo-url .initial:n = { },
    logo-width .dim_set:N = \l__phimisci_logo_width_dim,
    logo-width .initial:n = { 20.6mm },
    submission-footer-text .tl_set:N = \l__phimisci_submission_footer_tl,
    submission-footer-text .initial:n =
      {
        Submission~to~\textit{Philosophy~and~the~Mind~Sciences}
      },
    keyword-input-separator .tl_set:N =
      \l__phimisci_keywords_isep_tl,
    keyword-input-separator .initial:n = { ; },
    keyword-output-separator .tl_set:N =
      \l__phimisci_keywords_osep_tl,
    keyword-output-separator .initial:n =
      {
        \nobreak\space
        \textsf{\textbullet}
        \space
      },
    number-authors-header .int_set:N =
      \l__phimisci_max_authors_in_header_int,
    number-authors-header .initial:n = { 2 },
    orcid-color .tl_set:N = \l__phimisci_orcid_color_tl,
    orcid-color .initial:n = { A6CE39 },
    orphan-penalty .int_set:N = \l__phimisci_settings_orphan_penalty_int,
    orphan-penalty .initial:n = { 300 },
    output-orcids .bool_set:N = \l__phimisci_output_orcids_bool,
    output-orcids .initial:n = {true},
    paragraph-numbering-excluded-objects .tl_set:N =
      \l__phimisci_parnum_excluded_objects_tl,
    paragraph-numbering-excluded-objects .initial:n = {},
    widow-control .choice:,
    widow-control / arseneau .code:n =
      { \bool_set_true:N \l__phimisci_settings_sloppybottom_bool },
    widow-control / chernoff .code:n =
      { \bool_set_true:N \l__phimisci_settings_luawidow_bool },
    widow-penalty .int_set:N = \l__phimisci_settings_widow_penalty_int,
    widow-penalty .initial:n = { 500 },
  }
\keys_define:nn { phimisci / locale }
  {
    abstract .tl_set:N = \l__phimisci_locale_abstract_tl,
    abstract .initial:n = {Abstract},
    contact .tl_set:N = \l__phimisci_locale_contact_tl,
    contact .initial:n = {Primary~contact:~},
    et-al .tl_set:N = \l__phimisci_locale_et_al_tl,
    et-al .initial:n = {et~al.},
    edited-by .tl_set:N = \l__phimisci_locale_edited_by_tl,
    edited-by .initial:n = {,~edited~by~},
    authored-by .tl_set:N = \l__phimisci_locale_authored_by_tl,
    authored-by .initial:n = {~by~},
    journal-name .tl_set:N = \l__phimisci_journal_name_tl,
    journal-name .initial:n = {Philosophy~and~the~Mind~Sciences},
    journal-short-name .tl_set:N = \l__phimisci_journal_short_name_tl,
    journal-short-name .initial:n = {PhiMiSci},
    keywords .tl_set:N = \l__phimisci_locale_keywords_tl,
    keywords .initial:n = {Keywords:~},
    volume .tl_set:N = \l__phimisci_locale_volume_tl,
    volume .initial:n = {Vol.},
    number .tl_set:N = \l__phimisci_locale_number_tl,
    number .initial:n = {No.},
    book-symposium .tl_set:N = \l__phimisci_locale_book_symposium_tl,
    book-symposium .initial:n = {Book~symposium~on~},
    special-issue .tl_set:N = \l__phimisci_locale_special_issue_tl,
    special-issue .initial:n = {Special~Issue:~}
  }
\NewDocumentCommand { \PhiMiSciSettings } { m }
  {
    \keys_set:nn { phimisci } { #1 }
  }
\ProcessKeysOptions{phimisci}
\RenewDocumentCommand {\author} { O{} +m }
 {
   \tl_set:Nx \l__phimisci_custom_header_authors_tl { #1 }
   \gdef \@author { #2 }
   \AtEndPreamble { \PhiMiSci@ProcessAuthorData { #2 } }
 }
\NewDocumentCommand { \PhiMiSci@ProcessAuthorData } { +m }
  {%
    \exp_args:No \phimisci_process_author_data:nNNN
                   { #1 }
                   \l__phimisci_authors_to_ids_prop
                   \l__phimisci_author_ids_to_affiliations_prop
                   \l__phimisci_author_ids_to_orcids_prop
    \hypersetup { pdfauthor = { \tl_use:N \l_phimisci_authors_tl } }
  }
\NewDocumentCommand { \PhiMiSci@OutputAuthorData } {}
  {
    \group_begin:
    \parindent 0pt
    \bool_if:NT \l__phimisci_output_authors_bool
      {
        \group_begin:
        \usekomafont{author}
            \phimisci_output_authors:NNN
               \l__phimisci_authors_to_ids_prop
               \l__phimisci_author_ids_to_affiliations_prop
               \l__phimisci_author_ids_to_orcids_prop
        \group_end:
        \tl_if_blank:VTF \l_phimisci_issue_title_tl
          {
            \tl_if_blank:VF \l_phimisci_discussed_book_tl
              {
                \vskip 1em
                \group_begin:
                \usekomafont{subject}
                \tl_use:N \l__phimisci_locale_book_symposium_tl
                \textit{\tl_use:N \l_phimisci_discussed_book_tl}
                \seq_if_empty:NF \l_phimisci_discussed_book_authors_seq
                  {
                    \tl_use:N \l__phimisci_locale_authored_by_tl
                    \seq_use:Nnnn
                      \l_phimisci_discussed_book_authors_seq
                        {~\&~}
                        {,~}
                        {,~\&~}
                  }
                \seq_if_empty:NF \l_phimisci_issue_editor_seq
                  {
                    \tl_use:N \l__phimisci_locale_edited_by_tl
                    \seq_use:Nnnn
                      \l_phimisci_issue_editor_seq
                        {~\&~}
                        {,~}
                        {,~\&~}
                  }
                 \group_end:
                 \par
              }
          }
          {
            \vskip 1em
            \group_begin:
            \usekomafont{subject}
            \tl_use:N \l__phimisci_locale_special_issue_tl
            \textit{\tl_use:N \l_phimisci_issue_title_tl}
            \seq_if_empty:NF \l_phimisci_issue_editor_seq
              {
                \tl_use:N \l__phimisci_locale_edited_by_tl
                \seq_use:Nnnn
                  \l_phimisci_issue_editor_seq
                    {~\&~}
                    {,~}
                    {,~\&~}
              }
             \group_end:
             \par
          }
        \tl_if_blank:VF \l__phimisci_dedication_tl
          {
            \vskip 1em
            \group_begin:
            \usekomafont{PhiMiSciDedication}
            \tl_use:N \l__phimisci_dedication_tl
            \par
            \group_end:
          }
        \vfill
        \group_begin:
        \phimisci_output_affiliations:N
            \l__phimisci_affiliation_id_resolver_prop
        \group_end:
        \par
        \vspace* { 2\baselineskip }
      }
    \group_end:
  }
\cs_new:Npn \phimisci_process_author_data:nNNN #1#2#3#4
  {
    \seq_clear_new:N \l__phimisci_authors_header_tmp_seq
    \seq_set_split:Nnn \l__phimisci_authors_seq
                       { \and~ }
                       { #1 }
    \int_zero_new:N \l__phimisci_current_author_id_int
    \seq_map_inline:Nn \l__phimisci_authors_seq
      {
        \tl_clear_new:N \l__phimisci_author_tmp_tl
        \tl_set:Nn \l__phimisci_author_tmp_tl { ##1 }
      \regex_extract_once:nnN
        {\c{affiliation} \cB. (\c[^BE].*) \cE.}
        { ##1 }
        \l__phimisci_tmp_author_affiliation_seq

      \regex_extract_once:nnN
        {\c{orcid} \cB. (\c[^BE].*) \cE.}
        { ##1 }
        \l__phimisci_tmp_author_orcid_seq
      \regex_replace_all:nnN {\c{orcid} \cB. (\c[^BE].*) \cE.}
                             {}
                             \l__phimisci_author_tmp_tl
      \regex_replace_all:nnN {\c{affiliation} \cB. (\c[^BE].*) \cE.}
                             {}
                             \l__phimisci_author_tmp_tl
      \tl_trim_spaces:N \l__phimisci_author_tmp_tl
      \seq_put_right:NV \l__phimisci_authors_header_tmp_seq
                        \l__phimisci_author_tmp_tl
      \seq_clear_new:N \l__phimisci_author_affiliation_seq
      \seq_clear_new:N \l__phimisci_author_affiliation_ids_seq
      \tl_clear_new:N \l__phimisci_afil_loop_tl
      \seq_set_split:NVx \l__phimisci_author_affiliation_seq
                         \l__phimisci_affiliations_isep_tl
                         {
                           \seq_item:Nn
                             \l__phimisci_tmp_author_affiliation_seq
                             {2}
                         }
      \seq_map_inline:Nn \l__phimisci_author_affiliation_seq
        {
          \tl_if_blank:nF { ####1 }
            {
              \prop_get:NnNTF \l__phimisci_affiliation_id_resolver_prop { ####1 }
                \l__phimisci_afil_loop_tl
                {
                  \seq_put_right:NV
                    \l__phimisci_author_affiliation_ids_seq
                    \l__phimisci_afil_loop_tl
                }
                {
                  \prop_put:Nxx \l__phimisci_affiliation_id_resolver_prop
                    { ####1 }
                    {
                      \int_eval:n
                        {
                          \prop_count:N \l__phimisci_affiliation_id_resolver_prop
                          + 1
                        }
                    }
                  \seq_put_right:Nx \l__phimisci_author_affiliation_ids_seq
                    {
                      \prop_count:N \l__phimisci_affiliation_id_resolver_prop
                    }
                }
            }
        }
      \prop_put:Nxx { #2 }
                    { \int_use:N \l__phimisci_current_author_id_int }
                    { \tl_use:N \l__phimisci_author_tmp_tl }

      \prop_put:Nxx { #3 }
                    { \int_use:N \l__phimisci_current_author_id_int }
                    {
                      \seq_use:Nn
                        \l__phimisci_author_affiliation_ids_seq
                        {,~}
                    }

      \prop_put:Nxx { #4 }
                    { \int_use:N \l__phimisci_current_author_id_int }
                    { \seq_item:Nn \l__phimisci_tmp_author_orcid_seq {2} }
      \int_incr:N \l__phimisci_current_author_id_int
    }
    \bool_if:NTF \l__phimisci_output_authors_bool
      {
        \tl_if_blank:VTF \l__phimisci_custom_header_authors_tl
          {
            \tl_set:Nx \l_phimisci_header_authors_tl
              {
                \int_compare:nNnTF
                  { \seq_count:N \l__phimisci_authors_header_tmp_seq }
                  >
                  { \l__phimisci_max_authors_in_header_int }
                  {
                    \seq_item:Nn \l__phimisci_authors_header_tmp_seq { 1 }
                    \ \tl_use:N \l__phimisci_locale_et_al_tl
                  }
                  {
                    \seq_use:Nnnn \l__phimisci_authors_header_tmp_seq
                                  {~\&~}
                                  {,~}
                                  {,~\&~}
                  }
              }
          }
          {
            \tl_set_eq:NN \l_phimisci_header_authors_tl
                          \l__phimisci_custom_header_authors_tl
          }
        \tl_set:Nx \l_phimisci_authors_tl
          {
            \seq_use:Nnnn \l__phimisci_authors_header_tmp_seq
                          { \l__phimisci_authors_osep_final_tl }
                          { \l__phimisci_authors_osep_tl }
                          { \l__phimisci_authors_osep_final_tl }
          }
        \tl_set:Nx \l__phimisci_authors_citation_footer_tl
          {
            \seq_use:Nn \l__phimisci_authors_header_tmp_seq
                          { ~and~ }
          }
        \int_compare:nNnTF
          { \seq_count:N \l__phimisci_authors_header_tmp_seq } = 1
          {
            \tl_set:Nn \l__phimisci_copyright_holder_tl { The~author }
          }
          {
            \tl_set:Nn \l__phimisci_copyright_holder_tl { The~authors }
          }
      }
      {
        \tl_set:Nn \l_phimisci_header_authors_tl { Anonymized }
      }
  }
\cs_new:Npn \phimisci_output_authors:NNN #1#2#3
  {
    \seq_clear_new:N \l__phimisci_output_authors_loop_seq
    \int_set:Nx \l__phimisci_output_authors_int
      { \prop_count:N \l__phimisci_author_ids_to_affiliations_prop }
    \int_do_until:nNnn { \seq_count:N \l__phimisci_output_authors_loop_seq }
                       =
                       {
                         \l__phimisci_output_authors_int
                       }
                       {
                         \seq_put_right:Nx
                           \l__phimisci_output_authors_loop_seq
                           {
                             \seq_count:N
                               \l__phimisci_output_authors_loop_seq
                           }
                       }
    \seq_map_inline:Nn \l__phimisci_output_authors_loop_seq
      {
        \tl_clear_new:N \l__phimisci_affiliation_ids_of_author_tl
        \tl_clear_new:N \l__phimisci_output_author_temp_tl
        \prop_get:NnN #2 { ##1 } \l__phimisci_affiliation_ids_of_author_tl
        \prop_get:NnN #1 { ##1 } \l__phimisci_output_author_temp_tl
        \tl_rescan:nx {} { \l__phimisci_output_author_temp_tl }
        \tl_if_empty:NF \l__phimisci_affiliation_ids_of_author_tl
          {
            \textsuperscript
              {
                \tl_use:N \l__phimisci_affiliation_ids_of_author_tl
                \str_if_eq:eeT \l__phimisci_output_author_temp_tl
                               \l__phimisci_contact_author_tl
                               { ,\,* }
              }
          }
        \phimisci_print_orcid:n { ##1 }
        \int_compare:nNnT { ##1 } < { \l__phimisci_output_authors_int + 1 }
          {
           \par
          }
      }
  }
\cs_new:Npn \phimisci_output_affiliations:N #1
  {
    \prop_map_inline:Nn #1
      {
        \group_begin:
          \usekomafont { PhiMiSciAffiliationItem }
          \textsuperscript
            {
              \tl_rescan:nn {} { ##2 }
            }
        \group_end:
        \group_begin:
          \__phimisci_affiliation_name_separator:
          \usekomafont { PhiMiSciAffiliationLine }
          \tl_rescan:nn {} { ##1 }
        \group_end:
        \__phimisci_affiliation_line_separator:
      }
    \par
    \tl_if_blank:nF { \l__phimisci_contact_tl }
      {
        \group_begin:
          \usekomafont { PhiMiSciAffiliationItem }
          *
        \group_end:
        \group_begin:
          \__phimisci_affiliation_name_separator:
          \usekomafont { PhiMiSciAffiliationLine }
          \tl_use:N \l__phimisci_locale_contact_tl
          \tl_use:N \l__phimisci_contact_tl
        \group_end:
        \par
      }
  }
\cs_new:Npn \phimisci_print_orcid:n #1
  {
    \prop_get:NnNT
      \l__phimisci_author_ids_to_orcids_prop
      { #1 }
      \l__phimisci_tmp_orcid_link_tl
      {
        \tl_if_empty:NF \l__phimisci_tmp_orcid_link_tl
          {
            \,
            \orcidlink{ \tl_use:N \l__phimisci_tmp_orcid_link_tl }
          }
      }
}
\tl_new:N \l_phimisci_document_title_tl
\tl_new:N \l_phimisci_short_document_title_tl
\RenewDocumentCommand {\title} { O{#2} m }
  {
    \tl_set:Nn \l_phimisci_document_title_tl { #2 }
    \tl_set:Nn \l_phimisci_short_document_title_tl { #1 }
    \RenewDocumentCommand {\@title} {} { #2 }
  }
\DeclareDocumentCommand {\contact} { O{email} m m }
  {%
    \bool_if:NT \l__phimisci_output_contact_bool
      {
        \tl_set:Nn \l__phimisci_contact_author_tl { #2 }
        \str_case:nnF { #1 }
          {
              {email}
              {
                \tl_set:Nn \l__phimisci_contact_tl
                  {
                    \href{mailto:#3}{#3}
                  }
              }
              {website}
              {
                \tl_set:Nn \l__phimisci_contact_tl
                  {
                    \url{#3}
                  }
              }
          }
          {
            \tl_set:Nn \l__phimisci_contact_tl { #3 }
          }
      }
  }
\DeclareDocumentCommand {\abstract} {+m}
  {%
    \tl_if_blank:nTF { #1 }
      {
        \bool_set_false:N \l__phimisci_output_abstract_bool
      }
      {
        \phimisci_check_abstract_length:n { #1 }
        \tl_set:Nn \l__phimisci_abstract_tl { #1 }
        \bool_set_true:N \l__phimisci_output_abstract_bool
      }
  }
\DeclareDocumentCommand {\keywords} {m}
  {%
    \tl_if_blank:nTF { #1 }
      {
        \bool_set_false:N \l__phimisci_output_keywords_bool
      }
      {
        \tl_set:No \l__phimisci_keywords_tl
          {
            \phimisci_process_keywords:n { #1 }
          }
        \bool_set_true:N \l__phimisci_output_keywords_bool
        \hypersetup { pdfkeywords = { #1 } }
      }
  }
\DeclareDocumentCommand {\dedication} { +m }
  {
    \tl_set:Nn \l__phimisci_dedication_tl { #1 }
  }
\cs_new:Npn \phimisci_check_abstract_length:n #1
  {
    \int_set:Nn \l__phimisci_abstract_length_int { \tl_count:o { #1 } }
    \int_compare:nNnT { \l__phimisci_abstract_length_int } < { 100 }
      { \AtEndDocument{ \ClassWarning {phimisci} {Very~short~abstract.} } }
    \int_compare:nNnT { \l__phimisci_abstract_length_int } > { 2000 }
      { \AtEndDocument { \ClassWarning {phimisci} {Very~long~abstract.} } }
  }
\cs_new:Npn \phimisci_process_keywords:n #1
  {
    \seq_set_split:NVn \l__phimisci_keywords_seq
                       \l__phimisci_keywords_isep_tl
                       { #1 }
    \seq_use:Nn \l__phimisci_keywords_seq
                { \l__phimisci_keywords_osep_tl }
  }
\NewDocumentCommand {\PhiMiSci@OutputMetadata} {}
  {
    \bool_if:nT
      {
        \l__phimisci_output_keywords_bool
        || \l__phimisci_output_abstract_bool
      }
      {
        \bool_if:NT \l__phimisci_output_abstract_bool
          {
            \subsubsection*{\tl_use:N \l__phimisci_locale_abstract_tl}
            \group_begin:
              \usekomafont{ PhiMiSciQuote }
              \tl_use:N \l__phimisci_abstract_tl
              \par
            \group_end:
          }
        \bool_if:NT \l__phimisci_output_keywords_bool
          {
            \vskip 1em
            \noindent
            \group_begin:
              \usekomafont{ PhiMiSciKeywords }
              \textbf{\tl_use:N \l__phimisci_locale_keywords_tl}
              \tl_use:N \l__phimisci_keywords_tl
              \par
            \group_end:
          }
        \clearpage
      }
  }
\AtBeginDocument
  {
    \RenewDocumentCommand {\keywords} {m}
      {
        \ClassError {phimisci} {Command~can~only~be~used~in~preamble}
          {
            The command \string\keywords can only be used in the preamble.
            Please move your keywords before \string\begin\string{document\string}.
          }
      }
  }
\AtBeginDocument
  {
    \iow_open:Nn \l__phimisci_citation_file_stream
                 { \l__phimisci_citation_file_name_tl }
    \iow_now:Nx \l__phimisci_citation_file_stream
      {
        @article{phimisci-current-article,\iow_newline:
          author = { \tl_use:N \l__phimisci_authors_citation_footer_tl },
          \iow_newline:
          year   = { \int_use:N \l_phimisci_publication_year_int },
          \iow_newline:
          title  = { {\tl_use:N \l_phimisci_document_title_tl} },
          \iow_newline:
          \tl_if_blank:VF \@subtitle
            {
              subtitle = { {\@subtitle} },
              \iow_newline:
            }
          journal = { \tl_use:N \l__phimisci_journal_name_tl },
          \iow_newline:
          volume = { \tl_use:N \l_phimisci_volume_tl },
          \iow_newline:
          doi = { \tl_use:N \l_phimisci_doi_tl },
          \iow_newline:
          options = { dataonly = true }
        }
      }
    \iow_close:N \l__phimisci_citation_file_stream
  }
\AtEndPreamble
  {
    \addbibresource { \tl_use:N \l__phimisci_citation_file_name_tl }
  }
\RequirePackage [ \clist_use:Nn \l__phimisci_languages_clist {,} ] {babel}
\ExplSyntaxOff
\RequirePackage[a4paper,
                landscape,
                twocolumn,
                hmargin=25mm,
                top=23.625mm,
                bottom=22.7375mm,
                footskip=0pt,
                columnsep=25mm,
                headsep=8.25mm,
                headheight=4.5mm
                ]
                {geometry}
\definecolor{PhiMiSciHeadingBlue}{RGB}{10, 26, 97}
\definecolor{PhiMiSciBlueTwo}{RGB}{19, 47, 178}
\definecolor{PhiMiSciBlueThree}{RGB}{12, 30, 115}
\definecolor{PhiMiSciGrey}{RGB}{157, 164, 196}
\renewcommand*{\sectionformat}
  {%
    \hbox to 12.5mm {\thesection\autodot}%
  }
\renewcommand*{\subsectionformat}
  {%
    \hbox to 12.5mm {\thesubsection\autodot}%
  }
\renewcommand*{\subsubsectionformat}
  {%
    \hbox to 12.5mm {\thesubsubsection\autodot}%
  }
\renewcommand*{\paragraphformat}
  {%
    \hbox to 12.5mm {\theparagraph\autodot}%
  }
\RedeclareSectionCommand[%
    afterindent=false, beforeskip=22bp plus 22bp, afterskip=8.5bp%
    ]{section}
\RedeclareSectionCommand[%
    afterindent=false, beforeskip=13.5bp plus 13.5bp, afterskip=10bp%
    ]{subsection}
\RedeclareSectionCommand[%
    afterindent=false, beforeskip=13.5bp plus 13.5bp, afterskip=10bp%
    ]{subsubsection}
\RedeclareSectionCommand[%
    afterindent=false, afterskip=6.75bp, beforeskip=6.75bp plus 6.75bp,%
    indent=0pt, counterwithin=subsubsection, level=4%
    ]{paragraph}
\setcounter{secnumdepth}{\paragraphnumdepth}
\setcounter{tocdepth}{\paragraphtocdepth}
\setfootnoterule[0pt]{0pt}
\deffootnote{3.125mm}{3.125mm}{%
  \makebox[3.125mm][r]{\textsuperscript{\thefootnotemark\ }}%
  }
\KOMAoption{footnotes}{multiple}
\ExplSyntaxOn
\clubpenalty = \int_use:N \l__phimisci_settings_orphan_penalty_int
\widowpenalty = \int_use:N \l__phimisci_settings_widow_penalty_int
\bool_if:NT \l__phimisci_settings_sloppybottom_bool
  {
    \def\@textbottom{\vskip \z@ \@plus.0001fil \@minus .95\topskip}
    \topskip=1\topskip \@plus 0.625\topskip \@minus .95\topskip
    \def\@texttop{\vskip \z@ \@plus -0.625\topskip \@minus -0.95\topskip}
  }
\bool_if:NT \l__phimisci_settings_luawidow_bool
  {
    \sys_if_engine_luatex:TF
      {
        \RequirePackage{lua-widow-control}
        \lwcsetup
          {
            emergencystretch=\int_use:N
                             \l__phimisci_settings_emergencystretch_dim
          }
      }
      {
        \msg_fatal:nnn { phimisci } { wrong-tex-engine } { lualatex }
      }
  }
\interfootnotelinepenalty=\int_use:N \l__phimisci_settings_footnote_penalty_int
\emergencystretch=\dim_use:N \l__phimisci_settings_emergencystretch_dim
\bool_if:NF \l__phimisci_settings_extra_sentence_spacing_bool
  { \frenchspacing }
\addto\@floatboxreset
  {%
    \centering%
    \usekomafont{PhiMiSciTableBody}%
  }
\setcapwidth{111mm}
\setcapindent{0pt}
\dim_set:Nn \heavyrulewidth { 0.25bp }
\dim_set:Nn \lightrulewidth { 0.15625bp }
\ExplSyntaxOff
\arrayrulecolor{PhiMiSciHeadingBlue}
 \renewcommand{\topfraction}{.9}
 \renewcommand{\dbltopfraction}{.8}
 \renewcommand{\bottomfraction}{.8}
 \renewcommand{\textfraction}{.1}
 \renewcommand{\floatpagefraction}{.75}
 \renewcommand{\dblfloatpagefraction}{.75}
 \setcounter{topnumber}{9}
 \setcounter{bottomnumber}{9}
 \setcounter{totalnumber}{20}
 \setcounter{dbltopnumber}{9}
\AfterEndEnvironment{quote}{\par\@afterindentfalse\@afterheading}
\AfterEndEnvironment{quotation}{\par\@afterindentfalse\@afterheading}
\AfterEndEnvironment{verse}{\par\@afterindentfalse\@afterheading}
\AfterEndEnvironment{itemize}{\par\@afterindentfalse\@afterheading}
\AfterEndEnvironment{enumerate}{\par\@afterindentfalse\@afterheading}
\AfterEndEnvironment{description}{\par\@afterindentfalse\@afterheading}
\defbibheading { bibliography } [ \refname ]
  {
    \addsec{ #1 }
    \clubpenalty=10000
    \@clubpenalty\clubpenalty
    \widowpenalty=10000
    \emergencystretch=3em
  }
\AtBeginBibliography{\usekomafont{footnote}}
\bibhang=6.25mm
\RenewDocumentCommand {\ppspace} {} {\addnbthinspace}
\ExplSyntaxOn
\RenewDocumentCommand {\maketitle} {}
  {%
    {
      \thispagestyle{plain.scrheadings}
     \bool_if:NT \l__phimisci_output_publication_header_footer_bool
       {
         \vspace*{-16.5mm}
         \raggedright
         \parbox[c]
           {
             \dim_eval:n
               {
                 \columnwidth - 1cm - \l__phimisci_logo_width_dim
               }
           }
           {
             \vskip\baselineskip
             \raggedright
             \addfontfeature{LetterSpace=2.0}
             \normalfont\normalsize
             \color{PhiMiSciHeadingBlue}
               {
                 \bfseries\fontsize{20bp}{24bp}\selectfont
                 \tl_use:N \l__phimisci_journal_short_name_tl \par
               }
               {
                 \fontsize{11.2bp}{16.8bp}\selectfont
                 \tl_use:N \l__phimisci_journal_name_tl
                 \space |\space
                 \tl_use:N \l__phimisci_locale_volume_tl
                 \space
                 \tl_use:N \l_phimisci_volume_tl
                 \space |\space
                 \int_use:N \l_phimisci_publication_year_int\par
               }
            }
           \hskip 1cm
           \parbox[c]{\dim_use:N \l__phimisci_logo_width_dim}
             {
               \tl_if_blank:VTF \l__phimisci_branding_logo_tl
                 {
                   \msg_warning:nn { phimisci } { missing-logo-url }
                 }
                 {
                   \includegraphics
                     [ width=\dim_use:N \l__phimisci_logo_width_dim ]
                     { \tl_use:N \l__phimisci_branding_logo_tl }
                 }
            }
        }
    }
    \let\and\relax
    \vskip 2.66\baselineskip
    {
      \usekomafont{title}
      {
        \@title
        \par\vskip.5\baselineskip
      }
    }
    {
      \ifx\@subtitle\@empty
      \else
      \usekomafont{subtitle}\@subtitle\par\vskip.5\baselineskip
      \fi
    }
    \vskip .5em
    \PhiMiSci@OutputAuthorData{}
    \enlargethispage{-2.5\baselineskip}
    \newpage
    \vspace*{3.25\baselineskip}
    \enlargethispage{-4\baselineskip}
    \PhiMiSci@OutputMetadata{}
    \@afterindentfalse\@afterheading
  }
\RenewDocumentCommand { \dictumrule } {} { \smallskip }
\AddToHook { env/quote/begin } { \usekomafont{PhiMiSciQuote} }
\AddToHook { env/quotation/begin } { \usekomafont{PhiMiSciQuote} }
\setlist[enumerate, itemize]
  {
    labelindent=\parindent,
    leftmargin=*
  }
\KOMAoptions
  {
    headsepline = true
  }
\AddToLayerPageStyleOptions{plain.scrheadings}
  {
    onselect =
      {
        \setlength { \footheight } { 3.25\baselineskip }
      }
  }
\NewDocumentCommand{\PhiMiSci@OneColumnLine} {}
  {
    \vrule \@width \dimexpr \columnwidth \relax
           \@height .5 \dimexpr \l__phimisci_head_rule_height_dim \relax
           \@depth  .5 \dimexpr \l__phimisci_head_rule_height_dim \relax
  }
\NewDocumentCommand{\PhiMiSci@HeaderSepLine} {}
  {
    \group_begin:
      \usekomafont{headsepline}
        {
          \vbox spread \z@
            {
              \PhiMiSci@OneColumnLine{}
              \hfill
                \lower .58ex \hbox{\thepage}
              \hfill
              \PhiMiSci@OneColumnLine{}
              \par
            }
        }
    \group_end:
  }
\DeclareLayer[
  background,
  hoffset=\sls@leftmargin{head},
  voffset=\sls@topmargin
          + \headheight
          - \ht\strutbox
          + \dimexpr \l__phimisci_head_rule_height_dim
          \relax,
  width=\sls@headwidth,
  height=0pt,
  align=tl,
  contents={{
    \normalfont
    \usekomafont{pageheadfoot}
      {
        \usekomafont{pagehead}
        {
          \PhiMiSci@HeaderSepLine{}
        }
      }
    }}
  ]{scrheadings.head.below.line}
\cfoot[\PhiMiSci@Footer*{}]{\PhiMiSci@Footer{}}
\chead[]{\PhiMiSci@Header{}}
\NewDocumentCommand {\PhiMiSci@Footer} { s }
  {%
    \IfBooleanTF {#1}
      {
        \bool_if:NTF \l__phimisci_output_publication_header_footer_bool
          {
            \begin{minipage} [b] {\columnwidth}
                \usekomafont{PhiMiSciFooter}
                \fullcite{phimisci-current-article}
            \end{minipage}\hfill
            \begin{minipage} [b] {\columnwidth}
                \usekomafont{PhiMiSciFooter}
                \bool_if:NT \l__phimisci_output_rights_bool
                  {
                    \copyright{}~\tl_use:N \l__phimisci_copyright_holder_tl.~
                    \tl_use:N \l__phimisci_copyright_tl
                  }
            \end{minipage}
          }
          {
            \tl_use:N \l__phimisci_submission_footer_tl
          }
      }
      {
        \bool_if:NT \l__phimisci_output_draft_footer_bool
          {
            \vskip 1cm
            \tl_use:N \l__phimisci_draft_footer_tl
          }
      }
  }
\NewDocumentCommand {\PhiMiSci@Header} { }
  {%
    \bool_if:NTF \l__phimisci_output_publication_header_footer_bool
      {
        \tl_use:N \l__phimisci_journal_short_name_tl
        \c_space_token | \c_space_token
        \tl_use:N \l__phimisci_locale_volume_tl
        \c_space_token
        \tl_use:N \l_phimisci_volume_tl
      }
      {
        \tl_use:N \l__phimisci_submission_footer_tl
      }
    \hfill
    \Ifthispageodd
      {
        \tl_use:N \l_phimisci_short_document_title_tl
      }
      {
        \tl_use:N \l_phimisci_header_authors_tl
      }
  }
\definecolor{orcidlogocol}{HTML}{\tl_use:N \l__phimisci_orcid_color_tl}
\renewcommand{\@OrigHeightRecip}{0.006}
\NewDocumentCommand{\PhiMiSciParagraphNumber}{m}
  {
    \makenote{ #1 }
  }
\newcounter{ PhiMiSci@Paragraph } [ section ]
\NewDocumentCommand {\PhiMiSci@PrintParNum} {}
  {
    \makebox[0pt][r]{
                      \color{gray}
                      \oldstylenums{\thePhiMiSci@Paragraph\hspace*{1.5em}}
                    }
  }
\NewDocumentCommand {\PhiMiSci@AddParNum} {}
  {
    \AddToHook {para/begin} [PhiMiSciParNumber]
     {
       \bool_if:NF \l__phimisci_koma_head_mode_bool
         {
           \refstepcounter{PhiMiSci@Paragraph}
           \PhiMiSci@PrintParNum{}
         }
     }
  }

\NewDocumentCommand {\PhiMiSci@RemoveParNum} {}
  {
    \RemoveFromHook {para/begin} [PhiMiSciParNumber]
  }
\NewDocumentCommand {\PhiMiSci@ParNumSwitch} {m}
  {
    \AddToHook { #1/before } [PhiMiSciParNumber] { \PhiMiSci@RemoveParNum{} }
    \AddToHook { #1/after } [PhiMiSciParNumber] { \PhiMiSci@AddParNum{} }
  }
\NewDocumentCommand {\PhiMiSci@ParNumSwitchDisable} {m}
  {
      \RemoveFromHook { #1/before } [PhiMiSciParNumber]
      \RemoveFromHook { #1/after } [PhiMiSciParNumber]
  }
\NewDocumentCommand {\PhiMiSci@ParNumSwitchKOMA} {m}
  {
    \AddtoDoHook { heading/begingroup/#1 } { \PhiMiSci@RemoveParNum{} }
    \AddtoDoHook { heading/endgroup/#1 } { \PhiMiSci@AddParNum{} }
  }
\NewDocumentCommand{\PhiMiSci@DetectKomaHeader} {}
  {
    \bool_set_true:N \l__phimisci_koma_head_mode_bool
  }
\NewDocumentEnvironment { PhiMiSciNumberedParagraphs } {}
  {%
    \tl_concat:NNN \l__phimisci_parnum_excluded_objects_combined_tl
                   \l__phimisci_parnum_excluded_objects_base_tl
                   \l__phimisci_parnum_excluded_objects_tl
    \parindent=0pt
    \parskip=.5\baselineskip
    \PhiMiSci@AddParNum{}
    \PhiMiSci@ParNumSwitch{env/quote}
    \PhiMiSci@ParNumSwitch{env/quotation}
    \PhiMiSci@ParNumSwitch{env/table}
    \PhiMiSci@ParNumSwitch{env/figure}
    \PhiMiSci@ParNumSwitch{env/list}
    \PhiMiSci@ParNumSwitch{env/enumerate}
    \PhiMiSci@ParNumSwitch{env/itemize}
    \PhiMiSci@ParNumSwitch{env/description}
    \PhiMiSci@ParNumSwitch{env/lstlisting}
    \PhiMiSci@ParNumSwitch{env/verbatim}
    \PhiMiSci@ParNumSwitch{env/tabbing}
    \PhiMiSci@ParNumSwitchKOMA{section}
    \PhiMiSci@ParNumSwitchKOMA{subsection}
    \PhiMiSci@ParNumSwitchKOMA{subsubsection}
  }
  {%
    \PhiMiSci@RemoveParNum{}
    \PhiMiSci@ParNumSwitchDisable{env/quote}
    \PhiMiSci@ParNumSwitchDisable{env/quotation}
    \PhiMiSci@ParNumSwitchDisable{env/table}
    \PhiMiSci@ParNumSwitchDisable{env/figure}
    \PhiMiSci@ParNumSwitchDisable{env/list}
    \PhiMiSci@ParNumSwitchDisable{env/enumerate}
    \PhiMiSci@ParNumSwitchDisable{env/itemize}
    \PhiMiSci@ParNumSwitchDisable{env/description}
    \PhiMiSci@ParNumSwitchDisable{env/lstlisting}
    \PhiMiSci@ParNumSwitchDisable{env/verbatim}
    \PhiMiSci@ParNumSwitchDisable{env/tabbing}
  }
\ExplSyntaxOff
\endinput
%%
%% End of file `phimisci.cls'.
