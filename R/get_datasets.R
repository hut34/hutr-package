#' get_datasets
#'
#' \code{get_datasets} provides information about datasets available to the user.
#'
#' This function calls the hut and returns a dataframe of available data.
#'   The subset of data displayed depends on the endpoint specified.
#'   
#' @param Endpoint A string
#'
#' @return The metadata of relevant data is returned as a dataframe.
#'
#' @examples
#' get_datasets(Endpoint = "/user/getDatasets")
#' get_datasets("/user/getUploadedDatasets")
#'
#' @importFrom magrittr %>%
#' 
#' @export
#' 
get_datasets <- function (Endpoint) {
  myObject <- make_post_request (Endpoint=Endpoint) %>%
    content(., "text") %>%
    jsonlite::fromJSON()
  myData <- myObject$data
  id <- myObject$id
  myData <- cbind(myData, id)
}
