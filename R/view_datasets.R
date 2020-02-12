#' view_datasets
#'
#' \code{view_datasets} provides information about datasets available to the user.
#'
#' This function calls the hut and returns a dataframe of available data.
#'   The subset of data displayed depends on the endpoint specified.
#'   
#' @param Endpoint A string
#'
#' @return The metadata of relevant data is returned as a dataframe.
#'
#' @examples
#' view_datasets(Endpoint = "/user/getDatasets")
#' view_datasets("/user/getUploadedDatasets")
#'
#' @importFrom magrittr %>%
#' 
#' @export
#' 
view_datasets <- function (Endpoint = "/user/getUploadedDatasets") {
  myObject <- make_post_request (Endpoint=Endpoint) %>%
    content(., "text") %>%
    jsonlite::fromJSON()
  myData <- myObject$data
  id <- myObject$id
  cbind(myData, id)
}
