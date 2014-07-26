#Data Aggregation
  #SUBJECTS
  subjects1 = read.table("~/Desktop/UCI HAR Dataset/test/subject_test.txt")
  subjects2 = read.table("~/Desktop/UCI HAR Dataset/train/subject_train.txt")

  data_table_1 = rbind(subjects1, subjects2)

  library(plyr)
  data_table_1 = rename(data_table_1,c("V1"="subject_id"))

  #ACTIVITIES

  activities1 = read.table("~/Desktop/UCI HAR Dataset/test/y_test.txt")
  activities2 = read.table("~/Desktop/UCI HAR Dataset/train/y_train.txt")
  activities3 = rbind(activities1,activities2)


  data_table_1 = cbind(data_table_1, activities3)
  data_table_1 = rename(data_table_1,c("V1"="activity_id"))

  data_table_1$activity_id[data_table_1$activity_id == 1] <- "WALKING"
  data_table_1$activity_id[data_table_1$activity_id == 2] <- "WALKING_UPSTAIRS"
  data_table_1$activity_id[data_table_1$activity_id == 3] <- "WALKING_DOWNSTAIRS"
  data_table_1$activity_id[data_table_1$activity_id == 4] <- "SITTING"
  data_table_1$activity_id[data_table_1$activity_id == 5] <- "STANDING"
  data_table_1$activity_id[data_table_1$activity_id == 6] <- "LAYING"

  #DATA
  data1 = read.table("~/Desktop/UCI HAR Dataset/test/X_test.txt")
  data2 = read.table("~/Desktop/UCI HAR Dataset/train/X_train.txt")
  data3 = rbind(data1,data2)

#Data Translation
  data_table_1$mean = rowMeans(data3)
  data_table_1$stdev = apply(data3,1,sd)

#Data Reshaping
  library(reshape)
  mdata <- melt(data_table_1, id=c("subject_id","activity_id"))

  reshaped_data <- cast(mdata, subject_id + activity_id~variable, mean)

#Data Outputting
  write.table(reshaped_data, "reshaped_tidy_data.txt", row.names = F)