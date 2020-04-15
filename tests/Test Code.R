# Install the latest version of the hutr package
library(devtools)
install_github("hut34/hutr-package")

# Load the hutr package
library(hutr)

# Initiate your hut session
initiate_hut()

#browse the datasets available in the hut
browse_available_datasets()

#upload a data frame to the hut as a dataset - simple example using car dataset built in to R
upload_dataset(mtcars, Name="mtcars", Description="Some data about cars")

#look for it in your datasets
view_my_datasets()

#browse the datasets available in the hut
browse_available_datasets ()

#choose one to acquire - this will require you to replace the ID with the ID from the table.
acquire_dataset("kbkjbAjbSOjb0kjbu37")

#check to see if it is now in your datasets - if not then the dataset owner is required to authorise transaction
view_my_datasets()

# Download that dataset
myData <- download_dataset ("kbkjbAjbSOjb0kjbu37")

# View dataframe
View(myData$df)