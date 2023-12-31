% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_spe_to_ppp.R
\name{format_spe_to_ppp}
\alias{format_spe_to_ppp}
\title{Format SPE object as a ppp object (`spatstat` package)}
\usage{
format_spe_to_ppp(
  spe_object,
  window_pol = FALSE,
  feature_colname = "Phenotype"
)
}
\arguments{
\item{spe_object}{SpatialExperiment object in the form of the output of
format_image_to_spe.}

\item{window_pol}{Optional Boolean Specifying if the window is polygon.}

\item{feature_colname}{String specifying the feature column of interest.}
}
\value{
A ppp object is returned (defined in `spatstat` package)
}
\description{
Formats an spe object into a ppp object which has the x,y
  coordinates, phenotypes as markers window specifies the range of x and y
  coordinates
}
\examples{
ppp_object<-format_spe_to_ppp(SPIAT::defined_image, 
feature_colname = "Cell.Type")
}
