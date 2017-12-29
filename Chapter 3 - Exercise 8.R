#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 3.7 - Exercise 8

setwd("C:/Users/l.piccolo/Desktop/REPO PERSONALE/introtostatlearning-withappinR")
Auto <- read.csv("Datasets/Auto.csv")
summary(Auto)

Auto$horsepower = as.integer(Auto$horsepower)
fitLm = lm(mpg~horsepower, data=Auto)
summary(fitLm)
plot(as.integer(Auto$horsepower), as.integer(Auto$mpg),
     main="Mpg over horsepower", xlab="Horsepower", ylab="Mpg")
abline(fitLm)

#Is there a relationship between predictor and response?
summary(fitLm) #yes (small p-value)

#How strong is the relationship between predictor and response? Is it positive or negative?
coeffMat <- coef(summary(fitLm))
lowerBound <- coeffMat[2,1] - coeffMat[2,2]
upperBound <- coeffMat[2,1] + coeffMat[2,2]
print(paste("Effect between ", as.character(lowerBound), " and ", as.character(upperBound),
            ". Relation is positive."))

#What is the predicted mpg associated with horsepower of 98? What are the associated CI and PI?
#Plot response, predictor and regression line
summary(fitLm)
predValue <- predict(fitLm, data.frame(horsepower = c(98)))
plot(as.integer(Auto$horsepower), as.integer(Auto$mpg),
     main="Mpg over horsepower", xlab="Horsepower", ylab="Mpg")
abline(fitLm)
points(98,predValue, col="red", pch=23)

predValCI <- predict(fitLm, data.frame(horsepower=c(98)), interval="confidence")
predValCI
predValPI <- predict(fitLm, data.frame(horsepower=c(98)), interval="prediction")
predValPI
abline(predValCI[1,2], 0, col="red")
abline(predValCI[1,3], 0, col="red")
abline(predValPI[1,2], 0, col="blue")
abline(predValPI[1,3], 0, col="blue")

#Plot diagnostic plots of least squares regression fit
par(mfrow=c(2,2))
plot(fitLm) #clear pattern in residuals in response range [20;26]: linear model is not ok