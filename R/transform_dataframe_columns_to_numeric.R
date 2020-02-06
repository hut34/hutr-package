#' transform_dataframe_columns_to_numeric
#'
#' \code{transform_dataframe_columns_to_numeric} transforms dataframe columns into numberic (rather than strings)
#'
#' This may not be needed any more but at one point all data retrieved from the hut was treated as a string.
#'   The function determines if all the data in a column is numeric, then sets the column to numeric.
#'  
#' @param Dataframe A dataframe
#'
#' @return Returns a dataframe
#'
#' @examples
#' transform_dataframe_columns_to_numeric (myDf)
#' 
#' @export
#' 
transform_dataframe_columns_to_numeric <- function(Dataframe) {
  myDF2 <- lapply(Dataframe, function(col) {
    if (suppressWarnings(all(!is.na(as.numeric(as.character(col)))))) {
      as.numeric(as.character(col))
    } else {
      col
    }
  })
  myDF2 <- as.data.frame(myDF2, stringsAsFactors = FALSE)
  myDF2
}