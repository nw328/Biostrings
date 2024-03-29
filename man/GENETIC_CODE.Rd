\name{GENETIC_CODE}

\alias{GENETIC_CODE}
\alias{RNA_GENETIC_CODE}
\alias{GENETIC_CODE_TABLE}
\alias{getGeneticCode}

\title{The Standard Genetic Code and its known variants}

\description{
  Two predefined objects (\code{GENETIC_CODE} and \code{RNA_GENETIC_CODE})
  that represent The Standard Genetic Code.

  Other genetic codes are stored in predefined table \code{GENETIC_CODE_TABLE}
  from which they can conveniently be extracted with \code{getGeneticCode}.
}

\usage{
## The Standard Genetic Code:
GENETIC_CODE
RNA_GENETIC_CODE

## All the known genetic codes:
GENETIC_CODE_TABLE
getGeneticCode(id_or_name2, full.search=FALSE)
}

\arguments{
  \item{id_or_name2}{
    A single string that uniquely identifies the genetic code to extract.
    Should be one of the values in the \code{id} or \code{name2} columns
    of \code{GENETIC_CODE_TABLE}.
  }
  \item{full.search}{
    By default, only the \code{id} and \code{name2} columns of
    \code{GENETIC_CODE_TABLE} are searched for an exact match
    with \code{id_or_name2}.
    If \code{full.search} is TRUE, then the search is extended to
    the \code{name} column of \code{GENETIC_CODE_TABLE} and
    \code{id_or_name2} only needs to be a substring of one of the names
    in that column (also case is ignored).
  }
}

\details{
  Formally, a genetic code is a mapping between tri-nucleotide sequences
  called codons, and amino acids.

  The Standard Genetic Code (aka The Canonical Genetic Code, or simply The
  Genetic Code) is the particular mapping that encodes the vast majority of
  genes in nature.

  \code{GENETIC_CODE} and \code{RNA_GENETIC_CODE} are predefined named
  character vectors that represent this mapping.

  All the known genetic codes are summarized in \code{GENETIC_CODE_TABLE},
  which is a predefined data frame with 1 row per known genetic code.
  Use \code{getGeneticCode} to extract one genetic code at a time from
  this object.
}

\value{
  \code{GENETIC_CODE} and \code{RNA_GENETIC_CODE} are both named character
  vectors of length 64 (the number of all possible tri-nucleotide sequences)
  where each element is a single letter representing either an amino acid
  or the stop codon \code{"*"} (aka termination codon).

  The names of the \code{GENETIC_CODE} vector are the DNA codons i.e. the
  tri-nucleotide sequences (directed 5' to 3') that are assumed to belong
  to the "coding DNA strand" (aka "sense DNA strand" or "non-template DNA
  strand") of the gene.
 
  The names of the \code{RNA_GENETIC_CODE} are the RNA codons i.e. the
  tri-nucleotide sequences (directed 5' to 3') that are assumed to belong
  to the mRNA of the gene.

  Note that the values in the \code{GENETIC_CODE} and \code{RNA_GENETIC_CODE}
  vectors are the same, only their names are different. The names of the
  latter are those of the former where all occurrences of T (thymine) have
  been replaced by U (uracil).

  \code{GENETIC_CODE_TABLE} is a data frame with 1 row per known genetic code
  and the 4 following columns:
  \itemize{
    \item \code{name}: The long and very descriptive name of the genetic code.
    \item \code{name2}: The short name of the genetic code (not all genetic
          codes have one).
    \item \code{id}: The id of the genetic code.
    \item \code{AAs}: The genetic code itself represented in a compact form
          (i.e. 64 amino acid letters, 1 letter per codon, the codons are
          assumed to be ordered like in \code{GENETIC_CODE}).
  }

  \code{getGeneticCode} returns a named character vector of length 64
  similar to \code{GENETIC_CODE} i.e. it contains 1-letter strings
  in the Amino Acid alphabet (see \code{?AA_ALPHABET}) and its names are
  identical to \code{names(GENETIC_CODE)}.
}

\author{H. Pages}

\references{
  All the known genetic codes are described here:

    \url{http://www.ncbi.nlm.nih.gov/Taxonomy/Utils/wprintgc.cgi}

  The "official names" of the various codes ("Standard", "SGC0",
  "Vertebrate Mitochondrial", "SGC1", etc..) and their ids (1, 2, etc...)
  were taken from the print-form ASN.1 version of the above document
  (version 3.9 at the time of this writting):

    \url{ftp://ftp.ncbi.nih.gov/entrez/misc/data/gc.prt}
}

\seealso{
  \itemize{
    \item \code{\link{AA_ALPHABET}} and \code{\link{AMINO_ACID_CODE}}.

    \item The \code{\link{translate}} and \code{\link{trinucleotideFrequency}}
          functions.

    \item \link{DNAString}, \link{RNAString}, and \link{AAString} objects.
  }
}

\examples{
## The Standard Genetic Code:

GENETIC_CODE

GENETIC_CODE[["ATG"]]  # codon ATG is translated into M (Methionine)

sort(table(GENETIC_CODE))  # the same amino acid can be encoded by 1
                           # to 6 different codons

RNA_GENETIC_CODE
all(GENETIC_CODE == RNA_GENETIC_CODE)  # TRUE

## All the known genetic codes:

GENETIC_CODE_TABLE[1:3 , ]

getGeneticCode("SGC0")  # The Standard Genetic Code, again
stopifnot(identical(getGeneticCode("SGC0"), GENETIC_CODE))

getGeneticCode("SGC1")  # Vertebrate Mitochondrial

getGeneticCode("ascidian", full.search=TRUE)  # Ascidian Mitochondrial

## Differences between a non-standard code and the Standard Code:
idx <- which(getGeneticCode("SGC1") != GENETIC_CODE)
rbind(SGC1=getGeneticCode("SGC1")[idx], Standard=GENETIC_CODE[idx])
}

\keyword{utilities}
\keyword{data}
