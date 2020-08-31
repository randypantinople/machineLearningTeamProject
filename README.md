# machineLearningTeamProject

This project is intended to help house developers/flippers identify house features that are significant in predicting house prices in Ames, Iowa.
The data has 2580 observations and 81 columns including the sale price as the response variables.

We used different strategies to impute missing values.

When conducting data analysis we created a new column price per square foot  derived from sale price and gross living area. 
This is the cheaper way of gauging how price per square foot react to a house feature or a combination of two.

We used the following machine learning models to predict sale price:
a. stepwise regression using Bayesian Information Criterion
b. Lasso with GridSearchCV
c. Ridge with GridSearchCV
d. Random Forest with GridSearchCV

Finally, recommendations wer made after testing the performance of our models.

Randy, Jay, Greg, Minjae
