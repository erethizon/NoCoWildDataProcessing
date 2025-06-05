#Let's write a function that loops through a set of file names when the files
#are from different directories, saves the first
#row (the header) of each file as a vector, and puts the result in a list.

col_names_to_List_many_directories <-function(vector_of_file_paths){
  #pass a vector of file paths for the files you want to work with
  Files <- vector_of_file_paths
  #create list to store results
  myList <-  vector(mode='list', length=length(Files))
  for (i in 1: length(Files)){
    tempFile <- read.csv(Files[i], header = F, nrows = 1)
    myList[[i]] <- as.character(tempFile[1,])
  }
  #now return the list
  return(myList)
}

