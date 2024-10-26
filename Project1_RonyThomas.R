# Set working directory
setwd("C:/Users/ronyt/OneDrive/Desktop/Predictive/multivariate/project")

# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)
library(corrplot)
library(caret)
library(car)
library(caTools)

# Load the dataset
house_data <- read_csv("House_price.csv")

# Data Cleaning and Preprocessing

# 1. Check for missing values in the dataset
missing_values <- sapply(house_data, function(x) sum(is.na(x)))
cat("Missing values in each column:\n")
print(missing_values)

# Handle missing values (Example: Remove rows with missing data, adjust if needed)
house_data <- na.omit(house_data)  # Remove rows with missing data

# 2. Check for duplicates
duplicates <- house_data[duplicated(house_data), ]
cat("Number of duplicate rows:", nrow(duplicates), "\n")

# Remove duplicates if any
house_data <- house_data[!duplicated(house_data), ]

# View the structure of the cleaned dataset
str(house_data)

# View summary of the cleaned dataset
summary(house_data)

# 1. Correlation Analysis
# Calculate correlation matrix for predictors and target variable
cor_matrix <- house_data %>%
  select(Price, Avg_Area_Income, House_Age, Number_of_Rooms, Number_of_Bedrooms, Area_Population) %>%
  cor()

# Print the correlation matrix
print(cor_matrix)
print(round(cor_matrix, 2))

# Display the correlation matrix using corrplot
corrplot(cor_matrix, method = "color", type = "upper", 
         tl.col = "black", tl.srt = 45, addCoef.col = "black", 
         title = "Correlation Matrix", mar = c(0, 0, 2, 0))

# 2. Train-Test Split (70% Train, 30% Test)
set.seed(123)  # For reproducibility
split <- sample.split(house_data$Price, SplitRatio = 0.7)

train_data <- subset(house_data, split == TRUE)
test_data <- subset(house_data, split == FALSE)

# 3. Fit the Initial Full Linear Regression Model
full_model <- lm(Price ~ Avg_Area_Income + House_Age + Number_of_Rooms + Number_of_Bedrooms + Area_Population, data = train_data)

# View the summary of the full model
summary(full_model)

# Variance Inflation Factor (VIF) to check for multicollinearity
vif(full_model)

# 4. Diagnostics and Assumption Checking

# Residual vs Fitted plot to check for linearity and homoscedasticity
plot(full_model$fitted.values, residuals(full_model), 
     xlab = "Fitted Values", 
     ylab = "Residuals", 
     main = "Residuals vs Fitted")
abline(h = 0, col = "red", lty = 2)

# Q-Q plot to check normality of residuals
qqnorm(residuals(full_model))
qqline(residuals(full_model), col = "red")

# Histogram of residuals to check distribution
hist(residuals(full_model), breaks = 30, main = "Histogram of Residuals", col = "lightblue")

# 5. Stepwise Selection Based on AIC
final_model <- step(full_model, direction = "both")

# View the summary of the selected stepwise model
summary(final_model)

# 6. Model Evaluation

# Predict Price using the final model on test data
predictions <- predict(final_model, newdata = test_data)

# Compare predictions to actual prices
comparison <- data.frame(Actual = test_data$Price, Predicted = predictions)
head(comparison)

# Calculate Mean Squared Error (MSE), Mean Absolute Error (MAE), and Root Mean Squared Error (RMSE)
mse <- mean((test_data$Price - predictions)^2)
mae <- mean(abs(test_data$Price - predictions))
rmse <- sqrt(mse)
r_squared <- summary(final_model)$r.squared
adjusted_r_squared <- summary(final_model)$adj.r.squared


# Print evaluation metrics
cat("MSE:", mse, "\n")
cat("MAE:", mae, "\n")
cat("RMSE:", rmse, "\n")
cat("R-squared:", r_squared, "\n")
cat("Adjusted R-squared:", adjusted_r_squared, "\n")

# Plot Actual vs Predicted Prices.
ggplot(comparison, aes(x = Actual, y = Predicted)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
  ggtitle("Actual vs Predicted Prices") +
  xlab("Actual Prices") +
  ylab("Predicted Prices") +
  theme_minimal()
