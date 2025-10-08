# Importing the dataset (if dataset is not a csv file, write read.delim())
housetasks <- read.delim("housetasks.txt", row.names = 1)

# Contingency table can be visualized using the function 
# balloonplot(). This function draws a graphical matrix where 
# each cell contains a dot whose size reflects the relative 
# magnitude of the corresponding component.

# install.packages("gplots")
library(gplots)

dt <- as.table(as.matrix(housetasks))
balloonplot(t(dt), main = "Housetasks Visualization",
            label = F, show.margins = F,
            xlab = "", ylab = "")
# It's also possible to visualize a contingency table as a mosaic plot.
# This can be done using the function mosaicplot() from 
# the built-in R package graphics. 

library("graphics")
mosaicplot(dt, shade = T, las = 2,
           main = "Housetasks")

# Blue color indicates that the observed value is higher than 
# the expected value. Red color indicates that the observed 
# value is lower than the expected value. Expected value indicates 
# the situation where there is no significant difference between 
# the observed vlaue and expected value.

# Computing ch-square test in R
chisq <- chisq.test(housetasks)
chisq

# Observed counts
chisq$observed

# Expected counts
round(chisq$expected, 2)

# Residuals calculation
chisq$observed - round(chisq$expected, 2)

# Standardized (Pearson) Residuals calculation 
round(chisq$residuals, 3)

# Adjusted Standardized Residuals calculation 
chisq$stdres

# Visualise Pearson residuals using the package corrplot
install.packages("corrplot")
library(corrplot)
corrplot(chisq$residuals, is.cor = FALSE)

# Contribution in percentage (%)
contrib <- 100 * chisq$residuals^2/chisq$statistic
round(contrib, 3)

# Visualize the contribution
corrplot(contrib, is.cor = FALSE)





