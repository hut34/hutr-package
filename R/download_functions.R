# Dataset ID is not currently specified in the table of datasets so requires a separate post request
get_datasetID <- function(DatasetNumber, Endpoint) {
  DatasetIDs <- make_post_request(Endpoint = Endpoint) %>% content(., "text") %>% jsonlite::fromJSON() %>% .$id
  DatasetIDs[DatasetNumber]
}



# Parses JSON object to retrieve dataframe
extract_dataframe_from_json <- function(JsonObject) {
  myDataObject <- JsonObject %>% content(., "text") %>% jsonlite::fromJSON()
  myDataframe <- as.data.frame(myDataObject$data, stringsAsFactors = FALSE, row.names = FALSE)
  colnames(myDataframe) <- myDataObject$header$name
  transform_dataframe_columns_to_numeric(myDataframe)
}



# If all the data in a column is numeric, sets the column to numeric.
# This may not be needed any more but at one point all data retrieved from the hut was treated as a string.
transform_dataframe_columns_to_numeric <- function(Dataframe) {
  myDF2 <- lapply(Dataframe, function(col) {
    if (suppressWarnings(all(!is.na(as.numeric(as.character(col)))))) {
      as.numeric(as.character(col))
    } else {
      col
    }
  })
  myDF2 <- as.data.frame(myDF2, stringsAsFactors = FALSE)
  myDF2
}
