---
title: "UCI_Cleaning Data CodeBook"
author: "Lash03"
date: "3/25/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown
The rn_analysis R script performs the datak preparation and then followed by the 5 steps required as describekd in the course project.

#Download the Dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset.

#Assignment of each data to a variable

##Creating variables from the textfiles
featuresNames - features textfiles (feature.txt)
activitylabels - activity label texktfiles (activity_label.txt)
subjectTrain - subject train textfile (subject_train.txt)
xtrain - x_train textfile (X_train.txt)
ytrain - y_train textfile (y_train.txt)
subjectTest - subject test textfile (subject_test.txt)
xtest - x_test textfile (X_test.txt)
ytest - y_test textfile (y_test.txt)


##Merging Data Variables
subject - row binding the subjecttest and subjecttrain variables
x - row binding the xtest and xtrain variables
y<- row binding the ytest anad ytrain variables
fulldata - column binding of all the 3 variables

##Extracting Data
columnsWithMeanSTD - mean and std data extracted from the fulldata variable
extractdata - complete extracted data having thesame dimension with  the full data



##New names for the Extracted dataset variables
Acc - Accelerometer
Gyro - Gyroscope
BodyBody - Body
Mag - Magnitude
t - Time
f - Frequency
tBody - TimeBody
angle - Angle
gravity - Gravity

tidyData is created by summarizing extractdata taking the means of each variable for each activity and each subject

Exported to a .txt file (Tidy.txt)



```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
