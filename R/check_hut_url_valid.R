#' check_hut_url_valid
#'
#' \code{check_hut_url_valid} checks if the URL entered is valid
#'
#' Checks if the URL entered by the user is of the form https://XXXXXXX.web.app/
#'
#' @param urlToCheck A string
#' 
#' @return Boolean
#'
#' @examples
#' check_hut_url_valid("https://XXXXXXX.web.app/")
#' 
#' @export
#' 
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
