#flatten_json function; written by a Zooniverse user and modified by ELB

#Takes a data frame with json_data in it and flattens the json column
#now flatten data to relevant tasks within a classification
flatten_annotations<-function(json_data){
  flat_to_task<-json_data %>%
    select(., classification_id, user_name, subject_ids,   workflow_version, annotations) %>%
    as.tbl_json(json.column = "annotations") %>%
    gather_array(column.name = "task_index") %>%  #really important for joining later
    spread_values(
      task = jstring("task"),
      task_label = jstring("task_label")) %>%
    enter_object("value") %>%
    gather_array %>%
    spread_all
#now get rid of .filter columns
  flat_to_task<-flat_to_task %>% select(! starts_with("filters."))
  return(flat_to_task)
}