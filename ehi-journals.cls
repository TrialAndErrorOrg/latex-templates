%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ehi-journals.cls, v1.1, 2019-11-22
% Based on the oup-contemporary class v1.1 2017/06/28 developed by Overleaf
% https://www.overleaf.com/latex/templates/template-for-gigascience-journal-manuscript-submissions/shgtrssvbjhs
% Used by Episteme Health Inc. under a Creative Commons Attribution License (CC BY 4.0)
% 
% This class file enables authors to prepare 
% manuscripts for submission to EHI journals
%
% V1.0 Supported journals:
% - neurobehav
% V1.1 Added proofs watermark option
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\ProvidesClass{ehi-journals}[2019/11/22, v1.1]

\newif\if@numrefs
\newif\if@alpharefs

%% Options for bibliography style
\DeclareOption{num-refs}{
  \@numrefstrue
  \@alpharefsfalse
}
\DeclareOption{alpha-refs}{
  \@numrefsfalse
  \@alpharefstrue
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{num-refs}
\ProcessOptions\relax
\LoadClass[twoside,twocolumn]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ifpdf}
\RequirePackage{microtype}
\RequirePackage{euler}
\RequirePackage{merriweather}
\renewcommand{\ttdefault}{lmtt}
\RequirePackage[italic]{mathastext}
\RequirePackage{relsize}
\RequirePackage{ragged2e}
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{graphicx}
\RequirePackage{etoolbox,xpatch}
\RequirePackage{environ}
%\RequirePackage{totpage}
\RequirePackage{rotating}
\RequirePackage{lscape}
\RequirePackage{afterpage}
\RequirePackage[absolute]{textpos}
\RequirePackage{url}
\RequirePackage{newfloat}
\RequirePackage{mdframed}
\RequirePackage{titlesec}
\RequirePackage[export]{adjustbox}
\RequirePackage{datetime2}

\RequirePackage{scrextend}
\changefontsizes[10.5pt]{7.5pt}

\RequirePackage{calc}
\RequirePackage{geometry}
\geometry{includefoot,
  hmargin=4pc+6.64pt,
  bottom=2pc+10pt,
  top=5pc+6pt,
  headsep=2pc,
  headheight=17.5pt,
  footnotesep=1pc+6pt,
  columnsep=18pt}
\setlength{\parindent}{12pt}

\RequirePackage[colorlinks,allcolors=black,urlcolor=blue]{hyperref}

\RequirePackage[noblocks]{authblk}

\def\@telogo{media/TE_logo_blue_high_res.png}

\def\@jname{BioRxiv}
\def\@jlogo{nab-logo.pdf}

