# Checks to see if URL is in correct format
check_hut_url_valid <- function(urlToCheck) {
  urlToCheck <- as.character(urlToCheck)
  if (urlToCheck == "http://localhost:3000") {
    TRUE
  } else if (substr(urlToCheck, start = 1, stop = 8) == "https://" && substr(urlToCheck, start = nchar(urlToCheck) -
                                                                             8, stop = nchar(urlToCheck)) == ".web.app/") {
    TRUE
  } else {
    cat("Hut URL is not valid. Must begin \"https://\" and end with \".web.app/\"\n")
    FALSE
  }
}


# Returns TRUE if HutURL present and in correct format and both tokens are present
check_url_and_tokens <- function() {
  bCheck <- TRUE
  if (exists("myHutUrl") == FALSE) {
    cat("Hut URL does not exist in global environment\n")
    bCheck <- FALSE
  } else {
    if (check_hut_url_valid(myHutUrl) == FALSE) {
      bCheck <- FALSE
    }
  }
  if (exists("myIdToken") == FALSE) {
    cat("ID token does not exist in global environment\n")
    bCheck <- FALSE
  }
  if (exists("myAccessToken") == FALSE) {
    cat("Access token does not exist in global environment\n")
    bCheck <- FALSE
  }
  bCheck
}



# Dataset ID is not currently specified in the table of datasets so requires a separate post request
get_datasetID <- function(DatasetNumber, Endpoint) {
  DatasetIDs <- make_post_request(Endpoint = Endpoint) %>% 
    content(., "text") %>% 
    jsonlite::fromJSON() %>% 
    .$id
  DatasetIDs[DatasetNumber]
}



# Parses JSON object to retrieve dataframe
extract_dataframe_from_json <- function(JsonObject) {
  myDataObject <- JsonObject %>% 
    content(., "text") %>% 
    jsonlite::fromJSON()
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