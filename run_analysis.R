library(dplyr)

features <- read.table("C:\\Users\\varsh\\Downloads\\UCI HAR Dataset\\features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("C:\\Users\\varsh\\Downloads\\UCI HAR Dataset\\activity_labels.txt", col.names = c("activityId", "activityName"))

# Training data
subject_train <- read.table("C:\\Users\\varsh\\Downloads\\UCI HAR Dataset\\train\\subject_train.txt", col.names = "subject")
x_train <- read.table("C:\\Users\\varsh\\Downloads\\UCI HAR Dataset\\train\\X_train.txt", col.names = features$feature)
y_train <- read.table("C:\\Users\\varsh\\Downloads\\UCI HAR Dataset\\train\\y_train.txt", col.names = "activityId")

# Test data
subject_test <- read.table("C:\\Users\\varsh\\Downloads\\UCI HAR Dataset\\test\\subject_test.txt", col.names = "subject")
x_test <- read.table("C:\\Users\\varsh\\Downloads\\UCI HAR Dataset\\test\\X_test.txt", col.names = features$feature)
y_test <- read.table("C:\\Users\\varsh\\Downloads\\UCI HAR Dataset\\test\\y_test.txt", col.names = "activityId")

# Combine training and test data
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
data <- rbind(train, test)

columns <- grepl("mean|std|subject|activityId", names(data))
data <- data[, columns]

data <- merge(data, activity_labels, by = "activityId")

names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))

tidy_data <- data %>%
  group_by(subject, activityName) %>%
  summarise(across(everything(), mean, na.rm = TRUE))

# Write the tidy data to a file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)

