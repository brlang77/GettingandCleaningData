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

# R script for this analysis is called "run_analysis.R" that does the following:
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. From
5.  The data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#  Overview of Analysis
- Read source tables for training, test, and reference data.
  - 'features.txt': List of all features.
  - 'activity_labels.txt': Links the class labels with their activity name.
  - 'train/X_train.txt': Training set.
  - 'train/y_train.txt': Training labels.
  - 'test/X_test.txt': Test set.
  - 'test/y_test.txt': Test labels.
  - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
-  Merge test data to add acti
