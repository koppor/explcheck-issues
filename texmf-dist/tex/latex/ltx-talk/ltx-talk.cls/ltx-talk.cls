%%
%% This is file `ltx-talk.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ltx-talk.dtx  (with options: `class')
%% ltx-talk-color.dtx  (with options: `class')
%% ltx-talk-decode.dtx  (with options: `class')
%% ltx-talk-frame.dtx  (with options: `class')
%% ltx-talk-frame-structure.dtx  (with options: `class')
%% ltx-talk-mode.dtx  (with options: `class')
%% ltx-talk-overlay.dtx  (with options: `class')
%% ltx-talk-required.dtx  (with options: `class')
%% ltx-talk-structure.dtx  (with options: `class')
%% ltx-talk-title.dtx  (with options: `class')
%% 
\ProvidesExplClass {ltx-talk} {2025-10-10} {0.2.3}
  {A class for typesetting presentations}
\prop_gput:Nnn \g_msg_module_name_prop { talk } { ltx-talk }
\prop_gput:Nnn \g_msg_module_type_prop { talk } { Class }
\IfFormatAtLeastF{2025-11-01}
  {
    \msg_new:nnnn { ltx-talk } { kernel-too-old }
      { The~ltx-talk~class~requires~LaTeX~2025-11-01~or~later. }
      {
        You~have~tried~to~use~the~ltx-talk~class~with~a~LaTeX~kernel~release~
        prior~to~2025-11-01;~the~required~functionality~is~missing. \\ \\
        At~present,~you~may~need~to~use~the~development~release~of~LaTeX,~
        invoked~using~"lualatex-dev"~or~"pdflatex-dev".
      }
    \msg_fatal:nn { ltx-talk } { kernel-too-old }
  }
\NeedsDocumentMetadata
\cs_gset_protected:Npn \vbox_set_to_wd:Nnn #1#2#3
  {
    \tex_setbox:D #1 \tex_vbox:D
      {
        \tex_hsize:D \__box_dim_eval:n {#2}
        \color_group_begin: #3 \par \color_group_end:
      }
    \box_dp:N #1 \__box_dim_eval:n {#2}
  }
\cs_gset_protected:Npn \vbox_set_to_wd:Nnw #1#2
  {
    \cs_set_protected:Npn \__box_set_to_wd:
      { \box_wd:N #1 \__box_dim_eval:n {#2} }
    \tex_setbox:D #1 \tex_vbox:D
      \c_group_begin_token
        \tex_hsize:D \__box_dim_eval:n {#2}
        \group_insert_after:N \__box_set_to_wd:
        \color_group_begin:
  }
\cs_gset_protected:Npn \rule:nnn #1#2#3
  {
    \tex_vrule:D
      height \dim_eval:n {#2} \exp_stop_f:
      depth  \dim_eval:n {#3} \exp_stop_f:
      width  \dim_eval:n {#1} \exp_stop_f:
      \scan_stop:
  }
\cs_generate_variant:Nn \clist_set:Nn { cv }
\cs_generate_variant:Nn \hook_gput_code:nnn { nne }
\exp_args_generate:n { nVv }
\cs_generate_variant:Nn \color_select:n { V }
\cs_generate_variant:Nn \dim_compare:nNnTF { v }
\cs_generate_variant:Nn \dim_compare_p:nNn { vNv }
\cs_generate_variant:Nn \dim_max:nn { v }
\cs_generate_variant:Nn \str_replace_all:Nnn { NnV }
\cs_generate_variant:Nn \text_purify:n { v }
\cs_generate_variant:Nn \vbox_to_ht:nn { v }
\cs_new_protected:Npn \__talk_tmp:w { }
\box_new:N \l__talk_tmp_box
\tl_new:N \l__talk_tmp_tl
\keys_define:nn { talk }
  {
    aspect-ratio .str_set:N =
      \l__talk_aspect_ratio_str ,
    font-size .dim_set:N =
      \l__talk_fontsize_dim ,
    frame-title-arg .bool_set:N =
      \l__talk_frame_title_bool ,
    handout .code:n =
      { \str_set:Nn \l__talk_mode_str { handout } } ,
    handout .value_forbidden:n = true ,
    mode .choices:nn =
      { handout , projector }
      { \str_set:NV \l__talk_mode_str \l_keys_choice_tl }
  }
\keys_define:nn { talk }
  {
    aspect-ratio    .usage:n = load ,
    font-size       .usage:n = load ,
    frame-title-arg .usage:n = load ,
    mode            .usage:n = load
  }
\keys_set:nn { talk }
  {
    aspect-ratio    = 16:9      ,
    font-size       = 11pt      ,
    frame-title-arg = false     ,
    mode            = projector
  }
\ProcessKeyOptions [ talk ]
\file_if_exist_input:nF { size \dim_to_decimal:n \l__talk_fontsize_dim .clo }
  {
    \file_input:n { size10.clo }
    \RequirePackage { relsize }
    \hook_gput_code:nne { begindocument } { talk }
      { \exp_not:N \relsize { \fp_eval:n { \l__talk_fontsize_dim / 10pt } } }
  }
\dim_const:Nn \c__talk_paper_height_dim { 100mm }
\use:e
  {
    \cs_set_protected:Npn \exp_not:N \__talk_tmp:w
      #1 \tl_to_str:n { : } #2 \tl_to_str:n { : } #3 \exp_not:N \q_stop
      {
        \dim_const:Nn \exp_not:N \c__talk_paper_width_dim
          {
            \exp_not:N \fp_to_dim:n
              { (#1 / #2) * \exp_not:N \c__talk_paper_height_dim }
          }
      }
    \exp_not:N \__talk_tmp:w \l__talk_aspect_ratio_str
      \tl_to_str:n { : } 100 \exp_not:N \q_stop
  }
\use:e
  {
    \exp_not:N \RequirePackage
      [
        papersize =
          {
            \dim_use:N \c__talk_paper_width_dim  ,
            \dim_use:N \c__talk_paper_height_dim
          } ,
        tmargin    = 10mm ,
        bmargin    =  8mm ,
        lmargin    = 10mm ,
        rmargin    = 10mm ,
        headheight = 10mm ,
        headsep    =  2mm ,
        footskip   =  6mm
      ]
      { geometry }
  }
\raggedright
\RequirePackage { amsmath }
\sys_if_engine_opentype:TF
  {
    \RequirePackage { unicode-math }
    \setsansfont { NewCMSans10-Regular.otf }
    \setmathfont { NewCMSansMath-Regular.otf }
  }
  {
    \RequirePackage { sansmathfonts }
    \RequirePackage [ nomath ] { lmodern }
  }
\cs_set_eq:NN \rmdefault \sfdefault
\cs_new:Npn \thepage { \@arabic \c@page }
\RequirePackage { hyperref }
\hypersetup { hidelinks }
\tagpdfsetup
  {
    role / user-NS = ltx-talk        ,
    role / new-tag = frame / Sect    ,
    role / new-tag = frametitle / H4
  }
\RequirePackage { xcolor }
\NewCommandCopy \stdcolor \color
\NewCommandCopy \stdmathcolor \mathcolor
\NewCommandCopy \stdtextcolor \textcolor
\cs_generate_variant:Nn \color_select:n { e }
\cs_generate_variant:Nn \color_select:nn { ne }
\cs_generate_variant:Nn \color_math:nn { e }
\cs_generate_variant:Nn \color_math:nnn { ne }
\RenewDocumentCommand \color { D <> { all } o m }
  {
    \__talk_if_overlay:nT {#1}
      {
        \IfNoValueTF {#2}
          { \color_select:e {#3} }
          { \color_select:ne {#2} {#3} }
      }
  }
\RenewDocumentCommand \mathcolor { D <> { all } o m +m }
  {
    \__talk_if_overlay:nT {#1}
      {
        \IfNoValueTF {#2}
          { \color_math:en {#3} {#4} }
          { \color_math:nen {#2} {#3} {#4} }
      }
  }
\RenewDocumentCommand \textcolor { D <> { all } o m +m }
  {
    \__talk_if_overlay:nT {#1}
      {
        \mode_leave_vertical:
        \group_begin:
          \IfNoValueTF {#2}
            { \color_select:e {#3} }
            { \color_select:ne {#2} {#3} }
          #4
        \group_end:
      }
  }
\NewDocumentCommand \DeclareColor { m o m }
  {
    \IfNoValueTF {#2}
      { \colorlet {#1} {#3} }
      { \definecolor {#1} {#2} {#3} }
  }
\DeclareColor { alert } [ RGB ] { 200 , 0 , 0 }
\DeclareColor { example } { green!50!black }
\DeclareColor { structure } [ rgb ] { 0.2 , 0.2 , 0.7 }
\bool_new:N \l__talk_decode_overlays_bool
\int_new:N \g__talk_pauses_int
\cs_new_eq:NN \c@pauses \g__talk_pauses_int
\cs_new:Npn \thepauses { \@arabic \g__talk_pauses_int }
\bool_new:N \l__talk_decode_pure_bool
\bool_new:N \l__talk_decode_step_bool
\str_new:N \l__talk_decode_arg_str
\clist_new:N \l__talk_decode_overlays_clist
\str_new:N \l__talk_decode_overlays_str
\str_new:N \l__talk_decode_action_str
\bool_new:N \l__talk_decode_actions_bool
\clist_new:N \l__talk_decode_actions_clist
\str_new:N \l__talk_decode_actions_str
\cs_new_protected:Npn \__talk_decode_parse:n #1
  {
    \str_clear:N \l__talk_decode_action_str
    \bool_lazy_or:nnTF
      { \tl_if_blank_p:n {#1} }
      { \str_if_eq_p:nn {#1} { all } }
      { \bool_set_true:N \l__talk_decode_overlays_bool }
      {
        \str_set:Nn \l__talk_decode_arg_str {#1}
        \bool_set_false:N \l__talk_decode_actions_bool
        \bool_set_false:N \l__talk_decode_overlays_bool
        \bool_set_true:N \l__talk_decode_pure_bool
        \str_clear:N \l__talk_decode_overlays_str
        \str_clear:N \l__talk_decode_actions_str
        \exp_args:No \__talk_decode_parse_aux:n { \l__talk_decode_arg_str }
      }
  }
\cs_new_protected:Npn \__talk_decode_parse_aux:n #1
  { \__talk_decode_parse:w #1 | \q_recursion_tail | \q_recursion_stop }
\cs_new_protected:Npn \__talk_decode_parse:w #1 |
  {
    \quark_if_recursion_tail_stop_do:nn {#1}
      {
        \bool_lazy_and:nnT
          { \str_if_empty_p:N \l__talk_decode_overlays_str }
          { ! \l__talk_decode_pure_bool }
          { \bool_set_true:N \l__talk_decode_overlays_bool }
      }
    \exp_args:Ne \__talk_decode_mode:n
      { \tl_trim_spaces:n {#1} }
    \__talk_decode_parse:w
  }
\clist_const:Ne \c__talk_modes_clist
  {
    \tl_to_str:n { handout }   ,
    \tl_to_str:n { projector }
  }
\cs_new_protected:Npe \__talk_decode_mode:n #1
  {
    \clist_if_in:NnTF \exp_not:N \c__talk_modes_clist {#1}
      {
        \exp_not:N \str_if_eq:VnT
          \exp_not:N \l__talk_mode_str {#1}
          { \bool_set_true:N \exp_not:N \l__talk_decode_overlays_bool }
      }
      {
        \exp_not:N \__talk_decode_mode:w #1 \tl_to_str:n { : : }
          \exp_not:N \q_stop
      }
  }
\use:e
  {
    \cs_new_protected:Npe \exp_not:N \__talk_decode_mode:w
      #1 \token_to_str:N :
      #2 \token_to_str:N :
      #3 \exp_not:N \q_stop
  }
  {
    \exp_not:N \tl_if_blank:nTF {#2}
      {
        \exp_not:N \__talk_decode_mode:nn
          { \tl_to_str:n { projector } } {#1}
      }
      { \exp_not:N \__talk_decode_mode:nn {#1} {#2} }
  }
\cs_new_protected:Npn \__talk_decode_mode:nn #1#2
  {
    \str_if_eq:VnTF \l__talk_mode_str {#1}
      {
        \__talk_decode_action:n {#2}
        \str_if_empty:NT \l__talk_decode_overlays_str
          { \__talk_decode_overlays:nn { overlays } { * } }
      }
      {
        \tl_if_blank:nF {#2}
          { \bool_set_false:N \l__talk_decode_pure_bool }
      }
  }
\cs_new_protected:Npe \__talk_decode_action:n #1
  {
    \exp_not:N \__talk_decode_action:w
      #1 \tl_to_str:n { @ @ } \exp_not:N \q_stop
  }
\use:e
  {
    \cs_new_protected:Npn \exp_not:N \__talk_decode_action:w
      #1 \tl_to_str:n { @ } #2 \tl_to_str:n { @ } #3 \exp_not:N \q_stop
  }
  {
    \tl_if_blank:nTF {#2}
      { \__talk_decode_overlays:nn { overlays } {#1} }
      {
        \cs_if_exist:cTF { __talk_action_ #1 :N }
          {
            \bool_set_false:N \l__talk_decode_pure_bool
            \str_set:Nn \l__talk_decode_action_str {#1}
            \tl_if_blank:nF {#2}
              { \__talk_decode_overlays:nn { actions } {#2} }
          }
          {
            \msg_error:nnV { talk } { bad-action-spec }
              \l__talk_decode_arg_str
           }
      }
  }
\cs_new_protected:Npn \__talk_decode_overlays:nn #1#2
  {
    \bool_set_false:N \l__talk_decode_step_bool
    \__talk_decode_overlays:nN {#1} #2 \q_recursion_tail \q_recursion_stop
    \bool_if:NT \l__talk_decode_step_bool
      { \int_gincr:N \g__talk_pauses_int }
    \__talk_decode_check:n {#1}
  }
\cs_new_protected:Npn \__talk_decode_overlays:nN #1#2
  {
    \quark_if_recursion_tail_stop:N #2
    \cs_if_exist_use:cF { __talk_decode_overlay_ #2 :nw }
      {
        \str_put_right:cn { l__talk_decode_ #1 _str } {#2}
        \__talk_decode_overlays:nN
      }
        {#1}
  }
\cs_new_protected:cpn { __talk_decode_overlay_+:nw } #1
  {
    \bool_set_true:N \l__talk_decode_step_bool
    \__talk_decode_overlay_aux:nNN {#1} 1
  }
\cs_new_protected:cpn { __talk_decode_overlay_.:nw } #1
  { \__talk_decode_overlay_aux:nNN {#1} 0 }
\cs_new_protected:Npn \__talk_decode_overlay_aux:nNN #1#2#3
  {
    \quark_if_recursion_tail_stop_do:Nn #3
      {
        \__talk_decode_overlay_offset:nNn {#1} #2 { 0 }
        \q_recursion_tail \q_recursion_stop
      }
    \token_if_eq_meaning:NNTF #3 ( % )
      { \__talk_decode_overlay_offset:nNnN {#1} #2 { } }
      { \__talk_decode_overlay_offset:nNn {#1} #2 { 0 } #3 }
  }
\cs_new_protected:Npn \__talk_decode_overlay_offset:nNnN #1#2#3#4
  {
    \quark_if_recursion_tail_stop_do:Nn #4
      {
        \msg_error:nnV { talk } { bad-action-spec }
          \l__talk_decode_arg_str
      } % (
    \token_if_eq_meaning:NNTF #4 )
      { \__talk_decode_overlay_offset:nNn {#1} #2 {#3} }
      { \__talk_decode_overlay_offset:nNnN {#1} #2 {#3#4} }
  }
\cs_new_protected:Npn \__talk_decode_overlay_offset:nNn #1#2#3
  {
    \str_put_right:ce { l__talk_decode_ #1 _str }
      { \int_max:nn { 0 } { #3 + \g__talk_pauses_int + #2 } }
    \__talk_decode_overlays:nN {#1}
  }
\cs_new_protected:Npn \__talk_decode_check:n #1
  {
    \clist_set:cv { l__talk_decode_ #1 _clist } { l__talk_decode_ #1 _str }
    \clist_if_in:cnTF { l__talk_decode_ #1 _clist } { * }
      { \bool_set_true:c { l__talk_decode_ #1 _bool } }
      {
        \clist_map_inline:cn { l__talk_decode_ #1 _clist }
          { \__talk_decode_check:nw {#1} 0 ##1 - - \q_stop }
      }
  }
\cs_new_protected:Npn \__talk_decode_check:nw #1#2 - #3 - #4 \q_stop
  {
    \tl_if_empty:nTF {#4}
      { \__talk_decode_check_single:nn {#1} {#2} }
      {
        \tl_if_blank:nTF {#3}
          { \__talk_decode_check_range:nnn {#1} {#2} { \c_max_int } }
          { \__talk_decode_check_range:nnn {#1} {#2} {#3} }
      }
  }
\cs_set_protected:Npn \__talk_decode_check_single:nn #1#2
  {
    \int_compare:nNnTF \g__talk_slide_int = {#2}
      {
        \bool_set_true:c { l__talk_decode_ #1 _bool }
        \clist_map_break:
      }
      {
        \int_compare:nNnT {#2} > \g__talk_slide_int
          { \bool_gset_true:N \g__talk_slide_continue_bool }
      }
  }
\cs_set_protected:Npn \__talk_decode_check_range:nnn #1#2#3
  {
    \int_compare:nNnF \g__talk_slide_int > {#3}
      {
        \int_compare:nNnTF \g__talk_slide_int < {#2}
          { \bool_gset_true:N \g__talk_slide_continue_bool }
          {
            \bool_set_true:c { l__talk_decode_ #1 _bool }
            \bool_lazy_and:nnT
              { \int_compare_p:nNn \g__talk_slide_int < {#3} }
              { \int_compare_p:nNn {#3} < \c_max_int }
              { \bool_gset_true:N \g__talk_slide_continue_bool }
            \clist_map_break:
          }
      }
  }
\msg_new:nnnn { talk } { bad-action-spec }
  { Bad~overlay~specification~"#1". }
  {
    The~overlay~specification~given~doesn't~follow~the~pattern~described~in~
    the~ltx-talk~manual:~it~has~been~ignored.
  }
\bool_new:N \g__talk_slide_continue_bool
\box_new:N \l__talk_slide_box
\int_new:N \g__talk_slide_int
\cs_new_eq:NN \c@slide \g__talk_slide_int
\cs_new:Npn \theslide { \@arabic \c@slide }
\property_new:nnnn { slides } { now } { 1 } { \int_use:N \g__talk_slide_int }
\cs_new_protected:Npn \__talk_slide:nn #1#2
  {
    \group_begin:
      \tl_set:Ne \l__talk_tmp_tl
        {
          \property_ref:ee { frame . \int_use:N \g__talk_frame_int }
            { slides }
        }
      \str_if_eq:VnTF \l__talk_frame_tagging_str { n }
        { \str_set:NV \l__talk_frame_tagging_str \l__talk_tmp_tl }
        {
          \str_replace_all:NnV \l__talk_frame_tagging_str { ,n }
            \l__talk_tmp_tl
          \str_replace_all:NnV \l__talk_frame_tagging_str { ,~n }
            \l__talk_tmp_tl
        }
      \int_gzero:N \g__talk_slide_int
      \RenewCommandCopy \frame \__talk_latexe_frame:n
      \bool_do_while:Nn \g__talk_slide_continue_bool
        {
          \int_gincr:N \g__talk_slide_int
          \bool_gset_false:N \g__talk_slide_continue_bool
          \__talk_if_overlay:nT {#1}
            {
              \__talk_slide_begin:
              \__talk_if_overlay:VTF \l__talk_frame_tagging_str
                {
                  \bool_gset_false:N \g__talk_slide_continue_bool
                  \__talk_frame_tag:n
                }
                {
                  \bool_gset_false:N \g__talk_slide_continue_bool
                  \__talk_frame_notag:n
                }
                  {
                    \bool_if:NTF \l__talk_frame_verb_bool
                      { \__talk_slide_aux:n }
                      { \use:n }
                        {#2}
                  }
               \__talk_slide_end:
            }
        }
      \property_record:ee { frame . \int_use:N \g__talk_frame_int }
        { slides }
    \group_end:
  }
\cs_new_protected:Npn \__talk_slide_aux:n #1
  {
    \group_begin:
      \cs_set:Npn \obeyedline { ^^J }
      \use:e
        {
          \group_end:
          \tl_retokenize:n {#1}
        }
  }
\AddToHook { enddocument / afterlastpage }
  {
    \property_record:ee { frame . \int_use:N \g__talk_frame_int }
      { slides }
  }
\int_new:N \g__talk_frame_struct_int
\cs_new_protected:Npn \__talk_slide_begin:
  {
    \int_gzero:N \g__talk_pauses_int
    \tl_gclear:N \g__talk_frame_title_tl
    \tl_gclear:N \g__talk_frame_subtitle_tl
    \__talk_cnt_save:
    \vbox_set:Nw \l__talk_slide_box
      \tl_gclear:N \g__talk_onslide_tl
  }
\cs_new_protected:Npn \__talk_slide_end:
  {
      \tl_use:N \g__talk_onslide_tl
    \vbox_set_end:
    \bool_if:NT \g__talk_slide_continue_bool
      { \__talk_cnt_restore: }
    \vbox_to_ht:nn { \textheight }
      {
        \use:c { __talk_slide_align_ \l__talk_frame_alignment_tl :n }
          { \vbox_unpack_drop:N \l__talk_slide_box }
      }
    \clearpage
  }
\cs_new_protected:Npn \__talk_slide_align_bottom:n #1
  {
    \skip_vertical:n { 0pt~plus~1fil }
    #1
    \skip_vertical:n { 0pt }
  }
\cs_new_protected:Npn \__talk_slide_align_center:n #1
  {
    \skip_vertical:n { 0pt~plus~0.5fil }
    #1
    \skip_vertical:n { 0pt~plus~0.5fil }
  }
\cs_new_protected:Npn \__talk_slide_align_stretch:n #1
  {
    \skip_vertical:n { 0pt }
    #1
    \skip_vertical:n { 0pt }
  }
\cs_new_protected:Npn \__talk_slide_align_top:n #1
  {
    \skip_vertical:n { 0pt }
    #1
    \skip_vertical:n { 0pt~plus~1fil }
  }
\seq_new:N \l__talk_cnt_reset_seq
\seq_set_from_clist:Nn \l__talk_cnt_reset_seq
  {
    equation       ,
    footnote       ,
    mpfootnote     ,
    parentequation
  }
\seq_map_inline:Nn \l__talk_cnt_reset_seq
    {
      \int_new:c { g__talk_saved_ #1 _int }
      \int_gset_eq:cc { g__talk_saved_ #1 _int } { c@ #1 }
    }
\cs_new_protected:Npn \__talk_cnt_save:
  {
    \seq_map_inline:Nn \l__talk_cnt_reset_seq
      { \int_gset_eq:cc { g__talk_saved_ ##1 _int } { c@ ##1 } }
  }
\cs_new_protected:Npn \__talk_cnt_restore:
  {
    \seq_map_inline:Nn \l__talk_cnt_reset_seq
      { \int_gset_eq:cc { c@ ##1 } { g__talk_saved_ ##1 _int } }
  }
\cs_new_eq:NN \std@definecounter \@definecounter
\cs_gset_protected:Npn \@definecounter #1
  {
    \std@definecounter {#1}
    \int_new:c { g__talk_saved_ #1 _int }
    \seq_gput_right:Nn \l__talk_cnt_reset_seq {#1}
  }
\tl_new:N \l__talk_frame_alignment_tl
\keys_define:nn { talk / frame }
  {
    action-spec .str_set:N
      = \l__talk_action_spec_str ,
    tag-slides .str_set:N
      = \l__talk_frame_tagging_str ,
    vertical-alignment .choices:nn =
      { bottom , center , stretch , top }
      {
        \tl_set_eq:NN \l__talk_frame_alignment_tl
          \l_keys_value_tl
      }
  }
\keys_set:nn { talk / frame }
  {
    action-spec        =        ,
    tag-slides         = n      ,
    vertical-alignment = center
  }
\cs_new_protected:Npn \__talk_header_tag_begin:n #1
  {
    \tag_resume:n { header }
    \tag_mc_end:
    \tag_struct_begin:n {#1}
    \tag_mc_begin:n { }
  }
\cs_generate_variant:Nn \__talk_header_tag_begin:n { e }
\cs_new_protected:Npn \__talk_header_tag_end:
  {
    \tag_mc_end:
    \tag_struct_end:
    \tag_mc_begin:n { artifact }
    \tag_suspend:n { header }
  }
\NewTemplateType { footer-element } { 1 }
\DeclareTemplateInterface { footer-element } { talk } { 1 }
  {
    color      : tokenlist ,
    font       : tokenlist = ,
    left-skip  : length = 0em ,
    right-skip : length = 0em
  }
\DeclareTemplateCode { footer-element } { talk } { 1 }
  {
    color      = \l__talk_footelem_color_tl ,
    font       = \l__talk_footelem_font_tl ,
    left-skip  = \l__talk_footelem_left_skip ,
    right-skip = \l__talk_footelem_right_skip
  }
  {
    \tl_if_empty:nF {#1}
      {
        \hspace { \l__talk_footelem_left_skip }
        \group_begin:
          \tl_if_empty:NF \l__talk_footelem_color_tl
            { \color_select:V \l__talk_footelem_color_tl }
          \l__talk_footelem_font_tl
          #1
        \group_end:
        \hspace { \l__talk_footelem_right_skip }
      }
  }
\DeclareInstance { footer-element } { date } { talk } { }
\DeclareInstance { footer-element } { author } { talk } { }
\DeclareInstance { footer-element } { title } { talk } { }
\DeclareInstance { footer-element } { institute } { talk } { }
\DeclareInstance { footer-element } { framenumber } { talk } { }
\NewTemplateType { header } { 0 }
\DeclareTemplateInterface { header } { talk } { 0 }
  {
    background-color  : tokenlist,
    color             : tokenlist = structure ,
    font              : tokenlist = \normalfont ,
    height            : length = \Gm@tmargin + \headsep ,
    left-hspace       : skip = \Gm@lmargin ,
    print-frame-title : boolean = true ,
    right-hspace      : skip = \Gm@rmargin
  }
\DeclareTemplateCode { header } { talk } { 0 }
  {
    background-color  = \l__talk_header_bg_tl ,
    color             = \l__talk_header_fg_tl ,
    font              = \l__talk_header_font_tl ,
    height            = \l__talk_header_ht_dim ,
    left-hspace       = \l__talk_header_left_skip ,
    print-frame-title = \l__talk_header_frametitle_bool ,
    right-hspace      = \l__talk_header_right_skip
  }
  {
    \noindent
    \__talk_wallpaper_hrule:Nnn
      \l__talk_header_bg_tl
      { \l__talk_header_ht_dim - \headsep }
      { \headsep }
    \skip_horizontal:n { \l__talk_header_left_skip }
    \group_begin:
      \tl_if_empty:NF \l__talk_header_fg_tl
        { \color_select:V \l__talk_header_fg_tl }
      \l__talk_header_font_tl
      \bool_if:NT \l__talk_header_frametitle_bool
        {
          \ExpandArgs { nnV }
            \UseInstance { frametitle } { header }
              \g__talk_frame_title_tl
        }
    \group_end:
  }
\DeclareInstance { header } { std } { talk } { }
\AddToHook { begindocument }
  {
    \DeclareInstanceCopy { header } { wallpaper } { std }
    \EditInstance { header } { wallpaper }
      { print-frame-title = false }
  }
\NewTemplateType { footer } { 0 }
\DeclareTemplateInterface { footer } { talk } { 0 }
  {
    background-color : tokenlist ,
    color            : tokenlist ,
    element-order    : commalist ,
    font             : tokenlist = \tiny ,
    left-skip        : length = \Gm@lmargin ,
    right-skip       : length = \Gm@rmargin ,
    separator        : tokenlist = \hfil
  }
\DeclareTemplateCode { footer } { talk } { 0 }
  {
    background-color = \l__talk_footer_bg_tl ,
    color            = \l__talk_footer_fg_tl ,
    element-order    = \l__talk_footer_order_clist ,
    separator        = \l__talk_footer_sep_tl ,
    font             = \l__talk_footer_font_tl ,
    left-skip        = \l__talk_footer_left_skip ,
    right-skip       = \l__talk_footer_right_skip
  }
  {
    \noindent
    \__talk_wallpaper_hrule:Nnn
      \l__talk_footer_bg_tl
      { \footskip }
      { \Gm@bmargin - \footskip }
    \skip_horizontal:n { \l__talk_footer_left_skip }
    \vbox_set_to_wd:Nnn \l__talk_tmp_box
      {
          \paperwidth
        - \l__talk_footer_left_skip
        - \l__talk_footer_right_skip
      }
      {
        \tl_if_empty:NF \l__talk_footer_fg_tl
          { \color_select:V \l__talk_footer_fg_tl }
        \l__talk_footer_font_tl
        \clist_pop:NNT \l__talk_footer_order_clist \l__talk_tmp_tl
          {
            \ExpandArgs { nVv } \UseInstance { footer-element } \l__talk_tmp_tl
              { @ \l__talk_tmp_tl }
            \clist_map_inline:Nn \l__talk_footer_order_clist
              {
                \tl_if_empty:cF { @ ##1 }
                  {
                    \l__talk_footer_sep_tl
                    \ExpandArgs { nnv }
                      \UseInstance { footer-element } {##1} { @ ##1 }
                  }
              }
          }
        \hfil
      }
    \box_use_drop:N \l__talk_tmp_box
    \skip_horizontal:n { \l__talk_footer_right_skip - \Gm@rmargin }
  }
\DeclareInstance { footer } { std } { talk } { }
\AddToHook { begindocument }
  {
    \DeclareInstanceCopy { footer } { wallpaper } { std }
    \EditInstance { footer } { wallpaper }
      { element-order = }
  }
\cs_new_protected:Npn \__talk_wallpaper_hrule:Nnn #1#2#3
  {
    \skip_horizontal:n { -\Gm@lmargin }
    \tl_if_empty:NF #1
      {
        \group_begin:
          \color_select:V #1
          \rule:nnn { \paperwidth } {#2} {#3}
          \skip_horizontal:n { -\paperwidth }
        \group_end:
      }
  }
\cs_set_nopar:Npn \ps@plain
  {
    \cs_set_nopar:Npn \@oddhead
      {
        \__talk_section_tagged:
        \hfil
      }
    \cs_set_nopar:Npn \@oddfoot { }
    \cs_set_eq:NN \@evenhead \@oddhead
    \cs_set_eq:NN \@evenfoot \@oddfoot
  }
\cs_set_nopar:Npn \ps@wallpaper
  {
    \cs_set_nopar:Npn \@oddhead
      {
        \__talk_section_tagged:
        \UseInstance { header } { wallpaper }
        \hfil
      }
    \cs_set_nopar:Npn \@oddfoot
      {
        \UseInstance { footer } { wallpaper }
        \hfil
      }
    \cs_set_eq:NN \@evenhead \@oddhead
    \cs_set_eq:NN \@evenfoot \@oddfoot
  }
\cs_new_nopar:Npn \ps@talk
  {
    \cs_set_nopar:Npn \@oddhead
      {
        \__talk_section_tagged:
        \UseInstance { header } { std }
        \hfil
      }
    \cs_set_nopar:Npn \@oddfoot { \UseInstance { footer } { std } }
    \cs_set_eq:NN \@evenhead \@oddhead
    \cs_set_eq:NN \@evenfoot \@oddfoot
  }
\pagestyle { talk }
\bool_new:N \l__talk_frame_bool
\bool_new:N \g__talk_frame_tag_bool
\bool_new:N \l__talk_frame_verb_bool
\int_new:N \g__talk_frame_int
\cs_new_eq:NN \c@frame \g__talk_frame_int
\cs_new:Npn \theframe { \@arabic \c@frame }
\cs_new:Npn \@framenumber { \arabic { frame } }
\property_new:nnnn { totalframes } { shipout } { -1 }
  { \int_use:N \g__talk_frame_int }
\AddToHook { enddocument / afterlastpage }
  { \property_record:nn { lastpage } { totalframes } }
\NewCommandCopy \__talk_latexe_frame:n \frame
\cs_new_protected:Npn \__talk_frame_process:nn #1#2
  {
    \int_gincr:N \g__talk_frame_int
    \bool_set_true:N \l__talk_frame_bool
    \__talk_slide:nn {#1} {#2}
  }
\cs_new_protected:Npn \__talk_frame_tag:n #1
  {
    \tag_struct_begin:n { tag = frame }
    \int_gset:Nn \g__talk_frame_struct_int { \tag_get:n { struct_num } }
    \bool_gset_true:N \g__talk_frame_tag_bool
    #1
    \tag_struct_end:
  }
\cs_new_protected:Npn \__talk_frame_notag:n #1
  {
    \tag_mc_begin:n { artifact }
    \tag_suspend:n { frame }
    \bool_gset_false:N \g__talk_frame_tag_bool
    #1
    \par
    \tag_resume:n { frame }
    \tag_mc_end:
  }
\bool_if:NTF \l__talk_frame_title_bool
  {
    \RenewDocumentEnvironment { frame }
      { D <> { all } = { action-spec } O { } +m +b }
      {
        \keys_set:nn { talk / frame } {#2}
        \bool_set_false:N \l__talk_frame_verb_bool
        \__talk_frame_process:nn {#1} { \frametitle {#3} #4 }
      }
      { }
    \NewDocumentEnvironment { frame* }
      { D <> { all } = { action-spec } O { } +m c }
      {
        \keys_set:nn { talk / frame } {#2}
        \bool_set_true:N \l__talk_frame_verb_bool
        \tl_gset:Nn \g__talk_frame_title_tl {#3}
        \exp_args:Nne \__talk_frame_process:nn {#1}
          { \tl_to_str:n { \frametitle } \exp_not:n { {#3} #4 } }
      }
      { }
  }
  {
    \RenewDocumentEnvironment { frame }
      { !D <> { all } = { action-spec } !O { } +b }
      {
        \keys_set:nn { talk / frame } {#2}
        \bool_set_false:N \l__talk_frame_verb_bool
        \__talk_frame_process:nn {#1} {#3}
      }
      { }
    \NewDocumentEnvironment { frame* }
      { !D <> { all } = { action-spec } !O { } c }
      {
        \keys_set:nn { talk / frame } {#2}
        \bool_set_true:N \l__talk_frame_verb_bool
        \__talk_frame_process:nn {#1} {#3}
      }
      { }
  }
\keys_define:nn { talk }
  { columns .inherit:n = talk / column }
\keys_define:nn { talk / columns }
  { width .tl_set:N = \l__talk_columns_wd_tl }
\keys_set:nn { talk / columns }
  { width = \textwidth }
\NewDocumentEnvironment { columns } { D <> { all } O { } }
  {
    \__talk_action_begin:n {#1}
    \par
    \keys_set:nn { talk / columns } {#2}
    \hbox_set_to_wd:Nnw \l__talk_tmp_box { \l__talk_columns_wd_tl }
      \dim_set:Nn \textwidth { \l__talk_columns_wd_tl }
      \dim_set_eq:NN \columnwidth \textwidth
      \hfil
      \ignorespaces
  }
  {
      \unskip
      \hfil
    \hbox_set_end:
    \box_use_drop:N \l__talk_tmp_box
    \par
    \__talk_action_end:
  }
\keys_define:nn { talk / column }
  {
    b .meta:n =
      { vertical-alignment = bottom } ,
    b .value_forbidden:n = true ,
    c .meta:n =
      { vertical-alignment = center } ,
    c .value_forbidden:n = true ,
    t .meta:n =
      { vertical-alignment = top } ,
    t .value_forbidden:n = true ,
    vertical-alignment .choices:nn =
      { bottom , center , top }
      {
        \tl_set_eq:NN \l__talk_column_alignment_tl
          \l_keys_value_tl
      }
  }
\keys_set:nn { talk / column }
  {
    vertical-alignment = center
  }
\cs_new_protected:Npn \__talk_column_align_bottom:n #1
  { \vbox:n {#1} }
\cs_new_protected:Npn \__talk_column_align_center:n #1
  {
    \vbox:n
      {
        \hbox:n
          {
            \box_move_down:nn
              {
                  0.5 \box_ht:N \l__talk_tmp_box
                - \tex_fontdimen:D 22 ~ \tex_textfont:D 2 ~
              }
              { \vbox:n {#1} }
          }
      }
  }
\cs_new_protected:Npn \__talk_column_align_top:n #1
  { \vbox_top:n {#1} }
\NewDocumentEnvironment { column } { D <> { all } O { } m }
  {
    \par
    \keys_set:nn { talk / column } {#2}
    \vbox_set_to_wd:Nnw \l__talk_tmp_box {#3}
      \dim_set:Nn \textwidth {#3}
      \dim_set_eq:NN \columnwidth \textwidth
      \@parboxrestore
      \leavevmode
      \raggedright
      \__talk_action_begin:n {#1}
      \ignorespaces
  }
  {
      \__talk_action_end:
    \vbox_set_end:
    \use:c { __talk_column_align_ \l__talk_column_alignment_tl :n }
      { \vbox_unpack_drop:N \l__talk_tmp_box }
    \hfil
    \par
    \@ignoretrue
  }
\tl_new:N  \l__talk_float_alignment_tl
\NewTemplateType { floatenv } { 2 }
\DeclareTemplateInterface { floatenv } { talk } { 2 }
  {
    float-placement : tokenlist ,
    horizontal-alignment : choice { left , center ,  right } = left
  }
\DeclareTemplateCode { floatenv } { talk } { 2 }
  {
    float-placement = \l__talk_tmp_tl ,
    horizontal-alignment =
      {
        left = \tl_set:Nn \l__talk_float_alignment_tl { flushleft } ,
        center = \tl_set:Nn \l__talk_float_alignment_tl { center } ,
        right = \tl_set:Nn \l__talk_float_alignment_tl { flushright }
      }
  }
  {
    \SetTemplateKeys { floatenv } { talk } {#1}
    \begin { minipage } { \columnwidth }
      \begin { \l__talk_float_alignment_tl }
        \cs_set_nopar:Npn \@captype {#2}
  }
\DeclareInstance { floatenv } { std } { talk } { horizontal-alignment = left }
\cs_new_protected:Npn \endfloatenv
  {
      \end { \l__talk_float_alignment_tl }
    \end { minipage }
  }
\clist_map_inline:nn { figure , table }
  {
    \NewDocumentEnvironment {#1} { D <> { all } = { float-placement } O { } }
      {
        \__talk_action_begin:n {##1}
        \UseInstance { floatenv } { std } {##2} {#1}
      }
      {
        \endfloatenv
        \__talk_action_end:
      }
    \newcounter {#1}
    \tl_new:c { #1 name }
    \tl_set:ce { #1 name } { \text_titlecase_first:n {#1} }
    \tl_new:c { fnum@ #1 }
    \tl_set:ce { fnum@ #1 }
      { \exp_not:c { #1 name } \exp_not:N \nobreakspace \exp_not:c { the #1 } }
  }
\newlength \abovecaptionskip
\newlength \belowcaptionskip
\setlength \abovecaptionskip { 7pt }
\setlength \belowcaptionskip { 7pt }
\cs_set_protected:Npn \@caption #1 [ #2 ] #3
  {
    \par
    \begingroup
      \@parboxrestore
      \if@minipage \@setminipage \fi
      \normalsize
      \@makecaption { \csname fnum@ #1 \endcsname } { \ignorespaces #3 }
      \par
    \endgroup
  }
\prg_new_protected_conditional:Npnn \__talk_mode:n #1 { T }
  {
    \bool_lazy_or:nnTF
      { \str_if_eq_p:nn {#1} { all } }
      { \str_if_eq_p:Vn \l__talk_mode_str {#1} }
      \prg_return_true:
      \prg_return_false:
  }


\NewDocumentCommand \mode { D <> { all } +m }
  { \__talk_mode:nT {#1} {#2} }
\prg_new_protected_conditional:Npnn \__talk_if_overlay:n #1 { T , F , TF }
  {
    \__talk_decode_parse:n {#1}
    \bool_if:NTF \l__talk_decode_overlays_bool
      \prg_return_true:
      \prg_return_false:
  }
\prg_generate_conditional_variant:Nnn \__talk_if_overlay:n { V } { T , F , TF }
\cs_new_protected:Npn \__talk_overlay_arg:n #1
  {
    \__talk_if_overlay:nTF {#1}
      { \cs_set:Npn \ProcessedArgument { \c_true_bool } }
      { \cs_set:Npn \ProcessedArgument { \c_false_bool } }
  }
\cs_new_protected:Npn \__talk_action_:N #1 { \opacity_select:n { 1 } }
\cs_new_protected:Npn \__talk_action_alert:N #1
  {
    \bool_if:NTF #1
      { \color_select:n { alert } }
      { \color_select:n { . } }
  }
\cs_new_protected:Npn \__talk_action_invisible:N #1
  {
    \bool_if:NTF #1
      { \opacity_select:n { 0 } }
      { \opacity_select:n { 1 } }
  }
\cs_new_protected:Npn \__talk_action_visible:N #1
  {
    \bool_if:NTF #1
      { \opacity_select:n { 1 } }
      { \opacity_select:n { 0 } }
  }
\cs_new_protected:Npn \__talk_action_only:N #1
  {
    \bool_if:NF #1
      { \vbox_set:Nw \l__talk_tmp_box }
  }
\cs_new_protected:Npn \__talk_action_only_end:N #1
  {
    \bool_if:NF #1
      { \vbox_set_end: }
  }
\NewTemplateType { hidden } { 0 }
\DeclareTemplateInterface { hidden } { talk } { 0 }
  { opacity : real = 0 }
\DeclareTemplateCode { hidden } { talk } { 0 }
  { opacity = \l__talk_uncover_hidden_fp }
  { \opacity_select:n { \l__talk_uncover_hidden_fp } }
\DeclareInstance { hidden } { std } { talk } { }
\cs_new_protected:Npn \__talk_action_uncover:N #1
  {
    \bool_if:NTF #1
      { \opacity_select:n { 1 } }
      { \UseInstance { hidden } { std } }
  }
\clist_map_inline:nn { only , invisible , uncover }
  {
    \ExpandArgs { cne } \NewDocumentCommand {#1}
      { > { \__talk_overlay_arg:n } D <> { all } +m }
      {
        \group_begin:
          \exp_not:c { __talk_action_ #1 :N } ##1
          ##2
          \cs_if_exist:cT { __talk_action_ #1 _end:N }
            { \exp_not:c { __talk_action_ #1 _end:N } ##1 }
        \group_end:
      }
    \ExpandArgs { nnee } \NewDocumentEnvironment { #1 env }
      { > { \__talk_overlay_arg:n } D <> { all } }
      { \exp_not:c { __talk_action_ #1 :N } ##1 }
      {
        \cs_if_exist:cT { __talk_action_ #1 _end:N }
          { \exp_not:c { __talk_action_ #1 _end:N } ##1 }
      }
  }
\clist_map_inline:nn { alert , visible }
  {
    \ExpandArgs { cne } \NewDocumentCommand {#1}
      { > { \__talk_overlay_arg:n } D <> { all } +m }
      {
        \group_begin:
          \exp_not:c { __talk_action_ #1 :N } ##1
            ##2
         \group_end:
      }
    \ExpandArgs { nnee } \NewDocumentEnvironment { #1 env }
      { > { \__talk_overlay_arg:n } D <> { all } }
      { \exp_not:c { __talk_action_ #1 :N } ##1 }
      { }
  }
\RenewDocumentCommand \only { D <> { all } +m }
  {
    \__talk_if_overlay:nT {#1}
      {#2}
  }
\bool_new:N \l__talk_saved_overlays_bool
\str_new:N \l__talk_saved_action_str
\bool_new:N \l__talk_saved_actions_bool
\NewDocumentCommand \action { D <> { all } +m }
  {
    \group_begin:
      \__talk_action_begin:n {#1}
      #2
      \__talk_action_end:
    \group_end:
  }
\NewDocumentEnvironment { actionenv } { D <> { all } }
  { \__talk_action_begin:n {#1} }
  { \__talk_action_end: }
\cs_new_protected:Npn \__talk_action_begin:n #1
  {
    \group_begin:
      \__talk_decode_parse:n {#1}
      \bool_set_eq:NN \l__talk_saved_overlays_bool
        \l__talk_decode_overlays_bool
      \str_set_eq:NN \l__talk_saved_action_str
        \l__talk_decode_action_str
      \bool_set_eq:NN \l__talk_saved_actions_bool
        \l__talk_decode_actions_bool
      \bool_if:NTF \l__talk_decode_overlays_bool
        {
          \use:c { __talk_action_ \l__talk_decode_action_str :N }
            \l__talk_decode_actions_bool
        }
        { \UseInstance { hidden } { std } }
  }
\cs_new_protected:Npn \__talk_action_end:
  {
      \bool_if:NT \l__talk_saved_overlays_bool
        {
          \cs_if_exist_use:cF
            { __talk_action_ \l__talk_saved_action_str _end:N }
            { \use_none:n }
              \l__talk_saved_actions_bool
        }
    \group_end:
  }
\NewDocumentCommand \alt { D <> { all } +m +m }
  {
    \__talk_if_overlay:nTF {#1}
      {#2}
      {#3}
  }
\NewDocumentCommand \onslide { D <> { all } }
  { \__talk_onslide:n {#1} }
\cs_new_protected:Npn \__talk_onslide:n #1
  {
    \tl_use:N \g__talk_onslide_tl
    \__talk_if_overlay:nTF {#1}
      { \__talk_onslide_reset: }
      {
        \opacity_select:n { 0 }
        \tl_gset:Nn \g__talk_onslide_escape_tl
          {
            \opacity_select:n { 0 }
            \group_insert_after:N \g__talk_onslide_escape_tl
          }
        \group_insert_after:N \g__talk_onslide_escape_tl
        \tl_gset:Nn \g__talk_onslide_tl
          {
            \tl_gclear:N \g__talk_onslide_tl
            \tl_gclear:N \g__talk_onslide_escape_tl
            \__talk_onslide_reset:
          }
      }
  }
\cs_new_protected:Npn \__talk_onslide_reset: { \opacity_select:n { 1 } }
\tl_new:N \g__talk_onslide_tl
\tl_new:N \g__talk_onslide_escape_tl
\NewDocumentCommand \temporal { D <> { all } +m +m +m }
  {
    \__talk_if_overlay:nTF {#1}
      {#3}
      {
        \bool_if:NTF \g__talk_slide_continue_bool
          {#4}
          {#2}
      }
  }
\NewDocumentCommand \pause { o }
  {
    \IfNoValueTF {#1}
      { \int_gincr:N \g__talk_pauses_int }
      { \int_gset:Nn \g__talk_pauses_int {#1} }
    \exp_args:Ne \__talk_onslide:n { \int_eval:n { \g__talk_pauses_int + 1 } - }
  }
\cs_new_protected:Npn \__talk_overprint_begin:n #1
  {
    \par
    \vbox_set_to_wd:Nnw \l__talk_tmp_box {#1}
      \raggedright
      \ignorespaces
  }
\NewDocumentEnvironment { overlayarea } { m m }
  { \__talk_overprint_begin:n {#1} }
  {
    \vbox_set_end:
    \vbox_to_ht:nn {#2}
      {
        \box_use_drop:N \l__talk_tmp_box
        \vfil
      }
    \par
  }
\int_new:N \l__talk_overprint_int
\cs_new:Npn \__talk_frame_overprint:
  {
    \int_to_Roman:n \g__talk_frame_int
    \int_to_roman:n \l__talk_overprint_int
  }
\NewDocumentEnvironment { overprint } { O { \textwidth } }
  { \__talk_overprint_begin:n {#1} }
  {
    \vbox_set_end:
    \int_incr:N \l__talk_overprint_int
    \__talk_overprint_save_ht:
    \cs_if_exist:cTF
      { overprint@ \__talk_frame_overprint: }
      {
        \dim_compare:vNnTF
          { overprint@ \__talk_frame_overprint: }
            > { \box_ht:N \l__talk_tmp_box }
          {
            \vbox_to_ht:vn
              { overprint@ \__talk_frame_overprint: }
              {
                \box_use_drop:N \l__talk_tmp_box
                \vfil
              }
          }
          { \box_use_drop:N \l__talk_tmp_box }
      }
      { \box_use_drop:N \l__talk_tmp_box }
    \par
  }
\cs_new_protected:Npn \__talk_overprint_save_ht:
  {
    \tl_if_exist:cF { g__talk_overprint_ \__talk_frame_overprint: _tl }
      {
        \tl_new:c { g__talk_overprint_ \__talk_frame_overprint: _tl }
        \tl_gset:cn { g__talk_overprint_ \__talk_frame_overprint: _tl }
          { 0pt }
      }
    \tl_gset:ce { g__talk_overprint_ \__talk_frame_overprint: _tl }
      {
        \dim_max:vn { g__talk_overprint_ \__talk_frame_overprint: _tl }
          { \box_ht:N \l__talk_tmp_box }
      }
    \legacy_if:nT { @filesw }
      {
        \iow_now:Ne \@auxout
          {
            \gdef \exp_not:c { overprint@ \__talk_frame_overprint: }
              {
                \exp_not:v { g__talk_overprint_ \__talk_frame_overprint: _tl }
              }
          }
      }
    \hook_gput_code:nne { enddocument / afterlastpage } { talk }
       { \__talk_overprint_check_ht:n { \__talk_frame_overprint: } }
  }
\cs_new_protected:Npn \__talk_overprint_check_ht:n #1
  {
    \bool_lazy_and:nnF
      { \exp_not:N \cs_if_exist_p:c { overprint@ #1 } }
      {
        \dim_compare_p:vNv { overprint@ #1 } = { g__talk_overprint_ #1 _tl }
      }
      {
        \msg_warning:nn { talk } { overprint-ht }
        \cs_gset_protected:Npn \__talk_overprint_check_ht:n ##1 { }
      }
  }
\msg_new:nnn { talk } { overprint-ht }
  {
    Overprint~area~height~has~changed:\\
    rerun~LaTeX.
  }

\tl_map_inline:nn
  {
    \textbf
    \textit
    \textmd
    \textnormal
    \textrm
    \textsc
    \textsf
    \textsl
    \texttt
    \textup
    \emph
  }
  {
    \ExpandArgs { c } \NewCommandCopy { std \cs_to_str:N #1 } #1
    \ExpandArgs { Nne } \RenewDocumentCommand #1
      { D <> { all } +m }
      {
        \exp_not:N \__talk_if_overlay:nTF {##1}
          { \exp_not:c { std \cs_to_str:N #1 } }
          { \exp_not:N \__talk_textcmd_eqiv:n }
            {##2}
      }
  }
\cs_new_protected:Npn \__talk_textcmd_eqiv:n #1
  {
    \mode_if_math:TF
      { { \mbox {#1} } }
      {
        \mode_leave_vertical:
        {#1}
      }
  }
\RequirePackage { graphicx }
\NewCommandCopy \stdincludegraphics \includegraphics
\RenewDocumentCommand \includegraphics { s D <> { all } o o m }
  {
    \__talk_if_overlay:nT {#2}
      {
        \use:e
          {
            \exp_not:N \stdincludegraphics
              \IfBooleanT #1 { * }
              \IfNoValueF {#3} { [ \exp_not:n { {#3} } ] }
              \IfNoValueF {#4} { [ \exp_not:n { {#4} } ] }
          }
            {#5}
      }
  }
\RenewDocumentCommand \label { D <> { 1 } m }
  {
    \@bsphack
    \__talk_if_overlay:nT {#1}
      { \__talk_label:n {#2} }
    \@esphack
  }
\cs_new_protected:Npn \__talk_label:n #1
  {
    \begingroup
      \UseHookWithArguments { label } { 1 } {#1}
      \protected@write \@auxout { }
        {
          \string \newlabel {#1}
            {
              { \@currentlabel }
              { \thepage }
              { \@currentlabelname }
              { \@currentHref }
              { \@kernel@reserved@label@data }
            }
        }
    \endgroup
  }
\cs_new_nopar:Npn \today
  {
    \ifcase \month \or
      January \or
      February \or
      March \or
      April \or
      May \or
      June \or
      July \or
      August \or
      September \or
      October \or
      November \or
      December
    \fi
    \space
    \number \day ,
    \space
    \number \year
  }
\setcounter { tocdepth } { 3 }
\setlength \arraycolsep { 5pt }
\setlength \tabcolsep { 6pt }
\setlength \arrayrulewidth { 0.4pt }
\setlength \doublerulesep { 2pt }
\setlength \tabbingsep { \labelsep }
\skip \@mpfootins = \skip \footins
\setlength \fboxsep { 3pt }
\setlength \fboxrule { 0.4pt }
\setlength  \labelsep  { 0.5em }
\cs_new:Npn \labelenumi { \theenumi . }
\cs_new:Npn \labelenumii { ( \theenumii ) }
\cs_new:Npn \labelenumiii { \theenumiii . }
\cs_new:Npn \labelenumiv { \theenumiv . }
\cs_new:Npn \labelitemi  { \labelitemfont \textbullet }
\cs_new:Npn \labelitemii { \labelitemfont \bfseries \textendash }
\cs_new:Npn \labelitemiii { \labelitemfont \textasteriskcentered }
\cs_new:Npn \labelitemiv  { \labelitemfont \textperiodcentered }
\cs_new:Npn \labelitemfont { \normalfont }
\setlength \leftmargini   { 2em }
\setlength \leftmarginii  { 2em }
\setlength \leftmarginiii { 2em }
\setlength  \labelsep  { 0.5em }
\setlength  \labelwidth { \leftmargini }
\addtolength \labelwidth { -\labelsep }
\cs_gset_nopar:Npn \@listi
  {
    \leftmargin \leftmargini
    \topsep 3pt plus 2pt minus 2.5pt
    \parsep 0pt
    \itemsep 3pt plus 2pt minus 3pt
  }
\cs_gset_eq:NN \@listI \@listi
\cs_gset_nopar:Npn \@listii
  {
    \leftmargin \leftmarginii
    \topsep    2pt plus 1pt minus 2pt
    \parsep    0pt plus 1pt
    \itemsep   \parsep
  }
\cs_gset_nopar:Npn \@listiii
  {
    \leftmargin \leftmarginiii
    \topsep    2pt plus 1pt minus 2pt
    \parsep    0pt plus 1pt
    \itemsep   \parsep
  }
\setlength \partopsep { 0pt }
\tl_new:N \g__talk_frame_title_tl
\tl_new:N \g__talk_frame_subtitle_tl
\NewDocumentCommand \frametitle { D <> { all } O {#3} m }
  {
    \__talk_if_overlay:nT {#1}
      { \tl_gset:Nn \g__talk_frame_title_tl {#3} }
  }
\NewDocumentCommand \framesubtitle { D <> { all } O {#3} m }
  {
    \__talk_if_overlay:nT {#1}
      { \tl_gset:Nn \g__talk_frame_subtitle_tl {#3} }
  }
\NewTemplateType { frametitle } { 1 }
\DeclareTemplateInterface { frametitle } { talk } { 1 }
  {
    after-vspace  : skip = \bigskipamount ,
    before-vspace : skip = 0em ,
    color         : tokenlist = ,
    font          : tokenlist = \Large \bfseries
  }
\DeclareTemplateCode { frametitle } { talk } { 1 }
  {
    after-vspace  = \l__talk_frametitle_after_skip ,
    before-vspace = \l__talk_frametitle_before_skip ,
    color         = \l__talk_frametitle_color_tl ,
    font          = \l__talk_frametitle_font_tl
  }
  {
    \noindent
    \vspace { \l__talk_frametitle_before_skip }
    \group_begin:
      \tl_if_empty:NF \l__talk_frametitle_color_tl
        { \color_select:V \l__talk_frametitle_color_tl }
      \l__talk_frametitle_font_tl
      \tl_if_blank:nF {#1}
        { \__talk_frame_title:n {#1} }
      \par
    \group_end:
    \vspace { \l__talk_frametitle_after_skip }
  }
\DeclareInstance { frametitle } { header } { talk } { }
\cs_new_protected:Npn \__talk_frame_title:n #1
  {
    \bool_if:NTF \g__talk_frame_tag_bool
      { \__talk_frame_title_tagged:n }
      { \use:n }
        {#1}
  }
\cs_new_protected:Npn \__talk_frame_title_tagged:n #1
  {
   \__talk_header_tag_begin:e
      {
        firstkid = true ,
        parent   = \int_use:N \g__talk_frame_struct_int ,
        tag      = frametitle ,
        title    = { \text_purify:n { \g__talk_frame_title_tl } } ,
      }
    \group_begin:
      \tagpdfparaOff
      #1
    \group_end:
    \__talk_header_tag_end:
  }
\tl_new:N \l__talk_section_tl
\tl_new:N \g__talk_section_tl
\tl_new:N \l__talk_subsection_tl
\tl_new:N \g__talk_subsection_tl
\tl_new:N \l__talk_subsubsection_tl
\tl_new:N \g__talk_subsubsection_tl
\newcounter { section }
\newcounter { subsection } [ section ]
\newcounter { subsubsection } [ subsection ]
\seq_gremove_all:Nn \l__talk_cnt_reset_seq { section }
\seq_gremove_all:Nn \l__talk_cnt_reset_seq { subsection }
\seq_gremove_all:Nn \l__talk_cnt_reset_seq { subsubsection }
\cs_gset:Npn \thesection { \@arabic \c@section }
\cs_gset:Npn \thesubsection { \thesection . \@arabic \c@subsection }
\cs_gset:Npn \thesubsubsection { \thesubsection . \@arabic \c@subsubsection }
\seq_set_from_clist:Nn \l_tmpa_seq
  { section , subsection , subsubsection }
\seq_map_indexed_inline:Nn \l_tmpa_seq
  {
    \use:e
      {
        \NewDocumentCommand \exp_not:c { insert #2 } { }
          {
            \exp_not:N \tl_use:N
            \exp_not:c { l__talk_ #2 _tl }
          }
        \NewDocumentCommand \exp_not:c {#2}
          { s D <> { all } O {##4} m }
          {
            \exp_not:N \refstepcounter {#2}
            \tag_tool:n { sec-start = #2 , restore-para }
            \tl_set:Nn \exp_not:c { l__talk_ #2 _tl } {##4}
            \tl_gset_eq:NN \exp_not:c { g__talk_ #2 _tl }
              \exp_not:c { l__talk_ #2 _tl }
            \str_if_eq:nnT {#2} { section }
              { \tl_clear:N \exp_not:N \l__talk_subsection_tl }
            \str_if_eq:nnF {#2} { subsubsection }
              { \tl_clear:N \exp_not:N \l__talk_subsubsection_tl }
            \exp_not:N \addcontentsline { toc } {#2}
              {
                \exp_not:N \int_compare:nNnF {#1} >
                  { \exp_not:N \value { secnumdepth } }
                  {
                    \exp_not:N \protect \exp_not:N \numberline
                      { \exp_not:c { the #2 } }
                  }
                ##4
              }
            \hook_use:n { #2 / begin }
          }
        \hook_new:n { #2 / begin }
      }
}
\cs_new_protected:Npn \__talk_section_tagged:
  {
    \clist_map_inline:nn { section , subsection , subsubsection }
      {
        \tl_if_empty:cF { g__talk_ ##1 _ tl }
          {
            \__talk_header_tag_begin:e
              {
                tag   = ##1 ,
                title = { \text_purify:v { g__talk_ ##1 _ tl } } ,
              }
            \__talk_header_tag_end:
            \tl_gclear:c { g__talk_ ##1 _ tl }
          }
      }
  }
\cs_gset_protected:Npn \@starttoc #1
  {
    \begingroup
      \makeatletter
      \UseTaggingSocket { toc / starttoc / before } {#1}
      \@input { \jobname .#1 }
      \UseTaggingSocket { toc / starttoc / after } {#1}
      \legacy_if:nT { @filesw }
        {
          \AddToHook { enddocument / afterlastpage }
            {
              \expandafter \newwrite \csname tf@ #1 \endcsname
              \immediate \openout \csname tf@ #1 \endcsname \jobname .#1 \relax
            }
        }
      \@nobreakfalse
    \endgroup
  }
\NewDocumentCommand \tableofcontents { O { } }
  {
    \group_begin:
      \@starttoc { toc }
    \group_end:
  }
\cs_new_protected:Npn \l@section #1#2
  { \__talk_toc_aux:nnnn { 1 } { \bfseries \color { structure } } {#1} {#2} }
\cs_new_protected:Npn \l@subsection #1#2
  {
    \__talk_toc_aux:nnnn
      { 2 }
      {
        \skip_set:Nn \leftskip { 2em }
        \color { . }
      }
      {#1} {#2}
  }
\cs_new_protected:Npn \l@subsubsection #1#2
  {
    \__talk_toc_aux:nnnn
      { 3 }
      {
        \skip_set:Nn \leftskip { 4em }
        \color { . }
        \footnotesize
      }
      {#1} {#2}
  }
\cs_new_protected:Npn \__talk_toc_aux:nnnn #1#2#3#4
  {
    \int_compare:nNnTF { \value { section } } < 1
      { \use:n }
      { \__talk_toc_dest:n }
        { \__talk_toc_level:nnnn {#1} {#2} {#3} {#4} }
  }
\cs_new_protected:Npn \__talk_toc_dest:n
  {
    \exp_after:wN \__talk_toc_dest:w \@contentsline@destination
      . 0 . 0 . 0 . \q_stop
  }
\cs_new_protected:Npn \__talk_toc_dest:w #1 . #2 . #3 . #4 . #5 \q_stop #6
  {
    \int_compare:nNnTF { \value { section } } = {#2}
      {#6}
      {
        \group_begin:
          \opacity_select:n { 0.2 }
          #6
        \group_end:
      }
  }
\cs_new_protected:Npn \__talk_toc_level:nnnn #1#2#3#4
  {
    \int_compare:nNnF {#1} > { \value { tocdepth } }
      {
        \group_begin:
          \noindent
          #2
          \UseHookWithArguments { contentsline / text / before } { 4 }
            {#1} {#3} {#4} { \@contentsline@destination }
          #3
          \UseHookWithArguments { contentsline / text / after } { 4 }
            {#1} {#3} {#4} { \@contentsline@destination }
          \UseHookWithArguments { contentsline / page / before } { 4 }
            {#1} {#3} {#4}
            { \@contentsline@destination }
         \UseHookWithArguments { contentsline / page / after } { 4 }
            {#1} {#3} {#4}
            { \@contentsline@destination }
          \par
        \group_end:
        \vfil
      }
  }
\setcounter { tocdepth } { 2 }
\NewDocumentEnvironment { description } { } { } { }
\NewDocumentEnvironment { quote } { } { } { }
\NewDocumentEnvironment { quotation } { } { } { }
\NewDocumentEnvironment { verse } { } { } { }
\AddToHook { begindocument / before }
  {
    \clist_map_inline:nn { quote , quotation , verse }
      {
        \NewEnvironmentCopy { std #1 } {#1}
        \RenewDocumentEnvironment {#1} { D <> { all } !O { } }
          {
            \__talk_action_begin:n {##1}
            \begin { std #1 } [ {##2} ]
              \ignorespaces
          }
          {
            \end { std #1 }
            \__talk_action_end:
          }
      }
  }
\NewDocumentEnvironment { block } { D <> { all } m }
  {
    \__talk_action_begin:n {#1}
    \par
    \vbox_set:Nw \l__talk_tmp_box
      \group_begin:
        \medskip
        \leavevmode
        \normalfont \large \bfseries
        \color { structure }
        #2
        \par
        \medskip
      \group_end:
  }
  {
    \vbox_set_end:
    \box_use:N \l__talk_tmp_box
    \par
    \__talk_action_end:
  }
\AddToHook { begindocument / before }
  {
    \NewCommandCopy \stditem \item
    \RenewDocumentCommand \item { d <> o }
      {
        \IfNoValueTF {#2}
          { \stditem }
          { \stditem [ {#2} ] }
        \IfNoValueTF {#1}
          {
            \exp_after:wN \__talk_item_parse_spec:w
              \l__talk_action_spec_str < all > \q_stop
          }
          { \__talk_item_parse_spec:n {#1} }
      }
  }
\cs_new_protected:Npn \__talk_item_parse_spec:w #1 < #2 > #3 \q_stop
  { \__talk_item_parse_spec:n {#2} }
\cs_new_protected:Npn \__talk_item_parse_spec:n #1
  {
    \tl_if_blank:nF {#1}
      {
        \tl_set:Ne \l__talk_list_end_tl
          {
            \exp_not:N \int_compare:nNnT \tex_currentgrouplevel:D =
              { \int_use:N \tex_currentgrouplevel:D + 1 }
              {
                \__talk_action_end:
                \tl_clear:N \exp_not:N \l__talk_list_end_tl
              }
          }
        \__talk_action_begin:n {#1}
      }
  }
\tl_new:N \l__talk_list_end_tl
\cs_gset_protected:Npn \__block_inter_item:
  {
    \legacy_if:nT { @inlabel }
      { \indent \par }
   \mode_if_horizontal:T
     {
       \__block_skip_remove_last:
       \__block_skip_remove_last:
       \par
     }
    \l__talk_list_end_tl
    \__kernel_list_item_end:
    \__kernel_list_item_begin:
    \addpenalty \@itempenalty
    \addvspace \itemsep
  }
\cs_gset:Npn \endblockenv
  {
    \__block_debug_typeout:n { blockenv~common~ending \on@line }
    \bool_if:NT \l__block_level_incr_bool
      { \int_gdecr:N \g_block_nesting_depth_int }
    \legacy_if:nT { @inlabel }
      {
        \mode_leave_vertical:
        \legacy_if_gset_false:n { @inlabel }
      }
    \__block_if_list:T
      { \legacy_if:nT { @newlist } { \@noitemerr } }
    \mode_if_horizontal:TF
       {
         \__block_skip_remove_last:
         \__block_skip_remove_last:
         \par
       }
       { \@inmatherr { \end { \@currenvir } } }
    \l__talk_list_end_tl
    \__kernel_displayblock_end:
    \__block_if_list:T { \legacy_if_gset_false:n { @newlist } }
    \legacy_if:nF { @noparlist }
      {
        \__block_skip_set_to_last:N \l_tmpa_skip
        \dim_compare:nNnT \l_tmpa_skip > \c_zero_dim
          {
            \skip_vertical:n { - \l_tmpa_skip }
            \skip_vertical:n { \l_tmpa_skip + \parskip - \@outerparskip }
          }
        \addpenalty \@endparpenalty
        \addvspace \l__block_topsepadd_skip
      }
    \socket_use:n { block / endpe }
  }
\AddToHook { begindocument / before }
  {
    \clist_map_inline:nn { itemize , enumerate , description }
      {
        \RenewDocumentEnvironment {#1} { = { action-spec } !o }
          {
            \IfNoValueTF {##1}
              { \UseInstance { blockenv } {#1} { } }
              { \UseInstance { blockenv } {#1} {##1} }
          }
          { \endblockenv }
      }
  }
\AddToHook { begindocument / before }
  {
    \EditInstance { item } { basic }
      { label-format = \color { structure } #1 }
    \EditInstance { item } { description }
      { label-format = \normalfont \bfseries \color { structure } #1 }
  }
\keys_define:nn { template / block / display  }
  { action-spec .str_set:N = \l__talk_action_spec_str }
\NewCommandCopy \stdnewtheorem \newtheorem
\RenewDocumentCommand \newtheorem { m O {#1} m o }
  {
    \IfNoValueTF {#4}
      { \stdnewtheorem {#1} [ {#2} ] {#3} }
      { \stdnewtheorem {#1} [ {#2} ] {#3} [ {#4} ] }
    \NewEnvironmentCopy { std #1 } {#1}
    \RenewDocumentEnvironment {#1} { D <> { all } o }
      {
        \__talk_action_begin:n {##1}
        \IfNoValueTF {##2}
          { \begin { std #1 } }
          { \begin { std #1 } [ {##2} ] }
            \ignorespaces
      }
      {
        \end { std #1 }
        \__talk_action_end:
      }
  }
\cs_new_nopar:Npn \@institute { }
\cs_new_nopar:Npn \@subtitle { }
\NewDocumentCommand \institute { = { short-institute } O {#2} m }
  { \cs_gset_nopar:Npn \@institute {#2} }
\NewDocumentCommand \subtitle { = { short-subtitle } O {#2} m }
  { \cs_gset_nopar:Npn \@subtitle {#2} }
\NewTemplateType { titlepage-element } { 1 }
\DeclareTemplateInterface { titlepage-element } { talk } { 1 }
  {
    after-skip : length = 0em ,
    before-skip : length = 0em ,
    color : tokenlist = . ,
    font : tokenlist = \normalfont ,
    tag-begin : tokenlist = ,
    tag-end : tokenlist =
  }
\DeclareTemplateCode { titlepage-element } { talk } { 1 }
  {
    after-skip  = \l__talk_titlelem_after_skip ,
    before-skip = \l__talk_titlelem_before_skip ,
    color       = \l__talk_titlelem_color_tl ,
    font        = \l__talk_titlelem_font_tl ,
    tag-begin   = \l__talk_titlelem_tag_begin_tl ,
    tag-end     = \l__talk_titlelem_tag_end_tl
  }
  {
    \tl_if_empty:nF {#1}
      {
        \vspace { \l__talk_titlelem_before_skip }
        \group_begin:
          \tl_if_empty:NF \l__talk_titlelem_color_tl
            { \color_select:V \l__talk_titlelem_color_tl }
          \l__talk_titlelem_font_tl
          \l__talk_titlelem_tag_begin_tl
          #1
          \par
          \l__talk_titlelem_tag_end_tl
        \group_end:
        \vspace { \l__talk_titlelem_after_skip }
      }
  }
\DeclareInstance { titlepage-element } { author } { talk }
  { before-skip = 1em }
\DeclareInstance { titlepage-element } { date } { talk }
  { after-skip = 0.5em }
\DeclareInstance { titlepage-element } { institute } { talk }
  { font = \scriptsize }
\DeclareInstance { titlepage-element } { subtitle } { talk }
  { before-skip = 0.25em , color = structure }
\DeclareInstance { titlepage-element } { title } { talk }
  {
    color = structure ,
    font = \Large ,
    tag-begin = \tag_struct_begin:n { tag = Title } ,
    tag-end = \tag_struct_end:
  }
\NewTemplateType { titlepage } { 0 }
\DeclareTemplateInterface { titlepage } { talk } { 0 }
  {
    element-order : commalist =
      {
        title     ,
        subtitle  ,
        author    ,
        institute ,
        date
      } ,
    framestyle : tokenlist = talk ,
    horizontal-alignment : choice { left , center ,  right } = center ,
    vertical-alignment : choice { bottom , center , stretch , top } = center
  }
\DeclareTemplateCode { titlepage } { talk } { 0 }
  {
    element-order = \l__talk_titlepage_order_clist ,
    framestyle = \l__talk_titlepage_framestyle_tl ,
    horizontal-alignment =
      {
        left = \tl_set:Nn \l__talk_titlepage_alignment_tl { flushleft } ,
        center = \tl_set:Nn \l__talk_titlepage_alignment_tl { center } ,
        right = \tl_set:Nn \l__talk_titlepage_alignment_tl { flushright }
      } ,
    vertical-alignment =
      {
        bottom = \tl_set:Nn \l__talk_frame_alignment_tl { bottom } ,
        center = \tl_set:Nn \l__talk_frame_alignment_tl { center } ,
        stretch = \tl_set:Nn \l__talk_frame_alignment_tl { stretch } ,
        top = \tl_set:Nn \l__talk_frame_alignment_tl { top }
      }
  }
  {
    \tl_if_empty:NF \l__talk_titlepage_framestyle_tl
      { \exp_args:NV \thispagestyle \l__talk_titlepage_framestyle_tl }
    \begin { \l__talk_titlepage_alignment_tl }
      \cs_set_protected:Npn \and { \quad }
      \clist_map_inline:Nn \l__talk_titlepage_order_clist
        {
          \ExpandArgs { nnv } \UseInstance { titlepage-element }
            {##1} { @ ##1 }
        }
    \end { \l__talk_titlepage_alignment_tl }
  }
\NewDocumentCommand \maketitle { O {} }
  {
    \bool_if:NTF \l__talk_frame_bool
      { \UseTemplate { titlepage } { talk } {#1} }
      {
        \begin { frame }
          \UseTemplate { titlepage } { talk } {#1}
        \end { frame }
      }
  }
%% Copyright (C) 2023-2025 by
%%   Joseph Wright <joseph@texdev.net>
%% 
%% It may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License (LPPL), either version 1.3c of
%% this license or (at your option) any later version.  The latest
%% version of this license is in the file:
%% 
%%    https://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%%   Joseph Wright.
%% 
%% This work consists of the files ltx-talk.dtx,
%%                                 ltx-talk.ins,
%%                                 ltx-talk.tex,
%%                                 ltx-talk-code.tex,
%%                                 ltx-talk-color.dtx,
%%                                 ltx-talk-decode.dtx,
%%                                 ltx-talk-frame.dtx,
%%                                 ltx-talk-frame-structure.dtx,
%%                                 ltx-talk-mode.dtx,
%%                                 ltx-talk-overlay.dtx,
%%                                 ltx-talk-required.dtx,
%%                                 ltx-talk-structure.dtx and
%%                                 ltx-talk-title.dtx,
%%           and the derived files ltx-talk.cls,
%%                                 ltx-talk.pdf and
%%                                 ltx-talk-code.pdf.
%% 
%%
%% End of file `ltx-talk.cls'.
