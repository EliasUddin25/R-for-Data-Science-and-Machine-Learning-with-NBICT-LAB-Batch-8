# Polynomial Regression in R
# Importing the dataset
dataset <- read.csv("polynom_data.csv")
attach(dataset)

# Plot the data
plot(x, y, main = "Polynomial Regression Example", pch = 19)

# Fit a quadratic (degree 2) polynomial regression
polynom_model <- lm(y ~ poly(x, 2, raw = TRUE))

# View the model summary
summary(polynom_model)

# Create new data for prediction
x_new <- seq(min(x), max(x), length.out = 100)
# x_new <- data.frame(x_new)
y_pred <- predict(polynom_model, newdata = data.frame(x=x_new))
pred_data <- data.frame(x_new, y_pred)

# Adding a fit curve to the model
lines(x_new, y_pred, col = 'blue', lwd = 2)

# Fit a cubic (degree 3) polynomial regression
polynom_model3 <- lm(y ~ poly(x, 3, raw = TRUE))
summary(polynom_model3)
lines(x_new, 
      predict(polynom_model3, newdata = data.frame(x=x_new)),
      col = 'red', lwd = 2, lty = 2)

legend("topright", legend = c("Degree2", "Degree3"),
       col = c("blue", "red"),
       lwd = 2)



