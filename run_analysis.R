library(data.table)
library(plyr)

subjectTrain <- read.table("subject_train.txt")
subjectTest <- read.table("subject_test.txt")
activityCodeTrain <- read.table("y_train.txt")
activityCodeTest <- read.table("y_test.txt")
subject <- data.table(rbind(subjectTest, subjectTrain))
activityCode <- data.table(rbind(activityCodeTest, activityCodeTrain))

features <- read.table("features.txt")
meanKeys <- features[grep("mean", features$V2),]
stdKeys <- features[grep("std", features$V2),]

xTrain <- read.table("X_train.txt") #561var time and frequency domain variables 
xTest <- read.table("X_test.txt") #561var time and frequency domain variables

x <- rbind(xTest, xTrain)
Columns <- c(paste("V",stdKeys$V1, sep=""),paste("V", meanKeys$V1, sep=""))
xMeanStd <- x[,Columns]

d <- data.table(cbind(subject, activityCode, xMeanStd))

setnames(d,c("subject", "activity_code", 
                    gsub("[-()]","_", as.character(stdKeys$V2)), 
                    gsub("[-()]","_", as.character(meanKeys$V2))))

activityCodeNames <- data.table(c(1, 2,3,4,5,6),c("WALKING", "WALKING_UPSTAIRS",
                      "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
setnames(activityCodeNames, c("activity_code","activity_names"))

d <- join(d, activityCodeNames, by =c("activity_code"), type = "left")
write.table(tidyData, "data_set.txt", sep=" ")

tidyData <- ddply(d, .(subject, activity_code), numcolwise(mean))
tidyData <- join(tidyData, activityCodeNames, by = c("activity_code"), type = "left")
write.table(tidyData, "tidy_data.txt", sep=" ")

