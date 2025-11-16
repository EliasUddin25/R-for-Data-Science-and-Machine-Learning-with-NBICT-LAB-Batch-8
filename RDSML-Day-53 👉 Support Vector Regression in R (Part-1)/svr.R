# Set up packages and dataloading
# install.packages(c("e1071", "ggplot2", "dplyr"))

library(e1071)
library(ggplot2)
library(dplyr)

# Loading the dataset
dataset <- read.csv("day.csv")

# Basic cleaning and feature selection
bike  <- dataset %>%
  select(cnt, temp, atemp, hum, windspeed, season, yr, mnth,
         holiday, weekday, workingday, weathersit)
str(bike)

# convert categorical variables to factors
bike <- bike %>%
  mutate(
    season = factor(season),
    yr = factor(yr),
    mnth = factor(mnth),
    holiday = factor(holiday),
    weekday = factor(weekday),
    workingday = factor(workingday),
    weathersit = factor(weathersit)
  )

str(bike)

# Train/test split
set.seed(123)
n <- nrow(bike)
n
indices <- seq_len(n)
train_idx <- sample(indices, size = 0.7 * n)
train_set <- bike[train_idx, ]
test_set <- bike[-train_idx, ]



