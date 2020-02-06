#' purchase_dataset
#'
#' \code{purchase_dataset} purchases and downloads a dataset from the hut.
#'
#' This function allows the user to purchase a dataset by specifying its number in the dataframe of available datsets.
#'   If Download is TRUE then the dataset is instantly downloaded. If FALSE then it can be downloaded at a later time.
#'
#' @param DatasetNumber An integer.
#' @param Download A Boolean
#'
#' @return If Download is TRUE then returns a dataframe.
#'
#' @examples
#' purchase_dataset (2)
#' purchase_dataset (DatasetNumber = 3, Download = TRUE)
purchase_dataset <- function(DatasetNumber, Download = FALSE) {
  myDatasetID <- get_datasetID(DatasetNumber = DatasetNumber, Endpoint = "/user/getDatasets")
  make_post_request(Endpoint = "/user/purchase", Body = paste0("\"dataSetId\":\"", myDatasetID, "\""))
  if (Download == TRUE) {
    myJsonObject <- make_post_request(Endpoint = "/user/downloadFile", Body = paste0("\"dataSetId\":\"", myDatasetID, "\""))
    extract_dataframe_from_json(myJsonObject)
  }
}
