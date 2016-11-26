# Getting-and-Cleaning-Data-Course-Project

This is the course project for the Getting and Cleaning Data Coursera course. 

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 

The R script, run_analysis.R, does the following:

- Download (if it isn´t already in the working directory), unzip and get the list of files from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Read data from the files and save it into variables
- Merge the training and test data sets to create one data set, concatenating the data tables by rows
- Set names to variables
- Extract measurements on the mean and standard deviation measurements for each measurement 
- Subset the data frame Data by seleted names of Features
- Read descriptive activity names from “activity_labels.txt”
- Factorize the variable activity in the data frame Data using descriptive activity names
- Appropriately labels the data set with descriptive variable names 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject based on the data set in step 4
- The output is shown in the file "tidydata.txt".
