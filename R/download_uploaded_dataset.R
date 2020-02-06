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
#' 
#' @export
download_uploaded_dataset <- function(DatasetNumber) {
  download_dataset (DatasetNumber=DatasetNumber, Endpoint="/user/getDatasets")
}