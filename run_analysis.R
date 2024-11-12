# Load necessary libraries
library(data.table)
library(reshape2)

# Define packages and load them
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only = TRUE, quietly = TRUE)

# Define path and download data file
path <- getwd()
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(data_url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

# Load activity labels and features
activity_labels <- fread(file.path(path, "UCI HAR Dataset/activity_labels.txt"),
                         col.names = c("class_id", "activity_name"))
features <- fread(file.path(path, "UCI HAR Dataset/features.txt"),
                  col.names = c("feature_id", "feature_name"))

# Extract only mean and standard deviation features
selected_features <- grep("(mean|std)\\(\\)", features[, feature_name])
selected_measurements <- features[selected_features, feature_name]
selected_measurements <- gsub('[()]', '', selected_measurements)

# Load and process training data
train_data <- fread(file.path(path, "UCI HAR Dataset/train/X_train.txt"))[, selected_features, with = FALSE]
data.table::setnames(train_data, colnames(train_data), selected_measurements)
train_activities <- fread(file.path(path, "UCI HAR Dataset/train/Y_train.txt"),
                          col.names = c("activity_id"))
train_subjects <- fread(file.path(path, "UCI HAR Dataset/train/subject_train.txt"),
                        col.names = c("subject_id"))
train_data <- cbind(train_subjects, train_activities, train_data)

# Load and process test data
test_data <- fread(file.path(path, "UCI HAR Dataset/test/X_test.txt"))[, selected_features, with = FALSE]
data.table::setnames(test_data, colnames(test_data), selected_measurements)
test_activities <- fread(file.path(path, "UCI HAR Dataset/test/Y_test.txt"),
                         col.names = c("activity_id"))
test_subjects <- fread(file.path(path, "UCI HAR Dataset/test/subject_test.txt"),
                       col.names = c("subject_id"))
test_data <- cbind(test_subjects, test_activities, test_data)

# Merge training and test data
combined_data <- rbind(train_data, test_data)

# Map activity IDs to descriptive activity names
combined_data[["activity_id"]] <- factor(combined_data[, activity_id],
                                         levels = activity_labels[["class_id"]],
                                         labels = activity_labels[["activity_name"]])

combined_data[["subject_id"]] <- as.factor(combined_data[, subject_id])

# Melt and cast data to get the tidy dataset
tidy_data <- reshape2::melt(data = combined_data, id = c("subject_id", "activity_id"))
tidy_data <- reshape2::dcast(data = tidy_data, subject_id + activity_id ~ variable, fun.aggregate = mean)

# Write the tidy dataset to a file
data.table::fwrite(x = tidy_data, file = "tidy_data.txt", quote = FALSE)
