# Getting-and-Cleaning-Data-Course-Project

This is the course project for the Getting and Cleaning Data Coursera course. 

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The R script, run_analysis.R, uses the data available in the following link:                               "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

The main steps of this script are:

- Download (if it isn´t already in the working directory), unzip and get the list of files from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Read data from the files and save it into dataset variables
- Merge the training and test sets to create one big data set.  
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the dataset
- Appropriately label the dataset with descriptive variable names.
- Creates a second, independent tidy dataset with the average of each variable for each activity and each subject.
- The output is stored in a text file named "tidydata.txt".



