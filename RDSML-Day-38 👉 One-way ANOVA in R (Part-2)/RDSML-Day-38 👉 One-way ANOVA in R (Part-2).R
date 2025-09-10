# One way ANOVA
# Importing the dataset
PlantGrowth <- PlantGrowth

# Importing the dplyr library
install.packages("dplyr")
library(dplyr)

# Computingtge group means, sd and se (%>% pipe operator)
stats <- PlantGrowth %>%
  group_by(group) %>%
  summarise(
    mean = mean(weight),
    sd = sd(weight),
    se = sd(weight) / sqrt(n())
  )

print(stats)

# Creating group-wise boxplot
boxplot(weight ~ group, 
        data = PlantGrowth, 
        main = "PlantGrowth data",
        ylab = "Dried weight of plants", 
        col = "lightgray")

# Visualizing the data using mean plots
# install.packages("ggpubr")
library(ggpubr)
ggline(PlantGrowth,
       x = "group",
       y = "weight",
       add = c("mean_se", "jitter")
       )
# Running the One-way ANOVA test
anova <- aov(weight ~ group, data = PlantGrowth)
summary(anova)

# Tukey multiple pairwise-comparisons (Post-oc test)
TukeyHSD(anova)

# Homogeneity of variances
plot(anova, 1)
library(car)
leveneTest(weight ~ group, data = PlantGrowth)

# ANOVA test with no assumption of equal variances
oneway.test(weight ~ group, data = PlantGrowth)

# Paired-wise t-test with no assusmtion of equal variances
pairwise.t.test(PlantGrowth$weight, PlantGrowth$group,
                p.adjust.method = "BH", pool.sd = FALSE)
# Checking for normal distribution
plot(anova, 2)


# Extracting the residuals
aov_res <- residuals(object = anova)

# Running the Shapiro-wilk test
shapiro.test(aov_res)


kruskal.test(weight ~ group, data = PlantGrowth)
pairwise.wilcox.test(PlantGrowth$weight, PlantGrowth$group,
                     p.adjust.method = "BH")





      