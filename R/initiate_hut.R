#' initiate_hut
#'
#' \code{initiate_hut} establishes a connection between R and Hut34.
#'
#' This function asks for the URL of the data hut, input via the console.
#' It then prompts the user to enter access and ID tokens.
#' Finally it sends a post request to check the connection.
#'
#' @return The URL and tokens are set as global variables.
#'   A console message indicates if the connection was successful.
#'
#' @examples
#' initiate_hut()
#' 
#' @export
#' 
initiate_hut <- function() {
  get_hut_url()
  get_tokens()
  check_connection()
}