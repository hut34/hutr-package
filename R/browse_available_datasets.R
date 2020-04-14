#' browse_available_datasets
#'
#' \code{browse_available_datasets} provides information about all datasets available to the user.
#'
#' This function calls the hut and returns a dataframe of all available data that the user has not
#'   yet acquired.
#'
#' @return The metadata of all available data is returned as a dataframe.
#'
#' @examples
#' browse_available_datasets()
#'
#' @export
#'
browse_available_datasets <- function() {
  AvailableDatasets <- get_datasets(Endpoint = "/user/getDatasetsToPurchase")
  keeps <- c("id", "name", "description", "ENTRPPrice")
  AvailableDatasets <- AvailableDatasets[keeps]
  View(AvailableDatasets)
}