#function that 1) takes a dataframe that includes rows in which FileName incorrectly starts with "._" and
#removes the rows of the dataframe that are incorrect.

#The function takes as arguments 1) vector from a dataframe that is a column of FileNames


fix_filename_values <- function(DF) {
  #find all of the rows with filenames that begin with "._" and delete them from the exif table,
  #return the corrected table
  fix_these<-which(str_starts(DF$FileName, "._"))

  DF<-DF[-fix_these, ]

  return(DF)
}