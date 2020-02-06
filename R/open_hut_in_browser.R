#' open_hut_in_browser
#'
#' \code{open_hut_in_browser} opens the hut web interface.
#'
#' This function switches the user from R to their default browser and takes them to the address they input when
#'   initiating the hut.
#'
#' @examples
#' open_hut_in_browser ()
#' 
#' @export
#' 
open_hut_in_browser <- function () {
  if (exists("myHutUrl")) {
    BROWSE(myHutUrl)
  } else {
    cat("myHutUrl does not exist in global environment. Please call initiate_hut function\n")
  }
}
