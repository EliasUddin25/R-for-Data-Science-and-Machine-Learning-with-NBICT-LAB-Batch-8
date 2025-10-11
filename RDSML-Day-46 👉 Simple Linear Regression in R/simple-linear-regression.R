# Simple Linear Regression
# Importing the dataset
dataset <- read.csv("Salary_data.csv")

# Splitting the data set into the Training set and Test set
# install.packages("caTools")
library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
split
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting the simple linear regression model to the training set
regressor <- lm(formula = Salary ~ YearsExperience, 
                data = training_set)



