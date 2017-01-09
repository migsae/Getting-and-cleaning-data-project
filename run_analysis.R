library(reshape2)
library(tidyr)


#1 Merge data set

# read data
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")
y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")

# add names
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

featureNames <- read.table("features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

names(y_train) <- "activity"
names(y_test) <- "activity"

# merge
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)

#2 Extract mean and std
meanstdcols <- grepl("mean\\(\\)", names(combined)) | grepl("std\\(\\)", names(combined))
meanstdcols[1:2] <- TRUE
combined_2 <- combined[, meanstdcols]

#4 convert the activity column from integer to factor
combined_2$activity <- factor(combined_2$activity, labels=c("Walking",
                                                        "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

#5 create the tidy data set
melted <- melt(combined, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)
write.csv(tidy, "tidy_dataset.csv", row.names=FALSE)

