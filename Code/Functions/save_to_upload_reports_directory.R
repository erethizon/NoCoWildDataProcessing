#The save_to_upload_reports_directory function prompts the user for the directory in which they
#would like to save an upload report output file. The function then checks to see if the
#Upload-reports directory exists in that location. If so, it saves the file in that directory.
#If not, it creates the directory and then saves the file in it.

save_to_upload_reports_directory <- function(filename_to_write){
  #make sure here package is active
  require(here)
  #open dialog box; ask user to find directory to save to
  rstudioapi::showDialog(
    title = "Let's give R some information",
    message = "Navigate to the directory you wish to save your file in"
  )
  directory <- rstudioapi::selectDirectory(
    path = "/Volumes/NoCoWild/",
    label = "Click on the folder")
  #check to see if directory is called "Upload-reports"
  name_correct <- basename(directory) == "Upload-reports" #checks to see if last part of file path
  #indicating the desired directory is a folder called "Upload-reports.

  #if name_correct = T then write file. If not, create directory and save file.
  if (name_correct == TRUE) {
    write.csv(upload_report, here(directory, filename), row.names = F)
  } else {
    dir.create(file.path(paste0(directory,"/Upload-reports")))
    write.csv(upload_report, here(paste0(directory, "/Upload-reports"), filename), row.names=F)
  }
}