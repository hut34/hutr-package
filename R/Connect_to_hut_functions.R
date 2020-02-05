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
initiate_hut <- function() {
  get_hut_url()
  get_tokens()
  check_connection()
}



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
