#' get_tokens
#'
#' \code{get_tokens} prompts the user to retrieve tokens from the hut website and sets them as global variables
#'
#' Users are prompted to copy and paste access and ID tokens from the hut website and paste them into the console.
#'
#' @return The two tokens are assigned as global variables.
#'
#' @examples
#' get_tokens()
#' 
#' @export
#' 
get_tokens <- function() {
  if (exists("myHutUrl") == FALSE) {
    cat("Hut URL has not been specified. Run get_hut_url before calling get_tokens")
  } else {
    if (myHutUrl != "http://localhost:3000" && check_hut_url_valid(myHutUrl) == FALSE) {
      cat("Invalid URL. Must begin with \"https://\" and end in \".web.app\"")
    } else {
      invisible(readline(prompt = "Copy Access Token. Press [enter] to go to Hut website."))
      httr::BROWSE(myHutUrl)
      assign("myAccessToken", readline(prompt = "Paste access token: "), envir = .GlobalEnv)
      assign("myIdToken", readline(prompt = "Paste ID token: "), envir = .GlobalEnv)
    }
  }
}