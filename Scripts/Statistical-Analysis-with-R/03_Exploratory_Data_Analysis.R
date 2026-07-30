#Importing Data
data <- read.csv("D:/Data analysis/Project_4_R/Data/Crop_recommendation.csv")
head(data)



########### Exploratory Data Analysis ###################


#Distribution of Crop Types
ggplot(data, aes(x = label)) +
  geom_bar(fill = "forestgreen") +
  labs(
    title = "Distribution of Crop Types",
    x = "Crop",
    y = "Count"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

ggsave(
  "D:/Data analysis/Project_4_R/images/crop_distribution.png",
  width = 10,
  height = 6,
  dpi = 300
)




#Histogram of Temperature
ggplot(data, aes(x = temperature)) +
  geom_histogram(
    bins = 30,
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Temperature",
    x = "Temperature (°C)",
    y = "Frequency"
  ) +
  theme_minimal()

ggsave(
  "D:/Data analysis/Project_4_R/images/Histogram_of_Temperature.png",
  width = 10,
  height = 6,
  dpi = 300
)


#Histogram of Rainfall
ggplot(data, aes(x = rainfall)) +
  geom_histogram(
    bins = 30,
    fill = "dodgerblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Rainfall",
    x = "Rainfall (mm)",
    y = "Frequency"
  ) +
  theme_minimal()

ggsave(
  "D:/Data analysis/Project_4_R/images/Histogram_of_Rainfall.png",
  width = 10,
  height = 6,
  dpi = 300
)



#Histogram of pH
ggplot(data, aes(x = ph)) +
  geom_histogram(
    bins = 25,
    fill = "orange",
    color = "black"
  ) +
  labs(
    title = "Distribution of Soil pH",
    x = "pH",
    y = "Frequency"
  ) +
  theme_minimal()

ggsave(
  "D:/Data analysis/Project_4_R/images/Histogram_of_pH.png",
  width = 10,
  height = 6,
  dpi = 300
)



#Boxplots of All Numeric Variables
library(tidyr)

data_long <- pivot_longer(
  data,
  cols = n:rainfall,
  names_to = "Variable",
  values_to = "Value"
)

ggplot(data_long,
       aes(x = Variable,
           y = Value,
           fill = Variable)) +
  geom_boxplot() +
  labs(
    title = "Boxplots of Numeric Variables",
    x = "",
    y = "Value"
  ) +
  theme_minimal()


ggsave(
  "D:/Data analysis/Project_4_R/images/Boxplots.png",
  width = 10,
  height = 6,
  dpi = 300
)







