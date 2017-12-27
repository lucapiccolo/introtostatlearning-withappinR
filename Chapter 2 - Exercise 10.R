#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 2.4 - Exercise 10

library(MASS)
?Boston
summary(Boston)
pairs(Boston)
colN <- dim(Boston)[2]
colVec <- c(1:colN)
crimCorrVec <- cov2cor(cov(Boston))[,1]
crimCorrVec <- sort(crimCorrVec, decreasing=TRUE)
crimCorrVec #rad, tax and lstat are positively correlated, while dis, black and medv are inversely correlated

highCrimRates <- sort(Boston$crim, decreasing=TRUE, index.return=TRUE)
topCrime <- matrix(c(highCrimRates$ix[1:10], highCrimRates$x[1:10]), nrow=10, ncol=2)
topCrime

highTaxRates <- sort(Boston$tax, decreasing=TRUE, index.return=TRUE)
topTax <- matrix(c(highTaxRates$ix[1:10], highTaxRates$x[1:10]), nrow=10, ncol=2)
topTax

sum(Boston$chas)
charlesIndex <- which(Boston$chas == 1)
charlesIndex

median(Boston$ptratio)

minMedv <- min(Boston$medv)
indexMinMedv <- which(Boston$medv == minMedv)
Boston[indexMinMedv,]

moreThanSeven <- sum(Boston$rm > 7)
moreThanSeven
moreThanEight <- sum(Boston$rm > 8)
moreThanEight

inMoreThanEight <- which(Boston$rm > 8)
BostMoreThanEight <- Boston[inMoreThanEight,]
summary(Boston)
summary(BostMoreThanEight)