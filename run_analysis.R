#run_analysis.R

packages <- c('dplyr','data.table')
for(package in packages){
  if(package %in% rownames(installed.packages()) == FALSE){
    install.packages(package)
  }
}
require("dplyr")
require('data.table')


#Download files and extract files:
if(!file.exists('zipped_data.zip')){
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL,"zipped_data.zip")
  unzip('zipped_data.zip')
}

#Load needed tables
x_test <- read.table('./UCI HAR DataSet/test/X_test.txt')
y_test <- read.table('./UCI HAR DataSet/test/y_test.txt')
subject_test <- read.table('./UCI HAR DataSet/test/subject_test.txt')

x_train <- read.table('./UCI HAR DataSet/train/X_train.txt')
y_train <- read.table('./UCI HAR DataSet/train/y_train.txt')
subject_train <- read.table('./UCI HAR DataSet/train/subject_train.txt')

activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt')
features <- read.table('./UCI HAR Dataset/features.txt')


#Add column names
feature_names <- as.character(features[,2])
colnames(x_test) <- feature_names
colnames(x_test) <- make.names(names(x_test),unique=TRUE)
colnames(x_train) <- feature_names
colnames(x_train) <- make.names(names(x_train),unique=TRUE)
colnames(subject_test) <- "Subject_ID"
colnames(subject_train) <- "Subject_ID"
colnames(y_test) <- "Activity_ID"
colnames(y_train) <- "Activity_ID"
colnames(activity_labels) <- c("Activity_ID","Activity_Name")

#Add subject IDs to feature data:
id_x_test <- cbind(x_test,subject_test)
id_x_train <- cbind(x_train,subject_train)


#Add activity IDs to identified feature data:
activity_x_test <- cbind(id_x_test,y_test)
activity_x_train <- cbind(id_x_train,y_train)


#Combine test and train data:
combined_data <- rbind(activity_x_test,activity_x_train)




#Rename variables:
#df <- rename(df, new = old, new2 = old2)

#Create new variables:
#df <- mutate(df, new_v = condition)
name_activity <- function(number){
  if(number == 1){
    x <- "Walking"
  }
  else if(number == 2){
    x <- "Walking_Upstairs"
  }
  else if(number == 3){
    x <- "Walking_Downstairs"
  }
  else if(number == 4){
    x <- "Sitting"
  }
  else if(number == 5){
    x <- "Standing"
  }
  else if(number == 6){
    x <- "Laying"
  }
  else{
    x <- "Unexpected"
  }
  x
}
#combined_data <- mutate(combined_data, Activity_Name = name_activity(Activity_ID))
#combined_data <- merge(combined_data,activity_labels,by="Activity_ID")
#combined_data <- mutate(combined_data, Activity_Name = )
#setDT(combined_data)
#combin
combined_data$Activity_Name <- factor(combined_data$Activity_ID)
levels(combined_data$Activity_Name)[levels(combined_data$Activity_Name) == 1] <- "Walking"
levels(combined_data$Activity_Name)[levels(combined_data$Activity_Name) == 2] <- "Walking_Upstairs"
levels(combined_data$Activity_Name)[levels(combined_data$Activity_Name) == 3] <- "Walking_Downstair=s"
levels(combined_data$Activity_Name)[levels(combined_data$Activity_Name) == 4] <- "Sitting"
levels(combined_data$Activity_Name)[levels(combined_data$Activity_Name) == 5] <- "Standing"
levels(combined_data$Activity_Name)[levels(combined_data$Activity_Name) == 6] <- "Laying"


#Parse table to include only columns dealing with means and std:
columns <- as.character(names(combined_data))
col_to_select <- grep(".mean.|.std.|Subject|Activity_ID|Activity_Name",columns)
parsed_data <- select(combined_data,col_to_select)
parsed_data <- select(parsed_data,-Activity_ID)

#Grouping:levels(combined_data$Activity_Name)[levels(combined_data$Activity_Name) == 1] <- "Walking"
#Group data by subject and activity:
grouped_data <- group_by_(parsed_data, .dots=c("Activity_Name","Subject_ID"))

tidy_data <- summarise_each(grouped_data,funs(mean))



#Save tidy_data as a .txt file:
write.table(tidy_data,"tidy_data.txt",row.name=FALSE)



#%>%

#final <- group_by(parsed_data,Activity_Name)

#summarize_each()