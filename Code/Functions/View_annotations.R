#View_annotations function to view json data in annotations column
#need to provide n, number of records to view
View_annotations<-function(jdata,n ){
  for (i in 1:n){
    jdata$annotations[i] %>% prettify %>% print
  }
}