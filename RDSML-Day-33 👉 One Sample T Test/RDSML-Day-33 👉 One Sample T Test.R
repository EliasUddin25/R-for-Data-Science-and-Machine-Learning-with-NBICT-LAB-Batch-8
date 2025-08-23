# Importing the dataset
myData <- read.csv("bottle_data.csv")

# Checking for the normality
# Shapiro-Wilk Test (H0 = data normally distributed; p > 0.5 means data normally distributed)
shapiro.test(myData$value)

# One Sample T Test
t.test(x = myData$value, mu = 150)
