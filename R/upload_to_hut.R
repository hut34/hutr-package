#' upload_dataset
#'
#' \code{upload_dataset} uploads a dataset to the hut.
#'
#' This function adds metadata to a dataframe and uploads it to the hut.
#'
#' @param Data A dataframe
#' @param Name A string
#' @param Description A string
#' @param Parent A string
#' @param Custodial A Boolean
#' @param Price A number
#' @param Image A string
#'
#' @return Returns the reply to the post request as a list - I think!!!
#'
#' @examples
#' upload_dataset (Data="myData", Name="Some nice data", Description="This data took ages to collect!", Parent="hfud945r3bdhnsgfte", Custodial=FALSE)
#' 
#' @export
#' 
upload_dataset <- function(Data, Name, Description, Parent = "No parent", Custodial = TRUE, Rooms = "DEFAULT", Price = 3.14, Image = "DEFAULT") {
    if (Image=="DEFAULT") {
        imageURL <- "https://images.unsplash.com/photo-1533279443086-d1c19a186416?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80"
    } else {
        imageURL <- Image
    }
    make_post_request(Endpoint = "/admin/createDataset", Body = paste0("\"fromR\":\"TRUE\", \"data\": {\"custodial\": \"",
        Custodial, "\"", ", \"parentId\": \"", Parent, "\"", ", \"rooms\": \"", Rooms, "\"", ", \"ENTRPPrice\": \"", Price, "\"", ", \"description\": \"",
        Description, "\"", ", \"name\": \"", Name, "\"", ", \"coverImage\": \"", imageURL, "\"", ", \"data\": ", toJSON(Data,
            dataframe = "columns"), "}"))
}






