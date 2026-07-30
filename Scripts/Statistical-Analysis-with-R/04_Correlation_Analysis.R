#Importing Data
data <- read.csv("D:/Data analysis/Project_4_R/Data/Crop_recommendation.csv")
head(data)






###############Correlation Analysis #####################


#Create a numeric Dataset 
numeric_data <- data %>%
  select(where(is.numeric))

head(numeric_data)

#Compute the Pearson Correlation Matrix
cor_matrix <- cor(numeric_data, method = "pearson")

round(cor_matrix, 2)



#Visualize the Correlation Matrix
library(corrplot)

corrplot(
  cor_matrix,
  method = "color",
  type = "upper",
  addCoef.col = "black",
  tl.col = "black",
  tl.srt = 45,
  number.cex = 0.7
)


png("D:/Data analysis/Project_4_R/images/correlation_heatmap.png",
    width = 1200,
    height = 900,
    res = 150)

corrplot(
  cor_matrix,
  method = "color",
  type = "upper",
  addCoef.col = "black",
  tl.col = "black",
  tl.srt = 45,
  number.cex = 0.7
)

dev.off()



#Pair Plot 
library(GGally)

ggpairs(
  numeric_data,
  title = "Pairwise Relationships Among Numeric Variables"
)

ggsave(
  "D:/Data analysis/Project_4_R/images/Pairwise_Relationships_Among_Numeric_Variables.png",
  width = 10,
  height = 6,
  dpi = 300
)






###### Scatter Plots with Regression lines#########

#Temperature vs Rainfall
ggplot(data, aes(x = temperature, y = rainfall)) +
  geom_point(color = "steelblue", alpha = 0.7) +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(
    title = "Temperature vs Rainfall",
    x = "Temperature (°C)",
    y = "Rainfall (mm)"
  ) +
  theme_minimal()

ggsave(
  "D:/Data analysis/Project_4_R/images/Temp_vs_Rainfall.png",
  width = 10,
  height = 6,
  dpi = 300
)


#Temperature vs Humidity
ggplot(data, aes(x = temperature, y = humidity)) +
  geom_point(color = "darkgreen", alpha = 0.7) +
  geom_smooth(method = "lm", color = "red") +
  labs(
    title = "Temperature vs Humidity",
    x = "Temperature (°C)",
    y = "Humidity (%)"
  ) +
  theme_minimal()

ggsave(
  "D:/Data analysis/Project_4_R/images/Temp_vs_Humidity.png",
  width = 10,
  height = 6,
  dpi = 300
)

#pH vs Rainfall
ggplot(data, aes(x = ph, y = rainfall)) +
  geom_point(color = "purple", alpha = 0.7) +
  geom_smooth(method = "lm", color = "red") +
  labs(
    title = "Soil pH vs Rainfall",
    x = "Soil pH",
    y = "Rainfall (mm)"
  ) +
  theme_minimal()

ggsave(
  "D:/Data analysis/Project_4_R/images/pH_vs_Rainfall.png",
  width = 10,
  height = 6,
  dpi = 300
)



#####Correlation Significance Test############

library(Hmisc)

cor_results <- rcorr(as.matrix(numeric_data))

cor_results$r    # Correlation coefficients

cor_results$P    # p-values




#Identifying strong Correlations 
cor_df <- as.data.frame(as.table(cor_matrix))

strong_cor <- subset(
  cor_df,
  abs(Freq) > 0.70 & Var1 != Var2
)

strong_cor