library(dplyr)

destfile <- "data.zip"
if(!file.exists(destfile)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="data.zip")
}

if(!file.exists("UCI HAR Dataset/README.txt")) {
  unzip(destfile)
}

rm(destfile)

nlimit <- -1
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", nrows=nlimit)
trainX <- read.table("UCI HAR Dataset/train/X_train.txt", nrows=nlimit)
trainY <- read.table("UCI HAR Dataset/train/y_train.txt", nrows=nlimit)
trainDf <- cbind(trainX, trainSubject, trainY)

testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", nrows=nlimit)
testX <- read.table("UCI HAR Dataset/test/X_test.txt", nrows=nlimit)
testY <- read.table("UCI HAR Dataset/test/y_test.txt", nrows=nlimit)
testDf <- cbind(testX, testSubject, testY)

df <- rbind(testDf, trainDf)

# Housekeeping
rm(nlimit, trainSubject, trainX, trainY, testSubject, testX, testY, testDf, trainDf)

means = sapply(df[1:561], mean)
stdevs = sapply(df[1:561], sd)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
df[563] <- apply(df[563], 1, function(idx) { activity_labels[[idx,2]] } )

feature_labels <- read.table("UCI HAR Dataset/features.txt")
names(df) = feature_labels[,2]
names(df)[562:563] <- c("subject", "activity")

# More housekeeping
rm(feature_labels, activity_labels)

# As of dplyr 8.1, tbl_df is deprecated in favor of as_tibble.
# Name repair is necessary for chars such as '(', ')', and '-'.
df <- as_tibble(df, .name_repair = "universal")
avg_by_subject_and_activity <- df %>%
  group_by(subject, activity) %>%
  summarize_all(funs(mean))