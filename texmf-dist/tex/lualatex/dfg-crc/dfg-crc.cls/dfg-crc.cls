%%
%% This is file `dfg-crc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% crc-proposal-documentation-and-code.dtx  (with options: `file,cls')
%% ------------------------------------------------------------------------
%% DFG CRC proposal class
%% Copyright: 2026 Lukas C. Bossert
%% Author:    Lukas C. Bossert
%% E-mail:    bossert@itc.rwth-aachen.de
%% License:   LaTeX Project Public License v1.3c or later
%% See:       https://www.latex-project.org/lppl.txt
%% ------------------------------------------------------------------------
%% 
%% >>>>> DO NOT CHANGE THIS FILE >>> IT WILL BE OVERWRITTEN BY ANY UPDATE !
%% 
% ChkTeX's prose-oriented rules do not understand expl3 or embedded Lua.
% chktex-file 1
% chktex-file 8
% chktex-file 9
% chktex-file 13
% chktex-file 18
% chktex-file 24
% chktex-file 26
% chktex-file 27
% chktex-file 32
% chktex-file 36
% chktex-file 37
% chktex-file 39
\def\dfgVersion{0.1.0}
\def\dfgVersionDate{2026-08-03}
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesExplClass
{dfg-crc}
{\dfgVersionDate}
{\dfgVersion}
{Create DFG Collaborative Research Centre proposals and CVs}
\msg_new:nnn { dfg } { unsupported-engine }
{
  The~dfg-crc~class~requires~LuaLaTeX.^^J
  Compile~this~document~with~lualatex~or~latexmk~-lualatex.
}
\sys_if_engine_luatex:F
  { \msg_fatal:nn { dfg } { unsupported-engine } }

\msg_new:nnn { dfg } { file-not-found }
{ File~'#1'~not~found.^^J
  ~You~can~proceed~without~it~
  but~it~is~not~recommended.
}
\msg_new:nnn { dfg } { database-not-found }
{ Unknown~ database~ name:~ #1^^J^^J
  Database~'#1'~not~found~\msg_line_context:.~
  Either~you~have~misspelled~it~or~
  ~the~database~has~not~yet~been~created.
}
\msg_new:nnn { dfg } { database-name-not-given }
{ Missing~ database~ name~ for~ entry:~ #1^^J ^^J
  You~forgot~to~pass~a~database~name~\msg_line_context:.~
  You~can~provide~a~name~with~ e.g.~ '\def\tmpLocalDB{<database>}'
  ~or~within~entries~like~
  '\getEntry[<database>]{<id>}{<field>}'.
}
\msg_new:nnn { dfg } { biblatex-ext-oa-doiapi-unavailable }
{ biblatex-ext-oa~ DOI~ API~ lookup~ disabled:~ LuaSocket~ module~
  'socket.http'~ is~ not~ available~ in~ this~ LuaTeX~ run.~
  Compile~ with~ '--socket'~ to~ enable~ DOI~ API~ requests.~
  Open-access~ markers~ still~ work~ from~ manual~ BibTeX~ annotations.
}
\msg_new:nnn { dfg } { biblatex-ext-oa-doiapi-email-missing }
{ biblatex-ext-oa~ DOI~ API~ lookup~ disabled:~ no~contact~address~was~set.^^J
  Set~'doiAPIMail=<address>'~with~\string\changeSettings~to~enable~lookups.
  Open-access~markers~still~work~from~manual~BibTeX~annotations.
}
\msg_new:nnn { dfg } { missing-orcid }
{DB:~'#1';~ID:~'#2';~null/empty:~'orcid'.~^^J^^J
  The~ORCiD~for~the~person~with~the~ID~'#2'~has~not~been~given.~
  You~asked~for~it~\msg_line_context: ~^^J
  If~the~person~has~an~ORCiD, ~go~to~where~you~have~written~^^J
  \addEntry{#1}{^^J
  	id   =#2, ^^J
  	orcid=<INSERT~ORCID~HERE>^^J
  }
}
\msg_new:nnn { dfg } { missing-key }
{DB:~'#1';~ID:~'#2';~null/empty:~'#3'.^^J^^J
  In~ the~ database~ '#1', the~ key~ '#3'~ which~ belongs~ to~ the~ ID~ '#2'~
  is~ either~ null/not~ given~ or~ simply~ empty.~^^J
  You~ asked~ for~ it~ \msg_line_context:  }
\msg_new:nnn { dfg } { item-skipped }
{Item~ #1~ skipped~ (compile-time).^^J
  To~ see~ the~ item,~ disable~ fast~ compilation^^J
  in~ the~ documentclass-options.^^J
  The~ item~ is~ \msg_line_context:  }
\NewDocumentCommand{\dfgItemSkipped}{m}{%
  \msg_note:nne {dfg}{item-skipped}{ #1 }
  \group_begin:
  \color{error}
  Item~ \emph{\normalcolor#1}~ skipped~ due~ to~ faster~ compilation.~\\
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  { To~ see~ the~ item,~ set~ \texttt{fastcompile-project=false}~(default)~ }
  { To~ see~ the~ item,~ set~ \texttt{fastcompile=false}~(default)~ }
  in~ the~ documentclass-options.
  \group_end:
}
\msg_new:nnn { dfg } { research-area-not-found }
{ Unknown~ research~ area:~ #1^^J^^J
  Doublecheck~ the~ research~ area~ in~ the~ database:~^^J
  \addEntry{project}{~^^J
  	research-area~ =~ {#1}~^^J
  }
}
\msg_new:nnn { dfg } { item-not-matched }
{ The~ string~ '#1'~does~not~match.~^^J^^J
  Doublecheck~ your~input!~^^J
  The~ item~ is~ \msg_line_context:
}
\msg_new:nnn { dfg } { unknown-key }
{
  Key~ '\l_keys_path_str'~ is~ unknown~ and~ being~ ignored.~^^J^^J
  You~passed~the~value~'#1'~ to~ that~ key.~^^J
  Doublecheck~for~spelling~errors.~^^J
  The~ item~ is~ \msg_line_context:
}
\msg_new:nnn { dfg } { invalid-value }
{
  Invalid~value~'#1'~for~key~'\l_keys_path_str'.~^^J^^J
  Allowed~values~are:~'#2'.~^^J
  The~ item~ is~ \msg_line_context:
}
\msg_new:nnn { dfg } { invalid-project-count-area }
{
  No~active,~list-considered~projects~were~found~for~area~'#1'~in~
  \string\getProjectCount;~printing~0.
}
\msg_new:nnn { dfg } { collaboration-focus-not-found }
{
  Cannot~draw~the~project~collaboration~plot:~focus~project~'#1'~is~not~an~
  eligible~row~of~the~project~database.
}
\msg_new:nnn { dfg } { collaboration-target-not-found }
{
  Ignoring~collaboration~'#1--#2':~project~'#2'~is~not~an~eligible~row~of~
  the~project~database.
}
\msg_new:nnn { dfg } { invalid-date }
{ Field~ '#1'~ has~ value~ '#2'~ which~ is~ not~ a~ valid~ ISO-8601~ date~ (YYYY-MM-DD). }
\msg_new:nnn { dfg } { requested-staff-no-data }
{ No~RequestedFundingStaff~data~have~been~provided~for~project~'#1'. }
\msg_new:nnn { dfg } { requested-staff-required }
{ RequestedFundingStaff~entry~is~missing~required~metadata:~#1. }
\msg_new:nnn { dfg } { requested-staff-missing-field }
{ Project~'#1':~requested-funding~staff~#2~is~missing. }
\msg_new:nnn { dfg } { requested-staff-unresolved-person }
{ Project~'#1':~person~reference~'#2'~cannot~be~resolved. }
\msg_new:nnn { dfg } { requested-staff-unresolved-institution }
{ Project~'#1':~institution~reference~'#2'~cannot~be~resolved. }
\msg_new:nnn { dfg } { requested-staff-unresolved-affiliation }
{ Project~'#1':~affiliation~reference~'#2'~cannot~be~resolved. }
\msg_new:nnn { dfg } { requested-staff-missing-abbreviation }
{ Affiliation~'#1'~has~no~abbreviation;~its~full~name~is~used. }
\msg_new:nnn { dfg } { requested-staff-duplicate }
{ Duplicate~RequestedFundingStaff~entry~for~#1. }
\msg_new:nnn { dfg } { funding-staff-cost-unavailable }
{ Automatic~staff-cost~calculation~is~not~available~for~#1. }
\msg_new:nnn { dfg } { existing-staff-no-data }
{ No~existing~staff~rows~were~found~in~database~'#1'. }
\msg_new:nnn { dfg } { existing-staff-no-organisation }
{ Existing~staff~entry~'#1'~cannot~be~assigned~to~an~affiliation. }
\int_new:N \l__dfg_timer_int
\NewDocumentCommand { \StartTimer } { }
{
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  { \int_set:Nn \l__dfg_timer_int { \sys_timer: } }
}
\NewDocumentCommand { \StopTimer } { m }
{
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
    \iow_term:x
    {
      TIMING~#1:~
      \int_eval:n
      { ( \sys_timer: - \l__dfg_timer_int ) * 1000 / 65536 }
      \c_space_tl ms
    }
  }
}
\PassOptionsToClass{
  fontsize  =10pt,
  twoside   =true,
  headings  =optiontoheadandtoc,
  parskip   =half-,
  numbers   =noenddot,
  toc       =indentunnumbered
}{scrbook}
\keys_define:nn { dfg / class }
{
final      .bool_set:N = \l__dfg_class_final_bool,
final      .initial:n  = false,
Final      .meta:n     = { final = #1 },
Final      .default:n  = true,
fastcompile   .bool_set:N = \l__dfg_class_fastcompile_bool,
fastcompile   .initial:n  = false,
fastcompile-project .bool_set:N = \l__dfg_class_fastcompile_project_bool,
fastcompile-project .initial:n  = false,
fastcompile-project-show-images .bool_set:N = \l__dfg_class_fastcompile_project_show_images_bool,
fastcompile-project-show-images .initial:n  = false,
fastcompile-project-show-publications .bool_set:N = \l__dfg_class_fastcompile_project_show_publications_bool,
fastcompile-project-show-publications .initial:n  = false,
showtags   .bool_set:N = \l__dfg_class_showtags_bool,
showtags   .initial:n  = false,
showtags-tables  .bool_set:N = \l__dfg_class_showtags_tables_bool,
showtags-tables  .initial:n  = true,
showmarginalia .bool_set:N = \l__dfg_class_showmarginalia_bool,
showmarginalia .initial:n  = false,
skip10pub  .bool_set:N = \l__dfg_class_skipTENpublications_bool,
skip10pub  .initial:n  = false,
colorscheme .tl_set:N   =  \l__dfg_class_color_model_tl,
colorscheme .initial:n  = cmyk,
cv   .bool_set:N = \l__dfg_class_cv_bool,
cv   .initial:n  = false,
unknown .code:n = { \PassOptionsToClass{\CurrentOption}{scrbook} },
}
\NewDocumentCommand \dfgIfCV  { +m +m }
  { \bool_if:NTF \l__dfg_class_cv_bool {#1} {#2} }
\NewDocumentCommand \dfgIfCVT { +m }
  { \bool_if:NT  \l__dfg_class_cv_bool {#1} }
\NewDocumentCommand \dfgIfCVF { +m }
  { \bool_if:NF  \l__dfg_class_cv_bool {#1} }

\NewDocumentCommand \dfgIfFinalF { +m }
  { \bool_if:NF  \l__dfg_class_final_bool {#1} }
\NewDocumentCommand \dfgIfFastCompileProject { +m +m }
  { \bool_if:NTF \l__dfg_class_fastcompile_project_bool {#1} {#2} }
\NewDocumentCommand \dfgIfFastCompileProjectT { +m }
  { \bool_if:NT \l__dfg_class_fastcompile_project_bool {#1} }
\NewDocumentCommand \dfgIfFastCompileProjectF { +m }
  { \bool_if:NF \l__dfg_class_fastcompile_project_bool {#1} }
\NewDocumentCommand \dfgIfProjectPublications { +m +m }
  { \bool_if:NTF \l__dfg_class_fastcompile_project_show_publications_bool {#1} {#2} }
\ProcessKeyOptions[ dfg / class ]
\bool_if:NTF \l__dfg_class_final_bool
{
  \bool_set_false:N \l__dfg_class_fastcompile_bool
  \bool_set_false:N \l__dfg_class_fastcompile_project_bool
  \bool_set_false:N \l__dfg_class_fastcompile_project_show_images_bool
  \bool_set_false:N \l__dfg_class_showtags_bool
  \bool_set_false:N \l__dfg_class_showmarginalia_bool
  \bool_set_false:N \l__dfg_class_skipTENpublications_bool
  \bool_set_true:N  \l__dfg_class_fastcompile_project_show_publications_bool
}
{
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  {
    \bool_set_true:N  \l__dfg_class_fastcompile_bool
    \bool_set_false:N \l__dfg_class_showtags_bool
    \bool_set_false:N \l__dfg_class_showmarginalia_bool
    \bool_set_true:N  \l__dfg_class_skipTENpublications_bool
    \PassOptionsToPackage{draft}{hyperref}
    \PassOptionsToPackage{draft}{microtype}
  }
  { \bool_set_true:N \l__dfg_class_fastcompile_project_show_publications_bool }
  \bool_if:NT \l__dfg_class_fastcompile_bool
    { \bool_set_false:N \l__dfg_class_showtags_bool }
}
\LoadClass{scrbook}
\PassOptionsToPackage{table}{xcolor} % getting rid of errors and conflicts.
\RequirePackage{xcolor}
\definecolor{blue-100}{cmyk/RGB/HTML/gray}{1,.50,0,0/0,84,159/00549F/1}% primary
\definecolor{blue-75}{cmyk/RGB/HTML/gray}{.75,.38,0,0/64,127,183/407FB7/.75}%
\definecolor{blue-50}{cmyk/RGB/HTML/gray}{.45,.14,0,0/142,186,229/8EBAE5/.5}% secondary
\definecolor{blue-25}{cmyk/RGB/HTML/gray}{.23,.07,0,0/199,221,242/C7DDF2/.25}%
\definecolor{blue-10}{cmyk/RGB/HTML/gray}{.09,.03,0,0/232,241,250/E8F1FA/.1}%

\definecolor{black-100}{cmyk/RGB/HTML}{0,0,0,1/0,0,0/000000}%
\definecolor{black-75}{cmyk/RGB/HTML}{0,0,0,.75/100,101,103/646567}%
\definecolor{black-50}{cmyk/RGB/HTML}{0,0,0,.5/156,158,159/9C9E9F}%
\definecolor{black-25}{cmyk/RGB/HTML}{0,0,0,.25/207,209,210/CFD1D2}%
\definecolor{black-10}{cmyk/RGB/HTML}{0,0,0,.1/236,237,237/ECEDED}%

\definecolor{green-100}{cmyk/RGB/HTML}{.7,0,1,0/87,171,39/57AB27}%
\definecolor{green-75}{cmyk/RGB/HTML}{.52,0,.75,0/141,192,96/8DC060}%
\definecolor{green-50}{cmyk/RGB/HTML}{.35,0,.5,0/184,214,152/B8D698}%
\definecolor{green-25}{cmyk/RGB/HTML}{.18,0,.25,0/221,235,206/DDEBCE}%
\definecolor{green-10}{cmyk/RGB/HTML}{.07,0,.1,0/242,247,236/F2F7EC}%

\definecolor{red-100}{cmyk/RGB/HTML}{.15,1,1,0/204,7,30/CC071E}%
\definecolor{red-75}{cmyk/RGB/HTML}{.11,.75,.75,0/216,92,65/D85C41}%
\definecolor{red-50}{cmyk/RGB/HTML}{.8,.5,.5,0/230,150,121/E69679}%
\definecolor{red-25}{cmyk/RGB/HTML}{.4,.25,.25,0/243,205,187/F3CDBB}%
\definecolor{red-10}{cmyk/RGB/HTML}{.2,.1,.1,0/250,235,227/FAEBE3}%

\definecolor{bordeaux-100}{cmyk/RGB/HTML}{.25,1,.70,.20/161,16,53/A11035}%
\definecolor{bordeaux-75}{cmyk/RGB/HTML}{.19,.75,.52,15/182,82,86/B65256}%
\definecolor{bordeaux-50}{cmyk/RGB/HTML}{.13,.5,.35,.1/205,139,135/CD8B87}%
\definecolor{bordeaux-25}{cmyk/RGB/HTML}{.06,.25,.18,.05/229,197,192/E5C5C0}%
\definecolor{bordeaux-10}{cmyk/RGB/HTML}{.03,.1,.07,.02/245,232,229/F5E8E5}%

\definecolor{orcid}{cmyk/RGB}{0.15,0.00,0.59,0.20/174,205,84}
\keys_define:nn { dfg / custom  }
{
  % You can pass any font you like (and |fontspec| will understand or is known to
  % your system). But since the DFG is requiring Arial, we set this as default.
  font                       .tl_set:N   = \l__dfg_custom_font_tl,
  fontspec                   .tl_set:N   = \l__dfg_custom_fontspec_tl,
  font                       .initial:n  = Noto Serif,
  sansfont                   .tl_set:N   = \l__dfg_custom_sansfont_tl,
  sansfontspec               .tl_set:N   = \l__dfg_custom_sansfontspec_tl,
  sansfont                   .initial:n  = Roboto Light,
  sansfontspec            .initial:n     = {
  		ItalicFont=Roboto-LightItalic,
  		BoldFont=Roboto-Medium,
  		BoldItalicFont=Roboto-Medium-Italic},
  % \paragraph{Logo paths}
  crcLogoPath                 .tl_set:N   = \l__dfg_custom_crc_logo_path_tl,
  crcLogoPath                 .initial:n  = example-image-a,
  affiliationLogoPath         .tl_set:N   = \l__dfg_custom_affiliation_logo_path_tl,
  affiliationLogoPath         .initial:n  = example-image-b,
  % \paragraph{Project-reference repetition}
  projectPIOncePerSection      .bool_set:N =
    \l__dfg_custom_project_pi_once_per_section_bool,
  projectPIOncePerSection      .initial:n  = true,
  % Collaboration-plot area colors can be set once for the complete proposal.
  % Per-plot area-colors and area-palette options may override these defaults.
  collaborationAreaColors      .tl_set:N =
    \l__dfg_custom_collaboration_area_colors_tl,
  collaborationAreaColors      .initial:n =
    { A=projectA, B=projectB, Q=projectQ!75!black },
  collaborationAreaPalette     .code:n =
    {
      \clist_if_empty:nF {#1}
        { \tl_set:Nn \l__dfg_custom_collaboration_area_palette_tl {#1} }
    },
  collaborationAreaPalette     .initial:n =
    { orange!80!black, violet!75!black, teal!70!black,
      brown!75!black, magenta!70!black, cyan!70!black, lime!60!black },
  % \paragraph{DFG salary and animal-housing rates}
  salary@prof                 .fp_set:N   = \l__dfg_custom_salary_prof_fp,
  salary@prof                 .initial:n  = 123600,
  salary@groupLeader          .fp_set:N   = \l__dfg_custom_salary_group_leader_fp,
  salary@groupLeader          .initial:n  = 102300,
  salary@postDoc              .fp_set:N   = \l__dfg_custom_salary_postdoc_fp,
  salary@postDoc              .initial:n  = 88200,
  salary@medDoc               .fp_set:N   = \l__dfg_custom_salary_meddoc_fp,
  salary@medDoc               .initial:n  = 111000,
  salary@PhD                  .fp_set:N   = \l__dfg_custom_salary_phd_fp,
  salary@PhD                  .initial:n  = 81600,
  salary@research             .fp_set:N   = \l__dfg_custom_salary_research_fp,
  salary@research             .initial:n  = 67200,
  salary@nonResearch          .fp_set:N   = \l__dfg_custom_salary_nonresearch_fp,
  salary@nonResearch          .initial:n  = 60000,
  salary@student              .fp_set:N   = \l__dfg_custom_salary_student_fp,
  salary@student              .initial:n  = 1,
  salary@assistant            .fp_set:N   = \l__dfg_custom_salary_assistant_fp,
  salary@assistant            .initial:n  = 1,
  animalHousing@mouse         .fp_set:N   = \l__dfg_custom_animal_mouse_fp,
  animalHousing@mouse         .initial:n  = 0.75,
  animalHousing@mouseGnotobiotic .fp_set:N =
    \l__dfg_custom_animal_mouse_gnotobiotic_fp,
  animalHousing@mouseGnotobiotic .initial:n = 3.9,
  animalHousing@rat           .fp_set:N   = \l__dfg_custom_animal_rat_fp,
  animalHousing@rat           .initial:n  = 1.4,
  % \paragraph{Thumb-index keys}
  % These keys control the decorative side tab on the outer margin.
  % The index divides the page height (minus the two margin values) into
  % \meta{pattern} equal-height slots.  Each call to \cs{printThumbIndex}
  % advances the slot counter; when it reaches \meta{pattern} it wraps,
  % creating a repeating stripe aiding chapter navigation.
  %
  thumbindex                 .bool_set:N = \l__dfg_custom_thumbindex_bool,
  thumbindex                 .initial:n  = true,
  %
  thumbindex@pattern         .int_set:N  = \l__dfg_custom_thumbindexpattern_int,
  thumbindex@pattern         .initial:n  = 10,
  %
  thumbindex@topmargin .dim_set:N  = \l__dfg_custom_thumbindex_topmargin_dim,
  thumbindex@topmargin .initial:n  = 3cm,
  %
  thumbindex@bottommargin .dim_set:N  = \l__dfg_custom_thumbindex_bottommargin_dim,
  thumbindex@bottommargin .initial:n  = 3cm,
  %
  thumbindex@width     .dim_set:N  = \l__dfg_custom_thumbindex_width_dim,
  thumbindex@width .initial:n  = 1.2cm,
  %
  thumbindex@font .tl_set:N = \l__dfg_custom_thumbindex_font_tl,
  thumbindex@font .initial:n = \bfseries\Huge,
  % \paragraph{Bibliography keys}
  % |emphasizeAuthors|: when |true| (default), a bold-name mechanism is
  % activated that marks every PI's name in bold across all bibliography
  % and citation lists — the DFG-required visual distinction for CRC PIs.
  % CV and proposal bibliography styles and features are stored separately.
  %
  doiAPIMail                  .tl_set:N  = \l__dfg_custom_doi_api_mail_tl,
  doiAPIMail                  .initial:n = {},
  %
  emphasizeAuthors           .bool_set:N = \l__dfg_custom_emphasize_authors_bool,
  emphasizeAuthors           .initial:n  = true,
  %
  biblatexstyleCV                 .tl_set:N  = \l__dfg_custom_biblatexstyle_cv_tl,
  biblatexstyleCV                 .initial:n = ext-numeric-comp,
  biblatexstyleFeatureCV          .tl_set:N  = \l__dfg_custom_biblatexfeatures_cv_tl,
  biblatexstyleFeatureCV          .initial:n = {sorting=none},
  biblatexstyleProposal           .tl_set:N  = \l__dfg_custom_biblatexstyle_proposal_tl,
  biblatexstyleProposal           .initial:n = ext-authoryear-ecomp,
  biblatexstyleFeatureProposal    .tl_set:N  = \l__dfg_custom_biblatexfeatures_proposal_tl,
  biblatexstyleFeatureProposal    .initial:n = {dashed=false},
  % Compatibility: the former keys apply the supplied value to both modes.
  biblatexstyle .code:n =
    {
      \tl_set:Nn \l__dfg_custom_biblatexstyle_cv_tl       {#1}
      \tl_set:Nn \l__dfg_custom_biblatexstyle_proposal_tl {#1}
    },
  biblatexstyleFeature .code:n =
    {
      \tl_set:Nn \l__dfg_custom_biblatexfeatures_cv_tl       {#1}
      \tl_set:Nn \l__dfg_custom_biblatexfeatures_proposal_tl {#1}
    },
  % \paragraph{Colour keys}
  % All colour keys store a colour \emph{name} referencing an already-defined
  % xcolor colour (e.g.\ |blue-50|, |black-10|).  Actual \cs{colorlet}
  % bindings happen in \cs{AtBeginDocument} so preamble overrides are
  % processed first.  Groups: |color@gantt@*| for the five bar styles;
  % |color@table@*| for all table chrome; |color@thumbindex@*| for the
  % thumb tab; |color@tags@*| for the showtags debug annotations.
  %
  color@reference@boldAuthor .tl_set:N   = \l__dfg_custom_referenceBoldAuthor_tl,
  color@reference@boldAuthor .initial:n  = black,

  color@gantt@frame      .tl_set:N    = \l__dfg_custom_gantt_frame_tl,
  color@gantt@frame      .initial:n = {white},
  color@gantt@default    .tl_set:N    =\l__dfg_custom_gantt_default_tl,
  color@gantt@default    .initial:n = {blue-25},
  color@gantt@alternative    .tl_set:N    =\l__dfg_custom_gantt_alternative_tl,
  color@gantt@alternative    .initial:n = {green-25},
  color@gantt@crosshatch .tl_set:N    = \l__dfg_custom_gantt_crosshatch_tl,
  color@gantt@crosshatch .initial:n = {black-10},
  color@gantt@important  .tl_set:N    = \l__dfg_custom_gantt_important_tl,
  color@gantt@important  .initial:n = {red},
  color@gantt@stripe-one .tl_set:N    = \l__dfg_custom_gantt_stripe_one_tl,
  color@gantt@stripe-one .initial:n = {blue-25},
  color@gantt@stripe-two .tl_set:N    = \l__dfg_custom_gantt_stripe_two_tl,
  color@gantt@stripe-two .initial:n = {green-25},

  color@table@headingsBG     .tl_set:N   = \l__dfg_custom_tableHeadingsBG_tl,
  color@table@headingsBG     .initial:n  = blue-50,
  color@table@headingsBGalt  .tl_set:N   = \l__dfg_custom_tableHeadingsBGalt_tl,
  color@table@headingsBGalt  .initial:n  = black-25,
  color@table@headingsFont   .tl_set:N   = \l__dfg_custom_tableHeadingsFont_tl,
  color@table@headingsFont   .initial:n  = black,
  color@table@rows           .tl_set:N   = \l__dfg_custom_tableRows_tl,
  color@table@rows           .initial:n  = black-10,
  color@table@lines          .tl_set:N   = \l__dfg_custom_tableLines_tl,
  color@table@lines          .initial:n  = black-10,
  color@table@outerLines     .tl_set:N   = \l__dfg_custom_tableOuterLines_tl,
  color@table@outerLines     .initial:n  = black,
  color@table@noValue        .tl_set:N   = \l__dfg_custom_tableNoValue_tl,
  color@table@noValue        .initial:n  = black-10,
  color@table@firstColumn    .tl_set:N   = \l__dfg_custom_tableFirstColumn_tl,
  color@table@firstColumn    .initial:n  = black,
  color@table@link           .tl_set:N   = \l__dfg_custom_tableLink_tl,
  color@table@link           .initial:n = black,
  color@table@contFootHead   .tl_set:N  = \l__dfg_custom_tableContFootHead_tl,
  color@table@contFootHead   .initial:n = black,
  color@table@caption        .tl_set:N  = \l__dfg_custom_tableCaption_tl,
  color@table@caption        .initial:n = black,
  color@thumbindex@bg        .tl_set:N  = \l__dfg_custom_thumbIndexBG_tl,
  color@thumbindex@bg        .initial:n = black,
  color@thumbindex@font      .tl_set:N  = \l__dfg_custom_thumbIndexFont_tl,
  color@thumbindex@font      .initial:n = white,
  color@tags@font            .tl_set:N  = \l__dfg_custom_colorTagsFont_tl,
  color@tags@font            .initial:n = red-100,
  color@tags@line            .tl_set:N  = \l__dfg_custom_colorTagsLine_tl,
  color@tags@line            .initial:n = black-50,
  % The alternative font color which is used e.g. for the CV headline.
  color@font@alternative     .tl_set:N  = \l__dfg_custom_colorfontalternative_tl,
  color@font@alternative     .initial:n = black-50,

  color@item@i               .tl_set:N  = \l__dfg_custom_color_item_i_tl,
  color@item@i               .initial:n = black,
  % That’s it with the key-values.
}
\NewDocumentCommand{\changeSettings}{m}
  { \keys_set:nn { dfg / custom } {#1} }
\NewDocumentCommand{\changeSetting}{m}
  { \changeSettings{#1} }
\NewExpandableDocumentCommand{\dfgSalaryProf}{}
  { \fp_use:N \l__dfg_custom_salary_prof_fp }
\NewExpandableDocumentCommand{\dfgSalaryGroupLeader}{}
  { \fp_use:N \l__dfg_custom_salary_group_leader_fp }
\NewExpandableDocumentCommand{\dfgSalaryPostDoc}{}
  { \fp_use:N \l__dfg_custom_salary_postdoc_fp }
\NewExpandableDocumentCommand{\dfgSalaryMedDoc}{}
  { \fp_use:N \l__dfg_custom_salary_meddoc_fp }
\NewExpandableDocumentCommand{\dfgSalaryPhD}{}
  { \fp_use:N \l__dfg_custom_salary_phd_fp }
\NewExpandableDocumentCommand{\dfgSalaryResearch}{}
  { \fp_use:N \l__dfg_custom_salary_research_fp }
\NewExpandableDocumentCommand{\dfgSalaryNonResearch}{}
  { \fp_use:N \l__dfg_custom_salary_nonresearch_fp }
\NewExpandableDocumentCommand{\dfgSalaryStudent}{}
  { \fp_use:N \l__dfg_custom_salary_student_fp }
\NewExpandableDocumentCommand{\dfgSalaryAssistant}{}
  { \fp_use:N \l__dfg_custom_salary_assistant_fp }
\NewExpandableDocumentCommand{\dfgMouseHousing}{}
  { \fp_use:N \l__dfg_custom_animal_mouse_fp }
\NewExpandableDocumentCommand{\dfgMouseHousingGnotobiotic}{}
  { \fp_use:N \l__dfg_custom_animal_mouse_gnotobiotic_fp }
\NewExpandableDocumentCommand{\dfgRatHousing}{}
  { \fp_use:N \l__dfg_custom_animal_rat_fp }
\file_if_exist:nTF {preamble/dfg-customization.tex}
  { \ExplSyntaxOff \input{preamble/dfg-customization.tex} \ExplSyntaxOn }
  { \msg_warning:nnn { dfg } { file-not-found } {preamble/dfg-customization.tex} }
\bool_if:NT \l__dfg_class_fastcompile_project_bool
{
  \bool_set_false:N \l__dfg_custom_thumbindex_bool
  \bool_set_false:N \l__dfg_custom_emphasize_authors_bool
}
\RequirePackage{multicol}
\AtBeginDocument{%
  \@ifpackageloaded{lineno}{%
  	\providecommand*{\@LN@col}[1]{\relax}%
  }{}%
}
\RequirePackage{babel}
\RequirePackage{geometry}
\geometry{
  a4paper,
  % includefoot,
  top            =30mm,
  bottom         =30mm,
  left           =20mm,
  right          =30mm,
  marginparsep   =5mm,
  marginparwidth =20mm,
  % showframe
}
\AtBeginDocument{
  \selectcolormodel{\tl_use:N \l__dfg_class_color_model_tl}
  \colorlet{color@item@i}{\l__dfg_custom_color_item_i_tl}
  \colorlet{color@tags@font}{\l__dfg_custom_colorTagsFont_tl}
  \colorlet{color@tags@line}{\l__dfg_custom_colorTagsLine_tl}
  \colorlet{color@font@alternative}{\l__dfg_custom_colorfontalternative_tl}
  \colorlet{color@reference@boldAuthor}{\l__dfg_custom_referenceBoldAuthor_tl}
  \colorlet{tableHeadingsBG}{\l__dfg_custom_tableHeadingsBG_tl}
  \colorlet{tableHeadingsBGalt}{\l__dfg_custom_tableHeadingsBGalt_tl}
  \colorlet{tableHeadingsFont}{\l__dfg_custom_tableHeadingsFont_tl}
  \colorlet{tableRows}{\l__dfg_custom_tableRows_tl}
  \colorlet{tableLines}{\l__dfg_custom_tableLines_tl}
  \colorlet{tableOuterLines}{\l__dfg_custom_tableOuterLines_tl}
  \colorlet{tableNoValue}{\l__dfg_custom_tableNoValue_tl}
  \colorlet{tableFirstColumn}{\l__dfg_custom_tableFirstColumn_tl}
  \colorlet{tableLink}{\l__dfg_custom_tableLink_tl}
  \colorlet{tableContFootHead}{\l__dfg_custom_tableContFootHead_tl}
  \colorlet{tableCaption}{\l__dfg_custom_tableCaption_tl}
  \colorlet{thumbIndexBG}{\l__dfg_custom_thumbIndexBG_tl}
  \colorlet{thumbIndexFont}{\l__dfg_custom_thumbIndexFont_tl}
  % all for the gantt chart
  \colorlet{color@gantt@default}{\l__dfg_custom_gantt_default_tl}
  \colorlet{color@gantt@alternative}{\l__dfg_custom_gantt_alternative_tl}
  \colorlet{color@gantt@frame}{\l__dfg_custom_gantt_frame_tl}
  \colorlet{color@gantt@crosshatch}{\l__dfg_custom_gantt_crosshatch_tl}
  \colorlet{color@gantt@important}{\l__dfg_custom_gantt_important_tl}
  \colorlet{color@gantt@stripe-one}{\l__dfg_custom_gantt_stripe_one_tl}
  \colorlet{color@gantt@stripe-two}{\l__dfg_custom_gantt_stripe_two_tl}

  % NOTE: The aliases below shadow LaTeX/xcolor standard colour names
  % (black, red, green). Any subsequently loaded package relying on the
  % standard red=RGB(255,0,0) will receive bordeaux-100 instead.
  % Consider using dfg-prefixed aliases if you load additional packages.
  \colorlet{black}{black-100}
  \colorlet{blue}{blue-100}
  \colorlet{blueLight}{blue-50}
  \colorlet{green}{green-100}
  \colorlet{greenLight}{green-50}
  \colorlet{red}{bordeaux-100}
  \colorlet{redLight}{bordeaux-50}
  \colorlet{grey}{black-50}
  \colorlet{greyLight}{black-10}

  \colorlet{projectA}{blue}
  \colorlet{projectB}{green}
  \colorlet{projectQ}{grey}
  \colorlet{error}{red}
  \colorlet{referencePI}{color@reference@boldAuthor}
  \colorlet{referenceWP}{color@reference@boldAuthor}
  \colorlet{referenceAim}{color@reference@boldAuthor}
  % Now closing the AtBeginDocument-part:
}
\AtBeginDocument{
  \bool_if:NTF \l__dfg_class_final_bool
  {
  	\colorlet{color@final@white-or-green}{white}
  	\bool_set_false:N \l__dfg_class_showmarginalia_bool
  	\bool_set_false:N \l__dfg_class_showtags_bool
    \bool_set_false:N \l__dfg_class_fastcompile_bool
    \bool_set_false:N \l__dfg_class_fastcompile_project_bool
    \bool_set_false:N \l__dfg_class_fastcompile_project_show_images_bool
    \bool_set_false:N \l__dfg_class_skipTENpublications_bool
    \bool_set_true:N \l__dfg_class_fastcompile_project_show_publications_bool
  	\selectcolormodel{cmyk}
  }
  {
  	\colorlet{color@final@white-or-green}{green}
  }
}
\RequirePackage{xspace}
\RequirePackage{etoolbox}

\RequirePackage{ragged2e}
\raggedbottom
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\RequirePackage{qrcode}
\RequirePackage{graphicx}
\RequirePackage{mwe}% provides the default example-image-a/b logo placeholders
\bool_if:NT \l__dfg_class_fastcompile_project_bool
{
  \bool_if:NTF \l__dfg_class_fastcompile_project_show_images_bool
    { \setkeys{Gin}{draft=false} }
    { \setkeys{Gin}{draft=true} }
}
\graphicspath{
  {figures/}
  {img/}
}
\RequirePackage{fontspec}
\AtBeginDocument{
  \setmainfont{\tl_use:N \l__dfg_custom_font_tl}[
  	\tl_use:N \l__dfg_custom_fontspec_tl
  ]
  \setsansfont{\tl_use:N \l__dfg_custom_sansfont_tl}[
  	\tl_use:N \l__dfg_custom_sansfontspec_tl
  ]
}

\RequirePackage{fontawesome5}
\RequirePackage{microtype}
\RequirePackage{enumitem}
\newcommand{\dfgArrowHead}{\faCaretRight}
\newcommand{\dfgBulletPoint}{\faCaretRight}
\newcommand{\dfgTargetPoint}{\faBullseye}
\newcommand{\dfgDefaultPoint}{\faCaretRight}
\setlist[enumerate]{nosep}
\setlist[description]{
  %leftmargin=*,
  leftmargin=*
}
\setlist[itemize]{
  nosep,
  label={\textcolor{color@item@i}{\dfgDefaultPoint}},
}
\newlist{contractinformation}{itemize}{2}
\setlist[contractinformation,1]{
  nosep,
  leftmargin=*,
  label={\textcolor{color@item@i}{\dfgBulletPoint}},
}
\setlist[contractinformation,2]{
  nosep,
  leftmargin=*,
  label={\textcolor{color@item@i}{\dfgDefaultPoint}},
}
\newlist{workpackages}{enumerate}{3}
\setlist[workpackages,1]{
  % wide=\parindent,
  leftmargin=0cm,
  labelindent=*,
  % leftmargin=*,
  % labelindent=-3em,
  % font=\normalfont,
  % first=\bfseries,
  topsep=3pt,
  font=\bfseries,
  % nosep,
  label={WP\,\arabic*:},
  ref = {\arabic*},
  resume
}

\setlist[workpackages,2]{
  ref={\theworkpackagesi\alph*},
  %wide=\parindent,
  leftmargin=0cm,
  labelindent=*,
  % font=\normalfont,
  % first=\bfseries,
  topsep=0pt,
  font=\bfseries,
  % nosep,
  label={WP\,\theworkpackagesi\alph*:}
}

\newlist{bylaws}{enumerate}{3}
\setlist[bylaws]{leftmargin=*}
\setlist[bylaws,1]{
  font=\bfseries,
  first=\bfseries,
  % after=\normalfont,
  label={§\arabic*},
  % itemsep=.5\baselineskip,
  nosep
}
\setlist[bylaws,2]{
  first=\normalfont,
  label={\thebylawsi.\arabic*},
  labelindent=0em,
}
\newcommand{\addAim}[1]{\item\label{\l__tmp_current_project_tl-aim-#1}}
\newlist{aims}{enumerate}{1}
\setlist[aims,1]{
  before={\begin{dfgBoxEnv}%
  		[%watermark text={Aims in }
  		]
  		\colorlet{referencePI}{tableHeadingsFont}
  		\colorlet{referenceWP}{tableHeadingsFont}
  		\colorlet{referenceAim}{tableHeadingsFont}},
  after={\end{dfgBoxEnv}},
  wide=\parindent,
  % font=\normalfont,
  % first=\bfseries,
  topsep=3pt,
  font=\bfseries,
  % nosep,
  label={Aim~ \arabic*:},
  ref = {\arabic*},
  %  resume
}
\RequirePackage[
  %headsepline=.5pt,
  markcase=noupper,
  %footsepline,
  autooneside=false, % use left and right marks with a onesided document
  %automark, % set \ leftmark and \ rightmark automatically by \ section and \ subsection
  draft=false,
]{scrlayer-scrpage}
\clearmainofpairofpagestyles
\pagestyle{scrheadings}
\setlength{\footheight}{17.5264pt}
\renewcommand{\chaptermarkformat}{}
\renewcommand{\sectionmarkformat}{}
\ofoot*{\pagemark}%Clear the outer foot
\ifoot*{\crcLogo[height=0.5cm]}%pagemark in the center only on plain pages
\addtokomafont{pagehead}{\normalfont\sffamily}
\addtokomafont{pagefoot}{\bfseries}
\bool_if:NT \l__dfg_class_fastcompile_project_bool
{
  \AddToHook{shipout/background}[dfg/fastcompile-project-watermark]
  {
    \put(0.5\paperwidth,-0.5\paperheight)
    {
      \makebox(0,0)
      {
        \rotatebox{45}
        {
          \textcolor{black!7}
          {
            \sffamily\bfseries\fontsize{42}{50}\selectfont
            FAST~COMPILE~-~DRAFT
          }
        }
      }
    }
  }
}
\deffootnote{0em}{0em}{\thefootnotemark\hskip .5em}
\renewcommand{\footnoterule}{%
  % \kern -4.5pt
  % \hrule width \textwidth height 0.5pt
  % \kern 4pt
}
\setkomafont{title}{\Huge\bfseries}
\setkomafont{disposition}{\normalfont\sffamily\bfseries}
\setkomafont{descriptionlabel}{\normalfont\bfseries}
\setkomafont{chapter}{\fontsize{20}{10}\selectfont\bfseries}
\setkomafont{section}{\fontsize{12}{10}\selectfont\bfseries}
\setkomafont{subsection}{\fontsize{12}{10}\selectfont}
\setkomafont{subsubsection}{\fontsize{12}{10}\selectfont}
\setkomafont{footnotenumber}{\normalfont\sffamily}
\setkomafont{pageheadfoot}{\normalfont\footnotesize\sffamily}
\addtokomafont{chapterentry}{\normalfont}
\RedeclareSectionCommands[
  font=\usekomafont{subsection},
  % beforeskip=1pt,
  % afterskip=.5pt
]{subsubsection}

\RedeclareSectionCommands[
  tocraggedpagenumber,
  toclinefill=\tocpageseparator,
  tocindent=0em,
  tocnumwidth=4em,
  tocpagenumberbox=\tocpagenumberbox,% <- added
  % tocpagenumberformat=\textsf,
  beforeskip= 0ex,
  afterskip= 0.01ex
]{section,subsection,subsubsection}

\RedeclareSectionCommands[
  tocbeforeskip=2ex,
  tocentryformat=\bfseries\large,
]{section}

\newcommand\tocgobble[1]{}% <- added
\newcommand\tocpageseparator{\normalsize\bfseries\,\mbox{\color{\l__dfg_custom_tableLines_tl}---}\,}
\newcommand\tocpagenumberbox[1]{\mbox{#1}}% <- added
\RedeclareSectionCommands[
  tocraggedpagenumber,
  toclinefill           =\tocgobble,
  tocindent             =0em,
  tocnumwidth           =4em,
  tocpagenumberbox      =\tocgobble,% <- added
  % tocpagenumberformat =\textsf,
  beforeskip            = 0ex,
  afterskip             =0.1ex,
  tocentryformat        =\bfseries\Large\sffamily,
]{chapter}
\setcounter{secnumdepth}{\subsectiontocdepth}
\setcounter{tocdepth}{\subsectiontocdepth}
\RequirePackage{pifont}
\RequirePackage{academicons}

\providecommand{\theORCiDValue}{}

\NewDocumentCommand{\orcidIcon}{}
{{\sffamily\textcolor{orcid}{\aiOrcid}}}

\NewDocumentCommand{\getORCiDvalue}{O{person} m}
{%
  % #1: Datenbank, default ist person
  % #2: id der Person
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  { \cs_set:Npn \theORCiDValue { } }
  { \DTLgetvalueforkey{\theORCiDValue}{orcid}{#1}{id}{#2} }%
}

\NewDocumentCommand{\formatORCiD}{O{person} m}
{%
  % #1: Datenbank (für Warnungen / Tag-Overlay)
  % #2: id der Person (für Warnungen / Tag-Overlay)
  \DTLifnullorempty{\theORCiDValue}
  {%
  	\bool_if:NF \lTblrMeasuringBool
  	{ \msg_warning:nnee {dfg}{missing-orcid}{#1}{#2} }%
  	\mbox{~} % if no orcid present
  }
  {%
  	\orcidIcon\,%
  	\dfgShowTag{#2}{orcid}
  	{\href{https://orcid.org/\theORCiDValue}{\theORCiDValue}}[#1]%
  }%
}

\NewDocumentCommand{\getORCiD}{O{person} m}
{%
  % #1: Datenbank, default ist person
  % #2: id der Person
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
    \getORCiDvalue[#1]{#2}%
    \formatORCiD[#1]{#2}%
  }
}

\NewDocumentCommand{\ORCiD}{m}
{(\raisebox{-1pt}{\orcidIcon}\,\href{https://orcid.org/#1}{#1})}
\PassOptionsToPackage{
  mode =  match,
  propagate-math-font = true,
  % reset-math-version  = false,
  % reset-text-family   = false,
  % reset-text-series   = false,
  % reset-text-shape    = false,
  text-family-to-math = true,
  text-series-to-math = true,
  tight-spacing       = true,
  group-minimum-digits  = 4, % --> 1.234 instead of 1234
  group-separator        = {,},% for "12.345" instead of "12 345" %
  table-format = 6,
  table-alignment-mode  = format,
  table-auto-round     = true,
  drop-zero-decimal    = true,
  locale                =UK,
  input-decimal-markers = {.},
  output-decimal-marker = {.},
  input-ignore={,},
  parse-numbers = true
}{siunitx}
\RequirePackage{tabularray}
\UseTblrLibrary{booktabs}
\UseTblrLibrary{diagbox}
\UseTblrLibrary{siunitx}
\UseTblrLibrary{counter}
\UseTblrLibrary{functional}
\bool_new:N \g__dfg_tblr_inside_bool
\AddToHook{env/tblr/begin}{\bool_set_true:N \g__dfg_tblr_inside_bool}
\AddToHook{env/tblr/end}{\bool_set_false:N \g__dfg_tblr_inside_bool}
\SetTblrOuter[tblr]{label=none,entry=none}
\cs_new_protected:Npn \mytblr_basecode: {
  % Continuous head/footer templates (use ~ for spaces)
  \DeclareTblrTemplate {conthead-text}{default}{%
  	\normalfont\color{tableContFootHead}%
  	\sffamily\footnotesize%
  	\ldots~continuing~from~previous~page.%
  }
  \DeclareTblrTemplate {contfoot-text}{default}{%
  	\normalfont\color{tableContFootHead}%
  	\sffamily\footnotesize%
  	Continue~on~the~following~page~\ldots%
  }
  % Caption continuation uses conthead
  \DeclareTblrTemplate {capcont}{default}{%
  	\UseTblrTemplate{conthead-text}{default}%
  }
  % Left-align tables
  \RenewDocumentCommand \TblrAlignLeft {} {\RaggedRight}%
  % Common outer settings
}
\NewTblrTheme{plain}{
  \mytblr_basecode:
  % plain-only inner tweaks:
  \SetTblrInner{
  	rows         = {font=\footnotesize},
    % Keep row metrics independent of descenders such as p, q, f.
    stretch   = 1,
    rowsep    = .667pt,
  	row{even}={bg=tableRows},
  	width=\linewidth,
  	hline{1,Z}={1pt,fg=tableOuterLines},
  }
}
\RenewDocumentCommand\TblrAlignLeft{}{\RaggedRight}
\NewTblrTheme{main}{
  \mytblr_basecode:
  % main-only styles & inner grid:
  \SetTblrStyle{caption-tag}{font=\bfseries\footnotesize\sffamily,tableCaption}
  \SetTblrStyle{caption-text}{tableCaption,\footnotesize}
  \SetTblrInner{%
  	row{odd}={bg=tableRows},
  	width=\linewidth,
  	hline{1,Z}={1pt,fg=tableOuterLines},
  	rowhead      = 1,
  	rows         = {font=\footnotesize},
  	width        = \textwidth,
  	hline{1,Z}   = {
  		1pt,
  		fg =tableOuterLines
  	},
  	hline{2} = {1pt, fg=tableOuterLines}, % midrule
    % Keep row metrics independent of descenders such as p, q, f.
    stretch   = .8,
    rowsep    = .500pt,
  	row{1}       = {
  		bg       = tableHeadingsBG,
  		fg       = tableHeadingsFont,
  		font     = \footnotesize\bfseries,
  		halign   = {c},
  		valign   = {t},
  		guard
  	},
  }%
  % \SetTblrInner{
  %   rows={ht=.5\baselineskip},
  %   rowsep       = 0pt,
  % }
}
\NewTblrTheme{requestedFundingStaff}{
  \mytblr_basecode:
  \SetTblrStyle{caption-tag}{font=\bfseries\footnotesize\sffamily,tableCaption}
  \SetTblrStyle{caption-text}{tableCaption,\footnotesize}
}
\NewDocumentEnvironment{TableEnv}{ m o m m }
{
  % #1: colspec
  % #2: further options
  % #3: caption
  % #4: label
  \vspace*{-1.5\baselineskip}%
  \DefTblrTemplate{firsthead}{default}%
  {\addtocounter{table}{-1}%
  	\captionof{table}[\InsertTblrText{entry}]%
  	{\InsertTblrText{caption}\vspace*{-2em}}}%
  \begin{tblr}[%
  	%  expand=\tblrbody,
  	theme=main,
  	label  ={#4},
  	caption={#3},
  	long
  ]{%
  	colspec ={#1},
  	row{2-Z}={font=\RaggedRight},
  	rowhead = 1, %<- first row is head
  	#2 %<- in case we need further adjustments
  }
}
{\end{tblr}}
\NewDocumentEnvironment{FundingDirectCostsTable}{O{}}
{\textbf{\sffamily#1}\\
  % \nobreak\mbox{~}\\\vspace{-3.25em}\nobreak
  \begin{tblr}[%
  	theme=plain, label=none, entry=none]{
  	rows={font=\footnotesize},
  	colspec={
  			X[t]
  			t{.5cm,halign={right}}
			Q[t,si={table-format=9}]
  		},
  }
}
{\end{tblr}}

\RequirePackage{caption}
\captionsetup{%
  % format=llapx,
  hypcap=false,
  format=plain,
  singlelinecheck=off,
  labelsep={colon}, % saving space
  %justification=RaggedRight,
  font={small,sf},
  labelfont={
  		sf,
  		bf, % bold face
  	}
}
\RequirePackage{pgfgantt}
\RequirePackage{placeins}
\RequirePackage{hvfloat} % load after tabularray!!
\hvFloatSet{capPos=bottom,capVPos=top,floatPos=!hb}% this are the default values.
\RequirePackage{marginalia}
\marginaliasetup{
  xsep=0pt,
  width=15mm,
  style=\raggedleft\footnotesize,
  pos=auto,
}
\bool_if:NTF \l__dfg_class_cv_bool
  {
    \tl_set_eq:NN \l__dfg_custom_biblatexstyle_active_tl
      \l__dfg_custom_biblatexstyle_cv_tl
    \tl_set_eq:NN \l__dfg_custom_biblatexfeatures_active_tl
      \l__dfg_custom_biblatexfeatures_cv_tl
  }
  {
    \tl_set_eq:NN \l__dfg_custom_biblatexstyle_active_tl
      \l__dfg_custom_biblatexstyle_proposal_tl
    \tl_set_eq:NN \l__dfg_custom_biblatexfeatures_active_tl
      \l__dfg_custom_biblatexfeatures_proposal_tl
  }
\RequirePackage[
  backend=biber,
  % using the most common style and also saving space.
  % style=ext-numeric, % taken from biblatex-ext
  % just in case we want to switch the style.
  % style=ext-alphabetic,
  %style=ext-authornumber-ecomp,
  style=\l__dfg_custom_biblatexstyle_active_tl,
  %introcite=label,
  autocite=inline,
  defernumbers=true, % reset numbered bibliography for each chapter
  giveninits=true, % abbreviate the first names
  maxcitenames=1,
  mincitenames=1,
  maxbibnames=99, % show up to 6 authors of an bib entry (et al. thereafter)
  %nohashothers=true,
  %uniquelist=true,
  %uniquename=allfull,
  %labeldatepartes=true
  \l__dfg_custom_biblatexfeatures_active_tl
]{biblatex}
\cs_new_protected:Npn \__dfg_biblatex_oa_load_without_api:
  {
    \RequirePackage[
      doiapi=false,
      symbolpackage=tikz,
      symbol=oanet]{biblatex-ext-oa}
  }

\bool_if:NT \l__dfg_class_final_bool
  {
    \tl_if_blank:VTF \l__dfg_custom_doi_api_mail_tl
      {
        \msg_info:nn { dfg } { biblatex-ext-oa-doiapi-email-missing }
        \__dfg_biblatex_oa_load_without_api:
      }
      {
        \str_set:Nx \l_tmpa_str
          {
            \directlua
              {if(pcall(require,"socket.http"))then;tex.sprint("true");else;tex.sprint("false");end}
          }
        \str_if_eq:VnTF \l_tmpa_str { true }
          {
            \RequirePackage[
              doiapi=true,
              symbolpackage=tikz,
              symbol=oanet]{biblatex-ext-oa}
            \ExecuteBibliographyOptions{openaccess=doiapi}
            \exp_args:NV \SetDOIAPIMail \l__dfg_custom_doi_api_mail_tl
          }
          {
            \msg_warning:nn { dfg } { biblatex-ext-oa-doiapi-unavailable }
            \__dfg_biblatex_oa_load_without_api:
          }
      }
  }
\renewcommand*{\bibfont}{\small}
\bool_if:nTF
  {
    \l__dfg_class_fastcompile_project_bool
    && ! \l__dfg_class_fastcompile_project_show_publications_bool
  }
  {
    % Do not register bibliography data sources or parse a stale full-build
    % .bbl.  Keep biblatex's ordinary initialisation and refsection setup, but
    % replace its data-file stage with the minimum empty-section state.
    \cs_set_protected:Npn \blx@bblfile
      {
        \blx@secinit
        \blx@generate@bbl@mdfivesum@notfound
        \global\togglefalse{blx@bbldone}
        \csnumgdef{blx@labelnumber@\the\c@refsection}{0}
      }
    \NewDocumentCommand{\dfgFastCitation}{m}
      { {\color{black-50}\scriptsize\ttfamily [#1]} }
    \RenewDocumentCommand{\autocite}{s o o m}
      { \dfgFastCitation{#4} }
    \RenewDocumentCommand{\cite}{s o o m}
      { \dfgFastCitation{#4} }
    \RenewDocumentCommand{\parencite}{s o o m}
      { \dfgFastCitation{#4} }
    \RenewDocumentCommand{\textcite}{s o o m}
      { \dfgFastCitation{#4} }
    \RenewDocumentCommand{\footcite}{s o o m}
      { \dfgFastCitation{#4} }
    \RenewDocumentCommand{\smartcite}{s o o m}
      { \dfgFastCitation{#4} }
    \RenewDocumentCommand{\nocite}{m} { }
    % Ignore citation requests restored from auxiliary files produced by a full
    % proposal build.  The fast source commands above do not write replacements.
    \cs_set_protected:Npn \abx@aux@cite   #1#2   { }
    \cs_set_protected:Npn \abx@aux@segm   #1#2#3 { }
    \cs_set_protected:Npn \abx@aux@nocite #1#2   { }
    % This mode deliberately has no bibliography work, so do not advertise a
    % biber rerun in the end-of-document logreq record.
    \AtEndDocument
    {
      \global\let\blx@rerun@biber\relax
      \global\togglefalse{blx@runbiber}
    }
  }
  {
    \addbibresource{bib/dfg-base.bib}
    % The conversion workflow stores bibliography entries that still need
    % review separately.  Load that file when present without requiring it for
    % normal template installations.
    \IfFileExists{bib/conversion-missing.bib}
      {\addbibresource{bib/conversion-missing.bib}}
      {}
    \addbibresource{bib/dfg-strings.bib}
  }
\AtEveryBibitem{
  \clearfield{url}
  \clearfield{month}
  \clearfield{note}
  \clearfield{issn}
  \clearfield{isbn}
  \clearlist{language}}
\newcommand{\addendumasterisk}{\ifbibliography{*}{}}
\newcommand{\addendumhashtag}{\ifbibliography{\textsuperscript{\#}{}}}
\renewcommand*{\mkbibnamefamily}[1]{%
  \ifitemannotation{equal} % first check for equal contribution
  {#1\addendumasterisk}% add a * for those authors
  {
  	% Then we check for "shared last authorship"
  	\ifitemannotation{sharedlast}%
  	{#1\addendumhashtag}% adding a symbol
  	{#1}% do nothing for any one else.
  }}
\RequirePackage{csquotes}
\renewcommand{\mkccitation}[1]{ (#1)}
\RequirePackage{datatool}
\RequirePackage{tikz}
\ExplSyntaxOff
\usetikzlibrary{calc}
\usetikzlibrary{shapes.misc}
\usetikzlibrary{patterns,patterns.meta}
\ExplSyntaxOn
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\crefname{workpackagesi}{\bfseries\color{referenceWP}WP}{\bfseries\color{referenceWP}WPs}
\creflabelformat{workpackagesi}{\color{referenceWP}#2\color{referenceWP}\bfseries#1\color{referenceWP}#3}
\crefname{workpackagesii}{\bfseries\color{referenceWP}WP}{\bfseries\color{referenceWP}WPs}
\creflabelformat{workpackagesii}{\color{referenceWP}#2\bfseries\color{referenceWP}#1\color{referenceWP}#3}

\crefname{aimsi}{\bfseries\color{referenceAim}Aim}{\bfseries\color{referenceAim}Aims}
\creflabelformat{aimsi}{\color{referenceAim}#2\color{referenceAim}\bfseries#1\color{referenceAim}#3}

\clist_new:N \l__dfg_applicant_affiliation_id_clist
\seq_new:N \l__dfg_applicant_affiliation_name_seq
\seq_new:N \l__dfg_applicant_affiliation_location_seq
\seq_new:N \l__dfg_other_applicant_affiliation_name_seq
\tl_new:N \l__dfg_applicant_affiliation_name_tl
\tl_new:N \l__dfg_applicant_affiliation_location_tl

\cs_new_protected:Npn \__dfg_set_applicant_affiliation_metadata:
{
  \DTLifnullorempty{\theApplicantID}
    { \clist_clear:N \l__dfg_applicant_affiliation_id_clist }
    {
      \clist_set:Nx \l__dfg_applicant_affiliation_id_clist
        { \theApplicantID }
      \clist_remove_duplicates:N \l__dfg_applicant_affiliation_id_clist
    }
  \tl_set:Nx \l_tmpa_tl
    { \clist_use:Nn \l__dfg_applicant_affiliation_id_clist {,} }
  \cs_set:Npx \theApplicantID { \exp_not:V \l_tmpa_tl }
  \cs_set_eq:NN \theAffiliationValue \theApplicantID
  \seq_clear:N \l__dfg_applicant_affiliation_name_seq
  \seq_clear:N \l__dfg_applicant_affiliation_location_seq
  \clist_map_inline:Nn \l__dfg_applicant_affiliation_id_clist
  {
    \DTLifdbexists{affiliation}
    {
      \DTLgetvalueforkey{\l__dfg_applicant_affiliation_name_tl}
        {name}{affiliation}{id}{##1}
      \DTLgetvalueforkey{\l__dfg_applicant_affiliation_location_tl}
        {location}{affiliation}{id}{##1}
    }
    {
      \tl_set:Nn \l__dfg_applicant_affiliation_name_tl {##1}
      \tl_clear:N \l__dfg_applicant_affiliation_location_tl
    }
    \DTLifnullorempty{\l__dfg_applicant_affiliation_name_tl}
      { \tl_set:Nn \l__dfg_applicant_affiliation_name_tl {##1} }
      { }
    \tl_set:Ne \l_tmpb_tl
    {
      \exp_not:N \dfgShowTag{##1}{name}
        {\exp_not:V \l__dfg_applicant_affiliation_name_tl}[affiliation]
    }
    \seq_put_right:NV \l__dfg_applicant_affiliation_name_seq \l_tmpb_tl
    \DTLifnullorempty{\l__dfg_applicant_affiliation_location_tl}
      { }
      {
        \seq_if_in:NVF \l__dfg_applicant_affiliation_location_seq
          \l__dfg_applicant_affiliation_location_tl
        {
          \tl_set:Ne \l_tmpb_tl
          {
            \exp_not:N \dfgShowTag{##1}{location}
              {\exp_not:V \l__dfg_applicant_affiliation_location_tl}
              [affiliation]
          }
          \seq_put_right:NV \l__dfg_applicant_affiliation_location_seq
            \l_tmpb_tl
        }
      }
  }
  \cs_set:Npn \theCRCaffiliation
  {
    \seq_use:Nnnn \l__dfg_applicant_affiliation_name_seq
      {~and~} {,~} {,~and~}
  }
  \cs_set:Npn \theCRCaffiliationLocation
  {
    \seq_use:Nnnn \l__dfg_applicant_affiliation_location_seq
      {~and~} {,~} {,~and~}
  }
  \seq_set_eq:NN \l__dfg_other_applicant_affiliation_name_seq
    \l__dfg_applicant_affiliation_name_seq
  \seq_pop_left:NNF \l__dfg_other_applicant_affiliation_name_seq \l_tmpa_tl
    { \tl_clear:N \l_tmpa_tl }
  \cs_set:Npn \theCRCCoordinatingAffiliation
    { \seq_item:Nn \l__dfg_applicant_affiliation_name_seq {1} }
  \cs_set:Npn \theCRCOtherApplicantAffiliations
  {
    \seq_use:Nnnn \l__dfg_other_applicant_affiliation_name_seq
      {~and~} {,~} {,~and~}
  }
}

\NewExpandableDocumentCommand{\dfgApplicantAffiliationsTF}{m m}
{
  \int_compare:nNnTF
    { \clist_count:N \l__dfg_applicant_affiliation_id_clist } > {1}
    {#2}
    {#1}
}

\NewExpandableDocumentCommand{\dfgOtherApplicantAffiliationsTF}{m m}
{
  \int_compare:nNnTF
    { \clist_count:N \l__dfg_applicant_affiliation_id_clist } > {2}
    {#2}
    {#1}
}

\NewDocumentCommand{\dfgCRCName}{}
  { \dfgShowTag{crc}{name}{\theCRCname}[meta] }
\NewDocumentCommand{\dfgCRCNameAddon}{}
  { \dfgShowTag{crc}{nameAddon}{\theCRCnameAddon}[meta] }
\NewDocumentCommand{\dfgCRCNumber}{}
  { \dfgShowTag{crc}{number}{\theCRCnumber}[meta] }
\NewDocumentCommand{\dfgFundingPeriodText}{}
  { \dfgShowTag{crc}{fundingPeriodText}{\theFundingPeriodText}[meta] }
\NewDocumentCommand{\dfgFundingPeriodNumeral}{}
  { \dfgShowTag{crc}{fundingPeriodNumeral}{\theFundingPeriodNumeral}[meta] }
\NewDocumentCommand{\dfgFundingYear}{m}
{
  \dfgShowTag{crc}{fundingYear#1}
  {
    \int_case:nnF {#1}
    {
      {1}{\tmpYearOne}
      {2}{\tmpYearTwo}
      {3}{\tmpYearThree}
      {4}{\tmpYearFour}
      {5}{\tmpYearFive}
    }
    {#1}
  }[meta]
}
\NewDocumentCommand{\dfgFundingYearPrevious}{m}
{
  \dfgShowTag{crc}{fundingYearPrevious#1}
  {
    \int_case:nnF {#1}
    {
      {1}{\tmpYearPreviousOne}
      {2}{\tmpYearPreviousTwo}
      {3}{\tmpYearPreviousThree}
      {4}{\tmpYearPreviousFour}
      {5}{\tmpYearPreviousFive}
    }
    {#1}
  }[meta]
}

\AfterEndPreamble{
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  {
    \clist_clear:N \l__dfg_applicant_affiliation_id_clist
    \cs_set:Npn \theApplicantID                  { }
    \cs_set:Npn \theCRCname                      { CRC~project~draft }
    \cs_set:Npn \theCRCnameAddon                 { }
    \cs_set:Npn \theCRCnumber                    { draft }
    \cs_set:Npn \theFundingPeriodNumeral         { 1 }
    \cs_set:Npn \theFundingPeriodText            { draft }
    \cs_set:Npn \theAffiliationValue             { }
    \cs_set:Npn \theCRCaffiliation               { }
    \cs_set:Npn \theCRCaffiliationLocation       { }
    \cs_set:Npn \theCRCCoordinatingAffiliation   { }
    \cs_set:Npn \theCRCOtherApplicantAffiliations{ }
    \cs_set:Npn \tmpYearOne                      { Year~1 }
    \cs_set:Npn \tmpYearTwo                      { Year~2 }
    \cs_set:Npn \tmpYearThree                    { Year~3 }
    \cs_set:Npn \tmpYearFour                     { Year~4 }
    \cs_set:Npn \tmpYearFive                     { Year~5 }
    \cs_set:Npn \tmpYearPreviousOne              { Previous~year~1 }
    \cs_set:Npn \tmpYearPreviousTwo              { Previous~year~2 }
    \cs_set:Npn \tmpYearPreviousThree            { Previous~year~3 }
    \cs_set:Npn \tmpYearPreviousFour             { Previous~year~4 }
    \cs_set:Npn \tmpYearPreviousFive             { Previous~year~5 }
  }
  {
  \DTLgetvalueforkey{\theApplicantID}{ref-affiliation-id}{meta}{id}{crc}
  \DTLgetvalueforkey{\theCRCname}{name}{meta}{id}{crc}% getting Title of CRC
  \DTLgetvalueforkey{\theCRCnameAddon}{nameAddon}{meta}{id}{crc}% getting name addon of CRC
  \DTLgetvalueforkey{\theCRCnumber}{number}{meta}{id}{crc}% getting number of CRC
  \DTLgetvalueforkey{\theFundingPeriodNumeral}{fundingPeriodNumeral}{meta}{id}{crc}% getting period of CRC
  \DTLgetvalueforkey{\theFundingPeriodText}{fundingPeriodText}{meta}{id}{crc}% getting period of CRC
  \__dfg_set_applicant_affiliation_metadata:
  \DTLgetvalueforkey{\tmpYearOne}  {fundingYear1}{meta}{id}{crc}%
  \DTLgetvalueforkey{\tmpYearTwo}  {fundingYear2}{meta}{id}{crc}%
  \DTLgetvalueforkey{\tmpYearThree}{fundingYear3}{meta}{id}{crc}%
  \DTLgetvalueforkey{\tmpYearFour} {fundingYear4}{meta}{id}{crc}%
  \DTLgetvalueforkey{\tmpYearFive} {fundingYear5}{meta}{id}{crc}%

  \DTLgetvalueforkey{\tmpYearPreviousOne}  {fundingYearPrevious1}{meta}{id}{crc}%
  \DTLgetvalueforkey{\tmpYearPreviousTwo}  {fundingYearPrevious2}{meta}{id}{crc}%
  \DTLgetvalueforkey{\tmpYearPreviousThree}{fundingYearPrevious3}{meta}{id}{crc}%
  \DTLgetvalueforkey{\tmpYearPreviousFour} {fundingYearPrevious4}{meta}{id}{crc}%
  \DTLgetvalueforkey{\tmpYearPreviousFive} {fundingYearPrevious5}{meta}{id}{crc}%
  }

  \providecommand{\thisCRC}
    {CRC\,\texorpdfstring
      {\dfgShowTag{crc}{number}{\theCRCnumber}[meta]}
      {\theCRCnumber}\xspace}
  % Shared implementation for the user-level \CRC and \TRR commands.
  % #1 is the star boolean, #2 the optional title, #3 the printed programme
  % type, and #4 the CRC/TRR number to print and compare with the current CRC.
  % Current CRCs use \thisCRC in the unstarred form; starred current references
  % include the CRC title from the metadata unless an explicit title is given.
  % External CRCs/TRRs always print the requested number and add the optional
  % title when one is supplied.
\cs_new_protected:Npn \__dfg_crc_print:nnnn #1 #2 #3 #4
  {
    \tl_if_eq:VnTF \theCRCnumber {#4}
      {
        \IfBooleanTF{#1}
          {
            #3\,#4
            \IfValueTF{#2}
              { \ \textit{#2} }
              { \ \textit{\dfgShowTag{crc}{name}{\theCRCname}[meta]} }
          }
          {
            \thisCRC
            \IfValueT{#2}
              { \ \textit{#2} }
          }
      }
      {
        #3\,#4
        \IfValueT{#2}
          { \ \textit{#2} }
      }
  }

  % User-level wrappers around \__dfg_crc_print:nnnn. They differ only in the
  % printed programme type.
\NewDocumentCommand{\CRC}{s o m}
  {
    \__dfg_crc_print:nnnn {#1} {#2} {CRC} {#3}
  }

\NewDocumentCommand{\TRR}{s o m}
  {
    \__dfg_crc_print:nnnn {#1} {#2} {CRC/TRR} {#3}
  }
 %\DTLgetvalueforkey{\theNameSpokespersonPosition}{position}{VIP}{specialRole}{spokesperson}% getting Title of Spokesperson
  %\DTLgetvalueforkey{\theNameSpokespersonName}{name}{VIP}{specialRole}{spokesperson}% getting Title of CRC
  %\DTLgetvalueforkey{\theNameSpokespersonNameFirst}{nameFirst}{VIP}{specialRole}{spokesperson}% getting Title of CRC
  \newcommand{\theFundingPeriodNumeralPrevious}{%
  	\number\numexpr\theFundingPeriodNumeral-1\relax%
  }
  % hyperref options
  \hypersetup{          % setup the hyperref-package options
  	% unicode      = true,
  	pdftitle     = {\theCRCname.\space\theCRCnameAddon},  %   - title (PDF meta)
  	pdfsubject   = {\crc},%   - subject (PDF meta)
  	pdfauthor    = {CRC\,\theCRCnumber~ \theCRCname},  %   - author (PDF meta)
  	%   pdfauthortitle = {\theNameSpokespersonPosition},
  	%   pdfcopyright = {Copyright (c) \thisCRC All rights reserved.},
  	pdfhighlight = /N,
  	pdfdisplaydoctitle = true,
  	pdflang     = {en},
  	%   pdfcaptionwriter = {\theNameSpokespersonNameFirst \theNameSpokespersonName},
  	% pdfencoding = auto,
  	pdfproducer = {LuaLaTeX},
  	% pdflicenseurl = {http://creativecommons.org/licenses/by-nc-nd/4.0/},
  	% plainpages  = false,      %   -
  	colorlinks  = true, % -Colours links instead of ugly boxes
  	urlcolor    = blue, %Colour for external hyperlinks
  	linkcolor   = black,%rwthBlue, %Colour of internal links
  	citecolor   = black, %Colour of citations
  	% linkbordercolor=rwthRed,
  	linktoc     = page,
  	pdfborder   = {0 0 0},      %   -
  	breaklinks  = true,      %   - allow line break inside links
  	bookmarksnumbered  = true,    %
  	bookmarksopenlevel = 1,
  	bookmarksopen      = true,    %
  	bookmarksdepth     = 3,
  	%  final       = true,  % = true, nur bei web-Dokument!! (wichtig!!)
  	%  hypertexnames = false,
  	%  pageanchor=false,
  	%https://tex.stackexchange.com/questions/623377/how-to-increase-the-setting-dest-names-size-using-lualatex-on-tl-2021
  }
}
\int_new:N \l_thumb_index_int
\int_zero:N \l_thumb_index_int
\dim_new:N \l_thumb_height_dim
\cs_new_protected:Npn \thumb_compute_height:
{
  %   (\paperheight - top - bottom) / pattern
  \dim_set:Nn \l_thumb_height_dim
  {
  	( \paperheight
  	- \l__dfg_custom_thumbindex_topmargin_dim
  	- \l__dfg_custom_thumbindex_bottommargin_dim )
  	/ \l__dfg_custom_thumbindexpattern_int
  }
}
\thumb_compute_height:
\tikzset
{
  thumb/.style=
  	{
  		fill   = thumbIndexBG ,      % colour may be changed later
  		text   = thumbIndexFont,
  		minimum~ height = \dim_use:N \l_thumb_height_dim,
  		text~ width     = \dim_use:N \l__dfg_custom_thumbindex_width_dim,
  		outer~ xsep      = 0em,
  		font            = \tl_use:N \l__dfg_custom_thumbindex_font_tl,
  		inner~ xsep     = 2em,
  	}
}
\cs_new_protected:Npn \thumb_place_node:nnn #1#2#3
{
  %  #1 = west|east    (anchor direction)
  %  #2 = left|right   (text alignment)
  %  #3 = node contents
  \begin{tikzpicture}[remember~ picture,overlay]
  	\node[
  		thumb,
  		align   =#2,
  		anchor  =#1,
  		rounded~ rectangle,
  		rounded~ rectangle~ #1~ arc=0pt
  	]
  	% ---------------------------------------------------------
  	%   absolute position = (current page.north <west/east>) –
  	%                       (0 , vertical offset)
  	%   The whole thing must be inside $ … $.
  	% ---------------------------------------------------------
  	at
  	($ (current~page.north~ #1)~ -~
  		(0,\dim_eval:n{
  			\l__dfg_custom_thumbindex_topmargin_dim
  			+ \l_thumb_height_dim * (\l_thumb_index_int - 1)
  		}) $)
  	{#3};
  \end{tikzpicture}
}

\NewDocumentCommand{\evenpageletterthumb}{m}
{ \thumb_place_node:nnn {west}{left}{#1} }
\NewDocumentCommand{\oddpageletterthumb}{m}
{ \thumb_place_node:nnn {east}{right}{#1} }
\NewDocumentCommand{\printThumbIndex}{ O{thumbIndexBG} m }
{
  %   #1 (optional) – colour definition used when no project is given
  %   #2 (mandatory) – the letter (or any material) to be printed

  \bool_if:NT \l__dfg_custom_thumbindex_bool
  {
  	\colorlet{thumbIndexBG}{#1}

  	% ---- reset index if we have reached the bottom of the column -----
  	\int_compare:nNnT { \l_thumb_index_int } = { \l__dfg_custom_thumbindexpattern_int }
  	{ \int_zero:N \l_thumb_index_int }

  	% ---- step to the *next* position -----------------------------------
  	\int_incr:N \l_thumb_index_int

  	% ---- actually place the thumb on the current page ------------------
  	%   (the same node is put into both the header and the foot, so it
  	%   appears on the page no matter which page‑style you use)
  	\lehead[\evenpageletterthumb{#2}]{\evenpageletterthumb{#2}}
  	\lohead[\oddpageletterthumb{#2}]{\oddpageletterthumb{#2}}
  }
}
\NewDocumentCommand{\printThumbIndexOff}{}
{
  \lehead[]{}
  \lohead[]{}
}
\int_new:N  \g__dfg_boldnames_int
\iow_new:N  \g__dfg_boldnames_iow
\prop_new:N \g__dfg_boldnames_hashes_prop
\tl_new:N   \l__dfg_boldnames_name_tl

\bool_if:NT \l__dfg_custom_emphasize_authors_bool
{
  % ---------- Auxiliary .bib file -----------------------------------

  \tl_const:Nn \c__dfg_boldnames_bibfile_tl { bib/\jobname-boldAuthors.bib }
  \iow_open:Nn \g__dfg_boldnames_iow { \c__dfg_boldnames_bibfile_tl }
  \iow_now:Nn  \g__dfg_boldnames_iow { @comment{Auto-generated~file} }
  \AtEndDocument { \iow_close:N \g__dfg_boldnames_iow }
  \addbibresource{\c__dfg_boldnames_bibfile_tl}

  % ---------- Writing a single name ---------------------------------
  %
  % We need:
  %   - the entry KEY  (nhblx@name@<N>)  fully expanded
  %   - the AUTHOR field written verbatim (so \"a etc. survive)
  %
  % \iow_now:Nn  → no expansion
  % \iow_now:Nx  → full expansion (breaks accents in names)
  % \iow_now:Nn + \exp_not:n on the name = best of both via \iow_now:Nx

  \cs_new_protected:Npn \__dfg_boldnames_write:n #1
  {
  	\int_gincr:N \g__dfg_boldnames_int
  	% Stash the name so it survives the x-expansion intact.
  	\tl_set:Nn \l__dfg_boldnames_name_tl { #1 }
  	\iow_now:Nx \g__dfg_boldnames_iow
  	{
  		@misc{nhblx@name@\int_use:N \g__dfg_boldnames_int,
  				author~=~{\exp_not:V \l__dfg_boldnames_name_tl},
  				options~=~{dataonly=true},
  			}
  	}
  	% Schedule hash extraction after biblatex has loaded the entry.
  	\exp_args:Nx \AfterPreamble
  	{
  		\exp_not:N \hbox_set:Nn \exp_not:N \l_tmpa_box
  		{ \exp_not:N \nhblx@getmethehash
  			{ nhblx@name@ \int_use:N \g__dfg_boldnames_int } }
  	}
  }

  % ---------- User-level commands -----------------------------------

  \NewDocumentCommand \addboldnames { m }
  { \clist_map_function:nN { #1 } \__dfg_boldnames_write:n }

  \NewDocumentCommand \resetboldnames { }
  { \prop_gclear:N \g__dfg_boldnames_hashes_prop }

  % ---------- biblatex glue -----------------------------------------

  \DeclareNameFormat{nhblx@hashextract}
  {
  	\prop_gput:Nen \g__dfg_boldnames_hashes_prop { \thefield{hash} } { }
  }

  \DeclareCiteCommand{\nhblx@getmethehash}
  {}{ \printnames[nhblx@hashextract][1-999]{author} }{}{}

  \cs_new_protected:Npn \__dfg_boldnames_mark:n #1
  {
  	\prop_if_in:NeTF \g__dfg_boldnames_hashes_prop { \thefield{hash} }
  	{ \mkbibbold { \textcolor{color@reference@boldAuthor} { #1 } } }
  	{ #1 }
  }

  \cs_set_eq:NN \mkboldifhashinlist \__dfg_boldnames_mark:n

  \DeclareNameWrapperFormat{boldifhashinlist}
  { \renewcommand*{\mkbibcompletename}{\mkboldifhashinlist} #1 }

  \DeclareNameWrapperAlias{sortname}{default}
  \DeclareNameWrapperAlias{default}{boldifhashinlist}
}

\providecommand { \addboldnames   } [1] { }
\providecommand { \resetboldnames }     { }
\tl_new:N \l__dfg_database_name_tl
\keys_define:nn { meta }{
  id              .code:n     =  \DTLnewdbentry{\l__dfg_database_name_tl}{id}{#1},
  id              .value_required:n = true,
  name      .code:n  = \DTLnewdbentry{\l__dfg_database_name_tl}{name}{#1},
  nameAddon .code:n  = \DTLnewdbentry{\l__dfg_database_name_tl}{nameAddon}{#1},
  number    .code:n  = \DTLnewdbentry{\l__dfg_database_name_tl}{number}{#1},
  fundingPeriodNumeral .choices:nn = { 1 , 2 , 3 }
  	{
  		% store the numeral itself
  		\DTLnewdbentry{\l__dfg_database_name_tl}{fundingPeriodNumeral}{#1}
  		% map numeral → text without a property list
  		\int_case:nnF {#1}
  		{
  			{ 1 } { \DTLnewdbentry{\l__dfg_database_name_tl}{fundingPeriodText}{first} }
  			{ 2 } { \DTLnewdbentry{\l__dfg_database_name_tl}{fundingPeriodText}{second} }
  			{ 3 } { \DTLnewdbentry{\l__dfg_database_name_tl}{fundingPeriodText}{third} }
  		}
  		{
  			% fallback (should not happen because of the .choices clause)
  			\msg_warning:nnnn { staff } { invalid-value }
  			{ #1 } { 1 , 2 , 3 }
  		}
  	} ,
  fundingPeriodNumeral / unknown .code:n =
  	{
  		\msg_warning:nnnn { staff } { invalid-value }
  		{ #1 } { 1 , 2 , 3 }
  	} ,
  fundedSince          .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{fundedSince}{#1},
  fundingYears .code:n =
  	{
  		\seq_set_from_clist:Nn \l_meta_funding_years_seq {#1}
  		%--- create the individual entries -----------------
  		\int_zero_new:N \l_tmpa_int
  		\seq_map_inline:Nn \l_meta_funding_years_seq
  		{
  			\int_incr:N \l_tmpa_int
  			\DTLnewdbentry
  			{\l__dfg_database_name_tl}
  			{fundingYear\int_use:N \l_tmpa_int}
  			{##1}
  		}
  	},
  fundingYearsPrevious .code:n =
  	{
  		\seq_set_from_clist:Nn \l_meta_funding_years_previous_seq {#1}

  		%--- create the individual entries -----------------
  		\int_zero_new:N \l_tmpa_int
  		\seq_map_inline:Nn \l_meta_funding_years_previous_seq
  		{
  			\int_incr:N \l_tmpa_int
  			\DTLnewdbentry
  			{\l__dfg_database_name_tl}
  			{fundingYearPrevious\int_use:N \l_tmpa_int}
  			{##1}
  		}
  	},
  ref-affiliation-id  .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-affiliation-id}{#1},
}
\keys_define:nn { GenderEquality }{
  position                             .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{position}{#1},
  previous-objective-percentage-female .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{previous-objective-percentage-female}{#1},
  status-quo-number-female             .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{status-quo-number-female}{#1},
  status-quo-percentage-female         .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{status-quo-percentage-female }{#1},
  future-objective-percentage-female   .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{future-objective-percentage-female}{#1},
}
\clist_new:N \l__dfg_person_tmp_period_clist
\clist_new:N \l__dfg_person_tmp_role_clist
\clist_new:N \l__dfg_keys_tmp_clist
\cs_new_protected:Npn \__dfg_set_filtered_clist:Nnn #1#2#3
{
  % #1: clist variable in which valid values are stored
  % #2: clist of valid values
  % #3: clist of given values
  % function assumes none of the values contain braces or `#` tokens
  \clist_set:Nn \l__dfg_keys_tmp_clist {#2}
  \clist_clear:N #1
  \clist_map_inline:nn {#3}
  {
  	\clist_if_in:NnTF \l__dfg_keys_tmp_clist {##1}
  	{ \clist_put_right:Nn #1 {##1} }
  	{ \msg_warning:nnnn { dfg } { invalid-value } {#3} {#2} }
  }
}
\cs_new_protected:Npn \__dfg_new_clist_dbentry:nnn #1#2#3
{
  \clist_set:Nn \l_tmpa_clist {#3}
  \exp_args:NnnV \DTLnewdbentry {#1} {#2} \l_tmpa_clist
}

\bool_new:N \l__dfg_project_consider_for_lists_bool
\bool_new:N \l__dfg_project_reference_only_bool
\bool_new:N \g__dfg_project_count_ready_bool

\keys_define:nn { project }{
  id                       .code:n           =   \DTLnewdbentry{\l__dfg_database_name_tl}{id}{#1},
  id                       .value_required:n = true,
  number                   .code:n           = \DTLnewdbentry{\l__dfg_database_name_tl}{number}{#1},
  number                   .value_required:n = true,
  name                     .code:n           = \DTLnewdbentry{\l__dfg_database_name_tl}{name}{#1},
  project-type             .choices:nn       =  { research,service,mgk,admin} {\DTLnewdbentry{\l__dfg_database_name_tl}{project-type}{#1}},
  project-type / unknown   .code:n           = {\msg_warning:nnnn { dfg } { invalid-value }{ #1 }{research,service,mgk,admin}},
  project-type             .value_required:n = true,
  project-status           .choices:nn       =  { N,E,C} {\DTLnewdbentry{\l__dfg_database_name_tl}{project-status}{#1}},
  project-status / unknown .code:n           = {\msg_warning:nnnn { dfg } { invalid-value }{ #1 }{N,E,C}},
  project-status           .value_required:n = true,
  consider-for-lists           .choices:nn       = { true,false }
    { \str_if_eq:nnTF {#1} {true}
        { \bool_set_true:N \l__dfg_project_consider_for_lists_bool }
        { \bool_set_false:N \l__dfg_project_consider_for_lists_bool } },
  consider-for-lists / unknown .code:n           =
    { \msg_warning:nnnn { dfg } { invalid-value } {#1} {true,false} },
  consider-for-lists           .value_required:n = true,
  reference-only           .choices:nn       = { true,false }
    { \str_if_eq:nnTF {#1} {true}
        { \bool_set_true:N \l__dfg_project_reference_only_bool }
        { \bool_set_false:N \l__dfg_project_reference_only_bool } },
  reference-only / unknown .code:n           =
    { \msg_warning:nnnn { dfg } { invalid-value } {#1} {true,false} },
  reference-only           .value_required:n = true,
  research-area            .code:n           = \DTLnewdbentry{\l__dfg_database_name_tl}{research-area}{#1},
  project-area             .code:n           = \DTLnewdbentry{\l__dfg_database_name_tl}{project-area}{#1},
  ref-person-id            .code:n           =
  \__dfg_new_clist_dbentry:nnn {\l__dfg_database_name_tl} {ref-person-id} {#1},
  collaborations           .code:n           =
  \__dfg_new_clist_dbentry:nnn {\l__dfg_database_name_tl} {collaborations} {#1},
  legal-issues             .code:n           = { \keys_set:nn { project / legal-issues  } { #1 } }
}
\keys_define:nn { project / legal-issues }
{
  % main questions: must be yes/no
  L1  .choices:nn = { yes, no } { \DTLnewdbentry{\l__dfg_database_name_tl}{L1} {#1} },
  L2  .choices:nn = { yes, no } { \DTLnewdbentry{\l__dfg_database_name_tl}{L2} {#1} },
  L3  .choices:nn = { yes, no } { \DTLnewdbentry{\l__dfg_database_name_tl}{L3} {#1} },
  L4  .choices:nn = { yes, no } { \DTLnewdbentry{\l__dfg_database_name_tl}{L4} {#1} },
  L5  .choices:nn = { yes, no } { \DTLnewdbentry{\l__dfg_database_name_tl}{L5} {#1} },
  L6  .choices:nn = { yes, no } { \DTLnewdbentry{\l__dfg_database_name_tl}{L6} {#1} },
  L7  .choices:nn = { yes, no } { \DTLnewdbentry{\l__dfg_database_name_tl}{L7} {#1} },
  %
  % sub-questions: yes / no / empty all allowed
  L1a .code:n = { \dfg_legal_subq:nn {L1a} {#1} },
  L2a .code:n = { \dfg_legal_subq:nn {L2a} {#1} },
  L5a .code:n = { \dfg_legal_subq:nn {L5a} {#1} },
  L7a .code:n = { \dfg_legal_subq:nn {L7a} {#1} },
  %
  % unknown handlers (only need them for the binary keys)
  L1  / unknown .code:n = { \person_questions_invalid:n {#1} },
  L2  / unknown .code:n = { \person_questions_invalid:n {#1} },
  L3  / unknown .code:n = { \person_questions_invalid:n {#1} },
  L4  / unknown .code:n = { \person_questions_invalid:n {#1} },
  L5  / unknown .code:n = { \person_questions_invalid:n {#1} },
  L6  / unknown .code:n = { \person_questions_invalid:n {#1} },
  L7  / unknown .code:n = { \person_questions_invalid:n {#1} },
}

\cs_new_protected:Npn \dfg_legal_subq:nn #1#2
{
  \tl_if_blank:nTF {#2}
  { \DTLnewdbentry{\l__dfg_database_name_tl}{#1}{} }
  {
  	\str_case:nnF {#2}
  	{
  		{ yes  } { \DTLnewdbentry{\l__dfg_database_name_tl}{#1}{yes}  }
  		{ no } { \DTLnewdbentry{\l__dfg_database_name_tl}{#1}{no} }
  	}
  	{ \person_questions_invalid:n {#2} }
  }
}
\keys_define:nn { person }{
  unknown .code:n = { \msg_warning:nnn  { dfg } { unknown-key } {#1}},
  unknown .default:V = \c_novalue_tl,
  id                .code:n =   \DTLnewdbentry{\l__dfg_database_name_tl}{id}{#1},
  id                .value_required:n = true,
  firstname        .code:n =	\DTLnewdbentry{\l__dfg_database_name_tl}{firstname}{#1},
  firstname .value_required:n = true,
  lastname         .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{lastname}{#1},
  lastname .value_required:n = true,
  academicdegree   .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{academicdegree}{#1},
  gender .choices:nn =  { m , f , d } {\DTLnewdbentry{\l__dfg_database_name_tl}{gender}{#1}},
  gender / unknown .code:n = {\msg_warning:nnnn { dfg } { invalid-value }{ #1 }{ m,f,d }},
  gender .value_required:n = true,
  ref-affiliation-id   .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-affiliation-id}{#1},
  ref-institution-id   .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-institution-id}{#1},
  ref-project-id .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-project-id}{#1},
  role .code:n = {\__dfg_set_filtered_clist:Nnn \l__dfg_person_tmp_role_clist {
  			PI,~ spokesperson,~ manager,~ steering-committee-member,~rector
  		} {#1}
  		\exp_args:Nnne \DTLnewdbentry{\l__dfg_database_name_tl}{role}
                 { \clist_use:N  \l__dfg_person_tmp_role_clist}},
  position .choices:nn =  {
  		PhD, postDoc, groupLeader, research,
  		nonResearch, student, prof,
  		prof-W2, prof-W3 }
  	{\DTLnewdbentry{\l__dfg_database_name_tl}{position}{#1}},
  position / unknown .code:n = {\msg_warning:nnnn { dfg } { invalid-value }{ #1 }{
  			PhD,~ postDoc,~ groupLeader,~ research,~
  			nonResearch,~ student,~ prof,~ prof-W2,~ prof-W3 }},
  positionText .code:n =  \DTLnewdbentry{\l__dfg_database_name_tl}{positionText}{#1},
  period .code:n = {
  		\__dfg_set_filtered_clist:Nnn \l__dfg_person_tmp_period_clist { 1, 2, 3 } {#1}
  		\exp_args:Nnne \DTLnewdbentry{\l__dfg_database_name_tl}{period}
                 { \clist_use:N  \l__dfg_person_tmp_period_clist }
  	},
  name-alias   .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{name-alias}{{#1}},
  orcid        .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{orcid}{#1},
  email        .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{email}{#1},
  phone        .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{phone}{#1},
  url          .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{url}{#1},
  doctorateYear .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{doctorateYear}{#1},
  doctorate    .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{doctorate}{#1},
  degree-programme   .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{degree-programme}{#1},
  financed-by .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{financed-by}{#1},
  topic       .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{topic}{#1},
  category    .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{category}{#1},
  dateDefense .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{dateDefense}{#1},
  periodStart .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{periodStart}{#1},
  periodEnd .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{periodEnd}{#1},
  contract-information .code:n = { \keys_set:nn { person / contract-information } { #1 } }
}
\cs_new_protected:Npn \person_questions_invalid:n #1
{ \msg_warning:nnnn { dfg } { invalid-value } {#1} { yes , no } }

\keys_define:nn { person / contract-information }
{
  %--- yes/no questions -----------------------------------------------
  C1 .choices:nn = { yes , no }
  	{ \DTLnewdbentry{\l__dfg_database_name_tl}{C1}{#1} },
  C1 / unknown .code:n = { \person_questions_invalid:n {#1} },

  C2 .choices:nn = { yes , no  }
  	{ \DTLnewdbentry{\l__dfg_database_name_tl}{C2}{#1} },
  C2 / unknown .code:n = { \person_questions_invalid:n {#1} },

  C3 .choices:nn = { yes , no  }
  	{ \DTLnewdbentry{\l__dfg_database_name_tl}{C3}{#1} },
  C3 / unknown .code:n = { \person_questions_invalid:n {#1} },

  C4 .choices:nn = {  yes , no  }
  	{ \DTLnewdbentry{\l__dfg_database_name_tl}{C4}{#1} },
  C4 / unknown .code:n = { \person_questions_invalid:n {#1} },

  %--- free-form follow-ups (may be empty) ----------------------------
  C2a .code:n = { \dfg_contract_date:nn {C2a} {#1} },
  C2b .code:n = { \dfg_contract_date:nn {C2b} {#1} },
  C3a .code:n = { \dfg_contract_date:nn {C3a} {#1} },
  C4a .code:n = { \dfg_contract_text:nn {C4a} {#1} },
}

\cs_new_protected:Npn \dfg_contract_date:nn #1#2
{
  \tl_if_blank:nTF {#2}
  { \DTLnewdbentry{\l__dfg_database_name_tl}{#1}{} }
  {
  	\dfg_is_iso_date:nTF {#2}
  	{ \DTLnewdbentry{\l__dfg_database_name_tl}{#1}{#2} }
  	{
  		\msg_warning:nnnn { dfg } { invalid-date } {#1} {#2}
  		\DTLnewdbentry{\l__dfg_database_name_tl}{#1}{#2}
  	}
  }
}

\cs_new_protected:Npn \dfg_contract_text:nn #1#2
{
  \DTLnewdbentry{\l__dfg_database_name_tl}{#1}{#2}
}

\prg_new_protected_conditional:Npnn \dfg_is_iso_date:n #1 { TF , T , F }
{
  \regex_match:nnTF { \A \d{4} - \d{2} - \d{2} \Z } {#1}
  { \prg_return_true: }
  { \prg_return_false: }
}
\keys_define:nn { cv }{
  id           .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{id}{#1},
  ref-person-id.code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-person-id}{#1},
  cv-type .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{type}{#1},
  cv-type .choices:nn =  {mandatory, supplement,
  		activities, supervision,
  		distinction, other }
  	{\DTLnewdbentry{\l__dfg_database_name_tl}{type}{#1}},
  % Backward-compatibility alias for the former misspelling.
  cv-type / distinction .code:n = {			\DTLnewdbentry{\l__dfg_database_name_tl}{type}{distinction}},
  cv-type / unknown .code:n = {\msg_warning:nnnn { dfg } { invalid-value }{ #1 }{
  			mandatory,~ supplement,~
  			activities,~  supervision,~
  			distinction,~ other }},
  positionText .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{positionText}{#1},
  position .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{position}{#1},
  ref-institution-id .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-institution-id}{#1},
  description .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{description}{#1},
  periodStart .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{periodStart}{#1},
  periodEnd .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{periodEnd}{#1},
}
\keys_define:nn { affiliation }
{
  id               .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{id}{#1},
  id               .value_required:n = true,
  name             .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{name}{#1},
  abbreviation  .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{abbreviation}{#1},
  addressStreet    .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{addressStreet}{#1},
  addressZIP   .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{addressZIP}{#1},
  location         .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{location}{#1},
  country          .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{country}{#1},
}
\keys_define:nn { institution }
{
  id        .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{id}{#1},
  id        .value_required:n = true,
  name      .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{name}{#1},
  abbreviation .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{abbreviation}{#1},
  ref-affiliation-id  .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{ref-affiliation-id}{#1},
}

\tl_new:N \l__dfg_institution_label_field_tl
\cs_new_protected:Npn \__dfg_institution_abbreviation_or_name:nN #1#2
{
  \tl_clear:N #2
  \tl_set:Nn \l__dfg_institution_label_field_tl { abbreviation }
  \datatool_if_has_key:nnTF { institution } { abbreviation }
  {
    \DTLgetvalueforkey{#2}{abbreviation}{institution}{id}{#1}
  }
  { }
  \DTLifnullorempty{#2}
  {
    \tl_set:Nn \l__dfg_institution_label_field_tl { name }
    \DTLgetvalueforkey{#2}{name}{institution}{id}{#1}
  }
  { }
}
\str_new:N \l__dfg_funding_tmp_type_str
\tl_new:N \l_funding_sum_quantity_tl
\keys_define:nn { funding / year }
{
  year1 .code:n =
  	{\DTLnewdbentry{\l__dfg_database_name_tl}{\tl_use:N \l_funding_sum_quantity_tl-year1}{#1}},
  year2 .code:n =
  	{\DTLnewdbentry{\l__dfg_database_name_tl}{\tl_use:N \l_funding_sum_quantity_tl-year2}{#1}},
  year3 .code:n =
  	{\DTLnewdbentry{\l__dfg_database_name_tl}{\tl_use:N \l_funding_sum_quantity_tl-year3}{#1}},
  year4 .code:n =
  	{\DTLnewdbentry{\l__dfg_database_name_tl}{\tl_use:N \l_funding_sum_quantity_tl-year4}{#1}},
  year5 .code:n =
  	{\DTLnewdbentry{\l__dfg_database_name_tl}{\tl_use:N \l_funding_sum_quantity_tl-year5}{#1}},
}

\keys_define:nn { funding }
{
  id        .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{id}{#1},
  id        .value_required:n = true,
  ref-project-id .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-project-id}{#1},
  ref-affiliation-id .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{ref-affiliation-id}{#1},
  financed-by .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{financed-by}{#1},
  funding-type .choices:nn =  {
  		staff,~ costs,~ fellowships,~ globalfunds,~ instrumentation }
  	{
  		\str_set:Nn \l__dfg_funding_tmp_type_str {#1}
  		\DTLnewdbentry{\l__dfg_database_name_tl}{type}{#1}
  	},
  funding-type / unknown .code:n = {\msg_warning:nnnn { dfg } { invalid-value }{ #1 }{
  			staff,~ costs,~ fellowships,~ globalfunds,~ instrumentation }},
  funding-type        .value_required:n = true,
  percentage .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{percentage}{#1},
  quantity .code:n = {
  		\tl_set:Nn \l_funding_sum_quantity_tl {quantity}
  		\keys_set:nn { funding / year  } { #1 }
  	},
  sum .code:n = {
  		\tl_set:Nn \l_funding_sum_quantity_tl {sum}
  		\keys_set:nn { funding / year  } { #1 }
  	},
  category .code:n =
  	{
  		\str_if_eq:VnTF \l__dfg_funding_tmp_type_str { staff }
  		{% staff → restricted choices
  			\str_if_in:nnTF {groupLeader, prof , postDoc,medDoc,%
  				PhD,research,nonResearch,student,assistant%
  			}
  			{#1}
  			{
  				\DTLnewdbentry{\l__dfg_database_name_tl}{category}{#1}
  			}
  			{
  				\msg_warning:nnnn { dfg } { invalid-value }{ #1 }
  				{%
  					prof,~ groupLeader,~ postDoc,~ medDoc,~
  					PhD,~ research,~ nonResearch,~ student,~ assistant
  				}
  			}
  		}
  		{
  			% non-staff → unrestricted
  			\DTLnewdbentry{\l__dfg_database_name_tl}{category}{#1}
  		}
  	},
  % following keys are especially for the previous fundings
  year            .code:n = {\DTLnewdbentry{\l__dfg_database_name_tl}{year}{#1}},
  applicant       .code:n = {\DTLnewdbentry{\l__dfg_database_name_tl}{applicant}{#1}},
  participant     .code:n = {\DTLnewdbentry{\l__dfg_database_name_tl}{participant}{#1}},
  other-funds     .code:n = {\DTLnewdbentry{\l__dfg_database_name_tl}{other-funds}{#1}},
  staff           .code:n = {\DTLnewdbentry{\l__dfg_database_name_tl}{staff}{#1}},
  costs           .code:n = {\DTLnewdbentry{\l__dfg_database_name_tl}{costs}{#1}},
  instrumentation .code:n = {\DTLnewdbentry{\l__dfg_database_name_tl}{instrumentation}{#1}},
  fellowships     .code:n = {\DTLnewdbentry{\l__dfg_database_name_tl}{fellowships}{#1}},
  globalfunds     .code:n = {\DTLnewdbentry{\l__dfg_database_name_tl}{globalfunds}{#1}},
}
\keys_define:nn { instrumentation }{
  ref-project-id  .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-project-id}{#1},
  quantity        .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{quantity}{#1},
  instrument      .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{instrument}{#1},
  company         .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{company}{#1},
  year            .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{year}{#1},
  cost            .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{cost}{#1},
  financed-by     .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{financed-by}{#1},
  description     .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{description}{#1},
  sum .code:n = {
  		\tl_set:Nn \l_funding_sum_quantity_tl {sum}
  		\keys_set:nn { funding / year  } { #1 }
  	},
}
\tl_new:N \l_staff_year_tl          % will hold “year1”, “year2”, …
\keys_define:nn { staff / position }{
  postDoc      .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{postDoc-\tl_use:N \l_staff_year_tl}{#1},
  PhD          .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{PhD-\tl_use:N \l_staff_year_tl}{#1},
  research     .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{research-\tl_use:N \l_staff_year_tl}{#1},
  nonResearch  .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}
  {nonResearch-\tl_use:N \l_staff_year_tl}{#1},
  student      .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{student-\tl_use:N \l_staff_year_tl}{#1},
}

\cs_new_protected:Npn \__dfg_staff_set_category:n #1
{
  \prop_if_in:NnTF \g__dfg_dfg_category_names_prop {#1}
  { \DTLnewdbentry{\l__dfg_database_name_tl}{category}{#1} }
  {
    \msg_warning:nnnn { dfg } { invalid-value } {#1}
      { a~key~registered~in~\token_to_str:N \g__dfg_dfg_category_names_prop }
  }
}

\keys_define:nn { staff }{
  unknown .code:n = { \msg_warning:nnn { dfg } { unknown-key } {#1} },
  unknown .default:V = \c_novalue_tl,
  ref-project-id .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-project-id}{#1},
  funding-status .choices:nn = { existing, requested }
  { \DTLnewdbentry{\l__dfg_database_name_tl}{funding-status}{#1} },
  funding-status / unknown .code:n =
  { \msg_warning:nnnn { dfg } { invalid-value } {#1} { existing,~requested } },
  staff-type .choices:nn = { research, nonResearch }
  { \DTLnewdbentry{\l__dfg_database_name_tl}{staff-type}{#1} },
  staff-type / unknown .code:n =
  { \msg_warning:nnnn { dfg } { invalid-value } {#1} { research,~nonResearch } },
  ref-person-id .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{ref-person-id}{#1},
  firstname .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{firstname}{#1},
  lastname .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{lastname}{#1},
  academic-degree .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{academic-degree}{#1},
  positionText .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{positionText}{#1},
  position .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{positionText}{#1},
  field-of-research .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{field-of-research}{#1},
  ref-institution-id .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{ref-institution-id}{#1},
  ref-affiliation-id .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{ref-affiliation-id}{#1},
  department .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{department}{#1},
  commitment .code:n =
  {
    \regex_match:nnTF { \A \d+ (?: \. \d+ )? \Z }
      {#1}
    { \DTLnewdbentry{\l__dfg_database_name_tl}{commitment}{#1} }
    { \msg_warning:nnnn { dfg } { invalid-value } {#1}
      { non-negative~integer~or~decimal } }
  },
  category .code:n = \__dfg_staff_set_category:n {#1},
  funding-source .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{funding-source}{#1},
  description .code:n =
  \DTLnewdbentry{\l__dfg_database_name_tl}{description}{#1},
  year1 .code:n = {
  		\tl_set:Nn \l_staff_year_tl {year1}
  		\keys_set:nn { staff / position  } { #1 }
  	},
  year2 .code:n = {
  		\tl_set:Nn \l_staff_year_tl {year2}
  		\keys_set:nn { staff / position  } { #1 }
  	},
  year3 .code:n = {
  		\tl_set:Nn \l_staff_year_tl {year3}
  		\keys_set:nn { staff / position  } { #1 }
  	},
  year4 .code:n = {
  		\tl_set:Nn \l_staff_year_tl {year4}
  		\keys_set:nn { staff / position  } { #1 }
  	},
  year5 .code:n = {
  		\tl_set:Nn \l_staff_year_tl {year5}
  		\keys_set:nn { staff / position  } { #1 }
  },
}

\bool_new:N \g__dfg_requested_funding_staff_schema_ready_bool
\cs_new_protected:Npn \__dfg_requested_funding_staff_ensure_schema:
{
  \bool_if:NF \g__dfg_requested_funding_staff_schema_ready_bool
  {
    \clist_map_inline:nn
    {
      ref-project-id, funding-status, staff-type, ref-person-id,
      firstname, lastname, academic-degree, positionText, field-of-research,
      ref-institution-id, ref-affiliation-id, department, commitment, category,
      funding-source, description
    }
    {
      \DTLifhaskey { RequestedFundingStaff } {##1}
      { }
      { \DTLaddcolumn { RequestedFundingStaff } {##1} }
    }
    \bool_gset_true:N \g__dfg_requested_funding_staff_schema_ready_bool
  }
}

\tl_new:N \l__dfg_requested_funding_staff_validate_project_tl
\tl_new:N \l__dfg_requested_funding_staff_validate_status_tl
\tl_new:N \l__dfg_requested_funding_staff_validate_type_tl
\tl_new:N \l__dfg_requested_funding_staff_validate_person_tl
\tl_new:N \l__dfg_requested_funding_staff_validate_lastname_tl
\keys_define:nn { dfg / requested-funding-staff-validation }
{
  ref-project-id .tl_set:N =
    \l__dfg_requested_funding_staff_validate_project_tl,
  funding-status .tl_set:N =
    \l__dfg_requested_funding_staff_validate_status_tl,
  staff-type .tl_set:N =
    \l__dfg_requested_funding_staff_validate_type_tl,
  ref-person-id .tl_set:N =
    \l__dfg_requested_funding_staff_validate_person_tl,
  lastname .tl_set:N =
    \l__dfg_requested_funding_staff_validate_lastname_tl,
  unknown .code:n = { }
}

\cs_new_protected:Npn \__dfg_requested_funding_staff_validate:n #1
{
  \tl_clear:N \l__dfg_requested_funding_staff_validate_project_tl
  \tl_clear:N \l__dfg_requested_funding_staff_validate_status_tl
  \tl_clear:N \l__dfg_requested_funding_staff_validate_type_tl
  \tl_clear:N \l__dfg_requested_funding_staff_validate_person_tl
  \tl_clear:N \l__dfg_requested_funding_staff_validate_lastname_tl
  \keys_set:nn { dfg / requested-funding-staff-validation } {#1}
  \tl_if_blank:VT \l__dfg_requested_funding_staff_validate_project_tl
  { \msg_warning:nnn { dfg } { requested-staff-required }
    { ref-project-id } }
  \tl_if_blank:VT \l__dfg_requested_funding_staff_validate_status_tl
  { \msg_warning:nnn { dfg } { requested-staff-required }
    { funding-status } }
  \tl_if_blank:VT \l__dfg_requested_funding_staff_validate_type_tl
  { \msg_warning:nnn { dfg } { requested-staff-required }
    { staff-type } }
  \bool_lazy_all:nT
  {
    { \tl_if_blank_p:V \l__dfg_requested_funding_staff_validate_person_tl }
    { \tl_if_blank_p:V \l__dfg_requested_funding_staff_validate_lastname_tl }
  }
  { \msg_warning:nnn { dfg } { requested-staff-required }
    { ref-person-id~or~lastname } }
}
\keys_define:nn { UpkeepLaboratoryAnimals }{
  ref-project-id .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{ref-project-id}{#1},
  species .choices:nn =  { mouse, mouse-gnotobiotic,rat}
  	{\DTLnewdbentry{\l__dfg_database_name_tl}{species}{#1}},
  species / unknown .code:n = {\msg_warning:nnnn { dfg } { invalid-value }{ #1 }{
  			smouse,~ mouse-gnotobiotic,~ rat}},
  species   .value_required:n = true,
  quantity .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{quantity}{#1},
  weeks-kept .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{weeks-kept}{#1},
  purchasing-costs   .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{purchasing-costs}{#1},
  requested-funds   .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{requested-funds}{#1},
  existing-funds .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{existing-funds}{#1},
}
\keys_define:nn { gantt }{
  id          .code:n     =  \DTLnewdbentry{\l__dfg_database_name_tl}{id}{#1},
  id          .value_required:n = true,
  name        .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{name}{#1},
  description .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{description}{#1},
  periodStart .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{periodStart}{#1},
  periodEnd   .code:n = \DTLnewdbentry{\l__dfg_database_name_tl}{periodEnd}{#1},
  style       .choices:nn =  { crosshatch,striped,important,alternative,default }
  	{\DTLnewdbentry{\l__dfg_database_name_tl}{style}{#1}},
  style / unknown .code:n = {
  		\msg_warning:nnnn { dfg } { invalid-value }{ #1
  		}{crosshatch,striped,important,alternative,default }
  		\DTLnewdbentry{\l__dfg_database_name_tl}{style}{default}
  	},
}
\NewDocumentCommand{\dfgShowTag}{ m m m o }
{%
  % #1: id
  % #2: field of database
  % #3: value from database field
  % #4: custom field (optional, e.g. database name)
  \bool_if:NTF \l__dfg_class_showtags_bool
  { \texorpdfstring{\__dfg_show_tag_direct:nnnn {#1}{#2}{#3}{#4}}{#3} }
  {#3}%
}

\NewDocumentCommand{\dfgShowCalculatedTag}{ m m +m }
{%
  % #1: calculation command or label
  % #2: contributing database(s)
  % #3: calculated value
  \bool_if:NTF \l__dfg_class_showtags_bool
  { \texorpdfstring{\__dfg_show_tag_value:nn { calc:#1~[#2] } {#3}}{#3} }
  {#3}%
}

\cs_new_protected:Npn \__dfg_show_tag_direct:nnnn #1#2#3#4
{
  \IfNoValueTF{#4}
    { \__dfg_show_tag_value:nn { #1:#2 } {#3} }
    { \__dfg_show_tag_value:nn { #4:#1:#2 } {#3} }
}

\cs_new_protected:Npn \__dfg_show_tag_value:nn #1#2
{
  \bool_if:nTF
    { \g__dfg_tblr_inside_bool && ! \l__dfg_class_showtags_tables_bool }
    {#2}
    { \__dfg_show_tag_overlay:nn {#1}{#2} }
}

\bool_new:N \g__dfg_show_tag_upper_bool
\bool_new:N \l__dfg_show_tag_leftward_bool
\dim_new:N \l__dfg_show_tag_raise_dim

\cs_new_protected:Npn \__dfg_show_tag_overlay:nn #1#2
{
  % #1: preformatted provenance label
  % #2: displayed value
  \group_begin:
    \bool_if:NTF \g__dfg_show_tag_upper_bool
      { \dim_set:Nn \l__dfg_show_tag_raise_dim { 1.30em } }
      { \dim_set:Nn \l__dfg_show_tag_raise_dim { .9em } }
    \bool_gset_inverse:N \g__dfg_show_tag_upper_bool
    \leavevmode
    \smash{%
      \vbox to \z@ {%
			\vss
			\color{color@tags@line}%
      \bool_if:NTF \l__dfg_show_tag_leftward_bool
      {%
        \llap{%
          \raise \l__dfg_show_tag_raise_dim \hbox{%
            \fontsize{4}{0}\selectfont
            \ttfamily
            #1\,%
          }%
          \vrule
        }%
      }
      {%
        \rlap{%
          \vrule
          \raise \l__dfg_show_tag_raise_dim \hbox{%
            \fontsize{4}{0}\selectfont
            \ttfamily
            \,%
            #1%
          }%
        }%
      }%
      }%
    }%
    \textcolor{color@tags@font}{#2}%
  \group_end:
}

\cs_new_protected:Npn \__dfg_show_table_number:n #1
{
  \bool_if:NTF \g__dfg_tblr_inside_bool
    { \TblrNum{#1} }
    { \num{#1} }
}

\cs_new_protected:Npn \__dfg_show_eur:n #1
{
  \bool_if:NTF \g__dfg_tblr_inside_bool
    { \TblrNum{#1} }
    {
      \num[
        round-mode = places,
        round-precision = 0
      ]{#1}
    }
}

\cs_new_protected:Npn \__dfg_show_existing_instrumentation_cost:n #1
{
  \bool_if:NTF \g__dfg_tblr_inside_bool
    { \TblrNum{#1} }
    {
      \num[
        round-mode = places,
        round-precision = 1
      ]{#1}
    }
}

\cs_new_protected:Npn \__dfg_show_calculated_number:nnN #1#2#3
{
  \dfgShowCalculatedTag{#1}{#2}
  { \exp_args:NV \__dfg_show_eur:n #3 }
}

\AtBeginDocument{%
  \bool_if:NTF \l__dfg_class_showtags_bool
  {%
    \RenewDocumentCommand{\dfgShowTag}{ m m m o }
    { \texorpdfstring{\__dfg_show_tag_direct:nnnn {#1}{#2}{#3}{#4}}{#3} }%
    \RenewDocumentCommand{\dfgShowCalculatedTag}{ m m +m }
    { \texorpdfstring{\__dfg_show_tag_value:nn { calc:#1~[#2] } {#3}}{#3} }%
  }
  {%
    \RenewDocumentCommand{\dfgShowTag}{ m m m o }
    {#3}%
    \RenewDocumentCommand{\dfgShowCalculatedTag}{ m m +m }
    {#3}%
  }%
}

\cs_new_protected:Npn \__dfg_add_entry:nnn #1#2#3
{
  % #1: keys     #2: database     #3: key-values
  \group_begin:
  \tl_set:Nn \l__dfg_database_name_tl {#2}
  \DTLifdbexists {#2}
  { }
  { \DTLaction [ name = \l__dfg_database_name_tl ] { new } }
  \bool_lazy_all:nT
  {
    { \str_if_eq_p:nn {#1} { staff } }
    { \str_if_eq_p:nn {#2} { RequestedFundingStaff } }
  }
  {
    \__dfg_requested_funding_staff_ensure_schema:
    \__dfg_requested_funding_staff_validate:n {#3}
  }
  \DTLaction [ name = \l__dfg_database_name_tl ] { new~row }
  \str_if_eq:nnT {#1} { project }
  {
    \bool_set_true:N  \l__dfg_project_consider_for_lists_bool
    \bool_set_false:N \l__dfg_project_reference_only_bool
  }
  \exp_args:Ne \keys_set:nn {#1} {#3}
  \str_if_eq:nnT {#1} { project }
  {
    \bool_if:NTF \l__dfg_project_consider_for_lists_bool
      { \DTLnewdbentry{\l__dfg_database_name_tl}{consider-for-lists}{true} }
      { \DTLnewdbentry{\l__dfg_database_name_tl}{consider-for-lists}{false} }
    \bool_if:NTF \l__dfg_project_reference_only_bool
      { \DTLnewdbentry{\l__dfg_database_name_tl}{reference-only}{true} }
      { \DTLnewdbentry{\l__dfg_database_name_tl}{reference-only}{false} }
    \bool_gset_false:N \g__dfg_project_count_ready_bool
  }
  \bool_lazy_all:nT
  {
    { \str_if_eq_p:nn {#1} { funding } }
    { \str_if_eq_p:Vn \l__dfg_funding_tmp_type_str { staff } }
  }
  { \__dfg_funding_complete_staff_sums:n {#3} }
  \group_end:
}

\prop_new:N \g__dfg_funding_sum_prop
\prop_new:N \g__dfg_funding_staff_quantity_prop
\fp_new:N   \l__dfg_funding_cache_fp
\tl_new:N   \l__dfg_funding_cache_key_tl
\tl_new:N   \l__dfg_funding_cache_value_tl
\tl_new:N   \l__dfg_funding_cache_project_tl
\tl_new:N   \l__dfg_funding_cache_type_tl
\tl_new:N   \l__dfg_funding_cache_category_tl
\tl_new:N   \l__dfg_funding_cache_percentage_tl
\tl_new:N   \l__dfg_funding_salary_command_tl
\tl_new:N   \l__dfg_funding_salary_value_tl
\tl_new:N   \l__dfg_funding_cache_sum_one_tl
\tl_new:N   \l__dfg_funding_cache_sum_two_tl
\tl_new:N   \l__dfg_funding_cache_sum_three_tl
\tl_new:N   \l__dfg_funding_cache_sum_four_tl
\tl_new:N   \l__dfg_funding_cache_sum_five_tl
\tl_new:N   \l__dfg_funding_cache_quantity_one_tl
\tl_new:N   \l__dfg_funding_cache_quantity_two_tl
\tl_new:N   \l__dfg_funding_cache_quantity_three_tl
\tl_new:N   \l__dfg_funding_cache_quantity_four_tl
\tl_new:N   \l__dfg_funding_cache_quantity_five_tl
\bool_new:N \l__dfg_funding_calculation_store_bool
\bool_new:N \l__dfg_funding_calculation_ready_bool
\bool_new:N \l__dfg_funding_calculation_needed_bool

\prop_new:N \g__dfg_funding_salary_commands_prop
\prop_gset_from_keyval:Nn \g__dfg_funding_salary_commands_prop
{
  prof        = dfgSalaryProf,
  groupLeader = dfgSalaryGroupLeader,
  postDoc     = dfgSalaryPostDoc,
  medDoc      = dfgSalaryMedDoc,
  PhD         = dfgSalaryPhD,
  research    = dfgSalaryResearch,
  nonResearch = dfgSalaryNonResearch,
  student     = dfgSalaryStudent,
  assistant   = dfgSalaryAssistant,
  prof-W2     = dfgSalaryProf,
  prof-W3     = dfgSalaryProf
}

\keys_define:nn { dfg / funding-cache / sum }
{
  year1 .tl_set:N = \l__dfg_funding_cache_sum_one_tl,
  year2 .tl_set:N = \l__dfg_funding_cache_sum_two_tl,
  year3 .tl_set:N = \l__dfg_funding_cache_sum_three_tl,
  year4 .tl_set:N = \l__dfg_funding_cache_sum_four_tl,
  year5 .tl_set:N = \l__dfg_funding_cache_sum_five_tl,
  unknown .code:n = { }
}

\keys_define:nn { dfg / funding-cache / quantity }
{
  year1 .tl_set:N = \l__dfg_funding_cache_quantity_one_tl,
  year2 .tl_set:N = \l__dfg_funding_cache_quantity_two_tl,
  year3 .tl_set:N = \l__dfg_funding_cache_quantity_three_tl,
  year4 .tl_set:N = \l__dfg_funding_cache_quantity_four_tl,
  year5 .tl_set:N = \l__dfg_funding_cache_quantity_five_tl,
  unknown .code:n = { }
}

\keys_define:nn { dfg / funding-cache }
{
  ref-project-id .tl_set:N = \l__dfg_funding_cache_project_tl,
  funding-type   .tl_set:N = \l__dfg_funding_cache_type_tl,
  category       .tl_set:N = \l__dfg_funding_cache_category_tl,
  percentage     .tl_set:N = \l__dfg_funding_cache_percentage_tl,
  sum .code:n =
    { \keys_set:nn { dfg / funding-cache / sum } {#1} },
  quantity .code:n =
    { \keys_set:nn { dfg / funding-cache / quantity } {#1} },
  unknown .code:n = { }
}

\cs_new_protected:Npn \__dfg_funding_capture:n #1
{
  \tl_clear:N \l__dfg_funding_cache_project_tl
  \tl_clear:N \l__dfg_funding_cache_type_tl
  \tl_clear:N \l__dfg_funding_cache_category_tl
  \tl_clear:N \l__dfg_funding_cache_percentage_tl
  \tl_clear:N \l__dfg_funding_cache_sum_one_tl
  \tl_clear:N \l__dfg_funding_cache_sum_two_tl
  \tl_clear:N \l__dfg_funding_cache_sum_three_tl
  \tl_clear:N \l__dfg_funding_cache_sum_four_tl
  \tl_clear:N \l__dfg_funding_cache_sum_five_tl
  \tl_clear:N \l__dfg_funding_cache_quantity_one_tl
  \tl_clear:N \l__dfg_funding_cache_quantity_two_tl
  \tl_clear:N \l__dfg_funding_cache_quantity_three_tl
  \tl_clear:N \l__dfg_funding_cache_quantity_four_tl
  \tl_clear:N \l__dfg_funding_cache_quantity_five_tl
  \keys_set:nn { dfg / funding-cache } {#1}
}

\cs_new_protected:Npn \__dfg_funding_calculation_needed:NN #1#2
{
  \bool_lazy_all:nT
  {
    { \tl_if_blank_p:V #1 }
    { ! \tl_if_blank_p:V #2 }
  }
  { \bool_set_true:N \l__dfg_funding_calculation_needed_bool }
}

\cs_new_protected:Npn \__dfg_funding_calculate_one:NNnn #1#2#3#4
{
  % #1 sum tl, #2 quantity tl, #3 database field, #4 period factor
  \bool_lazy_all:nT
  {
    { \tl_if_blank_p:V #1 }
    { ! \tl_if_blank_p:V #2 }
    { \bool_if_p:N \l__dfg_funding_calculation_ready_bool }
  }
  {
    \exp_args:NnV \regex_match:nnTF
      { \A \d+ (?: \. \d+ )? \Z } #2
    {
      \tl_set:Nx #1
      {
        \fp_eval:n
        {
          round(
            \l__dfg_funding_salary_value_tl
            * \l__dfg_funding_cache_percentage_tl / 100
            * #2
            * #4,
            0
          )
        }
      }
      \bool_if:NT \l__dfg_funding_calculation_store_bool
      {
        \exp_args:Nnne \DTLnewdbentry
          {\l__dfg_database_name_tl}{#3}{\tl_use:N #1}
      }
    }
    {
      \bool_if:NT \l__dfg_funding_calculation_store_bool
      {
        \msg_warning:nne { dfg } { funding-staff-cost-unavailable }
        { project~'\l__dfg_funding_cache_project_tl',~#3:~invalid~quantity~'#2' }
      }
    }
  }
}

\cs_new_protected:Npn \__dfg_funding_calculate_staff_sums:
{
  \str_if_eq:VnT \l__dfg_funding_cache_type_tl { staff }
  {
    \bool_set_false:N \l__dfg_funding_calculation_needed_bool
    \__dfg_funding_calculation_needed:NN
      \l__dfg_funding_cache_sum_one_tl \l__dfg_funding_cache_quantity_one_tl
    \__dfg_funding_calculation_needed:NN
      \l__dfg_funding_cache_sum_two_tl \l__dfg_funding_cache_quantity_two_tl
    \__dfg_funding_calculation_needed:NN
      \l__dfg_funding_cache_sum_three_tl \l__dfg_funding_cache_quantity_three_tl
    \__dfg_funding_calculation_needed:NN
      \l__dfg_funding_cache_sum_four_tl \l__dfg_funding_cache_quantity_four_tl
    \__dfg_funding_calculation_needed:NN
      \l__dfg_funding_cache_sum_five_tl \l__dfg_funding_cache_quantity_five_tl
    \bool_if:NT \l__dfg_funding_calculation_needed_bool
    {
      \bool_set_true:N \l__dfg_funding_calculation_ready_bool
      \prop_get:NVNTF \g__dfg_funding_salary_commands_prop
        \l__dfg_funding_cache_category_tl \l__dfg_funding_salary_command_tl
      {
        \cs_if_exist:cTF { \l__dfg_funding_salary_command_tl }
        { \tl_set:Nx \l__dfg_funding_salary_value_tl
          { \use:c { \l__dfg_funding_salary_command_tl } } }
        { \bool_set_false:N \l__dfg_funding_calculation_ready_bool }
      }
      { \bool_set_false:N \l__dfg_funding_calculation_ready_bool }
      \exp_args:NnV \regex_match:nnF
        { \A \d+ (?: \. \d+ )? \Z }
        \l__dfg_funding_cache_percentage_tl
      { \bool_set_false:N \l__dfg_funding_calculation_ready_bool }
      \exp_args:NnV \regex_match:nnF
        { \A \d+ (?: \. \d+ )? \Z }
        \l__dfg_funding_salary_value_tl
      { \bool_set_false:N \l__dfg_funding_calculation_ready_bool }
      \bool_lazy_all:nT
      {
        { \bool_if_p:N \l__dfg_funding_calculation_store_bool }
        { ! \bool_if_p:N \l__dfg_funding_calculation_ready_bool }
      }
      {
        \msg_warning:nne { dfg } { funding-staff-cost-unavailable }
        {
          project~'\l__dfg_funding_cache_project_tl',~category~
          '\l__dfg_funding_cache_category_tl',~percentage~
          '\l__dfg_funding_cache_percentage_tl'
        }
      }
      \__dfg_funding_calculate_one:NNnn
        \l__dfg_funding_cache_sum_one_tl
        \l__dfg_funding_cache_quantity_one_tl { sum-year1 } { 0.5 }
      \__dfg_funding_calculate_one:NNnn
        \l__dfg_funding_cache_sum_two_tl
        \l__dfg_funding_cache_quantity_two_tl { sum-year2 } { 1 }
      \__dfg_funding_calculate_one:NNnn
        \l__dfg_funding_cache_sum_three_tl
        \l__dfg_funding_cache_quantity_three_tl { sum-year3 } { 1 }
      \__dfg_funding_calculate_one:NNnn
        \l__dfg_funding_cache_sum_four_tl
        \l__dfg_funding_cache_quantity_four_tl { sum-year4 } { 1 }
      \__dfg_funding_calculate_one:NNnn
        \l__dfg_funding_cache_sum_five_tl
        \l__dfg_funding_cache_quantity_five_tl { sum-year5 } { 0.5 }
    }
  }
}

\cs_new_protected:Npn \__dfg_funding_complete_staff_sums:n #1
{
  \bool_set_true:N \l__dfg_funding_calculation_store_bool
  \__dfg_funding_capture:n {#1}
  \__dfg_funding_calculate_staff_sums:
}

\cs_new_protected:Npn \__dfg_funding_cache_add:Nnn #1#2#3
{
  \tl_set:Nx \l__dfg_funding_cache_key_tl {#2}
  \tl_set:Nx \l__dfg_funding_cache_value_tl {#3}
  \tl_if_blank:VF \l__dfg_funding_cache_value_tl
  {
    \prop_get:NVNTF #1
      \l__dfg_funding_cache_key_tl \l__dfg_funding_cache_value_tl
    {
      \fp_set:Nn \l__dfg_funding_cache_fp
        { \l__dfg_funding_cache_value_tl + (#3) }
    }
    { \fp_set:Nn \l__dfg_funding_cache_fp {#3} }
    \prop_gput:NVx #1 \l__dfg_funding_cache_key_tl
      { \fp_to_decimal:N \l__dfg_funding_cache_fp }
  }
}

\cs_new_protected:Npn \__dfg_funding_cache_sum_year:nnn #1#2#3
{
  % #1 database, #2 field, #3 value
  \tl_if_blank:VF \l__dfg_funding_cache_type_tl
  {
    \__dfg_funding_cache_add:Nnn \g__dfg_funding_sum_prop
      {#1/\l__dfg_funding_cache_project_tl/
       \l__dfg_funding_cache_type_tl/#2} {#3}
    \__dfg_funding_cache_add:Nnn \g__dfg_funding_sum_prop
      {#1/__ALL__/\l__dfg_funding_cache_type_tl/#2} {#3}
  }
  \__dfg_funding_cache_add:Nnn \g__dfg_funding_sum_prop
    {#1/\l__dfg_funding_cache_project_tl/__ALL__/#2} {#3}
  \__dfg_funding_cache_add:Nnn \g__dfg_funding_sum_prop
    {#1/__ALL__/__ALL__/#2} {#3}
}

\cs_new_protected:Npn \__dfg_funding_cache_quantity_year:nnn #1#2#3
{
  % #1 database, #2 field, #3 value
  \__dfg_funding_cache_add:Nnn \g__dfg_funding_staff_quantity_prop
    {#1/\l__dfg_funding_cache_project_tl/
     \l__dfg_funding_cache_category_tl/#2} {#3}
  \__dfg_funding_cache_add:Nnn \g__dfg_funding_staff_quantity_prop
    {#1/__ALL__/\l__dfg_funding_cache_category_tl/#2} {#3}
}

\cs_new_protected:Npn \__dfg_funding_cache_entry:nn #1#2
{
  \group_begin:
  \bool_set_false:N \l__dfg_funding_calculation_store_bool
  \__dfg_funding_capture:n {#2}
  \__dfg_funding_calculate_staff_sums:
  \tl_if_blank:VF \l__dfg_funding_cache_project_tl
  {
    \__dfg_funding_cache_sum_year:nnn {#1} {sum-year1}
      {\l__dfg_funding_cache_sum_one_tl}
    \__dfg_funding_cache_sum_year:nnn {#1} {sum-year2}
      {\l__dfg_funding_cache_sum_two_tl}
    \__dfg_funding_cache_sum_year:nnn {#1} {sum-year3}
      {\l__dfg_funding_cache_sum_three_tl}
    \__dfg_funding_cache_sum_year:nnn {#1} {sum-year4}
      {\l__dfg_funding_cache_sum_four_tl}
    \__dfg_funding_cache_sum_year:nnn {#1} {sum-year5}
      {\l__dfg_funding_cache_sum_five_tl}
    \str_if_eq:VnT \l__dfg_funding_cache_type_tl {staff}
    {
      \tl_if_blank:VF \l__dfg_funding_cache_category_tl
      {
        \__dfg_funding_cache_quantity_year:nnn {#1} {quantity-year1}
          {\l__dfg_funding_cache_quantity_one_tl}
        \__dfg_funding_cache_quantity_year:nnn {#1} {quantity-year2}
          {\l__dfg_funding_cache_quantity_two_tl}
        \__dfg_funding_cache_quantity_year:nnn {#1} {quantity-year3}
          {\l__dfg_funding_cache_quantity_three_tl}
        \__dfg_funding_cache_quantity_year:nnn {#1} {quantity-year4}
          {\l__dfg_funding_cache_quantity_four_tl}
        \__dfg_funding_cache_quantity_year:nnn {#1} {quantity-year5}
          {\l__dfg_funding_cache_quantity_five_tl}
      }
    }
  }
  \group_end:
}

\cs_new_protected:Npn \__dfg_funding_sum_set:Nnnnn #1#2#3#4#5
{
  % #1 result, #2 database, #3 project, #4 type, #5 field list
  \fp_zero:N \l__dfg_funding_cache_fp
  \clist_map_inline:nn {#5}
  {
    \tl_set:Nx \l__dfg_funding_cache_key_tl {#2/#3/#4/##1}
    \prop_get:NVNT \g__dfg_funding_sum_prop
      \l__dfg_funding_cache_key_tl \l__dfg_funding_cache_value_tl
    {
      \fp_add:Nn \l__dfg_funding_cache_fp
        { \l__dfg_funding_cache_value_tl }
    }
  }
  \tl_set:Nx #1 { \fp_to_decimal:N \l__dfg_funding_cache_fp }
}

\bool_new:N \g__dfg_document_started_bool

\AtBeginDocument
  { \bool_gset_true:N \g__dfg_document_started_bool }

\NewDocumentCommand \dfgRestoreRequestedFunding { +m }
{
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
    \__dfg_add_entry:nnn { funding } { RequestedFundingOverview } {#1}
    \__dfg_funding_cache_entry:nn { RequestedFundingOverview } {#1}
  }
}

\cs_new_protected:Npn \__dfg_requested_funding_staff_overview_ensure_schema:
{
  \DTLifdbexists { RequestedFundingStaffOverview }
  { }
  { \DTLaction [ name = RequestedFundingStaffOverview ] { new } }
  \clist_map_inline:nn
  {
    ref-project-id, funding-status, staff-type, ref-person-id,
    firstname, lastname, academic-degree, positionText, field-of-research,
    ref-institution-id, ref-affiliation-id, department, commitment, category,
    funding-source, description
  }
  {
    \DTLifhaskey { RequestedFundingStaffOverview } {##1}
    { }
    { \DTLaddcolumn { RequestedFundingStaffOverview } {##1} }
  }
}

\NewDocumentCommand \dfgRestoreRequestedFundingStaff { +m }
{
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
    \__dfg_requested_funding_staff_overview_ensure_schema:
    \__dfg_add_entry:nnn { staff } { RequestedFundingStaffOverview } {#1}
  }
}

\bool_if:NF \l__dfg_class_fastcompile_project_bool
{ \__dfg_requested_funding_staff_overview_ensure_schema: }

\cs_new_protected:Npn
  \__dfg_requested_and_existing_direct_costs_overview_ensure_schema:
{
  \DTLifdbexists { RequestedAndExistingFundingDirectCostsOverview }
  { }
  { \DTLaction [ name = RequestedAndExistingFundingDirectCostsOverview ] { new } }
  \clist_map_inline:nn
  {
    ref-project-id, ref-affiliation-id, financed-by,
    sum-year1, sum-year2, sum-year3, sum-year4, sum-year5
  }
  {
    \DTLifhaskey { RequestedAndExistingFundingDirectCostsOverview } {##1}
    { }
    { \DTLaddcolumn { RequestedAndExistingFundingDirectCostsOverview } {##1} }
  }
}

\NewDocumentCommand \dfgRestoreRequestedAndExistingFundingDirectCosts { +m }
{
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
    \__dfg_requested_and_existing_direct_costs_overview_ensure_schema:
    \__dfg_add_entry:nnn { funding }
      { RequestedAndExistingFundingDirectCostsOverview } {#1}
  }
}

\bool_if:NF \l__dfg_class_fastcompile_project_bool
{ \__dfg_requested_and_existing_direct_costs_overview_ensure_schema: }

\bool_if:NF \l__dfg_class_fastcompile_project_bool
{
  \DTLifdbexists { RequestedFundingOverview }
    { }
    {
      \DTLaction [ name = RequestedFundingOverview ] { new }
      \DTLaddcolumn { RequestedFundingOverview } { ref-project-id }
      \DTLaddcolumn { RequestedFundingOverview } { type }
      \DTLaddcolumn { RequestedFundingOverview } { category }
      \DTLaddcolumn { RequestedFundingOverview } { percentage }
      \DTLaddcolumn { RequestedFundingOverview } { quantity-year1 }
      \DTLaddcolumn { RequestedFundingOverview } { quantity-year2 }
      \DTLaddcolumn { RequestedFundingOverview } { quantity-year3 }
      \DTLaddcolumn { RequestedFundingOverview } { quantity-year4 }
      \DTLaddcolumn { RequestedFundingOverview } { quantity-year5 }
      \DTLaddcolumn { RequestedFundingOverview } { sum-year1 }
      \DTLaddcolumn { RequestedFundingOverview } { sum-year2 }
      \DTLaddcolumn { RequestedFundingOverview } { sum-year3 }
      \DTLaddcolumn { RequestedFundingOverview } { sum-year4 }
      \DTLaddcolumn { RequestedFundingOverview } { sum-year5 }
    }
}

\cs_new_protected:Npn \__dfg_cache_requested_funding:n #1
{
  \bool_if:NTF \g__dfg_document_started_bool
  {
    \iow_now:Nx \@auxout
      {
        \token_to_str:N \dfgRestoreRequestedFunding
        { \exp_not:n {#1} }
      }
  }
  { \dfgRestoreRequestedFunding{#1} }
}

\cs_new_protected:Npn \__dfg_cache_requested_funding_staff:n #1
{
  \bool_if:NTF \g__dfg_document_started_bool
  {
    \iow_now:Nx \@auxout
    {
      \token_to_str:N \dfgRestoreRequestedFundingStaff
      { \exp_not:n {#1} }
    }
  }
  { \dfgRestoreRequestedFundingStaff{#1} }
}

\cs_new_protected:Npn
  \__dfg_cache_requested_and_existing_direct_costs:n #1
{
  \bool_if:NTF \g__dfg_document_started_bool
  {
    \iow_now:Nx \@auxout
    {
      \token_to_str:N \dfgRestoreRequestedAndExistingFundingDirectCosts
      { \exp_not:n {#1} }
    }
  }
  { \dfgRestoreRequestedAndExistingFundingDirectCosts{#1} }
}

\NewDocumentCommand \addEntry { O{} m m }
{
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
  \tl_if_eq:nnTF {#1} { cv }
  { \bool_if:NTF \l__dfg_class_cv_bool
	{ \__dfg_add_entry:nnn {#1} {#2} {#3} }
  	{ \msg_warning:nnn { dfg } { cv-entry-omitted } {#2} } }
  {% default behaviour: use #2 as family if #1 is empty
   \tl_if_empty:nTF {#1}
   { \__dfg_add_entry:nnn {#2} {#2} {#3} }
   {
      \__dfg_add_entry:nnn {#1} {#2} {#3}
      \str_if_eq:nnT {#1} { funding }
        { \__dfg_funding_cache_entry:nn {#2} {#3} }
      \bool_lazy_all:nT
        {
          { \str_if_eq_p:nn {#1} { funding } }
          { \str_if_eq_p:nn {#2} { RequestedFunding } }
        }
        { \__dfg_cache_requested_funding:n {#3} }
      \bool_lazy_all:nT
        {
          { \str_if_eq_p:nn {#1} { staff } }
          { \str_if_eq_p:nn {#2} { RequestedFundingStaff } }
        }
        { \__dfg_cache_requested_funding_staff:n {#3} }
      \bool_lazy_all:nT
        {
          { \str_if_eq_p:nn {#1} { funding } }
          { \str_if_eq_p:nn {#2} { RequestedAndExistingFundingDirectCosts } }
        }
        { \__dfg_cache_requested_and_existing_direct_costs:n {#3} }
    }
  }
  }
}
\msg_new:nnn { dfg } { cv-entry-omitted }
{
  CV~entry~omitted:~no~CV~is~being~created.^^J
  Entry~data:~'#1'.
}
\str_set:Nn \tmpLocalDB {}
\NewDocumentCommand \dfgFastReference { m }
{ { \color{black-50}\ttfamily #1 } }

\cs_new_protected:Npn \__dfg_fast_clear_assignment:w #1 = #2 \q_stop
{ \cs_set:Npn #1 { } }

\cs_new_protected:Npn \__dfg_fast_clear_assignments:n #1
{
  \clist_map_inline:nn {#1}
  { \__dfg_fast_clear_assignment:w ##1 \q_stop }
}

\NewDocumentCommand{\getEntry}{s O{\tmpLocalDB} m m O{id}}
{%
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  {
    \IfBooleanTF{#1}
    { \__dfg_fast_clear_assignments:n {#4} }
    { \dfgFastReference{#3} }
  }
  {
    \IfBooleanTF{#1}
    { \__dfg_get_entry_multi:nnnn  {#2}{#3}{#4}{#5} }
    { \__dfg_get_entry_single:nnnn {#2}{#3}{#4}{#5} }%
  }
}

\cs_new_protected:Nn \__dfg_get_entry_single:nnnn
{
  % #1 db, #2 id-value, #3 field, #4 id-column
  \tl_if_blank:nTF {#1}
  { \msg_warning:nne {dfg}{database-name-not-given}{#2-/-#3} }
  {%
  	\DTLifdbexists{#1}
  	{%
  		\DTLgetvalueforkey{\thevalue}{#3}{#1}{#4}{#2}%
  		\DTLifnullorempty{\thevalue}
  		{%
  			\bool_if:NF \lTblrMeasuringBool
  			{ \msg_warning:nneee {dfg}{missing-key}{#1}{#2}{#3} }%
  		}
  		{ \dfgShowTag{#2}{#3}{\thevalue}[#1] }%
  	}
  	{ \msg_warning:nne {dfg}{database-not-found}{#1} }%
  }%
}

\cs_new_protected:Nn \__dfg_get_entry_multi:nnnn
{
  \tl_if_blank:nTF {#1}
  { \msg_warning:nne {dfg}{database-name-not-given}{#2-/-multi} }
  {%
  	\tl_set:Nx \l_tmpa_tl {#1}%
  	\tl_set:Nx \l_tmpb_tl {#2}%
  	\DTLifdbexists{\l_tmpa_tl}
  	{%
  		% \typeout{DEBUG:~about~to~assign~from~\l_tmpa_tl~for~id~\l_tmpb_tl}%
  		\use:x
  		{
  			\exp_not:N \DTLassignfirstmatch
  			{ \exp_not:V \l_tmpa_tl }
  			{ \exp_not:n {#4} }
  			{ \exp_not:V \l_tmpb_tl }
  			{ \exp_not:n {#3} }
  		}%
  		% \typeout{DEBUG:~done.~theLastName~=~\theLastName}%
  	}
  	{ \msg_warning:nne {dfg}{database-not-found}{\l_tmpa_tl} }%
  }%
}

\cs_new_protected:Npn \__dfg_check_empty:w #1 = #2 \q_stop #3#4
{
  % #1: target macro tokens, #2: field name, #3: db, #4: id
  \exp_args:NV \DTLifnullorempty #1
  { \msg_warning:nneee {dfg}{missing-key}{#3}{#4}{#2} }
  { }%
}

\cs_new_protected:Nn \__dfg_check_empty:nnn
{
  % #1 db, #2 id, #3 single "\macro = field" pair
  \__dfg_check_empty:w #3 \q_stop {#1}{#2}%
}

\NewDocumentCommand{\getName}{m}{\getEntry[person]{#1}{lastname}}
\NewDocumentCommand{\getFullName}{s m}
{%
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  { \dfgFastReference{#2} }
  {
  % #1: starred -> include academic degree
  % #2: person id
  \getEntry*[person]{#2}{
  	\theAcademicDegree = academicdegree,
  	\theFirstName      = firstname,
  	\theLastName       = lastname
  }%
  \IfBooleanT{#1}
  {
    \DTLifnullorempty{\theAcademicDegree}{}
      {\dfgShowTag{#2}{academicdegree}{\theAcademicDegree}[person]\space}
  }%
  \dfgShowTag{#2}{firstname}{\theFirstName}[person]\space
  \dfgShowTag{#2}{lastname}{\theLastName}[person]
  }
}
\cs_new_protected:Npn \dfg_compare_entry:nnnnnn #1#2#3#4#5#6
{
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  {#6}
  {
  \tl_if_blank:nTF {#1}
  { \msg_warning:nnn { dfg } { database-name-not-given } {#1} }
  {
  	\DTLifdbexists{#1}
  	{
  		\DTLgetvalueforkey{\thevalue}{#3}{#1}{id}{#2}%
  		\str_if_eq:eeTF { \thevalue } {#4}
  		{#5}
  		{#6}
  	}
  	{ \msg_warning:nnn { dfg } { database-not-found } {#1} }
  }
  }
}

\NewDocumentCommand \compareEntry { O{\tmpLocalDB} m m m m m }
{
  \dfg_compare_entry:nnnnnn {#1}{#2}{#3}{#4}{#5}{#6}
}

\tl_new:N \l_tblr_body_tl                % token list that will hold the rows

\bool_new:N \l__dfg_former_project_compact_bool
\bool_new:N \g__dfg_former_project_seen_bool

\cs_new_protected:Npn \__dfg_former_project_note:
{
  \par\smallskip
  \noindent
  {\normalfont\normalcolor\footnotesize
    \textsuperscript{*}\,Former~project}\par
}

\cs_new_protected:Npn \__dfg_former_project_context:n #1
{
  \bool_set_true:N \l__dfg_former_project_compact_bool
  % Table cells and list implementations introduce their own groups, so the
  % occurrence flag must be latched globally for the duration of this context.
  \bool_gset_false:N \g__dfg_former_project_seen_bool
  #1
  \bool_if:NT \g__dfg_former_project_seen_bool
    { \__dfg_former_project_note: }
  \bool_set_false:N \l__dfg_former_project_compact_bool
  \bool_gset_false:N \g__dfg_former_project_seen_bool
}

\cs_new_protected:Npn \__dfg_print_thing:nnnn #1#2#3#4 {
  \bool_if:NTF \l__dfg_class_fastcompile_bool
  { \__dfg_print_thing_skipped:nn {#1} {#3} }
  {%
    \__dfg_former_project_context:n
    {
      #4%
      \StartTimer
      \__dfg_print_thing_call:nnn {#1} {#2} {#3}%
      \StopTimer { \__dfg_print_thing_label:n {#3} }%
    }
  }
}

\cs_new_protected:Npn \__dfg_print_thing_call:nnn #1#2#3 {
  \tl_if_head_is_group:nTF {#3}
  { \__dfg_print_thing_split:nnw {#1} {#2} #3 \empty \q_stop }
  { \cs:w #3 #1 \cs_end: #2 }
}

\cs_new_protected:Npn \__dfg_print_thing_split:nnw #1#2#3#4 \q_stop {
  \cs:w #3 #1 \cs_end: #2 #4
}

\cs_new:Npn \__dfg_print_thing_label:n #1 {
  \tl_if_head_is_group:nTF {#1}
  { \__dfg_print_thing_label_aux:w #1 \empty \q_stop }
  { #1 }
}

\cs_new:Npn \__dfg_print_thing_label_aux:w #1#2 \q_stop {
  #1 \tl_if_blank:nF {#2} { - \__dfg_print_thing_label_tail:n {#2} }
}

\cs_new:Npn \__dfg_print_thing_label_tail:n #1 {
  \tl_if_head_eq_charcode:nNTF {#1} [
    { \__dfg_print_thing_label_skip_optional:w #1 \q_stop }
    { \tl_head:n {#1} }
}

\cs_new:Npn \__dfg_print_thing_label_skip_optional:w [#1]#2 \q_stop {
  \tl_head:n {#2}
}

\cs_new_protected:Npn \__dfg_print_thing_skipped:nn #1#2 {
  \dfgItemSkipped { \__dfg_print_thing_label:n {#2} #1 }
}

\NewDocumentCommand{\printTable}{ o +m }{%
  \IfNoValueTF {#1}
  { \__dfg_print_thing:nnnn { Table } { } {#2} { \setcounter{rowNumber}{0} } }
  { \__dfg_print_thing:nnnn { Table } { [#1] } {#2} { \setcounter{rowNumber}{0} } }%
}

\NewDocumentCommand{\printList}{ o +m }{%
  \IfNoValueTF {#1}
  { \__dfg_print_thing:nnnn { List } { } {#2} { } }
  { \__dfg_print_thing:nnnn { List } { [#1] } {#2} { } }%
}

\NewDocumentCommand{\printPlot}{ o +m }{%
  \IfNoValueTF {#1}
  { \__dfg_print_thing:nnnn { Plot } { } {#2} { } }
  { \__dfg_print_thing:nnnn { Plot } { [#1] } {#2} { } }%
}

\newcounter{rowNumber}

\NewDocumentCommand{\dfgPLInstitutionList}{m}{%
  \dfgInstitutionList{#1}[abbreviation]%
}

\int_new:N \l__dfg_pl_iter_int

\cs_new_protected:Npn \__dfg_pi_target:n #1
  { \hypertarget{pi:#1}{} }

\NewDocumentCommand{\ProjectLeadersTable}{}{%
  \def\tblrbody{}%

  \StartTimer
  \DTLsort*{lastname}{person}%
  \StopTimer{ProjectLeaderTable-sort}

  \int_zero:N \l__dfg_pl_iter_int

  \StartTimer
  \DTLforeach*[
  	\DTLisinlist{\theFundingPeriodNumeral}{\period}
  	\and
  	\DTLisinlist{PI}{\role}
  ]{person}{
  	\id              = id,
  	\role            = role,
  	\lastname        = lastname,
  	\firstname       = firstname,
  	\academicdegree  = academicdegree,
  	\period          = period,
  	\refProjectId    = ref-project-id,
  	\refInstitutionId = ref-institution-id,
  	\doctorateYear   = doctorateYear,
  	\gender          = gender
  }{%
  	\int_incr:N \l__dfg_pl_iter_int
  	\protected@edef\tblrbody{\tblrbody
		{\noexpand\__dfg_pi_target:n{\id}%
		 {\noexpand{\color{referencePI}\bfseries
        \noexpand\dfgShowTag{\id}{lastname}{\lastname}[person]},~
        \noexpand\dfgShowTag{\id}{firstname}{\firstname}[person]}
        \noexpand\\
        \noexpand\dfgShowTag{\id}{academicdegree}{\academicdegree}[person]}
      \noexpand& \noexpand\dfgShowTag{\id}{gender}{\gender}[person]
      \noexpand& \noexpand\dfgShowTag{\id}{doctorateYear}{\doctorateYear}[person]
  		\noexpand& {\noexpand\dfgPLInstitutionList{\id}}
  		\noexpand& \noexpand\getProject{\refProjectId}
  		\noexpand\\
  	}%
  }
  \StopTimer{PL-loop}
  \iow_term:x { PL-iterations:~ \int_use:N \l__dfg_pl_iter_int }

  \StartTimer
  \begin{tblr}[
  		theme  = main,
  		expand = \tblrbody,
  		long
  	]{
  		colspec   = {t{3.5cm}t{1cm}t{1.6cm}X[t]t{1.3cm}},
  		column{1} = { fg = referencePI, halign = l },
  		column{2} = { halign = c },
  		column{3} = { halign = c },
  		column{4} = { halign = l },
  		column{5} = { halign = c },
  		rowhead   = 1,
  		row{1}    = {
  			            bg     = tableHeadingsBG,
  			            fg     = tableHeadingsFont,
  			            font   = \footnotesize\bfseries,
  			            halign = c,
  			            valign = t,
  			            guard
  		            },
  	}
  	Project~ leader
  	 & Gender
  	 & {Doctorate          \\ obtained~ in}
  	 & {Home~ institution, \\ location}
  	 & Project(s)                           \\
  	\tblrbody
  \end{tblr}
  \StopTimer{PL-render}
}
\prop_new:N \l__dfg_inst_to_aff_prop
\prop_new:N \l__dfg_inst_name_prop
\prop_new:N \l__dfg_inst_seen_prop
\prop_new:N \l__dfg_aff_seen_prop
\prop_new:N \l__dfg_aff_to_insts_prop  % values are seq names (tl)
\prop_new:N \l__dfg_aff_name_prop
\seq_new:N  \l__dfg_affiliations_seq
\seq_new:N  \l__dfg_aff_sort_seq
\seq_new:N  \l__dfg_inst_sort_seq
\tl_new:N   \l__dfg_output_tl
\tl_new:N   \l__dfg_aff_label_tl
\int_new:N  \l__dfg_seq_counter_int
\cs_generate_variant:Nn \seq_set_from_clist:Nn { Ne , NV }

\cs_new_protected:Npn \__dfg_append_inst:nn #1#2 {
  \prop_get:NnNTF \l__dfg_aff_to_insts_prop {#1} \l_tmpd_tl
  {%
  	% \l_tmpd_tl now holds the seq's csname; append to it
  	\seq_put_right:cn { \l_tmpd_tl } {#2}%
  }
  {%
  	\int_incr:N \l__dfg_seq_counter_int
  	\tl_set:Nx \l_tmpd_tl
  	{ l__dfg_inst_seq_ \int_use:N \l__dfg_seq_counter_int _seq }%
  	\seq_new:c { \l_tmpd_tl }%
  	\seq_put_right:cn { \l_tmpd_tl } {#2}%
  	\prop_put:NnV \l__dfg_aff_to_insts_prop {#1} \l_tmpd_tl
  }
}
\cs_generate_variant:Nn \__dfg_append_inst:nn { VV }

\cs_new_protected:Npn \__dfg_collect_pi_institution:n #1
{
  \tl_if_blank:nF {#1}
  {
  	\prop_if_in:NnF \l__dfg_inst_seen_prop {#1}
  	{%
  		\prop_put:Nnn \l__dfg_inst_seen_prop {#1} {1}%
  		\prop_get:NnNT \l__dfg_inst_to_aff_prop {#1} \l_tmpb_tl
  		{%
  			\prop_get:NnNT \l__dfg_inst_name_prop {#1} \l_tmpc_tl
        {
          \tl_set:Ne \l_tmpe_tl
          {
            \exp_not:N \dfgShowTag {#1}{name}
              {\exp_not:V \l_tmpc_tl}[institution]
          }
          \__dfg_append_inst:VV \l_tmpb_tl \l_tmpe_tl
        }%
  			\prop_if_in:NVF \l__dfg_aff_seen_prop \l_tmpb_tl
  			{%
  				\prop_put:NVn \l__dfg_aff_seen_prop \l_tmpb_tl {1}%
  				\seq_put_right:NV \l__dfg_affiliations_seq \l_tmpb_tl
  			}%
  		}%
  	}%
  }
}

\NewDocumentCommand{\ParticipatingInstitutionsList}{ O{count} }
{%
  % #1: alpha: affiliations are ordered alphabetically
  % #1: count: by count
  \prop_clear:N \l__dfg_inst_to_aff_prop
  \prop_clear:N \l__dfg_inst_name_prop
  \prop_clear:N \l__dfg_inst_seen_prop
  \prop_clear:N \l__dfg_aff_seen_prop
  \prop_clear:N \l__dfg_aff_to_insts_prop
  \seq_clear:N  \l__dfg_affiliations_seq
  \tl_clear:N   \l__dfg_output_tl
  \int_zero:N   \l__dfg_seq_counter_int

  % --- 1. One pass over institution: id -> aff-id, id -> name ---------
  \DTLforeach*{institution}{
  	\l_tmpa_tl = id,
  	\l_tmpb_tl = ref-affiliation-id,
  	\l_tmpc_tl = name
  }{%
  	\prop_put:NVV \l__dfg_inst_to_aff_prop \l_tmpa_tl \l_tmpb_tl
  	\prop_put:NVV \l__dfg_inst_name_prop   \l_tmpa_tl \l_tmpc_tl
  }

  % --- 2. One pass over person: collect active PI institutions --------
  \DTLforeach*[
  	\DTLisinlist{\theFundingPeriodNumeral}{\pPeriod} \and
  	\DTLisinlist{PI}{\pRole}
  ]{person}{ \l_tmpa_tl = ref-institution-id ,\pPeriod=period,\pRole=role}{%
  	\seq_set_from_clist:NV \l_tmpa_seq \l_tmpa_tl
  	\seq_map_inline:Nn \l_tmpa_seq
  	{ \__dfg_collect_pi_institution:n {##1} }%
  }

  % --- 3a. Precompute affiliation display names ----------------------
  \prop_clear:N \l__dfg_aff_name_prop
  \seq_map_inline:Nn \l__dfg_affiliations_seq {%
  	\getEntry*[affiliation]{##1}{ \l_tmpa_tl = name }%
  	\prop_put:NnV \l__dfg_aff_name_prop {##1} \l_tmpa_tl
  }

  % --- 3b. Sort affiliations according to requested order ------------
  \str_case:nnF {#1}
  {
  	{ alpha }
  	{%
  		\seq_sort:Nn \l__dfg_affiliations_seq
  		{%
  			\prop_get:NnN \l__dfg_aff_name_prop {##1} \l_tmpa_tl
  			\prop_get:NnN \l__dfg_aff_name_prop {##2} \l_tmpb_tl
  			\str_compare:eNeTF { \l_tmpa_tl } < { \l_tmpb_tl }
  				{ \sort_return_same: }
  				{ \sort_return_swapped: }%
  		}%
  	}
  	{ count }
  	{%
  		\seq_sort:Nn \l__dfg_affiliations_seq
  		{%
  			\prop_get:NnN \l__dfg_aff_to_insts_prop {##1} \l_tmpc_tl
  			\prop_get:NnN \l__dfg_aff_to_insts_prop {##2} \l_tmpd_tl
  			\int_compare:nNnTF
  			{ \seq_count:c { \l_tmpc_tl } } > { \seq_count:c { \l_tmpd_tl } }
  				{ \sort_return_same: }
  				{%
  					\int_compare:nNnTF
  					{ \seq_count:c { \l_tmpc_tl } } < { \seq_count:c { \l_tmpd_tl } }
  						{ \sort_return_swapped: }
  						{%
  							% equal counts → alphabetical tiebreak
  							\prop_get:NnN \l__dfg_aff_name_prop {##1} \l_tmpa_tl
  							\prop_get:NnN \l__dfg_aff_name_prop {##2} \l_tmpb_tl
  							\str_compare:eNeTF { \l_tmpa_tl } < { \l_tmpb_tl }
  								{ \sort_return_same: }
  								{ \sort_return_swapped: }%
  						}%
  				}%
  		}%
  	}
  }
  {%
  	\msg_warning:nnn { __dfg } { unknown-order }
  	{ Unknown~order~'#1';~using~'alpha'. }%
  	\seq_sort:Nn \l__dfg_affiliations_seq
  	{%
  		\prop_get:NnN \l__dfg_aff_name_prop {##1} \l_tmpa_tl
  		\prop_get:NnN \l__dfg_aff_name_prop {##2} \l_tmpb_tl
  		\str_compare:eNeTF { \l_tmpa_tl } < { \l_tmpb_tl }
  			{ \sort_return_same: }
  			{ \sort_return_swapped: }%
  	}%
  }

  % --- 4. Emit output -------------------------------------------------
  \bool_set_true:N \l_tmpa_bool
  \seq_map_inline:Nn \l__dfg_affiliations_seq {%
  	\bool_if:NTF \l_tmpa_bool
  	{ \bool_set_false:N \l_tmpa_bool }
  	{ \tl_put_right:Nn \l__dfg_output_tl {\par} }%
  	\getEntry*[affiliation]{##1}{
  		\theAffName     = name,
  		\theAffLocation = location
  	}%
  	\prop_get:NnN \l__dfg_aff_to_insts_prop {##1} \l_tmpd_tl
  	\seq_set_eq:Nc \l__dfg_inst_sort_seq { \l_tmpd_tl }%
  	\seq_sort:Nn \l__dfg_inst_sort_seq
  	{%
  		\str_compare:nNnTF {####1} < {####2}
  			{ \sort_return_same: }
  			{ \sort_return_swapped: }%
  	}%
  	\tl_set:Nx \l__dfg_aff_label_tl { \seq_use:Nn \l__dfg_inst_sort_seq {\\} }%
  	\tl_put_right:Nx \l__dfg_output_tl {%
  		{ \exp_not:N \usekomafont{subsubsection}
        \exp_not:N \dfgShowTag {##1}{name}
          {\exp_not:V \theAffName}[affiliation]
        \exp_not:n {\space(}
        \exp_not:N \dfgShowTag {##1}{location}
          {\exp_not:V \theAffLocation}[affiliation]
        \exp_not:n {)\\} }%
  		\exp_not:V \l__dfg_aff_label_tl \exp_not:n {\\}%
  	}%
  }
  \tl_use:N \l__dfg_output_tl
}

\NewDocumentCommand{\getPersonInformation}{O{person} m}
{%
  % #1: database
  % #2: comma-separated list of person ids
  \def\tmpLocalDB{#1}%
  \seq_clear:N \l_tmpa_seq
  \seq_set_from_clist:Ne \l_tmpa_seq {#2}%
  \bool_if:NTF \l__dfg_project_one_PI_bool
  {%
  	% Single-PI mode: no boxing, just emit each entry inline
  	\bool_set_true:N \l_tmpa_bool
  	\seq_map_inline:Nn \l_tmpa_seq
  	{%
  		\bool_if:NTF \l_tmpa_bool
  		{ \bool_set_false:N \l_tmpa_bool }
  		{ ~ }%
  		\__getperson_one:n {##1}%
  	}%
  }
  {%
  	% Multi-PI mode: lay out as a 2-column raster
  	\begin{tcbraster}[
  			raster~ columns=2,
  			raster~ equal~ height=rows,
  			raster~ column~ skip=4pt,
  			raster~ row~ skip=10pt,
  			PIbox
  		]
  		\seq_map_inline:Nn \l_tmpa_seq
  		{%
  			\__getperson_one:n {##1}%
  		}%
  	\end{tcbraster}
  }%
}

\cs_new_protected:Npn \__getperson_one:n #1
{%
  \getEntry*[\tmpLocalDB]{#1}{
  	\theFirstName      = firstname,
  	\theLastName       = lastname,
  	\theAcademicDegree = academicdegree,
  	\thePhone          = phone,
  	\theEmail          = email,
    \theInstitution    = ref-institution-id,
  	\theORCiD         = orcid
  }%
  \begin{tcolorbox}[PIbox,title={
          \dfgShowTag{#1}{firstname}{\theFirstName}[\tmpLocalDB]\space
  				\color{referencePI}\bfseries
          \dfgShowTag{#1}{lastname}{\theLastName}[\tmpLocalDB]
  				\normalfont\normalcolor,\newline
          \dfgShowTag{#1}{academicdegree}{\theAcademicDegree}[\tmpLocalDB]}]
  	\ifdefempty{\theORCiD}{\mbox{~}\\[.75\baselineskip]}{\getORCiD{#1}\\}
  	\ifdefempty{\theInstitution}{}{\dfgInstitutionList{#1}\newline}
    \ifdefempty{\thePhone}{}
      {\faPhone\space\dfgShowTag{#1}{phone}{\thePhone}[\tmpLocalDB]\\}
    \ifdefempty{\theEmail}{}
      {\faEnvelope\space\dfgShowTag{#1}{email}{\theEmail}[\tmpLocalDB]}
  \end{tcolorbox}
}


\prop_new:N \g__dfg_proj_pi_prop
\bool_new:N \g__dfg_proj_pi_built_bool
\prop_new:N \g__dfg_aff_narrow_prop
\prop_new:N \g__dfg_inst_narrow_prop

\NewDocumentCommand{\dfgPIformat}{mmm}{%
  % #1 = person id, #2 = firstname, #3 = lastname
  \dfgShowTag{#1}{firstname}{#2}[person]\space
  {\color{referencePI}\bfseries
    \dfgShowTag{#1}{lastname}{#3}[person],}\space
}

\cs_new_protected:Npn \__dfg_proj_pi_build: {
  \bool_if:NF \g__dfg_proj_pi_built_bool {
  	\bool_gset_true:N \g__dfg_proj_pi_built_bool

  	% Pass 1+2: Institution-Strings vorberechnen (wie vorher)
  	\prop_new:N \l__dfg_aff_narrow_prop
  	\DTLforeach*{affiliation}{
  		\l_tmpa_tl = id,
  		\l_tmpb_tl = name
  	}{%
  		\prop_put:NVV \l__dfg_aff_narrow_prop \l_tmpa_tl \l_tmpb_tl
  	}

  \prop_new:N \l__dfg_inst_narrow_prop
  \DTLforeach*{institution}{
  		\l_tmpa_tl = id,
  		\l_tmpb_tl = name,
  		\l_tmpc_tl = ref-affiliation-id
  	}{%
		\__dfg_institution_abbreviation_or_name:nN
		  { \l_tmpa_tl } \l_tmpf_tl
  		\prop_get:NVNT \l__dfg_aff_narrow_prop \l_tmpc_tl \l_tmpd_tl {%
  			\tl_set:Nx \l_tmpe_tl
			{
          \exp_not:N \dfgShowTag
            {\exp_not:V \l_tmpa_tl}
            {\exp_not:V \l__dfg_institution_label_field_tl}
            {\exp_not:V \l_tmpf_tl}[institution]
          ,~
          \exp_not:N \dfgShowTag
            {\exp_not:V \l_tmpc_tl}{name}
            {\exp_not:V \l_tmpd_tl}[affiliation]
        }
  			\prop_put:NVV \l__dfg_inst_narrow_prop \l_tmpa_tl \l_tmpe_tl
  		}
  	}

  	% Pass 3: per Person die ganze Zelle vorberechnen, mit \dfgPIformat
  	\DTLforeach*{person}{
  		\l_tmpa_tl = id,
  		\l_tmpb_tl = firstname,
  		\l_tmpc_tl = lastname,
  		\l_tmpd_tl = ref-institution-id
  	}{%
  		\tl_clear:N \l_tmpe_tl
  		\tl_put_right:Nx \l_tmpe_tl {%
  			\exp_not:N \dfgPIformat
        { \exp_not:V \l_tmpa_tl }
  			{ \exp_not:V \l_tmpb_tl }
  			{ \exp_not:V \l_tmpc_tl }%
  		}%
  		% Institutions, separator ";~"
  		\seq_set_from_clist:NV \l_tmpa_seq \l_tmpd_tl
  		\bool_set_true:N \l_tmpa_bool
  		\seq_map_inline:Nn \l_tmpa_seq {%
  			\bool_if:NTF \l_tmpa_bool
  			{ \bool_set_false:N \l_tmpa_bool }
  			{ \tl_put_right:Nn \l_tmpe_tl { ;~ } }%
  			\prop_get:NnNT \l__dfg_inst_narrow_prop {##1} \l_tmpf_tl
  			{ \tl_put_right:NV \l_tmpe_tl \l_tmpf_tl }%
  		}
  		\prop_gput:NVV \g__dfg_proj_pi_prop \l_tmpa_tl \l_tmpe_tl
  	}
  }
}

\NewDocumentCommand{\dfgFastPIinProjectsTable}{m}{%
  \__dfg_proj_pi_build:
  \seq_set_from_clist:Nn \l_tmpa_seq {#1}%
  \bool_set_true:N \l_tmpa_bool
  \seq_map_inline:Nn \l_tmpa_seq {%
  	\bool_if:NTF \l_tmpa_bool
  	{ \bool_set_false:N \l_tmpa_bool }
  	{ \newline }%
  	\prop_get:NnNT \g__dfg_proj_pi_prop {##1} \l_tmpb_tl
  	{ \tl_use:N \l_tmpb_tl }%
  }
}

\NewDocumentCommand{\dfgPIinProjectsTable}{O{person} m}
{%
  % #1: database
  % #2: comma-separated list of person ids
  \def\tmpLocalDB{#1}%
  \seq_clear:N \l_tmpa_seq
  \seq_set_from_clist:Nn \l_tmpa_seq {#2}%
  \bool_set_true:N \l_tmpa_bool
  \seq_map_inline:Nn \l_tmpa_seq
  {%
  	\bool_if:NTF \l_tmpa_bool
  	{ \bool_set_false:N \l_tmpa_bool }
  	{ \newline }%
  	\__pi_in_projects_one:n {##1}%
  }%
}

\cs_new_protected:Npn \__pi_in_projects_one:n #1
{%
  \getEntry*[\tmpLocalDB]{#1}{
  	\theAcademicDegree = academicdegree,
  	\theFirstName = firstname,
  	\theLastName  = lastname
  }%
  \group_begin:
  %%\theAcademicDegree\space%
  \dfgShowTag{#1}{firstname}{\theFirstName}[\tmpLocalDB]\space
  \color{referencePI}\bfseries
  \dfgShowTag{#1}{lastname}{\theLastName}[\tmpLocalDB],\space
  \normalfont\normalcolor
  \dfgInstitutionList{#1}[abbreviation,noaddress,nolocation,nozip,narrow]%
  \group_end:
}
\NewDocumentCommand{\ProjectsTable}{mm}
{%
  \def\tblrbody{}%
  \clist_clear:N \l__dfg_research_area_clist
  \tl_clear:N    \l_tmpa_tl
  \clist_clear:N \l_tmpa_clist
  \seq_clear:N   \l_tmpb_seq
  \seq_clear:N   \l_tmpa_seq

  \StartTimer
  \DTLsort{number}{project}%
  \StopTimer{Proj-#1-sort}

  \int_zero:N \l_tmpa_int

  \StartTimer
  \DTLforeach*[
  	\DTLisPrefix{\pNumber}{#1}
    \and
    \not\DTLiseq{\pConsiderForLists}{false}
  ]{project}{
  	\pID          = id,
  	\pNumber      = number,
  	\pName        = name,
  	\pStatus      = project-status,
  	\pType        = project-type,
    \pConsiderForLists = consider-for-lists,
  	\l_tmpa_clist = research-area,
  	\pRefPersonId = ref-person-id
  }{%
  	\int_incr:N \l_tmpa_int
  	% --- reset ALL flags each iteration ---------------------------------
  	\bool_set_false:N \l__dfg_project_type_research_bool
  	\bool_set_false:N \l__dfg_project_type_service_bool
  	\bool_set_false:N \l__dfg_project_type_mgk_bool
  	\bool_set_false:N \l__dfg_project_type_admin_bool

  	\bool_set_false:N \l__dfg_project_status_N_bool
  	\bool_set_false:N \l__dfg_project_status_E_bool
  	\bool_set_false:N \l__dfg_project_status_C_bool

  	\str_case:Vn {\pStatus}
  	{
  		{N}{ \bool_set_true:N \l__dfg_project_status_N_bool }
  		{E}{ \bool_set_true:N \l__dfg_project_status_E_bool }
  		{C}{ \bool_set_true:N \l__dfg_project_status_C_bool }
  	}

  	\str_case:Vn {\pType}{
  		{research}{ \bool_set_true:N \l__dfg_project_type_research_bool }
  		{service} { \bool_set_true:N \l__dfg_project_type_service_bool  }
  		{mgk}     { \bool_set_true:N \l__dfg_project_type_mgk_bool      }
  		{admin}   { \bool_set_true:N \l__dfg_project_type_admin_bool    }
  	}

  	\bool_if:nT
  	{ \l__dfg_project_type_research_bool && ! \l__dfg_project_status_E_bool }
  	{%
  		\clist_sort:Nn \l_tmpa_clist
  		{ \fp_compare:nTF {##1 < ##2} {\sort_return_swapped:} {\sort_return_same:} }%
  		\seq_set_from_clist:NN \l_tmpa_seq \l_tmpa_clist
  		\seq_set_map:NNn \l_tmpb_seq \l_tmpa_seq
  		{%
  			\prop_if_in:NnTF \g__dfg_dfg_research_areas_prop {##1}
  			{ ##1 }
  			{ \textcolor{error}{\textbf{##1}} }%
  		}%
  	}

  	\protected@edef\tblrbody{\tblrbody
      \noexpand\getProject{\pID}
      & {\noexpand\dfgShowTag{\pID}{project-status}{\pStatus}[project]}
      & \noexpand\dfgShowTag{\pID}{name}{\pName}[project]
  		&
  		\bool_if:nT
  		{ \l__dfg_project_type_research_bool && ! \l__dfg_project_status_E_bool }
      {{\noexpand\dfgShowTag{\pID}{research-area}
          {\seq_use:Nn \l_tmpb_seq {\\}}[project]}}
  		& \dfgFastPIinProjectsTable{\pRefPersonId}
  		\\
  	}%
  }
  \StopTimer{Proj-#1-loop}
  \iow_term:x { Proj-#1-iterations:~ \int_use:N \l_tmpa_int }

  \StartTimer
  \begin{tblr}[
  		theme   = main,
  		expand  = \tblrbody,
  		caption = {Project~area~#1~--~#2},
  		long
  	]{
  		colspec     = {t{1.1cm}t{0.7cm}X[t]t{1.2cm}X[t]},
  		rowhead     = 1,
  		column{2,4} = {halign=c},
  		column{1}   = {font=\Large\bfseries, fg=tableFirstColumn},
  		column{3,5} = {font=\footnotesize\raggedright},
  		row{1}      = {
  			              bg     = tableHeadingsBG,
  			              fg     = tableHeadingsFont,
  			              font   = \footnotesize\bfseries,
  			              halign = c,
  			              valign = t,
  			              guard
  		              },
  	}
  	Project
  	 & {Status}
  	 & Title
  	 & {\mbox{Research}                                               \\area}
  	 & Project\space leader(s),\space institute(s),\space location(s)         \\
  	\tblrbody
  \end{tblr}
  \StopTimer{Proj-#1-render}
}
\tl_new:N  \l__dfg_project_overview_body_tl
\tl_new:N  \l__dfg_project_overview_ending_body_tl
\tl_new:N  \l__dfg_project_overview_id_tl
\tl_new:N  \l__dfg_project_overview_number_tl
\tl_new:N  \l__dfg_project_overview_name_tl
\tl_new:N  \l__dfg_project_overview_status_tl
\tl_new:N  \l__dfg_project_overview_consider_for_lists_tl
\tl_new:N  \l__dfg_project_overview_person_ids_tl
\tl_new:N  \l__dfg_project_overview_leaders_tl
\tl_new:N  \l__dfg_project_overview_project_cell_tl
\seq_new:N \l__dfg_project_overview_person_seq

\cs_new_protected:Npn \__dfg_project_overview_set_leaders:n #1
{
  \tl_clear:N \l__dfg_project_overview_leaders_tl
  \seq_set_from_clist:Nn \l__dfg_project_overview_person_seq {#1}
  \seq_map_indexed_inline:Nn \l__dfg_project_overview_person_seq
  {
    \DTLgetvalueforkey{\l_tmpa_tl}{firstname}{person}{id}{##2}
    \DTLgetvalueforkey{\l_tmpb_tl}{lastname}{person}{id}{##2}
    \int_compare:nNnT {##1} > {1}
      { \tl_put_right:Nn \l__dfg_project_overview_leaders_tl { \newline } }
    \tl_if_blank:VF \l_tmpa_tl
    {
      \tl_put_right:Ne \l__dfg_project_overview_leaders_tl
      {
        \exp_not:N \dfgShowTag {##2}{firstname}
          {\exp_not:V \l_tmpa_tl}[person]
        \exp_not:N \space
      }
    }
    \tl_put_right:Ne \l__dfg_project_overview_leaders_tl
    {
      \exp_not:N \hyperlink { pi:\exp_not:n {##2} }
      {
        \exp_not:N \textbf
        {
          \exp_not:N \color { referencePI }
          \exp_not:N \dfgShowTag {##2}{lastname}
            {\exp_not:V \l_tmpb_tl}[person]
        }
      }
    }
  }
}

\cs_new_protected:Npn \__dfg_project_overview_append_row:N #1
{
  \exp_args:NV \__dfg_project_overview_set_leaders:n
    \l__dfg_project_overview_person_ids_tl
  \tl_set:Ne \l__dfg_project_overview_project_cell_tl
  {
    \exp_not:N \getProject
      { \exp_not:V \l__dfg_project_overview_id_tl }
  }
  \str_if_eq:VnF \l__dfg_project_overview_status_tl { C }
  {
    \tl_if_blank:VF \l__dfg_project_overview_status_tl
    {
      \tl_put_right:Ne \l__dfg_project_overview_project_cell_tl
      {
        \exp_not:N \,
        \exp_not:N \dfgShowTag
          {\exp_not:V \l__dfg_project_overview_id_tl}{project-status}
          {\exp_not:V \l__dfg_project_overview_status_tl}[project]
      }
    }
  }
  \tl_put_right:Ne #1
  {
    { \exp_not:V \l__dfg_project_overview_project_cell_tl }
    & {
      \exp_not:N \dfgShowTag
        {\exp_not:V \l__dfg_project_overview_id_tl}{name}
        {\exp_not:V \l__dfg_project_overview_name_tl}[project]
    }
    & { \exp_not:V \l__dfg_project_overview_leaders_tl }
    \exp_not:N \\
  }
}

\cs_new_protected:Npn \__dfg_project_overview_collect:
{
  \DTLsort{number}{project}
  \DTLforeach*{project}
  {
    \l__dfg_project_overview_id_tl         = id,
    \l__dfg_project_overview_number_tl     = number,
    \l__dfg_project_overview_name_tl       = name,
    \l__dfg_project_overview_status_tl     = project-status,
    \l__dfg_project_overview_consider_for_lists_tl = consider-for-lists,
    \l__dfg_project_overview_person_ids_tl = ref-person-id
  }
  {
    \str_if_eq:VnF \l__dfg_project_overview_consider_for_lists_tl { false }
    {
      \str_if_eq:VnTF \l__dfg_project_overview_status_tl { E }
        { \__dfg_project_overview_append_row:N \l__dfg_project_overview_ending_body_tl }
        { \__dfg_project_overview_append_row:N \l__dfg_project_overview_body_tl }
    }
  }
  \tl_put_right:NV \l__dfg_project_overview_body_tl
    \l__dfg_project_overview_ending_body_tl
}

\cs_new_protected:Npn \__dfg_project_overview_typeset:
{
  \par\vspace*{-5\baselineskip}
  \begin{center}
    \crcLogo[height=1cm]
  \end{center}
  \enlargethispage{3\baselineskip}
  \begin{tblr}[
    theme  = main,
    expand = \l__dfg_project_overview_body_tl
  ]{
    vspan       = even,
    rowsep      = 1pt,
    rows        = {ht=2\baselineskip,valign=m},
    colspec     = {m{1.5cm}X[m]m{4cm}},
    rowhead     = 1,
	column{1}   = {font=\Large\bfseries, fg=tableFirstColumn},
    column{2,3} = {font=\raggedright},
    row{1} = {font=\large\bfseries,fg=tableHeadingsFont},
  }
    Project
    & Title
    & Project\space leader(s) \\
    \l__dfg_project_overview_body_tl
  \end{tblr}
}

\NewDocumentCommand{\projectOverviewTable}{}
{
  \group_begin:
  \DTLifdbexists{project}
  {
    \tl_clear:N \l__dfg_project_overview_body_tl
    \tl_clear:N \l__dfg_project_overview_ending_body_tl
    \__dfg_project_overview_collect:
    \__dfg_project_overview_typeset:
  }
  { \msg_warning:nnn { dfg } { database-not-found } { project } }
  \group_end:
}
\clist_new:N \l__dfg_research_area_clist   % new clist name
\clist_new:N \l__dfg_research_area_final_clist   % new clist name
\NewDocumentCommand{\ResearchAreasFromProjectsList}{o}{
  % #1: IDs of project to be excluded
  \clist_clear:N \l__dfg_research_area_clist
  \tl_clear:N \l_tmpa_tl

  \DTLforeach[
  	% exclude mentioned projects (for whatsoever reason)
  	\not\DTLisinlist{\pNumber}{#1}% 1st condition
    \and
    \not\DTLiseq{\pConsiderForLists}{false}
  ]
  {project}{%
  	\pNumber       =number,
  	\pType         =project-type,
    \pConsiderForLists=consider-for-lists,
  	\l_tmpa_tl     =research-area%
  }{%
  	% Quite heavy but it works to skip the research area for non-research projects
  	\bool_set_false:N \l__dfg_project_type_research_bool
  	\bool_set_false:N \l__dfg_project_type_service_bool
  	\bool_set_false:N \l__dfg_project_type_mgk_bool
  	\bool_set_false:N \l__dfg_project_type_admin_bool

  	\str_case:Vn {\pType}{
  		{research}{ \bool_set_true:N \l__dfg_project_type_research_bool }
  		{service} { \bool_set_true:N \l__dfg_project_type_service_bool  }
  		{mgk}     { \bool_set_true:N \l__dfg_project_type_mgk_bool      }
  		{admin}   { \bool_set_true:N \l__dfg_project_type_admin_bool    }
  	}
  	\bool_lazy_any:nT {{ \l__dfg_project_type_research_bool}}
  	{\clist_put_right:NV \l__dfg_research_area_clist { \l_tmpa_tl }}%
  }
  \clist_remove_duplicates:N \l__dfg_research_area_clist
  % sorting and faking that the numbers are floats.... HACK
  \clist_sort:Nn \l__dfg_research_area_clist
  { \fp_compare:nTF { ##1 < ##2 } { \sort_return_swapped: } { \sort_return_same: } }

  \clist_map_inline:Nn \l__dfg_research_area_clist {
  	\clist_put_right:NV \l__dfg_research_area_final_clist { \dfgResearchAreasList{##1}}
  }

  \dfgShowCalculatedTag{ResearchAreasFromProjectsList}{project}
  {
    \clist_use:Nnnn \l__dfg_research_area_final_clist {,~}{,~}{,~and~}%
    .%final dot.
  }
}
\prop_new:N \g__dfg_dfg_research_areas_prop
\prop_gset_from_keyval:Nn \g__dfg_dfg_research_areas_prop
{
  1.11-01 = {Prehistory~and~World~Archaeology},
  1.11-02 = {Greek~and~Latin~Philology},
  1.11-03 = {Ancient~History},
  1.11-04 = {Classical,~Roman,~Christian~and~Islamic~Archaeology},
  1.11-05 = {Egyptology~and~Ancient~Near~Eastern~Studies},

  1.12-01 = {Medieval~History},
  1.12-02 = {Early~Modern~History},
  1.12-03 = {Modern~and~Contemporary~History},
  1.12-04 = {History~of~Science},

  1.13-01 = {Art~History},
  1.13-02 = {Musicology},
  1.13-03 = {Theatre~and~Media~Studies},

  1.14-01 = {General~and~Comparative~Linguistics,~Experimental~Linguistics,~Typology,~Non-European~Languages},
  1.14-02 = {Individual~Linguistics,~Historical~Linguistics},
  1.14-03 = {Applied~Linguistics,~Computational~Linguistics},

  1.15-01 = {German~Medieval~Studies~(Medieval~German~Literature)},
  1.15-02 = {German~Literary~and~Cultural~Studies~(Modern~German~Literature)},
  1.15-03 = {European~and~American~Literary~and~Cultural~Studies},
  1.15-04 = {General~and~Comparative~Literary~Studies;~Cultural~Studies},

  1.16-01 = {Social~and~Cultural~Anthropology~and~Ethnology},
  1.16-02 = {Asian~Studies},
  1.16-03 = {African,~American~and~Oceania~Studies},
  1.16-04 = {Islamic~Studies,~Arabian~Studies,~Semitic~Studies},
  1.16-05 = {Religious~Studies~and~Jewish~Studies},

  1.17-01 = {Protestant~Theology},
  1.17-02 = {Roman~Catholic~Theology},

  1.18-01 = {History~of~Philosophy},
  1.18-02 = {Theoretical~Philosophy},
  1.18-03 = {Practical~Philosophy},

  1.21-01 = {General~Education~and~History~of~Education},
  1.21-02 = {General~and~Domain-Specific~Teaching~and~Learning},
  1.21-03 = {Education~Systems~and~Educational~Institutions},
  1.21-04 = {Educational~Research~on~Socialisation,~Welfare~and~Professionalism},

  1.22-01 = {General,~Cognitive~and~Mathematical~Psychology},
  1.22-02 = {Biological~Psychology~and~Cognitive~Neuroscience},
  1.22-03 = {Developmental~and~Educational~Psychology},
  1.22-04 = {Social~Psychology,~Industrial~and~Organisational~Psychology},
  1.22-05 = {Personality~Psychology,~Clinical~and~Medical~Psychology,~Methodology},

  1.23-01 = {Sociological~Theory},
  1.23-02 = {Empirical~Social~Research},
  1.23-03 = {Communication~Sciences},
  1.23-04 = {Political~Science},

  1.24-01 = {Economic~Theory},
  1.24-02 = {Economic~Policy,~Applied~Economics},
  1.24-03 = {Accounting~and~Finance},
  1.24-04 = {Management~and~Marketing},
  1.24-05 = {Operations~Management~and~Computer~Science~for~Business~Administration},
  1.24-06 = {Statistics~and~Econometrics},
  1.24-07 = {Economic~and~Social~History},

  1.25-01 = {Principles~of~Law~and~Jurisprudence},
  1.25-02 = {Private~Law},
  1.25-03 = {Public~Law},
  1.25-04 = {Criminal~Law},
  1.25-05 = {Criminology},

  2.11-01 = {Biochemistry},
  2.11-02 = {Biophysics},
  2.11-03 = {Cell~Biology},
  2.11-04 = {Structural~Biology},
  2.11-05 = {General~Genetics~and~Functional~Genome~Biology},
  2.11-06 = {Developmental~Biology},
  2.11-07 = {Bioinformatics~and~Theoretical~Biology},

  2.12-01 = {Evolution~and~Systematics~of~Plants~and~Fungi},
  2.12-02 = {Ecology~and~Biodiversity~of~Plants~and~Ecosystems},
  2.12-03 = {Organismic~Interactions,~Chemical~Ecology~and~Microbiomes~of~Plant~Systems},
  2.12-04 = {Plant~Physiology},
  2.12-05 = {Plant~Biochemistry~and~Biophysics},
  2.12-06 = {Plant~Cell~and~Developmental~Biology},
  2.12-07 = {Plant~Genetics~and~Genomics},

  2.13-01 = {Systematics~and~Morphology~(Zoology)},
  2.13-02 = {Evolution,~Anthropology},
  2.13-03 = {Ecology~and~Biodiversity~of~Animals~and~Ecosystems,~Organismic~Interactions},
  2.13-04 = {Sensory~and~Behavioural~Biology},
  2.13-05 = {Animal~Physiology~and~Biochemistry},
  2.13-06 = {Evolutionary~Cell~and~Developmental~Biology~(Zoology)},

  2.21-01 = {Metabolism,~Biochemistry~and~Genetics~of~Microorganisms},
  2.21-02 = {Microbial~Ecology~and~Applied~Microbiology},
  2.21-03 = {Medical~Microbiology~and~Mycology,~Hygiene,~Molecular~Infection~Biology},
  2.21-04 = {Virology},
  2.21-05 = {Immunology},
  2.21-06 = {Parasitology~and~Biology~of~Tropical~Infectious~Disease~Pathogens},

  2.22-01 = {Epidemiology~and~Medical~Biometry~/~Statistics},
  2.22-02 = {Public~Health,~Healthcare~Research,~Social~and~Occupational~Medicine},
  2.22-03 = {Human~Genetics},
  2.22-04 = {Anatomy~and~Physiology},
  2.22-05 = {Nutritional~Sciences},
  2.22-06 = {Pathology},
  2.22-07 = {Medical~Informatics~and~Medical~Bioinformatics},
  2.22-08 = {Pharmacy},
  2.22-09 = {Pharmacology},
  2.22-10 = {Toxicology,~Laboratory~Medicine},
  2.22-11 = {Anaesthesiology},
  2.22-12 = {Cardiology,~Angiology},
  2.22-13 = {Pneumology,~Thoracic~Surgery},
  2.22-14 = {Hematology,~Oncology},
  2.22-15 = {Gastroenterology},
  2.22-16 = {Nephrology},
  2.22-17 = {Endocrinology,~Diabetology,~Metabolism},
  2.22-18 = {Rheumatology},
  2.22-19 = {Dermatology},
  2.22-20 = {Pediatric~and~Adolescent~Medicine},
  2.22-21 = {Gynaecology~and~Obstetrics},
  2.22-22 = {Clinical~Immunology~and~Allergology},
  2.22-23 = {Reproductive~Medicine,~Urology},
  2.22-24 = {Biogerontology~and~Geriatric~Medicine},
  2.22-25 = {General~and~Visceral~Surgery},
  2.22-26 = {Cardiac~and~Vascular~Surgery},
  2.22-27 = {Orthopaedics,~Traumatology,~Reconstructive~Surgery},
  2.22-28 = {Dentistry,~Oral~Surgery},
  2.22-29 = {Otolaryngology,~Phoniatrics~and~Audiology},
  2.22-30 = {Radiology},
  2.22-31 = {Clinical~Infectiology~and~Tropical~Medicine},
  2.22-32 = {Medical~Physics,~Biomedical~Technology},
  2.22-33 = {Nuclear~Medicine,~Radiotherapy,~Radiobiology},

  2.23-01 = {Developmental~Neurobiology},
  2.23-02 = {Molecular~Biology~and~Physiology~of~Neurons~and~Glial~Cells},
  2.23-03 = {Experimental~and~Theoretical~Network~Neuroscience},
  2.23-04 = {Cognitive,~Systems~and~Behavioural~Neurobiology},
  2.23-05 = {Experimental~Models~for~the~Understanding~of~Nervous~System~Diseases},
  2.23-06 = {Molecular~and~Cellular~Neurology~and~Neuropathology},
  2.23-07 = {Clinical~Neurology;~Neurosurgery~and~Neuroradiology},
  2.23-08 = {Human~Cognitive~and~Systems~Neuroscience},
  2.23-09 = {Biological~Psychiatry},
  2.23-10 = {Clinical~Psychiatry,~Psychotherapy,~Child~and~Adolescent~Psychiatry},
  2.23-11 = {Ophthalmology},

  2.31-01 = {Soil~Sciences},
  2.31-02 = {Plant~Breeding~and~Plant~Pathology},
  2.31-03 = {Plant~Cultivation,~Plant~Nutrition,~Agricultural~Technology},
  2.31-04 = {Ecology~of~Land~Use},
  2.31-05 = {Agricultural~Economics,~Agricultural~Policy,~Agricultural~Sociology},
  2.31-06 = {Forestry},
  2.31-07 = {Animal~Breeding,~Animal~Nutrition,~Animal~Husbandry},

  3.11-01 = {Inorganic~Molecular~Chemistry~-~Synthesis~and~Characterisation},
  3.11-02 = {Organic~Molecular~Chemistry~-~Synthesis~and~Characterisation},

  3.12-01 = {Solid~State~and~Surface~Chemistry,~Material~Synthesis},
  3.12-02 = {Physical~Chemistry~of~Solids~and~Surfaces,~Material~Characterisation},

  3.13-01 = {Physical~Chemistry~of~Molecules,~Liquids~and~Interfaces,~Biophysical~Chemistry},

  3.14-01 = {Analytical~Chemistry},

  3.15-01 = {Biological~and~Biomimetic~Chemistry},
  3.15-02 = {Food~Chemistry},

  3.16-01 = {Preparatory~and~Physical~Chemistry~of~Polymers},
  3.16-02 = {Experimental~and~Theoretical~Physics~of~Polymers},
  3.16-03 = {Polymer~Materials},

  3.17-01 = {Theoretical~Chemistry:~Electron~Structure,~Dynamics,~Simulation},
  3.17-02 = {Theoretical~Chemistry:~Molecules,~Materials,~Surfaces},

  3.21-01 = {Experimental~Condensed~Matter~Physics},
  3.21-02 = {Theoretical~Condensed~Matter~Physics},

  3.22-01 = {Statistical~Physics,~Nonlinear~Dynamics,~Complex~Systems,~Soft~and~Fluid~Matter,~Biological~Physics},

  3.23-01 = {Optics,~Quantum~Optics~and~Physics~of~Atoms,~Molecules~and~Plasmas},

  3.24-01 = {Nuclear~and~Elementary~Particle~Physics,~Quantum~Mechanics,~Relativity,~Fields},

  3.25-01 = {Astrophysics~and~Astronomy},

  3.31-01 = {Mathematics},

  3.41-01 = {Atmospheric~Science},
  3.41-02 = {Oceanography},

  3.42-01 = {Geology},
  3.42-02 = {Palaeontology},

  3.43-01 = {Geophysics},
  3.43-02 = {Geodesy,~Photogrammetry,~Remote~Sensing,~Geoinformatics,~Cartography},

  3.44-01 = {Mineralogy,~Petrology~and~Geochemistry},

  3.45-01 = {Physical~Geography},
  3.45-02 = {Human~Geography},

  3.46-01 = {Hydrogeology,~Hydrology,~Limnology,~Urban~Water~Management,~Water~Chemistry,~Integrated~Water~Resources~Management},

  4.11-01 = {Metal-Cutting~and~Abrasive~Manufacturing~Engineering},
  4.11-02 = {Primary~Shaping~and~Reshaping~Technology,~Additive~Manufacturing},
  4.11-03 = {Joining~and~Separation~Technology},
  4.11-04 = {Plastics~Engineering},
  4.11-05 = {Production~Systems,~Operations~Management,~Quality~Management~and~Factory~Planning},
  4.11-06 = {Production~Automation~and~Assembly~Technology},

  4.12-01 = {Engineering~Design,~Machine~Elements,~Product~Development},
  4.12-02 = {Mechanics},
  4.12-03 = {Lightweight~Construction,~Textile~Technology},
  4.12-04 = {Acoustics},

  4.21-01 = {Chemical~and~Thermal~Process~Engineering},
  4.21-02 = {Technical~Chemistry},
  4.21-03 = {Mechanical~Process~Engineering},
  4.21-04 = {Biological~Process~Engineering},
  4.21-05 = {Systems~Process~Engineering},

  4.22-01 = {Energy~Process~Engineering},
  4.22-02 = {Technical~Thermodynamics},
  4.22-03 = {Fluid~Mechanics},
  4.22-04 = {Hydraulic~and~Turbo~Engines~and~Piston~Engines},

  4.31-01 = {Metallurgical,~Thermal~and~Thermomechanical~Treatment~of~Materials},
  4.31-02 = {Materials~in~Sintering~Processes~and~Generative~Manufacturing~Processes},
  4.31-03 = {Coating~and~Surface~Technology},
  4.31-04 = {Mechanical~Properties~of~Metallic~Materials~and~their~Microstructural~Origins},
  4.31-05 = {Glass,~Ceramics~and~Derived~Composites},
  4.31-06 = {Polymeric~and~Biogenic~Materials~and~Derived~Composites},

  4.32-01 = {Synthesis~and~Properties~of~Functional~Materials},
  4.32-02 = {Biomaterials},
  4.32-03 = {Thermodynamics~and~Kinetics~as~well~as~Properties~of~Phases~and~Microstructure~of~Materials},
  4.32-04 = {Computer-Aided~Design~of~Materials~and~Simulation~of~Materials~Behaviour~from~Atomic~to~Microscopic~Scale},

  4.41-01 = {Automation,~Mechatronics,~Control~Systems,~Intelligent~Technical~Systems,~Robotics},
  4.41-02 = {Measurement~Systems},
  4.41-03 = {Microsystems},
  4.41-04 = {Traffic~and~Transport~Systems,~Intelligent~and~Automated~Traffic},
  4.41-05 = {Human~Factors,~Ergonomics,~Human-Machine~Systems},
  4.41-06 = {Biomedical~Systems~Technology},

  4.42-01 = {Electronic~Semiconductors,~Components~and~Circuits,~Integrated~Systems,~Sensor~Technology,~Theoretical~Electrical~Engineering},
  4.42-02 = {Communication~Technology~and~Networks,~High-Frequency~Technology~and~Photonic~Systems,~Signal~Processing~and~Machine~Learning~for~Information~Technology},
  4.42-03 = {Electrical~Energy~Systems,~Power~Management,~Power~Electronics,~Electrical~Machines~and~Drives},
  4.42-04 = {Hardware~Systems~and~Architectures~for~Information~Technology~and~Artificial~Intelligence,~Quantum~Engineering~Systems},

  4.43-01 = {Theoretical~Computer~Science},
  4.43-02 = {Software~Engineering~and~Programming~Languages},
  4.43-03 = {Security~and~Dependability,~Operating,~Communication~and~Distributed~Systems},
  4.43-04 = {Artificial~Intelligence~and~Machine~Learning~Methods},
  4.43-05 = {Image~and~Language~Processing,~Computer~Graphics~and~Visualisation,~Human~Computer~Interaction,~Ubiquitous~and~Wearable~Computing},
  4.43-06 = {Data~Management,~Data-Intensive~Systems,~Computer~Science~Methods~in~Business~Informatics},
  4.43-07 = {Computer~Architecture,~Embedded~and~Massively~Parallel~Systems},

  4.51-01 = {Architecture,~Building~and~Construction~History,~Construction~Research,~Sustainable~Building~Technology},
  4.51-02 = {Urbanism,~Spatial~Planning,~Transportation~and~Infrastructure~Planning,~Landscape~Planning},
  4.51-03 = {Construction~Material~Sciences,~Chemistry,~Building~Physics},
  4.51-04 = {Structural~Engineering,~Building~Informatics~and~Construction~Operation},
  4.51-05 = {Applied~Mechanics,~Statics~and~Dynamics},
  4.51-06 = {Geotechnics,~Hydraulic~Engineering},

}

\NewDocumentCommand{\dfgResearchAreasList}{m}{
  % #1: area-list
  \prop_if_in:NnTF \g__dfg_dfg_research_areas_prop {#1}
  {
  	% key exists → fetch the description and typeset it
  	\prop_get:NnN \g__dfg_dfg_research_areas_prop {#1} \l_tmpa_tl
  	\textbf{#1}:~\l_tmpa_tl
  }
  {
  	% key missing → same fallback as your original macro
  	\textcolor{error}{\textbf{#1}:~ research~ area~ not~ found}
  	\msg_warning:nne { dfg } { research-area-not-found }{#1}
  }
}
\str_new:N \l__dfg_row_color_str
\NewDocumentCommand{\EarlyCareerResearchersTable}{ O{EarlyCareerResearcher} }{%
  \def\dfgLocalDB{#1}
  \DTLifdbexists{\dfgLocalDB}{%
  	\DTLsort*{ref-project-id,lastname}{\dfgLocalDB}%
  	\def\tblrbody{}%
  	\DTLforeach*{\dfgLocalDB}{%
  		\pRefProjectID=ref-project-id,%
  		\pLastname=lastname,%
  		\pFirstname=firstname,%
  		\pFinancedBy=financed-by,%
  		\pTopic=topic,%
  		\pCategory=category,%
  		\pPeriodStart=periodStart,%
  		\pPeriodEnd=periodEnd%
  	}{
  		\str_case:en {\pCategory}{
  			{MD}{\str_set:Nn \l__dfg_row_color_str {green!10} }
  			{PhD}{\str_set:Nn \l__dfg_row_color_str {blue!10} }
  		}
  		\DTLgetvalueforkey{\theProjectNumber}{number}{project}{id}{\pRefProjectID}
  		\protected@edef\tblrbody{\tblrbody
  			\SetRow{\l__dfg_row_color_str}
  	       	\datatool_if_null:NTF {\theProjectNumber}{\pRefProjectID}{\getProject{\pRefProjectID}}
      & \noexpand\dfgShowTag{\pRefProjectID/\pLastname}{lastname}
          {\pLastname}[\dfgLocalDB],~
        \noexpand\dfgShowTag{\pRefProjectID/\pLastname}{firstname}
          {\pFirstname}[\dfgLocalDB]
      & \noexpand\dfgShowTag{\pRefProjectID/\pLastname}{financed-by}
          {\pFinancedBy}[\dfgLocalDB]
      & \noexpand\dfgShowTag{\pRefProjectID/\pLastname}{topic}
          {\pTopic}[\dfgLocalDB]
  			&
  			{
  				\ifdefempty{\pPeriodEnd}{since~}{}
          \noexpand\dfgShowTag{\pRefProjectID/\pLastname}{periodStart}
            {\pPeriodStart}[\dfgLocalDB]
          \ifdefempty{\pPeriodEnd}{}{--\\
            \noexpand\dfgShowTag{\pRefProjectID/\pLastname}{periodEnd}
              {\pPeriodEnd}[\dfgLocalDB]}}
  			\\
  		}}%
  	\begin{tblr}[%
  			theme=main,
  			expand=\tblrbody,
  			remark{Note}={Row~colours~indicate~category~of~doctoral~candidates:~
  				             \textcolor{blue}{Dr.\,rer.\,nat.},~
  				             \textcolor{green}{Dr.\,med.}.~
  				             \textbf{RS}~=~Rising~Star.~
  				             Doctoral~candidates~with~highlighted~names~have~obtained~the~doctoral~degree.~
  				             MD~denotes~medical~students~supported~by~DFG~stipends~for~up~to~6~months.
  			             },
  			long
  		]{
  			colspec = {t{.8cm}t{3cm}t{1.2cm}X[t]t{1.8cm}},
  			rowhead = 1,
  			column{1} = {
  				            font={\bfseries},
  				            fg = {tableFirstColumn}
  			            },
  			% row{even}={bg=tableRows},
  			column{4} = {font={\footnotesize\itshape}},
  			row{1}       = {
  				               bg       = tableHeadingsBG,
  				               fg       = tableHeadingsFont,
  				               font     = \footnotesize\bfseries,
  				               halign   = {c},
  				               valign   = {t},
  				               guard
  			               },
  		}
  		Project %
  		 & Surname,~ first~ name             %
  		 & {Type~ of~            \\ funding} %
  		 & Topic                             %
  		 & Duration                          \\
  		\tblrbody
  	\end{tblr}}
  {
  	Database~ \texttt{#1}~ missing.
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}

\prop_new:N \g__dfg_dfg_position_names_prop
\prop_gset_from_keyval:Nn \g__dfg_dfg_position_names_prop
{
  PhD         = {Doctoral~researchers},
  postDoc     = {Postdoctoral~researchers},
  groupLeader = {Research~ group~ leaders,~
  		junior~ research~ group~ leaders,~
  		junior~ professors},
  research    = {Other~ research~ staff},
  nonResearch = {Non-research~ staff},
  student     = {Student~ and~ graduate~ assistants},
  prof        = {Professors},
  prof-W2     = {Professors~ W2/C3},
  prof-W3     = {Professors~ W3/C4}
}
\prop_new:N \g__dfg_dfg_category_names_prop
\prop_gset_from_keyval:Nn \g__dfg_dfg_category_names_prop
{
  PhD         = {Doctoral~researcher},
  postDoc     = {Postdoctoral~researcher},
  medDoc      = {Medical~doctoral~researcher},
  groupLeader = {(Jr.)~ Research~ group~ leader},
  research    = {Other~ research~ staff},
  nonResearch = {Non-research~ staff},
  student     = {Student/graduate~ assistant},
  assistant   = {Research~assistant},
  prof        = {Professor},
  prof-W2     = {Professor~ (W2/C3)},
  prof-W3     = {Professor~ (W3/C4)},
}
\cs_generate_variant:Nn \prop_if_in:NnTF { NeTF }

\NewDocumentCommand{\dfgPositionName}{m}{%
  \prop_if_in:NeTF \g__dfg_dfg_position_names_prop {#1}
  {
  	\prop_get:NeN \g__dfg_dfg_position_names_prop {#1} \l_tmpa_tl
  	\l_tmpa_tl
  }
  {
  	\textcolor{error}{mismatch:~#1}
  	\msg_warning:nne { dfg } { item-not-matched }{ #1 }
  }
}
\NewDocumentCommand{\dfgCategoryName}{m}{
  \prop_if_in:NeTF \g__dfg_dfg_category_names_prop {#1}
  {
  	\prop_get:NeN \g__dfg_dfg_category_names_prop {#1} \l_tmpa_tl
  	\l_tmpa_tl
  }
  {
  	\textcolor{error}{mismatch:~#1}
  	\msg_warning:nne { dfg } { item-not-matched }{ #1 }
  }
}
\NewDocumentCommand{\GenderEqualityStaffTable}{ O{GenderEqualityStaff} }{%
  \def\dfgLocalDB{#1}
  \DTLifdbexists{\dfgLocalDB}{%
  	\tl_clear:N \l_tblr_body_tl
  	\DTLforeach*[
  		\DTLiseq{PhD}{\pPosition}
  		\OR
  		\DTLiseq{postDoc}{\pPosition}
  	]{\dfgLocalDB}{%
  		\pPosition=position,%
  		\pPrevObjPctFemale=previous-objective-percentage-female,%
  		\pStatusQuoNumFemale=status-quo-number-female,%
  		\pStatusQuoPctFemale=status-quo-percentage-female,%
  		\pFutureObjPctFemale=future-objective-percentage-female%
  	}{
  		\tl_gput_right:Nx \l_tblr_body_tl
  		{
      \dfgShowTag{\pPosition}{position}
        {\dfgPositionName{\pPosition}}[\dfgLocalDB] &
      \dfgShowTag{\pPosition}{previous-objective-percentage-female}
        {\pPrevObjPctFemale}[\dfgLocalDB] &
      \dfgShowTag{\pPosition}{status-quo-number-female}
        {\pStatusQuoNumFemale}[\dfgLocalDB] &
      \dfgShowTag{\pPosition}{status-quo-percentage-female}
        {\pStatusQuoPctFemale}[\dfgLocalDB] &
      \dfgShowTag{\pPosition}{future-objective-percentage-female}
        {\pFutureObjPctFemale}[\dfgLocalDB] \\
  		}
  	}
  	\begin{tblr}[%
  			theme=main,
			note{a}={Reference~ date:~ proposal~ for~ \dfgFundingPeriodText\space~ funding~ period},
  			expand=\l_tblr_body_tl,
  			long
  		]{
  			vspan=even,
  			%row{Z}= {font={\footnotesize\bfseries}},
  			colspec = {
  					X[m] % position
  					m{2cm} % proportion
  					m{2cm} % number
  					m{2cm} % female
  					m{3cm}
  				},
  			hspan=minimal, % !!!!! https://tex.stackexchange.com/a/637391/98739
  			vline{3} = {3-3}{1pt,solid,fg={tableLines}},
  			vline{5} = {1-3}{1pt,solid,fg={tableLines}},
  			hline{4} = {1pt,solid,fg={tableLines}},
  			% hline{Y} = {1pt,solid,fg={tableOuterLines}},
  			hline{2} = {wd=0pt},
  			rowhead = 3,
  			column{2-5}={halign={c}},
  			%  column{1} = {font={\bfseries},
  			%    fg = {rwthBlue}},
  			row{2-3} ={
  				          guard,
  				          valign={t},
  				          font={\footnotesize\bfseries},
  				          fg={tableHeadingsFont},
  				          bg={white}},
  		}
  		\SetCell[r=3]{c} % empty
  		 & \SetCell[c=3]{c} Second~ funding~ period  %
  		 &                                           %
  		 &                                           %
  		 & Third~ funding~ period                    \\
  		% empty
  		 & {Objective~ [\unit{\percent}]}
  		 & \SetCell[c=2]{c}{Status~ Quo\TblrNote{a}}
  		 &
  		 & {Objective~ [\unit{\percent}]}            \\
  		% empty
  		 &                                           % empty
  		 & Number
  		 & [\unit{\percent}]
  		 & f                                         \\
  		\tl_use:N \l_tblr_body_tl
  		% Total
  		%  &                                           % objective
  		%  &                                           % number
  		%  &                                           % percentage
  		%  &                                           % objective \\
  	\end{tblr}}
  {
  	Database~ \texttt{#1}~ missing.
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}
\int_new:N \l__dfg_count_int
\int_new:N \l__dfg_total_int
\int_new:N \l__dfg_tmp_int
\int_new:N \l__dfg_tmp_total_int
\int_new:N \l__dfg_tmp_position_int
\int_new:N \l__dfg_tmp_gender_int
\int_new:N \l__dfg_percent_int
\prop_new:N \g__dfg_counts_prop
\tl_new:N   \l__dfg_count_key_tl
\tl_new:N   \l__dfg_count_phase_tl
\tl_new:N   \l__dfg_count_db_tl
\cs_new_protected:Npn \dfg_compute_counts:nn #1#2
{
  % Skip if already computed for this (db, phase).
  \tl_set:Nx \l_tmpa_tl { #1 | #2 }
  \tl_if_eq:NNF \l_tmpa_tl \l__dfg_count_phase_tl
  {
  	\tl_set:Nx \l__dfg_count_phase_tl { #1 | #2 }
  	\prop_gclear:N \g__dfg_counts_prop
  	\DTLforeach*[
  		\DTLisinlist{#2}{\pPeriod}
  		\and
  		\DTLisinlist{PI}{\pRole}
  	]{#1}{
  		\pPosition = position,
  		\pGender   = gender,
  		\pPeriod   = period,
  		\pRole     = role
  	}{
  		\tl_set:Nx \l__dfg_count_key_tl { \pPosition | \pGender }
  		\prop_get:NVNTF \g__dfg_counts_prop \l__dfg_count_key_tl \l_tmpb_tl
  		{
  			\int_set:Nn \l__dfg_count_int { \l_tmpb_tl + 1 }
  			\prop_gput:NVx \g__dfg_counts_prop \l__dfg_count_key_tl
  			{ \int_use:N \l__dfg_count_int }
  		}
  		{
  			\prop_gput:NVn \g__dfg_counts_prop \l__dfg_count_key_tl { 1 }
  		}
  	}
  }
}
\cs_new:Npn \dfg_count_lookup:nn #1#2
{
  \prop_if_in:NnTF \g__dfg_counts_prop { #1 | #2 }
  { \prop_item:Nn \g__dfg_counts_prop { #1 | #2 } }
  { 0 }
}

\cs_new_protected:Npn \dfg_count_position_set:Nnnnn #1#2#3#4#5
{
  \prop_if_in:NnTF \g__dfg_dfg_position_names_prop {#3}
  {
  	\dfg_compute_counts:nn {#2} {#5}
  	\int_set:Nn #1 { \dfg_count_lookup:nn {#3} {#4} }
  }
  {
  	\textcolor{error}{mismatch:~#3}
  	\msg_warning:nne { dfg } { item-not-matched }{ #3 }
  }
}

\cs_new_protected:Npn \dfg_total_position_set:Nnnn #1#2#3#4
{
  \dfg_compute_counts:nn {#2} {#4}
  \int_set:Nn #1
  {
  	\dfg_count_lookup:nn {#3} {f}
  	+ \dfg_count_lookup:nn {#3} {m}
  	+ \dfg_count_lookup:nn {#3} {d}
  }
}

\cs_new_protected:Npn \dfg_total_gender_set:Nnnn #1#2#3#4
{
  \dfg_compute_counts:nn {#2} {#4}
  \int_set:Nn #1
  {
  	\dfg_count_lookup:nn {postDoc}     {#3}
  	+ \dfg_count_lookup:nn {groupLeader} {#3}
  	+ \dfg_count_lookup:nn {prof-W2}    {#3}
  	+ \dfg_count_lookup:nn {prof-W3}    {#3}
  }
}

\cs_new_protected:Npn \dfg_total_position_gender_set:Nnn #1#2#3
{
  \dfg_compute_counts:nn {#2} {#3}
  \int_zero:N #1
  \clist_map_inline:nn {postDoc, groupLeader, prof-W2, prof-W3}
  {
  	\clist_map_inline:nn { f , m , d }
  	{
  		\int_add:Nn #1 { \dfg_count_lookup:nn {##1} {####1} }
  	}
  }
}
\NewDocumentCommand{\getPositionGenderPhaseAmount}{ O{person} m m m }
{
  % #1: database
  % #2: position
  % #3: gender
  % #4: phase
  \dfg_count_position_set:Nnnnn \l__dfg_tmp_int {#1} {#2} {#3} {#4}
  \dfgShowCalculatedTag{getPositionGenderPhaseAmount}{#1}
    { \int_use:N \l__dfg_tmp_int }
}
\NewDocumentCommand{\getPositionPhaseTotal}{ O{person} m m }
{
  % #1: database
  % #2: position
  % #3: phase

  \dfg_total_position_set:Nnnn \l__dfg_total_int {#1} {#2} {#3}

  % no macro supplied → print the total
  \dfgShowCalculatedTag{getPositionPhaseTotal}{#1}
    { \int_use:N \l__dfg_total_int }
}
\NewDocumentCommand{\getGenderPhaseTotal}{ O{person} m m  }
{
  % #1: database
  % #2: gender
  % #3: phase
  \dfg_total_gender_set:Nnnn \l__dfg_total_int {#1} {#2} {#3}

  % % no macro supplied → print the total
  \dfgShowCalculatedTag{getGenderPhaseTotal}{#1}
    { \int_use:N \l__dfg_total_int }
}
\NewDocumentCommand{\getPositionGenderPhasePercentage}{ O{person} m m m}
{
  % #1: database
  % #2: position
  % #3: gender
  % #4: phase

  \dfg_total_position_set:Nnnn \l__dfg_total_int {#1} {#2} {#4}

  % --- number of the requested gender ---------------------------
  \dfg_count_position_set:Nnnnn \l__dfg_tmp_int {#1}{#2}{#3}{#4}

  % --- avoid division by zero ----------------------------------
  \dfgShowCalculatedTag{getPositionGenderPhasePercentage}{#1}
  {
    \int_compare:nNnTF { \l__dfg_total_int } = { 0 }
    { 0 }
    {
      % --- integer percentage (rounded) ------------------------
      \int_set:Nn \l__dfg_percent_int
      { \fp_eval:n { round( 100 * \l__dfg_tmp_int / \l__dfg_total_int ) } }

      % print the integer together with the percent sign
      \int_use:N \l__dfg_percent_int
    }
  }
}
\NewDocumentCommand{\getGenderPhasePercentage}{ O{person} m m  }
{
  % #1: database
  % #2: gender
  % #3: phase

  \int_zero:N \l__dfg_percent_int
  \int_zero:N \l__dfg_tmp_int
  \int_zero:N \l__dfg_tmp_total_int

  \dfg_total_position_gender_set:Nnn \l__dfg_tmp_total_int {#1} {#3}

  % % --- number of the requested gender ---------------------------
  \dfg_total_gender_set:Nnnn \l__dfg_tmp_gender_int {#1}{#2}{#3}

  % --- avoid division by zero ----------------------------------
  \dfgShowCalculatedTag{getGenderPhasePercentage}{#1}
  {
    \int_compare:nNnTF { \l__dfg_tmp_total_int } = { 0 }
    { 0 }
    {
      % --- integer percentage (rounded) ------------------------
      \int_set:Nn \l__dfg_percent_int
      { \fp_eval:n { round( 100 * \l__dfg_tmp_gender_int / \l__dfg_tmp_total_int ) } }

      % print the integer together with the percent sign
      \int_use:N \l__dfg_percent_int
    }
  }
  % \par Gender: #2--
  % Phase: #3--
  % Count: \int_use:N \l__dfg_tmp_gender_int --
  % Count Total:\int_use:N \l__dfg_tmp_total_int\par------------
}
\NewDocumentCommand{\GenderEqualityProjectLeadersTable}{ O{GenderEqualityProjectLeaders} }{%
  \def\dfgLocalDB{#1}
  \DTLifdbexists{\dfgLocalDB}{%
  	% --- prime the count cache once for this table's phase ----------
  	\dfg_compute_counts:nn {person} {\theFundingPeriodNumeralPrevious}%
  	\tl_clear:N \l_tblr_body_tl
  	\DTLforeach*[
  		% just making absolutely sure we only have the data sets we need.
  		\DTLiseq{postDoc}{\pPosition}
  		\OR
  		\DTLiseq{groupLeader}{\pPosition}
  		\OR
  		\DTLiseq{prof-W2}{\pPosition}
  		\OR
  		\DTLiseq{prof-W3}{\pPosition}
  	]{\dfgLocalDB}{%
  		\pPosition=position,%
  		\pPrevObjPctFemale=previous-objective-percentage-female,%
  		\pFutureObjPctFemale=future-objective-percentage-female%
  	}{

  		\tl_gput_right:Nx \l_tblr_body_tl
  		{
      \dfgShowTag{\pPosition}{position}
        {\dfgPositionName{\pPosition}}[\dfgLocalDB] % position
      & \dfgShowTag{\pPosition}{previous-objective-percentage-female}
          {\pPrevObjPctFemale}[\dfgLocalDB] % objective
  			& \getPositionGenderPhaseAmount{\pPosition}{f}{\theFundingPeriodNumeralPrevious} % f number
  			& \getPositionGenderPhaseAmount{\pPosition}{m}{\theFundingPeriodNumeralPrevious} % m number
  			& \getPositionGenderPhaseAmount{\pPosition}{d}{\theFundingPeriodNumeralPrevious}% d number
  			&  \getPositionGenderPhasePercentage{\pPosition}{f}{\theFundingPeriodNumeralPrevious}% f percentage
  			&  \getPositionGenderPhasePercentage{\pPosition}{m}{\theFundingPeriodNumeralPrevious}% m percentage
  			&  \getPositionGenderPhasePercentage{\pPosition}{d}{\theFundingPeriodNumeralPrevious}% d percentage
      & \dfgShowTag{\pPosition}{future-objective-percentage-female}
          {\pFutureObjPctFemale}[\dfgLocalDB] % f objective
  			\\
  		}
  	}
  	\begin{tblr}[%
  			theme=main,
  			note{a}={Reference~ date:~ proposal~ for~ third~ funding~ period},
  			expand=\l_tblr_body_tl,
  			long
  		]{
  			vline{3} = {3-4}{1pt,solid,tableLines},
  			vline{6} = {4-4}{1pt,solid,tableLines},
  			vline{9} = {1-4}{1pt,solid,tableLines},
  			vspan=even,
  			colspec = {
  					X[m] % position
  					m{2cm} % objective
  					m{0.4cm} % f
  					m{0.4cm} % m
  					m{0.4cm} % d
  					m{0.4cm} % f
  					m{0.4cm} % m
  					m{0.4cm} % d
  					m{3cm} % objective
  				},
  			hspan=minimal, % !!!!! https://tex.stackexchange.com/a/637391/98739
  			row{Z}= {font={\footnotesize\bfseries}},
  			hline{5} = {1pt,solid,tableLines},
  			hline{Y} = {1pt,solid,fg={tableOuterLines}},
  			hline{2} = {wd=0pt},
  			row{odd}={bg=white},
  			row{even}={bg=tableRows},
  			row{1-4}={bg=tableHeadingsBG},
  			rowhead = 3,
  			column{2-9}={halign={c}},
  			%  column{1} = {font={\bfseries},
  			%    fg = {rwthBlue}},
  			row{2-4} ={
  				          guard,
  				          valign={t},
  				          font={\footnotesize\bfseries},
  				          fg={tableHeadingsFont},
  				          bg={white}},
  		}
  		\SetCell[r=4]{c} % empty
  		 & \SetCell[c=6]{c} Second~ funding~ period                       %
  		 &                                                                %
  		 &                                                                %
  		 &                                                                %
  		 &                                                                %
  		 &                                                                %
  		 &                                                                %
  		 & Third~ funding~ period                                         \\
  		% empty
  		 & {Objective~ [\unit{\percent}]}
  		 & \SetCell[c=6]{c}Status~ Quo\TblrNote{a}
  		 &
  		 &
  		 &
  		 &
  		 &
  		 & {Objective~ [\unit{\percent}]}                                 \\
  		% empty
  		 &                                                                % empty
  		 & \SetCell[c=3]{c}Number
  		 &
  		 &
  		 & \SetCell[c=3]{c} [\unit{\percent}]
  		 &
  		 &
  		 &                                                                \\
  		% empty
  		 &                                                                % empty
  		 & f
  		 & m
  		 & d
  		 & f
  		 & m
  		 & d
  		 & f                                                              \\
  		% \tl_use:N
  		\l_tblr_body_tl
  		Total\printMarginalia{
  			     Total~ no.:~
  			     \dfg_total_position_gender_set:Nnn \l__dfg_tmp_total_int
  			     {person} % database
  			     {\theFundingPeriodNumeralPrevious} % phase
             \num{\int_use:N \l__dfg_tmp_total_int}

  		     }
  		 &                                                                % objective
  		 & \getGenderPhaseTotal{f}{\theFundingPeriodNumeralPrevious}      % number f
  		 & \getGenderPhaseTotal{m}{\theFundingPeriodNumeralPrevious}      % number m
  		 & \getGenderPhaseTotal{d}{\theFundingPeriodNumeralPrevious}      % number d
  		 & \getGenderPhasePercentage{f}{\theFundingPeriodNumeralPrevious} % percentage f
  		 & \getGenderPhasePercentage{m}{\theFundingPeriodNumeralPrevious} % percentage m
  		 & \getGenderPhasePercentage{d}{\theFundingPeriodNumeralPrevious} % percentage d
  		 &                                                                \\
  	\end{tblr}}
  {
  	Database~ \texttt{#1}~ missing.
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}
\NewDocumentCommand{\ExistingInstrumentationTable}{ O{existingInstrumentation} }{%
  \def\dfgLocalDB{#1}
  \def\tblrbody{}
  \DTLifdbexists{\dfgLocalDB}{%
  	\DTLforeach*{\dfgLocalDB}{%
  		\instProject=ref-project-id,%
  		\instInstrument=instrument,%
  		\instCompany=company,%
  		\instQuantity=quantity,%
  		\instYear=year,%
  		\instCost=cost,%
  		\instSource=financed-by%
  	}{%
		\protected@edef\tblrbody{\tblrbody
  			\getProject{\instProject}
      & \ifdefempty{\instQuantity}{}{
          \noexpand\dfgShowTag{\instProject/\instInstrument}{quantity}
            {\instQuantity}[\dfgLocalDB]\,\times\,}
        \noexpand\dfgShowTag{\instProject/\instInstrument}{instrument}
          {\instInstrument}[\dfgLocalDB]
      \ifdefempty{\instCompany}{}{\space(
        \noexpand\dfgShowTag{\instProject/\instInstrument}{company}
          {\instCompany}[\dfgLocalDB])}
      & \noexpand\dfgShowTag{\instProject/\instInstrument}{year}
          {\instYear}[\dfgLocalDB]
      & \noexpand\dfgShowTag{\instProject/\instInstrument}{cost}
          {\noexpand\__dfg_show_existing_instrumentation_cost:n{\instCost}}[\dfgLocalDB]
      & \noexpand\dfgShowTag{\instProject/\instInstrument}{financed-by}
          {\instSource}[\dfgLocalDB]
  			\\
  		}}%
  	\begin{tblr}[%
  			theme=main,
  			expand=\tblrbody,
  			long,
			note{a}={Figures~ in~ thousands},
  		]{%
  			%rowsep=1pt,
  			vspan=even,
			colspec = {X[-.8,m]X[4.5,m]X[m]X[-1,c,si={table-format=4.1}]X[1.7,m]},
  			rowhead = 1,
  			column{3}={halign={c}},
			column{4}={halign={r},guard},
  			column{5}={halign={l}},
  			% cell{1}{4}={valign={m}},
  			cell{1}{1-5} = {cmd={\hypersetup{linkcolor=tableLink}}},
  			row{1}={valign=t, halign={c},guard},
  			% row{1} = {font={\bfseries},fg={white}}
  		}
  		Project %
  		 & Description~ of~ instrumentation                           %
  		 & {Year~ of~                       \\ purchase}
  		 & \SetCell{c}{{{Cost~ of~          \\purchase}}}\TblrNote{a}
  		 & {Source~ of~                     \\ funding}               \\
  		\tblrbody
  	\end{tblr}
  }
  {
  	Database~ \texttt{#1}~ missing.
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  	a	}
}
\NewDocumentCommand{\UpkeepLaboratoryAnimalsTable}{ O{UpkeepLaboratoryAnimals} }{%
  \def\tmpLocalDB{#1}%
  \DTLifdbexists{\tmpLocalDB}{%
  	\DTLsort{ref-project-id}{\tmpLocalDB}%
  	\DTLsumcolumn{\tmpLocalDB}{quantity}{\totalQuantity}%
  	\DTLsumcolumn{\tmpLocalDB}{requested-funds}{\totalRequestedFunds}%
  	\DTLsumcolumn{\tmpLocalDB}{existing-funds}{\totalExistingFunds}%
  	\DTLconverttodecimal{\totalRequestedFunds}{\totalRequestedFunds}%
  	\DTLconverttodecimal{\totalExistingFunds}{\totalExistingFunds}%
  	\def\tblrbody{}%
  	\def\totalMouseQuantity{}%
  	\def\totalRatQuantity{}%
  	\DTLforeach*{\tmpLocalDB}{%
  		\pProject=ref-project-id,%
  		\pSpecies=species,%
  		\pQuantity=quantity,
  		\pWeeksKept=weeks-kept,%
  		\pPurchasingCosts=purchasing-costs,%
  		\pRequestedFunds=requested-funds,%
  		\pExistingFunds=existing-funds%
  	}{
  		\str_case:en {\pSpecies}{

  			{mouse}{%
  				\protected@edef\crcSpecies{Mouse}%
  				\protected@edef\crcHousingCosts{\dfgMouseHousing}%
  				\DTLgadd{\totalMouseQuantity}{\totalMouseQuantity}{\pQuantity}}%
  			{mouse-gnotobiotic}{%
  				\protected@edef\crcSpecies{Mouse~ {\footnotesize(gnotobiotic)}}%
  				\protected@edef\crcHousingCosts{\dfgMouseHousingGnotobiotic}%
  				\DTLgadd{\totalMouseQuantity}{\totalMouseQuantity}{\pQuantity}}%
  			{rat}{%
  				\protected@edef\crcSpecies{Rat}%
  				\protected@edef\crcHousingCosts{\dfgRatHousing}%
  				\DTLgadd{\totalRatQuantity}{\totalRatQuantity}{\pQuantity}}
  		}
  		\protected@edef\tblrbody{\tblrbody
  			\getProject{\pProject}
      & \noexpand\dfgShowTag{\pProject/\pSpecies}{species}
          {\crcSpecies}[\tmpLocalDB]
      & \noexpand\dfgShowTag{\pProject/\pSpecies}{quantity}
          {\noexpand\__dfg_show_table_number:n{\pQuantity}}[\tmpLocalDB]
      & \noexpand\dfgShowTag{\pProject/\pSpecies}{weeks-kept}
          {\noexpand\__dfg_show_table_number:n{\pWeeksKept}}[\tmpLocalDB]
      & \noexpand\dfgShowCalculatedTag{animalHousingRate}
          {settings,\tmpLocalDB}
          {\noexpand\__dfg_show_table_number:n{\crcHousingCosts}}
      & \noexpand\dfgShowTag{\pProject/\pSpecies}{purchasing-costs}
          {\noexpand\__dfg_show_eur:n{\pPurchasingCosts}}[\tmpLocalDB]
      & \noexpand\dfgShowTag{\pProject/\pSpecies}{requested-funds}
          {\noexpand\__dfg_show_eur:n{\pRequestedFunds}}[\tmpLocalDB]
      & \noexpand\dfgShowTag{\pProject/\pSpecies}{existing-funds}
          {\noexpand\__dfg_show_eur:n{\pExistingFunds}}[\tmpLocalDB] \\
  		}   % \DTLconverttodecimal{\totalMouseQuantity}{\totalMouseQuantity}%
  	}%
  	\begin{tblr}[%
  			theme=main,
  			expand=\tblrbody,
  			long,
			note{a}={Figures~ in~ EUR},
  		]{%
  			vspan=even,
      colspec ={*{1}{Q[l]}
        *{1}{X[2,l]}
        *{2}{X[1.3,c,si={table-format=3}]}
        *{1}{X[-1,c,si={table-format=2.2,table-auto-round=false}]}
        *{1}{X[-1,c,si={table-format=5}]}
        *{2}{X[-1,c,si={table-format=6}]}
      },
  			rowhead={1},
			column{3-8}={guard},
  			%rowfoot = 1,
  			hline{Y}={%
  				         wd=1pt,
  				         tableLines},
  			row{Z}={%
  				       bg=white,
  				       fg=black,
  				       font=\footnotesize\bfseries,
  				       halign={c},
  				       valign={t}},
  			% cell{Y}{3}={halign={l}},
  			row{1}={%
  				       guard,
  				       halign={c},
  				       cmd={\hypersetup{linkcolor=tableLink}},
  			       },
  		}
  		Project
  		 & Species
  		 & Quantity
  		 & {Average~                                                                     \\number~ of~\\weeks~ kept}
  		 & {Housing~ costs~                                                              \\per~ animal~\\per~ week\TblrNote{a}}
  		 & {Purchasing~                                                                  \\costs~ \\per~ animal\TblrNote{a}}
  		 & {Requested~                                                                   \\funds\TblrNote{a}}
  		 & {Existing~                                                                    \\funds\TblrNote{a}}                   \\
  		\tblrbody
  		Total
  		 &
       & \SetCell{halign={l},font={\bfseries\footnotesize}}
        {Mice:~\dfgShowCalculatedTag{UpkeepLaboratoryAnimalsTable}{\tmpLocalDB}
            {\totalMouseQuantity}
         \\Rats:~\dfgShowCalculatedTag{UpkeepLaboratoryAnimalsTable}{\tmpLocalDB}
            {\totalRatQuantity}}
  		 & \SetCell{tableNoValue}
  		 & \SetCell{tableNoValue}
  		 & \SetCell{tableNoValue}
       & \dfgShowCalculatedTag{UpkeepLaboratoryAnimalsTable}{\tmpLocalDB}
          {\__dfg_show_eur:n{\totalRequestedFunds}}
       & \dfgShowCalculatedTag{UpkeepLaboratoryAnimalsTable}{\tmpLocalDB}
          {\__dfg_show_eur:n{\totalExistingFunds}}
  	\end{tblr}}
  {
  	Database~ \texttt{#1}~ missing.
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}
\newcommand{\dfgRotate}[1]{\rotatebox{90}{\dfgPositionName{#1}}}
\tl_new:N \l__dfg_requested_staff_database_tl
\tl_set:Nn \l__dfg_requested_staff_database_tl { RequestedFunding }

\NewDocumentCommand{\getCountRequestedStaff}{omm}{%
  \tl_set:Nx \l__dfg_funding_cache_key_tl
  {
    \IfNoValueTF{#1}
      {\tl_use:N \l__dfg_requested_staff_database_tl/
       __ALL__/#3/quantity-year#2}
      {\tl_use:N \l__dfg_requested_staff_database_tl/
       #1/#3/quantity-year#2}
  }
  \dfgShowCalculatedTag{getCountRequestedStaff}
    {\l__dfg_requested_staff_database_tl}
  {
    \prop_get:NVNTF \g__dfg_funding_staff_quantity_prop
      \l__dfg_funding_cache_key_tl \l__dfg_funding_cache_value_tl
    {
      \fp_compare:nNnTF {\l__dfg_funding_cache_value_tl} = {0}
        {\textcolor{tableNoValue!60!black}{\texttimes}}
        {\l__dfg_funding_cache_value_tl}
    }
    {\textcolor{tableNoValue!60!black}{\texttimes}}
  }
}
\seq_new:N  \l__dfg_oes_affiliation_seq
\prop_new:N \l__dfg_oes_affiliation_name_prop
\prop_new:N \l__dfg_oes_affiliation_abbreviation_prop
\prop_new:N \l__dfg_oes_count_prop
\prop_new:N \l__dfg_oes_row_affiliation_seen_prop
\tl_new:N   \l__dfg_oes_applicant_affiliation_tl
\tl_new:N   \l__dfg_oes_person_tl
\tl_new:N   \l__dfg_oes_category_tl
\tl_new:N   \l__dfg_oes_institutions_tl
\tl_new:N   \l__dfg_oes_affiliation_tl
\tl_new:N   \l__dfg_oes_candidate_affiliation_tl
\tl_new:N   \l__dfg_oes_registered_affiliation_tl
\tl_new:N   \l__dfg_oes_affiliation_name_tl
\tl_new:N   \l__dfg_oes_affiliation_abbreviation_tl
\tl_new:N   \l__dfg_oes_lookup_key_tl
\tl_new:N   \l__dfg_oes_database_tl
\tl_new:N   \l__dfg_oes_table_body_tl
\tl_new:N   \l__dfg_oes_colspec_tl
\int_new:N  \l__dfg_oes_affiliation_count_int
\int_new:N  \l__dfg_oes_applicant_affiliation_count_int
\int_new:N  \l__dfg_oes_other_affiliation_count_int
\int_new:N  \l__dfg_oes_record_count_int
\clist_new:N \l__dfg_oes_applicant_affiliation_clist

\cs_new_protected:Npn \__dfg_oes_resolve_person_fallbacks:
{
  \tl_if_blank:VF \l__dfg_oes_person_tl
  {
    \DTLifdbexists{person}
    {
      \DTLgetvalueforkey{\l_tmpa_tl}{id}{person}{id}
        {\l__dfg_oes_person_tl}
      \DTLifnullorempty{\l_tmpa_tl}
      {
        \msg_warning:nnee { dfg } { requested-staff-unresolved-person }
          { \pOESProject } { \l__dfg_oes_person_tl }
      }
      {
        \tl_if_blank:VT \l__dfg_oes_category_tl
        {
          \DTLgetvalueforkey{\l_tmpa_tl}{position}{person}{id}
            {\l__dfg_oes_person_tl}
          \DTLifnullorempty{\l_tmpa_tl}
            { }
            { \tl_set:NV \l__dfg_oes_category_tl \l_tmpa_tl }
        }
        \bool_lazy_all:nT
        {
          { \tl_if_blank_p:V \l__dfg_oes_institutions_tl }
          { \tl_if_blank_p:V \l__dfg_oes_affiliation_tl }
        }
        {
          \DTLgetvalueforkey{\l_tmpa_tl}{ref-institution-id}{person}{id}
            {\l__dfg_oes_person_tl}
          \DTLifnullorempty{\l_tmpa_tl}
            { }
            { \tl_set:NV \l__dfg_oes_institutions_tl \l_tmpa_tl }
          \tl_if_blank:VT \l__dfg_oes_institutions_tl
          {
            \DTLgetvalueforkey{\l_tmpa_tl}{ref-affiliation-id}{person}{id}
              {\l__dfg_oes_person_tl}
            \DTLifnullorempty{\l_tmpa_tl}
              { }
              { \tl_set:NV \l__dfg_oes_affiliation_tl \l_tmpa_tl }
          }
        }
      }
    }
    {
      \msg_warning:nnee { dfg } { requested-staff-unresolved-person }
        { \pOESProject } { \l__dfg_oes_person_tl }
    }
  }
}

\cs_new_protected:Npn \__dfg_oes_register_affiliation:n #1
{
  \tl_set:Ne \l__dfg_oes_registered_affiliation_tl {#1}
  \tl_trim_spaces:N \l__dfg_oes_registered_affiliation_tl
  \tl_if_blank:VF \l__dfg_oes_registered_affiliation_tl
  {
    \seq_if_in:NVF \l__dfg_oes_affiliation_seq
      \l__dfg_oes_registered_affiliation_tl
    {
      \tl_clear:N \l__dfg_oes_affiliation_name_tl
      \tl_clear:N \l__dfg_oes_affiliation_abbreviation_tl
      \DTLifdbexists{affiliation}
      {
        \DTLgetvalueforkey{\l__dfg_oes_affiliation_name_tl}
          {name}{affiliation}{id}{\l__dfg_oes_registered_affiliation_tl}
        \DTLifnullorempty{\l__dfg_oes_affiliation_name_tl}
        {
          \msg_warning:nnee { dfg } { requested-staff-unresolved-affiliation }
            { OverviewExistingStaff }
            { \l__dfg_oes_registered_affiliation_tl }
          \tl_set:NV \l__dfg_oes_affiliation_name_tl
            \l__dfg_oes_registered_affiliation_tl
          \tl_set:NV \l__dfg_oes_affiliation_abbreviation_tl
            \l__dfg_oes_registered_affiliation_tl
        }
        {
          \DTLgetvalueforkey{\l__dfg_oes_affiliation_abbreviation_tl}
            {abbreviation}{affiliation}{id}
            {\l__dfg_oes_registered_affiliation_tl}
          \DTLifnullorempty{\l__dfg_oes_affiliation_abbreviation_tl}
          {
            \msg_warning:nne { dfg } { requested-staff-missing-abbreviation }
              { \l__dfg_oes_registered_affiliation_tl }
            \tl_set:NV \l__dfg_oes_affiliation_abbreviation_tl
              \l__dfg_oes_affiliation_name_tl
          }
          { }
        }
      }
      {
        \msg_warning:nnee { dfg } { requested-staff-unresolved-affiliation }
          { OverviewExistingStaff }
          { \l__dfg_oes_registered_affiliation_tl }
        \tl_set:NV \l__dfg_oes_affiliation_name_tl
          \l__dfg_oes_registered_affiliation_tl
        \tl_set:NV \l__dfg_oes_affiliation_abbreviation_tl
          \l__dfg_oes_registered_affiliation_tl
      }
      \seq_put_right:NV \l__dfg_oes_affiliation_seq
        \l__dfg_oes_registered_affiliation_tl
      \prop_put:NVV \l__dfg_oes_affiliation_name_prop
        \l__dfg_oes_registered_affiliation_tl \l__dfg_oes_affiliation_name_tl
      \prop_put:NVV \l__dfg_oes_affiliation_abbreviation_prop
        \l__dfg_oes_registered_affiliation_tl
        \l__dfg_oes_affiliation_abbreviation_tl
    }
  }
}

\cs_new_protected:Npn \__dfg_oes_count_affiliation:n #1
{
  \tl_set:Ne \l__dfg_oes_candidate_affiliation_tl {#1}
  \tl_trim_spaces:N \l__dfg_oes_candidate_affiliation_tl
  \tl_if_blank:VF \l__dfg_oes_candidate_affiliation_tl
  {
    \prop_if_in:NVF \l__dfg_oes_row_affiliation_seen_prop
      \l__dfg_oes_candidate_affiliation_tl
    {
      \prop_put:NVn \l__dfg_oes_row_affiliation_seen_prop
        \l__dfg_oes_candidate_affiliation_tl {1}
      \__dfg_oes_register_affiliation:n
        { \l__dfg_oes_candidate_affiliation_tl }
      \tl_set:Nx \l_tmpb_tl
        { \l__dfg_oes_category_tl / \l__dfg_oes_candidate_affiliation_tl }
      \prop_get:NVNTF \l__dfg_oes_count_prop \l_tmpb_tl \l_tmpc_tl
      { \int_set:Nn \l_tmpa_int { \l_tmpc_tl + 1 } }
      { \int_set:Nn \l_tmpa_int { 1 } }
      \prop_put:NVx \l__dfg_oes_count_prop \l_tmpb_tl
        { \int_use:N \l_tmpa_int }
    }
  }
}

\cs_new_protected:Npn \__dfg_oes_collect_current:
{
  \DTLifnullorempty{\pOESPerson}
    { \tl_clear:N \l__dfg_oes_person_tl }
    { \tl_set:Ne \l__dfg_oes_person_tl {\pOESPerson} }
  \DTLifnullorempty{\pOESCategory}
    { \tl_clear:N \l__dfg_oes_category_tl }
    { \tl_set:Ne \l__dfg_oes_category_tl {\pOESCategory} }
  \DTLifnullorempty{\pOESInstitutions}
    { \tl_clear:N \l__dfg_oes_institutions_tl }
    { \tl_set:Ne \l__dfg_oes_institutions_tl {\pOESInstitutions} }
  \DTLifnullorempty{\pOESAffiliation}
    { \tl_clear:N \l__dfg_oes_affiliation_tl }
    { \tl_set:Ne \l__dfg_oes_affiliation_tl {\pOESAffiliation} }
  \__dfg_oes_resolve_person_fallbacks:
  \str_case:VnF \l__dfg_oes_category_tl
  {
    { prof }        { \tl_set:Nn \l__dfg_oes_category_tl { prof } }
    { prof-W2 }     { \tl_set:Nn \l__dfg_oes_category_tl { prof } }
    { prof-W3 }     { \tl_set:Nn \l__dfg_oes_category_tl { prof } }
    { groupLeader } { \tl_set:Nn \l__dfg_oes_category_tl { groupLeader } }
    { postDoc }     { \tl_set:Nn \l__dfg_oes_category_tl { postDoc } }
    { PhD }         { \tl_set:Nn \l__dfg_oes_category_tl { PhD } }
    { medDoc }      { \tl_set:Nn \l__dfg_oes_category_tl { research } }
    { research }    { \tl_set:Nn \l__dfg_oes_category_tl { research } }
    { nonResearch } { \tl_set:Nn \l__dfg_oes_category_tl { nonResearch } }
    { student }     { \tl_set:Nn \l__dfg_oes_category_tl { student } }
    { assistant }   { \tl_set:Nn \l__dfg_oes_category_tl { student } }
  }
  { \tl_clear:N \l__dfg_oes_category_tl }
  \tl_if_blank:VF \l__dfg_oes_category_tl
  {
    \int_incr:N \l__dfg_oes_record_count_int
    \prop_clear:N \l__dfg_oes_row_affiliation_seen_prop
    \tl_if_blank:VTF \l__dfg_oes_institutions_tl
    {
      \tl_if_blank:VTF \l__dfg_oes_affiliation_tl
      {
        \msg_warning:nne { dfg } { existing-staff-no-organisation }
          { \pOESProject / \pOESLastname }
      }
      { \__dfg_oes_count_affiliation:n { \l__dfg_oes_affiliation_tl } }
    }
    {
      \clist_set:NV \l_tmpa_clist \l__dfg_oes_institutions_tl
      \clist_map_inline:Nn \l_tmpa_clist
      {
        \tl_clear:N \l_tmpa_tl
        \DTLifdbexists{institution}
        {
          \DTLgetvalueforkey{\l_tmpa_tl}
            {ref-affiliation-id}{institution}{id}{##1}
        }
        { }
        \DTLifnullorempty{\l_tmpa_tl}
        {
          \msg_warning:nnee { dfg } { requested-staff-unresolved-institution }
            { OverviewExistingStaff } {##1}
        }
        { \__dfg_oes_count_affiliation:n { \l_tmpa_tl } }
      }
    }
  }
}

\cs_new_protected:Npn \__dfg_oes_append_empty_cells:n #1
{
  \int_step_inline:nn {#1}
    { \tl_put_right:Nn \l__dfg_oes_table_body_tl { & } }
}

\cs_new_protected:Npn \__dfg_oes_append_category:nn #1#2
{
  \tl_put_right:Nn \l__dfg_oes_table_body_tl {#2}
  \seq_map_inline:Nn \l__dfg_oes_affiliation_seq
  {
    \tl_set:Ne \l__dfg_oes_lookup_key_tl { #1 / ##1 }
    \prop_get:NVNTF \l__dfg_oes_count_prop
      \l__dfg_oes_lookup_key_tl \l_tmpc_tl
    {
      \tl_put_right:Ne \l__dfg_oes_table_body_tl
      {
        & \exp_not:N \dfgShowCalculatedTag{OverviewExistingStaffTable}
          {\exp_not:V \l__dfg_oes_database_tl,person,institution,affiliation}
          {\exp_not:V \l_tmpc_tl}
      }
    }
    {
      \tl_put_right:Ne \l__dfg_oes_table_body_tl
      {
        & \exp_not:N \dfgShowCalculatedTag{OverviewExistingStaffTable}
          {\exp_not:V \l__dfg_oes_database_tl,person,institution,affiliation}{0}
      }
    }
  }
  \tl_put_right:Nn \l__dfg_oes_table_body_tl { \\ }
}

\cs_new_protected:Npn \__dfg_oes_build_table_body:
{
  \int_set:Nn \l__dfg_oes_affiliation_count_int
    { \seq_count:N \l__dfg_oes_affiliation_seq }
  \int_set:Nn \l__dfg_oes_other_affiliation_count_int
    {
      \l__dfg_oes_affiliation_count_int
      - \l__dfg_oes_applicant_affiliation_count_int
    }
  \tl_set:Nx \l__dfg_oes_colspec_tl
    {
      X[4,l]~*{\int_use:N \l__dfg_oes_affiliation_count_int}{X[1,c]}
    }
  \tl_clear:N \l__dfg_oes_table_body_tl
  \tl_put_right:Nx \l__dfg_oes_table_body_tl
  {
    \exp_not:N \SetCell [r=3] {c,m} Category
    & \exp_not:N \SetCell
      [c=\int_use:N \l__dfg_oes_affiliation_count_int] {c,m}
      {Number~of~persons}
  }
  \__dfg_oes_append_empty_cells:n
    { \l__dfg_oes_affiliation_count_int - 1 }
  \tl_put_right:Nn \l__dfg_oes_table_body_tl { \\ & }
  \int_compare:nNnTF
    { \l__dfg_oes_applicant_affiliation_count_int } = {1}
  {
    \tl_put_right:Nn \l__dfg_oes_table_body_tl
      { \SetCell{c,m} {at~the~applicant\\university} }
  }
  {
    \tl_put_right:Nx \l__dfg_oes_table_body_tl
    {
      \exp_not:N \SetCell
        [c=\int_use:N \l__dfg_oes_applicant_affiliation_count_int] {c,m}
        {at~the~applicant\\universities}
    }
    \__dfg_oes_append_empty_cells:n
      { \l__dfg_oes_applicant_affiliation_count_int - 1 }
  }
  \int_compare:nNnT { \l__dfg_oes_other_affiliation_count_int } > {0}
  {
    \tl_put_right:Nx \l__dfg_oes_table_body_tl
    {
      & \exp_not:N \SetCell
        [c=\int_use:N \l__dfg_oes_other_affiliation_count_int] {c,m}
        {at~other~participating\\institutions}
    }
    \__dfg_oes_append_empty_cells:n
      { \l__dfg_oes_other_affiliation_count_int - 1 }
  }
  \tl_put_right:Nn \l__dfg_oes_table_body_tl { \\ }
  \tl_put_right:Nn \l__dfg_oes_table_body_tl { & }
  \seq_map_indexed_inline:Nn \l__dfg_oes_affiliation_seq
  {
    \int_compare:nNnF {##1} = {1}
      { \tl_put_right:Nn \l__dfg_oes_table_body_tl { & } }
    \tl_set:Nn \l_tmpa_tl {##2}
    \prop_get:NVN \l__dfg_oes_affiliation_abbreviation_prop
      \l_tmpa_tl \l_tmpb_tl
    \tl_put_right:Ne \l__dfg_oes_table_body_tl
    {
      \exp_not:N \dfgShowCalculatedTag{affiliationLabel}{affiliation}
        {\exp_not:V \l_tmpb_tl}
    }
  }
  \tl_put_right:Nn \l__dfg_oes_table_body_tl { \\ }
  \__dfg_oes_append_category:nn { prof } { Professors }
  \__dfg_oes_append_category:nn { groupLeader }
    { Junior~research~group~leaders }
  \__dfg_oes_append_category:nn { postDoc } { Postdoctoral~researchers }
  \__dfg_oes_append_category:nn { PhD } { Doctoral~researchers }
  \__dfg_oes_append_category:nn { research } { Other~research~staff }
  \__dfg_oes_append_category:nn { nonResearch } { Non-research~staff }
  \__dfg_oes_append_category:nn { student }
    { Student~and~graduate~assistants }
}

\cs_new_protected:Npn \__dfg_oes_print_legend:
{
  \vspace*{-1.5\baselineskip}%
  %\par\noindent
  \group_begin:
  \footnotesize\textbf{Affiliations:}\space
  \seq_map_indexed_inline:Nn \l__dfg_oes_affiliation_seq
  {
    \int_compare:nNnF {##1} = {1} {;\space}
    \tl_set:Nn \l_tmpa_tl {##2}
    \prop_get:NVN \l__dfg_oes_affiliation_abbreviation_prop
      \l_tmpa_tl \l_tmpb_tl
    \prop_get:NVN \l__dfg_oes_affiliation_name_prop
      \l_tmpa_tl \l_tmpc_tl
    \textbf{\dfgShowCalculatedTag{affiliationLabel}{affiliation}
      {\l_tmpb_tl}}:~
    \dfgShowTag{##2}{name}{\l_tmpc_tl}[affiliation]
  }
  .\par
  \group_end:
}

\cs_new_protected:Npn \__dfg_oes_typeset:n #1
{
  \begin{tblr}[
    theme=main,
    long,
    expand=\l__dfg_oes_table_body_tl
  ]{
    colspec={#1},
    rowhead=3,
    rows={valign=m},
    column{2-Z}={halign=c},
    row{1-3}={font=\footnotesize\bfseries,
      fg=tableHeadingsFont,bg=tableHeadingsBG},
    hline{4}={wd=1pt,tableLines},
    vline{2}={wd=.75pt,tableLines}
  }
    \l__dfg_oes_table_body_tl
  \end{tblr}
}

\cs_new_protected:Npn \__dfg_overview_existing_staff:n #1
{
  \group_begin:
  \tl_set:Nn \l__dfg_oes_database_tl {#1}
  \seq_clear:N \l__dfg_oes_affiliation_seq
  \prop_clear:N \l__dfg_oes_affiliation_name_prop
  \prop_clear:N \l__dfg_oes_affiliation_abbreviation_prop
  \prop_clear:N \l__dfg_oes_count_prop
  \int_zero:N \l__dfg_oes_record_count_int
  \tl_clear:N \l__dfg_oes_applicant_affiliation_tl
  \DTLifdbexists{meta}
  {
    \DTLgetvalueforkey{\l__dfg_oes_applicant_affiliation_tl}
      {ref-affiliation-id}{meta}{id}{crc}
  }
  { }
  \DTLifnullorempty{\l__dfg_oes_applicant_affiliation_tl}
    { \tl_set:Nn \l__dfg_oes_applicant_affiliation_tl { applicant } }
    { }
  \clist_set:NV \l__dfg_oes_applicant_affiliation_clist
    \l__dfg_oes_applicant_affiliation_tl
  \clist_map_inline:Nn \l__dfg_oes_applicant_affiliation_clist
    { \__dfg_oes_register_affiliation:n {##1} }
  \int_set:Nn \l__dfg_oes_applicant_affiliation_count_int
    { \seq_count:N \l__dfg_oes_affiliation_seq }
  \DTLifdbexists{#1}
  {
    \DTLforeach*{#1}
    {
      \pOESProject=ref-project-id,
      \pOESStatus=funding-status,
      \pOESLastname=lastname,
      \pOESPerson=ref-person-id,
      \pOESCategory=category,
      \pOESInstitutions=ref-institution-id,
      \pOESAffiliation=ref-affiliation-id
    }
    {
      \DTLifnullorempty{\pOESStatus}
      { }
      {
        \tl_set:Ne \l_tmpa_tl { \pOESStatus }
        \str_if_eq:VnT \l_tmpa_tl { existing }
          { \__dfg_oes_collect_current: }
      }
    }
  }
  { \msg_warning:nnn { dfg } { database-not-found } {#1} }
  \int_compare:nNnT { \l__dfg_oes_record_count_int } = {0}
    { \msg_warning:nnn { dfg } { existing-staff-no-data } {#1} }
  \__dfg_oes_build_table_body:
  \exp_args:NV \__dfg_oes_typeset:n \l__dfg_oes_colspec_tl
  \__dfg_oes_print_legend:
  \group_end:
}

\NewDocumentCommand{\OverviewExistingStaffTable}
  { O{RequestedFundingStaffOverview} }
{
  \bool_if:NTF \l__dfg_class_fastcompile_bool
    { \dfgItemSkipped{OverviewExistingStaffTable} }
    { \__dfg_overview_existing_staff:n {#1} }
}
\NewDocumentCommand{\OverviewOfFundsRequestedForStaffTable}{ O{RequestedFundingOverview} }{%
 \def\tmpLocalDB{#1}
  \tl_set:Nn \l__dfg_requested_staff_database_tl {#1}
  \DTLifdbexists{\tmpLocalDB}{%
	\tl_clear:N \l_tblr_body_tl
	\DTLsort{number}{project}
    \DTLforeach*[
      \not\DTLiseq{\tmpProjectStatus}{E}
      \and
      \not\DTLiseq{\tmpProjectConsiderForLists}{false}
    ]{project}{%
		\pProject               = number,
	    \tmpProjectStatus       = project-status,
	    \tmpProjectType         = project-type,
      \tmpProjectConsiderForLists = consider-for-lists,
	}{%
	\tl_put_right:Nx \l_tblr_body_tl
		{
			\getProject{\pProject}
			& \getCountRequestedStaff[\pProject]{1}{postDoc}
			& \getCountRequestedStaff[\pProject]{1}{PhD}
			& \getCountRequestedStaff[\pProject]{1}{research}
			& \getCountRequestedStaff[\pProject]{1}{nonResearch}
			& \getCountRequestedStaff[\pProject]{1}{student}

			& \getCountRequestedStaff[\pProject]{2}{postDoc}
			& \getCountRequestedStaff[\pProject]{2}{PhD}
			& \getCountRequestedStaff[\pProject]{2}{research}
			& \getCountRequestedStaff[\pProject]{2}{nonResearch}
			& \getCountRequestedStaff[\pProject]{2}{student}

			& \getCountRequestedStaff[\pProject]{3}{postDoc}
			& \getCountRequestedStaff[\pProject]{3}{PhD}
			& \getCountRequestedStaff[\pProject]{3}{research}
			& \getCountRequestedStaff[\pProject]{3}{nonResearch}
			& \getCountRequestedStaff[\pProject]{3}{student}

			& \getCountRequestedStaff[\pProject]{4}{postDoc}
			& \getCountRequestedStaff[\pProject]{4}{PhD}
			& \getCountRequestedStaff[\pProject]{4}{research}
			& \getCountRequestedStaff[\pProject]{4}{nonResearch}
			& \getCountRequestedStaff[\pProject]{4}{student}

			& \getCountRequestedStaff[\pProject]{5}{postDoc}
			& \getCountRequestedStaff[\pProject]{5}{PhD}
			& \getCountRequestedStaff[\pProject]{5}{research}
			& \getCountRequestedStaff[\pProject]{5}{nonResearch}
			& \getCountRequestedStaff[\pProject]{5}{student} \\
		}
     }

	\begin{tblr}[%
			theme=main,
			expand=\l_tblr_body_tl,
			long,
		]{%
			vspan=even,
			colspec = {*{1}{X[2,m]}
						*{24}{Q[c]}
				},
			rowhead = 2,
			colsep=4.5pt,
			vline{2,7,12,17,22}={tableLines,solid,wd=.75pt},
			vline{2,7,12,17,22}={3-Z}{tableLines,solid,wd=.75pt},
			hline{2}={wd=0pt},
			hline{3}={wd=1pt,tableLines},
			hline{Y}={wd=1pt,tableOuterLines},
			row{2} = {
				         fg={tableHeadingsFont},
				         bg={tableHeadingsBG},
				         halign={c}
			         },
			row{Z}= {font={\footnotesize\bfseries}}
		}
		 &
		\SetCell[c=5]{c} \dfgFundingYear{1}
		 & & & & &
		\SetCell[c=5]{c} \dfgFundingYear{2}
		 & & & & &
		\SetCell[c=5]{c} \dfgFundingYear{3}
		 & & & & &
		\SetCell[c=5]{c} \dfgFundingYear{4}
		 & & & & &
		\SetCell[c=5]{c} \dfgFundingYear{5}
		 & & & &
		\\
		\rotatebox{90}{Project} %
		 & \dfgRotate{postDoc}
		 & \dfgRotate{PhD}
		 & \dfgRotate{research}
		 & \dfgRotate{nonResearch}
		 & \dfgRotate{student}
		 & \dfgRotate{postDoc}
		 & \dfgRotate{PhD}
		 & \dfgRotate{research}
		 & \dfgRotate{nonResearch}
		 & \dfgRotate{student}
		 & \dfgRotate{postDoc}
		 & \dfgRotate{PhD}
		 & \dfgRotate{research}
		 & \dfgRotate{nonResearch}
		 & \dfgRotate{student}
		 & \dfgRotate{postDoc}
		 & \dfgRotate{PhD}
		 & \dfgRotate{research}
		 & \dfgRotate{nonResearch}
		 & \dfgRotate{student}
		 & \dfgRotate{postDoc}
		 & \dfgRotate{PhD}
		 & \dfgRotate{research}
		 & \dfgRotate{nonResearch}
		 & \dfgRotate{student}
		\\
		\l_tblr_body_tl
		Total
		 & \getCountRequestedStaff{1}{postDoc}
		 & \getCountRequestedStaff{1}{PhD}
		 & \getCountRequestedStaff{1}{research}
		 & \getCountRequestedStaff{1}{nonResearch}
		 & \getCountRequestedStaff{1}{student}
		 & \getCountRequestedStaff{2}{postDoc}
		 & \getCountRequestedStaff{2}{PhD}
		 & \getCountRequestedStaff{2}{research}
		 & \getCountRequestedStaff{2}{nonResearch}
		 & \getCountRequestedStaff{2}{student}
		 & \getCountRequestedStaff{3}{postDoc}
		 & \getCountRequestedStaff{3}{PhD}
		 & \getCountRequestedStaff{3}{research}
		 & \getCountRequestedStaff{3}{nonResearch}
		 & \getCountRequestedStaff{3}{student}
		 & \getCountRequestedStaff{4}{postDoc}
		 & \getCountRequestedStaff{4}{PhD}
		 & \getCountRequestedStaff{4}{research}
		 & \getCountRequestedStaff{4}{nonResearch}
		 & \getCountRequestedStaff{4}{student}
		 & \getCountRequestedStaff{5}{postDoc}
		 & \getCountRequestedStaff{5}{PhD}
		 & \getCountRequestedStaff{5}{research}
		 & \getCountRequestedStaff{5}{nonResearch}
		 & \getCountRequestedStaff{5}{student}
	\end{tblr}

}
  {
	Database~ \texttt{#1}~ missing.
	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
  \tl_set:Nn \l__dfg_requested_staff_database_tl { RequestedFunding }
}
\NewDocumentCommand{\getSumRequestedFundsInstrumentation}{som}{
  % #2: project
  % #3: year
  \IfNoValueTF{#2}
    { \__dfg_funding_sum_set:Nnnnn \SumFundsRequestedInstrumentation
        {RequestedFundingOverview}{__ALL__}{instrumentation}{#3} }
    { \__dfg_funding_sum_set:Nnnnn \SumFundsRequestedInstrumentation
        {RequestedFundingOverview}{#2}{instrumentation}{#3} }
  \__dfg_show_calculated_number:nnN
    {getSumRequestedFundsInstrumentation}
    {RequestedFundingOverview}
    \SumFundsRequestedInstrumentation
}
\NewDocumentCommand{\OverviewFundsRequestedInstrumentationTable} { O{RequestedFundingOverview} }{%
\def\tmpLocalDB{#1}
  \DTLifdbexists{\tmpLocalDB}{%
	\tl_clear:N \l_tblr_body_tl
	\DTLsort{ref-project-id}{\tmpLocalDB}
	\DTLforeach*[\DTLiseq{\pFundingType}{instrumentation}]{\tmpLocalDB}{%
		\pProject=ref-project-id,
        \pFundingType=type,
		\pDescription=category,
		\pSumYearOne=sum-year1,
		\pSumYearTwo=sum-year2,
		\pSumYearThree=sum-year3,
		\pSumYearFour=sum-year4,
		\pSumYearFive=sum-year5
	}{%
	\tl_put_right:Nx \l_tblr_body_tl
		{
			\getProject{\pProject}
			\printMarginalia{
				\getSumRequestedFundsInstrumentation[\pProject]{%
					sum-year1,
					sum-year2,
					sum-year3,
					sum-year4,
					sum-year5
				}
			}
      & \dfgShowTag{\pProject}{category}{\pDescription}[\tmpLocalDB]
      & \dfgShowTag{\pProject}{sum-year1}
          {\exp_not:N \__dfg_show_eur:n {\pSumYearOne}}[\tmpLocalDB]
      & \dfgShowTag{\pProject}{sum-year2}
          {\exp_not:N \__dfg_show_eur:n {\pSumYearTwo}}[\tmpLocalDB]
      & \dfgShowTag{\pProject}{sum-year3}
          {\exp_not:N \__dfg_show_eur:n {\pSumYearThree}}[\tmpLocalDB]
      & \dfgShowTag{\pProject}{sum-year4}
          {\exp_not:N \__dfg_show_eur:n {\pSumYearFour}}[\tmpLocalDB]
      & \dfgShowTag{\pProject}{sum-year5}
          {\exp_not:N \__dfg_show_eur:n {\pSumYearFive}}[\tmpLocalDB] \\
		}
     }
\tl_if_empty:VTF \l_tblr_body_tl
{
	\par\noindent
	No~funds~for~instrumentation~are~requested~for~funding~period~
	\dfgFundingPeriodNumeral.
	\par
}
{
\begin{tblr}[%
			theme=main,
			expand=\l_tblr_body_tl,
			long,
			remark{Note} = {Figures~ in~ EUR}
		]{%
			vspan=even,
			row{Z} = {guard,font={\footnotesize\bfseries}},
			colspec = {
					*{1}{X[-1,t]}
						*{1}{X[2,t]}
						*{5}{X[-1,c,si={table-format=8}]}
				},
			rowhead = 2,
			column{3-7}={guard},
			%colsep=4.5pt,
			hline{2}={wd=0pt},
			hline{3}={wd=1pt,tableOuterLines},
			hline{Y}={wd=1pt,tableOuterLines},
			row{2} = {
				         fg={tableHeadingsFont},
				         bg={tableHeadingsBG},
				         halign={c},
				         guard,
			         },
		}
		Project
		 & {Description~of                                 \\ instrumentation}
		 & \SetCell[c=5]{c,guard} Funds~ requested~ for
		 &                                                                     % year 2
		 &                                                                     % year 3
		 &                                                                     % year 4
		 &                                                                     % year 5
		\\
		 &
		 & \dfgFundingYear{1}
		 & \dfgFundingYear{2}
		 & \dfgFundingYear{3}
		 & \dfgFundingYear{4}
		 & \dfgFundingYear{5}   \\

		\l_tblr_body_tl
		\SetCell[c=2]{l}Total
		\printMarginalia{
			\getSumRequestedFundsInstrumentation{%
				sum-year1,
				sum-year2,
				sum-year3,
				sum-year4,
				sum-year5
			}
		}
		 &
		 & \getSumRequestedFundsInstrumentation{sum-year1}
		 & \getSumRequestedFundsInstrumentation{sum-year2}
		 & \getSumRequestedFundsInstrumentation{sum-year3}
		 & \getSumRequestedFundsInstrumentation{sum-year4}
		 & \getSumRequestedFundsInstrumentation{sum-year5}   \\
	\end{tblr}
}
}
  {
	Database~ \texttt{#1}~ missing.
	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}

\prop_new:N \g__dfg_dtlsum_cache_prop

\cs_new_protected:Npn \__dfg_dtlsum_filtered:nnnnN #1#2#3#4#5 {
  \tl_set:Nx \l_tmpa_tl
  { #1 || \tl_to_str:n {#2} || \tl_to_str:n {#3} || \tl_to_str:n {#4} }
  \prop_get:NVNTF \g__dfg_dtlsum_cache_prop \l_tmpa_tl \l_tmpb_tl
  { \cs_set_eq:NN #5 \l_tmpb_tl }
  {%
  	\DTLsumforkeys[\DTLiseq{\pCacheKey}{#3}][\pCacheKey=#2]{#1}{#4}{#5}%
  	\prop_gput:NVV \g__dfg_dtlsum_cache_prop \l_tmpa_tl #5
  }
}

\cs_new_protected:Npn \__dfg_dtlsum_all:nnN #1#2#3 {
  \tl_set:Nx \l_tmpa_tl
  { #1 || NOFILTER || \tl_to_str:n {#2} }
  \prop_get:NVNTF \g__dfg_dtlsum_cache_prop \l_tmpa_tl \l_tmpb_tl
  { \cs_set_eq:NN #3 \l_tmpb_tl }
  {%
  	\DTLsumforkeys{#1}{#2}{#3}%
  	\prop_gput:NVV \g__dfg_dtlsum_cache_prop \l_tmpa_tl #3
  }
}


\providecommand{\SumPreviousRequestedFunding}{0}
\providecommand{\SumRequestedFunding}{0}

\NewDocumentCommand{\getSumPreviousRequestedFunding}{O{PreviousRequestedFunding}mm}{%
  \DTLifdbexists{#1}{%
  	\str_if_eq:nnTF {#2} {all}
  	{ \__dfg_dtlsum_all:nnN {#1} {#3} \SumPreviousRequestedFunding }
  	{ \__dfg_dtlsum_filtered:nnnnN {#1} {year} {#2} {#3} \SumPreviousRequestedFunding }%
    \__dfg_show_calculated_number:nnN
      {getSumPreviousRequestedFunding}{#1}
      \SumPreviousRequestedFunding
  }{%
  	\texttt{\color{error}XXX}%
  	\msg_warning:nne { dfg } { database-not-found } { #1 }%
  }%
}

\NewDocumentCommand{\getSumRequestedFunding}{O{RequestedFundingOverview}mm}{%
  \DTLifdbexists{#1}{%
  	\str_if_eq:nnTF {#2} {all}
    { \__dfg_funding_sum_set:Nnnnn \SumRequestedFunding {#1}
      {__ALL__}{#3}{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5} }
    { \__dfg_funding_sum_set:Nnnnn \SumRequestedFunding {#1}
      {__ALL__}{#3}{sum-year#2} }%
    \__dfg_show_calculated_number:nnN
      {getSumRequestedFunding}{#1}
      \SumRequestedFunding
  }{%
  	\texttt{\color{error}XXX}%
  	\msg_warning:nne { dfg } { database-not-found } { #1 }%
  }%
}

\NewDocumentCommand{\getTotalSumRequestedFunding}{O{RequestedFundingOverview}mm}{%
  \DTLifdbexists{#1}{%
    \tl_set:Nn \l_tmpa_tl {#3}
    \str_if_eq:nnT {#3} {all} { \tl_set:Nn \l_tmpa_tl {__ALL__} }
    \str_if_eq:nnTF {#2} {all}
      { \__dfg_funding_sum_set:Nnnnn \SumRequestedFunding {#1}
          {__ALL__}{\l_tmpa_tl}
          {sum-year1,sum-year2,sum-year3,sum-year4,sum-year5} }
      { \__dfg_funding_sum_set:Nnnnn \SumRequestedFunding {#1}
          {__ALL__}{\l_tmpa_tl}{sum-year#2} }%
    \__dfg_show_calculated_number:nnN
      {getTotalSumRequestedFunding}{#1}
      \SumRequestedFunding
  }{%
  	\texttt{\color{error}XXX}%
  	\msg_warning:nne { dfg } { database-not-found } { #1 }%
  }%
}

\NewDocumentCommand{\PreviousAndCurrentRequestedFundingTable}{O{PreviousRequestedFunding}}
{
  \def\tmpLocalDB{#1}
  \begin{tblr}[%
  		theme=main,
  		expand=\l_tblr_body_tl,
  		long,
		remark{Note} = {Figures~ in~ EUR}
  	]{%
  		row{8,Z} = {guard,font={\footnotesize\bfseries}},
  		colspec = {
        *{1}{t{3.5cm}}@{}
        *{6}{X[-1,c,si={table-format=8}]}
      },
  		rowhead = 2,
		column{2-7}={guard},
  		%colsep=4.5pt,
  		hline{2}={wd=0pt},
  		hline{3}={wd=1pt,tableOuterLines},
  		% hline{Y}={wd=1pt,tableOuterLines},
  		row{1,2} = {
  			           fg={tableHeadingsFont},
  			           bg={tableHeadingsBG},
  			           halign={c},
  			           guard,
  		           },
  	}
  	\SetCell[r=2]{b}{Financial~year/                         \\funding~period}
  	 & \SetCell[c=5]{c} Funding~ for                         % staff
  	 &                                                       % costs
  	 &                                                       % instrumentation
  	 &                                                       % fellowships
  	 &                                                       % globalfunds
  	 & \SetCell[r=2]{b} Total                                \\
  	 &
  	Staff
  	 & Direct~ costs
  	 & Instrumentation
  	 & Fellowships
  	 & Globalfunds
  	 &                                                       \\
	\dfgFundingYearPrevious{1}
    \printMarginalia{%
      \getSumPreviousRequestedFunding{1}{%
        staff,costs,instrumentation,fellowships,globalfunds}%
    }
  	 & \getSumPreviousRequestedFunding{1}{staff}             % staff
  	 & \getSumPreviousRequestedFunding{1}{costs}             % costs
  	 & \getSumPreviousRequestedFunding{1}{instrumentation}   % instrumentation
  	 & \getSumPreviousRequestedFunding{1}{fellowships}       % fellowships
  	 & \getSumPreviousRequestedFunding{1}{globalfunds}       % globalfunds
  	 &
  	\getSumPreviousRequestedFunding{1}{staff,costs,instrumentation,
  		fellowships,globalfunds}
  	\\ % Total

	\dfgFundingYearPrevious{2}
    \printMarginalia{%
      \getSumPreviousRequestedFunding{2}{%
        staff,costs,instrumentation,fellowships,globalfunds}%
    }
  	 & \getSumPreviousRequestedFunding{2}{staff}             % staff
  	 & \getSumPreviousRequestedFunding{2}{costs}             % costs
  	 & \getSumPreviousRequestedFunding{2}{instrumentation}   % instrumentation
  	 & \getSumPreviousRequestedFunding{2}{fellowships}       % fellowships
  	 & \getSumPreviousRequestedFunding{2}{globalfunds}       % globalfunds
  	 &
  	\getSumPreviousRequestedFunding{2}{staff,costs,instrumentation,
  		fellowships,globalfunds}
  	\\ % Total
	\dfgFundingYearPrevious{3}
    \printMarginalia{%
      \getSumPreviousRequestedFunding{3}{%
        staff,costs,instrumentation,fellowships,globalfunds}%
    }
  	 & \getSumPreviousRequestedFunding{3}{staff}             % staff
  	 & \getSumPreviousRequestedFunding{3}{costs}             % costs
  	 & \getSumPreviousRequestedFunding{3}{instrumentation}   % instrumentation
  	 & \getSumPreviousRequestedFunding{3}{fellowships}       % fellowships
  	 & \getSumPreviousRequestedFunding{3}{globalfunds}       % globalfunds
  	 &
  	\getSumPreviousRequestedFunding{3}{staff,costs,instrumentation,
  		fellowships,globalfunds}
  	\\ % Total

	\dfgFundingYearPrevious{4}
    \printMarginalia{%
      \getSumPreviousRequestedFunding{4}{%
        staff,costs,instrumentation,fellowships,globalfunds}%
    }
  	 & \getSumPreviousRequestedFunding{4}{staff}             % staff
  	 & \getSumPreviousRequestedFunding{4}{costs}             % costs
  	 & \getSumPreviousRequestedFunding{4}{instrumentation}   % instrumentation
  	 & \getSumPreviousRequestedFunding{4}{fellowships}       % fellowships
  	 & \getSumPreviousRequestedFunding{4}{globalfunds}       % globalfunds
  	 &
  	\getSumPreviousRequestedFunding{4}{staff,costs,instrumentation,
  		fellowships,globalfunds}
  	\\ % Total

	\dfgFundingYearPrevious{5}
    \printMarginalia{%
      \getSumPreviousRequestedFunding{5}{%
        staff,costs,instrumentation,fellowships,globalfunds}%
    }
  	 & \getSumPreviousRequestedFunding{5}{staff}             % staff
  	 & \getSumPreviousRequestedFunding{5}{costs}             % costs
  	 & \getSumPreviousRequestedFunding{5}{instrumentation}   % instrumentation
  	 & \getSumPreviousRequestedFunding{5}{fellowships}       % fellowships
  	 & \getSumPreviousRequestedFunding{5}{globalfunds}       % globalfunds
  	 &
  	\getSumPreviousRequestedFunding{5}{staff,costs,instrumentation,
  		fellowships,globalfunds}
  	\\ % Total
  	\SetHline{-}{tableOuterLines,0.5pt}
  	\SetRow{belowsep=5pt}
    Ending~Funding~period
    \printMarginalia{%
      \getSumPreviousRequestedFunding{all}{%
        staff,costs,instrumentation,fellowships,globalfunds}%
    }
  	 & \getSumPreviousRequestedFunding{all}{staff}           % staff
  	 & \getSumPreviousRequestedFunding{all}{costs}           % costs
  	 & \getSumPreviousRequestedFunding{all}{instrumentation} % instrumentation
  	 & \getSumPreviousRequestedFunding{all}{fellowships}     % fellowships
  	 & \getSumPreviousRequestedFunding{all}{globalfunds}     % globalfunds
  	 &
  	\getSumPreviousRequestedFunding{all}{staff,costs,instrumentation,
  		fellowships,globalfunds}
  	\\ % Total

  	\SetHline{-}{tableOuterLines,1pt}
	\dfgFundingYear{1}
    \printMarginalia{\getTotalSumRequestedFunding{1}{all}}
  	 & \getSumRequestedFunding{1}{staff}
  	 & \getSumRequestedFunding{1}{costs}
  	 & \getSumRequestedFunding{1}{instrumentation}
  	 & \getSumRequestedFunding{1}{fellowships}
  	 & \getSumRequestedFunding{1}{globalfunds}
  	 & \getTotalSumRequestedFunding{1}{all}
  	\\
	\dfgFundingYear{2}
    \printMarginalia{\getTotalSumRequestedFunding{2}{all}}
  	 & \getSumRequestedFunding{2}{staff}
  	 & \getSumRequestedFunding{2}{costs}
  	 & \getSumRequestedFunding{2}{instrumentation}
  	 & \getSumRequestedFunding{2}{fellowships}
  	 & \getSumRequestedFunding{2}{globalfunds}
  	 & \getTotalSumRequestedFunding{2}{all}
  	\\

	\dfgFundingYear{3}
    \printMarginalia{\getTotalSumRequestedFunding{3}{all}}
  	 & \getSumRequestedFunding{3}{staff}
  	 & \getSumRequestedFunding{3}{costs}
  	 & \getSumRequestedFunding{3}{instrumentation}
  	 & \getSumRequestedFunding{3}{fellowships}
  	 & \getSumRequestedFunding{3}{globalfunds}
  	 & \getTotalSumRequestedFunding{3}{all}
  	\\
	\dfgFundingYear{4}
    \printMarginalia{\getTotalSumRequestedFunding{4}{all}}
  	 & \getSumRequestedFunding{4}{staff}
  	 & \getSumRequestedFunding{4}{costs}
  	 & \getSumRequestedFunding{4}{instrumentation}
  	 & \getSumRequestedFunding{4}{fellowships}
  	 & \getSumRequestedFunding{4}{globalfunds}
  	 & \getTotalSumRequestedFunding{4}{all}
  	\\
	\dfgFundingYear{5}
    \printMarginalia{\getTotalSumRequestedFunding{5}{all}}
  	 & \getSumRequestedFunding{5}{staff}
  	 & \getSumRequestedFunding{5}{costs}
  	 & \getSumRequestedFunding{5}{instrumentation}
  	 & \getSumRequestedFunding{5}{fellowships}
  	 & \getSumRequestedFunding{5}{globalfunds}
  	 & \getTotalSumRequestedFunding{5}{all}
  	\\

  	\SetHline{-}{tableOuterLines,0.5pt}
  	New~ Funding~period
    \printMarginalia{\getTotalSumRequestedFunding{all}{all}}
  	 & \getTotalSumRequestedFunding{all}{staff}              % staff
  	 & \getTotalSumRequestedFunding{all}{costs}              % costs
  	 & \getTotalSumRequestedFunding{all}{instrumentation}    % instrumentation
  	 & \getTotalSumRequestedFunding{all}{fellowships}        % fellowships
  	 & \getTotalSumRequestedFunding{all}{globalfunds}        % globalfunds
  	 &
  	\getTotalSumRequestedFunding{all}{all}
  	\\ % Total
  \end{tblr}
}
\cs_new_protected:Npn
  \__dfg_get_sum_previous_requested_funding_eur:nnn #1#2#3
{
  \DTLifdbexists{#1}
  {
    \str_if_eq:nnTF {#2} {all}
      { \__dfg_dtlsum_all:nnN {#1} {#3} \SumPreviousRequestedFunding }
      { \__dfg_dtlsum_filtered:nnnnN
          {#1} {year} {#2} {#3} \SumPreviousRequestedFunding }
    \__dfg_show_calculated_number:nnN
      {getSumPreviousRequestedFunding}{#1}
      \SumPreviousRequestedFunding
  }
  {
    \texttt{\color{error}XXX}
    \msg_warning:nne { dfg } { database-not-found } {#1}
  }
}

\NewDocumentCommand{\getSumRequestedFundingDirectCosts}{
  O{RequestedAndExistingFundingDirectCostsOverview}
  m m }
{
  % #1: database
  % #2: year
  % #3: affiliation

  \str_if_eq:nnTF {#2}{all}
  {
  	\str_case:nn {#3}
  	{
		{applicant} {\DTLsumforkeys[\DTLisinlist{\pAffiliation}{\theApplicantID}]
  			[\pAffiliation=ref-affiliation-id]{#1}
  			{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  			{\SumRequestedFundingDirectCosts}}

  		{participant}{
  			\DTLsumforkeys[
				\not\DTLisinlist{\pAffiliation}{\theApplicantID}
  				\and
  				\not\DTLiseq{\pAffiliation}{other-funds}
  			]
  			[\pAffiliation=ref-affiliation-id]{#1}
  			{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  			{\SumRequestedFundingDirectCosts}}

  		{other-funds}{\DTLsumforkeys[\DTLiseq{\pAffiliation}{other-funds}]
  			[\pAffiliation=ref-affiliation-id]{#1}
  			{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  			{\SumRequestedFundingDirectCosts}}

  		{all}{\DTLsumforkeys{#1}
  			{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  			{\SumRequestedFundingDirectCosts}}
  	}}
  {
  	\str_case:nn {#3}
  	{
		{applicant} {\DTLsumforkeys[\DTLisinlist{\pAffiliation}{\theApplicantID}]
  			[\pAffiliation=ref-affiliation-id]{#1}
  			{sum-year#2}
  			{\SumRequestedFundingDirectCosts}}

  		{participant}{
  			\DTLsumforkeys[
				\not\DTLisinlist{\pAffiliation}{\theApplicantID}
  				\and
  				\not\DTLiseq{\pAffiliation}{other-funds}
  			]
  			[\pAffiliation=ref-affiliation-id]{#1}
  			{sum-year#2}
  			{\SumRequestedFundingDirectCosts}}

  		{other-funds}{\DTLsumforkeys[\DTLiseq{\pAffiliation}{other-funds}]
  			[\pAffiliation=ref-affiliation-id]{#1}
  			{sum-year#2}
  			{\SumRequestedFundingDirectCosts}}

  		{all}{\DTLsumforkeys{#1}
  			{sum-year#2}
  			{\SumRequestedFundingDirectCosts}}
  	}}

  \__dfg_show_calculated_number:nnN
    {getSumRequestedFundingDirectCosts}{#1}
    \SumRequestedFundingDirectCosts
}

\NewDocumentCommand{\ExistingFundsDirectCostsTable}
  {O{RequestedAndExistingFundingDirectCostsOverview}}
{
  \DTLifdbexists{#1}{
  	\begin{tblr}[%
  			theme=main,
  			% expand=\l_tblr_body_tl,
  			long,
			remark{Note} = {Figures~ in~ EUR}
  		]{%
  			row{7,Z} = {guard,font={\footnotesize\bfseries}},
			colspec = {
        *{1}{t{3.5cm}}
        *{4}{X[-1,c,si={table-format=9}]}
      },
  			% rowhead = 1,
			column{2-5}={guard},
  			%colsep=4.5pt,
  			% hline{3}={wd=1pt,tableOuterLines},
  			% hline{Y}={wd=1pt,tableOuterLines},
  			row{1} = {
  				         fg={tableHeadingsFont},
  				         bg={tableHeadingsBG},
  				         halign={c},
  				         guard,
  			         },
  		}
		 {Financial~year/                                                                         \\funding~period}
		 & {Core~ support~ provided~                                                             \\by~ applicant~
		   \dfgApplicantAffiliationsTF{university}{universities}}

  		 & {Core~ support~ provided~                                                             \\by~
  			   other~ participating~ institutions}
  		 & Other~ funds
  		 & Total                                                                                                              \\

		\dfgFundingYearPrevious{1}
      \printMarginalia{%
        \__dfg_get_sum_previous_requested_funding_eur:nnn
          {PreviousExistingFundsDirectCosts}{1}{%
          applicant,participant,other-funds}%
      }
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{1}{applicant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{1}{participant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{1}{other-funds}}
		 &
		{\__dfg_get_sum_previous_requested_funding_eur:nnn
		    {PreviousExistingFundsDirectCosts}{1}{
				applicant,
				participant,
				other-funds}}                                                \\

		\dfgFundingYearPrevious{2}
      \printMarginalia{%
        \__dfg_get_sum_previous_requested_funding_eur:nnn
          {PreviousExistingFundsDirectCosts}{2}{%
          applicant,participant,other-funds}%
      }
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{2}{applicant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{2}{participant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{2}{other-funds}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{2}{
				   applicant,
				   participant,
				   other-funds}}                                             \\

		\dfgFundingYearPrevious{3}
      \printMarginalia{%
        \__dfg_get_sum_previous_requested_funding_eur:nnn
          {PreviousExistingFundsDirectCosts}{3}{%
          applicant,participant,other-funds}%
      }
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{3}{applicant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{3}{participant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{3}{other-funds}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{3}{
				   applicant,
				   participant,
				   other-funds}}                                             \\

		\dfgFundingYearPrevious{4}
      \printMarginalia{%
        \__dfg_get_sum_previous_requested_funding_eur:nnn
          {PreviousExistingFundsDirectCosts}{4}{%
          applicant,participant,other-funds}%
      }
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{4}{applicant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{4}{participant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{4}{other-funds}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{4}{
				   applicant,
				   participant,
				   other-funds}}                                             \\

		\dfgFundingYearPrevious{5}
      \printMarginalia{%
        \__dfg_get_sum_previous_requested_funding_eur:nnn
          {PreviousExistingFundsDirectCosts}{5}{%
          applicant,participant,other-funds}%
      }
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{5}{applicant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{5}{participant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{5}{other-funds}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{5}{
				   applicant,
				   participant,
				   other-funds}}                                             \\

  		\SetHline{-}{tableOuterLines,0.5pt}
  		\SetRow{belowsep=5pt}
      Ending~Funding~period
      \printMarginalia{%
        \__dfg_get_sum_previous_requested_funding_eur:nnn
          {PreviousExistingFundsDirectCosts}{all}{%
          applicant,participant,other-funds}%
      }
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{all}{applicant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{all}{participant}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{all}{other-funds}}
		 & {\__dfg_get_sum_previous_requested_funding_eur:nnn
		      {PreviousExistingFundsDirectCosts}{all}{
				   applicant,
				   participant,
				   other-funds}}                                           \\

  		\SetHline{-}{tableOuterLines,1pt}
		\dfgFundingYear{1}
      \printMarginalia{\getSumRequestedFundingDirectCosts[#1]{1}{all}}
		 & \getSumRequestedFundingDirectCosts[#1]{1}{applicant}
		 & \getSumRequestedFundingDirectCosts[#1]{1}{participant}
		 & \getSumRequestedFundingDirectCosts[#1]{1}{other-funds}
		 & \getSumRequestedFundingDirectCosts[#1]{1}{all}                                                                         \\
		\dfgFundingYear{2}
      \printMarginalia{\getSumRequestedFundingDirectCosts[#1]{2}{all}}
		 & \getSumRequestedFundingDirectCosts[#1]{2}{applicant}
		 & \getSumRequestedFundingDirectCosts[#1]{2}{participant}
		 & \getSumRequestedFundingDirectCosts[#1]{2}{other-funds}
		 & \getSumRequestedFundingDirectCosts[#1]{2}{all}                                                                         \\
		\dfgFundingYear{3}
      \printMarginalia{\getSumRequestedFundingDirectCosts[#1]{3}{all}}
		 & \getSumRequestedFundingDirectCosts[#1]{3}{applicant}
		 & \getSumRequestedFundingDirectCosts[#1]{3}{participant}
		 & \getSumRequestedFundingDirectCosts[#1]{3}{other-funds}
		 & \getSumRequestedFundingDirectCosts[#1]{3}{all}                                                                         \\
		\dfgFundingYear{4}
      \printMarginalia{\getSumRequestedFundingDirectCosts[#1]{4}{all}}
		 & \getSumRequestedFundingDirectCosts[#1]{4}{applicant}
		 & \getSumRequestedFundingDirectCosts[#1]{4}{participant}
		 & \getSumRequestedFundingDirectCosts[#1]{4}{other-funds}
		 & \getSumRequestedFundingDirectCosts[#1]{4}{all}                                                                         \\
		\dfgFundingYear{5}
      \printMarginalia{\getSumRequestedFundingDirectCosts[#1]{5}{all}}
		 & \getSumRequestedFundingDirectCosts[#1]{5}{applicant}
		 & \getSumRequestedFundingDirectCosts[#1]{5}{participant}
		 & \getSumRequestedFundingDirectCosts[#1]{5}{other-funds}
		 & \getSumRequestedFundingDirectCosts[#1]{5}{all}                                                                         \\

  		\SetHline{-}{tableOuterLines,0.5pt}
		New~ Funding~period
      \printMarginalia{\getSumRequestedFundingDirectCosts[#1]{all}{all}}
		 & \getSumRequestedFundingDirectCosts[#1]{all}{applicant}
		 & \getSumRequestedFundingDirectCosts[#1]{all}{participant}
		 & \getSumRequestedFundingDirectCosts[#1]{all}{other-funds}
		 & \getSumRequestedFundingDirectCosts[#1]{all}{all}                                                                       \\
  	\end{tblr}
  }{
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}
\clist_new:N \l_tmp_research_area_clist
\bool_new:N  \l__dfg_project_one_PI_bool
\bool_new:N  \g__dfg_fast_project_started_bool

\NewDocumentCommand{\printProjectHead}{m}
{%
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  {
    \bool_if:NF \g__dfg_fast_project_started_bool
    {
      \setcounter{page}{1}% Ignore page checkpoints restored by excluded files.
      \bool_gset_true:N \g__dfg_fast_project_started_bool
    }
    \def\tmpLocalDB{project}%
    \setcounter{section}{0}%
    \setcounter{figure}{0}%
    \setcounter{table}{0}%
    \setcounter{secnumdepth}{2}%
    \restartlist{workpackages}%
    \tl_set:Nn \l__tmp_current_project_tl {#1}%
    \cs_set:Npn \tmpProjectNumber       {#1}%
    \cs_set:Npn \tmpProjectTitle        { }%
    \cs_set:Npn \tmpProjectStatus       { }%
    \cs_set:Npn \tmpProjectType         { }%
    \cs_set:Npn \tmpProjectResearchArea { }%
    \cs_set:Npn \tmpProjectPIids        { }%
    \bool_set_true:N \l__dfg_project_one_PI_bool
    \renewcommand*{\thesection}      {\arabic{section}}%
    \renewcommand*{\thesubsection}   {\thesection.\arabic{subsection}}%
    \renewcommand*{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}%
    \renewcommand*{\thefigure}       {\arabic{figure}}%
    \renewcommand*{\thetable}        {\arabic{table}}%
    \renewcommand*{\theHpart}        {\thepart.#1}%
    \renewcommand*{\theHchapter}     {\thechapter.#1}%
    \renewcommand*{\theHsection}     {\thesection.#1}%
    \renewcommand*{\theHsubsection}  {\thesubsection.#1}%
    \renewcommand*{\theHsubsubsection}{\thesubsubsection.#1}%
    \renewcommand*{\theHfigure}      {\thefigure.#1}%
    \renewcommand*{\theHtable}       {\thetable.#1}%
    \renewcommand*{\theHfootnote}    {\thefootnote.#1}%
    \chead*{\textbf{Project~#1}\enspace|\enspace FAST~COMPILE~-~DRAFT}%
    \printThumbIndexOff
    \bool_if:NT \l__dfg_class_fastcompile_project_show_publications_bool
    {
      \__dfg_project_results_prepare:n {#1}%
      \citereset
      \begin{refsection}
    }
  }
  {
  % #1: project id
  \cleardoublepage
\phantomsection
  \def\tmpLocalDB{project}%
  \setcounter{section}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{tocdepth}{0}%
  \restartlist{workpackages}%
  \tl_set:Nn \l__tmp_current_project_tl {#1}%
  \__dfg_project_results_prepare:n {#1}%

  \renewcommand*{\theHpart}        {\thepart.#1}%
  \renewcommand*{\theHchapter}     {\thechapter.#1}%
  \renewcommand*{\theHsection}     {\thesection.#1}%
  \renewcommand*{\theHsubsection}  {\thesubsection.#1}%
  \renewcommand*{\theHsubsubsection}{\thesubsubsection.#1}%
  \renewcommand*{\theHfigure}      {\thefigure.#1}%
  \renewcommand*{\theHtable}       {\thetable.#1}%
  \renewcommand*{\theHfootnote}    {\thefootnote.#1}%

  % --- single row scan for all project columns we need --------------------
  \getEntry*[\tmpLocalDB]{#1}{
  	\tmpProjectNumber       = number,
  	\tmpProjectTitle        = name,
  	\tmpProjectStatus       = project-status,
  	\tmpProjectType         = project-type,
  	\tmpProjectResearchArea = research-area,
  	\tmpProjectPIids        = ref-person-id
  }%

	% Register the bibliography aliases of every PI assigned to this project.
	% The mapping parameter is doubled because this loop occurs inside the
	% definition of \printProjectHead.
	\datatool_if_has_key:nnT { person } { name-alias }
	{
		\clist_map_inline:Nn \tmpProjectPIids
		{
			\DTLgetvalueforkey { \theAliases } { name-alias } { person } { id } { ##1 }
			\DTLifnullorempty { \theAliases }
			{ }
			{ \exp_args:No \addboldnames { \theAliases } }
		}
  	}

  % --- precompute the few derived booleans we actually use ----------------
  \int_compare:nNnTF { \clist_count:N \tmpProjectPIids } > {1}
  	{ \bool_set_false:N \l__dfg_project_one_PI_bool }
  	{ \bool_set_true:N  \l__dfg_project_one_PI_bool }%

  \citereset
  \hypertarget{project:#1}{}%

  \use:x
  {
  	\exp_not:N \printThumbIndex
  	[ project \tl_head:n {#1} ]
  	{ \exp_not:n {#1} }
  }%

  \chead{\getPIofProject{#1}[\space\cdot\space]%
    \space|\space
    \dfgShowTag{#1}{name}{\tmpProjectTitle}[project]}%

 % --- toc entry ----------------------------------------------------------
  \addtocentrydefault{section}{
    \texorpdfstring
      { \dfgShowTag{#1}{number}{\tmpProjectNumber}[project] }
      { \tmpProjectNumber }
    \str_if_eq:eeF {\tmpProjectStatus} {C}
      {
        \space
        \texorpdfstring
          {\dfgShowTag{#1}{project-status}{\tmpProjectStatus}[project]}
          {\tmpProjectStatus}
      }%
  }
  {
    \texorpdfstring{\dfgShowTag{#1}{name}{\tmpProjectTitle}[project]}{}%
  }%
  \setcounter{secnumdepth}{2}%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}%
  \hypersetup{bookmarksdepth=0}%
  \begin{refsection}

  \section{%
    General~information~about~Project~%
    \texorpdfstring
    {
      \getProject{#1}%
      \str_if_eq:eeF {\tmpProjectStatus} {C}
        { \c_space_tl
          \dfgShowTag{#1}{project-status}{\tmpProjectStatus}[project] }%
    }
    {\tmpProjectNumber}%
   }
 \subsection{Project~title:~
   \texorpdfstring
     {\dfgShowTag{#1}{name}{\tmpProjectTitle}[project]}
     {\tmpProjectTitle}}

  % --- research areas (for active research and service projects) ----------
  \str_if_eq:eeF {\tmpProjectStatus} {E}
  {
   \bool_lazy_or:nnT
   { \str_if_eq_p:ee {\tmpProjectType} {research} }
   { \str_if_eq_p:ee {\tmpProjectType} {service}  }
   {%
  	\clist_clear:N \l_tmp_research_area_clist
  	\clist_sort:Nn \tmpProjectResearchArea
  	{ \fp_compare:nTF {##1 < ##2} {\sort_return_swapped:} {\sort_return_same:} }%
  	\clist_map_inline:Nn \tmpProjectResearchArea
  	{ \clist_put_right:Nn \l_tmp_research_area_clist { \dfgResearchAreasList{##1} } }%
    \subsection{Research~area
      \int_compare:nNnT { \clist_count:N \tmpProjectResearchArea } > {1}
        {s}
      :~
      \texorpdfstring
        {\dfgShowTag{#1}{research-area}
          {\clist_use:Nn \l_tmp_research_area_clist {,~}}[project]}
        {\clist_use:Nn \l_tmp_research_area_clist {,~}}}%
   }
  }

  \bool_if:NTF \l__dfg_project_one_PI_bool
  { \subsection{Project~leader}  }
  { \subsection{Project~leaders} }

  \getPersonInformation{\tmpProjectPIids}\par
  \vspace*{2em}

  % --- contract information (skip for admin / ending) ---------------------
  \bool_lazy_or:nnF
  { \str_if_eq_p:ee {\tmpProjectType}   {admin} }
  { \str_if_eq_p:ee {\tmpProjectStatus} {E}     }
  {%
  	\begin{contractinformation}
  		\clist_map_inline:nn {C1,C2,C3,C4}
  		{ \dfgPIcontractInformation{##1} }%
  	\end{contractinformation}
  }

  % --- legal issues (skip for admin / mgk / ending) -----------------------
  \bool_lazy_any:nF
  {
  	{ \str_if_eq_p:ee {\tmpProjectType}   {admin} }
  	{ \str_if_eq_p:ee {\tmpProjectType}   {mgk}   }
  	{ \str_if_eq_p:ee {\tmpProjectStatus} {E}     }
  }
  {%
  	\subsection{Legal~issues}%
  	\def\tmpLocalDB{project}%
  	This~project~includes\\

  	\tl_clear:N \l_mytblr_body_tl
  	\tl_put_right:Ne \l_mytblr_body_tl
	{ 1. & research~requiring~compliance~with~discipline-specific~research~ethics~guidelines. & \checkYesNo{L1} \\ }%
  	\compareEntry{#1}{L1}{yes}
  	{
  		\tl_put_right:Ne \l_mytblr_body_tl
	{ & A~statement~from~the~responsible~ethics~committee~is~required~and~will~be~obtained~before~funding~starts. & \checkYesNo{L1a} \\ }%
  	}
  	{}%
  	\tl_put_right:Ne \l_mytblr_body_tl
  	{ 2. & clinical~trials & \checkYesNo{L2} \\ }%
  	\compareEntry{#1}{L2}{yes}
  	{
  		\tl_put_right:Ne \l_mytblr_body_tl
  		{ & A~copy~of~the~studies'~registration~is~included~with~the~proposal. & \checkYesNo{L2a} \\ }%
  	}
  	{}%
  	\tl_put_right:Ne \l_mytblr_body_tl
  	{
  		3. & experiments~involving~vertebrates. & \checkYesNo{L3} \\
  		4. & experiments~involving~recombinant~DNA. & \checkYesNo{L4} \\
  		5. & research~involving~human~embryonic~stem~cells. & \checkYesNo{L5} \\
  	}
  	\compareEntry{#1}{L5}{yes}
  	{
  		\tl_put_right:Ne \l_mytblr_body_tl
  		{ & Legal~authorization~has~been~obtained. & \checkYesNo{L5a} \\ }%
  	}
  	{}%
  	\tl_put_right:Ne \l_mytblr_body_tl
  	{
		6. & research~concerning~the~Convention~on~Biological~Diversity. & \checkYesNo{L6} \\
  		7. & investigations~involving~dual~use~research~of~concern. & \checkYesNo{L7} \\
  	}
  	\compareEntry{#1}{L7}{yes}
  	{
  		\tl_put_right:Ne \l_mytblr_body_tl
  		{ & A~copy~of~the~statement~by~the~institution's~research~ethics~committee~is~included~with~the~proposal. & \checkYesNo{L7a} \\ }%
  	}
  	{}%
  	\begin{tblr}[
  			theme  = plain,
  			expand = \l_mytblr_body_tl,
  		]{
  			rowhead   = 0,
			rowsep    = 0pt,
  			hline{2}  = {0pt},
  			rows      = {bg=white, halign=l, font=\footnotesize},
  			column{1} = {halign=r},
  			colspec   = {t{.25cm}X[t]t{.75cm}}
  		}
  		\tl_use:N \l_mytblr_body_tl
  	\end{tblr}%
  }
  }
}
\NewDocumentCommand{\checkYesNo}{O{\tmpProjectNumber} m}
{%
  \compareEntry{#1}%        current project ID
  {#2}%                   which cell
  {yes}%                 if cell value is 'yes'
  {\dfgShowTag{#1}{#2}{{\bfseries\color{green}\faCheck}\,yes}[project]}%
  {\dfgShowTag{#1}{#2}{{\bfseries\color{red}\faTimes}\space no}[project]}%
}

\seq_new:N   \l__dfg_contract_pi_ids_seq
\seq_new:N   \l__dfg_contract_true_pi_ids_seq
\seq_new:N   \l__dfg_contract_false_pi_ids_seq
\clist_new:N \l__dfg_contract_answers_clist
\tl_new:N    \l__dfg_contract_answer_tl
\tl_new:N    \l__dfg_contract_field_list_tl

\NewDocumentCommand{\dfgPIcontractInformation}{ o m }
 {
  % #1: optional comma-separated PI ids
  %     If omitted, use the current value of \tmpProjectPIids.
  % #2: question id, e.g. C1 / C2 / C3 / C4
  \IfNoValueTF {#1}
   {
    \__dfg_pi_contract_information:Vn \tmpProjectPIids {#2}
   }
   {
    \__dfg_pi_contract_information:nn {#1} {#2}
   }
 }

\cs_new_protected:Npn \__dfg_pi_contract_information:nn #1#2
 {
  % #1: comma-separated PI ids
  % #2: question id, e.g. C1 / C2 / C3 / C4

  \def\tmpLocalDB{person}%
  \seq_set_from_clist:Nn \l__dfg_contract_pi_ids_seq {#1}

  \str_case:nn {#2}
   {
    {C1}
     {
      \item
      Is~the~employment~of~the~
      \bool_if:NTF \l__dfg_project_one_PI_bool
       { project~leader~at~the~institution~ }
       { project~leaders~at~the~institutions~ }%
      indicated~contractually~secured~for~the~duration~of~
      the~proposed~funding~period?\space
      \__dfg_pi_contract_yes_no:n {#2}%
     }

    {C2}
     {
      \item
      \bool_if:NTF \l__dfg_project_one_PI_bool
       { Does~the~above~mentioned~person~hold~a~fixed-term~position? }
       { Do~any~of~the~above~mentioned~persons~hold~fixed-term~positions? }%
      \space
      \__dfg_pi_contract_yes_no:n {#2}%

      \clist_if_in:NnT \l__dfg_contract_answers_clist {yes}
       {
        \begin{contractinformation}
          \item End~date~of~fixed-term~contract:\space
          \__dfg_pi_contract_field_list:nN {C2a} \l__dfg_contract_true_pi_ids_seq

          \item Further~employment~is~planned~until:\space
          \__dfg_pi_contract_field_list:nN {C2b} \l__dfg_contract_true_pi_ids_seq
        \end{contractinformation}
       }
     }

    {C3}
     {
      \item
      \bool_if:NTF \l__dfg_project_one_PI_bool
       { Will~the~above~mentioned~person~ }
       { Will~one~or~more~of~the~above-mentioned~persons~ }%
      retire~during~the~proposed~funding~period?\space
      \__dfg_pi_contract_yes_no:n {#2}%

      \clist_if_in:NnT \l__dfg_contract_answers_clist {yes}
       {
        \begin{contractinformation}
          \item Anticipated~retirement~date:\space
          \__dfg_pi_contract_field_list:nN {C3a} \l__dfg_contract_true_pi_ids_seq
        \end{contractinformation}
       }
     }

    {C4}
     {
      \item
      Funding~for~the~position~of~the~
      \bool_if:NTF \l__dfg_project_one_PI_bool
       { project~leader~at~the~institution~ }
       { project~leaders~at~the~institutions~ }%
      indicated~is~covered~by~core~support~(state~funds~or~similar):\space
      \__dfg_pi_contract_yes_no:n {#2}%

      \clist_if_in:NnT \l__dfg_contract_answers_clist {no}
       {
        \begin{contractinformation}
          \item Type~and~source~of~funding:\space
          \__dfg_pi_contract_field_list:nN {C4a} \l__dfg_contract_false_pi_ids_seq
        \end{contractinformation}
       }
     }
   }
 }

\cs_generate_variant:Nn \__dfg_pi_contract_information:nn { Vn }

\cs_new_protected:Npn \__dfg_pi_contract_yes_no:n #1
 {
  % #1: question id, e.g. C1 / C2 / C3 / C4

  \clist_clear:N \l__dfg_contract_answers_clist
  \seq_clear:N   \l__dfg_contract_true_pi_ids_seq
  \seq_clear:N   \l__dfg_contract_false_pi_ids_seq
  \tl_clear:N    \l__dfg_contract_answer_tl

  \bool_set_true:N \l_tmpa_bool

  \seq_map_inline:Nn \l__dfg_contract_pi_ids_seq
   {
    \bool_if:NTF \l_tmpa_bool
     { \bool_set_false:N \l_tmpa_bool }
     { \tl_put_right:Nn \l__dfg_contract_answer_tl {,~} }%

    \DTLgetvalueforkey{\theLastName}{lastname}{person}{id}{##1}%

    \compareEntry{##1}{#1}{yes}
     {
      \tl_put_right:Nn \l__dfg_contract_answer_tl
        { \dfgShowTag{##1}{#1}{\textbf{yes}}[person] }%
      \clist_put_right:Nn \l__dfg_contract_answers_clist {true}%
      \seq_put_right:Nn   \l__dfg_contract_true_pi_ids_seq {##1}%
     }
     {
      \tl_put_right:Nn \l__dfg_contract_answer_tl
        { \dfgShowTag{##1}{#1}{\textbf{no}}[person] }%
      \clist_put_right:Nn \l__dfg_contract_answers_clist {false}%
      \seq_put_right:Nn   \l__dfg_contract_false_pi_ids_seq {##1}%
     }

    \bool_if:NF \l__dfg_project_one_PI_bool
     {
      \tl_put_right:Nx \l__dfg_contract_answer_tl
       {
        \exp_not:n {~(}
        \exp_not:N \dfgShowTag{##1}{lastname}
          {\exp_not:V \theLastName}[person]
        \exp_not:n {)}
       }%
     }
   }

  \tl_use:N \l__dfg_contract_answer_tl
 }

\cs_new_protected:Npn \__dfg_pi_contract_field_list:nN #1#2
 {
  % #1: field id, e.g. C2a / C2b / C3a / C4a
  % #2: sequence variable containing the PI ids for which the field is relevant

  \tl_clear:N \l__dfg_contract_field_list_tl
  \bool_set_true:N \l_tmpa_bool

  \seq_map_inline:Nn #2
   {
    \bool_if:NTF \l_tmpa_bool
     { \bool_set_false:N \l_tmpa_bool }
     { \tl_put_right:Nn \l__dfg_contract_field_list_tl {,~} }%

    \getEntry*[person]{##1}
     {
      \theFieldValue = #1,
      \theLastName   = lastname
     }%

    \tl_put_right:Nx \l__dfg_contract_field_list_tl
     {
      \exp_not:N \textbf
      {
        \exp_not:N \dfgShowTag{##1}{#1}
          {\exp_not:V \theFieldValue}[person]
      }
      \int_compare:nNnT { \seq_count:N #2 } > {1}
       {
        \exp_not:n {~(}
        \exp_not:N \dfgShowTag{##1}{lastname}
          {\exp_not:V \theLastName}[person]
        \exp_not:n {)}
       }
     }%
   }

  \tl_use:N \l__dfg_contract_field_list_tl
 }

\cs_new_protected:Npn \__pi_question_field_list:nn #1#2
{%
  \tl_clear:N \l_tmpa_tl
  \bool_set_true:N \l_tmpa_bool   % first-iteration flag
  \seq_map_inline:Nn #2
  {%
  	\bool_if:NTF \l_tmpa_bool
  	{ \bool_set_false:N \l_tmpa_bool }
  	{ \tl_put_right:Nn \l_tmpa_tl {,~} }%
  	\getEntry*[person]{##1}{
  		\theFieldValue = #1,
  		\theLastName   = lastname
  	}%
  	\tl_put_right:Nx \l_tmpa_tl
  	{
		\exp_not:N \textbf
    {
      \exp_not:N \dfgShowTag{##1}{#1}
        {\exp_not:V \theFieldValue}[person]
    }
  		\int_compare:nNnT { \seq_count:N #2 } > {1}
      {
        \exp_not:n {\space(}
        \exp_not:N \dfgShowTag{##1}{lastname}
          {\exp_not:V \theLastName}[person]
        \exp_not:n {)}
      }
  	}%
  }%
  \tl_use:N \l_tmpa_tl
}

\tl_new:N \l__dfg_yes_names_tl
\tl_new:N \l__dfg_no_names_tl

\cs_new_protected:Npn \tmp_person_question_yes_no:n #1
{%
  \clist_clear:N \l_tmpc_clist
  \seq_clear:N   \l_tmpd_seq
  \seq_clear:N   \l_tmpe_seq
  \tl_clear:N    \l_tmpa_tl
  \bool_set_true:N \l_tmpa_bool   % first-iteration flag
  \seq_map_inline:Nn \l_tmpa_seq
  {%
  	\bool_if:NTF \l_tmpa_bool
  	{ \bool_set_false:N \l_tmpa_bool }
  	{ \tl_put_right:Nn \l_tmpa_tl {,~} }%
  	\DTLgetvalueforkey{\theLastName}{lastname}{person}{id}{##1}%
  	\compareEntry{##1}{#1}{yes}
  	{%
    \tl_put_right:Nn \l_tmpa_tl
      { \dfgShowTag{##1}{#1}{\textbf{yes}}[person] }%
  		\clist_put_right:Nn \l_tmpc_clist {yes}%
  		\seq_put_right:Nn   \l_tmpd_seq   {##1}%
  	}
  	{%
    \tl_put_right:Nn \l_tmpa_tl
      { \dfgShowTag{##1}{#1}{\textbf{no}}[person] }%
  		\clist_put_right:Nn \l_tmpc_clist {false}%
  		\seq_put_right:Nn   \l_tmpe_seq   {##1}%
  	}%
  	\bool_if:NF \l__dfg_project_one_PI_bool
  	{%
    \tl_put_right:Nx \l_tmpa_tl
    {
      \exp_not:n {\space(}
      \exp_not:N \dfgShowTag{##1}{lastname}
        {\exp_not:V \theLastName}[person]
      \exp_not:n {)}
    }%
  	}%
  }%
  \tl_use:N \l_tmpa_tl
}
\clist_new:N \l__dfg_project_results_quality_assured_clist
\clist_new:N \l__dfg_project_results_other_clist
\clist_new:N \l__dfg_project_results_patents_clist
\clist_new:N \l__dfg_project_results_all_clist
\clist_new:N \l__dfg_project_results_excluded_clist
\prop_new:N  \g__dfg_project_results_aux_prop

\NewDocumentCommand{\dfgProjectResultsAux}{mm}
{
  \prop_gput:Nnn \g__dfg_project_results_aux_prop {#1} {#2}
}

\cs_new_protected:Npn \__dfg_project_results_prepare:n #1
{
  \clist_clear:N \l__dfg_project_results_excluded_clist
  \prop_get:NnNT \g__dfg_project_results_aux_prop {#1} \l_tmpa_tl
  {
    \clist_set:NV \l__dfg_project_results_excluded_clist \l_tmpa_tl
  }
}

\cs_new_protected:Npn \__dfg_project_results_collect:N #1
{
  \clist_map_inline:Nn #1
  {
    \str_if_eq:nnF {##1} {none}
    { \clist_put_right:Nn \l__dfg_project_results_all_clist {##1} }
  }
}

\cs_new_protected:Npn \__dfg_project_results_register:
{
  \clist_clear:N \l__dfg_project_results_all_clist
  \__dfg_project_results_collect:N \l__dfg_project_results_quality_assured_clist
  \__dfg_project_results_collect:N \l__dfg_project_results_other_clist
  \__dfg_project_results_collect:N \l__dfg_project_results_patents_clist
  \clist_remove_duplicates:N \l__dfg_project_results_all_clist
  \clist_set_eq:NN
    \l__dfg_project_results_excluded_clist
    \l__dfg_project_results_all_clist
  \iow_now:Ne \@auxout
  {
    \exp_not:N \dfgProjectResultsAux
    { \exp_not:V \l__tmp_current_project_tl }
    { \exp_not:V \l__dfg_project_results_all_clist }
  }
}

\cs_new_protected:Npn \__dfg_project_results_skip_if_listed:
{
  \clist_map_inline:Nn \l__dfg_project_results_excluded_clist
  {
    \str_if_eq:eeT {##1} { \strfield{entrykey} }
    {
      \skipentry
      \clist_map_break:
    }
  }
}

\defbibcheck{dfg-project-report}
{ \__dfg_project_results_skip_if_listed: }

\defbibheading{dfg-project-report-references}
{ \subsubsection{References} }

\NewDocumentCommand{\projectPublicationsHeading}{}
{
  \bool_if:NT \l__dfg_class_fastcompile_project_show_publications_bool
  { \subsection{Project-~and~subject-related~list~of~publications} }
}

\NewDocumentCommand{\projectNocite}{m}
{
  \bool_if:NT \l__dfg_class_fastcompile_project_show_publications_bool
  { \nocite{#1} }
}

\NewDocumentCommand{\printProjectBibliography}{o}
{
  \bool_if:NT \l__dfg_class_fastcompile_project_show_publications_bool
  {
    \IfNoValueTF{#1}
    { \printbibliography }
    { \printbibliography[#1] }
  }
}

\NewDocumentEnvironment{projectReport}{}
{
  \bool_if:NT \l__dfg_class_fastcompile_project_show_publications_bool
  { \begin{refsegment} }
}
{
  \bool_if:NT \l__dfg_class_fastcompile_project_show_publications_bool
  {
    \printbibliography[
      segment = \therefsegment,
      check   = dfg-project-report,
      heading = dfg-project-report-references
    ]
    \end{refsegment}
  }
}

\keys_define:nn { dfg / project-results }
{
  quality-assured .clist_set:N = \l__dfg_project_results_quality_assured_clist,
  quality-assured .value_required:n = true,
  other .clist_set:N = \l__dfg_project_results_other_clist,
  other .value_required:n = true,
  patents .clist_set:N = \l__dfg_project_results_patents_clist,
  patents .value_required:n = true,
  unknown .code:n = { \msg_warning:nnn { dfg } { unknown-key } {#1} }
}

\cs_new_protected:Npn \__dfg_project_results_print:Nn #1#2
{
  \clist_if_empty:NTF #1
  {#2}
  {
    \str_if_eq:eeTF { \clist_use:Nn #1 {,} } { none }
    { None. }
    {
      \begin{refsegment}
        \exp_args:Ne \nocite { \clist_use:Nn #1 {,} }
        \printbibliography[segment=\therefsegment, heading=none]
      \end{refsegment}
    }
  }
}

\NewDocumentCommand{\printProjectResults}{m}
{
  \bool_if:NT \l__dfg_class_fastcompile_project_show_publications_bool
  {
  \FloatBarrier
  \group_begin:
    \clist_clear:N \l__dfg_project_results_quality_assured_clist
    \clist_clear:N \l__dfg_project_results_other_clist
    \clist_clear:N \l__dfg_project_results_patents_clist
    \keys_set:nn { dfg / project-results } {#1}
    \__dfg_project_results_register:
    \setbibpreamble{}

    \subsubsection{Publications~with~scientific~quality~assurance}
    \__dfg_project_results_print:Nn
      \l__dfg_project_results_quality_assured_clist
      { List~publications~with~scientific~quality~assurance. }

    \subsubsection{Other~publications~and~published~results}
    \__dfg_project_results_print:Nn
      \l__dfg_project_results_other_clist
      { List~datasets,~software,~preprints,~protocols,~or~other~relevant~
        published~results~that~are~not~included~above. }

    \subsubsection{Patents}
    \__dfg_project_results_print:Nn
      \l__dfg_project_results_patents_clist
      { List~patents~and~patent~applications,~or~state~that~none~resulted~
        from~the~project. }
  \group_end:
  }
}
\NewDocumentCommand{\printProjectTail}{}{
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  {
    \bool_if:NT \l__dfg_class_fastcompile_project_show_publications_bool
    {
      \end{refsection}
      \resetboldnames
    }
  }
  {
    \end{refsection}
    \resetboldnames%
    \clearpage
    \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}%
    \hypersetup{bookmarksdepth = 3}
    \colorlet{thumbIndexBG}{\l__dfg_custom_thumbIndexBG_tl}
  }
}
\NewDocumentCommand{\printMarginalia}{O{\hrulefill}m}
{
  \bool_if:NT \l__dfg_class_showmarginalia_bool
  {\bool_set_false:N \g__dfg_tblr_inside_bool
	\bool_set_true:N \l__dfg_show_tag_leftward_bool
    \marginalia[type=fixed,ysep=0pt]
    {
      \int_if_odd:nTF { \marginaliapage }
        { #1#2 }
        { #2#1 }
    }
	\bool_set_false:N \l__dfg_show_tag_leftward_bool
  	\bool_set_true:N \g__dfg_tblr_inside_bool
  }
}
\tl_new:N \l__tmp_body_staff_tl
\tl_new:N \l__tmp_body_costs_tl
\tl_new:N \l__tmp_body_fellowships_tl
\tl_new:N \l__tmp_body_globalfunds_tl
\tl_new:N \l__tmp_body_instrumentation_tl
\cs_new_protected:Npn \__dfg_requested_funding_append_nonstaff:N #1
{
  \DTLaddall{\tmpHorizontalSum}{
    \pSumYearOne,
    \pSumYearTwo,
    \pSumYearThree,
    \pSumYearFour,
    \pSumYearFive
  }
  \tl_put_right:Ne #1
  {
    \dfgShowTag{\pProject/\pCategory}{category}{\pCategory}[\tmpLocalDB]
    \printMarginalia{\dfgShowCalculatedTag{RequestedFundingTable}{\tmpLocalDB}
      {\__dfg_show_eur:n{\tmpHorizontalSum}}}
    & & \dfgShowTag{\pProject/\pCategory}{sum-year1}
          {\__dfg_show_eur:n{\pSumYearOne}}[\tmpLocalDB]
    & & \dfgShowTag{\pProject/\pCategory}{sum-year2}
          {\__dfg_show_eur:n{\pSumYearTwo}}[\tmpLocalDB]
    & & \dfgShowTag{\pProject/\pCategory}{sum-year3}
          {\__dfg_show_eur:n{\pSumYearThree}}[\tmpLocalDB]
    & & \dfgShowTag{\pProject/\pCategory}{sum-year4}
          {\__dfg_show_eur:n{\pSumYearFour}}[\tmpLocalDB]
    & & \dfgShowTag{\pProject/\pCategory}{sum-year5}
          {\__dfg_show_eur:n{\pSumYearFive}}[\tmpLocalDB] \\
  }
}
\NewDocumentCommand{\RequestedFundingTable}{m}
{
  \group_begin:
  \sisetup{drop-zero-decimal=true}
  % #1: project
  \def\tmpLocalDB{RequestedFunding}%
  \DTLifdbexists{\tmpLocalDB}{%
  	\tl_clear:N \l__tmp_body_staff_tl
  	\tl_clear:N \l__tmp_body_costs_tl
  	\tl_clear:N \l__tmp_body_fellowships_tl
  	\tl_clear:N \l__tmp_body_globalfunds_tl
  	\tl_clear:N \l__tmp_body_instrumentation_tl
  	\tl_put_right:Nn \l__tmp_body_staff_tl {

  		\SetRow{tableHeadingsBGalt}
  		\SetCell{font=\footnotesize\bfseries,halign=l}
  		Staff
  		& Qty & Sum
  		& Qty & Sum
  		& Qty & Sum
  		& Qty & Sum
  		& Qty & Sum \\
  	}

  	\tl_put_right:Nn \l__tmp_body_costs_tl {
  		\SetHline{-}{tableOuterLines,0.5pt}
  		\SetRow{tableHeadingsBGalt}
  		\SetCell{font=\footnotesize\bfseries,halign=l}
  		Direct~ Costs
  		& & Sum
  		& & Sum
  		& & Sum
  		& & Sum
  		& & Sum  \\
  	}
  	\tl_put_right:Nn \l__tmp_body_fellowships_tl {
  		\SetHline{-}{tableOuterLines,0.5pt}
  		\SetRow{tableHeadingsBGalt}
  		\SetCell{font=\footnotesize\bfseries,halign=l}
  		Fellowships
  		& & Sum
  		& & Sum
  		& & Sum
  		& & Sum
  		& & Sum \\
  	}
  	\tl_put_right:Nn \l__tmp_body_globalfunds_tl {
  		\SetHline{-}{tableOuterLines,0.5pt}
  		\SetRow{tableHeadingsBGalt}
  		\SetCell{font=\footnotesize\bfseries,halign=l}
  		Globalfunds
  		& & Sum
  		& & Sum
  		& & Sum
  		& & Sum
  		& & Sum  \\
  	}
  	\tl_put_right:Nn \l__tmp_body_instrumentation_tl {
  		\SetHline{-}{tableOuterLines,0.5pt}
  		\SetRow{tableHeadingsBGalt}
  		\SetCell{font=\footnotesize\bfseries,halign=l}
  		Instrumentation
  		& & Sum
  		& & Sum
  		& & Sum
  		& & Sum
  		& & Sum  \\
  	}

	% One filtered traversal is enough: dispatch each matching row to the
	% token list for its funding type.  The previous implementation traversed
	% the complete, growing database once for every type.
	\DTLforeach[\DTLiseq{#1}{\pProject}]{\tmpLocalDB}{
  			\pProject           =ref-project-id,
  			\pType              =type,
  			\pCategory          =category,
  			\pPercentage        =percentage,
  			\pQuantityYearOne   =quantity-year1,
  			\pQuantityYearTwo   =quantity-year2,
  			\pQuantityYearThree =quantity-year3,
  			\pQuantityYearFour  =quantity-year4,
  			\pQuantityYearFive  =quantity-year5,
  			\pSumYearOne        =sum-year1,
  			\pSumYearTwo        =sum-year2,
  			\pSumYearThree      =sum-year3,
  			\pSumYearFour       =sum-year4,
  			\pSumYearFive       =sum-year5
  		}{

  			\str_case:enF {\pType}
  			{
  				{staff} {
  					\DTLaddall{\tmpHorizontalSum}{
  						\pSumYearOne,
  						\pSumYearTwo,
  						\pSumYearThree,
  						\pSumYearFour,
  						\pSumYearFive
  					}
  					\tl_put_right:Ne \l__tmp_body_staff_tl
  					{

						\dfgShowTag{\pProject/\pCategory}{category}
              {\dfgCategoryName{\pCategory}}[\tmpLocalDB],~
            \dfgShowTag{\pProject/\pCategory}{percentage}
              {\qty{\pPercentage}{\percent}}[\tmpLocalDB]
						\printMarginalia{\dfgShowCalculatedTag{RequestedFundingTable}
              {\tmpLocalDB}{\__dfg_show_eur:n{\tmpHorizontalSum}}}
						& \dfgShowTag{\pProject/\pCategory}{quantity-year1}
                {\__dfg_show_table_number:n{\pQuantityYearOne}}[\tmpLocalDB]
						& \dfgShowTag{\pProject/\pCategory}{sum-year1}
                {\__dfg_show_eur:n{\pSumYearOne}}[\tmpLocalDB]
						& \dfgShowTag{\pProject/\pCategory}{quantity-year2}
                {\__dfg_show_table_number:n{\pQuantityYearTwo}}[\tmpLocalDB] % year2
						& \dfgShowTag{\pProject/\pCategory}{sum-year2}
                {\__dfg_show_eur:n{\pSumYearTwo}}[\tmpLocalDB]
						& \dfgShowTag{\pProject/\pCategory}{quantity-year3}
                {\__dfg_show_table_number:n{\pQuantityYearThree}}[\tmpLocalDB] % year3
						& \dfgShowTag{\pProject/\pCategory}{sum-year3}
                {\__dfg_show_eur:n{\pSumYearThree}}[\tmpLocalDB]
						& \dfgShowTag{\pProject/\pCategory}{quantity-year4}
                {\__dfg_show_table_number:n{\pQuantityYearFour}}[\tmpLocalDB] % year4
						& \dfgShowTag{\pProject/\pCategory}{sum-year4}
                {\__dfg_show_eur:n{\pSumYearFour}}[\tmpLocalDB]
						& \dfgShowTag{\pProject/\pCategory}{quantity-year5}
                {\__dfg_show_table_number:n{\pQuantityYearFive}}[\tmpLocalDB] % year5
						& \dfgShowTag{\pProject/\pCategory}{sum-year5}
                {\__dfg_show_eur:n{\pSumYearFive}}[\tmpLocalDB]
  						\\
  					}
				}
        {costs}
          {\__dfg_requested_funding_append_nonstaff:N \l__tmp_body_costs_tl}
        {fellowships}
          {\__dfg_requested_funding_append_nonstaff:N \l__tmp_body_fellowships_tl}
        {globalfunds}
          {\__dfg_requested_funding_append_nonstaff:N \l__tmp_body_globalfunds_tl}
        {instrumentation}
          {\__dfg_requested_funding_append_nonstaff:N \l__tmp_body_instrumentation_tl}
			}
      { }
	}
  	\tl_put_right:Ne \l__tmp_body_staff_tl
  	{
  		\SetRow{belowsep=5pt}
  		\SetHline{-}{tableOuterLines,0.5pt}
  		Total~
  		\printMarginalia{%
  			\getSumRequestedFunds{#1}{staff}
  			{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  		}
  		& \SetCell{bg=tableNoValue}
  		& \getSumRequestedFunds{#1}{staff}{sum-year1}
  		& \SetCell{bg=tableNoValue}
  		& \getSumRequestedFunds{#1}{staff}{sum-year2}
  		& \SetCell{bg=tableNoValue}
  		& \getSumRequestedFunds{#1}{staff}{sum-year3}
  		& \SetCell{bg=tableNoValue}
  		& \getSumRequestedFunds{#1}{staff}{sum-year4}
  		& \SetCell{bg=tableNoValue}
  		& \getSumRequestedFunds{#1}{staff}{sum-year5}
  		\\
  	}

  	\clist_map_inline:nn {
  		costs,fellowships,globalfunds,instrumentation
  	}{

  		\tl_put_right:ce { l__tmp_body_##1_tl }
  		{
  			\SetRow{belowsep=5pt}
  			\SetHline{-}{tableLines,0.5pt}
  			Total
  			\printMarginalia{%
  				\getSumRequestedFunds{#1}{##1}
  				{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  			}
  			& &
  			\getSumRequestedFunds{#1}{##1}{sum-year1}
  			& &
  			\getSumRequestedFunds{#1}{##1}{sum-year2}
  			& &
  			\getSumRequestedFunds{#1}{##1}{sum-year3}
  			& &
  			\getSumRequestedFunds{#1}{##1}{sum-year4}
  			& &
  			\getSumRequestedFunds{#1}{##1}{sum-year5}
  			\\
  		}}

  	% delete when zero
  	\dfgCheckIfZeroShowCategory{#1}{staff}
  	\dfgCheckIfZeroShowCategory{#1}{costs}
  	\dfgCheckIfZeroShowCategory{#1}{fellowships}
  	\dfgCheckIfZeroShowCategory{#1}{globalfunds}
  	\dfgCheckIfZeroShowCategory{#1}{instrumentation}

  	\begin{tblr}[
  			theme=main,
  			long,
  			expand=
  			\l__tmp_body_staff_tl
  			\l__tmp_body_costs_tl
  			\l__tmp_body_fellowships_tl
  			\l__tmp_body_globalfunds_tl
  			\l__tmp_body_instrumentation_tl,
			remark{Note}={Figures~ in~ EUR},
  		]{
  			colsep=3pt,
			colspec = {
					*{1}{X[3.1,t]}
					*{5}{
						@{}X[0.75,c,si={table-format=1}]
						@{}X[r,si={table-format=7}]
					}
  					% *{1}{X[2,t]}
  					% *{10}{@{}X[c, si={table-format=4}]}
  				},
  			rows = {bg=white},
			column{2-Z}={guard},
  			row{1}= {bg=tableHeadingsBG},
  			row{1,2}= {guard},
  		}
		Funding~for
		 & \SetCell[c=2]{c} \dfgFundingYear{1}
  		 &
		 & \SetCell[c=2]{c} \dfgFundingYear{2}
  		 &
		 & \SetCell[c=2]{c} \dfgFundingYear{3}
  		 &
		 & \SetCell[c=2]{c} \dfgFundingYear{4}
  		 &
		 & \SetCell[c=2]{c} \dfgFundingYear{5}
  		 &                                           \\

  		\l__tmp_body_staff_tl
  		\l__tmp_body_costs_tl
  		\l__tmp_body_fellowships_tl
  		\l__tmp_body_globalfunds_tl
  		\l__tmp_body_instrumentation_tl

  		\SetHline{-}{tableOuterLines,.75pt}
  		\SetCell{font=\bfseries\footnotesize}
  		Total
  		\printMarginalia{%
  			\getTotalSumRequestedFunds{#1}
  			{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  		}
  		 &
  		 & \getTotalSumRequestedFunds{#1}{sum-year1}
  		 &
  		 & \getTotalSumRequestedFunds{#1}{sum-year2}
  		 &
  		 & \getTotalSumRequestedFunds{#1}{sum-year3}
  		 &
  		 & \getTotalSumRequestedFunds{#1}{sum-year4}
  		 &
  		 & \getTotalSumRequestedFunds{#1}{sum-year5} \\
  	\end{tblr}
  }{
  	Database~ \texttt{#1}~ missing.
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
  \group_end:
}

\seq_new:N \l__dfg_rfs_existing_research_seq
\seq_new:N \l__dfg_rfs_existing_nonresearch_seq
\seq_new:N \l__dfg_rfs_requested_research_seq
\seq_new:N \l__dfg_rfs_requested_nonresearch_seq
\seq_new:N \l__dfg_rfs_institution_seq
\seq_new:N \l__dfg_rfs_affiliation_seq
\prop_new:N \l__dfg_rfs_duplicate_prop
\prop_new:N \l__dfg_rfs_institution_name_prop
\prop_new:N \l__dfg_rfs_institution_abbreviation_prop
\prop_new:N \l__dfg_rfs_institution_affiliation_abbreviation_prop
\prop_new:N \l__dfg_rfs_affiliation_abbreviation_prop
\prop_new:N \l__dfg_rfs_affiliation_name_prop
\tl_new:N \l__dfg_rfs_table_body_tl
\tl_new:N \l__dfg_rfs_existing_descriptions_tl
\tl_new:N \l__dfg_rfs_requested_descriptions_tl
\tl_new:N \l__dfg_rfs_project_tl
\tl_new:N \l__dfg_rfs_project_status_tl
\tl_new:N \l__dfg_rfs_existing_group_label_tl
\tl_new:N \l__dfg_rfs_requested_group_label_tl
\tl_new:N \l__dfg_rfs_existing_description_heading_tl
\tl_new:N \l__dfg_rfs_requested_description_heading_tl
\tl_new:N \l__dfg_rfs_ref_person_tl
\tl_new:N \l__dfg_rfs_firstname_tl
\tl_new:N \l__dfg_rfs_lastname_tl
\tl_new:N \l__dfg_rfs_degree_tl
\tl_new:N \l__dfg_rfs_position_tl
\tl_new:N \l__dfg_rfs_field_tl
\tl_new:N \l__dfg_rfs_ref_institution_tl
\tl_new:N \l__dfg_rfs_ref_affiliation_tl
\tl_new:N \l__dfg_rfs_department_tl
\tl_new:N \l__dfg_rfs_funding_status_tl
\tl_new:N \l__dfg_rfs_commitment_tl
\tl_new:N \l__dfg_rfs_category_tl
\tl_new:N \l__dfg_rfs_funding_source_tl
\tl_new:N \l__dfg_rfs_description_tl
\tl_new:N \l__dfg_rfs_name_cell_tl
\tl_new:N \l__dfg_rfs_plain_name_tl
\tl_new:N \l__dfg_rfs_description_name_tl
\tl_new:N \l__dfg_rfs_field_cell_tl
\tl_new:N \l__dfg_rfs_department_cell_tl
\tl_new:N \l__dfg_rfs_commitment_cell_tl
\tl_new:N \l__dfg_rfs_category_cell_tl
\tl_new:N \l__dfg_rfs_funding_source_cell_tl
\tl_new:N \l__dfg_rfs_group_cell_tl
\tl_new:N \l__dfg_rfs_institution_name_tl
\tl_new:N \l__dfg_rfs_institution_abbreviation_tl
\tl_new:N \l__dfg_rfs_institution_affiliation_tl
\tl_new:N \l__dfg_rfs_affiliation_name_tl
\tl_new:N \l__dfg_rfs_affiliation_abbreviation_tl
\int_new:N \l__dfg_rfs_display_number_int
\int_new:N \l__dfg_rfs_record_count_int
\bool_new:N \l__dfg_rfs_person_resolved_bool
\bool_new:N \l__dfg_rfs_name_incomplete_bool

\keys_define:nn { dfg / requested-funding-staff-row }
{
  ref-person-id .tl_set:N = \l__dfg_rfs_ref_person_tl,
  firstname .tl_set:N = \l__dfg_rfs_firstname_tl,
  lastname .tl_set:N = \l__dfg_rfs_lastname_tl,
  academic-degree .tl_set:N = \l__dfg_rfs_degree_tl,
  positionText .tl_set:N = \l__dfg_rfs_position_tl,
  position .tl_set:N = \l__dfg_rfs_position_tl,
  field-of-research .tl_set:N = \l__dfg_rfs_field_tl,
  ref-institution-id .tl_set:N = \l__dfg_rfs_ref_institution_tl,
  ref-affiliation-id .tl_set:N = \l__dfg_rfs_ref_affiliation_tl,
  department .tl_set:N = \l__dfg_rfs_department_tl,
  funding-status .tl_set:N = \l__dfg_rfs_funding_status_tl,
  commitment .tl_set:N = \l__dfg_rfs_commitment_tl,
  category .tl_set:N = \l__dfg_rfs_category_tl,
  funding-source .tl_set:N = \l__dfg_rfs_funding_source_tl,
  description .tl_set:N = \l__dfg_rfs_description_tl,
  unknown .code:n = { }
}

\cs_new:Npn \__dfg_rfs_missing_text:
{ \textcolor{tableNoValue!55!black}{\emph{not~provided}} }

\cs_new:Npn \__dfg_rfs_error_text:n #1
{ \textcolor{error}{\texttt{<?#1?>}} }

\cs_new_protected:Npn \__dfg_rfs_warn_missing:n #1
{
  \msg_warning:nnee { dfg } { requested-staff-missing-field }
    { \l__dfg_rfs_project_tl }
    { no.~\int_use:N \l__dfg_rfs_display_number_int \c_colon_str\space #1 }
}

\cs_new_protected:Npn \__dfg_rfs_row_clear:
{
  \tl_clear:N \l__dfg_rfs_ref_person_tl
  \tl_clear:N \l__dfg_rfs_firstname_tl
  \tl_clear:N \l__dfg_rfs_lastname_tl
  \tl_clear:N \l__dfg_rfs_degree_tl
  \tl_clear:N \l__dfg_rfs_position_tl
  \tl_clear:N \l__dfg_rfs_field_tl
  \tl_clear:N \l__dfg_rfs_ref_institution_tl
  \tl_clear:N \l__dfg_rfs_ref_affiliation_tl
  \tl_clear:N \l__dfg_rfs_department_tl
  \tl_clear:N \l__dfg_rfs_funding_status_tl
  \tl_clear:N \l__dfg_rfs_commitment_tl
  \tl_clear:N \l__dfg_rfs_category_tl
  \tl_clear:N \l__dfg_rfs_funding_source_tl
  \tl_clear:N \l__dfg_rfs_description_tl
}

\cs_new_protected:Npn \__dfg_rfs_store:N #1
{
  \seq_put_right:Ne #1
  {
    ref-person-id = { \exp_not:V \pRFSRefPerson },
    firstname = { \exp_not:V \pRFSFirstname },
    lastname = { \exp_not:V \pRFSLastname },
    academic-degree = { \exp_not:V \pRFSDegree },
    positionText = { \exp_not:V \pRFSPosition },
    field-of-research = { \exp_not:V \pRFSField },
    ref-institution-id = { \exp_not:V \pRFSRefInstitution },
    ref-affiliation-id = { \exp_not:V \pRFSRefAffiliation },
    department = { \exp_not:V \pRFSDepartment },
    funding-status = { \exp_not:V \pRFSFundingStatus },
    commitment = { \exp_not:V \pRFSCommitment },
    category = { \exp_not:V \pRFSCategory },
    funding-source = { \exp_not:V \pRFSFundingSource },
    description = { \exp_not:V \pRFSDescription }
  }
}

\cs_new_protected:Npn \__dfg_rfs_collect_current:
{
  \clist_map_inline:nn
  {
    \pRFSRefPerson, \pRFSFirstname, \pRFSLastname, \pRFSDegree,
    \pRFSPosition, \pRFSField, \pRFSRefInstitution,
    \pRFSRefAffiliation, \pRFSDepartment, \pRFSCommitment,
    \pRFSCategory, \pRFSFundingSource, \pRFSDescription
  }
  { \DTLifnullorempty{##1}{\cs_set:Npn ##1 {}}{} }
  \tl_if_blank:VTF \pRFSRefPerson
  {
    \str_if_eq:VnTF \pRFSLastname { TBA }
    {
      \tl_set:Ne \l_tmpa_tl
      {
        \exp_not:V \pRFSProject / \exp_not:V \pRFSFundingStatus /
        \exp_not:V \pRFSStaffType / vacancy /
        \exp_not:V \pRFSCategory / \exp_not:V \pRFSPosition /
        \exp_not:V \pRFSField / \exp_not:V \pRFSRefInstitution /
        \exp_not:V \pRFSDepartment
      }
    }
    {
      \tl_set:Ne \l_tmpa_tl
      {
        \exp_not:V \pRFSProject / \exp_not:V \pRFSFundingStatus /
        \exp_not:V \pRFSStaffType / name /
        \exp_not:V \pRFSLastname / \exp_not:V \pRFSFirstname
      }
    }
  }
  {
    \tl_set:Ne \l_tmpa_tl
    {
      \exp_not:V \pRFSProject / \exp_not:V \pRFSFundingStatus /
      \exp_not:V \pRFSStaffType / person / \exp_not:V \pRFSRefPerson
    }
  }
  \prop_get:NVNTF \l__dfg_rfs_duplicate_prop \l_tmpa_tl \l_tmpb_tl
  { \msg_warning:nne { dfg } { requested-staff-duplicate } { \l_tmpa_tl } }
  { \prop_put:NVn \l__dfg_rfs_duplicate_prop \l_tmpa_tl { 1 } }
  \tl_set:Ne \l_tmpa_tl
    { \pRFSFundingStatus / \pRFSStaffType }
  \str_case:VnF \l_tmpa_tl
  {
    { existing/research }
      { \__dfg_rfs_store:N \l__dfg_rfs_existing_research_seq }
    { existing/nonResearch }
      { \__dfg_rfs_store:N \l__dfg_rfs_existing_nonresearch_seq }
    { requested/research }
      { \__dfg_rfs_store:N \l__dfg_rfs_requested_research_seq }
    { requested/nonResearch }
      { \__dfg_rfs_store:N \l__dfg_rfs_requested_nonresearch_seq }
  }
  { }
}

\cs_new_protected:Npn \__dfg_rfs_use_fallback:NN #1#2
{
  \tl_if_blank:VT #1
  { \DTLifnullorempty{#2}{ }{ \tl_set:NV #1 #2 } }
}

\cs_new_protected:Npn \__dfg_rfs_resolve_person:
{
  \bool_set_false:N \l__dfg_rfs_person_resolved_bool
  \tl_if_blank:VF \l__dfg_rfs_ref_person_tl
  {
    \DTLifdbexists{person}
    {
      \DTLgetvalueforkey{\l_tmpa_tl}{lastname}{person}{id}
        {\l__dfg_rfs_ref_person_tl}
      \DTLifnullorempty{\l_tmpa_tl}
      {
        \msg_warning:nnee { dfg } { requested-staff-unresolved-person }
          { \l__dfg_rfs_project_tl } { \l__dfg_rfs_ref_person_tl }
      }
      {
        \bool_set_true:N \l__dfg_rfs_person_resolved_bool
        \__dfg_rfs_use_fallback:NN \l__dfg_rfs_lastname_tl \l_tmpa_tl
        \DTLgetvalueforkey{\l_tmpa_tl}{firstname}{person}{id}
          {\l__dfg_rfs_ref_person_tl}
        \__dfg_rfs_use_fallback:NN \l__dfg_rfs_firstname_tl \l_tmpa_tl
        \DTLgetvalueforkey{\l_tmpa_tl}{academicdegree}{person}{id}
          {\l__dfg_rfs_ref_person_tl}
        \__dfg_rfs_use_fallback:NN \l__dfg_rfs_degree_tl \l_tmpa_tl
        \DTLgetvalueforkey{\l_tmpa_tl}{positionText}{person}{id}
          {\l__dfg_rfs_ref_person_tl}
        \__dfg_rfs_use_fallback:NN \l__dfg_rfs_position_tl \l_tmpa_tl
        \DTLgetvalueforkey{\l_tmpa_tl}{position}{person}{id}
          {\l__dfg_rfs_ref_person_tl}
        \__dfg_rfs_use_fallback:NN \l__dfg_rfs_category_tl \l_tmpa_tl
        \bool_lazy_all:nT
        {
          { \tl_if_blank_p:V \l__dfg_rfs_department_tl }
          { \tl_if_blank_p:V \l__dfg_rfs_ref_institution_tl }
          { \tl_if_blank_p:V \l__dfg_rfs_ref_affiliation_tl }
        }
        {
          \DTLgetvalueforkey{\l_tmpa_tl}{ref-institution-id}{person}{id}
            {\l__dfg_rfs_ref_person_tl}
          \__dfg_rfs_use_fallback:NN \l__dfg_rfs_ref_institution_tl \l_tmpa_tl
          \tl_if_blank:VT \l__dfg_rfs_ref_institution_tl
          {
            \DTLgetvalueforkey{\l_tmpa_tl}{ref-affiliation-id}{person}{id}
              {\l__dfg_rfs_ref_person_tl}
            \__dfg_rfs_use_fallback:NN \l__dfg_rfs_ref_affiliation_tl \l_tmpa_tl
          }
        }
      }
    }
    {
      \msg_warning:nnee { dfg } { requested-staff-unresolved-person }
        { \l__dfg_rfs_project_tl } { \l__dfg_rfs_ref_person_tl }
    }
  }
}

\cs_new_protected:Npn \__dfg_rfs_register_affiliation:n #1
{
  \tl_set:Ne \l_tmpa_tl {#1}
  \tl_clear:N \l__dfg_rfs_affiliation_name_tl
  \tl_clear:N \l__dfg_rfs_affiliation_abbreviation_tl
  \DTLifdbexists{affiliation}
  {
    \DTLgetvalueforkey{\l__dfg_rfs_affiliation_name_tl}
      {name}{affiliation}{id}{\l_tmpa_tl}
    \DTLifnullorempty{\l__dfg_rfs_affiliation_name_tl}
    {
      \msg_warning:nnee { dfg } { requested-staff-unresolved-affiliation }
        { \l__dfg_rfs_project_tl } { \l_tmpa_tl }
      \tl_clear:N \l__dfg_rfs_affiliation_name_tl
    }
    {
      \DTLgetvalueforkey{\l__dfg_rfs_affiliation_abbreviation_tl}
        {abbreviation}{affiliation}{id}{\l_tmpa_tl}
      \DTLifnullorempty{\l__dfg_rfs_affiliation_abbreviation_tl}
      {
        \msg_warning:nne { dfg } { requested-staff-missing-abbreviation }
          { \l_tmpa_tl }
        \tl_set:NV \l__dfg_rfs_affiliation_abbreviation_tl
          \l__dfg_rfs_affiliation_name_tl
      }
      { }
      \seq_if_in:NVF \l__dfg_rfs_affiliation_seq \l_tmpa_tl
      {
        \seq_put_right:NV \l__dfg_rfs_affiliation_seq \l_tmpa_tl
        \prop_put:NVV \l__dfg_rfs_affiliation_abbreviation_prop
          \l_tmpa_tl \l__dfg_rfs_affiliation_abbreviation_tl
        \prop_put:NVV \l__dfg_rfs_affiliation_name_prop
          \l_tmpa_tl \l__dfg_rfs_affiliation_name_tl
      }
    }
  }
  {
    \msg_warning:nnee { dfg } { requested-staff-unresolved-affiliation }
      { \l__dfg_rfs_project_tl } { \l_tmpa_tl }
  }
}

\cs_new_protected:Npn \__dfg_rfs_resolve_organisation:
{
  \tl_if_blank:VT \l__dfg_rfs_department_tl
  {
    \tl_if_blank:VTF \l__dfg_rfs_ref_institution_tl
    {
      % Compatibility fallback for roster declarations written before the
      % institution-level key was introduced.
      \tl_if_blank:VTF \l__dfg_rfs_ref_affiliation_tl
      {
        \__dfg_rfs_warn_missing:n { department~or~ref-institution-id }
        \tl_set:Nn \l__dfg_rfs_department_tl
          { \SetCell{bg=tableNoValue}\__dfg_rfs_missing_text: }
      }
      {
        \__dfg_rfs_register_affiliation:n { \l__dfg_rfs_ref_affiliation_tl }
        \tl_if_blank:VTF \l__dfg_rfs_affiliation_name_tl
        {
          \tl_set:Ne \l__dfg_rfs_department_tl
          {
            \exp_not:N \SetCell { bg=tableNoValue }
            \exp_not:N \__dfg_rfs_error_text:n
              { \exp_not:V \l__dfg_rfs_ref_affiliation_tl }
          }
        }
        {
          \tl_set:NV \l__dfg_rfs_department_tl
            \l__dfg_rfs_affiliation_abbreviation_tl
        }
      }
    }
    {
      \tl_clear:N \l__dfg_rfs_department_tl
      \DTLifdbexists{institution}
      {
        \clist_set:NV \l_tmpa_clist \l__dfg_rfs_ref_institution_tl
        \bool_set_true:N \l_tmpa_bool
        \clist_map_inline:Nn \l_tmpa_clist
        {
          \bool_if:NTF \l_tmpa_bool
            { \bool_set_false:N \l_tmpa_bool }
            { \tl_put_right:Nn \l__dfg_rfs_department_tl {,~} }
          \DTLgetvalueforkey{\l__dfg_rfs_institution_affiliation_tl}
            {ref-affiliation-id}{institution}{id}{##1}
          \DTLifnullorempty{\l__dfg_rfs_institution_affiliation_tl}
          {
            \msg_warning:nnee { dfg } { requested-staff-unresolved-institution }
              { \l__dfg_rfs_project_tl } {##1}
            \tl_put_right:Ne \l__dfg_rfs_department_tl
              { \exp_not:N \__dfg_rfs_error_text:n { \exp_not:n {##1} } }
          }
          {
            \DTLgetvalueforkey{\l__dfg_rfs_institution_name_tl}
              {name}{institution}{id}{##1}
            \__dfg_institution_abbreviation_or_name:nN
              {##1} \l__dfg_rfs_institution_abbreviation_tl
            \__dfg_rfs_register_affiliation:n
              { \l__dfg_rfs_institution_affiliation_tl }
            \DTLifnullorempty{\l__dfg_rfs_institution_name_tl}
            {
              \tl_set:NV \l__dfg_rfs_institution_name_tl
                \l__dfg_rfs_affiliation_name_tl
            }
            { }
            \DTLifnullorempty{\l__dfg_rfs_institution_abbreviation_tl}
            {
              \tl_set:NV \l__dfg_rfs_institution_abbreviation_tl
                \l__dfg_rfs_affiliation_abbreviation_tl
            }
            { }
            \tl_put_right:NV \l__dfg_rfs_department_tl
              \l__dfg_rfs_institution_abbreviation_tl
            \tl_set:Nn \l_tmpa_tl {##1}
            \seq_if_in:NVF \l__dfg_rfs_institution_seq \l_tmpa_tl
            {
              \seq_put_right:NV \l__dfg_rfs_institution_seq \l_tmpa_tl
              \prop_put:NVV \l__dfg_rfs_institution_name_prop
                \l_tmpa_tl \l__dfg_rfs_institution_name_tl
              \prop_put:NVV \l__dfg_rfs_institution_abbreviation_prop
                \l_tmpa_tl \l__dfg_rfs_institution_abbreviation_tl
              \prop_put:NVV
                \l__dfg_rfs_institution_affiliation_abbreviation_prop
                \l_tmpa_tl \l__dfg_rfs_affiliation_abbreviation_tl
            }
          }
        }
      }
      {
        \msg_warning:nnee { dfg } { requested-staff-unresolved-institution }
          { \l__dfg_rfs_project_tl } { \l__dfg_rfs_ref_institution_tl }
        \tl_set:Ne \l__dfg_rfs_department_tl
        {
          \exp_not:N \SetCell { bg=tableNoValue }
          \exp_not:N \__dfg_rfs_error_text:n
            { \exp_not:V \l__dfg_rfs_ref_institution_tl }
        }
      }
    }
  }
}

\cs_new_protected:Npn \__dfg_rfs_make_cell:NnN #1#2#3
{
  \tl_if_blank:VTF #1
  {
    \__dfg_rfs_warn_missing:n {#2}
    \tl_set:Nn #3 { \SetCell{bg=tableNoValue}\__dfg_rfs_missing_text: }
  }
  { \tl_set:NV #3 #1 }
}

\cs_new_protected:Npn \__dfg_rfs_make_name_cell:
{
  \bool_set_false:N \l__dfg_rfs_name_incomplete_bool
  \str_if_eq:VnTF \l__dfg_rfs_lastname_tl { TBA }
  {
    \tl_if_blank:VT \l__dfg_rfs_position_tl
    {
      \__dfg_rfs_warn_missing:n { position }
      \tl_set:Nn \l__dfg_rfs_position_tl { \__dfg_rfs_missing_text: }
      \bool_set_true:N \l__dfg_rfs_name_incomplete_bool
    }
    \tl_set:Nn \l__dfg_rfs_plain_name_tl { TBA }
    \tl_set:Nn \l__dfg_rfs_description_name_tl { TBA }
    \tl_set:Ne \l_tmpa_tl
      {
        TBA
        \exp_not:N \newline
        (\exp_not:V \l__dfg_rfs_position_tl)
      }
  }
  {
    \tl_if_blank:VT \l__dfg_rfs_lastname_tl
    {
      \__dfg_rfs_warn_missing:n { lastname~or~resolvable~ref-person-id }
      \tl_set:Nn \l__dfg_rfs_lastname_tl { \__dfg_rfs_error_text:n {name} }
      \bool_set_true:N \l__dfg_rfs_name_incomplete_bool
    }
    \tl_if_blank:VT \l__dfg_rfs_firstname_tl
    {
      \__dfg_rfs_warn_missing:n { firstname }
      \tl_set:Nn \l__dfg_rfs_firstname_tl { \__dfg_rfs_missing_text: }
      \bool_set_true:N \l__dfg_rfs_name_incomplete_bool
    }
    \tl_if_blank:VT \l__dfg_rfs_position_tl
    {
      \__dfg_rfs_warn_missing:n { position }
      \tl_set:Nn \l__dfg_rfs_position_tl { \__dfg_rfs_missing_text: }
      \bool_set_true:N \l__dfg_rfs_name_incomplete_bool
    }
    \tl_set:Ne \l__dfg_rfs_plain_name_tl
      {
        \exp_not:V \l__dfg_rfs_lastname_tl,\exp_not:N \space
        \exp_not:V \l__dfg_rfs_firstname_tl
      }
    \tl_clear:N \l__dfg_rfs_description_name_tl
    \tl_if_blank:VF \l__dfg_rfs_degree_tl
      {
        \tl_put_right:Ne \l__dfg_rfs_description_name_tl
          { \exp_not:V \l__dfg_rfs_degree_tl \exp_not:N \space }
      }
    \tl_put_right:Ne \l__dfg_rfs_description_name_tl
    {
      \exp_not:V \l__dfg_rfs_firstname_tl \exp_not:N \space
      \exp_not:V \l__dfg_rfs_lastname_tl
    }
    \tl_set:NV \l_tmpa_tl \l__dfg_rfs_plain_name_tl
    \tl_if_blank:VF \l__dfg_rfs_degree_tl
    {
      \tl_put_right:Ne \l_tmpa_tl
        { ,\exp_not:N \space \exp_not:V \l__dfg_rfs_degree_tl }
    }
    \tl_put_right:Ne \l_tmpa_tl
    {
      \exp_not:N \newline
      (\exp_not:V \l__dfg_rfs_position_tl)
    }
    \bool_if:NT \l__dfg_rfs_person_resolved_bool
    {
      \str_if_eq:VnT \l__dfg_rfs_funding_status_tl { existing }
      {
        \tl_set:Ne \l_tmpa_tl
        {
          \exp_not:N \textbf { \exp_not:V \l__dfg_rfs_lastname_tl },
          \exp_not:N \space \exp_not:V \l__dfg_rfs_firstname_tl
        }
        \tl_if_blank:VF \l__dfg_rfs_degree_tl
        {
          \tl_put_right:Ne \l_tmpa_tl
            { ,\exp_not:N \space \exp_not:V \l__dfg_rfs_degree_tl }
        }
        \tl_put_right:Ne \l_tmpa_tl
        {
          \exp_not:N \newline
          (\exp_not:V \l__dfg_rfs_position_tl)
        }
      }
    }
  }
  \bool_if:NF \l__dfg_rfs_person_resolved_bool
  {
    \tl_if_blank:VF \l__dfg_rfs_ref_person_tl
    {
      \bool_set_true:N \l__dfg_rfs_name_incomplete_bool
      \tl_put_right:Ne \l_tmpa_tl
      {
        \exp_not:N \space
        \exp_not:N \__dfg_rfs_error_text:n
          { \exp_not:V \l__dfg_rfs_ref_person_tl }
      }
    }
  }
  \tl_clear:N \l__dfg_rfs_name_cell_tl
  \bool_if:NT \l__dfg_rfs_name_incomplete_bool
  { \tl_put_right:Nn \l__dfg_rfs_name_cell_tl { \SetCell{bg=tableNoValue} } }
  \bool_if:NTF \l__dfg_rfs_person_resolved_bool
  {
    \tl_put_right:Ne \l__dfg_rfs_name_cell_tl
    {
      \exp_not:N \hyperlink { pi:\exp_not:V \l__dfg_rfs_ref_person_tl }
      {
        \exp_not:N \textcolor { referencePI }
        {
          \exp_not:N \dfgShowCalculatedTag{RequestedFundingStaffTable}
            {RequestedFundingStaff,person}
            {\exp_not:V \l_tmpa_tl}
        }
      }
    }
  }
  {
    \tl_put_right:Ne \l__dfg_rfs_name_cell_tl
    {
      \exp_not:N \dfgShowCalculatedTag{RequestedFundingStaffTable}
        {RequestedFundingStaff,person}
        {\exp_not:V \l_tmpa_tl}
    }
  }
}

\cs_new_protected:Npn \__dfg_rfs_render_row:nnnN #1#2#3#4
{
  \int_incr:N \l__dfg_rfs_display_number_int
  \__dfg_rfs_resolve_person:
  \__dfg_rfs_resolve_organisation:
  \__dfg_rfs_make_name_cell:
  \__dfg_rfs_make_cell:NnN \l__dfg_rfs_field_tl
    { field-of-research } \l__dfg_rfs_field_cell_tl
  \tl_if_blank:VF \l__dfg_rfs_field_tl
  {
    \tl_set:Ne \l__dfg_rfs_field_cell_tl
    {
      \exp_not:N \dfgShowTag
        {\exp_not:V \l__dfg_rfs_project_tl/
         \int_use:N \l__dfg_rfs_display_number_int}
        {field-of-research}{\exp_not:V \l__dfg_rfs_field_cell_tl}
        [RequestedFundingStaff]
    }
  }
  \tl_set:NV \l__dfg_rfs_department_cell_tl \l__dfg_rfs_department_tl
  \tl_if_in:VnF \l__dfg_rfs_department_cell_tl { \SetCell }
  {
    \tl_set:Ne \l__dfg_rfs_department_cell_tl
    {
      \exp_not:N \dfgShowCalculatedTag{RequestedFundingStaffTable}
        {RequestedFundingStaff,person,institution,affiliation}
        {\exp_not:V \l__dfg_rfs_department_cell_tl}
    }
  }
  \str_if_eq:VnTF \l__dfg_rfs_funding_status_tl { requested }
  {
    \tl_set:Nn \l__dfg_rfs_commitment_cell_tl
      { \SetCell{bg=tableNoValue} }
    \tl_set:Nn \l__dfg_rfs_funding_source_cell_tl
      { \SetCell{bg=tableNoValue} }
  }
  {
    \__dfg_rfs_make_cell:NnN \l__dfg_rfs_commitment_tl
      { commitment } \l__dfg_rfs_commitment_cell_tl
    \__dfg_rfs_make_cell:NnN \l__dfg_rfs_funding_source_tl
      { funding-source } \l__dfg_rfs_funding_source_cell_tl
    \tl_if_blank:VF \l__dfg_rfs_commitment_tl
    {
      \tl_set:Ne \l__dfg_rfs_commitment_cell_tl
      {
        \exp_not:N \dfgShowTag
          {\exp_not:V \l__dfg_rfs_project_tl/
           \int_use:N \l__dfg_rfs_display_number_int}
          {commitment}{\exp_not:V \l__dfg_rfs_commitment_cell_tl}
          [RequestedFundingStaff]
      }
    }
    \tl_if_blank:VF \l__dfg_rfs_funding_source_tl
    {
      \tl_set:Ne \l__dfg_rfs_funding_source_cell_tl
      {
        \exp_not:N \dfgShowTag
          {\exp_not:V \l__dfg_rfs_project_tl/
           \int_use:N \l__dfg_rfs_display_number_int}
          {funding-source}{\exp_not:V \l__dfg_rfs_funding_source_cell_tl}
          [RequestedFundingStaff]
      }
    }
  }
  \str_if_eq:VnTF \l__dfg_rfs_funding_status_tl { existing }
  {
    \tl_set:Nn \l__dfg_rfs_category_cell_tl
      { \SetCell{bg=tableNoValue} }
  }
  {
    \tl_if_blank:VTF \l__dfg_rfs_category_tl
    {
      \__dfg_rfs_warn_missing:n { category }
      \tl_set:Nn \l__dfg_rfs_category_cell_tl
        { \SetCell{bg=tableNoValue}\__dfg_rfs_missing_text: }
    }
    {
      \prop_get:NVNTF \g__dfg_dfg_category_names_prop
        \l__dfg_rfs_category_tl \l__dfg_rfs_category_cell_tl
      { }
      {
        \tl_set:Ne \l__dfg_rfs_category_cell_tl
          { \exp_not:N \__dfg_rfs_error_text:n { \exp_not:V \l__dfg_rfs_category_tl } }
      }
    }
  }
  \tl_if_in:VnF \l__dfg_rfs_category_cell_tl { \SetCell }
  {
    \tl_set:Ne \l__dfg_rfs_category_cell_tl
    {
      \exp_not:N \dfgShowCalculatedTag{RequestedFundingStaffTable}
        {RequestedFundingStaff,person}
        {\exp_not:V \l__dfg_rfs_category_cell_tl}
    }
  }
  \int_compare:nNnTF {#1} = {1}
  {
    \tl_set:Ne \l__dfg_rfs_group_cell_tl
    {
      \exp_not:N \SetCell [ r=#2 ] { l }
      { \exp_not:n {#3} } &
    }
  }
  { \tl_set:Nn \l__dfg_rfs_group_cell_tl { & } }
  \tl_put_right:Ne \l__dfg_rfs_table_body_tl
  {
    \exp_not:V \l__dfg_rfs_group_cell_tl
    \int_use:N \l__dfg_rfs_display_number_int
    & \exp_not:V \l__dfg_rfs_name_cell_tl
    & \exp_not:V \l__dfg_rfs_field_cell_tl
    & \exp_not:V \l__dfg_rfs_department_cell_tl
    & \exp_not:V \l__dfg_rfs_commitment_cell_tl
    & \exp_not:V \l__dfg_rfs_category_cell_tl
    & \exp_not:V \l__dfg_rfs_funding_source_cell_tl
    \\
  }
  \tl_if_blank:VT \l__dfg_rfs_description_tl
  {
    \__dfg_rfs_warn_missing:n { description }
    \tl_set:Nn \l__dfg_rfs_description_tl
      { \textcolor{error}{Description~not~provided.} }
  }
  \tl_put_right:Ne #4
  {
    \par\noindent
    \exp_not:N \textbf
      { \int_use:N \l__dfg_rfs_display_number_int.\space
        \exp_not:N \dfgShowCalculatedTag{RequestedFundingStaffTable}
          {RequestedFundingStaff,person}
          {\exp_not:V \l__dfg_rfs_description_name_tl} }
    \quad
    \exp_not:N \dfgShowTag
      {\exp_not:V \l__dfg_rfs_project_tl/
       \int_use:N \l__dfg_rfs_display_number_int}
      {description}{\exp_not:V \l__dfg_rfs_description_tl}
      [RequestedFundingStaff]
    \par
  }
}

\cs_new_protected:Npn \__dfg_rfs_render_group:NnN #1#2#3
{
  \seq_map_indexed_inline:Nn #1
  {
    \__dfg_rfs_row_clear:
    \keys_set:nn { dfg / requested-funding-staff-row } {##2}
    \__dfg_rfs_render_row:nnnN {##1} { \seq_count:N #1 } {#2} #3
  }
}

\cs_new_protected:Npn \__dfg_rfs_render_status:NNnN #1#2#3#4
{
  \int_compare:nNnT { \seq_count:N #1 + \seq_count:N #2 } > {0}
  {
    \tl_put_right:Nn \l__dfg_rfs_table_body_tl
    {
      \SetRow{bg=tableHeadingsBGalt,font=\footnotesize\bfseries}
      \SetCell[c=8]{l} #3 & & & & & & & \\*
    }
    \__dfg_rfs_render_group:NnN #1 { Research~staff } #4
    \seq_if_empty:NF #1
    {
      \seq_if_empty:NF #2
      {
        \tl_put_right:Nn \l__dfg_rfs_table_body_tl
          { \SetHline{-}{tableOuterLines,0.5pt} }
      }
    }
    \__dfg_rfs_render_group:NnN #2 { Non-research~staff } #4
  }
}

\cs_new_protected:Npn \__dfg_rfs_print_legend:
{
  \bool_lazy_or:nnT
    { ! \seq_if_empty_p:N \l__dfg_rfs_institution_seq }
    { ! \seq_if_empty_p:N \l__dfg_rfs_affiliation_seq }
  {
    \par\smallskip\noindent
    \group_begin:
    \footnotesize
    \seq_if_empty:NF \l__dfg_rfs_institution_seq
    {
      \textbf{Institutions:}\space
      \seq_map_indexed_inline:Nn \l__dfg_rfs_institution_seq
      {
        \int_compare:nNnF {##1} = {1} {;\space}
        \tl_set:Nn \l_tmpa_tl {##2}
        \prop_get:NVN \l__dfg_rfs_institution_name_prop
          \l_tmpa_tl \l_tmpb_tl
        \prop_get:NVN \l__dfg_rfs_institution_abbreviation_prop
          \l_tmpa_tl \l_tmpd_tl
        \prop_get:NVN \l__dfg_rfs_institution_affiliation_abbreviation_prop
          \l_tmpa_tl \l_tmpc_tl
        \textbf{\dfgShowCalculatedTag{institutionLabel}{institution}
          {\l_tmpd_tl}}:~
        \dfgShowTag{##2}{name}{\l_tmpb_tl}[institution]\space
        (\dfgShowCalculatedTag{affiliationLabel}{affiliation}
          {\l_tmpc_tl})
      }
      .\space
    }
    \seq_if_empty:NF \l__dfg_rfs_affiliation_seq
    {
      \textbf{Affiliations:}\space
      \seq_map_indexed_inline:Nn \l__dfg_rfs_affiliation_seq
      {
        \int_compare:nNnF {##1} = {1} {;\space}
        \tl_set:Nn \l_tmpa_tl {##2}
        \prop_get:NVN \l__dfg_rfs_affiliation_abbreviation_prop
          \l_tmpa_tl \l_tmpb_tl
        \prop_get:NVN \l__dfg_rfs_affiliation_name_prop
          \l_tmpa_tl \l_tmpc_tl
        \textbf{\dfgShowCalculatedTag{affiliationLabel}{affiliation}
          {\l_tmpb_tl}}:~
        \dfgShowTag{##2}{name}{\l_tmpc_tl}[affiliation]
      }
      .
    }
    \par
    \group_end:
  }
}

\cs_new_protected:Npn \__dfg_rfs_no_data:n #1
{
  \msg_warning:nnn { dfg } { requested-staff-no-data } {#1}
  \par\noindent
  \textcolor{tableNoValue!55!black}
    {No~staff~data~have~been~provided~for~this~project.}
  \par
}

\NewDocumentCommand{\RequestedFundingStaffTable}{m}
{
  \group_begin:
  \tl_set:Nn \l__dfg_rfs_project_tl {#1}
  \tl_clear:N \l__dfg_rfs_project_status_tl
  \DTLifdbexists{project}
  {
    \DTLgetvalueforkey{\l__dfg_rfs_project_status_tl}
      {project-status}{project}{id}{#1}
  }
  { }
  \str_if_eq:VnTF \l__dfg_rfs_project_status_tl { E }
  {
    \tl_set:Nn \l__dfg_rfs_existing_group_label_tl {Existing~staff}
    \tl_set:Nn \l__dfg_rfs_requested_group_label_tl
      {Staff~funded~with~approved~grant~money}
    \tl_set:Nn \l__dfg_rfs_existing_description_heading_tl
      {Job~descriptions~of~staff~(supported~through~existing~funds):}
    \tl_set:Nn \l__dfg_rfs_requested_description_heading_tl
      {Job~descriptions~of~staff~(funded~with~approved~grant~money):}
  }
  {
    \tl_set:Nn \l__dfg_rfs_existing_group_label_tl {Existing~staff}
    \tl_set:Nn \l__dfg_rfs_requested_group_label_tl {Requested~staff}
    \tl_set:Nn \l__dfg_rfs_existing_description_heading_tl
      {Job~descriptions~of~staff~for~the~proposed~funding~period~
        (supported~through~existing~funds):}
    \tl_set:Nn \l__dfg_rfs_requested_description_heading_tl
      {Job~descriptions~of~staff~for~the~proposed~funding~period~
        (requested~funds):}
  }
  \seq_clear:N \l__dfg_rfs_existing_research_seq
  \seq_clear:N \l__dfg_rfs_existing_nonresearch_seq
  \seq_clear:N \l__dfg_rfs_requested_research_seq
  \seq_clear:N \l__dfg_rfs_requested_nonresearch_seq
  \seq_clear:N \l__dfg_rfs_institution_seq
  \seq_clear:N \l__dfg_rfs_affiliation_seq
  \prop_clear:N \l__dfg_rfs_duplicate_prop
  \prop_clear:N \l__dfg_rfs_institution_name_prop
  \prop_clear:N \l__dfg_rfs_institution_abbreviation_prop
  \prop_clear:N \l__dfg_rfs_institution_affiliation_abbreviation_prop
  \prop_clear:N \l__dfg_rfs_affiliation_abbreviation_prop
  \prop_clear:N \l__dfg_rfs_affiliation_name_prop
  \tl_clear:N \l__dfg_rfs_table_body_tl
  \tl_clear:N \l__dfg_rfs_existing_descriptions_tl
  \tl_clear:N \l__dfg_rfs_requested_descriptions_tl
  \DTLifdbexists{RequestedFundingStaff}
  {
    \DTLforeach[\DTLiseq{#1}{\pRFSProject}]
      {RequestedFundingStaff}
    {
      \pRFSProject=ref-project-id,
      \pRFSFundingStatus=funding-status,
      \pRFSStaffType=staff-type,
      \pRFSRefPerson=ref-person-id,
      \pRFSFirstname=firstname,
      \pRFSLastname=lastname,
      \pRFSDegree=academic-degree,
      \pRFSPosition=positionText,
      \pRFSField=field-of-research,
      \pRFSRefInstitution=ref-institution-id,
      \pRFSRefAffiliation=ref-affiliation-id,
      \pRFSDepartment=department,
      \pRFSCommitment=commitment,
      \pRFSCategory=category,
      \pRFSFundingSource=funding-source,
      \pRFSDescription=description
    }
    { \__dfg_rfs_collect_current: }
    \int_set:Nn \l__dfg_rfs_record_count_int
    {
      \seq_count:N \l__dfg_rfs_existing_research_seq
      + \seq_count:N \l__dfg_rfs_existing_nonresearch_seq
      + \seq_count:N \l__dfg_rfs_requested_research_seq
      + \seq_count:N \l__dfg_rfs_requested_nonresearch_seq
    }
    \int_compare:nNnTF { \l__dfg_rfs_record_count_int } = {0}
    { \__dfg_rfs_no_data:n {#1} }
    {
      \int_zero:N \l__dfg_rfs_display_number_int
      \__dfg_rfs_render_status:NNnN
        \l__dfg_rfs_existing_research_seq
        \l__dfg_rfs_existing_nonresearch_seq
        {\tl_use:N \l__dfg_rfs_existing_group_label_tl}
        \l__dfg_rfs_existing_descriptions_tl
      \__dfg_rfs_render_status:NNnN
        \l__dfg_rfs_requested_research_seq
        \l__dfg_rfs_requested_nonresearch_seq
        {\tl_use:N \l__dfg_rfs_requested_group_label_tl}
        \l__dfg_rfs_requested_descriptions_tl
      \begin{tblr}[
        theme=requestedFundingStaff,
        long,
        postsep=0pt,
        expand=\l__dfg_rfs_table_body_tl
      ]{
        colsep=2pt,
        width=\textwidth,
        hline{1,Z}={1pt,fg=tableOuterLines},
        hline{2}={1pt,fg=tableOuterLines},
        stretch=.8,
        rowsep=.500pt,
        colspec={X[1.1,l]
                 X[.42,c] % no
                 X[2.18,l] % Name
                 X[1.4,l] % field
                 X[1.5,c] % department
                 X[1.05,c] % proj com.
                 X[1.1,c] % category
                 X[.95,c] % funding
                 },
        column{1}={font=\footnotesize\bfseries,valign=m},
        column{2}={halign=c},
        rows={font=\footnotesize,valign=t},
        rowhead=1,
        row{1}={bg=tableHeadingsBG,fg=tableHeadingsFont,
          font=\scriptsize\bfseries,guard},
        cell{1}{1-8}={halign=c,valign=m}
      }
        & {No.}
        & {Name,~academic\\degree,~position}
        & {Field~of\\research}
        & {Departm.~of\\(non-)univers.\\institution}
        & {Project\\commitm.~(h/wk)}
        & Category
        & {Funding\\source} \\
        \l__dfg_rfs_table_body_tl
      \end{tblr}
      \__dfg_rfs_print_legend:
      \tl_if_empty:NF \l__dfg_rfs_existing_descriptions_tl
      {
        \par\medskip\noindent
        {\tl_use:N \l__dfg_rfs_existing_description_heading_tl}\par\nobreak
        {\normalfont\normalsize\setlength{\parskip}{0pt}
          \tl_use:N \l__dfg_rfs_existing_descriptions_tl}
      }
      \tl_if_empty:NF \l__dfg_rfs_requested_descriptions_tl
      {
        \par\medskip\noindent
        {\tl_use:N \l__dfg_rfs_requested_description_heading_tl}\par\nobreak
        {\normalfont\normalsize\setlength{\parskip}{0pt}
          \tl_use:N \l__dfg_rfs_requested_descriptions_tl}
      }
    }
  }
  { \__dfg_rfs_no_data:n {#1} }
  \group_end:
}

\NewDocumentCommand{\getTotalSumRequestedFunds}{O{RequestedFunding}mm}{
  % #1: database
  % #2: project
  % #3: year
  \def\tmpLocalDB{#1}%
  \DTLifdbexists{\tmpLocalDB}{%
    \__dfg_funding_sum_set:Nnnnn \TotalSumRequestedFunds
      {#1}{#2}{__ALL__}{#3}
    \__dfg_show_calculated_number:nnN
      {getTotalSumRequestedFunds}{#1}
      \TotalSumRequestedFunds
  }{
  	\texttt{\color{error}XXX}
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}

\NewDocumentCommand{\getSumExistingFunds}{O{RequestedAndExistingFundingDirectCosts}mm}{
  % #1: database
  % #2: project
  % #3: year
  \def\tmpLocalDB{#1}%
  \DTLifdbexists{\tmpLocalDB}{
    \__dfg_funding_sum_set:Nnnnn \SumExistingFunds
      {#1}{#2}{__ALL__}{#3}

    \__dfg_show_calculated_number:nnN
      {getSumExistingFunds}{#1}
      \SumExistingFunds
  }{
  	\texttt{\color{error}XXX}
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}

\providecommand{\SumRequestedFunds}{0}

\NewDocumentCommand{\getSumRequestedFunds}{ O{RequestedFunding} m m m }{%
  \DTLifdbexists{#1}{%
    \__dfg_funding_sum_set:Nnnnn \SumRequestedFunds {#1}{#2}{#3}{#4}%
    \__dfg_show_calculated_number:nnN
      {getSumRequestedFunds}{#1}
      \SumRequestedFunds
  }{%
  	\texttt{\color{error}XXX}%
  	\msg_warning:nne { dfg } { database-not-found } { #1 }%
  }%
}
\NewDocumentCommand{\dfgCheckIfZeroShowCategory}{ O{RequestedFunding} m m }
{
  % #1: database
  % #2: project
  % #3: category/type
  \def\tmpLocalDB{#1}
  \DTLifdbexists{\tmpLocalDB}{
    \__dfg_funding_sum_set:Nnnnn \SumRequestedFunds {#1}{#2}{#3}
      {sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  	\fp_compare:nNnT { \SumRequestedFunds } = {0}
  	{ \tl_clear:c {l__tmp_body_#3_tl }}
  }
  {
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}
\NewDocumentCommand{\RequestedAndExistingFundingDirectCostsTable}{m}
{
  % #1: project
  \def\tmpLocalDB{RequestedAndExistingFundingDirectCosts}%
  \DTLifdbexists{\tmpLocalDB}{%
  	\tl_clear:N \l__tmp_body_costs_tl
  	\DTLforeach[\DTLiseq{\pProject}{#1}]{\tmpLocalDB}{
  		\pProject=ref-project-id,
  		\pAffiliation=ref-affiliation-id,
  		\pFinancedBy=financed-by,
  		\pSumYearOne=sum-year1,
  		\pSumYearTwo=sum-year2,
  		\pSumYearThree=sum-year3,
  		\pSumYearFour=sum-year4,
  		\pSumYearFive=sum-year5
  	}{
		\DTLaddall{\tmpHorizontalSum}{
  			\pSumYearOne,
  			\pSumYearTwo,
  			\pSumYearThree,
  			\pSumYearFour,
  			\pSumYearFive
  		}

  		\tl_put_right:Ne \l__tmp_body_costs_tl
  		{
  			\str_if_eq:VnTF { \pAffiliation }  { other-funds }
  			{ Other }
      { \getEntry[affiliation]{\pAffiliation}{name} : } ~
      existing~ funds~ from~
      % Freeze the database value without expanding commands such as \RWTH,
      % whose trailing \xspace must only run when the completed cell is typeset.
      \dfgShowTag{\pProject/\pAffiliation}{financed-by}
        {\exp_not:V \pFinancedBy}[\tmpLocalDB]
      \printMarginalia{\dfgShowCalculatedTag
        {RequestedAndExistingFundingDirectCostsTable}{\tmpLocalDB}
        {\__dfg_show_eur:n{\tmpHorizontalSum}}}
      & \dfgShowTag{\pProject/\pAffiliation}{sum-year1}
          {\__dfg_show_eur:n{\pSumYearOne}}[\tmpLocalDB]
      & \dfgShowTag{\pProject/\pAffiliation}{sum-year2}
          {\__dfg_show_eur:n{\pSumYearTwo}}[\tmpLocalDB]
      & \dfgShowTag{\pProject/\pAffiliation}{sum-year3}
          {\__dfg_show_eur:n{\pSumYearThree}}[\tmpLocalDB]
      & \dfgShowTag{\pProject/\pAffiliation}{sum-year4}
          {\__dfg_show_eur:n{\pSumYearFour}}[\tmpLocalDB]
      & \dfgShowTag{\pProject/\pAffiliation}{sum-year5}
          {\__dfg_show_eur:n{\pSumYearFive}}[\tmpLocalDB] \\
  		}
  	}
  	\tl_put_right:Ne \l__tmp_body_costs_tl
  	{
  		\SetHline{-}{tableOuterLines,0.5pt}
  		\SetRow{belowsep=5pt}
  		Sum~ of~ existing~ funds
  		\printMarginalia{%
  			\getSumExistingFunds{#1}
  			{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  		}
  		& \getSumExistingFunds{#1}{sum-year1}
  		& \getSumExistingFunds{#1}{sum-year2}
  		& \getSumExistingFunds{#1}{sum-year3}
  		& \getSumExistingFunds{#1}{sum-year4}
  		& \getSumExistingFunds{#1}{sum-year5} \\
  	}

  	\begin{tblr}[
  			theme=main,
  			long,
  			expand=
  			\l__tmp_body_costs_tl,
			remark{Note}={Figures~ in~ EUR},
  		]{
  			% colsep=3pt,
  			colspec = {
  					*{1}{X[4,t]}
  						*{5}{
							@{}X[c,si={table-format=8}]
  						}},
  			rows = {bg=white},
			column{2-6}={guard},
  			row{1}= {guard,bg=tableHeadingsBG},
  			row{Y,Z}= {
  				          %bg=tableHeadingsBGalt,
  				          font={\footnotesize\bfseries}},
  		}

		 & \dfgFundingYear{1}
		 & \dfgFundingYear{2}
		 & \dfgFundingYear{3}
		 & \dfgFundingYear{4}
		 & \dfgFundingYear{5}                                \\

  		\l__tmp_body_costs_tl

  		\SetHline{-}{tableOuterLines,.75pt}
  		%\SetCell{font=\bfseries\footnotesize}
  		Sum~ of~ requested~ funds
  		\printMarginalia{%
  			\getSumRequestedFunds{#1}{costs}
  			{sum-year1,sum-year2,sum-year3,sum-year4,sum-year5}
  		}
  		 & \getSumRequestedFunds{#1}{costs}{sum-year1}
  		 & \getSumRequestedFunds{#1}{costs}{sum-year2}
  		 & \getSumRequestedFunds{#1}{costs}{sum-year3}
  		 & \getSumRequestedFunds{#1}{costs}{sum-year4}
  		 & \getSumRequestedFunds{#1}{costs}{sum-year5} \\
  	\end{tblr}
  }{
  	Database~ \texttt{#1}~ missing.
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }
}
\RequirePackage[breakable,fitting,skins,most]{tcolorbox}

\tcbset{
  PIbox/.style={
  		%enhanced, breakable,
  		colback=white, colframe=white,
  		coltitle=black,
  		boxrule=0pt, %arc=2pt,
  		before~ skip=0pt, after~ skip=7pt,
  		before~ upper=\RaggedRight\small,
  		boxsep=0pt,
  		left=0pt, right=0pt, top=7pt, bottom=0pt,
  	},
}

\bool_if:NTF \l__dfg_class_final_bool
{\newcommand{\dfgcomment}[2][]{}}
{\NewTotalTColorBox{\dfgcomment}{ O{} m }
  {%
  	nobeforeafter,
  	colupper=black!50!white,
  	coltitle=black!75!white,
  	fonttitle=\fontsize{7}{9}\selectfont\bfseries,
  	colback=black!5!white,
  	colframe=black!15!white,
  	width=\linewidth,
  	%  text height=4cm,
  	breakable,
  	enhanced,
  	left=0pt,right=0pt,
  	top=0pt,bottom=0pt,
  	% text width=\linewidth,
  	fontupper=\fontsize{7}{9}\selectfont,
  	title={Anmerkung~der~DFG},
  	#1
  }{#2}}
\tcbset{
  dfgStyle/.style={%
  		enhanced~ jigsaw,
  		colback       =white,
  		colbacktitle  =tableHeadingsBG,
  		coltitle      =tableHeadingsFont,
  		colframe      =tableOuterLines,
  		%colupper      =tableHeadingsFont,
  		fontupper     =\sffamily,
  		fonttitle     =\bfseries,
  		% after skip   =1em,
  		before        ={\pagebreak[0]},
  		after         ={\nopagebreak},
  		% fonttitle    =\bfseries,
  		%boxrule      =0.5pt,
  		sharp~ corners,
  		toprule      =1pt,
  		rightrule    =0mm,
  		leftrule     =0mm,
  		% drop shadow =rwthGrey,
  		%drop large lifted shadow,
  		width         =\linewidth,
  		bottomrule    =1pt,
  		% draft,
  		left          =2mm,
  		bottom        =0mm,
  		top           =0mm,
  		capture       =minipage,
  	}}
\NewTotalTColorBox{\dfgBox}{ O{} m }
{%
  dfgStyle,
  nobeforeafter,
  left=0pt,right=0pt,
  top=0pt,bottom=0pt,
  #1
}{#2}
\newtcolorbox{dfgSummaryBox}[1][]{
  dfgStyle,
  top=1mm,
  left=1mm,
  bottom=1mm,
  before={\par},
  after={\par},
  before~ upper={\begin{itemize}[leftmargin=.5cm]%
  		\renewcommand{\labelitemi}{\dfgTargetPoint}%
  		\hypersetup{linkcolor=tableHeadingsFont}%
  		\colorlet{referencePI}{tableHeadingsFont}
  		\colorlet{referenceWP}{tableHeadingsFont}
  		\colorlet{referenceAim}{tableHeadingsFont}
  	},
  after~ upper={\end{itemize}},
  %  height=2.5cm,
  fontupper=\rmfamily,
  % ------ title below.
  width=\linewidth,
  rounded~ corners,
  toprule=1pt,
  rightrule=1pt,
  leftrule=1pt,
  bottomrule=1pt,
  % attach boxed title to bottom center,
  boxed~ title~ style={empty,boxrule=1pt},
  varwidth~ boxed~ title=0.5\linewidth,
  #1
}
\newtcolorbox{dfgBoxEnv}[1][]{
  dfgStyle,
  % top=-1.5mm,
  % left=1mm,
  before={\par},
  #1
}
\providecommand{\crc}{Collaborative~ Research~ Centre\xspace}
\providecommand{\dfgLocation}{<Location>\xspace}
\providecommand{\dfgDate}{2026-06-11\xspace} % date when proposal will be turned in
\providecommand{\dfgTitle}{\enquote{\get[meta]{crc}{name}}\xspace}
\providecommand{\InfoTeX}{LuaLaTeX~ (via~ Overleaf).}

\providecommand{\crcLogoPath}{\tl_use:N \l__dfg_custom_crc_logo_path_tl}
\providecommand{\affiliationLogoPath}
  {\tl_use:N \l__dfg_custom_affiliation_logo_path_tl}

\NewDocumentCommand{\crcLogo}{O{1cm}}{%
  \includegraphics[#1]{\crcLogoPath}}

\NewDocumentCommand{\affiliationLogo}{O{1cm}}{%
  \includegraphics[#1]{\affiliationLogoPath}}

\keys_define:nn { hrule }
{
  color     .tl_set:N   = \l__hrule_color_tl,
  color     .initial:n  = color@tags@line,
  above     .dim_set:N  = \l__hrule_above_dim,
  above     .initial:n  = 0pt,
  below     .dim_set:N  = \l__hrule_below_dim,
  below     .initial:n  = 0pt,
  thickness .dim_set:N  = \l__hrule_thickness_dim,
  thickness .initial:n  = 0.4pt,
}

\ProvideDocumentCommand{\Hrule}{O{}}
{%
  \group_begin:
  \keys_set:nn { hrule } {#1}%
  \par
  \addvspace{ \l__hrule_above_dim }%
  {\color{ \l__hrule_color_tl }\hrule height \l__hrule_thickness_dim}%
  \addvspace{ \l__hrule_below_dim }%
  \group_end:
}

\AtBeginEnvironment{center}{
  \vspace*{-2em}
}

\seq_new:N \l__dfg_sig_pairs_seq
\tl_new:N  \l__dfg_sig_id_tl
\tl_new:N  \l__dfg_sig_desc_tl
\NewDocumentCommand{\printSignature}{ O{person} m }
{
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
    \par
    \seq_set_split:Nnn \l__dfg_sig_pairs_seq { } {#2}
    \int_compare:nNnT { \seq_count:N \l__dfg_sig_pairs_seq } > { 0 }
    { \__dfg_signature_consume_pairs:n {#1} }
  }
}

\tl_new:N \l__dfg_signature_role_id_tl
\tl_new:N \l__dfg_signature_role_tl
\tl_new:N \l__dfg_signature_role_period_tl

\NewDocumentCommand{\printSignaturesWithRole}{ O{person} m m }
{
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
    \DTLifdbexists{#1}
    {
      \DTLforeach*[
        \DTLisinlist{\theFundingPeriodNumeral}{\l__dfg_signature_role_period_tl}
        \and
        \DTLisinlist{#2}{\l__dfg_signature_role_tl}
      ]{#1}{
        \l__dfg_signature_role_id_tl     = id,
        \l__dfg_signature_role_tl        = role,
        \l__dfg_signature_role_period_tl = period
      }{
        \__dfg_signature_block:nnn
          {#1}{\l__dfg_signature_role_id_tl}{#3}
      }
    }
    { \msg_warning:nne { dfg } { database-not-found } {#1} }
  }
}
\cs_new_protected:Npn \__dfg_signature_consume_pairs:n #1
{
  \seq_pop_left:NN \l__dfg_sig_pairs_seq \l__dfg_sig_id_tl
  \seq_pop_left:NNTF \l__dfg_sig_pairs_seq \l__dfg_sig_desc_tl
  {
  	\__dfg_signature_block:nVV {#1} \l__dfg_sig_id_tl \l__dfg_sig_desc_tl
  	\seq_if_empty:NF \l__dfg_sig_pairs_seq
  	{ \__dfg_signature_consume_pairs:n {#1} }
  }
  {
  	\msg_warning:nnn { crc-proposal } { signature-odd-args } {#1}
  }
}
\msg_new:nnn { crc-proposal } { signature-odd-args }
{ \printSignature\ in\ db\ '#1':\ odd\ number\ of\ tokens,\ %
  expected\ {id}{desc}\ pairs. }
\cs_new_protected:Npn \__dfg_signature_block:nnn #1 #2 #3
{
  \DTLgetvalueforkey{\theAffiliationOfRoleID}{ref-affiliation-id}{#1}{id}{#2}
  \DTLgetvalueforkey{\__dfgtmpDegree}   {academicdegree}{#1}{id}{#2}
  \DTLgetvalueforkey{\__dfgtmpFirst}    {firstname}     {#1}{id}{#2}
  \DTLgetvalueforkey{\__dfgtmpLast}     {lastname}      {#1}{id}{#2}
  \begin{tblr}{
  	            width=\linewidth,
  	            colspec={@{}b{3cm}b{1cm}X[b]@{}},
              }
              {\theCRCaffiliationLocation \\ \dfgDate} &  & \faFileSignature                                       \\
              \SetHline{3-3}{tableOuterLines,1pt}
                                                       &  & {
                                                            \dfgShowTag{#2}{academicdegree}{\__dfgtmpDegree}[#1]\space
                                                              \textcolor{referencePI}{
                                                              \dfgShowTag{#2}{firstname}{\__dfgtmpFirst}[#1]\space
                                                              \dfgShowTag{#2}{lastname}{\__dfgtmpLast}[#1]} \\
  	                                                          #3 } \\
  \end{tblr}
  \par\bigskip
}
\cs_generate_variant:Nn \__dfg_signature_block:nnn { nVV }
\bool_new:N \l__dfg_narrow_bool
\bool_new:N \l__dfg_institution_abbreviation_bool
\bool_new:N \l__dfg_noaddr_bool
\bool_new:N \l__dfg_nozip_bool
\bool_new:N \l__dfg_noloc_bool
\bool_new:N \l__dfg_has_country_bool
\seq_new:N  \l__dfg_inst_ids_seq
\tl_new:N   \l__dfg_sep_tl
\tl_new:N   \l__dfg_inst_sep_tl

\cs_generate_variant:Nn \seq_set_from_clist:Nn { NV }

\NewDocumentCommand{\dfgInstitutionList}{O{person} m o}
{
 \bool_if:NTF \l__dfg_class_fastcompile_project_bool
 { \dfgFastReference{#2} }
 {
 \DTLifdbexists{#1}{
  % --- parse options once ---------------------------------------------
  \clist_if_in:nnTF {#3} {abbreviation}
  { \bool_set_true:N \l__dfg_institution_abbreviation_bool }
  { \bool_set_false:N \l__dfg_institution_abbreviation_bool }
  \clist_if_in:nnTF {#3} {narrow}
  { \bool_set_true:N  \l__dfg_narrow_bool
  	\tl_set:Nn \l__dfg_sep_tl      {,~}
  	\tl_set:Nn \l__dfg_inst_sep_tl {;~} }
  { \bool_set_false:N \l__dfg_narrow_bool
  	\tl_set:Nn \l__dfg_sep_tl      {\newline}
  	\tl_set:Nn \l__dfg_inst_sep_tl {\par\medskip} }
  \clist_if_in:nnTF {#3} {noaddress}
  { \bool_set_true:N \l__dfg_noaddr_bool }{ \bool_set_false:N \l__dfg_noaddr_bool }
  \clist_if_in:nnTF {#3} {nozip}
  { \bool_set_true:N \l__dfg_nozip_bool }{ \bool_set_false:N \l__dfg_nozip_bool }
  \clist_if_in:nnTF {#3} {nolocation}
  { \bool_set_true:N \l__dfg_noloc_bool }{ \bool_set_false:N \l__dfg_noloc_bool }
  \datatool_if_has_key:nnTF {affiliation}{country}
  { \bool_set_true:N \l__dfg_has_country_bool }
  { \bool_set_false:N \l__dfg_has_country_bool }

  % --- get list of institution ids for this person --------------------
  \DTLgetvalueforkey{\theInstitutionListValue}{ref-institution-id}{#1}{id}{#2}
  \seq_set_from_clist:NV \l__dfg_inst_ids_seq \theInstitutionListValue

  % --- iterate --------------------------------------------------------
  \bool_set_true:N \l_tmpa_bool
  \seq_map_inline:Nn \l__dfg_inst_ids_seq
  {
  	\bool_if:NTF \l_tmpa_bool
  	{ \bool_set_false:N \l_tmpa_bool }
  	{ \tl_use:N \l__dfg_inst_sep_tl }
  	\__dfg_one_institution:n {##1}
  }
}
   {
     Database~ \texttt{#1}~ missing.
     \msg_warning:nne { dfg } { database-not-found }{ #1 }
   }
 }
}

\cs_new_protected:Npn \__dfg_one_institution:n #1
{
 \DTLifdbexists{institution}{ \DTLgetvalueforkey{\theAffiliationIDValue}{ref-affiliation-id}{institution}{id}{#1}

  \bool_if:NTF \l__dfg_institution_abbreviation_bool
  {
    \__dfg_institution_abbreviation_or_name:nN
      {#1} \l_tmpa_tl
    \cs_set:Npx \theInstitutionNameValue { \exp_not:V \l_tmpa_tl }
  }
  { \DTLgetvalueforkey{\theInstitutionNameValue}{name}{institution}{id}{#1} }
  \DTLifnullorempty{\theInstitutionNameValue}{}
  {
    \dfgShowTag{#1}{\l__dfg_institution_label_field_tl}
      {\theInstitutionNameValue}[institution]
  	\tl_use:N \l__dfg_sep_tl
  }

  \DTLgetvalueforkey{\theAffiliationNameValue}{name}{affiliation}{id}{\theAffiliationIDValue}
  \dfgShowTag{\theAffiliationIDValue}{name}
    {\theAffiliationNameValue}[affiliation]

  \bool_if:NF \l__dfg_noaddr_bool
  {
  	\tl_use:N \l__dfg_sep_tl
  	\DTLgetvalueforkey{\theAffiliationStreetValue}{addressStreet}{affiliation}{id}{\theAffiliationIDValue}
    \dfgShowTag{\theAffiliationIDValue}{addressStreet}
      {\theAffiliationStreetValue}[affiliation]
  }

  \bool_if:NF \l__dfg_nozip_bool
  {
  	,~
  	\DTLgetvalueforkey{\theAffiliationZIPValue}{addressZIP}{affiliation}{id}{\theAffiliationIDValue}
    \dfgShowTag{\theAffiliationIDValue}{addressZIP}
      {\theAffiliationZIPValue}[affiliation]
  	\bool_if:NF \l__dfg_noloc_bool { ~ }
  }

  \bool_if:NF \l__dfg_noloc_bool
  {
  	\bool_if:NT \l__dfg_nozip_bool { ,~ }
  	\DTLgetvalueforkey{\theAffiliationLocationValue}{location}{affiliation}{id}{\theAffiliationIDValue}
    \dfgShowTag{\theAffiliationIDValue}{location}
      {\theAffiliationLocationValue}[affiliation]
  	\bool_if:NT \l__dfg_has_country_bool
  	{
  		\DTLgetvalueforkey{\theAffiliationCountryValue}{country}{affiliation}{id}{\theAffiliationIDValue}
  		\DTLifnullorempty{\theAffiliationCountryValue}{}
      { ~(\dfgShowTag{\theAffiliationIDValue}{country}
          {\theAffiliationCountryValue}[affiliation]) }
  	}
  }
}
   {
     Database~ \texttt{institution}~ missing.
     \msg_warning:nne { dfg } { database-not-found }{ institution }
   }
}
\NewDocumentCommand{\getPIsWithRole}{O{person} m O{}}
{%
  \bool_if:NTF \l__dfg_class_fastcompile_bool
  { \dfgItemSkipped{dfgPIsWithRole:~#2} }
  {%
    \DTLifdbexists{#1}
    {
      \def\tmpLocalDB{#1}%
      \DTLsort*{lastname}{#1}%
      \begin{tcbraster}[
          raster~ columns=3,
          raster~ equal~ height=rows,
          raster~ column~ skip=4pt,
          raster~ row~ skip=10pt,
          PIbox,
          #3
        ]
        \DTLforeach*[
          \DTLisinlist{\theFundingPeriodNumeral}{\period}
          \and
          \DTLisinlist{#2}{\role}
        ]{#1}{
          \id     = id,
          \role   = role,
          \period = period
        }{%
          \__getperson_one:n {\id}%
        }%
      \end{tcbraster}
    }
    {
      Database~ \texttt{#1}~ missing.
      \msg_warning:nne { dfg } { database-not-found }{ #1 }
    }
  }
}
\NewDocumentCommand{\getPI}{s m o} {
  % #1: starred version -> firstname
  % #2: id of PI / person
  % #3: optional text, but reference linked to PI
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  { \IfNoValueTF{#3}{\dfgFastReference{#2}}{#3} }
  {
  \seq_clear:N \l_tmpa_seq
  \seq_set_from_clist:Nn \l_tmpa_seq {#2}%
  \seq_set_map:NNn \l_tmpb_seq \l_tmpa_seq {
  	\exp_not:n {
  		\group_begin:
  		\DTLgetvalueforkey{\thePersonName}{lastname}{person}{id}{##1}
  		\DTLgetvalueforkey{\thePersonFirstName}{firstname}{person}{id}{##1}
  		\datatool_if_null:NTF {\thePersonName}
  		{ \getEntry[person]{##1}{lastname} %<- just to get the error message
  			\textcolor{error}{\texttt{<?##1?>}}
  		}
  		{
  			\color{referencePI}\bfseries
  			\IfNoValueTF{#3}%

  			{\hyperlink{pi:##1}{\IfBooleanT{#1}
            {\dfgShowTag{##1}{firstname}{\thePersonFirstName}[person]\space}
            \dfgShowTag{##1}{lastname}{\thePersonName}[person]}}
  			{\hyperlink{pi:##1}{#3}}}
  		\group_end:
  	}}
  \seq_use:Nn \l_tmpb_seq {\addnbthinspace{/}\addthinspace}%
  }
}
\NewDocumentCommand \getProjectColor { m }
{
  \exp_args:Nx \color { project \tl_head:n { #1 } }
}
\tl_new:N \l__dfg_project_reference_only_tl

\prg_new_protected_conditional:Npnn \__dfg_project_if_reference_only:n #1
  { T,F,TF }
{
  \DTLgetvalueforkey{\l__dfg_project_reference_only_tl}
    {reference-only}{project}{id}{#1}
  \str_if_eq:VnTF \l__dfg_project_reference_only_tl { true }
    { \prg_return_true: }
    { \prg_return_false: }
}

\cs_new_protected:Npn \__dfg_project_reference_only_indicator:
{
  \bool_if:NTF \l__dfg_former_project_compact_bool
  {
    \bool_gset_true:N \g__dfg_former_project_seen_bool
    {\normalfont\normalcolor\textsuperscript{*}}
  }
  {
    \nobreakspace
    {\normalfont\normalcolor(former~project)}
  }
}

\cs_new_protected:Npn \__dfg_project_reference_seq_use:N #1
{
  \bool_if:NTF \g__dfg_tblr_inside_bool
    { \seq_use:Nn #1 {\addnbthinspace/\addthinspace} }
    { \seq_use:Nnnn #1 {~and~} {,~} {,~and~} }
}

\cs_new_protected:Npn \__dfg_project_reference_clist_use:N #1
{
  \bool_if:NTF \g__dfg_tblr_inside_bool
    { \clist_use:Nn #1 {\addnbthinspace/\addthinspace} }
    { \clist_use:Nnnn #1 {~and~} {,~} {,~and~} }
}

\cs_new_protected:Npn \__dfg_get_project_compact:nn #1#2 {
  % #1: id of project
  % #2: optional text, but reference linked to project
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  {
    \seq_set_from_clist:Nn \l_tmpa_seq {#1}
    \seq_set_map:NNn \l_tmpb_seq \l_tmpa_seq
    {
      \exp_not:n
      { \IfNoValueTF{#2}{\dfgFastReference{##1}}{#2} }
    }
    \__dfg_project_reference_seq_use:N \l_tmpb_seq
  }
  {
  \seq_clear:N \l_tmpa_seq
  \seq_set_from_clist:Nn \l_tmpa_seq {#1}%
  \seq_set_map:NNn \l_tmpb_seq \l_tmpa_seq {
  	\exp_not:n {
  		\group_begin:
  		\DTLgetvalueforkey{\theProjectNumber}{number}{project}{id}{##1}
  		\datatool_if_null:NTF {\theProjectNumber}
  		{ \getEntry[project]{##1}{number} %<- just to get the error message
  			\textcolor{error}{\texttt{<?##1?>}}
  		}{
  			\bfseries%
  			\getProjectColor{##1}%
        \__dfg_project_if_reference_only:nTF {##1}
        {
          \IfNoValueTF{#2}
            {\dfgShowTag{##1}{number}{\theProjectNumber}[project]}
            {#2}%
          \__dfg_project_reference_only_indicator:
        }
        {
          \IfNoValueTF{#2}%
          {
            \bool_if:NTF \l__dfg_class_cv_bool
              { \dfgShowTag{##1}{number}{\theProjectNumber}[project] }
              { \hyperlink{project:##1}
                  {\dfgShowTag{##1}{number}{\theProjectNumber}[project]} }
          }%
          {
            \bool_if:NTF \l__dfg_class_cv_bool
              { #2 }
              { \hyperlink{project:##1}{#2} }
          }%
        }
  		}
  		\group_end:
  	}}%
  \__dfg_project_reference_seq_use:N \l_tmpb_seq
  }
}

\NewDocumentCommand{\getProject}{m o}
{
  \bool_if:NTF \l__dfg_custom_project_pi_once_per_section_bool
    { \__dfg_get_project_with_people:nnn {\BooleanFalse} {#1} {#2} }
    { \__dfg_get_project_compact:nn {#1} {#2} }
}

\int_new:N \g__dfg_project_count_all_int
\prop_new:N \g__dfg_project_count_area_prop
\tl_new:N  \l__dfg_project_count_id_tl
\tl_new:N  \l__dfg_project_count_area_tl
\tl_new:N  \l__dfg_project_count_status_tl
\tl_new:N  \l__dfg_project_count_consider_for_lists_tl
\tl_new:N  \l__dfg_project_count_reference_only_tl

\cs_new_protected:Npn \__dfg_project_count_increment:n #1
{
  \int_gincr:N \g__dfg_project_count_all_int
  \tl_set:Nx \l_tmpa_tl { \tl_upper_case:n {#1} }
  \prop_get:NVNTF \g__dfg_project_count_area_prop
    \l_tmpa_tl \l_tmpb_tl
    {
      \prop_gput:NVx \g__dfg_project_count_area_prop \l_tmpa_tl
        { \int_eval:n { \l_tmpb_tl + 1 } }
    }
    { \prop_gput:NVn \g__dfg_project_count_area_prop \l_tmpa_tl { 1 } }
}

\cs_new_protected:Npn \__dfg_project_count_build:
{
  \int_gzero:N \g__dfg_project_count_all_int
  \prop_gclear:N \g__dfg_project_count_area_prop
  \DTLifdbexists{project}
  {
    \DTLifhaskey { project } { project-area }
      { }
      { \DTLaddcolumn { project } { project-area } }
    \DTLforeach*{project}
    {
      \l__dfg_project_count_id_tl                 = id,
      \l__dfg_project_count_area_tl               = project-area,
      \l__dfg_project_count_status_tl             = project-status,
      \l__dfg_project_count_consider_for_lists_tl = consider-for-lists,
      \l__dfg_project_count_reference_only_tl     = reference-only
    }
    {
      \bool_lazy_all:nT
      {
        { \str_if_eq_p:Vn \l__dfg_project_count_consider_for_lists_tl { true } }
        { \str_if_eq_p:Vn \l__dfg_project_count_reference_only_tl { false } }
        {
          \bool_lazy_or_p:nn
            { \str_if_eq_p:Vn \l__dfg_project_count_status_tl { C } }
            { \str_if_eq_p:Vn \l__dfg_project_count_status_tl { N } }
        }
      }
      {
        \DTLifnullorempty{\l__dfg_project_count_area_tl}
          {
            \tl_set:Nx \l__dfg_project_count_area_tl
              { \tl_head:V \l__dfg_project_count_id_tl }
          }
          { }
        \tl_trim_spaces:N \l__dfg_project_count_area_tl
        \exp_args:NV \__dfg_project_count_increment:n
          \l__dfg_project_count_area_tl
      }
    }
  }
  { \msg_warning:nnn { dfg } { database-not-found } { project } }
  \bool_gset_true:N \g__dfg_project_count_ready_bool
}

\NewDocumentCommand{\getProjectCount}{o}
{
  \bool_if:NF \g__dfg_project_count_ready_bool
    { \__dfg_project_count_build: }
  \dfgShowCalculatedTag{getProjectCount}{project}
  {
    \IfNoValueTF{#1}
      { \int_use:N \g__dfg_project_count_all_int }
      {
        \tl_set:Nx \l_tmpa_tl { \tl_upper_case:n {#1} }
        \prop_get:NVNTF \g__dfg_project_count_area_prop
          \l_tmpa_tl \l_tmpb_tl
          { \tl_use:N \l_tmpb_tl }
        {
          \msg_warning:nnn { dfg } { invalid-project-count-area } {#1}
          0
        }
      }
  }
}
\clist_new:N \l__dfg_person_project_clist
\clist_new:N \l__dfg_project_id_clist
\clist_new:N \l__dfg_project_number_clist

\NewDocumentCommand{\getPIProject}{s m}{
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  { \dfgFastReference{#2} }
  {
  %
  %  • Argument #1  (optional *‑star)
  %      – if present, the PI’s *first name* is printed before the last name;
  %        if the star is omitted only the last name is printed.
  %
  %  • Argument #2  (mandatory)
  %      – a comma‑separated list of *person‑IDs* (the field “id” in your
  %        “person” datatool table).
  %        Example:  `\getPIProject*{per1,per2}`.
  %
  %  What the macro does (high‑level description)
  %  --------------------------------------------------------------
  %  1. Turns the comma list #2 into a clist:   \l__dfg_person_id_clist
  %  2. For **each** person‑ID in that clist it builds an
  %     “author block” consisting of
  %        • a coloured, bold hyperlink to the PI’s entry, and
  %        • the list of projects (formatted by \getProject) that are
  %          attached to that PI.
  %  3. All author blocks are collected in a second clist
  %     \l__dfg_person_project_clist.
  %  4. Finally the blocks are printed in an *Oxford‑comma* style
  %     using \clist_use:Nnnn.
  %
  %  Internal containers (all declared elsewhere with \clist_new:N)
  %  --------------------------------------------------------------
  %    \l__dfg_person_id_clist          – list of the IDs passed in #2
  %    \l__dfg_person_project_clist     – the final list of “author blocks”
  %    \l__dfg_project_id_clist         – temporary clist that stores the raw
  %                                      CSV string returned by the DB field
  %                                      `ref‑project‑id` for the current PI.
  %    \l__dfg_project_number_clist      – coloured project numbers for the
  %                                      current PI (built by the inner loop).
  %    \l__dfg_project_id_clist (re‑used) – holds the CSV string before it is
  %                                      split into \l__dfg_project_id_clist.
  %    \l_tmpa_clist                  – loop variable used by
  %                                      \clist_map_variable:NNn (holds a *single*
  %                                      project‑ID during the inner loop).
  %
  %---------------------------------------------------------------------
  %  Detailed walk‑through of the code
  %---------------------------------------------------------------------
  %---------------------------------------------------------------
  %   0.  Initialise the containers
  %---------------------------------------------------------------
  % #2 is a comma‑separated list of person IDs → turn it into a clist
  \clist_set:Nn \l__dfg_person_id_clist {#2}
  % containers that will be filled later
  \clist_clear:N \l__dfg_person_project_clist
  \clist_clear:N \l__dfg_project_id_clist   % (used as a *scratch* clist)

  %---------------------------------------------------------------
  %   1.  Outer loop – one iteration per PI
  %---------------------------------------------------------------
  \clist_map_inline:Nn \l__dfg_person_id_clist
  {               % ##1 = the current person ID
  	%---------------------------------------------------------
  	%   a)  Build the *author name* (hyperlinked, coloured,
  	%       bold).  We wrap everything in \exp_not:n so that the
  	%       whole fragment is **not expanded now** – it will be
  	%       expanded later when the final clist is printed.
  	%---------------------------------------------------------
  	\clist_put_right:Nn \l__dfg_person_project_clist {
  		\clist_clear:N   \l__dfg_project_number_clist
  		\IfBooleanTF{#1}
  		{\getPI*{##1}}
  		{\getPI{##1}}
  		%---------------------------------------------------------
  		%   b)  Pull the raw CSV string that contains *all* project
  		%       IDs belonging to this PI.
  		%---------------------------------------------------------
  		\DTLgetvalueforkey{\l__dfg_project_id_clist}
  		{ref-project-id}
  		{person}{id}{##1}

  		%---------------------------------------------------------
  		%   c)  Print the project list inside parentheses.
  		%       The raw CSV string is *still* a token list; we turn it
  		%       into a clist by using the special “variable” version of
  		%       \clist_map_… which gives us a temporary clist variable
  		%       (\l_tmpa_clist) that holds *one* project ID at a time.
  		%---------------------------------------------------------
  		\space(
  		\clist_map_variable:NNn \l__dfg_project_id_clist \l_tmpa_clist {
  			% ##1 (here called \l_tmpa_clist) is a single project ID.
  			% \getProject expands that ID to the coloured project number.
  			\clist_put_right:Ne \l__dfg_project_number_clist {
  				\getProject{\l_tmpa_clist}
  			}
  		}
  		% finally print the list of coloured project numbers, separated
  		% by a thin space + comma
  		\clist_use:Nn \l__dfg_project_number_clist  {\addnbthinspace/\addthinspace}
  		)
  	}   % end of \clist_put_right:Nn  (one author block)
  } % end of outer \clist_map_inline:Nn

  %---------------------------------------------------------------
  %   2.  Typeset the collected author blocks.
  %       \clist_use:Nnnn joins the items with
  %          “~and~”   for the *last* separator,
  %          “,~”      for the *middle* separators,
  %          “,~and~”  for the *penultimate* separator
  %---------------------------------------------------------------
  \clist_use:Nnnn \l__dfg_person_project_clist {~and~} {,~} {,~and~}%
  }
}

\clist_new:N \l__dfg_person_clist

\prop_new:N \g__dfg_project_pi_seen_prop
\cs_new_protected:Npn \__dfg_project_pi_seen_clear:
  { \prop_gclear:N \g__dfg_project_pi_seen_prop }
\AddToHook{cmd/chapter/before}[dfg/project-pi-once-per-section]
  { \__dfg_project_pi_seen_clear: }
\AddToHook{cmd/section/before}[dfg/project-pi-once-per-section]
  { \__dfg_project_pi_seen_clear: }

\prg_new_protected_conditional:Npnn \__dfg_project_pi_if_show_people:n #1
  { T,F,TF }
{
  \__dfg_project_if_reference_only:nTF {#1}
    { \prg_return_false: }
    {
      \tl_if_eq:VnTF \l__tmp_current_project_tl {#1}
        { \prg_return_false: }
        {
          \bool_if:nTF
            {
              \g__dfg_tblr_inside_bool
              || \l__dfg_former_project_compact_bool
            }
            { \prg_return_false: }
            {
              \bool_if:NTF \l__dfg_custom_project_pi_once_per_section_bool
              {
                \prop_if_in:NnTF \g__dfg_project_pi_seen_prop {#1}
                  { \prg_return_false: }
                  {
                    \prop_gput:Nnn \g__dfg_project_pi_seen_prop {#1} { }
                    \prg_return_true:
                  }
              }
              { \prg_return_true: }
            }
        }
    }
}

\cs_new_protected:Npn \__dfg_get_project_with_people:nnn #1#2#3
{
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  { \__dfg_get_project_compact:nn {#2} {#3} }
  {
  %-----------------------------------------------------------------
  % 0.  Initialise the containers we are going to use.
  %-----------------------------------------------------------------
  %   #2 is a comma‑separated list of *project* IDs → turn it into a clist.
  \clist_set:Nn \l__dfg_project_id_clist {#2}
  %   These three clists will be filled during the loops.
  \clist_clear:N \l__dfg_person_project_clist   % final result: “project → PI list”
  \clist_clear:N \l__dfg_person_id_clist        % temporary list of PIs for one project
  \clist_clear:N \l__dfg_person_clist           % temporary list of formatted PI names

  %-----------------------------------------------------------------
  % 1.  Outer loop – one iteration per *project* ID.
  %-----------------------------------------------------------------
  \clist_map_inline:Nn \l__dfg_project_id_clist
  {
  	% ##1 = the current project ID
  	%-------------------------------------------------------------
  	%   a)  Put the *project number* (coloured) at the beginning
  	%       of the block that will be stored in
  	%       \l__dfg_person_project_clist.
  	%-------------------------------------------------------------
  	\clist_put_right:Nn \l__dfg_person_project_clist
  	{%
  		% Reset the per‑project temporaries before we start filling them.
  		\clist_clear:N \l__dfg_person_clist
  		\clist_clear:N \l__dfg_person_id_clist

		% The coloured project number (e.g. “\color{blue}{12}”)
		\__dfg_get_project_compact:nn {##1} {#3}

		% Reference-only projects and the current project remain compact. For
		% other projects, the customization setting determines whether PI names
		% are always shown or only on the first reference in this section.
    \__dfg_project_pi_if_show_people:nT {##1}
    {
		%---------------------------------------------------------
		%   b)  Retrieve the *raw* CSV string that contains all
  		%       person IDs attached to this project.
  		%---------------------------------------------------------
  		\DTLgetvalueforkey
  		{\l__dfg_person_id_clist}      % ← will receive something like “per1,per3”
  		{ref-person-id}              % field name in the “project” table
  		{project}{id}{##1}           % look it up for the current project

  		%---------------------------------------------------------
  		%   c)  Build the *list of PI names* for this project.
  		%       We use the “variable” version of \clist_map which
  		%       gives us a temporary clist variable (\l_tmpa_clist)
  		%       that holds a *single* person ID at each iteration.
  		%---------------------------------------------------------
  		\space(%
  		\clist_map_variable:NNn \l__dfg_person_id_clist \l_tmpa_clist
  		{
  			% \l_tmpa_clist now expands to one person ID.
  			% We format it with \getPI (or \getPI* if the star was given).
  			\clist_put_right:Ne \l__dfg_person_clist
  			{
  				\IfBooleanTF{#1}
  				{\getPI*{\l_tmpa_clist}}
  				{\getPI{\l_tmpa_clist}}
  			}
  		}
  		%---------------------------------------------------------
  		%   d)  Print the formatted PI list, separating consecutive
  		%       names with a thin slash (the macro \addnbthinspace and
  		%       \addthinspace are assumed to be defined elsewhere).
  		%---------------------------------------------------------
		\clist_use:Nn \l__dfg_person_clist {\addnbthinspace/\addthinspace}
		  ) % end of the parentheses that surround the PI list
		}
	}   % end of \clist_put_right:Nn   (one *project block*)
  } % end of outer \clist_map_inline:Nn

  %-----------------------------------------------------------------
  % 2.  Typeset the collected project blocks.
  %     \clist_use:Nnnn joins the items with
  %        “~and~”   for the *last* separator,
  %        “,~”      for the *middle* separators,
  %        “,~and~”  for the *penultimate* separator.
  %-----------------------------------------------------------------
  \__dfg_project_reference_clist_use:N \l__dfg_person_project_clist
  }
}

\NewDocumentCommand{\getProjectPI}{s m}
  {
    \exp_args:NnnV \__dfg_get_project_with_people:nnn
      {#1} {#2} \c_novalue_tl
  }
\NewDocumentCommand{\getPIofProject}{O{lastname} m O{\,/\,}}
{
  % #1: list of keys to retrieve from the PIs info
  % #2: ID of PI
  % #3: delimiter
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  { \dfgFastReference{#2} }
  {

  % #2 is a comma‑separated list of *project* IDs → turn it into a clist.
  \clist_set:Nn \l__dfg_project_id_clist {#2}
  %   These three clists will be filled during the loops.
  \clist_clear:N \l__dfg_person_project_clist   % final result: “project → PI list”
  \clist_clear:N \l__dfg_person_id_clist        % temporary list of PIs for one project
  \clist_clear:N \l__dfg_person_clist           % temporary list of formatted PI names

  \DTLgetvalueforkey
  {\l__dfg_person_id_clist}      % ← will receive something like “per1,per3”
  {ref-person-id}              % field name in the “project” table
  {project}{id}{\clist_use:N \l__dfg_project_id_clist}           % look it
  % up for the current project

  \clist_map_variable:NNn \l__dfg_person_id_clist \l_tmpa_clist
  {
  	\DTLgetvalueforkey{\tmpPIacademicdegree}{academicdegree}{person}{id}{\l_tmpa_clist}%
  	\DTLgetvalueforkey{\tmpPIfirstname}{firstname}{person}{id}{\l_tmpa_clist}%
  	\DTLgetvalueforkey{\tmpPIlastname}{lastname}{person}{id}{\l_tmpa_clist}%
  	% \clist_clear:N \l__dfg_person_clist
  	% % \l_tmpa_clist now expands to one person ID.
  	% We format it with \getPI (or \getPI* if the star was given).
	\clist_put_right:Ne \l__dfg_person_clist
	{
		\clist_if_in:nnT{#1}{academicdegree}
		  {\dfgShowTag{\l_tmpa_clist}{academicdegree}{\tmpPIacademicdegree}[person]\addnbthinspace}
		\clist_if_in:nnT{#1}{firstname}
		  {\dfgShowTag{\l_tmpa_clist}{firstname}{\tmpPIfirstname}[person]\space}
		\clist_if_in:nnT{#1}{lastname}
		  {\dfgShowTag{\l_tmpa_clist}{lastname}{\tmpPIlastname}[person]}
	}
  }   % end of \clist_put_right:Nn   (one *project block*)
  \clist_use:Nn \l__dfg_person_clist {#3}
  }
} % end of \NewDocumentCommand
\clist_new:N \l__dfg_aim_refs_clist
\NewDocumentCommand{\getAim}{O{\l__tmp_current_project_tl} m}
{
  % #1: current project
  % #2: id of aim(s)
  \clist_clear:N \l__dfg_aim_refs_clist
  \clist_map_inline:nn { #2 }
  { \clist_put_right:Nn \l__dfg_aim_refs_clist { #1-aim-##1 } }
  \exp_args:NV \cref \l__dfg_aim_refs_clist
}
\tl_new:N \l__tmp_current_project_tl
\clist_new:N \l__dfg_wp_refs_clist
\NewDocumentCommand{\getWP}{O{\l__tmp_current_project_tl} m}
{
  % #1: current project
  % #2: id of workpackage(s)
  \clist_clear:N \l__dfg_wp_refs_clist
  \clist_map_inline:nn { #2 }
  { \clist_put_right:Nn \l__dfg_wp_refs_clist { #1-wp-##1 } }
  \exp_args:NV \cref \l__dfg_wp_refs_clist
}
\tl_new:N \l__dfg_fast_workpackage_name_tl
\keys_define:nn { dfg / fast-workpackage }
{
  name .tl_set:N = \l__dfg_fast_workpackage_name_tl,
  unknown .code:n = { }
}

\cs_new_protected:Npn \__dfg_start_subworkpackage_body:
{
  \peek_meaning_remove_ignore_spaces:NTF \par
    { \__dfg_start_subworkpackage_body: }
    { \ignorespaces }
}

\NewDocumentCommand{\addWP}{ m m }{
  % #1: workpackage-id
  % #2: key-set
  \bool_if:NTF \l__dfg_class_fastcompile_project_bool
  {
    \tl_clear:N \l__dfg_fast_workpackage_name_tl
    \keys_set:nn { dfg / fast-workpackage } {#2}
  }
  {
    \addEntry[gantt]{gantt-\l__tmp_current_project_tl}{id=#1,#2}
  }
  \str_if_eq:eeTF { \@enumctr } { workpackagesi }
  {
    \bool_if:NTF \l__dfg_class_fastcompile_project_bool
    {
      \item \textbf{
        \tl_if_blank:VTF \l__dfg_fast_workpackage_name_tl
        { WP~#1 }
        { \tl_use:N \l__dfg_fast_workpackage_name_tl }
      }%
    }
    {
      \item \textbf{\getEntry[gantt-\l__tmp_current_project_tl]{#1}{name}}%
    }
  }
  { \item }
  \label{\l__tmp_current_project_tl-wp-#1}%
  \str_if_eq:eeF { \@enumctr } { workpackagesi }
    { \__dfg_start_subworkpackage_body: }
}
\dim_new:N  \l__dfg_collaboration_plot_x_dim
\dim_new:N  \l__dfg_collaboration_plot_y_dim
\dim_new:N  \l__dfg_collaboration_plot_x_step_dim
\dim_new:N  \l__dfg_collaboration_plot_box_width_dim
\dim_new:N  \l__dfg_collaboration_plot_box_gap_dim
\dim_new:N  \l__dfg_collaboration_plot_area_label_width_dim
\dim_new:N  \l__dfg_collaboration_plot_content_start_dim
\dim_new:N  \l__dfg_collaboration_plot_width_dim
\dim_new:N  \l__dfg_collaboration_plot_arc_height_dim
\box_new:N  \l__dfg_collaboration_plot_area_label_box
\seq_new:N  \l__dfg_collaboration_plot_nodes_seq
\seq_new:N  \l__dfg_collaboration_plot_areas_seq
\seq_new:N  \l__dfg_collaboration_plot_area_palette_seq
\seq_new:N  \l__dfg_collaboration_plot_edges_seq
\prop_new:N \l__dfg_collaboration_plot_all_status_prop
\prop_new:N \l__dfg_collaboration_plot_status_prop
\prop_new:N \l__dfg_collaboration_plot_lists_prop
\prop_new:N \l__dfg_collaboration_plot_edges_prop
\prop_new:N \l__dfg_collaboration_plot_visible_prop
\prop_new:N \l__dfg_collaboration_plot_area_prop
\prop_new:N \l__dfg_collaboration_plot_area_nodes_prop
\prop_new:N \l__dfg_collaboration_plot_area_color_prop
\prop_new:N \l__dfg_collaboration_plot_area_color_override_prop
\tl_new:N   \l__dfg_collaboration_plot_focus_tl
\tl_new:N   \l__dfg_collaboration_plot_layout_tl
\tl_new:N   \l__dfg_collaboration_plot_id_tl
\tl_new:N   \l__dfg_collaboration_plot_status_tl
\tl_new:N   \l__dfg_collaboration_plot_consider_tl
\tl_new:N   \l__dfg_collaboration_plot_reference_only_tl
\tl_new:N   \l__dfg_collaboration_plot_collaborations_tl
\tl_new:N   \l__dfg_collaboration_plot_area_tl
\tl_new:N   \l__dfg_collaboration_plot_source_tl
\tl_new:N   \l__dfg_collaboration_plot_target_tl
\tl_new:N   \l__dfg_collaboration_plot_edge_tl
\tl_new:N   \l__dfg_collaboration_plot_edge_left_tl
\tl_new:N   \l__dfg_collaboration_plot_edge_right_tl
\tl_new:N   \l__dfg_collaboration_plot_label_tl
\tl_new:N   \l__dfg_collaboration_plot_color_tl
\tl_new:N   \l__dfg_collaboration_plot_caption_tl
\int_new:N  \l__dfg_collaboration_plot_group_index_int
\int_new:N  \l__dfg_collaboration_plot_row_index_int
\int_new:N  \l__dfg_collaboration_plot_node_count_int
\int_new:N  \l__dfg_collaboration_plot_area_index_int

\cs_new_protected:Npn \__dfg_collaboration_plot_merge_area_colors:n #1
{
  \prop_set_from_keyval:Nn \l_tmpa_prop {#1}
  \prop_map_inline:Nn \l_tmpa_prop
    { \prop_put:Nnn \l__dfg_collaboration_plot_area_color_override_prop
        {##1} {##2} }
}

\keys_define:nn { dfg / project-collaboration-plot }
{
  layout .choice:,
  layout / heatmap .code:n =
    { \tl_set:Nn \l__dfg_collaboration_plot_layout_tl { heatmap } },
  layout / arc .code:n =
    { \tl_set:Nn \l__dfg_collaboration_plot_layout_tl { arc } },
  layout / arc-diagram .meta:n = { layout = arc },
  heatmap .meta:n = { layout = heatmap },
  arc .meta:n = { layout = arc },
  arc-diagram .meta:n = { layout = arc },
  area-colors .code:n =
    { \__dfg_collaboration_plot_merge_area_colors:n {#1} },
  area-colours .meta:n = { area-colors = {#1} },
  area-palette .code:n =
    {
      \clist_if_empty:nF {#1}
        { \seq_set_from_clist:Nn \l__dfg_collaboration_plot_area_palette_seq {#1} }
    },
  caption .tl_set:N = \l__dfg_collaboration_plot_caption_tl,
  unknown .code:n = { \msg_warning:nnn { dfg } { unknown-key } {#1} }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_collect_nodes:
{
  \seq_clear:N  \l__dfg_collaboration_plot_nodes_seq
  \prop_clear:N \l__dfg_collaboration_plot_all_status_prop
  \prop_clear:N \l__dfg_collaboration_plot_status_prop
  \prop_clear:N \l__dfg_collaboration_plot_lists_prop
  \prop_clear:N \l__dfg_collaboration_plot_edges_prop
  \prop_clear:N \l__dfg_collaboration_plot_area_prop
  % DATATOOL requires an iterated key to exist as a database column.  Older
  % proposals do not have project-area yet, so create the optional column and
  % let the ID-prefix fallback below handle its empty values.
  \DTLifhaskey { project } { project-area }
    { }
    { \DTLaddcolumn { project } { project-area } }
  \DTLifhaskey { project } { collaborations }
    { }
    { \DTLaddcolumn { project } { collaborations } }
  \DTLforeach*{project}
  {
    \l__dfg_collaboration_plot_id_tl = id,
    \l__dfg_collaboration_plot_status_tl = project-status,
    \l__dfg_collaboration_plot_consider_tl = consider-for-lists,
    \l__dfg_collaboration_plot_reference_only_tl = reference-only,
    \l__dfg_collaboration_plot_area_tl = project-area,
    \l__dfg_collaboration_plot_collaborations_tl = collaborations
  }
  {
    \prop_put:NVV \l__dfg_collaboration_plot_all_status_prop
      \l__dfg_collaboration_plot_id_tl
      \l__dfg_collaboration_plot_status_tl
    \bool_lazy_all:nT
    {
      { \str_if_eq_p:Vn \l__dfg_collaboration_plot_consider_tl { true } }
      { \str_if_eq_p:Vn \l__dfg_collaboration_plot_reference_only_tl { false } }
      {
        \bool_lazy_or_p:nn
          { \str_if_eq_p:Vn \l__dfg_collaboration_plot_status_tl { C } }
          { \str_if_eq_p:Vn \l__dfg_collaboration_plot_status_tl { N } }
      }
    }
    {
      \DTLifnullorempty{\l__dfg_collaboration_plot_collaborations_tl}
        { \tl_clear:N \l__dfg_collaboration_plot_collaborations_tl }
        { }
      \seq_put_right:NV \l__dfg_collaboration_plot_nodes_seq
        \l__dfg_collaboration_plot_id_tl
      \DTLifnullorempty{\l__dfg_collaboration_plot_area_tl}
        { \tl_set:Nx \l__dfg_collaboration_plot_area_tl
            { \tl_head:V \l__dfg_collaboration_plot_id_tl } }
        { }
      \tl_trim_spaces:N \l__dfg_collaboration_plot_area_tl
      \prop_put:NVV \l__dfg_collaboration_plot_area_prop
        \l__dfg_collaboration_plot_id_tl \l__dfg_collaboration_plot_area_tl
      \prop_put:NVV \l__dfg_collaboration_plot_status_prop
        \l__dfg_collaboration_plot_id_tl
        \l__dfg_collaboration_plot_status_tl
      \prop_put:NVV \l__dfg_collaboration_plot_lists_prop
        \l__dfg_collaboration_plot_id_tl
        \l__dfg_collaboration_plot_collaborations_tl
    }
  }
  \seq_sort:Nn \l__dfg_collaboration_plot_nodes_seq
  {
    \prop_get:NnN \l__dfg_collaboration_plot_area_prop {##1} \l_tmpa_tl
    \prop_get:NnN \l__dfg_collaboration_plot_area_prop {##2} \l_tmpb_tl
    \str_compare:eNeTF
      { \tl_use:N \l_tmpa_tl / ##1 }
      <
      { \tl_use:N \l_tmpb_tl / ##2 }
      { \sort_return_same: }
      { \sort_return_swapped: }
  }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_collect_edge:nn #1#2
{
  \tl_set:Nn \l__dfg_collaboration_plot_source_tl {#1}
  \tl_set:Nn \l__dfg_collaboration_plot_target_tl {#2}
  \tl_trim_spaces:N \l__dfg_collaboration_plot_source_tl
  \tl_trim_spaces:N \l__dfg_collaboration_plot_target_tl
  \tl_if_blank:VF \l__dfg_collaboration_plot_target_tl
  {
    \prop_if_in:NVTF \l__dfg_collaboration_plot_status_prop
      \l__dfg_collaboration_plot_target_tl
    {
      \str_if_eq:VVF
        \l__dfg_collaboration_plot_source_tl
        \l__dfg_collaboration_plot_target_tl
      {
        \str_compare:eNeTF
          { \tl_use:N \l__dfg_collaboration_plot_source_tl }
          <
          { \tl_use:N \l__dfg_collaboration_plot_target_tl }
          {
            \tl_set:Nx \l__dfg_collaboration_plot_edge_tl
              {
                \tl_use:N \l__dfg_collaboration_plot_source_tl
                /\tl_use:N \l__dfg_collaboration_plot_target_tl
              }
          }
          {
            \tl_set:Nx \l__dfg_collaboration_plot_edge_tl
              {
                \tl_use:N \l__dfg_collaboration_plot_target_tl
                /\tl_use:N \l__dfg_collaboration_plot_source_tl
              }
          }
        \prop_put:NVn \l__dfg_collaboration_plot_edges_prop
          \l__dfg_collaboration_plot_edge_tl { 1 }
      }
    }
    {
      \prop_if_in:NVF \l__dfg_collaboration_plot_all_status_prop
        \l__dfg_collaboration_plot_target_tl
      {
        \msg_warning:nnee { dfg } { collaboration-target-not-found }
          { \l__dfg_collaboration_plot_source_tl }
          { \l__dfg_collaboration_plot_target_tl }
      }
    }
  }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_collect_edges:
{
  \seq_clear:N \l__dfg_collaboration_plot_edges_seq
  \prop_map_inline:Nn \l__dfg_collaboration_plot_lists_prop
  {
    \clist_map_inline:nn {##2}
      { \__dfg_collaboration_plot_collect_edge:nn {##1} {####1} }
  }
  \prop_map_inline:Nn \l__dfg_collaboration_plot_edges_prop
    { \seq_put_right:Nn \l__dfg_collaboration_plot_edges_seq {##1} }
  \seq_sort:Nn \l__dfg_collaboration_plot_edges_seq
    {
      \str_compare:eNeTF {##1} < {##2}
        { \sort_return_same: }
        { \sort_return_swapped: }
    }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_unpack_edge:n #1
{
  \seq_set_split:Nnn \l_tmpa_seq {/} {#1}
  \seq_pop_left:NN \l_tmpa_seq \l__dfg_collaboration_plot_edge_left_tl
  \seq_pop_left:NN \l_tmpa_seq \l__dfg_collaboration_plot_edge_right_tl
}

\cs_new_protected:Npn \__dfg_collaboration_plot_prepare:
{
  \prop_clear:N \l__dfg_collaboration_plot_visible_prop
  \seq_clear:N \l__dfg_collaboration_plot_areas_seq
  \prop_clear:N \l__dfg_collaboration_plot_area_nodes_prop
  \prop_clear:N \l__dfg_collaboration_plot_area_color_prop
  \int_zero:N \l__dfg_collaboration_plot_area_index_int
  \prop_put:NVn \l__dfg_collaboration_plot_visible_prop
    \l__dfg_collaboration_plot_focus_tl { 1 }
  \seq_map_inline:Nn \l__dfg_collaboration_plot_edges_seq
  {
    \__dfg_collaboration_plot_unpack_edge:n {##1}
    \bool_lazy_or:nnT
    {
      \str_if_eq_p:VV
        \l__dfg_collaboration_plot_edge_left_tl
        \l__dfg_collaboration_plot_focus_tl
    }
    {
      \str_if_eq_p:VV
        \l__dfg_collaboration_plot_edge_right_tl
        \l__dfg_collaboration_plot_focus_tl
    }
    {
      \prop_put:NVn \l__dfg_collaboration_plot_visible_prop
        \l__dfg_collaboration_plot_edge_left_tl { 1 }
      \prop_put:NVn \l__dfg_collaboration_plot_visible_prop
        \l__dfg_collaboration_plot_edge_right_tl { 1 }
    }
  }
  \seq_map_inline:Nn \l__dfg_collaboration_plot_nodes_seq
  {
    \prop_get:NnN \l__dfg_collaboration_plot_area_prop {##1}
      \l__dfg_collaboration_plot_area_tl
    \prop_if_in:NVF \l__dfg_collaboration_plot_area_nodes_prop
      \l__dfg_collaboration_plot_area_tl
    {
      \seq_put_right:NV \l__dfg_collaboration_plot_areas_seq
        \l__dfg_collaboration_plot_area_tl
      \prop_get:NVNTF \l__dfg_collaboration_plot_area_color_override_prop
        \l__dfg_collaboration_plot_area_tl
        \l__dfg_collaboration_plot_color_tl
      {
        \prop_put:NVV \l__dfg_collaboration_plot_area_color_prop
          \l__dfg_collaboration_plot_area_tl
          \l__dfg_collaboration_plot_color_tl
      }
      {
        \int_incr:N \l__dfg_collaboration_plot_area_index_int
        \int_set:Nn \l_tmpa_int
          {
            1 + \int_mod:nn
              { \l__dfg_collaboration_plot_area_index_int - 1 }
              { \seq_count:N \l__dfg_collaboration_plot_area_palette_seq }
          }
        \prop_put:NVx \l__dfg_collaboration_plot_area_color_prop
          \l__dfg_collaboration_plot_area_tl
          {
            \seq_item:Nn \l__dfg_collaboration_plot_area_palette_seq
              { \l_tmpa_int }
          }
      }
      \prop_put:NVn \l__dfg_collaboration_plot_area_nodes_prop
        \l__dfg_collaboration_plot_area_tl { }
    }
    \prop_get:NVN \l__dfg_collaboration_plot_area_nodes_prop
      \l__dfg_collaboration_plot_area_tl \l_tmpa_tl
    \tl_if_blank:VTF \l_tmpa_tl
      { \tl_set:Nn \l_tmpa_tl {##1} }
      { \tl_put_right:Nn \l_tmpa_tl { , ##1 } }
    \prop_put:NVV \l__dfg_collaboration_plot_area_nodes_prop
      \l__dfg_collaboration_plot_area_tl \l_tmpa_tl
  }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_set_color:n #1
{
  \tl_set:Nx \l__dfg_collaboration_plot_label_tl {#1}
  \prop_get:NnNTF \l__dfg_collaboration_plot_area_prop
    {#1} \l__dfg_collaboration_plot_area_tl
    { \prop_get:NVN \l__dfg_collaboration_plot_area_color_prop
        \l__dfg_collaboration_plot_area_tl
        \l__dfg_collaboration_plot_color_tl }
    { \tl_set:Nn \l__dfg_collaboration_plot_color_tl { grey } }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_heatmap_cell:n #1
{
  \__dfg_collaboration_plot_set_color:n {#1}
  \str_if_eq:VVTF
    \l__dfg_collaboration_plot_focus_tl
    \l__dfg_collaboration_plot_label_tl
  {
    \node[
      anchor=center,
      minimum~width=\dim_use:N \l__dfg_collaboration_plot_box_width_dim,
      minimum~height=5.2mm,
      inner~sep=0pt,
      rounded~corners=1.4pt,
      draw=red!78!black,
      fill=red,
      text=white,
      font=\scriptsize\bfseries
    ] at
      (\dim_use:N \l__dfg_collaboration_plot_x_dim,
       \dim_use:N \l__dfg_collaboration_plot_y_dim)
      { \strut\tl_use:N \l__dfg_collaboration_plot_label_tl };
  }
  {
    \prop_if_in:NVTF \l__dfg_collaboration_plot_visible_prop
      \l__dfg_collaboration_plot_label_tl
    {
      \node[
        anchor=center,
        minimum~width=\dim_use:N \l__dfg_collaboration_plot_box_width_dim,
        minimum~height=5.2mm,
        inner~sep=0pt,
        rounded~corners=1.4pt,
        draw=\tl_use:N \l__dfg_collaboration_plot_color_tl!48,
        fill=\tl_use:N \l__dfg_collaboration_plot_color_tl!14,
        text=\tl_use:N \l__dfg_collaboration_plot_color_tl,
        font=\scriptsize\bfseries
      ] at
        (\dim_use:N \l__dfg_collaboration_plot_x_dim,
         \dim_use:N \l__dfg_collaboration_plot_y_dim)
        { \strut\tl_use:N \l__dfg_collaboration_plot_label_tl };
    }
    {
      \node[
        anchor=center,
        minimum~width=\dim_use:N \l__dfg_collaboration_plot_box_width_dim,
        minimum~height=5.2mm,
        inner~sep=0pt,
        rounded~corners=1.4pt,
        draw=grey!22,
        fill=white,
        text=grey!70!black,
        font=\scriptsize
      ] at
        (\dim_use:N \l__dfg_collaboration_plot_x_dim,
         \dim_use:N \l__dfg_collaboration_plot_y_dim)
        { \strut\tl_use:N \l__dfg_collaboration_plot_label_tl };
    }
  }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_heatmap_row:nnn #1#2#3
{
  \clist_if_empty:nF {#1}
  {
    \int_incr:N \l__dfg_collaboration_plot_row_index_int
    \dim_set:Nn \l__dfg_collaboration_plot_y_dim
    {
      -7mm *
      \int_eval:n { \l__dfg_collaboration_plot_row_index_int - 1 }
    }
    \node[
      anchor=east,
      inner~sep=0pt,
      font=\scriptsize\bfseries
    ] at
      (\dim_use:N \l__dfg_collaboration_plot_area_label_width_dim,
       \dim_use:N \l__dfg_collaboration_plot_y_dim)
      {Project~area~#3};
    \draw[draw=#2,line~width=.75pt,line~cap=round]
      (\dim_eval:n
         { \l__dfg_collaboration_plot_area_label_width_dim + .8mm },
       \dim_use:N \l__dfg_collaboration_plot_y_dim)
      --
      (\dim_eval:n
         { \l__dfg_collaboration_plot_area_label_width_dim + 2.8mm },
       \dim_use:N \l__dfg_collaboration_plot_y_dim);
    \int_zero:N \l__dfg_collaboration_plot_group_index_int
    \clist_map_inline:nn {#1}
    {
      \int_incr:N \l__dfg_collaboration_plot_group_index_int
      \dim_set:Nn \l__dfg_collaboration_plot_x_dim
      {
        \l__dfg_collaboration_plot_content_start_dim
        + \l__dfg_collaboration_plot_box_width_dim / 2
        + \l__dfg_collaboration_plot_x_step_dim *
        \int_eval:n { \l__dfg_collaboration_plot_group_index_int - 1 }
      }
      \__dfg_collaboration_plot_heatmap_cell:n {##1}
    }
  }
}
\cs_generate_variant:Nn \__dfg_collaboration_plot_heatmap_row:nnn { V V n }

\cs_new_protected:Npn \__dfg_collaboration_plot_heatmap_picture:
{
    % Use the widest project area as the shared column grid.  Each column gets
    % a dynamic box width, and the final cell reaches the right edge of the
    % text block instead of leaving a large unused strip before the caption.
    \dim_zero:N \l__dfg_collaboration_plot_area_label_width_dim
    \seq_map_inline:Nn \l__dfg_collaboration_plot_areas_seq
      {
        \hbox_set:Nn \l__dfg_collaboration_plot_area_label_box
          { \scriptsize\bfseries Project~area~##1 }
        \dim_compare:nNnT
          { \box_wd:N \l__dfg_collaboration_plot_area_label_box }
          >
          { \l__dfg_collaboration_plot_area_label_width_dim }
          {
            \dim_set:Nn \l__dfg_collaboration_plot_area_label_width_dim
              { \box_wd:N \l__dfg_collaboration_plot_area_label_box }
          }
      }
    \dim_set:Nn \l__dfg_collaboration_plot_content_start_dim
      { \l__dfg_collaboration_plot_area_label_width_dim + 4mm }
  \begin{tikzpicture}
    \int_zero:N \l__dfg_collaboration_plot_node_count_int
    \seq_map_inline:Nn \l__dfg_collaboration_plot_areas_seq
      {
        \prop_get:NnN \l__dfg_collaboration_plot_area_nodes_prop {##1}
          \l_tmpa_tl
        \clist_set:NV \l_tmpa_clist \l_tmpa_tl
        \int_set:Nn \l_tmpa_int { \clist_count:N \l_tmpa_clist }
        \int_set:Nn \l__dfg_collaboration_plot_node_count_int
          { \int_max:nn { \l__dfg_collaboration_plot_node_count_int }
            { \l_tmpa_int } }
      }
    \dim_set:Nn \l__dfg_collaboration_plot_box_gap_dim { 1mm }
    \int_compare:nNnTF
      { \l__dfg_collaboration_plot_node_count_int } > { 0 }
      {
        \dim_set:Nn \l__dfg_collaboration_plot_box_width_dim
        {
          ( \l__dfg_collaboration_plot_width_dim
            - \l__dfg_collaboration_plot_content_start_dim
            - \l__dfg_collaboration_plot_box_gap_dim *
              \int_eval:n
                { \l__dfg_collaboration_plot_node_count_int - 1 }
          ) / \l__dfg_collaboration_plot_node_count_int
        }
        \dim_set:Nn \l__dfg_collaboration_plot_x_step_dim
        {
          \l__dfg_collaboration_plot_box_width_dim
          + \l__dfg_collaboration_plot_box_gap_dim
        }
      }
      {
        \dim_zero:N \l__dfg_collaboration_plot_box_width_dim
        \dim_zero:N \l__dfg_collaboration_plot_x_step_dim
      }
    \int_zero:N \l__dfg_collaboration_plot_row_index_int
    \seq_map_inline:Nn \l__dfg_collaboration_plot_areas_seq
      {
        \prop_get:NnN \l__dfg_collaboration_plot_area_nodes_prop {##1}
          \l_tmpa_tl
        \prop_get:NnN \l__dfg_collaboration_plot_area_color_prop {##1}
          \l__dfg_collaboration_plot_color_tl
        \__dfg_collaboration_plot_heatmap_row:VVn
          \l_tmpa_tl \l__dfg_collaboration_plot_color_tl {##1}
      }
  \end{tikzpicture}
}

\cs_new_protected:Npn \__dfg_collaboration_plot_arc_place_nodes:
{
  \int_set:Nn \l__dfg_collaboration_plot_node_count_int
    { \seq_count:N \l__dfg_collaboration_plot_nodes_seq }
  \int_compare:nNnTF
    { \l__dfg_collaboration_plot_node_count_int } > { 1 }
    {
      \dim_set:Nn \l__dfg_collaboration_plot_x_step_dim
      {
        ( \linewidth - 16mm ) /
        \int_eval:n { \l__dfg_collaboration_plot_node_count_int - 1 }
      }
    }
    { \dim_zero:N \l__dfg_collaboration_plot_x_step_dim }
  \int_zero:N \l__dfg_collaboration_plot_group_index_int
  \seq_map_inline:Nn \l__dfg_collaboration_plot_nodes_seq
  {
    \dim_set:Nn \l__dfg_collaboration_plot_x_dim
    {
      8mm + \l__dfg_collaboration_plot_x_step_dim
      * \l__dfg_collaboration_plot_group_index_int
    }
    \coordinate (dfg-collaboration-arc-##1) at
      (\dim_use:N \l__dfg_collaboration_plot_x_dim,0);
    \int_incr:N \l__dfg_collaboration_plot_group_index_int
  }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_draw_focus_arc:n #1
{
  \__dfg_collaboration_plot_unpack_edge:n {#1}
  \tl_clear:N \l__dfg_collaboration_plot_target_tl
  \str_if_eq:VVTF
    \l__dfg_collaboration_plot_edge_left_tl
    \l__dfg_collaboration_plot_focus_tl
    {
      \tl_set_eq:NN \l__dfg_collaboration_plot_target_tl
        \l__dfg_collaboration_plot_edge_right_tl
    }
    {
      \str_if_eq:VVT
        \l__dfg_collaboration_plot_edge_right_tl
        \l__dfg_collaboration_plot_focus_tl
      {
        \tl_set_eq:NN \l__dfg_collaboration_plot_target_tl
          \l__dfg_collaboration_plot_edge_left_tl
      }
  }
  \tl_if_blank:VF \l__dfg_collaboration_plot_target_tl
  {
    \__dfg_collaboration_plot_set_color:n
      { \tl_use:N \l__dfg_collaboration_plot_target_tl }
    \draw[
      draw=\tl_use:N \l__dfg_collaboration_plot_color_tl,
      line~width=.75pt,
      opacity=.78,
      line~cap=round
    ]
      (dfg-collaboration-arc-\l__dfg_collaboration_plot_focus_tl)
      .. controls
      ($ (dfg-collaboration-arc-\l__dfg_collaboration_plot_focus_tl)
         + (0,\dim_use:N \l__dfg_collaboration_plot_arc_height_dim) $)
      and
      ($ (dfg-collaboration-arc-\l__dfg_collaboration_plot_target_tl)
         + (0,\dim_use:N \l__dfg_collaboration_plot_arc_height_dim) $)
      ..
      (dfg-collaboration-arc-\l__dfg_collaboration_plot_target_tl);
  }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_arc_node:n #1
{
  \__dfg_collaboration_plot_set_color:n {#1}
  \str_if_eq:VVTF
    \l__dfg_collaboration_plot_focus_tl
    \l__dfg_collaboration_plot_label_tl
  {
    \node[
      anchor=center,
      minimum~width=6mm,
      minimum~height=5mm,
      inner~sep=0pt,
      rounded~corners=1pt,
      draw=red!78!black,
      fill=red,
      text=white,
      font=\tiny\bfseries
    ] at (dfg-collaboration-arc-#1) {#1};
  }
  {
    \prop_if_in:NVTF \l__dfg_collaboration_plot_visible_prop
      \l__dfg_collaboration_plot_label_tl
    {
      \node[
        anchor=center,
        minimum~width=6mm,
        minimum~height=5mm,
        inner~sep=0pt,
        rounded~corners=.8pt,
        draw=\tl_use:N \l__dfg_collaboration_plot_color_tl!48,
        fill=\tl_use:N \l__dfg_collaboration_plot_color_tl!14,
        text=\tl_use:N \l__dfg_collaboration_plot_color_tl,
        font=\tiny\bfseries
      ] at (dfg-collaboration-arc-#1) {#1};
    }
    {
      \node[
        anchor=center,
        minimum~width=6mm,
        minimum~height=5mm,
        inner~sep=0pt,
        rounded~corners=.8pt,
        draw=grey!22,
        fill=white,
        text=grey!70!black,
        font=\tiny
      ] at (dfg-collaboration-arc-#1) {#1};
    }
  }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_arc_group:nnn #1#2#3
{
  \clist_if_empty:nF {#1}
  {
    \tl_set:Nx \l_tmpa_tl { \clist_item:nn {#1} { 1 } }
    \tl_set:Nx \l_tmpb_tl { \clist_item:nn {#1} { -1 } }
    \draw[draw=#2,line~width=.75pt,line~cap=round]
      ($ (dfg-collaboration-arc-\l_tmpa_tl) + (-3mm,-3.5mm) $)
      --
      ($ (dfg-collaboration-arc-\l_tmpb_tl) + (3mm,-3.5mm) $)
      node[midway,below=.6mm,font=\scriptsize\bfseries] {#3};
  }
}
\cs_generate_variant:Nn \__dfg_collaboration_plot_arc_group:nnn { V V n }

\cs_new_protected:Npn \__dfg_collaboration_plot_arc_picture:
{
  \begin{tikzpicture}
    \__dfg_collaboration_plot_arc_place_nodes:
    % Equal control-point heights give every symmetric cubic arc the same peak.
    \dim_set:Nn \l__dfg_collaboration_plot_arc_height_dim { 12mm }
    \seq_map_inline:Nn \l__dfg_collaboration_plot_edges_seq
      { \__dfg_collaboration_plot_draw_focus_arc:n {##1} }
    \seq_map_inline:Nn \l__dfg_collaboration_plot_nodes_seq
      { \__dfg_collaboration_plot_arc_node:n {##1} }
    \seq_map_inline:Nn \l__dfg_collaboration_plot_areas_seq
      {
        \prop_get:NnN \l__dfg_collaboration_plot_area_nodes_prop {##1}
          \l_tmpa_tl
        \prop_get:NnN \l__dfg_collaboration_plot_area_color_prop {##1}
          \l__dfg_collaboration_plot_color_tl
        \__dfg_collaboration_plot_arc_group:VVn
          \l_tmpa_tl \l__dfg_collaboration_plot_color_tl {##1}
      }
  \end{tikzpicture}
}

\cs_new_protected:Npn \__dfg_collaboration_plot_picture:
{
  \str_case:VnF \l__dfg_collaboration_plot_layout_tl
  {
    { heatmap } { \__dfg_collaboration_plot_heatmap_picture: }
    { arc }     { \__dfg_collaboration_plot_arc_picture: }
  }
  { \__dfg_collaboration_plot_heatmap_picture: }
}

\cs_new_protected:Npn \__dfg_collaboration_plot_wide_picture:
{
  \makebox[\dim_use:N \l__dfg_collaboration_plot_width_dim][l]
    {\__dfg_collaboration_plot_picture:}
}

\NewDocumentCommand{\ProjectCollaborationPlot}{ O{} m o }
{
  \group_begin:
  % Capture the normal body width before hvfloat's `wide` option temporarily
  % changes layout dimensions while constructing the outer caption.
  \dim_set:Nn \l__dfg_collaboration_plot_width_dim { \textwidth }
  \exp_args:NNV \prop_set_from_keyval:Nn
    \l__dfg_collaboration_plot_area_color_override_prop
    \l__dfg_custom_collaboration_area_colors_tl
  \exp_args:NNV \seq_set_from_clist:Nn
    \l__dfg_collaboration_plot_area_palette_seq
    \l__dfg_custom_collaboration_area_palette_tl
  \tl_clear:N \l__dfg_collaboration_plot_caption_tl
  \keys_set:nn { dfg / project-collaboration-plot }
  {
    layout = heatmap,
    #1
  }
  \IfNoValueF{#3}
    { \tl_set:Nn \l__dfg_collaboration_plot_caption_tl {#3} }
  \tl_set:Nn \l__dfg_collaboration_plot_focus_tl {#2}
  \tl_trim_spaces:N \l__dfg_collaboration_plot_focus_tl
  \DTLifdbexists{project}
  {
    \__dfg_collaboration_plot_collect_nodes:
    \prop_if_in:NVTF \l__dfg_collaboration_plot_status_prop
      \l__dfg_collaboration_plot_focus_tl
    {
      \__dfg_collaboration_plot_collect_edges:
      \__dfg_collaboration_plot_prepare:
      \tl_if_blank:VTF \l__dfg_collaboration_plot_caption_tl
      {
        \hvFloat[
          capFormat={labelsep=newline},
          wide,
          floatPos=h,
          capPos=outer,
          capVPos=bottom,
          capWidth=n,
          floatCapSep=\marginparsep
        ]
        {figure}
        {\__dfg_collaboration_plot_wide_picture:}
        {Collaborations~of~\getProject{#2}.}
        {fig:project-collaboration-#2-
          \tl_use:N \l__dfg_collaboration_plot_layout_tl}%
      }
      {
        \hvFloat[
          floatPos=h,
          capPos=bottom
        ]
        {figure}
        {\__dfg_collaboration_plot_picture:}
        {Collaborations~of~\getProject{#2}.~
          \tl_use:N \l__dfg_collaboration_plot_caption_tl}
        {fig:project-collaboration-#2-
          \tl_use:N \l__dfg_collaboration_plot_layout_tl}%
      }
    }
    {
      \msg_warning:nne { dfg } { collaboration-focus-not-found }
        { \l__dfg_collaboration_plot_focus_tl }
      \textcolor{error}
        {Project~collaboration~plot:~unknown~project~'#2'.}
    }
  }
  { \msg_warning:nnn { dfg } { database-not-found } { project } }
  \group_end:
}

\tl_new:N \l__dfg_gantt_plot_caption_tl
\keys_define:nn { dfg / gantt-plot }
{
  caption .tl_set:N = \l__dfg_gantt_plot_caption_tl,
  unknown .code:n = { \msg_warning:nnn { dfg } { unknown-key } {#1} }
}

\NewDocumentCommand{\GanttPlot}{ O{} m o }
{
  \group_begin:
  \tl_clear:N \l__dfg_gantt_plot_caption_tl
  \keys_set:nn { dfg / gantt-plot } {#1}
  \IfNoValueF{#3}
    { \tl_set:Nn \l__dfg_gantt_plot_caption_tl {#3} }
  \DTLifdbexists{gantt-#2}
  {
    \tl_if_blank:VTF \l__dfg_gantt_plot_caption_tl
    {
      \hvFloat[
        capFormat={labelsep=newline},
        wide,
        floatPos=h,
        capPos=outer,
        capVPos=bottom,
        capWidth=.116,
        floatCapSep=\marginparsep
      ]
      {figure}
      {\dfgGanttEnvironment{#2}}
      {Gantt~chart~of~\getProject{#2}.}
      {fig:gantt#2}%
    }
    {
      \hvFloat[
        floatPos=h,
        capPos=bottom
      ]
      {figure}
      {\dfgGanttEnvironment{#2}}
      {Gantt~chart~of~\getProject{#2}.~
        \tl_use:N \l__dfg_gantt_plot_caption_tl}
      {fig:gantt-#2}%
    }
  }
  {
    Database~ \texttt{gantt-#2}~ missing.
    \msg_warning:nne { dfg } { database-not-found }{ gantt-#2 }
  }
  \group_end:
}

\NewDocumentCommand{\printGantt}{ m o }
{
  \IfNoValueTF{#2}
    { \printPlot{{Gantt}{#1}} }
    { \printPlot{{Gantt}{#1}[#2]} }
}
\NewDocumentCommand{\dfgGanttContent}{m}{%
  \DTLforeach*{gantt-#1}{%
  	\ganttWP=id,%
  	\ganttName=name,%
  	\ganttDescription=description,%
  	\ganttPeriodStart=periodStart,%
  	\ganttPeriodEnd=periodEnd,%
  	\ganttPatternbar=style%
  }{\hypersetup{linkcolor=black}%
  	% If we want to omit a bar in the plot,
  	% you need to set periodStart and periodEnd
  	% the same value.
  	\ifdefstrequal{\ganttPeriodStart}{\ganttPeriodEnd}{}{%
  		% if the values are different then there will be a bar.
		\def\ganttBarPlot{
			\sffamily
			\dfgShowTag{\ganttWP}{id}{\getWP{\ganttWP}}[gantt-#1]
			\ifdefempty{\ganttDescription}{}
			  {:~\dfgShowTag{\ganttWP}{description}{\ganttDescription}[gantt-#1]}}

  		\str_case:VnF {\ganttPatternbar}
  		{%
  			{crosshatch}{\ganttbar[bar/.append~ style = {%
  							pattern       = {crosshatch},
  							pattern~ color = {color@gantt@crosshatch},
  							draw           = {color@gantt@frame}
  						}]{\ganttBarPlot}{\ganttPeriodStart}{\ganttPeriodEnd}}%

  			{striped}{\ganttbar[bar/.append~ style = {%
  							fill          = {color@gantt@stripe-one},
  							% the pattern needs to be applied after the filled color
  							postaction    ={pattern={Lines[%
  													angle=45,
  													distance={12pt},
  													line~ width=6pt]},
  									pattern~ color= color@gantt@stripe-two},
  							postaction    = {draw, semithick},
  							draw          = {color@gantt@frame}
  						}]{\ganttBarPlot}{\ganttPeriodStart}{\ganttPeriodEnd}}%

  			{alternative}{\ganttbar[bar/.append~ style = {%
  							fill          = {color@gantt@alternative},
  							draw          = {color@gantt@frame}
  						}]{\ganttBarPlot}{\ganttPeriodStart}{\ganttPeriodEnd}}%

  			{important}{\ganttbar[bar/.append~ style = {%
  							fill          = {color@gantt@important},
  							draw          = {color@gantt@frame}
  						}]{\ganttBarPlot}{\ganttPeriodStart}{\ganttPeriodEnd}}%
  		}
  		{ % default
  			{}{\ganttbar[bar/.append~ style = {%
  							fill          = {color@gantt@default},
  							draw          = {color@gantt@frame}
  						}]{\ganttBarPlot}{\ganttPeriodStart}{\ganttPeriodEnd}}%
  		}
  		\DTLiflastrow{\ganttnewline}{\\}}%
  	\hypersetup{linkcolor=blue}}
}
\newcommand{\dfgGanttShowQs}[2]{%
  \bool_if:NTF \l__dfg_class_showtags_bool
  {\leavevmode\vbox to\z@{{%
  			\vss\color{color@tags@line}
  			\rlap{\vrule\raise .9em%
  				\hbox{{%
  						\fontsize{4}{0}\selectfont%
  						\ttfamily\,#1:#2}}}}}
  	\textcolor{color@tags@font}{#1}}
  {#1}
}
\NewDocumentCommand{\dfgGanttEnvironment}{m}{
  % #1 : Project ID
  \resizebox{\linewidth}{!}{
  	\begin{ganttchart}[
  			title~ height=.8,
  			title/.append~ style={draw=none, fill=tableHeadingsBG},
  			dfgTitleTopRule/.style={
  				title/.append~ style={
  					path~ picture={
  						\draw[draw=tableOuterLines,line~ width=2pt]
  							(path~ picture~ bounding~ box.north~ west) --
  							(path~ picture~ bounding~ box.north~ east);
  					}}},
  			dfgTitleBottomRule/.style={
  				title/.append~ style={
  					path~ picture={
  						\draw[draw=tableOuterLines,line~ width=2pt]
  							(path~ picture~ bounding~ box.south~ west) --
  							(path~ picture~ bounding~ box.south~ east);
  					}}},
  			dfgTitleBottomRightRule/.style={
  				title/.append~ style={
  					path~ picture={
  						\draw[draw=tableOuterLines,line~ width=2pt]
  							(path~ picture~ bounding~ box.south~ west) --
  							(path~ picture~ bounding~ box.south~ east);
  						\draw[draw=tableOuterLines,line~ width=2pt]
  							(path~ picture~ bounding~ box.north~ east) --
  							(path~ picture~ bounding~ box.south~ east);
  					}}},
  			title~ label~ font={\bfseries\footnotesize\color{tableHeadingsFont}},
  			canvas/.style={
  					shape=rectangle,
  					draw=none,
  					fill=white,
  					path~ picture={
  						\draw[draw=tableOuterLines,line~ width=2pt]
  							(path~ picture~ bounding~ box.north~ west) --
  							(path~ picture~ bounding~ box.north~ east);
  						\draw[draw=tableOuterLines,line~ width=2pt]
  							(path~ picture~ bounding~ box.south~ west) --
  							(path~ picture~ bounding~ box.south~ east);
  					}},
  			x~ unit = \textwidth/16,
  			y~ unit~ title=0.5cm,
  			y~ unit~ chart=.5cm,
  			vgrid={*1{tableLines,dashed}},
  			%hgrid,
  			%   group label font=\bfseries\footnotesize,
  			%   milestone label font=\scriptsize,
  			bar~ inline~ label~ node/.style={anchor=west},
  			bar~ inline~ label~ anchor=west,
  			bar~ label~ font={\scriptsize\color{tableHeadingsFont}},
  			%  title label font=\bfseries\scriptsize\color{white},
  			% bar/.style={rounded~ corners=1mm},
  			bar~ height=1,
  			inline
  			% NOTE: {1}{16} = 16 quarters = 5 years (2 + 4 + 4 + 4 + 2 quarters).
  			% This is hardcoded. To adapt to a different funding period length,
  			% update the ganttchart range, the \gantttitle blocks below,
  			% and the fundingYears-related fields in the meta keyset.
  		]{1}{16}
		\gantttitle[dfgTitleTopRule]{\dfgFundingYear{1}}{2}
		\gantttitle[dfgTitleTopRule]{\dfgFundingYear{2}}{4}
		\gantttitle[dfgTitleTopRule]{\dfgFundingYear{3}}{4}
		\gantttitle[dfgTitleTopRule]{\dfgFundingYear{4}}{4}
		\gantttitle[dfgTitleTopRule]{\dfgFundingYear{5}}{2}\\
  		%===================
  		% \gantttitle{\crcTMPganttShowQs{Q1}{1}}{1}
  		% \gantttitle{\crcTMPganttShowQs{Q2}{2}}{1}
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q3}{1}}{1}
  		\gantttitle[dfgTitleBottomRightRule]{\dfgGanttShowQs{Q4}{2}}{1}
  		%===================
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q1}{3}}{1}
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q2}{4}}{1}
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q3}{5}}{1}
  		\gantttitle[dfgTitleBottomRightRule]{\dfgGanttShowQs{Q4}{6}}{1}
  		% ===================
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q1}{7}}{1}
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q2}{8}}{1}
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q3}{9}}{1}
  		\gantttitle[dfgTitleBottomRightRule]{\dfgGanttShowQs{Q4}{10}}{1}
  		% ===================
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q1}{11}}{1}
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q2}{12}}{1}
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q3}{13}}{1}
  		\gantttitle[dfgTitleBottomRightRule]{\dfgGanttShowQs{Q4}{14}}{1}
  		% ===================
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q1}{15}}{1}
  		\gantttitle[dfgTitleBottomRule]{\dfgGanttShowQs{Q2}{16}}{1}
  		%\gantttitle{\dfgGanttShowQs{Q3}{19}}{1}
  		%\gantttitle{\dfgGanttShowQs{Q4}{20}}{1}
  		\\
  		\dfgGanttContent{#1}
  	\end{ganttchart}%
  }
}
\NewDocumentCommand{\dfgTOCprojectPart}{m O{Project~area} m}{
  % #1: project       (kann leer sein)
  % #2: pre-freetext  (default: "Project area")
  % #3: free text     (kann leer sein)
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
    \addtocentrydefault{chapter}
      { \tl_if_blank:nF {#1} { \texorpdfstring{\getProjectColor{#1}#1}{} } }
    {
      #2\c_space_tl
      \tl_if_blank:nF {#1} { \texorpdfstring{\getProjectColor{#1}#1}{#1} ~--~ #3 }
    }
  }
}
\bool_new:N \l__dfg_cvoptional_bool
\bool_if:NT  \l__dfg_class_cv_bool {
\BeforeStartingTOC[toc]{\begin{multicols}{2}}%
\AfterStartingTOC[toc]{\end{multicols}}

\RedeclareSectionCommands[
  tocraggedpagenumber,
  toclinefill=\tocpageseparator,
  tocindent=0em,
  tocnumwidth=0em,
  tocpagenumberbox=\tocpagenumberbox,%\tocgobble,% <- added
  tocpagenumberformat=\textsf,
]{chapter}
}

\newcommand\dfgReduceSpace{\vspace*{-1.5\baselineskip}}
\NewDocumentCommand{\dfgCVheader}{ m }{%
  % #1: person-id
  \bool_set_false:N \l__dfg_cvoptional_bool

  % Single scan: pull all needed fields at once
  \getEntry*[person]{#1}{
  	\theAcademicDegree = academicdegree,
  	\theURLValue       = url,
  	\theNameValue      = lastname,
  	\theFirstNameValue = firstname,
  	\CurrentPosition   = position,
  	\CurrentPositionText   = positionText
  }%
  \addchap[{
      head={CV
        \texorpdfstring{\dfgShowTag{#1}{academicdegree}{\theAcademicDegree}[person]}
          {\theAcademicDegree}\space
        \texorpdfstring{\dfgShowTag{#1}{firstname}{\theFirstNameValue}[person]}
          {\theFirstNameValue}\space
        \texorpdfstring{\dfgShowTag{#1}{lastname}{\theNameValue}[person]}
          {\theNameValue}},
      tocentry={
        \texorpdfstring{\dfgShowTag{#1}{lastname}{\theNameValue}[person]}
          {\theNameValue},\space
        \texorpdfstring{\dfgShowTag{#1}{firstname}{\theFirstNameValue}[person]}
          {\theFirstNameValue}}}]{%
        {\normalsize\textcolor{color@font@alternative}{Curriculum \space Vitae}\\[.5\baselineskip]
	\dfgShowTag{#1}{academicdegree}{\theAcademicDegree}[person]\\[.25\baselineskip]}
	\bfseries
        \dfgShowTag{#1}{firstname}{\theFirstNameValue}[person]\space
        \dfgShowTag{#1}{lastname}{\theNameValue}[person]
  }%
  %\pdfbookmark{CV~\theNameValue, ~~ \theFirstNameValue}{cv-#1}

  % Printing the QR code only on one page next to the headline.
  \AddToHookNext{shipout/background}{%
    \DTLifnullorempty{\theURLValue}
    {}
    {\put(\pagewidth-\marginparwidth,-.05\paperheight){%
			\dfgShowTag{#1}{url}{\qrcode[link,height=1.5cm]{\theURLValue}}[person]}}%
  }

  \begin{tblr}[
  		theme   =main,
  		long
  	]{
  		colspec={X[t]X[4,t]},
  		% $column{2}={font=\bfseries},
  		columns={halign=l},
  		row{odd}={bg=white},
  		row{even}={bg=white},
        row{1}={font=\footnotesize\bfseries\sffamily,
                bg=tableHeadingsBG,
                fg=tableHeadingsFont}
  	}
  	Personal~ Data                                               &                                           \\
	Title                                                        & \dfgShowTag{#1}{academicdegree}{\theAcademicDegree}[person] \\
	First~ name                                                  & \dfgShowTag{#1}{firstname}{\theFirstNameValue}[person] \\
	Name                                                         & \dfgShowTag{#1}{lastname}{\theNameValue}[person] \\
	Current~ position                                            &
\ifdefempty{\CurrentPositionText}
  {\dfgShowTag{#1}{position}{\dfgCategoryName{\CurrentPosition}}[person]}
  {\dfgShowTag{#1}{positionText}{\CurrentPositionText}[person]}
  	\\
  	{Current~ institution(s)/\\ site(s),~ country} & {\dfgInstitutionList{#1} }                \\
  	ORCiD                                                        & \getORCiD{#1}                             \\
  \end{tblr}
  \dfgReduceSpace
}
\NewDocumentCommand{\dfgCVmandatory}{ m }{%
  % #1: person-id
    \DTLsortdata{cv-#1}
       {
        periodStart ={descending=true},
        periodEnd   ={descending=true},
        position    ={ascending=true}
         }

  \group_begin:
  \def\tblrbody{}

  % Build the institution-name prop on first use (shared with ProjectsTable)
  \__dfg_proj_pi_build:

  % Single scan over person table for the three fields shown above
  \getEntry*[person]{#1}{
  	\theDegreeProgramme = degree-programme,
  	\theDoctorateYear   = doctorateYear,
  	\theDoctorate       = doctorate
  }%

  \DTLforeach*[
  	\DTLiseq{\dfgrefpersonid}{#1}
  	\and
  	\DTLiseq{\dfgtype}{mandatory}
  ]{cv-#1}{%
  	\dfgrefpersonid      = ref-person-id,
  	\dfgtype             = type,
  	\dfgyearstart        = periodStart,
  	\dfgyearend          = periodEnd,
  	\dfgpositionText     = positionText,
  	\dfgposition         = position,
  	\dfgrefinstitutionid = ref-institution-id,
  	\dfgdescription      = description
  }{%
  	% Hash lookup instead of two \DTLgetvalueforkey calls
  	\prop_get:NVNTF \g__dfg_inst_narrow_prop \dfgrefinstitutionid \theInstAffName
  	{}
  	{ \tl_clear:N \theInstAffName }%

  	\protected@edef\tblrbody{\tblrbody
      \ifdefempty{\dfgyearend}
        {since\space\dfgShowTag{#1}{periodStart}{\dfgyearstart}[cv-#1]}
        {\str_if_eq:eeTF { \dfgyearstart } { \dfgyearend }
        { \dfgShowTag{#1}{periodStart}{\dfgyearstart}[cv-#1] }
        { \dfgShowTag{#1}{periodStart}{\dfgyearstart}[cv-#1]--
          \dfgShowTag{#1}{periodEnd}{\dfgyearend}[cv-#1] }}
  		\ifdefempty{\dfgposition}
		{}{:\space\dfgShowTag{#1}{position}{\dfgposition}[cv-#1]}
  		&
		{\dfgShowTag{#1}{positionText}{\dfgpositionText}[cv-#1]
  			\ifdefempty{\theInstAffName}{}{,\space\theInstAffName}%
			\ifdefempty{\dfgdescription}{}
			  {\\\textit{\dfgShowTag{#1}{description}{\dfgdescription}[cv-#1]}}%
  		}
  		\\
  	}%
  }

  \begin{tblr}[
  		theme  = main,
  		expand = \tblrbody,
  		long
  	]{
  		colspec = {X[.7,t]X[4,t]},
  		columns = {halign=l},
  		row{odd}={bg=white},
  		row{even}={bg=white},
        row{1}={font=\footnotesize\bfseries\sffamily,
                bg=tableHeadingsBG,
                fg=tableHeadingsFont}
  	}
  	\SetCell[c=2]{l}{Qualifications~ and~ Career} &                                      \\
  	\SetRow{tableHeadingsBGalt,font=\footnotesize\bfseries,halign=l}%
  	Stages                      & Periods~ and~ Details                \\
	{Degree\\programme}            & \dfgShowTag{#1}{degree-programme}{\theDegreeProgramme}[person] \\
	Doctorate                   & \dfgShowTag{#1}{doctorateYear}{\theDoctorateYear}[person]\space
                                    \dfgShowTag{#1}{doctorate}{\theDoctorate}[person] \\
  	\SetHline{-}{tableOuterLines,.5pt}%
  	% \SetRow{tableHeadingsBGalt}%
  	% \SetCell{font=\footnotesize\bfseries,halign=l}%
  	% Stages~ of~ academic/professional~ career &                                      \\
  	\tblrbody
  \end{tblr}
  \group_end:
  \dfgReduceSpace
}
\NewDocumentCommand{\dfgCVoptional}{ m m m }{%
  \def\tblrbody{}
  \DTLforeach*[
  	\DTLiseq{\dfgrefpersonid}{#1}
  	\and
  	\DTLiseq{\dfgtype}{#2}
  ]{cv-#1}{%
  	\dfgrefpersonid      = ref-person-id,
  	\dfgtype             = type,
  	\dfgyearstart        = periodStart,
  	\dfgyearend          = periodEnd,
  	\dfgpositionText     = positionText,
  	\dfgposition         = position,
  	\dfgrefinstitutionid = ref-institution-id,
  	\dfgdescription      = description
  }{%
    % datatool represents an absent value in a numeric column by its null
    % sentinel, which expands like zero in this context.  Normalise those
    % sentinels before testing the optional period fields; description-only
    % CV entries must not acquire a spurious ``0'' in the first column.
    \DTLifnullorempty{\dfgyearstart}{\def\dfgyearstart{}}{}
    \DTLifnullorempty{\dfgyearend}{\def\dfgyearend{}}{}
  	\bool_lazy_and:nnTF
  	  { \tl_if_empty_p:V \dfgyearstart }
  	  { \tl_if_empty_p:V \dfgyearend }
  	{%
		\protected@edef\tblrbody{\tblrbody
        \SetCell[c=2]{l,wd=\dimexpr\textwidth-12pt\relax}
          {\dfgShowTag{#1}{description}{\dfgdescription}[cv-#1]} & \\
  		}%
  	}
  	{%
  		\protected@edef\tblrbody{\tblrbody
        \ifdefempty{\dfgyearstart}
          {
            \ifdefempty{\dfgyearend}
              {}
              {\dfgShowTag{#1}{periodEnd}{\dfgyearend}[cv-#1]\space}
          }
          {
            \ifdefempty{\dfgyearend}
              {since\space\dfgShowTag{#1}{periodStart}{\dfgyearstart}[cv-#1]\space}
              {
                \str_if_eq:eeTF { \dfgyearstart } { \dfgyearend }
                  { \dfgShowTag{#1}{periodStart}{\dfgyearstart}[cv-#1] }
                  { \dfgShowTag{#1}{periodStart}{\dfgyearstart}[cv-#1]--
                    \dfgShowTag{#1}{periodEnd}{\dfgyearend}[cv-#1] }
                \space
              }
          }
        &
        \dfgShowTag{#1}{description}{\dfgdescription}[cv-#1]
        \\
  		}%
  	}%
  }%

  \ifdefempty{\tblrbody}{}{%
  	\begin{tblr}[
  			theme  = main,
  			expand = \tblrbody,
  			long
  	  		]{
             %rowsep=3pt,
  			width = \textwidth,
  			colspec = {X[0.7,t]X[4,t]},
  			columns = {halign=l},
  			row{odd}={bg=white},
  			row{even}={bg=white},
            row{1}={font=\footnotesize\bfseries\sffamily,
                    bg=tableHeadingsBG,
                    fg=tableHeadingsFont}
  		}
  		\SetCell[c=2]{l}{#3} & \\*
      \tblrbody
  	\end{tblr}
  	\bool_set_true:N \l__dfg_cvoptional_bool
    \dfgReduceSpace
  }%
}
\newlist{DFGlist}{enumerate}{1}
\setlist[DFGlist]{leftmargin=*}
\setlist[DFGlist,1]{
  % font=\bfseries,
  % first=\bfseries,
  % after=\normalfont,
  % itemsep=.5\baselineskip,
  % wide,
  label={\bfseries\arabic*.},
  nosep
}
\defbibenvironment{DFGlist}
{\begin{DFGlist}\RaggedRight}
{\end{DFGlist}}
{\item}
\defbibheading{categoryA}{%
  \par
  \begin{tblr}[ theme=main, long ]{
  		rowhead = 0,
  		colspec = {X[1,t]},
  		row{odd}={bg=white},
  		row{even}={bg=white},
  		%hline{1,2,Z} = {0pt},
            row{1}={font=\footnotesize\bfseries\sffamily,
                    bg=tableHeadingsBG,
                    halign=l,
                    fg=tableHeadingsFont},
  		row{2} = {%bg=tableHeadingsBGalt, fg=tableHeadingsFont,
  			         font=\footnotesize\sffamily, halign=l, valign=t, guard},
  	}Scientific~ results \\*
  	Category~ A~ --~ Articles~ in~ peer-reviewed~ journals,~
  	contributions~ to~ peer-reviewed~ conferences~ or~ to~
  	anthology~ volumes,~ and~ book~ publications              \\
  \end{tblr}
  \vspace*{-1.5\baselineskip}
}

\defbibheading{categoryB}{%
  \par
  \begin{tblr}[ theme=main, long ]{
  		rowhead = 0,
  		colspec = {X[1,t]},
  		row{odd}={bg=white},
  		row{even}={bg=white},
  		%hline{1,2,Z} = {0pt},
            row{1}={font=\footnotesize\bfseries\sffamily,
                    bg=tableHeadingsBG,
                    halign=l,
                    fg=tableHeadingsFont},
  		row{2} = {%bg=tableHeadingsBGalt, fg=tableHeadingsFont,
  			         font=\footnotesize\sffamily, halign=l, valign=t, guard},
  	}Scientific~ results \\*
  	Category~ B~ --~ Any~ other~ form~ of~ published~ results \\
  \end{tblr}
  \vspace*{-1.5\baselineskip}
}

\NewDocumentCommand{\dfgCVpublications}{ m }{%
  % #1: person-id
  \bool_if:NTF \l__dfg_class_skipTENpublications_bool
  {%
  	\par
  	\group_begin: \ttfamily
  	Publication~ section~ for~ \getFullName{#1}~ omitted~
  	for~ faster~ compilation.\\
  	To~ enable~ the~ 10~ most~ important~ publications,~
  	go~ to~ the~ documentclass~ options\\ and~ state~
  	'\textbf{skip10pub=false}'.
  	\group_end:
  }{%
  	\tl_gset:Nn \g__dfg_current_pi_tl {#1}
  	\newrefcontext[sorting=ydnt]
  	\nocite{*}%
  	\datatool_if_has_key:nnT { person } { name-alias }
  	{
  		\DTLgetvalueforkey { \theAliases } { name-alias } { person } { id } { #1 }
  		\DTLifnullorempty { \theAliases }
  		{ }
  		{ \exp_args:No \addboldnames { \theAliases } }
  	}

  	\renewcommand*{\bibfont}{\footnotesize}%

  	\printbibliography[
  		env          = DFGlist,
  		resetnumbers,
  		keyword      = {#1-A},
  		heading      = categoryA
  	]
  	\printbibliography[
  		env          = DFGlist,
  		resetnumbers,
  		keyword      = {#1-B},
  		heading      = categoryB
  	]

  	\endrefcontext
  	\resetboldnames
  	\tl_gclear:N \g__dfg_current_pi_tl
  }%
}

\tl_new:N \g__dfg_current_pi_tl
\DeclareFieldFormat{addendum}{\mkbibitalic{#1}}
\ExplSyntaxOff
\protected\long\def\ifIDequal#1#2{%
  \if\relax\detokenize{#2}\relax
    % #2 is empty: do nothing
  \else
    \begingroup
      \edef\dfg@tempa{#1}%
      \edef\dfg@tempb{\csname g__dfg_current_pi_tl\endcsname}%
      \ifx\dfg@tempa\dfg@tempb
        \endgroup \par\textcolor{color@font@alternative}{#2}%
      \else
        \endgroup
      \fi
  \fi
}
\ExplSyntaxOn
\ExplSyntaxOff
\NewDocumentCommand{\dfgCVdataprivacy}{ m }{%
  \begin{tblr}[%
  		theme   =main,
  		long
  	]{%
  		colspec = {
  				X[-1,t]
  				X[10,t]
  			},
  		rows = {bg=white},
  		row{2-Z}={font=\scriptsize},
        row{1}={font=\footnotesize\bfseries\sffamily,
                    halign=l,
                    bg=tableHeadingsBG,
                    fg=tableHeadingsFont},
  	}
  	\SetCell[c=2]{l}
  	Data protection and consent to the processing of optional data &   \\
  	\SetCell{font=\large}\ding{55}  & I (\getFullName*{#1}) expressly consent
        to the processing of the voluntary
  	(optional) information, including “special categories of personal data” in
  	connection with the DFG’s review and decision-making process regarding my
  	proposal. This also includes forwarding my data to the external reviewers,
  	committee members and, where applicable, foreign partner organisations who
  	are involved in the decision-making process. To the extent that these
  	recipients are located in a third country (outside the European Economic
  	Area), I additionally consent to them being granted access to my data for
  	the above-mentioned purposes, even though a level of data protection
  	comparable to EU law may not be guaranteed. For this reason, compliance with
  	the data protection principles of EU law is not guaranteed in such cases. In
  	this respect, there may be a violation of my fundamental rights and freedoms
  	and resulting damages. This may make it more difficult for me to assert my
    rights under the General Data Protection Regulation (e.g.\ information,
  	rectification, erasure, compensation) and, if necessary, to enforce these
  	rights with the help of authorities or in court.  \\[2pt]
  	& I may \emph{revoke} my consent in whole or in part at any time – with effect for the
  	future, freely and without giving reasons – vis-à-vis the DFG
  	(\href{mailto:postmaster@dfg.de}{postmaster@dfg.de}). The lawfulness of the
  	processing carried out up to that point remains unaffected. Insofar as I
  	transmit \enquote{special categories of personal data} relating to third
  	parties, I confirm that the necessary legitimation under data protection law
    exists (e.g.\ based on consent). \\[2pt]
  	   & I have taken note of the DFG’s Data Protection Notice relating to research
  	funding, which I can access at \url{www.dfg.de/privacy_policy} and I will forward it
  	to such persons whose data the DFG processes as a result of being mentioned in
  	this CV.
  \end{tblr}
}
\ExplSyntaxOn
\NewDocumentCommand{\dfgCV}{ m }{%
  % #1: person-id
	\bool_if:NF \l__dfg_class_fastcompile_project_bool
	{
 	\DTLifdbexists{cv-#1}{
  \StartTimer\dfgCVheader{#1}\StopTimer{#1:dfgCVheader}
  \StartTimer\dfgCVmandatory{#1}\StopTimer{#1:dfgCVmandatory}
  \StartTimer\dfgCVoptional{#1}{supplement}{Supplementary~ Career~ Information}\StopTimer{#1:dfgCVoptional|supplement}
  \StartTimer\dfgCVoptional{#1}{activities}{Activities~  in~  the~  Research~ System}\StopTimer{#1:dfgCVoptional|activities}
  \StartTimer\dfgCVoptional{#1}{supervision}{Supervision~  of~  Researchers~  in~  Early~  Career~  Phases}\StopTimer{#1:dfgCVoptional|supervision}
  \StartTimer \dfgCVpublications{#1}\StopTimer{#1: dfgCVpublications}
  \StartTimer\dfgCVoptional{#1}{distinction}{Academic~  Distinctions}\StopTimer{#1:dfgCVoptional|distinction}
  \StartTimer\dfgCVoptional{#1}{other}{Other~ Information}\StopTimer{#1:dfgCVoptional|other}

  % We check for the bool at this place because we dont have to enable
  % \LaTeX3-Syntax within the command which would require to put |~| at each space.
  \bool_if:NT \l__dfg_cvoptional_bool  {
  	\StartTimer	\dfgCVdataprivacy{#1} \StopTimer{#1:dfgCVdataprivacy}
  }
}
{\msg_warning:nne { dfg } { database-not-found }{ cv-#1 }}
	}
}
\NewDocumentCommand{\dfgCVsection}{ O{person} }{%
  \bool_if:NF \l__dfg_class_fastcompile_project_bool
  {
  \DTLifdbexists{#1}{%
  	\DTLsort*{lastname,firstname}{#1}%
  	\DTLforeach*[%start of conditions
  		\DTLisinlist{\theFundingPeriodNumeral}{\period}% 1st condition
  		\and%
  		\DTLisinlist{PI}{\role}% 2nd condition
  	]{#1}{%
  		\id             =id,
  		\period         =period,
  		\role           =role%
  	}{%
	\exp_args:Ne \dfgCV { \id }
  	}
}{
   Database \texttt{#1} missing.
  	\msg_warning:nne { dfg } { database-not-found }{ #1 }
  }%
  }
}
\NewDocumentCommand{\checkFile}{m}{%
   	\StartTimer
  \file_if_exist:nTF {#1}
  {\ExplSyntaxOff\input{#1}\ExplSyntaxOn}
  {\msg_warning:nne { dfg } { file-not-found }{#1}}%
    \StopTimer{checkFile:#1}
}
\bool_if:NF \l__dfg_class_fastcompile_project_bool
{
  \checkFile{metadata/dfg-metadata.tex}
  \bool_if:NTF \l__dfg_class_cv_bool
  { \checkFile{metadata/dfg-metadata-cv.tex} }
  { \msg_warning:nnn { dfg } { cv-entry-omitted }
    {metadata/dfg-metadata-cv.tex} }
  \bool_if:NF \l__dfg_class_cv_bool
  { \checkFile{metadata/dfg-metadata-tables.tex} }
}
\def\dfgFinalComment{Well~ done~ coding!~ Happy~ TeXing.}
\directlua{
  luatexbase.add_to_callback('wrapup_run',
  function ()
  f=io.open("\jobname.log", "a")
  f:write("\dfgFinalComment")
  f:close()
  end,
  "final message"
  )
}
%% Copyright (C) 2026 Lukas C. Bossert
%%
%% End of file `dfg-crc.cls'.
