# 1. Merges the training and the test sets to create one data set.

  ## Train
  trainData <- read.table("./Data/train/X_train.txt")
  
  trainSubject <- read.table("./Data/train/subject_train.txt")

  trainLabel <- read.table("./Data/train/y_train.txt")

  ## Test
  
  testData <- read.table("./Data/test/X_test.txt")
  
  testSubject <- read.table("./Data/test/subject_test.txt")
  
  testLabel <- read.table("./Data/test/y_test.txt") 

  ## Merge

  joinData <- rbind(trainData, testData)
  
  joinSubject <- rbind(trainSubject, testSubject)
  
  joinLabel <- rbind(trainLabel, testLabel)
  
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
  
  feat <- read.table("./Data/features.txt")

  mu_sigma <- grep("mean\\(\\)|std\\(\\)", feat[, 2])
  
  joinData <- joinData[, mu_sigma]
  
  names(joinData) <- gsub("\\(\\)", "", feat[mu_sigma, 2])
  
  names(joinData) <- gsub("-", "", names(joinData))  
  
  names(joinData) <- gsub("mean", "MEAN", names(joinData))
  
  names(joinData) <- gsub("std", "STD", names(joinData)) 

#3. Uses descriptive activity names to name the activities in the data set
  
  Activity <- read.table("./Data/activity_labels.txt")
  
  Activity[, 2] <- gsub("_", " ", Activity[, 2])
  
  joinLabel[, 1] <- Activity[joinLabel[, 1], 2]
  
  names(joinLabel) <- "Activity"

#4. Appropriately labels the data set with descriptive activity names
  
  names(joinSubject) <- "Subject"
  
  cleanedData <- cbind(joinSubject, joinLabel, joinData)
  
  write.table(cleanedData, "datasetMERGE.txt")
  
#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  
  lenSubject <- length(table(joinSubject))
  
  lenActivity <- dim(Activity)[1]
  
  lenColumn <- dim(cleanedData)[2]
  
  outcome <- as.data.frame(matrix(NA, lenSubject*lenActivity, lenColumn))
  
  colnames(outcome) <- colnames(cleanedData)
  
  row <- 1
  
      for(i in 1:lenSubject) {
            for(j in 1:lenActivity) {
              outcome[row, 1] <- sort(unique(joinSubject)[, 1])[i]
              outcome[row, 2] <- Activity[j, 2]
                  a <- i == cleanedData$Subject
                  b <- Activity[j, 2] == cleanedData$Activity
                  outcome[row, 3:lenColumn] <- colMeans(cleanedData[a&b, 3:lenColumn])
                  row <- row + 1 }
      }
      
  write.table(outcome, "datasetAVERAGE.txt", row.names=FALSE)
  
