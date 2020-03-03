#' view_my_datasets
#'
#' \code{view_my_datasets} provides information about all datasets immediately available to the user.
#'
#' This function calls the hut and returns a dataframe of all data that the current user
#'   has either purchased or has uploaded themselves. 
#'
#' @return The metadata of all uploaded or purchased data is returned as a dataframe.
#'
#' @examples
#' view_my_datasets()
#' 
#' @export
#' 
view_my_datasets <- function() {
  View(get_my_datasets())
}