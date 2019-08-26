##Function to interpret wearable computing data by test subject and activity
run_analysis <- function() {
        startingDirector <- getwd()
        if (!file.exists("features.txt")) {
                setwd(".//dataset//GACD//UCI HAR Dataset") 
        }

        library(dplyr)
        
        ##Load and combine tables from test and train data sets 
        functionNames <- read.table("./features.txt")
        functionNames <- t(functionNames[,2])
        subject_train <- read.table("./train/subject_train.txt")
        colnames(subject_train) <- c("subject")
        X_train <- read.table("./train/X_train.txt")
        colnames(X_train) <- functionNames
        Y_train <- read.table("./train/Y_train.txt")
        colnames(Y_train) <- c("activity")
        activities <- read.table("activity_labels.txt")
        subject_test <- read.table("./test/subject_test.txt")
        colnames(subject_test) <- c("subject")
        X_test <- read.table("./test/X_test.txt")
        colnames(X_test) <- functionNames
        Y_test <- read.table("./test/Y_test.txt")
        colnames(Y_test) <- c("activity")

        X_train_expanded <- cbind(Y_train, X_train)
        X_test_expanded <- cbind(Y_test, X_test)
        
        columnActivities <- activities$V2[match(X_train_expanded$activity,activities$V1)]
        X_train_expanded <- cbind(columnActivities, X_train_expanded)
        columnActivities <- activities$V2[match(X_test_expanded$activity,activities$V1)]
        X_test_expanded <- cbind(columnActivities, X_test_expanded)
        
        X_train_expanded <- cbind(subject_train, X_train_expanded)
        X_test_expanded <- cbind(subject_test, X_test_expanded)
        
        X_combined <- rbind(X_train_expanded, X_test_expanded)
        
        ##Separate out mean and standard deviation columns and provide human readable labels
        meanStdCounts <- grep("std\\()|mean\\()",names(X_combined))
        combined_column_names <- c("subject","activity",
                                   "tbody acceleration mean X (m/s^2)","tbody acceleration mean Y (m/s^2)","tbody acceleration mean Z (m/s^2)",
                                   "tbody acceleration Std Dev X","tbody acceleration Std Dev Y","tbody acceleration Std Dev Z",
                                   "tgravity acceleration mean X (m/s^2)","tgravity acceleration mean Y (m/s^2)","tgravity acceleration mean Z (m/s^2)",
                                   "tgravity acceleration Std Dev X","tgravity acceleration Std Dev Y","tgravity acceleration Std Dev Z",
                                   "tbody acceleration jerk X (m/s^3)","tbody acceleration jerk Y (m/s^3)","tbody acceleration jerk Z (m/s^3)",
                                   "tbody acceleration jerk Std Dev X","tbody acceleration jerk Std Dev Y","tbody acceleration jerk Std Dev Z",
                                   "tbody gyro mean X (rad/s)","tbody gyro mean Y (rad/s)","tbody gyro mean Z (rad/s)",
                                   "tbody gyro Std Dev X","tbody gyro Std Dev Y","tbody gyro Std Dev Z",
                                   "tbody gyro jerk X (rad/s^3)","tbody gyro jerk Y (rad/s^3)","tbody gyro jerk Z (rad/s^3)",
                                   "tbody gyro jerk Std Dev X","tbody gyro jerk Std Dev Y","tbody gyro jerk Std Dev Z",
                                   "tbody acceleration mag (m/s^2)","tbody acceleration mag Std Dev","tgravity acceleration grav (m/s^2)",
                                   "tgravity acceleration grav Std Dev","tbody acceleration jerk mag (m/s^3)","tbody acceleration jerk mag Std Dev",
                                   "tbody gyro mag (m/s^2)","tbody gyro mag Std Dev","tbody gyro jerk mag (m/s^2)","tbody gyro jerk mag Std Dev",
                                   "fbody acceleration X (m/s^2)","fbody acceleration Y (m/s^2)","fbody acceleration Z (m/s^2)",
                                   "fbody acceleration Std Dev X","fbody acceleration Std Dev Y","fbody acceleration Std Dev Z",
                                   "fbody acceleration jerk X (m/s^3)","fbody acceleration jerk Y (m/s^3)","fbody acceleration jerk Z (m/s^3)",
                                   "fbody acceleration jerk Std Dev X","fbody acceleration jerk Std Dev Y","fbody acceleration jerk Std Dev Z",
                                   "fbody gyro X (rad/s)","fbody gyro Y (rad/s)","fbody gyro Z (rad/s)",
                                   "fbody gyro Std Dev X","fbody gyro Std Dev Y","fbody gyro Std Dev Z",
                                   "fbody acceleration mag (m/s^2)","fbody accleration mag Std Dev","fbody acceleration jerk mag (m/s^3)",
                                   "fbody acceleration jerk mag Std Dev","fbody gyro mag (rad/s)","fbody gyro mag Std Dev",
                                   "fbody gyro jerk mag (rad/s^3)","fbody gyro jerk mag Std Dev"
                                   )
        
        limited_X_combined <- cbind(X_combined$subject, X_combined$columnActivities, X_combined[,meanStdCounts])
        colnames(limited_X_combined) <- combined_column_names

        ##Create data set of means with data sorted by subject and activity 
        grouped_data <- limited_X_combined %>% group_by(subject, activity) %>% summarise_each(mean)
        setwd("../../")
}

