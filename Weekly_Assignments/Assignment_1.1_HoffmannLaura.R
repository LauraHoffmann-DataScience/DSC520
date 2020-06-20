# Assignment 1.1
# Hoffmann, Laura
# 6/3/2020

install.packages("readr")
library(readr)
library(ggplot2)
data <- read.csv("~/RStudio/dsc520/data/scores.csv")
data
summary(data)

# 1) The observational units in this study are course grades and total points
# earned in the course because these are the units we will be using to compare
# student performance.

# 2) The variables mentioned in the paragraph are course grades and total 
# points earned which are quantitative because they are measured by numbers, 
# and whether the course is sports or not is a categorical variable.

# 3)
reg_sub <- subset(data, Section == "Regular")
sports_sub <- subset(data, Section == "Sports")
reg_sub
sports_sub

# 4) In addition to the individual plots I put the sections in a plot together
# being sure to highlight the sections the data points came from.

sports_scatter <- ggplot(sports_sub, aes(Score, Count))
sports_scatter + geom_point() + labs(title = "Sports Scores")
reg_scatter <- ggplot(reg_sub, aes(Score, Count))
reg_scatter + geom_point() + labs(title = "Regular Scores")
plot_toget <- ggplot(data, aes(Score, Count, color = Section))
plot_toget + geom_point() + labs(title = "Combined Plot")

# a) Looking at the plots it doesn't seem to me like one section tended to
# score more points than the other. If anything, the regular sections did
# slightly better.

# b) The highest scoring section was a sports section, but the second highest
# scoring was a regular section. The five lowest scoring sections were all 
# sports sections, so all regular sections scored higher than the five lowest
# scoring sections. The statistical tendency is a single number or value
# that attempts to define a set of data by finding a central unit, in this case
# we can observe the plots to see the mode, use the mean, or use the median as 
# the central tendency. After observing the plots we can see the regular scores 
# are slightly negatively skewed with 350 being the mode, where the sports 
# scores appear to be bimodal with 285 and 335 being the modes. To calculate 
# the mean for each of the sections, we first need to make sure all of the 
# students scores are taken into account so Count is multiplied by Score and 
# each product is added together and then divided by the total Count to find 
# the overall mean, 321.73. I also calculated for the means of the different 
# sections.

# Overall mean
overallscore <- (sum(data$Score * data$Count))/sum(data$Count)
overallscore
# Regular mean
regscore <- (sum(reg_sub$Score * reg_sub$Count))/sum(reg_sub$Count)
regscore
# Sports mean
sportsscore <- (sum(sports_sub$Score * sports_sub$Count))/sum(sports_sub$Count)
sportsscore

# For the median we have to again take the count of each section into account
# before just finding the median of the score column. This is done with the 
# code below for an overall median as well as medians for both sections.
# Overall median

with(data, median(rep.int(Score, Count)))
# Regular section median
with(reg_sub, median(rep.int(Score, Count)))
# Sports section median
with(sports_sub, median(rep.int(Score, Count)))

# c) When the sections were held can be an addition variable, such as the time
# of day. Some tend to do better early in the day while others thrive later so
# time of day for each of the sections could have an impact on the scores.

