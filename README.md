##run_analysis.R Explanation

The script is broken into 4 main steps.  

### 1. Data Aggregation
This step merges the train and test datasets.  There were 3 main dimensions of data to merge, and I describe them as first being merged "vertically", and then "horizontally" concatenated.

Vertical merge means that I used the rbind() function to put the train/test datasets together of like kind: I rbind()'d subject_id data from train and test to create a combined dataset, etc..

After I had vertically rbind()'d two dimensions (subject and activity), I could then concatenate them  to make a data.frame with two columns.  

### 2. Data Translation
The remaining dimension was the column of vectors of measurements.  After combining test and train, I used statistical summarizations for mean and st dev to summarize the the values into two additional columns, mean and stdev.

### 3. Data Reshaping
I believe there was something like 30 readings for each combination of subject_id and activity_id, for each variable, so the goal was to summarize each of those 30 readings into 1 using a mean().
This was accomplished by melting and casting using the 'reshape' library.

### 4. Data Outputting
I used write.table without any line numbers to output a tidy dataset to .txt.

##Original Dataset

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================


##
The new dataset includes the following files:
=========================================
run_analysis.R - A file that converts the files of the original dataset to a tidy dataset.
reshaped_tidy_data.txt - A space-seperated table with headers.  It captures the 30 day averages of the daily averages of tri-axial movement of test subjects recorded via Samsung Galaxy 2 smartphone.  The data is categorized by subject_id and sub-categorized by activity_id.  It is output by run_analysis.R.

sum_features.txt = a file with a list of the summary features that are to be maintained.


