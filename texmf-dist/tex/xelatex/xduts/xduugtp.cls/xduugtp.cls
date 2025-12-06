%%
%% This is file `xduugtp.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% xduts.dtx  (with options: `class,tp,xduugtp')
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
\ProvidesExplClass{xduugtp}
  {2025/04/26}{6.2.7.2}
  {Xidian University Undergraduate Thesis Proposal class}
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
  { ctexart }
\LoadClass { ctexart }
\RequirePackage { geometry        }
\geometry       { paper = a4paper }
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
\str_new:N \l__xdu_class_str
\str_new:N \l__xdu_submit_date_str
\clist_new:N \l__xdu_sign_clist
\clist_new:N \l__xdu_date_clist
\keys_define:nn { xdu / info }
  {
    class .tl_set:N = \l__xdu_class_str,
    submit-date .tl_set:N = \l__xdu_submit_date_str,
    sign .clist_set:N = \l__xdu_sign_clist,
    date .clist_set:N = \l__xdu_date_clist
  }
\keys_set:nn { xdu }
  {
    info / class       = { },
    info / submit-date = { },
    info / sign        = { },
    info / date        = { }
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
\NewDocumentCommand \xdusetup { m }
  { \keys_set:nn { xdu } { #1 } }
\keys_define:nn { xdu }
  {
    style .meta:nn = { xdu / style } { #1 },
    info  .meta:nn = { xdu / info  } { #1 }
  }
\ProcessKeysOptions { xdu / style }
\dim_new:N \l__xdu_str_dim
\box_new:N \l__xdu_str_box
\cs_new:Npn \__xdu_str_max_dim:Nn #1#2
  {
    \hbox_set:Nn \l__xdu_str_box { #2 }
    \dim_set:Nn \l__xdu_str_dim { \box_wd:N \l__xdu_str_box }
    \dim_set:Nn #1  { \dim_max:nn { \l__xdu_str_dim } { #1 } }
  }
\newgeometry
  {
    left       = 3.17cm,
    right      = 3.17cm,
    top        = 2.54cm,
    bottom     = 2.54cm,
    footskip   = 0cm,
    headsep    = 0cm,
    headheight = 0cm
  }
\savegeometry { main }
\loadgeometry { main }
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
        pdfsubject = { 西安电子科技大学本科生毕业论文（设计）开题报告 },
        pdfcreator = { XeLaTeX~with~xduugtp~class~in~XDUTS },
        pdfauthor  = \l__xdu_author_str
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
        \zihao { -4 }
      }
  }
\PassOptionsToPackage { breakable } { tcolorbox }
\RequirePackage       { tcolorbox }
\dim_new:N \l__xdu_box_margin_dim
\dim_set:Nn \l__xdu_box_margin_dim { 5pt }
\dim_new:N \l__xdu_box_rule_dim
\dim_set:Nn \l__xdu_box_rule_dim { 0.5pt }
\tcbset
  {
    standard~jigsaw,
    sharp~corners    = all,
    colframe         = black,
    opacityback      = 0,
    boxsep           = 0pt,
    boxrule          = \l__xdu_box_rule_dim,
    top              = \l__xdu_box_margin_dim,
    bottom           = \l__xdu_box_margin_dim,
    left             = \l__xdu_box_margin_dim,
    right            = \l__xdu_box_margin_dim,
    beforeafter~skip = 0pt,
    before~upper     =
      {
        \dim_set:Nn \parindent    { 2em  }
        \dim_set:Nn \baselineskip { 20pt }
      }
  }
\tcbset
  {
    tpboxi/.style =
      {
        breakable        = true,
        height~fixed~for = first~and~middle
      },
    tpboxii/.style =
      {
        breakable        = true,
        height~fixed~for = all,
        height~fill      = maximum
      },
    tpboxiii/.style =
      {
        height           = .5\textheight + .5\l__xdu_box_rule_dim,
        space~to~upper   = true,
        lower~separated  = false,
        halign~lower     = flush~right
      }
  }
\RequirePackage { graphicx }
\int_new:N \l__xdu_sign_no_int
\int_set:Nn \l__xdu_sign_no_int { 1 }
\NewDocumentEnvironment { tpbox } { oo }
  { \IfNoValueF { #1 } { \begin { tcolorbox } [ #1 ] } }
  {
    \IfNoValueF { #1 }
      {
        \IfNoValueF { #2 }
          {
            \tcblower
            签名
            \clist_if_empty:NTF \l__xdu_sign_clist
              { \skip_horizontal:n { 6em } \hbox:n { } }
              {
                \skip_horizontal:n { 1em }
                \includegraphics [ width = 10em, height = 25pt, keepaspectratio ]
                  {
                    \str_if_eq:nnTF { #2 } { 指导教师意见 }
                      { \clist_item:Nn \l__xdu_sign_clist { 1 } }
                      { \clist_item:Nn \l__xdu_sign_clist { 2 } }
                  }
              }
            \\
            \clist_if_empty:NTF \l__xdu_date_clist
              { \__xdu_zh_today: }
              {
                \str_if_eq:nnTF { #2 } { 指导教师意见 }
                  { \clist_item:Nn \l__xdu_zh_date_clist { 1 } }
                  { \clist_item:Nn \l__xdu_zh_date_clist { 2 } }
              }
          }
        \end { tcolorbox }
      }
  }
\cs_new:Npn \__xdu_bib:
  {
    \cs_set:Npn \bibname { 参考文献 }
    \subsection* { \bibname }
    \group_begin:
      \tl_if_eq:NnTF \l__xdu_bib_tool_tl { bibtex }
        {
          \dim_set:Nn \labelsep { 1ex }
          \bibliography { \l__xdu_bib_file_clist }
        }
        { \printbibliography }
    \group_end:
  }
\cs_new_eq:NN \__xdu_org_sec:n \section
\RenewDocumentCommand \section { m }
  {
    \str_case:nnTF { #1 }
      {
        { 论文名称及项目来源 }
          {
            \end   { tpbox }
            \begin { tpbox } [tpboxi]
          }
        { 研究目的和意义 }
          {
            \end   { tpbox }
            \skip_vertical:n { -\l__xdu_box_rule_dim }
            \skip_vertical:n { \z@skip }
            \begin { tpbox } [ tpboxii ]
          }
        { 国内外研究现状和发展趋势 }
          {
            \end   { tpbox }
            \begin { tpbox } [ tpboxii ]
          }
        { 主要研究内容、要解决的问题及本文的初步方案 }
          {
            \__xdu_bib:
            \end   { tpbox }
            \begin { tpbox } [ tpboxii ]
          }
        { 工作的主要阶段、进度和完成时间 }
          {
            \end   { tpbox }
            \begin { tpbox } [ tpboxi ]
          }
        { 已进行的前期准备工作 }
          {
            \end   { tpbox }
            \skip_vertical:n { -\l__xdu_box_rule_dim }
            \skip_vertical:n { \z@skip }
            \begin { tpbox } [ tpboxii ]
          }
        { 指导教师意见 }
          {
            \end   { tpbox }
            \begin { tpbox } [ tpboxiii ] [ 指导教师意见 ]
          }
        { 学院审核意见 }
          {
            \end   { tpbox }
            \skip_vertical:n { -\l__xdu_box_rule_dim }
            \skip_vertical:n { \z@skip }
            \begin { tpbox } [ tpboxiii ] [ 学院审核意见 ]
          }
      }
      { \__xdu_org_sec:n { #1 } }
      { }
  }
\pagestyle { empty }
\ctexset
  {
    section       / name       = { ,、   },
    subsection    / name       = { （,） },
    subsubsection / name       = { （,） },
    section       / number     = { \chinese { section       } },
    subsection    / number     = { \chinese { subsection    } },
    subsubsection / number     = { \arabic  { subsubsection } },
    section       / format     = { \raggedright \zihao { -4 } },
    subsection    / format     = { \raggedright \zihao { -4 } },
    subsubsection / format     = { \raggedright \zihao { -4 } },
    section       / aftername  = { },
    subsection    / aftername  = { },
    subsubsection / aftername  = { },
    section       / beforeskip = { 0pt },
    subsection    / beforeskip = { 8pt },
    subsubsection / beforeskip = { 8pt },
    section       / afterskip  = { 0pt },
    subsection    / afterskip  = { 0pt },
    subsubsection / afterskip  = { 0pt },
    section       / indent     = { 0em },
    subsection    / indent     = { 0em },
    subsubsection / indent     = { 2em },
  }
\RequirePackage { xeCJKfntef }
\cs_new:Npn \__xdu_uline:n #1
  { \CJKunderline [ thickness = 1pt ] { #1 } }
\cs_new:Npn \__xdu_uline:nn #1#2
  { \CJKunderline [ thickness = 1pt ] { \hbox_to_wd:nn { #1 } { \hfil #2 \hfil } } }
\dim_new:N \l__xdu_cover_author_info_dim
\dim_set:Nn \l__xdu_cover_author_info_dim { 5em }
\ctex_at_end_preamble:n
  {
    \rmfamily \zihao { -3 }
    \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim { \l__xdu_author_str     }
    \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim { \l__xdu_major_str      }
    \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim { \l__xdu_student_id_str }
    \__xdu_str_max_dim:Nn \l__xdu_cover_author_info_dim { \l__xdu_supv_str       }
    \dim_add:Nn \l__xdu_cover_author_info_dim { 2em }
  }
\cs_new:Npn \__xdu_cover_author_info:nn #1#2
  {
    \vbox_to_ht:nn { 31pt }
      {
        \mode_leave_vertical:
        \hfil
        \hbox:n
          {
            \rmfamily \zihao { -3 }
            \hbox_to_wd:nn { 4em } { #1 }
            \skip_horizontal:n { 0.5em }
            \__xdu_uline:nn { \l__xdu_cover_author_info_dim } { #2 }
          }
        \hfil
      }
  }
\cs_generate_variant:Nn \str_if_eq:nnTF { xnTF }
\ctex_at_end_preamble:n
  {
    \str_new:N \l__xdu_pure_dept_str
    \str_if_eq:xnTF { \str_range:Nnn \l__xdu_dept_str { -2 } { -1 } } { 学院 }
      { \str_set:Nx \l__xdu_pure_dept_str { \str_range:Nnn \l__xdu_dept_str { 1 } { -3 } } }
      { \str_set:NV \l__xdu_pure_dept_str \l__xdu_dept_str }
  }
\cs_new:Npn \__xdu_zh_today:
  {
    \int_use:N \c_sys_year_int  年
    \int_use:N \c_sys_month_int 月
    \int_use:N \c_sys_day_int   日
  }
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
        \clist_item:Nn \l__xdu_submit_date_clist { 3 } 日
      }
  }
\clist_new:N \l__xdu_zh_date_clist
\clist_new:N \l__xdu_zh_date_one_clist
\seq_new:N \l__xdu_date_seq
\ctex_at_end_preamble:n
  {
    \clist_map_inline:Nn \l__xdu_date_clist
      {
        \seq_set_split:Nnn \l__xdu_date_seq { - } { #1 }
        \clist_set_from_seq:NN \l__xdu_zh_date_one_clist \l__xdu_date_seq
        \clist_put_right:Nx \l__xdu_zh_date_clist
          {
            \clist_item:Nn \l__xdu_zh_date_one_clist { 1 } 年
            \clist_item:Nn \l__xdu_zh_date_one_clist { 2 } 月
            \clist_item:Nn \l__xdu_zh_date_one_clist { 3 } 日
          }
      }
  }
\cs_new:Npn \__xdu_cover:
  {
    \vbox:n { }
    \skip_vertical:n { -5pt }
    \vbox_to_ht:nn { 85pt }
      {
        \rmfamily \zihao { -2 } \centering
        西安电子科技大学 \__xdu_uline:n { \l__xdu_pure_dept_str } 学院
      }
    \vbox_to_ht:nn { 32.5pt }
      {
        \sffamily \zihao { 2 } \centering
        本科生毕业论文（设计）开题报告
      }
    \vbox_to_ht:nn { 171pt }
      {
        \CJKfamily+ { sf } \zihao { -3 } \centering
        （\l__xdu_class_str{} 届）
      }
    \__xdu_cover_author_info:nn { 学生姓名 } { \l__xdu_author_str     }
    \__xdu_cover_author_info:nn { 专业     } { \l__xdu_major_str      }
    \__xdu_cover_author_info:nn { 学号     } { \l__xdu_student_id_str }
    \__xdu_cover_author_info:nn { 指导教师 } { \l__xdu_supv_str       }
    \skip_vertical:n { 92pt }
    \vbox_to_ht:nn { 81.5pt }
      {
        \rmfamily \zihao { 4 } \centering
        \__xdu_zh_submit_date:
      }
    \vbox:n
      {
        \rmfamily \zihao { 5 } \centering
        （本表一式三份，学生、指导教师、学院各一份）
      }
  }
\ctex_after_end_preamble:n { \__xdu_cover: \clearpage }
\ctex_after_end_preamble:n { \begin { tpbox } }
\AtEndDocument             { \end   { tpbox } }
%% 
%%
%% End of file `xduugtp.cls'.
