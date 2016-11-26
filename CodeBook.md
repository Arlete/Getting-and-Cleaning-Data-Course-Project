This is a code book that describes the data, the variables and the steps taken to clean up the data and create an independent tidy dataset.

THE DATA SOURCE

    Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
    Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

DATASET INFORMATION

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers represent the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- The activity label. 
- An identifier of the subject who carried out the experiment.

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


GETTING AND CLEANING UP THE DATA

The getting and cleaning data is performed in 6 main steps:

    1.Download and get the data.
    2.Merges the training and the test sets to create one big data set.  
    3.Extracts only the measurements on the mean and standard deviation for each measurement.
    4.Uses descriptive activity names to name the activities in the data set
    5.Appropriately labels the data set with descriptive variable names.
    6.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


R SCRIPT (run_analysis.R)

The script run_analysis.R performs the 6 steps described above.

     This script downloads the zip folder (a total of 59.7 MB) from the internet, and saves it in the RStudio's working directory.
    After unzipping the downloaded folder, all the similar data (files having the same number of columns and referring to the same entities) is merged using the rbind() function. 
    The test and train data are then combined in a whole dataset using the cbind() fucntion. Afterwards, only the columns with the mean and standard deviation measures are taken from the whole dataset. 
    After extracting the relevant columns, they are given the names taken from "features.txt" file.
    IDs from "activity_labels.txt" file were used to approppriately label the data set with descriptive activity names.
    To finish, an independent tidy data set is generated containing all the average measures for each subject and activity type (180 rows). 

Main Variables
 
    data: a folder created in the RStudio working directory to save the downloaded files.
    fileUrl: the link to access the input files.
    path: the unzipped files location.
    files: variable containing the list of input files.
    data_XTest, data_XTrain, data_SubjectTrain, data_YTest, data_YTrain, data_SubjectTest: datasets containing the testing and training data read from the input files.
    data_Subject: dataset resulting from merging the data_SubjectTrain and data_SubjectTest.
    data_Activity: dataset resulting from merging the data_YTrain and data_YTest.
    data_Features: dataset resulting from merging the data_XTrain and data_XTest.
    Data: data set resulting from merging the data_Features, data_Activity and data_Subject.
    dataFeaturesNames: dataset with the correct names for the data_Features dataset.
    activityLabels: dataset with the activity names for the data_Activity dataset.
    TidyData: dataset containing the average of each variable for each activity and each subject.
    
 Output
 The TidyData dataset was stored in the "tidydata.txt" file which is also available in this repository.


