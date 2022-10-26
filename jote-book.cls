\ProvidesClass{jote-book}[2021/08/29, v1.0]


\def\@jotetitle{}
\def\@joteauthor{}
\def\@paperdoi{}
\def\@runningauthor{}
\def\@affiliation{}
\def\@authoremail{}
\def\@authorcontact{}
\def\@papercite{}
\def\@fancypapercite{}
\def\@jotesubtitle{}
\def\@citedata{}
\def\@booktitle{}
\def\@booksubtitle{}
\def\@bookauthor{}
\def\@booksubject{}
\def\@bookkeywords{}
\def\@bookpublisher{}
\def\@bookpublisherlocation{}
\def\@bookyear{}
\def\@bookcopyright{}
\def\@booklicenseurl{}
\def\@bookcontactemail{}
\def\@bookcontacturl{}
\def\@bookurl{}
\def\@bookedition{}
\def\@bookdoi{}
\def\@bookisbn{}
\def\@bookversion{}
\def\@bookpublisherlogo{}
\def\@booklanguage{}
\def\@othercredits{}
\def\@initialcredits{}
\newcounter{@numberofthumbs}
\setcounter{@numberofthumbs}{10}

\newif\if@semantic
\newif\if@google
\newif\if@connected
\newif\if@tocpages
\newif\if@alegreya
\newif\if@garamond
\newif\if@baskerville
\newif\if@georgia
\newif\if@nonumberedheadings
\newif\if@perchapterpagenum
\newif\if@perchapterbib
\newif\if@hovercite
\newif\if@print
\newif\if@bigchapnum
\newif\if@thumbs
\newif\if@partthumbs
\newif\if@emptythumbs

