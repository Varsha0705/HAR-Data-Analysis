# Code Book for Tidy Data

This code book describes the variables in `tidyData.txt`, which contains the cleaned and summarized data for the Human Activity Recognition project.

## Identifiers
- **subject_id**: Identifier for each subject who performed the activity (range: 1 to 30).
- **activity_id**: Descriptive name of the activity performed, with six possible activities:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

## Measurements
Each of the following variables represents the mean of measurements taken across multiple samples for each `subject_id` and `activity_id`.

The variables in the dataset are derived from the original sensor data, where measurements represent mean and standard deviation values for specific signals. The variables are named with the prefix `time` or `frequency` to denote the type of signal (time-domain or frequency-domain).

### Variable Names
- **timeBodyAcc-mean-X**: Mean of time-domain body acceleration in the X direction.
- **timeBodyAcc-mean-Y**: Mean of time-domain body acceleration in the Y direction.
- **timeBodyAcc-mean-Z**: Mean of time-domain body acceleration in the Z direction.
- **timeBodyAcc-std-X**: Standard deviation of time-domain body acceleration in the X direction.
- **timeBodyAcc-std-Y**: Standard deviation of time-domain body acceleration in the Y direction.
- **timeBodyAcc-std-Z**: Standard deviation of time-domain body acceleration in the Z direction.
- **frequencyBodyAcc-mean-X**: Mean of frequency-domain body acceleration in the X direction.
- **frequencyBodyAcc-mean-Y**: Mean of frequency-domain body acceleration in the Y direction.
- **frequencyBodyAcc-mean-Z**: Mean of frequency-domain body acceleration in the Z direction.
- **frequencyBodyAcc-std-X**: Standard deviation of frequency-domain body acceleration in the X direction.
- **frequencyBodyAcc-std-Y**: Standard deviation of frequency-domain body acceleration in the Y direction.
- **frequencyBodyAcc-std-Z**: Standard deviation of frequency-domain body acceleration in the Z direction.

_(This list includes only a sample of the variables; the complete dataset includes similar measurements for other signals like BodyGyro and GravityAcc)_

Each variable represents the mean value of the corresponding measurement across multiple readings for each `subject_id` and `activity_id`.

## Additional Information
This dataset contains only the mean and standard deviation measurements from the original dataset. For more information on the source data, refer to the UCI HAR Dataset documentation [here](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
