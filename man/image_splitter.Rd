% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/image_splitter.R
\name{image_splitter}
\alias{image_splitter}
\title{Split a large image into sub images}
\usage{
image_splitter(
  spe_object,
  number_of_splits,
  plot = FALSE,
  cut_labels = TRUE,
  colour_vector = NULL,
  minX = NULL,
  maxX = NULL,
  minY = NULL,
  maxY = NULL,
  feature_colname = "Phenotype"
)
}
\arguments{
\item{spe_object}{`SpatialExperiment` object in the form of the output of
\code{\link{format_image_to_spe}}.}

\item{number_of_splits}{Numeric. specifying the number of segments (e.g. 2 =
2x2, 3 = 3x3).}

\item{plot}{Boolean. Specifies whether the splitted images should be printed
in a pdf.}

\item{cut_labels}{Boolean. Specifies whether to plot where the image had been
segmented.}

\item{colour_vector}{String Vector. If specified, the colours will be used
for plotting. If NULL, colors will be generated automatically.}

\item{minX}{Integer used to specify the minimum x boundary to be
splitted.}

\item{maxX}{Integer used to specify the maximum x boundary to be
splitted.}

\item{minY}{Integer used to specify the minimum y boundary to be
splitted.}

\item{maxY}{Integer used to specify the maximum y boundary to be
splitted.}

\item{feature_colname}{String specifying which column the colouring should be
based on. Specify when `plot` is TRUE. Default is "Phenotype".}
}
\value{
A list of spe objects is returned. Each data frame represents an
  image without assay data.
}
\description{
Takes in an image in SpatialExperiment format, splits the image
  into specified sections and returns a list of SpatialExperiment objects.
  Users can choose to plot the cell positions in each sub image. Note that 
  this function does not split the assay.
}
\examples{
split_image <- image_splitter(SPIAT::simulated_image, number_of_splits=3, 
plot = FALSE)
}
