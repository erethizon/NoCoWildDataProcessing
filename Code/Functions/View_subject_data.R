#View_subject_data function to view json data in subject data column
#need to provide n, number of records to view
View_subject_data<-function(jdata, n){
  for(i in 1:n){
    jdata$subject_data[i] %>% prettify %>% print
  }
}