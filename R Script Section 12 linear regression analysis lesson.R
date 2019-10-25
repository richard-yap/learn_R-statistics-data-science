#---------------------The linear regression model----------------------------
#it is a linear approximation of a casual relationship 
#between two or more variables
#1. Get sample data
#2. Design a model that works for that sample (that explains the data)
#3. Make predictions for the whole population

#---------------------correlation vs regression--------------------------
#Corelation vs #regression
#relationship with one another\how one variable affects the other
#movement together\cause and effect
#xy = yx\one way
#single point\line

#---------------------geometrical interpretation-----------------------

#---------------------first regression in R-------------------------
library(psych)
college = read.csv("regression-example.csv")
college
describe(college)
#equation for linear regression -> y = b0 + b1*x1
#using the lm() function + 2 exact arguments 
#the args are the formula and the data R is going to work on

#our formula in this case is GPA as a function of SAT scores, 
#where SAT is the predictor and GPA the response
linmod = lm(GPA ~ SAT, data = college)

#next, plot your data
library(tidyverse)
ggplot(college, aes(SAT, GPA)) +
  geom_point() +
  theme_light() +
  labs(x = "SAT Scores",
       y = "GPA upon graduation",
       title = "SAT and GPA") +
  stat_smooth(method = "lm", se = FALSE) #to get the best fit line

#helps us to organise
summary(linmod)

#------------------interpreting the regression table------------------
#Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 0.2750403  0.4087394   0.673    0.503    
#SAT         0.0016557  0.0002212   7.487  7.2e-11 ***

#estimate and intercept value is the b0 (0.2750403)
#0.0016557 is b1
#y (GPA)= 0.275 + 0.0017*x1(SAT)

#----------------------------EXERCISE 30---------------------------------
library(tidyverse)
library(psych)

house = read.csv("real-estate-price-size-year-view.csv", stringsAsFactors = FALSE)
house = as_tibble(house)
house
describe(house)

#exploring whether size of house affects price of house
linmod_house = lm(price ~ size, data = house)
summary(linmod_house)

#plotting regression line
point <- format_format(big.mark = " ", decimal.mark = ",", scientific = FALSE)
ggplot(house, aes(price, size)) +
  geom_point() +
  theme_light() +
  labs(x = "Size of house",
       y = "Price of house",
       title = "Size and Price") +
  stat_smooth(method = "lm", se = FALSE) +
  scale_x_continuous(labels = point) + 
  scale_y_continuous(labels = point)

#------------------------EXERCISE 30 ANSWERS-----------------------------
### Load the libraries you will need 

library(tidyverse) 
library(psych) # good for descriptives, remember? 

# this is an additional library I have included (I want to show you something super useful :))
library(scales) # new package! we will use this to create a custom format when plotting the data

### Load the data as a tibble (readr has a function that does this directly)

data <- read.csv("real-estate-price-size-year-view.csv")

### Get the descriptives for your data so you can understand what you're dealing with a little better

describe(data) # get a sense of your data
summary(data) # get a sense of your data


### Explore the data and see if there are any interesting trends to consider

point <- format_format(big.mark = " ", decimal.mark = ",", scientific = FALSE) # this helps us get rid of the scientific notation in the graph
ggplot(data, aes(price, size)) + 
  geom_point() +
  theme_light() +
  labs(x = "House price (in USD)",
       y = "House size (in sq ft)",
       title = "House pricing and size") +
  scale_x_continuous(labels = point) + 
  scale_y_continuous(labels = point) # this is where we tell ggplot2 to use the format we set up above (point)

### Define the linear model 

linmod <- lm(price~size, data = data)

### Plot the regression line

ggplot(data, aes(price, size)) + 
  geom_point() +
  theme_light() +
  stat_smooth(method = "lm", se = FALSE) +
  labs(x = "House price (in USD)",
       y = "House size (in sq ft)",
       title = "House pricing and size") +
  scale_x_continuous(labels = point) + 
  scale_y_continuous(labels = point) # this is where we tell ggplot2 to use the format we set up above (point)


### Print the results of the model

summary(linmod)

### How many observations was the regression run on?

# 100. this is evident from the degrees of freedom (residual)
# degrees of freedom (residual) is calculated based on the sample size (n) minus the number of parameters (k) being estimated minus 1
# degrees of freedom (residual) = n - k - 1 
# 98 = n - 1 - 1 
# n = 100


### What is the R-squared of this regression? What does it tell you?

# Adjusted R-squared:  0.7421 - we only look at the adjusted R-squared because it is more reliabel.
# the adjusted R-squared increases only if the new term improves the model more than would be expected by chance
# it decreases when a predictor improves the model by less than expected by chance

# The value tells us that this regression model explains a big part of the variablity in the model (~75%)


### Determine if size is a statistically significant predictor of price. 

# Size is indeed a statistically significant predictor of price. This is evident from the p-value of the t-statistic.

### What is the regression equation associated with this regression model?

# y-hat = 101912.6 + 223.2*x1 

#--------------------------------------------------------------------------
#ANOVA frame work
# SST
#sum of squares total
#the sqaured differences differences between the observed 
#dependent variable and its mean. 
#You can think of this as the dispersion 
#of the observed variable around the mean.
#It is a measure of the total variability of the data set.
#T s s or.
#Total sum of squares.


# SSR
#sum of squares regression
#It is the sum of the differences between the predicted value and the 
#mean of the dependent variable.
#Think of it as a measure that describes how well your line fits the data.
#If this value of SSR is equal to the sum of squares total 
#It means that your regression model captures
#all the observed variability and it is perfect.
#or ESS (explained sum of squares)

# SSE
#sum of squares error
#The error is the difference between the observed value and the 
#predicted value.
#The smaller the error the better the estimation power of the regression.
#also known as r ss or residual sum of squares
#residual as in remaining or unexplained

#--------------------------------------------------------------------------
The total variability of the dataset is equal to the variability 
explained by the regression line plus
the unexplained variability known as error.
#--------------------------------------------------------------------------

#-----------------------------R SQUARED--------------------------------
#widely used measure that describes how powerful
#a regression is right

R squared it is equal to the variability explained by the regression 
divided by the total variability 
#R^2 = SSR/SST

It is a relative measure and takes values ranging from 0 to 1 an hour 
a the zero means your regression

line explains none of the variability of the data on our squared of 
1 would mean that your model explains the entire variability of the data.

What you usually observe is values ranging from 0 point to 2 0 point 9.

#-----------------------Conclusion---------------------------
The R squared measures the goodness of fit of your model.

The more factors you include in your regression the higher the r squared.

So should we include gender and income in our regression.




