%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Masters/Doctoral Thesis 
% Class File
% Version 1.0 (28/8/15)
%
% This class has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original authors:
% Vel (vel@latextemplates.com)
%
% Note:
% This class file defines the structure and design of the template file (main.tex).
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{UAThesis}[2015/06/25 v2.0 LaTeX document class]
\providecommand{\baseclass}{book}

\RequirePackage{etoolbox}
\RequirePackage{xparse}
\newbool{nolistspace}
\newbool{listtoc}
\newbool{toctoc}
\newbool{parskip}

\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax

\LoadClass{\baseclass}

%----------------------------------------------------------------------------------------
%	CLASS OPTIONS
%----------------------------------------------------------------------------------------

\ifbool{parskip}{\RequirePackage{parskip}} % If the parskip option is passed to the class, require the parskip package 

\patchcmd{\@makechapterhead}{\vspace*{50\p@}}{\abovechapterspace}{}{}
\patchcmd{\@makeschapterhead}{\vspace*{50\p@}}{\abovechapterspace}{}{}
\newcommand{\abovechapterspace}{\vspace*{50pt}}

\ifbool{listtoc}{% If the liststotoc option has been passed to the class, add the lists to the table of contents
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}}{}{}%
}

\ifbool{toctoc}{% If the toctotoc options has been passed to the class, add the table of contents to the table of contents
	\patchcmd{\tableofcontents}{\@starttoc{toc}}{%
		\addchaptertocentry{\contentsname}\@starttoc{toc}}{}{}%
}

\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

