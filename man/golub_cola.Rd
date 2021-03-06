\name{golub_cola}
\docType{data}
\alias{golub_cola}
\title{
Example ConsensusPartitionList object from Golub dataset
}
\description{
Example ConsensusPartitionList object from Golub dataset
}
\usage{
data(golub_cola)
}
\details{
Following code was used to generate \code{golub_cola}:

  \preformatted{
    library(cola)

    library(golubEsets)  # from bioc
    data(Golub_Merge)
    m = exprs(Golub_Merge)
    colnames(m) = paste0("sample_", colnames(m))
    anno = pData(Golub_Merge)

    m[m <= 1] = NA
    m = log10(m)

    m = adjust_matrix(m)

    library(preprocessCore)  # from bioc
    cn = colnames(m)
    rn = rownames(m)
    m = normalize.quantiles(m)
    colnames(m) = cn
    rownames(m) = rn

    set.seed(123)
    golub_cola = run_all_consensus_partition_methods(
        m, mc.cores = 2, 
        anno = anno[, c("ALL.AML"), drop = FALSE],
        anno_col = c("ALL" = "red", "AML" = "blue")
    )  }
}
\seealso{
\url{https://jokergoo.github.io/cola_examples/Golub_leukemia/}
}
\author{
Zuguang Gu <z.gu@dkfz.de>
}
\examples{
data(golub_cola)
golub_cola
}
