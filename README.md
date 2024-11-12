# Human Activity Recognition Using Smartphones - Data Cleaning Project

## Overview
This project processes data collected from the accelerometers of a smartphone, using data from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The dataset includes measurements of subjects performing various activities, which this script cleans and summarizes.

The `run_analysis.R` script performs the following steps:
1. Downloads and unzips the dataset.
2. Loads and selects only the mean and standard deviation measurements.
3. Merges the training and test datasets into one.
4. Adds descriptive activity names and subject IDs.
5. Creates a tidy dataset with the average of each measurement for each activity and subject.

The final tidy dataset is saved as `tidyData.txt`.

## Files
- `run_analysis.R`: The R script that processes the data.
- `tidyData.txt`: The output tidy dataset containing the average of each variable for each activity and subject.
- `CodeBook.md`: A detailed description of each variable in the final dataset.

## Requirements
- R (version 3.6 or higher)
- Packages: `data.table`, `reshape2`

## Usage
1. Place `run_analysis.R` in a working directory in R.
2. Run the script by executing `source("run_analysis.R")`.
3. The output file `tidyData.txt` will be created in the working directory.
