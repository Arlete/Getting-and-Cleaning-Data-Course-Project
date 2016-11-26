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
    
 summary(Data2)
 subject                   activity  timeBodyAccelerometer-mean()-X
 Min.   : 1.0   LAYING            :30   Min.   :0.2216                
 1st Qu.: 8.0   SITTING           :30   1st Qu.:0.2712                
 Median :15.5   STANDING          :30   Median :0.2770                
 Mean   :15.5   WALKING           :30   Mean   :0.2743                
 3rd Qu.:23.0   WALKING_DOWNSTAIRS:30   3rd Qu.:0.2800                
 Max.   :30.0   WALKING_UPSTAIRS  :30   Max.   :0.3015                
 timeBodyAccelerometer-mean()-Y timeBodyAccelerometer-mean()-Z timeBodyAccelerometer-std()-X
 Min.   :-0.040514              Min.   :-0.15251               Min.   :-0.9961              
 1st Qu.:-0.020022              1st Qu.:-0.11207               1st Qu.:-0.9799              
 Median :-0.017262              Median :-0.10819               Median :-0.7526              
 Mean   :-0.017876              Mean   :-0.10916               Mean   :-0.5577              
 3rd Qu.:-0.014936              3rd Qu.:-0.10443               3rd Qu.:-0.1984              
 Max.   :-0.001308              Max.   :-0.07538               Max.   : 0.6269              
 timeBodyAccelerometer-std()-Y timeBodyAccelerometer-std()-Z timeGravityAccelerometer-mean()-X
 Min.   :-0.99024              Min.   :-0.9877               Min.   :-0.6800                  
 1st Qu.:-0.94205              1st Qu.:-0.9498               1st Qu.: 0.8376                  
 Median :-0.50897              Median :-0.6518               Median : 0.9208                  
 Mean   :-0.46046              Mean   :-0.5756               Mean   : 0.6975                  
 3rd Qu.:-0.03077              3rd Qu.:-0.2306               3rd Qu.: 0.9425                  
 Max.   : 0.61694              Max.   : 0.6090               Max.   : 0.9745                  
 timeGravityAccelerometer-mean()-Y timeGravityAccelerometer-mean()-Z
 Min.   :-0.47989                  Min.   :-0.49509                 
 1st Qu.:-0.23319                  1st Qu.:-0.11726                 
 Median :-0.12782                  Median : 0.02384                 
 Mean   :-0.01621                  Mean   : 0.07413                 
 3rd Qu.: 0.08773                  3rd Qu.: 0.14946                 
 Max.   : 0.95659                  Max.   : 0.95787                 
 timeGravityAccelerometer-std()-X timeGravityAccelerometer-std()-Y timeGravityAccelerometer-std()-Z
 Min.   :-0.9968                  Min.   :-0.9942                  Min.   :-0.9910                 
 1st Qu.:-0.9825                  1st Qu.:-0.9711                  1st Qu.:-0.9605                 
 Median :-0.9695                  Median :-0.9590                  Median :-0.9450                 
 Mean   :-0.9638                  Mean   :-0.9524                  Mean   :-0.9364                 
 3rd Qu.:-0.9509                  3rd Qu.:-0.9370                  3rd Qu.:-0.9180                 
 Max.   :-0.8296                  Max.   :-0.6436                  Max.   :-0.6102                 
 timeBodyAccelerometerJerk-mean()-X timeBodyAccelerometerJerk-mean()-Y
 Min.   :0.04269                    Min.   :-0.0386872                
 1st Qu.:0.07396                    1st Qu.: 0.0004664                
 Median :0.07640                    Median : 0.0094698                
 Mean   :0.07947                    Mean   : 0.0075652                
 3rd Qu.:0.08330                    3rd Qu.: 0.0134008                
 Max.   :0.13019                    Max.   : 0.0568186                
 timeBodyAccelerometerJerk-mean()-Z timeBodyAccelerometerJerk-std()-X
 Min.   :-0.067458                  Min.   :-0.9946                  
 1st Qu.:-0.010601                  1st Qu.:-0.9832                  
 Median :-0.003861                  Median :-0.8104                  
 Mean   :-0.004953                  Mean   :-0.5949                  
 3rd Qu.: 0.001958                  3rd Qu.:-0.2233                  
 Max.   : 0.038053                  Max.   : 0.5443                  
 timeBodyAccelerometerJerk-std()-Y timeBodyAccelerometerJerk-std()-Z timeBodyGyroscope-mean()-X
 Min.   :-0.9895                   Min.   :-0.99329                  Min.   :-0.20578          
 1st Qu.:-0.9724                   1st Qu.:-0.98266                  1st Qu.:-0.04712          
 Median :-0.7756                   Median :-0.88366                  Median :-0.02871          
 Mean   :-0.5654                   Mean   :-0.73596                  Mean   :-0.03244          
 3rd Qu.:-0.1483                   3rd Qu.:-0.51212                  3rd Qu.:-0.01676          
 Max.   : 0.3553                   Max.   : 0.03102                  Max.   : 0.19270          
 timeBodyGyroscope-mean()-Y timeBodyGyroscope-mean()-Z timeBodyGyroscope-std()-X
 Min.   :-0.20421           Min.   :-0.07245           Min.   :-0.9943          
 1st Qu.:-0.08955           1st Qu.: 0.07475           1st Qu.:-0.9735          
 Median :-0.07318           Median : 0.08512           Median :-0.7890          
 Mean   :-0.07426           Mean   : 0.08744           Mean   :-0.6916          
 3rd Qu.:-0.06113           3rd Qu.: 0.10177           3rd Qu.:-0.4414          
 Max.   : 0.02747           Max.   : 0.17910           Max.   : 0.2677          
 timeBodyGyroscope-std()-Y timeBodyGyroscope-std()-Z timeBodyGyroscopeJerk-mean()-X
 Min.   :-0.9942           Min.   :-0.9855           Min.   :-0.15721              
 1st Qu.:-0.9629           1st Qu.:-0.9609           1st Qu.:-0.10322              
 Median :-0.8017           Median :-0.8010           Median :-0.09868              
 Mean   :-0.6533           Mean   :-0.6164           Mean   :-0.09606              
 3rd Qu.:-0.4196           3rd Qu.:-0.3106           3rd Qu.:-0.09110              
 Max.   : 0.4765           Max.   : 0.5649           Max.   :-0.02209              
 timeBodyGyroscopeJerk-mean()-Y timeBodyGyroscopeJerk-mean()-Z timeBodyGyroscopeJerk-std()-X
 Min.   :-0.07681               Min.   :-0.092500              Min.   :-0.9965              
 1st Qu.:-0.04552               1st Qu.:-0.061725              1st Qu.:-0.9800              
 Median :-0.04112               Median :-0.053430              Median :-0.8396              
 Mean   :-0.04269               Mean   :-0.054802              Mean   :-0.7036              
 3rd Qu.:-0.03842               3rd Qu.:-0.048985              3rd Qu.:-0.4629              
 Max.   :-0.01320               Max.   :-0.006941              Max.   : 0.1791              
 timeBodyGyroscopeJerk-std()-Y timeBodyGyroscopeJerk-std()-Z timeBodyAccelerometerMagnitude-mean()
 Min.   :-0.9971               Min.   :-0.9954               Min.   :-0.9865                      
 1st Qu.:-0.9832               1st Qu.:-0.9848               1st Qu.:-0.9573                      
 Median :-0.8942               Median :-0.8610               Median :-0.4829                      
 Mean   :-0.7636               Mean   :-0.7096               Mean   :-0.4973                      
 3rd Qu.:-0.5861               3rd Qu.:-0.4741               3rd Qu.:-0.0919                      
 Max.   : 0.2959               Max.   : 0.1932               Max.   : 0.6446                      
 timeBodyAccelerometerMagnitude-std() timeGravityAccelerometerMagnitude-mean()
 Min.   :-0.9865                      Min.   :-0.9865                         
 1st Qu.:-0.9430                      1st Qu.:-0.9573                         
 Median :-0.6074                      Median :-0.4829                         
 Mean   :-0.5439                      Mean   :-0.4973                         
 3rd Qu.:-0.2090                      3rd Qu.:-0.0919                         
 Max.   : 0.4284                      Max.   : 0.6446                         
 timeGravityAccelerometerMagnitude-std() timeBodyAccelerometerJerkMagnitude-mean()
 Min.   :-0.9865                         Min.   :-0.9928                          
 1st Qu.:-0.9430                         1st Qu.:-0.9807                          
 Median :-0.6074                         Median :-0.8168                          
 Mean   :-0.5439                         Mean   :-0.6079                          
 3rd Qu.:-0.2090                         3rd Qu.:-0.2456                          
 Max.   : 0.4284                         Max.   : 0.4345                          
 timeBodyAccelerometerJerkMagnitude-std() timeBodyGyroscopeMagnitude-mean()
 Min.   :-0.9946                          Min.   :-0.9807                  
 1st Qu.:-0.9765                          1st Qu.:-0.9461                  
 Median :-0.8014                          Median :-0.6551                  
 Mean   :-0.5842                          Mean   :-0.5652                  
 3rd Qu.:-0.2173                          3rd Qu.:-0.2159                  
 Max.   : 0.4506                          Max.   : 0.4180                  
 timeBodyGyroscopeMagnitude-std() timeBodyGyroscopeJerkMagnitude-mean()
 Min.   :-0.9814                  Min.   :-0.99732                     
 1st Qu.:-0.9476                  1st Qu.:-0.98515                     
 Median :-0.7420                  Median :-0.86479                     
 Mean   :-0.6304                  Mean   :-0.73637                     
 3rd Qu.:-0.3602                  3rd Qu.:-0.51186                     
 Max.   : 0.3000                  Max.   : 0.08758                     
 timeBodyGyroscopeJerkMagnitude-std() frequencyBodyAccelerometer-mean()-X
 Min.   :-0.9977                      Min.   :-0.9952                    
 1st Qu.:-0.9805                      1st Qu.:-0.9787                    
 Median :-0.8809                      Median :-0.7691                    
 Mean   :-0.7550                      Mean   :-0.5758                    
 3rd Qu.:-0.5767                      3rd Qu.:-0.2174                    
 Max.   : 0.2502                      Max.   : 0.5370                    
 frequencyBodyAccelerometer-mean()-Y frequencyBodyAccelerometer-mean()-Z
 Min.   :-0.98903                    Min.   :-0.9895                    
 1st Qu.:-0.95361                    1st Qu.:-0.9619                    
 Median :-0.59498                    Median :-0.7236                    
 Mean   :-0.48873                    Mean   :-0.6297                    
 3rd Qu.:-0.06341                    3rd Qu.:-0.3183                    
 Max.   : 0.52419                    Max.   : 0.2807                    
 frequencyBodyAccelerometer-std()-X frequencyBodyAccelerometer-std()-Y
 Min.   :-0.9966                    Min.   :-0.99068                  
 1st Qu.:-0.9820                    1st Qu.:-0.94042                  
 Median :-0.7470                    Median :-0.51338                  
 Mean   :-0.5522                    Mean   :-0.48148                  
 3rd Qu.:-0.1966                    3rd Qu.:-0.07913                  
 Max.   : 0.6585                    Max.   : 0.56019                  
 frequencyBodyAccelerometer-std()-Z frequencyBodyAccelerometerJerk-mean()-X
 Min.   :-0.9872                    Min.   :-0.9946                        
 1st Qu.:-0.9459                    1st Qu.:-0.9828                        
 Median :-0.6441                    Median :-0.8126                        
 Mean   :-0.5824                    Mean   :-0.6139                        
 3rd Qu.:-0.2655                    3rd Qu.:-0.2820                        
 Max.   : 0.6871                    Max.   : 0.4743                        
 frequencyBodyAccelerometerJerk-mean()-Y frequencyBodyAccelerometerJerk-mean()-Z
 Min.   :-0.9894                         Min.   :-0.9920                        
 1st Qu.:-0.9725                         1st Qu.:-0.9796                        
 Median :-0.7817                         Median :-0.8707                        
 Mean   :-0.5882                         Mean   :-0.7144                        
 3rd Qu.:-0.1963                         3rd Qu.:-0.4697                        
 Max.   : 0.2767                         Max.   : 0.1578                        
 frequencyBodyAccelerometerJerk-std()-X frequencyBodyAccelerometerJerk-std()-Y
 Min.   :-0.9951                        Min.   :-0.9905                       
 1st Qu.:-0.9847                        1st Qu.:-0.9737                       
 Median :-0.8254                        Median :-0.7852                       
 Mean   :-0.6121                        Mean   :-0.5707                       
 3rd Qu.:-0.2475                        3rd Qu.:-0.1685                       
 Max.   : 0.4768                        Max.   : 0.3498                       
 frequencyBodyAccelerometerJerk-std()-Z frequencyBodyGyroscope-mean()-X
 Min.   :-0.993108                      Min.   :-0.9931                
 1st Qu.:-0.983747                      1st Qu.:-0.9697                
 Median :-0.895121                      Median :-0.7300                
 Mean   :-0.756489                      Mean   :-0.6367                
 3rd Qu.:-0.543787                      3rd Qu.:-0.3387                
 Max.   :-0.006236                      Max.   : 0.4750                
 frequencyBodyGyroscope-mean()-Y frequencyBodyGyroscope-mean()-Z frequencyBodyGyroscope-std()-X
 Min.   :-0.9940                 Min.   :-0.9860                 Min.   :-0.9947               
 1st Qu.:-0.9700                 1st Qu.:-0.9624                 1st Qu.:-0.9750               
 Median :-0.8141                 Median :-0.7909                 Median :-0.8086               
 Mean   :-0.6767                 Mean   :-0.6044                 Mean   :-0.7110               
 3rd Qu.:-0.4458                 3rd Qu.:-0.2635                 3rd Qu.:-0.4813               
 Max.   : 0.3288                 Max.   : 0.4924                 Max.   : 0.1966               
 frequencyBodyGyroscope-std()-Y frequencyBodyGyroscope-std()-Z
 Min.   :-0.9944                Min.   :-0.9867               
 1st Qu.:-0.9602                1st Qu.:-0.9643               
 Median :-0.7964                Median :-0.8224               
 Mean   :-0.6454                Mean   :-0.6577               
 3rd Qu.:-0.4154                3rd Qu.:-0.3916               
 Max.   : 0.6462                Max.   : 0.5225               
 frequencyBodyAccelerometerMagnitude-mean() frequencyBodyAccelerometerMagnitude-std()
 Min.   :-0.9868                            Min.   :-0.9876                          
 1st Qu.:-0.9560                            1st Qu.:-0.9452                          
 Median :-0.6703                            Median :-0.6513                          
 Mean   :-0.5365                            Mean   :-0.6210                          
 3rd Qu.:-0.1622                            3rd Qu.:-0.3654                          
 Max.   : 0.5866                            Max.   : 0.1787                          
 frequencyBodyAccelerometerJerkMagnitude-mean() frequencyBodyAccelerometerJerkMagnitude-std()
 Min.   :-0.9940                                Min.   :-0.9944                              
 1st Qu.:-0.9770                                1st Qu.:-0.9752                              
 Median :-0.7940                                Median :-0.8126                              
 Mean   :-0.5756                                Mean   :-0.5992                              
 3rd Qu.:-0.1872                                3rd Qu.:-0.2668                              
 Max.   : 0.5384                                Max.   : 0.3163                              
 frequencyBodyGyroscopeMagnitude-mean() frequencyBodyGyroscopeMagnitude-std()
 Min.   :-0.9865                        Min.   :-0.9815                      
 1st Qu.:-0.9616                        1st Qu.:-0.9488                      
 Median :-0.7657                        Median :-0.7727                      
 Mean   :-0.6671                        Mean   :-0.6723                      
 3rd Qu.:-0.4087                        3rd Qu.:-0.4277                      
 Max.   : 0.2040                        Max.   : 0.2367                      
 frequencyBodyGyroscopeJerkMagnitude-mean() frequencyBodyGyroscopeJerkMagnitude-std()
 Min.   :-0.9976                            Min.   :-0.9976                          
 1st Qu.:-0.9813                            1st Qu.:-0.9802                          
 Median :-0.8779                            Median :-0.8941                          
 Mean   :-0.7564                            Mean   :-0.7715                          
 3rd Qu.:-0.5831                            3rd Qu.:-0.6081                          
 Max.   : 0.1466                            Max.   : 0.2878     

 Output
 The output of this R script is the tidydata.txt file taht contains the tidy data set stored in Data2 variable.


