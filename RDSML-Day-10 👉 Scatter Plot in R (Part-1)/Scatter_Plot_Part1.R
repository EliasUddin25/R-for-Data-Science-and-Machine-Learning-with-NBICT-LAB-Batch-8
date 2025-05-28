# install.packages("ggplot2")
library(ggplot2)

dataset = mtcars
View(dataset)

# Generating a basic scatter plot
ggplot(dataset, aes(x = wt, y = mpg)) + 
  geom_point()

# Changing the point size and shape
ggplot(dataset, aes(x = wt, y = mpg)) + 
  geom_point(size = 1, shape = 18)


# Adding the regressio line
ggplot(dataset, aes(x = wt, y = mpg)) + 
  geom_point(size = 1, shape = 18) +
  geom_smooth()
