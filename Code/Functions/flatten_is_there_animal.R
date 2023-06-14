#flatten_json function; written by a Zooniverse user and modified by ELB to extract the information from the "is there an animal - old" or "is there an animal?" workflows

#Takes a data frame with json_data in it and flattens the json column
#now flatten data to relevant tasks within a classification
#start by assuming workflow_id = 21527 = "Is there an animal?" workflow
flatten_is_there_animal<-function(json_data){
  flat_to_task<-json_data %>%
    select(., classification_id, user_name, subject_ids,   workflow_name, workflow_version, annotations) %>%
    as.tbl_json(json.column = "annotations") %>%
    gather_array(column.name = "task_index") %>%  #really important for joining later
    spread_values(
      task = jstring("task"),
      task_label = jstring("task_label"),
      answer = jstring("value")) %>%
    #gather_array %>%
    #spread_all
  return(flat_to_task)
}