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
#' 
#' @importFrom magrittr %>%
#' 
#' @export
download_purchased_dataset <- function(DatasetNumber) {
  get_datasetID (DatasetNumber=DatasetNumber, Endpoint="/user/getUploadedDatasets") %>%
    download_dataset (.)
}