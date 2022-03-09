% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_gradient.R
\name{compute_gradient}
\alias{compute_gradient}
\title{compute_gradient}
\usage{
compute_gradient(sce_object, radii, FUN, ...)
}
\arguments{
\item{sce_object}{SingleCellExperiment object in the form of the output of format_image_to_sce}

\item{radii}{Vector specifying the range of radii for the metrics to be calculated}

\item{FUN}{Variable name specifying the metric}

\item{...}{Arguments of FUN}
}
\value{
A list of the metrics under all radii
}
\description{
Calculate the metrics for all of the specified radii
}