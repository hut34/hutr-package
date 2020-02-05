#' Make post requests
#'
#' \code{make_post_request} sends a post request to the hut.
#'
#' This function sends a post request to the hut after first adding tokens to the body of the post.
#'   It first adds access and ID tokens to the body of the post.
#'
#' @param Endpoint A string.
#' @param Body A string.
#'
#' @return The response to the post request is returned as a list.
#'
#' @examples
#' make_post_request(Endpoint = "/alive")
#' make_post_request(Endpoint = "/user/downloadFile", Body = paste0("\"dataSetId\":\"", myDatasetID,"\""))
make_post_request <- function(Endpoint, Body = "EMPTY") {
  if (Body == "EMPTY") {
    bodyPlusTokens <- paste0("{\"accessToken\":\"", myAccessToken, "\", \"token\":\"", myIdToken, "\"}")
  } else {
    bodyPlusTokens <- paste0("{\"accessToken\":\"", myAccessToken, "\", \"token\":\"", myIdToken, "\", ", Body,
                             "}")
  }
  httr::POST(paste0(myEndpointUrl, Endpoint), add_headers(`Content-Type` = "application/json"), body = bodyPlusTokens,
             encode = "json", verbose())
}
