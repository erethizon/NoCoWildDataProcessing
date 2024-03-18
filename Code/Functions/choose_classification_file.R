#function that let's you choose a zooniverse classification file and import data
#from the specific workflow you are interested in.


choose_classification_file <-function(){
  require(rstudioapi) #turns on Rstudio api if not already loaded
  #choose classification file; requires active t:drive connection
  rstudioapi::showDialog(
    title = "Let's give R some file information",
    message = "Select the file containing the classification data you wish to process")

  #path to exif file folder on t:drive
  path_to_class_file<-"/Volumes/classes/Bart_s04/Research_group/NoCoWild/Data/classification_files/"

  class_file_path<-rstudioapi::selectFile(
    path = "/Volumes/classes/Bart_s04/Research_group/NoCoWild/Data/classification_files/",
    filter = "CSV files (*.csv)",
    label= "Select desired classification file"
  )

  jdata<-read.csv(class_file_path)
  filename<-basename(class_file_path)
  output<-list(jdata, filename)
  return(output)
}