% If the option `nolistspacing' is given, the spacing in the different lists is reduced to single spacing. This option is only useful, if the spacing of the document has been changed to onehalfspacing or doublespacing.
\ifbool{nolistspace}{
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}}{%
			\begingroup%
			\singlespace\@starttoc{lof}\endgroup%
		}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}}{%
			\begingroup%
			\singlespace\@starttoc{lot}\endgroup%
		}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}}{%
			\begingroup%
			\singlespace\@starttoc{toc}\endgroup%
		}{}{}%
}{}

% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{chapter}{#3}%
			\markboth{\MakeMarkcase{#3}}{}%
		}{%
			\addcontentsline{toc}{chapter}{#2}%
			\markboth{\MakeMarkcase{#2}}{}%
		}%
	}%
}%

\ProvideDocumentCommand{\addsec}{ s o m }{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------
\usepackage{babel} % Required for automatically changing names of document elements to languages besides english


\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements

\RequirePackage{scrhack} % Loads fixes for various packages

\RequirePackage{setspace} % Required for changing line spacing

\RequirePackage{longtable} % Required for tables that span multiple pages (used in the symbols, abbreviations and physical constants pages)

\usepackage{siunitx} % Required for \SI commands

\usepackage[printonlyused]{acronym} % Required for acronyms

\usepackage{tikz} % Tikz pictures
\usetikzlibrary{positioning}

\usepackage{pgf}
\usepackage{pgfplots}
\usepackage{pgfplotstable}
\usepackage{tabularx}

\usepackage{relsize}

\usepackage{pdfpages}

\usepackage{tocbibind}

\usepackage{graphicx} % Required to include images
\graphicspath{{Figures/}{./}} % Specifies where to look for included images

\usepackage{booktabs} % Required for better table rules
\usepackage{colortbl}

\RequirePackage[labelfont=bf]{caption} % Required for customising the captions
\setlength{\captionmargin}{42pt}
\usepackage{subcaption}

\usepackage{amsmath}
\usepackage{colortbl}
\usepackage{pgfplots}
\usepackage{pgfplotstable}
\usepackage{tabularx}
\usepackage{booktabs}

\RequirePackage{xcolor}

\definecolor{uablue50}{RGB}{0,91,130}
\definecolor{uablue35}{RGB}{166,198,211}
\definecolor{uablue30}{RGB}{178,206,217}
\definecolor{uablue20}{RGB}{204,222,236}
\definecolor{uablue10}{RGB}{229,239,242}
\definecolor{uagray80}{RGB}{81,81,81}
\definecolor{uagray50}{RGB}{156,156,156}
\definecolor{uagray30}{RGB}{185,185,185}
\definecolor{uagray20}{RGB}{204,204,204} % unofficial extension (inkscape conversion from cmyk!)
\definecolor{uagray10}{RGB}{229,229,229} % unofficial extension (inkscape conversion from cmyk!)
\definecolor{uagray05}{RGB}{242,242,242} % unofficial extension (inkscape conversion from cmyk!)
\definecolor{uawhite}{RGB}{255,255,255}

\definecolor{uabranchred}{RGB}{212,45,18}% Gesundheit
\definecolor{uabranchyellow}{RGB}{230,175,17}% Energie und Umwelt
\definecolor{uabranchblue}{RGB}{0,131,190}% Informationstechnologie

\definecolor{uablue}{RGB}{0,91,130}% Diagram color blue % 100%
\definecolor{ualightblue}{RGB}{110,159,189}% Diagram color blue % 50% (inkscape conversion from cmyk!) {cmyk}{0.42,0.16,0.00,0.26}

\definecolor{uared}{RGB}{175,90,80}% Diagram color red % 100%
\definecolor{ualightred}{RGB}{198,141,132}% Diagram color red % 70%

\definecolor{uagreen}{RGB}{125,150,110}% Diagram color green % 100%
\definecolor{ualightgreen}{RGB}{164,181,153}% Diagram color green % 70%

\definecolor{uayellow}{RGB}{215,170,80}% Diagram color yellow % 100%
\definecolor{ualightyellow}{RGB}{235,212,167}% Diagram color yellow % 50%

\usepackage{forest}
\usepackage[hyphens]{url}
\usepackage{xspace}
\newcommand{\TikZ}{Ti\emph{k}Z\xspace}

\usepackage[
	    type={CC},
			    modifier={by-sa},
					    version={4.0},
						]{doclicense}
%\usepackage[utf8]{inputenc}
% Required for inputting international characters
\usepackage{fontspec}
\usepackage[T1]{fontenc}
\DeclareTextCommandDefault{\nobreakspace}{\leavevmode\nobreak\ }
% Output font encoding for international characters
\usepackage{palatino}
% Use the Palatino font by default
%\usepackage[backend=bibtex,style=authoryear,natbib=true]{biblatex}
\usepackage[backend=bibtex,natbib=true,citestyle=ieee]{biblatex}
% User the bibtex backend with the authoryear citation style (which resembles APA)
\addbibresource{personal.bib}
\addbibresource{objrecog.bib}
% The filename of the bibliography
\usepackage[autostyle=true]{csquotes}
% Required to generate language-dependent quotes in the bibliography
% \usepackage{cite}
% Citing references

%\usepackage[mark, dirty={Dirty - Do not print, commit first!}]{gitinfo2}
%\renewcommand{\gitMarkPref}{[Dirty]}
%\renewcommand{\gitMark}{Git Info: \gitDirty\, Branch: \gitBranch{}\,@\,\gitAbbrevHash{} \\ Author: \gitAuthorName{}\,-\,\gitAuthorIsoDate{}}

\usepackage{lipsum}
\usepackage{titlesec}
\usepackage[Lenny]{fncychap}
  \ChNameAsIs
  \ChTitleAsIs
  \ChNameVar{\Large\fontfamily{palatino}}
  \ChNumVar{\fontsize{60}{62}\usefont{OT1}{ptm}{mn}{n}\fontfamily{palatino}}
  \ChTitleVar{\Huge\bfseries\rm\fontfamily{palatino}}

%----------------------------------------------------------------------------------------
% COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\Revise}[1]{{\color{red}#1}} 

\newcommand\CC{C\nolinebreak[4]\hspace{-.05em}\raisebox{.4ex}{\relsize{-3}{\textbf{++}}}}

\newcommand{\checktoopen}{% New command to move content to the next page which prints to the next odd page if twosided mode is active  
\if@openright\cleardoublepage\else\clearpage\fi
}

\newcommand\bhrule{\typeout{--------------------}}
\newcommand\tttypeout[1]{\bhrule\typeout{\space #1}\bhrule}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % New command to make the lines in the title page

\renewcommand{\abovechapterspace}{\vspace*{10pt}} % Reduce the whitespace above a chapter heading

\setcounter{tocdepth}{3} % The depth to which the document sections are printed to the table of contents
\providecommand\addchaptertocentry[1]{%
\addcontentsline{toc}{chapter}{#1}}

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\RequirePackage{geometry}
\geometry{
	paper=a4paper, % Default paper size, change to "letterpaper" for US Letter (you'll need to adjust margins after)
	inner=1.5in, % The inner margin (beside binding)
	outer=1in, % The outer margin (opposite binding)
	top=.6in, % Top margin
	bottom=.8in, % bottom margin
	headheight=20pt, % Header height
	headsep=.25in, % Header separation
	includehead,
	includefoot
}

\raggedbottom

%----------------------------------------------------------------------------------------
%	PENALTIES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=9999 % Almost no widows at bottom of page
\clubpenalty=9999 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\RequirePackage{fancyhdr} % Required to customise headers and footers
\providecommand{\MakeMarkcase}{} % Add \MakeUppercase to make header text all capitals
\fancyhead{} % Erase the default headers and footers style to replace with our own
\fancyfoot{} % Erase the default headers and footers style to replace with our own
\if@twoside % If we are in two sided mode, print alternating page headers
\fancypagestyle{thesis}{%
	\fancyhead[LE,RO]{\itshape\nouppercase\thepage}%
	\fancyhead[RE,LO]{\itshape\nouppercase{\rightmark}}%
}
\else % If we are in one sided, print the headers on the same positions on all pages  
	\fancypagestyle{thesis}{%
	\lhead{\itshape\nouppercase{\rightmark}}% The left top header
	\rhead{\nouppercase\thepage}% The right top header
}
\fi
\pagestyle{thesis}

\renewcommand{\chaptermark}[1]{\tttypeout{\thechapter.\space #1}\markboth{\@chapapp\ \thechapter.\ #1}{\@chapapp\ \thechapter.\ #1}} % Define what is in the header and in what order
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%----------------------------------------------------------------------------------------
%	REFERENCING DOCUMENT ELEMENTS 
%----------------------------------------------------------------------------------------

\newcommand{\fref}[1]{\figurename~\ref{#1}}
\newcommand{\tref}[1]{\tablename~\ref{#1}}
\providecaptionname{german,ngerman,austrian,naustrian}{\equationnamenname}{Formel}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\equationnamenname}{Equation}
\newcommand{\eref}[1]{\equationname~\ref{#1}}
\newcommand{\cref}[1]{\chaptername~\ref{#1}}
\newcommand{\sref}[1]{\sectionname~\ref{#1}}
\providecaptionname{german,ngerman,austrian,naustrian}{\sectionname}{Abschnitt}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\sectionname}{Section}
\newcommand{\aref}[1]{\appendixname~\ref{#1}}

%----------------------------------------------------------------------------------------
%	DEFINE CUSTOM THESIS INFORMATION COMMANDS
%----------------------------------------------------------------------------------------

\newcommand*{\supervisor}[1]{\def\supname{#1}}
\newcommand*{\thesistitle}[1]{\def\@title{#1}\def\ttitle{#1}}
\newcommand*{\examiner}[1]{\def\examname{#1}}
\newcommand*{\degree}[1]{\def\degreename{#1}}
\renewcommand*{\author}[1]{\def\authorname{#1}}
\newcommand*{\addresses}[1]{\def\addressname{#1}}
\newcommand*{\university}[1]{\def\univname{#1}}
\newcommand*{\department}[1]{\def\deptname{#1}}
\newcommand*{\group}[1]{\def\groupname{#1}}
\newcommand*{\faculty}[1]{\def\facname{#1}}
\newcommand*{\subject}[1]{\def\subjectname{#1}}
\newcommand*{\keywords}[1]{\def\keywordnames{#1}}

%----------------------------------------------------------------------------------------
%	DECLARATION PAGE DESIGN
%----------------------------------------------------------------------------------------

\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\authorshipname}{Declaration of Authorship} % Declaration of Authorship text for English countries
\providecaptionname{german,ngerman,austrian,naustrian}{\authorshipname}{Eidesstattliche Erkl\"arung} % Declaration of Authorship text for Germanic countries

\newenvironment{declaration}{
	\checktoopen
	\tttypeout{\authorshipname}
	\thispagestyle{plain}
	\null\vfil
	{\noindent\huge\bfseries\authorshipname\par\vspace{10pt}}
}{}

%----------------------------------------------------------------------------------------
%	DEDICATION PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand\dedicatory[1]{
	\checktoopen
\tttypeout{Dedicatory}
\thispagestyle{plain}
\null\vfil
\begin{center}{\Large\slshape #1}\end{center}
\vfil\null
}

%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------

\providecaptionname{german,ngerman,austrian,naustrian}{\byname}{von}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\byname}{by}
\newenvironment{abstract}{
	\checktoopen
	\tttypeout{\abstractname}
	\null\vfil
	\begin{center}
	{\normalsize \MakeUppercase{\univname} \par} % University name in capitals
	\bigskip
	{\huge\textit{\abstractname} \par}
	\bigskip
	{\normalsize \facname \par} % Faculty name
	{\normalsize \deptname \par} % Department name
	\bigskip
	{\normalsize \degreename\par} % Degree name
	\bigskip
	{\normalsize\bfseries \@title \par} % Thesis title
	\medskip
	{\normalsize \byname{} \authorname \par} % Author name
	\bigskip
	\end{center}
}
{
  \vfil\vfil\vfil\null
}

%----------------------------------------------------------------------------------------
%	ABBREVIATIONS PAGE DESIGN
%----------------------------------------------------------------------------------------

\providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
\providecaptionname{ngerman,german,austrian,naustrian}{\abbrevname}{Abk\"urzungsverzeichnis}
\NewDocumentEnvironment{abbreviations}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\abbrevname}}{\addchap*{\abbrevname}}
	\begin{longtable}{#1}
}{%
\end{longtable}
\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	PHYSICAL CONSTANTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\providecaptionname{english,british,american}{\constantsname}{Physical Constants}
\providecaptionname{ngerman,german,austrian,naustrian}{\constantsname}{Physikalische Konstanten}

\NewDocumentEnvironment{constants}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\constantsname}}{\addchap*{\constantsname}}
	\begin{longtable}{#1}
}{%
\end{longtable}
\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	SYMBOLS PAGE DESIGN
%----------------------------------------------------------------------------------------

\providecaptionname{english,british,american}{\symbolsname}{List of Symbols}
\providecaptionname{ngerman,german,austrian,naustrian}{\symbolsname}{Symbolverzeichnis}

\NewDocumentEnvironment{symbols}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\symbolsname}}{\addchap*{\symbolsname}}
	\begin{longtable}{#1}
}{%
\end{longtable}
\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish} {\acknowledgementname}{Acknowledgements} % Acknowledgement text for English countries
\providecaptionname{german,ngerman,austrian,naustrian}{\acknowledgementname}{Danksagung} % Acknowledgement text for Germanic countries

\NewDocumentEnvironment{acknowledgements}{}{%
\checktoopen
\tttypeout{\acknowledgementname}
\thispagestyle{plain}
\begin{center}{\huge\textit{\acknowledgementname}\par}\end{center}
}
{
\vfil\vfil\null
}

%----------------------------------------------------------------------------------------

\usepackage{hyperref} % Required for customising links and the PDF
\hypersetup{pdfpagemode={UseOutlines},
bookmarksopen=true,
bookmarksopenlevel=0,
hypertexnames=false,
colorlinks=true, % Set to false to disable coloring links
citecolor=uablue50, % The color of citations
linkcolor=uablue50, % The color of references to document elements (sections, figures, etc)
urlcolor=uablue50, % The color of hyperlinks (URLs)
pdfstartview={FitV},
unicode,
breaklinks=true,
}

\pdfstringdefDisableCommands{ % If there is an explicit linebreak in a section heading (or anything printed to the pdf-bookmarks), it is replaced by a space
   \let\\\space
}

\newcommand{\mybox}[1]{\par\noindent\colorbox{gray!50}
{\parbox{\dimexpr\textwidth-2\fboxsep\relax}{#1}}}

%\newenvironment{chapterabstract}{\leftskip2em\rightskip2em\itshape}{}
\newenvironment{chapterabstract}{%
  \par\nobreak\noindent
  \textbf{\textit{Abstract}~\hrulefill}\par\nobreak
  \medskip
  \small
  \noindent\ignorespaces}
{%
  \par\nobreak\normalsize
  \medskip
  \vskip-\ht\strutbox\noindent
  \textbf{\hrulefill}%
}

%----------------------------------------------------------------------------------------

\endinput
