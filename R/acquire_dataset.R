#' acquire_dataset
#'
#' \code{acquire_dataset} purchases and downloads a dataset from the hut.
#'
#' This function allows the user to purchase a dataset by specifying its DatasetID.
#'
#' @param DatasetID A string.
#'
#' @examples
#' acquire_dataset ("shdurr8nf80SLK")
#' acquire_dataset (DatasetID = "shdurr8nf80SLK")
#' 
#' @export
#' 
acquire_dataset <- function(DatasetID) {
  AvailableDatasets <- get_datasets(Endpoint = "/user/getDatasetsToPurchase")
  RowNum <- which(AvailableDatasets$id == DatasetID)
  if(length(RowNum)==1){
    make_post_request(Endpoint = "/user/purchase", Body = paste0("\"dataSetId\":\"", DatasetID, "\""))
    if(AvailableDatasets$custodial[RowNum]==TRUE) {
      cat(paste0("Dataset ", DatasetID, " acquired!"))
    } else {
      cat(paste0("Your request for dataset ", DatasetID, " has been sent."))
    }
  } else {
    if(length(RowNum)==0){
      cat(paste0("Dataset ", DatasetID, " is not listed in available datasets."))
    } else {
      cat(paste0("DatasetID ", DatasetID, " is listed multiple times in available datasets")) # NB This should never happen!
    }
  }
}
