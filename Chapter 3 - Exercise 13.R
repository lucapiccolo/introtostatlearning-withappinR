#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 3.7 - Exercise 13

set.seed(1)

#Use rnorm to create 100 samples from N(0,1)
x <- rnorm(100)

#Use rnorm to create 100 samples from N(0,0.25)
eps <- rnorm(100, sd=sqrt(0.25))

#Create vector Y = -1 + 0.5X + E. Length? Par values?
y <- -1+0.5*x+eps #Length:100. B0=-1, B1=0.5

#Create scatterplot and comment
plot(x,y) #the two are positively correlated
cor(x,y) #0.664

#Fit linear model and compare with theoretical param
lm.fit <- lm(y~x)
coefficients(summary(lm.fit)) #obtained coeff are close. P-values are small

#Draw regression line and population line
abline(lm.fit, col="red")
abline(a=-1, b=0.5, col="green")
legend(-1, legend=c("fitted line", "population line"), col=c("red", "green"), lwd=1)