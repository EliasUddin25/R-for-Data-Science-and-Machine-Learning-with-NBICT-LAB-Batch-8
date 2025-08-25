# Two sample z test
# Importing the library
library(BSDA)

# Importing the dataset
dataset <- read.csv("Perfume_Two_Sample.csv")

machine1sd <- sd(dataset$Machine.1)

machine2sd <- sd(dataset$Machine.2)

#Running the z test
z.test(x = dataset$Machine.1, 
       y = dataset$Machine.2, 
       sigma.x = machine1sd, 
       sigma.y = machine2sd)
