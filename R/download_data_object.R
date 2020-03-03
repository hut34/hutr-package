#' download_data_object
#'
#' \code{download_data_object} downloads a data object
#'
#' This function downloads a JSON data object and converts from JSON
#'  
#' @param DatasetID A string
#'
#' @return Returns a list
#'
#' @examples
#' extract_dataframe_from_json(myJsonObject)
#' 
#' @importFrom magrittr %>%
#' @importFrom jsonlite fromJSON
#' 
#' @export
#' 
#' 
download_data_object <- function(DatasetID) {
  make_post_request(Endpoint = "/user/downloadFile",
                    Body = paste0('"dataSetId": "', DatasetID, '"')) %>% 
    content(., "text") %>% 
    jsonlite::fromJSON()
}