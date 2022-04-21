#function that let's you choose a zooniverse classification file and import data
#from the specific workflow you are interested in.


choose_workflows_for_leaderboard<-function(){
  require(rstudioapi) #turns on Rstudio api if not alreay loaded
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
  #output<-list(jdata, filename)

  #now isolate workflow; code follows the choose_my_workflow function
  require(dplyr)
  #identify workflows by making workflow_id into a factor
  workflow_nums<-unique(jdata$workflow_id)
  workflow_names<-unique(jdata$workflow_name)
  workflows<-paste0(workflow_nums, " - ", workflow_names)

  #now ask user which workflow to use

  my_selection<- menu(workflows,
                      title= "Which workflow do you want?")

  my_selection_filtered<-workflow_nums[my_selection]
  #now find the desired version of the workflow
  DF<-filter(jdata, workflow_id == my_selection_filtered)
  DF$workflow_version<-as.factor(
    DF$workflow_version)

  versions<-levels(DF$workflow_version)

  my_wkflow_version<- menu(
    versions,
    title = "Which workflow version or versions do you want?")
  #now filter df to that workflow version

  DF2<-filter(
    DF,
    workflow_version == versions[my_wkflow_version])
out<-list(DF2, filename)
  return(out)
}