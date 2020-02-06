#' check_url_and_tokens
#'
#' \code{check_url_and_tokens} checks if the URL and tokens are valid
#'
#' Checks if the Hut URL exists in the global environment and if it is of the form https://XXXXXXX.web.app/
#'   Then checks if the Access and ID tokens exist.
#'   Returns TRUE if all conditions are met.
#'
#' @return Boolean
#'
#' @examples
#' check_url_and_tokens()
#' 
#' @export
#' 
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
