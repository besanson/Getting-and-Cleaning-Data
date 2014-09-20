Getting-and-Cleaning-Data
=========================

Coursera Course

run_analysis.R  does the following:  

1) It reads the txt files from a data folder that have to be in the current working directory. The data must be unzipped before.
  
2) It does the following process:  

    A. Merges the training and the test sets to create one data set.  
    B. Extracts only the measurements on the mean and standard deviation for each measurement.   
    C. Uses descriptive activity names to name the activities in the data set  
    D. Appropriately labels the data set with descriptive variable names.   
    E. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
  
3) The code outputs two files in the current working directory:  
  
  i) datasetMERGE.txt (clean data)  
  ii) datasetAVERAGE.txt (average of each variable for each activity and each subject)  
  
