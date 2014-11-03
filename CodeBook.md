Following are the variables (columns) in the tidy data set. "subject" is the subject id. "label_name" is name of the activity label. Any variable name containing "mean" in the middle is a variable representing a measurement on the associated mean. Any variable name containing "std" in the middle is a variable representing a measurement on the associated standard deviation. "Body" means body is the source of accleration. "Gravity" means gravity is the source of accleration. "Jerk" means jerk signals. "Gyro" means angular velocity. "f" denotes frequency domains signal. "Mag" is the short for magnitude. All the numeric variables are means of the measurements on the means or standard deviations. 

"subject" 
"label_name"
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"
"tGravityAcc-std()-Z"
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"
"tBodyGyro-std()-Z"
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-mean()"
"tBodyAccMag-std()"
"tGravityAccMag-mean()"
"tGravityAccMag-std()"
"tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()"
"tBodyGyroMag-mean()"
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
"fBodyAccMag-mean()"
"fBodyAccMag-std()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()"

The tidy data set projecttidy_nan.txt that is output from the run_analysis.R code contains 68 columns and 180 rows. Two of the columns are the subject ids and the activitity names. And, the rest are means of measurements on means. 180 rows result from the 30*6=180 unique combinations of subjects and activities. 

Following is the step step transformation of the raw data into the tidy data.

1. Set the working directory and read the raw data files (Step 1)
2. Give column names activity and subject files (Step 1)
3. column bind X, y, and subject; Row bind Train and test (Step 1)
4. Merge data with activity labels (Step 1)
5. Drop the numeric label column (Step 1)
6. Keep the feature names and coerce them as characters (Step 4)
7. Build the variable names vector and assign the names (Step 3, 4)
8. Generate boolean vector based on whether the column name has "mean()" or "std()" in it (Step 2)
9. Subset columns keeping only the mean and standard deviation columns (Step 2)
10. Determine the means of columns for unique combinations of subject and activity labels (Step 5)
11. Write the tidy data set into a file

