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

# Checking the summary of the model
summary(regressor)

# Predicting the test set results
y_pred = predict(regressor, newdata = test_set)
y_pred = predict(regressor, newdata = training_set)
# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             colour="red") +
  geom_point(aes(x=training_set$YearsExperience, y=y_pred),
             colour="blue")

ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             colour="red") +
  geom_line(aes(x=training_set$YearsExperience, y=y_pred),
             colour="blue") +
  ggtitle("Salary vs Experience") +
  xlab("Years of Expereience") +
  ylab("Salary")

# Visualising the Test set results

library(ggplot2)
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             colour="red") +
  geom_line(aes(x=test_set$YearsExperience, y=predict(regressor, newdata = test_set)),
             colour="blue") +
  ggtitle("Salary vs Experience") +
  xlab("Years of Expereience") +
  ylab("Salary")







