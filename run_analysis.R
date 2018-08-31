
filename<- "rprog_data_ProgAssignment3-data.zip"

#Download and unzip Dataset

if(!file.exists(filename))
{
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}
#read data and merge

subject_train<-read.table(file = "UCI HAR Dataset\\train\\subject_train.txt")
subject_test<-read.table(file = "UCI HAR Dataset\\test\\subject_test.txt")
X_train<-read.table(file = "UCI HAR Dataset\\train\\X_train.txt")
y_train<-read.table(file = "UCI HAR Dataset\\train\\y_train.txt")
X_test<-read.table(file ="UCI HAR Dataset\\test\\X_test.txt" )
y_test<-read.table(file ="UCI HAR Dataset\\test\\y_test.txt" )

# add column name for subject files
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

# add column names for measurement files
featureNames <- read.table("UCI HAR Dataset\\features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# add column name for label files
names(y_train) <- "UCI HAR Dataset\\activity"
names(y_test) <- "UCI HAR Dataset\\activity"

# combine files into one dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)




