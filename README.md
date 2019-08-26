# Wearable Device Data Analysis (Getting and Cleaning Data Course Project)
## Scope of Function
This function takes modified data from accelerometers and gyroscopes from a wearable device.  The data was transformed from its raw for prior to being fed into this function.  The output should be a table with the means and standard deviations of the various functions sorted by the subject and the activity the subject performed to generate the data.

There is one run_analysis.R file that doesn't require any arguments, but retrieves the data from test and trial datasets, variable names from the features.txt file, subjects from the subject_train.txt file, and activity labels from the activity_labels.txt file.

## Function's Process
1) Merge the training and test datassets into one dataset.
2) Extracts the mean and standard deviation measurements.
3) Add descriptive column names
4) Export dataset with final data

## Variables
There are (66) variables for the final output: (33) for the means and (33) for the standard deviations.

The following information was included with the original dataset for variable definitions:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## Prerequisits
The function was tested on a Windows 10 Pro OS with R version 3.6.1 (64bit).  The function takes training and test dataset data and performs the required operations.

## Export file
The tidy datatable was exported to a CSV using the following command:
write.csv(grouped_data, file = "tidyData.csv")
