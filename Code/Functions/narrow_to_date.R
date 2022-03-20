#function that asks the user to narrow the file to the date range specified

narrow_to_date<-function(df){
  #parse created_at column
  df$created_at<-ymd_hms(df$created_at)
  df$cYear<-year(df$created_at)
  df$cMonth<-month(df$created_at)


  my_years <- select.list(unique(df$cYear),multiple=TRUE,
                      title='select the years for which you would like data',
                      graphics=TRUE)

  DF2<-filter(df, cYear %in% my_years)
  my_months <-select.list(unique(DF2$cMonth), multiple = TRUE,
                          title = "Select the months for which you would like data")

  DF2<-filter(DF2, cMonth %in% my_months)
  return(DF2)
}