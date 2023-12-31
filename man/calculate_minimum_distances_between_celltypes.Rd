% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_minimum_distances_between_celltypes.R
\name{calculate_minimum_distances_between_celltypes}
\alias{calculate_minimum_distances_between_celltypes}
\title{calculate_minimum_distances_between_celltypes}
\usage{
calculate_minimum_distances_between_celltypes(
  spe_object,
  feature_colname,
  cell_types_of_interest = NULL
)
}
\arguments{
\item{spe_object}{SpatialExperiment object in the form of the output of
\code{\link{format_image_to_spe}}.}

\item{feature_colname}{String of the feature column of cells to choose the
cell types from (e.g. Cell.Type, Cell.Type2, etc).}

\item{cell_types_of_interest}{String Vector of marker combinations to
consider is FALSE.}
}
\value{
A data.frame is returned
}
\description{
Returns the distance of the closest cell of a specific type from
  each reference cell.
}
\examples{
min_dists <- calculate_minimum_distances_between_celltypes(
SPIAT::defined_image, feature_colname = "Cell.Type", 
cell_types_of_interest = c("Tumour","Immune1"))
}
