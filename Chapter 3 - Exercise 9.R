#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 3.7 - Exercise 9

setwd("C:/Users/l.piccolo/Desktop/REPO PERSONALE/introtostatlearning-withappinR")
Auto <- read.csv("Datasets/Auto.csv")
fix(Auto)

#Produce scatterplot matrix with all variables
pairs(Auto)

#Compute matrix of correlations, excluding 'name' variable
attach(Auto)
AutoNoName <- Auto[,-9]
AutoNoName[,4] <- as.numeric(AutoNoName[,4])
cor(AutoNoName)

#Perform multiple linear regression with 'mpg' as response and all variables except 'name' as predictors
AutoForReg <- Auto
AutoForReg[,4] <- as.numeric(AutoForReg[,4])
mod <- lm(mpg~.-name, data=AutoForReg)
summary(mod)

#Is there an association?
summary(mod)$fstatistic[1] #yes, high F-statistic

#Which predictors have statistically significant relationship with response?
sort(coef(summary(mod))[,4]) < 0.01 #year, weight and origin

#What does coefficient of 'year' suggest?
coef(summary(mod))[7,] #statistically significant that mpgs increased over years
plot(Auto$year, Auto$mpg, main="MPGs over years", xlab="Year", ylab="Mpg")
tempLine <- lm(mpg~year, data=Auto)
abline(tempLine)

#Produce diagnostic plots
par(mfrow=c(2,2))
plot(mod)
AutoC <- AutoForReg[-14,] #Removing one big residual with high leverage
mod2 <- lm(mpg~.-name, data=AutoC)
plot(mod2) #Residuals grow bigger as fitted values increase

#Try interaction effects
pairs(Auto)
mod3 <- lm(mpg~.-name+weight:displacement, data=AutoC)
summary(mod3)
mod4 <- lm(mpg~.-name+year:displacement, data=AutoC)
summary(mod4)

#Try nonlinear transformation of predictors
mod5 <- lm(mpg~.-name-displacement-cylinders+I(horsepower^2)+sqrt(weight), data=AutoC)
summary(mod5)
plot(mod5)

#Bonus: test trasforming response
AutoNonLin <- AutoForReg
AutoNonLin[,1] <- sqrt(AutoNonLin[,1])
names(AutoNonLin)
mod6 <- lm(mpg~.-name-displacement-cylinders+I(horsepower^2)+sqrt(weight), data=AutoNonLin)
plot(mod6)
summary(mod6) #Increased R-squared