# machineLearningTeamProject

This project is intended to help house developers/flippers identify features significant when predicting house prices in Ames, Iowa.
The data has 2580 observations (homes) and 81 columns (features) including sale price as the response variable.

We used a variety of strategies to impute missing values.

When conducting data analysis we created a new column, price per square foot, derived from dividing the sale price and the gross living area. 
Price per square foot is more effective than sale price for gauging response to a house feature or combination of features.

We used the following machine learning models to predict sale price:
1. Stepwise Regression using Bayesian Information Criterion
2. Lasso with GridSearchCV
3. Ridge with GridSearchCV
4. Random Forest with GridSearchCV

Finally, recommendations were made after testing model performance.

Randy, Jay, Greg, Minjae

