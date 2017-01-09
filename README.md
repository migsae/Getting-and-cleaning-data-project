# Getting-and-cleaning-data-project
Course Project Requirements:
1 Merges the training and the test sets to create one data set.
2 Extracts only the measurements on the mean and standard deviation for each measurement.
3 Uses descriptive activity names to name the activities in the data set
4 Appropriately labels the data set with descriptive variable names.
5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Running the code:
Set working directory to ./getdata 2Fprojectfiles 2FUCI HAR Dataset/UCI HAR Dataset
Run run_analysis.R, this will generate file tidy_dataset.csv

Code description:
1- Merge train and test dataset: 
 1.1- Create variables using read.table
 1.2- Combine subject,y,x data
 1.3- Combine train and test
 
 2- Extract mean and standard deviations 
 
 3- Create activity based on description
 
 4- Use tidy to orginize data
