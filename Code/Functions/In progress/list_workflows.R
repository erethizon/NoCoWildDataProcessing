#function that returns a list of all of the workflows in a classification file, along
#with all of the workflow versions associated with each workflow and the range of dates
#within which classifications were made for each.

list_workflows <-function(DF){
  #pass a dataframe as an argument to this function;
  require(dplyr)
  require(lubridate)
  #Next line selects just the workflow-related data from that dataframe
  jdata <- DF %>% select(c(workflow_id, workflow_name, workflow_version, created_at))
  jdata$created_at <-ymd(jdata$created_at)
  #now group_by and summarise

  versions_per_workflow <- jdata %>% group_by(workflow_id) %>%
   summarise(
      num_versions = length(unique(workflow_version))
    )
  workflows <- unique(jdata$workflow_id)

  num_rows <- sum(versions_per_workflow$num_versions)

  workflow_number<-vector(mode = "numeric", length = num_rows)

  #create a storage area for workflow version output
  for (i in 1:length(workflows)){
    myWorkflow <- workflows[i]

  }

  workflow_identification_values <- as.numeric(vector(length = num_rows))
  #now get lists of workflow versions

  for (i in 1:length(versions_per_workflow$workflow_id)){
    workflow <- workflow_summary$workflow_id[i]
    DF <- jdata %>% filter(workflow_id == workflow)
    myVector <- unique(DF$workflow_version)
    if (i == 1){
      workflow_identification_values[1:length(myVector)] <- myVector
    } else
  }


  #identify workflows by making workflow_id into a factor
  workflow_nums<-unique(jdata$workflow_id)
  workflow_names<-unique(jdata$workflow_name)


  my_selection_filtered<-workflow_nums[my_selection]
  #now find the desired version of the workflow
  DF<-filter(jdata, workflow_id == my_selection_filtered)
   versions<-unique(DF$workflow_version)
  my_wkflow_version<- menu(
    versions,
    title = "Which workflow version do you want?")
  #now filter df to that workflow version

  DF2<-filter(
    DF,
    workflow_version == versions[my_wkflow_version])
out<-list(DF2, filename)
  return(out)
}