#' download_uploaded_dataset
#'
#' \code{download_uploaded_dataset} downloads a dataset that the user has themselves uploaded.
#'
#' This function allows the user to download a dataset by specifying its number in the dataframe of available datsets.
#'
#' @param DatasetNumber An integer.
#'
#' @return Returns a dataframe.
#'
#' @examples
#' download_uploaded_dataset (2)
#' download_uploaded_dataset (DatasetNumber = 3)
download_uploaded_dataset <- function(DatasetNumber) {
  download_dataset (DatasetNumber=DatasetNumber, Endpoint="/user/getDatasets")
}



#' download_purchased_dataset
#'
#' \code{download_purchased_dataset} downloads a dataset that the user has themselves uploaded.
#'
#' This function allows the user to download a dataset by specifying its number in the dataframe of available datsets.
#'
#' @param DatasetNumber An integer.
#'
#' @return Returns a dataframe.
#'
#' @examples
#' download_purchased_dataset (2)
#' download_purchased_dataset (DatasetNumber = 3)
download_purchased_dataset <- function(DatasetNumber) {
  download_dataset (DatasetNumber=DatasetNumber, Endpoint="/user/getUploadedDatasets")
}



download_dataset <- function(DatasetNumber, Endpoint) {
  myDatasetID <- get_datasetID(DatasetNumber=DatasetNumber, Endpoint=Endpoint)
  myJsonObject <- make_post_request(Endpoint = "/user/downloadFile",
                                    Body = paste0("\"dataSetId\":\"", myDatasetID, "\""))
  extract_dataframe_from_json(myJsonObject)
}

