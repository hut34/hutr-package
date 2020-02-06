#' get_hut_url
#'
#' \code{get_hut_url} asks the user for the URL of their hut
#'
#' This function asks for the URL of the data hut, input via the console.
#'   It also derives a URL for endpoints for pushing and pulling data.
#'
#' @return The two URLs are assigned as global variables.
#'
#' @examples
#' get_hut_url()
#' 
#' @export
get_hut_url <- function() {
  inputUrl <- readline(prompt = "Enter URL of your data hut, or 'local' if running on your machine: ")
  inputUrl <- as.character(inputUrl)
  if (inputUrl == "local") {
    assign("myHutUrl", "http://localhost:3000", envir = .GlobalEnv)
    assign("myEndpointUrl", "http://localhost:8080", envir = .GlobalEnv)
  } else {
    if (check_hut_url_valid(inputUrl)) {
      assign("myHutUrl", inputUrl, envir = .GlobalEnv)
      assign("myEndpointUrl", gsub(".web.app/", ".appspot.com", inputUrl), envir = .GlobalEnv)
    } else {
      cat("Invalid URL. Must begin with \"https://\" and end in \".web.app\"")
    }
  }
}