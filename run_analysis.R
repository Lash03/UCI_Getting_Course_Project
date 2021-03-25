!file.exists(("./data"), dir.create("main"))
fileurl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "man", mode = "wb")

## Unzipping the downloaded zip dataset

if (!file.exists("UCI HAR DAtaset")) {
  unzip("man")}

##Reading the text files into vectors

featuresNames<- read.table("UCI HAR DAtaset/features.txt")
activitylabels<- read.table("UCI HAR DAtaset/activity_labels.txt")

subjectTrain<- read.table("UCI HAR DAtaset/train/subject_train.txt", header = FALSE)
xtrain<- read.table("UCI HAR DAtaset/train/X_train.txt", header = FALSE)
ytrain<- read.table("UCI HAR DAtaset/train/y_train.txt", header = FALSE)

subjectTest<- read.table("UCI HAR DAtaset/test/subject_test.txt",header = FALSE)
xtest<- read.table("UCI HAR DAtaset/test/X_test.txt", header = FALSE)
ytest<- read.table("UCI HAR DAtaset/test/y_test.txt", header = FALSE)

##Merging Data
subject<- rbind(subjectTrain, subjectTest)
x<- rbind(xtrain, xtest)
y<- rbind(ytrain, ytest)

colnames(x)<- t(featuresNames[2])
colnames(y)<- "Activity"
colnames(subject)<- "Subject"
fulldata<- cbind(x,y,subject)

##Extracting Data
columnsWithMeanSTD<- grep(".*Mean.*|.*Std.*", names(fulldata), ignore.case = TRUE)
reqcolumns<- c(columnsWithMeanSTD, 562, 563)
dim(fulldata)

extractdata<- fulldata[, reqcolumns]
dim(extractdata)

##Using Descriptive Activity Name
ED_Activity<- as.character(extractdata$Activity)






##Names of the Extracted Variables
names(extractdata)

##New names for the Extracted dataset variables
names(extractdata)<- gsub("Acc", "Accelerometer", names(extractdata))
names(extractdata)<- gsub("Gyro", "Gyroscope", names(extractdata))
names(extractdata)<- gsub("BodyBody", "Body", names(extractdata))
names(extractdata)<- gsub("Mag", "Magnitude", names(extractdata))
names(extractdata)<- gsub("^t", "Time", names(extractdata))
names(extractdata)<- gsub("^f", "Frequency", names(extractdata))
names(extractdata)<- gsub("tBody", "TimeBody", names(extractdata))
names(extractdata)<- gsub("-mean()", "Mean", names(extractdata), ignore.case = TRUE)
names(extractdata)<- gsub("-std()", "STD", names(extractdata), ignore.case = TRUE)
names(extractdata)<- gsub("-freq()", "Frequency", names(extractdata), ignore.case = TRUE)
names(extractdata)<- gsub("angle", "Angle", names(extractdata))
names(extractdata)<- gsub("gravity", "Gravity", names(extractdata))


##Second Independent Tidy Dataset from 4 above
extractdata$Subject<- as.factor(extractdata$Subject)
extractdata<- data.table(extractdata)

tidyData<- aggregate(. -Subject + Activity, extractdata, mean)
tidyData<- tidyData[order(tidyData$Subject, tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)