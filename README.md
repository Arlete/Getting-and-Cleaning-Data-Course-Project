# Getting-and-Cleaning-Data-Course-Project

This is the course project for the Getting and Cleaning Data Coursera course. 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 

The R script, run_analysis.R, does the following:

- Download (if it isn´t already in the working directory), unzip and get the list of files from the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Read data from the files and save it into variables
- Merges the training and the test sets to create one data set, concatenating the data tables by rows
- Set names to variables
- Merge columns to get the data frame Data for all data
- Subset Name of Features by measurements on the mean and standard deviation
- Subset the data frame Data by seleted names of Features
- Read descriptive activity names from “activity_labels.txt”
- Factorize the variable activity in the data frame Data using descriptive activity names
- Appropriately labels the data set with descriptive variable names 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject based on the data set in step 4
- The output is shown in the file "tidydata.txt".
