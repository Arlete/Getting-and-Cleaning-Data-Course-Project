This is a code book that describes the variables, the data, and the transformations/work performed to clean up the data and create an independent tidy data set.

THE DATA SOURCE:

    Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
    Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

DATA SET INFORMATION:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
The data

The dataset includes the following files:

    - README.txt
    - features_info.txt: Shows information about the variables used on the feature vector.
    - features.txt: List of all features.
    - activity_labels.txt: Links the class labels with their activity name.
    - A train folder that contains:
     . 'X_train.txt': Training set
     . 'y_train.txt': Training labels
     . 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
     . 'Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
     . 'Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
     . 'Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
    - A test folder that contains:
     . 'X_test.txt': Test set
     . 'y_test.txt': Test labels
     . 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
     . 'Inertial Signals/total_acc_x_test.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
     . 'Inertial Signals/body_acc_x_test.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
     . 'Inertial Signals/body_gyro_x_test.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


 TRANSFORMATION DETAILS:

The transformation details step includes 5 topics:

    1.Merges the training and the test sets to create one data set.  
    2.Extracts only the measurements on the mean and standard deviation for each measurement.
    3.Uses descriptive activity names to name the activities in the data set
    4.Appropriately labels the data set with descriptive activity names.
    5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


R SCRIPT (run_analysis.R):

The script run_analysis.R performs the 5 steps described in the course project's definition.

     First, this script allows to download the zip folder (a total of 59.7 MB) from its internet location, and save it in a folder created at RStudio's working directory.
    After unzip the download folder, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities. Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. 
    After extracting the relevant columns, they are given the correct names taken from features.txt.
    IDs from activity_labels.txt were used the approppriately lables the data set with descriptive activity names.
    Finally, we generate a new tidy data set with all the average measures for each subject and activity type (180 rows). The output file is called "tidydata.txt", and uploaded to this repository.

Main Variables
 
    data: A folder created in the RStudio Working directory to save the downloaded files.
    fileUrl: the link to access the input files.
    path: describes the folder with unzip input files.
    files: variable containing the list of files download from the internet.
    data_XTest, data_YTest, data_XTrain, data_YTrain, data_SubjectTest: contain the testing and training data from the downloaded files
    data_Subject: merges the data_SubjectTrain and data_SubjectTest.
    data_Activity: merges the data_YTrain and data_YTest.
    data_Features: merges the data_XTrain and data_XTest.
    dataFeaturesNames: contains the correct names for the data_Features dataset.
    activityLabels: contains the activity names for the data_activity dataset.
    Data: merges data_Features, data_Activity and data_Subject.
    Data2: contains the tidy data set with the average of each variable for each activity and each subject.
    
 Output
 The output of this R script is the tidydata.txt file taht contains the tidy data set stored in Data2 variable.


