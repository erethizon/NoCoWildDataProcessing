##choose_my_workflow: R function to prompt user to select proper workflow and workflow version. Requires that the user know which workflow and workflow version they desire.
choose_my_workflow<-function(df){
  #turn on dplyr
  require(dplyr)

  select_workflow<- function(df) {
    #identify workflows by making workflow_id into a factor
    df$workflow_id<-as.factor(df$workflow_id)
    workflows<-levels(df$workflow_id)
    return(workflows)
    #works
  }

  workflows<- select_workflow(df)

  #now ask user which workflow to use

  my_selection<- menu(workflows,
                      title= "Which workflow do you want?")

  my_selection_filtered<-workflows[my_selection]
  #now find the desired version of the workflow
  DF2<-filter(df, workflow_id == my_selection_filtered)
  DF2$workflow_version<-as.factor(
    DF2$workflow_version)

  versions<-levels(DF2$workflow_version)

  my_wkflow_version<- menu(
    versions,
    title = "Which workflow version do you want?")
  #now filter df to that workflow version

  DF3<-filter(
    DF2,
    workflow_version == versions[my_wkflow_version])
}