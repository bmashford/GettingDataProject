## Getting and Cleaning Data - Project

This code performs the data cleaning and analysis required for the project in Coursera course : "Getting and Cleaning Data"

To run the script, first download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract into the toplevel of the repository. 

Then run "run_analysis.R" to apply analysis.

The script performs the following functions:


1. Read the X, y and subject data for both train and test datasets
2. Give activity names to the datasets
3. Read in features descriptions
4. Set descriptive names for all columns in the datasets
5. Merge all the data into 'combinedDataset'
6. Filter the data to extract out the mean and standard deviation read in activity descriptions
7. Tidy up the dataset and write it out to a file


Once completed, a text file named "tidyData.csv" will be written to the same folder.



