#function that let's you obtain the filepath for a file you wish to use

choose_file <-function(){
  require(rstudioapi)#turns on Rstudio api if not already loaded
  require(here)#turns on here package if not already loaded
  #choose classification file; requires active t:drive connection
  rstudioapi::showDialog(
    title = "Let's give R some file information",
    message = "Select the file you wish to work with")

  needed_file_path<-rstudioapi::selectFile(
    path = here(),
    filter = "CSV files (*.csv)",
    label= "Select desired file file"
  )

  filename<-basename(needed_file_path)
  return(needed_file_path)
}

