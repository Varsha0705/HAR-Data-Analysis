The run_analysis.R script performs the following steps:

1.Load Data: Reads in data from the training and test sets, including feature labels and activity labels.
2.Merge Data: Combines the training and test sets into a single dataset.
3.Extract Required Measurements: Selects only columns representing the mean and standard deviation for each measurement.
4.Use Descriptive Activity Names: Replaces activity IDs with descriptive names, using the activity_labels file.
5.Label Data with Descriptive Variable Names: Renames variables for clarity.
6.Create Tidy Data: Creates a tidy dataset with the average of each measurement for each activity and each subject. The output is saved as tidy_data.txt.
