#random_subset_dataframe:function to subset a large dataset to get a smaller one for testing code
random_subset_dataframe <- function(df) {
  #turn on dplyr
  require(dplyr)
  #establish how many samples the user would like
  sample_size<-as.integer(readline(prompt = "How many rows of data would you like to sample? "))
  #select sample_size rows from DF using sample_n from dplyr
  NewDF<-sample_n(df, sample_size)
  return(NewDF)
}