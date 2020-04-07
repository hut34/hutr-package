#' view_all_datasets
#'
#' \code{view_all_datasets} provides information about all datasets available to the user.
#'
#' This function calls the hut and returns a dataframe of all available data.
#'   This includes datasets that that the current user has uploaded and datasets
#'   that are available but have not been purchased.
#'
#' @return The metadata of all purchased data is returned as a dataframe.
#'
#' @examples
#' view_all_datasets()
#'
#' @export
#'
view_all_datasets <- function() {
  View(get_datasets(Endpoint = "/user/getDatasetsToPurchase"))
}