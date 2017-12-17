#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 2.3 - Lab: Introduction to R

#create vectors
x <- c(1,3,2,5)
x
x = c(1,6,2)
y = c(1,4,3)
y
#sum vectors
length(x)
length(y)
x+y
#explore variables
ls()
rm(x,y)
ls()
rm(list=ls())
#working with a matrix
x = matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x
matrix(data=c(1,2,3,4), nrow=2, ncol=2, byrow=TRUE)
sqrt(x)
x^2
#working with normal variables
x=rnorm(50)
y = x + rnorm(50, mean=50, sd=.2)
cor(x,y)
set.seed(1303)
rnorm(50)
#summary statistics
set.seed(3)
y = rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)
#plotting data
x = rnorm(100)
y = rnorm(100)
pdf("Figure.pdf")
plot(x,y,main="Testing plots", xlab="x axis", ylab="y axis")
plot(x,y)
dev.off()
#creating sequences
x = seq(1,10)
x
x = 1:10
x
x = seq(-pi,pi,length=50)
x
#contour plots
y = x
f = outer(x,y,function(x,y) cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45)
fa = (f - t(f))/2
contour(x,y,fa,nlevels=15)
#complex graphs
image(x,y,fa)
persp(x,y,fa,theta=30,phi=20)
#indexing data
A = matrix(1:16,4,4)
A[2,3]
A[c(1,3), c(2,4)]
A[1:3, 2:4]
A[1:2,]
A[1,]
A[-c(1,3),]
dim(A)
#loading data
setwd("C:/Users/l.piccolo/Desktop/REPO\ PERSONALE/introtostatlearning-withappinR/Datasets")
getwd()
Auto = read.table("Auto.data")
fix(Auto)
Auto = read.table("Auto.data", header=T, na.strings="?")
fix(Auto)
dim(Auto)
names(Auto)
#additional graphical and numerical summaries
plot(Auto$cylinders, Auto$mpg)
attach(Auto)
plot(cylinders, mpg)
plot(as.factor(cylinders), mpg, col="red", varwidth=T, xlab="cylinders", ylab="mpg")
hist(mpg, col="red", breaks=15)
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower, mpg)
identify(horsepower, mpg, name)
summary(Auto)
summary(mpg)