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

# Scale numeric features
# identify numeric predictors
num_cols <- c("temp", "atemp", "hum", "windspeed")

# Computing the scaling parameters on training data
train_means <- sapply(train_set[, num_cols], mean)
train_means
train_sds <- sapply(train_set[, num_cols], sd)
train_sds

# Scale Function [2 for column wise]
scale_num <- function(df){
  df[, num_cols] <- sweep(df[, num_cols], 2, train_means, "-")
  df[, num_cols] <- sweep(df[, num_cols], 2, train_sds, "/")
  df
}
train_scaled <- scale_num(train_set)
test_scaled <- scale_num(test_set)

# Building a linear regression
lm_model <- lm(cnt ~ ., data = train_scaled)
summary(lm_model)

lm_pred <- predict(lm_model, newdata = test_scaled)

# Evaluation matrix for linear regression

# Calculating Root Mean Squared Error
rmse <- function(actual, pred) sqrt(mean((actual - pred)^2))
lm_rmse <- rmse(test_scaled$cnt, lm_pred)
lm_rmse

# Calculating Mean Absolute Error
mae <- function(actual, pred) mean(abs(actual - pred))
lm_mae <- mae(test_scaled$cnt, lm_pred)
lm_mae

# Building svr model
svr <- svm(cnt ~ ., data = train_scaled, kernel = "linear")
svr_pred <- predict(svr, newdata = test_scaled)
svr_pred

# Evaluation metrics for linear SVR [In this model lm_rmse(842.3335) < svr_rmse(856.1923) 
# Again, svr_mae > lm_mae]
svr_rmse <- rmse(test_scaled$cnt, svr_pred)
svr_rmse
lm_rmse

svr_mae <- mae(test_scaled$cnt, svr_pred)
svr_mae
lm_mae

# Non-linear SVR (RBF Kernel)
svr_rbf <- svm(
  cnt ~ .,
  data = train_scaled,
  kernel = "radial",
  cost = 10,
  gamma = 0.1,
  epsilon = 0.1
)
svr_rbf_pred <- predict(svr_rbf, newdata = test_scaled)
svr_rbf_pred

# Computing the evaluation parameters

svr_rbf_rmse <- rmse(test_scaled$cnt, svr_rbf_pred)
svr_rbf_mae <- mae(test_scaled$cnt, svr_rbf_pred)
svr_rbf_rmse; svr_rbf_mae

lm_rmse; lm_mae


