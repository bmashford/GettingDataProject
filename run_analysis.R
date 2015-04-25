library(data.table)

# Load all datasets

testDataX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testDataY <- read.table("./UCI HAR Dataset/test/y_test.txt")
testDataSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainDataX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainDataY <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainDataSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#apply activity names to the datasets
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, colClasses="character")
testDataY$V1 <- factor(testDataY$V1,levels=activities$V1, labels=activities$V2)
trainDataY$V1 <- factor(trainDataY$V1,levels=activities$V1, labels=activities$V2)

features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, colClasses="character")
colnames(testDataX) <- features$V2
colnames(trainDataX) <- features$V2
colnames(testDataY) <- c("Activity")
colnames(trainDataY) <- c("Activity")
colnames(testDataSubject) <- c("Subject")
colnames(trainDataSubject) <- c("Subject")

# merge all the data
testDataX <- cbind(testDataX, testDataY)
testDataX <- cbind(testDataX, testDataSubject)
trainDataX <- cbind(trainDataX, trainDataY)
trainDataX <- cbind(trainDataX, trainDataSubject)
combinedDataset <- rbind(testDataX, trainDataX)


# now extract the mean and standard deviation data only
combinedDatasetSD<-sapply(combinedDataset, sd, na.rm=TRUE)
combinedDatasetMean<-sapply(combinedDataset, mean, na.rm=TRUE)

#tidy up the dataset and write it
newDataTable <- data.table(combinedDataset)
tidyDataTable <- newDataTable[,lapply(.SD,mean), by="Activity,Subject"]
write.table(tidyDataTable, file="tidyData.csv", sep=",", row.names = FALSE)

