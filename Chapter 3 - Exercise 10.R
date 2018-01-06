#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 3.7 - Exercise 10

library(ISLR) #Loads 'Carseats' dataset

#Fit multiple regression model to predict 'Sales' using 'Price', 'Urban' and 'US'
mod.fit <- lm(Sales~Price+Urban+US, data=Carseats)

#Provide interpretation of each coefficient
summary(mod.fit) #Sales are higher for: lower prices, shop in rural areas (low statistical significance), shop in the US

#Write out model in equation form
# Sales = x0 + x1*Price + x2*UrbanYes + x3*USYes

#For which of the predictors can you reject the null hypothesis?
summary(mod.fit) #Can only reject for Price and US

#Fit a smaller model
mod.fit2 <- lm(Sales~Price+US, data=Carseats)
summary(mod.fit2)

#How well do the models fit the data?
summary(mod.fit)$r.squared
summary(mod.fit2)$r.squared #very similar r squared
sigma(mod.fit)
sigma(mod.fit2) #smaller model has slightly lower RSE

#Get 95% CI for coefficients of smaller model
CI <- confint(mod.fit2, level=0.95)
Coeff <- summary(mod.fit2)$coeff
print(paste("Intercept (", Coeff[1,1], ") has 95% CI in [", CI[1,1], ";", CI[1,2], "]"))
print(paste("Price (", Coeff[2,1], ") has 95% CI in [", CI[2,1], ";", CI[2,2], "]"))
print(paste("USYes (", Coeff[3,1], ") has 95% CI in [", CI[3,1], ";", CI[3,2], "]"))

#Evidence of outliers or high leverage observations?
par(mfrow=c(2,2))
plot(mod.fit2) #Nothing special