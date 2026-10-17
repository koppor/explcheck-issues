% File: leporello.cls
% Copyright 2025 Jasper Habicht (mail(at)jasperhabicht.de).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.
%
% This file is part of the `leporello' package (The Work in LPPL)
% and all files in that bundle must be distributed together.
%
% This work has the LPPL maintenance status `maintained'.
%
\ProvidesExplClass{leporello}
  {2025/09/15} {1.0.3} {Document class for typesetting folded leaflets}

\msg_new:nnn { leporello } { latex-too-old } {
  LaTeX ~ kernel ~ too ~ old. \iow_newline:
  The ~ leporello ~ package ~ does ~ not ~ support ~ this ~ LaTeX ~ version. \iow_newline:
  Please ~ update ~ to ~ a ~ newer ~ version.
}

\cs_if_exist:NTF \IfExplAtLeastTF {
  \IfExplAtLeastTF { 2024-01-10 } { } {
    \msg_critical:nn { leporello } { latex-too-old }
  }
} {
  \msg_critical:nn { leporello } { latex-too-old }
}

\cs_generate_variant:Nn \clist_item:Nn { NV }
\cs_generate_variant:Nn \coffin_attach:NnnNnnnn { cencennn , ceeceeee }
\cs_generate_variant:Nn \color_select:n { e }
\cs_generate_variant:Nn \msg_error:nnnn { nneV }
\cs_generate_variant:Nn \msg_warning:nnnnn { nnVee }
\cs_generate_variant:Nn \prop_gput:Nnn { cnV , cne }
\cs_generate_variant:Nn \tl_const:Nn { co }
\cs_generate_variant:Nn \vbox_set_top:Nn { Ne }

\prg_generate_conditional_variant:Nnn \clist_if_in:nn { en } { T , F , TF }
\prg_generate_conditional_variant:Nnn \str_if_eq:nn { en } { T , F }

