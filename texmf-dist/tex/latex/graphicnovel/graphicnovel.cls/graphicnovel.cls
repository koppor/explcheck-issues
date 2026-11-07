% Copyright (c) 2026 Tom Bronte.
% Distribution and modification are governed by the
% LaTeX Project Public License, version 1.3c or later.
% LPPL maintenance status: maintained.
% Current maintainer: Tom Bronte
% Contact: craftsyntax@craftsyntax.uk
% The licensed work is listed in README.md.

%% graphicnovel.cls -- semantic graphic-novel script class
%% Version 0.5 -- September 2026
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{graphicnovel}[2026/09/22 v0.5 Semantic graphic-novel script class with strict reference bible]

\newif\ifgn@compact
\DeclareOption{compact}{\gn@compacttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

\RequirePackage[a4paper,margin=25mm]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{xparse}
\RequirePackage{expl3}
\RequirePackage{enumitem}
\RequirePackage{parskip}
\RequirePackage{fancyhdr}
\RequirePackage{longtable}
\RequirePackage{array}

\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt}
\setlist{nosep}

\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
}

\newcounter{comicpage}
\newcounter{panel}

\ExplSyntaxOn

% --------------------------------------------------------------------------
% State
% --------------------------------------------------------------------------
\tl_new:N   \g_gn_novel_title_tl
\tl_new:N   \g_gn_story_tl
\tl_new:N   \g_gn_era_tl
\tl_new:N   \g_gn_last_location_tl
\tl_new:N   \g_gn_current_location_tl
\tl_new:N   \g_gn_layout_tl
\tl_new:N   \g_gn_custom_layout_tl
\tl_new:N   \g_gn_page_label_tl
\int_new:N  \g_gn_expected_panels_int
\int_new:N  \g_gn_expected_turn_int
\bool_new:N \g_gn_story_open_bool
\bool_new:N \g_gn_page_open_bool
\bool_new:N \g_gn_panel_open_bool
\bool_new:N \g_gn_layout_given_bool
\bool_new:N \g_gn_location_given_bool
\bool_new:N \g_gn_shot_given_bool
\bool_new:N \g_gn_action_given_bool
\bool_new:N \g_gn_spread_open_bool
\bool_new:N \g_gn_no_dialogue_bool
\bool_new:N \g_gn_no_captions_bool
\bool_new:N \g_gn_dialogue_used_bool
\bool_new:N \g_gn_caption_used_bool

\prop_new:N \g_gn_eras_prop
\seq_new:N  \g_gn_era_order_seq
\prop_new:N \g_gn_characters_prop
\prop_new:N \g_gn_locations_prop
\prop_new:N \g_gn_props_prop
\prop_new:N \g_gn_continuity_prop
\prop_new:N \g_gn_expressions_prop
\prop_new:N \g_gn_tells_prop
\prop_new:N \g_gn_character_appearance_prop
\prop_new:N \g_gn_location_appearance_prop
\prop_new:N \g_gn_prop_appearance_prop

\seq_new:N  \g_gn_character_order_seq
\seq_new:N  \g_gn_location_order_seq
\seq_new:N  \g_gn_prop_order_seq
\seq_new:N  \g_gn_continuity_order_seq
\prop_new:N \g_gn_character_entry_prop
\prop_new:N \g_gn_location_entry_prop
\prop_new:N \g_gn_prop_entry_prop
\prop_new:N \g_gn_continuity_entry_prop

\bool_new:N \g_gn_in_character_bible_bool
\bool_new:N \g_gn_in_location_bible_bool
\bool_new:N \g_gn_in_prop_bible_bool
\bool_new:N \g_gn_in_continuity_bible_bool
\tl_new:N   \g_gn_current_bible_key_tl
\tl_new:N   \g_gn_current_bible_name_tl
\tl_new:N   \g_gn_current_bible_body_tl
\int_new:N  \g_gn_current_appearance_count_int

