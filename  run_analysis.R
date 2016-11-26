##--------------------------------Brief Project Description-------------------------------##
# This script, run_analysis.R, is part of the "Getting and Cleaning Data Course Project"   #
# from Coursera. It's purpose is to collect, work with, and clean a data set.              #
# This project uses the data available in the next link:                                   #  
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" #
# the output will be a tidy data set, saved in a text file named "tidydata.txt"
##----------------------------------------------------------------------------------------##


##-----------------------------------------------------------------------------------##
# Download (if it is not already in the working directory), unzip and read the files  #
##-----------------------------------------------------------------------------------##
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
path <- file.path("./data/UCI HAR Dataset")
files<-list.files(path, recursive=TRUE)


#read data from the files
data_XTest  <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
data_XTrain <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)
data_YTest  <- read.table(file.path(path, "test" , "y_test.txt" ),header = FALSE)
data_YTrain <- read.table(file.path(path, "train", "y_train.txt"),header = FALSE)
data_SubjectTrain <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
data_SubjectTest  <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)



##---------------------------------------------------------------##
# 1.Merges the training and the test sets to create one data set  #
##---------------------------------------------------------------##
data_Subject <- rbind(data_SubjectTrain, data_SubjectTest)
data_Activity<- rbind(data_YTrain, data_YTest)
data_Features<- rbind(data_XTrain, data_XTest)

#set names to variables
names(data_Subject)<-c("subject")
names(data_Activity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path, "features.txt"),head=FALSE)
names(data_Features)<- dataFeaturesNames$V2

#Merge columns
data_Combine <- cbind(data_Subject, data_Activity)
Data <- cbind(data_Features, data_Combine)


##-----------------------------------------------------------------------------------------##
# 2.Extracts only the measurements on the mean and standard deviation for each measurement  #
##-----------------------------------------------------------------------------------------##
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)


##-------------------------------------------------------------------------##
# 3.Uses descriptive activity names to name the activities in the data set  #
##-------------------------------------------------------------------------##
activityLabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)
Data$activity <- activityLabels[data_Activity[, 1], 2]


##--------------------------------------------------------------------##
# 4.Appropriately labels the data set with descriptive variable names  #
##--------------------------------------------------------------------##
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))


##------------------------------------------------------------------------##
# 5.From the data set in step 4, creates a second, independent tidy data   #
# set with the average of each variable for each activity and each subject #
##------------------------------------------------------------------------##
library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)





