## fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download.file(fileUrl, destfile <- "C:/Users/Desktop/ranganath909/code/GCD", method <- "auto")
## my laptop responded with "permission denied" when i attempted to download these files as per the course lessons
##    so i copied the files to a folder on my laptop and then unzipped (below).

unzip(zipfile <- "C:/Users/Desktop/ranganath909/3_Getting_and_Cleaning_Data/Week_4/Peer-graded Assignment/getdata_projectfiles_UCI HAR Dataset.zip", exdir <- "C:/Users/Janet/Desktop/JHUDS/3_Getting_and_Cleaning_Data/Week_4/Peer-graded Assignment/data")
dateDownloaded <- date()
dateDownloaded   ## the date that the data files were downloaded / unzipped

list.files("C:/Users/Desktop/ranganath909/3_Getting_and_Cleaning_Data/Week_4/Peer-graded Assignment/data/UCI HAR Dataset")

filepathdata <- file.path("C:/Users/Desktop/ranganath909/3_Getting_and_Cleaning_Data/Week_4/Peer-graded Assignment/data", "UCI HAR Dataset")
datafiles <- list.files(filepathdata, recursive=TRUE)
datafiles  ##list the unzipped data files

##  reading in testing files
features_test <- read.table(file.path(filepathdata, "test", "X_test.txt"), header=FALSE)
activity_test <- read.table(file.path(filepathdata, "test", "y_test.txt"), header=FALSE)
subject_test <- read.table(file.path(filepathdata, "test", "subject_test.txt"), header=FALSE)

##  reading in training files
features_train <- read.table(file.path(filepathdata, "train", "X_train.txt"), header=FALSE)
activity_train <- read.table(file.path(filepathdata, "train", "y_train.txt"), header=FALSE)
subject_train <- read.table(file.path(filepathdata, "train", "subject_train.txt"), header=FALSE)


##  reading in activity labels file
activity_labels <- read.table(file.path(filepathdata, "activity_labels.txt"), header=FALSE)

##  reading in features file
features <- read.table(file.path(filepathdata, "features.txt"), header=FALSE)

## 1.  begin merging data (item #1. "Merges the training and the test sets to create one data set.")
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)
features  <- rbind(features_train, features_test)

colnames(features) <- t(features[2])

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
merged_data <- cbind(features, activity, subject)

##  2.  "Extracts only the measurements on the mean and standard deviation for each measurement." 
mean_std_columns <- grep(".*Mean.*|.*Std*", names(merged_data), ignore.case=TRUE)
need_columns <- c(merged_data, 562, 563)
dim(merged_data)

extract_data <- merged_data[,mean_std_columns]
dim(extract_data)

##  3. "Use descriptive activity names to name the activities in the data set."

show_activity_names <- merge(extract_data, activity_labels, all.x=TRUE)

##  4.  "Appropriately labels the data set with descriptive variable names."
names(extract_data) <-gsub ("Acc", "Accelerometer", names(extract_data))
names(extract_data) <-gsub ("Gyro", "Gyroscope", names(extract_data))
names(extract_data) <-gsub ("BodyBody", "Body", names(extract_data))
names(extract_data) <-gsub ("Mag", "Magnitude", names(extract_data))
names(extract_data) <-gsub ("^t", "Time", names(extract_data))
names(extract_data) <-gsub ("^f", "Frequency", names(extract_data))
names(extract_data) <-gsub ("tBody", "TimeBody", names(extract_data))
names(extract_data) <-gsub ("-mean()", "Mean", names(extract_data), ignore.case=TRUE)
names(extract_data) <-gsub ("-std()", "STD", names(extract_data), ignore.case=TRUE)
names(extract_data) <-gsub ("-freq()", "Frequency", names(extract_data), ignore.case=TRUE)
names(extract_data) <-gsub ("angle", "Angle", names(extract_data))
names(extract_data) <-gsub ("gravity", "Gravity", names(extract_data))

##  5. "From the data set in step 4, creates a second, independent tidy data set with the 
##      average of each variable for each activity and each subject."
merged_data$Subject <- as.factor(merged_data$Subject)
merged_data <- data.table(merged_data)

tidy_data <- aggregate(. ~Subject + Activity, merged_data, mean)
tidy_data <- tidy_data[order(tidy_data$Subject,tidy_data$Activity),]
write.table(tidy_data, "Tidy_Data.txt", row.names=FALSE)
