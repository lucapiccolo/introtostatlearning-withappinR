#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 3.7 - Exercise 11

set.seed(1)
x = rnorm(100)
y = 2*x+rnorm(100)
plot(x,y)

#Perform linear regression without intercept of y onto x
lm.fit <- lm(y~x+0)
abline(lm.fit)
summary(lm.fit) #est: 1.9939, stderr: 0.1065, t: 18.73, pval: <2e-16
#Strong evidence of relation (about 2 increase in y for each increase in x)

#Perform linear regression without intercept of x onto y
lm.fit.inv <- lm(x~y+0)
plot(y,x)
abline(lm.fit.inv)
summary(lm.fit.inv) #est: 0.39111, stderr: 0.02089, t: 18.73, pval: <2e-16
#Strong evidence of relation (about 0,4 increase in x for each increase in y)

#What is the relationship?
#The normal component (y = 2*x+norm) is such that est1 != 1/est2

#Show that, for regression y~x and x~y, the t-statistic for the coeff. of the variable is the same
lm.fit1 <- lm(y~x)
lm.fit2 <- lm(x~y)
coefficients(summary(lm.fit1))
coefficients(summary(lm.fit2)) #t-statistic is the same