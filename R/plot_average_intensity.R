#' plot_average_intensity
#'
#' @description Takes in a vector or radii and calculates the average intensity
#' of a target marker using average_intensity function. It plots the intensity
#' level as a line graph
#'
#' @param sce_object SingleCellExperiment object in the form of the output of format_image_to_sce
#' @param reference_marker String specifying the reference marker
#' @param target_marker String specifying the marker to calculate its average intensity
#' @param radii Vector of integers specifying the search radius around reference cells
#' @import ggplot2
#' @return A plot is returned
#' @examples
#' plot_average_intensity(SPIAT::formatted_image, reference_marker="CD8", target_marker="CD4", c(30, 35, 40, 45, 50, 75, 100))
#' @export

plot_average_intensity <- function(sce_object, reference_marker, target_marker, radii) {

    average_intensity_result <- vector()

    for (radius in radii) {
        result <- average_marker_intensity_within_radius(sce_object, reference_marker, target_marker, radius = radius)
        #check
        if(!is.numeric(result)) {
            stop(paste("Cannot calculate average intensity for radius = ", radius, sep = ""))
        }
        average_intensity_result <- c(average_intensity_result, result)
    }

    average_intensity_df <- data.frame(radii, average_intensity_result)

    p <- ggplot(data=average_intensity_df, aes(x=radii, y=average_intensity_result))

    title <- paste("Average intensity of ", target_marker, " from ", reference_marker, " for various radii", sep="")
    p <- p + geom_line() + geom_point() + ggtitle(title) + xlab("Radius") + ylab("Average Intensity")
    p <- p + theme_bw()
    p
}