## Coursera Getting and Cleaning Data Week 4 Assignment
##  April 14, 2017
##  Author:  github brlang77


##Download Fitness Tracker Data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setwd("~/Coursera/Getting and Reading Data")
download.file(url,"week4.zip")
dateDownloaded<- date()
unzip("week4.zip")

##Read reference tables
activity_label<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

##Read training data sets
y_train<-read.table("./UCI HAR Dataset/Train/y_train.txt")  ##training labels
x_train<-read.table("./UCI HAR Dataset/Train/x_train.txt")  ##training set
subject_train<-read.table("./UCI HAR Dataset/Train/subject_train.txt")

##Step 1:  Merge data sets
##Combine training data sets
  ##merge y_train with activity_label  (step3)
  train<-merge(y_train,activity_label, by.x= "V1", by.y="V1")
  ##Change field names to be descriptive (step4)
  colnames(train)<-c("activity","activity_label")
  ## merge with subject data after renaming variable
  colnames(subject_train)<-c("subject")
  train<-cbind(subject_train,train)  ##bind two data frames
  ##rename columns in x_train to be descriptive
  colnames(x_train)<-features$V2
  train<-cbind(train,x_train)
  
##Read Test data sets
y_test<-read.table("./UCI HAR Dataset/Test/y_test.txt")  ##test labels
x_test<-read.table("./UCI HAR Dataset/Test/x_test.txt")  ##test set
subject_test<-read.table("./UCI HAR Dataset/Test/subject_test.txt")
  
##Combine test data sets
  ##merge y_test with activity_label (step3)
  test<-merge(y_test,activity_label, by.x= "V1", by.y="V1")
  ##Change field names to be descriptive (step5)
  colnames(test)<-c("activity","activity_label")
  ## merge with subject data after renaming variable
  colnames(subject_test)<-c("subject")
  test<-cbind(subject_test,test)  ##bind two data frames
  ##rename columns in x_train to be descriptive
  colnames(x_test)<-features$V2
  test<-cbind(test,x_test)

##Merge test and training datasets with rbind (end of step1)
all<-rbind(train,test)

##Part 2: Extract mean and Stdev for each measurement type
## find all field names with mean or std (keep dimensions for subject and activity)
t<-grep("[Mm]ean|[Ss]td|subject|activity",names(all))
    ##select(all,contains("[Mm]ean"))
    ##"fBodyAcc-bandsEnergy()-9,16"  rows 307 and 321 are example of duplicate
    ##error due to duplicate column names
##subset based on grep result for mean, names, etc. for question 4
step4<-all[,t]   

##Step5: Calculate mean for all fields, grouped by subject and activity
library(dplyr)
step5<-step4%>% 
    group_by (subject,activity,activity_label) %>%
    summarize_each(funs(mean(.,na.rm=TRUE)),-activity)