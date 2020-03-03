#' download_dataset
#'
#' \code{download_dataset} downloads a dataset.
#'
#' This function allows the user to download a dataset by specifying its DatasetID
#'  
#' @param DatasetID A string
#'
#' @return Returns a list
#'
#' @examples
#' df <- download_dataset ("SPPeJC1VInG5VMXN8M6D")
#' 
#' @export
download_dataset <- function(DatasetID) {
  myDataObject <- download_data_object(DatasetID)
  
  myDataframe <- as.data.frame(myDataObject$data, stringsAsFactors = FALSE, row.names = FALSE)
  colnames(myDataframe) <- myDataObject$header$name
  df <- transform_dataframe_columns_to_numeric(myDataframe)
  
  myList <- list("df"=df, "names"=myDataObject$header$name, "description"=myDataObject$header$description, "datasetId"=DatasetID)
}

