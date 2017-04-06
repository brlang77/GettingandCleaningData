# GettingandCleaningData
# Review criteria
1.  The submitted data set is tidy. 
2.  The Github repo contains the required scripts.
3.  GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4.  The README that explains the analysis files is clear and understandable.
5.  The work submitted for this project is the work of the student who submitted it.

# Programming Assignment Week 4 for Coursera Getting and Cleaning Data
A full description is available at the site where the data was obtained:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

# Repository Contents
1.  run_analysis.R: R code that does the following:
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement. 
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive variable names. 
  - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2.  README.md:  overview of analysis and repository contents
3.  CodeBook.md:  description of two resultant data sets

# Analysis Overview
1.  Merge training/test sets:
    -Training data and reference are merged using cbind function.  Activity descriptions and descriptive field names added here.
    -Test data and reference are merged using cbind function.  Activity descriptions and descriptive field names added here.
    -Resulting Training and Test data are combined using rbind
    -This interim file has duplicate column names but these are dropped when creating the first data set.
2.  Mean/Standard Deviation Data set: output 1
    -Metrics with description of mean or standard deviation are retained (86 metrics)
    -Note that field names may have "Mean" or "mean".
    -There are 89 variables total of which 3 are dimensions (subject, activity, activity_label).
3.  Average of variables from output 1:  output 2
    -All metrics (which were mean or standard deviations), are averaged for each subject and activity:
        -Factors created according to combination of subject and activity (40 factors total)
        -3 dimensions (subject, activity, and activity_label)
        -86 metrics:  average of mean/stdev measurements
