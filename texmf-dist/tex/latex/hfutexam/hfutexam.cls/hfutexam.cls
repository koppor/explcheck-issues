% 文件 `hfutexam.cls'
% !TEX TS-program = xelatex
% !TEX encoding = UTF-8 Unicode
% 合肥工业大学试卷模板
% 作者: 张神星
% 使用前请先安装字体: 方正小标宋、方正仿宋, 否则请使用选项 nofangzheng (采用新宋体和仿宋代替)
% 编译模式： XeLaTeX
% 你可以任意修改或再次分发该文件
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hfutexam}[2025/04/30 v1.10 HFUTExam document class by Zhang Shenxing]
% 文档选项
\newif\ifhfut@ShiJuan\hfut@ShiJuantrue
\newif\ifhfut@DaTiZhi\hfut@DaTiZhifalse
\newif\ifhfut@Simple\hfut@Simplefalse
\newif\ifhfut@Fandol\hfut@Fandoltrue
\newif\ifhfut@Nosign\hfut@Nosignfalse
\DeclareOption{datizhi}{\hfut@ShiJuanfalse\hfut@DaTiZhitrue\hfut@Simplefalse}
\DeclareOption{cankaodaan}{\hfut@ShiJuanfalse\hfut@DaTiZhitrue\hfut@Simplefalse}
\DeclareOption{simple}{\hfut@ShiJuanfalse\hfut@DaTiZhifalse\hfut@Simpletrue}
\DeclareOption{nofangzheng}{\hfut@Fandolfalse} % 默认使用方正字体
\DeclareOption{nosign}{\hfut@Nosigntrue}
% 基于 ctexart 文档类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\ifhfut@Simple\else\PassOptionsToClass{twocolumn}{ctexart}\fi
\ProcessOptions\relax
\LoadClass[12pt,oneside]{ctexart}
% 页面设置
\RequirePackage{amsmath,amssymb,amsthm, graphicx, enumitem, fancyhdr, lastpage, etoolbox, geometry, tikz, zref-savepos}
\RequirePackage[normalem]{ulem}
\ifhfut@Simple
	\geometry{a4paper,scale=0.8}
\else
	\geometry{
		paperheight=29.7cm,
		paperwidth=42cm,
		left=3.17cm,
		right=3.17cm,
		voffset=2.2cm,
		headheight=78pt,
		headsep=12pt,
		footskip=1cm
	}
	\setlength\columnsep{0.8cm} % 分栏间距
	\columnseprule=0.5pt % 分栏线宽度
\fi
% 试卷信息
\newcommand{\hfutstretch}{1.5} % 下划线内两侧空格长度除以条目之间空格长度
\newcommand{\hfutul}[1]{\uline{\hspace{\stretch{\hfutstretch}}#1\hspace{\stretch{\hfutstretch}}}}
\newcommand{\hfutrule}[1]{\rule{#1}{0mm}}
\newcommand{\hfutboxyes}{{\raisebox{-2pt}{\LARGE$\checkmark\hspace{-18pt}\square$}}}
\newcommand{\hfutboxno}{{\raisebox{-2pt}{\LARGE$\square$}}}
\newcommand{\XueNian}[2]{\gdef\hfut@XueNian{{\hfutFontTimes #1}～{\hfutFontTimes #2}}}
\newcommand{\BiaoTi}[1]{\gdef\hfut@BiaoTi{#1}}
\newcommand{\XueQi}[1]{\gdef\hfut@XueQi{#1}}
\newcommand{\XueFen}[1]{\gdef\hfut@XueFen{#1}}
\newcommand{\KeChengXingZhi}[1]{\gdef\hfut@KeChengXingZhi{#1}}
\newcommand{\KaoShiXingShi}[1]{\gdef\hfut@KaoShiXingShi{#1}}
\newcommand{\KeChengDaiMa}[1]{\gdef\hfut@KeChengDaiMa{#1}}
\newcommand{\KeChengMingCheng}[1]{\gdef\hfut@KeChengMingCheng{#1}}
\newcommand{\ZhuanYeBanJi}[1]{\gdef\hfut@ZhuanYeBanJi{#1}}
\newcommand{\KaoShiRiQi}[1]{\gdef\hfut@KaoShiRiQi{#1}}
\newcommand{\MingTiJiaoShi}[1]{\gdef\hfut@MingTiJiaoShi{#1}}
\newcommand{\XiZhuRenQianMing}[2][5em]{\gdef\hfut@XiZhuRenQianMing{%
	\tikz[overlay]\node at (1.5,0.22) {\ifx#2\@empty\else\includegraphics[width=#1]{#2}\fi};%
	\uline{\hspace{0.5em}\hfutrule{#1}\hspace{0.5em}}}}
\BiaoTi{}
\XueNian{}{}
\XueQi{}
\KeChengDaiMa{}
\KeChengMingCheng{}
\XueFen{}
\KeChengXingZhi{}
\KaoShiXingShi{}
\ZhuanYeBanJi{}
\KaoShiRiQi{}
\MingTiJiaoShi{}
\XiZhuRenQianMing{}
% 粗字体设定
\newfontfamily\hfutFontTimes[AutoFakeBold={3}]{Times New Roman} % 粗罗马
\ifhfut@Fandol
	\setCJKfamilyfont{hfutFontTitle}[AutoFakeBold={3}]{FZXiaoBiaoSong-B05S} % 粗方正小标宋
	\newfontfamily\hfutFontTitleEn[AutoFakeBold={3}]{FZXiaoBiaoSong-B05S}
	\setCJKfamilyfont{hfutFontHead}[AutoFakeBold={3}]{FZFangSong-Z02S} % 粗方正仿宋
	\newfontfamily\hfutFontHeadEn[AutoFakeBold={3}]{FZFangSong-Z02S}
\else
	\setCJKfamilyfont{hfutFontTitle}[AutoFakeBold={3}]{NSimSun} % 粗新宋体
	\newfontfamily\hfutFontTitleEn[AutoFakeBold={3}]{NSimSun}
	\setCJKfamilyfont{hfutFontHead}[AutoFakeBold={3}]{FangSong} % 粗仿宋
	\newfontfamily\hfutFontHeadEn[AutoFakeBold={3}]{FangSong}
\fi
\newcommand{\hfutFontTitle}{\CJKfamily{hfutFontTitle}\hfutFontTitleEn}
\newcommand{\hfutFontHead}{\hfutFontHeadEn\CJKfamily{hfutFontHead}}
% 重新设定字体大小
\renewcommand{\LARGE}{\fontsize{21pt}{25.2pt}\selectfont}
\renewcommand{\large}{\fontsize{14pt}{21pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
% 缩进
\setlength{\parindent}{0em}
\renewcommand{\indent}{\hspace*{2em}}
\newlength{\ltemp}
% 页眉页脚
\pagestyle{fancy}
\fancyhf{}
\newcommand{\hfutpage}{{\hfutFontTimes\thepage}}
\newcommand{\hfutlastpage}{{\hfutFontTimes\pageref*{LastPage}}}
\ifhfut@ShiJuan % 试卷页眉页脚
	\renewcommand\headrulewidth{0.5pt}
	\renewcommand\footrulewidth{0.5pt}
	\setCJKfamilyfont{hfutFontSimSun}[AutoFakeBold={3}]{SimSun} % 粗宋体
	\fancyhead[C]{\bfseries\large\hfutFontHead\hfutrule{6em}
		\hfill\makebox[280mm][s]{\LARGE\hfutFontTitle~\hfut@BiaoTi~}
		\hfill{\CJKfamily{hfutFontSimSun} 共\uline{\makebox[1.5em]{\hfutlastpage}}页第\uline{\makebox[1.5em]{\hfutpage}}页}

		\vspace{6pt}%
		\hfut@XueNian{}学年第\uline{\hfill\hfut@XueQi\hfill}学期
		\hfill 课程代码\hfutul{\hfut@KeChengDaiMa}
		\hfill 课程名称\hfutul{\hfut@KeChengMingCheng}
		\hfill 学分\uline{\hfill\hfut@XueFen\hfill}
		\hfill 课程性质: %
			\ifdefstring{\hfut@KeChengXingZhi}{必修}{%
			必修\hfutboxyes{}选修\hfutboxno{}限修\hfutboxno}{%
				\ifdefstring{\hfut@KeChengXingZhi}{选修}{%
				必修\hfutboxno{}选修\hfutboxyes{}限修\hfutboxno}{%
					\ifdefstring{\hfut@KeChengXingZhi}{限修}{%
					必修\hfutboxno{}选修\hfutboxno{}限修\hfutboxyes}{%
						\hfutul{\hfut@KeChengXingZhi}
					}
				}
			}
		\hfill 考试形式: %
		\ifdefstring{\hfut@KaoShiXingShi}{开卷}{%
		开卷\hfutboxyes{}闭卷\hfutboxno}{%
			\ifdefstring{\hfut@KaoShiXingShi}{闭卷}{%
			开卷\hfutboxno{}闭卷\hfutboxyes}{%
					\hfutul{\hfut@KaoShiXingShi}
				}
			}

		\vspace{6pt}%
		专业班级（教学班）\hfutul{\hfut@ZhuanYeBanJi}
		\hfill 考试日期\hfutul{\hfut@KaoShiRiQi}
		\hfill 命题教师\hfutul{\hfut@MingTiJiaoShi}
		\hfill 系（所或教研室）主任审批签名\hfut@XiZhuRenQianMing%
	}
	\fancyfoot[C]{\small\vspace{0.5\baselineskip}命题教师注意事项:
		1. 主考教师必须于考试一周前将“试卷A”、“试卷B”经教研室主任审批签字后送教务科印刷。\hspace{1em}%
		2. 请命题教师用黑色水笔工整地书写题目或用A4纸横式打印贴在试卷版芯中。
	}
	\NewDocumentCommand\fillblank{O{35mm} O{5mm} m}{%
		\settodepth{\ltemp}{#3}%
		\uline{\makebox[#1]{\rule{0pt}{#2}\raisebox{\ltemp}{#3}}}%
	}
\fi
\ifhfut@DaTiZhi % 答题纸页眉页脚
	\renewcommand\headrulewidth{0.5pt}
	\renewcommand\footrulewidth{0.5pt}
	\fancyhead[C]{\bfseries\large\hfutFontHead
		\makebox[\linewidth][s]{\LARGE\hfutFontTitle~\hfut@BiaoTi~}
		
		\vspace{6pt}%
		\hfut@XueNian{}学年第\uline{\hfill\hfut@XueQi\hfill}学期
		\hfill 课程代码\hfutul{\hfut@KeChengDaiMa}
		\hfill 课程名称\hfutul{\hfut@KeChengMingCheng}
		\hfill 命题教师\hfutul{\hfut@MingTiJiaoShi}
		\hfill 系（所或教研室）主任审批签名\hfut@XiZhuRenQianMing%
		
		\vspace{6pt}%
		教学班级\hfutul{\hfutrule{10em}}
		\hfill 学生姓名\hfutul{\hfutrule{10em}}
		\hfill 学号\hfutul{\hfutrule{8em}}
		\hfill 考试日期\hfutul{\hfut@KaoShiRiQi}
		\hfill 成绩\hfutul{\hfutrule{6em}}%
	}
	\fancyfoot[C]{\small\vspace{0.5\baselineskip}第~\hfutpage~页~~共~\hfutlastpage~页}
	\NewDocumentCommand\fillblank{O{35mm} O{9mm} m}{%
		\settodepth{\ltemp}{#3}%
		\uline{\makebox[#1]{\rule{0pt}{#2}\raisebox{\ltemp}{#3}}}%
	}
\fi
\ifhfut@Simple % 简单模式页眉页脚
	% \titleformat*{\section}{\bfseries\LARGE\hfutFontTitle}
	\RequirePackage{hyperref}
	\renewcommand\headrulewidth{0pt}
	\renewcommand\footrulewidth{0pt}
	\renewcommand{\maketitle}{%
	\phantomsection
	\addcontentsline{toc}{section}{\hfut@BiaoTi}
		\begin{center}\bfseries
			\makebox[\linewidth][s]{\LARGE\hfutFontTitle~\hfut@BiaoTi~}
			
			\vspace{6pt}%
			\makebox[\linewidth]{\large\hfutFontHead~
				\hfill \hfut@XueNian{}学年第\hfut@XueQi{}学期
				\hspace{\stretch{3}} \hfut@KeChengMingCheng(\hfut@KeChengDaiMa)
				\hfill~
			}
		\end{center}
	}
	\fancyfoot[C]{\small{}第~\hfutpage~页~~共~\hfutlastpage~页}
	\NewDocumentCommand\fillblank{O{35mm} O{5mm} m}{%
		\settodepth{\ltemp}{#3}%
		\uline{\makebox[#1]{\rule{0pt}{#2}\raisebox{\ltemp}{#3}}}%
	}
\fi
% 题号加粗
\renewcommand{\labelenumi}{{\bfseries \theenumi.}}
% 题干
\newcommand\tigan[1]{\noindent{\large\textbf{#1}}}
% 打分栏
\newcommand\scorebox{%
	\vspace{0.5\baselineskip}\noindent%
	\begin{tikzpicture}[overlay,xshift=13.8cm,yshift=-1.6cm]%
		\draw (0,0) rectangle (3.6,2);%
		\draw (1.8,0)--(1.8,2);%
		\draw (0,1)--(3.6,1);%
		\draw (0.9,1.5) node {\textbf{\normalsize 得分}};%
		\draw (2.7,1.5) node {\textbf{\normalsize 阅卷人}};%
	\end{tikzpicture}%
}
\ifhfut@Nosign
	\renewcommand\scorebox{%
		\vspace{0.5\baselineskip}\noindent%
		\begin{tikzpicture}[overlay,xshift=15.6cm,yshift=-1.6cm]%
			\draw (0,0) rectangle (1.8,2);%
			\draw (0,1.4)--(1.8,1.4);%
			\draw (0.9,1.7) node {\textbf{\normalsize 得分}};%
		\end{tikzpicture}%
	}
\fi
% 答题纸提示信息
\newcommand\notice{%
	\noindent\textbf{\small 考生注意事项：\\%
	\indent 1. 本试卷分试题与答卷两部分；\\%
	\indent 2. 所有试题的解答（包括选择、填空）必须写在专用答卷纸上，在试题上直接作答一律无效；\\%
	\indent 3. 考试结束后，必须将试题、答卷整理上交，不得将试题带离考场；\\%
	\indent 4. 考生务必认真填写班级、姓名、学号等信息。}\par%
	{\leavevmode\xleaders\hbox{\rule[4pt]{8pt}{0.5pt}\,}\hfill\null}%
}
% 填空题
\newlength{\lxxmax}
\newlength{\lquar}
\newlength{\lhalf}
\newlength{\lfull}
% 选择题, 根据选项内容长度自动排版
\newcounter{lxxtype}
\NewDocumentCommand\xx{O{0} m m m m}{%
	\setlength{\lfull}{\columnwidth}%
	\addtolength{\lfull}{-\leftmargin}%
	\setlength{\lhalf}{0.5\lfull}%
	\setlength{\lquar}{0.25\lfull}%
	\setcounter{lxxtype}{0}%
	\ifnum#1=1\setcounter{lxxtype}{1}\fi%
	\ifnum#1=2\setcounter{lxxtype}{2}\fi%
	\ifnum#1=4\setcounter{lxxtype}{4}\fi%
	\settowidth{\lxxmax}{A.~#2~}% 获取最长选项长度
	\settowidth{\ltemp}{B.~#3~}%
	\ifdimcomp\ltemp>\lxxmax{\setlength{\lxxmax}{\ltemp}}{}%
	\settowidth{\ltemp}{C.~#4~}%
	\ifdimcomp\ltemp>\lxxmax{\setlength{\lxxmax}{\ltemp}}{}%
	\settowidth{\ltemp}{D.~#5~}%
	\ifdimcomp\ltemp>\lxxmax{\setlength{\lxxmax}{\ltemp}}{}%
	\ifnum\value{lxxtype}=0%
		\setcounter{lxxtype}{4}%
		\ifdimcomp\lxxmax>\lquar{\setcounter{lxxtype}{2}}{}%
		\ifnum\value{lxxtype}=2%
			\ifdimcomp\lxxmax>\lhalf{\setcounter{lxxtype}{1}}{}%
		\fi%
	\fi%
	\vspace{5pt}%
	\ifnum\value{lxxtype}=1%
		\\\makebox[\lfull][l]{A.~#2}%
		\\\makebox[\lfull][l]{B.~#3}%
		\\\makebox[\lfull][l]{C.~#4}%
		\\\makebox[\lfull][l]{D.~#5}%
	\fi%
	\ifnum\value{lxxtype}=2%
		\\\makebox[\lhalf][l]{A.~#2}%
			\makebox[\lhalf][l]{B.~#3}%
		\\\makebox[\lhalf][l]{C.~#4}%
			\makebox[\lhalf][l]{D.~#5}%
	\fi%
	\ifnum\value{lxxtype}=4%
		\\\makebox[\lquar][l]{A.~#2}% 
			\makebox[\lquar][l]{B.~#3}%
			\makebox[\lquar][l]{C.~#4}%
			\makebox[\lquar][l]{D.~#5}%
	\fi%
}
% 选择题答题框
\newcommand\xuanzeti[2]{%
	\begin{tikzpicture}%
		\draw (0,0) rectangle (1.8,2);%
		\draw (0,1)--(1.8,1);%
		\draw (0.9,0.5) node {#2} (0.9,1.5) node {\textbf{#1}};%
	\end{tikzpicture}%
}
% 得分点命令 https://ask.latexstudio.net/ask/question/7557.html
\makeatletter
\ExplSyntaxOn
\zref@require@unique
\NewDocumentCommand{\examscore}{O{} m}{
	\mode_if_math:TF
		{ \@@_math_cdotfill:n {\text{#2}} }
		{ \__examzh_cdotfill: #2 }
	\mode_if_math:F{
		\ignorespaces
	}
}
\cs_new:Npn \__examzh_cdotfill:
{
	\mode_leave_vertical:
	\cleaders \hb@xt@ .44em {\hss $\cdot$ \hss} \hfill
	\kern\z@
}
\cs_new_protected:Npn \@@_math_cdotfill:n #1
{
	\stepcounter { zref@unique }
	\hbox_overlap_right:n
	{
		\zsaveposx { \thezref@unique L }
		\zref@ifrefundefined { \thezref@unique R }
		{ }
		{
			\cleaders
			\hbox_to_wd:nn { .44em } { \hss $\cdot$ \hss }
			\skip_horizontal:n
			{
				\zposx { \thezref@unique R } sp
				- \zposx { \thezref@unique L } sp
			}
		}
	}
	\tag * { \zsaveposx { \thezref@unique R } #1 }
}
\ExplSyntaxOff
\makeatother
\newcommand\Score[1]{~~~\examscore{#1}}
\newcommand\score[1]{~~~\examscore{(#1分)}}
\renewcommand\le{\leqslant}
\renewcommand\ge{\geqslant}

