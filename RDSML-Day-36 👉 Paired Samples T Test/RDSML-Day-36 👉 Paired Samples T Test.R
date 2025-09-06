# Paired sample T test in R
# Importing the dataset
myDataset <- read.csv("paired-samples-t-test.csv")

# Calculating the difference
diffs <- myDataset$carb - myDataset$carb_protein

# Checking if the difference are normally distributed
shapiro.test(diffs)

# Checking for outliers using boxplot
boxplot(diffs)

# Running the paired sample T test
t.test(x = myDataset$carb, y = myDataset$carb_protein, paired = TRUE)


# Running the Wilcoxon signed-rank Test (if requirements for paired sample t-test are not met)
wilcox.test(x = myDataset$carb, y = myDataset$carb_protein, paired = TRUE)

# Calculating mean and sd
mean(myDataset$carb)
sd(myDataset$carb)

mean(myDataset$carb_protein)
sd(myDataset$carb_protein)

# Effect size calculation using Cohen's d (paired samples)
# 0.2 ~ small, 0.5 ~ medium, 0.8 ~ large
# install.packages("effsize")
library(effsize)
cohen.d(myDataset$carb_protein, myDataset$carb, paired = TRUE)

# A paired samples t-test was used to determine whether there was a 
# statistically significant mean difference between the distance ran
# when participants imbibed a carbohydrate-protein drink compared to 
# a carbohydrate-only drink. No outliers were detected. The assumption
# of normality was not violated as assessed by shapiro-wilk's test
#(p = 0.78). Participants ran further when imbibing the carbohydrate-protein
# drink (mean = 11.302 km, sd = 0.713 km as opposed to the carbohydrate-only 
# drink (mean = 11.17, SD = 0.727 km), a satistically significant
# mean increase of 0.135 km, 95% CI[0.091, 0.181], t(19) = 6.352, 
# p < = .001, Cohen's d estimate: 0.187.


# We get the following boxplot and/or normal qq plot....


