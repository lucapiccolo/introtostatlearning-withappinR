#Exercises from book "An introduction to statistical learning: with applications in R"
#Chapter 2.4 - Exercise 8

setwd("C:/Users/l.piccolo/Desktop/REPO PERSONALE/introtostatlearning-withappinR/Datasets")
college = read.csv("College.csv", header=T)
rownames(college) = college[,1]
college = college[,-1]
fix(college)
summary(college)

#visualize
pairs(college[,1:10])
plot(college$Private, college$Outstate, xlab="Private", ylab="Outstate")

#creation of new variable
Elite = rep("No", nrow(college))
Elite[college$Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)

#visualization
summary(college)
plot(college$Elite, college$Outstate, xlab="Elite", ylab="Outstate")
hist(college$Enroll, nclass=5)