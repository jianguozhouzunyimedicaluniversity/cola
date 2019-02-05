\name{test_to_known_factors-ConsensusPartition-method}
\alias{test_to_known_factors,ConsensusPartition-method}
\title{
Test correspondance between predicted and known classes
}
\description{
Test correspondance between predicted and known classes
}
\usage{
\S4method{test_to_known_factors}{ConsensusPartition}(object, k, known = get_anno(object),
    silhouette_cutoff = 0.5, verbose = TRUE)
}
\arguments{

  \item{object}{a \code{\link{ConsensusPartition-class}} object.}
  \item{k}{number of partitions. It uses all \code{k} if it is not set.}
  \item{known}{a vector or a data frame with known factors.}
  \item{silhouette_cutoff}{cutoff for sihouette scores. Samples with value less than this are omit.}
  \item{verbose}{whether to print messages.}

}
\value{
A data frame with columns:

\itemize{
  \item number of samples used to test after filtering by \code{silhouette_cutoff}
  \item p-values from the tests
  \item number of partitions
}
}
\seealso{
\code{\link{test_between_factors}}
}
\author{
Zuguang Gu <z.gu@dkfz.de>
}
\examples{
data(cola_rl)
test_to_known_factors(cola_rl[1, 1], known = 1:40)
}
