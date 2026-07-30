install.packages(c(
  "tidyverse",
  "ggplot2",
  "psych",
  "corrplot",
  "GGally",
  "janitor",
  "skimr",
  "knitr",
  "rmarkdown"
))


# Load required libraries

library(tidyverse)
library(ggplot2)
library(psych)
library(corrplot)
library(GGally)
library(janitor)
library(skimr)

#Importing Data
data <- read.csv("D:/Data analysis/Project_4_R/Data/Crop_recommendation.csv")
head(data)


#Understanding the data
dim(data)
names(data)
str(data)

sapply(data, class)
head(data,10)
tail(data,10)

sample_n(data,5)



#Clean Column names
data <- clean_names(data)
names(data)


#Check Missing Values
colSums(is.na(data))



#Check Duplicate Records
sum(duplicated(data))
data <- distinct(data)



#convert crop to factor
data$label <- as.factor(data$label)
str(data)



