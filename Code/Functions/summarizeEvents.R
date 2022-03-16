#this code is for a function called summarizeEvents that calculates some summary information about the events present in a batch of images and provides the information back as a dataframe. It provides this information just for events with > 3 images assigned.

#information to collect includes the event number, camera and sd card the event comes from, number of images per event, and the first and last image in each event.

#pass a dataframe of Exif data after is has been put through the AssignEvent function.
summarizeEvents<-function(DF){
  summaryDF<-DF %>% group_by(CamSD, Event) %>% summarize(
    event_length= length(Event)
  )

  #now filter for all events with > 3 images
  MoreThan3<-which(summaryDF$event_length > 3)
  EventsToCheck<-summaryDF[MoreThan3,]
  #now grab the events in EventsToCheck from Exif
  ExamineThese<-DF %>% filter(Event %in% EventsToCheck$Event)
  return(ExamineThese)
}