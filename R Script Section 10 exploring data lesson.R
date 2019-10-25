#-------------------Exploratory data analysis------------------
#Population vs sample
#A random sample is collected when each member is by chance and representative

#------------------mean, median, mode-----------------
library(tidyverse)

ny = c(1,2,3,3,5,6,7,8,9,11,66)
la = c(1,2,3,4,5,6,7,8,9,10,11)

pizza = data_frame(ny, la)
pizza

mean(pizza$ny)
mean(pizza$la)

median(pizza$ny)

#mode
x = table(pizza$ny)
x
names(x)[which(x==max(x))]

summary(pizza)

#skewness indicates whether the observations in a data set are 
#concentrated on one side
col.1 = c(1,1,1,1,2,2,2,2,2,2,3,3,3,3,4,4,5,5,7)
col.2 = c(1,1,2,2,3,3,3,4,4,4,4,4,5,5,5,6,6,7,7)
col.3 = c(1,2,3,3,4,4,4,5,5,5,5,6,6,6,6,6,6,7,7)

df = data_frame(col.1, col.2, col.3)

summary(df)

pl.1 = ggplot(df, aes(x = col.1)) +
  geom_histogram(binwidth = 1, color = "white", fill = "red4") +
  theme_light() + labs(title = "Positive Skew")

pl.2 = ggplot(df, aes(x = col.2)) +
  geom_histogram(binwidth = 1, color = "white", fill = "red4") +
  theme_light() + labs(title = "Zero Skew")

pl.3 = ggplot(df, aes(x = col.3)) +
  geom_histogram(binwidth = 1, color = "white", fill = "red4") +
  theme_light() + labs(title = "Negative Skew")

pl.1
pl.2
pl.3

#skewness tells us alot about where the data is situated
#link between central tendency measures and probabitlity theory

#---------------------EXERCISE 25--------------------
skew.1 <- read.csv("skew-1.csv",
                   stringsAsFactors = FALSE)
skew.1 = as_tibble(skew.1)
skew.1

skew.2 <- read.csv("skew-2.csv",
                   stringsAsFactors = FALSE)
skew.2 = as_tibble(skew.2)
skew.2

skew.df = data_frame(skew.1, skew.2)
skew.df

summary(skew.df)

plskew.1 = ggplot(skew.1, aes(x = Dataset.1)) +
  geom_histogram(binwidth = 100, color = "darkslategray", 
                 fill = "red4", 
                 alpha = 0.5) +
  theme_light() + labs(title = "Skew 1")

plskew.2 = ggplot(skew.2, aes(x = Dataset.2)) +
  geom_histogram(binwidth = 100, color = "darkslategray", 
                 fill = "red4", 
                 alpha = 0.5) +
  theme_light() + labs(title = "Skew 2")

plskew.1
# The skew of this dataset is positive
plskew.2
# The skew of this dataset is negative

#-------------------------------------------------------
### Numerical examination of the skew 

install.packages("psych")
library(psych)

#doesn't work lol
describe(skew.1)
describe(skew.2)

# Note: sometimes, using a graph to identify the skew can be misleading.	
# The sk2 dataset has a relatively strong negative skew ( -0.33 ). 	
# However, from a histogram with a few bins, you cannot clearly determine the skew.	
# For best results, use a more precise measure of skewness, such as R's calculations, instead of a simple graph	


#-------------Variance, SD, Coefficient of variables-----------------
#used to describe individual variables not 
#interactions between variables

#Population variance formula and sample variance is different

#Variance measures the dispersion of a set of data points around their
#mean value

#------------------------------SD----------------------------------
#standard deviation is calculated by taking the square root of variance

#----------------coefficient of var/relative SD-----------------
#calculated by taking sd/mean

ny = c(1,2,3,3,5,6,7,8,9,11)
la = c(1,2,3,4,5,6,7,8,9,10)

pizza = data_frame(ny, la)
pizza$ny.mxn = c(18.81, 37.62, 56.43, 56.43, 94.05,
                 112.86, 131.67, 150.48, 169.29, 206.91)
pizza

#------------------------apply() function----------------------------
#sapply(...) function is great for running operations in a repetitive 
#way, from element to element

#such as...

lapply(list, function)
sapply(list, function)
#a wrapper to lapply(). applies the function you pass to every element 
#in a list 
#use on a data frame, get back a list

vapply(list, function, FUN.VALUE = type, ...)

mapply(function, ...)

rapply(list, function)

tapply(vector, index, function)

#-------------------------------------------------------------------
lapply(pizza, mean)
sapply(pizza, mean) #returns a data_frame

sapply(pizza, var)
sapply(pizza, sd)
coef.var = sapply(pizza, sd)/sapply(pizza, mean)
coef.var

#---------------------covariance and correlation----------------------
#finding out the relation between structure cost and land value
library(tidyverse)

homes = read.csv("landdata-states.csv", stringsAsFactors = FALSE)
homes = as_tibble(homes)

homes %>% subset(Date == 2001.25) %>% ggplot(aes(y = Structure.Cost,
                                                 x = log(Land.Value))) +
  geom_point() + theme_light() +
  labs(x = "Land Value (transformed)",
       y = "Structure Cost (USD)",
       title = "Relationhip betwwen land value and structure cost")

#---------------------------covariance-------------------------
#positive, zero or negative.
#it gives us a sense of the direction in which
#the two variables are moving

#correlation coefficient adjusts the covariance value
#standarises the covariance
#covariance/product of sd of the two variables

#--------------------to get the correlation coefficient----------------
#easy way:
#use the cor() function in-built in R stats package
cor(homes$Structure.Cost, homes$Land.Value)
cor.test(homes$Structure.Cost, homes$Land.Value)

