%%
%% This is file `xdupgthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% xduts.dtx  (with options: `class,thesis,xdupgthesis')
%% 
%% Copyright 2022--2025 by @note286 in GitHub and CTAN
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `author-maintained'.
%% 
%% The Current Maintainer of this work is @note286 in GitHub and CTAN.
%% 
%% This work consists of the files README.md, xduts.dtx, and xduts.ins
%% and the derived files xduts.pdf, xdufont.sty,
%% xduugtp.cls, xduugthesis.cls, and xdupgthesis.cls.
%% 
%% The copyright of xdulogo.pdf is Xidian University.
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplClass{xdupgthesis}
  {2025/04/26}{6.2.7.2}
  {Xidian University Postgraduate Thesis document class}
\RequirePackage { xparse, l3keys2e }
\PassOptionsToPackage { no-math } { fontspec }
\PassOptionsToPackage { quiet } { xeCJK }
\PassOptionsToClass
  {
    a4paper,
    zihao=-4,
    sub4section,
    fontset    = none
  }
  { ctexbook }
\LoadClass { ctexbook }
\RequirePackage { geometry        }
\geometry       { paper = a4paper }
\RequirePackage { fancyhdr        }
\RequirePackage { xeCJKfntef      }
\RequirePackage { graphicx        }
\tl_new:N \l__xdu_cjk_font_tl
\tl_new:N \l__xdu_fake_bold_tl
\tl_new:N \l__xdu_fake_slant_tl
\tl_new:N \l__xdu_latin_font_tl
\tl_new:N \l__xdu_latin_sans_scale_tl
\tl_new:N \l__xdu_latin_mono_scale_tl
\tl_new:N \l__xdu_math_font_tl
\tl_new:N \l__xdu_unicode_math_tl
\tl_new:N \l__xdu_font_type_tl
\tl_new:N \l__xdu_font_path_tl
\keys_define:nn { xdu / style }
  {
    cjk-font .choices:nn =
      { win, adobe, founder, hanyi, sinotype, fandol, none }
      { \tl_set_eq:NN \l__xdu_cjk_font_tl \l_keys_choice_tl },
    cjk-fake-bold .tl_set:N = \l__xdu_fake_bold_tl,
    cjk-fake-slant .tl_set:N = \l__xdu_fake_slant_tl,
    latin-sans-scale .choices:nn = { upper, lower, off }
      { \tl_set_eq:NN \l__xdu_latin_sans_scale_tl \l_keys_choice_tl },
    latin-mono-scale .choices:nn = { upper, lower, off }
      { \tl_set_eq:NN \l__xdu_latin_mono_scale_tl \l_keys_choice_tl },
    latin-font .choices:nn = { gyre, tac, tacn, tcc, thcs, tll, none }
      { \tl_set_eq:NN \l__xdu_latin_font_tl \l_keys_choice_tl },
    math-font .choices:nn =
      {
        asana, bonum, cambria, cm, concrete, dejavu, erewhon, euler,
        fira, garamond, gfsneohellenic, kp, libertinus, lm, newcm,
        pagella, schola, stix, stix2, termes, xcharter, xits, none
      }
      { \tl_set_eq:NN \l__xdu_math_font_tl \l_keys_choice_tl },
    unicode-math .tl_set:N = \l__xdu_unicode_math_tl,
    font-type .choices:nn = { font, file }
      { \tl_set_eq:NN \l__xdu_font_type_tl \l_keys_choice_tl },
    font-path .tl_set:N = \l__xdu_font_path_tl
  }
\keys_set:nn { xdu }
  {
    style / cjk-font         = fandol,
    style / cjk-fake-bold    = 3,
    style / cjk-fake-slant   = 0.2,
    style / latin-font       = gyre,
    style / latin-sans-scale = off,
    style / latin-mono-scale = off,
    style / math-font        = cm,
    style / unicode-math     = { },
    style / font-type        = font,
    style / font-path        = fonts
  }
\cs_new:Npn \__xdu_select_font:nn #1#2
  {
    \str_if_eq:NNTF { \l__xdu_font_type_tl } { font }
      { #1 }
      { #2 }
  }
\cs_new:Npn \__xdu_font_path:
  {
    \str_if_eq:NNTF { \l__xdu_font_type_tl } { font }
      { }
      { Path = \l__xdu_font_path_tl / , }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_sub_b:n #1
  {
    BoldFont = { #1 }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_sub_fb:n #1
  {
    BoldFont     = { #1 },
    BoldFeatures = { FakeBold = \l__xdu_fake_bold_tl }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_sub_fs:n #1
  {
    SlantedFont     = { #1 },
    SlantedFeatures = { FakeSlant = \l__xdu_fake_slant_tl }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_sub_fbfs:n #1
  {
    BoldSlantedFont     = { #1 },
    BoldSlantedFeatures =
      {
        FakeBold  = \l__xdu_fake_bold_tl,
        FakeSlant = \l__xdu_fake_slant_tl
      }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_sub_bfs:n #1
  {
    BoldSlantedFont     = { #1 },
    BoldSlantedFeatures = { FakeSlant = \l__xdu_fake_slant_tl }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_sub_i:n #1
  {
    ItalicFont = { #1 }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_sub_fi:n #1
  {
    ItalicFont     = { #1 },
    ItalicFeatures = { FakeSlant = \l__xdu_fake_slant_tl }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_sub_ifb:n #1
  {
    BoldItalicFont     = { #1 },
    BoldItalicFeatures = { FakeBold = \l__xdu_fake_bold_tl }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_sub_fifb:n #1
  {
    BoldItalicFont     = { #1 },
    BoldItalicFeatures =
      {
        FakeBold  = \l__xdu_fake_bold_tl,
        FakeSlant = \l__xdu_fake_slant_tl
      }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_r:n #1
  {
    \__xdu_cfg_cjk_font_sub_fb:n   { #1 },
    \__xdu_cfg_cjk_font_sub_fs:n   { #1 },
    \__xdu_cfg_cjk_font_sub_fbfs:n { #1 },
    \__xdu_cfg_cjk_font_sub_fi:n   { #1 },
    \__xdu_cfg_cjk_font_sub_fifb:n { #1 }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_rb:nn #1#2
  {
    \__xdu_cfg_cjk_font_sub_b:n    { #2 },
    \__xdu_cfg_cjk_font_sub_fs:n   { #1 },
    \__xdu_cfg_cjk_font_sub_bfs:n  { #2 },
    \__xdu_cfg_cjk_font_sub_fi:n   { #1 },
    \__xdu_cfg_cjk_font_sub_fifb:n { #1 }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_ri:nn #1#2
  {
    \__xdu_cfg_cjk_font_sub_fb:n   { #1 },
    \__xdu_cfg_cjk_font_sub_fs:n   { #1 },
    \__xdu_cfg_cjk_font_sub_fbfs:n { #1 },
    \__xdu_cfg_cjk_font_sub_i:n    { #2 },
    \__xdu_cfg_cjk_font_sub_ifb:n  { #2 }
  }
\cs_new:Npn \__xdu_cfg_cjk_font_rbi:nnn #1#2#3
  {
    \__xdu_cfg_cjk_font_sub_b:n   { #2 },
    \__xdu_cfg_cjk_font_sub_fs:n  { #1 },
    \__xdu_cfg_cjk_font_sub_bfs:n { #2 },
    \__xdu_cfg_cjk_font_sub_i:n   { #3 },
    \__xdu_cfg_cjk_font_sub_ifb:n { #3 }
  }
\cs_new:Npn \__xdu_set_cjk_main_font:nn #1#2
  {
    \setCJKmainfont { #1 }
      [ \__xdu_font_path: \__xdu_cfg_cjk_font_ri:nn { #1 } { #2 } ]
  }
\cs_new:Npn \__xdu_set_cjk_main_font:nnn #1#2#3
  {
    \setCJKmainfont { #1 }
      [ \__xdu_font_path: \__xdu_cfg_cjk_font_rbi:nnn { #1 } { #2 } { #3 } ]
  }
\cs_new:Npn \__xdu_set_cjk_sans_font:n #1
  {
    \setCJKsansfont { #1 }
      [ \__xdu_font_path: \__xdu_cfg_cjk_font_r:n { #1 } ]
  }
\cs_new:Npn \__xdu_set_cjk_sans_font:nn #1#2
  {
    \setCJKsansfont { #1 }
      [ \__xdu_font_path: \__xdu_cfg_cjk_font_rb:nn { #1 } { #2 } ]
  }
\cs_new:Npn \__xdu_set_cjk_mono_font:n #1
  {
    \setCJKmonofont { #1 }
      [ \__xdu_font_path: \__xdu_cfg_cjk_font_r:n { #1 } ]
  }
\cs_new:Npn \__xdu_load_cjk_font_win:
  {
    \__xdu_set_cjk_main_font:nn
      { \__xdu_select_font:nn { SimSun   } { simsun.ttc  } }
      { \__xdu_select_font:nn { KaiTi    } { simkai.ttf  } }
    \__xdu_set_cjk_sans_font:n
      { \__xdu_select_font:nn { SimHei   } { simhei.ttf  } }
    \__xdu_set_cjk_mono_font:n
      { \__xdu_select_font:nn { FangSong } { simfang.ttf } }
  }
\cs_new:Npn \__xdu_load_cjk_font_adobe:
  {
    \__xdu_set_cjk_main_font:nn
      { \__xdu_select_font:nn { Adobe~Song~Std     } { adobesongstd-light.otf        } }
      { \__xdu_select_font:nn { Adobe~Kaiti~Std    } { adobekaitistd-regular.otf     } }
    \__xdu_set_cjk_sans_font:n
      { \__xdu_select_font:nn { Adobe~Heiti~Std    } { adobeheitistd-regular.otf     } }
    \__xdu_set_cjk_mono_font:n
      { \__xdu_select_font:nn { Adobe~Fangsong~Std } { Adobe-Fangsong-Std-R-Font.otf } }
  }
\cs_new:Npn \__xdu_load_cjk_font_founder:
  {
    \__xdu_set_cjk_main_font:nn
      { \__xdu_select_font:nn { FZShuSong-Z01  } { FZShuSong-Z01.ttf } }
      { \__xdu_select_font:nn { FZKai-Z03      } { FZKai-Z03.ttf     } }
    \__xdu_set_cjk_sans_font:n
      { \__xdu_select_font:nn { FZHei-B01      } { FZHei-B01.ttf     } }
    \__xdu_set_cjk_mono_font:n
      { \__xdu_select_font:nn { FZFangSong-Z02 } { FZFSK.TTF         } }
  }
\cs_new:Npn \__xdu_load_cjk_font_hanyi:
  {
    \__xdu_set_cjk_main_font:nn
      { \__xdu_select_font:nn { HYShuSongErS } { HYShuSongErS.ttf  } }
      { \__xdu_select_font:nn { HYKaiTiS     } { HYKaiTiS.ttf      } }
    \__xdu_set_cjk_sans_font:n
      { \__xdu_select_font:nn { HYZhongHei   } { HYZhongHeiTiS.ttf } }
    \__xdu_set_cjk_mono_font:n
      { \__xdu_select_font:nn { HYFangSongS  } { HYFangSongS.ttf   } }
  }
\cs_new:Npn \__xdu_load_cjk_font_sinotype:
  {
    \__xdu_set_cjk_main_font:nn
      { \__xdu_select_font:nn { STSong     } { STSONG.TTF   } }
      { \__xdu_select_font:nn { STKaiti    } { STKAITI.TTF  } }
    \__xdu_set_cjk_sans_font:nn
      { \__xdu_select_font:nn { STXihei    } { STXIHEI.TTF  } }
      { \__xdu_select_font:nn { STHeiti    } { STHeiti.ttf  } }
    \__xdu_set_cjk_mono_font:n
      { \__xdu_select_font:nn { STFangsong } { STFANGSO.TTF } }
  }
\cs_new:Npn \__xdu_load_cjk_font_fandol:
  {
    \__xdu_set_cjk_main_font:nnn
      { FandolSong-Regular.otf }
      { FandolSong-Bold.otf    }
      { FandolKai-Regular.otf  }
    \__xdu_set_cjk_sans_font:nn
      { FandolHei-Regular.otf  }
      { FandolHei-Bold.otf     }
    \__xdu_set_cjk_mono_font:n
      { FandolFang-Regular.otf }
  }
\cs_new:Npn \__xdu_load_cjk_font_none: { }
\cs_new:Npn \__xdu_set_latin_font:nnn #1#2#3
  {
    BoldFont        = { #1 },
    SlantedFont     = { #2 },
    BoldSlantedFont = { #3 },
    ItalicFont      = { #2 },
    BoldItalicFont  = { #3 }
  }
\cs_new:Npn \__xdu_set_latin_sans_scale: { }
\cs_new:Npn \__xdu_set_latin_mono_scale: { }
\ctex_at_end_preamble:n
  {
    \tl_if_eq:NnTF \l__xdu_latin_sans_scale_tl { upper }
      { \cs_set:Npn \__xdu_set_latin_sans_scale: { Scale = MatchUppercase , } }
      {
        \tl_if_eq:NnT \l__xdu_latin_sans_scale_tl { lower }
          { \cs_set:Npn \__xdu_set_latin_sans_scale: { Scale = MatchLowercase , } }
      }
    \tl_if_eq:NnTF \l__xdu_latin_mono_scale_tl { upper }
      { \cs_set:Npn \__xdu_set_latin_mono_scale: { Scale = MatchUppercase , } }
      {
        \tl_if_eq:NnT \l__xdu_latin_mono_scale_tl { lower }
          { \cs_set:Npn \__xdu_set_latin_mono_scale: { Scale = MatchLowercase , } }
      }
  }
\cs_new:Npn \__xdu_off_latin_ligatures:
  { Ligatures = CommonOff , }
\cs_new:Npn \__xdu_set_latin_main_font:nnnnn #1#2#3#4#5
  {
    \str_if_eq:NNTF { \l__xdu_font_type_tl } { font }
      { \setmainfont { #1 } }
      {
        \setmainfont { #2 }
          [
            \__xdu_font_path:
            \__xdu_set_latin_font:nnn { #3 } { #4 } { #5 }
          ]
      }
  }
\cs_new:Npn \__xdu_set_latin_sans_font:nnnnn #1#2#3#4#5
  {
    \str_if_eq:NNTF { \l__xdu_font_type_tl } { font }
      { \setsansfont { #1 } [ \__xdu_set_latin_sans_scale: ] }
      {
        \setsansfont { #2 }
          [
            \__xdu_font_path:
            \__xdu_set_latin_sans_scale:
            \__xdu_set_latin_font:nnn { #3 } { #4 } { #5 }
          ]
      }
  }
\cs_new:Npn \__xdu_set_latin_mono_font:nnnnn #1#2#3#4#5
  {
    \str_if_eq:NNTF { \l__xdu_font_type_tl } { font }
      { \setmonofont { #1 } [ \__xdu_set_latin_mono_scale: \__xdu_off_latin_ligatures: ] }
      {
        \setmonofont { #2 }
          [
            \__xdu_font_path:
            \__xdu_set_latin_mono_scale:
            \__xdu_off_latin_ligatures:
            \__xdu_set_latin_font:nnn { #3 } { #4 } { #5 }
          ]
      }
  }
\cs_new:Npn \__xdu_set_latin_main_font:nnnn #1#2#3#4
  {
    \setmainfont { #1 }
      [
        \__xdu_set_latin_font:nnn { #2 } { #3 } { #4 }
      ]
  }
\cs_new:Npn \__xdu_set_latin_sans_font:nnnn #1#2#3#4
  {
    \setsansfont { #1 }
      [
        \__xdu_set_latin_sans_scale:
        \__xdu_set_latin_font:nnn { #2 } { #3 } { #4 }
      ]
  }
\cs_new:Npn \__xdu_set_latin_mono_font:nnnn #1#2#3#4
  {
    \setmonofont { #1 }
      [
        \__xdu_set_latin_mono_scale:
        \__xdu_off_latin_ligatures:
        \__xdu_set_latin_font:nnn { #2 } { #3 } { #4 }
      ]
  }
\cs_new:Npn \__xdu_load_latin_font_tac:
  {
    \__xdu_set_latin_main_font:nnnnn
      { Times~New~Roman } { times.ttf   } { timesbd.ttf  } { timesi.ttf   } { timesbi.ttf  }
    \__xdu_set_latin_sans_font:nnnnn
      { Arial           } { arial.ttf   } { arialbd.ttf  } { ariali.ttf   } { arialbi.ttf  }
    \__xdu_set_latin_mono_font:nnnnn
      { Consolas        } { consola.ttf } { consolab.ttf } { consolai.ttf } { consolaz.ttf }
  }
\cs_new:Npn \__xdu_load_latin_font_tacn:
  {
    \__xdu_set_latin_main_font:nnnnn
      { Times~New~Roman } { times.ttf } { timesbd.ttf } { timesi.ttf } { timesbi.ttf }
    \__xdu_set_latin_sans_font:nnnnn
      { Arial           } { arial.ttf } { arialbd.ttf } { ariali.ttf } { arialbi.ttf }
    \__xdu_set_latin_mono_font:nnnnn
      { Courier~New     } { cour.ttf  } { courbd.ttf  } { couri.ttf  } { courbi.ttf  }
  }
\cs_new:Npn \__xdu_load_latin_font_tcc:
  {
    \__xdu_set_latin_main_font:nnnnn
      { Times~New~Roman }
      { times.ttf       }
      { timesbd.ttf     }
      { timesi.ttf      }
      { timesbi.ttf     }
    \__xdu_set_latin_sans_font:nnnn
      { cmunss.otf      }
      { cmunsx.otf      }
      { cmunsi.otf      }
      { cmunso.otf      }
    \__xdu_set_latin_mono_font:nnnn
      { cmuntt.otf      }
      { cmuntb.otf      }
      { cmunit.otf      }
      { cmuntx.otf      }
  }
\cs_new:Npn \__xdu_load_latin_font_thcs:
  {
    \__xdu_set_latin_main_font:nnnnn
      { Times~New~Roman            }
      { times.ttf                  }
      { timesbd.ttf                }
      { timesi.ttf                 }
      { timesbi.ttf                }
    \__xdu_set_latin_sans_font:nnnnn
      { Helvetica                  }
      { Helvetica.ttf              }
      { Helvetica~Bold.ttf         }
      { Helvetica~Oblique.ttf      }
      { Helvetica~Bold~Oblique.ttf }
    \__xdu_set_latin_mono_font:nnnnn
      { Courier~Std                }
      { CourierStd.otf             }
      { CourierStd-Bold.otf        }
      { CourierStd-Oblique.otf     }
      { CourierStd-BoldOblique.otf }
  }
\cs_new:Npn \__xdu_load_latin_font_tll:
  {
    \__xdu_set_latin_main_font:nnnnn
      { Times~New~Roman      }
      { times.ttf            }
      { timesbd.ttf          }
      { timesi.ttf           }
      { timesbi.ttf          }
    \__xdu_set_latin_sans_font:nnnn
      { LinBiolinum_R.otf    }
      { LinBiolinum_RB.otf   }
      { LinBiolinum_RI.otf   }
      { LinBiolinum_RBO.otf  }
    \__xdu_set_latin_mono_font:nnnn
      { LinLibertine_M.otf   }
      { LinLibertine_MB.otf  }
      { LinLibertine_MO.otf  }
      { LinLibertine_MBO.otf }
  }
\cs_new:Npn \__xdu_load_latin_font_gyre:
  {
    \__xdu_set_latin_main_font:nnnn
      { texgyretermes-regular.otf    }
      { texgyretermes-bold.otf       }
      { texgyretermes-italic.otf     }
      { texgyretermes-bolditalic.otf }
    \__xdu_set_latin_sans_font:nnnn
      { texgyreheros-regular.otf     }
      { texgyreheros-bold.otf        }
      { texgyreheros-italic.otf      }
      { texgyreheros-bolditalic.otf  }
    \__xdu_set_latin_mono_font:nnnn
      { texgyrecursor-regular.otf    }
      { texgyrecursor-bold.otf       }
      { texgyrecursor-italic.otf     }
      { texgyrecursor-bolditalic.otf }
  }
\cs_new:Npn \__xdu_load_latin_font_none: { }
\cs_new:Npn \__xdu_load_unicode_math_pkg:
  {
    \PassOptionsToPackage { \l__xdu_unicode_math_tl } { unicode-math }
    \RequirePackage  { unicode-math }
    \setoperatorfont { \symup       }
    \hypersetup      { psdextra     }
  }
\cs_new:Npn \__xdu_load_math_font_cambria:
  {
    \__xdu_load_unicode_math_pkg:
    \str_if_eq:NNTF { \l__xdu_font_type_tl } { font }
      { \setmathfont { Cambria~Math } }
      { \setmathfont { cambria.ttc } [ Path = \l__xdu_font_path_tl/, FontIndex = 1 ] }
  }
\cs_new:Npn \__xdu_define_math_font:nn #1#2
  {
    \cs_new:cpn { __xdu_load_math_font_ #1 : }
      {
        \__xdu_load_unicode_math_pkg:
        \setmathfont { #2 }
      }
  }
\clist_map_inline:nn
  {
    { asana          } { Asana-Math.otf             },
    { concrete       } { Concrete-Math.otf          },
    { erewhon        } { Erewhon-Math.otf           },
    { euler          } { Euler-Math.otf             },
    { fira           } { FiraMath-Regular.otf       },
    { garamond       } { Garamond-Math.otf          },
    { gfsneohellenic } { GFSNeohellenicMath.otf     },
    { kp             } { KpMath-Regular.otf         },
    { libertinus     } { LibertinusMath-Regular.otf },
    { lm             } { latinmodern-math.otf       },
    { newcm          } { NewCMMath-Regular.otf      },
    { stix           } { STIXMath-Regular.otf       },
    { stix2          } { STIXTwoMath-Regular.otf    },
    { xcharter       } { XCharter-Math.otf          },
    { xits           } { XITSMath-Regular.otf       },
    { bonum          } { texgyrebonum-math.otf      },
    { dejavu         } { texgyredejavu-math.otf     },
    { pagella        } { texgyrepagella-math.otf    },
    { schola         } { texgyreschola-math.otf     },
    { termes         } { texgyretermes-math.otf     }
  }
  { \__xdu_define_math_font:nn #1 }
\cs_new:Npn \__xdu_load_math_font_cm: { }
\cs_new:Npn \__xdu_load_math_font_none: { }
\cs_new:Npn \__xdu_load_font:
  {
    \use:c { __xdu_load_cjk_font_   \l__xdu_cjk_font_tl   : }
    \use:c { __xdu_load_latin_font_ \l__xdu_latin_font_tl : }
    \use:c { __xdu_load_math_font_  \l__xdu_math_font_tl  : }
  }
\ctex_at_end_preamble:n { \__xdu_load_font: }
\tl_new:N \l__xdu_title_tl
\tl_new:N \l__xdu_title_i_tl
\tl_new:N \l__xdu_title_ii_tl
\str_new:N \l__xdu_dept_str
\str_new:N \l__xdu_major_str
\str_new:N \l__xdu_author_str
\clist_new:N \l__xdu_supv_clist
\str_new:N \l__xdu_supv_ent_str
\str_new:N \l__xdu_student_id_str
\tl_new:N \l__xdu_abstract_zh_tl
\tl_new:N \l__xdu_abstract_en_tl
\clist_new:N \l__xdu_keywords_zh_clist
\clist_new:N \l__xdu_keywords_en_clist
\clist_new:N \l__xdu_bib_file_clist
\clist_new:N \l__xdu_appendix_clist
\tl_new:N \l__xdu_ack_tl
\keys_define:nn { xdu / info }
  {
    title .tl_set:N = \l__xdu_title_tl,
    department .tl_set:N = \l__xdu_dept_str,
    major .tl_set:N = \l__xdu_major_str,
    author .tl_set:N = \l__xdu_author_str,
    supervisor .clist_set:N = \l__xdu_supv_clist,
    supv-ent .tl_set:N = \l__xdu_supv_ent_str,
    supervisor-enterprise .tl_set:N = \l__xdu_supv_ent_str,
    student-id .tl_set:N = \l__xdu_student_id_str,
    abstract .tl_set:N = \l__xdu_abstract_zh_tl,
    abstract* .tl_set:N = \l__xdu_abstract_en_tl,
    keywords .clist_set:N = \l__xdu_keywords_zh_clist,
    keywords* .clist_set:N = \l__xdu_keywords_en_clist,
    bib-resource .clist_set:N = \l__xdu_bib_file_clist,
    appendix .clist_set:N = \l__xdu_appendix_clist,
    acknowledgements .tl_set:N = \l__xdu_ack_tl
  }
\keys_set:nn { xdu }
  {
    info / title                 = { },
    info / department            = { },
    info / major                 = { },
    info / author                = { },
    info / supervisor            = { },
    info / supv-ent              = { },
    info / supervisor-enterprise = { },
    info / student-id            = { },
    info / abstract              = { },
    info / abstract*             = { },
    info / keywords              = { },
    info / keywords*             = { },
    info / bib-resource          = { },
    info / appendix              = { },
    info / acknowledgements      = { }
  }
\str_new:N \l__xdu_supv_str
\str_new:N \l__xdu_supv_ii_str
\ctex_at_end_preamble:n
  {
    \str_set:Nx \l__xdu_supv_str    { \clist_item:Nn \l__xdu_supv_clist { 1 } }
    \str_set:Nx \l__xdu_supv_ii_str { \clist_item:Nn \l__xdu_supv_clist { 2 } }
  }
\tl_new:N \l__xdu_gr_type_tl
\tl_new:N \l__xdu_degree_type_tl
\str_new:N \l__xdu_degree_str
\str_new:N \l__xdu_degree_en_str
\str_new:N \l__xdu_author_en_str
\clist_new:N \l__xdu_supv_en_clist
\str_new:N \l__xdu_supv_ent_en_str
\clist_new:N \l__xdu_supv_t_clist
\clist_new:N \l__xdu_supv_t_en_clist
\str_new:N \l__xdu_supv_ent_t_str
\str_new:N \l__xdu_supv_ent_t_en_str
\str_new:N \l__xdu_title_en_str
\str_new:N \l__xdu_major_en_str
\str_new:N \l__xdu_sub_major_str
\str_new:N \l__xdu_domain_str
\str_new:N \l__xdu_clc_str
\str_new:N \l__xdu_secret_lv_str
\str_new:N \l__xdu_submit_date_str
\str_new:N \l__xdu_statement_scan_str
\clist_new:N \l__xdu_statement_sign_clist
\str_new:N \l__xdu_los_str
\str_new:N \l__xdu_loa_str
\str_new:N \l__xdu_bio_str
\keys_define:nn { xdu / info }
  {
    graduate-type .choices:nn = { 硕士, 博士 }
      { \tl_set_eq:NN \l__xdu_gr_type_tl \l_keys_choice_tl },
    degree-type .choices:nn = { 学术, 专业 }
      { \tl_set_eq:NN \l__xdu_degree_type_tl \l_keys_choice_tl },
    degree .tl_set:N = \l__xdu_degree_str,
    degree* .tl_set:N = \l__xdu_degree_en_str,
    author* .tl_set:N = \l__xdu_author_en_str,
    supervisor* .clist_set:N = \l__xdu_supv_en_clist,
    supv-ent* .tl_set:N = \l__xdu_supv_ent_en_str,
    supervisor-enterprise* .tl_set:N = \l__xdu_supv_ent_en_str,
    supv-title .clist_set:N = \l__xdu_supv_t_clist,
    supervisor-title .clist_set:N = \l__xdu_supv_t_clist,
    supv-title* .clist_set:N = \l__xdu_supv_t_en_clist,
    supervisor-title* .clist_set:N = \l__xdu_supv_t_en_clist,
    supv-ent-title .tl_set:N = \l__xdu_supv_ent_t_str,
    supervisor-enterprise-title .tl_set:N = \l__xdu_supv_ent_t_str,
    supv-ent-title* .tl_set:N = \l__xdu_supv_ent_t_en_str,
    supervisor-enterprise-title* .tl_set:N = \l__xdu_supv_ent_t_en_str,
    title* .tl_set:N = \l__xdu_title_en_str,
    major* .tl_set:N = \l__xdu_major_en_str,
    sub-major .tl_set:N = \l__xdu_sub_major_str,
    domain .tl_set:N = \l__xdu_domain_str,
    clc .tl_set:N = \l__xdu_clc_str,
    secret-level .choices:nn = { 秘密, 公开 }
      { \tl_set_eq:NN \l__xdu_secret_lv_str \l_keys_choice_tl },
    submit-date .tl_set:N = \l__xdu_submit_date_str,
    statement-scan .tl_set:N = \l__xdu_statement_scan_str,
    statement-sign .clist_set:N = \l__xdu_statement_sign_clist,
    los .tl_set:N = \l__xdu_los_str,
    loa .tl_set:N = \l__xdu_loa_str,
    bio .tl_set:N = \l__xdu_bio_str
  }
\keys_set:nn { xdu }
  {
    info / graduate-type                = 硕士,
    info / degree-type                  = 学术,
    info / degree                       = { },
    info / degree*                      = { },
    info / author*                      = { },
    info / supervisor*                  = { },
    info / supv-ent*                    = { },
    info / supervisor-enterprise*       = { },
    info / supv-title                   = { },
    info / supervisor-title             = { },
    info / supv-title*                  = { },
    info / supervisor-title*            = { },
    info / supv-ent-title               = { },
    info / supervisor-enterprise-title  = { },
    info / supv-ent-title*              = { },
    info / supervisor-enterprise-title* = { },
    info / title*                       = { },
    info / major*                       = { },
    info / sub-major                    = { },
    info / domain                       = { },
    info / clc                          = { },
    info / secret-level                 = 公开,
    info / submit-date                  = { },
    info / statement-scan               = { },
    info / statement-sign               = { },
    info / los                          = { },
    info / loa                          = { },
    info / bio                          = { }
  }
\str_new:N \l__xdu_supv_en_str
\str_new:N \l__xdu_supv_ii_en_str
\str_new:N \l__xdu_supv_t_str
\str_new:N \l__xdu_supv_ii_t_str
\str_new:N \l__xdu_supv_t_en_str
\str_new:N \l__xdu_supv_ii_t_en_str
\ctex_at_end_preamble:n
  {
    \str_set:Nx \l__xdu_supv_en_str
      { \clist_item:Nn \l__xdu_supv_en_clist   { 1 } }
    \str_set:Nx \l__xdu_supv_ii_en_str
      { \clist_item:Nn \l__xdu_supv_en_clist   { 2 } }
    \str_set:Nx \l__xdu_supv_t_str
      { \clist_item:Nn \l__xdu_supv_t_clist    { 1 } }
    \str_set:Nx \l__xdu_supv_ii_t_str
      { \clist_item:Nn \l__xdu_supv_t_clist    { 2 } }
    \str_set:Nx \l__xdu_supv_t_en_str
      { \clist_item:Nn \l__xdu_supv_t_en_clist { 1 } }
    \str_set:Nx \l__xdu_supv_ii_t_en_str
      { \clist_item:Nn \l__xdu_supv_t_en_clist { 2 } }
  }
\clist_new:N \l__xdu_rm_page_clist
\bool_new:N \l__xdu_rm_header_bool
\bool_new:N \l__xdu_rm_footer_bool
\keys_define:nn { xdu / style }
  {
    remove-page .clist_set:N = \l__xdu_rm_page_clist,
    remove-header .bool_set:N = \l__xdu_rm_header_bool,
    remove-footer .bool_set:N = \l__xdu_rm_footer_bool
  }
\keys_set:nn { xdu }
  {
    style / remove-page   = { },
    style / remove-header = false,
    style / remove-footer = false
  }
\bool_new:N \l__xdu_rm_cover_bool
\bool_new:N \l__xdu_rm_title_page_bool
\bool_new:N \l__xdu_rm_statement_bool
\bool_new:N \l__xdu_rm_abstract_bool
\bool_new:N \l__xdu_rm_lof_bool
\bool_new:N \l__xdu_rm_lot_bool
\bool_new:N \l__xdu_rm_los_bool
\bool_new:N \l__xdu_rm_loa_bool
\bool_new:N \l__xdu_rm_toc_bool
\bool_new:N \l__xdu_rm_appendix_bool
\bool_new:N \l__xdu_rm_ref_bool
\bool_new:N \l__xdu_rm_ack_bool
\bool_new:N \l__xdu_rm_bio_bool
\ctex_at_end_preamble:n
  {
    \clist_if_in:NnT \l__xdu_rm_page_clist { 封面 }
      { \bool_set_true:N \l__xdu_rm_cover_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 提名页 }
      { \bool_set_true:N \l__xdu_rm_title_page_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 题名页 }
      { \bool_set_true:N \l__xdu_rm_title_page_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 声明页 }
      { \bool_set_true:N \l__xdu_rm_statement_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 摘要 }
      { \bool_set_true:N \l__xdu_rm_abstract_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 索引 }
      {
        \bool_set_true:N \l__xdu_rm_lof_bool
        \bool_set_true:N \l__xdu_rm_lot_bool
      }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 插图索引 }
      { \bool_set_true:N \l__xdu_rm_lof_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 表格索引 }
      { \bool_set_true:N \l__xdu_rm_lot_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 对照表 }
      {
        \bool_set_true:N \l__xdu_rm_los_bool
        \bool_set_true:N \l__xdu_rm_loa_bool
      }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 符号对照表 }
      { \bool_set_true:N \l__xdu_rm_los_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 缩略语对照表 }
      { \bool_set_true:N \l__xdu_rm_loa_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 目录 }
      { \bool_set_true:N \l__xdu_rm_toc_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 附录 }
      { \bool_set_true:N \l__xdu_rm_appendix_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 参考文献 }
      { \bool_set_true:N \l__xdu_rm_ref_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 致谢 }
      { \bool_set_true:N \l__xdu_rm_ack_bool }
    \clist_if_in:NnT \l__xdu_rm_page_clist { 作者简介 }
      { \bool_set_true:N \l__xdu_rm_bio_bool }
  }
\bool_new:N \l__xdu_anon_bool
\keys_define:nn { xdu / style }
  {
    anonymous .bool_set:N = \l__xdu_anon_bool
  }
\keys_set:nn { xdu }
  {
    style / anonymous = false
  }
\NewDocumentCommand \anon { O { XXX } m }
  {
    \bool_if:NTF \l__xdu_anon_bool
      { #1 } { #2 }
  }
\cs_set:Npn \figurename { \__xdu_lang_switch:nn { 图 } { Figure } }
\cs_new_eq:NN \figname \figurename
\cs_set:Npn \tablename  { \__xdu_lang_switch:nn { 表 } { Table  } }
\cs_new_eq:NN \tabname \tablename
\bool_new:N \l__xdu_title_bold_math_bool
\bool_new:N \l__xdu_en_cjk_font_bool
\tl_new:N \l__xdu_lang_tl
\tl_new:N \l__xdu_bib_tool_tl
\tl_new:N \l__xdu_biblatex_option_tl
\clist_new:N \l__xdu_search_path_clist
\bool_new:N \l__xdu_fix_input_bool
\bool_new:N \l__xdu_fix_include_bool
\bool_new:N \l__xdu_fix_graphics_bool
\tl_new:N \l__xdu_ref_add_space_bool
\tl_new:N \l__xdu_cap_label_sep_tl
\tl_new:N \l__xdu_ft_cap_format_tl
\tl_new:N \l__xdu_alg_cap_format_tl
\tl_new:N \l__xdu_ft_cap_align_tl
\tl_new:N \l__xdu_alg_cap_align_tl
\bool_new:N \l__xdu_add_alg_rule_vspace_bool
\bool_new:N \l__xdu_tab_small_bool
\tl_new:N \l__xdu_figure_align_tl
\tl_new:N \l__xdu_table_align_tl
\bool_new:N \l__xdu_alg_small_cap_bool
\bool_new:N \l__xdu_alg_small_bool
\clist_new:N \l__xdu_before_skip_clist
\clist_new:N \l__xdu_after_skip_clist
\tl_new:N \l__xdu_chap_tl
\tl_new:N \l__xdu_sec_tl
\tl_new:N \l__xdu_subsec_tl
\tl_new:N \l__xdu_subsubsec_tl
\tl_new:N \l__xdu_para_tl
\tl_new:N \l__xdu_subpara_tl
\bool_new:N \l__xdu_sym_mgn_bool
\tl_new:N \l__xdu_page_v_align_tl
\keys_define:nn { xdu / style }
  {
    title-bold-math .bool_set:N = \l__xdu_title_bold_math_bool,
    en-cjk-font .bool_set:N = \l__xdu_en_cjk_font_bool,
    language .choices:nn = { zh, en }
      { \tl_set_eq:NN \l__xdu_lang_tl \l_keys_choice_tl },
    bib-backend .choices:nn = { bibtex, biblatex }
      { \tl_set_eq:NN \l__xdu_bib_tool_tl \l_keys_choice_tl },
    biblatex-option .tl_set:N = \l__xdu_biblatex_option_tl,
    file-search-path .clist_set:N = \l__xdu_search_path_clist,
    fix-input .bool_set:N = \l__xdu_fix_input_bool,
    fix-include .bool_set:N = \l__xdu_fix_include_bool,
    fix-includegraphics .bool_set:N = \l__xdu_fix_graphics_bool,
    ref-add-space .bool_set:N = \l__xdu_ref_add_space_bool,
    caption-label-sep .tl_set:N = \l__xdu_cap_label_sep_tl,
    ft-caption-format .choices:nn = { plain, hang }
      { \tl_set_eq:NN \l__xdu_ft_cap_format_tl \l_keys_choice_tl },
    alg-caption-format .choices:nn = { plain, hang }
      { \tl_set_eq:NN \l__xdu_alg_cap_format_tl \l_keys_choice_tl },
    ft-caption-align .choices:nn = { left, centering, centering-left }
      { \tl_set_eq:NN \l__xdu_ft_cap_align_tl \l_keys_choice_tl },
    alg-caption-align .choices:nn = { left, centering, centering-left }
      { \tl_set_eq:NN \l__xdu_alg_cap_align_tl \l_keys_choice_tl },
    add-alg-rule-vspace .bool_set:N = \l__xdu_add_alg_rule_vspace_bool,
    table-small-font .bool_set:N = \l__xdu_tab_small_bool,
    figure-align .choices:nn = { left, centering, right }
      { \tl_set_eq:NN \l__xdu_figure_align_tl \l_keys_choice_tl },
    table-align .choices:nn = { left, centering, right }
      { \tl_set_eq:NN \l__xdu_table_align_tl \l_keys_choice_tl },
    alg-small-caption .bool_set:N = \l__xdu_alg_small_cap_bool,
    algorithm-small-caption .bool_set:N = \l__xdu_alg_small_cap_bool,
    alg-small-font .bool_set:N = \l__xdu_alg_small_bool,
    algorithm-small-font .bool_set:N = \l__xdu_alg_small_bool,
    before-skip .clist_set:N = \l__xdu_before_skip_clist,
    after-skip .clist_set:N = \l__xdu_after_skip_clist,
    chap-zihao .tl_set:N = \l__xdu_chap_tl,
    sec-zihao .tl_set:N = \l__xdu_sec_tl,
    subsec-zihao .tl_set:N = \l__xdu_subsec_tl,
    subsubsec-zihao .tl_set:N = \l__xdu_subsubsec_tl,
    para-zihao .tl_set:N = \l__xdu_para_tl,
    subpara-zihao .tl_set:N = \l__xdu_subpara_tl,
    symmetric-margin .bool_set:N = \l__xdu_sym_mgn_bool,
    page-vertical-align .tl_set:N = \l__xdu_page_v_align_tl
  }
\keys_set:nn { xdu }
  {
    style / title-bold-math         = false,
    style / en-cjk-font             = false,
    style / language                = zh,
    style / bib-backend             = biblatex,
    style / biblatex-option         = { },
    style / file-search-path        = { },
    style / fix-input               = false,
    style / fix-include             = false,
    style / fix-includegraphics     = false,
    style / ref-add-space           = false,
    style / caption-label-sep       = 0.75em,
    style / ft-caption-format       = hang,
    style / alg-caption-format      = hang,
    style / ft-caption-align        = centering-left,
    style / alg-caption-align       = left,
    style / add-alg-rule-vspace     = false,
    style / table-small-font        = true,
    style / figure-align            = centering,
    style / table-align             = centering,
    style / alg-small-caption       = true,
    style / algorithm-small-caption = true,
    style / alg-small-font          = true,
    style / algorithm-small-font    = true,
    style / before-skip             = { 24pt, 18pt, 12pt, 12pt, 12pt, 12pt },
    style / after-skip              = { 18pt, 12pt, 6pt, 6pt, 6pt, 6pt },
    style / symmetric-margin        = false,
    style / page-vertical-align     = 顶部对齐
  }
\cs_new:Npn \__xdu_bold_math: { }
\ctex_at_end_preamble:n
  {
    \bool_if:NT \l__xdu_title_bold_math_bool
      {
        \tl_if_eq:NnT \l__xdu_math_font_tl { cm }
          { \cs_set_eq:NN \__xdu_bold_math: \boldmath }
      }
  }
\bool_new:N \l__xdu_customize_los_bool
\bool_new:N \l__xdu_customize_loa_bool
\tl_new:N \l__xdu_colspec_los_tl
\tl_new:N \l__xdu_colspec_loa_tl
\bool_new:N \l__xdu_title_row_los_bool
\bool_new:N \l__xdu_title_row_loa_bool
\keys_define:nn { xdu / style }
  {
    customize-los .bool_set:N = \l__xdu_customize_los_bool,
    customize-loa .bool_set:N = \l__xdu_customize_loa_bool,
    colspec-los .tl_set:N = \l__xdu_colspec_los_tl,
    colspec-loa .tl_set:N = \l__xdu_colspec_loa_tl,
    title-row-los .bool_set:N = \l__xdu_title_row_los_bool,
    title-row-loa .bool_set:N = \l__xdu_title_row_loa_bool
  }
\keys_set:nn { xdu }
  {
    style / customize-los = true,
    style / customize-loa = true,
    style / colspec-los   = { Q[l,h]X[l,h] },
    style / colspec-loa   = { Q[l,h]X[l,h]X[l,h] },
    style / title-row-los = false,
    style / title-row-loa = false
  }
\bool_new:N \l__xdu_cust_edubg_bool
\bool_new:N \l__xdu_cust_resresult_bool
\keys_define:nn { xdu / style }
  {
    customize-edubg .bool_set:N = \l__xdu_cust_edubg_bool,
    customize-resresult .bool_set:N = \l__xdu_cust_resresult_bool
  }
\keys_set:nn { xdu }
  {
    style / customize-edubg     = true,
    style / customize-resresult = true
  }
\NewDocumentCommand \xdusetup { m }
  { \keys_set:nn { xdu } { #1 } }
\keys_define:nn { xdu }
  {
    style .meta:nn = { xdu / style } { #1 },
    info  .meta:nn = { xdu / info  } { #1 }
  }
\ProcessKeysOptions { xdu / style }
\str_new:N \l__xdu_header_str
\ctex_at_end_preamble:n
  {
    \__xdu_lang_switch:nn
      {
        \tl_if_eq:NnTF \l__xdu_gr_type_tl { 硕士 }
          { \str_set:Nn \l__xdu_header_str { 西安电子科技大学硕士学位论文 } }
          { \str_set:Nn \l__xdu_header_str { 西安电子科技大学博士学位论文 } }
      }
      {
        \tl_if_eq:NnTF \l__xdu_gr_type_tl { 硕士 }
          {
            \str_set:Nn \l__xdu_header_str
              { Master~Thesis~of~XIDIAN~UNIVERSITY }
          }
          {
            \str_set:Nn \l__xdu_header_str
              { Doctoral~Dissertation~of~XIDIAN~UNIVERSITY }
          }
      }
  }
\cs_new:Npn \__xdu_lang_switch:nn #1#2
  {
    \str_if_eq:NNTF { \l__xdu_lang_tl } { zh }
      { #1 }
      { #2 }
  }
\cs_new:Npn \__xdu_rm_family:
  { \bool_if:NTF \l__xdu_en_cjk_font_bool { \CJKfamily+ { rm } } { \rmfamily } }
\cs_new:Npn \__xdu_sf_family:
  { \bool_if:NTF \l__xdu_en_cjk_font_bool { \CJKfamily+ { sf } } { \sffamily } }
\cs_new:Npn \__xdu_tt_family:
  { \bool_if:NTF \l__xdu_en_cjk_font_bool { \CJKfamily+ { tt } } { \ttfamily } }
\ctex_at_end_preamble:n
  {
    \tl_new:N \l__xdu_pure_title_tl
    \tl_set_eq:NN \l__xdu_pure_title_tl \l__xdu_title_tl
    \tl_remove_all:Nn \l__xdu_pure_title_tl { \\ }
  }
\cs_new_protected:Npn \__xdu_split_title:Nn #1#2
  {
    \seq_new:N \l__xdu_title_seq
    \tl_if_in:nnTF { #2 } { \\ }
      {
        \seq_set_split:Nnn \l__xdu_title_seq { \\ } { #2 }
        \clist_set_from_seq:NN #1 \l__xdu_title_seq
      }
      { \clist_set:Nx #1 { #2 } }
  }
\cs_generate_variant:Nn \__xdu_split_title:Nn { NV }
\cs_new:Npn \__xdu_uline:n #1
  { \CJKunderline [ thickness = 0.5pt ] { #1 } }
\cs_new:Npn \__xdu_tl_set_if_empty:Nn #1#2
  { \tl_if_empty:NT #1 { \tl_set:Nn #1 { #2 } } }
\cs_new:Npn \__xdu_get_text_width:Nn #1#2
  {
    \box_clear_new:N \l__xdu_tmp_box
    \hbox_set:Nn \l__xdu_tmp_box { #2 }
    \dim_set:Nn #1 { \box_wd:N \l__xdu_tmp_box }
  }
\cs_generate_variant:Nn \__xdu_get_text_width:Nn { NV }
\cs_new:Npn \__xdu_add_bookmark:n #1
  {
    \cleardoublepage
    \currentpdfbookmark { #1 } { #1 }
  }
\cs_new:Npn \__xdu_add_toc:n #1
  {
    \cleardoublepage
    \phantomsection
    \addcontentsline { toc } { chapter } { #1 }
  }
\cs_new:Npn \__xdu_n_chapter_head:n #1
  {
    \__xdu_add_bookmark:n { #1 }
    \chapter*          { #1 }
    \markboth          { #1 } { }
  }
\cs_new:Npn \__xdu_n_chapter_head_ii:nn #1#2
  {
    \group_begin:
      \ctexset { chapter / format = { #2 } }
      \__xdu_n_chapter_head:n { #1 }
    \group_end:
  }
\cs_new:Npn \__xdu_n_chapter_head:nn #1#2
  {
    \__xdu_add_bookmark:n { #1 }
    \chapter*          { #2 }
    \markboth          { #1 } { }
  }
\cs_new:Npn \__xdu_n_chapter_head_ii:nnn #1#2#3
  {
    \group_begin:
      \ctexset { chapter / format = { #3 } }
      \__xdu_n_chapter_head:nn { #1 } { #2 }
    \group_end:
  }
\cs_new:Npn \__xdu_n_chapter_head_toc:n #1
  {
    \__xdu_add_toc:n { #1 }
    \chapter* { #1 }
    \markboth { #1 } { }
  }
\cs_new:Npn \__xdu_n_chapter_head_toc:nn #1#2
  {
    \__xdu_add_toc:n { #1 }
    \chapter* { #2 }
    \markboth { #1 } { }
  }
\cs_new:Npn \__xdu_n_chapter_head_toc_ii:nn #1#2
  {
    \group_begin:
      \ctexset { chapter / format = { #2 } }
      \__xdu_n_chapter_head_toc:n { #1 }
    \group_end:
  }
\cs_new:Npn \__xdu_typeout_keywords:nNn #1#2#3
  {
    \tl_clear_new:N \l__xdu_keywords_label_str
    \tl_set:Nn \l__xdu_keywords_label_tl { #1 }
    \dim_zero_new:N \l__xdu_keywords_label_dim
    \__xdu_get_text_width:NV \l__xdu_keywords_label_dim \l__xdu_keywords_label_tl
    \begin { list } { \l__xdu_keywords_label_tl }
      {
        \labelwidth  \l__xdu_keywords_label_dim
        \labelsep    \c_zero_dim
        \rightmargin \c_zero_dim
        \leftmargin  \l__xdu_keywords_label_dim
      }
      \item \clist_use:Nnnn #2 { #3 } { #3 } { #3 }
    \end { list }
  }
\dim_new:N \l__xdu_str_dim
\box_new:N \l__xdu_str_box
\cs_new:Npn \__xdu_str_max_dim:Nn #1#2
  {
    \hbox_set:Nn \l__xdu_str_box { #2 }
    \dim_set:Nn \l__xdu_str_dim { \box_wd:N \l__xdu_str_box }
    \dim_set:Nn #1  { \dim_max:nn { \l__xdu_str_dim } { #1 } }
  }
\NewDocumentCommand \noauxwrite { m }
  {
    \if@filesw
      \@fileswfalse
      #1
      \@fileswtrue
    \else
      #1
    \fi
  }
\newgeometry
  {
    top           = 3.14cm,
    bottom        = 2.5cm,
    inner         = 2.5cm,
    outer         = 2.5cm,
    bindingoffset = 0.5cm,
    headheight    = 60pt,
    headsep       = 10pt,
    foot          = 0.75cm
  }
\savegeometry { main }
\newgeometry
  {
    top        = 3.14cm,
    bottom     = 2.5cm,
    inner      = 2.75cm,
    outer      = 2.75cm,
    headheight = 60pt,
    headsep    = 10pt,
    foot       = 0.75cm
  }
\savegeometry { main-sym }
\newgeometry
  {
    top    = 3cm,
    bottom = 1cm,
    inner  = 3cm,
    outer  = 2.5cm
  }
\savegeometry { cover }
\newgeometry  { margin = 0cm }
\savegeometry { nomargin     }
\cs_new:Npn \__xdu_load_main_geometry:
  {
    \bool_if:NTF \l__xdu_sym_mgn_bool
      { \loadgeometry { main-sym } }
      { \loadgeometry { main     } }
  }
\clist_map_inline:nn
  {
    { chinese  },
    { arabic   },
    { roman    },
    { Roman    },
    { alph     },
    { Alph     },
    { fnsymbol }
  }
  { \cs_new_eq:cc { __xdu _ #1 : } { #1 } }
\tl_set:Nn \chaptername { Chapter }
\tl_new:N \l__xdu_chaptername
\tl_set_eq:NN \l__xdu_chaptername \chaptername
\renewcommand { \chaptermark } [ 1 ]
  {
    \markboth
      {
        \__xdu_lang_switch:nn
          { \CTEXthechapter }
          { \l__xdu_chaptername \space \__xdu_Roman: { chapter } }
        \quad #1
      }
      { }
  }
\fancypagestyle { plain }
  {
    \pagestyle { fancy }
    \fancyhf { }
    \bool_if:NF \l__xdu_rm_header_bool
      {
        \fancyhead [ CE ] { \__xdu_rm_family: \zihao { 5  } \l__xdu_header_str     }
        \fancyhead [ CO ] { \__xdu_rm_family: \zihao { 5  } \leftmark            }
      }
    \bool_if:NTF \l__xdu_rm_footer_bool
      { \fancyfoot [ C ] { } }
      { \fancyfoot [ C ] { \__xdu_rm_family: \zihao { -5 } \thepage } }
    \cs_set:Npn \headrulewidth { 0.5pt }
    \bool_if:NTF \l__xdu_rm_header_bool
      { \cs_set:Npn \headrule { } }
      {
        \cs_set:Npn \headrule
          {
            \hrule \@height 0pt
            \skip_vertical:N 2pt
            \hrule \@height \headrulewidth
            \skip_vertical:N \headrulewidth
            \hrule \@height \headrulewidth
            \skip_vertical:N -\headrulewidth
          }
      }
  }
\fancypagestyle { front }
  {
    \pagestyle { plain }
    \bool_if:NTF \l__xdu_rm_footer_bool
      { \fancyfoot [ C ] { } }
      { \fancyfoot [ C ] { \rmfamily \zihao { -5 } \thepage } }
  }
\ctex_at_end_preamble:n
  {
    \tl_if_eq:NnTF \l__xdu_page_v_align_tl { 顶部对齐 }
      { \raggedbottom }
      { \flushbottom  }
  }
\ctexset { secnumdepth=5 }
\ctex_at_end_preamble:n
  {
    \__xdu_lang_switch:nn
      { \ctexset { chapter / name = { 第, 章        } } }
      { \ctexset { chapter / name = { Chapter\space } } }
  }
\ctexset
  {
    section       / name = {        },
    subsection    / name = {        },
    subsubsection / name = { （, ） },
    paragraph     / name = { （, ） },
    subparagraph  / name = { （, ） }
  }
\ctex_at_end_preamble:n
  {
    \__xdu_lang_switch:nn
      { \ctexset { chapter / number = { \chinese { chapter } } } }
      { \ctexset { chapter / number = { \Roman   { chapter } } } }
  }
\ctexset
  {
    section       / number = { \thesection               },
    subsection    / number = { \thesubsection            },
    subsubsection / number = { \arabic { subsubsection } },
    paragraph     / number = { \alph { paragraph }       },
    subparagraph  / number = { \roman { subparagraph }   }
  }
\cs_new:Npn \__xdu_sec_format_i:n #1
  {
    \__xdu_rm_family:
    \bfseries \__xdu_bold_math:
    \zihao { #1 }
    \dim_set:Nn \baselineskip { 20pt }
  }
\cs_new:Npn \__xdu_sec_format_ii:
  {
    \__xdu_sf_family:
    \centering
    \__xdu_bold_math:
    \zihao { 3 }
    \dim_set:Nn \baselineskip { 20pt }
  }
\cs_new:Npn \__xdu_sec_format_iii:
  { \__xdu_rm_family: \centering \zihao { 3 } \dim_set:Nn \baselineskip { 20pt } }
\ctex_at_end_preamble:n
  {
    \__xdu_lang_switch:nn
      { \ctexset { chapter / format = { \__xdu_sec_format_ii:  } } }
      { \ctexset { chapter / format = { \__xdu_sec_format_iii: } } }
  }
\ctexset
  {
    section       / format = { \__xdu_sec_format_i:n { -3 } },
    subsection    / format = { \__xdu_sec_format_i:n { 4  } },
    subsubsection / format = { \__xdu_sec_format_i:n { 4  } },
    paragraph     / format = { \__xdu_sec_format_i:n { 4  } },
    subparagraph  / format = { \__xdu_sec_format_i:n { 4  } }
  }
\ctexset
  {
    chapter       / aftername = { \quad   },
    section       / aftername = { \enskip },
    subsection    / aftername = { \enskip },
    subsubsection / aftername = { },
    paragraph     / aftername = { },
    subparagraph  / aftername = { }
  }
\ctexset
  {
    chapter       / indent = { 0bp  },
    section       / indent = { 0bp  },
    subsection    / indent = { 24bp },
    subsubsection / indent = { 24bp },
    paragraph     / indent = { 24bp },
    subparagraph  / indent = { 24bp }
  }
\ctexset
  {
    chapter       / beforeskip = { 6pt  },
    section       / beforeskip = { 18pt },
    subsection    / beforeskip = { 12pt },
    subsubsection / beforeskip = { 12pt },
    paragraph     / beforeskip = { 12pt },
    subparagraph  / beforeskip = { 12pt },
    chapter       / afterskip  = { 18pt },
    section       / afterskip  = { 12pt },
    subsection    / afterskip  = { 6pt  },
    subsubsection / afterskip  = { 6pt  },
    paragraph     / afterskip  = { 6pt  },
    subparagraph  / afterskip  = { 6pt  }
  }
\PassOptionsToPackage { titles } { tocloft }
\RequirePackage { tocloft }
\cs_set:Npn \cftdotsep { 0 }
\cs_set:Npn \cftchapleader { \cftdotfill { \cftdotsep } }
\dim_set_eq:NN \cftbeforechapskip \cftbeforesecskip
\ctex_at_end_preamble:n
  {
    \__xdu_lang_switch:nn
      { \cs_set:Npn \cftchapfont { \__xdu_sf_family: \__xdu_bold_math: \zihao { -4 } } }
      { \cs_set:Npn \cftchapfont { \__xdu_rm_family: \zihao { -4 } } }
  }
\clist_map_inline:nn
  {
    \cftsecfont,
    \cftsubsecfont,
    \cftchappagefont,
    \cftsecpagefont,
    \cftsubsecpagefont
  }
  { \renewcommand { #1 } { \__xdu_rm_family: \zihao { -4 } } }
\ctex_at_end_preamble:n
  {
    \seq_if_empty:NF \l__xdu_search_path_clist
      {
        \clist_map_inline:Nn \l__xdu_search_path_clist
          { \seq_put_right:Nn \l_file_search_path_seq { #1 } }
      }
    \bool_if:NT \l__xdu_fix_input_bool
      {
        \cs_new_eq:NN \__xdu_org_input:n \input
        \RenewDocumentCommand { \input } { m }
          { \__xdu_org_input:n { ./ #1 } }
      }
    \bool_if:NT \l__xdu_fix_include_bool
      {
        \cs_new_eq:NN \__xdu_org_include:n \include
        \RenewDocumentCommand { \include } { m }
          { \__xdu_org_include:n { ./ #1 } }
      }
    \bool_if:NT \l__xdu_fix_graphics_bool
      {
        \cs_new_eq:NN \__xdu_org_includegraphics:n \includegraphics
        \RenewDocumentCommand { \includegraphics } { o m }
          {
            \IfNoValueTF { #1 }
              { \__xdu_org_includegraphics:n        { ./ #2 } }
              { \__xdu_org_includegraphics:n [ #1 ] { ./ #2 } }
          }
      }
  }
\renewcommand { \theequation } { \thechapter - \arabic { equation } }
\cs_set:Npn \topfraction       { .8 }
\cs_set:Npn \floatpagefraction { .8 }
\ctex_at_end_preamble:n
  {
    \clist_map_inline:nn
      {
        { \algorithmname   },
        { \ALG@name        },
        { \algorithmcfname }
      }
      { \cs_set:Npn #1 { \__xdu_lang_switch:nn { 算法 } { Algorithm } } }
  }
\PassOptionsToPackage { chapter } { algorithm }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { algorithm }
      {
        \cs_if_exist:NT \thealgorithm
          {
            \floatplacement { algorithm } { tbp }
            \cs_set:Npn \thealgorithm { \thechapter . \arabic { algorithm } }
            \bool_if:NT \l__xdu_alg_small_bool
              {
                \renewenvironment { algorithm }
                  {
                    \@nameuse { fst@algorithm }
                    \@float@setevery { algorithm }
                    \ctex_gadd_ltxhook:nn
                      { cmd/@floatboxreset/after }
                      { \zihao { 5 } }
                    \@float { algorithm }
                  }
                  { \float@end }
              }
          }
      }
      { }
  }
\PassOptionsToPackage { algochapter } { algorithm2e }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { algorithm2e }
      {
        \cs_if_exist:NT \thealgocf
          {
            \cs_set:Npn \thealgocf { \thechapter . \arabic { algocf } }
            \renewenvironment { \algocf@envname } [ 1 ] [ tbp ]
              {
                \setboolean { algocf@algostar } { false }
                \setboolean { algocf@procenvironment } { false }
                \gdef \algocfautorefname { \algorithmautorefname }
                \begin { algocf@algorithm } [ #1 ] \ignorespaces
              }
              { \end { algocf@algorithm } \ignorespacesafterend }
            \bool_if:NT \l__xdu_alg_small_bool
              { \SetAlFnt { \zihao { 5 } } }
          }
      }
      { }
  }
\PassOptionsToPackage { ruled } { caption }
\RequirePackage { caption }
\DeclareCaptionLabelSeparator { customskip } { \hskip \l__xdu_cap_label_sep_tl }
\DeclareCaptionFont { customfont   } { \__xdu_rm_family: \zihao { 5 } }
\captionsetup
  {
    strut    = off,
    labelsep = customskip,
    font     = customfont
  }
\captionsetup [ subfigure ] { strut = on, skip = 0pt }
\captionsetup [ subtable  ] { strut = on, skip = 0pt }
\dim_set_eq:NN \intextsep \abovecaptionskip
\ctex_at_end_preamble:n
  {
    \tl_if_eq:NnTF \l__xdu_ft_cap_format_tl { hang }
      { \captionsetup { format = hang  } }
      { \captionsetup { format = plain } }
    \tl_if_eq:NnTF \l__xdu_ft_cap_align_tl { left }
      { \captionsetup { singlelinecheck = false, justification = justified } }
      {
        \tl_if_eq:NnTF \l__xdu_ft_cap_align_tl { centering }
          { \captionsetup { singlelinecheck = false, justification = centerlast } }
          { \captionsetup { singlelinecheck = true, justification = justified   } }
      }
  }
\DeclareCaptionFont { algcustomfont }
  {
    \__xdu_rm_family:
    \bool_if:NTF \l__xdu_alg_small_cap_bool
      { \zihao { 5  } }
      { \zihao { -4 } }
  }
\captionsetup* [ algorithm ]
  {
    labelsep  = customskip,
    labelfont = algcustomfont,
    font      = algcustomfont
  }
\ctex_at_end_preamble:n
  {
    \tl_if_eq:NnTF \l__xdu_alg_cap_format_tl { hang }
      { \captionsetup* [ algorithm ] { format = hang  } }
      { \captionsetup* [ algorithm ] { format = plain } }
    \captionsetup* [ ruled ] { strut = off }
    \tl_if_eq:NnTF \l__xdu_alg_cap_align_tl { left }
      {
        \captionsetup* [ algorithm ]
          { singlelinecheck = false, justification = justified }
      }
      {
        \tl_if_eq:NnTF \l__xdu_alg_cap_align_tl { centering }
          {
            \captionsetup* [ algorithm ]
              { singlelinecheck = false, justification = centerlast }
          }
          {
            \captionsetup* [ ruled     ] { singlelinecheck = true    }
            \captionsetup* [ algorithm ] { justification = justified }
          }
      }
  }
\ctex_at_end_preamble:n
  {
    \bool_if:NT \l__xdu_add_alg_rule_vspace_bool
      {
        \@ifpackageloaded { algorithm }
          {
            \cs_set:Npn \fs@ruled
              {
                \cs_set_eq:NN \@fs@capt \floatc@plain
                \cs_set:Npn   \@fs@pre  { \hrule height .8pt depth 0pt \kern 5pt }
                \cs_set:Npn   \@fs@post { \kern 5pt \hrule \relax                }
                \cs_set:Npn   \@fs@mid  { \kern 5pt \hrule \kern 5pt             }
                \cs_set_eq:NN \@fs@iftopcapt \iftrue
              }
          }
          { }
      }
  }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { algorithm2e }
      {
        \SetAlgoCaptionSeparator { \hbox_to_wd:nn { \l__xdu_cap_label_sep_tl } { } }
        \bool_if:NTF \l__xdu_alg_small_cap_bool
          {
            \SetAlCapNameFnt         { \__xdu_rm_family: \zihao { 5  } }
            \SetAlCapFnt             { \__xdu_rm_family: \zihao { 5  } }
          }
          {
            \SetAlCapNameFnt         { \__xdu_rm_family: \zihao { -4 } }
            \SetAlCapFnt             { \__xdu_rm_family: \zihao { -4 } }
          }
        \SetAlCapSty { }
        \RenewDocumentCommand { \algocf@makecaption } { mm }
          {
            \box_clear_new:N \l__xdu_algiie_capt_box
            \hbox_set:Nn \l__xdu_algiie_capt_box
              { \AlCapFnt #1 \algocf@capseparator \AlCapNameFnt #2 }
            \dim_compare:nNnTF { \box_wd:N \l__xdu_algiie_capt_box } > { \hsize }
              {
                \tl_if_eq:NnTF \l__xdu_alg_cap_format_tl { hang }
                  {
                    \tl_if_eq:NnTF \l__xdu_alg_cap_align_tl { centering }
                      {
                        \makebox { \AlCapFnt #1 \algocf@capseparator }
                        \makebox
                          {
                            \parbox [ t ] { \hsize }
                              { \centering \AlCapNameFnt #2 }
                          }
                      }
                      {
                        \makebox { \AlCapFnt #1 \algocf@capseparator }
                        \makebox { \parbox [ t ] { \hsize } { \AlCapNameFnt #2 } }
                      }
                  }
                  {
                    \tl_if_eq:NnTF \l__xdu_alg_cap_align_tl { centering }
                      {
                        \parbox { \columnwidth }
                          { \centering \AlCapFnt #1 \algocf@capseparator \AlCapNameFnt #2 }
                      }
                      {
                        \parbox { \columnwidth }
                          { \AlCapFnt #1 \algocf@capseparator \AlCapNameFnt #2 }
                      }
                  }
              }
              {
                \tl_if_eq:NnTF \l__xdu_alg_cap_align_tl { left }
                  {
                    \parbox { \columnwidth }
                      { \AlCapFnt #1 \algocf@capseparator \AlCapNameFnt #2 }
                  }
                  {
                    \parbox { \columnwidth }
                      { \centering \AlCapFnt #1 \algocf@capseparator \AlCapNameFnt #2 }
                  }
              }
          }
        \RenewDocumentCommand { \algocf@makecaption@ruled } { mm }
          { \global \sbox \algocf@capbox { \algocf@makecaption { #1 } { #2 } } }
        \RenewDocumentCommand { \algocf@makecaption@boxed } { mm }
          { \global \sbox \algocf@capbox { \algocf@makecaption { #1 } { #2 } } }
      }
      { }
  }
\ctex_at_end_preamble:n
  {
    \bool_if:NT \l__xdu_add_alg_rule_vspace_bool
      {
        \@ifpackageloaded { algorithm2e }
          {
            \dim_set:Nn \interspacetitleruled { 5pt }
            \dim_set:Nn \interspacealgoruled  { 5pt }
          }
          { }
      }
  }
\cs_new:Npn \__xdu_tblr_caption_box:n #1
  { \makebox [ \tablewidth ] { \parbox { \columnwidth } { #1 } } }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { tabularray }
      {
        \SetTblrOuter [ tblr, longtblr, talltblr ]
          { presep = \belowcaptionskip + \intextsep, headsep = \abovecaptionskip }
        \SetTblrStyle { head } { font = \__xdu_rm_family: \zihao { 5 } }
        \DefTblrTemplate { caption-sep } { default }
          { \hskip \l__xdu_cap_label_sep_tl }
        \tl_if_eq:NnTF \l__xdu_cap_format_tl { hang }
          {
            \DefTblrTemplate { firsthead } { default }
              { \__xdu_tblr_caption_box:n { \UseTblrTemplate { caption  } { default } } }
            \DefTblrTemplate { middlehead, lasthead } { default }
              { \__xdu_tblr_caption_box:n { \UseTblrTemplate { capcont  } { default } } }
          }
          {
            \DefTblrTemplate { firsthead } { default }
              { \__xdu_tblr_caption_box:n { \UseTblrTemplate { caption  } { plain } } }
            \DefTblrTemplate { middlehead, lasthead } { default }
              { \__xdu_tblr_caption_box:n { \UseTblrTemplate { capcont  } { plain } } }
          }
        \DefTblrTemplate { firstfoot, middlefoot } { default }
          { \__xdu_tblr_caption_box:n { \UseTblrTemplate { contfoot } { default } } }
        \DefTblrTemplate { lastfoot } { default }
          {
            \__xdu_tblr_caption_box:n
              {
                \UseTblrTemplate { note   } { default }
                \UseTblrTemplate { remark } { default }
              }
          }
        \DefTblrTemplate { conthead-text } { default }
          { \__xdu_lang_switch:nn { （续表） } { (Continued) } }
        \DefTblrTemplate { contfoot-text } { default }
          { \__xdu_lang_switch:nn { 接下页 } { Continued~on~next~page } }
      }
      { }
  }
\ctex_at_end_preamble:n
  {
    \tl_if_eq:NnTF \l__xdu_figure_align_tl { left }
      {
          \AtBeginEnvironment { figure }
            { \g@addto@macro { \@floatboxreset } { \raggedright } }
      }
      {
        \tl_if_eq:NnTF \l__xdu_figure_align_tl { centering }
          {
            \AtBeginEnvironment { figure }
              { \g@addto@macro { \@floatboxreset } { \centering } }
          }
          {
            \AtBeginEnvironment { figure }
              { \g@addto@macro { \@floatboxreset } { \raggedleft } }
          }
      }
  }
\PassOptionsToPackage { font = small } { subfig }
\captionsetup* [ sub ] { font = customfont }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { subfig }
      { \captionsetup [ subfloat ] { subrefformat = parens } }
      { }
  }
\PassOptionsToPackage { labelformat = simple } { subcaption }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { subcaption }
      {
        \cs_set:Npn \thesubfigure { ( \alph { subfigure } ) }
        \cs_set:Npn \thesubtable  { ( \alph { subtable  } ) }
      }
      { }
  }
\ctex_at_end_preamble:n
  {
    \tl_if_eq:NnTF \l__xdu_table_align_tl { left }
      {
          \AtBeginEnvironment { table }
            { \g@addto@macro { \@floatboxreset } { \raggedright } }
      }
      {
        \tl_if_eq:NnTF \l__xdu_table_align_tl { centering }
          {
            \AtBeginEnvironment { table }
              { \g@addto@macro { \@floatboxreset } { \centering } }
          }
          {
            \AtBeginEnvironment { table }
              { \g@addto@macro { \@floatboxreset } { \raggedleft } }
          }
      }
  }
\ctex_at_end_preamble:n
  {
    \bool_if:NT \l__xdu_tab_small_bool
      {
        \AtBeginEnvironment { table }
          { \g@addto@macro { \@floatboxreset } { \small } }
      }
  }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { longtable }
      {
        \bool_if:NT \l__xdu_tab_small_bool
          {
            \ctex_gadd_ltxhook:nn
              { env/longtable/begin }
              { \small }
          }
      }
      { }
  }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { tabularray }
      {
        \bool_if:NT \l__xdu_tab_small_bool
          {
            \ctex_gadd_ltxhook:nn
              { env/tblr/begin }
              { \small }
            \ctex_gadd_ltxhook:nn
              { env/longtblr/begin }
              { \small }
          }
      }
      { }
  }
\RequirePackage { hyperref }
\hypersetup
  {
    bookmarksnumbered,
    hidelinks
  }
\ctex_at_end_preamble:n
  {
    \hypersetup
      {
        pdftitle   = \l__xdu_pure_title_tl,
        pdfsubject = \l__xdu_header_str,
        pdfcreator = { XeLaTeX~with~xdupgthesis~class~in~XDUTS },
        pdfauthor  = \l__xdu_author_str
      }
  }
\ctex_at_end_preamble:n
  {
    \bool_if:NT \l__xdu_ref_add_space_bool
      {
        \str_if_eq:NNT { \l__xdu_lang_tl } { zh }
          {
            \RequirePackage { xspace }
            \xspaceaddexceptions { 。？！，、；：“”‘’—….－-～·《》<>＿ }
            \cs_generate_variant:Nn \str_if_in:nnTF { xnTF }
            \ctex_after_end_preamble:n
              {
                \cs_set_eq:NN \__xdu_trad_ref:n \ref
                \cs_set:Npn \ref #1
                  {
                    \str_if_in:xnTF { \__hyp_get_anchor:n { #1 } } { chapter }
                      {         \__xdu_trad_ref:n { #1 }         }
                      { \xspace \__xdu_trad_ref:n { #1 } \xspace }
                  }
                \cs_set_eq:NN \__xdu_trad_page_ref:n \pageref
                \cs_set:Npn \pageref #1
                  { \xspace \__xdu_trad_page_ref:n { #1 } \xspace }
              }
          }
      }
  }
\cs_new_protected:Npn \__xdu_begin_document:n #1
  { \ctex_gadd_ltxhook:nn { env/document/begin } { #1 } }
\PassOptionsToPackage { sort&compress       } { gbt7714  }
\PassOptionsToPackage { style = gb7714-2015 } { biblatex }
\__xdu_begin_document:n
  {
    \tl_if_eq:NnTF \l__xdu_bib_tool_tl { bibtex }
      {
        \RequirePackage { gbt7714 }
        \bibliographystyle { gbt7714-numerical }
        \cs_set:Npn \@biblabel #1 { \hfill [ #1 ] }
        \cs_set:Npn \bibsection { }
        \dim_set:Nn \bibsep { 0pt }
        \NewDocumentCommand \parencite { m }
          { \group_begin: \citestyle { numbers } \cite { #1 } \group_end: }
      }
      {
        \PassOptionsToPackage { \l__xdu_biblatex_option_tl } { biblatex }
        \RequirePackage { biblatex }
        \clist_map_inline:Nn \l__xdu_bib_file_clist { \addbibresource { #1 } }
        \defbibheading { bibliography } [ ] { }
        \dim_set:Nn \biblabelsep { 1ex }
        \dim_set:Nn \bibitemsep { 0pt }
        \cs_set_eq:NN \SlashFont \rmfamily
      }
    \cs_set:Npn \bibfont
      {
        \rmfamily
        \zihao { 5 }
        \dim_set:Nn \baselineskip { 20pt }
      }
  }
\ctex_at_end_preamble:n
  {
    \tl_if_eq:NnT \l__xdu_bib_tool_tl { bibtex }
      {
        \bool_if:NT \l__xdu_rm_ref_bool
          { \RequirePackage { bibentry } }
      }
  }
\cs_new:Npn \__xdu_appendix:
  {
    \cs_set:Npn \appendixname { \__xdu_lang_switch:nn { 附录 } { Appendix } }
    \tl_set_eq:NN \l__xdu_chaptername \appendixname
    \cs_set_eq:NN \__xdu_Roman: \__xdu_Alph:
    \appendix
    \renewcommand { \thefigure } { \thechapter \arabic { figure } }
    \renewcommand { \thetable  } { \thechapter \arabic { table  } }
    \cs_if_exist:NT \thealgorithm
      { \cs_set:Npn \thealgorithm { \thechapter \arabic { algorithm } } }
    \cs_if_exist:NT \thealgocf
      { \cs_set:Npn \thealgocf { \thechapter \arabic { algocf } } }
    \bool_if_exist:NTF \l__xdu_rm_appendix_bool
      {
        \bool_if:NF \l__xdu_rm_appendix_bool
          {
            \clist_map_inline:Nn \l__xdu_appendix_clist
              { \file_if_exist_input:n { ##1 } }
          }
      }
      {
        \clist_map_inline:Nn \l__xdu_appendix_clist
          { \file_if_exist_input:n { ##1 } }
      }
  }
\bool_new:N \l__xdu_phd
\bool_new:N \l__xdu_master
\bool_new:N \l__xdu_ac
\bool_new:N \l__xdu_pro
\ctex_at_end_preamble:n
  {
    \tl_if_eq:NnTF \l__xdu_gr_type_tl { 硕士 }
      { \bool_set_true:N \l__xdu_master }
      { \bool_set_true:N \l__xdu_phd }
    \tl_if_eq:NnTF \l__xdu_degree_type_tl { 学术 }
      { \bool_set_true:N \l__xdu_ac  }
      { \bool_set_true:N \l__xdu_pro }
  }
\cs_new:Npn \__xdu_cover_i:nnnnn #1#2#3#4#5
  {
    \dim_set:Nn \baselineskip { 20pt }
    \vbox_to_ht:nn { #1 }
      {
        \vfill
        \mode_leave_vertical:
        \hfil
        \use:c { #2 family } \zihao { #3 }
        \str_if_eq:nnTF { #4 } { bf } { \bfseries } { }
        #5
        \hfil
      }
  }
\cs_new:Npn \__xdu_cover_ii:nnnn #1#2#3#4
  {
    \dim_set:Nn \baselineskip { 20pt }
    \vbox_to_ht:nn { 25pt }
      {
        \vfill
        \mode_leave_vertical:
        \hfil
        \hbox:n
          {
            \zihao { 4 } \bfseries
            \hbox_to_wd:nn { #1 } { \sffamily #2 }
            \skip_horizontal:n { 0.5em }
            \__xdu_uline:n
              {
                \skip_horizontal:n { 9em - #1 }
                \hbox_to_wd:nn { #3 } { \hfil \rmfamily #4 \hfil }
              }
          }
        \hfil
      }
  }
\cs_new:Npn \__xdu_cover_iii:nnnn #1#2#3#4
  {
    \dim_set:Nn \baselineskip { 20pt }
    \hbox:n
      {
        \rmfamily \zihao { 5 } \bfseries
        \hbox_to_wd:nn { #1 } { #2 }
        \skip_horizontal:n { 0.5em }
        \__xdu_uline:n { \hbox_to_wd:nn { #3 } { \hfil #4 \hfil } }
      }
  }
\cs_new:Npn \__xdu_en_month:n #1
  {
    \str_case:Vn #1
      {
        { 1  } { January   }
        { 2  } { February  }
        { 3  } { March     }
        { 4  } { April     }
        { 5  } { May       }
        { 6  } { June      }
        { 7  } { July      }
        { 8  } { August    }
        { 9  } { September }
        { 10 } { October   }
        { 11 } { November  }
        { 12 } { December  }
        { 01 } { January   }
        { 02 } { February  }
        { 03 } { March     }
        { 04 } { April     }
        { 05 } { May       }
        { 06 } { June      }
        { 07 } { July      }
        { 08 } { August    }
        { 09 } { September }
      }
  }
\cs_new:Npn \__xdu_zh_today:
  { \int_use:N \c_sys_year_int 年 \int_use:N \c_sys_month_int 月 }
\cs_new:Npn \__xdu_en_today:
  { \__xdu_en_month:n { \c_sys_month_int } ~ \int_use:N \c_sys_year_int }
\seq_new:N \l__xdu_submit_date_seq
\cs_new:Npn \__xdu_split_submit_date:N #1
  {
    \seq_set_split:NnV \l__xdu_submit_date_seq { - } \l__xdu_submit_date_str
    \clist_set_from_seq:NN #1 \l__xdu_submit_date_seq
  }
\clist_new:N \l__xdu_submit_date_clist
\cs_new:Npn \__xdu_zh_submit_date:
  {
    \str_if_empty:NTF \l__xdu_submit_date_str
      { \__xdu_zh_today: }
      {
        \__xdu_split_submit_date:N \l__xdu_submit_date_clist
        \clist_item:Nn \l__xdu_submit_date_clist { 1 } 年
        \clist_item:Nn \l__xdu_submit_date_clist { 2 } 月
      }
  }
\str_new:N \l__xdu_submit_date_month_str
\cs_new:Npn \__xdu_en_submit_date:
  {
    \str_if_empty:NTF \l__xdu_submit_date_str
      { \__xdu_en_today: }
      {
        \__xdu_split_submit_date:N \l__xdu_submit_date_clist
        \str_set:Nx \l__xdu_submit_date_month_str
          { \clist_item:Nn \l__xdu_submit_date_clist { 2 } }
        \__xdu_en_month:n { \l__xdu_submit_date_month_str } ~
        \clist_item:Nn \l__xdu_submit_date_clist { 1 }
      }
  }
\cs_new:Npn \__xdu_cover_author_info:
  {
    \rmfamily \zihao { 4 }
    \dim_new:N \l__xdu_cover_author_info_dim
    \dim_set:Nn \l__xdu_cover_author_info_dim { 7em }
    \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim { \l__xdu_author_str }
    \bool_if:NTF \l__xdu_pro
      {
        \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim
          { \l__xdu_supv_str \enskip \l__xdu_supv_t_str }
        \str_if_empty:NF \l__xdu_supv_ii_str
          {
            \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim
              { \l__xdu_supv_ii_str \enskip \l__xdu_supv_ii_t_str }
          }
        \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim
          { \l__xdu_supv_ent_str \enskip \l__xdu_supv_ent_t_str }
      }
      {
        \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim
          { \l__xdu_supv_str \enskip \l__xdu_supv_t_str }
        \str_if_empty:NF \l__xdu_supv_ii_str
          {
            \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim
              { \l__xdu_supv_ii_str \enskip \l__xdu_supv_ii_t_str }
          }
      }
    \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim { \l__xdu_degree_str }
    \dim_add:Nn \l__xdu_cover_author_info_dim { 3em }
    \__xdu_cover_ii:nnnn { 4em } { 作者姓名 }
      { \l__xdu_cover_author_info_dim }
      { \l__xdu_author_str }
    \bool_if:NTF \l__xdu_pro
      {
        \__xdu_cover_ii:nnnn { 9em } { 学校导师姓名、职称 }
          { \l__xdu_cover_author_info_dim }
          { \l__xdu_supv_str \enskip \l__xdu_supv_t_str }
        \str_if_empty:NF \l__xdu_supv_ii_str
          {
            \__xdu_cover_ii:nnnn { 9em } { }
              { \l__xdu_cover_author_info_dim }
              { \l__xdu_supv_ii_str \enskip \l__xdu_supv_ii_t_str }
          }
        \__xdu_cover_ii:nnnn { 9em } { 企业导师姓名、职称 }
          { \l__xdu_cover_author_info_dim }
          { \l__xdu_supv_ent_str \enskip \l__xdu_supv_ent_t_str }
      }
      {
        \__xdu_cover_ii:nnnn { 9em } { 指导教师姓名、职称 }
          { \l__xdu_cover_author_info_dim }
          { \l__xdu_supv_str \enskip \l__xdu_supv_t_str }
        \str_if_empty:NF \l__xdu_supv_ii_str
          {
            \__xdu_cover_ii:nnnn { 9em } { }
              { \l__xdu_cover_author_info_dim }
              { \l__xdu_supv_ii_str \enskip \l__xdu_supv_ii_t_str }
          }
      }
    \__xdu_cover_ii:nnnn { 6em } { 申请学位类别 }
      { \l__xdu_cover_author_info_dim }
      { \l__xdu_degree_str }
  }
\cs_new:Npn \__xdu_zh_title_page_info:
  {
    \rmfamily \zihao { 4 }
    \dim_new:N \l__xdu_zh_title_page_info_dim
    \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
      { 作者姓名：\l__xdu_author_str }
    \bool_if:NTF \l__xdu_ac
      {
        \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
          { 一级学科：\l__xdu_major_str }
        \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
          { 二级学科（研究方向）：\l__xdu_sub_major_str }
      }
      {
        \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
          { 领\qquad{}域：\l__xdu_domain_str }
      }
      \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
        { 学位类别：\l__xdu_degree_str }
    \bool_if:NTF \l__xdu_pro
      {
        \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
          { 学校导师姓名、职称：\l__xdu_supv_str \enskip \l__xdu_supv_t_str }
        \str_if_empty:NF \l__xdu_supv_ii_str
          {
            \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
              { 学校导师姓名、职称：\l__xdu_supv_ii_str \enskip \l__xdu_supv_ii_t_str }
          }
        \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
          { 企业导师姓名、职称：\l__xdu_supv_ent_str \enskip \l__xdu_supv_ent_t_str }
      }
      {
        \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
          { 指导教师姓名、职称：\l__xdu_supv_str \enskip \l__xdu_supv_t_str }
        \str_if_empty:NF \l__xdu_supv_ii_str
          {
            \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
              { 指导教师姓名、职称：\l__xdu_supv_ii_str \enskip \l__xdu_supv_ii_t_str }
          }
      }
    \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
      { 学\qquad{}院：\l__xdu_dept_str }
    \__xdu_str_max_dim:Nn \l__xdu_zh_title_page_info_dim
      { 提交日期：\__xdu_zh_submit_date: }
    \dim_new:N \l__xdu_zh_title_page_info_skip_dim
    \dim_set_eq:NN \l__xdu_zh_title_page_info_skip_dim \linewidth
    \dim_sub:Nn \l__xdu_zh_title_page_info_skip_dim { \l__xdu_zh_title_page_info_dim }
    \skip_horizontal:n { \dim_eval:n { \l__xdu_zh_title_page_info_skip_dim / 2 } }
    \vbox:n
      {
        \rmfamily \zihao { 4 }
        \dim_set:Nn \baselineskip { 32pt }
        { \bfseries 作者姓名： } \l__xdu_author_str
        \bool_if:NTF \l__xdu_ac
          {
            \par
            { \bfseries 一级学科： } \l__xdu_major_str
            \par
            { \bfseries 二级学科（研究方向）： } \l__xdu_sub_major_str
          }
          {
            \par
            { \bfseries 领\qquad{}域： } \l__xdu_domain_str
          }
        \par
        { \bfseries 学位类别： } \l__xdu_degree_str
        \bool_if:NTF \l__xdu_pro
          {
            \par
            { \bfseries 学校导师姓名、职称： }
            \l__xdu_supv_str \enskip \l__xdu_supv_t_str
            \str_if_empty:NF \l__xdu_supv_ii_str
              {
                \par
                \phantom { 学校导师姓名、职称： }
                \l__xdu_supv_ii_str \enskip \l__xdu_supv_ii_t_str
              }
            \par
            { \bfseries 企业导师姓名、职称： }
            \l__xdu_supv_ent_str \enskip \l__xdu_supv_ent_t_str
          }
          {
            \par
            { \bfseries 指导教师姓名、职称： }
            \l__xdu_supv_str \enskip \l__xdu_supv_t_str
            \str_if_empty:NF \l__xdu_supv_ii_str
              {
                \par
                \phantom { 指导教师姓名、职称： }
                \l__xdu_supv_ii_str \enskip \l__xdu_supv_ii_t_str
              }
          }
        \par
        { \bfseries 学\qquad{}院： } \l__xdu_dept_str
        \par
        { \bfseries 提交日期： } \__xdu_zh_submit_date:
      }
  }
\cs_new:Npn \__xdu_zh_title_page:
  {
    \vbox:n { }
    \skip_vertical:n { -7.5pt }
    \dim_set:Nn \baselineskip { 15.6bp }
    \vbox:n
      {
        \mode_leave_vertical:
        \__xdu_cover_iii:nnnn { 4em } { 学校代码 } { 7em } { 10701                }
        \hfill
        \__xdu_cover_iii:nnnn { 3em } { 学号     } { 7em } { \l__xdu_student_id_str }
      }
    \vbox:n
      {
        \mode_leave_vertical:
        \__xdu_cover_iii:nnnn { 4em } { 分类号   } { 7em } { \l__xdu_clc_str        }
        \hfill
        \__xdu_cover_iii:nnnn { 3em } { 密级     } { 7em } { \l__xdu_secret_lv_str  }
      }
    \__xdu_cover_i:nnnnn { 100pt  } { sf } { 1  } { bf } { 西安电子科技大学   }
    \__xdu_cover_i:nnnnn { 85pt   } { rm } { -1 } { bf } { \l__xdu_gr_type_tl 学位论文 }
    \skip_vertical:n { 87.5pt }
    \vbox_to_ht:nn { 150pt }
      {
        \rmfamily \zihao { 2 } \bfseries \__xdu_bold_math: \centering
        \dim_set:Nn \baselineskip { 30pt }
        \l__xdu_title_tl
      }
    \group_begin:
      \__xdu_zh_title_page_info:
    \group_end:
    \cleardoublepage
  }
\dim_new:N \l__xdu_supv_dim
\dim_new:N \l__xdu_supv_max_dim
\box_new:N \l__xdu_supv_box
\cs_new:Npn \__xdu_en_title_supv:n #1
  {
    \rmfamily \zihao { 3 }
    \dim_zero:N \l__xdu_supv_max_dim
    \hbox_set:Nn \l__xdu_supv_box { \l__xdu_supv_en_str }
    \dim_set:Nn \l__xdu_supv_dim { \box_wd:N \l__xdu_supv_box }
    \dim_set:Nn \l__xdu_supv_max_dim
      { \dim_max:nn { \l__xdu_supv_dim } { \l__xdu_supv_max_dim } }
    \str_if_empty:NF \l__xdu_supv_ii_str
      {
        \hbox_set:Nn \l__xdu_supv_box { \l__xdu_supv_ii_en_str }
        \dim_set:Nn \l__xdu_supv_dim { \box_wd:N \l__xdu_supv_box }
        \dim_set:Nn \l__xdu_supv_max_dim
          { \dim_max:nn { \l__xdu_supv_dim } { \l__xdu_supv_max_dim } }
      }
    \bool_if:NT \l__xdu_pro
      {
        \hbox_set:Nn \l__xdu_supv_box { \l__xdu_supv_ent_en_str }
        \dim_set:Nn \l__xdu_supv_dim { \box_wd:N \l__xdu_supv_box }
        \dim_set:Nn \l__xdu_supv_max_dim
          { \dim_max:nn { \l__xdu_supv_dim } { \l__xdu_supv_max_dim } }
      }
    \hbox_to_wd:nn { \l__xdu_supv_max_dim } { #1 \hfil } \quad
  }
\dim_new:N \l__xdu_supv_t_dim
\dim_new:N \l__xdu_supv_t_max_dim
\box_new:N \l__xdu_supv_t_box
\cs_new:Npn \__xdu_en_title_supv_t:n #1
  {
    \rmfamily \zihao { 3 }
    \dim_zero:N \l__xdu_supv_t_max_dim
    \hbox_set:Nn \l__xdu_supv_t_box { \l__xdu_supv_t_en_str }
    \dim_set:Nn \l__xdu_supv_t_dim { \box_wd:N \l__xdu_supv_t_box }
    \dim_set:Nn \l__xdu_supv_t_max_dim
      { \dim_max:nn { \l__xdu_supv_t_dim } { \l__xdu_supv_t_max_dim } }
    \str_if_empty:NF \l__xdu_supv_ii_str
      {
        \hbox_set:Nn \l__xdu_supv_t_box { \l__xdu_supv_ii_t_en_str }
        \dim_set:Nn \l__xdu_supv_t_dim { \box_wd:N \l__xdu_supv_t_box }
        \dim_set:Nn \l__xdu_supv_t_max_dim
          { \dim_max:nn { \l__xdu_supv_t_dim } { \l__xdu_supv_t_max_dim } }
      }
    \bool_if:NT \l__xdu_pro
      {
        \hbox_set:Nn \l__xdu_supv_t_box { \l__xdu_supv_ent_t_en_str }
        \dim_set:Nn \l__xdu_supv_t_dim { \box_wd:N \l__xdu_supv_t_box }
        \dim_set:Nn \l__xdu_supv_t_max_dim
          { \dim_max:nn { \l__xdu_supv_t_dim } { \l__xdu_supv_t_max_dim } }
      }
    \hbox_to_wd:nn { \l__xdu_supv_t_max_dim } { #1 \hfil } \quad
  }
\cs_new:Npn \__xdu_en_title_page:
  {
    \vbox:n { }
    \skip_vertical:n { -3.5pt }
    \dim_set:Nn \baselineskip { 30pt }
    \vbox_to_ht:nn { 170pt }
      {
        \rmfamily \zihao { 2 } \bfseries \__xdu_bold_math: \centering
        \dim_set:Nn \baselineskip { 30pt }
        \l__xdu_title_en_str
      }
    \vbox_to_ht:nn { 360pt }
      {
        \rmfamily \zihao { 3 } \centering
        \dim_set:Nn \baselineskip { 30pt }
        A
        \bool_if:NTF \l__xdu_master { ~thesis~ } { ~dissertation~ }
        submitted~to\\
        XIDIAN~UNIVERSITY\\
        in~partial~fulfillment~of~the~requirements\\
        for~the~degree~of
        \bool_if:NTF \l__xdu_master { ~Master\\ } { ~Doctor~of~Philosophy\\ }
        in
        \bool_if:NTF \l__xdu_pro
          { ~\l__xdu_degree_en_str\\ }
          { ~\l__xdu_major_en_str\\  }
      }
    \vbox:n
      {
        \rmfamily \zihao { 3 } \centering
        \dim_set:Nn \baselineskip { 30pt }
        By\\
        \l__xdu_author_en_str
        \str_if_empty:NTF \l__xdu_author_en_str
          { \skip_vertical:N \baselineskip }
          { \\ }
        Supervisor:~\__xdu_en_title_supv:n { \l__xdu_supv_en_str }
        Title:~\__xdu_en_title_supv_t:n { \l__xdu_supv_t_en_str } \\
        \str_if_empty:NF \l__xdu_supv_ii_str
          {
            \phantom { Supervisor:~ } \__xdu_en_title_supv:n { \l__xdu_supv_ii_en_str }
            \phantom { Title:~ } \__xdu_en_title_supv_t:n { \l__xdu_supv_ii_t_en_str } \\
          }
        \bool_if:NT \l__xdu_pro
          {
            Supervisor:~ \__xdu_en_title_supv:n { \l__xdu_supv_ent_en_str }
            Title:~ \__xdu_en_title_supv_t:n { \l__xdu_supv_ent_t_en_str } \\
          }
        \__xdu_en_submit_date:
      }
    \cleardoublepage
  }
\cs_new:Npn \__xdu_statement_scan_sign_uline:n #1
  {
    \__xdu_uline:n
      {
        \vbox_to_ht:nn { 17.5pt }
          {
            \vfil
            \hbox_to_wd:nn { 10em }
              {
                \hfil
                \includegraphics [ width = 10em, height = 25pt, keepaspectratio ] { #1 }
                \hfil
              }
          }
      }
  }
\cs_new:Npn \__xdu_statement_scan_sign:nnnn #1#2#3#4
  {
    \vbox_to_ht:nn { 30pt }
      {
        \vfil
        #1：
        \__xdu_statement_scan_sign_uline:n { #2 }
        \hfill
        #3：
        \__xdu_statement_scan_sign_uline:n { #4 }
      }
  }
\cs_new:Npn \__xdu_statement:
  {
    \vbox:n { }
    \skip_vertical:n { -8.5pt }
    \vbox_to_ht:nn { 59.5pt }
      {
        \rmfamily \zihao { 4 } \bfseries \centering
        \dim_set:Nn \baselineskip { 20pt }
        西安电子科技大学\\
        学位论文独创性（或创新性）声明
      }
    \vbox_to_ht:nn { 120pt }
      {
        \rmfamily \zihao { -4 }
        \xeCJKsetup { CJKglue = { \hskip 0pt } }
        \dim_set:Nn \parindent { 2em }
        \dim_set:Nn \baselineskip { 20pt }
        秉承学校严谨的学风和优良的科学道德，本人声明所呈交的论文是我个人在导师指
        导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢
        中所罗列的内容以外，论文中不包含其他人已经发表或撰写过的研究成果；也不包
        含为获得西安电子科技大学或其它教育机构的学位或证书而使用过的材料。与我一
        同工作的同事对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。
        \par
        学位论文若有不实之处，本人承担一切法律责任。
        \vfil
      }
    \clist_if_empty:NT \l__xdu_statement_sign_clist
      { \skip_vertical:n { 20pt } }
    \vbox_to_ht:nn { 155pt }
      {
        \rmfamily \zihao { -4 }
        \dim_set:Nn \parindent { 2em }
        \dim_set:Nn \baselineskip { 20pt }
        \clist_if_empty:NTF \l__xdu_statement_sign_clist
          {
            本人签名：\__xdu_uline:n { \skip_horizontal:n { 10em } }
            \hfill
            日\qquad{}期：\__xdu_uline:n { \skip_horizontal:n { 10em } }
          }
          {
            \__xdu_statement_scan_sign:nnnn
              { 本人签名     } { \clist_item:Nn \l__xdu_statement_sign_clist { 1 } }
              { 日\qquad{}期 } { \clist_item:Nn \l__xdu_statement_sign_clist { 2 } }
          }
      }
    \clist_if_empty:NF \l__xdu_statement_sign_clist
      { \skip_vertical:n { 20pt } }
    \vbox_to_ht:nn { 60pt }
      {
        \rmfamily \zihao { 4 } \bfseries \centering
        \dim_set:Nn \baselineskip { 20pt }
        西安电子科技大学\\
        关于论文使用授权的说明
      }
    \vbox_to_ht:nn { 160pt }
      {
        \rmfamily \zihao { -4 }
        \xeCJKsetup { CJKglue = { \hskip 0pt } }
        \dim_set:Nn \parindent { 2em }
        \dim_set:Nn \baselineskip { 20pt }
        本人完全了解西安电子科技大学有关保留和使用学位论文的规定，即：研究生在校
        攻读学位期间论文工作的知识产权属于西安电子科技大学。学校有权保留并向国家
        有关部门或机构送交学位论文的复印件和电子版，以学术交流为目的赠送和交换学
        位论文，允许学位论文被查阅、借阅和复印，将学位论文的全部或部分内容编入有
        关数据库进行检索和提供相应阅览服务；允许采用影印、缩印或其它复制手段保存
        学位论文。同时本人保证，结合学位论文研究成果完成的论文、发明专利等成果，
        署名单位为西安电子科技大学。
        \par
        本人保证遵守上述规定。
        \par
        （保密的论文在解密后遵守此规定）
        \vfil
      }
    \clist_if_empty:NT \l__xdu_statement_sign_clist
      { \skip_vertical:n { 20pt } }
    \vbox:n
      {
        \rmfamily \zihao { -4 }
        \dim_set:Nn \parindent { 2em }
        \dim_set:Nn \baselineskip { 40pt }
        \clist_if_empty:NTF \l__xdu_statement_sign_clist
          {
            本人签名：\__xdu_uline:n { \skip_horizontal:n { 10em } }
            \hfill
            导师签名：\__xdu_uline:n { \skip_horizontal:n { 10em } }
            \par
            日\qquad{}期：\__xdu_uline:n { \skip_horizontal:n { 10em } }
            \hfill
            日\qquad{}期：\__xdu_uline:n { \skip_horizontal:n { 10em } }
          }
          {
            \__xdu_statement_scan_sign:nnnn
              { 本人签名     } { \clist_item:Nn \l__xdu_statement_sign_clist { 3 } }
              { 导师签名     } { \clist_item:Nn \l__xdu_statement_sign_clist { 5 } }
            \par
            \__xdu_statement_scan_sign:nnnn
              { 日\qquad{}期 } { \clist_item:Nn \l__xdu_statement_sign_clist { 4 } }
              { 日\qquad{}期 } { \clist_item:Nn \l__xdu_statement_sign_clist { 6 } }
          }
      }
    \cleardoublepage
  }
\cs_new:Npn \__xdu_zh_abstract_keywords:
  {
    \__xdu_n_chapter_head_toc:nn { 摘要 } { 摘 { \quad } 要 }
    \__xdu_lang_switch:nn { } { \__xdu_add_zh_toc:nn { chapter } { 摘要 } }
    \group_begin:
      \dim_set:Nn \parindent { 2 \ccwd }
      \rmfamily \zihao { -4 }
      \dim_set:Nn \baselineskip { 20pt }
      \file_if_exist_input:n { \l__xdu_abstract_zh_tl }
    \group_end:
    \group_begin:
      \rmfamily \zihao { -4 }
      \dim_set:Nn \baselineskip { 20pt }
      \skip_vertical:n { 20pt }
      \__xdu_typeout_keywords:nNn
        { \textbf { 关键词 } ： } { \l__xdu_keywords_zh_clist } { ， }
    \group_end:
    \cleardoublepage
  }
\cs_new:Npn \__xdu_en_abstract_keywords:
  {
    \__xdu_n_chapter_head_toc_ii:nn
      { \textrm { ABSTRACT } } { \centering \rmfamily \zihao { 3 } \dim_set:Nn \baselineskip { 20pt } }
    \__xdu_lang_switch:nn { } { \__xdu_add_zh_toc:nn { chapter } { \textrm { ABSTRACT } } }
    \group_begin:
      \dim_set:Nn \parskip { 20pt }
      \rmfamily \zihao { -4 }
      \dim_set:Nn \baselineskip { 20pt }
      \file_if_exist:nT { \l__xdu_abstract_en_tl } { \skip_vertical:n { -20pt } }
      \file_if_exist_input:n { \l__xdu_abstract_en_tl }
    \group_end:
    \group_begin:
      \rmfamily \zihao { -4 }
      \dim_set:Nn \baselineskip { 20pt }
      \skip_vertical:n { 20pt }
      \__xdu_typeout_keywords:nNn
        { \textbf { Keywords } ： } { \l__xdu_keywords_en_clist } { ,~ }
    \group_end:
    \cleardoublepage
  }
\cs_new:Npn \__xdu_loft_label_num_width:nN #1#2
  {
    \tl_clear_new:N \l__xdu_loft_tl
    \file_get:nnN
      { \jobname.#1 }
      { \let\do\@makeother \dospecials }
      \l__xdu_loft_tl
    \seq_clear_new:N \l__xdu_loft_label_num_seq
    \cs_generate_variant:Nn \regex_extract_all:nnN { nVN }
    \str_if_eq:nnTF { #1 } { lof }
      {
        \regex_extract_all:nVN
          { \\contentsline\ \{figure\}\{\\numberline\ \{\K[0-9A-Z\.]+ }
          \l__xdu_loft_tl \l__xdu_loft_label_num_seq
      }
      {
        \regex_extract_all:nVN
          { \\contentsline\ \{table\}\{\\numberline\ \{\K[0-9A-Z\.]+ }
          \l__xdu_loft_tl \l__xdu_loft_label_num_seq
      }
    \dim_zero_new:N \l__xdu_loft_label_num_dim
    \seq_map_inline:Nn \l__xdu_loft_label_num_seq
      {
        \__xdu_get_text_width:Nn \l__xdu_loft_label_num_dim { ##1 }
        \dim_set:Nn #2 { \dim_max:nn { \l__xdu_loft_label_num_dim } { #2 } }
      }
  }
\cs_new:Npn \__xdu_list_of_figure:
  {
    \__xdu_n_chapter_head_toc:n
      { \__xdu_lang_switch:nn { 插图索引 } { List~of~Figures } }
    \__xdu_lang_switch:nn { } { \__xdu_add_zh_toc:nn { chapter } { 插图索引 } }
    \group_begin:
      \addtocontents { lof } { \vspace { 10pt } }
      \renewcommand { \addvspace } [1] { }
      \tl_set:Nn \cftfigpresnum {  \figurename \space }
      \dim_zero_new:N \l__xdu_lof_label_dim
      \__xdu_get_text_width:NV \l__xdu_lof_label_dim \cftfigpresnum
      \dim_set:Nn \cftfignumwidth { \l__xdu_lof_label_dim }
      \dim_new:N \l__xdu_lof_label_num_max_dim
      \__xdu_loft_label_num_width:nN { lof } \l__xdu_lof_label_num_max_dim
      \dim_add:Nn \cftfignumwidth { \l__xdu_lof_label_num_max_dim }
      \dim_add:Nn \cftfignumwidth { .75em }
      \dim_set:Nn \cftfigindent { 0pt }
      \rmfamily \zihao { -4 } \dim_set:Nn \baselineskip { 20pt }
      \@starttoc { lof }
    \group_end:
    \cleardoublepage
  }
\cs_new:Npn \__xdu_list_of_table:
  {
    \__xdu_n_chapter_head_toc:n
      { \__xdu_lang_switch:nn { 表格索引 } { List~of~Tables } }
    \__xdu_lang_switch:nn { } { \__xdu_add_zh_toc:nn { chapter } { 表格索引 } }
    \group_begin:
      \addtocontents { lot } { \vspace { 10pt } }
      \renewcommand { \addvspace } [1] { }
      \tl_set:Nn \cfttabpresnum {  \tablename \space }
      \dim_zero_new:N \l__xdu_lot_label_dim
      \__xdu_get_text_width:NV \l__xdu_lot_label_dim \cfttabpresnum
      \dim_set:Nn \cfttabnumwidth { \l__xdu_lot_label_dim }
      \dim_new:N \l__xdu_lot_label_num_max_dim
      \__xdu_loft_label_num_width:nN { lot } \l__xdu_lot_label_num_max_dim
      \dim_add:Nn \cfttabnumwidth { \l__xdu_lot_label_num_max_dim }
      \dim_add:Nn \cfttabnumwidth { .75em }
      \dim_set:Nn \cfttabindent { 0pt }
      \rmfamily \zihao { -4 } \dim_set:Nn \baselineskip { 20pt }
      \@starttoc { lot }
    \group_end:
    \cleardoublepage
  }
\ctex_at_end_preamble:n
  {
    \bool_new:N \l__xdu_load_tabularray_bool
    \bool_if:NF \l__xdu_customize_los_bool
      { \bool_set_true:N \l__xdu_load_tabularray_bool }
    \bool_if:NF \l__xdu_customize_loa_bool
      { \bool_set_true:N \l__xdu_load_tabularray_bool }
    \bool_if:NT \l__xdu_load_tabularray_bool
      {
        \RequirePackage { tabularray }
        \UseTblrLibrary { functional }
        \NewTblrTheme { losloatheme }
          {
            \DefTblrTemplate { caption-tag   } { default } { }
            \DefTblrTemplate { caption-sep   } { default } { }
            \DefTblrTemplate { caption-text  } { default } { }
            \DefTblrTemplate { conthead-text } { default } { }
            \DefTblrTemplate { contfoot-text } { default } { }
          }
      }
    \cs_generate_variant:Nn \__tblr_parse_colrow_spec:nn { nV }
  }
\dim_new:N \l__xdu_losa_add_skip_dim
\dim_set:Nn \l__xdu_losa_add_skip_dim { 1.2098pt }
\cs_new:Npn \__xdu_symbols_list:
  {
    \__xdu_n_chapter_head_toc:n
      { \__xdu_lang_switch:nn { 符号对照表 } { List~of~Symbols } }
    \__xdu_lang_switch:nn { } { \__xdu_add_zh_toc:nn { chapter } { 符号对照表 } }
    \bool_if:NTF \l__xdu_customize_los_bool
      {
        \group_begin:
        \zihao { -4 }
        \file_if_exist_input:n { \l__xdu_los_str }
        \group_end:
      }
      {
        \tl_new:N \l__xdu_los_head_tl
        \__xdu_lang_switch:nn
          { \tl_set:Nn \l__xdu_los_head_tl { 符号 & 符号名称 \\        } }
          { \tl_set:Nn \l__xdu_los_head_tl { Notation & Description \\ } }
        \tl_new:N \l__xdu_los_rowhead_tl
        \bool_if:NTF \l__xdu_title_row_los_bool
          { \tl_set:Nn \l__xdu_los_rowhead_tl { 1 } }
          { \tl_set:Nn \l__xdu_los_rowhead_tl { 0 } }
        \tl_new:N \l__xdu_los_begin_tblr_tl
        \tl_set:Nx \l__xdu_los_begin_tblr_tl
          {
            \exp_not:n
              {
                \begin { longtblr }
                  [
                    evaluate = \fileIfExistInput,
                    expand   = \l__xdu_los_head_tl,
                    entry    = none,
                    theme    = losloatheme
                  ]
              }
              {
                colspec = { \exp_not:V \l__xdu_colspec_los_tl },
                \exp_not:n
                  {
                    rowhead  = \int_compare:nNnTF
                                 { \value { rowcount } } > { 1 }
                                 { \l__xdu_los_rowhead_tl } { 0 },
                    cells    = {
                                 font = \rmfamily \zihao { -4 }
                                 \dim_add:Nn \baselineskip { \l__xdu_losa_add_skip_dim }
                               },
                    abovesep = 0pt,
                    belowsep = \l__xdu_losa_add_skip_dim
                  }
              }
          }
        \tl_use:N \l__xdu_los_begin_tblr_tl
          \l__xdu_los_head_tl
          \fileIfExistInput { \l__xdu_los_str }
        \end { longtblr }
      }
  }
\cs_new:Npn \__xdu_abbreviations_list:
  {
    \__xdu_n_chapter_head_toc:n
      { \__xdu_lang_switch:nn { 缩略语对照表 } { List~of~Abbreviations } }
    \__xdu_lang_switch:nn { } { \__xdu_add_zh_toc:nn { chapter } { 缩略语对照表 } }
    \bool_if:NTF \l__xdu_customize_loa_bool
      {
        \group_begin:
        \zihao { -4 }
        \file_if_exist_input:n { \l__xdu_loa_str }
        \group_end:
      }
      {
        \tl_new:N \l__xdu_loa_head_tl
        \__xdu_lang_switch:nn
          {
            \tl_set:Nn \l__xdu_loa_head_tl
              { 缩略语 & 英文全称 & 中文对照 \\ }
          }
          {
            \tl_set:Nn \l__xdu_loa_head_tl
              { Abbreviation & English~Full~Name & Chinese~Full~Name \\ }
          }
        \tl_new:N \l__xdu_loa_rowhead_tl
        \bool_if:NTF \l__xdu_title_row_loa_bool
          { \tl_set:Nn \l__xdu_loa_rowhead_tl { 1 } }
          { \tl_set:Nn \l__xdu_loa_rowhead_tl { 0 } }
        \tl_new:N \l__xdu_loa_begin_tblr_tl
        \tl_set:Nx \l__xdu_loa_begin_tblr_tl
          {
            \exp_not:n
              {
                \begin { longtblr }
                  [
                    evaluate = \fileIfExistInput,
                    expand   = \l__xdu_loa_head_tl,
                    entry    = none,
                    theme    = losloatheme
                  ]
              }
              {
                colspec = { \exp_not:V \l__xdu_colspec_loa_tl },
                \exp_not:n
                  {
                    rowhead  = \int_compare:nNnTF
                                 { \value { rowcount } } > { 1 }
                                 { \l__xdu_loa_rowhead_tl } { 0 },
                    cells    = {
                                 font = \rmfamily \zihao { -4 }
                                 \dim_add:Nn \baselineskip { \l__xdu_losa_add_skip_dim }
                               },
                    abovesep = 0pt,
                    belowsep = \l__xdu_losa_add_skip_dim
                  }
              }
          }
        \tl_use:N \l__xdu_loa_begin_tblr_tl
          \l__xdu_loa_head_tl
          \fileIfExistInput { \l__xdu_loa_str }
        \end { longtblr }
      }
  }
\cs_new:Npn \__xdu_add_zh_toc:nn #1#2
  {
    \str_if_eq:NNTF { #1 } { chapter }
      {
        \phantomsection \addcontentsline { zh.toc }
          { #1 } { \__xdu_sf_family: \__xdu_bold_math: #2 }
      }
      { \phantomsection \addcontentsline { zh.toc } { #1 } { #2 } }
  }
\RenewDocumentCommand { \frontmatter } { } { }
\cs_new:Npn \__xdu_frontmatter:
  {
    \loadgeometry { cover }
    \pagestyle    { empty }
    \dim_set:Nn \parindent { 0pt }
    \dim_set:Nn \baselineskip { 20pt }
    \bool_if:NF \l__xdu_rm_cover_bool
      {
        \vbox:n { }
        \skip_vertical:n { 435pt }
        \vbox_to_ht:nn { 120pt }
          {
            \rmfamily \zihao { 2 } \bfseries \__xdu_bold_math: \centering
            \dim_set:Nn \baselineskip { 30pt }
            \l__xdu_title_tl
          }
        \__xdu_cover_author_info:
        \cleardoublepage
      }
    \bool_if:NF \l__xdu_rm_title_page_bool
      {
        \__xdu_lang_switch:nn
          { \__xdu_zh_title_page: \__xdu_en_title_page: }
          { \__xdu_en_title_page: \__xdu_zh_title_page: }
      }
    \bool_if:NF \l__xdu_rm_statement_bool
      {
        \file_if_exist:nTF { \l__xdu_statement_scan_str }
          {
            \loadgeometry { nomargin }
            \vbox_to_ht:nn { \textheight }
              {
                \vfil
                \centering
                \includegraphics
                  [ width = \textwidth, height = \textheight, keepaspectratio ]
                  { \l__xdu_statement_scan_str }
                \vfil
              }
            \cleardoublepage
          }
          { \__xdu_statement: }
      }
    \__xdu_load_main_geometry:
    \pagestyle     { front }
    \pagenumbering { Roman }
    \dim_set:Nn \baselineskip { 20pt }
    \bool_if:NF \l__xdu_rm_abstract_bool
      {
        \__xdu_lang_switch:nn
          { \__xdu_zh_abstract_keywords: \__xdu_en_abstract_keywords: }
          { \__xdu_en_abstract_keywords: \__xdu_zh_abstract_keywords: }
      }
    \bool_if:NF \l__xdu_rm_lof_bool
      { \__xdu_list_of_figure: }
    \bool_if:NF \l__xdu_rm_lot_bool
      { \__xdu_list_of_table: }
    \bool_if:NF \l__xdu_rm_los_bool
      { \__xdu_symbols_list: }
    \bool_if:NF \l__xdu_rm_loa_bool
      { \__xdu_abbreviations_list: }
    \bool_if:NF \l__xdu_rm_toc_bool
      {
        \setcounter { tocdepth } { 2 }
        \__xdu_n_chapter_head:nn
          { \__xdu_lang_switch:nn { 目录            } { Contents } }
          { \__xdu_lang_switch:nn { 目 { \quad } 录 } { Contents } }
        \@starttoc { toc }
        \cleardoublepage
        \__xdu_lang_switch:nn { }
          {
            \setcounter { tocdepth } { 2 }
            \__xdu_n_chapter_head:nn { 目录 } { \__xdu_sf_family: 目 { \quad } 录 }
            \@starttoc { zh.toc }
            \cleardoublepage
          }
      }
  }
\RenewDocumentCommand { \mainmatter } { } { }
\cs_new:Npn \__xdu_mainmatter:
  {
    \__xdu_load_main_geometry:
    \pagestyle     { plain  }
    \pagenumbering { arabic }
    \dim_set:Nn \parindent { 2 \ccwd }
    \rmfamily \zihao { -4 }
    \dim_set:Nn \baselineskip { 20pt }
    \__xdu_lang_switch:nn { }
      {
        \cs_new_eq:NN \__xdu_org_chapter:n \chapter
        \RenewDocumentCommand { \chapter } { m o }
          {
            \__xdu_org_chapter:n { ##1 }
            \__xdu_add_zh_toc:nn { chapter }
              {
                \numberline { 第 \chinese { chapter } 章 \hspace { .3em } }
                \IfNoValueTF { ##2 } { ##1 } { ##2 }
              }
          }
        \cs_new_eq:NN \__xdu_org_section:n \section
        \RenewDocumentCommand { \section } { m o }
          {
            \__xdu_org_section:n { ##1 }
            \__xdu_add_zh_toc:nn { section }
              { \numberline { \thesection } \IfNoValueTF { ##2 } { ##1 } { ##2 } }
          }
        \cs_new_eq:NN \__xdu_org_subsection:n \subsection
        \RenewDocumentCommand { \subsection } { m o }
          {
            \__xdu_org_subsection:n { ##1 }
            \__xdu_add_zh_toc:nn { subsection }
              { \numberline { \thesubsection } \IfNoValueTF { ##2 } { ##1 } { ##2 } }
          }
      }
    \dim_set:Nn \abovedisplayskip      { 12bp }
    \dim_set:Nn \belowdisplayskip      { 12bp }
    \dim_set:Nn \abovedisplayshortskip { 0bp  }
    \dim_set:Nn \belowdisplayshortskip { 12bp }
  }
\ctex_at_end_preamble:n
  {
      \dim_new:N \l__xdu_bio_indent_dim
      \box_new:N \l__xdu_bio_indent_box
      \hbox_set:Nn \l__xdu_bio_indent_box { \rmfamily \zihao { -3 } \bfseries 1. \quad}
      \dim_set:Nn \l__xdu_bio_indent_dim { \box_wd:N \l__xdu_bio_indent_box }
    \bool_if:NF \l__xdu_cust_edubg_bool
      {
        \RequirePackage { tabularray }
        \newenvironment { edubg }
          {
            \dim_set:Nn \parindent { 0pt }
            \begin { tblr }
              {
                colspec = { @{ \skip_horizontal:N \l__xdu_bio_indent_dim } lX @{ } },
                rows    = { font = \zihao { -4 } \dim_set:Nn \baselineskip { 20pt } }
              }
          }
          {
            \end { tblr }
            \dim_set:Nn \parindent { 2 \ccwd }
          }
      }
    \bool_if:NF \l__xdu_cust_resresult_bool
      {
        \RequirePackage { enumitem }
        \SetEnumitemKey { resresult }
          {
            label   = {[}\arabic*{]},
            left    = \l__xdu_bio_indent_dim,
            align   = right,
            parsep  = 0pt,
            itemsep = 0pt,
            topsep  = 0pt
          }
        \newenvironment { resresult }
          { \begin { enumerate } [ resresult ] }
          { \end { enumerate } }
      }
  }
\RenewDocumentCommand { \backmatter } { } { }
\cs_new:Npn \__xdu_backmatter:
  {
    \__xdu_appendix:
    \__xdu_lang_switch:nn { }
      {
        \cs_set_eq:NN \chapter \__xdu_org_chapter:n
        \cs_set_eq:NN \section \__xdu_org_section:n
        \cs_set_eq:NN \subsection \__xdu_org_subsection:n
      }
    \bool_if:NF \l__xdu_rm_ref_bool
      {
        \cs_set:Npn \bibname { \__xdu_lang_switch:nn { 参考文献 } { Bibliography } }
        \__xdu_n_chapter_head_toc:n { \bibname }
        \__xdu_lang_switch:nn { } { \__xdu_add_zh_toc:nn { chapter } { 参考文献 } }
      }
    \group_begin:
      \tl_if_eq:NnTF \l__xdu_bib_tool_tl { bibtex }
        {
          \bool_if:NTF \l__xdu_rm_ref_bool
            { \nobibliography { \l__xdu_bib_file_clist } }
            {
              \dim_set:Nn \labelsep { 1ex }
              \bibliography { \l__xdu_bib_file_clist }
            }
        }
        {
          \bool_if:NF \l__xdu_rm_ref_bool
            { \printbibliography }
        }
    \group_end:
    \bool_if:NF \l__xdu_rm_ack_bool
      {
        \__xdu_n_chapter_head_toc:nn
          { \__xdu_lang_switch:nn { 致谢            } { Acknowledgements } }
          { \__xdu_lang_switch:nn { 致 { \quad } 谢 } { Acknowledgements } }
        \__xdu_lang_switch:nn { } { \__xdu_add_zh_toc:nn { chapter } { 致谢 } }
        \group_begin:
          \dim_set:Nn \parindent { 2 \ccwd }
          \rmfamily \zihao { -4 }
          \dim_set:Nn \baselineskip { 20pt }
          \ctexset
            {
                section    / number = { \arabic { section } . },
                section    / format = { \rmfamily \zihao { -3 } \bfseries \raggedright },
                subsection / number = { \arabic { section } . \arabic { subsection } },
                subsection / format = { \rmfamily \zihao { 4 } \bfseries \raggedright }
            }
          \setcounter { section } { 0 }
          \file_if_exist_input:n { \l__xdu_ack_tl }
        \group_end:
      }
    \bool_if:NF \l__xdu_rm_bio_bool
      {
        \__xdu_n_chapter_head_toc:n
          { \__xdu_lang_switch:nn { 作者简介 } { Author~Biography } }
        \__xdu_lang_switch:nn { } { \__xdu_add_zh_toc:nn { chapter } { 作者简介 } }
        \group_begin:
          \dim_set:Nn \parindent { 2 \ccwd }
          \rmfamily \zihao { -4 }
          \dim_set:Nn \baselineskip { 20pt }
          \ctexset
            {
                section    / number = { \arabic { section } . },
                section    / format = { \rmfamily \zihao { -3 } \bfseries \raggedright },
                subsection / number = { \arabic { section } . \arabic { subsection } },
                subsection / format = { \rmfamily \zihao { 4 } \bfseries \raggedright },
                subsection / indent = { \l__xdu_bio_indent_dim }
            }
          \addtocontents { toc } { \protect \setcounter { tocdepth } { 0 } }
          \setcounter { tocdepth } { 0 }
          \setcounter { section } { 0 }
          \file_if_exist_input:n { \l__xdu_bio_str }
          \addtocontents { toc } { \protect \setcounter { tocdepth } { 2 } }
          \setcounter { tocdepth } { 2 }
        \group_end:
      }
    \cleardoublepage
  }
\ctex_after_end_preamble:n { \__xdu_frontmatter: \__xdu_mainmatter: }
\AtEndDocument             { \__xdu_backmatter:                  }
%% 
%%
%% End of file `xdupgthesis.cls'.
