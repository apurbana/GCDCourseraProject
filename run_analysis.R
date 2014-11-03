##Set the working directory and read the raw data files (Step 1)

setwd("C:/Users/Medal/Dropbox/Personal/courses/Getting_and_cleaning_data/data/getdata_projectfiles_UCI_HAR_Dataset1/UCI_HAR_Dataset")
activity_labels<-read.table("activity_labels.txt", sep=" ", header=FALSE)
activity_labels
features<-read.table("features.txt", sep=" ", header=FALSE)
features
subject_test<-read.table("subject_test.txt", sep=" ", header=FALSE)
head(subject_test)
subject_train<-read.table("subject_train.txt", sep=" ", header=FALSE)
head(subject_train)
X_test<-read.table("X_test.txt", header=FALSE)
head(X_test)
nrow(X_test)
X_train<-read.table("X_train.txt", header=FALSE)
head(X_train)
nrow(X_train)
y_test<-read.table("y_test.txt", header=FALSE)
head(y_test)
nrow(y_test)
y_train<-read.table("y_train.txt", header=FALSE)
head(y_train)
nrow(y_train)

##Give column names activity and subject files (Step 1)

colnames(y_test)[1]="labels"
colnames(y_train)[1]="labels"
colnames(subject_test)[1]="subject"
colnames(subject_train)[1]="subject"
colnames(activity_labels)[1:2]=c("labels", "label_name")

#column bind X, y, and subject; Row bind Train and test (Step 1)

alldata<-cbind(X_test, y_test)
alldata<-rbind(alldata, cbind(X_train, y_train))
alldata<-cbind(alldata, rbind(subject_test, subject_train))

## Merge data with activity labels (Step 1)

alldatalabels<-merge(alldata, activity_labels)

## Drop the numeric label column (Step 1)

alldatalabels<-alldatalabels[,2:564]

## Keep the feature names and coerce them as characters (Step 4)

features<-features[,2]
features<-as.character(features)

##Build the variable names vector and assign the names (Step 3, 4)

alldatanames<-c(features, "subject", "label_name")
colnames(alldatalabels)<-alldatanames

##Generate boolean vector based on whether the column name has "mean()" or "std()" in it (Step 2)

cond<-grepl("mean()", colnames(alldatalabels), fixed=TRUE) | grepl("std()", colnames(alldatalabels), fixed=TRUE) | grepl("subject", colnames(alldatalabels), fixed=TRUE) | grepl("label_name", colnames(alldatalabels), fixed=TRUE)

##Subset columns keeping only the mean and standard deviation columns (Step 2)

alldatalabelssub<-alldatalabels[,cond]

##Determine the means of columns for unique combinations of subject and activity labels (Step 5)

alldatalabelssubsum<-ddply(alldatalabelssub, .(subject, label_name), numcolwise(mean))

#Write the tidy data set into a file

write.table(alldatalabelssubsum, "projecttidy_nan.txt", row.names=FALSE)
