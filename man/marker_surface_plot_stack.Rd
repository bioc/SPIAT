% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/marker_surface_plot_stack.R
\name{marker_surface_plot_stack}
\alias{marker_surface_plot_stack}
\title{marker_surface_plot_stack}
\usage{
marker_surface_plot_stack(
  spe_object,
  num_splits,
  markers_to_plot,
  sep = 1,
  x_position_min = NULL,
  x_position_max = NULL,
  y_position_min = NULL,
  y_position_max = NULL
)
}
\arguments{
\item{spe_object}{SpatialExperiment object in the form of the output of
\code{\link{format_image_to_spe}}.}

\item{num_splits}{Integer specifying the number of splits on the image,
higher splits equal to higher resolution. Recommendation: 10-100.}

\item{markers_to_plot}{Vector of marker names for plotting.}

\item{sep}{Integer specifying the distance separation between each surface
plot. We recommend values in the 1-2 range.}

\item{x_position_min}{Integer specifying the minimum x boundary to be
splitted.}

\item{x_position_max}{Integer specifying the maximum x boundary to be
splitted.}

\item{y_position_min}{Integer specifying the minimum y boundary to be
splitted.}

\item{y_position_max}{Integer specifying the maximum y boundary to be
splitted.}
}
\value{
A plot is returned
}
\description{
Generates stacked 3D surface plots showing normalized intensity
  level of specified markers.
}
\examples{
marker_surface_plot_stack(SPIAT::simulated_image, num_splits=15, 
markers=c("Tumour_marker", "Immune_marker4"))
}
