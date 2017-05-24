\name{top_rows_overlap-list-method}
\alias{top_rows_overlap,list-method}
\title{
Overlap of top rows from different top methods
}
\description{
Overlap of top rows from different top methods
}
\usage{
\S4method{top_rows_overlap}{list}(object, top_n = round(0.25*length(object[[1]])),
    type = c("venn", "correspondance"))
}
\arguments{

  \item{object}{a list which contains rankings from different metrics.}
  \item{top_n}{number of top rows}
  \item{type}{\code{venn}: use venn euler plots; \code{correspondance}: use \code{\link{correspond_between_rankings}}.}

}
\examples{
require(matrixStats)
mat = matrix(rnorm(1000), nrow = 100)
lt = list(sd = rowSds(mat), mad = rowMads(mat))
top_rows_overlap(lt, top_n = 25)
}