#' download_dataset
#'
#' \code{download_dataset} downloads a dataset.
#'
#' This function allows the user to download a dataset by specifying its number in the dataframe of available datsets.
#'  User must also specify the endpoint.
#'  
#' @param DatasetNumber An integer.
#' @param Endpoint A string
#'
#' @return Returns a dataframe.
#'
#' @examples
#' download_dataset (2, "/user/getDatasets")
#' download_dataset (DatasetNumber = 3, Endpoint = "/user/getDatasets")
#' 
#' @export
download_dataset <- function(DatasetNumber, Endpoint) {
  myDatasetID <- get_datasetID(DatasetNumber=DatasetNumber, Endpoint=Endpoint)
  myJsonObject <- make_post_request(Endpoint = "/user/downloadFile",
                                    Body = paste0("\"dataSetId\":\"", myDatasetID, "\""))
  extract_dataframe_from_json(myJsonObject)
}

