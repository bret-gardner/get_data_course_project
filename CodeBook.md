#CodeBook.md
##Description of Variables
###Variable Names
Variables' names were changed to ensure all names were unique using the make.names() function.  This eliminated any illegal characters, such as "-" and "()" and trailing digits.
t indicates time while f indicates frequency.
Variables are grouped as either relative to the body or relative to gravity.
Measures were taken either from the accelerometer or from thy gyroscope.
Measures were taken relative to the x, y, or z planes.
Please refer to the features.txt file for specific details on rate of measure, length of measure, and cancellation of noise.
###Variables
* Activity_Name  - Description of activity subject was performing when measurements were taken.  The 6 possible activities include:
    * Walking
    * Walking_Upstairs
    * Walking_Downstairs
    * Sitting
    * Standing
    * Laying
* Subject_ID - Unique identifier for each subject (1-30)
* Accelerometer and Gyroscope Measures   - Details regarding how the raw data was collected and modified may be found in the features.txt file available with all of the raw data.  The tidy_data.txt file contains only those variables taht represented the mean and standard deviations of the raw data for these variables.  The tidy_data.txt includes the mean of these selected variables for each subject for each activity.
    * tBodyAcc.mean...X
    * tBodyAcc.mean...Y
    * tBodyAcc.mean...Z
    * tBodyAcc.std...X
    * tBodyAcc.std...Y
    * tBodyAcc.std...Z
    * tGravityAcc.mean...X
    * tGravityAcc.mean...Y
    * tGravityAcc.mean...Z
    * tGravityAcc.std...X
    * tGravityAcc.std...Y
    * tGravityAcc.std...Z
    * tBodyAccJerk.mean...X
    * tBodyAccJerk.mean...Y
    * tBodyAccJerk.mean...Z
    * tBodyAccJerk.std...X
    * tBodyAccJerk.std...Y
    * tBodyAccJerk.std...Z
    * tBodyGyro.mean...X
    * tBodyGyro.mean...Y
    * tBodyGyro.mean...Z
    * tBodyGyro.std...X
    * tBodyGyro.std...Y
    * tBodyGyro.std...Z
    * tBodyGyroJerk.mean...X
    * tBodyGyroJerk.mean...Y
    * tBodyGyroJerk.mean...Z
    * tBodyGyroJerk.std...X
    * tBodyGyroJerk.std...Y
    * tBodyGyroJerk.std...Z
    * tBodyAccMag.mean..
    * tBodyAccMag.std..
    * tGravityAccMag.mean..
    * tGravityAccMag.std..
    * tBodyAccJerkMag.mean..
    * tBodyAccJerkMag.std..
    * tBodyGyroMag.mean..
    * tBodyGyroMag.std..
    * tBodyGyroJerkMag.mean..
    * tBodyGyroJerkMag.std..
    * fBodyAcc.mean...X
    * fBodyAcc.mean...Y
    * fBodyAcc.mean...Z
    * fBodyAcc.std...X
    * fBodyAcc.std...Y
    * fBodyAcc.std...Z
    * fBodyAcc.meanFreq...X
    * fBodyAcc.meanFreq...Y
    * fBodyAcc.meanFreq...Z
    * fBodyAccJerk.mean...X
    * fBodyAccJerk.mean...Y
    * fBodyAccJerk.mean...Z
    * fBodyAccJerk.std...X
    * fBodyAccJerk.std...Y
    * fBodyAccJerk.std...Z
    * fBodyAccJerk.meanFreq...X
    * fBodyAccJerk.meanFreq...Y
    * fBodyAccJerk.meanFreq...Z
    * fBodyGyro.mean...X
    * fBodyGyro.mean...Y
    * fBodyGyro.mean...Z
    * fBodyGyro.std...X
    * fBodyGyro.std...Y
    * fBodyGyro.std...Z
    * fBodyGyro.meanFreq...X
    * fBodyGyro.meanFreq...Y
    * fBodyGyro.meanFreq...Z
    * fBodyAccMag.mean..
    * fBodyAccMag.std..
    * fBodyAccMag.meanFreq..
    * fBodyBodyAccJerkMag.mean..
    * fBodyBodyAccJerkMag.std..
    * fBodyBodyAccJerkMag.meanFreq..
    * fBodyBodyGyroMag.mean..
    * fBodyBodyGyroMag.std..
    * fBodyBodyGyroMag.meanFreq..
    * fBodyBodyGyroJerkMag.mean..
    * fBodyBodyGyroJerkMag.std..
    * fBodyBodyGyroJerkMag.meanFreq..

##Description of Data
###tidy_data.txt
The tidy_data.txt file contains 1 row for each subject for each activity (= 30 subjects x 6 activities = 180 rows).
This data set is separated by spaces "".  
This data set contains the means of 79 different variables computed for each subject for each activity.  Each variable is unqiue and represented in a single column per variable.


##Description of Data Manipulation
I will not discuss manipulations that were performed on the raw data prior to it being made availalbe for analysis.  For this information, please refer to the features_info.txt file.
From the normalized data provided, I read the data into R using the read.table() function for all portions of the data.
Column names were added to the data in a descriptive fashion.
Using cbind() I added the normalized data to the subject id data for both the test and train groups.
In a similar fashion, the activity id was then added to this data.
Next, the test and train groups linked to their sujbect and activity ids were combined with rbind().
Next, the activity name was specified based on the activity id as described in the variables above.
using the grep function, only those columns dealing with mean or std were selected.
The data was next grouped by subject and activity.
Finally, for this grouped data, the mean for each variable within each group was calculated an the resultant data frame was saved as tidy_data.txt.

