#this function takes the subject_data column from our zooniverse data (the column that includes the information from the manifest file) and flattens it into a separate column for each json element.

#The only argument passed to it is the data frame containing the subject_data column.

flatten_subjects<-function(DF){
#For each row of data, the first part of the subject_data json is the number that corresponds to the subject id.  Because each subject id is unique, if you try to parse these data as is, you will get a new column for every single subject, which is insane.  To solve this problem, we're going to replace the subject_id in the subject_data column with uniform text.

subj_id_string<-as.character(DF$subject_ids)#makes a variable consisting of the strings to recognize.
DF$new_sub_data<-DF$subject_data %>% str_replace(subj_id_string, "subject") #replace the strings with the word "subject"

#Now we can parse. This code may have to be updated to match any changes in the subject data structure in future.

subjects<-DF %>%
  select(., subject_ids, user_name, classification_id,workflow_id,
         workflow_version, subject_ids, created_at, new_sub_data) %>%
  as.tbl_json(json.column = "new_sub_data") %>%
  spread_values(
    #1st values from original manifest format
    id = jstring(subject,retired,id),
    class.count = jnumber(subject, retired, classifications_count),
    retire.date = jstring(subject, retired, retired_at),
    round = jstring("subject", "#round"),
    Img1 = jstring(subject, image1),
    Img2 = jstring(subject,image2),
    Img3 = jstring(subject, image3),
    CamNum = jstring("subject", "#cam_num"),
    SD_card_num = jstring("subject", "#sd_card"),
    Event = jstring("subject", "event_num"),
    #values from second manifest format
    Batch = jstring("subject", "!Batch"),
    Round2 = jstring("subject", "!Round"),
    Img4 = jstring(subject, Image1),
    Img5 = jstring(subject, Image2),
    Img6 = jstring(subject, Image3),
    CamNum2 = jstring("subject", "#CamNumber"),
    SDCard2 = jstring("subject", "#SDCardNum"),
    For_type = jstring("subject", "!ForestType"),
    For_name = jstring("subject", "#ForestName"),
    #values from third manifest format
    Num = jstring(subject, Num),
    CamSD = jstring(subject, CamSD),
    Event1 = jstring(subject, Event),
    Phase = jstring("subject", "#phase"),
    CamNum3 = jstring(subject, CamNum),
    SDCard3 = jstring(subject, SD_num),
    Forest = jstring("subject", "#forest"),
    Lat = jstring("subject", "#latitude"),
    Long = jstring("subject", "#longitude"),
    Treatment = jstring("subject", "#treatment"),
    DTO = jstring(subject, DateTimeOriginal_Img1)
  )

subjects<-select(subjects, !c(subject_ids, user_name, workflow_version)) #gets rid of subject_ids, user_name

return(subjects)
}