#--------------practicing using H2 math question----------------
time = c(0.2, 0.4, 0.6, 0.8, 1.0)
radiation.intensity = c(3.22, 1.63, 0.89, 0.41, 0.36)

test = data_frame(time, radiation.intensity)
test
scatter.plot = ggplot(data = test, aes(x = time,
                                       y = radiation.intensity))
scatter.plot + geom_point(shape = 21, 
                          fill = "white", size = 3, stroke = 2) + 
  theme_minimal() + stat_smooth(se = FALSE) + 
  labs(x = "Time", y = "Radiation Intensity",
       title = "Relationship between time and the radiation intensity")

#calculating (product moment) correlation coefficient between time and
#ln(radiation.intensity):
radiation.intensity = c(3.22, 1.63, 0.89, 0.41, 0.36)
rad.mtrx = matrix(radiation.intensity, 5, 1)
ln.rad.mtrx = log(rad.mtrx, base = exp(1))

test$ln.radiation.intensity = ln.rad.mtrx
test
#Answer:
cor(time, ln.rad.mtrx)

#-----------------------------EXERCISE 26-----------------------------
#Load the "practical_product.csv" and "practical_customer.csv" data files 
#into R.

#Task 1: What are the types of data and the levels of measurement of the 
#following variables: Cust ID, Mortgage, Year of sale.

#Task 2: Create a histogram which represents the Price variable. Use the 
#default binwidth values first and then set bins of length $100,000. Use the 
#data on all apartments, no matter if sold or not.

#Task 3: Interpret the results.

#Task 4: Create a scatter plot showing the relationship between Price and Area.
#Use the data on all apartments, no matter if sold or not. Interpret the 
#results.

#Task 5: Calculate the mean, median, mode, skewness, and standard deviation 
#of Price for all apartments, no matter if sold or not.

#Task 6: Interpret the measures.

#Task 7: Calculate the correlation between Price and Area. Is the result 
#in line with the scatterplot?
  
#---------------------------------------------------------------------------
prac.product = read.csv("practical-product.csv", stringsAsFactors = FALSE)
prac.product = as_tibble(prac.product)  
prac.product

prac.customer = read.csv("practical-customer.csv", stringsAsFactors = FALSE)
prac.customer = as_tibble(prac.customer)
prac.customer

#TASK 1
summary(prac.customer)
summary(prac.product)
typeof(prac.customer$Customer.ID)
typeof(prac.customer$Mortgage)
typeof(prac.product$Year.of.sale)
#customer.id is a character, mortgage is a character, Year of sale is a integer

#TASK 1 ANSWERS
# Cust ID - Categorical/Nominal. This variable has the same properties as ID.
# Mortgage - Categorical/Nominal.	This is a Binary variable. 
#Like a Yes/No question or Gender.
# Year of sale - Numerical, discrete/Interval.	Year is a numerical variable. 
#It is always discrete. The level of measurement is questionable, 
#but we would treat it as interval, as the 0 year would be the time 
#when the Big Bang happened. The current BC-AD calendar was arbitrary chosen 
#(similarly to degrees Celsius and Fahrenheit).

#TASK 2
library(ggthemes)
hist <- ggplot(prac.product, aes(Price))
hist + geom_histogram(color = "darkslategray", binwidth = 100000,
                      fill = "darkseagreen2", alpha = 0.7) +
  labs(title = "House Prices Frequency Distribution",
       x = "Price", y = "Number of Houses") +
  theme_solarized_2(light = FALSE, base_size = 15, base_family = "serif")
  #scale_x_continuous(labels = comma) # this gets rid of the scientific notation on the x axis

#TASK 3
#Therefore the skew of this dataset is positive
#The two histograms point to similar insights - most of the apartment prices 
#are concentrated in the interval ($217,000 to 317,000)	

#TASK 4
task4 = ggplot(data = prac.product, aes(x = Area..ft..,
                                       y = Price))
task4 + geom_point(shape = 21, 
                          fill = "white", size = 3, stroke = 2) + 
  theme_minimal() + stat_smooth(se = FALSE) + 
  labs(x = "Area in Square Feet", y = "Price in USD",
       title = "Relationship between Area and the price of the property")
  
  #scale_y_continuous(labels = comma) # this gets rid of the scientific notation on the y axis

#Therefore the greater the area, the greater the price. 
#The graph shows that Area has a positive corelation to price.
#---------------------------------------------------------------
# The scatter plot shows a very strong linear relationship between Price and Area. This was to be expected as often Real Estate companies price their property per square foot.	
# Notice how for cheaper apartments (lower areas respectively), the points are closer so the variance is smaller. However, the bigger the apartment, the bigger the difference in the price.	


#TASK 5
mean(prac.product$Price)
median(prac.product$Price)
x = table(prac.product$Price)
x
names(x)[which(x==max(x))]
summary(prac.product$Price)

#TASK 5 ANSWERS
library(psych)

# either of these gives you a decent summary and the mean, median, skew, and standard deviation of the data of interest

describe(prac.product$Price)
summary(prac.product$Price)

# create a function that returns the mode
mode <- function(x){ 
  ta <- table(x)
  tam <- max(ta)
  if (all(ta == tam))
    mod <- NA
  else
    if(is.numeric(x))
      mod <- as.numeric(names(ta)[ta == tam])
  else
    mod <- names(ta)[ta == tam]
  return(mod)
}

mode(prac.product$Price)

#TASK 6
# We will only comment on the skew, as it is a bit tougher. 
# The skew is right (positive). This means that most aparments 
#are relatively cheap with a tiny portion that is more expensive.	

#TASK 7
cor(prac.product$Price, prac.product$Area..ft..)
cor.test(prac.product$Price, prac.product$Area..ft..)
# Yes, the result is in line with the scatter plot. 
#The two variables are strongly correlated.

