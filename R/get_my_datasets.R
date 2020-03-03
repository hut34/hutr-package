#' get_my_datasets
#'
#' \code{get_my_datasets} provides information about all datasets immediately available to the user.
#'
#' This function calls the hut and returns a dataframe of all data that the current user
#'   has either purchased or has uploaded themselves. 
#'
#' @return The metadata of all uploaded or purchased data is returned as a dataframe.
#'
#' @examples
#' get_my_datasets()
#' 
#' @export
#' 
get_my_datasets <- function() {
  uploadededDatasets <- get_datasets(Endpoint = "/user/getUploadedDatasets")
  purchasedDatasets <- get_datasets(Endpoint = "/user/getPurchasedDatasets")
  myDatasets <- rbind(uploadededDatasets, purchasedDatasets)
  myDatasets
}