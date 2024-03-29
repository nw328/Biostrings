\name{DNAString-class}
\docType{class}

% Classes
\alias{class:DNAString}
\alias{DNAString-class}

% Constants:
\alias{DNA_BASES}
\alias{DNA_ALPHABET}

% Constructor-like functions and generics:
\alias{DNAString}


\title{DNAString objects}

\description{
  A DNAString object allows efficient storage
  and manipulation of a long DNA sequence.
}

\details{
  The DNAString class is a direct \link{XString} subclass
  (with no additional slot).
  Therefore all functions and methods described in the
  \link{XString} man page also work
  with a DNAString object (inheritance).

  Unlike the \link{BString} container that allows storage
  of any single string (based on a single-byte character set)
  the DNAString container can only store a string
  based on the DNA alphabet (see below).
  In addition, the letters stored in a DNAString object
  are encoded in a way that optimizes fast search algorithms.
}

\section{The DNA alphabet}{
  This alphabet contains all letters from the
  IUPAC Extended Genetic Alphabet (see \code{?\link{IUPAC_CODE_MAP}})
  plus \code{"-"} (the \emph{gap} letter), \code{"+"} (the \emph{hard
  masking} letter), and \code{"."} (the \emph{not a letter} or \emph{not
  available} letter).
  It is stored in the \code{DNA_ALPHABET} predefined constant (character
  vector).

  The \code{alphabet()} function returns \code{DNA_ALPHABET} when
  applied to a DNAString object.
}

\section{Constructor-like functions and generics}{
  In the code snippet below,
  \code{x} can be a single string (character vector of length 1),
  a \link{BString} object or an \link{RNAString} object.

  \describe{
    \item{}{
      \code{DNAString(x="", start=1, nchar=NA)}:
      Tries to convert \code{x} into a DNAString object by reading
      \code{nchar} letters starting at position \code{start} in \code{x}.
    }
  }
}

\section{Accessor methods}{
  In the code snippet below, \code{x} is a DNAString object.

  \describe{
    \item{}{
      \code{alphabet(x, baseOnly=FALSE)}:
      If \code{x} is a DNAString object, then return the DNA
      alphabet (see above).
      See the corresponding man pages when \code{x} is a
      \link{BString}, \link{RNAString} or \link{AAString} object.
    }
  }
}

\author{H. Pages}

\seealso{
  \code{\link{IUPAC_CODE_MAP}},
  \code{\link{letter}},
  \link{XString-class},
  \link{RNAString-class},
  \code{\link{reverseComplement}},
  \code{\link{alphabetFrequency}}
}

\examples{
  DNA_BASES
  DNA_ALPHABET
  d <- DNAString("TTGAAAA-CTC-N")
  length(d)
  alphabet(d)                 # DNA_ALPHABET
  alphabet(d, baseOnly=TRUE)  # DNA_BASES
}

\keyword{methods}
\keyword{classes}
