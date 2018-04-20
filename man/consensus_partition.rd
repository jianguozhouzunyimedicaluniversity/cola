\name{consensus_partition}
\alias{consensus_partition}
\title{
Consensus partition
}
\description{
Consensus partition
}
\usage{
consensus_partition(data,
    top_value_method = "MAD",
    top_n = seq(min(1000, round(nrow(data)*0.1)),
    min(5000, round(nrow(data)*0.5)),
    length.out = 5),
    partition_method = "kmeans",
    max_k = 6,
    p_sampling = 0.8,
    partition_repeat = 50,
    partition_param = list(),
    anno = NULL,
    anno_col = NULL,
    scale_rows = NULL,
    verbose = TRUE,
    .env = NULL)
}
\arguments{

  \item{data}{a numeric matrix where subgroups are found by columns.}
  \item{top_value_method}{a single top value method. Available methods are in \code{\link{all_top_value_methods}}. Use \code{\link{register_top_value_method}} to add a new top value method.}
  \item{top_n}{number of rows with top values. The value can be a vector with length > 1. When n > 5000, the function only randomly sample 5000 rows from top n rows.}
  \item{partition_method}{a single partition method. Available methods are in \code{\link{all_partition_methods}}. Use \code{\link{register_partition_method}} to add a new partition method.}
  \item{max_k}{maximum number of partitions to try. It starts from 2 partitions.}
  \item{p_sampling}{proportion of the top n rows to sample.}
  \item{partition_repeat}{number of repeats for the random sampling.}
  \item{partition_param}{parameters for the partition method which are passed to \code{...} in a registered partition method. See \code{\link{register_partition_method}} for detail.}
  \item{anno}{a data frame with known annotation of samples. The annotations will be plotted in heatmaps and the correlation to predicted subgroups will be tested.}
  \item{anno_col}{a list of colors (a named vector) for the annotations in \code{anno}. If not specified, random colors are used.}
  \item{scale_rows}{whether to scale rows. If it is \code{TRUE}, scaling method defined in \code{\link{register_partition_fun}} is used.}
  \item{verbose}{whether print messages.}
  \item{.env}{an environment, internally used.}

}
\details{
The function performs analysis in following procedures:

\itemize{
  \item calculate scores for rows by top value method,
  \item for each top_n value, take top n rows,
  \item randomly sample \code{p_sampling} rows from the top_n rows and perform partitioning for \code{partition_repeats} times,
  \item collect partitions from all resamplings and calculate consensus partitions.
}
}
\value{
A \code{\link{ConsensusPartition-class}} object. Simply type the name of the object in the R interactive session
to see which functions can be applied on it.
}
\seealso{
\code{\link{run_all_consensus_partition_methods}} runs consensus partition with multiple top value methods
and multiple partition methods. \code{\link{hierarchical_partition}} runs consensus partition hierarchically.
}
\author{
Zuguang Gu <z.gu@dkfz.de>
}
\examples{
m = cbind(
	matrix(rnorm(100*30, mean = 1), nr = 100),
	matrix(rnorm(100*30, mean = 0), nr = 100),
	matrix(rnorm(100*30, mean = -1), nr = 100)
) + matrix(rnorm(100*90, sd = 1), nr = 100) # add noise
res = consensus_partition(m, top_n = 100)
res
}
