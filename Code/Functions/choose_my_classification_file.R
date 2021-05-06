##choose_my_classification_file: R function to prompt user to select which classification file they would like to load. It may throw an error if the user does not have an active t:drive connection.

#The function takes as an argument the path to the folder containing the classification files.

choose_my_class_file<-function(classification_file_path){
  #list classification files
  class_files<-list.files(classification_file_path)

  #now ask user which file to use
  my_selection<- menu(class_files,
                      title= "Which classification file do you want?")
  #now save the user's choice
  my_selection<-class_files[my_selection]

  #now read in the selected file
  jdata<-read.csv(paste0(classification_file_path,"/",my_selection ),stringsAsFactors = F)
  out<-list(my_selection, jdata)
  return(out)
}