\newcommand{\booktitle}[1]{\def\@booktitle{#1}}
\newcommand{\booksubtitle}[1]{\def\@booksubtitle{#1}}
\newcommand{\bookauthor}[1]{\def\@bookauthor{#1}}
\newcommand{\booksubject}[1]{\def\@booksubject{#1}}
\newcommand{\bookkeywords}[1]{\def\@bookkeywords{#1}}
\newcommand{\bookpublisher}[1]{\def\@bookpublisher{#1}}
\newcommand{\bookpublisherlocation}[1]{\def\@bookpublisherlocation{#1}}
\newcommand{\bookedition}[1]{\def\@bookedition{#1}}
\newcommand{\bookyear}[1]{\def\@bookyear{#1}}
\newcommand{\bookcopyright}[1]{\def\@bookcopyright{#1}}
\newcommand{\booklicenseurl}[1]{\def\@booklicenseurl{#1}}
\newcommand{\bookcontactemail}[1]{\def\@bookcontactemail{#1}}
\newcommand{\bookcontacturl}[1]{\def\@bookcontacturl{#1}}
\newcommand{\bookurl}[1]{\def\@bookurl{#1}}
\newcommand{\bookdoi}[1]{\def\@bookdoi{#1}}
\newcommand{\bookisbn}[1]{\def\@bookisbn{#1}}
\newcommand{\bookversion}[1]{\def\@bookversion{#1}}
\newcommand{\bookpublisherlogo}[1]{\def\@bookpublisherlogo{#1}}
\newcommand{\booklanguage}[1]{\def\@booklanguage{#1}}
\newcommand{\othercredits}[1]{\def\@othercredits{#1}}
\newcommand{\initialcredits}[1]{\def\@initialcredits{#1}}
\newcommand{\numberofthumbs}[1]{\setcounter{@numberofthumbs}{#1}}

\newcommand{\jotetitle}[1]{\def\@jotetitle{#1}}
\newcommand{\joteauthor}[1]{\def\@joteauthor{#1}}
\newcommand{\paperdoi}[1]{\def\@paperdoi{#1}}
\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}
\newcommand{\affiliation}[1]{\def\@affiliation{#1}}
\newcommand{\authoremail}[1]{\def\@authoremail{#1}}
\newcommand{\authorcontact}[1]{\def\@authorcontact{#1}}
\newcommand{\papercite}[1]{\def\@papercite{#1}}
\newcommand{\fancypapercite}[1]{\def\@fancypapercite{#1}}
\newcommand{\jotesubtitle}[1]{\def\@jotesubtitle{#1}}

\newlength{\bleed}
\setlength\bleed{0.3cm}
\newlength{\stockx}
\setlength\stockx{6in}
\newlength{\stocky}
\setlength\stocky{9in}

\DeclareOption{semantic}{\@semantictrue}
\DeclareOption{connected}{\@connectedtrue}
\DeclareOption{google}{\@googletrue}
\DeclareOption{garamond}{\@garamondtrue}
\DeclareOption{alegreya}{\@alegreyatrue}
\DeclareOption{baskerville}{\@baskervilletrue}
\DeclareOption{georgia}{\@georgiatrue}
\DeclareOption{tocpages}{\@tocpagestrue}
\DeclareOption{nonumberedheadings}{\@nonumberedheadingstrue}
\DeclareOption{perchapterpagenum}{\@perchapterpagenumtrue}
% Replace the citation per chapter with a '' which you can hover over
\DeclareOption{hovercite}{\@hovercitetrue}
\DeclareOption{perchapterbib}{\@perchapterbibtrue}
\DeclareOption{print}{\@printtrue}
\DeclareOption{bigchapnum}{\@bigchapnumtrue}
\DeclareOption{thumbs}{\@thumbstrue}
\DeclareOption{partthumbs}{\@partthumbstrue}
\DeclareOption{emptythumbs}{\@emptythumbstrue}

\ProcessOptions\relax

% \if@print
% \LoadClass[12pt, showtrims]{memoir}
% \else
\LoadClass[12pt]{memoir}
% \fi

\RequirePackage[table]{xcolor}
\RequirePackage{fontspec}

% \setmainfont{Baskerville}[ UprightFont={* Regular}, ItalicFont={* Italic},
% BoldFont={* Bold}, ]
%
\newfontfamily\lettrinefont{EB Garamond Initials}

\newfontfamily\garamond{EB Garamond}[ UprightFont={* Regular}, ItalicFont={* Italic}, BoldFont={* Medium}]
\newfontfamily\sans{HelveticaNeue.ttc}[
	Ligatures=TeX,
	UprightFeatures={FontIndex=0},
	BoldFeatures={FontIndex=4},
	ItalicFeatures={FontIndex=2},
]

\newfontfamily\overpass{Overpass}[UprightFont={* Light}, ItalicFont={* Light Italic}, BoldFont={* Bold}]

\if@garamond
	\setmainfont{EB Garamond}[ UprightFont={* Regular}, ItalicFont={* Italic}, BoldFont={* Medium}]
	\newfontfamily\heading{EB Garamond}[ UprightFont={* Regular}, ItalicFont={* Italic}, BoldFont={* Medium}  ]
\else
	\if@baskerville
		\setmainfont{Baskerville}
		\newfontfamily\heading{Alegreya}[ UprightFont={* Regular}, ItalicFont={* Italic}, BoldFont={* Bold}  ]
	\else
		\if@georgia
			\setmainfont{Georgia}
			% \newfontfamily\heading{Georgia}[ UprightFont={*}, ItalicFont={*-Italic}, BoldFont={*-Bold}  ]
			\newfontfamily\heading{Alegreya}[ UprightFont={* Regular}, ItalicFont={* Italic}, BoldFont={* Medium}  ]
		\else
			\setmainfont{Alegreya}
			\newfontfamily\heading{Alegreya}[ UprightFont={* Regular}, ItalicFont={* Italic}, BoldFont={* Medium}  ]
			\newfontfamily\sans{Alegreya Sans}[ UprightFont={* Regular}, ItalicFont={* Italic}, BoldFont={* Medium}  ]
		\fi
	\fi
\fi



% Cool icons
\RequirePackage{fontawesome5}
\RequirePackage{academicons}
\RequirePackage{lettrine}
\RequirePackage{svg}
% \renewcommand{\LettrineFontHook}{\lettrinefont}

% For barcode, only works with LuaLatex!
\RequirePackage{barracuda}


% \RequirePackage[\ifdefempty{\@booklanguage}{english}{\@booklanguage}]{babel}
\RequirePackage{csquotes}
\RequirePackage[babel]{microtype}

%% Set some spacing
% \setSingleSpace{1.1}            %

\definecolor{tiu}{HTML}{003366}
\definecolor{tiunew}{HTML}{b3d9ff}
\definecolor{tip}{HTML}{003366}

\if@perchapterbib
	\RequirePackage[backend=biber, style=apa, backref=true, backrefstyle=none, refsection=chapter]{biblatex}
\else
	\RequirePackage[backend=biber, style=apa, backref=true, backrefstyle=none]{biblatex}
\fi
\RequirePackage{imakeidx}

\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}
\setlength{\bibhang}{1em}

\RequirePackage{xpatch}

\newlength{\marginwritesep}
\setlength{\marginwritesep}{.4em}

\DefineBibliographyStrings{english}{%
	backrefpage = {see p\adddot},%
	backrefpages = {see pp\adddot}%
}
\DefineBibliographyStrings{dutch}{%
	backrefpage = {zie p\adddot},%
	backrefpages = {zie pp\adddot}%
}

\newcommand{\marginwrite}[1]{%
	\strut\vadjust{%
		\vbox to 0pt{%
				\kern-\the\dimexpr\ht\strutbox+\dp\strutbox\relax
				\hfill\rlap{\kern\marginwritesep
					#1}%
				\vss
			}%
	}%
}

\DeclareListFormat{pageref}{%
	\ifnumless{\abx@pagerefstyle}{0}
	{\usebibmacro{list:plain}%
		\ifhyperref%
		{\if@perchapterpagenum%
				\hyperlink{page.#1}{\the\numexpr#1-\thechapterpgn+1\relax}%
			\else%
				\hyperlink{page.#1}{#1}%
			\fi%
		}
		{#1}}
	{\ifnumequal{\value{listcount}}{1}
		{\usebibmacro{pageref:init}}
		{}%
		\usebibmacro{pageref:comp}{#1}%
		\ifnumequal{\value{listcount}}{\value{liststop}}
		{\usebibmacro{pageref:dump}}
		{}}}

% \if@perchapterpagenum
% \xpatchbibmacro{pageref:comp}{\hyperlink{page.#1}{#1}}{\hyperlink{page.#1}{\the\numexpr#1-\thechapterpgn+1\relax}}{}{}
% \else
% \xpatchbibmacro{pageref:comp}{\hyperlink{page.#1}{#1}}{\hyperlink{page.#1}{#1}}{}{}
% \fi

% \renewbibmacro*{pageref}{}

\newcounter{refs}
\setcounter{refs}{-1}
% \renewbibmacro*{begentry}{%
%       \ifnumgreater{\value{pageref}}{1}{%
%           \addtocounter{refs}{\value{pageref}}%
%       \noindent\marginwrite{%
%        %\colorbox{tiu!4}{%
%        \parbox{6em}{%
%          \scriptsize%
%          \printlist[pageref][-\value{refs}]{pageref}}}%
%      \blx@initunit%
%           }
%           {\blx@initunit}%
%           \setcounter{refs}{-1}%
%    }

\usepackage{graphicx}
\newcommand\graph{{\color{tiu}\raisebox{-.15em}{\includegraphics[height=0.8em]{./connectedpapers.pdf}}}}


% \newcommand*{\name}{}
% \DeclareIndexNameFormat{getname}{%
%   \def\addcomma{,}
%   \def\space{ }
%   \ifnumgreater{\value{listcount}}{\value{liststart}}
%     {\ifnumless{\value{listcount}}{\value{liststop}}
%        {\xappto{\name}{\addcomma\space}}
%        {\ifnumgreater{\value{liststop}}{2}
%           {\xappto{\name}{\finalandcomma}}
%           {}%
%         \xappto{\name}{\space\bibxstring{and}\space}}}
%     {}%
% \nameparts{#1}
% \ifblank{\namepartgiveni}
%   {}
%   {\ifgiveninits
%      {\xappto{\name}{\namepartgiveni\space}}
%      {\xappto{\name}{\namepartgiven\space}}}%
% \ifblank{\namepartprefix}
%   {\xappto{\name}{\namepartfamily}}
%   {\xappto{\name}{\namepartprefix\space\namepartfamily}}}

% \DeclareCiteCommand{\getauthor}
%   {\undef\name
%    \boolfalse{citetracker}%
%    \boolfalse{pagetracker}}
%   {\ifnameundef{author}
%      {}
%      {\ifboolexpr{ test {\ifnumgreater{\value{citecount}}{1}}
%                    and not test {\ifundef{\name}} }
%         {\gappto{\name}{; }}
%         {}%
%       \indexnames[getname][1-99]{author}}}
%   {}
%   {}

% needs to go before hyperref
\renewcommand*{\foottextfont}{\heading\footnotesize}
\RequirePackage[flushmargin, hang, norule,
	stable]{footmisc}
\RequirePackage{hyperref}

\usepackage{footnotebackref}

\newcommand\thanksfootnote[1]{%
	\vskip-\onelineskip
	\begingroup%
	\renewcommand\thefootnote{}%
	\footnote{#1}%
	\addtocounter{footnote}{-1}%
	\endgroup%
}



\newcommand{\connectedpapers}[1]{\href{https://www.connectedpapers.com/search?q=#1}{\graph}}
\newcommand{\semanticscholar}[1]{\raisebox{-.15em}{\href{https://semanticscholar.com/search?q=#1}{\aiicon{semanticscholar}}}}
\newcommand{\google}[1]{\raisebox{-.15em}{\href{https://scholar.google.com/scholar?\&as\_sdt=0\%2C5\&q=#1}{\aiicon{googlescholar}}}}
\newcommand\printconnected{\connectedpapers{\name\%20 \thefield{title} \thefield{year}}}

\newcommand{\icontoogle}{%
	\if@semantic
		\semanticscholar{\name\%20 \thefield{title} \thefield{year}}
	\fi
	\if@google
		\google{\name\%20 \thefield{title} \thefield{year}}
	\fi}

% to hfill across linebreaks
\newcommand\quelle[1]{{%
			\unskip\nobreak\hfil\penalty50
			\hbox{}\nobreak\hfil\textbf{#1}%
			\parfillskip=0pt \finalhyphendemerits=0 \par}}

\if@print

\else
	\DeclareFieldFormat{url}{%
		\ifhyperref{
			\ifentrytype{book}{
				\href{https://doi.org/#1}{\faIcon{book}}
			}{
				\ifentrytype{inbook}{
					\href{https://doi.org/#1}{\faIcon{book}}
				}{
					\href{https://doi.org/#1}{\faIcon{link}}
				}}}{\nolinkurl{https://doi.org/#1}}}

	\DeclareFieldFormat{doi}{%
		\scriptsize\href{https://doi.org/#1}{\small\aiicon{doi}}%
	}

	\renewbibmacro*{finentry}{
	\finentry~{\scriptsize\printfield{doi}}%
	%\getauthor{\thefield{entrykey}}%
	% \quelle{{\ \scriptsize\printfield{doi}}}
	% \iffieldundef{doi}{%
	%   \quelle{\printconnected}%
	% }{
	%   \quelle{{\scriptsize\printfield{doi}}\ \ \printconnected}%
	% }%
	}
\fi

\DeclareBibliographyCategory{rec}

\DeclareBibliographyDriver{book}{%
	\usebibmacro{bibindex}%
	\usebibmacro{begentry}%
	\usebibmacro{author/editor}%
	\setunit{\printdelim{nametitledelim}}\newblock
	\usebibmacro{maintitle+title}%
	\newunit\newblock
	\printlist{publisher}%
	\newunit\newblock
	\usebibmacro{origyear}%
	\newblock
	\if@print\usebibmacro{doi+url}\fi
	%\usebibmacro{scholar}
	\newunit\newblock
	\printfield{addendum}%
	\setunit\newblock
	%\newblock
	\iftoggle{bbx:related}
	{\usebibmacro{related:init}%
		\usebibmacro{related}}
	{}%
	\newunit\newblock
	\usebibmacro{pageref}%
	%\usebibmacro{annotation}%
	\usebibmacro{finentry}}

%\RequirePackage[backref=true]{enotez}
\DeclareBibliographyDriver{article}{%
	\usebibmacro{bibindex}%
	\usebibmacro{begentry}%
	\usebibmacro{author/editor}%
	\setunit{\printdelim{nametitledelim}}\newblock
	\usebibmacro{title}%
	\setunit{\addspace}\newblock
	\usebibmacro{apa:related}%
	\newunit\newblock
	\usebibmacro{journal+issuetitle}%
	\setunit{\bibpagespunct}%
	\printfield{pages}%
	\newunit\newblock
	\printfield{howpublished}%
	\newunit\newblock
	\usebibmacro{origyear}%
	\newblock
	\if@print\usebibmacro{doi+url}\fi
	%\usebibmacro{scholar}
	\newunit\newblock
	\printfield{addendum}%
	\setunit\newblock
	\iftoggle{bbx:related}
	{\usebibmacro{related:init}%
		\usebibmacro{related}}
	{}%
	\newunit\newblock
	\usebibmacro{pageref}%
	%\usebibmacro{annotation}%
	\usebibmacro{finentry}}

\DeclareBibliographyDriver{inbook}{%
	\usebibmacro{bibindex}%
	\usebibmacro{begentry}%
	\usebibmacro{author/editor}%
	\setunit{\printdelim{nametitledelim}}\newblock
	\usebibmacro{title}%
	\setunit{\addspace}\newblock
	\usebibmacro{apa:related}%
	\newunit\newblock
	\usebibmacro{editor+trans}%
	\newblock
	\usebibmacro{maintitle+booktitle}%
	\newunit\newblock
	\printlist{publisher}%
	\newunit\newblock
	\usebibmacro{origyear}%
	\newblock
	\if@print\usebibmacro{doi+url}\fi
	%\usebibmacro{scholar}
	\newunit\newblock
	\printfield{addendum}%
	\setunit\newblock
	\iftoggle{bbx:related}
	{\usebibmacro{related:init}%
		\usebibmacro{related}}
	{}%
	\usebibmacro{pageref}%
	%\usebibmacro{annotation}%
	\usebibmacro{finentry}}



%%% TOC
\RequirePackage{etoc}
\etocsetlevel{title}{0}
\etocsetlevel{subtitle}{1}
\etocsetlevel{authors}{2}
\etocsetlevel{section}{4}
\etocsetlevel{subsection}{5}
\etocsetlevel{subsubsection}{6}
\etocsetlevel{banner}{3}
\etocsettocdepth{section}

\newcommand{\authorstotoc}[1]{\etoctoccontentsline{authors}{#1}}

\newlength{\tocleft}
\setlength{\tocleft}{3cm}

\newlength{\tocsep}
\setlength{\tocsep}{1em}

%\RequirePackage[overload]{textcase}
\etocsetstyle{part}{}{}{\vspace*{4ex}\centering{\scshape\MakeLowercase\etocname\kern1em\relax\if@tocpages\textsc{\etocpage}\fi\par\vspace{3ex}}}{}

% to avoid possible line breaks between chapter (or part) name and page number
% replace \quad by \kern1em\relax

\etocsetstyle{chapter}{}{}{\vskip\baselineskip\etocifnumbered
	{\makebox[0pt][r]
		{\etocnumber\hspace{\tocsep}}%
		\RaggedRight\textbf{\etocname}\kern1em\relax\if@tocpages\hfill\textsc{\etocpage}\fi\par\vspace{2ex}}%
	{\makebox[0pt][r]
		{\hspace{\tocsep}}%
		\RaggedRight\textbf{\etocname}\kern1em\relax\if@tocpages\hfill\textsc{\etocpage}\fi\par\vspace{2ex}
	}}{}

\etocsetstyle{authors}{}{}{\etocname\par\vspace{1ex}}{\vspace{2ex}}

%\etocsetstyle{section}{}{}{\makebox[0pt][r]{\etocnumber\hspace{\tocsep}}%
\etocsetstyle{section}{}{}{
	\hspace{2ex}\RaggedRight\etocname\kern1em\relax\if@tocpages\hfill\textsc{\etocpage}\fi\par}%
{\vspace{2ex}
}{}

\etocsetstyle{subsubsection}{}{}{}{}

\etocsetstyle{subtitle}{}{}{\textit{\etocname}\par}{}

\etocsetstyle{banner}{}{}{\etocname\par\vspace{2ex}}{}

\etocsettocstyle {\noindent{\Large \contentsname}\par
	\pagestyle{plain}%
	\noindent\rule{\textwidth}{1pt}\par\vspace{3ex}%
	\parindent0pt\def\TEMP{0}}{}




\renewcommand{\thesection}{\arabic{section}}

\headstyles{bringhurst}

\setsecheadstyle{\heading\scshape\MakeLowercase}%\MakeLowercase}
\setaftersubsubsecskip{1sp}
\setbeforesubsubsecskip{-\baselineskip}
\setsubsubsecheadstyle{\heading\scshape\MakeLowercase}
\setsubsubsecindent{0pt}

% \def\oldsubsec\subsubsection

\if@nonumberedheadings
	\setsecnumformat{}
\else
	\setsecnumformat{\ \csname the#1\endcsname\ \ \  \raisebox{-.1em}{\textbullet}\ \ \ }
\fi
\setsubsecheadstyle{\heading\itshape}


%% Part
%%

\renewcommand*{\parttitlefont}{\centering\HUGE\scshape\MakeLowercase}
\renewcommand{\printpartname}{}
\renewcommand{\partnamenum}{}
\renewcommand{\printpartnum}{}

%%%% Chapter Options

% \RequirePackage{pdfcomment}

\RequirePackage{etoolbox}

%% Headers

\pagestyle{ruled}
\makeheadrule{ruled}{0pt}{0pt}

\if@print
	\setstocksize{\dimexpr\stocky+2\bleed\relax}{\dimexpr\stockx+2\bleed\relax}
	\settrims{\bleed}{\bleed}
	\settrimmedsize{\stocky}{\stockx}{*}
	\pdfpageattr{
	/TrimBox [8.50 8.50 440.50 656.50]
	/BleedBox [0 0 449 665]
	}
\else
	\setstocksize{\stocky}{\stockx}
	\settrimmedsize{\stockheight}{\stockwidth}{*}
\fi
\settypeblocksize{6in}{29pc}{*}
\setulmargins{3.8cm}{*}{1.62}
\setlrmargins{*}{*}{1.667}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\checkandfixthelayout


\newcommand*{\firstchapterthumbskip}{0pt}
\newcommand*{\chapterthumbheight}{\if@print\dimexpr2em + \bleed \relax\else2em\fi}
\newcommand*{\chapterthumbwidth}{\dimexpr\the\stocky / \value{@numberofthumbs}\relax}%
\newcommand*{\chapterthumbskip}{\chapterthumbwidth}%
\newcommand*{\chapterthumbsep}{\dimexpr%
	\stockwidth  -\spinemargin - \if@print\bleed\else0pt\fi + 1pt%
	\relax%
}%

\newcommand*{\chapterthumbboxcolor}{gray!10}%
\newcommand*{\chapterthumbcolor}{white}
\newcommand*{\chapterthumbformat}{\thechapter}

\if@partthumbs
  \renewcommand*{\chapterthumbformat}{\the\value{part}}
\fi

\newcommand*{\chapterthumbfont}{\itshape\LARGE}
% If on the verso page the thumb should be drawn upside down
\newcounter{extrathumbs}
\setcounter{extrathumbs}{0}
\newcommand*{\chapnumboxdir}{r}

\let\oldformat\chapterthumbformat
\newcommand*\addthumb[3][before]{
	\renewcommand*{\chapterthumbformat}{#2}
	\edef\x{#1}
	\edef\before{before}
	\ifx\x\before
		\addtocounter{extrathumbs}{1}
	\fi
	#3
	\ifx\x\before
	\else
		\addtocounter{extrathumbs}{1}
	\fi
	\renewcommand*{\chapterthumbformat}{\oldformat}
}

\let\oldchapterthumbwidth\chapterthumbwidth
\edef\numberofthumbsminusone{\numexpr\value{@numberofthumbs}-1\relax}
\newcommand*{\makethumb}[1][1]{

\edef\bufferside{}
\edef\buffertop{}
\edef\bufferbottom{}

\if@partthumbs

	\edef\thumbnum{\numexpr(\the\value{part} + \value{extrathumbs})\relax}
  \else
	\edef\thumbnum{\numexpr(\the\value{chapter} + \value{extrathumbs})\relax}
  \fi
	\if@print
  \renewcommand*{\bufferside}{\vspace*{-\bleed}}
  % The first thumb is a lil bit taller to accurately bleed
  % We also add a little bit of space to the top so that the thumb
  % text is properly centered when the bleed is cut off
	\ifnum\thumbnum=0
		\renewcommand*{\chapterthumbwidth}{\dimexpr \oldchapterthumbwidth + \the\bleed \relax}
		\renewcommand*{\chapterthumbskip}{\dimexpr\oldchapterthumbwidth + \the\bleed \relax}
		\edef\skip{\dimexpr%
			(\chapterthumbskip * \thumbnum) - \uppermargin + \the\bleed + \firstchapterthumbskip%
			\relax}
      \renewcommand*\bufferbottom{\hspace*{#1\bleed}}
	\else
  % The last thumb need to be a lil bit taller as well
		\ifnum\thumbnum=\numberofthumbsminusone
			\renewcommand*{\chapterthumbwidth}{\dimexpr \oldchapterthumbwidth + \the\bleed \relax}
			\renewcommand*{\chapterthumbskip}{\dimexpr\oldchapterthumbwidth + \the\bleed \relax}
			\edef\skip{\dimexpr%
				(\oldchapterthumbwidth * (\numexpr \numberofthumbsminusone - 2 \relax)) + (\chapterthumbskip * 2 ) - \uppermargin +  \firstchapterthumbskip%
				\relax}
        \renewcommand*\buffertop{\hspace*{#1\bleed}}
        % All other thumbs just need to be normal
		\else
			\renewcommand*{\chapterthumbwidth}{\oldchapterthumbwidth}
			% \renewcommand*{\chapterthumbskip}{\oldchapterthumbwidth}
			\edef\skip{\dimexpr%
				\chapterthumbskip + (\oldchapterthumbwidth * (\numexpr \thumbnum - 1\relax)) - \uppermargin + \the\bleed + \firstchapterthumbskip%
				\relax}
		\fi
	\fi
  \fi

	\if@thumbs
		\ifnum#1<0 \renewcommand*\chapnumboxdir{l}\fi
		\makebox[0pt][l]{%
			\hspace*{\dimexpr\chapterthumbsep * #1\relax}%
			\parbox[t][0pt][t]{0pt}{%
				\vspace*{\skip}%
				\makebox[0pt][\chapnumboxdir]{%
					\rotatebox{%
						\numexpr #1 * 90\relax%
					}{%
						\colorbox{%
							\chapterthumbboxcolor%
						}{%
							\parbox[t][\chapterthumbheight][c]{%
								\chapterthumbwidth
							}{%
                \bufferside%
								\centering
								\color{\chapterthumbcolor}%
                \buffertop%
								\if@emptythumbs\text{ }\else\chapterthumbfont{\chapterthumbformat}\fi%
                \bufferbottom%
                }}}}%
			}}
	\fi
}


\makeoddhead{ruled}{\makethumb}{}{{\heading\scshape\color{black!70}\MakeLowercase{\thechapter\ \   \@jotetitle}}}

\makeevenhead{ruled}{{\heading\color{black!70}\scshape\@booktitle}}{}{\makethumb[-1]}

\makeoddhead{plain}{\makethumb}{}{}
\makeevenhead{plain}{}{}{\makethumb[-1]{}}
% \ifdef{\@runningautor}{\@booktitle}{\@runningauthor}}}


% If the 'perchapterpagenum' option is toggled, substract the starting
% page number of the chapter from the total page number
% that way every chapter starts at 1`
\if@perchapterpagenum
	\makeevenfoot{ruled}{\the\numexpr\thepage - \thechapterpgn + 1\relax}{}{}
	\makeoddfoot{ruled}{}{}{\the\numexpr\thepage - \thechapterpgn + 1\relax}
\else
	\makeevenfoot{ruled}{\thepage}{}{}
	\makeoddfoot{ruled}{}{}{\thepage}
\fi




\copypagestyle{tussen}{empty}
\makeoddhead{tussen}{\makethumb}{}{}
\makeevenhead{tussen}{}{}{\makethumb[-1]}
\RequirePackage{eso-pic}
\copypagestyle{pic}{empty}
\copypagestyle{part}{empty}

\copypagestyle{chapter}{plain}
\makeoddhead{chapter}{\makethumb}{}{}
\makeevenhead{chapter}{}{}{\makethumb[-1]}

\makeoddhead{chapter}{}{}{\small\scshape\@runningauthor}
\makeoddfoot{chapter}{{\footnotesize\colorlet{tiuold}{tiu}\colorlet{tiu}{black!70}%
			\if@hovercite%
				\pdftooltip{\color{tiu}\faIcon[open]{quote-left}}{\@papercite}\quad%
			\else%
				\@papercite%
			\fi%
			\@authoremail
			\ifdefempty{\@paperdoi}{}{\href{\@paperdoi}{\aiicon{doi}}}%
			\colorlet{tiu}{tiuold}}}{}{}
\uppercaseheads\nouppercaseheads

\RequirePackage{hyperxmp}

\hypersetup{
	% hyperfootnotes=false,
	pdfpagelayout={TwoColumnRight},
	bookmarksnumbered=true,
	bookmarksopen=true,
	bookmarksopenlevel=0,
	pdfdisplaydoctitle={true}, pdfdisplaydoctitle={true}, pdfnonfullscreenpagemode={UseOutlines}, pdfcreator={Thomas F.K. Jorna, JOTE Publishers},
}
\if@print
	\hypersetup{colorlinks=true, urlcolor=black, citecolor=black, linkcolor=black}
\else
	\hypersetup{colorlinks=true, urlcolor=tiu, citecolor=tiu, linkcolor=tiu}
\fi

%To break long dois
\RequirePackage{breakurl}
% to insert xmp metadata

\RequirePackage{changepage}
%% Footnotes

%% lists

\AtBeginEnvironment{enumerate}{
	\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}
}

\RequirePackage[inline]{enumitem}
\setlist{nosep,font=\bfseries,leftmargin=*,align=left}
\setlist[1]{topsep=\baselineskip,leftmargin=\parindent,labelsep=*,labelwidth=*}
\setlist[enumerate,2]{label={\alph*.},}

\newlist{spaced}{itemize}{3}
\setlist[spaced,1]{label={ },itemsep=.5\baselineskip}


\newcommand{\contact}{%
	\clearpage
	\vskip\baselineskip
	\noindent{\heading \textsc{contact}}
	\vskip\baselineskip
	{\small
		\@authorcontact
	}}

\newcommand{\citeas}{%
	\vskip\baselineskip
	\noindent{\heading \textsc{cite as}}
	\vskip\baselineskip
	{\small
		\noindent\RaggedRight\@fancypapercite%
	}}
\newcommand\license{%
	\vskip\baselineskip
	\noindent{\heading \textsc{license}}\hfill{  } \faIcon{creative-commons}\  \faIcon{creative-commons-by}\ \faIcon{creative-commons-nc}\ \faIcon{creative-commons-nd}
	\vskip\baselineskip
	{\small
		\noindent\RaggedRight This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 (CC BY-NC-ND 4.0) license, which means that you are free to copy and distribute this work in any medium or format, granted that you a) give appropriate credit to the author (see above), b) do not use the material for \href{https://creativecommons.org/faq/\#does-my-use-violate-the-noncommercial-clause-of-the-licenses}{commercial purposes} and c) do not \href{https://wiki.creativecommons.org/Frequently\_Asked\_Questions\#When\_is\_my\_use\_considered\_an\_adaptation.3F}{remix, transform, or build upon the material}.
		For more information, see \url{https://www.creativecommons.org/licenses/by-nc/4.0/legalcode}.}
}



\newcommand{\evenmargins}{
	\pagestyle{ruled}
	\clearpage
	\settypeblocksize{7.6in}{27pc}{*}
	\checkandfixthelayout
	\ch@ngetext
}

\if@perchapterbib
	\defbibheading{bibliography}{\pdfbookmark[1]{References}{bib\the\value{chapter}}\etoctoccontentsline{banner}{References}\chapter*{References}}
\else
	\defbibheading{bibliography}{\chapter*{Bibliography}\pdfbookmark[0]{Bibliography}{bib}}
\fi

\defbibheading{subbibliography}{\addcontentsline{toc}{section}{Recommended Further Reading} \subsection*{Recommended further reading}}

\AtEndEnvironment{bibliography}{%
	\evenmargins%
	\clearpage
}
\AfterEndEnvironment{bibliography}{
	\clearpage
}
\let\oldh\headheight

\let\olds\headsep
% To reset page numbers because that makes sense to do
\newcounter{chapterpgn}

\makechapterstyle{bringhurst}{%
\renewcommand{\chapterheadstart}{}
\renewcommand{\printchaptername}{}
\renewcommand{\chapternamenum}{}

\if@bigchapnum
	\renewcommand{\printchapternum}{\vspace*{-2\baselineskip}\hfill \resizebox{!}{5\baselineskip}{\color{black!10}\textsc{\thechapter}}\vspace*{-6\baselineskip} \quad\quad\quad}
\else
	\renewcommand{\printchapternum}{}
	\renewcommand{\afterchapternum}{}
\fi

\renewcommand{\printchaptertitle}[1]{%
	\jotetitle{##1}
	\raggedleft\heading\LARGE{##1}%
}

\renewcommand{\afterchaptertitle}{%
\\{\color{black!70}\itshape\large\@jotesubtitle}
\if@perchapterpagenum\setcounter{chapterpgn}{\thepage}\fi%
\vskip6\onelineskip%
}%
}

\chapterstyle{bringhurst}
\makechapterstyle{tussen}{
\renewcommand{\chapterheadstart}{}
\renewcommand{\printchaptername}{}
\renewcommand{\chapternamenum}{}
\renewcommand{\printchapternum}{}
\renewcommand{\afterchapternum}{}
\renewcommand{\printchaptertitle}[1]{%
	\heading\Large\scshape\MakeLowercase{##1}%
}

\renewcommand{\afterchaptertitle}{%
\\[\onelineskip]{\normalshape\color{black!70}\itshape\large\@jotesubtitle}
\vskip2\onelineskip%
}%
}
% \RequirePackage{floatrow}
\RequirePackage[tableposition=top, figureposition=bottom, singlelinecheck=false, labelfont=sc, labelsep=quad, justification=RaggedRight, font=small]{caption}
\RequirePackage{wrapfig}
\RequirePackage{threeparttable}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{siunitx}
\RequirePackage[skins,breakable,fitting]{tcolorbox}
\RequirePackage{ragged2e}

\newcommand*\cleartoleftpage{%
	\clearpage
	\ifodd\value{page}\hbox{}\newpage\fi
}

\newcommand*\titlepage{%
\pagestyle{empty}
\noindent{\HUGE  \@booktitle}\\[.25\onelineskip]
{ \Large   \@booksubtitle}\\[6\onelineskip]
{\Large\textbf{\@bookauthor}} \\[.2\onelineskip]
\vfill
\if@print\else\noindent\href{\@bookcontacturl}{Web version}\\\fi
\noindent \@bookpublisher {\hfill \ifdefempty{\@bookpublisherlogo}{}{\includegraphics[width=2em]{\@bookpublisherlogo}}}
\clearpage
\pagestyle{ruled}
}

\newcommand*\copyrightpage{%
	\pagestyle{empty}

	%% copyrightpage
	\begingroup

	\RaggedRight
	\footnotesize
	\@initialcredits

	\vfill

	\noindent{\normalsize\faIcon{creative-commons}\ \ \faIcon{creative-commons-by}\ \ \faIcon{creative-commons-nc-eu}\ \ \faIcon{creative-commons-nd}}\\

	\vspace*{2\baselineskip}

	\noindent\@bookcopyright\par
	\vspace*{2\baselineskip}
	\ifdefempty{\@bookedition}{}{\noindent\@bookedition\ \ Edition\\}
	\noindent\textsc{isbn \@bookisbn}\\
	\noindent\textsc{doi \href{https://doi.org/\@bookdoi}{\@bookdoi}}

	\vspace*{2\baselineskip}

	\noindent \@bookpublisher,\\
	\@bookpublisherlocation\\
	\href{https://www.openpresstiu.org}{https://www.openpresstiu.org}

	\vspace*{2\baselineskip}


	\begingroup
	\footnotesize
	\colorlet{oldt}{tiu}
	\colorlet{tiu}{black}
	\@othercredits
	\endgroup
	\vspace*{2\baselineskip}
	\noindent\textcopyright{} \@bookyear\ \@bookauthor.
	\endgroup
}

\newcommand\backcover[1]{
	\overpass
	\setlrmargins{*}{*}{1}
	\checkandfixthelayout
	%% backcover
	%%
	\raggedright

	% \pagecolor{light}
	\begingroup
	\small

	% \emph{Evidence based HRM: What (do) we know about people in workplaces?} is an authoritative, practical text on using scientific and local evidence for doing Human Resource Management. It explains how making informed decisions about people in workplaces will benefit organizational performance, assure fit with the organizational context, as well as benefit employee wellbeing. The book provides a quick reference to the core theories and the key research evidence that inform present day HRM knowledge.

	% \vspace*{\baselineskip}
	% \noindent The text is distinctive because it:
	% \begin{itemize}
	%   \item	Provides a workflow for the diagnosis of HRM issues in organizations
	%   \item	Covers the role of gathering stakeholder interests and concerns, both in the framing of HR decisions and the designing of solutions
	%   \item	Reports the essential HRM theories in an accessible yet thorough way
	%   \item	Provides practical cases and study questions to help students and managers understand and apply evidence based HRM
	% \end{itemize}

	% \noindent Essential reading for any manager responsible for making decisions about people in organizations, it is suitable for undergraduate, postgraduate and executive students of HRM, Personnel Management and Employment Relations students.
	% \vspace*{\baselineskip}

	% \noindent \emph{Brigitte Kroon is an associate professor and director of education of Human Resource Studies (Bsc) at Tilburg University, the Netherlands.}
	#1

	\endgroup

	\vfill

	\begin{minipage}{.45\linewidth}
		\small
		\@bookpublisher
		\vspace*{\baselineskip}\\
		\makeatletter
		\textbf{ISBN}  \@bookisbn\\
		\href{https://doi.org/\@bookdoi}{\textbf{DOI}  \@bookdoi}
		\vspace*{\baselineskip}\\
		\makeatother
		{\large\faIcon{creative-commons}\ \ \faIcon{creative-commons-by}\ \ \faIcon{creative-commons-nc-eu} \ \faIcon{creative-commons-nd}}
	\end{minipage} \hfill
	\begin{minipage}{.3\linewidth}
		% \includegraphics[width=\linewidth]{barcode.png}
		\barracuda{ean-isbn}{\@bookisbn}
	\end{minipage}
	\clearpage

}

\RequirePackage{nowidow}
\setcounter{errorcontextlines}{30}
\AtBeginDocument{
	%\addtocontents{toc}{\protect\hypersetup{hidelinks}}
	%\renewcommand{\bibname}{References}
	\hypersetup{
		pdfauthor={\ifdefempty{\@bookauthor}{\@runningauthor}{\@bookauthor}},
		pdftitle={\ifdefempty{\@booktitle}{}{\@booktitle}},
		pdfsubject={\ifdefempty{\@booksubject}{}{\@booksubject}},
		pdfkeywords={\ifdefempty{\@bookkeywords}{}{\@bookkeywords}},
		pdfpublisher={\ifdefempty{\@bookpublisher}{Open Press Tilburg University}{\@bookpublisher}},
		pdfbookedition={\ifdefempty{\@bookedition}{\@bookversion}{\@bookedition}},
		pdfcopyright={\textcopyright \@bookyear, \@bookauthor.
				\@bookcopyright},
		pdflicenseurl={\ifdefempty{\@booklicenseurl}{}{\@booklicenseurl}}, pdfcontactemail={\ifdefempty{\@bookcontactemail}{}{\@bookcontactemail}},
		pdfcontacturl={\ifdefempty{\@bookcontacturl}{}{\@bookcontacturl}}, pdfurl={\ifdefempty{\@bookurl}{}{\@bookurl}},
		pdfdoi={\ifdefempty{\@bookdoi}{}{\@bookdoi}},
	}

	% Don't want colored TOC links
	\addtocontents{toc}{\protect\hypersetup{hidelinks}}
	\setlength{\emergencystretch}{3em} % prevent overfull line

	% Orphans are okay, widows arent
	\setnoclub[1]
	\setnowidow[2]

}
