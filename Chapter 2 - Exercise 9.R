#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 2.4 - Exercise 9

setwd("C:/Users/l.piccolo/Desktop/REPO\ PERSONALE/introtostatlearning-withappinR")
Auto <- read.csv("Datasets/Auto.csv", header=T, sep=",", dec=".")
summary(Auto)
range(Auto$mpg)
mean(Auto$mpg)
sd(Auto$mpg)

subset <- Auto[-10:-85,]
range(subset$mpg)
mean(subset$mpg)
sd(subset$mpg)

pairs(Auto)
plot(as.factor(Auto$cylinders), Auto$mpg, xlab="Cylinders", ylab="mpg", title="Mpg per cylinders")