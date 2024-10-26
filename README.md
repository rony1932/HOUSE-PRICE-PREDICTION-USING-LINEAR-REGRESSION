# HOUSE-PRICE-PREDICTION-USING-LINEAR-REGRESSION
# Abstract
The main goal of this project is to develop a predictive model to predict the house price based on the different predictor variables including Average area income, House Age, Number of Rooms, Number of Bedrooms and area population using linear regression. After selecting the required predictors we are trying to create a model that effectively forecasts the price with the linear regression, however, it may not be the best model to predict but, mainly focuses on how the linear regression model works.
The stepwise regression technique in this model revealed that all the predictor variables such as Avg_Area_Income, House_Age Number_of_Rooms, Number_of_Bedrooms and Area_Population are the key predictors. However, Number_of_bedrooms have a weak relationship when compared to other predictor variables. The Model’s R-squared value and other diagnostics depict that the linear model covers the majority of the variance in price. The model predicts 91.64% of the variance in house price in both the initial model and the final model.

# INTRODUCTION
The housing market is really influenced by different factors. Accurate predictions of the house price is important in different areas such as analysis of the market, making policies, investments etc. This project mainly focuses on predicting the housing price using the technique called multiple linear regression model based on predictors such as Avg_Area_Income, House_Age Number_of_Rooms, Number_of_Bedrooms and Area_Population. This is done to gain insights into the primary factors that have an impact on housing prices and to assess the predictive capabilities of the model. Stepwise selection based on AIC is used to find the best or optimal subset of the predictor variables.

# METHODS
In general, analysis using regression, the main objective is to model the relationship between the response variable and independent variables. Independent variables may have on or more in each case.In my case the response variable is price and the predictor variables are Avg_Area_Income, House_Age Number_of_Rooms, Number_of_Bedrooms and Area_Population

# General theory 
Linear regression is a statistical method used to show the relationship between the response variable and predictor variable(s). Mainly the “linear” refers a relationship between those responses variable and predictor variable and we assume a straight-line.
The equation of a linear regression model can be expressed as:
Y=β0+β1X1+β2X2+⋯+βnXn+ϵ
Y represents  our dependent variable (price)
X1, X2..Xn is called the independent variables (Avg_Area_Income, House_Age etc..)
β0 is the intercept which will predict the value of Y when all the values of Xs are zero.
β1,β2…βn represents the slope for each of the predictors we choose. It gives the change in Y for one unit change in the predictor value by assuming other variables remain as constant.
ϵ called the error terms that show the variability that, the difference between the expected value and the observed value.
After we train the model with the historical data we can use it to predict the future price by giving the values for the predictor values. The assumptions of linear regression mainly include the linearity, independence, Homoscedasticity and normality of errors.
When using more than one variable as the predictor, multicollinearity may occur if two or more predictor variables have a correlation that is much higher with each other. In this scenario tools like VIF( Variance Inflation Factor)  are used to check the multicollinearity. The R2 value measures the extent or how well the model explains the variability. If the value is higher, it indicates a better fit. There are other metrics such as MSE (Mean Squared Error) and RMSE (Root Mean Squared Error) to assess the performance of the model.

# Dataset Overview.
My dataset consists of 5,000 rows and 6 Columns. The columns are
•	Price: The price of the house ( Target Variable).
•	Avg_Area_Income: Average income of the residents in that particular area.
•	House_Age: The age of the house.
•	Number_of_Rooms: The number of rooms in the house
•	Number_of_Bedrooms: The number of bedrooms in the house.
•	Area_Population: The population in the particular area


Author: Rony Thomas




