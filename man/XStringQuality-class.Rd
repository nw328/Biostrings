\name{XStringQuality-class}
\docType{class}

% Classes:
\alias{class:XStringQuality}
\alias{XStringQuality-class}
\alias{XStringQuality}

\alias{class:PhredQuality}
\alias{PhredQuality-class}
\alias{PhredQuality}
\alias{class:SolexaQuality}
\alias{SolexaQuality-class}
\alias{SolexaQuality}
\alias{class:IlluminaQuality}
\alias{IlluminaQuality-class}
\alias{IlluminaQuality}

% Coercion:
\alias{coerce,character,PhredQuality-method}
\alias{coerce,BString,PhredQuality-method}
\alias{coerce,BStringSet,PhredQuality-method}
\alias{coerce,integer,PhredQuality-method}
\alias{coerce,numeric,PhredQuality-method}
\alias{coerce,PhredQuality,integer-method}
\alias{as.integer,PhredQuality-method}
\alias{coerce,PhredQuality,numeric-method}
\alias{as.numeric,PhredQuality-method}

\alias{coerce,character,SolexaQuality-method}
\alias{coerce,BString,SolexaQuality-method}
\alias{coerce,BStringSet,SolexaQuality-method}
\alias{coerce,integer,SolexaQuality-method}
\alias{coerce,numeric,SolexaQuality-method}
\alias{coerce,SolexaQuality,integer-method}
\alias{as.integer,SolexaQuality-method}
\alias{coerce,SolexaQuality,numeric-method}
\alias{as.numeric,SolexaQuality-method}

\alias{coerce,character,IlluminaQuality-method}
\alias{coerce,BString,IlluminaQuality-method}
\alias{coerce,BStringSet,IlluminaQuality-method}
\alias{coerce,integer,IlluminaQuality-method}
\alias{coerce,numeric,IlluminaQuality-method}
\alias{coerce,IlluminaQuality,integer-method}
\alias{as.integer,IlluminaQuality-method}
\alias{coerce,IlluminaQuality,numeric-method}
\alias{as.numeric,IlluminaQuality-method}

\alias{as.matrix,XStringQuality-method}
\alias{coerce,XStringQuality,matrix-method}

%% alphabet & encoding
\alias{alphabet,XStringQuality-method}
\alias{encoding}
\alias{encoding,XStringQuality-method}

\title{PhredQuality, SolexaQuality and IlluminaQuality objects}

\description{
  Objects for storing string quality measures.
}

\usage{
## Constructors:
PhredQuality(x)
SolexaQuality(x)
IlluminaQuality(x)

## alphabet and encoding
\S4method{alphabet}{XStringQuality}(x)
\S4method{encoding}{XStringQuality}(x)
}

\arguments{
  \item{x}{
    Either a character vector, \link{BString}, \link{BStringSet},
    integer vector, or number vector of error probabilities.
  }
}

\details{

  \code{PhredQuality} objects store characters that are interpreted as
  [0 - 99] quality measures by subtracting 33 from their ASCII decimal
  representation (e.g. ! = 0, " = 1, \# = 2, ...). Quality measures q
  encode probabilities as \code{-10 * log10(p)}.

  \code{SolexaQuality} objects store characters that are interpreted as
  [-5 - 99] quality measures by subtracting 64 from their ASCII decimal
  representation (e.g. ; = -5, < = -4, = = -3, ...). Quality measures q
  encode probabilities as \code{-10 * (log10(p) - log10(1 - p))}.

  \code{IlluminaQuality} objects store characters that are interpreted
  as [0 - 99] quality measures by subtracting 64 from their ASCII
  decimal representation (e.g. @ = 0, A = 1, B = 2, ...). Quality
  measures q encode probabilities as \code{-10 * log10(p)}

}

\section{Alphabet and encoding}{

  In the code snippets below, \code{x} is an XStringQuality object.

  \describe{
    \item{}{
      \code{alphabet(x)}: Valid letters in this quality score; not all
      letters are encountered in actual sequencing runs.
    }

    \item{}{
      \code{encoding(x)}: Map between letters and their corresponding
      integer encoding. Use \code{as.integer} and \code{as.numeric} to
      coerce objects to their integer and probability representations.
    }

  }
}

\author{P. Aboyoun}

\seealso{
  \code{\link{pairwiseAlignment}},
  \link{PairwiseAlignments-class},
  \link{DNAString-class},
  \link{BStringSet-class}
}

\examples{
  PhredQuality(0:40)
  SolexaQuality(0:40)
  IlluminaQuality(0:40)

  PhredQuality(seq(1e-4,0.5,length=10))
  SolexaQuality(seq(1e-4,0.5,length=10))
  IlluminaQuality(seq(1e-4,0.5,length=10))

  x <- SolexaQuality(BStringSet(c(a="@ABC", b="abcd")))
  as.matrix(x)
}

\keyword{methods}
\keyword{classes}
