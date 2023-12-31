% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_cell_categories.R
\name{plot_cell_categories}
\alias{plot_cell_categories}
\title{plot_cell_categories}
\usage{
plot_cell_categories(
  spe_object,
  categories_of_interest = NULL,
  colour_vector = NULL,
  feature_colname = "Cell.Type",
  cex = 1,
  layered = FALSE
)
}
\arguments{
\item{spe_object}{SpatialExperiment object in the form of the output of
\code{\link{format_image_to_spe}}.}

\item{categories_of_interest}{Vector of cell categories to be coloured.}

\item{colour_vector}{Vector specifying the colours of each cell phenotype.}

\item{feature_colname}{String specifying the column the cell categories
belong to.}

\item{cex}{Numeric. The size of the plot points. Default is 1.}

\item{layered}{Boolean. Whether to plot the cells layer by layer (cell
categories). By default is FALSE.}
}
\value{
A plot is returned
}
\description{
Produces a scatter plot of the cells of their x-y positions in
  the tissue. Cells are coloured categorically by phenotype. Cells not part
  of the phenotypes of interest will be coloured "lightgrey".
}
\examples{
categories_of_interest <- c("Tumour", "Immune1","Immune2","Immune3")
colour_vector <- c("red","darkblue","blue","darkgreen")
plot_cell_categories(SPIAT::defined_image, categories_of_interest, colour_vector,
feature_colname = "Cell.Type")
}
