#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 3.7 - Exercise 12

#Regression without an intercept: when are coefficients for y~x and x~y the same?
#When the sum of squares for the two variables are the same

#Generate example with n=100 where coeff are different
set.seed(1)
x <- rnorm(100)
y <- x^3
plot(x,y)
lm.fit1 <- lm(y~x+0)
lm.fit2 <- lm(x~y+0)
abline(lm.fit1)
coefficients(summary(lm.fit1)) #coeff: 2.409624
coefficients(summary(lm.fit2)) #coeff: 0.2771039

#Generate example with n=100 where coeff are the same
y <- sort(x)
plot(x,y)
lm.fit1 <- lm(y~x+0)
lm.fit2 <- lm(x~y+0)
abline(lm.fit1)
coefficients(summary(lm.fit1)) #coeff: -0.006457988
coefficients(summary(lm.fit2)) #coeff: -0.006457988