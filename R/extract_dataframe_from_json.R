#' extract_dataframe_from_json
#'
#' \code{extract_dataframe_from_json} parses JSON object to retrieve dataframe
#'
#' This function extracts the dataframe from the JSON object that is retrieved from the hut.
#'  
#' @param JsonObject A JSON object
#'
#' @return Returns a dataframe
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
extract_dataframe_from_json <- function(JsonObject) {
  myDataObject <- JsonObject %>% 
    content(., "text") %>% 
    jsonlite::fromJSON()
  myDataframe <- as.data.frame(myDataObject$data, stringsAsFactors = FALSE, row.names = FALSE)
  colnames(myDataframe) <- myDataObject$header$name
  transform_dataframe_columns_to_numeric(myDataframe)
}