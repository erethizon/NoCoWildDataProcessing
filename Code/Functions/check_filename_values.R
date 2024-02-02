#function that 1) takes a vector of file names from our exif file and checks to make sure that the file names are all ok.

#The function takes as arguments 1) vector from a dataframe that is a column of FileNames


check_filename_values <- function(FileNames) {
  #check for FileName that starts with ._ from apple writing to external hard drive and stop if found
  #step 1 create true/false vector using stringr
  checkstrings<-str_starts(FileNames, "._")
  #step 2 see if there are any "trues" in the list; stop the function if there are
  any_are_true<-any(checkstrings) #returns true if any values of checkstrings are true
  if (any_are_true == TRUE) {
    message_text <- "You need to fix the filenames before proceeding! \n (Press enter to continue) "
  } else {
    message_text <- "Your file names look good. Proceed! \n (Press enter to continue)"
  }

  x <-readline(message_text)
}