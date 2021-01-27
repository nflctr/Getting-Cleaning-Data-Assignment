## Code Book File

This code book contains all steps performed on the run_analysis.R script as shown below

### First step
Merge training and test data into one data set
- 'x' : variable from merging X_train and X_test using rbind()
- 'y' : variable from merging y_train and y_test using rbind()
- 'subject' : variable from merging subject_train and subject_test using rbind()
- 'data_merged' : variable from merging subject, 'y' and 'x' using cbind()

### Second Step
Extracting mean and standard deviation
- 'data_tidy' : variable from subsetting 'data_merged'
columns that selected :
- subject
- code
- mean and standard deviation for each measurement

### Third Step
Name activities in the data set
- Replacing all numbers in column 'code' from 'data_tidy' with corresponding activity from second column in 'activities'

### Fourth Step
Label the data set
- Rename the column with new variable names

### Fifth Step
Creating an independent tidy data set
- Summarizing 'data_tidy' and create new tidy data set 'data_final'
- Export 'data_final' into 'data_tidy_final.txt'
