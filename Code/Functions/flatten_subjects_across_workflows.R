#this function takes the subject_data column from our zooniverse data (the column that includes the information from the manifest file) and flattens it into a separate column for each json element.

#The only argument passed to it is the data frame containing the subject_data column.

flatten_subjects_across_workflows<-function(DF){
#For each row of data, the first part of the subject_data json is the number that corresponds to the subject id.  Because each subject id is unique, if you try to parse these data as is, you will get a new column for every single subject, which is insane.  To solve this problem, we're going to replace the subject_id in the subject_data column with uniform text.

subj_id_string<-as.character(DF$subject_ids)#makes a variable consisting of the strings to recognize.
DF$new_sub_data<-DF$subject_data %>% str_replace(subj_id_string, "subject") #replace the strings with the word "subject"

#Now we can parse. This code may have to be updated to match any changes in the subject data structure in future.

subjects<-DF %>%
  select(subject_ids, user_name, classification_id,workflow_id, workflow_name,
         workflow_version, created_at, metadata, annotations, subject_data, new_sub_data) |>
  as.tbl_json(json.column = "new_sub_data") |>
  spread_all()

##Now need to get rid of unneeded columns,combine data into columns to reduce redundancy, and reformat some columns.

# What columns can we combine and then delete to make this smaller?
#
# `subject.#round` and `subject.!Round` `subject.image1` and #`subject.Image1` `subject.image2` and `subject.Image2` #`subject.image3` and `subject.Image3` `subject.#cam_num` and #`subject.CamNum` and `subject.#CamNumber` `subject.#sd_card` #and `subject.SD_Num` and `subject.#SDCardNum`

# Can delete columns `subject.event_num`, `subject.Num`,and `subject.Event`

cols_to_dump <- c("subject.event_num", "subject.Num",  "subject.Event")
subjects <- subjects |>
  select(-all_of(cols_to_dump))

#now work o combining columns with mutate, then getting rid of extra columns

#list extra columns to dump after cleaning up
extra_cols <- c("subject.#round", "subject.!Round",
                "subject.image1", "subject.Image1","subject.image2", "subject.Image2", "subject.image3", "subject.Image3", "subject.#cam_num", "subject.CamNum","subject.#CamNumber", "subject.#sd_card", "subject.SD_Num", "subject.#SDCardNum")

#now do the mutate

subjects <- subjects |>
  mutate(
    deploy_round = coalesce(`subject.#round`, `subject.!Round`),
    image_1 = coalesce(`subject.image1`, `subject.Image1`),
    image_2 = coalesce(`subject.image2`, `subject.Image2`),
    image_3 = coalesce(`subject.image3`, `subject.Image3`),
    cam_number = coalesce(`subject.#cam_num`, `subject.CamNum`, `subject.#CamNumber`),
    sd_number = coalesce(`subject.#sd_card`, `subject.SD_Num`, `subject.#SDCardNum`)
  )

#now get rid of old columns
subjects <- subjects |>
  select(-all_of(extra_cols))

#there are columns we just don't need
dont_need <- c("subject.link", "subject.origin", "subject.license", "subject.image_name", "subject.subject_id", "subject.attribution")

subjects <- subjects |>
  select(-all_of(dont_need))

##Now clean up `cam_number` and `sd_number`

subjects <- subjects |>
  mutate(
    formatted_cam_number = case_when(
      str_starts(cam_number, "C") ~ cam_number,
      as.numeric(cam_number) < 10 ~ paste0("C00", cam_number),
      as.numeric(cam_number) < 100 ~ paste0("C0", cam_number),
      TRUE ~ paste0("C", cam_number)
    ),
    formatted_sd_number = case_when(
      str_starts(sd_number, "SD") ~ sd_number,
      as.numeric(sd_number) < 10 ~ paste0 ("SD00", sd_number),
      as.numeric(sd_number) < 100 ~paste0("SD0", sd_number),
      TRUE ~ paste0("SD", sd_number)
    ),
    cam_sd = paste0(formatted_cam_number, "_", formatted_sd_number)
  )



#subjects<-select(subjects, !c(subject_ids, user_name, workflow_version)) #gets rid of subject_ids, user_name

return(subjects)
}