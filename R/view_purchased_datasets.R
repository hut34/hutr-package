#' View purchased datasets
#'
#' \code{view_purchased_datasets} provides information about datasets purchased by the user.
#'
#' This function calls the hut and returns a dataframe of all purchased data
#'   i.e., data that was uploaded by another user but the current user has
#'   immediate access to.
#'
#' @return The metadata of all purchased data is returned as a dataframe.
#'
#' @examples
#' view_purchased_datasets()
view_purchased_datasets <- function() {
  view_datasets(Endpoint = "/user/getUploadedDatasets")
}