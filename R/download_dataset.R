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
#' myData <- download_dataset ("SPPeJC1VInG5VMXN8M6D")
#' 
#' @importFrom magrittr %>%
#' @importFrom jsonlite fromJSON
#' 
#' @export
#' 
download_dataset <- function(DatasetID) {
  myDataObject <- make_post_request(Endpoint = "/user/downloadFile", Body = paste0('"dataSetId": "', DatasetID, '"')) %>% 
    content(., "text") %>% 
    jsonlite::fromJSON()
  
  myDataframe <- as.data.frame(myDataObject$data, stringsAsFactors = FALSE, row.names = FALSE)
  colnames(myDataframe) <- myDataObject$header$name
  myDataframe <- transform_dataframe_columns_to_numeric(myDataframe)
  
  myMeta <- list("datasetId"=DatasetID,
                 "name"=myDataObject$header$name, 
                 "description"=myDataObject$header$description, 
                 "type"=myDataObject$header$type)
  
  myList <- list("df"=myDataframe, "meta"=myMeta)
}

