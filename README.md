# Getting-and-Cleaning-Data-Course-Project

This is the course project for the Getting and Cleaning Data Coursera course. 

The purpose of this project is to demonstrate the ability to collect, work with, and clean a dataset. 
The R script, run_analysis.R, uses the data available in the following link:                               "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

The main steps of this script are:

- Download (if it isn´t already in the working directory) the folder from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- unzip the downloaded folder
- Read data from the files to dataset variables. This step uses the read.table() function.
- Merge the files having the same number of columns and referring to the same entities. This step uses the rbind() function. 
- Combine the test and train datasets in a big one dataset. This step uses the cbind() function. 
- Take the columns with the mean and standard deviation measures, and give the names taken from "features.txt" file 
- Label the data set with descriptive activity names using the IDs from "activity_labels.txt" file.
- Create a second, independent tidy dataset with the average of each variable for each activity and each subject.
- Store the tidy data from the previous step in a text file using the write.table() function.