% helper function to extract first and second part of a fp tuple
\cs_new:Npn \__leporello_fp_tuple_use_i:w ( #1 , #2 ) {#1}
\cs_new:Npn \leporello_fp_tuple_use_i:n #1 {
  \fp_to_dim:n {
    \exp_last_unbraced:Ne
      \__leporello_fp_tuple_use_i:w { \fp_eval:n {#1} }
  }
}
\cs_generate_variant:Nn \leporello_fp_tuple_use_i:n { e }

\cs_new:Npn \__leporello_fp_tuple_use_ii:w ( #1 , #2 ) {#2}
\cs_new:Npn \leporello_fp_tuple_use_ii:n #1 {
  \fp_to_dim:n {
    \exp_last_unbraced:Ne
      \__leporello_fp_tuple_use_ii:w { \fp_eval:n {#1} }
  }
}
\cs_generate_variant:Nn \leporello_fp_tuple_use_ii:n { e }

\bool_new:N \l_leporello_show_frames_bool
\bool_new:N \l_leporello_show_id_bool
\bool_new:N \l_leporello_prepress_bool
\dim_new:N \l_leporello_layout_height_dim
\dim_new:N \l_leporello_bleed_dim
\dim_new:N \l_leporello_info_area_dim
\clist_new:N \l_leporello_columns_clist
\int_new:N \l_leporello_column_count_int

\dim_new:N \l_leporello_layout_width_dim
\dim_new:N \l_leporello_paper_width_dim
\dim_new:N \l_leporello_paper_height_dim

\int_new:N \g__leporello_shipout_current_box_int
\int_new:N \g__leporello_shipout_next_box_int
\clist_new:N \g__leporello_shipout_processed_boxes_clist

\str_new:N \l__leporello_break_check_size_str

\int_new:N \l__leporello_typeset_page_int
\int_new:N \l__leporello_typeset_column_int
\clist_new:N \l__leporello_typeset_temp_clist
\bool_new:N \l_leporello_auto_typeset_bool
\clist_new:N \g__leporello_auto_typeset_clist

\keys_define:nn { leporello } {
  global            .code:n       = {
    \keys_set:nn { leporello / global } {#1}
  } ,
  box               .code:n       = {
    \keys_set:nn { leporello / box } {#1}
  } ,
  typeset           .code:n       = {
    \keys_set:nn { leporello / typeset } {#1}
  } ,
  image             .code:n       = {
    \keys_set:nn { leporello / image } {#1}
  }
}

\keys_define:nn { leporello / global } {
  columns           .code:n       = {
    \clist_set:Nn \l_leporello_columns_clist {#1}
    \int_set:Nn \l_leporello_column_count_int {
      \clist_count:N \l_leporello_columns_clist
    }
    \dim_zero:N \l_leporello_layout_width_dim
    \clist_map_inline:Nn \l_leporello_columns_clist {
      \dim_add:Nn \l_leporello_layout_width_dim {##1}
    }
  } ,
  columns           .initial:n    = { 97mm , 100mm , 100mm } ,
  layout ~ height   .dim_set:N    = \l_leporello_layout_height_dim ,
  layout ~ height   .initial:n    = { 210mm } ,
  auto ~ typeset    .bool_set:N   = \l_leporello_auto_typeset_bool ,
  auto ~ typeset    .default:n    = { true } ,
  auto ~ typeset    .initial:n    = { false } ,
  show ~ frames     .bool_set:N   = \l_leporello_show_frames_bool ,
  show ~ frames     .default:n    = { true } ,
  show ~ frames     .initial:n    = { false } ,
  show ~ ids        .bool_set:N   = \l_leporello_show_id_bool ,
  show ~ ids        .default:n    = { true } ,
  show ~ ids        .initial:n    = { false } ,
  prepress          .bool_set:N   = \l_leporello_prepress_bool ,
  prepress          .default:n    = { true } ,
  prepress          .initial:n    = { false } ,
  bleed             .dim_set:N    = \l_leporello_bleed_dim ,
  bleed             .initial:n    = { 3mm } ,
  info ~ area       .dim_set:N    = \l_leporello_info_area_dim ,
  info ~ area       .initial:n    = { 10mm } ,

  two ~ columns         .meta:n   = {
    columns = { 99mm , 99mm }
  } ,
  three ~ columns       .meta:n   = {
    columns = { 97mm , 100mm , 100mm }
  } ,
  four ~ columns        .meta:n   = {
    columns = { 99mm , 99mm , 99mm , 100mm }
  } ,
  four ~ columns ~ wrap .meta:n   = {
    columns = { 97mm , 99mm , 100mm , 101mm }
  } ,
  five ~ columns        .meta:n   = {
    columns = { 97mm , 97mm , 97mm , 99mm , 100mm }
  } ,
  six ~ columns         .meta:n   = {
    columns = { 99mm , 99mm , 96mm , 96mm , 100mm , 100mm }
  }
}

\msg_new:nnn { leporello } { box-outside-column } {
  Box ~ #1 ~ defined ~ outside ~ column.
}

\msg_new:nnn { leporello } { image-outside-box } {
  Image ~ defined ~ outside ~ box.
}

\msg_new:nnn { leporello } { column-undefined } {
  Column ~ #1 ~ undefined.
}

\msg_new:nnn { leporello } { parent-box-undefined } {
  Parent ~ box ~ #1 ~ undefined.
}

\msg_new:nnn { leporello } { break-different-size } {
  Break ~ across ~ boxes ~ of ~ different ~ #1: \iow_newline:
  #2 ~ and ~ #3. \iow_newline:
  Consider ~ using ~ \token_to_str:N \leporelloboxbreak .
}

\msg_new:nnn { leporello } { command-not-supported } {
  Command ~ #1 ~ not ~ supported.
  \tl_if_empty:nF {#2} {
    \iow_newline: #2
  }
}

\msg_new:nnn { leporello } { environment-not-supported } {
  Environment ~ #1 ~ not ~ supported.
  \tl_if_empty:nF {#2} {
    \iow_newline: #2
  }
}

\hook_gput_code:nnn { cmd / footnote / before } { . } {
  \msg_error:nnee { leporello } { command-not-supported } {
    \token_to_str:N \footnote
  } {
    Consider ~ using ~ \token_to_str:N \leporellonote \c_space_tl instead.
  }
}

\hook_gput_code:nnn { cmd / footnote / before } { . } {
  \msg_error:nne { leporello } { command-not-supported } {
    \token_to_str:N \footnotemark
  }
}

\hook_gput_code:nnn { cmd / footnote / before } { . } {
  \msg_error:nne { leporello } { command-not-supported } {
    \token_to_str:N \footnotetext
  }
}

\hook_gput_code:nnn { cmd / marginpar / before } { . } {
  \msg_error:nnee { leporello } { command-not-supported } {
    \token_to_str:N \marginpar
  } {
    Consider ~ using ~ \token_to_str:N \leporellonote ~ instead.
  }
}

\hook_gput_code:nnn { env / figure / before } { . } {
  \msg_error:nnnn { leporello } { environment-not-supported } {
    figure
  } {
    Document ~ class ~ does ~ not ~ support ~ floats.
  }
}

\hook_gput_code:nnn { env / table / before } { . } {
  \msg_error:nnnn { leporello } { environment-not-supported } {
    table
  } {
    Document ~ class ~ does ~ not ~ support ~ floats.
  }
}

\int_new:N \g_leporello_current_sheet_int
\int_new:N \g_leporello_current_page_int
\int_new:N \l_leporello_current_column_int
\str_new:N \l_leporello_current_column_str
\int_new:N \l_leporello_current_box_int

\coffin_new:N \l__leporello_current_column_coffin
\dim_new:N \l__leporello_current_column_offset_dim
\int_new:N \g__leporello_box_int
\clist_new:N \g__leporello_child_boxes_clist
\prop_new:N \g__leporello_box_names_prop

\clist_new:N \l__leporello_box_align_parent_clist
\clist_new:N \l__leporello_box_align_self_clist
\tl_new:N \l__leporello_box_offset_tuple_tl
\bool_new:N \l__leporello_box_width_bool
\bool_new:N \l__leporello_box_height_bool
\dim_new:N \l__leporello_box_width_dim
\dim_new:N \l__leporello_box_height_dim
\dim_new:N \l__leporello_box_padding_left_dim
\dim_new:N \l__leporello_box_padding_right_dim
\dim_new:N \l__leporello_box_padding_top_dim
\dim_new:N \l__leporello_box_padding_bottom_dim
\tl_new:N \l__leporello_box_pre_tl
\tl_new:N \l__leporello_box_background_color_tl
\tl_new:N \l__leporello_box_background_code_tl
\box_new:N \l__leporello_box_background_box
\clist_new:N \l__leporello_box_bleed_clist
\tl_new:N \l__leporello_box_store_width_tl
\tl_new:N \l__leporello_box_store_height_tl
\str_new:N \l__leporello_box_flow_into_str

\keys_define:nn { leporello / box } {
  name               .code:n      = {
    \prop_gput:NnV \g__leporello_box_names_prop {#1} \g__leporello_box_int
    \prop_gput:cne { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { name } {#1}
  } ,
  name               .groups:n    = { local } ,
  flow ~ into        .code:n      = {
    \prop_gput:cne { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { flow ~ into } {#1}
  } ,
  flow ~ into        .groups:n    = { local } ,
  parent             .code:n      = {
    \prop_if_in:NnTF \g__leporello_box_names_prop {#1} {
      \clist_if_exist:cF {
        g__leporello_box_ \prop_item:Nn \g__leporello_box_names_prop {#1} _children_clist
      } {
        \clist_new:c {
          g__leporello_box_ \prop_item:Nn \g__leporello_box_names_prop {#1} _children_clist
        }
      }
      \clist_gput_right:cV {
        g__leporello_box_ \prop_item:Nn \g__leporello_box_names_prop {#1} _children_clist
      } \g__leporello_box_int
      \clist_gput_right:NV \g__leporello_child_boxes_clist \g__leporello_box_int
      \prop_gput:cne { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
        { parent ~ id } { \prop_item:Nn \g__leporello_box_names_prop {#1} }
    } {
      \msg_error:nnn { leporello } { parent-box-undefined } {#1}
    }
  } ,
  parent             .groups:n    = { local } ,
  align ~ parent     .clist_set:N = \l__leporello_box_align_parent_clist ,
  align ~ parent     .initial:n   = { l , t } ,
  align ~ self       .clist_set:N = \l__leporello_box_align_self_clist ,
  align ~ self       .initial:n   = { l , t } ,
  offset             .tl_set:N    = \l__leporello_box_offset_tuple_tl ,
  offset             .initial:n   = { 0mm , 0mm } ,
  width              .code:n      = {
    \bool_set_true:N \l__leporello_box_width_bool
    \dim_set:Nn \l__leporello_box_width_dim {#1}
  } ,
  height             .code:n      = {
    \bool_set_true:N \l__leporello_box_height_bool
    \dim_set:Nn \l__leporello_box_height_dim {#1}
  } ,
  stretch            .bool_set:N  = \l__leporello_box_stretch_bool ,
  stretch            .initial:n   = { false } ,
  padding / left     .dim_set:N   = \l__leporello_box_padding_left_dim ,
  padding / right    .dim_set:N   = \l__leporello_box_padding_right_dim ,
  padding / top      .dim_set:N   = \l__leporello_box_padding_top_dim ,
  padding / bottom   .dim_set:N   = \l__leporello_box_padding_bottom_dim ,
  padding            .code:n      = {
    \keys_set:nn { leporello / box / padding } {#1}
  } ,
  padding            .initial:n   = {
    left   = 7.5mm ,
    right  = 7.5mm ,
    top    = 7.5mm ,
    bottom = 7.5mm
  } ,
  no ~ padding       .meta:n      = {
    padding = {
      left   = 0mm ,
      right  = 0mm ,
      top    = 0mm ,
      bottom = 0mm
    }
  } ,
  pre                .tl_set:N    = \l__leporello_box_pre_tl ,
  background ~ color .tl_set:N    = \l__leporello_box_background_color_tl ,
  background ~ color .initial:n   = { none } ,
  background ~ code  .tl_set:N    = \l__leporello_box_background_code_tl ,
  bleed              .clist_set:N = \l__leporello_box_bleed_clist ,
  store ~ width      .tl_set:N    = \l__leporello_box_store_width_tl ,
  store ~ height     .tl_set:N    = \l__leporello_box_store_height_tl
}

\dim_new:N \l__leporello_typeset_box_width_dim
\dim_new:N \l__leporello_typeset_box_height_dim
\dim_new:N \l__leporello_typeset_box_bleed_x_dim
\dim_new:N \l__leporello_typeset_box_bleed_y_dim
\dim_new:N \l__leporello_typeset_box_stretch_x_dim
\dim_new:N \l__leporello_typeset_box_stretch_y_dim
\int_new:N \l__leporello_typeset_coffin_attach_align_int
\box_new:N \l__leporello_typeset_column_box
\coffin_new:N \l__leporello_typeset_mark_coffin
\coffin_new:N \l__leporello_typeset_mark_temp_coffin
\prop_new:N \l__leporello_typeset_boxes_to_sheets_prop
\prop_new:N \l__leporello_typeset_boxes_to_columns_prop

\bool_new:N \l_leporello_typeset_reverse_layout_bool
\bool_new:N \l_leporello_typeset_reverse_order_bool
\bool_new:N \l_leporello_typeset_reverse_pagination_bool
\bool_new:N \l_leporello_typeset_alternate_layout_bool
\bool_new:N \l_leporello_typeset_continuous_pagination_bool

\keys_define:nn { leporello / typeset } {
  reverse ~ layout   .code:n      = {
    \bool_set_inverse:N \l_leporello_typeset_reverse_layout_bool
  } ,
  reverse ~ order    .code:n      = {
    \bool_set_inverse:N \l_leporello_typeset_reverse_order_bool
  } ,
  reverse ~ pagination
                     .code:n      = {
    \bool_set_inverse:N \l_leporello_typeset_reverse_pagination_bool
  } ,
  alternate ~ layout
                    .bool_set:N   = \l_leporello_typeset_alternate_layout_bool ,
  alternate ~ layout
                    .initial:n    = { true } ,
  continuous ~ pagination
                    .bool_set:N   = \l_leporello_typeset_continuous_pagination_bool ,
  continuous ~ pagination
                    .initial:n    = { false }
}

\bool_new:N \l_leporello_image_fill_bleed_bool
\dim_new:N \l_leporello_image_width_dim
\dim_new:N \l_leporello_image_height_dim
\dim_new:N \l_leporello_image_clip_width_dim
\dim_new:N \l_leporello_image_clip_height_dim
\fp_new:N \l_leporello_image_scale_fp

\bool_new:N \l__leporello_image_width_bool
\bool_new:N \l__leporello_image_height_bool
\bool_new:N \l__leporello_image_clip_width_bool
\bool_new:N \l__leporello_image_clip_height_bool
\dim_new:N \l__leporello_image_offset_x_dim
\dim_new:N \l__leporello_image_offset_y_dim
\dim_new:N \l__leporello_image_outer_offset_left_dim
\dim_new:N \l__leporello_image_outer_offset_right_dim
\dim_new:N \l__leporello_image_outer_offset_top_dim
\dim_new:N \l__leporello_image_outer_offset_bottom_dim
\box_new:N \l__leporello_image_original_box

\keys_define:nn { leporello / image } {
  width              .code:n      = {
    \bool_set_true:N \l__leporello_image_width_bool
    \dim_set:Nn \l_leporello_image_width_dim {#1}
  } ,
  height             .code:n      = {
    \bool_set_true:N \l__leporello_image_height_bool
    \dim_set:Nn \l_leporello_image_height_dim {#1}
  } ,
  clip ~ width       .code:n      = {
    \bool_set_true:N \l__leporello_image_clip_width_bool
    \dim_set:Nn \l_leporello_image_clip_width_dim {#1}
  } ,
  clip ~ height      .code:n      = {
    \bool_set_true:N \l__leporello_image_clip_height_bool
    \dim_set:Nn \l_leporello_image_clip_height_dim {#1}
  } ,
  offset             .code:n      = {
    \dim_set:Nn \l__leporello_image_offset_x_dim {
      \leporello_fp_tuple_use_i:n {#1}
    }
    \dim_set:Nn \l__leporello_image_offset_y_dim {
      - \leporello_fp_tuple_use_ii:n {#1}
    }
  } ,
  offset             .initial:n   = { 0mm , 0mm } ,
  scale              .fp_set:N    = \l_leporello_image_scale_fp ,
  scale              .initial:n   = { 1 } ,
  ignore ~ padding   .clist_set:N = \l_leporello_image_ignore_padding_clist ,
  fill ~ bleed       .bool_set:N  = \l_leporello_image_fill_bleed_bool ,
  fill ~ bleed       .initial:n   = { false }
}

% ===

\hook_new_pair:nn { leporello / typeset / before } { leporello / typeset / after }
\hook_new_pair:nn { leporello / break-flow / before } { leporello / break-flow / after }
\hook_new_pair:nn { leporello / column / begin } { leporello / column / end }
\hook_new_pair:nn { leporello / box / begin } { leporello / box / end }

% ===

\bool_new:N \l_leporello_layout_vertical_ltr_bool
\bool_new:N \l_leporello_layout_vertical_rtl_bool

\cs_new_protected:Npn \__leporello_layout_set:n #1 {
  \tex_pagedir:D TLT
  \tex_bodydir:D TLT
  \tex_pardir:D TLT
  \tex_textdir:D TLT
  \scan_stop:
  \hook_gput_code:nnn { leporello / break-flow / before } {
    leporello / layout
  } {
    \tex_bodydir:D #1
    \tex_pardir:D #1
    \tex_textdir:D #1
    \scan_stop:
  }
  \hook_gput_code:nnn { leporello / box / begin } {
    leporello / layout
  } {
    \tex_bodydir:D #1
    \tex_pardir:D #1
    \tex_textdir:D #1
    \scan_stop:
  }
}

\sys_if_engine_luatex:T {
  \hook_gput_code:nnn { leporello / typeset / before } {
    leporello / layout
  } {
    \int_case:nnF { \tex_bodydirection:D } {
      { 1 } {
        \bool_set_false:N \l_leporello_layout_vertical_ltr_bool
        \bool_set_false:N \l_leporello_layout_vertical_rtl_bool
        \bool_set_inverse:N \l_leporello_typeset_reverse_layout_bool
        \bool_set_inverse:N \l_leporello_typeset_reverse_order_bool
        \bool_set_inverse:N \l_leporello_typeset_reverse_pagination_bool
        \__leporello_layout_set:n { TRT }
      }
      { 2 } {
        \bool_set_true:N \l_leporello_layout_vertical_ltr_bool
        \bool_set_false:N \l_leporello_layout_vertical_rtl_bool
        \__leporello_layout_set:n { LTL }
      }
      { 3 } {
        \bool_set_false:N \l_leporello_layout_vertical_ltr_bool
        \bool_set_true:N \l_leporello_layout_vertical_rtl_bool
        \bool_set_inverse:N \l_leporello_typeset_reverse_layout_bool
        \bool_set_inverse:N \l_leporello_typeset_reverse_order_bool
        \bool_set_inverse:N \l_leporello_typeset_reverse_pagination_bool
        \__leporello_layout_set:n { RTT }
      }
    } {
      \bool_set_false:N \l_leporello_layout_vertical_ltr_bool
      \bool_set_false:N \l_leporello_layout_vertical_rtl_bool
      \tex_pagedir:D TLT
      \tex_pardir:D TLT
      \tex_textdir:D TLT
      \group_begin:
        \msg_redirect_name:nnn { hooks } { cannot-remove } { none }
        \hook_gremove_code:nn { leporello / break-flow / before } { leporello / layout }
        \hook_gremove_code:nn { leporello / box / begin } { leporello / layout }
      \group_end:
    }
  }
}

% ===

\ProcessKeyOptions [ leporello / global ]
\LoadClass { article }
\RequirePackage { graphicx }
\RequirePackage { l3draw }

\clist_map_inline:nn {
  paperwidth ,
  paperheight ,
  textwidth ,
  textheight ,
  topmargin ,
  oddsidemargin ,
  evensidemargin ,
  hoffset ,
  voffset ,
  headheight ,
  headsep ,
  footskip ,
  marginparwidth ,
  marginparsep ,
  marginparpush ,
  linewidth ,
  @colht
} {
  \cs_new_protected:cpn {
    leporello_ltlayout_ #1 _set:n
  } ##1 {
    \dim_set:cn {#1} {##1}
  }
  \cs_new_protected:cpn {
    leporello_ltlayout_ #1 _gset:n
  } ##1 {
    \dim_gset:cn {#1} {##1}
  }
}

\cs_set_eq:NN \leporello_page_clear: \clearpage
\cs_set_eq:NN \leporello_pagestyle_set:n \pagestyle
\cs_set_eq:NN \leporello_text_superscript:n \textsuperscript
\cs_new_protected_nopar:Npn \leporello_page_gset:n #1 {
  \setcounter { page } {#1}
}
\cs_new_protected_nopar:Npn \leporello_graphics_use:nn #1#2 {
  \includegraphics [ #1 ] {#2}
}

% ===

\cs_if_exist:NF \draw_set_linewidth:n {
  \cs_set_eq:NN \draw_set_linewidth:n \draw_linewidth:n
}

% print vertical crop marks
\cs_new_protected:Npn \__leporello_cropmarks: {
  \draw_begin:
    \bool_set_false:N \l_draw_bb_update_bool
    \draw_set_linewidth:n { .25pt }
    \clist_map_inline:nn { 10mm , \l_leporello_paper_width_dim - 10mm } {
      \clist_map_inline:nn { -10mm , 10mm - \l_leporello_paper_height_dim } {
        \draw_scope_begin:
          \draw_transform_shift:n {
            ##1 , ####1
          }
          \draw_path_moveto:n {
            \dim_sign:n { ##1 - \l_leporello_paper_width_dim / 2 } * 5pt , 0pt
          }
          \draw_path_lineto:n {
            \dim_sign:n { ##1 - \l_leporello_paper_width_dim / 2 } * 20pt , 0pt
          }
          \draw_path_use:n { stroke }
        \draw_scope_end:
      }
    }
  \draw_end:
}

% print horizontal crop marks
\cs_new_protected:Npn \__leporello_cropmarks:n #1 {
  \draw_begin:
    \bool_set_false:N \l_draw_bb_update_bool
    \draw_set_linewidth:n { .25pt }
    \draw_scope_begin:
      \draw_transform_shift:n {
        #1 , -10mm
      }
      \draw_path_moveto:n { 0pt , 5pt }
      \draw_path_lineto:n { 0pt , 20pt }
      \draw_path_use:n { stroke }
    \draw_scope_end:
    \draw_scope_begin:
      \draw_transform_shift:n {
        #1 , 10mm - \l_leporello_paper_height_dim
      }
      \draw_path_moveto:n { 0pt , -5pt }
      \draw_path_lineto:n { 0pt , -20pt }
      \draw_path_use:n { stroke }
    \draw_scope_end:
  \draw_end:
}

% print box id marks
\cs_new_protected:Npn \__leporello_id_mark:n #1 {
  \draw_begin:
    \bool_set_false:N \l_draw_bb_update_bool
    \draw_path_rectangle:nn { -1.5em , -1.5em } { 3em , 3em }
    \draw_path_use_clear:n { fill }
    \hcoffin_set:Nn \l__leporello_typeset_mark_temp_coffin {
      \color_select:n { white } #1
    }
    \draw_coffin_use:Nnn \l__leporello_typeset_mark_temp_coffin
      { hc } { vc }
  \draw_end:
}

% wrapper around \includegraphics to apply keys
\cs_new:Npn \leporello_typeset_image:nn #1#2 {
  \group_begin:
    \keys_set:nn { leporello / image } {#1}

    \int_compare:nNnT { \l_leporello_current_box_int } = { 0 } {
      \msg_error:nn { leporello } { image-outside-box }
    }

    \hbox_set:Nn \l__leporello_image_original_box {
      \leporello_graphics_use:nn { } {#2}
    }

    \bool_if:NF \l__leporello_image_clip_width_bool {
      \dim_set:Nn \l_leporello_image_clip_width_dim {
        \fp_to_dim:n {
          \l_leporello_image_scale_fp *
          \box_wd:N \l__leporello_image_original_box
        }
      }
    }
    \bool_if:NF \l__leporello_image_clip_height_bool {
      \dim_set:Nn \l_leporello_image_clip_height_dim {
        \fp_to_dim:n {
          \l_leporello_image_scale_fp *
          \box_ht:N \l__leporello_image_original_box
        }
      }
    }
    \bool_if:NT \l__leporello_image_width_bool {
      \fp_set:Nn \l_leporello_image_scale_fp {
        \l_leporello_image_width_dim /
        \box_wd:N \l__leporello_image_original_box
      }
    }
    \bool_if:NT \l__leporello_image_height_bool {
      \fp_set:Nn \l_leporello_image_scale_fp {
        \l_leporello_image_height_dim /
        \box_ht:N \l__leporello_image_original_box
      }
    }

    \clist_if_in:NnT \l_leporello_image_ignore_padding_clist { l } {
      \dim_add:Nn \l__leporello_image_outer_offset_left_dim {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { padding ~ left }
      }
      \dim_add:Nn \l_leporello_image_clip_width_dim {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { padding ~ left }
      }
      \dim_add:Nn \tex_hfuzz:D {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { padding ~ left }
      }
    }
    \clist_if_in:NnT \l_leporello_image_ignore_padding_clist { r } {
      \dim_add:Nn \l__leporello_image_outer_offset_right_dim {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { padding ~ right }
      }
      \dim_add:Nn \l_leporello_image_clip_width_dim {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { padding ~ right }
      }
      \dim_add:Nn \tex_hfuzz:D {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { padding ~ right }
      }
    }
    \clist_if_in:NnT \l_leporello_image_ignore_padding_clist { t } {
      \dim_add:Nn \l__leporello_image_outer_offset_top_dim {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { padding ~ top }
      }
    }
    \clist_if_in:NnT \l_leporello_image_ignore_padding_clist { b } {
      \dim_add:Nn \l__leporello_image_outer_offset_bottom_dim {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { padding ~ bottom }
      }
    }

    \bool_if:NT \l_leporello_image_fill_bleed_bool {
      \int_compare:nNnT {
        \l_leporello_current_column_int
      } = { 1 } {
        \clist_if_in:enT {
          \prop_item:cn {
            g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
          } { bleed }
        } { l } {
          \dim_add:Nn \l__leporello_image_outer_offset_left_dim {
            \l_leporello_bleed_dim
          }
          \dim_add:Nn \l_leporello_image_clip_width_dim {
            \l_leporello_bleed_dim
          }
        }
      }
      \int_compare:nNnT {
        \l_leporello_current_column_int
      } = { \l_leporello_column_count_int } {
        \clist_if_in:enT {
          \prop_item:cn {
            g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
          } { bleed }
        } { r } {
          \dim_add:Nn \l__leporello_image_outer_offset_right_dim {
            \l_leporello_bleed_dim
          }
          \dim_add:Nn \l_leporello_image_clip_width_dim {
            \l_leporello_bleed_dim
          }
        }
      }
      \clist_if_in:enT {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { bleed }
      } { t } {
        \dim_add:Nn \l__leporello_image_outer_offset_top_dim {
          \l_leporello_bleed_dim
        }
        \dim_add:Nn \l_leporello_image_clip_height_dim {
          \l_leporello_bleed_dim
        }
      }
      \clist_if_in:enT {
        \prop_item:cn {
          g__leporello_box_ \int_use:N \l_leporello_current_box_int _prop
        } { bleed }
      } { b } {
        \dim_add:Nn \l__leporello_image_outer_offset_bottom_dim {
          \l_leporello_bleed_dim
        }
        \dim_add:Nn \l_leporello_image_clip_height_dim {
         \l_leporello_bleed_dim
        }
      }
    }

    \dim_add:Nn \l__leporello_image_offset_y_dim {
      \fp_to_dim:n {
        \l_leporello_image_scale_fp *
        \box_ht:N \l__leporello_image_original_box -
        \l_leporello_image_clip_height_dim
      }
    }

    \skip_vertical:n { - \l__leporello_image_outer_offset_top_dim }
    \skip_horizontal:n { - \l__leporello_image_outer_offset_left_dim }
    \leporello_graphics_use:nn {
      scale = \fp_to_decimal:N \l_leporello_image_scale_fp ,
      clip ,
      viewport =
        \dim_to_decimal_in_bp:n {
          \fp_to_dim:n {
            \l__leporello_image_offset_x_dim /
            \l_leporello_image_scale_fp
          }
        } ~
        \dim_to_decimal_in_bp:n {
          \fp_to_dim:n {
            \l__leporello_image_offset_y_dim /
            \l_leporello_image_scale_fp
          }
        } ~
        \dim_to_decimal_in_bp:n {
          \fp_to_dim:n {
            (
              \l_leporello_image_clip_width_dim +
              \l__leporello_image_offset_x_dim
            ) / \l_leporello_image_scale_fp
          }
        } ~
        \dim_to_decimal_in_bp:n {
          \fp_to_dim:n {
            (
              \l_leporello_image_clip_height_dim +
              \l__leporello_image_offset_y_dim
            ) / \l_leporello_image_scale_fp
          }
        }
    } {#2}
    \skip_horizontal:n { - \l__leporello_image_outer_offset_right_dim }
    \skip_vertical:n { - \l__leporello_image_outer_offset_bottom_dim }
  \group_end:
}

% set page number for column on sheet
\cs_new_protected:Npn \__leporello_box_page_gset:nn #1#2 {
  \int_gset:Nn \g_leporello_current_page_int {
    \int_eval:n {
      \bool_if:NTF \l_leporello_typeset_continuous_pagination_bool {
        \bool_if:NTF \l_leporello_typeset_reverse_pagination_bool {
          ( #1 ) *
          \l_leporello_column_count_int -
          #2 + 1
        } {
          ( #1 - 1 ) *
          \l_leporello_column_count_int +
          #2
        }
      } {
        \bool_if:NTF \l_leporello_typeset_reverse_pagination_bool {
          \int_div_truncate:nn { #1 - 1 } { 2 } *
          \l_leporello_column_count_int * 2 -
          \int_mod:nn {
            \int_mod:nn {#1} { 2 } *
            \l_leporello_column_count_int +
            #2 +
            \l_leporello_column_count_int
          } {
            \l_leporello_column_count_int * 2
          } + \l_leporello_column_count_int * 2
        } {
          \int_div_truncate:nn { #1 - 1 } { 2 } *
          \l_leporello_column_count_int * 2 +
          \int_mod:nn {
            \int_mod:nn {#1} { 2 } *
            \l_leporello_column_count_int +
            #2 + 1
          } {
            \l_leporello_column_count_int * 2
          } + 1
        }
      }
    }
  }
  \leporello_page_gset:n {
    \int_eval:n { \g_leporello_current_page_int }
  }
}
\cs_generate_variant:Nn \__leporello_box_page_gset:nn { VV }

% ===

% set page dimensions to inner width and inner height of relevant box
\cs_new_protected:Npn \__leporello_break_gset_dimensions:n #1 {
  \dim_gset:Nn \tex_hsize:D {
    \prop_item:cn { g__leporello_box_ #1 _prop } { inner ~ width }
  }
  \leporello_ltlayout_textwidth_gset:n {
    \prop_item:cn { g__leporello_box_ #1 _prop } { inner ~ width }
  }
  \leporello_ltlayout_linewidth_gset:n {
    \prop_item:cn { g__leporello_box_ #1 _prop } { inner ~ width }
  }
  \dim_gset:Nn \tex_vsize:D {
    \prop_item:cn { g__leporello_box_ #1 _prop } { inner ~ height }
  }
  \leporello_ltlayout_textheight_gset:n {
    \prop_item:cn { g__leporello_box_ #1 _prop } { inner ~ height }
  }
}
\cs_generate_variant:Nn \__leporello_break_gset_dimensions:n { V }

% calculate remaining space after contents of last flow box
\cs_new_protected:Npn \__leporello_break_gstore_remaining_space: {
  \vbox_to_ht:nn { \tex_baselineskip:D } { }
  \dim_compare:nNnF { \tex_pagegoal:D } = { \c_max_dim } {
    \prop_gput:cne {
      g__leporello_box_
      \int_use:N \g__leporello_shipout_current_box_int
      _prop
    } { remaining ~ space } {
      \dim_eval:n {
        \tex_pagetotal:D - 
        \tex_pagegoal:D -
        \tex_baselineskip:D
      }
    }
  }
    \iow_log:e { box: ~ \int_use:N \g__leporello_shipout_current_box_int }
    \iow_log:e { pagegoal: ~ \dim_to_decimal_in_mm:n { \tex_pagegoal:D } }
    \iow_log:e { pagetotal: ~ \dim_to_decimal_in_mm:n { \tex_pagetotal:D } }
}

% collect contents of connected flow boxes
\cs_new_protected:Npn \__leporello_break_collect:n #1 {
  \prop_if_in:cnT { g__leporello_box_ #1 _prop } { flow ~ into } {
    \tl_if_empty:cF {
      g__leporello_box_
      \prop_item:Ne \g__leporello_box_names_prop {
        \prop_item:cn { g__leporello_box_ #1 _prop } { flow ~ into }
      }
      _tl
    } {
      \__leporello_break_collect:n {
        \prop_item:Ne \g__leporello_box_names_prop {
          \prop_item:cn { g__leporello_box_ #1 _prop } { flow ~ into }
        }
      }
      \tl_gput_right:cn {
        g__leporello_box_ #1 _tl
      } {
        \tl_use:c {
          g__leporello_box_
          \prop_item:Ne \g__leporello_box_names_prop {
            \prop_item:cn { g__leporello_box_ #1 _prop } { flow ~ into }
          }
          _tl
        }
        \tl_gclear:c {
          g__leporello_box_
          \prop_item:Ne \g__leporello_box_names_prop {
            \prop_item:cn { g__leporello_box_ #1 _prop } { flow ~ into }
          }
          _tl
        }
      }
    }
  }
}

% check width or height difference in flow boxes
\cs_new_protected:Npn \__leporello_break_check_sizes:nn #1#2 {
  \bool_lazy_or:nnTF {
    \l_leporello_layout_vertical_ltr_bool
  } {
    \l_leporello_layout_vertical_rtl_bool
  } {
    \str_set:Nn \l__leporello_break_check_size_str { height }
  } {
    \str_set:Nn \l__leporello_break_check_size_str { width }
  }
  \dim_compare:nNnF {
    \prop_item:ce { g__leporello_box_ #1 _prop } {
      inner ~ \str_use:N \l__leporello_break_check_size_str
    }
  } = {
    \prop_item:ce { g__leporello_box_ #2 _prop } {
      inner ~ \str_use:N \l__leporello_break_check_size_str
    }
  } {
    \msg_warning:nnVee { leporello } { break-different-size }
      \l__leporello_break_check_size_str
      {
        \prop_item:ce { g__leporello_box_ #1 _prop } {
          inner ~ \str_use:N \l__leporello_break_check_size_str
        }
      } {
        \prop_item:ce { g__leporello_box_ #2 _prop } {
          inner ~ \str_use:N \l__leporello_break_check_size_str
        }
      }
  }
}
\cs_generate_variant:Nn \__leporello_break_check_sizes:nn { VV }

% break typeset material into boxes
\cs_new_protected:Npn \__leporello_break_flow_aux:nnn #1#2#3 {
  \hook_gput_code:nnn { build / page / after } { leporello / break-flow } {
    \__leporello_box_page_gset:nn {
      \prop_item:NV \l__leporello_typeset_boxes_to_sheets_prop
        \g__leporello_shipout_current_box_int
    } {
      \prop_item:NV \l__leporello_typeset_boxes_to_columns_prop
        \g__leporello_shipout_current_box_int
    }
  }

  \__leporello_break_gset_dimensions:n {#3}
  \leporello_ltlayout_@colht_gset:n {
    \prop_item:cn { g__leporello_box_ #3 _prop } { inner ~ height }
  }
  \int_gset:Nn \g__leporello_shipout_current_box_int {#3}
  \hook_gput_code:nnn { shipout / before } { leporello / break-flow } {
    \clist_gput_right:NV \g__leporello_shipout_processed_boxes_clist
      \g__leporello_shipout_current_box_int

    \box_if_exist:cF {
      g__leporello_box_
      \int_use:N \g__leporello_shipout_current_box_int
      _flow_box
    } {
      \box_new:c {
        g__leporello_box_
        \int_use:N \g__leporello_shipout_current_box_int
        _flow_box
      }
      \box_gset_eq:cN {
        g__leporello_box_
        \int_use:N \g__leporello_shipout_current_box_int
        _flow_box
      } \l_shipout_box
    }
    \shipout_discard:

    \prop_if_in:cnT {
      g__leporello_box_
      \int_use:N \g__leporello_shipout_current_box_int
      _prop
    } { flow ~ into } {
      \int_set:Nn \g__leporello_shipout_next_box_int {
        \prop_item:Ne \g__leporello_box_names_prop {
          \prop_item:cn {
            g__leporello_box_
            \int_use:N \g__leporello_shipout_current_box_int
            _prop
          } { flow ~ into }
        }
      }

      \__leporello_break_gset_dimensions:V
        \g__leporello_shipout_next_box_int

      \__leporello_break_check_sizes:VV
        \g__leporello_shipout_current_box_int
        \g__leporello_shipout_next_box_int

      \int_gset_eq:NN \g__leporello_shipout_current_box_int
        \g__leporello_shipout_next_box_int
    }
  }
}

\cs_new_protected:Npn \__leporello_break_flow:nnn #1#2#3 {
  \prop_if_in:cnT { g__leporello_box_ #3 _prop } { flow ~ into } {
    \clist_if_in:NVF \g__leporello_shipout_processed_boxes_clist
      \g__leporello_shipout_current_box_int {
      \group_begin:
        \clist_map_inline:nn {
          topmargin ,
          oddsidemargin ,
          evensidemargin
        } {
          \use:c { leporello_ltlayout_ ##1 _set:n } { 0pt }
        }

        \__leporello_break_collect:n {#3}
        \__leporello_break_flow_aux:nnn {#1} {#2} {#3}
        \tl_use:c { g__leporello_box_ #3 _tl }
        \tex_par:D
        \__leporello_break_gstore_remaining_space:
        \leporello_page_clear:
        \hook_gremove_code:nn { build / page / after } { leporello / break-flow }
        \hook_gremove_code:nn { shipout / before } { leporello / break-flow }
      \group_end:
    }
  }
}
\cs_generate_variant:Nn \__leporello_break_flow:nnn { een }

\cs_new_protected:Npn \__leporello_break_gset_boxes: {
  \clist_map_inline:Nn \g__leporello_shipout_processed_boxes_clist {
    \tl_gset:ce {
      g__leporello_box_ ##1 _tl
    } {
      \vbox_top:n {
        \vbox_unpack:c {
          g__leporello_box_ ##1 _flow_box
        }
      }
      \prop_if_in:cnT { g__leporello_box_ ##1 _prop } { remaining ~ space } {
        \skip_vertical:n {
          \prop_item:cn { g__leporello_box_ ##1 _prop } { remaining ~ space }
        }
      }
    }
  }
  \clist_gclear:N \g__leporello_shipout_processed_boxes_clist
}

% ===

% update poles for outer box to account for bleed
\cs_new_protected:Npn \__leporello_box_update_poles:nnn #1#2#3 {
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #3 _prop } { bleed }
  } { l } {
    \int_compare:nNnT {#2} = { 1 } {
      \coffin_set_vertical_pole:cnn {
        l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
      } { l } {
        \l_leporello_bleed_dim
      }
    }
  }
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #3 _prop } { bleed }
  } { r } {
    \int_compare:nNnT {#2} = { \l_leporello_column_count_int } {
      \coffin_set_vertical_pole:cnn {
        l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
      } { r } {
        \coffin_wd:c {
          l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
        } -
        \l_leporello_bleed_dim
      }
    }
  }
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #3 _prop } { bleed }
  } { t } {
    \coffin_set_horizontal_pole:cnn {
      l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
    } { t } {
      \coffin_ht:c {
        l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
      } -
      \l_leporello_bleed_dim
    }
  }
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #3 _prop } { bleed }
  } { b } {
    \coffin_set_horizontal_pole:cnn {
      l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
    } { b } {
      - \coffin_dp:c {
        l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
      } +
      \l_leporello_bleed_dim
    }
  }
}
\cs_generate_variant:Nn \__leporello_box_update_poles:nnn { VVn }

% calculate the inner width and inner height of a box in a column
\cs_new_protected:Npn \__leporello_box_measure:nn #1#2 {
  \prop_gput:cne { g__leporello_box_ #2 _prop } { inner ~ width } {
    \dim_eval:n {
      \bool_lazy_or:nnTF {
        \l_leporello_layout_vertical_ltr_bool
      } {
        \l_leporello_layout_vertical_rtl_bool
      } {
        \prop_if_in:cnTF { g__leporello_box_ #2 _prop } { height } {
          \prop_item:cn { g__leporello_box_ #2 _prop } { height }
        } {
          \l_leporello_layout_height_dim
        } -
        \prop_item:cn { g__leporello_box_ #2 _prop } { padding ~ top } -
        \prop_item:cn { g__leporello_box_ #2 _prop } { padding ~ bottom }
      } {
        \prop_if_in:cnTF { g__leporello_box_ #2 _prop } { width } {
          \prop_item:cn { g__leporello_box_ #2 _prop } { width }
        } {
          \clist_item:Nn \l_leporello_columns_clist {#1}
        } -
        \prop_item:cn { g__leporello_box_ #2 _prop } { padding ~ left } -
        \prop_item:cn { g__leporello_box_ #2 _prop } { padding ~ right }
      }
    }
  }
  \prop_gput:cne { g__leporello_box_ #2 _prop } { inner ~ height } {
    \dim_eval:n {
      \bool_lazy_or:nnTF {
        \l_leporello_layout_vertical_ltr_bool
      } {
        \l_leporello_layout_vertical_rtl_bool
      } {
        \prop_if_in:cnTF { g__leporello_box_ #2 _prop } { width } {
          \prop_item:cn { g__leporello_box_ #2 _prop } { width }
        } {
          \clist_item:Nn \l_leporello_columns_clist {#1}
        } -
        \prop_item:cn { g__leporello_box_ #2 _prop } { padding ~ left } -
        \prop_item:cn { g__leporello_box_ #2 _prop } { padding ~ right }
      } {
        \prop_if_in:cnTF { g__leporello_box_ #2 _prop } { height } {
          \prop_item:cn { g__leporello_box_ #2 _prop } { height }
        } {
          \l_leporello_layout_height_dim
        } -
        \prop_item:cn { g__leporello_box_ #2 _prop } { padding ~ top } -
        \prop_item:cn { g__leporello_box_ #2 _prop } { padding ~ bottom }
      }
    }
  }
}

% create inner coffin and outer coffin for relevant box on sheet in column
\cs_new_protected:Npn \__leporello_box_construct:nnn #1#2#3 {
  \coffin_if_exist:cF { l__leporello_box_ #1 _ #2 _ #3 _outer_coffin } {
    \coffin_new:c {
      l__leporello_box_ #1 _ #2 _ #3 _inner_coffin
    }
    \vcoffin_set:cnn {
      l__leporello_box_ #1 _ #2 _ #3 _inner_coffin
    } {
      \prop_item:cn { g__leporello_box_ #3 _prop } { inner ~ width }
    } {
      \draw_suspend_begin:
        \int_set:Nn \l_leporello_current_box_int {#3}
        \hook_use:n { leporello / box / begin }
          \vbox_top:n {
            \tl_use:c { g__leporello_box_ #3 _tl }
          }
        \hook_use:n { leporello / box / end }
      \draw_suspend_end:
    }

    \dim_set:Nn \l__leporello_typeset_box_width_dim {
      \prop_if_in:cnTF { g__leporello_box_ #3 _prop } { width } {
        \prop_item:cn { g__leporello_box_ #3 _prop } { width }
      } {
        \bool_lazy_or:nnTF {
          \l_leporello_layout_vertical_ltr_bool
        } {
          \l_leporello_layout_vertical_rtl_bool
        } {
          \coffin_wd:c {
            l__leporello_box_ #1 _ #2 _ #3 _inner_coffin
          } +
          \prop_item:cn { g__leporello_box_ #3 _prop } { padding ~ left } +
          \prop_item:cn { g__leporello_box_ #3 _prop } { padding ~ right }
        } {
          \clist_item:Nn \l_leporello_columns_clist {#2}
        }
      }
    }

    \dim_set:Nn \l__leporello_typeset_box_height_dim {
      \prop_if_in:cnTF { g__leporello_box_ #3 _prop } { height } {
        \prop_item:cn { g__leporello_box_ #3 _prop } { height }
      } {
        \coffin_ht:c {
          l__leporello_box_ #1 _ #2 _ #3 _inner_coffin
        } +
        \coffin_dp:c {
          l__leporello_box_ #1 _ #2 _ #3 _inner_coffin
        } +
        \prop_item:cn { g__leporello_box_ #3 _prop } { padding ~ top } +
        \prop_item:cn { g__leporello_box_ #3 _prop } { padding ~ bottom }
      }
    }

    \bool_if:nT { \prop_item:cn { g__leporello_box_ #3 _prop } { stretch } } {
      \bool_lazy_or:nnTF {
        \l_leporello_layout_vertical_ltr_bool
      } {
        \l_leporello_layout_vertical_rtl_bool
      } {
        \__leporello_box_calculate_stretch_x:Nn
          \l__leporello_typeset_box_stretch_x_dim {#3}
        \dim_set:Nn \l__leporello_typeset_box_width_dim {
          \fp_to_dim:n {
            \clist_item:Nn \l_leporello_columns_clist {#2} -
            (
              \leporello_fp_tuple_use_i:e {
                \prop_item:cn { g__leporello_box_ #3 _prop } { offset }
              }
            )
          }
        }
        \dim_add:Nn \l__leporello_typeset_box_width_dim {
          \l__leporello_typeset_box_stretch_x_dim
        }
      } {
        \__leporello_box_calculate_stretch_y:Nn
          \l__leporello_typeset_box_stretch_y_dim {#3}
        \dim_set:Nn \l__leporello_typeset_box_height_dim {
          \fp_to_dim:n {
            \l_leporello_layout_height_dim -
            (
              \leporello_fp_tuple_use_ii:e {
                \prop_item:cn { g__leporello_box_ #3 _prop } { offset }
              }
            )
          }
        }
        \dim_add:Nn \l__leporello_typeset_box_height_dim {
          \l__leporello_typeset_box_stretch_y_dim
        }
      }
    }

    \dim_zero:N \l__leporello_typeset_box_bleed_x_dim
    \dim_zero:N \l__leporello_typeset_box_bleed_y_dim

    \int_compare:nNnT {#2} = { 1 } {
      \clist_if_in:enT {
        \prop_item:cn { g__leporello_box_ #3 _prop } { bleed }
      } { l } {
        \dim_add:Nn \l__leporello_typeset_box_bleed_x_dim { \l_leporello_bleed_dim }
      }
    }
    \int_compare:nNnT {#2} = { \l_leporello_column_count_int } {
      \clist_if_in:enT {
        \prop_item:cn { g__leporello_box_ #3 _prop } { bleed }
      } { r } {
        \dim_add:Nn \l__leporello_typeset_box_bleed_x_dim { \l_leporello_bleed_dim }
      }
    }
    \dim_add:Nn \tex_hfuzz:D { \l__leporello_typeset_box_bleed_x_dim }

    \clist_if_in:enT {
      \prop_item:cn { g__leporello_box_ #3 _prop } { bleed }
    } { t } {
      \dim_add:Nn \l__leporello_typeset_box_bleed_y_dim { \l_leporello_bleed_dim }
    }
    \clist_if_in:enT {
      \prop_item:cn { g__leporello_box_ #3 _prop } { bleed }
    } { b } {
      \dim_add:Nn \l__leporello_typeset_box_bleed_y_dim { \l_leporello_bleed_dim }
    }
    \dim_add:Nn \tex_vfuzz:D { \l__leporello_typeset_box_bleed_y_dim }

    \coffin_new:c {
      l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
    }
    \vcoffin_set:cnn {
      l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
    } {
      \l__leporello_typeset_box_width_dim +
      \l__leporello_typeset_box_bleed_x_dim
    } {
      \draw_suspend_begin:
        \draw_begin:
          \draw_path_rectangle:nn { 0mm , 0mm } {
            \l__leporello_typeset_box_width_dim +
            \l__leporello_typeset_box_bleed_x_dim ,
            \l__leporello_typeset_box_height_dim +
            \l__leporello_typeset_box_bleed_y_dim
          }
          \str_if_eq:enF {
            \prop_item:cn { g__leporello_box_ #3 _prop } { background ~ color }
          } { none } {
            \group_begin:
              \color_select:e {
                \prop_item:cn { g__leporello_box_ #3 _prop } { background ~ color }
              }
              \draw_path_use:n { fill }
            \group_end:
          }
          \draw_path_use_clear:n { clip }
          \prop_if_in:cnT { g__leporello_box_ #3 _prop } { background ~ code } {
            \vbox_set_top:Ne \l__leporello_box_background_box {
              \prop_item:cn { g__leporello_box_ #3 _prop } { background ~ code }
            }
            \draw_box_use:Nn \l__leporello_box_background_box {
              0mm ,
              \l__leporello_typeset_box_height_dim +
              \l__leporello_typeset_box_bleed_y_dim -
              \box_ht:N \l__leporello_box_background_box
            }
          }
        \draw_end:
      \draw_suspend_end:
    }

    \__leporello_box_update_poles:nnn {#1} {#2} {#3}

    \tl_if_exist:cT { c__leporello_box_ #3 _store_width_tl } {
      \exp_args:NNo \exp_args:No
        \dim_gset:Nn { \use:c { c__leporello_box_ #3 _store_width_tl } } {
          \l__leporello_typeset_box_width_dim
        }
    }
    \tl_if_exist:cT { c__leporello_box_ #3 _store_height_tl } {
      \exp_args:NNo \exp_args:No
        \dim_gset:Nn { \use:c { c__leporello_box_ #3 _store_height_tl } } {
          \l__leporello_typeset_box_height_dim
        }
    }

    \bool_if:NT \l_leporello_show_id_bool {
      \hcoffin_set:Nn \l__leporello_typeset_mark_coffin {
        \__leporello_id_mark:n { #3 }
      }
      \coffin_attach:cnnNnnnn {
        l__leporello_box_ #1 _ #2 _ #3 _inner_coffin
      } { hc } { vc }
        \l__leporello_typeset_mark_coffin
        { hc } { vc } { 0pt } { 0pt }
    }

    \coffin_attach:cencennn {
      l__leporello_box_ #1 _ #2 _ #3 _outer_coffin
    } {
      \bool_if:NTF \l_leporello_layout_vertical_rtl_bool { r } { l }
    } { t } {
      l__leporello_box_ #1 _ #2 _ #3 _inner_coffin
    } {
      \bool_if:NTF \l_leporello_layout_vertical_rtl_bool { r } { l }
    } { t } {
      \bool_if:NTF \l_leporello_layout_vertical_rtl_bool {
        \dim_eval:n {
          - \prop_item:cn { g__leporello_box_ #3 _prop } { padding ~ right }
        }
      } {
        \dim_eval:n {
          \prop_item:cn { g__leporello_box_ #3 _prop } { padding ~ left }
        }
      }
    } {
      \dim_eval:n {
        - \prop_item:cn { g__leporello_box_ #3 _prop } { padding ~ top }
      }
    }

    \__leporello_box_update_poles:nnn {#1} {#2} {#3}
  }
}
\cs_generate_variant:Nn \__leporello_box_construct:nnn { VVn }

% calculate stretch of an outer coffin in a column
\cs_new_protected:Npn \__leporello_box_calculate_stretch_x_aux:Nn #1#2 {
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ parent }
  } { hc } {
    \dim_add:Nn #1 {
      \box_wd:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      } / 2
    }
  }
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ parent }
  } { r } {
    \dim_add:Nn #1 {
      \box_wd:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      }
    }
  }

  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ self }
  } { hc } {
    \dim_sub:Nn #1 {
      \box_wd:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      } / 2
    }
  }
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ self }
  } { r } {
    \dim_sub:Nn #1 {
      \box_wd:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      }
    }
  }

  \int_compare:nNnF {
    \l_leporello_current_column_int
  } = { 1 } {
    \clist_if_in:enT {
      \prop_item:cn { g__leporello_box_
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id }
      _prop } { bleed }
    } { l } {
      \dim_add:Nn #1 { \l_leporello_bleed_dim }
    }
  }
  \int_compare:nNnF {
    \l_leporello_current_column_int
  } = { \l_leporello_column_count_int } {
    \clist_if_in:enT {
      \prop_item:cn { g__leporello_box_
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id }
      _prop } { bleed }
    } { r } {
      \dim_add:Nn #1 { \l_leporello_bleed_dim }
    }
  }

  \dim_add:Nn #1 {
    \fp_to_dim:n {
      \leporello_fp_tuple_use_i:e {
        \prop_item:cn { g__leporello_box_
          \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id }
        _prop } { offset }
      }
    }
  }
}

\cs_new_protected:Npn \__leporello_box_calculate_stretch_y_aux:Nn #1#2 {
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ parent }
  } { vc } {
    \dim_sub:Nn #1 {
      \box_ht:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      } / 2 +
      \box_dp:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      } / 2
    }
  }
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ parent }
  } { b } {
    \dim_sub:Nn #1 {
      \box_ht:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      } +
      \box_dp:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      }
    }
  }

  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ self }
  } { vc } {
    \dim_sub:Nn #1 {
      \box_ht:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      } / 2 +
      \box_dp:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      } / 2
    }
  }
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ self }
  } { b } {
    \dim_sub:Nn #1 {
      \box_ht:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      } +
      \box_dp:c { l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id } _outer_coffin
      }
    }
  }

  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_
      \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id }
    _prop } { bleed }
  } { t } {
    \dim_add:Nn #1 { \l_leporello_bleed_dim }
  }
  \clist_if_in:enT {
    \prop_item:cn { g__leporello_box_
      \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id }
    _prop } { bleed }
  } { b } {
    \dim_add:Nn #1 { \l_leporello_bleed_dim }
  }

  \dim_add:Nn #1 {
    \fp_to_dim:n {
      \leporello_fp_tuple_use_ii:e {
        \prop_item:cn { g__leporello_box_
          \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id }
        _prop } { offset }
      }
    }
  }
}

\cs_new_protected:Npn \__leporello_box_calculate_stretch_x:Nn #1#2 {
  \dim_zero:N #1
  \clist_if_in:NnT \g__leporello_child_boxes_clist {#2} {
    \__leporello_box_calculate_stretch_x:Ne #1 {
      \prop_item:Nn \g__leporello_box_names_prop {
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id }
      }
    }
    \__leporello_box_calculate_stretch_x_aux:Nn #1 {#2}
  }
}
\cs_generate_variant:Nn \__leporello_box_calculate_stretch_x:Nn { Ne }

\cs_new_protected:Npn \__leporello_box_calculate_stretch_y:Nn #1#2 {
  \dim_zero:N #1
  \clist_if_in:NnT \g__leporello_child_boxes_clist {#2} {
    \__leporello_box_calculate_stretch_y:Ne #1 {
      \prop_item:Nn \g__leporello_box_names_prop {
        \prop_item:cn { g__leporello_box_ #2 _prop } { parent ~ id }
      }
    }
    \__leporello_box_calculate_stretch_y_aux:Nn #1 {#2}
  }
}
\cs_generate_variant:Nn \__leporello_box_calculate_stretch_y:Nn { Ne }

% position outer coffins with boxes in the relevant column
\cs_new_protected:Npn \__leporello_boxes_attach:nn #1#2 {
  \clist_if_in:enTF {
    \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ self }
  } { b } {
    \int_set:Nn \l__leporello_typeset_coffin_attach_align_int { 1 }
  } {
    \int_set:Nn \l__leporello_typeset_coffin_attach_align_int { -1 }
  }

  \coffin_attach:ceeceeee {
    \int_compare:nNnTF {#1} = { 0 } {
      l__leporello_current_column_coffin
    } {
      l__leporello_box_
        \int_use:N \g_leporello_current_sheet_int _
        \int_use:N \l_leporello_current_column_int _
        #1 _outer_coffin
    }
  } {
    \clist_item:en {
      \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ parent }
    } { 1 }
  } {
    \clist_item:en {
      \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ parent }
    } { 2 }
  } {
    l__leporello_box_
      \int_use:N \g_leporello_current_sheet_int _
      \int_use:N \l_leporello_current_column_int _
      #2 _outer_coffin
  } {
    \clist_item:en {
      \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ self }
    } { 1 }
  } {
    \clist_item:en {
      \prop_item:cn { g__leporello_box_ #2 _prop } { align ~ self }
    } { 2 }
  } {
    \fp_to_dim:n {
      \leporello_fp_tuple_use_i:e {
        \prop_item:cn { g__leporello_box_ #2 _prop } { offset }
      }
    }
  } {
    \fp_to_dim:n {
      (
        \leporello_fp_tuple_use_ii:e {
          \prop_item:cn { g__leporello_box_ #2 _prop } { offset }
        }
      ) * \l__leporello_typeset_coffin_attach_align_int
    }
  }

  \int_compare:nNnF {#1} = { 0 } {
    \__leporello_box_update_poles:VVn
      \g_leporello_current_sheet_int
      \l_leporello_current_column_int
      {#1}
  }
}

% set the order of positioning of boxes to account for positioning relative to other boxes
\cs_new_protected:Npn \__leporello_box_attach_children:n #1 {
  \clist_if_exist:cT { g__leporello_box_ #1 _children_clist } {
    \clist_map_inline:cn { g__leporello_box_ #1 _children_clist } {
      \__leporello_box_construct:VVn
        \g_leporello_current_sheet_int
        \l_leporello_current_column_int
        {##1}
      \__leporello_box_attach_children:n {##1}
    }
    \clist_map_inline:cn { g__leporello_box_ #1 _children_clist } {
      \__leporello_boxes_attach:nn {#1} {##1}
    }
  }
}

% store contents of box in token variable
\cs_new_protected:Npn \__leporello_box_store:nn #1#2 {
  \tl_if_exist:cF { g__leporello_box_ #1 _tl } {
    \tl_new:c { g__leporello_box_ #1 _tl }
  }
  \tl_gput_right:cn { g__leporello_box_ #1 _tl } {
    \int_set:Nn \l_leporello_current_box_int {#1}
    \prop_item:cn { g__leporello_box_ #1 _prop } { pre }
    #2
  }
}
\cs_generate_variant:Nn \__leporello_box_store:nn { Vn }

% typeset columns to a sheet
\cs_new_protected:Npn \__leporello_typeset_columns:n #1 {
  \int_gincr:N \g_leporello_current_sheet_int

  \bool_if:NT \l_leporello_typeset_alternate_layout_bool {
    \int_if_even:nT { \g_leporello_current_sheet_int } {
      \bool_set_inverse:N \l_leporello_typeset_reverse_layout_bool
    }
  }

  \bool_if:NT \l_leporello_typeset_reverse_layout_bool {
    \clist_reverse:N \l_leporello_columns_clist
  }

  \draw_begin:
    \bool_set_false:N \l_draw_bb_update_bool
    \clist_map_inline:nn {#1} {
      \bool_if:NTF \l_leporello_typeset_reverse_order_bool {
        \dim_sub:Nn \l__leporello_current_column_offset_dim {
          \clist_item:NV \l_leporello_columns_clist
            \l_leporello_current_column_int
        }
      } {
        \int_incr:N \l_leporello_current_column_int
      }

      \str_if_eq:nnF {##1} { . } {
        \tl_if_exist:cF { g_leporello_column_ ##1 _tl } {
          \msg_error:nnn { leporello } { column-undefined } {##1}
        }
      }

      \vcoffin_set:Nnn \l__leporello_current_column_coffin {
        \clist_item:NV \l_leporello_columns_clist
            \l_leporello_current_column_int
      } {
        \draw_suspend_begin:
          \draw_begin:
            \draw_path_rectangle:nn { 0mm , 0mm } {
              \clist_item:NV \l_leporello_columns_clist
                \l_leporello_current_column_int ,
              \l_leporello_layout_height_dim
            }
            \draw_path_use_clear:n { clip }
            \str_if_eq:nnF {##1} { . } {
              \vbox_set_top:Nn \l__leporello_typeset_column_box {
                \draw_suspend_begin:
                  \hook_use:n { leporello / column / begin }
                    \__leporello_box_page_gset:VV
                      \g_leporello_current_sheet_int
                      \l_leporello_current_column_int
                    \tl_use:c { g_leporello_column_ ##1 _tl }
                  \hook_use:n { leporello / column / end }
                \draw_suspend_end:
              }
              \draw_box_use:N \l__leporello_typeset_column_box
            }
          \draw_end:
        \draw_suspend_end:
      }

      \str_if_eq:nnF {##1} { . } {
        \clist_map_inline:cn { g_leporello_column_ ##1 _boxes_clist } {
          \__leporello_box_construct:VVn
            \g_leporello_current_sheet_int
            \l_leporello_current_column_int
            {####1}
          \__leporello_box_attach_children:n {####1}
        }
        \clist_map_inline:cn { g_leporello_column_ ##1 _boxes_clist } {
          \clist_if_in:NnF \g__leporello_child_boxes_clist {####1} {
            \__leporello_boxes_attach:nn { 0 } {####1}
          }
        }
      }

      \draw_coffin_use:Nnnn \l__leporello_current_column_coffin
        { l } { t } { \l__leporello_current_column_offset_dim , 0mm }

      \bool_if:NTF \l_leporello_typeset_reverse_order_bool {
        \int_decr:N \l_leporello_current_column_int
      } {
        \dim_add:Nn \l__leporello_current_column_offset_dim {
          \clist_item:NV \l_leporello_columns_clist
            \l_leporello_current_column_int
        }
      }
    }

    \bool_if:NT \l_leporello_show_frames_bool {
      \dim_zero:N \l__leporello_current_column_offset_dim
      \clist_map_inline:Nn \l_leporello_columns_clist {
        \draw_path_rectangle:nn {
          \l__leporello_current_column_offset_dim , 0mm
        } {
          ##1 ,
          - \l_leporello_layout_height_dim
        }
        \draw_path_use_clear:n { stroke }
        \dim_add:Nn \l__leporello_current_column_offset_dim {
          ##1
        }
      }
    }
  \draw_end:
  \tex_par:D
  \skip_vertical:n { 0pt plus 1fill }
  \tex_penalty:D -10000
}
\cs_generate_variant:Nn \__leporello_typeset_columns:n { V }

% typeset columns to sheets
\cs_new_protected:Npn \leporello_typeset_columns:nn #1#2 {
  \group_begin:
    \hook_use:n { leporello / typeset / before }
    \keys_set:nn { leporello / typeset } {#1}

    \bool_if:NTF \l_leporello_typeset_reverse_order_bool {
      \int_set:Nn \l_leporello_current_column_int {
        \l_leporello_column_count_int
      }
      \dim_zero:N \l__leporello_current_column_offset_dim
      \clist_map_inline:Nn \l_leporello_columns_clist {
        \dim_add:Nn \l__leporello_current_column_offset_dim {##1}
      }
    } {
      \int_zero:N \l_leporello_current_column_int
      \dim_zero:N \l__leporello_current_column_offset_dim
    }

    \int_zero:N \l__leporello_typeset_column_int
    \int_set:Nn \l__leporello_typeset_page_int { 1 }
    \clist_map_inline:nn {#2} {
      \int_compare:nNnF {
        \l__leporello_typeset_column_int
      } < {
        \l_leporello_column_count_int
      } {
        \int_zero:N \l__leporello_typeset_column_int
        \int_incr:N \l__leporello_typeset_page_int
      }
      \int_incr:N \l__leporello_typeset_column_int
      \str_if_eq:nnF {##1} { . } {
        \clist_map_inline:cn { g_leporello_column_ ##1 _boxes_clist } {
          \prop_put:NnV \l__leporello_typeset_boxes_to_sheets_prop
            {####1}
            \l__leporello_typeset_page_int
          \prop_put:NnV \l__leporello_typeset_boxes_to_columns_prop
            {####1}
            \l__leporello_typeset_column_int
        }
      }
    }

    \group_begin:
      \hook_use:n { leporello / break-flow / before }
      \int_step_inline:nn { \g__leporello_box_int } {
        \bool_lazy_and:nnT {
          \prop_if_in_p:Nn \l__leporello_typeset_boxes_to_sheets_prop {##1}
        } {
          \prop_if_in_p:Nn \l__leporello_typeset_boxes_to_columns_prop {##1}
        } {
          \__leporello_box_measure:nn {
            \prop_item:Nn \l__leporello_typeset_boxes_to_columns_prop {##1}
          } {##1}
        }
      }
      \int_step_inline:nn { \g__leporello_box_int } {
        \bool_lazy_and:nnT {
          \prop_if_in_p:Nn \l__leporello_typeset_boxes_to_sheets_prop {##1}
        } {
          \prop_if_in_p:Nn \l__leporello_typeset_boxes_to_columns_prop {##1}
        } {
          \__leporello_break_flow:een {
            \prop_item:Nn \l__leporello_typeset_boxes_to_sheets_prop {##1}
          } {
            \prop_item:Nn \l__leporello_typeset_boxes_to_columns_prop {##1}
          } {##1}
        }
      }
      \__leporello_break_gset_boxes:
      \hook_use:n { leporello / break-flow / after }
    \group_end:

    \int_zero:N \l__leporello_typeset_column_int
    \clist_clear:N \l__leporello_typeset_temp_clist
    \clist_map_inline:nn {#2} {
      \int_compare:nNnTF {
        \l__leporello_typeset_column_int
      } < {
        \l_leporello_column_count_int
      } {
        \clist_put_right:Nn \l__leporello_typeset_temp_clist {##1}
      } {
        \__leporello_typeset_columns:V \l__leporello_typeset_temp_clist
        \clist_clear:N \l__leporello_typeset_temp_clist
        \clist_put_right:Nn \l__leporello_typeset_temp_clist {##1}
        \int_zero:N \l__leporello_typeset_column_int
      }
      \int_incr:N \l__leporello_typeset_column_int
    }
    \clist_if_empty:NF \l__leporello_typeset_temp_clist {
      \__leporello_typeset_columns:V \l__leporello_typeset_temp_clist
    }

    \hook_use:n { leporello / typeset / after }
  \group_end:
}

% ===

% initialize document and layout settings
\hook_gput_code:nnn { begindocument / before } { . } {
  \leporello_pagestyle_set:n { empty }

  \dim_set:Nn \l_leporello_paper_height_dim {
    \l_leporello_layout_height_dim + 2 \l_leporello_info_area_dim
  }
  \dim_set:Nn \l_leporello_paper_width_dim {
    \l_leporello_layout_width_dim + 2 \l_leporello_info_area_dim
  }

  \clist_map_inline:nn {
    hoffset ,
    voffset ,
    headheight ,
    headsep ,
    footskip ,
    marginparwidth ,
    marginparsep ,
    marginparpush
  } {
    \use:c { leporello_ltlayout_ #1 _set:n } { 0pt }
  }
  \clist_map_inline:nn {
    topmargin ,
    oddsidemargin ,
    evensidemargin
  } {
    \use:c { leporello_ltlayout_ #1 _set:n } { -1in }
  }

  \leporello_ltlayout_paperwidth_set:n { \l_leporello_layout_width_dim }
  \leporello_ltlayout_paperheight_set:n { \l_leporello_layout_height_dim }
  \leporello_ltlayout_textwidth_set:n { \l_leporello_layout_width_dim }
  \leporello_ltlayout_textheight_set:n { \l_leporello_layout_height_dim }

  \bool_if:NT \l_leporello_prepress_bool {
    \clist_map_inline:nn {
      topmargin ,
      oddsidemargin ,
      evensidemargin
    } {
      \use:c { leporello_ltlayout_ #1 _set:n } {
        \l_leporello_info_area_dim - 1in
      }
    }

    \leporello_ltlayout_paperwidth_set:n { \l_leporello_paper_width_dim }
    \leporello_ltlayout_paperheight_set:n { \l_leporello_paper_height_dim }

    \hook_gput_code:nnn { shipout / foreground } { . } {
      \__leporello_cropmarks:
      \dim_set:Nn \l__leporello_current_column_offset_dim {
        \l_leporello_info_area_dim
      }
      \__leporello_cropmarks:n { \l__leporello_current_column_offset_dim }
      \clist_map_inline:Nn \l_leporello_columns_clist {
        \dim_add:Nn \l__leporello_current_column_offset_dim {
          #1
        }
        \__leporello_cropmarks:n { \l__leporello_current_column_offset_dim }
      }
    }
  }

  \skip_zero:N \tex_topskip:D
  \dim_zero:N \tex_parindent:D
}

% initiate auto typesetting mechanism
\hook_gput_code:nnn { enddocument } { . } {
  \bool_if:NT \l_leporello_auto_typeset_bool {
    \clist_if_empty:NF \g__leporello_auto_typeset_clist {
      \leporello_typeset_columns:nV { } \g__leporello_auto_typeset_clist
    }
  }
}

% ===

\NewDocumentEnvironment { leporellocolumn } { m +b } {
  \clist_new:c { g_leporello_column_ #1 _boxes_clist }
  \tl_if_exist:cF { g_leporello_column_ #1 _tl } {
    \tl_new:c { g_leporello_column_ #1 _tl }
  }
  \group_begin:
    \str_set:Nn \l_leporello_current_column_str {#1}
    #2
  \group_end:
  \bool_if:NT \l_leporello_auto_typeset_bool {
    \clist_gput_right:Nn \g__leporello_auto_typeset_clist {#1}
  }
} { }

\NewDocumentEnvironment { leporellobox } { O{} +b } {
  \group_begin:
    \int_gincr:N \g__leporello_box_int

    \str_if_empty:NT \l_leporello_current_column_str {
      \msg_error:nnV { leporello } { box-outside-column }
        \g__leporello_box_int
    }

    \clist_gput_right:cV {
      g_leporello_column_ \str_use:N \l_leporello_current_column_str _boxes_clist
    } \g__leporello_box_int

    \prop_new:c { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
    \keys_set:nn { leporello / box } {#1}
    \prop_gput:cne { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { align ~ parent }
      { \clist_use:Nn \l__leporello_box_align_parent_clist { , } }
    \prop_gput:cne { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { align ~ self }
      { \clist_use:Nn \l__leporello_box_align_self_clist { , } }
    \prop_gput:cno { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { offset }
      { \l__leporello_box_offset_tuple_tl }
    \bool_if:NT \l__leporello_box_width_bool {
      \prop_gput:cnV { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
        { width }
        \l__leporello_box_width_dim
    }
    \bool_if:NT \l__leporello_box_height_bool {
      \prop_gput:cnV { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
        { height }
        \l__leporello_box_height_dim
    }
    \prop_gput:cne { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { stretch }
      { \bool_if_p:N \l__leporello_box_stretch_bool }
    \prop_gput:cnV { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { padding ~ left }
      \l__leporello_box_padding_left_dim
    \prop_gput:cnV { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { padding ~ right }
      \l__leporello_box_padding_right_dim
    \prop_gput:cnV { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { padding ~ top }
      \l__leporello_box_padding_top_dim
    \prop_gput:cnV { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { padding ~ bottom }
      \l__leporello_box_padding_bottom_dim
    \prop_gput:cno { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { pre }
      { \l__leporello_box_pre_tl }
    \prop_gput:cnV { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { background ~ color }
      \l__leporello_box_background_color_tl
    \prop_gput:cno { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { background ~ code }
      { \l__leporello_box_background_code_tl }
    \prop_gput:cne { g__leporello_box_ \int_use:N \g__leporello_box_int _prop }
      { bleed }
      { \clist_use:Nn \l__leporello_box_bleed_clist { , } }

    \tl_if_empty:NF \l__leporello_box_store_width_tl {
      \tl_const:co {
        c__leporello_box_ \int_use:N \g__leporello_box_int _store_width_tl
      } {
        \l__leporello_box_store_width_tl
      }
      \exp_args:No \tl_if_empty:NF { \l__leporello_box_store_width_tl } {
        \exp_args:No \dim_new:N { \l__leporello_box_store_width_tl }
      }
    }
    \tl_if_empty:NF \l__leporello_box_store_height_tl {
      \tl_const:co {
        c__leporello_box_ \int_use:N \g__leporello_box_int _store_height_tl
      } {
        \l__leporello_box_store_height_tl
      }
      \exp_args:No \tl_if_empty:NF { \l__leporello_box_store_height_tl } {
        \exp_args:No \dim_new:N { \l__leporello_box_store_height_tl }
      }
    }
  \group_end:

  \__leporello_box_store:Vn \g__leporello_box_int {#2}
} { }

\NewDocumentCommand { \leporelloset } { o m } {
  \IfValueTF {#1} {
    \keys_set_exclude_groups:nnn { leporello / #1 } { local } {#2}
  } {
    \keys_set_exclude_groups:nnn { leporello } { local } {#2}
  }
}

\NewDocumentCommand { \leporellosetstyle } { o m m } {
  \IfValueTF {#1} {
    \keys_define:nn { leporello / #1 } {
      #2  .meta:n = {#3}
    }
  } {
    \keys_define:nn { leporello } {
      #2  .meta:n = {#3}
    }
  }
}

\NewDocumentCommand { \leporellotypesetcolumns } { O{} m } {
  \leporello_typeset_columns:nn {#1} {#2}
}

\cs_new_protected:Npn \__leporello_break_box: {
  \tex_par:D
  \__leporello_break_gstore_remaining_space:
  \skip_vertical:n { 0pt plus 1fill }
  \tex_penalty:D -10000
}

\hook_gput_code:nnn { leporello / break-flow / before } { . } {
  \RenewDocumentCommand { \pagebreak } { o } {
    \group_begin:
      \__leporello_break_box:
    \group_end:
  }
}

% inspired by the flowfram package by Nicola Talbot
\NewDocumentCommand { \leporelloboxbreak } { } {
  \group_begin:
    \skip_zero:N \tex_parfillskip:D
    \__leporello_break_box:
  \group_end:
}

\NewDocumentCommand { \leporellolayoutheight } { } {
  \dim_use:N \l_leporello_layout_height_dim
}

\NewDocumentCommand { \leporelloboxwidth } { } {
  \dim_use:N \l__leporello_typeset_box_width_dim
}

\NewDocumentCommand { \leporellobleed } { } {
  \dim_use:N \l_leporello_bleed_dim
}

\NewDocumentCommand { \leporellocolordefine } { m m m } {
  \color_set:nnn {#1} {#2} {#3}
}

\NewDocumentCommand { \leporellocolorselect } { m } {
  \color_select:n {#1}
}

\NewDocumentCommand { \leporelloimage } { O{} m } {
  \leporello_typeset_image:nn {#1} {#2}
}

% ===

\hook_gput_code:nnn { label } { . } {
  \cs_set:Npn \protected@write #1#2#3 {
    \iow_now:Ne #1 {#3}
  }
  \tl_set:Nn \thepage {
    \int_use:N \g_leporello_current_page_int
  }
}

% ===

\int_new:N \g_leporello_notes_int
\str_new:N \l_leporello_notes_list_style_str
\seq_new:N \g__leporello_notes_seq

\cs_new:Npn \leporello_note_mark:n #1 {
  \leporello_text_superscript:n { \int_use:N #1 }
}

\keys_define:nn { leporello } {
  notes             .code:n       = {
    \keys_set:nn { leporello / notes } {#1}
  }
}

\keys_define:nn { leporello / notes } {
  mark ~ cmd        .code:n       = {
    \cs_set_eq:NN \leporello_note_mark:n #1
  } ,
  list ~ style      .str_set:N    = \l_leporello_notes_list_style_str ,
  list ~ style      .initial:n    = { enumerate }
}

\NewDocumentCommand { \leporellonote } { o m } {
  \IfValueTF {#1} {
    \int_gset:Nn \g_leporello_notes_int {#1}
  } {
    \int_gincr:N \g_leporello_notes_int
  }
  \seq_gput_right:Nn \g__leporello_notes_seq {#2}
  \leporello_note_mark:n { \g_leporello_notes_int }
}

\NewDocumentCommand { \leporelloprintnotes } { } {
  \seq_if_empty:NF \g__leporello_notes_seq {
    \begin { \str_use:N \l_leporello_notes_list_style_str }
      \seq_map_tokens:Nn \g__leporello_notes_seq { \item }
    \end { \str_use:N \l_leporello_notes_list_style_str }
    \seq_gclear:N \g__leporello_notes_seq
  }
}

% EOF