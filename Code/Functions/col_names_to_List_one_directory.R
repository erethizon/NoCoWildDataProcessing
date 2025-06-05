#Let's write a function that loops through a set of file names that are located
#in the same directory, saves the first row (the header) of each file
#as a vector, and puts the result in a list.

col_names_to_List_one_directory <-function(folder_path, vector_of_file_names){
  #pass the path to the directory with the files in it and a vector of the names
  #of the files
  Folder <- folder_path
  Files <- vector_of_file_names
#create list to store results
  myList <-  vector(mode='list', length=length(Files))
  for (i in 1: length(Files)){
    tempFile <- read.csv(here(paste0(Folder, "/",Files[i])), header = F, nrows = 1)
    myList[[i]] <- as.character(tempFile[1,])
  }
  #now return the list
  return(myList)
}

