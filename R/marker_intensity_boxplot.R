#' marker_intensity_boxplot
#'
#' @description Produces boxplots of marker levels for cells phenotyped as being positive
#' for the marker, and those that where phenotyped as being negative.
#' @param sce_object SingleCellExperiment object in the form of the output of format_image_to_sce
#' @param marker Marker being queried
#' @importFrom SummarizedExperiment colData assay
#' @import dplyr
#' @importFrom tibble rownames_to_column
#' @importFrom stats complete.cases
#' @import ggplot2
#' @return A plot is returned
#' @examples
#' marker_intensity_boxplot(SPIAT::formatted_image, "CD3")
#' @export

marker_intensity_boxplot <- function(sce_object, marker){
    
    
    # setting these variables to NULL as otherwise get "no visible binding for global variable" in R check
    intensity <- NULL

    formatted_data <- data.frame(colData(sce_object))

    formatted_data <- formatted_data %>% rownames_to_column("Cell.ID") #convert rowname to column

    intensity_matrix <- assay(sce_object)
    
    markers <- rownames(intensity_matrix)

    cell_ids <- colnames(intensity_matrix)

    rownames(intensity_matrix) <- NULL
    colnames(intensity_matrix) <- NULL
    intensity_matrix_t <- t(intensity_matrix)
    intensity_df <- data.frame(intensity_matrix_t)
    colnames(intensity_df) <- markers

    formatted_data <- cbind(formatted_data, intensity_df)
    formatted_data <- formatted_data[complete.cases(formatted_data),]

    #selecting cells that do express the marker
    intensity_true <- formatted_data[grepl(marker, formatted_data$Phenotype), ]

    #selecting cells that do not contain the marker
    intensity_false <- formatted_data[!grepl(marker, formatted_data$Phenotype), ] #for multiple entries that does not contain marker

    #select the specific marker and add a boolean of intensity
    if (nrow(intensity_true) != 0) {
        intensity_true$intensity <- "P"
    } else{
        stop(paste("There are no cells positive for ", marker, sep=""))
    }

    if (nrow(intensity_false) != 0){
        intensity_false$intensity <- "N"
    } else{
        stop(paste("There are no cells negative for ", marker, sep=""))
    }

    #bind the 2 dataframes together
    intensity_by_marker <- rbind(intensity_true, intensity_false)
    intensity_by_marker$intensity <- factor(intensity_by_marker$intensity, levels=c("P", "N"))
    
    #plot boxplot
    title <- paste("Level of ", marker, sep="")

    #code from ggplot2 to show the number in each group
    give.n <- function(x){
        return(c(y = max(x)+1, label = length(x)))
    }

    p <- ggplot(intensity_by_marker, aes(x = intensity, y = intensity_by_marker[, marker]))
    p <- p + geom_boxplot()
    p <- p + labs(title = title, x = "Marker status (Positive/Negative cell)", y = "Marker level")
    p <- p + stat_summary(fun.data = give.n, geom = "text")
    p <- p + theme_bw()

    print(p)
}