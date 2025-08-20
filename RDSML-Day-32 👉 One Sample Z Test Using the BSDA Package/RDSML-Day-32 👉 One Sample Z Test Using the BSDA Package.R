# One Sample Z Test
# Installing the DSDA package
# install.packages("BSDA")
library(BSDA)

# Importing the dataset
dataset <- read.csv("Perfume.csv")
mean(dataset$Machine.1)

z.test(x = dataset$Machine.1, alternative = "greater", mu = 150, sigma.x = 2)
