### function to parse classification file into a series of subfiles.
##Pass a classification file from the zooniverse in as the main argument.

parse_classification_file <- function(class_file){
  require(rstudioapi) #turns on Rstudio api if not alreay loaded
  require(svDialogs)#for pop-up window

  data <- class_file #assign data

  #ask user for date to go with file names
  x <-dlgInput("Please enter the date portion of the classification file name in the format DD-MMM-YYYY:  ")
  x <- x$res

  #ask user where to store output files
  rstudioapi::showDialog(
    title = "Let's give R some directory information",
    message = "Select the folder in which you would like to save the output")

  output_path<-rstudioapi::selectDirectory(
    path = here("Output", "PostZooniverse"),
    label= "Select the directory"
  )

  #get a list of all of the workflow ids and workflow versions in the classification file
  workflow_summary <- data |> group_by(workflow_id) |> reframe(
    workflow_version = unique(workflow_version))

  ##Now write a loop that steps through each combination of workflow and workflow versions, filters to each, and writes a file for that combination.

  workflows <- unique(workflow_summary$workflow_id)

  for (i in 1:length(workflows)){
    #obtain workflow versions for the particular workflow
    DF <- workflow_summary %>% filter(workflow_summary$workflow_id == workflows[i])
    versions<-unique(DF$workflow_version)

    #now step through each workflow version and create a datafile
    for (z in 1:length(versions)){
      newDF <- DF |> filter(workflow_version == versions[z])
      newData <- filter(data, workflow_id == newDF$workflow_id[1] & workflow_version == newDF$workflow_version[1])

      write.csv(
        newData,
        paste0(output_path, "/NoCoW_class-",x, "-wfn", newData$workflow_id[1],"_wfv",newData$workflow_version[1],".csv"))
    }
  }
}



