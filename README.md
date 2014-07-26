#run_analysis.R Explanation

The script is broken into 4 main steps.  

## 1. Data Aggregation
This step merges the train and test datasets.  There were 3 main dimensions of data to merge, and I describe them as first being merged "vertically", and then "horizontally" concatenated.

Vertical merge means that I used the rbind() function to put the train/test datasets together of like kind: I rbind()'d subject_id data from train and test to create a combined dataset, etc..

After I had vertically rbind()'d two dimensions (subject and activity), I could then concatenate them  to make a data.frame with two columns.  

## 2. Data Translation
The remaining dimension was the column of vectors of measurements.  After combining test and train, I used statistical summarizations for mean and st dev to summarize the the values into two additional columns, mean and stdev.

## 3. Data Reshaping
I believe there was something like 30 readings for each combination of subject_id and activity_id, for each variable, so the goal was to summarize each of those 30 readings into 1 using a mean().
This was accomplished by melting and casting using the 'reshape' library.

## 4. Data Outputting
I used write.table without any line numbers to output a tidy dataset to .txt.