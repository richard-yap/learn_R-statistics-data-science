#---------------------Inferential statistics--------------------
#distributions
#A distribution is a function that shows the possible values 
#for a variable and how often they occur

#a normal distribution graph is one that is symmetrical at the center
#most of the data points are in the center

#z-score/standardized variable = (original variable - mean)/ sd

#z-score can let you check the probability of getting that score using the 
#probability table

#---------------standard error and confidence intervals--------------
#we usually use sample data to predict the population sample data
#since population data is very hard to gather
#but how do we calculate how far off we are from the population data?

#--------------------------Hypothesis testing---------------------------
#six steps in data-driven decision-making
#1. Based on an observation, define a research question 
#2. explain your obsevation by generating a theory
#3. Formulate a hypothesis based on your theory
#4. find a correct test for your hypothesis
#5. execute that test
#6. make a decision

#alternative and null hypothesis H1 and H0

#-----------------------type 1 and type 2 errors------------------------
#type 1 error
#the null hypothesis was true but you rejected it (denoted alpha)
#type 2 error
#accepting the type null (you accepted a false null hypothesis) (denoted beta)

#---------------------------Test for the mean---------------------------
sal = read.csv("ztest-a.csv", stringsAsFactors = FALSE)
sal
summary(sal)

#creating a function to get the z-score
#mu is the hypothesis value
z.test = function(a, mu, sd){
  zeta = (mean(a) - mu) / (sd/sqrt(length(a)))
  return(zeta)
}

#getting a z-score
z.test(a = sal$salary, mu = 113000, sd = 15000)

#---------------------EXERCISE 27----------------------
# Using the data from the lesson, test the null hypothesis at 10% significance

# sample mean: $100,200
# population sd: $15,000
# standard error: $2,739
# sample size: 30
# z-score: -4.67 
# H0 (Glassdoor data): $113,000
# two-sided test

sal <- read.csv("ztest-a.csv")
summary(sal)

z.test <- function(a, mu, sd){
  zeta <- (mean(a) - mu) / (sd/sqrt(length(a)))
  return(zeta)
}

z-test(a = sal$salary, mu = 113000, sd = 15000)

# Z = 4.67
# z = 1.65 (fromt the z-table)
# alpha = 0.05 (two-sided test)

# 4.67 > 1.65 
# therefore, the null is rejected

# Note: we already rejected the null in the lesson at a 
#lower significance level, so, in practice, this test is unnecessary

#--------------------------------p-value-----------------------------------
#p < a reject null hypothesis

#---------------------test for the mean pop var unknown------------------------
library(psych)
rate = read.csv("ttest-a.csv", stringsAsFactors = FALSE)
rate
describe(rate)

#creating a function to obtain the t-score
my.t.test = function(a, hmean){
  t = (mean(a) - hmean) / (sd(a)/sqrt(length(a)))
  return(t)
}

my.t.test(rate$Open.rate, 0.4)

#------------------------------EXERCISE 28---------------------------------
# What if the question was: is the competitor open rate EXACTLY 40%. What would be the decision then?

# 1. Test at 5% significance. Comment on the decision with the appropriate statistical jargon.
# 2. Test at 1% significance. Comment on the decision with the appropriate statistical jargon.

# Hint: Think about what type of test would be suitable here (one- or two-sided).

library(psych)

rate <- read.csv("ttest-a.csv") # load your data
describe(rate) # understand your data

my.t.test <- function(a, hmean){
  t <- (mean(a) - hmean)/(sd(a)/sqrt(length(a)))
  return(t) # create the test
}

my.t.test(rate$Open.rate, 0.4)

# H0 = open rate is NOT 40%
# H1 = open rate is 40%
# The problem is a two-sided test
# T = 0.53
# t1 = 2.26 Accept the null. At the 5% significance level we cannot say that the competitor's open rate is 40%
# t2 = 3.25 Accept the null. The test on that sample shows that at 1% significance, our competitor's open rate is not 40%.

#-----------------------------comparing 2 means------------------------------
install.packages("pastecs")
library("pastecs")
library("psych")
magn = read.csv("dependent-samples.csv", stringsAsFactors = FALSE)
magn
describe(magn)

#using the t.test function in R to get the t-score easily:
dep.t.test = t.test(magn$Before, magn$After, paired = TRUE, alternative = "less")
                    #tells R that the variables are dependent
                    #alternative set to 1 tells R to run a 1-tailed test.
                    #default is run a 2 tailed test)
dep.t.test

#to know that our assumptions are correct
stat.desc(magn)#from the pastecs package
describe(magn)

#--------------------------EXERCISE 29----------------------------
# A health guru on the internet designed a weight-loss program. 
# You are wondering if it is working. You are given a sample of some people who did the program. 
# You can find the data in kg if you prefer working with kg as a unit of measurement.

# State the null hypothesis.
# Calculate the appropriate statistic
# Decide if this is a one-sided or a two-sided test. What is the p-value?
# Based on the p-value, decide at 1%,5% and 10% significance, if the program is working. Comment using the appropriate statistical jargon.

library(pastecs)
library(psych)

weight <- read.csv("weight-data-exercise-kg.csv")
describe(weight)

dep.t.test2 <- t.test(weight$before, weight$after, paired = TRUE, alternative = "greater")
dep.t.test2

# H0: The difference between the before and the after conditions is less than or equal to 0
# t = 2.01
# The test is one-sided. We want to know if people are actually losing weight. p = 0.038
# At 1% significance we accept the null hypothesis. The data shows that the program is not working.
# At 5% significance, we reject the null hypothesis. Therefore, the program is successful.
# At 10% significance, there is enoug statistical evidence that the program is working.

#----------------------INDEPENDENT SAMPLES---------------------
library(tidyverse)

grades = read.csv("independent-samples.csv")
grades
grades = gather(grades, Engineering, Management,
                key = "course",
                value = "grades")
grades

#doing a 2-tailed t-test for independent samples
ind.t.test = t.test(grades ~ course, data = grades, mu = -4)
ind.t.test
#if you want to not run the t-test with the adjustment, set var.equal = TRUE,
#does not run the welch t-test