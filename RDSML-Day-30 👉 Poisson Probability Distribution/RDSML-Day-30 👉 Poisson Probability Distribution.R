ppois(q = 3, lambda = 5) - ppois(q = 2, lambda = 5)
dpois(x = 3, lambda = 5)

n <- seq(0, 5)
n
dpois(x = n, lambda = 5)

barplot(dpois(x = n, lambda = 5))

# Poisson probability distribution using the visualize package
library(visualize)
visualize.pois(stat = 4, lambda = 10)
visualize.pois(stat = 8, lambda = 10, section = "upper")
visualize.pois(stat = 8, lambda = 10)
visualize.pois(stat = c(4, 6), lambda = 10, section = "bounded")

visualize.pois(stat = c(2, 4), lambda = 5, section = "bounded")

#Exactly 3
visualize.pois(stat = c(3, 3), lambda = 5, section = "bounded")

visualize.pois(stat = c(2, 5), lambda = 5, section = "tails")






