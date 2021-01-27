# ----
# First step : Merge training and test data into one data set
x <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
data_merged <- cbind(subject, y, x)

# ----
# Second step : extract mean and std deviation
data_tidy <- data_merged %>% select(subject, code, contains("mean"), contains("std"))

# ----
# Third step : name activities in the data set
data_tidy$code <- activities[data_tidy$code, 2]

# ----
# Fourth step : label the data set
names(data_tidy)[2] = "activity"
names(data_tidy)<-gsub("Acc", "Accelerometer", names(data_tidy))
names(data_tidy)<-gsub("Gyro", "Gyroscope", names(data_tidy))
names(data_tidy)<-gsub("BodyBody", "Body", names(data_tidy))
names(data_tidy)<-gsub("Mag", "Magnitude", names(data_tidy))
names(data_tidy)<-gsub("^t", "Time", names(data_tidy))
names(data_tidy)<-gsub("^f", "Frequency", names(data_tidy))
names(data_tidy)<-gsub("tBody", "TimeBody", names(data_tidy))
names(data_tidy)<-gsub("-mean()", "Mean", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("-std()", "STD", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("-freq()", "Frequency", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("angle", "Angle", names(data_tidy))
names(data_tidy)<-gsub("gravity", "Gravity", names(data_tidy))

# ----
# Fifth step : Creating an independent tidy data set from data step above
data_final <- data_tidy %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(data_final, "Data_Final.txt", row.name=FALSE)
