#flatten_json function
#now flatten data to relevant tasks within a classification
flatten_json<-function(json_data){
  flat_to_task<-json_data %>%
    select(., subject_ids, user_name, classification_id, workflow_version, annotations) %>%
    as.tbl_json(json.column = "annotations") %>%
    gather_array(column.name = "task_index") %>%  #really important for joining later
    spread_values(
      task = jstring("task"),
      task_label = jstring("task_label")) %>%
    enter_object("value") %>%
    gather_array %>%
    spread_all
  return(flat_to_task)
}