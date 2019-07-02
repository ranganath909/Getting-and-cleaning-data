# Getting-and-Cleaning-Data-Course-Project
Peer-graded Assignment for week 4

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

Review criteria
1.	The submitted data set is tidy. 
2.	The Github repo contains the required scripts.
3.	GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4.	The README that explains the analysis files is clear and understandable.
5.	The work submitted for this project is the work of the student who submitted it.

You should create one R script called run_analysis.R that does the following. 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables included in this project include the following:
features_test:  Test set
activity_test:  Test labels
subject_test:  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
features_train:  Training set
activity_train:  Training labels
subject_train:  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
activity_labels:  Links the class labels with their activity name
features:  Lists all features
subject:  row binds subject_train and  subject_test
activity:  row binds activity_train and activity_test
features:  row binds features_train and  features_test
merged_data:  column binds features, activity and subject
mean_std_columns:  searches for mean and standard deviation matches
show_activity_names:  describes the activity names
tidy_data:  shows a second, independent tidy data set with the average of each variable for each activity and each subject in tidy form
