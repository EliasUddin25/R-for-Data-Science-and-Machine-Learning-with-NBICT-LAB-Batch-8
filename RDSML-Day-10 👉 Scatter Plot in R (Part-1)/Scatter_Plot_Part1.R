# install.packages("ggplot2")
library(ggplot2)

dataset = mtcars
View(dataset)

# Generating a basic scatter plot
ggplot(dataset, aes(x = wt, y = mpg)) + 
  geom_point()
