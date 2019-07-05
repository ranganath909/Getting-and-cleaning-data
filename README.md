# Getting and Cleaning Data: Assignment

## Step 1: Get Data

I use `download.file` to download the zip file and decompress it when needed.

## Step 2: Merge Datasets

Using guidance from the `features.txt` file, I load all training and test files into R. This includes the features, labels, and subject files. I then load each file one by one, adding the subject and labels as new columns with `cbind`. Once the full test and training datasets are created, we merge them together with `rbind`.

## Step 3: Extract Summaries on Measures

`means` and `stdevs` variables are created for each column in the dataset.

## Step 4: Resolve Activity Names

We dynamically load the activity labels into a data frame and then use `apply` to change each activity number into a human-readable label. This process is repeated for the rest of the 561 feature names. Column names are added manually for `subject` and `activity`.o

## Step 5: Create New Dataset

Using `dplyr` library, we break out each observation into a group based on subject and activity and then we use `summarize_all` to generate averages for each value in the group.

## Conclusion

Once these steps are completed, we are left with 3 variables: `means`, `stdevs`, `df`, and `avg_by_subject_and_activity`.
