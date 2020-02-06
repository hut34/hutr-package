#' get_datasetID
#'
#' \code{get_datasetID} retrieves dataset ID
#'
#' Dataset ID is not currently specified in the table of datasets so requires a separate post request.
#'  User must also specify the endpoint.
#'  
#' @param DatasetNumber An integer.
#' @param Endpoint A string
#'
#' @return Returns a string
#'
#' @examples
#' get_datasetID(DatasetNumber=DatasetNumber, Endpoint=Endpoint)
#' 
#' @importFrom magrittr %>%
#' @importFrom jsonlite fromJSON
#' 
#' @export
#' 
get_datasetID <- function(DatasetNumber, Endpoint) {
  DatasetIDs <- make_post_request(Endpoint = Endpoint) %>% 
    content(., "text") %>% 
    jsonlite::fromJSON() %>% 
    .$id
  DatasetIDs[DatasetNumber]
}