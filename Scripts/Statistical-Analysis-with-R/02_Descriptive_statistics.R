#Importing Data
data <- read.csv("D:/Data analysis/Project_4_R/Data/Crop_recommendation.csv")
head(data)




summary(data)
skim(data)
describe(data)


#Number of crop types
nlevels(data$label)

#Frequency of each crop
table(data$label)

#Summary Statistics Table
summary(data[,1:7])

#Standard Deviation of Each Numeric Variable
sapply(data[,1:7], sd)

#Variance
sapply(data[,1:7], var)

#Coefficient of Variation (CV)
cv <- sapply(data[,1:7], function(x) sd(x)/mean(x)*100)

round(cv,2)