% --------------------------------------------------------------------------
% Helpers
% --------------------------------------------------------------------------
\cs_new:Npn \gn_normalize:n #1
  { \str_lowercase:f { \tl_trim_spaces:n {#1} } }

\cs_new:Npn \gn_state_key:nn #1#2
  { \gn_normalize:n {#1} || \gn_normalize:n {#2} }

\cs_new:Npn \gn_context_page:
  {
    \tl_if_blank:VTF \g_gn_story_tl
      { Page~\tl_use:N \g_gn_page_label_tl }
      { \tl_use:N \g_gn_story_tl\space---\space Page~\tl_use:N \g_gn_page_label_tl }
  }

\cs_new:Npn \gn_context_panel:
  { \gn_context_page:\space---\space Panel~\arabic{panel} }

\cs_new_protected:Npn \gn_warning:n #1
  { \ClassWarningNoLine{graphicnovel}{#1} }

\cs_new_protected:Npn \gn_error:nn #1#2
  { \ClassError{graphicnovel}{#1}{#2} }

\prg_new_conditional:Npnn \gn_nonblank:n #1 { TF }
  {
    \tl_if_blank:nTF {#1}
      { \prg_return_false: }
      { \prg_return_true: }
  }

\cs_new_protected:Npn \gn_require_panel:
  {
    \bool_if:NF \g_gn_panel_open_bool
      { \gn_error:nn {Panel~directive~outside~a~panel} {Start~a~panel~with~\string\newPanel~first.} }
  }

\cs_new_protected:Npn \gn_check_era:n #1
  {
    \exp_args:NNe \prop_if_in:NnF \g_gn_eras_prop { \gn_normalize:n {#1} }
      { \gn_error:nn {Unknown~era~'#1'} {Declare~it~with~\string\DeclareEra\{#1\}~in~the~reference~bible.} }
  }

\cs_new_protected:Npn \gn_require_current_era:
  {
    \tl_if_blank:VTF \g_gn_era_tl
      { \gn_error:nn {No~current~era} {Set~the~story~era~with~\string\era\{...\}~before~referencing~era-sensitive~bible~entities.} }
      { \exp_args:NV \gn_check_era:n \g_gn_era_tl }
  }

\cs_new_protected:Npn \gn_register_entity:NnN #1#2#3
  {
    \gn_nonblank:nTF {#2}
      {
        \tl_set:Nx \l_tmpa_tl { \gn_normalize:n {#2} }
        \prop_if_in:NVF #1 \l_tmpa_tl { \seq_gput_right:NV #3 \l_tmpa_tl }
        \prop_gput:NVn #1 \l_tmpa_tl {#2}
      }
      { \gn_error:nn {Missing~entity~name} {Supply~a~non-empty~name.} }
  }

\cs_new_protected:Npn \gn_register_character:n #1
  { \gn_register_entity:NnN \g_gn_characters_prop {#1} \g_gn_character_order_seq }
\cs_new_protected:Npn \gn_register_location:n #1
  { \gn_register_entity:NnN \g_gn_locations_prop {#1} \g_gn_location_order_seq }
\cs_new_protected:Npn \gn_register_prop:n #1
  { \gn_register_entity:NnN \g_gn_props_prop {#1} \g_gn_prop_order_seq }
\cs_new_protected:Npn \gn_register_continuity:n #1
  { \gn_register_entity:NnN \g_gn_continuity_prop {#1} \g_gn_continuity_order_seq }

\cs_new_protected:Npn \gn_check_named_entity:Nnn #1#2#3
  {
    \exp_args:NNe \prop_if_in:NnF #1 { \gn_normalize:n {#2} }
      { \gn_error:nn {Unknown~#3~'#2'} {Define~'#2'~in~the~reference~bible~before~using~it~in~the~script.} }
  }

\cs_new_protected:Npn \gn_check_character:n #1
  { \gn_check_named_entity:Nnn \g_gn_characters_prop {#1} {character} }
\cs_new_protected:Npn \gn_check_location:n #1
  { \gn_check_named_entity:Nnn \g_gn_locations_prop {#1} {location} }
\cs_new_protected:Npn \gn_check_prop:n #1
  { \gn_check_named_entity:Nnn \g_gn_props_prop {#1} {prop} }

\cs_new_protected:Npn \gn_check_appearance:NNn #1#2#3
  {
    \gn_require_current_era:
    \tl_if_blank:VF \g_gn_era_tl
      {
        \tl_set:Nx \l_tmpa_tl { \gn_state_key:nn {#3} {\tl_use:N \g_gn_era_tl} }
        \exp_args:NNV \prop_if_in:NnF #1 \l_tmpa_tl
          {
            \tl_set:Nx \l_tmpc_tl { \gn_normalize:n {#3} }
            \exp_args:NNV \prop_get:NnNTF #2 \l_tmpc_tl \l_tmpb_tl
              {
                \gn_error:nn
                  {No~\tl_use:N\g_gn_era_tl~appearance~for~'\tl_use:N\l_tmpb_tl'}
                  {Add~\string\appearance\{\tl_use:N\g_gn_era_tl\}\{...\}~to~that~bible~entry.}
              }
              { }
          }
      }
  }

\cs_new_protected:Npn \gn_check_character_appearance:n #1
  { \gn_check_appearance:NNn \g_gn_character_appearance_prop \g_gn_characters_prop {#1} }
\cs_new_protected:Npn \gn_check_location_appearance:n #1
  { \gn_check_appearance:NNn \g_gn_location_appearance_prop \g_gn_locations_prop {#1} }
\cs_new_protected:Npn \gn_check_prop_appearance:n #1
  { \gn_check_appearance:NNn \g_gn_prop_appearance_prop \g_gn_props_prop {#1} }

\cs_new_protected:Npn \gn_check_expression:nn #1#2
  {
    \gn_check_character:n {#1}
    \gn_check_character_appearance:n {#1}
    \tl_set:Nx \l_tmpa_tl { \gn_state_key:nn {#1} {#2} }
    \exp_args:NNV \prop_if_in:NnF \g_gn_expressions_prop \l_tmpa_tl
      { \gn_error:nn {Unknown~expression~'#2'~for~'#1'} {Define~it~inside~the~character~entry~with~\string\expression\{#2\}\{...\}.} }
  }

\cs_new_protected:Npn \gn_check_tell:nn #1#2
  {
    \gn_check_character:n {#1}
    \gn_check_character_appearance:n {#1}
    \tl_set:Nx \l_tmpa_tl { \gn_state_key:nn {#1} {#2} }
    \exp_args:NNV \prop_if_in:NnF \g_gn_tells_prop \l_tmpa_tl
      { \gn_error:nn {Unknown~tell~'#2'~for~'#1'} {Define~it~inside~the~character~entry~with~\string\tell\{#2\}\{...\}.} }
  }

% --------------------------------------------------------------------------
% Bible storage and rendering
% --------------------------------------------------------------------------
\cs_new_protected:Npn \gn_bible_row:nn #1#2
  { \textbf{#1} & #2 \\[2pt] }

\cs_new_protected:Npn \gn_bible_state_row:nn #1#2
  { #1 & #2 \\[2pt] }

\cs_new_protected:Npn \gn_start_bible_entry:nn #1#2
  {
    \tl_if_blank:VTF \g_gn_current_bible_name_tl
      {
        #1{#2}
        \tl_gset:Nx \g_gn_current_bible_key_tl { \gn_normalize:n {#2} }
        \tl_gset:Nn \g_gn_current_bible_name_tl {#2}
        \tl_gclear:N \g_gn_current_bible_body_tl
        \int_gzero:N \g_gn_current_appearance_count_int
      }
      { \gn_error:nn {Nested~reference~bible~entries~are~not~allowed} {Close~the~current~entry~before~starting~another.} }
  }

\cs_new_protected:Npn \gn_store_bible_entry:N #1
  {
    \tl_if_blank:VF \g_gn_current_bible_name_tl
      {
        \prop_gput:NVV #1 \g_gn_current_bible_key_tl \g_gn_current_bible_body_tl
        \tl_gclear:N \g_gn_current_bible_key_tl
        \tl_gclear:N \g_gn_current_bible_name_tl
        \tl_gclear:N \g_gn_current_bible_body_tl
      }
  }

\cs_new_protected:Npn \gn_append_bible_field:nn #1#2
  {
    \gn_nonblank:nTF {#1}
      {
        \gn_nonblank:nTF {#2}
          { \tl_gput_right:Nn \g_gn_current_bible_body_tl { \gn_bible_row:nn {#1} {#2} } }
          { \gn_error:nn {Missing~reference~field~body} {Supply~a~non-empty~description.} }
      }
      { \gn_error:nn {Missing~reference~field~label} {Supply~a~non-empty~label.} }
  }

\cs_new_protected:Npn \gn_append_bible_state:nn #1#2
  {
    \gn_nonblank:nTF {#1}
      {
        \gn_nonblank:nTF {#2}
          { \tl_gput_right:Nn \g_gn_current_bible_body_tl { \gn_bible_state_row:nn {#1} {#2} } }
          { \gn_error:nn {Missing~state~description} {Supply~a~non-empty~description.} }
      }
      { \gn_error:nn {Missing~state~name} {Supply~a~non-empty~state~name.} }
  }

\cs_new_protected:Npn \gn_require_character_bible:
  { \bool_if:NF \g_gn_in_character_bible_bool { \gn_error:nn {Character-bible~directive~outside~character~entry} {Use~it~inside~the~character~environment.} } }
\cs_new_protected:Npn \gn_require_location_bible:
  { \bool_if:NF \g_gn_in_location_bible_bool { \gn_error:nn {Location-bible~directive~outside~locationentry} {Use~it~inside~the~locationentry~environment.} } }
\cs_new_protected:Npn \gn_require_prop_bible:
  { \bool_if:NF \g_gn_in_prop_bible_bool { \gn_error:nn {Prop-bible~directive~outside~propentry} {Use~it~inside~the~propentry~environment.} } }
\cs_new_protected:Npn \gn_require_continuity_bible:
  { \bool_if:NF \g_gn_in_continuity_bible_bool { \gn_error:nn {Continuity~directive~outside~continuityitem} {Use~it~inside~the~continuityitem~environment.} } }

\cs_new_protected:Npn \gn_print_one_entry:NNn #1#2#3
  {
    \prop_get:NnN #1 {#3} \l_tmpa_tl
    \prop_get:NnNTF #2 {#3} \l_tmpb_tl { } { \tl_clear:N \l_tmpb_tl }
    \begin{longtable}{@{}>{\raggedright\arraybackslash}p{0.24\linewidth}>{\raggedright\arraybackslash}p{0.71\linewidth}@{}}
    \hline
    \multicolumn{2}{@{}l@{}}{\large\bfseries \tl_use:N \l_tmpa_tl} \\[3pt]
    \hline
    \tl_use:N \l_tmpb_tl
    \hline
    \end{longtable}
  }

\cs_new_protected:Npn \gn_print_character_entries:
  {
    \seq_if_empty:NF \g_gn_character_order_seq
      {
        \section*{Characters}
        \seq_map_inline:Nn \g_gn_character_order_seq
          { \gn_print_one_entry:NNn \g_gn_characters_prop \g_gn_character_entry_prop {##1} }
      }
  }

\cs_new_protected:Npn \gn_print_location_entries:
  {
    \seq_if_empty:NF \g_gn_location_order_seq
      {
        \section*{Places}
        \seq_map_inline:Nn \g_gn_location_order_seq
          { \gn_print_one_entry:NNn \g_gn_locations_prop \g_gn_location_entry_prop {##1} }
      }
  }

\cs_new_protected:Npn \gn_print_prop_entries:
  {
    \seq_if_empty:NF \g_gn_prop_order_seq
      {
        \section*{Objects}
        \seq_map_inline:Nn \g_gn_prop_order_seq
          { \gn_print_one_entry:NNn \g_gn_props_prop \g_gn_prop_entry_prop {##1} }
      }
  }

\cs_new_protected:Npn \gn_print_continuity_entries:
  {
    \seq_if_empty:NF \g_gn_continuity_order_seq
      {
        \section*{Continuity}
        \seq_map_inline:Nn \g_gn_continuity_order_seq
          { \gn_print_one_entry:NNn \g_gn_continuity_prop \g_gn_continuity_entry_prop {##1} }
      }
  }

% --------------------------------------------------------------------------
% Bible declarations
% --------------------------------------------------------------------------
\NewDocumentCommand{\DeclareEra}{m}
  {
    \gn_nonblank:nTF {#1}
      {
        \tl_set:Nx \l_tmpa_tl { \gn_normalize:n {#1} }
        \prop_if_in:NVF \g_gn_eras_prop \l_tmpa_tl { \seq_gput_right:NV \g_gn_era_order_seq \l_tmpa_tl }
        \prop_gput:NVn \g_gn_eras_prop \l_tmpa_tl {#1}
      }
      { \gn_error:nn {Missing~era~name} {Supply~a~non-empty~era.} }
  }
\NewDocumentCommand{\DeclareCharacter}{m}{\gn_register_character:n {#1}}
\NewDocumentCommand{\DeclareLocation}{m}{\gn_register_location:n {#1}}
\NewDocumentCommand{\DeclareProp}{m}{\gn_register_prop:n {#1}}
\NewDocumentCommand{\DeclareContinuityItem}{m}{\gn_register_continuity:n {#1}}

\NewDocumentEnvironment{character}{m}
  { \gn_start_bible_entry:nn \gn_register_character:n {#1} \bool_gset_true:N \g_gn_in_character_bible_bool }
  { \gn_store_bible_entry:N \g_gn_character_entry_prop \bool_gset_false:N \g_gn_in_character_bible_bool }
\NewDocumentEnvironment{locationentry}{m}
  { \gn_start_bible_entry:nn \gn_register_location:n {#1} \bool_gset_true:N \g_gn_in_location_bible_bool }
  { \gn_store_bible_entry:N \g_gn_location_entry_prop \bool_gset_false:N \g_gn_in_location_bible_bool }
\NewDocumentEnvironment{propentry}{m}
  { \gn_start_bible_entry:nn \gn_register_prop:n {#1} \bool_gset_true:N \g_gn_in_prop_bible_bool }
  { \gn_store_bible_entry:N \g_gn_prop_entry_prop \bool_gset_false:N \g_gn_in_prop_bible_bool }
\NewDocumentEnvironment{continuityitem}{m}
  { \gn_start_bible_entry:nn \gn_register_continuity:n {#1} \bool_gset_true:N \g_gn_in_continuity_bible_bool }
  { \gn_store_bible_entry:N \g_gn_continuity_entry_prop \bool_gset_false:N \g_gn_in_continuity_bible_bool }

\NewDocumentCommand{\aka}{m}{\gn_require_character_bible: \gn_append_bible_field:nn {Also~known~as} {#1}}
\NewDocumentCommand{\height}{m}{\gn_require_character_bible: \gn_append_bible_field:nn {Height} {#1}}
\NewDocumentCommand{\ageRange}{m}{\gn_require_character_bible: \gn_append_bible_field:nn {Age~range} {#1}}
\NewDocumentCommand{\wardrobe}{m}{\gn_require_character_bible: \gn_append_bible_field:nn {Wardrobe} {#1}}
\NewDocumentCommand{\expressionsummary}{m}{\gn_require_character_bible: \gn_append_bible_field:nn {Expression~summary} {#1}}
\NewDocumentCommand{\architecture}{m}{\gn_require_location_bible: \gn_append_bible_field:nn {Architecture} {#1}}
\NewDocumentCommand{\furniture}{m}{\gn_require_location_bible: \gn_append_bible_field:nn {Furniture} {#1}}
\NewDocumentCommand{\lighting}{m}{\gn_require_location_bible: \gn_append_bible_field:nn {Lighting} {#1}}
\NewDocumentCommand{\mood}{m}{\gn_require_location_bible: \gn_append_bible_field:nn {Mood} {#1}}

\NewDocumentCommand{\appearance}{mm}
  {
    \gn_check_era:n {#1}
    \tl_set:Nx \l_tmpa_tl { \gn_state_key:nn {\tl_use:N \g_gn_current_bible_name_tl} {#1} }
    \bool_if:NTF \g_gn_in_character_bible_bool
      {
        \exp_args:NNV \prop_if_in:NnTF \g_gn_character_appearance_prop \l_tmpa_tl
          { \gn_error:nn {Duplicate~appearance~for~'#1'} {Each~character~may~have~only~one~appearance~description~per~era.} }
          { \prop_gput:NVn \g_gn_character_appearance_prop \l_tmpa_tl {#2} \gn_append_bible_state:nn {#1} {#2} \int_gincr:N \g_gn_current_appearance_count_int }
      }
      {
        \bool_if:NTF \g_gn_in_location_bible_bool
          {
            \exp_args:NNV \prop_if_in:NnTF \g_gn_location_appearance_prop \l_tmpa_tl
              { \gn_error:nn {Duplicate~appearance~for~'#1'} {Each~location~may~have~only~one~appearance~description~per~era.} }
              { \prop_gput:NVn \g_gn_location_appearance_prop \l_tmpa_tl {#2} \gn_append_bible_state:nn {#1} {#2} \int_gincr:N \g_gn_current_appearance_count_int }
          }
          {
            \bool_if:NTF \g_gn_in_prop_bible_bool
              {
                \exp_args:NNV \prop_if_in:NnTF \g_gn_prop_appearance_prop \l_tmpa_tl
                  { \gn_error:nn {Duplicate~appearance~for~'#1'} {Each~prop~may~have~only~one~appearance~description~per~era.} }
                  { \prop_gput:NVn \g_gn_prop_appearance_prop \l_tmpa_tl {#2} \gn_append_bible_state:nn {#1} {#2} \int_gincr:N \g_gn_current_appearance_count_int }
              }
              { \gn_error:nn {\string\appearance~outside~an~era-sensitive~bible~entry} {Use~it~inside~character,~locationentry,~or~propentry.} }
          }
      }
  }

\NewDocumentCommand{\expression}{mm}
  {
    \bool_if:NTF \g_gn_in_character_bible_bool
      {
        \tl_set:Nx \l_tmpa_tl { \gn_state_key:nn {\tl_use:N \g_gn_current_bible_name_tl} {#1} }
        \exp_args:NNV \prop_if_in:NnTF \g_gn_expressions_prop \l_tmpa_tl
          { \gn_error:nn {Duplicate~expression~'#1'} {Expression~names~must~be~unique~within~a~character.} }
          { \prop_gput:NVn \g_gn_expressions_prop \l_tmpa_tl {#2} \gn_append_bible_state:nn {#1} {#2} }
      }
      { \gn_require_panel: \gn_check_expression:nn {#1}{#2} \textbf{EXPRESSION:}~#1~---~#2\par }
  }

\NewDocumentCommand{\tell}{mm}
  {
    \bool_if:NTF \g_gn_in_character_bible_bool
      {
        \tl_set:Nx \l_tmpa_tl { \gn_state_key:nn {\tl_use:N \g_gn_current_bible_name_tl} {#1} }
        \exp_args:NNV \prop_if_in:NnTF \g_gn_tells_prop \l_tmpa_tl
          { \gn_error:nn {Duplicate~tell~'#1'} {Tell~names~must~be~unique~within~a~character.} }
          { \prop_gput:NVn \g_gn_tells_prop \l_tmpa_tl {#2} \gn_append_bible_state:nn {#1} {#2} }
      }
      { \gn_require_panel: \gn_check_tell:nn {#1}{#2} \textbf{TELL:}~#1~---~#2\par }
  }

\NewDocumentCommand{\technology}{m}
  {
    \bool_if:NTF \g_gn_in_location_bible_bool { \gn_append_bible_field:nn {Technology} {#1} }
      { \bool_if:NTF \g_gn_in_prop_bible_bool { \gn_append_bible_field:nn {Technology} {#1} }
        { \bool_if:NTF \g_gn_in_continuity_bible_bool { \gn_append_bible_field:nn {Technology} {#1} }
          { \gn_error:nn {\string\technology~outside~a~supported~reference~entry} {Use~it~inside~locationentry,~propentry,~or~continuityitem.} } } }
  }

\NewDocumentCommand{\continuityRule}{m}
  {
    \bool_if:NTF \g_gn_in_character_bible_bool { \gn_append_bible_field:nn {Continuity~rule} {#1} }
      { \bool_if:NTF \g_gn_in_location_bible_bool { \gn_append_bible_field:nn {Continuity~rule} {#1} }
        { \bool_if:NTF \g_gn_in_prop_bible_bool { \gn_append_bible_field:nn {Continuity~rule} {#1} }
          { \bool_if:NTF \g_gn_in_continuity_bible_bool { \gn_append_bible_field:nn {Rule} {#1} }
            { \gn_error:nn {\string\continuityRule~outside~a~reference~entry} {Use~it~inside~a~reference-bible~entry.} } } } }
  }

\NewDocumentCommand{\introducedIn}{m}
  {
    \bool_if:nTF
      { \g_gn_in_character_bible_bool || \g_gn_in_location_bible_bool || \g_gn_in_prop_bible_bool }
      { \gn_append_bible_field:nn {Introduced~in} {#1} }
      { \gn_error:nn {\string\introducedIn~outside~a~supported~reference~entry} {Use~it~inside~character,~locationentry,~or~propentry.} }
  }

% Generic escape hatches retained for unusual invariant facts, but not needed for era states.
\NewDocumentCommand{\charfield}{mm}{\gn_require_character_bible: \gn_append_bible_field:nn {#1}{#2}}
\NewDocumentCommand{\locfield}{mm}{\gn_require_location_bible: \gn_append_bible_field:nn {#1}{#2}}
\NewDocumentCommand{\propfield}{mm}{\gn_require_prop_bible: \gn_append_bible_field:nn {#1}{#2}}
\NewDocumentCommand{\continuityfield}{mm}{\gn_require_continuity_bible: \gn_append_bible_field:nn {#1}{#2}}

\NewDocumentCommand{\printCharacterBible}{}{\gn_print_character_entries:}
\NewDocumentCommand{\printLocationBible}{}{\gn_print_location_entries:}
\NewDocumentCommand{\printPropBible}{}{\gn_print_prop_entries:}
\NewDocumentCommand{\printContinuityBible}{}{\gn_print_continuity_entries:}
\NewDocumentCommand{\printReferenceBible}{}
  { \gn_print_character_entries: \gn_print_location_entries: \gn_print_prop_entries: \gn_print_continuity_entries: }

% --------------------------------------------------------------------------
% Story / page / panel lifecycle
% --------------------------------------------------------------------------
\NewDocumentCommand{\graphicNovelTitle}{m}
  { \gn_nonblank:nTF {#1} { \tl_gset:Nn \g_gn_novel_title_tl {#1} } { \gn_error:nn {Missing~graphic~novel~title} {Supply~a~title.} } }

\NewDocumentCommand{\newStory}{m}
  {
    \gn_close_current_page:
    \gn_nonblank:nTF {#1}
      {
        \ifgn@compact\par\bigskip\else\clearpage\fi
        \tl_gset:Nn \g_gn_story_tl {#1}
        \tl_gclear:N \g_gn_era_tl
        \tl_gclear:N \g_gn_last_location_tl
        \setcounter{panel}{0}
        \bool_gset_true:N \g_gn_story_open_bool
      }
      { \gn_error:nn {Missing~story~title} {Supply~a~non-empty~story~title.} }
  }
\NewDocumentCommand{\newVignette}{m}{\newStory{#1}}

\NewDocumentCommand{\era}{m}
  { \gn_check_era:n {#1} \tl_gset:Nn \g_gn_era_tl {#1} }

\NewDocumentCommand{\newComicPage}{o}
  {
    \bool_if:NF \g_gn_story_open_bool { \gn_warning:n {Starting~a~comic~page~before~\string\newStory.} }
    \gn_close_current_page:
    \ifgn@compact\par\bigskip\else\clearpage\fi
    \IfNoValueTF{#1}
      { \stepcounter{comicpage} }
      {
        \regex_match:nnTF { \A\s*[1-9][0-9]*\s*\Z } {#1}
          { \setcounter{comicpage}{#1} }
          { \gn_error:nn {Invalid~comic~page~number~'#1'} {Use~a~positive~integer~page~number.} }
      }
    \setcounter{panel}{0}
    \tl_gset:Nx \g_gn_page_label_tl { \int_eval:n { \value{comicpage} } }
    \int_gzero:N \g_gn_expected_panels_int
    \int_gset:Nn \g_gn_expected_turn_int { \value{comicpage} + 1 }
    \tl_gclear:N \g_gn_layout_tl
    \tl_gclear:N \g_gn_custom_layout_tl
    \bool_gset_false:N \g_gn_layout_given_bool
    \bool_gset_false:N \g_gn_panel_open_bool
    \bool_gset_false:N \g_gn_spread_open_bool
    \bool_gset_false:N \g_gn_no_dialogue_bool
    \bool_gset_false:N \g_gn_no_captions_bool
    \bool_gset_false:N \g_gn_dialogue_used_bool
    \bool_gset_false:N \g_gn_caption_used_bool
    \bool_gset_true:N \g_gn_page_open_bool
    \fancyhead[L]{\small\itshape \tl_use:N\g_gn_story_tl\space---\space PAGE~\tl_use:N\g_gn_page_label_tl~(CONTINUED)}
    \thispagestyle{plain}
    {\Large\bfseries PAGE~\tl_use:N\g_gn_page_label_tl\par}
    \tl_if_blank:VF \g_gn_story_tl
      { {\small\itshape \tl_use:N\g_gn_story_tl \tl_if_blank:VF \g_gn_era_tl {\space---\space \tl_use:N\g_gn_era_tl}\par} }
    \medskip
  }

\int_new:N \l_gn_spread_first_int
\int_new:N \l_gn_spread_second_int
\NewDocumentCommand{\newDoublePageSpread}{o}
  {
    \bool_if:NF \g_gn_story_open_bool { \gn_warning:n {Starting~a~double-page~spread~before~\string\newStory.} }
    \gn_close_current_page:
    \ifgn@compact\par\bigskip\else\clearpage\fi
    \IfNoValueTF{#1}{\int_set:Nn \l_gn_spread_first_int {\value{comicpage}+1}}{\int_set:Nn \l_gn_spread_first_int {#1}}
    \int_compare:nNnF {\l_gn_spread_first_int}>{0}{\gn_error:nn {Invalid~double-page~spread~start~page}{Use~a~positive~page~number.}}
    \int_set:Nn \l_gn_spread_second_int {\l_gn_spread_first_int+1}
    \int_if_odd:nT {\l_gn_spread_first_int}{\gn_warning:n {Double-page~spread~starts~on~odd~page~\int_use:N\l_gn_spread_first_int.}}
    \setcounter{comicpage}{\int_use:N\l_gn_spread_second_int}
    \setcounter{panel}{1}
    \tl_gset:Nx \g_gn_page_label_tl {\int_use:N\l_gn_spread_first_int / \int_use:N\l_gn_spread_second_int}
    \int_gset:Nn \g_gn_expected_panels_int {1}
    \int_gset:Nn \g_gn_expected_turn_int {\l_gn_spread_second_int+1}
    \tl_gset:Nn \g_gn_layout_tl {double-page~spread}
    \bool_gset_true:N \g_gn_layout_given_bool
    \bool_gset_true:N \g_gn_panel_open_bool
    \bool_gset_true:N \g_gn_spread_open_bool
    \bool_gset_false:N \g_gn_location_given_bool
    \bool_gset_false:N \g_gn_shot_given_bool
    \bool_gset_false:N \g_gn_action_given_bool
    \bool_gset_false:N \g_gn_no_dialogue_bool
    \bool_gset_false:N \g_gn_no_captions_bool
    \bool_gset_false:N \g_gn_dialogue_used_bool
    \bool_gset_false:N \g_gn_caption_used_bool
    \tl_gclear:N \g_gn_current_location_tl
    \bool_gset_true:N \g_gn_page_open_bool
    \fancyhead[L]{\small\itshape \tl_use:N\g_gn_story_tl\space---\space PAGE~\tl_use:N\g_gn_page_label_tl~(CONTINUED)}
    \thispagestyle{plain}
    {\Large\bfseries PAGE~\tl_use:N\g_gn_page_label_tl\par}{\large\bfseries DOUBLE~PAGE~SPREAD\par}\medskip
  }
\NewDocumentCommand{\newSpread}{o}{\IfNoValueTF{#1}{\newDoublePageSpread}{\newDoublePageSpread[#1]}}

\NewDocumentCommand{\newPanel}{}
  {
    \bool_if:NF \g_gn_page_open_bool { \gn_error:nn {Panel~started~without~a~comic~page} {Call~\string\newComicPage~first.} }
    \bool_if:NT \g_gn_spread_open_bool { \gn_error:nn {\string\newPanel~used~inside~a~double-page~spread} {A~double-page~spread~is~already~one~spanning~image.} }
    \gn_validate_panel:
    \stepcounter{panel}
    \bool_gset_true:N \g_gn_panel_open_bool
    \bool_gset_false:N \g_gn_location_given_bool
    \bool_gset_false:N \g_gn_shot_given_bool
    \bool_gset_false:N \g_gn_action_given_bool
    \tl_gclear:N \g_gn_current_location_tl
    \par\medskip{\large\bfseries PANEL~\arabic{panel}\par}
  }

% --------------------------------------------------------------------------
% Layout grammar
% --------------------------------------------------------------------------
\tl_new:N \l_gn_layout_heights_tl
\keys_define:nn {gn/layout}{heights .tl_set:N=\l_gn_layout_heights_tl}
\NewDocumentCommand{\pageLayout}{O{}m}
  {
    \bool_if:NF \g_gn_page_open_bool {\gn_error:nn {Page~layout~without~a~comic~page}{Call~\string\newComicPage~first.}}
    \tl_clear:N \l_gn_layout_heights_tl
    \keys_set:nn {gn/layout}{#1}
    \int_gzero:N \g_gn_expected_panels_int
    \bool_gset_true:N \g_gn_layout_given_bool
    \tl_gset:Nn \g_gn_layout_tl {#2}
    \clist_map_inline:nn {#2}
      { \regex_match:nnTF {\A\s*[1-9][0-9]*\s*\Z}{##1}{\int_gadd:Nn \g_gn_expected_panels_int {##1}}{\gn_error:nn {Invalid~page-layout~row~'##1'}{Use~positive~integers.}} }
    \textbf{PANEL~LAYOUT:}~#2
    \tl_if_blank:VF \l_gn_layout_heights_tl {\space(heights:~\tl_use:N\l_gn_layout_heights_tl)}
    \space[\int_use:N\g_gn_expected_panels_int\space panels]\par
  }

\int_new:N \l_gn_custom_panels_int
\keys_define:nn {gn/customlayout}{panels .int_set:N=\l_gn_custom_panels_int}
\NewDocumentCommand{\customLayout}{O{}m}
  {
    \bool_if:NF \g_gn_page_open_bool {\gn_error:nn {Custom~layout~without~a~comic~page}{Call~\string\newComicPage~first.}}
    \int_zero:N \l_gn_custom_panels_int
    \keys_set:nn {gn/customlayout}{#1}
    \bool_gset_true:N \g_gn_layout_given_bool
    \int_gset_eq:NN \g_gn_expected_panels_int \l_gn_custom_panels_int
    \tl_gset:Nn \g_gn_custom_layout_tl {#2}
    \textbf{PANEL~LAYOUT:}~#2
    \int_compare:nNnT {\l_gn_custom_panels_int}>{0}{\space[\int_use:N\l_gn_custom_panels_int\space panels]}\par
  }

% --------------------------------------------------------------------------
% Panel directives: bible-backed background, foreground and references
% --------------------------------------------------------------------------
\NewDocumentCommand{\location}{m}
  {
    \gn_require_panel:
    \gn_check_location:n {#1}
    \gn_check_location_appearance:n {#1}
    \bool_gset_true:N \g_gn_location_given_bool
    \tl_gset:Nn \g_gn_current_location_tl {#1}
    \tl_gset:Nn \g_gn_last_location_tl {#1}
    \textbf{LOCATION~(BACKGROUND):}~#1\par
  }

\NewDocumentCommand{\sameLocation}{}
  {
    \gn_require_panel:
    \tl_if_blank:VTF \g_gn_last_location_tl
      { \gn_error:nn {\string\sameLocation~used~without~a~previous~location} {Give~the~panel~an~explicit~\string\location\{...\}.} }
      {
        \exp_args:NV \gn_check_location_appearance:n \g_gn_last_location_tl
        \bool_gset_true:N \g_gn_location_given_bool
        \tl_gset_eq:NN \g_gn_current_location_tl \g_gn_last_location_tl
        \textbf{LOCATION~(BACKGROUND):}~\tl_use:N\g_gn_last_location_tl\space\textit{(same)}\par
      }
  }

\NewDocumentCommand{\prop}{m}
  { \gn_require_panel: \gn_check_prop:n {#1} \gn_check_prop_appearance:n {#1} \textbf{OBJECT:}~#1\par }
\NewDocumentCommand{\object}{m}{\prop{#1}}

\NewDocumentCommand{\shot}{m}
  { \gn_require_panel: \gn_nonblank:nTF {#1}{\bool_gset_true:N \g_gn_shot_given_bool \textbf{SHOT:}~#1\par}{\gn_error:nn {Missing~shot~description}{Supply~a~non-empty~shot~description.}} }
\NewDocumentCommand{\action}{m}
  { \gn_require_panel: \gn_nonblank:nTF {#1}{\bool_gset_true:N \g_gn_action_given_bool \textbf{ACTION~(FOREGROUND):}~#1\par}{\gn_error:nn {Missing~action~description}{Supply~a~non-empty~action~description.}} }

\bool_new:N \l_gn_dialogue_off_bool
\tl_new:N \l_gn_dialogue_position_tl
\tl_new:N \l_gn_dialogue_note_tl
\keys_define:nn {gn/dialogue}{off .bool_set:N=\l_gn_dialogue_off_bool,off .default:n=true,position .tl_set:N=\l_gn_dialogue_position_tl,note .tl_set:N=\l_gn_dialogue_note_tl}
\NewDocumentCommand{\dialogue}{O{}mm}
  {
    \gn_require_panel:
    \bool_set_false:N \l_gn_dialogue_off_bool \tl_clear:N \l_gn_dialogue_position_tl \tl_clear:N \l_gn_dialogue_note_tl
    \keys_set:nn {gn/dialogue}{#1}
    \gn_check_character:n {#2} \gn_check_character_appearance:n {#2}
    \bool_gset_true:N \g_gn_dialogue_used_bool
    \par\smallskip\hspace*{1.2em}\textbf{#2}\bool_if:NT \l_gn_dialogue_off_bool {\space\textbf{(OFF)}}\textbf{:}\par
    \hspace*{2.4em}\begin{minipage}{0.82\linewidth}#3\end{minipage}\par
    \tl_if_blank:VF \l_gn_dialogue_position_tl {\hspace*{2.4em}{\footnotesize\itshape Balloon~position:~\tl_use:N\l_gn_dialogue_position_tl\par}}
    \tl_if_blank:VF \l_gn_dialogue_note_tl {\hspace*{2.4em}{\footnotesize\itshape \tl_use:N\l_gn_dialogue_note_tl\par}}
  }

\RenewDocumentCommand{\caption}{m}{\gn_require_panel: \bool_gset_true:N \g_gn_caption_used_bool \textbf{CAPTION:}~#1\par}
\NewDocumentCommand{\captiontext}{m}{\caption{#1}}
\NewDocumentCommand{\sfx}{m}{\gn_require_panel: \textbf{SFX:}~\textsc{#1}\par}
\NewDocumentCommand{\note}{m}{\gn_require_panel: {\footnotesize\textbf{NOTE:}~\textit{#1}\par}}
\NewDocumentCommand{\noDialogue}{}{\bool_if:NF \g_gn_page_open_bool{\gn_error:nn {\string\noDialogue~outside~a~comic~page}{Start~a~page~first.}}\bool_gset_true:N \g_gn_no_dialogue_bool\textbf{NO~DIALOGUE.}\par}
\NewDocumentCommand{\noCaptions}{}{\bool_if:NF \g_gn_page_open_bool{\gn_error:nn {\string\noCaptions~outside~a~comic~page}{Start~a~page~first.}}\bool_gset_true:N \g_gn_no_captions_bool\textbf{NO~CAPTIONS.}\par}
\NewDocumentCommand{\turnTo}{m}
  {
    \bool_if:NF \g_gn_page_open_bool {\gn_error:nn {\string\turnTo~outside~a~comic~page}{Start~a~page~first.}}
    \regex_match:nnTF {\A\s*[1-9][0-9]*\s*\Z}{#1}
      { \int_compare:nNnF {#1}={\g_gn_expected_turn_int}{\gn_warning:n {\gn_context_page:\MessageBreak TURN~TO~PAGE~#1~does~not~match~the~next~page,~\int_use:N\g_gn_expected_turn_int.}} \par\medskip\textbf{TURN~TO~PAGE~#1}\par }
      { \gn_error:nn {Invalid~turn-to~page~'#1'}{Use~a~positive~integer~page~number.} }
  }

% --------------------------------------------------------------------------
% Validation
% --------------------------------------------------------------------------
\cs_new_protected:Npn \gn_validate_panel:
  {
    \bool_if:NT \g_gn_panel_open_bool
      {
        \bool_if:NF \g_gn_location_given_bool {\gn_warning:n {\gn_context_panel:\MessageBreak No~LOCATION/BACKGROUND~specified.}}
        \bool_if:nT {!\g_gn_shot_given_bool && !\g_gn_action_given_bool}{\gn_warning:n {\gn_context_panel:\MessageBreak Has~neither~SHOT~nor~ACTION/FOREGROUND.}}
      }
  }

\cs_new_protected:Npn \gn_validate_page:
  {
    \bool_if:NT \g_gn_page_open_bool
      {
        \bool_if:NF \g_gn_layout_given_bool {\gn_warning:n {\gn_context_page:\MessageBreak No~PAGE~LAYOUT~specified.}}
        \int_compare:nNnT {\g_gn_expected_panels_int}>{0}
          { \int_compare:nNnF {\value{panel}}={\g_gn_expected_panels_int}{\gn_warning:n {\gn_context_page:\MessageBreak Layout~requires~\int_use:N\g_gn_expected_panels_int\space panels;~\arabic{panel}~supplied.}} }
        \bool_if:nT {\g_gn_no_dialogue_bool && \g_gn_dialogue_used_bool}{\gn_warning:n {\gn_context_page:\MessageBreak Declared~NO~DIALOGUE~but~dialogue~was~supplied.}}
        \bool_if:nT {\g_gn_no_captions_bool && \g_gn_caption_used_bool}{\gn_warning:n {\gn_context_page:\MessageBreak Declared~NO~CAPTIONS~but~a~caption~was~supplied.}}
      }
  }

\cs_new_protected:Npn \gn_close_current_page:
  { \gn_validate_panel: \gn_validate_page: \bool_gset_false:N \g_gn_panel_open_bool \bool_gset_false:N \g_gn_page_open_bool \bool_gset_false:N \g_gn_spread_open_bool }

\cs_new_protected:Npn \gn_validate_bible_entity_has_appearance:NNn #1#2#3
  {
    \seq_map_inline:Nn #1
      {
        \bool_set_false:N \l_tmpa_bool
        \seq_map_inline:Nn \g_gn_era_order_seq
          {
            \tl_set:Nx \l_tmpa_tl { ##1 || ####1 }
            \exp_args:NNV \prop_if_in:NnT #2 \l_tmpa_tl {\bool_set_true:N \l_tmpa_bool}
          }
        \bool_if:NF \l_tmpa_bool
          { \prop_get:NnN \cs:w g_gn_#3s_prop\cs_end: {##1} \l_tmpb_tl }
      }
  }

\cs_new_protected:Npn \gn_validate_bible:
  {
    \seq_map_inline:Nn \g_gn_character_order_seq
      {
        \bool_set_false:N \l_tmpa_bool
        \seq_map_inline:Nn \g_gn_era_order_seq
          { \tl_set:Nx \l_tmpa_tl {##1 || ####1} \exp_args:NNV \prop_if_in:NnT \g_gn_character_appearance_prop \l_tmpa_tl {\bool_set_true:N \l_tmpa_bool} }
        \bool_if:NF \l_tmpa_bool { \prop_get:NnN \g_gn_characters_prop {##1} \l_tmpb_tl \gn_error:nn {Character~'\tl_use:N\l_tmpb_tl'~has~no~era-specific~appearance}{Add~at~least~one~\string\appearance\{ERA\}\{...\}~entry.} }
      }
    \seq_map_inline:Nn \g_gn_location_order_seq
      {
        \bool_set_false:N \l_tmpa_bool
        \seq_map_inline:Nn \g_gn_era_order_seq
          { \tl_set:Nx \l_tmpa_tl {##1 || ####1} \exp_args:NNV \prop_if_in:NnT \g_gn_location_appearance_prop \l_tmpa_tl {\bool_set_true:N \l_tmpa_bool} }
        \bool_if:NF \l_tmpa_bool { \prop_get:NnN \g_gn_locations_prop {##1} \l_tmpb_tl \gn_error:nn {Location~'\tl_use:N\l_tmpb_tl'~has~no~era-specific~appearance}{Add~at~least~one~\string\appearance\{ERA\}\{...\}~entry.} }
      }
    \seq_map_inline:Nn \g_gn_prop_order_seq
      {
        \bool_set_false:N \l_tmpa_bool
        \seq_map_inline:Nn \g_gn_era_order_seq
          { \tl_set:Nx \l_tmpa_tl {##1 || ####1} \exp_args:NNV \prop_if_in:NnT \g_gn_prop_appearance_prop \l_tmpa_tl {\bool_set_true:N \l_tmpa_bool} }
        \bool_if:NF \l_tmpa_bool { \prop_get:NnN \g_gn_props_prop {##1} \l_tmpb_tl \gn_error:nn {Object~'\tl_use:N\l_tmpb_tl'~has~no~era-specific~appearance}{Add~at~least~one~\string\appearance\{ERA\}\{...\}~entry.} }
      }
  }

\NewDocumentCommand{\validateGraphicNovel}{}{\gn_close_current_page: \gn_validate_bible:}
\AtEndDocument{\gn_close_current_page: \gn_validate_bible:}

\ExplSyntaxOff
