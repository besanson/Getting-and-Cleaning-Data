CodeBook
========

This file describes additional information to the one describe in the README.md about the task that run_analysis.R performes:  

Data Set History:
------------------

Is an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  
  
Data Used:  
-----------
  
  features.txt: List of all features.  
  activity_labels.txt: Links the class labels with their activity name.  
  subject_train.txt: Each row identifies the subject who performed the activity for each window sample.  
  x_train.txt: Training set.  
  y_train.txt: Training labels.  
  subject_test.txt: Each row identifies the subject who performed the activity for each window sample.  
  x_test.txt: Test set.  
  y_test.txt: Test labels.  

Transformation details  
--------------------------

  1) Read the different txt files and store them in different variables.  
  
  2) Concatenate and create data frames: TestData and TrainData, TestLabel and TrainLabel, TestSubject and TrainSubject.  
  
  3) extract the measurements of mean and standar deviation and clean the column names (also format a little bit -gsub-).  
  
  4) Format the activity names (for example remove underscore).  

5) Create a clean data frame combining JoinSubject, JoinLabel and JoinData. This ends up written in the current working directory.  
 
6) Create a clean data frame with the average of each measurement for each activity and each subject. This ends up written in the current working directory.  


