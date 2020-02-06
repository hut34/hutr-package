# Install the latest version of the hutr package (unless you know it hasn't changed)
library(devtools)
install_github("hut34/hutr-package")

# Load the hutr package
library(hutr)

# View datasets available on the hut
initiate_hut()

#browse the datasets available in the hut
View(view_all_datasets ())

#upload a data frame to the hut as a dataset - simple example using car dataset built in to R
upload_dataset(mtcars, Name="mtcars", Description="Data about cars")

#browse the datasets available in the hut
View(view_all_datasets ())

# Download a dataset that I uploaded (only works for datasets uploaded by the user, because of the key management)
myData <- download_uploaded_dataset (DatasetNumber=4)
View(myData)

#Acquire dataset from someone else
View(view_all_datasets ())
purchase_dataset (DatasetNumber=1)

#Download previously acquired dataset
View(view_purchased_datasets ())
myPurchasedData <- download_purchased_dataset (DatasetNumber=1)
View(myPurchasedData)

#complete some work here in R - simple example filtering the cars dataset to cars with less than 5 cylinders
myNewData <- filter(myData, cyl < 5)

#upload back to the hut - enter the appropriate dataFrame name, and meta details below (talk to us to lean more about 'Parent')
upload_dataset(myNewData, Name="A new dataset", Description="A dataset created in R and pushed to the hut", Parent="parentID")
#confirm that the dataset uploaded by repeating line 10 / 11 above!