#function that 1) takes  a folder of game camera images and a DF based on a csv file containing the exif data on those images, 2) formats the DateTimeOriginal column to POSIXct and puts the data in temporal order, 3) evaluates the time stamp on each image and 4) uses the time stamp to assign each image to the appropriate event, then writing a new event column to the DF and returns the modified DF.

#The function takes as arguments 1) a data frame with the exif data for a set of camera trap images that includes a column named DateTimeOriginal and 2) a number indicating the threshold number of seconds that differentiates between events. The default threshold is 60 seconds. To work correctly, the DF should be ordered by DateTimeOriginal.

assignEvents <- function(DF, threshold = 60) {
  DF$DateTimeOriginal<-ymd_hms(DF$DateTimeOriginal)
  DF<-DF[order(DF$DateTimeOriginal),] #in case user forgot to order by DateTimeOriginal

  thresh <- threshold
  #sets a threshold for number of seconds between events.    The default value is 60 seconds.

  ev <- 1 #placeholder variable to store event numbers

  L <- length(DF$DateTimeOriginal) #determines the number of rows in the data frame, with each row representing a single image

  Event_num <- numeric() #empty vector to hold the event numbers. Need this in addition to ev because of the fact that the diff function will create n-1 time differences between n images so ev will only go to n-1 but Event_num needs to account for all n images.

  interval <- diff(DF$DateTimeOriginal) #establishes the interval, in seconds, between consecutive images.

  cond <- interval > thresh #sets condition for assigning an image to a new event or keeping it with existing event.

  #now loop through file and assign events
  for(i in 1:(L-1)){
    if(!cond[i]) ev<-ev else ev<-ev+1
    Event_num<-c(Event_num,ev)
  }
  Event<-c(1,Event_num)
  #Now append the Event to the data frame csv to capture the event assignment for each image.
  DF$Event<-Event

  #now return the dataframe

  return(DF)
}