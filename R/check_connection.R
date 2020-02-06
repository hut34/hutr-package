#' check_connection
#'
#' \code{check_connection} sends a post request to test whether connections has been established
#'
#' Sends a post request to the /alive endpoint.
#'   Provides a message in the Console including the Status Code and whether the connection was successful.
#'
#' @return The two tokens are assigned as global variables.
#'
#' @examples
#' check_connection()
#' 
#' @export
check_connection <- function() {
  if (check_url_and_tokens()) {
    returnMessage <- make_post_request(Endpoint = "/alive")
    if (returnMessage$status_code == 200) {
      cat(paste0("Status Code: 200. Successfully connected to ", returnMessage$url))
    } else {
      cat(paste0("Status Code: ", returnMessage$status_code, ". Failed to connect to ", returnMessage$url))
    }
  }
}