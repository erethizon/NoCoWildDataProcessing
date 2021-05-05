#This is the function that takes the output of assignEvents and organizes it into the "manifest" file required for uploading photos to the zooniverse. It creates a dataframe (Manifest) to receive data and then loops through the images_by_event file, assigning images to the proper column based on their event membership. Next it adds data to the manifest (the DateTimeOriginal of each event, the Camera, SD card number and the Event id) to save steps in the future when processing classification files received from the Zooniverse.

#The argument that is passed to the function is the dataframe that was created by the assignEvents function.The function returns a dataframe that can be exported as the manifest file for this set of images. Any additional data (Site, Round number, or any other fields we wish to add prior to classification) can be added in Excel prior to uploading.


makeManifest<-function(DF){
#create empty data frame to receive the data.

  #determine the number of events in the DF
  Runs<-unique(DF$Event)

  #build empty dataframe
  Manifest<-data.frame(
    Num = integer(length(Runs)),
    Image1 = character(length(Runs)),
    Image2 = character(length(Runs)),
    Image3 = character(length(Runs)),
    DateTimeOriginal_Img1 =.POSIXct(character(length(Runs))),
    CamSD = character(length(Runs)),
    CamNum = character(length(Runs)),
    SD_Num = character(length(Runs)),
    Event = integer(length(Runs)),
    stringsAsFactors = FALSE)

#Loop through DF, read the event number, and assign image names to the proper columns of Manifest
  for (i in 1: length(Runs)) {
    Group <-filter(DF, Event == Runs[i])

    Group<-Group[order(Group$DateTimeOriginal),]
    Fill_num<-length(Group$Event)

    z<-1
    if (Fill_num == 3){
      Manifest$Image1[i]<-Group$FileName[z]
      Manifest$Image2[i]<-Group$FileName[z+1]
      Manifest$Image3[i]<-Group$FileName[z+2]
    }
    else {
      Manifest$Image1[i]<-Group$FileName[z]
      Manifest$Image2[i]<-Group$FileName[z+1]
      Manifest$Image3[i]<-"NA"
    }

  }
#Assign row numbers in column 1 of Manifest as required by Zooniverse
  Manifest[,1]<-c(1:length(Runs))

#Populate the DateTimeOriginal_Img1 and Event columns of Manifest using information from the first image in each event.
  myImages<-Manifest$Image1
  mySubset<-filter(DF, FileName %in% myImages)
  Manifest$DateTimeOriginal_Img1<-mySubset$DateTimeOriginal
  Manifest$Event<-mySubset$Event

#Use pattern matching in strings to extract CamSD, CamNum, SD_Num.
#Begin by splitting the strings based on the "_" character
  myStrings<-str_split(mySubset$FileName, "_")

#myStrings is a list of multiple elements (depending on the number of events). Each element has
#multiple subelements, depending on the image file names. The first two subelements are the camera number and the sd card number.

#Extract the camera number and SD card number from myStrings and put them into the appropriate columns
#of Manifest
  Manifest$CamNum<-sapply(myStrings, "[[", 1)
  Manifest$SD_Num<-sapply(myStrings, "[[", 2)

#Now paste CamNum and SD_Num together to give the Camera and SD card combination and add to Manifest
  Manifest$CamSD<- paste0(Manifest$CamNum, "_", Manifest$SD_Num)

#Return the completed Manifest
  return(Manifest)
}