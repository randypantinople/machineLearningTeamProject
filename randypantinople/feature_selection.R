
library(dplyr)
library(ggplot2)
library(tidyverse)

setwd("C:/Users/randy/OneDrive/Desktop/randy/machineLearningTeamProject/randypantinople")

housing =read.csv('housingR.csv', stringsAsFactors = F )

#Preprocessing the data
housing$GarageYrBlt= NULL
housing$X = NULL
housing$pricePerSqft = NULL
housing$logSalePrice = NULL
housing$PID = NULL

housing$YrSold = NULL
housing$MoSold = NULL

#Change the kitchen quality t excellent and not excelllent
housing = housing %>% 
  mutate(KitchenQual = ifelse(KitchenQual=='Ex', 'ex', 'notEx'))

#Add a new column of difference of bedroom and bathroom
housing= housing %>% 
  mutate(bb_diff= abs(BedroomAbvGr - FullBath))


         


#Check the data
summary(housing)
dim(housing)
str(housing)


#Create an empty  and full model
#Sale price has been transformed to log
model.empty = lm(log(SalePrice) ~ 1, data = housing) #The model with an intercept ONLY.
model.full = lm(log(SalePrice) ~ ., data = housing) #The model with ALL variables.
scope = list(lower = formula(model.empty), upper = formula(model.full))


library(MASS) #The Modern Applied Statistics library.


#Run a step wise regression with BIC
forwardBIC = step(model.empty, scope, direction = "forward", k = log(2580))

Step:  AIC=-11055.9
log(SalePrice) ~ OverallQual + GrLivArea + Neighborhood + BsmtFinSF1 + 
  OverallCond + ageWhenSold + TotalBsmtSF + BldgType + GarageCars + 
  Fireplaces + SaleCondition + CentralAir + LotArea + Condition2 + 
  KitchenQual + BsmtExposure + YearRemodAdd + ScreenPorch + 
  MSZoning + Functional + BsmtFullBath + EnclosedPorch + HeatingQC + 
  PavedDrive + bb_diff + BsmtFinSF2

#Check the assumptions of multiple linear regression
library(car)
vif(forwardBIC)
plot(forwardBIC)



summary(forwardBIC)

exp(forwardBIC$coefficients)

#Summary
#OverallQual = An increase of overall quality rank, salePrice increases by 0.06%

#ageWhenSold = An increase of 1 year age, salePrice decreases by 0.002%

#Central Air= If the house has a central air, on average the salePrice
#increases by 0.06%

#Fireplace 0.02% for every inrease of car garage
#Garage 0.04% for an increase of 1

#On average, houses with excellent quality is 0.06% higher 
#saleprice than those that doesnt excellent kitchen
 #adjuated R2 = 0.9261
 
write.csv(housing, "housing2.csv")





