#' get_all_datasets
#'
#' \code{get_all_datasets} provides information about all datasets immediately available to the user.
#'
#' This function calls the hut and returns a dataframe of all data that the current user
#'   has either purchased or has uploaded themselves. 
#'
#' @return The metadata of all uploaded or purchased data is returned as a dataframe.
#'
#' @examples
#' get_all_datasets()
#' 
#' @export
#' 
get_all_datasets <- function() {
  get_datasets(Endpoint = "/user/getDatasetsToPurchase")
}