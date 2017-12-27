#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 3.6 - Lab: Linear Regression

library(MASS)
library(ISLR)
library(car)
names(Boston)
summary(Boston)

#Simple linear regression
plot(Boston$lstat, Boston$medv, xlab="Lower status of the population (percent)", ylab="Median value of the owner-occupied homes")
cor(Boston$lstat, Boston$medv)
lm.fit = lm(medv~lstat, data=Boston)
lm.fit
summary(lm.fit)
names(lm.fit)
coef(lm.fit)
confint(lm.fit)

predict(lm.fit, data.frame(lstat=c(5,10,15)), interval="confidence")
predict(lm.fit, data.frame(lstat=c(5,10,15)), interval="prediction")
plot(Boston$lstat, Boston$medv, xlab="Lower status of the population (percent)", ylab="Median value of the owner-occupied homes")
abline(coef(lm.fit), lwd=3, col="red", pch="+")
par(mfrow=c(2,2))
plot(lm.fit)

par(mfrow=c(1,1))
plot(predict(lm.fit), residuals(lm.fit))
abline(0,0)

plot(predict(lm.fit), rstudent(lm.fit))
abline(0,0)

plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

#Multiple linear regression
lm.fit = lm(medv~lstat+age, data=Boston)
summary(lm.fit)
lm.fit = lm(medv~., data=Boston)
summary(lm.fit)

?summary.lm
summary(lm.fit)$r.squared
summary(lm.fit)$sigma