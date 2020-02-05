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



#' View all datasets
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
# View all datasets in a table -
view_all_datasets <- function() {
  view_datasets(Endpoint = "/user/getDatasets")
}


# View datasets
view_datasets <- function(Endpoint) {
  make_post_request(Endpoint = Endpoint) %>% content(., "text") %>% jsonlite::fromJSON() %>% .$data
}
