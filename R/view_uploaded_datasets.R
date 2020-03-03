#' view_uploaded_datasets
#'
#' \code{view_uploaded_datasets} provides information about datasets uploaded by the user.
#'
#' This function calls the hut and returns a dataframe of all uploaded data
#'   i.e., data that was uploaded by t he current user.
#'
#' @return The metadata of all uploaded data is returned as a dataframe.
#'
#' @examples
#' view_uploaded_datasets()
#' 
#' @export
#' 
view_uploaded_datasets <- function() {
  View(get_datasets(Endpoint = "/user/getUploadedDatasets"))
}