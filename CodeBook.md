1. Dataset Overview
The dataset in this project comes from the UCI Human Activity Recognition (HAR) study using smartphones. It includes data collected from the accelerometers on a Samsung Galaxy S smartphone. The goal of this project is to process, clean, and create a tidy dataset for future analysis.

2. Variables
The final tidy dataset contains the following variables:

subject: ID of the participant in the study (1 to 30).
activityName: The activity being performed, with descriptive labels:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING
Each of the following variables represents the mean of a measurement for each subject and each activity. These variables are normalized and bounded within [-1, 1].

3. Measurement Variables
The variables below were extracted as they represent the mean and standard deviation for each measurement. Each variable includes either mean() or std() to indicate whether it is a mean or standard deviation calculation.

Examples include:

TimeBodyAccelerometer-mean()-X: Mean of body acceleration signal along X-axis.
TimeBodyAccelerometer-std()-Y: Standard deviation of body acceleration signal along Y-axis.
FrequencyBodyGyroscope-mean()-Z: Mean of body gyroscope signal along Z-axis.
Note: For clarity, the variable names were modified as follows:

Prefix t was changed to Time (e.g., tBodyAcc-mean()-X → TimeBodyAccelerometer-mean()-X).
Prefix f was changed to Frequency.
Acc was expanded to Accelerometer.
Gyro was expanded to Gyroscope.
Mag was expanded to Magnitude.
4. Transformations and Cleaning Steps
The following steps were performed to create the tidy dataset:

Merging Data: Combined the training and test sets to form one dataset.
Extracting Measurements: Selected only columns with mean and standard deviation measurements.
Adding Descriptive Activity Names: Merged with activity labels to use descriptive names.
Labeling Variables: Cleaned up variable names for readability.
Creating the Final Tidy Dataset: Created a summary dataset with the average of each variable for each activity and each subject.