\newcommand{\jname}[1]{\def\@jname{#1}}
\newcommand{\jlogo}[1]{\def\@jlogo{#1}}

\def\setjyear{\the\year}
\newcounter{volnumber}
\setcounter{volnumber}{\the\year}
\addtocounter{volnumber}{-2018}
\def\setjvolume{\arabic{volnumber}}
\def\setjnumber{1}
\def\setjarticlenum{e1}
\def\setcrossmarkdate{\today}

\newcommand{\jyear}[1]{\def\setjyear{#1}}
\newcommand{\jvolume}[1]{\def\setjvolume{#1}}
\newcommand{\jnumber}[1]{\def\setjnumber{#1}}
\newcommand{\jarticlenum}[1]{\def\setjarticlenum{#1}}
\newcommand{\jdoi}[1]{\def\setdoi{#1}}
\newcommand{\crossmarkdate}[1]{\def\setcrossmarkdate{#1}}

\def\@papercat{}
\def\@runningauthor{}
\def\@runningtitle{}
\def\@corraddress{}
\def\@authnotes{}
\colorlet{jcolour}{blue!40}
%\def\@licenseopt{}

\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}
\newcommand{\runningtitle}[1]{\def\@runningtitle{#1}}
\newcommand{\corraddress}[1]{\def\@corraddress{#1}}
\newcommand{\authnote}[1]{\appto{\@authnotes}{#1\par}}
\newcommand{\papercat}[1]{\def\@papercat{#1}}
%\newcommand{\licenseopt}[1]{\def\@licenseopt{#1}}

%% WATERMARKS %%
% 2021-01-07: LaTeX updates broke watermarks.

%\newcommand{\watermark}[1]{%
%  \ifstrequal{#1}{draft}{%
%	\usepackage[printwatermark]{xwatermark}
%	\usepackage{xcolor}
%	\usepackage{graphicx}
%	\usepackage{lipsum}
%	\newwatermark[allpages,color=gray!50,angle=45,scale=3,xpos=0,ypos=0]{\emph{DRAFT}}
%	\usepackage{lineno}
%	\linenumbers
%  }{}
%  \ifstrequal{#1}{proof}{%
%	\usepackage[printwatermark]{xwatermark}
%	\usepackage{xcolor}
%	\usepackage{graphicx}
%	\usepackage{lipsum}
%	\newwatermark[allpages,color=gray!50,angle=45,scale=3,xpos=0,ypos=0]{\emph{PROOF}}
%	\usepackage{lineno}
%	\linenumbers
%  }{}
%  \ifstrequal{#1}{retracted}{%
%	\usepackage[printwatermark]{xwatermark}
%	\usepackage{xcolor}
%	\usepackage{graphicx}
%	\usepackage{lipsum}
%	\newwatermark[allpages,color=red!50,angle=45,scale=3,xpos=0,ypos=0]{\emph{RETRACTED}}
%  }
%}

%% WATERMARK END %%

\newcommand{\journal}[1]{%
  \ifstrequal{#1}{neurobehav}{%
    \jname{Neuroanatomy and Behaviour}%
    \jlogo{nab-logo.pdf}%
    \definecolor{jcolour}{RGB}{0,113,171}%
  }{}
  \ifstrequal{#1}{jrepneurosci}{%
    \jname{Journal for Reproducibility in Neuroscience}%
    \jlogo{jrn-logo.pdf}%
    \definecolor{jcolour}{RGB}{0,113,171}%
  }{}
  \ifstrequal{#1}{general}{%
    \jname{BioRxiv}%
    \jlogo{example-grid-100x100pt.png}%
    \definecolor{jcolour}{RGB}{128,0,0}%
  }
}

\newcommand{\license}[1]{
  %%% DEFAULT LICENSE: CC BY
  \ifstrequal{#1}{cc by}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by/4.0/}{\includegraphics[height=7.8pt]{cc-by-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International License}. You are free to reuse or adapt this article for any purpose, provided appropriate acknowledgement is provided. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year. The Author(s). Except where otherwise noted, the content of this article is licensed under Creative Commons Attribution 4.0 International License, which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by/4.0/}
  }{}
  %%% AUTHOR CHOICE OF LICENSE: CC BY-NC, with Scientific Use License (for PsychArchives deposit)
  \ifstrequal{#1}{cc by-nc+sul}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by-nc/4.0/}{\includegraphics[height=7.8pt]{cc-by-nc-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by-nc/4.0/}{Creative Commons Attribution-NonCommercial 4.0 International License}. At your option, you may also use the content of this article under the \href{https://doi.org/10.23668/psycharchives.4988}{Scientific Use License}. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year.The Author(s). Except where otherwise noted, the content of this article is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License. At your option, you may also use the content of this article under the Scientific Use License. For additional permissions, please contact the corresponding author.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by-nc/4.0/ https://doi.org/10.23668/psycharchives.4988}
  }{}
  %%% AUTHOR CHOICE OF LICENSE: CC BY-NC alone
  \ifstrequal{#1}{cc by-nc}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by-nc/4.0/}{\includegraphics[height=7.8pt]{cc-by-nc-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by-nc/4.0/}{Creative Commons Attribution-NonCommercial 4.0 International License}. You are free to reuse or adapt this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year.The Author(s). Except where otherwise noted, the content of this article is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License. You are free to reuse or adapt this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation. For additional permissions, please contact the corresponding author.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by-nc/4.0/}
  }{}
  %%% AUTHOR CHOICE OF LICENSE: CC BY-SA
  \ifstrequal{#1}{cc by-sa}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by-sa/4.0/}{\includegraphics[height=7.8pt]{cc-by-sa-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by-sa/4.0/}{Creative Commons Attribution-ShareAlike 4.0 International License}. You are free to reuse or adapt this article for any purpose with appropriate acknowledgement and, if you remix, adapt, or build upon the material, you must license the modified material under identical terms. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year. The Author(s). Except where otherwise noted, the content of this article is licensed under Creative Commons Attribution-ShareAlike 4.0 International License, which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited and any modified material is licensed under identical terms.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by-sa/4.0/}
  }{}
  %%% AUTHOR CHOICE OF LICENSE: CC BY-NC-SA, with Scientific Use License (for PsychArchives deposit)
  \ifstrequal{#1}{cc by-nc-sa+sul}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{\includegraphics[height=7.8pt]{cc-by-nc-sa-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License}. You are free to reuse or adapt this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation. You must provide appropriate acknowledgement and, if you remix, adapt, or build upon the material, you must license the modified material under identical terms. At your option, you may also use the content of this article under the \href{https://doi.org/10.23668/psycharchives.4988}{Scientific Use License}. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year. The Author(s). Except where otherwise noted, the content of this article is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. You are free to reuse or adapt this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation. You must provide appropriate acknowledgement and, if you remix, adapt, or build upon the material, you must license the modified material under identical terms. At your option, you may also use the content of this article under the Scientific Use License. For additional permissions, please contact the corresponding author.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by-nc-sa/4.0/ https://doi.org/10.23668/psycharchives.4988}
  }{}
  %%% AUTHOR CHOICE OF LICENSE: CC BY-NC-SA alone
  \ifstrequal{#1}{cc by-nc-sa}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{\includegraphics[height=7.8pt]{cc-by-nc-sa-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License}. You are free to reuse or adapt this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation. You must provide appropriate acknowledgement and, if you remix, adapt, or build upon the material, you must license the modified material under identical terms. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year. The Author(s). Except where otherwise noted, the content of this article is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. You are free to reuse or adapt this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation. You must provide appropriate acknowledgement and, if you remix, adapt, or build upon the material, you must license the modified material under identical terms. For additional permissions, please contact the corresponding author.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by-nc-sa/4.0/}
  }{}
  %%% AUTHOR CHOICE OF LICENSE: CC BY-ND, with Scientific Use License (for PsychArchives deposit)
  \ifstrequal{#1}{cc by-nd+sul}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by-nd/4.0/}{\includegraphics[height=7.8pt]{cc-by-nd-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by-nd/4.0/}{Creative Commons Attribution-NoDerivatives 4.0 International License}. You are free to copy and redistribute this article for any purpose, provided appropriate acknowledgement is provided. At your option, you may also use the content of this article under the \href{https://doi.org/10.23668/psycharchives.4988}{Scientific Use License}. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year. The Author(s). Except where otherwise noted, the content of this article is licensed under Creative Commons Attribution-NoDerivatives 4.0 International License.  You are free to copy and redistribute this article for any purpose, provided appropriate acknowledgement is provided. At your option, you may also use the content of this article under the Scientific Use License. For additional permissions, please contact the corresponding author.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by-nd/4.0/ https://doi.org/10.23668/psycharchives.4988}
  }{}
  %%% AUTHOR CHOICE OF LICENSE: CC BY-ND alone
  \ifstrequal{#1}{cc by-nd}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by-nd/4.0/}{\includegraphics[height=7.8pt]{cc-by-nd-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by-nd/4.0/}{Creative Commons Attribution-NoDerivatives 4.0 International License}. You are free to copy and redistribute this article for any purpose, provided appropriate acknowledgement is provided. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year. The Author(s). Except where otherwise noted, the content of this article is licensed under Creative Commons Attribution-NoDerivatives 4.0 International License.  You are free to copy and redistribute this article for any purpose, provided appropriate acknowledgement is provided. For additional permissions, please contact the corresponding author.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by-nd/4.0/}
  }{}
  %%% AUTHOR CHOICE OF LICENSE: CC BY-NC-ND, with Scientific Use License (for PsychArchives deposit)
  \ifstrequal{#1}{cc by-nc-nd+sul}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{\includegraphics[height=7.8pt]{cc-by-nc-nd-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License}. You are free to copy and redistribute this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation, provided appropriate acknowledgement is provided. At your option, you may also use the content of this article under the \href{https://doi.org/10.23668/psycharchives.4988}{Scientific Use License}. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year. The Author(s). Except where otherwise noted, the content of this article is licensed under Creative Commons Attribution-NoDerivatives 4.0 International License.  You are free to copy and redistribute this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation, provided appropriate acknowledgement is provided. At your option, you may also use the content of this article under the Scientific Use License. For additional permissions, please contact the corresponding author.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by-nc-nd/4.0/ https://doi.org/10.23668/psycharchives.4988}
  }{}
  %%% AUTHOR CHOICE OF LICENSE: CC BY-NC-ND alone
  \ifstrequal{#1}{cc by-nc-nd}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{\includegraphics[height=7.8pt]{cc-by-nc-nd-15.eps}} Copyright \textcopyright\space\setjyear. The Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear. The Author(s). Except where otherwise noted, the content of this article is licensed under a \href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License}. You are free to copy and redistribute this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation, provided appropriate acknowledgement is provided. For additional permissions, please contact the corresponding author.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year. The Author(s). Except where otherwise noted, the content of this article is licensed under Creative Commons Attribution-NoDerivatives 4.0 International License.  You are free to copy and redistribute this article for purposes that are not intended for or directed towards commercial advantage or monetary compensation, provided appropriate acknowledgement is provided. For additional permissions, please contact the corresponding author.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/licenses/by-nc-nd/4.0/ https://doi.org/10.23668/psycharchives.4988}
  }{}
  %%% AUTHOR HAS CHOSEN CC0 PUBLIC DOMAIN DEDICATION
  \ifstrequal{#1}{cc zero}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/publicdomain/zero/1.0/}{\includegraphics[height=7.8pt]{cc-zero-15.eps}} Copyright \textcopyright\space\setjyear\ waived by the Author(s).
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear\ waived by the Author(s). To the extent possible under law, all copyright and related or neighbouring rights to this work have been waived under the \href{https://creativecommons.org/publicdomain/zero/1.0/}{Creative Commons Public Domain Dedication}.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year waived by the Author(s). To the extent possible under law, all copyright and related or neighbouring rights to this work have been waived under the Creative Commons Public Domain Dedication.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/publicdomain/zero/1.0/}
  }{}
  %%% GOVERNMENT EMPLOYEE CC0 PUBLIC DOMAIN DEDICATION
  \ifstrequal{#1}{cc zero-gov}{
    \newcommand{\shortlicense}{%
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \color{black}%
      \href{https://creativecommons.org/publicdomain/zero/1.0/}{\includegraphics[height=7.8pt]{cc-zero-15.eps}} Copyright \textcopyright\space\setjyear\ waived/not applicable.
    }
    \newcommand{\copyrightstatement}{
      Copyright \textcopyright\space\setjyear\ waived or not applicable. To the extent possible under law, all copyright and related or neighbouring rights to this work have been waived under the \href{https://creativecommons.org/publicdomain/zero/1.0/}{Creative Commons Public Domain Dedication}.}
    \newcommand{\copyrightmetadata}{Copyright (C) \the\year waived or not applicable. To the extent possible under law, all copyright and related or neighbouring rights to this work have been waived under the Creative Commons Public Domain Dedicationn.
    }
    \newcommand{\licenseurl}{https://creativecommons.org/publicdomain/zero/1.0/}
  }{}
}

\RequirePackage[flushmargin,bottom,norule]{footmisc}
\appto{\footnotelayout}{\fontsize{6.5pt}{9.5pt}\selectfont}
\deffootnote{1.5em}{1.5em}{\thefootnotemark\enspace}

\RequirePackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrule}{\color{black!15}\rule{\textwidth}{2pt}}
\fancyhead[LE]{%
  \hspace*{12pt}%
  \fontsize{7.8pt}{10pt}\selectfont%
  \color{jcolour}%
  \textbf{\thepage}%
  \hspace{1em}\raisebox{-0.5pt}{|}\hspace{1em}%
  \textit{\@jname}, \setjyear
}
\fancyhead[RO]{%
  \fontsize{7.8pt}{10pt}\selectfont%
  \color{jcolour}%
  \@runningauthor%
  \hspace{1em}\raisebox{-0.5pt}{|}\hspace{1em}%
  \textbf{\thepage}%
  \hspace*{12pt}%
}

\fancypagestyle{plain}{%
  \fancyhf{}
  \renewcommand{\headrule}{}
  \fancyfoot[L]{%
    \shortlicense%
  }
  \fancyfoot[R]{%
    \fontsize{7.8pt}{10pt}\selectfont%
    \color{jcolour}%
    \textbf{\thepage}\hspace*{12pt}%
  }
}

\pagestyle{fancy}


\AtBeginDocument{%
  \newsavebox{\@gscitedetails}
  \newlength{\@gscitedetailsheight}
  \newsavebox{\@gsheadbox}
  \newlength{\@gsheadboxheight}
  \savebox{\@gscitedetails}{%
    \parbox{\textwidth-21pc+4pc+6.64pt}{%
      \normalfont{\itshape\bfseries\@jname}, \setjyear, \setjvolume(\setjnumber), \setjarticlenum.\par
      \vspace{\dimexpr 8pt-1em\relax}
      {\color{black!15}\rule{\columnwidth}{2pt}}\par%
      \vspace{\dimexpr 8pt-1em\relax}%
      \fontsize{6.5pt}{9.5pt}\bfseries%
      \textbf{ISSN: 2652-1768}\par
      \textcolor{jcolour}{doi: \href{https://doi.org/\setdoi}{\color{jcolour}\setdoi}}\par
      \vspace{\dimexpr 8pt-1em\relax}%
      {\color{black!15}\rule{\columnwidth}{2pt}}\par
    }}%
  \settototalheight{\@gscitedetailsheight}{\usebox{\@gscitedetails}}%
  %%%%
  \savebox{\@gsheadbox}{%
    \parbox{\textwidth-21pc+4pc+6.64pt}{%
      %    \normalfont%
      %    \fontsize{8pt}{9.5pt}\selectfont%
      %    {\itshape\bfseries\@jname}, \setjyear, \setjarticlenum\par
      %    \vspace{\dimexpr 8pt-1.5pt\relax}%
      \usebox{\@gscitedetails}
    }%
  }%
  \settototalheight{\@gsheadboxheight}{\usebox{\@gsheadbox}}%
}

\RequirePackage{alphalph}
\newalphalph{\fnsymbolmult}[mult]{\@fnsymbol}{5}

\newcounter{authorfn}
\setcounter{authorfn}{1}
\newcommand{\authfn}[1]{%
  \fnsymbolmult{#1}%
}

\renewcommand\Authands{ and }
\renewcommand\AB@affilsepx{\break}
\renewcommand{\Authfont}{\fontsize{13pt}{18pt}\selectfont}
\renewcommand{\Affilfont}{\fontsize{9pt}{13pt}\selectfont}
\setlength{\affilsep}{21pt-9pt}

\AtBeginDocument{
  \renewcommand{\@maketitle}{%
    \textblockorigin{4pc+6.64pt}{4pc+6pt}
    %%%%
    \begin{textblock*}{21pc}(0pt,0pt)
      \IfFileExists{\@telogo}{%
        \includegraphics[height=\@gsheadboxheight]{\@telogo}%
      }{%
        \fbox{\begin{minipage}[b][\@gsheadboxheight]{\@gsheadboxheight}
            \raggedright
            Placeholder for EHI logo \@telogo
          \end{minipage}}%
      }
      \hspace{12pt}%
      %% Do absolutely nothing if \@jlogo is empty string
      \ifdefempty{\@jlogo}{}{%
        \IfFileExists{\@jlogo}{%
          \includegraphics[height=\@gscitedetailsheight]{\@jlogo}
        }{%
          \fbox{\begin{minipage}[b][\@gsheadboxheight]{\@gsheadboxheight}%
              \raggedright Placeholder for journal logo \@jlogo
            \end{minipage}}%
        }}
    \end{textblock*}
    %%%
    \begin{textblock*}{\textwidth-21pc}(21pc,0pt)
      \usebox{\@gsheadbox}
    \end{textblock*}%
    %%%
    \null\vspace*{\dimexpr 9pc+11pt-5pc-6pt\relax}%
    \href{https://crossmark.crossref.org/dialog/?doi=\setdoi\&domain=pdf\&date\_stamp=\setcrossmarkdate}{\includegraphics[scale=0.8,right]{crossmark.eps}}
    \par
    \raggedright%
    {\fontsize{14pt}{16pt}\selectfont%
      \ifpdf
        \textls[200]{\relsize{-1}\MakeUppercase{\@papercat}}
      \else %%% don't use letterspace in latex+dvi
        \relsize{-1}\MakeUppercase{\@papercat}%
      \fi%
      \par}
    \vspace{\dimexpr 26pt-18pt\relax}
    {\fontsize{18pt}{27pt}\bfseries\color{jcolour}\@title\par}
    \vspace{\dimexpr 26pt-13pt\relax}
    \@author\par
    \vspace{\dimexpr 15.5pt-1em}
    {%
      \renewcommand{\authfn}[1]{%
        \textsuperscript{\fnsymbolmult{##1}}%
      }
      {\fontsize{6.5pt}{9.5pt}\selectfont\@authnotes\par}%
    }
    \vspace{\dimexpr 16pt-3pt-1em\relax}
  }
}

\RequirePackage[style]{abstract}
\setlength{\absleftindent}{0pt}
\setlength{\absrightindent}{0pt}
\setlength{\absparindent}{12pt}
\setlength{\absparsep}{0pt}
\setlength{\abstitleskip}{16pt-8pt-\baselineskip}
\renewcommand{\abstractnamefont}{\fontsize{10pt}{12pt}\bfseries\color{jcolour}}
\renewcommand{\abstitlestyle}[1]{{\abstractnamefont #1}}
\renewcommand{\abstracttextfont}{\fontsize{8pt}{11pt}\selectfont}
\preto{\abstract}{%
  {\noindent\color{jcolour!40}\rule{\textwidth}{3pt}}\par
  \vspace*{\dimexpr 23pt-10pt\relax}
}
\appto\abstract{\noindent\raggedright\ignorespaces}
\preto\endabstract{\par}

\newenvironment{keywords}
{\vspace*{\dimexpr 19pt-8pt-\baselineskip\relax}%
  \noindent\fontsize{8pt}{11pt}\selectfont\textbf{Key words}: \ignorespaces}%
{\par}

\DeclareFloatingEnvironment[placement=t!,name=kpt]{keypoints}

\xapptocmd{\keypoints}{%
  \begin{mdframed}[linewidth=1pt,linecolor=black,
      innerleftmargin=8pt,innerrightmargin=8pt,
      innertopmargin=16pt-8.2pt,innerbottommargin=6pt]
    {\fontsize{8.2pt}{10pt}\bfseries Key Points\par}
    }{}{}
    \xpretocmd{\endkeypoints}{\end{mdframed}}{}{}

\xapptocmd{\keypoints*}{%
  \begin{mdframed}[linewidth=1pt,linecolor=black,
      innerleftmargin=8pt,innerrightmargin=8pt,
      innertopmargin=16pt-8.2pt,innerbottommargin=6pt]
    {\fontsize{8.2pt}{10pt}\bfseries Key Points\par}
    }{}{}
    \xpretocmd{\endkeypoints*}{\end{mdframed}}{}{}


\if@twocolumn
  \NewEnviron{frontmatter}
  {\twocolumn[%
      \BODY%
      \vspace*{\dimexpr 16pt-3pt-1em\relax}
      {\noindent\color{jcolour!40}\rule{\textwidth}{3pt}}\par
      \vspace*{\dimexpr 23pt-1em\relax}]%
    %%%%%%%%%%%%%TO ADD STANDARD FOOTNOTE IF NEED BE%%%%%%%%%  
    %  \begin{figure*}[b!]
    %  \fontsize{6.5pt}{9.5pt}\selectfont%
    %\hrule%
    %\vspace{\dimexpr 14pt-6.5pt\relax}%
    %\textbf{Compiled on:} \today.\par
    %Draft manuscript prepared by the author.\par
    %\end{figure*}
  }
\else
  \NewEnviron{frontmatter}{%
    \BODY%
    \vspace*{\dimexpr 16pt-3pt-1em\relax}
    {\noindent\color{jcolour!40}\rule{\hsize+4pc+6.64pt}{3pt}}\par
    \vspace*{\dimexpr 23pt-1em\relax}%
    
  }

\fi

\setcounter{secnumdepth}{0}
\titleformat*{\section}{\fontsize{10pt}{12pt}\bfseries\color{jcolour}}
\titlespacing*{\section}{0pt}{26.5pt-1em}{16pt-1em}
\titleformat*{\subsection}{\fontsize{8.5pt}{11pt}\bfseries\color{jcolour}}
\titlespacing*{\subsection}{0pt}{2pc-1em}{17pt-1em}
\titleformat*{\subsubsection}{\normalsize\bfseries\slshape}
\titlespacing*{\subsubsection}{0pt}{\baselineskip}{0pt}
\titleformat{\paragraph}[runin]{\normalsize\itshape}{\theparagraph}{0pt}{}[.\enspace]
\titlespacing*{\paragraph}{0pt}{\baselineskip}{0pt}
\titleformat{\subparagraph}[runin]{\relsize{-1}\uppercase}{\thesubparagraph}{0pt}{}[.\enspace]
\titlespacing*{\subparagraph}{0pt}{\baselineskip}{0pt}

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[itemize]{leftmargin=12pt,topsep=16pt-1em}
\setlist[enumerate]
{itemindent=14pt,topsep=16.8pt-1em,
  label={\roman*.},labelsep=7pt,
  labelwidth=*,leftmargin=*,align=right}


% quotes and epigraphs
\RequirePackage{quoting}
\newcommand{\quotefont}{\fontsize{6.5pt}{9.5pt}\selectfont}
\quotingsetup{vskip=16pt-1em,indentfirst=false,font={quotefont},leftmargin=12pt,rightmargin=12pt}

\renewenvironment{quote}{\begin{quoting}}{\end{quoting}}

\renewenvironment{quotation}{\begin{quoting}}{\end{quoting}}

\newenvironment{epigraph}[1]
{\begin{quoting}[font={itshape,fontsize{7.5pt}{10.5pt}},vskip=15pt-1em,leftmargin=0pt,rightmargin=0pt]%
    \def\@quotesource{#1}}
    {\par\vspace{\dimexpr 15pt-1em\relax}{\upshape---\@quotesource}\end{quoting}}

% Space above/below equations
\g@addto@macro\normalsize{%
  \setlength\abovedisplayskip{\baselineskip}%
  \setlength\belowdisplayskip{\baselineskip}%
  \setlength\abovedisplayshortskip{\baselineskip}%
  \setlength\belowdisplayshortskip{\baselineskip}%
}

\RequirePackage{stfloats}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
% Left-, right- and center-aligned auto-wrapping column types
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}

\AtBeginEnvironment{tabularx}{%
  \fontsize{7pt}{10pt}\selectfont
}
\AtBeginEnvironment{tabular}{%
  \fontsize{7pt}{10pt}\selectfont
}

\setlength{\aboverulesep}{11pt-1em}
\setlength{\belowrulesep}{11pt-1em}
\setlength{\heavyrulewidth}{0.5pt}
\setlength{\lightrulewidth}{0.5pt}
\arrayrulecolor{jcolour}


\newcommand{\tnote}[1]{\textsuperscript{\textit{#1}}}
\newlist{tablenotes}{itemize}{1}
\setlist[tablenotes]{label={},labelsep=0pt,leftmargin=0pt,topsep={\dimexpr 12pt-1em\relax}}
\appto{\tablenotes}{\fontsize{6pt}{9pt}\selectfont}

\RequirePackage[tableposition=top]{caption}
\DeclareCaptionFont{figcaptionfont}{\fontsize{6pt}{9pt}\selectfont}
\DeclareCaptionFont{tabcaptionfont}{\fontsize{7pt}{9pt}\selectfont}
\captionsetup{justification=justified,singlelinecheck=false,labelfont={bf},labelsep=period}
\captionsetup*[figure]{font=figcaptionfont,skip=10pt}
\captionsetup*[table]{font=tabcaptionfont,skip=10pt-1em}

% Skips for floats
\setlength{\floatsep}{1pc+6pt}
\setlength{\intextsep}{1pc+6pt}
\setlength{\textfloatsep}{1pc+6pt}

% References
\if@numrefs
  \RequirePackage[numbers,sort&compress]{natbib}
  \bibliographystyle{plos2015}
\fi
\if@alpharefs
  \RequirePackage{natbib}
  \bibliographystyle{dcu}
\fi
\setlength{\bibhang}{11pt}
\setlength{\bibsep}{0pt}
\renewcommand{\bibnumfmt}[1]{#1.}