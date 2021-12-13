#' calculate_distance_to_tumour_margin
#'
#' @description Returns the sce_object with the minimum distance from immune cells to the identified tumour bordering cells
#'
#' @param sce_object SingleCellExperiment object in the form of the output of format_image_to_sce
#' @importFrom SingleCellExperiment colData
#' @importFrom tibble rownames_to_column
#' @importFrom stats complete.cases
#' @return An sce_object is returned
#' @export

calculate_distance_to_tumour_margin <- function(sce_object){
  
  #CHECK if the user has found the bordering cells yet
  if (is.null(sce_object$Region)){
    stop("Please find the bordering cells first! (use identify_bordering_cells)")
  }
  
  #Reads the image file and deletes cell rows with NA positions
  dat <- data.frame(colData(sce_object))
  dat <- dat[complete.cases(dat),]
  dat<- dat %>% rownames_to_column("Cell.ID") #convert rowname to column
  
  #CHECK
  if (nrow(dat) == 0) {
    stop("There are no cells")
  }
  
  dat <- dat[, c("Cell.ID","Region", "Cell.X.Position", "Cell.Y.Position")]
  dat <- dat[dat$Region != "",]
  
  sce_object <- define_celltypes(sce_object, categories = c("Outside","Inside","Border"),
                                 category_colname ="Region", names = c("Non-border","Non-border","Border"), 
                                 new_colname = "region2")
  
  dist_matrix <- calculate_minimum_distances(sce_object, cell_types_of_interest = c("Non-border","Border"), 
                                             feature_colname ="region2")
  dist_matrix[dist_matrix$RefType == "Border", "Dist"] <- 0
  dist_matrix$Order <- as.numeric(substr(dist_matrix$RefCell, start = 6, stop = 30))
  dist_matrix <- dist_matrix[order(dist_matrix$Order),]
  dat <- merge(dat, dist_matrix,by.x = "Cell.ID",by.y = "RefCell", all.x = TRUE, sort = FALSE)
  colData(sce_object)$Distance.To.Border <- dat$Dist
  
  return(sce_object)
}