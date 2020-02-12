#' download_dataset
#'
#' \code{download_dataset} downloads a dataset.
#'
#' This function allows the user to download a dataset by specifying its DatasetID
#'  
#' @param DatasetID A string
#'
#' @return Returns a dataframe.
#'
#' @examples
#' df <- download_dataset ("SPPeJC1VInG5VMXN8M6D")
#' 
#' @export
download_dataset <- function(DatasetID) {
  myJsonObject <- make_post_request(Endpoint = "/user/downloadFile",
                                    Body = paste0('"dataSetId": "', DatasetID, '"'))
  extract_dataframe_from_json(myJsonObject)
}

