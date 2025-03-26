#The function inspect_Exif_file.R takes a dataframe of exif data for a batch
#of images being prepped for upload to the zooniverse. It returns a dataframe
#that a row for each Cam_SD represented in the batch of photos as well as the
#date for the first and last image and the number of images from each camera
#in the potential upload. The goal is to identify cameras that might have date
#problems. Date problems wreak havoc when assigning images to events.

inspect_Exif_file.R <- function(exif_DF_to_inspect){
  require(stringr)
  require(lubridate)
  DF <- exif_DF_to_inspect
  DF$Cam_SD<-str_sub(DF$FileName, end = 10) #extracts the first 10 values of FileName into a new column
  DF$Cam_SD <- as.factor(DF$Cam_SD)
  #now make date-time into a date If not, make it one.
  DF$DateTimeOriginal<-ymd_hms(DF$DateTimeOriginal) #make DTO into a date class
  DF<-DF %>% arrange(Cam_SD, DateTimeOriginal)#orders by camera and then date time original

  new_DF_size <- length(unique(DF$Cam_SD)) #create empty data frame to store results
  NewDF <- data.frame(
    Cam_SD = character(new_DF_size),
    num_pics = integer(new_DF_size),
    date_first_pic = POSIXct(new_DF_size),
    date_last_pic = POSIXct(new_DF_size),
    NA_count = integer(new_DF_size)
  )

  #now loop through DF per camera, count pics, get first and last dates, add to NewDF
  cams <- unique(DF$Cam_SD)
  for(i in 1:new_DF_size){
    tempDF <- filter(DF, Cam_SD == cams[i])
    tempSummary <- tempDF %>% arrange(DateTimeOriginal) %>% summarise(
      Cam_SD = as.character(cams[i]),
      num_pics = length(DateTimeOriginal),
      date_first_pic = min(DateTimeOriginal, na.rm = T),
      date_last_pic = max(DateTimeOriginal, na.rm = T),
      NA_count = sum(is.na(tempDF$DateTimeOriginal))
    )
    #now return summary values to NewDF
    NewDF[i,] <- tempSummary[1,]
  }
  return(NewDF)
}