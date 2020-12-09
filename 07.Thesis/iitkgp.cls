\NeedsTeXFormat{LaTeX2e} \ProvidesClass{iitkgp}

% ---------------------------- declarations -------------------------
%
% These macros are used to declare arguments needed for the
% construction of the preliminary pages  

% The year and month the degree is awarded
\newcommand{\Year}[1]{\gdef\@Year{#1}}
\newcommand{\Month}[1]{\gdef\@Month{#1}}

% The full name of the degree
\newcommand{\degree}[1]{\gdef\@degree{#1}}

\newcommand{\Dept}[1]{\gdef\@Dept{#1}}

\newcommand{\Insti}[1]{\gdef\@Insti{#1}}

% The name of this document (thesis/dissertation)
\newcommand{\docname}[1]{\gdef\@docname{#1}}

% First line of title
\newcommand{\TitleTop}[1]{\gdef\@TitleTop{#1}}

% Second line of title
\newcommand{\TitleBottom}[1]{\gdef\@TitleBottom{#1}}

\newcommand{\TitleFull}{\@TitleTop\ \@TitleBottom}

% Abstract text
\newcommand{\Abstract}[1]{\gdef\@Abstract{#1}}

% Acknowledgments text
\newcommand{\Acknowledgments}[1]{\gdef\@Acknowledgments{#1}}

% The author's name
\newcommand{\Author}[1]{\gdef\@Author{#1} \gdef\studname{#1}}


% The name of the advisor number 1
\newcommand{\AdvisorA}[1]{\gdef\@AdvisorA{#1}}

% The name of the advisor number 2
\newcommand{\AdvisorB}[1]{\gdef\@AdvisorB{#1}}

% The name of the "dummy" advisor
\newcommand{\Advisor}[1]{\gdef\@Advisor{#1}}

\newcommand{\MemberA}[1]{\gdef\@MemberA{#1}}

% The name of the committee member 3
\newcommand{\MemberB}[1]{\gdef\@MemberB{#1}}

% The name of the committee member 4
\newcommand{\MemberC}[1]{\gdef\@MemberC{#1}}

% The name of the committee member 5
\newcommand{\MemberD}[1]{\gdef\@MemberD{#1}}

% The name of the department chair
\newcommand{\DepRep}[1]{\gdef\@DepRep{#1}}

% The title of the department chair (allow for associate chair, etc.)
\newcommand{\DepRepTitle}[1]{\gdef\@DepRepTitle{#1}}

% The name of the department undergraduate coordinator
\newcommand{\UgradCoord}[1]{\gdef\@UgradCoord{#1}}

% The name of the dean
\newcommand{\Dean}[1]{\gdef\@Dean{#1}}

% The title of the dean
\newcommand{\DeanTitle}[1]{\gdef\@DeanTitle{#1}}

% The name of the honors dean
\newcommand{\HonorsDean}[1]{\gdef\@HonorsDean{#1}}

\newcommand{\AuthorDeclaration}[1]{\gdef\@AuthorDeclaration{#1}}

\newcommand{\DedicatedTo}[1]{\gdef\@DedicatedTo{#1}}
\newcommand{\ApprovalSignatures}[1]{\gdef\@ApprovalSignatures{#1}}
\newcommand{\CertificateSignature}[1]{\gdef\@CertificateSignature{#1}}

% Set default values for fields
  \Year{1905}
  \Month{January}
  \Author{Author}
  \Dept{Department of CSE}
  \Insti{IIT Kharagpur}
  \TitleTop{First line of title}
  \TitleBottom{ } % default is empty
  \Abstract{}
  \Acknowledgments{}
  \degree{Bachelor of Science}
  \docname{senior thesis}
  \AdvisorA{AdvisorA}
  \AdvisorB{AdvisorB}
  \Advisor{Advisor}
  \MemberA{Committee Member A}
  \MemberB{Committee Member B}
  \MemberC{Committee Member C}
  \MemberD{Committee Member D}
  \DepRep{Department Chair Name}
  \DepRepTitle{Chair}
  \Dean{Dean Name}
  \DeanTitle{Associate Dean}
  \HonorsDean{Honors Dean Name}
  \UgradCoord{Department Ugrad Coordinator }
  
  \AuthorDeclaration{Your Declaration}
  \DedicatedTo{Your dedication}
  \CertificateSignature{}
  
% ---------------------------- options ------------------------------

% A command to switch to single spaced lines
\newcommand{\singlespace}{\renewcommand{\baselinestretch}{1}\small\normalsize}

% A command to switch to double spaced lines
\newcommand{\doublespace}{\renewcommand{\baselinestretch}{1.60}\small\normalsize}

\newcommand{\onehalfspace}{\renewcommand{\baselinestretch}{1.3}\small\normalsize}

% A command pirated from chngpage.sty
\DeclareRobustCommand{\ch@ngetext}{%
  \setlength{\@colht}{\textheight}\setlength{\@colroom}{\textheight}%
  \setlength{\vsize}{\textheight}\setlength{\columnwidth}{\textwidth}%
  \if@twocolumn%
    \advance\columnwidth-\columnsep \divide\columnwidth\tw@%
    \@firstcolumntrue%
  \fi%
  \setlength{\hsize}{\columnwidth}%
  \setlength{\linewidth}{\hsize}%
}

% A command to make margins right for the initial single sided business.
\newcommand{\preliminarymargins}{%
    \addtolength{\textwidth}{-0.5in}%
    \addtolength{\evensidemargin}{0.5in}%
    \ch@ngetext%
    }

% A command to fix the margins after the initial single sided business.
\newcommand{\fixmargins}{%
    \addtolength{\textwidth}{0.5in}
    \addtolength{\evensidemargin}{-0.5in}
    \ch@ngetext%
}

% Define the preliminary section for a senior thesis.  
% The senior option is essentially ignored since it is the default 
  \newcommand{\makepreliminarypages}{
    \preliminarymargins
    \namepage 
    \titlepage 
    \copyrightpage 
    \seniorapprovalpage 
    \abstractpage 
    \acknowledgmentspage 
    \fixmargins
    \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}
  }

% Changes to PhD preliminary section if the 'phd' option is specified
\DeclareOption{phd}{
  \degree{Doctor of Philosophy}
  \docname{dissertation}
  \renewcommand{\makepreliminarypages}{ 
    \preliminarymargins
    %\namepage
    \addcontentsline{toc}{chapter}{Title Page}
    \titlepage 
    \addcontentsline{toc}{chapter}{Certificate of Approval}
    \approvalpage
    \addcontentsline{toc}{chapter}{Certificate}
    \certificatepage
    \dedicationpage
    \acknowledgmentspage 
    \addcontentsline{toc}{chapter}{Declaration}
    \declarationpage    
    \abstractpage     
    \fixmargins
    \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}
  }
}

% --------------------- Some commands to handle the single sided preliminary pages ------------------

% Define the '\clearemptydoublepage' command to clear pages but not number any blank pages inserted.

\let\cle@rdoublep@ge\cleardoublepage
\newcommand{\cle@remptydoublep@ge}{
  \clearpage
  \if@twoside
  \ifodd\c@page\else
  \fi\fi
  {\pagestyle{empty}\cle@rdoublep@ge}}
\newcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}


% Create an abstract environment which is single sided, even in a double sided book.

\def\skip@bstr@ctp@ges{\relax}
\def\@@skip@bstr@ctp@ges{%
  \if@twoside
   \ifodd\c@page\else
    \vbox{\vbox to \vsize{}}
    \clearpage\fi
   \else
  \fi
  \afterpage{\skip@bstr@ctp@ges}
}
\newenvironment{abstractenv}{
   \def\skip@bstr@ctp@ges{\@@skip@bstr@ctp@ges}
   \afterpage{\skip@bstr@ctp@ges \thispagestyle{empty}}
   \pagestyle{empty}
}

% Redefine above commands if etd option is specified.  The blank pages make printing nice,
% but they don't want them in the submitted PDF
\DeclareOption{etd}{
    \renewcommand{\clearemptydoublepage}{ \clearpage }
    \renewenvironment{abstractenv}{\afterpage{\thispagestyle{empty}}\pagestyle{empty}}{} 
  }

% ------------------------ Load the class and needed packages ---------------------------------

% Load the book class  
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} 
\ProcessOptions\relax 
\LoadClass[a4paper,12pt]{book}
%\LoadClass[letterpaper,12pt]{book}
% The afterpage package is required to make single sided formal pages 
% in a double sided environment
\RequirePackage{afterpage}

% Note: the hyperref package is required to make an appropriate ETD.
% However, we don't require it here since it is supposed to be the last
% package loaded and students may want to load other packages in the 
% main tex file.  So that this class file doesn't crash if the student
% forgets to load hyperref, we have used the following commands below:
%
%   \providecommand\phantomsection{}
%   \providecommand\pdfbookmark[3][]{}
%
% These commands provide dummy versions of the macros, but won't
% bother the real versions if the hyperref package is loaded in the 
% tex file.


% ---------------------------- main code ----------------------------

% Set the margins to iitkgp specifications for the single sided preliminary
% pages.  At the end of the \makepreliminarypages command we fix the margins
% to be appropriate alternating values for double sided printing (if selected).
% If the \makepreliminarypages macro is not run, this never gets fixed. 
  \setlength{\marginparwidth}{0pt}
  \setlength{\marginparsep}{0pt}
  \setlength{\oddsidemargin}{0.5in}
  \setlength{\evensidemargin}{0in}
  \setlength{\textwidth}{6in}
  \setlength{\topmargin}{0in}
  \setlength{\headheight}{0.125in}
  \setlength{\headsep}{0.25in}
  \setlength{\textheight}{8.625in}
  \setlength{\footskip}{0.25in}
  \raggedbottom

% Redefine the Table of Contents to deal with some blank page 
% and bookmarking issues relating to ETD submission
\let\TEMPtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
  \clearemptydoublepage
  \providecommand\phantomsection{} \phantomsection
  \addcontentsline{toc}{chapter}{Table of Contents}
  \TEMPtableofcontents
}
 
% Redefine the List of Figures to deal with some blank page 
% and bookmarking issues
\let\TEMPlistoffigures\listoffigures
\renewcommand{\listoffigures}{
  \providecommand\phantomsection{} \phantomsection
  \addcontentsline{toc}{chapter}{List of Figures}
  \TEMPlistoffigures
}

% Redefine the List of Tables to deal with some blank page 
% and bookmarking issues
\let\TEMPlistoftables\listoftables
\renewcommand{\listoftables}{
  \providecommand\phantomsection{} \phantomsection
  \addcontentsline{toc}{chapter}{List of Tables}
  \TEMPlistoftables
}

% Redefine the Bibliography to deal with a bookmarking issues
\let\TEMPbibliography\bibliography
\renewcommand{\bibliography}{
  \providecommand\phantomsection{} \phantomsection
  \addcontentsline{toc}{chapter}{Bibliography}
  \TEMPbibliography
}

%---------------------------- The Preliminary Page Definitions --------------------------
% ============================== Name Page =============================== 
 \newcommand{\namepage}{
    \thispagestyle{empty}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}    
    \vspace*{0.15in}
    \fontsize{16}{19}\selectfont
    \mbox{\uppercase{{\bf \@TitleTop}}}\\
    \vspace*{0.1in}
    \mbox{\uppercase{{\bf \@TitleBottom}}}\\
    \end{center}
    \begin{flushright}
    \fontsize{14}{17}\selectfont
    \vfill
    {\bf\em \@Author}
    \vspace*{0.3in}
    \end{flushright}
    \clearemptydoublepage
  }



% ============================== Title Page ===============================
\renewcommand{\titlepage}{
    \thispagestyle{empty}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}    
    \vspace*{0.15in}
    \fontsize{16}{18}\selectfont
    \mbox{\uppercase{{\bf \@TitleTop}}}\\
    \vspace*{0.12in}
    %[\baselineskip]
    \mbox{\uppercase{{\bf \@TitleBottom}}}\\
    \fontsize{12}{14}\selectfont
    \vfill
    {\em Thesis submitted to the}\\\vspace*{0.12in}
    {\em Indian Institute of Technology Kharagpur}\\\vspace*{0.12in}
    {\em for award of the degree}\\[\baselineskip]
    \em of\\[\baselineskip]
    %\vskip 0.667in
    {\bf \@degree} \\[\baselineskip]
    \vskip 0.4in
    \em by\\[\baselineskip]
    {\large {\bf \@Author}}\\[\baselineskip]
    {Under the guidance of }\\[\baselineskip]
    {\bf Prof. \@AdvisorA}\\
    %and\\
    %{\bf \@AdvisorB}
    \vfill
    \includegraphics[width=1in]{IITLOGO}\\[0.5cm]
    {\bf DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING}\\\vspace{0.1in}
    {\bf INDIAN INSTITUTE OF TECHNOLOGY KHARAGPUR}\\\vspace{0.09in}
    {\bf \@Month~\@Year} \\[\baselineskip]
    %\end{center}
   % \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Copyright}{bm:Copyright}    
    %\vspace*{\fill}
    %\begin{center}
    \normalsize\copyright\ \@Year~\@Author. All Rights Reserved\\
    \end{center}
    \clearemptydoublepage
  }



% ======================== Dedication page ==============================
\newcommand{\dedicationpage}{
    \thispagestyle{empty}
   % \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Copyright}{bm:Copyright}    
    \vspace*{5cm}
\begin{center}

 \@DedicatedTo\\



\end{center}
    
    \clearemptydoublepage
  }
% ======================== Copyright page ===============================
\newcommand{\copyrightpage}{
    \thispagestyle{empty}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Copyright}{bm:Copyright}    
    \vspace*{\fill}
    \begin{center}
    Copyright \copyright\ \@Year~\@Author\\[\baselineskip]
    All Rights Reserved\\[5\baselineskip]
    \end{center}
    \vspace{1in}
    \vfill
    \clearemptydoublepage
  }
  
  \newcommand{\datebox}{
    \parbox[t]{1.5in}{
        \ \\[2\baselineskip]
        Date: %\rule{1.5in}{0.4pt}\\
        
    }
} 

\newcommand{\signaturebox}[1]{
    \parbox[t]{3.6in}{
        \ \\[2\baselineskip]
     %\rule{1.8in}{0.4pt}\\
      #1
    }
}




% ======================= Certificate Page ============================
\newcommand{\certificatepage}{
     \thispagestyle{empty}%
     \begin{center}
     \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Certificate Page}{bm:Accept}    
     \vspace*{0.375in}
     \vspace*{0.1in}
     {\large \bf \underline {CERTIFICATE}}\\[3\baselineskip]
    %
     \end{center}%
       \renewcommand{\baselinestretch}{1.5} \small\normalsize\large%
       \fontsize{12}{14.5}\selectfont
     %
     {\noindent
This is to certify that the thesis entitled \textbf{\TitleFull}, submitted by \textbf{\@Author} to Indian Institute of Technology Kharagpur, is a record of bona fide research work under my supervision and I consider it worthy of consideration for the award of the degree of Doctor of Philosophy of the Institute.

% \vspace*{2cm}
\begin{flushright}

\vspace{-.5in}        
      \begin{flushright}
      \signaturebox{\begin{flushright}\@CertificateSignature\end{flushright}}\\%[\baselineskip]
      \vspace{-.5in}         
      \end{flushright}
      


\end{flushright}
\datebox    

% \vspace*{4cm}
% \noindent
% Date: 

 }




\clearemptydoublepage
  }


% ======================= Declaration Page ============================



\newcommand{\declarationpage}{
     \thispagestyle{empty}%
     %\begin{center}
     \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Declaration Page}{bm:Declare}    
     %\vspace*{0.1in}
     \begin{flushleft}
     {\large \bf DECLARATION}\\[2\baselineskip]
     \end{flushleft}
    %
    % \end{center}%
       \renewcommand{\baselinestretch}{1.1} \small\normalsize\large%
     %
     \fontsize{12}{14.5}\selectfont
     {\@AuthorDeclaration}
      \vspace{-.5in}
      \begin{flushright}
      \signaturebox{\begin{flushright} \line(150,0){150}\\\@Author\\ \@Dept \\ \@Insti\end{flushright}}\\%[\baselineskip]
      \vspace{-.5in}         
      \end{flushright}
      \datebox
\clearemptydoublepage
  }


% ========================= Approval of Viva-Voce =====================
\newcommand{\approvalpage}{
     \thispagestyle{empty}%
     \begin{center}
     \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Approval Page}{bm:Approve}    
    \vspace*{0.4in}
    % \begin{flushleft}
     {\large \bf APPROVAL OF THE VIVA-VOCE BOARD}\\[2\baselineskip]
     %\end{flushleft}
    %
     \end{center}%
       \renewcommand{\baselinestretch}{1.1} \small\normalsize\large%
       \begin{flushright}
       {
       $/\ \ \ \ /\ \ \ \ $\\        
       }
       \end{flushright}
     %
     \fontsize{12}{14.5}\selectfont
     {\noindent Certified that the thesis entitled \textbf{\TitleFull}, submitted by \textbf{\@Author} to the Indian Institute of Technology Kharagpur, for the award of the degree of Doctor of Philosophy has been accepted by the external examiners and that the student has successfully defended the thesis in the viva-voce examination held today.
      }
      %\vspace{-.5in}
     % \begin{flushright}
      %\signaturebox
%       \vspace{0.5 in}
      {   %
		\@ApprovalSignatures
      }   %[\baselineskip]
      \vspace{-.5in}
     
\clearemptydoublepage
  }
% ========================= Abstract ===================================

\newcommand{\abstractpage}{
  \renewcommand{\baselinestretch}{1}\small\normalsize
  \thispagestyle{empty}
  \begin{abstractenv}
  \begin{center}
  \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}    
%    \vspace*{0.2in}
  {\Large \bf Abstract}\\[2\baselineskip]
  \end{center}   
  \renewcommand{\baselinestretch}{1.1} \small\normalsize%
  \parskip 8pt
  \@Abstract
  \end{abstractenv}
  \clearemptydoublepage
 }

% ========================= Acknowledgments ==============================
\newcommand{\acknowledgmentspage}{
    \renewcommand{\baselinestretch}{1}\small\normalsize
    \thispagestyle{empty}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{\bf Acknowledgments}{bm:Acknowledge}    
    %\vspace*{0.375in}
    {\Large \bf Acknowledgements}\\[2\baselineskip]
    \end{center}
    
    \renewcommand{\baselinestretch}{1.1} \small\normalsize%
    \parskip 8pt
    \@Acknowledgments  
    \clearemptydoublepage
  }


