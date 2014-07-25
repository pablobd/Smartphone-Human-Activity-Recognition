Smartphone-Human-Activity-Recognition
=====================================

Human Activity Recognition Using Smartphones Data Set
-----------------------------------------------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw data is accessible here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

We will just use the following data files: 
- features.txt
- features_info.txt
- subject_text.txt
- X_test.txt
- X_train.txt
- y_test.txt
- y_train.txt

###Running the R-Script
The script can be run in R after installing the libraries "data.table" and "plyr". If you don´t have these libraries please run the following commands before running the script:
> install.packages("data.table")
> install.packages("plyr")

The script has two outputs:
1. One dataset with training and the test data merged and only the measurements on the mean and standard deviation for each variable: "data_set.txt".
2. 2. The tidy data, a data set with 180 rows and 82 variables (3 are the "subject", "activity_code" and "activity_name"): "tidy_data.txt".

Also find in the "The Code Book" document a list of the variables that contain the tidy data 
